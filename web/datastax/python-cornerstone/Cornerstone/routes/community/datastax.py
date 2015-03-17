from flask import Blueprint, render_template

datastax_api = Blueprint('datastax_api', __name__,
                         template_folder='templates/datastax')


@datastax_api.route('/')
def index():
    content = '''
    Check out the following links for the queries our team came up with:
    <ul>
        <li>
            <a href="/api">API Test Page</a>
        </li>
        <li>
            <a href="/api/paging/retail/products">Sample Query</a>
        </li>
        <li>
            <a href="/api/paging/retail/products?result_size=5&paging_keys=product_id&paging_values=B000ET7AZK">
                Sample Query with Custom Values
            </a>
        </li>
        <li>
            <a href="brand">Brand Tabular Example</a>
        </li>
    </ul>
    '''
    return render_template('index.jinja2',
                           content=content)
