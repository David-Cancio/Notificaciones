<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim sectorFirmante
            set conexion=Server.CreateObject("ADODB.Connection")
            set sectorFirmante = Server.CreateObject("ADODB.RecordSet")
        %> 
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            sectorFirmante.open "select * from sectorFirmante where SectorFirmante_Codigo='"&id&"'",conexion
            if sectorFirmante.eof then
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
                    <td colspan="2">Nombre del Estado:
                            <input type="text" name="sectorFirmante_nombre" size="40" required pattern="[A-ZÑ,Á,É,Í,Ó,Ú]{1}[a-zA-Z\sñ,á,é,í,ó,ú,ü]{1,}" title="Indique el Nombre del Sector Firmante" value="<%response.write(sectorFirmante("SectorFirmante_Nombre"))%>"/>
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
                            <input type="submit" value="Listado de Sector Firmante" title="Vuelva al listado de Sector Firmante">
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
