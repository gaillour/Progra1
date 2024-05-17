program g4be8;

{En un archivo de texto se registraron las compras de N titulares de tarjetas de
crédito de la siguiente forma: 
- Código de Cliente y a continuación sus compras: no se sabe cuántas son, por 
cada una: 
    • Tipo de compra: (C=combustible, S=supermercado, O=otros, F=fin de datos)
    • Día  (1..31) 
    • Monto 

Se pide: 
a)  Código del cliente y total abonado, por cada cliente que no se benefició con ningún descuento. 
b)  Cuántos clientes obtuvieron descuento en los tres rubros. 
c)  Informar cuánto ahorró cada cliente. 
En  la  solución  debe  desarrollar  la  función  Descuento,  que  a  partir  del  tipo  de  compra,  día  y  monto 
devuelva el correspondiente descuento. }


function descuento(tipo:char;dia:byte;monto:real):real;
var
    aux:real;
begin
{   - 5% los días 10, 20 y 30 para el tipo Otros si el monto supera los $300. 
    - 10% para Combustible en la 2º quincena. 
    - 15% para Supermercado en la 1º quincena. 
}
    if (tipo='O') and (monto>300) and (dia in [10,20,30]) then
        aux:=monto*0.05
    else if (tipo='C') and (dia>15) then
        aux:=monto*0.10
    else if (tipo='S') and (dia<=15) then
        aux:=monto*0.15;
    descuento:=aux;
end;


var
    arch:Text;
    dia,i,n:byte;
    nombre:string;
    desc,monto,montotot:real;
    tipo:char;
begin
    assign(arch,'e8.txt'); reset(arch);
    readln(arch,n);
    for i:=1 to n do
    begin
        desc:=0;montotot:=0;
        readln(arch,nombre);
        read(arch,tipo);
        tipo:=upcase(tipo);
        while tipo<>'F' do
        begin
            readln(arch,dia,monto);
            montotot:=montotot+monto;
            desc:=desc+descuento(tipo,dia,monto);
            read(Arch,tipo);
        end;
        ReadLn(arch);
        if desc<=0.000000000001 then {desc=0 no anda}
            writeln(nombre,' no tuvo ningun descuento y pago ',montotot:4:2)
        else writeln(nombre,' ahorro ',desc:4:2);
    end;
    close(arch);

end.