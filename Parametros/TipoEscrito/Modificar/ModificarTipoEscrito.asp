<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim prm_tipoEscrito_nombre
            dim prm_tipoEscrito_tipoArchivo
            dim prm_tipoEscrito_extension
            set conexion = Server.CreateObject("ADODB.Connection")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <!--#include virtual="/Partials/Validations.asp"-->
        <%
            conexion.Open
            prm_tipoEscrito_nombre=Mayusculatodas(Request.form("prm_tipoEscrito_nombre"))
            prm_tipoEscrito_tipoArchivo=Mayusculatodas(Request.form("prm_tipoEscrito_tipoArchivo"))
            prm_tipoEscrito_extension=Mayusculatodas(Request.form("prm_tipoEscrito_extension"))
            conexion.execute("UPDATE Prm_TipoEscrito SET Prm_TipoEscrito_Nombre='"&prm_tipoEscrito_nombre&"', Prm_TipoEscrito_TipoArchivo='"&prm_tipoEscrito_tipoArchivo&"', Prm_TipoEscrito_Extension='"&prm_tipoEscrito_extension&"' WHERE Prm_TipoEscrito_Codigo='"&id&"' ")
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">
        <h1>Los datos fueron modificados</h1>
        <form action="../RecuperarTipoEscritos.asp" method="post">
            <input type="submit" value="Regresar" title="Regresar" />
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
