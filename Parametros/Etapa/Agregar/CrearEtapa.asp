<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
dim conexion
dim etapa
set conexion=Server.CreateObject("ADODB.Connection")
set etapa = Server.CreateObject("ADODB.RecordSet")
%>
<!--#include virtual="/connectionSQL.asp"-->
<!--#include virtual="/Partials/Validations.asp"-->
<%
conexion.open
dim etapa_nombre
dim id

etapa_nombre=MayusculaTodas(Request.form("etapa_nombre"))
id=Request.form("id")
if etapa_nombre="" Then
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
etapa.open "select Etapa_Codigo from Etapa WHERE Etapa_Nombre = '"&etapa_nombre&"'",conexion
if etapa.EOF then
    conexion.execute("insert into Etapa (Etapa_Nombre) VALUES('"&etapa_nombre&"')")
    etapa.Close
%>

        <h1>Los datos fueron agregados exitosamente</h1>
        <% Else%>
        <h1>Este Etapa ya Existe</h1>
        <h2>Los datos no fueron Agregados</h2>
        <% End If
        conexion.close%>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="IngresoNuevoEtapa.asp" method="post">
                        <input type="submit" value="Agregar Otra" title="Agregue otra Etapa" class="btn-agregar">
                    </form>
                </div>
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="../RecuperarEtapas.asp" method="post">
                        <input type="submit" value="Regresar" title="Regresar" />
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>