<%-- 
    Document   : show_formations
    Created on : 19 avr. 2019, 13:15:25
    Author     : chaima
--%>

<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from themazine.com/unify/campus/course-grid.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 06 Apr 2019 19:36:07 GMT -->
    <head>
        <meta charset="UTF-8">
        <!-- For IE -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- For Resposive Device -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>3lemni</title>

        <!-- Favicon -->
        <link rel="icon" type="image/png" sizes="56x56" href="images/fav-icon/icon.png">
        <link rel="icon" type="image/png" sizes="56x56" href="images/fav-icon/icon.png">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


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
          <%            boolean test = true;
                String type = "";
                Cookie[] cookies = request.getCookies();
                for (int i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equals("alemni_compte")) {
                        test = false;

                    }
                    if (cookies[i].getName().equals("type_compte")) {
                        type = cookies[i].getValue();
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
                                <ul class="nav">
                                    <li><a href="http://localhost:8080/3alemniWebsite/" class="tran3s">Accueil</a></li>
                                    <li><a href="http://localhost:8080/3alemniWebsite/ShowFormationServlet" class="tran3s">Formations</a></li>
                                    <li><a href="http://localhost:8080/3alemniWebsite/ShowFormateursServlet" class="tran3s">Fomateurs</a></li>
                                    <li><a href="http://localhost:8080/3alemniWebsite/contactServlet" class="tran3s">Contact Us</a></li>


                                    <% if (test) { %>
                                    <li class="login"><button class="tran3s" data-toggle="modal" data-target=".signInModal" ><i class="flaticon-lock"></i>connexion</button></li>
                                        <% } else { %>
                                    <li class="login"><button class="tran3s"  data-target=".signInModal" style="background: #28a745">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connecté</button></li>
                                    <%}%>	                              
                                </ul>
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
                        <h2>Formations</h2>
                        <ul>
                            <li><a href="index.html" class="tran3s">Accueil</a></li>
                            <li>/</li>
                            <li>Formations</li>
                        </ul>
                    </div> <!-- /.container -->
                </div> <!-- /.opacity -->
            </div> <!-- /.inner-banner -->


            <!-- 
            =============================================
                    Our Course
            ============================================== 
            -->
            <div class="our-course course-grid">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9 col-md-8 col-xs-12 popular-course float-right">
                            <div class="course-style-filter clearfix">

                                <ul class="float-right">
                                    <li><a href="http://localhost:8080/3alemniWebsite/ShowFormationServlet" class="tran3s active"><i class="fa fa-th-large" aria-hidden="true"></i></a></li>
                                    <li><a href="http://localhost:8080/3alemniWebsite/ShowListeFormationsServlet" class="tran3s"><i class="fa fa-list" aria-hidden="true"></i></a></li>
                                    
                                     <% if (type.equals("formateur")) {%>
                                    <li><a href="http://localhost:8080/3alemniWebsite/ajoutFormation" class="tran3s"><i class="fa fa-plus-circle" aria-hidden="true"></i></a></li>
                                <% }%>
                                </ul>
                            </div>
                            <div class="row">
                                <%
                                    MongoClient mongo = new MongoClient("localhost", 27017);
                                    DB database = mongo.getDB("eLearning");// nom BD
                                    DBCollection collection = database.getCollection("formation");
                                    DBCursor cursor = collection.find();
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


                                <%  if (request.getAttribute("req")!=null){
                                   if(name.toLowerCase().contains(request.getAttribute("req").toString().toLowerCase())){                                        
                                    %>
                                <div class="col-lg-4 col-sm-6 col-xs-6">
                                    <div class="single-course">
                                        <div class="image-box"><img src="images/course/14.jpg" alt=""></div>
                                        <div class="text">
                                            <% String id_formateur = object.getString("Formateur");
                                                DBCollection collection2 = database.getCollection("fs.files");
                                                DBCursor cursor2 = collection2.find();
                                                while (cursor2.hasNext()) {
                                        BasicDBObject object2 = (BasicDBObject) cursor2.next();
                                        String formateur = object2.getString("ID");
                                        if(formateur != null){
                                        if (formateur.equals(id_formateur)) {
                                            String filename = object2.getString("filename");
                                            %>
                                            <div class="image"><img src="<%=filename%>" alt=""></div>
                                            <%
                                        }}}
                                            %>
                                            
                                            
                                            <div class="name clearfix">
                                               

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
                                </div>
                                            <% }
                                }else{%>
                                
                                <div class="col-lg-4 col-sm-6 col-xs-6">
                                    <div class="single-course">
                                        <div class="image-box"><img src="images/course/14.jpg" alt=""></div>
                                        <div class="text">
                                             <% String id_formateur = object.getString("Formateur");
                                                DBCollection collection2 = database.getCollection("fs.files");
                                                DBCursor cursor2 = collection2.find();
                                                while (cursor2.hasNext()) {
                                        BasicDBObject object2 = (BasicDBObject) cursor2.next();
                                        String formateur = object2.getString("ID");
                                        if(formateur != null){
                                        if (formateur.equals(id_formateur)) {
                                            String filename = object2.getString("filename");
                                            %>
                                            <div class="image"><img src="<%=filename%>" alt=""></div>
                                            <%
                                        } }}
                                            %>
                                            <div class="name clearfix">
                                                

                                            </div>
                                            <form  action="http://localhost:8080/3alemniWebsite/Details_formationServlet" method="get"><br>
                                                <b><input type="hidden" value="<%=object.getString("_id")%>" name="ID"></b>

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
                                </div>            
                                <%                                                                                              }
}    }


                                %>






                            </div> <!-- /.row -->
                            <ul class="theme-pagination clearfix">
                                <li><a href="#" class="tran3s active">1</a></li>
                                <li><a href="#" class="tran3s">2</a></li>
                                <li><a href="#" class="tran3s">3</a></li>
                                <li><a href="#" class="tran3s">Next</a></li>
                            </ul> <!-- /.theme-pagination -->
                        </div> <!-- /.popular-course -->

                        <!-- ************************* SIDEBAR ***************************** -->
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12  theme-sidebar">

                            <form action="http://localhost:8080/3alemniWebsite/SearchServlet" class="sidebar-search" method="get">
                                <input type="text" placeholder="Search" name="req">
                                <button class="tran3s" onclick="this.form.submit()"><i class="flaticon-search"></i></button>
                            </form>
                            <div class="sidebar-categories">
                                <h4>Categories</h4>
                                <ul>
                                    <li><a href="#" class="tran3s">Développement web</a></li>
                                    <li><a href="#" class="tran3s">Design</a></li>
                                    <li><a href="#" class="tran3s">Développement Mobile</a></li>
                                    <li><a href="#" class="tran3s">Intelligence artificielle</a></li>
                                    <li><a href="#" class="tran3s">Commincation</a></li>
                                    <li><a href="#" class="tran3s">système embarqué</a></li>

                                </ul>
                            </div> <!-- /.sidebar-categories -->
                            <div class="sidebar-recent-news">
                                <h4>Formation le plus Recent</h4>
                                <ul>
                                    <li class="single-news clearfix">
                                        <img src="images/blog/4.jpg" alt="" class="post float-left">

                                        <div class="post float-left">

                                            <p><a href="blog-details.html" class="tran3s"><i class="fa fa-clock-o" aria-hidden="true"></i><%=name%></a></p>
                                        </div> <!-- /.post -->
                                    </li>
                                    <li class="single-news clearfix">
                                        <img src="images/blog/5.jpg" alt="" class="post float-left">
                                        <div class="post float-left">

                                            <p><a href="blog-details.html" class="tran3s"><i class="fa fa-clock-o" aria-hidden="true"></i> 10 Apr, 2016</a></p>
                                        </div> <!-- /.post -->
                                    </li>
                                    <li class="single-news clearfix">
                                        <img src="images/blog/6.jpg" alt="" class="post float-left">
                                        <div class="post float-left">

                                            <p><a href="blog-details.html" class="tran3s"><i class="fa fa-clock-o" aria-hidden="true"></i> 10 Apr, 2016</a></p>
                                        </div> <!-- /.post -->
                                    </li>
                                </ul>
                            </div><!-- /.sidebar-recent-news -->
                            <!-- /.sidebar-keyword -->
                        </div> <!-- /.col- -->
                    </div> <!-- /.row -->
                </div> <!-- /.container -->
            </div> <!-- /.our-course -->



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
            <!-- js ui -->
            <script src="vendor/jquery-ui/jquery-ui.min.js"></script>

            <!-- Theme js -->
            <script type="text/javascript" src="js/theme.js"></script>

        </div> <!-- /.main-page-wrapper -->
    </body>

    <!-- Mirrored from themazine.com/unify/campus/course-grid.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 06 Apr 2019 19:36:19 GMT -->
</html>