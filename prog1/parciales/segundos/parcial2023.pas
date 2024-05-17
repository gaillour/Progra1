program parcial2023;


const 
    n=5;
    m=3;
type
    tbyte= array [1..n,1..m] of byte;
    treal=array[1..n,1..m] of real;
    nivel=record
        nivel,total:byte;
        tprom:real;
    end;
    tv=array[1..n]of nivel;

const
    matautos:tbyte=((4,5,15),(1,0,3),(10,3,9),(6,8,7),(2,1,3));
    mathoras:treal=((9.5,15,20),(6,0,24),(15.3,10.5,9),(12,11,14),(4,1,6.5));

procedure generar(var vniveles:tv;var iniveles:byte);
var 
    i,j,tot:byte;
    entra:boolean;
    tothoras:real;
begin
    i:=0;iniveles:=0;
    while i<=n do
    begin
        i:=i+1; tot:=0; tothoras:=0;
        entra:=true;
        for j:=1 to m do 
        begin
            if matautos[i,j]<>0 then
            begin
                tot:=tot+matautos[i,j];
                tothoras:=tothoras+mathoras[i,j];
            end
            else entra:=false;        
        end;
        if entra then
        begin
            iniveles:=iniveles+1;
            with vniveles[iniveles] do
            begin
                nivel:=i;
                total:=tot;
                tprom:=tothoras/total;
            end;
        end;
    end;
end;

procedure cant(x,i,j,c,cnivel:byte);
begin
    if (i<=n) then
    begin
        if (j<=m) then
        begin
            if matautos[i,j]<x then
                cant(x,i,j+1,c,cnivel)
            else if (cnivel=0) then
            begin
                cnivel:=cnivel+1;
                c:=c+1;
                cant(x,i,j+1,c,cnivel)
            end;
        end
        else cant(x,i+1,1,c,0)
    end;
end;



procedure mostrar(var vniveles:tv;iniveles:byte);
var
    i:byte;
begin
    for i:=1 to iniveles do
    begin
        with vniveles[i] do
        begin
            writeln(nivel,' ', total,' ', tprom:4:2);
        end;
    end;
end;

var
    vniveles:tv;
    iniveles,x,c:byte;
    

begin
generar(vniveles,iniveles);
mostrar(vniveles,iniveles);
readln(x);
c:=0;
cant(x,1,1,c,0);
writeln('la cantidad de niveles es: ', c);

end.