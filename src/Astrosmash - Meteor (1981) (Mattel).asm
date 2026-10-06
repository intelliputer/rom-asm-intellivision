
        ORG     $5000
.HEADER:
        BIDECLE $5B95           ; 5000  Ptr: MOB graphic images
        BIDECLE $503C           ; 5002  Ptr: EXEC timer table
        BIDECLE $505B           ; 5004  Ptr: Start of game
        BIDECLE $5B6D           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5050           ; 5008  Ptr: GRAM init sequence
        BIDECLE $501C           ; 500A  Ptr: Date/Title
        DECLE   $0000           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0008,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0008           ; 5013  Border color init

        DECLE   $00F0,  $00E0,  $00D0,  $00C0   ; 5014   00F0 00E0 00D0 00C0
        DECLE   $00B0,  $00A0,  $0090,  $0080   ; 5018   00B0 00A0 0090 0080
.TITLE:
        DECLE   $0051                           ; 501C  Cartridge year
        STRING  "ASTROSMASH!"                   ; 501D  Title string
        DECLE   $0000                           ; 5028  

        DECLE   $004A,  $004F,  $0048,  $004E   ; 5029   004A 004F 0048 004E
        DECLE   $0020,  $0050,  $0041,  $0052   ; 502D   0020 0050 0041 0052
        DECLE   $004B,  $0020,  $0053,  $004F   ; 5031   004B 0020 0053 004F
        DECLE   $0048,  $004C,  $0020,  $0031   ; 5035   0048 004C 0020 0031
        DECLE   $0039,  $0038,  $0031           ; 5039   0039 0038 0031
.TIMER:
        DECLE   $0042,  $005E,  $0001,  $0000; 503C  Timer dispatch/interval
        DECLE   $00D6,  $005F,  $0001,  $0000; 5040  Timer dispatch/interval
        DECLE   $00B5,  $0051,  $0001,  $0000; 5044  Timer dispatch/interval
        DECLE   $009C,  $0055,  $0006,  $0000; 5048  Timer dispatch/interval
        BIDECLE $0000           ; 504C  End of timer table

        DECLE   $0000,  $0000                   ; 504E   0000 0000
.GRAM_INIT_5050:
        DECLE   $000A           ; 5050  # of GRAM cards to init
        DECLE   $0001,  $0080   ; 5051  #00-01:  CART #00-01 ----
        DECLE   $0201,  $0080   ; 5053  #02-03:  CART #00-01 X---
        DECLE   $0301,  $0080   ; 5055  #04-05:  CART #00-01 XY--
        DECLE   $0005,  $0080   ; 5057  #06-07:  CART #02-03 ----
        DECLE   $000A           ; 5059  #08   :  CART #05    ----
        DECLE   $0008           ; 505A  #09   :  CART #04    ----

.START:
        PSHR    R5                              ; 505B   0275
        MVII    #$0001, R0                      ; 505C   02B8 0001
        MVO     R0,     G_017B                  ; 505E   0240 017B
        MVI     .ISRVEC.0,R0                    ; 5060   0280 0100
        MVO     R0,     G_0162                  ; 5062   0240 0162
        MVI     .ISRVEC.1,R0                    ; 5064   0280 0101
        MVO     R0,     G_0163                  ; 5066   0240 0163
        MVII    #$0200, R4                      ; 5068   02BC 0200
        MVII    #$00F0, R0                      ; 506A   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 506C   0004 0114 0338

        SDBD                                    ; 506F   0001
        MVII    #$0094, R0                      ; 5070   02B8 0094 0000
        MVO     R0,     G_017F                  ; 5073   0240 017F
        SDBD                                    ; 5075   0001
        MVII    #$0050, R0                      ; 5076   02B8 0050 0000
        MVO     R0,     G_0180                  ; 5079   0240 0180
        MVII    #$017D, R0                      ; 507B   02B8 017D
        MVO     R0,     G_035D                  ; 507D   0240 035D
        MVII    #$0007, R3                      ; 507F   02BB 0007
        MVII    #$022C, R4                      ; 5081   02BC 022C

        JSR     R5,     X_PRINT_R5              ; 5083   0004 0118 007B
        STRING  "Select Game:"                  ; 5086  
        DECLE   $0000                           ; 5092   0000

        PULR    R7                              ; 5093   02B7

        PSHR    R5                              ; 5094   0275
        CMPI    #$000B, R0                      ; 5095   0378 000B
        BNEQ    L_509D                          ; 5097   020C 0004

        JSR     R5,     L_50BB                  ; 5099   0004 0150 00BB

        PULR    R7                              ; 509C   02B7

L_509D:
        CMPI    #$0003, R0                      ; 509D   0378 0003
        BGT     L_50A2                          ; 509F   020E 0001

        INCR    R0                              ; 50A1   0008
L_50A2:
        ANDI    #$0001, R0                      ; 50A2   03B8 0001
        MVO     R0,     G_015D                  ; 50A4   0240 015D
        MVII    #$0000, R3                      ; 50A6   02BB 0000
        MVII    #$027F, R4                      ; 50A8   02BC 027F

        JSR     R5,     X_PRINT_R5              ; 50AA   0004 0118 007B
        STRING  "Game "                         ; 50AD  
        DECLE   $0000                           ; 50B2   0000

        MVII    #$0011, R0                      ; 50B3   02B8 0011
        ADD     G_015D, R0                      ; 50B5   02C0 015D
        SLL     R0,     2                       ; 50B7   004C
        SLL     R0,     1                       ; 50B8   0048
        MVO@    R0,     R4                      ; 50B9   0260
        PULR    R7                              ; 50BA   02B7

L_50BB:
        PSHR    R5                              ; 50BB   0275
        MVII    #$0200, R4                      ; 50BC   02BC 0200
        MVII    #$00F0, R0                      ; 50BE   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 50C0   0004 0114 0338

        MVII    #$031D, R4                      ; 50C3   02BC 031D
        MVII    #$0040, R0                      ; 50C5   02B8 0040

        JSR     R5,     X_FILL_ZERO             ; 50C7   0004 0114 0338

        MVII    #$031E, R4                      ; 50CA   02BC 031E
        SDBD                                    ; 50CC   0001
        MVII    #$5CED, R0                      ; 50CD   02B8 00ED 005C
        MVO@    R0,     R4                      ; 50D0   0260
        MVII    #$0053, R0                      ; 50D1   02B8 0053
        SWAP    R0,     1                       ; 50D3   0040
        MVO@    R0,     R4                      ; 50D4   0260
        MVII    #$0056, R0                      ; 50D5   02B8 0056
        SWAP    R0,     1                       ; 50D7   0040
        MVO@    R0,     R4                      ; 50D8   0260
        SDBD                                    ; 50D9   0001
        MVII    #$5D0F, R0                      ; 50DA   02B8 000F 005D
        MVO     R0,     G_0326                  ; 50DD   0240 0326
        MVO     R0,     G_032E                  ; 50DF   0240 032E
        MVII    #$000E, R0                      ; 50E1   02B8 000E
        MVO     R0,     G_0115                  ; 50E3   0240 0115
        SDBD                                    ; 50E5   0001
        MVII    #$5048, R1                      ; 50E6   02B9 0048 0050

        JSR     R5,     X_TIMER_STOP            ; 50E9   0004 0118 0038

        CLRR    R0                              ; 50EC   01C0
        MVO     R0,     G_017B                  ; 50ED   0240 017B
        MVII    #$00DC, R0                      ; 50EF   02B8 00DC
        MVO     R0,     G_0161                  ; 50F1   0240 0161
        MVO     R0,     G_0167                  ; 50F3   0240 0167
        CLRR    R0                              ; 50F5   01C0

        JSR     R5,     L_5924                  ; 50F6   0004 0158 0124

        MVI     G_015D, R0                      ; 50F9   0280 015D
        TSTR    R0                              ; 50FB   0080
        BEQ     L_513E                          ; 50FC   0204 0040

        MVO     R0,     G_016A                  ; 50FE   0240 016A
        MVII    #$00C8, R0                      ; 5100   02B8 00C8
        MVO     R0,     G_0161                  ; 5102   0240 0161
        MVII    #$0001, R0                      ; 5104   02B8 0001
        MVO     R0,     G_018F                  ; 5106   0240 018F
        SDBD                                    ; 5108   0001
        MVII    #$5CFE, R0                      ; 5109   02B8 00FE 005C
        MVO     R0,     G_031E                  ; 510C   0240 031E
        MVII    #$0033, R0                      ; 510E   02B8 0033
        SWAP    R0,     1                       ; 5110   0040
        MVO     R0,     G_0320                  ; 5111   0240 0320
        MVII    #$0004, R0                      ; 5113   02B8 0004

        JSR     R5,     L_54B9                  ; 5115   0004 0154 00B9

        SDBD                                    ; 5118   0001
        MVII    #$5D20, R0                      ; 5119   02B8 0020 005D
        MVO     R0,     G_0326                  ; 511C   0240 0326
        MVO     R0,     G_032E                  ; 511E   0240 032E
        MVII    #$00F0, R0                      ; 5120   02B8 00F0
        MVII    #$0001, R1                      ; 5122   02B9 0001
        MVII    #$0004, R2                      ; 5124   02BA 0004
        MVII    #$0200, R4                      ; 5126   02BC 0200

        JSR     R5,     L_570F                  ; 5128   0004 0154 030F

        MVII    #$00EC, R0                      ; 512B   02B8 00EC
        MVO     R0,     G_017F                  ; 512D   0240 017F
        MVII    #$0055, R0                      ; 512F   02B8 0055
        MVO     R0,     G_0180                  ; 5131   0240 0180
        MVII    #$000A, R0                      ; 5133   02B8 000A

        JSR     R5,     L_55EC                  ; 5135   0004 0154 01EC

        SDBD                                    ; 5138   0001
        MVII    #$184F, R0                      ; 5139   02B8 004F 0018
        B       L_518A                          ; 513C   0200 004C

L_513E:
        SDBD                                    ; 513E   0001
        MVII    #$518D, R0                      ; 513F   02B8 008D 0051
        MVO     R0,     G_035D                  ; 5142   0240 035D

        JSR     R5,     L_5DB9                  ; 5144   0004 015C 01B9

        MVII    #$00A0, R0                      ; 5147   02B8 00A0
        MVII    #$0001, R1                      ; 5149   02B9 0001
        MVII    #$0004, R2                      ; 514B   02BA 0004
        MVII    #$0200, R4                      ; 514D   02BC 0200

        JSR     R5,     L_570F                  ; 514F   0004 0154 030F

        SDBD                                    ; 5152   0001
        MVII    #$51A1, R4                      ; 5153   02BC 00A1 0051
        MVII    #$02B4, R5                      ; 5156   02BD 02B4
L_5158:
        MVI@    R4,     R0                      ; 5158   02A0
        SLL     R0,     2                       ; 5159   004C
        SLL     R0,     1                       ; 515A   0048
        XORI    #$0005, R0                      ; 515B   03F8 0005
        MVO@    R0,     R5                      ; 515D   0268
        CMPI    #$02C8, R5                      ; 515E   037D 02C8
        BLT     L_5158                          ; 5160   0225 0009

        SDBD                                    ; 5162   0001
        MVII    #$053D, R0                      ; 5163   02B8 003D 0005
        MVO     R0,     .BTAB.A7                ; 5166   0240 02A7
        MVII    #$02C8, R4                      ; 5168   02BC 02C8
        MVII    #$0014, R0                      ; 516A   02B8 0014
        SDBD                                    ; 516C   0001
        MVII    #$065D, R1                      ; 516D   02B9 005D 0006

        JSR     R5,     X_FILL_MEM              ; 5170   0004 0114 0341

        MVII    #$0058, R0                      ; 5173   02B8 0058
        MVO     R0,     G_0118                  ; 5175   0240 0118
        CLRR    R0                              ; 5177   01C0
        MVO     R0,     G_0119                  ; 5178   0240 0119
        SDBD                                    ; 517A   0001
        MVII    #$503C, R1                      ; 517B   02B9 003C 0050

        JSR     R5,     X_TIMER_STOP            ; 517E   0004 0118 0038

        ADDI    #$0004, R1                      ; 5181   02F9 0004

        JSR     R5,     X_TIMER_STOP            ; 5183   0004 0118 0038

        SDBD                                    ; 5186   0001
        MVII    #$188F, R0                      ; 5187   02B8 008F 0018
L_518A:
        MVO     R0,     G_031D                  ; 518A   0240 031D
        PULR    R7                              ; 518C   02B7

        SARC    R2,     1                       ; 518D   007A
        RLC     R1,     2                       ; 518E   0055
        ADDR    R5,     R4                      ; 518F   00EC
        RLC     R1,     2                       ; 5190   0055
        MOVR    R6,     R1                      ; 5191   00B1
        RLC     R1,     2                       ; 5192   0055
        MOVR    R6,     R1                      ; 5193   00B1
        RLC     R1,     2                       ; 5194   0055
        MOVR    R6,     R1                      ; 5195   00B1
        RLC     R1,     2                       ; 5196   0055
        MOVR    R7,     R1                      ; 5197   00B9
        RLC     R0,     2                       ; 5198   0054
        ADDR    R5,     R4                      ; 5199   00EC
        RLC     R1,     2                       ; 519A   0055
        SLL     R1,     2                       ; 519B   004D
        RLC     R1,     2                       ; 519C   0055
        ADDR    R5,     R3                      ; 519D   00EB
        RLC     R0,     2                       ; 519E   0054
        ADDR    R5,     R3                      ; 519F   00EB
        RLC     R0,     2                       ; 51A0   0054
        MOVR    R6,     R4                      ; 51A1   00B4
        MOVR    R6,     R5                      ; 51A2   00B5
        MOVR    R5,     R6                      ; 51A3   00AE
        MOVR    R5,     R7                      ; 51A4   00AF

        DECLE   $00B0,  $00B1,  $00B2,  $0000   ; 51A5   00B0 00B1 00B2 0000

        MOVR    R6,     R3                      ; 51A9   00B3
        MOVR    R6,     R1                      ; 51AA   00B1
        MOVR    R6,     R0                      ; 51AB   00B0
        MOVR    R6,     R5                      ; 51AC   00B5
        MOVR    R5,     R6                      ; 51AD   00AE
        MOVR    R5,     R7                      ; 51AE   00AF

        MOVR    R5,     R6                      ; 51AF   00AE
        MOVR    R6,     R0                      ; 51B0   00B0
        MOVR    R6,     R1                      ; 51B1   00B1
        MOVR    R5,     R7                      ; 51B2   00AF

        MOVR    R5,     R6                      ; 51B3   00AE
        MOVR    R5,     R7                      ; 51B4   00AF

L_51B5:
        PSHR    R5                              ; 51B5   0275
        MVI     G_017B, R0                      ; 51B6   0280 017B
        TSTR    R0                              ; 51B8   0080
        BNEQ    L_51CA                          ; 51B9   020C 000F

        JSR     R5,     .EXEC.4F1               ; 51BB   0004 0114 00F1
        JSR     R5,     L_53C3                  ; 51BE   0004 0150 03C3
        JSR     R5,     L_5317                  ; 51C1   0004 0150 0317
        JSR     R5,     L_51CB                  ; 51C4   0004 0150 01CB
        JSR     R5,     L_5DDA                  ; 51C7   0004 015C 01DA

L_51CA:
        PULR    R7                              ; 51CA   02B7

L_51CB:
        PSHR    R5                              ; 51CB   0275
        MVI     G_0175, R0                      ; 51CC   0280 0175
        TSTR    R0                              ; 51CE   0080
        BNEQ    L_52BE                          ; 51CF   020C 00ED

        MVI     G_0167, R1                      ; 51D1   0281 0167
        SDBD                                    ; 51D3   0001
        ADDI    #$5AE4, R1                      ; 51D4   02F9 00E4 005A
        MVI@    R1,     R0                      ; 51D7   0288

        JSR     R5,     X_RAND2                 ; 51D8   0004 0114 029E

        TSTR    R0                              ; 51DB   0080
        BNEQ    L_52BE                          ; 51DC   020C 00E0

        JSR     R5,     L_56D9                  ; 51DE   0004 0154 02D9

        TSTR    R1                              ; 51E1   0089
        BEQ     L_52BE                          ; 51E2   0204 00DA

        MOVR    R1,     R4                      ; 51E4   008C
        CLRR    R3                              ; 51E5   01DB
        SDBD                                    ; 51E6   0001
        MVII    #$5D38, R1                      ; 51E7   02B9 0038 005D
        MVI     G_015D, R0                      ; 51EA   0280 015D
        TSTR    R0                              ; 51EC   0080
        BNEQ    L_5213                          ; 51ED   020C 0024

        SDBD                                    ; 51EF   0001
        MVII    #$5D31, R1                      ; 51F0   02B9 0031 005D
        MVI     G_0167, R2                      ; 51F3   0282 0167
        SDBD                                    ; 51F5   0001
        ADDI    #$5AF8, R2                      ; 51F6   02FA 00F8 005A
        MVI@    R2,     R0                      ; 51F9   0290

        JSR     R5,     X_RAND2                 ; 51FA   0004 0114 029E

        TSTR    R0                              ; 51FD   0080
        BNEQ    L_5213                          ; 51FE   020C 0013

        MOVR    R4,     R1                      ; 5200   00A1

        JSR     R5,     .EXEC.766               ; 5201   0004 0114 0366

        INCR    R3                              ; 5204   000B

        JSR     R5,     X_POW2                  ; 5205   0004 0114 0345

        PSHR    R0                              ; 5208   0270
        COMR    R0                              ; 5209   0018
        AND     G_016F, R0                      ; 520A   0380 016F
        XOR@    R6,     R0                      ; 520C   03F0
        MVO     R0,     G_016F                  ; 520D   0240 016F
        SDBD                                    ; 520F   0001
        MVII    #$5D3F, R1                      ; 5210   02B9 003F 005D
L_5213:
        INCR    R4                              ; 5213   000C
        MVO@    R1,     R4                      ; 5214   0261
        MVII    #$0088, R0                      ; 5215   02B8 0088

        JSR     R5,     X_RAND2                 ; 5217   0004 0114 029E

        ADDI    #$0010, R0                      ; 521A   02F8 0010
        SWAP    R0,     1                       ; 521C   0040
        MVO@    R0,     R4                      ; 521D   0260
        CLRR    R2                              ; 521E   01D2
        MVO@    R2,     R4                      ; 521F   0262
        MVI     G_0167, R1                      ; 5220   0281 0167
        SDBD                                    ; 5222   0001
        ADDI    #$5AD0, R1                      ; 5223   02F9 00D0 005A
        MVI@    R1,     R0                      ; 5226   0288
        MOVR    R0,     R2                      ; 5227   0082

        JSR     R5,     X_RAND2                 ; 5228   0004 0114 029E

        SLR     R2,     2                       ; 522B   0066
        SLR     R2,     1                       ; 522C   0062
        ADDR    R2,     R0                      ; 522D   00D0
        MVI     G_015D, R2                      ; 522E   0282 015D
        TSTR    R2                              ; 5230   0092
        BNEQ    L_525C                          ; 5231   020C 0029

        TSTR    R3                              ; 5233   009B
        BEQ     L_5237                          ; 5234   0204 0001

        SLR     R0,     1                       ; 5236   0060
