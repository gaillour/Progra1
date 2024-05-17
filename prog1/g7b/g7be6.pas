program g7be6;

const
    max=40;
type
    TrE=record
        i,j,val:byte;
    end;
    tv=array[1..max] of TrE;

procedure leer(var arch:Text;var vec:tv;var n,m,cont:byte);
begin
    readln(arch,n,m);
    cont:=0;
    while not eof(arch) do  
    begin   
        cont:=cont+1;
        with vec[cont] do
            readln(arch,i,j,val);
    end;
end;

procedure Mostrar(vec:tv;n,m,cont:byte);
var
    a,b,c:byte;
begin
    for a:=1 to n do
    begin
        for b:=1 to m do
        begin
            c:=1;
            while (c<cont) and (vec[c].i<>a) or (vec[c].j<>b) do
                c:=c+1;
            with vec[c] do
            begin
                if (i=a) and (j=b) then write(val,' ')
                else write('0 ');
            end;
        end;
        writeln;
    end;
    writeln;
end;

    
procedure sumar(v1,v2:tv;n1,m1,c1,c2:byte);
var
    a,b,k,n:byte;
    suma:tv;
    esta:boolean;
begin
    for k:=1 to c1 do
        suma[k]:=v1[k];
    n:=c1;
    for b:=1 to c2 do
    begin
        esta:=false;
        for a:=1 to c1 do
        begin
            if (v1[a].i=v2[b].i) and (v1[a].j=v2[b].j) then
            begin
                suma[a].val:=suma[a].val+v2[b].val;
                esta:=true;
            end;
        end;
        if not esta then
        begin
            n:=n+1;
            suma[n]:=v2[b];
        end;
    end;
    Mostrar(suma,n1,m1,n);
end;


var
    arch1,arch2:text;
    n1,m1,n2,m2,c1,c2,i:byte;
    v1,v2:tv;

begin
    assign(arch1,'e61.txt');Reset(arch1);
    assign(arch2,'e62.txt');Reset(arch2);
    leer(arch1,v1,n1,m1,c1);
    leer(arch2,v2,n2,m2,c2);
    Close(Arch1);close(arch2);
    mostrar(v1,n1,m1,c1);
    mostrar(v2,n2,m2,c2);
    if c1>c2 then sumar(v1,v2,n1,m1,c1,c2)
    else sumar(v2,v1,n1,m1,c2,c1)
end.