<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
        dim conexion
        dim notificacion
        set conexion=Server.CreateObject("ADODB.Connection")
        set notificacion = Server.CreateObject("ADODB.RecordSet")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <%
        conexion.Open
        notificacion.open "select * from Ve_Notificacion",conexion
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
        <h1>Notificaciones</h1>
        <%
        if not notificacion.eof then
        %>
        <table Class="tabla">
            <tr>
                <th>Código Univoco</th>
                <th>Area</th>
                <th>Tipo Movimiento</th>
                <th>Etapa</th>
                <th>Rol</th>
                <th>CUIT del Demandado</th>
            </tr>
            <%
            do while not notificacion.eof
            %>
            <tr>
                <th><%response.write(notificacion("VeNotificacion_Univoco"))%></th>
                <th><%response.write(notificacion("VeNotificacion_Area"))%></th>
                <th><%response.write(notificacion("VeNotificacion_TipoMovimiento"))%></th>
                <th><%response.write(notificacion("VeNotificacion_Etapa"))%></th>
                <th><%response.write(notificacion("VeNotificacion_Rol"))%></th>
                <th><%response.write(notificacion("VeNotificacion_CuitDemandado"))%></th>
            </tr>
            <%
            area.movenext
            loop
            %>
        </table>
        <%
        else
        %>
        <h3>Aún no hay ninguna Notificación</h3>
        <%
        end if
        conexion.close
        %>
        <form action="./Agregar/CrearNotificacion.asp" method="post">
            <input type="text" name="area_Codigo" value="1" hidden>
            <input type="text" name="tipoMov_Codigo" value="1" hidden>
            <input type="text" name="etapa_Codigo" value="1" hidden>
            <input type="text" name="estado_Codigo" value="1" hidden>
            <input type="text" name="rol_Codigo" value="1" hidden>
            <input type="submit" value="Agregar" title="Agregue una nueva Área" class="btn-agregar">
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>