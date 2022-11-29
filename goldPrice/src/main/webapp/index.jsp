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
<a href="hello-servlet">Hello Servlet</a>
<a href="GetPriceBySystemAndArea">getprice</a>
<form action="ChartServlet" method="get">
    khuvuc: <input type="text" name="khuvuc">
    hethong: <input type="text" name="hethong">
    <div class="button_icon">
<%--        <a href="ChartServlet.jsp">ok--%>
<%--            <button id="myBtn">Open</button>--%>
<%--        </a>--%>
        <button  type="submit"> OK</button>
    </div>
</form>
</body>
</html>