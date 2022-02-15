<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
dim conexion
dim auxiliar
set conexion=Server.CreateObject("ADODB.Connection")
set auxiliar = Server.CreateObject("ADODB.RecordSet")
dim tipoEscrito_Codigo
tipoEscrito_Codigo=Request.form("tipoEscrito_Codigo")
dim area_Codigo
area_Codigo=Request.form("area_Codigo")
dim tipoMov_Codigo
tipoMov_Codigo=Request.form("tipoMov_Codigo")
dim etapa_Codigo
etapa_Codigo=Request.form("etapa_Codigo")
dim estado_Codigo
estado_Codigo=Request.form("estado_Codigo")
dim rol_Codigo
rol_Codigo=Request.form("rol_Codigo")
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
        <form action="IngresoNuevaNotificacion.asp" method="post">
            <h1>Ingrese una nueva Notificación</h1>
            <table Class="tabla">
                <tr>
                    <!--Esta parte del codigo se puede hacer con un while dentro de otro while pero no llego con el tiemepo-->
                    <td>Áreas: 
                    <%
                        if not isnull(area_Codigo) and not isEmpty(area_Codigo) then
                    %>
                        <select name="area_Codigo" title="Seleccione el Área">
                        <%
                            auxiliar.open "select * from Prm_Area",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parámetros de Área</option>
                        <% 
                            else
                            do while not auxiliar.eof
                            if (auxiliar("Prm_Area_Codigo")) = Cint(area_Codigo) then
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
                    <%
                        else
                    %>
                        <select name="area_Codigo" title="Seleccione el Área">
                        <%
                            auxiliar.open "select * from Prm_Area",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parámetros de Área</option>
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
                    <%
                        end if
                    %>
                    </td>
                    <td>Tipo Movimiento: 
                    <%
                        if not isnull(tipoMov_Codigo) and not isEmpty(tipoMov_Codigo) then
                    %>
                        <select name="tipoMov_Codigo" title="Seleccione el Tipo de Movimiento">
                        <%
                            auxiliar.open "select * from Prm_TipoMovimiento",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parámetros de Tipo de Movimiento</option>
                        <% 
                            else
                            do while not auxiliar.eof
                            if (auxiliar("Prm_TipoMov_Codigo")) = Cint(TipoMov_Codigo) then
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
                    <%
                        else
                    %>
                        <select name="tipoMov_codigo" title="Seleccione el Tipo de Movimiento">
                        <%
                            auxiliar.open "select * from Prm_TipoMovimiento",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parámetros de Tipo de Movimiento</option>
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
                    <%
                        end if
                    %>
                    </td>
                </tr>
                <tr>
                    <td>Etapa: 
                    <%
                        if not isnull(etapa_Codigo) and not isEmpty(etapa_Codigo) then
                    %>
                        <select name="etapa_Codigo" title="Seleccione el Etapa">
                        <%
                            auxiliar.open "select * from Prm_Etapa",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parámetros de Etapa</option>
                        <% 
                            else
                            do while not auxiliar.eof
                            if (auxiliar("Prm_Etapa_Codigo")) = Cint(etapa_Codigo) then
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
                    <%
                        else
                    %>
                        <select name="etapa_Codigo" title="Seleccione la Etapa">
                        <%
                            auxiliar.open "select * from Prm_Etapa",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parámetros de Etapa</option>
                        <% 
                            else
                            do while not auxiliar.eof
                        %>
                            <option value="<%response.write(auxiliar("Etapa_Codigo"))%>"><%response.write(auxiliar("Etapa_Codigo"))%>-<%response.write(auxiliar("Etapa_Nombre"))%></option>
                        <%
                            auxiliar.movenext
                            loop
                            end if
                            auxiliar.close
                        %>
                        </select>
                    <%
                        end if
                    %>
                    </td>
                    <td>Estado:
                    <%
                        if not isnull(estado_Codigo) and not isEmpty(estado_Codigo) then
                    %>
                        <select name="estado_Codigo" title="Seleccione el Estado">
                        <%
                            auxiliar.open "select * from Prm_Estado",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parámetros de Estado</option>
                        <% 
                            else
                            do while not auxiliar.eof
                            if (auxiliar("Prm_Estado_Codigo")) = Cint(estado_Codigo) then
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
                    <%
                        else
                    %>
                        <select name="estado_Codigo" title="Seleccione el Estado"AAAA>
                        <%
                            auxiliar.open "select * from Prm_Estado",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parámetros de Estado</option>
                        <% 
                            else
                            do while not auxiliar.eof
                        %>
                            <option value="<%response.write(auxiliar("Estado_Codigo"))%>"><%response.write(auxiliar("Estado_Codigo"))%>-<%response.write(auxiliar("Estado_Nombre"))%></option>
                        <%
                            auxiliar.movenext
                            loop
                            end if
                            auxiliar.close
                        %>
                        </select>
                    <%
                        end if
                    %>
                    </td>
                </tr>
                <tr>
                    <td>Rol: 
                    <%
                        if not isnull(rol_Codigo) and not isEmpty(rol_Codigo) then
                    %>
                        <select name="rol_Codigo" title="Seleccione el Rol">
                        <%
                            auxiliar.open "select * from Prm_Rol",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parámetros de Rol</option>
                        <% 
                            else
                            do while not auxiliar.eof
                            if (auxiliar("Prm_Rol_Codigo")) = Cint(rol_Codigo) then
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
                    <%
                        else
                    %>
                        <select name="rol_Codigo" title="Seleccione el Rol">
                        <%
                            auxiliar.open "select * from Prm_Rol",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parámetros de Rol</option>
                        <% 
                            else
                            do while not auxiliar.eof
                        %>
                            <option value="<%response.write(auxiliar("Rol_Codigo"))%>"><%response.write(auxiliar("Rol_Codigo"))%>-<%response.write(auxiliar("Rol_Nombre"))%></option>
                        <%
                            auxiliar.movenext
                            loop
                            end if
                            auxiliar.close
                        %>
                        </select>
                    <%
                        end if
                    %>
                    </td>
                    <td>Cuit del Demandado
                    </td>
                </tr>
            </table>
            <h2>Escritos</h2>
            <table Class="tabla">
                <tr>
                    <!--Esta parte del codigo se puede hacer con un while dentro de otro while pero no llego con el tiemepo-->
                    <td>Escrito: 
                    <%
                        if not isnull(tipoEscrito_Codigo) and not isEmpty(tipoEscrito_Codigo) then
                    %>
                        <select name="tipoEscrito_Codigo" title="Seleccione el Tipo de Escrito">
                        <%
                            auxiliar.open "select * from Prm_TipoEscrito",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parámetros de Escrito</option>
                        <% 
                            else
                            do while not auxiliar.eof
                            if (auxiliar("Prm_TipoEscrito_Codigo")) = Cint(tipoEscrito_Codigo) then
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
                    <%
                        else
                    %>
                        <select name="tipoEscrito_Codigo" title="Seleccione el Tipo de Escrito">
                        <%
                            auxiliar.open "select * from Prm_TipoEscrito",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parámetros de Tipos de Escritos</option>
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
                    <%
                        end if
                    %>
                    </td>
                    <td>
                        <form action="IngresoNuevaNotificacion.asp" method="post">
                            <input type="submit" value="Cargar" title="Cargar Tipo de Escrito" class="btn-agregar" />
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>Tipo de Archivo: 
                    <%
                        if isnull(tipoEscrito_Codigo) or isEmpty(tipoEscrito_Codigo) then
                    %>
                        <select disabled></select>
                    <%
                        else
                    %>
                        <select name="tipoEscrito_tipoArchivo" title="Seleccione el Tipo de Archivo">

                        <%
                            auxiliar.open "select * from Prm_TipoEscrito WHERE Prm_TipoEscrito_Codigo = '"&tipoEscrito_Codigo&"'",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parámetros de Tipo de Escrito</option>
                        <% 
                            else
                            do while not auxiliar.eof
                        %>
                            <option value="<%response.write(auxiliar("Prm_TipoEscrito_Codigo"))%>"><%response.write(auxiliar("Prm_TipoEscrito_Codigo"))%>-<%response.write(auxiliar("Prm_TipoEscrito_TipoArchivo"))%></option>
                        <%
                            auxiliar.movenext
                            loop
                            end if
                            auxiliar.close
                        %>
                        </select>
                        <%
                        end if
                        %>
                    </td>
                    <td>Extensión: 
                    <%
                        if isnull(tipoEscrito_Codigo) or isEmpty(tipoEscrito_Codigo) then
                    %>
                        <select disabled></select>
                    <%
                        else
                    %>
                        <select name="tipoEscrito_Extension" title="Seleccione la Extensión">

                        <%
                            auxiliar.open "select * from Prm_TipoEscrito WHERE Prm_TipoEscrito_Codigo = '"&tipoEscrito_Codigo&"'",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parámetros de Tipo de Escrito</option>
                        <% 
                            else
                            do while not auxiliar.eof
                        %>
                            <option value="<%response.write(auxiliar("Prm_TipoEscrito_Codigo"))%>"><%response.write(auxiliar("Prm_TipoEscrito_Codigo"))%>-<%response.write(auxiliar("Prm_TipoEscrito_Extension"))%></option>
                        <%
                            auxiliar.movenext
                            loop
                            end if
                            auxiliar.close
                        %>
                        </select>
                        <%
                        end if
                        %>
                    </td>
                </tr>
            </table>
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="CrearNotificacion.asp" method="post">
                            <input type="submit" value="Crear" title="Crear Notificacion" class="btn-agregar" />
                        </form>
                    </div>
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="../RecuperarNotificaciones.asp" method="post">
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