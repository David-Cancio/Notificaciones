<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim etapa
            set conexion=Server.CreateObject("ADODB.Connection")
            set etapa = Server.CreateObject("ADODB.RecordSet")
        %> 
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            etapa.open "select * from etapa where Etapa_Codigo='"&id&"'",conexion
            if etapa.eof then
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
        <form action="ModificarEtapa.asp" method="post">
            <input type="text" name="id" value="<%response.write(id) %>" hidden />
            <h1>
                Modificar Etapa
            </h1>
            <table Class="tabla">
                <tr>
                    <td colspan="2">Nombre de Etapa:
                            <input type="text" name="etapa_nombre" size="40" required pattern="[A-ZÑ,Á,É,Í,Ó,Ú]{1}[a-zA-Z\sñ,á,é,í,ó,ú,ü]{1,}" title="Indique el Nombre de Etapa" value="<%response.write(etapa("Etapa_Nombre"))%>"/>
                    </td>
                </tr>
            </table>
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="ModificarEtapa.asp" method="post">
                            <input type="submit" value="Modificar" title="Confirme la modificación" class="btn-agregar"/>
                        </form>
                    </div>
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="../RecuperarEtapas.asp" method="post">
                            <input type="submit" value="Listado de Etapas" title="Vuelva al listado de Etapas">
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
