<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
        dim conexion
        dim escritosHb
        dim area
        dim etapa
        dim estado
        dim tipoMovimiento
        dim rol
        dim modeloEscrito
        set conexion=Server.CreateObject("ADODB.Connection")
        set escritosHb = Server.CreateObject("ADODB.RecordSet")
        set area = Server.CreateObject("ADODB.RecordSet")
        set etapa = Server.CreateObject("ADODB.RecordSet")
        set estado = Server.CreateObject("ADODB.RecordSet")
        set tipoMovimiento = Server.CreateObject("ADODB.RecordSet")
        set rol = Server.CreateObject("ADODB.RecordSet")
        set modeloEscrito = Server.CreateObject("ADODB.RecordSet")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <%
        conexion.Open
        escritosHb.open "select * from Prm_EscritosHabilitados where Prm_EscritoHB_Vigencia=1",conexion
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
        <h1>Escritos Habilitados</h1>
        <%
        if not escritosHb.eof then
        %>
        <table Class="tabla">
            <tr>
                <th>Código</th>
                <th>Area</th>
                <th>Etapa</th>
                <th>Estado</th>
                <th>Tipo de Movimiento</th>
                <th>Rol</th>
                <th>Tipo de Escrito</th>
                <th>Firmas Obligatorias</th>
                <th></th>
                <th></th>
            </tr>
            <%
            do while not escritosHb.eof
            %>
            <tr>
            <%
                area.open "select * from Prm_Area where Prm_Area_Codigo='"&escritosHb("Prm_EscritoHB_Area")&"'",conexion
                etapa.open "select * from Prm_Etapa where Prm_Etapa_Codigo='"&escritosHb("Prm_EscritoHB_Etapa")&"'",conexion
                estado.open "select * from Prm_Estado where Prm_Estado_Codigo='"&escritosHb("Prm_EscritoHB_Estado")&"'",conexion
                tipoMovimiento.open "select * from Prm_TipoMovimiento where Prm_TipoMov_Codigo='"&escritosHb("Prm_EscritoHB_TipoMov")&"'",conexion
                rol.open "select * from Prm_Rol where Prm_Rol_Codigo='"&escritosHb("Prm_EscritoHB_Rol")&"'",conexion
                modeloEscrito.open "select * from Prm_TipoEscrito where Prm_TipoEscrito_Codigo='"&escritosHb("Prm_EscritoHB_ModeloEscrito")&"'",conexion
            %>
                <th><%response.write(escritosHb("Prm_EscritoHB_Codigo"))%></th>
                <th><%response.write(area("Prm_Area_Nombre"))%></th>
                <th><%response.write(etapa("Prm_Etapa_Nombre"))%></th>
                <th><%response.write(estado("Prm_Estado_Nombre"))%></th>
                <th><%response.write(tipoMovimiento("Prm_TipoMov_Nombre"))%></th>
                <th><%response.write(rol("Prm_Rol_Nombre"))%></th>
                <th><%response.write(modeloEscrito("Prm_TipoEscrito_Nombre"))%></th>
                <th>
                    <% 
                    if escritosHb("Prm_EscritoHB_Obligatorio")=0 then
                        response.write("No")
                    else
                        response.write("Si")
                    end if
                    %>
                </th>
                <th>
                    <form action="Modificar/GenerarModificarEscritoHabilitado.asp" method="post">
                        <input type="text" name="id" value="<%response.write(escritosHb("Prm_EscritoHB_Codigo"))%>" hidden />
                        <input type="submit" value="Modificar" title="Modifique los datos del Escrito Habilitado">
                    </form>
                </th>
                <th>
                    <form action="Eliminar/ConfirmarEliminarEscritoHabilitado.asp" method="post">
                        <input type="text" name="id" value="<%response.write(escritosHb("Prm_EscritoHB_Codigo"))%>" hidden />
                        <input type="submit" value="Eliminar" title="Elimine el Escrito Habilitado" class="btn-eliminar">
                    </form>
                </th>
            </tr>
            <%
            area.close
            etapa.close
            estado.close
            tipoMovimiento.close
            rol.close
            modeloEscrito.close
            escritosHb.movenext
            loop
            %>
        </table>
        <%
        else
        %>
        <h3>Aún no hay ningún Escrito Habilitado</h3>
        <%
        end if
        conexion.close
        %>
        <form action="./Agregar/IngresoNuevoEscritoHabilitado.asp" method="post">
            <input type="submit" value="Agregar" title="Agregue una nueva Notificación" class="btn-agregar">
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>