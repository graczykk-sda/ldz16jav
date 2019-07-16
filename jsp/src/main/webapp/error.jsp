<%@ page contentType="text/html;charset=UTF-8" language="java"
         isErrorPage="true"
%>
<html>
<head>
    <title>Error Page</title>
</head>
<body>
<h1>Wystąpił błąd</h1>
Rodzaj błędu: <%= exception.getMessage() %> <br/>

<p>Skontaktuj się z administratorem</p>

</body>
</html>
