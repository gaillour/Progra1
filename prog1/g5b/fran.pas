program fran;
const
  max=50;
type
  tvclave=array[1..max]of string;
  tvprom=array[1..max]of real;
  tvcar=array[1..max]of char;


procedure leer(var vclaves:tvclave;var vproms:tvprom;var vcars:tvcar;var n:byte);
  var
    c1,c2,c3:integer;
    i,cesp:byte;
    car:char;
    arch:text;
    prom:real;
    clave:string;
    begin
       assign(arch,'e12.txt');reset(arch);
       i:=0;
       while not eof(arch) do
       begin
         clave:='';cesp:=0;prom:=0;
         read(arch,car);
         while car<>' ' do
         begin
            if (car in['a'..'z']) or (car in['A'..'Z']) or (car in['0'..'9']) then
             clave:=clave+car
            else
              cesp:=cesp+1;
            read(arch,car);
         end;
         read(arch,c1,c2,c3);
         repeat
              read(arch,car);
         until car<>' ';
         if (car<>clave[length(clave)]) and (cesp<4) then
         begin
             n:=n+1;
             vclaves[n]:=clave;
             prom:=(c1+c2+c3)/3;
             vproms[n]:=prom;
             vcars[n]:=car;
         end;
          readln(arch);
       end;
    end;
    
procedure mostrarv(v:tvclave;w:tvprom;u:tvcar;c:byte);
var
  i:byte;
  begin
     for i:=1 to c do
         begin
           writeln(i,': ',v[i],' ',w[i]:4:2,' ',u[i],' ');
         end;
  end;

var
  vclaves:tvclave;
  vproms:tvprom;
  vcars:tvcar;
  i,n:byte;
begin
    leer(vclaves,vproms,vcars,n);
    mostrarv(vclaves,vproms,vcars,n);

end.