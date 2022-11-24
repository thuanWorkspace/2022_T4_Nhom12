<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/11/2021
  Time: 11:07 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<center>--%>
    <h1>Using POST Method to Read Form Data</h1>
    <ul>
        <li><p><b>First Name:</b>
            <%= request.getParameter("first_name")%>
        </p></li>
        <li><p><b>Last  Name:</b>
            <%= request.getParameter("last_name")%>
        </p></li>
    </ul>

</body>
</html>
