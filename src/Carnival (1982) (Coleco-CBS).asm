
        ORG     $5000
.HEADER:
        BIDECLE $53C6           ; 5000  Ptr: MOB graphic images
        BIDECLE $5045           ; 5002  Ptr: EXEC timer table
        BIDECLE $5147           ; 5004  Ptr: Start of game
        BIDECLE $52FE           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $501C           ; 5008  Ptr: GRAM init sequence
        BIDECLE $504E           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0003   ; 500F  Color Stack init (0, 1)
        DECLE   $0006,  $0004   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $0190,  $0198,  $01A0,  $01B0   ; 5014   0190 0198 01A0 01B0
        DECLE   $01C0,  $01D0,  $01E0,  $01F0   ; 5018   01C0 01D0 01E0 01F0
.GRAM_INIT_501C:
        DECLE   $0040           ; 501C  # of GRAM cards to init
        DECLE   $0000           ; 501D  #00   :  CART #00    ----
        DECLE   $0002           ; 501E  #01   :  CART #01    ----
        DECLE   $0302           ; 501F  #02   :  CART #01    XY--
        DECLE   $0300           ; 5020  #03   :  CART #00    XY--
        DECLE   $0004           ; 5021  #04   :  CART #02    ----
        DECLE   $0006           ; 5022  #05   :  CART #03    ----
        DECLE   $0306           ; 5023  #06   :  CART #03    XY--
        DECLE   $0304           ; 5024  #07   :  CART #02    XY--
        DECLE   $0008           ; 5025  #08   :  CART #04    ----
        DECLE   $000A           ; 5026  #09   :  CART #05    ----
        DECLE   $030A           ; 5027  #0A   :  CART #05    XY--
        DECLE   $0308           ; 5028  #0B   :  CART #04    XY--
        DECLE   $000C           ; 5029  #0C   :  CART #06    ----
        DECLE   $020C           ; 502A  #0D   :  CART #06    X---
        DECLE   $010C           ; 502B  #0E   :  CART #06    -Y--
        DECLE   $030C           ; 502C  #0F   :  CART #06    XY--
        DECLE   $000E           ; 502D  #10   :  CART #07    ----
        DECLE   $0010           ; 502E  #11   :  CART #08    ----
        DECLE   $0001,  $0010   ; 502F  #12-12:  GROM #00-00 ----
        DECLE   $0001,  $0010   ; 5031  #13-13:  GROM #00-00 ----
        DECLE   $0001,  $0010   ; 5033  #14-14:  GROM #00-00 ----
        DECLE   $0013,  $0380   ; 5035  #15-1C:  CART #09-10 ----
        DECLE   $0023,  $0380   ; 5037  #1D-24:  CART #11-18 ----
        DECLE   $0025,  $0140   ; 5039  #25-27:  GRAM #12-14 ----
        DECLE   $0025,  $0140   ; 503B  #28-2A:  GRAM #12-14 ----
        DECLE   $004B,  $0340   ; 503D  #2B-31:  GRAM #25-2B ----
        DECLE   $004B,  $03C0   ; 503F  #32-39:  GRAM #25-2C ----
        DECLE   $004B,  $03C0   ; 5041  #3A-41:  GRAM #25-2C ----
        DECLE   $004B,  $01C0                   ; 5043   004B 01C0
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 5045  Timer dispatch/interval
        DECLE   $00D2,  $0055,  $0001,  $0000; 5049  Timer dispatch/interval
        DECLE   $0000,  $0000   ; 504D  End of timer table

        STRING  " "                             ; 504F  Title string
        DECLE   $0000                           ; 5050  

.TITLECODE:
        MVII    #$0003, R0                      ; 5051   02B8 0003
        MVO     R0,     G_0103                  ; 5053   0240 0103

        JSR     R5,     L_5121                  ; 5055   0004 0150 0121

        MVII    #$022B, R4                      ; 5058   02BC 022B
        MVII    #$0007, R3                      ; 505A   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 505C   0004 0118 007B
        STRING  "COLECO PRESENTS"               ; 505F  
        DECLE   $0000                           ; 506E   0000

        MVII    #$027E, R4                      ; 506F   02BC 027E

        JSR     R5,     X_PRINT_R5              ; 5071   0004 0118 007B
        STRING  "CARNIVAL"                      ; 5074  
        DECLE   $0000                           ; 507C   0000

        MVII    #$02C9, R4                      ; 507D   02BC 02C9

        JSR     R5,     X_PRINT_R5              ; 507F   0004 0118 007B
        STRING  "COPR @ 1982 COLECO"            ; 5082  
        DECLE   $0000                           ; 5094   0000

        PULR    R7                              ; 5095   02B7

        PSHR    R5                              ; 5096   0275
        MVI     G_015F, R1                      ; 5097   0281 015F
        TSTR    R1                              ; 5099   0089
        BEQ     L_512A                          ; 509A   0204 008E

        MVI     G_0162, R1                      ; 509C   0281 0162
        TSTR    R1                              ; 509E   0089
        BNEQ    L_50AA                          ; 509F   020C 0009

        ANDI    #$000F, R0                      ; 50A1   03B8 000F
        MVI     G_0161, R1                      ; 50A3   0281 0161
        TSTR    R1                              ; 50A5   0089
        BEQ     L_5177                          ; 50A6   0204 00CF
        B       L_515F                          ; 50A8   0200 00B5

L_50AA:
        DECR    R1                              ; 50AA   0011
        MVO     R1,     G_0162                  ; 50AB   0241 0162
L_50AD:
        MVII    #$0170, R4                      ; 50AD   02BC 0170
        MVII    #$0070, R0                      ; 50AF   02B8 0070
        MVO     R4,     G_035D                  ; 50B1   0244 035D

        JSR     R5,     X_FILL_ZERO             ; 50B3   0004 0114 0338

        MVII    #$031D, R4                      ; 50B6   02BC 031D
        MVII    #$0040, R0                      ; 50B8   02B8 0040

        JSR     R5,     X_FILL_ZERO             ; 50BA   0004 0114 0338

        MVI     G_0165, R1                      ; 50BD   0281 0165
        ADDI    #$016D, R1                      ; 50BF   02F9 016D
        MVI@    R1,     R0                      ; 50C1   0288
        ADD     G_0162, R0                      ; 50C2   02C0 0162
        CMPI    #$0005, R0                      ; 50C4   0378 0005
        BLE     L_50CA                          ; 50C6   0206 0002

        MVII    #$0005, R0                      ; 50C8   02B8 0005
L_50CA:
        MVO     R0,     G_0171                  ; 50CA   0240 0171
        MVII    #$003C, R3                      ; 50CC   02BB 003C
        TSTR    R0                              ; 50CE   0080
        BEQ     L_50D3                          ; 50CF   0204 0002

        MVII    #$0030, R3                      ; 50D1   02BB 0030
L_50D3:
        MVO     R3,     G_015F                  ; 50D3   0243 015F
        MOVR    R0,     R3                      ; 50D5   0083
        ADDR    R0,     R0                      ; 50D6   00C0
        SLL     R3,     2                       ; 50D7   004F
        SLL     R3,     1                       ; 50D8   004B
        ADDR    R0,     R3                      ; 50D9   00C3
        MVO     R3,     G_01A8                  ; 50DA   0243 01A8
        CMPI    #$0028, R3                      ; 50DC   037B 0028
        BLE     L_50E2                          ; 50DE   0206 0002

        MVII    #$0028, R3                      ; 50E0   02BB 0028
L_50E2:
        MVII    #$0032, R2                      ; 50E2   02BA 0032
        ADDR    R3,     R2                      ; 50E4   00DA
        MVO     R2,     G_0169                  ; 50E5   0242 0169
        MVII    #$0014, R2                      ; 50E7   02BA 0014
        ADDR    R3,     R2                      ; 50E9   00DA
        MVO     R2,     G_0168                  ; 50EA   0242 0168

        JSR     R5,     L_5121                  ; 50EC   0004 0150 0121

        MVII    #$0068, R0                      ; 50EF   02B8 0068
        MVO     R0,     G_01A3                  ; 50F1   0240 01A3

        JSR     R5,     L_54D7                  ; 50F3   0004 0154 00D7
        JSR     R5,     L_51A4                  ; 50F6   0004 0150 01A4

        MVII    #$0001, R0                      ; 50F9   02B8 0001
        MVO     R0,     G_016A                  ; 50FB   0240 016A
        MVO     R0,     G_016F                  ; 50FD   0240 016F
        MVO     R0,     G_01A9                  ; 50FF   0240 01A9
        MVO     R0,     G_01B4                  ; 5101   0240 01B4
        MVII    #$0003, R0                      ; 5103   02B8 0003
        MVO     R0,     G_01A5                  ; 5105   0240 01A5
        MVO     R0,     G_0190                  ; 5107   0240 0190
        NEGR    R0                              ; 5109   0020
        MVO     R0,     G_01A6                  ; 510A   0240 01A6
        SDBD                                    ; 510C   0001
        MVII    #$55D6, R1                      ; 510D   02B9 00D6 0055
        MVO     R1,     .ISRVEC.0               ; 5110   0241 0100
        SWAP    R1,     1                       ; 5112   0041
        MVO     R1,     .ISRVEC.1               ; 5113   0241 0101
        INCR    R7                              ; 5115   000F

L_5116:
        PSHR    R5                              ; 5116   0275
L_5117:
        SDBD                                    ; 5117   0001
        MVII    #$5486, R1                      ; 5118   02B9 0086 0054
        MVII    #$0325, R2                      ; 511B   02BA 0325

        JSR     R5,     X_INIT_MOB              ; 511D   0004 0114 02B2

        PULR    R7                              ; 5120   02B7

L_5121:
        PSHR    R5                              ; 5121   0275
        MVII    #$0200, R4                      ; 5122   02BC 0200
        MVII    #$00F0, R0                      ; 5124   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5126   0004 0114 0338

        PULR    R7                              ; 5129   02B7

L_512A:
        JSR     R5,     L_5121                  ; 512A   0004 0150 0121

        MVII    #$0228, R4                      ; 512D   02BC 0228
        MVO     R4,     G_015F                  ; 512F   0244 015F
        MVII    #$0006, R3                      ; 5131   02BB 0006

        JSR     R5,     X_PRINT_R5              ; 5133   0004 0118 007B
        STRING  "PLAYERS  1 OR 2"               ; 5136  
        DECLE   $0000                           ; 5145   0000

        PULR    R7                              ; 5146   02B7

.START:
        PSHR    R5                              ; 5147   0275

L_5148:
        JSR     R5,     L_5155                  ; 5148   0004 0150 0155
        DECLE   $0096,  $0050,  $0096,  $0050   ; 514B   0096 0050 0096 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 514F   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5153   0000 0000
L_5155:
        MVO     R5,     G_035D                  ; 5155   0245 035D
        MVII    #$0160, R4                      ; 5157   02BC 0160
        MVII    #$0030, R0                      ; 5159   02B8 0030

        JSR     R5,     X_FILL_ZERO             ; 515B   0004 0114 0338

        PULR    R7                              ; 515E   02B7

L_515F:
        CMPI    #$0004, R0                      ; 515F   0378 0004
        BGT     L_51A0                          ; 5161   020E 003D

        TSTR    R0                              ; 5163   0080
        BEQ     L_51A0                          ; 5164   0204 003A

        MVI     G_0161, R1                      ; 5166   0281 0161
        DECR    R1                              ; 5168   0011
        MVO     R1,     G_0161                  ; 5169   0241 0161
        MVO     R0,     G_0162                  ; 516B   0240 0162
        MVII    #$0007, R3                      ; 516D   02BB 0007
        MVII    #$0001, R1                      ; 516F   02B9 0001
        MVII    #$028A, R4                      ; 5171   02BC 028A

        JSR     R5,     X_PRNUM_RGT             ; 5173   0004 0118 00C5

        PULR    R7                              ; 5176   02B7

L_5177:
        CMPI    #$0001, R0                      ; 5177   0378 0001
        BEQ     L_517F                          ; 5179   0204 0004

        CMPI    #$0002, R0                      ; 517B   0378 0002
        BNEQ    L_51A0                          ; 517D   020C 0021

L_517F:
        MVO     R0,     G_0161                  ; 517F   0240 0161
        MVII    #$0007, R3                      ; 5181   02BB 0007
        MVII    #$023A, R4                      ; 5183   02BC 023A
        MVII    #$0001, R1                      ; 5185   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 5187   0004 0118 00C5

        DECR    R3                              ; 518A   0013
        MVII    #$0278, R4                      ; 518B   02BC 0278

        JSR     R5,     X_PRINT_R5              ; 518D   0004 0118 007B
        STRING  "LEVEL?  1 TO 4"                ; 5190  
        DECLE   $0000                           ; 519E   0000

        PULR    R7                              ; 519F   02B7

L_51A0:
        JSR     R5,     X_PLAY_RAZZ2            ; 51A0   0004 011C 02BD

        PULR    R7                              ; 51A3   02B7

L_51A4:
        PSHR    R5                              ; 51A4   0275
        SDBD                                    ; 51A5   0001
        MVII    #$28B8, R2                      ; 51A6   02BA 00B8 0028
        MVO     R2,     .BTAB.28                ; 51A9   0242 0228
        MVO     R2,     .BTAB.35                ; 51AB   0242 0235
        MVO     R2,     .BTAB.3B                ; 51AD   0242 023B
        SUBI    #$0390, R2                      ; 51AF   033A 0390
        MVO     R2,     .BTAB.30                ; 51B1   0242 0230
        SDBD                                    ; 51B3   0001
        MVII    #$0520, R0                      ; 51B4   02B8 0020 0005
        MVO     R0,     .BTAB.33                ; 51B7   0240 0233
        ADDI    #$0398, R0                      ; 51B9   02F8 0398
        MVO     R0,     .BTAB.3A                ; 51BB   0240 023A
        SUBI    #$000E, R0                      ; 51BD   0338 000E
        MVO     R0,     .BTAB.32                ; 51BF   0240 0232
        ADDI    #$0150, R0                      ; 51C1   02F8 0150
        MVO     R0,     .BTAB.31                ; 51C3   0240 0231
        SUBI    #$01F8, R0                      ; 51C5   0338 01F8
        MVO     R0,     .BTAB.08                ; 51C7   0240 0208
        ADDI    #$0018, R0                      ; 51C9   02F8 0018
        MVO     R0,     .BTAB.1F                ; 51CB   0240 021F
        MVII    #$0008, R3                      ; 51CD   02BB 0008
        ADDI    #$004C, R0                      ; 51CF   02F8 004C
        MVO     R0,     .BTAB.09                ; 51D1   0240 0209
        ADDR    R3,     R0                      ; 51D3   00D8
        MVO     R0,     .BTAB.0A                ; 51D4   0240 020A
        ADDR    R3,     R0                      ; 51D6   00D8
        MVO     R0,     .BTAB.1D                ; 51D7   0240 021D
        ADDR    R3,     R0                      ; 51D9   00D8
        MVO     R0,     .BTAB.1E                ; 51DA   0240 021E
        SUBI    #$0075, R0                      ; 51DC   0338 0075
        MVO     R0,     .BTAB.0B                ; 51DE   0240 020B
        ADDR    R3,     R0                      ; 51E0   00D8
        MVO     R0,     .BTAB.1C                ; 51E1   0240 021C
        SDBD                                    ; 51E3   0001
        MVII    #$1895, R0                      ; 51E4   02B8 0095 0018
        MVO     R0,     .BTAB.8B                ; 51E7   0240 028B
        ADDR    R3,     R0                      ; 51E9   00D8
        MVO     R0,     .BTAB.77                ; 51EA   0240 0277
        ADDR    R3,     R0                      ; 51EC   00D8
        MVO     R0,     .BTAB.63                ; 51ED   0240 0263
        ADDI    #$0010, R0                      ; 51EF   02F8 0010
        MVO     R0,     .BTAB.9F                ; 51F1   0240 029F
        MVII    #$02F8, R0                      ; 51F3   02B8 02F8
        MVO     R0,     .BTAB.2F                ; 51F5   0240 022F
        MVO     R0,     .BTAB.34                ; 51F7   0240 0234

        JSR     R5,     L_5241                  ; 51F9   0004 0150 0241

        MVII    #$0005, R3                      ; 51FC   02BB 0005
        MVII    #$0221, R4                      ; 51FE   02BC 0221

        JSR     R5,     X_PRINT_R5              ; 5200   0004 0118 007B
        STRING  "bonus"                         ; 5203  
        DECLE   $0000                           ; 5208   0000

        JSR     R5,     L_5252                  ; 5209   0004 0150 0252

        INCR    R7                              ; 520C   000F

L_520D:
        PSHR    R5                              ; 520D   0275
L_520E:
        MVI     G_0163, R0                      ; 520E   0280 0163
        SWAP    R0,     1                       ; 5210   0040
        XOR     G_0164, R0                      ; 5211   03C0 0164
        MVII    #$0003, R3                      ; 5213   02BB 0003
        SUB     G_0165, R3                      ; 5215   0303 0165
        MVII    #$0201, R4                      ; 5217   02BC 0201

        JSR     R5,     L_5227                  ; 5219   0004 0150 0227

        MVI     G_0166, R0                      ; 521C   0280 0166
        SWAP    R0,     1                       ; 521E   0040
        XOR     G_0167, R0                      ; 521F   03C0 0167
        NEGR    R3                              ; 5221   0023
        ADDI    #$0005, R3                      ; 5222   02FB 0005
        MVII    #$020D, R4                      ; 5224   02BC 020D
        INCR    R7                              ; 5226   000F

L_5227:
        PSHR    R5                              ; 5227   0275
L_5228:
        MOVR    R3,     R2                      ; 5228   009A
        ADDI    #$0080, R2                      ; 5229   02FA 0080
        MOVR    R2,     R1                      ; 522B   0091
        SDBD                                    ; 522C   0001
        MVII    #$2710, R5                      ; 522D   02BD 0010 0027
L_5230:
        CMPR    R5,     R0                      ; 5230   0168
        BLT     L_5238                          ; 5231   0205 0005

        SUBR    R5,     R0                      ; 5233   0128
        ADDI    #$0008, R1                      ; 5234   02F9 0008
        B       L_5230                          ; 5236   0220 0007

L_5238:
        MVO@    R1,     R4                      ; 5238   0261
        MVII    #$0004, R1                      ; 5239   02B9 0004

        JSR     R5,     X_PRNUM_ZRO             ; 523B   0004 0118 00AD

        ADDR    R1,     R4                      ; 523E   00CC
        MVO@    R2,     R4                      ; 523F   0262
        PULR    R7                              ; 5240   02B7

L_5241:
        PSHR    R5                              ; 5241   0275
        MVI     G_0168, R0                      ; 5242   0280 0168
        MVII    #$0007, R3                      ; 5244   02BB 0007
        MVII    #$0003, R1                      ; 5246   02B9 0003
        MVII    #$0236, R4                      ; 5248   02BC 0236

        JSR     R5,     X_PRNUM_RGT             ; 524A   0004 0118 00C5

        MVII    #$0087, R1                      ; 524D   02B9 0087
        MVO     R1,     .BTAB.39                ; 524F   0241 0239
        PULR    R7                              ; 5251   02B7

L_5252:
        PSHR    R5                              ; 5252   0275
        MVII    #$02DF, R4                      ; 5253   02BC 02DF
        MVI     G_015F, R3                      ; 5255   0283 015F
        SDBD                                    ; 5257   0001
        MVII    #$0886, R1                      ; 5258   02B9 0086 0008
