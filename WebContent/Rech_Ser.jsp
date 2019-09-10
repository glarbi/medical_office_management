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
                              <li><a href="NV_service.jsp">Ajouter</a></li>
                              <li><a href="NV_service.jsp">Modifier</a></li>
                           <!--    <li><a href="#">Supprimer</a></li>-->
                              <li><a href="les_services.jsp">Retour</a></li>
                              
                         </ul>
				</div><!--______________________________fin con_right____________________________-->
<br />    


<div id="content">              
<form action="Rech_Ser.jsp" method="get">
<h2 align="left" style="margin-left:-20px">Cherchez Un Service</h2>
<ul>

<li><label for="">ID du service : </label>
    <input type="text" name="IdSer" value=""/>
    <span class="error"></span>
    
    
<!--	<label for="nom">Nom du service : </label>
    <input type="text" name="Nomser" value=""/>
    <span class="error"></span>
  --> 
    
     
   
   
  
   
    
    
    
   
   
    
    <input type="submit" value="OK" name="OK"/>
    <INPUT type="reset">
    </li>
</ul>
</form>


</div>
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
	System.out.println("1111");
//<jsp:getProperty name="mybean" property="nom"/
	String t1 = request.getParameter("IdSer");
	String t2 = request.getParameter("Nomser");
//	String t2 = request.getParameter("AdrSer");
//	String t3 = request.getparameter("NumTelfx");
//	String t4 = request.getparameter("NumTelmob");
	
	System.out.println("222222");
		if (t1!=null) id_ser = t1;
		if (t2!=null) nom_ser = t2;
//	if (t1==null) {
		//id_ser = "";
//		 id_ser="0";
//	}
//	else {
//		if (t1!= null && !t1.equalsIgnoreCase("Tapez le nom du service"))nom_ser=t1;
//		if (nom_ser != null) {
		System.out.println("33333333");
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
