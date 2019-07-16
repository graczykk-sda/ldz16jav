<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Params</title>
</head>
<body>
<h1>Parameters values</h1>
<table border="1" width="80%">
    <tr>
        <th>param</th>
        <th>value</th>
    </tr>
    <% Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
    %>
    <tr>
        <td>
            <%= paramName %>
        </td>
        <td>
            <%= request.getParameter(paramName) %>
        </td>
    </tr>
    <%
        }
    %>

</table>
</body>
</html>
