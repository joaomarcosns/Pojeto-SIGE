package controller.servlet;

import DAO.DestinatarioDAO;


public class Teste {

	public static void main(String[] args) {
		
		DestinatarioDAO rem = new DestinatarioDAO();
		
		System.out.println(rem.existeDestinatario("555g555"));
		
	
	}

}
