import java.util.HashMap;
import java.util.Map;

public class Helloworld {
	public static void main(String[] args) {
		System.out.println("hello world");
		
	}
	public static void connect_database() {
		Map<String,String> getUserPass = getUserPass();
		
		String username = getUserPass.get("usernameMysql");
		String pass = getUserPass.get("passMysql");
		
	}
	public static Map<String,String> getUserPass(){
		//hieu code here!
		return new HashMap<String, String>();
	}
	//hello test 

}
