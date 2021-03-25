package controller.servlet;

import java.util.ArrayList;

import DAO.RemetenteDAO;
import javax.servlet.http.HttpServlet;
import model.Remetente;

public class RemetenteController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	RemetenteDAO remetenteDAO = new RemetenteDAO();

    public RemetenteController() {
        super();
    }

	public ArrayList<Remetente> selectRemetente() {
		return remetenteDAO.select();
	}
	
	public void insertRemetente(Remetente remetente) {
		remetenteDAO.insert(remetente);
	}
	
	public void updateRemetente(Remetente remetente) {
		remetenteDAO.update(remetente);
	}
	
	public void deleteRemetente(int idRemetente) {
		remetenteDAO.delete(idRemetente);
	}

}
