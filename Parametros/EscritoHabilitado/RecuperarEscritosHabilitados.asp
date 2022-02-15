<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
        dim conexion
        dim escritosHb
        set conexion=Server.CreateObject("ADODB.Connection")
        set escritosHb = Server.CreateObject("ADODB.RecordSet")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <%
        conexion.Open
        escritosHb.open "select * from Prm_EscritosHabilitados",conexion
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
        <h1>Escritos Habilitados</h1>
        <%
        if not escritosHb.eof then
        %>
        <table Class="tabla">
            <tr>
                <th>Código</th>
                <th>Area</th>
                <th>Etapa</th>
                <th>Estado</th>
                <th>Tipo de Movimiento</th>
                <th>Rol</th>
                <th>Tipo de Escrito</th>
                <th>Firmas Obligatorias</th>
                <th></th>
                <th></th>
            </tr>
            <%
            do while not escritosHb.eof
            %>
            <tr>
                <th><%response.write(escritosHb("Prm_EscritoHB_Codigo"))%></th>
                <th><%response.write(escritosHb("Prm_EscritoHB_Area"))%></th>
                <th><%response.write(escritosHb("Prm_EscritoHB_Etapa"))%></th>
                <th><%response.write(escritosHb("Prm_EscritoHB_Estado"))%></th>
                <th><%response.write(escritosHb("Prm_EscritoHB_TipoMov"))%></th>
                <th><%response.write(escritosHb("Prm_EscritoHB_Rol"))%></th>
                <th><%response.write(escritosHb("Prm_EscritoHB_ModeloEscrito"))%></th>
                <th>
                    <% 
                    if escritosHb("Prm_EscritoHB_Obligatorio")=0 then
                        response.write("No")
                    else
                        response.write("Si")
                    end if
                    %>
                </th>
                <th>
                    <form action="Modificar/GenerarModificarArea.asp" method="post">
                        <input type="text" name="id" value="<%response.write(escritosHb("Prm_EscritoHB_Codigo"))%>" hidden />
                        <input type="submit" value="Modificar" title="Modifique los datos del Escrito Habilitado">
                    </form>
                </th>
                <th>
                    <form action="Eliminar/ConfirmarEliminarArea.asp" method="post">
                        <input type="text" name="id" value="<%response.write(escritosHb("Prm_EscritoHB_Codigo"))%>" hidden />
                        <input type="submit" value="Eliminar" title="Elimine el Escrito Habilitado" class="btn-eliminar">
                    </form>
                </th>
            </tr>
            <%
            escritosHb.movenext
            loop
            %>
        </table>
        <%
        else
        %>
        <h3>Aún no hay ningún Escrito Habilitado</h3>
        <%
        end if
        conexion.close
        %>
        <form action="./Agregar/IngresoNuevoEscritoHabilitado.asp" method="post">
            <input type="submit" value="Agregar" title="Agregue una nueva Notificación" class="btn-agregar">
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>