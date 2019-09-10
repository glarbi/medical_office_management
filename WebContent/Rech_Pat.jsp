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
                              <li><a href="NV_patient.jsp">Ajouter</a></li>
                              <li><a href="NV_patient.jsp">Modifier</a></li>
                         <!--      <li><a href="SUP_Pat.jsp">Supprimer</a></li>-->
                              <li><a href="les_patients.jsp">Retour</a></li>
                              
                         </ul>
				</div><!--______________________________fin con_right____________________________-->
<br />    


<div id="content">              
<form action="Rech_Pat.jsp" method="get">
<h2 align="left" style="margin-left:-20px">Cherchez Un Patient</h2>
<ul>
	<li><label for="">mat : </label>
    <input type="text" name="mat" value=""/>
    <span class="error"></span>
    
    <label for="">Nom :</label>
    <input type="text" name="nom" value=""/>
    <span class="error"></span>
      <label for="">Prenom : </label>
    <input type="text" name="prn" value=""/>
    <span class="error"></span>
    
         
    <input type="submit" value="OK" name="OK"/>
    <INPUT type="reset">
    </li>
</ul>
</form>

</div>

<table width="1350" border="1" cellspacing="0.1">
  <tr>
    <th bgcolor="#95D5FF" scope="col">&nbsp;MAT_PAT</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;NOM_PAT </th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;PRENOM_PAT</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;date de naissance</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;lieu de naissance</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;nationalite</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;Adresse</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;profession</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;numero de telephone fixe</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;numero de telephone mobile</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;antecedants</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;dt_inscription</th>
  </tr>
<%
	String mat_pat = "";
	String nom_pat = "";
	String prn_pat = "";
	String dt_nais = "";
	String lieu_nais = "";
	String nationalite = "";
	String adr = "";
	String profession = "";
	String num_tel_fx = "";
	String num_tel_mob = "";
	String antecedants = "";
	String dt_inscription = "";
	System.out.println("0000");
	
	String t1 = request.getParameter("mat");
	String t2 = request.getParameter("nom");
	String t3 = request.getParameter("prn");
	System.out.println("1111");
	
		if (t1!=null) mat_pat = t1;
		if (t2!=null) nom_pat = t2;
		if (t3!=null) prn_pat = t3;
	
		System.out.println("22222");
	ArrayList patients = DBManager.getPatients(mat_pat, nom_pat, prn_pat);
	System.out.println("3333");
	List ligne1 = null;
	for (int i=0; i<patients.size(); i++)
	{
		ligne1 = (List)(patients.get(i));
		mat_pat =			ligne1.get(0).toString();
		nom_pat =			ligne1.get(1).toString();
		prn_pat =		ligne1.get(2).toString();
		dt_nais =			ligne1.get(3).toString();
		lieu_nais =			ligne1.get(4).toString();
		nationalite =		ligne1.get(5).toString();
		adr =			ligne1.get(6).toString();
		profession =		ligne1.get(7).toString();
		num_tel_fx =			ligne1.get(8).toString();
		num_tel_mob =			ligne1.get(9).toString();
		antecedants =		ligne1.get(10).toString();
		dt_inscription =	ligne1.get(11).toString();
		%>
		<tr>									<!-- ligne2 -->
			<th> <%=mat_pat%> </th>				<!-- case 1 -->
			<th> <%=nom_pat%> </th>				<!-- case 2 -->
			<th> <%=prn_pat%> </th>			<!-- case 3 -->
			<th> <%=dt_nais%> </th>			<!-- case 4 -->
			<th> <%=lieu_nais%> </th>			<!-- case 5 -->
			<th> <%=nationalite%> </th>			<!-- case 6 -->
			<th> <%=adr%> </th>				<!-- case 7 -->
			<th> <%=profession%> </th>			<!-- case 8 -->
			<th> <%=num_tel_fx%> </th>				<!-- case 9 -->
			<th> <%=num_tel_mob%> </th>	
			<th> <%=antecedants%> </th>			<!-- case 10 -->
			<th> <%=dt_inscription%> </th>	<!-- case 11 -->
		</tr>
<%
	}
%>
            


         
</div>

</body>
</html>
