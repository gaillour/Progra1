program parcial2019;

type
    str=string[3];
    vnombre=array[1..6] of string;
    vdigitos=array[1..6] of str;
    vtiempo=array[1..6] of integer;


procedure leer(var usuario:vnombre;var ip:vdigitos;var tiempo:vtiempo;var n:byte);
var
    arch:text;
    car,cletras,j:char;

begin
    assign(arch,'bank.txt');
    reset(arch); n:=0;
    while not eof(arch) do
    begin
        n:=n+1;
        usuario[n]:='';
        read(arch,car);
        while car <>' ' do
        begin
            if car in ['1'..'9']then
            begin
                cletras:=car;
                for j:='1' to cletras do 
                begin
                    read(arch,car);              
                    usuario[n]:=usuario[n]+car;
                end
            end
            else read(arch,car);
        end;
        read(arch,ip[n]);
        repeat
            read(arch,car);
        until car=' ';
        read(arch, tiempo[n]);
    end;
end;

//a)
function tacceso(nombre:string;usuario:vnombre;tiempo:vtiempo;n:byte):integer;
var
    i:byte;
begin
    for i:=1 to n do 
    begin
        if usuario[i]=nombre then
            tacceso:=tiempo[i]
        else tacceso:=0;
    end;
end;

//b)
function tprominternacionales(ip:vdigitos; tiempo:vtiempo;n:byte):real;
var
    i,cant:byte;
    suma:integer;
begin
    tprominternacionales:=0; suma:=0; cant:=0;
    for i:=1 to n do 
    begin
        if (ip[i]<>'192') and (ip[i]<>'276') and (ip[i]<>'381')  then
            begin
                suma:=suma+tiempo[i];
                cant:=cant+1;
            end;
    end;
    if cant=0 then
        tprominternacionales:=0
    else tprominternacionales:=suma/cant;

end;

function tmayorinterna(usuario:vnombre;ip:vdigitos;tiempo:vtiempo;n:byte):string;
var 
    i,iusuario:byte;
    tmax:integer;
begin
    tmax:=0;
    for i:=1 to n do
        begin
            if (ip[i]='192') and (tiempo[i]>tmax) then
            begin
                iusuario:=i;
                tmax:=tiempo[i];                  
            end;
        end;
    tmayorinterna:=usuario[iusuario];
end;

var
    usuario:vnombre;
    ip:vdigitos;
    nombre:string;
    tiempo:vtiempo;
    i,n:byte;

begin
leer(usuario,ip,tiempo,n);
for i:=1 to n do
    writeln(i,': ', usuario[i],' ',ip[i],' ',tiempo[i]);

write('Ingrese el usuario: ');
readln(nombre);
nombre:=upcase(nombre);
writeln('El tiempo de acceso de ', nombre, ' fue: ', tacceso(nombre,usuario,tiempo,n));

writeln('el tiempo promedio de acceso en redes internacionales fue: ', tprominternacionales(ip,tiempo,n):4:2);

writeln('el usuario de mayor tiempo en la red local fue: ', tmayorinterna(usuario,ip,tiempo,n));


end.