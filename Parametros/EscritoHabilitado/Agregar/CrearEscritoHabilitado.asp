<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
dim conexion
set conexion=Server.CreateObject("ADODB.Connection")
dim area, tipoMovimiento, etapa, estado, rol, modeloEscrito, sector, escritoHb
set area = Server.CreateObject("ADODB.RecordSet")
set tipoMovimiento = Server.CreateObject("ADODB.RecordSet")
set etapa = Server.CreateObject("ADODB.RecordSet")
set estado = Server.CreateObject("ADODB.RecordSet")
set rol = Server.CreateObject("ADODB.RecordSet")
set modeloEscrito = Server.CreateObject("ADODB.RecordSet")
set sector = Server.CreateObject("ADODB.RecordSet")
set escritoHb = Server.CreateObject("ADODB.RecordSet")
%>
<!--#include virtual="/connectionSQL.asp"-->
<%
conexion.open
dim area_Codigo
area_Codigo=Request.form("area_Codigo")
dim etapa_Codigo
etapa_Codigo=Request.form("etapa_Codigo")
dim estado_Codigo
estado_Codigo=Request.form("estado_Codigo")
dim tipoMov_Codigo
tipoMov_Codigo=Request.form("tipoMov_Codigo")
dim rol_Codigo
rol_Codigo=Request.form("rol_Codigo")
dim modeloEscrito_Codigo
modeloEscrito_Codigo=Request.form("tipoEscrito_Codigo")
dim obligatorio
obligatorio=Request.QueryString("obligatorio")
response.write(obligatorio)
dim sector_Codigo
sector_Codigo=Request.form("sector_Codigo")
area.open "select Prm_Area_Nombre from Prm_Area WHERE Prm_Area_Codigo = '"&area_Codigo&"'",conexion
tipoMovimiento.open "select Prm_TipoMov_Nombre from Prm_TipoMovimiento WHERE Prm_TipoMov_Codigo = '"&tipoMov_Codigo&"'",conexion
etapa.open "select Prm_Etapa_Nombre from Prm_Etapa WHERE Prm_Etapa_Codigo = '"&etapa_Codigo&"'",conexion
estado.open "select Prm_Estado_Nombre from Prm_Estado WHERE Prm_Estado_Codigo = '"&estado_Codigo&"'",conexion
rol.open "select Prm_Rol_Nombre from Prm_Rol WHERE Prm_Rol_Codigo = '"&rol_Codigo&"'",conexion
modeloEscrito.open "select Prm_TipoEscrito_Nombre from Prm_TipoEscrito WHERE Prm_TipoEscrito_Codigo = '"&modeloEscrito_Codigo&"'",conexion
sector.open "select Prm_SectorFirmante_Nombre from Prm_SectorFirmante WHERE Prm_SectorFirmante_Codigo = '"&sector_Codigo&"'",conexion
dim sector_Nombre
if sector.eof then
sector_Nombre="-"
else
sector_Nombre=(sector("Prm_SectorFirmante_Nombre"))
end if

if area_Codigo="" or tipoMov_Codigo="" or etapa_Codigo="" or estado_Codigo="" or rol_Codigo="" or modeloEscrito_Codigo="" or sector_Codigo="" Then
%>
    <meta http-equiv="<%response.write("refresh")%>" content="<%response.write("0; url=/./Default.asp")%>" />
<%
end if
conexion.execute("insert into Prm_EscritosHabilitados (Prm_EscritoHB_Area, Prm_EscritoHB_TipoMov, Prm_EscritoHB_Etapa, Prm_EscritoHB_Estado, Prm_EscritoHB_Rol, Prm_EscritoHB_ModeloEscrito, Prm_EscritoHB_Obligatorio) VALUES('"&area_Codigo&"','"&tipoMov_Codigo&"','"&etapa_Codigo&"','"&estado_Codigo&"','"&rol_Codigo&"','"&modeloEscrito_Codigo&"','"&obligatorio&"')")
escritoHb.open "select Prm_EscritoHB_Codigo from Prm_EscritosHabilitados WHERE Prm_EscritoHB_Area = '"&area_Codigo&"' and Prm_EscritoHB_TipoMov = '"&tipoMov_Codigo&"' and Prm_EscritoHB_Etapa = '"&etapa_Codigo&"' and Prm_EscritoHB_Estado = '"&estado_Codigo&"' and Prm_EscritoHB_Rol = '"&rol_Codigo&"' and Prm_EscritoHB_ModeloEscrito = '"&modeloEscrito_Codigo&"' and Prm_EscritoHB_Obligatorio = '"&obligatorio&"'",conexion
dim escritoHb_Codigo
do while not escritoHb.eof
escritoHb_Codigo=escritoHb("Prm_EscritoHB_Codigo")
escritoHb.movenext
loop
conexion.execute("insert into Prm_FirmaPorSector (Prm_FirmaPorSector_EscritoHabilitados, Prm_FirmaPorSector_Firmante, Prm_FirmaPorSector_Estado) VALUES('"&escritoHb_Codigo&"','"&sector_Codigo&"',1)")
%>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
    <%
    if area_Codigo="0" or tipoMov_Codigo="0" or etapa_Codigo="0" or estado_Codigo="0" or rol_Codigo="0" or modeloEscrito_Codigo="0" Then
    dim error
    set error = Server.CreateObject("ADODB.RecordSet")
    %>
    <h1><%response.write(error("Prm_Error_Nombre"))%><h1>
    <h2><%response.write(error("Prm_Error_Descripcion"))%><h2>
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
    <%else%>
    <h1>Los datos fueron agregados exitosamente</h1>
    <table Class="tabla">
        <tr>
            <th>Área</th>
            <th>Tipo de Movimiento</th>
            <th>Etapa</th>
            <th>Estado</th>
            <th>Rol</th>
            <th>Modelo de Escrito</th>
            <th>Sector</th>
            <th>Cuit del Demandado</th>
        </tr>
        <tr>
            <th><%response.write(area("Prm_Area_Nombre"))%></th>
            <th><%response.write(tipoMovimiento("Prm_TipoMov_Nombre"))%></th>
            <th><%response.write(etapa("Prm_Etapa_Nombre"))%></th>
            <th><%response.write(estado("Prm_Estado_Nombre"))%></th>
            <th><%response.write(rol("Prm_Rol_Nombre"))%></th>
            <th><%response.write(modeloEscrito("Prm_TipoEscrito_Nombre"))%></th>
            <th><%response.write(sector_Nombre)%></th>
            <th>1</th>  
        </tr>
    </table>
    <%
    end if
    %>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="IngresoNuevoEscritoHabilitado.asp" method="post">
                        <input type="submit" value="Agregar Otra" title="Agregue otra Notificación" class="btn-agregar">
                    </form>
                </div>
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="../RecuperarEscritosHabilitados.asp" method="post">
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