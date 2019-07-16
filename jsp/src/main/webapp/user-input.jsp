<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User data</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h1>User details</h1>

<jsp:useBean id="user" class="pl.sdacademy.jsp.beans.User" scope="request" />

    <%
    String submit = request.getParameter("submit");
    if (submit != null && !submit.isEmpty()) {
    %>
    <jsp:setProperty name="user" property="*"/>
    <%
        response.sendRedirect("user-info.jsp");
    }
    %>

<form method="get">
    <div>
        <label>name</label>
        <input type="text" name="name" value="krzysztof"/>
    </div>
    <div>
        <label>surname</label>
        <input type="text" name="surname" value="graczyk">
    </div>
    <div>
        <label>address</label>
        <input type="text" name="address" value="lodz">
    </div>
    <div>
        <label>phone</label>
        <input type="text" name="phone" value="009909090">
    </div>
    <div>
        <label>email</label>
        <input type="text" name="email" value="email@gmail.com">
    </div>
    <div>
        <label>age</label>
        <input type="number" name="age" value="18">
    </div>
    <div>
        <label></label>
        <input name="submit" type="submit" value="dodaj">
    </div>
</form>
</body>
</html>
