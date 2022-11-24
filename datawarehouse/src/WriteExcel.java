import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.BuiltinFormats;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class WriteExcel {
    public static final int COLUMN_INDEX_ID = 0;
    public static final int COLUMN_INDEX_AREA = 1;
    public static final int COLUMN_INDEX_SYSTEM = 2;
    public static final int COLUMN_INDEX_PURCHASEPRICE = 3;
    public static final int COLUMN_INDEX_SELLPRICE = 4;
    public static final int COLUMN_INDEX_DEVIANT = 5;
    public static final int COLUMN_INDEX_TIMECRAWLDATA = 6;
    private static CellStyle cellStyleFormatNumber = null;
    static ArrayList<Gold> lists = new ArrayList<Gold>();

    public static void writeExcel(List<Gold> golds, String excelFilePath) throws IOException {

        // Create Workbook
        Workbook workbook = getWorkbook(excelFilePath);
        // Create sheet
        Sheet sheet = workbook.createSheet("Giá vàng"); // Create sheet with sheet name
        int rowIndex = 0;
        // Write header
        writeHeader(sheet, rowIndex);
        // Write data
        rowIndex++;
        for (Gold gold : golds) {
            // Create row
            Row row = sheet.createRow(rowIndex);
            // Write data on row
            writeBook(gold, row);
            rowIndex++;
        }

        // Write footer
        writeFooter(sheet, rowIndex);
        // Auto resize column witdth
        int numberOfColumn = sheet.getRow(0).getPhysicalNumberOfCells();
        autosizeColumn(sheet, numberOfColumn);
        // Create file excel
        createOutputFile(workbook, excelFilePath);
        System.out.println("Location: " + excelFilePath + " has create!!!");
    }

    // Create workbook
    private static Workbook getWorkbook(String excelFilePath) throws IOException {
        Workbook workbook = null;

        if (excelFilePath.endsWith("xlsx")) {
            workbook = new XSSFWorkbook();
        } else if (excelFilePath.endsWith("xls")) {
            workbook = new HSSFWorkbook();
        } else {
            throw new IllegalArgumentException("The specified file is not Excel file");
        }
        return workbook;
    }

    // Write header with format
    private static void writeHeader(Sheet sheet, int rowIndex) {
        // create CellStyle
        CellStyle cellStyle = createStyleForHeader(sheet);

        // Create row
        Row row = sheet.createRow(rowIndex);

        // Create cells
        Cell cell = row.createCell(COLUMN_INDEX_ID);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("ID");

        cell = row.createCell(COLUMN_INDEX_AREA);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Khu vực");

        cell = row.createCell(COLUMN_INDEX_SYSTEM);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Hệ thống");

        cell = row.createCell(COLUMN_INDEX_PURCHASEPRICE);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Giá mua");

        cell = row.createCell(COLUMN_INDEX_SELLPRICE);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Giá bán");

        cell = row.createCell(COLUMN_INDEX_DEVIANT);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Chênh lệch");

        cell = row.createCell(COLUMN_INDEX_TIMECRAWLDATA);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Thời gian tạo file");

    }

    // Write data
    private static void writeBook(Gold gold, Row row) {
        Workbook workbook = row.getSheet().getWorkbook();
        if (cellStyleFormatNumber == null) {
            // Format number
            short format = (short) BuiltinFormats.getBuiltinFormat("#,##0");
            // Create CellStyle
            cellStyleFormatNumber = workbook.createCellStyle();
            cellStyleFormatNumber.setDataFormat(format);
        }
        Cell cell = row.createCell(COLUMN_INDEX_ID);
        cell.setCellValue(gold.getId());
        cell.setCellStyle(cellStyleFormatNumber);

        cell = row.createCell(COLUMN_INDEX_AREA);
        cell.setCellValue(gold.getKhuVuc());
        cell.setCellStyle(cellStyleFormatNumber);

        cell = row.createCell(COLUMN_INDEX_SYSTEM);
        cell.setCellValue(gold.getHeThong());
        cell.setCellStyle(cellStyleFormatNumber);

        cell = row.createCell(COLUMN_INDEX_PURCHASEPRICE);
        cell.setCellValue(gold.getGiaMua());
        cell.setCellStyle(cellStyleFormatNumber);

        cell = row.createCell(COLUMN_INDEX_SELLPRICE);
        cell.setCellValue(gold.getGiaBan());
        cell.setCellStyle(cellStyleFormatNumber);

        cell = row.createCell(COLUMN_INDEX_DEVIANT);
        cell.setCellValue(gold.getChenhLech());
        cell.setCellStyle(cellStyleFormatNumber);

        cell = row.createCell(COLUMN_INDEX_TIMECRAWLDATA);
        cell.setCellValue(gold.getTimeCrawlData());
        cell.setCellStyle(cellStyleFormatNumber);

        // set border
        cellStyleFormatNumber.setFillForegroundColor(IndexedColors.LIGHT_YELLOW.getIndex());
        cellStyleFormatNumber.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        cellStyleFormatNumber.setBorderTop(BorderStyle.MEDIUM);
        cellStyleFormatNumber.setBorderBottom(BorderStyle.MEDIUM);
        cellStyleFormatNumber.setBorderLeft(BorderStyle.MEDIUM);
        cellStyleFormatNumber.setBorderRight(BorderStyle.MEDIUM);

    }

    // Create CellStyle for header
    private static CellStyle createStyleForHeader(Sheet sheet) {
        // Create font
        Font font = sheet.getWorkbook().createFont();
        font.setFontName("Times New Roman");
        font.setBold(true);
        font.setFontHeightInPoints((short) 18); // font size
        font.setColor(IndexedColors.WHITE.getIndex()); // text color

        // Create CellStyle
        CellStyle cellStyle = sheet.getWorkbook().createCellStyle();
        cellStyle.setFont(font);
        cellStyle.setFillForegroundColor(IndexedColors.RED.getIndex());
        cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        cellStyle.setBorderBottom(BorderStyle.THIN);
        // set border
        cellStyle.setBorderTop(BorderStyle.MEDIUM);
        cellStyle.setBorderBottom(BorderStyle.MEDIUM);
        cellStyle.setBorderLeft(BorderStyle.MEDIUM);
        cellStyle.setBorderRight(BorderStyle.MEDIUM);
        // set Alignment
        cellStyle.setAlignment(HorizontalAlignment.CENTER);
        return cellStyle;
    }

    // Write footer
    private static void writeFooter(Sheet sheet, int rowIndex) {
        // Create row
        Row row = sheet.createRow(rowIndex);
        Cell cell = row.createCell(9);
//		cell.setCellFormula("SUM(E2:E6)");
    }

    // Auto resize column width
    private static void autosizeColumn(Sheet sheet, int lastColumn) {
        for (int columnIndex = 0; columnIndex < lastColumn; columnIndex++) {
            sheet.autoSizeColumn(columnIndex);
        }
    }

    // Create output file
    private static void createOutputFile(Workbook workbook, String excelFilePath) throws IOException {
        try (OutputStream os = new FileOutputStream(excelFilePath)) {
            workbook.write(os);
            workbook.close();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
