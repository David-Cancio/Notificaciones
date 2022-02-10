<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim area
            set conexion=Server.CreateObject("ADODB.Connection")
            set area = Server.CreateObject("ADODB.RecordSet")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            area.open "select * from Area where Area_Codigo='"&id&"'",conexion
            if area.eof then
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
        <h1>Eliminar Área: <%response.Write(area("Area_Nombre"))%>
        </h1>
        <table Class="tabla">
            <tr>
                <td>Código:
                </td>
                <td>
                    <%response.Write(area("Area_Codigo"))%>
                </td>
                <td>Nombre:
                </td>
                <td>
                    <%response.Write(area("Area_Nombre"))%>
                </td>
            </tr>
        </table>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-4 py-2">
                    <form action="EliminarArea.asp" method="post">
                        <input type="text" name="id" value="<%response.write(id)%>" hidden />
                        <input type="submit" value="Confirmar" title="Elimine la Materia"><br>
                    </form>
                </div>
                <div class="col-sm-7 col-md-4 py-2">
                    <form action="../RecuperarAreas.asp" method="post">
                        <input type="submit" value="Listado de Áreas" title="Vuelva al listado de Áreas">
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
   <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</html>
