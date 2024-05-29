program e6;
{Se tienen los datos de los ejemplares de una biblioteca, grabados en un archivo Biblioteca y 
en otro archivo Compras los datos de los títulos adquiridos (ambos del mismo tipo y orden)   
#Código  de Libro       campo de secuencia, clave primaria 
#Cantidad 
#Descripción
Se genera un tercer archivo Temp, con la información actualizada de Biblioteca, que reemplazará 
al original
}
type
    st4=string[4];
    TR=record
        cod:st4;
        cant:byte;
        descr:string;
    end;
    TA=file of TR;
    TAb=file of st4;

procedure leer(var A:TA;var arch:text);
var
    R:TR;
    blanco:char;
begin
    rewrite(A);reset(Arch);
    readln(arch,r.cod,r.cant,blanco,r.descr);
    while not eof(Arch) do
    begin   
        write(A,R);
        readln(arch,r.cod,r.cant,blanco,r.descr);                     
    end;
    close(A);close(Arch);
end;

procedure leerBajas(var bajas:TAb);
var
    cod:st4;
    arch:text;
begin
    assign(arch,'bajas.txt'); reset(arch);
    readln(Arch,cod);
    rewrite(bajas);
    while not eof(arch) do
    begin
        write(bajas,cod);
        readln(Arch,cod);
    end;
    close(arch);
end;


procedure ABM(var A1,A2:TA;nombre:String);
var
    R1,R2:TR;
    A3:TA;
begin
    reset(A1);reset(A2);
    assign(A3,'TEMP.DAT');rewrite(A3);
    read(A1,R1);read(A2,R2);
    while (not eof(A1)) or (not eof(A2)) do
    begin
        if R1.cod<R2.cod then
        begin
            write(A3,R1);
            read(A1,R1);
        end
        else
        begin
            if R1.cod>R2.cod then
            begin
                write(A3,R2);
                read(A2,R2);
            end
            else 
            begin
                R1.cant:=R1.cant+R2.cant;
                write(A3,R1);                
                read(A1,R1);
                read(A2,R2);
            end;
        end
    end;
    write(A3,R1);//se puede R2, en ambos es centinela
    close(A1);close(A2);close(A3);
    erase(A1);
    rename(A3,nombre);
end;

procedure elimina(var A1:TA;var bajas:TAb;Nombre:String); //bajas
var
    R:TR;
    cod:st4;
    temp:TA;

begin
    reset(bajas);reset(A1);
    assign(temp,'TEMP.DAT');
    Rewrite(temp);
    read(A1,R);read(bajas,Cod);
    while (not eof(A1)) or (not eof(temp)) do
    begin
        if R.cod<cod then
        begin
            write(temp,R);
            read(A1,R)
        end
        else
        begin
            if R.cod>cod then
                read(bajas,cod)
            else
            begin
                read(bajas,cod);
                read(A1,R);
            end;
        end;
    end;
    write(temp,R);
    close(A1);close(bajas);close(temp);
    erase(A1);
    Rename(temp,Nombre);
end;

var
    A1,A2:TA;
    arch1,arch2:text;
    bajas:TAb;
begin
    assign(arch1,'biblioteca.txt'); 
    assign(arch2,'compras.txt'); 
    assign(A1,'BIBLIOTECA.DAT');
    assign(A2,'COMPRAS.DAT');
    assign(bajas,'BAJAS.DAT');
    {leer(A1,arch1);
    leer(A2,arch2);
    leerBajas(bajas);}
    ABM(A1,A2,'BIBLIOTECA.DAT');
    elimina(A1,bajas,'BIBLIOTECA.DAT')




end.