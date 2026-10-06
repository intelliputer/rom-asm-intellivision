
        ORG     $5000
.HEADER:
        BIDECLE $5C8F           ; 5000  Ptr: MOB graphic images
        BIDECLE $505F           ; 5002  Ptr: EXEC timer table
        BIDECLE $50E9           ; 5004  Ptr: Start of game
        BIDECLE $5FCA           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5FBF           ; 5008  Ptr: GRAM init sequence
        BIDECLE $501C           ; 500A  Ptr: Date/Title
        DECLE   $0082           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0005,  $0001   ; 500F  Color Stack init (0, 1)
        DECLE   $0005,  $0001   ; 5011  Color Stack init (2, 3)
        DECLE   $000B           ; 5013  Border color init

        DECLE   $0180,  $0190,  $01A0,  $01B0   ; 5014   0180 0190 01A0 01B0
        DECLE   $01C0,  $01D0,  $01E0,  $01F0   ; 5018   01C0 01D0 01E0 01F0
.TITLE:
        DECLE   $004E                           ; 501C  Cartridge year
        DECLE   $0000                           ; 501D  

.TITLECODE:
        PSHR    R5                              ; 501E   0275
        MVII    #$0007, R3                      ; 501F   02BB 0007
        MVII    #$027A, R4                      ; 5021   02BC 027A

        JSR     R5,     X_PRINT_R5              ; 5023   0004 0118 007B
        STRING  "ELECTRIC COMPANY"              ; 5026  
        DECLE   $0000                           ; 5036   0000

        MVII    #$02A6, R4                      ; 5037   02BC 02A6

        JSR     R5,     X_PRINT_R5              ; 5039   0004 0118 007B
        STRING  "MATH FUN"                      ; 503C  
        DECLE   $0000                           ; 5044   0000

        MVII    #$02DD, R4                      ; 5045   02BC 02DD

        JSR     R5,     X_PRINT_R5              ; 5047   0004 0118 007B
        STRING  "Copr @ 1978  CTW"              ; 504A  
        DECLE   $0000                           ; 505A   0000

        PULR    R5                              ; 505B   02B5
        J       L_5932                          ; 505C   0004 0358 0132

.TIMER:
        DECLE   $0069,  $0052,  $0014,  $0000; 505F  Timer dispatch/interval
        DECLE   $007A,  $0052,  $0002,  $0000; 5063  Timer dispatch/interval
        DECLE   $00D2,  $0052,  $0001,  $0000; 5067  Timer dispatch/interval
        DECLE   $0097,  $0052,  $0014,  $0000; 506B  Timer dispatch/interval
        DECLE   $0088,  $0059,  $0014,  $0000; 506F  Timer dispatch/interval
        BIDECLE $0000           ; 5073  End of timer table

        DECLE   $0097,  $0052,  $00B1,  $0053   ; 5075   0097 0052 00B1 0053
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5079   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 507D   0000 0000 0000 0000
        DECLE   $0022,  $005C,  $0000,  $0000   ; 5081   0022 005C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5085   0000 0000 0000 0000
        DECLE   $00C0,  $0010,  $0099,  $0050   ; 5089   00C0 0010 0099 0050
        DECLE   $0000,  $0000,  $0000,  $001E   ; 508D   0000 0000 0000 001E
        DECLE   $0000,  $0000,  $00F0,  $0003   ; 5091   0000 0000 00F0 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5095   0000 0000 0000 0000
        DECLE   $0100,  $0000,  $00E3,  $0058   ; 5099   0100 0000 00E3 0058
        DECLE   $0008,  $0000,  $0000,  $0100   ; 509D   0008 0000 0000 0100
        DECLE   $0000,  $005D,  $0058,  $0008   ; 50A1   0000 005D 0058 0008
        DECLE   $0000,  $0000,  $0100,  $0000   ; 50A5   0000 0000 0100 0000
        DECLE   $004C,  $0057,  $0008,  $003E   ; 50A9   004C 0057 0008 003E
        DECLE   $0000,  $0100,  $0000,  $004C   ; 50AD   0000 0100 0000 004C
        DECLE   $0057,  $0008,  $0052,  $0000   ; 50B1   0057 0008 0052 0000
        DECLE   $0100,  $0000,  $004C,  $0057   ; 50B5   0100 0000 004C 0057
        DECLE   $0008,  $004E,  $0000,  $0100   ; 50B9   0008 004E 0000 0100
        DECLE   $0000,  $004C,  $0057,  $0008   ; 50BD   0000 004C 0057 0008
        DECLE   $003A,  $0000,  $0016,  $0036   ; 50C1   003A 0000 0016 0036
        DECLE   $0022,  $001A,  $001E,  $0026   ; 50C5   0022 001A 001E 0026
        DECLE   $002A,  $002E,  $0032,  $0012   ; 50C9   002A 002E 0032 0012
        DECLE   $0062,  $0010,  $0004,  $0003   ; 50CD   0062 0010 0004 0003
        DECLE   $0006,  $0012,  $0014,  $0013   ; 50D1   0006 0012 0014 0013
        DECLE   $0010,  $0013,  $0006,  $0000   ; 50D5   0010 0013 0006 0000
        DECLE   $00C0,  $0030,  $0000,  $0000   ; 50D9   00C0 0030 0000 0000
        DECLE   $0000,  $000F,  $0000,  $0068   ; 50DD   0000 000F 0000 0068
        DECLE   $03D8,  $0000,  $0040,  $0001   ; 50E1   03D8 0000 0040 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50E5   0000 0000 0000 0000
.START:
        PSHR    R5                              ; 50E9   0275
        SDBD                                    ; 50EA   0001
        MVII    #$505F, R1                      ; 50EB   02B9 005F 0050

        JSR     R5,     X_TIMER_STOP            ; 50EE   0004 0118 0038

        SDBD                                    ; 50F1   0001
        MVII    #$5063, R1                      ; 50F2   02B9 0063 0050

        JSR     R5,     X_TIMER_STOP            ; 50F5   0004 0118 0038

        SDBD                                    ; 50F8   0001
        MVII    #$5067, R1                      ; 50F9   02B9 0067 0050

        JSR     R5,     X_TIMER_STOP            ; 50FC   0004 0118 0038

        MVII    #$016D, R4                      ; 50FF   02BC 016D
        MVII    #$0039, R0                      ; 5101   02B8 0039

        JSR     R5,     X_FILL_ZERO             ; 5103   0004 0114 0338

        CLRR    R0                              ; 5106   01C0
        MVII    #$0169, R5                      ; 5107   02BD 0169
        MVO@    R0,     R5                      ; 5109   0268
        MVO@    R0,     R5                      ; 510A   0268
        MVO@    R0,     R5                      ; 510B   0268
        MVO@    R0,     R5                      ; 510C   0268

        JSR     R5,     L_525E                  ; 510D   0004 0150 025E

L_5110:
        MVII    #$0218, R4                      ; 5110   02BC 0218
        CLRR    R3                              ; 5112   01DB

        JSR     R5,     X_PRINT_R5              ; 5113   0004 0118 007B
        STRING  "PLAYER 1:"                     ; 5116  
        DECLE   $0000                           ; 511F   0000

        MVII    #$023D, R4                      ; 5120   02BC 023D

        JSR     R5,     X_PRINT_R5              ; 5122   0004 0118 007B
        STRING  "# OF PROBLEMS?"                ; 5125  
        DECLE   $0000                           ; 5133   0000

        MVII    #$0002, R0                      ; 5134   02B8 0002
        ADDI    #$0002, R4                      ; 5136   02FC 0002
        MOVR    R4,     R1                      ; 5138   00A1
        CLRR    R2                              ; 5139   01D2

        JSR     R5,     X_GETNUM                ; 513A   0004 0118 00FF

        TSTR    R0                              ; 513D   0080
        BEQ     L_5110                          ; 513E   0224 002F

        MVO     R0,     G_0177                  ; 5140   0240 0177
        CLRR    R3                              ; 5142   01DB
        MVII    #$0265, R4                      ; 5143   02BC 0265

        JSR     R5,     X_PRINT_R5              ; 5145   0004 0118 007B
        STRING  "LEVEL:"                        ; 5148  
        DECLE   $0000                           ; 514E   0000

        CLRR    R0                              ; 514F   01C0

        JSR     R5,     L_5C0C                  ; 5150   0004 015C 000C

        MVO     R0,     G_016F                  ; 5153   0240 016F
        SUBI    #$0003, R0                      ; 5155   0338 0003
        BGE     L_515A                          ; 5157   020D 0001

        CLRR    R0                              ; 5159   01C0
L_515A:
        MVO     R0,     G_0171                  ; 515A   0240 0171

        JSR     R5,     L_525E                  ; 515C   0004 0150 025E

        MVII    #$0218, R4                      ; 515F   02BC 0218
        MVII    #$0006, R3                      ; 5161   02BB 0006

        JSR     R5,     X_PRINT_R5              ; 5163   0004 0118 007B
        STRING  "PLAYER 2:"                     ; 5166  
        DECLE   $0000                           ; 516F   0000

        MVII    #$023D, R4                      ; 5170   02BC 023D
        SDBD                                    ; 5172   0001
        MVII    #$5125, R1                      ; 5173   02B9 0025 0051

        JSR     R5,     X_PRINT_R1              ; 5176   0004 0118 0067

        MVII    #$0002, R0                      ; 5179   02B8 0002
        MOVR    R4,     R1                      ; 517B   00A1
        ADDI    #$0002, R1                      ; 517C   02F9 0002
        MVII    #$0001, R2                      ; 517E   02BA 0001

        JSR     R5,     X_GETNUM                ; 5180   0004 0118 00FF

        MVO     R0,     G_0178                  ; 5183   0240 0178
        TSTR    R0                              ; 5185   0080
        BEQ     L_51A9                          ; 5186   0204 0021

        MVII    #$0006, R3                      ; 5188   02BB 0006
        MVII    #$0265, R4                      ; 518A   02BC 0265
        SDBD                                    ; 518C   0001
        MVII    #$5148, R1                      ; 518D   02B9 0048 0051

        JSR     R5,     X_PRINT_R1              ; 5190   0004 0118 0067

        MVII    #$0001, R0                      ; 5193   02B8 0001

        JSR     R5,     L_5C0C                  ; 5195   0004 015C 000C

        MVO     R0,     G_0170                  ; 5198   0240 0170
        SUBI    #$0003, R0                      ; 519A   0338 0003
        BGE     L_519F                          ; 519C   020D 0001

        CLRR    R0                              ; 519E   01C0
L_519F:
        MVO     R0,     G_0172                  ; 519F   0240 0172
        B       L_51B0                          ; 51A1   0200 000D

        SUBR    R1,     R0                      ; 51A3   0108
        SUBR    R0,     R7                      ; 51A4   0107

        SUBR    R0,     R6                      ; 51A5   0106
        SUBR    R0,     R0                      ; 51A6   0100
        SUBR    R0,     R1                      ; 51A7   0101
        SUBR    R0,     R2                      ; 51A8   0102
L_51A9:
        INCR    R0                              ; 51A9   0008
        MVO     R0,     G_016D                  ; 51AA   0240 016D
        MVII    #$0004, R2                      ; 51AC   02BA 0004
        MVO     R2,     G_0182                  ; 51AE   0242 0182

L_51B0:
        JSR     R5,     L_525E                  ; 51B0   0004 0150 025E

        MVII    #$02F9, R1                      ; 51B3   02B9 02F9
        MVII    #$0007, R0                      ; 51B5   02B8 0007
        MVII    #$0256, R4                      ; 51B7   02BC 0256

        JSR     R5,     X_FILL_MEM              ; 51B9   0004 0114 0341

        MVII    #$026A, R4                      ; 51BC   02BC 026A

        JSR     R5,     X_FILL_MEM              ; 51BE   0004 0114 0341

        MVII    #$02A6, R4                      ; 51C1   02BC 02A6

        JSR     R5,     X_FILL_MEM              ; 51C3   0004 0114 0341

        MVII    #$02BA, R4                      ; 51C6   02BC 02BA

        JSR     R5,     X_FILL_MEM              ; 51C8   0004 0114 0341

        MVII    #$02CE, R4                      ; 51CB   02BC 02CE

        JSR     R5,     X_FILL_MEM              ; 51CD   0004 0114 0341

        MVII    #$0206, R2                      ; 51D0   02BA 0206
        MVII    #$020E, R3                      ; 51D2   02BB 020E
        MVII    #$000C, R0                      ; 51D4   02B8 000C
        SDBD                                    ; 51D6   0001
        MVII    #$2000, R5                      ; 51D7   02BD 0000 0020
L_51DA:
        MVI@    R2,     R1                      ; 51DA   0291
        XORR    R5,     R1                      ; 51DB   01E9
        MVO@    R1,     R2                      ; 51DC   0251
        MVI@    R3,     R1                      ; 51DD   0299
        XORR    R5,     R1                      ; 51DE   01E9
        MVO@    R1,     R3                      ; 51DF   0259
        ADDI    #$0014, R2                      ; 51E0   02FA 0014
        ADDI    #$0014, R3                      ; 51E2   02FB 0014
        DECR    R0                              ; 51E4   0010
        BNEQ    L_51DA                          ; 51E5   022C 000C

        MVII    #$0205, R4                      ; 51E7   02BC 0205
        MVII    #$0002, R3                      ; 51E9   02BB 0002
L_51EB:
        MVII    #$0006, R2                      ; 51EB   02BA 0006
        SDBD                                    ; 51ED   0001
        MVII    #$51A3, R5                      ; 51EE   02BD 00A3 0051
L_51F1:
        MVI@    R5,     R0                      ; 51F1   02A8
        SLL     R0,     2                       ; 51F2   004C
        SLL     R0,     1                       ; 51F3   0048
        INCR    R0                              ; 51F4   0008
        MVO@    R0,     R4                      ; 51F5   0260
        XORI    #$0004, R0                      ; 51F6   03F8 0004
        ADDI    #$0007, R4                      ; 51F8   02FC 0007
        MVO@    R0,     R4                      ; 51FA   0260
        ADDI    #$000B, R4                      ; 51FB   02FC 000B
        DECR    R2                              ; 51FD   0012
        BNEQ    L_51F1                          ; 51FE   022C 000E

        DECR    R3                              ; 5200   0013
        BNEQ    L_51EB                          ; 5201   022C 0017

        CLRR    R0                              ; 5203   01C0
        SDBD                                    ; 5204   0001
        MVII    #$1400, R4                      ; 5205   02BC 0000 0014
        MVII    #$031D, R2                      ; 5208   02BA 031D

        JSR     R5,     L_5A9C                  ; 520A   0004 0158 029C

        MVII    #$0006, R0                      ; 520D   02B8 0006
        SDBD                                    ; 520F   0001
        MVII    #$8300, R4                      ; 5210   02BC 0000 0083
        MVII    #$033D, R2                      ; 5213   02BA 033D

        JSR     R5,     L_5A9C                  ; 5215   0004 0158 029C
        JSR     R5,     L_5A54                  ; 5218   0004 0158 0254

        MVI     G_016D, R1                      ; 521B   0281 016D
        CMPI    #$0001, R1                      ; 521D   0379 0001
        BNEQ    L_5224                          ; 521F   020C 0003

        JSR     R5,     L_583A                  ; 5221   0004 0158 003A

L_5224:
        SDBD                                    ; 5224   0001
        MVII    #$505F, R1                      ; 5225   02B9 005F 0050

        JSR     R5,     X_TIMER_START           ; 5228   0004 0118 0044

        SDBD                                    ; 522B   0001
        MVII    #$5063, R1                      ; 522C   02B9 0063 0050

        JSR     R5,     X_TIMER_START           ; 522F   0004 0118 0044

        SDBD                                    ; 5232   0001
        MVII    #$5067, R1                      ; 5233   02B9 0067 0050

        JSR     R5,     X_TIMER_START           ; 5236   0004 0118 0044
        DECLE   $01C0,  $02BB,  $0002,  $0001   ; 5239   01C0 02BB 0002 0001
        DECLE   $02B9,  $0083,  $0001,  $02BA   ; 523D   02B9 0083 0001 02BA
        DECLE   $0004,  $0248,  $02F9,  $0007   ; 5241   0004 0248 02F9 0007
        DECLE   $0012,  $022C,  $0005,  $0040   ; 5245   0012 022C 0005 0040
        DECLE   $0001,  $02B9,  $0084,  $0001   ; 5249   0001 02B9 0084 0001
        DECLE   $0013,  $022C,  $000F,  $0001   ; 524D   0013 022C 000F 0001

        MVII    #$0075, R1                      ; 5251   02B9 0075
        RLC     R0,     1                       ; 5253   0050
        MVO     R1,     G_035D                  ; 5254   0241 035D
        CLRR    R5                              ; 5256   01ED
        MVO     R5,     G_0146                  ; 5257   0245 0146
        MVO     R5,     G_01A4                  ; 5259   0245 01A4
        MVO     R5,     G_01A5                  ; 525B   0245 01A5
        PULR    R7                              ; 525D   02B7

L_525E:
        PSHR    R5                              ; 525E   0275
        MVII    #$00F0, R0                      ; 525F   02B8 00F0
        MVII    #$0000, R1                      ; 5261   02B9 0000
        MVII    #$0200, R4                      ; 5263   02BC 0200

        JSR     R5,     X_FILL_MEM              ; 5265   0004 0114 0341

        PULR    R7                              ; 5268   02B7

L_5269:
        PSHR    R5                              ; 5269   0275
        MVI     G_01A1, R2                      ; 526A   0282 01A1
        INCR    R2                              ; 526C   000A
        CMPI    #$003C, R2                      ; 526D   037A 003C
        BLT     L_5277                          ; 526F   0205 0006

        MVI     G_01A2, R2                      ; 5271   0282 01A2
        INCR    R2                              ; 5273   000A
        MVO     R2,     G_01A2                  ; 5274   0242 01A2
        CLRR    R2                              ; 5276   01D2
L_5277:
        MVO     R2,     G_01A1                  ; 5277   0242 01A1
        PULR    R7                              ; 5279   02B7

L_527A:
        PSHR    R5                              ; 527A   0275

        JSR     R5,     L_5A54                  ; 527B   0004 0158 0254

        MVII    #$02E1, R3                      ; 527E   02BB 02E1
        CLRR    R4                              ; 5280   01E4
L_5281:
        MVII    #$000B, R0                      ; 5281   02B8 000B
        PSHR    R3                              ; 5283   0273
        MVI@    R3,     R1                      ; 5284   0299
