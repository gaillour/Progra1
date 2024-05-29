program insercionteoria;

type
    tv=array[1..5] of byte;

const
    v:tv=(2,4,7,1,3);
    v2:tv=(2,4,7,1,3);
    vord:tv=(2,3,5,7,9);

procedure elimina(var v:tv;var n:byte;pos:byte); // elimina elemento en posicion pos
var
    i:byte;
begin
    for i:=POS to n-1 do
        v[i]:=v[i+1];
    n:=n-1;
end;

procedure inserta(var v:tv;var n:byte;pos,x:byte);
var
    i:Byte;
begin
    for i:=n downto pos do
        v[i+1]:=v[i];
    v[pos]:=x;
    n:=n+1;
end;

procedure insertaOrd(var V:tv;var n:byte; X:byte);
var
    j:byte;
begin
    j:=n;
    while (j>0) and (X<V[j]) do
    begin
        v[j+1]:=v[j];
        j:=j-1;
    end;
    V[j+1]:=X;
    n:=n+1;    
end;

procedure mostrar(var v:tv;n:Byte);
var 
    i:byte;
begin
    for i:=1 to n do 
        write(v[i],' ');
end;

var
    n,pos,m,x,l:byte;

begin
    n:=5;m:=5;x:=10;l:=5;
    pos:=5;
    mostrar(v,n);
    writeln;
    elimina(v,n,pos);
    write('luego de eliminar la poscicion ', pos, ' el vector tiene ',n,' unidades: ');
    writeln;
    mostrar(v,n);
    inserta(v2,m,pos,x);
    writeln;
    write('luego de insertar ',x,' en la poscicion ',pos,' el vector tiene ',m,' unidades: ');
    writeln;
    mostrar(v2,m);
    writeln;

    insertaOrd(Vord,l,6);
    mostrar(vord,l);
end.