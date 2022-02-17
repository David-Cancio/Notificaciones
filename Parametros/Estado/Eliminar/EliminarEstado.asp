<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim prm_estado
            set conexion = Server.CreateObject("ADODB.Connection")
            set prm_estado = Server.CreateObject("ADODB.RecordSet") 
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            prm_estado.open "select Prm_Estado_Codigo from Prm_Estado Where Prm_Estado_Codigo='"&id&"'",conexion
            if not prm_estado.EOF Then
                conexion.execute("UPDATE Prm_Estado SET Prm_Estado_Vigencia=0 where Prm_Estado_Codigo='"&id&"'")
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
            <input type="submit" value="Regresar" title="Regrese al listado de �reas">
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
