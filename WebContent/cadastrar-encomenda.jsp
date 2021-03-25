<%@page import="model.Funcionario"%>
<%@page import="controller.servlet.FuncionarioController"%>
<%@page import="model.Destinatario"%>
<%@page import="controller.servlet.DestinatarioController"%>
<%@page import="controller.servlet.RemetenteController"%>
<%@page import="model.Remetente"%>
<%@page import="controller.servlet.VeiculoController"%>
<%@page import="controller.servlet.UsuarioController"%>
<%@page import="model.Usuario"%>
<%@page import="model.Veiculo"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="pt_br">
	<head>
		<meta charset="utf-8">
		<title>SIGE	- Cadastrar encomenda</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/png" href="img/favicon.png">
		<link rel="stylesheet" href="styles/home.css">
		<link rel="stylesheet" href="styles/register-orders.css">
		<link rel="stylesheet" href="styles/forms.css">
	</head>
	
	<%
		String userLogin = (String) session.getAttribute("user");
				String pwLogin = (String) session.getAttribute("password");
				String validaCadastro = (String) request.getAttribute("statusCadastro");
				UsuarioController user = new UsuarioController();
				DestinatarioController dest = new DestinatarioController();
				RemetenteController rem = new RemetenteController();
				VeiculoController veiculo = new VeiculoController();
				FuncionarioController func = new FuncionarioController();
				
				ArrayList<Veiculo> veiculos = veiculo.selectVeiculo();
				ArrayList<Remetente> remetentes = rem.selectRemetente();
				ArrayList<Destinatario> destinatarios = dest.selectDestinatario();
				ArrayList<Funcionario> funcionarios = func.selectFuncionario();

			
				if(validaCadastro != null){
		%>
			<script type="text/javascript">
				alert("<%= validaCadastro %>");
				window.location.href = "home";
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
	
	<script>

		function sugestionRemetente(){
			
			var remetentes = [];
			var index = document.getElementById("select-sugestion-rem").value;
			var remetenteGet = {
				name 	 : document.getElementById("name-rem"),
				cpf 	 : document.getElementById("cpf-rem"),
				cpffake	 : document.getElementById("cpf-rem-fake"),
				email	 : document.getElementById("email-rem"),
				whatsApp : document.getElementById("whatsapp-rem"),
				rua		 : document.getElementById("rua-rem"),
				number 	 : document.getElementById("number-rem"),
				bairro 	 : document.getElementById("bairro-rem"),
				city	 : document.getElementById("city-rem"),
				state 	 : document.getElementById("state-rem"),
				cep 	 : document.getElementById("cep-rem")
			}
			
			if(index){
				remetenteGet.cpf.disabled = true;
			} else{
				remetenteGet.cpf.disabled = false;
			} <%
			
			for(int i = 0; i < remetentes.size(); i++){ %>
				var remetenteObj = {};
				remetenteObj.nome = "<%= remetentes.get(i).getNomeCompleto() %>";
				remetenteObj.cpf = "<%= remetentes.get(i).getCpf() %>";
				remetenteObj.cpffake = "<%= remetentes.get(i).getCpf() %>";
				remetenteObj.email = "<%= remetentes.get(i).getEmail() %>";
				remetenteObj.whatsapp = "<%= remetentes.get(i).getTelefone() %>";
				remetenteObj.rua = "<%= remetentes.get(i).getEndereco().getRua() %>";
				remetenteObj.number= "<%= remetentes.get(i).getEndereco().getNumero() %>";
				remetenteObj.bairro = "<%= remetentes.get(i).getEndereco().getBairro() %>";
				remetenteObj.city = "<%= remetentes.get(i).getEndereco().getCidade() %>";
				remetenteObj.state = "<%= remetentes.get(i).getEndereco().getEstado() %>";
				remetenteObj.cep = "<%= remetentes.get(i).getEndereco().getCep() %>";
				remetentes.push(remetenteObj); <%
			} %>

			if(remetentes[index]){
				remetenteGet.name.value = remetentes[index].nome;
				remetenteGet.cpf.value = remetentes[index].cpf;
				remetenteGet.cpffake.value = remetentes[index].cpf;
				remetenteGet.email.value = remetentes[index].email;
				remetenteGet.whatsApp.value = remetentes[index].whatsapp;
				remetenteGet.rua.value = remetentes[index].rua;
				remetenteGet.number.value = remetentes[index].number;
				remetenteGet.bairro.value = remetentes[index].bairro;
				remetenteGet.city.value = remetentes[index].city;
				remetenteGet.state.value = remetentes[index].state;
				remetenteGet.cep.value = remetentes[index].cep;
			} else{
				remetenteGet.name.value = "";
				remetenteGet.cpf.value = "";
				remetenteGet.email.value = "";
				remetenteGet.whatsApp.value = "";
				remetenteGet.rua.value = "";
				remetenteGet.number.value = "";
				remetenteGet.bairro.value = "";
				remetenteGet.city.value = "";
				remetenteGet.state.value = "";
				remetenteGet.cep.value = "";
			}

		}
		
		function sugestionDestinatario(){
			
			var destinatarios = [];
			var index = document.getElementById("select-sugestion-dest").value;
			var destinatarioGet = {
				name 	 : document.getElementById("name-dest"),
				cpf 	 : document.getElementById("cpf-dest"),
				cpffake  : document.getElementById("cpf-dest-fake"),
				email	 : document.getElementById("email-dest"),
				whatsApp : document.getElementById("whatsapp-dest"),
				rua		 : document.getElementById("rua-dest"),
				number 	 : document.getElementById("number-dest"),
				bairro 	 : document.getElementById("bairro-dest"),
				city	 : document.getElementById("city-dest"),
				state 	 : document.getElementById("state-dest"),
				cep 	 : document.getElementById("cep-dest")
			}
			
			if(index){
				destinatarioGet.cpf.disabled = true;
			} else{
				destinatarioGet.cpf.disabled = false;
			} <%
			
			for(int i = 0; i < destinatarios.size(); i++){ %>
				var destinatario = {};
				destinatario.nome = "<%= destinatarios.get(i).getNomeCompleto() %>";
				destinatario.cpf = "<%= destinatarios.get(i).getCpf() %>";
				destinatario.cpffake = "<%= destinatarios.get(i).getCpf() %>";
				destinatario.email = "<%= destinatarios.get(i).getEmail() %>";
				destinatario.whatsapp = "<%= destinatarios.get(i).getTelefone() %>";
				destinatario.rua = "<%= destinatarios.get(i).getEndereco().getRua() %>";
				destinatario.number = "<%= destinatarios.get(i).getEndereco().getNumero() %>";
				destinatario.bairro = "<%= destinatarios.get(i).getEndereco().getBairro() %>";
				destinatario.city = "<%= destinatarios.get(i).getEndereco().getCidade() %>";
				destinatario.state = "<%= destinatarios.get(i).getEndereco().getEstado() %>";
				destinatario.cep = "<%= destinatarios.get(i).getEndereco().getCep() %>";
				destinatarios.push(destinatario); <%
			} %>

			if(destinatarios[index]){
				destinatarioGet.name.value = destinatarios[index].nome;
				destinatarioGet.cpf.value = destinatarios[index].cpf;
				destinatarioGet.cpffake.value = destinatarios[index].cpf;
				destinatarioGet.email.value = destinatarios[index].email;
				destinatarioGet.whatsApp.value = destinatarios[index].whatsapp;
				destinatarioGet.rua.value = destinatarios[index].rua;
				destinatarioGet.number.value = destinatarios[index].number;
				destinatarioGet.bairro.value = destinatarios[index].bairro;
				destinatarioGet.city.value = destinatarios[index].city;
				destinatarioGet.state.value = destinatarios[index].state;
				destinatarioGet.cep.value = destinatarios[index].cep;
			} else{
				destinatarioGet.name.value = "";
				destinatarioGet.cpf.value = "";
				destinatarioGet.email.value = "";
				destinatarioGet.whatsApp.value = "";
				destinatarioGet.rua.value = "";
				destinatarioGet.number.value = "";
				destinatarioGet.bairro.value = "";
				destinatarioGet.city.value = "";
				destinatarioGet.state.value = "";
				destinatarioGet.cep.value = "";
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
		
		<div class="register-orders-title">
			<p>Seja bem-vindo(a) <% out.print(userLogin); %>!</p>
			<h2>Cadastrar encomenda</h2>
		</div>

		<main>

			<form class="form" id="register-order" method="POST">

				<fieldset>

					<div class="title">
						<legend>Dados do remetente</legend> <%
							if(remetentes.size() > 0){ %>
								<div class="sugestion" id="sugestion">
									<input type="button" onclick="showSugestions('rem');" class="input-trans" id="btn-sugestion-rem" name="sugestion" value="Remetente já cadastrado?">
									<select onchange="hideSugestions();sugestionRemetente();" style="display: none;" id="select-sugestion-rem" name="sugestion">
										<option value="" selected>Selecione um remetente</option> <%
										    for (int i = 0; i < remetentes.size(); i++) { %> 
										    	<option value="<%= i %>"><%= remetentes.get(i).getNomeCompleto() %></option> <%
										    } %>
									</select>
								</div> <%	
							} %>
					</div>

					<div class="input-block">
						<label for="name-rem">Nome completo *</label>
						<input name="name-rem" oninput="validaInput(this)" id="name-rem" maxlength="100" placeholder="Ex.: Ana Maria Silva" required>
					</div>

					<div class="input-block cpf">
						<label for="cpf-rem">CPF<small> (somente números)</small> *</label>
						<input type="text" oninput="mascara(this, 'cpf')" name="cpf-rem" id="cpf-rem" placeholder="Ex.: 123.456.789-10" required>
						<input type="hidden" name="cpf-rem-fake" id="cpf-rem-fake">
					</div>

					<div class="contact">
						<div class="input-block email">
							<label for="email-rem">E-mail</label>
							<input name="email-rem" oninput="validaInput(this)" id="email-rem" type="text" maxlength="50" placeholder="Ex.: seuemail@email.com">
						</div>
	
						<div class="input-block wpp">
							<label for="whatsapp-rem">Contato
								<i class="fab fa-whatsapp"></i>
								<small> (somente números)</small> *
							</label>
							<input name="whatsapp-rem" type="text" oninput="mascara(this, 'tel')" id="whatsapp-rem" placeholder="Ex.: 38 912345678" required>
						</div>
					</div>

					<div class="input-block">
						<label for="rua-rem">Endereço *</label>
						<input name="rua-rem" oninput="validaInput(this)" id="rua-rem" type="text" maxlength="100" placeholder="Ex.: Rua dos Cocais" required>
					</div>

					<div class="bairro-num">
						<div class="input-block number">
							<label for="number-rem">Número *</label>
							<input name="number-rem" oninput="validaInput(this)" id="number-rem" type="number" placeholder="Ex.: 1000" required>
						</div>
	
						<div class="input-block bairro">
							<label for="bairro-rem">Bairro *</label>
							<input name="bairro-rem" oninput="validaInput(this)" id="bairro-rem" type="text" maxlength="50" placeholder="Ex.: Santa Marta" required>
						</div>
					</div>

					<div class="city-state-cep">
						<div class="input-block cep">
							<label for="cep-rem">CEP *</label>
							<input name="cep-rem" oninput="mascara(this, 'cep')"  id="cep-rem" type="text" placeholder="Ex.: 00000-00" required>
						</div>
						<div class="input-block city">
							<label for="city-rem">Cidade *</label>
							<input name="city-rem" oninput="validaInput(this)" id="city-rem" type="text" maxlength="50" placeholder="Ex.: Itapetinga" required>
						</div>
	
						<div class="input-block state">
							<label for="state-rem">Estado *</label>
							<select name="state-rem" id="state-rem" required>
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
					
				</fieldset>

				<fieldset>

					<div class="title">
						<legend>Dados do destinatario</legend> <%
							if(destinatarios.size() > 0){ %>
								<div class="sugestion" id="sugestion">
									<input type="button" onclick="showSugestions('dest');" class="input-trans" id="btn-sugestion-dest" name="sugestion" value="Destinatário já cadastrado?">
									<select onchange="hideSugestions();sugestionDestinatario();" style="display: none;" id="select-sugestion-dest" name="sugestion">
										<option value="" selected>Selecione um destinatário</option> <%
											for (int i = 0; i < destinatarios.size(); i++) { %>
										    	<option value="<%= i %>"><%= destinatarios.get(i).getNomeCompleto() %></option> <%
										    } %>
									</select>
								</div> <% 
							} %>
					</div>

					<div class="input-block">
						<label for="name-dest">Nome completo *</label>
						<input name="name-dest" oninput="validaInput(this)" id="name-dest" placeholder="Ex.: José da Silva" required>
					</div>

					<div class="input-block cpf">
						<label for="cpf-dest">CPF<small> (somente números)</small> *</label>
						<input type="text" oninput="mascara(this, 'cpf')" name="cpf-dest" id="cpf-dest" placeholder="Ex.: 123.456.789-10" required>
						<input type="hidden" name="cpf-dest-fake" id="cpf-dest-fake">
					</div>

					<div class="contact">
						<div class="input-block email">
							<label for="email-dest">E-mail</label>
							<input name="email-dest" oninput="validaInput(this)" id="email-dest" type="text" placeholder="Ex.: seuemail@email.com">
						</div>
	
						<div class="input-block wpp">
							<label for="whatsapp-dest">Contato
								<i class="fab fa-whatsapp"></i>
								<small> (somente números)</small> *
							</label>
							<input type="text" oninput="mascara(this, 'tel')" name="whatsapp-dest" id="whatsapp-dest" placeholder="Ex.: 11 987654321" required>
						</div>
					</div>

					<div class="input-block">
						<label for="rua-dest">Endereço *</label>
						<input name="rua-dest" oninput="validaInput(this)" id="rua-dest" type="text" placeholder="Ex.: Rua Tom Jobin" required>
					</div>

					<div class="bairro-num">
						<div class="input-block number">
							<label for="number-dest">Número *</label>
							<input name="number-dest" oninput="validaInput(this)" id="number-dest" type="number" placeholder="Ex.: 1234" required>
						</div>
	
						<div class="input-block bairro">
							<label for="bairro-dest">Bairro *</label>
							<input name="bairro-dest" oninput="validaInput(this)" id="bairro-dest" type="text" placeholder="Ex.: Americano" required>
						</div>
					</div>

					<div class="city-state-cep">
						<div class="input-block cep">
							<label for="cep-dest">CEP *</label>
							<input name="cep-dest" oninput="mascara(this, 'cep')" id="cep-dest" type="text" placeholder="Ex.: 99999-999" required>
						</div>
						<div class="input-block city">
							<label for="city-dest">Cidade *</label>
							<input name="city-dest" oninput="validaInput(this)" id="city-dest" type="text" placeholder="Ex.: Belo Horizonte" required>
						</div>
	
						<div class="input-block state">
							<label for="state-dest">Estado *</label>
							<select name="state-dest" id="state-dest" required>
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
					
				</fieldset>

				<fieldset>
					<legend>Dados da encomenda</legend>

					<div class="line1">
						<div class="select-block type">
							<label for="type">Tipo de encomenda *</label>
							<select name="type" required>
								<option value="" selected disabled>Selecione</option>
								<option value="Comum">Comum</option>
								<option value="Perecível">Perecível</option>
								<option value="Frágil">Frágil</option>
								<option value="Outro">Outro</option>
							</select>
						</div>
	
						<div class="input-block post">
							<label for="day-post">Postado dia *</label>
							<input type="date" name="day-post" id="day-post" required>
						</div>
	
						<div class="input-block time">
							<label for="time-at">Às *</label>
							<input type="time" name="time-at" id="time-at" required>
						</div>

						<div class="input-block value">
							<label for="value">Valor Cobrado<small>(R$)</small> *</label>
							<input type="number" min="0.01" max="9999.99" step="0.01" name="value" id="value" placeholder="R$ 00.00" required>
						</div>
					</div>

					<div class="line2">
						<div class="input-block comprimento">
							<label for="comprimento">Comprimento <small>(cm)</small> *</label>
							<input type="number" min="0.01" max="9999.99" step="0.01" name="comprimento" id="comprimento" placeholder="00.00 cm" required>
						</div>

						<div class="input-block altura">
							<label for="altura">Altura <small>(cm)</small> *</label>
							<input type="number" min="0.01" max="9999.99" step="0.01" name="altura" id="altura" placeholder="00.00 cm" required>
						</div>

						<div class="input-block largura">
							<label for="largura">Largura <small>(cm)</small> *</label>
							<input type="number" min="0.01" max="9999.99" step="0.01" name="largura" id="largura" placeholder="00.00 cm" required>
						</div>

						<div class="input-block peso">
							<label for="peso">Peso <small>(kg)</small> *</label>
							<input type="number" min="0.01" max="9999.99" step="0.01" name="peso" id="peso" placeholder="00.00 kg" required>
						</div>
					</div>
					
					<div class="line3">
						<div class="select-block vehicle">
							<label for="vehicle">Veículo para trasporte *</label>
							<select name="vehicle" required>
								<option value="" selected disabled>Selecione</option><%
									for (int i = 0; i < veiculos.size(); i++) { %>
								    	<option value="<%= veiculos.get(i).getIdVeiculo() %>"><%= veiculos.get(i).getModelo() %></option> <%
								    } %>
							</select>
						</div>

						<div class="input-block responsable">
							<label for="responsable">Responsável *</label>
								<select name="responsable" required>
									<option value="" selected disabled>Selecione</option><%
									for(int i = 0; i < funcionarios.size(); i++){ %>
										<option value="<%= funcionarios.get(i).getIdFuncionario() %>"><%= funcionarios.get(i).getNomeCompleto() %></option><%
									} %>
								</select>
						</div>
					</div>

					<div class="textarea-block">
						<label for="obs">Observações</label>
						<textarea name="obs" oninput="validaInput(this)" id="obs" placeholder="Observações ou anotações sobre a encomenda..."></textarea>
					</div>
					
				</fieldset>

				<div class="btn-submit">
					<button type="submit" form="register-order">
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