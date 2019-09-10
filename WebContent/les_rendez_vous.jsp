<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="org.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="sty.css" type="text/css" rel="stylesheet" />
<title>Liste des rendez-vous</title>

</head>

<body>
	<div id="contcenu">
		<div id="con_right">
			<img src="img/cabinet.png" />
			<hr color="#3399FF" size=1px>
				<ul>
					<li><a href="NV_rendez_vous.jsp">Ajouter</a></li>
					<li><a href="Rech_rendez_vous.jsp">Chercher</a></li>
					<li><a href="NV_rendez_vous.jsp">Modifier</a></li>
				 <!--	<li><a href="#">Supprimer</a></li>-->
					<li><a href="index.jsp">Retour</a></li>

				</ul>
		</div>
		<!--______________________________fin con_right____________________________-->
		<br />
		<h2>Liste des rendez-vous</h2>
		<table width="1350" border="1" cellspacing="0.1">
			<tr>
				<th bgcolor="#95D5FF" scope="col">&nbsp;NUM_RDV</th>
				<th bgcolor="#95D5FF" scope="col">&nbsp;MAT_MEDECIN</th>
				<th bgcolor="#95D5FF" scope="col">&nbsp;NOM_MEDECIN</th>
				<th bgcolor="#95D5FF" scope="col">&nbsp;MAT_PATIENT</th>
				<th bgcolor="#95D5FF" scope="col">&nbsp;NOM_PATIENT</th>
				<th bgcolor="#95D5FF" scope="col">&nbsp;DT_RDV</th>
				<th bgcolor="#95D5FF" scope="col">&nbsp;ID_SERVICE</th>
			</tr>


			<%
				String num_rdv = "";
				String mat_pat = "0";
				String mat_med = "0";
				String dt_rdv = " ";
				String nom_med = "";
				String nom_pat = "";
				String id_ser = "";

				System.out.println("allo allloa allo");
				ArrayList rendez_vous = DBManager.getRendezVous(num_rdv, nom_med,
						nom_pat);
				List ligne1 = null;
				for (int i = 0; i < rendez_vous.size(); i++) {
					ligne1 = (List) (rendez_vous.get(i));
					num_rdv = ligne1.get(0).toString();
					mat_med = ligne1.get(1).toString();
					nom_med = ligne1.get(2).toString();
					mat_pat = ligne1.get(3).toString();
					nom_pat = ligne1.get(4).toString();
					dt_rdv = ligne1.get(5).toString();
					id_ser = ligne1.get(6).toString();
					String link_med = "Rech_Med.jsp?matMedecin=" + mat_med+"&nomMedecin=&prnMedecin=&OK=OK";          //  Rech_Med.jsp?matMedecin=0112&nomMedecin=&prnMedecin=&OK=OK
					String link_pat = "Rech_Pat.jsp?mat=" + mat_pat+"&OK=OK";                                   //   Rech_Pat.jsp?mat=1126&nom=&prn=&OK=OK
					String link_ser = "Rech_Ser.jsp?IdSer=" +id_ser+ "&OK=OK";
			%>
			<tr>
				<th><%=num_rdv%></th>
				<!-- ligne2 -->
				<th><a href=<%=link_med%>><%=mat_med%></a></th>
				<!-- case 1 -->
				<th><%=nom_med%></th>
				<!-- case 2 -->
				<th><a href=<%=link_pat%>><%=mat_pat%></a></th>
				<!-- case 3 -->
				<th><%=nom_pat%></th>
				<!-- case 4 -->
				<th><%=dt_rdv%></th>
				<th><a href=<%=link_ser%>><%=id_ser%></a></th>
				<!-- case 5 -->

			</tr>
			<%
				}
			%>
		</table>


	</div>

</body>
</html>
