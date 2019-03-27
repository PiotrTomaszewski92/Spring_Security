<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Login Form</title>
</head>
<body>
<h2>Custom login page - sign in!</h2>
<hr>
<form:form action="${pageContext.request.contextPath}/authenticateUser"
           method="post">

    <c:if test="${param.error != null}">
        <i>Sorry! You entered invalid username / password</i>
    </c:if>

    <p>User name: <input type="text" name="username" /></p>
    <p>Password: <input type="password" name="password" /></p>
    <input type="submit" value="Login" />
</form:form>
</body>
</html>
