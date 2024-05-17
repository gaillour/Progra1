program insercionfran;


type
    tv=array[1..10] of byte;
const
    v1:tv=(3,3,4,6,8,8,11,12,13,13);

procedure insiso1(var v1,v2:tv;var n:byte);
var
  i,j:byte;
begin
   i:=1;
   j:=0;
   n:=Length(v1);
   while(i<=n) do
    begin
        if v1[i]=v1[i+1] then
        begin
            i:=i+1;
        end
        else
        begin
            j:=j+1;
            v2[j]:=v1[i];
            i:=i+1;
        end;
    end;
    n:=j;
end;

procedure mostrar(var v:tv;var n:byte);
var
    j:byte;
begin
      for j:=1 to n  do
        write(v[j],' ');
end;

var
    i,j,n:byte;
    v2:tv;
begin
  insiso1(v1,v2,n);
  mostrar(v2,n);
end.