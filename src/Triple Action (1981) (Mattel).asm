
        ORG     $5000
.HEADER:
        BIDECLE $521E           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $5051           ; 5004  Ptr: Start of game
        BIDECLE $5356           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5036           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5042           ; 500A  Ptr: Date/Title
        DECLE   $0000           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $000D,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0004,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $000A           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 501C  Timer dispatch/interval
        DECLE   $0016,  $0052,  $0001,  $0000; 5020  Timer dispatch/interval
        DECLE   $008D,  $0055,  $0004,  $0000; 5024  Timer dispatch/interval
        DECLE   $002E,  $005D,  $0001,  $0000; 5028  Timer dispatch/interval
        DECLE   $0006,  $005F,  $0003,  $0000; 502C  Timer dispatch/interval
        DECLE   $002C,  $0058,  $0001,  $0000; 5030  Timer dispatch/interval
        BIDECLE $0000           ; 5034  End of timer table

.GRAM_INIT_5036:
        DECLE   $000E           ; 5036  # of GRAM cards to init
        DECLE   $03FF,  $03FC   ; 5037  #00   :  4x4 tile
        DECLE   $0001,  $0280   ; 5039  #01-06:  CART #00-05 ----
        DECLE   $020A           ; 503B  #07   :  CART #05    X---
        DECLE   $0208           ; 503C  #08   :  CART #04    X---
        DECLE   $0108           ; 503D  #09   :  CART #04    -Y--
        DECLE   $010A           ; 503E  #0A   :  CART #05    -Y--
        DECLE   $030A           ; 503F  #0B   :  CART #05    XY--
        DECLE   $0308           ; 5040  #0C   :  CART #04    XY--
        DECLE   $000C           ; 5041  #0D   :  CART #06    ----

.TITLE:
        DECLE   $0051                           ; 5042  Cartridge year
        STRING  "TRIPLE ACTION"                 ; 5043  Title string
        DECLE   $0000                           ; 5050  

.START:
        PSHR    R5                              ; 5051   0275

        JSR     R5,     L_5CB0                  ; 5052   0004 015C 00B0

        MVII    #$000D, R0                      ; 5055   02B8 000D
        MVO     R0,     .STIC.CS.0              ; 5057   0240 0028
        CLRR    R0                              ; 5059   01C0
        MVO     R0,     .STIC.EDGE              ; 505A   0240 0032
        MVO     R0,     .STIC.HDLY              ; 505C   0240 0030
        MVII    #$015E, R4                      ; 505E   02BC 015E
        MVII    #$0078, R0                      ; 5060   02B8 0078

        JSR     R5,     X_FILL_ZERO             ; 5062   0004 0114 0338
        JSR     R5,     L_518B                  ; 5065   0004 0150 018B
        JSR     R5,     L_517A                  ; 5068   0004 0150 017A

        MVII    #$0002, R0                      ; 506B   02B8 0002
        MVO     R0,     G_0115                  ; 506D   0240 0115
        INCR    R0                              ; 506F   0008
        MVO     R0,     G_0103                  ; 5070   0240 0103
        MVII    #$0040, R0                      ; 5072   02B8 0040
        MVII    #$031D, R4                      ; 5074   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; 5076   0004 0114 0338

        MVII    #$0217, R4                      ; 5079   02BC 0217
        MVII    #$0007, R3                      ; 507B   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 507D   0004 0118 007B
        STRING  "Triple Action"                 ; 5080  
        DECLE   $0000                           ; 508D   0000

        MVII    #$023F, R4                      ; 508E   02BC 023F
        SDBD                                    ; 5090   0001
        MVII    #$5149, R1                      ; 5091   02B9 0049 0051

L_5094:
        JSR     R5,     X_PRINT_R1              ; 5094   0004 0118 0067

        ADDI    #$000F, R1                      ; 5097   02F9 000F
        ADDI    #$0006, R4                      ; 5099   02FC 0006
        SDBD                                    ; 509B   0001
        CMPI    #$5176, R1                      ; 509C   0379 0076 0051
        BMI     L_5094                          ; 509F   022B 000C

        ADDI    #$003C, R4                      ; 50A1   02FC 003C

        JSR     R5,     X_PRINT_R5              ; 50A3   0004 0118 007B
        STRING  "Game?:"                        ; 50A6  
        DECLE   $0000                           ; 50AC   0000
L_50AD:
        CLRR    R2                              ; 50AD   01D2
        MVII    #$0007, R3                      ; 50AE   02BB 0007
        MVII    #$02C3, R1                      ; 50B0   02B9 02C3
        ADD     G_0160, R1                      ; 50B2   02C1 0160
        MVII    #$0001, R0                      ; 50B4   02B8 0001
        SDBD                                    ; 50B6   0001
        MVII    #$5125, R4                      ; 50B7   02BC 0025 0051

        JSR     R5,     .EXEC.910               ; 50BA   0004 0118 0110

        TSTR    R0                              ; 50BD   0080
        BEQ     L_5106                          ; 50BE   0204 0046

        MVI     G_015E, R2                      ; 50C0   0282 015E
        TSTR    R2                              ; 50C2   0092
        BNEQ    L_50E1                          ; 50C3   020C 001C

        CMPI    #$0003, R0                      ; 50C5   0378 0003
        BGT     L_5101                          ; 50C7   020E 0038

L_50C9:
        MVO     R0,     G_015E                  ; 50C9   0240 015E
        MVII    #$02CB, R4                      ; 50CB   02BC 02CB
        MVII    #$0007, R3                      ; 50CD   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 50CF   0004 0118 007B
        STRING  "Option?:"                      ; 50D2  
        DECLE   $0000                           ; 50DA   0000

        MVII    #$0014, R2                      ; 50DB   02BA 0014
        MVO     R2,     G_0160                  ; 50DD   0242 0160
        B       L_50AD                          ; 50DF   0220 0033

L_50E1:
        SDBD                                    ; 50E1   0001
        MVII    #$5121, R3                      ; 50E2   02BB 0021 0051
        ADD     G_015E, R3                      ; 50E5   02C3 015E
        MVI@    R3,     R2                      ; 50E7   029A
        CMPR    R0,     R2                      ; 50E8   0142
        BMI     L_5101                          ; 50E9   020B 0016

L_50EB:
        DECR    R0                              ; 50EB   0010
        MVO     R0,     G_015F                  ; 50EC   0240 015F

        JSR     R5,     L_518B                  ; 50EE   0004 0150 018B

        CLRR    R3                              ; 50F1   01DB
        MVO     R3,     G_0161                  ; 50F2   0243 0161
        MVO     R3,     G_0162                  ; 50F4   0243 0162
        MVI     G_015E, R3                      ; 50F6   0283 015E
        DECR    R3                              ; 50F8   0013
        SLL     R3,     1                       ; 50F9   004B
        SDBD                                    ; 50FA   0001
        ADDI    #$511C, R3                      ; 50FB   02FB 001C 0051
        MOVR    R3,     R4                      ; 50FE   009C
        SDBD                                    ; 50FF   0001
        MVI@    R4,     R7                      ; 5100   02A7

L_5101:
        JSR     R5,     X_PLAY_RAZZ2            ; 5101   0004 011C 02BD

        B       L_50AD                          ; 5104   0220 0058

L_5106:
        TSTR    R2                              ; 5106   0092
        BNEQ    L_5101                          ; 5107   022C 0007

        INCR    R0                              ; 5109   0008
        MVII    #$02C3, R4                      ; 510A   02BC 02C3
        MVII    #$0007, R3                      ; 510C   02BB 0007
        ADD     G_0160, R4                      ; 510E   02C4 0160
        MOVR    R0,     R1                      ; 5110   0081

        JSR     R5,     X_PRNUM_RGT             ; 5111   0004 0118 00C5

        MOVR    R1,     R0                      ; 5114   0088
        MVI     G_015E, R2                      ; 5115   0282 015E
        TSTR    R2                              ; 5117   0092
        BEQ     L_50C9                          ; 5118   0224 0050
        B       L_50EB                          ; 511A   0220 0030

        DECLE   $007F,  $0054,  $0098,  $0057   ; 511C   007F 0054 0098 0057
        DECLE   $00AA,  $005B,  $0004,  $0002   ; 5120   00AA 005B 0004 0002
        DECLE   $0002,  $0000,  $0000,  $0076   ; 5124   0002 0000 0000 0076
        DECLE   $0051,  $0000,  $0000,  $0000   ; 5128   0051 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0070   ; 512C   0000 0000 0000 0070
        DECLE   $005E,  $007E,  $005C,  $007E   ; 5130   005E 007E 005C 007E
        DECLE   $005C,  $0000,  $0000,  $0000   ; 5134   005C 0000 0000 0000
        DECLE   $0000,  $00F2,  $0055,  $0060   ; 5138   0000 00F2 0055 0060
        DECLE   $0056,  $0060,  $0056,  $0051   ; 513C   0056 0060 0056 0051
        DECLE   $0050,  $0051,  $0050,  $0051   ; 5140   0050 0051 0050 0051
        DECLE   $0050,  $0051,  $0050,  $0051   ; 5144   0050 0051 0050 0051
        DECLE   $0050,  $0042,  $0061,  $0074   ; 5148   0050 0042 0061 0074
        DECLE   $0074,  $006C,  $0065,  $0020   ; 514C   0074 006C 0065 0020
        DECLE   $0054,  $0061,  $006E,  $006B   ; 5150   0054 0061 006E 006B
        DECLE   $0073,  $0020,  $0031,  $0000   ; 5154   0073 0020 0031 0000
        DECLE   $0052,  $0061,  $0063,  $0069   ; 5158   0052 0061 0063 0069
        DECLE   $006E,  $0067,  $0020,  $0043   ; 515C   006E 0067 0020 0043
        DECLE   $0061,  $0072,  $0073,  $0020   ; 5160   0061 0072 0073 0020
        DECLE   $0020,  $0032,  $0000,  $0042   ; 5164   0020 0032 0000 0042
        DECLE   $0069,  $0070,  $006C,  $0061   ; 5168   0069 0070 006C 0061
        DECLE   $006E,  $0065,  $0073,  $0020   ; 516C   006E 0065 0073 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5170   0020 0020 0020 0020
        DECLE   $0033,  $0000                   ; 5174   0033 0000

        CLRR    R1                              ; 5176   01C9
        J       .EXEC.94C                       ; 5177   0004 0318 014C

L_517A:
        PSHR    R5                              ; 517A   0275
        SDBD                                    ; 517B   0001
        MVII    #$5024, R1                      ; 517C   02B9 0024 0050

L_517F:
        JSR     R5,     X_TIMER_STOP            ; 517F   0004 0118 0038

        ADDI    #$0004, R1                      ; 5182   02F9 0004
        SDBD                                    ; 5184   0001
        CMPI    #$5036, R1                      ; 5185   0379 0036 0050
        BMI     L_517F                          ; 5188   022B 000A
        PULR    R7                              ; 518A   02B7

L_518B:
        PSHR    R5                              ; 518B   0275
        MVII    #$00F0, R0                      ; 518C   02B8 00F0
        MVII    #$0200, R4                      ; 518E   02BC 0200
        SDBD                                    ; 5190   0001
        MVII    #$37FF, R1                      ; 5191   02B9 00FF 0037

        JSR     R5,     X_FILL_MEM              ; 5194   0004 0114 0341

        PULR    R7                              ; 5197   02B7

L_5198:
        PSHR    R5                              ; 5198   0275
        MVII    #$0007, R3                      ; 5199   02BB 0007
        MVII    #$0002, R1                      ; 519B   02B9 0002
        MVI     G_0161, R0                      ; 519D   0280 0161
        MVII    #$0215, R4                      ; 519F   02BC 0215

        JSR     R5,     X_PRNUM_RGT             ; 51A1   0004 0118 00C5

        MVII    #$0225, R4                      ; 51A4   02BC 0225
        MVI     G_0162, R0                      ; 51A6   0280 0162

        JSR     R5,     X_PRNUM_LFT             ; 51A8   0004 0118 009E

        PULR    R7                              ; 51AB   02B7

L_51AC:
        JSR     R5,     .EXEC.7B3               ; 51AC   0004 0114 03B3
        JSR     R5,     L_517A                  ; 51AF   0004 0150 017A
        JSR     R5,     .EXEC.A83               ; 51B2   0004 0118 0283

        SDBD                                    ; 51B5   0001
        MVII    #$1906, R0                      ; 51B6   02B8 0006 0019
        MVO     R0,     G_035D                  ; 51B9   0240 035D
        MVII    #$0007, R3                      ; 51BB   02BB 0007
        MOVR    R3,     R0                      ; 51BD   0098

        JSR     R5,     .EXEC.6D5               ; 51BE   0004 0114 02D5

        MVII    #$027E, R4                      ; 51C1   02BC 027E

        JSR     R5,     X_PRINT_R5              ; 51C3   0004 0118 007B
        STRING  "Game Over"                     ; 51C6  
        DECLE   $0000                           ; 51CF   0000

        MVI     G_015E, R0                      ; 51D0   0280 015E
        CMPI    #$0002, R0                      ; 51D2   0378 0002
        BNEQ    L_51ED                          ; 51D4   020C 0017

        MVII    #$0280, R4                      ; 51D6   02BC 0280
        SDBD                                    ; 51D8   0001
        MVII    #$2007, R3                      ; 51D9   02BB 0007 0020

        JSR     R5,     X_PRINT_R5              ; 51DC   0004 0118 007B
        STRING  "me O"                          ; 51DF   006D 0065 0020 004F
        DECLE   $0000                           ; 51E3   0000

        SDBD                                    ; 51E4   0001
        MVII    #$2007, R3                      ; 51E5   02BB 0007 0020

        JSR     R5,     X_PRINT_R5              ; 51E8   0004 0118 007B
        STRING  "v"                             ; 51EB   0076
        DECLE   $0000                           ; 51EC   0000
L_51ED:
        MVII    #$0028, R0                      ; 51ED   02B8 0028

        JSR     R5,     .EXEC.A62               ; 51EF   0004 0118 0262
        JSR     R5,     .EXEC.A83               ; 51F2   0004 0118 0283

        SDBD                                    ; 51F5   0001
        MVII    #$513F, R0                      ; 51F6   02B8 003F 0051
        MVO     R0,     G_035D                  ; 51F9   0240 035D
        PULR    R7                              ; 51FB   02B7

L_51FC:
        PSHR    R5                              ; 51FC   0275
L_51FD:
        ADDI    #$0004, R1                      ; 51FD   02F9 0004
        MVI@    R1,     R0                      ; 51FF   0288
        MOVR    R1,     R3                      ; 5200   008B

        JSR     R5,     X_UNPK_BYTES            ; 5201   0004 0114 0357

        ANDI    #$0002, R2                      ; 5204   03BA 0002
        BEQ     L_520A                          ; 5206   0204 0002

        NEGR    R1                              ; 5208   0021
        INCR    R7                              ; 5209   000F

L_520A:
        NEGR    R0                              ; 520A   0020

L_520B:
        JSR     R5,     X_PACK_BYTES            ; 520B   0004 0114 034F

        MVO@    R0,     R3                      ; 520E   0258
        SUBI    #$0004, R3                      ; 520F   033B 0004
        MOVR    R3,     R1                      ; 5211   0099

        JSR     R5,     L_5FE7                  ; 5212   0004 015C 03E7

        PULR    R7                              ; 5215   02B7

