program g4be7;

{Un estudio contable registró la facturación de varios comercios en los últimos N meses,
por cada uno se tiene: 
  Nombre 
  Tipo (S/N) si es Responsable Inscripto o No, y luego por cada uno de los N meses: 
- Importe facturado mensual sin IVA 
Se desea saber: 
a)  Listar Nombre, tipo y cuánto pagó de IVA en los N meses. 
b)  El nombre del comercio Responsable Inscripto que menos facturó en total. 
 
Desarrollar la función Impuesto con los parámetros necesarios de modo tal que devuelva 
el monto de IVA que debe pagar. Sabiendo que si es Responsable Inscripto, corresponde 
el 21% de la compra, si no lo es, el 21%+10%.}

{
    N=3
    mcdonalds S 324 5231 235
    burguer N 432 52 323

}
function impuesto(responsable:char;total:real):real;
var
    aux:real;
begin
    if responsable='S' then
        aux:=total*0.21
    else if responsable='N' then
        aux:=total*0.21+total*0.1;
    impuesto:=aux;
end;

procedure leer(var arch:text);
var
    n,i:byte;
    mes,total,iva,menortot:real;
    nombre,menosfact:string;
    responsable,car:char;
    
begin
    assign(arch,'e7.txt'); reset(arch);
    readln(arch,n);  
    menortot:=9999;
    while not eof(Arch) do
    begin
        total:=0;
        nombre:='';
        repeat
            read(Arch,car);
            nombre:=nombre+car;
        until car=' ';
        read(Arch,responsable);
        responsable:=upcase(responsable);
        for i:=1 to n do 
        begin       
            read(arch,mes);
            total:=total+mes;            
        end;
        if total<menortot then
        begin
            menortot:=total;
            menosfact:=nombre;
        end;
        iva:=impuesto(responsable,total);
        writeln(nombre,' responsable inscripto: ',responsable,'. Pago: ',iva:4:2,' de iva');
    end;  
    writeln('el comercio que menos facturo fue: ', menosfact);
    close(arch);
end;


var
    arch:text;
begin
    leer(arch);

end.