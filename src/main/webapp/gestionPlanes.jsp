<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.dwintegrado.gym.Model.PlanModel" %>
<html>
<head>
    <title>Gestión de Planes</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f9f9f9; margin: 0; padding: 0; }
        header { background-color: #007bff; color: #fff; padding: 15px; text-align: center; }
        h2 { margin: 0; }
        .container { display: flex; flex-wrap: wrap; justify-content: center; padding: 20px; gap: 20px; }
        .card { background: #fff; border-radius: 10px; padding: 20px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); flex: 1 1 350px; min-width: 300px; }
        input, select, textarea, button { width: 100%; padding: 8px; margin: 6px 0 12px; border-radius: 6px; border: 1px solid #ccc; box-sizing: border-box; }
        button { background-color: #28a745; color: #fff; border: none; cursor: pointer; font-weight: bold; }
        button:hover { background-color: #218838; }
        table { width: 100%; border-collapse: collapse; min-width: 500px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: center; }
        th { background-color: #007bff; color: white; }
        a { color: #007bff; text-decoration: none; }
        a:hover { text-decoration: underline; }
        @media(max-width: 768px) { .container { flex-direction: column; align-items: center; } table { font-size: 14px; } }
    </style>
</head>
<body>
<header>
    <h2>Gestión de Planes</h2>
</header>

<div class="container">

    <!-- Formulario Crear/Editar Plan -->
    <div class="card">
        <form action="PlanGestionServlet" method="post">
            <input type="hidden" name="accion" value="guardar">
            <input type="hidden" name="idPlan" value="<%= (request.getAttribute("plan") != null ? ((PlanModel)request.getAttribute("plan")).getId_plan() : "") %>">

            <label>Nombre:</label>
            <input type="text" name="nombre" value="<%= (request.getAttribute("plan") != null ? ((PlanModel)request.getAttribute("plan")).getNombre() : "") %>" required>

            <label>Descripción:</label>
            <textarea name="descripcion" required><%= (request.getAttribute("plan") != null ? ((PlanModel)request.getAttribute("plan")).getDescripcion() : "") %></textarea>

            <label>Duración (días):</label>
            <input type="number" name="duracion_dias" value="<%= (request.getAttribute("plan") != null ? ((PlanModel)request.getAttribute("plan")).getDuracion_dias() : "") %>" required>

            <label>Precio:</label>
            <input type="number" step="0.01" name="precio" value="<%= (request.getAttribute("plan") != null ? ((PlanModel)request.getAttribute("plan")).getPrecio() : "") %>" required>

            <label>Tipo:</label>
            <select name="tipo" required>
                <%
                    String tipo = "";
                    if(request.getAttribute("plan") != null) tipo = ((PlanModel)request.getAttribute("plan")).getTipo();
                %>
                <option value="Básico" <%= "Básico".equals(tipo) ? "selected" : "" %>>Básico</option>
                <option value="Premium" <%= "Premium".equals(tipo) ? "selected" : "" %>>Premium</option>
                <option value="VIP" <%= "VIP".equals(tipo) ? "selected" : "" %>>VIP</option>
            </select>

            <label>Estado:</label>
            <select name="estado" required>
                <%
                    String estado = "";
                    if(request.getAttribute("plan") != null) estado = ((PlanModel)request.getAttribute("plan")).getEstado();
                %>
                <option value="Activo" <%= "Activo".equals(estado) ? "selected" : "" %>>Activo</option>
                <option value="Inactivo" <%= "Inactivo".equals(estado) ? "selected" : "" %>>Inactivo</option>
            </select>

            <button type="submit"><%= (request.getAttribute("plan") != null && ((PlanModel)request.getAttribute("plan")).getId_plan() != 0) ? "Actualizar" : "Guardar" %> Plan</button>
        </form>
    </div>

    <!-- Tabla de Planes -->
    <div class="card">
        <table>
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
                    if(planes != null && !planes.isEmpty()) {
                        for(PlanModel p : planes) {
                %>
                <tr>
                    <td><%= p.getId_plan() %></td>
                    <td><%= p.getNombre() %></td>
                    <td><%= p.getDescripcion() %></td>
                    <td><%= p.getDuracion_dias() %></td>
                    <td><%= p.getPrecio() %></td>
                    <td><%= p.getTipo() %></td>
                    <td><%= p.getEstado() %></td>
                    <td>
                        <a href="PlanGestionServlet?accion=editar&id=<%= p.getId_plan() %>">Editar</a> |
                        <a href="PlanGestionServlet?accion=eliminar&id=<%= p.getId_plan() %>" onclick="return confirm('¿Seguro que deseas eliminar este plan?');">Eliminar</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="8">No hay planes registrados</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

</div>
</body>
</html>
