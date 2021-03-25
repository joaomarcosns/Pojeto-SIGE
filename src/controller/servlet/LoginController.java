package controller.servlet;

import java.io.IOException;
import DAO.UsuarioDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Usuario;

@WebServlet(urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	Usuario user = new Usuario();
	UsuarioDAO userDao = new UsuarioDAO();

    public LoginController() {
        super();
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request, response);
    }
    
    //	Função para validação de login
	protected boolean validaLogin(String user, String password, boolean online) {
		return userDao.validaLogin(user, password, online);
	}
	
	protected void insertUser(String usr, String senha, String email, int nc, boolean on) {
		user.setNome(usr);
		user.setSenha(senha);
		user.setEmail(email);
		user.setNivelConta(nc);
		user.setOnline(on);
		userDao.insertUser(user);
	}
	
    protected void deleteUser(int id) {
    	userDao.removerUser(id);
    }
    
}