L_5237:
        MOVR    R0,     R2                      ; 5237   0082
        MVI     G_0167, R1                      ; 5238   0281 0167
        SLR     R1,     1                       ; 523A   0061
        SDBD                                    ; 523B   0001
        ADDI    #$5B0C, R1                      ; 523C   02F9 000C 005B
        MVI@    R1,     R0                      ; 523F   0288

        JSR     R5,     X_RAND2                 ; 5240   0004 0114 029E

        TSTR    R0                              ; 5243   0080
        BNEQ    L_5259                          ; 5244   020C 0013

        MOVR    R2,     R0                      ; 5246   0090
        SLR     R0,     1                       ; 5247   0060

        JSR     R5,     X_RAND2                 ; 5248   0004 0114 029E

        MOVR    R0,     R1                      ; 524B   0081
        MVII    #$0002, R0                      ; 524C   02B8 0002

        JSR     R5,     X_RAND2                 ; 524E   0004 0114 029E

        TSTR    R0                              ; 5251   0080
        BEQ     L_5255                          ; 5252   0204 0001

        NEGR    R1                              ; 5254   0021
L_5255:
        ANDI    #$00FF, R1                      ; 5255   03B9 00FF
        SWAP    R1,     1                       ; 5257   0041
        XORR    R1,     R2                      ; 5258   01CA
L_5259:
        MVO@    R2,     R4                      ; 5259   0262
        B       L_5262                          ; 525A   0200 0006

L_525C:
        SLR     R0,     1                       ; 525C   0060

        JSR     R5,     L_52CD                  ; 525D   0004 0150 02CD

        CLRR    R3                              ; 5260   01DB
        INCR    R4                              ; 5261   000C
L_5262:
        MVI     G_0164, R0                      ; 5262   0280 0164
        INCR    R0                              ; 5264   0008
        ANDI    #$0003, R0                      ; 5265   03B8 0003
        MVO     R0,     G_0164                  ; 5267   0240 0164
        MVO@    R0,     R4                      ; 5269   0260
        TSTR    R3                              ; 526A   009B
        BEQ     L_5271                          ; 526B   0204 0004

        MVII    #$0200, R0                      ; 526D   02B8 0200
        DECR    R4                              ; 526F   0014
        MVO@    R0,     R4                      ; 5270   0260
L_5271:
        SUBI    #$0006, R4                      ; 5271   033C 0006
        SDBD                                    ; 5273   0001
        MVII    #$7848, R2                      ; 5274   02BA 0048 0078
        MVI     G_015D, R0                      ; 5277   0280 015D
        TSTR    R0                              ; 5279   0080
        BNEQ    L_52A0                          ; 527A   020C 0024

        MVII    #$0001, R0                      ; 527C   02B8 0001

        JSR     R5,     X_RAND1                 ; 527E   0004 0114 027D

        TSTR    R3                              ; 5281   009B
        BNEQ    L_5293                          ; 5282   020C 000F

        TSTR    R0                              ; 5284   0080
        BEQ     L_52A0                          ; 5285   0204 0019

        SDBD                                    ; 5287   0001
        XORI    #$2040, R2                      ; 5288   03FA 0040 0020
        MOVR    R4,     R1                      ; 528B   00A1
        ADDI    #$0005, R1                      ; 528C   02F9 0005
        MVI@    R1,     R0                      ; 528E   0288
        SLL     R0,     1                       ; 528F   0048
        MVO@    R0,     R1                      ; 5290   0248
        B       L_52A0                          ; 5291   0200 000D

L_5293:
        SDBD                                    ; 5293   0001
        MVII    #$588F, R2                      ; 5294   02BA 008F 0058
        TSTR    R0                              ; 5297   0080
        BNEQ    L_52BD                          ; 5298   020C 0023

        SDBD                                    ; 529A   0001
        XORI    #$2180, R2                      ; 529B   03FA 0080 0021
        B       L_52BD                          ; 529E   0200 001D

L_52A0:
        MVII    #$0002, R0                      ; 52A0   02B8 0002

        JSR     R5,     X_RAND1                 ; 52A2   0004 0114 027D

        SWAP    R0,     1                       ; 52A5   0040
        SLL     R0,     1                       ; 52A6   0048
        XORR    R0,     R2                      ; 52A7   01C2
L_52A8:
        MVI     G_0165, R1                      ; 52A8   0281 0165
        INCR    R1                              ; 52AA   0009
        ANDI    #$0007, R1                      ; 52AB   03B9 0007
        MVO     R1,     G_0165                  ; 52AD   0241 0165
        MOVR    R1,     R0                      ; 52AF   0088

        JSR     R5,     X_POW2                  ; 52B0   0004 0114 0345

        AND     G_0166, R0                      ; 52B3   0380 0166
        BEQ     L_52A8                          ; 52B5   0224 000E

        SDBD                                    ; 52B7   0001
        ADDI    #$52BF, R1                      ; 52B8   02F9 00BF 0052
        MVI@    R1,     R0                      ; 52BB   0288
        XORR    R0,     R2                      ; 52BC   01C2
L_52BD:
        MVO@    R2,     R4                      ; 52BD   0262
L_52BE:
        PULR    R7                              ; 52BE   02B7

        DECLE   $0003,  $0004,  $0005           ; 52BF   0003 0004 0005

        CLRC                                    ; 52C2   0006
        DECR    R2                              ; 52C3   0012
        DECR    R3                              ; 52C4   0013
        DECR    R4                              ; 52C5   0014
        DECR    R5                              ; 52C6   0015
        ADDR    R3,     R5                      ; 52C7   00DD
        ADDR    R3,     R1                      ; 52C8   00D9
        MOVR    R3,     R5                      ; 52C9   009D
        RSWD    R1                              ; 52CA   0039
        ADCR    R6                              ; 52CB   002E
        ADDR    R3,     R5                      ; 52CC   00DD
L_52CD:
        PSHR    R5                              ; 52CD   0275
        PSHR    R0                              ; 52CE   0270
        MVII    #$00A6, R0                      ; 52CF   02B8 00A6

        JSR     R5,     X_RAND2                 ; 52D1   0004 0114 029E

        INCR    R0                              ; 52D4   0008
        MOVR    R0,     R1                      ; 52D5   0081
        MVII    #$0067, R0                      ; 52D6   02B8 0067

        JSR     R5,     X_RAND2                 ; 52D8   0004 0114 029E

        INCR    R0                              ; 52DB   0008
        MOVR    R0,     R2                      ; 52DC   0082
        MVII    #$0002, R0                      ; 52DD   02B8 0002

        JSR     R5,     X_RAND1                 ; 52DF   0004 0114 027D

        SLL     R0,     1                       ; 52E2   0048
        ADDR    R0,     R7                      ; 52E3   00C7
        B       L_52F5                          ; 52E4   0200 000F
        B       L_52F1                          ; 52E6   0200 0009
        B       L_52EE                          ; 52E8   0200 0004

        MVII    #$0068, R2                      ; 52EA   02BA 0068
        B       L_52F6                          ; 52EC   0200 0008

L_52EE:
        CLRR    R2                              ; 52EE   01D2
        B       L_52F6                          ; 52EF   0200 0005

L_52F1:
        MVII    #$00A7, R1                      ; 52F1   02B9 00A7
        B       L_52F6                          ; 52F3   0200 0001

L_52F5:
        CLRR    R1                              ; 52F5   01C9
L_52F6:
        SUBI    #$0002, R4                      ; 52F6   033C 0002
        SWAP    R1,     1                       ; 52F8   0041
        MVO@    R1,     R4                      ; 52F9   0261
        SWAP    R2,     1                       ; 52FA   0042
        MVO@    R2,     R4                      ; 52FB   0262
        PULR    R3                              ; 52FC   02B3
        MVII    #$0028, R0                      ; 52FD   02B8 0028

        JSR     R5,     X_RAND2                 ; 52FF   0004 0114 029E

        ADDI    #$001F, R0                      ; 5302   02F8 001F
        MOVR    R0,     R1                      ; 5304   0081
        MVII    #$0028, R0                      ; 5305   02B8 0028

        JSR     R5,     X_RAND2                 ; 5307   0004 0114 029E

        ADDI    #$003F, R0                      ; 530A   02F8 003F

        JSR     R5,     X_PACK_BYTES            ; 530C   0004 0114 034F

        MOVR    R0,     R2                      ; 530F   0082
        MOVR    R4,     R1                      ; 5310   00A1
        SUBI    #$0004, R1                      ; 5311   0339 0004

        JSR     R5,     .EXEC.9A3               ; 5313   0004 0118 01A3

        PULR    R7                              ; 5316   02B7

L_5317:
        PSHR    R5                              ; 5317   0275
        MVI     G_015D, R0                      ; 5318   0280 015D
        TSTR    R0                              ; 531A   0080
        BNEQ    L_53C2                          ; 531B   020C 00A5

        MVI     G_017C, R0                      ; 531D   0280 017C
        TSTR    R0                              ; 531F   0080
        BNEQ    L_53C2                          ; 5320   020C 00A0

        MVII    #$0172, R5                      ; 5322   02BD 0172
        SDBD                                    ; 5324   0001
        MVI@    R5,     R0                      ; 5325   02A8
        TSTR    R0                              ; 5326   0080
        BEQ     L_532F                          ; 5327   0204 0006

        DECR    R0                              ; 5329   0010
        MVO     R0,     G_0172                  ; 532A   0240 0172
        SWAP    R0,     1                       ; 532C   0040
        MVO     R0,     G_0173                  ; 532D   0240 0173
L_532F:
        MVI     G_0170, R0                      ; 532F   0280 0170
        TSTR    R0                              ; 5331   0080
        BNEQ    L_5390                          ; 5332   020C 005C

        JSR     R5,     L_56D9                  ; 5334   0004 0154 02D9

        MOVR    R1,     R4                      ; 5337   008C
        BEQ     L_53C2                          ; 5338   0204 0088

        MVII    #$0172, R5                      ; 533A   02BD 0172
        SDBD                                    ; 533C   0001
        MVI@    R5,     R0                      ; 533D   02A8
        TSTR    R0                              ; 533E   0080
        BNEQ    L_53C2                          ; 533F   020C 0081

        MVI     G_034C, R0                      ; 5341   0280 034C
        CMPI    #$0008, R0                      ; 5343   0378 0008
        BGT     L_5355                          ; 5345   020E 000E

        MVI     G_0167, R1                      ; 5347   0281 0167
        SDBD                                    ; 5349   0001
        ADDI    #$5B16, R1                      ; 534A   02F9 0016 005B
        MVI@    R1,     R0                      ; 534D   0288
        SLL     R0,     1                       ; 534E   0048

        JSR     R5,     X_RAND2                 ; 534F   0004 0114 029E

        TSTR    R0                              ; 5352   0080
        BNEQ    L_53C2                          ; 5353   020C 006D

L_5355:
        MVI     G_0167, R1                      ; 5355   0281 0167
        SDBD                                    ; 5357   0001
        ADDI    #$5B2A, R1                      ; 5358   02F9 002A 005B
        MVI@    R1,     R0                      ; 535B   0288
        MVO     R0,     G_0172                  ; 535C   0240 0172
        SWAP    R0,     1                       ; 535E   0040
        MVO     R0,     G_0173                  ; 535F   0240 0173
        CLRR    R0                              ; 5361   01C0
        MVO     R0,     G_0174                  ; 5362   0240 0174
        MOVR    R4,     R1                      ; 5364   00A1

        JSR     R5,     .EXEC.766               ; 5365   0004 0114 0366

        MVO     R0,     G_0170                  ; 5368   0240 0170
        INCR    R4                              ; 536A   000C
        SDBD                                    ; 536B   0001
        MVII    #$5D46, R1                      ; 536C   02B9 0046 005D
        MVO@    R1,     R4                      ; 536F   0261
        MVII    #$0088, R0                      ; 5370   02B8 0088

        JSR     R5,     X_RAND2                 ; 5372   0004 0114 029E

        ADDI    #$0010, R0                      ; 5375   02F8 0010
        SWAP    R0,     1                       ; 5377   0040
        MVO@    R0,     R4                      ; 5378   0260
        CLRR    R1                              ; 5379   01C9
        MVO@    R1,     R4                      ; 537A   0261
        INCR    R4                              ; 537B   000C
        MVII    #$0200, R1                      ; 537C   02B9 0200
        MVO@    R1,     R4                      ; 537E   0261
        SUBI    #$0006, R4                      ; 537F   033C 0006
        SDBD                                    ; 5381   0001
        MVII    #$188F, R1                      ; 5382   02B9 008F 0018
        MVO@    R1,     R4                      ; 5385   0261
        MVI     G_0167, R2                      ; 5386   0282 0167
        SDBD                                    ; 5388   0001
        ADDI    #$5AD0, R2                      ; 5389   02FA 00D0 005A
        MVI@    R2,     R3                      ; 538C   0293
        SLR     R3,     1                       ; 538D   0063
        MVO     R3,     G_0171                  ; 538E   0243 0171
L_5390:
        MVI     G_0174, R0                      ; 5390   0280 0174
        TSTR    R0                              ; 5392   0080
        BEQ     L_5399                          ; 5393   0204 0004

        DECR    R0                              ; 5395   0010
        MVO     R0,     G_0174                  ; 5396   0240 0174
        PULR    R7                              ; 5398   02B7

L_5399:
        MVI     G_0167, R1                      ; 5399   0281 0167
        SLR     R1,     1                       ; 539B   0061
        SDBD                                    ; 539C   0001
        ADDI    #$5B3C, R1                      ; 539D   02F9 003C 005B
        MVI@    R1,     R0                      ; 53A0   0288
        MVO     R0,     G_0174                  ; 53A1   0240 0174
        MVI     .PSG0.chn_c_vol,R0              ; 53A3   0280 01FD
        ANDI    #$000F, R0                      ; 53A5   03B8 000F
        BEQ     L_53AD                          ; 53A7   0204 0004

        CLRR    R0                              ; 53A9   01C0
        MVO     R0,     .PSG0.chn_c_vol         ; 53AA   0240 01FD
        PULR    R7                              ; 53AC   02B7

L_53AD:
        MVII    #$000E, R0                      ; 53AD   02B8 000E
        MVO     R0,     .PSG0.chn_c_vol         ; 53AF   0240 01FD
        MVI     G_031F, R0                      ; 53B1   0280 031F
        SWAP    R0,     1                       ; 53B3   0040
        MVI     G_0320, R1                      ; 53B4   0281 0320
        SWAP    R1,     1                       ; 53B6   0041

        JSR     R5,     X_PACK_BYTES            ; 53B7   0004 0114 034F

        MOVR    R0,     R2                      ; 53BA   0082
        MVI     G_0171, R3                      ; 53BB   0283 0171
        MVI     G_0170, R0                      ; 53BD   0280 0170

        JSR     R5,     .EXEC.9BB               ; 53BF   0004 0118 01BB

L_53C2:
        PULR    R7                              ; 53C2   02B7

L_53C3:
        PSHR    R5                              ; 53C3   0275
        MVI     G_015D, R3                      ; 53C4   0283 015D
        TSTR    R3                              ; 53C6   009B
        BNEQ    L_53CF                          ; 53C7   020C 0006

        MVI     G_032C, R0                      ; 53C9   0280 032C
        CMPI    #$0014, R0                      ; 53CB   0378 0014
        BLT     L_54AD                          ; 53CD   0205 00DE

L_53CF:
        MVI     G_0175, R0                      ; 53CF   0280 0175
        TSTR    R0                              ; 53D1   0080
        BNEQ    L_543F                          ; 53D2   020C 006B

        SDBD                                    ; 53D4   0001
        MVII    #$5B16, R1                      ; 53D5   02B9 0016 005B
        ADD     G_0167, R1                      ; 53D8   02C1 0167
        MVI@    R1,     R0                      ; 53DA   0288
        TSTR    R3                              ; 53DB   009B
        BEQ     L_53E0                          ; 53DC   0204 0002

        SLR     R0,     2                       ; 53DE   0064
        SLR     R0,     1                       ; 53DF   0060

L_53E0:
        JSR     R5,     X_RAND2                 ; 53E0   0004 0114 029E

        TSTR    R0                              ; 53E3   0080
        BNEQ    L_54AD                          ; 53E4   020C 00C7

        JSR     R5,     L_56D9                  ; 53E6   0004 0154 02D9

        TSTR    R1                              ; 53E9   0089
        BEQ     L_54AD                          ; 53EA   0204 00C1

        JSR     R5,     .EXEC.766               ; 53EC   0004 0114 0366

        MVO     R0,     G_0175                  ; 53EF   0240 0175
        INCR    R1                              ; 53F1   0009
        SDBD                                    ; 53F2   0001
        MVII    #$5D68, R0                      ; 53F3   02B8 0068 005D
        MVO@    R0,     R1                      ; 53F6   0248
        INCR    R1                              ; 53F7   0009
        CLRR    R3                              ; 53F8   01DB
        MVII    #$0001, R0                      ; 53F9   02B8 0001

        JSR     R5,     X_RAND1                 ; 53FB   0004 0114 027D

        TSTR    R0                              ; 53FE   0080
        BEQ     L_5404                          ; 53FF   0204 0003

        MVII    #$00A7, R3                      ; 5401   02BB 00A7
        SWAP    R3,     1                       ; 5403   0043
L_5404:
        MVO@    R3,     R1                      ; 5404   024B
        INCR    R1                              ; 5405   0009
        MVII    #$001A, R0                      ; 5406   02B8 001A

        JSR     R5,     X_RAND2                 ; 5408   0004 0114 029E

        ADDI    #$000A, R0                      ; 540B   02F8 000A
        SWAP    R0,     1                       ; 540D   0040
        MVO@    R0,     R1                      ; 540E   0248
        INCR    R1                              ; 540F   0009
        SDBD                                    ; 5410   0001
        MVII    #$5AB7, R2                      ; 5411   02BA 00B7 005A
        ADD     G_0167, R2                      ; 5414   02C2 0167
        MVI@    R2,     R0                      ; 5416   0290
        SLR     R0,     2                       ; 5417   0064
        MVO     R0,     G_0177                  ; 5418   0240 0177
        TSTR    R3                              ; 541A   009B
        BEQ     L_541E                          ; 541B   0204 0001

        NEGR    R0                              ; 541D   0020
L_541E:
        ANDI    #$00FF, R0                      ; 541E   03B8 00FF
        SWAP    R0,     1                       ; 5420   0040
        MVO@    R0,     R1                      ; 5421   0248
        MVI     G_015D, R2                      ; 5422   0282 015D
        TSTR    R2                              ; 5424   0092
        BEQ     L_542F                          ; 5425   0204 0008

        MVI     G_0177, R0                      ; 5427   0280 0177
        MOVR    R1,     R4                      ; 5429   008C

        JSR     R5,     L_52CD                  ; 542A   0004 0150 02CD

        ADDI    #$0004, R1                      ; 542D   02F9 0004
L_542F:
        INCR    R1                              ; 542F   0009
        MVII    #$0100, R0                      ; 5430   02B8 0100
        MVO@    R0,     R1                      ; 5432   0248
        SUBI    #$0005, R1                      ; 5433   0339 0005
        SDBD                                    ; 5435   0001
        MVII    #$788F, R0                      ; 5436   02B8 008F 0078
        MVO@    R0,     R1                      ; 5439   0248
        MVII    #$0005, R0                      ; 543A   02B8 0005
        MVO     R0,     G_0176                  ; 543C   0240 0176
        PULR    R7                              ; 543E   02B7

