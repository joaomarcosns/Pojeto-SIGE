<%@page import="model.Funcionario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.servlet.FuncionarioController"%>
<%@page import="controller.servlet.UsuarioController"%>
<%@page import="controller.servlet.EncomendaController"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="pt_br">
	<head>
		<meta charset="utf-8">
		<title>SIGE	- Cadastrar veículo</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" type="image/png" href="img/favicon.png">
		<link rel="stylesheet" href="styles/home.css">
		<link rel="stylesheet" href="styles/register-vehicle.css">
		<link rel="stylesheet" href="styles/forms.css">
		<link rel="stylesheet" href="styles/notify.css">
	</head>
	
	<%
		String userLogin = (String) session.getAttribute("user");
		String pwLogin = (String) session.getAttribute("password");
		String statusCadastroVeic = (String) request.getAttribute("statusCadastroVeiculo");
		FuncionarioController func = new FuncionarioController();
		ArrayList<Funcionario> funcionarios = func.selectFuncionario();
				
		if(statusCadastroVeic != null){ %>
			<script type="text/javascript">
				alert("<%= statusCadastroVeic %>");
				window.location.href = "veiculos";
			</script> <%
		}
				
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

		<div class="register-vehicle-title">
			<p>Seja bem-vindo(a) <%= userLogin %></p>
			<h2>Cadastrar veículo</h2>
		</div>

		<main>

			<form class="form" id="register-veiculo" method="POST">

				<fieldset>

					<legend>Preencha com os dados do veículo</legend>
					
					<div class="fabr-model">
						<div class="input-block fabr">
							<label for="fabricante">Fabricante *</label>
							<input name="fabricante" id="fabricante" maxlength="20" placeholder="Ex.: Ford" required>
						</div>
						<div class="input-block model">
							<label for="model">Modelo *</label>
							<input name="model" id="model" maxlength="15" type="text" required>
						</div>
					</div>
					<div class="placa-chassi">
						<div class="input-block placa">
							<label for="placa">Placa *</label>
							<input name="placa" id="placa" type="text" maxlength="100" required>
						</div>
						<div class="input-block chassi">
							<label for="num-chassi">Número do chassi *</label>
							<input name="num-chassi" id="num-chassi" maxlength="18" type="text" required>
						</div>
					</div>
					<div class="year-color">
						<div class="input-block year">
							<label for="year">Ano *</label>
							<input name="year" id="year" type="text" maxlength="4" required>
						</div>
						<div class="input-block color">
							<label for="color">Cor *</label>
							<input name="color" id="color" type="text" maxlength="10" required>
						</div>
					</div>
					<div class="type-respon">
						<div class="input-block type">
							<label for="type">Tipo *</label>
							<input name="type" id="type" type="text" maxlength="15" required>
						</div>
					</div>

				</fieldset>

				<div class="btn-submit">
					<button type="submit" form="register-veiculo">
						<i class="fas fa-save"></i> Salvar cadastro
					</button>
				</div>

			</form>

		</main>

	</body>
	<script src="scripts/trasForm.js"></script>
	<script src="scripts/responsive.js"></script>
	<script src="scripts/mascara.js"></script>
	<script src="https://kit.fontawesome.com/e386f7fbce.js" crossorigin="anonymous"></script>
	
</html>