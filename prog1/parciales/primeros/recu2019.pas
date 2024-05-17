program recu2019;

type 
    str=string[8];
    tnom=array[1..15]of str;
    tentero=array[1..15] of integer;

procedure leer(var vnom:tnom;var vedad,vriesgo:tentero;var n:byte);
var
    arch:text;
    pmin,pmax:integer;
    car:char;
    cant:byte;
begin
    assign(arch,'pacientes.txt');
    reset(arch);
    n:=0; 
    while not eof(arch) do
    begin
        read(arch,pmax,pmin);
        if ((pmin>90) and (pmax>140)) or ((pmin<65) and (pmax<100)) or ((pmax-pmin)<=25) then
        begin //leer nombre
            cant:=0;
            n:=n+1;
            vriesgo[n]:=pmax-pmin;
            read(arch,car);
            while car<>'.' do
            begin
                if (car='#') or (car='&') or (car='%') then
                begin
                    read(arch,car);
                    vnom[n]:=vnom[n]+car;
                end
                else read(arch,car);
                cant:=cant+1;
            end;
            vedad[n]:=cant*5;
        end
        else readln(arch); //saltear
    end;
end;

function diferenciaprom(e1,e2:integer;vedad,vriesgo:tentero;n:byte):real;
var
    i,cant:byte;
    sum:integer;
begin
    sum:=0;cant:=0;
    for i:=1 to n do 
    begin
        if (vedad[i]>e1) and (vedad[i]<e2) then
        begin
            sum:=sum+vriesgo[i];
            cant:=cant+1;  
        end;
    end; 
    diferenciaprom:=sum/cant;

end;

procedure maxdif(var vnom:tnom;var vedad,vriesgo:tentero;var edad:integer; var nombre:string; n:byte);
var
    i,ie:byte;
    max:integer;
begin
    max:=0;
    for i:=1 to n do
        if vriesgo[i]>max then
        begin
            max:=vriesgo[i];
            ie:=i;        
        end;
    edad:=vedad[ie];
    nombre:=vnom[ie];  
end;

var 
    vnom:tnom; 
    vedad,vriesgo:tentero;
    n,i,e1,e2:byte;
    edad:integer;
    nombre:string;


begin
leer(vnom,vedad,vriesgo,n);

for i:=1 to n do
    writeln(i,': ', vnom[i],' ',vedad[i],' ',vriesgo[i]);

readln(e1,e2);
writeln(diferenciaprom(e1,e2,vedad,vriesgo,n):4:2);

maxdif(vnom,vedad,vriesgo,edad,nombre,n);
writeln('el paciente de mayor riesgo es: ', nombre,' de ', edad,' años');

end.