L_525B:
        SUBI    #$000A, R3                      ; 525B   033B 000A
        BMI     L_5266                          ; 525D   020B 0007

        MVO@    R1,     R4                      ; 525F   0261
        BEQ     L_5287                          ; 5260   0204 0025

        CMPI    #$02EA, R4                      ; 5262   037C 02EA
        BLT     L_525B                          ; 5264   0225 000A

L_5266:
        ADDI    #$0005, R3                      ; 5266   02FB 0005
        BMI     L_5271                          ; 5268   020B 0007

        ADDI    #$0008, R1                      ; 526A   02F9 0008
        MVO@    R1,     R4                      ; 526C   0261
        BEQ     L_5287                          ; 526D   0204 0018
        ADDI    #$0002, R7                      ; 526F   02FF 0002

L_5271:
        ADDI    #$0005, R3                      ; 5271   02FB 0005
L_5273:
        SDBD                                    ; 5273   0001
        MVII    #$1885, R1                      ; 5274   02B9 0085 0018
L_5277:
        SUBI    #$0002, R3                      ; 5277   033B 0002
        BMI     L_5280                          ; 5279   020B 0005

        MVO@    R1,     R4                      ; 527B   0261
        BEQ     L_5287                          ; 527C   0204 0009
        B       L_5277                          ; 527E   0220 0008

L_5280:
        ADDI    #$0002, R3                      ; 5280   02FB 0002
        BMI     L_5287                          ; 5282   020B 0003

        ADDI    #$0008, R1                      ; 5284   02F9 0008
        MVO@    R1,     R4                      ; 5286   0261
L_5287:
        CLRR    R3                              ; 5287   01DB
        MVO@    R3,     R4                      ; 5288   0263
        CMPI    #$02F0, R4                      ; 5289   037C 02F0
        BLT     L_5287                          ; 528B   0225 0005
        PULR    R7                              ; 528D   02B7

        ADDR    R4,     R2                      ; 528E   00E2
        MOVR    R4,     R6                      ; 528F   00A6
        MOVR    R4,     R2                      ; 5290   00A2
        MOVR    R4,     R2                      ; 5291   00A2
        ADDR    R4,     R2                      ; 5292   00E2
        ADDR    R5,     R6                      ; 5293   00EE
        NEGR    R2                              ; 5294   0022
        ADDR    R5,     R6                      ; 5295   00EE
        MOVR    R0,     R2                      ; 5296   0082
        ADDR    R5,     R6                      ; 5297   00EE
        MOVR    R5,     R6                      ; 5298   00AE
        MOVR    R5,     R0                      ; 5299   00A8
        ADDR    R5,     R6                      ; 529A   00EE
        NEGR    R2                              ; 529B   0022
        ADCR    R6                              ; 529C   002E
        ADDR    R5,     R6                      ; 529D   00EE
        MOVR    R0,     R2                      ; 529E   0082
        ADDR    R4,     R2                      ; 529F   00E2
        TSTR    R4                              ; 52A0   00A4
        ADDR    R5,     R0                      ; 52A1   00E8
        ADDR    R5,     R6                      ; 52A2   00EE
        MOVR    R5,     R2                      ; 52A3   00AA
        ADDR    R5,     R6                      ; 52A4   00EE
        MOVR    R4,     R2                      ; 52A5   00A2
        ADDR    R4,     R2                      ; 52A6   00E2
L_52A7:
        PSHR    R5                              ; 52A7   0275
        SDBD                                    ; 52A8   0001
        MVII    #$528E, R5                      ; 52A9   02BD 008E 0052
        MOVR    R5,     R4                      ; 52AC   00AC
        CLRR    R0                              ; 52AD   01C0
        CLRR    R1                              ; 52AE   01C9
L_52AF:
        CMPI    #$0014, R3                      ; 52AF   037B 0014
        BLT     L_52B9                          ; 52B1   0205 0006

        SUBI    #$0014, R3                      ; 52B3   033B 0014
        ADDI    #$0005, R4                      ; 52B5   02FC 0005
        B       L_52AF                          ; 52B7   0220 0009

L_52B9:
        CMPI    #$000A, R3                      ; 52B9   037B 000A
        BLT     L_52C1                          ; 52BB   0205 0004

        SUBI    #$000A, R3                      ; 52BD   033B 000A
        MVII    #$0001, R0                      ; 52BF   02B8 0001
L_52C1:
        SARC    R3,     1                       ; 52C1   007B
        RLC     R1,     1                       ; 52C2   0051
        ADDR    R3,     R5                      ; 52C3   00DD
        SLL     R3,     2                       ; 52C4   004F
        ADDR    R3,     R5                      ; 52C5   00DD
        MVII    #$0005, R3                      ; 52C6   02BB 0005
L_52C8:
        PSHR    R3                              ; 52C8   0273
        MVI@    R4,     R3                      ; 52C9   02A3
        TSTR    R0                              ; 52CA   0080
        BEQ     L_52CF                          ; 52CB   0204 0002

        SLL     R3,     2                       ; 52CD   004F
        SLL     R3,     2                       ; 52CE   004F
L_52CF:
        ANDI    #$00F0, R3                      ; 52CF   03BB 00F0
        PSHR    R3                              ; 52D1   0273
        MVI@    R5,     R3                      ; 52D2   02AB
        TSTR    R1                              ; 52D3   0089
        BNEQ    L_52D8                          ; 52D4   020C 0002

        SLR     R3,     2                       ; 52D6   0067
        SLR     R3,     2                       ; 52D7   0067
L_52D8:
        ANDI    #$000F, R3                      ; 52D8   03BB 000F
        XOR@    R6,     R3                      ; 52DA   03F3
        MVO@    R3,     R2                      ; 52DB   0253
        INCR    R2                              ; 52DC   000A
        PULR    R3                              ; 52DD   02B3
        DECR    R3                              ; 52DE   0013
        BNEQ    L_52C8                          ; 52DF   022C 0018
        PULR    R7                              ; 52E1   02B7

L_52E2:
        PSHR    R5                              ; 52E2   0275
        MVI     G_01A8, R3                      ; 52E3   0283 01A8
        ADDI    #$000A, R3                      ; 52E5   02FB 000A
        SDBD                                    ; 52E7   0001
        MVII    #$3893, R2                      ; 52E8   02BA 0093 0038
        MVII    #$0003, R1                      ; 52EB   02B9 0003
L_52ED:
        PSHR    R1                              ; 52ED   0271
        PSHR    R3                              ; 52EE   0273

        JSR     R5,     L_52A7                  ; 52EF   0004 0150 02A7

        PULR    R3                              ; 52F2   02B3
        PULR    R1                              ; 52F3   02B1
        ADDI    #$0003, R2                      ; 52F4   02FA 0003
        ADDI    #$0014, R3                      ; 52F6   02FB 0014
        DECR    R1                              ; 52F8   0011
        BNEQ    L_52ED                          ; 52F9   022C 000D

        MVO     R1,     G_0190                  ; 52FB   0241 0190
        PULR    R7                              ; 52FD   02B7

.GFX_LIST_52FE:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 52FE  CART PIC #00
        DECLE   $0000,  $0060,  $0060,  $007F   ; 5302  
        DECLE   $006C,  $00C4,  $0080,  $0000   ; 5306  CART PIC #01
        DECLE   $0000,  $0000,  $0000,  $0000   ; 530A  
        DECLE   $0000,  $0000,  $0060,  $0070   ; 530E  CART PIC #02
        DECLE   $000C,  $0003,  $0000,  $0000   ; 5312  
        DECLE   $0000,  $0000,  $001C,  $0066   ; 5316  CART PIC #03
        DECLE   $00C6,  $0000,  $0000,  $0000   ; 531A  
        DECLE   $0030,  $0018,  $0006,  $0001   ; 531E  CART PIC #04
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5322  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5326  CART PIC #05
        DECLE   $0000,  $0000,  $00FE,  $0006   ; 532A  
        DECLE   $0003,  $000E,  $0018,  $0030   ; 532E  CART PIC #06
        DECLE   $0060,  $0040,  $00C1,  $0082   ; 5332  
        DECLE   $0000,  $0000,  $0044,  $0044   ; 5336  CART PIC #07
        DECLE   $00EE,  $00EE,  $0000,  $0000   ; 533A  
        DECLE   $0000,  $0000,  $0040,  $0040   ; 533E  CART PIC #08
        DECLE   $00E0,  $00E0,  $0000,  $0000   ; 5342  
        DECLE   $0000,  $0000,  $0000,  $00E0   ; 5346  CART PIC #09
        DECLE   $00A2,  $00A7,  $00A2,  $00E0   ; 534A  
        DECLE   $0000,  $00E7,  $00EB,  $00ED   ; 534E  CART PIC #0A
        DECLE   $00EF,  $008F,  $009F,  $00FF   ; 5352  
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5356  CART PIC #0B
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 535A  
        DECLE   $0000,  $001C,  $0094,  $00DF   ; 535E  CART PIC #0C
        DECLE   $00F8,  $0078,  $0010,  $0038   ; 5362  
        DECLE   $0000,  $00C3,  $007E,  $00EB   ; 5366  CART PIC #0D
        DECLE   $007E,  $00FF,  $00BD,  $0066   ; 536A  
        DECLE   $0000,  $0028,  $0028,  $0014   ; 536E  CART PIC #0E
        DECLE   $001C,  $0038,  $0010,  $003E   ; 5372  
        DECLE   $0000,  $0038,  $0029,  $00FB   ; 5376  CART PIC #0F
        DECLE   $001F,  $001E,  $0008,  $001C   ; 537A  
        DECLE   $0000,  $00C3,  $007E,  $00D7   ; 537E  CART PIC #10
        DECLE   $007E,  $00FF,  $00BD,  $0066   ; 5382  
        DECLE   $0000,  $0014,  $0014,  $0028   ; 5386  CART PIC #11
        DECLE   $0038,  $001C,  $0008,  $007C   ; 538A  
        DECLE   $0000,  $0000,  $0000,  $003C   ; 538E  CART PIC #12
        DECLE   $0024,  $0038,  $0024,  $003C   ; 5392  
        DECLE   $0000,  $0000,  $0000,  $003C   ; 5396  CART PIC #13
        DECLE   $0024,  $0024,  $0024,  $003C   ; 539A  
        DECLE   $0000,  $0000,  $0000,  $0024   ; 539E  CART PIC #14
        DECLE   $0034,  $003C,  $002C,  $0024   ; 53A2  
        DECLE   $0000,  $0000,  $0000,  $0024   ; 53A6  CART PIC #15
        DECLE   $0024,  $0024,  $0024,  $003C   ; 53AA  
        DECLE   $0000,  $0000,  $0000,  $003C   ; 53AE  CART PIC #16
        DECLE   $0020,  $003C,  $0004,  $003C   ; 53B2  
        DECLE   $0000,  $0000,  $0000,  $0077   ; 53B6  CART PIC #17
        DECLE   $0054,  $0057,  $0051,  $0077   ; 53BA  
        DECLE   $0000,  $0000,  $0000,  $0017   ; 53BE  CART PIC #18
        DECLE   $0035,  $0015,  $0015,  $0017   ; 53C2  
        DECLE   $0020,  $0030,  $0030,  $0030   ; 53C6   0020 0030 0030 0030
        DECLE   $0030,  $0038,  $003F,  $005F   ; 53CA   0030 0038 003F 005F
        DECLE   $0080,  $0080,  $0080,  $0000   ; 53CE   0080 0080 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53D2   0000 0000 0000 0000
        DECLE   $0000,  $0030,  $0079,  $00EE   ; 53D6   0000 0030 0079 00EE
        DECLE   $00FC,  $00FE,  $0079,  $0000   ; 53DA   00FC 00FE 0079 0000
        DECLE   $0000,  $0030,  $0078,  $00EC   ; 53DE   0000 0030 0078 00EC
        DECLE   $00FF,  $00EC,  $0078,  $0000   ; 53E2   00FF 00EC 0078 0000
        DECLE   $0000,  $0000,  $00E0,  $0076   ; 53E6   0000 0000 00E0 0076
        DECLE   $0035,  $00B7,  $00FC,  $007C   ; 53EA   0035 00B7 00FC 007C
        DECLE   $003C,  $0018,  $0000,  $0000   ; 53EE   003C 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53F2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; 53F6   0000 0000 0000 0006
        DECLE   $0005,  $00BF,  $00FC,  $007C   ; 53FA   0005 00BF 00FC 007C
        DECLE   $003C,  $0078,  $0070,  $0060   ; 53FE   003C 0078 0070 0060
        DECLE   $00C0,  $0080,  $0000,  $0000   ; 5402   00C0 0080 0000 0000

        EIS                                     ; 5406   0002
        EIS                                     ; 5407   0002
        DIS                                     ; 5408   0003
        SETC                                    ; 5409   0007
        SETC                                    ; 540A   0007
        ADCR    R7                              ; 540B   002F

        SARC    R3,     2                       ; 540C   007F
L_540D:
        SARC    R2,     2                       ; 540D   007E
        SARC    R0,     2                       ; 540E   007C
        RSWD    R0                              ; 540F   0038
        MOVR    R7,     R6                      ; 5410   00BE
        ADDR    R6,     R6                      ; 5411   00F6
        ADDR    R4,     R7                      ; 5412   00E7

        DECLE   $00E2,  $00E0,  $00C0,  $0082   ; 5413   00E2 00E0 00C0 0082
        DECLE   $0082,  $00C6,  $00C6,  $006C   ; 5417   0082 00C6 00C6 006C
        DECLE   $006C,  $0038,  $0038,  $0078   ; 541B   006C 0038 0038 0078
        DECLE   $00B0,  $00E0,  $0000,  $0000   ; 541F   00B0 00E0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000F   ; 5423   0000 0000 0000 000F
        DECLE   $001F                           ; 5427   001F

        GSWD    R0                              ; 5428   0030
        ADCR    R7                              ; 5429   002F

        SLLC    R3,     2                       ; 542A   005F
L_542B:
        SLLC    R1,     1                       ; 542B   0059
        ADDR    R3,     R1                      ; 542C   00D9
        ADDR    R3,     R7                      ; 542D   00DF
        ADDR    R5,     R7                      ; 542E   00EF

        DECLE   $0030,  $003F                   ; 542F   0030 003F

        COMR    R3                              ; 5431   001B
        COMR    R0                              ; 5432   0018
        COMR    R0                              ; 5433   0018
        COMR    R0                              ; 5434   0018
        COMR    R4                              ; 5435   001C
        INCR    R7                              ; 5436   000F

        DECLE   $001F                           ; 5437   001F
L_5438:
        GSWD    R0                              ; 5438   0030
        ADCR    R7                              ; 5439   002F

        SLLC    R3,     2                       ; 543A   005F
L_543B:
        SLLC    R1,     1                       ; 543B   0059
        ADDR    R3,     R1                      ; 543C   00D9
        ADDR    R3,     R7                      ; 543D   00DF
        ADDR    R5,     R7                      ; 543E   00EF

        DECLE   $0030,  $001F,  $001C,  $0037   ; 543F   0030 001F 001C 0037
        DECLE   $006C,  $0032,  $001A,  $0016   ; 5443   006C 0032 001A 0016
        DECLE   $009C,  $00EA,  $007E,  $00BF   ; 5447   009C 00EA 007E 00BF
        DECLE   $00BB,  $00BE,  $00BC,  $0070   ; 544B   00BB 00BE 00BC 0070
        DECLE   $00F0,  $00E0,  $0060,  $0060   ; 544F   00F0 00E0 0060 0060
        DECLE   $0060,  $0060,  $0070,  $0016   ; 5453   0060 0060 0070 0016
        DECLE   $009C,  $00EA,  $007E,  $00BF   ; 5457   009C 00EA 007E 00BF
        DECLE   $00BB,  $00BE,  $00BC,  $0070   ; 545B   00BB 00BE 00BC 0070
        DECLE   $00F0,  $00F0,  $0038,  $0078   ; 545F   00F0 00F0 0038 0078
        DECLE   $006E,  $002C,  $0032,  $0000   ; 5463   006E 002C 0032 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5467   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 546B   0000 0000 0000

        MOVR    R4,     R5                      ; 546E   00A5
        MOVR    R4,     R5                      ; 546F   00A5
        MOVR    R7,     R5                      ; 5470   00BD
        MOVR    R7,     R5                      ; 5471   00BD
        MOVR    R7,     R5                      ; 5472   00BD
        ADDR    R3,     R3                      ; 5473   00DB
        SLR     R2,     2                       ; 5474   0066
        SARC    R2,     2                       ; 5475   007E
        ADDR    R4,     R7                      ; 5476   00E7

        ADDR    R3,     R3                      ; 5477   00DB
        MOVR    R7,     R5                      ; 5478   00BD
        MOVR    R4,     R5                      ; 5479   00A5
        MOVR    R7,     R5                      ; 547A   00BD
        ADDR    R3,     R3                      ; 547B   00DB
        ADDR    R4,     R7                      ; 547C   00E7

        SARC    R2,     2                       ; 547D   007E
        RSWD    R4                              ; 547E   003C
        SLR     R2,     2                       ; 547F   0066
        SLR     R2,     2                       ; 5480   0066
        SLR     R2,     2                       ; 5481   0066
        SLR     R2,     2                       ; 5482   0066
        SLR     R2,     2                       ; 5483   0066
        SLR     R2,     2                       ; 5484   0066
        ADDR    R4,     R7                      ; 5485   00E7
        MOVR    R0,     R7                      ; 5486   0087

        DECLE   $0010,  $0094,  $0054,  $0000   ; 5487   0010 0094 0054 0000
        DECLE   $0050,  $0000,  $0060,  $0000   ; 548B   0050 0000 0060 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 548F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00D4   ; 5493   0000 0000 0000 00D4
        DECLE   $0055,  $0001,  $0000,  $0000   ; 5497   0055 0001 0000 0000

        INCR    R0                              ; 549B   0008
        ADDR    R6,     R2                      ; 549C   00F2
        INCR    R0                              ; 549D   0008
        CLRR    R4                              ; 549E   01E4

        JSRE    R6,     L_5C05                  ; 549F   0004 025D 0005
        DECLE   $02F4,  $0008,  $03E7,  $0007   ; 54A2   02F4 0008 03E7 0007
        DECLE   $00D4,  $0007,  $01A8,  $0006   ; 54A6   00D4 0007 01A8 0006
        DECLE   $025E,  $0005,  $02F5,  $0008   ; 54AA   025E 0005 02F5 0008
        DECLE   $03E7                           ; 54AE   03E7

        CLRC                                    ; 54AF   0006
        TSTR    R6                              ; 54B0   00B6
        CLRC                                    ; 54B1   0006
        CMPR    R5,     R4                      ; 54B2   016C
        SETC                                    ; 54B3   0007
        MVO     R0,     .STIC.X.5               ; 54B4   0240 0005
        ADD@    R2,     R7                      ; 54B6   02D7

        DECLE   $0009,  $03E7,  $0005,  $0097   ; 54B7   0009 03E7 0005 0097
        DECLE   $0005,  $012E,  $0009,  $023F   ; 54BB   0005 012E 0009 023F
        DECLE   $0005,  $02D6,  $0009,  $03E7   ; 54BF   0005 02D6 0009 03E7
        DECLE   $0004,  $0079,  $0004,  $00F2   ; 54C3   0004 0079 0004 00F2
        DECLE   $000A,  $0221,  $0005,  $02B8   ; 54C7   000A 0221 0005 02B8
        DECLE   $000A,  $03E7,  $0003,  $005B   ; 54CB   000A 03E7 0003 005B
        DECLE   $0003,  $00B6,  $000C,  $0222   ; 54CF   0003 00B6 000C 0222
        DECLE   $0005,  $02B9,  $000A,  $03E7   ; 54D3   0005 02B9 000A 03E7
