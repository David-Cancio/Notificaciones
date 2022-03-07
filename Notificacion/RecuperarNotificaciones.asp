<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
        dim conexion
        dim notificacion, Ve_Control, Ve_Destino, Error, tipoEscrito
        set conexion=Server.CreateObject("ADODB.Connection")
        set notificacion = Server.CreateObject("ADODB.RecordSet")
        set Ve_Control = Server.CreateObject("ADODB.RecordSet")
        set Ve_Destino = Server.CreateObject("ADODB.RecordSet")
        set Error = Server.CreateObject("ADODB.RecordSet")
        set tipoEscrito = Server.CreateObject("ADODB.RecordSet")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <%
        conexion.Open
        notificacion.open "select Ve_Notificacion_Univoco,Ve_Notificacion_TipoEscrito from Ve_Notificacion",conexion
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
        <h1>Registro de Notificaciones</h1>
        <%
        if not notificacion.eof then
        %>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-12 py-2">
                    <form action="./Agregar/IngresoNuevaNotificacion.asp" method="post">
                        <input type="submit" value="Generar Notificación" title="Generar una nueva Notificación" class="btn-agregar">
                    </form>
                </div>
            </div>
        </div>
        <table Class="tabla">
            <tr>
                <th colspan="2">Código Univoco</th>
                <th colspan="2">Fecha y Hora</th>
                <th colspan="2">Numero de Transacción</th>
                <th colspan="3">Tipo de Escrito</th>
                <th colspan="2">CUIT del Demandado</th>
                <th colspan="3">Estado</th>
            </tr>
            <%
            do while not notificacion.eof
                Ve_Control.open "select Ve_Control_Fecha,Ve_Control_Hora,Ve_Control_Codigo_Retorno from Ve_Control Where Ve_Control_Univoco='"&notificacion("Ve_Notificacion_Univoco")&"'",conexion
                Ve_Destino.open "select Prm_Destino_NumeroTransaccion,Ve_Destino_Cuit from Ve_Destino Where Ve_Destino_Univoco='"&notificacion("Ve_Notificacion_Univoco")&"'",conexion
            %>
            <tr>
                <th colspan="2"><%response.write(notificacion("Ve_Notificacion_Univoco"))%></th>
                <th colspan="2">
                    <%response.write(Ve_Control("Ve_Control_Fecha"))%><br/>
                    <%response.write(Ve_Control("Ve_Control_Hora"))%>
                </th>
                <th colspan="2"><%response.write(Ve_Destino("Prm_Destino_NumeroTransaccion"))%></th>
                <%
                    tipoEscrito.open "select Prm_TipoEscrito_Nombre from Prm_TipoEscrito Where Prm_TipoEscrito_Codigo='"&notificacion("Ve_Notificacion_TipoEscrito")&"'",conexion
                %>
                <th colspan="3"><%response.write(notificacion("Ve_Notificacion_TipoEscrito"))%>-<%response.write(tipoEscrito("Prm_TipoEscrito_Nombre"))%></th>
                <th colspan="2"><%response.write(Ve_Destino("Ve_Destino_Cuit"))%></th>
                <%
                    Error.open "select Prm_Error_Nombre from Prm_Error Where Prm_Error_Codigo='"&Ve_Control("Ve_Control_Codigo_Retorno")&"'",conexion
                    if Ve_Control("Ve_Control_Codigo_Retorno")<2000 Then
                %>
                    <th style="color: red !important" colspan="3"><%response.write(Error("Prm_Error_Nombre"))%></th>
                <%
                    else    
                %>
                    <th style="color: green !important" colspan="3"><%response.write(Error("Prm_Error_Nombre"))%></th>
                <%
                    End if    
                %>
            </tr>
            <%
                Ve_Control.Close
                Ve_Destino.Close
                tipoEscrito.close
                Error.Close
            notificacion.movenext
            loop
            %>
        </table>
        <%
        else
        %>
        <h3>Aún no hay ninguna Notificación</h3>
        <%
        end if
        conexion.close
        %>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>