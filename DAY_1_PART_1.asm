        
        ; Name:   AOC_2021_DAY1_PART1
        ; Author: Ort
        ; Date:   2021/12/01
        ;
        ; Registers
        ; R0  - memory address of input
        ; R1  - previous number
        ; R2  - current number
        ; R3  - solution 
        ; R4  - value at the end of the input

        ORG 0x0


        MOV R0, #0x100         ; input address

        MOV R4, #0x0           ; end input         

        MOV R3, #0             ; solution
        LDR R2, [R0], #4       ; load first number
        MOV R1, R2             ; save first number

LOOP    LDR R2, [R0], #4       ; load current number
        CMP R2, R4             ; compare to end input
        BEQ END
        
        CMP R2, R1             ; compare current number to previous
        ADDGT R3, R3, #1       ; add 1 to solution if current number is greater
        MOV R1, R2             ; current number becomes previous
        B LOOP

END

        SWI 0x123456

        ORG  0x100
        DW  0x000000b2, 0x000000cd, 0x000000d4, 0x000000d2, 0x000000d7, 0x0
