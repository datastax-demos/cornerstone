<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">

    <title>Ticker</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <![endif]-->

    <link href="css/dxfonts-v2.css" rel="stylesheet">
    <link href="css/common-v3.css" rel="stylesheet">

    <style type="text/css">
    </style>

    <script src="js/jquery.js"></script>

</head>
<body>
<div id="page-generic">


    <!-- based on portfolio.jsp - version 04.06.15 - 01.39 PM -->


    <!-- separate NAV for SEARCH PAGE search START -->
    <div id="top-navigation" class="clearfix"><a href="dash.jsp"><img
            src="images/mobile-top-nav-button-v2.png"
            id="mob-nav-bar-button"></a>
        <a href="#"><img src="images/mobile-top-nav-logo.png"
                         id="mob-nav-bar-logo"></a><a href="portfolio.jsp"><img
                src="images/mobile-top-nav-button-close-v2.png"
                id="mob-nav-bar-search-icon"></a>
    </div>
    <div id="top-navigation-sp"></div>
    <!-- separate NAV for SEARCH PAGE search END -->

    <div id="search-page-content">

        <form id="search-form" action="" method="post">
            <table class="sbtable">
                <tbody>
                <tr>
                    <td class="sbtd1">
                        <input class="search_button-fld" type="Text"
                               name="search_string" id="search_string"
                               placeholder="Enter Symbol or Name"></input>
                    </td>
                    <td class="sbtd1">
                        <input class="search_button-btn" id="search_button"
                               type="submit" value="SEARCH"/>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>

        <!-- Search Results START -->

        <table id="search-item-1" class="search-item">
            <tbody>
            <tr>
                <td class="dlcname">
                    <p class="dlcsubheader">Symbol</p>

                    <p class="dlcsh-symbol">T</p>
                </td>
                <td>
                    <p class="dlcsubheader">Name</p>

                    <p>AT&T Inc.</p></td>
            </tr>
            <tr>
                <td>
                    <p class="dlcsubheader">Exchange </p>

                    <p>NYSE</p>
                </td>
                <td>
                    <p class="dlcsubheader">Sector</p>

                    <p>Communications</p>
                </td>
            </tr>
            <tr>
                <td class="gencolorcode">
                    <p class="dlcsubheader">Daily Gain </p>

                    <p>+ 0.12%</p>
                </td>
                <td>
                    <p class="dlcsubheader">Last Trade</p>

                    <p>$32.00</p>
                </td>
            </tr>
            </tbody>
        </table>


        <table id="search-item-X" class="search-item">
            <tbody>
            <tr>
                <td class="dlcname">
                    <p class="dlcsubheader">Symbol</p>

                    <p class="dlcsh-symbol">BRCM</p>
                </td>
                <td>
                    <p class="dlcsubheader">Name</p>

                    <p>Broadcom</p></td>
            </tr>
            <tr>
                <td>
                    <p class="dlcsubheader">Exchange </p>

                    <p>NASDAQ</p>
                </td>
                <td>
                    <p class="dlcsubheader">Sector</p>

                    <p>Technology</p>
                </td>
            </tr>
            <tr>
                <td class="gencolorcode">
                    <p class="dlcsubheader">Daily Gain </p>

                    <p>+ 2.50%</p>
                </td>
                <td>
                    <p class="dlcsubheader">Last Trade</p>

                    <p>$45.00</p>
                </td>
            </tr>
            </tbody>
        </table>


        <table id="search-item-X" class="search-item">
            <tbody>
            <tr>
                <td class="dlcname">
                    <p class="dlcsubheader">Symbol</p>

                    <p class="dlcsh-symbol">SAP</p>
                </td>
                <td>
                    <p class="dlcsubheader">Name</p>

                    <p>SAP</p></td>
            </tr>
            <tr>
                <td>
                    <p class="dlcsubheader">Exchange </p>

                    <p>NYSE</p>
                </td>
                <td>
                    <p class="dlcsubheader">Sector</p>

                    <p>Technology</p>
                </td>
            </tr>
            <tr>
                <td class="gencolorcode">
                    <p class="dlcsubheader">Daily Gain </p>

                    <p>+ 0.07%</p>
                </td>
                <td>
                    <p class="dlcsubheader">Last Trade</p>

                    <p>$92.00</p>
                </td>
            </tr>
            </tbody>
        </table>


        <table id="search-item-X" class="search-item">
            <tbody>
            <tr>
                <td class="dlcname">
                    <p class="dlcsubheader">Symbol</p>

                    <p class="dlcsh-symbol">TWTR</p>
                </td>
                <td>
                    <p class="dlcsubheader">Name</p>

                    <p>Twitter Inc. </p></td>
            </tr>
            <tr>
                <td>
                    <p class="dlcsubheader">Exchange </p>

                    <p>NYSE</p>
                </td>
                <td>
                    <p class="dlcsubheader">Sector</p>

                    <p>Technology</p>
                </td>
            </tr>
            <tr>
                <td class="gencolorcode">
                    <p class="dlcsubheader">Daily Gain </p>

                    <p>+ 0.25%</p>
                </td>
                <td>
                    <p class="dlcsubheader">Last Trade</p>

                    <p>$52.00</p>
                </td>
            </tr>
            </tbody>
        </table>


        <table id="search-item-X" class="search-item">
            <tbody>
            <tr>
                <td class="dlcname">
                    <p class="dlcsubheader">Symbol</p>

                    <p class="dlcsh-symbol">RAD</p>
                </td>
                <td>
                    <p class="dlcsubheader">Name</p>

                    <p>Rite Aid Inc.</p></td>
            </tr>
            <tr>
                <td>
                    <p class="dlcsubheader">Exchange </p>

                    <p>NYSE</p>
                </td>
                <td>
                    <p class="dlcsubheader">Sector</p>

                    <p>Retail</p>
                </td>
            </tr>
            <tr>
                <td class="gencolorcode">
                    <p class="dlcsubheader">Daily Gain </p>

                    <p>+ 8.25%</p>
                </td>
                <td>
                    <p class="dlcsubheader">Last Trade</p>

                    <p>$8.00</p>
                </td>
            </tr>
            </tbody>
        </table>


        <table id="search-item-X" class="search-item">
            <tbody>
            <tr>
                <td class="dlcname">
                    <p class="dlcsubheader">Symbol</p>

                    <p class="dlcsh-symbol">DIS</p>
                </td>
                <td>
                    <p class="dlcsubheader">Name</p>

                    <p>Walt Disney</p></td>
            </tr>
            <tr>
                <td>
                    <p class="dlcsubheader">Exchange </p>

                    <p>NYSE</p>
                </td>
                <td>
                    <p class="dlcsubheader">Sector</p>

                    <p>Entertainment</p>
                </td>
            </tr>
            <tr>
                <td class="gencolorcode">
                    <p class="dlcsubheader">Daily Gain </p>

                    <p class="genlossfld">- 0.40%</p>
                </td>
                <td>
                    <p class="dlcsubheader">Last Trade</p>

                    <p>$107.00</p>
                </td>
            </tr>
            </tbody>
        </table>


        <table id="search-item-X" class="search-item">
            <tbody>
            <tr>
                <td class="dlcname">
                    <p class="dlcsubheader">Symbol</p>

                    <p class="dlcsh-symbol">NKE</p>
                </td>
                <td>
                    <p class="dlcsubheader">Name</p>

                    <p>Nike Inc.</p></td>
            </tr>
            <tr>
                <td>
                    <p class="dlcsubheader">Exchange </p>

                    <p>NYSE</p>
                </td>
                <td>
                    <p class="dlcsubheader">Sector</p>

                    <p>Retail</p>
                </td>
            </tr>
            <tr>
                <td class="gencolorcode">
                    <p class="dlcsubheader">Daily Gain </p>

                    <p class="genlossfld">- 0.16%</p>
                </td>
                <td>
                    <p class="dlcsubheader">Last Trade</p>

                    <p>$100.00</p>
                </td>
            </tr>
            </tbody>
        </table>


        <table id="search-item-X" class="search-item">
            <tbody>
            <tr>
                <td class="dlcname">
                    <p class="dlcsubheader">Symbol</p>

                    <p class="dlcsh-symbol">NOW</p>
                </td>
                <td>
                    <p class="dlcsubheader">Name</p>

                    <p>ServiceNow</p></td>
            </tr>
            <tr>
                <td>
                    <p class="dlcsubheader">Exchange </p>

                    <p>NYSE</p>
                </td>
                <td>
                    <p class="dlcsubheader">Sector</p>

                    <p>Technology</p>
                </td>
            </tr>
            <tr>
                <td class="gencolorcode">
                    <p class="dlcsubheader">Daily Gain </p>

                    <p class="genlossfld">- 1.15%</p>
                </td>
                <td>
                    <p class="dlcsubheader">Last Trade</p>

                    <p>$80.00</p>
                </td>
            </tr>
            </tbody>
        </table>


        <!-- Search Results END -->


    </div>
    <!-- search-page-content -->


