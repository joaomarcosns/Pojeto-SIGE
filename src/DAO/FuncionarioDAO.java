package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import connection.ConnectionDatabase;
import model.Endereco;
import model.Funcionario;

public class FuncionarioDAO {

	ConnectionDatabase dao = new ConnectionDatabase();

	public void insertFuncionario(Funcionario funcionario) {
		String insert = "INSERT INTO funcionario (nomecompleto, cpf, rua, numero, bairro, cidade, estado, cep, email, telefone,"
					  + "salario, cargo, carteiratrabalho, datacadastro, ativo) "
					  + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {

			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(insert);
			pst.setString(1, funcionario.getNomeCompleto());
			pst.setString(2, funcionario.getCpf());
			pst.setString(3, funcionario.getEndereco().getRua());
			pst.setInt(4, funcionario.getEndereco().getNumero());
			pst.setString(5, funcionario.getEndereco().getBairro());
			pst.setString(6, funcionario.getEndereco().getCidade());
			pst.setString(7, funcionario.getEndereco().getEstado());
			pst.setString(8, funcionario.getEndereco().getCep());
			pst.setString(9, funcionario.getEmail());
			pst.setString(10, funcionario.getTelefone());
			pst.setDouble(11, funcionario.getSalario());
			pst.setString(12, funcionario.getCargo());
			pst.setString(13, funcionario.getCarteiraTrabalho());
			pst.setDate(14, funcionario.getDataCadastro());
			pst.setBoolean(15, true);
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public ArrayList<Funcionario> select() {
		
		ArrayList<Funcionario> funcionarios = new ArrayList<>();
		String select = "SELECT * FROM funcionario WHERE ativo = true";
		
		try {
			
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(select);
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				int idFuncionario = rs.getInt(1);
				String nomeCompleto = rs.getString(2);
				String cpf = rs.getString(3);
				String rua = rs.getString(4);
				int numero = rs.getInt(5);
				String bairro = rs.getString(6);
				String cidade = rs.getString(7);
				String estado = rs.getString(8);
				String cep = rs.getString(9);
				double salario = rs.getDouble(10);
				String cargo = rs.getString(11);
				String carteiraTrabalho = rs.getString(12);
				String email = rs.getString(13);
				String telefone = rs.getString(14);
				Date dataCadastro = rs.getDate(15);
				
				funcionarios.add(new Funcionario(idFuncionario, nomeCompleto, cpf, email, telefone, salario, cargo, carteiraTrabalho, dataCadastro,
						new Endereco(rua, numero, bairro, cidade, estado, cep)));
			}
			
			con.close();
			return funcionarios;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public ArrayList<Funcionario> selectID(int idFunc) {
		
		ArrayList<Funcionario> funcionarios = new ArrayList<>();
		String select = "SELECT * FROM funcionario WHERE idfuncionario = ?";
		
		try {
			
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(select);
			pst.setInt(1, idFunc);
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				int idFuncionario = rs.getInt(1);
				String nomeCompleto = rs.getString(2);
				String cpf = rs.getString(3);
				String rua = rs.getString(4);
				int numero = rs.getInt(5);
				String bairro = rs.getString(6);
				String cidade = rs.getString(7);
				String estado = rs.getString(8);
				String cep = rs.getString(9);
				double salario = rs.getDouble(10);
				String cargo = rs.getString(11);
				String carteiraTrabalho = rs.getString(12);
				String email = rs.getString(13);
				String telefone = rs.getString(14);
				Date dataCadastro = rs.getDate(15);
				
				funcionarios.add(new Funcionario(idFuncionario, nomeCompleto, cpf, email, telefone, salario, cargo, carteiraTrabalho, dataCadastro,
						new Endereco(rua, numero, bairro, cidade, estado, cep)));
			}
			
			con.close();
			return funcionarios;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public void updateFuncinario(Funcionario funcionario) {
		String updateFuncinario = "UPDATE funcionario SET nomecompleto = ?, cpf = ?,"
				+ "rua = ?, numero = ?, bairro = ?, cidade = ?, estado= ?, cep = ?,"
				+ "email = ?, telefone = ?, salario = ?, cargo = ?, carteiratrabalho = ? "
				+ "WHERE idfuncionario = ?";
		try {
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(updateFuncinario);
			pst.setString(1, funcionario.getNomeCompleto());
			pst.setString(2, funcionario.getCpf());
			pst.setString(3, funcionario.getEndereco().getRua());
			pst.setInt(4, funcionario.getEndereco().getNumero());
			pst.setString(5, funcionario.getEndereco().getBairro());
			pst.setString(6, funcionario.getEndereco().getCidade());
			pst.setString(7, funcionario.getEndereco().getEstado());
			pst.setString(8, funcionario.getEndereco().getCep());
			pst.setString(9, funcionario.getEmail());
			pst.setString(10, funcionario.getTelefone());
			pst.setDouble(11, funcionario.getSalario());
			pst.setString(12, funcionario.getCargo());
			pst.setString(13, funcionario.getCarteiraTrabalho());
			pst.setInt(14, funcionario.getIdFuncionario());
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void deletFuncionario(int idFuncionario) {
		String deleteFuncinario = "UPDATE funcionario SET ativo = false WHERE idfuncionario = ?";
							    //"DELETE FROM funcionario WHERE idfuncionario = ?";
		
		try {
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(deleteFuncinario);
			pst.setInt(1, idFuncionario);
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}

