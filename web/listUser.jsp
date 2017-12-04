<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="users" scope="request" type="java.util.ArrayList<co.edu.polijic.domain.User>"/>

<html>
<head>
    <title>List users</title>
</head>
<body>
<table border=1>
    <thead>
    <tr>
        <th>User Id</th>
        <th>Nombre</th>
        <th>Correo</th>
        <th>País</th>
        <th>Genero</th>
        <th colspan=2>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${users}" var="u">
        <tr>
            <td>${u.id}</td>
            <td>${u.name}</td>
            <td>${u.email}</td>
            <td>${u.country}</td>
            <td>${u.sex}</td>
            <td><a href="UserController?action=edit&userId=${u.id}">Update</a></td>
            <td><a href="UserController?action=delete&userId=${u.id}">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<p><a href="UserController?action=insert">Add User</a></p>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.slim.min.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
</body>
</html>
