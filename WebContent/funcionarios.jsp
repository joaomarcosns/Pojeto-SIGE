<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Funcionario"%>
<%@page import="controller.servlet.FuncionarioController"%>
<%@page import="model.Encomenda"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.servlet.EncomendaController"%>
<%@page import="controller.servlet.UsuarioController"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="pt_br">
	<head>
		<meta charset="utf-8">
		<title>SIGE	- Funcionários</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/png" href="img/favicon.png">
		<link rel="stylesheet" href="styles/home.css">
		<link rel="stylesheet" href="styles/funcionarios.css">
	</head>
	
	<%
		String userLogin = (String) session.getAttribute("user");
				String pwLogin = (String) session.getAttribute("password");
				
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
				window.location.href="delfunc?idfunc=" + id;
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
					<a href="encomendas">Encomendas</a>
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
			<div class="funcionarios-title">
				<p>Seja bem-vindo(a) <%
				out.print(userLogin);
				%>!</p>
				<h2>Funcionarios</h2>
				<div class="search-create">
					<div class="search-box">
						<input class="input" id="search" type="text" placeholder="Procurar um funcionario...">
						<button class="submit">
							<i class="fas fa-search"></i>
						</button>
					</div>
					<div class="create-box">
						<a href="cadastrar-funcionario">
							<i class="fas fa-plus"></i>
							Cadastrar funcionarios
						</a>
					</div>
				</div>
			</div>

			<div class="section-funcionarios">
				<%
				FuncionarioController funControl = new FuncionarioController();
									ArrayList<Funcionario> funcionarios = funControl.selectFuncionario();
									SimpleDateFormat data = new SimpleDateFormat("dd/MM/yyyy");
									
									if(funcionarios.size() == 0){
				%>
						<div class="no-orders">
							<h3>Não há nenhum funcionario cadastrado...</h3>
							<h4>:(</h4>
						</div> <%
					} else{
						for(int i = 0; i < funcionarios.size(); i++){ %>
						
							<div class="card-funcionarios">
								<div class="img-person-funcionario">
									<img src="img/funcionario.svg" alt="">
									<div class="person">
										<p><b>Nome:</b> <%= funcionarios.get(i).getNomeCompleto() %></p>
										<p><b>CPF:</b> <%= funcionarios.get(i).getCpf() %></p>
										<p><b>Código:</b> <%= funcionarios.get(i).getIdFuncionario() %></p>
									</div>
								</div>
								<div class="contacts-info">
									<div class="contacts">
										<p><b>Telefone:</b> <%= funcionarios.get(i).getTelefone() %></p>
										<p><b>E-mail:</b> <%= funcionarios.get(i).getEmail() %></p>
									</div>
									<div class="info1">
										<p><b>CLT:</b> <%= funcionarios.get(i).getCarteiraTrabalho() %></p>
										<p><b>Data de Registro:</b> <%= data.format(funcionarios.get(i).getDataCadastro()) %></p>
									</div>
									<div class="info2">			  
										<p><b>Salário:</b> R$ <%= String.format("%.2f", funcionarios.get(i).getSalario()) %></p>
										<p><b>Cargo:</b> <%= funcionarios.get(i).getCargo() %></p>
									</div>
								</div>
								
								<div class="address">
									<div class="address-bairro">
										<p><b>Endereço:</b> <%= funcionarios.get(i).getEndereco().getRua() %>, <%= funcionarios.get(i).getEndereco().getNumero() %></p>
										<p><b>Bairro:</b> <%= funcionarios.get(i).getEndereco().getBairro() %></p>
									</div>
									<div class="city-state">
										<p><b>Cidade:</b> <%= funcionarios.get(i).getEndereco().getCidade() %></p>
										<p><b>Estado:</b> <%= funcionarios.get(i).getEndereco().getEstado() %></p>
									</div>
								</div>
								<div class="crud-funcionario">
									<a class="update" href="attfunc?idfunc=<%= funcionarios.get(i).getIdFuncionario() %>">
										<i class="fas fa-redo"></i>
										Atualizar
									</a>
									<a class="delete" onclick="warn(<%= funcionarios.get(i).getIdFuncionario() %>)" href="#">
										<i class="fas fa-trash"></i>
										Excluir
									</a>
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
	          
	          $(".card-funcionarios").each(function(){
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
	
</html>