L_5216:
        PSHR    R5                              ; 5216   0275

        JSR     R5,     .EXEC.4F1               ; 5217   0004 0114 00F1
        JSR     R5,     .EXEC.4F1               ; 521A   0004 0114 00F1

        PULR    R7                              ; 521D   02B7

        DECLE   $00C0,  $00C0,  $0000,  $0000   ; 521E   00C0 00C0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5222   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FC   ; 5226   0000 0000 0000 00FC
        DECLE   $00FC,  $00FC,  $0068,  $005F   ; 522A   00FC 00FC 0068 005F
        DECLE   $005F,  $0068,  $00FC,  $00FC   ; 522E   005F 0068 00FC 00FC
        DECLE   $00FC,  $0000,  $0000,  $0000   ; 5232   00FC 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5236   0000 0000

        INCR    R4                              ; 5238   000C
        RSWD    R4                              ; 5239   003C
        ADDR    R7,     R4                      ; 523A   00FC
        ADDR    R7,     R3                      ; 523B   00FB
        ADDR    R3,     R7                      ; 523C   00DF

        DECLE   $005C,  $0058,  $006E,  $003E   ; 523D   005C 0058 006E 003E
        DECLE   $007E,  $0078,  $0060,  $0000   ; 5241   007E 0078 0060 0000
        DECLE   $0000,  $0000,  $0000,  $0019   ; 5245   0000 0000 0000 0019
        DECLE   $003B,  $0036                   ; 5249   003B 0036

        SARC    R0,     2                       ; 524B   007C
        ADDR    R3,     R5                      ; 524C   00DD
        ADDR    R3,     R7                      ; 524D   00DF
        ADDR    R3,     R7                      ; 524E   00DF
        ADDR    R4,     R7                      ; 524F   00E7

        DECLE   $00FE,  $003E,  $003C,  $0038   ; 5250   00FE 003E 003C 0038
        DECLE   $0038,  $0000,  $0000,  $0004   ; 5254   0038 0000 0000 0004
        DECLE   $0004,  $006C,  $0068,  $007B   ; 5258   0004 006C 0068 007B
        DECLE   $007F,  $005F,  $00DB,  $00E6   ; 525C   007F 005F 00DB 00E6
        DECLE   $00FE,  $00DE,  $00C6,  $0006   ; 5260   00FE 00DE 00C6 0006
        DECLE   $0006,  $0000,  $0000,  $0010   ; 5264   0006 0000 0000 0010
        DECLE   $0010,  $00D6,  $00D6,  $00FE   ; 5268   0010 00D6 00D6 00FE
        DECLE   $00FE,  $00D6,  $00D6,  $00EE   ; 526C   00FE 00D6 00D6 00EE
        DECLE   $00EE,  $00FE,  $00C6,  $00C6   ; 5270   00EE 00FE 00C6 00C6
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5274   0000 0000 0000 0000
        DECLE   $003C,  $003C,  $003C,  $003C   ; 5278   003C 003C 003C 003C
        DECLE   $0000,  $0000,  $0000,  $0024   ; 527C   0000 0000 0000 0024
        DECLE   $0042,  $0018,  $0042,  $0024   ; 5280   0042 0018 0042 0024
        DECLE   $0000,  $0000,  $0024,  $0042   ; 5284   0000 0000 0024 0042
        DECLE   $0081,  $0018,  $0081,  $0042   ; 5288   0081 0018 0081 0042
        DECLE   $0024,  $0000,  $0042,  $0081   ; 528C   0024 0000 0042 0081
        DECLE   $0000,  $0024,  $0000,  $0081   ; 5290   0000 0024 0000 0081
        DECLE   $0042,  $0000,  $0081,  $0000   ; 5294   0042 0000 0081 0000
        DECLE   $0000,  $0042,  $0000,  $0000   ; 5298   0000 0042 0000 0000
        DECLE   $0081,  $0000,  $0000,  $0000   ; 529C   0081 0000 0000 0000
        DECLE   $0000,  $0000,  $001C,  $001C   ; 52A0   0000 0000 001C 001C
        DECLE   $0080,  $00FF,  $00FF,  $0000   ; 52A4   0080 00FF 00FF 0000
        DECLE   $0004,  $0000,  $0000,  $0000   ; 52A8   0004 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 52AC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0010   ; 52B0   0000 0000 0008 0010
        DECLE   $0026,  $000E,  $001C,  $00BA   ; 52B4   0026 000E 001C 00BA
        DECLE   $00F0,  $0060,  $0000,  $0000   ; 52B8   00F0 0060 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 52BC   0000 0000 0000 0000
        DECLE   $0008,  $0008,  $0016,  $0016   ; 52C0   0008 0008 0016 0016
        DECLE   $002C,  $002C,  $001A,  $001A   ; 52C4   002C 002C 001A 001A
        DECLE   $0070,  $0070,  $0020,  $0020   ; 52C8   0070 0070 0020 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 52CC   0000 0000 0000 0000
        DECLE   $0024,  $002C,  $002C,  $004C   ; 52D0   0024 002C 002C 004C
        DECLE   $005A,  $0058,  $0018,  $0010   ; 52D4   005A 0058 0018 0010
        DECLE   $0030,  $0030,  $00E0,  $0060   ; 52D8   0030 0030 00E0 0060
        DECLE   $0000,  $0000,  $0000,  $0008   ; 52DC   0000 0000 0000 0008
        DECLE   $0008,  $002A,  $002A,  $0028   ; 52E0   0008 002A 002A 0028
        DECLE   $0028,  $0028,  $0028,  $0008   ; 52E4   0028 0028 0028 0008
        DECLE   $0008,  $0008,  $0008,  $0018   ; 52E8   0008 0008 0008 0018
        DECLE   $0018,  $0000,  $0000,  $0000   ; 52EC   0018 0000 0000 0000
        DECLE   $0010,  $0018,  $0058,  $005A   ; 52F0   0010 0018 0058 005A
        DECLE   $004C,  $002C,  $002C,  $0024   ; 52F4   004C 002C 002C 0024
        DECLE   $0006,  $0006,  $000F,  $000F   ; 52F8   0006 0006 000F 000F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 52FC   0000 0000 0000 0000
        DECLE   $0050,  $0050,  $0060,  $0060   ; 5300   0050 0050 0060 0060
        DECLE   $00B0,  $00B0,  $0058,  $0058   ; 5304   00B0 00B0 0058 0058
        DECLE   $002C,  $002C,  $0008,  $0008   ; 5308   002C 002C 0008 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 530C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0034   ; 5310   0000 0000 0000 0034
        DECLE   $0038,  $009C,  $004E,  $0027   ; 5314   0038 009C 004E 0027
        DECLE   $0003,  $0006,  $0000,  $0000   ; 5318   0003 0006 0000 0000
        DECLE   $0000,  $0000,  $003C,  $00FF   ; 531C   0000 0000 003C 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00C3   ; 5320   00FF 00FF 00FF 00C3
        DECLE   $0081,  $00FF,  $00BD,  $00BD   ; 5324   0081 00FF 00BD 00BD
        DECLE   $00BD,  $00FF,  $00C3,  $00FF   ; 5328   00BD 00FF 00C3 00FF
        DECLE   $00FF,  $0081,  $0000,  $0000   ; 532C   00FF 0081 0000 0000
        DECLE   $0000                           ; 5330   0000

        COMR    R4                              ; 5331   001C
        RSWD    R6                              ; 5332   003E
        SWAP    R2,     1                       ; 5333   0042
        NEGR    R1                              ; 5334   0021
        SARC    R3,     2                       ; 5335   007F
        RSWD    R5                              ; 5336   003D
        SLLC    R0,     2                       ; 5337   005C
        RSWD    R2                              ; 5338   003A
        ADDR    R3,     R7                      ; 5339   00DF

        DECLE   $0042,  $0038,  $000C,  $0000   ; 533A   0042 0038 000C 0000
        DECLE   $00FF,  $0042,  $0042,  $007E   ; 533E   00FF 0042 0042 007E
        DECLE   $007E,  $0024,  $007E,  $0042   ; 5342   007E 0024 007E 0042
        DECLE   $0042,  $0042,  $0042,  $007E   ; 5346   0042 0042 0042 007E
        DECLE   $0042,  $0042,  $0042,  $0042   ; 534A   0042 0042 0042 0042
        DECLE   $003C,  $007E,  $007E,  $003C   ; 534E   003C 007E 007E 003C
        DECLE   $0018,  $0000,  $0018,  $0018   ; 5352   0018 0000 0018 0018
.GFX_LIST_5356:
        DECLE   $0080,  $0080,  $0080,  $0080   ; 5356  CART PIC #00
        DECLE   $0000,  $0000,  $0000,  $0000   ; 535A  
        DECLE   $0080,  $0080,  $0000,  $0000   ; 535E  CART PIC #01
        DECLE   $0000,  $0000,  $0080,  $0080   ; 5362  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5366  CART PIC #02
        DECLE   $0080,  $0080,  $0080,  $0080   ; 536A  
        DECLE   $0000,  $0000,  $0080,  $0080   ; 536E  CART PIC #03
        DECLE   $0080,  $0080,  $0000,  $0000   ; 5372  
        DECLE   $0000,  $0000,  $0003,  $0007   ; 5376  CART PIC #04
        DECLE   $003F,  $007F,  $00FF,  $00FF   ; 537A  
        DECLE   $000E,  $003F,  $007F,  $00FF   ; 537E  CART PIC #05
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5382  
        DECLE   $0000,  $0028,  $005C,  $0036   ; 5386  CART PIC #06
        DECLE   $005A,  $0074,  $0018,  $0000   ; 538A  
L_538E:
        PSHR    R5                              ; 538E   0275
        PSHR    R0                              ; 538F   0270
        MOVR    R1,     R0                      ; 5390   0088

        JSR     R5,     .EXEC.76C               ; 5391   0004 0114 036C

        ADDI    #$0004, R1                      ; 5394   02F9 0004
        MOVR    R1,     R2                      ; 5396   008A
        PULR    R1                              ; 5397   02B1
        TSTR    R1                              ; 5398   0089
        BMI     L_53A6                          ; 5399   020B 000B

        ANDI    #$000C, R1                      ; 539B   03B9 000C
        BEQ     L_53A5                          ; 539D   0204 0006

        XORI    #$000C, R1                      ; 539F   03F9 000C
        BEQ     L_53A5                          ; 53A1   0204 0002

        MVII    #$0008, R1                      ; 53A3   02B9 0008
L_53A5:
        PULR    R7                              ; 53A5   02B7

L_53A6:
        PULR    R1                              ; 53A6   02B1
        CLRR    R1                              ; 53A7   01C9
        MVO@    R1,     R2                      ; 53A8   0251
        PULR    R7                              ; 53A9   02B7

L_53AA:
        PSHR    R5                              ; 53AA   0275
L_53AB:
        PSHR    R2                              ; 53AB   0272
        PSHR    R3                              ; 53AC   0273
        ADDI    #$0004, R1                      ; 53AD   02F9 0004
        MVI@    R1,     R0                      ; 53AF   0288
        MOVR    R1,     R3                      ; 53B0   008B

        JSR     R5,     X_UNPK_BYTES            ; 53B1   0004 0114 0357

        MVI     G_0164, R2                      ; 53B4   0282 0164
        CMPI    #$000F, R2                      ; 53B6   037A 000F
        BEQ     L_53F0                          ; 53B8   0204 0036

        CMPI    #$0003, R2                      ; 53BA   037A 0003
        BEQ     L_53D6                          ; 53BC   0204 0018

        CMPI    #$000C, R2                      ; 53BE   037A 000C
        BEQ     L_53D6                          ; 53C0   0204 0014

        CMPI    #$0006, R2                      ; 53C2   037A 0006
        BEQ     L_53DB                          ; 53C4   0204 0015

        CMPI    #$0009, R2                      ; 53C6   037A 0009
        BEQ     L_53DB                          ; 53C8   0204 0011

        CMPI    #$0008, R2                      ; 53CA   037A 0008
L_53CC:
        BEQ     L_53D6                          ; 53CC   0204 0008

        CMPI    #$0004, R2                      ; 53CE   037A 0004
L_53D0:
        BLE     L_53D6                          ; 53D0   0206 0004

        NEGR    R0                              ; 53D2   0020
        NEGR    R1                              ; 53D3   0021
        B       L_53E9                          ; 53D4   0200 0013

L_53D6:
        NEGR    R1                              ; 53D6   0021
        BEQ     L_53DB                          ; 53D7   0204 0002
        B       L_53E9                          ; 53D9   0200 000E

L_53DB:
        MVII    #$0008, R2                      ; 53DB   02BA 0008
        NEGR    R0                              ; 53DD   0020
        BMI     L_53E5                          ; 53DE   020B 0005

        CMPR    R2,     R0                      ; 53E0   0150
        BMI     L_53D6                          ; 53E1   022B 000C
        B       L_53E9                          ; 53E3   0200 0004

L_53E5:
        NEGR    R2                              ; 53E5   0022
        CMPR    R2,     R0                      ; 53E6   0150
        BPL     L_53D6                          ; 53E7   0223 0012

L_53E9:
        JSR     R5,     X_PACK_BYTES            ; 53E9   0004 0114 034F

        MVO@    R0,     R3                      ; 53EC   0258
        PULR    R3                              ; 53ED   02B3
        PULR    R2                              ; 53EE   02B2
        PULR    R7                              ; 53EF   02B7

L_53F0:
        SLL     R0,     2                       ; 53F0   004C
        SLL     R1,     2                       ; 53F1   004D
        MOVR    R3,     R4                      ; 53F2   009C
        SUBI    #$0002, R4                      ; 53F3   033C 0002
        MVI@    R4,     R2                      ; 53F5   02A2
        MVI@    R4,     R3                      ; 53F6   02A3
        SUBR    R0,     R2                      ; 53F7   0102
        SUBR    R1,     R3                      ; 53F8   010B
        SUBI    #$0002, R4                      ; 53F9   033C 0002
        MVO@    R2,     R4                      ; 53FB   0262
        MVO@    R3,     R4                      ; 53FC   0263
        SWAP    R2,     1                       ; 53FD   0042
        ANDI    #$00FF, R2                      ; 53FE   03BA 00FF
        SWAP    R3,     1                       ; 5400   0043
        ANDI    #$00FF, R3                      ; 5401   03BB 00FF
        CMPI    #$0009, R2                      ; 5403   037A 0009
        BLE     L_5415                          ; 5405   0206 000E

        CMPI    #$00A4, R2                      ; 5407   037A 00A4
        BGE     L_5415                          ; 5409   020D 000A

        PULR    R0                              ; 540B   02B0
        PULR    R0                              ; 540C   02B0
        MOVR    R4,     R1                      ; 540D   00A1
        SUBI    #$0004, R1                      ; 540E   0339 0004

        JSR     R5,     L_541C                  ; 5410   0004 0154 001C

        B       L_53AB                          ; 5413   0220 0069

L_5415:
        MOVR    R4,     R3                      ; 5415   00A3
        MVI@    R3,     R0                      ; 5416   0298

        JSR     R5,     X_UNPK_BYTES            ; 5417   0004 0114 0357

        B       L_53D6                          ; 541A   0220 0045

L_541C:
        PSHR    R5                              ; 541C   0275
        PSHR    R1                              ; 541D   0271
        CLRR    R4                              ; 541E   01E4
        MVO     R4,     G_0164                  ; 541F   0244 0164

        JSR     R5,     L_5433                  ; 5421   0004 0154 0033

        INCR    R2                              ; 5424   000A

        JSR     R5,     L_5433                  ; 5425   0004 0154 0033

        INCR    R3                              ; 5428   000B

        JSR     R5,     L_5433                  ; 5429   0004 0154 0033

        DECR    R2                              ; 542C   0012

        JSR     R5,     L_5433                  ; 542D   0004 0154 0033

        DECR    R3                              ; 5430   0013
        PULR    R1                              ; 5431   02B1
        PULR    R7                              ; 5432   02B7

L_5433:
        PSHR    R5                              ; 5433   0275
        PSHR    R2                              ; 5434   0272
        PSHR    R3                              ; 5435   0273

        JSR     R5,     L_5457                  ; 5436   0004 0154 0057

        SLL     R3,     2                       ; 5439   004F
        ADDR    R3,     R7                      ; 543A   00DF

        MVII    #$0007, R3                      ; 543B   02BB 0007
        B       L_544A                          ; 543D   0200 000B

        MVII    #$0038, R3                      ; 543F   02BB 0038
        B       L_544A                          ; 5441   0200 0007

        MVII    #$01C0, R3                      ; 5443   02BB 01C0
        B       L_544A                          ; 5445   0200 0003

        MVII    #$0036, R3                      ; 5447   02BB 0036
        SWAP    R3,     1                       ; 5449   0043
L_544A:
        ANDR    R3,     R0                      ; 544A   0198
        CMPR    R3,     R0                      ; 544B   0158
        BEQ     L_5453                          ; 544C   0204 0005

        MOVR    R4,     R0                      ; 544E   00A0

        JSR     R5,     X_CLR_BIT               ; 544F   0004 0114 02E6

        CMPR    R4,     R4                      ; 5452   0164
L_5453:
        INCR    R4                              ; 5453   000C
        PULR    R3                              ; 5454   02B3
        PULR    R2                              ; 5455   02B2
        PULR    R7                              ; 5456   02B7

L_5457:
        SLR     R2,     2                       ; 5457   0066
        PSHR    R2                              ; 5458   0272
        SLR     R2,     1                       ; 5459   0062
        SLR     R3,     2                       ; 545A   0067
        MOVR    R3,     R1                      ; 545B   0099
        SLR     R1,     1                       ; 545C   0061
        DECR    R1                              ; 545D   0011
        PSHR    R2                              ; 545E   0272
        SLL     R1,     2                       ; 545F   004D
        MOVR    R1,     R2                      ; 5460   008A
        SLL     R1,     2                       ; 5461   004D
        ADDR    R1,     R2                      ; 5462   00CA
        PULR    R1                              ; 5463   02B1
        ADDR    R1,     R2                      ; 5464   00CA
        ADDI    #$01FF, R2                      ; 5465   02FA 01FF
        MVI@    R2,     R0                      ; 5467   0290
        ANDI    #$0001, R3                      ; 5468   03BB 0001
        SLL     R3,     1                       ; 546A   004B
        PULR    R1                              ; 546B   02B1
        ANDI    #$0001, R1                      ; 546C   03B9 0001
        ADDR    R1,     R3                      ; 546E   00CB
        MOVR    R5,     R7                      ; 546F   00AF

L_5470:
        MVII    #$0214, R4                      ; 5470   02BC 0214
        SDBD                                    ; 5472   0001
        MVII    #$37FF, R1                      ; 5473   02B9 00FF 0037
        MVO@    R1,     R4                      ; 5476   0261
        MVO@    R1,     R4                      ; 5477   0261
        MVO@    R1,     R4                      ; 5478   0261
        ADDI    #$000D, R4                      ; 5479   02FC 000D
        MVO@    R1,     R4                      ; 547B   0261
        MVO@    R1,     R4                      ; 547C   0261
        MVO@    R1,     R4                      ; 547D   0261
        MOVR    R5,     R7                      ; 547E   00AF

        JSR     R5,     L_5CB0                  ; 547F   0004 015C 00B0

        MVII    #$0003, R0                      ; 5482   02B8 0003
        MVO     R0,     .STIC.CS.0              ; 5484   0240 0028
        MVII    #$0004, R0                      ; 5486   02B8 0004
        MVO     R0,     G_0103                  ; 5488   0240 0103
        MVII    #$00A0, R0                      ; 548A   02B8 00A0
        MVO     R0,     G_0163                  ; 548C   0240 0163
        SDBD                                    ; 548E   0001
        MVII    #$54E3, R4                      ; 548F   02BC 00E3 0054

        JSR     R5,     L_54FF                  ; 5492   0004 0154 00FF

        MVII    #$0014, R3                      ; 5495   02BB 0014

L_5497:
        JSR     R5,     L_551D                  ; 5497   0004 0154 011D

        DECR    R3                              ; 549A   0013
        BNEQ    L_5497                          ; 549B   022C 0005

        MVO     R3,     G_0172                  ; 549D   0243 0172
        MVI     G_015F, R1                      ; 549F   0281 015F
        MOVR    R1,     R2                      ; 54A1   008A
        SUBI    #$0002, R2                      ; 54A2   033A 0002
        BMI     L_54A8                          ; 54A4   020B 0002

        MVO     R1,     G_0172                  ; 54A6   0241 0172
L_54A8:
        ANDI    #$0001, R1                      ; 54A8   03B9 0001
        SDBD                                    ; 54AA   0001
        ADDI    #$551B, R1                      ; 54AB   02F9 001B 0055
        MVI@    R1,     R1                      ; 54AE   0289
        MVO     R1,     G_0160                  ; 54AF   0241 0160
        MVII    #$0068, R0                      ; 54B1   02B8 0068
        MVO     R0,     G_0118                  ; 54B3   0240 0118
        MVII    #$00A4, R0                      ; 54B5   02B8 00A4
        MVO     R0,     G_0116                  ; 54B7   0240 0116

L_54B9:
        JSR     R5,     .EXEC.7B3               ; 54B9   0004 0114 03B3
        JSR     R5,     L_5470                  ; 54BC   0004 0154 0070

        MVII    #$031D, R2                      ; 54BF   02BA 031D
        SDBD                                    ; 54C1   0001
        MVII    #$5759, R1                      ; 54C2   02B9 0059 0057
        MVII    #$0002, R0                      ; 54C5   02B8 0002

        JSR     R5,     X_INIT_MOBS             ; 54C7   0004 0114 02B4

        SDBD                                    ; 54CA   0001
        MVII    #$5135, R0                      ; 54CB   02B8 0035 0051
        MVO     R0,     G_035D                  ; 54CE   0240 035D
        SDBD                                    ; 54D0   0001
        MVII    #$5024, R1                      ; 54D1   02B9 0024 0050

        JSR     R5,     X_TIMER_START           ; 54D4   0004 0118 0044

        MVII    #$000D, R0                      ; 54D7   02B8 000D
        MVII    #$0165, R4                      ; 54D9   02BC 0165

        JSR     R5,     X_FILL_ZERO             ; 54DB   0004 0114 0338

        MVII    #$0008, R0                      ; 54DE   02B8 0008
        MVO     R0,     G_0166                  ; 54E0   0240 0166
        PULR    R7                              ; 54E2   02B7

        DECLE   $02CC,  $02B8,  $02A4,  $0290   ; 54E3   02CC 02B8 02A4 0290
        DECLE   $027C,  $0000,  $0223,  $0237   ; 54E7   027C 0000 0223 0237
        DECLE   $024B,  $025F,  $0273,  $0000   ; 54EB   024B 025F 0273 0000
        DECLE   $022A,  $022B,  $022C,  $022D   ; 54EF   022A 022B 022C 022D
        DECLE   $022E,  $026B,  $026C,  $0000   ; 54F3   022E 026B 026C 0000

        ADD     .BTAB.C2,R1                     ; 54F7   02C1 02C2
        ADD     .BTAB.C4,R3                     ; 54F9   02C3 02C4
        ADD     .BTAB.83,R5                     ; 54FB   02C5 0283
        MVI     .STIC.X.0,R4                    ; 54FD   0284 0000