L_543F:
        MVI     G_017C, R0                      ; 543F   0280 017C
        TSTR    R0                              ; 5441   0080
        BNEQ    L_54AD                          ; 5442   020C 0069

        MVI     G_0175, R0                      ; 5444   0280 0175

        JSR     R5,     .EXEC.76C               ; 5446   0004 0114 036C

        MVI@    R1,     R0                      ; 5449   0288
        ANDI    #$0007, R0                      ; 544A   03B8 0007
        CMPI    #$0002, R0                      ; 544C   0378 0002
        BEQ     L_54AD                          ; 544E   0204 005D

        SDBD                                    ; 5450   0001
        MVII    #$5030, R2                      ; 5451   02BA 0030 0050
        SDBD                                    ; 5454   0001
        MVII    #$4828, R4                      ; 5455   02BC 0028 0048

        JSR     R5,     .EXEC.6F7               ; 5458   0004 0114 02F7

        BNC     L_54AD                          ; 545B   0209 0050

        MOVR    R1,     R3                      ; 545D   008B
        MVI     G_0176, R0                      ; 545E   0280 0176
        TSTR    R0                              ; 5460   0080
        BEQ     L_5467                          ; 5461   0204 0004

        DECR    R0                              ; 5463   0010
        MVO     R0,     G_0176                  ; 5464   0240 0176
        PULR    R7                              ; 5466   02B7

L_5467:
        JSR     R5,     L_56D9                  ; 5467   0004 0154 02D9

        MOVR    R1,     R4                      ; 546A   008C
        BEQ     L_54AD                          ; 546B   0204 0040

        MVII    #$0014, R0                      ; 546D   02B8 0014
        SUB     G_0177, R0                      ; 546F   0300 0177
        MVO     R0,     G_0176                  ; 5471   0240 0176
        INCR    R4                              ; 5473   000C
        SDBD                                    ; 5474   0001
        MVII    #$5D6F, R0                      ; 5475   02B8 006F 005D
        MVO@    R0,     R4                      ; 5478   0260
        MOVR    R3,     R1                      ; 5479   0099
        ADDI    #$0002, R1                      ; 547A   02F9 0002
        MVI@    R1,     R0                      ; 547C   0288
        MVO@    R0,     R4                      ; 547D   0260
        INCR    R1                              ; 547E   0009
        MVI@    R1,     R0                      ; 547F   0288
        MVO@    R0,     R4                      ; 5480   0260
        INCR    R4                              ; 5481   000C
        MVII    #$0200, R0                      ; 5482   02B8 0200
        MVO@    R0,     R4                      ; 5484   0260
        MVII    #$0004, R0                      ; 5485   02B8 0004
        MVO@    R0,     R4                      ; 5487   0260
        MVII    #$000F, R0                      ; 5488   02B8 000F
        MVO     R0,     .PSG0.chn_b_vol         ; 548A   0240 01FC
        MVI     G_031F, R0                      ; 548C   0280 031F
        SWAP    R0,     1                       ; 548E   0040
        MVI     G_0320, R1                      ; 548F   0281 0320
        SWAP    R1,     1                       ; 5491   0041

        JSR     R5,     X_PACK_BYTES            ; 5492   0004 0114 034F

        MOVR    R0,     R2                      ; 5495   0082
        MVI     G_0167, R1                      ; 5496   0281 0167
        SLR     R1,     2                       ; 5498   0065
        SDBD                                    ; 5499   0001
        ADDI    #$5ACB, R1                      ; 549A   02F9 00CB 005A
        MVI@    R1,     R3                      ; 549D   028B
        SLR     R3,     2                       ; 549E   0067
        SUBI    #$0007, R4                      ; 549F   033C 0007
        MOVR    R4,     R1                      ; 54A1   00A1

        JSR     R5,     .EXEC.766               ; 54A2   0004 0114 0366
        JSR     R5,     .EXEC.9BB               ; 54A5   0004 0118 01BB

        SDBD                                    ; 54A8   0001
        MVII    #$588F, R0                      ; 54A9   02B8 008F 0058
        MVO@    R0,     R4                      ; 54AC   0260
L_54AD:
        PULR    R7                              ; 54AD   02B7

        MVI     .PSG0.chn_b_vol,R2              ; 54AE   0282 01FC
        ANDI    #$0030, R2                      ; 54B0   03BA 0030
        BNEQ    L_54B8                          ; 54B2   020C 0004

        MVII    #$000C, R2                      ; 54B4   02BA 000C
        MVO     R2,     .PSG0.chn_b_vol         ; 54B6   0242 01FC
L_54B8:
        MOVR    R5,     R7                      ; 54B8   00AF

L_54B9:
        PSHR    R5                              ; 54B9   0275
        TSTR    R0                              ; 54BA   0080
        BMI     L_54DA                          ; 54BB   020B 001D

        MVO     R0,     G_0169                  ; 54BD   0240 0169
        MOVR    R0,     R1                      ; 54BF   0081
        SDBD                                    ; 54C0   0001
        ADDI    #$54DB, R1                      ; 54C1   02F9 00DB 0054
        MVI@    R1,     R0                      ; 54C4   0288
        MOVR    R0,     R2                      ; 54C5   0082
        ANDI    #$000F, R2                      ; 54C6   03BA 000F
        MVO     R2,     G_0322                  ; 54C8   0242 0322
        ANDI    #$0300, R0                      ; 54CA   03B8 0300
        SLL     R0,     1                       ; 54CC   0048
        MVII    #$031D, R1                      ; 54CD   02B9 031D
        MVI@    R1,     R2                      ; 54CF   028A
        SDBD                                    ; 54D0   0001
        ANDI    #$F9FF, R2                      ; 54D1   03BA 00FF 00F9
        XORR    R0,     R2                      ; 54D4   01C2
        MVO@    R2,     R1                      ; 54D5   024A
        CLRR    R0                              ; 54D6   01C0

        JSR     R5,     .EXEC.41C               ; 54D7   0004 0114 001C

L_54DA:
        PULR    R7                              ; 54DA   02B7

        DECLE   $0104,  $0103,  $0102,  $0101   ; 54DB   0104 0103 0102 0101
        DECLE   $0000,  $0001                   ; 54DF   0000 0001

        EIS                                     ; 54E1   0002
        DIS                                     ; 54E2   0003
        BEQ     L_56E8                          ; 54E3   0204 0203
        BOV     L_56E8                          ; 54E5   0202 0201

        SUB     G_0301, R0                      ; 54E7   0300 0301
        SUB     G_0303, R2                      ; 54E9   0302 0303
L_54EB:
        PSHR    R5                              ; 54EB   0275
        CLRR    R2                              ; 54EC   01D2
        MVO     R2,     .PSG0.chn_c_vol         ; 54ED   0242 01FD
        INCR    R0                              ; 54EF   0008
        BEQ     L_5514                          ; 54F0   0204 0022

        MVII    #$000A, R2                      ; 54F2   02BA 000A
        MVO     R2,     .PSG0.chn_c_vol         ; 54F4   0242 01FD
        MVII    #$0015, R2                      ; 54F6   02BA 0015
        MVO     R2,     .PSG0.chan_enable       ; 54F8   0242 01F8
        SDBD                                    ; 54FA   0001
        MVII    #$5AB7, R1                      ; 54FB   02B9 00B7 005A
        ADD     G_0167, R1                      ; 54FE   02C1 0167
        MVI@    R1,     R0                      ; 5500   0288

        JSR     R5,     X_CLAMP                 ; 5501   0004 0114 0270
        DECLE   $0000                           ; 5504   0000

        RSWD    R4                              ; 5505   003C
        MVI     G_0169, R1                      ; 5506   0281 0169
        ADDI    #$0008, R1                      ; 5508   02F9 0008
        ANDI    #$000F, R1                      ; 550A   03B9 000F

        JSR     R5,     .EXEC.629               ; 550C   0004 0114 0229

        MVI     G_016A, R2                      ; 550F   0282 016A
        TSTR    R2                              ; 5511   0092
        BEQ     L_5524                          ; 5512   0204 0010

L_5514:
        PSHR    R0                              ; 5514   0270
        MVII    #$0187, R3                      ; 5515   02BB 0187
        MVII    #$016B, R4                      ; 5517   02BC 016B

        JSR     R5,     L_552C                  ; 5519   0004 0154 012C

        PULR    R0                              ; 551C   02B0
        SWAP    R0,     1                       ; 551D   0040
        MVII    #$018A, R3                      ; 551E   02BB 018A

        JSR     R5,     L_552C                  ; 5520   0004 0154 012C

        PULR    R7                              ; 5523   02B7

L_5524:
        JSR     R5,     X_UNPK_BYTES            ; 5524   0004 0114 0357

        MVO     R1,     G_018A                  ; 5527   0241 018A
        MVO     R0,     G_0187                  ; 5529   0240 0187
        PULR    R7                              ; 552B   02B7

L_552C:
        PSHR    R5                              ; 552C   0275
        SDBD                                    ; 552D   0001
        ANDI    #$FF00, R0                      ; 552E   03B8 0000 00FF
        SAR     R0,     2                       ; 5531   006C
        SAR     R0,     2                       ; 5532   006C
        SAR     R0,     2                       ; 5533   006C
        SDBD                                    ; 5534   0001
        ADD@    R4,     R0                      ; 5535   02E0
        MOVR    R0,     R1                      ; 5536   0081
        BPL     L_553A                          ; 5537   0203 0001

        NEGR    R1                              ; 5539   0021
L_553A:
        SDBD                                    ; 553A   0001
        MVII    #$7800, R2                      ; 553B   02BA 0000 0078
        CMPR    R1,     R2                      ; 553E   014A
        BGT     L_5546                          ; 553F   020E 0005

        TSTR    R0                              ; 5541   0080
        BPL     L_5545                          ; 5542   0203 0001

        NEGR    R2                              ; 5544   0022
L_5545:
        MOVR    R2,     R0                      ; 5545   0090
L_5546:
        SUBI    #$0002, R4                      ; 5546   033C 0002
        MVO@    R0,     R4                      ; 5548   0260
        SWAP    R0,     1                       ; 5549   0040
        MVO@    R0,     R4                      ; 554A   0260
        MVO@    R0,     R3                      ; 554B   0258
        PULR    R7                              ; 554C   02B7

L_554D:
        PSHR    R5                              ; 554D   0275
        CMPI    #$0001, R0                      ; 554E   0378 0001
        BNEQ    L_5579                          ; 5550   020C 0027

        JSR     R5,     L_55DB                  ; 5552   0004 0154 01DB

        TSTR    R1                              ; 5555   0089
        BEQ     L_5579                          ; 5556   0204 0021

        MOVR    R1,     R3                      ; 5558   008B
        MOVR    R1,     R4                      ; 5559   008C
        ADDI    #$0002, R4                      ; 555A   02FC 0002
        MVI     G_031F, R0                      ; 555C   0280 031F
        MVO@    R0,     R4                      ; 555E   0260
        MVI     G_0320, R0                      ; 555F   0280 0320
        MVO@    R0,     R4                      ; 5561   0260
        MVI     G_0167, R1                      ; 5562   0281 0167
        SLR     R1,     2                       ; 5564   0065
        SDBD                                    ; 5565   0001
        ADDI    #$5ACB, R1                      ; 5566   02F9 00CB 005A
        MVI@    R1,     R0                      ; 5569   0288
        SLR     R0,     1                       ; 556A   0060
        MVI     G_0169, R1                      ; 556B   0281 0169

        JSR     R5,     .EXEC.629               ; 556D   0004 0114 0229

        MVO@    R0,     R4                      ; 5570   0260
        MVII    #$0200, R0                      ; 5571   02B8 0200
        MVO@    R0,     R4                      ; 5573   0260
        SDBD                                    ; 5574   0001
        MVII    #$188F, R0                      ; 5575   02B8 008F 0018
        MVO@    R0,     R3                      ; 5578   0258
L_5579:
        PULR    R7                              ; 5579   02B7

        PSHR    R5                              ; 557A   0275
        TSTR    R0                              ; 557B   0080
        BMI     L_5598                          ; 557C   020B 001A

        MVI     G_0167, R2                      ; 557E   0282 0167
        SDBD                                    ; 5580   0001
        ADDI    #$5AB7, R2                      ; 5581   02FA 00B7 005A
        MVI@    R2,     R1                      ; 5584   0291
        ADDI    #$000C, R0                      ; 5585   02F8 000C
        ANDI    #$000F, R0                      ; 5587   03B8 000F
        BEQ     L_5598                          ; 5589   0204 000D

        SUBI    #$0008, R0                      ; 558B   0338 0008
        BEQ     L_5598                          ; 558D   0204 0009
        BPL     L_5592                          ; 558F   0203 0001

        NEGR    R1                              ; 5591   0021
L_5592:
        ANDI    #$00FF, R1                      ; 5592   03B9 00FF
        SWAP    R1,     1                       ; 5594   0041
        MVO     R1,     G_0321                  ; 5595   0241 0321
        PULR    R7                              ; 5597   02B7

L_5598:
        CLRR    R0                              ; 5598   01C0
        MVO     R0,     G_0321                  ; 5599   0240 0321
        PULR    R7                              ; 559B   02B7

L_559C:
        PSHR    R5                              ; 559C   0275
        MVI     G_017B, R2                      ; 559D   0282 017B
        TSTR    R2                              ; 559F   0092
        BNEQ    L_55B0                          ; 55A0   020C 000E

        MVII    #$0001, R0                      ; 55A2   02B8 0001
        MVI     G_015D, R2                      ; 55A4   0282 015D
        TSTR    R2                              ; 55A6   0092
        BEQ     L_55AD                          ; 55A7   0204 0004

        JSR     R5,     L_554D                  ; 55A9   0004 0154 014D

        PULR    R7                              ; 55AC   02B7

L_55AD:
        JSR     R5,     L_55B1                  ; 55AD   0004 0154 01B1

L_55B0:
        PULR    R7                              ; 55B0   02B7

L_55B1:
        PSHR    R5                              ; 55B1   0275
        CMPI    #$0001, R0                      ; 55B2   0378 0001
        BLT     L_55DA                          ; 55B4   0205 0024

        JSR     R5,     L_55DB                  ; 55B6   0004 0154 01DB

        TSTR    R1                              ; 55B9   0089
        BEQ     L_55DA                          ; 55BA   0204 001E

        MOVR    R1,     R3                      ; 55BC   008B
        MOVR    R1,     R4                      ; 55BD   008C
        ADDI    #$0002, R4                      ; 55BE   02FC 0002
        MVI     G_031F, R2                      ; 55C0   0282 031F
        MVO@    R2,     R4                      ; 55C2   0262
        MVII    #$0056, R2                      ; 55C3   02BA 0056
        SWAP    R2,     1                       ; 55C5   0042
        MVO@    R2,     R4                      ; 55C6   0262
        MVI     G_0167, R1                      ; 55C7   0281 0167
        SLR     R1,     2                       ; 55C9   0065
        MOVR    R1,     R0                      ; 55CA   0088
        SDBD                                    ; 55CB   0001
        ADDI    #$5ACB, R1                      ; 55CC   02F9 00CB 005A
        MVI@    R1,     R2                      ; 55CF   028A
        NEGR    R2                              ; 55D0   0022
        ANDI    #$00FF, R2                      ; 55D1   03BA 00FF
        MVO@    R2,     R4                      ; 55D3   0262
        MVO@    R0,     R4                      ; 55D4   0260
        SDBD                                    ; 55D5   0001
        MVII    #$190F, R2                      ; 55D6   02BA 000F 0019
        MVO@    R2,     R3                      ; 55D9   025A
L_55DA:
        PULR    R7                              ; 55DA   02B7

L_55DB:
        PSHR    R5                              ; 55DB   0275
        MVII    #$0325, R1                      ; 55DC   02B9 0325
        MVI@    R1,     R0                      ; 55DE   0288
        ANDI    #$0008, R0                      ; 55DF   03B8 0008
        BEQ     L_55EB                          ; 55E1   0204 0008

        MVII    #$032D, R1                      ; 55E3   02B9 032D
        MVI@    R1,     R0                      ; 55E5   0288
        ANDI    #$0008, R0                      ; 55E6   03B8 0008
        BEQ     L_55EB                          ; 55E8   0204 0001

        CLRR    R1                              ; 55EA   01C9
L_55EB:
        PULR    R7                              ; 55EB   02B7

L_55EC:
        PSHR    R5                              ; 55EC   0275
        CLRR    R2                              ; 55ED   01D2
        CMPI    #$0001, R0                      ; 55EE   0378 0001
        BNEQ    L_55FC                          ; 55F0   020C 000A

        MVO     R0,     G_015E                  ; 55F2   0240 015E
        SDBD                                    ; 55F4   0001
        MVII    #$5048, R1                      ; 55F5   02B9 0048 0050

        JSR     R5,     X_TIMER_START           ; 55F8   0004 0118 0044

        PULR    R7                              ; 55FB   02B7

L_55FC:
        CMPI    #$0002, R0                      ; 55FC   0378 0002
        BNEQ    L_560A                          ; 55FE   020C 000A

        MVO     R2,     G_015E                  ; 5600   0242 015E
        SDBD                                    ; 5602   0001
        MVII    #$5048, R1                      ; 5603   02B9 0048 0050

        JSR     R5,     X_TIMER_STOP            ; 5606   0004 0118 0038

        PULR    R7                              ; 5609   02B7

L_560A:
        CMPI    #$0003, R0                      ; 560A   0378 0003
        BNEQ    L_562B                          ; 560C   020C 001D

        JSR     R5,     L_5DA2                  ; 560E   0004 015C 01A2

        MVII    #$0089, R0                      ; 5611   02B8 0089

        JSR     R5,     X_RAND2                 ; 5613   0004 0114 029E

        ADDI    #$0010, R0                      ; 5616   02F8 0010
        SWAP    R0,     1                       ; 5618   0040
        MVO     R0,     G_031F                  ; 5619   0240 031F
        MVI     G_015D, R0                      ; 561B   0280 015D
        TSTR    R0                              ; 561D   0080
        BEQ     L_565E                          ; 561E   0204 003E

        MVII    #$0049, R0                      ; 5620   02B8 0049

        JSR     R5,     X_RAND2                 ; 5622   0004 0114 029E

        ADDI    #$0010, R0                      ; 5625   02F8 0010
        SWAP    R0,     1                       ; 5627   0040
        MVO     R0,     G_0320                  ; 5628   0240 0320
        PULR    R7                              ; 562A   02B7

L_562B:
        CMPI    #$0004, R0                      ; 562B   0378 0004
        BNEQ    L_5632                          ; 562D   020C 0003

        MVO     R0,     G_016A                  ; 562F   0240 016A
        PULR    R7                              ; 5631   02B7

L_5632:
        CMPI    #$0005, R0                      ; 5632   0378 0005
        BNEQ    L_563F                          ; 5634   020C 0009

        MVO     R2,     G_016A                  ; 5636   0242 016A
        MVII    #$016B, R4                      ; 5638   02BC 016B
        MVO@    R2,     R4                      ; 563A   0262
        MVO@    R2,     R4                      ; 563B   0262
        MVO@    R2,     R4                      ; 563C   0262
        MVO@    R2,     R4                      ; 563D   0262
        PULR    R7                              ; 563E   02B7

