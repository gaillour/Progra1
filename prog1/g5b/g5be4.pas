program g5be4;

{Se pide compactar un arreglo (eliminar los ceros que contiene) generando otro arreglo}

const
    N=15;
type
    vec=array[1..N] of byte;

const
    vi:vec=(4,5,5,2,0,0,1,1,2,0,5,3,2,0,5);

procedure compactar(vi:vec;var vf:vec;var nf:byte);
var
    i:byte;
begin
    nf:=0;
    for i:=1 to N do
    begin
        if vi[i]<>0 then
        begin
            nf:=nf+1;
            vf[nf]:=vi[i];
        end;
    end;
end;

procedure mostrar(v:vec;x:byte);
var
    i:byte;
begin
    for i:=1 to x do
    begin
        write(v[i],' ');
    end;
end;

var
    vf:vec;
    nf:byte;

begin
    compactar(vi,vf,nf);
    mostrar(vf,nf);
end.