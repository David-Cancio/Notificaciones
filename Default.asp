<!--#include file="Partials/UTF8Asp.asp"-->
<html>
<!--#include file="Partials/Head.asp"-->
<body>
       <!--#include file="Partials/Header.asp"-->
    <div class="fondo">
        <h1>Bienvenido a la Universidad de Mataderos</h1>
        <h1>¡Agregue Datos Nuevos!</h1>
        <form action="Partials/Desarrollador/EjemploEstudiante.asp" method="post">
            <input type="submit" value="Ejemplo de Estudiante">
        </form>
        <form action="Partials/Desarrollador/EjemploProfesor.asp" method="post">
            <input type="submit" value="Ejemplo de Profesor">
        </form>
        <form action="Partials/Desarrollador/EjemploMateria.asp" method="post">
            <input type="submit" value="Ejemplo de Materia">
        </form>
        <form action="Partials/Desarrollador/RecargarBaseDeDatos.asp" method="post">
            <input type="submit" value="Recargar Base de Datos">
        </form>
    </div>   
    <!--#include file="Partials/ScriptBootstrap.asp"-->
</body>
</html>