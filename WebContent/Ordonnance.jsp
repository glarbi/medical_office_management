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
<title>Ordonnance</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
  
<script>
  $(function() {
		//var myAvailableTags = [];
		//ArrayList medicaments = DBManager.getMedicaments("");
//		List ligne1 = null;
		//for (int i = 0; i<medicaments.size(); i++)
//		{
//			ligne1 = (List)(medicaments.get(0));
//			myAvailableTags[0] = ligne1.get(1).toString();
//		}
    //var myAvailableTags1 = ["tata","tutu"];
    //myAvailableTags1[2]="toto";
//    $( '#md1' ).autocomplete("auto_medicaments.php");

		//$( "#md1" ).autocomplete(["tata","tutu"]);
		var availableTags = [
		                     "ActionScript",
		                     "AppleScript",
		                     "Asp",
		                     "BASIC",
		                     "C",
		                     "C++",
		                     "Clojure",
		                     "COBOL",
		                     "ColdFusion",
		                     "Erlang",
		                     "Fortran",
		                     "Groovy",
		                     "Haskell",
		                     "Java",
		                     "JavaScript",
		                     "Lisp",
		                     "Perl",
		                     "PHP",
		                     "Python",
		                     "Ruby",
		                     "Scala",
		                     "Scheme"
		                   ];
		$( "#md1" ).autocomplete({
         source: availableTags
		});
  });
</script>



</head>

<body>
<%
	String id_ord= "";
	String nom_med = "";
	String nom_pat = "";
	String medicament1 = "";
	String posologie1="";
	String medicament2="";
	String posologie2="";
	String medicament3="";
	String posologie3="";
	String medicament4="";
	String posologie4="";
	String idordo = request.getParameter("IdOrd");
%>

<div id="contcenu">
 <div id="con_right">
 <img src="img/cabinet.png" />
<hr color="#3399FF" size=1px> 
                         <ul>
                              
                              <li><a href="les_medicaments.jsp">Medicaments</a></li>
                              <li><a href="Rech_ORD.jsp">Chercher</a></li>
                         <!--       <li><a href="#">Modifier</a></li>
                        <li><a href="#">Supprimer</a></li>-->
                              <li><a href="index.jsp">Retour</a></li>
                              
                         </ul>
				</div><!--______________________________fin con_right____________________________-->
<br />  
<div id="content">              
<form action="Ordonnance.jsp" method="get">

<h2 align="left" style="margin-left:-20px">Editer une Ordonnance</h2>

	<label for="">Identificateur ordonnance : </label>
    <input type="text" name="IdOrd" value="<%=id_ord%>"/>
    <span class="error"></span>
    
    <label for="">Nom du medecin : </label>
    <input type="text" name="NomMed" value="<%=nom_med%>"/>
    <span class="error"></span>
   
      <label for="">Nom du patient : </label>
    <input type="text" name="NomPat" value="<%=nom_pat%>"/>
    <span class="error"></span>
 <ul> 
    <li>
		<label for="md1">Medicament1 :</label>
		<input type="text" id="md1" name="Medicament1" value="<%=medicament1%>"/>
		<span class="error"></span>
		
		<label for="">Medicament2 : </label>
		<input type="text" name="Medicament2" value="<%=medicament2%>"/>
		<span class="error"></span>
		
		<label for="">Medicament3 :</label>
		<input type="text" name="Medicament3" value="<%=medicament3%>"/>
		<span class="error"></span>
		
		<label for="">Medicament4 :</label>
		<input type="text" name="Medicament4" value="<%=medicament4%>"/>
		<span class="error"></span>
     </li>
    <li>
      <label for="">Posologie1 :</label>
    <input type="text" name="posologie1" value="<%=posologie1%>"/>
    <span class="error"></span>
    
     <label for="">Posologie2 : </label>
    <input type="text" name="posologie2" value="<%=posologie2%>"/>
    <span class="error"></span>
    
     <label for="">Posologie3 : </label>
    <input type="text" name="posologie3" value="<%=posologie3%>"/>
    <span class="error"></span>
    
    <label for="">Posologie4 : </label>
    <input type="text" name="posologie4" value="<%=posologie4%>"/>
    <span class="error"></span>
    
   
   </li>
    
    <input type="submit" value="OK" name="OK"/>
    <INPUT type="reset">
    
</ul>
<%
	String t1 = request.getParameter("IdOrd");
	String t2 = request.getParameter("NomMed");
	String t3 = request.getParameter("NomPat");
    String t4 = request.getParameter("Medicament1");
    String t5 = request.getParameter("posologie1");
    String t6 = request.getParameter("Medicament2");
    String t7 = request.getParameter("posologie2");
    String t8 = request.getParameter("Medicament3");
    String t9 = request.getParameter("posologie3");
    String t10 = request.getParameter("Medicament4");
    String t11 = request.getParameter("posologie4");
	if (t1!=null && t2!=null && t3!=null && t4!=null && t5!=null && t6!=null && t7!=null && t8!=null && t9!=null && t10!=null && t11!=null)
	{
		DBManager.setOrdonnance(t1, t2, t3);
		DBManager.setContenir(t1, t4, t5);
		DBManager.setContenir(t1, t6, t7);
		DBManager.setContenir(t1, t8, t9);
		DBManager.setContenir(t1, t10, t11);
	}   
%>
</form>
</div>
         
</div>

</body>
</html>
