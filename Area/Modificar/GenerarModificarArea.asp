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
            area.open "select * from area where Area_Codigo='"&id&"'",conexion
            if area.eof then
        %>
        <meta http-equiv="<%response.write("refresh")%>" content="<%response.write("0; url=/./Default.asp")%>" />
        <%
            Else
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div>
        <form action="ModificarArea.asp" method="post">
            <input type="text" name="id" value="<%response.write(id) %>" hidden />
            <h1>
                Modificar Área
            </h1>
            <table Class="listado">
                <tr>
                    <td colspan="2">Nombre del Área:
                            <input type="text" name="area_nombre" size="40" required pattern="[A-ZÑ,Á,É,Í,Ó,Ú]{1}[a-zA-Z\sñ,á,é,í,ó,ú,ü]{1,}" title="Indique el Nombre del Área" value="<%response.write(area("Area_Nombre"))%>"/>
                    </td>
                    <td>Descripción:
                            <input type="text" name="area_descripcion" size="40" required pattern="[A-ZÑ,Á,É,Í,Ó,Ú]{1}[a-zA-Z\sñ,á,é,í,ó,ú,ü]{1,}" title="Introduzca una Descripción para el Área" value="<%response.write(area("Area_Descripcion"))%>"/>
                    </td>
                </tr>
            </table>
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 col-md-4 py-2">
                        <form action="ModificarArea.asp" method="post">
                            <input type="submit" value="Modificar" title="Confirme la modificación" />
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
        <%
            end if
            conexion.close
        %>
</body>
   <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</html>
