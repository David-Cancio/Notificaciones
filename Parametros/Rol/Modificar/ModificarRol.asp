<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim rol_nombre
            set conexion = Server.CreateObject("ADODB.Connection")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <!--#include virtual="/Partials/Validations.asp"-->
        <%
            conexion.Open
            rol_nombre=Mayusculatodas(Request.form("rol_Nombre"))
            conexion.execute("UPDATE Prm_Rol SET Prm_Rol_Nombre='"&rol_nombre&"' WHERE Prm_Rol_Codigo='"&id&"' ")
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">
        <h1>Los datos fueron Modificados</h1>
        <form action="../RecuperarRoles.asp" method="post">
            <input type="submit" value="Regresar" title="Regresar" />
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
