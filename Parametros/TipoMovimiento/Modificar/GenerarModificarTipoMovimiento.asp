<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim tipoMovimiento
            set conexion=Server.CreateObject("ADODB.Connection")
            set tipoMovimiento = Server.CreateObject("ADODB.RecordSet")
        %> 
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            tipoMovimiento.open "select * from Prm_TipoMovimiento where Prm_TipoMov_Codigo='"&id&"'",conexion
            if tipoMovimiento.eof then
        %>
        <meta http-equiv="<%response.write("refresh")%>" content="<%response.write("0; url=/./Default.asp")%>" />
        <%
            Else
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">
        <form action="ModificarTipoMovimiento.asp" method="post">
            <input type="text" name="id" value="<%response.write(id) %>" hidden />
            <h1>
                Modificar Tipo de Movimiento
            </h1>
            <table Class="tabla">
                <tr>
                    <td colspan="2">Tipo de Movimiento:
                        <input type="text" name="tipoMov_nombre" size="40" required title="Indique el Tipo de Movimiento" value="<%response.write(tipoMovimiento("Prm_TipoMov_Nombre"))%>"/>
                    </td>
                </tr>
            </table>
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="ModificarTipoMovimiento.asp" method="post">
                            <input type="submit" value="Modificar" title="Confirme la modificación" class="btn-agregar"/>
                        </form>
                    </div>
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="../RecuperarTipoMovimientos.asp" method="post">
                            <input type="submit" value="Cancelar" title="Cancelar" class="btn-eliminar">
                        </form>
                    </div>
                </div>
            </div>
    </div>
        <%
            end if
            conexion.close
        %>
</body>
   <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</html>
