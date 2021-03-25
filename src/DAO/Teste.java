package DAO;

import java.util.ArrayList;
import model.Encomenda;

public class Teste {

	public static void main(String[] args) {
		
		EncomendaDAO enco = new EncomendaDAO();
		
		ArrayList<Encomenda> e = enco.select();
		
		for (int i = 0; i < e.size(); i++) {
			System.out.println(e.get(i).getRemetente().getNomeCompleto());
			System.out.println(e.get(i).getRemetente().getCpf());
			System.out.println(e.get(i).getRemetente().getEndereco().getCidade());
			System.out.println(e.get(i).getStatus());
			System.out.println(e.get(i).getComprimento());
			System.out.println(e.get(i).getHoras());
			System.out.println(e.get(i).getDataPrevisao());
		}

	}

}
