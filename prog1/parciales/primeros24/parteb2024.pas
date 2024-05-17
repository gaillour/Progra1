program parteb2024;

const
    max=50;

type
    tvw=array[1..MAX] of word;

procedure leer(var vt,vc,va,vhec:tvw;var n:byte);
var
    DNI:string;
    cpar,i:byte;
    tipo:char;
    hec,tons:word;

begin
    n:=0;
    write('ingrese dni: '); readln(dni);
    while dni<>'999' do
    begin
        write('ingrese parcelas: ');ReadLn(cpar);
        if cpar>0 then
        begin
            n:=n+1;
            vt[n]:=0;vc[n]:=0;va[n]:=0;vhec[n]:=0;
            for i:=1 to cpar do
            begin
                write('ingrese hectareas: ');readln(hec);
                if hec>0 then
                begin
                    write('ingrese tipo: ');readln(tipo);
                    write('ingrese toneladas: ');readln(tons);
                    tipo:=upcase(tipo);
                    vhec[n]:=vhec[n]+hec;
                    case tipo of
                        'T':vt[n]:=vt[n]+tons;
                        'A':va[n]:=va[n]+tons;
                        'C':vc[n]:=vc[n]+tons;
                    end;
                end;
            end;
        end;
        write('ingrese dni: ');readln(dni);
    end;
end;

function cant1tipo(vt,vc,va:tvw;n:byte):byte;
var
    i,aux:byte;
begin
    aux:=0;
    for i:=1 to n do
    begin
        if (vt[i]<>0) then
        begin
            if (vc[i]=0) and (va[i]=0) then
                aux:=aux+1
        end
        else if (va[i]<>0) then
        begin
            if (vc[i]=0) and (vt[i]=0) then
                aux:=aux+1
        end
        else if (vc[i]<>0) then
        begin
            if (va[i]=0) and (vt[i]=0) then
                aux:=aux+1;
        end;
    end;
    cant1tipo:=aux;
end;

function superaronx(vt,vc,va,vhec:tvw;n:byte;x:real):boolean;
var
    aux:boolean;
    i:byte;
    sum:integer;
    rinde:real;
begin
    aux:=true;i:=1;
    while (i<n) and (aux) do
    begin
        if (vt[i]>0) and (vc[i]>0) and (va[i]>0) then
        begin
            sum:=vt[i]+vc[i]+va[i];
            rinde:=vhec[i]/sum;
            if rinde>x then
                aux:=True
            else aux:=false;
        end;
        i:=i+1;          
    end;
    superaronx:=aux;
    
end;

var
    vt,vc,va,vhec:tvw;
    i,n:byte;
    x:real;

begin
    leer(vt,vc,va,vhec,n);
    for i:=1 to n do
    begin
        writeln(vt[i],' ',vc[i],' ',va[i],' ',vhec[i]);
    end;

    writeln(cant1tipo(vt,vc,va,n));
    
    write('ingrese x: ');readln(x);
    writeln(superaronx(vt,vc,va,vhec,n,x));

end.