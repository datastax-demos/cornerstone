import logging
import time
from decimal import Decimal

try: import simplejson as json
except ImportError: import json

from flask import Blueprint, render_template, request, session, jsonify

from Cornerstone.routes.datastax.cornerstone.rest import get_session, \
    get_solr_session

demo_portal_endpoint = Blueprint('demo_portal_endpoint', __name__)

@demo_portal_endpoint.route('/')
def index():
    return render_template('datastax/demo-portal/index.jinja2')

