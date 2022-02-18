<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim auxiliar
            dim escritoHb
            dim sector_EscritoHb
            set conexion=Server.CreateObject("ADODB.Connection")
            set escritoHb = Server.CreateObject("ADODB.RecordSet")
            set sector_EscritoHb = Server.CreateObject("ADODB.RecordSet")
            set auxiliar = Server.CreateObject("ADODB.RecordSet")
        %> 
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            escritoHb.open "select * from Prm_EscritosHabilitados where Prm_EscritoHB_Codigo='"&id&"'",conexion
            sector_EscritoHb.open "select Prm_FirmaPorSector_Firmante from Prm_FirmaPorSector where Prm_FirmaPorSector_EscritoHabilitados='"&id&"'",conexion
            if escritoHb.eof then
        %>
            <meta http-equiv="<%response.write("refresh")%>" content="<%response.write("0; url=/./Default.asp")%>" />
        <%
            Else
            dim area_Codigo, etapa_Codigo, estado_Codigo, tipoMov_Codigo, rol_Codigo, modeloEscrito_Codigo, obligatorio, firmante_Codigo
            
            
            if isNull(Request.QueryString("area_Codigo")) or isEmpty (Request.QueryString("area_Codigo")) then
            area_Codigo=escritoHb("Prm_EscritoHB_Area")
            else
            area_Codigo=Cint(Request.QueryString("area_Codigo"))
            end if

            if isNull(Request.QueryString("etapa_Codigo")) or isEmpty (Request.QueryString("etapa_Codigo")) then
            etapa_Codigo=escritoHb("Prm_EscritoHB_Etapa")
            else
            etapa_Codigo=Cint(Request.QueryString("etapa_Codigo"))
            end if

            if isNull(Request.QueryString("estado_Codigo")) or isEmpty (Request.QueryString("estado_Codigo")) then
            estado_Codigo=escritoHb("Prm_EscritoHB_Estado")
            else
            estado_Codigo=Cint(Request.QueryString("estado_Codigo"))
            end if

            if isNull(Request.QueryString("tipoMov_Codigo")) or isEmpty (Request.QueryString("tipoMov_Codigo")) then
            tipoMov_Codigo=escritoHb("Prm_EscritoHB_TipoMov")
            else
            tipoMov_Codigo=Cint(Request.QueryString("tipoMov_Codigo"))
            end if

            if isNull(Request.QueryString("rol_Codigo")) or isEmpty (Request.QueryString("rol_Codigo")) then
            rol_Codigo=escritoHb("Prm_EscritoHB_Rol")
            else
            rol_Codigo=Cint(Request.QueryString("rol_Codigo"))
            end if
            
            if isNull(Request.QueryString("tipoEscrito_Codigo")) or isEmpty (Request.QueryString("tipoEscrito_Codigo")) then
            modeloEscrito_Codigo=escritoHb("Prm_EscritoHB_ModeloEscrito")
            else
            modeloEscrito_Codigo=Cint(Request.QueryString("tipoEscrito_Codigo"))
            end if
            
            if isNull(Request.QueryString("sector_Codigo")) or isEmpty (Request.QueryString("sector_Codigo")) then
            firmante_Codigo=Cint(sector_EscritoHb("Prm_FirmaPorSector_Firmante"))
            else
            firmante_Codigo=Cint(Request.QueryString("sector_Codigo"))
            end if
            
            if isNull(Request.QueryString("obligatorio")) or isEmpty (Request.QueryString("obligatorio")) then
            obligatorio=escritoHb("Prm_EscritoHB_Obligatorio")
            else
            obligatorio=Request.QueryString("obligatorio")
                if obligatorio="True" then
                    obligatorio=1
                elseIf obligatorio="False" then
                    obligatorio=0
                end if
            end if
            
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">
        <form action="GenerarModificarEscritoHabilitado.asp" method="get">
            <input type="text" name="id" value="<%response.write(id) %>" hidden />
            <h1>
                Modificar Escrito Habilitado
            </h1>
            <table Class="tabla">
                <tr>
                    <!--Esta parte del codigo se puede hacer con un while dentro de otro while pero no llego con el tiemepo-->
                    <td>Áreas: <%response.write(area_Codigo)%>
                        <select name="area_Codigo" title="Seleccione el Área" onchange="this.form.submit()">
                        <%
                            auxiliar.open "select * from Prm_Area where Prm_Area_Vigencia=1",conexion
                            do while not auxiliar.eof
                            if auxiliar("Prm_Area_Codigo")=area_Codigo then
                        %>
                            <option selected value="<%response.write(auxiliar("Prm_Area_Codigo"))%>"><%response.write(auxiliar("Prm_Area_Codigo"))%>-<%response.write(auxiliar("Prm_Area_Nombre"))%></option>
                        <%
                            else
                        %>
                            <option value="<%response.write(auxiliar("Prm_Area_Codigo"))%>"><%response.write(auxiliar("Prm_Area_Codigo"))%>-<%response.write(auxiliar("Prm_Area_Nombre"))%></option>
                        <%
                            end if
                            auxiliar.movenext
                            loop
                            auxiliar.close
                        %>
                        </select>
                    </td>
                    <td>Tipo Movimiento: 
                        <select name="tipoMov_codigo" title="Seleccione el Tipo de Movimiento" onchange="this.form.submit()">
                        <%
                            auxiliar.open "select * from Prm_TipoMovimiento where Prm_TipoMov_Vigencia=1",conexion
                            do while not auxiliar.eof
                            if auxiliar("Prm_TipoMov_Codigo")=tipoMov_Codigo then
                        %>
                            <option selected value="<%response.write(auxiliar("Prm_TipoMov_Codigo"))%>"><%response.write(auxiliar("Prm_TipoMov_Codigo"))%>-<%response.write(auxiliar("Prm_TipoMov_Nombre"))%></option>
                        <%
                            else
                        %>
                            <option value="<%response.write(auxiliar("Prm_TipoMov_Codigo"))%>"><%response.write(auxiliar("Prm_TipoMov_Codigo"))%>-<%response.write(auxiliar("Prm_TipoMov_Nombre"))%></option>
                        <%
                            end if
                            auxiliar.movenext
                            loop
                            auxiliar.close
                        %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Etapa: 
                        <select name="etapa_Codigo" title="Seleccione la Etapa" onchange="this.form.submit()">
                        <%
                            auxiliar.open "select * from Prm_Etapa where Prm_Etapa_Vigencia=1",conexion
                            do while not auxiliar.eof
                            if auxiliar("Prm_Etapa_Codigo")=etapa_Codigo then
                        %>
                            <option selected value="<%response.write(auxiliar("Prm_Etapa_Codigo"))%>"><%response.write(auxiliar("Prm_Etapa_Codigo"))%>-<%response.write(auxiliar("Prm_Etapa_Nombre"))%></option>
                        <%
                            else
                        %>
                            <option value="<%response.write(auxiliar("Prm_Etapa_Codigo"))%>"><%response.write(auxiliar("Prm_Etapa_Codigo"))%>-<%response.write(auxiliar("Prm_Etapa_Nombre"))%></option>
                        <%
                            end if
                            auxiliar.movenext
                            loop
                            auxiliar.close
                        %>
                        </select>
                    </td>
                    <td>Estado
                        <select name="estado_Codigo" title="Seleccione el Estado" onchange="this.form.submit()">
                        <%
                            auxiliar.open "select * from Prm_Estado where Prm_Estado_Vigencia=1",conexion
                            do while not auxiliar.eof
                            if auxiliar("Prm_Estado_Codigo")=estado_Codigo then
                        %>
                            <option selected value="<%response.write(auxiliar("Prm_Estado_Codigo"))%>"><%response.write(auxiliar("Prm_Estado_Codigo"))%>-<%response.write(auxiliar("Prm_Estado_Nombre"))%></option>
                        <%
                            else
                        %>
                            <option value="<%response.write(auxiliar("Prm_Estado_Codigo"))%>"><%response.write(auxiliar("Prm_Estado_Codigo"))%>-<%response.write(auxiliar("Prm_Estado_Nombre"))%></option>
                        <%
                            end if
                            auxiliar.movenext
                            loop
                            auxiliar.close
                        %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Rol: 
                        <select name="rol_Codigo" title="Seleccione el Rol" onchange="this.form.submit()">
                        <%
                            auxiliar.open "select * from Prm_Rol where Prm_Rol_Vigencia=1",conexion
                            do while not auxiliar.eof
                            if auxiliar("Prm_Rol_Codigo")=rol_Codigo then
                        %>
                            <option selected value="<%response.write(auxiliar("Prm_Rol_Codigo"))%>"><%response.write(auxiliar("Prm_Rol_Codigo"))%>-<%response.write(auxiliar("Prm_Rol_Nombre"))%></option>
                        <%
                            else
                        %>
                            <option value="<%response.write(auxiliar("Prm_Rol_Codigo"))%>"><%response.write(auxiliar("Prm_Rol_Codigo"))%>-<%response.write(auxiliar("Prm_Rol_Nombre"))%></option>
                        <%
                            end if
                            auxiliar.movenext
                            loop
                            auxiliar.close
                        %>
                        </select>
                    </td>
                    <td>Modelo de Escrito: 
                        <select name="tipoEscrito_Codigo" title="Seleccione el Modelo de Escrito" onchange="this.form.submit()">
                        <%
                            auxiliar.open "select * from Prm_TipoEscrito where Prm_TipoEscrito_Vigencia=1",conexion
                            do while not auxiliar.eof
                            if auxiliar("Prm_TipoEscrito_Codigo")=modeloEscrito_Codigo then
                        %>
                            <option selected value="<%response.write(auxiliar("Prm_TipoEscrito_Codigo"))%>"><%response.write(auxiliar("Prm_TipoEscrito_Codigo"))%>-<%response.write(auxiliar("Prm_TipoEscrito_Nombre"))%></option>
                        <%
                            else
                        %>
                            <option value="<%response.write(auxiliar("Prm_TipoEscrito_Codigo"))%>"><%response.write(auxiliar("Prm_TipoEscrito_Codigo"))%>-<%response.write(auxiliar("Prm_TipoEscrito_Nombre"))%></option>
                        <%
                            end if
                            auxiliar.movenext
                            loop
                            auxiliar.close
                        %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Firma Obligatoria: 
                        <%
                        if obligatorio=1 then
                        %>
                            <select name="obligatorio" title="Seleccione el Modelo de Escrito" onchange="this.form.submit()">
                                <option selected value="1">SI</option>
                                <option value="0">NO</option> 
                            </select>
                        <%
                        elseIf obligatorio=0 then
                        %>
                            <select name="obligatorio" title="Seleccione el Modelo de Escrito" onchange="this.form.submit()">
                                <option selected value="0">NO</option> 
                                <option value="1">SI</option>
                            </select>
                        <%
                        end if
                        %>
                    </td>
                    <td>Sector Firmante:
                        <%
                            If obligatorio=1 then
                        %>
                                <select name="sector_Codigo" title="Seleccione el Sector Firmante" onchange="this.form.submit()">
                        <%
                                auxiliar.open "select * from Prm_SectorFirmante where Prm_SectorFirmante_Vigencia=1",conexion
                                if auxiliar.eof then
                        %>
                                <option value="0">No hay Parámetros de Sectores Firmantes</option>
                        <% 
                                else
                                do while not auxiliar.eof
                                        if auxiliar("Prm_SectorFirmante_Codigo")=firmante_Codigo then
                                    %>
                                        <option selected value="<%response.write(auxiliar("Prm_SectorFirmante_Codigo"))%>"><%response.write(auxiliar("Prm_SectorFirmante_Codigo"))%>-<%response.write(auxiliar("Prm_SectorFirmante_Nombre"))%></option>
                                    <%
                                        else
                                    %>
                                        <option value="<%response.write(auxiliar("Prm_SectorFirmante_Codigo"))%>"><%response.write(auxiliar("Prm_SectorFirmante_Codigo"))%>-<%response.write(auxiliar("Prm_SectorFirmante_Nombre"))%></option>
                                    <%
                                        end if
                                auxiliar.movenext
                                loop
                                end if
                                auxiliar.close
                            %>
                                </select>
                            <%
                            else
                            %>
                                <select disabled name="sector_Codigo" title="Seleccione el Sector Firmante">
                            <%
                            end if
                        %>
                    </td>
                </tr>
            </table>
            </form>
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="ModificarEscritoHabilitado.asp" method="post">
                            <input type="text" name="id" value="<%response.write(id) %>" hidden />
                            <input type="text" name="area_Codigo" value="<%response.write(area_Codigo)%>" hidden/>
                            <input type="text" name="etapa_Codigo" value="<%response.write(etapa_Codigo)%>" hidden/>
                            <input type="text" name="estado_Codigo" value="<%response.write(estado_Codigo)%>" hidden/>
                            <input type="text" name="tipoMov_Codigo" value="<%response.write(tipoMov_Codigo)%>" hidden/>
                            <input type="text" name="rol_Codigo" value="<%response.write(rol_Codigo)%>" hidden/>
                            <input type="text" name="tipoEscrito_Codigo" value="<%response.write(modeloEscrito_Codigo)%>" hidden/>
                            <input type="text" name="obligatorio" value="<%response.write(obligatorio)%>" hidden/>
                            <input type="text" name="sector_Codigo" value="<%response.write(firmante_Codigo)%>" hidden/>
                            <input type="submit" value="Modificar" title="Confirme la modificación" class="btn-agregar"/>
                        </form>
                    </div>
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="../RecuperarEscritosHabilitados.asp" method="post">
                            <input type="submit" value="Cancelar" title="Cancelar" class="btn-eliminar">
                        </form>
                    </div>
                </div>
            </div>
    </div>
        <%
            end if
            conexion.close
        %>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