L_563F:
        CMPI    #$000A, R0                      ; 563F   0378 000A
        BNEQ    L_565E                          ; 5641   020C 001B

        MVI     G_015D, R0                      ; 5643   0280 015D
        TSTR    R0                              ; 5645   0080
        BEQ     L_565E                          ; 5646   0204 0016

        MVO     R0,     G_017B                  ; 5648   0240 017B

        JSR     R5,     L_56EB                  ; 564A   0004 0154 02EB

        MVII    #$017D, R1                      ; 564D   02B9 017D
        MVO     R1,     G_035D                  ; 564F   0241 035D
        MVII    #$01FB, R4                      ; 5651   02BC 01FB
        MVO@    R2,     R4                      ; 5653   0262
        MVO@    R2,     R4                      ; 5654   0262
        MVO@    R2,     R4                      ; 5655   0262
        MVII    #$0014, R1                      ; 5656   02B9 0014
        MVO     R1,     G_0323                  ; 5658   0241 0323
        CLRR    R0                              ; 565A   01C0

        JSR     R5,     L_5924                  ; 565B   0004 0158 0124

L_565E:
        PULR    R7                              ; 565E   02B7

L_565F:
        PSHR    R5                              ; 565F   0275
        PSHR    R1                              ; 5660   0271
        PSHR    R3                              ; 5661   0273
        MOVR    R0,     R3                      ; 5662   0083

        JSR     R5,     .EXEC.76C               ; 5663   0004 0114 036C

        MVI@    R1,     R0                      ; 5666   0288
        ANDI    #$0008, R0                      ; 5667   03B8 0008
        MVI@    R1,     R0                      ; 5669   0288
        BEQ     L_568F                          ; 566A   0204 0023

        SDBD                                    ; 566C   0001
        ANDI    #$E7F7, R0                      ; 566D   03B8 00F7 00E7
        MVO@    R0,     R1                      ; 5670   0248
        MOVR    R3,     R0                      ; 5671   0098
        XOR     G_0170, R0                      ; 5672   03C0 0170
        BNEQ    L_567A                          ; 5674   020C 0004

        MVO     R0,     G_0170                  ; 5676   0240 0170
        MVO     R0,     .PSG0.chn_c_vol         ; 5678   0240 01FD
L_567A:
        MOVR    R3,     R0                      ; 567A   0098
        XOR     G_0175, R0                      ; 567B   03C0 0175
        BNEQ    L_5681                          ; 567D   020C 0002

        MVO     R0,     G_0175                  ; 567F   0240 0175
L_5681:
        MOVR    R3,     R0                      ; 5681   0098

        JSR     R5,     X_POW2                  ; 5682   0004 0114 0345

        COMR    R0                              ; 5685   0018
        AND     G_016F, R0                      ; 5686   0380 016F
        MVO     R0,     G_016F                  ; 5688   0240 016F
        MVI@    R1,     R0                      ; 568A   0288
        ADDI    #$0005, R1                      ; 568B   02F9 0005
        CLRR    R3                              ; 568D   01DB
        MVO@    R3,     R1                      ; 568E   024B
L_568F:
        PULR    R3                              ; 568F   02B3
        PULR    R1                              ; 5690   02B1
        PULR    R7                              ; 5691   02B7

L_5692:
        PSHR    R5                              ; 5692   0275
        MVI     G_015D, R2                      ; 5693   0282 015D
        TSTR    R2                              ; 5695   0092
        BNEQ    L_56B9                          ; 5696   020C 0021

        MVI@    R1,     R2                      ; 5698   028A

        JSR     R5,     L_565F                  ; 5699   0004 0154 025F

        INCR    R1                              ; 569C   0009
        MVI@    R1,     R0                      ; 569D   0288
        SDBD                                    ; 569E   0001
        CMPI    #$5D3F, R0                      ; 569F   0378 003F 005D
        BNEQ    L_56A8                          ; 56A2   020C 0004

        JSR     R5,     L_5848                  ; 56A4   0004 0158 0048

        PULR    R7                              ; 56A7   02B7

L_56A8:
        SDBD                                    ; 56A8   0001
        CMPI    #$5D31, R0                      ; 56A9   0378 0031 005D
        BNEQ    L_56B9                          ; 56AC   020C 000B

        MVII    #$0005, R0                      ; 56AE   02B8 0005
        ANDI    #$0040, R2                      ; 56B0   03BA 0040
        BNEQ    L_56B5                          ; 56B2   020C 0001

        SLL     R0,     1                       ; 56B4   0048
L_56B5:
        NEGR    R0                              ; 56B5   0020

        JSR     R5,     L_5924                  ; 56B6   0004 0158 0124

L_56B9:
        PULR    R7                              ; 56B9   02B7

        PSHR    R5                              ; 56BA   0275
        MVI@    R1,     R3                      ; 56BB   028B
        ANDI    #$0008, R3                      ; 56BC   03BB 0008
        BEQ     L_56CB                          ; 56BE   0204 000B

        CMPI    #$0002, R2                      ; 56C0   037A 0002
        BNEQ    L_56C8                          ; 56C2   020C 0004

        JSR     R5,     L_5692                  ; 56C4   0004 0154 0292

        PULR    R7                              ; 56C7   02B7

L_56C8:
        JSR     R5,     L_565F                  ; 56C8   0004 0154 025F

L_56CB:
        PULR    R7                              ; 56CB   02B7

L_56CC:
        PSHR    R5                              ; 56CC   0275
        PSHR    R1                              ; 56CD   0271
        MVII    #$0007, R1                      ; 56CE   02B9 0007
L_56D0:
        MOVR    R1,     R0                      ; 56D0   0088

        JSR     R5,     L_565F                  ; 56D1   0004 0154 025F

        DECR    R1                              ; 56D4   0011
        BPL     L_56D0                          ; 56D5   0223 0006

        PULR    R1                              ; 56D7   02B1
        PULR    R7                              ; 56D8   02B7

L_56D9:
        PSHR    R5                              ; 56D9   0275
        PSHR    R0                              ; 56DA   0270
        MVII    #$0335, R1                      ; 56DB   02B9 0335
L_56DD:
        MVI@    R1,     R0                      ; 56DD   0288
        ANDI    #$0008, R0                      ; 56DE   03B8 0008
        BEQ     L_56E9                          ; 56E0   0204 0007

        ADDI    #$0008, R1                      ; 56E2   02F9 0008
        CMPI    #$0355, R1                      ; 56E4   0379 0355
        BLE     L_56DD                          ; 56E6   0226 000A

L_56E8:
        CLRR    R1                              ; 56E8   01C9
L_56E9:
        PULR    R0                              ; 56E9   02B0
        PULR    R7                              ; 56EA   02B7

L_56EB:
        PSHR    R5                              ; 56EB   0275
        PSHR    R2                              ; 56EC   0272
        CLRR    R2                              ; 56ED   01D2
        MVO     R2,     G_0187                  ; 56EE   0242 0187
        MVO     R2,     G_018A                  ; 56F0   0242 018A
        INCR    R2                              ; 56F2   000A
        B       L_56F8                          ; 56F3   0200 0003

L_56F5:
        PSHR    R5                              ; 56F5   0275
        PSHR    R2                              ; 56F6   0272
        CLRR    R2                              ; 56F7   01D2
L_56F8:
        PSHR    R1                              ; 56F8   0271
        PSHR    R0                              ; 56F9   0270
        MVII    #$031D, R1                      ; 56FA   02B9 031D
L_56FC:
        MVI@    R1,     R0                      ; 56FC   0288
        SLL     R0,     1                       ; 56FD   0048
        SETC                                    ; 56FE   0007
        TSTR    R2                              ; 56FF   0092
        BNEQ    L_5703                          ; 5700   020C 0001

        CLRC                                    ; 5702   0006
L_5703:
        RRC     R0,     1                       ; 5703   0070
        MVO@    R0,     R1                      ; 5704   0248
        ADDI    #$0008, R1                      ; 5705   02F9 0008
        CMPI    #$0355, R1                      ; 5707   0379 0355
        BLE     L_56FC                          ; 5709   0226 000E

        PULR    R0                              ; 570B   02B0
        PULR    R1                              ; 570C   02B1
        PULR    R2                              ; 570D   02B2
        PULR    R7                              ; 570E   02B7

L_570F:
        PSHR    R5                              ; 570F   0275
        MOVR    R4,     R3                      ; 5710   00A3
        PSHR    R2                              ; 5711   0272
        PSHR    R1                              ; 5712   0271

        JSR     R5,     X_MPY                   ; 5713   0004 011C 01DC

        ADDR    R2,     R3                      ; 5716   00D3
        PULR    R2                              ; 5717   02B2
        DECR    R2                              ; 5718   0012
        PULR    R1                              ; 5719   02B1
L_571A:
        MOVR    R1,     R0                      ; 571A   0088

        JSR     R5,     X_RAND2                 ; 571B   0004 0114 029E

        TSTR    R0                              ; 571E   0080
        BEQ     L_5724                          ; 571F   0204 0003

        CLRR    R0                              ; 5721   01C0
        B       L_572F                          ; 5722   0200 000B

L_5724:
        MVII    #$0003, R0                      ; 5724   02B8 0003

        JSR     R5,     X_RAND1                 ; 5726   0004 0114 027D

        XORI    #$0100, R0                      ; 5729   03F8 0100
        SLL     R0,     2                       ; 572B   004C
        SLL     R0,     1                       ; 572C   0048
        XORI    #$0007, R0                      ; 572D   03F8 0007
L_572F:
        MVO@    R0,     R4                      ; 572F   0260
        ADDR    R2,     R4                      ; 5730   00D4
        CMPR    R3,     R4                      ; 5731   015C
        BLT     L_571A                          ; 5732   0225 0019
        PULR    R7                              ; 5734   02B7

L_5735:
        PSHR    R5                              ; 5735   0275
        SDBD                                    ; 5736   0001
        MVII    #$574E, R3                      ; 5737   02BB 004E 0057
        MOVR    R3,     R1                      ; 573A   0099
        ADDR    R2,     R1                      ; 573B   00D1
        MVI@    R1,     R4                      ; 573C   028C
        ADDI    #$0200, R4                      ; 573D   02FC 0200
        ADDI    #$0004, R3                      ; 573F   02FB 0004
        MOVR    R3,     R1                      ; 5741   0099
        ADDR    R2,     R1                      ; 5742   00D1
        MVI@    R1,     R0                      ; 5743   0288
        ADDI    #$0004, R3                      ; 5744   02FB 0004
        ADDR    R2,     R3                      ; 5746   00D3
        MVI@    R3,     R1                      ; 5747   0299
        MVII    #$0004, R2                      ; 5748   02BA 0004

        JSR     R5,     L_570F                  ; 574A   0004 0154 030F

        PULR    R7                              ; 574D   02B7

        DECLE   $0013,  $0000,  $00DC,  $0000   ; 574E   0013 0000 00DC 0000
        DECLE   $000C,  $000C,  $0014,  $0014   ; 5752   000C 000C 0014 0014
        DECLE   $0014,  $0014,  $0001,  $0001   ; 5756   0014 0014 0001 0001

        PSHR    R5                              ; 575A   0275
        MVI     G_017B, R1                      ; 575B   0281 017B
        TSTR    R1                              ; 575D   0089
        BNEQ    L_57FF                          ; 575E   020C 009F

        MOVR    R0,     R4                      ; 5760   0084
        MOVR    R3,     R0                      ; 5761   0098

        JSR     R5,     .EXEC.76C               ; 5762   0004 0114 036C

        MOVR    R1,     R3                      ; 5765   008B
        INCR    R1                              ; 5766   0009
        MVI@    R1,     R2                      ; 5767   028A
        SDBD                                    ; 5768   0001
        CMPI    #$5D57, R2                      ; 5769   037A 0057 005D
        BEQ     L_57FF                          ; 576C   0204 0091

        MOVR    R4,     R0                      ; 576E   00A0
        CMPI    #$0002, R0                      ; 576F   0378 0002
        BPL     L_5776                          ; 5771   0203 0003

        JSR     R5,     L_565F                  ; 5773   0004 0154 025F

L_5776:
        MOVR    R2,     R4                      ; 5776   0094
        MVI@    R3,     R2                      ; 5777   029A
        MVII    #$000A, R0                      ; 5778   02B8 000A
        SDBD                                    ; 577A   0001
        ANDI    #$2000, R2                      ; 577B   03BA 0000 0020
        BNEQ    L_5781                          ; 577E   020C 0001

        SLL     R0,     1                       ; 5780   0048
L_5781:
        SDBD                                    ; 5781   0001
        CMPI    #$5D31, R4                      ; 5782   037C 0031 005D
        BEQ     L_57A4                          ; 5785   0204 001D

        SDBD                                    ; 5787   0001
        CMPI    #$5D38, R4                      ; 5788   037C 0038 005D
        BEQ     L_57A4                          ; 578B   0204 0017

        SLL     R0,     2                       ; 578D   004C
        SDBD                                    ; 578E   0001
        CMPI    #$5D3F, R4                      ; 578F   037C 003F 005D
        BEQ     L_57A4                          ; 5792   0204 0010

        MVII    #$0032, R0                      ; 5794   02B8 0032
        SDBD                                    ; 5796   0001
        CMPI    #$5D46, R4                      ; 5797   037C 0046 005D
        BEQ     L_57A4                          ; 579A   0204 0008

        SLL     R0,     1                       ; 579C   0048
        SDBD                                    ; 579D   0001
        CMPI    #$5D68, R4                      ; 579E   037C 0068 005D
        BEQ     L_57A4                          ; 57A1   0204 0001

        CLRR    R0                              ; 57A3   01C0

L_57A4:
        JSR     R5,     L_5924                  ; 57A4   0004 0158 0124

        SDBD                                    ; 57A7   0001
        CMPI    #$5D31, R4                      ; 57A8   037C 0031 005D
        BEQ     L_57B5                          ; 57AB   0204 0008

        SDBD                                    ; 57AD   0001
        CMPI    #$5D38, R4                      ; 57AE   037C 0038 005D
        BEQ     L_57B5                          ; 57B1   0204 0002
        B       L_57FB                          ; 57B3   0200 0046

L_57B5:
        MVI@    R3,     R0                      ; 57B5   0298
        ANDI    #$0040, R0                      ; 57B6   03B8 0040
        BEQ     L_57FB                          ; 57B8   0204 0041

        JSR     R5,     L_56D9                  ; 57BA   0004 0154 02D9

        TSTR    R1                              ; 57BD   0089
        BEQ     L_57FB                          ; 57BE   0204 003B

        JSR     R5,     L_5D80                  ; 57C0   0004 015C 0180

        MOVR    R3,     R4                      ; 57C3   009C
        MVI@    R3,     R0                      ; 57C4   0298
        SDBD                                    ; 57C5   0001
        XORI    #$2440, R0                      ; 57C6   03F8 0040 0024
        MVO@    R0,     R3                      ; 57C9   0258
        ADDI    #$0004, R3                      ; 57CA   02FB 0004
        MVI@    R3,     R0                      ; 57CC   0298

        JSR     R5,     X_UNPK_BYTES            ; 57CD   0004 0114 0357

        MOVR    R0,     R2                      ; 57D0   0082
        SUBR    R1,     R2                      ; 57D1   010A
        ADDR    R0,     R1                      ; 57D2   00C1
        MOVR    R2,     R0                      ; 57D3   0090
        MVI     G_015D, R2                      ; 57D4   0282 015D
        TSTR    R2                              ; 57D6   0092
        BEQ     L_57DB                          ; 57D7   0204 0002

        SLL     R0,     1                       ; 57D9   0048
        SLL     R1,     1                       ; 57DA   0049

L_57DB:
        JSR     R5,     X_PACK_BYTES            ; 57DB   0004 0114 034F

        MVO@    R0,     R3                      ; 57DE   0258
        INCR    R3                              ; 57DF   000B
        MVI@    R3,     R0                      ; 57E0   0298
        SLL     R0,     1                       ; 57E1   0048
        MVO@    R0,     R3                      ; 57E2   0258

        JSR     R5,     L_56D9                  ; 57E3   0004 0154 02D9

        MVII    #$0007, R0                      ; 57E6   02B8 0007

        JSR     R5,     .EXEC.730               ; 57E8   0004 0114 0330

        MOVR    R5,     R3                      ; 57EB   00AB
        SUBI    #$0003, R3                      ; 57EC   033B 0003
        MVI@    R3,     R0                      ; 57EE   0298
        SWAP    R0,     1                       ; 57EF   0040
        XORI    #$00FF, R0                      ; 57F0   03F8 00FF
        INCR    R0                              ; 57F2   0008
        MVO@    R0,     R3                      ; 57F3   0258
        SUBI    #$0004, R3                      ; 57F4   033B 0004
        MVI@    R3,     R0                      ; 57F6   0298
        XORI    #$0200, R0                      ; 57F7   03F8 0200
        MVO@    R0,     R3                      ; 57F9   0258
        PULR    R7                              ; 57FA   02B7

L_57FB:
        MOVR    R3,     R1                      ; 57FB   0099

        JSR     R5,     L_581F                  ; 57FC   0004 0158 001F

L_57FF:
        PULR    R7                              ; 57FF   02B7

L_5800:
        PSHR    R5                              ; 5800   0275
        MVI     G_017B, R2                      ; 5801   0282 017B
        TSTR    R2                              ; 5803   0092
        BNEQ    L_5819                          ; 5804   020C 0013

        JSR     R5,     L_581F                  ; 5806   0004 0158 001F

        MOVR    R3,     R0                      ; 5809   0098

        JSR     R5,     .EXEC.76C               ; 580A   0004 0114 036C

        INCR    R1                              ; 580D   0009
        MVI@    R1,     R2                      ; 580E   028A
        SDBD                                    ; 580F   0001
        CMPI    #$5D57, R2                      ; 5810   037A 0057 005D
        BEQ     L_5819                          ; 5813   0204 0004

        DECR    R1                              ; 5815   0011

        JSR     R5,     L_581F                  ; 5816   0004 0158 001F

L_5819:
        PULR    R7                              ; 5819   02B7

        CMP     G_0175, R3                      ; 581A   0343 0175
        BNEQ    L_5800                          ; 581C   022C 001D
        MOVR    R5,     R7                      ; 581E   00AF

L_581F:
        PSHR    R5                              ; 581F   0275
        PSHR    R0                              ; 5820   0270

        JSR     R5,     L_5D80                  ; 5821   0004 015C 0180
        JSR     R5,     .EXEC.766               ; 5824   0004 0114 0366

        XOR     G_0170, R0                      ; 5827   03C0 0170
        BNEQ    L_582F                          ; 5829   020C 0004

        MVO     R0,     G_0170                  ; 582B   0240 0170
        MVO     R0,     .PSG0.chn_c_vol         ; 582D   0240 01FD
L_582F:
        SDBD                                    ; 582F   0001
        MVII    #$588A, R0                      ; 5830   02B8 008A 0058
        MVO@    R0,     R1                      ; 5833   0248
        INCR    R1                              ; 5834   0009
        SDBD                                    ; 5835   0001
        MVII    #$5D57, R0                      ; 5836   02B8 0057 005D
        MVO@    R0,     R1                      ; 5839   0248
        ADDI    #$0003, R1                      ; 583A   02F9 0003
        CLRR    R0                              ; 583C   01C0
        MVO@    R0,     R1                      ; 583D   0248
        INCR    R1                              ; 583E   0009
        MVII    #$03F5, R0                      ; 583F   02B8 03F5
        MVO@    R0,     R1                      ; 5841   0248
        INCR    R1                              ; 5842   0009
        MVII    #$0009, R0                      ; 5843   02B8 0009
        MVO@    R0,     R1                      ; 5845   0248
        PULR    R0                              ; 5846   02B0
        PULR    R7                              ; 5847   02B7