L_54FF:
        PSHR    R5                              ; 54FF   0275
        SDBD                                    ; 5500   0001
        MVII    #$5511, R5                      ; 5501   02BD 0011 0055
L_5504:
        SDBD                                    ; 5504   0001
        MVI@    R5,     R1                      ; 5505   02A9
        TSTR    R1                              ; 5506   0089
        BEQ     L_5510                          ; 5507   0204 0007

L_5509:
        MVI@    R4,     R2                      ; 5509   02A2
        TSTR    R2                              ; 550A   0092
        BEQ     L_5504                          ; 550B   0224 0008

        MVO@    R1,     R2                      ; 550D   0251
        B       L_5509                          ; 550E   0220 0006
L_5510:
        PULR    R7                              ; 5510   02B7

        DECLE   $0038,  $0036,  $00C7,  $0011   ; 5511   0038 0036 00C7 0011
        DECLE   $00C0,  $0037,  $003F,  $0010   ; 5515   00C0 0037 003F 0010
        DECLE   $0000,  $0000                   ; 5519   0000 0000

        SWAP    R2,     2                       ; 551B   0046
        DECR    R4                              ; 551C   0014
L_551D:
        PSHR    R5                              ; 551D   0275
L_551E:
        MVII    #$00F0, R0                      ; 551E   02B8 00F0

        JSR     R5,     X_RAND2                 ; 5520   0004 0114 029E

        ADDI    #$0200, R0                      ; 5523   02F8 0200
        MOVR    R0,     R1                      ; 5525   0081
        MVI@    R1,     R0                      ; 5526   0288
        SDBD                                    ; 5527   0001
        CMPI    #$37FF, R0                      ; 5528   0378 00FF 0037
        BNEQ    L_551E                          ; 552B   022C 000E

        MOVR    R1,     R4                      ; 552D   008C
        SUBI    #$0015, R4                      ; 552E   033C 0015

        JSR     R5,     L_5543                  ; 5530   0004 0154 0143

        ADDI    #$0011, R4                      ; 5533   02FC 0011

        JSR     R5,     L_5543                  ; 5535   0004 0154 0143

        ADDI    #$0011, R4                      ; 5538   02FC 0011

        JSR     R5,     L_5543                  ; 553A   0004 0154 0143

        SDBD                                    ; 553D   0001
        MVII    #$086C, R0                      ; 553E   02B8 006C 0008
        MVO@    R0,     R1                      ; 5541   0248
        PULR    R7                              ; 5542   02B7

L_5543:
        MVII    #$0003, R2                      ; 5543   02BA 0003
L_5545:
        MVI@    R4,     R0                      ; 5545   02A0
        SDBD                                    ; 5546   0001
        CMPI    #$37FF, R0                      ; 5547   0378 00FF 0037
        BNEQ    L_5550                          ; 554A   020C 0004

L_554C:
        DECR    R2                              ; 554C   0012
        BNEQ    L_5545                          ; 554D   022C 0009
        MOVR    R5,     R7                      ; 554F   00AF

L_5550:
        SDBD                                    ; 5550   0001
        CMPI    #$086C, R0                      ; 5551   0378 006C 0008
        BNEQ    L_551E                          ; 5554   022C 0037
        B       L_554C                          ; 5556   0220 000B

        PSHR    R5                              ; 5558   0275

        JSR     R5,     .EXEC.777               ; 5559   0004 0114 0377

        PSHR    R0                              ; 555C   0270
        PSHR    R1                              ; 555D   0271
        PSHR    R2                              ; 555E   0272
        PSHR    R3                              ; 555F   0273

        JSR     R5,     L_5457                  ; 5560   0004 0154 0057

        MOVR    R0,     R4                      ; 5563   0084
        PULR    R3                              ; 5564   02B3
        PULR    R2                              ; 5565   02B2
        PULR    R1                              ; 5566   02B1
        PULR    R0                              ; 5567   02B0
        ANDI    #$0007, R4                      ; 5568   03BC 0007
        CMPI    #$0004, R4                      ; 556A   037C 0004
        BEQ     L_5606                          ; 556C   0204 0098

        JSR     R5,     L_5583                  ; 556E   0004 0154 0183
        JSR     R5,     L_541C                  ; 5571   0004 0154 001C
        JSR     R5,     L_53AA                  ; 5574   0004 0150 03AA
        JSR     R5,     L_5FE7                  ; 5577   0004 015C 03E7

        PULR    R7                              ; 557A   02B7

        PSHR    R5                              ; 557B   0275

        JSR     R5,     L_5583                  ; 557C   0004 0154 0183
        JSR     R5,     L_51FC                  ; 557F   0004 0150 01FC

        PULR    R7                              ; 5582   02B7

L_5583:
        MVI     G_0172, R4                      ; 5583   0284 0172
        TSTR    R4                              ; 5585   00A4
        BNEQ    L_5658                          ; 5586   020C 00D0

        MOVR    R0,     R4                      ; 5588   0084
        ADDI    #$0167, R4                      ; 5589   02FC 0167
        MVO@    R0,     R4                      ; 558B   0260
        MOVR    R5,     R7                      ; 558C   00AF

L_558D:
        PSHR    R5                              ; 558D   0275
        CLRR    R3                              ; 558E   01DB
        MVII    #$011F, R4                      ; 558F   02BC 011F
L_5591:
        MVI@    R4,     R1                      ; 5591   02A1
        MOVR    R3,     R2                      ; 5592   009A
        ADDI    #$016F, R2                      ; 5593   02FA 016F
        MVI@    R2,     R2                      ; 5595   0292
        TSTR    R2                              ; 5596   0092
        BNEQ    L_55BE                          ; 5597   020C 0025

        MOVR    R1,     R2                      ; 5599   008A
        ANDI    #$00C0, R1                      ; 559A   03B9 00C0
        BNEQ    L_55BE                          ; 559C   020C 0020

        MVII    #$0165, R1                      ; 559E   02B9 0165
        ADDR    R3,     R1                      ; 55A0   00D9
        MVI@    R1,     R0                      ; 55A1   0288
        ANDI    #$000F, R2                      ; 55A2   03BA 000F
        CMPR    R0,     R2                      ; 55A4   0142
        BEQ     L_55BE                          ; 55A5   0204 0017

        SUBR    R0,     R2                      ; 55A7   0102
        BMI     L_55B1                          ; 55A8   020B 0007

        CMPI    #$0008, R2                      ; 55AA   037A 0008
        BPL     L_55B6                          ; 55AC   0203 0008

L_55AE:
        INCR    R0                              ; 55AE   0008
        B       L_55B7                          ; 55AF   0200 0006

L_55B1:
        NEGR    R2                              ; 55B1   0022
        CMPI    #$0008, R2                      ; 55B2   037A 0008
        BPL     L_55AE                          ; 55B4   0223 0007

L_55B6:
        DECR    R0                              ; 55B6   0010
L_55B7:
        SDBD                                    ; 55B7   0001
        MVII    #$55E2, R2                      ; 55B8   02BA 00E2 0055

        JSR     R5,     L_55C4                  ; 55BB   0004 0154 01C4

L_55BE:
        INCR    R3                              ; 55BE   000B
        CMPI    #$0002, R3                      ; 55BF   037B 0002
        BNEQ    L_5591                          ; 55C1   022C 0031
        PULR    R7                              ; 55C3   02B7

L_55C4:
        PSHR    R5                              ; 55C4   0275
        ANDI    #$000F, R0                      ; 55C5   03B8 000F
        MVO@    R0,     R1                      ; 55C7   0248
        ADDR    R0,     R2                      ; 55C8   00C2
        PSHR    R3                              ; 55C9   0273
        MOVR    R3,     R0                      ; 55CA   0098

        JSR     R5,     .EXEC.76C               ; 55CB   0004 0114 036C

        MVI@    R1,     R0                      ; 55CE   0288
        MVI@    R2,     R3                      ; 55CF   0293
        SDBD                                    ; 55D0   0001
        ANDI    #$F83F, R0                      ; 55D1   03B8 003F 00F8
        SLR     R3,     2                       ; 55D4   0067
        SLR     R3,     1                       ; 55D5   0063
        SLL     R3,     2                       ; 55D6   004F
        SLL     R3,     2                       ; 55D7   004F
        XORR    R3,     R0                      ; 55D8   01D8
        MVO@    R0,     R1                      ; 55D9   0248
        MVI@    R2,     R3                      ; 55DA   0293
        ANDI    #$0007, R3                      ; 55DB   03BB 0007
        ADDI    #$0005, R1                      ; 55DD   02F9 0005
        MVO@    R3,     R1                      ; 55DF   024B
        PULR    R3                              ; 55E0   02B3
        PULR    R7                              ; 55E1   02B7

        NEGR    R0                              ; 55E2   0020
        NEGR    R1                              ; 55E3   0021
        NEGR    R2                              ; 55E4   0022
        NEGR    R3                              ; 55E5   0023
        NEGR    R4                              ; 55E6   0024
        SUBR    R4,     R3                      ; 55E7   0123
        SUBR    R4,     R2                      ; 55E8   0122
        SUBR    R4,     R1                      ; 55E9   0121
        SUBR    R4,     R0                      ; 55EA   0120
        SUB@    R4,     R1                      ; 55EB   0321
        SUB@    R4,     R2                      ; 55EC   0322
        SUB@    R4,     R3                      ; 55ED   0323
        BEQ     L_53CC                          ; 55EE   0224 0223
        BOV     L_53D0                          ; 55F0   0222 0221

        PSHR    R5                              ; 55F2   0275
        TSTR    R0                              ; 55F3   0080
        BLE     L_5606                          ; 55F4   0206 0010

        MOVR    R1,     R4                      ; 55F6   008C
        ADDI    #$016F, R4                      ; 55F7   02FC 016F
        MVI@    R4,     R2                      ; 55F9   02A2
        TSTR    R2                              ; 55FA   0092
        BNEQ    L_5606                          ; 55FB   020C 0009

        JSR     R5,     L_5607                  ; 55FD   0004 0154 0207

        INCR    R1                              ; 5600   0009
        SDBD                                    ; 5601   0001
        MVII    #$5784, R0                      ; 5602   02B8 0084 0057
        MVO@    R0,     R1                      ; 5605   0248
L_5606:
        PULR    R7                              ; 5606   02B7

L_5607:
        PSHR    R5                              ; 5607   0275
        MOVR    R1,     R3                      ; 5608   008B
        MOVR    R1,     R0                      ; 5609   0088

        JSR     R5,     .EXEC.76C               ; 560A   0004 0114 036C

        MOVR    R1,     R4                      ; 560D   008C
        ADDI    #$0006, R1                      ; 560E   02F9 0006
        MVI@    R1,     R0                      ; 5610   0288
        TSTR    R0                              ; 5611   0080
        BNEQ    L_5655                          ; 5612   020C 0041

        ADDI    #$000A, R1                      ; 5614   02F9 000A

        JSR     R5,     .EXEC.760               ; 5616   0004 0114 0360

        BEQ     L_5629                          ; 5619   0204 000E

        ADDI    #$0010, R1                      ; 561B   02F9 0010

        JSR     R5,     .EXEC.760               ; 561D   0004 0114 0360

        BEQ     L_5629                          ; 5620   0204 0007

        ADDI    #$0010, R1                      ; 5622   02F9 0010

        JSR     R5,     .EXEC.760               ; 5624   0004 0114 0360

        BNEQ    L_5655                          ; 5627   020C 002C

L_5629:
        PSHR    R1                              ; 5629   0271
        SDBD                                    ; 562A   0001
        MVII    #$5827, R0                      ; 562B   02B8 0027 0058
        MVO@    R0,     R1                      ; 562E   0248
        ADDI    #$0002, R4                      ; 562F   02FC 0002
        ADDI    #$0002, R1                      ; 5631   02F9 0002
        MVI@    R4,     R0                      ; 5633   02A0
        MVII    #$0004, R2                      ; 5634   02BA 0004
        SWAP    R2,     1                       ; 5636   0042
        ADDR    R2,     R0                      ; 5637   00D0
        MVO@    R0,     R1                      ; 5638   0248
        INCR    R1                              ; 5639   0009
        MVI@    R4,     R0                      ; 563A   02A0
        ADDR    R2,     R0                      ; 563B   00D0
        MVO@    R0,     R1                      ; 563C   0248
        MOVR    R1,     R2                      ; 563D   008A
        ADDI    #$0165, R3                      ; 563E   02FB 0165
        MVI@    R3,     R1                      ; 5640   0299
        MVII    #$0020, R0                      ; 5641   02B8 0020

        JSR     R5,     .EXEC.629               ; 5643   0004 0114 0229

        INCR    R2                              ; 5646   000A
        MVO@    R0,     R2                      ; 5647   0250
        ADDI    #$0002, R2                      ; 5648   02FA 0002
        MVI     G_0160, R0                      ; 564A   0280 0160
        MVO@    R0,     R2                      ; 564C   0250
        MVII    #$0004, R0                      ; 564D   02B8 0004
        ADDI    #$0002, R4                      ; 564F   02FC 0002
        MVO@    R0,     R4                      ; 5651   0260

        JSR     R5,     L_5FB3                  ; 5652   0004 015C 03B3

L_5655:
        PULR    R1                              ; 5655   02B1
        PULR    R7                              ; 5656   02B7

L_5657:
        PSHR    R5                              ; 5657   0275
L_5658:
        ADDI    #$0167, R0                      ; 5658   02F8 0167
        MOVR    R0,     R2                      ; 565A   0082

        JSR     R5,     .EXEC.7AE               ; 565B   0004 0114 03AE

        MVO@    R0,     R2                      ; 565E   0250
        PULR    R7                              ; 565F   02B7

        PSHR    R5                              ; 5660   0275
        MVI     G_0171, R3                      ; 5661   0283 0171
        TSTR    R3                              ; 5663   009B
        BNEQ    L_56E5                          ; 5664   020C 007F

        MOVR    R0,     R3                      ; 5666   0083
        MOVR    R1,     R0                      ; 5667   0088
        ADDI    #$016F, R1                      ; 5668   02F9 016F
        MVI@    R1,     R2                      ; 566A   028A
        TSTR    R2                              ; 566B   0092
        BNEQ    L_5606                          ; 566C   022C 0067

        JSR     R5,     .EXEC.76C               ; 566E   0004 0114 036C

        MOVR    R1,     R4                      ; 5671   008C
        ADDI    #$0004, R1                      ; 5672   02F9 0004
        MOVR    R1,     R2                      ; 5674   008A
        TSTR    R3                              ; 5675   009B
        BNEQ    L_56E3                          ; 5676   020C 006B

        ADDI    #$0165, R0                      ; 5678   02F8 0165
        MOVR    R0,     R1                      ; 567A   0081
        MVI@    R1,     R1                      ; 567B   0289
        MVII    #$0011, R0                      ; 567C   02B8 0011

        JSR     R5,     .EXEC.629               ; 567E   0004 0114 0229

        MVO@    R0,     R2                      ; 5681   0250
        MOVR    R4,     R1                      ; 5682   00A1
        SDBD                                    ; 5683   0001
        MVII    #$5663, R2                      ; 5684   02BA 0063 0056
        SDBD                                    ; 5687   0001
        MVII    #$5803, R4                      ; 5688   02BC 0003 0058

        JSR     R5,     .EXEC.2AE               ; 568B   0004 0110 02AE

        SDBD                                    ; 568E   0001
        MVII    #$A430, R2                      ; 568F   02BA 0030 00A4
        SDBD                                    ; 5692   0001
        MVII    #$0633, R4                      ; 5693   02BC 0033 0006

        JSR     R5,     .EXEC.2AE               ; 5696   0004 0110 02AE
        JSR     R5,     .EXEC.777               ; 5699   0004 0114 0377

        SDBD                                    ; 569C   0001
        MVII    #$0617, R4                      ; 569D   02BC 0017 0006
        PSHR    R4                              ; 56A0   0274
        CMPI    #$0058, R2                      ; 56A1   037A 0058
        BPL     L_56C3                          ; 56A3   0203 001E

        SDBD                                    ; 56A5   0001
        MVII    #$2648, R2                      ; 56A6   02BA 0048 0026

        JSR     R5,     .EXEC.2AE               ; 56A9   0004 0110 02AE

        PULR    R0                              ; 56AC   02B0
        SWAP    R0,     1                       ; 56AD   0040
        MOVR    R0,     R4                      ; 56AE   0084
        SDBD                                    ; 56AF   0001
        MVII    #$2816, R2                      ; 56B0   02BA 0016 0028

        JSR     R5,     .EXEC.2AE               ; 56B3   0004 0110 02AE

        SDBD                                    ; 56B6   0001
        MVII    #$0C06, R4                      ; 56B7   02BC 0006 000C
        SDBD                                    ; 56BA   0001
        MVII    #$442E, R2                      ; 56BB   02BA 002E 0044

        JSR     R5,     .EXEC.2AE               ; 56BE   0004 0110 02AE

        B       L_56DF                          ; 56C1   0200 001C

L_56C3:
        SDBD                                    ; 56C3   0001
        MVII    #$8220, R2                      ; 56C4   02BA 0020 0082

        JSR     R5,     .EXEC.2AE               ; 56C7   0004 0110 02AE

        PULR    R0                              ; 56CA   02B0
        SWAP    R0,     1                       ; 56CB   0040
        MOVR    R0,     R4                      ; 56CC   0084
        SDBD                                    ; 56CD   0001
        MVII    #$8052, R2                      ; 56CE   02BA 0052 0080

        JSR     R5,     .EXEC.2AE               ; 56D1   0004 0110 02AE

        SDBD                                    ; 56D4   0001
        MVII    #$0C06, R4                      ; 56D5   02BC 0006 000C
        SDBD                                    ; 56D8   0001
        MVII    #$643A, R2                      ; 56D9   02BA 003A 0064

        JSR     R5,     .EXEC.2AE               ; 56DC   0004 0110 02AE
L_56DF:
        JSR     R5,     L_5FD1                  ; 56DF   0004 015C 03D1

        PULR    R7                              ; 56E2   02B7

L_56E3:
        CLRR    R0                              ; 56E3   01C0
        MVO@    R0,     R1                      ; 56E4   0248
L_56E5:
        MVO     R0,     G_0171                  ; 56E5   0240 0171

        JSR     R5,     L_5FDD                  ; 56E7   0004 015C 03DD

        PULR    R7                              ; 56EA   02B7

        PSHR    R5                              ; 56EB   0275
        MVO     R1,     G_0171                  ; 56EC   0241 0171

        JSR     R5,     .EXEC.2CA               ; 56EE   0004 0110 02CA

        PULR    R7                              ; 56F1   02B7

        PSHR    R5                              ; 56F2   0275
