package com.example.goldprice.controller;

import java.util.ArrayList;
import java.util.List;

public class Test {
    public static List<String> getAreas_byString() {
        List<String> list = new ArrayList<>();
        list.add("tphcm");
        list.add("hanoi");
        list.add("haiphong");
        list.add("thanh hoa");
        list.add("nghe an");

        return list;
    }
    public static List<String> getSystems_byString() {
        List<String> list = new ArrayList<>();
        list.add("sjc");
        list.add("png");
        list.add("dojji");
        return list;
    }
}
