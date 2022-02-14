<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim tipoEscrito_nombre
            dim tipoEscrito_tipoArchivo
            dim tipoEscrito_modelo
            set conexion = Server.CreateObject("ADODB.Connection")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <!--#include virtual="/Partials/Validations.asp"-->
        <%
            conexion.Open
            tipoEscrito_nombre=Mayusculatodas(Request.form("tipoEscrito_nombre"))
            tipoEscrito_tipoArchivo=Mayusculatodas(Request.form("tipoEscrito_tipoArchivo"))
            tipoEscrito_modelo=Mayusculatodas(Request.form("tipoEscrito_modelo"))
            conexion.execute("UPDATE TipoEscrito SET TipoEscrito_Nombre='"&tipoEscrito_nombre&"', TipoEscrito_TipoArchivo='"&tipoEscrito_tipoArchivo&"', TipoEscrito_Modelo='"&tipoEscrito_modelo&"' WHERE TipoEscrito_Codigo='"&id&"' ")
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