L_56F3:
        PSHR    R3                              ; 56F3   0273
        MOVR    R0,     R2                      ; 56F4   0082
        ANDI    #$0001, R2                      ; 56F5   03BA 0001
        CMPR    R3,     R2                      ; 56F7   015A
        BNEQ    L_5701                          ; 56F8   020C 0007

        MOVR    R0,     R2                      ; 56FA   0082
        ADDI    #$0167, R2                      ; 56FB   02FA 0167
        MVI@    R2,     R3                      ; 56FD   0293
        TSTR    R3                              ; 56FE   009B
        BEQ     L_5655                          ; 56FF   0224 00AB

L_5701:
        JSR     R5,     L_5657                  ; 5701   0004 0154 0257

        PULR    R0                              ; 5704   02B0
L_5705:
        MOVR    R0,     R1                      ; 5705   0081
        ADDI    #$016F, R1                      ; 5706   02F9 016F
        MVI@    R1,     R5                      ; 5708   028D
        TSTR    R5                              ; 5709   00AD
        BNEQ    L_5736                          ; 570A   020C 002A

        MVO@    R1,     R1                      ; 570C   0249
        MOVR    R0,     R3                      ; 570D   0083

        JSR     R5,     .EXEC.76C               ; 570E   0004 0114 036C

        MVI@    R1,     R0                      ; 5711   0288
        SDBD                                    ; 5712   0001
        ANDI    #$F71F, R0                      ; 5713   03B8 001F 00F7
        SDBD                                    ; 5716   0001
        XORI    #$8080, R0                      ; 5717   03F8 0080 0080
        MVO@    R0,     R1                      ; 571A   0248
        INCR    R1                              ; 571B   0009
        SDBD                                    ; 571C   0001
        MVII    #$5791, R0                      ; 571D   02B8 0091 0057
        MVO@    R0,     R1                      ; 5720   0248
        ADDI    #$0004, R1                      ; 5721   02F9 0004
        MVII    #$01F0, R0                      ; 5723   02B8 01F0
        MVO@    R0,     R1                      ; 5725   0248
        INCR    R1                              ; 5726   0009
        MVII    #$0032, R0                      ; 5727   02B8 0032
        MVO@    R0,     R1                      ; 5729   0248
        NEGR    R3                              ; 572A   0023
        ADDI    #$0162, R3                      ; 572B   02FB 0162
        MVI@    R3,     R1                      ; 572D   0299
        INCR    R1                              ; 572E   0009
        MVO@    R1,     R3                      ; 572F   0259

        JSR     R5,     L_5FC2                  ; 5730   0004 015C 03C2
        JSR     R5,     L_5198                  ; 5733   0004 0150 0198

L_5736:
        PULR    R7                              ; 5736   02B7

        PSHR    R5                              ; 5737   0275
        PSHR    R1                              ; 5738   0271
        PSHR    R0                              ; 5739   0270

        JSR     R5,     X_STOP_SFX              ; 573A   0004 011C 02B4

        PULR    R0                              ; 573D   02B0
        PULR    R1                              ; 573E   02B1

        JSR     R5,     L_574A                  ; 573F   0004 0154 034A

        MVI     G_015E, R2                      ; 5742   0282 015E
        DECR    R2                              ; 5744   0012
        BEQ     L_54B9                          ; 5745   0224 028D
        J       L_5C49                          ; 5747   0004 035C 0049

L_574A:
        MVII    #$0161, R4                      ; 574A   02BC 0161
L_574C:
        MVI@    R4,     R3                      ; 574C   02A3
        CMPI    #$000F, R3                      ; 574D   037B 000F
        BPL     L_5756                          ; 574F   0203 0005

        CMPI    #$0163, R4                      ; 5751   037C 0163
        BNEQ    L_574C                          ; 5753   022C 0008
        MOVR    R5,     R7                      ; 5755   00AF
L_5756:
        J       L_51AC                          ; 5756   0004 0350 01AC

        DECLE   $0061,  $0018,  $0079,  $0057   ; 5759   0061 0018 0079 0057
        DECLE   $0000,  $0019,  $0000,  $0010   ; 575D   0000 0019 0000 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5761   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5765   0000 0000 0000 0000
        DECLE   $0062,  $001A,  $0079,  $0057   ; 5769   0062 001A 0079 0057
        DECLE   $0000,  $0090,  $0000,  $0058   ; 576D   0000 0090 0000 0058
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5771   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5775   0000 0000 0000 0000
        DECLE   $0300,  $0000,  $0000,  $0000   ; 5779   0300 0000 0000 0000
        DECLE   $0005,  $0001,  $0004,  $00EB   ; 577D   0005 0001 0004 00EB
        DECLE   $0056,  $00EB,  $0156,  $037B   ; 5781   0056 00EB 0156 037B
        DECLE   $0055,  $0057,  $0056,  $0001   ; 5785   0055 0057 0056 0001
        DECLE   $0000,  $0005,  $0058,  $0055   ; 5789   0000 0005 0058 0055
        DECLE   $00F2,  $0056,  $00F2,  $0156   ; 578D   00F2 0056 00F2 0156
        DECLE   $0300,  $0000,  $0037,  $0057   ; 5791   0300 0000 0037 0057
        DECLE   $0005,  $000B,  $0000           ; 5795   0005 000B 0000

        MVII    #$0080, R0                      ; 5798   02B8 0080
        MVO     R0,     G_0163                  ; 579A   0240 0163
        CLRR    R0                              ; 579C   01C0
        MVO     R0,     G_0160                  ; 579D   0240 0160
        MVII    #$000C, R1                      ; 579F   02B9 000C
        MVII    #$0200, R4                      ; 57A1   02BC 0200

L_57A3:
        JSR     R5,     L_57DD                  ; 57A3   0004 0154 03DD

        ADDI    #$0002, R4                      ; 57A6   02FC 0002
        SDBD                                    ; 57A8   0001
        MVII    #$080F, R3                      ; 57A9   02BB 000F 0008
        MVO@    R3,     R4                      ; 57AC   0263
        INCR    R4                              ; 57AD   000C

        JSR     R5,     L_57DD                  ; 57AE   0004 0154 03DD

        ADDI    #$0002, R4                      ; 57B1   02FC 0002
        SDBD                                    ; 57B3   0001
        MVII    #$080F, R3                      ; 57B4   02BB 000F 0008
        MVO@    R3,     R4                      ; 57B7   0263
        INCR    R4                              ; 57B8   000C

        JSR     R5,     L_57DD                  ; 57B9   0004 0154 03DD

        DECR    R1                              ; 57BC   0011
        BNEQ    L_57A3                          ; 57BD   022C 001B

        SDBD                                    ; 57BF   0001
        MVII    #$2804, R0                      ; 57C0   02B8 0004 0028
        MVO     R0,     .BTAB.00                ; 57C3   0240 0200
        MVII    #$00D7, R0                      ; 57C5   02B8 00D7
        MVO     R0,     .BTAB.09                ; 57C7   0240 0209
        SDBD                                    ; 57C9   0001
        MVII    #$5BA0, R0                      ; 57CA   02B8 00A0 005B
        MVO     R0,     G_035D                  ; 57CD   0240 035D

        JSR     R5,     L_580A                  ; 57CF   0004 0158 000A
        JSR     R5,     L_581E                  ; 57D2   0004 0158 001E

        SDBD                                    ; 57D5   0001
        MVII    #$5030, R1                      ; 57D6   02B9 0030 0050

        JSR     R5,     X_TIMER_START           ; 57D9   0004 0118 0044

        PULR    R7                              ; 57DC   02B7

L_57DD:
        MVII    #$0004, R2                      ; 57DD   02BA 0004
        SDBD                                    ; 57DF   0001
        MVII    #$0804, R3                      ; 57E0   02BB 0004 0008
L_57E3:
        MVO@    R3,     R4                      ; 57E3   0263
        DECR    R2                              ; 57E4   0012
        BNEQ    L_57E3                          ; 57E5   022C 0003
        MOVR    R5,     R7                      ; 57E7   00AF

L_57E8:
        PSHR    R5                              ; 57E8   0275
L_57E9:
        MVII    #$0020, R0                      ; 57E9   02B8 0020

        JSR     R5,     X_RAND2                 ; 57EB   0004 0114 029E

        ANDI    #$0017, R0                      ; 57EE   03B8 0017
        BEQ     L_57E9                          ; 57F0   0224 0008

        CMPI    #$0017, R0                      ; 57F2   0378 0017
        BEQ     L_57E9                          ; 57F4   0224 000C

        CMPI    #$0013, R0                      ; 57F6   0378 0013
        BEQ     L_57E9                          ; 57F8   0224 0010

        PULR    R5                              ; 57FA   02B5
        MOVR    R0,     R2                      ; 57FB   0082
L_57FC:
        SDBD                                    ; 57FC   0001
        MVII    #$5B79, R4                      ; 57FD   02BC 0079 005B
        SDBD                                    ; 5800   0001
        MVI@    R4,     R1                      ; 5801   02A1
        XORR    R2,     R1                      ; 5802   01D1
        MVO@    R1,     R3                      ; 5803   0259
        INCR    R3                              ; 5804   000B
        SDBD                                    ; 5805   0001
        MVI@    R4,     R1                      ; 5806   02A1
        MVO@    R1,     R3                      ; 5807   0259
        INCR    R3                              ; 5808   000B
        MOVR    R5,     R7                      ; 5809   00AF

L_580A:
        PSHR    R5                              ; 580A   0275
L_580B:
        MVII    #$031D, R3                      ; 580B   02BB 031D
        MVII    #$0006, R2                      ; 580D   02BA 0006

        JSR     R5,     L_57FC                  ; 580F   0004 0154 03FC

        MVI@    R4,     R1                      ; 5812   02A1
        SWAP    R1,     1                       ; 5813   0041
        MVO@    R1,     R3                      ; 5814   0259
        INCR    R4                              ; 5815   000C
L_5816:
        INCR    R3                              ; 5816   000B
        MVI@    R4,     R1                      ; 5817   02A1
        SWAP    R1,     1                       ; 5818   0041
        MVO@    R1,     R3                      ; 5819   0259
        ADDI    #$0003, R3                      ; 581A   02FB 0003
        MVO@    R2,     R3                      ; 581C   025A
        PULR    R7                              ; 581D   02B7

L_581E:
        PSHR    R5                              ; 581E   0275
L_581F:
        MVII    #$0325, R3                      ; 581F   02BB 0325
        MVII    #$0001, R2                      ; 5821   02BA 0001

        JSR     R5,     L_57FC                  ; 5823   0004 0154 03FC

        INCR    R4                              ; 5826   000C
        MVI@    R4,     R1                      ; 5827   02A1
        SWAP    R1,     1                       ; 5828   0041
        MVO@    R1,     R3                      ; 5829   0259
        B       L_5816                          ; 582A   0220 0015

L_582C:
        PSHR    R5                              ; 582C   0275

        JSR     R5,     L_5FD1                  ; 582D   0004 015C 03D1

        CLRR    R4                              ; 5830   01E4
        MVII    #$017B, R3                      ; 5831   02BB 017B
L_5833:
        MOVR    R4,     R2                      ; 5833   00A2
        ADDI    #$0181, R2                      ; 5834   02FA 0181
        MVI@    R2,     R0                      ; 5836   0290
        TSTR    R0                              ; 5837   0080
        BNEQ    L_5874                          ; 5838   020C 003A

        MOVR    R4,     R2                      ; 583A   00A2
        ADDI    #$0173, R2                      ; 583B   02FA 0173
        MVI@    R3,     R0                      ; 583D   0298
        MVI@    R2,     R1                      ; 583E   0291
        ADDR    R0,     R1                      ; 583F   00C1
        MVO@    R1,     R3                      ; 5840   0259
        CMPI    #$0020, R1                      ; 5841   0379 0020
        BMI     L_5874                          ; 5843   020B 002F

        CLRR    R1                              ; 5845   01C9
        MVO@    R1,     R3                      ; 5846   0259
        INCR    R3                              ; 5847   000B
        MVI@    R3,     R0                      ; 5848   0298
        DECR    R0                              ; 5849   0010
        BPL     L_584E                          ; 584A   0203 0002

        MVII    #$0003, R0                      ; 584C   02B8 0003
L_584E:
        MVO@    R0,     R3                      ; 584E   0258
        DECR    R3                              ; 584F   0013
        SLL     R0,     2                       ; 5850   004C
        SLL     R0,     1                       ; 5851   0048
        SDBD                                    ; 5852   0001
        ADDI    #$080F, R0                      ; 5853   02F8 000F 0008
        MOVR    R4,     R1                      ; 5856   00A1
        SLL     R1,     2                       ; 5857   004D
        SLL     R1,     1                       ; 5858   0049
        ADDI    #$0206, R1                      ; 5859   02F9 0206
        MVII    #$000C, R2                      ; 585B   02BA 000C
L_585D:
        MVO@    R0,     R1                      ; 585D   0248
        ADDI    #$0014, R1                      ; 585E   02F9 0014
        DECR    R2                              ; 5860   0012
        BNEQ    L_585D                          ; 5861   022C 0005

        MOVR    R4,     R2                      ; 5863   00A2
        ADDI    #$0186, R2                      ; 5864   02FA 0186
        MVI@    R2,     R0                      ; 5866   0290
        INCR    R0                              ; 5867   0008
        MVO@    R0,     R2                      ; 5868   0250
        CMPI    #$001E, R0                      ; 5869   0378 001E
        BMI     L_5874                          ; 586B   020B 0007

        CLRR    R0                              ; 586D   01C0
        MVO@    R0,     R2                      ; 586E   0250
        ADDI    #$0002, R2                      ; 586F   02FA 0002
        MVI@    R2,     R0                      ; 5871   0290
        INCR    R0                              ; 5872   0008
        MVO@    R0,     R2                      ; 5873   0250
L_5874:
        INCR    R4                              ; 5874   000C
        ADDI    #$0002, R3                      ; 5875   02FB 0002
        CMPI    #$0002, R4                      ; 5877   037C 0002
        BMI     L_5833                          ; 5879   022B 0047

        MVII    #$0183, R1                      ; 587B   02B9 0183
        MVI@    R1,     R0                      ; 587D   0288
        INCR    R0                              ; 587E   0008
        MVO@    R0,     R1                      ; 587F   0248
        CMPI    #$0010, R0                      ; 5880   0378 0010
        BNEQ    L_58FE                          ; 5882   020C 007A

        CLRR    R0                              ; 5884   01C0
        MVO@    R0,     R1                      ; 5885   0248
        INCR    R1                              ; 5886   0009
        MVI@    R1,     R0                      ; 5887   0288
        INCR    R0                              ; 5888   0008
        MVO@    R0,     R1                      ; 5889   0248
        CMPI    #$003C, R0                      ; 588A   0378 003C
        BNEQ    L_589A                          ; 588C   020C 000C

        CLRR    R0                              ; 588E   01C0
        MVO@    R0,     R1                      ; 588F   0248
        INCR    R1                              ; 5890   0009
        MVI@    R1,     R0                      ; 5891   0288
        INCR    R0                              ; 5892   0008
        MVO@    R0,     R1                      ; 5893   0248
        CMPI    #$000A, R0                      ; 5894   0378 000A
        BNEQ    L_589A                          ; 5896   020C 0002

        CLRR    R0                              ; 5898   01C0
        MVO@    R0,     R1                      ; 5899   0248
L_589A:
        MVII    #$0007, R3                      ; 589A   02BB 0007
        MVII    #$0208, R4                      ; 589C   02BC 0208
        MVII    #$0001, R1                      ; 589E   02B9 0001
        MVI     G_0185, R0                      ; 58A0   0280 0185

        JSR     R5,     X_PRNUM_RGT             ; 58A2   0004 0118 00C5

        INCR    R1                              ; 58A5   0009
        ADDI    #$0002, R4                      ; 58A6   02FC 0002
        MVI     G_0184, R0                      ; 58A8   0280 0184

        JSR     R5,     X_PRNUM_ZRO             ; 58AA   0004 0118 00AD

        ADDI    #$000A, R4                      ; 58AD   02FC 000A
        MVII    #$0188, R2                      ; 58AF   02BA 0188
L_58B1:
        MVI@    R2,     R0                      ; 58B1   0290
        MVII    #$0004, R1                      ; 58B2   02B9 0004

        JSR     R5,     X_PRNUM_ZRO             ; 58B4   0004 0118 00AD

        MVI@    R2,     R0                      ; 58B7   0290
        CMPI    #$0064, R0                      ; 58B8   0378 0064
        BMI     L_58F7                          ; 58BA   020B 003B

        PSHR    R2                              ; 58BC   0272
        SUBI    #$0188, R2                      ; 58BD   033A 0188
        MOVR    R2,     R0                      ; 58BF   0090
        ADDI    #$0181, R2                      ; 58C0   02FA 0181
        MVI@    R2,     R1                      ; 58C2   0291
        TSTR    R1                              ; 58C3   0089
        BNEQ    L_58E9                          ; 58C4   020C 0023

        MVO@    R3,     R2                      ; 58C6   0253

        JSR     R5,     .EXEC.76C               ; 58C7   0004 0114 036C

        MVII    #$0004, R0                      ; 58CA   02B8 0004

L_58CC:
        JSR     R5,     L_5A5F                  ; 58CC   0004 0158 025F

        ADDI    #$0010, R1                      ; 58CF   02F9 0010
        DECR    R0                              ; 58D1   0010
        BNEQ    L_58CC                          ; 58D2   022C 0007

        ADDI    #$0014, R4                      ; 58D4   02FC 0014
        MVII    #$0001, R1                      ; 58D6   02B9 0001
        MVI     G_0185, R0                      ; 58D8   0280 0185

        JSR     R5,     X_PRNUM_RGT             ; 58DA   0004 0118 00C5

        INCR    R4                              ; 58DD   000C
        MVII    #$00D7, R0                      ; 58DE   02B8 00D7
        MVO@    R0,     R4                      ; 58E0   0260
        INCR    R1                              ; 58E1   0009
        MVI     G_0184, R0                      ; 58E2   0280 0184

        JSR     R5,     X_PRNUM_ZRO             ; 58E4   0004 0118 00AD

        SUBI    #$0016, R4                      ; 58E7   033C 0016
L_58E9:
        PULR    R2                              ; 58E9   02B2
        MVI     G_0188, R0                      ; 58EA   0280 0188
        TSTR    R0                              ; 58EC   0080
        BEQ     L_58FF                          ; 58ED   0204 0010

        MVI     G_0189, R1                      ; 58EF   0281 0189
        TSTR    R1                              ; 58F1   0089
        BEQ     L_58FF                          ; 58F2   0204 000B

        CMPR    R0,     R1                      ; 58F4   0141
        BEQ     L_5902                          ; 58F5   0204 000B

L_58F7:
        INCR    R2                              ; 58F7   000A
        ADDI    #$0010, R4                      ; 58F8   02FC 0010
        CMPI    #$018A, R2                      ; 58FA   037A 018A
        BNEQ    L_58B1                          ; 58FC   022C 004C
L_58FE:
        PULR    R7                              ; 58FE   02B7
L_58FF:
        J       L_51AC                          ; 58FF   0004 0350 01AC

L_5902:
        MVI     G_0160, R0                      ; 5902   0280 0160
        TSTR    R0                              ; 5904   0080
        BNEQ    L_58FF                          ; 5905   022C 0007

        MVO     R1,     G_0160                  ; 5907   0241 0160
        B       L_58F7                          ; 5909   0220 0013

        PSHR    R5                              ; 590B   0275
