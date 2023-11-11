    .ORIG x3000
    LDI R0, X
    LDI R1, Y
    
;Perform X - Y
    NOT R3, R1
    ADD R3, R3, #1
    ADD R2, R0, R3
    STI R2, X_Y
    AND R3, R3, #0  ;reset r3
    
;Perform absolute value of x
    ADD R5, R0, #0
    BRzp AVX
    NOT R5, R5
    ADD R5, R5, #1
    
AVX 
    STI R5, absX
    
;Perform absolute value of Y
    ADD R6, R1, #0
    BRzp AVY
    NOT R6, R6
    ADD R6, R6, #1
    
AVY
    STI R6, absY
    
;Perform |X|-|Y|
    NOT R7, R6
    ADD R7, R7, #1
    ADD R3, R5, R7
    BRz ZR
    BRp PO
    BRn NE
    
ZR  
    AND R3, R3, #0
    STI R3, absX_Y
    BR END
    
PO  
    AND R3, R3, #0
    ADD R3, R3, #1
    STI R3, absX_Y
    BR END
    
NE  
    AND R3, R3, #0
    ADD R3, R3, #2
    STI R3, absX_Y

END

    HALT
X    .FILL x3120
Y    .FIll x3121
X_Y  .FILL x3122
absX .FILL x3123
absY .FILL x3124
absX_Y .FILL x3125
    .END
    .ORIG x3120
    .FILL #-12
    .FILL #-12
    .END