L_54D7:
        PSHR    R5                              ; 54D7   0275
        MVII    #$0250, R3                      ; 54D8   02BB 0250
        MVO     R3,     G_01B0                  ; 54DA   0243 01B0
L_54DC:
        CMPI    #$0290, R3                      ; 54DC   037B 0290
        BGT     L_5581                          ; 54DE   020E 00A1

        SDBD                                    ; 54E0   0001
        MVII    #$549B, R4                      ; 54E1   02BC 009B 0054
        ADD     G_01A8, R4                      ; 54E4   02C4 01A8
        MVII    #$03E7, R0                      ; 54E6   02B8 03E7

        JSR     R5,     X_RAND2                 ; 54E8   0004 0114 029E

        CLRR    R1                              ; 54EB   01C9
        MVII    #$01A8, R2                      ; 54EC   02BA 01A8
        INCR    R7                              ; 54EE   000F

L_54EF:
        INCR    R1                              ; 54EF   0009
L_54F0:
        INCR    R2                              ; 54F0   000A
        CMPI    #$0005, R1                      ; 54F1   0379 0005
        BEQ     L_54DC                          ; 54F3   0224 0018

        MVI@    R2,     R5                      ; 54F5   0295
        CMP@    R4,     R5                      ; 54F6   0365
        BLT     L_54FC                          ; 54F7   0205 0003

        INCR    R4                              ; 54F9   000C
        B       L_54EF                          ; 54FA   0220 000C

L_54FC:
        CMP@    R4,     R0                      ; 54FC   0360
        BGT     L_54EF                          ; 54FD   022E 000F

        INCR    R5                              ; 54FF   000D
        MVO@    R5,     R2                      ; 5500   0255
        CMPI    #$0004, R1                      ; 5501   0379 0004
        BEQ     L_551B                          ; 5503   0204 0016

        MVII    #$0001, R2                      ; 5505   02BA 0001
        CMPI    #$0003, R1                      ; 5507   0379 0003
        BEQ     L_554F                          ; 5509   0204 0044

        MVII    #$0008, R0                      ; 550B   02B8 0008
        SWAP    R0,     1                       ; 550D   0040
        CMPI    #$0001, R1                      ; 550E   0379 0001
        BLT     L_5516                          ; 5510   0205 0004
        BGT     L_5518                          ; 5512   020E 0004

        ADDI    #$000D, R0                      ; 5514   02F8 000D
L_5516:
        ADDI    #$0004, R0                      ; 5516   02F8 0004
L_5518:
        ADDI    #$00C6, R0                      ; 5518   02F8 00C6
        INCR    R7                              ; 551A   000F

L_551B:
        CLRR    R0                              ; 551B   01C0
L_551C:
        MOVR    R0,     R1                      ; 551C   0081
        CMPI    #$028E, R3                      ; 551D   037B 028E
        BEQ     L_5529                          ; 551F   0204 0008

        CMPI    #$0263, R3                      ; 5521   037B 0263
        BLT     L_552F                          ; 5523   0205 000A

        CMPI    #$0278, R3                      ; 5525   037B 0278
        BGE     L_552F                          ; 5527   020D 0006

L_5529:
        NEGR    R2                              ; 5529   0022
        TSTR    R1                              ; 552A   0089
        BEQ     L_552F                          ; 552B   0204 0002

        ADDI    #$0018, R1                      ; 552D   02F9 0018
L_552F:
        CMPI    #$028C, R3                      ; 552F   037B 028C
        BEQ     L_5544                          ; 5531   0204 0011

        CMPI    #$028E, R3                      ; 5533   037B 028E
        BEQ     L_5546                          ; 5535   0204 000F

        CMPI    #$0290, R3                      ; 5537   037B 0290
        BEQ     L_5548                          ; 5539   0204 000D

        MVO@    R1,     R3                      ; 553B   0259
        ADDR    R3,     R2                      ; 553C   00DA
        ADD     G_01A3, R1                      ; 553D   02C1 01A3
        MVO@    R1,     R2                      ; 553F   0251
L_5540:
        ADDI    #$0002, R3                      ; 5540   02FB 0002
        B       L_54DC                          ; 5542   0220 0067

L_5544:
        MVO     R1,     G_0357                  ; 5544   0241 0357
L_5546:
        MVO     R1,     G_0359                  ; 5546   0241 0359
L_5548:
        MVO     R1,     G_035B                  ; 5548   0241 035B
        CLRR    R1                              ; 554A   01C9
        MVO     R1,     G_0355                  ; 554B   0241 0355
        B       L_5540                          ; 554D   0220 000E

L_554F:
        CLRR    R0                              ; 554F   01C0
        MVO     R0,     G_01B3                  ; 5550   0240 01B3
        MVII    #$0005, R0                      ; 5552   02B8 0005

        JSR     R5,     X_RAND2                 ; 5554   0004 0114 029E
        JSR     R5,     X_CLR_BIT               ; 5557   0004 0114 02E6

        ANDR    R6,     R3                      ; 555A   01B3
        MVI     G_01B1, R1                      ; 555B   0281 01B1
        AND     G_01B3, R1                      ; 555D   0381 01B3
        BNEQ    L_554F                          ; 555F   022C 0011

        JSR     R5,     X_CLR_BIT               ; 5561   0004 0114 02E6

        ANDR    R6,     R1                      ; 5564   01B1
        CMPI    #$028E, R3                      ; 5565   037B 028E
        BEQ     L_5571                          ; 5567   0204 0008

        CMPI    #$0264, R3                      ; 5569   037B 0264
        BLT     L_5576                          ; 556B   0205 0009

        CMPI    #$0277, R3                      ; 556D   037B 0277
        BGT     L_5576                          ; 556F   020E 0005

L_5571:
        JSR     R5,     X_CLR_BIT               ; 5571   0004 0114 02E6

        ANDR    R6,     R2                      ; 5574   01B2
        NEGR    R2                              ; 5575   0022
L_5576:
        SDBD                                    ; 5576   0001
        MVII    #$18F0, R1                      ; 5577   02B9 00F0 0018
        ADDR    R0,     R1                      ; 557A   00C1
        SLL     R0,     2                       ; 557B   004C
        SLL     R0,     1                       ; 557C   0048
        ADDR    R0,     R1                      ; 557D   00C1
        B       L_552F                          ; 557E   0220 0050

L_5580:
        PSHR    R5                              ; 5580   0275
L_5581:
        MVII    #$0002, R1                      ; 5581   02B9 0002
        MVO     R1,     G_0147                  ; 5583   0241 0147
        DECR    R1                              ; 5585   0011
        MVO     R1,     G_01A7                  ; 5586   0241 01A7

L_5588:
        JSR     R5,     X_PLAY_MUS1             ; 5588   0004 0118 0327
        DECLE   $0151                           ; 558B  Note (short)
        DECLE   $0144                           ; 558C  Note (short)
        DECLE   $0154                           ; 558D  Note (short)
        DECLE   $0184                           ; 558E  Note (short)
        DECLE   $01D1                           ; 558F  Note (short)
        DECLE   $01C4                           ; 5590  Note (short)
        DECLE   $01D4                           ; 5591  Note (short)
        DECLE   $01F4                           ; 5592  Note (short)
        DECLE   $01D4                           ; 5593  Note (short)
        DECLE   $01C4                           ; 5594  Note (short)
        DECLE   $01D4                           ; 5595  Note (short)
        DECLE   $0154                           ; 5596  Note (short)
        DECLE   $0184                           ; 5597  Note (short)
        DECLE   $01C7                           ; 5598  Note (short)
        DECLE   $01A1                           ; 5599  Note (short)
        DECLE   $0134                           ; 559A  Note (short)
        DECLE   $0164                           ; 559B  Note (short)
        DECLE   $01A4                           ; 559C  Note (short)
        DECLE   $0181                           ; 559D  Note (short)
        DECLE   $0164                           ; 559E  Note (short)
        DECLE   $0154                           ; 559F  Note (short)
        DECLE   $0134                           ; 55A0  Note (short)
        DECLE   $0114                           ; 55A1  Note (short)
        DECLE   $0104                           ; 55A2  Note (short)
        DECLE   $0134                           ; 55A3  Note (short)
        DECLE   $0181                           ; 55A4  Note (short)
        DECLE   $01D4                           ; 55A5  Note (short)
        DECLE   $0000                           ; 55A6  End of music

        B       L_5588                          ; 55A7   0220 0020

L_55A9:
        MVI     G_035F, R0                      ; 55A9   0280 035F
        MVO     R0,     G_018C                  ; 55AB   0240 018C
        SWAP    R0,     1                       ; 55AD   0040
        MVO     R0,     G_018D                  ; 55AE   0240 018D
        MOVR    R5,     R7                      ; 55B0   00AF

L_55B1:
        PSHR    R5                              ; 55B1   0275
        MVI     G_01A7, R0                      ; 55B2   0280 01A7
        TSTR    R0                              ; 55B4   0080
        BEQ     L_55D1                          ; 55B5   0204 001A

        MVI     G_018D, R0                      ; 55B7   0280 018D
        SWAP    R0,     1                       ; 55B9   0040
        XOR     G_018C, R0                      ; 55BA   03C0 018C
        SDBD                                    ; 55BC   0001
        MVII    #$558B, R2                      ; 55BD   02BA 008B 0055
        CMPR    R2,     R0                      ; 55C0   0150
        BLT     L_5588                          ; 55C1   0225 003A

        ADDI    #$0019, R2                      ; 55C3   02FA 0019
        CMPR    R2,     R0                      ; 55C5   0150
        BGT     L_5588                          ; 55C6   022E 003F

        MVO     R0,     G_035F                  ; 55C8   0240 035F
        MVII    #$0002, R0                      ; 55CA   02B8 0002
        MVO     R0,     G_0149                  ; 55CC   0240 0149
        DECR    R0                              ; 55CE   0010
        MVO     R0,     G_0148                  ; 55CF   0240 0148
L_55D1:
        PULR    R7                              ; 55D1   02B7
L_55D2:
        B       L_58AE                          ; 55D2   0200 02DA
        B       L_5890                          ; 55D4   0200 02BA

        PSHR    R5                              ; 55D6   0275
        MVI     G_0190, R3                      ; 55D7   0283 0190
        CMPI    #$0001, R3                      ; 55D9   037B 0001
        BGT     L_5607                          ; 55DB   020E 002A
        BEQ     L_5616                          ; 55DD   0204 0037

        MVO     R3,     .STIC.VIDEN             ; 55DF   0243 0020
        MVI     G_01A6, R3                      ; 55E1   0283 01A6
        INCR    R3                              ; 55E3   000B
        MVO     R3,     G_01A6                  ; 55E4   0243 01A6
        SDBD                                    ; 55E6   0001
        MVII    #$38C0, R5                      ; 55E7   02BD 00C0 0038
        CMP     G_01A5, R3                      ; 55EA   0343 01A5
        BEQ     L_5619                          ; 55EC   0204 002B

        SUBI    #$0002, R3                      ; 55EE   033B 0002
        CMP     G_01A5, R3                      ; 55F0   0343 01A5
        BEQ     L_5651                          ; 55F2   0204 005D

        MOVR    R5,     R2                      ; 55F4   00AA
        MVI     G_016F, R1                      ; 55F5   0281 016F
        DECR    R1                              ; 55F7   0011
        BMI     L_5616                          ; 55F8   020B 001C

        CLRR    R1                              ; 55FA   01C9
        MVO     R1,     G_016F                  ; 55FB   0241 016F
        MVI     G_0169, R3                      ; 55FD   0283 0169
        ADDI    #$013B, R2                      ; 55FF   02FA 013B

        JSR     R5,     L_52A7                  ; 5601   0004 0150 02A7

L_5604:
        J       .EXEC.14E                       ; 5604   0004 0310 014E

L_5607:
        CMPI    #$0003, R3                      ; 5607   037B 0003
        BLT     L_5604                          ; 5609   0225 0006

        JSR     R5,     L_5746                  ; 560B   0004 0154 0346
        JSR     R5,     L_52E2                  ; 560E   0004 0150 02E2
        JSR     R5,     L_579E                  ; 5611   0004 0154 039E

        B       L_589E                          ; 5614   0200 0288
L_5616:
        J       .EXEC.127                       ; 5616   0004 0310 0127

L_5619:
        MVI     G_01A4, R3                      ; 5619   0283 01A4
        CMPI    #$0007, R3                      ; 561B   037B 0007
        BEQ     L_5695                          ; 561D   0204 0076

        MOVR    R5,     R4                      ; 561F   00AC
        ADD     G_01A3, R4                      ; 5620   02C4 01A3
        MVII    #$0003, R1                      ; 5622   02B9 0003
        MOVR    R6,     R2                      ; 5624   00B2
L_5625:
        INCR    R5                              ; 5625   000D
        INCR    R4                              ; 5626   000C
        MOVR    R5,     R6                      ; 5627   00AE
        MVII    #$0007, R0                      ; 5628   02B8 0007
L_562A:
        MVI@    R5,     R3                      ; 562A   02AB
        SWAP    R3,     1                       ; 562B   0043
        XOR@    R4,     R3                      ; 562C   03E3
        DECR    R4                              ; 562D   0014
        SLR     R3,     1                       ; 562E   0063
        MVO@    R3,     R4                      ; 562F   0263
        SWAP    R3,     1                       ; 5630   0043
        PSHR    R3                              ; 5631   0273
        DECR    R0                              ; 5632   0010
        BNEQ    L_562A                          ; 5633   022C 000A

        DECR    R1                              ; 5635   0011
        BNEQ    L_5625                          ; 5636   022C 0012

        MVII    #$0003, R1                      ; 5638   02B9 0003
L_563A:
        MVII    #$0007, R0                      ; 563A   02B8 0007
        INCR    R4                              ; 563C   000C
        INCR    R5                              ; 563D   000D
        INCR    R6                              ; 563E   000E
L_563F:
        MVI@    R4,     R3                      ; 563F   02A3
        SWAP    R3,     1                       ; 5640   0043
        XOR@    R5,     R3                      ; 5641   03EB
        DECR    R4                              ; 5642   0014
        SLL     R3,     1                       ; 5643   004B
        PSHR    R3                              ; 5644   0273
        SWAP    R3,     1                       ; 5645   0043
        MVO@    R3,     R4                      ; 5646   0263
        DECR    R0                              ; 5647   0010
        BNEQ    L_563F                          ; 5648   022C 000A

        DECR    R1                              ; 564A   0011
        BNEQ    L_563A                          ; 564B   022C 0012

L_564D:
        MOVR    R2,     R6                      ; 564D   0096
L_564E:
        J       .EXEC.150                       ; 564E   0004 0310 0150

L_5651:
        MVI     G_01A4, R0                      ; 5651   0280 01A4
        INCR    R0                              ; 5653   0008
        MVO     R0,     G_01A4                  ; 5654   0240 01A4
        DECR    R0                              ; 5656   0010
        CMPI    #$0007, R0                      ; 5657   0378 0007
        BEQ     L_5701                          ; 5659   0204 00A6

        ADDI    #$0030, R5                      ; 565B   02FD 0030
        MVI     G_01B2, R1                      ; 565D   0281 01B2
        MVO     R1,     G_01B3                  ; 565F   0241 01B3
        MVII    #$0007, R1                      ; 5661   02B9 0007
        MOVR    R6,     R2                      ; 5663   00B2
L_5664:
        DECR    R1                              ; 5664   0011
        BMI     L_5690                          ; 5665   020B 0029

        ADDI    #$0003, R5                      ; 5667   02FD 0003
        MOVR    R5,     R4                      ; 5669   00AC
        ADD     G_01A3, R4                      ; 566A   02C4 01A3
        MOVR    R5,     R6                      ; 566C   00AE
        MVI     G_01B3, R0                      ; 566D   0280 01B3
        SARC    R0,     1                       ; 566F   0078
        MVO     R0,     G_01B3                  ; 5670   0240 01B3
        MVII    #$0005, R0                      ; 5672   02B8 0005
        BC      L_5683                          ; 5674   0201 000D

L_5676:
        MVI@    R5,     R3                      ; 5676   02AB
        SWAP    R3,     1                       ; 5677   0043
        XOR@    R4,     R3                      ; 5678   03E3
        DECR    R4                              ; 5679   0014
        SLR     R3,     1                       ; 567A   0063
        MVO@    R3,     R4                      ; 567B   0263
        SWAP    R3,     1                       ; 567C   0043
        PSHR    R3                              ; 567D   0273
        DECR    R0                              ; 567E   0010
        BNEQ    L_5676                          ; 567F   022C 000A
        B       L_5664                          ; 5681   0220 001E

L_5683:
        MVI@    R4,     R3                      ; 5683   02A3
        SWAP    R3,     1                       ; 5684   0043
        XOR@    R5,     R3                      ; 5685   03EB
        DECR    R4                              ; 5686   0014
        SLL     R3,     1                       ; 5687   004B
        PSHR    R3                              ; 5688   0273
        SWAP    R3,     1                       ; 5689   0043
        MVO@    R3,     R4                      ; 568A   0263
        DECR    R0                              ; 568B   0010
        BNEQ    L_5683                          ; 568C   022C 000A
        B       L_5664                          ; 568E   0220 002B

L_5690:
        DECR    R1                              ; 5690   0011
        MVO     R1,     G_01A6                  ; 5691   0241 01A6
        B       L_564D                          ; 5693   0220 0047

L_5695:
        JSR     R5,     L_5746                  ; 5695   0004 0154 0346

        MVI     G_01B4, R1                      ; 5698   0281 01B4
        XORI    #$0001, R1                      ; 569A   03F9 0001
        MVO     R1,     G_01B4                  ; 569C   0241 01B4
        BNEQ    L_56E1                          ; 569E   020C 0041

        MVI     .BTAB.62,R1                     ; 56A0   0281 0262
        MVO     R1,     G_0357                  ; 56A2   0241 0357
        MVI     .BTAB.64,R1                     ; 56A4   0281 0264
        MVO     R1,     G_0359                  ; 56A6   0241 0359
        MVI     .BTAB.8A,R1                     ; 56A8   0281 028A
        MVO     R1,     G_035B                  ; 56AA   0241 035B

        JSR     R5,     L_5767                  ; 56AC   0004 0154 0367

        MVI     G_0358, R1                      ; 56AF   0281 0358
        TSTR    R1                              ; 56B1   0089
        BEQ     L_56B7                          ; 56B2   0204 0003

        INCR    R4                              ; 56B4   000C
        ADD     G_01A3, R1                      ; 56B5   02C1 01A3
L_56B7:
        MVO     R1,     .BTAB.76                ; 56B7   0241 0276
        MVI     G_035A, R1                      ; 56B9   0281 035A
        TSTR    R1                              ; 56BB   0089
        BEQ     L_56C1                          ; 56BC   0204 0003

        INCR    R4                              ; 56BE   000C
        ADD     G_01A3, R1                      ; 56BF   02C1 01A3
L_56C1:
        MVO     R1,     .BTAB.78                ; 56C1   0241 0278
        MVI     G_035C, R1                      ; 56C3   0281 035C
        TSTR    R1                              ; 56C5   0089
        BEQ     L_56CB                          ; 56C6   0204 0003

        ADD     G_01A3, R1                      ; 56C8   02C1 01A3
        INCR    R4                              ; 56CA   000C
