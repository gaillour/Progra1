program g1e6;
var
      n, ultimas3, centena, error: integer;
      s:string;
begin
  Readln(n);
  str(n,s);
  ultimas3 := val(s,centena,error);
  writeln(centena);
  writeln(ultimas3);
  readln(n);
end.

