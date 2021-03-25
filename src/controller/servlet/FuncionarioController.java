package controller.servlet;

import java.io.IOException;
import java.util.ArrayList;

import DAO.FuncionarioDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Endereco;
import model.Funcionario;

@WebServlet(urlPatterns = {"/funcionarios", "/cadastrar-funcionario", "/delfunc", "/attfunc"})
public class FuncionarioController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	FuncionarioDAO funcionarioDAO = new FuncionarioDAO();

    public FuncionarioController() {
        super();
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	String action = request.getServletPath();
    	
    	if(action.equals("/funcionarios")) {
			pageFuncionario(request, response);
		}
    	else if(action.equals("/cadastrar-funcionario")) {
    		pageCadFunc(request, response);
		}
    	else if(action.equals("/delfunc")) {
			pageDelete(request, response);
		}
    	else if(action.equals("/attfunc")) {
			pageAtualizar(request, response);
		}
    	
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/cadastrar-funcionario.jsp");
  		
    	String nameFunc 	 = request.getParameter("name-func");
    	String cpfFunc 		 = request.getParameter("cpf-func");
    	String cltFunc 		 = request.getParameter("clt-func");
    	String emailFunc 	 = request.getParameter("email-func");
    	String whatsappFunc  = request.getParameter("whatsapp-func");
    	String ruaFunc 		 = request.getParameter("rua-func");
    	String numberFunc 	 = request.getParameter("number-func");
    	String bairroFunc 	 = request.getParameter("bairro-func");
    	String cepFunc 		 = request.getParameter("cep-func");
    	String cidadeFunc 	 = request.getParameter("city-func");
    	String estadoFunc 	 = request.getParameter("state-func");
    	String salarioFunc 	 = request.getParameter("salary-func");
    	String cargoFunc 	 = request.getParameter("cargo-func");
    	
    	ArrayList<String> funcionarios = new ArrayList<>();
    	boolean validaFuncionario = false;
    	funcionarios.add(nameFunc);
    	funcionarios.add(cpfFunc);
    	funcionarios.add(cltFunc);
    	funcionarios.add(emailFunc);
    	funcionarios.add(whatsappFunc);
    	funcionarios.add(ruaFunc);
    	funcionarios.add(numberFunc);
    	funcionarios.add(bairroFunc);
    	funcionarios.add(cepFunc);
    	funcionarios.add(cidadeFunc);
    	funcionarios.add(estadoFunc);
    	funcionarios.add(estadoFunc);
    	funcionarios.add(salarioFunc);
    	funcionarios.add(cargoFunc);
    	
    	for (int i = 0; i < funcionarios.size(); i++) {
			if(funcionarios.get(i) != null) {
				if(!funcionarios.get(i).isBlank()) {
					validaFuncionario = true;
				} else {
					validaFuncionario = false;
					break;
				}
			}
		}
    	
    	if (validaFuncionario) {
    		
    		FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
    		Funcionario funcionario = new Funcionario();
    		Endereco endereco = new Endereco(ruaFunc, Integer.parseInt(numberFunc), bairroFunc, cidadeFunc, estadoFunc, cepFunc);
    		
    		try {
    			funcionario.setNomeCompleto(nameFunc);
        		funcionario.setCpf(cpfFunc);
        		funcionario.setCarteiraTrabalho(cltFunc);
        		funcionario.setEmail(emailFunc);
        		funcionario.setTelefone(whatsappFunc);
        		funcionario.setEndereco(endereco);
        		funcionario.setSalario(Double.parseDouble(salarioFunc));
        		funcionario.setCargo(cargoFunc);
        		funcionario.dataDeCadastro();
        		funcionarioDAO.insertFuncionario(funcionario);
			} catch (Exception e) {
				System.out.println(e);
				request.setAttribute("statusCadastroFunc", e);
			}
    		
		} else {
			request.setAttribute("statusCadastroFunc", "Dados inconclusivos!");
		}
    	request.setAttribute("statusCadastroFunc", "Cadastro concluido com sucesso!");
        dispatcher.forward(request, response);
  	}
    
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//  		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/atualizar-funcionario.jsp");
//        
//  		String nome 	= request.getParameter("name-func");
//  		String cpf 		= request.getParameter("cpf-func");
//  		String clt 		= request.getParameter("clt-func");
//  		String email 	= request.getParameter("email-func");
//  		String telefone = request.getParameter("whatsapp-func");
//  		String rua 		= request.getParameter("rua-func");
//  		String numero 	= request.getParameter("number-func");
//  		String bairro 	= request.getParameter("bairro-func");
//  		String cep 		= request.getParameter("cep-func");
//  		String cidade 	= request.getParameter("city-func");
//  		String estado 	= request.getParameter("state-func");
//  		String salario 	= request.getParameter("salary-func");
//  		String cargo 	= request.getParameter("cargo-func");
//  		String idfunc   = request.getParameter("idfunc");
//  		
//  		ArrayList<String> funcionarioV = new ArrayList<>();
//  		boolean validaFuncionario = false;
//  		funcionarioV.add(nome);
//  		funcionarioV.add(cpf);
//  		funcionarioV.add(clt);
//  		funcionarioV.add(email);
//  		funcionarioV.add(telefone);
//  		funcionarioV.add(rua);
//  		funcionarioV.add(bairro);
//  		funcionarioV.add(numero);
//  		funcionarioV.add(cep);
//  		funcionarioV.add(cidade);
//  		funcionarioV.add(estado);
//  		funcionarioV.add(salario);
//  		funcionarioV.add(cargo);
//  		
//  		for (int i = 0; i < funcionarioV.size(); i++) {
//			if(funcionarioV.get(i) != null) {
//				if (!funcionarioV.get(i).isBlank()) {
//					validaFuncionario = true;
//				} else {
//					validaFuncionario = false;
//					break;
//				}
//			}
//		}
//  		
//  		if (validaFuncionario) {
//			
//  			FuncionarioDAO func = new FuncionarioDAO();
//  			Funcionario funcionario = new Funcionario(Integer.parseInt(idfunc), nome, cpf, email, telefone, Double.parseDouble(salario),
//  					cargo, clt, null, new Endereco(rua, Integer.parseInt(numero), bairro, cidade, estado, cep));
//  			
//  			func.updateFuncinario(funcionario);
//  			
//
//		} else {
//			request.setAttribute("statusAttFunc", "Dados inconclusivos!");
//		}
//  		
//  		request.setAttribute("statusAttFunc", "Alteração feita com sucesso!");
//  		dispatcher.forward(request, response);
//  	}
    
    protected void pageFuncionario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/funcionarios.jsp");
        dispatcher.forward(request, response);
  	}
    
    protected void pageCadFunc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/cadastrar-funcionario.jsp");
        dispatcher.forward(request, response);
  	}
    
    protected void pageDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int idFuncionario = Integer.parseInt(request.getParameter("idfunc"));
    	funcionarioDAO.deletFuncionario(idFuncionario);
    	response.sendRedirect("funcionarios");
  	}
    
    protected void pageAtualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/atualizar-funcionario.jsp");
        dispatcher.forward(request, response);
  	}
    
    public ArrayList<Funcionario> selectFuncionario() {
		return funcionarioDAO.select();
	}
    
    public ArrayList<Funcionario> selectID(int idFuncionario) {
		return funcionarioDAO.selectID(idFuncionario);
	}

}
