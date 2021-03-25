package controller.servlet;

import java.io.IOException;

import connection.ConnectionDatabase;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Usuario;


@WebServlet(urlPatterns = {"/sair", "/clientes"})
public class Controller extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	ConnectionDatabase dao = new ConnectionDatabase();
	Usuario user = new Usuario();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getServletPath();
		
		if(action.equals("/sair")) {
			pageSair(request, response);
		}
		else if(action.equals("/index")) {
			pageIndex(request, response);
		}

	}

	protected void pageSair(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("pages/sair.jsp");
	}
	protected void pageIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("index.jsp");
	}

}



