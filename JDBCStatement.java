import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 * class Scrip 2 
 * @author Administrator
 *
 */
public class JDBCStatement {
	
	/**
	 * the method is get paths at column "paths" from table file_log in in MySQL, when Scrip1 run succesfully will generate path  at local 

	 * @return
	 */
	
	
	
	
	public static List<String> loadPaths() {
//		private static String load = mp;

		Connection con = ConnectionToFileLogDatabase.getCon();
//		String sql = "select id_config,source_http_url,author,mail,file_name from config where file_name=?;";
		try {
//			PreparedStatement ps = con.prepareStatement(sql);
			
			
			
	/**
	 * call procedure today() in MySQL to find  paths created today at columns "dateCreate " and status "ER" at columns "log_status",
	 *  then get it  to the Arraylist 
	 * 
	 *  return : list paths
	*/
			
			
			
			CallableStatement callableStatement = con.prepareCall("{call today ()}");// return paths
//			String sql = "insert into file_log(id_config,log_status,author,paths) values(?,?,?,?);";

//			callableStatement.setString(1, load);
//			Map<String, String> mp = new HashMap<String, String>();
			ResultSet rs = callableStatement.executeQuery();

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

	//step1 :load file to staging 
	/**
	 * the method is load file from local to the table staging in MySQL .Consists of 8 filed : khuvuc_hethong(String),khuvuc(String),gia mua(double) ,gia ban(double) ,chenhLech(double),ngaycapnhat(String)
	use  store procedure  load_file_to_staging (paths) at MySQL
	 */
	/**
	 * 1. get list paths of ArrayList from method loadPath() , 
	 *  2.iterate over the paths in the array
	 * 3. call procedure load_file_to_staging (paths)
	 * 4. call method updateStatus(String status,String paths) to update status at column log_status from  file_log table in MySQL 
	 */
	//step2: clean staging 
	/**
	 * the method to convert values at table staging in MySQL to numbers , before when transform to data warehouse 
	 */ 
	
	 /**
	 *  call method  cleanArea() to convert values at column "khuvuc" from table staging in MySQL to numbers,  the numbers is id of column id of table  dim_area using procedure cleanArea()
	 *  call method cleanSystem() to convert values at column "hethong" from table staging in MySQL to numbers,  the numbers is id of column id_hethong of table dim_system using procedure cleanSystem()
	 *  call method cleanDateCreate() to convert values at column "ngaycapnhat" from table staging in MySQL to numbers , the numbers is values of column date_sk of table date_dim  using procedure cleanDateCreate()
	 * call method cleanArea_System() to convert values at column "khuvuc_hethong" from table staging in MySQL to numbers , the numbers is values id of column id_khuvuc_hethong of table dim_khuvuc_hethong


	 */
	
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
				
//				cleanUpdateTime();

				ResultSet rs = callableStatement.executeQuery();
				updateStatus("TR", p1);
				/**
				 * convert values at staging to numbers  
				 * 
				 */
				cleanArea_System();
				cleanSystem();
				cleanDateCreate();
				cleanArea();
				
			}
		


		} catch (Exception e) {
			// TODO: handle exception
			
	
		}

	}
	/**
	 * the method is call procedure cleanDateCreate() at mySql 
	 *  call method to convert values at column "khuvuc" from table staging in MySQL to numbers,  the numbers is id of column id of table  dim_area using procedure cleanArea()

	 */
private static void cleanDateCreate() {
	Connection con = ConnectionToFileLogDatabase.getCon();

	try {
		CallableStatement callableStatement = con.prepareCall("{call cleanDateCreate()}");
		ResultSet rs = callableStatement.executeQuery();


	} catch (Exception e) {
		// TODO: handle exception

	}	
		
	}

/**
 * the method to call procedure cleanKhuVucHeThong() at mySql
 *  call method  to convert values at column "khuvuc_hethong" from table staging in MySQL to numbers , the numbers is values id of column id_khuvuc_hethong of table dim_khuvuc_hethong

 */
private static void cleanArea_System() {
	Connection con = ConnectionToFileLogDatabase.getCon();

	try {
		CallableStatement callableStatement = con.prepareCall("{call cleanKhuVucHeThong()}");
		ResultSet rs = callableStatement.executeQuery();


	} catch (Exception e) {
		// TODO: handle exception

	}	
		
	}

	
	
	
/**
 * the method is  convert values at column "khuvuc" from table staging in MySQL to number base on store procedure and cursor 
 */
	/**
	 *  call method cleanSystem() to convert values at column "hethong" from table staging in MySQL to numbers,  the numbers is id of column id_hethong of table dim_system using procedure cleanSystem()

	 * 
	 */
	
	
	
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
/**
 * call procedure  cleanKhuVuc() in MySQL
 * 	 *  to convert values at column "khuvuc" from table staging in MySQL to numbers,  the numbers is id of column id of table  dim_area using procedure cleanArea()

 * 
 */



	public static void cleanArea() {
		Connection con = ConnectionToFileLogDatabase.getCon();

		try {
			CallableStatement callableStatement = con.prepareCall("{call cleanArea()}");
			ResultSet rs = callableStatement.executeQuery();


		} catch (Exception e) {
			// TODO: handle exception

		}

	}
	
	
	
/**
 * the method is update status at column "log_status" in table file_log after load file from local to table staging successful
 * @param status
 * @param paths
 */
/**
 * the method  is query find the paths of the file successfully loaded into staging ,then update log_status from "ER" to "TR" 
 */
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


		/**
		 * test method 
		 */
		JDBCStatement jdbcStatement = new JDBCStatement();
		System.out.println(jdbcStatement.loadPaths());
		jdbcStatement.getPaths();
		jdbcStatement.cleanArea();

	}

}
