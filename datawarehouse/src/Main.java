
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
}
