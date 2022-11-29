package com.example.goldprice.controller;

public class Gold implements Comparable<Gold> {
    private int id_khuvuc;
    private int id_hethong;
    private int giamua;
    private int giaban;
    private int id_ngaycapnhat;
    private int id_ngayhethan;
    private String khuvuc;
    private String hethong;
    private String ngaycapnhat;
    private String ngayhethan;

    public Gold(int id_khuvuc, int id_hethong, int giamua, int giaban, int id_ngaycapnhat, int id_ngayhethan, String khuvuc, String hethong, String ngaycapnhat, String ngayhethan) {
        this.id_khuvuc = id_khuvuc;
        this.id_hethong = id_hethong;
        this.giamua = giamua;
        this.giaban = giaban;
        this.id_ngaycapnhat = id_ngaycapnhat;
        this.id_ngayhethan = id_ngayhethan;
        this.khuvuc = khuvuc;
        this.hethong = hethong;
        this.ngaycapnhat = ngaycapnhat;
        this.ngayhethan = ngayhethan;
    }

    public int getId_khuvuc() {
        return id_khuvuc;
    }

    public void setId_khuvuc(int id_khuvuc) {
        this.id_khuvuc = id_khuvuc;
    }

    public int getId_hethong() {
        return id_hethong;
    }

    public void setId_hethong(int id_hethong) {
        this.id_hethong = id_hethong;
    }

    public int getGiamua() {
        return giamua;
    }

    public void setGiamua(int giamua) {
        this.giamua = giamua;
    }

    public int getGiaban() {
        return giaban;
    }

    public void setGiaban(int giaban) {
        this.giaban = giaban;
    }

    public int getId_ngaycapnhat() {
        return id_ngaycapnhat;
    }

    public void setId_ngaycapnhat(int id_ngaycapnhat) {
        this.id_ngaycapnhat = id_ngaycapnhat;
    }

    public int getId_ngayhethan() {
        return id_ngayhethan;
    }

    public void setId_ngayhethan(int id_ngayhethan) {
        this.id_ngayhethan = id_ngayhethan;
    }

    public String getKhuvuc() {
        return khuvuc;
    }

    public void setKhuvuc(String khuvuc) {
        this.khuvuc = khuvuc;
    }

    public String getHethong() {
        return hethong;
    }

    public void setHethong(String hethong) {
        this.hethong = hethong;
    }

    public String getNgaycapnhat() {
        return ngaycapnhat;
    }

    public void setNgaycapnhat(String ngaycapnhat) {
        this.ngaycapnhat = ngaycapnhat;
    }

    public String getNgayhethan() {
        return ngayhethan;
    }

    public void setNgayhethan(String ngayhethan) {
        this.ngayhethan = ngayhethan;
    }

    @Override
    public int compareTo(Gold o) {
        if(this.id_ngayhethan<o.id_ngayhethan)
            return -1;
        else if (this.id_ngayhethan>o.id_ngayhethan)
            return 1;
        return 0;
    }

    @Override
    public String toString() {
        return "Gold{" +
                "id_khuvuc=" + id_khuvuc +
                ", id_hethong=" + id_hethong +
                ", id_ngayhethan=" + id_ngayhethan +
                ", ngayhethan='" + ngayhethan + '\'' +
                '}';
    }
}
