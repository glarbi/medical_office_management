
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
                              <li><a href="NV_medecin.jsp">Ajouter</a></li>
                              <li><a href="NV_medecin.jsp">Modifier</a></li>
                             <!--  <li><a href="#">Supprimer</a></li>-->
                              <li><a href="les_medecins.jsp">Retour</a></li>
                              
                         </ul>
				</div><!--______________________________fin con_right____________________________-->
<br />    


<div id="content">              
<form action="Rech_Med.jsp" method="get">
<h2 align="left" style="margin-left:-20px">Cherchez Un Médecin</h2>
<ul>
	<li><label for="">MAT Medecin : </label>
    <input type="text" name="matMedecin" value=""/>
    <span class="error"></span>
    
    <label for="">Nom Medecin:</label>
    <input type="text" name="nomMedecin" value=""/>
    <span class="error"></span>
    
      <label for="">Prenom Medecin: </label>
    <input type="text" name="prnMedecin" value=""/>
    <span class="error"></span>
    
     
   
   
  
   
    
    
    
   
   
    
    <input type="submit" value="OK" name="OK"/>
    <INPUT type="reset">
    </li>
</ul>
</form>

</div>
<table width="1350" border="1" cellspacing="0.1">
  <tr>
    <th bgcolor="#95D5FF" scope="col">&nbsp;MAT_MED</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;NOM_MED </th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;PRENOM_MED</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;date de naissance</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;lieu de naissance</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;nationalite</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;Adresse</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;specialite</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;numero de telephone fixe</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;numero de telephone mobile</th>
    
  </tr>
<%
	String mat_med = "";
	String nom_med = "";
	String prn_med = "";
	String dt_nais = "";
	String lieu_nais = "";
	String nationalite = "";
	String adr = "";
	String specialite = "";
	String num_tel_fx = "";
	String num_tel_mob = "";

	String t1 = request.getParameter("matMedecin");
	String t2 = request.getParameter("nomMedecin");
	String t3 = request.getParameter("prnMedecin");
	if (t1!=null || t2!=null || t3!=null) {
		if (t1 != null && !t1.equalsIgnoreCase("0")) mat_med = t1;
		if (t2 != null && !t2.equalsIgnoreCase("Tapez le nom du medecin")) nom_med = t2;
		if (t3 != null && !t3.equalsIgnoreCase("Tapez le prénom du medecin")) prn_med = t3;
	}
	
	ArrayList medecins = DBManager.getMedecins(mat_med, nom_med, prn_med);
	List ligne1 = null;
	for (int i=0; i<medecins.size(); i++)
	{
		ligne1 = (List)(medecins.get(i));
		mat_med =			ligne1.get(0).toString();
		nom_med =			ligne1.get(1).toString();
		prn_med =		ligne1.get(2).toString();
		dt_nais =			ligne1.get(3).toString();
		lieu_nais =			ligne1.get(4).toString();
		nationalite =		ligne1.get(5).toString();
		adr =			ligne1.get(6).toString();
		specialite =		ligne1.get(7).toString();
		num_tel_fx =			ligne1.get(8).toString();
		num_tel_mob =			ligne1.get(9).toString();
	
%>
<tr>									<!-- ligne2 -->
				<th> <%=mat_med%> </th>				<!-- case 1 -->
				<th> <%=nom_med%> </th>				<!-- case 2 -->
				<th> <%=prn_med%> </th>			<!-- case 3 -->
				<th> <%=dt_nais%> </th>			<!-- case 4 -->
				<th> <%=lieu_nais%> </th>			<!-- case 5 -->
				<th> <%=nationalite%> </th>			<!-- case 6 -->
				<th> <%=adr%> </th>				<!-- case 7 -->
				<th> <%=specialite%> </th>			<!-- case 8 -->
				<th> <%=num_tel_fx%> </th>				<!-- case 9 -->
				<th> <%=num_tel_mob%> </th>	
			</tr>

 	          
<%} %>	

         
</div>

</body>
</html>
