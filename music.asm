.model small
.stack 100h
.data
a0      =   43388       ;   27.5000 hz
ais0    =   40953       ;   29.1353 hz
h0      =   38655       ;   30.8677 hz
c1      =   36485       ;   32.7032 hz
cis1    =   34437       ;   34.6479 hz
d1      =   32505       ;   36.7081 hz
dis1    =   30680       ;   38.8909 hz
e1      =   28958       ;   41.2035 hz
f1      =   27333       ;   43.6536 hz
fis1    =   25799       ;   46.2493 hz
g1      =   24351       ;   48.9995 hz
gis1    =   22984       ;   51.9130 hz
a1      =   21694       ;   55.0000 hz
ais1    =   20477       ;   58.2705 hz
h1      =   19327       ;   61.7354 hz
c2      =   18243       ;   65.4064 hz
cis2    =   17219       ;   69.2957 hz
d2      =   16252       ;   73.4162 hz
dis2    =   15340       ;   77.7817 hz
e2      =   14479       ;   82.4069 hz
f2      =   13666       ;   87.3071 hz
fis2    =   12899       ;   92.4986 hz
g2      =   12175       ;   97.9989 hz
gis2    =   11492       ;  103.8260 hz
a2      =   10847       ;  110.0000 hz
ais2    =   10238       ;  116.5410 hz
h2      =   9664        ;  123.4710 hz
c3      =   9121        ;  130.8130 hz
cis3    =   8609        ;  138.5910 hz
d3      =   8126        ;  146.8320 hz
dis3    =   7670        ;  155.5630 hz
e3      =   7240        ;  164.8140 hz
f3      =   6833        ;  174.6140 hz
fis3    =   6450        ;  184.9970 hz
g3      =   6088        ;  195.9980 hz
gis3    =   5746        ;  207.6520 hz
a3      =   5424        ;  220.0000 hz
ais3    =   5119        ;  233.0820 hz
h3      =   4832        ;  246.9420 hz
c4      =   4561        ;  261.6260 hz
cis4    =   4305        ;  277.1830 hz
d4      =   4063        ;  293.6650 hz
dis4    =   3835        ;  311.1270 hz
e4      =   3620        ;  329.6280 hz
f4      =   3417        ;  349.2280 hz
fis4    =   3225        ;  369.9940 hz
g4      =   3044        ;  391.9950 hz
gis4    =   2873        ;  415.3050 hz
a4      =   2712        ;  440.0000 hz
ais4    =   2560        ;  466.1640 hz
h4      =   2416        ;  493.8830 hz
c5      =   2280        ;  523.2510 hz
cis5    =   2152        ;  554.3650 hz
d5      =   2032        ;  587.3300 hz
dis5    =   1918        ;  622.2540 hz
e5      =   1810        ;  659.2550 hz
f5      =   1708        ;  698.4560 hz
fis5    =   1612        ;  739.9890 hz
g5      =   1522        ;  783.9910 hz
gis5    =   1437        ;  830.6090 hz
a5      =   1356        ;  880.0000 hz
ais5    =   1280        ;  932.3280 hz
h5      =   1208        ;  987.7670 hz
c6      =   1140        ; 1046.5000 hz
cis6    =   1076        ; 1108.7300 hz
d6      =   1016        ; 1174.6600 hz
dis6    =    959        ; 1244.5100 hz
e6      =    905        ; 1318.5100 hz
f6      =    854        ; 1396.9100 hz
fis6    =    806        ; 1479.9800 hz
g6      =    761        ; 1567.9800 hz
gis6    =    718        ; 1661.2200 hz
a6      =    678        ; 1760.0000 hz
ais6    =    640        ; 1864.6600 hz
h6      =    604        ; 1975.5300 hz
c7      =    570        ; 2093.0000 hz
cis7    =    538        ; 2217.4600 hz
d7      =    508        ; 2349.3200 hz
dis7    =    479        ; 2489.0200 hz
e7      =    452        ; 2637.0200 hz
f7      =    427        ; 2793.8300 hz
fis7    =    403        ; 2959.9600 hz
g7      =    380        ; 3135.9600 hz
gis7    =    359        ; 3322.4400 hz
a7      =    339        ; 3520.0000 hz
ais7    =    320        ; 3729.3100 hz
h7      =    302        ; 3951.0700 hz
c8      =    285        ; 4186.0100 hz
;----------------------------------------------------------------------------

MESSAGEPLAY    DB '                       PROJECT ® PIANO ¯',13,10
               DB 13,10
               DB '       	     THE KEYS OF THE NOTES GO ON THE NEXT ORDER:',13,10
               DB 13,10
               DB '                        2  3     5  6  7' ,13,10
               DB '                      c  d  e  f  g  a  b',13,10,13,10
               DB 13,10
               DB '                        s  d     g  h  j' ,13,10
               DB '                      z  x  c  v  b  n  m',13,10,13,10
               DB '                       TO COMPLETE PRESS ESC','$'

