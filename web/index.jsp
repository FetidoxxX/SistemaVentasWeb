<%-- 
    Document   : index
    Created on : 25/01/2025, 9:34:01 p. m.
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <title>Login Page</title>
</head>
<body>
    <div class="container mt-4 col-lg-4">
        <div class="card">
            <div class="card-body">
                <form class="form-sing" action="Validar" method="POST">
                    <div class="form-group text-center mb-4">
                        <h3 class="mb-3">Login</h3>
                        <img src="img/logo.png" alt="Logo" class="img-fluid" style="max-width: 170px;">
                        <p class="text-muted">Bienvenidos al Sistema</p>
                    </div>
                    <div class="form-group mb-3">
                        <label for="txtuser" class="form-label">Usuario:</label>
                        <input type="text" id="txtuser" name="txtuser" class="form-control">
                    </div>
                    <div class="form-group mb-3">
                        <label for="txtpass" class="form-label">Password:</label>
                        <input type="password" id="txtpass" name="txtpass" class="form-control">
                    </div>
                    <button type="submit" name="accion" value="ingresar" class="btn btn-primary w-100">Ingresar</button>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

