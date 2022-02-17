<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim escritoHb
            set conexion = Server.CreateObject("ADODB.Connection")
            set escritoHb = Server.CreateObject("ADODB.RecordSet") 
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            escritoHb.open "select Prm_EscritoHB_Codigo from Prm_EscritosHabilitados Where Prm_EscritosHabilitados_Codigo='"&id&"'",conexion
            if not escritoHb.EOF Then
                conexion.execute("UPDATE Prm_EscritosHabilitados SET Prm_EscritoHB_Vigencia=0 where Prm_EscritosHB_Codigo='"&id&"'")
            End If
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">               
        <h1>Los datos fueron borrados exitosamente</h1>
        <form action="../RecuperarAreas.asp" method="post">
            <input type="submit" value="Listado de Áreas" title="Vuelva listado de Áreas">
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
