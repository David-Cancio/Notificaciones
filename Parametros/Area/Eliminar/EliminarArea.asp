<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim prm_area
            set conexion = Server.CreateObject("ADODB.Connection")
            set prm_area = Server.CreateObject("ADODB.RecordSet") 
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            prm_area.open "select Prm_Area_Codigo from Prm_Area Where Prm_Area_Codigo='"&id&"'",conexion
            if not prm_area.EOF Then
                conexion.execute("delete from Prm_Area where Prm_Area_Codigo='"&id&"'")
            End If
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">               
        <h1>Los datos fueron borrados exitosamente</h1>
        <form action="../RecuperarAreas.asp" method="post">
            <input type="submit" value="Regresar" title="Regrese al listado de Áreas">
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
