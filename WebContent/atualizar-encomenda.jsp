<%@page import="controller.servlet.FuncionarioController"%>
<%@page import="controller.servlet.VeiculoController"%>
<%@page import="controller.servlet.RemetenteController"%>
<%@page import="controller.servlet.EncomendaController"%>
<%@page import="controller.servlet.DestinatarioController"%>
<%@page import="controller.servlet.UsuarioController"%>
<%@page import="model.Funcionario"%>
<%@page import="model.Encomenda"%>
<%@page import="model.Destinatario"%>
<%@page import="model.Remetente"%>
<%@page import="model.Usuario"%>
<%@page import="model.Veiculo"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="pt_br">
	<head>
		<meta charset="utf-8">
		<title>SIGE	- Atualizar encomenda</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/png" href="img/favicon.png">
		<link rel="stylesheet" href="styles/home.css">
		<link rel="stylesheet" href="styles/register-orders.css">
		<link rel="stylesheet" href="styles/forms.css">
	</head>
	
	<%
		String userLogin = (String) session.getAttribute("user");
				String pwLogin = (String) session.getAttribute("password");
				String idencomenda = request.getParameter("idenco");
				String validaAttCadastro = (String) request.getAttribute("statusAttCadastro");
				
				UsuarioController user = new UsuarioController();
				EncomendaController enc = new EncomendaController();
				DestinatarioController dest = new DestinatarioController();
				RemetenteController rem = new RemetenteController();
				VeiculoController veiculo = new VeiculoController();
				FuncionarioController func = new FuncionarioController();

				ArrayList<Veiculo> veiculos = veiculo.selectVeiculo();
				ArrayList<Remetente> remetentes = rem.selectRemetente();
				ArrayList<Destinatario> destinatarios = dest.selectDestinatario();
				ArrayList<Funcionario> funcionarios = func.selectFuncionario();
				
				if(validaAttCadastro != null){
		%>
			<script type="text/javascript">
				alert("<%= validaAttCadastro %>");
				window.location.href = "encomendas";
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
		
		var getAllvalues = {};
	
		function loadValues(){
			// remetente
			getAllvalues.nomeRem	  = document.getElementById("name-rem");
			getAllvalues.cpfRem 	  = document.getElementById("cpf-rem");
			getAllvalues.cpfRemFake   = document.getElementById("cpf-rem-fake");
			getAllvalues.emailRem	  = document.getElementById("email-rem");
			getAllvalues.whatsAppRem  = document.getElementById("whatsapp-rem");
			getAllvalues.ruaRem	 	  = document.getElementById("rua-rem");
			getAllvalues.numberRem 	  = document.getElementById("number-rem");
			getAllvalues.bairroRem 	  = document.getElementById("bairro-rem");
			getAllvalues.cepRem 	  = document.getElementById("cep-rem");
			getAllvalues.cityRem	  = document.getElementById("city-rem");
			getAllvalues.stateRem 	  = document.getElementById("state-rem");
			getAllvalues.cepRem 	  = document.getElementById("cep-rem");

    		// destinatario
    		getAllvalues.nomeDest	  = document.getElementById("name-dest");
    		getAllvalues.cpfDest 	  = document.getElementById("cpf-dest");
    		getAllvalues.cpfDestFake  = document.getElementById("cpf-dest-fake");
    		getAllvalues.emailDest	  = document.getElementById("email-dest");
    		getAllvalues.whatsAppDest = document.getElementById("whatsapp-dest");
    		getAllvalues.ruaDest	  = document.getElementById("rua-dest");
    		getAllvalues.numberDest   = document.getElementById("number-dest");
    		getAllvalues.bairroDest   = document.getElementById("bairro-dest");
    		getAllvalues.cepDest 	  = document.getElementById("cep-dest");
    		getAllvalues.cityDest	  = document.getElementById("city-dest");
    		getAllvalues.stateDest	  = document.getElementById("state-dest");
    		getAllvalues.cepDest 	  = document.getElementById("cep-dest");
    		
    		// encomenda
    		getAllvalues.type 	  	  = document.getElementById("type");
			getAllvalues.dataPost 	  = document.getElementById("day-post");
			getAllvalues.timePost 	  = document.getElementById("time-at");
			getAllvalues.value 		  = document.getElementById("value");
			getAllvalues.comprimento  = document.getElementById("comprimento");
			getAllvalues.altura 	  = document.getElementById("altura");
			getAllvalues.largura	  = document.getElementById("largura");
			getAllvalues.peso 		  = document.getElementById("peso");
			getAllvalues.vehicle 	  = document.getElementById("vehicle");
			getAllvalues.responsable  = document.getElementById("responsable");
			getAllvalues.observacoes  = document.getElementById("obs");

			<% if(idencomenda != null){

				ArrayList<Encomenda> encomendas = enc.selectAll(Integer.parseInt(idencomenda));
			
				for(int i = 0; i < encomendas.size(); i++){ %>
					// value inputs para remetente
					getAllvalues.nomeRem.value 		= "<%= encomendas.get(i).getRemetente().getNomeCompleto() %>";
					getAllvalues.cpfRem.value 		= "<%= encomendas.get(i).getRemetente().getCpf() %>";
					getAllvalues.cpfRemFake.value 	= "<%= encomendas.get(i).getRemetente().getCpf() %>";
					getAllvalues.emailRem.value 	= "<%= encomendas.get(i).getRemetente().getEmail() %>";
					getAllvalues.whatsAppRem.value 	= "<%= encomendas.get(i).getRemetente().getTelefone() %>";
					getAllvalues.ruaRem.value 		= "<%= encomendas.get(i).getRemetente().getEndereco().getRua() %>";
					getAllvalues.numberRem.value 	= "<%= encomendas.get(i).getRemetente().getEndereco().getNumero() %>";
					getAllvalues.bairroRem.value 	= "<%= encomendas.get(i).getRemetente().getEndereco().getBairro() %>";
					getAllvalues.cepDest.value   	= "<%= encomendas.get(i).getRemetente().getEndereco().getCep() %>";
					getAllvalues.cityRem.value 		= "<%= encomendas.get(i).getRemetente().getEndereco().getCidade() %>";
					getAllvalues.stateRem.value 	= "<%= encomendas.get(i).getRemetente().getEndereco().getEstado() %>";
					getAllvalues.cepRem.value 		= "<%= encomendas.get(i).getRemetente().getEndereco().getCep() %>";
					// value inputs para destinatario
					getAllvalues.nomeDest.value 	= "<%= encomendas.get(i).getDestinatario().getNomeCompleto() %>";
					getAllvalues.cpfDest.value 		= "<%= encomendas.get(i).getDestinatario().getCpf() %>";
					getAllvalues.cpfDestFake.value 	= "<%= encomendas.get(i).getDestinatario().getCpf() %>";
					getAllvalues.emailDest.value 	= "<%= encomendas.get(i).getDestinatario().getEmail() %>";
					getAllvalues.whatsAppDest.value = "<%= encomendas.get(i).getDestinatario().getTelefone() %>";
					getAllvalues.ruaDest.value 		= "<%= encomendas.get(i).getDestinatario().getEndereco().getRua() %>";
					getAllvalues.numberDest.value   = "<%= encomendas.get(i).getDestinatario().getEndereco().getNumero() %>";
					getAllvalues.bairroDest.value   = "<%= encomendas.get(i).getDestinatario().getEndereco().getBairro() %>";
					getAllvalues.cepDest.value      = "<%= encomendas.get(i).getDestinatario().getEndereco().getCep() %>";
					getAllvalues.cityDest.value     = "<%= encomendas.get(i).getDestinatario().getEndereco().getCidade() %>";
					getAllvalues.stateDest.value    = "<%= encomendas.get(i).getDestinatario().getEndereco().getEstado() %>";
					getAllvalues.cepDest.value      = "<%= encomendas.get(i).getDestinatario().getEndereco().getCep() %>";
					// value para encomenda
					getAllvalues.type.value 	  	= "<%= encomendas.get(i).getTipo() %>";
					getAllvalues.dataPost.value  	= "<%= encomendas.get(i).getDataPostagem() %>";
					getAllvalues.timePost.value  	= "<%= encomendas.get(i).getHoras() %>";
					getAllvalues.value.value  		= "<%= encomendas.get(i).getValor() %>";
					getAllvalues.comprimento.value  = "<%= encomendas.get(i).getComprimento() %>";
					getAllvalues.altura.value  	    = "<%= encomendas.get(i).getAltura() %>";
					getAllvalues.largura.value 	    = "<%= encomendas.get(i).getLargura() %>";
					getAllvalues.peso.value  		= "<%= encomendas.get(i).getPeso() %>";
					getAllvalues.vehicle.value  	= "<%= encomendas.get(i).getVeiculo().getIdVeiculo() %>";
					getAllvalues.responsable.value  = "<%= encomendas.get(i).getFuncionario().getIdFuncionario() %>"; <%
			
				}
				
			} %>
			
		}
		
	</script>

	<body onload="loadValues();">
	
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
			<p>Seja bem-vindo(a) <%= userLogin %>!</p>
			<h2>Atualizar encomenda</h2>
		</div>

		<main>

			<form class="form" id="register-order" method="POST">

				<fieldset>

					<div class="title">
						<legend>Dados do remetente</legend>
					</div>

					<div class="input-block">
						<label for="name-rem">Nome completo *</label>
						<input name="name-rem" oninput="validaInput(this)" id="name-rem" maxlength="100" placeholder="Ex.: Ana Maria Silva" required>
					</div>

					<div class="input-block cpf">
						<label for="cpf-rem">CPF<small> (somente números)</small> *</label>
						<input type="hidden" oninput="mascara(this, 'cpf')" name="cpf-rem" id="cpf-rem" placeholder="Ex.: 123.456.789-10" required>
						<input type="text" id="cpf-rem-fake" disabled>
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
							<input name="cep-rem" oninput="mascara(this, 'cep')"  id="cep-rem" type="text" placeholder="Ex.: 00000-00"required>
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
						<legend>Dados do destinatario</legend>
					</div>

					<div class="input-block">
						<label for="name-dest">Nome completo *</label>
						<input name="name-dest" oninput="validaInput(this)" id="name-dest" placeholder="Ex.: José da Silva" required>
					</div>

					<div class="input-block cpf">
						<label for="cpf-dest">CPF<small> (somente números)</small> *</label>
						<input type="hidden" oninput="mascara(this, 'cpf')" name="cpf-dest" id="cpf-dest" placeholder="Ex.: 123.456.789-10">
						<input type="text" id="cpf-dest-fake" disabled>
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
							<input name="cep-dest" oninput="mascara(this, 'cep')"  id="cep-dest" type="text" placeholder="Ex.: 99999-999" required>
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
							<select name="type" id="type" required>
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
							<select name="vehicle" id="vehicle" required>
								<option value="" selected disabled>Selecione</option><%
									for (int i = 0; i < veiculos.size(); i++) { %>
								    	<option value="<%= veiculos.get(i).getIdVeiculo() %>"><%= veiculos.get(i).getModelo() %></option> <%
								    } %>
							</select>
						</div>

						<div class="input-block responsable">
							<label for="responsable">Entregador *</label>
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
						<i class="fas fa-save"></i> Atualizar cadastro
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