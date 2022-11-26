
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class Main {

	public static thuanScriptToGiaVang scrip1;
	public static JDBCStatement scrip2;

	public static void main(String[] args) throws Exception {
//		scrip1.algoDefault();
		scrip1.runConfig();
		scrip2.getPaths();

	}

	/**
	 * the method is change hard code to dynamic code (doing)
	 */
	/**
	 * get columns name in table config mapping to...
	 */
	static String load = "hieu";

	public String valuesConfig(String columns) {
		// String name = columns;
		Connection con = ConnectionToFileLogDatabase.getCon();
		String sql = "select id_config,source_http_url,author,mail,file_name from config where file_name=?;";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, load);
			ResultSet rs = ps.executeQuery();
			Map<String, String> mp = new HashMap<String, String>();
			while (rs.next()) {
				mp.put(columns, Integer.toString(rs.getInt(columns)));
				mp.put(columns, rs.getString(columns));

				// của hiếu thêm vào

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		return columns;

	}

}
