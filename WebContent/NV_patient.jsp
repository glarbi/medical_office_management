<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="org.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="sty.css" type="text/css" rel="stylesheet" />
<title>NV_patient</title>




</head>

<body>
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
	String mat = request.getParameter("MATPat");
	
		
	
%>
<div id="contcenu">
 <div id="con_right">
 <img src="img/cabinet.png" />
<hr color="#3399FF" size=1px> 
                         <ul>
                              <li><a href="Rech_Pat.jsp">Chercher</a></li>
                              <li><a href="NV_patient.jsp">Modifier</a></li>
                             <!--  <li><a href="SUP_Pat.jsp">Supprimer</a></li>-->
                              <li><a href="les_patients.jsp">Retour</a></li>
                              
                         </ul>
				</div><!--______________________________fin con_right____________________________-->
<br />                
<div id="content">              
<form action="NV_patient.jsp" method="get">
<h2 align="left" style="margin-left:-20px">Formulaire d'un nouveau patient</h2>
<ul>
	<li><label for="">Numéro de sécurité sociale : </label>
    <input type="text" name="MATPat" value="<%=mat_pat%>"/>
    <span class="error"></span>
    
    <label for="">Nom du patient : </label>
    <input type="text" name="NomPat" value="<%=nom_pat%>"/>
    <span class="error"></span>
    
      <label for="">Prénom du patient : </label>
    <input type="text" name="PrnPat" value="<%=prn_pat%>"/>
    <span class="error"></span>
    
      <label for="">Date de naissance </label>
    <input type="text" name="DtNaisPat" value="<%=dt_nais%>"/>
    <span class="error"></span>
    
      <label for="">Lieu de naissance : </label>
    <input type="text" name="LieuNaisPat" value="<%=lieu_nais%>"/>
    <span class="error"></span>
    
      <label for="">Nationalité : </label>
    <input type="text" name="NationalitePat" value="<%=nationalite%>"/>
    <span class="error"></span>
    </li>
    <li>
     <label for="">Adresse : </label>
    <input type="text" name="AdrPat" value="<%=adr%>"/>
    <span class="error"></span>
    
     <label for="">Profession : </label>
    <input type="text" name="ProfessionPat" value="<%=profession%>"/>
    <span class="error"></span>
    
    <label for="">Téléphone fixe: </label>
    <input type="text" name="TelfxPat" value="<%=num_tel_fx%>"/>
    <span class="error"></span>
    
    <label for="">Téléphone mobile: </label>
    <input type="text" name="TelmobPat" value="<%=num_tel_mob%>"/>
    <span class="error"></span>
    
    <label for="">Antécédants : </label>
    <input type="text" name="AntecedantsPat" value="<%=antecedants%>"/>
    <span class="error"></span>
     
   <label for="">Date d'inscription: </label>
    <input type="text" name="Dt_inscriptionPat" value="<%=dt_inscription%>"/>
    <span class="error"></span>
   
    
    <input type="submit" value="OK" name="OK"/>
    <INPUT type="reset">
    </li>
</ul>

<%
	String t1 = request.getParameter("MATPat");
	String t2 = request.getParameter("NomPat");
	String t3 = request.getParameter("PrnPat");
	String t4 = request.getParameter("DtNaisPat");
	String t5 = request.getParameter("LieuNaisPat");
	String t6 = request.getParameter("NationalitePat");
	String t7 = request.getParameter("AdrPat");
	String t8 = request.getParameter("ProfessionPat");
	String t9 = request.getParameter("TelfxPat");
	String t10 = request.getParameter("TelmobPat");
	String t11 = request.getParameter("AntecedantsPat");
	String t12 = request.getParameter("Dt_inscriptionPat");
	if (t2!=null && t3!=null && t4!=null && t5!=null && t6!=null && t7!=null && t8!=null && t9!=null && t10!=null && t11!=null && t12!=null)
		DBManager.setPatient(t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11,t12);
%>
</form>
</div>

         
</div>

</body>
</html>
