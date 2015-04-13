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
<body class="customize-body">
<div id="page-generic">


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


    <div id="customize-form-placement-div">
        <div id="customize-form-placement-div-sp"></div>
        <div>


            <form id="customize-form" action="recommendations.jsp"
                  method="post">
                <ul>
                    <li>Risk Tolerance</li>
                    <li>
                        <input type="radio" name="risk_tolerance"
                               id="risk_tolerance_low"></input>
                        <label for="risk_tolerance_low">Low</label>
                    </li>
                    <li>
                        <input type="radio" name="risk_tolerance"
                               id="risk_tolerance_medium"></input>
                        <label for="risk_tolerance_medium">Medium</label>
                    </li>
                    <li>
                        <input type="radio" name="risk_tolerance"
                               id="risk_tolerance_high"></input>
                        <label for="risk_tolerance_high">High</label>
                    </li>
                </ul>
                <ul>
                    <li>Preferred Investment Types</li>
                    <li>
                        <input type="checkbox" name="money_market"
                               id="pit_money_market"></input>
                        <label for="pit_money_market">Money Market</label>
                    </li>
                    <li>
                        <input type="checkbox" name="bonds"
                               id="pit_bonds"></input>
                        <label for="pit_bonds">Bonds</label>
                    </li>
                    <li>
                        <input type="checkbox" name="stocks"
                               id="pit_money_stocks"></input>
                        <label for="pit_money_stocks">Stocks</label>
                    </li>
                    <li>
                        <input type="checkbox" name="international_securities"
                               id="pit_international_securities"></input>
                        <label for="pit_international_securities">International
                            Securities</label>
                    </li>
                </ul>
                <ul>
                    <li><select id="retirementage" name="retirementage"/>
                        <option value="retirementage" disabled selected>
                            Retirement Age
                        </option>
                        <option value="3545">35-45</option>
                        <option value="4565">45-65</option>
                        <option value="6575">65-75</option>
                        <option value="7585">75-85</option>
                        <option value="8510">85+</option>
                        </select>
                    </li>
                    <li><select id="drawfunds" name="drawfunds"/>
                        <option value="drawfunds" disabled selected>When do you
                            expect to draw funds?
                        </option>
                        <option value="less5">&lt; 5 years</option>
                        <option value="5to10">5-10 years</option>
                        <option value="10to20">10-20 years</option>
                        <option value="20to30">20-30 years</option>
                        <option value="30plus">30+ years</option>
                        <option value="atretage">At retirement age</option>
                        </select>
                    </li>
                    <li>
                        <input id="submit_button" type="submit" value="SUBMIT"/>
                    </li>
                </ul>
            </form>
        </div>
    </div>
    <!-- customize-form-placement-div -->


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
