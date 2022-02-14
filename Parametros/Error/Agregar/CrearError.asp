<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
dim conexion
dim error
set conexion=Server.CreateObject("ADODB.Connection")
set error = Server.CreateObject("ADODB.RecordSet")
%>
<!--#include virtual="/connectionSQL.asp"-->
<!--#include virtual="/Partials/Validations.asp"-->
<%
conexion.open
dim error_nombre
dim error_descripcion
dim error_codigo
dim id
error_nombre=MayusculaPrimera(Request.form("error_nombre"))
error_descripcion=MayusculaPrimera(Request.form("error_descripcion"))
error_codigo=Request.form("error_descripcion")
id=Request.form("id")
if error_nombre="" Then
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
tipoEscrito.open "select TipoEscrito_Nombre from TipoEscrito WHERE TipoEscrito_Nombre = '"&tipoEscrito_nombre&"'",conexion
if error.EOF then
    conexion.execute("insert into Error (Error_Nombre, Error_Descripcion, Error_Codigo) VALUES('"&error_nombre&"','"&error_descripcion&"','"&error_codigo&"')")
    error.Close
%>

        <h1>Los datos fueron agregados exitosamente</h1>
        <% Else%>
        <h1>Este Error ya Existe</h1>
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
                    <form action="../RecuperarTipoEscritos.asp" method="post">
                        <input type="submit" value="Regresar" title="Regresar" />
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>