L_5285:
        SUBI    #$0014, R3                      ; 5285   033B 0014
        MVI@    R3,     R2                      ; 5287   029A
        MVO@    R1,     R3                      ; 5288   0259
        MOVR    R2,     R1                      ; 5289   0091
        DECR    R0                              ; 528A   0010
        BNEQ    L_5285                          ; 528B   022C 0007

        PULR    R3                              ; 528D   02B3
        MVO@    R1,     R3                      ; 528E   0259
        TSTR    R4                              ; 528F   00A4
        BNEQ    L_52D1                          ; 5290   020C 003F

        INCR    R4                              ; 5292   000C
        MVII    #$02E9, R3                      ; 5293   02BB 02E9
        B       L_5281                          ; 5295   0220 0015

L_5297:
        PSHR    R5                              ; 5297   0275
        CLRR    R0                              ; 5298   01C0
L_5299:
        MOVR    R0,     R1                      ; 5299   0081
        SDBD                                    ; 529A   0001
        ADDI    #$0181, R1                      ; 529B   02F9 0081 0001
        MVI@    R1,     R1                      ; 529E   0289
        COMR    R1                              ; 529F   0019
        ANDI    #$000A, R1                      ; 52A0   03B9 000A
        BNEQ    L_52CC                          ; 52A2   020C 0028

        MOVR    R0,     R5                      ; 52A4   0085
        ADDR    R5,     R5                      ; 52A5   00ED
        SDBD                                    ; 52A6   0001
        ADDI    #$0165, R5                      ; 52A7   02FD 0065 0001
        MVII    #$0001, R3                      ; 52AA   02BB 0001
        PSHR    R0                              ; 52AC   0270
        MOVR    R0,     R2                      ; 52AD   0082
        SDBD                                    ; 52AE   0001
        ADDI    #$011F, R2                      ; 52AF   02FA 001F 0001
        MVI@    R2,     R0                      ; 52B2   0290
        ANDI    #$00C0, R0                      ; 52B3   03B8 00C0
        BNEQ    L_52BD                          ; 52B5   020C 0006

        SDBD                                    ; 52B7   0001
        ADDI    #$0004, R5                      ; 52B8   02FD 0004 0000
        MVII    #$0007, R3                      ; 52BB   02BB 0007
L_52BD:
        SDBD                                    ; 52BD   0001
        MVI@    R5,     R0                      ; 52BE   02A8
        PULR    R1                              ; 52BF   02B1

        JSR     R5,     L_5A4C                  ; 52C0   0004 0158 024C

        PSHR    R1                              ; 52C3   0271
        ADDI    #$003C, R4                      ; 52C4   02FC 003C
        MVII    #$0004, R1                      ; 52C6   02B9 0004

        JSR     R5,     X_PRNUM_RGT             ; 52C8   0004 0118 00C5

        PULR    R0                              ; 52CB   02B0
L_52CC:
        INCR    R0                              ; 52CC   0008
        CMPI    #$0001, R0                      ; 52CD   0378 0001
        BLE     L_5299                          ; 52CF   0226 0037
L_52D1:
        PULR    R7                              ; 52D1   02B7

L_52D2:
        PSHR    R5                              ; 52D2   0275
        CLRR    R3                              ; 52D3   01DB
L_52D4:
        MVI     G_016E, R1                      ; 52D4   0281 016E
        XORI    #$0001, R1                      ; 52D6   03F9 0001
        MVO     R1,     G_016E                  ; 52D8   0241 016E

        JSR     R5,     L_5A3D                  ; 52DA   0004 0158 023D

        ANDI    #$003C, R2                      ; 52DD   03BA 003C
        BEQ     L_52E7                          ; 52DF   0204 0006

        TSTR    R3                              ; 52E1   009B
        BNEQ    L_53AB                          ; 52E2   020C 00C7

        INCR    R3                              ; 52E4   000B
        B       L_52D4                          ; 52E5   0220 0012

L_52E7:
        JSR     R5,     L_5564                  ; 52E7   0004 0154 0164
        JSR     R5,     L_5ACC                  ; 52EA   0004 0158 02CC

        PSHR    R0                              ; 52ED   0270
        MVII    #$032D, R4                      ; 52EE   02BC 032D
        MVI     G_016E, R0                      ; 52F0   0280 016E
        TSTR    R0                              ; 52F2   0080
        BEQ     L_52F7                          ; 52F3   0204 0002

        ADDI    #$0020, R4                      ; 52F5   02FC 0020

L_52F7:
        JSR     R5,     L_5A3D                  ; 52F7   0004 0158 023D

        MVI     G_016E, R1                      ; 52FA   0281 016E
        TSTR    R1                              ; 52FC   0089
        BNEQ    L_5309                          ; 52FD   020C 000A

        MVII    #$000F, R0                      ; 52FF   02B8 000F
        ANDI    #$0001, R2                      ; 5301   03BA 0001
        BEQ     L_5311                          ; 5303   0204 000C

        MVII    #$0037, R0                      ; 5305   02B8 0037
        B       L_5311                          ; 5307   0200 0008

L_5309:
        MVII    #$007D, R0                      ; 5309   02B8 007D
        ANDI    #$0001, R2                      ; 530B   03BA 0001
        BEQ     L_5311                          ; 530D   0204 0002

        SUBI    #$002A, R0                      ; 530F   0338 002A
L_5311:
        MVII    #$0068, R1                      ; 5311   02B9 0068

        JSR     R5,     X_PACK_BYTES            ; 5313   0004 0114 034F

        PULR    R1                              ; 5316   02B1

        JSR     R5,     L_5AE4                  ; 5317   0004 0158 02E4
        JSR     R5,     L_5A3D                  ; 531A   0004 0158 023D

        XORI    #$0020, R2                      ; 531D   03FA 0020

        JSR     R5,     L_5A44                  ; 531F   0004 0158 0244

        PULR    R7                              ; 5322   02B7

        PSHR    R5                              ; 5323   0275
        CLRR    R0                              ; 5324   01C0
        CMPI    #$032D, R1                      ; 5325   0379 032D
        BEQ     L_532A                          ; 5327   0204 0001

        INCR    R0                              ; 5329   0008
L_532A:
        MVO     R0,     G_016E                  ; 532A   0240 016E

        JSR     R5,     L_5A3D                  ; 532C   0004 0158 023D

        XORI    #$0020, R2                      ; 532F   03FA 0020

        JSR     R5,     L_5A44                  ; 5331   0004 0158 0244

        MVII    #$0331, R2                      ; 5334   02BA 0331
        TSTR    R0                              ; 5336   0080
        BEQ     L_533B                          ; 5337   0204 0002

        ADDI    #$0020, R2                      ; 5339   02FA 0020
L_533B:
        CLRR    R0                              ; 533B   01C0
        MVO@    R0,     R2                      ; 533C   0250
        MVII    #$0322, R1                      ; 533D   02B9 0322
        MVI     G_016E, R0                      ; 533F   0280 016E
        TSTR    R0                              ; 5341   0080
        BEQ     L_5346                          ; 5342   0204 0002

        ADDI    #$0020, R1                      ; 5344   02F9 0020
L_5346:
        MVII    #$0008, R0                      ; 5346   02B8 0008
        MVO@    R0,     R1                      ; 5348   0248
        ADDI    #$0008, R1                      ; 5349   02F9 0008
        MVO@    R0,     R1                      ; 534B   0248
        MVI     G_016E, R1                      ; 534C   0281 016E

        JSR     R5,     L_5A4C                  ; 534E   0004 0158 024C

        PSHR    R4                              ; 5351   0274
        PSHR    R4                              ; 5352   0274
        MVII    #$015D, R3                      ; 5353   02BB 015D
        MVI     G_016E, R5                      ; 5355   0285 016E
        ADDR    R5,     R5                      ; 5357   00ED
        ADDR    R3,     R5                      ; 5358   00DD
        SDBD                                    ; 5359   0001
        MVI@    R5,     R0                      ; 535A   02A8
        MVII    #$0007, R3                      ; 535B   02BB 0007
        MVII    #$0004, R1                      ; 535D   02B9 0004

        JSR     R5,     X_PRNUM_RGT             ; 535F   0004 0118 00C5

        MVI     G_016E, R5                      ; 5362   0285 016E
        ADDR    R5,     R5                      ; 5364   00ED
        ADDI    #$0161, R5                      ; 5365   02FD 0161
        SDBD                                    ; 5367   0001
        MVI@    R5,     R0                      ; 5368   02A8
        PULR    R4                              ; 5369   02B4
        PSHR    R4                              ; 536A   0274
        ADDI    #$0014, R4                      ; 536B   02FC 0014
        MVII    #$0004, R1                      ; 536D   02B9 0004
        MVII    #$0007, R3                      ; 536F   02BB 0007

        JSR     R5,     X_PRNUM_RGT             ; 5371   0004 0118 00C5

        PULR    R4                              ; 5374   02B4
        MVI     G_016E, R1                      ; 5375   0281 016E
        ADDI    #$0173, R1                      ; 5377   02F9 0173
        MVI@    R1,     R5                      ; 5379   028D
        MOVR    R5,     R1                      ; 537A   00A9
        SDBD                                    ; 537B   0001
        ADDI    #$53AC, R5                      ; 537C   02FD 00AC 0053
        CMPI    #$0003, R1                      ; 537F   0379 0003
        MVI@    R5,     R1                      ; 5381   02A9
        BMI     L_5386                          ; 5382   020B 0002

        SWAP    R1,     1                       ; 5384   0041
        XOR@    R5,     R1                      ; 5385   03E9
L_5386:
        CLRR    R3                              ; 5386   01DB
L_5387:
        MVI@    R4,     R0                      ; 5387   02A0
        CMPI    #$0007, R0                      ; 5388   0378 0007
        BNEQ    L_538F                          ; 538A   020C 0003

        INCR    R3                              ; 538C   000B
        B       L_5387                          ; 538D   0220 0007

L_538F:
        ADDI    #$0012, R4                      ; 538F   02FC 0012
        TSTR    R3                              ; 5391   009B
        BNEQ    L_5395                          ; 5392   020C 0001

        INCR    R4                              ; 5394   000C
L_5395:
        MVO@    R1,     R4                      ; 5395   0261
        ADDI    #$0013, R4                      ; 5396   02FC 0013
        SDBD                                    ; 5398   0001
        MVII    #$0677, R1                      ; 5399   02B9 0077 0006
        PULR    R3                              ; 539C   02B3
        ADDI    #$002B, R3                      ; 539D   02FB 002B
L_539F:
        MVO@    R1,     R4                      ; 539F   0261
        CMPR    R3,     R4                      ; 53A0   015C
        BLE     L_539F                          ; 53A1   0226 0003

        JSR     R5,     L_5A3D                  ; 53A3   0004 0158 023D

        XORI    #$0010, R2                      ; 53A6   03FA 0010

        JSR     R5,     L_5A44                  ; 53A8   0004 0158 0244

L_53AB:
        PULR    R7                              ; 53AB   02B7

        SLLC    R3,     2                       ; 53AC   005F
        SAR     R3,     2                       ; 53AD   006F
        ADD     .STIC.Y.0,R7                    ; 53AE   02C7 0008
        ADCR    R7                              ; 53B0   002F

        PSHR    R5                              ; 53B1   0275
L_53B2:
        MOVR    R1,     R2                      ; 53B2   008A
        ADDI    #$0181, R2                      ; 53B3   02FA 0181
        MVI@    R2,     R3                      ; 53B5   0293
        ANDI    #$0018, R3                      ; 53B6   03BB 0018
        BEQ     L_53C9                          ; 53B8   0204 000F

        CMPI    #$000B, R0                      ; 53BA   0378 000B
        BEQ     L_5445                          ; 53BC   0204 0087

        ANDI    #$0010, R3                      ; 53BE   03BB 0010
        BEQ     L_53C9                          ; 53C0   0204 0007

        CMPI    #$000A, R0                      ; 53C2   0378 000A
        BEQ     L_5545                          ; 53C4   0204 017F

        JSR     R5,     L_53CA                  ; 53C6   0004 0150 03CA

L_53C9:
        PULR    R7                              ; 53C9   02B7

L_53CA:
        PSHR    R5                              ; 53CA   0275
        MVI@    R2,     R3                      ; 53CB   0293
        ANDI    #$007F, R3                      ; 53CC   03BB 007F
        XORI    #$0080, R3                      ; 53CE   03FB 0080
        MVO@    R3,     R2                      ; 53D0   0253
        MVII    #$0173, R5                      ; 53D1   02BD 0173
        ADDR    R1,     R5                      ; 53D3   00CD
        MVI@    R5,     R5                      ; 53D4   02AD
        CMPI    #$0003, R5                      ; 53D5   037D 0003
        BEQ     L_5410                          ; 53D7   0204 0037

        MOVR    R1,     R3                      ; 53D9   008B
        ADDI    #$01A4, R3                      ; 53DA   02FB 01A4
        MVI@    R3,     R4                      ; 53DC   029C
        INCR    R4                              ; 53DD   000C
        SDBD                                    ; 53DE   0001
        CMPI    #$0005, R4                      ; 53DF   037C 0005 0000
        BGE     L_543C                          ; 53E2   020D 0058

        MVO@    R4,     R3                      ; 53E4   025C
        ADDR    R4,     R4                      ; 53E5   00E4
        ADDR    R7,     R4                      ; 53E6   00FC
        SDBD                                    ; 53E7   0001
        ADDI    #$0054, R4                      ; 53E8   02FC 0054 0000
        PSHR    R1                              ; 53EB   0271
        MOVR    R0,     R1                      ; 53EC   0081
        SDBD                                    ; 53ED   0001
        MVI@    R4,     R0                      ; 53EE   02A0

        JSR     R5,     L_56D3                  ; 53EF   0004 0154 02D3

        PULR    R4                              ; 53F2   02B4
        MOVR    R4,     R1                      ; 53F3   00A1
        ADDR    R4,     R4                      ; 53F4   00E4
        ADDI    #$0169, R4                      ; 53F5   02FC 0169
        SDBD                                    ; 53F7   0001
        ADD@    R4,     R0                      ; 53F8   02E0
        SUBI    #$0002, R4                      ; 53F9   033C 0002
        MVO@    R0,     R4                      ; 53FB   0260
        SWAP    R0,     1                       ; 53FC   0040
        MVO@    R0,     R4                      ; 53FD   0260
        SWAP    R0,     1                       ; 53FE   0040
        PSHR    R0                              ; 53FF   0270

        JSR     R5,     L_5A4C                  ; 5400   0004 0158 024C

        ADDI    #$0040, R4                      ; 5403   02FC 0040
        ADDI    #$01A4, R1                      ; 5405   02F9 01A4
        SUB@    R1,     R4                      ; 5407   030C
        MVI@    R1,     R1                      ; 5408   0289
        PULR    R0                              ; 5409   02B0
        MVII    #$0007, R3                      ; 540A   02BB 0007

        JSR     R5,     X_PRNUM_ZRO             ; 540C   0004 0118 00AD

        PULR    R7                              ; 540F   02B7

L_5410:
        PSHR    R1                              ; 5410   0271
        SLL     R1,     1                       ; 5411   0049
        MVII    #$0169, R4                      ; 5412   02BC 0169
        ADDR    R1,     R4                      ; 5414   00CC
        PSHR    R0                              ; 5415   0270
        SDBD                                    ; 5416   0001
        MVI@    R4,     R0                      ; 5417   02A0
        MVII    #$000A, R1                      ; 5418   02B9 000A

        JSR     R5,     L_56D3                  ; 541A   0004 0154 02D3

        PULR    R5                              ; 541D   02B5
        PULR    R1                              ; 541E   02B1
        BOV     L_543C                          ; 541F   0202 001B

        ADDR    R5,     R0                      ; 5421   00E8
        SDBD                                    ; 5422   0001
        CMPI    #$270F, R0                      ; 5423   0378 000F 0027
        BGT     L_543C                          ; 5426   020E 0014

        SUBI    #$0002, R4                      ; 5428   033C 0002
        MVO@    R0,     R4                      ; 542A   0260
        SWAP    R0,     1                       ; 542B   0040
        MVO@    R0,     R4                      ; 542C   0260
        SWAP    R0,     1                       ; 542D   0040
        PSHR    R0                              ; 542E   0270

        JSR     R5,     L_5A4C                  ; 542F   0004 0158 024C

        ADDI    #$003C, R4                      ; 5432   02FC 003C
        MVII    #$0007, R3                      ; 5434   02BB 0007
        MVII    #$0004, R1                      ; 5436   02B9 0004
        PULR    R0                              ; 5438   02B0

        JSR     R5,     X_PRNUM_RGT             ; 5439   0004 0118 00C5

L_543C:
        PULR    R7                              ; 543C   02B7

        DECLE   $0001,  $0000,  $000A,  $0000   ; 543D   0001 0000 000A 0000
        DECLE   $0064,  $0000                   ; 5441   0064 0000

        ADDR    R5,     R0                      ; 5443   00E8
        DIS                                     ; 5444   0003
L_5445:
        ANDI    #$0010, R3                      ; 5445   03BB 0010
        BEQ     L_54E7                          ; 5447   0204 009E

        MVO     R1,     G_016E                  ; 5449   0241 016E
        MOVR    R1,     R4                      ; 544B   008C
        ADDI    #$01A4, R1                      ; 544C   02F9 01A4
        CLRR    R5                              ; 544E   01ED
        MVO@    R5,     R1                      ; 544F   024D
        ADDR    R4,     R4                      ; 5450   00E4
        ADDI    #$0165, R4                      ; 5451   02FC 0165
        SDBD                                    ; 5453   0001
        MVI@    R4,     R1                      ; 5454   02A1

        JSR     R5,     L_5A3D                  ; 5455   0004 0158 023D

        ANDI    #$0080, R2                      ; 5458   03BA 0080
        BEQ     L_5463                          ; 545A   0204 0007

        ADDI    #$0002, R4                      ; 545C   02FC 0002
        SDBD                                    ; 545E   0001
        MVI@    R4,     R2                      ; 545F   02A2
        CMPR    R1,     R2                      ; 5460   014A
        BEQ     L_548E                          ; 5461   0204 002B

L_5463:
        PSHR    R1                              ; 5463   0271

        JSR     R5,     L_5A00                  ; 5464   0004 0158 0200

        MVI     G_016E, R1                      ; 5467   0281 016E

        JSR     R5,     L_5A4C                  ; 5469   0004 0158 024C

        ADDI    #$003C, R4                      ; 546C   02FC 003C
        MVII    #$0004, R1                      ; 546E   02B9 0004
        PULR    R0                              ; 5470   02B0
        MVII    #$0007, R3                      ; 5471   02BB 0007

        JSR     R5,     X_PRNUM_RGT             ; 5473   0004 0118 00C5
        JSR     R5,     L_5A3D                  ; 5476   0004 0158 023D

        XORI    #$0002, R2                      ; 5479   03FA 0002

        JSR     R5,     L_5A44                  ; 547B   0004 0158 0244

        MVII    #$0006, R0                      ; 547E   02B8 0006
        MVI     G_016E, R1                      ; 5480   0281 016E
        MOVR    R1,     R3                      ; 5482   008B
        ADDI    #$0171, R3                      ; 5483   02FB 0171
        MVI@    R3,     R2                      ; 5485   029A
        SUBI    #$0002, R2                      ; 5486   033A 0002
        BGE     L_548B                          ; 5488   020D 0001

        CLRR    R2                              ; 548A   01D2
