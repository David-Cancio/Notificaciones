<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%%>
<html>
    <!--#include virtual="/Partials/head.asp"-->
<body>
    <!--#include virtual="/Partials/header.asp"-->

    <div class="listado">   
        <form action="CrearTipoEscrito.asp" method="post">
            <h1>Ingrese los nuevos datos</h1>
            <table Class="tabla">
                <tr>
                    <td colspan="2">Nombre:
                            <input type="text" name="prm_tipoEscrito_nombre" size="40" placeholder="Nombre de Escrito" required pattern="[A-ZÑ,Á,É,Í,Ó,Ú]{1}[a-zA-Z\sñ,á,é,í,ó,ú,ü{1,}" title="Indique el Nombre del Escrito"/>
                    </td>
                    <td colspan="2">Tipo de Archivo:
                         <select name="prm_tipoEscrito_tipoArchivo" title="Seleccione el Tipo de Archivo">
                            <option value="EXCEL">EXCEL</option>
                            <option value="WORD">WORD</option>
                            <option value="PDF">PDF</option>
                        </select>
                    </td>
                    <td colspan="2">Extension:

                         <select name="prm_tipoEscrito_extension" title="Seleccione el Extension">
                            <option value="DOC">DOC</option>
                            <option value="DOCX">DOCX</option>
                            <option value="XML">XML</option>
                            <option value="XMLS">XMLS</option>
                            <option value="PDF">PDF</option>
                        </select>
                    </td>
                </tr>
            </table>
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="CrearTipoEscrito.asp" method="post">
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