L_56CB:
        MVO     R1,     .BTAB.50                ; 56CB   0241 0250
        CLRR    R1                              ; 56CD   01C9
        CMP     G_0357, R1                      ; 56CE   0341 0357
        BEQ     L_56D3                          ; 56D0   0204 0001

        INCR    R4                              ; 56D2   000C
L_56D3:
        CMP     G_0359, R1                      ; 56D3   0341 0359
        BEQ     L_56D8                          ; 56D5   0204 0001

        INCR    R4                              ; 56D7   000C
L_56D8:
        CMP     G_035B, R1                      ; 56D8   0341 035B
        BEQ     L_56DD                          ; 56DA   0204 0001

        INCR    R4                              ; 56DC   000C
L_56DD:
        MVO     R4,     G_01B0                  ; 56DD   0244 01B0
        B       L_564E                          ; 56DF   0220 0092

L_56E1:
        JSR     R5,     L_5767                  ; 56E1   0004 0154 0367

        MVI     .BTAB.75,R0                     ; 56E4   0280 0275
        TSTR    R0                              ; 56E6   0080
        BEQ     L_56ED                          ; 56E7   0204 0004

        MVI     G_0358, R1                      ; 56E9   0281 0358
        MVO     R1,     .BTAB.76                ; 56EB   0241 0276
L_56ED:
        MVI     .BTAB.79,R0                     ; 56ED   0280 0279
        TSTR    R0                              ; 56EF   0080
        BEQ     L_56F6                          ; 56F0   0204 0004

        MVI     G_035A, R1                      ; 56F2   0281 035A
        MVO     R1,     .BTAB.78                ; 56F4   0241 0278
L_56F6:
        MVI     .BTAB.51,R0                     ; 56F6   0280 0251
        TSTR    R0                              ; 56F8   0080
        BEQ     L_564E                          ; 56F9   0224 00AC

        MVI     G_035C, R1                      ; 56FB   0281 035C
        MVO     R1,     .BTAB.50                ; 56FD   0241 0250
        B       L_564E                          ; 56FF   0220 00B2

L_5701:
        JSR     R5,     L_5746                  ; 5701   0004 0154 0346

        MVI     G_01B4, R1                      ; 5704   0281 01B4
        TSTR    R1                              ; 5706   0089
        BNEQ    L_570E                          ; 5707   020C 0005

        JSR     R5,     L_580F                  ; 5709   0004 0158 000F

        B       L_572B                          ; 570C   0200 001D

L_570E:
        JSR     R5,     L_579E                  ; 570E   0004 0154 039E

        CLRR    R1                              ; 5711   01C9
        MVII    #$0250, R4                      ; 5712   02BC 0250
L_5714:
        MVI@    R4,     R0                      ; 5714   02A0
        SDBD                                    ; 5715   0001
        CMPI    #$08C6, R0                      ; 5716   0378 00C6 0008
        BLT     L_5727                          ; 5719   0205 000C

        SDBD                                    ; 571B   0001
        CMPI    #$1998, R0                      ; 571C   0378 0098 0019
        BGT     L_5727                          ; 571F   020E 0006

L_5721:
        CMPI    #$028A, R4                      ; 5721   037C 028A
        BLE     L_5714                          ; 5723   0226 0010
        B       L_572B                          ; 5725   0200 0004

L_5727:
        DECR    R4                              ; 5727   0014
        MVO@    R1,     R4                      ; 5728   0261
        B       L_5721                          ; 5729   0220 0009

L_572B:
        MVII    #$0003, R1                      ; 572B   02B9 0003
        MVI     G_01A8, R0                      ; 572D   0280 01A8
        SLR     R0,     1                       ; 572F   0060
        ADD     G_0170, R0                      ; 5730   02C0 0170
        CMPI    #$0010, R0                      ; 5732   0378 0010
        BLT     L_573C                          ; 5734   0205 0006

        DECR    R1                              ; 5736   0011
        CMPI    #$001E, R0                      ; 5737   0378 001E
        BLE     L_573C                          ; 5739   0206 0001

        DECR    R1                              ; 573B   0011
L_573C:
        MVO     R1,     G_01A5                  ; 573C   0241 01A5
        CLRR    R0                              ; 573E   01C0
        MVO     R0,     G_01A4                  ; 573F   0240 01A4
        DECR    R0                              ; 5741   0010
        MVO     R0,     G_01A6                  ; 5742   0240 01A6
        B       L_564E                          ; 5744   0220 00F7

L_5746:
        PSHR    R5                              ; 5746   0275
        SDBD                                    ; 5747   0001
        MVII    #$535E, R4                      ; 5748   02BC 005E 0053
        MVII    #$001A, R0                      ; 574B   02B8 001A
        SDBD                                    ; 574D   0001
        MVII    #$38C0, R5                      ; 574E   02BD 00C0 0038
        MOVR    R6,     R2                      ; 5751   00B2
        MOVR    R5,     R6                      ; 5752   00AE
        ADD     G_01A3, R6                      ; 5753   02C6 01A3
        CLRR    R3                              ; 5755   01DB
L_5756:
        MVI@    R4,     R1                      ; 5756   02A1
        MVO@    R1,     R5                      ; 5757   0269
        PSHR    R3                              ; 5758   0273
        MVI@    R4,     R1                      ; 5759   02A1
        MVO@    R1,     R5                      ; 575A   0269
        PSHR    R3                              ; 575B   0273
        MVI@    R4,     R1                      ; 575C   02A1
        MVO@    R1,     R5                      ; 575D   0269
        PSHR    R3                              ; 575E   0273
        MVI@    R4,     R1                      ; 575F   02A1
        MVO@    R1,     R5                      ; 5760   0269
        PSHR    R3                              ; 5761   0273
        DECR    R0                              ; 5762   0010
        BNEQ    L_5756                          ; 5763   022C 000E

        MOVR    R2,     R6                      ; 5765   0096
        PULR    R7                              ; 5766   02B7

L_5767:
        PSHR    R5                              ; 5767   0275
        MVII    #$0001, R2                      ; 5768   02BA 0001
        MVII    #$0250, R3                      ; 576A   02BB 0250

        JSR     R5,     L_5786                  ; 576C   0004 0154 0386

        PSHR    R1                              ; 576F   0271
        SUBI    #$0002, R2                      ; 5770   033A 0002
        MVII    #$0276, R3                      ; 5772   02BB 0276

        JSR     R5,     L_5786                  ; 5774   0004 0154 0386

        PULR    R4                              ; 5777   02B4
        ADDR    R1,     R4                      ; 5778   00CC
        PSHR    R4                              ; 5779   0274
        MVII    #$0001, R2                      ; 577A   02BA 0001
        MVII    #$0278, R3                      ; 577C   02BB 0278

        JSR     R5,     L_5786                  ; 577E   0004 0154 0386

        PULR    R4                              ; 5781   02B4
        ADDR    R1,     R4                      ; 5782   00CC
        MVO     R2,     G_0191                  ; 5783   0242 0191
        PULR    R7                              ; 5785   02B7

L_5786:
        PSHR    R5                              ; 5786   0275
        CLRR    R1                              ; 5787   01C9
        MVII    #$0012, R5                      ; 5788   02BD 0012
        CLRR    R0                              ; 578A   01C0
        SUBR    R2,     R3                      ; 578B   0113
        B       L_5792                          ; 578C   0200 0004

L_578E:
        TSTR    R0                              ; 578E   0080
        BEQ     L_5792                          ; 578F   0204 0001

        INCR    R1                              ; 5791   0009
L_5792:
        ADDR    R2,     R3                      ; 5792   00D3
        MVI@    R3,     R4                      ; 5793   029C
        MVO@    R0,     R3                      ; 5794   0258
        MOVR    R4,     R0                      ; 5795   00A0
        DECR    R5                              ; 5796   0015
        BPL     L_578E                          ; 5797   0223 000A

        SARC    R1,     1                       ; 5799   0079
        BNC     L_579D                          ; 579A   0209 0001

        INCR    R1                              ; 579C   0009
L_579D:
        PULR    R7                              ; 579D   02B7

L_579E:
        PSHR    R5                              ; 579E   0275
        MVI     G_01B5, R2                      ; 579F   0282 01B5
        INCR    R2                              ; 57A1   000A
        CMPI    #$00C7, R2                      ; 57A2   037A 00C7
        BGT     L_57A8                          ; 57A4   020E 0002

        MVO     R2,     G_01B5                  ; 57A6   0242 01B5
L_57A8:
        MVII    #$0357, R4                      ; 57A8   02BC 0357
        MVI@    R4,     R1                      ; 57AA   02A1
        TSTR    R1                              ; 57AB   0089
        BEQ     L_57B1                          ; 57AC   0204 0003

        JSR     R5,     L_57C2                  ; 57AE   0004 0154 03C2

L_57B1:
        MVO@    R1,     R4                      ; 57B1   0261
        MVI@    R4,     R1                      ; 57B2   02A1
        TSTR    R1                              ; 57B3   0089
        BEQ     L_57B9                          ; 57B4   0204 0003

        JSR     R5,     L_57C9                  ; 57B6   0004 0154 03C9

L_57B9:
        MVO@    R1,     R4                      ; 57B9   0261
        MVI@    R4,     R1                      ; 57BA   02A1
        TSTR    R1                              ; 57BB   0089
        BNEQ    L_57C0                          ; 57BC   020C 0002

        MVI     G_0355, R1                      ; 57BE   0281 0355
L_57C0:
        MVO@    R1,     R4                      ; 57C0   0261
        PULR    R7                              ; 57C1   02B7

L_57C2:
        PSHR    R5                              ; 57C2   0275
        MVII    #$0018, R2                      ; 57C3   02BA 0018
        MVII    #$0001, R5                      ; 57C5   02BD 0001
        B       L_57CE                          ; 57C7   0200 0005

L_57C9:
        PSHR    R5                              ; 57C9   0275
        MVII    #$0018, R2                      ; 57CA   02BA 0018
        NEGR    R2                              ; 57CC   0022
        CLRR    R5                              ; 57CD   01ED
L_57CE:
        MOVR    R1,     R0                      ; 57CE   0088
        SWAP    R0,     1                       ; 57CF   0040
        ANDI    #$0010, R0                      ; 57D0   03B8 0010
        BEQ     L_57EE                          ; 57D2   0204 001A

        MOVR    R1,     R0                      ; 57D4   0088
        ANDI    #$0007, R0                      ; 57D5   03B8 0007
        TSTR    R5                              ; 57D7   00AD
        BEQ     L_57DF                          ; 57D8   0204 0005

        JSR     R5,     X_CLR_BIT               ; 57DA   0004 0114 02E6

        ANDR    R6,     R2                      ; 57DD   01B2
        PULR    R7                              ; 57DE   02B7

L_57DF:
        CMPI    #$0005, R0                      ; 57DF   0378 0005
        BGE     L_57E8                          ; 57E1   020D 0005

L_57E3:
        JSR     R5,     X_SET_BIT               ; 57E3   0004 0114 02DB

        ANDR    R6,     R2                      ; 57E6   01B2
        PULR    R7                              ; 57E7   02B7

L_57E8:
        CLRR    R1                              ; 57E8   01C9

        JSR     R5,     X_SET_BIT               ; 57E9   0004 0114 02DB

        ANDR    R6,     R1                      ; 57EC   01B1
        PULR    R7                              ; 57ED   02B7

L_57EE:
        ADDR    R2,     R1                      ; 57EE   00D1
        PULR    R7                              ; 57EF   02B7

        DECLE   $0021,  $0050,  $005A,  $0061   ; 57F0   0021 0050 005A 0061
        DECLE   $0064,  $0042,  $004E,  $0061   ; 57F4   0064 0042 004E 0061
        DECLE   $0063,  $0064,  $0063,  $004A   ; 57F8   0063 0064 0063 004A
        DECLE   $0060,  $0063,  $0064,  $0084   ; 57FC   0060 0063 0064 0084
        DECLE   $0049,  $005E,  $0062,  $0064   ; 5800   0049 005E 0062 0064
        DECLE   $00A5,  $0043,  $005F,  $0061   ; 5804   00A5 0043 005F 0061
        DECLE   $0064,  $00C6,  $0043,  $0065   ; 5808   0064 00C6 0043 0065
        DECLE   $03FF                           ; 580C   03FF

        COMR    R1                              ; 580D   0019
        SLR     R1,     2                       ; 580E   0065
L_580F:
        PSHR    R5                              ; 580F   0275
        MVI     G_035B, R1                      ; 5810   0281 035B
        TSTR    R1                              ; 5812   0089
        BNEQ    L_581E                          ; 5813   020C 0009
        B       L_5822                          ; 5815   0200 000B

L_5817:
        SDBD                                    ; 5817   0001
        MVII    #$08C6, R1                      ; 5818   02B9 00C6 0008
        MVO     R1,     G_0355                  ; 581B   0241 0355
        PULR    R7                              ; 581D   02B7

L_581E:
        CLRR    R1                              ; 581E   01C9
        MVO     R1,     G_0355                  ; 581F   0241 0355
        PULR    R7                              ; 5821   02B7

L_5822:
        MVII    #$0065, R0                      ; 5822   02B8 0065

        JSR     R5,     X_RAND2                 ; 5824   0004 0114 029E

        MVI     G_01A8, R3                      ; 5827   0283 01A8
        SLR     R3,     1                       ; 5829   0063
        SDBD                                    ; 582A   0001
        MVII    #$57F0, R5                      ; 582B   02BD 00F0 0057
        ADDR    R3,     R5                      ; 582E   00DD
        MVI     G_01B5, R3                      ; 582F   0283 01B5
        CLRR    R1                              ; 5831   01C9
L_5832:
        CMP@    R5,     R3                      ; 5832   036B
        BLE     L_5839                          ; 5833   0206 0004

        ADDI    #$0004, R5                      ; 5835   02FD 0004
        B       L_5832                          ; 5837   0220 0006

L_5839:
        CMP@    R5,     R0                      ; 5839   0368
        BLE     L_583F                          ; 583A   0206 0003

        INCR    R1                              ; 583C   0009
        B       L_5839                          ; 583D   0220 0005

L_583F:
        CMPI    #$0001, R1                      ; 583F   0379 0001
        BLT     L_581E                          ; 5841   0225 0024
        BEQ     L_5817                          ; 5843   0224 002D

        CMPI    #$0002, R1                      ; 5845   0379 0002
        SDBD                                    ; 5847   0001
        MVII    #$1926, R1                      ; 5848   02B9 0026 0019
        BNEQ    L_5853                          ; 584B   020C 0006

        MVII    #$0040, R3                      ; 584D   02BB 0040
        MVII    #$0006, R0                      ; 584F   02B8 0006
        B       L_5859                          ; 5851   0200 0006

L_5853:
        SUBI    #$0009, R1                      ; 5853   0339 0009
        MVII    #$0020, R3                      ; 5855   02BB 0020
        MVII    #$0005, R0                      ; 5857   02B8 0005
L_5859:
        AND     G_01B1, R3                      ; 5859   0383 01B1
        BNEQ    L_581E                          ; 585B   022C 003E

        MVO     R1,     G_0355                  ; 585D   0241 0355

        JSR     R5,     X_CLR_BIT               ; 585F   0004 0114 02E6

        ANDR    R6,     R1                      ; 5862   01B1
        B       L_57E3                          ; 5863   0220 0081

        PSHR    R5                              ; 5865   0275
        TSTR    R0                              ; 5866   0080
        BMI     L_5899                          ; 5867   020B 0030

        CMP     G_0165, R1                      ; 5869   0341 0165
        BNEQ    L_588F                          ; 586B   020C 0022

        CMPI    #$000C, R0                      ; 586D   0378 000C
        BEQ     L_588F                          ; 586F   0204 001E
        BGT     L_5879                          ; 5871   020E 0006

        CMPI    #$0004, R0                      ; 5873   0378 0004
        BEQ     L_588F                          ; 5875   0204 0018
        BGT     L_587E                          ; 5877   020E 0005

L_5879:
        CLRR    R0                              ; 5879   01C0
        MVII    #$00A0, R2                      ; 587A   02BA 00A0
        B       L_5881                          ; 587C   0200 0003

L_587E:
        MVII    #$0008, R0                      ; 587E   02B8 0008
        MOVR    R0,     R2                      ; 5880   0082
L_5881:
        SWAP    R2,     1                       ; 5881   0042
        MVII    #$0060, R3                      ; 5882   02BB 0060
        XORR    R3,     R2                      ; 5884   01DA
        MVII    #$0325, R1                      ; 5885   02B9 0325
        MVII    #$003F, R3                      ; 5887   02BB 003F

        JSR     R5,     .EXEC.9A8               ; 5889   0004 0118 01A8

        CLRR    R0                              ; 588C   01C0
        MVO     R0,     G_01C4                  ; 588D   0240 01C4
L_588F:
        PULR    R7                              ; 588F   02B7

L_5890:
        PSHR    R5                              ; 5890   0275
        CLRR    R0                              ; 5891   01C0
        MVO     R0,     G_01C4                  ; 5892   0240 01C4
        MVO     R0,     G_013C                  ; 5894   0240 013C
        MVO     R0,     G_0329                  ; 5896   0240 0329
        PULR    R7                              ; 5898   02B7

L_5899:
        MVII    #$0001, R1                      ; 5899   02B9 0001
        MVO     R1,     G_01C4                  ; 589B   0241 01C4
        PULR    R7                              ; 589D   02B7

L_589E:
        JSR     R5,     L_58AB                  ; 589E   0004 0158 00AB
        DECLE   $0065,  $0058,  $0000,  $0000   ; 58A1   0065 0058 0000 0000

        RRC     R1,     2                       ; 58A5   0075
        SLLC    R1,     1                       ; 58A6   0059
        RRC     R1,     2                       ; 58A7   0075
        SLLC    R1,     1                       ; 58A8   0059
        RRC     R1,     2                       ; 58A9   0075
        SLLC    R1,     1                       ; 58AA   0059
L_58AB:
        MVO     R5,     G_035D                  ; 58AB   0245 035D
        PULR    R7                              ; 58AD   02B7

L_58AE:
        PSHR    R5                              ; 58AE   0275
        MVI     G_01C4, R1                      ; 58AF   0281 01C4
        DECR    R1                              ; 58B1   0011
        BMI     L_58BD                          ; 58B2   020B 0009
        BEQ     L_58BA                          ; 58B4   0204 0004

        MVO     R1,     G_01C4                  ; 58B6   0241 01C4
        B       L_58BD                          ; 58B8   0200 0003

L_58BA:
        JSR     R5,     L_5890                  ; 58BA   0004 0158 0090

L_58BD:
        MVI     G_016A, R0                      ; 58BD   0280 016A
        CMPI    #$0004, R0                      ; 58BF   0378 0004
        BEQ     L_5973                          ; 58C1   0204 00B0

        DECR    R0                              ; 58C3   0010
        BNEQ    L_58D7                          ; 58C4   020C 0011

        JSR     R5,     L_58D8                  ; 58C6   0004 0158 00D8

        MVI     G_0191, R0                      ; 58C9   0280 0191
        TSTR    R0                              ; 58CB   0080
        BEQ     L_58D1                          ; 58CC   0204 0003

        JSR     R5,     L_5977                  ; 58CE   0004 0158 0177
L_58D1:
        JSR     R5,     L_5979                  ; 58D1   0004 0158 0179
        JSR     R5,     L_597B                  ; 58D4   0004 0158 017B

L_58D7:
        PULR    R7                              ; 58D7   02B7

L_58D8:
        PSHR    R5                              ; 58D8   0275
        MVI     G_01BB, R0                      ; 58D9   0280 01BB
        DECR    R0                              ; 58DB   0010
        BMI     L_58E1                          ; 58DC   020B 0003

