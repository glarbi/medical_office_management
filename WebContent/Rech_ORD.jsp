
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




</head>

<body>
<div id="contcenu">
 <div id="con_right">
 <img src="img/cabinet.png" />
<hr color="#3399FF" size=1px> 
                         <ul>
                              <li><a href="Ordonnance.jsp">Ajouter</a></li>
                          <!--      <li><a href="#">Modifier</a></li>
                             <li><a href="#">Supprimer</a></li>-->
                              <li><a href="index.jsp">Retour</a></li>
                              
                         </ul>
				</div><!--______________________________fin con_right____________________________-->
<br />    


<div id="content">              
<form action="Rech_ORD.jsp" method="get">
<h2 align="left" style="margin-left:-20px">Cherchez Une Ordonnance</h2>
<ul>
	<li><label for="">Nom du medecin : </label>
    <input type="text" name="nomMedecin" value=""/>
    <span class="error"></span>
    
    <label for="">Nom du patient :</label>
    <input type="text" name="nompatient" value=""/>
    <span class="error"></span>
    
      <label for="">Identificateur ordonnance :</label>
    <input type="text" name="Idord" value=""/>
    <span class="error"></span>
    
     
   
   
  
   
    
    
    
   
   
    
    <input type="submit" value="OK" name="OK"/>
    <INPUT type="reset">
    </li>
</ul>
</form>
</div>

<table width="1350" border="1" cellspacing="0.1">
  <tr>
    <th bgcolor="#95D5FF" scope="col">&nbsp;id_ord</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;mat_med </th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;nom_med</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;mat_pat</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;nom_pat</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;nom_mec</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;posologie</th>
   
  </tr>
<%   
    String id_ord ="";
	String mat_med = "";
	String nom_med = "";
	String mat_pat ="";
	String nom_pat ="";
	String nom_mec="";
	String posologie="";	
	System.out.println("0000");
	
	
	String t0 = request.getParameter("Idord");
	String t1 = request.getParameter("nomMedecin");
	String t2 = request.getParameter("nompatient");
	
	System.out.println("111111111111");

	if (t0!=null) id_ord = t0;
	if (t1!=null) nom_med = t1;
	if (t2!=null) nom_pat = t2;
	System.out.println("****************************************************nom_pat "+nom_pat);
	
/*	if (t0!=null|| t1!=null || t2!=null) {
		if (t0!=null && !t0.equalsIgnoreCase("0")) id_ord=t0;
		if (t1 != null && !t1.equalsIgnoreCase("Tapez le nom du medecin")) nom_med = t1;
		if (t2 != null && !t2.equalsIgnoreCase("Tapez le nom du patient")) nom_pat = t2;
	}*/
	
	ArrayList ordonnances = DBManager.getOrdonnances(id_ord, nom_pat, nom_med);
	List ligne1 = null;
	for (int i=0; i<ordonnances.size(); i++)
	{
		ligne1 = (List)(ordonnances.get(i));
		id_ord =        ligne1.get(0).toString();
		mat_med =		ligne1.get(1).toString();
		nom_med =		ligne1.get(2).toString();
		mat_pat =		ligne1.get(3).toString();
		nom_pat =		ligne1.get(4).toString();
		nom_mec =        ligne1.get(5).toString();
		posologie=       ligne1.get(6).toString();
		String link_med =		"Rech_Med.jsp?matMedecin=" + mat_med+"&nomMedecin=&prnMedecin=&OK=OK";
		String link_pat =		"Rech_Pat.jsp?mat=" + mat_pat+"&OK=OK";
	
%>
<tr>									<!-- ligne2 -->
			<th> <%=id_ord%> </th>				<!-- case 1 -->
			<th> <a href=<%=link_med%>><%=mat_med%></a> </th>				<!-- case 2 -->
			<th> <%=nom_med%> </th>			<!-- case 3 -->
			<th> <a href=<%=link_pat%>><%=mat_pat%> </a></th>			<!-- case 4 -->
			<th> <%=nom_pat%> </th>			<!-- case 5 -->
			<th> <%=nom_mec%> </th>			<!-- case 6 -->
			<th> <%=posologie%> </th>				<!-- case 7 -->
			
		</tr>
<%
	}
%>




</div>

</body>
</html>
