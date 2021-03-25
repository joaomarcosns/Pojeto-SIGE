<%@page import="connection.Connection"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="pt_br">
	<head>
		<meta charset="utf-8">
		<title>SIGE	- Clientes</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" type="image/png" href="img/favicon.png">
		<link rel="stylesheet" href="styles/home.css">
		<link rel="stylesheet" href="styles/clients.css">
	</head>
	
	<%
		String userLogin = (String) session.getAttribute("user");
				String pwLogin = (String) session.getAttribute("password");
			
				if(userLogin == null || pwLogin == null) {
			session.setAttribute("erroLogin", "Necessário fazer login!");
			response.sendRedirect("index.jsp");
				} else{
			
			connection.Connection dao = new connection.Connection();
			boolean validaLogin = dao.validaLogin(userLogin, pwLogin, true);
			
			if(!validaLogin){
				session.setAttribute("erroLogin", "Usuário ou Senha incorretos!");
				response.sendRedirect("index.jsp");
			}
				}
		%>

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
				<li class="clients-link">
					<a href="">Clientes</a>
				</li>
				<li class="employee-link">
					<a href="funcionarios.html">Funcionários</a>
				</li>
				<li class="vehicle-link">
					<a href="veiculos.html">Veículos</a>
				</li>
				<li class="acess-link">
					<a href="#">
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
			<div class="clients-title">
				<p>Seja bem-vindo(a) <% out.print(userLogin); %>!</p>
				<h2>Clientes</h2>
				<div class="search-create">
					<div class="search-box">
						<input class="input" type="text" placeholder="Procurar um cliente...">
						<button class="submit" type="submit">
							<i class="fas fa-search"></i>
						</button>
					</div>
					<div class="create-box">
						<a href="#">
							<i class="fas fa-plus"></i>
							Cadastrar Cliente
						</a>
					</div>
				</div>
			</div>

			<div class="section-clients">

				<!-- se nÃ£o hÃ¡ clientes -->
				<!-- <div class="no-orders">
					<h3>NÃ£o hÃ¡ nenhum cliente cadastrado...</h3>
					<h4>:(</h4>
				</div> -->

				<!-- se hÃ¡ clientes -->
				<div class="card-client">
					<div class="img-person-client">
						<img src="img/client.svg" alt="">
						<div class="person">
							<p><b>Nome:</b> Ismael Fernandes Silveira Bento</p>
							<p><b>CPF:</b> 152.364.987-25</p>
							<p><b>Código:</b> 156154114</p>
						</div>
					</div>
					<div class="contacts">
						<p><b>Telefone:</b> (38) 99256-5896</p>
						<p><b>E-mail:</b> ismael@email.com</p>
					</div>
					<div class="address">
						<div class="address-bairro">
							<p><b>Endereço:</b> Rua São Vicente de Paula, <b>Nº.:</b> 256</p>
							<p><b>Bairro:</b> Montes Claros</p>
						</div>
						<div class="city-state">
							<p><b>Cidade:</b> Nova Lima</p>
							<p><b>Estado:</b> Minas Gerais</p>
						</div>
					</div>
					<div class="crud-client">
						<a class="update" href="">
							<i class="fas fa-redo"></i>
							Atualizar
						</a>
						<a class="delete" href="">
							<i class="fas fa-trash"></i>
							Excluir
						</a>
					</div>
				</div>
				<div class="card-client">
					<div class="img-person-client">
						<img src="img/client.svg" alt="">
						<div class="person">
							<p><b>Nome:</b> Ismael Fernandes Silveira Bento</p>
							<p><b>CPF:</b> 152.364.987-25</p>
							<p><b>CÃ³digo:</b> 156154114</p>
						</div>
					</div>
					<div class="contacts">
						<p><b>Telefone:</b> (38) 99256-5896</p>
						<p><b>E-mail:</b> ismael@email.com</p>
					</div>
					<div class="address">
						<div class="address-bairro">
							<p><b>EndereÃ§o:</b> Rua São Vicente de Paula, <b>Nº.:</b> 256</p>
							<p><b>Bairro:</b> Montes Claros</p>
						</div>
						<div class="city-state">
							<p><b>Cidade:</b> Nova Lima</p>
							<p><b>Estado:</b> Minas Gerais</p>
						</div>
					</div>

					<div class="crud-client">
						<a class="update" href="">
							<i class="fas fa-redo"></i>
							Atualizar
						</a>
						<a class="delete" href="">
							<i class="fas fa-trash"></i>
							Excluir
						</a>
					</div>
				</div>
				<div class="card-client">
					<div class="img-person-client">
						<img src="img/client.svg" alt="">
						<div class="person">
							<p><b>Nome:</b> Ismael Fernandes Silveira Bento</p>
							<p><b>CPF:</b> 152.364.987-25</p>
							<p><b>CÃ³digo:</b> 156154114</p>
						</div>
					</div>
					<div class="contacts">
						<p><b>Telefone:</b> (38) 99256-5896</p>
						<p><b>E-mail:</b> ismael@email.com</p>
					</div>
					<div class="address">
						<div class="address-bairro">
							<p><b>EndereÃ§o:</b> Rua SÃ£o Vicente de Paula, <b>NÂº.:</b> 256</p>
							<p><b>Bairro:</b> Montes Claros</p>
						</div>
						<div class="city-state">
							<p><b>Cidade:</b> Nova Lima</p>
							<p><b>Estado:</b> Minas Gerais</p>
						</div>
					</div>
					<div class="crud-client">
						<a class="update" href="">
							<i class="fas fa-redo"></i>
							Atualizar
						</a>
						<a class="delete" href="">
							<i class="fas fa-trash"></i>
							Excluir
						</a>
					</div>
				</div>
				<div class="card-client">
					<div class="img-person-client">
						<img src="img/client.svg" alt="">
						<div class="person">
							<p><b>Nome:</b> Ismael Fernandes Silveira Bento</p>
							<p><b>CPF:</b> 152.364.987-25</p>
							<p><b>CÃ³digo:</b> 156154114</p>
						</div>
					</div>
					<div class="contacts">
						<p><b>Telefone:</b> (38) 99256-5896</p>
						<p><b>E-mail:</b> ismael@email.com</p>
					</div>
					<div class="address">
						<div class="address-bairro">
							<p><b>EndereÃ§o:</b> Rua SÃ£o Vicente de Paula, <b>NÂº.:</b> 256</p>
							<p><b>Bairro:</b> Montes Claros</p>
						</div>
						<div class="city-state">
							<p><b>Cidade:</b> Nova Lima</p>
							<p><b>Estado:</b> Minas Gerais</p>
						</div>
					</div>
					<div class="crud-client">
						<a class="update" href="">
							<i class="fas fa-redo"></i>
							Atualizar
						</a>
						<a class="delete" href="">
							<i class="fas fa-trash"></i>
							Excluir
						</a>
					</div>
				</div>

			</div>

		</section>

	</body>
	<script src="scripts/responsive.js"></script>
	<script src="https://kit.fontawesome.com/e386f7fbce.js" crossorigin="anonymous"></script>
	
</html>