L_58DE:
        MVO     R0,     G_01BB                  ; 58DE   0240 01BB
        PULR    R7                              ; 58E0   02B7

L_58E1:
        MVI     G_01B8, R0                      ; 58E1   0280 01B8
        CMPI    #$00FF, R0                      ; 58E3   0378 00FF
        BEQ     L_58DE                          ; 58E5   0224 0008

        MVI     .BTAB.08,R0                     ; 58E7   0280 0208
        MVI     .BTAB.0B,R1                     ; 58E9   0281 020B
        MVI     .BTAB.1C,R2                     ; 58EB   0282 021C
        MVI     .BTAB.1F,R3                     ; 58ED   0283 021F
        MVII    #$0020, R5                      ; 58EF   02BD 0020
        MVI     G_01B9, R4                      ; 58F1   0284 01B9
        INCR    R4                              ; 58F3   000C
        CMPI    #$0003, R4                      ; 58F4   037C 0003
        MVO     R4,     G_01B9                  ; 58F6   0244 01B9
        BEQ     L_5916                          ; 58F8   0204 001C

        TSTR    R0                              ; 58FA   0080
        BEQ     L_58FE                          ; 58FB   0204 0001

        ADDR    R5,     R0                      ; 58FD   00E8
L_58FE:
        MVO     R0,     .BTAB.08                ; 58FE   0240 0208
        TSTR    R1                              ; 5900   0089
        BEQ     L_5904                          ; 5901   0204 0001

        ADDR    R5,     R1                      ; 5903   00E9
L_5904:
        MVO     R1,     .BTAB.0B                ; 5904   0241 020B
        TSTR    R2                              ; 5906   0092
        BEQ     L_590A                          ; 5907   0204 0001

        ADDR    R5,     R2                      ; 5909   00EA
L_590A:
        MVO     R2,     .BTAB.1C                ; 590A   0242 021C
        TSTR    R3                              ; 590C   009B
        BEQ     L_5912                          ; 590D   0204 0003

        ADDR    R5,     R3                      ; 590F   00EB
        MVO     R3,     .BTAB.1F                ; 5910   0243 021F
L_5912:
        MVII    #$0003, R0                      ; 5912   02B8 0003
        B       L_58DE                          ; 5914   0220 0037

L_5916:
        CLRR    R4                              ; 5916   01E4
        MVO     R4,     G_01B9                  ; 5917   0244 01B9
        MVI     G_01BA, R4                      ; 5919   0284 01BA
        INCR    R4                              ; 591B   000C
        ANDI    #$0007, R4                      ; 591C   03BC 0007
        MVO     R4,     G_01BA                  ; 591E   0244 01BA
        MOVR    R2,     R0                      ; 5920   0090
        TSTR    R0                              ; 5921   0080
        BEQ     L_5926                          ; 5922   0204 0002

        SUBI    #$0050, R0                      ; 5924   0338 0050
L_5926:
        MOVR    R1,     R3                      ; 5926   008B
        TSTR    R3                              ; 5927   009B
        BEQ     L_592C                          ; 5928   0204 0002

        SUBI    #$0030, R3                      ; 592A   033B 0030
L_592C:
        MVO     R0,     .BTAB.08                ; 592C   0240 0208
        MVO     R3,     .BTAB.1F                ; 592E   0243 021F
        SDBD                                    ; 5930   0001
        MVII    #$0808, R1                      ; 5931   02B9 0008 0008
        MOVR    R1,     R2                      ; 5934   008A
        ADDI    #$0008, R2                      ; 5935   02FA 0008
        MVII    #$0001, R0                      ; 5937   02B8 0001
        PSHR    R4                              ; 5939   0274

        JSR     R5,     L_5950                  ; 593A   0004 0158 0150

        MVO     R1,     .BTAB.0B                ; 593D   0241 020B
        MOVR    R2,     R1                      ; 593F   0091
        MVI     G_01BA, R4                      ; 5940   0284 01BA
        ADDI    #$0004, R4                      ; 5942   02FC 0004
        ANDI    #$0007, R4                      ; 5944   03BC 0007
        MVII    #$0001, R0                      ; 5946   02B8 0001
        PSHR    R4                              ; 5948   0274

        JSR     R5,     L_5950                  ; 5949   0004 0158 0150

        MVO     R1,     .BTAB.1C                ; 594C   0241 021C
        B       L_5912                          ; 594E   0220 003D

L_5950:
        DECR    R4                              ; 5950   0014
        BMI     L_5956                          ; 5951   020B 0003

        SLL     R0,     1                       ; 5953   0048
        B       L_5950                          ; 5954   0220 0005

L_5956:
        MVI     G_01B8, R4                      ; 5956   0284 01B8
        ANDR    R0,     R4                      ; 5958   0184
        PULR    R0                              ; 5959   02B0
        BNEQ    L_5971                          ; 595A   020C 0015

        CMPI    #$0005, R0                      ; 595C   0378 0005
        BGT     L_5969                          ; 595E   020E 0009

        CMPI    #$0003, R0                      ; 5960   0378 0003
        BGT     L_596B                          ; 5962   020E 0007

        CMPI    #$0001, R0                      ; 5964   0378 0001
        BGT     L_596D                          ; 5966   020E 0005

        INCR    R0                              ; 5968   0008
L_5969:
        ADDR    R0,     R1                      ; 5969   00C1
        MOVR    R5,     R7                      ; 596A   00AF

L_596B:
        SUBI    #$0007, R0                      ; 596B   0338 0007
L_596D:
        ADDI    #$0004, R0                      ; 596D   02F8 0004
        B       L_5969                          ; 596F   0220 0007

L_5971:
        CLRR    R1                              ; 5971   01C9
        MOVR    R5,     R7                      ; 5972   00AF
L_5973:
        B       L_5C8A                          ; 5973   0200 0315
        B       L_5C8C                          ; 5975   0200 0315
L_5977:
        B       L_5C8E                          ; 5977   0200 0315
L_5979:
        B       L_5C90                          ; 5979   0200 0315

L_597B:
        PSHR    R5                              ; 597B   0275
        MVI     G_01A9, R0                      ; 597C   0280 01A9
        DECR    R0                              ; 597E   0010
        BMI     L_5986                          ; 597F   020B 0005

        MVO     R0,     G_01A9                  ; 5981   0240 01A9
        BEQ     L_5990                          ; 5983   0204 000B
        PULR    R7                              ; 5985   02B7

L_5986:
        MVI     G_01AA, R0                      ; 5986   0280 01AA
        DECR    R0                              ; 5988   0010
        BMI     L_59B0                          ; 5989   020B 0025
        BEQ     L_5A09                          ; 598B   0204 007C

        MVO     R0,     G_01AA                  ; 598D   0240 01AA
        PULR    R7                              ; 598F   02B7

L_5990:
        MVII    #$0025, R0                      ; 5990   02B8 0025

        JSR     R5,     X_RAND2                 ; 5992   0004 0114 029E

        CMPI    #$0006, R0                      ; 5995   0378 0006
        BLT     L_5A2B                          ; 5997   0205 0092

        CMPI    #$0019, R0                      ; 5999   0378 0019
        BGT     L_5A2B                          ; 599B   020E 008E

        XORI    #$0100, R0                      ; 599D   03F8 0100
        SARC    R0,     1                       ; 599F   0078
        INCR    R0                              ; 59A0   0008
        MVO     R0,     G_01AD                  ; 59A1   0240 01AD
        BNC     L_59C1                          ; 59A3   0209 001C

L_59A5:
        MVII    #$001F, R0                      ; 59A5   02B8 001F

        JSR     R5,     X_RAND2                 ; 59A7   0004 0114 029E

        ADDI    #$0026, R0                      ; 59AA   02F8 0026
        MVO     R0,     G_01AA                  ; 59AC   0240 01AA
        B       L_59B8                          ; 59AE   0200 0008

L_59B0:
        MVI     G_01AC, R0                      ; 59B0   0280 01AC
        DECR    R0                              ; 59B2   0010
        BMI     L_59C1                          ; 59B3   020B 000C

        MVO     R0,     G_01AC                  ; 59B5   0240 01AC
        PULR    R7                              ; 59B7   02B7

L_59B8:
        SDBD                                    ; 59B8   0001
        MVII    #$206A, R1                      ; 59B9   02B9 006A 0020
        MVI     G_01AA, R0                      ; 59BC   0280 01AA
        TSTR    R0                              ; 59BE   0080
        BNEQ    L_59C9                          ; 59BF   020C 0008

L_59C1:
        SDBD                                    ; 59C1   0001
        MVII    #$205A, R1                      ; 59C2   02B9 005A 0020
        MVII    #$0007, R0                      ; 59C5   02B8 0007
        MVO     R0,     G_01AC                  ; 59C7   0240 01AC
L_59C9:
        MVO     R1,     .BTAB.28                ; 59C9   0241 0228
        MVII    #$0006, R0                      ; 59CB   02B8 0006
        MVII    #$0229, R4                      ; 59CD   02BC 0229

        JSR     R5,     X_FILL_ZERO             ; 59CF   0004 0114 0338

        MVI     G_01AD, R0                      ; 59D2   0280 01AD
        CMPI    #$007F, R0                      ; 59D4   0378 007F
        BGT     L_59EB                          ; 59D6   020E 0013

        SUBI    #$0005, R0                      ; 59D8   0338 0005
        BMI     L_5A09                          ; 59DA   020B 002D

        MVO     R0,     G_01AD                  ; 59DC   0240 01AD
        MVII    #$0002, R3                      ; 59DE   02BB 0002
        MOVR    R3,     R1                      ; 59E0   0099
        MVII    #$022A, R4                      ; 59E1   02BC 022A

        JSR     R5,     X_PRNUM_RGT             ; 59E3   0004 0118 00C5

        MVII    #$0082, R0                      ; 59E6   02B8 0082
        MVO     R0,     .BTAB.2C                ; 59E8   0240 022C
        PULR    R7                              ; 59EA   02B7

L_59EB:
        DECR    R0                              ; 59EB   0010
        MVO     R0,     G_01AD                  ; 59EC   0240 01AD
        SUBI    #$0080, R0                      ; 59EE   0338 0080
        BMI     L_5A09                          ; 59F0   020B 0017

        MVII    #$0002, R3                      ; 59F2   02BB 0002
        MVII    #$0229, R4                      ; 59F4   02BC 0229
        SDBD                                    ; 59F6   0001
        MVII    #$0881, R1                      ; 59F7   02B9 0081 0008
L_59FA:
        CMPR    R3,     R0                      ; 59FA   0158
        BLT     L_5A01                          ; 59FB   0205 0004

        MVO@    R1,     R4                      ; 59FD   0261
        SUBR    R3,     R0                      ; 59FE   0118
        B       L_59FA                          ; 59FF   0220 0006

L_5A01:
        TSTR    R0                              ; 5A01   0080
        BEQ     L_5A07                          ; 5A02   0204 0003

        ADDI    #$0008, R1                      ; 5A04   02F9 0008
        MVO@    R1,     R4                      ; 5A06   0261
L_5A07:
        PULR    R7                              ; 5A07   02B7

L_5A08:
        PSHR    R5                              ; 5A08   0275
L_5A09:
        MVII    #$0020, R2                      ; 5A09   02BA 0020
        SWAP    R2,     1                       ; 5A0B   0042
        CLRR    R1                              ; 5A0C   01C9
        MVII    #$01AA, R4                      ; 5A0D   02BC 01AA
        MVO@    R1,     R4                      ; 5A0F   0261
        MVO@    R1,     R4                      ; 5A10   0261
        MVO@    R1,     R4                      ; 5A11   0261
        MVO@    R1,     R4                      ; 5A12   0261
        SDBD                                    ; 5A13   0001
        MVII    #$08B8, R1                      ; 5A14   02B9 00B8 0008
        MVII    #$0228, R4                      ; 5A17   02BC 0228
        ADDR    R1,     R2                      ; 5A19   00CA
        MVO@    R2,     R4                      ; 5A1A   0262
        MVO@    R1,     R4                      ; 5A1B   0261
        MVO@    R1,     R4                      ; 5A1C   0261
        MVO@    R1,     R4                      ; 5A1D   0261
        MVO@    R1,     R4                      ; 5A1E   0261
        MVO@    R1,     R4                      ; 5A1F   0261
        MVO@    R1,     R4                      ; 5A20   0261
        MVII    #$0023, R0                      ; 5A21   02B8 0023

        JSR     R5,     X_RAND2                 ; 5A23   0004 0114 029E

        ADDI    #$0022, R0                      ; 5A26   02F8 0022
        MVO     R0,     G_01A9                  ; 5A28   0240 01A9
        PULR    R7                              ; 5A2A   02B7

L_5A2B:
        PSHR    R0                              ; 5A2B   0270
        MVII    #$000F, R0                      ; 5A2C   02B8 000F

        JSR     R5,     X_RAND2                 ; 5A2E   0004 0114 029E

        ADDI    #$0003, R0                      ; 5A31   02F8 0003
        MOVR    R0,     R3                      ; 5A33   0083
        SLL     R3,     2                       ; 5A34   004F
        ADDR    R0,     R3                      ; 5A35   00C3
        MVO     R3,     G_01AD                  ; 5A36   0243 01AD
        PULR    R0                              ; 5A38   02B0
        SARC    R0,     1                       ; 5A39   0078
        BNC     L_59A5                          ; 5A3A   0229 0096
        B       L_59C1                          ; 5A3C   0220 007C

        PSHR    R5                              ; 5A3E   0275
        CLRR    R0                              ; 5A3F   01C0

        JSR     R5,     .EXEC.772               ; 5A40   0004 0114 0372

        MVI     G_0324, R4                      ; 5A43   0284 0324
        ANDI    #$00FF, R4                      ; 5A45   03BC 00FF
        CMPI    #$0004, R4                      ; 5A47   037C 0004
        BNEQ    L_5A65                          ; 5A49   020C 001A

        MVI     G_016A, R1                      ; 5A4B   0281 016A
        CMPI    #$0001, R1                      ; 5A4D   0379 0001
        BEQ     L_5A58                          ; 5A4F   0204 0007

        CMPI    #$0008, R3                      ; 5A51   037B 0008
        BGT     L_5A57                          ; 5A53   020E 0002

        MVO     R0,     G_031E                  ; 5A55   0240 031E
L_5A57:
        PULR    R7                              ; 5A57   02B7

L_5A58:
        CMPI    #$0020, R3                      ; 5A58   037B 0020
        BGT     L_5A65                          ; 5A5A   020E 0009

        CMPI    #$0007, R3                      ; 5A5C   037B 0007
        BLT     L_5A9A                          ; 5A5E   0205 003A

        CMPI    #$0016, R3                      ; 5A60   037B 0016
        BLT     L_5A79                          ; 5A62   0205 0015
        PULR    R7                              ; 5A64   02B7

L_5A65:
        MVO     R0,     G_031E                  ; 5A65   0240 031E
        CMPI    #$003F, R3                      ; 5A67   037B 003F
        BGT     L_5B0C                          ; 5A69   020E 00A1

        CMPI    #$001F, R3                      ; 5A6B   037B 001F
        BGT     L_5BD5                          ; 5A6D   020E 0166

        CMPI    #$006F, R2                      ; 5A6F   037A 006F
        BGT     L_5A9D                          ; 5A71   020E 002A

        CMPI    #$0040, R2                      ; 5A73   037A 0040
        BLT     L_5AAC                          ; 5A75   0205 0035
        B       L_5A9D                          ; 5A77   0200 0024

L_5A79:
        MVO     R0,     G_031E                  ; 5A79   0240 031E
        CMPI    #$0067, R2                      ; 5A7B   037A 0067
        BGT     L_5A9D                          ; 5A7D   020E 001E

        CMPI    #$0048, R2                      ; 5A7F   037A 0048
        BLE     L_5A9D                          ; 5A81   0206 001A

        CMPI    #$0063, R2                      ; 5A83   037A 0063
        BLT     L_5BAD                          ; 5A85   0205 0126

        MVII    #$020B, R1                      ; 5A87   02B9 020B
        CMP@    R1,     R0                      ; 5A89   0348
        BEQ     L_5A94                          ; 5A8A   0204 0008

        CMPI    #$000F, R3                      ; 5A8C   037B 000F
        BLE     L_5BBD                          ; 5A8E   0206 012D

        CMP     .BTAB.1F,R0                     ; 5A90   0340 021F
        BEQ     L_5BBD                          ; 5A92   0204 0129

L_5A94:
        MVII    #$0007, R0                      ; 5A94   02B8 0007
        MVII    #$021F, R1                      ; 5A96   02B9 021F
        B       L_5BBD                          ; 5A98   0200 0123

L_5A9A:
        CLRR    R0                              ; 5A9A   01C0
        MVO     R0,     G_031E                  ; 5A9B   0240 031E
L_5A9D:
        CLRR    R0                              ; 5A9D   01C0
L_5A9E:
        DECR    R0                              ; 5A9E   0010
        MVI     G_0169, R3                      ; 5A9F   0283 0169
        DECR    R3                              ; 5AA1   0013
        CMPI    #$0004, R3                      ; 5AA2   037B 0004
        BEQ     L_5B17                          ; 5AA4   0204 0071

        MVO     R3,     G_0169                  ; 5AA6   0243 0169
        MVO     R3,     G_016F                  ; 5AA8   0243 016F
        B       L_5B17                          ; 5AAA   0200 006B

L_5AAC:
        MVI     G_01AD, R0                      ; 5AAC   0280 01AD
        TSTR    R0                              ; 5AAE   0080
        BEQ     L_5A9D                          ; 5AAF   0224 0013

        MVI     G_01AA, R3                      ; 5AB1   0283 01AA
        PSHR    R3                              ; 5AB3   0273
        PSHR    R0                              ; 5AB4   0270

        JSR     R5,     L_5A08                  ; 5AB5   0004 0158 0208

        SDBD                                    ; 5AB8   0001
        MVII    #$5AE7, R1                      ; 5AB9   02B9 00E7 005A

        JSR     R5,     L_5AD4                  ; 5ABC   0004 0158 02D4

        PULR    R0                              ; 5ABF   02B0
        PULR    R3                              ; 5AC0   02B3
        MOVR    R0,     R4                      ; 5AC1   0084
        ANDI    #$007F, R0                      ; 5AC2   03B8 007F
        TSTR    R3                              ; 5AC4   009B
        BEQ     L_5AC8                          ; 5AC5   0204 0001

        NEGR    R0                              ; 5AC7   0020
L_5AC8:
        CMPI    #$0080, R4                      ; 5AC8   037C 0080
        BGE     L_5A9E                          ; 5ACA   022D 002D
        B       L_5AF0                          ; 5ACC   0200 0022

L_5ACE:
        PSHR    R5                              ; 5ACE   0275
        SDBD                                    ; 5ACF   0001
        MVII    #$5AE1, R1                      ; 5AD0   02B9 00E1 005A
        INCR    R7                              ; 5AD3   000F

L_5AD4:
        PSHR    R5                              ; 5AD4   0275

L_5AD5:
        JSR     R5,     L_55A9                  ; 5AD5   0004 0154 01A9

        MOVR    R1,     R5                      ; 5AD8   008D
        J       X_PLAY_MUS3                     ; 5AD9   0004 0318 0395

        DECLE   $01E4,  $01E4,  $01E4,  $01E4   ; 5ADC   01E4 01E4 01E4 01E4
        DECLE   $01E4,  $02F6,  $0000           ; 5AE0   01E4 02F6 0000
