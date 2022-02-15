<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
dim conexion
dim prm_error
set conexion=Server.CreateObject("ADODB.Connection")
set prm_error = Server.CreateObject("ADODB.RecordSet")
%>
<!--#include virtual="/connectionSQL.asp"-->
<!--#include virtual="/Partials/Validations.asp"-->
<%
conexion.open
dim prm_error_nombre
dim prm_error_descripcion
dim prm_error_codigo
dim id
prm_error_nombre=MayusculaPrimera(Request.form("prm_error_nombre"))
prm_error_descripcion=MayusculaPrimera(Request.form("prm_error_descripcion"))
prm_error_codigo=Request.form("prm_error_codigo")
id=Request.form("id")
if prm_error_nombre="" Then
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
prm_error.open "select Prm_Error_Codigo from Prm_Error WHERE Prm_Error_Codigo = '"&prm_error_codigo&"'",conexion
if prm_error.EOF then
    conexion.execute("insert into Prm_Error (Prm_Error_Nombre, Prm_Error_Descripcion, Prm_Error_Codigo) VALUES('"&prm_error_nombre&"','"&prm_error_descripcion&"','"&prm_error_codigo&"')")
    prm_error.Close
%>

        <h1>Los datos fueron agregados exitosamente</h1>
        <% Else%>
        <h1>Este Codigo de Error ya Existe</h1>
        <h2>Los datos no fueron Agregados</h2>
        <% End If
        conexion.close%>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="IngresoNuevoError.asp" method="post">
                        <input type="submit" value="Agregar Otro" title="Agregue otro Error" class="btn-agregar">
                    </form>
                </div>
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="../RecuperarError.asp" method="post">
                        <input type="submit" value="Regresar" title="Regresar" />
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>