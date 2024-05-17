program g7e1;

{El departamento de Recursos Humanos de una empresa desea que sus empleados 
fraternicen y decidió cada 3 meses hacer un brindis por los que nacieron en
esa estación del año. Se pide: 
 Leer los datos  (Nombre del empleado y Fecha de Nacimiento) 
 Informar en qué estación del año se festejan más cumpleaños}

type
    st8=string[8];
    persona=record
        nombre:st8;
        mes:byte;
    end;
    tv=array[1..15] of persona;
    vestacion=array[1..4]of byte;

procedure lectura(var vec:tv;var n:byte);
var
    arch:text;
    car:char;
begin
    Assign(arch,'empleados.txt');Reset(arch);
    n:=0;
    while not eof(arch) do
    begin
        n:=n+1;
        with vec[n] do
            readln(arch,nombre,mes);
    end;
end;

procedure mostrar(var vec:tv;var n:byte);
var
    i:byte;
begin   
    for i:=1 to n do 
    begin
        with vec[i] do
            writeln(nombre, ' nacio en el mes: ', mes);
    end;    

end;

procedure inicializar(var vcant:vestacion);
var
    i:Byte;
begin
    for i:=1 to Length(vcant) do
        vcant[i]:=0;       
end;

procedure estaciones(var vec:tv;var vcant:vestacion; var n:byte);
var
    i:byte;
begin
    for i:=1 to n do
    begin
        case vec[i].mes of
            1..3:vcant[1]:=vcant[1]+1;
            4..6:vcant[2]:=vcant[2]+1;
            7..9:vcant[3]:=vcant[3]+1;
            10..12:vcant[4]:=vcant[4]+1;
        end;
    end;

end;

var
    vec:tv;
    n,i:byte;
    vcant:vestacion;
begin
lectura(vec,n);
mostrar(vec,n);
inicializar(vcant);
estaciones(vec,vcant,n);
for i:=1 to Length(vcant) do 
   begin
        case i of
            1:writeln('en verano nacieron: ',vcant[i]);
            2:WriteLn('en otonio nacieron: ', vcant[i]);
            3:WriteLn('en invierno nacieron: ', vcant[i]);
            4:WriteLn('en primavera nacieron: ', vcant[i]);
        end;
   end;
end.