;----------------------------------------------------------------------------

.code

TONE MACRO NUMBER               ;This macro receives the tone
        MOV     BX,NUMBER       ;and send to call the procedures
        CALL    HORN
ENDM
two_tigers proc
	tone f6
	tone c7
	tone ais6
	tone d6
	call delay	
	tone ais4
	tone c5
	tone d5
	tone c5
	tone ais4
	tone c5
	tone f5
	tone c5
	tone ais4
	tone d4
	call delay
	tone ais4
	tone c5
	tone d5
	tone c5
	tone ais4
	tone c5
	tone f5
	tone c5
	tone ais4
	tone d4
	call delay
	tone ais4
	tone c5
	tone d5
	tone c5
	tone ais4
	tone c5
	tone f5
	tone c5
	tone ais4
	tone d4
	call delay
	tone ais3
	tone d5
	tone f5
	tone g5
	tone f5
	tone ais3
	tone c5
	tone c5
	tone ais3
	tone c5
	tone d5
	ret
two_tigers endp

delay proc
	mov     cx, 01h
	mov     dx, 240h
	mov     ah, 86h
	int     15h
	ret
delay endp
;----------------------------------------------------------------------------

CLRSCR PROC
;Clear the screen
        MOV     AH,6
        XOR     AL,AL
        XOR     CX,CX
        MOV     DX,184FH
        MOV     BH,13
        INT     10H
        RET
CLRSCR ENDP

;----------------------------------------------------------------------------

HORNOn  PROC                  ;Activa la HORN
        IN      AL, 61h
        OR      AL, 11B
        OUT     61h, AL
        RET
HORNOn  ENDP

;----------------------------------------------------------------------------

HORNOff  PROC                 	;Desactiva la HORN
        IN      AL, 61h			;Read from a port
        AND     AL, 11111100b
        OUT     61h, AL			;Write to a port
        RET
HORNOff  ENDP

;----------------------------------------------------------------------------

Adjust  PROC                  ;Adjust the HORN with the given frequency
        PUSH    BP
        MOV     BP, SP
        MOV     DX, 18		  ;pitch      
        MOV     AX, 13353   
        MOV     BX, [BP + 4]
        DIV     BX
        MOV     BX, AX  
        MOV     AL, 0B6h
        OUT     43h, AL
;SEND TO PORT THE FREQUENCY IN TWO BYTES SEPARATELY.
        MOV     AX, BX
        OUT     42h, AL ;SEND FIRST BYTE. (PARALLEL PORT = 378H)
        MOV     AL, AH
        OUT     42h, AL ;SEND SECOND BYTE. (SERIAL PORT = 3F8H)
        POP     BP
        RET
Adjust  ENDP

;----------------------------------------------------------------------------

Sound proc                      ;Activate the HORN and place the name of
        CALL HORNON             ;the key.
        MOV     AX,40H
        MOV     ES,AX
        MOV     DX,ES:[006EH]
        MOV     AX,ES:[006CH]
        ADD     AX,7
        ADC     DX,0            ;7 units are added to this value
CLIC:
        CMP     DX,ES:[006EH]   ;And compare until they are equal
        JB      FINI            ;Going through a cycle, when they arrive
        JA      CLIC            ;to be the same one leaves the cycle
        CMP     AX,ES:[006CH]
        JA      CLIC
FINI:
        CALL    HORNOff       ;The HORN is disconnected and returns.
        RET
Sound endp

;----------------------------------------------------------------------------

HORN proc                     ;This procedure saves AX and BX in
        PUSH    BX              ;the pile to not lose its value, with
        MOV     AX, BX          ;this calls to fit and Sound
        PUSH    AX
        CALL    Adjust         ;Put the frequency in the port.
        POP     AX
        POP     BX
        CALL    Sound           ;Activate the speaker and deactivate it.
        ret
HORN endp

;----------------------------------------------------------------------------
;CONVERT to_lower IF IT WAS CAPITALIZED

to_lower PROC
        CMP AL, 65    ;'A'
        JB  CONTINUE ;IF THE KEY IS LESS THAN THE 'A' DOES NOTHING
        CMP AL, 90    ;'Z'
        JA  CONTINUE ;IF THE KEY IS GREATER THAN THE 'Z' DOES NOTHING
        ADD AL, 32    ;Convert capital letter to miniscule.
     CONTINUE:
        RET
to_lower ENDP

;----------------------------------------------------------------------------
; CAPTURE THE KEY WITH THE NOTE THAT THE USER WISHES....

