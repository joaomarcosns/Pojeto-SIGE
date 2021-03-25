<%@page import="model.Veiculo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.servlet.VeiculoController"%>
<%@page import="controller.servlet.UsuarioController"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="pt_br">
	<head>
		<meta charset="utf-8">
		<title>SIGE	- Veículos</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" type="image/png" href="img/favicon.png">
		<link rel="stylesheet" href="styles/home.css">
		<link rel="stylesheet" href="styles/veiculos.css">
	</head>
	
	<%
		String userLogin = (String) session.getAttribute("user");
		String pwLogin = (String) session.getAttribute("password");
		VeiculoController veic = new VeiculoController();
		ArrayList<Veiculo> veiculos = veic.selectVeiculo();
			
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
				window.location.href="delveic?idveic=" + id;
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
			<div class="veiculos-title">
				<p>Seja bem-vindo(a) <%= userLogin %>!</p>
				<h2>Veículos</h2>
				<div class="search-create">
					<div class="search-box">
						<input class="input" type="text" id="search" oninput="validaInput(this)" placeholder="Procurar um veículo...">
						<button class="submit">
							<i class="fas fa-search"></i>
						</button>
					</div>
					<div class="create-box">
						<a href="cadastrar-veiculo">
							<i class="fas fa-plus"></i>
							Cadastrar um veículo
						</a>
					</div>
				</div>
			</div>

			<div class="section-veiculos"><%
				if(veiculos.size() == 0){ %>
					<div class="no-veiculos">
						<h3>Não há nenhum veículo cadastrado...</h3>
						<h4>:(</h4>
					</div> <%	
				} else {
					for(int i = 0; i < veiculos.size(); i++) { %>
					<div class="card-veiculo">
						<div class="veiculo-specs">
							<div class="img">
								<img src="img/truck.svg" alt="">
							</div>
							<div class="specs">
								<div class="specs1">
									<p><b>Fabricante:</b> <%= veiculos.get(i).getFabricante() %></p>
									<p><b>Modelo:</b> <%= veiculos.get(i).getModelo() %></p>
								</div>
								<div class="specs2">
									<p><b>Tipo:</b> <%= veiculos.get(i).getTipo() %></p>
									<p><b>Código:</b> <%= veiculos.get(i).getIdVeiculo() %></p>
								</div>
							</div>
						</div>
						<div class="descript">
							<div class="descript-specs1">
								<p><b>Ano:</b> <%= veiculos.get(i).getAno() %></p>
								<p><b>Chassi:</b> <%= veiculos.get(i).getNumeroChassi() %></p>
							</div>
							<div class="descript-specs2">
								<p><b>Placa:</b> <%= veiculos.get(i).getPlaca() %></p>
								<p><b>Cor:</b> <%= veiculos.get(i).getCor() %></p>
							</div>
						</div>
						<div class="crud-veiculo">
							<a class="update" href="editveic?idveic=<%= veiculos.get(i).getIdVeiculo() %>">
								<i class="fas fa-redo"></i>
								Atualizar
							</a>
							<a class="delete" onclick="warn(<%= veiculos.get(i).getIdVeiculo() %>)" href="#">
								<i class="fas fa-trash"></i>
								Excluir
							</a>
						</div>
					</div> <%
					} 
				} %>

			</div>

		</section>

	</body>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script>
		$(function(){ 
	        $("#search").keyup(function(){
	          var texto = $(this).val();
	          
	          $(".card-veiculo").each(function(){
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