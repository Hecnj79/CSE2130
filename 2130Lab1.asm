    .ORIG x3000
    LEA R2, xFF     ;R2 = x3000 + x1 +xFF = x3100
;Load(Read) X and Y values
    LDR R1, R2, x0  ;R1 = X
    LDR R3, R2, x1  ;R3 = Y
;X + Y
    ADD R4, R1, R3  ;R4<-R1+R3
    STR R4, R2, x2  ;R4 stored in location [R2+x2]
;X AND y
    AND R4, R1, R3
    STR R4, R2, x3
;X OR Y
    NOT R1, R1
    NOT R3, R3
    AND R4, R3, R1
    NOT R4, R4
    STR R4, R2, x4
    NOT R1, R1
    NOT R3, R3
;NOT X
    NOT R4, R1
    STR R4, R2, x5
;NOT Y
    NOT R4, R3
    STR R4, R2, x6
;X+3
    ADD R4, R1, #3
    STR R4, R2, x7
;Y-3
    ADD R4, R3, #-3
    STR R4, R2, x8
;X even or odd
    AND R4, R1, x1
    STR R4, R2, x9
    
    HALT
    .END
    .ORIG x3100
    .FILL #9
    .FILL #12
    .END
    