L_5AE3:
        JSR     R5,     L_55B1                  ; 5AE3   0004 0154 01B1

        PULR    R7                              ; 5AE6   02B7

        DECLE   $01D4,  $01E4,  $01D4,  $01E4   ; 5AE7   01D4 01E4 01D4 01E4
        DECLE   $01D4,  $01E4,  $0000           ; 5AEB   01D4 01E4 0000

        B       L_5AE3                          ; 5AEE   0220 000C

L_5AF0:
        JSR     R5,     L_5AF5                  ; 5AF0   0004 0158 02F5

        B       L_5A9D                          ; 5AF3   0220 0057

L_5AF5:
        PSHR    R5                              ; 5AF5   0275
        MVI     G_0165, R3                      ; 5AF6   0283 0165
        MVII    #$0163, R2                      ; 5AF8   02BA 0163
        TSTR    R3                              ; 5AFA   009B
        BEQ     L_5AFF                          ; 5AFB   0204 0002

        MVII    #$0166, R2                      ; 5AFD   02BA 0166
L_5AFF:
        MVI@    R2,     R1                      ; 5AFF   0291
        SWAP    R1,     1                       ; 5B00   0041
        INCR    R2                              ; 5B01   000A
        XOR@    R2,     R1                      ; 5B02   03D1
        ADDR    R1,     R0                      ; 5B03   00C8
        MVO@    R0,     R2                      ; 5B04   0250
        SWAP    R0,     1                       ; 5B05   0040
        DECR    R2                              ; 5B06   0012
        MVO@    R0,     R2                      ; 5B07   0250

        JSR     R5,     L_520D                  ; 5B08   0004 0150 020D

        PULR    R7                              ; 5B0B   02B7

L_5B0C:
        MVI     G_01A7, R1                      ; 5B0C   0281 01A7
        XORI    #$0001, R1                      ; 5B0E   03F9 0001
        MVO     R1,     G_01A7                  ; 5B10   0241 01A7

        JSR     R5,     L_5ACE                  ; 5B12   0004 0158 02CE

        B       L_5A9D                          ; 5B15   0220 0079

L_5B17:
        ADD     G_015F, R0                      ; 5B17   02C0 015F
        BPL     L_5B1C                          ; 5B19   0203 0001

L_5B1B:
        CLRR    R0                              ; 5B1B   01C0
L_5B1C:
        MVO     R0,     G_015F                  ; 5B1C   0240 015F

        JSR     R5,     L_5252                  ; 5B1E   0004 0150 0252

        MVI     G_0180, R0                      ; 5B21   0280 0180
        ANDI    #$0076, R0                      ; 5B23   03B8 0076
        ADD     G_01B0, R0                      ; 5B25   02C0 01B0
        BNEQ    L_5B2F                          ; 5B27   020C 0006

        MVI     G_01B8, R0                      ; 5B29   0280 01B8
        CMPI    #$00FF, R0                      ; 5B2B   0378 00FF
        BEQ     L_5B83                          ; 5B2D   0204 0054

L_5B2F:
        MVI     G_015F, R0                      ; 5B2F   0280 015F
        TSTR    R0                              ; 5B31   0080
        BEQ     L_5B35                          ; 5B32   0204 0001
        PULR    R7                              ; 5B34   02B7

L_5B35:
        JSR     R5,     .EXEC.7B3               ; 5B35   0004 0114 03B3

        CLRR    R0                              ; 5B38   01C0
        MVO     R0,     G_015F                  ; 5B39   0240 015F
        MVO     R0,     G_01A7                  ; 5B3B   0240 01A7
        MVO     R0,     G_016A                  ; 5B3D   0240 016A
        INCR    R0                              ; 5B3F   0008
        MVO     R0,     G_0190                  ; 5B40   0240 0190

        JSR     R5,     L_5252                  ; 5B42   0004 0150 0252
        JSR     R5,     L_5ACE                  ; 5B45   0004 0158 02CE

        MVI     G_0161, R0                      ; 5B48   0280 0161
        TSTR    R0                              ; 5B4A   0080
        BEQ     L_5B6F                          ; 5B4B   0204 0022

        MVI     G_0165, R1                      ; 5B4D   0281 0165
        ADDI    #$016B, R1                      ; 5B4F   02F9 016B
        MVII    #$0001, R3                      ; 5B51   02BB 0001
        MVO@    R3,     R1                      ; 5B53   024B
        XOR     G_0165, R0                      ; 5B54   03C0 0165
        MVO     R0,     G_0165                  ; 5B56   0240 0165
        ADDI    #$016B, R0                      ; 5B58   02F8 016B
        MOVR    R0,     R1                      ; 5B5A   0081
        CMP@    R1,     R3                      ; 5B5B   034B
        BEQ     L_5B6F                          ; 5B5C   0204 0011

L_5B5E:
        JSR     R5,     L_5121                  ; 5B5E   0004 0150 0121

        CLRR    R0                              ; 5B61   01C0
        MVO     R0,     G_0104                  ; 5B62   0240 0104

        JSR     R5,     .EXEC.A61               ; 5B64   0004 0118 0261

        RRC     R0,     1                       ; 5B67   0070
        MVII    #$0008, R0                      ; 5B68   02B8 0008
        MVO     R0,     G_0104                  ; 5B6A   0240 0104
        J       L_50AD                          ; 5B6C   0004 0350 00AD

L_5B6F:
        MVII    #$0007, R3                      ; 5B6F   02BB 0007
        MVII    #$027E, R4                      ; 5B71   02BC 027E

        JSR     R5,     X_PRINT_R5              ; 5B73   0004 0118 007B
        STRING  "GAME OVER"                     ; 5B76  
        DECLE   $0000                           ; 5B7F   0000

        J       L_5148                          ; 5B80   0004 0350 0148

L_5B83:
        JSR     R5,     .EXEC.7B3               ; 5B83   0004 0114 03B3

        MVII    #$0003, R0                      ; 5B86   02B8 0003
        MVO     R0,     G_016A                  ; 5B88   0240 016A
        MVII    #$0001, R0                      ; 5B8A   02B8 0001
        MVO     R0,     G_0190                  ; 5B8C   0240 0190

L_5B8E:
        JSR     R5,     X_PLAY_MUS2             ; 5B8E   0004 0118 035D
        DECLE   $00C0                           ; 5B91  Note (short)
        DECLE   $00E0                           ; 5B92  Note (short)
        DECLE   $0100                           ; 5B93  Note (short)
        DECLE   $0000                           ; 5B94  End of music

        MVI     G_015F, R0                      ; 5B95   0280 015F
        DECR    R0                              ; 5B97   0010
        BMI     L_5BA8                          ; 5B98   020B 000E

        MVO     R0,     G_015F                  ; 5B9A   0240 015F
        BEQ     L_5BA8                          ; 5B9C   0204 000A

        MVII    #$0005, R0                      ; 5B9E   02B8 0005

        JSR     R5,     L_5AF5                  ; 5BA0   0004 0158 02F5
        JSR     R5,     L_5252                  ; 5BA3   0004 0150 0252

        B       L_5B8E                          ; 5BA6   0220 0019

L_5BA8:
        MVII    #$0004, R0                      ; 5BA8   02B8 0004
        MVO     R0,     G_016A                  ; 5BAA   0240 016A
        PULR    R7                              ; 5BAC   02B7

L_5BAD:
        MVII    #$0004, R0                      ; 5BAD   02B8 0004
        MVII    #$021C, R1                      ; 5BAF   02B9 021C
        CMPI    #$000F, R3                      ; 5BB1   037B 000F
        BGT     L_5BBD                          ; 5BB3   020E 0008

        CLRR    R3                              ; 5BB5   01DB
        CMP     .BTAB.08,R3                     ; 5BB6   0343 0208
        BEQ     L_5BBD                          ; 5BB8   0204 0003

        DECR    R0                              ; 5BBA   0010
        MVII    #$0208, R1                      ; 5BBB   02B9 0208
L_5BBD:
        CLRR    R5                              ; 5BBD   01ED
        MVO@    R5,     R1                      ; 5BBE   024D
        ADD     G_01BA, R0                      ; 5BBF   02C0 01BA
        ANDI    #$0007, R0                      ; 5BC1   03B8 0007

        JSR     R5,     X_CLR_BIT               ; 5BC3   0004 0114 02E6

        ANDR    R7,     R0                      ; 5BC6   01B8

        JSR     R5,     L_5ACE                  ; 5BC7   0004 0158 02CE

        MVI     G_0169, R0                      ; 5BCA   0280 0169
        MOVR    R0,     R3                      ; 5BCC   0083
        INCR    R3                              ; 5BCD   000B
        MVO     R3,     G_0169                  ; 5BCE   0243 0169
        B       L_5AF0                          ; 5BD0   0220 00E1

L_5BD2:
        MOVR    R5,     R2                      ; 5BD2   00AA
        ADDI    #$0004, R3                      ; 5BD3   02FB 0004
L_5BD5:
        MOVR    R2,     R5                      ; 5BD5   0095
        MVI     G_0171, R4                      ; 5BD6   0284 0171
        ADDI    #$0005, R4                      ; 5BD8   02FC 0005
        SLR     R2,     2                       ; 5BDA   0066
        SLR     R2,     1                       ; 5BDB   0062
        ADDI    #$024F, R2                      ; 5BDC   02FA 024F
        MVII    #$0001, R0                      ; 5BDE   02B8 0001
        CMPI    #$0038, R3                      ; 5BE0   037B 0038
        BLT     L_5BEA                          ; 5BE2   0205 0006

        SUBI    #$0004, R4                      ; 5BE4   033C 0004
        ADDI    #$0028, R2                      ; 5BE6   02FA 0028
        B       L_5BF3                          ; 5BE8   0200 0009

L_5BEA:
        CMPI    #$0030, R3                      ; 5BEA   037B 0030
        BLT     L_5BF3                          ; 5BEC   0205 0005

        SUBI    #$0002, R4                      ; 5BEE   033C 0002
        NEGR    R0                              ; 5BF0   0020
        ADDI    #$0014, R2                      ; 5BF1   02FA 0014
L_5BF3:
        MVI     G_0191, R1                      ; 5BF3   0281 0191
        TSTR    R1                              ; 5BF5   0089
        BEQ     L_5BF9                          ; 5BF6   0204 0001

        ADDR    R0,     R2                      ; 5BF8   00C2
L_5BF9:
        MVI@    R2,     R1                      ; 5BF9   0291
        TSTR    R1                              ; 5BFA   0089
        BEQ     L_5BD2                          ; 5BFB   0224 002A

        PSHR    R4                              ; 5BFD   0274
        MVI     G_01B0, R4                      ; 5BFE   0284 01B0
        DECR    R4                              ; 5C00   0014
        MVO     R4,     G_01B0                  ; 5C01   0244 01B0
        CLRR    R3                              ; 5C03   01DB
        MVO@    R3,     R2                      ; 5C04   0253
L_5C05:
        PSHR    R1                              ; 5C05   0271
        SLR     R1,     2                       ; 5C06   0065
        SLR     R1,     1                       ; 5C07   0061
        ANDI    #$00FF, R1                      ; 5C08   03B9 00FF
        CMPI    #$0024, R1                      ; 5C0A   0379 0024
        BLE     L_5C0F                          ; 5C0C   0206 0001

        NEGR    R0                              ; 5C0E   0020
L_5C0F:
        ADDR    R0,     R2                      ; 5C0F   00C2
        CMPI    #$0263, R2                      ; 5C10   037A 0263
        BEQ     L_5C1D                          ; 5C12   0204 0009

        CMPI    #$0277, R2                      ; 5C14   037A 0277
        BEQ     L_5C1D                          ; 5C16   0204 0005

        CMPI    #$028B, R2                      ; 5C18   037A 028B
        BEQ     L_5C1D                          ; 5C1A   0204 0001

        MVO@    R3,     R2                      ; 5C1C   0253

L_5C1D:
        JSR     R5,     L_5ACE                  ; 5C1D   0004 0158 02CE

        PULR    R1                              ; 5C20   02B1
        SDBD                                    ; 5C21   0001
        CMPI    #$1000, R1                      ; 5C22   0379 0000 0010
        BLT     L_5C77                          ; 5C25   0205 0050

        ANDI    #$0007, R1                      ; 5C27   03B9 0007
        MOVR    R1,     R0                      ; 5C29   0088

        JSR     R5,     X_SET_BIT               ; 5C2A   0004 0114 02DB

        ANDR    R6,     R1                      ; 5C2D   01B1
        MVII    #$0005, R3                      ; 5C2E   02BB 0005
        CMPR    R3,     R1                      ; 5C30   0159
        BLT     L_5C3D                          ; 5C31   0205 000A
        BEQ     L_5C37                          ; 5C33   0204 0002

        MVII    #$000A, R3                      ; 5C35   02BB 000A
L_5C37:
        ADD     G_015F, R3                      ; 5C37   02C3 015F
        MVO     R3,     G_015F                  ; 5C39   0243 015F
        B       L_5C77                          ; 5C3B   0200 003A

L_5C3D:
        MVI     G_0168, R3                      ; 5C3D   0283 0168
        TSTR    R3                              ; 5C3F   009B
        BEQ     L_5C77                          ; 5C40   0204 0035

        MOVR    R1,     R0                      ; 5C42   0088
        ADDI    #$0220, R1                      ; 5C43   02F9 0220
        TSTR    R0                              ; 5C45   0080
        BEQ     L_5C4D                          ; 5C46   0204 0005

        MVI@    R1,     R0                      ; 5C48   0288
        CMPI    #$01D0, R0                      ; 5C49   0378 01D0
        BGT     L_5C60                          ; 5C4B   020E 0013

L_5C4D:
        INCR    R1                              ; 5C4D   0009
        MVI@    R1,     R0                      ; 5C4E   0288
        SUBI    #$00FE, R0                      ; 5C4F   0338 00FE
        MVO@    R0,     R1                      ; 5C51   0248
        PULR    R0                              ; 5C52   02B0
        CMPI    #$0225, R1                      ; 5C53   0379 0225
        BNEQ    L_5AF0                          ; 5C55   022C 0166

        ADDR    R3,     R0                      ; 5C57   00D8
        PSHR    R0                              ; 5C58   0270
        SDBD                                    ; 5C59   0001
        MVII    #$5ADC, R1                      ; 5C5A   02B9 00DC 005A

        JSR     R5,     L_5AD4                  ; 5C5D   0004 0158 02D4

L_5C60:
        MVII    #$0005, R0                      ; 5C60   02B8 0005
        MVII    #$0221, R4                      ; 5C62   02BC 0221

        JSR     R5,     X_FILL_ZERO             ; 5C64   0004 0114 0338

        MVII    #$0236, R4                      ; 5C67   02BC 0236
        SDBD                                    ; 5C69   0001
        MVII    #$08B8, R0                      ; 5C6A   02B8 00B8 0008
        MVO@    R0,     R4                      ; 5C6D   0260
        MVO@    R0,     R4                      ; 5C6E   0260
        MVO@    R0,     R4                      ; 5C6F   0260
        MVO@    R0,     R4                      ; 5C70   0260
        CLRR    R0                              ; 5C71   01C0
        MVO     R0,     G_0168                  ; 5C72   0240 0168
        PULR    R0                              ; 5C74   02B0
        B       L_5AF0                          ; 5C75   0220 0186

L_5C77:
        PULR    R0                              ; 5C77   02B0
        MVI     .BTAB.21,R1                     ; 5C78   0281 0221
        CMPI    #$01D0, R1                      ; 5C7A   0379 01D0
        BLT     L_5AF0                          ; 5C7C   0225 018D

        MVI     G_0168, R1                      ; 5C7E   0281 0168
        ADDR    R0,     R1                      ; 5C80   00C1
        MVO     R1,     G_0168                  ; 5C81   0241 0168
        PSHR    R0                              ; 5C83   0270

        JSR     R5,     L_5241                  ; 5C84   0004 0150 0241

        PULR    R0                              ; 5C87   02B0
        B       L_5AF0                          ; 5C88   0220 0199
L_5C8A:
        B       L_5EC1                          ; 5C8A   0200 0235
L_5C8C:
        B       L_5DFA                          ; 5C8C   0200 016C
L_5C8E:
        B       L_5E52                          ; 5C8E   0200 01C2

L_5C90:
        PSHR    R5                              ; 5C90   0275
        MVII    #$0002, R0                      ; 5C91   02B8 0002

L_5C93:
        JSR     R5,     .EXEC.772               ; 5C93   0004 0114 0372

        INCR    R1                              ; 5C96   0009
        MVI@    R1,     R5                      ; 5C97   028D
        TSTR    R5                              ; 5C98   00AD
        BEQ     L_5CA5                          ; 5C99   0204 000A

        CMPI    #$005B, R3                      ; 5C9B   037B 005B
        BGT     L_5CAB                          ; 5C9D   020E 000C

        ADDI    #$0005, R1                      ; 5C9F   02F9 0005
        MVI@    R1,     R5                      ; 5CA1   028D
        DECR    R5                              ; 5CA2   0015
        BMI     L_5CFD                          ; 5CA3   020B 0058

L_5CA5:
        INCR    R0                              ; 5CA5   0008
        CMPI    #$0007, R0                      ; 5CA6   0378 0007
        BNEQ    L_5C93                          ; 5CA8   022C 0016
        PULR    R7                              ; 5CAA   02B7

L_5CAB:
        JSR     R5,     L_5CEC                  ; 5CAB   0004 015C 00EC

        MVII    #$031D, R2                      ; 5CAE   02BA 031D
        SDBD                                    ; 5CB0   0001
        MVII    #$5DE7, R1                      ; 5CB1   02B9 00E7 005D

        JSR     R5,     X_INIT_MOB              ; 5CB4   0004 0114 02B2

        MVII    #$0001, R0                      ; 5CB7   02B8 0001
        MVO     R0,     G_0104                  ; 5CB9   0240 0104

        JSR     R5,     X_PLAY_MUS3             ; 5CBB   0004 0118 0395
        DECLE   $0012                           ; 5CBE  Note (short)
        DECLE   $0032                           ; 5CBF  Note (short)
        DECLE   $0012                           ; 5CC0  Note (short)
        DECLE   $0006                           ; 5CC1  Note (short)
        DECLE   $0014                           ; 5CC2  Note (short)
        DECLE   $0034                           ; 5CC3  Note (short)
        DECLE   $0014                           ; 5CC4  Note (short)
        DECLE   $0000                           ; 5CC5  End of music

        CLRR    R1                              ; 5CC6   01C9
        XOR     G_01A7, R1                      ; 5CC7   03C1 01A7
        BEQ     L_5CCE                          ; 5CC9   0204 0003

        JSR     R5,     L_5580                  ; 5CCB   0004 0154 0180

L_5CCE:
        MVII    #$0008, R2                      ; 5CCE   02BA 0008
        MVO     R2,     G_0104                  ; 5CD0   0242 0104
        MVI     G_015F, R0                      ; 5CD2   0280 015F
        SUBI    #$000A, R0                      ; 5CD4   0338 000A
        BMI     L_5B1B                          ; 5CD6   022B 01BC
        BEQ     L_5B35                          ; 5CD8   0224 01A4

        MVO     R0,     G_015F                  ; 5CDA   0240 015F
        CLRR    R2                              ; 5CDC   01D2
        B       L_5E26                          ; 5CDD   0200 0147

L_5CDF:
        JSR     R5,     L_5252                  ; 5CDF   0004 0150 0252
        JSR     R5,     .EXEC.A61               ; 5CE2   0004 0118 0261

        DIS                                     ; 5CE5   0003
        CLRR    R0                              ; 5CE6   01C0
        MVO     R0,     G_0190                  ; 5CE7   0240 0190
        MVO     R0,     G_031E                  ; 5CE9   0240 031E
        PULR    R7                              ; 5CEB   02B7

