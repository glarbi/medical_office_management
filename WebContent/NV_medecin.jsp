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
	String mat = request.getParameter("MATMed");
	
	
%>
<div id="contcenu">
 <div id="con_right">
 <img src="img/cabinet.png" />
<hr color="#3399FF" size=1px> 
                         <ul>
                              <li><a href="Rech_Med.jsp">Chercher</a></li>
                              <li><a href="NV_medecin.jsp">Modifier</a></li>
                             <!--  <li><a href="#">Supprimer</a></li>-->
                              <li><a href="les_medecins.jsp">Retour</a></li>
                              
                         </ul>
				</div><!--______________________________fin con_right____________________________-->
<br />  
<div id="content">              
<form action="NV_medecin.jsp" method="get">
<h2 align="left" style="margin-left:-20px">formulaire d'un nouveau medecin</h2>
<ul>
	<li><label for="">Numero de securite sociale : </label>
    <input type="text" name="MATMED" value="<%=mat_med%>"/>
    <span class="error"></span>
    
    <label for="">Nom du medecin : </label>
    <input type="text" name="NomMed" value="<%=nom_med%>"/>
    <span class="error"></span>
    
      <label for="">Prenom du medecin : </label>
    <input type="text" name="PrnMed" value="<%=prn_med%>"/>
    <span class="error"></span>
    
      <label for="">Date de naissance </label>
    <input type="text" name="DtNaisMed" value="<%=dt_nais%>"/>
    <span class="error"></span>
    
      <label for="">Lieu de naissance : </label>
    <input type="text" name="LieuNaisMed" value="<%=lieu_nais%>"/>
    <span class="error"></span>
    </li>
    <li>
      <label for="">Nationalite : </label>
    <input type="text" name="NationaliteMed" value="<%=nationalite%>"/>
    <span class="error"></span>
    
      <label for="">Adresse :</label>
    <input type="text" name="AdrMed" value="<%=adr%>"/>
    <span class="error"></span>
    
     <label for="">Specialite : </label>
    <input type="text" name="SpecialiteMed" value="<%=specialite%>"/>
    <span class="error"></span>
    
     <label for="">Telephone fixe: </label>
    <input type="text" name="Tel_fxMed" value="<%=num_tel_fx%>"/>
    <span class="error"></span>
    
    <label for="">Telephone mobile: </label>
    <input type="text" name="Tel_mobMed" value="<%=num_tel_mob%>"/>
    <span class="error"></span>
   
   </li>
    
    <input type="submit" value="OK" name="OK"/>
    <INPUT type="reset">
    
</ul>
<%
	String t1 = request.getParameter("MATMED");
	String t2 = request.getParameter("NomMed");
	String t3 = request.getParameter("PrnMed");
	String t4 = request.getParameter("DtNaisMed");
	String t5 = request.getParameter("LieuNaisMed");
	String t6 = request.getParameter("NationaliteMed");
	String t7 = request.getParameter("AdrMed");
	String t8 = request.getParameter("SpecialiteMed");
	String t9 = request.getParameter("Tel_fxMed");
	String t10 = request.getParameter("Tel_mobMed");
	if (t2!=null && t3!=null && t4!=null && t5!=null && t6!=null && t7!=null && t8!=null && t9!=null && t10!=null)
		DBManager.setMedecin(t1, t2, t3, t4, t5, t6, t7, t8, t9,t10);
%>
</form>
</div>
         
</div>

</body>
</html>
