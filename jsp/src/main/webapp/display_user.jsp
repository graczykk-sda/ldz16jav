<%@ page import="java.util.Base64" %>
<%@ page import="pl.sdacademy.jsp.beans.User" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Wyświetlanie usera</title>
</head>
<body>

<h1>User info</h1>

<jsp:useBean id="user" class="pl.sdacademy.jsp.beans.User"/>

<%
    for (Cookie cookie : request.getCookies()) {
        if (cookie.getName().equalsIgnoreCase("user")) {
            String base64encoded = cookie.getValue();
            byte[] decode = Base64.getDecoder().decode(base64encoded);
            user = User.fromString(new String(decode, StandardCharsets.UTF_8));
        }
    }
%>

Name: <%= user.getName() %><br/>
Surname: <%= user.getSurname() %><br/>
Phone: <%= user.getPhone() %><br/>
Address: <%= user.getAddress() %><br/>
Age: <%= user.getAge() %> <br/>
email: <%= user.getEmail() %> <br/>

</body>
</html>
