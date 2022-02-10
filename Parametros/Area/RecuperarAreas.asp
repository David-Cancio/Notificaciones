<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
        dim conexion
        dim area
        set conexion=Server.CreateObject("ADODB.Connection")
        set area = Server.CreateObject("ADODB.RecordSet")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <%
        conexion.Open
        area.open "select * from Area",conexion
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
        <h1>Área</h1>
        <%
        if not area.eof then
        %>
        <table Class="tabla">
            <tr>
                <th>Código</th>
                <th colspan="3">Nombre</th>
                <th>Modificar</th>
                <th>Eliminar</th>
            </tr>
            <%
            do while not area.eof
            %>
            <tr>
                <th><%response.write(area("Area_Codigo"))%></th>
                <th colspan="3"><%response.write(area("Area_Nombre"))%></th>
                <th>
                    <form action="Modificar/GenerarModificarArea.asp" method="post">
                        <input type="text" name="id" value="<%response.write(area("Area_Codigo"))%>" hidden />
                        <input type="submit" value="Modificar" title="Modifique los datos del Área">
                    </form>
                </th>
                <th>
                    <form action="Eliminar/ConfirmarEliminarArea.asp" method="post">
                        <input type="text" name="id" value="<%response.write(area("Area_Codigo"))%>" hidden />
                        <input type="submit" value="Eliminar" title="Elimine esta Área" class="btn-eliminar">
                    </form>
                </th>
            </tr>
            <%
            area.movenext
            loop
            %>
        </table>
        <%
        else
        %>
        <h3>Aún no hay ningún Área</h3>
        <%
        end if
        conexion.close
        %>
        <form action="./Agregar/IngresoNuevoArea.asp" method="post">
            <input type="submit" value="Agregar" title="Agregue una nueva Área" class="btn-agregar">
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>