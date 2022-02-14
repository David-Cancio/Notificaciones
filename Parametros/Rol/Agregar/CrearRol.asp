<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
dim conexion
dim rol
set conexion=Server.CreateObject("ADODB.Connection")
set rol = Server.CreateObject("ADODB.RecordSet")
%>
<!--#include virtual="/connectionSQL.asp"-->
<!--#include virtual="/Partials/Validations.asp"-->
<%
conexion.open
dim rol_nombre
dim id
rol_nombre=MayusculaTodas(Request.form("rol_nombre"))
id=Request.form("id")
if rol_nombre="" Then
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
rol.open "select Rol_Codigo from Rol WHERE Rol_Nombre = '"&rol_nombre&"'",conexion
if rol.EOF then
    conexion.execute("insert into Rol (Rol_Nombre) VALUES('"&rol_nombre&"')")
    rol.Close
%>

        <h1>Los datos fueron agregados exitosamente</h1>
        <% Else%>
        <h1>Este Rol ya Existe</h1>
        <h2>Los datos no fueron Agregados</h2>
        <% End If
        conexion.close%>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="IngresoNuevoRol.asp" method="post">
                        <input type="submit" value="Agregar Otro" title="Agregue otra Rol" class="btn-agregar">
                    </form>
                </div>
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="../RecuperarRoles.asp" method="post">
                        <input type="submit" value="Regresar" title="Regresar>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>