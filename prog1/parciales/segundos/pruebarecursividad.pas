program pruebarecursividad;

const  
    n=5;
    m=3;

type
    tmat=array[1..n,1..m] of integer;
    tv=array[1..n] of integer;

const
    mat:tmat=((2,4,6),(3,6,4),(3,9,2),(7,4,7),(3,0,7));
    vec:tv=(2,5,10,3,5);

procedure cantfilas(mat:tmat;vec:tv;i,j:byte;var cant:byte);
begin
    if i<=n then
    begin
        if j<=m then
        begin
            if mat[i,j] mod vec[i] = 0 then 
            begin
                if j=m then
                    cant:=cant+1
                else cantfilas(mat,vec,i,j+1,cant);
            end
            else cantfilas(mat,vec,i+1,1,cant);
        end;
    end;
end;

var
    cant:byte;
begin
cantfilas(mat,vec,1,1,cant);
writeln(cant);
  
end.