program intercalacion;

{Como resultado de la intercalación (fusión  o mezcla) de dos arreglos ordenados V1 y V2, de N y 
M elementos respectivamente, se obtiene un tercero ordenado V3.
De longitud N +M, o N +M – Repeticiones}

type
    tv=array[1..10] of byte;

const
    v1:tv=(1,4,7,8,0,0,0,0,0,0);
    v2:tv=(2,5,7,10,11,0,0,0,0,0);

procedure intercalar(v1,v2:tv;n,m:byte;var v3:tv;var k:byte);
var
    i,j,t:byte;
begin
    i:=1;j:=1;k:=0;
    while (i<n) and (j<m) do
    begin
        k:=k+1;
        if v1[i]>v2[j] then
        begin
            v3[k]:=v2[j];j:=j+1;
        end
        else
        begin
            if v1[i]<v2[j] then
            begin
                v3[k]:=v1[i];i:=i+1
            end
            else
            begin
                v3[k]:=v1[i];i:=i+1;j:=j+1;
            end;
        end;
    end;
    for t:=i to n do
    begin
        k:=k+1;
        v3[k]:=v1[t];
    end;
    for t:=j to m do
    begin
        k:=k+1;
        v3[k]:=v2[t];
    end;
end;

var
    v3:tv;
    i,k:byte;

begin
intercalar(v1,v2,4,5,v3,k);
for i:=1 to k do
    writeln(v3[i]);
end.