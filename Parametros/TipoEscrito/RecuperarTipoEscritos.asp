<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
        dim conexion
        dim tipoEscrito
        set conexion=Server.CreateObject("ADODB.Connection")
        set tipoEscrito = Server.CreateObject("ADODB.RecordSet")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <%
        conexion.Open
        tipoEscrito.open "select * from TipoEscrito",conexion
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
        <h1>Tipos de Escritos</h1>
        <%
        if not tipoEscrito.eof then
        %>
        <table Class="tabla">
            <tr>
                <th>Código</th>
                <th colspan="3">Nombre</th>
                <th colspan="3">Tipo de Archivo</th>
                <th colspan="3">Modelo</th>
                <th colspan="3">Modificar</th>
                <th colspan="3">Eliminar</th>
            </tr>
            <%
            do while not tipoEscrito.eof
            %>
            <tr>
                <th><%response.write(tipoEscrito("TipoEscrito_Codigo"))%></th>
                <th colspan="3"><%response.write(tipoEscrito("TipoEscrito_Nombre"))%></th>
                <th colspan="3"><%response.write(tipoEscrito("TipoEscrito_TipoArchivo"))%></th>
                <th colspan="3"><%response.write(tipoEscrito("TipoEscrito_Modelo"))%></th>
                <th colspan="3">
                    <form action="Modificar/GenerarModificarTipoEscrito.asp" method="post">
                        <input type="text" name="id" value="<%response.write(tipoEscrito("TipoEscrito_Codigo"))%>" hidden />
                        <input type="submit" value="Modificar" title="Modifique los datos de este Tipo de Escrito">
                    </form>
                </th>
                <th colspan="3">
                    <form action="Eliminar/ConfirmarEliminarTipoEscrito.asp" method="post">
                        <input type="text" name="id" value="<%response.write(tipoEscrito("TipoEscrito_Codigo"))%>" hidden />
                        <input type="submit" value="Eliminar" title="Elimine este Tipo de Escrito" class="btn-eliminar">
                    </form>
                </th>
            </tr>
            <%
            tipoEscrito.movenext
            loop
            %>
        </table>
        <%
        else
        %>
        <h3>Aún no hay ningún Tipo de Escrito</h3>
        <%
        end if
        conexion.close
        %>
        <form action="./Agregar/IngresoNuevoTipoEscrito.asp" method="post">
            <input type="submit" value="Agregar" title="Agregue un nuevo Tipo de Escrito" class="btn-agregar">
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>