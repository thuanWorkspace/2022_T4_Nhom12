import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionToFileLogDatabase {
	private static ConnectionToFileLogDatabase getConnection;
	private static Connection con;
/**
	 * this is the path of file.txt contain user name , pass of account mySQL workbench
	 */
	final static String filePath = "C:\\Users\\Administrator\\Desktop\\Data_Warehouse\\sql\\userName.txt";
	
	private ConnectionToFileLogDatabase() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/controller";
//	        String username = config.get("user_database");
//	        String password = config.get("password_database");
		String username = "root";
		String password = "123456";
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
			getUsernamePassword();
		/**
		 * test method getUsernamePassword();
		 */
//		getUsernamePassword();
		// read text file to HashMap
		Map<String, String> mapFromFile = getUsernamePassword();

		// iterate over HashMap entries
		for (Map.Entry<String, String> entry : mapFromFile.entrySet()) {
			System.out.println(entry.getKey() + " " + entry.getValue());
		}
	}
	/**
	 * the method to get file.txt load to HashMap<String, String> , using BufferedReader
	 * the txt.file is file contains user name and password of account MySQL Workbench
	 * input:(String key,String values)
	 * @return map
	 * Example:
	 * userName root 
	 * passWord 123456
	
	 */

	public static Map<String, String> getUsernamePassword() {

		Map<String, String> map = new HashMap<String, String>();
		BufferedReader br = null;

		try {

			// create file object
			File file = new File(filePath);

			// create BufferedReader object from the File
			br = new BufferedReader(new FileReader(file));

			String line = null;

			// read file line by line
			while ((line = br.readLine()) != null) {

				// split the line by :
//				String[] parts = line.split(":");
				String[] parts = line.split(" ");

				// first part is userName, second is pass
				String name = parts[0].trim();
				String number = parts[1].trim();

				// put userName, pass  in HashMap if they are
				// not empty
				if (!name.equals(" ") && !number.equals(" "))
					map.put(name, number);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			// Always close the BufferedReader
			if (br != null) {
				try {
					br.close();
				} catch (Exception e) {
				}

			}
		}

		return map;
	}

}
