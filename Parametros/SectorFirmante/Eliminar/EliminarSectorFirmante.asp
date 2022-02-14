<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim sectorFirmante
            set conexion = Server.CreateObject("ADODB.Connection")
            set sectorFirmante = Server.CreateObject("ADODB.RecordSet") 
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            sectorFirmante.open "select SectorFirmante_Codigo from SectorFirmante Where SectorFirmante_Codigo='"&id&"'",conexion
            if not sectorFirmante.EOF Then
                conexion.execute("delete from SectorFirmante where SectorFirmante_Codigo='"&id&"'")
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
