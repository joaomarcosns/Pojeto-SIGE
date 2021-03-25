package controller.servlet;

import java.io.IOException;
import java.util.ArrayList;

import DAO.VeiculoDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Veiculo;

@WebServlet(urlPatterns = {"/veiculos", "/cadastrar-veiculo", "/delveic", "/editveic"})
public class VeiculoController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	VeiculoDAO veiDAO = new VeiculoDAO();
	Veiculo vei = new Veiculo();
	
    public VeiculoController() {
        super();
    }
    
    @Override
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String action = request.getServletPath();
    	
    	if(action.equals("/veiculos")) {
			pageVeiculos(request, response);
		}
    	else if(action.equals("/cadastrar-veiculo")) {
			pageCadVeiculo(request, response);
		}
    	else if(action.equals("/delveic")) {
			pageDelete(request, response);
		}
    	else if(action.equals("/editveic")) {
			pageAtualizar(request, response);
		}
   	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	ArrayList<String> veiculos = new ArrayList<>();
    	boolean validaVeiculo = false;
    	
    	String fabricante 	= request.getParameter("fabricante");
    	String modelo 		= request.getParameter("model");
    	String placa 		= request.getParameter("placa");
    	String numChassi 	= request.getParameter("num-chassi");
    	String ano 			= request.getParameter("year");
    	String cor 			= request.getParameter("color");
    	String tipo 		= request.getParameter("type");
    	
    	veiculos.add(fabricante);
    	veiculos.add(modelo);
    	veiculos.add(placa);
    	veiculos.add(numChassi);
    	veiculos.add(ano);
    	veiculos.add(cor);
    	veiculos.add(tipo);
    	
    	for (int i = 0; i < veiculos.size(); i++) {
			if (veiculos.get(i) != null) {
				if (!veiculos.get(i).isBlank()) {
					validaVeiculo = true;
				} else {
					validaVeiculo = false;
					break;
				}
			}
		}
  
    	if (validaVeiculo) {
    		Veiculo veiculo = new Veiculo(fabricante, modelo, tipo, placa, cor, ano, numChassi);
    		VeiculoDAO veiculoDAO = new VeiculoDAO();
    		veiculoDAO.insert(veiculo);
    		request.setAttribute("statusCadastroVeiculo", "Cadastro realizado Com sucesso!");
		} else {
			request.setAttribute("statusCadastroVeiculo", "Dados inconclusivos!");
		}

		doGet(request, response);
	}
	
    protected void pageVeiculos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/veiculos.jsp");
        dispatcher.forward(request, response);
  	}
    
    protected void pageCadVeiculo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/cadastrar-veiculo.jsp");
        dispatcher.forward(request, response);
  	}
    
    protected void pageDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int idVeiculo = Integer.parseInt(request.getParameter("idveic"));
    	veiDAO.deleteVeiculo(idVeiculo);
    	response.sendRedirect("veiculos");
  	}
    
    protected void pageAtualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/atualizar-veiculo.jsp");
        dispatcher.forward(request, response);
  	}
    
    
    ///////////////////////////////////////////////////////
    ///////////////// CONTROLLER do DAO ///////////////////
    ///////////////////////////////////////////////////////
    
    public void insertVeiculo(Veiculo veiculo) {
		veiDAO.insert(veiculo);
	}
    
    public void updateVeiculo(Veiculo veiculo) {
		veiDAO.updateVeiculo(veiculo);
	}
    
    public void deleteVeiculo(int idVeiculo) {
		veiDAO.deleteVeiculo(idVeiculo);
	}

	public ArrayList<Veiculo> selectVeiculo() {
		return veiDAO.selectVeiculo();
	}

}
