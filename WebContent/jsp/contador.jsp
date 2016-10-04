<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="modelo.Contador"%>
<%@page import="modelo.Click"%>
<%@page import="primera.HelloContador"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contador JSP</title>
</head>
<body>

	<%
	
	if (session.getAttribute("clicks") == null) {
		session.setAttribute("contador", new Contador());
		session.setAttribute("clicks", new ArrayList<Click>());
		System.out.println("Creando el contador");
	} else {
		System.out.println("El contador esta creado");
	}

	ArrayList<Click> clicks = (ArrayList<Click>) session.getAttribute("cliks");
	if (clicks == null) {
		clicks = new ArrayList<Click>();
	}

	Contador contador = (Contador) session.getAttribute("contador");
	contador.setContador(contador.getContador() + 1);
	clicks.add(new Click(new Contador(contador.getContador())));

	

	// contador de visitas, id de la sesion, y fecha actual
	String id = session.getId();
	Date fecha = new Date();
	//PrintWriter salida = response.getWriter();
	//salida.append("Id de la sesion actual: " + id + "<br/>");
	out.println("Id de la sesion actual: " + id + "<br/>");
	for (Click click1 : clicks) {

		out.println("<html><body>Contador: " + click1.getContador() + ", Fecha Actual: "
				+ click1.getFechaHora() + "</br></body></html>");

	} %>

</body>
</html>