L_548B:
        MVO@    R2,     R3                      ; 548B   025A
        B       L_54B8                          ; 548C   0200 002A

L_548E:
        JSR     R5,     L_59FD                  ; 548E   0004 0158 01FD

        MVI     G_016E, R1                      ; 5491   0281 016E
        ADDI    #$0179, R1                      ; 5493   02F9 0179
        MVI@    R1,     R2                      ; 5495   028A
        INCR    R2                              ; 5496   000A
        MVO@    R2,     R1                      ; 5497   024A
        MVI     G_016D, R0                      ; 5498   0280 016D
        CMPI    #$0001, R0                      ; 549A   0378 0001
        BNEQ    L_54A1                          ; 549C   020C 0003

        JSR     R5,     L_5849                  ; 549E   0004 0158 0049

L_54A1:
        MVI     G_016E, R1                      ; 54A1   0281 016E
        MOVR    R1,     R3                      ; 54A3   008B
        ADDI    #$016F, R3                      ; 54A4   02FB 016F
        MVI@    R3,     R3                      ; 54A6   029B
        ADDI    #$0171, R1                      ; 54A7   02F9 0171
        MVI@    R1,     R2                      ; 54A9   028A
        CMPR    R3,     R2                      ; 54AA   015A
        BEQ     L_54AF                          ; 54AB   0204 0002

        INCR    R2                              ; 54AD   000A
        MVO@    R2,     R1                      ; 54AE   024A
L_54AF:
        MVI     G_016E, R1                      ; 54AF   0281 016E
        MVII    #$0007, R0                      ; 54B1   02B8 0007
        TSTR    R1                              ; 54B3   0089
        BEQ     L_54B8                          ; 54B4   0204 0002

        MVII    #$0001, R0                      ; 54B6   02B8 0001

L_54B8:
        JSR     R5,     L_5A4C                  ; 54B8   0004 0158 024C

        MVII    #$0004, R3                      ; 54BB   02BB 0004
L_54BD:
        MVII    #$0004, R2                      ; 54BD   02BA 0004
L_54BF:
        MVI@    R4,     R1                      ; 54BF   02A1
        DECR    R4                              ; 54C0   0014
        XORR    R0,     R1                      ; 54C1   01C1
        MVO@    R1,     R4                      ; 54C2   0261
        DECR    R2                              ; 54C3   0012
        BNEQ    L_54BF                          ; 54C4   022C 0006

        ADDI    #$0010, R4                      ; 54C6   02FC 0010
        DECR    R3                              ; 54C8   0013
        BNEQ    L_54BD                          ; 54C9   022C 000D

        JSR     R5,     L_5A3D                  ; 54CB   0004 0158 023D

        XORI    #$0018, R2                      ; 54CE   03FA 0018
        SDBD                                    ; 54D0   0001
        ANDI    #$FF7F, R2                      ; 54D1   03BA 007F 00FF

        JSR     R5,     L_5A44                  ; 54D4   0004 0158 0244

        MVI     G_016E, R1                      ; 54D7   0281 016E
        ADDI    #$0175, R1                      ; 54D9   02F9 0175
        MVI@    R1,     R0                      ; 54DB   0288
        INCR    R0                              ; 54DC   0008
        MVO@    R0,     R1                      ; 54DD   0248
        MVI     G_016E, R1                      ; 54DE   0281 016E
        ANDI    #$0002, R2                      ; 54E0   03BA 0002
        BNEQ    L_53AB                          ; 54E2   022C 0138

        MOVR    R1,     R2                      ; 54E4   008A
        ADDI    #$0181, R2                      ; 54E5   02FA 0181
L_54E7:
        MVI@    R2,     R3                      ; 54E7   0293
        ANDI    #$0008, R3                      ; 54E8   03BB 0008
        BEQ     L_53AB                          ; 54EA   0224 0140

        MVI@    R2,     R2                      ; 54EC   0292
        SDBD                                    ; 54ED   0001
        ANDI    #$FFF7, R2                      ; 54EE   03BA 00F7 00FF
        MVO     R1,     G_016E                  ; 54F1   0241 016E

        JSR     R5,     L_5A44                  ; 54F3   0004 0158 0244

        MOVR    R2,     R1                      ; 54F6   0091
        ANDI    #$0001, R1                      ; 54F7   03B9 0001
        SLL     R1,     1                       ; 54F9   0049
        ANDI    #$0002, R2                      ; 54FA   03BA 0002
        XORR    R1,     R2                      ; 54FC   01CA
        BEQ     L_5502                          ; 54FD   0204 0003

        JSR     R5,     L_56DF                  ; 54FF   0004 0154 02DF
L_5502:
        JSR     R5,     L_5BFA                  ; 5502   0004 0158 03FA
        JSR     R5,     L_5B53                  ; 5505   0004 0158 0353

        MVI     G_016E, R1                      ; 5508   0281 016E

        JSR     R5,     L_5A4C                  ; 550A   0004 0158 024C

        MVII    #$0004, R3                      ; 550D   02BB 0004
        MVII    #$0000, R1                      ; 550F   02B9 0000
        MVII    #$0004, R0                      ; 5511   02B8 0004

L_5513:
        JSR     R5,     X_FILL_MEM              ; 5513   0004 0114 0341

        ADDI    #$0010, R4                      ; 5516   02FC 0010
        DECR    R3                              ; 5518   0013
        BNEQ    L_5513                          ; 5519   022C 0007

        JSR     R5,     L_5A3D                  ; 551B   0004 0158 023D

        MOVR    R2,     R1                      ; 551E   0091
        SDBD                                    ; 551F   0001
        ANDI    #$FFFE, R2                      ; 5520   03BA 00FE 00FF
        ANDI    #$0002, R1                      ; 5523   03B9 0002
        BEQ     L_5529                          ; 5525   0204 0002

        XORI    #$0001, R2                      ; 5527   03FA 0001
L_5529:
        SDBD                                    ; 5529   0001
        ANDI    #$FFFD, R2                      ; 552A   03BA 00FD 00FF

        JSR     R5,     L_5A44                  ; 552D   0004 0158 0244

        CLRR    R0                              ; 5530   01C0
        MVI     G_016E, R1                      ; 5531   0281 016E
        MOVR    R1,     R3                      ; 5533   008B
        ADDR    R1,     R1                      ; 5534   00C9
        ADDI    #$0169, R1                      ; 5535   02F9 0169
        MVO@    R0,     R1                      ; 5537   0248
        INCR    R1                              ; 5538   0009
        MVO@    R0,     R1                      ; 5539   0248
        ADDI    #$0177, R3                      ; 553A   02FB 0177
        MVI@    R3,     R2                      ; 553C   029A
        DECR    R2                              ; 553D   0012
        MVO@    R2,     R3                      ; 553E   025A
        BNEQ    L_53AB                          ; 553F   022C 0195

        JSR     R5,     L_5877                  ; 5541   0004 0158 0077

        PULR    R7                              ; 5544   02B7

L_5545:
        MVI@    R2,     R3                      ; 5545   0293
        SDBD                                    ; 5546   0001
        ANDI    #$FF7F, R3                      ; 5547   03BB 007F 00FF
        MVO@    R3,     R2                      ; 554A   0253
        PSHR    R1                              ; 554B   0271

        JSR     R5,     L_5A4C                  ; 554C   0004 0158 024C

        ADDI    #$003C, R4                      ; 554F   02FC 003C
        MVII    #$0004, R0                      ; 5551   02B8 0004
        MVII    #$0000, R1                      ; 5553   02B9 0000

        JSR     R5,     X_FILL_MEM              ; 5555   0004 0114 0341

        PULR    R4                              ; 5558   02B4
        MOVR    R4,     R5                      ; 5559   00A5
        ADDR    R4,     R4                      ; 555A   00E4
        ADDI    #$0169, R4                      ; 555B   02FC 0169
        CLRR    R1                              ; 555D   01C9
        MVO@    R1,     R4                      ; 555E   0261
        MVO@    R1,     R4                      ; 555F   0261
        ADDI    #$01A4, R5                      ; 5560   02FD 01A4
        MVO@    R1,     R5                      ; 5562   0269
        PULR    R7                              ; 5563   02B7

L_5564:
        PSHR    R5                              ; 5564   0275
L_5565:
        MVI     G_016E, R1                      ; 5565   0281 016E
        ADDI    #$0171, R1                      ; 5567   02F9 0171
        MVI@    R1,     R1                      ; 5569   0289
        TSTR    R1                              ; 556A   0089
        BEQ     L_557E                          ; 556B   0204 0011

        MVII    #$0004, R0                      ; 556D   02B8 0004
        CMPR    R0,     R1                      ; 556F   0141
        BGE     L_5574                          ; 5570   020D 0002

        MOVR    R1,     R0                      ; 5572   0088
        INCR    R0                              ; 5573   0008

L_5574:
        JSR     R5,     X_RAND2                 ; 5574   0004 0114 029E

        SUBI    #$0003, R1                      ; 5577   0339 0003
        ADDR    R0,     R1                      ; 5579   00C1
        TSTR    R1                              ; 557A   0089
        BPL     L_557E                          ; 557B   0203 0001

        MOVR    R0,     R1                      ; 557D   0081
L_557E:
        SDBD                                    ; 557E   0001
        ADDI    #$5583, R1                      ; 557F   02F9 0083 0055
        ADD@    R1,     R7                      ; 5582   02CF

        DECLE   $0012,  $0021,  $002D,  $0052   ; 5583   0012 0021 002D 0052
        DECLE   $0044,  $0061,  $0036           ; 5587   0044 0061 0036

        SAR     R1,     2                       ; 558A   006D
        RSWD    R2                              ; 558B   003A
        SLL     R2,     2                       ; 558C   004E
        MOVR    R0,     R6                      ; 558D   0086
        SWAP    R0,     1                       ; 558E   0040
        NEGR    R5                              ; 558F   0025
        ADCR    R1                              ; 5590   0029
        MOVR    R2,     R0                      ; 5591   0090
        SLR     R1,     2                       ; 5592   0065
        MOVR    R4,     R0                      ; 5593   00A0
        SAR     R1,     1                       ; 5594   0069
        CLRR    R0                              ; 5595   01C0
L_5596:
        PSHR    R0                              ; 5596   0270
        MVII    #$000A, R0                      ; 5597   02B8 000A

        JSR     R5,     X_RAND2                 ; 5599   0004 0114 029E

        PSHR    R0                              ; 559C   0270
        MVII    #$000A, R0                      ; 559D   02B8 000A

        JSR     R5,     X_RAND2                 ; 559F   0004 0114 029E

        B       L_5688                          ; 55A2   0200 00E4

        MVII    #$0001, R0                      ; 55A4   02B8 0001
        B       L_5596                          ; 55A6   0220 0011

        MVII    #$0002, R0                      ; 55A8   02B8 0002
        B       L_5596                          ; 55AA   0220 0015

        MVII    #$0003, R0                      ; 55AC   02B8 0003
        B       L_5596                          ; 55AE   0220 0019

        MVII    #$0002, R0                      ; 55B0   02B8 0002
L_55B2:
        CLRR    R1                              ; 55B2   01C9
        PSHR    R1                              ; 55B3   0271

        JSR     R5,     L_5627                  ; 55B4   0004 0154 0227

        B       L_5689                          ; 55B7   0200 00D0

        MVII    #$0003, R0                      ; 55B9   02B8 0003
        B       L_55B2                          ; 55BB   0220 000A

        CLRR    R0                              ; 55BD   01C0
L_55BE:
        PSHR    R0                              ; 55BE   0270
        MVII    #$03E8, R0                      ; 55BF   02B8 03E8
        B       L_55D9                          ; 55C1   0200 0016

        MVII    #$0001, R0                      ; 55C3   02B8 0001
        B       L_55BE                          ; 55C5   0220 0008

        MVII    #$0002, R0                      ; 55C7   02B8 0002
L_55C9:
        MVII    #$0001, R1                      ; 55C9   02B9 0001
        PSHR    R1                              ; 55CB   0271

        JSR     R5,     L_5647                  ; 55CC   0004 0154 0247

        B       L_5689                          ; 55CF   0200 00B8

        MVII    #$0003, R0                      ; 55D1   02B8 0003
        B       L_55C9                          ; 55D3   0220 000B

        CLRR    R0                              ; 55D5   01C0
L_55D6:
        PSHR    R0                              ; 55D6   0270
        MVII    #$0064, R0                      ; 55D7   02B8 0064
L_55D9:
        MOVR    R0,     R1                      ; 55D9   0081

        JSR     R5,     X_RAND2                 ; 55DA   0004 0114 029E

        PSHR    R0                              ; 55DD   0270
        MOVR    R1,     R0                      ; 55DE   0088

        JSR     R5,     X_RAND2                 ; 55DF   0004 0114 029E

        B       L_5688                          ; 55E2   0200 00A4

        MVII    #$0001, R0                      ; 55E4   02B8 0001
        B       L_55D6                          ; 55E6   0220 0011

        MVII    #$0002, R0                      ; 55E8   02B8 0002
        B       L_55D6                          ; 55EA   0220 0015

        MVII    #$0003, R0                      ; 55EC   02B8 0003
        B       L_55D6                          ; 55EE   0220 0019

        CLRR    R0                              ; 55F0   01C0
        PSHR    R0                              ; 55F1   0270
        MVII    #$0002, R0                      ; 55F2   02B8 0002

        JSR     R5,     L_5627                  ; 55F4   0004 0154 0227
L_55F7:
        JSR     R5,     L_5677                  ; 55F7   0004 0154 0277

        MVII    #$000A, R0                      ; 55FA   02B8 000A

        JSR     R5,     X_RAND2                 ; 55FC   0004 0114 029E

        ADD@    R6,     R0                      ; 55FF   02F0
        MOVR    R0,     R1                      ; 5600   0081
        MVII    #$000A, R0                      ; 5601   02B8 000A

        JSR     R5,     X_RAND2                 ; 5603   0004 0114 029E

        ADD@    R6,     R0                      ; 5606   02F0
        B       L_5689                          ; 5607   0200 0080

        MVII    #$0001, R0                      ; 5609   02B8 0001
        PSHR    R0                              ; 560B   0270
        MVII    #$0002, R0                      ; 560C   02B8 0002

        JSR     R5,     L_5647                  ; 560E   0004 0154 0247

        B       L_55F7                          ; 5611   0220 001B

        MVII    #$0002, R0                      ; 5613   02B8 0002
L_5615:
        PSHR    R0                              ; 5615   0270
        MVII    #$03E8, R0                      ; 5616   02B8 03E8

        JSR     R5,     X_RAND2                 ; 5618   0004 0114 029E

        PSHR    R0                              ; 561B   0270
        MVII    #$000A, R0                      ; 561C   02B8 000A

        JSR     R5,     X_RAND2                 ; 561E   0004 0114 029E

        B       L_5688                          ; 5621   0200 0065

        MVII    #$0003, R0                      ; 5623   02B8 0003
        B       L_5615                          ; 5625   0220 0011

L_5627:
        PSHR    R5                              ; 5627   0275
        PSHR    R0                              ; 5628   0270
        CLRR    R0                              ; 5629   01C0
        PSHR    R0                              ; 562A   0270
        PSHR    R0                              ; 562B   0270
L_562C:
        MVII    #$000A, R0                      ; 562C   02B8 000A

        JSR     R5,     X_RAND2                 ; 562E   0004 0114 029E

        MOVR    R0,     R1                      ; 5631   0081
        MVII    #$0009, R0                      ; 5632   02B8 0009
        SUBR    R1,     R0                      ; 5634   0108
        BEQ     L_563A                          ; 5635   0204 0003

        JSR     R5,     X_RAND2                 ; 5637   0004 0114 029E

L_563A:
        ADD@    R6,     R0                      ; 563A   02F0
        ADD@    R6,     R1                      ; 563B   02F1
        PULR    R2                              ; 563C   02B2
        DECR    R2                              ; 563D   0012
        BEQ     L_5646                          ; 563E   0204 0006

        PSHR    R2                              ; 5640   0272

        JSR     R5,     L_5677                  ; 5641   0004 0154 0277

        B       L_562C                          ; 5644   0220 0019
L_5646:
        PULR    R7                              ; 5646   02B7

L_5647:
        PSHR    R5                              ; 5647   0275
        PSHR    R0                              ; 5648   0270
        CLRR    R0                              ; 5649   01C0
        PSHR    R0                              ; 564A   0270
        PSHR    R0                              ; 564B   0270
L_564C:
        MVII    #$000A, R0                      ; 564C   02B8 000A

        JSR     R5,     X_RAND2                 ; 564E   0004 0114 029E

        MOVR    R0,     R1                      ; 5651   0081
        MVII    #$000A, R0                      ; 5652   02B8 000A

        JSR     R5,     X_RAND2                 ; 5654   0004 0114 029E
        JSR     R5,     L_5670                  ; 5657   0004 0154 0270

        CMPR    R0,     R1                      ; 565A   0141
        BNEQ    L_5664                          ; 565B   020C 0007

        TSTR    R1                              ; 565D   0089
        BEQ     L_5663                          ; 565E   0204 0003

        DECR    R1                              ; 5660   0011
        B       L_5664                          ; 5661   0200 0001

L_5663:
        INCR    R0                              ; 5663   0008
L_5664:
        ADD@    R6,     R0                      ; 5664   02F0
        ADD@    R6,     R1                      ; 5665   02F1
        PULR    R3                              ; 5666   02B3
        DECR    R3                              ; 5667   0013
        BEQ     L_5646                          ; 5668   0224 0023

        PSHR    R3                              ; 566A   0273

        JSR     R5,     L_5677                  ; 566B   0004 0154 0277

        B       L_564C                          ; 566E   0220 0023

L_5670:
        CMPR    R0,     R1                      ; 5670   0141
        BLE     L_5676                          ; 5671   0206 0003

        PSHR    R0                              ; 5673   0270
        MOVR    R1,     R0                      ; 5674   0088
        PULR    R1                              ; 5675   02B1
L_5676:
        MOVR    R5,     R7                      ; 5676   00AF

