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
    String mat_exm="";
    String mat_med = "";
	String nom_med = "";
	String mat_pat = "";
	String nom_pat = "";
	String id_ser = "";
	String nom_ser = "";
	String nom_exm="";
	String dt_exm = "";
	String res_exm = "";
	
		String num = request.getParameter("NumExm");
	
	
%>
<div id="contcenu">
 <div id="con_right">
 <img src="img/cabinet.png" />
<hr color="#3399FF" size=1px> 
                         <ul>
                              <li><a href="Rech_Exam.jsp">Chercher</a></li>
                       <!--        <li><a href="Resultat Examen.jsp">Modifier</a></li>
                              <li><a href="#">Supprimer</a></li>-->
                              <li><a href="index.jsp">Retour</a></li>
                              
                         </ul>
				</div><!--______________________________fin con_right____________________________-->
<br />  
<div id="content">              
<form action="Resultat Examen.jsp" method="get">
<h2 align="left" style="margin-left:-20px">formulaire d'une Resultat Examen</h2>
<ul>
	<li><label for="">Numéro d'examen : </label>
    <input type="text" name="NumExm" value=""/>
    <span class="error"></span>
    
    <label for="">Numéro de sécurité sociale du médecin: </label>
    <input type="text" name="MATMed" value=""/>
    <span class="error"></span>
    
      <label for="">Nom du médecin : </label>
    <input type="text" name="" value=""/>
    <span class="error"></span>
    
      <label for="">Numéro de sécurité sociale du patient: </label>
    <input type="text" name="MATPat" value=""/>
    <span class="error"></span>
      </li>
    <li>
      <label for="">Nom du patient : </label>
    <input type="text" name="" value=""/>
    <span class="error"></span>
  
      <label for="">Identificateur service : </label>
    <input type="text" name="IdSer" value=""/>
    <span class="error"></span>
    
      <label for="">Nom du service :</label>
    <input type="text" name="" value=""/>
    <span class="error"></span>
    
    <label for="">Nom d'examen :</label>
    <input type="text" name="Nomexm" value=""/>
    <span class="error"></span>
    
     <label for="">Date de l'examen : </label>
    <input type="text" name="DtExm" value=""/>
    <span class="error"></span>
     </li>
    </ul>
    <ul>
    <li>
     <label for="">Resultat examen : </label>
    <textarea name="ResExm"></textarea>
    <span class="error"></span>
    </li>
 	<br/>  
   <br/>
   <br/>
   <br/>
   <br/>
   <br/>
   <br/>
    <br/>
    <input type="submit" value="OK" name="OK"/>
    <INPUT type="reset">
    
    </ul>

<%
    String t1 = request.getParameter("NumExm");
	String t2 = request.getParameter("MATMed");
	String t3 = request.getParameter("MATPat");
	String t4 = request.getParameter("IdSer");
	String t5 = request.getParameter("Nomexm");
	String t6 = request.getParameter("DtExm");
	String t7 = request.getParameter("ResExm");
	if ( t1!=null&& t2!=null && t3!=null && t4!=null && t5!=null && t6!=null && t7!=null)
		DBManager.setExamen(t1, t2, t3, t4, t5, t6,t7);
%>
</form>
</div>
         
</div>

</body>
</html>
