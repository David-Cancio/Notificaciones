<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%
    dim conexion
    dim prm_tipoEscrito_nombre
    dim prm_tipoEscrito_tipoArchivo
    dim prm_tipoEscrito_extension
    set conexion = Server.CreateObject("ADODB.Connection")
%>
<!--#include virtual="/connectionSQL.asp"-->
<!--#include virtual="/Partials/RecuperarId.asp"-->
<!--#include virtual="/Partials/Validations.asp"-->
<%
conexion.Open
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
    prm_tipoEscrito_nombre=Mayusculatodas(Request.form("prm_tipoEscrito_nombre"))
    conexion.execute("UPDATE Prm_TipoEscrito SET Prm_TipoEscrito_Nombre='"&prm_tipoEscrito_nombre&"' WHERE Prm_TipoEscrito_Codigo='"&id&"' ")
    conexion.execute "delete from Prm_Extensiones where Prm_Extensiones_TipoEscrito='"&id&"'"
    if doc=".doc" then
        conexion.execute "insert into Prm_Extensiones (Prm_Extensiones_TipoEscrito,Prm_Extensiones_TipoArchivo,Prm_Extensiones_Extension) VALUES ('"&id&"','WORD','"&doc&"')"
    end if
    if docx=".docx" then
        conexion.execute "insert into Prm_Extensiones (Prm_Extensiones_TipoEscrito,Prm_Extensiones_TipoArchivo,Prm_Extensiones_Extension) VALUES ('"&id&"','WORD','"&docx&"')"
    end if
    if xml=".xml" then
        conexion.execute "insert into Prm_Extensiones (Prm_Extensiones_TipoEscrito,Prm_Extensiones_TipoArchivo,Prm_Extensiones_Extension) VALUES ('"&id&"','EXCEL','"&xml&"')"
    end if
    if xmls=".xmls" then
        conexion.execute "insert into Prm_Extensiones (Prm_Extensiones_TipoEscrito,Prm_Extensiones_TipoArchivo,Prm_Extensiones_Extension) VALUES ('"&id&"','EXCEL','"&xmls&"')"
    end if
    if pdf=".pdf" then
        conexion.execute "insert into Prm_Extensiones (Prm_Extensiones_TipoEscrito,Prm_Extensiones_TipoArchivo,Prm_Extensiones_Extension) VALUES ('"&id&"','PDF','"&pdf&"')"
    end if
    conexion.close
%>
<html>
    <!--#include virtual="/Partials/Head.asp"-->
<body>
    <!--#include virtual="/Partials/Header.asp"-->

    <div class="listado">
        <h1>El tipo de Escrito Fue Modificado</h1>
        <form action="../RecuperarTipoEscritos.asp" method="post">
            <input type="submit" value="Regresar" title="Regresar" />
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>
