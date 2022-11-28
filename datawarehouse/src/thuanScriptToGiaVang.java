import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * this is ???
 * 
 * @author Administrator
 *
 */
public class thuanScriptToGiaVang {
	/**
	 * ý tưởng nếu có nhiều dòng trong config
	 */
	/**
	 * the method is query gets columns in table config , after gets us into
	 * hashMap<String ,String>
	 * 
	 * @return map exxamp : the columns name at config is "id_config ", get it
	 */
	public static Map<String, String> loadDefaultConfig() {
		Connection con = ConnectionToFileLogDatabase.getCon();
		String sql = "select id_config,source_http_url,author,mail,file_name,dateTimeNow,PathFileError,PathFileExcel,pathFileCsv,status1,status2,status3,status4,status5 from controller.config where id_config=1 ;";
		//
		try {
			PreparedStatement ps = con.prepareStatement(sql);
//			ps.setString(1, load);//cmt

			ResultSet rs = ps.executeQuery();
			Map<String, String> mp = new HashMap<String, String>();

			while (rs.next()) {
				mp.put("id_config", Integer.toString(rs.getInt("id_config")));
				mp.put("source_http_url", rs.getString("source_http_url"));
				mp.put("author", rs.getString("author"));
				mp.put("mail", rs.getString("mail"));
				mp.put("file_name", rs.getString("file_name"));

				mp.put("dateTimeNow", rs.getString("dateTimeNow"));
				mp.put("PathFileError", rs.getString("PathFileError"));
				mp.put("PathFileExcel", rs.getString("PathFileExcel"));
				mp.put("pathFileCsv", rs.getString("pathFileCsv"));
				mp.put("status1", rs.getString("status1"));
				mp.put("status2", rs.getString("status2"));
				mp.put("status3", rs.getString("status3"));
				mp.put("status4", rs.getString("status4"));
				mp.put("status5", rs.getString("status5"));

			}
			return mp;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	/**
	 * the method is get Map<String, String> at loadDefaultConfig() add into List
	 * 
	 * @return list
	 */
	// lấy config từng dòng bỏ vào list
	public static List<Map<String, String>> getConfigs() {
//		List configs = new ArrayList<>();
		List<Map<String, String>> configs = new ArrayList<Map<String, String>>();
//		configs.add(loadDefaultConfig());
		Connection con = ConnectionToFileLogDatabase.getCon();
		/**
		 * ý tưởng nếu có nhiều dòng trong config
		 */
		/**
		 * the method is query find columns in table config where id =1 , after get it
		 * into hashMap<String ,String>
		 * 
		 * @return map
		 */
		String sql = "select id_config,source_http_url,author,mail,file_name,dateTimeNow,PathFileError,PathFileExcel,pathFileCsv,status1,status2,status3,status4,status5 from controller.config;";

		try {
			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Map<String, String> mp = new HashMap<String, String>();

				mp.put("id_config", Integer.toString(rs.getInt("id_config")));
				mp.put("source_http_url", rs.getString("source_http_url"));
				mp.put("author", rs.getString("author"));
				mp.put("mail", rs.getString("mail"));
				mp.put("file_name", rs.getString("file_name"));

				mp.put("dateTimeNow", rs.getString("dateTimeNow"));
				mp.put("PathFileError", rs.getString("PathFileError"));

				mp.put("PathFileExcel", rs.getString("PathFileExcel"));
				mp.put("pathFileCsv", rs.getString("pathFileCsv"));

				mp.put("status1", rs.getString("status1"));
				mp.put("status2", rs.getString("status2"));
				mp.put("status3", rs.getString("status3"));
				mp.put("status4", rs.getString("status4"));
				mp.put("status5", rs.getString("status5"));

				configs.add(mp);
			}
			return configs;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	public static void runConfig() {
		List<Map<String, String>> config = getConfigs();
		for (Map<String, String> map : config) {

			algo(map);

		}
	}

	public static void algo(Map<String, String> config) {
		// get data from config.
		int id_config = Integer.parseInt(config.get("id_config"));
		String author = config.get("author");
		String source = config.get("source_http_url");
		String dateTimeNow = config.get("dateTimeNow");
		String PathFileError = config.get("PathFileError");
		String PathFileExcel = config.get("PathFileExcel");
		String pathFileCsv = config.get("pathFileCsv");
		String status1 = config.get("status1");
		String status2 = config.get("status2");
		String status3 = config.get("status3");
		String status4 = config.get("status4");
		String status5 = config.get("status5");
		// edit
//		String paths = config.get("paths");
		try {
			// 2.crawl step
			JsoupRun3 js3 = new JsoupRun3();
//			js3.crawlData(source);
			ArrayList<Gold> data = js3.crawlData(source);
//			String path = "path"; 
//			 js3.Write(data);
			String path = js3.Write(data);

			// 3. insert file
			/**
			 * convert hard code to dynamic code ,status 2 when load run script not
			 * successfully , ERR
			 * 
			 */

//			String status2 = config.get("status2");// run Script 1 success, denote get data from website to local
													// successfully

//			String status1="ER";
			insertFileLog(id_config, status2, author, path);

		} catch (Exception e) {
			// TODO: handle exception
			// 1. write err status
			/**
			 * convert hardcode to dynamic code
			 * 
			 */
//			String status1 = config.get("status1");// status 1 err ,denote Script1 ERR
//			String status5 = config.get("status5");// status5 is paths at column file_log is null

			insertFileLog(id_config, status1, author, status5);
			// 2. write ERROR infor down error.txt
			PrintWriter pw = printErr();
			e.printStackTrace(pw);
			pw.close();
			// send mail to author
			String mail = config.get("mail");
			String file_name = config.get("file_name");
			String timenow = timenow();
			String subject = "err date: " + timenow;
			String message = "error in file_name: " + file_name + ", time: " + timenow;
			MailService.sendMail(mail, subject, message);
		}

	}

	public static void algoDefault() {
		// 1. load config
		Map<String, String> config = loadDefaultConfig();
		// get data from config.
		int id_config = Integer.parseInt(config.get("id_config"));
		String author = config.get("author");
		String source = config.get("source_http_url");
		// edit
//		String paths = config.get("paths");
		try {
			// 2.crawl step
			JsoupRun3 js3 = new JsoupRun3();
//			js3.crawlData(source);
			ArrayList<Gold> data = js3.crawlData(source);
//			String path = "path"; 
//			 js3.Write(data);
			String path = js3.Write(data);

			// 3. insert file
			/**
			 * convert hard code to dynamic code ,status 2 when load run script not
			 * successfully , ERR
			 * 
			 */

			String status2 = config.get("status2");// run Script 1 success, denote get data from website to local
													// successfully

//			String status1="ER";
			insertFileLog(id_config, status2, author, path);

		} catch (Exception e) {
			// TODO: handle exception
			// 1. write err status
			/**
			 * convert hardcode to dynamic code
			 * 
			 */
			String status1 = config.get("status1");// status 1 err ,denote Script1 ERR
			String status5 = config.get("status5");// status5 is paths at column file_log is null

			insertFileLog(id_config, status1, author, status5);
			// 2. write ERROR infor down error.txt
			PrintWriter pw = printErr();
			e.printStackTrace(pw);
			pw.close();
			// send mail to author
			String mail = config.get("mail");
			String file_name = config.get("file_name");
			String timenow = timenow();
			String subject = "err date: " + timenow;
			String message = "error in file_name: " + file_name + ", time: " + timenow;
			MailService.sendMail(mail, subject, message);
		}

	}

	public static void main(String[] args) {
//		algoDefault();
		runConfig();
	}

	public static void insertFileLog(int id_config, String status, String author, String path) {
		Connection con = ConnectionToFileLogDatabase.getCon();
		String sql = "insert into controller.file_log(id_config,log_status,author,paths) values(?,?,?,?);";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id_config);
			ps.setString(2, status);
			ps.setString(3, author);
			ps.setString(4, path);
			// edit
//			ps.setString(4, filePath);
//			int scalar = ps.executeUpdate();
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static String timenow() {

//		String dateTimeNow="yyyy-MM-dd_HH-mm-ss";
		Map<String, String> pathFile = loadDefaultConfig();
		String dateTimeNow = pathFile.get("dateTimeNow");
		//

		DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern(dateTimeNow);// yyyy/MM-dd.HH-mm-ss
		LocalDateTime now1 = LocalDateTime.now();
		return dtf1.format(now1);
	}

	public static PrintWriter printErr() {
		Map<String, String> pathFile = loadDefaultConfig();
		String pathFileError = pathFile.get("PathFileError");

//		String pathFileError="datawarehousess\\ERROR.txt";
//		String pathFileError="D:\\testError\\ERROR.txt";
		File f = new File(pathFileError);
		OutputStream os;
		try {
			os = new FileOutputStream(f, true);
			PrintWriter pw = new PrintWriter(os);
			pw.println(timenow());
			return pw;
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
