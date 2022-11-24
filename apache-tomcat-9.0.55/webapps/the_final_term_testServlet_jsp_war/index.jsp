<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- jsp comment--%>

<%-- declare --%>
<%! public void jdkTest(){
    System.out.println("declaration");
}
public String skd(){
    return "value jdk";
}
%>
<% String value = skd();%>

<%-- print the value out --%>
<%--<%=value%>--%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<h1></h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<form action="/the_final_term_testServlet_jsp_war/hello-servlet" method="post">
    <%
        String s = "";
        if(!(request.getAttribute("error")==null)) {
            s = request.getAttribute("error").toString();
    %>
    <p style="color:red;"><%=s%></p>
    <%

        }
    %>
    Name: <input type="text" name="userName">
    Password: <input type="text" name="password">
    <button type="submit">submit</button>
    <button type="reset">reset</button>
</form>

</body>
</html>