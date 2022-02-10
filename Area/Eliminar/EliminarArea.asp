<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim area
            set conexion = Server.CreateObject("ADODB.Connection")
            set area = Server.CreateObject("ADODB.RecordSet") 
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            area.open "select Area_Codigo from Area Where Area_Codigo='"&id&"'",conexion
            if not area.EOF Then
                conexion.execute("delete from Area where Area_Codigo='"&id&"'")
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
            <input type="submit" value="Listado de Áreas" title="Vuelva listado de Áreas">
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
