program g8be11;

{Desarrollar un procedimiento recursivo para imprimir una media pirámide de dígitos como se 
muestra a continuación: 
1 
2 1 
3 2 1 
4 3 2 1 
5 4 3 2 1 
6 5 4 3 2 1 
7 6 5 4 3 2 1 
8 7 6 5 4 3 2 1 
n=9 8 7 6 5 4 3 2 1}

procedure piramide(n,i,j:byte);
begin
    if j<=n then
    begin
        if i>0 then
        begin
            write(i,' ');   
            piramide(n,i-1,j);         
        end
        else 
        begin
            writeln;
            j:=j+1;
            piramide(n,j,j);
        end;
    end;
end;


var
    n:byte;
begin
    n:=9;
    piramide(n,1,1);
end.