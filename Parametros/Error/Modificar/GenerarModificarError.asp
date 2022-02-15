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
            Else
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">
        <form action="ModificarError.asp" method="post">
            <input type="text" name="id" value="<%response.write(id) %>" hidden />
            <h1>
                Modificar Tipo de Error
            </h1>
            <table Class="tabla">
                <tr>
                    <td colspan="2">Codigo del Tipo de Error:
                            <input type="text" name="prm_error_codigo" size="40" required title="Indique el Código del Tipo de Error" value="<%response.write(prm_error("Prm_Error_Codigo"))%>"/>
                    </td>
                    <td colspan="2">Nombre:
                            <input type="text" name="prm_error_nombre" size="40" required title="Indique el Nombre" value="<%response.write(prm_error("Prm_Error_Nombre"))%>"/>
                    </td>
                    <td colspan="2">Descripcion:
                            <input type="text" name="prm_error_descripcion" size="40" required title="Indique la Descripción del Tipo de Escrito" value="<%response.write(prm_error("Prm_Error_Descripcion"))%>"/>
                    </td>
                </tr>
            </table>
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="ModificarError.asp" method="post">
                            <input type="submit" value="Modificar" title="Confirme la modificación" class="btn-agregar"/>
                        </form>
                    </div>
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="../RecuperarError.asp" method="post">
                            <input type="submit" value="Cancelar" title="Cancelar" class="btn-eliminar" >
                        </form>
                    </div>
                </div>
            </div>
    </div>
        <%
            end if
            conexion.close
        %>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
