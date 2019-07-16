<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodawanie ciasteczka</title>
</head>
<body>
<h1>Dodawanie ciasteczka</h1>
<%
    Cookie cookie = new Cookie("bgColor", "blue");
    response.addCookie(cookie);
%>
</body>
</html>
