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
            sectorFirmante.open "select * from SectorFirmante where SectorFirmante_Codigo='"&id&"'",conexion
            if sectorFirmante.eof then
        %>
        <meta http-equiv="<%response.write("refresh")%>" content="<%response.write("0; url=/./Default.asp")%>" />
        <%
            End If
        %>
<html>

    <!--#include virtual="/Partials/Head.asp"-->

<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">
        <h1>Eliminar Sector Firmante: <%response.Write(sectorFirmante("SectorFirmante_Nombre"))%>
        </h1>
        <table Class="tabla">
            <tr>
                <td></td>
                <td>Código:
                <td>
                    <%response.Write(sectorFirmante("SectorFirmante_Codigo"))%>
                </td>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>Nombre:
                </td>
                <td colspan="3">
                    <%response.Write(sectorFirmante("SectorFirmante_Nombre"))%>
                </td>
            </tr>
        </table>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="EliminarSectorFirmante.asp" method="post">
                        <input type="text" name="id" value="<%response.write(id)%>" hidden />
                        <input type="submit" value="Confirmar" title="Elimine el Sector Firmante" class="btn-eliminar">
                    </form>
                </div>
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="../RecuperarSectorFirmante.asp" method="post">
                        <input type="submit" value="Cancelar" title="Cancelar">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
