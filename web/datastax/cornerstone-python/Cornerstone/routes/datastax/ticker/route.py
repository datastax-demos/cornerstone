import time
from decimal import Decimal

from flask import Blueprint, render_template, request, session, jsonify

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

    prepared_statements['get_history'] = cassandra_session.prepare('''
        SELECT * FROM ticker.history
        WHERE email_address = ?
    ''')
    prepared_statements['update_history'] = cassandra_session.prepare('''
        INSERT INTO ticker.history
            (email_address, date, buy, exchange, symbol, name, price, quantity)
        VALUES
            (?, ?, ?, ?, ?, ?, ?, ?)
    ''')

    prepared_statements['get_portfolio'] = cassandra_session.prepare('''
        SELECT * FROM ticker.portfolio
        WHERE email_address = ?
    ''')
    prepared_statements['update_portfolio'] = cassandra_session.prepare('''
        INSERT INTO ticker.portfolio
            (email_address, exchange, symbol, date, name, buy, price, quantity)
        VALUES
            (?, ?, ?, ?, ?, ?, ?, ?)
    ''')


@ticker_api.route('/')
def index():
    return render_template('datastax/ticker/index.jinja2')


@ticker_api.route('/login', methods=['POST'])
def login():
    session['email_address'] = request.form.get('email_address')

    '''
    GENERATE SEED DATA FOR THIS ACCOUNT!
    '''

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
    preflight_check()
    values = {
        'email_address': session['email_address']
    }
    user_history = cassandra_session.execute(prepared_statements['get_portfolio'].bind(values))

    results = []
    current_record = None
    for row in user_history:
        if current_record and current_record['symbol'] != row['symbol']:
            results.append(current_record)
            current_record = None
        if not current_record:
            current_record = {
                'exchange': row['exchange'],
                'symbol': row['symbol'],
                'name': row['name'],
                'quantity': 0,
                'balance': 0,
                'cost': 0,
                'last_trade': row['price']
            }
        if row['buy']:
            current_record['quantity'] += row['quantity']
            current_record['balance'] -= row['quantity'] * row['price']
            current_record['cost'] += row['quantity'] * row['price']
        else:
            current_record['quantity'] -= row['quantity']
            current_record['balance'] += row['quantity'] * row['price']
    results.append(current_record)

    return render_template('datastax/ticker/portfolio.jinja2',
                           crumb='portfolio',
                           results=results)


@ticker_api.route('/transactions')
def transactions():
    preflight_check()
    values = {
        'email_address': session['email_address']
    }
    user_history = cassandra_session.execute(prepared_statements['get_history'].bind(values))

    results = []
    for row in user_history:
        results.append(dict(row))
    return render_template('datastax/ticker/transactions.jinja2',
                           crumb='transactions',
                           results=results)


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

def buy_string_to_bool(string):
    return string.lower() in ('yes', 'true', 't', '1', 'buy')

@ticker_api.route('/buy', methods=['POST'])
def buy():
    preflight_check()
    values = {
        'email_address': session['email_address'],
        'date': request.form.get('date') if request.form.get('date') else time.time() * 1000,
        'buy': buy_string_to_bool(request.form.get('buy')),
        'exchange': request.form.get('exchange'),
        'symbol': request.form.get('symbol'),
        'name': request.form.get('name'),
        'price': Decimal(request.form.get('price')),
        'quantity': Decimal(request.form.get('quantity')),
    }
    cassandra_session.execute(prepared_statements['update_history'].bind(values))
    cassandra_session.execute(prepared_statements['update_portfolio'].bind(values))
    return jsonify({'status': 'ok'})
