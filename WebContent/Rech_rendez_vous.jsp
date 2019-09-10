<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="sty.css" type="text/css" rel="stylesheet" />
<title>Document sans nom</title>

<title>Document sans nom</title>


</head>

<body>
<div id="contcenu">
 <div id="con_right">
 <img src="img/cabinet.png" />
<hr color="#3399FF" size=1px> 
                         <ul>
                              <li><a href="NV_randez_vous.jsp">Ajouter</a></li>
                              <li><a href="NV_randez_vous.jsp">Modifier</a></li>
                             <!--  <li><a href="#">Supprimer</a></li>-->
                              <li><a href="les_randez_vous.jsp">Retour</a></li>
                              
                         </ul>
				</div><!--______________________________fin con_right____________________________-->
<br />    


<div id="content">              
<form action="Rech_randez_vous.jsp" method="get">
<h2 align="left" style="margin-left:-20px">Cherchez Une Rendez-vous</h2>
<ul>

<li>
	<label for="">numero du Randez-vous: </label>
    <input type="text" name="numrdv" value=""/>
    <span class="error"></span>


	<label for="">Nom du medecin: </label>
    <input type="text" name="nommed" value=""/>
    <span class="error"></span>
    
    
	<label for="">Nom du patient : </label>
    <input type="text" name="nompat" value=""/>
    <span class="error"></span>
   
    
    
  </li>
    <li>
   
    
    
    
   
   
    
    <input type="submit" value="OK" name="OK"/>
    <INPUT type="reset">
    </li>
</ul>
</form>


</div>

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
				
				
				String t1 = request.getParameter("numrdv");
				String t2 = request.getParameter("nommed");
				String t3 = request.getParameter("nompat");
				
				if (t1!=null) num_rdv = t1;
				if (t2!=null) nom_med = t2;
				if (t3!=null) nom_pat = t3;

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
					String link_med = "Rech_Med.jsp?matMedecin=" + mat_med+"&nomMedecin=&prnMedecin=&OK=OK";
					String link_pat = "Rech_Pat.jsp?mat=" + mat_pat+"&OK=OK";
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
				<th><%=id_ser%></th>
				<!-- case 5 -->

			</tr>
			<%
				}
			%>
		</table>
            


         
</div>

</body>
</html>
