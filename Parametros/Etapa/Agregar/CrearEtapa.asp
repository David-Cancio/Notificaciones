<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
dim conexion
dim etapa
set conexion=Server.CreateObject("ADODB.Connection")
set area = Server.CreateObject("ADODB.RecordSet")
%>
<!--#include virtual="/connectionSQL.asp"-->
<!--#include virtual="/Partials/Validations.asp"-->
<%
conexion.open
dim etapa_nombre
dim id
dim area_descripcion
area_nombre=MayusculaTodas(Request.form("area_nombre"))
id=Request.form("id")
if area_nombre="" Then
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
area.open "select Area_Codigo from Area WHERE Area_Nombre = '"&area_nombre&"'",conexion
if area.EOF then
    conexion.execute("insert into Area (Area_Nombre) VALUES('"&area_nombre&"')")
    area.Close
%>

        <h1>Los datos fueron agregados exitosamente</h1>
        <% Else%>
        <h1>Este Área ya Existe</h1>
        <h2>Los datos no fueron Agregados</h2>
        <% End If
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
                        <input type="submit" value="Listado de Áreas" title="Vuelva al listado de Áreas">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>