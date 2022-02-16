<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
        dim conexion
        dim rol
        set conexion=Server.CreateObject("ADODB.Connection")
        set rol = Server.CreateObject("ADODB.RecordSet")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <%
        conexion.Open
        rol.open "select * from Prm_Rol WHERE Prm_Rol_Vigencia = 1",conexion
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
        <h1>Roles</h1>
        <%
        if not rol.eof then
        %>
        <table Class="tabla">
            <tr>
                <th>Código</th>
                <th colspan="3">Nombre</th>
                <th>Modificar</th>
                <th>Eliminar</th>
            </tr>
            <%
            do while not rol.eof
            %>
            <tr>
                <th><%response.write(rol("Prm_Rol_Codigo"))%></th>
                <th colspan="3"><%response.write(rol("Prm_Rol_Nombre"))%></th>
                <th>
                    <form action="Modificar/GenerarModificarRol.asp" method="post">
                        <input type="text" name="id" value="<%response.write(rol("Prm_Rol_Codigo"))%>" hidden />
                        <input type="submit" value="Modificar" title="Modifique los datos del Rol">
                    </form>
                </th>
                <th>
                    <form action="Eliminar/ConfirmarEliminarRol.asp" method="post">
                        <input type="text" name="id" value="<%response.write(rol("Prm_Rol_Codigo"))%>" hidden />
                        <input type="submit" value="Eliminar" title="Elimine este Rol" class="btn-eliminar">
                    </form>
                </th>
            </tr>
            <%
            rol.movenext
            loop
            %>
        </table>
        <%
        else
        %>
        <h3>Aún no hay ningún Rol</h3>
        <%
        end if
        conexion.close
        %>
        <form action="./Agregar/IngresoNuevoRol.asp" method="post">
            <input type="submit" value="Agregar" title="Agregue un nuevo Rol" class="btn-agregar">
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>