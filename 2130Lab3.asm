            .ORIG x3000
RESTART     LEA R0, PROMPT
            
            PUTS
            GETC 
            
            ADD R3, R0, #0   ;copy ASCII code to R3
            ADD R3, R3, #-16 ;subtract 48 to get numerical value
            ADD R3, R3, #-16
            ADD R3, R3, #-16
            
            ;if value >7 exit
            ADD R4, R3, #0
            ADD R4, R4, #-7
            BRzp END
            
            LEA R0, DAYS
            ADD R3, R3, #0
            
LOOP        BRz DISPLAY
            ADD R0, R0, #10 ;go to next day
            ADD R3, R3, #-1
            BR LOOP
            
DISPLAY     PUTS
            BR RESTART
            
END         HALT
            
PROMPT      .STRINGZ "Please enter number: "
DAYS        .STRINGZ "Sunday   "
            .STRINGZ "Monday   "
            .STRINGZ "Tuesday  "
            .STRINGZ "Wednesday"
            .STRINGZ "Thursday "
            .STRINGZ "Friday   "
            .STRINGZ "Saturday "
            .END