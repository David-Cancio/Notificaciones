<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
        dim conexion
        dim estado
        set conexion=Server.CreateObject("ADODB.Connection")
        set estado = Server.CreateObject("ADODB.RecordSet")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <%
        conexion.Open
        estado.open "select * from Estado",conexion
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
        <h1>Estado</h1>
        <%
        if not estado.eof then
        %>
        <table Class="tabla">
            <tr>
                <th>Código</th>
                <th colspan="3">Nombre</th>
                <th>Modificar</th>
                <th>Eliminar</th>
            </tr>
            <%
            do while not estado.eof
            %>
            <tr>
                <th><%response.write(estado("Estado_Codigo"))%></th>
                <th colspan="3"><%response.write(estado("Estado_Nombre"))%></th>
                <th>
                    <form action="Modificar/GenerarModificarEstado.asp" method="post">
                        <input type="text" name="id" value="<%response.write(estado("Estado_Codigo"))%>" hidden />
                        <input type="submit" value="Modificar" title="Modifique los datos del Estado">
                    </form>
                </th>
                <th>
                    <form action="Eliminar/ConfirmarEliminarEstado.asp" method="post">
                        <input type="text" name="id" value="<%response.write(estado("Estado_Codigo"))%>" hidden />
                        <input type="submit" value="Eliminar" title="Elimine este Estado" class="btn-eliminar">
                    </form>
                </th>
            </tr>
            <%
            estado.movenext
            loop
            %>
        </table>
        <%
        else
        %>
        <h3>Aún no hay ningún Estado</h3>
        <%
        end if
        conexion.close
        %>
        <form action="./Agregar/IngresoNuevoEstado.asp" method="post">
            <input type="submit" value="Agregar" title="Agregue una nuevo Estado" class="btn-agregar">
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>