<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="org.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" type="text/css" rel="stylesheet" />
<title>Gestion d'un cabinet médical</title>
<link rel="stylesheet" href="nivo-slider.css" type="text/css"
	media="screen" />
<link href="styles.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="lib/jquery-1.4.3.min.js"></script>
<script type="text/javascript" src="lib/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>

</head>

<body>

	<div id="contenu">
		<div id="slider-wrapper">
			<div id="slider" class="nivoSlider">
				<img src="images/top.png" alt="" /> <img src="images/top2.png"
					alt="" /> <img src="images/top3.png" alt="" /> <img
					src="images/top.png" alt="" /> <img src="images/top2.png" alt="" />
				<img src="images/top3.png" alt="" /> <img src="images/top.png"
					alt="" />
			</div>

		</div>
		<div id="cn">
			<div id="con_left">
				<ul>
					<li><a href="les_services.jsp">Les Services</a></li>
					<li><a href="les_medecins.jsp">Les Médecins</a></li>
					<li><a href="les_patients.jsp">Les Patients</a></li>
					<li><a href="les_rendez_vous.jsp">Les Rendez-vous</a></li>

				</ul>
			</div>

			<!--______________________________fin con_left____________________________-->

			<div id="con_right">
				<ul>
					<li><a href="NV_rendez_vous.jsp">Prendre un RDV</a></li>
					<li><a href="les_rendez_vous.jsp">Voir les RDV</a></li>
					<li><a href="Ordonnance.jsp">Ordonnance</a></li>
					<li><a href="Resultat Examen.jsp">Résultat Examen</a></li>


				</ul>
			</div>

			<!--______________________________fin con_right____________________________-->

		</div>
	</div>

	<footer>
		<p>Copyright 2012 Gestion d'un Cabinet Médical by Dr GUEZOULI Larbi. Tous Droits réservés</p>
	</footer>
</body>
</html>
