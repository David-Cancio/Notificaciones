<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
        dim conexion
        dim prm_error
        set conexion=Server.CreateObject("ADODB.Connection")
        set prm_error = Server.CreateObject("ADODB.RecordSet")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <%
        conexion.Open
        prm_error.open "select * from Prm_Error",conexion
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
        <h1>Tipos de Errores</h1>
        <%
        if not prm_error.eof then
        %>
        <table Class="registro">
            <tr>
                <th>Error</th>
                <th colspan="2">Nombre</th>
                <th colspan="3">Descripción</th>
                <th></th>
                <th></th>
            </tr>
            <%
            do while not prm_error.eof
            %>
            <tr>
                <th><%response.write(prm_error("Prm_Error_Codigo"))%></th>
                <th colspan="2"><%response.write(prm_error("Prm_Error_Nombre"))%></th>
                <th colspan="3"><%response.write(prm_error("Prm_Error_Descripcion"))%></th>
                <th>
                    <form action="Modificar/GenerarModificarError.asp" method="post">
                        <input type="text" name="id" value="<%response.write(prm_error("Prm_Error_Codigo"))%>" hidden />
                        <input type="submit" value="Modificar" title="Modifique los datos de este Tipo de Error">
                    </form>
                </th>
                <th>
                    <form action="Eliminar/ConfirmarEliminarError.asp" method="post">
                        <input type="text" name="id" value="<%response.write(prm_error("Prm_Error_Codigo"))%>" hidden />
                        <input type="submit" value="Eliminar" title="Elimine este Tipo de Error" class="btn-eliminar">
                    </form>
                </th>
            </tr>
            <%
            prm_error.movenext
            loop
            %>
        </table>
        <%
        else
        %>
        <h3>Aún no hay ningún Tipo de Error</h3>
        <%
        end if
        conexion.close
        %>
        <form action="./Agregar/IngresoNuevoError.asp" method="post">
            <input type="submit" value="Agregar" title="Agregue un nuevo Error" class="btn-agregar">
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>