import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class PrintToFile {

	public static void WriteToday(String data) {
		DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("yyyy-MM-dd_HH-mm-ss");//yyyy/MM-dd.HH-mm-ss  
		LocalDateTime now1 = LocalDateTime.now();  
		System.out.println(dtf1.format(now1));
		String fileName = dtf1.format(now1);
		File f = new File("datawarehouse\\"+fileName+".txt");
		System.out.println(f.getAbsolutePath());
		try {
			PrintWriter writer = new PrintWriter(new FileOutputStream(f,true),true);
			 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
			 LocalDateTime now = LocalDateTime.now();  
			writer.println(data+", "+dtf.format(now));
			writer.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
//			String err = e.
		}
	}
	public static void main(String[] args) {
		WriteToday("heelo me");
	}
}
