program g5e6;

{ Escriba un programa que lea una frase (secuencia de caracteres separada por espacio, coma, punto) 
y mediante un menú de opciones calcule e informe: 
a)  El número de palabras que contiene.  
b)  La longitud de la palabra más larga.  
c)  De todas las palabras, la que aparece antes en el diccionario. Analizar las alternativas de 
almacenar dicha palabra en un arreglo de caracteres o en un string. 
d)  la frecuencia de cada letra (mayúscula o minúscula) que aparece en la frase. 
No es necesario almacenar toda la frase en un arreglo.}

type
    frase=array[1..35] of char;
    abc=array['a'..'z'] of byte;

procedure leer(var arch:text;var f:frase);
var 
    c:char;
    i:byte;
begin
    i:=0;
    assign(arch,'frase.txt');
    reset(arch);
    while not eof(arch) do
    begin
        read(arch,c);
        if (c<>'.') and (c<>',') then
        begin
            i:=i+1;
            f[i]:=c;
        end;       
    end;
end;

//a)
function contar(f:frase):byte;
var
    i:integer;
begin
    contar:=0;
    for i:=1 to Length(f) do 
        begin
          if (f[i]=' ') or (i=Length(f)) then
            contar:=contar+1
        end
end;

//b)
function maslarga(f:frase):byte;
var
    i,c:byte;
begin
    c:=0; maslarga:=0; 
    for i:=1 to Length(f) do 
        begin
            if f[i]<>' ' then
               c:=c+1
            else 
            begin
                if c>maslarga then
                  maslarga:=c;
                c:=0;
            end;
        end;
end;


//c)



//d)
procedure frecuencia(var f:frase; var letras:abc);
var
    i:byte;
begin
    for i:=1 to Length(f) do
        begin
          letras[f[i]]:=letras[f[i]]+1;
        end  
end;

var
    arch:text;
    i:byte;
    f:frase;
    letras:abc;
    letra:char;

begin
leer(arch,f); 
writeln;
write('frase: ');
for i:=1 to Length(f) do 
    write(f[i]);

writeln;

writeln('palabras: ', contar(f));

writeln('cant de letras de la palabra mas larga: ', maslarga(f));

frecuencia(f,letras);
write('ingrese letra: ');
readln(letra);
write('cant de veces que aparece la letra ',letra, ': ',letras[letra]);

writeln;  
end.