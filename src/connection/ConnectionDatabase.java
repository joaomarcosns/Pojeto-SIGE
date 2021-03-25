package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionDatabase {
	
//	elephantsql db	
	private String url = "jdbc:postgresql://motty.db.elephantsql.com:5432/wvdipjdj?useTimezone=tue&serverTimezone=UTC";
	private String user = "wvdipjdj";
	private String password = "PvUMBCf7of2Mog4Cuujv6z9L2mDtwA5M";
	private String driver = "org.postgresql.Driver";
	
// 	amazon db
//	private String url = "jdbc:postgresql://sige-project.cwfsnt7uxngk.sa-east-1.rds.amazonaws.com:5432/sigedb?useTimezone=tue&serverTimezone=UTC";
//	private String user = "sigeproject";
//	private String password = "737858332";
//	private String driver = "org.postgresql.Driver";
	
	
	public ConnectionDatabase() {
		super();
	}

	public Connection conectar() {
	
		Connection con = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			return con;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	
	public void testeConexao() {
		try {
			Connection con = conectar();
			System.out.println(con);
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
}

