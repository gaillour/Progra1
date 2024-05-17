program presion;


const
    MAX=40;
type
    tvs=array[1..MAX] of string;
    tvb=array[1..MAX] of byte;


function esriesgo(pmax,pmin:byte):boolean;
var
    dif:byte;
begin
    dif:=pmax-pmin;
    if ((pmax>140) and (pmin>90)) or ((pmax<100) and (pmin<65)) or (dif<=25) then
        esriesgo:=true
    else esriesgo:=false    
end;

procedure leer(var vnom:tvs; var vedad,vriesgo:tvb;var n:byte);
var
    arch:text;
    pmax,pmin,clet:byte;
    car:char;
    nom:string;
    
begin
    assign(arch,'presion.txt'); reset(arch);
    n:=0;
    while not eof(arch) do
    begin
        read(Arch,pmax,pmin);
        if esriesgo(pmax,pmin) then
        begin
            n:=n+1;nom:='';clet:=0;
            read(arch,car);
            while car<>'.' do
            begin
                if (car='&') or (car='#') or (car='%') then
                begin
                    read(arch,car);
                    nom:=nom+car;
                end
                else read(arch,car);
                if (car<>' ') and (car<>'.') then
                    clet:=clet+1;
            end;
            vnom[n]:=nom;
            vedad[n]:=clet*5;
            vriesgo[n]:=pmax-pmin;
        end;
        readln(arch);
    end;
    close(arch);
end;


//a)Para un rango de edades [E1, E2], la diferencia promedio 
function difpromedio(e1,e2:byte;vedad,vriesgo:tvb;n:Byte):real;
var
    i,cant:byte;
    sum:integer;
begin
    sum:=0;cant:=0;
    for i:=1 to n do
    begin
        if (vedad[i]>=e1) and (vedad[i]<=e2) then
        begin
            cant:=cant+1;
            sum:=sum+vriesgo[i];
        end;
    end;
    difpromedio:=sum/cant;
end;

//Nombre y Edad de la persona de máxima diferencia
procedure maxdif(vnom:tvs; var vedad,vriesgo:tvb;var n,maxedad:byte;var maxnom:string);
var
    i,imax,max:byte;    
begin   
    max:=0;
    for i:=1 to n do
    begin
        if vriesgo[i]>max then
        begin
            max:=vriesgo[i];
            imax:=i;
        end;
    end;
    maxedad:=vedad[imax];
    maxnom:=vnom[imax];    
end;

procedure mostrar(vnom:tvs;vedad,vriesgo:tvb;n:byte);
var
    i:byte;
begin
    for i:=1 to n do
        writeln(vnom[i],' ',vedad[i],' ',vriesgo[i])
end;


    
var
    vnom:tvs; 
    vedad,vriesgo:tvb;
    e1,e2,i,n,maxedad:byte;
    maxnom:string;
    
begin
    leer(vnom,vedad,vriesgo,n);
    mostrar(vnom,vedad,vriesgo,n);


    write('ingrese [E1,E2], E1: '); readln(e1);
    write('E2: ');readln(e2);
    writeln('la diferencia promedio entre ',e1,' y ',e2,' es: ', difpromedio(e1,e2,vedad,vriesgo,n):4:2);

    maxdif(vnom,vedad,vriesgo,n,maxedad,maxnom);
    writeln(maxnom,': ',maxedad);

end.