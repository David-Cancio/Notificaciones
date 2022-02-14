<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim area_nombre
            set conexion = Server.CreateObject("ADODB.Connection")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <!--#include virtual="/Partials/Validations.asp"-->
        <%
            conexion.Open
            area_nombre=Mayusculatodas(Request.form("Area_Nombre"))
            conexion.execute("UPDATE Area SET Area_Nombre='"&area_nombre&"' WHERE Area_Codigo='"&id&"' ")
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">
        <h1>Los datos fueron modificados</h1>
        <form action="../RecuperarAreas.asp" method="post">
            <input type="submit" value="Regresar" title="Regrese al listado de Áreas">
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
