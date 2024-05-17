program recu2020;

const 
    maxventas=60; //pueden haber dos turnos por dia
type
    ventas=record
        dia:byte;
        turno:char;
        cp1,cp2,cp3:byte;
        total:real;
    end;
    tv=array[1..maxventas] of ventas;

procedure leer(var vdias:tv;var n:byte);
var
    arch:text;
    blanco:char;
    cprom,tprom,i:byte;
begin
    assign(arch,'recu2020.txt'); reset(arch);
    n:=0;
    while not eof(Arch)do
    begin
        n:=n+1;
        
        read(arch,vdias[n].dia,blanco,vdias[n].turno);
        while not eoln(arch) do
        begin
            read(arch,cprom);
            for i:=1 to cprom do
            begin
                read(arch,tprom);    
                case tprom of 
                    1:vdias[n].cp1:=vdias[n].cp1+1;
                    2:vdias[n].cp2:=vdias[n].cp2+1;
                    3:vdias[n].cp3:=vdias[n].cp3+1;
                end;
            end;
        end;
        readln(arch);
    end;           
end;

//Dado un día ingresado por teclado, mostrar la recaudación total 
//incluyendo ambos turnos (tener en cuenta que el día puede no existir o no tener ventas en algún turno
function recaudacion(vdias:tv;dia,n:byte):real;
var
    i:byte;
    aux,auxn:real;
begin   
    i:=0;
    while (i<n) and (dia>vdias[i].dia) do
        i:=i+1;
    if dia=vdias[i].dia then
    begin
        aux:=vdias[i].cp1*700+vdias[i].cp2*400+vdias[i].cp3*500;
        if vdias[i+1].dia = dia then
        begin
            auxn:=(vdias[i+1].cp1*700+vdias[i+1].cp2*400+vdias[i+1].cp3*500);
            auxn:=auxn+auxn*(0.1);
            aux:=aux+auxn;
        end;
    end
    else aux:=0;
    recaudacion:=aux;

end;

procedure total(var vdias:tv;n:byte);
var
    i:byte;

begin
    for i:=1 to n do
    begin
        vdias[i].total:=recaudacion(vdias,vdias[i].dia,n);  //busca el dia todas las veces 
                                                            //tendria q poner un dia de una
    end;    
end;

procedure mostrar(var vdias:tv;n:byte);
var
    i:byte;
begin
    for i:=1 to n do 
    begin
        with vdias[i] do
        begin
            writeln(dia,' ', turno,' ', cp1,cp2,cp3,' ',total:4:2);
        end;
    end;
end;

{Mostrar la Matriz óInicializar la Matriz 
- Obtener la recaudación de un determinado turno de determinado día}


var
    vdias:tv;
    n,dia:byte;
    rec:real;

begin
leer(vdias,n);
total(vdias,n);
mostrar(vdias,n);
repeat
    write('ingrese dia a buscar: ');
    readln(dia);
until dia<=30;
rec:=recaudacion(vdias,dia,n);

if rec>0 then
    writeln(rec:4:2)
else writeln('no hubieron ventas en ese dia');

end.