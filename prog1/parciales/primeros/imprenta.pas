program imprenta;


{if contadordeblancos=palabra[i]
funcion costo aparte}

type
    tbyte=array[1..10] of byte;
    treal=array[1..10] of real;

const
    x=1.0;

function costo(cpal,tamanio:byte;car:char):real;
var
    imp:real;
begin
    imp:=cpal*x;
    case car of
        'A': imp:=imp*2;
        'B': imp:=imp*3;
        'C': imp:=imp*5;
    end;
    if tamanio=2 then
        costo:=imp*(1.5)
    else costo:=imp;
end;


procedure leer(var vcant,vmasl:tbyte; var vcosto:treal; var n:byte);
var
    arch:text;
    abc,car:char;
    clet,tamanio:byte;
begin
    assign(arch,'datos.txt'); reset(arch);
    n:=0;
    while not eof(arch) do
    begin
        n:=n+1;
        vmasl[n]:=0; vcant[n]:=0;
        read(arch,abc,tamanio,car);
        while car<>'.' do
        begin
            if car=' ' then
                read(arch,car)
            else
            begin
                vcant[n]:=vcant[n]+1;  
                clet:=0;     
                while (car<>'.') and (car<>' ') do
                begin
                    clet:=clet+1;
                    read(arch,car);
                end;    
                if clet>vmasl[n] then
                    vmasl[n]:=clet;       
            end;
        end;
        vcosto[n]:=costo(vcant[n],tamanio,abc);
        readln(arch);
    end;
    close(arch);
end;

{a) Indicar el costo del folleto que contenga la palabra mas larga,
 si hay mas de uno el costo promedio de los mismos.}

function costomasl(vmasl:tbyte;vcosto:treal;n:byte):real;
var
    i,m,cant,im:byte;
    sum:real;
begin
    m:=0; cant:=0;
    for i:=1 to n do 
    begin
        if vmasl[i]>m then
        begin
            m:=vmasl[i];
            im:=i;     
        end;
    end;
    for i:=im to n do
    begin
        if vmasl[i]=m then
        begin
            sum:=sum+vcosto[i];
            cant:=cant+1;
        end;
    end;
    costomasl:=sum/cant;
end;


{Para un entero NCANT que ingresa por teclado, buscar el primer folleto que contenga
exactamente NCANT palabras y mostrar su costo. (considerar que puede no existir)}

function buscar(vcant:tbyte;vcosto:treal;n,ncant:byte):real;
var
    i:byte;
begin
    i:=0;
    while (i<=n) and (vcant[i]<>ncant ) do
        i:=i+1;
    if vcant[i]<>ncant then
        buscar:=0
    else buscar:=vcosto[i]; 

end;


var
    vcant,vmasl:tbyte;
    vcosto:treal;
    n,ncant,i:byte;
    folleto:real;

begin
leer(vcant,vmasl,vcosto,n);

writeln('   cant masl  costo');
for i:=1 to n do    
    writeln(i,':   ',vcant[i],'   ',vmasl[i],'   ', vcosto[i]:4:2 );

writeln(costomasl(vmasl,vcosto,n):4:2);

write('ingrese cant palabras a  buscar: ');
readln(ncant);
folleto:=buscar(vcant,vcosto,n,ncant);
if folleto=0 then
    writeln('no hay ninguno con ',ncant,' palabras')
else writeln('el costo del primer folleto con ',ncant,' palabras fue: ',folleto:4:2);



end.