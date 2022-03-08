<!--#include virtual="/Partials/Utf8Asp.asp"-->
<html>
    <!--#include virtual="/Partials/head.asp"-->
<body>
    <!--#include virtual="/Partials/header.asp"-->

    <div class="listado">   
        <form action="CrearTipoEscrito.asp" method="post">
            <h1>Ingrese nuevo Tipo de Escrito</h1>
            <table Class="tabla">
                <tr>
                    <td colspan="3" class="medio">Nombre:
                        <input type="text" name="prm_tipoEscrito_nombre" size="40" placeholder="Nombre de Escrito" required pattern="[A-ZÑ,Á,É,Í,Ó,Ú]{1}[a-zA-Z\sñ,á,é,í,ó,ú,ü{1,}" title="Indique el Nombre del Escrito"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="medio">
                        Tipos de Archivos Aceptados:
                    </td>
                </tr>
                <tr>
                    <td>
                        Word:
                    </td>
                    <td>
                        .doc
                        <input type="checkbox" name="doc"/>
                    </td>
                     <td>
                        .docx
                        <input type="checkbox" name="docx"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Excel:
                    </td>
                    <td>
                        .xml
                        <input type="checkbox" name="xml"/>
                    </td>
                     <td>
                        .xmls
                        <input type="checkbox" name="xmls"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        PDF:
                    </td>
                    <td>
                        .pdf
                        <input type="checkbox" name="pdf"/>
                    </td>
                    <td></td>
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