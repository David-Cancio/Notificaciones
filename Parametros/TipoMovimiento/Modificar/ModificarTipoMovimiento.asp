<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim tipoMov_nombre
            set conexion = Server.CreateObject("ADODB.Connection")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <!--#include virtual="/Partials/Validations.asp"-->
        <%
            conexion.Open
            tipoMov_nombre=MayusculaTodas(Request.form("tipoMov_nombre"))
            conexion.execute("UPDATE TipoMovimiento SET TipoMov_Nombre='"&tipoMov_nombre&"' WHERE TipoMov_Codigo='"&id&"' ")
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">
        <h1>Los datos fueron modificados</h1>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="../RecuperarTipoMovimientos.asp" method="post">
                        <input type="submit" value="Listado de Movimientos" title="Vuelva al listado de Movimientos">
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
   <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</html>
