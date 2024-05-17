program g7be2;

{En una matriz Tablero de 8x8 se almacenó una jugada de ajedrez. Además, se sabe la posición (i,j) 
de una de las Torres Negras, y que juegan las negras. Determinar e informar a qué piezas “defiende”
la Torre y a cuáles “amenaza”, sabiendo que las piezas tienen dos atributos: 
     Tipo: R = Rey, Q = Reina, A = Alfil, T = Torre, C = Caballo, P = Peón 
     Color: 1 = Blanco, 2 = Negro 
Nota: armar el Tablero leyendo desde archivo, donde en cada línea viene (fila, col, Tipo, Color)}

const
    n=8;

type
    TrP=record
        tipo:char;
        color:byte;
    end;
    tm=array[1..n,1..n] of TrP;
    tv=array[1..n] of TrP;


procedure inicializar(var mat:tm);
var
    i,j:byte;
begin
    for i:=1 to n do
    begin
        for j:=1 to n do
        begin
            mat[i,j].color:=0;
            mat[i,j].tipo:='J';
        end;
    end;
    
end;

procedure armarTablero(var mat:tm);
var
    arch:Text;
    i,j:byte;
    car:char;
begin
    assign(arch,'e2.txt'); reset(arch);
    while not eof(arch) do
    begin
        read(arch,i,j);
        with mat[i,j] do
        begin
            repeat
                read(arch,car);
            until car<>' ';
            tipo:=car;
            readln(arch,color);
        end;
    end;    
    close(arch);
end;

procedure mostrar(mat:tm);
var
    i,j:byte;
begin
    for i:=1 to n do
    begin
        for j:=1 to n do
        begin
            with mat[i,j] do
            begin
                if (color<>1) and (color<>2) then write('-- ')
                else write(tipo,color,' ');
            end;
        end;
        writeln;
    end;
end;

procedure piezasColumna(mat:tm; it,jt:byte;var at,def:tv;var na,nd:byte);
var
    i,j,k:ShortInt;
begin
    j:=jt;
    for k:=-1 to 1 do
    begin
        if k<>0 then
        begin
            i:=it+k;
            while (i<n) and (i>0) and (mat[i,j].color<>1) and (mat[i,j].color<>2) do
                i:=i+(1*k);
            with mat[i,j] do
            begin
                if color=1 then
                begin
                    na:=na+1;
                    at[na]:=mat[i,j];
                end
                else if color=2 then
                begin
                    nd:=nd+1;
                    def[nd]:=mat[i,j];
                end;
            end;
        end;
    end;
end;

procedure piezasFila(mat:tm; it,jt:byte;var at,def:tv;var na,nd:byte);
var
    i,j,k:ShortInt;
begin
    i:=it;
    for k:=-1 to 1 do
    begin
        if k<>0 then
        begin
            j:=jt+k;
            while (j<n) and (j>0) and (mat[i,j].color<>1) and (mat[i,j].color<>2) do
                j:=j+(1*k);
            with mat[i,j] do
            begin
                if color=1 then
                begin
                    na:=na+1;
                    at[na]:=mat[i,j];
                end
                else if color=2 then
                begin
                    nd:=nd+1;
                    def[nd]:=mat[i,j];
                end;
            end;
        end;
    end;
end;

procedure torre(var mat:tm;var i,j:byte);
begin
    write('ingrese i: ');readln(i);
    write('ingrese j: ');readln(j);
    mat[i,j].tipo:='T';
    mat[i,j].color:=2;
end;

procedure mostrartorre(at,def:tv;na,nd:byte);
var
    i,j:byte;
begin
    write('ataca: ');
    for i:=1 to na do
    begin
        Write(at[i].tipo,at[i].color,' ');
    end;
    writeln; write('defiende: ');
    for i:=1 to nd do
    begin
        WriteLn(def[i].tipo,def[i].color,' ');
    end;
end;
var
    mat:tm;
    na,nd,it,jt,i:byte;
    at,def:tv;

begin
    inicializar(mat);
    armarTablero(mat);
    torre(mat,it,jt);//guarda la torre en la matriz y su pos en (it,jt)
    mostrar(mat);
    na:=0;nd:=0;
    piezasColumna(mat,it,jt,at,def,na,nd);
    piezasFila(mat,it,jt,at,def,na,nd);
    mostrartorre(at,def,na,nd);
end. 