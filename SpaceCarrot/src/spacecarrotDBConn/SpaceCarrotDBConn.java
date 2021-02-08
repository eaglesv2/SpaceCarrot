package spacecarrotDBConn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SpaceCarrotDBConn {
	private Connection con;
	
		public Connection getConnection() {
			return con;
		}
	
		public SpaceCarrotDBConn() {
			try {
				Class.forName("org.mariadb.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mariadb://spacecarrot.csxnhhpcigbn.ap-northeast-2.rds.amazonaws.com:3306", 
												  "spacecarrot", "spacecarrot");
				
				if(con != null) {
					System.out.println("DB 접속 성공!");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("DB 접속 실패");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				System.out.println("드라이버 로드 실패");
			}
		}
}
