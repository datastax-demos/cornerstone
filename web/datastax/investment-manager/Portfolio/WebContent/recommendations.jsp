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
<div id="recommendations-page-div">


    <!-- based on portfolio.jsp - version 04.06.15 - 01.39 PM -->

    <div id="top-navigation" class="clearfix">
        <a href="dash.jsp"><img src="images/mobile-top-nav-button-v2.png"
                                 id="mob-nav-bar-button"></a>
        <a href="#"><img src="images/mobile-top-nav-logo.png"
                         id="mob-nav-bar-logo"></a>
        <a href="search.jsp"><img
                src="images/mobile-top-nav-search-icon-v2.png"
                id="mob-nav-bar-search-icon"></a>
    </div>
    <div id="top-navigation-sp"></div>


    <div id="tradingandportfolio-navigation" class="clearfix">
        <a href="portfolio.jsp" class="tabnavbutton tnbn1">Your Portfolio</a><a
            href="transactions.jsp" class="tabnavbutton tnbn2">Transaction
        History</a><a href="recommendations.jsp"
                      class="tabnavbutton tnbn3 selectedtnbn">Recommendations</a>
    </div>

    <table id="item-list">
        <thead>
        <tr>
            <th class="tapcell1">Symbol
            </th>
            <th class="tapcell2">Action</th>
            <th class="tapcell3">Why
            </th>
        </tr>
        </thead>
        <tbody>
        <tr class="selecteditem" id="itemblistutton1">
            <td class="tapcell1">
                <a href="#">GPRO</a>
            </td>
            <td class="tapcell2">
                BUY
            </td>
            <td class="tapcell3">+ 45% / 55%</td>
        </tr>
        <tr id="itemblistutton2" class="recspricefallingtr">
            <td class="tapcell1">
                FB
            </td>
            <td class="tapcell2">SELL</td>
            <td class="tapcell3">- 20% / 15%</td>
        </tr>
        <tr id="itemblistutton3">
            <td class="tapcell1">
                <a href="#">AA</a>
            </td>
            <td class="tapcell2">BUY</td>
            <td class="tapcell3">+ 8% / 70%</td>
        </tr>
        <tr id="itemblistutton4" class="recspricefallingtr">
            <td class="tapcell1">
                <a href="#">JPM</a>
            </td>
            <td class="tapcell2">SELL</td>
            <td class="tapcell3">- 45% / 25%</td>
        </tr>
        <tr id="itemblistutton5">
            <td class="tapcell1">
                <a href="#">UAL</a>
            </td>
            <td class="tapcell2">BUY</td>
            <td class="tapcell3">+ 35% / 80%</td>
        </tr>
        <tr id="itemblistutton6" class="recspricefallingtr">
            <td class="tapcell1">
                <a href="#">SBUX</a>
            </td>
            <td class="tapcell2">SELL</td>
            <td class="tapcell3">- 70% / $45%</td>
        </tr>

        </tbody>
    </table>

    <div id="details-list-block">

        <div id="itemblistdetails1" class="itemblistdetailsclass">
            <table id="details-list">
                <tbody>
                <tr>
                    <td class="dlcname">
                        <a href="#">GoPro Inc.</a>
                    </td>
                    <td>
                        <p class="dlcsubheader">Quantity</p>

                        <p>200</p></td>
                </tr>
                <tr>
                    <td>
                        <p class="dlcsubheader">Price </p>

                        <p>$43.00</p>
                    </td>
                    <td>
                        <p class="dlcsubheader">Balance</p>

                        <p>$8,600.00</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="gencolorcode">
                        <p class="dlcsubheader">Why</p>

                        <p>+ 45% Gain / 55% of Peers Invested</p>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div id="itemblistdetails2" class="itemblistdetailsclass">
            <table id="details-list">
                <tbody>
                <tr>
                    <td class="dlcname">
                        <a href="#">Facebook</a>
                    </td>
                    <td>
                        <p class="dlcsubheader">Quantity</p>

                        <p>150</p></td>
                </tr>
                <tr>
                    <td>
                        <p class="dlcsubheader">Price </p>

                        <p>$90.00</p>
                    </td>
                    <td>
                        <p class="dlcsubheader">Balance</p>

                        <p>$0.00</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="gencolorcode">
                        <p class="dlcsubheader">Why</p>

                        <p class="genlossfld">- 20% Loss / 15% of Peers
                            Invested</p>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div id="itemblistdetails3" class="itemblistdetailsclass">
            <table id="details-list">
                <tbody>
                <tr>
                    <td class="dlcname">
                        <a href="#">Alcoa Inc. </a>
                    </td>
                    <td>
                        <p class="dlcsubheader">Quantity</p>

                        <p>200</p></td>
                </tr>
                <tr>
                    <td>
                        <p class="dlcsubheader">Price </p>

                        <p>$14.00</p>
                    </td>
                    <td>
                        <p class="dlcsubheader">Balance</p>

                        <p>$2,800.00</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="gencolorcode">
                        <p class="dlcsubheader">Why</p>

                        <p>+ 8% Gain / 70% of Peers Invested</p>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div id="itemblistdetails4" class="itemblistdetailsclass">
            <table id="details-list">
                <tbody>
                <tr>
                    <td class="dlcname">
                        <a href="#">JP Morgan Chase</a>
                    </td>
                    <td>
                        <p class="dlcsubheader">Quantity</p>

                        <p>80</p></td>
                </tr>
                <tr>
                    <td>
                        <p class="dlcsubheader">Price </p>

                        <p>$62.00</p>
                    </td>
                    <td>
                        <p class="dlcsubheader">Balance</p>

                        <p>$0.00</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="gencolorcode">
                        <p class="dlcsubheader">Why</p>

                        <p class="genlossfld">- 45% Loss / 25% of Peers
                            Invested</p>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div id="itemblistdetails5" class="itemblistdetailsclass">
            <table id="details-list">
                <tbody>
                <tr>
                    <td class="dlcname"><a href="#">United Airlines</a></td>
                    <td>
                        <p class="dlcsubheader">Quantity</p>

                        <p>100</p></td>
                </tr>
                <tr>
                    <td><p class="dlcsubheader">Price </p>

                        <p>$50.00</p></td>
                    <td><p class="dlcsubheader">Balance</p>

                        <p>$5,000.00</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="gencolorcode"><p
                            class="dlcsubheader">Why</p>

                        <p>+ 35% Gain / 80% of Peers Invested</p>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>


        <div id="itemblistdetails6" class="itemblistdetailsclass">
            <table id="details-list">
                <tbody>
                <tr>
                    <td class="dlcname"><a href="#">Starbucks</a></td>
                    <td>
                        <p class="dlcsubheader">Quantity</p>

                        <p>100</p></td>
                </tr>
                <tr>
                    <td><p class="dlcsubheader">Price </p>

                        <p>$48.00</p></td>
                    <td><p class="dlcsubheader">Balance</p>

                        <p>$0.00</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="gencolorcode"><p
                            class="dlcsubheader">Why</p>

                        <p class="genlossfld">- 70% Loss / $45% of Peers
                            Invested</p>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>


    </div>
    <!-- details-list-block -->


</div>
<!-- page element-->

<!-- DEMO code only - common section below -->

 <!--version-control start -->
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
