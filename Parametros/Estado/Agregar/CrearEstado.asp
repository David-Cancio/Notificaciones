<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
dim conexion
dim prm_estado
set conexion=Server.CreateObject("ADODB.Connection")
set prm_estado = Server.CreateObject("ADODB.RecordSet")
%>
<!--#include virtual="/connectionSQL.asp"-->
<!--#include virtual="/Partials/Validations.asp"-->
<%
conexion.open
dim prm_estado_nombre

prm_estado_nombre=MayusculaTodas(Request.form("prm_estado_nombre"))

if prm_estado_nombre="" Then
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
prm_estado.open "select Prm_Estado_Codigo, Prm_Estado_Vigencia from Prm_Estado WHERE Prm_Estado_Nombre = '"&prm_estado_nombre&"'",conexion
if prm_estado.EOF then
    conexion.execute("insert into Prm_Estado (Prm_Estado_Nombre) VALUES('"&prm_estado_nombre&"')")
    prm_estado.Close
%>

        <h1>Los datos fueron agregados exitosamente</h1>
        <% Else
            If prm_estado("Prm_Estado_Vigencia")=0 then
          conexion.execute("UPDATE Prm_Estado SET Prm_Estado_Vigencia=1 where Prm_Estado_Codigo='"&prm_estado("Prm_Estado_Codigo")&"'")
        %>
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
                        <input type="submit" value="Cancelar" title="Cancelar" class="btn-eliminar" >
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>