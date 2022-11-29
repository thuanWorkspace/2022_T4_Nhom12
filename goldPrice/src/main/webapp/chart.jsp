<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.goldprice.controller.Gold" %><%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 26/11/2022
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% ArrayList< Gold> list = (ArrayList<Gold>) request.getAttribute("list");%>

<html>
<head>
    <title>Chartiii</title>
    <script> src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.0.1/chart.min.js" </script>
    <% if (list==null || list.isEmpty()){%>
    can't not find any information!
    <%}%>
</head>
<body>
<a href="index.jsp"> back </a>
<div class="box" style="width:90rem" style="height:90rem">
    <canvas id="myChart"></canvas>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    //set up
    const showLegend = true;
    const labels = ['1', '2', '3', '4', '5', '6'];
    const data = {
        labels: labels,
        datasets: [{
            label: 'Giá mua',
            data: [65, 59, 80, 81, 56, 55, 40],
            fill: false,
            borderColor: 'rgb(255, 0, 0)',
            tension: 0.1,
            backgroundColor: 'rgb(255, 0, 0)',
        }, {
            label: 'Giá bán',
            data: [56, 59, 80, 81, 56, 0, 100],
            fill: false,
            borderColor: 'rgb(75, 192, 0)',
            tension: 0.1,
            backgroundColor: 'rgb(75, 192, 0)',
        }]
    };
    //config
    const config = {
        type: 'line',
        data: data,
        options: {
            plugins: {
                legend: {
                    display: showLegend
                }
            }
        }
    };
    //render
    var myChart = new Chart(document.getElementById('myChart'), config);
</script>
</body>
</html>
