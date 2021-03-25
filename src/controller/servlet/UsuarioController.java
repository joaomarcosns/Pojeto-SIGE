package controller.servlet;

import java.util.ArrayList;

import DAO.UsuarioDAO;
import javax.servlet.http.HttpServlet;
import model.Usuario;

public class UsuarioController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	UsuarioDAO userDAO = new UsuarioDAO();
	Usuario user = new Usuario();

    public UsuarioController() {
        super();
    }

	public boolean validaLogin(String user, String password, boolean online) {
		return userDAO.validaLogin(user, password, online);
	}
	
	public void insertUser(String usr, String senha, String email, int nc, boolean on) {
		user.setNome(usr);
		user.setSenha(senha);
		user.setEmail(email);
		user.setNivelConta(nc);
		user.setOnline(on);
		userDAO.insertUser(user);
	}
	
    public void deleteUser(int id) {
    	userDAO.removerUser(id);
    }
    
    public ArrayList<Usuario> selectUser() {
		return userDAO.selectUser();
	}

}
