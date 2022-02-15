<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim prm_tipoEscrito
            set conexion = Server.CreateObject("ADODB.Connection")
            set prm_tipoEscrito = Server.CreateObject("ADODB.RecordSet") 
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            prm_tipoEscrito.open "select Prm_TipoEscrito_Codigo from Prm_TipoEscrito Where Prm_TipoEscrito_Codigo='"&id&"'",conexion
            if not prm_tipoEscrito.EOF Then
                conexion.execute("delete from Prm_TipoEscrito where Prm_TipoEscrito_Codigo='"&id&"'")
            End If
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">               
        <h1>Los datos fueron borrados exitosamente</h1>
        <form action="../RecuperarTipoEscritos.asp" method="post">
            <input type="submit" value="Regresar" title="Regresar" />
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
