<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>ALEMNY | Login</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- LINEARICONS page login -->
		<link rel="stylesheet" href="styles.css">
		
		<!-- STYLE CSS -->
		<link rel="stylesheet" href="style.css">
	</head>

	<body>

		<div class="wrapper">
			<div class="inner">
				<img src="imgboy.png" alt="" class="image-1">
                                <form action="http://localhost:8080/ALEMNY/LoginSubmitServlet" method="post"> <!! form action t7otna fi sevlet eli bech ysir fha cnx m3a bd bhii -- >
					<h3>Connexion</h3>
					
					<div class="form-holder">
						<span class="lnr lnr-envelope"></span>
                                                <input type="text" class="form-control" placeholder="Mail" name="email">
					</div>
					<div class="form-holder">
						<span class="lnr lnr-lock"></span>
                                                <input type="password" class="form-control" placeholder="Password" name="password">
					</div>
                                        
                                        
                                         <select name="type" class="myselect">
                                                                    <option value="formateur" name="formateur">Formateur</option>
                                                                    <option name="apprenant"  value="apparant">Apprenant</option>

                                        </select>
					
					<button>
						<span>Login</span>
					</button>
				</form>
				<img src="img_2.png" alt="" class="image-2"> <!-- netsawer wadh7a hedhi haka ? img le ne7ki 3al page lkol kol page jsp 3andha page servlet bch page servlet tconcti 3la bd  ey page inscri zeda kima haka bhii -->
			</div>
			
		</div>
	</body>
</html>