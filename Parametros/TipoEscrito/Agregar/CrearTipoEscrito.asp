<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
dim conexion
dim prm_tipoEscrito
set conexion=Server.CreateObject("ADODB.Connection")
set prm_tipoEscrito = Server.CreateObject("ADODB.RecordSet")
%>
<!--#include virtual="/connectionSQL.asp"-->
<!--#include virtual="/Partials/Validations.asp"-->
<%
conexion.open
dim prm_tipoEscrito_nombre
prm_tipoEscrito_nombre=MayusculaTodas(Request.form("prm_tipoEscrito_nombre"))
dim doc, docx, xml, xmls, pdf
doc=Request.form("doc")
docx=Request.form("docx")
xml=Request.form("xml")
xmls=Request.form("xmls")
pdf=Request.form("pdf")
if doc="on" Then
    doc=".doc"
else
    doc=""
End if
if docx="on" Then
    docx=".docx"
else
    docx=""
End if
if xml="on" Then
    xml=".xml"
else
    xml=""
End if
if xmls="on" Then
    xmls=".xmls"
else
    xmls=""
End if
if pdf="on" Then
    pdf=".pdf"
else
    pdf=""
End if
if prm_tipoEscrito_nombre="" Then
%>
    <meta http-equiv="<%response.write("refresh")%>" content="<%response.write("0; url=/./Default.asp")%>" />
<%
end if
%>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->
    <div class="listado">
<%
if IsEmpty(doc) or IsEmpty(docx) or IsEmpty(xml) or IsEmpty(xmls) or IsEmpty(pdf) Then
%>
    <h1>Error al Generar</h1>
    <h2>No hay Tipo de Archivos Selecionados</h2>
    <%
else
    prm_tipoEscrito.open "select Prm_TipoEscrito_Codigo,Prm_TipoEscrito_Vigencia from Prm_TipoEscrito WHERE Prm_TipoEscrito_Nombre = '"&prm_tipoEscrito_nombre&"'",conexion
    if prm_tipoEscrito.EOF then
        conexion.execute "insert into Prm_TipoEscrito (Prm_TipoEscrito_Nombre) VALUES ('"&prm_tipoEscrito_nombre&"')"
        prm_tipoEscrito.close
        prm_tipoEscrito.open "select Prm_TipoEscrito_Codigo from Prm_TipoEscrito WHERE Prm_TipoEscrito_Nombre = '"&prm_tipoEscrito_nombre&"'",conexion
        if doc=".doc" then
            conexion.execute "insert into Prm_Extensiones (Prm_Extensiones_TipoEscrito,Prm_Extensiones_TipoArchivo,Prm_Extensiones_Extension) VALUES ('"&prm_tipoEscrito("Prm_TipoEscrito_Codigo")&"','WORD','"&doc&"')"
        end if
        if docx=".docx" then
            conexion.execute "insert into Prm_Extensiones (Prm_Extensiones_TipoEscrito,Prm_Extensiones_TipoArchivo,Prm_Extensiones_Extension) VALUES ('"&prm_tipoEscrito("Prm_TipoEscrito_Codigo")&"','WORD','"&docx&"')"
        end if
        if xml=".xml" then
            conexion.execute "insert into Prm_Extensiones (Prm_Extensiones_TipoEscrito,Prm_Extensiones_TipoArchivo,Prm_Extensiones_Extension) VALUES ('"&prm_tipoEscrito("Prm_TipoEscrito_Codigo")&"','EXCEL','"&xml&"')"
        end if
        if xmls=".xmls" then
            conexion.execute "insert into Prm_Extensiones (Prm_Extensiones_TipoEscrito,Prm_Extensiones_TipoArchivo,Prm_Extensiones_Extension) VALUES ('"&prm_tipoEscrito("Prm_TipoEscrito_Codigo")&"','EXCEL','"&xmls&"')"
        end if
        if pdf=".pdf" then
            conexion.execute "insert into Prm_Extensiones (Prm_Extensiones_TipoEscrito,Prm_Extensiones_TipoArchivo,Prm_Extensiones_Extension) VALUES ('"&prm_tipoEscrito("Prm_TipoEscrito_Codigo")&"','PDF','"&pdf&"')"
        end if
%>
        <h1>Los datos fueron Agregados Exitosamente</h1>
        <% 
            Else
            If prm_tipoEscrito("Prm_TipoEscrito_Vigencia")=0 then
            conexion.execute("UPDATE Prm_TipoEscrito SET Prm_TipoEscrito_Vigencia=1 where Prm_TipoEscrito_Codigo='"&prm_tipoEscrito("Prm_TipoEscrito_Codigo")&"'")
        %>
            <h1>Este Tipo de Escrito ya Existia y se volvio a Habilitar</h1>
            <h2>Los datos fueron Agregados</h2>
        <%
            Else    
        %>
            <h1>Este Tipo de Escrito ya Existe</h1>
            <h2>Los datos no fueron Agregados</h2>
        <% 
        
        End If
        End If
        end if
    conexion.close
    %>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="IngresoNuevoTipoEscrito.asp" method="post">
                        <input type="submit" value="Agregar Otra" title="Agregue otro Tipo de Escrito" class="btn-agregar">
                    </form>
                </div>
                <div class="col-sm-7 col-md-6 py-2">
                    <form action="../RecuperarTipoEscritos.asp" method="post">
                        <input type="submit" value="Regresar" title="Regresar" />
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>