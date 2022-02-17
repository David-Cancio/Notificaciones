<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim prm_etapa
            set conexion = Server.CreateObject("ADODB.Connection")
            set prm_etapa = Server.CreateObject("ADODB.RecordSet") 
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            prm_etapa.open "select Prm_Etapa_Codigo from Prm_Etapa Where Prm_Etapa_Codigo='"&id&"'",conexion
            if not prm_etapa.EOF Then
                conexion.execute("UPDATE Prm_Etapa SET Prm_Etapa_Vigencia=0 where Prm_Etapa_Codigo='"&id&"'")
            End If
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">               
        <h1>Los datos fueron Borrados Exitosamente</h1>
        <form action="../RecuperarEtapas.asp" method="post">
            <input type="submit" value="Regresar" title="Regresar" />
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
