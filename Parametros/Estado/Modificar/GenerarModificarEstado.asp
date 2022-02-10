<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim estado
            set conexion=Server.CreateObject("ADODB.Connection")
            set estado = Server.CreateObject("ADODB.RecordSet")
        %> 
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            estado.open "select * from estado where Estado_Codigo='"&id&"'",conexion
            if estado.eof then
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
        <form action="ModificarEstado.asp" method="post">
            <input type="text" name="id" value="<%response.write(id) %>" hidden />
            <h1>
                Modificar Estado
            </h1>
            <table Class="tabla">
                <tr>
                    <td colspan="2">Nombre del Estado:
                            <input type="text" name="estado_nombre" size="40" required pattern="[A-ZÑ,Á,É,Í,Ó,Ú]{1}[a-zA-Z\sñ,á,é,í,ó,ú,ü]{1,}" title="Indique el Nombre del Estado" value="<%response.write(estado("Estado_Nombre"))%>"/>
                    </td>
                </tr>
            </table>
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="ModificarEstado.asp" method="post">
                            <input type="submit" value="Modificar" title="Confirme la modificación" class="btn-agregar"/>
                        </form>
                    </div>
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="../RecuperarEstados.asp" method="post">
                            <input type="submit" value="Listado de Estados" title="Vuelva al listado de Estados">
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
