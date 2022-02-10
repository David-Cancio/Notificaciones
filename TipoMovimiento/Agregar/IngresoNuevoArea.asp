<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%%>
<html>
    <!--#include virtual="/Partials/head.asp"-->
<body>
    <!--#include virtual="/Partials/header.asp"-->

    <div>
        <form action="CrearTipoMovimiento.asp" method="post">
            <h1>Ingrese los nuevos datos</h1>
            <table Class="tabla">
                <tr>
                    <td colspan="2">Tipo de Movimiento:
                            <input type="text" name="tipoMov-nombre" size="40" placeholder="Tipo Movimiento" required pattern="[A-ZÑ,Á,É,Í,Ó,Ú]{1}[a-zA-Z\sñ,á,é,í,ó,ú,ü{1,}" title="Indique el Tipo de Movimiento"/>
                    </td>
                </tr>
            </table>
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="CrearTipoMovimiento.asp" method="post">
                            <input type="submit" value="Agregar" title="Agregue el Tipo de Movimiento" />
                        </form>
                    </div>
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="../RecuperarTipoMovimientos.asp" method="post">
                            <input type="submit" value="Listado de Movimientos" title="Vuelva al listado de Movimientos">
                        </form>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
   <!--#include virtual="Partials/ScriptBootstrap.asp"-->
</html>