KEY PROC
        MOV     AH,8            ;If there is one, get the note, no echo input
        INT     21H
        CALL    to_lower
        RET
KEY ENDP
;----------------------------------------------------------------------------
; Cycles the program until the user presses the KEY ESC.
; The procedure reacts to the KEYs indicated in the data segment.
; Any other KEY is ignored.
; The pressed KEY is converted to lowercase, since the ASCII table
; Try different from each other.
; After each KEY is pressed, the cycle returns to the beginning and
; is repeated.
; If the KEY pressed corresponds to a musical note, the code
; corresponding is sent to the speaker.

SPEAKER PROC
BEGIN:
        CALL    KEY
        CMP     AL,'q'   ;DO high
        JNE     S1       ;IF IT IS NOT THE KEY EXPECTED, JUMP TO VERIFY THE FOLLOWING.
        TONE    523      ;IF IT IS THE EXPECTED KEY, IT GENERATES THE CORRESPONDING SOUND
        JMP     BEGIN	 ;AFTER THE SOUND RESET TO WAIT ANOTHER SOUND.
S1:     CMP     AL,'w'   ;RE high
        JNE     S2
        TONE    587
        JMP     BEGIN
S2:     CMP     AL,'e'   ;MI high
        JNE     S3
        TONE    659
        JMP     BEGIN
S3:     CMP     AL,'r'   ;FA high
        JNE     S4
        TONE    698
        JMP     BEGIN
S4:     CMP     AL,'t'   ;SOL high
        JNE     S5
        TONE    784
        JMP     BEGIN
S5:     CMP     AL,'y'   ;LA high
        JNE     S6
        TONE    880
        JMP     BEGIN
S6:     CMP     AL,'u'   ;SI high
        JNE     S8
        TONE    988
        JMP     NOSALTO1
SALTO1:
   JMP BEGIN
NOSALTO1:
        JMP     BEGIN
S8:     CMP     AL,'2'   ;DO# high
        JNE     S9
        TONE    554
        JMP     BEGIN
S9:     CMP     AL,'3'   ;RE# high
        JNE     S10
        TONE    622
        JMP     BEGIN
S10:    CMP     AL,'5'   ;FA# high
        JNE     S11
        TONE    740
        JMP     BEGIN
S11:    CMP     AL,'6'   ;SOL# high
        JNE     S12
        TONE    830
        JMP     BEGIN
S12:    CMP     AL,'7'   ;SIb high
        JNE     S13
        TONE    923
        JMP     BEGIN
S13:    CMP     AL,'z'   ;DO low
        JNE     S14
        TONE    261
        JMP     BEGIN
S14:    CMP     AL,'x'   ;RE low
        JNE     S15
        TONE    293
        JMP     BEGIN
S15:    CMP     AL,'c'   ;MI low
        JNE     S16
        TONE    329
        JMP     NOSALTO2
SALTO2:
   JMP SALTO1
NOSALTO2:
        JMP     BEGIN
S16:    CMP     AL,'v'   ;FA low
        JNE     S17
        TONE    349
        JMP     BEGIN
S17:    CMP     AL,'b'   ;SOL low
        JNE     S18
        TONE    392
        JMP     BEGIN
S18:    CMP     AL,'n'   ;LA low
        JNE     S19
        TONE    466
        JMP     BEGIN
S19:    CMP     AL,'m'   ;SI low
        JNE     S20
        TONE    498
        JMP     BEGIN
S20:    CMP     AL,'s'   ;DO# low
        JNE     S21
        TONE    277
        JMP     BEGIN
S21:    CMP     AL,'d'   ;RE# low
        JNE     S22
        TONE    311
        JMP     BEGIN
S22:    CMP     AL,'g'   ;FA# low
        JNE     S23
        TONE    370
        JMP     BEGIN
S23:    CMP     AL,'h'   ;SOL# low
        JNE     S24
        TONE    415
        JMP     BEGIN
S24:    CMP     AL,'j'   ;SIb low
        JNE     S25
        TONE    515
        JMP     BEGIN
S25:    CMP     AL,27 ;27 = KEY ESC (terminate).
        JNE     SALTO2
        RET
SPEAKER ENDP

;----------------------------------------------------------------------------

MESSAGE PROC
        MOV     AH,9
        LEA     DX,MESSAGEPLAY
        INT     21H
        RET
MESSAGE ENDP

;----------------------------------------------------------------------------

START:
        MOV     AX, @data         ;they are sent to call all the
        MOV     DS, AX            ;procedures
        CALL    CLRSCR            ;Clean screen.
        CALL    MESSAGE           ;Display the explanation of the program.
		
;call two_tigers
        CALL    SPEAKER           ;Sounds.
        MOV     AX, 4C00H
        INT     21H

;----------------------------------------------------------------------------

END START