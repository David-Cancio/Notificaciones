<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim estado
            set conexion = Server.CreateObject("ADODB.Connection")
            set estado = Server.CreateObject("ADODB.RecordSet") 
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            estado.open "select Estado_Codigo from Estado Where Estado_Codigo='"&id&"'",conexion
            if not estado.EOF Then
                conexion.execute("delete from Estado where Estado_Codigo='"&id&"'")
            End If
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">               
        <h1>Los datos fueron borrados exitosamente</h1>
        <form action="../RecuperarEstados.asp" method="post">
            <input type="submit" value="Regresar" title="Regrese al listado de Áreas">
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
