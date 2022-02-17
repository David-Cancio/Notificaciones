<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            set conexion = Server.CreateObject("ADODB.Connection")
            dim area_Codigo
            area_Codigo=Request.form("area_Codigo")
            dim etapa_Codigo
            etapa_Codigo=Request.form("etapa_Codigo")
            dim estado_Codigo
            estado_Codigo=Request.form("estado_Codigo")
            dim tipoMov_Codigo
            tipoMov_Codigo=Request.form("tipoMov_Codigo")
            dim rol_Codigo
            rol_Codigo=Request.form("rol_Codigo")
            dim modeloEscrito_Codigo
            modeloEscrito_Codigo=Request.form("tipoEscrito_Codigo")
            dim obligatorio
            obligatorio=Request.form("obligatorio")
            dim sector_Codigo
            sector_Codigo=Request.form("sector_Codigo")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <!--#include virtual="/Partials/Validations.asp"-->
        <%
            conexion.Open
            conexion.execute("UPDATE Prm_EscritosHabilitados SET Prm_EscritoHB_Area='"&area_codigo&"', Prm_EscritoHB_Etapa='"&etapa_Codigo&"', Prm_EscritoHB_Estado='"&estado_Codigo&"', Prm_EscritoHB_TipoMov='"&tipoMov_Codigo&"', Prm_EscritoHB_Rol='"&rol_Codigo&"', Prm_EscritoHB_ModeloEscrito='"&modeloEscrito_Codigo&"', Prm_EscritoHB_Obligatorio='"&obligatorio&"' WHERE Prm_EscritoHB_Codigo='"&id&"' ")
            conexion.execute("UPDATE Prm_FirmaPorSector SET Prm_FirmaPorSector_Firmante='"&sector_Codigo&"', Prm_FirmaPorSector_Estado=1 WHERE  Prm_FirmaPorSector_EscritoHabilitados='"&id&"' ")
            conexion.close
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">
        <h1>Los datos fueron modificados</h1>
        <form action="../RecuperarEscritosHabilitados.asp" method="post">
            <input type="submit" value="Regresar" title="Vuelva al listado de Escritos Habilitados">
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
