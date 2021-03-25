package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;

import connection.ConnectionDatabase;
import model.Destinatario;
import model.Encomenda;
import model.Endereco;
import model.Funcionario;
import model.Remetente;
import model.Veiculo;


public class EncomendaDAO {

	ConnectionDatabase dao = new ConnectionDatabase();
	
	public void insert(Encomenda encomenda) {
		
		String insert = "INSERT INTO Encomenda(idRemetente, idDestinatario, idFuncionario, idVeiculo, tipo, valor, peso, altura,"
					  + "largura, comprimento, observacoes, datapostagem, horas, status, dataprevisao)"
					  + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(insert);
			pst.setInt(1, encomenda.getRemetente().getIdRemetente());
			pst.setInt(2, encomenda.getDestinatario().getIdDestinatario());
			pst.setInt(3, encomenda.getFuncionario().getIdFuncionario());
			pst.setInt(4, encomenda.getVeiculo().getIdVeiculo());
			pst.setString(5, encomenda.getTipo());
			pst.setDouble(6, encomenda.getValor());
			pst.setDouble(7, encomenda.getPeso());
			pst.setDouble(8, encomenda.getAltura());
			pst.setDouble(9, encomenda.getLargura());
			pst.setDouble(10, encomenda.getComprimento());
			pst.setString(11, encomenda.getObservacoes());
			pst.setDate(12, encomenda.getDataPostagem());
			pst.setTime(13, encomenda.getHoras());
			pst.setString(14, encomenda.getStatus());
			pst.setDate(15, encomenda.getDataPrevisao());
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public void insertEncoFunc(int idEncomenda, int idFuncionario) {
		
		String insert = "INSERT INTO encomendafuncionario (idencomenda, idfuncionario) VALUES (?, ?)";
	
		try {
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(insert);
			pst.setInt(1, idEncomenda);
			pst.setInt(2, idFuncionario);
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public ArrayList<Encomenda> select(){

		ArrayList<Encomenda> encomendas = new ArrayList<>();
		
		String selectString = "SELECT r.nomecompleto, r.cpf, r.rua, r.numero, r.bairro, r.cidade, r.estado, r.cep, r.telefone, r.email,\r\n"
							+ "d.nomecompleto, d.cpf, d.rua, d.numero, d.bairro, d.cidade, d.estado, d.cep, d.telefone, d.email,\r\n"
							+ "e.idencomenda, e.tipo, e.valor, e.peso, e.altura, e.largura, e.comprimento, e.observacoes, e.datapostagem,\r\n"
							+ "e.dataprevisao, e.status, e.horas, v.idveiculo, v.modelo, f.idfuncionario, f.nomecompleto\r\n"
							+ "FROM encomenda e, destinatario d, remetente r, veiculo v, funcionario f\r\n"
							+ "WHERE e.iddestinatario = d.iddestinatario\r\n"
							+ "AND e.idremetente = r.idremetente\r\n"
							+ "AND e.idfuncionario = f.idfuncionario\r\n"
							+ "AND e.idveiculo = v.idveiculo\r\n"
							+ "ORDER BY idencomenda DESC";
		
		try {
			
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(selectString);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {

				String nomeRem = rs.getString(1);
				String cpfRem  = rs.getString(2);
				String ruaRem = rs.getString(3);
				int numeroRem = rs.getInt(4);
				String bairroRem = rs.getString(5);
				String cidadeRem = rs.getString(6);
				String estadoRem = rs.getString(7);
				String cepRem = rs.getString(8);
				String telefoneRem = rs.getString(9);
				String emailRem = rs.getString(10);
				
				String nomeDest = rs.getString(11);
				String cpfDest = rs.getString(12);
				String ruaDest = rs.getString(13);
				int numeroDest = rs.getInt(14);
				String bairroDest = rs.getString(15);
				String cidadeDest = rs.getString(16);
				String estadoDest = rs.getString(17);
				String cepDest = rs.getString(18);
				String telefoneDest = rs.getString(19);
				String emailDest = rs.getString(20);
				
				int idEncomenda = rs.getInt(21);
				String tipo = rs.getString(22);
				double valor = rs.getDouble(23);
				double peso = rs.getDouble(24);
				double altura = rs.getDouble(25);
				double largura = rs.getDouble(26);
				double comprimento = rs.getDouble(27);
				String observacoes = rs.getString(28);
				Date dataPostagem = rs.getDate(29);
				Date dataPrevisao = rs.getDate(30);
				String status = rs.getString(31);
				Time postadoAs = rs.getTime(32);
				int idVeiculo = rs.getInt(33);
				String modVeiculo = rs.getString(34);
				int idFuncionario = rs.getInt(35);
				String nomeFuncionario = rs.getString(36);

				encomendas.add(new Encomenda(idEncomenda,
					   	new Remetente(nomeRem, cpfRem, emailRem, telefoneRem,
					   	  new Endereco(ruaRem, numeroRem, bairroRem, cidadeRem, estadoRem, cepRem)),
					   	new Destinatario(nomeDest, cpfDest, emailDest, telefoneDest,
					   	  new Endereco(ruaDest, numeroDest, bairroDest, cidadeDest, estadoDest, cepDest)),
					    tipo, dataPostagem, dataPrevisao, postadoAs, valor, comprimento, altura, largura,
					    peso, status, observacoes,
					    new Veiculo(idVeiculo, modVeiculo),
					    new Funcionario(idFuncionario, nomeFuncionario)
					   ));
			}
			
			con.close();
			return encomendas;
			
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	
	public ArrayList<Encomenda> selectTop15(){
		
		ArrayList<Encomenda> encomendas = new ArrayList<>();
		
		String selectString = "SELECT e.idencomenda, r.cidade, r.estado, d.cidade, d.estado, e.datapostagem, e.dataprevisao, e.status\r\n"
				+ "FROM encomenda e, remetente r, destinatario d\r\n"
				+ "WHERE e.idremetente = r.idremetente\r\n"
				+ "AND e.iddestinatario = d.iddestinatario\r\n"
				+ "ORDER BY e.idencomenda DESC\r\n"
				+ "LIMIT 15;";
		try {
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(selectString);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				int idEncomenda = rs.getInt(1);
				String cidadeRem = rs.getString(2);        
				String estadoRem = rs.getString(3);
				String cidadeDes = rs.getString(4);
				String estadoDes = rs.getString(5);
				Date dataPostagem = rs.getDate(6);
				Date dataPrevisao = rs.getDate(7);
				String status = rs.getString(8);
        
				encomendas.add(new Encomenda(idEncomenda, new Remetente(new Endereco(cidadeRem, estadoRem)), 
						new Destinatario(new Endereco(cidadeDes, estadoDes)), dataPostagem, dataPrevisao, status));
			}
			con.close();
			return encomendas;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public ArrayList<Encomenda> selectAll(int idEncomenda){
		
		ArrayList<Encomenda> encomendas = new ArrayList<>();
		
		String selectString = "SELECT r.nomecompleto, r.cpf, r.email, r.telefone, r.rua, r.numero, r.bairro, r.cep, r.cidade, r.estado,\r\n"
							+ "d.nomecompleto, d.cpf, d.email, d.telefone, d.rua, d.numero, d.bairro, d.cep, d.cidade, d.estado,\r\n"
							+ "e.tipo, e.datapostagem, e.horas, e.valor, e.comprimento, e.altura, e.largura, e.peso, v.idveiculo, f.idfuncionario\r\n"
							+ "FROM encomenda e, destinatario d, remetente r, veiculo v, funcionario f\r\n"
							+ "WHERE e.iddestinatario = d.iddestinatario\r\n"
							+ "AND e.idremetente = r.idremetente\r\n"
							+ "AND e.idfuncionario = f.idfuncionario\r\n"
							+ "AND e.idveiculo = v.idveiculo\r\n"
							+ "AND e.idencomenda = ?";
		try {
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(selectString);
			pst.setInt(1, idEncomenda);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				
				String nomeRem = rs.getString(1);
		        String cpfRem = rs.getString(2);
		        String emailRem = rs.getString(3);
		        String telefoneRem = rs.getString(4);
		        String ruaRem = rs.getString(5);
		        int numRem = rs.getInt(6);
		        String bairroRem = rs.getString(7);
		        String cepRem = rs.getString(8);
		        String cidadeRem = rs.getString(9);
		        String estadoRem = rs.getString(10); 

		        String nomeDest = rs.getString(11);
		        String cpfDest = rs.getString(12);
		        String emailDest = rs.getString(13);
		        String telefoneDest = rs.getString(14);
		        String ruaDest = rs.getString(15);
		        int numeroDest = rs.getInt(16);
		        String bairroDest = rs.getString(17);
		        String cepDest = rs.getString(18);
		        String cidadeDest = rs.getString(19);
		        String estadoDest = rs.getString(20);

		        String tipo = rs.getString(21);
		        Date dataPost = rs.getDate(22);
		        Time horaPost = rs.getTime(23);
		        double valor = rs.getDouble(24);
		        double comprimento = rs.getDouble(25);
		        double altura = rs.getDouble(26);
		        double largura = rs.getDouble(27);
		        double peso = rs.getDouble(28);
		        int idVeiculo = rs.getInt(29);
		        int idFuncionario = rs.getInt(30);
		        
				encomendas.add(new Encomenda(
							   	new Remetente(nomeRem, cpfRem, emailRem, telefoneRem,
							   	  new Endereco(ruaRem, numRem, bairroRem, cidadeRem, estadoRem, cepRem)),
							   	new Destinatario(nomeDest, cpfDest, emailDest, telefoneDest,
							   	  new Endereco(ruaDest, numeroDest, bairroDest, cidadeDest, estadoDest, cepDest)),
							    tipo, dataPost, horaPost, valor, comprimento, altura, largura, peso,
							    new Veiculo(idVeiculo),
							    new Funcionario(idFuncionario)
							   ));
			}
			con.close();
			return encomendas;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public void update(Encomenda encomenda) {
		
		String update = "UPDATE encomenda SET tipo = ?, valor = ?, peso = ?, altura = ?, largura = ?, comprimento = ?,\r\n"
					  + "observacoes = ?, dataPostagem = ?, dataprevisao = ?, horas = ? WHERE idEncomenda = ?;";
		
		try {
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(update);
			pst.setString(1, encomenda.getTipo());
			pst.setDouble(2, encomenda.getValor());
			pst.setDouble(3, encomenda.getPeso());
			pst.setDouble(4, encomenda.getAltura());
			pst.setDouble(5, encomenda.getLargura());
			pst.setDouble(6, encomenda.getComprimento());
			pst.setString(7, encomenda.getObservacoes());
			pst.setDate(8, encomenda.getDataPostagem());
			pst.setDate(9, encomenda.getDataPrevisao());
			pst.setTime(10, encomenda.getHoras());
			pst.setInt(11, encomenda.getIdEncomenda());
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	public void updateStatus(int idEncomenda) {
		
		String update = "UPDATE encomenda SET status = 'Entregue' WHERE idEncomenda = ?";
		
		try {
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(update);
			pst.setInt(1, idEncomenda);
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	public void delete(int idEncomenda) {
		
        String delete = "DELETE FROM encomenda WHERE idEncomenda = ?"; 
        
        try {
            Connection con = dao.conectar();
            PreparedStatement pst = con.prepareStatement(delete);
            pst.setInt(1, idEncomenda);
            pst.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
	
}

