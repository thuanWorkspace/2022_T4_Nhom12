import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JDBCStatement {

	public static List<String> loadPaths() {
//		private static String load = mp;

		Connection con = ConnectionToFileLogDatabase.getCon();
//		String sql = "select id_config,source_http_url,author,mail,file_name from config where file_name=?;";
		try {
//			PreparedStatement ps = con.prepareStatement(sql);
			CallableStatement callableStatement = con.prepareCall("{call today ()}");
//			String sql = "insert into file_log(id_config,log_status,author,paths) values(?,?,?,?);";

//			callableStatement.setString(1, load);
			ResultSet rs = callableStatement.executeQuery();
//			Map<String, String> mp = new HashMap<String, String>();
			List<String> mp = new ArrayList<String>();
			while (rs.next()) {

//				mp.put("paths", rs.getString("paths"));
				mp.add(rs.getString("paths"));
//				mp.add(rs.getString("log_status"));
			}
			return mp;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	// method get path at column "paths" from file_log in in MySQL, load file to
	// staging
	public static void getPaths() {
		Connection con = ConnectionToFileLogDatabase.getCon();

		List<String> p = loadPaths();

		try {
			CallableStatement callableStatement = con.prepareCall("{call load_file_to_staging (?)}");
			for (String p1 : p) {
				callableStatement.setString(1, p1);
//				loadPaths(p1, "TR");
//				getPaths(p1, "TR");
				// QUERY clean staging
				updateStatus("TR", p1);
				cleanArea();
				cleanSystem();
//				cleanUpdateTime();

				ResultSet rs = callableStatement.executeQuery();
			}

		} catch (Exception e) {
			// TODO: handle exception
			// 1. write err status
//			insertFileLog(id_config, "ERR", author, "null");
			// 2. write ERROR infor down error.txt
//			PrintWriter pw = printErr();
//			e.printStackTrace(pw);
//			pw.close();
			// send mail to author
//			String mail = config.get("mail");
//			String file_name = config.get("file_name");
//			String timenow = timenow();
//			String subject = "err date: " + timenow;
//			String message = "error in file_name: " + file_name + ", time: " + timenow;
//			MailService.sendMail(mail, subject, message);
		}

	}

private static void cleanUpdateTime() {
	Connection con = ConnectionToFileLogDatabase.getCon();

	try {
		CallableStatement callableStatement = con.prepareCall("{call cleanNgayCapNhat()}");
		ResultSet rs = callableStatement.executeQuery();


	} catch (Exception e) {
		// TODO: handle exception

	}		
		
	}

private static void cleanSystem() {
	Connection con = ConnectionToFileLogDatabase.getCon();

	try {
		CallableStatement callableStatement = con.prepareCall("{call cleanHeThong()}");
		ResultSet rs = callableStatement.executeQuery();


	} catch (Exception e) {
		// TODO: handle exception

	}		
	}

// clean area  
	public static void cleanArea() {
		Connection con = ConnectionToFileLogDatabase.getCon();

		try {
			CallableStatement callableStatement = con.prepareCall("{call cleanKhuVuc()}");
			ResultSet rs = callableStatement.executeQuery();


		} catch (Exception e) {
			// TODO: handle exception

		}

	}

//update status at column "status" in table file_log after load file from local to table staging successful
//úp date trạng thái er thành tr sau khi load file vào staging thành công 
	private static void updateStatus(String status, String paths) {
		Connection con = ConnectionToFileLogDatabase.getCon();
		String sql = "update file_log set log_status =? where paths =?;";

//				+ "WHERE date_create >= CURDATE() and log_status=" +"ER"+";";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, status);
			ps.setString(2, paths);

			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {

//		try {
//			Connection con = ConnectionToFileLogDatabase.getCon();
////			callableStatement = con.prepareCall(sql);
////			callableStatement.setString(1, status);
////			ResultSet rs = callableStatement.executeQuery();
////			rs = callableStatement.executeQuery();
////			Map<String, String> mp = new HashMap<String, String>();
////			Set<String> path = mp.keySet();
//			List<String> mp = new ArrayList<String>();
//
////			String[] mp;
//			CallableStatement  callableStatement1 = con.prepareCall("{call today (?)}");
//			ResultSet rs1 = callableStatement1.executeQuery();
//
//			while (rs1.next()) {
//				String paths = rs1.getString(1);
////				mp.put("paths", rs1.getString("paths"));
//			System.out.println("path");
//
//			}
//
////			callableStatement2 = con.prepareCall("{call load_file_to_staging (?)}");
////
////			for (String m : mp) {
////				callableStatement2.setString(1, m);
////				rs2 = callableStatement2.executeQuery();
////				//
////
////			}
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//
//		}
//		______________________________________________
		JDBCStatement jdbcStatement = new JDBCStatement();
		System.out.println(jdbcStatement.loadPaths());
		jdbcStatement.getPaths();
		jdbcStatement.cleanArea();
		// // create a file object for directory
//		File directoryPath = new File("D:\\DataWareHouse\\datawarehouse\\");
//	
//		String contents[] = directoryPath.list();
//		for (int i = 0; i < contents.length; i++) {
//
//		}
		//
		// create a file object for directory
		// list off all file
//		System.out.println("List of files and directories in the specified directory:");
//		for (int i = 0; i < contents.length; i++) {
//
//			System.out.println(contents[i]);
		//

//		}
//		 đóng _____________________________________
//		try {
//			Connection con = ConnectionToFileLogDatabase.getCon();
////			String sql = "select into file_log(id_config,log_status,author,paths) values(?,?,?,?);";
//			// String sql = "call load_file_to_staging () ";
//			CallableStatement callableStatement = con.prepareCall("{call load_file_to_staging (?)}");
////			File directoryPath = new File("C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads");
////			File hardcode = new File("C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\04-10-22_16-22-06.csv");
//			//___________________________________

//			String contents[] = directoryPath.list();
//			File[] cFiles = directoryPath.listFiles();
//			for (File file : cFiles) {
//				callableStatement.setString(1, file.getAbsolutePath());
//				// QUERY clean staging
//				ResultSet rs = callableStatement.executeQuery();
//
//			}

//			while (rs.next()) {
//
//			for (int i = 0; i < cFiles.length; i++) {
//
//				callableStatement.setString(1, cFiles[i].getAbsolutePath());
//				ResultSet rs = callableStatement.executeQuery();
//
//			}
//		}
//			callableStatement.setString(1, directoryPath.getAbsolutePath());
//			for (int i = 0; i < contents.length; i++) {
////				System.out.println("List of files and directories in the specified directory:");
////				callableStatement.setString( contents[i],"paths");
//				callableStatement.setString(1,contents[i]);
////				 String sql = "call load_file_to_staging () ";
//
////				System.out.println(contents[i]);
//
//			}
//			callableStatement.setString(1, "A");
//			while (rs.next()) {

		// System.out.println(rs.getInt("id") + rs.getString("user_name"));

//				String id = rs.getString(" 	");
//				String khuvuc = rs.getString("khuvuc");
//				String hethong = rs.getString("hethong");
//				double giamua = rs.getDouble("giamua");
//				double giaban = rs.getDouble("giaban");
//				double chenhLech = rs.getDouble("chenhLech");
//				String ngaycapnhat = rs.getString("ngaycapnhat");
//				System.out.println(id + "/" + khuvuc + "/" + hethong + "/" + giamua + "/" + giaban + "/" + chenhLech
//						+ "/" + ngaycapnhat);
//			}
//		______________________
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//_____________________
	}

}
