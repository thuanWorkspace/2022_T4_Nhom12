package com.example.goldprice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

//dao = data access object - function -> database
public class DatawarehouseDao {
    static Connection conn = GetConnection.getCon();

    //list all khuvuc_hethong
    public static List<Integer> getAreas_Systems_byCode() {
        List<Integer> re = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement("select distinct khuvuc_hethong from data_warehouse.data_warehouse  ;");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                re.add(rs.getInt("khuvuc_hethong"));
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return re;
    }

    public static List<String> getAreas_Systems_byString() {
        List<String> re = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement("select distinct tenKhuVuc_HeThong from data_warehouse.data_warehouse join staging.dim_khuvuc_hethong on khuvuc_hethong=id_khuvuc_hethong;");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                re.add(rs.getString("tenKhuVuc_HeThong"));
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return re;
    }

    //list all khuvuc
    public static List<Integer> getAreas_byCode() {
        List<Integer> re = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement("select distinct khuvuc from data_warehouse.data_warehouse;");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                re.add(rs.getInt("khuvuc"));
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return re;
    }

    public static List<String> getAreas_byString() {
        List<String> re = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement("select distinct tenKhuVuc from data_warehouse.data_warehouse join staging.dim_khuvuc on khuvuc=id_khuvuc;");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                re.add(rs.getString("tenKhuVuc"));
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return re;
    }

    //list all hethong
    public static List<Integer> getSystems_byCode() {
        List<Integer> re = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement("select distinct hethong from data_warehouse.data_warehouse;");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                re.add(rs.getInt("hethong"));
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return re;
    }

    public static List<String> getSystems_byString() {
        List<String> re = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement("select distinct tenHeThong from data_warehouse.data_warehouse join staging.dim_hethong on hethong=id_heThong;");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                re.add(rs.getString("tenHeThong"));
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return re;
    }

    //list all ngaycapnhat
    public static List<Integer> getCreateDates_byCode() {
        List<Integer> re = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement("select distinct ngaycapnhat from data_warehouse.data_warehouse;");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                re.add(rs.getInt("ngaycapnhat"));
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return re;
    }

    public static String getCreateFirstDate_byString(String id_khuvuc, String id_hethong) {
        String re = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select distinct full_date from data_warehouse.data_warehouse join staging.date_dim on ngaycapnhat=date_sk where khuvuc=? && hethong=?;");
            ps.setString(1, id_khuvuc);
            ps.setString(2, id_hethong);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
//                String date_s = rs.getString("full_date");
//                SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
//                Date date = null;
//                try {
//                    date = dt.parse(date_s);
//                } catch (ParseException e) {
//                    throw new RuntimeException(e);
//                }
//                SimpleDateFormat dt1 = new SimpleDateFormat("dd/MM/yyyy");
                re = rs.getString("full_date");
                break;
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return re;
    }

    //return giamua
    public static int buyPrice(String area, String system, String date) {
        int re = 0;
        int option = 0;
        PreparedStatement ps = null;
        try {
            for (int a = 0; a < getAreas_byString().size() - 1; a++) {
                if (area.equalsIgnoreCase(getAreas_byString().get(a).replaceAll("\"", ""))) {
                    area = getAreas_byString().get(a).replaceAll("\"", "");
                    option++;
                    break;
                }
            }
            for (int b = 0; b < getSystems_byString().size() - 1; b++) {
                if (system.equalsIgnoreCase(getSystems_byString().get(b).replaceAll("\"", ""))) {
                    system = getSystems_byString().get(b).replaceAll("\"", "");
                    option++;
                    break;
                }
            }
            if (option == 0) {
                ps = conn.prepareStatement("select distinct giamua from data_warehouse.data_warehouse join staging.date_dim on ngaycapnhat=date_sk where khuvuc=? && hethong=? && full_date=?;");
                convertKhuVucToID(area);
                convertHeThongToId(system);
            }
            if (option == 2) {
                ps = conn.prepareStatement("select distinct giamua from data_warehouse.data_warehouse join staging.date_dim on ngaycapnhat=date_sk join staging.dim_khuvuc on khuvuc=id_khuvuc join staging.dim_hethong on hethong=id_heThong where tenkhuvuc=? && tenHeThong=? && full_date=?;");

            }
            ps.setString(1, area);
            ps.setString(2, system);
            ps.setString(3, date);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                re = rs.getInt("giamua");
            }
            // code để nổ máy ae đừng thử =))
//            for (int a = 0; a < getAreas_Systems().size(); a++) {
//                for (int b = 0; b < getAreas_Systems().size(); b++) {
//                    for (int c = 0; c < getAreas_Systems().size(); c++) {
//                        if (area == getAreas().get(a) && system == getSystems().get(b) && date == getToDay().get(c)) {
//                            PreparedStatement ps = conn.prepareStatement("select distinct giamua from data_warehouse.data_warehouse where khuvuc=? && hethong=? && ngaycapnhat=?;");
//                            ps.setString(1, a + "");
//                            ps.setString(2, b + "");
//                            ps.setString(3, c + "");
//                            ResultSet rs = ps.executeQuery();
//                            if (rs.next()) {
//                                re = rs.getDouble("giamua");
//                                break;
//                            }
//                        }
//                    }
//                }
//            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return re;
    }

