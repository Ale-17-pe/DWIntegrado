<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.dwintegrado.gym.Model.PlanModel" %>

<!DOCTYPE html>
<html>
<head>
    <title>Planes - ARES FITNESS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="Recursos/Css/plan.css">
    <link href="css/style.css" rel="stylesheet">
</head>
<body class="container mt-5">

    <h1 class="text-center mb-4">Planes Disponibles</h1>

    <!-- Formulario para registrar -->
    <div class="card bg-dark p-4 mb-5">
        <h2>Registrar Plan</h2>
        <form action="PlanServlet" method="post">
            <div class="mb-3">
                <label>Nombre:</label>
                <input type="text" name="nombre" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Descripción:</label>
                <textarea name="descripcion" class="form-control"></textarea>
            </div>
            <div class="mb-3">
                <label>Duración (días):</label>
                <input type="number" name="duracion_dias" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Precio:</label>
                <input type="number" step="0.01" name="precio" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Tipo:</label>
                <select name="tipo" class="form-select">
                    <option value="regular">Regular</option>
                    <option value="premium">Premium</option>
                    <option value="vip">VIP</option>
                    <option value="promocional">Promocional</option>
                </select>
            </div>
            <div class="mb-3">
                <label>Estado:</label>
                <select name="estado" class="form-select">
                    <option value="activo">Activo</option>
                    <option value="inactivo">Inactivo</option>
                </select>
            </div>
            <button type="submit" class="btn btn-custom">Guardar</button>
        </form>
    </div>

    <!-- Tabla de planes -->
    <h2>Listado de Planes</h2>
    <table class="table table-bordered table-hover text-center">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Duración</th>
            <th>Precio</th>
            <th>Tipo</th>
            <th>Estado</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<PlanModel> planes = (List<PlanModel>) request.getAttribute("planes");
            if (planes != null) {
                for (PlanModel p : planes) {
        %>
        <tr>
            <td><%= p.getId_plan() %></td>
            <td><%= p.getNombre() %></td>
            <td><%= p.getDescripcion() %></td>
            <td><%= p.getDuration_dias() %></td>
            <td>$<%= p.getPrecio() %></td>
            <td><%= p.getTipo() %></td>
            <td><%= p.getEstado() %></td>
            <td>
                <a href="PlanServlet?accion=eliminar&id=<%= p.getId_plan() %>" class="btn btn-danger btn-sm">Eliminar</a>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>

</body>
</html>
