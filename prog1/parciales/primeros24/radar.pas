program radar;

const 
    max=40;
type
    st3=string[3];
    st7=string[7];
    tvs3=array[1..max] of st3;
    tvs7=array[1..max] of st7;
    tvr=array[1..max] of real;
    tvb=array[1..max] of byte;

procedure leerzonas(var vzonas:tvs3;var vtazas:tvr;var vcantzona:tvb;var vcostozona:tvr;var n:byte);
var
    arch:text;
begin
    assign(arch,'zonas.txt'); reset(arch);
    n:=0;
    while not eof(Arch) do
    begin
        n:=n+1;
        readln(arch,vzonas[n],vtazas[n]);
        vcantzona[n]:=0;vcostozona[n]:=0;
    end;
    close(arch);
end;


procedure leerradar(var vpatmax:tvs7;vzonas:tvs3;var vcantzona:tvb;var vcostozona:tvr;vtazas:tvr;var cantnoinf:byte;n:byte);
var
    arch:text;
    tipo,velocidad:word;
    blanco1,blanco2:char;
    zona:st3;
    patente:st7;
    multa:real;
    i:byte;
begin
    assign(arch,'radar.txt'); reset(arch);cantnoinf:=0;
    while not eof(Arch) do
    begin
        read(arch,tipo,velocidad);
        if ((tipo=1) and (velocidad>100)) or ((tipo=2) and (velocidad>110)) or ((tipo=3) and (velocidad>90)) then
        begin {es infraccion}
            readln(arch,blanco1,zona,blanco2,patente);
            case tipo of
                1:multa:=1000;
                2:multa:=2000;
                3:multa:=5000;
            end;
            i:=1;
            while (i<n) and (zona<>vzonas[i]) do
                i:=i+1;
            if zona=vzonas[i] then
            begin
                multa:=multa*vtazas[i];
                vcantzona[i]:=vcantzona[i]+1;
                if multa>vcostozona[i] then
                begin
                    vcostozona[i]:=multa;
                    vpatmax[i]:=patente
                end;
            end;
        end
        else 
        begin
            cantnoinf:=cantnoinf+1;     
            readln(arch);
        end;
    end;
    close(arch);
end;

function cantmultas(zona:st3;vzonas:tvs3;vcantzona:tvb;n:byte):byte;
var
    i:byte;
begin
    i:=1;
    while (i<n) and (vzonas[i]<>zona) do
        i:=i+1;
    if vzonas[i]=zona then
        cantmultas:=vcantzona[i]
    else cantmultas:=0;    
end;

var
    i,n,cantnoinf,cmultas:byte;
    vcantzona:tvb;
    vzonas:tvs3;
    vtazas,vcostozona:tvr;
    vpatmax:tvs7;
    zona:st3;


begin
    leerzonas(vzonas,vtazas,vcantzona,vcostozona,n);
    leerradar(vpatmax,vzonas,vcantzona,vcostozona,vtazas,cantnoinf,n);

    writeln(cantnoinf);
    for i:=1 to n do
    begin
        writeln(vzonas[i],' ',vpatmax[i],' ',vcantzona[i]);
    end;

    writeln('ingrese zona a buscar: ');readln(zona);
    cmultas:=cantmultas(zona,vzonas,vcantzona,n);
    if cmultas=0 then   writeln('no esta esa zona')
    else writeln('la cantidad de multas en la zona ',zona,' es de ', cmultas);


end.