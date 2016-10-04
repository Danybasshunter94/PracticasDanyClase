<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ClickContexto"%>
<%@page import="modelo.Click"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
	.sesion{
		background-color: green;
	}

</style>
</head>
<body>
	<p>Clicks Sesion</p>
	<table border="1">
	
	
	
	<% 
		ArrayList<Click> clicksSesion = (ArrayList<Click>) session.getAttribute("clicks");
		ArrayList<ClickContexto> clicksContexto = (ArrayList<ClickContexto>) application.getAttribute("clicks");
		
		for(int i = 0; i < clicksContexto.size() ; i++){
			String s_fecha;
			String contadorSesion;
			String idSesionContexto = clicksContexto.get(i).getIdSesion();
			String fechaContexto = clicksContexto.get(i).getClick().getFechaHora().toString();
			int contadorContexto = clicksContexto.get(i).getClick().getContador().getContador();
			if(i < clicksSesion.size()){
				s_fecha = clicksSesion.get(i).getFechaHora().toString();
				contadorSesion = clicksSesion.get(i).getContador().getContador() + "";
			} else {
				s_fecha = "";
				contadorSesion = "";
			}
					
	  %>
	  
	  <tr>
	  		<td><%=contadorSesion %></td>
	  		<td><%=s_fecha %></td>
	  		<%
	  			if(idSesionContexto.equals(session.getId())) {
	  		%>
	  		
	  		<td class="sesion"><%=idSesionContexto %></td>
	  		<td class="sesion"><%=contadorContexto %></td>
	  		<td class="sesion"><%=fechaContexto %></td>
	  		<%
	  			} else {
	  		%>
	  		
	  		<td><%=idSesionContexto %></td>
	  		<td><%=contadorContexto %></td>
	  		<td><%=fechaContexto %></td>
	  		
	  		<%
	  			}
	  		%>
	  		
	  		
	  </tr>
	  <% } %>
	</table>
</body>
</html>