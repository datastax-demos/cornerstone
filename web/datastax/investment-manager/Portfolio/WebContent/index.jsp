<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">

    <title>Ticker Login</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="css/bootstrap.css" rel="stylesheet">

    <link rel="apple-touch-icon" href="images/app_icon.png"/>

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <![endif]-->

    <link href="css/dxfonts-v2.css" rel="stylesheet">
    <link href="css/common-v3.css" rel="stylesheet">
    <link href="css/login-page.css" rel="stylesheet">

    <script src="js/jquery.js"></script>

    <style type=" text/css">
    </style>

</head>
<body class="login-body">


<div id="thisloadinganim"
     style="display:table; width:100%; height:100%; position: fixed; z-index:100000; top:0px; bottom: 0px; left:0px; right:0px; background-color:#fff;">
    <div style="display:table-cell; width:100%; heigth:100%; text-align:center; vertical-align:middle;">
        <img src="images/icon-loading-anim.gif"></div>
</div>
<script type='text/javascript'>
    $(window).load(function () {
        $("#thisloadinganim").css("display", "none").remove();
    });
</script>


<!-- thisloadinganim -->
<div id="login-page">
    <div>
        <div id="formblock">
            <div class="mobcontdiv1">&nbsp;</div>
            <img src="images/login-logo.png" id="login-logo-img">

            <form id="login-form" action="Login" method="post">
                <input type="Text" name="email_address" value="" tabindex="1"
                       placeholder="Email Address"/>
                <input type="password" name="password" value="" tabindex="2"
                       placeholder="Password"/>

                <div id="login-quick-links" class="clearfix">
                    <div class="div1">Forgot your passord?</div>
                    <div class="div2">Create an account</div>
                </div>
                <input id="login_button" type="submit" value="LOG IN"/>
            </form>
            <div class="mobcontdiv1">&nbsp;</div>
        </div>
    </div>

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
</div>


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
