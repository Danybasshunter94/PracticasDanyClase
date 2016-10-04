package primera;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.deploy.ContextEjb;

import modelo.Click;
import modelo.ClickContexto;
import modelo.Contador;

/**
 * Servlet implementation class HelloContador
 */
//@WebServlet("/HelloContador")
public class HelloContador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HelloContador() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// con arrayList para los clicks

		ServletContext contexto = request.getServletContext();
		
		HttpSession sesion = request.getSession();
		if (sesion.getAttribute("clicks") == null) {
			sesion.setAttribute("contador", new Contador());
			sesion.setAttribute("clicks", new ArrayList<Click>());
			System.out.println("Creando el contador");
		} else {
			System.out.println("El contador esta creado");
		}

		/*ArrayList<Click> clicks = (ArrayList<Click>) sesion.getAttribute("clicks");
		if (clicks == null) {
			clicks = new ArrayList<>();
		}*/

		ArrayList<Click> clicks = (ArrayList<Click>) sesion.getAttribute("clicks");
		Contador contador = (Contador) sesion.getAttribute("contador");
		contador.setContador(contador.getContador() + 1);
		//clicks.add(new Click(new Contador(contador.getContador())));
		
		//se crea el click
		Click click = new Click(new Contador(contador.getContador()));
		clicks.add(click);
		
		// sesion.setAttribute("clicks", clicks);

		// contador de visitas, id de la sesion, y fecha actual
		String id = sesion.getId();
		Date fecha = new Date();
		
		//manejo de la lista en contexto
		if (contexto.getAttribute("clicks") == null) {
			//sesion.setAttribute("contador", new Contador());
			contexto.setAttribute("clicks", new ArrayList<ClickContexto>());
		
		}
		
		ClickContexto clickContexto = new ClickContexto(sesion.getId(), click);
		ArrayList<ClickContexto> clicksContexto = (ArrayList<ClickContexto>) contexto.getAttribute("clicks");
		clicksContexto.add(clickContexto);
		
		System.out.println(click.getContador() + " " +  click.getFechaHora());
		System.out.println(clickContexto.toString());
		System.out.println("************");
		
		//ceder control al JSP(vista)
		request.getRequestDispatcher("/jsp/clicksContexto.jsp").forward(request, response);
		
		/*PrintWriter salida = response.getWriter();
		salida.append("Id de la sesion actual: " + id + "<br/>");
		for (Click click1 : clicks) {

			salida.append("<html><body>Contador: " + click1.getContador() + ", Fecha Actual: "
					+ click1.getFechaHora() + "</br></body></html>");

		}*/

		// se muestra el contador, id y fecha
		// PrintWriter salida = response.getWriter();
		// salida.append("<html><body><p>Contador: " + contador.getContador() +
		// " La id de la sesion: " + id
		// + ", Fecha Actual: " + fecha + "</p></body></html>");

	}

	// configuracion de inicio
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		System.out.println("Cargando el servlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
