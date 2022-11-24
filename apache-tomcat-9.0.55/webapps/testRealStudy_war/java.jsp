<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<h1>this is java for creating test</h1>
<a> java for test: <%=request.getSession().getAttribute("heyJava").toString() %></a>
<hr>
<a> test EL expression in jsp: ${heyJava}</a>

</body>
</html>