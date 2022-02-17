<!--#include virtual="/Partials/Utf8Asp.asp"-->
<%%>
<html>
    <!--#include virtual="/Partials/head.asp"-->
<body>
    <!--#include virtual="/Partials/header.asp"-->

    <div class="listado">   
        <form action="CrearError.asp" method="post">
            <h1>Ingresar nuevo Error</h1>
            <table Class="tabla">
                <tr>
                    <td>Codigo:
                            <input type="number" name="prm_error_codigo" placeholder="Numero de Error" title="Indique el numero del error" min="0"/>
                    </td>
                    <td>Nombre:
                            <input type="text" name="prm_error_nombre" size="40" placeholder="Nombre del Error" required pattern="[A-ZÑ,Á,É,Í,Ó,Ú]{1}[a-zA-Z\sñ,á,é,í,ó,ú,ü{1,}" title="Indique el Nombre del Error"/>
                    </td>
                    <td colspan="2">Descripción:
                            <input type="text" name="prm_error_descripcion" size="40" placeholder="Descripción del Error" required pattern="[A-ZÑ,Á,É,Í,Ó,Ú]{1}[a-zA-Z\sñ,á,é,í,ó,ú,ü{1,}" title="Indique la Descripción del Error"/>
                    </td>
            </table>
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="CrearError.asp" method="post">
                            <input type="submit" value="Agregar" title="Agregue el Error" class="btn-agregar" />
                        </form>
                    </div>
                    <div class="col-sm-7 col-md-6 py-2">
                        <form action="../RecuperarError.asp" method="post">
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