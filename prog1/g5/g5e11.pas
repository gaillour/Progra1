program g5e11;

{De una competencia de atletismo se tienen los siguientes datos del lanzamiento de jabalina:  
• Nombre del competidor   (ordenado ascendentemente por este dato) 
• 1º lanzamiento 
• 2º lanzamiento 
Se pide: 
a)  Cuántos competidores superaron con el 2º lanzamiento el 1º. 
b)  Nombre del atleta que registró la mejor marca. 
c)  Dado el Nombre de un atleta, informar la marca que realizó en ambos lanzamientos. 
d)  Generar un nuevo arreglo con los participantes que pasaron a la semifinal (aquellos que superaron 
una marca X establecida en el 1º ó 2º lanzamiento). Mostrar ambos arreglos}

type
    nombre=array[1..6]of string[5];
    lanzamiento=array[1..6] of integer;

procedure leer(var arch:text;var nom:nombre; var pri,seg:lanzamiento;var n:byte);
var 
    name: string[5];
    p,s:integer;
begin
    assign(arch,'jabalina.txt');
    reset(arch);
    n:=0;
    while not eof(arch) do 
    begin
        readln(arch, name,p,s);
        n:=n+1;
        nom[n]:=name;
        pri[n]:=p;
        seg[n]:=s;
    end;
end;


{a)  Cuántos competidores superaron con el 2º lanzamiento el 1º. }
function segundo(pri,seg:lanzamiento;n:byte):byte;
var
    i:byte;
begin
    segundo:=0;
    for i:=1 to n do
    begin
        if seg[i]>pri[i] then
        segundo:=segundo+1;
    end;
end;


{b)  Nombre del atleta que registró la mejor marca. }
procedure mejormarca(var nom:nombre;var pri,seg:lanzamiento; var n:byte; var mejor:string);
var
    i,pos:byte;
    max:integer;

begin
    max:=pri[1];
    for i:=1 to n do
    begin
        if pri[i]>max then
        begin
            max:=pri[i];
            pos:=i;  
        end;
        if seg[i]>max then
        begin
            max:=seg[i];
            pos:=i;
        end;        
    end;
    mejor:=nom[pos];

end;


{c)  Dado el Nombre de un atleta, informar la marca que realizó en ambos lanzamientos. }
procedure ambos(var nom:nombre; var pri,seg:lanzamiento; var atleta:string;var l1,l2:integer;var n:byte);
var 
    i:integer;

begin
    i:=0;
    while (i<n) and (nom[i]<>atleta) do 
    begin
        i:=i+1;
    end;
    l1:=pri[i];
    l2:=seg[i];
end;


{d)  Generar un nuevo arreglo con los participantes que pasaron a la semifinal (aquellos que superaron 
una marca X establecida en el 1º ó 2º lanzamiento). Mostrar ambos arreglos}
procedure asemis(var nom,semis:nombre; var pri,seg:lanzamiento; var x:integer; var n:byte);
var 
    i,j:byte;

begin
    i:=0; j:=0;
    while i<n do
    begin
        i:=i+1;
        if pri[i]>x then
        begin
            j:=j+1;
            semis[j]:=nom[i];
        end
        else if seg[i]>x then
        begin
            j:=j+1;
            semis[j]:=nom[i];          
        end;
    end;
end;

var 
    arch:text;
    nom,semis:nombre;
    pri,seg:lanzamiento;
    i,j,k,n,l:byte;
    mejor,atleta:string;
    l1,l2,x:integer;

begin
leer(arch,nom,pri,seg,n);
for i:=1 to n do
    write(nom[i],' ');
writeln;
for j:=1 to n do
    write(pri[j], ' ');
writeln;
for k:=1 to n do
    write(seg[k],' ');
writeln;
writeln('cant de veces q el segundo tiro supero al primero: ', segundo(pri,seg,n));

mejormarca(nom,pri,seg,n,mejor);
writeln('atleta con mejor marca: ', mejor);

write('elije nombre de atleta (llenar con blancos 5 caracteres): ');
readln(atleta);
ambos(nom,pri,seg,atleta,l1,l2,n);
writeln('primer tiro: ', l1);
writeln('segundo tiro: ', l2);

write('marca minima para llegar a semis: ');
readln(x);
asemis(nom,semis,pri,seg,x,n);
for l:=1 to Length(semis) do
    write(semis[l],' ');

end.
