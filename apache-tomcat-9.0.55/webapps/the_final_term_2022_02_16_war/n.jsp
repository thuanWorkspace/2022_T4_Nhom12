<%@ page import="com.example.the_final_term20220216.functions.UserAccount" %><%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 02/05/2022
  Time: 2:28 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%if(session.getAttribute("auth")!=null){%>
    login success
<%=((UserAccount)session.getAttribute("auth")).getUser_name()%>
<%}else{%>
login failed<%}%>
</body>
</html>
