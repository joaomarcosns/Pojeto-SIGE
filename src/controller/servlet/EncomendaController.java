package controller.servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import DAO.DestinatarioDAO;
import DAO.EncomendaDAO;
import DAO.RemetenteDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Destinatario;
import model.Encomenda;
import model.Endereco;
import model.Remetente;
import model.Veiculo;

@WebServlet(urlPatterns = {"/encomendas", "/atualizar", "/apagar", "/entregar"})
public class EncomendaController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	EncomendaDAO encomendaDAO = new EncomendaDAO();

    public EncomendaController() {
        super();
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	String action = request.getServletPath();
    	
    	if(action.equals("/encomendas")) {
			pageEncomendas(request, response);
		}
    	else if(action.equals("/atualizar")) {
			pageAtualizar(request, response);
		}
    	else if(action.equals("/apagar")) {
			pageDelete(request, response);
		}
    	else if(action.equals("/entregar")) {
			pageEntregar(request, response);
		}
	}
    
    protected void pageEncomendas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/encomendas.jsp");
        dispatcher.forward(request, response);
  	}
    
    protected void pageAtualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/atualizar-encomenda.jsp");
        dispatcher.forward(request, response);
  	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	
    	// extraindo dados do remetente
    	String nameRem 	   	= request.getParameter("name-rem");
    	String cpfRem 		= request.getParameter("cpf-rem");
    	String emailRem 	= request.getParameter("email-rem");
    	String whatsappRem  = request.getParameter("whatsapp-rem");
    	String ruaRem 		= request.getParameter("rua-rem");
    	String numberRem 	= request.getParameter("number-rem");
    	String bairroRem 	= request.getParameter("bairro-rem");
    	String cepRem 		= request.getParameter("cep-rem");
    	String cityRem 		= request.getParameter("city-rem");
    	String stateRem 	= request.getParameter("state-rem");
    	
    	// extraindo dados do destinatario
    	String nameDest 	= request.getParameter("name-dest");
    	String cpfDest 		= request.getParameter("cpf-dest");
    	String emailDest 	= request.getParameter("email-dest");
    	String whatsappDest = request.getParameter("whatsapp-dest");
    	String ruaDest 		= request.getParameter("rua-dest");
    	String numberDest 	= request.getParameter("number-dest");
    	String bairroDest 	= request.getParameter("bairro-dest");
    	String cepDest 		= request.getParameter("cep-dest");
    	String cityDest 	= request.getParameter("city-dest");
    	String stateDest	= request.getParameter("state-dest");
    	
    	// extraindo dados da encomenda
    	int idEncomenda     = Integer.parseInt(request.getParameter("idenco"));
    	String type 		= request.getParameter("type");
    	String dataPost 	= request.getParameter("day-post");
    	String timePost 	= request.getParameter("time-at");
    	String value 		= request.getParameter("value");
    	String comprimento 	= request.getParameter("comprimento");
    	String altura 		= request.getParameter("altura");
    	String largura		= request.getParameter("largura");
    	String peso 		= request.getParameter("peso");
    	String vehicle 		= request.getParameter("vehicle");
    	String responsable 	= request.getParameter("responsable");
    	String observacoes 	= request.getParameter("obs");  
    	
    	
    	// arraylist para validação
    	ArrayList<String> remetentes = new ArrayList<>();
    	boolean validaRemetente = false;
    	remetentes.add(nameRem);
    	remetentes.add(cpfRem);
    	remetentes.add(cepRem);
    	remetentes.add(whatsappRem);
    	remetentes.add(ruaRem);
    	remetentes.add(numberRem);
    	remetentes.add(cityRem);
    	remetentes.add(bairroRem);
    	remetentes.add(stateRem);
    	
    	// arraylist para validação
    	ArrayList<String> destinatarios = new ArrayList<>();
    	boolean validaDestinatario = false;
    	destinatarios.add(nameDest);
    	destinatarios.add(cpfDest);
    	destinatarios.add(cepDest);
    	destinatarios.add(whatsappDest);
    	destinatarios.add(ruaDest);
    	destinatarios.add(numberDest);
    	destinatarios.add(bairroDest);
    	destinatarios.add(cityDest);
    	destinatarios.add(stateDest);
    	
    	// validando dados da encomenda
    	ArrayList<String> encomendas = new ArrayList<>();
    	boolean validaEncomenda = false;
    	encomendas.add(type);
    	encomendas.add(dataPost);
    	encomendas.add(timePost);
    	encomendas.add(value);
    	encomendas.add(comprimento);
    	encomendas.add(altura);
    	encomendas.add(largura);
    	encomendas.add(peso);
    	encomendas.add(vehicle);
    	encomendas.add(responsable);
    	//encomenda.add(observacoes);
    	
    	
    	for(int i = 0; i < remetentes.size(); i++){
    		if(remetentes.get(i) != null){
    			if(!remetentes.get(i).isBlank()){
    				validaRemetente = true;
    				//System.out.println(remetentes.get(i));
    			} else {
    				validaRemetente = false;
    				break;
    			}
    		}
    	}
   			 	
    	for(int i = 0; i < destinatarios.size(); i++){
    		if(destinatarios.get(i) != null){
    			if(!destinatarios.get(i).isBlank()){
    				validaDestinatario = true;
    				//System.out.println(destinatarios.get(i));
    			} else {
    				validaDestinatario = false;
    				break;
    			}
    		}
    	}
    	
    	for(int i = 0; i < encomendas.size(); i++){
    		if(encomendas.get(i) != null){
    			if(!encomendas.get(i).isBlank()){
    				validaEncomenda = true;
    				//System.out.println(encomendas.get(i));
    			} else {
    				validaEncomenda = false;
    				break;
    			}
    		}
    	}
    	
    	
    	if(validaRemetente && validaDestinatario && validaEncomenda) {
    		
    		EncomendaDAO encomendaDAO = new EncomendaDAO();
    		RemetenteDAO remetenteDAO = new RemetenteDAO();
    		DestinatarioDAO destinatarioDAO = new DestinatarioDAO();
    		Encomenda encomenda = new Encomenda();
    		Endereco endeRem = new Endereco(ruaRem, Integer.parseInt(numberRem), bairroRem, cityRem, stateRem, cepRem);
    		Endereco endeDest = new Endereco(ruaDest, Integer.parseInt(numberDest), bairroDest, cityDest, stateDest, cepDest);
    		Remetente remetente = new Remetente(nameRem, cpfRem, emailRem, whatsappRem, endeRem);
    		Destinatario destinatario = new Destinatario(nameDest, cpfDest, emailDest, whatsappDest, endeDest);
    		Veiculo veiculo = new Veiculo(Integer.parseInt(vehicle));
    		
    		try {
    			
				SimpleDateFormat stringDate = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat stringTime = new SimpleDateFormat("HH:mm");
				Date datePost = new Date(stringDate.parse(dataPost).getTime());
				Time time = new Time(stringTime.parse(timePost).getTime());
				
				
				// criando objeto remetente e mandando por banco
				remetenteDAO.update(remetente);
				
				// criando objeto destinatario e mandando pro banco
				destinatarioDAO.update(destinatario);
				
				// criando objeto encomenda
				encomenda.setIdEncomenda(idEncomenda);
				encomenda.setRemetente(remetente);
				encomenda.setDestinatario(destinatario);
    			encomenda.setVeiculo(veiculo);
    			encomenda.setValor(Double.parseDouble(value));
    			encomenda.setPeso(Double.parseDouble(peso));
    			encomenda.setAltura(Double.parseDouble(altura));
    			encomenda.setLargura(Double.parseDouble(largura));
    			encomenda.setComprimento(Double.parseDouble(comprimento));
    			encomenda.setTipo(type);
    			encomenda.setObservacoes(observacoes);
    			encomenda.setDataPostagem(datePost);
    			encomenda.setHoras(time);
    			encomenda.add15Dias(dataPost);
    			encomenda.setStatus("Pendente");
    			encomendaDAO.update(encomenda); // update encomenda no banco
    			
			} catch (Exception e) {
				System.out.println(e);
				request.setAttribute("statusAttCadastro", e);
			}

    	} else {
    		request.setAttribute("statusAttCadastro", "Dados inconclusivos!");
    	}
    	
    	request.setAttribute("statusAttCadastro", "Alteração feita com sucesso!");
    	doGet(request, response);
  	}
    
    protected void pageDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int idencomenda = Integer.parseInt(request.getParameter("idenco"));
    	encomendaDAO.delete(idencomenda);
    	response.sendRedirect("encomendas");
  	}
    
    protected void pageEntregar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int idEncomenda = Integer.parseInt(request.getParameter("idenco"));
    	encomendaDAO.updateStatus(idEncomenda);
    	response.sendRedirect("encomendas");
  	}
    
    public ArrayList<Encomenda> selectEncomenda() {
		return encomendaDAO.select();
	}
    
    public ArrayList<Encomenda> selectTop15Encomenda() {
		return encomendaDAO.selectTop15();
	}
    
    public void updateEncomenda(Encomenda encomenda) {
		encomendaDAO.update(encomenda);
	}
    
    public void deleteEncomenda(int idEncomenda) {
		encomendaDAO.delete(idEncomenda);
	}
    
    public ArrayList<Encomenda> selectAll(int idEncomenda) {
		return encomendaDAO.selectAll(idEncomenda);
	}
 
    
}