<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim rol
            set conexion = Server.CreateObject("ADODB.Connection")
            set rol = Server.CreateObject("ADODB.RecordSet") 
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            rol.open "select Prm_Rol_Codigo from Prm_Rol Where Prm_Rol_Codigo='"&id&"'",conexion
            if not rol.EOF Then
                conexion.execute("UPDATE Prm_Rol SET Prm_Rol_Vigencia=0 where Prm_Rol_Codigo='"&id&"'")
            End If
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">               
        <h1>Los datos fueron Borrados Exitosamente</h1>
        <form action="../RecuperarRoles.asp" method="post">
            <input type="submit" value="Regresar" title="Regresar" />
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
