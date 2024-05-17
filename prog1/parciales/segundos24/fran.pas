program fran;
const
    max=25;
type
    st8=string[8];
    st2=string[2];
    st10=string[30];
    treg=record
        codprov:st2;
        nomb:st10;
        dist:real;
    end;
    tv=array[1..max] of treg;
    tmat=array[1..max,1..max] of byte;
procedure iniciamat(var mat:tmat;n,m:byte);
var
    i,j:byte;
begin
    for i:=1 to n do
        for j:=1 to m do
            mat[i,j]:=0;
      
end;
function buscapos(vec:tv;n:byte;cod:st2):byte;
var
    i:byte;
begin
    i:=1;
    while (i<=n) and (vec[i].codprov<>cod) do
      i:=i+1;
    if vec[i].codprov=cod then
      buscapos:=i
      else buscapos:=0;
end;
function buscacolum(edad:byte):byte;
var
    aux:byte;
begin
    aux:=0;
    case edad of
            1..9:aux:=aux+1;
            10..19:aux:=aux+2;
            20..29:aux:=aux+3;
            30..39:aux:=aux+4;
            40..49:aux:=aux+5;
            50..59:aux:=aux+6;
            60..69:aux:=aux+7;
            70..79:aux:=aux+8;
            80..89:aux:=aux+9;
            90..99:aux:=aux+10;
        end;
        buscacolum:=aux;
end;
procedure cargarprov(var vec:tv;var n:byte);
var
    arch:text;
begin
    assign(arch,'provincias.txt');reset(arch);
    n:=0;
    while not eof (arch) do
    begin
        n:=n+1;
        with vec[n] do
        readln(arch,codprov);
    end;
    close(arch);
end;

procedure cargarinscrip(var mat:tmat;var m:byte;n:byte;vec:tv);
var
    i,j,pos,colum:byte;
    arch:text;edad:byte;cod:st2;dni:st8;b1:char;
begin
    Assign(arch,'inscriptos.txt');reset(arch);
    m:=0;
    
    while not eof(arch) do
      begin
        m:=m+1;
        readln(arch,dni,edad,b1,cod);
        pos:=buscapos(vec,n,cod);
        colum:=buscacolum(edad);
        mat[pos,colum]:=mat[pos,colum]+1;
    end;
    close(arch);
end;

var
    vec:tv;
    n,i,m,j:byte;
    mat:tmat;
begin
cargarprov(vec,n);
for i:=1 to n do
write(vec[i].codprov,' ');
iniciamat(mat,n,m);
cargarinscrip(mat,m,n,vec);
for i:=1 to n do
  begin
    for j:=1 to m do
      write(mat[i,j]);
      writeln();
end;
end.