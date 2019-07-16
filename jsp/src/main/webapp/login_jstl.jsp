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
    <c:when test="${param.wyloguj.equalsIgnoreCase('true')}">
        <% session.invalidate(); %>
    </c:when>
    <c:when test="${param.submit.equalsIgnoreCase('login')}">
        <c:set var="username" value="${param.user}"/>
        <c:set var="pass" value="${param.password}"/>
        <c:choose>
            <c:when test="${username.equalsIgnoreCase('admin') && pass.equalsIgnoreCase('admin')}">
                <c:set var="loggedUser" value="${username}" scope="session"/>
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
            <c:when test="${sessionScope.get('loggedUser') != null}">
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
