<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%%>
<html>
    <!--#include virtual="/Partials/head.asp"-->
<body>
    <!--#include virtual="/Partials/header.asp"-->

    <div class="listado">   
        <form action="CrearArea.asp" method="post">
            <h1>Ingrese una nueva Área</h1>
            <table Class="tabla">
                <tr>
                    <td colspan="2">Nombre del Área:
                            <input type="text" name="prm_area_nombre" size="40" placeholder="Nombre Área" required title="Indique el Nombre del Área"/>
                    </td>
                </tr>
            </table>
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="CrearArea.asp" method="post">
                            <input type="submit" value="Agregar" title="Agregue el Área" class="btn-agregar" />
                        </form>
                    </div>
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="../RecuperarAreas.asp" method="post">
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