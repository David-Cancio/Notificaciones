<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim prm_error_codigo
            dim prm_error_nombre
            dim prm_error_descripcion
            set conexion = Server.CreateObject("ADODB.Connection")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <!--#include virtual="/Partials/Validations.asp"-->
        <%
            conexion.Open
            prm_error_codigo=Mayusculatodas(Request.form("prm_error_codigo"))
            prm_error_nombre=Mayusculatodas(Request.form("prm_error_nombre"))
            prm_error_descripcion=Mayusculatodas(Request.form("prm_error_descripcion"))
            conexion.execute("UPDATE Prm_Error SET Prm_Error_Nombre='"&prm_error_nombre&"', Prm_Error_Codigo='"&prm_error_codigo&"', Prm_Error_Descripcion='"&prm_error_descripcion&"' WHERE Prm_Error_Codigo='"&id&"' ")
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">
        <h1>Los datos fueron modificados</h1>
        <form action="../RecuperarError.asp" method="post">
            <input type="submit" value="Regresar" title="Regresar" />
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
