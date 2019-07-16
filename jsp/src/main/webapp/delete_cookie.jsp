<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Usuwanie ciasteczka</title>
</head>
<body>
<h1>Usuwanie ciasteczka</h1>
<%
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie : cookies) {
        if (cookie.getName().equalsIgnoreCase("bgColor")) {
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
    }
%>
</body>
</html>
