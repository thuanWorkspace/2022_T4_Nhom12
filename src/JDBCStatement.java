import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * class Scrip 2
 * 
 * @author Administrator
 *
 */
public class JDBCStatement {
	/**
	 * the method is load file from staging to data warehouse??? consists of 2
	 * procedure
	 * load_Staging_to_Datawarehouse_initialization(),load_Staging_to_Datawarehouse()
	 */
	// procedure 1
	private static void load_Staging_to_Datawarehouse() {
		Connection con = ConnectionToFileLogDatabase.getCon();
		try {
			PreparedStatement ps1 = con.prepareStatement("select log_status from file_log where log_status ='TR' order by log_status limit 1;");
			ResultSet rs = ps1.executeQuery();
			rs.next();
			String s = rs.getString(1);
			while (s.equalsIgnoreCase("TR")) {
				PreparedStatement ps2 = con.prepareStatement("select id from data_warehouse where id=1 order by id limit 1");
				Boolean flags = ps2.executeQuery().next();
				if (flags == false) {
					CallableStatement callableStatement1 = con.prepareCall("{call load_Staging_to_Datawarehouse_initialization()}");
					ResultSet rs1 = callableStatement1.executeQuery();
				} else {
					CallableStatement callableStatement2 = con.prepareCall("{call load_Staging_to_Datawarehouse()}");
					ResultSet rs2 = callableStatement2.executeQuery();
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
//procedure 2

//	private static void  load_Staging_to_Datawarehouse() {
//		Connection con = ConnectionToFileLogDatabase.getCon();
//		try {
//			CallableStatement callableStatement = con.prepareCall("{call load_Staging_to_Datawarehouse_initialization()}");
//			ResultSet rs = callableStatement.executeQuery();
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//	}

	/**
	 * the method is get paths at column "paths" from table file_log in in MySQL,
	 * when Scrip1 run succesfully will generate path at local
	 * 
	 * @return
	 */

	public static List<String> loadPaths() {

		Connection con = ConnectionToFileLogDatabase.getCon();
		try {

			/**
			 * call procedure today() in MySQL to find paths created today at columns
			 * "dateCreate " and status "ER" at columns "log_status", then get it to the
			 * Arraylist
			 * 
			 * return : list paths
			 */

			CallableStatement callableStatement = con.prepareCall("{call today ()}");// return paths

			ResultSet rs = callableStatement.executeQuery();

			List<String> mp = new ArrayList<String>();

			while (rs.next()) {

				mp.add(rs.getString("paths"));
			}
			return mp;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	/**
	 * the method is load file from local to the table staging in MySQL .Consists of
	 * 8 filed : khuvuc_hethong(String),khuvuc(String),gia mua(double) ,gia
	 * ban(double) ,chenhLech(double),ngaycapnhat(String), Use store procedure
	 * load_file_to_staging (paths) at MySQL
	 */
	// step1 :load file to staging

	/**
	 * 1. get list paths of ArrayList from method loadPath() , 2.iterate over the
	 * paths in the array 3. call procedure load_file_to_staging (paths) 4. call
	 * method updateStatus(String status,String paths) to update status at column
	 * log_status from file_log table in MySQL
	 */
	// step2: clean staging
	/**
	 * the method to convert values at table staging in MySQL to numbers , before
	 * when transform to data warehouse
	 */

	/**
	 * call method cleanArea() to convert values at column "khuvuc" from table
	 * staging in MySQL to numbers, the numbers is id of column id of table dim_area
	 * using procedure cleanArea()
	 */
	/**
	 * call method cleanSystem() to convert values at column "hethong" from table
	 * staging in MySQL to numbers, the numbers is id of column id_hethong of table
	 * dim_system using procedure cleanSystem()
	 */
	/**
	 * call method cleanDateCreate() to convert values at column "ngaycapnhat" from
	 * table staging in MySQL to numbers , the numbers is values of column date_sk
	 * of table date_dim using procedure cleanDateCreate()
	 */
	/**
	 * call method cleanArea_System() to convert values at column "khuvuc_hethong"
	 * from table staging in MySQL to numbers , the numbers is values id of column
	 * id_khuvuc_hethong of table dim_khuvuc_hethong
	 */

	public static void getPaths() {
		// step1 :load file to staging
		Connection con = ConnectionToFileLogDatabase.getCon();

		List<String> p = loadPaths();

		try {
			CallableStatement callableStatement = con.prepareCall("{call load_file_to_staging (?)}");
			for (String p1 : p) {
				callableStatement.setString(1, p1);

				ResultSet rs = callableStatement.executeQuery();
				updateStatus("TR", p1);
				// step2: clean staging

				/**
				 * convert values at staging to numbers
				 * 
				 */
				cleanArea_System();
				cleanArea();
				cleanSystem();
				cleanDateCreate();
				load_Staging_to_Datawarehouse();
			}
		} catch (Exception e) {
			// TODO: handle exception

		}

	}

	/**
	 * the method is call procedure cleanDateCreate() at mySql call method to
	 * convert values at column "khuvuc" from table staging in MySQL to numbers, the
	 * numbers is id of column id of table dim_area using procedure cleanArea()
	 * 
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

	// cleanArea_System
	/**
	 * the method to call procedure cleanKhuVucHeThong() at mySql call method to
	 * convert values at column "khuvuc_hethong" from table staging in MySQL to
	 * numbers , the numbers is values id of column id_khuvuc_hethong of table
	 * dim_khuvuc_hethong
	 * 
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

	// clean system
	/**
	 * the method is convert values at column "khuvuc" from table staging in MySQL
	 * to number base on store procedure and cursor
	 */
	/**
	 * call method cleanSystem() to convert values at column "hethong" from table
	 * staging in MySQL to numbers, the numbers is id of column id_hethong of table
	 * dim_system using procedure cleanSystem()
	 * 
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
	 * call procedure cleanKhuVuc() in MySQL * to convert values at column "khuvuc"
	 * from table staging in MySQL to numbers, the numbers is id of column id of
	 * table dim_area using procedure cleanArea()
	 * 
	 * 
	 */

	public static void cleanArea() {
		Connection con = ConnectionToFileLogDatabase.getCon();

		try {
			CallableStatement callableStatement = con.prepareCall("{call cleanKhuVuc()}");
			ResultSet rs = callableStatement.executeQuery();

		} catch (Exception e) {
			// TODO: handle exception

		}

	}

	/**
	 * the method is update status at column "log_status" in table file_log after
	 * load file from local to table staging successful
	 * 
	 * @param status
	 * @param paths
	 */
	/**
	 * the method is query find the paths of the file successfully loaded into
	 * staging ,then update log_status from "ER" to "TR"
	 */

	private static void updateStatus(String status, String paths) {
		Connection con = ConnectionToFileLogDatabase.getCon();
		String sql = "update file_log set log_status =? where paths =?;";

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
