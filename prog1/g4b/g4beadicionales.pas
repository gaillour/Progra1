program g4beadicionales;

{Ej 16) Mediante una función booleana determinar si un número es capicúa. 
 
Ej 17) Mediante una función booleana informar si un número es primo. 
 
Ej 18) Desarrollar la Función MCD que devuelve el máximo común divisor entre dos 
números. 
 
Ej  19)  Hacer  un  programa  que  dada  una  fracción  (numerador  y  denominador)
la  simplifique  usando  la función MCD.}

//16)
function capicua(n:integer):boolean;
var
    i:byte;
    alreves,s:string;
begin
    str(n,s);
    alreves:='';
    for i:=Length(s) downto 1 do
    begin
        alreves:=alreves+s[i];
    end;
    if alreves=s then capicua:=True
    else capicua:=false;
end;

//17)
function primo(n:word):boolean;
var
    i:byte;
begin
    primo:=true;
    i:=2;
    while (n mod i<>0) and (i<n) do
        i:=i+1;
    if n mod i=0 then primo:=false;
end;

//18) discreta
function MCD(a, b: Integer): Integer;
begin
  while b <> 0 do
  begin
    a := a mod b;
    if a = 0 then
      MCD := b
    else
      b := b mod a;
  end;
  MCD := a;
end;

//19)
procedure simplificar(var n,d:integer);
var
    max,aux:integer;
begin
    if n mod d = 0 then
    begin
        max:=mcd(d,n);
        n:=round(n/max);
        d:=round(d/max)
    end
    else if d mod n =0 then
    begin
        max:=mcd(n,d);
        n:=round(n/max);
        d:=round(d/max)
    end
end;


var
    capi:integer;
    num:word;
    a,b,max:integer;
    n,d:integer;
begin
    capi:=2332;
    if capicua(capi) then writeln(capi, ' es capicua')
    else writeln(capi,' no es capicua');

    num:=7;
    if primo(num) then writeln(num,' es primo')
    else writeln(num,' no es primo');

    a:=18;
    b:=24;
    if a>b then max:=mcd(a,b)
    else max:=mcd(b,a);
    writeln('el mcd entre ',a,' y ',b,' es: ',max);

    n:=6;
    d:=18;
    write(n,'/',d,' simplificado es: ');
    simplificar(n,d);
    if d<>1 then write(n,'/',d)
    else write (n);
    writeln;
    n:=18;
    d:=6;
    write(n,'/',d,' simplificado es: ');
    simplificar(n,d);
    if d<>1 then write(n,'/',d)
    else write (n);
end.