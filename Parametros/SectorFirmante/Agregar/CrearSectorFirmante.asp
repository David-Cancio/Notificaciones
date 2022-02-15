<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
dim conexion
dim prm_sectorFirmante
set conexion=Server.CreateObject("ADODB.Connection")
set prm_sectorFirmante = Server.CreateObject("ADODB.RecordSet")
%>
<!--#include virtual="/connectionSQL.asp"-->
<!--#include virtual="/Partials/Validations.asp"-->
<%
conexion.open
dim prm_sectorFirmante_nombre
dim id
prm_sectorFirmante_nombre=MayusculaTodas(Request.form("prm_sectorFirmante_nombre"))
id=Request.form("id")
if prm_sectorFirmante_nombre="" Then
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
prm_sectorFirmante.open "select Prm_SectorFirmante_Codigo from Prm_SectorFirmante WHERE Prm_SectorFirmante_Nombre = '"&prm_sectorFirmante_nombre&"'",conexion
if prm_sectorFirmante.EOF then
    conexion.execute("insert into Prm_SectorFirmante (Prm_SectorFirmante_Nombre) VALUES('"&prm_sectorFirmante_nombre&"')")
    prm_sectorFirmante.Close
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
                        <input type="submit" value="Regresar" title="Regresar" />
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>