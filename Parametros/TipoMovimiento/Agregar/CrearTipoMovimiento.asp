<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
dim conexion
dim movimiento
set conexion=Server.CreateObject("ADODB.Connection")
set movimiento = Server.CreateObject("ADODB.RecordSet")
%>
<!--#include virtual="/connectionSQL.asp"-->
<!--#include virtual="/Partials/Validations.asp"-->
<%
conexion.open
dim tipoMov_nombre
dim id
tipoMov_nombre=MayusculaTodas(Request.form("tipoMov_nombre"))
id=Request.form("id")
if tipoMov_nombre="" Then
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
movimiento.open "select Prm_TipoMov_Codigo from Prm_TipoMovimiento WHERE Prm_TipoMov_Nombre = '"&tipoMov_nombre&"'",conexion
if movimiento.EOF then
    conexion.execute("insert into Prm_TipoMovimiento (Prm_TipoMov_Nombre) VALUES('"&tipoMov_nombre&"')")
    movimiento.Close
%>

        <h1>Los datos fueron agregados exitosamente</h1>
        <% Else%>
        <h1>Este Movimiento ya Existe</h1>
        <h2>Los datos no fueron Agregados</h2>
        <% End If
        conexion.close%>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="IngresoNuevoTipoMovimiento.asp" method="post">
                        <input type="submit" value="Agregar Otro" title="Agregue otro Movimiento" class="btn-agregar">
                    </form>
                </div>
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="../RecuperarTipoMovimientos.asp" method="post">
                        <input type="submit" value="Regresar" title="Regresar">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>