<%@ page contentType="text/html;charset=UTF-8" language="java"
         isELIgnored="false"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Headers jstl</title>
</head>
<body>
<h2><c:out value="To jest jstl core out" /></h2>

<h1>Header values</h1>

<table border="1" width="80%">
    <tr>
        <th>header</th>
        <th>value</th>
    </tr>

    <c:forEach items="${header}" var="item" >
        <tr>
            <td><c:out value="${item.key}" /></td>
            <td><c:out value="${item.value}" /></td>
        </tr>
    </c:forEach>
 </table>
</body>
</html>
