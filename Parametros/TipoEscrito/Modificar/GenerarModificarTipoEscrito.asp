<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim tipoEscrito
            set conexion=Server.CreateObject("ADODB.Connection")
            set tipoEscrito = Server.CreateObject("ADODB.RecordSet")
        %> 
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            tipoEscrito.open "select * from TipoEscrito where TipoEscrito_Codigo='"&id&"'",conexion
            if tipoEscrito.eof then
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
        <form action="ModificarTipoEscrito.asp" method="post">
            <input type="text" name="id" value="<%response.write(id) %>" hidden />
            <h1>
                Modificar Tipo de Escrito
            </h1>
            <table Class="tabla">
                <tr>
                    <td colspan="2">Nombre del Tipo de Escrito:
                            <input type="text" name="tipoEscrito_nombre" size="40" required title="Indique el Nombre del Tipo de Escrito" value="<%response.write(tipoEscrito("TipoEscrito_Nombre"))%>"/>
                    </td>
                    <td colspan="2">Tipo de Archivo:
                            <input type="text" name="tipoEscrito_tipoArchivo" size="40" required title="Indique el Tipo de Archivo" value="<%response.write(tipoEscrito("TipoEscrito_tipoArchivo"))%>"/>
                    </td>
                    <td colspan="2">Modelo:
                            <input type="text" name="tipoEscrito_modelo" size="40" required title="Indique el Modelo del Tipo de Escrito" value="<%response.write(tipoEscrito("TipoEscrito_Modelo"))%>"/>
                    </td>
                </tr>
            </table>
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="ModificarTipoEscrito.asp" method="post">
                            <input type="submit" value="Modificar" title="Confirme la modificación" class="btn-agregar"/>
                        </form>
                    </div>
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="../RecuperarTipoEscritos.asp" method="post">
                            <input type="submit" value="Tipos de Escritos" title="Vuelva al listado de Tipos de Escritos">
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
