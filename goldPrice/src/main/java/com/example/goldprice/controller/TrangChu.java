package com.example.goldprice.controller;

import com.example.goldprice.dao.DatawarehouseDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TrangChu", value = "/TrangChu")
public class TrangChu extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> listKhuvuc  = DatawarehouseDao.getAreas_byString();
        List<String> listHethong  = DatawarehouseDao.getSystems_byString();
        request.setAttribute("listkhuvuc",listKhuvuc);
        request.setAttribute("listhethong",listHethong);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
