#!/usr/bin/env python

import csv
from cassandra.cluster import Cluster
from cassandra.query import ordered_dict_factory

import time
import uuid

ip_addresses = ['127.0.0.1']
cluster = Cluster(ip_addresses)
session = cluster.connect()
session.row_factory = ordered_dict_factory


def insert_quotes():
    insert_quote = session.prepare('''
        INSERT INTO ticker.quotes
            (exchange, symbol, name, sector, marketcap, date, volume, open,
            close, low, high, current)
        VALUES
            (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''')
    insert_latest = session.prepare('''
        INSERT INTO ticker.latest
            (exchange, symbol, name, sector, marketcap, date, volume, open,
            close, low, high, current)
        VALUES
            (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''')

    seed_file = open('stock_seed_data.csv', 'r')

    reader = csv.DictReader(seed_file)
    for row in reader:
        row['date'] = time.mktime(time.strptime(row['date'], '%d-%b-%Y')) * 1000
        row['volume'] = int(row['volume'])
        row['open'] = float(row['open'])
        row['close'] = float(row['close'])
        row['low'] = float(row['low'])
        row['high'] = float(row['high'])
        row['current'] = row['close']
        print row

        session.execute(insert_quote.bind(row))
        session.execute(insert_latest.bind(row))


def insert_recommendations():
    insert_recommendation = session.prepare('''
        INSERT INTO ticker.recommendations
            (risk_tolerance, preferred_investment_types, retirement_age,
            withdrawal_year, updated_date, recommendation_id, exchange, symbol,
            name, buy, quantity, projected_growth, invested_peers)
        VALUES
            (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''')

    values = [
        {
            'risk_tolerance': 'high',
            'preferred_investment_types':
                'bonds_international-securities_money-market',
            'retirement_age': '35-45',
            'withdrawal_year': '30+',
            'updated_date': time.time() * 1000,
            'recommendation_id': uuid.uuid4(),
            'exchange': 'NYSE',
            'symbol': 'NKE',
            'name': 'Nike',
            'buy': True,
            'quantity': 100,
            'projected_growth': .65,
            'invested_peers': .8
        },
        {
            'risk_tolerance': 'high',
            'preferred_investment_types':
                'bonds_international-securities_money-market',
            'retirement_age': '35-45',
            'withdrawal_year': '30+',
            'updated_date': time.time() * 1000,
            'recommendation_id': uuid.uuid4(),
            'exchange': 'NYSE',
            'symbol': 'VZA',
            'name': 'Verizon',
            'buy': True,
            'quantity': 1000,
            'projected_growth': .85,
            'invested_peers': .6
        }
    ]

    for value in values:
        session.execute(insert_recommendation.bind(value))


def insert_portfolios():
    insert_history = session.prepare('''
        INSERT INTO ticker.history
            (email_address, date, buy, exchange, name, price, quantity, symbol)
        VALUES
            (?, ?, ?, ?, ?, ?, ?, ?)
    ''')
    insert_portfolio = session.prepare('''
        INSERT INTO ticker.portfolio
            (email_address, date, buy, exchange, name, price, quantity, symbol)
        VALUES
            (?, ?, ?, ?, ?, ?, ?, ?)
    ''')

    email_address = 'joaquin@datastax.com'
    exchange = 'NYSE'
    name = 'Nike'
    symbol = 'NKE'
    values = [
        {
            'email_address': email_address,
            'exchange': exchange,
            'name': name,
            'symbol': symbol,
            'date': time.time() * 1000,
            'buy': True,
            'price': 1,
            'quantity': 1000
        },
        {
            'email_address': email_address,
            'exchange': exchange,
            'name': name,
            'symbol': symbol,
            'date': time.time() * 1000 + 1,
            'buy': True,
            'price': 2.54,
            'quantity': 200
        },
        {
            'email_address': email_address,
            'exchange': exchange,
            'name': name,
            'symbol': symbol,
            'date': time.time() * 1000 + 2,
            'buy': False,
            'price': 50,
            'quantity': 100
        },
        {
            'email_address': email_address,
            'exchange': exchange,
            'name': name,
            'symbol': symbol,
            'date': time.time() * 1000 + 3,
            'buy': False,
            'price': 200,
            'quantity': 4
        },
    ]

    for value in values:
        session.execute(insert_history.bind(value))
        session.execute(insert_portfolio.bind(value))


def insert_users():
    insert_user = session.prepare('''
        INSERT INTO ticker.user
            (email_address, preferred_investment_types, retirement_age,
            risk_tolerance, withdrawal_year)
        VALUES
            (?, ?, ?, ?, ?)
    ''')

    values = [
        {
            'email_address': 'joaquin@datastax.com',
            'preferred_investment_types': ['bonds', 'international-securities',
                                           'money-market'],
            'retirement_age': '35-45',
            'risk_tolerance': 'high',
            'withdrawal_year': '30+'
        }
    ]

    for value in values:
        session.execute(insert_user.bind(value))


insert_quotes()
insert_portfolios()
insert_recommendations()
insert_users()
