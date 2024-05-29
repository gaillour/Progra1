program repaso;

type
    TV=array[1..20] of byte;


procedure leer(var V1,V2:TV;var N,M:byte);
var
    arch:Text;
    num:byte;
begin
    assign(arch,'vectores.txt'); reset(arch);
    N:=1;M:=1;num:=1;
    readln(Arch,num);
    while num<>0 do
    begin
        V1[N]:=num;
        readln(Arch,num);
        N:=N+1;
    end;
    N:=N-1;
    readln(Arch,num);
    while num<>0 do
    begin
        V2[M]:=num;
        M:=M+1;
        readln(arch,num);
    end;
    M:=M-1;
    close(arch);
end;

procedure insertarelvectorV1yV2enelvectorV3(V1,V2:TV;N,M:byte;var V3:TV;var K:byte);
var
    i,j,t:byte;
begin
    i:=1;j:=1;
    while (i<=N) and (j<=M) do
    begin   
        K:=K+1;
        if V1[i]<V2[j] then
        begin
            V3[K]:=V1[i];
            i:=i+1;             
        end
        else
        begin
            if V2[j]<V1[i] then
            begin
                V3[k]:=V2[j];
                j:=j+1
            end
            else
            begin
                V3[K]:=V1[i];
                i:=i+1;
                j:=j+1;
            end;
        end;
    end;
    for t:=i to N do
    begin
        K:=K+1;
        V3[K]:=V1[t];
    end;
    for t:=j to M do
    begin
        K:=K+1;
        V3[K]:=V2[t];
    end;
end;

procedure mostrar(V:TV;N:byte);
var
    i:byte;
begin
    for i:=1 to N do
    begin
        write(V[i],' ');
    end;
    writeln;
end;
var
    V1,V2,V3:TV;
    N,M,K,i:byte;
    
begin
    leer(V1,V2,N,M);
    insertarelvectorV1yV2enelvectorV3(V1,V2,N,M,V3,K);
    mostrar(V1,N);
    mostrar(V2,M);
    mostrar(V3,K);


end.