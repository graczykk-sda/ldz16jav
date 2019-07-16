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

<jsp:useBean id="user" class="pl.sdacademy.jsp.beans.User"/>

<c:choose>
    <c:when test="${param.wyloguj.equalsIgnoreCase('true')}">
        <% session.invalidate(); %>
    </c:when>
    <c:when test="true">
        ${sessionScope.get('loggedUser')}
    </c:when>
    <c:when test="${param.submit.equalsIgnoreCase('login')}">
        <c:choose>
            <c:when test="${param.user.equalsIgnoreCase('admin') && param.password.equalsIgnoreCase('admin')}">
                <c:set var="user.name" value="imię" />
                <c:set var="loggedUser" value="admin" scope="session" />
                Zalogowano poprawnie.
                <a href="login.jsp?wyloguj=true">wyloguj</a>
            </c:when>
            <c:otherwise>
                Niepoprawne dane logowanie, spróbuj jeszcze raz
            </c:otherwise>
        </c:choose>
    </c:when>

</c:choose>

<%--<%--%>
<%--    String logout = request.getParameter("wyloguj");--%>
<%--    if (logout != null && logout.equalsIgnoreCase("true")) {--%>
<%--        session.invalidate();--%>
<%--    } else {--%>
<%--        Object loggedUser = session.getAttribute("loggedUser");--%>
<%--        if (loggedUser != null) {--%>
<%--            out.print("Użytkownik jest już zalogowany.");--%>
<%--%>--%>
<%--<a href="login.jsp?wyloguj=true">wyloguj</a>--%>
<%--<%--%>
<%--            return;--%>
<%--        }--%>
<%--    }--%>

<%--    String submit = request.getParameter("submit");--%>
<%--    if (submit != null && !submit.isEmpty()) {--%>
<%--        String user = request.getParameter("user");--%>
<%--        String password = request.getParameter("password");--%>
<%--        if (user.isEmpty()) {--%>
<%--            throw new RuntimeException("user is empty");--%>
<%--        }--%>
<%--        if (user.equalsIgnoreCase("admin") && password.equalsIgnoreCase("admin")) {--%>
<%--            out.print("Zalogowano poprawnie");--%>
<%--            session.setAttribute("loggedUser", "admin");--%>
<%--%>--%>
<%--<a href="login.jsp?wyloguj=true">wyloguj</a>--%>
<%--<%--%>
<%--            return;--%>
<%--        } else {--%>
<%--            out.print("Niepoprawne dane logowanie, spróbuj jeszcze raz.");--%>
<%--        }--%>
<%--    }--%>
<%--%>--%>


<h1>Login Page</h1>
<form method="get">
    <div>
        <label>user</label>
        <input type="text" name="user"/>
    </div>
    <div>
        <label>password</label>
        <input type="password" name="password">
    </div>
    <div>
        <label></label>
        <input name="submit" type="submit" value="login">
    </div>
</form>
</body>
</html>
