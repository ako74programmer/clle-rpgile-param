**free
Dcl-Pi MYRPGPGM;
    Param1 Char(10);
    Param2 Packed(7:2);
    Param3 Date;
End-Pi;

Dsply ('Param1: ' + Param1);
Dsply ('Param2: ' + %Char(Param2));
Dsply ('Param3: ' + %Char(Param3));

*InLR = *On;
Return;
