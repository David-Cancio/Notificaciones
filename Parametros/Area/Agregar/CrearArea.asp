<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
dim conexion
dim prm_area
set conexion=Server.CreateObject("ADODB.Connection")
set prm_area = Server.CreateObject("ADODB.RecordSet")
%>
<!--#include virtual="/connectionSQL.asp"-->
<!--#include virtual="/Partials/Validations.asp"-->
<%
conexion.open
dim prm_area_nombre

prm_area_nombre=MayusculaTodas(Request.form("Prm_Area_nombre"))

if prm_area_nombre="" Then
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
prm_area.open "select Prm_Area_Codigo, Prm_Area_Vigencia from Prm_Area WHERE Prm_Area_Nombre = '"&prm_area_nombre&"'",conexion
if prm_area.EOF then
    conexion.execute("insert into Prm_Area (Prm_Area_Nombre) VALUES('"&prm_area_nombre&"')")
    prm_area.Close
%>

        <h1>Los datos fueron Agregados Exitosamente</h1>
        <%
         Else
         If prm_area("Prm_Area_Vigencia")=0 then
          conexion.execute("UPDATE Prm_Area SET Prm_Area_Vigencia=1 where Prm_Area_Codigo='"&prm_area("Prm_Area_Codigo")&"'")
        %>
        <h1>Este Área ya Existia y se volvio a Habilitar</h1>
        <h2>Los datos fueron Agregados</h2>
        <%Else%>
            <h1>Este Área ya Existe</h1>
            <h2>Los datos no fueron Agregados</h2>
        <% End If
            End If
        conexion.close%>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="IngresoNuevoArea.asp" method="post">
                        <input type="submit" value="Agregar Otra" title="Agregue otra Área" class="btn-agregar">
                    </form>
                </div>
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="../RecuperarAreas.asp" method="post">
                        <input type="submit" value="Regresar" title="Regresar">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>