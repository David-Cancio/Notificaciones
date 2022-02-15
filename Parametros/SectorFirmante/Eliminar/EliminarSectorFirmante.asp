<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim prm_sectorFirmante
            set conexion = Server.CreateObject("ADODB.Connection")
            set prm_sectorFirmante = Server.CreateObject("ADODB.RecordSet") 
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            prm_sectorFirmante.open "select Prm_SectorFirmante_Codigo from Prm_SectorFirmante Where Prm_SectorFirmante_Codigo='"&id&"'",conexion
            if not prm_sectorFirmante.EOF Then
                conexion.execute("delete from Prm_SectorFirmante where Prm_SectorFirmante_Codigo='"&id&"'")
            End If
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">               
        <h1>Los datos fueron borrados exitosamente</h1>
        <form action="../RecuperarSectorFirmante.asp" method="post">
            <input type="submit" value="Regresar" title="Regresar" />
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
