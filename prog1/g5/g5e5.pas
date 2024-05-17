
Program g5e5;


{ Dado  un  archivo  de  enteros,  almacenarlos  en  un  arreglo,  luego  obtener  el  promedio  de  todos  los 
números  divisores  del  máximo  y  con  ellos  armar  otro  arreglo.  Mostrar  ambos  arreglos  y  el  promedio 
obtenido.}

Type 
    vec =   array[1..10] Of integer;


procedure leer(Var arch:text;Var v:vec);
var 
    i:byte;
    num:integer;
Begin
    i:=0;
    assign(arch,'enteros5.txt');
    reset(arch);
    While Not eof(arch) Do
    Begin
        read(arch,num);
        i:=i+1;
        v[i]:=num;
    End;    
End;

procedure maximo(var v:vec; var max:integer);
var
    i:byte;
begin
  max:=v[1];
  for i:=1 to Length(v) do 
  begin
    if v[i]>max then
      max:=v[i]
  end;
end;

procedure divisores(var max:integer; var w:vec);
var 
    i,j:byte;
begin
    j:=0;
    for i:=1 to max do
      begin
        if max mod i = 0 then 
            begin
            j:=j+1;
            w[j]:=i;
            end;
      end;
end;

function promedio(var w:vec):real;
var 
    i,c:byte;
    sum:integer;
begin
    sum:=0;c:=0;
    for i:=1 to Length(w) do
      begin
        if w[i]<>0 then 
            begin
              sum:=sum+w[i];
              c:=c+1;
            end;
      end;
    promedio:=sum/c;
end;

var
    i,j:byte;
    v,w:vec;
    arch:text;
    prueba, max:integer;
    prom:real;


Begin

leer(arch,v);
write('numeros: ');
for i:=1 to Length(v) do
  write(v[i],' ');

writeln;

maximo(v,max);
writeln('maximo: ',max);

divisores(max,w);
write('divisores: ');
for j:=1 to Length(w) do
  write(w[j],' ');

writeln;

prom:=promedio(w);
writeln('promedio: ', prom:4:2)
End.