L_5677:
        MOVR    R5,     R4                      ; 5677   00AC
        PSHR    R0                              ; 5678   0270
        MVII    #$000A, R0                      ; 5679   02B8 000A

        JSR     R5,     L_56D3                  ; 567B   0004 0154 02D3

        PULR    R1                              ; 567E   02B1
        PSHR    R0                              ; 567F   0270
        MVII    #$000A, R0                      ; 5680   02B8 000A

        JSR     R5,     L_56D3                  ; 5682   0004 0154 02D3

        PSHR    R0                              ; 5685   0270
        MOVR    R4,     R7                      ; 5686   00A7

        PULR    R0                              ; 5687   02B0
L_5688:
        PULR    R1                              ; 5688   02B1

L_5689:
        JSR     R5,     L_5670                  ; 5689   0004 0154 0270

        MVI     G_016E, R4                      ; 568C   0284 016E
        ADDR    R4,     R4                      ; 568E   00E4
        ADDI    #$015D, R4                      ; 568F   02FC 015D
        MVO@    R0,     R4                      ; 5691   0260
        SWAP    R0,     1                       ; 5692   0040
        MVO@    R0,     R4                      ; 5693   0260
        SWAP    R0,     1                       ; 5694   0040
        ADDI    #$0002, R4                      ; 5695   02FC 0002
        MVO@    R1,     R4                      ; 5697   0261
        SWAP    R1,     1                       ; 5698   0041
        MVO@    R1,     R4                      ; 5699   0261
        SWAP    R1,     1                       ; 569A   0041
        MVI     G_016E, R4                      ; 569B   0284 016E
        ADDI    #$0173, R4                      ; 569D   02FC 0173
        PULR    R2                              ; 569F   02B2
        MVO@    R2,     R4                      ; 56A0   0262
        TSTR    R2                              ; 56A1   0092
        BNEQ    L_56A7                          ; 56A2   020C 0003

        ADDR    R0,     R1                      ; 56A4   00C1
        B       L_56C9                          ; 56A5   0200 0022

L_56A7:
        DECR    R2                              ; 56A7   0012
        BNEQ    L_56AE                          ; 56A8   020C 0004

        SUBR    R0,     R1                      ; 56AA   0101
        NEGR    R1                              ; 56AB   0021
        B       L_56C9                          ; 56AC   0200 001B

L_56AE:
        JSR     R5,     L_56D3                  ; 56AE   0004 0154 02D3

        MOVR    R0,     R1                      ; 56B1   0081
        DECR    R2                              ; 56B2   0012
        BEQ     L_56C9                          ; 56B3   0204 0014

        MVI     G_016E, R4                      ; 56B5   0284 016E
        ADDR    R4,     R4                      ; 56B7   00E4
        ADDI    #$015D, R4                      ; 56B8   02FC 015D
        SDBD                                    ; 56BA   0001
        MVI@    R4,     R1                      ; 56BB   02A1
        SUBI    #$0002, R4                      ; 56BC   033C 0002
        MVO@    R0,     R4                      ; 56BE   0260
        SWAP    R0,     1                       ; 56BF   0040
        MVO@    R0,     R4                      ; 56C0   0260
        SWAP    R0,     1                       ; 56C1   0040
        ADDI    #$0002, R4                      ; 56C2   02FC 0002
        SDBD                                    ; 56C4   0001
        MVI@    R4,     R0                      ; 56C5   02A0
        TSTR    R0                              ; 56C6   0080
        BEQ     L_5565                          ; 56C7   0224 0163

L_56C9:
        MVI     G_016E, R4                      ; 56C9   0284 016E
        ADDR    R4,     R4                      ; 56CB   00E4
        ADDI    #$0165, R4                      ; 56CC   02FC 0165
        MVO@    R1,     R4                      ; 56CE   0261
        SWAP    R1,     1                       ; 56CF   0041
        MVO@    R1,     R4                      ; 56D0   0261
        SWAP    R1,     1                       ; 56D1   0041
        PULR    R7                              ; 56D2   02B7

L_56D3:
        PSHR    R2                              ; 56D3   0272
        MOVR    R0,     R2                      ; 56D4   0082
        CLRR    R0                              ; 56D5   01C0
L_56D6:
        SUBI    #$0001, R1                      ; 56D6   0339 0001
        BLT     L_56DD                          ; 56D8   0205 0003

        ADDR    R2,     R0                      ; 56DA   00D0
        BNOV    L_56D6                          ; 56DB   022A 0006

L_56DD:
        PULR    R2                              ; 56DD   02B2
        MOVR    R5,     R7                      ; 56DE   00AF

L_56DF:
        PSHR    R5                              ; 56DF   0275
        MVII    #$031D, R1                      ; 56E0   02B9 031D
        MVI     G_016E, R0                      ; 56E2   0280 016E
        TSTR    R0                              ; 56E4   0080
        BEQ     L_56E9                          ; 56E5   0204 0002

        ADDI    #$0020, R1                      ; 56E7   02F9 0020
L_56E9:
        MVI@    R1,     R4                      ; 56E9   028C

        JSR     R5,     L_5A3D                  ; 56EA   0004 0158 023D

        ANDI    #$0001, R2                      ; 56ED   03BA 0001
        SDBD                                    ; 56EF   0001
        MVII    #$50A7, R3                      ; 56F0   02BB 00A7 0050
        TSTR    R0                              ; 56F3   0080
        BEQ     L_56FA                          ; 56F4   0204 0004

        XORI    #$0200, R4                      ; 56F6   03FC 0200
        ADDI    #$0007, R3                      ; 56F8   02FB 0007
L_56FA:
        TSTR    R2                              ; 56FA   0092
        BEQ     L_5701                          ; 56FB   0204 0004

        ADDI    #$000E, R3                      ; 56FD   02FB 000E
        XORI    #$0200, R4                      ; 56FF   03FC 0200
L_5701:
        MVO@    R4,     R1                      ; 5701   024C
        INCR    R1                              ; 5702   0009
        MVO@    R3,     R1                      ; 5703   024B
        ADDI    #$0007, R1                      ; 5704   02F9 0007
        MVI@    R1,     R4                      ; 5706   028C
        SDBD                                    ; 5707   0001
        MVII    #$50AE, R3                      ; 5708   02BB 00AE 0050
        XORI    #$0200, R4                      ; 570B   03FC 0200
        TSTR    R0                              ; 570D   0080
        BEQ     L_5714                          ; 570E   0204 0004

        SUBI    #$0007, R3                      ; 5710   033B 0007
        XORI    #$0200, R4                      ; 5712   03FC 0200
L_5714:
        TSTR    R2                              ; 5714   0092
        BEQ     L_571B                          ; 5715   0204 0004

        ADDI    #$000E, R3                      ; 5717   02FB 000E
        XORI    #$0200, R4                      ; 5719   03FC 0200
L_571B:
        MVO@    R4,     R1                      ; 571B   024C
        INCR    R1                              ; 571C   0009
        MVO@    R3,     R1                      ; 571D   024B
        SUBI    #$0004, R1                      ; 571E   0339 0004
        MVII    #$0100, R3                      ; 5720   02BB 0100
        TSTR    R2                              ; 5722   0092
        BEQ     L_5727                          ; 5723   0204 0002

        ADDI    #$0002, R3                      ; 5725   02FB 0002
L_5727:
        MVO@    R3,     R1                      ; 5727   024B
        ADDI    #$0008, R1                      ; 5728   02F9 0008
        MVO@    R3,     R1                      ; 572A   024B
        SUBI    #$0007, R1                      ; 572B   0339 0007
        MVII    #$000F, R3                      ; 572D   02BB 000F
        MVO@    R3,     R1                      ; 572F   024B
        MVI     G_016E, R1                      ; 5730   0281 016E
        SDBD                                    ; 5732   0001
        ADDI    #$017B, R1                      ; 5733   02F9 007B 0001
        CLRR    R0                              ; 5736   01C0
        MVO@    R0,     R1                      ; 5737   0248

        JSR     R5,     L_5A3D                  ; 5738   0004 0158 023D

        XORI    #$0020, R2                      ; 573B   03FA 0020

        JSR     R5,     L_5A44                  ; 573D   0004 0158 0244

        PULR    R0                              ; 5740   02B0
        MVI     G_016E, R4                      ; 5741   0284 016E
        ADDR    R4,     R4                      ; 5743   00E4
        SDBD                                    ; 5744   0001
        ADDI    #$017D, R4                      ; 5745   02FC 007D 0001
        MVO@    R0,     R4                      ; 5748   0260
        SWAP    R0,     1                       ; 5749   0040
        MVO@    R0,     R4                      ; 574A   0260
        PULR    R7                              ; 574B   02B7

        PSHR    R5                              ; 574C   0275
        PSHR    R1                              ; 574D   0271

        JSR     R5,     .EXEC.766               ; 574E   0004 0114 0366

        SLR     R0,     2                       ; 5751   0064
        MOVR    R0,     R3                      ; 5752   0083
        MVO     R3,     G_016E                  ; 5753   0243 016E
        SDBD                                    ; 5755   0001
        MVII    #$017B, R2                      ; 5756   02BA 007B 0001
        ADDR    R3,     R2                      ; 5759   00DA
        MVI@    R2,     R0                      ; 575A   0290
        MOVR    R0,     R4                      ; 575B   0084
        INCR    R0                              ; 575C   0008
        MVO@    R0,     R2                      ; 575D   0250
        SDBD                                    ; 575E   0001
        ADDI    #$5763, R4                      ; 575F   02FC 0063 0057
        ADD@    R4,     R7                      ; 5762   02E7

        DECLE   $0006,  $0063,  $0063,  $0057   ; 5763   0006 0063 0063 0057
        DECLE   $0037                           ; 5767   0037

        RRC     R2,     1                       ; 5768   0072
        MVII    #$0032, R0                      ; 5769   02B8 0032
        MVII    #$0011, R1                      ; 576B   02B9 0011
        NEGR    R1                              ; 576D   0021

        JSR     R5,     L_5A3D                  ; 576E   0004 0158 023D

        ANDI    #$0001, R2                      ; 5771   03BA 0001
        BEQ     L_5779                          ; 5773   0204 0004

        NEGR    R0                              ; 5775   0020
        MVII    #$0017, R1                      ; 5776   02B9 0017
        NEGR    R1                              ; 5778   0021
L_5779:
        TSTR    R3                              ; 5779   009B
        BEQ     L_577D                          ; 577A   0204 0001

        NEGR    R0                              ; 577C   0020

L_577D:
        JSR     R5,     X_PACK_BYTES            ; 577D   0004 0114 034F

        MVII    #$0321, R2                      ; 5780   02BA 0321
        TSTR    R3                              ; 5782   009B
        BEQ     L_5787                          ; 5783   0204 0002

        ADDI    #$0020, R2                      ; 5785   02FA 0020
L_5787:
        MVO@    R0,     R2                      ; 5787   0250
        SUBI    #$0004, R2                      ; 5788   033A 0004
        MVI@    R2,     R0                      ; 578A   0290
        SDBD                                    ; 578B   0001
        ANDI    #$FFDF, R0                      ; 578C   03B8 00DF 00FF
        MVO@    R0,     R2                      ; 578F   0250
        ADDI    #$0008, R2                      ; 5790   02FA 0008
        MVO@    R0,     R2                      ; 5792   0250
        PULR    R1                              ; 5793   02B1
        MVII    #$0005, R0                      ; 5794   02B8 0005
        ADDI    #$0006, R1                      ; 5796   02F9 0006
        MVO@    R0,     R1                      ; 5798   0248
        PULR    R7                              ; 5799   02B7

        JSR     R5,     L_5A3D                  ; 579A   0004 0158 023D

        ANDI    #$0002, R2                      ; 579D   03BA 0002
        BEQ     L_57C6                          ; 579F   0204 0025

        MVII    #$0256, R4                      ; 57A1   02BC 0256
        SDBD                                    ; 57A3   0001
        MVII    #$281F, R2                      ; 57A4   02BA 001F 0028
        TSTR    R3                              ; 57A7   009B
        BEQ     L_57B0                          ; 57A8   0204 0006

        ADDI    #$0005, R4                      ; 57AA   02FC 0005
        SDBD                                    ; 57AC   0001
        XORI    #$2000, R2                      ; 57AD   03FA 0000 0020
L_57B0:
        MVO@    R2,     R4                      ; 57B0   0262
        ADDI    #$0008, R2                      ; 57B1   02FA 0008
        SDBD                                    ; 57B3   0001
        ANDI    #$DFFF, R2                      ; 57B4   03BA 00FF 00DF
        MVO@    R2,     R4                      ; 57B7   0262
        B       L_57C6                          ; 57B8   0200 000C

        JSR     R5,     L_5A3D                  ; 57BA   0004 0158 023D

        ANDI    #$0002, R2                      ; 57BD   03BA 0002
        BEQ     L_57C6                          ; 57BF   0204 0005

        PSHR    R3                              ; 57C1   0273

        JSR     R5,     L_5A28                  ; 57C2   0004 0158 0228

        PULR    R3                              ; 57C5   02B3
L_57C6:
        MVII    #$0321, R1                      ; 57C6   02B9 0321
        TSTR    R3                              ; 57C8   009B
        BEQ     L_57CD                          ; 57C9   0204 0002

        ADDI    #$0020, R1                      ; 57CB   02F9 0020
L_57CD:
        MVI@    R1,     R0                      ; 57CD   0288

        JSR     R5,     X_UNPK_BYTES            ; 57CE   0004 0114 0357

        ADDI    #$000A, R1                      ; 57D1   02F9 000A
        B       L_577D                          ; 57D3   0220 0057

        MVII    #$0256, R4                      ; 57D5   02BC 0256
        SDBD                                    ; 57D7   0001
        MVII    #$22F9, R0                      ; 57D8   02B8 00F9 0022
        TSTR    R3                              ; 57DB   009B
        BEQ     L_57E4                          ; 57DC   0204 0006

        ADDI    #$0005, R4                      ; 57DE   02FC 0005
        SDBD                                    ; 57E0   0001
        XORI    #$2000, R0                      ; 57E1   03F8 0000 0020
L_57E4:
        MVO@    R0,     R4                      ; 57E4   0260
        SDBD                                    ; 57E5   0001
        ANDI    #$DFFF, R0                      ; 57E6   03B8 00FF 00DF
        MVO@    R0,     R4                      ; 57E9   0260
        MVII    #$031E, R2                      ; 57EA   02BA 031E
        TSTR    R3                              ; 57EC   009B
        BEQ     L_57F1                          ; 57ED   0204 0002

        ADDI    #$0020, R2                      ; 57EF   02FA 0020
L_57F1:
        SDBD                                    ; 57F1   0001
        MVII    #$5099, R0                      ; 57F2   02B8 0099 0050
        MVO@    R0,     R2                      ; 57F5   0250
        ADDI    #$0008, R2                      ; 57F6   02FA 0008
        MVO@    R0,     R2                      ; 57F8   0250
        CLRR    R0                              ; 57F9   01C0
        SUBI    #$0005, R2                      ; 57FA   033A 0005
        MVO@    R0,     R2                      ; 57FC   0250
        PULR    R1                              ; 57FD   02B1
        MOVR    R3,     R4                      ; 57FE   009C
        MOVR    R2,     R3                      ; 57FF   0093

        JSR     R5,     L_5A3D                  ; 5800   0004 0158 023D

        MOVR    R2,     R1                      ; 5803   0091
        XORI    #$0020, R2                      ; 5804   03FA 0020
        ADDR    R4,     R4                      ; 5806   00E4
        SUBI    #$0004, R3                      ; 5807   033B 0004
        MVI@    R3,     R0                      ; 5809   0298
        SDBD                                    ; 580A   0001
        ANDI    #$FDFF, R0                      ; 580B   03B8 00FF 00FD
        ANDI    #$0002, R1                      ; 580E   03B9 0002
        BEQ     L_5814                          ; 5810   0204 0002

        XORI    #$0020, R0                      ; 5812   03F8 0020
L_5814:
        MVO@    R0,     R3                      ; 5814   0258
        ADDI    #$0008, R3                      ; 5815   02FB 0008
        XORI    #$0200, R0                      ; 5817   03F8 0200
        MVO@    R0,     R3                      ; 5819   0258
        TSTR    R1                              ; 581A   0089
        BNEQ    L_5831                          ; 581B   020C 0014

        SUBI    #$0006, R3                      ; 581D   033B 0006
        MVII    #$0014, R0                      ; 581F   02B8 0014
        MVI     G_016E, R1                      ; 5821   0281 016E
        TSTR    R1                              ; 5823   0089
        BEQ     L_5828                          ; 5824   0204 0002

        MVII    #$0083, R0                      ; 5826   02B8 0083
L_5828:
        SWAP    R0,     1                       ; 5828   0040
        MVO@    R0,     R3                      ; 5829   0258
        ADDI    #$0008, R3                      ; 582A   02FB 0008
        SDBD                                    ; 582C   0001
        ADDI    #$0800, R0                      ; 582D   02F8 0000 0008
        MVO@    R0,     R3                      ; 5830   0258
L_5831:
        SDBD                                    ; 5831   0001
        ADDI    #$017D, R4                      ; 5832   02FC 007D 0001
        SDBD                                    ; 5835   0001
        MVI@    R4,     R5                      ; 5836   02A5
        J       L_5A44                          ; 5837   0004 0358 0244

L_583A:
        SDBD                                    ; 583A   0001
        MVII    #$50A0, R0                      ; 583B   02B8 00A0 0050
        MVO     R0,     G_033E                  ; 583E   0240 033E
        MVO     R0,     G_0346                  ; 5840   0240 0346
L_5842:
        MVII    #$0008, R0                      ; 5842   02B8 0008
        MVO     R0,     G_0342                  ; 5844   0240 0342
        MVO     R0,     G_034A                  ; 5846   0240 034A
        MOVR    R5,     R7                      ; 5848   00AF

L_5849:
        PSHR    R5                              ; 5849   0275
        MVII    #$00F0, R0                      ; 584A   02B8 00F0
        MVO     R0,     G_0341                  ; 584C   0240 0341
        MVII    #$03F0, R0                      ; 584E   02B8 03F0
        MVO     R0,     G_0342                  ; 5850   0240 0342
        MVO     R0,     G_034A                  ; 5852   0240 034A
        MVII    #$0004, R0                      ; 5854   02B8 0004
        MVO     R0,     G_0344                  ; 5856   0240 0344
L_5858:
        MVII    #$0009, R0                      ; 5858   02B8 0009
        MVO     R0,     G_0343                  ; 585A   0240 0343
        PULR    R7                              ; 585C   02B7

        PSHR    R5                              ; 585D   0275
        MVI     G_0344, R0                      ; 585E   0280 0344
        DECR    R0                              ; 5860   0010
        BEQ     L_5872                          ; 5861   0204 000F

        MVO     R0,     G_0344                  ; 5863   0240 0344
        MVI     G_0341, R0                      ; 5865   0280 0341

        JSR     R5,     X_UNPK_BYTES            ; 5867   0004 0114 0357

        NEGR    R1                              ; 586A   0021

        JSR     R5,     X_PACK_BYTES            ; 586B   0004 0114 034F

        MVO     R0,     G_0341                  ; 586E   0240 0341
        B       L_5858                          ; 5870   0220 0019

