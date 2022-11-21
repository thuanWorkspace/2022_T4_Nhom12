import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class JsoupRun3 {
	public String tgCapNhat = null;
	//thuan edit thuan1 master
	public ArrayList<Gold> crawlData(String source) throws IOException {
		int i = 0;
		String khuVuc = null;
		String loaiVang = null;
		String naturalKey = null;
		Document doc = Jsoup.connect(source).timeout(8000).get();// Link gốc đây nha ae =)))
		Elements body = doc.select("tbody");
		int len = body.select("tr").size();
		String arrS1[] = new String[len];
		String arrS2[] = new String[len];
		int arrS3[] = new int[len];
		int arrS4[] = new int[len];
		int arrS5[] = new int[len];
		ArrayList<Gold> listGoldData = new ArrayList<Gold>();
		Gold gold = new Gold(null, null, null, 0, 0, 0, null);
		for (Element e : body.select("tr")) {
			khuVuc = e.select("th.text-left a").text().trim();
			loaiVang = e.select("td.text-left").text().trim();
			String giaMua = e.select("td:nth-of-type(2)").text().trim().concat(".000");
			int giaMuaConvert = convertToNumber(giaMua);
			String giaBan = e.select("td:nth-of-type(3)").text().trim().concat(".000");
			int giaBanConvert = convertToNumber(giaBan);
			int chenhLech = giaBanConvert - giaMuaConvert;
			arrS1[i] = khuVuc;
			arrS2[i] = loaiVang;
			arrS3[i] = giaMuaConvert;
			arrS4[i] = giaBanConvert;
			arrS5[i] = chenhLech;
			i++;
		}
		i = 1;
		for (int x = 0; x < arrS1.length - 1; x++) {
			if (arrS1[x].equalsIgnoreCase("") && (x != 0)) {
				arrS1[x] = arrS1[x - 1];
			}
			naturalKey = arrS1[x] + "_" + arrS2[x];
//			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("YYYY-MM-DD");// hh:mm:ss bỏ ra tạm//đóng l
			LocalDate dtf = LocalDate.now();

//			System.out.println(dtf);
//			LocalDateTime now = LocalDateTime.now();//đóng lại
			gold = new Gold(naturalKey, arrS1[x], arrS2[x], arrS3[x], arrS4[x], arrS5[x], dtf);// dtf.format(now)
			listGoldData.add(gold);
//			System.out.println(gold.toString());
		}
		return listGoldData;
	}

	public static int convertToNumber(String data) {
		int num = 0;
		int result = 0;
		StringBuffer sb = new StringBuffer();
		sb.append(data);
		String arrStr[] = sb.toString().split("");
		for (int x = 0; x < arrStr.length; x++) {
			if (arrStr[x].equalsIgnoreCase(".")) {
			} else {
				num = Integer.parseInt(arrStr[x]);
				result = (int) ((result * 10) + num);
			}
		}
		return result;
	}

	public static String fileExcelPath_Xlsx() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("ddMMyy_HH-mm");
		LocalDateTime now = LocalDateTime.now();
		String fileName = "DataWareHouse_" + dtf.format(now).replaceAll("-", "h");
		String changePath = "D:\\DataWareHouse\\datawarehouse\\";// Nhớ đổi đường dẫn
		String excelFilePath = changePath + fileName + ".xlsx";
		return excelFilePath;
	}

//	dd-MM-yy_HH-mm-ss
	public static String Write(ArrayList<Gold> data) {
		//
		DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("dd-MM-yy_HH-mm-ss");// yyyy/MM-dd.HH-mm-ss//yy-MM-dd_HH-mm-ss
		LocalDateTime now1 = LocalDateTime.now();
//		String fileName = dtf1.format(now1);
		String fileName = dtf1.format(now1);

//        File f = new File("D:\\DataWareHouse\\datawarehouse\\" + fileName + ".csv");
		String paths="C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\";
		
		File f = new File( paths+ fileName + ".csv");// fileName
		String path = f.getAbsolutePath();
//        System.out.println(f.getAbsolutePath());
		try {
			FileOutputStream fos = new FileOutputStream(f);
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yy_HH-mm-ss");//
			OutputStreamWriter writerutf8 = new OutputStreamWriter(fos, "UTF-8");
			PrintWriter writer = new PrintWriter(writerutf8, true);
			LocalDateTime now = LocalDateTime.now();
//			writer.println(dtf.format(now));
			for (int i = 0; i < data.size() - 1; i++) {
				writer.println(data.get(i).toString1());
			}
			writer.close();
		} catch (FileNotFoundException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return path;
	}

//	public static String filecsvPath() {
//		DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("dd-MM-yy_HH-mm-ss");// yyyy/MM-dd.HH-mm-ss
//		LocalDateTime now1 = LocalDateTime.now();
//		String fileName = dtf1.format(now1);
////          File f = new File("D:\\DataWareHouse\\datawarehouse\\" + fileName + ".csv");
//		File f = new File("C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\" + fileName + ".csv");
//		String pathss = f.getAbsolutePath();
////		System.out.println(pathss);
//		// 
//		
//		
//		try {
//			FileOutputStream fos = new FileOutputStream(f);
//			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy_HH-mm-ss");
//			OutputStreamWriter writerutf8 = new OutputStreamWriter(fos, "UTF-8");
//			PrintWriter writer = new PrintWriter(writerutf8, true);
//			LocalDateTime now = LocalDateTime.now();
//			writer.println(dtf.format(now));
////              for (int i = 0; i < data.size() - 1; i++) {
////                  writer.println(data.get(i).toString1());
////              }
//			writer.print(pathss);
//
//			writer.close();
//		} catch (FileNotFoundException | UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return pathss;
//	}

	//
	public static void main(String[] args) throws IOException {
		JsoupRun3 js = new JsoupRun3();
		String source = "https://giavang.org/";// the path is just for test method 
		ArrayList<Gold> data = js.crawlData(source);
		String filePath = fileExcelPath_Xlsx();
		WriteExcel.writeExcel(data, filePath);
		js.Write(data);

	}
}
