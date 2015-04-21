CREATE KEYSPACE ticker WITH replication = {
  'class': 'NetworkTopologyStrategy',
  'Analytics': '3'
};

CREATE TABLE ticker.stocks (
    exchange text,
    symbol text,
    date timestamp,
    name text STATIC,
    sector text STATIC,
    marketcap text,
    volume int,
    open double,
    close double,
    low double,
    high double,
    PRIMARY KEY ((exchange, symbol), date)
);

CREATE TABLE ticker.user (
    email_address text,
    name text,
    password_hash text,
    risk_tolerance text,
    preferred_investmentTypes text,
    retirement_age int,
    withdrawal_year int,
    PRIMARY KEY ((email_address))
);

CREATE TABLE ticker.portfolio (
    email_address text,
    name text,
    password_hash text,
    risk_tolerance text,
    preferred_investmentTypes text,
    retirement_age int,
    withdrawal_year int,
    PRIMARY KEY ((email_address))
);
