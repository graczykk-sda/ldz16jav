<%@ page contentType="text/html;charset=UTF-8" language="java"
         isELIgnored="false"
%>
<html>
<head>
    <title>User info</title>
</head>
<body>
    <h2>User info</h2>
    <jsp:useBean id="user" class="pl.sdacademy.jsp.domain.User" scope="request"/>
    Name: ${user.name}<br/>
    Surname: ${user.surname}<br/>
    Photo: <img src="${user.photoUrl}" alt="user photo"/> <br/>
</body>
</html>
