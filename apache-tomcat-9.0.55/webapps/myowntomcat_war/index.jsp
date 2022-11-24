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
<%-- value="<%= request.getParameter("value") --%>
<a href="helloServlet">Hello Servlet</a>
<form action="dangnhap" method="post">
    <p>username</p>
    <input type="text" name="username">
    <br>
    <p>password</p>
    <input type="password" name="password">
    <p name="notify"></p>
    <button type="submit" >submit</button>
</form>
</body>
</html>