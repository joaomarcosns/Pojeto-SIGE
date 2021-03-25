package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import connection.ConnectionDatabase;
import model.Destinatario;
import model.Endereco;

public class DestinatarioDAO {
	
	ConnectionDatabase dao = new ConnectionDatabase();

	public void insert(Destinatario destinatario) {
		String insert = "INSERT INTO Destinatario (nomecompleto, cpf, rua, numero, bairro, cidade, estado, cep, email, telefone)\r\n"
					  + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(insert);
			pst.setString(1, destinatario.getNomeCompleto());
			pst.setString(2, destinatario.getCpf());
			pst.setString(3, destinatario.getEndereco().getRua());
			pst.setInt(4, destinatario.getEndereco().getNumero());
			pst.setString(5, destinatario.getEndereco().getBairro());
			pst.setString(6, destinatario.getEndereco().getCidade());
			pst.setString(7, destinatario.getEndereco().getEstado());
			pst.setString(8, destinatario.getEndereco().getCep());
			pst.setString(9, destinatario.getEmail());
			pst.setString(10, destinatario.getTelefone());
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public ArrayList<Destinatario> select() {
		
		ArrayList<Destinatario> destinatario = new ArrayList<>();
		String select = "SELECT * FROM destinatario";
		
		try {
		
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(select);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				int idDestinatario = rs.getInt(1);
				String nomeCompleto = rs.getString(2);
				String cpf = rs.getString(3);
				String rua = rs.getString(4);
				int numero = rs.getInt(5);
				String bairro = rs.getString(6);
				String cidade = rs.getString(7);
				String estado = rs.getString(8);
				String cep = rs.getString(9);
				String email = rs.getString(10);
				String telefone = rs.getString(11);
				destinatario.add(new Destinatario(idDestinatario, nomeCompleto, cpf, email, telefone,
						new Endereco(rua, numero, bairro, cidade, estado, cep)));
				
			}
			con.close();
			return destinatario;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public boolean existeDestinatario(String cpf) {
		
		boolean existe = false;
		ArrayList<Destinatario> destinatario = new ArrayList<>();
		String select = "SELECT iddestinatario FROM destinatario WHERE cpf = ?";
		
		try {
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(select);
			pst.setString(1, cpf);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				int idRemetente = rs.getInt(1);
				destinatario.add(new Destinatario(idRemetente));
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		
		if (destinatario.size() > 0) {
			existe = true;
		} else {
			existe = false;
		}

		return existe;
	}

	public void update(Destinatario destinatario) {

		String update = "UPDATE destinatario SET nomecompleto = ?, rua = ?, numero = ?, bairro = ?,"
				  	  + "cidade = ?, estado = ?, cep= ?, email= ?, telefone= ? WHERE cpf = ?";
		
		try {
			
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(update);
			pst.setString(1, destinatario.getNomeCompleto());
			pst.setString(2, destinatario.getEndereco().getRua());
			pst.setInt(3, destinatario.getEndereco().getNumero());
			pst.setString(4, destinatario.getEndereco().getBairro());
			pst.setString(5, destinatario.getEndereco().getCidade());
			pst.setString(6, destinatario.getEndereco().getEstado());
			pst.setString(7, destinatario.getEndereco().getCep());
			pst.setString(8, destinatario.getEmail());
			pst.setString(9, destinatario.getTelefone());
			pst.setString(10, destinatario.getCpf());
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void delete(int idDestinatario) {
		
		String delete = "DELETE FROM destinatario WHERE idDestinatario = ?";
		
		try {
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(delete);
			pst.setInt(1, idDestinatario);
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
}


