<%-- 
    Document   : Producto
    Created on : 26/01/2025, 3:38:12 a. m.
    Author     : User
--%>
<%-- 
    Document   : Producto
    Created on : 26/01/2025, 3:38:12 a. m.
    Author     : User
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <link rel="stylesheet" href="stylesP.css">
    <title>Gestión de Productos</title>
</head>
<body>
    <div class="container-fluid">
        <div class="content-wrapper">
            <div class="col-sm-4">
                <div class="card">
                    <div class="card-body">
                        <form action="Controlador?menu=Producto" method="POST">
                            <div class="form-group">
                                <label>Producto</label>
                                <input type="text" value="${producto.getNom()}" name="txtDni" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Precio</label>
                                <input type="text" value="${producto.getPre()}" name="txtNombres" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Stock</label>
                                <input type="text" value="${producto.getStock()}" name="txtTel" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Estado</label>
                                <select value="${producto.getEstado()}" name="txtEstado" class="form-control">
                                    <option value="1">Activo</option>
                                    <option value="0">Inactivo</option>
                                </select>
                            </div>                    
                            <div class="form-group">
                                <input type="submit" name="accion" value="Agregar" class="btn btn-primary">
                                <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                            </div>
                        </form>
                    </div>                         
                </div>
            </div>                     
            <div class="col-sm-8">
                <div class="card">
                    <div class="card-body">
                        <div class="table-container">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombres</th>
                                        <th>Precio</th>
                                        <th>Stock</th>                                    
                                        <th>ESTADO</th>                                    
                                        <th>ACCIONES</th>
                                    </tr>
                                </thead>
                                <tbody> 
                                    <c:forEach var="em" items="${productos}">
                                        <tr>
                                            <td>${em.getId()}</td>                                      
                                            <td>${em.getNom()}</td>
                                            <td>${em.getPre()}</td>
                                            <td>${em.getStock()}</td>
                                            <td>${em.getEstado()}</td>                                        
                                            <td>
                                                <a class="btn btn-warning" href="Controlador?menu=Producto&accion=Editar&id=${em.getId()}">Editar</a>
                                                <a class="btn btn-danger" href="Controlador?menu=Producto&accion=Delete&id=${em.getId()}">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<% } %>