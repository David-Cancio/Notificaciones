<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
dim conexion
dim auxiliar
set conexion=Server.CreateObject("ADODB.Connection")
set auxiliar = Server.CreateObject("ADODB.RecordSet")
dim area
area=Request.QueryString("area_Codigo")
dim tipoMov
tipoMov=Request.QueryString("tipoMov_Codigo")
dim etapa
etapa=Request.QueryString("etapa_Codigo")
dim estado
estado=Request.QueryString("estado_Codigo")
dim rol
rol=Request.QueryString("rol_Codigo")
dim modeloEscrito
modeloEscrito=Request.QueryString("tipoEscrito_Codigo")
dim obligatorio
obligatorio=Request.QueryString("obligatorio")
dim sector
sector=Request.QueryString("sector_Codigo")
%>
<!--#include virtual="/connectionSQL.asp"-->
<%
conexion.open
%>
<html>
    <!--#include virtual="/Partials/head.asp"-->
<body>
    <!--#include virtual="/Partials/header.asp"-->
    <div class="listado">   
        <form action="IngresoNuevoEscritoHabilitado.asp" method="get">
            <h1>Ingrese un Nuevo Escrito Hablitado</h1>
            <table Class="tabla">
                <tr>
                    <!--Esta parte del codigo se puede hacer con un while dentro de otro while pero no llego con el tiemepo-->
                    <td>Áreas: 
                        <select name="area_Codigo" title="Seleccione el Área" onchange="this.form.submit()">
                        <%
                            auxiliar.open "select * from Prm_Area where Prm_Area_Vigencia=1",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parametros de Área</option>
                        <% 
                            else
                            do while not auxiliar.eof
                            if Cint(auxiliar("Prm_Area_Codigo"))=Cint(area) then
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
                            end if
                            auxiliar.close
                        %>
                        </select>
                    </td>
                    <td>Tipo Movimiento: 
                        <select name="tipoMov_codigo" title="Seleccione el Tipo de Movimiento" onchange="this.form.submit()">
                        <%
                            auxiliar.open "select * from Prm_TipoMovimiento where Prm_TipoMov_Vigencia=1",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parametros de Tipo de Movimiento</option>
                        <% 
                            else
                            do while not auxiliar.eof
                            if Cint(auxiliar("Prm_TipoMov_Codigo"))=Cint(tipoMov) then
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
                            end if
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
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parametros de Etapa</option>
                        <% 
                            else
                            do while not auxiliar.eof
                            if Cint(auxiliar("Prm_Etapa_Codigo"))=Cint(etapa) then
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
                            end if
                            auxiliar.close
                        %>
                        </select>
                    </td>
                    <td>Estado
                        <select name="estado_Codigo" title="Seleccione el Estado" onchange="this.form.submit()">
                        <%
                            auxiliar.open "select * from Prm_Estado where Prm_Estado_Vigencia=1",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parametros de Estado</option>
                        <% 
                            else
                            do while not auxiliar.eof
                            if Cint(auxiliar("Prm_Estado_Codigo"))=Cint(estado) then
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
                            end if
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
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parametros de Rol</option>
                        <% 
                            else
                            do while not auxiliar.eof
                            if Cint(auxiliar("Prm_Rol_Codigo"))=Cint(rol) then
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
                            end if
                            auxiliar.close
                        %>
                        </select>
                    </td>
                    <td>Modelo de Escrito: 
                        <select name="tipoEscrito_Codigo" title="Seleccione el Modelo de Escrito" onchange="this.form.submit()">
                        <%
                            auxiliar.open "select * from Prm_TipoEscrito where Prm_TipoEscrito_Vigencia=1",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parametros de Modelo de Escrito</option>
                        <% 
                            else
                            do while not auxiliar.eof
                            if Cint(auxiliar("Prm_TipoEscrito_Codigo"))=Cint(modeloEscrito) then
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
                            end if
                            auxiliar.close
                        %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Firma Obligatoria:
                        <%
                        if Cint(obligatorio)=1 then
                        %>
                        <select name="obligatorio" title="Seleccione el Modelo de Escrito" onchange="this.form.submit()">
                            <option selected value=1>SI</option>
                            <option value=0>NO</option> 
                        </select>
                        <%
                        else
                        %>
                        <select name="obligatorio" title="Seleccione el Modelo de Escrito" onchange="this.form.submit()">
                            <option selected value=0>NO</option> 
                            <option value=1>SI</option>
                        </select>
                        <%
                        end if
                        %>
                    </td>
                    <td>Sector Firmante:
                        <%
                            if Cint(obligatorio)=1 then
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
                            if Cint(auxiliar("Prm_SectorFirmante_Codigo"))=Cint(sector) then
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
                        <form action="CrearEscritoHabilitado.asp" method="post">
                            <input type="text" name="area_Codigo" value="<%response.write(area)%>" hidden/>
                            <input type="text" name="tipoMov_Codigo" value="<%response.write(tipoMov)%>" hidden/>
                            <input type="text" name="etapa_Codigo" value="<%response.write(etapa)%>" hidden/>
                            <input type="text" name="estado_Codigo" value="<%response.write(estado)%>" hidden/>
                            <input type="text" name="rol_Codigo" value="<%response.write(rol)%>" hidden/>
                            <input type="text" name="tipoEscrito_Codigo" value="<%response.write(modeloEscrito)%>" hidden/>
                            <input type="text" name="obligatorio" value="<%response.write(obligatorio)%>" hidden/>
                            <input type="text" name="sector_Codigo" value="<%response.write(sector)%>" hidden/>
                            <input type="submit" value="Crear" title="Crear Notificacion" class="btn-agregar" />
                        </form>
                    </div>
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="../RecuperarEscritosHabilitados.asp" method="post">
                            <input type="submit" value="Cancelar" title="Cancelar" class="btn-eliminar">
                        </form>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>