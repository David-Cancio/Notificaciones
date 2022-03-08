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
            End If
        %>
<html>

    <!--#include virtual="/Partials/Head.asp"-->

<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">
        <h1>Eliminar Tipo de Movimiento: <%response.Write(tipoMovimiento("Prm_TipoMov_Nombre"))%>
        </h1>
        <table Class="registro">
            <tr>
                <td>Código:
                    <%response.Write(tipoMovimiento("Prm_TipoMov_Codigo"))%>
                </td>
            </tr>
            <tr>
                <td>Nombre:
                    <%response.Write(tipoMovimiento("Prm_TipoMov_Nombre"))%>
                </td>
            </tr>
        </table>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="EliminarTipoMovimiento.asp" method="post">
                        <input type="text" name="id" value="<%response.write(id)%>" hidden />
                        <input type="submit" value="Confirmar" title="Elimine el Movimiento" class="btn-eliminar">
                    </form>
                </div>
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="../RecuperarTipoMovimientos.asp" method="post">
                        <input type="submit" value="Cancelar" title="Cancele la Eliminación">
                    </form>
                </div>
            </div>
        </div>
    </div>
   <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
