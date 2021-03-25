<%@page import="controller.servlet.UsuarioController"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="pt_br">
	<head>
		<meta charset="utf-8">
		<title>SIGE	- Cadastrar funcionario</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" type="image/png" href="img/favicon.png">
		<link rel="stylesheet" href="styles/home.css">
		<link rel="stylesheet" href="styles/register-func.css">
		<link rel="stylesheet" href="styles/forms.css">
	</head>

	<%
		String userLogin = (String) session.getAttribute("user");
		String pwLogin = (String) session.getAttribute("password");
		String validaCadastro = (String) request.getAttribute("statusCadastroFunc");
		UsuarioController user = new UsuarioController();
		
		if(validaCadastro != null){ %>
			<script type="text/javascript">
				alert("<%= validaCadastro %>");
				window.location.href = "funcionarios";
			</script> <%
		}
						
		if(userLogin == null || pwLogin == null) {
			session.setAttribute("erroLogin", "Necessário fazer login!");
			response.sendRedirect("login");
		} else {
			
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

		<div class="register-orders-title">
			<p>Seja bem-vindo(a) <% out.print(userLogin); %>!</p>
			<h2>Cadastrar funcionário</h2>
		</div>

		<main>

			<form class="form" action="" id="register-funcionario" method="POST">

				<fieldset>

					<div class="title">
						<legend>Dados do funcionário</legend>
					</div>

					<div class="input-block">
						<label for="name-func">Nome completo *</label>
						<input name="name-func" oninput="validaInput(this)" id="name-func" placeholder="Ex.: Ana Maria Silva" required>
					</div>

					<div class="cpf-clt">
						<div class="input-block cpf">
							<label for="cpf-func">CPF<small> (somente números)</small> *</label>
							<input oninput="mascara(this, 'cpf')" type="text" name="cpf-func" id="cpf-func" placeholder="Ex.: 123.456.789-10" required>
						</div>
						<div class="input-block clt">
							<label for="clt-func">Carteira de trabalho</label>
							<input type="text" name="clt-func" id="clt-func" placeholder="Ex.: 123.456.789-10" required>
						</div>
					</div>
					

					<div class="contact">
						<div class="input-block email">
							<label for="email-func">E-mail</label>
							<input name="email-func" oninput="validaInput(this)" id="email-func" type="text" placeholder="email@email.com">
						</div>
	
						<div class="input-block wpp">
							<label for="whatsapp-func">Contato
								<i class="fab fa-whatsapp"></i>
								<small> (somente números)</small> *
							</label>
							<input oninput="mascara(this, 'tel')" type="text" name="whatsapp-func" id="whatsapp-func" required>
						</div>
					</div>

					<div class="input-block">
						<label for="rua-func">Endereço *</label>
						<input name="rua-func" oninput="validaInput(this)" id="rua-func" type="text" required>
					</div>

					<div class="bairro-num">
						<div class="input-block number">
							<label for="number-func">Número *</label>
							<input name="number-func" id="number-func" min="1" max="999999" type="number" required>
						</div>
	
						<div class="input-block bairro">
							<label for="bairro-func">Bairro *</label>
							<input name="bairro-func" oninput="validaInput(this)" id="bairro-func" type="text" required>
						</div>
					</div>

					<div class="city-state-cep">
						<div class="input-block cep">
							<label for="cep-func">CEP *</label>
							<input name="cep-func" oninput="mascara(this, 'cep')" id="city-func" type="text" required>
						</div>
						<div class="input-block city">
							<label for="city-func">Cidade *</label>
							<input name="city-func" oninput="validaInput(this)" id="city-func" type="text" required>
						</div>
						<div class="input-block state">
							<label for="state-func">Estado *</label>
							<select name="state-func" id="state-func" required>
								<option value="" selected disabled>Selecione</option>
								<option value="AC">Acre</option>
								<option value="AL">Alagoas</option>
								<option value="AP">Amapá</option>
								<option value="AM">Amazonas</option>
								<option value="BA">Bahia</option>
								<option value="CE">Ceará</option>
								<option value="DF">Distrito Federal</option>
								<option value="ES">Espirito Santo</option>
								<option value="GO">Goiás</option>
								<option value="MA">Maranhão</option>
								<option value="MT">Mato Grosso</option>
								<option value="MS">Mato Grosso do Sul</option>
								<option value="MG">Minas Gerais</option>
								<option value="PA">Pará</option>
								<option value="PB">Paraíba</option>
								<option value="PR">Paraná</option>
								<option value="PE">Pernambuco</option>
								<option value="PI">Piauí</option>
								<option value="RJ">Rio de Janeiro</option>
								<option value="RN">Rio Grande do Norte</option>
								<option value="RS">Rio Grande do Sul</option>
								<option value="RO">Rondônia</option>
								<option value="RR">Roraima</option>
								<option value="SC">Santa Catarina</option>
								<option value="SP">São Paulo</option>
								<option value="SE">Sergipe</option>
								<option value="TO">Tocantins</option>
							</select>
						</div>
					</div>

					<div class="importants">
						<div class="input-block salario">
							<label for="salary-func">Salário *</label>
							<input name="salary-func" id="salary-func" min="0.01" max="999999" step="0.01" type="number" required>
						</div>
						<div class="input-block cargo">
							<label for="cargo-rem">Cargo *</label>
							<select name="cargo-func" id="cargo-func" required>
								<option value="" selected disabled>Selecione</option>
								<option value="Motorista">Motorista</option>
								<option value="Entregador">Entregador</option>
								<option value="Recepcionista">Recepcionista</option>
							</select>
						</div>
					</div>
					
				</fieldset>

				<div class="btn-submit">
					<button type="submit" form="register-funcionario">
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