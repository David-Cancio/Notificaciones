<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%%>
<html>
    <!--#include virtual="/Partials/head.asp"-->
<body>
    <!--#include virtual="/Partials/header.asp"-->

    <div class="listado">   
        <form action="CrearEtapa.asp" method="post">
            <h1>Ingrese los nuevos datos</h1>
            <table Class="tabla">
                <tr>
                    <td colspan="2">Nombre de Etapa:
                        <input type="text" name="etapa_nombre" size="40" placeholder="Nombre Etapa" required pattern="[A-ZÑ,Á,É,Í,Ó,Ú]{1}[a-zA-Z\sñ,á,é,í,ó,ú,ü{1,}" title="Indique el Nombre de Etapa"/>
                    </td>
                </tr>
            </table>
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="CrearEtapa.asp" method="post">
                            <input type="submit" value="Agregar" title="Agregue la Etapa" class="btn-agregar" />
                        </form>
                    </div>
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="../RecuperarEtapas.asp" method="post">
                            <input type="submit" value="Listado de Etapas" title="Vuelva al listado de Etapas">
                        </form>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</body>
</html>