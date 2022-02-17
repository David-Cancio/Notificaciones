<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
dim conexion
dim auxiliar
set conexion=Server.CreateObject("ADODB.Connection")
set auxiliar = Server.CreateObject("ADODB.RecordSet")
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
        <form action="CrearEscritoHabilitado.asp" method="post">
            <h1>Ingrese un Nuevo Escrito Hablitado</h1>
            <table Class="tabla">
                <tr>
                    <!--Esta parte del codigo se puede hacer con un while dentro de otro while pero no llego con el tiemepo-->
                    <td>Áreas: 
                        <select name="area_Codigo" title="Seleccione el Área">
                        <%
                            auxiliar.open "select * from Prm_Area where Prm_Area_Vigencia=1",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parametros de Área</option>
                        <% 
                            else
                            do while not auxiliar.eof
                        %>
                            <option value="<%response.write(auxiliar("Prm_Area_Codigo"))%>"><%response.write(auxiliar("Prm_Area_Codigo"))%>-<%response.write(auxiliar("Prm_Area_Nombre"))%></option>
                        <%
                            auxiliar.movenext
                            loop
                            end if
                            auxiliar.close
                        %>
                        </select>
                    </td>
                    <td>Tipo Movimiento: 
                        <select name="tipoMov_codigo" title="Seleccione el Tipo de Movimiento">
                        <%
                            auxiliar.open "select * from Prm_TipoMovimiento where Prm_TipoMov_Vigencia=1",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parametros de Tipo de Movimiento</option>
                        <% 
                            else
                            do while not auxiliar.eof
                        %>
                            <option value="<%response.write(auxiliar("Prm_TipoMov_Codigo"))%>"><%response.write(auxiliar("Prm_TipoMov_Codigo"))%>-<%response.write(auxiliar("Prm_TipoMov_Nombre"))%></option>
                        <%
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
                        <select name="etapa_Codigo" title="Seleccione la Etapa">
                        <%
                            auxiliar.open "select * from Prm_Etapa where Prm_Etapa_Vigencia=1",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parametros de Etapa</option>
                        <% 
                            else
                            do while not auxiliar.eof
                        %>
                            <option value="<%response.write(auxiliar("Prm_Etapa_Codigo"))%>"><%response.write(auxiliar("Prm_Etapa_Codigo"))%>-<%response.write(auxiliar("Prm_Etapa_Nombre"))%></option>
                        <%
                            auxiliar.movenext
                            loop
                            end if
                            auxiliar.close
                        %>
                        </select>
                    </td>
                    <td>Estado
                        <select name="estado_Codigo" title="Seleccione el Estado">
                        <%
                            auxiliar.open "select * from Prm_Estado where Prm_Estado_Vigencia=1",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parametros de Estado</option>
                        <% 
                            else
                            do while not auxiliar.eof
                        %>
                            <option value="<%response.write(auxiliar("Prm_Estado_Codigo"))%>"><%response.write(auxiliar("Prm_Estado_Codigo"))%>-<%response.write(auxiliar("Prm_Estado_Nombre"))%></option>
                        <%
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
                        <select name="rol_Codigo" title="Seleccione el Rol">
                        <%
                            auxiliar.open "select * from Prm_Rol where Prm_Rol_Vigencia=1",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parametros de Rol</option>
                        <% 
                            else
                            dim numeroRol
                            do while not auxiliar.eof
                        %>
                            <option value="<%response.write(auxiliar("Prm_Rol_Codigo"))%>"><%response.write(auxiliar("Prm_Rol_Codigo"))%>-<%response.write(auxiliar("Prm_Rol_Nombre"))%></option>
                        <%
                            numeroRol=auxiliar("Prm_Rol_Codigo")
                            auxiliar.movenext
                            loop
                            numeroRol=numeroRol+1
                        %>
                            <option value="<%response.write(numeroRol)%>"><%response.write(numeroRol)%>-<%response.write("NO DEFINE")%></option>
                        <%
                            end if
                            auxiliar.close
                        %>
                        </select>
                    </td>
                    <td>Modelo de Escrito: 
                        <select name="tipoEscrito_Codigo" title="Seleccione el Modelo de Escrito">
                        <%
                            auxiliar.open "select * from Prm_TipoEscrito where Prm_TipoEscrito_Vigencia=1",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parametros de Modelo de Escrito</option>
                        <% 
                            else
                            do while not auxiliar.eof
                        %>
                            <option value="<%response.write(auxiliar("Prm_TipoEscrito_Codigo"))%>"><%response.write(auxiliar("Prm_TipoEscrito_Codigo"))%>-<%response.write(auxiliar("Prm_TipoEscrito_Nombre"))%></option>
                        <%
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
                        dim obligatorioQuery
                        obligatorioQuery=Request.QueryString("obligatorio")
                        if obligatorioQuery="SI" then
                        %>
                        <input type="text" name="obligatorio" value="1" hidden/>
                        <select name="obligatorioQuery" title="Seleccione el Modelo de Escrito" onchange="location = this.value">
                            <option selected value="/Parametros/EscritoHabilitado/Agregar/IngresoNuevoEscritoHabilitado.asp?obligatorio=SI">SI</option>
                            <option value="/Parametros/EscritoHabilitado/Agregar/IngresoNuevoEscritoHabilitado.asp?obligatorio=NO">NO</option> 
                        </select>
                        <%
                        else
                        %>
                        <input type="text" name="obligatorio" value="0" hidden/>
                        <select name="obligatorioQuery" title="Seleccione el Modelo de Escrito" onchange="location = this.value">
                            <option selected value="/Parametros/EscritoHabilitado/Agregar/IngresoNuevoEscritoHabilitado.asp?obligatorio=NO">NO</option> 
                            <option value="/Parametros/EscritoHabilitado/Agregar/IngresoNuevoEscritoHabilitado.asp?obligatorio=SI">SI</option>
                        </select>
                        <%
                        end if
                        %>
                    </td>
                    <td>Sector Firmante:
                        <%
                            if obligatorioQuery="SI" then
                        %>
                            <select name="sector_Codigo" title="Seleccione el Sector Firmante">
                        <%
                            auxiliar.open "select * from Prm_SectorFirmante where Prm_SectorFirmante_Vigencia=1",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parámetros de Sectores Firmantes</option>
                        <% 
                            else
                            do while not auxiliar.eof
                        %>
                            <option value="<%response.write(auxiliar("Prm_SectorFirmante_Codigo"))%>"><%response.write(auxiliar("Prm_SectorFirmante_Codigo"))%>-<%response.write(auxiliar("Prm_SectorFirmante_Nombre"))%></option>
                        <%
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
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="CrearEscritoHabilitado.asp" method="post">
                            <input type="submit" value="Crear" title="Crear Notificacion" class="btn-agregar" />
                        </form>
                    </div>
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="../RecuperarEscritosHabilitados.asp" method="post">
                            <input type="submit" value="Regresar" title="Regresar" class="btn-eliminar">
                        </form>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>