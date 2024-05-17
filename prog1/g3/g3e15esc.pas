program g3e15esc;

var
    c1,c2,user:char;
    ccont,ccom:byte;
    arch:Text;

begin
    assign(arch,'frase.txt'); reset(arch);
    ccont:=0;ccom:=0;
    write('ingrese letra: ');
    readln(user);
    read(arch,c1);
    if c1=user then
    begin
        ccont:=ccont+1;
        ccom:=ccom+1;
    end;
    while c1<>'.' do
    begin
        read(arch,c2);
        if c2=user then
        begin
            if c1=' ' then
            begin
                ccont:=ccont+1;
                ccom:=ccom+1;
            end
            else ccont:=ccont+1;
        end;
        c1:=c2;
    end;
    close(arch);
    writeln('la cantidad de palabras que contienen la letra ',user,' son: ', ccont);
    writeln('la cantidad de palabras que comienzan con la letra ',user,' son: ', ccom);
end.