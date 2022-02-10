<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim estado_nombre
            set conexion = Server.CreateObject("ADODB.Connection")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <!--#include virtual="/Partials/Validations.asp"-->
        <%
            conexion.Open
            estado_nombre=Mayusculatodas(Request.form("Estado_Nombre"))
            conexion.execute("UPDATE Estado SET Estado_Nombre='"&estado_nombre&"' WHERE Estado_Codigo='"&id&"' ")
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">
        <h1>Los datos fueron modificados</h1>
        <form action="../RecuperarEstados.asp" method="post">
            <input type="submit" value="Listado de Estados" title="Vuelva al listado de Estados">
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
