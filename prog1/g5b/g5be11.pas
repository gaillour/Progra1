program g5be11;

{De una competencia de atletismo se tienen los siguientes datos del lanzamiento de 
jabalina:  
• Nombre del competidor   (ordenado ascendentemente por este dato) 
• 1º lanzamiento 
• 2º lanzamiento 
Se pide: 
a)  Cuántos competidores superaron con el 2º lanzamiento el 1º. 
b)  Nombre del atleta que registró la mejor marca. 
c)  Dado el Nombre de un atleta, informar la marca que realizó en ambos lanzamientos. 
d)  Generar un nuevo arreglo con los participantes que pasaron a la semifinal 
(aquellos que superaron una marca X establecida en el 1º ó 2º lanzamiento). 
Mostrar ambos arreglos. }

const
    max=20;
    x=5;

type
    tvs=array[1..max] of string;
    tvr=array[1..max] of real;


procedure leer(var nombres:tvs;var pri,seg:tvr;var n:byte);
var
    arch:text;
    car:char;
    primer,segundo:real;
begin
    n:=0;
    assign(arch,'e11.txt'); reset(arch);
    while not Eof(arch) do
    begin
        n:=n+1;
        nombres[n]:='';
        read(arch,car);
        while car<>' ' do
        begin
            nombres[n]:=nombres[n]+car;          
            read(Arch,car);
        end;  
    
        readln(arch,primer,segundo);
        pri[n]:=primer;
        seg[n]:=segundo;
    end;    
    close(arch);
end;

function mejorsegundo(pri,seg:tvr;n:byte):byte;
var
    aux,i:byte;
begin
    aux:=0;
    for i:=1 to n do
    begin
        if seg[i]>pri[i] then
            aux:=aux+1;
    end;
    mejorsegundo:=aux;
end;

function mejormarca(nombres:tvs; pri,seg:tvr; n:byte):string;
var
    imax,i:byte;
    max:real;
begin
    max:=0;
    for i:=1 to n do
    begin
        if (pri[i]>max) or (seg[i]>max) then
        begin
            if pri[i]>=seg[i] then max:=pri[i]
            else max:=seg[i];
            imax:=i            
        end;
    end;
    mejormarca:=nombres[imax];
end;

procedure ambos(nombre:string;nombres:tvs; pri,seg:tvr; n:byte);
var
    i:byte;
begin
    i:=1;
    while (i<n) and (nombres[i]<>nombre) do
        i:=i+1;
    if nombres[i]=nombre then
        writeln(nombre,' marco ',pri[i]:4:2,' y ',seg[i]:4:2)
    else writeln('no se encontro el jugador');
end;

procedure semifinal(nombres:tvs;pri,seg:tvr;n,x:byte;var semi:tvs;var m:byte);
var
    i:byte;
begin
    m:=0;
    for i:=1 to n do
    begin
        if (pri[i]>x) or (seg[i]>x) then
        begin
            m:=m+1;
            semi[m]:=nombres[i];
        end;    
    end;
end;

procedure mostrar(nombres:tvs; pri,seg:tvr; n:byte);
var
    i:byte;
begin   
    for i:=1 to n do
        writeln(nombres[i],' ',pri[i]:4:2, ' ', seg[i]:4:2);    
end;

procedure mostrarsemi(v:tvs;n:byte);
var
    i:byte;
begin
    write('semifinalistas: ');
    for i:=1 to n do
        write(v[i],' ');
end;

var
    nombres,semi:tvs;
    pri,seg:tvr;
    m,n:byte;
    nombre:string;

begin
    leer(nombres,pri,seg,n);
    mostrar(nombres,pri,seg,n);
    writeln('cantidad de competidores que superaron la 1era marca con la 2da: ',mejorsegundo(pri,seg,n));
    writeln(mejormarca(nombres,pri,seg,n),' obtuvo la mejor marca');
    write('ingrese jugador a buscar: ');
    readln(nombre);
    ambos(nombre,nombres,pri,seg,n);
    semifinal(nombres,pri,seg,n,x,semi,m);
    mostrarsemi(semi,m);
end.