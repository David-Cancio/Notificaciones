<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
dim conexion
dim estado
set conexion=Server.CreateObject("ADODB.Connection")
set estado = Server.CreateObject("ADODB.RecordSet")
%>
<!--#include virtual="/connectionSQL.asp"-->
<!--#include virtual="/Partials/Validations.asp"-->
<%
conexion.open
dim estado_nombre
dim id
estado_nombre=MayusculaTodas(Request.form("estado_nombre"))
id=Request.form("id")
if estado_nombre="" Then
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
estado.open "select Estado_Codigo from Estado WHERE Estado_Nombre = '"&estado_nombre&"'",conexion
if estado.EOF then
    conexion.execute("insert into Estado (Estado_Nombre) VALUES('"&estado_nombre&"')")
    estado.Close
%>

        <h1>Los datos fueron agregados exitosamente</h1>
        <% Else%>
        <div class="center">
            <h1>Este Estado ya Existe</h1>
            <h2>Los datos no fueron Agregados</h2>
        </div>
        <% End If
        conexion.close%>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="IngresoNuevoEstado.asp" method="post">
                        <input type="submit" value="Agregar Otra" title="Agregue otro Estado" class="btn-agregar">
                    </form>
                </div>
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="../RecuperarEstados.asp" method="post">
                        <input type="submit" value="Listado de Estados" title="Vuelva al listado de Estados">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>