<%-- 
    Document   : detail_formation
    Created on : 26 avr. 2019, 23:09:43
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

    <!-- Mirrored from themazine.com/unify/campus/course-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 06 Apr 2019 19:36:30 GMT -->
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
            MongoClient mongo = new MongoClient("localhost", 27017);
            DB database = mongo.getDB("eLearning");// nom BD
            DBCollection collection = database.getCollection("formation");
            DBCursor cursor = collection.find();
            String duree = "";
            String nombreModule = "";
            String description = "";
            String discipline = "";
            String name = "";
            BasicDBObject object;
            while (cursor.hasNext()) {
                object = (BasicDBObject) cursor.next();
                String ID = object.getString("_id");
                if (ID.equals(request.getAttribute("ID"))) {
                    name = object.getString("name");

                    duree = object.getString("duree");
                    nombreModule = object.getString("nombreModule");
                    description = object.getString("description");
                    discipline = object.getString("discipline");
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
                                    <%}%>	                                </ul>
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
                        <h2><%=name%></h2>
                        <ul>
                            <li><a href="index.html" class="tran3s">Accueil</a></li>
                            <li>/</li>
                            <li>Formations</li>
                            <li>/</li>
                            <li>détails formation</li>
                        </ul>
                    </div> <!-- /.container -->
                </div> <!-- /.opacity -->
            </div> <!-- /.inner-banner -->


            <!-- 
            =============================================
                    Course Details
            ============================================== 
            -->
            <div class="course-details">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-xs-12">
                            <div class="details-wrapper">

                                <div class="course-title">
                                    <h2><%=name%></h2>
                                    
                                </div> <!-- /.course-title -->
                                <div class="course-info row">
                                    <div class="col-xs-4">
                                        <div>
                                            <i class="flaticon-time"></i>
                                            <p>Durée</p>
                                            <b><%=duree%></b>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div>
                                            <i class="flaticon-bookmark"></i>
                                            <p>Discipline</p>
                                            <b><%=discipline%></b>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div>
                                            <i class="flaticon-star"></i>
                                            <p><b>4.5</b> (23)</p>
                                            <ul>
                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                <li><i class="fa fa-star-half-o" aria-hidden="true"></i></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div> <!-- /.course-info -->
                                <img src="images/course/29.jpg" alt="">
                                <p class="p1"><%=description%></p>


                                <div class="curriculum-panel">
                                    <div class="clearfix">
                                        <h3 class="float-left">Curriculum</h3>

                                    </div>
                                    <div class="panel-group theme-accordion" id="accordionTwo">



                                        <%
                                            mongo = new MongoClient("localhost", 27017);
                                            database = mongo.getDB("eLearning");// nom BD
                                            collection = database.getCollection("module");
                                            cursor = collection.find();

                                            String nom = "";

                                            while (cursor.hasNext()) {
                                                object = (BasicDBObject) cursor.next();

                                                String id_form = object.getString("formationID");
                                                nom = object.getString("nom");
                                                if (id_form.equals(" " + request.getAttribute("ID").toString())) {
                                                    String id_module = object.getString("_id");
                                        %>            


                                        <div class="panel">
                                            <div class="panel-heading active-panel">
                                                <h5 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordionTwo" href="#collapse11" class="clearfix">
                                                        <h4 class="float-left">
                                                            <%=nom%>
                                                        </h4>
                                                    </a>
                                                </h5>
                                            </div>
                                            <div id="collapse11" class="panel-collapse collapse in">
                                                <div class="panel-body">
                                                    <ul>

                                                        <%

                                                            DBCollection collection1 = database.getCollection("chapitre");
                                                            DBCursor cursor1 = collection1.find();
                                                            nom = "";
                                                            while (cursor1.hasNext()) {
                                                                object = (BasicDBObject) cursor1.next();
                                                                String id_form1 = object.getString("moduleID");
                                                                String nomChapitre = object.getString("nom");
                                                                if (id_form1.equals(id_module)) {
                                                                    String id_chap = object.getString("_id");
                                                        %>
                                                        <li class="clearfix">
                                                            <span class="float-left"><a href="#" class="tran3s"><i class="fa fa-file-text-o" aria-hidden="true"></i><%=nomChapitre%></a></span>
                                                            <span class="float-right">


                                                                <% if (type.equals("formateur")) {%>
                                                                <form action="http://localhost:8080/3alemniWebsite/AjouterRessourceServlet" method="get">
                                                                    <input type="hidden" name="chapID" value="<%=object.getString("_id")%>">


                                                                    <button onclick="this.form.submit()"style="background: #ffffff">
                                                                        <i class="fa fa-plus-circle" aria-hidden="true">&nbsp;Resource</i>
                                                                    </button>


                                                                </form>

                                                                <% } %> 


                                                            </span><br>
                                                            <%

                                                                DBCollection collection2 = database.getCollection("resource");
                                                                DBCursor cursor2 = collection2.find();
                                                                nom = "";
                                                                while (cursor2.hasNext()) {
                                                                    object = (BasicDBObject) cursor2.next();
                                                                    String id_form2 = object.getString("chpitreID");
                                                                    String nomResource = object.getString("nom");
                                                                    if (id_form2.equals(" " + id_chap)) {
                                                            %>
                                                            <span class="float-left"><a href="#" class="tran3s"><i class="fa fa-upload" aria-hidden="true">&nbsp;<%=nomResource%></i>&nbsp;&nbsp;&nbsp;&nbsp;</a></span>
                                                            <%}
                                                                } %> 
                                                        </li>

                                                        <% }
                                                            } %>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div> <!-- /panel 1 -->


                                        <%}
                                            }%>


                                    </div> <!-- end #accordionTwo -->
                                </div> <!-- End of .curriculum-panel -->

                                <div class="course-feedback">

                                    <div class="single-review clearfix">
                                        <img src="images/course/30.jpg" alt="" class="float-left">
                                        <div class="text float-left">
                                            <div class="clearfix">
                                                <div class="float-left">
                                                    <h6>Marie Karles</h6>
                                                    <span>March 8, 2016 - 8:00am</span>
                                                </div>
                                                <ul class="float-right">
                                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                </ul>
                                            </div> <!-- /.clearfix -->
                                            <p>Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium, totamru rem aperiam, eaque ipsa quae ab illo inventore</p>
                                        </div> <!-- /.text -->
                                    </div> <!-- /.single-review -->
                                    <div class="single-review clearfix">
                                        <img src="images/course/31.jpg" alt="" class="float-left">
                                        <div class="text float-left">
                                            <div class="clearfix">
                                                <div class="float-left">
                                                    <h6>Jubayer Al Hasan</h6>
                                                    <span>March 8, 2016 - 8:00am</span>
                                                </div>
                                                <ul class="float-right">
                                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                </ul>
                                            </div> <!-- /.clearfix -->
                                            <p>Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium, totamru rem aperiam, eaque ipsa quae ab illo inventore</p>
                                        </div> <!-- /.text -->
                                    </div> <!-- /.single-review -->
                                    <div class="single-review clearfix">
                                        <img src="images/course/32.jpg" alt="" class="float-left">
                                        <div class="text float-left">
                                            <div class="clearfix">
                                                <div class="float-left">
                                                    <h6>Rashed Ka.</h6>
                                                    <span>March 8, 2016 - 8:00am</span>
                                                </div>
                                                <ul class="float-right">
                                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                </ul>
                                            </div> <!-- /.clearfix -->
                                            <p>Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium, totamru rem aperiam, eaque ipsa quae ab illo inventore</p>
                                        </div> <!-- /.text -->
                                    </div> <!-- /.single-review -->
                                </div> <!-- /.course-feedback -->

                                <div class="submit-review-form">
                                    <h3>Soumettre un commentaire</h3>

                                    <form action="#">
                                        <div class="row">

                                        </div>
                                        <textarea placeholder="Ecrire un commentaire ..."></textarea>
                                        <input type="submit" value="Enregistrer" class="s-bg-color">
                                    </form>
                                </div> <!-- /.submit-review-form -->
                            </div> <!-- /.details-wrapper -->
                        </div> <!-- /.col- -->

                        <!-- ************************* SIDEBAR ***************************** -->
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="course-sidebar">
                                <div class="sidebar-course-information">
                                    <ul class="price clearfix">
                                        <li class="float-left"><strong class="s-color"><del>119. <sup>99</sup></del>$79<sup>.99</sup></strong></li>
                                        <li class="float-right"><a href="#" class="tran3s"><i class="flaticon-like"></i></a></li>
                                    </ul>
                                    <ul class="info-list row">
                                        <li class="col-xs-6"><b>Lectures :</b> 9</li>
                                        <li class="col-xs-6"><b>Skill :</b> begainer</li>
                                        <li class="col-xs-6"><b>Language :</b> English</li>
                                        <li class="col-xs-6"><b>Duration :</b> <%=duree%></li>
                                    </ul>
                                    <div>
                                        <ul class="clearfix student-image">
                                            <li><img src="images/course/24.jpg" alt=""></li>
                                            <li><img src="images/course/25.jpg" alt=""></li>
                                            <li><img src="images/course/26.jpg" alt=""></li>
                                            <li><img src="images/course/27.jpg" alt=""></li>
                                            <li>
                                                <div class="image">
                                                    <img src="images/course/24.jpg" alt="">
                                                    <div class="opacity">150+</div>
                                                </div>
                                            </li>
                                        </ul>

                                        <h5><button data-toggle="modal" data-target=".signInModal1"  style="background: #FFF" class="tran3s">Etudiants participent</button></h5><br><br> 
                                    </div>

                                    
                                    

                                    <!-- Sign-in Modal -->
                                    <div class="modal fade signInModal1 theme-modal-box" role="dialog">
                                        <div class="modal-dialog">
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-body">
                                                    <h3>Etudiants participent</h3>
                                                    <hr>
                                                    <%
                                                        mongo = new MongoClient("localhost", 27017);
                                                        database = mongo.getDB("eLearning");// nom BD
                                                        collection = database.getCollection("participation");
                                                        DBCursor cursor2 = collection.find();

                                                        nom = "";

                                                        while (cursor2.hasNext()) {
                                                            object = (BasicDBObject) cursor2.next();

                                                            String id_form = object.getString("formation_id");
                                                            
                                                            if (id_form.equals(request.getAttribute("ID").toString())) {
                                                                String compte_id = object.getString("compte_id");
                                                                DBCollection collection1 = database.getCollection("apprenant");
                                                                DBCursor cursor1 = collection1.find();
            while (cursor1.hasNext()) {
                    object = (BasicDBObject) cursor1.next();

                    String idbd = object.getString("_id");

                    if (idbd.equals(compte_id)) {
                        nom = object.getString("name");
                                                    %>
                                                    <p><b><%=nom%></b></p>

                                                    <% break;
                                                            }

                                                        }
                                                        DBCollection collection2 = database.getCollection("formateur");
                                                        DBCursor cursor3 = collection2.find();
                                                        while (cursor3.hasNext()) {
                                                            object = (BasicDBObject) cursor3.next();

                                                            String idbd = object.getString("_id");

                                                            if (idbd.equals(compte_id)) {
                                                                nom = object.getString("name");
                                                    %>
                                                                   <p><b><%=nom%></b></p>
                                                    <%
                                                                                   }
                                                                               }
                                                                           }
                                                                       }%>
                                                </div> <!-- /.modal-body -->
                                            </div> <!-- /.modal-content -->
                                        </div> <!-- /.modal-dialog -->
                                    </div> <!-- /.signInModal -->




                                    <form method="post" action="http://localhost:8080/3alemniWebsite/ParticiperServlet">
                                        <input type="hidden" name="ID" value="<%= request.getAttribute("ID")%>">
                                        <button onclick="this.form.submit()" class="tran3s s-bg-color take-course hvr-trim">participer</button>
                                    </form>



                                </div> <!-- /.sidebar-course-information -->

                                <div class="sidebar-instructor-info">
                                    <h4>Instructor Info</h4>
                                    <div class="wrapper">
                                        <div class="name">
                                            <img src="images/course/28.jpg" alt="">
                                            <h6>Jannatul Fa.</h6>
                                            <span>Senior Java Developer</span>
                                            <ul>
                                                <li><a href="#" class="tran3s"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                                <li><a href="#" class="tran3s"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                                <li><a href="#" class="tran3s"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </div> <!-- /.name -->
                                        <p>Lorem ipsum dolor sit amet, duo vide etiam periculis ei, ius inumian lorem iuvaret. Cum nemro assum copiosae despite</p>
                                        <a href="#" class="tran3s p-bg-color follow hvr-trim">Follow Now</a>
                                    </div> <!-- /.wrapper -->
                                </div> <!-- /.sidebar-instructor-info -->

                                <div class="sidebar-categories">


                                    <div class="sidebar-course-information">
                                        <h4>Modules</h4>




                                        <% if (type.equals("formateur")) {%>
                                        <form action="http://localhost:8080/3alemniWebsite/AjoutModuleServlet" method="get">
                                            <input type="hidden" value="<%=request.getAttribute("ID")%>" name="ID">
                                            <button href="" class="tran3s s-bg-color take-course hvr-trim" onclick="this.form.submit()">
                                                <i class="fa fa-plus-circle" aria-hidden="true"></i> Ajouter Modules</button>
                                        </form>
                                        <% } %>



                                    </div>
                                    <div class="panel-group theme-accordion" id="accordion">


                                        <%
                                            mongo = new MongoClient("localhost", 27017);
                                            database = mongo.getDB("eLearning");// nom BD
                                            collection = database.getCollection("module");
                                            cursor = collection.find();

                                            nom = "";

                                            while (cursor.hasNext()) {
                                                object = (BasicDBObject) cursor.next();

                                                String id_form = object.getString("formationID");
                                                nom = object.getString("nom");
                                                if (id_form.equals(" " + request.getAttribute("ID").toString())) {
                                                    String id_module = object.getString("_id");
                                        %>



                                        <div class="panel">
                                            <div class="panel-heading">
                                                <h6>
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                                                        <table>

                                                            <tr>
                                                                <td>
                                                                    <%= nom%>  
                                                                </td>
                                                                <td>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                </td>
                                                                <td>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                </td>
                                                                <td>


                                                                    <% if (type.equals("formateur")) {%>
                                                                    <form action="http://localhost:8080/3alemniWebsite/AjouterChapitreServlet" method="get">
                                                                        <input type="hidden" name="ID" value="<%=id_module%>">
                                                                        <button onclick="this.form.submit()" style="background: #ffffff;" ><i class="fa fa-plus-circle" aria-hidden="true">Chapitre</i></button>
                                                                    </form>
                                                                    <% } %>   


                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </a>
                                                </h6>

                                            </div>






                                        </div> <!-- /panel 2 -->



                                        <%   }
                                            }%>

                                    </div> <!-- end #accordion -->
                                </div> <!-- /.sidebar-categories -->
                            </div> <!-- /.course-sidebar -->
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
                            <h3>Login with Social Networks</h3>
                            <ul class="clearfix">
                                <li class="float-left"><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i> facebook</a></li>
                                <li class="float-left"><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i> Google</a></li>
                                <li class="float-left"><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i> Twitter</a></li>
                                <li class="float-left"><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i> Linkedin</a></li>
                            </ul>
                            <form action="#">
                                <h3>Login with Site Account</h3>
                                <div class="wrapper">
                                    <input type="text" placeholder="Username or Email">
                                    <input type="password" placeholder="Password">
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
            <!-- Fancybox -->
            <script type="text/javascript" src="vendor/fancybox/dist/jquery.fancybox.min.js"></script>

            <!-- Theme js -->
            <script type="text/javascript" src="js/theme.js"></script>

        </div> <!-- /.main-page-wrapper -->
    </body>

    <!-- Mirrored from themazine.com/unify/campus/course-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 06 Apr 2019 19:36:42 GMT -->
</html>