    public static int sellPrice(String area, String system, String date) {
        int re = 0;
        int option = 0;
        PreparedStatement ps = null;
        try {
            for (int a = 0; a < getAreas_byString().size() - 1; a++) {
                if (area.equalsIgnoreCase(getAreas_byString().get(a))) {
                    option++;
                    break;
                }
            }
            for (int b = 0; b < getSystems_byString().size() - 1; b++) {
                if (area.equalsIgnoreCase(getAreas_Systems_byString().get(b))) {
                    option++;
                    break;
                }
            }
            if (option == 0) {
                ps = conn.prepareStatement("select distinct giaban from data_warehouse.data_warehouse join staging.date_dim on ngaycapnhat=date_sk where khuvuc=? && hethong=? && full_date=?;");
            }
            if (option == 2) {
                ps = conn.prepareStatement("select distinct giaban from data_warehouse.data_warehouse join staging.date_dim on ngaycapnhat=date_sk join staging.dim_khuvuc on khuvuc=id_khuvuc join staging.dim_hethong on hethong=id_heThong where tenkhuvuc=? && tenHeThong=? && full_date=?;");
            }
            ps.setString(1, area);
            ps.setString(2, system);
            ps.setString(3, date);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                re = rs.getInt("giaban");
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return re;
    }

    public static int convertKhuVucToID(String khuvuc) {
        int re = 0;
        for (int i = 0; i < getAreas_byString().size() - 1; i++) {
            if (khuvuc.equalsIgnoreCase(getAreas_byString().get(i).replaceAll("\"", ""))) {
                re = getAreas_byCode().get(i);
            }
        }
        return re;
    }

    public static int convertHeThongToId(String hethong) {
        int re = 0;
        for (int i = 0; i < getSystems_byString().size() - 1; i++) {
            if (hethong.equalsIgnoreCase(getSystems_byString().get(i).replaceAll("\"", ""))) {
                re = getAreas_byCode().get(i);
            }
        }
        return re;
    }

    public static int convertDateToIdId(String date) {
        int re = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("select distinct ngaycapnhat from data_warehouse.data_warehouse join staging.date_dim on ngaycapnhat=date_sk where full_date=?;");
            ps.setString(1, date);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                re = rs.getInt("ngaycapnhat");
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return re;
    }

    public static void main(String[] args) {
        DatawarehouseDao datawarehouseDao = new DatawarehouseDao();
//        System.out.println(getAreas_Systems_byCode());
//        System.out.println(getAreas_Systems_byString());
        System.out.println(getAreas_byCode());
        System.out.println(getAreas_byString());
        System.out.println(getSystems_byCode());
        System.out.println(getSystems_byString());
//        System.out.println(getCreateDates_byCode());
        System.out.println(getCreateFirstDate_byString("1", "2"));
//        System.out.println(convertKhuVucToID("Hà Nội"));
//        System.out.println(convertHeThongToId("SJC"));
//        System.out.println(convertDateToIdId("2022-11-25"));
        //  Cách lấy dữ liệu mẫu
        System.out.println(buyPrice("1", "1", "2022-11-24"));
        System.out.println(sellPrice("1", "2", "2022-11-25"));
    }
}
