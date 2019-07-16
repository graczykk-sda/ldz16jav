<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"

%>
<html>
<head>
    <title>Headers example</title>
<%--    <link rel="stylesheet" href="style.css">--%>
</head>
<body>
<h1>Header values</h1>
    <table border="1" width="80%">
        <tr>
            <th>header</th>
            <th>value</th>
        </tr>
        <% Enumeration<String> headerNames = request.getHeaderNames();
            while (headerNames.hasMoreElements()) {
                String header = headerNames.nextElement();
        %>
        <tr>
            <td>
                <%= header %>
            </td>
            <td>
                <%= request.getHeader(header) %>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
