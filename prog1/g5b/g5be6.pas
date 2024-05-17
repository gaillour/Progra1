program g5be6;

{Escriba un programa que lea una frase (secuencia de caracteres separada por espacio, 
coma, punto) 
y mediante un menú de opciones calcule e informe: 
a)  El número de palabras que contiene.  
b)  La longitud de la palabra más larga.  
c)  De todas las palabras, la que aparece antes en el diccionario. Analizar las 
alternativas de almacenar dicha palabra en un arreglo de caracteres o en un string. 
d)  la frecuencia de cada letra (mayúscula o minúscula) que aparece en la frase. 
No es necesario almacenar toda la frase en un arreglo.}

type
    tvmin=array['a'..'z'] of byte;
    tvmay=array['A'..'Z'] of byte;
    tvletra=array['A'..'Z'] of string;



function cantpal():byte;
var
    arch:text;
    aux:byte;
    c1,c2:char;
begin
    assign(arch,'e6.txt'); reset(arch);
    aux:=0;
    read(Arch,c1);
    while c1<>'.' do
    begin
        read(arch,c2);
        if (c2=' ') or (c2='.') or (c2=',') then
        begin
            if (c1 in ['a'..'z']) or (c1 in ['A'..'Z']) then
                aux:=aux+1;
        end;
        c1:=c2;
    end;
    cantpal:=aux;
    Close(arch);
end;

function primera(var abc:tvletra):string;
var     
    i,c1,c2,pl:char;
    palabra:string;
    arch:text;

begin
    assign(arch,'e6.txt'); reset(arch);
    palabra:='';
    read(arch,c1);
    c1:=upcase(c1);
    pl:=c1; {primera letra de cada palabra e indice de diccionario}
    palabra:=palabra+c1;
    while c1<>'.' do
    begin
        read(arch,c2);
        c2:=upcase(c2);
        if (c1 in ['A'..'Z']) and not (c2 in ['A'..'Z']) then
        begin{termino la palabra}
            if abc[pl]='' then
                abc[pl]:=palabra
            else if abc[pl][2]>palabra[2] then
                abc[pl]:=palabra;
            palabra:='';
        end
        else if c2 in ['A'..'Z'] then
        begin
            palabra:=palabra+c2;
        end;
        if not (c1 in ['A'..'Z']) and (c2 in ['A'..'Z']) then
            pl:=c2; 
        c1:=c2;
    end;
    close(arch);

    i:='A';
    while not (abc[i][1] in ['A'..'Z']) and (i<'Z') do
        Ord(i):=ord(i)+1; 
    primera:=abc[i];

    

end;



function palmaslarga():byte;
var
    arch:text;
    max,cc:byte;
    c1,c2:char;
begin
    assign(arch,'e6.txt'); reset(arch);
    max:=0;cc:=0;
    read(Arch,c1);
    while c1<>'.' do
    begin
        read(arch,c2);
        if (c1 in ['a'..'z']) or (c1 in ['A'..'Z'])then
        begin
            if (c2=' ') or (c2='.') or (c2=',')  then
            begin
                if cc>max then
                begin
                    max:=cc;
                    cc:=0;
                end;      
            end
            else cc:=cc+1;
        end;        
        c1:=c2;
    end;
    palmaslarga:=max;
    Close(arch);
end;


procedure frecuencia(var min:tvmin;var may:tvmay);
var
    arch:text;
    c:char;
begin
    assign(arch,'e6.txt'); reset(arch);
    while not eof(arch)do
    begin
        read(arch,c);
        if (c in ['a'..'z']) then
            min[c]:=min[c]+1;
        if (c in ['A'..'Z']) then
            may[c]:=may[c]+1;
    end;    
    close(arch);
end;


procedure menu(var op:char);
begin
    writeln('a) numero de palabras');
    writeln('b) longitud de la palabra mas larga');
    writeln('c) la que aparece antes en el diccionario');
    writeln('d) frecuencia de cada letra');
    writeln('e)salir');
    repeat
        write('ingrese su eleccion: '); readln(op);      
    until (op>='a')and (op<='e');
end;

procedure inicializarmin(var min:tvmin);
var 
    i:char;
begin
    for i:='a' to 'z' do
    begin
        min[i]:=0;    
    end;
end;

procedure inicializarmay(var may:tvmay);
var 
    i:char;
begin
    for i:='A' to 'Z' do
    begin
        may[i]:=0;    
    end;
end;

procedure inicializarletras(var abc:tvletra);
var
    i:char;
begin
    for i:='A' to 'Z' do
        abc[i]:='';
end;

procedure mostrar(min:tvmin;may:tvmay);
var 
    i:char;
begin
    writeln('minusculas:');
    for i:='a' to 'z' do
    begin
        writeln(i,':',min[i]);    
    end;
    writeln('mayusculas:');
    for i:='A' to 'Z' do
    begin
        writeln(i,':',may[i]);   
    end; 
end;

var 
    op:char;
    min:tvmin;
    may:tvmay;
    diccionario:tvletra;
    i:char;
begin

   
        
    repeat 
        menu(op);

        case op of 
            'a':writeln('el numero de palabras es: ',cantpal());
            'b':writeln('la longitud de la palabra mas larga es: ',palmaslarga());
            'c':begin
                inicializarletras(diccionario);
                writeln('la palabra que antes aparece en el diccionario es: ',primera(diccionario));
                end;
            'd':begin
                inicializarmin(min);inicializarmay(may);
                frecuencia(min,may);
                writeln('la frecuencia de cada letra es: ');
                mostrar(min,may);
                end;
        end;
    until  op='e';
end.