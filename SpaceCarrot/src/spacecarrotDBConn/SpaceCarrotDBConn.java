package spacecarrotDBConn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SpaceCarrotDBConn {
	private Connection con;
	
		public Connection getConnection() {
			return con;
		}
	
		public SpaceCarrotDBConn() throws ClassNotFoundException, SQLException {
		
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mariadb://spacecarrot.csxnhhpcigbn.ap-northeast-2.rds.amazonaws.com:3306", 
											  "spacecarrot", "spacecarrot");
		}
}