L_590C:
        MVII    #$0002, R4                      ; 590C   02BC 0002
        MOVR    R3,     R2                      ; 590E   009A
        ADDI    #$0173, R2                      ; 590F   02FA 0173
        CLRR    R0                              ; 5911   01C0
        MVO@    R0,     R2                      ; 5912   0250
        MOVR    R3,     R2                      ; 5913   009A
        ADDI    #$0181, R2                      ; 5914   02FA 0181
        MVO@    R1,     R2                      ; 5916   0251

L_5917:
        JSR     R5,     L_5A5F                  ; 5917   0004 0158 025F

        INCR    R1                              ; 591A   0009
        SDBD                                    ; 591B   0001
        MVII    #$5B95, R2                      ; 591C   02BA 0095 005B
        MVO@    R2,     R1                      ; 591F   024A
        ADDI    #$0005, R1                      ; 5920   02F9 0005
        MVII    #$0028, R2                      ; 5922   02BA 0028
        MVO@    R2,     R1                      ; 5924   024A
        MOVR    R3,     R0                      ; 5925   0098

        JSR     R5,     .EXEC.76C               ; 5926   0004 0114 036C

        DECR    R4                              ; 5929   0014
        BNEQ    L_5917                          ; 592A   022C 0014

        ADDI    #$0175, R3                      ; 592C   02FB 0175
        ADDI    #$0014, R1                      ; 592E   02F9 0014
        MVII    #$0003, R4                      ; 5930   02BC 0003
L_5932:
        MVI@    R3,     R2                      ; 5932   029A
        MVI@    R1,     R0                      ; 5933   0288
        SDBD                                    ; 5934   0001
        ANDI    #$FF00, R0                      ; 5935   03B8 0000 00FF
        ADDR    R0,     R2                      ; 5938   00C2
        MVO@    R2,     R1                      ; 5939   024A
        ADDI    #$0002, R3                      ; 593A   02FB 0002
        ADDI    #$0010, R1                      ; 593C   02F9 0010
        DECR    R4                              ; 593E   0014
        BNEQ    L_5932                          ; 593F   022C 000E
        J       L_5FC3                          ; 5941   0004 035C 03C3

        PSHR    R5                              ; 5944   0275
        MOVR    R3,     R0                      ; 5945   0098
        MOVR    R0,     R2                      ; 5946   0082
        ADDI    #$0181, R2                      ; 5947   02FA 0181
        MVI@    R2,     R2                      ; 5949   0292
        TSTR    R2                              ; 594A   0092
        BNEQ    L_58FE                          ; 594B   022C 004E

        JSR     R5,     .EXEC.76C               ; 594D   0004 0114 036C

        MVII    #$0003, R4                      ; 5950   02BC 0003

L_5952:
        JSR     R5,     L_5A5F                  ; 5952   0004 0158 025F

        ADDI    #$0010, R1                      ; 5955   02F9 0010
        DECR    R4                              ; 5957   0014
        BNEQ    L_5952                          ; 5958   022C 0007
        B       L_590C                          ; 595A   0220 004F

        PSHR    R5                              ; 595C   0275
        ANDI    #$0001, R0                      ; 595D   03B8 0001
        MOVR    R0,     R3                      ; 595F   0083

        JSR     R5,     .EXEC.76C               ; 5960   0004 0114 036C

        MVII    #$0004, R2                      ; 5963   02BA 0004

L_5965:
        JSR     R5,     L_5A57                  ; 5965   0004 0158 0257

        ADDI    #$0010, R1                      ; 5968   02F9 0010
        DECR    R2                              ; 596A   0012
        BNEQ    L_5965                          ; 596B   022C 0007

        MOVR    R3,     R2                      ; 596D   009A
        ADDI    #$0181, R2                      ; 596E   02FA 0181
        CLRR    R0                              ; 5970   01C0
        MVO@    R0,     R2                      ; 5971   0250
        TSTR    R3                              ; 5972   009B
        BEQ     L_580B                          ; 5973   0224 0169
        B       L_581F                          ; 5975   0220 0157

        PSHR    R5                              ; 5977   0275
        CMPI    #$0004, R0                      ; 5978   0378 0004
        BMI     L_58FE                          ; 597A   022B 007D

        MVII    #$0002, R4                      ; 597C   02BC 0002
L_597E:
        MOVR    R0,     R2                      ; 597E   0082
        ADDI    #$0173, R2                      ; 597F   02FA 0173
        CLRR    R5                              ; 5981   01ED
        MVO@    R5,     R2                      ; 5982   0255
        INCR    R1                              ; 5983   0009
        SDBD                                    ; 5984   0001
        MVII    #$5B95, R2                      ; 5985   02BA 0095 005B
        MVO@    R2,     R1                      ; 5988   024A
        ADDI    #$0003, R1                      ; 5989   02F9 0003
        MOVR    R0,     R2                      ; 598B   0082
        ANDI    #$0001, R2                      ; 598C   03BA 0001
        ADDI    #$0173, R2                      ; 598E   02FA 0173
        MVI@    R2,     R2                      ; 5990   0292
        MVO@    R2,     R1                      ; 5991   024A
        MOVR    R3,     R0                      ; 5992   0098

        JSR     R5,     .EXEC.76C               ; 5993   0004 0114 036C

        DECR    R4                              ; 5996   0014
        BNEQ    L_597E                          ; 5997   022C 001A

        JSR     R5,     L_5FC2                  ; 5999   0004 015C 03C2

        PULR    R7                              ; 599C   02B7

        PSHR    R5                              ; 599D   0275

        JSR     R5,     L_538E                  ; 599E   0004 0150 038E

        MOVR    R0,     R3                      ; 59A1   0083
        ADDI    #$0173, R3                      ; 59A2   02FB 0173
        MVI@    R3,     R0                      ; 59A4   0298
        SLR     R0,     1                       ; 59A5   0060

        JSR     R5,     .EXEC.629               ; 59A6   0004 0114 0229

        MVO@    R0,     R2                      ; 59A9   0250
        SUBI    #$0004, R2                      ; 59AA   033A 0004
        MOVR    R2,     R1                      ; 59AC   0091
        B       L_59B4                          ; 59AD   0200 0005

        PSHR    R5                              ; 59AF   0275
        CMPI    #$0002, R0                      ; 59B0   0378 0002
        BPL     L_59D2                          ; 59B2   0203 001E

L_59B4:
        SDBD                                    ; 59B4   0001
        MVII    #$1408, R4                      ; 59B5   02BC 0008 0014
        PSHR    R4                              ; 59B8   0274
        SDBD                                    ; 59B9   0001
        MVII    #$1354, R2                      ; 59BA   02BA 0054 0013

        JSR     R5,     .EXEC.2AE               ; 59BD   0004 0110 02AE

        PULR    R4                              ; 59C0   02B4
        PSHR    R4                              ; 59C1   0274
        SDBD                                    ; 59C2   0001
        MVII    #$5454, R2                      ; 59C3   02BA 0054 0054

        JSR     R5,     .EXEC.2AE               ; 59C6   0004 0110 02AE

        PULR    R4                              ; 59C9   02B4
        SDBD                                    ; 59CA   0001
        MVII    #$9454, R2                      ; 59CB   02BA 0054 0094

        JSR     R5,     .EXEC.2AE               ; 59CE   0004 0110 02AE

        PULR    R7                              ; 59D1   02B7

L_59D2:
        MOVR    R0,     R4                      ; 59D2   0084
        MVII    #$0010, R0                      ; 59D3   02B8 0010

        JSR     R5,     X_RAND2                 ; 59D5   0004 0114 029E

        TSTR    R0                              ; 59D8   0080
        BEQ     L_59EE                          ; 59D9   0204 0013

        JSR     R5,     .EXEC.777               ; 59DB   0004 0114 0377

        MVII    #$0028, R0                      ; 59DE   02B8 0028
        ANDI    #$0001, R4                      ; 59E0   03BC 0001
        BEQ     L_59E6                          ; 59E2   0204 0002

        ADDI    #$0040, R0                      ; 59E4   02F8 0040
L_59E6:
        CMPR    R0,     R2                      ; 59E6   0142
        BLE     L_59EE                          ; 59E7   0206 0005

        ADDI    #$0018, R0                      ; 59E9   02F8 0018
        CMPR    R0,     R2                      ; 59EB   0142
        BMI     L_5A3A                          ; 59EC   020B 004C

L_59EE:
        CLRR    R2                              ; 59EE   01D2
        J       L_51FD                          ; 59EF   0004 0350 01FD

        PSHR    R5                              ; 59F2   0275
        MVII    #$0001, R4                      ; 59F3   02BC 0001
        MVII    #$0003, R2                      ; 59F5   02BA 0003
L_59F7:
        TSTR    R0                              ; 59F7   0080
        BMI     L_5A3A                          ; 59F8   020B 0040

        MOVR    R1,     R0                      ; 59FA   0088
        ADDI    #$0181, R1                      ; 59FB   02F9 0181
        MVI@    R1,     R3                      ; 59FD   028B
        TSTR    R3                              ; 59FE   009B
        BNEQ    L_5A3A                          ; 59FF   020C 0039

        MOVR    R0,     R1                      ; 5A01   0081
        ADDI    #$017F, R1                      ; 5A02   02F9 017F
        MVI@    R1,     R3                      ; 5A04   028B
        DECR    R3                              ; 5A05   0013
        MVO@    R3,     R1                      ; 5A06   024B
        BPL     L_5A3A                          ; 5A07   0203 0031

        MVO@    R2,     R1                      ; 5A09   024A
        MOVR    R0,     R1                      ; 5A0A   0081
        ADDI    #$0173, R1                      ; 5A0B   02F9 0173
        MVI@    R1,     R3                      ; 5A0D   028B
        ADDR    R4,     R3                      ; 5A0E   00E3
        BMI     L_5A3A                          ; 5A0F   020B 0029

        CMPI    #$0020, R3                      ; 5A11   037B 0020
        BGT     L_5A3A                          ; 5A13   020E 0025

        MVO@    R3,     R1                      ; 5A15   024B
        MOVR    R3,     R4                      ; 5A16   009C
        MOVR    R1,     R2                      ; 5A17   008A
        ADDI    #$0002, R0                      ; 5A18   02F8 0002

        JSR     R5,     .EXEC.76C               ; 5A1A   0004 0114 036C

        ADDI    #$0004, R1                      ; 5A1D   02F9 0004

        JSR     R5,     L_5A3B                  ; 5A1F   0004 0158 023B

        ADDI    #$0010, R1                      ; 5A22   02F9 0010

        JSR     R5,     L_5A3B                  ; 5A24   0004 0158 023B

        ADDI    #$0010, R1                      ; 5A27   02F9 0010

        JSR     R5,     L_5A3B                  ; 5A29   0004 0158 023B

        MVI     G_0173, R0                      ; 5A2C   0280 0173
        MVI     G_0174, R1                      ; 5A2E   0281 0174
        CMPR    R1,     R0                      ; 5A30   0148
        BPL     L_5A34                          ; 5A31   0203 0001

        MOVR    R1,     R0                      ; 5A33   0088
L_5A34:
        SLL     R0,     1                       ; 5A34   0048
        NEGR    R0                              ; 5A35   0020
        ADDI    #$0080, R0                      ; 5A36   02F8 0080
        MVO     R0,     G_0163                  ; 5A38   0240 0163
L_5A3A:
        PULR    R7                              ; 5A3A   02B7

L_5A3B:
        PSHR    R5                              ; 5A3B   0275
        ADDI    #$0002, R2                      ; 5A3C   02FA 0002
        MVI@    R2,     R0                      ; 5A3E   0290

        JSR     R5,     X_EXT_SIGN_LO           ; 5A3F   0004 0114 0268

        ADDR    R4,     R0                      ; 5A42   00E0
        MOVR    R0,     R3                      ; 5A43   0083
        PSHR    R1                              ; 5A44   0271
        MVI@    R1,     R0                      ; 5A45   0288

        JSR     R5,     X_UNPK_BYTES            ; 5A46   0004 0114 0357

        MOVR    R3,     R1                      ; 5A49   0099

        JSR     R5,     X_PACK_BYTES            ; 5A4A   0004 0114 034F

        PULR    R1                              ; 5A4D   02B1
        MVO@    R0,     R1                      ; 5A4E   0248
        PULR    R7                              ; 5A4F   02B7

        PSHR    R5                              ; 5A50   0275
        CLRR    R4                              ; 5A51   01E4
        DECR    R4                              ; 5A52   0014
        MVII    #$0001, R2                      ; 5A53   02BA 0001
        B       L_59F7                          ; 5A55   0220 005F

L_5A57:
        PSHR    R5                              ; 5A57   0275
        MVII    #$0008, R0                      ; 5A58   02B8 0008
        MOVR    R1,     R4                      ; 5A5A   008C

        JSR     R5,     X_FILL_ZERO             ; 5A5B   0004 0114 0338

        PULR    R7                              ; 5A5E   02B7

L_5A5F:
        MVI@    R1,     R2                      ; 5A5F   028A
        SLL     R2,     1                       ; 5A60   004A
        SLR     R2,     1                       ; 5A61   0062
        SDBD                                    ; 5A62   0001
        XORI    #$8000, R2                      ; 5A63   03FA 0000 0080
        MVO@    R2,     R1                      ; 5A66   024A
        MOVR    R5,     R7                      ; 5A67   00AF

        PSHR    R5                              ; 5A68   0275
        ADDI    #$0006, R1                      ; 5A69   02F9 0006
        MVII    #$0002, R3                      ; 5A6B   02BB 0002
        MVO@    R3,     R1                      ; 5A6D   024B
        MOVR    R0,     R3                      ; 5A6E   0083
        ADDI    #$0181, R0                      ; 5A6F   02F8 0181
        MOVR    R0,     R2                      ; 5A71   0082
        MVI@    R2,     R0                      ; 5A72   0290
        TSTR    R0                              ; 5A73   0080
        BNEQ    L_58FE                          ; 5A74   022C 0177

        ADDI    #$000A, R1                      ; 5A76   02F9 000A

        JSR     R5,     .EXEC.760               ; 5A78   0004 0114 0360

        BEQ     L_5ACC                          ; 5A7B   0204 004F

        MVII    #$0028, R0                      ; 5A7D   02B8 0028

        JSR     R5,     X_RAND2                 ; 5A7F   0004 0114 029E

        TSTR    R0                              ; 5A82   0080
        BEQ     L_5B3C                          ; 5A83   0204 00B7

        MOVR    R0,     R2                      ; 5A85   0082
        MVII    #$0019, R0                      ; 5A86   02B8 0019

        JSR     R5,     X_RAND2                 ; 5A88   0004 0114 029E

        MOVR    R0,     R2                      ; 5A8B   0082
        ADDI    #$0010, R1                      ; 5A8C   02F9 0010

        JSR     R5,     .EXEC.760               ; 5A8E   0004 0114 0360

        BEQ     L_5A98                          ; 5A91   0204 0005

        ANDI    #$0002, R2                      ; 5A93   03BA 0002
        BNEQ    L_5B4F                          ; 5A95   020C 00B8
        PULR    R7                              ; 5A97   02B7

L_5A98:
        TSTR    R2                              ; 5A98   0092
        BNEQ    L_5ACB                          ; 5A99   020C 0030

        MOVR    R1,     R2                      ; 5A9B   008A
        ADDI    #$0010, R1                      ; 5A9C   02F9 0010

        JSR     R5,     .EXEC.760               ; 5A9E   0004 0114 0360

        BEQ     L_5AAB                          ; 5AA1   0204 0008

        MOVR    R3,     R1                      ; 5AA3   0099
        ADDI    #$017A, R1                      ; 5AA4   02F9 017A
        MVI@    R1,     R1                      ; 5AA6   0289
        ANDI    #$0080, R1                      ; 5AA7   03B9 0080
        BEQ     L_5ACB                          ; 5AA9   0204 0020

L_5AAB:
        JSR     R5,     L_5AF5                  ; 5AAB   0004 0158 02F5

        MVII    #$0012, R0                      ; 5AAE   02B8 0012

        JSR     R5,     X_RAND2                 ; 5AB0   0004 0114 029E

        ADDI    #$0004, R0                      ; 5AB3   02F8 0004
        MVO@    R0,     R2                      ; 5AB5   0250
        SUBI    #$0004, R2                      ; 5AB6   033A 0004
        MVI@    R2,     R1                      ; 5AB8   0291
        ADDR    R0,     R1                      ; 5AB9   00C1
        ADDI    #$0004, R3                      ; 5ABA   02FB 0004
L_5ABC:
        MOVR    R0,     R2                      ; 5ABC   0082
        MVII    #$0008, R0                      ; 5ABD   02B8 0008

        JSR     R5,     X_RAND2                 ; 5ABF   0004 0114 029E

        TSTR    R0                              ; 5AC2   0080
        BNEQ    L_5ACA                          ; 5AC3   020C 0005

        SLR     R2,     1                       ; 5AC5   0062
        ANDI    #$00FF, R2                      ; 5AC6   03BA 00FF
        SWAP    R2,     1                       ; 5AC8   0042
        ADDR    R2,     R1                      ; 5AC9   00D1
L_5ACA:
        MVO@    R1,     R3                      ; 5ACA   0259
L_5ACB:
        PULR    R7                              ; 5ACB   02B7

L_5ACC:
        MOVR    R1,     R2                      ; 5ACC   008A
        ADDI    #$0020, R1                      ; 5ACD   02F9 0020

        JSR     R5,     .EXEC.760               ; 5ACF   0004 0114 0360

        BEQ     L_5ADC                          ; 5AD2   0204 0008

        MOVR    R3,     R1                      ; 5AD4   0099
        ADDI    #$0179, R1                      ; 5AD5   02F9 0179
        MVI@    R1,     R1                      ; 5AD7   0289
        ANDI    #$00C0, R1                      ; 5AD8   03B9 00C0
        BNEQ    L_5ACB                          ; 5ADA   022C 0010

L_5ADC:
        MOVR    R2,     R1                      ; 5ADC   0091
        MOVR    R3,     R2                      ; 5ADD   009A
        ADDI    #$0173, R2                      ; 5ADE   02FA 0173
        MVI@    R2,     R4                      ; 5AE0   0294
        MVII    #$000D, R0                      ; 5AE1   02B8 000D

        JSR     R5,     X_RAND2                 ; 5AE3   0004 0114 029E

        ADDI    #$0005, R0                      ; 5AE6   02F8 0005
        CMPR    R0,     R4                      ; 5AE8   0144
        BLE     L_5ACB                          ; 5AE9   0226 001F

        ADDI    #$0002, R2                      ; 5AEB   02FA 0002
        NEGR    R0                              ; 5AED   0020
        MVO@    R0,     R2                      ; 5AEE   0250

        JSR     R5,     L_5B18                  ; 5AEF   0004 0158 0318

        MOVR    R2,     R1                      ; 5AF2   0091
        B       L_5ABC                          ; 5AF3   0220 0038