L_5848:
        PSHR    R5                              ; 5848   0275
        MVI     G_017B, R0                      ; 5849   0280 017B
        XOR     G_017C, R0                      ; 584B   03C0 017C
        BNEQ    L_58B1                          ; 584D   020C 0062

        MVII    #$016B, R4                      ; 584F   02BC 016B
        MVO@    R0,     R4                      ; 5851   0260
        MVO@    R0,     R4                      ; 5852   0260
        MVO@    R0,     R4                      ; 5853   0260
        MVO@    R0,     R4                      ; 5854   0260
        INCR    R0                              ; 5855   0008
        MVO     R0,     G_017B                  ; 5856   0240 017B

        JSR     R5,     L_56EB                  ; 5858   0004 0154 02EB
        JSR     R5,     L_56CC                  ; 585B   0004 0154 02CC

        MVII    #$0003, R3                      ; 585E   02BB 0003
        MVII    #$0335, R4                      ; 5860   02BC 0335
L_5862:
        SDBD                                    ; 5862   0001
        MVII    #$100F, R0                      ; 5863   02B8 000F 0010
        MVO@    R0,     R4                      ; 5866   0260
        SDBD                                    ; 5867   0001
        MVII    #$5D38, R0                      ; 5868   02B8 0038 005D
        MVO@    R0,     R4                      ; 586B   0260
        MVI     G_031F, R0                      ; 586C   0280 031F
        MVO@    R0,     R4                      ; 586E   0260
        MVI     G_0320, R0                      ; 586F   0280 0320
        MVO@    R0,     R4                      ; 5871   0260
        MOVR    R3,     R1                      ; 5872   0099
        SUBI    #$0003, R1                      ; 5873   0339 0003
        SLL     R1,     1                       ; 5875   0049
        MVI     G_015D, R0                      ; 5876   0280 015D
        TSTR    R0                              ; 5878   0080
        BEQ     L_5881                          ; 5879   0204 0006

        MVII    #$0004, R0                      ; 587B   02B8 0004

        JSR     R5,     X_RAND1                 ; 587D   0004 0114 027D

        MOVR    R0,     R1                      ; 5880   0081

L_5881:
        JSR     R5,     .EXEC.628               ; 5881   0004 0114 0228

        CLRC                                    ; 5884   0006
        MVO@    R0,     R4                      ; 5885   0260
        INCR    R3                              ; 5886   000B
        ADDI    #$0003, R4                      ; 5887   02FC 0003
        CMPI    #$0008, R3                      ; 5889   037B 0008
        BLT     L_5862                          ; 588B   0225 002A

        MVII    #$0028, R0                      ; 588D   02B8 0028
        SUB     G_0167, R0                      ; 588F   0300 0167
        MVO     R0,     G_0323                  ; 5891   0240 0323

        JSR     R5,     L_5D91                  ; 5893   0004 015C 0191

        SDBD                                    ; 5896   0001
        MVII    #$1906, R0                      ; 5897   02B8 0006 0019
        MVO     R0,     G_035D                  ; 589A   0240 035D
        MVI     G_015D, R0                      ; 589C   0280 015D
        TSTR    R0                              ; 589E   0080
        BEQ     L_58A4                          ; 589F   0204 0003

        CLRR    R0                              ; 58A1   01C0
        B       L_58A7                          ; 58A2   0200 0003

L_58A4:
        MVII    #$0064, R0                      ; 58A4   02B8 0064
        NEGR    R0                              ; 58A6   0020

L_58A7:
        JSR     R5,     L_5924                  ; 58A7   0004 0158 0124

        MVII    #$0002, R0                      ; 58AA   02B8 0002
        MVO     R0,     G_015F                  ; 58AC   0240 015F

        JSR     R5,     L_5A8A                  ; 58AE   0004 0158 028A

L_58B1:
        PULR    R7                              ; 58B1   02B7

L_58B2:
        PSHR    R5                              ; 58B2   0275

        JSR     R5,     L_56CC                  ; 58B3   0004 0154 02CC

        CLRR    R0                              ; 58B6   01C0
        MVO     R0,     G_017B                  ; 58B7   0240 017B

        JSR     R5,     L_56F5                  ; 58B9   0004 0154 02F5
        JSR     R5,     L_5DB9                  ; 58BC   0004 015C 01B9

        MVI     G_0344, R0                      ; 58BF   0280 0344
        INCR    R0                              ; 58C1   0008
        MVO     R0,     G_0344                  ; 58C2   0240 0344
        CLRR    R0                              ; 58C4   01C0

        JSR     R5,     L_5924                  ; 58C5   0004 0158 0124

        MVI     G_034C, R0                      ; 58C8   0280 034C
        TSTR    R0                              ; 58CA   0080
        BNEQ    L_58D1                          ; 58CB   020C 0004

        JSR     R5,     L_5A23                  ; 58CD   0004 0158 0223

        PULR    R7                              ; 58D0   02B7

L_58D1:
        MOVR    R1,     R4                      ; 58D1   008C
        MVI@    R1,     R0                      ; 58D2   0288
        SDBD                                    ; 58D3   0001
        XORI    #$1808, R0                      ; 58D4   03F8 0008 0018
        MVO@    R0,     R4                      ; 58D7   0260
        INCR    R4                              ; 58D8   000C
        MVII    #$0053, R0                      ; 58D9   02B8 0053
        SWAP    R0,     1                       ; 58DB   0040
        MVO@    R0,     R4                      ; 58DC   0260
        INCR    R4                              ; 58DD   000C
        CLRR    R0                              ; 58DE   01C0
        MVO@    R0,     R4                      ; 58DF   0260

        JSR     R5,     L_5A6F                  ; 58E0   0004 0158 026F

        SDBD                                    ; 58E3   0001
        MVII    #$518D, R0                      ; 58E4   02B8 008D 0051
        MVO     R0,     G_035D                  ; 58E7   0240 035D
        PULR    R7                              ; 58E9   02B7

        PSHR    R5                              ; 58EA   0275

        JSR     R5,     L_5DB9                  ; 58EB   0004 015C 01B9

        PSHR    R1                              ; 58EE   0271
        MVII    #$0014, R0                      ; 58EF   02B8 0014
        MVII    #$0001, R1                      ; 58F1   02B9 0001
        MVII    #$0004, R2                      ; 58F3   02BA 0004
        MVII    #$02C8, R4                      ; 58F5   02BC 02C8

        JSR     R5,     L_570F                  ; 58F7   0004 0154 030F

        PULR    R1                              ; 58FA   02B1
        MVI     G_015F, R0                      ; 58FB   0280 015F
        CMPI    #$0002, R0                      ; 58FD   0378 0002
        BNEQ    L_5913                          ; 58FF   020C 0012

        JSR     R5,     L_58B2                  ; 5901   0004 0158 00B2

        MVI     G_017C, R0                      ; 5904   0280 017C
        TSTR    R0                              ; 5906   0080
        BNEQ    L_5923                          ; 5907   020C 001A

        MVII    #$0033, R0                      ; 5909   02B8 0033
        SWAP    R0,     1                       ; 590B   0040
        MVO     R0,     G_0320                  ; 590C   0240 0320
        MVII    #$0004, R0                      ; 590E   02B8 0004

        JSR     R5,     L_54B9                  ; 5910   0004 0154 00B9

L_5913:
        CLRR    R0                              ; 5913   01C0
        MVO     R0,     G_017B                  ; 5914   0240 017B

        JSR     R5,     L_56F5                  ; 5916   0004 0154 02F5

        DECR    R0                              ; 5919   0010

        JSR     R5,     L_54EB                  ; 591A   0004 0154 00EB

        SDBD                                    ; 591D   0001
        MVII    #$5197, R2                      ; 591E   02BA 0097 0051
        MVO     R2,     G_035D                  ; 5921   0242 035D
L_5923:
        PULR    R7                              ; 5923   02B7

L_5924:
        PSHR    R5                              ; 5924   0275

        JSR     R5,     .EXEC.7C1               ; 5925   0004 0114 03C1

        MOVR    R0,     R2                      ; 5928   0082
        MVI     G_017C, R0                      ; 5929   0280 017C
        TSTR    R0                              ; 592B   0080
        BNEQ    L_59F7                          ; 592C   020C 00C9

        MVI     G_0168, R1                      ; 592E   0281 0168
        MOVR    R2,     R0                      ; 5930   0090

        JSR     R5,     X_MPY                   ; 5931   0004 011C 01DC

        MVI     G_0324, R0                      ; 5934   0280 0324
        ADDR    R2,     R0                      ; 5936   00D0
        MVI     G_032C, R1                      ; 5937   0281 032C
L_5939:
        TSTR    R0                              ; 5939   0080
        BPL     L_5944                          ; 593A   0203 0008

        TSTR    R1                              ; 593C   0089
        BEQ     L_594D                          ; 593D   0204 000E

        ADDI    #$03E8, R0                      ; 593F   02F8 03E8
        DECR    R1                              ; 5941   0011
        B       L_5939                          ; 5942   0220 000A

L_5944:
        CMPI    #$03E8, R0                      ; 5944   0378 03E8
        BLT     L_594D                          ; 5946   0205 0005

        SUBI    #$03E8, R0                      ; 5948   0338 03E8
        INCR    R1                              ; 594A   0009
        B       L_5939                          ; 594B   0220 0013

L_594D:
        MVO     R0,     G_0324                  ; 594D   0240 0324
        MVO     R1,     G_032C                  ; 594F   0241 032C
        MVI     G_017B, R2                      ; 5951   0282 017B
        XORI    #$0001, R2                      ; 5953   03FA 0001
        AND     G_015D, R2                      ; 5955   0382 015D
        TSTR    R2                              ; 5957   0092
        BNEQ    L_5963                          ; 5958   020C 0009

        MVII    #$0007, R3                      ; 595A   02BB 0007
        MVI     G_0161, R4                      ; 595C   0284 0161
        ADDI    #$0202, R4                      ; 595E   02FC 0202

        JSR     R5,     L_59F8                  ; 5960   0004 0158 01F8

L_5963:
        MVI     G_033C, R1                      ; 5963   0281 033C
        MVI     G_032C, R0                      ; 5965   0280 032C
        CMPR    R0,     R1                      ; 5967   0141
        BEQ     L_5974                          ; 5968   0204 000A
        BGT     L_597D                          ; 596A   020E 0011

        MVO     R0,     G_033C                  ; 596C   0240 033C
        MVI     G_0324, R0                      ; 596E   0280 0324
        MVO     R0,     G_0334                  ; 5970   0240 0334
        B       L_597D                          ; 5972   0200 0009

L_5974:
        MVI     G_0334, R1                      ; 5974   0281 0334
        MVI     G_0324, R0                      ; 5976   0280 0324
        CMPR    R0,     R1                      ; 5978   0141
        BGE     L_597D                          ; 5979   020D 0002

        MVO     R0,     G_0334                  ; 597B   0240 0334
L_597D:
        SDBD                                    ; 597D   0001
        MVII    #$5B46, R4                      ; 597E   02BC 0046 005B
        CLRR    R0                              ; 5981   01C0
L_5982:
        MVI@    R4,     R1                      ; 5982   02A1
        CMP     G_032C, R1                      ; 5983   0341 032C
        BGT     L_598C                          ; 5985   020E 0005

        INCR    R0                              ; 5987   0008
        CMPI    #$0013, R0                      ; 5988   0378 0013
        BNEQ    L_5982                          ; 598A   022C 0009

L_598C:
        SDBD                                    ; 598C   0001
        MVII    #$5B59, R3                      ; 598D   02BB 0059 005B
        ADDR    R0,     R3                      ; 5990   00C3
        MVI@    R3,     R3                      ; 5991   029B
        MVO     R3,     G_0168                  ; 5992   0243 0168
        SDBD                                    ; 5994   0001
        ADDI    #$52C6, R3                      ; 5995   02FB 00C6 0052
        MVI@    R3,     R3                      ; 5998   029B
        MVO     R3,     G_0166                  ; 5999   0243 0166
        MVI     G_0167, R1                      ; 599B   0281 0167
        MVO     R0,     G_0167                  ; 599D   0240 0167
        CMPR    R1,     R0                      ; 599F   0148
        BEQ     L_59AB                          ; 59A0   0204 0009

        MVI     G_015F, R1                      ; 59A2   0281 015F
        CMPI    #$0002, R1                      ; 59A4   0379 0002
        BEQ     L_59AB                          ; 59A6   0204 0003

        JSR     R5,     L_5A6F                  ; 59A8   0004 0158 026F

L_59AB:
        TSTR    R2                              ; 59AB   0092
        BNEQ    L_59BE                          ; 59AC   020C 0010

        MVI     G_0168, R0                      ; 59AE   0280 0168
        ADDI    #$0010, R0                      ; 59B0   02F8 0010
        SLL     R0,     2                       ; 59B2   004C
        SLL     R0,     1                       ; 59B3   0048
        XORI    #$0007, R0                      ; 59B4   03F8 0007
        MVI     G_0161, R4                      ; 59B6   0284 0161
        ADDI    #$0211, R4                      ; 59B8   02FC 0211
        MVO@    R0,     R4                      ; 59BA   0260
        MVII    #$02C7, R0                      ; 59BB   02B8 02C7
        MVO@    R0,     R4                      ; 59BD   0260
L_59BE:
        MVI     G_033C, R0                      ; 59BE   0280 033C
        ADDI    #$0005, R0                      ; 59C0   02F8 0005
        SUB     G_0344, R0                      ; 59C2   0300 0344
        MVO     R0,     G_034C                  ; 59C4   0240 034C
        MOVR    R0,     R1                      ; 59C6   0081
        TSTR    R2                              ; 59C7   0092
        BNEQ    L_59F7                          ; 59C8   020C 002D

        MVII    #$0008, R0                      ; 59CA   02B8 0008
        MVI     G_0161, R4                      ; 59CC   0284 0161
        ADDI    #$0209, R4                      ; 59CE   02FC 0209

        JSR     R5,     X_FILL_ZERO             ; 59D0   0004 0114 0338

        SUBI    #$0001, R1                      ; 59D3   0339 0001
        BLE     L_59F7                          ; 59D5   0206 0020

        MOVR    R1,     R0                      ; 59D7   0088
        MVII    #$0008, R1                      ; 59D8   02B9 0008
        ADD     G_015D, R1                      ; 59DA   02C1 015D
        SLL     R1,     2                       ; 59DC   004D
        SLL     R1,     1                       ; 59DD   0049
        SDBD                                    ; 59DE   0001
        XORI    #$0805, R1                      ; 59DF   03F9 0005 0008
        MVI     G_0161, R4                      ; 59E2   0284 0161
        ADDI    #$020A, R4                      ; 59E4   02FC 020A
        CMPI    #$0007, R0                      ; 59E6   0378 0007
        BGT     L_59EF                          ; 59E8   020E 0005

        JSR     R5,     X_FILL_MEM              ; 59EA   0004 0114 0341

        B       L_59F7                          ; 59ED   0200 0008

L_59EF:
        MVO@    R1,     R4                      ; 59EF   0261
        MVII    #$0004, R1                      ; 59F0   02B9 0004
        MVII    #$0005, R3                      ; 59F2   02BB 0005

        JSR     R5,     X_PRNUM_LFT             ; 59F4   0004 0118 009E

L_59F7:
        PULR    R7                              ; 59F7   02B7

L_59F8:
        PSHR    R5                              ; 59F8   0275
        TSTR    R1                              ; 59F9   0089
        BEQ     L_5A0B                          ; 59FA   0204 000F

        PSHR    R0                              ; 59FC   0270
        MOVR    R1,     R0                      ; 59FD   0088
        MVII    #$0004, R1                      ; 59FE   02B9 0004

        JSR     R5,     X_PRNUM_RGT             ; 5A00   0004 0118 00C5

        PULR    R0                              ; 5A03   02B0
        DECR    R1                              ; 5A04   0011
        ADDI    #$0004, R4                      ; 5A05   02FC 0004

        JSR     R5,     X_PRNUM_ZRO             ; 5A07   0004 0118 00AD

        PULR    R7                              ; 5A0A   02B7

L_5A0B:
        PSHR    R0                              ; 5A0B   0270
        MVII    #$0004, R0                      ; 5A0C   02B8 0004

        JSR     R5,     X_FILL_ZERO             ; 5A0E   0004 0114 0338

        PULR    R0                              ; 5A11   02B0
        TSTR    R0                              ; 5A12   0080
        BMI     L_5A1B                          ; 5A13   020B 0006

        MVII    #$0003, R1                      ; 5A15   02B9 0003

        JSR     R5,     X_PRNUM_RGT             ; 5A17   0004 0118 00C5

        PULR    R7                              ; 5A1A   02B7

L_5A1B:
        MVII    #$0005, R1                      ; 5A1B   02B9 0005
        SUBI    #$0002, R4                      ; 5A1D   033C 0002

        JSR     R5,     X_PRNUM_RGT             ; 5A1F   0004 0118 00C5

        PULR    R7                              ; 5A22   02B7

L_5A23:
        PSHR    R5                              ; 5A23   0275
        MVI     G_017C, R0                      ; 5A24   0280 017C
        TSTR    R0                              ; 5A26   0080
        BNEQ    L_5A6E                          ; 5A27   020C 0045

        MVO     R0,     G_017B                  ; 5A29   0240 017B

        JSR     R5,     L_56CC                  ; 5A2B   0004 0154 02CC

        SDBD                                    ; 5A2E   0001
        MVII    #$5048, R1                      ; 5A2F   02B9 0048 0050

        JSR     R5,     X_TIMER_STOP            ; 5A32   0004 0118 0038

        MVII    #$01F0, R4                      ; 5A35   02BC 01F0
        MVII    #$000E, R0                      ; 5A37   02B8 000E

        JSR     R5,     X_FILL_ZERO             ; 5A39   0004 0114 0338

        MVII    #$0007, R3                      ; 5A3C   02BB 0007
        MVII    #$0252, R4                      ; 5A3E   02BC 0252

        JSR     R5,     X_PRINT_R5              ; 5A40   0004 0118 007B
        STRING  "Game Over"                     ; 5A43  
        DECLE   $0000                           ; 5A4C   0000

        MVII    #$027A, R4                      ; 5A4D   02BC 027A

        JSR     R5,     X_PRINT_R5              ; 5A4F   0004 0118 007B
        STRING  "Peak Score"                    ; 5A52  
        DECLE   $0000                           ; 5A5C   0000

        MVI     G_0334, R0                      ; 5A5D   0280 0334
        MVI     G_033C, R1                      ; 5A5F   0281 033C

        JSR     R5,     L_59F8                  ; 5A61   0004 0158 01F8

        SDBD                                    ; 5A64   0001
        MVII    #$1906, R0                      ; 5A65   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5A68   0240 035D
        MVII    #$0001, R0                      ; 5A6A   02B8 0001
        MVO     R0,     G_017C                  ; 5A6C   0240 017C
L_5A6E:
        PULR    R7                              ; 5A6E   02B7

L_5A6F:
        PSHR    R5                              ; 5A6F   0275
        MVI     G_0168, R1                      ; 5A70   0281 0168
        MVI     G_015D, R0                      ; 5A72   0280 015D
        TSTR    R0                              ; 5A74   0080
        BEQ     L_5A79                          ; 5A75   0204 0002

        MVII    #$0006, R1                      ; 5A77   02B9 0006
