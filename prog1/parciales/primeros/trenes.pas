program trenes;

type
    st4=string[4];
    st8=string[8];
    vreserva=array[1..20] of st4;
    vdni=array[1..20] of st8;
    vint=array[1..20] of integer;


procedure leer(var reserva:vreserva; var dni:vdni; var edad,peso:vint; var n,cant:byte);
var
    arch:text;
    blanco:char;

begin
    assign(arch,'checkin.txt'); reset(arch);
    readln(arch,n);
    cant:=0;
    while not eof(arch) do
    begin
        cant:=cant+1;
        readln(arch, reserva[cant],blanco,dni[cant],edad[cant], peso[cant]);
        writeln(reserva[cant],blanco,dni[cant],' ',edad[cant],peso[cant]);
    end;
end;

var 
    reserva:vreserva;
    dni:vdni;
    edad,peso:vint;
    n,i,cant:byte;

begin
leer(reserva,dni,edad,peso,n,cant);
for i:=1 to cant do
    writeln(i,': ', reserva[i],' ', dni[i],' ', edad[i],' ',peso[i]);
  
end.