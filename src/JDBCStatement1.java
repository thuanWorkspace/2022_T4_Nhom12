import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JDBCStatement1 {

	private static void load_Staging_to_Datawarehouse() {
		Connection con = ConnectionToFileLogDatabase.getCon();
		try {
			CallableStatement callableStatement = con.prepareCall("{call Check_status()}");
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
		JDBCStatement1 jdbcStatement = new JDBCStatement1();
		jdbcStatement.load_Staging_to_Datawarehouse();
	}
}