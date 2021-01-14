<%-- 
    Document   : show_formateurs
    Created on : 19 avr. 2019, 13:16:34
    Author     : chaima
--%>

<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from themazine.com/unify/campus/our-teacher.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 06 Apr 2019 19:36:46 GMT -->
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
                        <div class="logo float-left tran4s"><a href="http://localhost:8080/3alemniWebsite/"><img src="images/logo/logo.jpg" width="110" height="48" alt="Logo"></a></div>

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
                        <h2>Fomateurs</h2>
                        <ul>
                            <li><a href="http://localhost:8080/3alemniWebsite/" class="tran3s">Accueil</a></li>
                            <li>/</li>
                            <li><a href="#">Fomateurs</a></li>

                        </ul>
                    </div> <!-- /.container -->
                </div> <!-- /.opacity -->
            </div> <!-- /.inner-banner -->



            <!-- 
            =============================================
                    Our Instructors
            ============================================== 
            -->
            <div class="our-instructor">
                <div class="container">
                    <div class="row">
                        <div class="clearfix">
                            <%
                                MongoClient mongo = new MongoClient("localhost", 27017);

                                DB database = mongo.getDB("eLearning");// nom BD
                                DBCollection collection = database.getCollection("formateur");
                                DBCursor cursor = collection.find();

                                while (cursor.hasNext()) {
                                    BasicDBObject object = (BasicDBObject) cursor.next();
                                    String statut = object.getString("statut");
                                    if (statut.equals("active")) {
                                        String name = object.getString("name");
                                        String email = object.getString("email");
                            %>


                            <div class="col-md-3 col-sm-4 col-xs-6">
                                <div class="single-member">
                                    <div class="image">
                                        <img src="images/team/1.jpg" alt="">
                                        <div class="opacity tran4s">
                                            <ul>
                                                <li><a href="#" class="tran3s"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                                <li><a href="#" class="tran3s"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                                <li><a href="#" class="tran3s"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </div> <!-- /.image -->
                                    </div>

                                    <form  action="http://localhost:8080/3alemniWebsite/ShowProfileFormateurServlet" method="get">
                                        <input type="hidden" value="<%=object.getString("_id")%>" name="ID">
                                        <br>  <div align="center"><h5><button  style="background: #FFF" onclick="this.form.submit()" class="tran3s"><b> <%= name%></b></button></h5></div>
                                    </form>

                                    
                                </div> <!-- /.single-member -->
                            </div> <!-- /.col- -->
                            <%
                                    }
                                }


                            %>






                        </div> <!-- /.instructor-slider -->
                    </div> <!-- /.row -->
                    <br><br><br>
                </div> <!-- /.container -->
            </div> <!-- /.our-instructor -->




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

            <!-- Theme js -->
            <script type="text/javascript" src="js/theme.js"></script>

        </div> <!-- /.main-page-wrapper -->
    </body>

    <!-- Mirrored from themazine.com/unify/campus/our-teacher.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 06 Apr 2019 19:36:46 GMT -->
</html>
