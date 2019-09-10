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
<%
String id_mec = "";
String nom_mec = "";
String dci_mec= "";
	String id = request.getParameter("MATMed");
	
	
%>
<div id="contcenu">
 <div id="con_right">
 <img src="img/cabinet.png" />
<hr color="#3399FF" size=1px> 
                         <ul>
                              <li><a href="Rech_medicaments.jsp">Chercher</a></li>
                              <li><a href="NV_medicaments.jsp">Modifier</a></li>
                           <!--    <li><a href="#">Supprimer</a></li>-->
                              <li><a href="les_medicaments.jsp">Retour</a></li>
                              
                         </ul>
				</div><!--______________________________fin con_right____________________________-->
<br />  
<div id="content">              
<form action="NV_medicaments.jsp" method="get">
<h2 align="left" style="margin-left:-20px">formulaire d'une nouvel medicament</h2>
<ul>
	<li><label for="">Identificateur Medicament: </label>
    <input type="text" name="IDMEC" value="<%=id_mec%>"/>
    <span class="error"></span>
    
    <label for="">Nom du Medicament : </label>
    <input type="text" name="NomMec" value="<%=nom_mec%>"/>
    <span class="error"></span>
    
      <label for="">DCI Medicament: </label>
    <input type="text" name="dcimec" value="<%=dci_mec%>"/>
    <span class="error"></span>
    
      
   </li>
    
    <input type="submit" value="OK" name="OK"/>
    <INPUT type="reset">
    
</ul>
<%
	String t1 = request.getParameter("IDMEC");
	String t2 = request.getParameter("NomMec");
	String t3 = request.getParameter("dcimec");
	
	if (t2!=null && t3!=null)
		DBManager.setMedicaments(t1, t2, t3);
%>
</form>
</div>
         
</div>

</body>
</html>
