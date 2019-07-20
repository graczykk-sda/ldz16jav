<%@ page contentType="text/html;charset=UTF-8" language="java"
         isELIgnored="false"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <title>User profile</title>
</head>
<body>
<jsp:useBean id="user" class="pl.sdacademy.jsp.beans.User" scope="request" />
<h1>User Profile</h1>
Name: ${user.name} <br/>
Surname: ${user.surname} <br/>
Email: ${user.email} <br/>
Photo: <img src="${user.photo}" alt="user photo"> <br/>
</body>
</html>
