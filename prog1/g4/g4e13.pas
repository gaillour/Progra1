program g4e13;

{Desarrollar  un  procedimiento  que  dada  una  Hora  Inicial  (horas,  minutos,  segundos)  y  unos 
segundos transcurridos, devuelva la Hora Final (en horas, minutos y segundos)}


procedure tiempo(var hi,mi,si,st,hf,mf,sf:integer);
var 
    mt,ht:integer;
begin
mt:=trunc((st)/60);
ht:=trunc((mt+mi)/60);
sf:=st mod 60;
mf:=mt mod 60 -1;
hf:=hi + ht;
end;

var
    hi,mi,si,st,hf,mf,sf:integer;
begin

readln(hi,mi,si,st);

tiempo(hi,mi,si,st,hf,mf,sf);

writeln(hf,':',mf,':',sf);
end.