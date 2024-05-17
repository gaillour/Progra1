program mutuales;

const
    ioma=350;
    osde=200;
    suma=250;
    part=800;
type
    st5=string[5];
    tst5=array[1..15] of st5;
    treal=array[1..15] of real;
    tmutual=array[1..5] of byte;

function buscapos(matricula:st5;vmatricula:tst5;n:byte):byte;
var
    i:byte;
begin
    i:=0;
    while (i<=n) and (vmatricula[i]<>matricula) do
        i:=i+1;
    if vmatricula[i]=matricula then
        buscapos:=i
    else buscapos:=0;

  
end;

function costo(mut:byte;turno:char;x:real):real;
var
  imp:real;
begin
  imp:=0;
    If Turno='S' then
        costo:=Imp
    else
    begin
        if (Imp+50)>(Imp*1.2) then
        costo:=Imp+50
    else
        costo:=Imp*1.2;
end;

  case mut of
  2:imp:=ioma+imp;
  3:imp:=osde+imp;
  4:imp:=suma+imp;
  5:imp:=part+imp;
  End;
  Costo:=imp;
End;


procedure leer(var vmatricula:tst5;var vcosto:treal;var vmutual:tmutual;var n:byte);
var
    arch:text;
    x,pos,mut:byte;
    matricula:st5;
    blanco,turno:char;

begin
    assign(arch,'mutual.txt');reset(arch);
    n:=0;
    readln(arch,x);
    while not Eof(arch) do
    begin
        read(arch,matricula); 
        pos:=buscapos(matricula,vmatricula,n);
        if pos=0 then
        begin
            n:=n+1;
            vmatricula[n]:=matricula;
            readln(arch,mut,blanco,turno);
            vcosto[n]:=vcosto[n]+costo(mut,turno,x);
        end
        else
        begin
            Readln(arch,mut,blanco,turno);
            vcosto[pos]:=vcosto[pos]+costo(mut,turno,x);
        end;
        vmutual[mut]:=vmutual[mut]+1; //b)
        writeln(matricula);
    end;
end;

procedure inicializar(var vmatricula:tst5;var vcosto:treal;var vmutual:tmutual);
var
    i:byte;
begin
    for i:=1 to 15 do
    begin
        vmatricula[i]:='';
        vcosto[i]:=0;
        vmutual[i]:=0;
    end;
  
end;

procedure mostrar(var vmatricula:tst5;var vcosto:treal;var vmutual:tmutual;var n:byte);
var 
    i:byte;

begin
    for i:=1 to n do
        writeln(vmatricula[i],' ',vcosto[i]);
    for i:=1 to 5 do 
        writeln(vmutual[i]);
end;



var 
    vmatricula:tst5;
    vcosto:treal;
    vmutual:tmutual;
    n:byte;


begin
inicializar(vmatricula,vcosto,vmutual);
leer(vmatricula,vcosto,vmutual,n);
mostrar(vmatricula,vcosto,vmutual,n);
end.