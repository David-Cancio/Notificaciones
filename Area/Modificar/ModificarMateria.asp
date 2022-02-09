<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim area_nombre
            dim area_codigo
            dim area_descripcion
            set conexion = Server.CreateObject("ADODB.Connection")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarIdMateria.asp"-->
        <%
            conexion.Open
            area_nombre=Request.form("Area_Nombre")
            area_codigo=Request.form("Area_Codigo")
            area_descripcion=Request.form("Area_Descripcion")
            conexion.execute("UPDATE Area SET Area_Nombre='"&area_nombre&"', Area_Codigo='"&area_codigo&"', Area_Descripcion='"&area_descripcion&"' WHERE Area_Codigo='"&area_codigo&"' ")
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div>
        <h1>Los datos fueron modificados</h1>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="../RecuperarAreas.asp" method="post">
                        <input type="submit" value="Listado de Áreas" title="Vuelva al listado de Áreas">
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
   <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</html>
