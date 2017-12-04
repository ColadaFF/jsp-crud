<%@ page import="co.edu.polijic.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User</title>
</head>
<% User user = (User) request.getAttribute("user"); %>
<body>

<form method="post" action="UserController" name="frmAddUser">
    <div class="form-group">
        <label for="nameField">Nombre completo</label>
        <input type="text" class="form-control" id="nameField"
               placeholder="Nombre Completo"
               name="name"
               value="${user.getName()}"
        >
    </div>
    <div class="form-group">
        <label for="emailField">Correo electrónico</label>
        <input type="email" class="form-control" id="emailField" placeholder="Correo Electronico"
               name="email"
               value="${user.getEmail()}">
    </div>
    <div class="form-group">
        <label for="countryField">País</label>
        <input type="text" class="form-control" id="countryField" placeholder="Ingrese el país"
               name="country"
               value="${user.getCountry()}">
    </div>
    <div class="form-group">
        <label for="passwordField">Contraseña</label>
        <input type="password" class="form-control" id="passwordField" placeholder="Contraseña..."
               name="password"
               value="${user.getPassword()}"
        >
    </div>
    <div class="form-group">
        <label for="genderInput">Genero</label>
        <select class="form-control" id="genderInput" name="sex">
            <option ${user.getSex() == "m" ? "selected": ""} value="m">Masculino</option>
            <option ${user.getSex() == "m" ? "selected": ""} value="f">Femenino</option>
        </select>
    </div>
    <button type="submit" class="btn btn-primary">Guardar</button>
</form>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.slim.min.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
</body>
</html>
