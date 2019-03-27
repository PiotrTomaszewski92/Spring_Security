<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Company Home Page</title>
</head>
<body>
<h2>Company Home Page - HELLO!</h2>
<hr>
<p>Welcome <security:authentication property="principal.username"/> in company webpage.</p>
<p>Role: <security:authentication property="principal.authorities"/></p>

<hr>
<security:authorize access="hasRole('MANAGER')" >
    <p><a href="${pageContext.request.contextPath}/leaders" >LeaderShip Meeting</a>(only for manager)</p>
</security:authorize>
<security:authorize access="hasRole('ADMIN')">
    <p><a href="${pageContext.request.contextPath}/systems" >IT System Meeting</a>(only for admin)</p>
</security:authorize>


<hr>
<form:form action="${pageContext.request.contextPath}/logout" method="post">
    <input type="submit" value="Logout"/>
</form:form>

</body>
</html>

