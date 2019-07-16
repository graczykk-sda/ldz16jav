<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ciasteczka</title>
</head>
<body>
<h1>Cookies values</h1>
<table border="1" width="80%">
    <tr>
        <th>cookie name</th>
        <th>value</th>
    </tr>
    <%
        for (Cookie cookie : request.getCookies()) {
    %>
    <tr>
        <td>
            <%= cookie.getName() %>
        </td>
        <td>
            <%= cookie.getValue() %>
        </td>
    </tr>
    <%
        }
    %>

</table>
</body>
</html>
