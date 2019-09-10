
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
                              <li><a href="Resultat Examen.jsp">Ajouter</a></li>
                           <!--    <li><a href="NV_medecin.jsp">Modifier</a></li>
                              <li><a href="#">Supprimer</a></li>-->
                              <li><a href="Resultat Examen.jsp">Retour</a></li>
                              
                         </ul>
				</div><!--______________________________fin con_right____________________________-->
<br />    


<div id="content">              
<form action="Rech_Exam.jsp" method="get">
<h2 align="left" style="margin-left:-20px">Cherchez Une Examen</h2>
<ul>
	<li><label for="">Numéro d'examen : </label>
    <input type="text" name="NumExm" value=""/>
    <span class="error"></span>
    
     <label for="">Nom du médecin : </label>
    <input type="text" name="nomMedecin" value=""/>
    <span class="error"></span>
    
      <label for="">Nom du patient : </label>
    <input type="text" name="nompatient" value=""/>
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
    <th bgcolor="#95D5FF" scope="col">&nbsp;MAT_PAT</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;NOM_PAT</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;ID_SER</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;DATE EXAMEN</th>
    <th bgcolor="#95D5FF" scope="col">&nbsp;RES_EXAM</th>
   	
    
  </tr>
<%

	String num_exm="0";
	String mat_pat = "";
	String mat_med = "";
	String nommed = "";
	String nompat = "";
	String dt_exm="";
	String id_ser="0";
	String nomser="";
	String res_exm="";

	String t1 = request.getParameter("NumExm");
	String t2 = request.getParameter("nomMedecin");
	String t3 = request.getParameter("nompatient");
	if (t1!=null || t2!=null || t3!=null) {
		if (t1 != null && !t1.equalsIgnoreCase("0")) num_exm = t1;
		if (t2 != null && !t2.equalsIgnoreCase("")) nommed = t2;
		if (t3 != null && !t3.equalsIgnoreCase("")) nompat = t3;
	}
	
	ArrayList examen = DBManager.getExamens(num_exm,nommed,nompat);
	List ligne1 = null;
	for (int i=0; i<examen.size(); i++)
	{
		ligne1 = (List)(examen.get(i));
		mat_med =			ligne1.get(0).toString();
		nommed =			ligne1.get(1).toString();
		mat_pat =			ligne1.get(2).toString();
		nompat =			ligne1.get(3).toString();
		id_ser =			ligne1.get(4).toString();
		//nomser =			ligne1.get(5).toString();
		dt_exm =			ligne1.get(5).toString();
		res_exm =			ligne1.get(6).toString();
		
		String link_med = "Rech_Med.jsp?matMedecin=" + mat_med+"&nomMedecin=&prnMedecin=&OK=OK";
		String link_pat = "Rech_Pat.jsp?mat=" + mat_pat+"&OK=OK";
		String link_ser = "Rech_Ser.jsp?IdSer=" +id_ser+ "&OK=OK";
	
%>
<tr>								
				<th> <a href = <%=link_med%>><%=mat_med%></a> </th>			
				<th> <%=nommed%> </th>										
				<th> <a href = <%=link_pat%>><%=mat_pat%></a> </th>			
				<th> <%=nompat%> </th>
				<th> <a href = <%=link_ser%>><%=id_ser%></a> </th>
			<!-- 	<th> <%=nomser %> </th>  -->                                  
				<th> <%=dt_exm%> </th>                                    
				<th> <%=res_exm %></th>
			</tr>

 	          
<%} %>	

         
</div>

</body>
</html>
