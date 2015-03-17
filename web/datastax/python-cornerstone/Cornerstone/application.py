from flask import Flask

from Cornerstone.routes import rest
from Cornerstone.routes.gui import gui_api
from Cornerstone.routes.rest import rest_api
from Cornerstone.routes.gcharts import gcharts_api
from Cornerstone.routes.community.datastax import datastax_api

app = Flask(__name__)
app.config.from_pyfile('application.cfg')

app.register_blueprint(gui_api)
app.register_blueprint(rest_api, url_prefix='/api')
app.register_blueprint(gcharts_api, url_prefix='/gcharts')

# community expansions
app.register_blueprint(datastax_api, url_prefix='/datastax')


def start():
    rest.init_cassandra(app.config['DSE_CLUSTER'].split(','))

    app.run(host='0.0.0.0',
            port=5000,
            use_reloader=True,
            threaded=True)
