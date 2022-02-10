<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim etapa_nombre
            set conexion = Server.CreateObject("ADODB.Connection")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <!--#include virtual="/Partials/Validations.asp"-->
        <%
            conexion.Open
            etapa_nombre=Mayusculatodas(Request.form("Etapa_Nombre"))
            conexion.execute("UPDATE Etapa SET Etapa_Nombre='"&etapa_nombre&"' WHERE Etapa_Codigo='"&id&"' ")
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">
        <h1>Los datos fueron modificados</h1>
        <form action="../RecuperarEtapas.asp" method="post">
            <input type="submit" value="Listado de Etapas" title="Vuelva al listado de Etapas">
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
