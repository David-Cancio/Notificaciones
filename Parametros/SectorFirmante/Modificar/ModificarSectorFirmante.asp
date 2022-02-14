<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim SectorFirmante_nombre
            set conexion = Server.CreateObject("ADODB.Connection")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <!--#include virtual="/Partials/Validations.asp"-->
        <%
            conexion.Open
            SectorFirmante_nombre=Mayusculatodas(Request.form("SectorFirmante_Nombre"))
            conexion.execute("UPDATE SectorFirmante SET SectorFirmante_Nombre='"&sectorFirmante_nombre&"' WHERE SectorFirmante_Codigo='"&id&"' ")
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">
        <h1>Los datos fueron modificados</h1>
        <form action="../RecuperarSectorFirmante.asp" method="post">
            <input type="submit" value="Regresar" title="Regresar" />
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