</div>
<!-- page element-->

<!-- DEMO code only - common section below -->

<!-- version-control start -->
<style type="text/css">
    #version-control {
        display: none;
    }

    @media screen and (min-width: 1000px) and  (min-height: 760px) {
        #version-control {
            display: table;
        }
    }
</style>
<!--<div id="version-control"-->
     <!--style="position:fixed; top:0px; bottom:0px; left:0px; right:0px; z-index:1000; width:100%; height:100%; background-color:#007b98;">-->
    <!--<div style="display:table-cell; vertical-align:middle; text-align:center;">-->
        <!--<img style="widht:80%;" src="images/login-logo.png"></div>-->
<!--</div>-->
<!-- version-control end -->

<script src="js/custom-v1.js"></script>

<script src="js/bootstrap-transition.js"></script>
<script src="js/bootstrap-alert.js"></script>
<script src="js/bootstrap-modal.js"></script>
<script src="js/bootstrap-dropdown.js"></script>
<script src="js/bootstrap-scrollspy.js"></script>
<script src="js/bootstrap-tab.js"></script>
<script src="js/bootstrap-tooltip.js"></script>
<script src="js/bootstrap-popover.js"></script>
<script src="js/bootstrap-button.js"></script>
<script src="js/bootstrap-collapse.js"></script>
<script src="js/bootstrap-carousel.js"></script>
<script src="js/bootstrap-typeahead.js"></script>

