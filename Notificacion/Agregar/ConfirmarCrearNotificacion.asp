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
dim area_Codigo, tipoMov_Codigo, etapa_Codigo, estado_Codigo, rol_Codigo, tipoEscrito_Codigo, fecha, hora, univoco, inicioCuit, cuit, finalCuit, firma_Codigo, sectorFirmante_Codigo
area_Codigo=ValidarNull(Request.form("area_Codigo"))
tipoMov_Codigo=ValidarNull(Request.form("tipoMov_Codigo"))
etapa_Codigo=ValidarNull(Request.form("etapa_Codigo")) 
estado_Codigo=ValidarNull(Request.form("estado_Codigo"))
rol_Codigo=ValidarNull(Request.form("rol_Codigo"))
tipoEscrito_Codigo=ValidarNull(Request.form("tipoEscrito_Codigo"))
firma_Codigo=ValidarNull(Request.form("firma_Codigo"))
inicioCuit=Request.form("inicioCuit")
cuit=Request.form("cuit")
finalCuit=Request.form("finalCuit")
univoco=Request.form("univoco")

if IsNull(Request.form("inicioCuit")) or IsEmpty(Request.form("inicioCuit")) or IsNull(Request.form("cuit")) or IsEmpty(Request.form("cuit")) or IsNull(Request.form("finalCuit")) or IsEmpty(Request.form("finalCuit")) then
    %>
        <meta http-equiv="<%response.write("refresh")%>" content="<%response.write("0; url=/./Default.asp")%>" />
    <%
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
%>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
    <table Class="tabla">
        <tr>
            <th>
                Unívoco:
            </th>
            <th colspan="2">
                <%response.write(univoco)%>
            </th>
            <th>
                Cuit: 
            </th>
            <th colspan="2">
                <%response.write(cuit)%>
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
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="CrearNotificacion.asp" method="post">
                        <input type="text" name="area_Codigo" value="<%response.write(area_Codigo)%>" hidden/>
                        <input type="text" name="tipoMov_Codigo" value="<%response.write(tipoMov_Codigo)%>" hidden/>
                        <input type="text" name="etapa_Codigo" value="<%response.write(etapa_Codigo)%>" hidden/>
                        <input type="text" name="estado_Codigo" value="<%response.write(estado_Codigo)%>" hidden/>
                        <input type="text" name="rol_Codigo" value="<%response.write(rol_Codigo)%>" hidden/>
                        <input type="text" name="tipoEscrito_Codigo" value="<%response.write(tipoEscrito_Codigo)%>" hidden/>
                        <input type="text" name="firma_Codigo" value="<%response.write(firma_Codigo)%>" hidden/>
                        <input type="text" name="inicioCuit" value="<%response.write(inicioCuit)%>" hidden/>
                        <input type="text" name="cuit" value="<%response.write(cuit)%>" hidden/>
                        <input type="text" name="finalCuit" value="<%response.write(finalCuit)%>" hidden/>
                        <input type="text" name="univoco" value="<%response.write(univoco)%>" hidden/>
                        <input type="submit" value="Confirmar" title="Generar Notificación" class="btn-agregar">
                    </form>
                </div>
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="../RecuperarNotificaciones.asp" method="post">
                        <input type="submit" value="Cancelar" title="Cancelar la creacion de esta Notificación  " class="btn-eliminar">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
    <%conexion.close%>
</body>
</html>