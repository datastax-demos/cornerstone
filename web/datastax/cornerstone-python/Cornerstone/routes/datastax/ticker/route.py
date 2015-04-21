from flask import Blueprint, render_template

ticker_api = Blueprint('ticker_api', __name__)


@ticker_api.route('/')
def index():
    return render_template('datastax/ticker/index.jinja2')

@ticker_api.route('/login', methods=['POST'])
def login():
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
    return render_template('datastax/ticker/customize.jinja2')

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
    return render_template('datastax/ticker/recommendations.jinja2',
                           crumb='recommendations')
