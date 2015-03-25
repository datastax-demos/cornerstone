from flask import Blueprint, render_template

black_friday_api = Blueprint('black_friday_api', __name__)


@black_friday_api.route('/')
def index():
    content = '''
    List of example links to be used to showcase and ingest data on the frontend:
    <ul>
        <li>
            <a href="/api">API: Test Page</a>
        </li>
        <li>
            <a href="/api/paging/system/compaction_history">API: system.compaction_history</a>
        </li>
        <li>
            <a href="/api/paging/system/schema_keyspaces">API: system.schema_keyspaces</a>
        </li>
        <li>
            <a href="/api/paging/retail/products?result_size=5&paging_keys=product_id&paging_values=B000ET7AZK">
                API: Sample Query with Custom Values (will not work out of box)
            </a>
        </li>
        <li>
            <a href="/gcharts/table/?gcharts_columns=compacted_at,id,keyspace_name,columnfamily_name,rows_merged,bytes_in,bytes_out&result_size=100">
                Google Charts: Tabular Example
            </a>
        </li>
    </ul>
    '''
    return render_template('index.jinja2',
                           content=content)
