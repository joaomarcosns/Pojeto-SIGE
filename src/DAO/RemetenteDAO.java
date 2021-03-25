package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import connection.ConnectionDatabase;
import model.Endereco;
import model.Remetente;

public class RemetenteDAO {

	ConnectionDatabase dao = new ConnectionDatabase();
	
	public void insert(Remetente remetente) {
		
		String insert = "INSERT INTO Remetente (nomecompleto, cpf, rua, numero, bairro, cidade, estado, cep, email, telefone)\r\n"
					  + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(insert);
			pst.setString(1, remetente.getNomeCompleto());
			pst.setString(2, remetente.getCpf());
			pst.setString(3, remetente.getEndereco().getRua());
			pst.setInt(4, remetente.getEndereco().getNumero());
			pst.setString(5, remetente.getEndereco().getBairro());
			pst.setString(6, remetente.getEndereco().getCidade());
			pst.setString(7, remetente.getEndereco().getEstado());
			pst.setString(8, remetente.getEndereco().getCep());
			pst.setString(9, remetente.getEmail());
			pst.setString(10, remetente.getTelefone());
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public ArrayList<Remetente> select() {
		
		ArrayList<Remetente> remetente = new ArrayList<>();
		String select = "SELECT * FROM remetente";
		
		try {
		
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(select);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				int idRemetente = rs.getInt(1);
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
				remetente.add(new Remetente(idRemetente, nomeCompleto, cpf, email, telefone, 
						new Endereco(rua, numero, bairro, cidade, estado, cep)));
			}
			con.close();
			return remetente;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public boolean existeRemetente(String cpf) {
		
		boolean existe = false;
		ArrayList<Remetente> remetente = new ArrayList<>();
		String select = "SELECT idremetente FROM remetente WHERE cpf = ?";
		
		try {
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(select);
			pst.setString(1, cpf);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				int idRemetente = rs.getInt(1);
				remetente.add(new Remetente(idRemetente));
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		
		if (remetente.size() > 0) {
			existe = true;
		} else {
			existe = false;
		}

		return existe;
	}

	public void update(Remetente remetente) {
		
		String update = "UPDATE remetente SET nomecompleto = ?, rua = ?, numero = ?, bairro = ?,"
					  + "cidade = ?, estado = ?, cep= ?, email= ?, telefone= ? WHERE cpf = ?";
		
		try {
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(update);
			pst.setString(1, remetente.getNomeCompleto());
			pst.setString(2, remetente.getEndereco().getRua());
			pst.setInt(3, remetente.getEndereco().getNumero());
			pst.setString(4, remetente.getEndereco().getBairro());
			pst.setString(5, remetente.getEndereco().getCidade());
			pst.setString(6, remetente.getEndereco().getEstado());
			pst.setString(7, remetente.getEndereco().getCep());
			pst.setString(8, remetente.getEmail());
			pst.setString(9, remetente.getTelefone());
			pst.setString(10, remetente.getCpf());
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void delete(int idRemetente) {
		
		String delete = "DELETE FROM remetente WHERE idRemetente = ?";
		
		try {
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(delete);
			pst.setInt(1, idRemetente);
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}

