<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<% List<String> listkhuvuc = (List<String>) request.getAttribute("listkhuvuc");
    List<String> listhethong = (List<String>) request.getAttribute("listhethong");%>
<form action="ChartServlet" method="get">
    khuvuc: <input type="text" name="khuvuc" list="khuvuc">
    <datalist id="khuvuc">
        <% for (String s : listkhuvuc
        ) { %>
        <option value="<%=s%>">
                <%}%>
    </datalist>
    hethong: <input type="text" name="hethong" list="hethong">
    <datalist id="hethong">
        <% for (String s : listhethong
        ) { %>
        <option value="<%=s%>">
                <%}%>
    </datalist>
    <div class="button_icon">
        <button type="submit">OK</button>
    </div>
</form>
</body>
</html>