L_5872:
        CLRR    R0                              ; 5872   01C0
        MVO     R0,     G_0341                  ; 5873   0240 0341
        B       L_5842                          ; 5875   0220 0034

L_5877:
        PSHR    R5                              ; 5877   0275
        MVI@    R1,     R0                      ; 5878   0288

        JSR     R5,     L_5A3D                  ; 5879   0004 0158 023D

        ANDI    #$0001, R2                      ; 587C   03BA 0001
        BEQ     L_5886                          ; 587E   0204 0006

        JSR     R5,     L_56DF                  ; 5880   0004 0154 02DF
        JSR     R5,     L_5BFA                  ; 5883   0004 0158 03FA

L_5886:
        MVII    #$0321, R1                      ; 5886   02B9 0321
        MVI     G_016E, R0                      ; 5888   0280 016E
        TSTR    R0                              ; 588A   0080
        BEQ     L_588F                          ; 588B   0204 0002

        ADDI    #$0020, R1                      ; 588D   02F9 0020
L_588F:
        MVII    #$0010, R0                      ; 588F   02B8 0010
        MVO@    R0,     R1                      ; 5891   0248
        SDBD                                    ; 5892   0001
        SUBI    #$FFFE, R1                      ; 5893   0339 00FE 00FF
        MVII    #$005A, R0                      ; 5896   02B8 005A
        MVO@    R0,     R1                      ; 5898   0248

        JSR     R5,     L_5A3D                  ; 5899   0004 0158 023D

        XORI    #$0004, R2                      ; 589C   03FA 0004

        JSR     R5,     L_5A44                  ; 589E   0004 0158 0244

        MVI     G_016E, R0                      ; 58A1   0280 016E
        MVII    #$0214, R4                      ; 58A3   02BC 0214
        TSTR    R0                              ; 58A5   0080
        BEQ     L_58AA                          ; 58A6   0204 0002

        ADDI    #$000E, R4                      ; 58A8   02FC 000E
L_58AA:
        PSHR    R4                              ; 58AA   0274
        CLRR    R3                              ; 58AB   01DB
        TSTR    R0                              ; 58AC   0080
        BEQ     L_58B3                          ; 58AD   0204 0004

        SDBD                                    ; 58AF   0001
        MVII    #$2000, R3                      ; 58B0   02BB 0000 0020
L_58B3:
        MVI     G_01A2, R0                      ; 58B3   0280 01A2
        CMPI    #$0063, R0                      ; 58B5   0378 0063
        BLE     L_58BB                          ; 58B7   0206 0002

        MVII    #$0063, R0                      ; 58B9   02B8 0063
L_58BB:
        MVII    #$0002, R1                      ; 58BB   02B9 0002
        XORI    #$0007, R3                      ; 58BD   03FB 0007

        JSR     R5,     X_PRNUM_RGT             ; 58BF   0004 0118 00C5

        PULR    R4                              ; 58C2   02B4
        ADDI    #$0002, R4                      ; 58C3   02FC 0002
        PSHR    R4                              ; 58C5   0274
        SDBD                                    ; 58C6   0001
        ANDI    #$DFFF, R3                      ; 58C7   03BB 00FF 00DF

        JSR     R5,     X_PRINT_R5              ; 58CA   0004 0118 007B
        STRING  ":"                             ; 58CD   003A
        DECLE   $0000                           ; 58CE   0000

        PULR    R4                              ; 58CF   02B4
        INCR    R4                              ; 58D0   000C
        MVI     G_01A1, R0                      ; 58D1   0280 01A1
        MVII    #$0002, R1                      ; 58D3   02B9 0002
        CMPI    #$000A, R0                      ; 58D5   0378 000A
        BGT     L_58DF                          ; 58D7   020E 0006

        JSR     R5,     X_PRINT_R5              ; 58D9   0004 0118 007B
        STRING  "0"                             ; 58DC   0030
        DECLE   $0000                           ; 58DD   0000

        DECR    R1                              ; 58DE   0011

L_58DF:
        JSR     R5,     X_PRNUM_RGT             ; 58DF   0004 0118 00C5

        PULR    R7                              ; 58E2   02B7

        PSHR    R5                              ; 58E3   0275
        MOVR    R1,     R2                      ; 58E4   008A
        MOVR    R2,     R3                      ; 58E5   0093
        ADDI    #$0004, R3                      ; 58E6   02FB 0004
        MVI@    R3,     R0                      ; 58E8   0298

        JSR     R5,     X_UNPK_BYTES            ; 58E9   0004 0114 0357

        TSTR    R0                              ; 58EC   0080
        BNEQ    L_5917                          ; 58ED   020C 0028

        MOVR    R1,     R0                      ; 58EF   0088
        CLRR    R1                              ; 58F0   01C9
        CMPI    #$031D, R2                      ; 58F1   037A 031D
        BNEQ    L_58F6                          ; 58F3   020C 0001

        NEGR    R0                              ; 58F5   0020

L_58F6:
        JSR     R5,     X_PACK_BYTES            ; 58F6   0004 0114 034F

        MVO@    R0,     R3                      ; 58F9   0258
        SDBD                                    ; 58FA   0001
        SUBI    #$FFFF, R3                      ; 58FB   033B 00FF 00FF
        MVII    #$03F0, R0                      ; 58FE   02B8 03F0
        MVO@    R0,     R3                      ; 5900   0258
        ADDI    #$0008, R3                      ; 5901   02FB 0008
        MVO@    R0,     R3                      ; 5903   0258
        ADDI    #$0003, R2                      ; 5904   02FA 0003
        MVI@    R2,     R0                      ; 5906   0290
        ADDI    #$0008, R2                      ; 5907   02FA 0008
        MVO@    R0,     R2                      ; 5909   0250
        SUBI    #$0004, R2                      ; 590A   033A 0004
        MVII    #$0006, R0                      ; 590C   02B8 0006
        MVO@    R0,     R2                      ; 590E   0250

        JSR     R5,     L_5978                  ; 590F   0004 0158 0178

L_5912:
        DECR    R2                              ; 5912   0012
        MVII    #$000F, R0                      ; 5913   02B8 000F
        MVO@    R0,     R2                      ; 5915   0250
        PULR    R7                              ; 5916   02B7

L_5917:
        MOVR    R2,     R4                      ; 5917   0094
        ADDI    #$0007, R2                      ; 5918   02FA 0007
        MVI@    R2,     R5                      ; 591A   0295
        DECR    R5                              ; 591B   0015
        BEQ     L_592A                          ; 591C   0204 000C

        MVO@    R5,     R2                      ; 591E   0255
        CMPI    #$0003, R5                      ; 591F   037D 0003
        BLE     L_5924                          ; 5921   0206 0001

        NEGR    R0                              ; 5923   0020

L_5924:
        JSR     R5,     X_PACK_BYTES            ; 5924   0004 0114 034F

        MVO@    R0,     R3                      ; 5927   0258
        B       L_5912                          ; 5928   0220 0017

L_592A:
        CLRR    R1                              ; 592A   01C9
        MVO@    R1,     R4                      ; 592B   0261
        MVO@    R1,     R4                      ; 592C   0261
        ADDI    #$0007, R4                      ; 592D   02FC 0007
        MVO@    R1,     R4                      ; 592F   0261
        MVO@    R1,     R4                      ; 5930   0261
        PULR    R7                              ; 5931   02B7

L_5932:
        PSHR    R5                              ; 5932   0275
        MVII    #$00FF, R0                      ; 5933   02B8 00FF
        MVO     R0,     G_0146                  ; 5935   0240 0146

        JSR     R5,     X_PLAY_MUS1             ; 5937   0004 0118 0327
        DECLE   $00FC                           ; 593A  Note (short)
        DECLE   $00FC                           ; 593B  Note (short)
        DECLE   $00FC                           ; 593C  Note (short)
        DECLE   $00FC                           ; 593D  Note (short)
        DECLE   $00FE                           ; 593E  Note (short)
        DECLE   $03F2,  $00FC                   ; 593F  Note (long)
        DECLE   $000C                           ; 5941  Note (short)
        DECLE   $00FC                           ; 5942  Note (short)
        DECLE   $00FC                           ; 5943  Note (short)
        DECLE   $00FC                           ; 5944  Note (short)
        DECLE   $00FC                           ; 5945  Note (short)
        DECLE   $00FC                           ; 5946  Note (short)
        DECLE   $00FC                           ; 5947  Note (short)
        DECLE   $014E                           ; 5948  Note (short)
        DECLE   $03F4,  $013D                   ; 5949  Note (long)
        DECLE   $000C                           ; 594B  Note (short)
        DECLE   $00FC                           ; 594C  Note (short)
        DECLE   $00FC                           ; 594D  Note (short)
        DECLE   $00FC                           ; 594E  Note (short)
        DECLE   $00FC                           ; 594F  Note (short)
        DECLE   $00FC                           ; 5950  Note (short)
        DECLE   $00FC                           ; 5951  Note (short)
        DECLE   $018D                           ; 5952  Note (short)
        DECLE   $016C                           ; 5953  Note (short)
        DECLE   $018D                           ; 5954  Note (short)
        DECLE   $016C                           ; 5955  Note (short)
        DECLE   $016C                           ; 5956  Note (short)
        DECLE   $018C                           ; 5957  Note (short)
        DECLE   $016E                           ; 5958  Note (short)
        DECLE   $018D                           ; 5959  Note (short)
        DECLE   $016C                           ; 595A  Note (short)
        DECLE   $016C                           ; 595B  Note (short)
        DECLE   $014E                           ; 595C  Note (short)
        DECLE   $013E                           ; 595D  Note (short)
        DECLE   $03F4,  $00FF                   ; 595E  Note (long)
        DECLE   $0000                           ; 5960  End of music

        PULR    R7                              ; 5961   02B7

        DECLE   $01DC,  $01AC,  $01DC,  $01AC   ; 5962   01DC 01AC 01DC 01AC
        DECLE   $01DC,  $01DC,  $03F4,  $01DC   ; 5966   01DC 01DC 03F4 01DC
        DECLE   $0184,  $01A4,  $0186,  $000E   ; 596A   0184 01A4 0186 000E
        DECLE   $01DC,  $01AC,  $01DC,  $01AC   ; 596E   01DC 01AC 01DC 01AC
        DECLE   $01DC,  $01DC,  $03F2,  $01DF   ; 5972   01DC 01DC 03F2 01DF
        DECLE   $0000                           ; 5976   0000
L_5977:
        PULR    R7                              ; 5977   02B7

L_5978:
        PSHR    R5                              ; 5978   0275
        MVII    #$00FF, R0                      ; 5979   02B8 00FF
        MVO     R0,     G_0146                  ; 597B   0240 0146
        MVII    #$0002, R0                      ; 597D   02B8 0002
        MVO     R0,     G_0147                  ; 597F   0240 0147
        SDBD                                    ; 5981   0001
        MVII    #$5962, R5                      ; 5982   02BD 0062 0059
        J       X_PLAY_MUS3                     ; 5985   0004 0318 0395

L_5988:
        PSHR    R5                              ; 5988   0275
        MVII    #$0006, R0                      ; 5989   02B8 0006

        JSR     R5,     X_RAND2                 ; 598B   0004 0114 029E

        CMPI    #$0002, R0                      ; 598E   0378 0002
        BGT     L_5977                          ; 5990   022E 001A

        SDBD                                    ; 5992   0001
        MVII    #$5998, R1                      ; 5993   02B9 0098 0059
        ADDR    R0,     R1                      ; 5996   00C1
        ADD@    R1,     R7                      ; 5997   02CF

        DIS                                     ; 5998   0003
        NEGR    R6                              ; 5999   0026
        RSWD    R2                              ; 599A   003A

        JSR     R5,     X_PLAY_SFX2             ; 599B   0004 0118 03BE
        DECLE   $0001                           ; 599E  SFX prio
        DECLE   $002F                           ; 599F  SFX data
        DECLE   $0389                           ; 59A0  SFX data
        DECLE   $0240,  $0080                   ; 59A1  SFX data
        DECLE   $0248,  $0088                   ; 59A3  SFX data
        DECLE   $0244,  $0090                   ; 59A5  SFX data
        DECLE   $011B                           ; 59A7  SFX data
        DECLE   $0001,  $0007                   ; 59A8  SFX data
        DECLE   $004E                           ; 59AA  SFX data
        DECLE   $031D                           ; 59AB  SFX data
        DECLE   $0077,  $00F7,  $0059           ; 59AC  SFX data
        DECLE   $002B                           ; 59AF  SFX data
        DECLE   $0389                           ; 59B0  SFX data
        DECLE   $0023,  $03E4                   ; 59B1  SFX data
        DECLE   $03DE                           ; 59B3  SFX data
        DECLE   $004F,  $000C                   ; 59B4  SFX data
        DECLE   $0077,  $00F7,  $0059           ; 59B6  SFX data
        DECLE   $002B                           ; 59B9  SFX data
        DECLE   $0389                           ; 59BA  SFX data
        DECLE   $0023,  $03E4                   ; 59BB  SFX data
        DECLE   $02CF                           ; 59BD  SFX end


        JSR     R5,     X_PLAY_SFX2             ; 59BE   0004 0118 03BE
        DECLE   $0001                           ; 59C1  SFX prio
        DECLE   $002F                           ; 59C2  SFX data
        DECLE   $0389                           ; 59C3  SFX data
        DECLE   $0240,  $0038                   ; 59C4  SFX data
        DECLE   $0248,  $003D                   ; 59C6  SFX data
        DECLE   $0244,  $0028                   ; 59C8  SFX data
        DECLE   $015B                           ; 59CA  SFX data
        DECLE   $0031,  $0007                   ; 59CB  SFX data
        DECLE   $004E                           ; 59CD  SFX data
        DECLE   $026B                           ; 59CE  SFX data
        DECLE   $03CE                           ; 59CF  SFX data
        DECLE   $036B                           ; 59D0  SFX data
        DECLE   $02CF                           ; 59D1  SFX end


        JSR     R5,     X_PLAY_SFX2             ; 59D2   0004 0118 03BE
        DECLE   $0001                           ; 59D5  SFX prio
        DECLE   $002F                           ; 59D6  SFX data
        DECLE   $0240,  $02C0                   ; 59D7  SFX data
        DECLE   $0248,  $02F0                   ; 59D9  SFX data
        DECLE   $0244,  $0320                   ; 59DB  SFX data
        DECLE   $025B                           ; 59DD  SFX data
        DECLE   $0001,  $03D3                   ; 59DE  SFX data
        DECLE   $004E                           ; 59E0  SFX data
        DECLE   $031D                           ; 59E1  SFX data
        DECLE   $0077,  $00F7,  $0059           ; 59E2  SFX data
        DECLE   $002B                           ; 59E5  SFX data
        DECLE   $0309                           ; 59E6  SFX data
        DECLE   $0023,  $03E4                   ; 59E7  SFX data
        DECLE   $03FE                           ; 59E9  SFX data
        DECLE   $0001,  $0043                   ; 59EA  SFX data
        DECLE   $017B                           ; 59EC  SFX data
        DECLE   $004F,  $0020                   ; 59ED  SFX data
        DECLE   $0077,  $00F7,  $0059           ; 59EF  SFX data
        DECLE   $002B                           ; 59F2  SFX data
        DECLE   $0309                           ; 59F3  SFX data
        DECLE   $0023,  $03E4                   ; 59F4  SFX data
        DECLE   $02CF                           ; 59F6  SFX end

UC_59F7:
        MVII    #$003F, R0                      ; 59F7  SLIB UCALL target
        ADDI    #$0008, R3                      ; 59F9   02FB 0008
        MVO@    R0,     R3                      ; 59FB   0258
        PULR    R7                              ; 59FC   02B7

L_59FD:
        MVII    #$0004, R0                      ; 59FD   02B8 0004
        INCR    R7                              ; 59FF   000F

L_5A00:
        CLRR    R0                              ; 5A00   01C0
L_5A01:
        INCR    R0                              ; 5A01   0008
        PSHR    R5                              ; 5A02   0275

        JSR     R5,     X_PLAY_SFX1             ; 5A03   0004 0118 03BB
        DECLE   $0077,  $0023,  $005A           ; 5A06  SFX data
        DECLE   $0189                           ; 5A09  SFX data
        DECLE   $004D                           ; 5A0A  SFX data
        DECLE   $002C,  $0000                   ; 5A0B  SFX data
        DECLE   $019D                           ; 5A0D  SFX data
        DECLE   $0050,  $02A4                   ; 5A0E  SFX data
        DECLE   $0044,  $03C8                   ; 5A10  SFX data
        DECLE   $0048,  $03D0                   ; 5A12  SFX data
        DECLE   $000B                           ; 5A14  SFX data
        DECLE   $00EB                           ; 5A15  SFX data
        DECLE   $0050,  $00C0                   ; 5A16  SFX data
        DECLE   $0054,  $00C8                   ; 5A18  SFX data
        DECLE   $0058,  $00D0                   ; 5A1A  SFX data
        DECLE   $000B                           ; 5A1C  SFX data
        DECLE   $006B                           ; 5A1D  SFX data
        DECLE   $000B                           ; 5A1E  SFX data
        DECLE   $0043,  $03B4                   ; 5A1F  SFX data
        DECLE   $03F9                           ; 5A21  SFX data
        DECLE   $02CF                           ; 5A22  SFX end

UC_5A23:
        MVI     G_0159, R0                      ; 5A23  SLIB UCALL target
        MVO     R0,     G_0147                  ; 5A25   0240 0147
        PULR    R7                              ; 5A27   02B7

L_5A28:
        PSHR    R5                              ; 5A28   0275

        JSR     R5,     X_PLAY_SFX1             ; 5A29   0004 0118 03BB
        DECLE   $032F                           ; 5A2C  SFX data
        DECLE   $0079                           ; 5A2D  SFX data
        DECLE   $0235                           ; 5A2E  SFX data
        DECLE   $013E                           ; 5A2F  SFX data
        DECLE   $00AD                           ; 5A30  SFX data
        DECLE   $006B                           ; 5A31  SFX data
        DECLE   $02DE                           ; 5A32  SFX data
        DECLE   $02AD                           ; 5A33  SFX data
        DECLE   $00AB                           ; 5A34  SFX data
        DECLE   $006E                           ; 5A35  SFX data
        DECLE   $000F,  $03FC                   ; 5A36  SFX data
        DECLE   $026B                           ; 5A38  SFX data
        DECLE   $038E                           ; 5A39  SFX data
        DECLE   $026B                           ; 5A3A  SFX data
        DECLE   $03F9                           ; 5A3B  SFX data
        DECLE   $02CF                           ; 5A3C  SFX end

