from flask import Blueprint, render_template, request, session

from Cornerstone.routes.datastax.cornerstone.rest import get_session

ticker_api = Blueprint('ticker_api', __name__)

cassandra_session = None
prepared_statements = None


def preflight_check():
    global cassandra_session, prepared_statements
    if not cassandra_session:
        cassandra_session = get_session()

    prepared_statements = {}
    prepared_statements['get_user'] = cassandra_session.prepare('''
        SELECT * FROM ticker.user
        WHERE email_address = ?
    ''')
    prepared_statements['update_user'] = cassandra_session.prepare('''
        INSERT INTO ticker.user
            (email_address, risk_tolerance,
            preferred_investment_types, retirement_age, withdrawal_year)
        VALUES
            (?, ?, ?, ?, ?)
    ''')


@ticker_api.route('/')
def index():
    return render_template('datastax/ticker/index.jinja2')


@ticker_api.route('/login', methods=['POST'])
def login():
    session['email_address'] = request.form.get('email_address')
    return render_template('datastax/ticker/orbeus.jinja2')


@ticker_api.route('/disclaimer')
def disclaimer():
    return render_template('datastax/ticker/disclaimer.jinja2')


@ticker_api.route('/dash')
def dash():
    return render_template('datastax/ticker/dash.jinja2')


@ticker_api.route('/search', methods=['GET', 'POST'])
def search():
    return render_template('datastax/ticker/search.jinja2')


@ticker_api.route('/customize')
def customize():
    preflight_check()
    user_profile = cassandra_session.execute(prepared_statements['get_user'].bind((session['email_address'],)))
    if user_profile:
        user_profile = dict(user_profile[0])
    return render_template('datastax/ticker/customize.jinja2', user_profile=user_profile)


@ticker_api.route('/portfolio', methods=['GET', 'POST'])
def portfolio():
    return render_template('datastax/ticker/portfolio.jinja2',
                           crumb='portfolio')


@ticker_api.route('/transactions')
def transactions():
    return render_template('datastax/ticker/transactions.jinja2',
                           crumb='transactions')


@ticker_api.route('/recommendations', methods=['GET', 'POST'])
def recommendations():
    preflight_check()
    if request.method == 'POST':
        values = {
            'email_address': session['email_address'],
            'risk_tolerance': request.form.get('risk_tolerance'),
            'preferred_investment_types': [],
            'retirement_age': request.form.get('retirement_age'),
            'withdrawal_year': request.form.get('withdrawal_year'),
        }

        for key in request.form:
            if 'preferred_investment_types' in key:
                values['preferred_investment_types'].append(key.split(':')[1])

        cassandra_session.execute(prepared_statements['update_user'].bind(values))

    return render_template('datastax/ticker/recommendations.jinja2',
                           crumb='recommendations')
