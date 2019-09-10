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
                              <li><a href="NV_service.jsp">Ajouter</a></li>
                              <li><a href="Rech_Ser.jsp">Chercher</a></li>
                              <li><a href="NV_service.jsp">Modifier</a></li>
                             <!--  <li><a href="#">Supprimer</a></li>-->
                              <li><a href="index.jsp">Retour</a></li>
                              
                         </ul>
				</div><!--______________________________fin con_right____________________________-->
<br />                
<h2>Liste des services</h2>	
<table width="1350" border="1" cellspacing="0.1">
  <tr>
    <th bgcolor="#95D5FF" scope="col">&nbsp;ID_SER</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;NOM_SER </th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;TYPE_SER </th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;Adresse_SER </th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;Num de telephone fixe</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;Num de telephone mobile</th>

  </tr>
 
 <% 
   String id_ser= "";
   String nom_ser = "";
   String type_ser = "";
   String adr_ser ="";
   String num_tel_fx="";
   String num_tel_mob="";

   System.out.println("toto1");
   ArrayList service = DBManager.getServices(id_ser);
			List ligne1 = null;
			for (int i=0; i<service.size(); i++)
			{
				ligne1 = (List)(service.get(i));
				id_ser =			ligne1.get(0).toString();
				nom_ser =			ligne1.get(1).toString();
				type_ser =		ligne1.get(2).toString();
				adr_ser =			ligne1.get(3).toString();
				
				num_tel_fx =			ligne1.get(4).toString();
				num_tel_mob =			ligne1.get(5).toString();
				
			%>  
	<tr>
    <th><%=id_ser%></th>                            
	<th> <%=nom_ser%></th>                                   
	<th> <%=type_ser %></th>	
	<th> <%=adr_ser %></th>	
	<th> <%=num_tel_fx%></th>
	<th> <%=num_tel_mob%></th>                    
     </tr>
     
   <%}%>
</table>
	
            
</div>

</body>
</html>
