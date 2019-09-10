<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.*" %>
<%@page import="org.DBManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="sty.css" type="text/css" rel="stylesheet" />
<title>Nouveau rendez-vous</title>

</head>

<body>

<div id="contcenu">
 <div id="con_right">
 <img src="img/cabinet.png" />
<hr color="#3399FF" size=1px> 
                         <ul>
                              <li><a href="Rech_rendez_vous.jsp">Chercher</a></li>
                              <li><a href="#">Modifier</a></li>
                            <!--   <li><a href="#">Supprimer</a></li>-->
                              <li><a href="les_rendez_vous.jsp">Retour</a></li>
                              
                         </ul>
				</div><!--______________________________fin con_right____________________________-->
<br />  
<div id="content">              
<form action="NV_rendez_vous.jsp" method="get">
<h2 align="left" style="margin-left:-20px">Formulaire d'une nouvau rendez-vous</h2>
<ul>
	
    <li>
    <label for="">Numéro du rendez-vous : </label>
    <input type="text" name="numrdv" value=""/>
    <span class="error"></span>
    
    
    <label for="">Matricule du médecin : </label>
    <input type="text" name="MATmed" value=""/>
    <span class="error"></span>
    
      <label for="">Matricule du patient : </label>
    <input type="text" name="MATPat" value=""/>
    <span class="error"></span>
    
      <label for="">ID du service : </label>
    <input type="text" name="idser" value=""/>
    <span class="error"></span>
    
    
    
    <label for="">Date du rendez_vous : </label>
    				 <select name="day"size="1">
							<option value="00" selected></option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">10</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
					</select> <select name="month" size="1">
							<option value="00" selected></option>
							<option value="01">janvier</option>
							<option value="02">fevrier</option>
							<option value="03">mars</option>
							<option value="04">avril</option>
							<option value="05">mai</option>
							<option value="06">juin</option>
							<option value="07">juillet</option>
							<option value="08">aout</option>
							<option value="09">septempre</option>
							<option value="10">octobre</option>
							<option value="11">novembre</option>
							<option value="12">decembre</option>
					</select> <select name="year" size="1">
							<option value="0000" selected></option>
							<option value="2019">2019</option>
							<option value="2020">2020</option>
							<option value="2021">2021</option>
							<option value="2022">2022</option>
							<option value="2023">2023</option>
							<option value="2024">2024</option>
							<option value="2025">2025</option>
							<option value="2026">2026</option>
							<option value="2027">2027</option>
							<option value="2028">2028</option>
							<option value="2029">2029</option>
					</select>

					</li>
    <li>
    <input type="submit" value="OK" name="OK"/>
    <INPUT type="reset">
    </li>
</ul>

</form>

</div>
<%	
	String num_rdv="0";
	String mat_pat = "0";
	String mat_med = "0";
	String dt_rdv = "";
	String id_ser = "";


	String t1 = request.getParameter("numrdv");
	String t2 = request.getParameter("MATmed");
	String t3 = request.getParameter("MATPat");
	String t4 = request.getParameter("idser");
	String t5 = request.getParameter("day");
	String t6 = request.getParameter("month");  
	String t7 = request.getParameter("year");
	
	
	if (t2!=null && t3!=null && t4!=null && t5!=null && t6!=null && t7!=null)
		 dt_rdv = t7+'-'+t6+'-'+t5;
		DBManager.setRendezVous(t1, t2, t3, dt_rdv, t4);
%>         
</div>

</body>
</html>
