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
dim area_Codigo, tipoMov_Codigo, etapa_Codigo, estado_Codigo, rol_Codigo, tipoEscrito_Codigo, fecha, hora, univoco,cuit, firma_Codigo,crearTabla, sectorFirmante_Codigo
crearTabla=0
area_Codigo=ValidarNull(Request.form("area_Codigo"))
tipoMov_Codigo=ValidarNull(Request.form("tipoMov_Codigo"))
etapa_Codigo=ValidarNull(Request.form("etapa_Codigo")) 
estado_Codigo=ValidarNull(Request.form("estado_Codigo"))
rol_Codigo=ValidarNull(Request.form("rol_Codigo"))
tipoEscrito_Codigo=ValidarNull(Request.form("tipoEscrito_Codigo"))
firma_Codigo=ValidarNull(Request.form("firma_Codigo"))
if IsNull(Request.form("inicioCuit")) or IsEmpty(Request.form("inicioCuit")) or IsNull(Request.form("cuit")) or IsEmpty(Request.form("cuit")) or IsNull(Request.form("finalCuit")) or IsEmpty(Request.form("finalCuit")) then
    %>
        <meta http-equiv="<%response.write("refresh")%>" content="<%response.write("0; url=/./Default.asp")%>" />
    <%
    else 
        cuit=Request.form("inicioCuit")+"-"+Request.form("cuit")+"-"+Request.form("finalCuit")
end if
if area_Codigo="" or tipoMov_Codigo="" or etapa_Codigo="" or estado_Codigo="" or rol_Codigo="" or tipoEscrito_Codigo="" or firma_Codigo="" Then
%>
    <meta http-equiv="<%response.write("refresh")%>" content="<%response.write("0; url=/./Default.asp")%>" />