L_5CEC:
        PSHR    R5                              ; 5CEC   0275
        PSHR    R0                              ; 5CED   0270

        JSR     R5,     .EXEC.98D               ; 5CEE   0004 0118 018D
        JSR     R5,     X_SET_BIT               ; 5CF1   0004 0114 02DB

        ANDR    R0,     R0                      ; 5CF4   0180
        MVII    #$0008, R0                      ; 5CF5   02B8 0008
        MOVR    R1,     R4                      ; 5CF7   008C

        JSR     R5,     X_FILL_ZERO             ; 5CF8   0004 0114 0338

        PULR    R0                              ; 5CFB   02B0
        PULR    R7                              ; 5CFC   02B7

L_5CFD:
        PSHR    R0                              ; 5CFD   0270

        JSR     R5,     .EXEC.98D               ; 5CFE   0004 0118 018D

        MOVR    R1,     R4                      ; 5D01   008C
        PSHR    R1                              ; 5D02   0271
        ADDI    #$0179, R0                      ; 5D03   02F8 0179
        MOVR    R0,     R1                      ; 5D05   0081
        MVI@    R1,     R0                      ; 5D06   0288
        CMPI    #$0001, R0                      ; 5D07   0378 0001
        BGT     L_5D1F                          ; 5D09   020E 0014

        XORI    #$0001, R0                      ; 5D0B   03F8 0001
        ADDI    #$0002, R0                      ; 5D0D   02F8 0002
        MVO@    R0,     R1                      ; 5D0F   0248
        MVI     G_016A, R5                      ; 5D10   0285 016A
        DECR    R5                              ; 5D12   0015
        BNEQ    L_5D1F                          ; 5D13   020C 000A

        SDBD                                    ; 5D15   0001
        MVII    #$5DCD, R1                      ; 5D16   02B9 00CD 005D
        INCR    R4                              ; 5D19   000C
        MVO@    R1,     R4                      ; 5D1A   0261
        ADDI    #$0008, R3                      ; 5D1B   02FB 0008
        B       L_5D43                          ; 5D1D   0200 0024

L_5D1F:
        SUBI    #$0002, R0                      ; 5D1F   0338 0002
        MVO@    R0,     R1                      ; 5D21   0248
        MVI@    R4,     R5                      ; 5D22   02A5
        MOVR    R0,     R1                      ; 5D23   0081
        SWAP    R0,     1                       ; 5D24   0040
        SLL     R0,     1                       ; 5D25   0048
        SDBD                                    ; 5D26   0001
        ANDI    #$FDFF, R5                      ; 5D27   03BD 00FF 00FD
        XORR    R0,     R5                      ; 5D2A   01C5
        DECR    R4                              ; 5D2B   0014
        MVO@    R5,     R4                      ; 5D2C   0265
        MVI     G_016A, R0                      ; 5D2D   0280 016A
        DECR    R0                              ; 5D2F   0010
        BNEQ    L_5F85                          ; 5D30   020C 0253

        SDBD                                    ; 5D32   0001
        MVII    #$5DE0, R5                      ; 5D33   02BD 00E0 005D
        MVO@    R5,     R4                      ; 5D36   0265
        MVII    #$0014, R0                      ; 5D37   02B8 0014

        JSR     R5,     X_RAND2                 ; 5D39   0004 0114 029E

        ADDI    #$0007, R0                      ; 5D3C   02F8 0007
        TSTR    R1                              ; 5D3E   0089
        BEQ     L_5D42                          ; 5D3F   0204 0001

        NEGR    R0                              ; 5D41   0020
L_5D42:
        ADDR    R0,     R2                      ; 5D42   00C2
L_5D43:
        SWAP    R2,     1                       ; 5D43   0042
        XORR    R3,     R2                      ; 5D44   01DA
        MVII    #$000F, R3                      ; 5D45   02BB 000F
        PULR    R1                              ; 5D47   02B1

        JSR     R5,     .EXEC.9A8               ; 5D48   0004 0118 01A8

        PULR    R0                              ; 5D4B   02B0
        B       L_5CA5                          ; 5D4C   0220 00A8

        PSHR    R5                              ; 5D4E   0275
        CLRR    R0                              ; 5D4F   01C0
        INCR    R0                              ; 5D50   0008
        B       L_5D56                          ; 5D51   0200 0003

L_5D53:
        JSR     R5,     L_5CEC                  ; 5D53   0004 015C 00EC

L_5D56:
        MVI     G_0180, R1                      ; 5D56   0281 0180
        TSTR    R1                              ; 5D58   0089
        BEQ     L_5D6C                          ; 5D59   0204 0011

        INCR    R0                              ; 5D5B   0008

        JSR     R5,     .EXEC.772               ; 5D5C   0004 0114 0372

        CMPI    #$0097, R2                      ; 5D5F   037A 0097
        BGT     L_5D53                          ; 5D61   022E 000F

        CMPI    #$0017, R2                      ; 5D63   037A 0017
        BLT     L_5D53                          ; 5D65   0225 0013

        CMPI    #$0007, R0                      ; 5D67   0378 0007
        BLT     L_5D56                          ; 5D69   0225 0014
        PULR    R7                              ; 5D6B   02B7

L_5D6C:
        MVI     G_0161, R0                      ; 5D6C   0280 0161
        TSTR    R0                              ; 5D6E   0080
        BEQ     L_5B5E                          ; 5D6F   0224 0212

        MVI     G_0165, R0                      ; 5D71   0280 0165
        XORI    #$0001, R0                      ; 5D73   03F8 0001
        MOVR    R0,     R1                      ; 5D75   0081
        ADDI    #$016B, R1                      ; 5D76   02F9 016B
        MVI@    R1,     R1                      ; 5D78   0289
        TSTR    R1                              ; 5D79   0089
        BNEQ    L_5D7E                          ; 5D7A   020C 0002

        MVO     R0,     G_0165                  ; 5D7C   0240 0165
L_5D7E:
        B       L_5B5E                          ; 5D7E   0220 0221

        MVII    #$0002, R0                      ; 5D80   02B8 0002
        B       L_5D92                          ; 5D82   0200 000E

        MVII    #$0003, R0                      ; 5D84   02B8 0003
        B       L_5D92                          ; 5D86   0200 000A

        MVII    #$0004, R0                      ; 5D88   02B8 0004
        B       L_5D92                          ; 5D8A   0200 0006

        MVII    #$0005, R0                      ; 5D8C   02B8 0005
        B       L_5D92                          ; 5D8E   0200 0002

        MVII    #$0006, R0                      ; 5D90   02B8 0006
L_5D92:
        PSHR    R5                              ; 5D92   0275
        MVI     G_016A, R1                      ; 5D93   0281 016A
        DECR    R1                              ; 5D95   0011
        BNEQ    L_5F75                          ; 5D96   020C 01DD

        JSR     R5,     L_5CEC                  ; 5D98   0004 015C 00EC
        JSR     R5,     L_5ACE                  ; 5D9B   0004 0158 02CE

        B       L_5A9A                          ; 5D9E   0220 0305
        MOVR    R0,     R7                      ; 5DA0   0087

        DECLE   $0018,  $00AE,  $005D,  $0000   ; 5DA1   0018 00AE 005D 0000
        DECLE   $0000,  $0000,  $005E,  $0000   ; 5DA5   0000 0000 005E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003E   ; 5DAD   0000 0000 0000 003E
        DECLE   $005A,  $0001,  $0001,  $000B   ; 5DB1   005A 0001 0001 000B
        DECLE   $003E,  $005A,  $0280,  $005D   ; 5DB5   003E 005A 0280 005D
        DECLE   $0284,  $015D,  $0188,  $005D   ; 5DB9   0284 015D 0188 005D
        DECLE   $018C,  $015D,  $0390,  $005D   ; 5DBD   018C 015D 0390 005D
        DECLE   $0046,  $0018,  $00CD,  $005D   ; 5DC1   0046 0018 00CD 005D
        DECLE   $0000,  $0000,  $0000,  $0040   ; 5DC5   0000 0000 0000 0040
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5DC9   0000 0000 0000 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DCD   0000 0000 0000 0000
        DECLE   $0002,  $0008,  $0000,  $0046   ; 5DD1   0002 0008 0000 0046
        DECLE   $0018,  $00E0,  $005D,  $0000   ; 5DD5   0018 00E0 005D 0000
        DECLE   $0000,  $0000,  $0040,  $0000   ; 5DD9   0000 0000 0040 0000
        DECLE   $0000,  $0000,  $0003,  $0000   ; 5DDD   0000 0000 0003 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; 5DE1   0000 0000 0000 0002
        DECLE   $0004,  $0000,  $0086,  $0010   ; 5DE5   0004 0000 0086 0010
        DECLE   $00F3,  $005D,  $0000,  $0018   ; 5DE9   00F3 005D 0000 0018
        DECLE   $0000,  $0060,  $0000,  $0000   ; 5DED   0000 0060 0000 0000
        DECLE   $0000,  $0003,  $0000,  $0000   ; 5DF1   0000 0003 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0002   ; 5DF5   0000 0000 0002 0002
        DECLE   $0000                           ; 5DF9   0000
L_5DFA:
        PSHR    R5                              ; 5DFA   0275
        ADD     G_031E, R1                      ; 5DFB   02C1 031E
        XOR     G_0165, R1                      ; 5DFD   03C1 0165
        BNEQ    L_5E51                          ; 5DFF   020C 0050

        MVI     G_0170, R0                      ; 5E01   0280 0170
        INCR    R0                              ; 5E03   0008
        MVO     R0,     G_0170                  ; 5E04   0240 0170
        MVII    #$0001, R0                      ; 5E06   02B8 0001

        JSR     R5,     .EXEC.772               ; 5E08   0004 0114 0372

        ADDI    #$0002, R2                      ; 5E0B   02FA 0002
        MVI     G_016A, R0                      ; 5E0D   0280 016A
        DECR    R0                              ; 5E0F   0010
        BNEQ    L_5E24                          ; 5E10   020C 0012

        MVII    #$0018, R3                      ; 5E12   02BB 0018
        CMPI    #$0040, R2                      ; 5E14   037A 0040
        BLT     L_5E26                          ; 5E16   0205 000E

        CMPI    #$004C, R2                      ; 5E18   037A 004C
        BLT     L_5E24                          ; 5E1A   0205 0008

        CMPI    #$0064, R2                      ; 5E1C   037A 0064
        BLT     L_5E26                          ; 5E1E   0205 0006

        CMPI    #$0070, R2                      ; 5E20   037A 0070
        BGE     L_5E26                          ; 5E22   020D 0002

L_5E24:
        MVII    #$0004, R3                      ; 5E24   02BB 0004
L_5E26:
        SWAP    R2,     1                       ; 5E26   0042
        PSHR    R2                              ; 5E27   0272
        XORR    R3,     R2                      ; 5E28   01DA
        PSHR    R2                              ; 5E29   0272
        SDBD                                    ; 5E2A   0001
        MVII    #$5DA0, R1                      ; 5E2B   02B9 00A0 005D
        MVII    #$031D, R2                      ; 5E2E   02BA 031D

        JSR     R5,     X_INIT_MOB              ; 5E30   0004 0114 02B2

        MOVR    R2,     R1                      ; 5E33   0091
        PULR    R2                              ; 5E34   02B2
        PULR    R3                              ; 5E35   02B3
        TSTR    R2                              ; 5E36   0092
        BEQ     L_5CDF                          ; 5E37   0224 0159

        MVO     R3,     G_031F                  ; 5E39   0243 031F
        MVII    #$003F, R3                      ; 5E3B   02BB 003F

        JSR     R5,     .EXEC.9A8               ; 5E3D   0004 0118 01A8
        JSR     R5,     L_55A9                  ; 5E40   0004 0154 01A9
        JSR     R5,     X_PLAY_SFX1             ; 5E43   0004 0118 03BB
        DECLE   $0079                           ; 5E46  SFX data
        DECLE   $01ED                           ; 5E47  SFX data
        DECLE   $03F5                           ; 5E48  SFX data
        DECLE   $00AB                           ; 5E49  SFX data
        DECLE   $01CF                           ; 5E4A  SFX end


        JSR     R5,     .EXEC.A83               ; 5E4B   0004 0118 0283
        JSR     R5,     L_55B1                  ; 5E4E   0004 0154 01B1

L_5E51:
        PULR    R7                              ; 5E51   02B7

L_5E52:
        PSHR    R5                              ; 5E52   0275
        MVI     G_0180, R1                      ; 5E53   0281 0180
        CMPI    #$007C, R1                      ; 5E55   0379 007C
        BEQ     L_5E51                          ; 5E57   0224 0007

        MVII    #$000B, R0                      ; 5E59   02B8 000B

        JSR     R5,     X_RAND2                 ; 5E5B   0004 0114 029E

        ADDI    #$027D, R0                      ; 5E5E   02F8 027D
        MOVR    R0,     R1                      ; 5E60   0081
        CLRR    R0                              ; 5E61   01C0
        MVO     R0,     G_0191                  ; 5E62   0240 0191
        MVI@    R1,     R2                      ; 5E64   028A
        SDBD                                    ; 5E65   0001
        CMPI    #$08C6, R2                      ; 5E66   037A 00C6 0008
        BNEQ    L_5E51                          ; 5E69   022C 0019

        MVO@    R0,     R1                      ; 5E6B   0248
        INCR    R1                              ; 5E6C   0009
        MVO@    R0,     R1                      ; 5E6D   0248
        SUBI    #$0277, R1                      ; 5E6E   0339 0277
        SLL     R1,     2                       ; 5E70   004D
        SLL     R1,     1                       ; 5E71   0049
        PSHR    R1                              ; 5E72   0271
        MVI     G_01B0, R1                      ; 5E73   0281 01B0
        DECR    R1                              ; 5E75   0011
        MVO     R1,     G_01B0                  ; 5E76   0241 01B0
        MVII    #$0001, R0                      ; 5E78   02B8 0001
        MVI     G_0180, R1                      ; 5E7A   0281 0180
        SARC    R1,     2                       ; 5E7C   007D
L_5E7D:
        INCR    R0                              ; 5E7D   0008
        SARC    R1,     1                       ; 5E7E   0079
        BC      L_5E7D                          ; 5E7F   0221 0003

        JSR     R5,     X_CLR_BIT               ; 5E81   0004 0114 02E6

        ANDR    R0,     R0                      ; 5E84   0180
        MVII    #$0179, R3                      ; 5E85   02BB 0179
        ADDR    R0,     R3                      ; 5E87   00C3

        JSR     R5,     .EXEC.76C               ; 5E88   0004 0114 036C

        PSHR    R1                              ; 5E8B   0271
        MOVR    R1,     R2                      ; 5E8C   008A
        MVII    #$0019, R0                      ; 5E8D   02B8 0019

        JSR     R5,     X_RAND2                 ; 5E8F   0004 0114 029E

        PSHR    R0                              ; 5E92   0270
        SDBD                                    ; 5E93   0001
        MVII    #$5DC1, R1                      ; 5E94   02B9 00C1 005D
        CMPI    #$000A, R0                      ; 5E97   0378 000A
        BGT     L_5EB5                          ; 5E99   020E 001A

        JSR     R5,     X_INIT_MOB              ; 5E9B   0004 0114 02B2

        MVII    #$0003, R0                      ; 5E9E   02B8 0003
        MVO@    R0,     R3                      ; 5EA0   0258
        PULR    R0                              ; 5EA1   02B0
        MVII    #$0048, R4                      ; 5EA2   02BC 0048
        CLRR    R3                              ; 5EA4   01DB
L_5EA5:
        PULR    R1                              ; 5EA5   02B1
        PULR    R2                              ; 5EA6   02B2
        SWAP    R2,     1                       ; 5EA7   0042
        MVII    #$0002, R5                      ; 5EA8   02BD 0002
        ADDR    R1,     R5                      ; 5EAA   00CD
        MVO@    R2,     R5                      ; 5EAB   026A
        SWAP    R3,     1                       ; 5EAC   0043
        ADDR    R3,     R2                      ; 5EAD   00DA
        ADDR    R4,     R2                      ; 5EAE   00E2
        MVII    #$000F, R3                      ; 5EAF   02BB 000F

        JSR     R5,     .EXEC.9A8               ; 5EB1   0004 0118 01A8

        PULR    R7                              ; 5EB4   02B7

L_5EB5:
        ADDI    #$0013, R1                      ; 5EB5   02F9 0013

        JSR     R5,     X_INIT_MOB              ; 5EB7   0004 0114 02B2

        CLRR    R4                              ; 5EBA   01E4
        MVO@    R4,     R3                      ; 5EBB   025C
        PULR    R3                              ; 5EBC   02B3
        MVII    #$0040, R4                      ; 5EBD   02BC 0040
        B       L_5EA5                          ; 5EBF   0220 001B

L_5EC1:
        JSR     R5,     L_5121                  ; 5EC1   0004 0150 0121

        MVII    #$0170, R4                      ; 5EC4   02BC 0170
        MVII    #$0020, R0                      ; 5EC6   02B8 0020

        JSR     R5,     X_FILL_ZERO             ; 5EC8   0004 0114 0338

        MVII    #$0002, R0                      ; 5ECB   02B8 0002
        MVO     R0,     G_016A                  ; 5ECD   0240 016A

        JSR     R5,     L_520D                  ; 5ECF   0004 0150 020D

        MVI     G_0165, R2                      ; 5ED2   0282 0165
        ADDI    #$016D, R2                      ; 5ED4   02FA 016D
        MVI@    R2,     R3                      ; 5ED6   0293
        INCR    R3                              ; 5ED7   000B
        MVO@    R3,     R2                      ; 5ED8   0253
        CMPI    #$0003, R3                      ; 5ED9   037B 0003
        BLT     L_5EDF                          ; 5EDB   0205 0002

        MVII    #$0003, R3                      ; 5EDD   02BB 0003
L_5EDF:
        MVO     R3,     G_0172                  ; 5EDF   0243 0172

        JSR     R5,     L_5116                  ; 5EE1   0004 0150 0116

        MOVR    R3,     R2                      ; 5EE4   009A
        MVII    #$028C, R4                      ; 5EE5   02BC 028C
        MOVR    R4,     R1                      ; 5EE7   00A1
        ADDI    #$03DA, R1                      ; 5EE8   02F9 03DA
L_5EEA:
        MVII    #$0014, R0                      ; 5EEA   02B8 0014

        JSR     R5,     X_FILL_MEM              ; 5EEC   0004 0114 0341

        SUBI    #$003C, R4                      ; 5EEF   033C 003C
        DECR    R2                              ; 5EF1   0012
        BNEQ    L_5EEA                          ; 5EF2   022C 0009

        MVO     R2,     G_01A7                  ; 5EF4   0242 01A7
        MVII    #$032D, R2                      ; 5EF6   02BA 032D
        MOVR    R3,     R0                      ; 5EF8   0098
