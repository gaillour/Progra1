program g8be2;

{           1           si i=0
    f(i)= 1+f(i-1)      si i es par
           f(i-1)       si i es impar
}    

function f(i:integer):integer;
begin
    if i=0 then f:=1
    else if i mod 2 = 0 then f:=1+f(i-1)
    else f:=f(i-1)
end;


var 
    i:integer;
begin
    i:=4 ;
    writeln(f(i));
end.