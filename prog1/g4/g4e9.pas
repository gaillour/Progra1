program g4e9;

{Dado un archivo que contiene en cada línea 4 números (N1, D1, N2, D2)
numerador y denominador de dos fracciones. Se pide leer los pares de
fracciones y por cada uno de ellos informe:   
a)  La suma como fracción. 
b)  El producto como fracción}

procedure suma(var n1,d1,n2,d2,nf,df:word);

begin
    nf:=(d2*n1) + (n2*d1);
    df:=(d2*d1);
end;

procedure producto(var n1,d1,n2,d2,pn,pd:word);
begin
  pn:=(n1*n2);
  pd:=(d1*d2);
end;
var
    arch:text;
    n1,d1,n2,d2,nf,df,pn,pd:word;
    
begin
assign(arch,'nums.txt');
reset(arch);
nf:=0;df:=0;
while not eof(arch) do
  begin
      readln(arch, n1,d1,n2,d2);
      suma(n1,d1,n2,d2,nf,df);
      producto(n1,d1,n2,d2,pn,pd);
      write('suma: ',nf,'/',df);
      writeln(' producto: ', pn,'/', pd);
  end;
  
end.