L_5A3D:
        PSHR    R1                              ; 5A3D   0271
        MVI     G_016E, R1                      ; 5A3E   0281 016E
        ADDI    #$0181, R1                      ; 5A40   02F9 0181
        MVI@    R1,     R2                      ; 5A42   028A
        PULR    R1                              ; 5A43   02B1
L_5A44:
        PSHR    R1                              ; 5A44   0271
        MVI     G_016E, R1                      ; 5A45   0281 016E
        ADDI    #$0181, R1                      ; 5A47   02F9 0181
        MVO@    R2,     R1                      ; 5A49   024A
        PULR    R1                              ; 5A4A   02B1
        MOVR    R5,     R7                      ; 5A4B   00AF

L_5A4C:
        MVII    #$02A0, R4                      ; 5A4C   02BC 02A0
        TSTR    R1                              ; 5A4E   0089
        BEQ     L_5A53                          ; 5A4F   0204 0002

        ADDI    #$000F, R4                      ; 5A51   02FC 000F
L_5A53:
        MOVR    R5,     R7                      ; 5A53   00AF

L_5A54:
        PSHR    R5                              ; 5A54   0275
        CLRR    R1                              ; 5A55   01C9

        JSR     R5,     L_5A99                  ; 5A56   0004 0158 0299

        MVII    #$0001, R1                      ; 5A59   02B9 0001
        MVI     G_016D, R0                      ; 5A5B   0280 016D
        CMPR    R1,     R0                      ; 5A5D   0148
        BNEQ    L_5A64                          ; 5A5E   020C 0004
        PULR    R7                              ; 5A60   02B7

        PSHR    R5                              ; 5A61   0275
        MVI     G_016E, R1                      ; 5A62   0281 016E
L_5A64:
        MVII    #$0200, R4                      ; 5A64   02BC 0200
        MVII    #$0007, R3                      ; 5A66   02BB 0007
        TSTR    R1                              ; 5A68   0089
        BEQ     L_5A71                          ; 5A69   0204 0006

        ADDI    #$000E, R4                      ; 5A6B   02FC 000E
        SDBD                                    ; 5A6D   0001
        XORI    #$2000, R3                      ; 5A6E   03FB 0000 0020
L_5A71:
        PSHR    R1                              ; 5A71   0271
        ADDI    #$0179, R1                      ; 5A72   02F9 0179
        MVI@    R1,     R0                      ; 5A74   0288
        CMPI    #$0063, R0                      ; 5A75   0378 0063
        BLE     L_5A7B                          ; 5A77   0206 0002

        MVII    #$0063, R0                      ; 5A79   02B8 0063
L_5A7B:
        MVII    #$0002, R1                      ; 5A7B   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 5A7D   0004 0118 00C5

        MVII    #$0007, R3                      ; 5A80   02BB 0007
        ADDI    #$0002, R4                      ; 5A82   02FC 0002

        JSR     R5,     X_PRINT_R5              ; 5A84   0004 0118 007B
        STRING  "/"                             ; 5A87   002F
        DECLE   $0000                           ; 5A88   0000

        PULR    R1                              ; 5A89   02B1
        ADDI    #$0175, R1                      ; 5A8A   02F9 0175
        MVI@    R1,     R0                      ; 5A8C   0288
        CMPI    #$0063, R0                      ; 5A8D   0378 0063
        BLE     L_5A93                          ; 5A8F   0206 0002

        MVII    #$0063, R0                      ; 5A91   02B8 0063
L_5A93:
        MVII    #$0002, R1                      ; 5A93   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 5A95   0004 0118 00C5

        PULR    R7                              ; 5A98   02B7

L_5A99:
        PSHR    R5                              ; 5A99   0275
        B       L_5A64                          ; 5A9A   0220 0037

L_5A9C:
        PSHR    R5                              ; 5A9C   0275
        PSHR    R0                              ; 5A9D   0270
        SDBD                                    ; 5A9E   0001
        MVII    #$5089, R1                      ; 5A9F   02B9 0089 0050

        JSR     R5,     X_INIT_MOB              ; 5AA2   0004 0114 02B2

        SDBD                                    ; 5AA5   0001
        MVII    #$10C0, R0                      ; 5AA6   02B8 00C0 0010
        XOR@    R6,     R0                      ; 5AA9   03F0
        PSHR    R0                              ; 5AAA   0270
        MVO@    R0,     R2                      ; 5AAB   0250
        ADDI    #$0002, R2                      ; 5AAC   02FA 0002
        MVO@    R4,     R2                      ; 5AAE   0254
        ADDI    #$0006, R2                      ; 5AAF   02FA 0006

        JSR     R5,     X_INIT_MOB              ; 5AB1   0004 0114 02B2

        MOVR    R2,     R1                      ; 5AB4   0091

        JSR     R5,     .EXEC.766               ; 5AB5   0004 0114 0366
        JSR     R5,     .EXEC.6CF               ; 5AB8   0004 0114 02CF

        PULR    R0                              ; 5ABB   02B0
        XORI    #$0200, R0                      ; 5ABC   03F8 0200
        MVO@    R0,     R2                      ; 5ABE   0250
        ADDI    #$0004, R2                      ; 5ABF   02FA 0004
        SDBD                                    ; 5AC1   0001
        MVII    #$0800, R0                      ; 5AC2   02B8 0000 0008
        MVO@    R0,     R2                      ; 5AC5   0250
        ADDI    #$0001, R2                      ; 5AC6   02FA 0001
        MVII    #$03F3, R0                      ; 5AC8   02B8 03F3
        MVO@    R0,     R2                      ; 5ACA   0250
        PULR    R7                              ; 5ACB   02B7

L_5ACC:
        PSHR    R5                              ; 5ACC   0275
        MVII    #$0003, R3                      ; 5ACD   02BB 0003
        MVII    #$0008, R0                      ; 5ACF   02B8 0008

        JSR     R5,     L_5A3D                  ; 5AD1   0004 0158 023D

        ANDI    #$0001, R2                      ; 5AD4   03BA 0001
        BEQ     L_5ADA                          ; 5AD6   0204 0002

        MOVR    R3,     R0                      ; 5AD8   0098
        CLRR    R3                              ; 5AD9   01DB

L_5ADA:
        JSR     R5,     X_RAND2                 ; 5ADA   0004 0114 029E

        ADDR    R0,     R3                      ; 5ADD   00C3
        MOVR    R3,     R0                      ; 5ADE   0098
        SDBD                                    ; 5ADF   0001
        ADDI    #$50C3, R3                      ; 5AE0   02FB 00C3 0050
        PULR    R7                              ; 5AE3   02B7

L_5AE4:
        PSHR    R5                              ; 5AE4   0275
        PSHR    R1                              ; 5AE5   0271

        JSR     R5,     X_UNPK_BYTES            ; 5AE6   0004 0114 0357

        PSHR    R1                              ; 5AE9   0271
        PSHR    R0                              ; 5AEA   0270
        MOVR    R4,     R2                      ; 5AEB   00A2
        SDBD                                    ; 5AEC   0001
        MVII    #$50D9, R1                      ; 5AED   02B9 00D9 0050

        JSR     R5,     X_INIT_MOB              ; 5AF0   0004 0114 02B2

        MOVR    R3,     R1                      ; 5AF3   0099
        ADDI    #$000B, R1                      ; 5AF4   02F9 000B
        MVI@    R1,     R0                      ; 5AF6   0288
        SDBD                                    ; 5AF7   0001
        XORI    #$30C0, R0                      ; 5AF8   03F8 00C0 0030
        MVO@    R0,     R4                      ; 5AFB   0260
        SDBD                                    ; 5AFC   0001
        MVII    #$0183, R5                      ; 5AFD   02BD 0083 0001
        MVI     G_016E, R0                      ; 5B00   0280 016E
        TSTR    R0                              ; 5B02   0080
        BEQ     L_5B07                          ; 5B03   0204 0002

        ADDI    #$000E, R5                      ; 5B05   02FD 000E
L_5B07:
        MVO@    R5,     R4                      ; 5B07   0265
        ADDI    #$0002, R5                      ; 5B08   02FD 0002
        SDBD                                    ; 5B0A   0001
        MVII    #$5323, R0                      ; 5B0B   02B8 0023 0053
        MVO@    R0,     R5                      ; 5B0E   0268
        SWAP    R0,     1                       ; 5B0F   0040
        MVO@    R0,     R5                      ; 5B10   0268
        MVII    #$0001, R0                      ; 5B11   02B8 0001
        MVO@    R0,     R5                      ; 5B13   0268
        MVI@    R3,     R0                      ; 5B14   0298
        MVO@    R0,     R5                      ; 5B15   0268
        PULR    R0                              ; 5B16   02B0
        SWAP    R0,     1                       ; 5B17   0040
        MVO@    R0,     R4                      ; 5B18   0260
        PULR    R1                              ; 5B19   02B1
        SWAP    R1,     1                       ; 5B1A   0041
        MVO@    R1,     R4                      ; 5B1B   0261
        MVII    #$0025, R5                      ; 5B1C   02BD 0025
        ADDI    #$0002, R4                      ; 5B1E   02FC 0002
        MVO@    R5,     R4                      ; 5B20   0265
        PULR    R5                              ; 5B21   02B5
        MVO@    R5,     R4                      ; 5B22   0265
        MOVR    R4,     R2                      ; 5B23   00A2
        SDBD                                    ; 5B24   0001
        MVII    #$50D9, R1                      ; 5B25   02B9 00D9 0050

        JSR     R5,     X_INIT_MOB              ; 5B28   0004 0114 02B2

        MOVR    R2,     R1                      ; 5B2B   0091

        JSR     R5,     .EXEC.766               ; 5B2C   0004 0114 0366
        JSR     R5,     .EXEC.6CF               ; 5B2F   0004 0114 02CF

        SUBI    #$0008, R2                      ; 5B32   033A 0008
        MVI@    R2,     R2                      ; 5B34   0292
        MVI     G_016E, R0                      ; 5B35   0280 016E
        SDBD                                    ; 5B37   0001
        MVII    #$018A, R5                      ; 5B38   02BD 008A 0001
        TSTR    R0                              ; 5B3B   0080
        BEQ     L_5B40                          ; 5B3C   0204 0002

        ADDI    #$000E, R5                      ; 5B3E   02FD 000E
L_5B40:
        MVO@    R2,     R4                      ; 5B40   0262
        MVO@    R5,     R4                      ; 5B41   0265
        ADDI    #$0004, R5                      ; 5B42   02FD 0004
        MVII    #$0001, R0                      ; 5B44   02B8 0001
        MVO@    R0,     R5                      ; 5B46   0268
        MVI@    R3,     R0                      ; 5B47   0298
        ADDI    #$0002, R0                      ; 5B48   02F8 0002
        MVO@    R0,     R5                      ; 5B4A   0268
        ADDI    #$0002, R4                      ; 5B4B   02FC 0002
        SDBD                                    ; 5B4D   0001
        MVII    #$1000, R0                      ; 5B4E   02B8 0000 0010
        MVO@    R0,     R4                      ; 5B51   0260
        PULR    R7                              ; 5B52   02B7

L_5B53:
        PSHR    R5                              ; 5B53   0275
        MVII    #$0334, R1                      ; 5B54   02B9 0334
        MVI     G_016E, R0                      ; 5B56   0280 016E
        TSTR    R0                              ; 5B58   0080
        BEQ     L_5B5D                          ; 5B59   0204 0002

        ADDI    #$0020, R1                      ; 5B5B   02F9 0020
L_5B5D:
        MVI@    R1,     R0                      ; 5B5D   0288
        CMPI    #$0003, R0                      ; 5B5E   0378 0003
        BGE     L_5BBC                          ; 5B60   020D 005A

        SUBI    #$0007, R1                      ; 5B62   0339 0007
        MVI@    R1,     R0                      ; 5B64   0288
        XORI    #$0020, R0                      ; 5B65   03F8 0020
        MVO@    R0,     R1                      ; 5B67   0248
        ADDI    #$0008, R1                      ; 5B68   02F9 0008
        MVO@    R0,     R1                      ; 5B6A   0248
        SUBI    #$0007, R1                      ; 5B6B   0339 0007
        MVI@    R1,     R5                      ; 5B6D   028D
        ADDI    #$0002, R5                      ; 5B6E   02FD 0002
        SDBD                                    ; 5B70   0001
        MVII    #$5B9B, R3                      ; 5B71   02BB 009B 005B
        MVO@    R3,     R5                      ; 5B74   026B
        SWAP    R3,     1                       ; 5B75   0043
        MVO@    R3,     R5                      ; 5B76   026B
        ADDI    #$0003, R1                      ; 5B77   02F9 0003
        PSHR    R1                              ; 5B79   0271
        CLRR    R0                              ; 5B7A   01C0
        MVII    #$000A, R1                      ; 5B7B   02B9 000A

        JSR     R5,     X_PACK_BYTES            ; 5B7D   0004 0114 034F

        PULR    R1                              ; 5B80   02B1
        MVO@    R0,     R1                      ; 5B81   0248
        SDBD                                    ; 5B82   0001
        SUBI    #$FFFE, R1                      ; 5B83   0339 00FE 00FF
L_5B86:
        MVI     G_016E, R4                      ; 5B86   0284 016E
        ADDR    R4,     R4                      ; 5B88   00E4
        ADDI    #$017D, R4                      ; 5B89   02FC 017D
        MVII    #$0028, R0                      ; 5B8B   02B8 0028
        MVO@    R0,     R1                      ; 5B8D   0248
        PULR    R3                              ; 5B8E   02B3
        MVO@    R3,     R4                      ; 5B8F   0263
        SWAP    R3,     1                       ; 5B90   0043
        MVO@    R3,     R4                      ; 5B91   0263

        JSR     R5,     L_5A3D                  ; 5B92   0004 0158 023D

        XORI    #$0020, R2                      ; 5B95   03FA 0020

        JSR     R5,     L_5A44                  ; 5B97   0004 0158 0244

        PULR    R7                              ; 5B9A   02B7

        PSHR    R5                              ; 5B9B   0275
        CLRR    R3                              ; 5B9C   01DB
        CMPI    #$032D, R1                      ; 5B9D   0379 032D
        BEQ     L_5BA2                          ; 5B9F   0204 0001

        INCR    R3                              ; 5BA1   000B
L_5BA2:
        MVO     R3,     G_016E                  ; 5BA2   0243 016E

        JSR     R5,     .EXEC.7AE               ; 5BA4   0004 0114 03AE

        ADDI    #$0008, R1                      ; 5BA7   02F9 0008

        JSR     R5,     .EXEC.7AE               ; 5BA9   0004 0114 03AE
        JSR     R5,     L_5A3D                  ; 5BAC   0004 0158 023D

        SDBD                                    ; 5BAF   0001
        ANDI    #$FFDF, R2                      ; 5BB0   03BA 00DF 00FF
        MOVR    R3,     R4                      ; 5BB3   009C
        ADDR    R4,     R4                      ; 5BB4   00E4
        ADDI    #$017D, R4                      ; 5BB5   02FC 017D
        SDBD                                    ; 5BB7   0001
        MVI@    R4,     R5                      ; 5BB8   02A5
        J       L_5A44                          ; 5BB9   0004 0358 0244

L_5BBC:
        MVII    #$032D, R1                      ; 5BBC   02B9 032D
        MVI     G_016E, R0                      ; 5BBE   0280 016E
        TSTR    R0                              ; 5BC0   0080
        BEQ     L_5BC5                          ; 5BC1   0204 0002

        ADDI    #$0020, R1                      ; 5BC3   02F9 0020

L_5BC5:
        JSR     R5,     L_5A3D                  ; 5BC5   0004 0158 023D

        ANDI    #$0002, R2                      ; 5BC8   03BA 0002
        BNEQ    L_5BD6                          ; 5BCA   020C 000A

        MVII    #$003C, R0                      ; 5BCC   02B8 003C
        MVI     G_016E, R3                      ; 5BCE   0283 016E
        TSTR    R3                              ; 5BD0   009B
        BNEQ    L_5BD7                          ; 5BD1   020C 0004

        NEGR    R0                              ; 5BD3   0020
        B       L_5BD7                          ; 5BD4   0200 0001

L_5BD6:
        CLRR    R0                              ; 5BD6   01C0
L_5BD7:
        PSHR    R1                              ; 5BD7   0271
        MOVR    R1,     R3                      ; 5BD8   008B
        MVII    #$0020, R1                      ; 5BD9   02B9 0020
        XOR@    R3,     R1                      ; 5BDB   03D9
        MVO@    R1,     R3                      ; 5BDC   0259
        ADDI    #$0008, R3                      ; 5BDD   02FB 0008
        MVO@    R1,     R3                      ; 5BDF   0259
        MVII    #$0028, R1                      ; 5BE0   02B9 0028
        NEGR    R1                              ; 5BE2   0021
        SUBI    #$0004, R3                      ; 5BE3   033B 0004

        JSR     R5,     X_PACK_BYTES            ; 5BE5   0004 0114 034F

        MVO@    R0,     R3                      ; 5BE8   0258
        PULR    R1                              ; 5BE9   02B1
        INCR    R1                              ; 5BEA   0009
        MVI@    R1,     R5                      ; 5BEB   028D
        DECR    R1                              ; 5BEC   0011
        ADDI    #$0002, R5                      ; 5BED   02FD 0002
        SDBD                                    ; 5BEF   0001
        MVII    #$5B9B, R3                      ; 5BF0   02BB 009B 005B
        MVO@    R3,     R5                      ; 5BF3   026B
        SWAP    R3,     1                       ; 5BF4   0043
        MVO@    R3,     R5                      ; 5BF5   026B
        ADDI    #$0006, R1                      ; 5BF6   02F9 0006
        B       L_5B86                          ; 5BF8   0220 0073

L_5BFA:
        MVII    #$0322, R1                      ; 5BFA   02B9 0322
        MVI     G_016E, R0                      ; 5BFC   0280 016E
        TSTR    R0                              ; 5BFE   0080
        BEQ     L_5C03                          ; 5BFF   0204 0002

        ADDI    #$0020, R1                      ; 5C01   02F9 0020
L_5C03:
        MVII    #$03F0, R0                      ; 5C03   02B8 03F0
        MVO@    R0,     R1                      ; 5C05   0248
        ADDI    #$0008, R1                      ; 5C06   02F9 0008
        MVII    #$03F3, R0                      ; 5C08   02B8 03F3
        MVO@    R0,     R1                      ; 5C0A   0248
        MOVR    R5,     R7                      ; 5C0B   00AF

