from flask import Blueprint, render_template

gui_endpoint = Blueprint('gui_endpoint', __name__)


@gui_endpoint.route('/')
def index():
    return render_template('datastax/cornerstone/index.jinja2')
