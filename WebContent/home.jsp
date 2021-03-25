<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Encomenda"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.servlet.EncomendaController"%>
<%@page import="controller.servlet.UsuarioController"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="pt_br">
	<head>
		<meta charset="utf-8">
		<title>SIGE	- Página inicial</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" type="image/png" href="img/favicon.png">
		<link rel="stylesheet" href="styles/home.css">
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
				session.setAttribute("erroLogin", "Usuário ou Senha incorretos!");
				response.sendRedirect("login");
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
				<li>
					<a href="encomendas">Encomendas</a>
				</li> 
				<li>
					<a href="funcionarios">Funcionários</a>
				</li>
				<li>
					<a href="veiculos">Veículos</a>
				</li>
				<li>
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
		
		<div class="lasts-orders-body">
			<div class="last-orders">
				<p>Seja bem-vindo(a) <%= userLogin %>!</p>
				<h2>Ultimas encomendas</h2>
				
				<%
					
					EncomendaController enco = new EncomendaController();
					ArrayList<Encomenda> encomendas = enco.selectTop15Encomenda();
					SimpleDateFormat data = new SimpleDateFormat("dd/MM/yyyy");
					
					// se não há encomendas
					if(encomendas.size() == 0){ %>
						<div class="no-orders">
							<h3>Não há nenhuma encomenda...</h3>
							<h4>:(</h4>
						</div> <%
					} else{
						
						// se há encomendas %>
						<table class="table table-responsive">
							<thead> 
								<tr>
									<th class="cod">código</th>
									<th class="de">de</th>	
									<th class="para">para</th>	
									<th class="post">postagem</th>	
									<th class="pre">previ. entrega</th>	
									<th class="vrm">status</th>
								</tr>
							</thead>
							<tbody> <%
						for(int i = 0; i < encomendas.size(); i++) { %>
								<tr> <%
								if(i+1 == encomendas.size()) { %>
									<td style="border-end-start-radius: 10px;" class="show-code"><%= encomendas.get(i).getIdEncomenda() %></td> <%
								} else{%>
									<td class="show-code"><%= encomendas.get(i).getIdEncomenda() %></td><%
								} %>
									<td class="show-city1"><%= encomendas.get(i).getRemetente().getEndereco().getCidade()+"-"+encomendas.get(i).getRemetente().getEndereco().getEstado() %></td>
									<td class="show-city2"><%= encomendas.get(i).getDestinatario().getEndereco().getCidade()+"-"+encomendas.get(i).getDestinatario().getEndereco().getEstado() %></td>	
									<td class="show-date1"><%= data.format(encomendas.get(i).getDataPostagem()) %></td>	
									<td class="show-date2"><%= data.format(encomendas.get(i).getDataPrevisao()) %></td> <%
								if(i+1 == encomendas.size()) { %>
									<td style="border-end-end-radius: 10px;" class="show-status"> <%
								} else{%>
									<td class="show-status"> <%
								} %>
										<%= encomendas.get(i).getStatus() %>
									</td>	
								</tr> <%
						} %>
							</tbody>
						</table> <%
					} %>

			</div>
		</div>

	</body>
	<script src="scripts/responsive.js"></script>
	
</html>