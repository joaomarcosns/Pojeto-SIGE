package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import connection.ConnectionDatabase;
import model.Veiculo;

public class VeiculoDAO {
	
	ConnectionDatabase dao = new ConnectionDatabase();
	
	public void insert(Veiculo veiculo) {
		String insert = "INSERT INTO veiculo (fabricante, modelo, tipo, placa, cor, ano, numeroChassi, ativo)"
					  + "VALUES (?, ?, ?, ?, ?, ?, ?, ?);"; 
		try {
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(insert);
			pst.setString(1, veiculo.getFabricante());
			pst.setString(2, veiculo.getModelo());
			pst.setString(3, veiculo.getTipo());
			pst.setString(4, veiculo.getPlaca());
			pst.setString(5, veiculo.getCor());
			pst.setString(6, veiculo.getAno());
			pst.setString(7, veiculo.getNumeroChassi());
			pst.setBoolean(8, true);
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public ArrayList<Veiculo> selectVeiculo() {
		ArrayList<Veiculo> veiculo = new ArrayList<>();
		String select = "SELECT * FROM veiculo WHERE ativo = true";
		try {
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(select);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				int idVeiculo = rs.getInt(1);
				String fabricante = rs.getString(2);
				String modelo = rs.getString(3);
				String tipo = rs.getString(4);
				String placa =rs.getString(6);
				String cor = rs.getString(6);
				String ano = rs.getString(7);
				String numeroChassi = rs.getString(8);
				veiculo.add(new Veiculo(idVeiculo, fabricante, modelo, tipo, placa, cor, ano, numeroChassi));
			}
			con.close();
			return veiculo;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	public void updateVeiculo(Veiculo veiculo) {
		String update = "UPDATE veiculo SET fabricante = ?, modelo = ?, tipo = ?, placa = ?, cor = ?, ano = ?, numeroChassi = ?"
					  + "WHERE idVeiculo = ?";
		try {
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(update);
			pst.setString(1, veiculo.getFabricante());
			pst.setString(2, veiculo.getModelo());
			pst.setString(3, veiculo.getTipo());
			pst.setString(4, veiculo.getPlaca());
			pst.setString(5, veiculo.getCor());
			pst.setString(6, veiculo.getAno());
			pst.setString(7, veiculo.getNumeroChassi());
			pst.setInt(8, veiculo.getIdVeiculo());
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	public void deleteVeiculo(int idVeiculo) {
		String delete = "UPDATE veiculo SET ativo = false WHERE idVeiculo = ?";
					  //"DELETE FROM veiculo WHERE idVeiculo = ?";
		
		try {
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(delete);
			pst.setInt(1, idVeiculo);
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
}


