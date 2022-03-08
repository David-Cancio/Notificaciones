<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
        dim conexion
        dim prm_etapa
        set conexion=Server.CreateObject("ADODB.Connection")
        set prm_etapa = Server.CreateObject("ADODB.RecordSet")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <%
        conexion.Open
        prm_etapa.open "select * from Prm_Etapa WHERE Prm_Etapa_Vigencia = 1",conexion
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
        <h1>Etapa</h1>
        <form action="./Agregar/IngresoNuevoEtapa.asp" method="post">
            <input type="submit" value="Agregar" title="Agregue una nueva Etapa" class="btn-agregar">
        </form>
        <%
        if not prm_etapa.eof then
        %>
        <table Class="registro">
            <tr>
                <th>Código</th>
                <th colspan="3">Nombre</th>
                <th></th>
                <th></th>
            </tr>
            <%
            do while not prm_etapa.eof
            %>
            <tr>
                <th><%response.write(prm_etapa("Prm_Etapa_Codigo"))%></th>
                <th colspan="3"><%response.write(prm_etapa("Prm_Etapa_Nombre"))%></th>
                <th>
                    <form action="Modificar/GenerarModificarEtapa.asp" method="post">
                        <input type="text" name="id" value="<%response.write(prm_etapa("Prm_Etapa_Codigo"))%>" hidden />
                        <input type="submit" value="Modificar" title="Modifique los datos de la Etapa">
                    </form>
                </th>
                <th>
                    <form action="Eliminar/ConfirmarEliminarEtapa.asp" method="post">
                        <input type="text" name="id" value="<%response.write(prm_etapa("Prm_Etapa_Codigo"))%>" hidden />
                        <input type="submit" value="Eliminar" title="Elimine esta Etapa" class="btn-eliminar">
                    </form>
                </th>
            </tr>
            <%
            prm_etapa.movenext
            loop
            %>
        </table>
        <%
        else
        %>
        <h3>Aún no hay ninguna Etapa</h3>
        <%
        end if
        conexion.close
        %>
        
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>