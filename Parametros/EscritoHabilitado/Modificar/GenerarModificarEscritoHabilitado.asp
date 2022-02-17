<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim escritoHb
            dim sector_Firmante
            dim auxiliar
            set conexion=Server.CreateObject("ADODB.Connection")
            set escritoHb = Server.CreateObject("ADODB.RecordSet")
            set sector_Firmante = Server.CreateObject("ADODB.RecordSet")
            set auxiliar = Server.CreateObject("ADODB.RecordSet")
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
            Else
            dim area_Codigo, etapa_Codigo, estado_Codigo, tipoMov_Codigo, rol_Codigo, modeloEscrito_Codigo, obligatorio, sector_escritoHb
            area_Codigo=escritoHb("Prm_EscritoHB_Area")
            etapa_Codigo=escritoHb("Prm_EscritoHB_Etapa")
            estado_Codigo=escritoHb("Prm_EscritoHB_Estado")
            tipoMov_Codigo=escritoHb("Prm_EscritoHB_TipoMov")
            rol_Codigo=escritoHb("Prm_EscritoHB_Rol")
            modeloEscrito_Codigo=escritoHb("Prm_EscritoHB_ModeloEscrito")
            sector_EscritoHb=escritoHb("Prm_EscritoHB_Codigo")
            obligatorio=escritoHb("Prm_EscritoHB_obligatorio")
            sector_Firmante.open "select Prm_FirmaPorSector_Firmante from Prm_FirmaPorSector where Prm_FirmaPorSector_EscritoHabilitados='"&sector_EscritoHb&"'",conexion

        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">
        <form action="ModificarEscritoHabilitado.asp" method="post">
            <input type="text" name="id" value="<%response.write(id) %>" hidden />
            <h1>
                Modificar Escrito Habilitado
            </h1>
            <table Class="tabla">
                <tr>
                    <!--Esta parte del codigo se puede hacer con un while dentro de otro while pero no llego con el tiemepo-->
                    <td>Áreas: 
                        <select name="area_Codigo" title="Seleccione el Área">
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
                        <select name="tipoMov_codigo" title="Seleccione el Tipo de Movimiento">
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
                        <select name="etapa_Codigo" title="Seleccione la Etapa">
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
                        <select name="estado_Codigo" title="Seleccione el Estado">
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
                        <select name="rol_Codigo" title="Seleccione el Rol">
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
                            dim numeroRol
                            numeroRol=auxiliar("Prm_Rol_Codigo")
                            auxiliar.movenext
                            loop
                            numeroRol=numeroRol+1
                        %>
                            <option value="<%response.write(numeroRol)%>"><%response.write(numeroRol)%>-<%response.write("NO DEFINE")%></option>
                        <%
                            auxiliar.close
                        %>
                        </select>
                    </td>
                    <td>Modelo de Escrito: 
                        <select name="tipoEscrito_Codigo" title="Seleccione el Modelo de Escrito">
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
                        dim obligatorio2
                        obligatorio2=Request.QueryString("obligatorio")
                        response.write(obligatorio2)
                        %>
                        <select name="obligatorio2" title="Seleccione el Modelo de Escrito" onchange="location = this.value">
                            <%
                            if obligatorio="SI" then
                            %>
                            <option selected value="/Parametros/EscritoHabilitado/Modificar/GenerarModificarEscritoHabilitado.asp?id=<%response.write(id)%>&obligatorio=SI">SI</option>
                            <option value="/Parametros/EscritoHabilitado/Modificar/GenerarModificarEscritoHabilitado.asp?id=<%response.write(id)%>obligatorio=NO">NO</option> 
                            <%
                            else
                            %>
                            <option selected value="/Parametros/EscritoHabilitado/Modificar/GenerarModificarEscritoHabilitado.asp?id=<%response.write(id)%>&obligatorio=NO">NO</option> 
                            <option value="/Parametros/EscritoHabilitado/Modificar/GenerarModificarEscritoHabilitado.asp?id=<%response.write(id)%>&obligatorio=SI">SI</option>
                            <%
                            end if
                            %>
                        </select>
                    </td>
                    <td>Sector Firmante: 
                        <%
                            if obligatorio2="SI" then
                        %>
                        <select name="sector_Codigo" title="Seleccione el Sector Firmante">
                        <%
                            auxiliar.open "select * from Prm_SectorFirmante where Prm_SectorFirmante_Vigencia=1",conexion
                            if auxiliar.eof then
                        %>
                            <option value="0">No hay Parametros de Sectores Firmantes</option>
                        <% 
                            else
                        %>
                            <option value="0" selected>-</option>
                        <%
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
                        <form action="ModificarEscritoHabilitado.asp" method="post">
                            <input type="submit" value="Modificar" title="Confirme la modificación" class="btn-agregar"/>
                        </form>
                    </div>
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="../RecuperarEscritosHabilitados.asp" method="post">
                            <input type="submit" value="Regresar" title="Vuelva al listado de Escritos Habilitados">
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
