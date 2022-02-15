<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
dim conexion
dim ve_Notificacion
set conexion=Server.CreateObject("ADODB.Connection")
set ve_Notificacion = Server.CreateObject("ADODB.RecordSet")
dim area, tipoMovimiento, etapa, estado, rol, tipoEscrito
set area = Server.CreateObject("ADODB.RecordSet")
set tipoMovimiento = Server.CreateObject("ADODB.RecordSet")
set etapa = Server.CreateObject("ADODB.RecordSet")
set estado = Server.CreateObject("ADODB.RecordSet")
set rol = Server.CreateObject("ADODB.RecordSet")
set tipoEscrito = Server.CreateObject("ADODB.RecordSet")

%>
<!--#include virtual="/connectionSQL.asp"-->
<!--#include virtual="/Partials/Validations.asp"-->
<%
conexion.open
dim area_Codigo
area_Codigo=ValidarNull(Request.form("area_Codigo"))
dim tipoMov_Codigo
tipoMov_Codigo=ValidarNull(Request.form("tipoMov_Codigo"))
dim etapa_Codigo
etapa_Codigo=ValidarNull(Request.form("etapa_Codigo"))
dim estado_Codigo
estado_Codigo=ValidarNull(Request.form("estado_Codigo"))
dim rol_Codigo
rol_Codigo=ValidarNull(Request.form("rol_Codigo"))
dim tipoEscrito_Codigo
tipoEscrito_Codigo=ValidarNull(Request.form("tipoEscrito_Codigo"))
area.open "select Area_Nombre from Prm_Area WHERE Area_Codigo = '"&area_Codigo&"'",conexion
tipoMovimiento.open "select TipoMov_Nombre from Prm_TipoMovimiento WHERE TipoMov_Codigo = '"&tipoMov_Codigo&"'",conexion
etapa.open "select Etapa_Nombre from Prm_Etapa WHERE Etapa_Codigo = '"&etapa_Codigo&"'",conexion
estado.open "select Estado_Nombre from Prm_Estado WHERE Estado_Codigo = '"&estado_Codigo&"'",conexion
rol.open "select Rol_Nombre from Prm_Rol WHERE Rol_Codigo = '"&rol_Codigo&"'",conexion
tipoEscrito.open "select TipoEscrito_Nombre from Prm_TipoEscrito WHERE TipoEscrito_Codigo = '"&tipoEscrito_Codigo&"'",conexion
dim fecha
fecha=Date
dim univoco
univoco=""&(area_Codigo)&(tipoMov_Codigo)&(etapa_Codigo)&(estado_Codigo)&(rol_Codigo)&(tipoEscrito_Codigo)&(SacarBarras(fecha))
if area_Codigo="" or tipoMov_Codigo="" or etapa_Codigo="" or estado_Codigo="" or rol_Codigo="" or tipoEscrito_Codigo="" Then
%>
    <meta http-equiv="<%response.write("refresh")%>" content="<%response.write("0; url=/./Default.asp")%>" />
<%
end if
%>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
    <%
    if area_Codigo="0" or tipoMov_Codigo="0" or etapa_Codigo="0" or estado_Codigo="0" or rol_Codigo="0" or tipoEscrito_Codigo="0" Then
    dim error
    set error = Server.CreateObject("ADODB.RecordSet")
    error.open "select * from Prm_Error WHERE Prm_Error_Codigo = '1001'",conexion
    %>
    <h1><%response.write(error("Prm_Error_Nombre")%><h1>
    <h2><%response.write(error("Prm_Error_Descripcion")%><h2>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="IngresoNuevaNotificacion.asp" method="post">
                        <input type="submit" value="Agregar Otra" title="Agregue otra Notificación" class="btn-agregar">
                    </form>
                </div>
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="../RecuperarNotificaciones.asp" method="post">
                        <input type="submit" value="Regresar" title="Vuelva al listado de Notificaciones">
                    </form>
                </div>
            </div>
        </div>
    <%
    else
    conexion.execute("insert into Ve_Notificacion (VeNotificacion_Univoco, VeNotificacion_Area, VeNotificacion_TipoMovimiento, VeNotificacion_Etapa, VeNotificacion_Estado, VeNotificacion_Rol, VeNotificacion_TipoEscrito, VeNotificacion_CuitDemandado) VALUES('"&univoco&"','"&area_Codigo&"','"&tipoMov_Codigo&"','"&etapa_Codigo&"','"&estado_Codigo&"','"&rol_Codigo&"','"&tipoEscrito_Codigo&"','2')")
    %>
    <h1>Los datos fueron agregados exitosamente</h1>
    <table Class="tabla">
        <tr>
            <th>Unívoco</th>
            <th>Área</th>
            <th>Tipo de Movimiento</th>
            <th>Etapa</th>
            <th>Estado</th>
            <th>Rol</th>
            <th>Tipo de Escrito</th>
            <th>Cuit del Demandado</th>
        </tr>
        <tr>
            <th><%response.write(univoco)%></th>
            <th><%response.write(area("Area_Codigo"))"-"(area("Area_Nombre"))%></th>
            <th><%response.write(tipoMovimiento("TipoMov_Nombre"))%></th>
            <th><%response.write(etapa("Etapa_Nombre"))%></th>
            <th><%response.write(estado("Estado_Nombre"))%></th>
            <th><%response.write(rol("Rol_Nombre"))%></th>
            <th><%response.write(tipoEscrito("TipoEscrito_Nombre"))%></th>
            <th>1</th>
        </tr>
    </table>
    end if
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="IngresoNuevaNotificacion.asp" method="post">
                        <input type="submit" value="Agregar Otra" title="Agregue otra Notificación" class="btn-agregar">
                    </form>
                </div>
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="../RecuperarNotificaciones.asp" method="post">
                        <input type="submit" value="Regresar" title="Vuelva al listado de Notificaciones">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
    <%conexion.close%>
</body>
</html>