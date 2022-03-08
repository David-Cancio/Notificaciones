<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
        dim conexion
        dim prm_sectorFirmante
        set conexion=Server.CreateObject("ADODB.Connection")
        set prm_sectorFirmante = Server.CreateObject("ADODB.RecordSet")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <%
        conexion.Open
        prm_sectorFirmante.open "select * from Prm_SectorFirmante WHERE Prm_SectorFirmante_Vigencia = 1",conexion
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
        <h1>Sector Firmante</h1>
        <form action="./Agregar/IngresoNuevoSectorFirmante.asp" method="post">
            <input type="submit" value="Agregar" title="Agregue una nuevo Sector Firmante" class="btn-agregar">
        </form>
        <%
        if not prm_sectorFirmante.eof then
        %>
        <table Class="registro">
            <tr>
                <th>Código</th>
                <th colspan="3">Nombre</th>
                <th>Modificar</th>
                <th>Eliminar</th>
            </tr>
            <%
            do while not prm_sectorFirmante.eof
            %>
            <tr>
                <th><%response.write(prm_sectorFirmante("Prm_SectorFirmante_Codigo"))%></th>
                <th colspan="3"><%response.write(prm_sectorFirmante("Prm_SectorFirmante_Nombre"))%></th>
                <th>
                    <form action="Modificar/GenerarModificarSectorFirmante.asp" method="post">
                        <input type="text" name="id" value="<%response.write(prm_sectorFirmante("Prm_SectorFirmante_Codigo"))%>" hidden />
                        <input type="submit" value="Modificar" title="Modifique los datos del Sector Firmante">
                    </form>
                </th>
                <th>
                    <form action="Eliminar/ConfirmarEliminarSectorFirmante.asp" method="post">
                        <input type="text" name="id" value="<%response.write(prm_sectorFirmante("Prm_SectorFirmante_Codigo"))%>" hidden />
                        <input type="submit" value="Eliminar" title="Elimine este Sector Firmante" class="btn-eliminar">
                    </form>
                </th>
            </tr>
            <%
            prm_sectorFirmante.movenext
            loop
            %>
        </table>
        <%
        else
        %>
        <h3>Aún no hay ningún Sector Firmante</h3>
        <%
        end if
        conexion.close
        %>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>