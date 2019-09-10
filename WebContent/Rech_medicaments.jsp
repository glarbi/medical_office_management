
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
                              <li><a href="NV_medicaments.jsp">Ajouter</a></li>
                              <li><a href="NV_medicaments.jsp">Modifier</a></li>
                            <!--   <li><a href="#">Supprimer</a></li>-->
                              <li><a href="les_medicaments.jsp">Retour</a></li>
                              
                         </ul>
				</div><!--______________________________fin con_right____________________________-->
<br />    


<div id="content">              
<form action="Rech_medicaments.jsp" method="get">
<h2 align="left" style="margin-left:-20px">Cherchez Une medicament</h2>
<ul>
	<li><label for="">Identificateur Medicament:</label>
    <input type="text" name="IDMEC" value=""/>
    <span class="error"></span>
    
   <!--  <label for="">Nom du Medicament : </label>
    <input type="text" name="NomMec" value=""/>
    <span class="error"></span>
    
      <label for="">DCI Medicament:</label>
    <input type="text" name="dcimec" value=""/>
    <span class="error"></span>  -->

    <input type="submit" value="OK" name="OK"/>
    <INPUT type="reset">
    </li>
</ul>
</form>

</div>
<table width="1350" border="1" cellspacing="0.1">
  <tr>
    <th bgcolor="#95D5FF" scope="col">&nbsp;Identificateur Medicament</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;NOM Medicament </th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;DCI_Medicament</th>
    
  </tr>
<%
String id_mec = "";
String nom_mec = "";
String dci_mec= "";

	String t1 = request.getParameter("IDMEC");
	String t2 = request.getParameter("NomMec");
	String t3 = request.getParameter("dcimec");
	if (t1!=null || t2!=null || t3!=null) {
		if (t1 != null && !t1.equalsIgnoreCase("0")) id_mec = t1;
		if (t2 != null && !t2.equalsIgnoreCase("")) nom_mec = t2;
		if (t3 != null && !t3.equalsIgnoreCase("")) dci_mec = t3;
	}
	
	ArrayList Medicament = DBManager.getMedicaments(id_mec);
	List ligne1 = null;
	for (int i=0; i<Medicament.size(); i++)
	{
		ligne1 = (List)(Medicament.get(i));
		
		id_mec =			ligne1.get(0).toString();
		nom_mec =			ligne1.get(1).toString();
		dci_mec =		ligne1.get(2).toString();
		
	
%>
<tr>									<!-- ligne2 -->
				<th> <%=id_mec%> </th>				<!-- case 1 -->
				<th> <%=nom_mec%> </th>				<!-- case 2 -->
				<th> <%=dci_mec%> </th>
			</tr>

 	          
<%} %>	

         
</div>

</body>
</html>
