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
prm_sectorFirmante.open "select Prm_SectorFirmante_Codigo, Prm_SectorFirmante_Vigencia from Prm_SectorFirmante WHERE Prm_SectorFirmante_Nombre = '"&prm_sectorFirmante_nombre&"'",conexion
if prm_sectorFirmante.EOF then
    conexion.execute("insert into Prm_SectorFirmante (Prm_SectorFirmante_Nombre) VALUES('"&prm_sectorFirmante_nombre&"')")
    prm_sectorFirmante.Close
%>

        <h1>Los datos fueron Agregados Exitosamente</h1>
        <% 
            Else
            If prm_sectorFirmante("Prm_SectorFirmante_Vigencia")=0 then
                conexion.execute("UPDATE Prm_SectorFirmante SET Prm_SectorFirmante_Vigencia=1 where Prm_SectorFirmante_Codigo='"&prm_sectorFirmante("Prm_SectorFirmante_Codigo")&"'")
        %>
        <h1>Este Sector Firmante ya Existia y se volvio a Habilitar</h1>
        <h2>Los datos fueron Agregados</h2>
        <%
            Else
        %>
            <h1>Este Sector Firmante ya Existe</h1>
            <h2>Los datos no fueron Agregados</h2>
        <% 
            End If
            End If
            conexion.close
        %>
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