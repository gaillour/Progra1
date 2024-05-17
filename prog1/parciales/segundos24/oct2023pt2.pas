program oct2023pt2;

const
    n=5;
    m=3;
type
    tmat=array[1..n,1..m] of integer;
    tv=array[1..n] of integer;

const
    mat:tmat=((2,4,6),(3,6,4),(3,9,2),(7,4,7),(3,0,7));
    vec:tv=(2,5,10,3,5);

procedure multiplos(mat:tmat;vec:tv;i,j,m:byte;var cant:byte);
begin
    if i>0 then
    begin
        if j>0 then
        begin
            if mat[i,j] mod vec[i] = 0 then
                multiplos(mat,vec,i,j-1,m,cant)
            else multiplos(mat,vec,i-1,m,m,cant)
        end
        else 
        begin
            cant:=cant+1;
            multiplos(mat,vec,i-1,m,m,cant);
        end;
    end;
end;

var
    cant:byte;
begin   
    cant:=0;
    multiplos(mat,vec,n,m,m,cant);
    writeln(cant);
end.