program tfuncion;

Type 
    Tfunc = function( m: integer): real  ; 
    TVec = array[1..3] of Tfunc; 
   
function F1( m: integer) : real; 
begin 
    F1 := m*(m - 0.5); 
End;  

function F2( m: integer) : real; 
begin 
    F2 := m / (m - 0.5) 
End; 

function F3( m: integer) : real; 
begin 
    F3 := (m - 1) / m  
End;

Const 
        Vec : Tvec = (@F1, @F2, @F3); 

Var 
        i, m: integer; 
begin 
     readln (m); 
     For i := 1 to 3 do 
         Writeln('F', i, '(', m,') =', Vec[ i ]( m ):0:2); 
End.

