package com.example.goldprice.controller;

import com.example.goldprice.dao.DatawarehouseDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;

@WebServlet(name = "ChartServlet", value = "/ChartServlet")
public class ChartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String khuvuc = request.getParameter("khuvuc");
        String hethong = request.getParameter("hethong");
        System.out.println("KV: "+khuvuc);
        System.out.println("HT: "+hethong);
        ArrayList<Gold> list = DatawarehouseDao.listGoldDefault(khuvuc,hethong);
        list.sort((o1, o2) -> {
            if(o1.getId_ngayhethan()<o2.getId_ngayhethan())
                return -1;
            else if (o2.getId_ngayhethan()>o2.getId_ngayhethan())
                return 1;
            return 0;
        });
        request.setAttribute("list",list);
        request.getRequestDispatcher("chart.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
