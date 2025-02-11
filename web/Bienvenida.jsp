<%-- 
    Document   : Bienvenida
    Created on : 10/02/2025, 10:13:49 p. m.
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    HttpSession misesion = request.getSession();
    if (misesion.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
        return; // Evita que continúe ejecutando el código
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" 
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
              integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
              crossorigin="anonymous">
        <link rel="stylesheet" href="stylesB.css"/>
        <title>Bienvenida</title>
    </head>
    <body class="bienvenida-body">
        <div class="bienvenida-container">
            <h1>Selecciona una opción para comenzar.</h1>
        </div>
    </body>
</html>
