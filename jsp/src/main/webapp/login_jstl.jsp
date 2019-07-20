<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         errorPage="error.jsp"
         isELIgnored="false"
%>
<html>
<head>
    <title>Login JSP</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<c:choose>
    <c:when test="${param.wyloguj == 'true'}">
        <% session.invalidate(); %>
    </c:when>
    <c:when test="${param.submit == 'login'}">
        <c:choose>
            <c:when test="${param.user == 'admin' && param.password == 'admin'}">
                <c:set var="loggedUser" value="${param.user}" scope="session"/>
                Zalogowano poprawnie.
                <a href="login.jsp?wyloguj=true">wyloguj</a>
            </c:when>
            <c:otherwise>
                Niepoprawne dane logowanie, spróbuj jeszcze raz
                <c:import url="login_template.jsp"/>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:otherwise>
        <c:choose>
            <c:when test="${sessionScope.loggedUser == 'admin'}">
                Użytkownik jest już zalogowany. <br/>
                <a href="login.jsp?wyloguj=true">wyloguj</a>
            </c:when>
            <c:otherwise>
                <c:import url="login_template.jsp"/>
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>

</body>
</html>
