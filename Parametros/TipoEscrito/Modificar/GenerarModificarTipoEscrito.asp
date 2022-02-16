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
            prm_tipoEscrito.open "select * from Prm_TipoEscrito where Prm_TipoEscrito_Codigo='"&id&"'",conexion
            if prm_tipoEscrito.eof then
        %>
        <meta http-equiv="<%response.write("refresh")%>" content="<%response.write("0; url=/./Default.asp")%>" />
        <%
            End if
        %>
<html>
    <!--#include virtual="/Partials/head.asp"-->
<body>
    <!--#include virtual="/Partials/header.asp"-->

    <div class="listado">   
        <form action="ModificarTipoEscrito.asp" method="post">
            <h1>Modificar Tipo de Escrito</h1>
            <table Class="tabla">
                <tr>
                    <td colspan="3">Nombre:
                        <input type="text" name="prm_tipoEscrito_nombre" size="40" required title="Indique el Nombre del Tipo de Escrito" value="<%response.write(prm_tipoEscrito("Prm_TipoEscrito_Nombre"))%>"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        Tipos de Archivos Aceptados:
                    </td>
                </tr>
                <tr>
                    <td>
                        Word:
                    </td>
                    <td>
                        .doc
                        <%
                            extensiones.open "select * from Prm_Extensiones where Prm_Extensiones_TipoEscrito='"&prm_tipoEscrito("prm_tipoEscrito_Codigo")&"' and Prm_Extensiones_Extension='.doc'", conexion
                            if extensiones.EOF then
                        %>
                            <input type="checkbox" name="doc"/>
                        <%
                            else    
                        %>
                            <input type="checkbox" name="doc" checked/>
                        <%
                            end if 
                            extensiones.close
                        %>
                    </td>
                     <td>
                        .docx
                         <%
                            extensiones.open "select * from Prm_Extensiones where Prm_Extensiones_TipoEscrito='"&prm_tipoEscrito("prm_tipoEscrito_Codigo")&"' and Prm_Extensiones_Extension='.docx'", conexion
                            if extensiones.EOF then
                        %>
                            <input type="checkbox" name="docx"/>
                        <%
                            else    
                        %>
                            <input type="checkbox" name="docx" checked/>
                        <%
                            end if
                            extensiones.close
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Excel:
                    </td>
                    <td>
                        .xml
                        <%
                            extensiones.open "select * from Prm_Extensiones where Prm_Extensiones_TipoEscrito='"&prm_tipoEscrito("prm_tipoEscrito_Codigo")&"' and Prm_Extensiones_Extension='.xml'", conexion
                            if extensiones.EOF then
                        %>
                            <input type="checkbox" name="xml"/>
                        <%
                            else    
                        %>
                            <input type="checkbox" name="xml" checked/>
                        <%
                            end if 
                            extensiones.close
                        %>
                    </td>
                     <td>
                        .xmls
                        <%
                            extensiones.open "select * from Prm_Extensiones where Prm_Extensiones_TipoEscrito='"&prm_tipoEscrito("prm_tipoEscrito_Codigo")&"' and Prm_Extensiones_Extension='.xmls'", conexion
                            if extensiones.EOF then
                        %>
                            <input type="checkbox" name="xmls"/>
                        <%
                            else    
                        %>
                            <input type="checkbox" name="xmls" checked/>
                        <%
                            end if
                            extensiones.close
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        PDF:
                    </td>
                    <td>
                        .pdf
                        <%
                            extensiones.open "select * from Prm_Extensiones where Prm_Extensiones_TipoEscrito='"&prm_tipoEscrito("prm_tipoEscrito_Codigo")&"' and Prm_Extensiones_Extension='.pdf'", conexion
                            if extensiones.EOF then
                        %>
                            <input type="checkbox" name="pdf"/>
                        <%
                            else    
                        %>
                            <input type="checkbox" name="pdf" checked/>
                        <%
                            end if
                            extensiones.close
                        %>
                    </td>
                    <td></td>
                </tr>
            </table>
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="ModificarTipoEscrito.asp" method="post">
                            <input type="text" name="id" value="<%response.write(id)%>" hidden />
                            <input type="submit" value="Agregar" title="Agregue el Tipo de Escrito" class="btn-agregar" />
                        </form>
                    </div>
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="../RecuperarTipoEscritos.asp" method="post">
                            <input type="submit" value="Cancelar" title="Cancelar" class="btn-eliminar" >
                        </form>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>