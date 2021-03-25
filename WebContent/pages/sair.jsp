<%@page import="controller.servlet.UsuarioController"%>
<%@page import="java.util.ArrayList"%>


<%
	String userLogin = (String) session.getAttribute("user");
	String pwLogin = (String) session.getAttribute("password");
	
	if(userLogin == null && pwLogin == null){
		response.sendRedirect("../login");
	} else{
		UsuarioController user = new UsuarioController();
		boolean validaLogin = user.validaLogin(userLogin, pwLogin, false);
		session.invalidate();
		response.sendRedirect("../login");
	}
%>