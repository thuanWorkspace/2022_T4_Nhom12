import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DynamicCode {
	public static JDBCStatement scrip2;
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
	public static void getPaths() {
		// step1 :load file to staging
		Connection con = ConnectionToFileLogDatabase.getCon();

		List<String> p = loadPaths();

		try {
			CallableStatement callableStatement = con.prepareCall("{call load_file_to_staging (?)}");
			for (String p1 : p) {
				callableStatement.setString(1, p1);

				ResultSet rs = callableStatement.executeQuery();
				scrip2.updateStatus("TR", p1);

				// step2: clean staging

				/**
				 * convert values at staging to numbers
				 * 
				 */
//				cleanArea_System();
//				cleanSystem();
//				cleanDateCreate();
//				cleanArea();
//				load_Staging_to_Datawarehouse_initialization();

			}

		} catch (Exception e) {
			// TODO: handle exception

		}

	}
}
