<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
dim conexion
dim tipoEscrito
set conexion=Server.CreateObject("ADODB.Connection")
set tipoEscrito = Server.CreateObject("ADODB.RecordSet")
%>
<!--#include virtual="/connectionSQL.asp"-->
<!--#include virtual="/Partials/Validations.asp"-->
<%
conexion.open
dim tipoEscrito_nombre
dim tipoEscrito_tipoArchivo
dim tipoEscrito_modelo
dim id
tipoEscrito_nombre=MayusculaTodas(Request.form("tipoEscrito_nombre"))
tipoEscrito_tipoArchivo=MayusculaTodas(Request.form("tipoEscrito_tipoArchivo"))
tipoEscrito_modelo=MayusculaTodas(Request.form("tipoEscrito_modelo"))
id=Request.form("id")
if tipoEscrito_nombre="" Then
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
if tipoEscrito.EOF then
    conexion.execute("insert into TipoEscrito (TipoEscrito_Nombre, TipoEscrito_tipoArchivo, TipoEscrito_Modelo) VALUES('"&tipoEscrito_nombre&"','"&tipoEscrito_tipoArchivo&"','"&tipoEscrito_modelo&"')")
    tipoEscrito.Close
%>

        <h1>Los datos fueron agregados exitosamente</h1>
        <% Else%>
        <h1>Este Tipo de Escrito ya Existe</h1>
        <h2>Los datos no fueron Agregados</h2>
        <% End If
        conexion.close%>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="IngresoNuevoTipoEscrito.asp" method="post">
                        <input type="submit" value="Agregar Otra" title="Agregue otro Tipo de Escrito" class="btn-agregar">
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