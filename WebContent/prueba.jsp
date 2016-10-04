<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Primer Index.jsp</title>
<style>
	p{color:red;}
</style>
</head>
<body>
	<%
	int contador = 0;

	out.write("mi primer JSP...!!"  + "<br/>" + " Id sesion: " + session.getId() + "<br/>" );
	%>
	<br/>
	
		<%=session.getServletContext() + "<br/>"%>

		<% //Se crean las fechas y un numero aleatorio de 0-20 en el rnd.nextInt(20)
			Date fecha = new Date();
			Random rnd = new Random();
			
			out.println("<p>"+ "Fecha: " + fecha + "<br/></p>"); 
			out.print("Numero aleatorio: " + rnd.nextInt(20));
		%>
		
		
		
		<!-- Funciones para recargar la pagina, por enlace y por formulario -->
		<p> <a href="">Recargar</a>
		
		<form>
			<input type="submit" value="Recargar" />
		</form>
	
</body>
</html>