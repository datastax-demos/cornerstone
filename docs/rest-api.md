<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Rest API](#rest-api)
  - [cornerstone/flask/run](#cornerstoneflaskrun)
  - [cornerstone/flask/DataStaxDemo/application.py](#cornerstoneflaskDataStaxDemoapplicationpy)
  - [cornerstone/flask/DataStaxDemo/routes/rest.py](#cornerstoneflaskDataStaxDemoroutesrestpy)
  - [cornerstone/flask/DataStaxDemo/routes/gcharts.py](#cornerstoneflaskDataStaxDemoroutesgchartspy)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Rest API

## cornerstone/flask/run

```py
import DataStaxDemo.application
DataStaxDemo.application.start()
```

Kicker for setting up the Flask project to reference the DataStaxDemo module.

## cornerstone/flask/DataStaxDemo/application.py

```py
from DataStaxDemo.routes.gui import gui_api
from DataStaxDemo.routes.rest import rest_api
from DataStaxDemo.routes.gcharts import gcharts_api
from DataStaxDemo.routes.community.datastax import datastax_api

app.register_blueprint(gui_api)
app.register_blueprint(rest_api, url_prefix='/api')
app.register_blueprint(gcharts_api, url_prefix='/gcharts')
app.register_blueprint(datastax_api, url_prefix='/datastax')
```

Sets up the main contact points.

* `gui_api` handles all `/` requests.
* `rest_api` handles all `/api` requests.
* `datastax_api` handles all `/datastax` requests.

When creating your project create your api point at:

```
cornerstone/flask/DataStaxDemo/routes/community/${PROJECT}.py
```

where `${PROJECT}` separates words with underscores.

Place your custom templates in:

```
cornerstone/flask/DataStaxDemo/routes/community/templates/${PROJECT}
```

place your static files in:

```
cornerstone/flask/DataStaxDemo/static/css/community/${PROJECT}
cornerstone/flask/DataStaxDemo/static/img/community/${PROJECT}
cornerstone/flask/DataStaxDemo/static/js/community/${PROJECT}
```

## cornerstone/flask/DataStaxDemo/routes/rest.py

Endpoint: http://192.168.101.9:5000/api/paging/retail/products

| Parameter | Type | Default | Description |
|-----------|:----:|:-------:|-------------|
|result_size|int|1000|Number of results to return|
|paging_keys|comma-delimited string|None|Cassandra keys to be used in paging query to grab next results. len(paging_keys) should equal to len(paging_values) and follow the same ordering.|
|paging_values|comma-delimited string|None|Cassandra values to be used in paging query to grab next results. len(paging_keys) should equal to len(paging_values) and follow the same ordering.|
|gcharts_columns|comma-delimited string|None|Restricts the keys being reported to gCharts configurations.|
|gcharts_datatable_order_by|string|None|Passes value directly to gviz_api.DataTable.ToJson(orderby=gcharts_datatable_order_by)|

Sample: http://192.168.101.9:5000/api/paging/retail/products/?result_size=2

```
{
    gcharts: {
        1: [
            [
                "price",
                "brand",
                "product_id",
                "title"
            ],
            [
                63.95,
                null,
                "B000186POG",
                "B+W 46mm UV/IR Cut with with Multi-Resistant Coating (486M)"
            ],
            [
                8.23,
                null,
                "B000I1DNIW",
                "DVI-D / DVI-D Dual Link Cable Assembly, 3 Meter (10 ft)"
            ]
        ],
        1.1: "
            {
                "rows":[
                    {
                        "c":[
                            {"v":63.95},
                            null,
                            {"v":"B000186POG"},
                            {"v":"B+W 46mm UV/IR Cut with with Multi-Resistant Coating (486M)"}
                        ]
                    },
                    {
                        "c":[
                            {"v":8.23},
                            null,
                            {"v":"B000I1DNIW"},
                            {"v":"DVI-D / DVI-D Dual Link Cable Assembly, 3 Meter (10 ft)"}
                        ]
                    }
                ],
                "cols":[
                    {
                        "type":"number",
                        "id":"price",
                        "label":"Price"
                    },
                    {
                        "type":"string",
                        "id":"brand",
                        "label":"Brand"
                    },
                    {   
                        "type":"string",
                        "id":"product_id",
                        "label":"Product Id"
                    },
                    {
                        "type":"string",
                        "id":"title",
                        "label":"Title"
                    }
                ]
            }
        "
    },
    results: [
        {
            brand: null,
            price: 63.95,
            product_id: "B000186POG",
            title: "B+W 46mm UV/IR Cut with with Multi-Resistant Coating (486M)"
        },
        {
            brand: null,
            price: 8.23,
            product_id: "B000I1DNIW",
            title: "DVI-D / DVI-D Dual Link Cable Assembly, 3 Meter (10 ft)"
        }
    ]
}
```

## cornerstone/flask/DataStaxDemo/routes/gcharts.py

Endpoint:
```
http://192.168.101.9:5000/gcharts/<chart_type>/
```

Where `chart_type` can be:

| Chart Types | Example |
|-------------|---------|
|annotationchart|First column requires a date/time.|
|areachart|http://192.168.101.9:5000/gcharts/areachart/?gcharts_columns=title,price|
|barchart|http://192.168.101.9:5000/gcharts/barchart/?gcharts_columns=title,price&gcharts_datatable_order_by=price|
|linechart|http://192.168.101.9:5000/gcharts/linechart/?gcharts_columns=title,price&result_size=100|
|piechart|http://192.168.101.9:5000/gcharts/piechart/?gcharts_columns=product_id,price&paging_keys=product_id&paging_values=B0009IB8RC&result_size=10|
|table|http://192.168.101.9:5000/gcharts/table/|

Documentation for all chart types can be found
[here](https://google-developers.appspot.com/chart/interactive/docs/gallery).
1.1 interfaces are used, if implemented.


| Parameter | Type | Default | Description |
|-----------|:----:|:-------:|-------------|
|url|string|/api/paging/retail/products|AJAX endpoint to acquire data.|
|extra parameters|N/A|None|All extra parameters appended to `url` parameter and sent to AJAX endpoint.|
