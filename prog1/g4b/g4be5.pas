program g4be5;

procedure solucion(a1,b1,c1,a2,b2,c2:integer;var x,y:real);
var
  d,dx,dy: integer;
begin
  d:=(a1*b2)-(b1*a2);
  dx:=(c1*b2)-(c2*b1);
  dy:=(a1*c2)-(a2*c1);
  if d<>0 then
    begin
    x:=dx/d;
    y:=dy/d;
    end
  else
      writeln('sin solucion');
end;

var
  a1,b1,c1,a2,b2,c2:integer;
  xs,ys:real;
begin
  writeln('(a1x + b1y = c1) y (a2x + b2y = c2)(ingresar en ese orden a1,b1,c1,a2,...)');
  readln(a1,b1,c1,a2,b2,c2);
  solucion(a1,b1,c1,a2,b2,c2,xs,ys);
  writeln('(x: ', xs:4:2, ' , y: ', ys:4:2,')');
end.