program direccionip;

const
    MAX=50;

type
    st3=string[3];
    tvs=array[1..MAX] of string;
    tvs3=array[1..MAX] of st3;
    tvi=array[1..MAX] of integer;


function desencriptar(encriptado:string):string;
var

    i,j:byte;
    aux:string;
    m,err:integer;
begin
    aux:='';j:=0;
    while j<Length(encriptado) do
    begin
        j:=j+1;
        if encriptado[j] in ['1'..'9'] then
        begin
            val(encriptado[j],m,err);
            for i:=1 to m do
            begin
                j:=j+1;
                aux:=aux+encriptado[j];
            end;
        end;    
    end;
    desencriptar:=aux;
end;


procedure leer(var vnom:tvs;var vip:tvs3; var vtiempo:tvi; var n:byte);
var
    encriptado,desencriptado:string;
    car:char;
    i:byte;
    arch:text;
begin
    assign(arch,'2019.txt'); reset(arch);
    n:=0;
    while not eof(arch) do
    begin
        n:=n+1;encriptado:='';vip[n]:='';
        read(arch,car);
        while car<>' ' do
        begin
            encriptado:=encriptado+car;
            read(arch,car);
        end;
        desencriptado:=desencriptar(encriptado);
        vnom[n]:=desencriptado;
        for i:=1 to 3 do
        begin
            read(arch,car);
            vip[n]:=vip[n]+car;
        end;
        repeat read(arch,car) until car=' ';
        readln(arch,vtiempo[n]);
    end;
    close(arch);
end;


var
    n:byte;
    vnom:tvs;
    vip:tvs3;
    vtiempo:tvi;
    i:byte;
    

begin
    leer(vnom,vip,vtiempo,n);
    for i:=1 to n do
        writeln(vnom[i],' ',vip[i],' ',vtiempo[i]);

end.