L_5A79:
        SDBD                                    ; 5A79   0001
        ADDI    #$5A83, R1                      ; 5A7A   02F9 0083 005A
        MVI@    R1,     R0                      ; 5A7D   0288
        MVO     R0,     G_015F                  ; 5A7E   0240 015F

        JSR     R5,     L_5A8A                  ; 5A80   0004 0158 028A

        PULR    R7                              ; 5A83   02B7

        DECLE   $0000,  $0001                   ; 5A84   0000 0001

        INCR    R7                              ; 5A86   000F

        INCR    R1                              ; 5A87   0009
L_5A88:
        INCR    R0                              ; 5A88   0008
        DECLE   $0000                           ; 5A89   0000
L_5A8A:
        PSHR    R5                              ; 5A8A   0275
        MVO     R0,     G_0160                  ; 5A8B   0240 0160
        DIS                                     ; 5A8D   0003
        SDBD                                    ; 5A8E   0001
        MVII    #$009C, R0                      ; 5A8F   02B8 009C 0000
        MVO     R0,     .ISRVEC.0               ; 5A92   0240 0100
        SDBD                                    ; 5A94   0001
        MVII    #$005A, R0                      ; 5A95   02B8 005A 0000
        MVO     R0,     .ISRVEC.1               ; 5A98   0240 0101
        EIS                                     ; 5A9A   0002
        PULR    R7                              ; 5A9B   02B7

        MVI     G_0160, R0                      ; 5A9C   0280 0160
        MVO     R0,     .STIC.CS.0              ; 5A9E   0240 0028
        MVO     R0,     .STIC.BORD              ; 5AA0   0240 002C
        MVO     R0,     G_0106                  ; 5AA2   0240 0106
        MVI     G_015D, R0                      ; 5AA4   0280 015D
        SLL     R0,     1                       ; 5AA6   0048
        ADD     G_015D, R0                      ; 5AA7   02C0 015D
        MVO     R0,     .STIC.EDGE              ; 5AA9   0240 0032
        MVI     G_0162, R0                      ; 5AAB   0280 0162
        MVO     R0,     .ISRVEC.0               ; 5AAD   0240 0100
        MVI     G_0163, R0                      ; 5AAF   0280 0163
        MVO     R0,     .ISRVEC.1               ; 5AB1   0240 0101
        MVII    #$0162, R4                      ; 5AB3   02BC 0162
        SDBD                                    ; 5AB5   0001
        MVI@    R4,     R7                      ; 5AB6   02A7

        DECLE   $001E,  $0020,  $0022,  $0024   ; 5AB7   001E 0020 0022 0024
        DECLE   $0026,  $0028,  $002A,  $002C   ; 5ABB   0026 0028 002A 002C
        DECLE   $002E,  $0030,  $0032,  $0034   ; 5ABF   002E 0030 0032 0034
        DECLE   $0036,  $0038,  $003A,  $003C   ; 5AC3   0036 0038 003A 003C
        DECLE   $003E,  $0040,  $0042,  $0044   ; 5AC7   003E 0040 0042 0044
        DECLE   $0040,  $0050,  $0060,  $0070   ; 5ACB   0040 0050 0060 0070
        DECLE   $007F,  $0010,  $0012,  $0014   ; 5ACF   007F 0010 0012 0014
        DECLE   $0016,  $0018,  $001B,  $001E   ; 5AD3   0016 0018 001B 001E
        DECLE   $0021,  $0024,  $0026,  $0028   ; 5AD7   0021 0024 0026 0028
        DECLE   $002A,  $002C,  $002E,  $0030   ; 5ADB   002A 002C 002E 0030
        DECLE   $0032,  $0034,  $0036           ; 5ADF   0032 0034 0036

        RSWD    R0                              ; 5AE2   0038
        RSWD    R2                              ; 5AE3   003A
        DECR    R4                              ; 5AE4   0014
        INCR    R7                              ; 5AE5   000F

        INCR    R4                              ; 5AE6   000C
L_5AE7:
        INCR    R2                              ; 5AE7   000A
        DECLE   $000A,  $0008,  $0008,  $0007   ; 5AE8   000A 0008 0008 0007
        DECLE   $0007,  $0006,  $0006,  $0005   ; 5AEC   0007 0006 0006 0005
        DECLE   $0005,  $0005,  $0005,  $0005   ; 5AF0   0005 0005 0005 0005
        DECLE   $0004,  $0003,  $0002,  $0001   ; 5AF4   0004 0003 0002 0001
        DECLE   $001E,  $001B,  $0019,  $0016   ; 5AF8   001E 001B 0019 0016
        DECLE   $0014,  $0014,  $0012,  $0010   ; 5AFC   0014 0014 0012 0010
        DECLE   $000E,  $000C,  $000A,  $0008   ; 5B00   000E 000C 000A 0008
        DECLE   $0007,  $0006,  $0005,  $0004   ; 5B04   0007 0006 0005 0004
        DECLE   $0003,  $0002,  $0002,  $0002   ; 5B08   0003 0002 0002 0002
        DECLE   $0006,  $0005,  $0004,  $0003   ; 5B0C   0006 0005 0004 0003
        DECLE   $0002,  $0001,  $0001,  $0001   ; 5B10   0002 0001 0001 0001
        DECLE   $0001,  $0001,  $03E8,  $0320   ; 5B14   0001 0001 03E8 0320
        DECLE   $02BC,  $0258,  $0258,  $01F4   ; 5B18   02BC 0258 0258 01F4
        DECLE   $01F4,  $0190,  $0190,  $012C   ; 5B1C   01F4 0190 0190 012C
        DECLE   $012C,  $00FA,  $00C8,  $0096   ; 5B20   012C 00FA 00C8 0096
        DECLE   $0064,  $0050,  $0028,  $0014   ; 5B24   0064 0050 0028 0014
        DECLE   $0010,  $0008,  $0320,  $0320   ; 5B28   0010 0008 0320 0320
        DECLE   $0320,  $0320,  $0320,  $0258   ; 5B2C   0320 0320 0320 0258
        DECLE   $0258,  $01F4,  $01F4,  $0190   ; 5B30   0258 01F4 01F4 0190
        DECLE   $0190,  $012C,  $00F0,  $00A0   ; 5B34   0190 012C 00F0 00A0
        DECLE   $0078,  $0064,  $0050,  $0028   ; 5B38   0078 0064 0050 0028
        DECLE   $0005,  $0005,  $0005,  $0005   ; 5B3C   0005 0005 0005 0005
        DECLE   $0005,  $0004,  $0003,  $0002   ; 5B40   0005 0004 0003 0002
        DECLE   $0001,  $0001,  $0001,  $0002   ; 5B44   0001 0001 0001 0002
        DECLE   $0005                           ; 5B48   0005

        SETC                                    ; 5B49   0007
        INCR    R2                              ; 5B4A   000A
        INCR    R4                              ; 5B4B   000C
        INCR    R7                              ; 5B4C   000F

        DECR    R4                              ; 5B4D   0014
L_5B4E:
        COMR    R6                              ; 5B4E   001E
        DECLE   $0028,  $0032,  $004B,  $0064   ; 5B4F   0028 0032 004B 0064
        DECLE   $0096,  $00C8,  $012C,  $01F4   ; 5B53   0096 00C8 012C 01F4
        DECLE   $02EE,  $03E8,  $0001,  $0002   ; 5B57   02EE 03E8 0001 0002
        DECLE   $0002,  $0003,  $0003,  $0003   ; 5B5B   0002 0003 0003 0003
        DECLE   $0003,  $0003,  $0004,  $0004   ; 5B5F   0003 0003 0004 0004
        DECLE   $0004,  $0005,  $0005,  $0006   ; 5B63   0004 0005 0005 0006
        DECLE   $0006,  $0006,  $0006,  $0006   ; 5B67   0006 0006 0006 0006
        DECLE   $0006,  $0006                   ; 5B6B   0006 0006
.GFX_LIST_5B6D:
        DECLE   $0000,  $0000,  $0000,  $0004   ; 5B6D  CART PIC #00
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B71  
        DECLE   $0000,  $0000,  $0002,  $0000   ; 5B75  CART PIC #01
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B79  
        DECLE   $0000,  $0002,  $0000,  $0000   ; 5B7D  CART PIC #02
        DECLE   $0000,  $0000,  $0000,  $0080   ; 5B81  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B85  CART PIC #03
        DECLE   $0000,  $0006,  $0000,  $0000   ; 5B89  
        DECLE   $0010,  $0010,  $0010,  $0038   ; 5B8D  CART PIC #04
        DECLE   $007C,  $00EE,  $00FE,  $0044   ; 5B91  
        DECLE   $0010,  $0054,  $0038,  $006C   ; 5B95  CART PIC #05
        DECLE   $0038,  $007C,  $00FE,  $00AA   ; 5B99  
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5B9D   0018 0018 0018 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BA1   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5BA5   0018 0018 0018 0018
        DECLE   $0018,  $0000,  $0000,  $0000   ; 5BA9   0018 0000 0000 0000
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5BAD   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0000,  $0000   ; 5BB1   0018 0018 0000 0000
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5BB5   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0000   ; 5BB9   0018 0018 0018 0000
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5BBD   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5BC1   0018 0018 0018 0018
        DECLE   $004C,  $007C,  $0076,  $00AE   ; 5BC5   004C 007C 0076 00AE
        DECLE   $00FC,  $007F,  $005A,  $0030   ; 5BC9   00FC 007F 005A 0030
        DECLE   $0076,  $00FF                   ; 5BCD   0076 00FF

        SARC    R2,     1                       ; 5BCF   007A
        ADCR    R7                              ; 5BD0   002F
        INCR    R7                              ; 5BD1   000F

L_5BD2:
        RSWD    R4                              ; 5BD2   003C
L_5BD3:
        SARC    R2,     2                       ; 5BD3   007E
        DECLE   $002C,  $0068,  $00FC,  $007C   ; 5BD4   002C 0068 00FC 007C
        DECLE   $003E,  $007A,  $00DE,  $00FC   ; 5BD8   003E 007A 00DE 00FC
        DECLE   $0038,  $007C,  $007E,  $007E   ; 5BDC   0038 007C 007E 007E
        DECLE   $0037,  $003F                   ; 5BE0   0037 003F

        ADDR    R7,     R2                      ; 5BE2   00FA
        ADDR    R5,     R7                      ; 5BE3   00EF

        SLR     R2,     2                       ; 5BE4   0066
        NEGR    R0                              ; 5BE5   0020
        SARC    R0,     1                       ; 5BE6   0078
        ADDR    R5,     R4                      ; 5BE7   00EC
        ADDR    R7,     R6                      ; 5BE8   00FE
        SARC    R0,     1                       ; 5BE9   0078
        SLLC    R3,     2                       ; 5BEA   005F
        ADCR    R7                              ; 5BEB   002F

        RSWD    R2                              ; 5BEC   003A
L_5BED:
        SARC    R0,     2                       ; 5BED   007C
        DECLE   $007F,  $00FD,  $00DA,  $006E   ; 5BEE   007F 00FD 00DA 006E
        DECLE   $007E,  $003A,  $0010,  $000C   ; 5BF2   007E 003A 0010 000C
        DECLE   $003C,  $007E,  $0076,  $007F   ; 5BF6   003C 007E 0076 007F
        DECLE   $00FF,  $00FA,  $003C,  $007C   ; 5BFA   00FF 00FA 003C 007C
        DECLE   $007E,  $006F,  $00FF,  $00FE   ; 5BFE   007E 006F 00FF 00FE
        DECLE   $007E,  $006C,  $0020,  $0018   ; 5C02   007E 006C 0020 0018
        DECLE   $0018,  $003C,  $0024,  $0024   ; 5C06   0018 003C 0024 0024
        DECLE   $003C,  $0018,  $0018,  $0000   ; 5C0A   003C 0018 0018 0000
        DECLE   $0006,  $001E,  $0024,  $0024   ; 5C0E   0006 001E 0024 0024
        DECLE   $0078,  $0060,  $0000,  $0000   ; 5C12   0078 0060 0000 0000
        DECLE   $0000                           ; 5C16   0000

        RSWD    R4                              ; 5C17   003C
        ADDR    R4,     R7                      ; 5C18   00E7
        ADDR    R4,     R7                      ; 5C19   00E7

        DECLE   $003C,  $0000,  $0000,  $0000   ; 5C1A   003C 0000 0000 0000
        DECLE   $0060,  $0078,  $0024,  $0024   ; 5C1E   0060 0078 0024 0024
        DECLE   $001E,  $0006,  $0000,  $0000   ; 5C22   001E 0006 0000 0000
        DECLE   $0000,  $0024,  $0018,  $0018   ; 5C26   0000 0024 0018 0018
        DECLE   $0024,  $0000,  $0000,  $0000   ; 5C2A   0024 0000 0000 0000
        DECLE   $0042,  $003C,  $0024,  $0024   ; 5C2E   0042 003C 0024 0024
        DECLE   $003C,  $0042,  $0000,  $0000   ; 5C32   003C 0042 0000 0000
        DECLE   $003C,  $0066,  $005A,  $005A   ; 5C36   003C 0066 005A 005A
        DECLE   $0066,  $003C,  $0000,  $003C   ; 5C3A   0066 003C 0000 003C
        DECLE   $0000,  $0099,  $00A5,  $00A5   ; 5C3E   0000 0099 00A5 00A5
        DECLE   $0099,  $0000,  $003C,  $0042   ; 5C42   0099 0000 003C 0042
        DECLE   $0099,  $0024,  $0042,  $0042   ; 5C46   0099 0024 0042 0042
        DECLE   $0024,  $0099,  $0042,  $0099   ; 5C4A   0024 0099 0042 0099
        DECLE   $0042,  $0000,  $0081,  $0081   ; 5C4E   0042 0000 0081 0081
        DECLE   $0000,  $0042,  $0099,  $0000   ; 5C52   0000 0042 0099 0000
        DECLE   $0000,  $0000,  $0010,  $0010   ; 5C56   0000 0000 0010 0010
        DECLE   $007C,  $0010,  $0010,  $0000   ; 5C5A   007C 0010 0010 0000
        DECLE   $0000,  $0000,  $0010,  $0038   ; 5C5E   0000 0000 0010 0038
        DECLE   $007C,  $0038,  $0010,  $0000   ; 5C62   007C 0038 0010 0000
        DECLE   $0000,  $0000,  $0038,  $007C   ; 5C66   0000 0000 0038 007C
        DECLE   $007C,  $007C,  $0038,  $0000   ; 5C6A   007C 007C 0038 0000
        DECLE   $0000,  $0000                   ; 5C6E   0000 0000

        DECR    R0                              ; 5C70   0010
        RSWD    R0                              ; 5C71   0038
        SARC    R0,     2                       ; 5C72   007C
        RSWD    R0                              ; 5C73   0038
        DECR    R0                              ; 5C74   0010
        DECR    R0                              ; 5C75   0010
        DECR    R0                              ; 5C76   0010
        DECR    R0                              ; 5C77   0010
        DECR    R0                              ; 5C78   0010
        DECR    R0                              ; 5C79   0010
        DECR    R0                              ; 5C7A   0010
        DECR    R0                              ; 5C7B   0010
        RSWD    R0                              ; 5C7C   0038
        RSWD    R0                              ; 5C7D   0038
        SARC    R0,     2                       ; 5C7E   007C
        SAR     R0,     2                       ; 5C7F   006C
        ADDR    R5,     R6                      ; 5C80   00EE
        ADDR    R7,     R6                      ; 5C81   00FE
        ADDR    R7,     R6                      ; 5C82   00FE
        SWAP    R0,     2                       ; 5C83   0044
        SWAP    R0,     2                       ; 5C84   0044
        TSTR    R0                              ; 5C85   0080
        TSTR    R0                              ; 5C86   0080
        SWAP    R0,     1                       ; 5C87   0040
        SWAP    R0,     1                       ; 5C88   0040
        SWAP    R0,     1                       ; 5C89   0040
        NEGR    R0                              ; 5C8A   0020
        RRC     R0,     1                       ; 5C8B   0070
        RRC     R0,     1                       ; 5C8C   0070
        RSWD    R4                              ; 5C8D   003C
        SAR     R0,     2                       ; 5C8E   006C
        SAR     R2,     2                       ; 5C8F   006E
        SARC    R2,     2                       ; 5C90   007E
        SARC    R0,     1                       ; 5C91   0078
        NEGR    R0                              ; 5C92   0020
        NEGR    R0                              ; 5C93   0020
        NEGR    R0                              ; 5C94   0020
        TSTR    R0                              ; 5C95   0080
        TSTR    R0                              ; 5C96   0080
        SWAP    R0,     1                       ; 5C97   0040
        SWAP    R0,     1                       ; 5C98   0040
        GSWD    R0                              ; 5C99   0030
        GSWD    R0                              ; 5C9A   0030
        RSWD    R6                              ; 5C9B   003E
        RSWD    R6                              ; 5C9C   003E
L_5C9D:
        DECR    R7                              ; 5C9D   0017
L_5C9E:
        DECR    R7                              ; 5C9E   0017

        DECLE   $001C,  $001C,  $0018,  $0018   ; 5C9F   001C 001C 0018 0018
        DECLE   $0008,  $0008,  $0000,  $0000   ; 5CA3   0008 0008 0000 0000
        DECLE   $0080,  $00C0,  $006C,  $007F   ; 5CA7   0080 00C0 006C 007F
        DECLE   $003F,  $0016,  $0016,  $001C   ; 5CAB   003F 0016 0016 001C
        DECLE   $001C,  $001C,  $0008,  $0008   ; 5CAF   001C 001C 0008 0008
        DECLE   $0008,  $0000,  $0000,  $0000   ; 5CB3   0008 0000 0000 0000
        DECLE   $0000                           ; 5CB7   0000

        EIS                                     ; 5CB8   0002
        SETC                                    ; 5CB9   0007
        INCR    R7                              ; 5CBA   000F

        COMR    R6                              ; 5CBB   001E
L_5CBC:
        ADDR    R7,     R2                      ; 5CBC   00FA
        ADDR    R7,     R2                      ; 5CBD   00FA
        COMR    R6                              ; 5CBE   001E
        INCR    R7                              ; 5CBF   000F

        SETC                                    ; 5CC0   0007
