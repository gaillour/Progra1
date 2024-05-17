program nov2015;

const
    m=7;//dias
    MAX=15;
type    
    Tr=record
        nombre:string;
        horas:byte;
    end;
    tm=array[1..MAX,1..m] of byte;
    tv=array[1..MAX] of string;
    tvR=array[1..MAX] of Tr;
    

procedure leer(var mat:tm;var vec:tv;var n:byte;m:byte);
var
    arch:text;
    j,i:byte;
begin
    assign(arch,'choferes.txt'); reset(arch);
    readln(arch,n);
    for i:=1 to n do
    begin   
        readln(arch,vec[i]);
        read(arch,j);
        while (j>0) and (j<=7) do
        begin
            readln(arch,mat[i,j]); 
            read(arch,j);
        end;
        readln(arch);
    end;  
    close(arch);
end;

function diaMenor(mat:tm;n,m:byte):byte;
var
    jmin,i,j:byte;
    min,suma:word;
begin
    min:=999;
    for j:=1 to m do
    begin
        suma:=0;
        for i:=1 to n do  
            suma:=suma+mat[i,j];          
        if suma<min then
        begin
            min:=suma;
            jmin:=j;
        end;
    end;
    diaMenor:=jmin;    
end;

procedure todosLosDias(mat:tm;vec:tv;var choferes:tvr;n,m:byte;var k:byte);
var
    total,i,j:byte;
    
begin
    k:=0;
    for i:=1 to n do
    begin
        j:=1;total:=0;
        while (j<=m) and (mat[i,j]>0) do
        begin
            total:=total+mat[i,j];
            j:=j+1;
        end;
        if (j>m) then
        begin
            k:=k+1;
            choferes[k].nombre:=vec[i];
            choferes[k].horas:=total;
        end;
    end;    
end;


function buscaChofer(choferes:tvr;k:byte;chofer:string):byte;
var
    i:byte;
begin
    i:=1;
    while (i<k) and (choferes[i].nombre<>chofer) do
        i:=i+1;
    if choferes[i].nombre=chofer then buscaChofer:=i
    else buscaChofer:=0;
end;

procedure mostrarmatyvec(mat:tm;vec:tv;n,m:byte);
var
    i,j:byte;
begin
    for i:=1 to n do
    begin
        Write(vec[i],': ');
        for j:=1 to m do
        begin
            write(mat[i,j]:2);
        end;
        writeln;
    end;
end;

procedure inicializar(var mat:tm;i,j,m:byte);
begin
    if i>0 then
    begin
        if j>0 then
        begin
            mat[i,j]:=0;
            inicializar(mat,i,j-1,m);
        end
        else inicializar(mat,i-1,m,m);
    end;
end;

procedure cantCeros(mat:tm;i,j:byte;var cant:byte);
begin
    if i>0 then
    begin
        if mat[i,j]=0 then
            cant:=cant+1;
        cantCeros(mat,i-1,j,cant);
    end;
    
end;

var
    mat:tm;
    vec:tv;
    i,n,k,pos,col,cant:byte;
    choferes:tvr;
    chofer:string;
begin
    inicializar(mat,7,m,m);//n entra despues
    leer(mat,vec,n,m);
    mostrarmatyvec(mat,vec,n,m);
    writeln('dia que menos se trabajo: ',diaMenor(mat,n,m));
    todosLosDias(mat,vec,choferes,n,m,k);
    for i:=1 to k do
        writeln(choferes[i].nombre,' ',choferes[i].horas);

    write('ingrese nombre de usuario: ');
    Readln(chofer);
    pos:=buscaChofer(choferes,k,chofer);
    if pos>0 then writeln(chofer,' trabajo ',choferes[pos].horas,' horas')
    else writeln('no se encontro a ', chofer);

    col:=4;cant:=0;
    cantCeros(mat,n,col,cant);
    writeln('cantidad de ceros en la columa ',col,': ',cant);

end.