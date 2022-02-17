<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
        dim conexion
        dim prm_tipoEscrito
        set conexion=Server.CreateObject("ADODB.Connection")
        set prm_tipoEscrito = Server.CreateObject("ADODB.RecordSet")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <%
        conexion.Open
        prm_tipoEscrito.open "select * from Prm_TipoEscrito where Prm_TipoEscrito_Vigencia=1 ",conexion
        dim word, excel, pdf, auxiliar
        word=0
        excel=0
        pdf=0
        auxiliar=0
        %>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
        <h1>Tipos de Escritos</h1>
        <%
        if not prm_tipoEscrito.eof then
        %>
        <table Class="tabla">
            <tr>
                <th>Código</th>
                <th colspan="2">Nombre</th>
                <th>Tipo de Archivo</th>
                <th colspan="2">Extención</th>
                <th></th>
                <th></th>
            </tr>
            <%
                dim extensiones
                set extensiones = Server.CreateObject("ADODB.RecordSet")
                do while not prm_tipoEscrito.eof
            %>
            <tr>
                <th><%response.write(prm_tipoEscrito("Prm_TipoEscrito_Codigo"))%></th>
                <th colspan="2"><%response.write(prm_tipoEscrito("Prm_TipoEscrito_Nombre"))%></th>
                <th>
                    <%
                        extensiones.open "select * from Prm_Extensiones where Prm_Extensiones_TipoEscrito='"&prm_tipoEscrito("prm_tipoEscrito_Codigo")&"'", conexion
                        do while not extensiones.eof
                        if word=0 and extensiones("Prm_Extensiones_TipoArchivo")="WORD" Then
                            if auxiliar=1 Then
                                response.write("-")
                            End if
                            response.write("WORD")
                            auxiliar=1
                        word=1
                        end if
                        if excel=0 and extensiones("Prm_Extensiones_TipoArchivo")="EXCEL" Then
                            if auxiliar=1 Then
                                response.write("-")
                            End if
                            response.write("EXCEL")
                            auxiliar=1
                        excel=1
                        end if 
                        if pdf=0 and extensiones("Prm_Extensiones_TipoArchivo")="PDF" Then
                            if auxiliar=1 Then
                                response.write("-")
                            End if
                            response.write("PDF")
                            auxiliar=1
                        pdf=1
                        end if 
                        extensiones.movenext
                        loop
                        word=0
                        excel=0
                        pdf=0
                        auxiliar=0
                        extensiones.close
                    %>
                </th>
                <th colspan="2">
                    <%
                        extensiones.open "select * from Prm_Extensiones where Prm_Extensiones_TipoEscrito='"&prm_tipoEscrito("prm_tipoEscrito_Codigo")&"'", conexion
                        do while not extensiones.eof
                        if auxiliar = 1 then
                            response.write("-")
                        else
                        auxiliar=1
                        end if
                        response.write(extensiones("Prm_Extensiones_Extension"))
                        extensiones.movenext
                        loop
                        auxiliar=0
                        extensiones.close
                    %>
                </th>
                <th>
                    <form action="Modificar/GenerarModificarTipoEscrito.asp" method="post">
                        <input type="text" name="id" value="<%response.write(prm_tipoEscrito("Prm_TipoEscrito_Codigo"))%>" hidden />
                        <input type="submit" value="Modificar" title="Modifique los datos de este Tipo de Escrito">
                    </form>
                </th>
                <th>
                    <form action="Eliminar/ConfirmarEliminarTipoEscrito.asp" method="post">
                        <input type="text" name="id" value="<%response.write(prm_tipoEscrito("Prm_TipoEscrito_Codigo"))%>" hidden />
                        <input type="submit" value="Eliminar" title="Elimine este Tipo de Escrito" class="btn-eliminar">
                    </form>
                </th>
            </tr>
            <%
            prm_tipoEscrito.movenext
            loop
            %>
        </table>
        <%
        else
        %>
        <h3>Aún no hay ningún Tipo de Escrito</h3>
        <%
        end if
        conexion.close
        %>
        <form action="./Agregar/IngresoNuevoTipoEscrito.asp" method="post">
            <input type="submit" value="Agregar" title="Agregue un nuevo Tipo de Escrito" class="btn-agregar">
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>