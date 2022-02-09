<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
dim conexion
dim area
set conexion=Server.CreateObject("ADODB.Connection")
set area = Server.CreateObject("ADODB.RecordSet")
%>
<!--#include virtual="/connectionSQL.asp"-->
<%conexion.open
dim area_nombre
dim id
dim area_descripcion
area_nombre=Request.form("area_nombre")
id=Request.form("id")
area_descripcion=Request.form("area_descripcion")
if area_nombre="" Then
%>
    <meta http-equiv="<%response.write("refresh")%>" content="<%response.write("0; url=/./Default.asp")%>" />
<%
end if
area.open "select Area_Codigo from Area WHERE Area_Nombre = '"&area_nombre&"'",conexion
if area.EOF then
    conexion.execute("insert into Area (Area_Nombre,Area_Descripcion) VALUES('"&area_nombre&"','"&area_descripcion&"')")
    area.Close
%>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div>
        <h1>Los datos fueron agregados exitosamente</h1>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-4 py-2">
                    <form action="IngresoNuevoArea.asp" method="post">
                        <input type="submit" value="Agregar Otra" title="Agregue otra Área"><br>
                    </form>
                </div>
                <div class="col-sm-7 col-md-4 py-2">
                    <form action="../RecuperarAreas.asp" method="post">
                        <input type="submit" value="Listado de Áreas" title="Vuelva al listado de Áreas">
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<%
Else
%>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="fondo">
        <h1>Este Área ya Existe</h1>
        <h2>Los datos no fueron Agregados</h2>
        <div class="contenedor">
            <div class="row">
                <div class="col-sm-7 col-md-4 py-2">
                    <form action="IngresoNuevoArea.asp" method="post">
                        <input type="submit" value="Agregar Otra" title="Agregue otro Area"><br>
                    </form>
                </div>
                <div class="col-sm-7 col-md-4 py-2">
                    <form action="../RecuperarAreas.asp" method="post">
                        <input type="submit" value="Listado de Areas" title="Vuelva al listado de Areas">
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
   <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</html>
<%
End If
conexion.close
%>