<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User form</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<h1>User info</h1>
<form method="post" enctype="multipart/form-data" action="file-upload">
    <div>
        <label>Name</label>
        <input type="text" name="name" value="imię"/>
    </div>
    <div>
        <label>Surname</label>
        <input type="text" name="surname" value="nazwisko">
    </div>
    <div>
        <label>Photo</label>
        <input type="file" name="photo">
    </div>

    <div>
        <label></label>
        <input name="submit" type="submit" value="dodaj">
    </div>
</form>
</body>
</html>
