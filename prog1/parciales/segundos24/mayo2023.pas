program mayo2023;

const 
    n=5;
    m=3;
type
    tbyte= array [1..n,1..m] of byte;
    treal=array[1..n,1..m] of real;
    TrN=record
        nivel,total:byte;
        tprom:real;
    end;
    tv=array[1..n]of TrN;

const
    matautos:tbyte=((4,5,15),(1,0,3),(10,3,9),(6,8,7),(2,1,3));
    mathoras:treal=((9.5,15,20),(6,0,24),(15.3,10.5,9),(12,11,14),(4,1,6.5));

procedure generarArreglo(matautos:tbyte;mathoras:treal;var vec:tv;n,m:byte;var k:byte);
var
    i,j,tot:byte;
    sum:real;
begin
    k:=0;
    for i:=1 to n do
    begin
        j:=1;sum:=0;tot:=0;
        while (j<=m) and (matautos[i,j]>0) do
        begin
            tot:=tot+matautos[i,j];
            sum:=sum+mathoras[i,j];
            j:=j+1;
        end;
        if j>m then 
        begin
            k:=k+1;
            with vec[k] do
            begin
                nivel:=i;
                total:=tot;
                tprom:=sum/m;
            end;
        end;
    end;
end;

procedure uno(matautos:tbyte;i,j,m,x:byte;var cant:byte);
begin   
    if i>0 then
    begin
        if j>0 then
        begin
            if matautos[i,j]>x then
            begin
                cant:=cant+1;
                uno(matautos,i-1,m,m,x,cant);
            end
            else uno(matautos,i,j-1,m,x,cant)
        end
        else uno(matautos,i-1,m,m,x,cant);
    end;    
end;


var     
    vec:tv;
    cant,i,k,x:byte;

begin
    generarArreglo(matautos,mathoras,vec,n,m,k);
    for i:=1 to k do
    begin
        writeln(vec[i].nivel,' ',vec[i].total,' ',vec[i].tprom:4:2);
    end;

    write('ingrese X: ');readln(X);
    cant:=0;
    uno(matautos,n,m,m,x,cant);
    writeln('cant de niveles: ');writeln(cant);


end.