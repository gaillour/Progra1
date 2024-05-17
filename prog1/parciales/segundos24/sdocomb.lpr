program SdoParcialcombustible;
const
  nmax=100;
type
  ST10=string[10];
  ST4=string[4];
  RegV=record
    tipo:ST10;
    precio:real;
  end;
  RegC=record
    cod:ST4;
    tipo:ST10;
  end;
  TV=array[1..nmax] of RegV;
  TV4=array[1..nmax] of ST4;
  TM=array[1..nmax,1..nmax] of real;
  TVR=array[1..nmax] of real;
  TVC=array[1..nmax] of RegC;
procedure cargatipo(Var V:TV; Var N:byte);
Var
  arch:text;
  i:byte;
begin
  assign(arch,'ventas.txt'); reset(arch);
  readln(arch,N);
  while not eof(arch) do
    For i:=1 to N do
      readln(arch,V[i].tipo,V[i].precio);
  close(arch);
end;
function acumventas(M:TM;i,j,N:byte;V:TV):real;
Begin
  If i=0 then
    acumventas:=0
  else
    if j>1 then
      acumventas:=M[i,j]*V[j].precio+acumventas(M,i,j-1,N,V)
    else
      acumventas:=M[i,j]*V[j].precio+acumventas(M,i-1,N,N,V);
end;
function acumventastipo(M:TM;i,j:byte;V:TV):real;
Begin
  If i=0 then
    acumventastipo:=0
  else
    acumventastipo:=M[i,j]*V[j].precio+acumventastipo(M,i-1,j,V)
end;
procedure porcentajes(M:TM;N,K:byte;V:TV);
Var
  j:byte;
  porc,acumv:real;
Begin
  acumv:=acumventas(M,K,N,N,V);
  for j:=1 to N do
    begin
      porc:=acumventastipo(M,K,j,V)*100/acumv;
      writeln(V[j].tipo,' tiene porc es ',porc:8:2,' &')
    end;
end;
procedure cargaM(Var M:TM; Var K:byte; N:byte;Var V4:TV4);
Var
  i:byte;
  arch:text;
Begin
  K:=0;
  assign(arch,'combustible.txt'); reset(arch);
  while not eof(arch)do
    Begin
      K:=K+1;
      read(arch,V4[K]);
      For i:=1 to N do
        read(arch,M[K,i]);
      readln(arch);
    end;
  close(arch);
end;
function buscarC(C:ST4;V4:TV4;K:byte):byte;
Var
  i:byte;
Begin
 i:=1;
 while (i<=K)and(V4[i]<>C) do
   i:=i+1;
 If i>K then
   buscarC:=0
 else
   buscarC:=i;
end;
function maximo(M:TM;i,j:byte):byte;
Var
  pos:byte;
Begin
  if j=1 then
    pos:=1
  else
    Begin
      pos:=maximo(M,i,j-1);
      If M[i,j]>M[i,pos] then
        pos:=j;
    end;
  maximo:=pos;
end;
procedure generarC(Var VC:TVC; Var T:byte; M:TM;K,N:byte;V:TV;X:real;V4:TV4);
Var
  i,j:byte;
Begin
  T:=0;
  For i:=1 to K do
    For j:=1 to N do
      If M[i,j]>X then
        Begin
          T:=T+1;
          VC[T].tipo:=V[j].tipo;
          VC[T].cod:=V4[i];
        end;
end;
procedure mostrarC(VC:TVC;T:byte);
Var
  i:byte;
Begin
  For i:=1 to T do
    writeln(VC[i].cod,' ',VC[i].tipo);
end;
Var
  V:TV;
  M:TM;
  N,K,pos,T:byte;
  V4:TV4;
  C:ST4;
  X:real;
  VC:TVC;
begin
  cargatipo(V,N);
  cargaM(M,K,N,V4);
  //inciso a
  writeln('ingrese un codigo de surtidor '); readln(C);
  pos:=buscarC(C,V4,K);
  If pos<>0 then
    writeln('el maximo tipo de combustible para el codigo C es ',V[maximo(M,pos,N)].tipo)
  else
    writeln('no existe ');
  //inciso b
  porcentajes(M,N,K,V);
  //inciso c
  writeln('ingrese una cantidad a superar '); readln(X);
  generarC(VC,T,M,K,N,V,X,V4);
  mostrarC(VC,T);
  readln;
end.