L_5EF9:
        PSHR    R0                              ; 5EF9   0270
        PSHR    R2                              ; 5EFA   0272
        SLL     R0,     1                       ; 5EFB   0048

        JSR     R5,     X_CLR_BIT               ; 5EFC   0004 0114 02E6

        ANDR    R0,     R0                      ; 5EFF   0180
        INCR    R0                              ; 5F00   0008

        JSR     R5,     X_CLR_BIT               ; 5F01   0004 0114 02E6

        ANDR    R0,     R0                      ; 5F04   0180
        SDBD                                    ; 5F05   0001
        MVII    #$5FC1, R1                      ; 5F06   02B9 00C1 005F
        MVII    #$0002, R0                      ; 5F09   02B8 0002

        JSR     R5,     X_INIT_MOBS             ; 5F0B   0004 0114 02B4

        PULR    R4                              ; 5F0E   02B4
        MOVR    R4,     R1                      ; 5F0F   00A1
        CMPI    #$032D, R1                      ; 5F10   0379 032D
        BNEQ    L_5F1B                          ; 5F12   020C 0007

        ADDI    #$0007, R4                      ; 5F14   02FC 0007
        MVI@    R4,     R2                      ; 5F16   02A2
        ADDI    #$0004, R4                      ; 5F17   02FC 0004
        B       L_5F29                          ; 5F19   0200 000E

L_5F1B:
        DECR    R4                              ; 5F1B   0014
        MVI@    R4,     R2                      ; 5F1C   02A2
        SUBI    #$0010, R2                      ; 5F1D   033A 0010
        MOVR    R2,     R3                      ; 5F1F   0093
        ANDI    #$00FF, R3                      ; 5F20   03BB 00FF
        SWAP    R3,     1                       ; 5F22   0043
        ADDI    #$0003, R4                      ; 5F23   02FC 0003
        MVO@    R3,     R4                      ; 5F25   0263
        ADDI    #$0007, R4                      ; 5F26   02FC 0007
        MVO@    R3,     R4                      ; 5F28   0263
L_5F29:
        MVII    #$0007, R3                      ; 5F29   02BB 0007
        ADD     G_0179, R3                      ; 5F2B   02C3 0179
        MOVR    R3,     R0                      ; 5F2D   0098
        SWAP    R0,     1                       ; 5F2E   0040
        SLL     R0,     2                       ; 5F2F   004C
        XORI    #$02F0, R0                      ; 5F30   03F8 02F0
        INCR    R4                              ; 5F32   000C
        MVO@    R0,     R4                      ; 5F33   0260
        SUBI    #$0009, R4                      ; 5F34   033C 0009
        MVO@    R0,     R4                      ; 5F36   0260
        PSHR    R3                              ; 5F37   0273

        JSR     R5,     .EXEC.9A8               ; 5F38   0004 0118 01A8

        PULR    R3                              ; 5F3B   02B3
        ADDI    #$0008, R1                      ; 5F3C   02F9 0008

        JSR     R5,     .EXEC.9A8               ; 5F3E   0004 0118 01A8

        MOVR    R1,     R2                      ; 5F41   008A
        ADDI    #$0008, R2                      ; 5F42   02FA 0008
        PULR    R0                              ; 5F44   02B0
        DECR    R0                              ; 5F45   0010
        BNEQ    L_5EF9                          ; 5F46   022C 004E
        PULR    R7                              ; 5F48   02B7

L_5F49:
        MVI     G_01C1, R0                      ; 5F49   0280 01C1

        JSR     R5,     .EXEC.772               ; 5F4B   0004 0114 0372

        PSHR    R1                              ; 5F4E   0271
        MOVR    R1,     R4                      ; 5F4F   008C
        SDBD                                    ; 5F50   0001
        MVII    #$5FDD, R5                      ; 5F51   02BD 00DD 005F
        INCR    R4                              ; 5F54   000C
        MVO@    R5,     R4                      ; 5F55   0265
        MOVR    R2,     R0                      ; 5F56   0090
        MVII    #$0009, R2                      ; 5F57   02BA 0009
        SUBI    #$0007, R0                      ; 5F59   0338 0007
        MVI     G_015E, R1                      ; 5F5B   0281 015E
        SARC    R1,     1                       ; 5F5D   0079
        BC      L_5F64                          ; 5F5E   0201 0004

        ADDI    #$000F, R0                      ; 5F60   02F8 000F
        MVII    #$00A0, R2                      ; 5F62   02BA 00A0
L_5F64:
        SWAP    R2,     1                       ; 5F64   0042
        XORR    R3,     R2                      ; 5F65   01DA
        SWAP    R0,     1                       ; 5F66   0040
        SWAP    R3,     1                       ; 5F67   0043
        ADDI    #$0007, R4                      ; 5F68   02FC 0007
        ADDI    #$0006, R5                      ; 5F6A   02FD 0006
        MVO@    R5,     R4                      ; 5F6C   0265
        MVO@    R0,     R4                      ; 5F6D   0260
        MVO@    R3,     R4                      ; 5F6E   0263
        PULR    R1                              ; 5F6F   02B1
        MVII    #$0001, R0                      ; 5F70   02B8 0001
        PSHR    R0                              ; 5F72   0270
        B       L_5F29                          ; 5F73   0220 004B

L_5F75:
        SLR     R0,     1                       ; 5F75   0060
        SLL     R0,     1                       ; 5F76   0048
        PSHR    R0                              ; 5F77   0270
        MVII    #$0005, R0                      ; 5F78   02B8 0005

        JSR     R5,     L_5AF5                  ; 5F7A   0004 0158 02F5

        PULR    R0                              ; 5F7D   02B0
        INCR    R0                              ; 5F7E   0008

        JSR     R5,     .EXEC.98D               ; 5F7F   0004 0118 018D

        DECR    R0                              ; 5F82   0010
        B       L_5CFD                          ; 5F83   0220 0287

L_5F85:
        MVO     R1,     G_015E                  ; 5F85   0241 015E
        MOVR    R4,     R2                      ; 5F87   00A2
        ADDI    #$0007, R2                      ; 5F88   02FA 0007
        MVO@    R5,     R2                      ; 5F8A   0255
        SDBD                                    ; 5F8B   0001
        MVII    #$5FE9, R5                      ; 5F8C   02BD 00E9 005F
        MVO@    R5,     R4                      ; 5F8F   0265
        MVI@    R4,     R2                      ; 5F90   02A2
        MVI@    R4,     R3                      ; 5F91   02A3
        ADDI    #$0006, R5                      ; 5F92   02FD 0006
        ADDI    #$0005, R4                      ; 5F94   02FC 0005
        MVO@    R5,     R4                      ; 5F96   0265
        MVO@    R2,     R4                      ; 5F97   0262
        SDBD                                    ; 5F98   0001
        SUBI    #$0800, R3                      ; 5F99   033B 0000 0008
        MVO@    R3,     R4                      ; 5F9C   0263
        CLRR    R5                              ; 5F9D   01ED
        MVO@    R5,     R4                      ; 5F9E   0265
        MVO@    R5,     R4                      ; 5F9F   0265
        SUBI    #$000A, R4                      ; 5FA0   033C 000A
        MVO@    R5,     R4                      ; 5FA2   0265
        MVO@    R5,     R4                      ; 5FA3   0265
        MVO     R5,     G_031E                  ; 5FA4   0245 031E
        PULR    R1                              ; 5FA6   02B1
        PULR    R2                              ; 5FA7   02B2
        MVO     R2,     G_01C1                  ; 5FA8   0242 01C1
        ADDI    #$0180, R2                      ; 5FAA   02FA 0180
        MVI@    R2,     R3                      ; 5FAC   0293
        CMPI    #$0020, R3                      ; 5FAD   037B 0020
        BEQ     L_5FB5                          ; 5FAF   0204 0004

        SLL     R3,     1                       ; 5FB1   004B
        BNEQ    L_5FB5                          ; 5FB2   020C 0001

        INCR    R3                              ; 5FB4   000B
L_5FB5:
        MVO@    R3,     R2                      ; 5FB5   0253
        MVO     R3,     G_0179                  ; 5FB6   0243 0179

        JSR     R5,     L_5FF6                  ; 5FB8   0004 015C 03F6
        JSR     R5,     .EXEC.A61               ; 5FBB   0004 0118 0261

        SETC                                    ; 5FBE   0007
        B       L_5F49                          ; 5FBF   0220 0077

        DECLE   $0043,  $0018,  $00DD,  $005F   ; 5FC1   0043 0018 00DD 005F
        DECLE   $0000,  $0008,  $0000,  $0038   ; 5FC5   0000 0008 0000 0038
        DECLE   $0000,  $0000,  $0000,  $0007   ; 5FC9   0000 0000 0000 0007
        DECLE   $0000,  $0000,  $0038,  $00A2   ; 5FCD   0000 0000 0038 00A2
        DECLE   $0043,  $0018,  $00E3,  $005F   ; 5FD1   0043 0018 00E3 005F
        DECLE   $0000,  $0010,  $0000,  $0038   ; 5FD5   0000 0010 0000 0038
        DECLE   $0000,  $0000,  $0000,  $0007   ; 5FD9   0000 0000 0000 0007
        DECLE   $0000,  $0000,  $004E,  $005D   ; 5FDD   0000 0000 004E 005D
        DECLE   $0002,  $000C,  $0000,  $0000   ; 5FE1   0002 000C 0000 0000
        DECLE   $004E,  $005D,  $0002,  $0010   ; 5FE5   004E 005D 0002 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE9   0000 0000 0000 0000
        DECLE   $0001,  $0016,  $0000,  $0000   ; 5FED   0001 0016 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0014   ; 5FF1   0000 0000 0001 0014
        DECLE   $0000                           ; 5FF5   0000
L_5FF6:
        PSHR    R5                              ; 5FF6   0275

        JSR     R5,     X_PLAY_MUS2             ; 5FF7   0004 0118 035D
        DECLE   $0030                           ; 5FFA  Note (short)
        DECLE   $0014                           ; 5FFB  Note (short)
        DECLE   $0000                           ; 5FFC  End of music

        PULR    R7                              ; 5FFD   02B7

        DECLE   $0000,  $0000                   ; 5FFE   0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5051       <entry>
;;  $50AA       $509F  
;;  $50AD       $5B6C  
;;  $50CA       $50C6  
;;  $50D3       $50CF  
;;  $50E2       $50DE  
;;  $5116       $5EE1  
;;  $5117       $5115  
;;  $5121       $5055   $50EC   $512A   $5B5E   $5EC1  
;;  $512A       $509A  
;;  $5147       <entry>
;;  $5148       $5B80  
;;  $5155       $5148  
;;  $515F       $50A8  
;;  $5177       $50A6  
;;  $517F       $5179  
;;  $51A0       $5161   $5164   $517D  
;;  $51A4       $50F6  
;;  $520D       $5B08   $5ECF  
;;  $520E       $520C  
;;  $5227       $5219  
;;  $5228       $5226  
;;  $5230       $5236  
;;  $5238       $5231  
;;  $5241       $51F9   $5C84  
;;  $5252       $5209   $5B1E   $5B42   $5BA3   $5CDF  
;;  $525B       $5264  
;;  $5266       $525D  
;;  $5271       $5268  
;;  $5273       $526F  
;;  $5277       $527E  
;;  $5280       $5279  
;;  $5287       $5260   $526D   $527C   $5282   $528B  
;;  $52A7       $52EF   $5601  
;;  $52AF       $52B7  
;;  $52B9       $52B1  
;;  $52C1       $52BB  
;;  $52C8       $52DF  
;;  $52CF       $52CB  
;;  $52D8       $52D4  
;;  $52E2       $560E  
;;  $52ED       $52F9  
;;  $540D       $540B  
;;  $542B       $5429  
;;  $5438       $5436  
;;  $543B       $5439  
;;  $54D7       $50F3  
;;  $54DC       $54F3   $5542  
;;  $54EF       $54FA   $54FD  
;;  $54F0       $54EE  
;;  $54FC       $54F7  
;;  $5516       $5510  
;;  $5518       $5512  
;;  $551B       $5503  
;;  $551C       $551A  
;;  $5529       $551F  
;;  $552F       $5523   $5527   $552B   $557E  
;;  $5540       $554D  
;;  $5544       $5531  
;;  $5546       $5535  
;;  $5548       $5539  
;;  $554F       $5509   $555F  
;;  $5571       $5567  
;;  $5576       $556B   $556F  
;;  $5580       $5CCB  
;;  $5581       $54DE  
;;  $5588       $55A7   $55C1   $55C6  
;;  $55A9       $5AD5   $5E40  
;;  $55B1       $5AE3   $5E4E  
;;  $55D1       $55B5  
;;  $55D2       <entry>
;;  $5604       $5609  
;;  $5607       $55DB  
;;  $5616       $55DD   $55F8  
;;  $5619       $55EC  
;;  $5625       $5636  
;;  $562A       $5633  
;;  $563A       $564B  
;;  $563F       $5648  
;;  $564D       $5693  
;;  $564E       $56DF   $56F9   $56FF   $5744  
;;  $5651       $55F2  
;;  $5664       $5681   $568E  
;;  $5676       $567F  
;;  $5683       $5674   $568C  
;;  $5690       $5665  
;;  $5695       $561D  
;;  $56B7       $56B2  
;;  $56C1       $56BC  
;;  $56CB       $56C6  
;;  $56D3       $56D0  
;;  $56D8       $56D5  
;;  $56DD       $56DA  
;;  $56E1       $569E  
;;  $56ED       $56E7  
;;  $56F6       $56F0  
;;  $5701       $5659  
;;  $570E       $5707  
;;  $5714       $5723  
;;  $5721       $5729  
;;  $5727       $5719   $571F  
;;  $572B       $570C   $5725  
;;  $573C       $5734   $5739  
;;  $5746       $560B   $5695   $5701  
;;  $5756       $5763  
;;  $5767       $56AC   $56E1  
;;  $5786       $576C   $5774   $577E  
;;  $578E       $5797  
;;  $5792       $578C   $578F  
;;  $579D       $579A  
;;  $579E       $5611   $570E  
;;  $57A8       $57A4  
;;  $57B1       $57AC  
;;  $57B9       $57B4  
;;  $57C0       $57BC  
;;  $57C2       $57AE  
;;  $57C9       $57B6  
;;  $57CE       $57C7  
;;  $57DF       $57D8  
;;  $57E3       $5863  
;;  $57E8       $57E1  
;;  $57EE       $57D2  
;;  $580F       $5709  
;;  $5817       $5843  
;;  $581E       $5813   $5841   $585B  
;;  $5822       $5815  
;;  $5832       $5837  
;;  $5839       $5833   $583D  
;;  $583F       $583A  
;;  $5853       $584B  
;;  $5859       $5851  
;;  $5879       $5871  
;;  $587E       $5877  
;;  $5881       $587C  
;;  $588F       $586B   $586F   $5875  
;;  $5890       $55D4   $58BA  
;;  $5899       $5867  
;;  $589E       $5614  
;;  $58AB       $589E  
;;  $58AE       $55D2  
;;  $58BA       $58B4  
;;  $58BD       $58B2   $58B8  
;;  $58D1       $58CC  
;;  $58D7       $58C4  
;;  $58D8       $58C6  
;;  $58DE       $58E5   $5914  
;;  $58E1       $58DC  
;;  $58FE       $58FB  
;;  $5904       $5901  
;;  $590A       $5907  
;;  $5912       $590D   $594E  
;;  $5916       $58F8  
;;  $5926       $5922  
;;  $592C       $5928  
;;  $5950       $593A   $5949   $5954  
;;  $5956       $5951  
;;  $5969       $595E   $596F  
;;  $596B       $5962  
;;  $596D       $5966  
;;  $5971       $595A  
;;  $5973       $58C1  
;;  $5977       $58CE  
;;  $5979       $58D1  
;;  $597B       $58D4  
;;  $5986       $597F  
;;  $5990       $5983  
;;  $59A5       $5A3A  
;;  $59B0       $5989  
;;  $59B8       $59AE  
;;  $59C1       $59A3   $59B3   $5A3C  
;;  $59C9       $59BF  
;;  $59EB       $59D6  
;;  $59FA       $59FF  
;;  $5A01       $59FB  
;;  $5A07       $5A02  
;;  $5A08       $5AB5  
;;  $5A09       $598B   $59DA   $59F0  
;;  $5A2B       $5997   $599B  
;;  $5A57       $5A53  
;;  $5A58       $5A4F  
;;  $5A65       $5A49   $5A5A  
;;  $5A79       $5A62  
;;  $5A94       $5A8A  
;;  $5A9A       $5A5E   $5D9E  
;;  $5A9D       $5A71   $5A77   $5A7D   $5A81   $5AAF   $5AF3   $5B15  
;;  $5A9E       $5ACA  
;;  $5AAC       $5A75  
;;  $5AC8       $5AC5  
;;  $5ACE       $5B12   $5B45   $5BC7   $5C1D   $5D9B  
;;  $5AD4       $5ABC   $5C5D  
;;  $5AD5       $5AD3  
;;  $5AE3       $5AEE  
;;  $5AF0       $5ACC   $5BD0   $5C55   $5C75   $5C7C   $5C88  
;;  $5AF5       $5AF0   $5BA0   $5F7A  
;;  $5AFF       $5AFB  
;;  $5B0C       $5A69  
;;  $5B17       $5AA4   $5AAA  
;;  $5B1B       $5CD6  
;;  $5B1C       $5B19  
;;  $5B2F       $5B27  
;;  $5B35       $5B32   $5CD8  
;;  $5B5E       $5D6F   $5D7E  
;;  $5B6F       $5B4B   $5B5C  
;;  $5B83       $5B2D  
;;  $5B8E       $5BA6  
;;  $5BA8       $5B98   $5B9C  
;;  $5BAD       $5A85  
;;  $5BBD       $5A8E   $5A92   $5A98   $5BB3   $5BB8  
;;  $5BD2       $5BFB  
;;  $5BD5       $5A6D  
;;  $5BEA       $5BE2  
;;  $5BF3       $5BE8   $5BEC  
;;  $5BF9       $5BF6  
;;  $5C05       $549F  
;;  $5C0F       $5C0C  
;;  $5C1D       $5C12   $5C16   $5C1A  
;;  $5C37       $5C33  
;;  $5C3D       $5C31  
;;  $5C4D       $5C46  
;;  $5C60       $5C4B  
;;  $5C77       $5C25   $5C3B   $5C40  
;;  $5C8A       $5973  
;;  $5C8C       $5975  
;;  $5C8E       $5977  
;;  $5C90       $5979  
;;  $5C93       $5CA8  
;;  $5CA5       $5C99   $5D4C  
;;  $5CAB       $5C9D  
;;  $5CCE       $5CC9  
;;  $5CDF       $5E37  
;;  $5CEC       $5CAB   $5D53   $5D98  
;;  $5CFD       $5CA3   $5F83  
;;  $5D1F       $5D09   $5D13  
;;  $5D42       $5D3F  
;;  $5D43       $5D1D  
;;  $5D53       $5D61   $5D65  
;;  $5D56       $5D51   $5D69  
;;  $5D6C       $5D59  
;;  $5D7E       $5D7A  
;;  $5D92       $5D82   $5D86   $5D8A   $5D8E  
;;  $5DFA       $5C8C  
;;  $5E24       $5E10   $5E1A  
;;  $5E26       $5CDD   $5E16   $5E1E   $5E22  
;;  $5E51       $5DFF   $5E57   $5E69  
;;  $5E52       $5C8E  
;;  $5E7D       $5E7F  
;;  $5EA5       $5EBF  
;;  $5EB5       $5E99  
;;  $5EC1       $5C8A  
;;  $5EDF       $5EDB  
;;  $5EEA       $5EF2  
;;  $5EF9       $5F46  
;;  $5F1B       $5F12  
;;  $5F29       $5F19   $5F73  
;;  $5F49       $5FBF  
;;  $5F64       $5F5E  
;;  $5F75       $5D96  
;;  $5F85       $5D30  
;;  $5FB5       $5FAF   $5FB2  
;;  $5FF6       $5FB8  
;; ======================================================================== ;;
