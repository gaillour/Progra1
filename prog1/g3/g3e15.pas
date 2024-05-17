program g3e15;

{A partir de un archivo de texto que contiene una secuencia de caracteres terminada en punto, 
desarrollar un programa para cada item: 
a)  Cuántas palabras comienzan con una letra que ingresa por teclado. 
b)  Cuántas palabras contienen una letra que ingresa por teclado}
var
    arch:text;
    car,letra:char;
    ccont,ccom:byte;

begin
    assign(arch,'frase.txt'); reset(arch);
    ccont:=0;ccom:=0;
    write('ingrese una letra: ');
    readln(letra);
    read(arch,car);
    if car=letra then
    begin
        ccont:=ccont+1;
        ccom:=ccom+1;
    end;
    while (not eof(arch)) and (car<>'.') do
    begin
        read(arch,car);
        if car=' ' then
        begin
            read(arch, car);
            if car=letra then
            begin
                ccont:=ccont+1;
                ccom:=ccom+1;
            end
        end;
        if car=letra then
        begin
            ccont:=ccont+1;
            repeat
                read(arch,car);
            until (car=' ') or (car='.');
        end;
    end;
    writeln(' la cantidad de palabras que empiezan con ',letra,' son: ',ccom);
    writeln(' la cantidad de palabras que contienen la letra: ',letra,' son: ',ccont);
end.