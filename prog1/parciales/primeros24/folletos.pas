program folletos;

const
    MAX=30;
type
    tvb=array[1..MAX] of byte;
    tvr=array[1..MAX] of real;

function costo(cpal,tamanio:byte;tipo:char):real;
var
    aux:real;
begin
    aux:=cpal;
    case tipo of
        'A':aux:=aux*2;
        'B':aux:=aux*3;
        'C':aux:=aux*5;
    end;
    if tamanio=2 then aux:=aux*1.5;
    costo:=aux;
end;

procedure contar(frase:string;var cantpal,maxlet:byte);
var
    clet,i:byte;
begin
    i:=1;cantpal:=0;
    while i<=length(frase) do
    begin
        if (frase[i]<>' ') and (frase[i]<>'.')  then
        begin
            clet:=clet+1;
            i:=i+1;
        end
        else 
        begin
            repeat
                i:=i+1; 
            until (frase[i]<>' ') or (frase[i]='.');
            cantpal:=cantpal+1;
            if clet>maxlet then maxlet:=clet;
            clet:=0;
        end;
    end;    
end;

procedure leer(var vcant,vmasl:tvb;var vcosto:tvr;var n:byte);
var
    arch:Text;
    tipo:char;
    frase:string;
    tamanio,cantpal,maxlet:byte;
begin
    assign(arch,'folletos.txt'); reset(arch);
    n:=0;
    while not eof(arch) do 
    begin
        n:=n+1;maxlet:=0;cantpal:=0;
        read(arch,tipo,tamanio);
        readln(arch,frase);
        contar(frase,cantpal,maxlet);
        vcant[n]:=cantpal;
        vmasl[n]:=maxlet;
        vcosto[n]:=costo(cantpal,tamanio,tipo);
    end;    
    close(arch);
end;

{ Indicar el costo del folleto que contenga la palabra mas larga, 
si hay mas de uno el  costo promedio de los mismos.}
function costomax(vcosto:tvr;vmasl:tvb;n:byte):real;
var
    sum,max:real;
    cant,i:byte;
begin
    max:=0;cant:=0;sum:=0;
    for i:=1 to n do
    begin
        if vmasl[i]>max then
        begin
            max:=vmasl[i];sum:=vcosto[i];cant:=1;
        end
        else if vmasl[i]=max then
        begin
            sum:=sum+vcosto[i];
            cant:=cant+1;
        end;
    end;
    costomax:=sum/cant;
end;

{Para un entero X que ingresa por teclado,  buscar  el primer folleto que contenga
exactamente X palabras y mostrar  su costo. (considerar que puede no existir)}
function xpal(vcant:tvb;vcosto:tvr;n,x:byte):real;
var 
    i:byte;
begin
    i:=1;
    while (i<n) and (vcant[i]<>x) do
        i:=i+1;
    if vcant[i]=x then
        xpal:=vcosto[i]
    else xpal:=0;
end;


var
    vcant,vmasl:tvb;
    vcosto:tvr;
    n,i,x:byte;
    costox:real;

begin
    leer(vcant,vmasl,vcosto,n);
    for i:=1 to n do
    begin
        writeln(vcant[i],' ',vmasl[i],' ',vcosto[i]:4:2);
    end;
    writeln('el maximo es: ',costomax(vcosto,vmasl,n):4:2);
    readln(x);
    costox:=xpal(vcant,vcosto,n,x);
    if costox<>0 then writeln(x,': ',costox:4:2)
    else writeln('no existe');
end.