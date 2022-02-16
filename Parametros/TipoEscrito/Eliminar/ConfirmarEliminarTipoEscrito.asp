<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
            dim conexion
            dim prm_tipoEscrito
            dim extensiones
            set conexion=Server.CreateObject("ADODB.Connection")
            set prm_tipoEscrito = Server.CreateObject("ADODB.RecordSet")
            set extensiones = Server.CreateObject("ADODB.RecordSet")
        %>
        <!--#include virtual="/connectionSQL.asp"-->
        <!--#include virtual="/Partials/RecuperarId.asp"-->
        <%
            conexion.Open
            dim word, excel, pdf, auxiliar
            word=0
            excel=0
            pdf=0
            auxiliar=0
            prm_tipoEscrito.open "select * from Prm_TipoEscrito where Prm_TipoEscrito_Codigo='"&id&"'",conexion
            if prm_tipoEscrito.eof then
        %>
        <meta http-equiv="<%response.write("refresh")%>" content="<%response.write("0; url=/./Default.asp")%>" />
        <%
            End If
        %>
<html>

    <!--#include virtual="/Partials/Head.asp"-->

<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">
        <h1>Eliminar Tipo de Escrito: <%response.Write(prm_tipoEscrito("Prm_TipoEscrito_Nombre"))%>
        </h1>
        <table Class="tabla">
            <tr>
                <td>
                    Código: 
                </td>
                <td>
                    <%response.Write(prm_tipoEscrito("Prm_TipoEscrito_Codigo"))%>
                </td>
                <td>
                    Nombre:
                </td>
                <td colspan="2">
                    <%response.Write(prm_tipoEscrito("Prm_TipoEscrito_Nombre"))%>
                </td>
            </tr>
            <tr>
                <th>
                    Tipo Archivo:
                </th>
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
                <th>
                    Extensiones:
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
            </tr>
        </table>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="EliminarTipoEscrito.asp" method="post">
                        <input type="text" name="id" value="<%response.write(id)%>" hidden />
                        <input type="submit" value="Confirmar" title="Elimine el Tipo de Archivo" class="btn-eliminar">
                    </form>
                </div>
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="../RecuperarTipoEscritos.asp" method="post">
                        <input type="submit" value="Cancelar" title="Cancele la Eliminación">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
