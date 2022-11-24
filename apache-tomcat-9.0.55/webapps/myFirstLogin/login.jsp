<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

    <form action="Login" method="POST">
    <%
        String alert =(String) session.getAttribute("alert");
        if(alert!=null){
        %>
        <p><%=alert%></p>
        <%
        }
    %>
        <p></p>
    Enter username: <input type="text" name="uname"><br/>
    Enter password: <input type="password" name="pass"/>
        <input type="submit" value="login">

</form>

</body>
</html>