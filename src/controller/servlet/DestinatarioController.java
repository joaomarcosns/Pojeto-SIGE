package controller.servlet;

import java.util.ArrayList;

import DAO.DestinatarioDAO;
import javax.servlet.http.HttpServlet;
import model.Destinatario;

public class DestinatarioController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	DestinatarioDAO destinatarioDAO = new DestinatarioDAO();

    public DestinatarioController() {
        super();
    }

	public ArrayList<Destinatario> selectDestinatario() {
		return destinatarioDAO.select();
	}
	
	public void insertDestinatario(Destinatario destinatario) {
		destinatarioDAO.insert(destinatario);
	}
	
	public void updateDestinatario(Destinatario destinatario) {
		destinatarioDAO.update(destinatario);
	}
	
	public void deleteDestinatario(int idDestinatario) {
		destinatarioDAO.delete(idDestinatario);
	}

}
