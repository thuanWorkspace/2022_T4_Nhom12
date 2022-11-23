import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JDBCStatement1 {

	public static void load_Staging_to_Datawarehouse() {
		Connection con = ConnectionToFileLogDatabase.getCon();
		try {
			CallableStatement callableStatement = con.prepareCall("{call load_Staging_to_Datawarehouse()}");
			ResultSet rs = callableStatement.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public static void main(String[] args) {
		JDBCStatement1 jdbcStatement = new JDBCStatement1();
		load_Staging_to_Datawarehouse();
	}
}