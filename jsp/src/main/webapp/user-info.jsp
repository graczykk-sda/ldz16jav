<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User profile</title>
</head>
<body>
<jsp:useBean id="user" class="pl.sdacademy.jsp.beans.User" scope="request"/>
<%= user.toString() %>
</body>
</html>
