<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim etapa
            set conexion = Server.CreateObject("ADODB.Connection")
            set etapa = Server.CreateObject("ADODB.RecordSet") 
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            etapa.open "select Etapa_Codigo from Etapa Where Etapa_Codigo='"&id&"'",conexion
            if not etapa.EOF Then
                conexion.execute("delete from Etapa where Etapa_Codigo='"&id&"'")
            End If
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">               
        <h1>Los datos fueron borrados exitosamente</h1>
        <form action="../RecuperarEtapas.asp" method="post">
            <input type="submit" value="Regresar" title="Regresar" />
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
