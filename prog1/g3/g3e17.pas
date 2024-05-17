program g3e17;

{La cajera de un supermercado ha registrado varias ventas, de cada una sabe: 
  Nombre del cliente ( “ ***** “ indica fin de datos ) 
  Cantidad de artículos que compró el cliente  y por cada uno se conoce: 
- Precio base del artículo              
- Si está o no en promoción  ( ‘S’ ó ‘N’ ) 
En el caso de estar en promoción, se realiza un descuento del 10% sobre el precio base. 
Se pide ingresar los datos e informar: 
a)  Monto total de cada venta, el total del descuento y el precio final a pagar. 
b)  Nombre del cliente que compró la mayor cantidad de artículos en oferta. 
c)  Cuántos clientes compraron solo artículos en oferta}

var
    arch:text;
    nombre,nomoferta:string[7];
    cantv,i,coferta,maxoferta,csoferta:byte;
    pbase,monto,desc:real;
    promocion,blanco:char;
    soferta:boolean;

begin
    Assign(arch,'ventas.txt'); Reset(arch);
    maxoferta:=0; 
    csoferta:=0;
    while not eof(arch) do
    begin
        read(arch, nombre, cantv);
        soferta:=true;
        monto:=0;
        desc:=0;
        coferta:=0;
        for i:=1 to cantv do
        begin
            read(arch,pbase,blanco,promocion);
            promocion:=upcase(promocion);
            monto:=monto+pbase;
            if promocion='S' then
            begin
                desc:=desc+pbase*(0.1);
                coferta:=coferta+1;
            end
            else soferta:=false;
        end;
        if soferta=true then
            csoferta:=csoferta+1;
        if coferta>maxoferta then
        begin
            maxoferta:=coferta;
            nomoferta:=nombre;            
        end;
        readln(arch);
        writeln(nombre,' monto total:',monto:4:2,' descuento: ', desc:4:2,' precio final: ',(monto-desc):4:2);
    end;
    close(arch);
    writeln('el que compro mas articulos en oferta fue: ', nomoferta);
    writeln('hubieron ', csoferta,' personas que compraron solo articulos en oferta');
end.