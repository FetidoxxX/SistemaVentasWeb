<%-- 
    Document   : Empleado
    Created on : 26/01/2025, 3:38:26 a. m.
    Author     : User
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
              crossorigin="anonymous">
        <title>Empleado</title>
    </head>
    <body>
        <br/>
        <br/>
        <div class="d-flex">
                <div class="card col-sm-4">
                    <div class="card-body">
                        <form action="Controlador?menu=Empleado" method="POST">
                            <div class="form-group">
                                <label>DNI</label>
                                <input type="text" value="${empleado.getDni()}" name="txtDni" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Nombres</label>
                                <input type="text" value="${empleado.getNom()}" name="txtNombres" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Telefono</label>
                                <input type="text" value="${empleado.getTel()}" name="txtTel" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Estado</label>
                                <select value="${empleado.getEstado()}" name="txtEstado" class="form-control">
                                    <option value="1">Activo</option>
                                    <option value="0">Inactivo</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Usuario</label>
                                <input type="text" value="${empleado.getUser()}" name="txtUser" class="form-control">
                            </div>
                            <div class="text-center">
                                <input type="submit" name="accion" value="Agregar" class="btn btn-primary">
                                <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                            </div>
                        </form>
                    </div>                         
                </div>                
                <div class="card col-sm-8">
                    <div class="card-body">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>DNI</th>
                                    <th>NOMBRES</th>
                                    <th>TELEFONO</th>
                                    <th>ESTADO</th>
                                    <th>USER</th>
                                    <th>ACCIONES</th>
                                </tr>
                            </thead>
                            <tbody> 
                                <c:forEach var="em" items="${empleados}">
                                    <tr>
                                        <td>${em.getId()}</td>
                                        <td>${em.getDni()}</td>
                                        <td>${em.getNom()}</td>
                                        <td>${em.getTel()}</td>
                                        <td>${em.getEstado()}</td>
                                        <td>${em.getUser()}</td>
                                        <td>
                                            <a class="btn btn-warning" href="Controlador?menu=Empleado&accion=Editar&id=${em.getId()}">Editar</a>
                                            <a class="btn btn-danger" href="Controlador?menu=Empleado&accion=Delete&id=${em.getId()}">Eliminar</a>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
        </div>      
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
                crossorigin="anonymous">
        </script>
    </body>
</html>
