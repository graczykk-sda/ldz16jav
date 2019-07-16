<%@ page import="pl.sdacademy.jsp.beans.User" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodawanie usera do ciasteczka</title>
</head>
<body>

<jsp:useBean id="user" class="pl.sdacademy.jsp.beans.User" />

<%
    user.setAddress("Łódź");
    user.setAge(20);
    user.setEmail("email@gmail.com");
    user.setPhone("0909090");
    user.setName("imię");
    user.setSurname("nazwisko");

    String encoded = Base64.getEncoder()
            .encodeToString(user.toString().getBytes(StandardCharsets.UTF_8));

    Cookie cookie = new Cookie("user", encoded);
    response.addCookie(cookie);
%>

</body>
</html>
