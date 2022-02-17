<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim prm_error
            set conexion=Server.CreateObject("ADODB.Connection")
            set prm_error = Server.CreateObject("ADODB.RecordSet")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            prm_error.open "select * from Prm_Error where Prm_Error_Codigo='"&id&"'",conexion
            if prm_error.eof then
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
        <h1>Eliminar Error: <%response.Write(prm_error("Prm_Error_Nombre"))%>
        </h1>
        <table Class="tabla">
            <tr>
                <td></td>
                <td>Código: <%response.Write(prm_error("Prm_Error_Codigo"))%>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>Nombre: <%response.Write(prm_error("Prm_Error_Nombre"))%>
                </td>
                <td colspan="2">Descripción: <%response.Write(prm_error("Prm_Error_Descripcion"))%>
                </td>
            </tr>
        </table>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="EliminarError.asp" method="post">
                        <input type="text" name="id" value="<%response.write(id)%>" hidden />
                        <input type="submit" value="Confirmar" title="Elimine el Error" class="btn-eliminar">
                    </form>
                </div>
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="../RecuperarError.asp" method="post">
                        <input type="submit" value="Cancelar" title="Cancele la Eliminación">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