<%
end if
area.open "select Prm_Area_Nombre from Prm_Area WHERE Prm_Area_Codigo = '"&area_Codigo&"'",conexion
tipoMovimiento.open "select Prm_TipoMov_Nombre from Prm_TipoMovimiento WHERE Prm_TipoMov_Codigo = '"&tipoMov_Codigo&"'",conexion
etapa.open "select Prm_Etapa_Nombre from Prm_Etapa WHERE Prm_Etapa_Codigo = '"&etapa_Codigo&"'",conexion
estado.open "select Prm_Estado_Nombre from Prm_Estado WHERE Prm_Estado_Codigo = '"&estado_Codigo&"'",conexion
rol.open "select Prm_Rol_Nombre from Prm_Rol WHERE Prm_Rol_Codigo = '"&rol_Codigo&"'",conexion
tipoEscrito.open "select Prm_TipoEscrito_Nombre from Prm_TipoEscrito WHERE Prm_TipoEscrito_Codigo = '"&tipoEscrito_Codigo&"'",conexion
fecha=Date
hora=time 
univoco=""&(area_Codigo)&(tipoMov_Codigo)&(etapa_Codigo)&(estado_Codigo)&(rol_Codigo)&(tipoEscrito_Codigo)&(SacarBarras(fecha))&(SacarPuntos(hora))
dim error, numeroError
set error = Server.CreateObject("ADODB.RecordSet")
%>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
    <%
    if area_Codigo="0" or tipoMov_Codigo="0" or etapa_Codigo="0" or estado_Codigo="0" or rol_Codigo="0" or tipoEscrito_Codigo="0" Then
    numeroError=1001
    error.open "select * from Prm_Error WHERE Prm_Error_Codigo = '"&numeroError&"'",conexion
    %>
    <h1><%response.write(error("Prm_Error_Nombre"))%><h1>
    <h2><%response.write(error("Prm_Error_Descripcion"))%><h2>
    <%
    else
        dim verificacion
        set verificacion = Server.CreateObject("ADODB.RecordSet")
        verificacion.open "select * from Prm_EscritosHabilitados WHERE Prm_EscritoHB_Area='"&area_Codigo&"' and Prm_EscritoHB_Etapa='"&etapa_Codigo&"' and Prm_EscritoHB_Estado='"&estado_Codigo&"' and Prm_EscritoHB_TipoMov='"&tipoMov_Codigo&"' and Prm_EscritoHB_Rol='"&rol_Codigo&"' and Prm_EscritoHB_ModeloEscrito='"&tipoEscrito_Codigo&"' and Prm_EscritoHB_Obligatorio='"&firma_Codigo&"'",conexion
        if verificacion.eof Then
            if firma_Codigo=1 Then
                dim firma
                set firma = Server.CreateObject("ADODB.RecordSet")
                firma.open "select Prm_FirmaPorSector_Firmante from Prm_FirmasPorSector WHERE Prm_FirmaPorSector_EscritoHabilitados = '"&verificacion("Prm_EscritoHB_Codigo")&"'",conexion
                if firma("Prm_FirmaPorSector_Firmante") = sectorFirmante_Codigo Then
                    numeroError=2001
                    error.open "select * from Prm_Error WHERE Prm_Error_Codigo = '"&numeroError&"'",conexion
                    crearTabla=1
                    %>
                    <h1><%response.write(error("Prm_Error_Nombre"))%><h1>
                    <h2><%response.write(error("Prm_Error_Descripcion"))%><h2>
                    <%
                else
                    numeroError=1002
                    error.open "select * from Prm_Error WHERE Prm_Error_Codigo = '"&numeroError&"'",conexion
                    crearTabla=1
                    %>
                    <h1><%response.write(error("Prm_Error_Nombre"))%><h1>
                    <h2><%response.write(error("Prm_Error_Descripcion"))%><h2>
                    <%
                End if
            else
                numeroError=2001
                error.open "select * from Prm_Error WHERE Prm_Error_Codigo = '"&numeroError&"'",conexion
                crearTabla=1
                %>
                <h1><%response.write(error("Prm_Error_Nombre"))%><h1>
                <h2><%response.write(error("Prm_Error_Descripcion"))%><h2>
                <%  
            End if
        Else 
            numeroError=1003
            error.open "select * from Prm_Error WHERE Prm_Error_Codigo = '"&numeroError&"'",conexion
            crearTabla=1
            %>
            <h1><%response.write(error("Prm_Error_Nombre"))%><h1>
            <h2><%response.write(error("Prm_Error_Descripcion"))%><h2>
            <%
    End if
    if crearTabla=1 Then
        conexion.execute("insert into Ve_Notificacion (VeNotificacion_Univoco, VeNotificacion_Area, VeNotificacion_TipoMovimiento, VeNotificacion_Etapa, VeNotificacion_Estado, VeNotificacion_Rol, VeNotificacion_TipoEscrito, VeNotificacion_CuitDemandado) VALUES('"&univoco&"','"&area_Codigo&"','"&tipoMov_Codigo&"','"&etapa_Codigo&"','"&estado_Codigo&"','"&rol_Codigo&"','"&tipoEscrito_Codigo&"','2')")
        conexion.execute("insert into Ve_Control (Ve_Control_Univoco, Ve_Control_Fecha, Ve_Control_Hora, Ve_Control_Codigo_Retorno, Ve_Control_MotivoUsuario) values ('"&univoco&"', '"&fecha&"', '"&hora&"', '"&numeroError&"','-')")
        conexion.execute("insert into Ve_Escritos (Ve_Escritos_Univoco, Ve_Escritos_RutaDocumentos, Ve_Escritos_ModeloEscrito) values ('"&univoco&"','-', '"&tipoEscrito_Codigo&"')")
        conexion.execute("insert into Ve_Destino (Ve_Destino_Univoco, Ve_Destino_Cuit) values ('"&univoco&"','"&cuit&"')")
    %>
    <table Class="tabla">
        <tr>
            <th colspan="2">
                Unívoco:
            </th>
            <th colspan="4">
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
        <tr>
            <th colspan="2">
                Cuit: 
            </th>
            <th colspan="4">
                <%response.write(cuit)%>
            </th>
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