L_5AF5:
        PSHR    R5                              ; 5AF5   0275
        PSHR    R3                              ; 5AF6   0273
        MOVR    R2,     R3                      ; 5AF7   0093

        JSR     R5,     L_57E8                  ; 5AF8   0004 0154 03E8

        PULR    R0                              ; 5AFB   02B0
        MOVR    R0,     R2                      ; 5AFC   0082
        MOVR    R0,     R4                      ; 5AFD   0084
        SDBD                                    ; 5AFE   0001
        ADDI    #$5B7D, R4                      ; 5AFF   02FC 007D 005B
        MVI@    R4,     R1                      ; 5B02   02A1
        SUBI    #$0012, R1                      ; 5B03   0339 0012
        MVII    #$0005, R0                      ; 5B05   02B8 0005

        JSR     R5,     X_RAND2                 ; 5B07   0004 0114 029E

        ADDR    R0,     R1                      ; 5B0A   00C1
        SWAP    R1,     1                       ; 5B0B   0041
L_5B0C:
        MVO@    R1,     R3                      ; 5B0C   0259
        SUBI    #$0002, R3                      ; 5B0D   033B 0002
        MVI@    R3,     R1                      ; 5B0F   0299
        SDBD                                    ; 5B10   0001
        XORI    #$0400, R1                      ; 5B11   03F9 0000 0004
        MVO@    R1,     R3                      ; 5B14   0259
        ADDI    #$0177, R2                      ; 5B15   02FA 0177
        PULR    R7                              ; 5B17   02B7

L_5B18:
        PSHR    R5                              ; 5B18   0275
        PSHR    R3                              ; 5B19   0273
        MOVR    R1,     R3                      ; 5B1A   008B

        JSR     R5,     L_57E8                  ; 5B1B   0004 0154 03E8

        PULR    R1                              ; 5B1E   02B1
        MOVR    R1,     R4                      ; 5B1F   008C
        SDBD                                    ; 5B20   0001
        ADDI    #$5B7D, R4                      ; 5B21   02FC 007D 005B
        MVI@    R4,     R2                      ; 5B24   02A2
        SUBI    #$0002, R2                      ; 5B25   033A 0002
        MVII    #$0005, R0                      ; 5B27   02B8 0005

        JSR     R5,     X_RAND2                 ; 5B29   0004 0114 029E

        ADDR    R2,     R0                      ; 5B2C   00D0
        SWAP    R0,     1                       ; 5B2D   0040
        MVO@    R0,     R3                      ; 5B2E   0258
        ADDI    #$0002, R3                      ; 5B2F   02FB 0002
        ADDI    #$0173, R1                      ; 5B31   02F9 0173
        MVI@    R1,     R2                      ; 5B33   028A
        ADDI    #$0002, R1                      ; 5B34   02F9 0002
        MVI@    R1,     R0                      ; 5B36   0288

        JSR     R5,     X_EXT_SIGN_LO           ; 5B37   0004 0114 0268

        ADDR    R0,     R2                      ; 5B3A   00C2
        PULR    R7                              ; 5B3B   02B7

L_5B3C:
        JSR     R5,     L_5B67                  ; 5B3C   0004 0158 0367

        ADDI    #$0020, R1                      ; 5B3F   02F9 0020

        JSR     R5,     .EXEC.760               ; 5B41   0004 0114 0360

        BNEQ    L_5ACB                          ; 5B44   022C 007A

        JSR     R5,     L_5B18                  ; 5B46   0004 0158 0318

        ADDI    #$0004, R1                      ; 5B49   02F9 0004
        MVO@    R0,     R1                      ; 5B4B   0248
        MOVR    R2,     R1                      ; 5B4C   0091
        B       L_5ABC                          ; 5B4D   0220 0092

L_5B4F:
        JSR     R5,     L_5B67                  ; 5B4F   0004 0158 0367

        ADDI    #$0010, R1                      ; 5B52   02F9 0010

        JSR     R5,     .EXEC.760               ; 5B54   0004 0114 0360

        BNEQ    L_5ACB                          ; 5B57   022C 008D

        JSR     R5,     L_5AF5                  ; 5B59   0004 0158 02F5

        MVI@    R2,     R0                      ; 5B5C   0290
        ADDI    #$0002, R2                      ; 5B5D   02FA 0002
        MVO@    R0,     R2                      ; 5B5F   0250
        SUBI    #$0006, R2                      ; 5B60   033A 0006
        MVI@    R2,     R1                      ; 5B62   0291
        ADDI    #$0004, R3                      ; 5B63   02FB 0004
        B       L_5ABC                          ; 5B65   0220 00AA

L_5B67:
        PSHR    R5                              ; 5B67   0275
        MOVR    R3,     R4                      ; 5B68   009C
        MVI     G_015F, R3                      ; 5B69   0283 015F
        TSTR    R3                              ; 5B6B   009B
        BEQ     L_5B77                          ; 5B6C   0204 0009

        JSR     R5,     .EXEC.777               ; 5B6E   0004 0114 0377

        CMPI    #$0011, R3                      ; 5B71   037B 0011
        BMI     L_5B77                          ; 5B73   020B 0002

        MOVR    R4,     R3                      ; 5B75   00A3
        PULR    R7                              ; 5B76   02B7

L_5B77:
        PULR    R5                              ; 5B77   02B5
        PULR    R7                              ; 5B78   02B7

        DECLE   $00C0,  $0018,  $0080,  $005B   ; 5B79   00C0 0018 0080 005B
        DECLE   $003C,  $007D,  $0053,  $0257   ; 5B7D   003C 007D 0053 0257
        DECLE   $005A,  $0068,  $005A,  $0001   ; 5B81   005A 0068 005A 0001

        NEGR    R0                              ; 5B85   0020
        INCR    R5                              ; 5B86   000D
        MOVR    R5,     R7                      ; 5B87   00AF

        DECLE   $0059,  $000B,  $0059,  $000B   ; 5B88   0059 000B 0059 000B
        DECLE   $0159,  $0277,  $0059,  $0277   ; 5B8C   0159 0277 0059 0277
        DECLE   $0159,  $0177,  $0059,  $0177   ; 5B90   0159 0177 0059 0177
        DECLE   $0159,  $0257,  $005A,  $005C   ; 5B94   0159 0257 005A 005C
        DECLE   $0059,  $0001,  $0022,  $0004   ; 5B98   0059 0001 0022 0004
        DECLE   $0044,  $0059,  $0044,  $0159   ; 5B9C   0044 0059 0044 0159
        DECLE   $009D,  $0059,  $0000,  $0000   ; 5BA0   009D 0059 0000 0000

        ADDR    R6,     R2                      ; 5BA4   00F2
        SLLC    R1,     1                       ; 5BA5   0059
        RLC     R0,     1                       ; 5BA6   0050
        SLLC    R2,     1                       ; 5BA7   005A
        RLC     R0,     1                       ; 5BA8   0050
        SLLC    R2,     1                       ; 5BA9   005A

        JSR     R5,     L_5CB0                  ; 5BAA   0004 015C 00B0

        MVII    #$0001, R0                      ; 5BAD   02B8 0001
        MVO     R0,     .STIC.EDGE              ; 5BAF   0240 0032
        MVII    #$00F0, R0                      ; 5BB1   02B8 00F0
        MVII    #$0200, R4                      ; 5BB3   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5BB5   0004 0114 0338

        MVII    #$0267, R4                      ; 5BB8   02BC 0267

        JSR     R5,     L_5C9C                  ; 5BBA   0004 015C 009C

        MVII    #$0234, R4                      ; 5BBD   02BC 0234

        JSR     R5,     L_5C9C                  ; 5BBF   0004 015C 009C

        MVII    #$0035, R0                      ; 5BC2   02B8 0035
        MVO     R0,     G_0163                  ; 5BC4   0240 0163
        SDBD                                    ; 5BC6   0001
        MVII    #$5EB9, R1                      ; 5BC7   02B9 00B9 005E
        MVII    #$034D, R2                      ; 5BCA   02BA 034D

        JSR     R5,     X_INIT_MOB              ; 5BCC   0004 0114 02B2
        JSR     R5,     L_5C30                  ; 5BCF   0004 015C 0030

        MVII    #$0008, R0                      ; 5BD2   02B8 0008
        MVII    #$018A, R4                      ; 5BD4   02BC 018A

        JSR     R5,     X_FILL_ZERO             ; 5BD6   0004 0114 0338

        MVO     R0,     G_018E                  ; 5BD9   0240 018E
        MVO     R0,     G_0166                  ; 5BDB   0240 0166
        MVII    #$0088, R0                      ; 5BDD   02B8 0088
        MVO     R0,     G_018B                  ; 5BDF   0240 018B
        MVO     R0,     G_018F                  ; 5BE1   0240 018F
        CLRR    R0                              ; 5BE3   01C0
        MVO     R0,     G_0165                  ; 5BE4   0240 0165
        SDBD                                    ; 5BE6   0001
        MVII    #$5C0F, R2                      ; 5BE7   02BA 000F 005C
        ADD     G_015F, R2                      ; 5BEA   02C2 015F
        MVI@    R2,     R2                      ; 5BEC   0292
        MVO     R2,     G_0160                  ; 5BED   0242 0160
        MVO     R2,     G_016F                  ; 5BEF   0242 016F
        MVO     R2,     G_0170                  ; 5BF1   0242 0170
        SDBD                                    ; 5BF3   0001
        MVII    #$5028, R1                      ; 5BF4   02B9 0028 0050

        JSR     R5,     X_TIMER_START           ; 5BF7   0004 0118 0044
        JSR     R5,     L_5C11                  ; 5BFA   0004 015C 0011

        MVII    #$031D, R2                      ; 5BFD   02BA 031D
        SDBD                                    ; 5BFF   0001
        MVII    #$5E99, R1                      ; 5C00   02B9 0099 005E
        MVII    #$0002, R0                      ; 5C03   02B8 0002

        JSR     R5,     X_INIT_MOBS             ; 5C05   0004 0114 02B4

        SDBD                                    ; 5C08   0001
        MVII    #$512B, R0                      ; 5C09   02B8 002B 0051
        MVO     R0,     G_035D                  ; 5C0C   0240 035D
        PULR    R7                              ; 5C0E   02B7

        INCR    R4                              ; 5C0F   000C
        COMR    R6                              ; 5C10   001E
L_5C11:
        PSHR    R5                              ; 5C11   0275
L_5C12:
        MVII    #$0028, R0                      ; 5C12   02B8 0028
        MVII    #$0200, R4                      ; 5C14   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5C16   0004 0114 0338

        MVII    #$000B, R0                      ; 5C19   02B8 000B

        JSR     R5,     X_RAND2                 ; 5C1B   0004 0114 029E

        MOVR    R0,     R2                      ; 5C1E   0082
        ADDI    #$0005, R2                      ; 5C1F   02FA 0005
        ANDI    #$0001, R0                      ; 5C21   03B8 0001
        BEQ     L_5C26                          ; 5C23   0204 0001

        NEGR    R2                              ; 5C25   0022
L_5C26:
        MVO     R2,     G_0196                  ; 5C26   0242 0196
        SDBD                                    ; 5C28   0001
        MVII    #$502C, R1                      ; 5C29   02B9 002C 0050

        JSR     R5,     X_TIMER_START           ; 5C2C   0004 0118 0044

        PULR    R7                              ; 5C2F   02B7

L_5C30:
        PSHR    R5                              ; 5C30   0275

        JSR     R5,     L_574A                  ; 5C31   0004 0154 034A

        MVII    #$0355, R2                      ; 5C34   02BA 0355
        SDBD                                    ; 5C36   0001
        MVII    #$5EC9, R1                      ; 5C37   02B9 00C9 005E

        JSR     R5,     X_INIT_MOB              ; 5C3A   0004 0114 02B2

        MVII    #$0007, R0                      ; 5C3D   02B8 0007

        JSR     R5,     .EXEC.6CF               ; 5C3F   0004 0114 02CF

        CLRR    R0                              ; 5C42   01C0
        MVO     R0,     G_0194                  ; 5C43   0240 0194
        MVO     R0,     G_0195                  ; 5C45   0240 0195
        B       L_5C12                          ; 5C47   0220 0036

L_5C49:
        MOVR    R1,     R2                      ; 5C49   008A
        SDBD                                    ; 5C4A   0001
        MVII    #$5E99, R1                      ; 5C4B   02B9 0099 005E
        MOVR    R0,     R3                      ; 5C4E   0083
        BEQ     L_5C53                          ; 5C4F   0204 0002

        ADDI    #$0010, R1                      ; 5C51   02F9 0010

L_5C53:
        JSR     R5,     X_INIT_MOB              ; 5C53   0004 0114 02B2

        SLL     R3,     2                       ; 5C56   004F
        MOVR    R3,     R4                      ; 5C57   009C
        ADDI    #$018A, R4                      ; 5C58   02FC 018A
        MVII    #$0004, R0                      ; 5C5A   02B8 0004

        JSR     R5,     X_FILL_ZERO             ; 5C5C   0004 0114 0338

        MVII    #$0088, R1                      ; 5C5F   02B9 0088
        TSTR    R3                              ; 5C61   009B
        BEQ     L_5C6D                          ; 5C62   0204 0009

        SLL     R0,     1                       ; 5C64   0048
        MVO     R0,     G_018E                  ; 5C65   0240 018E
        MVO     R0,     G_0166                  ; 5C67   0240 0166
        MVO     R1,     G_018F                  ; 5C69   0241 018F
        B       L_5C72                          ; 5C6B   0200 0005

L_5C6D:
        CLRR    R0                              ; 5C6D   01C0
        MVO     R0,     G_0165                  ; 5C6E   0240 0165
        MVO     R1,     G_018B                  ; 5C70   0241 018B
L_5C72:
        MOVR    R2,     R1                      ; 5C72   0091

        JSR     R5,     .EXEC.777               ; 5C73   0004 0114 0377

        SUB     G_0198, R2                      ; 5C76   0302 0198
        SWAP    R2,     1                       ; 5C78   0042
        ADDI    #$0002, R1                      ; 5C79   02F9 0002
        MVO@    R2,     R1                      ; 5C7B   024A
        B       L_5C12                          ; 5C7C   0220 006B

        PSHR    R5                              ; 5C7E   0275
        MOVR    R1,     R0                      ; 5C7F   0088
        ADDI    #$016F, R1                      ; 5C80   02F9 016F
        MVI@    R1,     R2                      ; 5C82   028A
        TSTR    R2                              ; 5C83   0092
        BEQ     L_5C9B                          ; 5C84   0204 0015

        MOVR    R1,     R3                      ; 5C86   008B

        JSR     R5,     .EXEC.76C               ; 5C87   0004 0114 036C

        INCR    R1                              ; 5C8A   0009
        MVI@    R1,     R0                      ; 5C8B   0288
        SDBD                                    ; 5C8C   0001
        CMPI    #$5EE0, R0                      ; 5C8D   0378 00E0 005E
        BNEQ    L_5C9B                          ; 5C90   020C 0009

        CLRR    R0                              ; 5C92   01C0
        MVO@    R0,     R3                      ; 5C93   0258
        DECR    R1                              ; 5C94   0011
        MVI@    R1,     R0                      ; 5C95   0288
        SDBD                                    ; 5C96   0001
        XORI    #$4000, R0                      ; 5C97   03F8 0000 0040
        MVO@    R0,     R1                      ; 5C9A   0248
L_5C9B:
        PULR    R7                              ; 5C9B   02B7

L_5C9C:
        SDBD                                    ; 5C9C   0001
        MVII    #$082F, R3                      ; 5C9D   02BB 002F 0008
        MVII    #$0002, R1                      ; 5CA0   02B9 0002
L_5CA2:
        MVII    #$0004, R2                      ; 5CA2   02BA 0004
L_5CA4:
        MVO@    R3,     R4                      ; 5CA4   0263
        ADDI    #$0008, R3                      ; 5CA5   02FB 0008
        DECR    R2                              ; 5CA7   0012
        BNEQ    L_5CA4                          ; 5CA8   022C 0005

        ADDI    #$0010, R4                      ; 5CAA   02FC 0010
        DECR    R1                              ; 5CAC   0011
        BNEQ    L_5CA2                          ; 5CAD   022C 000C
        MOVR    R5,     R7                      ; 5CAF   00AF

L_5CB0:
        PSHR    R5                              ; 5CB0   0275
        MOVR    R7,     R0                      ; 5CB1   00B8
        ADDI    #$000D, R0                      ; 5CB2   02F8 000D
        MVII    #$0100, R4                      ; 5CB4   02BC 0100
        MOVR    R4,     R5                      ; 5CB6   00A5
        DIS                                     ; 5CB7   0003
        SDBD                                    ; 5CB8   0001
        MVI@    R4,     R1                      ; 5CB9   02A1
        MVO@    R0,     R5                      ; 5CBA   0268
        SWAP    R0,     1                       ; 5CBB   0040
        MVO@    R0,     R5                      ; 5CBC   0268
        EIS                                     ; 5CBD   0002
L_5CBE:
        DECR    R7                              ; 5CBE   0017

        SUBI    #$0008, R6                      ; 5CBF   033E 0008
        MVO     R1,     .ISRVEC.0               ; 5CC1   0241 0100
        SWAP    R1,     1                       ; 5CC3   0041
        MVO     R1,     .ISRVEC.1               ; 5CC4   0241 0101
        PULR    R7                              ; 5CC6   02B7

        PSHR    R5                              ; 5CC7   0275
        MVI     G_0359, R0                      ; 5CC8   0280 0359

        JSR     R5,     X_UNPK_BYTES            ; 5CCA   0004 0114 0357

        MVII    #$0050, R0                      ; 5CCD   02B8 0050

        JSR     R5,     X_RAND2                 ; 5CCF   0004 0114 029E

        MVO     R0,     G_035B                  ; 5CD2   0240 035B
        ANDI    #$000F, R0                      ; 5CD4   03B8 000F
        MOVR    R0,     R3                      ; 5CD6   0083
        ANDI    #$0001, R3                      ; 5CD7   03BB 0001
        BEQ     L_5CDC                          ; 5CD9   0204 0001

        NEGR    R0                              ; 5CDB   0020

L_5CDC:
        JSR     R5,     X_PACK_BYTES            ; 5CDC   0004 0114 034F

        MVO     R0,     G_0359                  ; 5CDF   0240 0359
        PULR    R7                              ; 5CE1   02B7

L_5CE2:
        INCR    R2                              ; 5CE2   000A
        MVI@    R2,     R0                      ; 5CE3   0290

        JSR     R5,     X_EXT_SIGN_LO           ; 5CE4   0004 0114 0268

        PULR    R3                              ; 5CE7   02B3
        PSHR    R3                              ; 5CE8   0273
        MOVR    R3,     R1                      ; 5CE9   0099
        ADDI    #$016F, R1                      ; 5CEA   02F9 016F
        MVI@    R1,     R1                      ; 5CEC   0289
        TSTR    R1                              ; 5CED   0089
        BNEQ    L_5DA4                          ; 5CEE   020C 00B4

        MOVR    R3,     R1                      ; 5CF0   0099
        ADDI    #$0165, R1                      ; 5CF1   02F9 0165
        MVI@    R1,     R4                      ; 5CF3   028C
        ADDR    R0,     R4                      ; 5CF4   00C4
        ANDI    #$000F, R4                      ; 5CF5   03BC 000F
        SUBI    #$0003, R2                      ; 5CF7   033A 0003
        MVI@    R2,     R5                      ; 5CF9   0295
        ADDR    R0,     R5                      ; 5CFA   00C5
        ANDI    #$000F, R5                      ; 5CFB   03BD 000F
        CMPR    R4,     R5                      ; 5CFD   0165
        BNEQ    L_5D01                          ; 5CFE   020C 0001

        MVO@    R4,     R2                      ; 5D00   0254
