        ; Name:   AOC_2021_DAY1_PART2
        ; Author: Ort
        ; Date:   2021/12/01
        ;
        ; Registers
        ; R0  - memory address of input
        ; R1  - unused
        ; R2  - sum of the previous window
        ; R3  - solution
        ; R4  - number at the left side of the previous window
        ; R5  - number at the right side of the current window
        ; R6  - unused
        ; R7  - sum of the current window
        ; R8  - index of R4
        ; R9  - index of R5        
        ; R10 - value at the end of the input

        ORG 0x0

        
        MOV R0, #0x100          ; input address

        MOV R10, #0x0           ; end input         


        MOV R3, #0              ; solution

        MOV R2, #0              ; previous sum 
        MOV R7, #0              ; current sum

        LDR R4, [R0]            ; load first number
        ADD R2, R2, R4          ; add first number to sum
        LDR R4, [R0, #4]        ; load second number
        ADD R2, R2, R4          ; add second number to sum
        LDR R4, [R0, #8]        ; load third number
        ADD R2, R2, R4          ; add third number to sum
 
        MOV R7, R2              ; next sum

        MOV R8, #0              ; index_1
        MOV R9, #12             ; index_2


LOOP    LDR R4, [R0, R8]        
        LDR R5, [R0, R9]        
        CMP R5, R10             ; compare to end input
        BEQ END

        SUB R7, R7, R4          ; remove first number in window
        ADD R7, R7, R5          ; add next number in window
        
        CMP R7, R2              ; compare next sum to previous
        ADDGT R3, R3, #1        ; add 1 to solution if next sum is greater

        MOV R2, R7              ; next sum becomes previous

        ADD R8, R8, #4          ; move r8 index to next element
        ADD R9, R9, #4          ; move r9 index to next element

        B LOOP

END

        SWI 0x123456

        ORG  0x100
        DW  0x000000b2, 0x00002225, 0x0000222e, 0x00002231, 0x00002233, 0x0