L_5C0C:
        MVO     R0,     G_016E                  ; 5C0C   0240 016E
        SDBD                                    ; 5C0E   0001
        MVII    #$507F, R0                      ; 5C0F   02B8 007F 0050
        MVO     R0,     G_035D                  ; 5C12   0240 035D
        MOVR    R5,     R0                      ; 5C14   00A8
        MVII    #$017D, R5                      ; 5C15   02BD 017D
        MVO@    R0,     R5                      ; 5C17   0268
        SWAP    R0,     1                       ; 5C18   0040
        MVO@    R0,     R5                      ; 5C19   0268
L_5C1A:
        MVII    #$02FF, R0                      ; 5C1A   02B8 02FF
        MVO     R0,     .BTAB.6C                ; 5C1C   0240 026C
        CLRR    R0                              ; 5C1E   01C0
        MVO     R0,     G_019F                  ; 5C1F   0240 019F
L_5C21:
        PULR    R7                              ; 5C21   02B7

        PSHR    R5                              ; 5C22   0275
        CMP     G_016E, R1                      ; 5C23   0341 016E
        BNEQ    L_5C21                          ; 5C25   022C 0005

        TSTR    R0                              ; 5C27   0080
        BEQ     L_5C21                          ; 5C28   0224 0008

        CMPI    #$000A, R0                      ; 5C2A   0378 000A
        BEQ     L_5C1A                          ; 5C2C   0224 0013

        MVI     G_019F, R3                      ; 5C2E   0283 019F
        TSTR    R3                              ; 5C30   009B
        BNEQ    L_5C4B                          ; 5C31   020C 0018

        DECR    R0                              ; 5C33   0010
        SDBD                                    ; 5C34   0001
        CMPI    #$0004, R0                      ; 5C35   0378 0004 0000
        BGT     L_5C21                          ; 5C38   022E 0018

        MVO     R0,     G_01A0                  ; 5C3A   0240 01A0
        MOVR    R0,     R1                      ; 5C3C   0081
        SDBD                                    ; 5C3D   0001
        ADDI    #$5C80, R1                      ; 5C3E   02F9 0080 005C
        MVI@    R1,     R0                      ; 5C41   0288
        XORI    #$02F8, R0                      ; 5C42   03F8 02F8
        MVO     R0,     .BTAB.6C                ; 5C44   0240 026C
        MVII    #$0001, R0                      ; 5C46   02B8 0001
        MVO     R0,     G_019F                  ; 5C48   0240 019F
        PULR    R7                              ; 5C4A   02B7

L_5C4B:
        DECR    R3                              ; 5C4B   0013
        BNEQ    L_5C75                          ; 5C4C   020C 0027

        MVI     G_01A0, R1                      ; 5C4E   0281 01A0
        SDBD                                    ; 5C50   0001
        ADDI    #$5C8A, R1                      ; 5C51   02F9 008A 005C
        CMP@    R1,     R0                      ; 5C54   0348
        BGT     L_5C21                          ; 5C55   022E 0035

        PSHR    R0                              ; 5C57   0270
        SDBD                                    ; 5C58   0001
        SUBI    #$0005, R1                      ; 5C59   0339 0005 0000
        ADD@    R1,     R0                      ; 5C5C   02C8
        MVO     R0,     G_01A0                  ; 5C5D   0240 01A0
        MVII    #$0002, R0                      ; 5C5F   02B8 0002
        MVO     R0,     G_019F                  ; 5C61   0240 019F
        PULR    R0                              ; 5C63   02B0
        SDBD                                    ; 5C64   0001
        SUBI    #$0005, R1                      ; 5C65   0339 0005 0000
        MVI@    R1,     R3                      ; 5C68   028B
        MVII    #$0000, R1                      ; 5C69   02B9 0000
        MVO     R1,     .BTAB.6C                ; 5C6B   0241 026C
        MVII    #$026C, R4                      ; 5C6D   02BC 026C
        MVII    #$0001, R1                      ; 5C6F   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 5C71   0004 0118 00C5

        PULR    R7                              ; 5C74   02B7

L_5C75:
        CMPI    #$000B, R0                      ; 5C75   0378 000B
        BNEQ    L_5C21                          ; 5C77   022C 0057

        MVI     G_01A0, R0                      ; 5C79   0280 01A0
        DECR    R0                              ; 5C7B   0010
        MVII    #$017D, R5                      ; 5C7C   02BD 017D
        SDBD                                    ; 5C7E   0001
        MVI@    R5,     R7                      ; 5C7F   02AF

        DECLE   $0000,  $0001,  $0006,  $0003   ; 5C80   0000 0001 0006 0003
        DECLE   $0002,  $0000,  $0004,  $0008   ; 5C84   0002 0000 0004 0008
        DECLE   $000C,  $0010,  $0004,  $0004   ; 5C88   000C 0010 0004 0004
        DECLE   $0004,  $0004,  $0002,  $0001   ; 5C8C   0004 0004 0002 0001

        DIS                                     ; 5C90   0003
        CLRC                                    ; 5C91   0006

        JSRD    R4,     .EXEC.C3F               ; 5C92   0004 001E 003F
        DECLE   $007F,  $00FF,  $0077,  $0007   ; 5C95   007F 00FF 0077 0007
        DECLE   $003F,  $007E,  $0006,  $0000   ; 5C99   003F 007E 0006 0000
        DECLE   $0000,  $0000,  $0001,  $0003   ; 5C9D   0000 0000 0001 0003
        DECLE   $0006,  $0004,  $003E,  $007F   ; 5CA1   0006 0004 003E 007F
        DECLE   $00FF,  $00FB,  $0003,  $001F   ; 5CA5   00FF 00FB 0003 001F
        DECLE   $003F,  $003E,  $001C,  $000C   ; 5CA9   003F 003E 001C 000C
        DECLE   $0000,  $0000,  $0001,  $0003   ; 5CAD   0000 0000 0001 0003
        DECLE   $0006,  $001C,  $003E,  $0077   ; 5CB1   0006 001C 003E 0077
        DECLE   $00F7                           ; 5CB5   00F7

        ADDR    R4,     R7                      ; 5CB6   00E7

        ADDR    R4,     R3                      ; 5CB7   00E3
        ADDR    R5,     R7                      ; 5CB8   00EF
        ADDR    R1,     R7                      ; 5CB9   00CF

        DECLE   $003C,  $003C,  $001C,  $0000   ; 5CBA   003C 003C 001C 0000
        DECLE   $0000,  $0001                   ; 5CBE   0000 0001

        DIS                                     ; 5CC0   0003
        RSWD    R6                              ; 5CC1   003E
        SARC    R0,     2                       ; 5CC2   007C
        ADDR    R7,     R6                      ; 5CC3   00FE
        ADDR    R1,     R7                      ; 5CC4   00CF
        ADDR    R4,     R7                      ; 5CC5   00E7

        DECLE   $0003,  $006F,  $007F,  $007F   ; 5CC6   0003 006F 007F 007F
        DECLE   $0038,  $0000,  $0000,  $0000   ; 5CCA   0038 0000 0000 0000
        DECLE   $0000                           ; 5CCE   0000

        SLR     R1,     1                       ; 5CCF   0061
        ADDR    R6,     R3                      ; 5CD0   00F3
        ADDR    R7,     R6                      ; 5CD1   00FE
        ADDR    R7,     R4                      ; 5CD2   00FC
        ADDR    R7,     R6                      ; 5CD3   00FE
        ADDR    R3,     R7                      ; 5CD4   00DF
        ADDR    R5,     R7                      ; 5CD5   00EF
        ADDR    R4,     R7                      ; 5CD6   00E7

        DECLE   $0007,  $0007,  $0007,  $0006   ; 5CD7   0007 0007 0007 0006
        DECLE   $0036,  $003E,  $003C,  $001C   ; 5CDB   0036 003E 003C 001C
        DECLE   $0001                           ; 5CDF   0001

        SETC                                    ; 5CE0   0007
        CLRC                                    ; 5CE1   0006
        ADDR    R7,     R4                      ; 5CE2   00FC
        ADDR    R7,     R6                      ; 5CE3   00FE
        ADDR    R1,     R7                      ; 5CE4   00CF
        ADDR    R4,     R7                      ; 5CE5   00E7
        ADDR    R4,     R7                      ; 5CE6   00E7

        SETC                                    ; 5CE7   0007
        SETC                                    ; 5CE8   0007
        SETC                                    ; 5CE9   0007
        INCR    R6                              ; 5CEA   000E
        INCR    R4                              ; 5CEB   000C
        INCR    R6                              ; 5CEC   000E
        SETC                                    ; 5CED   0007
        INCR    R7                              ; 5CEE   000F

        DECLE   $0001                           ; 5CEF   0001
L_5CF0:
        DIS                                     ; 5CF0   0003
        DECLE   $0006,  $001C,  $00FE,  $00F7   ; 5CF1   0006 001C 00FE 00F7
        DECLE   $007F,  $001F                   ; 5CF5   007F 001F

        INCR    R7                              ; 5CF7   000F

        SETC                                    ; 5CF8   0007
L_5CF9:
        SETC                                    ; 5CF9   0007
        DECLE   $0006,  $0007,  $0003,  $000F   ; 5CFA   0006 0007 0003 000F
        DECLE   $000E,  $0001,  $0003,  $0006   ; 5CFE   000E 0001 0003 0006
        DECLE   $0004,  $003E,  $0077,  $00FF   ; 5D02   0004 003E 0077 00FF
        DECLE   $00FF,  $0003,  $001F,  $003F   ; 5D06   00FF 0003 001F 003F
        DECLE   $001F,  $0007,  $0007,  $0003   ; 5D0A   001F 0007 0007 0003
        DECLE   $0000,  $0001,  $0003,  $003A   ; 5D0E   0000 0001 0003 003A
        DECLE   $007C,  $00FE,  $00FF           ; 5D12   007C 00FE 00FF

        ADDR    R5,     R7                      ; 5D15   00EF
        ADDR    R4,     R7                      ; 5D16   00E7
        ADDR    R4,     R7                      ; 5D17   00E7
        ADDR    R0,     R7                      ; 5D18   00C7

        DECLE   $0053,  $0073,  $0006,  $0004   ; 5D19   0053 0073 0006 0004
        DECLE   $0002,  $000E,  $0038,  $003C   ; 5D1D   0002 000E 0038 003C
        DECLE   $005F,  $00FF,  $00FF,  $00BF   ; 5D21   005F 00FF 00FF 00BF
        DECLE   $007F,  $003F,  $003F,  $001E   ; 5D25   007F 003F 003F 001E
        DECLE   $000C,  $006C,  $0048,  $0048   ; 5D29   000C 006C 0048 0048
        DECLE   $0018,  $0018,  $0000,  $0000   ; 5D2D   0018 0018 0000 0000
        DECLE   $0006,  $00F9,  $00F9,  $00F9   ; 5D31   0006 00F9 00F9 00F9
        DECLE   $00F9,  $00F9,  $0039,  $0039   ; 5D35   00F9 00F9 0039 0039
        DECLE   $0059,  $004D,  $004D,  $0044   ; 5D39   0059 004D 004D 0044
        DECLE   $008C,  $0088,  $0000,  $0000   ; 5D3D   008C 0088 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; 5D45   0000 0000 0000 0004
        DECLE   $0033,  $007E,  $007F,  $00FF   ; 5D49   0033 007E 007F 00FF
        DECLE   $00FF,  $00FF,  $0000,  $0000   ; 5D4D   00FF 00FF 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00E0   ; 5D55   0000 0000 0000 00E0
        DECLE   $00F0,  $00F0,  $00A0,  $0000   ; 5D59   00F0 00F0 00A0 0000
        DECLE   $0020,  $00F0,  $0000           ; 5D5D   0020 00F0 0000

        SETC                                    ; 5D60   0007
        INCR    R7                              ; 5D61   000F
        ADDR    R3,     R7                      ; 5D62   00DF
L_5D63:
        MOVR    R3,     R7                      ; 5D63   009F

        DECLE   $00BF,  $00BF,  $00FF,  $00FB   ; 5D64   00BF 00BF 00FF 00FB
        DECLE   $00F1,  $0065,  $0065,  $0065   ; 5D68   00F1 0065 0065 0065
        DECLE   $006D,  $004B,  $000A,  $0000   ; 5D6C   006D 004B 000A 0000
        DECLE   $00FE,  $00FF,  $00FF,  $00FF   ; 5D70   00FE 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0086,  $0083   ; 5D74   00FF 00FF 0086 0083
        DECLE   $000B,  $0009,  $0009,  $0019   ; 5D78   000B 0009 0009 0019
        DECLE   $0013,  $0036,  $0024,  $0000   ; 5D7C   0013 0036 0024 0000
        DECLE   $0007,  $000F,  $001F,  $003F   ; 5D80   0007 000F 001F 003F
        DECLE   $007E,  $007F,  $007F,  $007F   ; 5D84   007E 007F 007F 007F
        DECLE   $007F,  $007F,  $007F,  $007F   ; 5D88   007F 007F 007F 007F
        DECLE   $003F                           ; 5D8C   003F

        COMR    R4                              ; 5D8D   001C
        INCR    R7                              ; 5D8E   000F

        DECLE   $0000                           ; 5D8F   0000
L_5D90:
        INCR    R1                              ; 5D90   0009
        ADDR    R1,     R7                      ; 5D91   00CF
        ADDR    R5,     R7                      ; 5D92   00EF

        DECLE   $00F6,  $00F6,  $0076,  $00B0   ; 5D93   00F6 00F6 0076 00B0
        DECLE   $00B0,  $00BC,  $007C,  $0004   ; 5D97   00B0 00BC 007C 0004
        DECLE   $00F0,  $00F0,  $0000,  $00FF   ; 5D9B   00F0 00F0 0000 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D9F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DA3   0000 0000 0000 0000
        DECLE   $000A,  $0007,  $006F,  $007D   ; 5DA7   000A 0007 006F 007D
        DECLE   $00FF,  $00FF,  $00FE,  $00FF   ; 5DAB   00FF 00FF 00FE 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DAF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DB3   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0050,  $00F0   ; 5DB7   0000 0010 0050 00F0
        DECLE   $00E0,  $00E0,  $0070,  $0020   ; 5DBB   00E0 00E0 0070 0020
        DECLE   $0003,  $000F,  $001F,  $003F   ; 5DBF   0003 000F 001F 003F
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; 5DC3   007F 00FF 00FF 00FF
        DECLE   $007F,  $003F,  $000A,  $000A   ; 5DC7   007F 003F 000A 000A
        DECLE   $000A,  $000A,  $000F,  $0005   ; 5DCB   000A 000A 000F 0005
        DECLE   $0000                           ; 5DCF   0000

        MOVR    R0,     R6                      ; 5DD0   0086
        MOVR    R0,     R7                      ; 5DD1   0087

        DECLE   $00C6,  $00CC,  $00FC,  $00F8   ; 5DD2   00C6 00CC 00FC 00F8
        DECLE   $00F8,  $00E0,  $00C0,  $0000   ; 5DD6   00F8 00E0 00C0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DDA   0000 0000 0000 0000
        DECLE   $0000,  $001F                   ; 5DDE   0000 001F

        SLR     R0,     1                       ; 5DE0   0060
        TSTR    R0                              ; 5DE1   0080
        MOVR    R1,     R6                      ; 5DE2   008E
        MOVR    R3,     R7                      ; 5DE3   009F

        DECLE   $00FF,  $003F,  $007F,  $007F   ; 5DE4   00FF 003F 007F 007F
        DECLE   $0037,  $0030,  $0064,  $0044   ; 5DE8   0037 0030 0064 0044
        DECLE   $0022,  $003B,  $0019,  $0080   ; 5DEC   0022 003B 0019 0080
        DECLE   $0000,  $0000,  $0000,  $00E0   ; 5DF0   0000 0000 0000 00E0
        DECLE   $00FA,  $00FE,  $00FF,  $00FF   ; 5DF4   00FA 00FE 00FF 00FF
        DECLE   $00FB,  $0071,  $006C,  $0046   ; 5DF8   00FB 0071 006C 0046
        DECLE   $0062,  $003A,  $001A,  $0001   ; 5DFC   0062 003A 001A 0001
        DECLE   $0067,  $007F,  $00FF,  $00FF   ; 5E00   0067 007F 00FF 00FF
        DECLE   $00BF,  $00FF,  $00FF,  $00FF   ; 5E04   00BF 00FF 00FF 00FF

        ADDR    R5,     R7                      ; 5E08   00EF
        ADDR    R1,     R7                      ; 5E09   00CF
        ADDR    R1,     R7                      ; 5E0A   00CF

        DECLE   $00CB,  $00CB,  $00EB,  $000B   ; 5E0B   00CB 00CB 00EB 000B
        DECLE   $00F0,  $00FC,  $00FE,  $00FE   ; 5E0F   00F0 00FC 00FE 00FE
        DECLE   $00FE,  $00FE,  $00FE,  $00FE   ; 5E13   00FE 00FE 00FE 00FE
        DECLE   $00FE,  $007E,  $000E,  $0036   ; 5E17   00FE 007E 000E 0036
        DECLE   $0036,  $0036,  $0036,  $0036   ; 5E1B   0036 0036 0036 0036

        DECR    R4                              ; 5E1F   0014
L_5E20:
        DECR    R7                              ; 5E20   0017

        DECLE   $0037,  $00E7,  $00FF,  $00FF   ; 5E21   0037 00E7 00FF 00FF
        DECLE   $003F,  $007B,  $0003,  $001B   ; 5E25   003F 007B 0003 001B
        DECLE   $001B,  $001B,  $001B,  $001B   ; 5E29   001B 001B 001B 001B
        DECLE   $0036,  $0036                   ; 5E2D   0036 0036

        ADDR    R7,     R4                      ; 5E2F   00FC
        ADDR    R7,     R6                      ; 5E30   00FE
        ADDR    R7,     R6                      ; 5E31   00FE
        ADDR    R7,     R6                      ; 5E32   00FE
        ADDR    R7,     R6                      ; 5E33   00FE
        ADDR    R7,     R6                      ; 5E34   00FE
        ADDR    R7,     R6                      ; 5E35   00FE
        MOVR    R1,     R7                      ; 5E36   008F
        MOVR    R1,     R7                      ; 5E37   008F

        DECLE   $0033,  $0033,  $0033,  $0033   ; 5E38   0033 0033 0033 0033
        DECLE   $0033,  $0066,  $0066,  $0000   ; 5E3C   0033 0066 0066 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000E,  $003B   ; 5E48   0000 0000 000E 003B
        DECLE   $00FF,  $00FE,  $00FF,  $0000   ; 5E4C   00FF 00FE 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E54   0000 0000 0000 0000
        DECLE   $0008,  $0038,  $00F0,  $00C0   ; 5E58   0008 0038 00F0 00C0
        DECLE   $0000                           ; 5E5C   0000

        ADCR    R0                              ; 5E5D   0028
        ADDR    R7,     R0                      ; 5E5E   00F8
        RSWD    R4                              ; 5E5F   003C
        SARC    R3,     2                       ; 5E60   007F
        ADDR    R6,     R6                      ; 5E61   00F6
        ADDR    R7,     R4                      ; 5E62   00FC
        ADDR    R5,     R6                      ; 5E63   00EE
        ADDR    R0,     R7                      ; 5E64   00C7

        ADDR    R4,     R3                      ; 5E65   00E3
        ADDR    R4,     R3                      ; 5E66   00E3
        DIS                                     ; 5E67   0003
        SETC                                    ; 5E68   0007
        INCR    R7                              ; 5E69   000F

        DECLE   $000F                           ; 5E6A   000F