<script type="text/javascript">
</script>


<!-- thisfcimgs v 01.07.15 10:21 AM start -->
<div id="thisfcimgs"
     style="visibility:hidden; height:1px; width:1px; overflow:hidden;">
    <img src="images/custom-icon-circle.png">
    <img src="images/dash-icon-accounts.png">
    <img src="images/dash-icon-advice.png">
    <img src="images/dash-icon-arrowend-down.png">
    <img src="images/dash-icon-arrowend-right.png">
    <img src="images/dash-icon-banking.png">
    <img src="images/dash-icon-customize.png">
    <img src="images/dash-icon-home.png">
    <img src="images/dash-icon-logoff.png">
    <img src="images/dash-icon-mutual.png">
    <img src="images/dash-icon-quotes.png">
    <img src="images/dash-icon-submenu.png">
    <img src="images/dash-icon-trading.png">
    <img src="images/form-icon-circle-dot.png">
    <img src="images/form-icon-circle.png">
    <img src="images/icon-arrow-down.png">
    <!--login-background-v3.png  -->
    <!-- icon-loading-anim.gif -->
    <img src="images/login-logo.png">
    <img src="images/mobile-top-nav-button-close-v2.png">
    <img src="images/mobile-top-nav-button-v2.png">
    <img src="images/mobile-top-nav-logo.png">
    <img src="images/mobile-top-nav-search-icon-v2.png">
</div>
<!-- thisfcimgs END -->

</body>
</html>
