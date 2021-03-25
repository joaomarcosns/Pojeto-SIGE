package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import connection.ConnectionDatabase;
import model.Usuario;

public class UsuarioDAO {
	
	ConnectionDatabase dao = new ConnectionDatabase();
	
	public boolean validaLogin(String user, String password, boolean online) {
		
		String select = "SELECT * FROM usuarios WHERE usuario = ? AND senha = ?";
		String update = "UPDATE usuarios SET online = ? WHERE iduser = ?";
		boolean validaLogin = false;
		
		try {
	
			Connection con = dao.conectar();
			PreparedStatement pst1 = con.prepareStatement(select);
			PreparedStatement pst2 = con.prepareStatement(update);
			
			pst1.setString(1, user);
            pst1.setString(2, password);
            ResultSet rs = pst1.executeQuery();
           
            while (rs.next()) {
            	// rs 1 = id / rs 2 = nome / rs 3 = senha
            	if(rs.getString(2) != null && rs.getString(3) != null) {
            		 pst2.setBoolean(1, online);
                     pst2.setInt(2, rs.getInt(1));
                     pst2.executeUpdate();
                     validaLogin = true;
            	} else {
            		validaLogin = false;
            	}
            }
            
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return validaLogin;
	}
	
	public ArrayList<Usuario> selectUser(){
		
		ArrayList<Usuario> user = new ArrayList<>();
		
		String read = "SELECT * FROM usuarios";
		try {
			Connection con = dao.conectar();
			PreparedStatement pst = con.prepareStatement(read);
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				int id = rs.getInt(1);
				String nome = rs.getString(2);
				String senha = rs.getString(3);
				String email = rs.getString(4);
				int nc = rs.getInt(5);
				boolean online = rs.getBoolean(6);
				user.add(new Usuario(id, nome, senha, email, nc, online));
			}
			con.close();
			return user;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public void insertUser(Usuario user) {
        String create = "INSERT INTO usuarios (usuario, senha, email, online)"
        			  + "VALUES (?, ?, ?, ?)";
        try {
            Connection con = dao.conectar();
            PreparedStatement pst = con.prepareStatement(create);
            pst.setString(1, user.getNome());
            pst.setString(2, user.getSenha());
            pst.setString(3, user.getEmail());
            pst.setBoolean(4, user.isOnline());
            pst.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
	
	public void removerUser(int idUser) {
		
        String delete = "DELETE FROM usuarios WHERE iduser = ?";
        
        try {
            Connection con = dao.conectar();
            PreparedStatement pst = con.prepareStatement(delete);
            pst.setInt(1, idUser);
            pst.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
	
}
