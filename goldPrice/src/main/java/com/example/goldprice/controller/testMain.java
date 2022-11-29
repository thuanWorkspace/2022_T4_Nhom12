package com.example.goldprice.controller;

import java.util.ArrayList;
import java.util.Comparator;

public class testMain {
    public static void main(String[] args) {
        Gold g1 = new Gold(1,1,60,
                70,6000,60001,
                "a","a","26-11-2022","27-11-2022");
        Gold g2 = new Gold(1,1,65,
                67,6001,60002,
                "a","a","27-11-2022","28-11-2022");
        Gold g3 = new Gold(1,1,66,
                68,6002,60003,
                "a","a","28-11-2022","29-11-2022");
        Gold g4 = new Gold(1,1,50,
                64,6003,60004,
                "a","a","29-11-2022","30-11-2022");
        ArrayList<Gold> list = new ArrayList<Gold>();

        list.add(g2);
        list.add(g4);
        list.add(g1);
        list.add(g3);


        System.out.println("before sort");
        for (Gold g:list
             ) {
            System.out.println(g);
        }
        System.out.println("after sort");
        list.sort(new Comparator<Gold>() {
            @Override
            public int compare(Gold o1, Gold o2) {
                if(o1.getId_ngayhethan()<o2.getId_ngayhethan())
                    return -1;
                else if (o2.getId_ngayhethan()>o2.getId_ngayhethan())
                    return 1;
                return 0;
            }
        });
        for (Gold g:list
        ) {
            System.out.println(g);
        }
        for (Gold g:list
        ) {
            System.out.println(g.getNgaycapnhat());
        }
    }
}
