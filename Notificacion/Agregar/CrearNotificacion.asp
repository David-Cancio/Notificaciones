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
dim area_Codigo, tipoMov_Codigo, etapa_Codigo, estado_Codigo, rol_Codigo, tipoEscrito_Codigo, fecha, hora, univoco,cantidadCuit
area_Codigo=ValidarNull(Request.form("area_Codigo"))
tipoMov_Codigo=ValidarNull(Request.form("tipoMov_Codigo"))
etapa_Codigo=ValidarNull(Request.form("etapa_Codigo")) 
estado_Codigo=ValidarNull(Request.form("estado_Codigo"))
rol_Codigo=ValidarNull(Request.form("rol_Codigo"))
tipoEscrito_Codigo=ValidarNull(Request.form("tipoEscrito_Codigo"))
cantidadCuit=ValidarNull(Request.form("cantidadCuit"))
area.open "select Prm_Area_Nombre from Prm_Area WHERE Prm_Area_Codigo = '"&area_Codigo&"'",conexion
tipoMovimiento.open "select Prm_TipoMov_Nombre from Prm_TipoMovimiento WHERE Prm_TipoMov_Codigo = '"&tipoMov_Codigo&"'",conexion
etapa.open "select Prm_Etapa_Nombre from Prm_Etapa WHERE Prm_Etapa_Codigo = '"&etapa_Codigo&"'",conexion
estado.open "select Prm_Estado_Nombre from Prm_Estado WHERE Prm_Estado_Codigo = '"&estado_Codigo&"'",conexion
rol.open "select Prm_Rol_Nombre from Prm_Rol WHERE Prm_Rol_Codigo = '"&rol_Codigo&"'",conexion
tipoEscrito.open "select Prm_TipoEscrito_Nombre from Prm_TipoEscrito WHERE Prm_TipoEscrito_Codigo = '"&tipoEscrito_Codigo&"'",conexion
fecha=Date
hora=time 
univoco=""&(area_Codigo)&(tipoMov_Codigo)&(etapa_Codigo)&(estado_Codigo)&(rol_Codigo)&(tipoEscrito_Codigo)&(SacarBarras(fecha))&(SacarPuntos(hora))
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
    <h1><%response.write(error("Prm_Error_Nombre"))%><h1>
    <h2><%response.write(error("Prm_Error_Descripcion"))%><h2>
    <%
    else
    %><!--
    conexion.execute("insert into Ve_Notificacion (VeNotificacion_Univoco, VeNotificacion_Area, VeNotificacion_TipoMovimiento, VeNotificacion_Etapa, VeNotificacion_Estado, VeNotificacion_Rol, VeNotificacion_TipoEscrito, VeNotificacion_CuitDemandado) VALUES('"&univoco&"','"&area_Codigo&"','"&tipoMov_Codigo&"','"&etapa_Codigo&"','"&estado_Codigo&"','"&rol_Codigo&"','"&tipoEscrito_Codigo&"','2')")
    --><%
    %>
    <h1>El Movimiento fue agregados exitosamente</h1>
    <table Class="tabla">
        <tr>
            <th>
                Unívoco:
            </th>
            <th colspan="5">
                <%response.write(univoco)%>
            </th>
        </tr>
        <tr>
            <th>
                Área:
            </th>
            <th colspan="2">
                <%response.write(area_Codigo+"-"+area("Prm_Area_Nombre"))%>

            </th>
            <th>
                Tipo de Movimiento:
            </th>
            <th colspan="2">
                <%response.write(tipoMov_Codigo+"-"+tipoMovimiento("Prm_TipoMov_Nombre"))%>
            </th>
        </tr>
        <tr>
            <th>
                Etapa:
            </th>
            <th colspan="2"> 
                <%response.write(etapa_Codigo+"-"+etapa("Prm_Etapa_Nombre"))%>
            </th>
            <th>
                Estado:
            </th>
            <th colspan="2">
                <%response.write(estado_Codigo+"-"+estado("Prm_Estado_Nombre"))%>
            </th>
        </tr>
        <tr>
            <th>
                Rol: 
            </th>
            <th colspan="2">
                <%response.write(rol_Codigo+"-"+rol("Prm_Rol_Nombre"))%>
            </th>
            <th>
                Tipo de Escrito: 
            </th>
            <th colspan="2">
                <%response.write(tipoEscrito_Codigo+"-"+tipoEscrito("Prm_TipoEscrito_Nombre"))%>
            </th>
        </tr>
    </table>
    <h2>CUITs</h2>
    <table Class="tabla">
        <tr>
            <th>Cantidad de Demandados: <%response.write(cantidadCuit)%></th>
        </tr>
    </table>
    <%end if %>
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