<%-- 
    Document   : RegistrarVenta
    Created on : 25/01/2025, 9:34:01 p. m.
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    HttpSession misesion = request.getSession();
    if (misesion.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
    } else {
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Registrar Venta</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" crossorigin="anonymous">
           <link rel="stylesheet" href="stylesV.css">

    </head>
    <body>
        <div class="container">
            <div class="row">
                <!-- Sección de Registro de Venta -->
                <div class="col-md-5">
                    <div class="card p-3">
                        <form id="generarVenta" action="Controlador?menu=NuevaVenta" method="POST">
                            <h5 class="mb-3">Datos del Cliente</h5>
                            <div class="row mb-2">
                                <div class="col-md-8">
                                    <input type="text" id="dniCliente" name="codigocliente" 
                                           value="${c.getDni()}" class="form-control" placeholder="Código">
                                </div>
                                <div class="col-md-4">
                                    <button type="submit" name="accion" value="BuscarCliente" class="btn btn-outline-info w-100">Buscar</button>
                                </div>
                            </div>
                            <input type="text" id="nombreDelCliente" name="nombrescliente" 
                                   value="${c.getNom()}" class="form-control mb-3" placeholder="Datos Cliente">

                            <h5 class="mb-3">Datos del Producto</h5>
                            <div class="row mb-2">
                                <div class="col-md-8">
                                    <input type="text" name="codigoproducto" value="${producto.getId()}" 
                                           class="form-control" placeholder="Código">
                                </div>
                                <div class="col-md-4">
                                    <button type="submit" name="accion" value="BuscarProducto" class="btn btn-outline-info w-100">Buscar</button>
                                </div>
                            </div>
                            <input type="text" name="nomproducto" value="${producto.getNom()}" 
                                   class="form-control mb-2" placeholder="Datos Producto">

                            <div class="row mb-2">
                                <div class="col-md-4">
                                    <input type="text" name="precio" value="${producto.getPre()}" class="form-control" placeholder="$/.0.00">
                                </div>
                                <div class="col-md-4">
                                    <input type="number" name="cant" value="1" class="form-control">
                                </div>
                                <div class="col-md-4">
                                    <input type="text" name="stock" value="${producto.getStock()}" class="form-control" placeholder="Stock">
                                </div>
                            </div>

                            <input type="submit" name="accion" value="Agregar" class="btn btn-outline-primary w-100">
                        </form>
                    </div>
                </div>

                <!-- Sección de Factura -->
                <div class="col-md-7">
                    <div class="factura">
                        <h2>Factura de Venta</h2>
                        <h4>Nro. Serie: <span>${nserie}</span></h4>
                        <hr>
                        <p><strong>Cliente:</strong> ${c.getNom()}</p>
                        <p><strong>DNI:</strong> ${c.getDni()}</p>
                        <hr>
                        <table class="table table-bordered text-center">
                            <thead class="table-dark">
                                <tr>
                                    <th>N°</th>
                                    <th>ID</th>
                                    <th>Producto</th>
                                    <th>Precio</th>
                                    <th>Cantidad</th>
                                    <th>Subtotal</th>
                                    <th class="accion">ACCION</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="list" items="${lista}">

                                    <tr>
                                        <td>${list.getItem()}</td>
                                        <td>${list.getIdproducto()}</td>
                                        <td>${list.getDescripcionP()}</td>
                                        <td>${list.getPrecio()}</td>
                                        <td>
                                            <button class="btn btn-sm btn-danger" onclick="cambiarCantidad(this, -1)">−</button>
                                            <input type="number" class="cantidad" value="${list.getCantidad()}" min="1" data-precio="${list.getPrecio()}" oninput="updateSubtotal(this)">
                                            <button class="btn btn-sm btn-success" onclick="cambiarCantidad(this, 1)">+</button>
                                        </td>
                                        <td class="subtotal">${list.getSubtotal()}</td>
                                        <td>
                                            <a href="Controlador?menu=NuevaVenta&accion=delete&idp=${list.getIdproducto()}" class="btn btn-danger" style="margin-left: 5px">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                         <h4 class="total">Total a Pagar: S/.<span id="total">${totalpagar}</span></h4>
                    </div>
                </div>
            </div>
            <!-- Botones de acción -->
            <div class="row mt-3">
                <div class="col-md-6">
                    <a href="Controlador?menu=NuevaVenta&accion=GenerarVenta" onclick="window.print()" class="btn btn-success w-100">Generar Venta</a>
                </div>
                <div class="col-md-6">
                    <a href="Controlador?menu=NuevaVenta&accion=Cancelar" class="btn btn-danger w-100">Cancelar</a>
                </div>
            </div>
        </div>
    </body>
    <footer class="footer">
    <p>&copy; 2025 VentaUD. Todos los derechos reservados.</p>
</footer>

    <script>
    function cambiarCantidad(button, change) {
        let input = button.parentElement.querySelector(".cantidad");
        let newValue = parseInt(input.value) + change;
        if (newValue >= 1) {
            input.value = newValue;
            updateSubtotal(input);
        }
    }

    function actualizarSubtotal(input) {
        let precio = parseFloat(input.dataset.precio);
        let cantidad = parseInt(input.value);
        let subtotal = precio * cantidad;
        let row = input.closest("tr");
        row.querySelector(".subtotal").innerText = subtotal.toFixed(2);
        updateTotal();
    }

    function actualizarTotal() {
        let total = 0;
        document.querySelectorAll(".subtotal").forEach(cell => {
            total += parseFloat(cell.innerText);
        });
        document.getElementById("total").innerText = total.toFixed(2);
    }
</script>
</html>
<% } %>
