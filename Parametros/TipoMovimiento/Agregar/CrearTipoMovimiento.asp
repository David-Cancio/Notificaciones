<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
dim conexion
dim tipoMovimiento
set conexion=Server.CreateObject("ADODB.Connection")
set tipoMovimiento = Server.CreateObject("ADODB.RecordSet")
%>
<!--#include virtual="/connectionSQL.asp"-->
<!--#include virtual="/Partials/Validations.asp"-->
<%conexion.open
dim tipoMov_nombre
dim id
tipoMov_nombre=MayusculaTodas(Request.form("tipoMov_nombre"))
id=Request.form("id")
if tipoMov_nombre="" Then
%>
    <meta http-equiv="<%response.write("refresh")%>" content="<%response.write("0; url=/./Default.asp")%>" />
<%
end if
tipoMovimiento.open "select TipoMov_Codigo from TipoMovimiento WHERE TipoMov_Nombre = '"&tipoMov_nombre&"'",conexion
if tipoMovimiento.EOF then
    conexion.execute("insert into TipoMovimiento (TipoMov_Nombre) VALUES('"&tipoMov_nombre&"')")
    tipoMovimiento.Close
%>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
        <h1>Los datos fueron agregados exitosamente</h1>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-4 py-2">
                    <form action="IngresoNuevoTipoMovimiento.asp" method="post">
                        <input type="submit" value="Agregar Otro" title="Agregue otro Movimiento"><br>
                    </form>
                </div>
                <div class="col-sm-7 col-md-4 py-2">
                    <form action="../RecuperarTipoMovimientos.asp" method="post">
                        <input type="submit" value="Listado de Movimientos" title="Vuelva al listado de Movimientos">
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

    <div class="listado">
        <h1>Este Movimiento ya Existe</h1>
        <h2>Los datos no fueron Agregados</h2>
        <div class="contenedor">
            <div class="row">
                <div class="col-sm-7 col-md-4 py-2">
                    <form action="IngresoNuevoArea.asp" method="post">
                        <input type="submit" value="Agregar Otro" title="Agregue otro Movimiento"><br>
                    </form>
                </div>
                <div class="col-sm-7 col-md-4 py-2">
                    <form action="../RecuperarTipoMovimientos.asp" method="post">
                        <input type="submit" value="Listado de Movimientos" title="Vuelva al listado de Movimientos">
                    </form>
                </div>
            </div>
        </div>
    </div>
   <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
<%
End If
conexion.close
%>