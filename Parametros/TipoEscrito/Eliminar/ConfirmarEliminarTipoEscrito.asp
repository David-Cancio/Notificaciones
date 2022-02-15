<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim prm_tipoEscrito
            set conexion=Server.CreateObject("ADODB.Connection")
            set prm_tipoEscrito = Server.CreateObject("ADODB.RecordSet")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            prm_tipoEscrito.open "select * from Prm_TipoEscrito where Prm_TipoEscrito_Codigo='"&id&"'",conexion
            if prm_tipoEscrito.eof then
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
        <h1>Eliminar Tipo de Escrito: <%response.Write(prm_tipoEscrito("Prm_TipoEscrito_Nombre"))%>
        </h1>
        <table Class="tabla">
            <tr>
                <td></td>
                <td>Código: <%response.Write(prm_tipoEscrito("Prm_TipoEscrito_Codigo"))%>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>Nombre: <%response.Write(prm_tipoEscrito("Prm_TipoEscrito_Nombre"))%>
                </td>
                <td>Tipo de Archivo: <%response.Write(prm_tipoEscrito("Prm_TipoEscrito_TipoArchivo"))%>
                </td>
                <td>Modelo: <%response.Write(prm_tipoEscrito("Prm_TipoEscrito_Extension"))%>
                </td>
            </tr>
        </table>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="EliminarTipoEscrito.asp" method="post">
                        <input type="text" name="id" value="<%response.write(id)%>" hidden />
                        <input type="submit" value="Confirmar" title="Elimine el Tipo de Archivo" class="btn-eliminar">
                    </form>
                </div>
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="../RecuperarTipoEscritos.asp" method="post">
                        <input type="submit" value="Cancelar" title="Cancele la Eliminación">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
