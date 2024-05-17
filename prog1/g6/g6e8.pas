program g6e8;
{ Sea un conjunto A de enteros y una relación R, se pide 
a) Generar la matriz booleana MatR que representa una relación R.  
b) Determinar si R es: 
 Reflexiva  
 Simétrica}

type
    mat=array[1..10,1..10] of byte;
    tvec=array[1..5] of Byte;
const 
    vec:tvec=(1,2,3,9,18);

procedure relacion(var matr:mat;var n:byte);
var
    i,j:byte;
begin
    n:=Length(vec);
    for i:=1 to n do
    begin
        for j:=1 to n do
        begin
            if vec[i] mod vec[j]= 0 then
                matr[j,i]:=1
            else matr[j,i]:=0;
        end;

    end;    
    
end;

procedure mostrarmat(var matr:mat;var n:byte);
var
    i,j:byte;
begin
    for i:=1 to n do
    begin
        for j:=1 to n do
            write(matr[i,j],' ');
        writeln;
    end;
end;

function reflexiva(matr:mat;n:byte):boolean;
var
    i:byte;
begin   
    i:=1;
    while (i<n) and (matr[i,i]=1) do
        i:=i+1;
    reflexiva:=matr[i,i]=1;
end;

function simetrica(matr:mat;n:byte):boolean;
var
    i,j:byte;
begin
    i:=0;j:=0;
    simetrica:=true;
    for i:=1 to n do 
    begin
        for j:=1 to n do
        begin
            if matr[i,j]=1 then
            begin
                if matr[j,i]=0 then
                    simetrica:=false;
            end;    
        end;
    end;    
end;

var
    matr:mat;
    n:Byte;

begin
relacion(matr,n);
mostrarmat(matr,n);
writeln('reflexiva: ',reflexiva(matr,n));
writeln('simetrica: ',simetrica(matr,n));


end.