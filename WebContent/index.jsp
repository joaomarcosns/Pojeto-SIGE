<%@page import="controller.servlet.UsuarioController"%>
<%@page import="model.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="pt_br">
	<head>
		<meta charset="utf-8">
		<title>SIGE - Sistema de Gerenciamento de Encomendas</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/png" href="img/favicon.png">
		<link rel="stylesheet" href="styles/main.css">
	</head>

	<body id="container">
	
		<%
			String userLogin = (String) session.getAttribute("user");
			String pwLogin = (String) session.getAttribute("password");
			UsuarioController userControll = new UsuarioController();
			boolean validaLogin = false;
							
			if(userLogin != null || pwLogin != null) {
				if(userControll.validaLogin(userLogin, pwLogin, true)){
					response.sendRedirect("home");
				}
			}

		%>
		
		<div class="area-login">
			<form action="login" method="post">
				<div class="input-box">
					<img class="user-img" src="img/user.svg" alt="User">
					<img class="logo-img" src="img/login-logo.png" alt="User">
					<p>USUÁRIO</p>
					<input type="text" oninput="validaInput(this)" name="user" maxlength="15" required/>
					<p>SENHA</p>
					<input type="password" oninput="validaInput(this)" name="password" maxlength="15" placeholder="••••••••••••••" required/>

					<div class="btn-login">
						<input type="submit" value="ENTRAR">
					</div>
					<% 
						String erro = (String) session.getAttribute("erroLogin");
						if(erro != null){
							%>
							<div class="error">
								<p><%= erro %></p>
								<% session.invalidate(); %>
							</div>
							<%
						} else{
							%><p></p><%
						}
					%>
					<a href="#">Esqueceu sua senha?</a>
					
				</div>
			</form>
		</div>
		
		<div class="img-logo">
			<img src="img/login-logo.png" alt="SIGE - Logo">
			<p>SISTEMA DE GERENCIAMENTO<br>DE ENCOMENDAS</p>
		</div>
		
		<%	
			
			String user = request.getParameter("user");
			String pw = request.getParameter("password");
			
			if(user != null && pw != null){
				session.setAttribute("user", user);
				session.setAttribute("password", pw);
				response.sendRedirect("home");
			}
			
		%>
		
	</body>

	<footer>
		<p>© Sistema desenvolvido por 
			<a href="https://github.com/net0xy" target="_blank">
				<i class="fab fa-github"></i> Neto Sepulveda</a> e 
			<a href="https://github.com/JOaOMARcosNs" target="_blank"> 
				<i class="fab fa-github"></i> João Marcos
			</a>
		</p>
	</footer>
	
	<script src="scripts/mascara.js"></script>
	<script src="https://kit.fontawesome.com/e386f7fbce.js" crossorigin="anonymous"></script>
	
</html>