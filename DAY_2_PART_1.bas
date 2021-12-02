
'  Name:   AOC_2021_DAY2_PART1
'  Author: Ort
'  Date:   2021/12/02

CLS
OPEN "input.txt" FOR INPUT AS #1

DIM strIn AS STRING
DIM subCommand AS STRING
DIM value AS INTEGER
DIM HPos AS INTEGER
DIM depth AS INTEGER

WHILE NOT EOF(1)
    INPUT #1, strIn
    subCommand$ = LEFT$(strIn, LEN(strIn) - 2)
    value = VAL(RIGHT$(strIn$, 1))
    IF subCommand$ = "forward" THEN
        HPos = HPos + value
    ELSEIF subCommand$ = "down" THEN
        depth = depth + value
    ELSE
        depth = depth - value
    END IF
WEND

PRINT depth * HPos

CLOSE #1