L_5D01:
        MOVR    R4,     R0                      ; 5D01   00A0
        MOVR    R3,     R2                      ; 5D02   009A
        SLL     R2,     2                       ; 5D03   004E
        SLL     R2,     2                       ; 5D04   004E
        SDBD                                    ; 5D05   0001
        ADDI    #$5D0E, R2                      ; 5D06   02FA 000E 005D

        JSR     R5,     L_55C4                  ; 5D09   0004 0154 01C4

        B       L_5DA4                          ; 5D0C   0200 0096

        DECLE   $0020,  $0021,  $0022,  $0023   ; 5D0E   0020 0021 0022 0023
        DECLE   $0024,  $0025,  $0026,  $0027   ; 5D12   0024 0025 0026 0027

        SUB@    R4,     R0                      ; 5D16   0320
        SUB@    R4,     R1                      ; 5D17   0321
        SUB@    R4,     R2                      ; 5D18   0322
        SUB@    R4,     R3                      ; 5D19   0323
        SUB@    R4,     R4                      ; 5D1A   0324
        SUB@    R4,     R5                      ; 5D1B   0325
        SUB@    R4,     R6                      ; 5D1C   0326
        SUB@    R4,     R7                      ; 5D1D   0327

        DECLE   $0220,  $0127,  $0126,  $0125   ; 5D1E   0220 0127 0126 0125
        DECLE   $0124,  $0123,  $0122,  $0121   ; 5D22   0124 0123 0122 0121
        DECLE   $0120,  $0227,  $0226,  $0225   ; 5D26   0120 0227 0226 0225
        DECLE   $0224,  $0223                   ; 5D2A   0224 0223

        BOV     L_5B0C                          ; 5D2C   0222 0221

L_5D2E:
        PSHR    R5                              ; 5D2E   0275
        CLRR    R0                              ; 5D2F   01C0
L_5D30:
        PSHR    R0                              ; 5D30   0270
        MOVR    R0,     R2                      ; 5D31   0082
        ADDI    #$016F, R2                      ; 5D32   02FA 016F
        MVI@    R2,     R1                      ; 5D34   0291
        TSTR    R1                              ; 5D35   0089
        BNEQ    L_5DA4                          ; 5D36   020C 006C

        JSR     R5,     .EXEC.772               ; 5D38   0004 0114 0372

        PSHR    R1                              ; 5D3B   0271
        CMPI    #$009C, R2                      ; 5D3C   037A 009C
        BPL     L_5DCE                          ; 5D3E   0203 008E

        CMPI    #$000E, R2                      ; 5D40   037A 000E
        BMI     L_5DD2                          ; 5D42   020B 008E

L_5D44:
        MOVR    R0,     R2                      ; 5D44   0082
        SLL     R2,     2                       ; 5D45   004E
        ADDI    #$018A, R2                      ; 5D46   02FA 018A
        MVI@    R2,     R1                      ; 5D48   0291
        INCR    R2                              ; 5D49   000A
        MVI@    R2,     R4                      ; 5D4A   0294
        CMPI    #$0010, R3                      ; 5D4B   037B 0010
        BLE     L_5DDA                          ; 5D4D   0206 008B

        MOVR    R1,     R0                      ; 5D4F   0088
        ANDI    #$0007, R0                      ; 5D50   03B8 0007
        BEQ     L_5DF2                          ; 5D52   0204 009E

        CMPI    #$0005, R0                      ; 5D54   0378 0005
        BMI     L_5D5B                          ; 5D56   020B 0003

        NEGR    R0                              ; 5D58   0020
        ADDI    #$0008, R0                      ; 5D59   02F8 0008
L_5D5B:
        CMPI    #$0008, R1                      ; 5D5B   0379 0008
        BPL     L_5D60                          ; 5D5D   0203 0001

        NEGR    R0                              ; 5D5F   0020
L_5D60:
        ADDR    R4,     R0                      ; 5D60   00E0
        CMPI    #$0030, R0                      ; 5D61   0378 0030
        BMI     L_5DDA                          ; 5D63   020B 0075

        CMPI    #$00F8, R0                      ; 5D65   0378 00F8
        BLE     L_5D6B                          ; 5D67   0206 0002

        MVII    #$00F8, R0                      ; 5D69   02B8 00F8
L_5D6B:
        MVO@    R0,     R2                      ; 5D6B   0250
        SLR     R0,     2                       ; 5D6C   0064
        SLR     R0,     1                       ; 5D6D   0060

        JSR     R5,     .EXEC.629               ; 5D6E   0004 0114 0229

        PULR    R1                              ; 5D71   02B1
        ADDI    #$0004, R1                      ; 5D72   02F9 0004
        MVO@    R0,     R1                      ; 5D74   0248
        INCR    R2                              ; 5D75   000A
        MVI@    R2,     R0                      ; 5D76   0290
        DECR    R0                              ; 5D77   0010
        MVO@    R0,     R2                      ; 5D78   0250
        BEQ     L_5CE2                          ; 5D79   0224 0098
        BPL     L_5DA4                          ; 5D7B   0203 0027

        PULR    R3                              ; 5D7D   02B3
        PSHR    R3                              ; 5D7E   0273
        ADDI    #$011F, R3                      ; 5D7F   02FB 011F
        MVI@    R3,     R0                      ; 5D81   0298
        MOVR    R0,     R3                      ; 5D82   0083
        CLRR    R1                              ; 5D83   01C9
        ANDI    #$00C0, R0                      ; 5D84   03B8 00C0
        BEQ     L_5D8B                          ; 5D86   0204 0003

        MVO@    R1,     R2                      ; 5D88   0251
        B       L_5D9D                          ; 5D89   0200 0012

L_5D8B:
        INCR    R1                              ; 5D8B   0009
        MOVR    R3,     R0                      ; 5D8C   0098
        ANDI    #$0008, R0                      ; 5D8D   03B8 0008
        BEQ     L_5D92                          ; 5D8F   0204 0001

        NEGR    R1                              ; 5D91   0021
L_5D92:
        MVII    #$0001, R0                      ; 5D92   02B8 0001
        ADDI    #$0002, R3                      ; 5D94   02FB 0002
        ANDI    #$0004, R3                      ; 5D96   03BB 0004
        BNEQ    L_5D9C                          ; 5D98   020C 0002

        ADDI    #$0002, R0                      ; 5D9A   02F8 0002
L_5D9C:
        MVO@    R0,     R2                      ; 5D9C   0250
L_5D9D:
        INCR    R2                              ; 5D9D   000A
        CMPI    #$018D, R2                      ; 5D9E   037A 018D
        BEQ     L_5DA3                          ; 5DA0   0204 0001

        NEGR    R1                              ; 5DA2   0021
L_5DA3:
        MVO@    R1,     R2                      ; 5DA3   0251
L_5DA4:
        PULR    R0                              ; 5DA4   02B0
        INCR    R0                              ; 5DA5   0008
        CMPI    #$0002, R0                      ; 5DA6   0378 0002
        BNEQ    L_5D30                          ; 5DA8   022C 0079

        JSR     R5,     L_5FD1                  ; 5DAA   0004 015C 03D1

        MVI     G_0194, R0                      ; 5DAD   0280 0194
        TSTR    R0                              ; 5DAF   0080
        BNEQ    L_5DCD                          ; 5DB0   020C 001B

        MVII    #$0190, R0                      ; 5DB2   02B8 0190

        JSR     R5,     X_RAND2                 ; 5DB4   0004 0114 029E

        TSTR    R0                              ; 5DB7   0080
        BNEQ    L_5DCD                          ; 5DB8   020C 0013

        MVII    #$0007, R0                      ; 5DBA   02B8 0007

        JSR     R5,     .EXEC.6D5               ; 5DBC   0004 0114 02D5

        MVO     R0,     G_0194                  ; 5DBF   0240 0194
        MVII    #$0355, R1                      ; 5DC1   02B9 0355
        MVI@    R1,     R0                      ; 5DC3   0288
        SDBD                                    ; 5DC4   0001
        XORI    #$4000, R0                      ; 5DC5   03F8 0000 0040
        MVO@    R0,     R1                      ; 5DC8   0248
        MVII    #$0005, R0                      ; 5DC9   02B8 0005
        MVO     R0,     G_035B                  ; 5DCB   0240 035B
L_5DCD:
        PULR    R7                              ; 5DCD   02B7

L_5DCE:
        MVII    #$000F, R2                      ; 5DCE   02BA 000F
        B       L_5DD4                          ; 5DD0   0200 0002

L_5DD2:
        MVII    #$009B, R2                      ; 5DD2   02BA 009B
L_5DD4:
        SWAP    R2,     1                       ; 5DD4   0042
        ADDI    #$0002, R1                      ; 5DD5   02F9 0002
        MVO@    R2,     R1                      ; 5DD7   024A
        B       L_5D44                          ; 5DD8   0220 0095

L_5DDA:
        MVII    #$0030, R0                      ; 5DDA   02B8 0030
        CMPI    #$0009, R1                      ; 5DDC   0379 0009
        BPL     L_5D6B                          ; 5DDE   0223 0074

        NEGR    R1                              ; 5DE0   0021
        ADDI    #$0010, R1                      ; 5DE1   02F9 0010
        BNEQ    L_5DE7                          ; 5DE3   020C 0002

        MVII    #$000F, R1                      ; 5DE5   02B9 000F
L_5DE7:
        CMPI    #$0008, R1                      ; 5DE7   0379 0008
        BNEQ    L_5DED                          ; 5DE9   020C 0002

        MVII    #$0009, R1                      ; 5DEB   02B9 0009
L_5DED:
        DECR    R2                              ; 5DED   0012
        MVO@    R1,     R2                      ; 5DEE   0251
        INCR    R2                              ; 5DEF   000A
        B       L_5D6B                          ; 5DF0   0220 0086

L_5DF2:
        MOVR    R4,     R0                      ; 5DF2   00A0
        CMPI    #$0088, R0                      ; 5DF3   0378 0088
        BEQ     L_5D6B                          ; 5DF5   0224 008B
        BPL     L_5DFB                          ; 5DF7   0203 0002

        INCR    R0                              ; 5DF9   0008
        INCR    R7                              ; 5DFA   000F

L_5DFB:
        DECR    R0                              ; 5DFB   0010
L_5DFC:
        B       L_5D6B                          ; 5DFC   0220 0092

        PSHR    R5                              ; 5DFE   0275

        JSR     R5,     .EXEC.777               ; 5DFF   0004 0114 0377

        CMPI    #$0060, R3                      ; 5E02   037B 0060
        BPL     L_5E07                          ; 5E04   0203 0001
        PULR    R7                              ; 5E06   02B7

L_5E07:
        JSR     R5,     L_5E2A                  ; 5E07   0004 015C 022A

        J       L_5705                          ; 5E0A   0004 0354 0305

        PSHR    R5                              ; 5E0D   0275
        ADDI    #$0167, R0                      ; 5E0E   02F8 0167
        MOVR    R0,     R2                      ; 5E10   0082

        JSR     R5,     .EXEC.7AE               ; 5E11   0004 0114 03AE

        MVO@    R0,     R2                      ; 5E14   0250
        PULR    R7                              ; 5E15   02B7

        PSHR    R5                              ; 5E16   0275
        MOVR    R0,     R2                      ; 5E17   0082
        ANDI    #$0001, R2                      ; 5E18   03BA 0001
        CMPR    R2,     R3                      ; 5E1A   0153
        BEQ     L_5E81                          ; 5E1B   0204 0064

        MOVR    R3,     R2                      ; 5E1D   009A
        ADDI    #$016F, R2                      ; 5E1E   02FA 016F
        MVI@    R2,     R2                      ; 5E20   0292
        TSTR    R2                              ; 5E21   0092
        BNEQ    L_5E81                          ; 5E22   020C 005D

        JSR     R5,     L_5E2A                  ; 5E24   0004 015C 022A

        J       L_56F3                          ; 5E27   0004 0354 02F3

L_5E2A:
        PSHR    R5                              ; 5E2A   0275
        PSHR    R1                              ; 5E2B   0271
        PSHR    R0                              ; 5E2C   0270
        SDBD                                    ; 5E2D   0001
        MVII    #$502C, R1                      ; 5E2E   02B9 002C 0050

        JSR     R5,     X_TIMER_STOP            ; 5E31   0004 0118 0038

        PULR    R0                              ; 5E34   02B0
        PULR    R1                              ; 5E35   02B1
        PULR    R7                              ; 5E36   02B7

        PSHR    R5                              ; 5E37   0275
        B       L_5E07                          ; 5E38   0220 0032

        PSHR    R5                              ; 5E3A   0275
        MOVR    R0,     R2                      ; 5E3B   0082
        MVII    #$0194, R4                      ; 5E3C   02BC 0194
        MVI@    R4,     R0                      ; 5E3E   02A0
        TSTR    R0                              ; 5E3F   0080
        BEQ     L_5E6F                          ; 5E40   0204 002D

        MVI@    R4,     R0                      ; 5E42   02A0
        TSTR    R0                              ; 5E43   0080
        BNEQ    L_5E6F                          ; 5E44   020C 0029

        JSR     R5,     .EXEC.7AE               ; 5E46   0004 0114 03AE

        ANDI    #$0001, R2                      ; 5E49   03BA 0001
        ADDI    #$0161, R2                      ; 5E4B   02FA 0161
        MVI@    R2,     R0                      ; 5E4D   0290
        INCR    R0                              ; 5E4E   0008
        MVO@    R0,     R2                      ; 5E4F   0250
        MVO     R0,     G_0195                  ; 5E50   0240 0195
        SDBD                                    ; 5E52   0001
        MVII    #$9092, R0                      ; 5E53   02B8 0092 0090
        MVO     R0,     G_0355                  ; 5E56   0240 0355
        SDBD                                    ; 5E58   0001
        MVII    #$5EFF, R0                      ; 5E59   02B8 00FF 005E
        MVO     R0,     G_0356                  ; 5E5C   0240 0356
        MVII    #$0023, R0                      ; 5E5E   02B8 0023
        MVO     R0,     G_035B                  ; 5E60   0240 035B
        MVII    #$01F0, R0                      ; 5E62   02B8 01F0
        MVO     R0,     G_035A                  ; 5E64   0240 035A

        JSR     R5,     L_5198                  ; 5E66   0004 0150 0198
        JSR     R5,     L_5E2A                  ; 5E69   0004 015C 022A
        JSR     R5,     L_5FC2                  ; 5E6C   0004 015C 03C2

L_5E6F:
        PULR    R7                              ; 5E6F   02B7

        PSHR    R5                              ; 5E70   0275
        MOVR    R1,     R2                      ; 5E71   008A
        ADDI    #$016F, R2                      ; 5E72   02FA 016F
        MVI@    R2,     R2                      ; 5E74   0292
        TSTR    R2                              ; 5E75   0092
        BNEQ    L_5E81                          ; 5E76   020C 0009

        JSR     R5,     L_5607                  ; 5E78   0004 0154 0207

        INCR    R1                              ; 5E7B   0009
        SDBD                                    ; 5E7C   0001
        MVII    #$5EE9, R0                      ; 5E7D   02B8 00E9 005E
        MVO@    R0,     R1                      ; 5E80   0248
L_5E81:
        PULR    R7                              ; 5E81   02B7

L_5E82:
        PSHR    R5                              ; 5E82   0275
        MVII    #$0200, R3                      ; 5E83   02BB 0200
        MVII    #$0213, R1                      ; 5E85   02B9 0213
        MVII    #$0014, R4                      ; 5E87   02BC 0014
        MVII    #$000C, R0                      ; 5E89   02B8 000C
        TSTR    R2                              ; 5E8B   0092
        BNEQ    L_5E91                          ; 5E8C   020C 0003

        MOVR    R1,     R2                      ; 5E8E   008A
        MOVR    R3,     R1                      ; 5E8F   0099
        MOVR    R2,     R3                      ; 5E90   0093
L_5E91:
        MVI@    R1,     R2                      ; 5E91   028A
        MVO@    R2,     R3                      ; 5E92   025A
        ADDR    R4,     R1                      ; 5E93   00E1
        ADDR    R4,     R3                      ; 5E94   00E3
        DECR    R0                              ; 5E95   0010
        BNEQ    L_5E91                          ; 5E96   022C 0006
        PULR    R7                              ; 5E98   02B7

        DECLE   $0062,  $0018,  $00E0,  $005E   ; 5E99   0062 0018 00E0 005E
        DECLE   $0000,  $0016,  $0000,  $005D   ; 5E9D   0000 0016 0000 005D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EA5   0000 0000 0000 0000
        DECLE   $0065,  $001A,  $00E0,  $005E   ; 5EA9   0065 001A 00E0 005E
        DECLE   $0000,  $0099,  $0000,  $005D   ; 5EAD   0000 0099 0000 005D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0000   ; 5EB5   0000 0000 0008 0000
        DECLE   $00C0,  $0018,  $00F8,  $005E   ; 5EB9   00C0 0018 00F8 005E
        DECLE   $0000,  $005A,  $0000,  $0058   ; 5EBD   0000 005A 0000 0058
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EC5   0000 0000 0000 0000
        DECLE   $00B2,  $0018,  $00D9,  $005E   ; 5EC9   00B2 0018 00D9 005E
        DECLE   $0000,  $005A,  $0000,  $0050   ; 5ECD   0000 005A 0000 0050
        DECLE   $00F7,  $0000,  $0000,  $0000   ; 5ED1   00F7 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ED5   0000 0000 0000 0000

        GSWD    R0                              ; 5ED9   0030
        SLLC    R0,     2                       ; 5EDA   005C
        ADDR    R0,     R7                      ; 5EDB   00C7

        DECLE   $005C,  $0001,  $0026,  $0000   ; 5EDC   005C 0001 0026 0000
        DECLE   $00FE,  $005D,  $0000,  $0000   ; 5EE0   00FE 005D 0000 0000

        SETC                                    ; 5EE4   0007
        DECR    R0                              ; 5EE5   0010
        EIS                                     ; 5EE6   0002
        SUB@    R6,     R7                      ; 5EE7   0337

        DECLE   $005E,  $020D,  $005E,  $000D   ; 5EE8   005E 020D 005E 000D
        DECLE   $005E,  $0001,  $0000,  $0008   ; 5EEC   005E 0001 0000 0008
        DECLE   $0016,  $005E,  $0016,  $015E   ; 5EF0   0016 005E 0016 015E
        DECLE   $030D,  $005E,  $033A,  $015E   ; 5EF4   030D 005E 033A 015E
        DECLE   $0300,  $0000,  $0000,  $0000   ; 5EF8   0300 0000 0000 0000
        DECLE   $0001,  $0024,  $0000,  $0300   ; 5EFC   0001 0024 0000 0300
        DECLE   $0000,  $0030,  $005C,  $0005   ; 5F00   0000 0030 005C 0005
        DECLE   $000B,  $0000                   ; 5F04   000B 0000
