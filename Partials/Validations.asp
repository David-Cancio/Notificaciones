<% 
function MayusculaTodas(var)
dim mayuscula
mayuscula=UCase(mid(var,1,len(var)))
MayusculaTodas=mayuscula
end function

function MayusculaPrimera(var)
dim mayuscula
mayuscula=UCase(left(var,1)) & LCase(mid(var,2,len(var)))
MayusculaPrimera=mayuscula
end function
            
function SacarNumeros(var)
dim sacar0
dim sacar1
dim sacar2
dim sacar3
dim sacar4
dim sacar5
dim sacar6
dim sacar7
dim sacar8
dim sacar9
sacar0=replace(var,"0","")
sacar1=replace(sacar0,"1","")
sacar2=replace(sacar1,"2","")
sacar3=replace(sacar2,"3","")
sacar4=replace(sacar3,"4","")
sacar5=replace(sacar4,"5","")
sacar6=replace(sacar5,"6","")
sacar7=replace(sacar6,"7","")
sacar8=replace(sacar7,"8","")
sacar9=replace(sacar8,"9","")
SacarNumeros=sacar9
end function

function ValidarNumeros(var)
if isnumeric(var) then
ValidarNumeros="True"
else
ValidarNumeros="False"
end if
end function

function EliminarEspacios(var)
dim eliminar
eliminar=Trim(var)
EliminarEspacios=eliminar
end function
            
function ValidarLen(var,var2,var3)
dim validar
validar=len(var)
if validar < CInt(var2) or validar > CInt(var3) then
ValidarLen="False"
else
ValidarLen="True"
end if
end function

function ValidarNull(var)
if IsNull(var) or IsEmpty(var) then
ValidarNull=""
else
ValidarNull=var
end if
end function

function SacarBarras(var)
dim sacarBarra
sacarBarra=replace(var,"/","")
SacarBarras=sacarBarra
end function

function SacarPuntos(var)
dim sacarPunto
sacarPunto=replace(var,":","")
SacarPuntos=sacarPunto
end function
%>