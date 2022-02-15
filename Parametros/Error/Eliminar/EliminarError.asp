<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim prm_error
            set conexion = Server.CreateObject("ADODB.Connection")
            set prm_error = Server.CreateObject("ADODB.RecordSet") 
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            prm_error.open "select Prm_Error_Codigo from Prm_Error Where Prm_Error_Codigo='"&id&"'",conexion
            if not prm_error.EOF Then
                conexion.execute("delete from Prm_Error where Prm_Error_Codigo='"&id&"'")
            End If
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">               
        <h1>Los datos fueron borrados exitosamente</h1>
        <form action="../RecuperarError.asp" method="post">
            <input type="submit" value="Regresar" title="Regresar" />
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
