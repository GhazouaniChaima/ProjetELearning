<%-- 
    Document   : AjouterRessource
    Created on : 1 mai 2019, 17:20:23
    Author     : chaima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<<html lang="en">

    <!-- Mirrored from themazine.com/unify/campus/contact-us.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 06 Apr 2019 19:38:36 GMT -->
    <head>
        <meta charset="UTF-8">
        <!-- For IE -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- For Resposive Device -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>3alemni</title>

        <!-- Favicon -->
        <link rel="icon" type="image/png" sizes="56x56" href="images/fav-icon/icon.png">


        <!-- Main style sheet -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <!-- responsive style sheet -->
        <link rel="stylesheet" type="text/css" href="css/responsive.css">


        <!-- Fix Internet Explorer ______________________________________-->

        <!--[if lt IE 9]>
                <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
                <script src="vendor/html5shiv.js"></script>
                <script src="vendor/respond.js"></script>
        <![endif]-->
        <%
            boolean test = true;
            Cookie[] cookies = request.getCookies();
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("alemni_compte")) {
                    test = false;
                }
            }
        %>

    </head>

    <body>
        <div class="main-page-wrapper">

            <!-- ===================================================
                    Loading Transition
            ==================================================== -->
            <div id="loader-wrapper">
                <div id="loader"></div>
            </div>



            <!-- 
            =============================================
                    Theme Header
            ============================================== 
            -->
            <header class="theme-menu-wrapper menu-style-one">
                <div class="container">
                    <div class="header-wrapper clearfix">
                        <!-- Logo -->
                        <div class="logo float-left tran4s"><a href="index.html"><img src="images/logo/logo.jpg" width="110" height="48" alt="Logo"></a></div>

                        <!-- ============================ Theme Menu ========================= -->
                        <nav class="theme-main-menu float-right navbar" id="mega-menu-wrapper">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="navbar-collapse-1">
                                <nav class="theme-main-menu float-right navbar" id="mega-menu-wrapper">
                                    <!-- Brand and toggle get grouped for better mobile display -->
                                    <div class="navbar-header">
                                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false">
                                            <span class="sr-only">Toggle navigation</span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </button>
                                    </div>
                                    <!-- Collect the nav links, forms, and other content for toggling -->
                                    <div class="collapse navbar-collapse" id="navbar-collapse-1">
                                        <ul class="nav">
                                            <li><a href="http://localhost:8080/3alemniWebsite/" class="tran3s">Accueil</a></li>
                                            <li><a href="http://localhost:8080/3alemniWebsite/ShowFormationServlet" class="tran3s">Formations</a></li>
                                            <li><a href="http://localhost:8080/3alemniWebsite/ShowFormateursServlet" class="tran3s">Fomateurs</a></li>
                                            <li><a href="http://localhost:8080/3alemniWebsite/contactServlet" class="tran3s">Contact Us</a></li>


                                            <% if (test) { %>
                                            <li class="login"><button class="tran3s" data-toggle="modal" data-target=".signInModal" ><i class="flaticon-lock"></i>connexion</button></li>
                                                <% } else { %>
                                            <li class="login"><button class="tran3s"  data-target=".signInModal" style="background: #28a745">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connecté</button></li>
                                            <%}%>									</ul>
                                    </div><!-- /.navbar-collapse -->
                                </nav> 
                            </div> <!-- /.header-wrapper -->
                    </div>
            </header> <!-- /.theme-menu-wrapper -->

            <!-- 
            =============================================
                    Theme Inner Banner
            ============================================== 
            -->
            <div class="inner-banner">
                <div class="opacity">
                    <div class="container">
                        <h2>Ajouter Module</h2>
                        <ul>
                            <li><a href="index.html" class="tran3s">Accueil</a></li>
                            <li>/</li>
                            <li>Ajouter Ressource</li>
                        </ul>
                    </div> <!-- /.container -->
                </div> <!-- /.opacity -->
            </div> <!-- /.inner-banner -->



            <!-- 
            =============================================
                    Contact Form
            ============================================== 
            -->
            <div class="container contact-us-page">
                <div class="row">
                    <div class="col-md-8 col-sm-12 col-xs-12 wow fadeInLeft">
                        <div class="contact-us-form">
                            <h2>Ajouter Ressource</h2>

                            <form action="http://localhost:8080/3alemniWebsite/AjouterRessourceServlet" autocomplete="off" method="post">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="single-input">
                                            <input type="text" placeholder="Nom" name="nom">
                                        </div> <!-- /.single-input -->
                                    </div>





                                    <div class="row">
                                        <!-- /.col- -->

                                        <div class="col-sm-6 col-xs-12">
                                            <div class="single-input">
                                                <input type="hidden" name="ID" value=" <%=request.getAttribute("chapitreID")%>">
                                            </div> <!-- /.single-input -->
                                        </div> <!-- /.col- --></div>
                                    <div class="col-xs-12">
                                        <div class="single-input">
                                            <input type="file" name="pdf" accept="application/pdf">
                                        </div> <!-- /.single-input -->
                                    </div> <!-- /.col- -->
                                </div>  <!-- /.row -->

                                <div class="our-instructor">
                                    <input type="submit" value="Ajouter" class="load-more tran3s"></div>

                            </form>

                            <!-- Contact Form Validation Markup -->
                            <!-- Contact alert -->
                            <div class="alert-wrapper" id="alert-success">
                                <div id="success">
                                    <button class="closeAlert"><i class="fa fa-times" aria-hidden="true"></i></button>
                                    <div class="wrapper">
                                        <p>Your message was sent successfully.</p>
                                    </div>
                                </div>
                            </div> <!-- End of .alert_wrapper -->
                            <div class="alert-wrapper" id="alert-error">
                                <div id="error">
                                    <button class="closeAlert"><i class="fa fa-times" aria-hidden="true"></i></button>
                                    <div class="wrapper">
                                        <p>Sorry!Something Went Wrong.</p>
                                    </div>
                                </div>
                            </div> <!-- End of .alert_wrapper -->
                        </div> <!-- /.contact-us-form -->
                    </div> <!-- /.col- -->

                    <div class="col-md-4 col-sm-12 col-xs-12 wow fadeInRight">

                    </div>
                </div> <!-- /.row -->
            </div> <!-- /.container -->

            <br><br><br><br>


            <!-- 
            =============================================
                    Goolge-map
            ============================================== 
            -->
            <div>

            </div>




            <!-- 
            =============================================
                    Footer
            ============================================== 
            -->
            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-md-7 col-sm-4">
                            <div class="footer-logo">
                                <a href="index.html"><img src="images/logo/logo.jpg " width="110" height="48"  alt="Logo"></a>
                                <p>3ALEMNI EST UNE PLATEFORME EN LIGNE.</p>
                                <p>L'ÉDUCATION EST UN MOYEN DE RÉUSSIR DANS LA VIE</p>
                                <ul>
                                    <li><a href="#" class="tran3s"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                    <li><a href="#" class="tran3s"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    <li><a href="#" class="tran3s"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                                    <li><a href="#" class="tran3s"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>



                        <div class="col-md-4 col-sm-4 col-xs-4 footer-subscribe">
                            <br><br>
                            <h6>Abonnez-vous</h6>
                            <p>Cela semblait être une très bonne raison et Alice était plutôt satisfaite.</p>
                            <form action="#">
                                <input type="text" placeholder="Your Email">
                                <button class="tran3s s-bg-color"><i class="flaticon-envelope-back-view-outline" ></i></button>
                            </form>
                        </div>
                    </div> <!-- /.row -->
                </div> <!-- /.container -->

                <div class="bottom-footer">
                    <div class="container">

                        <p class="float-left">&copy; 2017 <a href="#" class="tran3s s-color">UnifyThemes</a>. All rights reserved</p>		
                    </div>
                </div> <!-- /.bottom-footer -->
            </footer>



            <!-- Sign-in Modal -->
            <div class="modal fade signInModal theme-modal-box" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">
                            <h3>Connexion avec les réseaux sociaux</h3>
                            <ul class="clearfix">
                                <li class="float-left"><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i> facebook</a></li>
                                <li class="float-left"><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i> Google</a></li>
                                <li class="float-left"><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i> Twitter</a></li>
                                <li class="float-left"><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i> Linkedin</a></li>
                            </ul>
                            <form action="http://localhost:8080/3alemniWebsite/LoginSubmitServlet" method="POST">
                                <h3>Connexion avec un compte</h3>
                                <div class="wrapper">
                                    <input type="text" placeholder="Username or Email" name="email">
                                    <input type="password" placeholder="Password" name="password">



                                    <select name="type" class="myselect">
                                        <option value="formateur" name="formateur">Formateur</option>
                                        <option  value="apprenant" name="apprenant">Apprenant</option>

                                    </select>
                                    <ul class="clearfix">
                                        <li class="float-left">
                                            <input type="checkbox" id="remember">
                                            <label for="remember">Remember Me</label>
                                        </li>
                                        <li class="float-right"><a href="#" class="s-color">Lost Your Password?</a></li>
                                    </ul>
                                    <button class="p-bg-color hvr-trim">Login</button>
                                </div>
                            </form>
                            <div><a href="sign-up.html" class="p-color tran3s">Not an account?? Sign Up</a></div>
                        </div> <!-- /.modal-body -->
                    </div> <!-- /.modal-content -->
                </div> <!-- /.modal-dialog -->
            </div> <!-- /.signInModal -->


            <!-- Scroll Top Button -->
            <button class="scroll-top tran3s">
                <i class="fa fa-angle-up" aria-hidden="true"></i>
            </button>




            <!-- Js File_________________________________ -->

            <!-- j Query -->
            <script type="text/javascript" src="vendor/jquery.2.2.3.min.js"></script>
            <!-- Bootstrap Select JS -->
            <script type="text/javascript" src="vendor/bootstrap-select/dist/js/bootstrap-select.js"></script>

            <!-- Bootstrap JS -->
            <script type="text/javascript" src="vendor/bootstrap/bootstrap.min.js"></script>

            <!-- Vendor js _________ -->
            <!-- Camera Slider -->
            <script type='text/javascript' src='vendor/Camera-master/scripts/jquery.mobile.customized.min.js'></script>
            <script type='text/javascript' src='vendor/Camera-master/scripts/jquery.easing.1.3.js'></script> 
            <script type='text/javascript' src='vendor/Camera-master/scripts/camera.min.js'></script>
            <!-- Mega menu  -->
            <script type="text/javascript" src="vendor/bootstrap-mega-menu/js/menu.js"></script>

            <!-- WOW js -->
            <script type="text/javascript" src="vendor/WOW-master/dist/wow.min.js"></script>
            <!-- owl.carousel -->
            <script type="text/javascript" src="vendor/owl-carousel/owl.carousel.min.js"></script>
            <!-- js count to -->
            <script type="text/javascript" src="vendor/Counter/jquery.counterup.min.js"></script>
            <script src="vendor/Counter/jquery.waypoints.min.js"></script>
            <!-- Validation -->
            <script type="text/javascript" src="vendor/contact-form/validate.js"></script>
            <script type="text/javascript" src="vendor/contact-form/jquery.form.js"></script>
            <!-- Google map js -->
            <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBZ8VrXgGZ3QSC-0XubNhuB2uKKCwqVaD0&amp;callback=googleMap" type="text/javascript"></script> <!-- Gmap Helper -->
            <script src="vendor/gmaps.min.js"></script>


            <!-- Theme js -->
            <script type="text/javascript" src="js/theme.js"></script>
            <script type="text/javascript" src="js/map-script.js"></script>

        </div> <!-- /.main-page-wrapper -->
    </body>

    <!-- Mirrored from themazine.com/unify/campus/contact-us.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 06 Apr 2019 19:38:40 GMT -->
</html>
