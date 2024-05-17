program busqueda;

const 
    n=8;
type
    tv=array[1..n] of integer;
const
    v:tv=(2,4,5,-2,3,8,15,9);
    w:tv=(-2,2,3,4,5,8,9,15);

//el elemento puede no estar

function esta(v:tv;n:byte;x:integer):boolean;
var
    i:byte;
begin
    i:=1;
    while (i<=n) and (v[i]<>x) do
        i:=i+1;

    esta:=v[i]=x;   //(v[i]=x) puede ser true o false
end;

function estapos(v:tv;n:byte;x:integer):byte;
var 
    i:byte;
begin
    i:=1;
    while (i<=n) and (v[i]<>x) do
        i:=i+1;
    if v[i]=x then
        estapos:=i
    else estapos:=0;
end;

//se sabe que esta 

function busca(v:tv;n:byte;x:integer):byte;
var
    i:byte;
begin
    i:=1;
    while v[i]<>x do
        i:=i+1;
    busca:=i;
end;

//arreglo ordenado

function buscaord(w:tv;n:byte;x:integer):byte;
var
    i:byte;
begin
    i:=1;
    while (i<n) and (x>w[i]) do
        i:=i+1;
    if x=w[i] then
        buscaord:=i
    else buscaord:=0;
end;

//busqueda binaria

function binaria(w:tv;n:byte;x:integer):boolean;
var
    medio,pri,ult:byte;
begin
    pri:=1;
    ult:=n;
    medio:=(pri+ult) div 2;
    while (pri<ult) and (x<>v[medio]) do
    begin
        if x<v[medio] then
            ult:=medio-1
        else pri:=medio+1;
        medio:=(pri+ult) div 2;
    end;
    binaria:=x=v[medio]
end;

function posbinaria(w:tv;n:byte;x:integer):byte;
var
    medio,pri,ult:byte;
begin
    pri:=1;
    ult:=n;
    medio:=(pri+ult) div 2;
    while (pri<ult) and (x<>v[medio]) do
    begin
        if x<v[medio] then
            ult:=medio-1
        else pri:=medio+1;
        medio:=(pri+ult) div 2;
    end;
    posbinaria:=medio
end;


var 
    x:integer;

begin

writeln(esta(v,n,3));
writeln(estapos(v,n,7));
writeln(busca(v,n,-2));
writeln(buscaord(w,n,3));
writeln(binaria(w,n,3));
writeln(posbinaria(w,n,3));

end.