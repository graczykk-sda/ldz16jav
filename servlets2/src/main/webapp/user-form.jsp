<%@ page contentType="text/html;charset=UTF-8" language="java"
         isELIgnored="false"
         pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User form</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<c:if test="${param.userAdded == 'true'}">
    Użytkownik został dodany.
</c:if>

<h2>User profile</h2>
<form method="post" action="handle-user-form" enctype="multipart/form-data">
    <div>
        <label>name</label>
        <input type="text" name="name" value="imię"/>
    </div>
    <div>
        <label>surname</label>
        <input type="text" name="surname" value="nazwisko">
    </div>
    <div>
        <label>email</label>
        <input type="text" name="email" value="email@gmail">
    </div>
    <div>
        <label>photo</label>
        <input type="file" name="photo">
    </div>
    <div>
        <label></label>
        <input name="submit" type="submit" value="add">
    </div>
</form>
</body>
</html>
