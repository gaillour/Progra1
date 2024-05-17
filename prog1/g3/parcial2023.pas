program parcial2023;

{juangaillour@gmail.com;jerearango@gmail.com;ale@hotmail:}

var
    c1,c2:char;
    cnom,carr:byte;
    valida,desparr:boolean;
    arch:text;

begin
    assign(arch,'mails.txt'); reset(arch);
    read(arch,c1);
    cnom:=0;valida:=true;carr:=0;desparr:=false;
    while c1<>':' do
    begin
        read(Arch,c2);
        if (c1=';') and  (valida) and (carr=1) then
        begin
            write(cnom,' ');
            cnom:=0;desparr:=false;valida:=true;carr:=0;
        end;
        if (c1='@') then
        begin
            if not ((c2 in ['a'..'z'])or(c2 in ['A'..'Z'])or(c2 in ['0'..'9'])) then
                valida:=false;
            desparr:=true;
            carr:=carr+1;
        end;
        if desparr and valida then
        begin
            if (c1='.') and not (c2 in ['a'..'z'])or(c2 in ['A'..'Z'])or(c2 in ['0'..'9']) then
                valida:=false;
        end
        else cnom:=cnom+1;
        c1:=c2;
    
    end;
    close(arch);
    

end.