L_5E6B:
        DIS                                     ; 5E6B   0003
        DECLE   $0001,  $0003,  $0000,  $0001   ; 5E6C   0001 0003 0000 0001
        DECLE   $003B,  $007E,  $007C,  $00FE   ; 5E70   003B 007E 007C 00FE
        DECLE   $00FF,  $00EF,  $00E6,  $00E1   ; 5E74   00FF 00EF 00E6 00E1
        DECLE   $0063,  $0073,  $0033,  $0007   ; 5E78   0063 0073 0033 0007
        DECLE   $0006,  $0003,  $000F,  $000F   ; 5E7C   0006 0003 000F 000F
        DECLE   $003F,  $007F,  $00F6,  $00FB   ; 5E80   003F 007F 00F6 00FB
        DECLE   $00F7,  $00EF,  $001F           ; 5E84   00F7 00EF 001F

        ADDR    R7,     R6                      ; 5E87   00FE
        ADDR    R7,     R4                      ; 5E88   00FC
        ADDR    R7,     R4                      ; 5E89   00FC
        SAR     R0,     2                       ; 5E8A   006C
        SAR     R2,     2                       ; 5E8B   006E
        ADDR    R4,     R7                      ; 5E8C   00E7

        DECLE   $00C3,  $00F0,  $0003,  $000F   ; 5E8D   00C3 00F0 0003 000F
        DECLE   $001F,  $003F,  $003F,  $007C   ; 5E91   001F 003F 003F 007C
        DECLE   $007F,  $00FE,  $00FF,  $00FF   ; 5E95   007F 00FE 00FF 00FF
        DECLE   $00FC,  $00FF,  $00FF,  $0037   ; 5E99   00FC 00FF 00FF 0037
        DECLE   $000E,  $001F,  $0000,  $0007   ; 5E9D   000E 001F 0000 0007
        DECLE   $001F,  $0038,  $0039,  $0039   ; 5EA1   001F 0038 0039 0039
        DECLE   $003F,  $003F,  $007E,  $00F8   ; 5EA5   003F 003F 007E 00F8
        DECLE   $00FE,  $007F,  $0007,  $000E   ; 5EA9   00FE 007F 0007 000E
        DECLE   $001C,  $001F,  $0000,  $0000   ; 5EAD   001C 001F 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EB1   0000 0000 0000 0000
        DECLE   $0003,  $0007,  $0007,  $0007   ; 5EB5   0003 0007 0007 0007
        DECLE   $0001,  $0003,  $0007,  $000E   ; 5EB9   0001 0003 0007 000E
        DECLE   $001C,  $000F,  $0000,  $0000   ; 5EBD   001C 000F 0000 0000
        DECLE   $0001,  $0001,  $0001,  $0001   ; 5EC1   0001 0001 0001 0001
        DECLE   $0003,  $0037,  $0077,  $00F7   ; 5EC5   0003 0037 0077 00F7
        DECLE   $00FF,  $00BE,  $001C,  $0000   ; 5EC9   00FF 00BE 001C 0000
        DECLE   $0000,  $0000,  $000C,  $001E   ; 5ECD   0000 0000 000C 001E
        DECLE   $00F3,  $0091,  $00B0,  $00BF   ; 5ED1   00F3 0091 00B0 00BF
        DECLE   $00FF,  $007F,  $007F,  $003F   ; 5ED5   00FF 007F 007F 003F
        DECLE   $000F,  $0003,  $0001,  $0000   ; 5ED9   000F 0003 0001 0000
        DECLE   $0000,  $0000,  $00C0,  $00E0   ; 5EDD   0000 0000 00C0 00E0
        DECLE   $00D8,  $00E6,  $00E3,  $00E1   ; 5EE1   00D8 00E6 00E3 00E1
        DECLE   $00E3,  $00FF,  $00FF,  $00FB   ; 5EE5   00E3 00FF 00FF 00FB
        DECLE   $00E1,  $0071,  $0033,  $001F   ; 5EE9   00E1 0071 0033 001F
        DECLE   $0003,  $0000,  $00C0,  $00E0   ; 5EED   0003 0000 00C0 00E0
        DECLE   $00D8,  $00E6,  $00E3,  $00E1   ; 5EF1   00D8 00E6 00E3 00E1
        DECLE   $00E3,  $00FF,  $0000,  $0000   ; 5EF5   00E3 00FF 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $003C,  $00FE   ; 5EFD   0000 0000 003C 00FE
        DECLE   $0067,  $003F                   ; 5F01   0067 003F

        RRC     R3,     2                       ; 5F03   0077
        ADDR    R4,     R3                      ; 5F04   00E3
        ADDR    R0,     R7                      ; 5F05   00C7
        ADDR    R0,     R7                      ; 5F06   00C7

        DECLE   $00E0,  $00F0,  $00F8,  $0018   ; 5F07   00E0 00F0 00F8 0018
        DECLE   $0030,  $0020,  $0030,  $0000   ; 5F0B   0030 0020 0030 0000
        DECLE   $0080,  $00DC,  $007E,  $003E   ; 5F0F   0080 00DC 007E 003E
        DECLE   $007E,  $00FF,  $00F7           ; 5F13   007E 00FF 00F7

        SLR     R3,     2                       ; 5F16   0067
        MOVR    R0,     R7                      ; 5F17   0087

        DECLE   $00C6,  $00CE,  $00CC,  $00E0   ; 5F18   00C6 00CE 00CC 00E0
        DECLE   $0060,  $00C0,  $00F0,  $0020   ; 5F1C   0060 00C0 00F0 0020
        DECLE   $00F8,  $00DC,  $0008,  $0018   ; 5F20   00F8 00DC 0008 0018
        DECLE   $0090,  $00F0,  $00F0,  $0078   ; 5F24   0090 00F0 00F0 0078
        DECLE   $001C,  $000E,  $0003,  $008E   ; 5F28   001C 000E 0003 008E
        DECLE   $00C0,  $0000,  $0000,  $0000   ; 5F2C   00C0 0000 0000 0000
        DECLE   $00D0,  $00FE,  $00F8,  $00FC   ; 5F30   00D0 00FE 00F8 00FC
        DECLE   $007A,  $007E,  $006C,  $00C0   ; 5F34   007A 007E 006C 00C0
        DECLE   $0080,  $0000,  $0080,  $0080   ; 5F38   0080 0000 0080 0080
        DECLE   $0000,  $0000                   ; 5F3C   0000 0000

        ADDR    R0,     R0                      ; 5F3E   00C0
        ADDR    R0,     R0                      ; 5F3F   00C0
        MOVR    R4,     R0                      ; 5F40   00A0
        ADDR    R1,     R7                      ; 5F41   00CF
        ADDR    R0,     R7                      ; 5F42   00C7

        DECLE   $00C5,  $00F8,  $00F0,  $00C0   ; 5F43   00C5 00F8 00F0 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F47   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 5F4B   0000 0000 0000 0080
        DECLE   $0018,  $0077,  $00F9,  $0088   ; 5F4F   0018 0077 00F9 0088
        DECLE   $0098,  $00FE,  $00FE,  $00FC   ; 5F53   0098 00FE 00FE 00FC
        DECLE   $00F8,  $00E0,  $00C0,  $0080   ; 5F57   00F8 00E0 00C0 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F5B   0000 0000 0000 0000
        DECLE   $0030,  $006F,  $00F3,  $0011   ; 5F5F   0030 006F 00F3 0011
        DECLE   $0031,  $003F,  $00FE,  $00FC   ; 5F63   0031 003F 00FE 00FC
        DECLE   $00F8,  $00E0,  $0000,  $0000   ; 5F67   00F8 00E0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F6B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FE   ; 5F6F   0000 0000 0000 00FE
        DECLE   $00FE,  $00C6,  $00C0,  $00C0   ; 5F73   00FE 00C6 00C0 00C0
        DECLE   $00C0,  $00C0,  $00E2,  $00F7   ; 5F77   00C0 00C0 00E2 00F7
        DECLE   $00FF,  $007E,  $0018,  $0000   ; 5F7B   00FF 007E 0018 0000
        DECLE   $0000,  $0002,  $000F,  $001E   ; 5F7F   0000 0002 000F 001E
        DECLE   $00FF,  $00F8,  $00E0,  $0003   ; 5F83   00FF 00F8 00E0 0003
        DECLE   $0003,  $00BF,  $00FF,  $00E0   ; 5F87   0003 00BF 00FF 00E0
        DECLE   $00E0,  $00C0,  $0080,  $0000   ; 5F8B   00E0 00C0 0080 0000
        DECLE   $0000,  $0002,  $000F,  $001E   ; 5F8F   0000 0002 000F 001E
        DECLE   $00FF,  $00F8,  $00E0,  $0003   ; 5F93   00FF 00F8 00E0 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F97   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F9B   0000 0000 0000 0000
        DECLE   $0000,  $005B,  $00B7,  $00B6   ; 5F9F   0000 005B 00B7 00B6
        DECLE   $006E,  $00ED,  $005B,  $005B   ; 5FA3   006E 00ED 005B 005B
        DECLE   $00D1,  $00D0,  $0090,  $0090   ; 5FA7   00D1 00D0 0090 0090
        DECLE   $0098,  $00C8,  $006C,  $0024   ; 5FAB   0098 00C8 006C 0024
        DECLE   $0000                           ; 5FAF   0000

        SWAP    R0,     1                       ; 5FB0   0040
        SLR     R0,     1                       ; 5FB1   0060
        ADDR    R2,     R0                      ; 5FB2   00D0
        ADDR    R3,     R0                      ; 5FB3   00D8
        MOVR    R6,     R0                      ; 5FB4   00B0
        SAR     R0,     2                       ; 5FB5   006C
        SLLC    R0,     1                       ; 5FB6   0058
        MOVR    R6,     R2                      ; 5FB7   00B2
        MOVR    R3,     R6                      ; 5FB8   009E
        MOVR    R5,     R6                      ; 5FB9   00AE
        MOVR    R4,     R7                      ; 5FBA   00A7

        DECLE   $00A6,  $00B6,  $0052,  $0050   ; 5FBB   00A6 00B6 0052 0050
.GRAM_INIT_5FBF:
        DECLE   $0009           ; 5FBF  # of GRAM cards to init
        DECLE   $0145,  $0050   ; 5FC0  #00-00:  GROM #22-22 -Y--
        DECLE   $0141,  $0050   ; 5FC2  #01-01:  GROM #20-20 -Y--
        DECLE   $013D,  $0050   ; 5FC4  #02-02:  GROM #1E-1E -Y--
        DECLE   $0001,  $0100   ; 5FC6  #03-05:  CART #00-02 ----
        DECLE   $0101,  $0140   ; 5FC8  #06-08:  GRAM #00-02 -Y--

.GFX_LIST_5FCA:
        DECLE   $003F,  $00FF,  $00B7,  $006E   ; 5FCA  CART PIC #00
        DECLE   $00CE,  $00CC,  $0088,  $0088   ; 5FCE  
        DECLE   $00FE,  $00F7,  $0037,  $0013   ; 5FD2  CART PIC #01
        DECLE   $0051,  $0040,  $0062,  $0023   ; 5FD6  
        DECLE   $0000,  $0010,  $0000,  $007C   ; 5FDA  CART PIC #02
        DECLE   $0000,  $0010,  $0000,  $0000   ; 5FDE  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5FFE   0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $501E       <entry>
;;  $50E9       <entry>
;;  $5110       $513E  
;;  $515A       $5157  
;;  $519F       $519C  
;;  $51A9       $5186  
;;  $51B0       $51A1  
;;  $51DA       $51E5  
;;  $51EB       $5201  
;;  $51F1       $51FE  
;;  $5224       $521F  
;;  $525E       $510D   $515C   $51B0  
;;  $5269       <entry>
;;  $5277       $526F  
;;  $527A       <entry>
;;  $5281       $5295  
;;  $5285       $528B  
;;  $5297       <entry>
;;  $5299       $52CF  
;;  $52BD       $52B5  
;;  $52CC       $52A2  
;;  $52D1       $5290  
;;  $52D2       <entry>
;;  $52D4       $52E5  
;;  $52E7       $52DF  
;;  $52F7       $52F3  
;;  $5309       $52FD  
;;  $5311       $5303   $5307   $530D  
;;  $532A       $5327  
;;  $533B       $5337  
;;  $5346       $5342  
;;  $5386       $5382  
;;  $5387       $538D  
;;  $538F       $538A  
;;  $5395       $5392  
;;  $539F       $53A1  
;;  $53AB       $52E2   $54E2   $54EA   $553F  
;;  $53B2       $53B0  
;;  $53C9       $53B8   $53C0  
;;  $53CA       $53C6  
;;  $5410       $53D7  
;;  $543C       $53E2   $541F   $5426  
;;  $5445       $53BC  
;;  $5463       $545A  
;;  $548B       $5488  
;;  $548E       $5461  
;;  $54A1       $549C  
;;  $54AF       $54AB  
;;  $54B8       $548C   $54B4  
;;  $54BD       $54C9  
;;  $54BF       $54C4  
;;  $54E7       $5447  
;;  $5502       $54FD  
;;  $5513       $5519  
;;  $5529       $5525  
;;  $5545       $53C4  
;;  $5564       $52E7  
;;  $5565       $56C7  
;;  $5574       $5570  
;;  $557E       $556B   $557B  
;;  $5596       $55A6   $55AA   $55AE  
;;  $55B2       $55BB  
;;  $55BE       $55C5  
;;  $55C9       $55D3  
;;  $55D6       $55E6   $55EA   $55EE  
;;  $55D9       $55C1  
;;  $55F7       $5611  
;;  $5615       $5625  
;;  $5627       $55B4   $55F4  
;;  $562C       $5644  
;;  $563A       $5635  
;;  $5646       $563E   $5668  
;;  $5647       $55CC   $560E  
;;  $564C       $566E  
;;  $5663       $565E  
;;  $5664       $565B   $5661  
;;  $5670       $5657   $5689  
;;  $5676       $5671  
;;  $5677       $55F7   $5641   $566B  
;;  $5688       $55A2   $55E2   $5621  
;;  $5689       $55B7   $55CF   $5607  
;;  $56A7       $56A2  
;;  $56AE       $56A8  
;;  $56C9       $56A5   $56AC   $56B3  
;;  $56D3       $53EF   $541A   $567B   $5682   $56AE  
;;  $56D6       $56DB  
;;  $56DD       $56D8  
;;  $56DF       $54FF   $5880  
;;  $56E9       $56E5  
;;  $56FA       $56F4  
;;  $5701       $56FB  
;;  $5714       $570E  
;;  $571B       $5715  
;;  $5727       $5723  
;;  $5779       $5773  
;;  $577D       $577A   $57D3  
;;  $5787       $5783  
;;  $57B0       $57A8  
;;  $57C6       $579F   $57B8   $57BF  
;;  $57CD       $57C9  
;;  $57E4       $57DC  
;;  $57F1       $57ED  
;;  $5814       $5810  
;;  $5828       $5824  
;;  $5831       $581B  
;;  $583A       $5221  
;;  $5842       $5875  
;;  $5849       $549E  
;;  $5858       $5870  
;;  $5872       $5861  
;;  $5877       $5541  
;;  $5886       $587E  
;;  $588F       $588B  
;;  $58AA       $58A6  
;;  $58B3       $58AD  
;;  $58BB       $58B7  
;;  $58DF       $58D7  
;;  $58F6       $58F3  
;;  $5912       $5928  
;;  $5917       $58ED  
;;  $5924       $5921  
;;  $592A       $591C  
;;  $5932       $505C  
;;  $5977       $5990  
;;  $5978       $590F  
;;  $5988       <entry>
;;  $59F7       <entry>
;;  $59FD       $548E  
;;  $5A00       $5464  
;;  $5A01       $59FF  
;;  $5A23       <entry>
;;  $5A28       $57C2  
;;  $5A3D       $52DA   $52F7   $531A   $532C   $53A3   $5455   $5476   $54CB  
;;  $5A3D       $551B   $56EA   $5738   $576E   $579A   $57BA   $5800   $5879  
;;  $5A3D       $5899   $5AD1   $5B92   $5BAC   $5BC5  
;;  $5A44       $531F   $5331   $53A8   $547B   $54D4   $54F3   $552D   $573D  
;;  $5A44       $5837   $589E   $5B97   $5BB9  
;;  $5A4C       $52C0   $534E   $5400   $542F   $5469   $54B8   $550A   $554C  
;;  $5A53       $5A4F  
;;  $5A54       $5218   $527B  
;;  $5A64       $5A5E   $5A9A  
;;  $5A71       $5A69  
;;  $5A7B       $5A77  
;;  $5A93       $5A8F  
;;  $5A99       $5A56  
;;  $5A9C       $520A   $5215  
;;  $5ACC       $52EA  
;;  $5ADA       $5AD6  
;;  $5AE4       $5317  
;;  $5B07       $5B03  
;;  $5B40       $5B3C  
;;  $5B53       $5505  
;;  $5B5D       $5B59  
;;  $5B86       $5BF8  
;;  $5BA2       $5B9F  
;;  $5BBC       $5B60  
;;  $5BC5       $5BC1  
;;  $5BD6       $5BCA  
;;  $5BD7       $5BD1   $5BD4  
;;  $5BFA       $5502   $5883  
;;  $5C03       $5BFF  
;;  $5C0C       $5150   $5195  
;;  $5C1A       $5C2C  
;;  $5C21       $5C25   $5C28   $5C38   $5C55   $5C77  
;;  $5C4B       $5C31  
;;  $5C75       $5C4C  
;;  $5CF0       $5CEE  
;;  $5CF9       $5CF7  
;;  $5D63       $5D61  
;;  $5D90       $5D8E  
;;  $5E20       $5E20  
;;  $5E6B       $5E69  
;; ======================================================================== ;;
