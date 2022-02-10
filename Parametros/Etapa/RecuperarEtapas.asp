<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
        dim conexion
        dim etapa
        set conexion=Server.CreateObject("ADODB.Connection")
        set etapa = Server.CreateObject("ADODB.RecordSet")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <%
        conexion.Open
        etapa.open "select * from Etapa",conexion
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
        <h1>Etapa</h1>
        <%
        if not etapa.eof then
        %>
        <table Class="tabla">
            <tr>
                <th>Código</th>
                <th colspan="3">Nombre</th>
                <th>Modificar</th>
                <th>Eliminar</th>
            </tr>
            <%
            do while not etapa.eof
            %>
            <tr>
                <th><%response.write(etapa("Etapa_Codigo"))%></th>
                <th colspan="3"><%response.write(etapa("Etapa_Nombre"))%></th>
                <th>
                    <form action="Modificar/GenerarModificarEtapa.asp" method="post">
                        <input type="text" name="id" value="<%response.write(etapa("Etapa_Codigo"))%>" hidden />
                        <input type="submit" value="Modificar" title="Modifique los datos de la Etapa">
                    </form>
                </th>
                <th>
                    <form action="Eliminar/ConfirmarEliminarEtapa.asp" method="post">
                        <input type="text" name="id" value="<%response.write(etapa("Etapa_Codigo"))%>" hidden />
                        <input type="submit" value="Eliminar" title="Elimine esta Etapa" class="btn-eliminar">
                    </form>
                </th>
            </tr>
            <%
            etapa.movenext
            loop
            %>
        </table>
        <%
        else
        %>
        <h3>Aún no hay ninguna Etapa</h3>
        <%
        end if
        conexion.close
        %>
        <form action="./Agregar/IngresoNuevoEtapa.asp" method="post">
            <input type="submit" value="Agregar" title="Agregue una nueva Etapa" class="btn-agregar">
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>