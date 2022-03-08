<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim prm_sectorFirmante
            set conexion=Server.CreateObject("ADODB.Connection")
            set prm_sectorFirmante = Server.CreateObject("ADODB.RecordSet")
        %> 
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            prm_sectorFirmante.open "select * from Prm_SectorFirmante where Prm_SectorFirmante_Codigo='"&id&"'",conexion
            if prm_sectorFirmante.eof then
        %>
        <meta http-equiv="<%response.write("refresh")%>" content="<%response.write("0; url=/./Default.asp")%>" />
        <%
            Else
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">
        <form action="ModificarSectorFirmante.asp" method="post">
            <input type="text" name="id" value="<%response.write(id) %>" hidden />
            <h1>
                Modificar Sector Firmante
            </h1>
            <table Class="tabla">
                <tr>
                    <td colspan="2" class="medio">Nombre del Estado:
                            <input type="text" name="prm_sectorFirmante_nombre" size="40" required pattern="[A-ZÑ,Á,É,Í,Ó,Ú]{1}[a-zA-Z\sñ,á,é,í,ó,ú,ü]{1,}" title="Indique el Nombre del Sector Firmante" value="<%response.write(prm_sectorFirmante("Prm_SectorFirmante_Nombre"))%>"/>
                    </td>
                </tr>
            </table>
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="ModificarSectorFirmante.asp" method="post">
                            <input type="submit" value="Modificar" title="Confirme la modificación" class="btn-agregar"/>
                        </form>
                    </div>
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="../RecuperarSectorFirmante.asp" method="post">
                            <input type="submit" value="Cancelar" title="Cancelar" class="btn-eliminar" >
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
