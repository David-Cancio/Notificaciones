<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%%>
<html>
    <!--#include virtual="/Partials/head.asp"-->
<body>
    <!--#include virtual="/Partials/header.asp"-->

    <div>
        <form action="CrearArea.asp" method="post">
            <h1>Ingrese los nuevos datos</h1>
            <table Class="listado">
                <tr>
                    <td colspan="2">Nombre del Área:
                            <input type="text" name="area_nombre" size="40" placeholder="Nombre Área" required pattern="[A-ZÑ,Á,É,Í,Ó,Ú]{1}[a-zA-Z\sñ,á,é,í,ó,ú,ü{1,}" title="Indique el Nombre del Área"/>
                    </td>
                </tr>
            </table>
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="CrearArea.asp" method="post">
                            <input type="submit" value="Agregar" title="Agregue el Área" />
                        </form>
                    </div>
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="../RecuperarAreas.asp" method="post">
                            <input type="submit" value="Listado de Áreas" title="Vuelva al listado de Áreas">
                        </form>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
   <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</html>