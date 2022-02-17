<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim escritoHb
            set conexion=Server.CreateObject("ADODB.Connection")
            set escritoHb = Server.CreateObject("ADODB.RecordSet")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            escritoHb.open "select * from Prm_EscritosHabilitados where Prm_EscritoHB_Codigo='"&id&"'",conexion
            if escritoHb.eof then
        %>
        <meta http-equiv="<%response.write("refresh")%>" content="<%response.write("0; url=/./Default.asp")%>" />
        <%
            End if
            dim area_Codigo, etapa_Codigo, estado_Codigo, tipoMov_Codigo, rol_Codigo, modeloEscrito_Codigo, obligatorio
            area_Codigo=escritoHb("Prm_EscritoHB_Area")
            etapa_Codigo=escritoHb("Prm_EscritoHB_Etapa")
            estado_Codigo=escritoHb("Prm_EscritoHB_Estado")
            tipoMov_Codigo=escritoHb("Prm_EscritoHB_TipoMov")
            rol_Codigo=escritoHb("Prm_EscritoHB_Rol")
            modeloEscrito_Codigo=escritoHb("Prm_EscritoHB_ModeloEscrito")
            obligatorio=escritoHb("Prm_EscritoHB_Obligatorio")
            
            dim area, tipoMovimiento, etapa, estado, rol, modeloEscrito, sector, sector_Codigo
            set area = Server.CreateObject("ADODB.RecordSet")
            set tipoMovimiento = Server.CreateObject("ADODB.RecordSet")
            set etapa = Server.CreateObject("ADODB.RecordSet")
            set estado = Server.CreateObject("ADODB.RecordSet")
            set rol = Server.CreateObject("ADODB.RecordSet")
            set modeloEscrito = Server.CreateObject("ADODB.RecordSet")
            set sector_Codigo = Server.CreateObject("ADODB.RecordSet")
            set sector = Server.CreateObject("ADODB.RecordSet")
            area.open "select Prm_Area_Nombre from Prm_Area WHERE Prm_Area_Codigo = '"&area_Codigo&"'",conexion
            tipoMovimiento.open "select Prm_TipoMov_Nombre from Prm_TipoMovimiento WHERE Prm_TipoMov_Codigo = '"&tipoMov_Codigo&"'",conexion
            etapa.open "select Prm_Etapa_Nombre from Prm_Etapa WHERE Prm_Etapa_Codigo = '"&etapa_Codigo&"'",conexion
            estado.open "select Prm_Estado_Nombre from Prm_Estado WHERE Prm_Estado_Codigo = '"&estado_Codigo&"'",conexion
            rol.open "select Prm_Rol_Nombre from Prm_Rol WHERE Prm_Rol_Codigo = '"&rol_Codigo&"'",conexion
            modeloEscrito.open "select Prm_TipoEscrito_Nombre from Prm_TipoEscrito WHERE Prm_TipoEscrito_Codigo = '"&modeloEscrito_Codigo&"'",conexion
            sector_Codigo.open "select Prm_FirmaPorSector_Firmante from Prm_FirmaPorSector WHERE Prm_FirmaPorSector_EscritoHabilitados = '"&id&"'",conexion
            if not sector_Codigo.eof then
            sector.open "select Prm_SectorFirmante_Nombre from Prm_SectorFirmante WHERE Prm_SectorFirmante_Codigo = '"&sector_Codigo("Prm_FirmaPorSector_Firmante")&"'",conexion
            end if
        %>
<html>

    <!--#include virtual="/Partials/Head.asp"-->

<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">
        <h1>Eliminar Escrito Habilitado: <%response.Write(escritoHb("Prm_EscritoHB_Codigo"))%>
        </h1>
        <table Class="tabla">
            <tr>
                <th>Código</th>
                <th>Área</th>
                <th>Etapa</th>
                <th>Estado</th>
                <th>Tipo de Movimiento</th>
                <th>Rol</th>
                <th>Modelo de Escrito</th>
                <th>Obligatorio</th>
            </tr>
            <tr>
                <th>
                    <%response.Write(escritoHb("Prm_EscritoHB_Codigo"))%>
                </th>
                <th>
                    <%response.Write(area("Prm_Area_Nombre"))%>
                </th>
                <th>
                    <%response.Write(etapa("Prm_Etapa_Nombre"))%>
                </th>
                <th>
                    <%response.Write(estado("Prm_Estado_Nombre"))%>
                </th>
                <th>
                    <%response.Write(tipoMovimiento("Prm_TipoMov_Nombre"))%>
                </th>
                <th>
                    <%response.Write(rol("Prm_Rol_Nombre"))%>
                </th>
                <th>
                    <%response.Write(modeloEscrito("Prm_TipoEscrito_Nombre"))%>
                </th>
                <th>
                    <%
                        if escritoHb("Prm_EscritoHB_Obligatorio")=False then
                    %>
                            NO
                    <%
                        else
                    
                            response.write(sector("Prm_SectorFirmante_Nombre"))

                        end if
                    %>
                </th>
            </tr>
        </table>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="EliminarEscritoHabilitado.asp" method="post">
                        <input type="text" name="id" value="<%response.write(id)%>" hidden />
                        <input type="submit" value="Confirmar" title="Elimine el EscritoHabilitado" class="btn-eliminar">
                    </form>
                </div>
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="../RecuperarEscritosHabilitados.asp" method="post">
                        <input type="submit" value="Cancelar" title="Cancelar">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
