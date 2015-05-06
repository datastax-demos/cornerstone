import logging
import time
from decimal import Decimal

try: import simplejson as json
except ImportError: import json

from flask import Blueprint, render_template, request, session, jsonify

from Cornerstone.routes.datastax.cornerstone.rest import get_session, \
    get_solr_session

template_cornerstone_endpoint = Blueprint('template_cornerstone_endpoint', __name__)

@template_cornerstone_endpoint.route('/')
def index():
    return render_template('datastax/template_cornerstone/index.jinja2')

