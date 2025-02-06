<%-- 
    Document   : principal
    Created on : 25/01/2025, 9:40:25 p. m.
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    HttpSession misesion = request.getSession();
    if(misesion.getAttribute("usuario")==null){
    response.sendRedirect("index.jsp");
    }else{
    
    
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- CSS de Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
              crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg" style="background-color: blueviolet;">
            <div class="container-fluid">

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="btn btn-outline-light" style="margin-left: 10px; border: none;" aria-current="page" href="Principal.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-outline-light" style="margin-left: 10px; border: none;" href="Controlador?menu=Producto&accion=Listar" target="myFrame">Producto</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-outline-light" style="margin-left: 10px; border: none;" href="Controlador?menu=Empleado&accion=Listar" target="myFrame">Empleado</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-outline-light" style="margin-left: 10px; border: none;" href="Controlador?menu=Cliente&accion=Listar" target="myFrame">Clientes</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-outline-light" style="margin-left: 10px; border: none;" href="Controlador?menu=NuevaVenta&accion=default"  target="myFrame">Nueva Venta</a>
                        </li>
                    </ul>
                </div>
                <div class="dropdown text-center">
                    <button class="btn btn-outline-light dropdown-toggle text-center" style="border: none" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                        ${usuario.getNom()}
                    </button>
                    <ul class="dropdown-menu text-center" aria-labelledby="dropdownMenuButton1">
                        <li>
                            <a class="dropdown-item text-center" href="#">
                                <img src="img/user.webp" alt="User" width="60">
                            </a>
                        </li>
                        <li><a class="dropdown-item text-center" href="#">${usuario.getUser()}</a></li>
                        <li><a class="dropdown-item text-center" href="#">${usuario.getNom()}@gmail.com</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><form action="Validar" method="POST"><button name="accion" value="Salir" class="dropdown-item text-center" href="#">Salir</button>
                            </form></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="m-4" style="height: 550px;">
            <iframe name="myFrame" id="myFrame" style="height: 100%; width: 100%"></iframe>
        </div>                
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
    </body>
</html>
<% } %>