L_5F06:
        PSHR    R5                              ; 5F06   0275
        MVII    #$0196, R4                      ; 5F07   02BC 0196
        MVI@    R4,     R0                      ; 5F09   02A0
        SWAP    R0,     1                       ; 5F0A   0040
        SAR     R0,     2                       ; 5F0B   006C
        SAR     R0,     2                       ; 5F0C   006C
        SAR     R0,     1                       ; 5F0D   0068
        MOVR    R4,     R3                      ; 5F0E   00A3
        SDBD                                    ; 5F0F   0001
        ADD@    R4,     R0                      ; 5F10   02E0
        MVO@    R0,     R3                      ; 5F11   0258
        SWAP    R0,     1                       ; 5F12   0040
        MOVR    R0,     R2                      ; 5F13   0082
        INCR    R3                              ; 5F14   000B
        SUB@    R3,     R0                      ; 5F15   0318
        MOVR    R2,     R1                      ; 5F16   0091
        ANDI    #$0007, R1                      ; 5F17   03B9 0007
        MVO@    R1,     R3                      ; 5F19   0259
        XORR    R1,     R2                      ; 5F1A   01CA
        MVII    #$019C, R5                      ; 5F1B   02BD 019C
        MVO@    R2,     R5                      ; 5F1D   026A
        SUBR    R0,     R2                      ; 5F1E   0102
        INCR    R5                              ; 5F1F   000D
        MVO@    R2,     R5                      ; 5F20   026A
        MVII    #$0003, R3                      ; 5F21   02BB 0003
        MVO@    R3,     R5                      ; 5F23   026B
        MVII    #$0100, R5                      ; 5F24   02BD 0100
        MVI@    R5,     R0                      ; 5F26   02A8
        MVO@    R0,     R4                      ; 5F27   0260
        MVI@    R5,     R0                      ; 5F28   02A8
        MVO@    R0,     R4                      ; 5F29   0260
        MVII    #$003E, R0                      ; 5F2A   02B8 003E
        MVII    #$005F, R1                      ; 5F2C   02B9 005F
        MVO     R0,     .ISRVEC.0               ; 5F2E   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5F30   0241 0101
L_5F32:
        EIS                                     ; 5F32   0002
        MVI     G_019F, R2                      ; 5F33   0282 019F
        SARC    R2,     2                       ; 5F35   007E
        BC      L_5F32                          ; 5F36   0221 0005
        BNOV    L_5F3D                          ; 5F38   020A 0003

        JSR     R5,     L_5E82                  ; 5F3A   0004 015C 0282

L_5F3D:
        PULR    R7                              ; 5F3D   02B7

        PSHR    R5                              ; 5F3E   0275
        MVII    #$031D, R2                      ; 5F3F   02BA 031D
        CLRR    R3                              ; 5F41   01DB
L_5F42:
        MVII    #$019D, R5                      ; 5F42   02BD 019D
        MVI@    R2,     R0                      ; 5F44   0290
        SLL     R0,     1                       ; 5F45   0048
        BPL     L_5F4A                          ; 5F46   0203 0002

        MVII    #$019B, R5                      ; 5F48   02BD 019B
L_5F4A:
        ADDI    #$0002, R2                      ; 5F4A   02FA 0002
        MVI@    R2,     R0                      ; 5F4C   0290
        SDBD                                    ; 5F4D   0001
        ADD@    R5,     R0                      ; 5F4E   02E8
        MVO@    R0,     R2                      ; 5F4F   0250
        MVI@    R3,     R0                      ; 5F50   0298
        MOVR    R0,     R1                      ; 5F51   0081
        ANDI    #$00FF, R1                      ; 5F52   03B9 00FF
        XORR    R1,     R0                      ; 5F54   01C8
        DECR    R5                              ; 5F55   0015
        ADD@    R5,     R1                      ; 5F56   02E9
        ANDI    #$00FF, R1                      ; 5F57   03B9 00FF
        XORR    R1,     R0                      ; 5F59   01C8
        MVO@    R0,     R3                      ; 5F5A   0258
        ADDI    #$0006, R2                      ; 5F5B   02FA 0006
        INCR    R3                              ; 5F5D   000B
        CMPI    #$0008, R3                      ; 5F5E   037B 0008
        BNEQ    L_5F42                          ; 5F60   022C 001F

        MVI     G_0198, R0                      ; 5F62   0280 0198
        MVO     R0,     .STIC.HDLY              ; 5F64   0240 0030
        MVO     R0,     .STIC.VIDEN             ; 5F66   0240 0020
        MVI     G_0199, R0                      ; 5F68   0280 0199
        MVI     G_019A, R1                      ; 5F6A   0281 019A
        MVO     R0,     .ISRVEC.0               ; 5F6C   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5F6E   0241 0101
        CLRR    R2                              ; 5F70   01D2
        MVI     G_019C, R0                      ; 5F71   0280 019C
        SWAP    R0,     2                       ; 5F73   0044
        BEQ     L_5FAB                          ; 5F74   0204 0035
        BPL     L_5F90                          ; 5F76   0203 0018

        MVII    #$0200, R4                      ; 5F78   02BC 0200
        MOVR    R4,     R5                      ; 5F7A   00A5
L_5F7B:
        MVI@    R4,     R0                      ; 5F7B   02A0
        SDBD                                    ; 5F7C   0001
        ANDI    #$2000, R0                      ; 5F7D   03B8 0000 0020
        XOR@    R4,     R0                      ; 5F80   03E0
        MVO@    R0,     R5                      ; 5F81   0268
        MVII    #$0012, R3                      ; 5F82   02BB 0012
L_5F84:
        MVI@    R4,     R0                      ; 5F84   02A0
        MVO@    R0,     R5                      ; 5F85   0268
        DECR    R3                              ; 5F86   0013
        BNEQ    L_5F84                          ; 5F87   022C 0004

        INCR    R5                              ; 5F89   000D
        CMPI    #$02E6, R4                      ; 5F8A   037C 02E6
        BLT     L_5F7B                          ; 5F8C   0225 0012
        B       L_5FA9                          ; 5F8E   0200 0019

L_5F90:
        MVII    #$0212, R5                      ; 5F90   02BD 0212
        MVII    #$0003, R1                      ; 5F92   02B9 0003
L_5F94:
        MVII    #$0012, R3                      ; 5F94   02BB 0012
L_5F96:
        MVI@    R5,     R0                      ; 5F96   02A8
        MVO@    R0,     R5                      ; 5F97   0268
        SUBR    R1,     R5                      ; 5F98   010D
        DECR    R3                              ; 5F99   0013
        BNEQ    L_5F96                          ; 5F9A   022C 0005

        MVI@    R5,     R0                      ; 5F9C   02A8
        SDBD                                    ; 5F9D   0001
        ANDI    #$5FFF, R0                      ; 5F9E   03B8 00FF 005F
        MVO@    R0,     R5                      ; 5FA1   0268
        ADDI    #$0024, R5                      ; 5FA2   02FD 0024
        CMPI    #$02F0, R5                      ; 5FA4   037D 02F0
        BLT     L_5F94                          ; 5FA6   0225 0013

        INCR    R2                              ; 5FA8   000A
L_5FA9:
        MVII    #$0002, R0                      ; 5FA9   02B8 0002
L_5FAB:
        SLL     R2,     2                       ; 5FAB   004E
        XORR    R0,     R2                      ; 5FAC   01C2
        MVO     R2,     G_019F                  ; 5FAD   0242 019F

        JSR     R5,     X_PLAY_NOTE             ; 5FAF   0004 0118 02BD

        PULR    R7                              ; 5FB2   02B7

L_5FB3:
        PSHR    R5                              ; 5FB3   0275

        JSR     R5,     X_PLAY_SFX2             ; 5FB4   0004 0118 03BE
        DECLE   $000A                           ; 5FB7  SFX prio
        DECLE   $0379                           ; 5FB8  SFX data
        DECLE   $006C,  $0000                   ; 5FB9  SFX data
        DECLE   $0035                           ; 5FBB  SFX data
        DECLE   $00B7                           ; 5FBC  SFX data
        DECLE   $030D                           ; 5FBD  SFX data
        DECLE   $000B                           ; 5FBE  SFX data
        DECLE   $008F,  $0013                   ; 5FBF  SFX data
        DECLE   $03CF                           ; 5FC1  SFX end

L_5FC2:
        PSHR    R5                              ; 5FC2   0275

L_5FC3:
        JSR     R5,     X_PLAY_SFX2             ; 5FC3   0004 0118 03BE
        DECLE   $000F                           ; 5FC6  SFX prio
        DECLE   $0079                           ; 5FC7  SFX data
        DECLE   $020C,  $0000                   ; 5FC8  SFX data
        DECLE   $0035                           ; 5FCA  SFX data
        DECLE   $03B7                           ; 5FCB  SFX data
        DECLE   $03ED                           ; 5FCC  SFX data
        DECLE   $000B                           ; 5FCD  SFX data
        DECLE   $008F,  $0077                   ; 5FCE  SFX data
        DECLE   $03CF                           ; 5FD0  SFX end

L_5FD1:
        PSHR    R5                              ; 5FD1   0275

        JSR     R5,     X_PLAY_SFX2             ; 5FD2   0004 0118 03BE
        DECLE   $0004                           ; 5FD5  SFX prio
        DECLE   $0369                           ; 5FD6  SFX data
        DECLE   $0077,  $00F3,  $005F           ; 5FD7  SFX data
        DECLE   $030D                           ; 5FDA  SFX data
        DECLE   $0345                           ; 5FDB  SFX data
        DECLE   $03CF                           ; 5FDC  SFX end

L_5FDD:
        PSHR    R5                              ; 5FDD   0275

        JSR     R5,     X_PLAY_SFX2             ; 5FDE   0004 0118 03BE
        DECLE   $0004                           ; 5FE1  SFX prio
        DECLE   $030D                           ; 5FE2  SFX data
        DECLE   $03D2                           ; 5FE3  SFX data
        DECLE   $008F,  $0013                   ; 5FE4  SFX data
        DECLE   $02CF                           ; 5FE6  SFX end

L_5FE7:
        PSHR    R5                              ; 5FE7   0275

        JSR     R5,     X_PLAY_SFX2             ; 5FE8   0004 0118 03BE
        DECLE   $0004                           ; 5FEB  SFX prio
        DECLE   $0040,  $0200                   ; 5FEC  SFX data
        DECLE   $03E9                           ; 5FEE  SFX data
        DECLE   $000C,  $0140                   ; 5FEF  SFX data
        DECLE   $000B                           ; 5FF1  SFX data
        DECLE   $03CF                           ; 5FF2  SFX end

UC_5FF3:
        MVI     G_0163, R0                      ; 5FF3  SLIB UCALL target
        SLL     R0,     2                       ; 5FF5   004C
        SLL     R0,     2                       ; 5FF6   004C
        MVO@    R0,     R3                      ; 5FF7   0258
        ADDI    #$0004, R3                      ; 5FF8   02FB 0004
        SWAP    R0,     1                       ; 5FFA   0040
        MVO@    R0,     R3                      ; 5FFB   0258
        PULR    R7                              ; 5FFC   02B7

        NOP                                     ; 5FFD   0034
        DECLE   $0000,  $0000                   ; 5FFE   0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5051       <entry>
;;  $5094       $509F  
;;  $50AD       $50DF   $5104  
;;  $50C9       $5118  
;;  $50E1       $50C3  
;;  $50EB       $511A  
;;  $5101       $50C7   $50E9   $5107  
;;  $5106       $50BE  
;;  $517A       $5068   $51AF  
;;  $517F       $5188  
;;  $518B       $5065   $50EE  
;;  $5198       $5733   $5E66  
;;  $51AC       $5756   $58FF  
;;  $51ED       $51D4  
;;  $51FC       $557F  
;;  $51FD       $59EF  
;;  $520A       $5206  
;;  $520B       $5209  
;;  $5216       <entry>
;;  $538E       $599E  
;;  $53A5       $539D   $53A1  
;;  $53A6       $5399  
;;  $53AA       $5574  
;;  $53AB       $5413  
;;  $53CC       $55EE  
;;  $53D0       $55F0  
;;  $53D6       $53BC   $53C0   $53CC   $53D0   $53E1   $53E7   $541A  
;;  $53DB       $53C4   $53C8   $53D7  
;;  $53E5       $53DE  
;;  $53E9       $53D4   $53D9   $53E3  
;;  $53F0       $53B8  
;;  $5415       $5405   $5409  
;;  $541C       $5410   $5571  
;;  $5433       $5421   $5425   $5429   $542D  
;;  $544A       $543D   $5441   $5445  
;;  $5453       $544C  
;;  $5457       $5436   $5560  
;;  $5470       $54BC  
;;  $5497       $549B  
;;  $54A8       $54A4  
;;  $54B9       $5745  
;;  $54FF       $5492  
;;  $5504       $550B  
;;  $5509       $550E  
;;  $5510       $5507  
;;  $551D       $5497  
;;  $551E       $552B   $5554  
;;  $5543       $5530   $5535   $553A  
;;  $5545       $554D  
;;  $554C       $5556  
;;  $5550       $554A  
;;  $5583       $556E   $557C  
;;  $558D       <entry>
;;  $5591       $55C1  
;;  $55AE       $55B4  
;;  $55B1       $55A8  
;;  $55B6       $55AC  
;;  $55B7       $55AF  
;;  $55BE       $5597   $559C   $55A5  
;;  $55C4       $55BB   $5D09  
;;  $5606       $556C   $55F4   $55FB   $566C  
;;  $5607       $55FD   $5E78  
;;  $5629       $5619   $5620  
;;  $5655       $5612   $5627   $56FF  
;;  $5657       $5701  
;;  $5658       $5586  
;;  $56C3       $56A3  
;;  $56DF       $56C1  
;;  $56E3       $5676  
;;  $56E5       $5664  
;;  $56F3       $5E27  
;;  $5701       $56F8  
;;  $5705       $5E0A  
;;  $5736       $570A  
;;  $574A       $573F   $5C31  
;;  $574C       $5753  
;;  $5756       $574F  
;;  $57A3       $57BD  
;;  $57DD       $57A3   $57AE   $57B9  
;;  $57E3       $57E5  
;;  $57E8       $5AF8   $5B1B  
;;  $57E9       $57F0   $57F4   $57F8  
;;  $57FC       $580F   $5823  
;;  $580A       $57CF  
;;  $580B       $5973  
;;  $5816       $582A  
;;  $581E       $57D2  
;;  $581F       $5975  
;;  $582C       <entry>
;;  $5833       $5879  
;;  $584E       $584A  
;;  $585D       $5861  
;;  $5874       $5838   $5843   $586B  
;;  $589A       $588C   $5896  
;;  $58B1       $58FC  
;;  $58CC       $58D2  
;;  $58E9       $58C4  
;;  $58F7       $58BA   $5909  
;;  $58FE       $5882   $594B   $597A   $5A74  
;;  $58FF       $58ED   $58F2   $5905  
;;  $5902       $58F5  
;;  $590C       $595A  
;;  $5917       $592A  
;;  $5932       $593F  
;;  $5952       $5958  
;;  $5965       $596B  
;;  $597E       $5997  
;;  $59B4       $59AD  
;;  $59D2       $59B2  
;;  $59E6       $59E2  
;;  $59EE       $59D9   $59E7  
;;  $59F7       $5A55  
;;  $5A34       $5A31  
;;  $5A3A       $59EC   $59F8   $59FF   $5A07   $5A0F   $5A13  
;;  $5A3B       $5A1F   $5A24   $5A29  
;;  $5A57       $5965  
;;  $5A5F       $58CC   $5917   $5952  
;;  $5A98       $5A91  
;;  $5AAB       $5AA1  
;;  $5ABC       $5AF3   $5B4D   $5B65  
;;  $5ACA       $5AC3  
;;  $5ACB       $5A99   $5AA9   $5ADA   $5AE9   $5B44   $5B57  
;;  $5ACC       $5A7B  
;;  $5ADC       $5AD2  
;;  $5AF5       $5AAB   $5B59  
;;  $5B0C       $5D2C  
;;  $5B18       $5AEF   $5B46  
;;  $5B3C       $5A83  
;;  $5B4F       $5A95  
;;  $5B67       $5B3C   $5B4F  
;;  $5B77       $5B6C   $5B73  
;;  $5C11       $5BFA  
;;  $5C12       $5C47   $5C7C  
;;  $5C26       $5C23  
;;  $5C30       $5BCF  
;;  $5C49       $5747  
;;  $5C53       $5C4F  
;;  $5C6D       $5C62  
;;  $5C72       $5C6B  
;;  $5C9B       $5C84   $5C90  
;;  $5C9C       $5BBA   $5BBF  
;;  $5CA2       $5CAD  
;;  $5CA4       $5CA8  
;;  $5CB0       $5052   $547F   $5BAA  
;;  $5CBE       $5CBE  
;;  $5CDC       $5CD9  
;;  $5CE2       $5D79  
;;  $5D01       $5CFE  
;;  $5D2E       <entry>
;;  $5D30       $5DA8  
;;  $5D44       $5DD8  
;;  $5D5B       $5D56  
;;  $5D60       $5D5D  
;;  $5D6B       $5D67   $5DDE   $5DF0   $5DF5   $5DFC  
;;  $5D8B       $5D86  
;;  $5D92       $5D8F  
;;  $5D9C       $5D98  
;;  $5D9D       $5D89  
;;  $5DA3       $5DA0  
;;  $5DA4       $5CEE   $5D0C   $5D36   $5D7B  
;;  $5DCD       $5DB0   $5DB8  
;;  $5DCE       $5D3E  
;;  $5DD2       $5D42  
;;  $5DD4       $5DD0  
;;  $5DDA       $5D4D   $5D63  
;;  $5DE7       $5DE3  
;;  $5DED       $5DE9  
;;  $5DF2       $5D52  
;;  $5DFB       $5DF7  
;;  $5DFC       $5DFA  
;;  $5E07       $5E04   $5E38  
;;  $5E2A       $5E07   $5E24   $5E69  
;;  $5E6F       $5E40   $5E44  
;;  $5E81       $5E1B   $5E22   $5E76  
;;  $5E82       $5F3A  
;;  $5E91       $5E8C   $5E96  
;;  $5F06       <entry>
;;  $5F32       $5F36  
;;  $5F3D       $5F38  
;;  $5F42       $5F60  
;;  $5F4A       $5F46  
;;  $5F7B       $5F8C  
;;  $5F84       $5F87  
;;  $5F90       $5F76  
;;  $5F94       $5FA6  
;;  $5F96       $5F9A  
;;  $5FA9       $5F8E  
;;  $5FAB       $5F74  
;;  $5FB3       $5652  
;;  $5FC2       $5730   $5999   $5E6C  
;;  $5FC3       $5941  
;;  $5FD1       $56DF   $582D   $5DAA  
;;  $5FDD       $56E7  
;;  $5FE7       $5212   $5577  
;;  $5FF3       <entry>
;; ======================================================================== ;;
