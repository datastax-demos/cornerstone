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
    <link href="css/common-v3.css?4" rel="stylesheet">

    <style type="text/css">
    </style>

    <script src="js/jquery.js"></script>

</head>
<body class="dash-body">
<div id="page-generic">


    <!-- separate NAV for DashPage START -->
    <div id="top-navigation" class="clearfix"><a href="portfolio.jsp"><img
            src="images/mobile-top-nav-button-close-v2.png"
            id="mob-nav-bar-button"></a>
        <a href="#"><img src="images/mobile-top-nav-logo.png"
                         id="mob-nav-bar-logo"></a><a href="search.jsp"><img
                src="images/mobile-top-nav-search-icon-v2.png"
                id="mob-nav-bar-search-icon"></a>
    </div>
    <div id="top-navigation-sp"></div>
    <!-- separate NAV for DashPage END -->


    <div id="dash-bar-placement-div">
        <div id="dash-bar-placement-div-sp"></div>
        <ul id="dash-bar" class="clearfix">
            <li class="dash-row-class drchovable">
                <a href="portfolio.jsp">
                    <div class="dash-icon-div-class"><img
                            src="images/dash-icon-home.png"
                            class="dash-icon-img"></div>
                    <div class="dash-text-div-class">
                        Home
                    </div>
                </a>
            </li>
            <li class="dash-row-class drchovable">
                <a href="index.jsp">
                    <div class="dash-icon-div-class"><img
                            src="images/dash-icon-logoff.png"
                            class="dash-icon-img"></div>
                    <div class="dash-text-div-class">
                        Log off
                    </div>
                </a>
            </li>
            <li class="dash-row-class drchovable">
                <a href="#">
                    <div class="dash-icon-div-class"><img
                            src="images/dash-icon-accounts.png"
                            class="dash-icon-img"></div>
                    <div class="dash-text-div-class">
                        Accounts
                    </div>
                </a>
            </li>
            <li class="dash-row-class drcselected">
                <div class="drcmenutype">
                    <div class="dash-icon-div-class"><img
                            src="images/dash-icon-trading.png"
                            class="dash-icon-img"></div>
                    <div class="dash-text-div-class">
                        Trading & Portfolios
                    </div>
                    <div class="dash-arrowend-div-class"><img
                            src="images/dash-icon-arrowend-down.png"
                            class="dash-arrowend-down-img"></div>
                </div>
            </li>
            <li class="dash-row-class drchassubmenu">
                <ul id="dash-bar-submenu-ul-1" class="dash-bar-submenu">
                    <li class="dash-row-class drchovable">
                        <a href="portfolio.jsp">
                            <div class="dash-icon-div-class"><img
                                    src="images/dash-icon-submenu.png"
                                    class="dash-icon-img"></div>
                            <div class="dash-text-div-class">
                                <div class="sub-section">
                                    Your Portfolio
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="dash-row-class drchovable">
                        <a href="transactions.jsp">
                            <div class="dash-icon-div-class"><img
                                    src="images/dash-icon-submenu.png"
                                    class="dash-icon-img"></div>
                            <div class="dash-text-div-class">
                                <div class="sub-section">
                                    Transaction History
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="dash-row-class drchovable">
                        <a href="recommendations.jsp">
                            <div class="dash-icon-div-class"><img
                                    src="images/dash-icon-submenu.png"
                                    class="dash-icon-img"></div>
                            <div class="dash-text-div-class">
                                <div class="sub-section">
                                    Recommendations
                                </div>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- dash-row-class -->
            </li>
            <li class="dash-row-class drchovable">
                <a href="#">
                    <div class="dash-icon-div-class"><img
                            src="images/dash-icon-quotes.png"
                            class="dash-icon-img"></div>
                    <div class="dash-text-div-class">
                        Quotes & Research
                    </div>
                </a>
            </li>
            <li class="dash-row-class drchovable">
                <a href="#">
                    <div class="dash-icon-div-class"><img
                            src="images/dash-icon-mutual.png"
                            class="dash-icon-img" id="dash-icon-mutual"></div>
                    <div class="dash-text-div-class">
                        Mutual Funds, ETFs <br>
                        & Bonds
                    </div>
                </a>
            </li>
            <li class="dash-row-class drchovable">
                <a href="#">
                    <div class="dash-icon-div-class"><img
                            src="images/dash-icon-advice.png"
                            class="dash-icon-img"></div>
                    <div class="dash-text-div-class">
                        Advice & Retirement
                    </div>
                </a>
            </li>
            <li class="dash-row-class drchovable">
                <a href="#">
                    <div class="dash-icon-div-class"><img
                            src="images/dash-icon-banking.png"
                            class="dash-icon-img"></div>
                    <div class="dash-text-div-class">
                        Banking & Credit Cards
                    </div>
                </a>
            </li>
            <li class="dash-row-class drchovable">
                <a href="customize.jsp">
                    <div class="dash-icon-div-class"><img
                            src="images/dash-icon-customize.png"
                            class="dash-icon-img"></div>
                    <div class="dash-text-div-class">
                        Customize
                    </div>
                    <div class="dash-arrowend-div-class"><img
                            src="images/dash-icon-arrowend-right.png"
                            class="dash-arrowend-right-img"></div>
                </a>
            </li>
        </ul>
        <!-- dash-bar -->
        <div class="dash-bar-tail">&nbsp;</div>
    </div>
    <!-- dash-bar-placement-div -->
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