L_5CC1:
        EIS                                     ; 5CC1   0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CC2   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $003C,  $003C   ; 5CC6   0000 0018 003C 003C
        DECLE   $0018,  $0000,  $0000,  $003C   ; 5CCA   0018 0000 0000 003C
        DECLE   $007E,  $00FF,  $00D5,  $00FF   ; 5CCE   007E 00FF 00D5 00FF
        DECLE   $003C,  $0000,  $0000,  $0018   ; 5CD2   003C 0000 0000 0018
        DECLE   $005A,  $00FF,  $00AB,  $007E   ; 5CD6   005A 00FF 00AB 007E
        DECLE   $0099,  $0000,  $0000,  $0099   ; 5CDA   0099 0000 0000 0099
        DECLE   $005A,  $00FF,  $00AB,  $007E   ; 5CDE   005A 00FF 00AB 007E
        DECLE   $005A,  $0000,  $0000,  $0000   ; 5CE2   005A 0000 0000 0000
        DECLE   $0000,  $0054,  $002A,  $0054   ; 5CE6   0000 0054 002A 0054
        DECLE   $002A,  $0000,  $0000,  $0300   ; 5CEA   002A 0000 0000 0300
        DECLE   $0000,  $00B2,  $0058,  $0001   ; 5CEE   0000 00B2 0058 0001
        DECLE   $0000,  $000A,  $0248,  $0158   ; 5CF2   0000 000A 0248 0158
        DECLE   $0148,  $0058,  $0148,  $0158   ; 5CF6   0148 0058 0148 0158
        DECLE   $0348,  $0058,  $0348,  $0158   ; 5CFA   0348 0058 0348 0158
        DECLE   $0300,  $0000,  $00EA,  $0058   ; 5CFE   0300 0000 00EA 0058
        DECLE   $0005,  $001C,  $000A,  $0248   ; 5D02   0005 001C 000A 0248
        DECLE   $0158,  $0148,  $0058,  $0148   ; 5D06   0158 0148 0058 0148
        DECLE   $0158,  $0348,  $0058,  $0348   ; 5D0A   0158 0348 0058 0348
        DECLE   $0158,  $025F,  $0056,  $0000   ; 5D0E   0158 025F 0056 0000
        DECLE   $0000,  $0005,  $0001,  $000A   ; 5D12   0000 0005 0001 000A
        DECLE   $025A,  $0157,  $015A,  $0057   ; 5D16   025A 0157 015A 0057
        DECLE   $015A,  $0157,  $035A,  $0057   ; 5D1A   015A 0157 035A 0057
        DECLE   $035A,  $0157,  $025F,  $0056   ; 5D1E   035A 0157 025F 0056
        DECLE   $0000,  $0000,  $0001,  $0026   ; 5D22   0000 0000 0001 0026
        DECLE   $000A,  $025A,  $0157,  $015A   ; 5D26   000A 025A 0157 015A
        DECLE   $0057,  $015A,  $0157,  $035A   ; 5D2A   0057 015A 0157 035A
        DECLE   $0057,  $035A,  $0157,  $03BA   ; 5D2E   0057 035A 0157 03BA
        DECLE   $0056,  $0000,  $0000,  $0008   ; 5D32   0056 0000 0000 0008
        DECLE   $0006,  $0000,  $025F,  $0056   ; 5D36   0006 0000 025F 0056
        DECLE   $0000,  $0000,  $0008,  $0006   ; 5D3A   0000 0000 0008 0006
        DECLE   $0000,  $03BA,  $0056,  $0000   ; 5D3E   0000 03BA 0056 0000
        DECLE   $0000,  $0004,  $000E,  $0000   ; 5D42   0000 0004 000E 0000
        DECLE   $035F,  $0056,  $0000,  $0000   ; 5D46   035F 0056 0000 0000

        JSR     R4,     .EXEC.80A               ; 5D4A   0004 0018 000A

        B       L_5EA7                          ; 5D4D   0200 0158

        DECLE   $0100,  $0058,  $0100,  $0158   ; 5D4F   0100 0058 0100 0158
        DECLE   $0300,  $0058,  $0300,  $0158   ; 5D53   0300 0058 0300 0158
        DECLE   $0100,  $0000,  $005F,  $0056   ; 5D57   0100 0000 005F 0056
        DECLE   $0006,  $0012,  $000A,  $025A   ; 5D5B   0006 0012 000A 025A
        DECLE   $0157,  $015A,  $0057,  $015A   ; 5D5F   0157 015A 0057 015A
        DECLE   $0157,  $035A,  $0057,  $035A   ; 5D63   0157 035A 0057 035A
        DECLE   $0157,  $025F,  $0056,  $0000   ; 5D67   0157 025F 0056 0000
        DECLE   $0000,  $0003,  $0027,  $0000   ; 5D6B   0000 0003 0027 0000
        DECLE   $035F,  $0056,  $00AE,  $0054   ; 5D6F   035F 0056 00AE 0054
        DECLE   $0001,  $002A,  $000A,  $021A   ; 5D73   0001 002A 000A 021A

        CMPR    R3,     R0                      ; 5D77   0158
        SUBR    R3,     R2                      ; 5D78   011A
        SLLC    R0,     1                       ; 5D79   0058
        SUBR    R3,     R2                      ; 5D7A   011A
        CMPR    R3,     R0                      ; 5D7B   0158
        SUB@    R3,     R2                      ; 5D7C   031A
        SLLC    R0,     1                       ; 5D7D   0058
        SUB@    R3,     R2                      ; 5D7E   031A
        CMPR    R3,     R0                      ; 5D7F   0158
L_5D80:
        PSHR    R5                              ; 5D80   0275

        JSR     R5,     .EXEC.7C1               ; 5D81   0004 0114 03C1
        JSR     R5,     X_PLAY_SFX1             ; 5D84   0004 0118 03BB
        DECLE   $0319                           ; 5D87  SFX data
        DECLE   $003C,  $03A0                   ; 5D88  SFX data
        DECLE   $00B7                           ; 5D8A  SFX data
        DECLE   $03ED                           ; 5D8B  SFX data
        DECLE   $000B                           ; 5D8C  SFX data
        DECLE   $008F,  $0021                   ; 5D8D  SFX data
        DECLE   $002D                           ; 5D8F  SFX data
        DECLE   $03CF                           ; 5D90  SFX end

L_5D91:
        PSHR    R5                              ; 5D91   0275

        JSR     R5,     .EXEC.7C1               ; 5D92   0004 0114 03C1
        JSR     R5,     X_PLAY_SFX2             ; 5D95   0004 0118 03BE
        DECLE   $00A0                           ; 5D98  SFX prio
        DECLE   $03ED                           ; 5D99  SFX data
        DECLE   $000F,  $03F4                   ; 5D9A  SFX data
        DECLE   $0079                           ; 5D9C  SFX data
        DECLE   $010C,  $0000                   ; 5D9D  SFX data
        DECLE   $03B7                           ; 5D9F  SFX data
        DECLE   $000B                           ; 5DA0  SFX data
        DECLE   $03CF                           ; 5DA1  SFX end

L_5DA2:
        PSHR    R5                              ; 5DA2   0275

        JSR     R5,     .EXEC.7C1               ; 5DA3   0004 0114 03C1
        JSR     R5,     X_PLAY_SFX2             ; 5DA6   0004 0118 03BE
        DECLE   $0090                           ; 5DA9  SFX prio
        DECLE   $03C0,  $0025                   ; 5DAA  SFX data
        DECLE   $03C8,  $0028                   ; 5DAC  SFX data
        DECLE   $03C4,  $002B                   ; 5DAE  SFX data
        DECLE   $0001,  $0007                   ; 5DB0  SFX data
        DECLE   $03DE                           ; 5DB2  SFX data
        DECLE   $0389                           ; 5DB3  SFX data
        DECLE   $008F,  $0017                   ; 5DB4  SFX data
        DECLE   $01CF                           ; 5DB6  SFX end


        B       L_5DBD                          ; 5DB7   0200 0004

L_5DB9:
        PSHR    R5                              ; 5DB9   0275

        JSR     R5,     .EXEC.7C1               ; 5DBA   0004 0114 03C1

L_5DBD:
        CLRR    R0                              ; 5DBD   01C0
        MVO     R0,     G_0149                  ; 5DBE   0240 0149
        MVO     R0,     G_0145                  ; 5DC0   0240 0145
        MVII    #$000E, R0                      ; 5DC2   02B8 000E
        MVII    #$01F0, R4                      ; 5DC4   02BC 01F0

        JSR     R5,     X_FILL_ZERO             ; 5DC6   0004 0114 0338

        MVII    #$0020, R0                      ; 5DC9   02B8 0020
        MVO     R0,     .PSG0.chn_c_lo          ; 5DCB   0240 01F2
        MVII    #$0031, R0                      ; 5DCD   02B8 0031
        MVO     R0,     .PSG0.chan_enable       ; 5DCF   0240 01F8
        MVII    #$0001, R0                      ; 5DD1   02B8 0001
        MVO     R0,     .PSG0.noise             ; 5DD3   0240 01F9
        MVII    #$0030, R0                      ; 5DD5   02B8 0030
        MVO     R0,     .PSG0.chn_a_vol         ; 5DD7   0240 01FB
        PULR    R7                              ; 5DD9   02B7

L_5DDA:
        PSHR    R5                              ; 5DDA   0275
        MVI     G_017B, R0                      ; 5DDB   0280 017B
        XOR     G_017C, R0                      ; 5DDD   03C0 017C
        BNEQ    L_5E41                          ; 5DDF   020C 0060

        MVI     .PSG0.noise,R0                  ; 5DE1   0280 01F9
        ANDI    #$001F, R0                      ; 5DE3   03B8 001F
        CMPI    #$0001, R0                      ; 5DE5   0378 0001
        BNEQ    L_5DFF                          ; 5DE7   020C 0016

        MVI     .PSG0.envelope,R0               ; 5DE9   0280 01FA
        ANDI    #$000F, R0                      ; 5DEB   03B8 000F
        CMPI    #$0008, R0                      ; 5DED   0378 0008
        BEQ     L_5DFF                          ; 5DEF   0204 000E

        MVII    #$0080, R0                      ; 5DF1   02B8 0080
        MVO     R0,     .PSG0.envlp_lo          ; 5DF3   0240 01F3
        MVII    #$0015, R0                      ; 5DF5   02B8 0015
        SUB     G_0167, R0                      ; 5DF7   0300 0167
        MVO     R0,     .PSG0.envlp_hi          ; 5DF9   0240 01F7
        MVII    #$0008, R0                      ; 5DFB   02B8 0008
        MVO     R0,     .PSG0.envelope          ; 5DFD   0240 01FA
L_5DFF:
        MVI     G_0175, R0                      ; 5DFF   0280 0175
        TSTR    R0                              ; 5E01   0080
        BEQ     L_5E12                          ; 5E02   0204 000E

        MVI     .PSG0.chn_b_vol,R0              ; 5E04   0280 01FC
        ANDI    #$003F, R0                      ; 5E06   03B8 003F
        CMPI    #$000F, R0                      ; 5E08   0378 000F
        BEQ     L_5E41                          ; 5E0A   0204 0035

        MVII    #$005D, R0                      ; 5E0C   02B8 005D
        MVII    #$000A, R4                      ; 5E0E   02BC 000A
        B       L_5E3A                          ; 5E10   0200 0028

L_5E12:
        MVI     G_016F, R2                      ; 5E12   0282 016F
        TSTR    R2                              ; 5E14   0092
        BNEQ    L_5E1B                          ; 5E15   020C 0004

        MVO     R2,     .PSG0.chn_b_vol         ; 5E17   0242 01FC
        B       L_5E41                          ; 5E19   0200 0026

L_5E1B:
        CLRR    R3                              ; 5E1B   01DB
        MVII    #$0009, R4                      ; 5E1C   02BC 0009
        MVII    #$0001, R0                      ; 5E1E   02B8 0001
        NEGR    R0                              ; 5E20   0020
L_5E21:
        INCR    R0                              ; 5E21   0008
        SARC    R2,     1                       ; 5E22   007A
        BNC     L_5E30                          ; 5E23   0209 000B

        INCR    R4                              ; 5E25   000C

        JSR     R5,     .EXEC.76C               ; 5E26   0004 0114 036C

        ADDI    #$0003, R1                      ; 5E29   02F9 0003
        MVI@    R1,     R1                      ; 5E2B   0289
        CMPR    R1,     R3                      ; 5E2C   014B
        BPL     L_5E21                          ; 5E2D   0223 000D

        MOVR    R1,     R3                      ; 5E2F   008B
L_5E30:
        TSTR    R2                              ; 5E30   0092
        BNEQ    L_5E21                          ; 5E31   022C 0011

        MOVR    R3,     R0                      ; 5E33   0098
        SWAP    R0,     1                       ; 5E34   0040
        ANDI    #$00FF, R0                      ; 5E35   03B8 00FF
        SLL     R0,     1                       ; 5E37   0048
        ADDI    #$0064, R0                      ; 5E38   02F8 0064
L_5E3A:
        MVO     R0,     .PSG0.chn_b_lo          ; 5E3A   0240 01F1
        SWAP    R0,     1                       ; 5E3C   0040
        MVO     R0,     .PSG0.chn_b_hi          ; 5E3D   0240 01F5
        MVO     R4,     .PSG0.chn_b_vol         ; 5E3F   0244 01FC
L_5E41:
        PULR    R7                              ; 5E41   02B7

L_5E42:
        PSHR    R5                              ; 5E42   0275
        MVII    #$0187, R4                      ; 5E43   02BC 0187
        MVII    #$0190, R5                      ; 5E45   02BD 0190
L_5E47:
        MVI@    R4,     R0                      ; 5E47   02A0
        SWAP    R0,     1                       ; 5E48   0040
        SAR     R0,     2                       ; 5E49   006C
        SAR     R0,     2                       ; 5E4A   006C
        MVI     G_018F, R3                      ; 5E4B   0283 018F
        TSTR    R3                              ; 5E4D   009B
        BNEQ    L_5E51                          ; 5E4E   020C 0001

        SAR     R0,     1                       ; 5E50   0068
L_5E51:
        MOVR    R4,     R3                      ; 5E51   00A3
        SDBD                                    ; 5E52   0001
        ADD@    R4,     R0                      ; 5E53   02E0
        MVO@    R0,     R3                      ; 5E54   0258
        SWAP    R0,     1                       ; 5E55   0040
        MOVR    R0,     R2                      ; 5E56   0082
        INCR    R3                              ; 5E57   000B
        SUB@    R3,     R0                      ; 5E58   0318
        MOVR    R2,     R1                      ; 5E59   0091
        ANDI    #$0007, R1                      ; 5E5A   03B9 0007
        MVO@    R1,     R3                      ; 5E5C   0259
        XORR    R1,     R2                      ; 5E5D   01CA
        MVO@    R2,     R5                      ; 5E5E   026A
        INCR    R5                              ; 5E5F   000D
        MVO@    R2,     R5                      ; 5E60   026A
        ADDI    #$0003, R5                      ; 5E61   02FD 0003
        SUBR    R0,     R2                      ; 5E63   0102
        MVO@    R2,     R5                      ; 5E64   026A
        INCR    R5                              ; 5E65   000D
        MVO@    R2,     R5                      ; 5E66   026A
        SUBI    #$0006, R5                      ; 5E67   033D 0006
        CMPI    #$0196, R5                      ; 5E69   037D 0196
        BNEQ    L_5E47                          ; 5E6B   022C 0025

        MVII    #$0003, R5                      ; 5E6D   02BD 0003
        MVO     R5,     G_019C                  ; 5E6F   0245 019C
        MVII    #$0100, R5                      ; 5E71   02BD 0100
        MVI@    R5,     R0                      ; 5E73   02A8
        MVO@    R0,     R4                      ; 5E74   0260
        MVI@    R5,     R0                      ; 5E75   02A8
        MVO@    R0,     R4                      ; 5E76   0260
        MVII    #$009E, R0                      ; 5E77   02B8 009E
        MVII    #$005E, R1                      ; 5E79   02B9 005E
        MVO     R0,     .ISRVEC.0               ; 5E7B   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5E7D   0241 0101
L_5E7F:
        EIS                                     ; 5E7F   0002
        MVI     G_019C, R2                      ; 5E80   0282 019C
        SARC    R2,     2                       ; 5E82   007E
        BNC     L_5E98                          ; 5E83   0209 0013
        BOV     L_5E7F                          ; 5E85   0222 0007

        JSR     R5,     L_5735                  ; 5E87   0004 0154 0335

        MVII    #$0003, R2                      ; 5E8A   02BA 0003
        MVO     R2,     G_019C                  ; 5E8C   0242 019C
        MVII    #$00D2, R0                      ; 5E8E   02B8 00D2
        MVII    #$005E, R1                      ; 5E90   02B9 005E
        MVO     R0,     .ISRVEC.0               ; 5E92   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5E94   0241 0101
        B       L_5E7F                          ; 5E96   0220 0018
L_5E98:
        BNOV    L_5E9D                          ; 5E98   020A 0003

        JSR     R5,     L_5735                  ; 5E9A   0004 0154 0335

L_5E9D:
        PULR    R7                              ; 5E9D   02B7

        PSHR    R5                              ; 5E9E   0275
        MVI     G_0190, R4                      ; 5E9F   0284 0190
        TSTR    R4                              ; 5EA1   00A4
        BEQ     L_5EA9                          ; 5EA2   0204 0005

        MVI     G_0193, R4                      ; 5EA4   0284 0193
        TSTR    R4                              ; 5EA6   00A4
L_5EA7:
        BNEQ    L_5EC7                          ; 5EA7   020C 001E

L_5EA9:
        JSR     R5,     L_5F95                  ; 5EA9   0004 015C 0395

        MVI     G_0189, R0                      ; 5EAC   0280 0189
        MVO     R0,     .STIC.HDLY              ; 5EAE   0240 0030
        MVI     G_018C, R0                      ; 5EB0   0280 018C
        MVO     R0,     .STIC.VDLY              ; 5EB2   0240 0031

        JSR     R5,     L_5EF8                  ; 5EB4   0004 015C 02F8

        CLRR    R2                              ; 5EB7   01D2
        SUBI    #$0008, R2                      ; 5EB8   033A 0008

        JSR     R5,     L_5F04                  ; 5EBA   0004 015C 0304
        JSR     R5,     L_5F37                  ; 5EBD   0004 015C 0337

        TSTR    R2                              ; 5EC0   0092
        BMI     L_5EDC                          ; 5EC1   020B 0019

        MVII    #$0002, R0                      ; 5EC3   02B8 0002
        B       L_5EDC                          ; 5EC5   0200 0015

L_5EC7:
        NEGR    R4                              ; 5EC7   0024

        JSR     R5,     L_5EE4                  ; 5EC8   0004 015C 02E4
        JSR     R5,     L_5F04                  ; 5ECB   0004 015C 0304

        MVII    #$0001, R0                      ; 5ECE   02B8 0001
        B       L_5EDC                          ; 5ED0   0200 000A

        PSHR    R5                              ; 5ED2   0275
        MOVR    R6,     R4                      ; 5ED3   00B4

        JSR     R5,     L_5EE4                  ; 5ED4   0004 015C 02E4
        JSR     R5,     L_5F37                  ; 5ED7   0004 015C 0337

        MVII    #$0002, R0                      ; 5EDA   02B8 0002
L_5EDC:
        SLL     R2,     2                       ; 5EDC   004E
        XORR    R0,     R2                      ; 5EDD   01C2
        MVO     R2,     G_019C                  ; 5EDE   0242 019C

        JSR     R5,     X_PLAY_NOTE             ; 5EE0   0004 0118 02BD

        PULR    R7                              ; 5EE3   02B7

L_5EE4:
        PSHR    R5                              ; 5EE4   0275
        PSHR    R4                              ; 5EE5   0274

        JSR     R5,     L_5F95                  ; 5EE6   0004 015C 0395

        PULR    R4                              ; 5EE9   02B4
        TSTR    R4                              ; 5EEA   00A4
        BGT     L_5EF1                          ; 5EEB   020E 0004

        MVI     G_0189, R0                      ; 5EED   0280 0189
        MVO     R0,     .STIC.HDLY              ; 5EEF   0240 0030
L_5EF1:
        BMI     L_5EF7                          ; 5EF1   020B 0004

        MVI     G_018C, R0                      ; 5EF3   0280 018C
        MVO     R0,     .STIC.VDLY              ; 5EF5   0240 0031
L_5EF7:
        INCR    R7                              ; 5EF7   000F

L_5EF8:
        PSHR    R5                              ; 5EF8   0275
