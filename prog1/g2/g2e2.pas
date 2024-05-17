program g2e2;

{indentar
Readln(temp);
If temp<0 then writeln(‘No salgo de casa….’)
Else if (temp>=0)and(temp<20) then writeln(‘Hace frio’)
Else if (temp>=20)and(temp<25)and(temp<29) then writeln(‘Barbaro’)
Else if(temp>=29) then writeln(´Qué calor!!’);}

begin
    Readln(temp);
    If temp<0 then 
        writeln('No salgo de casa….')
    Else if (temp>=0)and(temp<20) then
        writeln('Hace frio')
    Else if (temp>=20)and(temp<25)and(temp<29) then 
        writeln('Barbaro')
    Else if(temp>=29) then 
        writeln('Qué calor!!');
  
end.