<%@page import="java.text.SimpleDateFormat"%>
<%@page import="controller.servlet.UsuarioController"%>
<%@page import="model.Encomenda"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.servlet.EncomendaController"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="pt_br">
	<head>
		<meta charset="utf-8">
		<title>SIGE	- Encomendas</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/png" href="img/favicon.png">
		<link rel="stylesheet" href="styles/home.css">
		<link rel="stylesheet" href="styles/orders.css">
	</head>
	
	<%
		String userLogin = (String) session.getAttribute("user");
		String pwLogin = (String) session.getAttribute("password");
		EncomendaController encomenda = new EncomendaController();
		
		if(userLogin == null || pwLogin == null) {
			session.setAttribute("erroLogin", "Necessário fazer login!");
			response.sendRedirect("login");
		} else{
			
			UsuarioController user = new UsuarioController();
			boolean validaLogin = user.validaLogin(userLogin, pwLogin, true);
			
			if(!validaLogin){
				response.sendRedirect("login");
			}
		}
	%>
	
	<script type="text/javascript">
	
		function warn(id){
			var resp = confirm("ID: "+ id +" Você está seguro de que quer fazer isso?\nEssa alteração não poderá ser desfeita...");
			
			if(resp){
				window.location.href="apagar?idenco=" + id;
			} else{
				alert("Nenhuma alteração foi feita!")
			}
			
		}
		
		function check(id){
			var resp = confirm("Marcar a encomenda "+ id +" como entregue?");
			
			if(resp){
				alert("Sucesso!");
				window.location.href="entregar?idenco=" + id;
			} else{
				alert("Nenhuma alteração foi feita!")
			}
		}

	</script>

	<body>
	
		<nav>
			<div class="logo">
				<a href="home">
					<img src="img/logo-home.png" alt="Logo SIGE">
				</a>
			</div>

			<ul class="nav-links">
				<li class="orders-link">
					<a href="">Encomendas</a>
				</li> 
				<li class="employee-link">
					<a href="funcionarios">Funcionários</a>
				</li>
				<li class="vehicle-link">
					<a href="veiculos">Veículos</a>
				</li>
				<li class="acess-link">
					<a href="sair">
						<img src="img/exit.png" alt="Sair">
					</a>
				</li>
			</ul>

			<div class="burger">
				<div class="linha1"></div>
				<div class="linha2"></div>
				<div class="linha3"></div>
			</div>
		</nav>

		<section>
			
			<div class="orders-title">
				<p>Seja bem-vindo(a) <%= userLogin %>!</p>
				<h2>Encomendas</h2>
				<div class="search-create">
					<div class="search-box">
						<input class="input" id="search" type="text" oninput="validaInput(this)" name="search-order" maxlength="50" placeholder="Procurar uma encomenda...">
						<button class="submit">
							<i class="fas fa-search"></i>
						</button>
					</div>
					<div class="create-box">
						<a href="cadastrar-encomenda">
							<i class="fas fa-plus"></i>
							Cadastrar Encomenda
						</a>
					</div>
				</div>
			</div>
			
			<div class="section-orders">
				
				<% 
				
					ArrayList<Encomenda> encomendas = encomenda.selectEncomenda();
					SimpleDateFormat data = new SimpleDateFormat("dd/MM/yyyy");
					SimpleDateFormat time = new SimpleDateFormat("HH:mm");
					
					// se não há encomendas
					if(encomendas.size() == 0){%>
						<div class="no-orders">
							<h3>Não há nenhuma encomenda...</h3>
							<h4>:(</h4>
						</div> <%
					} else{
						// se há encomendas
						for(int i = 0; i < encomendas.size(); i++){ %>
							<div class="card-order">
								<div class="code">
									<p><b>Codigo:</b> <%= encomendas.get(i).getIdEncomenda() %></p>
									<p><b>Status:</b> <%= encomendas.get(i).getStatus() %></p>
								</div>
								<div class="remet">
									<p><b>Remetente:</b> <%= encomendas.get(i).getRemetente().getNomeCompleto() %></p>
									<p><b>CPF:</b> <%= encomendas.get(i).getRemetente().getCpf() %></p>
									<p>
										<b>Endereço:</b> <%= encomendas.get(i).getRemetente().getEndereco().getRua() %>, 
										Nº <%= encomendas.get(i).getRemetente().getEndereco().getNumero() %>
										Bairro <%= encomendas.get(i).getRemetente().getEndereco().getBairro() %> - 
										<%= encomendas.get(i).getRemetente().getEndereco().getCidade() %>-
										<%= encomendas.get(i).getRemetente().getEndereco().getEstado() %> /
										CEP <%= encomendas.get(i).getRemetente().getEndereco().getCep() %>
									</p>
									<p><b>Contato:</b> <%= encomendas.get(i).getRemetente().getTelefone() %></p>
									<p><b>E-mail:</b> <%= encomendas.get(i).getRemetente().getEmail() %></p>
								</div>
								<div class="dest">
									<p><b>Destinatário:</b> <%= encomendas.get(i).getDestinatario().getNomeCompleto() %></p>
									<p><b>CPF:</b> <%= encomendas.get(i).getDestinatario().getCpf() %></p>
									<p>
										<b>Endereço:</b> <%= encomendas.get(i).getDestinatario().getEndereco().getRua() %>,
										Nº <%= encomendas.get(i).getDestinatario().getEndereco().getNumero() %> -
										Bairro <%= encomendas.get(i).getDestinatario().getEndereco().getBairro() %> -
										<%= encomendas.get(i).getDestinatario().getEndereco().getCidade() %> -
										<%= encomendas.get(i).getDestinatario().getEndereco().getEstado() %> /
										CEP <%= encomendas.get(i).getDestinatario().getEndereco().getCep() %>
									</p>
									<p><b>Contato:</b> <%= encomendas.get(i).getDestinatario().getTelefone() %></p>
									<p><b>E-mail:</b> <%= encomendas.get(i).getDestinatario().getEmail() %></p>
								</div>
								<div class="specs">
									<div class="descrip">
										<p><b>Tipo:</b> <%= encomendas.get(i).getTipo() %></p>
										<p><b>Altura:</b> <%= String.format("%.2f", encomendas.get(i).getAltura()) %> cm</p>
										<p><b>Largura:</b> <%= String.format("%.2f", encomendas.get(i).getLargura()) %> cm</p>
										<p><b>Comprimento:</b> <%= String.format("%.2f", encomendas.get(i).getComprimento()) %> cm</p>
									</div>
									<div class="data">
										<p><b>Peso:</b> <%= String.format("%.2f", encomendas.get(i).getPeso()) %> kg</p>
										<p><b>Valor:</b> R$ <%= String.format("%.2f", encomendas.get(i).getValor()) %></p>
										<p><b>Postagem:</b> <%= data.format(encomendas.get(i).getDataPostagem()) %></p>
										<p><b>Prev. Entrega:</b> <%= data.format(encomendas.get(i).getDataPrevisao()) %></p>
									</div>
									<div class="respon">
										<p><b>Postado às:</b> <%= time.format(encomendas.get(i).getHoras())  %></p>
										<p><b>Responsável:</b> <%= encomendas.get(i).getFuncionario().getNomeCompleto() %></p>
										<p><b>Veículo:</b> <%= encomendas.get(i).getVeiculo().getModelo() %></p>
									</div>
								</div> <% 
								
								if(encomendas.get(i).getObservacoes() != null){ 
									if(!encomendas.get(i).getObservacoes().isBlank()){ %>
									<div class="obs">
										<p><b>Observações:</b> <%= encomendas.get(i).getObservacoes() %></p>
									</div> <%
									} 
								} %>
								
								<div class="crud-order">
									<a class="update" href="atualizar?idenco=<%= encomendas.get(i).getIdEncomenda() %>">
										<i class="fas fa-redo"></i>
										Atualizar
									</a>
									<a class="delete" onclick="warn(<%= encomendas.get(i).getIdEncomenda() %>)" href="#">
										<i class="fas fa-trash"></i>
										Excluir
									</a> <%
									if(encomendas.get(i).getStatus().equals("Pendente")){ %>
										<a class="checked" onclick="check(<%= encomendas.get(i).getIdEncomenda() %>)" href="#">
											<i class="fas fa-clipboard-check"></i>
											Entregar
										</a> <% 
									} %>
								</div>
							</div> <%
						}
					}
				%>
			</div>
		</section>

	</body>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script>
		$(function(){ 
	        $("#search").keyup(function(){
	          var texto = $(this).val();
	          
	          $(".card-order").each(function(){
	            var resultado = $(this).text().toUpperCase().indexOf(' '+texto.toUpperCase());
	            
	            if(resultado < 0){
	            	$(this).fadeOut()
	            } else{
	            	$(this).fadeIn();
	            } 
	            
	        }); 
	      });
	   });
	</script>
	<script src="scripts/responsive.js"></script>
	<script src="https://kit.fontawesome.com/e386f7fbce.js" crossorigin="anonymous"></script>
	<script src="scripts/mascara.js"></script>
	
</html>