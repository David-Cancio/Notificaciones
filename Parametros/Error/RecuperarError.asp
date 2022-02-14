<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
        dim conexion
        dim error
        set conexion=Server.CreateObject("ADODB.Connection")
        set error = Server.CreateObject("ADODB.RecordSet")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <%
        conexion.Open
        error.open "select * from Error",conexion
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
        <h1>Tipos de Errores</h1>
        <%
        if not error.eof then
        %>
        <table Class="tabla">
            <tr>
                <th>Error</th>
                <th colspan="2">Nombre</th>
                <th colspan="3">Descripción</th>
                <th></th>
                <th></th>
            </tr>
            <%
            do while not error.eof
            %>
            <tr>
                <th><%response.write(error("Error_Codigo"))%></th>
                <th colspan="2"><%response.write(tipoEscrito("Error_Nombre"))%></th>
                <th colspan="3"><%response.write(tipoEscrito("Error_Descripcion"))%></th>
                <th>
                    <form action="Modificar/GenerarModificarTipoEscrito.asp" method="post">
                        <input type="text" name="id" value="<%response.write(tipoEscrito("TipoEscrito_Codigo"))%>" hidden />
                        <input type="submit" value="Modificar" title="Modifique los datos de este Tipo de Escrito">
                    </form>
                </th>
                <th>
                    <form action="Eliminar/ConfirmarEliminarTipoEscrito.asp" method="post">
                        <input type="text" name="id" value="<%response.write(tipoEscrito("TipoEscrito_Codigo"))%>" hidden />
                        <input type="submit" value="Eliminar" title="Elimine este Tipo de Escrito" class="btn-eliminar">
                    </form>
                </th>
            </tr>
            <%
            error.movenext
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