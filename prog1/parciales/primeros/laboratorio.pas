program laboratorio;


type
    st6=string[6];
    tst6=array[1..15] of st6;
    treal=array[1..15] of real;


procedure leer(var codigos:tst6; var vigg,vigm:treal; var n:byte);
var
    arch:text;
    codigo:st6;
    igg,igm:real;
    blanco,son:char;
begin
    assign(arch,'hisopados.txt'); reset(arch);
    n:=0;
    while not eof(arch) do
    begin
        readln(arch,codigo,blanco,son,igg,igm);
        if son='S' then
        begin
            n:=n+1;
            codigos[n]:=codigo;
            vigg[n]:=igg;
            vigm[n]:=igm;
        end;
    end;    
end;


{b)Dado un Código de paciente K ingresado por teclado, informar su IGM e IGG 
(puede no existir)}
procedure informar(codigo:tst6;var igg,igm:real;var vigg,vigm:treal;k:st6;n:byte);
var
    i:Byte;
begin
    i:=0;
    while (i<=n) and (codigo[i]<>k) do
        i:=i+1;
    
    if codigo[i]=k then
    begin
        igg:=vigg[i];
        igm:=vigm[i]
    end
    else 
    begin
        igg:=0;
        igm:=0;
    end;
end;

{c) El porcentaje de pacientes que han obtenido un IGM superior al IGG 
(sobre el total de pacientes con PCR positivo).}

function porcentaje(vigm,vigg:treal;n:byte):real;
var
    cont,i:byte;

begin
    i:=0; cont:=0;
    while i<=n do
    begin
        i:=i+1;
        if vigm[i]>vigg[i] then
            cont:=cont+1;
    end;
    porcentaje:=cont/n;
  
end;


var
    codigos:tst6;
    vigg,vigm:treal;
    i,n:byte;
    igg,igm:real;
    k:st6;

begin
leer(codigos,vigg,vigm,n);

writeln(' codigos igg igm');
for i:=1 to n do
    writeln(codigos[i],'  ',vigg[i]:3:1,' ',vigm[i]:3:1);
  
write('ingrese codigo a buscar: ');
readln(k);
k:=upcase(k);
informar(codigos,igg,igm,vigg,vigm,k,n);
if igg<>0 then
    writeln('el igg del paciente con codigo ',k, ' es: ',igg:3:1,' y el igm: ',igm:3:1)
else writeln(' no hay ninguno con ese codigo');

writeln('el porcentaje de pacientes con pcr positivo que tuvieron igm mayot a igg fue: ',porcentaje(vigm,vigg,n):4:2)

end.