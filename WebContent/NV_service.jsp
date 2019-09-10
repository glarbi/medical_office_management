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
<%
	String id_ser ="";
	String nom_ser ="";
	String type_ser ="";
	String adr_ser ="";
	String num_tel_fx = "";
	String num_tel_mob = "";
	String id = request.getParameter("IDser");
%>
<div id="contcenu">
 <div id="con_right">
 <img src="img/cabinet.png" />
<hr color="#3399FF" size=1px> 
                         <ul>
                              <li><a href="Rech_Ser.jsp">Chercher</a></li>
                              <li><a href="NV_service.jsp">Modifier</a></li>
                           <!--    <li><a href="#">Supprimer</a></li>-->
                              <li><a href="les_services.jsp">Retour</a></li>
                              
                         </ul>
				</div><!--______________________________fin con_right____________________________-->
<br />  
<div id="content">              
<form action="NV_service.jsp" method="get">
<h2 align="left" style="margin-left:-20px">formulaire d'une nouvel service</h2>
<ul>
	<li><label for="">Identification de service : </label>
    <input type="text" name="ID_SER" value="<%=id_ser%>"/>
    <span class="error"></span>
    
    <label for="">Nom de service : </label>
    <input type="text" name="NOM_SER" value="<%=nom_ser%>"/>
    <span class="error"></span>
    
    <label for="">type de service : </label>
    <input type="text" name="TYPE_SER" value="<%=type_ser%>"/>
    <span class="error"></span>
    
    
    </li>
    <li>
      <label for="">Adresse du service : </label>
    <input type="text" name="ADR_SER" value="<%=adr_ser%>"/>
    <span class="error"></span>
    
    
    
    
      <label for="">Numero de telephone fixe </label>
    <input type="text" name="NUM_TEL_FX" value="<%=num_tel_fx%>"/>
    <span class="error"></span>
    
     
    
    <label for="">Numero de telephone mobile</label>
    <input type="text" name="NUM_TEL_MOB" value="<%=num_tel_mob%>"/>
    <span class="error"></span> 
    
   
   
    
    <input type="submit" value="OK" name="OK"/>
    <INPUT type="reset">
    </li>
</ul>
<%
	String t1 = request.getParameter("ID_SER");
	String t2 = request.getParameter("NOM_SER");
    String t3 = request.getParameter("TYPE_SER");
	String t4 = request.getParameter("ADR_SER");
	String t5 = request.getParameter("NUM_TEL_FX");
	String t6 = request.getParameter("NUM_TEL_MOB");
	
	if (t2!=null && t3!=null && t4!=null && t5!=null && t6!=null)
		DBManager.setService(t1, t2, t3, t4, t5, t6);
	
%>
</form>
</div>
         
</div>

</body>
</html>
