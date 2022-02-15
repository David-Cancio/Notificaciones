<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim prm_sectorFirmante_nombre
            set conexion = Server.CreateObject("ADODB.Connection")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <!--#include virtual="/Partials/Validations.asp"-->
        <%
            conexion.Open
            prm_sectorFirmante_nombre=Mayusculatodas(Request.form("prm_sectorFirmante_Nombre"))
            conexion.execute("UPDATE Prm_SectorFirmante SET Prm_SectorFirmante_Nombre='"&sectorFirmante_nombre&"' WHERE Prm_SectorFirmante_Codigo='"&id&"' ")
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