L_5EF9:
        MVO     R0,     .STIC.VIDEN             ; 5EF9   0240 0020
        MVI     G_018D, R0                      ; 5EFB   0280 018D
        MVI     G_018E, R1                      ; 5EFD   0281 018E
        MVO     R0,     .ISRVEC.0               ; 5EFF   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5F01   0241 0101
        PULR    R7                              ; 5F03   02B7

L_5F04:
        PSHR    R5                              ; 5F04   0275
        MVI     G_0190, R0                      ; 5F05   0280 0190
        SWAP    R0,     2                       ; 5F07   0044
        BEQ     L_5F36                          ; 5F08   0204 002C
        BPL     L_5F20                          ; 5F0A   0203 0014

        MVII    #$0200, R5                      ; 5F0C   02BD 0200
        MVII    #$0201, R4                      ; 5F0E   02BC 0201
        CLRR    R2                              ; 5F10   01D2
L_5F11:
        MVII    #$0013, R3                      ; 5F11   02BB 0013
L_5F13:
        MVI@    R4,     R0                      ; 5F13   02A0
        MVO@    R0,     R5                      ; 5F14   0268
        DECR    R3                              ; 5F15   0013
        BNEQ    L_5F13                          ; 5F16   022C 0004

        MVO@    R2,     R5                      ; 5F18   026A
        INCR    R4                              ; 5F19   000C
        CMPI    #$02E6, R4                      ; 5F1A   037C 02E6
        BLT     L_5F11                          ; 5F1C   0225 000C
        B       L_5F36                          ; 5F1E   0200 0016

L_5F20:
        MVII    #$0212, R5                      ; 5F20   02BD 0212
        MVII    #$0003, R1                      ; 5F22   02B9 0003
        CLRR    R2                              ; 5F24   01D2
L_5F25:
        MVII    #$0013, R3                      ; 5F25   02BB 0013
L_5F27:
        MVI@    R5,     R0                      ; 5F27   02A8
        MVO@    R0,     R5                      ; 5F28   0268
        SUBR    R1,     R5                      ; 5F29   010D
        DECR    R3                              ; 5F2A   0013
        BNEQ    L_5F27                          ; 5F2B   022C 0005

        INCR    R5                              ; 5F2D   000D
        MVO@    R2,     R5                      ; 5F2E   026A
        ADDI    #$0025, R5                      ; 5F2F   02FD 0025
        CMPI    #$02F0, R5                      ; 5F31   037D 02F0
        BLT     L_5F25                          ; 5F33   0225 000F

        INCR    R2                              ; 5F35   000A
L_5F36:
        PULR    R7                              ; 5F36   02B7

L_5F37:
        PSHR    R5                              ; 5F37   0275
        MVI     G_0193, R0                      ; 5F38   0280 0193
        SWAP    R0,     2                       ; 5F3A   0044
        BEQ     L_5F94                          ; 5F3B   0204 0057
        BMI     L_5F88                          ; 5F3D   020B 0049

        MVII    #$02DC, R5                      ; 5F3F   02BD 02DC
        MVII    #$0214, R4                      ; 5F41   02BC 0214
        MVII    #$0200, R2                      ; 5F43   02BA 0200
        MVII    #$0014, R1                      ; 5F45   02B9 0014
        MVII    #$000A, R0                      ; 5F47   02B8 000A
L_5F49:
        PSHR    R0                              ; 5F49   0270
        MVII    #$0004, R3                      ; 5F4A   02BB 0004
L_5F4C:
        MVI@    R4,     R0                      ; 5F4C   02A0
        MVO@    R0,     R5                      ; 5F4D   0268
        MVI@    R4,     R0                      ; 5F4E   02A0
        MVO@    R0,     R5                      ; 5F4F   0268
        MVI@    R4,     R0                      ; 5F50   02A0
        MVO@    R0,     R5                      ; 5F51   0268
        MVI@    R4,     R0                      ; 5F52   02A0
        MVO@    R0,     R5                      ; 5F53   0268
        MVI@    R4,     R0                      ; 5F54   02A0
        MVO@    R0,     R5                      ; 5F55   0268
        DECR    R3                              ; 5F56   0013
        BNEQ    L_5F4C                          ; 5F57   022C 000C

        SUBR    R1,     R4                      ; 5F59   010C
        SUBR    R1,     R5                      ; 5F5A   010D
        XORR    R2,     R5                      ; 5F5B   01D5
        XORR    R5,     R2                      ; 5F5C   01EA
        XORR    R2,     R5                      ; 5F5D   01D5
        MVII    #$0004, R3                      ; 5F5E   02BB 0004
L_5F60:
        MVI@    R5,     R0                      ; 5F60   02A8
        MVO@    R0,     R4                      ; 5F61   0260
        MVI@    R5,     R0                      ; 5F62   02A8
        MVO@    R0,     R4                      ; 5F63   0260
        MVI@    R5,     R0                      ; 5F64   02A8
        MVO@    R0,     R4                      ; 5F65   0260
        MVI@    R5,     R0                      ; 5F66   02A8
        MVO@    R0,     R4                      ; 5F67   0260
        MVI@    R5,     R0                      ; 5F68   02A8
        MVO@    R0,     R4                      ; 5F69   0260
        DECR    R3                              ; 5F6A   0013
        BNEQ    L_5F60                          ; 5F6B   022C 000C

        SUBR    R1,     R5                      ; 5F6D   010D
        PULR    R0                              ; 5F6E   02B0
        DECR    R0                              ; 5F6F   0010
        BNEQ    L_5F49                          ; 5F70   022C 0028

        XORR    R2,     R5                      ; 5F72   01D5
        XORR    R5,     R2                      ; 5F73   01EA
        XORR    R2,     R5                      ; 5F74   01D5
        MVII    #$0004, R3                      ; 5F75   02BB 0004
L_5F77:
        MVI@    R5,     R0                      ; 5F77   02A8
        MVO@    R0,     R4                      ; 5F78   0260
        MVI@    R5,     R0                      ; 5F79   02A8
        MVO@    R0,     R4                      ; 5F7A   0260
        MVI@    R5,     R0                      ; 5F7B   02A8
        MVO@    R0,     R4                      ; 5F7C   0260
        MVI@    R5,     R0                      ; 5F7D   02A8
        MVO@    R0,     R4                      ; 5F7E   0260
        MVI@    R5,     R0                      ; 5F7F   02A8
        MVO@    R0,     R4                      ; 5F80   0260
        DECR    R3                              ; 5F81   0013
        BNEQ    L_5F77                          ; 5F82   022C 000C

        MVII    #$0003, R2                      ; 5F84   02BA 0003
        B       L_5F94                          ; 5F86   0200 000C

L_5F88:
        MVII    #$0200, R5                      ; 5F88   02BD 0200
        MVII    #$0214, R4                      ; 5F8A   02BC 0214
L_5F8C:
        MVI@    R4,     R0                      ; 5F8C   02A0
        MVO@    R0,     R5                      ; 5F8D   0268
        CMPI    #$02DC, R5                      ; 5F8E   037D 02DC
        BNEQ    L_5F8C                          ; 5F90   022C 0005

        MVII    #$0002, R2                      ; 5F92   02BA 0002
L_5F94:
        PULR    R7                              ; 5F94   02B7

L_5F95:
        PSHR    R5                              ; 5F95   0275
        MVII    #$031D, R2                      ; 5F96   02BA 031D
        CLRR    R3                              ; 5F98   01DB
L_5F99:
        MVII    #$0196, R5                      ; 5F99   02BD 0196
        MVI@    R2,     R0                      ; 5F9B   0290
        ADDI    #$0002, R2                      ; 5F9C   02FA 0002
        SLL     R0,     1                       ; 5F9E   0048
        BPL     L_5FA3                          ; 5F9F   0203 0002

        MVII    #$0190, R5                      ; 5FA1   02BD 0190
L_5FA3:
        TSTR    R4                              ; 5FA3   00A4
        BLE     L_5FAA                          ; 5FA4   0206 0004

        ADDI    #$0003, R5                      ; 5FA6   02FD 0003
        B       L_5FB8                          ; 5FA8   0200 000E

L_5FAA:
        MVI@    R3,     R0                      ; 5FAA   0298
        MOVR    R0,     R1                      ; 5FAB   0081
        ANDI    #$00FF, R1                      ; 5FAC   03B9 00FF
        XORR    R1,     R0                      ; 5FAE   01C8
        ADD@    R5,     R1                      ; 5FAF   02E9
        ANDI    #$00FF, R1                      ; 5FB0   03B9 00FF
        XORR    R1,     R0                      ; 5FB2   01C8
        MVO@    R0,     R3                      ; 5FB3   0258
        MVI@    R2,     R0                      ; 5FB4   0290
        SDBD                                    ; 5FB5   0001
        ADD@    R5,     R0                      ; 5FB6   02E8
        MVO@    R0,     R2                      ; 5FB7   0250
L_5FB8:
        INCR    R2                              ; 5FB8   000A
        TSTR    R4                              ; 5FB9   00A4
        BMI     L_5FCE                          ; 5FBA   020B 0012

        XORI    #$0008, R3                      ; 5FBC   03FB 0008
        MVI@    R3,     R0                      ; 5FBE   0298
        MOVR    R0,     R1                      ; 5FBF   0081
        ANDI    #$007F, R1                      ; 5FC0   03B9 007F
        XORR    R1,     R0                      ; 5FC2   01C8
        ADD@    R5,     R1                      ; 5FC3   02E9
        ANDI    #$007F, R1                      ; 5FC4   03B9 007F
        XORR    R1,     R0                      ; 5FC6   01C8
        MVO@    R0,     R3                      ; 5FC7   0258
        XORI    #$0008, R3                      ; 5FC8   03FB 0008
        MVI@    R2,     R0                      ; 5FCA   0290
        SDBD                                    ; 5FCB   0001
        ADD@    R5,     R0                      ; 5FCC   02E8
        MVO@    R0,     R2                      ; 5FCD   0250
L_5FCE:
        ADDI    #$0005, R2                      ; 5FCE   02FA 0005
        INCR    R3                              ; 5FD0   000B
        CMPI    #$0008, R3                      ; 5FD1   037B 0008
        BNEQ    L_5F99                          ; 5FD3   022C 003B
        PULR    R7                              ; 5FD5   02B7

L_5FD6:
        PSHR    R5                              ; 5FD6   0275

        JSR     R5,     .EXEC.7C1               ; 5FD7   0004 0114 03C1

        MVII    #$0315, R1                      ; 5FDA   02B9 0315
L_5FDC:
        ADDI    #$0008, R1                      ; 5FDC   02F9 0008
        CMPI    #$035D, R1                      ; 5FDE   0379 035D
        BGE     L_5FFC                          ; 5FE0   020D 001A

        MVII    #$0054, R2                      ; 5FE2   02BA 0054
        SUB     G_0189, R2                      ; 5FE4   0302 0189
        SWAP    R2,     1                       ; 5FE6   0042
        ADDI    #$0034, R2                      ; 5FE7   02FA 0034
        SUB     G_018C, R2                      ; 5FE9   0302 018C
        SDBD                                    ; 5FEB   0001
        MVII    #$5434, R4                      ; 5FEC   02BC 0034 0054

        JSR     R5,     .EXEC.6F7               ; 5FEF   0004 0114 02F7

        BC      L_5FDC                          ; 5FF2   0221 0017

        JSR     R5,     .EXEC.766               ; 5FF4   0004 0114 0366
        JSR     R5,     L_565F                  ; 5FF7   0004 0154 025F

        B       L_5FDC                          ; 5FFA   0220 001F
L_5FFC:
        PULR    R7                              ; 5FFC   02B7

        DECLE   $0000,  $0000,  $0000           ; 5FFD   0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $505B       <entry>
;;  $509D       $5097  
;;  $50A2       $509F  
;;  $50BB       $5099  
;;  $513E       $50FC  
;;  $5158       $5160  
;;  $518A       $513C  
;;  $51B5       <entry>
;;  $51CA       $51B9  
;;  $51CB       $51C4  
;;  $5213       $51ED   $51FE  
;;  $5237       $5234  
;;  $5255       $5252  
;;  $5259       $5244  
;;  $525C       $5231  
;;  $5262       $525A  
;;  $5271       $526B  
;;  $5293       $5282  
;;  $52A0       $527A   $5285   $5291  
;;  $52A8       $52B5  
;;  $52BD       $5298   $529E  
;;  $52BE       $51CF   $51DC   $51E2  
;;  $52CD       $525D   $542A  
;;  $52EE       $52E8  
;;  $52F1       $52E6  
;;  $52F5       $52E4  
;;  $52F6       $52EC   $52EF   $52F3  
;;  $5317       $51C1  
;;  $532F       $5327  
;;  $5355       $5345  
;;  $5390       $5332  
;;  $5399       $5393  
;;  $53AD       $53A7  
;;  $53C2       $531B   $5320   $5338   $533F   $5353  
;;  $53C3       $51BE  
;;  $53CF       $53C7  
;;  $53E0       $53DC  
;;  $5404       $53FF  
;;  $541E       $541B  
;;  $542F       $5425  
;;  $543F       $53D2  
;;  $5467       $5461  
;;  $54AD       $53CD   $53E4   $53EA   $5442   $544E   $545B   $546B  
;;  $54B8       $54B2  
;;  $54B9       $5115   $5910  
;;  $54DA       $54BB  
;;  $54EB       $591A  
;;  $5514       $54F0  
;;  $5524       $5512  
;;  $552C       $5519   $5520  
;;  $553A       $5537  
;;  $5545       $5542  
;;  $5546       $553F  
;;  $554D       $55A9  
;;  $5579       $5550   $5556  
;;  $5592       $558F  
;;  $5598       $557C   $5589   $558D  
;;  $559C       <entry>
;;  $55AD       $55A7  
;;  $55B0       $55A0  
;;  $55B1       $55AD  
;;  $55DA       $55B4   $55BA  
;;  $55DB       $5552   $55B6  
;;  $55EB       $55E1   $55E8  
;;  $55EC       $5135  
;;  $55FC       $55F0  
;;  $560A       $55FE  
;;  $562B       $560C  
;;  $5632       $562D  
;;  $563F       $5634  
;;  $565E       $561E   $5641   $5646  
;;  $565F       $5699   $56C8   $56D1   $5773   $5FF7  
;;  $567A       $5674  
;;  $5681       $567D  
;;  $568F       $566A  
;;  $5692       $56C4  
;;  $56A8       $56A2  
;;  $56B5       $56B2  
;;  $56B9       $5696   $56AC  
;;  $56C8       $56C2  
;;  $56CB       $56BE  
;;  $56CC       $585B   $58B3   $5A2B  
;;  $56D0       $56D5  
;;  $56D9       $51DE   $5334   $53E6   $5467   $57BA   $57E3  
;;  $56DD       $56E6  
;;  $56E8       $54E3   $54E5  
;;  $56E9       $56E0  
;;  $56EB       $564A   $5858  
;;  $56F5       $58B9   $5916  
;;  $56F8       $56F3  
;;  $56FC       $5709  
;;  $5703       $5700  
;;  $570F       $5128   $514F   $574A   $58F7  
;;  $571A       $5732  
;;  $5724       $571F  
;;  $572F       $5722  
;;  $5735       $5E87   $5E9A  
;;  $5776       $5771  
;;  $5781       $577E  
;;  $57A4       $5785   $578B   $5792   $579A   $57A1  
;;  $57B5       $57AB   $57B1  
;;  $57DB       $57D7  
;;  $57FB       $57B3   $57B8   $57BE  
;;  $57FF       $575E   $576C  
;;  $5800       $581C  
;;  $5819       $5804   $5813  
;;  $581F       $57FC   $5806   $5816  
;;  $582F       $5829  
;;  $5848       $56A4  
;;  $5862       $588B  
;;  $5881       $5879  
;;  $58A4       $589F  
;;  $58A7       $58A2  
;;  $58B1       $584D  
;;  $58B2       $5901  
;;  $58D1       $58CB  
;;  $5913       $58FF  
;;  $5923       $5907  
;;  $5924       $50F6   $565B   $56B6   $57A4   $58A7   $58C5  
;;  $5939       $5942   $594B  
;;  $5944       $593A  
;;  $594D       $593D   $5946  
;;  $5963       $5958  
;;  $5974       $5968  
;;  $597D       $596A   $5972   $5979  
;;  $5982       $598A  
;;  $598C       $5985  
;;  $59AB       $59A0   $59A6  
;;  $59BE       $59AC  
;;  $59EF       $59E8  
;;  $59F7       $592C   $59C8   $59D5   $59ED  
;;  $59F8       $5960   $5A61  
;;  $5A0B       $59FA  
;;  $5A1B       $5A13  
;;  $5A23       $58CD  
;;  $5A6E       $5A27  
;;  $5A6F       $58E0   $59A8  
;;  $5A79       $5A75  
;;  $5A88       $5A86  
;;  $5A8A       $58AE   $5A80  
;;  $5AE7       $5AE5  
;;  $5B4E       $5B4C  
;;  $5BD2       $5BD0  
;;  $5BD3       $5BD1  
;;  $5BED       $5BEB  
;;  $5C9D       $5C9D  
;;  $5C9E       $5C9E  
;;  $5CBC       $5CBA  
;;  $5CC1       $5CBF  
;;  $5D80       $57C0   $5821  
;;  $5D91       $5893  
;;  $5DA2       $560E  
;;  $5DB9       $5144   $58BC   $58EB  
;;  $5DBD       $5DB7  
;;  $5DDA       $51C7  
;;  $5DFF       $5DE7   $5DEF  
;;  $5E12       $5E02  
;;  $5E1B       $5E15  
;;  $5E21       $5E2D   $5E31  
;;  $5E30       $5E23  
;;  $5E3A       $5E10  
;;  $5E41       $5DDF   $5E0A   $5E19  
;;  $5E42       <entry>
;;  $5E47       $5E6B  
;;  $5E51       $5E4E  
;;  $5E7F       $5E85   $5E96  
;;  $5E98       $5E83  
;;  $5E9D       $5E98  
;;  $5EA7       $5D4D  
;;  $5EA9       $5EA2  
;;  $5EC7       $5EA7  
;;  $5EDC       $5EC1   $5EC5   $5ED0  
;;  $5EE4       $5EC8   $5ED4  
;;  $5EF1       $5EEB  
;;  $5EF7       $5EF1  
;;  $5EF8       $5EB4  
;;  $5EF9       $5EF7  
;;  $5F04       $5EBA   $5ECB  
;;  $5F11       $5F1C  
;;  $5F13       $5F16  
;;  $5F20       $5F0A  
;;  $5F25       $5F33  
;;  $5F27       $5F2B  
;;  $5F36       $5F08   $5F1E  
;;  $5F37       $5EBD   $5ED7  
;;  $5F49       $5F70  
;;  $5F4C       $5F57  
;;  $5F60       $5F6B  
;;  $5F77       $5F82  
;;  $5F88       $5F3D  
;;  $5F8C       $5F90  
;;  $5F94       $5F3B   $5F86  
;;  $5F95       $5EA9   $5EE6  
;;  $5F99       $5FD3  
;;  $5FA3       $5F9F  
;;  $5FAA       $5FA4  
;;  $5FB8       $5FA8  
;;  $5FCE       $5FBA  
;;  $5FD6       <entry>
;;  $5FDC       $5FF2   $5FFA  
;;  $5FFC       $5FE0  
;; ======================================================================== ;;
