<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
dim conexion
dim sectorFirmante
set conexion=Server.CreateObject("ADODB.Connection")
set sectorFirmante = Server.CreateObject("ADODB.RecordSet")
%>
<!--#include virtual="/connectionSQL.asp"-->
<!--#include virtual="/Partials/Validations.asp"-->
<%
conexion.open
dim sectorFirmante_nombre
dim id
sectorFirmante_nombre=MayusculaTodas(Request.form("sectorFirmante_nombre"))
id=Request.form("id")
if sectorFirmante_nombre="" Then
%>
    <meta http-equiv="<%response.write("refresh")%>" content="<%response.write("0; url=/./Default.asp")%>" />
<%
end if
%>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
<%
sectorFirmante.open "select SectorFirmante_Codigo from SectorFirmante WHERE SectorFirmante_Nombre = '"&sectorFirmante_nombre&"'",conexion
if sectorFirmante.EOF then
    conexion.execute("insert into SectorFirmante (SectorFirmante_Nombre) VALUES('"&sectorFirmante_nombre&"')")
    sectorFirmante.Close
%>

        <h1>Los datos fueron agregados exitosamente</h1>
        <% Else%>
        <div class="center">
            <h1>Este Sector Firmante ya Existe</h1>
            <h2>Los datos no fueron Agregados</h2>
        </div>
        <% End If
        conexion.close%>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="IngresoNuevoSectorFirmante.asp" method="post">
                        <input type="submit" value="Agregar Otra" title="Agregue otro Sector Firmante" class="btn-agregar">
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
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>