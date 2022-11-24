import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionToFileLogDatabase {
	private static ConnectionToFileLogDatabase getConnection;
	private static Connection con;

	private ConnectionToFileLogDatabase() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/controller";
//	        String username = config.get("user_database");
//	        String password = config.get("password_database");
		String username = "root";
		String password = "1234";
		con = DriverManager.getConnection(url, username, password);
	}

	public static ConnectionToFileLogDatabase getInstance() throws SQLException, ClassNotFoundException {
		if (getConnection == null)
			getConnection = new ConnectionToFileLogDatabase();
		return getConnection;
	}

	public static Connection getCon() {
		try {
			getInstance();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

	public static void main(String[] args) {
		getCon();
	}

}
