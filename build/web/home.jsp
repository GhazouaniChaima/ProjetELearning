<%-- 
    Document   : home
    Created on : 27 avr. 2019, 23:49:43
    Author     : chaima
--%>

<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
           <style>
                    .myselect{
                    width: 100%;
                    height: 55px;
                    border: 1px solid #e7e7e7;
                    padding: 0 20px;
                    border-radius: 3px;
                    margin-bottom: 20px;}
                </style>


        <!-- Fix Internet Explorer ______________________________________-->

        <!--[if lt IE 9]>
                <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
                <script src="vendor/html5shiv.js"></script>
                <script src="vendor/respond.js"></script>
        <![endif]-->



        <%
            MongoClient mongo = new MongoClient("localhost", 27017);
            DB database = mongo.getDB("eLearning");// nom BD
            DBCollection collection = database.getCollection("formateur");
            int nbFormateur = 0;
            DBCursor cursor = collection.find();

            while (cursor.hasNext()) {
                BasicDBObject object = (BasicDBObject) cursor.next();
                String id = object.getString("_id");
                if (id != null) {
                    nbFormateur = nbFormateur + 1;
                }
            }

            DBCollection collection1 = database.getCollection("formation");
            int nbFormations = 0;
            DBCursor cursor1 = collection1.find();

            while (cursor1.hasNext()) {
                BasicDBObject object = (BasicDBObject) cursor1.next();
                String id = object.getString("_id");
                if (id != null) {
                    nbFormations = nbFormations + 1;
                }
            }

            DBCollection collection2 = database.getCollection("apprenant");
            int nbapprenant = 0;
            DBCursor cursor2 = collection2.find();

            while (cursor2.hasNext()) {
                BasicDBObject object = (BasicDBObject) cursor2.next();
                String id = object.getString("_id");
                if (id != null) {
                    nbapprenant = nbapprenant + 1;
                }
            }
            
            boolean test = true ;
            Cookie[] cookies = request.getCookies();
            for (int i = 0 ;i<cookies.length;i++){
                if(cookies[i].getName().equals("alemni_compte")){
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
                        <div class="logo float-left tran4s"><a href="index.html"><img src="images/logo/logo.jpg " alt="Logo" width="110" height="48" ></a></div>

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
                                    <% if(test){ %>
                                    <li class="login"><button class="tran3s" data-toggle="modal" data-target=".signInModal" ><i class="flaticon-lock"></i>connexion</button></li>
                                    <% }else{ %>
                                    <li class="login"><button class="tran3s"  data-target=".signInModal" style="background: #28a745">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connecté</button></li>
                                    <%}%>
                                </ul>
                            </div><!-- /.navbar-collapse -->
                        </nav> <!-- /.theme-main-menu -->
                    </div> <!-- /.header-wrapper -->
                </div>
            </header> <!-- /.theme-menu-wrapper  -->

            <!-- 
            =============================================
                    Theme Main Banner
            ============================================== 
            -->
            
            
            
            <div id="theme-main-banner" class="banner-one">
                <div data-src="images/home/slide-1.jpg">
                    <div class="camera_caption">
                        <div class="container text-center">
                            <h3 class="wow fadeInUp animated">3alemni EST UNE PLATEFORME EN LIGNE</h3><br>
                            <h3 class="wow fadeInUp animated" data-wow-delay="0.2s"><b>L'éducation est un moyen de </b><span class="p-color"><b>réussir dans la vie</b></span></h3><br><br><br>
                            <% if(test){ %>
                            <a href="course-2-column.html"   data-toggle="modal" data-target=".signInModal"  class="tran3s wow fadeInLeft animated banner-button" data-wow-delay="0.3s">connexion</a>
                            <a href="http://localhost:8080/3alemniWebsite/Inscription" class="tran3s wow fadeInRight animated button-one banner-button hvr-trim" data-wow-delay="0.3s">inscription</a>
                        <% } %>
                        </div> <!-- /.container -->
                    </div> <!-- /.camera_caption -->
                </div>
                <div data-src="images/home/slide-2.jpg">
                    <div class="camera_caption">
                        <div class="container text-center">
                            <h3 class="wow fadeInUp animated">3almni EST UNE PLATEFORME EN LIGNE</h3><br>
                            <h3 class="wow fadeInUp animated" data-wow-delay="0.2s" ><b>L'éducation est un moyen de</b> <span class="p-color"><b>réussir dans la vie</b></span></h3><br><br><br>
                            <% if(test){ %>
                            <a href="course-2-column.html" class="tran3s wow fadeInLeft animated banner-button" data-wow-delay="0.3s">connexion</a>
                            <a href="http://localhost:8080/3alemniWebsite/Inscription" class="tran3s wow fadeInRight animated button-one banner-button hvr-trim" data-wow-delay="0.3s">inscription</a>
                            <% } %>
                        </div> <!-- /.container -->
                    </div> <!-- /.camera_caption -->
                </div>
            </div> <!-- /#theme-main-banner -->
            



            <!-- 
            =============================================
                    Find Course Form
            ============================================== 
            -->
            <div class="find-course">
                <div class="opacity color-one">
                    <div class="container">
                        <form action="#">
                            <div class="row">
                                <div class="col-md-9 col-xs-6">
                                    <div class="single-input">
                                        <select class="selectpicker">
                                            <option>tout les Categories</option>
                                            <option>développement web</option>
                                            <option>design</option>
                                            <option>développement Mobile</option>
                                            <option>intelligence artificielle</option>
                                            <option>commincation</option>
                                            <option>système embarqué</option>
                                        </select>
                                    </div> <!-- /.single-input -->
                                </div> <!-- /.col -->
                              
                                <!-- /.col -->
                                <div class="col-md-2 col-sm-4 col-xs-12"><button class="action-button tran3s">Chercher<i class="fa fa-search" aria-hidden="true"></i></button></div>
                            </div> <!-- /.row -->
                        </form>
                    </div> <!-- /.container -->
                </div> <!-- /.opacity -->
            </div> <!-- /.find-course -->




            <!-- 
            =============================================
                    Popular Course 
            ============================================== 
            -->
            <div class="popular-course">
                <div class="container">
                    <div class="theme-title">  
                        

                        
                    </div> <!-- /.theme-title -->
                    <div class="col-col-sm-8"></div> 
                    <div class="row">


                        <%  database = mongo.getDB("eLearning");// nom BD
                            collection = database.getCollection("formation");
                            cursor = collection.find();
                            String duree = "";
                            String nombreModule = "";
                            String description = "";
                            String discipline = "";
                            String name = "";

                            while (cursor.hasNext()) {
                                BasicDBObject object = (BasicDBObject) cursor.next();
                                String statut = object.getString("statut");
                                if (statut.equals("active")) {
                                    name = object.getString("name");

                                    duree = object.getString("duree");
                                    nombreModule = object.getString("nombreModule");
                                    description = object.getString("description");
                                    discipline = object.getString("discipline");


                        %>

                        <div class="col-md-4 hidden-sm col-xs-6 wow fadeInRight">
                            <div class="single-course">
                                <div class="image-box"><img src="images/course/3.jpg" alt=""></div>
                                <div class="text">
                                    <div class="image"><a href="teachers-profile.html" class="tran3s"><img src="images/course/6.jpg" alt=""></a></div>
                                    <div class="name clearfix">
                                        
                                        <span class="p-bg-color float-right">Free</span>
                                    </div>
                                    
                                    
                                    
                                    
                                    
                                    <form  action="http://localhost:8080/3alemniWebsite/Details_formationServlet" method="get">
                                        <input type="hidden" value="<%=object.getString("_id")%>" name="ID">
                                        <h5><button style="background: #FFF" onclick="this.form.submit()" class="tran3s"><%= name%></button></h5>    
                                    </form>
                                    
                                    
                                    <ul class="clearfix">
                                        <li class="float-left">
                                            <i class="flaticon-people"></i>
                                            <a href="#" class="tran3s">2,680</a>
                                        </li>
                                        <li class="float-left">
                                            <i class="flaticon-comments"></i>
                                            <a href="#" class="tran3s">13</a>
                                        </li>
                                        <li class="float-right">
                                            <i class="flaticon-heart"></i>
                                            <a href="#" class="tran3s">3</a>
                                        </li>
                                    </ul>
                                </div>
                            </div> <!-- /.single-course -->
                        </div> <!-- /.col- -->

                        <%
                                }
                            }


                        %>

                    </div> <!-- /.row -->
                </div> <!-- /.container -->
            </div> <!-- /.popular-course -->








            <!-- 
            =============================================
                    Registration Banner  
            ============================================== 
            -->
            <div class="registration-banner">
                <div class="opacity">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-5 col-xs-12">
                                <div class="registration-form">
                                    <form action="#">
                                        <h2>Inscrire maintenant</h2>
                                        <p>Créez votre compte et parcourez des milliers de cours !!</p>
                                        <div class="form-wrapper">

                                            <input type="text" placeholder="Nom">

                                            <input type="email" placeholder="foulen@gmail.com">

                                            <input type="text" placeholder="+216 00 000 000">
                                            <button class="tran3s hvr-trim">inscription</button>
                                        </div> <!-- /.form-wrapper -->
                                    </form>
                                </div> <!-- /.registration-form -->
                            </div>

                            <div class="col-md-7 col-xs-12">
                                <div class="text-wrapper">

                                    <h2> Nous avons plus <span class="p-color">28,690+ étudiants</span> fréquentant actuellement la plateforme 3alemni </h2>

                                    <ul class="clearfix">
                                        <li class="float-left">
                                            <div class="single-box">
                                                <h3><span class="counter"><%= nbFormations%></span></h3>
                                                <p>formations</p>
                                            </div> <!-- /.single-box -->
                                        </li>
                                        <li class="float-left">
                                            <div class="single-box">
                                                <h3><span class="counter"><%= nbFormateur%></span></h3>
                                                <p>Fomateurs</p>
                                            </div> <!-- /.single-box -->
                                        </li>
                                        <li class="float-left">
                                            <div class="single-box">
                                                <h3><span class="counter"><%= nbapprenant%></span></h3>
                                                <p>Clients</p>
                                            </div> <!-- /.single-box -->
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div> <!-- /.row -->
                    </div> <!-- /.container -->
                </div> <!-- /.opacity -->
            </div> <!-- /.registration-banner -->






            <!-- 
            =============================================
                    Find Course Block
            ============================================== 
            -->
            <div class="find-course-block">
                <div class="container">
                    <div class="theme-title text-center">

                        <h2>choisissez votre formations</h2>
                    </div> <!-- /.theme-title -->
                    <div class="clearfix">
                        <div class="single-block float-left tran3s">
                            <i  class="flaticon-data" ></i>
                            <h5>développement web</h5>
                            <p>HTML5, CSS4, BOOTSTRAP, JAVASCRIPT, PHP, J2EE, ASP.NET, ANGULAR, SYMPHONY, LARAVEL, SPRING, HIBERNATE</p>
                            <a href="event-grid.html" class="tran3s"><i class="flaticon-arrows"></i></a>
                        </div> <!-- /.single-block -->
                        <div class="single-block float-left tran3s">
                            <i class="flaticon-design"></i>
                            <h5>design</h5>
                            <p>PHOTOSHOP, UNITY, ILLUSTRATOR, GIMP, AFTER EFFECT, 3DS MAX, MATERIAL DESIGN, INDESIDN</p>
                            <a href="event-grid.html" class="tran3s"><i class="flaticon-arrows"></i></a>
                        </div> <!-- /.single-block -->
                        <div class="single-block float-left tran3s">
                            <i class="flaticon-phone"></i>
                            <h5>développement Mobile</h5>
                            <p>ANDROID STUDIO, NATIVE SCRIPT, FLATTER, XCODE, SWIFT, IONIC, XAMARIN, REACT, CORDOVA</p>
                            <a href="event-grid.html" class="tran3s"><i class="flaticon-arrows"></i></a>
                        </div> <!-- /.single-block -->
                        <div class="single-block float-left tran3s">
                            <i class="flaticon-brain"></i>
                            <h5>intelligence artificielle</h5>
                            <p>MACHINE LEARNING, DEEP LERNING, DATA SCIENCE, CHATBOT, SPEECH TO TEXT, TENSORFLOW, AZURE ML, IBM WATSON</p>
                            <a href="event-grid.html" class="tran3s"><i class="flaticon-arrows"></i></a>
                        </div> <!-- /.single-block -->
                        <div class="single-block float-left tran3s">
                            <i class="flaticon-question"></i>
                            <h5>commincation </h5>
                            <p>Communication verbale, non verbales, écrite, Communication face à face, Communication orale, Paralangage</p>
                            <a href="event-grid.html" class="tran3s"><i class="flaticon-arrows"></i></a>
                        </div> <!-- /.single-block -->
                        <div class="single-block float-left tran3s">
                            <i class="flaticon-circuit"></i>
                            <h5>système embarqué</h5>
                            <p>IoT, ARDUINO, RASPBERRY PI, ISIS, MATLAB, MP LAB, ASSEMBLEUR, SMT32, LabVIEW, KEIL, PSPICE  </p>
                            <a href="event-grid.html" class="tran3s"><i class="flaticon-arrows"></i></a>
                        </div> <!-- /.single-block -->
                    </div>
                </div> <!-- /.container -->
            </div> <!-- /.find-course-block -->





            <!-- 
            =============================================
                    Theme Counter Section
            ============================================== 
            -->
            <div class="theme-counter">
                <div class="count-particles">
                    <span class="js-count-particles">--</span>
                </div>
                <div id="particles-js"></div>
                <div class="opacity">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-4 col-xs-6">
                                <h3><span class="counter"><%= nbFormations%></span>+</h3>
                                <p>formations</p>
                            </div>
                            <div class="col-sm-4 col-xs-6">
                                <h3><span class="counter"><%= nbFormateur%></span>+</h3>
                                <p>Fomateurs</p>
                            </div>
                            <div class="col-sm-4 col-xs-6">
                                <h3><span class="counter"><%= nbapprenant%></span>+</h3>
                                <p>Clients</p>
                            </div>

                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.opacity -->
            </div> <!-- /.theme-counter -->





            <!-- 
            =============================================
                    Testimonial Style One
            ============================================== 
            -->
            <div class="testimonial-styleOne">
                <div class="container">
                    <div class="theme-title text-center">
                        <h2>Témoignages</h2>
                        <p>Encore besoin de convaincre? Découvrez ce que les gens disent à propos de Singleton. </p>
                    </div> <!-- /.theme-title -->

                    <div id="testimonial-carousel-one" class="carousel slide" data-ride="carousel" data-interval="5000">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#testimonial-carousel-one" data-slide-to="0" class="active tran3s" title="Jenna Simpson"><img src="images/home/4.jpg" alt=""></li>
                            <li data-target="#testimonial-carousel-one" data-slide-to="1" class="tran3s" title="Mahfuz Riad"><img src="images/home/5.jpg" alt=""></li>
                            <li data-target="#testimonial-carousel-one" data-slide-to="2" class="tran3s" title="Rashed Ka."><img src="images/home/6.jpg" alt=""></li>
                            <li data-target="#testimonial-carousel-one" data-slide-to="3" class="tran3s" title="Foqrul Munna"><img src="images/home/7.jpg" alt=""></li>
                            <li data-target="#testimonial-carousel-one" data-slide-to="4" class="tran3s" title="Zubayer Hasan"><img src="images/home/6.jpg" alt=""></li>
                            <li data-target="#testimonial-carousel-one" data-slide-to="5" class="tran3s" title="Rashed Ka."><img src="images/home/8.jpg" alt=""></li>
                        </ol>

                        <div class="main-wrapper">
                            <div class="shadow"></div>
                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img src="images/home/4.jpg" alt="">
                                    <h6>Jenna Simpson</h6>
                                    <span>Dropbox</span>
                                    <p>As we passed, I remarked a beautiful church-spire rising above some old elms in the park; and before them, in the midst of a lawn, and some outhouses, an old red house with tall chimneys covered with ivy, and the windows shining in the sun.</p>
                                </div>

                                <div class="item">
                                    <img src="images/home/5.jpg" alt="">
                                    <h6>Mahfuz Riad</h6>
                                    <span>Google</span>
                                    <p>As we passed, I remarked a beautiful church-spire rising above some old elms in the park; and before them, in the midst of a lawn, and some outhouses, an old red house with tall chimneys covered with ivy, and the windows shining in the sun.</p>
                                </div>

                                <div class="item">
                                    <img src="images/home/6.jpg" alt="">
                                    <h6>Rashed ka.</h6>
                                    <span>Mega Nz</span>
                                    <p>As we passed, I remarked a beautiful church-spire rising above some old elms in the park; and before them, in the midst of a lawn, and some outhouses, an old red house with tall chimneys covered with ivy, and the windows shining in the sun.</p>
                                </div>

                                <div class="item">
                                    <img src="images/home/7.jpg" alt="">
                                    <h6>Foqrul Munna</h6>
                                    <span>Upwork</span>
                                    <p>As we passed, I remarked a beautiful church-spire rising above some old elms in the park; and before them, in the midst of a lawn, and some outhouses, an old red house with tall chimneys covered with ivy, and the windows shining in the sun.</p>
                                </div>

                                <div class="item">
                                    <img src="images/home/6.jpg" alt="">
                                    <h6>Zubayer Hasan</h6>
                                    <span>Envato</span>
                                    <p>As we passed, I remarked a beautiful church-spire rising above some old elms in the park; and before them, in the midst of a lawn, and some outhouses, an old red house with tall chimneys covered with ivy, and the windows shining in the sun.</p>
                                </div>

                                <div class="item">
                                    <img src="images/home/8.jpg" alt="">
                                    <h6>Rashed Ka.</h6>
                                    <span>Mega Nz</span>
                                    <p>As we passed, I remarked a beautiful church-spire rising above some old elms in the park; and before them, in the midst of a lawn, and some outhouses, an old red house with tall chimneys covered with ivy, and the windows shining in the sun.</p>
                                </div>
                            </div> <!-- /.carousel-inner -->

                            <!-- Left and right controls -->
                            <a class="left carousel-control" href="#testimonial-carousel-one" data-slide="prev">
                                <i class="fa fa-chevron-left" aria-hidden="true"></i>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#testimonial-carousel-one" data-slide="next">
                                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                                <span class="sr-only">Next</span>
                            </a>
                        </div> <!-- /.main-wrapper -->
                    </div> <!-- /#testimonial-carousel-one -->
                </div> <!-- /.container -->
            </div> <!-- /.testimonial-styleOne -->


            <!-- 
            =============================================
                    Our Blog
            ============================================== 
            -->
      









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
                            <h3>Connexion avec un compte</h3>
                            <hr>
                            <form action="http://localhost:8080/3alemniWebsite/LoginSubmitServlet" method="POST">

                                <div class="wrapper">
                                    <input type="text" placeholder="Email" name="email">
                                    <input type="password" placeholder="Mot de passe" name="password">



                                    <select name="type" class="myselect">
                                        <option value="formateur" name="formateur">Formateur</option>
                                        <option  value="apprenant" name="apprenant">Apprenant</option>

                                    </select>
                                    <ul class="clearfix">
                                        <li class="float-left">
                                            <input type="checkbox" id="remember">
                                            <label for="remember">Remember Me</label>
                                        </li>
                                        <li class="float-right"><a href="#" class="s-color">Mot de passe perdu?</a></li>
                                    </ul>
                                    <div class="our-instructor">
                                        <input type="submit" value="Connexion" class="load-more tran3s"></div>

                                </div>
                            </form>
                            <div><a href="sign-up.html" class="p-color tran3s">Pas un compte ?? S'inscrire</a></div>
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
            <!-- partical Js -->
            <script type="text/javascript" src="vendor/particles.js-master/particles.min.js"></script>
            <script type="text/javascript" src="vendor/particles.js-master/demo/js/lib/stats.js"></script>
            <script type="text/javascript" src="vendor/particles.js-master/demo/js/app.js"></script>

            <!-- Theme js -->
            <script type="text/javascript" src="js/theme.js"></script>

        </div> <!-- /.main-page-wrapper -->
    </body>

    <!-- Mirrored from themazine.com/unify/campus/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 06 Apr 2019 19:35:23 GMT -->
</html>
