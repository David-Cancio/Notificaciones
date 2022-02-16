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

rol_nombre=MayusculaTodas(Request.form("Prm_rol_nombre"))

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
rol.open "select Prm_Rol_Codigo, Prm_Rol_Vigencia from Prm_Rol WHERE Prm_Rol_Nombre = '"&rol_nombre&"'",conexion
if rol.EOF then
    conexion.execute("insert into Prm_Rol (Prm_Rol_Nombre) VALUES('"&rol_nombre&"')")
    rol.Close
%>

        <h1>Los datos fueron Agregados Exitosamente</h1>
        <% Else
        If rol("Prm_Rol_Vigencia")=0 then
          conexion.execute("UPDATE Prm_Rol SET Prm_Rol_Vigencia=1 where Prm_Rol_Codigo='"&rol("Prm_Rol_Codigo")&"'")
        %>
         <h1>Este Rol ya Existia y se volvio a Habilitar</h1>
        <h2>Los datos fueron Agregados</h2>
        <%Else%>
            <h1>Este Rol ya Existe</h1>
            <h2>Los datos no fueron Agregados</h2>
        <% End If
           End If
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
                        <input type="submit" value="Regresar" title="Regresar">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>