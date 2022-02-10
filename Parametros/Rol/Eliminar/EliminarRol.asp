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
            rol.open "select Rol_Codigo from Rol Where Rol_Codigo='"&id&"'",conexion
            if not rol.EOF Then
                conexion.execute("delete from Rol where Rol_Codigo='"&id&"'")
            End If
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">               
        <h1>Los datos fueron borrados exitosamente</h1>
        <form action="../RecuperarRoles.asp" method="post">
            <input type="submit" value="Listado de Roles" title="Vuelva listado de Roles">
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
