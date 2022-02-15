<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim tipoMovimiento
            set conexion = Server.CreateObject("ADODB.Connection")
            set tipoMovimiento = Server.CreateObject("ADODB.RecordSet") 
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            tipoMovimiento.open "select Prm_TipoMov_Codigo from Prm_TipoMovimiento Where Prm_TipoMov_Codigo='"&id&"'",conexion
            if not tipoMovimiento.EOF Then
                conexion.execute("delete from Prm_TipoMovimiento where Prm_TipoMov_Codigo='"&id&"'")
            End If
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">               
        <h1>Los datos fueron borrados exitosamente</h1>
        <form action="../RecuperarTipoMovimientos.asp" method="post">
            <input type="submit" value="Regresar" title="Regresar" />
        </form>
    </div>
   <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
