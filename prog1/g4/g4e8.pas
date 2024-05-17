
Program g4e8;




{En un archivo de texto se registraron las compras de N titulares de tarjetas de crédito de la siguiente 
forma: 
- Código de Cliente y a continuación sus compras: no se sabe cuántas son, por cada una: 
• Tipo de compra: (C=combustible, S=supermercado, O=otros, F=fin de datos)  
• Día  (1..31) 
• Monto 
El banco ofrece un descuento de: 
- 5% los días 10, 20 y 30 para el tipo Otros si el monto supera los $300.  
- 10% para Combustible en la 2º quincena. 
- 15% para Supermercado en la 1º quincena. 
Se pide: 
a)  Código del cliente y total abonado, por cada cliente que no se benefició con ningún descuento. 
b)  Cuántos clientes obtuvieron descuento en los tres rubros. 
c)  Informar cuánto ahorró cada cliente. 
En  la  solución  debe  desarrollar  la  función  Descuento,  que  a  partir  del  tipo  de  compra,  día  y  monto 
devuelva el correspondiente descuento.}

Function descuento(tipo:char;dia:integer;monto:real): real;
Begin
  If ((dia=10) Or (dia=20) Or (dia=30)) And (monto>300) And (tipo='O')Then
    descuento := monto*0.05
  Else If  (tipo='C') And (dia>15) Then
         descuento := monto*0.1
  Else If (tipo='S') And (dia<15) Then
         descuento := monto*0.15;
End;

Var 
  arch: Text;
  codigo,dia: integer;
  monto,montod,montof, des: real;
  tipo,blanco: char;

Begin
  Assign(arch,'compras.txt');
  reset(arch);
  montof := 0;
  montod := 0;
  While Not eof(arch) Do
    Begin
      readln(arch,codigo);
      While Not eoln(arch) Do
        Begin                                
          read(arch,tipo,dia,monto,blanco);  
          des:= descuento(tipo,dia,monto);
          montod:= monto - des;                           
        End;
      if monto=montod then 
        writeln(codigo, ' no obtuvo descuento, monto: ',monto:4:2)
      else writeln(codigo, ' obtuvo descuento y ahorro: ', des:4:2);
    End;
End.
