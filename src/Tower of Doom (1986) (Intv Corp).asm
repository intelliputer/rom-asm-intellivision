
        ORG     $5000
.HEADER:
        BIDECLE $0000           ; 5000  Ptr: MOB graphic images
        BIDECLE $0000           ; 5002  Ptr: EXEC timer table
        BIDECLE $0000           ; 5004  Ptr: Start of game
        BIDECLE $5209           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5439           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5090           ; 500A  Ptr: Date/Title
        DECLE   $00C0           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0003   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0003   ; 5011  Color Stack init (2, 3)
        DECLE   $000B           ; 5013  Border color init


        MVII    #$00F0, R0                      ; 5014   02B8 00F0
        MVII    #$02FB, R1                      ; 5016   02B9 02FB
        MVII    #$0200, R4                      ; 5018   02BC 0200

        JSR     R5,     X_FILL_MEM              ; 501A   0004 0114 0341
        JSR     R5,     L_507D                  ; 501D   0004 0150 007D
        DECLE   $0103,  $0001,  $016F,  $00C0   ; 5020   0103 0001 016F 00C0
        DECLE   $017E,  $000C,  $01ED,  $00FE   ; 5024   017E 000C 01ED 00FE
        DECLE   $01D4,  $0088,  $0000,  $0004   ; 5028   01D4 0088 0000 0004

        ANDR    R5,     R4                      ; 502C   01AC
        XORR    R0,     R4                      ; 502D   01C4
        MVI     G_01D4, R0                      ; 502E   0280 01D4
        MVO     R0,     G_01E4                  ; 5030   0240 01E4

        JSR     R5,     L_6857                  ; 5032   0004 0168 0057
        DECLE   $0004,  $01A8,  $03C1,  $0241   ; 5035   0004 01A8 03C1 0241
        DECLE   $01E0,  $0004                   ; 5039   01E0 0004

        ANDR    R5,     R0                      ; 503B   01A8
        XOR@    R3,     R2                      ; 503C   03DA
        MVO     R2,     G_010F                  ; 503D   0242 010F
        MVO     R2,     G_010E                  ; 503F   0242 010E

        JSR     R5,     L_544A                  ; 5041   0004 0154 004A
        JSR     R5,     L_547D                  ; 5044   0004 0154 007D
        JSR     R5,     L_54BD                  ; 5047   0004 0154 00BD
        JSR     R5,     L_6880                  ; 504A   0004 0168 0080
        JSR     R5,     L_5B42                  ; 504D   0004 0158 0342
        DECLE   $0005,  $0002,  $0004           ; 5050   0005 0002 0004

        ANDR    R5,     R0                      ; 5053   01A8
        SARC    R1,     1                       ; 5054   0079

        JSR     R5,     L_5751                  ; 5055   0004 0154 0351
        DECLE   $0004,  $01AC,  $02C5,  $000C   ; 5058   0004 01AC 02C5 000C
        DECLE   $0004,  $0194,  $0286,  $0002   ; 505C   0004 0194 0286 0002
        DECLE   $0280,  $0102,  $0010,  $0223   ; 5060   0280 0102 0010 0223
        DECLE   $0005                           ; 5064   0005

        MVI     G_0103, R1                      ; 5065   0281 0103
        MVO     R1,     G_0102                  ; 5067   0241 0102
        NEGR    R0                              ; 5069   0020

        JSR     R5,     X_RAND1                 ; 506A   0004 0114 027D
        DECLE   $0004                           ; 506D   0004

        ANDR    R3,     R4                      ; 506E   019C
        SUBR    R0,     R1                      ; 506F   0101

        JSR     R5,     .EXEC.AAD               ; 5070   0004 0118 02AD
        JSR     R5,     L_552F                  ; 5073   0004 0154 012F
        JSR     R5,     L_6DB7                  ; 5076   0004 016C 01B7
        DECLE   $0220,  $001B                   ; 5079   0220 001B
L_507B:
        MVI@    R5,     R0                      ; 507B   02A8
        MVO@    R0,     R1                      ; 507C   0248
L_507D:
        MVI@    R5,     R1                      ; 507D   02A9
        TSTR    R1                              ; 507E   0089
        BNEQ    L_507B                          ; 507F   022C 0005
        MOVR    R5,     R7                      ; 5081   00AF

L_5082:
        PSHR    R5                              ; 5082   0275

        JSR     R5,     L_FFB7                  ; 5083   0004 01FC 03B7
        DECLE   $0004                           ; 5086   0004

        ANDR    R5,     R0                      ; 5087   01A8
        CMPI    #$0004, R0                      ; 5088   0378 0004
        CMPR    R4,     R0                      ; 508A   0160
        AND     .STIC.X.4,R1                    ; 508B   0381 0004
        CMPR    R2,     R4                      ; 508D   0154
        MOVR    R7,     R5                      ; 508E   00BD
        PULR    R7                              ; 508F   02B7

.TITLE:
        DECLE   $0056                           ; 5090  Cartridge year
        STRING  "X"                             ; 5091  Title string
        DECLE   $0000                           ; 5092  

.TITLECODE:
        PULR    R5                              ; 5093   02B5
        DECLE   $0240,  $0021,  $02B8,  $00C0   ; 5094   0240 0021 02B8 00C0
        DECLE   $0040,  $0240,  $0318,  $0004   ; 5098   0040 0240 0318 0004
        DECLE   $01A4,  $02E1,  $0004,  $0190   ; 509C   01A4 02E1 0004 0190
        DECLE   $0041,  $0021,  $01C0,  $0240   ; 50A0   0041 0021 01C0 0240
        DECLE   $0338,  $0002,  $0004           ; 50A4   0338 0002 0004

        ANDR    R5,     R0                      ; 50A7   01A8
        SARC    R1,     1                       ; 50A8   0079
        CLRR    R0                              ; 50A9   01C0
        CLRR    R4                              ; 50AA   01E4
        MVO@    R0,     R4                      ; 50AB   0260
        MVO@    R0,     R4                      ; 50AC   0260
        MVO@    R0,     R4                      ; 50AD   0260
        MVO@    R0,     R4                      ; 50AE   0260
        MVO@    R0,     R4                      ; 50AF   0260
        MVO@    R0,     R4                      ; 50B0   0260
        MVO@    R0,     R4                      ; 50B1   0260
        MVO@    R0,     R4                      ; 50B2   0260
        MVO     R0,     .STIC.MODE              ; 50B3   0240 0021
        MVO     R0,     .STIC.BORD              ; 50B5   0240 002C
        MVO     R0,     .STIC.VIDEN             ; 50B7   0240 0020
        MVI     .ISRVEC.1,R0                    ; 50B9   0280 0101
        SWAP    R0,     1                       ; 50BB   0040
        ADD     .ISRVEC.0,R0                    ; 50BC   02C0 0100
        MVO     R0,     G_0337                  ; 50BE   0240 0337
        SDBD                                    ; 50C0   0001
        MVII    #$5117, R0                      ; 50C1   02B8 0017 0051
        MVO     R0,     .ISRVEC.0               ; 50C4   0240 0100
        SWAP    R0,     1                       ; 50C6   0040
        MVO     R0,     .ISRVEC.1               ; 50C7   0240 0101
        MVI     G_033A, R0                      ; 50C9   0280 033A
L_50CB:
        EIS                                     ; 50CB   0002
        CMP     G_033A, R0                      ; 50CC   0340 033A
        BEQ     L_50CB                          ; 50CE   0224 0004

        ADD     G_0339, R0                      ; 50D0   02C0 0339
        ANDI    #$000F, R0                      ; 50D2   03B8 000F

        JSR     R5,     X_RAND2                 ; 50D4   0004 0114 029E
        JSR     R5,     L_5123                  ; 50D7   0004 0150 0123
        DECLE   $0004                           ; 50DA   0004

        ANDR    R5,     R4                      ; 50DB   01AC
        AND     .STIC.X.4,R0                    ; 50DC   0380 0004
        SUBR    R3,     R0                      ; 50DE   0118
        MVI@    R5,     R5                      ; 50DF   02AD

        JSR     R5,     L_6DB7                  ; 50E0   0004 016C 01B7
        DECLE   $0280,  $033A,  $0281,  $01FE   ; 50E3   0280 033A 0281 01FE
        DECLE   $0381,  $01FF,  $0379,  $00FF   ; 50E7   0381 01FF 0379 00FF
        DECLE   $0224,  $0021,  $0379,  $00B7   ; 50EB   0224 0021 0379 00B7
        DECLE   $0204,  $000E,  $0282,  $033A   ; 50EF   0204 000E 0282 033A
        DECLE   $03BA,  $0003,  $022C,  $002B   ; 50F3   03BA 0003 022C 002B
        DECLE   $0341,  $0339,  $0204,  $00AA   ; 50F7   0341 0339 0204 00AA

        MVO     R1,     G_0339                  ; 50FB   0241 0339
        B       L_50CB                          ; 50FD   0220 0033

        MVII    #$0004, R3                      ; 50FF   02BB 0004
        CMP     G_0338, R3                      ; 5101   0343 0338
        BLE     L_50CB                          ; 5103   0226 0039

        MVO     R3,     G_0338                  ; 5105   0243 0338
        CLRR    R3                              ; 5107   01DB
        MVO     R3,     G_01E7                  ; 5108   0243 01E7
        SDBD                                    ; 510A   0001
        MVII    #$2200, R3                      ; 510B   02BB 0000 0022
        MVII    #$02C8, R4                      ; 510E   02BC 02C8
L_5110:
        MVO@    R3,     R4                      ; 5110   0263
        CMPI    #$02DC, R4                      ; 5111   037C 02DC
        BMI     L_5110                          ; 5113   022B 0004
        B       L_50CB                          ; 5115   0220 004B

        PSHR    R5                              ; 5117   0275
        MVI     G_033A, R0                      ; 5118   0280 033A
        INCR    R0                              ; 511A   0008
        MVO     R0,     G_033A                  ; 511B   0240 033A
        MVO     R0,     .STIC.VIDEN             ; 511D   0240 0020

        JSR     R5,     X_PLAY_NOTE             ; 511F   0004 0118 02BD

L_5122:
        PULR    R7                              ; 5122   02B7

L_5123:
        PSHR    R5                              ; 5123   0275
        MVI     G_0338, R1                      ; 5124   0281 0338
        INCR    R1                              ; 5126   0009
        ADDR    R7,     R1                      ; 5127   00F9
        ADD@    R1,     R7                      ; 5128   02CF

        CLRC                                    ; 5129   0006
        COMR    R1                              ; 512A   0019
        NEGR    R2                              ; 512B   0022
        ADCR    R7                              ; 512C   002F

        RSWD    R1                              ; 512D   0039
L_512E:
        SLL     R0,     1                       ; 512E   0048
        DECLE   $0004                           ; 512F   0004

        ANDR    R5,     R4                      ; 5130   01AC
        ADD     .STIC.VDLY,R5                   ; 5131   02C5 0031

        JSR     R5,     L_5193                  ; 5133   0004 0150 0193
        BIDECLE $2A03,  $2B23                   ; 5136   0003 002A 0023 002B
        BIDECLE $2200                           ; 513A   0000 0022
L_513C:
        MVI     G_0338, R0                      ; 513C   0280 0338
        INCR    R0                              ; 513E   0008
L_513F:
        MVO     R0,     G_0338                  ; 513F   0240 0338
        PULR    R7                              ; 5141   02B7

        JSR     R5,     L_5190                  ; 5142   0004 0150 0190
        BIDECLE $2A07,  $2B27                   ; 5145   0007 002A 0027 002B
        BIDECLE $2A63                           ; 5149   0063 002A

        MVI     G_0335, R0                      ; 514B   0280 0335
        TSTR    R0                              ; 514D   0080
        BNEQ    L_5122                          ; 514E   022C 002D

L_5150:
        SDBD                                    ; 5150   0001
        MVII    #$2A03, R0                      ; 5151   02B8 0003 002A
        MVO     R0,     G_0336                  ; 5154   0240 0336
        B       L_513C                          ; 5156   0220 001B

        MVI     G_033A, R0                      ; 5158   0280 033A
        ANDI    #$01FF, R0                      ; 515A   03B8 01FF
        ADD     G_01E7, R0                      ; 515C   02C0 01E7
        BNEQ    L_5122                          ; 515E   022C 003D
        B       L_513F                          ; 5160   0220 0022

        DECLE   $0004                           ; 5162   0004

        ANDR    R5,     R4                      ; 5163   01AC
        ADD     .STIC.EDGE,R5                   ; 5164   02C5 0032

        JSR     R5,     L_5193                  ; 5166   0004 0150 0193
        BIDECLE $2A03,  $2B23                   ; 5169   0003 002A 0023 002B
        BIDECLE $2200                           ; 516D   0000 0022

        B       L_5150                          ; 516F   0220 0020

        MVII    #$0003, R0                      ; 5171   02B8 0003
        MVI     G_01E7, R1                      ; 5173   0281 01E7
        TSTR    R1                              ; 5175   0089
        BEQ     L_513F                          ; 5176   0224 0038

        MVI     G_0335, R0                      ; 5178   0280 0335
        TSTR    R0                              ; 517A   0080
        BNEQ    L_5122                          ; 517B   022C 005A

        MVI     G_0336, R0                      ; 517D   0280 0336
        XORI    #$0004, R0                      ; 517F   03F8 0004
        MVO     R0,     G_0336                  ; 5181   0240 0336
        MVI     G_0334, R0                      ; 5183   0280 0334
        XORI    #$0004, R0                      ; 5185   03F8 0004
        MVO     R0,     G_0334                  ; 5187   0240 0334
        SDBD                                    ; 5189   0001
        MVII    #$2200, R0                      ; 518A   02B8 0000 0022
        MVO     R0,     G_0335                  ; 518D   0240 0335
        PULR    R7                              ; 518F   02B7

L_5190:
        MVI     G_0335, R3                      ; 5190   0283 0335
        INCR    R7                              ; 5192   000F

L_5193:
        CLRR    R3                              ; 5193   01DB
L_5194:
        SDBD                                    ; 5194   0001
        MVI@    R5,     R0                      ; 5195   02A8
        SDBD                                    ; 5196   0001
        MVI@    R5,     R1                      ; 5197   02A9
        SDBD                                    ; 5198   0001
        MVI@    R5,     R2                      ; 5199   02AA
        TSTR    R3                              ; 519A   009B
        BNEQ    L_5122                          ; 519B   022C 007A

        MVO     R0,     G_0336                  ; 519D   0240 0336
        MVO     R1,     G_0334                  ; 519F   0241 0334
        MVO     R2,     G_0335                  ; 51A1   0242 0335
        B       L_513C                          ; 51A3   0220 0068

        DECLE   $0004                           ; 51A5   0004

        ANDR    R2,     R0                      ; 51A6   0190
        RSWD    R4                              ; 51A7   003C
        NEGR    R1                              ; 51A8   0021
        CLRR    R0                              ; 51A9   01C0
        MVO     R0,     G_01E7                  ; 51AA   0240 01E7
        MVI     G_0337, R0                      ; 51AC   0280 0337
        MVO     R0,     .ISRVEC.0               ; 51AE   0240 0100
        SWAP    R0,     1                       ; 51B0   0040
        MVO     R0,     .ISRVEC.1               ; 51B1   0240 0101
        MVII    #$0040, R0                      ; 51B3   02B8 0040
        MVII    #$031D, R4                      ; 51B5   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; 51B7   0004 0114 0338
        DECLE   $0004,  $01AC,  $018B,  $0004   ; 51BA   0004 01AC 018B 0004
        DECLE   $01AC,  $0166,  $0004,  $01A4   ; 51BE   01AC 0166 0004 01A4
        DECLE   $0114,  $0000                   ; 51C2   0114 0000
L_51C4:
        MVI@    R4,     R0                      ; 51C4   02A0
L_51C5:
        PSHR    R5                              ; 51C5   0275
        MOVR    R0,     R5                      ; 51C6   0085
        B       L_51D0                          ; 51C7   0200 0007

L_51C9:
        SDBD                                    ; 51C9   0001
        MVII    #$0806, R3                      ; 51CA   02BB 0006 0008
        PSHR    R5                              ; 51CD   0275
        MVII    #$0200, R5                      ; 51CE   02BD 0200
L_51D0:
        MVII    #$00C0, R2                      ; 51D0   02BA 00C0
        SWAP    R2,     1                       ; 51D2   0042
        INCR    R7                              ; 51D3   000F

L_51D4:
        ADDR    R1,     R5                      ; 51D4   00CD
L_51D5:
        MVI@    R4,     R0                      ; 51D5   02A0
        MOVR    R0,     R1                      ; 51D6   0081
        ANDI    #$03E0, R0                      ; 51D7   03B8 03E0
        BEQ     L_5122                          ; 51D9   0224 00B8

        SUBR    R0,     R1                      ; 51DB   0101
        CMPI    #$03C0, R0                      ; 51DC   0378 03C0
        BEQ     L_51D4                          ; 51DE   0224 000B
        BGT     L_5200                          ; 51E0   020E 001E

        SLR     R0,     2                       ; 51E2   0064
        PSHR    R5                              ; 51E3   0275
        MVI@    R5,     R5                      ; 51E4   02AD
        ANDR    R2,     R5                      ; 51E5   0195
        CMPI    #$00D8, R0                      ; 51E6   0378 00D8
        BNEQ    L_51EC                          ; 51E8   020C 0002

        CLRR    R0                              ; 51EA   01C0
        INCR    R7                              ; 51EB   000F

L_51EC:
        ADDR    R3,     R0                      ; 51EC   00D8
L_51ED:
        ADDR    R5,     R0                      ; 51ED   00E8
        PULR    R5                              ; 51EE   02B5
        MVO@    R0,     R5                      ; 51EF   0268
        SLL     R1,     2                       ; 51F0   004D
        SLL     R1,     1                       ; 51F1   0049
        BEQ     L_5122                          ; 51F2   0224 00D1

        MVI@    R5,     R0                      ; 51F4   02A8
        DECR    R5                              ; 51F5   0015
        ANDR    R2,     R0                      ; 51F6   0190
        CMPI    #$00D8, R1                      ; 51F7   0379 00D8
        BEQ     L_51FD                          ; 51F9   0204 0002

        ADDR    R1,     R0                      ; 51FB   00C8
        ADDR    R3,     R0                      ; 51FC   00D8
L_51FD:
        MVO@    R0,     R5                      ; 51FD   0268
        B       L_51D5                          ; 51FE   0220 002A

L_5200:
        MVI@    R5,     R0                      ; 5200   02A8
        DECR    R5                              ; 5201   0015
        ANDR    R2,     R0                      ; 5202   0190
        MVO@    R0,     R5                      ; 5203   0268
        DECR    R1                              ; 5204   0011
        BNEQ    L_5200                          ; 5205   022C 0006
        B       L_51D5                          ; 5207   0220 0033

.GFX_LIST_5209:
        DECLE   $003C,  $0042,  $0099,  $00A1   ; 5209  CART PIC #00
        DECLE   $0099,  $0042,  $003C,  $0000   ; 520D  
        DECLE   $0014,  $0008,  $0014,  $0014   ; 5211  CART PIC #01
        DECLE   $003E,  $0022,  $0041,  $0000   ; 5215  
        DECLE   $005C,  $0022,  $0022,  $003C   ; 5219  CART PIC #02
        DECLE   $0022,  $0022,  $005C,  $0000   ; 521D  
        DECLE   $001C,  $0026,  $0020,  $0060   ; 5221  CART PIC #03
        DECLE   $0020,  $0026,  $001C,  $0000   ; 5225  
        DECLE   $0058,  $0024,  $0026,  $0022   ; 5229  CART PIC #04
        DECLE   $0026,  $0024,  $0058,  $0000   ; 522D  
        DECLE   $005C,  $0022,  $0020,  $0038   ; 5231  CART PIC #05
        DECLE   $0020,  $0022,  $005C,  $0000   ; 5235  
        DECLE   $005C,  $0022,  $0020,  $0038   ; 5239  CART PIC #06
        DECLE   $0020,  $0020,  $0050,  $0000   ; 523D  
        DECLE   $001C,  $0026,  $0020,  $0060   ; 5241  CART PIC #07
        DECLE   $002A,  $0024,  $001C,  $0000   ; 5245  
        DECLE   $00AA,  $0044,  $0044,  $007C   ; 5249  CART PIC #08
        DECLE   $0044,  $0044,  $00AA,  $0000   ; 524D  
        DECLE   $0028,  $0010,  $0010,  $0010   ; 5251  CART PIC #09
        DECLE   $0010,  $0010,  $0028,  $0000   ; 5255  
        DECLE   $0014,  $0008,  $0008,  $0008   ; 5259  CART PIC #0A
        DECLE   $0008,  $0048,  $0030,  $0000   ; 525D  
        DECLE   $004A,  $0024,  $0028,  $0030   ; 5261  CART PIC #0B
        DECLE   $0028,  $0024,  $004A,  $0000   ; 5265  
        DECLE   $0050,  $0020,  $0020,  $0020   ; 5269  CART PIC #0C
        DECLE   $0020,  $0022,  $005C,  $0000   ; 526D  
        DECLE   $00C3,  $0066,  $005A,  $005A   ; 5271  CART PIC #0D
        DECLE   $0042,  $0042,  $00A5,  $0000   ; 5275  
        DECLE   $0065,  $0032,  $002A,  $002A   ; 5279  CART PIC #0E
        DECLE   $002A,  $0026,  $0052,  $0000   ; 527D  
        DECLE   $0018,  $0024,  $0024,  $0066   ; 5281  CART PIC #0F
        DECLE   $0024,  $0024,  $0018,  $0000   ; 5285  
        DECLE   $0058,  $0024,  $0024,  $0038   ; 5289  CART PIC #10
        DECLE   $0020,  $0020,  $0050,  $0000   ; 528D  
        DECLE   $001C,  $0022,  $0022,  $0043   ; 5291  CART PIC #11
        DECLE   $002A,  $0024,  $001B,  $0000   ; 5295  
        DECLE   $0058,  $0024,  $0024,  $0038   ; 5299  CART PIC #12
        DECLE   $0024,  $0024,  $0052,  $0000   ; 529D  
        DECLE   $003A,  $0044,  $0040,  $0038   ; 52A1  CART PIC #13
        DECLE   $0004,  $0044,  $00B8,  $0000   ; 52A5  
        DECLE   $007C,  $0092,  $0010,  $0010   ; 52A9  CART PIC #14
        DECLE   $0010,  $0010,  $0028,  $0000   ; 52AD  
        DECLE   $0055,  $0022,  $0022,  $0022   ; 52B1  CART PIC #15
        DECLE   $0022,  $0036,  $001C,  $0000   ; 52B5  
        DECLE   $0055,  $0022,  $0022,  $0014   ; 52B9  CART PIC #16
        DECLE   $0014,  $0014,  $0008,  $0000   ; 52BD  
        DECLE   $00AA,  $0044,  $0044,  $0044   ; 52C1  CART PIC #17
        DECLE   $0054,  $0054,  $0028,  $0000   ; 52C5  
        DECLE   $0055,  $0022,  $0014,  $0008   ; 52C9  CART PIC #18
        DECLE   $0014,  $0022,  $0055,  $0000   ; 52CD  
        DECLE   $0055,  $0022,  $0022,  $0014   ; 52D1  CART PIC #19
        DECLE   $0008,  $0008,  $0014,  $0000   ; 52D5  
        DECLE   $0041,  $003E,  $0042,  $0004   ; 52D9  CART PIC #1A
        DECLE   $0018,  $0021,  $007E,  $0001   ; 52DD  
        DECLE   $0000,  $003C,  $003C,  $003C   ; 52E1  CART PIC #1B
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 52E5  
        DECLE   $0018,  $0024,  $0024,  $0024   ; 52E9  CART PIC #1C
        DECLE   $0024,  $0024,  $0018,  $0000   ; 52ED  
        DECLE   $0008,  $0018,  $0028,  $0008   ; 52F1  CART PIC #1D
        DECLE   $0008,  $0008,  $003E,  $0000   ; 52F5  
        DECLE   $0018,  $0024,  $0004,  $0008   ; 52F9  CART PIC #1E
        DECLE   $0010,  $0020,  $003C,  $0000   ; 52FD  
        DECLE   $0018,  $0024,  $0004,  $0018   ; 5301  CART PIC #1F
        DECLE   $0004,  $0024,  $0018,  $0000   ; 5305  
        DECLE   $0004,  $000C,  $0014,  $0024   ; 5309  CART PIC #20
        DECLE   $003E,  $0004,  $0004,  $0000   ; 530D  
        DECLE   $003C,  $0020,  $0020,  $0018   ; 5311  CART PIC #21
        DECLE   $0004,  $0024,  $0018,  $0000   ; 5315  
        DECLE   $0018,  $0024,  $0020,  $0038   ; 5319  CART PIC #22
        DECLE   $0024,  $0024,  $0018,  $0000   ; 531D  
        DECLE   $003C,  $0004,  $0004,  $0008   ; 5321  CART PIC #23
        DECLE   $0010,  $0020,  $0020,  $0000   ; 5325  
        DECLE   $0018,  $0024,  $0024,  $0018   ; 5329  CART PIC #24
        DECLE   $0024,  $0024,  $0018,  $0000   ; 532D  
        DECLE   $0018,  $0024,  $0024,  $001C   ; 5331  CART PIC #25
        DECLE   $0004,  $0024,  $0018,  $0000   ; 5335  
        DECLE   $007F,  $005F,  $005F,  $0057   ; 5339  CART PIC #26
        DECLE   $0057,  $0057,  $0055,  $0055   ; 533D  
        DECLE   $0002,  $000A,  $000A,  $002A   ; 5341  CART PIC #27
        DECLE   $002A,  $002A,  $00AA,  $00AA   ; 5345  
        DECLE   $00AA,  $00AA,  $00AA,  $00AA   ; 5349   00AA 00AA 00AA 00AA
        DECLE   $00AA,  $00AA,  $00AA,  $0000   ; 534D   00AA 00AA 00AA 0000
        DECLE   $0003,  $0005,  $0007,  $0017   ; 5351  CART PIC #29
        DECLE   $001B,  $006B,  $00FB,  $00FF   ; 5355  
        DECLE   $0080,  $00E0,  $00B0,  $00F8   ; 5359  CART PIC #2A
        DECLE   $00EC,  $00EA,  $00FD,  $00FB   ; 535D  
        DECLE   $0081,  $00A1,  $00E9,  $00CD   ; 5361  CART PIC #2B
        DECLE   $009D,  $003B,  $00BF,  $00DF   ; 5365  
        DECLE   $0000,  $00DB,  $00FF,  $00FF   ; 5369  CART PIC #2C
        DECLE   $00FF,  $0000,  $007E,  $005A   ; 536D  
        DECLE   $00AD,  $0093,  $008D,  $00C3   ; 5371  CART PIC #2D
        DECLE   $0099,  $00A5,  $00CB,  $00B1   ; 5375  
        DECLE   $00DD,  $00DD,  $00FF,  $0055   ; 5379  CART PIC #2E
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 537D  
        DECLE   $00FF,  $00E7,  $00C3,  $00C3   ; 5381  CART PIC #2F
        DECLE   $00C3,  $00FF,  $00FF,  $00FF   ; 5385  
        DECLE   $0055,  $0055,  $0055,  $0055   ; 5389  CART PIC #30
        DECLE   $0055,  $0055,  $0055,  $00FF   ; 538D  
        DECLE   $00F8,  $00F8,  $00F8,  $00F8   ; 5391  CART PIC #31
        DECLE   $00F8,  $00F8,  $00F8,  $00F8   ; 5395  
        DECLE   $00F8,  $00F8,  $00F8,  $00F8   ; 5399  CART PIC #32
        DECLE   $00FC,  $00FC,  $00FE,  $00FE   ; 539D  
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 53A1   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 53A5   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0008,  $003C   ; 53A9   0000 0000 0008 003C
        DECLE   $007E,  $00FE,  $00FE,  $005B   ; 53AD   007E 00FE 00FE 005B
        DECLE   $0000,  $0018,  $003C,  $003C   ; 53B1   0000 0018 003C 003C
        DECLE   $003C,  $003C,  $003C,  $003C   ; 53B5   003C 003C 003C 003C
        DECLE   $003C,  $001C,  $000C,  $0004   ; 53B9   003C 001C 000C 0004
        DECLE   $0004,  $0000,  $0000,  $0000   ; 53BD   0004 0000 0000 0000
        DECLE   $00FF,  $00C0,  $00C0,  $00C0   ; 53C1   00FF 00C0 00C0 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 53C5   00C0 00C0 00C0 00C0
        DECLE   $00FF,  $0003,  $0003,  $0003   ; 53C9   00FF 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; 53CD   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; 53D1   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $00FF   ; 53D5   0003 0003 0003 00FF
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 53D9   00C0 00C0 00C0 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $00FF   ; 53DD   00C0 00C0 00C0 00FF
        DECLE   $0000,  $000E,  $0018,  $0030   ; 53E1   0000 000E 0018 0030
        DECLE   $0034,  $0078,  $0070,  $0020   ; 53E5   0034 0078 0070 0020
        DECLE   $0000,  $00FE,  $00FE,  $00FE   ; 53E9   0000 00FE 00FE 00FE
        DECLE   $007C,  $007C,  $0038,  $0010   ; 53ED   007C 007C 0038 0010
        DECLE   $0000,  $0000,  $003E,  $0023   ; 53F1   0000 0000 003E 0023
        DECLE   $0023,  $0026,  $003C,  $0018   ; 53F5   0023 0026 003C 0018
        DECLE   $0018,  $003C,  $0026,  $0023   ; 53F9   0018 003C 0026 0023
        DECLE   $0023,  $003E,  $0000,  $0000   ; 53FD   0023 003E 0000 0000
        DECLE   $0000,  $0000                   ; 5401   0000 0000

        SARC    R2,     2                       ; 5403   007E
        ADDR    R4,     R7                      ; 5404   00E7
        ADDR    R4,     R7                      ; 5405   00E7

        DECLE   $007E,  $0000,  $0000,  $0000   ; 5406   007E 0000 0000 0000
        DECLE   $0000,  $007C,  $00C4,  $00C4   ; 540A   0000 007C 00C4 00C4
        DECLE   $0064,  $003C,  $0018,  $0018   ; 540E   0064 003C 0018 0018
        DECLE   $003C,  $0064,  $00C4,  $00C4   ; 5412   003C 0064 00C4 00C4
        DECLE   $007C,  $0000,  $0000,  $0018   ; 5416   007C 0000 0000 0018
        DECLE   $003C,  $003C,  $0024,  $0024   ; 541A   003C 003C 0024 0024
        DECLE   $003C,  $003C,  $0018,  $0000   ; 541E   003C 003C 0018 0000
        DECLE   $0018,  $0024,  $0008,  $0010   ; 5422   0018 0024 0008 0010
        DECLE   $0000,  $0010,  $0000,  $0000   ; 5426   0000 0010 0000 0000
        DECLE   $003C,  $003C,  $003C,  $0034   ; 542A   003C 003C 003C 0034
        DECLE   $003C,  $003C,  $0000,  $0000   ; 542E   003C 003C 0000 0000
        DECLE   $0010,  $0010,  $0010,  $007C   ; 5432   0010 0010 0010 007C
        DECLE   $0038,  $0010,  $0000           ; 5436   0038 0010 0000
.GRAM_INIT_5439:
        DECLE   $0032           ; 5439  # of GRAM cards to init
        DECLE   $00CE           ; 543A  #00   :  CART #27    --I-
        DECLE   $004C           ; 543B  #01   :  CART #26    ----
        DECLE   $0053,  $0380   ; 543C  #02-09:  CART #29-30 ----
        DECLE   $0063,  $0080   ; 543E  #0A-0B:  CART #31-32 ----
        DECLE   $0001,  $0380   ; 5440  #0C-13:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 5442  #14-1B:  CART #08-0F ----
        DECLE   $0021,  $0380   ; 5444  #1C-23:  CART #10-17 ----
        DECLE   $0031,  $0380   ; 5446  #24-2B:  CART #18-1F ----
        DECLE   $0041,  $0280   ; 5448  #2C-31:  CART #20-25 ----

L_544A:
        PSHR    R5                              ; 544A   0275
        SDBD                                    ; 544B   0001
        MVII    #$18B8, R3                      ; 544C   02BB 00B8 0018
        MOVR    R7,     R4                      ; 544F   00BC
        ADDI    #$001D, R4                      ; 5450   02FC 001D

        JSR     R5,     L_51C4                  ; 5452   0004 0150 01C4
        JSR     R5,     L_51C4                  ; 5455   0004 0150 01C4
        DECLE   $02FB,  $0030,  $0098,  $02BC   ; 5458   02FB 0030 0098 02BC
        DECLE   $022F,  $02BB,  $0006,  $0004   ; 545C   022F 02BB 0006 0004
        DECLE   $01AC,  $02AB,  $02FC,  $000A   ; 5460   01AC 02AB 02FC 000A
        DECLE   $0004,  $01AC,  $02AB,  $02FC   ; 5464   0004 01AC 02AB 02FC
        DECLE   $0008,  $0013,  $022C,  $000C   ; 5468   0008 0013 022C 000C

        PULR    R7                              ; 546C   02B7

        DECLE   $021B,  $0023,  $0063,  $0063   ; 546D   021B 0023 0063 0063
        DECLE   $0063,  $0063,  $0064,  $0000   ; 5471   0063 0063 0064 0000
        DECLE   $02A7,  $0043,  $0063,  $0063   ; 5475   02A7 0043 0063 0063
        DECLE   $0063,  $0063,  $0065,  $0000   ; 5479   0063 0063 0065 0000
L_547D:
        PSHR    R5                              ; 547D   0275
        DECLE   $0001,  $02B8,  $0000,  $0018   ; 547E   0001 02B8 0000 0018
        DECLE   $02BB,  $0004,  $02BC,  $0215   ; 5482   02BB 0004 02BC 0215
        DECLE   $02BA,  $0004,  $0004,  $01AC   ; 5486   02BA 0004 0004 01AC
        DECLE   $02AB,  $02F8,  $0008,  $0012   ; 548A   02AB 02F8 0008 0012
        DECLE   $022C,  $0007,  $02FC,  $0010   ; 548E   022C 0007 02FC 0010
        DECLE   $0013,  $022C,  $000E,  $02BC   ; 5492   0013 022C 000E 02BC
        DECLE   $0279,  $0004,  $01AC,  $029A   ; 5496   0279 0004 01AC 029A
        DECLE   $00F6,  $0008,  $0004           ; 549A   00F6 0008 0004

        ANDR    R5,     R4                      ; 549D   01AC
        MVI@    R3,     R2                      ; 549E   029A
        MOVR    R5,     R0                      ; 549F   00A8
        COMR    R0                              ; 54A0   0018
        MOVR    R4,     R0                      ; 54A1   00A0
        CLRR    R3                              ; 54A2   01DB
        MOVR    R7,     R4                      ; 54A3   00BC
        ADDI    #$0013, R4                      ; 54A4   02FC 0013

        JSR     R5,     L_51C5                  ; 54A6   0004 0150 01C5

        SDBD                                    ; 54A9   0001
        MVII    #$22FB, R0                      ; 54AA   02B8 00FB 0022
        MVII    #$02C7, R4                      ; 54AD   02BC 02C7
        MVO@    R0,     R4                      ; 54AF   0260
        CLRR    R1                              ; 54B0   01C9
L_54B1:
        MVO@    R1,     R4                      ; 54B1   0261
        CMPI    #$02DC, R4                      ; 54B2   037C 02DC
        BMI     L_54B1                          ; 54B4   022B 0004
        PULR    R7                              ; 54B6   02B7

        DECLE   $03E2,  $03D0,  $03E4,  $03D0   ; 54B7   03E2 03D0 03E4 03D0
        DECLE   $03E4,  $0000                   ; 54BB   03E4 0000
L_54BD:
        PSHR    R5                              ; 54BD   0275

        JSR     R5,     .EXEC.7C1               ; 54BE   0004 0114 03C1

        MVII    #$02DC, R4                      ; 54C1   02BC 02DC
        MOVR    R4,     R5                      ; 54C3   00A5
        MVII    #$0014, R1                      ; 54C4   02B9 0014
L_54C6:
        MVI@    R4,     R0                      ; 54C6   02A0
        AND     G_0318, R0                      ; 54C7   0380 0318
        MVO@    R0,     R5                      ; 54C9   0268
        DECR    R1                              ; 54CA   0011
        BNEQ    L_54C6                          ; 54CB   022C 0006

        MVI     G_010F, R0                      ; 54CD   0280 010F
        ADDI    #$0003, R0                      ; 54CF   02F8 0003
        SLR     R0,     2                       ; 54D1   0064

        JSR     R5,     X_CLAMP                 ; 54D2   0004 0114 0270
        DECLE   $0000                           ; 54D5   0000

        DECR    R2                              ; 54D6   0012
        SDBD                                    ; 54D7   0001
        MVII    #$2000, R1                      ; 54D8   02B9 0000 0020
        MVII    #$02EF, R3                      ; 54DB   02BB 02EF
        MOVR    R3,     R5                      ; 54DD   009D
        MVI@    R3,     R2                      ; 54DE   029A
        XORR    R1,     R2                      ; 54DF   01CA
        MVO@    R2,     R3                      ; 54E0   025A
        SUBR    R0,     R3                      ; 54E1   0103
        MVI@    R3,     R2                      ; 54E2   029A
        XORR    R1,     R2                      ; 54E3   01CA
        MVO@    R2,     R3                      ; 54E4   025A
        MVI     G_010E, R0                      ; 54E5   0280 010E
        CMPI    #$0048, R0                      ; 54E7   0378 0048
        BLE     L_54F1                          ; 54E9   0206 0006

        MVII    #$0011, R0                      ; 54EB   02B8 0011
        CLRR    R1                              ; 54ED   01C9
        DECR    R1                              ; 54EE   0011
        B       L_54F3                          ; 54EF   0200 0002

L_54F1:
        MOVR    R0,     R1                      ; 54F1   0081
        SLR     R0,     2                       ; 54F2   0064
L_54F3:
        SDBD                                    ; 54F3   0001
        MVII    #$08B6, R2                      ; 54F4   02BA 00B6 0008
        MVII    #$02EE, R3                      ; 54F7   02BB 02EE
        CMPI    #$0004, R0                      ; 54F9   0378 0004
        BGE     L_5509                          ; 54FB   020D 000C

        SDBD                                    ; 54FD   0001
        XORI    #$1004, R2                      ; 54FE   03FA 0004 0010
        CMPI    #$0002, R0                      ; 5501   0378 0002
        BGE     L_5509                          ; 5503   020D 0004

        SDBD                                    ; 5505   0001
        XORI    #$1000, R2                      ; 5506   03FA 0000 0010
L_5509:
        DECR    R0                              ; 5509   0010
        BMI     L_5516                          ; 550A   020B 000A

        MVI@    R3,     R4                      ; 550C   029C
        SDBD                                    ; 550D   0001
        ANDI    #$E000, R4                      ; 550E   03BC 0000 00E0
        ADDR    R2,     R4                      ; 5511   00D4
        MVO@    R4,     R3                      ; 5512   025C
        DECR    R3                              ; 5513   0013
        B       L_5509                          ; 5514   0220 000C

L_5516:
        TSTR    R1                              ; 5516   0089
        BPL     L_551D                          ; 5517   0203 0004

        MVII    #$005E, R2                      ; 5519   02BA 005E
        B       L_5527                          ; 551B   0200 000A

L_551D:
        ADDI    #$0008, R2                      ; 551D   02FA 0008
        ANDI    #$0003, R1                      ; 551F   03B9 0003
        BEQ     L_552E                          ; 5521   0204 000B

        JSR     R5,     L_5B42                  ; 5523   0004 0158 0342
        DECLE   $0004                           ; 5526   0004
L_5527:
        MVI@    R3,     R4                      ; 5527   029C
        SDBD                                    ; 5528   0001
        ANDI    #$E000, R4                      ; 5529   03BC 0000 00E0
        ADDR    R2,     R4                      ; 552C   00D4
        MVO@    R4,     R3                      ; 552D   025C
L_552E:
        PULR    R7                              ; 552E   02B7

L_552F:
        PSHR    R5                              ; 552F   0275
        DECLE   $0004,  $0190,  $002A,  $0057   ; 5530   0004 0190 002A 0057
        DECLE   $0201,  $001D,  $0004,  $0190   ; 5534   0201 001D 0004 0190
        DECLE   $0014,  $00A5,  $0028,  $0000   ; 5538   0014 00A5 0028 0000
        DECLE   $020C,  $0012,  $0004,  $0190   ; 553C   020C 0012 0004 0190
        DECLE   $0047,  $0024,  $0201,  $000F   ; 5540   0047 0024 0201 000F
        DECLE   $0004,  $0190,  $002A,  $0051   ; 5544   0004 0190 002A 0051
        DECLE   $0209,  $0006,  $0004           ; 5548   0209 0006 0004

        ANDR    R2,     R0                      ; 554B   0190
        SWAP    R3,     2                       ; 554C   0047
        SLLC    R0,     1                       ; 554D   0058
        BC      L_5553                          ; 554E   0201 0003

        JSR     R5,     L_5F1D                  ; 5550   0004 015C 031D

L_5553:
        CLRR    R3                              ; 5553   01DB
        DECLE   $0273,  $0098,  $0004,  $0190   ; 5554   0273 0098 0004 0190
        DECLE   $002D,  $0209,  $0012,  $037B   ; 5558   002D 0209 0012 037B
        DECLE   $000A,  $020D,  $0004,  $0098   ; 555C   000A 020D 0004 0098
        DECLE   $0004                           ; 5560   0004

        ANDR    R2,     R0                      ; 5561   0190
        RSWD    R5                              ; 5562   003D
        MOVR    R3,     R4                      ; 5563   009C
        ADDR    R3,     R4                      ; 5564   00DC
        ADDR    R7,     R4                      ; 5565   00FC
        ADDI    #$0047, R4                      ; 5566   02FC 0047
        MOVR    R7,     R5                      ; 5568   00BD
        ADDI    #$0004, R5                      ; 5569   02FD 0004
        SDBD                                    ; 556B   0001
        MVI@    R4,     R7                      ; 556C   02A7

        DECLE   $02B3,  $000B,  $037B,  $000E   ; 556D   02B3 000B 037B 000E
        DECLE   $022C,  $001E,  $0004,  $0190   ; 5571   022C 001E 0004 0190
        DECLE   $002A,  $0016,  $0201,  $0027   ; 5575   002A 0016 0201 0027
        DECLE   $0281,  $01DB,  $008A,  $03B9   ; 5579   0281 01DB 008A 03B9
        DECLE   $0030,  $0204,  $000B,  $0004   ; 557D   0030 0204 000B 0004
        DECLE   $0190,  $002A,  $000D,  $0201   ; 5581   0190 002A 000D 0201
        DECLE   $0005,  $0004,  $019C,  $021E   ; 5585   0005 0004 019C 021E
        DECLE   $0200,  $0007,  $03BA,  $0080   ; 5589   0200 0007 03BA 0080
        DECLE   $0204,  $0003,  $0004           ; 558D   0204 0003 0004

        ANDR    R2,     R0                      ; 5590   0190
        ANDR    R0,     R6                      ; 5591   0186

        JSR     R5,     L_5609                  ; 5592   0004 0154 0209
        JSR     R5,     L_561C                  ; 5595   0004 0154 021C
        JSR     R5,     L_6154                  ; 5598   0004 0160 0154
        JSR     R5,     L_55C9                  ; 559B   0004 0154 01C9

        B       L_55A3                          ; 559E   0200 0003

        DECLE   $0004                           ; 55A0   0004

        ANDR    R4,     R0                      ; 55A1   01A0
        SUB@    R2,     R4                      ; 55A2   0314

L_55A3:
        JSR     R5,     L_6B5A                  ; 55A3   0004 0168 035A
        DECLE   $0004                           ; 55A6   0004

        ANDR    R5,     R4                      ; 55A7   01AC
        ADD@    R4,     R3                      ; 55A8   02E3

        JSR     R5,     L_693A                  ; 55A9   0004 0168 013A

L_55AC:
        PULR    R7                              ; 55AC   02B7

        DECLE   $006D,  $0055,  $000C,  $005C   ; 55AD   006D 0055 000C 005C
        DECLE   $00C4,  $0099,  $006D,  $0055   ; 55B1   00C4 0099 006D 0055
        DECLE   $006D,  $0055,  $00C8,  $005D   ; 55B5   006D 0055 00C8 005D
        DECLE   $006D,  $0055,  $005A,  $005B   ; 55B9   006D 0055 005A 005B
        DECLE   $006D,  $0055,  $006D,  $0055   ; 55BD   006D 0055 006D 0055
        DECLE   $0036                           ; 55C1   0036

        MOVR    R3,     R2                      ; 55C2   009A
        SETC                                    ; 55C3   0007
        TSTR    R3                              ; 55C4   009B
        SAR     R1,     2                       ; 55C5   006D
        RLC     R1,     2                       ; 55C6   0055
        ADDR    R1,     R3                      ; 55C7   00CB
        TSTR    R3                              ; 55C8   009B
L_55C9:
        PSHR    R5                              ; 55C9   0275
        DECLE   $0281,  $01C8,  $0379,  $0003   ; 55CA   0281 01C8 0379 0003
        DECLE   $022D,  $0023,  $01C0,  $02BC   ; 55CE   022D 0023 01C0 02BC
        DECLE   $027C,  $0281,  $0324,  $0065   ; 55D2   027C 0281 0324 0065
        DECLE   $0065,  $03B9,  $003F,  $0341   ; 55D6   0065 03B9 003F 0341
        DECLE   $01CF,  $020C,  $0004,  $0001   ; 55DA   01CF 020C 0004 0001
        DECLE   $02B8,  $00F9,  $0018,  $0004   ; 55DE   02B8 00F9 0018 0004

        ANDR    R5,     R4                      ; 55E2   01AC
        MVI@    R5,     R3                      ; 55E3   02AB
        PULR    R7                              ; 55E4   02B7

L_55E5:
        PSHR    R5                              ; 55E5   0275
        PSHR    R0                              ; 55E6   0270
        MVI@    R3,     R5                      ; 55E7   029D
        MOVR    R5,     R0                      ; 55E8   00A8
        MVI@    R4,     R2                      ; 55E9   02A2
        ANDI    #$001F, R0                      ; 55EA   03B8 001F
        BEQ     L_5607                          ; 55EC   0204 0019

        SUBR    R0,     R5                      ; 55EE   0105
        DECR    R0                              ; 55EF   0010
        BNEQ    L_5605                          ; 55F0   020C 0013

        MOVR    R2,     R0                      ; 55F2   0090
        MOVR    R2,     R1                      ; 55F3   0091
        ANDI    #$001F, R2                      ; 55F4   03BA 001F
        ADDI    #$0020, R5                      ; 55F6   02FD 0020
        ANDI    #$00E0, R0                      ; 55F8   03B8 00E0
        CMPR    R0,     R5                      ; 55FA   0145
        BLE     L_55FE                          ; 55FB   0206 0001

        CLRR    R5                              ; 55FD   01ED
L_55FE:
        ADDR    R2,     R5                      ; 55FE   00D5
        MVO@    R5,     R3                      ; 55FF   025D
        PULR    R0                              ; 5600   02B0

        JSR     R5,     L_5B49                  ; 5601   0004 0158 0349

        PULR    R7                              ; 5604   02B7

L_5605:
        ADDR    R5,     R0                      ; 5605   00E8
        MVO@    R0,     R3                      ; 5606   0258
L_5607:
        PULR    R0                              ; 5607   02B0
        PULR    R7                              ; 5608   02B7

L_5609:
        PSHR    R5                              ; 5609   0275
        MVII    #$0171, R3                      ; 560A   02BB 0171
        MVI     G_01C8, R4                      ; 560C   0284 01C8
        CMPI    #$00FF, R4                      ; 560E   037C 00FF
        BEQ     L_55AC                          ; 5610   0224 0065

        SDBD                                    ; 5612   0001
        ADDI    #$907C, R4                      ; 5613   02FC 007C 0090
        MVII    #$0003, R0                      ; 5616   02B8 0003

        JSR     R5,     L_55E5                  ; 5618   0004 0154 01E5

        PULR    R7                              ; 561B   02B7

L_561C:
        PSHR    R5                              ; 561C   0275
        MVII    #$0170, R3                      ; 561D   02BB 0170
        MVI     G_035C, R4                      ; 561F   0284 035C
        TSTR    R4                              ; 5621   00A4
        BEQ     L_55AC                          ; 5622   0224 0077

        ADDI    #$0002, R4                      ; 5624   02FC 0002
        MVII    #$0004, R0                      ; 5626   02B8 0004

        JSR     R5,     L_55E5                  ; 5628   0004 0154 01E5

        PULR    R7                              ; 562B   02B7

        PSHR    R5                              ; 562C   0275
L_562D:
        MVII    #$0113, R4                      ; 562D   02BC 0113
        MVII    #$000F, R0                      ; 562F   02B8 000F

        JSR     R5,     X_FILL_ZERO             ; 5631   0004 0114 0338

        MVII    #$0002, R0                      ; 5634   02B8 0002

        JSR     R5,     X_RAND1                 ; 5636   0004 0114 027D

        CMPI    #$0003, R0                      ; 5639   0378 0003
        BNEQ    L_563E                          ; 563B   020C 0001

        SLR     R0,     1                       ; 563D   0060
L_563E:
        MOVR    R0,     R1                      ; 563E   0081
        ADDR    R0,     R1                      ; 563F   00C1
        ADDR    R0,     R1                      ; 5640   00C1
        ADDI    #$0004, R1                      ; 5641   02F9 0004
        MVII    #$0003, R0                      ; 5643   02B8 0003

        JSR     R5,     X_RAND1                 ; 5645   0004 0114 027D

        CMPI    #$0005, R0                      ; 5648   0378 0005
        BLT     L_564E                          ; 564A   0205 0002

        SUBI    #$0005, R0                      ; 564C   0338 0005

L_564E:
        JSR     R5,     X_POW2                  ; 564E   0004 0114 0345

        NEGR    R0                              ; 5651   0020
        DECR    R0                              ; 5652   0010
        ANDI    #$000F, R0                      ; 5653   03B8 000F
        MOVR    R0,     R2                      ; 5655   0082
        ADDI    #$0080, R0                      ; 5656   02F8 0080
        MOVR    R1,     R5                      ; 5658   008D
        ADDI    #$0113, R5                      ; 5659   02FD 0113
        MVO@    R0,     R5                      ; 565B   0268
        CLRR    R3                              ; 565C   01DB
L_565D:
        MOVR    R3,     R0                      ; 565D   0098

        JSR     R5,     X_POW2                  ; 565E   0004 0114 0345

        ANDR    R2,     R0                      ; 5661   0190
        BEQ     L_5676                          ; 5662   0204 0012

        PSHR    R1                              ; 5664   0271
        PSHR    R2                              ; 5665   0272
        SLL     R1,     2                       ; 5666   004D
        SLL     R1,     2                       ; 5667   004D
        ADDR    R1,     R3                      ; 5668   00CB
        MVII    #$031E, R4                      ; 5669   02BC 031E
        MVO     R3,     G_031E                  ; 566B   0243 031E

        JSR     R5,     L_568D                  ; 566D   0004 0154 028D

        PULR    R2                              ; 5670   02B2
        PULR    R1                              ; 5671   02B1
        MVI     G_031E, R3                      ; 5672   0283 031E
        ANDI    #$000F, R3                      ; 5674   03BB 000F
L_5676:
        INCR    R3                              ; 5676   000B
        CMPI    #$0004, R3                      ; 5677   037B 0004
        BLT     L_565D                          ; 5679   0225 001D

        MVII    #$0113, R4                      ; 567B   02BC 0113
        MVII    #$000F, R1                      ; 567D   02B9 000F
        CLRR    R2                              ; 567F   01D2
L_5680:
        MVI@    R4,     R0                      ; 5680   02A0
        TSTR    R0                              ; 5681   0080
        BNEQ    L_5685                          ; 5682   020C 0001

        INCR    R2                              ; 5684   000A
L_5685:
        DECR    R1                              ; 5685   0011
        BNEQ    L_5680                          ; 5686   022C 0007

        CMPI    #$0005, R2                      ; 5688   037A 0005
        BGE     L_562D                          ; 568A   022D 005E
        PULR    R7                              ; 568C   02B7

L_568D:
        PSHR    R5                              ; 568D   0275
L_568E:
        MVI@    R4,     R0                      ; 568E   02A0
        DECR    R4                              ; 568F   0014
        MOVR    R0,     R1                      ; 5690   0081
        ANDI    #$000F, R1                      ; 5691   03B9 000F
        MOVR    R0,     R2                      ; 5693   0082
        SLR     R2,     2                       ; 5694   0066
        SLR     R2,     2                       ; 5695   0066
        ANDI    #$000F, R2                      ; 5696   03BA 000F
        SWAP    R0,     1                       ; 5698   0040
        ANDI    #$00FF, R0                      ; 5699   03B8 00FF
        MOVR    R1,     R3                      ; 569B   008B
        XORI    #$0001, R1                      ; 569C   03F9 0001
        SARC    R3,     1                       ; 569E   007B
        SLL     R3,     1                       ; 569F   004B
        INCR    R3                              ; 56A0   000B
        ADCR    R7                              ; 56A1   002F

        NEGR    R3                              ; 56A2   0023
L_56A3:
        ADDR    R3,     R2                      ; 56A3   00DA
        MOVR    R2,     R3                      ; 56A4   0093
        ADDI    #$0113, R3                      ; 56A5   02FB 0113
        MOVR    R1,     R0                      ; 56A7   0088

        JSR     R5,     X_POW2                  ; 56A8   0004 0114 0345

        MVI@    R3,     R5                      ; 56AB   029D
        COMR    R0                              ; 56AC   0018
        ANDR    R0,     R5                      ; 56AD   0185
        COMR    R0                              ; 56AE   0018
        XORR    R0,     R5                      ; 56AF   01C5
        MVO@    R5,     R3                      ; 56B0   025D
        MOVR    R5,     R0                      ; 56B1   00A8
        SWAP    R0,     2                       ; 56B2   0044
        BMI     L_5731                          ; 56B3   020B 007C

        XORI    #$0080, R5                      ; 56B5   03FD 0080
        MVO@    R5,     R3                      ; 56B7   025D
        MOVR    R1,     R0                      ; 56B8   0088
        SLL     R0,     2                       ; 56B9   004C
        SLL     R0,     2                       ; 56BA   004C
        ADDR    R2,     R0                      ; 56BB   00D0
        SLL     R0,     2                       ; 56BC   004C
        SLL     R0,     2                       ; 56BD   004C
        ADDR    R1,     R0                      ; 56BE   00C8
        INCR    R4                              ; 56BF   000C
        MVO@    R0,     R4                      ; 56C0   0260
        SUBI    #$0002, R4                      ; 56C1   033C 0002
L_56C3:
        INCR    R4                              ; 56C3   000C
        MVI@    R4,     R2                      ; 56C4   02A2
        SUBI    #$0002, R4                      ; 56C5   033C 0002
        MOVR    R2,     R1                      ; 56C7   0091
        ANDI    #$000F, R1                      ; 56C8   03B9 000F
        SLR     R2,     2                       ; 56CA   0066
        SLR     R2,     2                       ; 56CB   0066
        ANDI    #$000F, R2                      ; 56CC   03BA 000F
        INCR    R1                              ; 56CE   0009
        ANDI    #$0003, R1                      ; 56CF   03B9 0003
        INCR    R4                              ; 56D1   000C
        MVI@    R4,     R0                      ; 56D2   02A0
        SLR     R0,     2                       ; 56D3   0064
        SLR     R0,     2                       ; 56D4   0064
        SLL     R0,     2                       ; 56D5   004C
        SLL     R0,     2                       ; 56D6   004C
        ADDR    R1,     R0                      ; 56D7   00C8
        DECR    R4                              ; 56D8   0014
        MVO@    R0,     R4                      ; 56D9   0260
        SUBI    #$0002, R4                      ; 56DA   033C 0002
        MOVR    R2,     R3                      ; 56DC   0093
        ADDI    #$0113, R3                      ; 56DD   02FB 0113
        MOVR    R1,     R0                      ; 56DF   0088

        JSR     R5,     X_POW2                  ; 56E0   0004 0114 0345

        MVO     R0,     G_015D                  ; 56E3   0240 015D
        AND@    R3,     R0                      ; 56E5   0398
        BNEQ    L_5724                          ; 56E6   020C 003C

        MVI     G_015D, R0                      ; 56E8   0280 015D
        MOVR    R2,     R5                      ; 56EA   0095
        ADDR    R7,     R5                      ; 56EB   00FD
        ADDI    #$0056, R5                      ; 56EC   02FD 0056
        AND@    R5,     R0                      ; 56EE   03A8
        BEQ     L_5724                          ; 56EF   0204 0033

        MOVR    R1,     R0                      ; 56F1   0088
        SARC    R0,     1                       ; 56F2   0078
        SLL     R0,     1                       ; 56F3   0048
        INCR    R0                              ; 56F4   0008
        ADCR    R7                              ; 56F5   002F

        NEGR    R0                              ; 56F6   0020
L_56F7:
        MOVR    R0,     R5                      ; 56F7   0085
        ADDR    R3,     R5                      ; 56F8   00DD
        MVI@    R5,     R0                      ; 56F9   02A8
        SWAP    R0,     2                       ; 56FA   0044
        BPL     L_5702                          ; 56FB   0203 0005

        MVII    #$0001, R0                      ; 56FD   02B8 0001
        PSHR    R0                              ; 56FF   0270
        B       L_5705                          ; 5700   0200 0003

L_5702:
        MVII    #$000A, R0                      ; 5702   02B8 000A
        PSHR    R0                              ; 5704   0270
L_5705:
        MVII    #$0004, R0                      ; 5705   02B8 0004

        JSR     R5,     X_RAND1                 ; 5707   0004 0114 027D

        CMP@    R6,     R0                      ; 570A   0370
        BGE     L_5724                          ; 570B   020D 0017

        MVI@    R3,     R5                      ; 570D   029D
        MVI     G_015D, R0                      ; 570E   0280 015D
        COMR    R0                              ; 5710   0018
        ANDR    R0,     R5                      ; 5711   0185
        COMR    R0                              ; 5712   0018
        XORR    R0,     R5                      ; 5713   01C5
        MVO@    R5,     R3                      ; 5714   025D
        MVI@    R4,     R2                      ; 5715   02A2
        SWAP    R2,     1                       ; 5716   0042
        ANDI    #$00FF, R2                      ; 5717   03BA 00FF
        MVI@    R4,     R0                      ; 5719   02A0
        ANDI    #$00FF, R0                      ; 571A   03B8 00FF
        SWAP    R0,     1                       ; 571C   0040
        INCR    R2                              ; 571D   000A
        ADDR    R2,     R0                      ; 571E   00D0
        SWAP    R0,     1                       ; 571F   0040
        MVO@    R0,     R4                      ; 5720   0260
        DECR    R4                              ; 5721   0014
        B       L_568E                          ; 5722   0220 0095

L_5724:
        INCR    R4                              ; 5724   000C
        MVI@    R4,     R0                      ; 5725   02A0
        SUBI    #$0002, R4                      ; 5726   033C 0002
        MOVR    R0,     R1                      ; 5728   0081
        SWAP    R1,     1                       ; 5729   0041
        ANDI    #$000F, R1                      ; 572A   03B9 000F
        ANDI    #$000F, R0                      ; 572C   03B8 000F
        CMPR    R0,     R1                      ; 572E   0141
        BNEQ    L_56C3                          ; 572F   022C 006D

L_5731:
        MVI@    R4,     R0                      ; 5731   02A0
        DECR    R4                              ; 5732   0014
        SWAP    R0,     1                       ; 5733   0040
        ANDI    #$00FF, R0                      ; 5734   03B8 00FF
        BEQ     L_5741                          ; 5736   0204 0009

        SUBI    #$0002, R4                      ; 5738   033C 0002
        MVI@    R4,     R0                      ; 573A   02A0
        DECR    R4                              ; 573B   0014
        SWAP    R0,     1                       ; 573C   0040
        ANDI    #$00FF, R0                      ; 573D   03B8 00FF
        BNEQ    L_5724                          ; 573F   022C 001C
L_5741:
        PULR    R7                              ; 5741   02B7

        INCR    R2                              ; 5742   000A
        INCR    R3                              ; 5743   000B
        INCR    R1                              ; 5744   0009
        INCR    R6                              ; 5745   000E
        INCR    R7                              ; 5746   000F

        INCR    R5                              ; 5747   000D
L_5748:
        INCR    R6                              ; 5748   000E
        INCR    R7                              ; 5749   000F

        INCR    R5                              ; 574A   000D
L_574B:
        INCR    R6                              ; 574B   000E
        INCR    R7                              ; 574C   000F

        INCR    R5                              ; 574D   000D
L_574E:
        CLRC                                    ; 574E   0006
        DECLE   $0007,  $0005                   ; 574F   0007 0005
L_5751:
        PSHR    R5                              ; 5751   0275
        MVI     G_0319, R1                      ; 5752   0281 0319
        TSTR    R1                              ; 5754   0089
        BEQ     L_5785                          ; 5755   0204 002E

        CLRC                                    ; 5757   0006
        RRC     R1,     1                       ; 5758   0071
        BC      L_57B6                          ; 5759   0201 005B

        RRC     R1,     1                       ; 575B   0071
        BC      L_57C7                          ; 575C   0201 0069

L_575E:
        RRC     R1,     1                       ; 575E   0071
        BC      L_57F1                          ; 575F   0201 0090

L_5761:
        RRC     R1,     1                       ; 5761   0071
        BC      L_5819                          ; 5762   0201 00B5

L_5764:
        RRC     R1,     1                       ; 5764   0071
        BC      L_5835                          ; 5765   0201 00CE

L_5767:
        RRC     R1,     1                       ; 5767   0071
        BC      L_5866                          ; 5768   0201 00FC

L_576A:
        RRC     R1,     1                       ; 576A   0071
        BC      L_5880                          ; 576B   0201 0113

L_576D:
        RRC     R1,     1                       ; 576D   0071
        BC      L_5899                          ; 576E   0201 0129

L_5770:
        RRC     R1,     1                       ; 5770   0071
        MOVR    R7,     R2                      ; 5771   00BA
        BC      L_58D1                          ; 5772   0201 015D

        RRC     R1,     1                       ; 5774   0071
        BNC     L_577A                          ; 5775   0209 0003

        MOVR    R7,     R2                      ; 5777   00BA
        B       L_5922                          ; 5778   0200 01A8

L_577A:
        RRC     R1,     1                       ; 577A   0071
        BC      L_58EF                          ; 577B   0201 0172

        RRC     R1,     1                       ; 577D   0071
        BC      L_5901                          ; 577E   0201 0181

L_5780:
        CLRR    R1                              ; 5780   01C9
        MVO     R1,     G_0319                  ; 5781   0241 0319
L_5783:
        B       L_57B2                          ; 5783   0200 002D

L_5785:
        MVI     .BTAB.1C,R1                     ; 5785   0281 021C
        SDBD                                    ; 5787   0001
        XORI    #$8000, R1                      ; 5788   03F9 0000 0080
        MVO     R1,     .BTAB.1C                ; 578B   0241 021C
        RLC     R1,     1                       ; 578D   0051
        MVII    #$00F0, R1                      ; 578E   02B9 00F0
        ADCR    R7                              ; 5790   002F

        COMR    R1                              ; 5791   0019
L_5792:
        MVI     G_0173, R2                      ; 5792   0282 0173
        ANDR    R2,     R1                      ; 5794   0191
        BEQ     L_57B2                          ; 5795   0204 001B

        XORR    R1,     R2                      ; 5797   01CA
        MVO     R2,     G_0173                  ; 5798   0242 0173
        SARC    R1,     1                       ; 579A   0079
        BC      L_5944                          ; 579B   0201 01A7

L_579D:
        SARC    R1,     1                       ; 579D   0079
        DECLE   $0201,  $0245                   ; 579E   0201 0245

        SARC    R1,     1                       ; 57A0   0079
        BC      L_5A48                          ; 57A1   0201 02A5

L_57A3:
        SARC    R1,     1                       ; 57A3   0079
        BC      L_5A78                          ; 57A4   0201 02D2

L_57A6:
        SARC    R1,     1                       ; 57A6   0079
        BC      L_5AA6                          ; 57A7   0201 02FD

L_57A9:
        SARC    R1,     1                       ; 57A9   0079
        BC      L_5AAD                          ; 57AA   0201 0301

L_57AC:
        SARC    R1,     1                       ; 57AC   0079
        BC      L_5AAF                          ; 57AD   0201 0300

L_57AF:
        SARC    R1,     1                       ; 57AF   0079
        BC      L_5AB6                          ; 57B0   0201 0304

L_57B2:
        JSR     R5,     L_5E0B                  ; 57B2   0004 015C 020B

        PULR    R7                              ; 57B5   02B7

L_57B6:
        MVII    #$0010, R1                      ; 57B6   02B9 0010
        SDBD                                    ; 57B8   0001
        MVII    #$3800, R4                      ; 57B9   02BC 0000 0038

        JSR     R5,     L_5AE4                  ; 57BC   0004 0158 02E4

        MVI     G_0319, R1                      ; 57BF   0281 0319
        ANDI    #$00FE, R1                      ; 57C1   03B9 00FE
        MVO     R1,     G_0319                  ; 57C3   0241 0319
        B       L_5783                          ; 57C5   0220 0043

L_57C7:
        PSHR    R1                              ; 57C7   0271
        MVI     G_0188, R1                      ; 57C8   0281 0188
        SLL     R1,     2                       ; 57CA   004D
        SLL     R1,     1                       ; 57CB   0049
        SDBD                                    ; 57CC   0001
        ADDI    #$3800, R1                      ; 57CD   02F9 0000 0038
        MVI     G_0184, R3                      ; 57D0   0283 0184
        ADDR    R7,     R3                      ; 57D2   00FB
        ADDI    #$02EA, R3                      ; 57D3   02FB 02EA
        ADD@    R3,     R1                      ; 57D5   02D9
        ADDI    #$0005, R3                      ; 57D6   02FB 0005
        MVI@    R3,     R0                      ; 57D8   0298
        MVII    #$031E, R4                      ; 57D9   02BC 031E

        JSR     R5,     L_5AF2                  ; 57DB   0004 0158 02F2

        MVII    #$0006, R0                      ; 57DE   02B8 0006
        SUB@    R3,     R0                      ; 57E0   0318
        CMPI    #$0006, R0                      ; 57E1   0378 0006
        BEQ     L_57EE                          ; 57E3   0204 0009

        MOVR    R5,     R1                      ; 57E5   00A9
        ADDI    #$0018, R1                      ; 57E6   02F9 0018
        MVII    #$031E, R4                      ; 57E8   02BC 031E
        ADDR    R0,     R4                      ; 57EA   00C4

        JSR     R5,     L_5AF2                  ; 57EB   0004 0158 02F2

L_57EE:
        PULR    R1                              ; 57EE   02B1
        B       L_575E                          ; 57EF   0220 0092

L_57F1:
        PSHR    R1                              ; 57F1   0271
        MVI     G_0188, R1                      ; 57F2   0281 0188
        SLL     R1,     2                       ; 57F4   004D
        SLL     R1,     1                       ; 57F5   0049
        SDBD                                    ; 57F6   0001
        ADDI    #$3800, R1                      ; 57F7   02F9 0000 0038
        MVI     G_0184, R3                      ; 57FA   0283 0184
        ADDR    R7,     R3                      ; 57FC   00FB
        ADDI    #$02C0, R3                      ; 57FD   02FB 02C0
        ADD@    R3,     R1                      ; 57FF   02D9
        MOVR    R1,     R4                      ; 5800   008C
        ADDI    #$0005, R3                      ; 5801   02FB 0005
        MVI@    R3,     R0                      ; 5803   0298
        MVII    #$031E, R1                      ; 5804   02B9 031E

        JSR     R5,     L_5B1A                  ; 5806   0004 0158 031A

        MVII    #$0006, R0                      ; 5809   02B8 0006
        SUB@    R3,     R0                      ; 580B   0318
        CMPI    #$0006, R0                      ; 580C   0378 0006
        BEQ     L_5816                          ; 580E   0204 0006

        ADDI    #$0018, R4                      ; 5810   02FC 0018
        MOVR    R5,     R1                      ; 5812   00A9

        JSR     R5,     L_5B1A                  ; 5813   0004 0158 031A

L_5816:
        PULR    R1                              ; 5816   02B1
        B       L_5761                          ; 5817   0220 00B7

L_5819:
        PSHR    R1                              ; 5819   0271
        SDBD                                    ; 581A   0001
        MVII    #$3900, R1                      ; 581B   02B9 0000 0039
        MVI     G_0144, R2                      ; 581E   0282 0144
        MVII    #$012A, R3                      ; 5820   02BB 012A
L_5822:
        DECR    R2                              ; 5822   0012
        BMI     L_5832                          ; 5823   020B 000D

        MVI@    R3,     R4                      ; 5825   029C
        ANDI    #$00F8, R4                      ; 5826   03BC 00F8
        SDBD                                    ; 5828   0001
        ADDI    #$AA78, R4                      ; 5829   02FC 0078 00AA

        JSR     R5,     L_5AD0                  ; 582C   0004 0158 02D0

        INCR    R3                              ; 582F   000B
        B       L_5822                          ; 5830   0220 000F

L_5832:
        PULR    R1                              ; 5832   02B1
        B       L_5764                          ; 5833   0220 00D0

L_5835:
        SDBD                                    ; 5835   0001
        MVII    #$38B2, R4                      ; 5836   02BC 00B2 0038
        MOVR    R4,     R5                      ; 5839   00A5
        ADDI    #$0006, R5                      ; 583A   02FD 0006
        CLRR    R0                              ; 583C   01C0
        MVO@    R0,     R5                      ; 583D   0268
        MVO@    R0,     R5                      ; 583E   0268
        MVI     G_010E, R2                      ; 583F   0282 010E
        ANDI    #$0003, R2                      ; 5841   03BA 0003
        INCR    R2                              ; 5843   000A
        ADDR    R7,     R2                      ; 5844   00FA
        ADD@    R2,     R7                      ; 5845   02D7

        DECLE   $001E,  $0004                   ; 5846   001E 0004

        INCR    R4                              ; 5848   000C
        DECR    R2                              ; 5849   0012
        MVO@    R0,     R5                      ; 584A   0268
        MVO@    R0,     R5                      ; 584B   0268
        MVO@    R0,     R5                      ; 584C   0268
        MVO@    R0,     R5                      ; 584D   0268
        ADDI    #$0004, R4                      ; 584E   02FC 0004
        B       L_5860                          ; 5850   0200 000E

        MVO@    R0,     R5                      ; 5852   0268
        MVO@    R0,     R5                      ; 5853   0268
        ADDI    #$0002, R4                      ; 5854   02FC 0002
        B       L_585C                          ; 5856   0200 0004

        MVI@    R4,     R0                      ; 5858   02A0
        MVO@    R0,     R5                      ; 5859   0268
        MVI@    R4,     R0                      ; 585A   02A0
        MVO@    R0,     R5                      ; 585B   0268
L_585C:
        MVI@    R4,     R0                      ; 585C   02A0
        MVO@    R0,     R5                      ; 585D   0268
        MVI@    R4,     R0                      ; 585E   02A0
        MVO@    R0,     R5                      ; 585F   0268
L_5860:
        MVI@    R4,     R0                      ; 5860   02A0
        MVO@    R0,     R5                      ; 5861   0268
        MVI@    R4,     R0                      ; 5862   02A0
        MVO@    R0,     R5                      ; 5863   0268
        B       L_5767                          ; 5864   0220 00FE

L_5866:
        PSHR    R1                              ; 5866   0271
        SDBD                                    ; 5867   0001
        MVII    #$3940, R1                      ; 5868   02B9 0040 0039
        MVII    #$0008, R2                      ; 586B   02BA 0008
        MVII    #$0132, R3                      ; 586D   02BB 0132
L_586F:
        MVI@    R3,     R4                      ; 586F   029C
        ANDI    #$00F8, R4                      ; 5870   03BC 00F8
        SDBD                                    ; 5872   0001
        ADDI    #$AA78, R4                      ; 5873   02FC 0078 00AA

        JSR     R5,     L_5AD0                  ; 5876   0004 0158 02D0

        INCR    R3                              ; 5879   000B
        DECR    R2                              ; 587A   0012
        BNEQ    L_586F                          ; 587B   022C 000D

        PULR    R1                              ; 587D   02B1
        B       L_576A                          ; 587E   0220 0115

L_5880:
        PSHR    R1                              ; 5880   0271
        SDBD                                    ; 5881   0001
        MVII    #$38F8, R1                      ; 5882   02B9 00F8 0038
        SDBD                                    ; 5885   0001
        MVII    #$5431, R4                      ; 5886   02BC 0031 0054
        MVI     G_0324, R0                      ; 5889   0280 0324
        ANDI    #$000F, R0                      ; 588B   03B8 000F
        CMP     G_0186, R0                      ; 588D   0340 0186
        BEQ     L_5893                          ; 588F   0204 0002

        SUBI    #$0008, R4                      ; 5891   033C 0008

L_5893:
        JSR     R5,     L_5AD0                  ; 5893   0004 0158 02D0

        PULR    R1                              ; 5896   02B1
        B       L_576D                          ; 5897   0220 012B

L_5899:
        PSHR    R1                              ; 5899   0271
        MVI     G_01D9, R2                      ; 589A   0282 01D9
        SLR     R2,     2                       ; 589C   0066
        MOVR    R2,     R3                      ; 589D   0093
        ANDI    #$0003, R3                      ; 589E   03BB 0003
        SLR     R2,     2                       ; 58A0   0066
        SDBD                                    ; 58A1   0001
        MVII    #$38A0, R4                      ; 58A2   02BC 00A0 0038
        MVII    #$0001, R1                      ; 58A5   02B9 0001

        JSR     R5,     L_5AE4                  ; 58A7   0004 0158 02E4

        INCR    R3                              ; 58AA   000B
        ADDR    R7,     R3                      ; 58AB   00FB
        ADD@    R3,     R7                      ; 58AC   02DF

        JSRE    R4,     .EXEC.406               ; 58AD   0004 0015 0006

        COMR    R1                              ; 58B0   0019
        SUBI    #$0007, R4                      ; 58B1   033C 0007
        DECR    R4                              ; 58B3   0014
        MVII    #$00FF, R0                      ; 58B4   02B8 00FF
        SUBI    #$0009, R2                      ; 58B6   033A 0009
L_58B8:
        INCR    R2                              ; 58B8   000A
        BEQ     L_58BE                          ; 58B9   0204 0003

        SLR     R0,     1                       ; 58BB   0060
        B       L_58B8                          ; 58BC   0220 0005

L_58BE:
        MVO@    R0,     R4                      ; 58BE   0260
        PULR    R1                              ; 58BF   02B1
        B       L_5770                          ; 58C0   0220 0151

        MVII    #$0003, R0                      ; 58C2   02B8 0003
        B       L_58C8                          ; 58C4   0200 0002

        MVII    #$00C0, R0                      ; 58C6   02B8 00C0
L_58C8:
        MOVR    R4,     R3                      ; 58C8   00A3
L_58C9:
        DECR    R3                              ; 58C9   0013
        MVO@    R0,     R3                      ; 58CA   0258
        DECR    R2                              ; 58CB   0012
        BNEQ    L_58C9                          ; 58CC   022C 0004

        PULR    R1                              ; 58CE   02B1
        B       L_5770                          ; 58CF   0220 0160

L_58D1:
        PSHR    R1                              ; 58D1   0271
        SDBD                                    ; 58D2   0001
        MVII    #$39A0, R4                      ; 58D3   02BC 00A0 0039
        MVII    #$0002, R1                      ; 58D6   02B9 0002

        JSR     R5,     L_5AE4                  ; 58D8   0004 0158 02E4

        SDBD                                    ; 58DB   0001
        MVII    #$9FAD, R4                      ; 58DC   02BC 00AD 009F
        MVII    #$0005, R0                      ; 58DF   02B8 0005
L_58E1:
        SDBD                                    ; 58E1   0001
        MVII    #$38C0, R1                      ; 58E2   02B9 00C0 0038

L_58E5:
        JSR     R5,     L_5AD0                  ; 58E5   0004 0158 02D0

        DECR    R0                              ; 58E8   0010
        BNEQ    L_58E5                          ; 58E9   022C 0005

        PULR    R1                              ; 58EB   02B1
        ADDI    #$0002, R2                      ; 58EC   02FA 0002
        MOVR    R2,     R7                      ; 58EE   0097

L_58EF:
        PSHR    R1                              ; 58EF   0271
        SDBD                                    ; 58F0   0001
        MVII    #$98D0, R4                      ; 58F1   02BC 00D0 0098
        MVII    #$0006, R0                      ; 58F4   02B8 0006
        MOVR    R7,     R2                      ; 58F6   00BA
        B       L_58E1                          ; 58F7   0220 0017

        SDBD                                    ; 58F9   0001
        MVII    #$0800, R1                      ; 58FA   02B9 0000 0008
        MVO     R1,     G_0319                  ; 58FD   0241 0319
        B       L_57B2                          ; 58FF   0220 014E

L_5901:
        PSHR    R1                              ; 5901   0271
        SDBD                                    ; 5902   0001
        MVII    #$9900, R4                      ; 5903   02BC 0000 0099
        SDBD                                    ; 5906   0001
        MVII    #$3908, R1                      ; 5907   02B9 0008 0039

        JSR     R5,     L_5AD0                  ; 590A   0004 0158 02D0
        JSR     R5,     L_5AD0                  ; 590D   0004 0158 02D0
        JSR     R5,     L_5AD0                  ; 5910   0004 0158 02D0
        JSR     R5,     L_5AD0                  ; 5913   0004 0158 02D0
        JSR     R5,     L_5AD0                  ; 5916   0004 0158 02D0
        JSR     R5,     L_5AD0                  ; 5919   0004 0158 02D0
        JSR     R5,     L_5AD0                  ; 591C   0004 0158 02D0

        PULR    R1                              ; 591F   02B1
        B       L_5780                          ; 5920   0220 01A1

L_5922:
        PSHR    R1                              ; 5922   0271
        CLRR    R1                              ; 5923   01C9
        SDBD                                    ; 5924   0001
        MVII    #$39C0, R4                      ; 5925   02BC 00C0 0039
        MVO@    R1,     R4                      ; 5928   0261
        MVO@    R1,     R4                      ; 5929   0261
        ADDI    #$0006, R4                      ; 592A   02FC 0006
        MVO@    R1,     R4                      ; 592C   0261
        MVO@    R1,     R4                      ; 592D   0261
        MVO@    R1,     R4                      ; 592E   0261
        MVO@    R1,     R4                      ; 592F   0261
        MVO@    R1,     R4                      ; 5930   0261
        MVO@    R1,     R4                      ; 5931   0261
        MVO@    R1,     R4                      ; 5932   0261
        MVII    #$0020, R1                      ; 5933   02B9 0020
        MVO@    R1,     R4                      ; 5935   0261
        MVI     G_0173, R1                      ; 5936   0281 0173
        ANDI    #$00BF, R1                      ; 5938   03B9 00BF
        MVO     R1,     G_0173                  ; 593A   0241 0173
        SDBD                                    ; 593C   0001
        MVII    #$53F1, R4                      ; 593D   02BC 00F1 0053
        MVII    #$0006, R0                      ; 5940   02B8 0006
        B       L_58E1                          ; 5942   0220 0062

L_5944:
        PSHR    R1                              ; 5944   0271
        DECLE   $0004                           ; 5945   0004

        ANDR    R2,     R0                      ; 5946   0190
        ADCR    R2                              ; 5947   002A
        DECR    R6                              ; 5948   0016
        BC      L_59BC                          ; 5949   0201 0071

        MVI     G_016F, R3                      ; 594B   0283 016F
        SLR     R3,     1                       ; 594D   0063
        ANDI    #$0070, R3                      ; 594E   03BB 0070
        MOVR    R3,     R4                      ; 5950   009C
        SDBD                                    ; 5951   0001
        ADDI    #$FD70, R4                      ; 5952   02FC 0070 00FD
        SDBD                                    ; 5955   0001
        MVII    #$39A0, R1                      ; 5956   02B9 00A0 0039

        JSR     R5,     L_5AD0                  ; 5959   0004 0158 02D0
        JSR     R5,     L_5AD0                  ; 595C   0004 0158 02D0

        SLR     R3,     2                       ; 595F   0067
        SLR     R3,     2                       ; 5960   0067
        MOVR    R3,     R4                      ; 5961   009C
        ADD     G_01E1, R4                      ; 5962   02C4 01E1
        ADDR    R7,     R4                      ; 5964   00FC
        ADDI    #$0049, R4                      ; 5965   02FC 0049
        MVI@    R4,     R4                      ; 5967   02A4
        SDBD                                    ; 5968   0001
        ADDI    #$FDE0, R4                      ; 5969   02FC 00E0 00FD
        SDBD                                    ; 596C   0001
        MVII    #$39C2, R5                      ; 596D   02BD 00C2 0039
        MVI@    R4,     R1                      ; 5970   02A1
        MVO@    R1,     R5                      ; 5971   0269
        MVI@    R4,     R1                      ; 5972   02A1
        MVO@    R1,     R5                      ; 5973   0269
        MVI@    R4,     R1                      ; 5974   02A1
        MVO@    R1,     R5                      ; 5975   0269
        MVI@    R4,     R1                      ; 5976   02A1
        MVO@    R1,     R5                      ; 5977   0269
        MVI@    R4,     R1                      ; 5978   02A1
        MVO@    R1,     R5                      ; 5979   0269
        MVI@    R4,     R1                      ; 597A   02A1
        MVO@    R1,     R5                      ; 597B   0269
        MVII    #$000B, R1                      ; 597C   02B9 000B
        INCR    R3                              ; 597E   000B
        ADDR    R7,     R3                      ; 597F   00FB
        ADD@    R3,     R7                      ; 5980   02DF

        COMR    R4                              ; 5981   001C
        SETC                                    ; 5982   0007
        COMR    R1                              ; 5983   0019
        INCR    R5                              ; 5984   000D
        COMR    R1                              ; 5985   0019
        SETC                                    ; 5986   0007
        COMR    R4                              ; 5987   001C
        SDBD                                    ; 5988   0001
        MVII    #$FE17, R4                      ; 5989   02BC 0017 00FE
        B       L_59A1                          ; 598C   0200 0013

        SDBD                                    ; 598E   0001
        MVII    #$39B5, R4                      ; 598F   02BC 00B5 0039
        MOVR    R4,     R5                      ; 5992   00A5
        DECR    R5                              ; 5993   0015
L_5994:
        MVI@    R4,     R0                      ; 5994   02A0
        SLL     R0,     1                       ; 5995   0048
        MVO@    R0,     R5                      ; 5996   0268
        DECR    R1                              ; 5997   0011
        BNEQ    L_5994                          ; 5998   022C 0005

        PULR    R1                              ; 599A   02B1
        B       L_579D                          ; 599B   0220 01FF

        SDBD                                    ; 599D   0001
        MVII    #$FE16, R4                      ; 599E   02BC 0016 00FE
L_59A1:
        SDBD                                    ; 59A1   0001
        MVII    #$39B0, R1                      ; 59A2   02B9 00B0 0039

        JSR     R5,     L_5AD0                  ; 59A5   0004 0158 02D0
        JSR     R5,     L_5AD0                  ; 59A8   0004 0158 02D0

        PULR    R1                              ; 59AB   02B1
        B       L_579D                          ; 59AC   0220 0210

        DECLE   $0000,  $0006,  $000C,  $0000   ; 59AE   0000 0006 000C 0000
        DECLE   $0000                           ; 59B2   0000

        DECR    R2                              ; 59B3   0012
        INCR    R4                              ; 59B4   000C
        COMR    R0                              ; 59B5   0018
        COMR    R6                              ; 59B6   001E
        NEGR    R4                              ; 59B7   0024
        COMR    R0                              ; 59B8   0018
        COMR    R0                              ; 59B9   0018
        ADCR    R2                              ; 59BA   002A
        GSWD    R0                              ; 59BB   0030
L_59BC:
        MVI     G_016F, R3                      ; 59BC   0283 016F
        ANDI    #$0038, R3                      ; 59BE   03BB 0038
        SDBD                                    ; 59C0   0001
        MVII    #$FE27, R4                      ; 59C1   02BC 0027 00FE
        ADDR    R3,     R4                      ; 59C4   00DC
        SLL     R3,     2                       ; 59C5   004F
        ADDR    R3,     R4                      ; 59C6   00DC
        SDBD                                    ; 59C7   0001
        MVII    #$3980, R1                      ; 59C8   02B9 0080 0039

        JSR     R5,     L_5AC7                  ; 59CB   0004 0158 02C7
        DECLE   $0004                           ; 59CE   0004

        SUBI    #$00B8, R1                      ; 59CF   0339 00B8

        JSR     R5,     L_5AD0                  ; 59D1   0004 0158 02D0

        PULR    R1                              ; 59D4   02B1
        MVI     G_0173, R1                      ; 59D5   0281 0173
        XORI    #$0002, R1                      ; 59D7   03F9 0002
        MVO     R1,     G_0173                  ; 59D9   0241 0173
        MVI     .BTAB.1C,R1                     ; 59DB   0281 021C
        SDBD                                    ; 59DD   0001
        XORI    #$8000, R1                      ; 59DE   03F9 0000 0080
        MVO     R1,     .BTAB.1C                ; 59E1   0241 021C
        B       L_57B2                          ; 59E3   0220 0232

        DECLE   $0004,  $0190,  $002A,  $0016   ; 59E5   0004 0190 002A 0016
        DECLE   $0229,  $024A,  $00B9,  $02F9   ; 59E9   0229 024A 00B9 02F9
        DECLE   $001B,  $02C1,  $01E2,  $008A   ; 59ED   001B 02C1 01E2 008A
        DECLE   $02FA,  $0008,  $0001,  $02BC   ; 59F1   02FA 0008 0001 02BC
        DECLE   $00A0,  $0039,  $00A5,  $02FD   ; 59F5   00A0 0039 00A5 02FD
        DECLE   $0008,  $0288,  $0268,  $0040   ; 59F9   0008 0288 0268 0040
        DECLE   $0260,  $0009,  $0151,  $022C   ; 59FD   0260 0009 0151 022C
        DECLE   $0007,  $0004                   ; 5A01   0007 0004

        ANDR    R3,     R4                      ; 5A03   019C
        PULR    R1                              ; 5A04   02B1
        B       L_57B2                          ; 5A05   0220 0254

        DECLE   $0000,  $0100,  $0380,  $0380   ; 5A07   0000 0100 0380 0380
        DECLE   $0380,  $0380,  $0380,  $0100   ; 5A0B   0380 0380 0380 0100
        DECLE   $0000,  $0080,  $01C0,  $01C0   ; 5A0F   0000 0080 01C0 01C0
        DECLE   $01C0,  $01C0,  $01C0,  $0080   ; 5A13   01C0 01C0 01C0 0080
        DECLE   $0000,  $0040,  $00E0,  $00E0   ; 5A17   0000 0040 00E0 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $0040   ; 5A1B   00E0 00E0 00E0 0040
        DECLE   $0000,  $0020,  $0070,  $0070   ; 5A1F   0000 0020 0070 0070
        DECLE   $0070,  $0070,  $0070,  $0020   ; 5A23   0070 0070 0070 0020
        DECLE   $0000,  $0010,  $0038,  $0038   ; 5A27   0000 0010 0038 0038
        DECLE   $0038,  $0038,  $0038,  $0010   ; 5A2B   0038 0038 0038 0010
        DECLE   $0000,  $0008,  $001C,  $001C   ; 5A2F   0000 0008 001C 001C
        DECLE   $001C,  $001C,  $001C,  $0008   ; 5A33   001C 001C 001C 0008
        DECLE   $0000,  $0004,  $000E,  $000E   ; 5A37   0000 0004 000E 000E
        DECLE   $000E,  $000E,  $000E,  $0004   ; 5A3B   000E 000E 000E 0004
        DECLE   $0000,  $0002,  $0007,  $0007   ; 5A3F   0000 0002 0007 0007
        DECLE   $0007,  $0007,  $0007,  $0002   ; 5A43   0007 0007 0007 0002
        DECLE   $0000                           ; 5A47   0000
L_5A48:
        PSHR    R1                              ; 5A48   0271
        MVI     G_0181, R3                      ; 5A49   0283 0181
        ANDI    #$000F, R3                      ; 5A4B   03BB 000F
        SLL     R3,     2                       ; 5A4D   004F
        SDBD                                    ; 5A4E   0001
        ADDI    #$9C3F, R3                      ; 5A4F   02FB 003F 009C
        MVI@    R3,     R2                      ; 5A52   029A
        ANDI    #$003F, R2                      ; 5A53   03BA 003F
        MVI     G_0172, R1                      ; 5A55   0281 0172
        SLR     R1,     2                       ; 5A57   0065
        SLR     R1,     2                       ; 5A58   0065
        ANDI    #$000E, R1                      ; 5A59   03B9 000E
        ADDI    #$0003, R3                      ; 5A5B   02FB 0003
        MVI@    R3,     R3                      ; 5A5D   029B
        ANDI    #$0020, R3                      ; 5A5E   03BB 0020
        BNEQ    L_5A63                          ; 5A60   020C 0001

        SLR     R1,     1                       ; 5A62   0061
L_5A63:
        ADDR    R1,     R2                      ; 5A63   00CA
        SLL     R2,     2                       ; 5A64   004E
        SLL     R2,     1                       ; 5A65   004A
        SDBD                                    ; 5A66   0001
        ADDI    #$9C63, R2                      ; 5A67   02FA 0063 009C
        MOVR    R2,     R4                      ; 5A6A   0094
        SDBD                                    ; 5A6B   0001
        MVII    #$3990, R1                      ; 5A6C   02B9 0090 0039

        JSR     R5,     L_5AD0                  ; 5A6F   0004 0158 02D0
        JSR     R5,     L_5AD0                  ; 5A72   0004 0158 02D0

        PULR    R1                              ; 5A75   02B1
        B       L_57A3                          ; 5A76   0220 02D4

L_5A78:
        PSHR    R1                              ; 5A78   0271
        MVI     G_01C8, R2                      ; 5A79   0282 01C8
        SDBD                                    ; 5A7B   0001
        ADDI    #$907B, R2                      ; 5A7C   02FA 007B 0090
        MVI@    R2,     R3                      ; 5A7F   0293
        ANDI    #$003F, R3                      ; 5A80   03BB 003F
        MVI     G_0171, R1                      ; 5A82   0281 0171
        SLR     R1,     2                       ; 5A84   0065
        SLR     R1,     2                       ; 5A85   0065
        SLR     R1,     1                       ; 5A86   0061
        ANDI    #$0007, R1                      ; 5A87   03B9 0007
        MVI@    R2,     R0                      ; 5A89   0290
        SUBR    R3,     R0                      ; 5A8A   0118
        BNEQ    L_5A8E                          ; 5A8B   020C 0001

        ADDR    R1,     R1                      ; 5A8D   00C9
L_5A8E:
        ADDR    R1,     R3                      ; 5A8E   00CB
        SLL     R3,     2                       ; 5A8F   004F
        SLL     R3,     1                       ; 5A90   004B
        SDBD                                    ; 5A91   0001
        ADDI    #$9096, R3                      ; 5A92   02FB 0096 0090
        MOVR    R3,     R4                      ; 5A95   009C
        SDBD                                    ; 5A96   0001
        MVII    #$39D0, R1                      ; 5A97   02B9 00D0 0039

        JSR     R5,     L_5AD0                  ; 5A9A   0004 0158 02D0

        TSTR    R0                              ; 5A9D   0080
        BNEQ    L_5AA3                          ; 5A9E   020C 0003

        JSR     R5,     L_5AD0                  ; 5AA0   0004 0158 02D0

L_5AA3:
        PULR    R1                              ; 5AA3   02B1
        B       L_57A6                          ; 5AA4   0220 02FF

L_5AA6:
        PSHR    R1                              ; 5AA6   0271

        JSR     R5,     L_6967                  ; 5AA7   0004 0168 0167

        PULR    R1                              ; 5AAA   02B1
        B       L_57A9                          ; 5AAB   0220 0303
L_5AAD:
        B       L_57AC                          ; 5AAD   0220 0302

L_5AAF:
        PSHR    R1                              ; 5AAF   0271
        DECLE   $0004                           ; 5AB0   0004

        ANDR    R4,     R0                      ; 5AB1   01A0
        CMPR    R5,     R1                      ; 5AB2   0169
        PULR    R1                              ; 5AB3   02B1
        B       L_57AF                          ; 5AB4   0220 0306

L_5AB6:
        PSHR    R1                              ; 5AB6   0271
        DECLE   $0004                           ; 5AB7   0004

        ANDR    R4,     R0                      ; 5AB8   01A0
        CMPR    R7,     R4                      ; 5AB9   017C
        PULR    R1                              ; 5ABA   02B1
        B       L_57B2                          ; 5ABB   0220 030A

        DECLE   $0001,  $0007,  $0005,  $0003   ; 5ABD   0001 0007 0005 0003
        DECLE   $0001,  $0000,  $0005,  $0003   ; 5AC1   0001 0000 0005 0003
        DECLE   $0001,  $0000                   ; 5AC5   0001 0000
L_5AC7:
        MVI@    R5,     R0                      ; 5AC7   02A8
        PSHR    R5                              ; 5AC8   0275

L_5AC9:
        JSR     R5,     L_5AD0                  ; 5AC9   0004 0158 02D0

        DECR    R0                              ; 5ACC   0010
        BNEQ    L_5AC9                          ; 5ACD   022C 0005
        PULR    R7                              ; 5ACF   02B7

L_5AD0:
        PSHR    R5                              ; 5AD0   0275
        MOVR    R1,     R5                      ; 5AD1   008D
        MVI@    R4,     R1                      ; 5AD2   02A1
        MVO@    R1,     R5                      ; 5AD3   0269
        MVI@    R4,     R1                      ; 5AD4   02A1
        MVO@    R1,     R5                      ; 5AD5   0269
        MVI@    R4,     R1                      ; 5AD6   02A1
        MVO@    R1,     R5                      ; 5AD7   0269
        MVI@    R4,     R1                      ; 5AD8   02A1
        MVO@    R1,     R5                      ; 5AD9   0269
        MVI@    R4,     R1                      ; 5ADA   02A1
        MVO@    R1,     R5                      ; 5ADB   0269
        MVI@    R4,     R1                      ; 5ADC   02A1
        MVO@    R1,     R5                      ; 5ADD   0269
        MVI@    R4,     R1                      ; 5ADE   02A1
        MVO@    R1,     R5                      ; 5ADF   0269
        MVI@    R4,     R1                      ; 5AE0   02A1
        MVO@    R1,     R5                      ; 5AE1   0269
        MOVR    R5,     R1                      ; 5AE2   00A9
        PULR    R7                              ; 5AE3   02B7

L_5AE4:
        PSHR    R5                              ; 5AE4   0275
        CLRR    R5                              ; 5AE5   01ED
L_5AE6:
        MVO@    R5,     R4                      ; 5AE6   0265
        MVO@    R5,     R4                      ; 5AE7   0265
        MVO@    R5,     R4                      ; 5AE8   0265
        MVO@    R5,     R4                      ; 5AE9   0265
        MVO@    R5,     R4                      ; 5AEA   0265
        MVO@    R5,     R4                      ; 5AEB   0265
        MVO@    R5,     R4                      ; 5AEC   0265
        MVO@    R5,     R4                      ; 5AED   0265
        DECR    R1                              ; 5AEE   0011
        BNEQ    L_5AE6                          ; 5AEF   022C 000A
        PULR    R7                              ; 5AF1   02B7

L_5AF2:
        PSHR    R5                              ; 5AF2   0275
        MOVR    R1,     R5                      ; 5AF3   008D
        MOVR    R1,     R2                      ; 5AF4   008A
        ADDI    #$0008, R2                      ; 5AF5   02FA 0008
        PSHR    R0                              ; 5AF7   0270
        SLL     R0,     2                       ; 5AF8   004C
        ADD@    R6,     R0                      ; 5AF9   02F0
        ADDR    R0,     R7                      ; 5AFA   00C7

        MVI@    R4,     R1                      ; 5AFB   02A1
        MVO@    R1,     R2                      ; 5AFC   0251
        INCR    R2                              ; 5AFD   000A
        SWAP    R1,     1                       ; 5AFE   0041
        MVO@    R1,     R5                      ; 5AFF   0269
        MVI@    R4,     R1                      ; 5B00   02A1
        MVO@    R1,     R2                      ; 5B01   0251
        INCR    R2                              ; 5B02   000A
        SWAP    R1,     1                       ; 5B03   0041
        MVO@    R1,     R5                      ; 5B04   0269
        MVI@    R4,     R1                      ; 5B05   02A1
        MVO@    R1,     R2                      ; 5B06   0251
        INCR    R2                              ; 5B07   000A
        SWAP    R1,     1                       ; 5B08   0041
        MVO@    R1,     R5                      ; 5B09   0269
        MVI@    R4,     R1                      ; 5B0A   02A1
        MVO@    R1,     R2                      ; 5B0B   0251
        INCR    R2                              ; 5B0C   000A
        SWAP    R1,     1                       ; 5B0D   0041
        MVO@    R1,     R5                      ; 5B0E   0269
        MVI@    R4,     R1                      ; 5B0F   02A1
        MVO@    R1,     R2                      ; 5B10   0251
        INCR    R2                              ; 5B11   000A
        SWAP    R1,     1                       ; 5B12   0041
        MVO@    R1,     R5                      ; 5B13   0269
        MVI@    R4,     R1                      ; 5B14   02A1
        MVO@    R1,     R2                      ; 5B15   0251
        INCR    R2                              ; 5B16   000A
        SWAP    R1,     1                       ; 5B17   0041
        MVO@    R1,     R5                      ; 5B18   0269
        PULR    R7                              ; 5B19   02B7

L_5B1A:
        PSHR    R5                              ; 5B1A   0275
        MOVR    R1,     R5                      ; 5B1B   008D
        MOVR    R4,     R2                      ; 5B1C   00A2
        ADDI    #$0008, R2                      ; 5B1D   02FA 0008
        PSHR    R0                              ; 5B1F   0270
        SLL     R0,     2                       ; 5B20   004C
        ADD@    R6,     R0                      ; 5B21   02F0
        ADDR    R0,     R7                      ; 5B22   00C7

        MVI@    R4,     R1                      ; 5B23   02A1
        SWAP    R1,     1                       ; 5B24   0041
        ADD@    R2,     R1                      ; 5B25   02D1
        INCR    R2                              ; 5B26   000A
        MVO@    R1,     R5                      ; 5B27   0269
        MVI@    R4,     R1                      ; 5B28   02A1
        SWAP    R1,     1                       ; 5B29   0041
        ADD@    R2,     R1                      ; 5B2A   02D1
        INCR    R2                              ; 5B2B   000A
        MVO@    R1,     R5                      ; 5B2C   0269
        MVI@    R4,     R1                      ; 5B2D   02A1
        SWAP    R1,     1                       ; 5B2E   0041
        ADD@    R2,     R1                      ; 5B2F   02D1
        INCR    R2                              ; 5B30   000A
        MVO@    R1,     R5                      ; 5B31   0269
        MVI@    R4,     R1                      ; 5B32   02A1
        SWAP    R1,     1                       ; 5B33   0041
        ADD@    R2,     R1                      ; 5B34   02D1
        INCR    R2                              ; 5B35   000A
        MVO@    R1,     R5                      ; 5B36   0269
        MVI@    R4,     R1                      ; 5B37   02A1
        SWAP    R1,     1                       ; 5B38   0041
        ADD@    R2,     R1                      ; 5B39   02D1
        INCR    R2                              ; 5B3A   000A
        MVO@    R1,     R5                      ; 5B3B   0269
        MVI@    R4,     R1                      ; 5B3C   02A1
        SWAP    R1,     1                       ; 5B3D   0041
        ADD@    R2,     R1                      ; 5B3E   02D1
        INCR    R2                              ; 5B3F   000A
        MVO@    R1,     R5                      ; 5B40   0269
        PULR    R7                              ; 5B41   02B7

L_5B42:
        MVI@    R5,     R0                      ; 5B42   02A8
        PSHR    R1                              ; 5B43   0271
        MVII    #$0319, R1                      ; 5B44   02B9 0319
        B       L_5B4C                          ; 5B46   0200 0004

L_5B48:
        MVI@    R5,     R0                      ; 5B48   02A8
L_5B49:
        PSHR    R1                              ; 5B49   0271
        MVII    #$0173, R1                      ; 5B4A   02B9 0173
L_5B4C:
        PSHR    R5                              ; 5B4C   0275

        JSR     R5,     X_POW2                  ; 5B4D   0004 0114 0345

        MOVR    R0,     R5                      ; 5B50   0085
        COMR    R5                              ; 5B51   001D
        DIS                                     ; 5B52   0003
        AND@    R1,     R5                      ; 5B53   038D
        XORR    R0,     R5                      ; 5B54   01C5
        MVO@    R5,     R1                      ; 5B55   024D
        EIS                                     ; 5B56   0002
        PULR    R5                              ; 5B57   02B5
        PULR    R1                              ; 5B58   02B1
        MOVR    R5,     R7                      ; 5B59   00AF

L_5B5A:
        PSHR    R5                              ; 5B5A   0275
        MOVR    R0,     R3                      ; 5B5B   0083
        BEQ     L_5B5F                          ; 5B5C   0204 0001

        DECR    R3                              ; 5B5E   0013
L_5B5F:
        SLL     R3,     2                       ; 5B5F   004F
        ADDR    R1,     R3                      ; 5B60   00CB
        MVO     R3,     G_0188                  ; 5B61   0243 0188
        MOVR    R0,     R3                      ; 5B63   0083
        ADDR    R0,     R3                      ; 5B64   00C3
        ADDR    R0,     R3                      ; 5B65   00C3
        ADDR    R1,     R3                      ; 5B66   00CB
        MVO     R3,     G_0186                  ; 5B67   0243 0186
        MOVR    R3,     R4                      ; 5B69   009C
        ADDI    #$0113, R3                      ; 5B6A   02FB 0113
        MVI@    R3,     R3                      ; 5B6C   029B
        MVO     R3,     G_0183                  ; 5B6D   0243 0183
        ADDR    R4,     R4                      ; 5B6F   00E4
        ADDI    #$026E, R4                      ; 5B70   02FC 026E
        CLRR    R0                              ; 5B72   01C0
        MVI@    R4,     R2                      ; 5B73   02A2
        RLC     R2,     2                       ; 5B74   0056
        RLC     R0,     2                       ; 5B75   0054
        MVI@    R4,     R2                      ; 5B76   02A2
        RLC     R2,     2                       ; 5B77   0056
        RLC     R0,     2                       ; 5B78   0054
        MVO     R0,     G_0187                  ; 5B79   0240 0187

        JSR     R5,     L_5B42                  ; 5B7B   0004 0158 0342
        DECLE   $0002,  $0004,  $0190,  $0041   ; 5B7E   0002 0004 0190 0041
        DECLE   $0026,  $0004                   ; 5B82   0026 0004

        ANDR    R2,     R0                      ; 5B84   0190
        SWAP    R1,     1                       ; 5B85   0041
        GSWD    R0                              ; 5B86   0030
        INCR    R7                              ; 5B87   000F

        PSHR    R5                              ; 5B88   0275
L_5B89:
        MVI     G_0183, R0                      ; 5B89   0280 0183
        MOVR    R0,     R5                      ; 5B8B   0085
        ANDI    #$0070, R5                      ; 5B8C   03BD 0070
        SUBR    R5,     R0                      ; 5B8E   0128
        SDBD                                    ; 5B8F   0001
        ADDI    #$F000, R5                      ; 5B90   02FD 0000 00F0
        SDBD                                    ; 5B93   0001
        MVI@    R5,     R4                      ; 5B94   02AC
        SUBI    #$0002, R0                      ; 5B95   0338 0002
        BMI     L_5B9B                          ; 5B97   020B 0002

        ADDR    R0,     R5                      ; 5B99   00C5
        ADD@    R5,     R4                      ; 5B9A   02EC
L_5B9B:
        MVI@    R4,     R0                      ; 5B9B   02A0
        MVI@    R4,     R2                      ; 5B9C   02A2
        MOVR    R0,     R1                      ; 5B9D   0081
        ANDI    #$003F, R1                      ; 5B9E   03B9 003F
        MVO     R1,     G_01C5                  ; 5BA0   0241 01C5
        MVO     R2,     G_01C6                  ; 5BA2   0242 01C6
        MOVR    R0,     R3                      ; 5BA4   0083
        ANDI    #$0100, R3                      ; 5BA5   03BB 0100
        BEQ     L_5BAA                          ; 5BA7   0204 0001

        MVI@    R4,     R3                      ; 5BA9   02A3
L_5BAA:
        MVO     R3,     G_01C7                  ; 5BAA   0243 01C7
        ANDI    #$0080, R0                      ; 5BAC   03B8 0080
        BNEQ    L_5BCA                          ; 5BAE   020C 001A

        MVII    #$0007, R1                      ; 5BB0   02B9 0007
        MVII    #$0001, R2                      ; 5BB2   02BA 0001

        JSR     R5,     L_5BCE                  ; 5BB4   0004 0158 03CE

        MVI     G_01C5, R3                      ; 5BB7   0283 01C5
        MVII    #$0189, R1                      ; 5BB9   02B9 0189
L_5BBB:
        DECR    R3                              ; 5BBB   0013
        BMI     L_5BF4                          ; 5BBC   020B 0036

        MVI@    R4,     R0                      ; 5BBE   02A0
        MOVR    R0,     R2                      ; 5BBF   0082
        ANDI    #$003F, R2                      ; 5BC0   03BA 003F
        ADDR    R1,     R2                      ; 5BC2   00CA
        SLR     R0,     2                       ; 5BC3   0064
        SLR     R0,     2                       ; 5BC4   0064
        NOP                                     ; 5BC5   0034
        SLR     R0,     2                       ; 5BC6   0064
        MVO@    R0,     R2                      ; 5BC7   0250
        B       L_5BBB                          ; 5BC8   0220 000E

L_5BCA:
        CLRR    R1                              ; 5BCA   01C9
        MVII    #$0004, R2                      ; 5BCB   02BA 0004
        PULR    R5                              ; 5BCD   02B5
L_5BCE:
        PSHR    R5                              ; 5BCE   0275
        PSHR    R4                              ; 5BCF   0274
        MVII    #$0189, R3                      ; 5BD0   02BB 0189
        MVII    #$003C, R0                      ; 5BD2   02B8 003C
        MOVR    R3,     R4                      ; 5BD4   009C

        JSR     R5,     X_FILL_MEM              ; 5BD5   0004 0114 0341

        PULR    R4                              ; 5BD8   02B4
L_5BD9:
        PSHR    R2                              ; 5BD9   0272
L_5BDA:
        MVI@    R4,     R0                      ; 5BDA   02A0
        SLL     R0,     2                       ; 5BDB   004C
        SLL     R0,     2                       ; 5BDC   004C
        SLL     R0,     2                       ; 5BDD   004C
        MVII    #$000A, R5                      ; 5BDE   02BD 000A
L_5BE0:
        RLC     R0,     1                       ; 5BE0   0050
        MVI@    R3,     R1                      ; 5BE1   0299
        RLC     R1,     1                       ; 5BE2   0051
        MVO@    R1,     R3                      ; 5BE3   0259
        INCR    R3                              ; 5BE4   000B
        DECR    R5                              ; 5BE5   0015
        BNEQ    L_5BE0                          ; 5BE6   022C 0007

        SUBI    #$000A, R3                      ; 5BE8   033B 000A
        DECR    R2                              ; 5BEA   0012
        BNEQ    L_5BDA                          ; 5BEB   022C 0012

        PULR    R2                              ; 5BED   02B2
        ADDI    #$000A, R3                      ; 5BEE   02FB 000A
        CMPI    #$01C5, R3                      ; 5BF0   037B 01C5
        BNEQ    L_5BD9                          ; 5BF2   022C 001A
L_5BF4:
        PULR    R7                              ; 5BF4   02B7

L_5BF5:
        PSHR    R5                              ; 5BF5   0275
        MVII    #$0226, R5                      ; 5BF6   02BD 0226
        MVII    #$0006, R2                      ; 5BF8   02BA 0006
        SDBD                                    ; 5BFA   0001
        MVII    #$C000, R1                      ; 5BFB   02B9 0000 00C0
L_5BFE:
        MVII    #$000A, R3                      ; 5BFE   02BB 000A
        ADDR    R3,     R5                      ; 5C00   00DD
        MOVR    R5,     R4                      ; 5C01   00AC
L_5C02:
        MVI@    R4,     R0                      ; 5C02   02A0
        ANDR    R1,     R0                      ; 5C03   0188
        MVO@    R0,     R5                      ; 5C04   0268
        DECR    R3                              ; 5C05   0013
        BNEQ    L_5C02                          ; 5C06   022C 0005

        DECR    R2                              ; 5C08   0012
        BNEQ    L_5BFE                          ; 5C09   022C 000C
        PULR    R7                              ; 5C0B   02B7

L_5C0C:
        PSHR    R5                              ; 5C0C   0275
        DECLE   $0281,  $0319,  $03B9,  $0004   ; 5C0D   0281 0319 03B9 0004
        DECLE   $0204,  $0007,  $02B8,  $0001   ; 5C11   0204 0007 02B8 0001
        DECLE   $0004,  $0190,  $0041,  $0001   ; 5C15   0004 0190 0041 0001

        PULR    R7                              ; 5C19   02B7

        JSR     R5,     L_5BF5                  ; 5C1A   0004 0158 03F5

        MVII    #$0348, R4                      ; 5C1D   02BC 0348
        CLRR    R0                              ; 5C1F   01C0
        MVO@    R0,     R4                      ; 5C20   0260
        MVO@    R0,     R4                      ; 5C21   0260
        NOP                                     ; 5C22   0034
        MVO@    R0,     R4                      ; 5C23   0260
        MVO@    R0,     R4                      ; 5C24   0260
        MVII    #$0006, R2                      ; 5C25   02BA 0006
        CLRR    R4                              ; 5C27   01E4
        DECR    R4                              ; 5C28   0014
        MVII    #$0025, R5                      ; 5C29   02BD 0025
        MVII    #$000A, R3                      ; 5C2B   02BB 000A
        MVII    #$0324, R1                      ; 5C2D   02B9 0324
        SUBR    R2,     R1                      ; 5C2F   0111
        MVI@    R1,     R0                      ; 5C30   0288
        ADD     G_0185, R7                      ; 5C31   02C7 0185

        SLR     R0,     2                       ; 5C33   0064
        SLR     R0,     2                       ; 5C34   0064
        SLL     R0,     2                       ; 5C35   004C
        SLL     R0,     2                       ; 5C36   004C
        SLL     R0,     1                       ; 5C37   0048
        ADDR    R3,     R5                      ; 5C38   00DD
        MOVR    R5,     R1                      ; 5C39   00A9
        INCR    R1                              ; 5C3A   0009
        INCR    R4                              ; 5C3B   000C
        SLLC    R0,     1                       ; 5C3C   0058
        BNC     L_5C57                          ; 5C3D   0209 0018

        PSHR    R0                              ; 5C3F   0270
        PSHR    R1                              ; 5C40   0271
        PSHR    R2                              ; 5C41   0272
        NOP                                     ; 5C42   0034
        PSHR    R3                              ; 5C43   0273
        PSHR    R4                              ; 5C44   0274
        MOVR    R4,     R2                      ; 5C45   00A2
        ADDI    #$0189, R2                      ; 5C46   02FA 0189
        MVO     R1,     G_01D0                  ; 5C48   0241 01D0
        MVO     R4,     G_01CF                  ; 5C4A   0244 01CF

        JSR     R5,     L_62C7                  ; 5C4C   0004 0160 02C7
        JSR     R5,     L_61DB                  ; 5C4F   0004 0160 01DB

        PULR    R4                              ; 5C52   02B4
        PULR    R3                              ; 5C53   02B3
        PULR    R2                              ; 5C54   02B2
        PULR    R1                              ; 5C55   02B1
        PULR    R0                              ; 5C56   02B0
L_5C57:
        DECR    R3                              ; 5C57   0013
        DECLE   $022C,  $001F,  $008D,  $0012   ; 5C58   022C 001F 008D 0012
        DECLE   $022C,  $0032,  $0004           ; 5C5C   022C 0032 0004

        ANDR    R2,     R0                      ; 5C5F   0190
        RSWD    R4                              ; 5C60   003C
        NEGR    R6                              ; 5C61   0026

        JSR     R5,     L_5B42                  ; 5C62   0004 0158 0342
        DECLE   $0006,  $02BC,  $027C,  $0004   ; 5C65   0006 02BC 027C 0004

        ANDR    R5,     R4                      ; 5C69   01AC
        MVI@    R4,     R4                      ; 5C6A   02A4
        MVII    #$0324, R4                      ; 5C6B   02BC 0324
        MVI     G_0142, R2                      ; 5C6D   0282 0142
L_5C6F:
        MVI@    R4,     R0                      ; 5C6F   02A0
        MOVR    R0,     R1                      ; 5C70   0081
        ANDI    #$000F, R0                      ; 5C71   03B8 000F
        CMP     G_0186, R0                      ; 5C73   0340 0186
        BNEQ    L_5CD2                          ; 5C75   020C 005B

        MOVR    R1,     R0                      ; 5C77   0088
        ANDI    #$03F0, R0                      ; 5C78   03B8 03F0
        CMPI    #$03F0, R0                      ; 5C7A   0378 03F0
        BNEQ    L_5C88                          ; 5C7C   020C 000A

        SUBR    R0,     R1                      ; 5C7E   0101

        JSR     R5,     L_650C                  ; 5C7F   0004 0164 010C

        MOVR    R5,     R0                      ; 5C82   00A8
        SLL     R0,     2                       ; 5C83   004C
        SLL     R0,     2                       ; 5C84   004C
        ADDR    R0,     R1                      ; 5C85   00C1
        DECR    R4                              ; 5C86   0014
        MVO@    R1,     R4                      ; 5C87   0261
L_5C88:
        SLR     R0,     2                       ; 5C88   0064
        SLR     R0,     2                       ; 5C89   0064
        NOP                                     ; 5C8A   0034
        SWAP    R1,     1                       ; 5C8B   0041
        SLR     R1,     2                       ; 5C8C   0065
        NOP                                     ; 5C8D   0034
        PSHR    R1                              ; 5C8E   0271
        ANDI    #$000F, R1                      ; 5C8F   03B9 000F
        MOVR    R1,     R5                      ; 5C91   008D
        ADDR    R1,     R1                      ; 5C92   00C9
        ADDR    R5,     R1                      ; 5C93   00E9
        MVO     R1,     G_01C8                  ; 5C94   0241 01C8
        MOVR    R1,     R4                      ; 5C96   008C
        MOVR    R0,     R1                      ; 5C97   0081
        MVII    #$000A, R2                      ; 5C98   02BA 000A

        JSR     R5,     X_DIV                   ; 5C9A   0004 011C 01FB

        PULR    R2                              ; 5C9D   02B2
        SLL     R1,     2                       ; 5C9E   004D
        SLL     R1,     1                       ; 5C9F   0049
        ADDI    #$0148, R1                      ; 5CA0   02F9 0148
        ANDI    #$0020, R2                      ; 5CA2   03BA 0020
        BEQ     L_5CA8                          ; 5CA4   0204 0002

        ADDI    #$0200, R1                      ; 5CA6   02F9 0200
L_5CA8:
        SDBD                                    ; 5CA8   0001
        ADDI    #$907B, R4                      ; 5CA9   02FC 007B 0090
        MVI@    R4,     R3                      ; 5CAC   02A3
        SLL     R0,     2                       ; 5CAD   004C
        SLL     R0,     1                       ; 5CAE   0048
        ADDI    #$0098, R0                      ; 5CAF   02F8 0098
        ANDI    #$0200, R3                      ; 5CB1   03BB 0200
        BEQ     L_5CB7                          ; 5CB3   0204 0002

        XORI    #$0180, R0                      ; 5CB5   03F8 0180
L_5CB7:
        INCR    R4                              ; 5CB7   000C
        MVI@    R4,     R3                      ; 5CB8   02A3
        ANDI    #$000F, R3                      ; 5CB9   03BB 000F
        SARC    R3,     1                       ; 5CBB   007B
        BNC     L_5CC2                          ; 5CBC   0209 0004

        SDBD                                    ; 5CBE   0001
        ADDI    #$1000, R3                      ; 5CBF   02FB 0000 0010
L_5CC2:
        SDBD                                    ; 5CC2   0001
        ADDI    #$09D0, R3                      ; 5CC3   02FB 00D0 0009
        MVO     R1,     G_034B                  ; 5CC6   0241 034B
        MVO     R0,     G_0353                  ; 5CC8   0240 0353
        MVO     R3,     G_035B                  ; 5CCA   0243 035B
        MVII    #$0001, R2                      ; 5CCC   02BA 0001
        MVO     R2,     G_0171                  ; 5CCE   0242 0171
        B       L_5CDE                          ; 5CD0   0200 000C

L_5CD2:
        DECR    R2                              ; 5CD2   0012
        BNEQ    L_5C6F                          ; 5CD3   022C 0065

        MVO     R2,     G_034B                  ; 5CD5   0242 034B
        MVO     R2,     G_0353                  ; 5CD7   0242 0353
        MVO     R2,     G_035B                  ; 5CD9   0242 035B
        DECR    R2                              ; 5CDB   0012
        MVO     R2,     G_01C8                  ; 5CDC   0242 01C8

L_5CDE:
        JSR     R5,     L_5609                  ; 5CDE   0004 0154 0209

        MVII    #$0333, R4                      ; 5CE1   02BC 0333
        CLRR    R2                              ; 5CE3   01D2
        B       L_5CEA                          ; 5CE4   0200 0004

L_5CE6:
        MVII    #$032C, R4                      ; 5CE6   02BC 032C
        MVI     G_0143, R2                      ; 5CE8   0282 0143
L_5CEA:
        MVI@    R4,     R0                      ; 5CEA   02A0
        MOVR    R0,     R1                      ; 5CEB   0081
        ANDI    #$000F, R0                      ; 5CEC   03B8 000F
        CMP     G_0186, R0                      ; 5CEE   0340 0186
        BNEQ    L_5D35                          ; 5CF0   020C 0043

        MOVR    R1,     R0                      ; 5CF2   0088
        ANDI    #$03F0, R0                      ; 5CF3   03B8 03F0
        SUBR    R0,     R1                      ; 5CF5   0101
        CMPI    #$03F0, R0                      ; 5CF6   0378 03F0
        BNEQ    L_5CFF                          ; 5CF8   020C 0005

        JSR     R5,     L_650C                  ; 5CFA   0004 0164 010C

        B       L_5D17                          ; 5CFD   0200 0018

L_5CFF:
        SLR     R0,     2                       ; 5CFF   0064
        SLR     R0,     2                       ; 5D00   0064
        MVII    #$0189, R5                      ; 5D01   02BD 0189
        ADDR    R0,     R5                      ; 5D03   00C5
L_5D04:
        MVI@    R5,     R0                      ; 5D04   02A8
        ANDI    #$000F, R0                      ; 5D05   03B8 000F
        CMPI    #$000F, R0                      ; 5D07   0378 000F
        BNEQ    L_5D15                          ; 5D09   020C 000A

        SUBI    #$000C, R5                      ; 5D0B   033D 000C
        CMPI    #$0189, R5                      ; 5D0D   037D 0189
        BPL     L_5D13                          ; 5D0F   0203 0002

        ADDI    #$003C, R5                      ; 5D11   02FD 003C
L_5D13:
        B       L_5D04                          ; 5D13   0220 0010

L_5D15:
        SUBI    #$018A, R5                      ; 5D15   033D 018A
L_5D17:
        MOVR    R5,     R0                      ; 5D17   00A8
        MVO     R0,     G_01D1                  ; 5D18   0240 01D1
        SLL     R0,     2                       ; 5D1A   004C
        SLL     R0,     2                       ; 5D1B   004C
        ADDR    R0,     R1                      ; 5D1C   00C1
        DECR    R4                              ; 5D1D   0014
        MVO@    R1,     R4                      ; 5D1E   0261
        MOVR    R4,     R2                      ; 5D1F   00A2
        SUBI    #$032D, R2                      ; 5D20   033A 032D
        MVO     R2,     G_01C9                  ; 5D22   0242 01C9

        JSR     R5,     L_5D92                  ; 5D24   0004 015C 0192

        DECR    R4                              ; 5D27   0014
        MVI@    R4,     R1                      ; 5D28   02A1
        TSTR    R1                              ; 5D29   0089
        BPL     L_5D4F                          ; 5D2A   0203 0023

        MVII    #$004D, R1                      ; 5D2C   02B9 004D
        MVO     R1,     G_01D1                  ; 5D2E   0241 01D1
        CLRR    R1                              ; 5D30   01C9
        MVO     R1,     G_017A                  ; 5D31   0241 017A
        B       L_5D4F                          ; 5D33   0200 001A

L_5D35:
        DECR    R2                              ; 5D35   0012
        BMI     L_5CE6                          ; 5D36   022B 0051
        BNEQ    L_5CEA                          ; 5D38   022C 004F

        MVO     R2,     G_017A                  ; 5D3A   0242 017A
        MVO     R2,     G_0170                  ; 5D3C   0242 0170
        NOP                                     ; 5D3E   0034
        MVO     R2,     G_035C                  ; 5D3F   0242 035C
        MVO     R2,     G_017F                  ; 5D41   0242 017F
        NOP                                     ; 5D43   0034
        MVO     R2,     G_0177                  ; 5D44   0242 0177
        MVO     R2,     G_0178                  ; 5D46   0242 0178
        DECR    R2                              ; 5D48   0012
        MVO     R2,     G_01C9                  ; 5D49   0242 01C9
        MVII    #$004D, R2                      ; 5D4B   02BA 004D
        MVO     R2,     G_01D1                  ; 5D4D   0242 01D1

L_5D4F:
        JSR     R5,     L_698B                  ; 5D4F   0004 0168 018B
        DECLE   $02BC,  $0334,  $0282,  $0144   ; 5D52   02BC 0334 0282 0144
        DECLE   $0092,  $0204,  $0034,  $02A0   ; 5D56   0092 0204 0034 02A0
        DECLE   $0081,  $020B,  $002D,  $03B8   ; 5D5A   0081 020B 002D 03B8
        DECLE   $000F,  $0340,  $0186,  $020C   ; 5D5E   000F 0340 0186 020C
        DECLE   $0027,  $0088,  $03B8,  $03F0   ; 5D62   0027 0088 03B8 03F0
        DECLE   $0378,  $03F0,  $020C,  $001A   ; 5D66   0378 03F0 020C 001A

        SUBR    R0,     R1                      ; 5D6A   0101
        MVI     G_01C6, R0                      ; 5D6B   0280 01C6
        SUB     G_01C5, R0                      ; 5D6D   0300 01C5

        JSR     R5,     X_RAND2                 ; 5D6F   0004 0114 029E
        DECLE   $02BA,  $000E,  $02BD,  $0189   ; 5D72   02BA 000E 02BD 0189
        DECLE   $036A,  $022C,  $0002,  $0010   ; 5D76   036A 022C 0002 0010
        DECLE   $0223,  $0005,  $033D,  $018A   ; 5D7A   0223 0005 033D 018A
        DECLE   $00A8,  $004C,  $004C,  $00C1   ; 5D7E   00A8 004C 004C 00C1
        DECLE   $0014,  $0261,  $0004,  $0190   ; 5D82   0014 0261 0004 0190
        DECLE   $0041,  $0005,  $0200,  $0003   ; 5D86   0041 0005 0200 0003
        DECLE   $0012,  $022C,  $0033,  $0004   ; 5D8A   0012 022C 0033 0004

        ANDR    R2,     R0                      ; 5D8E   0190
        RSWD    R4                              ; 5D8F   003C
        ADCR    R3                              ; 5D90   002B
        PULR    R7                              ; 5D91   02B7

L_5D92:
        PSHR    R5                              ; 5D92   0275
        ADDI    #$0122, R2                      ; 5D93   02FA 0122
        MVI@    R2,     R3                      ; 5D95   0293
        ANDI    #$00F8, R3                      ; 5D96   03BB 00F8
        PSHR    R3                              ; 5D98   0273
        SLL     R3,     1                       ; 5D99   004B
        ADD@    R6,     R3                      ; 5D9A   02F3
        SDBD                                    ; 5D9B   0001
        ADDI    #$F728, R3                      ; 5D9C   02FB 0028 00F7
        MVO     R3,     G_035C                  ; 5D9F   0243 035C
        ADDI    #$0005, R3                      ; 5DA1   02FB 0005
        MVI@    R3,     R0                      ; 5DA3   0298
        ANDI    #$0007, R0                      ; 5DA4   03B8 0007
        MVO     R0,     G_017A                  ; 5DA6   0240 017A
        DECR    R3                              ; 5DA8   0013
        MVI@    R3,     R2                      ; 5DA9   029A
        DECR    R3                              ; 5DAA   0013
        MVI@    R3,     R1                      ; 5DAB   0299
        ANDI    #$001F, R1                      ; 5DAC   03B9 001F
        ANDI    #$001F, R2                      ; 5DAE   03BA 001F
        SDBD                                    ; 5DB0   0001
        ADDI    #$6C79, R1                      ; 5DB1   02F9 0079 006C
        SDBD                                    ; 5DB4   0001
        ADDI    #$6C79, R2                      ; 5DB5   02FA 0079 006C
        MVI@    R1,     R0                      ; 5DB8   0288
        ANDI    #$000F, R0                      ; 5DB9   03B8 000F
        MVI@    R2,     R1                      ; 5DBB   0291
        ANDI    #$000F, R1                      ; 5DBC   03B9 000F
        SLL     R1,     2                       ; 5DBE   004D
        SLL     R1,     2                       ; 5DBF   004D
        ADDR    R1,     R0                      ; 5DC0   00C8
        MVO     R0,     G_017F                  ; 5DC1   0240 017F
        MVII    #$0001, R0                      ; 5DC3   02B8 0001
        MVO     R0,     G_0170                  ; 5DC5   0240 0170
        PULR    R7                              ; 5DC7   02B7

        PSHR    R5                              ; 5DC8   0275
        CLRR    R3                              ; 5DC9   01DB
        MVII    #$0334, R4                      ; 5DCA   02BC 0334
L_5DCC:
        MVI@    R4,     R5                      ; 5DCC   02A5
        MOVR    R5,     R0                      ; 5DCD   00A8
        BLE     L_5E05                          ; 5DCE   0206 0035

        ANDI    #$000F, R0                      ; 5DD0   03B8 000F
        CMP     G_0186, R0                      ; 5DD2   0340 0186
        BNEQ    L_5E05                          ; 5DD4   020C 002F

        MOVR    R5,     R2                      ; 5DD6   00AA
        SLR     R2,     2                       ; 5DD7   0066
        SLR     R2,     2                       ; 5DD8   0066
        ANDI    #$003F, R2                      ; 5DD9   03BA 003F
        CMP     G_01CF, R2                      ; 5DDB   0342 01CF
        BNEQ    L_5DE4                          ; 5DDD   020C 0005

        JSR     R5,     L_6552                  ; 5DDF   0004 0164 0152

        BNC     L_5E05                          ; 5DE2   0209 0021

L_5DE4:
        MOVR    R2,     R1                      ; 5DE4   0091
        DECLE   $0004                           ; 5DE5   0004

        ANDR    R2,     R0                      ; 5DE6   0190
        ADCR    R2                              ; 5DE7   002A
        RLC     R2,     1                       ; 5DE8   0052
        BC      L_5DF4                          ; 5DE9   0201 0009

        ADDI    #$0189, R2                      ; 5DEB   02FA 0189
        MVI@    R2,     R0                      ; 5DED   0290
        ANDI    #$00F0, R0                      ; 5DEE   03B8 00F0
        CMPI    #$00F0, R0                      ; 5DF0   0378 00F0
        BNEQ    L_5E05                          ; 5DF2   020C 0011

L_5DF4:
        MVII    #$000A, R2                      ; 5DF4   02BA 000A

        JSR     R5,     X_DIV                   ; 5DF6   0004 011C 01FB

        ADDI    #$0030, R1                      ; 5DF9   02F9 0030
        PSHR    R0                              ; 5DFB   0270
        SLL     R0,     2                       ; 5DFC   004C
        ADD@    R6,     R0                      ; 5DFD   02F0
        SLL     R0,     2                       ; 5DFE   004C
        ADDR    R0,     R1                      ; 5DFF   00C1
        ADDI    #$0200, R1                      ; 5E00   02F9 0200

        JSR     R5,     L_68BE                  ; 5E02   0004 0168 00BE

L_5E05:
        INCR    R3                              ; 5E05   000B
        CMPI    #$0010, R3                      ; 5E06   037B 0010
        BNEQ    L_5DCC                          ; 5E08   022C 003D
        PULR    R7                              ; 5E0A   02B7

L_5E0B:
        PSHR    R5                              ; 5E0B   0275
        MVI     G_0102, R0                      ; 5E0C   0280 0102
        CMPI    #$00C0, R0                      ; 5E0E   0378 00C0
        BEQ     L_5E19                          ; 5E10   0204 0007

        SWAP    R0,     1                       ; 5E12   0040
        SWAP    R0,     1                       ; 5E13   0040
        BMI     L_5E6D                          ; 5E14   020B 0057
        BEQ     L_5E19                          ; 5E16   0204 0001

        DECR    R0                              ; 5E18   0010
L_5E19:
        CLRR    R1                              ; 5E19   01C9
        DECLE   $0282,  $001E,  $0241,  $001E   ; 5E1A   0282 001E 0241 001E
        DECLE   $0240,  $0102,  $0240,  $0020   ; 5E1E   0240 0102 0240 0020
        DECLE   $0280,  $020A,  $0054,  $0209   ; 5E22   0280 020A 0054 0209
        DECLE   $0003,  $0004                   ; 5E26   0003 0004

        AND@    R3,     R0                      ; 5E28   0398
        RLC     R1,     1                       ; 5E29   0051
        MVI     .STIC.C.2,R0                    ; 5E2A   0280 001A
        MVO     R1,     .STIC.C.2               ; 5E2C   0241 001A
        MVI     .STIC.C.7,R3                    ; 5E2E   0283 001F
        MVO     R1,     .STIC.C.7               ; 5E30   0241 001F
        MVII    #$01DB, R4                      ; 5E32   02BC 01DB
        MVO@    R0,     R4                      ; 5E34   0260
        SLR     R2,     1                       ; 5E35   0062
        MVO@    R2,     R4                      ; 5E36   0262
        SLR     R3,     1                       ; 5E37   0063
        MVO@    R3,     R4                      ; 5E38   0263
        MVII    #$0344, R4                      ; 5E39   02BC 0344

        JSR     R5,     L_5AD0                  ; 5E3B   0004 0158 02D0
        JSR     R5,     L_5AD0                  ; 5E3E   0004 0158 02D0
        JSR     R5,     L_5AD0                  ; 5E41   0004 0158 02D0

        MVII    #$0354, R3                      ; 5E44   02BB 0354
        MVII    #$017D, R5                      ; 5E46   02BD 017D
        MVII    #$0004, R4                      ; 5E48   02BC 0004
        SDBD                                    ; 5E4A   0001
        MVII    #$1000, R2                      ; 5E4B   02BA 0000 0010
L_5E4E:
        MVI@    R5,     R0                      ; 5E4E   02A8
        MOVR    R0,     R1                      ; 5E4F   0081
        ANDI    #$000F, R0                      ; 5E50   03B8 000F
        BEQ     L_5E5A                          ; 5E52   0204 0006

        SARC    R0,     1                       ; 5E54   0078
        BNC     L_5E58                          ; 5E55   0209 0001

        ADDR    R2,     R0                      ; 5E57   00D0
L_5E58:
        XOR@    R3,     R0                      ; 5E58   03D8
        MVO@    R0,     R3                      ; 5E59   0258
L_5E5A:
        INCR    R3                              ; 5E5A   000B
        SLR     R1,     2                       ; 5E5B   0065
        SLR     R1,     2                       ; 5E5C   0065
        BEQ     L_5E65                          ; 5E5D   0204 0006

        SARC    R1,     1                       ; 5E5F   0079
        BNC     L_5E63                          ; 5E60   0209 0001

        ADDR    R2,     R1                      ; 5E62   00D1
L_5E63:
        XOR@    R3,     R1                      ; 5E63   03D9
        MVO@    R1,     R3                      ; 5E64   0259
L_5E65:
        INCR    R3                              ; 5E65   000B
        DECR    R4                              ; 5E66   0014
        BNEQ    L_5E4E                          ; 5E67   022C 001A

        JSR     R5,     X_PLAY_NOTE             ; 5E69   0004 0118 02BD

        PULR    R7                              ; 5E6C   02B7

L_5E6D:
        JSR     R5,     X_DEF_ISR               ; 5E6D   0004 0110 0126

        PULR    R7                              ; 5E70   02B7

L_5E71:
        PSHR    R5                              ; 5E71   0275
L_5E72:
        MVII    #$0027, R0                      ; 5E72   02B8 0027
        DECLE   $0281,  $01D2,  $0001,  $02BB   ; 5E74   0281 01D2 0001 02BB
        DECLE   $0000,  $0004,  $0379,  $0002   ; 5E78   0000 0004 0379 0002
        DECLE   $0204,  $0009,  $0379,  $0004   ; 5E7C   0204 0009 0379 0004
        DECLE   $020C,  $000B,  $0004           ; 5E80   020C 000B 0004

        ANDR    R2,     R0                      ; 5E83   0190
        SWAP    R2,     1                       ; 5E84   0042
        B       L_5E93                          ; 5E85   0200 000C

        DECLE   $01DB,  $0004                   ; 5E87   01DB 0004

        ANDR    R2,     R0                      ; 5E89   0190
        RSWD    R5                              ; 5E8A   003D
        B       L_5E93                          ; 5E8B   0200 0006

        DECLE   $0004                           ; 5E8D   0004

        ANDR    R2,     R0                      ; 5E8E   0190
        ADCR    R5                              ; 5E8F   002D
        BC      L_5E93                          ; 5E90   0201 0001

        CLRR    R3                              ; 5E92   01DB
L_5E93:
        MVII    #$0174, R4                      ; 5E93   02BC 0174
        DECLE   $02A1,  $02F9,  $0100,  $0271   ; 5E95   02A1 02F9 0100 0271
        DECLE   $0004                           ; 5E99   0004

        ANDR    R2,     R0                      ; 5E9A   0190
        ADCR    R2                              ; 5E9B   002A
        RLC     R1,     2                       ; 5E9C   0055
        BC      L_5EA1                          ; 5E9D   0201 0002

        ADDI    #$0200, R1                      ; 5E9F   02F9 0200
L_5EA1:
        PSHR    R1                              ; 5EA1   0271
        DECLE   $02BA,  $0002,  $02A1,  $02F9   ; 5EA2   02BA 0002 02A1 02F9
        DECLE   $0080,  $00D9,  $0241,  $034E   ; 5EA6   0080 00D9 0241 034E
        DECLE   $0001,  $02BC,  $00A0,  $0019   ; 5EAA   0001 02BC 00A0 0019
        DECLE   $0244,  $0356,  $0004           ; 5EAE   0244 0356 0004

        ANDR    R2,     R0                      ; 5EB1   0190
        ADCR    R2                              ; 5EB2   002A
        COMR    R4                              ; 5EB3   001C
        PULR    R0                              ; 5EB4   02B0
        PULR    R5                              ; 5EB5   02B5
        BNC     L_5EB9                          ; 5EB6   0209 0001

        MOVR    R0,     R5                      ; 5EB8   0085
L_5EB9:
        TSTR    R3                              ; 5EB9   009B
        BNEQ    L_5ED6                          ; 5EBA   020C 001A

        MVO     R5,     G_0345                  ; 5EBC   0245 0345
        SUBR    R2,     R0                      ; 5EBE   0110
        MVO     R0,     G_0346                  ; 5EBF   0240 0346
        MVO     R0,     G_0347                  ; 5EC1   0240 0347
        MVO     R1,     G_034F                  ; 5EC3   0241 034F
        SUBI    #$007F, R1                      ; 5EC5   0339 007F
        MVO     R1,     G_034D                  ; 5EC7   0241 034D
        SDBD                                    ; 5EC9   0001
        MVII    #$09B6, R0                      ; 5ECA   02B8 00B6 0009
        MVO     R0,     G_0357                  ; 5ECD   0240 0357
        SDBD                                    ; 5ECF   0001
        MVII    #$09C7, R0                      ; 5ED0   02B8 00C7 0009
        MVO     R0,     G_0355                  ; 5ED3   0240 0355
        PULR    R7                              ; 5ED5   02B7

L_5ED6:
        MVO     R5,     G_0347                  ; 5ED6   0245 0347
        ADDR    R2,     R0                      ; 5ED8   00D0
        MVO     R0,     G_0346                  ; 5ED9   0240 0346
        MVO     R0,     G_0345                  ; 5EDB   0240 0345
        MVO     R1,     G_034D                  ; 5EDD   0241 034D
        SUBI    #$007F, R1                      ; 5EDF   0339 007F
        MVO     R1,     G_034F                  ; 5EE1   0241 034F
        SDBD                                    ; 5EE3   0001
        MVII    #$09B6, R0                      ; 5EE4   02B8 00B6 0009
        MVO     R0,     G_0355                  ; 5EE7   0240 0355
        SDBD                                    ; 5EE9   0001
        MVII    #$09C7, R0                      ; 5EEA   02B8 00C7 0009
        MVO     R0,     G_0357                  ; 5EED   0240 0357
        PULR    R7                              ; 5EEF   02B7

L_5EF0:
        PSHR    R0                              ; 5EF0   0270
        MVI     G_031D, R0                      ; 5EF1   0280 031D
        ANDI    #$001F, R0                      ; 5EF3   03B8 001F
        ADDI    #$020E, R0                      ; 5EF5   02F8 020E
        MVO     R0,     G_0344                  ; 5EF7   0240 0344
        MVI     G_031D, R0                      ; 5EF9   0280 031D
        SLR     R0,     2                       ; 5EFB   0064
        SLR     R0,     2                       ; 5EFC   0064
        SLR     R0,     1                       ; 5EFD   0060
        ADDI    #$0109, R0                      ; 5EFE   02F8 0109
        MVO     R0,     G_034C                  ; 5F00   0240 034C
        SDBD                                    ; 5F02   0001
        MVII    #$09CF, R0                      ; 5F03   02B8 00CF 0009
        MVO     R0,     G_0354                  ; 5F06   0240 0354
        PULR    R0                              ; 5F08   02B0
        MOVR    R5,     R7                      ; 5F09   00AF

L_5F0A:
        PSHR    R5                              ; 5F0A   0275
        MVII    #$0001, R3                      ; 5F0B   02BB 0001
        MOVR    R0,     R1                      ; 5F0D   0081
        INCR    R2                              ; 5F0E   000A
        ANDR    R3,     R1                      ; 5F0F   0199
        SUBR    R1,     R2                      ; 5F10   010A
        MVI@    R2,     R1                      ; 5F11   0291
        CMPR    R3,     R0                      ; 5F12   0158
        BEQ     L_5F1A                          ; 5F13   0204 0005

        CMPI    #$0002, R0                      ; 5F15   0378 0002
        BEQ     L_5F1A                          ; 5F17   0204 0001

        NEGR    R3                              ; 5F19   0023
L_5F1A:
        ADDR    R3,     R1                      ; 5F1A   00D9
        MVO@    R1,     R2                      ; 5F1B   0251
        PULR    R7                              ; 5F1C   02B7

L_5F1D:
        PSHR    R5                              ; 5F1D   0275
        DECLE   $0004,  $0190,  $002A,  $0015   ; 5F1E   0004 0190 002A 0015
        DECLE   $0209,  $0003,  $0004,  $0364   ; 5F22   0209 0003 0004 0364
        DECLE   $01E4,  $0004,  $0190,  $002A   ; 5F26   01E4 0004 0190 002A
        DECLE   $0016,  $0209,  $0003,  $0004   ; 5F2A   0016 0209 0003 0004

        AND@    R3,     R4                      ; 5F2E   039C
        XOR@    R5,     R6                      ; 5F2F   03EE
        MVI     G_01D2, R5                      ; 5F30   0285 01D2
        TSTR    R5                              ; 5F32   00AD
        BEQ     L_5FC6                          ; 5F33   0204 0091

        MVO     R5,     G_0168                  ; 5F35   0245 0168
        MVI     G_0176, R0                      ; 5F37   0280 0176
        DECR    R0                              ; 5F39   0010
        BMI     L_5F75                          ; 5F3A   020B 0039

        MVII    #$0174, R2                      ; 5F3C   02BA 0174

        JSR     R5,     L_5F0A                  ; 5F3E   0004 015C 030A

        MVI     G_0168, R5                      ; 5F41   0285 0168
        PSHR    R0                              ; 5F43   0270
        PSHR    R1                              ; 5F44   0271
        PSHR    R2                              ; 5F45   0272
        PSHR    R3                              ; 5F46   0273
        PSHR    R5                              ; 5F47   0275
        MOVR    R7,     R4                      ; 5F48   00BC
        ADDI    #$0021, R4                      ; 5F49   02FC 0021
        MVII    #$016F, R3                      ; 5F4B   02BB 016F
        MVI@    R3,     R0                      ; 5F4D   0298
        CMPI    #$00C0, R0                      ; 5F4E   0378 00C0
        BNEQ    L_5F53                          ; 5F50   020C 0001

        INCR    R0                              ; 5F52   0008
L_5F53:
        MVO@    R0,     R3                      ; 5F53   0258
        MVII    #$0000, R0                      ; 5F54   02B8 0000

        JSR     R5,     L_55E5                  ; 5F56   0004 0154 01E5

        PULR    R5                              ; 5F59   02B5
        PULR    R3                              ; 5F5A   02B3
        PULR    R2                              ; 5F5B   02B2
        PULR    R1                              ; 5F5C   02B1
        PULR    R0                              ; 5F5D   02B0
        MOVR    R0,     R4                      ; 5F5E   0084
        SDBD                                    ; 5F5F   0001
        ADDI    #$6150, R4                      ; 5F60   02FC 0050 0061
        CMP@    R4,     R5                      ; 5F63   0365
        BNEQ    L_5F6B                          ; 5F64   020C 0005

        MVO     R5,     G_0176                  ; 5F66   0245 0176
        B       L_5FC3                          ; 5F68   0200 0059

        MOVR    R4,     R5                      ; 5F6A   00A5
L_5F6B:
        MOVR    R1,     R4                      ; 5F6B   008C
        ANDI    #$0007, R4                      ; 5F6C   03BC 0007
        BEQ     L_5F75                          ; 5F6E   0204 0005

        INCR    R0                              ; 5F70   0008
        CMP     G_0168, R0                      ; 5F71   0340 0168
        BEQ     L_5F7A                          ; 5F73   0204 0005

L_5F75:
        MVII    #$0174, R4                      ; 5F75   02BC 0174

        JSR     R5,     L_5FD7                  ; 5F77   0004 015C 03D7

L_5F7A:
        MVII    #$0174, R4                      ; 5F7A   02BC 0174

        JSR     R5,     L_6044                  ; 5F7C   0004 0160 0044

        TSTR    R0                              ; 5F7F   0080
        BPL     L_5FC3                          ; 5F80   0203 0041
        INCR    R7                              ; 5F82   000F

L_5F83:
        PULR    R5                              ; 5F83   02B5
L_5F84:
        MVII    #$0174, R4                      ; 5F84   02BC 0174
        MVI@    R4,     R3                      ; 5F86   02A3
        XOR@    R4,     R3                      ; 5F87   03E3
        ANDI    #$0003, R3                      ; 5F88   03BB 0003
        BNEQ    L_5FC3                          ; 5F8A   020C 0037

        MVII    #$0184, R3                      ; 5F8C   02BB 0184
        MVI@    R4,     R0                      ; 5F8E   02A0
        DECR    R0                              ; 5F8F   0010
        CLRR    R1                              ; 5F90   01C9
        SARC    R0,     1                       ; 5F91   0078
        ADCR    R1                              ; 5F92   0029
        ADDR    R1,     R3                      ; 5F93   00CB
        XORR    R1,     R0                      ; 5F94   01C8
        MVI@    R3,     R2                      ; 5F95   029A
        DECR    R2                              ; 5F96   0012
        ADDR    R0,     R2                      ; 5F97   00C2
        ADDR    R0,     R2                      ; 5F98   00C2
        MVO@    R2,     R3                      ; 5F99   025A
        MVII    #$0175, R3                      ; 5F9A   02BB 0175
        MVI     G_0176, R0                      ; 5F9C   0280 0176
        DECR    R0                              ; 5F9E   0010
        CLRR    R1                              ; 5F9F   01C9
        SARC    R0,     1                       ; 5FA0   0078
        ADCR    R1                              ; 5FA1   0029
        SUBR    R1,     R3                      ; 5FA2   010B
        MOVR    R7,     R4                      ; 5FA3   00BC
        ADDI    #$0032, R4                      ; 5FA4   02FC 0032
        SUBR    R1,     R4                      ; 5FA6   010C
        MVI@    R4,     R4                      ; 5FA7   02A4
        XORR    R0,     R1                      ; 5FA8   01C1
        BEQ     L_5FAC                          ; 5FA9   0204 0001

        NEGR    R4                              ; 5FAB   0024
L_5FAC:
        ADD@    R3,     R4                      ; 5FAC   02DC
        MVO@    R4,     R3                      ; 5FAD   025C

        JSR     R5,     L_5E71                  ; 5FAE   0004 015C 0271
        DECLE   $01C0,  $0240,  $0176,  $0004   ; 5FB1   01C0 0240 0176 0004

        ANDR    R2,     R0                      ; 5FB5   0190
        SWAP    R1,     1                       ; 5FB6   0041
        ADCR    R3                              ; 5FB7   002B
        MVII    #$0184, R4                      ; 5FB8   02BC 0184
        MVI@    R4,     R0                      ; 5FBA   02A0
        MVI@    R4,     R1                      ; 5FBB   02A1

        JSR     R5,     L_5B5A                  ; 5FBC   0004 0158 035A
        JSR     R5,     L_5C0C                  ; 5FBF   0004 015C 000C

L_5FC2:
        PULR    R7                              ; 5FC2   02B7
L_5FC3:
        J       L_5E72                          ; 5FC3   0004 035C 0272

L_5FC6:
        MVI     G_016F, R0                      ; 5FC6   0280 016F
        CMPI    #$00C0, R0                      ; 5FC8   0378 00C0
        BEQ     L_5FC2                          ; 5FCA   0224 0009

        MVII    #$00C0, R0                      ; 5FCC   02B8 00C0
        MVO     R0,     G_016F                  ; 5FCE   0240 016F

        JSR     R5,     L_5B48                  ; 5FD0   0004 0158 0348
        DECLE   $0000                           ; 5FD3   0000

        PULR    R7                              ; 5FD4   02B7

        SLL     R0,     2                       ; 5FD5   004C
        ADCR    R4                              ; 5FD6   002C
L_5FD7:
        PSHR    R5                              ; 5FD7   0275

        JSR     R5,     L_6044                  ; 5FD8   0004 0160 0044

        TSTR    R0                              ; 5FDB   0080
        BMI     L_5F83                          ; 5FDC   022B 005A

        ADDI    #$0189, R2                      ; 5FDE   02FA 0189
        DECR    R0                              ; 5FE0   0010
        BEQ     L_5FEA                          ; 5FE1   0204 0007

        DECR    R0                              ; 5FE3   0010
        BEQ     L_6003                          ; 5FE4   0204 001D

        MVI     G_0168, R0                      ; 5FE6   0280 0168
L_5FE8:
        MVO@    R0,     R4                      ; 5FE8   0260
        PULR    R7                              ; 5FE9   02B7

L_5FEA:
        MVI     G_0168, R0                      ; 5FEA   0280 0168
        CMP@    R4,     R0                      ; 5FEC   0360
        BEQ     L_5FF7                          ; 5FED   0204 0008

        DECR    R4                              ; 5FEF   0014
        DECR    R0                              ; 5FF0   0010

        JSR     R5,     L_60D8                  ; 5FF1   0004 0160 00D8

        BNC     L_6000                          ; 5FF4   0209 000A

        MVI@    R4,     R0                      ; 5FF6   02A0
L_5FF7:
        DECR    R4                              ; 5FF7   0014
        DECR    R0                              ; 5FF8   0010
        BMI     L_6041                          ; 5FF9   020B 0046

        JSR     R5,     L_60D8                  ; 5FFB   0004 0160 00D8

        BC      L_6041                          ; 5FFE   0201 0041

L_6000:
        INCR    R0                              ; 6000   0008
        B       L_5FE8                          ; 6001   0220 001A

L_6003:
        MVI     G_0168, R0                      ; 6003   0280 0168
        CMP@    R4,     R0                      ; 6005   0360
        BEQ     L_6010                          ; 6006   0204 0008

        DECR    R4                              ; 6008   0014
        DECR    R0                              ; 6009   0010

        JSR     R5,     L_60F2                  ; 600A   0004 0160 00F2

        BNC     L_6000                          ; 600D   0229 000E

        MVI@    R4,     R0                      ; 600F   02A0
L_6010:
        DECR    R4                              ; 6010   0014
        DECR    R0                              ; 6011   0010
        BMI     L_6041                          ; 6012   020B 002D

        JSR     R5,     L_60F2                  ; 6014   0004 0160 00F2

        BNC     L_6000                          ; 6017   0229 0018

        MVI@    R4,     R0                      ; 6019   02A0
        DECR    R4                              ; 601A   0014
        CMP     G_0168, R0                      ; 601B   0340 0168
        BNEQ    L_6041                          ; 601D   020C 0022

        DECR    R0                              ; 601F   0010
        CLRR    R1                              ; 6020   01C9
        PSHR    R1                              ; 6021   0271

        JSR     R5,     L_60D8                  ; 6022   0004 0160 00D8

        PULR    R1                              ; 6025   02B1
        BNC     L_6035                          ; 6026   0209 000D

        INCR    R1                              ; 6028   0009
        PSHR    R1                              ; 6029   0271
        MOVR    R3,     R5                      ; 602A   009D
        ADDR    R7,     R5                      ; 602B   00FD
        ADDI    #$010E, R5                      ; 602C   02FD 010E
        ADD@    R5,     R2                      ; 602E   02EA

        JSR     R5,     L_60D8                  ; 602F   0004 0160 00D8

        PULR    R1                              ; 6032   02B1
        BC      L_6041                          ; 6033   0201 000C

L_6035:
        SLL     R3,     1                       ; 6035   004B
        ADDR    R3,     R1                      ; 6036   00D9
        ADDR    R7,     R1                      ; 6037   00F9
        ADDI    #$0005, R1                      ; 6038   02F9 0005
        MVI@    R1,     R0                      ; 603A   0288
        B       L_6000                          ; 603B   0220 003C

        DECLE   $0003,  $0001,  $0000           ; 603D   0003 0001 0000

        EIS                                     ; 6040   0002
L_6041:
        CLRR    R0                              ; 6041   01C0
        B       L_5FE8                          ; 6042   0220 005B

L_6044:
        PSHR    R5                              ; 6044   0275
        CLRR    R5                              ; 6045   01ED
        MVII    #$0001, R0                      ; 6046   02B8 0001
        MVI@    R4,     R1                      ; 6048   02A1
        MVI@    R4,     R2                      ; 6049   02A2
        SUBI    #$0048, R1                      ; 604A   0339 0048
        SUBI    #$0018, R2                      ; 604C   033A 0018
        BMI     L_6071                          ; 604E   020B 0021

        TSTR    R1                              ; 6050   0089
        BMI     L_6071                          ; 6051   020B 001E

        CMPI    #$0048, R1                      ; 6053   0379 0048
        BGT     L_6071                          ; 6055   020E 001A

        CMPI    #$0028, R2                      ; 6057   037A 0028
        BGT     L_6071                          ; 6059   020E 0016

        MOVR    R1,     R3                      ; 605B   008B
        ANDI    #$0007, R3                      ; 605C   03BB 0007
        BEQ     L_6061                          ; 605E   0204 0001

        SLL     R0,     1                       ; 6060   0048
L_6061:
        MOVR    R2,     R3                      ; 6061   0093
        ANDI    #$0007, R3                      ; 6062   03BB 0007
        BEQ     L_6068                          ; 6064   0204 0002

        SLL     R0,     1                       ; 6066   0048
        INCR    R5                              ; 6067   000D
L_6068:
        SLR     R1,     2                       ; 6068   0065
        SLR     R1,     1                       ; 6069   0061
        SUBR    R3,     R2                      ; 606A   011A
        PSHR    R2                              ; 606B   0272
        SLR     R2,     2                       ; 606C   0066
        ADD@    R6,     R2                      ; 606D   02F2
        ADDR    R1,     R2                      ; 606E   00CA
        MOVR    R5,     R3                      ; 606F   00AB
        PULR    R7                              ; 6070   02B7

L_6071:
        CLRR    R0                              ; 6071   01C0
        ANDI    #$0007, R1                      ; 6072   03B9 0007
        BNEQ    L_607A                          ; 6074   020C 0004

        ANDI    #$0007, R2                      ; 6076   03BA 0007
        BEQ     L_607B                          ; 6078   0204 0001

L_607A:
        DECR    R0                              ; 607A   0010
L_607B:
        PULR    R7                              ; 607B   02B7

L_607C:
        PSHR    R5                              ; 607C   0275
        PSHR    R3                              ; 607D   0273
        MVI@    R2,     R1                      ; 607E   0291
        ANDI    #$000F, R1                      ; 607F   03B9 000F
        MOVR    R1,     R3                      ; 6081   008B
        ANDI    #$000C, R3                      ; 6082   03BB 000C
        BEQ     L_6095                          ; 6084   0204 000F

        ANDI    #$0004, R3                      ; 6086   03BB 0004
        BNEQ    L_6095                          ; 6088   020C 000B

        MVI     G_0187, R3                      ; 608A   0283 0187
        SARC    R3,     1                       ; 608C   007B
        BNC     L_6093                          ; 608D   0209 0004

        SUBI    #$0008, R1                      ; 608F   0339 0008
        B       L_6095                          ; 6091   0200 0002

L_6093:
        MVII    #$000E, R1                      ; 6093   02B9 000E
L_6095:
        ADDR    R7,     R1                      ; 6095   00F9
        ADDI    #$00AA, R1                      ; 6096   02F9 00AA
        MVI@    R1,     R1                      ; 6098   0289
        PULR    R3                              ; 6099   02B3
        PULR    R7                              ; 609A   02B7

L_609B:
        PSHR    R5                              ; 609B   0275

        JSR     R5,     L_607C                  ; 609C   0004 0160 007C
        JSR     R5,     X_POW2                  ; 609F   0004 0114 0345

        ANDR    R1,     R0                      ; 60A2   0188
        PULR    R5                              ; 60A3   02B5
        BNEQ    L_60EA                          ; 60A4   020C 0044
        MOVR    R5,     R7                      ; 60A6   00AF

L_60A7:
        PSHR    R5                              ; 60A7   0275
        MOVR    R0,     R5                      ; 60A8   0085
        ADDR    R7,     R5                      ; 60A9   00FD
        ADDI    #$0092, R5                      ; 60AA   02FD 0092
        ADD@    R5,     R2                      ; 60AC   02EA
        SUBI    #$000A, R2                      ; 60AD   033A 000A
        CMPI    #$0189, R2                      ; 60AF   037A 0189
        BLT     L_60B7                          ; 60B1   0205 0004

        CMPI    #$01C5, R2                      ; 60B3   037A 01C5
        BLT     L_60BC                          ; 60B5   0205 0005

L_60B7:
        MOVR    R7,     R2                      ; 60B7   00BA
        ADDI    #$001E, R2                      ; 60B8   02FA 001E
        B       L_60D1                          ; 60BA   0200 0015

L_60BC:
        CMPI    #$01A6, R2                      ; 60BC   037A 01A6
        BNEQ    L_60C9                          ; 60BE   020C 0009

        CMPI    #$0003, R0                      ; 60C0   0378 0003
        BNEQ    L_60D1                          ; 60C2   020C 000D

L_60C4:
        MOVR    R7,     R2                      ; 60C4   00BA
        ADDI    #$0012, R2                      ; 60C5   02FA 0012
        B       L_60D1                          ; 60C7   0200 0008

L_60C9:
        CMPI    #$01B1, R2                      ; 60C9   037A 01B1
        BNEQ    L_60D1                          ; 60CB   020C 0004

        CMPI    #$0001, R0                      ; 60CD   0378 0001
        BEQ     L_60C4                          ; 60CF   0224 000C

L_60D1:
        ADDI    #$0002, R0                      ; 60D1   02F8 0002
        ANDI    #$0003, R0                      ; 60D3   03B8 0003
        PULR    R7                              ; 60D5   02B7

        INCR    R4                              ; 60D6   000C
        INCR    R5                              ; 60D7   000D
L_60D8:
        PSHR    R5                              ; 60D8   0275
        MVO     R0,     G_0169                  ; 60D9   0240 0169
        MVO     R2,     G_016A                  ; 60DB   0242 016A

        JSR     R5,     L_609B                  ; 60DD   0004 0160 009B

        MVI     G_0169, R0                      ; 60E0   0280 0169

        JSR     R5,     L_60A7                  ; 60E2   0004 0160 00A7
        JSR     R5,     L_609B                  ; 60E5   0004 0160 009B

L_60E8:
        CLRC                                    ; 60E8   0006
        INCR    R7                              ; 60E9   000F

L_60EA:
        SETC                                    ; 60EA   0007
L_60EB:
        MVI     G_0169, R0                      ; 60EB   0280 0169
        MVI     G_016A, R2                      ; 60ED   0282 016A
        XORI    #$0100, R2                      ; 60EF   03FA 0100
        PULR    R7                              ; 60F1   02B7

L_60F2:
        PSHR    R5                              ; 60F2   0275
        MVO     R0,     G_0169                  ; 60F3   0240 0169
        MVO     R2,     G_016A                  ; 60F5   0242 016A
        MOVR    R0,     R5                      ; 60F7   0085
        ANDI    #$0001, R5                      ; 60F8   03BD 0001
        XORR    R3,     R5                      ; 60FA   01DD
        BNEQ    L_60E8                          ; 60FB   022C 0014

        JSR     R5,     L_609B                  ; 60FD   0004 0160 009B

        MVI     G_0169, R0                      ; 6100   0280 0169
        MOVR    R3,     R5                      ; 6102   009D
        ADDR    R7,     R5                      ; 6103   00FD
        ADDI    #$0036, R5                      ; 6104   02FD 0036
        ADD@    R5,     R2                      ; 6106   02EA

        JSR     R5,     L_609B                  ; 6107   0004 0160 009B

        MVI     G_016A, R2                      ; 610A   0282 016A
        ADDI    #$0100, R2                      ; 610C   02FA 0100
        MVI     G_0169, R0                      ; 610E   0280 0169

        JSR     R5,     L_60A7                  ; 6110   0004 0160 00A7
        JSR     R5,     L_609B                  ; 6113   0004 0160 009B

        MOVR    R3,     R5                      ; 6116   009D
        ADDR    R3,     R5                      ; 6117   00DD
        ADDR    R7,     R5                      ; 6118   00FD
        ADDI    #$001D, R5                      ; 6119   02FD 001D
        AND@    R5,     R1                      ; 611B   03A9
        BNEQ    L_60EA                          ; 611C   022C 0033

        MOVR    R3,     R5                      ; 611E   009D
        ADDR    R7,     R5                      ; 611F   00FD
        ADDI    #$001A, R5                      ; 6120   02FD 001A
        ADD@    R5,     R2                      ; 6122   02EA
        MVI     G_0169, R0                      ; 6123   0280 0169
        ADDI    #$0002, R0                      ; 6125   02F8 0002
        ANDI    #$0003, R0                      ; 6127   03B8 0003

        JSR     R5,     L_609B                  ; 6129   0004 0160 009B

        MOVR    R3,     R5                      ; 612C   009D
        ADDR    R3,     R5                      ; 612D   00DD
        ADDR    R7,     R5                      ; 612E   00FD
        ADDI    #$0008, R5                      ; 612F   02FD 0008
        AND@    R5,     R1                      ; 6131   03A9
        BNEQ    L_60EA                          ; 6132   022C 0049
        B       L_60E8                          ; 6134   0220 004D

        DECLE   $0002,  $0008,  $0004,  $0001   ; 6136   0002 0008 0004 0001
        DECLE   $0001,  $000A,  $0000,  $000B   ; 613A   0001 000A 0000 000B
        DECLE   $0014,  $0009,  $0001,  $0002   ; 613E   0014 0009 0001 0002
        DECLE   $0004,  $0008,  $0009,  $0003   ; 6142   0004 0008 0009 0003
        DECLE   $0006,  $000C,  $000B,  $0007   ; 6146   0006 000C 000B 0007
        DECLE   $000E,  $000D,  $000A,  $0005   ; 614A   000E 000D 000A 0005
        DECLE   $0000,  $000F,  $0003,  $0004   ; 614E   0000 000F 0003 0004
        DECLE   $0001                           ; 6152   0001

        EIS                                     ; 6153   0002
L_6154:
        PSHR    R5                              ; 6154   0275
        DECLE   $0004                           ; 6155   0004

        ANDR    R2,     R0                      ; 6156   0190
        ADCR    R2                              ; 6157   002A
        NEGR    R6                              ; 6158   0026
        BC      L_6284                          ; 6159   0201 0129

        MVII    #$0174, R4                      ; 615B   02BC 0174

        JSR     R5,     L_6044                  ; 615D   0004 0160 0044

        DECR    R0                              ; 6160   0010
        BMI     L_6284                          ; 6161   020B 0121
        BEQ     L_6174                          ; 6163   0204 000F

        SUBI    #$0002, R4                      ; 6165   033C 0002
        MVI@    R4,     R1                      ; 6167   02A1
        ANDI    #$0004, R1                      ; 6168   03B9 0004
        BEQ     L_616D                          ; 616A   0204 0001

        INCR    R2                              ; 616C   000A
L_616D:
        MVI@    R4,     R1                      ; 616D   02A1
        ANDI    #$0004, R1                      ; 616E   03B9 0004
        BEQ     L_6174                          ; 6170   0204 0002

        ADDI    #$000A, R2                      ; 6172   02FA 000A
L_6174:
        CMP     G_01CF, R2                      ; 6174   0342 01CF
        BEQ     L_6284                          ; 6176   0204 010C

        MVO     R2,     G_01CF                  ; 6178   0242 01CF
        MOVR    R2,     R1                      ; 617A   0091
        MVII    #$000A, R2                      ; 617B   02BA 000A

        JSR     R5,     X_DIV                   ; 617D   0004 011C 01FB

        MVI     G_0184, R3                      ; 6180   0283 0184
        SLL     R3,     1                       ; 6182   004B
        ADD     G_0184, R3                      ; 6183   02C3 0184
        SLL     R3,     2                       ; 6185   004F
        SLL     R3,     2                       ; 6186   004F
        SLL     R3,     2                       ; 6187   004F
        MVI     G_0185, R2                      ; 6188   0282 0185
        SLL     R2,     2                       ; 618A   004E
        ADD     G_0185, R2                      ; 618B   02C2 0185
        SLL     R2,     1                       ; 618D   004A
        ADDR    R2,     R3                      ; 618E   00D3
        ADDI    #$0021, R3                      ; 618F   02FB 0021
        MOVR    R0,     R2                      ; 6191   0082
        SLL     R2,     2                       ; 6192   004E
        SLL     R2,     2                       ; 6193   004E
        ADDR    R2,     R3                      ; 6194   00D3
        ADDR    R2,     R3                      ; 6195   00D3
        ADDR    R1,     R3                      ; 6196   00CB
        MVO     R3,     G_031D                  ; 6197   0243 031D

        JSR     R5,     L_5EF0                  ; 6199   0004 015C 02F0

        MOVR    R2,     R4                      ; 619C   0094
        SLR     R2,     2                       ; 619D   0066
        ADDR    R4,     R2                      ; 619E   00E2
        ADDR    R1,     R2                      ; 619F   00CA
        ADDI    #$0030, R2                      ; 61A0   02FA 0030
        MVO     R2,     G_01D0                  ; 61A2   0242 01D0
        MVII    #$0002, R3                      ; 61A4   02BB 0002
        ADDR    R1,     R7                      ; 61A6   00CF

        SLL     R3,     1                       ; 61A7   004B
        SLL     R3,     1                       ; 61A8   004B
        SLL     R3,     1                       ; 61A9   004B
        SLL     R3,     1                       ; 61AA   004B
        SLL     R3,     1                       ; 61AB   004B
        SLL     R3,     1                       ; 61AC   004B
        SLL     R3,     1                       ; 61AD   004B
        SLL     R3,     1                       ; 61AE   004B
        SLL     R3,     1                       ; 61AF   004B
        MVI     G_0185, R1                      ; 61B0   0281 0185
        ADDR    R1,     R7                      ; 61B2   00CF

        DECLE   $004F,  $004F,  $02BA,  $031E   ; 61B3   004F 004F 02BA 031E
        DECLE   $00C2,  $0290,  $0085,  $019D   ; 61B7   00C2 0290 0085 019D
        DECLE   $020C,  $000E,  $0270,  $0004   ; 61BB   020C 000E 0270 0004

        ANDR    R2,     R0                      ; 61BF   0190
        ADCR    R2                              ; 61C0   002A
        RLC     R0,     1                       ; 61C1   0050
        PULR    R0                              ; 61C2   02B0
        BC      L_61CB                          ; 61C3   0201 0006

        XORR    R3,     R0                      ; 61C5   01D8
        MVO@    R0,     R2                      ; 61C6   0250

        JSR     R5,     L_5B42                  ; 61C7   0004 0158 0342
        DECLE   $0001                           ; 61CA   0001
L_61CB:
        MVI     G_01CF, R2                      ; 61CB   0282 01CF
        ADDI    #$0189, R2                      ; 61CD   02FA 0189

        JSR     R5,     L_62C7                  ; 61CF   0004 0160 02C7
        DECLE   $0004,  $0190,  $0041,  $0005   ; 61D2   0004 0190 0041 0005
        DECLE   $0004,  $0190,  $0041,  $0002   ; 61D6   0004 0190 0041 0002
        DECLE   $000F                           ; 61DA   000F
L_61DB:
        PSHR    R5                              ; 61DB   0275
        DECLE   $0004                           ; 61DC   0004

        ANDR    R2,     R0                      ; 61DD   0190
        ADCR    R2                              ; 61DE   002A
        RLC     R0,     1                       ; 61DF   0050
        BC      L_6284                          ; 61E0   0201 00A2

        MVI     G_01D0, R1                      ; 61E2   0281 01D0
        ADDI    #$0200, R1                      ; 61E4   02F9 0200
        MVI     G_01CF, R2                      ; 61E6   0282 01CF
        ADDI    #$0189, R2                      ; 61E8   02FA 0189
        MVI@    R2,     R3                      ; 61EA   0293
        ANDI    #$000F, R3                      ; 61EB   03BB 000F
        ADDI    #$00F0, R3                      ; 61ED   02FB 00F0
        MVO@    R3,     R2                      ; 61EF   0253
        ANDI    #$000F, R3                      ; 61F0   03BB 000F
        CMPI    #$0008, R3                      ; 61F2   037B 0008
        BLT     L_61FF                          ; 61F4   0205 0009

        CMPI    #$000B, R3                      ; 61F6   037B 000B
        BGT     L_61FF                          ; 61F8   020E 0005

        JSR     R5,     L_6285                  ; 61FA   0004 0160 0285

        B       L_620C                          ; 61FD   0200 000D

L_61FF:
        ADDR    R7,     R3                      ; 61FF   00FB
        ADDI    #$00B7, R3                      ; 6200   02FB 00B7
        MVI@    R3,     R0                      ; 6202   0298
        SLL     R0,     2                       ; 6203   004C
        SLL     R0,     1                       ; 6204   0048
        ADDI    #$0001, R0                      ; 6205   02F8 0001
        MVI@    R1,     R5                      ; 6207   028D
        AND     G_0318, R5                      ; 6208   0385 0318
        ADDR    R5,     R0                      ; 620A   00E8
        MVO@    R0,     R1                      ; 620B   0248
L_620C:
        MVII    #$0008, R0                      ; 620C   02B8 0008
        SDBD                                    ; 620E   0001
        MVII    #$62AF, R5                      ; 620F   02BD 00AF 0062
        MVII    #$015D, R3                      ; 6212   02BB 015D
        SDBD                                    ; 6214   0001
        MVII    #$6372, R4                      ; 6215   02BC 0072 0063
L_6218:
        ADD@    R5,     R1                      ; 6218   02E9
        SUBI    #$0015, R1                      ; 6219   0339 0015
        ADD@    R4,     R2                      ; 621B   02E2
        SUBI    #$000B, R2                      ; 621C   033A 000B
        INCR    R3                              ; 621E   000B
        PSHR    R0                              ; 621F   0270
        CMPI    #$0228, R1                      ; 6220   0379 0228
        BLT     L_6280                          ; 6222   0205 005C

        CMPI    #$026B, R1                      ; 6224   0379 026B
        BEQ     L_6280                          ; 6226   0204 0058

        CMPI    #$0276, R1                      ; 6228   0379 0276
        BEQ     L_6280                          ; 622A   0204 0054

        CMPI    #$02A0, R1                      ; 622C   0379 02A0
        BGT     L_6280                          ; 622E   020E 0050

        MVI@    R2,     R0                      ; 6230   0290
        SLR     R0,     2                       ; 6231   0064
        SLR     R0,     2                       ; 6232   0064
        CMPI    #$000F, R0                      ; 6233   0378 000F
        BEQ     L_6280                          ; 6235   0204 0049

        AND@    R3,     R0                      ; 6237   0398
        SUB@    R3,     R0                      ; 6238   0318
        NEGR    R0                              ; 6239   0020
        BEQ     L_6280                          ; 623A   0204 0044

        MVO     R0,     G_0166                  ; 623C   0240 0166
        SLL     R0,     2                       ; 623E   004C
        SLL     R0,     2                       ; 623F   004C
        ADD@    R2,     R0                      ; 6240   02D0
        MVO@    R0,     R2                      ; 6241   0250
        PSHR    R1                              ; 6242   0271
        PSHR    R5                              ; 6243   0275

        JSR     R5,     L_607C                  ; 6244   0004 0160 007C

        PULR    R5                              ; 6247   02B5
        MVO     R1,     G_015D                  ; 6248   0241 015D
        AND     G_0166, R1                      ; 624A   0381 0166
        PULR    R1                              ; 624C   02B1
        BEQ     L_6280                          ; 624D   0204 0031

        SLR     R0,     2                       ; 624F   0064
        SLR     R0,     2                       ; 6250   0064
        AND     G_015D, R0                      ; 6251   0380 015D
        CMP     G_015D, R0                      ; 6253   0340 015D
        BNEQ    L_626B                          ; 6255   020C 0014

        PSHR    R3                              ; 6257   0273
        MVI@    R2,     R3                      ; 6258   0293
        ANDI    #$000F, R3                      ; 6259   03BB 000F
        CMPI    #$0008, R3                      ; 625B   037B 0008
        BLT     L_6271                          ; 625D   0205 0012

        CMPI    #$000B, R3                      ; 625F   037B 000B
        BGT     L_6271                          ; 6261   020E 000E

        PSHR    R5                              ; 6263   0275

        JSR     R5,     L_6285                  ; 6264   0004 0160 0285

        PULR    R5                              ; 6267   02B5
        PULR    R3                              ; 6268   02B3
        B       L_6280                          ; 6269   0200 0015

L_626B:
        PSHR    R3                              ; 626B   0273
        MOVR    R0,     R3                      ; 626C   0083
        ADDR    R7,     R3                      ; 626D   00FB
        ADDI    #$0031, R3                      ; 626E   02FB 0031
        MVI@    R3,     R3                      ; 6270   029B
L_6271:
        ADDR    R7,     R3                      ; 6271   00FB
        ADDI    #$0045, R3                      ; 6272   02FB 0045
        MVI@    R3,     R0                      ; 6274   0298
        SLL     R0,     2                       ; 6275   004C
        SLL     R0,     1                       ; 6276   0048
        ADDI    #$0001, R0                      ; 6277   02F8 0001
        PSHR    R0                              ; 6279   0270
        MVI@    R1,     R0                      ; 627A   0288
        AND     G_0318, R0                      ; 627B   0380 0318
        ADD@    R6,     R0                      ; 627D   02F0
        MVO@    R0,     R1                      ; 627E   0248
        PULR    R3                              ; 627F   02B3
L_6280:
        PULR    R0                              ; 6280   02B0
        DECR    R0                              ; 6281   0010
        BNEQ    L_6218                          ; 6282   022C 006B
L_6284:
        PULR    R7                              ; 6284   02B7

L_6285:
        PSHR    R5                              ; 6285   0275
        MVI     G_0187, R0                      ; 6286   0280 0187
        SARC    R0,     1                       ; 6288   0078
        BNC     L_629E                          ; 6289   0209 0013

        MVII    #$0005, R5                      ; 628B   02BD 0005
        SARC    R0,     1                       ; 628D   0078
        BNC     L_6292                          ; 628E   0209 0002

        MVII    #$0002, R5                      ; 6290   02BD 0002
L_6292:
        ADDR    R7,     R3                      ; 6292   00FB
        ADDI    #$001C, R3                      ; 6293   02FB 001C
        MVI@    R3,     R0                      ; 6295   0298
        SLL     R0,     2                       ; 6296   004C
        SLL     R0,     1                       ; 6297   0048
        ADDR    R5,     R0                      ; 6298   00E8
        MVI@    R1,     R5                      ; 6299   028D
        AND     G_0318, R5                      ; 629A   0385 0318
        ADDR    R5,     R0                      ; 629C   00E8
        MVO@    R0,     R1                      ; 629D   0248
L_629E:
        PULR    R7                              ; 629E   02B7

        DECLE   $000E,  $0000,  $0001,  $0005   ; 629F   000E 0000 0001 0005
        DECLE   $0002,  $000D,  $0006,  $0009   ; 62A3   0002 000D 0006 0009
        DECLE   $0003,  $0004                   ; 62A7   0003 0004

        INCR    R4                              ; 62A9   000C
        INCR    R0                              ; 62AA   0008
        SETC                                    ; 62AB   0007
        INCR    R3                              ; 62AC   000B
        INCR    R2                              ; 62AD   000A
        INCR    R7                              ; 62AE   000F

        DECLE   $0000                           ; 62AF   0000
L_62B0:
        DECR    R6                              ; 62B0   0016
        DECLE   $0016,  $0029,  $0029,  $0014   ; 62B1   0016 0029 0029 0014
        DECLE   $0014,  $0001                   ; 62B5   0014 0001

        ADDR    R1,     R4                      ; 62B7   00CC
        MOVR    R7,     R5                      ; 62B8   00BD
        ADDR    R1,     R7                      ; 62B9   00CF

        MOVR    R7,     R4                      ; 62BA   00BC
        SUBR    R2,     R0                      ; 62BB   0110
        SUBR    R2,     R1                      ; 62BC   0111
        SUBR    R2,     R2                      ; 62BD   0112
        SUBR    R2,     R3                      ; 62BE   0113
        SUBR    R2,     R4                      ; 62BF   0114
        SUBR    R2,     R5                      ; 62C0   0115
        SUBR    R2,     R6                      ; 62C1   0116
        SUBR    R2,     R7                      ; 62C2   0117

        DECLE   $0118,  $0119,  $0000           ; 62C3   0118 0119 0000

        SLLC    R3,     2                       ; 62C6   005F
L_62C7:
        PSHR    R5                              ; 62C7   0275
        MVII    #$015E, R4                      ; 62C8   02BC 015E
        MVII    #$000F, R1                      ; 62CA   02B9 000F
        MVII    #$0008, R0                      ; 62CC   02B8 0008

        JSR     R5,     X_FILL_MEM              ; 62CE   0004 0114 0341

        MOVR    R7,     R5                      ; 62D1   00BD
        ADDI    #$00A0, R5                      ; 62D2   02FD 00A0
L_62D4:
        PSHR    R5                              ; 62D4   0275

        JSR     R5,     L_607C                  ; 62D5   0004 0160 007C

        MVO@    R1,     R4                      ; 62D8   0261
        PULR    R5                              ; 62D9   02B5
        ADD@    R5,     R2                      ; 62DA   02EA
        SUBI    #$000B, R2                      ; 62DB   033A 000B
        DECR    R0                              ; 62DD   0010
        BPL     L_62D4                          ; 62DE   0223 000B

        CLRR    R0                              ; 62E0   01C0
L_62E1:
        MVO     R0,     G_015D                  ; 62E1   0240 015D
        ADDR    R0,     R0                      ; 62E3   00C0
        SDBD                                    ; 62E4   0001
        MVII    #$637A, R3                      ; 62E5   02BB 007A 0063
        ADD     G_015D, R3                      ; 62E8   02C3 015D
        MOVR    R3,     R1                      ; 62EA   0099
        ADDI    #$0002, R1                      ; 62EB   02F9 0002
        MVII    #$015F, R2                      ; 62ED   02BA 015F
        ADDR    R0,     R2                      ; 62EF   00C2
        MVI     G_0166, R4                      ; 62F0   0284 0166
        AND@    R3,     R4                      ; 62F2   039C
        BEQ     L_62FB                          ; 62F3   0204 0006

        MVI@    R1,     R4                      ; 62F5   028C
        COMR    R4                              ; 62F6   001C
        AND@    R2,     R4                      ; 62F7   0394
        MVO@    R4,     R2                      ; 62F8   0254
        B       L_6302                          ; 62F9   0200 0007

L_62FB:
        MVII    #$0168, R5                      ; 62FB   02BD 0168
        ADDR    R0,     R5                      ; 62FD   00C5
        MVI@    R5,     R4                      ; 62FE   02AC
        AND@    R1,     R4                      ; 62FF   038C
        BEQ     L_6324                          ; 6300   0204 0022

L_6302:
        PSHR    R2                              ; 6302   0272
        DECR    R2                              ; 6303   0012
        PSHR    R3                              ; 6304   0273
        PSHR    R0                              ; 6305   0270
        SDBD                                    ; 6306   0001
        MVII    #$636E, R3                      ; 6307   02BB 006E 0063
        ADD     G_015D, R3                      ; 630A   02C3 015D
        MVI@    R3,     R4                      ; 630C   029C
        AND@    R2,     R4                      ; 630D   0394
        MVO@    R4,     R2                      ; 630E   0254
        INCR    R2                              ; 630F   000A
        MVI@    R3,     R0                      ; 6310   0298
        SLR     R0,     1                       ; 6311   0060
        MOVR    R0,     R4                      ; 6312   0084
        AND@    R3,     R4                      ; 6313   039C
        AND@    R2,     R4                      ; 6314   0394
        MVO@    R4,     R2                      ; 6315   0254
        INCR    R2                              ; 6316   000A
        CMPI    #$0166, R2                      ; 6317   037A 0166
        BNEQ    L_631D                          ; 6319   020C 0002

        SUBI    #$0008, R2                      ; 631B   033A 0008
L_631D:
        AND@    R2,     R0                      ; 631D   0390
        MVO@    R0,     R2                      ; 631E   0250
        PULR    R0                              ; 631F   02B0
        PULR    R3                              ; 6320   02B3
        PULR    R2                              ; 6321   02B2
        B       L_6366                          ; 6322   0200 0042

L_6324:
        INCR    R2                              ; 6324   000A
        CMPI    #$0166, R2                      ; 6325   037A 0166
        BNEQ    L_632B                          ; 6327   020C 0002

        SUBI    #$0008, R2                      ; 6329   033A 0008
L_632B:
        INCR    R3                              ; 632B   000B
        INCR    R1                              ; 632C   0009
        MVII    #$0168, R5                      ; 632D   02BD 0168
        ADDR    R0,     R5                      ; 632F   00C5
        MVI@    R5,     R4                      ; 6330   02AC
        AND@    R3,     R4                      ; 6331   039C
        BNEQ    L_6340                          ; 6332   020C 000C

        CMPI    #$016F, R5                      ; 6334   037D 016F
        BNEQ    L_633A                          ; 6336   020C 0002

        SUBI    #$0008, R5                      ; 6338   033D 0008
L_633A:
        MVI@    R5,     R4                      ; 633A   02AC
        AND@    R1,     R4                      ; 633B   038C
        BEQ     L_634A                          ; 633C   0204 000C
        B       L_6344                          ; 633E   0200 0004

L_6340:
        MVI@    R1,     R4                      ; 6340   028C
        COMR    R4                              ; 6341   001C
        AND@    R2,     R4                      ; 6342   0394
        MVO@    R4,     R2                      ; 6343   0254
L_6344:
        MOVR    R3,     R4                      ; 6344   009C
        DECR    R4                              ; 6345   0014
        MVI@    R4,     R4                      ; 6346   02A4
        COMR    R4                              ; 6347   001C
        AND@    R2,     R4                      ; 6348   0394
        MVO@    R4,     R2                      ; 6349   0254
L_634A:
        MVII    #$015E, R2                      ; 634A   02BA 015E
        ADDR    R0,     R2                      ; 634C   00C2
        MVII    #$0168, R5                      ; 634D   02BD 0168
        ADDR    R0,     R5                      ; 634F   00C5
        MVI@    R5,     R4                      ; 6350   02AC
        AND@    R1,     R4                      ; 6351   038C
        BNEQ    L_635C                          ; 6352   020C 0008

        SUBI    #$0002, R5                      ; 6354   033D 0002
        MVI@    R5,     R4                      ; 6356   02AC
        AND@    R3,     R4                      ; 6357   039C
        BEQ     L_6366                          ; 6358   0204 000C
        B       L_6360                          ; 635A   0200 0004

L_635C:
        MVI@    R3,     R4                      ; 635C   029C
        COMR    R4                              ; 635D   001C
        AND@    R2,     R4                      ; 635E   0394
        MVO@    R4,     R2                      ; 635F   0254
L_6360:
        MOVR    R3,     R4                      ; 6360   009C
        DECR    R4                              ; 6361   0014
        MVI@    R4,     R4                      ; 6362   02A4
        COMR    R4                              ; 6363   001C
        AND@    R2,     R4                      ; 6364   0394
        MVO@    R4,     R2                      ; 6365   0254
L_6366:
        MVI     G_015D, R0                      ; 6366   0280 015D
        INCR    R0                              ; 6368   0008
        CMPI    #$0004, R0                      ; 6369   0378 0004
        BNEQ    L_62E1                          ; 636B   022C 008B
        PULR    R7                              ; 636D   02B7

        DECLE   $000C,  $0019,  $0013,  $0006   ; 636E   000C 0019 0013 0006
        DECLE   $0000,  $000C,  $000C,  $0015   ; 6372   0000 000C 000C 0015
        DECLE   $0015,  $000A,  $000A,  $0001   ; 6376   0015 000A 000A 0001
        DECLE   $0001,  $0002,  $0004,  $0008   ; 637A   0001 0002 0004 0008
        DECLE   $0001,  $0002,  $0004           ; 637E   0001 0002 0004

        PSHR    R5                              ; 6381   0275
        MVII    #$0010, R0                      ; 6382   02B8 0010
        MVII    #$0080, R1                      ; 6384   02B9 0080
        SWAP    R1,     1                       ; 6386   0041
        MVII    #$032C, R4                      ; 6387   02BC 032C

        JSR     R5,     X_FILL_MEM              ; 6389   0004 0114 0341

        MVII    #$000F, R0                      ; 638C   02B8 000F
        MVO     R0,     G_0186                  ; 638E   0240 0186

        JSR     R5,     L_64F9                  ; 6390   0004 0164 00F9

        MVO     R0,     G_0186                  ; 6393   0240 0186

        JSR     R5,     L_64F9                  ; 6395   0004 0164 00F9
        DECLE   $0240,  $0167,  $0001,  $02F8   ; 6398   0240 0167 0001 02F8
        DECLE   $00F0,  $0083,  $0240,  $0324   ; 639C   00F0 0083 0240 0324
        DECLE   $0280,  $0167,  $004C,  $02F8   ; 63A0   0280 0167 004C 02F8
        DECLE   $00DF,  $0004                   ; 63A4   00DF 0004

        ANDR    R2,     R0                      ; 63A6   0190
        RSWD    R5                              ; 63A7   003D
        MVII    #$0001, R0                      ; 63A8   02B8 0001
        MVO     R0,     G_0142                  ; 63AA   0240 0142
        CLRR    R3                              ; 63AC   01DB
        MVO     R3,     G_0143                  ; 63AD   0243 0143
        MVO     R3,     G_0144                  ; 63AF   0243 0144
        MVII    #$0113, R4                      ; 63B1   02BC 0113
        MVI@    R4,     R0                      ; 63B3   02A0
        CMPI    #$0080, R0                      ; 63B4   0378 0080
        BEQ     L_6474                          ; 63B6   0204 00BC

        CMP     G_0167, R3                      ; 63B8   0343 0167
        BEQ     L_63DF                          ; 63BA   0204 0023

        MVI     G_0142, R1                      ; 63BC   0281 0142
        CMPI    #$0008, R1                      ; 63BE   0379 0008
        BEQ     L_63DF                          ; 63C0   0204 001D

        MVII    #$0064, R0                      ; 63C2   02B8 0064

        JSR     R5,     X_RAND2                 ; 63C4   0004 0114 029E

        CMPI    #$003C, R0                      ; 63C7   0378 003C
        BGE     L_63DF                          ; 63C9   020D 0014

        MVII    #$0008, R0                      ; 63CB   02B8 0008

        JSR     R5,     X_RAND2                 ; 63CD   0004 0114 029E

        INCR    R0                              ; 63D0   0008
        SLL     R0,     2                       ; 63D1   004C
        SWAP    R0,     1                       ; 63D2   0040
        ADDR    R3,     R0                      ; 63D3   00D8
        SDBD                                    ; 63D4   0001
        ADDI    #$83F0, R0                      ; 63D5   02F8 00F0 0083
        ADDI    #$0324, R1                      ; 63D8   02F9 0324
        MVO@    R0,     R1                      ; 63DA   0248
        SUBI    #$0323, R1                      ; 63DB   0339 0323
        MVO     R1,     G_0142                  ; 63DD   0241 0142
L_63DF:
        CLRR    R2                              ; 63DF   01D2
        DECLE   $0281,  $0143,  $0379,  $0007   ; 63E0   0281 0143 0379 0007
        DECLE   $0204,  $003B                   ; 63E4   0204 003B

        MVII    #$0064, R0                      ; 63E6   02B8 0064

        JSR     R5,     X_RAND2                 ; 63E8   0004 0114 029E
        DECLE   $0378,  $0037,  $020D,  $0032   ; 63EB   0378 0037 020D 0032
        DECLE   $0280,  $0110,  $0004,  $0190   ; 63EF   0280 0110 0004 0190
        DECLE   $002A,  $003C,  $0201,  $0014   ; 63F3   002A 003C 0201 0014
        DECLE   $0004,  $0190,  $002A,  $003D   ; 63F7   0004 0190 002A 003D
        DECLE   $002F,  $0060,  $0004           ; 63FB   002F 0060 0004

        ANDR    R2,     R0                      ; 63FE   0190
        ADCR    R2                              ; 63FF   002A
        RSWD    R6                              ; 6400   003E
        BC      L_6408                          ; 6401   0201 0005

        JSR     R5,     X_CLAMP                 ; 6403   0004 0114 0270

        DIS                                     ; 6406   0003
        INCR    R5                              ; 6407   000D

L_6408:
        JSR     R5,     X_RAND2                 ; 6408   0004 0114 029E

        INCR    R0                              ; 640B   0008

        JSR     R5,     X_CLAMP                 ; 640C   0004 0114 0270
        DECLE   $0001                           ; 640F   0001

        INCR    R5                              ; 6410   000D
        MOVR    R1,     R2                      ; 6411   008A
        ADDI    #$0122, R2                      ; 6412   02FA 0122

        JSR     R5,     L_64D9                  ; 6414   0004 0164 00D9
        DECLE   $0098,  $02F8,  $03F0,  $02F9   ; 6417   0098 02F8 03F0 02F9
        DECLE   $032C,  $0248,  $0339,  $032B   ; 641B   032C 0248 0339 032B
        DECLE   $0241,  $0143,  $0004           ; 641F   0241 0143 0004

        ANDR    R2,     R0                      ; 6422   0190
        ADCR    R2                              ; 6423   002A
        GSWD    R1                              ; 6424   0031
        BNC     L_6474                          ; 6425   0209 004D

        MVI     G_0144, R1                      ; 6427   0281 0144
        CMPI    #$0008, R1                      ; 6429   0379 0008
        BEQ     L_6474                          ; 642B   0204 0047

        MVII    #$0064, R0                      ; 642D   02B8 0064

        JSR     R5,     X_RAND2                 ; 642F   0004 0114 029E

        TSTR    R2                              ; 6432   0092
        BEQ     L_6437                          ; 6433   0204 0002

        SUBI    #$0014, R0                      ; 6435   0338 0014
L_6437:
        CMPI    #$002D, R0                      ; 6437   0378 002D
        BGE     L_6474                          ; 6439   020D 0039

        JSR     R5,     L_651F                  ; 643B   0004 0164 011F
        DECLE   $0001,  $02BD,  $0050,  $00DF   ; 643E   0001 02BD 0050 00DF
        DECLE   $0048,  $00C5,  $004C,  $008A   ; 6442   0048 00C5 004C 008A
        DECLE   $02FA,  $012A,  $0250,  $02A8   ; 6446   02FA 012A 0250 02A8
        DECLE   $0078,  $0209,  $0005           ; 644A   0078 0209 0005

        JSR     R5,     L_DF90                  ; 644D   0004 01DC 0390
        DECLE   $0200,  $0003,  $0004,  $01DC   ; 6450   0200 0003 0004 01DC
        DECLE   $03BC,  $03D0,  $0378,  $00FF   ; 6454   03BC 03D0 0378 00FF
        DECLE   $020C,  $000F,  $0011,  $0285   ; 6458   020C 000F 0011 0285
        DECLE   $0110,  $037D,  $001E,  $0205   ; 645C   0110 037D 001E 0205
        DECLE   $0008,  $0004                   ; 6460   0008 0004

        ANDR    R2,     R0                      ; 6462   0190
        ADCR    R2                              ; 6463   002A
        MOVR    R5,     R3                      ; 6464   00AB
        BNC     L_6469                          ; 6465   0209 0002

        MVII    #$00FF, R0                      ; 6467   02B8 00FF
L_6469:
        MVO@    R0,     R2                      ; 6469   0250
        MOVR    R3,     R0                      ; 646A   0098
        ADDI    #$03F0, R0                      ; 646B   02F8 03F0
        ADDI    #$0334, R1                      ; 646D   02F9 0334
        MVO@    R0,     R1                      ; 646F   0248
        SUBI    #$0333, R1                      ; 6470   0339 0333
        MVO     R1,     G_0144                  ; 6472   0241 0144
L_6474:
        INCR    R3                              ; 6474   000B
        DECLE   $037B,  $000F,  $022C,  $00C5   ; 6475   037B 000F 022C 00C5
        DECLE   $0285,  $0110,  $0345,  $01E3   ; 6479   0285 0110 0345 01E3
        DECLE   $0205,  $000A,  $0004           ; 647D   0205 000A 0004

        ANDR    R2,     R0                      ; 6480   0190
        ADCR    R2                              ; 6481   002A
        MOVR    R5,     R3                      ; 6482   00AB
        BNC     L_6489                          ; 6483   0209 0004

        MVII    #$00FF, R0                      ; 6485   02B8 00FF
        MVO     R0,     G_012A                  ; 6487   0240 012A
L_6489:
        MVI     G_0186, R0                      ; 6489   0280 0186
L_648B:
        MOVR    R0,     R1                      ; 648B   0081
        MVII    #$0003, R2                      ; 648C   02BA 0003

        JSR     R5,     X_DIV                   ; 648E   0004 011C 01FB

        MVO     R0,     G_0184                  ; 6491   0240 0184
        MVO     R1,     G_0185                  ; 6493   0241 0185

        JSR     R5,     L_5B5A                  ; 6495   0004 0158 035A
        JSR     R5,     L_650C                  ; 6498   0004 0164 010C

        MOVR    R5,     R1                      ; 649B   00A9
        MVII    #$000A, R2                      ; 649C   02BA 000A

        JSR     R5,     X_DIV                   ; 649E   0004 011C 01FB

        MVI     G_0184, R3                      ; 64A1   0283 0184
        ADDR    R3,     R3                      ; 64A3   00DB
        ADD     G_0184, R3                      ; 64A4   02C3 0184
        SLL     R3,     2                       ; 64A6   004F
        SLL     R3,     2                       ; 64A7   004F
        SLL     R3,     2                       ; 64A8   004F
        MVI     G_0185, R2                      ; 64A9   0282 0185
        SLL     R2,     2                       ; 64AB   004E
        ADD     G_0185, R2                      ; 64AC   02C2 0185
        SLL     R2,     1                       ; 64AE   004A
        ADDR    R2,     R3                      ; 64AF   00D3
        INCR    R3                              ; 64B0   000B
        MOVR    R0,     R2                      ; 64B1   0082
        SLL     R2,     2                       ; 64B2   004E
        SLL     R2,     1                       ; 64B3   004A
        NOP                                     ; 64B4   0034
        SLL     R2,     2                       ; 64B5   004E
        ADDR    R2,     R3                      ; 64B6   00D3
        ADDR    R1,     R3                      ; 64B7   00CB
        MVO     R3,     G_031D                  ; 64B8   0243 031D
        SLL     R0,     2                       ; 64BA   004C
        SLL     R0,     1                       ; 64BB   0048
        ADDI    #$0018, R0                      ; 64BC   02F8 0018
        MVO     R0,     G_0175                  ; 64BE   0240 0175
        SLL     R1,     2                       ; 64C0   004D
        SLL     R1,     1                       ; 64C1   0049
        ADDI    #$0048, R1                      ; 64C2   02F9 0048
        MVO     R1,     G_0174                  ; 64C4   0241 0174
        CLRR    R2                              ; 64C6   01D2
        MVO     R2,     G_0176                  ; 64C7   0242 0176
        DECR    R2                              ; 64C9   0012
        MVO     R2,     G_01CF                  ; 64CA   0242 01CF

        JSR     R5,     L_5E71                  ; 64CC   0004 015C 0271
        JSR     R5,     L_5EF0                  ; 64CF   0004 015C 02F0

        SDBD                                    ; 64D2   0001
        MVII    #$8000, R1                      ; 64D3   02B9 0000 0080
        MVO     R1,     G_0333                  ; 64D6   0241 0333
        PULR    R7                              ; 64D8   02B7

L_64D9:
        PSHR    R5                              ; 64D9   0275
        MOVR    R0,     R4                      ; 64DA   0084
        SLL     R0,     2                       ; 64DB   004C
        SLL     R0,     1                       ; 64DC   0048
        MVO@    R0,     R2                      ; 64DD   0250
        ANDI    #$00F8, R0                      ; 64DE   03B8 00F8
        MOVR    R0,     R4                      ; 64E0   0084
        ADDR    R0,     R4                      ; 64E1   00C4
        ADDR    R0,     R4                      ; 64E2   00C4
        SDBD                                    ; 64E3   0001
        ADDI    #$F72D, R4                      ; 64E4   02FC 002D 00F7
        MVI@    R4,     R4                      ; 64E7   02A4
        ANDI    #$03C0, R4                      ; 64E8   03BC 03C0
        CLRR    R0                              ; 64EA   01C0
L_64EB:
        PSHR    R0                              ; 64EB   0270
        DECLE   $0004                           ; 64EC   0004

        ANDR    R4,     R0                      ; 64ED   01A0
        ADDI    #$0028, R4                      ; 64EE   02FC 0028
        ADD@    R6,     R0                      ; 64F0   02F0
        SUBI    #$0040, R4                      ; 64F1   033C 0040
        BGT     L_64EB                          ; 64F3   022E 0009

        ADDI    #$0018, R2                      ; 64F5   02FA 0018
        MVO@    R0,     R2                      ; 64F7   0250
        PULR    R7                              ; 64F8   02B7

L_64F9:
        PSHR    R5                              ; 64F9   0275
L_64FA:
        MVII    #$000F, R0                      ; 64FA   02B8 000F

        JSR     R5,     X_RAND2                 ; 64FC   0004 0114 029E

        MOVR    R0,     R5                      ; 64FF   0085
        CMP     G_0186, R0                      ; 6500   0340 0186
        BEQ     L_64FA                          ; 6502   0224 0009

        ADDI    #$0113, R5                      ; 6504   02FD 0113
        MVI@    R5,     R5                      ; 6506   02AD
        CMPI    #$0080, R5                      ; 6507   037D 0080
        BEQ     L_64FA                          ; 6509   0224 0010
        PULR    R7                              ; 650B   02B7

L_650C:
        PSHR    R5                              ; 650C   0275
        MVI     G_01C6, R0                      ; 650D   0280 01C6

        JSR     R5,     X_RAND2                 ; 650F   0004 0114 029E

        MVII    #$0189, R5                      ; 6512   02BD 0189
        MVII    #$000F, R2                      ; 6514   02BA 000F
L_6516:
        CMP@    R5,     R2                      ; 6516   036A
        BEQ     L_6516                          ; 6517   0224 0002

        DECR    R0                              ; 6519   0010
        BPL     L_6516                          ; 651A   0223 0005

        SUBI    #$018A, R5                      ; 651C   033D 018A
        PULR    R7                              ; 651E   02B7

L_651F:
        PSHR    R5                              ; 651F   0275
        PSHR    R4                              ; 6520   0274
        MOVR    R7,     R4                      ; 6521   00BC
        ADDI    #$0010, R4                      ; 6522   02FC 0010
        MVII    #$000A, R0                      ; 6524   02B8 000A

        JSR     R5,     X_RAND1                 ; 6526   0004 0114 027D

L_6529:
        CMP@    R4,     R0                      ; 6529   0360
        BGT     L_6529                          ; 652A   022E 0002

        SUBR    R7,     R4                      ; 652C   013C
        SUBI    #$0006, R4                      ; 652D   033C 0006
        MOVR    R4,     R0                      ; 652F   00A0
        PULR    R4                              ; 6530   02B4
        PULR    R7                              ; 6531   02B7

        SLR     R3,     1                       ; 6532   0063
        MOVR    R5,     R6                      ; 6533   00AE
        ADDR    R0,     R2                      ; 6534   00C2
        ADDR    R4,     R4                      ; 6535   00E4
        ADDR    R7,     R5                      ; 6536   00FD
        SUBR    R5,     R7                      ; 6537   012F

        DECLE   $0148,  $0161,  $0172,  $018C   ; 6538   0148 0161 0172 018C
        DECLE   $01AA,  $01BE,  $01E3,  $01FC   ; 653C   01AA 01BE 01E3 01FC
        DECLE   $021A,  $0233,  $0251,  $0278   ; 6540   021A 0233 0251 0278

        MVI@    R3,     R3                      ; 6544   029B
        MVI@    R5,     R7                      ; 6545   02AF

        PULR    R3                              ; 6546   02B3
        ADD@    R1,     R4                      ; 6547   02CC
        ADD@    R4,     R5                      ; 6548   02E5
        SUB@    R2,     R7                      ; 6549   0317

        SUBI    #$034E, R2                      ; 654A   033A 034E
        CMP@    R5,     R4                      ; 654C   036C
        AND     G_0394, R5                      ; 654D   0385 0394
        XOR@    R6,     R3                      ; 654F   03F3
        XORI    #$03FF, R1                      ; 6550   03F9 03FF
L_6552:
        PSHR    R5                              ; 6552   0275
        MVI     G_01D3, R1                      ; 6553   0281 01D3
        CMPI    #$00FF, R1                      ; 6555   0379 00FF
        BEQ     L_6581                          ; 6557   0204 0028

        CLRR    R0                              ; 6559   01C0
        MVII    #$0001, R2                      ; 655A   02BA 0001
L_655C:
        ANDR    R1,     R2                      ; 655C   018A
        BEQ     L_6563                          ; 655D   0204 0004

        INCR    R0                              ; 655F   0008
        SLL     R2,     1                       ; 6560   004A
        B       L_655C                          ; 6561   0220 0006

L_6563:
        MOVR    R0,     R2                      ; 6563   0082

        JSR     R5,     X_POW2                  ; 6564   0004 0114 0345

        XORR    R1,     R0                      ; 6567   01C8
        MVO     R0,     G_01D3                  ; 6568   0240 01D3
        MOVR    R2,     R1                      ; 656A   0091
        DECR    R4                              ; 656B   0014
        SLL     R2,     2                       ; 656C   004E
        SLL     R2,     2                       ; 656D   004E
        ADDI    #$000F, R2                      ; 656E   02FA 000F
        MVO@    R2,     R4                      ; 6570   0262

        JSR     R5,     L_684E                  ; 6571   0004 0168 004E
        JSR     R5,     L_68BE                  ; 6574   0004 0168 00BE

        MVI     G_01D0, R2                      ; 6577   0282 01D0
        ADDI    #$0200, R2                      ; 6579   02FA 0200
        MVI@    R2,     R0                      ; 657B   0290
        AND     G_0318, R0                      ; 657C   0380 0318
        MVO@    R0,     R2                      ; 657E   0250
        CLRC                                    ; 657F   0006
        PULR    R7                              ; 6580   02B7

L_6581:
        SETC                                    ; 6581   0007
        PULR    R7                              ; 6582   02B7

        DECLE   $0004,  $0190,  $003C,  $001C   ; 6583   0004 0190 003C 001C
        DECLE   $0004,  $0190,  $002A,  $0016   ; 6587   0004 0190 002A 0016
        DECLE   $0201,  $002D,  $0004,  $0190   ; 658B   0201 002D 0004 0190
        DECLE   $003C,  $0027                   ; 658F   003C 0027

        JSR     R5,     L_5E71                  ; 6591   0004 015C 0271

        MVI     G_0176, R0                      ; 6594   0280 0176
        CMPI    #$0004, R0                      ; 6596   0378 0004
        BNEQ    L_65B4                          ; 6598   020C 001A

        SLR     R0,     1                       ; 659A   0060
        MVI     G_01CF, R2                      ; 659B   0282 01CF
        CMPI    #$0027, R2                      ; 659D   037A 0027
        BEQ     L_65B2                          ; 659F   0204 0011

        ADDI    #$0189, R2                      ; 65A1   02FA 0189

        JSR     R5,     L_607C                  ; 65A3   0004 0160 007C

        ANDR    R0,     R1                      ; 65A6   0181
        XORR    R1,     R0                      ; 65A7   01C8
        BEQ     L_65B2                          ; 65A8   0204 0008

        INCR    R2                              ; 65AA   000A

        JSR     R5,     L_607C                  ; 65AB   0004 0160 007C

        ANDI    #$0008, R1                      ; 65AE   03B9 0008
        SLR     R1,     2                       ; 65B0   0065
        XORR    R1,     R0                      ; 65B1   01C8
L_65B2:
        MVO     R0,     G_0176                  ; 65B2   0240 0176
L_65B4:
        MVII    #$00C0, R0                      ; 65B4   02B8 00C0
        MVO     R0,     G_016F                  ; 65B6   0240 016F
        B       L_65BD                          ; 65B8   0200 0003

        CLRR    R0                              ; 65BA   01C0
        MVO     R0,     G_016F                  ; 65BB   0240 016F

L_65BD:
        JSR     R5,     L_5B48                  ; 65BD   0004 0158 0348
        DECLE   $0000,  $01C0,  $0240,  $01D2   ; 65C0   0000 01C0 0240 01D2
        DECLE   $0004,  $0190,  $0041,  $0015   ; 65C4   0004 0190 0041 0015
        DECLE   $0280,  $01D4,  $0240,  $01E4   ; 65C8   0280 01D4 0240 01E4
        DECLE   $02BC,  $027A,  $0004           ; 65CC   02BC 027A 0004

        ANDR    R5,     R4                      ; 65CF   01AC
        MVI@    R4,     R4                      ; 65D0   02A4
        MVII    #$00FD, R0                      ; 65D1   02B8 00FD
        MVO     R0,     G_01D4                  ; 65D3   0240 01D4
        MVII    #$0218, R0                      ; 65D5   02B8 0218
        MVO     R0,     G_0345                  ; 65D7   0240 0345
        MVII    #$0138, R0                      ; 65D9   02B8 0138
        MVO     R0,     G_034D                  ; 65DB   0240 034D
        SDBD                                    ; 65DD   0001
        MVII    #$08AF, R0                      ; 65DE   02B8 00AF 0008
        MVO     R0,     G_0355                  ; 65E1   0240 0355
        PULR    R7                              ; 65E3   02B7

        DECLE   $0004,  $0190,  $002A,  $0029   ; 65E4   0004 0190 002A 0029
        DECLE   $0209,  $0031,  $0004           ; 65E8   0209 0031 0004

        ANDR    R2,     R0                      ; 65EB   0190
        ADCR    R2                              ; 65EC   002A
L_65ED:
        DECR    R7                              ; 65ED   0017

        DECLE   $0209,  $0018,  $0280,  $0345   ; 65EE   0209 0018 0280 0345
        DECLE   $0008,  $0240,  $0345,  $0338   ; 65F2   0008 0240 0345 0338
        DECLE   $0240,  $0340,  $0160,  $0205   ; 65F6   0240 0340 0160 0205
        DECLE   $01E1,  $0004                   ; 65FA   01E1 0004

        ANDR    R2,     R0                      ; 65FC   0190
        RSWD    R4                              ; 65FD   003C
L_65FE:
        DECR    R7                              ; 65FE   0017

        DECLE   $0004,  $0190,  $003C,  $0029   ; 65FF   0004 0190 003C 0029
        DECLE   $0004                           ; 6603   0004

        ANDR    R4,     R4                      ; 6604   01A4
        SLLC    R2,     1                       ; 6605   005A
        B       L_6768                          ; 6606   0200 0160

        DECLE   $01C0,  $0281,  $01D5,  $007D   ; 6608   01C0 0281 01D5 007D
        DECLE   $0054,  $02F9,  $0345,  $02C8   ; 660C   0054 02F9 0345 02C8
        DECLE   $0010,  $0248,  $03B8,  $0007   ; 6610   0010 0248 03B8 0007
        DECLE   $020C,  $0004,  $0004           ; 6614   020C 0004 0004

        ANDR    R2,     R0                      ; 6617   0190
        RSWD    R4                              ; 6618   003C
        ADCR    R1                              ; 6619   0029
        PULR    R7                              ; 661A   02B7

        MVI     G_01D4, R2                      ; 661B   0282 01D4
        CMPI    #$007F, R2                      ; 661D   037A 007F
        BLE     L_6626                          ; 661F   0206 0005

        MVII    #$0004, R3                      ; 6621   02BB 0004
        NEGR    R3                              ; 6623   0023
        B       L_6629                          ; 6624   0200 0003

L_6626:
        MOVR    R2,     R3                      ; 6626   0093
        ANDI    #$0004, R3                      ; 6627   03BB 0004
L_6629:
        ANDI    #$0003, R2                      ; 6629   03BA 0003
        MVI     G_01D2, R1                      ; 662B   0281 01D2
        INCR    R1                              ; 662D   0009
        ADDR    R7,     R1                      ; 662E   00F9
        ADD@    R1,     R7                      ; 662F   02CF

        DECLE   $01AC,  $000E,  $0005           ; 6630   01AC 000E 0005

        COMR    R6                              ; 6633   001E
L_6634:
        DECR    R7                              ; 6634   0017

        CMPI    #$0003, R2                      ; 6635   037A 0003
        BEQ     L_67DC                          ; 6637   0204 01A3

        INCR    R2                              ; 6639   000A
        MVII    #$0001, R4                      ; 663A   02BC 0001
        B       L_6656                          ; 663C   0200 0018

        TSTR    R3                              ; 663E   009B
        BMI     L_67DC                          ; 663F   020B 019B

        SUBI    #$0004, R3                      ; 6641   033B 0004
        MVII    #$0020, R4                      ; 6643   02BC 0020
        B       L_6656                          ; 6645   0200 000F

        DECR    R2                              ; 6647   0012
        BMI     L_67DC                          ; 6648   020B 0192

        MVII    #$0000, R4                      ; 664A   02BC 0000
        B       L_6656                          ; 664C   0200 0008

        ADDI    #$0004, R3                      ; 664E   02FB 0004
        CMPI    #$0008, R3                      ; 6650   037B 0008
        BEQ     L_67DC                          ; 6652   0204 0188

        MVII    #$0021, R4                      ; 6654   02BC 0021
L_6656:
        MVO     R4,     G_01D5                  ; 6656   0244 01D5
        DECLE   $00D3,  $0243,  $01D4,  $0004   ; 6658   00D3 0243 01D4 0004

        ANDR    R2,     R0                      ; 665C   0190
        SWAP    R1,     1                       ; 665D   0041
        ADCR    R1                              ; 665E   0029
        PULR    R7                              ; 665F   02B7

        DECLE   $0004,  $0064,  $03DD           ; 6660   0004 0064 03DD

        JSR     R5,     L_6805                  ; 6663   0004 0168 0005

        BEQ     L_6674                          ; 6666   0204 000C

        PSHR    R1                              ; 6668   0271
        MOVR    R2,     R1                      ; 6669   0091

        JSR     R5,     L_67ED                  ; 666A   0004 0164 03ED
        DECLE   $00A1,  $0339,  $020A,  $02B4   ; 666D   00A1 0339 020A 02B4
        DECLE   $0004                           ; 6671   0004

        AND@    R2,     R0                      ; 6672   0390
        PSHR    R4                              ; 6673   0274
L_6674:
        MVI     G_01D4, R2                      ; 6674   0282 01D4
        CMPI    #$00FC, R2                      ; 6676   037A 00FC
        BMI     L_67DC                          ; 6678   020B 0162

        ADDI    #$0004, R2                      ; 667A   02FA 0004
        ANDI    #$00FF, R2                      ; 667C   03BA 00FF
        INCR    R2                              ; 667E   000A
        ADDR    R7,     R2                      ; 667F   00FA
        ADD@    R2,     R7                      ; 6680   02D7

        DECLE   $0004                           ; 6681   0004

        ADDR    R4,     R7                      ; 6682   00E7

        CMPR    R3,     R3                      ; 6683   015B
        INCR    R5                              ; 6684   000D
        MVI     G_01E7, R0                      ; 6685   0280 01E7
        TSTR    R0                              ; 6687   0080
        BNEQ    L_67DC                          ; 6688   020C 0152

        JSR     R5,     L_6CF7                  ; 668A   0004 016C 00F7

        PULR    R7                              ; 668D   02B7

        DECLE   $0004,  $0190,  $002A,  $0016   ; 668E   0004 0190 002A 0016
        DECLE   $0201,  $0148,  $0004           ; 6692   0201 0148 0004

        ANDR    R2,     R4                      ; 6695   0194
        MVI     .BTAB.09,R6                     ; 6696   0286 0209
        ADDR    R1,     R7                      ; 6698   00CF

        MVI     G_01DA, R1                      ; 6699   0281 01DA
        TSTR    R1                              ; 669B   0089
        BEQ     L_6768                          ; 669C   0204 00CA

        MVI     G_01D9, R5                      ; 669E   0285 01D9
        ANDI    #$00F0, R5                      ; 66A0   03BD 00F0
        BNEQ    L_6768                          ; 66A2   020C 00C4

        MVII    #$000A, R2                      ; 66A4   02BA 000A

        JSR     R5,     X_DIV                   ; 66A6   0004 011C 01FB

        SLL     R0,     2                       ; 66A9   004C
        ADDR    R0,     R1                      ; 66AA   00C1
        SLL     R0,     2                       ; 66AB   004C
        ADDR    R0,     R1                      ; 66AC   00C1
        ADDI    #$0230, R1                      ; 66AD   02F9 0230
        MVI@    R1,     R0                      ; 66AF   0288
        AND     G_0318, R0                      ; 66B0   0380 0318
        SDBD                                    ; 66B2   0001
        ADDI    #$08A5, R0                      ; 66B3   02F8 00A5 0008
        MVO@    R0,     R1                      ; 66B6   0248
        MVI     G_01D9, R0                      ; 66B7   0280 01D9
        ADDI    #$0083, R0                      ; 66B9   02F8 0083
        MVO     R0,     G_01D9                  ; 66BB   0240 01D9

        JSR     R5,     L_5B42                  ; 66BD   0004 0158 0342
        DECLE   $0007,  $0004                   ; 66C0   0007 0004

        ANDR    R2,     R0                      ; 66C2   0190
        SWAP    R1,     1                       ; 66C3   0041
        INCR    R2                              ; 66C4   000A
        MVII    #$0015, R0                      ; 66C5   02B8 0015
        MVO     R0,     G_01EE                  ; 66C7   0240 01EE
        B       L_6768                          ; 66C9   0200 009D

        DECLE   $0004,  $0064,  $03DD,  $0004   ; 66CB   0004 0064 03DD 0004

        ANDR    R2,     R0                      ; 66CF   0190
        ADCR    R2                              ; 66D0   002A
        DECR    R6                              ; 66D1   0016
        BNC     L_6711                          ; 66D2   0209 003D

        JSR     R5,     L_6805                  ; 66D4   0004 0168 0005
        DECLE   $0204,  $0103,  $03C0,  $01D3   ; 66D7   0204 0103 03C0 01D3
        DECLE   $0240,  $01D3,  $0288,  $0083   ; 66DB   0240 01D3 0288 0083
        DECLE   $0001,  $03B8,  $0000,  $00E0   ; 66DF   0001 03B8 0000 00E0
        DECLE   $0248,  $0098,  $0064,  $0060   ; 66E3   0248 0098 0064 0060
        DECLE   $03B8,  $003F,  $02F8,  $0314   ; 66E7   03B8 003F 02F8 0314
        DECLE   $0085,  $02B8,  $0080,  $0040   ; 66EB   0085 02B8 0080 0040
        DECLE   $0268,  $033D,  $020B,  $02A8   ; 66EF   0268 033D 020B 02A8
        DECLE   $0240,  $010C,  $0281,  $0346   ; 66F3   0240 010C 0281 0346
        DECLE   $0282,  $034E,  $03FA,  $0180   ; 66F7   0282 034E 03FA 0180
        DECLE   $02FA,  $0004,  $0241,  $0345   ; 66FB   02FA 0004 0241 0345
        DECLE   $0242,  $034D,  $0243,  $0355   ; 66FF   0242 034D 0243 0355
        DECLE   $0004                           ; 6703   0004

        ANDR    R2,     R0                      ; 6704   0190
        SWAP    R1,     1                       ; 6705   0041
L_6706:
        DECR    R7                              ; 6706   0017

        DECLE   $0004                           ; 6707   0004

        ANDR    R2,     R0                      ; 6708   0190
        SWAP    R1,     1                       ; 6709   0041
        ADCR    R1                              ; 670A   0029
        CLRR    R0                              ; 670B   01C0

        JSR     R5,     L_6C99                  ; 670C   0004 016C 0099
        DECLE   $0001                           ; 670F   0001

        PULR    R7                              ; 6710   02B7

L_6711:
        MVI     G_01CF, R1                      ; 6711   0281 01CF
        ADDI    #$0189, R1                      ; 6713   02F9 0189
        MVI@    R1,     R0                      ; 6715   0288
        ANDI    #$000F, R0                      ; 6716   03B8 000F
        CMPI    #$000E, R0                      ; 6718   0378 000E
        BNEQ    L_67DC                          ; 671A   020C 00C0

        JSR     R5,     L_6805                  ; 671C   0004 0168 0005

        BEQ     L_67DC                          ; 671F   0204 00BB

        MVI     G_01D0, R3                      ; 6721   0283 01D0
        ADDI    #$0200, R3                      ; 6723   02FB 0200
        MVI@    R3,     R5                      ; 6725   029D
        ANDI    #$01F8, R5                      ; 6726   03BD 01F8
        BNEQ    L_672E                          ; 6728   020C 0004

        XOR     G_01D3, R0                      ; 672A   03C0 01D3
        MVO     R0,     G_01D3                  ; 672C   0240 01D3
L_672E:
        CMPI    #$0180, R5                      ; 672E   037D 0180
        BGE     L_67DC                          ; 6730   020D 00AA

        PSHR    R5                              ; 6732   0275
        MOVR    R2,     R0                      ; 6733   0090
        MOVR    R1,     R2                      ; 6734   008A
        MOVR    R0,     R1                      ; 6735   0081

        JSR     R5,     L_67ED                  ; 6736   0004 0164 03ED

        MVI     G_01CF, R1                      ; 6739   0281 01CF
        SLL     R1,     2                       ; 673B   004D
        SLL     R1,     2                       ; 673C   004D
        ADD     G_0186, R1                      ; 673D   02C1 0186
        MVO@    R1,     R4                      ; 673F   0261
        PULR    R5                              ; 6740   02B5
        MVI@    R3,     R1                      ; 6741   0299
        AND     G_0318, R1                      ; 6742   0381 0318
        MOVR    R1,     R4                      ; 6744   008C
        XOR@    R3,     R1                      ; 6745   03D9
        TSTR    R5                              ; 6746   00AD
        BNEQ    L_674A                          ; 6747   020C 0001

        CLRR    R1                              ; 6749   01C9
L_674A:
        PSHR    R1                              ; 674A   0271
        PSHR    R4                              ; 674B   0274
        MVI@    R2,     R1                      ; 674C   0291
        SDBD                                    ; 674D   0001
        ANDI    #$E000, R1                      ; 674E   03B9 0000 00E0
        MOVR    R1,     R4                      ; 6751   008C
        XOR@    R2,     R4                      ; 6752   03D4
        ADD@    R6,     R4                      ; 6753   02F4
        MVO@    R4,     R3                      ; 6754   025C
        ADD@    R6,     R1                      ; 6755   02F1
        MVO@    R1,     R2                      ; 6756   0251
        TSTR    R5                              ; 6757   00AD
        BEQ     L_67DC                          ; 6758   0204 0082

        SLR     R1,     2                       ; 675A   0065
        SLR     R1,     1                       ; 675B   0061
        ANDI    #$003F, R1                      ; 675C   03B9 003F
        SUBI    #$0020, R1                      ; 675E   0339 0020
        ADDI    #$0334, R1                      ; 6760   02F9 0334
        SLL     R0,     2                       ; 6762   004C
        SLL     R0,     2                       ; 6763   004C
        ADDI    #$000F, R0                      ; 6764   02F8 000F
        MVO@    R0,     R1                      ; 6766   0248
        PULR    R7                              ; 6767   02B7

L_6768:
        MVI     G_01E4, R0                      ; 6768   0280 01E4
        ANDI    #$0080, R0                      ; 676A   03B8 0080
        BEQ     L_67B9                          ; 676C   0204 004B

        XOR     G_01E4, R0                      ; 676E   03C0 01E4
        SLR     R0,     2                       ; 6770   0064
        SLR     R0,     2                       ; 6771   0064
        MVO     R0,     G_01D4                  ; 6772   0240 01D4

        JSR     R5,     X_POW2                  ; 6774   0004 0114 0345

        AND     G_01D3, R0                      ; 6777   0380 01D3
        BEQ     L_67B9                          ; 6779   0204 003E
        B       L_67AE                          ; 677B   0200 0031

        DECLE   $0004,  $0064,  $03DD           ; 677D   0004 0064 03DD

        JSR     R5,     L_6805                  ; 6780   0004 0168 0005

        BEQ     L_6768                          ; 6783   0224 001C

        MVO     R2,     G_01D4                  ; 6785   0242 01D4
        CMPI    #$027B, R1                      ; 6787   0379 027B
        BEQ     L_67AE                          ; 6789   0204 0023

        MVI@    R1,     R5                      ; 678B   028D
        SDBD                                    ; 678C   0001
        ANDI    #$E000, R5                      ; 678D   03BD 0000 00E0
        MOVR    R5,     R4                      ; 6790   00AC
        XOR@    R1,     R4                      ; 6791   03CC
        MVO@    R5,     R1                      ; 6792   024D
        MVII    #$027B, R3                      ; 6793   02BB 027B
        MVI@    R3,     R0                      ; 6795   0298
        AND     G_0318, R0                      ; 6796   0380 0318
        ADDR    R0,     R4                      ; 6798   00C4
        XOR@    R3,     R0                      ; 6799   03D8
        MVO@    R4,     R3                      ; 679A   025C
        TSTR    R0                              ; 679B   0080
        BEQ     L_67AE                          ; 679C   0204 0010

        MVI     G_01E4, R1                      ; 679E   0281 01E4
        SLR     R1,     2                       ; 67A0   0065
        SLR     R1,     2                       ; 67A1   0065
        ANDI    #$0007, R1                      ; 67A2   03B9 0007

        JSR     R5,     L_684E                  ; 67A4   0004 0168 004E

        MVI@    R1,     R5                      ; 67A7   028D
        SDBD                                    ; 67A8   0001
        ANDI    #$E000, R5                      ; 67A9   03BD 0000 00E0
        ADDR    R5,     R0                      ; 67AC   00E8
        MVO@    R0,     R1                      ; 67AD   0248

L_67AE:
        JSR     R5,     L_67E4                  ; 67AE   0004 0164 03E4

        SUBI    #$0334, R4                      ; 67B1   033C 0334
        XORI    #$008F, R5                      ; 67B3   03FD 008F
        ADDR    R5,     R4                      ; 67B5   00EC
        MOVR    R4,     R0                      ; 67B6   00A0
        B       L_67BA                          ; 67B7   0200 0001

L_67B9:
        CLRR    R0                              ; 67B9   01C0
L_67BA:
        MVO     R0,     G_01D4                  ; 67BA   0240 01D4

        JSR     R5,     L_6857                  ; 67BC   0004 0168 0057
        DECLE   $02BC,  $027A,  $0004           ; 67BF   02BC 027A 0004

        ANDR    R5,     R4                      ; 67C2   01AC
        MVI@    R3,     R2                      ; 67C3   029A
        MOVR    R5,     R0                      ; 67C4   00A8
        COMR    R0                              ; 67C5   0018
        CLRR    R0                              ; 67C6   01C0

        JSR     R5,     L_6C99                  ; 67C7   0004 016C 0099
        DECLE   $0001,  $0004,  $0190,  $003C   ; 67CA   0001 0004 0190 003C
        DECLE   $0015,  $0004,  $0190,  $002A   ; 67CE   0015 0004 0190 002A
        DECLE   $0016,  $0201,  $0004           ; 67D2   0016 0201 0004

        JSR     R5,     L_5E71                  ; 67D5   0004 015C 0271

        PULR    R7                              ; 67D8   02B7

        DECLE   $0004                           ; 67D9   0004

        ANDR    R2,     R4                      ; 67DA   0194
        MVO@    R1,     R1                      ; 67DB   0249
L_67DC:
        PULR    R7                              ; 67DC   02B7

        DECLE   $0004                           ; 67DD   0004

        ANDR    R2,     R0                      ; 67DE   0190
        ADCR    R2                              ; 67DF   002A
        ADCR    R1                              ; 67E0   0029
        BC      L_6804                          ; 67E1   0201 0021
        MOVR    R4,     R7                      ; 67E3   00A7

L_67E4:
        PSHR    R5                              ; 67E4   0275
        PSHR    R1                              ; 67E5   0271
        MVI     G_01D4, R1                      ; 67E6   0281 01D4

        JSR     R5,     L_67ED                  ; 67E8   0004 0164 03ED

        PULR    R1                              ; 67EB   02B1
        PULR    R7                              ; 67EC   02B7

L_67ED:
        PSHR    R5                              ; 67ED   0275
        SLL     R1,     2                       ; 67EE   004D
        SLL     R1,     2                       ; 67EF   004D
        ADDI    #$000F, R1                      ; 67F0   02F9 000F
        MVII    #$0334, R4                      ; 67F2   02BC 0334
L_67F4:
        MVI@    R4,     R5                      ; 67F4   02A5
        CMPI    #$0344, R4                      ; 67F5   037C 0344
        BGT     L_6802                          ; 67F7   020E 0009

        TSTR    R5                              ; 67F9   00AD
        BMI     L_67F4                          ; 67FA   022B 0007

        ANDI    #$007F, R5                      ; 67FC   03BD 007F
        CMPR    R5,     R1                      ; 67FE   0169
        BNEQ    L_67F4                          ; 67FF   022C 000C
        INCR    R7                              ; 6801   000F

L_6802:
        CLRR    R4                              ; 6802   01E4
L_6803:
        DECR    R4                              ; 6803   0014
L_6804:
        PULR    R7                              ; 6804   02B7

L_6805:
        PSHR    R5                              ; 6805   0275
        DECLE   $02B9,  $027B,  $0004           ; 6806   02B9 027B 0004

        ANDR    R2,     R0                      ; 6809   0190
        ADCR    R2                              ; 680A   002A
        DECR    R5                              ; 680B   0015
        BC      L_681A                          ; 680C   0201 000C

        MVI     G_01D4, R0                      ; 680E   0280 01D4
        ANDI    #$0080, R0                      ; 6810   03B8 0080
        BEQ     L_6804                          ; 6812   0224 000F

        XOR     G_01D4, R0                      ; 6814   03C0 01D4
        SLR     R0,     2                       ; 6816   0064
        SLR     R0,     2                       ; 6817   0064
        B       L_6835                          ; 6818   0200 001B

L_681A:
        MVI     G_01D4, R5                      ; 681A   0285 01D4
        MVI     G_01E4, R0                      ; 681C   0280 01E4
        SWAP    R0,     2                       ; 681E   0044
        BGE     L_682C                          ; 681F   020D 000B

        SLR     R0,     2                       ; 6821   0064
        SLR     R0,     2                       ; 6822   0064
        ANDI    #$0007, R0                      ; 6823   03B8 0007
L_6825:
        CMPR    R5,     R0                      ; 6825   0168
        BEQ     L_6804                          ; 6826   0224 0023

        CMPI    #$00FE, R5                      ; 6828   037D 00FE
        BEQ     L_6835                          ; 682A   0204 0009

L_682C:
        MOVR    R5,     R0                      ; 682C   00A8
        SWAP    R0,     1                       ; 682D   0040
        SWAP    R0,     1                       ; 682E   0040
        BMI     L_6825                          ; 682F   022B 000B

        MOVR    R0,     R1                      ; 6831   0081

        JSR     R5,     L_684E                  ; 6832   0004 0168 004E

L_6835:
        MOVR    R0,     R2                      ; 6835   0082

        JSR     R5,     X_POW2                  ; 6836   0004 0114 0345

        AND     G_01D3, R0                      ; 6839   0380 01D3
        PULR    R7                              ; 683B   02B7

L_683C:
        PSHR    R0                              ; 683C   0270
        MVI     G_01D4, R0                      ; 683D   0280 01D4
        TSTR    R0                              ; 683F   0080
        BEQ     L_684D                          ; 6840   0204 000B

        SLR     R0,     2                       ; 6842   0064
        SLR     R0,     2                       ; 6843   0064
        ANDI    #$0007, R0                      ; 6844   03B8 0007
        CMPR    R0,     R1                      ; 6846   0141
        PULR    R0                              ; 6847   02B0
        BNEQ    L_684E                          ; 6848   020C 0004

        MVII    #$027B, R1                      ; 684A   02B9 027B
        MOVR    R5,     R7                      ; 684C   00AF

L_684D:
        PULR    R0                              ; 684D   02B0
L_684E:
        CMPI    #$0004, R1                      ; 684E   0379 0004
        BLT     L_6854                          ; 6850   0205 0002

        ADDI    #$0010, R1                      ; 6852   02F9 0010
L_6854:
        ADDI    #$028D, R1                      ; 6854   02F9 028D
        MOVR    R5,     R7                      ; 6856   00AF

L_6857:
        PSHR    R5                              ; 6857   0275
        DECLE   $0083,  $0204,  $001E           ; 6858   0083 0204 001E

        ANDI    #$000F, R3                      ; 685B   03BB 000F
        ADDI    #$012A, R3                      ; 685D   02FB 012A
        MVI@    R3,     R0                      ; 685F   0298
        SLR     R0,     2                       ; 6860   0064
        SLR     R0,     1                       ; 6861   0060
        MOVR    R0,     R3                      ; 6862   0083

        JSR     R5,     X_CLAMP                 ; 6863   0004 0114 0270
        DECLE   $000E,  $0014,  $0143,  $020C   ; 6866   000E 0014 0143 020C
        DECLE   $000E,  $0004                   ; 686A   000E 0004

        ANDR    R2,     R0                      ; 686C   0190
        SWAP    R1,     1                       ; 686D   0041
        COMR    R4                              ; 686E   001C
        CLRR    R0                              ; 686F   01C0
L_6870:
        CMPI    #$0011, R3                      ; 6870   037B 0011
        BGE     L_6876                          ; 6872   020D 0002

        MVII    #$0007, R0                      ; 6874   02B8 0007
L_6876:
        MVO     R0,     G_01E1                  ; 6876   0240 01E1
        PULR    R7                              ; 6878   02B7

        DECLE   $0004                           ; 6879   0004

        ANDR    R2,     R0                      ; 687A   0190
        RSWD    R4                              ; 687B   003C
        COMR    R4                              ; 687C   001C
        CLRR    R0                              ; 687D   01C0
        B       L_6876                          ; 687E   0220 0009

L_6880:
        PSHR    R5                              ; 6880   0275
        DECLE   $0274,  $02BC,  $027B,  $0004   ; 6881   0274 02BC 027B 0004
        DECLE   $01AC,  $02A4,  $0004           ; 6885   01AC 02A4 0004

        ANDR    R5,     R4                      ; 6888   01AC
        MVI@    R4,     R4                      ; 6889   02A4
        MVII    #$0077, R1                      ; 688A   02B9 0077
        MVII    #$028D, R3                      ; 688C   02BB 028D
L_688E:
        MVI@    R3,     R0                      ; 688E   0298
        SDBD                                    ; 688F   0001
        ANDI    #$E000, R0                      ; 6890   03B8 0000 00E0
        MVO@    R0,     R3                      ; 6893   0258
        INCR    R3                              ; 6894   000B
        SARC    R1,     1                       ; 6895   0079
        BC      L_688E                          ; 6896   0221 0009
        BEQ     L_689E                          ; 6898   0204 0004

        MVII    #$02A1, R3                      ; 689A   02BB 02A1
        B       L_688E                          ; 689C   0220 000F

L_689E:
        PULR    R4                              ; 689E   02B4
        MVII    #$0008, R3                      ; 689F   02BB 0008
L_68A1:
        MOVR    R3,     R2                      ; 68A1   009A
        ADDI    #$0334, R2                      ; 68A2   02FA 0334
        MVI@    R2,     R5                      ; 68A4   0295
        MOVR    R5,     R1                      ; 68A5   00A9
        BMI     L_68B8                          ; 68A6   020B 0010

        ANDI    #$000F, R5                      ; 68A8   03BD 000F
        CMPI    #$000F, R5                      ; 68AA   037D 000F
        BNEQ    L_68B8                          ; 68AC   020C 000A

        SLR     R1,     2                       ; 68AE   0065
        SLR     R1,     2                       ; 68AF   0065
        ANDI    #$0007, R1                      ; 68B0   03B9 0007

        JSR     R5,     L_683C                  ; 68B2   0004 0168 003C
        JSR     R5,     L_68BE                  ; 68B5   0004 0168 00BE

L_68B8:
        INCR    R3                              ; 68B8   000B
        CMPI    #$0010, R3                      ; 68B9   037B 0010
        BNEQ    L_68A1                          ; 68BB   022C 001B
        PULR    R7                              ; 68BD   02B7

L_68BE:
        PSHR    R5                              ; 68BE   0275
        DECLE   $02B8,  $0320,  $00D8,  $004C   ; 68BF   02B8 0320 00D8 004C
        DECLE   $0048,  $009D,  $02FD,  $012A   ; 68C3   0048 009D 02FD 012A
        DECLE   $02AA,  $0095,  $03BD,  $00F8   ; 68C7   02AA 0095 03BD 00F8
        DECLE   $037D,  $00E8,  $020C,  $0004   ; 68CB   037D 00E8 020C 0004

        ADDI    #$0003, R0                      ; 68CF   02F8 0003
        B       L_68DE                          ; 68D1   0200 000B

        DECLE   $0004                           ; 68D3   0004

        ANDR    R2,     R0                      ; 68D4   0190
        ADCR    R2                              ; 68D5   002A
        COMR    R2                              ; 68D6   001A
        BNC     L_68DB                          ; 68D7   0209 0002

        ADD     G_031C, R2                      ; 68D9   02C2 031C
L_68DB:
        ANDI    #$0007, R2                      ; 68DB   03BA 0007
        ADDR    R2,     R0                      ; 68DD   00D0
L_68DE:
        MVI@    R1,     R5                      ; 68DE   028D
        SDBD                                    ; 68DF   0001
        ANDI    #$E000, R5                      ; 68E0   03BD 0000 00E0
        ADDR    R5,     R0                      ; 68E3   00E8
        MVO@    R0,     R1                      ; 68E4   0248
        PULR    R7                              ; 68E5   02B7

L_68E6:
        PSHR    R5                              ; 68E6   0275
        MVII    #$0334, R4                      ; 68E7   02BC 0334
        MVII    #$012A, R3                      ; 68E9   02BB 012A
L_68EB:
        MVI@    R4,     R1                      ; 68EB   02A1
        MOVR    R1,     R2                      ; 68EC   008A
        BMI     L_690F                          ; 68ED   020B 0020

        ANDI    #$000F, R1                      ; 68EF   03B9 000F
        CMPI    #$000F, R1                      ; 68F1   0379 000F
        BNEQ    L_690F                          ; 68F3   020C 001A

        MOVR    R2,     R1                      ; 68F5   0091
        SLR     R1,     2                       ; 68F6   0065
        SLR     R1,     2                       ; 68F7   0065
        ANDI    #$0007, R1                      ; 68F8   03B9 0007
        ADDI    #$0166, R1                      ; 68FA   02F9 0166
        MVI     G_0110, R0                      ; 68FC   0280 0110
        DECR    R0                              ; 68FE   0010
        BLE     L_690D                          ; 68FF   0206 000C

        MVI@    R3,     R0                      ; 6901   0298
        CMPI    #$00A0, R0                      ; 6902   0378 00A0
        BMI     L_690E                          ; 6904   020B 0008

        JSR     R5,     L_DFDE                  ; 6906   0004 01DC 03DE
        DECLE   $0004                           ; 6909   0004

        ANDR    R5,     R0                      ; 690A   01A8
        AND@    R2,     R6                      ; 690B   0396
        XORR    R3,     R6                      ; 690C   01DE
L_690D:
        MVI@    R3,     R0                      ; 690D   0298
L_690E:
        MVO@    R0,     R1                      ; 690E   0248
L_690F:
        INCR    R3                              ; 690F   000B
        CMPI    #$0344, R4                      ; 6910   037C 0344
        BNEQ    L_68EB                          ; 6912   022C 0028

        MVII    #$0166, R4                      ; 6914   02BC 0166
        MVII    #$0132, R1                      ; 6916   02B9 0132

        JSR     R5,     L_5AD0                  ; 6918   0004 0158 02D0
        DECLE   $0004                           ; 691B   0004

        ANDR    R5,     R4                      ; 691C   01AC
        MVI     .STIC.X.4,R4                    ; 691D   0284 0004
        CMPR    R3,     R0                      ; 691F   0158
        CMP     .STIC.X.5,R2                    ; 6920   0342 0005
L_6922:
        EIS                                     ; 6922   0002
        MVI     G_0319, R0                      ; 6923   0280 0319
        TSTR    R0                              ; 6925   0080
        BNEQ    L_6922                          ; 6926   022C 0005

        MVI     G_01E4, R1                      ; 6928   0281 01E4
        ANDI    #$00F0, R1                      ; 692A   03B9 00F0
        BEQ     L_6932                          ; 692C   0204 0004

        MOVR    R1,     R0                      ; 692E   0088
        SLR     R1,     2                       ; 692F   0065
        SLR     R1,     2                       ; 6930   0065
        ADDR    R0,     R1                      ; 6931   00C1
L_6932:
        MVO     R1,     G_01D4                  ; 6932   0241 01D4
        MVO     R1,     G_01E4                  ; 6934   0241 01E4

        JSR     R5,     L_6880                  ; 6936   0004 0168 0080

        PULR    R7                              ; 6939   02B7

L_693A:
        PSHR    R5                              ; 693A   0275
        MVI     G_017B, R0                      ; 693B   0280 017B
        INCR    R0                              ; 693D   0008
        MOVR    R0,     R1                      ; 693E   0081
        MVO     R0,     G_017B                  ; 693F   0240 017B
        ANDI    #$0007, R0                      ; 6941   03B8 0007
        BEQ     L_6957                          ; 6943   0204 0012

        MVI     G_017A, R2                      ; 6945   0282 017A
        TSTR    R2                              ; 6947   0092
        BEQ     L_6956                          ; 6948   0204 000C

        ADDR    R7,     R2                      ; 694A   00FA
        ADDI    #$0015, R2                      ; 694B   02FA 0015

        JSR     R5,     X_POW2                  ; 694D   0004 0114 0345

        AND@    R2,     R0                      ; 6950   0390
        BEQ     L_6956                          ; 6951   0204 0003

        JSR     R5,     L_6A66                  ; 6953   0004 0168 0266

L_6956:
        PULR    R7                              ; 6956   02B7

L_6957:
        ANDI    #$0038, R1                      ; 6957   03B9 0038
        BNEQ    L_695D                          ; 6959   020C 0002

        ADDI    #$0010, R1                      ; 695B   02F9 0010
L_695D:
        INCR    R1                              ; 695D   0009
        MVO     R1,     G_017B                  ; 695E   0241 017B
        PULR    R7                              ; 6960   02B7

        DECR    R0                              ; 6961   0010
        MOVR    R2,     R0                      ; 6962   0090
        RLC     R0,     2                       ; 6963   0054
        SAR     R0,     2                       ; 6964   006C
        ADDR    R5,     R4                      ; 6965   00EC
        ADDR    R7,     R4                      ; 6966   00FC
L_6967:
        PSHR    R5                              ; 6967   0275
        SDBD                                    ; 6968   0001
        MVII    #$39E0, R1                      ; 6969   02B9 00E0 0039
        MVI     G_035C, R5                      ; 696C   0285 035C
        MVI     G_0170, R0                      ; 696E   0280 0170
        ANDI    #$00E0, R0                      ; 6970   03B8 00E0
        MVI@    R5,     R4                      ; 6972   02AC
        MVI@    R5,     R3                      ; 6973   02AB
        MOVR    R3,     R2                      ; 6974   009A
        ANDI    #$0038, R3                      ; 6975   03BB 0038
        SUBR    R3,     R2                      ; 6977   011A
        SUBR    R3,     R4                      ; 6978   011C
L_6979:
        ADDR    R3,     R4                      ; 6979   00DC
        SUBI    #$0020, R0                      ; 697A   0338 0020
        BPL     L_6979                          ; 697C   0223 0004

        SDBD                                    ; 697E   0001
        ADDI    #$F878, R4                      ; 697F   02FC 0078 00F8
        MVII    #$0004, R0                      ; 6982   02B8 0004

L_6984:
        JSR     R5,     L_5AD0                  ; 6984   0004 0158 02D0

        SARC    R2,     1                       ; 6987   007A
        BC      L_6984                          ; 6988   0221 0005
        PULR    R7                              ; 698A   02B7

L_698B:
        PSHR    R5                              ; 698B   0275
        MVI     G_035C, R4                      ; 698C   0284 035C
        TSTR    R4                              ; 698E   00A4
        BEQ     L_6A0E                          ; 698F   0204 007D

        MVI     G_01C9, R3                      ; 6991   0283 01C9
        ADDI    #$032C, R3                      ; 6993   02FB 032C
        MVI@    R3,     R1                      ; 6995   0299
        SLR     R1,     2                       ; 6996   0065
        SLR     R1,     2                       ; 6997   0065
        ANDI    #$003F, R1                      ; 6998   03B9 003F
        MVII    #$000A, R2                      ; 699A   02BA 000A

        JSR     R5,     X_DIV                   ; 699C   0004 011C 01FB

        SLL     R0,     2                       ; 699F   004C
        SLL     R0,     1                       ; 69A0   0048
        SLL     R1,     2                       ; 69A1   004D
        SLL     R1,     1                       ; 69A2   0049
        ADDI    #$0148, R1                      ; 69A3   02F9 0148
        MVO     R1,     G_0177                  ; 69A5   0241 0177
        ADDI    #$0018, R0                      ; 69A7   02F8 0018
        MVO     R0,     G_0178                  ; 69A9   0240 0178
        CLRR    R2                              ; 69AB   01D2
        MVO     R2,     G_0179                  ; 69AC   0242 0179
        ADDI    #$0003, R4                      ; 69AE   02FC 0003
        MVI@    R4,     R2                      ; 69B0   02A2
        ANDI    #$0180, R2                      ; 69B1   03BA 0180
        ADDR    R2,     R0                      ; 69B3   00D0
        DECR    R4                              ; 69B4   0014
        MVI@    R4,     R3                      ; 69B5   02A3
        ANDI    #$001F, R3                      ; 69B6   03BB 001F
        SDBD                                    ; 69B8   0001
        ADDI    #$6C79, R3                      ; 69B9   02FB 0079 006C
        MVI@    R3,     R2                      ; 69BC   029A
        SLR     R2,     2                       ; 69BD   0066
        SLR     R2,     2                       ; 69BE   0066
        ANDI    #$000F, R2                      ; 69BF   03BA 000F
        SARC    R2,     1                       ; 69C1   007A
        BNC     L_69C8                          ; 69C2   0209 0004

        SDBD                                    ; 69C4   0001
        ADDI    #$1000, R2                      ; 69C5   02FA 0000 0010
L_69C8:
        SDBD                                    ; 69C8   0001
        DECLE   $02FA,  $00E0,  $0009,  $0270   ; 69C9   02FA 00E0 0009 0270
        DECLE   $0004                           ; 69CD   0004

        ANDR    R2,     R0                      ; 69CE   0190
        ADCR    R2                              ; 69CF   002A
        GSWD    R2                              ; 69D0   0032
        BC      L_69D5                          ; 69D1   0201 0002

        ADDI    #$0200, R1                      ; 69D3   02F9 0200
L_69D5:
        PULR    R0                              ; 69D5   02B0
        MVO     R1,     G_0348                  ; 69D6   0241 0348
        MVO     R0,     G_0350                  ; 69D8   0240 0350
        MVO     R2,     G_0358                  ; 69DA   0242 0358
        MVI@    R4,     R2                      ; 69DC   02A2
        MVI@    R4,     R3                      ; 69DD   02A3
        SLR     R3,     2                       ; 69DE   0067
        SLR     R3,     1                       ; 69DF   0063
        ANDI    #$0007, R3                      ; 69E0   03BB 0007
        ADDR    R3,     R0                      ; 69E2   00D8
        SUBI    #$0005, R4                      ; 69E3   033C 0005
        MVI@    R4,     R3                      ; 69E5   02A3
        ANDI    #$0002, R3                      ; 69E6   03BB 0002
        BEQ     L_6A15                          ; 69E8   0204 002B

        MOVR    R2,     R3                      ; 69EA   0093
        ANDI    #$0180, R3                      ; 69EB   03BB 0180
        ANDI    #$007F, R0                      ; 69ED   03B8 007F
        ADDR    R3,     R0                      ; 69EF   00D8
        ANDI    #$001F, R2                      ; 69F0   03BA 001F
        SDBD                                    ; 69F2   0001
        ADDI    #$6C79, R2                      ; 69F3   02FA 0079 006C
        MVI@    R2,     R3                      ; 69F6   0293
        MOVR    R3,     R2                      ; 69F7   009A
        SLR     R2,     2                       ; 69F8   0066
        SLR     R2,     2                       ; 69F9   0066
        ANDI    #$000F, R2                      ; 69FA   03BA 000F
        SARC    R2,     1                       ; 69FC   007A
        BNC     L_6A03                          ; 69FD   0209 0004

        SDBD                                    ; 69FF   0001
        ADDI    #$1000, R2                      ; 6A00   02FA 0000 0010
L_6A03:
        SDBD                                    ; 6A03   0001
        ADDI    #$09F0, R2                      ; 6A04   02FA 00F0 0009
        MVO     R1,     G_0349                  ; 6A07   0241 0349
        MVO     R0,     G_0351                  ; 6A09   0240 0351
        MVO     R2,     G_0359                  ; 6A0B   0242 0359
        PULR    R7                              ; 6A0D   02B7

L_6A0E:
        CLRR    R0                              ; 6A0E   01C0
        MVO     R0,     G_0348                  ; 6A0F   0240 0348
        MVO     R0,     G_0350                  ; 6A11   0240 0350
        MVO     R0,     G_0358                  ; 6A13   0240 0358
L_6A15:
        CLRR    R0                              ; 6A15   01C0
        MVO     R0,     G_0349                  ; 6A16   0240 0349
        MVO     R0,     G_0351                  ; 6A18   0240 0351
        MVO     R0,     G_0359                  ; 6A1A   0240 0359
        PULR    R7                              ; 6A1C   02B7

L_6A1D:
        PSHR    R5                              ; 6A1D   0275
        MVI     G_035C, R4                      ; 6A1E   0284 035C
        TSTR    R4                              ; 6A20   00A4
        BEQ     L_6ABC                          ; 6A21   0204 0099

        MVI     G_0177, R1                      ; 6A23   0281 0177
        MVI     G_0178, R0                      ; 6A25   0280 0178
        MVI     G_0348, R3                      ; 6A27   0283 0348
        SWAP    R3,     1                       ; 6A29   0043
        MVI     G_0179, R5                      ; 6A2A   0285 0179
        ANDI    #$0001, R5                      ; 6A2C   03BD 0001
        BNEQ    L_6A32                          ; 6A2E   020C 0002

        MVI     G_0179, R3                      ; 6A30   0283 0179
L_6A32:
        ANDI    #$0004, R3                      ; 6A32   03BB 0004
        DECLE   $0043,  $02F9,  $0100,  $02FC   ; 6A34   0043 02F9 0100 02FC
        DECLE   $0003,  $02A2,  $03BA,  $0180   ; 6A38   0003 02A2 03BA 0180
        DECLE   $00D0,  $00D8,  $0270,  $0004   ; 6A3C   00D0 00D8 0270 0004

        ANDR    R2,     R0                      ; 6A40   0190
        ADCR    R2                              ; 6A41   002A
        GSWD    R2                              ; 6A42   0032
        BC      L_6A47                          ; 6A43   0201 0002

        ADDI    #$0200, R1                      ; 6A45   02F9 0200
L_6A47:
        PULR    R0                              ; 6A47   02B0
        MVO     R1,     G_0348                  ; 6A48   0241 0348
        MVO     R0,     G_0350                  ; 6A4A   0240 0350
        MVI@    R4,     R3                      ; 6A4C   02A3
        ANDI    #$0180, R3                      ; 6A4D   03BB 0180
        SDBD                                    ; 6A4F   0001
        ANDI    #$047F, R0                      ; 6A50   03B8 007F 0004
        ADDR    R3,     R0                      ; 6A53   00D8
        MVI@    R4,     R3                      ; 6A54   02A3
        SLR     R3,     2                       ; 6A55   0067
        SLR     R3,     1                       ; 6A56   0063
        ANDI    #$0007, R3                      ; 6A57   03BB 0007
        ADDR    R3,     R0                      ; 6A59   00D8
        SUBI    #$0005, R4                      ; 6A5A   033C 0005
        MVI@    R4,     R3                      ; 6A5C   02A3
        ANDI    #$0002, R3                      ; 6A5D   03BB 0002
        BEQ     L_6ABC                          ; 6A5F   0204 005B

        MVO     R1,     G_0349                  ; 6A61   0241 0349
        MVO     R0,     G_0351                  ; 6A63   0240 0351
        PULR    R7                              ; 6A65   02B7

L_6A66:
        PSHR    R5                              ; 6A66   0275
        DECLE   $0285,  $01C9,  $037D,  $00FF   ; 6A67   0285 01C9 037D 00FF
        DECLE   $0204,  $004F,  $0004,  $0190   ; 6A6B   0204 004F 0004 0190
        DECLE   $002A,  $0016,  $0209,  $0003   ; 6A6F   002A 0016 0209 0003
        DECLE   $0004,  $03A0,  $00A5,  $0280   ; 6A73   0004 03A0 00A5 0280
        DECLE   $017C,  $0010,  $020B,  $0009   ; 6A77   017C 0010 020B 0009
        DECLE   $0240,  $017C,  $020C,  $003D   ; 6A7B   0240 017C 020C 003D
        DECLE   $0004                           ; 6A7F   0004

        ANDR    R2,     R0                      ; 6A80   0190
        SWAP    R1,     1                       ; 6A81   0041
        GSWD    R0                              ; 6A82   0030
        PULR    R7                              ; 6A83   02B7

        MVI     G_0179, R0                      ; 6A84   0280 0179
        DECR    R0                              ; 6A86   0010
        BMI     L_6ABD                          ; 6A87   020B 0034

        MVII    #$0177, R2                      ; 6A89   02BA 0177

        JSR     R5,     L_5F0A                  ; 6A8B   0004 015C 030A

        PSHR    R1                              ; 6A8E   0271

        JSR     R5,     L_6A1D                  ; 6A8F   0004 0168 021D

        PULR    R1                              ; 6A92   02B1
        ANDI    #$0007, R1                      ; 6A93   03B9 0007
        BEQ     L_6ABD                          ; 6A95   0204 0026

        MVI     G_0178, R0                      ; 6A97   0280 0178
        SUBI    #$0014, R0                      ; 6A99   0338 0014
        SLR     R0,     2                       ; 6A9B   0064
        SLR     R0,     1                       ; 6A9C   0060
        MOVR    R0,     R1                      ; 6A9D   0081
        SLL     R0,     2                       ; 6A9E   004C
        ADDR    R1,     R0                      ; 6A9F   00C8
        SLL     R0,     1                       ; 6AA0   0048
        MVI     G_0177, R1                      ; 6AA1   0281 0177
        SUBI    #$0044, R1                      ; 6AA3   0339 0044
        SLR     R1,     2                       ; 6AA5   0065
        SLR     R1,     1                       ; 6AA6   0061
        ADDR    R1,     R0                      ; 6AA7   00C8
        CMP     G_01D1, R0                      ; 6AA8   0340 01D1
        BEQ     L_6ABC                          ; 6AAA   0204 0010

        MVO     R0,     G_01D1                  ; 6AAC   0240 01D1
        MVI     G_01C9, R3                      ; 6AAE   0283 01C9
        ADDI    #$032C, R3                      ; 6AB0   02FB 032C
        MVI@    R3,     R2                      ; 6AB2   029A
        SDBD                                    ; 6AB3   0001
        ANDI    #$FC0F, R2                      ; 6AB4   03BA 000F 00FC
        MOVR    R0,     R1                      ; 6AB7   0081
        SLL     R1,     2                       ; 6AB8   004D
        SLL     R1,     2                       ; 6AB9   004D
        ADDR    R1,     R2                      ; 6ABA   00CA
        MVO@    R2,     R3                      ; 6ABB   025A
L_6ABC:
        PULR    R7                              ; 6ABC   02B7

L_6ABD:
        MVI     G_01D1, R1                      ; 6ABD   0281 01D1
        DECLE   $0301,  $01CF,  $02F9,  $001F   ; 6ABF   0301 01CF 02F9 001F
        DECLE   $0004                           ; 6AC3   0004

        ANDR    R2,     R0                      ; 6AC4   0190
        ADCR    R2                              ; 6AC5   002A
        RLC     R1,     2                       ; 6AC6   0055
        BNC     L_6ACB                          ; 6AC7   0209 0002

        MVII    #$003F, R1                      ; 6AC9   02B9 003F

L_6ACB:
        JSR     R4,     L_6AF3                  ; 6ACB   0004 0068 02F3
        DECLE   $0024,  $0029,  $001E,  $0015   ; 6ACE   0024 0029 001E 0015
        DECLE   $0020,  $0033,  $001D,  $000B   ; 6AD2   0020 0033 001D 000B
        DECLE   $0021,  $0028,  $0014,  $0016   ; 6AD6   0021 0028 0014 0016
        DECLE   $002A,  $0032,  $0013,  $000C   ; 6ADA   002A 0032 0013 000C
        DECLE   $002B,  $0034,  $0027           ; 6ADE   002B 0034 0027

        INCR    R2                              ; 6AE1   000A
L_6AE2:
        DECR    R7                              ; 6AE2   0017

        DECLE   $003D,  $001C,  $0001,  $0022   ; 6AE3   003D 001C 0001 0022
        DECLE   $003C,  $0012,  $0002,  $002C   ; 6AE7   003C 0012 0002 002C
        DECLE   $003E,  $0026,  $0000,  $0018   ; 6AEB   003E 0026 0000 0018
        DECLE   $0035                           ; 6AEF   0035

        GSWD    R1                              ; 6AF0   0031
        INCR    R1                              ; 6AF1   0009
        INCR    R5                              ; 6AF2   000D
L_6AF3:
        MVI@    R4,     R2                      ; 6AF3   02A2
        CLRR    R0                              ; 6AF4   01C0
        MVI     G_0182, R3                      ; 6AF5   0283 0182
L_6AF7:
        CMP@    R4,     R1                      ; 6AF7   0361
        BEQ     L_6B0F                          ; 6AF8   0204 0015

        INCR    R0                              ; 6AFA   0008
        DECR    R2                              ; 6AFB   0012
        BNEQ    L_6AF7                          ; 6AFC   022C 0006

        MVO     R2,     G_0182                  ; 6AFE   0242 0182
        MOVR    R3,     R0                      ; 6B00   0098
        BNEQ    L_6B14                          ; 6B01   020C 0011

        MVI     G_0179, R0                      ; 6B03   0280 0179
        DECR    R0                              ; 6B05   0010
L_6B06:
        BPL     L_6B17                          ; 6B06   0203 000F

        MVII    #$0002, R0                      ; 6B08   02B8 0002

        JSR     R5,     X_RAND1                 ; 6B0A   0004 0114 027D

        B       L_6B17                          ; 6B0D   0200 0008

L_6B0F:
        MVO     R3,     G_0179                  ; 6B0F   0243 0179
        ANDI    #$0003, R0                      ; 6B11   03B8 0003
        INCR    R0                              ; 6B13   0008
L_6B14:
        MVO     R0,     G_0182                  ; 6B14   0240 0182
        DECR    R0                              ; 6B16   0010
L_6B17:
        INCR    R0                              ; 6B17   0008
        MVO     R0,     G_0167                  ; 6B18   0240 0167
        MVII    #$0001, R0                      ; 6B1A   02B8 0001

        JSR     R5,     X_RAND1                 ; 6B1C   0004 0114 027D

        ADDR    R0,     R0                      ; 6B1F   00C0
        DECR    R0                              ; 6B20   0010
        MOVR    R0,     R3                      ; 6B21   0083
        MVI     G_0167, R0                      ; 6B22   0280 0167
L_6B24:
        MVO     R0,     G_0168                  ; 6B24   0240 0168
        MVII    #$0177, R4                      ; 6B26   02BC 0177
        PSHR    R3                              ; 6B28   0273

        JSR     R5,     L_5FD7                  ; 6B29   0004 015C 03D7

        PULR    R3                              ; 6B2C   02B3
        MOVR    R0,     R1                      ; 6B2D   0081
        BNEQ    L_6B3E                          ; 6B2E   020C 000E

L_6B30:
        MVI     G_0168, R0                      ; 6B30   0280 0168
        ADDR    R3,     R0                      ; 6B32   00D8
        ANDI    #$0003, R0                      ; 6B33   03B8 0003
        BNEQ    L_6B39                          ; 6B35   020C 0002

        MVII    #$0004, R0                      ; 6B37   02B8 0004
L_6B39:
        CMP     G_0167, R0                      ; 6B39   0340 0167
        BNEQ    L_6B24                          ; 6B3B   022C 0018
        PULR    R7                              ; 6B3D   02B7

L_6B3E:
        DECR    R1                              ; 6B3E   0011
        INCR    R1                              ; 6B3F   0009
        ADDR    R7,     R1                      ; 6B40   00F9
        ADD@    R1,     R7                      ; 6B41   02CF

        DECLE   $0004                           ; 6B42   0004

        INCR    R1                              ; 6B43   0009
        INCR    R6                              ; 6B44   000E
        DECR    R3                              ; 6B45   0013
        CMPI    #$0193, R2                      ; 6B46   037A 0193
        BLT     L_6B30                          ; 6B48   0225 0019
        PULR    R7                              ; 6B4A   02B7

        CMPI    #$01B0, R2                      ; 6B4B   037A 01B0
        BEQ     L_6B30                          ; 6B4D   0224 001E
        PULR    R7                              ; 6B4F   02B7

        CMPI    #$01BB, R2                      ; 6B50   037A 01BB
        BGT     L_6B30                          ; 6B52   022E 0023
        PULR    R7                              ; 6B54   02B7

        CMPI    #$01A7, R2                      ; 6B55   037A 01A7
        BEQ     L_6B30                          ; 6B57   0224 0028
        PULR    R7                              ; 6B59   02B7

L_6B5A:
        PSHR    R5                              ; 6B5A   0275
        MVII    #$01D6, R4                      ; 6B5B   02BC 01D6
        MOVR    R4,     R5                      ; 6B5D   00A5
        SDBD                                    ; 6B5E   0001
        MVI@    R4,     R2                      ; 6B5F   02A2
        INCR    R2                              ; 6B60   000A
        MVO@    R2,     R5                      ; 6B61   026A
        SWAP    R2,     1                       ; 6B62   0042
        MVO@    R2,     R5                      ; 6B63   026A
        PSHR    R2                              ; 6B64   0272

        JSR     R5,     L_6C1F                  ; 6B65   0004 016C 001F
        DECLE   $02B2,  $037A,  $0100,  $0201   ; 6B68   02B2 037A 0100 0201
        DECLE   $0078,  $0280,  $035C,  $0080   ; 6B6C   0078 0280 035C 0080
        DECLE   $0204,  $0008,  $0281,  $01C9   ; 6B70   0204 0008 0281 01C9
        DECLE   $02F9,  $032C,  $0288,  $0080   ; 6B74   02F9 032C 0288 0080
        DECLE   $0203,  $005C,  $0004,  $0190   ; 6B78   0203 005C 0004 0190
        DECLE   $0014,  $002B,  $000B,  $000D   ; 6B7C   0014 002B 000B 000D
        DECLE   $0000,  $020C,  $0053,  $0004   ; 6B80   0000 020C 0053 0004
        DECLE   $0190,  $002A,  $009D,  $0201   ; 6B84   0190 002A 009D 0201
        DECLE   $0008,  $0004,  $01A0,  $02FC   ; 6B88   0008 0004 01A0 02FC
        DECLE   $0026,  $0378,  $0001,  $020C   ; 6B8C   0026 0378 0001 020C
        DECLE   $0045                           ; 6B90   0045

        MVI     G_0183, R0                      ; 6B91   0280 0183
        MOVR    R0,     R1                      ; 6B93   0081
        ANDI    #$000F, R1                      ; 6B94   03B9 000F
        SUBR    R1,     R0                      ; 6B96   0108
        MOVR    R1,     R2                      ; 6B97   008A
        NEGR    R1                              ; 6B98   0021
        ANDR    R2,     R1                      ; 6B99   0191
        MOVR    R1,     R2                      ; 6B9A   008A
        SLR     R2,     1                       ; 6B9B   0062
        ADDR    R7,     R2                      ; 6B9C   00FA
        ADDI    #$0043, R2                      ; 6B9D   02FA 0043
        MVI@    R2,     R3                      ; 6B9F   0293
        CMPI    #$0004, R1                      ; 6BA0   0379 0004
        BLT     L_6BAC                          ; 6BA2   0205 0008

        XORI    #$000C, R1                      ; 6BA4   03F9 000C
        SLL     R1,     2                       ; 6BA6   004D
        ANDR    R1,     R0                      ; 6BA7   0188
        BEQ     L_6BAC                          ; 6BA8   0204 0002

        ADDI    #$0005, R3                      ; 6BAA   02FB 0005
L_6BAC:
        SLL     R3,     2                       ; 6BAC   004F
        SLL     R3,     2                       ; 6BAD   004F
        ADD     G_0186, R3                      ; 6BAE   02C3 0186
        MVO     R3,     G_0333                  ; 6BB0   0243 0333
        MVI     G_0110, R0                      ; 6BB2   0280 0110
        ADDI    #$0005, R0                      ; 6BB4   02F8 0005
        SLR     R0,     1                       ; 6BB6   0060

        JSR     R5,     X_CLAMP                 ; 6BB7   0004 0114 0270

        DIS                                     ; 6BBA   0003
        INCR    R5                              ; 6BBB   000D

        JSR     R5,     X_RAND2                 ; 6BBC   0004 0114 029E

        INCR    R0                              ; 6BBF   0008
        MVII    #$0129, R2                      ; 6BC0   02BA 0129

        JSR     R5,     L_64D9                  ; 6BC2   0004 0164 00D9

        MOVR    R3,     R0                      ; 6BC5   0098
        SLR     R0,     2                       ; 6BC6   0064
        SLR     R0,     2                       ; 6BC7   0064
        MVO     R0,     G_01D1                  ; 6BC8   0240 01D1
        MVII    #$0333, R4                      ; 6BCA   02BC 0333
        MVII    #$0007, R2                      ; 6BCC   02BA 0007
        MVO     R2,     G_01C9                  ; 6BCE   0242 01C9

        JSR     R5,     L_5D92                  ; 6BD0   0004 015C 0192
        JSR     R5,     L_698B                  ; 6BD3   0004 0168 018B
        DECLE   $0004                           ; 6BD6   0004

        ANDR    R2,     R0                      ; 6BD7   0190
        ADCR    R2                              ; 6BD8   002A
        SARC    R0,     1                       ; 6BD9   0078
        BNC     L_6BDF                          ; 6BDA   0209 0003

        JSR     R5,     L_6C6B                  ; 6BDC   0004 016C 006B

L_6BDF:
        PULR    R7                              ; 6BDF   02B7

        DECLE   $001E,  $0027,  $0002,  $0000   ; 6BE0   001E 0027 0002 0000
        DECLE   $0034,  $0004                   ; 6BE4   0034 0004

        ANDR    R2,     R0                      ; 6BE6   0190
        ADCR    R2                              ; 6BE7   002A
        RLC     R2,     2                       ; 6BE8   0056
        BNC     L_6BDF                          ; 6BE9   0229 000B

        SWAP    R2,     1                       ; 6BEB   0042
        ANDI    #$000F, R2                      ; 6BEC   03BA 000F
        BNEQ    L_6BDF                          ; 6BEE   022C 0010

        MVI     G_01D2, R0                      ; 6BF0   0280 01D2
        TSTR    R0                              ; 6BF2   0080
        BEQ     L_6BDF                          ; 6BF3   0224 0015

        MVII    #$0002, R0                      ; 6BF5   02B8 0002

        JSR     R5,     X_RAND1                 ; 6BF7   0004 0114 027D

        INCR    R0                              ; 6BFA   0008
        MVO     R0,     G_01D2                  ; 6BFB   0240 01D2
        PULR    R7                              ; 6BFD   02B7

L_6BFE:
        PSHR    R5                              ; 6BFE   0275
        DECLE   $0280,  $0111,  $0010,  $020B   ; 6BFF   0280 0111 0010 020B
        DECLE   $000B,  $0240,  $0111,  $020C   ; 6C03   000B 0240 0111 020C
        DECLE   $0007,  $0004,  $0190,  $0005   ; 6C07   0007 0004 0190 0005
        DECLE   $0050,  $0057,  $0056,  $0000   ; 6C0B   0050 0057 0056 0000
        DECLE   $0280,  $01D8,  $0010,  $022B   ; 6C0F   0280 01D8 0010 022B
        DECLE   $0034,  $0240,  $01D8,  $022C   ; 6C13   0034 0240 01D8 022C
        DECLE   $0038,  $0004,  $0190,  $0005   ; 6C17   0038 0004 0190 0005
        DECLE   $0057,  $0056,  $0000           ; 6C1B   0057 0056 0000

        PULR    R7                              ; 6C1E   02B7

L_6C1F:
        PSHR    R5                              ; 6C1F   0275
        MVI     G_01D6, R2                      ; 6C20   0282 01D6
        ANDI    #$007F, R2                      ; 6C22   03BA 007F
        BNEQ    L_6BDF                          ; 6C24   022C 0046

        JSR     R5,     L_6BFE                  ; 6C26   0004 0168 03FE
        DECLE   $02BA,  $0018,  $0242,  $01EE   ; 6C29   02BA 0018 0242 01EE
        DECLE   $0282,  $01ED,  $0012,  $022B   ; 6C2D   0282 01ED 0012 022B
        DECLE   $0052,  $020E,  $0011,  $02B8   ; 6C31   0052 020E 0011 02B8
        DECLE   $001B,  $0240,  $01EE,  $0004   ; 6C35   001B 0240 01EE 0004
        DECLE   $0190,  $002A,  $00A1,  $0221   ; 6C39   0190 002A 00A1 0221
        DECLE   $005E,  $02B8,  $0001,  $0004   ; 6C3D   005E 02B8 0001 0004

        ANDR    R4,     R4                      ; 6C41   01A4
        ADDR    R5,     R2                      ; 6C42   00EA
        B       L_6C75                          ; 6C43   0200 0030

        DECLE   $0242,  $01ED,  $02B8,  $001F   ; 6C45   0242 01ED 02B8 001F
        DECLE   $037A,  $0038,  $0204,  $0005   ; 6C49   037A 0038 0204 0005
        DECLE   $037A,  $0010,  $020C,  $0004   ; 6C4D   037A 0010 020C 0004
        DECLE   $0008,  $0004,  $01AC,  $02C6   ; 6C51   0008 0004 01AC 02C6
        DECLE   $03BA,  $000F,  $022C,  $0079   ; 6C55   03BA 000F 022C 0079
        DECLE   $0004                           ; 6C59   0004

        ANDR    R2,     R0                      ; 6C5A   0190
        ADCR    R2                              ; 6C5B   002A
        MOVR    R3,     R6                      ; 6C5C   009E
        BNC     L_6C6C                          ; 6C5D   0209 000D

        MVI     G_010E, R2                      ; 6C5F   0282 010E
        INCR    R2                              ; 6C61   000A
        CMP     G_010F, R2                      ; 6C62   0342 010F
        BGT     L_6BDF                          ; 6C64   022E 0086

        MVO     R2,     G_010E                  ; 6C66   0242 010E
        BEQ     L_6C75                          ; 6C68   0204 000B
        INCR    R7                              ; 6C6A   000F

L_6C6B:
        PSHR    R5                              ; 6C6B   0275
L_6C6C:
        MVI     G_010E, R2                      ; 6C6C   0282 010E
        CMP     G_010F, R2                      ; 6C6E   0342 010F
        BGE     L_6BDF                          ; 6C70   022D 0092

        INCR    R2                              ; 6C72   000A
        MVO     R2,     G_010E                  ; 6C73   0242 010E

L_6C75:
        JSR     R5,     L_54BD                  ; 6C75   0004 0154 00BD

        PULR    R7                              ; 6C78   02B7

        ADDR    R0,     R0                      ; 6C79   00C0
        ADDR    R1,     R1                      ; 6C7A   00C9
        RLC     R0,     1                       ; 6C7B   0050
        RLC     R1,     1                       ; 6C7C   0051
        SWAP    R0,     1                       ; 6C7D   0040
        SLL     R0,     2                       ; 6C7E   004C
        SWAP    R3,     1                       ; 6C7F   0043
        ADDR    R4,     R0                      ; 6C80   00E0
        SLR     R0,     1                       ; 6C81   0060
        SLR     R3,     1                       ; 6C82   0063
        ADDR    R3,     R0                      ; 6C83   00D8
        ADDR    R3,     R1                      ; 6C84   00D9
        SLL     R2,     2                       ; 6C85   004E
        RRC     R0,     1                       ; 6C86   0070
        ADDR    R2,     R1                      ; 6C87   00D1
        ADDR    R2,     R0                      ; 6C88   00D0
        ADDR    R2,     R7                      ; 6C89   00D7

        MOVR    R4,     R0                      ; 6C8A   00A0
        MOVR    R4,     R2                      ; 6C8B   00A2
        TSTR    R5                              ; 6C8C   00AD
        TSTR    R0                              ; 6C8D   0080
        MOVR    R3,     R7                      ; 6C8E   009F

        MOVR    R3,     R4                      ; 6C8F   009C
        MOVR    R2,     R0                      ; 6C90   0090
        MOVR    R3,     R5                      ; 6C91   009D
        SLL     R3,     1                       ; 6C92   004B
        SWAP    R2,     2                       ; 6C93   0046
        ADDR    R6,     R0                      ; 6C94   00F0
        MOVR    R7,     R5                      ; 6C95   00BD
        MOVR    R6,     R0                      ; 6C96   00B0
        GSWD    R0                              ; 6C97   0030
        ADCR    R0                              ; 6C98   0028
L_6C99:
        PSHR    R1                              ; 6C99   0271
        MVI@    R5,     R1                      ; 6C9A   02A9
        PSHR    R5                              ; 6C9B   0275
        MVII    #$00F0, R5                      ; 6C9C   02BD 00F0
        NOP                                     ; 6C9E   0034
        ADDI    #$02FA, R1                      ; 6C9F   02F9 02FA
        NOP                                     ; 6CA1   0034
        SARC    R1,     1                       ; 6CA2   0079
        BNC     L_6CA8                          ; 6CA3   0209 0003

        COMR    R5                              ; 6CA5   001D
        SLL     R0,     2                       ; 6CA6   004C
        SLL     R0,     2                       ; 6CA7   004C
L_6CA8:
        DIS                                     ; 6CA8   0003
        AND@    R1,     R5                      ; 6CA9   038D
        ADDR    R0,     R5                      ; 6CAA   00C5
        MVO@    R5,     R1                      ; 6CAB   024D
        EIS                                     ; 6CAC   0002
        PULR    R5                              ; 6CAD   02B5
        PULR    R1                              ; 6CAE   02B1
        MOVR    R5,     R7                      ; 6CAF   00AF

        DECLE   $03E4,  $0274,  $0245,  $01C7   ; 6CB0   03E4 0274 0245 01C7
        DECLE   $0288,  $03E8,  $0000,  $03E4   ; 6CB4   0288 03E8 0000 03E4
        DECLE   $0274,  $002D,  $012E,  $003B   ; 6CB8   0274 002D 012E 003B
        DECLE   $03E8,  $0000,  $03E3,  $0089   ; 6CBC   03E8 0000 03E3 0089
        DECLE   $020C,  $01ED,  $0023,  $033B   ; 6CC0   020C 01ED 0023 033B
        DECLE   $03E7,  $0000,  $03E3,  $0189   ; 6CC4   03E7 0000 03E3 0189
        DECLE   $00C5,  $0366,  $01F2,  $0065   ; 6CC8   00C5 0366 01F2 0065
        DECLE   $03E7,  $0000,  $03E2,  $00B8   ; 6CCC   03E7 0000 03E2 00B8
        DECLE   $0205,  $0249,  $00AE,  $0065   ; 6CD0   0205 0249 00AE 0065
        DECLE   $03E9,  $0000,  $03E3,  $0292   ; 6CD4   03E9 0000 03E3 0292
        DECLE   $00A1,  $0275,  $0245,  $03EA   ; 6CD8   00A1 0275 0245 03EA
        DECLE   $0000,  $03F4,  $0000,  $03E5   ; 6CDC   0000 03F4 0000 03E5
        DECLE   $0185,  $02C5,  $019B,  $03E9   ; 6CE0   0185 02C5 019B 03E9
        DECLE   $0000,  $0107,  $0000,  $0108   ; 6CE4   0000 0107 0000 0108
        DECLE   $0007,  $0109,  $000E,  $01ED   ; 6CE8   0007 0109 000E 01ED
        DECLE   $0016,  $010A,  $001E,  $01DE   ; 6CEC   0016 010A 001E 01DE
        DECLE   $0026,  $01E0,  $002D,  $0110   ; 6CF0   0026 01E0 002D 0110
        DECLE   $002F,  $0107,  $0000           ; 6CF4   002F 0107 0000
L_6CF7:
        PSHR    R5                              ; 6CF7   0275
        DECLE   $0282,  $01EC,  $03BA,  $000F   ; 6CF8   0282 01EC 03BA 000F
        DECLE   $0001                           ; 6CFC   0001

        MVII    #$00E5, R4                      ; 6CFD   02BC 00E5
        SAR     R0,     2                       ; 6CFF   006C
        ADDR    R2,     R4                      ; 6D00   00D4
        ADDR    R2,     R4                      ; 6D01   00D4
        MVI@    R4,     R0                      ; 6D02   02A0
        PSHR    R0                              ; 6D03   0270
        PSHR    R2                              ; 6D04   0272
        MVI@    R4,     R4                      ; 6D05   02A4
        SDBD                                    ; 6D06   0001
        ADDI    #$6CB0, R4                      ; 6D07   02FC 00B0 006C
        MVII    #$0107, R3                      ; 6D0A   02BB 0107
        MVII    #$02C8, R0                      ; 6D0C   02B8 02C8

        JSR     R5,     L_51C5                  ; 6D0E   0004 0150 01C5

        PULR    R2                              ; 6D11   02B2
        PULR    R4                              ; 6D12   02B4
        MOVR    R2,     R1                      ; 6D13   0091
        INCR    R1                              ; 6D14   0009
        ADDI    #$00F0, R1                      ; 6D15   02F9 00F0
        MVO     R1,     G_01EC                  ; 6D17   0241 01EC
        MVII    #$0087, R3                      ; 6D19   02BB 0087
        INCR    R2                              ; 6D1B   000A
        ADDR    R7,     R2                      ; 6D1C   00FA
        ADD@    R2,     R7                      ; 6D1D   02D7

        INCR    R5                              ; 6D1E   000D
        INCR    R5                              ; 6D1F   000D
        INCR    R5                              ; 6D20   000D
L_6D21:
        DECR    R7                              ; 6D21   0017

        DECLE   $001E,  $001E,  $0027           ; 6D22   001E 001E 0027

        SWAP    R0,     1                       ; 6D25   0040
        INCR    R1                              ; 6D26   0009
        MVII    #$00F1, R1                      ; 6D27   02B9 00F1
        MVO     R1,     G_01EC                  ; 6D29   0241 01EC
        MVI@    R4,     R0                      ; 6D2B   02A0
        SLR     R0,     2                       ; 6D2C   0064
        SLR     R0,     1                       ; 6D2D   0060
        ADDI    #$0003, R0                      ; 6D2E   02F8 0003

        JSR     R5,     L_FF7E                  ; 6D30   0004 01FC 037E

        ADD@    R2,     R4                      ; 6D33   02D4
        PULR    R7                              ; 6D34   02B7

        MVI@    R4,     R0                      ; 6D35   02A0
        DECR    R0                              ; 6D36   0010

        JSR     R5,     L_FF7E                  ; 6D37   0004 01FC 037E

        ADD@    R2,     R5                      ; 6D3A   02D5
        PULR    R7                              ; 6D3B   02B7

        SDBD                                    ; 6D3C   0001
        MVI@    R4,     R0                      ; 6D3D   02A0

        JSR     R5,     L_FF67                  ; 6D3E   0004 01FC 0367

        ADD@    R2,     R5                      ; 6D41   02D5
        MVO     R3,     .BTAB.D9                ; 6D42   0243 02D9
        PULR    R7                              ; 6D44   02B7

        MVI@    R4,     R0                      ; 6D45   02A0

        JSR     R5,     L_FF7E                  ; 6D46   0004 01FC 037E

        ADD@    R2,     R4                      ; 6D49   02D4
        SDBD                                    ; 6D4A   0001
        MVII    #$AD4D, R5                      ; 6D4B   02BD 004D 00AD
        ADD     G_0112, R5                      ; 6D4E   02C5 0112
        SDBD                                    ; 6D50   0001
        MVII    #$ACC1, R4                      ; 6D51   02BC 00C1 00AC
        ADD@    R5,     R4                      ; 6D54   02EC
        MVI@    R4,     R0                      ; 6D55   02A0
        ADDI    #$0076, R0                      ; 6D56   02F8 0076
        MVII    #$0107, R3                      ; 6D58   02BB 0107

        JSR     R5,     L_51C5                  ; 6D5A   0004 0150 01C5

        PULR    R7                              ; 6D5D   02B7

        MVI@    R4,     R0                      ; 6D5E   02A0

        JSR     R5,     L_FF7E                  ; 6D5F   0004 01FC 037E

        ADD@    R2,     R4                      ; 6D62   02D4
        PULR    R7                              ; 6D63   02B7

L_6D64:
        PSHR    R5                              ; 6D64   0275
        MVII    #$0200, R5                      ; 6D65   02BD 0200
        MOVR    R5,     R4                      ; 6D67   00AC
        MVII    #$0078, R3                      ; 6D68   02BB 0078
        MVII    #$00C0, R2                      ; 6D6A   02BA 00C0
        SWAP    R2,     1                       ; 6D6C   0042
L_6D6D:
        MVI@    R5,     R0                      ; 6D6D   02A8
        ANDR    R2,     R0                      ; 6D6E   0190
        MVO@    R0,     R4                      ; 6D6F   0260
        MVI@    R5,     R0                      ; 6D70   02A8
        ANDR    R2,     R0                      ; 6D71   0190
        MVO@    R0,     R4                      ; 6D72   0260
        DECR    R3                              ; 6D73   0013
        BNEQ    L_6D6D                          ; 6D74   022C 0008
        PULR    R7                              ; 6D76   02B7

L_6D77:
        SDBD                                    ; 6D77   0001
        MVII    #$0907, R3                      ; 6D78   02BB 0007 0009
        PSHR    R5                              ; 6D7B   0275
        MVI     G_0107, R0                      ; 6D7C   0280 0107
        SLR     R0,     2                       ; 6D7E   0064
        SLR     R0,     1                       ; 6D7F   0060
        ADDI    #$0003, R0                      ; 6D80   02F8 0003

        JSR     R5,     L_FF83                  ; 6D82   0004 01FC 0383

        BOV     L_6B06                          ; 6D85   0222 0280

        SUBR    R1,     R0                      ; 6D87   0108
        SLR     R0,     2                       ; 6D88   0064
        SLR     R0,     1                       ; 6D89   0060
        ADDI    #$0003, R0                      ; 6D8A   02F8 0003

        JSR     R5,     L_FF83                  ; 6D8C   0004 01FC 0383
        DECLE   $0236                           ; 6D8F   0236

        MVI     G_0109, R0                      ; 6D90   0280 0109
        SLR     R0,     2                       ; 6D92   0064
        SLR     R0,     1                       ; 6D93   0060
        ADDI    #$0003, R0                      ; 6D94   02F8 0003

        JSR     R5,     L_FF83                  ; 6D96   0004 01FC 0383

        MVO@    R2,     R1                      ; 6D99   024A
        MVI     G_0110, R0                      ; 6D9A   0280 0110

        JSR     R5,     L_FF83                  ; 6D9C   0004 01FC 0383

        MVO@    R6,     R3                      ; 6D9F   025E
        MVI     G_010B, R0                      ; 6DA0   0280 010B
        SWAP    R0,     1                       ; 6DA2   0040
        ADD     G_010A, R0                      ; 6DA3   02C0 010A

        JSR     R5,     L_FF67                  ; 6DA5   0004 01FC 0367

        MVI@    R1,     R7                      ; 6DA8   028F

        MVO     R3,     .BTAB.93                ; 6DA9   0243 0293
        MVI     G_01DF, R0                      ; 6DAB   0280 01DF
        SWAP    R0,     1                       ; 6DAD   0040
        ADD     G_01DE, R0                      ; 6DAE   02C0 01DE

        JSR     R5,     L_FF67                  ; 6DB0   0004 01FC 0367

        MVI@    R3,     R2                      ; 6DB3   029A
        MVO     R3,     .BTAB.9E                ; 6DB4   0243 029E
        PULR    R7                              ; 6DB6   02B7

L_6DB7:
        PSHR    R5                              ; 6DB7   0275
        MVI     G_01EE, R3                      ; 6DB8   0283 01EE
        TSTR    R3                              ; 6DBA   009B
        BEQ     L_6DD6                          ; 6DBB   0204 0019

        MOVR    R3,     R0                      ; 6DBD   0098
        CLRR    R5                              ; 6DBE   01ED
        MVO     R5,     G_01EE                  ; 6DBF   0245 01EE
        SDBD                                    ; 6DC1   0001
        ADDI    #$6DD4, R3                      ; 6DC2   02FB 00D4 006D
        MVI@    R3,     R3                      ; 6DC5   029B

        JSR     R5,     .EXEC.BBF               ; 6DC6   0004 0118 03BF

        ADCR    R7                              ; 6DC9   002F

        INCR    R1                              ; 6DCA   0009
L_6DCB:
        RRC     R3,     2                       ; 6DCB   0077
        ADDR    R1,     R6                      ; 6DCC   00CE
        SAR     R1,     2                       ; 6DCD   006D
        SDBD                                    ; 6DCE   0001
        MVII    #$6DD5, R5                      ; 6DCF   02BD 00D5 006D
        ADD     G_0159, R5                      ; 6DD2   02C5 0159
        SDBD                                    ; 6DD4   0001
        MVI@    R5,     R4                      ; 6DD5   02AC
L_6DD6:
        PULR    R7                              ; 6DD6   02B7

        DECR    R4                              ; 6DD7   0014
        DECR    R3                              ; 6DD8   0013
        SAR     R2,     2                       ; 6DD9   006E
        DECR    R2                              ; 6DDA   0012
        ADCR    R2                              ; 6DDB   002A
        SAR     R2,     2                       ; 6DDC   006E
        DECR    R4                              ; 6DDD   0014
        SWAP    R1,     2                       ; 6DDE   0045
        SAR     R2,     2                       ; 6DDF   006E
        DECR    R6                              ; 6DE0   0016
        SLL     R3,     2                       ; 6DE1   004F
L_6DE2:
        SAR     R2,     2                       ; 6DE2   006E
        DECR    R2                              ; 6DE3   0012
        ADDR    R5,     R4                      ; 6DE4   00EC
        SAR     R3,     2                       ; 6DE5   006F
        DECR    R2                              ; 6DE6   0012
        SLLC    R0,     2                       ; 6DE7   005C
        SAR     R2,     2                       ; 6DE8   006E
        DECR    R0                              ; 6DE9   0010
        RRC     R1,     2                       ; 6DEA   0075
        SAR     R2,     2                       ; 6DEB   006E
        EIS                                     ; 6DEC   0002
        MOVR    R0,     R2                      ; 6DED   0082
        SAR     R2,     2                       ; 6DEE   006E
        ADCR    R0                              ; 6DEF   0028
        MOVR    R1,     R6                      ; 6DF0   008E
        SAR     R2,     2                       ; 6DF1   006E
        COMR    R6                              ; 6DF2   001E
        ADDR    R2,     R4                      ; 6DF3   00D4
        SAR     R3,     2                       ; 6DF4   006F
        COMR    R6                              ; 6DF5   001E
        MOVR    R4,     R3                      ; 6DF6   00A3
        SAR     R3,     2                       ; 6DF7   006F
        COMR    R6                              ; 6DF8   001E
        MOVR    R5,     R4                      ; 6DF9   00AC
        SAR     R2,     2                       ; 6DFA   006E
        COMR    R6                              ; 6DFB   001E
        ADDR    R0,     R0                      ; 6DFC   00C0
        SAR     R2,     2                       ; 6DFD   006E
        COMR    R6                              ; 6DFE   001E
        SETC                                    ; 6DFF   0007
        SAR     R3,     2                       ; 6E00   006F
        COMR    R6                              ; 6E01   001E
        MOVR    R3,     R4                      ; 6E02   009C
        SAR     R2,     2                       ; 6E03   006E
        EIS                                     ; 6E04   0002
        RSWD    R5                              ; 6E05   003D
        SAR     R3,     2                       ; 6E06   006F
        SAR     R2,     2                       ; 6E07   006E
        SLL     R3,     1                       ; 6E08   004B
        SAR     R3,     2                       ; 6E09   006F
        SLR     R0,     2                       ; 6E0A   0064
        RRC     R1,     1                       ; 6E0B   0071
        SAR     R3,     2                       ; 6E0C   006F
        SARC    R0,     1                       ; 6E0D   0078
        RRC     R1,     1                       ; 6E0E   0071
        SAR     R3,     2                       ; 6E0F   006F
        SLR     R0,     2                       ; 6E10   0064
        SLR     R0,     1                       ; 6E11   0060
        SAR     R3,     2                       ; 6E12   006F
        MVI@    R3,     R5                      ; 6E13   029D
        AND@    R1,     R1                      ; 6E14   0389
        SUBR    R7,     R4                      ; 6E15   013C
        B       L_6DE2                          ; 6E16   0220 0035

        DECLE   $000B,  $0040,  $0078,  $0001   ; 6E18   000B 0040 0078 0001
        DECLE   $03F8,  $026B,  $0048,  $0078   ; 6E1C   03F8 026B 0048 0078
        DECLE   $0001,  $03FA,  $026B,  $0044   ; 6E20   0001 03FA 026B 0044
        DECLE   $0078,  $0001                   ; 6E24   0078 0001

        XORI    #$0143, R1                      ; 6E26   03F9 0143
        XOR     .BTAB.CF,R0                     ; 6E28   03C0 02CF
        AND@    R1,     R1                      ; 6E2A   0389
        XOR     G_0047, R0                      ; 6E2B   03C0 0047
        XOR@    R6,     R2                      ; 6E2D   03F2
        ADDR    R5,     R3                      ; 6E2E   00EB
        XOR@    R1,     R0                      ; 6E2F   03C8
        SWAP    R0,     1                       ; 6E30   0040
        XORI    #$00EB, R2                      ; 6E31   03FA 00EB
        XOR     G_0039, R4                      ; 6E33   03C4 0039
        XOR@    R6,     R6                      ; 6E35   03F6
        ADDR    R5,     R3                      ; 6E36   00EB
        XOR     .STIC.EDGE,R0                   ; 6E37   03C0 0032
        XOR@    R6,     R2                      ; 6E39   03F2
        ADDR    R5,     R3                      ; 6E3A   00EB
        XOR@    R1,     R0                      ; 6E3B   03C8
        ADCR    R5                              ; 6E3C   002D
        XORI    #$00EB, R2                      ; 6E3D   03FA 00EB
        XOR     .STIC.CS.0,R4                   ; 6E3F   03C4 0028
        XOR@    R6,     R6                      ; 6E41   03F6
        MOVR    R1,     R7                      ; 6E42   008F

        ADCR    R4                              ; 6E43   002C
        ADD@    R1,     R7                      ; 6E44   02CF

        DECLE   $000C,  $01F4,  $0079,  $03B7   ; 6E45   000C 01F4 0079 03B7

        XOR@    R5,     R5                      ; 6E49   03ED
        INCR    R7                              ; 6E4A   000F

        XOR@    R5,     R4                      ; 6E4B   03EC
L_6E4C:
        AND@    R1,     R3                      ; 6E4C   038B
        MVO@    R3,     R5                      ; 6E4D   026B
        ADD@    R1,     R7                      ; 6E4E   02CF

        DECLE   $0079,  $03B7                   ; 6E4F   0079 03B7

        SLL     R3,     2                       ; 6E51   004F
        DECR    R2                              ; 6E52   0012
        ADDR    R5,     R4                      ; 6E53   00EC
        MVI@    R3,     R0                      ; 6E54   0298
        INCR    R3                              ; 6E55   000B
        XOR@    R5,     R5                      ; 6E56   03ED
        INCR    R7                              ; 6E57   000F

        XOR@    R6,     R1                      ; 6E58   03F1
L_6E59:
        ADDR    R4,     R3                      ; 6E59   00E3
        XOR@    R5,     R4                      ; 6E5A   03EC
        ADD@    R1,     R7                      ; 6E5B   02CF

        DECLE   $004F,  $000E,  $0389,  $0300   ; 6E5C   004F 000E 0389 0300
        DECLE   $002D,  $0308,  $002D,  $0304   ; 6E60   002D 0308 002D 0304
        DECLE   $002D,  $009C,  $0310,  $03B7   ; 6E64   002D 009C 0310 03B7
        DECLE   $000B,  $0001,  $0006,  $0001   ; 6E68   000B 0001 0006 0001
        DECLE   $03FD,  $006B,  $0001,  $03FE   ; 6E6C   03FD 006B 0001 03FE
        DECLE   $0001,  $0005                   ; 6E70   0001 0005

        SLR     R3,     1                       ; 6E72   0063
        XOR@    R2,     R4                      ; 6E73   03D4
        ADD@    R1,     R7                      ; 6E74   02CF

        SLL     R3,     2                       ; 6E75   004F
        INCR    R7                              ; 6E76   000F

        AND@    R1,     R1                      ; 6E77   0389
L_6E78:
        CMP     .STIC.A.2,R0                    ; 6E78   0340 0012
        CMP@    R1,     R0                      ; 6E7A   0348
        COMR    R5                              ; 6E7B   001D
        CMP     .STIC.Y.7,R4                    ; 6E7C   0344 000F
        MVO@    R3,     R3                      ; 6E7E   025B
        SWAP    R3,     1                       ; 6E7F   0043
        XOR@    R3,     R4                      ; 6E80   03DC
        ADD@    R1,     R7                      ; 6E81   02CF

        DECLE   $0070,  $0210                   ; 6E82   0070 0210

        SAR     R0,     1                       ; 6E84   0068
        ANDI    #$0064, R0                      ; 6E85   03B8 0064
        CMPR    R4,     R0                      ; 6E87   0160
        INCR    R4                              ; 6E88   000C
        AND     .STIC.Y.3,R4                    ; 6E89   0384 000B
        AND@    R1,     R1                      ; 6E8B   0389
        XORR    R5,     R3                      ; 6E8C   01EB
        ADD@    R1,     R7                      ; 6E8D   02CF

        DECLE   $03D0,  $0308,  $03D8,  $01DC   ; 6E8E   03D0 0308 03D8 01DC
        DECLE   $03D4,  $00B0,  $0389,  $00EB   ; 6E92   03D4 00B0 0389 00EB
        DECLE   $000C,  $0384,  $000B,  $03B7   ; 6E96   000C 0384 000B 03B7

        XORR    R5,     R3                      ; 6E9A   01EB
        ADD@    R1,     R7                      ; 6E9B   02CF

        DECLE   $02E9,  $0040,  $03E8,  $0141   ; 6E9C   02E9 0040 03E8 0141
        DECLE   $00C8,  $028D,  $01B7           ; 6EA0   00C8 028D 01B7

        INCR    R4                              ; 6EA3   000C
        SUBR    R3,     R0                      ; 6EA4   0118
        BMI     L_6F92                          ; 6EA5   020B 00EB

        ADCR    R4                              ; 6EA7   002C
        XORR    R0,     R4                      ; 6EA8   01C4
        INCR    R3                              ; 6EA9   000B
        MVO@    R3,     R5                      ; 6EAA   026B
        ADD@    R1,     R7                      ; 6EAB   02CF

        DECLE   $0389,  $004F,  $0008,  $0000   ; 6EAC   0389 004F 0008 0000
        DECLE   $00A0,  $0008,  $00A2,  $0004   ; 6EB0   00A0 0008 00A2 0004
        DECLE   $00A4,  $0001,  $0023,  $028B   ; 6EB4   00A4 0001 0023 028B
        DECLE   $000C,  $0032,  $03B7,  $012B   ; 6EB8   000C 0032 03B7 012B
        DECLE   $0035                           ; 6EBC   0035

        SWAP    R3,     1                       ; 6EBD   0043
        XOR@    R5,     R4                      ; 6EBE   03EC
        ADD@    R1,     R7                      ; 6EBF   02CF

        DECLE   $0319,  $030D,  $0248,  $02F0   ; 6EC0   0319 030D 0248 02F0
        DECLE   $0244,  $0320,  $00C5,  $01DB   ; 6EC4   0244 0320 00C5 01DB
        DECLE   $0001,  $0033,  $004E,  $031D   ; 6EC8   0001 0033 004E 031D
        DECLE   $0077,  $00EB,  $006E,  $002B   ; 6ECC   0077 00EB 006E 002B
        DECLE   $0319,  $0023,  $03E4,  $000F   ; 6ED0   0319 0023 03E4 000F
        DECLE   $03FD,  $03FE,  $0012,  $0001   ; 6ED4   03FD 03FE 0012 0001

        SWAP    R3,     1                       ; 6ED8   0043
        CMPR    R7,     R3                      ; 6ED9   017B
        RLC     R3,     1                       ; 6EDA   0053
        TSTR    R4                              ; 6EDB   00A4
        RRC     R3,     2                       ; 6EDC   0077
        ADDR    R5,     R3                      ; 6EDD   00EB
        SAR     R2,     2                       ; 6EDE   006E
        ADCR    R3                              ; 6EDF   002B
        SUB@    R3,     R1                      ; 6EE0   0319
        NEGR    R3                              ; 6EE1   0023
        XOR@    R4,     R4                      ; 6EE2   03E4
        CMPI    #$000E, R1                      ; 6EE3   0379 000E
        SUBR    R2,     R7                      ; 6EE5   0117

        DECLE   $0000                           ; 6EE6   0000

        XOR@    R4,     R2                      ; 6EE7   03E2
        ADDR    R2,     R7                      ; 6EE8   00D7

        ADDR    R0,     R0                      ; 6EE9   00C0
        ADD@    R1,     R7                      ; 6EEA   02CF

        MVII    #$0037, R0                      ; 6EEB   02B8 0037
        ADDI    #$0008, R3                      ; 6EED   02FB 0008
        MVO@    R0,     R3                      ; 6EEF   0258
        PULR    R7                              ; 6EF0   02B7

        DECLE   $03C9,  $0040,  $0140,  $0048   ; 6EF1   03C9 0040 0140 0048
        DECLE   $0090,  $0001,  $03C0,  $0001   ; 6EF5   0090 0001 03C0 0001
        DECLE   $0012,  $000C,  $0074,  $020B   ; 6EF9   0012 000C 0074 020B
        DECLE   $012B,  $0001,  $0060,  $0001   ; 6EFD   012B 0001 0060 0001

        INCR    R6                              ; 6F01   000E
        CMPR    R5,     R3                      ; 6F02   016B
        INCR    R4                              ; 6F03   000C
        MOVR    R4,     R0                      ; 6F04   00A0
        CMPR    R5,     R3                      ; 6F05   016B
        ADD@    R1,     R7                      ; 6F06   02CF

        DECLE   $0389,  $0040,  $0258,  $0048   ; 6F07   0389 0040 0258 0048
        DECLE   $025C,  $0044,  $0260,  $0001   ; 6F0B   025C 0044 0260 0001
        DECLE   $003F                           ; 6F0F   003F

        INCR    R4                              ; 6F10   000C
        SAR     R2,     2                       ; 6F11   006E
        AND@    R1,     R3                      ; 6F12   038B
        SLL     R3,     2                       ; 6F13   004F
        COMR    R1                              ; 6F14   0019
        MOVR    R7,     R5                      ; 6F15   00BD
        RRC     R3,     2                       ; 6F16   0077
        ADCR    R1                              ; 6F17   0029
        SAR     R3,     2                       ; 6F18   006F
        NEGR    R3                              ; 6F19   0023
        XOR@    R5,     R4                      ; 6F1A   03EC
        MOVR    R1,     R7                      ; 6F1B   008F

        DECLE   $0013,  $0001,  $03E3,  $004F   ; 6F1C   0013 0001 03E3 004F
        DECLE   $0014,  $024F,  $00FF           ; 6F20   0014 024F 00FF

        RRC     R3,     2                       ; 6F23   0077
        ADCR    R1                              ; 6F24   0029
        SAR     R3,     2                       ; 6F25   006F
        SLR     R3,     1                       ; 6F26   0063
        XOR@    R5,     R4                      ; 6F27   03EC
        ADD@    R1,     R7                      ; 6F28   02CF

        MVI     .PSG0.envlp_hi,R1               ; 6F29   0281 01F7
        SWAP    R1,     1                       ; 6F2B   0041
        XOR     .PSG0.envlp_lo,R1               ; 6F2C   03C1 01F3
        MVI     G_015B, R0                      ; 6F2E   0280 015B
        SWAP    R0,     1                       ; 6F30   0040
        SAR     R0,     2                       ; 6F31   006C
        SAR     R0,     2                       ; 6F32   006C
        NOP                                     ; 6F33   0034
        SAR     R0,     2                       ; 6F34   006C
        SAR     R0,     2                       ; 6F35   006C
        ADDR    R0,     R1                      ; 6F36   00C1
        MVO     R1,     .PSG0.envlp_lo          ; 6F37   0241 01F3
        SWAP    R1,     1                       ; 6F39   0041
        MVO     R1,     .PSG0.envlp_hi          ; 6F3A   0241 01F7
        PULR    R7                              ; 6F3C   02B7

        DECLE   $0389,  $019D,  $0380,  $0042   ; 6F3D   0389 019D 0380 0042
        DECLE   $0388,  $0064,  $0384,  $0019   ; 6F41   0388 0064 0384 0019
        DECLE   $03EE,  $006B,  $0035           ; 6F45   03EE 006B 0035

        NEGR    R3                              ; 6F48   0023
        XOR@    R2,     R4                      ; 6F49   03D4
        ADD@    R1,     R7                      ; 6F4A   02CF

        DECLE   $01C9,  $0020,  $03B8,  $0038   ; 6F4B   01C9 0020 03B8 0038
        DECLE   $001C,  $0031,  $0008,  $0031   ; 6F4F   001C 0031 0008 0031
        DECLE   $000A,  $006C,  $0358,  $03B7   ; 6F53   000A 006C 0358 03B7

        INCR    R3                              ; 6F57   000B
        SLL     R3,     2                       ; 6F58   004F
        INCR    R4                              ; 6F59   000C
        XOR@    R5,     R5                      ; 6F5A   03ED
        MOVR    R5,     R3                      ; 6F5B   00AB
        SUB@    R1,     R5                      ; 6F5C   030D
        SWAP    R3,     1                       ; 6F5D   0043
        XOR@    R5,     R4                      ; 6F5E   03EC
        ADD@    R1,     R7                      ; 6F5F   02CF
        SUBR    R5,     R7                      ; 6F60   012F

        SUB@    R1,     R1                      ; 6F61   0309
        SUB     G_005A, R0                      ; 6F62   0300 005A
        CMP@    R1,     R0                      ; 6F64   0348
        SLR     R1,     1                       ; 6F65   0061
        AND     G_0065, R4                      ; 6F66   0384 0065
        XORI    #$002D, R6                      ; 6F68   03FE 002D
        MOVR    R0,     R1                      ; 6F6A   0081
        INCR    R3                              ; 6F6B   000B
        ADDR    R3,     R3                      ; 6F6C   00DB
        SARC    R3,     1                       ; 6F6D   007B
        MOVR    R1,     R7                      ; 6F6E   008F

        ADCR    R6                              ; 6F6F   002E
        ADCR    R7                              ; 6F70   002F

        AND@    R1,     R1                      ; 6F71   0389
L_6F72:
        COMR    R4                              ; 6F72   001C
        DECLE   $03D0,  $0050,  $02AE,  $0058   ; 6F73   03D0 0050 02AE 0058
        DECLE   $02B2,  $0054,  $02B0,  $021D   ; 6F77   02B2 0054 02B0 021D
        DECLE   $000B,  $0103,  $03F4,  $0050   ; 6F7B   000B 0103 03F4 0050
        DECLE   $0380,  $0058,  $0384,  $0054   ; 6F7F   0380 0058 0384 0054
        DECLE   $0382,  $021D,  $000B,  $0103   ; 6F83   0382 021D 000B 0103
        DECLE   $03F4,  $0050,  $02AE,  $0058   ; 6F87   03F4 0050 02AE 0058
        DECLE   $02B2,  $0054,  $02B0,  $021D   ; 6F8B   02B2 0054 02B0 021D

        INCR    R3                              ; 6F8F   000B
        SUBR    R0,     R3                      ; 6F90   0103
        XOR@    R6,     R4                      ; 6F91   03F4
L_6F92:
        SLR     R0,     1                       ; 6F92   0060
        ADDR    R5,     R3                      ; 6F93   00EB
L_6F94:
        SAR     R0,     1                       ; 6F94   0068
        ADDR    R5,     R7                      ; 6F95   00EF

        SLR     R0,     2                       ; 6F96   0064
        ADDR    R5,     R5                      ; 6F97   00ED
        SLL     R3,     2                       ; 6F98   004F
        DECR    R0                              ; 6F99   0010
        INCR    R3                              ; 6F9A   000B
        SUBR    R0,     R3                      ; 6F9B   0103
        XOR@    R6,     R4                      ; 6F9C   03F4
        SUBR    R7,     R4                      ; 6F9D   013C
        B       L_6F94                          ; 6F9E   0220 000B
        MOVR    R1,     R7                      ; 6FA0   008F

        RRC     R3,     2                       ; 6FA1   0077
        ADD@    R1,     R7                      ; 6FA2   02CF

        DECLE   $002F,  $03C9,  $01B7,  $0033   ; 6FA3   002F 03C9 01B7 0033
        DECLE   $0008,  $0077,  $00BE,  $006F   ; 6FA7   0008 0077 00BE 006F
        DECLE   $0001,  $03C0,  $0001,  $0012   ; 6FAB   0001 03C0 0001 0012
        DECLE   $000C,  $0074,  $020B,  $012B   ; 6FAF   000C 0074 020B 012B
        DECLE   $0001,  $0060,  $0001           ; 6FB3   0001 0060 0001

        INCR    R6                              ; 6FB6   000E
        CMPR    R5,     R3                      ; 6FB7   016B
        INCR    R4                              ; 6FB8   000C
        MOVR    R4,     R0                      ; 6FB9   00A0
        CMPR    R5,     R3                      ; 6FBA   016B
        ADD@    R1,     R7                      ; 6FBB   02CF

        MOVR    R7,     R6                      ; 6FBC   00BE
        SLL     R1,     2                       ; 6FBD   004D
        SDBD                                    ; 6FBE   0001
        MVII    #$6FBC, R3                      ; 6FBF   02BB 00BC 006F
        ADD     G_0159, R3                      ; 6FC2   02C3 0159
        ADD     G_0159, R3                      ; 6FC4   02C3 0159
        MVI@    R3,     R0                      ; 6FC6   0298
        MVO     R0,     .PSG0.chn_a_lo          ; 6FC7   0240 01F0
        SWAP    R0,     1                       ; 6FC9   0040
        MVO     R0,     .PSG0.chn_a_hi          ; 6FCA   0240 01F4
        INCR    R3                              ; 6FCC   000B
        MVI@    R3,     R0                      ; 6FCD   0298
        MVO     R0,     .PSG0.chn_b_lo          ; 6FCE   0240 01F1
        SWAP    R0,     1                       ; 6FD0   0040
        MVO     R0,     .PSG0.chn_b_hi          ; 6FD1   0240 01F5
        PULR    R7                              ; 6FD3   02B7
        SUB@    R5,     R7                      ; 6FD4   032F

        XOR@    R1,     R1                      ; 6FD5   03C9
        SWAP    R0,     1                       ; 6FD6   0040
        AND@    R1,     R6                      ; 6FD7   038E
        SLL     R0,     1                       ; 6FD8   0048
        AND     G_0044, R4                      ; 6FD9   0384 0044
        AND@    R1,     R1                      ; 6FDB   0389
        NEGR    R1                              ; 6FDC   0021
        CMPR    R0,     R3                      ; 6FDD   0143
        SUBR    R3,     R3                      ; 6FDE   011B
        SARC    R3,     1                       ; 6FDF   007B
        SAR     R0,     2                       ; 6FE0   006C
        CMP@    R3,     R0                      ; 6FE1   0358
        SLL     R3,     1                       ; 6FE2   004B
L_6FE3:
        DECR    R7                              ; 6FE3   0017

        DECR    R2                              ; 6FE4   0012
        SUBR    R5,     R7                      ; 6FE5   012F

        DECLE   $0001                           ; 6FE6   0001

        XORR    R7,     R3                      ; 6FE7   01FB
        ADDR    R3,     R3                      ; 6FE8   00DB
        RLC     R3,     2                       ; 6FE9   0057
        MOVR    R4,     R2                      ; 6FEA   00A2
        ADD@    R1,     R7                      ; 6FEB   02CF

        DECLE   $002F,  $0379,  $00B7,  $00CC   ; 6FEC   002F 0379 00B7 00CC
        DECLE   $02C8,  $020B                   ; 6FF0   02C8 020B

        MVI@    R3,     R5                      ; 6FF2   029D
        INCR    R5                              ; 6FF3   000D
        INCR    R7                              ; 6FF4   000F

        DIS                                     ; 6FF5   0003
L_6FF6:
        MVI     G_03EC, R3                      ; 6FF6   0283 03EC
        ADD@    R1,     R7                      ; 6FF8   02CF

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6FFD   0000 0000 0000

        ORG     $D000
L_D000:
        PSHR    R5                              ; D000   0275
        DECLE   $0004                           ; D001   0004

        ANDR    R2,     R0                      ; D002   0190
        RSWD    R5                              ; D003   003D
        PULR    R5                              ; D004   02B5
        MVI@    R5,     R0                      ; D005   02A8
        TSTR    R0                              ; D006   0080
        BNEQ    L_D000                          ; D007   022C 0008
        MOVR    R5,     R7                      ; D009   00AF

        PSHR    R5                              ; D00A   0275
        PSHR    R0                              ; D00B   0270
        MVII    #$0001, R0                      ; D00C   02B8 0001

        JSR     R5,     X_RAND1                 ; D00E   0004 0114 027D

        SARC    R0,     1                       ; D011   0078
        PULR    R0                              ; D012   02B0
        PULR    R7                              ; D013   02B7

        CLRR    R0                              ; D014   01C0
        PSHR    R1                              ; D015   0271
L_D016:
        MVI@    R5,     R1                      ; D016   02A9
        TSTR    R1                              ; D017   0089
        BEQ     L_D026                          ; D018   0204 000C

        SDBD                                    ; D01A   0001
        XORI    #$0401, R1                      ; D01B   03F9 0001 0004
        SARC    R1,     1                       ; D01E   0079
        MVI@    R1,     R1                      ; D01F   0289
        ADCR    R7                              ; D020   002F

        SLL     R1,     1                       ; D021   0049
L_D022:
        SLLC    R1,     1                       ; D022   0059
        ADCR    R0                              ; D023   0028
        B       L_D016                          ; D024   0220 000F

L_D026:
        PULR    R1                              ; D026   02B1
        PSHR    R5                              ; D027   0275
        TSTR    R0                              ; D028   0080
        PULR    R7                              ; D029   02B7

        PSHR    R0                              ; D02A   0270
        MVI@    R5,     R0                      ; D02B   02A8
        INCR    R7                              ; D02C   000F

        PSHR    R0                              ; D02D   0270
L_D02E:
        PSHR    R1                              ; D02E   0271
        MVII    #$0200, R1                      ; D02F   02B9 0200
        SLL     R1,     1                       ; D031   0049
        ADDR    R0,     R1                      ; D032   00C1
        SARC    R1,     1                       ; D033   0079
        MVI@    R1,     R0                      ; D034   0288
        BNC     L_D038                          ; D035   0209 0001

        RLC     R0,     1                       ; D037   0050
L_D038:
        RLC     R0,     1                       ; D038   0050
        PULR    R1                              ; D039   02B1
        PULR    R0                              ; D03A   02B0
        MOVR    R5,     R7                      ; D03B   00AF

        MVI@    R5,     R0                      ; D03C   02A8
        PSHR    R2                              ; D03D   0272
        CLRR    R2                              ; D03E   01D2
        B       L_D04B                          ; D03F   0200 000A

        MVI@    R5,     R0                      ; D041   02A8
        PSHR    R2                              ; D042   0272
        MVII    #$0001, R2                      ; D043   02BA 0001
        B       L_D04B                          ; D045   0200 0004

        MVI@    R5,     R0                      ; D047   02A8
        PSHR    R2                              ; D048   0272
        CLRR    R2                              ; D049   01D2
        DECR    R2                              ; D04A   0012
L_D04B:
        PSHR    R5                              ; D04B   0275
        PSHR    R1                              ; D04C   0271
        PSHR    R3                              ; D04D   0273
        NOP                                     ; D04E   0034
        PSHR    R0                              ; D04F   0270
        MVII    #$0200, R1                      ; D050   02B9 0200
        SLR     R0,     1                       ; D052   0060
        ADDR    R0,     R1                      ; D053   00C1
        MVI@    R1,     R0                      ; D054   0288
        CLRR    R3                              ; D055   01DB
        RLC     R0,     2                       ; D056   0054
        RLC     R3,     2                       ; D057   0057
        PULR    R5                              ; D058   02B5
        ANDI    #$0001, R5                      ; D059   03BD 0001
        INCR    R5                              ; D05B   000D
        TSTR    R2                              ; D05C   0092
        BPL     L_D06D                          ; D05D   0203 000E

        COMR    R5                              ; D05F   001D
        ANDI    #$0003, R5                      ; D060   03BD 0003
        XORR    R5,     R3                      ; D062   01EB
        ANDR    R3,     R5                      ; D063   019D
        RRC     R3,     2                       ; D064   0077
        RRC     R0,     2                       ; D065   0074
        SETC                                    ; D066   0007
        TSTR    R5                              ; D067   00AD
        BEQ     L_D06B                          ; D068   0204 0001

        CLRC                                    ; D06A   0006
L_D06B:
        B       L_D075                          ; D06B   0200 0008

L_D06D:
        ANDR    R5,     R3                      ; D06D   01AB
        TSTR    R2                              ; D06E   0092
        BEQ     L_D073                          ; D06F   0204 0002

        COMR    R5                              ; D071   001D
        XORR    R5,     R3                      ; D072   01EB
L_D073:
        RRC     R3,     2                       ; D073   0077
        RRC     R0,     2                       ; D074   0074
L_D075:
        MVO@    R0,     R1                      ; D075   0248
        PULR    R3                              ; D076   02B3
        PULR    R1                              ; D077   02B1
        PULR    R5                              ; D078   02B5
        PULR    R2                              ; D079   02B2
        MOVR    R5,     R7                      ; D07A   00AF

        DECLE   $0200,  $002A,  $0001,  $001E   ; D07B   0200 002A 0001 001E
        DECLE   $00E1,  $0005,  $0002,  $00BF   ; D07F   00E1 0005 0002 00BF
        DECLE   $000D,  $0002,  $00BF,  $0007   ; D083   000D 0002 00BF 0007
        DECLE   $0016,  $0068,  $0004,  $020C   ; D087   0016 0068 0004 020C
        DECLE   $00B4,  $0006,  $0214,  $0022   ; D08B   00B4 0006 0214 0022
        DECLE   $0005                           ; D08F   0005

        BGT     L_D136                          ; D090   020E 00A4

        JSRE    R6,     .EXEC.022               ; D092   0004 0211 0022
        DECLE   $000E,  $00C0,  $00C0,  $00F0   ; D095   000E 00C0 00C0 00F0
        DECLE   $00F0,  $00FC,  $00FC,  $00FF   ; D099   00F0 00FC 00FC 00FF
        DECLE   $00FF,  $0080,  $00E0,  $00E0   ; D09D   00FF 0080 00E0 00E0
        DECLE   $00F8,  $00F8,  $00FE,  $00FE   ; D0A1   00F8 00F8 00FE 00FE
        DECLE   $00FF,  $0002,  $0005,  $003F   ; D0A5   00FF 0002 0005 003F

        RRC     R2,     2                       ; D0A9   0076
        ADDR    R7,     R6                      ; D0AA   00FE
        ADDR    R3,     R7                      ; D0AB   00DF

        TSTR    R3                              ; D0AC   009B
        ADDR    R7,     R6                      ; D0AD   00FE
        SAR     R0,     2                       ; D0AE   006C
        RSWD    R0                              ; D0AF   0038
        SARC    R0,     2                       ; D0B0   007C
        SLLC    R0,     2                       ; D0B1   005C
        ADDR    R2,     R6                      ; D0B2   00D6
        ADDR    R7,     R6                      ; D0B3   00FE
        SARC    R0,     2                       ; D0B4   007C
        RSWD    R0                              ; D0B5   0038
        EIS                                     ; D0B6   0002
        SETC                                    ; D0B7   0007
        INCR    R7                              ; D0B8   000F

        RSWD    R0                              ; D0B9   0038
L_D0BA:
        MOVR    R6,     R4                      ; D0BA   00B4
        DECLE   $0016,  $0064,  $00AE,  $002C   ; D0BB   0016 0064 00AE 002C
        DECLE   $0038,  $002C,  $0048,  $009E   ; D0BF   0038 002C 0048 009E
        DECLE   $0062,  $0050,  $0028,  $0000   ; D0C3   0062 0050 0028 0000
        DECLE   $0005,  $000A,  $0028,  $0094   ; D0C7   0005 000A 0028 0094
        DECLE   $0002,  $0024,  $008A,  $0004   ; D0CB   0002 0024 008A 0004
        DECLE   $0008,  $0024,  $0010,  $008A   ; D0CF   0008 0024 0010 008A
        DECLE   $0060,  $0000,  $0028,  $0000   ; D0D3   0060 0000 0028 0000
        DECLE   $0001,  $0008,  $0020,  $0004   ; D0D7   0001 0008 0020 0004
        DECLE   $0042,  $0000,  $008A,  $0000   ; D0DB   0042 0000 008A 0000
        DECLE   $0020,  $0004,  $0000,  $0000   ; D0DF   0020 0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0E3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0020,  $0000   ; D0E7   0000 0000 0020 0000
        DECLE   $0040,  $0000,  $0000,  $0000   ; D0EB   0040 0000 0000 0000
        DECLE   $0020,  $0004,  $0000,  $0000   ; D0EF   0020 0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0F3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0F7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0FB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0FF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D103   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0018   ; D107   0000 0000 0018 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; D10B   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0024,  $0024   ; D10F   0000 0018 0024 0024
        DECLE   $0018,  $0000,  $0000,  $0000   ; D113   0018 0000 0000 0000
        DECLE   $0018,  $0024,  $0042,  $0042   ; D117   0018 0024 0042 0042
        DECLE   $0024,  $0018,  $0000,  $003C   ; D11B   0024 0018 0000 003C
        DECLE   $0042,  $0081,  $0081,  $0081   ; D11F   0042 0081 0081 0081
        DECLE   $0081,  $0042,  $003C,  $0000   ; D123   0081 0042 003C 0000
        DECLE   $0018,  $0024,  $0042,  $0042   ; D127   0018 0024 0042 0042
        DECLE   $0024,  $0018,  $0000,  $0000   ; D12B   0024 0018 0000 0000
        DECLE   $0000,  $0018,  $0024,  $0024   ; D12F   0000 0018 0024 0024
        DECLE   $0018,  $0000,  $0000           ; D133   0018 0000 0000
L_D136:
        RSWD    R4                              ; D136   003C
        DECLE   $0042,  $0095,  $00A9,  $0095   ; D137   0042 0095 00A9 0095
        DECLE   $00A9,  $0042,  $003C,  $003C   ; D13B   00A9 0042 003C 003C
        DECLE   $0042,  $00A9,  $0095,  $00A9   ; D13F   0042 00A9 0095 00A9
        DECLE   $0095,  $0042,  $003C,  $0000   ; D143   0095 0042 003C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D147   0000 0000 0000 0000
        DECLE   $0000                           ; D14B   0000

        EIS                                     ; D14C   0002
        DECR    R2                              ; D14D   0012

        JSR     R4,     .EXEC.44D               ; D14E   0004 0014 004D
        DECLE   $0038,  $001E,  $005B,  $0000   ; D151   0038 001E 005B 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D155   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $000A   ; D159   0001 0000 0000 000A
        DECLE   $0008,  $0014,  $0045,  $004C   ; D15D   0008 0014 0045 004C
        DECLE   $0068,  $001E,  $00AD,  $0000   ; D161   0068 001E 00AD 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D165   0000 0000 0000 0000
        DECLE   $0004,  $0020,  $0010,  $0004   ; D169   0004 0020 0010 0004
        DECLE   $0028,  $00A9,  $009E,  $0014   ; D16D   0028 00A9 009E 0014
        DECLE   $0036,  $005D,  $00EE,  $0000   ; D171   0036 005D 00EE 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D175   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0020,  $0084   ; D179   0000 0000 0020 0084
        DECLE   $0029,  $0014,  $003C,  $009A   ; D17D   0029 0014 003C 009A
        DECLE   $003C,  $005E,  $00F3,  $0000   ; D181   003C 005E 00F3 0000
        DECLE   $0000                           ; D185   0000

        JSR     R4,     X_SFX_OK                ; D186   0004 001C 02AD
        DECLE   $0275,  $0004,  $0190,  $0014   ; D189   0275 0004 0190 0014
        DECLE   $00A0,  $002B,  $0000           ; D18D   00A0 002B 0000

        BNEQ    L_D1EF                          ; D190   020C 005D

        MVI     G_01C8, R1                      ; D192   0281 01C8
        MVII    #$0003, R2                      ; D194   02BA 0003

        JSR     R5,     X_DIV                   ; D196   0004 011C 01FB

        DECR    R0                              ; D199   0010
        BMI     L_D1EF                          ; D19A   020B 0053

        MOVR    R0,     R1                      ; D19C   0081
        CMPI    #$0007, R1                      ; D19D   0379 0007
        BGT     L_D1EF                          ; D19F   020E 004E

        MVI     G_01D4, R2                      ; D1A1   0282 01D4
        SWAP    R2,     2                       ; D1A3   0046
        BGT     L_D1B7                          ; D1A4   020E 0011

        ANDI    #$000F, R2                      ; D1A6   03BA 000F
        ADDI    #$012A, R2                      ; D1A8   02FA 012A
        MVI@    R2,     R5                      ; D1AA   0295
        MVI@    R2,     R2                      ; D1AB   0292
        SLR     R2,     2                       ; D1AC   0066
        SLR     R2,     1                       ; D1AD   0062
        CMPI    #$0009, R2                      ; D1AE   037A 0009
        BNEQ    L_D1B7                          ; D1B0   020C 0005

        ANDI    #$0007, R5                      ; D1B2   03BD 0007
        CMPR    R1,     R5                      ; D1B4   014D
        BGE     L_D1EF                          ; D1B5   020D 0038

L_D1B7:
        INCR    R1                              ; D1B7   0009
        ADDR    R7,     R1                      ; D1B8   00F9
        ADD@    R1,     R7                      ; D1B9   02CF

        DECLE   $0008,  $001A,  $0031,  $0036   ; D1BA   0008 001A 0031 0036
        DECLE   $0050,  $005F,  $006B,  $0079   ; D1BE   0050 005F 006B 0079
        DECLE   $0004                           ; D1C2   0004

        ANDR    R2,     R0                      ; D1C3   0190
        XORR    R1,     R5                      ; D1C4   01CD

        JSR     R5,     L_5C0C                  ; D1C5   0004 015C 000C

        MVII    #$0006, R0                      ; D1C8   02B8 0006
        MVO     R0,     G_01EE                  ; D1CA   0240 01EE
        PULR    R7                              ; D1CC   02B7

        PSHR    R5                              ; D1CD   0275

        JSR     R5,     L_64F9                  ; D1CE   0004 0164 00F9

        J       L_648B                          ; D1D1   0004 0364 008B

        DECLE   $0004,  $0190,  $002A,  $0080   ; D1D4   0004 0190 002A 0080
        DECLE   $0201,  $0015,  $0280,  $01ED   ; D1D8   0201 0015 0280 01ED
        DECLE   $0078,  $0201,  $000C,  $02B8   ; D1DC   0078 0201 000C 02B8
        DECLE   $0001,  $0004                   ; D1E0   0001 0004

        ANDR    R4,     R4                      ; D1E2   01A4
        ADDR    R5,     R2                      ; D1E3   00EA

L_D1E4:
        JSR     R5,     L_54BD                  ; D1E4   0004 0154 00BD

L_D1E7:
        MVII    #$0012, R0                      ; D1E7   02B8 0012
        B       L_D1ED                          ; D1E9   0200 0002

L_D1EB:
        MVII    #$000F, R0                      ; D1EB   02B8 000F
L_D1ED:
        MVO     R0,     G_01EE                  ; D1ED   0240 01EE
L_D1EF:
        PULR    R7                              ; D1EF   02B7

        DECLE   $0004,  $0190,  $0014,  $0053   ; D1F0   0004 0190 0014 0053
        DECLE   $007B,  $0000                   ; D1F4   007B 0000

        BNEQ    L_D1EF                          ; D1F6   022C 0008

        MVII    #$0008, R0                      ; D1F8   02B8 0008

        JSR     R5,     X_RAND1                 ; D1FA   0004 0114 027D
        DECLE   $0081,  $03B8,  $0007,  $02F8   ; D1FD   0081 03B8 0007 02F8
        DECLE   $0003,  $0065,  $0061,  $0379   ; D201   0003 0065 0061 0379
        DECLE   $0003,  $022B,  $0026           ; D205   0003 022B 0026

        B       L_D1EB                          ; D208   0220 001E

        DECLE   $0004                           ; D20A   0004

        ANDR    R2,     R0                      ; D20B   0190
        ADCR    R2                              ; D20C   002A
        SARC    R0,     2                       ; D20D   007C
        BC      L_D1EF                          ; D20E   0221 0020

        MVI     G_0108, R0                      ; D210   0280 0108
        DECR    R0                              ; D212   0010
        BLE     L_D1EB                          ; D213   0226 0029

        MVO     R0,     G_0108                  ; D215   0240 0108
        B       L_D1E4                          ; D217   0220 0034

        DECLE   $0004,  $01A0,  $02FC,  $0044   ; D219   0004 01A0 02FC 0044
        DECLE   $0240,  $01D8,  $0004           ; D21D   0240 01D8 0004

        ANDR    R2,     R0                      ; D220   0190
        SWAP    R1,     1                       ; D221   0041
        RLC     R2,     2                       ; D222   0056
        B       L_D1E7                          ; D223   0220 003D

        MVI     G_01ED, R0                      ; D225   0280 01ED
        SUBI    #$0010, R0                      ; D227   0338 0010
        SUB     G_0110, R0                      ; D229   0300 0110
        CMPI    #$0002, R0                      ; D22B   0378 0002
        BMI     L_D1EB                          ; D22D   022B 0043

        MVO     R0,     G_01ED                  ; D22F   0240 01ED
        B       L_D1E7                          ; D231   0220 004B

        DECLE   $0004,  $0190,  $002A,  $0057   ; D233   0004 0190 002A 0057
        DECLE   $0221,  $0049,  $0004,  $01A0   ; D237   0221 0049 0004 01A0
        DECLE   $02FC,  $0024,  $0240,  $01D8   ; D23B   02FC 0024 0240 01D8
        DECLE   $0004                           ; D23F   0004

        ANDR    R2,     R0                      ; D240   0190
        SWAP    R1,     1                       ; D241   0041
        RLC     R3,     2                       ; D242   0057
        B       L_D1E7                          ; D243   0220 005D

        PSHR    R5                              ; D245   0275
        MOVR    R2,     R0                      ; D246   0090

        JSR     R5,     X_POW2                  ; D247   0004 0114 0345

        COMR    R0                              ; D24A   0018
        AND     G_01D3, R0                      ; D24B   0380 01D3
        MVO     R0,     G_01D3                  ; D24D   0240 01D3
        MVI@    R4,     R0                      ; D24F   02A0
        SDBD                                    ; D250   0001
        ANDI    #$E000, R0                      ; D251   03B8 0000 00E0
        DECR    R4                              ; D254   0014
        MVO@    R0,     R4                      ; D255   0260
        PULR    R7                              ; D256   02B7

        MVI     .IV.ALD,R0                      ; D257   0280 0080
        SWAP    R0,     1                       ; D259   0040
        ADDI    #$020A, R1                      ; D25A   02F9 020A
        MVO@    R0,     R1                      ; D25C   0248
        MVI     G_01D4, R0                      ; D25D   0280 01D4
        ANDI    #$007F, R0                      ; D25F   03B8 007F
        MVO     R0,     G_01D4                  ; D261   0240 01D4
        MOVR    R5,     R7                      ; D263   00AF

        MVI     G_01D4, R1                      ; D264   0281 01D4
        SWAP    R1,     2                       ; D266   0045
        BGE     L_D50C                          ; D267   020D 02A3

        MOVR    R1,     R2                      ; D269   008A
        ANDI    #$000F, R1                      ; D26A   03B9 000F
        ADDI    #$012A, R1                      ; D26C   02F9 012A
        MVII    #$027B, R4                      ; D26E   02BC 027B
        SLR     R2,     2                       ; D270   0066
        SLR     R2,     2                       ; D271   0066
        ANDI    #$0007, R2                      ; D272   03BA 0007
        MOVR    R2,     R0                      ; D274   0090

        JSR     R5,     X_POW2                  ; D275   0004 0114 0345

        AND     G_01D3, R0                      ; D278   0380 01D3
        BEQ     L_D50C                          ; D27A   0204 0290

        MVI@    R1,     R3                      ; D27C   028B
        SLR     R3,     2                       ; D27D   0067
        SLR     R3,     1                       ; D27E   0063
        MOVR    R3,     R0                      ; D27F   0098
        INCR    R3                              ; D280   000B
        ADDR    R7,     R3                      ; D281   00FB
        ADD@    R3,     R7                      ; D282   02DF

        DECLE   $006C,  $006C,  $0088,  $0020   ; D283   006C 006C 0088 0020
        DECLE   $0057,  $0057,  $00EB,  $00EB   ; D287   0057 0057 00EB 00EB
        DECLE   $01BE,  $0024,  $0241,  $0241   ; D28B   01BE 0024 0241 0241
        DECLE   $0241,  $0241,  $0241,  $0241   ; D28F   0241 0241 0241 0241
        DECLE   $0241,  $0024,  $0024,  $0024   ; D293   0241 0024 0024 0024
        DECLE   $0024,  $022B,  $022B,  $022B   ; D297   0024 022B 022B 022B
        DECLE   $022B,  $022B,  $022B,  $022B   ; D29B   022B 022B 022B 022B
        DECLE   $022B,  $0025,  $0200,  $0200   ; D29F   022B 0025 0200 0200

        MVII    #$0030, R5                      ; D2A3   02BD 0030
        MVO     R5,     G_01EE                  ; D2A5   0245 01EE
        PULR    R7                              ; D2A7   02B7

        DECLE   $0004,  $0190,  $0245,  $0271   ; D2A8   0004 0190 0245 0271
        DECLE   $02B8,  $0001,  $0004,  $0190   ; D2AC   02B8 0001 0004 0190
        DECLE   $000A,  $0028,  $0004,  $0194   ; D2B0   000A 0028 0004 0194
        DECLE   $01A0,  $0108,  $0280,  $01ED   ; D2B4   01A0 0108 0280 01ED
        DECLE   $0064,  $0064,  $0060,  $0004   ; D2B8   0064 0064 0060 0004

        ANDR    R2,     R4                      ; D2BC   0194
        CMPR    R7,     R4                      ; D2BD   017C

        JSR     R5,     L_54BD                  ; D2BE   0004 0154 00BD
        DECLE   $02B8,  $00FF,  $0240,  $01ED   ; D2C1   02B8 00FF 0240 01ED
        DECLE   $02B1,  $02B8,  $000B,  $0200   ; D2C5   02B1 02B8 000B 0200
        DECLE   $0032,  $0023,  $0005,  $002E   ; D2C9   0032 0023 0005 002E
        DECLE   $0011,  $000A,  $0029,  $0006   ; D2CD   0011 000A 0029 0006
        DECLE   $0000,  $000A,  $0005,  $0006   ; D2D1   0000 000A 0005 0006
        DECLE   $0006,  $0003,  $0006,  $0003   ; D2D5   0006 0003 0006 0003
        DECLE   $0008,  $0004,  $0190,  $0245   ; D2D9   0008 0004 0190 0245
        DECLE   $028D,  $03BD,  $000F,  $0001   ; D2DD   028D 03BD 000F 0001
        DECLE   $02FD,  $00CA,  $0092,  $02A8   ; D2E1   02FD 00CA 0092 02A8
        DECLE   $0004,  $01AC,  $02C6,  $0288   ; D2E5   0004 01AC 02C6 0288
        DECLE   $03B8,  $000F,  $02F8,  $0078   ; D2E9   03B8 000F 02F8 0078
        DECLE   $0200,  $0046,  $0004,  $0190   ; D2ED   0200 0046 0004 0190
        DECLE   $0245,  $0271,  $0004,  $0194   ; D2F1   0245 0271 0004 0194
        DECLE   $0114,  $02B1,  $0288,  $03B8   ; D2F5   0114 02B1 0288 03B8
        DECLE   $000F,  $02F8,  $000F,  $0004   ; D2F9   000F 02F8 000F 0004
        DECLE   $01AC,  $02C6,  $0004,  $0190   ; D2FD   01AC 02C6 0004 0190
        DECLE   $0257,  $0004                   ; D301   0257 0004

        ANDR    R2,     R0                      ; D303   0190
        ADCR    R2                              ; D304   002A
        DECR    R5                              ; D305   0015
        BNC     L_D50C                          ; D306   0209 0204
        J       L_6768                          ; D308   0004 0364 0368

        DECLE   $0004,  $0190,  $0245,  $028B   ; D30B   0004 0190 0245 028B
        DECLE   $03BB,  $0007,  $0004,  $0190   ; D30F   03BB 0007 0004 0190
        DECLE   $002A,  $009C,  $0201,  $000B   ; D313   002A 009C 0201 000B

        INCR    R3                              ; D317   000B
        ADDR    R7,     R3                      ; D318   00FB
        ADD@    R3,     R7                      ; D319   02DF

        INCR    R0                              ; D31A   0008
        DECR    R5                              ; D31B   0015
        NEGR    R0                              ; D31C   0020
        NEGR    R6                              ; D31D   0026
        ADCR    R6                              ; D31E   002E
        ADDR    R3,     R7                      ; D31F   00DF

        DECLE   $0038,  $003C,  $0004           ; D320   0038 003C 0004

        ANDR    R2,     R4                      ; D323   0194
        CMPR    R7,     R3                      ; D324   017B
        INCR    R0                              ; D325   0008
        PSHR    R1                              ; D326   0271

        JSR     R5,     L_54BD                  ; D327   0004 0154 00BD
        DECLE   $02B1,  $02B8,  $000F,  $0220   ; D32A   02B1 02B8 000F 0220
        DECLE   $0032,  $0004,  $0190,  $003C   ; D32E   0032 0004 0190 003C
        DECLE   $0028,  $02B8,  $0051,  $0004   ; D332   0028 02B8 0051 0004
        DECLE   $0190,  $0042,  $0220,  $003A   ; D336   0190 0042 0220 003A
        DECLE   $0004,  $0190,  $003C,  $0055   ; D33A   0004 0190 003C 0055
        DECLE   $0220,  $0040,  $0004,  $0190   ; D33E   0220 0040 0004 0190
        DECLE   $0041,  $0055,  $02B8,  $001A   ; D342   0041 0055 02B8 001A
        DECLE   $0220,  $004B,  $0271,  $0004   ; D346   0220 004B 0271 0004
        DECLE   $0194,  $0187,  $0010,  $02B1   ; D34A   0194 0187 0010 02B1
        DECLE   $02B8,  $0018,  $0220,  $0055   ; D34E   02B8 0018 0220 0055

        MVII    #$0107, R3                      ; D352   02BB 0107
        B       L_D358                          ; D354   0200 0002

        MVII    #$0109, R3                      ; D356   02BB 0109
L_D358:
        MVII    #$000E, R0                      ; D358   02B8 000E

        JSR     R5,     X_RAND1                 ; D35A   0004 0114 027D
        DECLE   $01D2,  $0006,  $002A,  $0078   ; D35D   01D2 0006 002A 0078
        DECLE   $022C,  $0003,  $0090,  $0338   ; D361   022C 0003 0090 0338
        DECLE   $0006,  $004C,  $0004,  $0194   ; D365   0006 004C 0004 0194
        DECLE   $01A1,  $02B8,  $0009,  $0220   ; D369   01A1 02B8 0009 0220
        DECLE   $0071,  $028B,  $03BB,  $000F   ; D36D   0071 028B 03BB 000F
        DECLE   $037B,  $0006,  $020D,  $000C   ; D371   037B 0006 020D 000C
        DECLE   $0285,  $01C9,  $037D,  $00FF   ; D375   0285 01C9 037D 00FF
        DECLE   $0204,  $0191,  $02FD,  $013A   ; D379   0204 0191 02FD 013A
        DECLE   $02AD,  $00AD,  $0204,  $018B   ; D37D   02AD 00AD 0204 018B
        DECLE   $0004                           ; D381   0004

        ANDR    R2,     R0                      ; D382   0190
        MVO     R5,     .STIC.Y.3               ; D383   0245 000B
        ADDR    R7,     R3                      ; D385   00FB
        ADD@    R3,     R7                      ; D386   02DF

        DECLE   $0010,  $0042,  $0015,  $0019   ; D387   0010 0042 0015 0019
        DECLE   $0027                           ; D38B   0027

        COMR    R4                              ; D38C   001C
        SLL     R2,     1                       ; D38D   004A
        SLR     R3,     1                       ; D38E   0063
        RRC     R2,     1                       ; D38F   0072
        MOVR    R1,     R2                      ; D390   008A
        SLR     R3,     1                       ; D391   0063
        RRC     R3,     2                       ; D392   0077
        MOVR    R3,     R7                      ; D393   009F

        DECLE   $00AE,  $004A,  $0063,  $0004   ; D394   00AE 004A 0063 0004
        DECLE   $0194,  $0227,  $0220,  $009C   ; D398   0194 0227 0220 009C

        MVII    #$0001, R2                      ; D39C   02BA 0001
        B       L_D3A5                          ; D39E   0200 0005

        CLRR    R2                              ; D3A0   01D2
        B       L_D3A5                          ; D3A1   0200 0002

        MVII    #$0006, R2                      ; D3A3   02BA 0006
L_D3A5:
        MVI     G_017A, R5                      ; D3A5   0285 017A
        DECLE   $00AD,  $0204,  $0002,  $0242   ; D3A7   00AD 0204 0002 0242
        DECLE   $017A,  $0220,  $00AE           ; D3AB   017A 0220 00AE

        MVI     G_01C9, R2                      ; D3AE   0282 01C9
        MOVR    R2,     R5                      ; D3B0   0095
        ADDI    #$0122, R5                      ; D3B1   02FD 0122
        MVI@    R5,     R0                      ; D3B3   02A8
        SLR     R0,     2                       ; D3B4   0064
        SLR     R0,     1                       ; D3B5   0060
        CMPI    #$000C, R0                      ; D3B6   0378 000C
        BGE     L_D3C0                          ; D3B8   020D 0006

        CLRR    R0                              ; D3BA   01C0
        MVO     R0,     G_0168                  ; D3BB   0240 0168
        INCR    R0                              ; D3BD   0008
        MVO     R0,     G_0167                  ; D3BE   0240 0167
L_D3C0:
        ADDI    #$013A, R2                      ; D3C0   02FA 013A
        DECLE   $0290,  $00C0,  $0250,  $02B8   ; D3C2   0290 00C0 0250 02B8
        DECLE   $0028,  $0220,  $00CC,  $0004   ; D3C6   0028 0220 00CC 0004
        DECLE   $0190,  $0041,  $0032,  $02B8   ; D3CA   0190 0041 0032 02B8
        DECLE   $0007,  $0220,  $00D4,  $02B8   ; D3CE   0007 0220 00D4 02B8
        DECLE   $0001,  $0240,  $0142,  $0285   ; D3D2   0001 0240 0142 0285
        DECLE   $01C8,  $037D,  $0003,  $022B   ; D3D6   01C8 037D 0003 022B
        DECLE   $00DE,  $01ED,  $0015,  $0245   ; D3DA   00DE 01ED 0015 0245
        DECLE   $01C8,  $0004,  $0190,  $002A   ; D3DE   01C8 0004 0190 002A
        DECLE   $0016,  $0201,  $0127,  $01ED   ; D3E2   0016 0201 0127 01ED
        DECLE   $0245,  $034B,  $0220,  $00ED   ; D3E6   0245 034B 0220 00ED
        DECLE   $0004,  $0190,  $0005,  $0032   ; D3EA   0004 0190 0005 0032
        DECLE   $0056,  $0051,  $0050,  $0055   ; D3EE   0056 0051 0050 0055
        DECLE   $0079,  $0081,  $0000,  $02B8   ; D3F2   0079 0081 0000 02B8
        DECLE   $0004,  $0220,  $00FC,  $0004   ; D3F6   0004 0220 00FC 0004
        DECLE   $0194,  $01E0,  $0220,  $00FE   ; D3FA   0194 01E0 0220 00FE
        DECLE   $0271,  $0004,  $0190,  $002A   ; D3FE   0271 0004 0190 002A
        DECLE   $0016,  $0209,  $0003,  $0004   ; D402   0016 0209 0003 0004

        ANDR    R3,     R4                      ; D406   019C
        SUB     .STIC.X.4,R4                    ; D407   0304 0004
        ANDR    R2,     R0                      ; D409   0190
        XORR    R1,     R5                      ; D40A   01CD

        JSR     R5,     L_5C0C                  ; D40B   0004 015C 000C
        DECLE   $02B1,  $0220,  $0111,  $0004   ; D40E   02B1 0220 0111 0004
        DECLE   $0190,  $002A,  $00A2,  $0221   ; D412   0190 002A 00A2 0221
        DECLE   $002C,  $0004,  $01A0,  $02FC   ; D416   002C 0004 01A0 02FC
        DECLE   $0066,  $0004,  $01A4,  $00EA   ; D41A   0066 0004 01A4 00EA
        DECLE   $02B8,  $000C,  $0240,  $01EE   ; D41E   02B8 000C 0240 01EE
        DECLE   $02B8,  $0002,  $0220,  $0129   ; D422   02B8 0002 0220 0129

        MVII    #$000B, R0                      ; D426   02B8 000B

        JSR     R5,     X_RAND2                 ; D428   0004 0114 029E
        DECLE   $02F8,  $0005,  $0004,  $0194   ; D42B   02F8 0005 0004 0194
        DECLE   $01A0,  $0108,  $02B8,  $002C   ; D42F   01A0 0108 02B8 002C
        DECLE   $0220,  $0138,  $0004,  $0190   ; D433   0220 0138 0004 0190
        DECLE   $0005,  $0032,  $0055,  $0050   ; D437   0005 0032 0055 0050
        DECLE   $0056,  $0000,  $02B8,  $000A   ; D43B   0056 0000 02B8 000A
        DECLE   $0220,  $0144,  $0004           ; D43F   0220 0144 0004

        ANDR    R2,     R0                      ; D442   0190
        MVO     R5,     .BTAB.B8                ; D443   0245 02B8
        DECR    R4                              ; D445   0014

        JSR     R5,     X_RAND2                 ; D446   0004 0114 029E
        DECLE   $0082,  $000A,  $028B,  $03BB   ; D449   0082 000A 028B 03BB
        DECLE   $0007,  $0004                   ; D44D   0007 0004

        ANDR    R2,     R0                      ; D44F   0190
        ADCR    R2                              ; D450   002A
        MOVR    R4,     R2                      ; D451   00A2
        BNC     L_D456                          ; D452   0209 0002

        ANDI    #$0006, R3                      ; D454   03BB 0006
L_D456:
        MOVR    R3,     R0                      ; D456   0098
        SLR     R0,     1                       ; D457   0060
        ADDI    #$002B, R0                      ; D458   02F8 002B
        SARC    R3,     1                       ; D45A   007B
        BNC     L_D462                          ; D45B   0209 0005

        SARC    R2,     1                       ; D45D   007A
        ADCR    R2                              ; D45E   002A
        NEGR    R2                              ; D45F   0022
        MVII    #$0007, R0                      ; D460   02B8 0007
L_D462:
        CMPI    #$0003, R3                      ; D462   037B 0003
        DECLE   $0204,  $000A,  $0270,  $0090   ; D464   0204 000A 0270 0090
        DECLE   $02FB,  $0107,  $0004,  $0194   ; D468   02FB 0107 0004 0194
        DECLE   $01A1,  $02B0,  $0220,  $0173   ; D46C   01A1 02B0 0220 0173
        DECLE   $0280,  $010B,  $0378,  $0040   ; D470   0280 010B 0378 0040
        DECLE   $022E,  $0176,  $0040,  $02C0   ; D474   022E 0176 0040 02C0
        DECLE   $010A,  $0092,  $020E,  $0002   ; D478   010A 0092 020E 0002
        DECLE   $0060,  $0020,  $0004,  $01A8   ; D47C   0060 0020 0004 01A8
        DECLE   $03A2,  $0220,  $0183,  $02BB   ; D480   03A2 0220 0183 02BB
        DECLE   $00FF,  $0243,  $01ED,  $0288   ; D484   00FF 0243 01ED 0288
        DECLE   $0378,  $00FF,  $020C,  $0004   ; D488   0378 00FF 020C 0004
        DECLE   $0004                           ; D48C   0004

        ANDR    R4,     R4                      ; D48D   01A4
        SUBR    R2,     R4                      ; D48E   0114
        DIS                                     ; D48F   0003
        ANDI    #$000F, R0                      ; D490   03B8 000F
        MOVR    R0,     R3                      ; D492   0083
        XORI    #$0008, R3                      ; D493   03FB 0008
        CMPI    #$0003, R3                      ; D495   037B 0003
        BGE     L_D4A1                          ; D497   020D 0008

        ADDI    #$0107, R3                      ; D499   02FB 0107
        MVII    #$0050, R5                      ; D49B   02BD 0050
        CMP@    R3,     R5                      ; D49D   035D
        BMI     L_D4A1                          ; D49E   020B 0001

        MVO@    R5,     R3                      ; D4A0   025D
L_D4A1:
        ADDI    #$009C, R0                      ; D4A1   02F8 009C
        DECLE   $0004,  $0190,  $0042,  $0288   ; D4A3   0004 0190 0042 0288
        DECLE   $03B8,  $000F,  $02F8,  $0021   ; D4A7   03B8 000F 02F8 0021
        DECLE   $0004                           ; D4AB   0004

        ANDR    R5,     R4                      ; D4AC   01AC
        ADD     .STIC.X.4,R6                    ; D4AD   02C6 0004
        ANDR    R2,     R0                      ; D4AF   0190
        MVO     R5,     .BTAB.B8                ; D4B0   0245 02B8
        DIS                                     ; D4B2   0003
        MVO     R0,     G_01EE                  ; D4B3   0240 01EE
        MVI@    R1,     R0                      ; D4B5   0288

        JSR     R5,     L_DFDE                  ; D4B6   0004 01DC 03DE
        DECLE   $0270,  $0004,  $01A8,  $0396   ; D4B9   0270 0004 01A8 0396
        DECLE   $01DE,  $02B0,  $0004,  $01A8   ; D4BD   01DE 02B0 0004 01A8
        DECLE   $03A2,  $0220,  $01C4,  $0083   ; D4C1   03A2 0220 01C4 0083
        DECLE   $0004,  $0190,  $0014,  $0015   ; D4C5   0004 0190 0014 0015
        DECLE   $000B,  $000D,  $0000           ; D4C9   000B 000D 0000

        TSTR    R0                              ; D4CC   0080
        BNEQ    L_D50C                          ; D4CD   020C 003D

        ADDR    R7,     R3                      ; D4CF   00FB
        ADDI    #$0033, R3                      ; D4D0   02FB 0033
        MVI@    R3,     R3                      ; D4D2   029B
        MVI     G_0176, R0                      ; D4D3   0280 0176
        DECR    R0                              ; D4D5   0010
        BMI     L_D50C                          ; D4D6   020B 0034

        ANDI    #$0001, R0                      ; D4D8   03B8 0001
        CMPI    #$0006, R3                      ; D4DA   037B 0006
        BLT     L_D4DF                          ; D4DC   0205 0001

        CLRR    R0                              ; D4DE   01C0
L_D4DF:
        ADDR    R3,     R0                      ; D4DF   00D8
        DECLE   $0271,  $0272,  $0274,  $0004   ; D4E0   0271 0272 0274 0004
        DECLE   $0198,  $028D,  $02B4,  $02B2   ; D4E4   0198 028D 02B4 02B2
        DECLE   $02B1,  $0004,  $0190,  $000A   ; D4E8   02B1 0004 0190 000A
        DECLE   $0201,  $001E,  $0288,  $0085   ; D4EC   0201 001E 0288 0085
        DECLE   $03BD,  $0007,  $0204,  $000E   ; D4F0   03BD 0007 0204 000E

        DECR    R0                              ; D4F4   0010
        MVO@    R0,     R1                      ; D4F5   0248
        MVI@    R4,     R0                      ; D4F6   02A0
        MOVR    R0,     R5                      ; D4F7   0085
        ANDI    #$0007, R0                      ; D4F8   03B8 0007
        SUBR    R0,     R5                      ; D4FA   0105
        DECR    R0                              ; D4FB   0010
        ANDI    #$0007, R0                      ; D4FC   03B8 0007
        ADDR    R0,     R5                      ; D4FE   00C5
        DECR    R4                              ; D4FF   0014
        MVO@    R5,     R4                      ; D500   0265
        PULR    R7                              ; D501   02B7

        DECLE   $0004,  $0190,  $0245,  $0004   ; D502   0004 0190 0245 0004
        DECLE   $0190,  $0257,  $0004           ; D506   0190 0257 0004

        ANDR    R2,     R0                      ; D509   0190
        RSWD    R4                              ; D50A   003C
        COMR    R4                              ; D50B   001C
L_D50C:
        PULR    R7                              ; D50C   02B7

        DECLE   $0004,  $0008,  $0000,  $0000   ; D50D   0004 0008 0000 0000

        CLRC                                    ; D511   0006
        SETC                                    ; D512   0007
        EIS                                     ; D513   0002
        PSHR    R5                              ; D514   0275
        MVI@    R1,     R1                      ; D515   0289
        ANDI    #$000F, R1                      ; D516   03B9 000F
        MOVR    R1,     R2                      ; D518   008A
        INCR    R1                              ; D519   0009
        ADDR    R7,     R1                      ; D51A   00F9
        ADD@    R1,     R7                      ; D51B   02CF

        DECLE   $0010,  $0021,  $003B,  $001B   ; D51C   0010 0021 003B 001B
        DECLE   $0028,  $003B,  $003B,  $0044   ; D520   0028 003B 003B 0044
        DECLE   $0014,  $0054,  $003B,  $003B   ; D524   0014 0054 003B 003B
        DECLE   $0028,  $0028,  $003B,  $0048   ; D528   0028 0028 003B 0048
        DECLE   $02B8,  $0008,  $0200,  $0002   ; D52C   02B8 0008 0200 0002
        DECLE   $0280,  $010F,  $0004           ; D530   0280 010F 0004

        ANDR    R2,     R4                      ; D533   0194
        CMPR    R7,     R4                      ; D534   017C
        B       L_D59C                          ; D535   0200 0065

        DECLE   $02BA,  $0003,  $02B8,  $0051   ; D537   02BA 0003 02B8 0051
        DECLE   $0200,  $0002,  $02B8,  $0028   ; D53B   0200 0002 02B8 0028
        DECLE   $0004                           ; D53F   0004

        ANDR    R2,     R0                      ; D540   0190
        RSWD    R5                              ; D541   003D
        B       L_D557                          ; D542   0200 0013

        DECLE   $0004,  $0190,  $002A,  $009C   ; D544   0004 0190 002A 009C
        DECLE   $0221,  $0012,  $0004           ; D548   0221 0012 0004

        ANDR    R4,     R0                      ; D54B   01A0
        ADDI    #$0066, R4                      ; D54C   02FC 0066
        ADDI    #$0002, R0                      ; D54E   02F8 0002
        CMPI    #$0004, R2                      ; D550   037A 0004
        BNEQ    L_D555                          ; D552   020C 0001

        ADDR    R0,     R0                      ; D554   00C0
L_D555:
        MVO     R0,     G_0111                  ; D555   0240 0111
L_D557:
        ADDR    R7,     R2                      ; D557   00FA
        DECLE   $02FA,  $0078,  $0290,  $0082   ; D558   02FA 0078 0290 0082
        DECLE   $0004                           ; D55C   0004

        ANDR    R2,     R0                      ; D55D   0190
        SWAP    R2,     1                       ; D55E   0042
        PULR    R7                              ; D55F   02B7

        MVII    #$0010, R1                      ; D560   02B9 0010
        B       L_D566                          ; D562   0200 0002

        MVII    #$0021, R1                      ; D564   02B9 0021
L_D566:
        ADD     G_010E, R1                      ; D566   02C1 010E
        MVO     R1,     G_010E                  ; D568   0241 010E
        MOVR    R7,     R5                      ; D56A   00BD
        ADDI    #$0031, R5                      ; D56B   02FD 0031
        PSHR    R5                              ; D56D   0275
        B       L_D557                          ; D56E   0220 0018

        DECLE   $0004,  $0190,  $002A,  $009C   ; D570   0004 0190 002A 009C
        DECLE   $0221,  $003E,  $0004,  $0194   ; D574   0221 003E 0004 0194
        DECLE   $0187                           ; D578   0187

        INCR    R0                              ; D579   0008
        PULR    R7                              ; D57A   02B7

        MVI@    R5,     R0                      ; D57B   02A8
        ADD     G_010E, R0                      ; D57C   02C0 010E
        CMP     G_010F, R0                      ; D57E   0340 010F
        BLE     L_D584                          ; D580   0206 0002

        MVI     G_010F, R0                      ; D582   0280 010F
L_D584:
        MVO     R0,     G_010E                  ; D584   0240 010E
        MOVR    R5,     R7                      ; D586   00AF

        DECLE   $02A8,  $0020,  $0275,  $0004   ; D587   02A8 0020 0275 0004
        DECLE   $0194,  $01A0,  $0108,  $0004   ; D58B   0194 01A0 0108 0004

        ANDR    R5,     R0                      ; D58F   01A8
        XOR     .STIC.X.4,R1                    ; D590   03C1 0004
        ANDR    R5,     R0                      ; D592   01A8
        XOR@    R3,     R2                      ; D593   03DA
        MVO     R2,     G_010F                  ; D594   0242 010F
        CMP     G_010E, R2                      ; D596   0342 010E
        BGE     L_D59C                          ; D598   020D 0002

        MVO     R2,     G_010E                  ; D59A   0242 010E

L_D59C:
        JSR     R5,     L_54BD                  ; D59C   0004 0154 00BD

        PULR    R7                              ; D59F   02B7

        MVI@    R5,     R3                      ; D5A0   02AB
        PSHR    R5                              ; D5A1   0275
        ADD@    R3,     R0                      ; D5A2   02D8

        JSR     R5,     X_CLAMP                 ; D5A3   0004 0114 0270
        DECLE   $0000                           ; D5A6   0000

        SARC    R0,     1                       ; D5A7   0078
        MVO@    R0,     R3                      ; D5A8   0258
        PULR    R7                              ; D5A9   02B7

        DECLE   $0275,  $02B8,  $0050,  $0270   ; D5AA   0275 02B8 0050 0270
        DECLE   $0004,  $0190,  $003D,  $02B0   ; D5AE   0004 0190 003D 02B0
        DECLE   $0008,  $0378,  $005E,  $0226   ; D5B2   0008 0378 005E 0226
        DECLE   $0009,  $0004,  $0190,  $003C   ; D5B6   0009 0004 0190 003C
        DECLE   $0028,  $01C0,  $0240,  $0111   ; D5BA   0028 01C0 0240 0111
        DECLE   $0280,  $010F,  $0340,  $010E   ; D5BE   0280 010F 0340 010E
        DECLE   $020D,  $0002,  $0240,  $010E   ; D5C2   020D 0002 0240 010E
        DECLE   $0004,  $0190,  $000A,  $0221   ; D5C6   0004 0190 000A 0221
        DECLE   $00BE,  $0004                   ; D5CA   00BE 0004

        ANDR    R2,     R0                      ; D5CC   0190
        RSWD    R4                              ; D5CD   003C
        GSWD    R2                              ; D5CE   0032
        PULR    R7                              ; D5CF   02B7

        DECLE   $0000,  $0051,  $0053,  $0028   ; D5D0   0000 0051 0053 0028
        DECLE   $0050,  $0052,  $005A,  $005B   ; D5D4   0050 0052 005A 005B
        DECLE   $0000,  $0000                   ; D5D8   0000 0000

        SLLC    R0,     2                       ; D5DA   005C
        RLC     R1,     2                       ; D5DB   0055
        RLC     R3,     2                       ; D5DC   0057
        RLC     R2,     2                       ; D5DD   0056
        SLLC    R1,     2                       ; D5DE   005D
        SLLC    R2,     2                       ; D5DF   005E
        PSHR    R5                              ; D5E0   0275
        PSHR    R1                              ; D5E1   0271
        MVI     G_01CF, R3                      ; D5E2   0283 01CF
        MVO     R3,     G_01D1                  ; D5E4   0243 01D1
        MVI     G_035C, R0                      ; D5E6   0280 035C
        TSTR    R0                              ; D5E8   0080
        BEQ     L_D604                          ; D5E9   0204 0019

        MVI     G_01C9, R2                      ; D5EB   0282 01C9
        CMPI    #$00FF, R2                      ; D5ED   037A 00FF
        BEQ     L_D604                          ; D5EF   0204 0013

        ADDI    #$032C, R2                      ; D5F1   02FA 032C
        MVI@    R2,     R0                      ; D5F3   0290
        TSTR    R0                              ; D5F4   0080
        BMI     L_D604                          ; D5F5   020B 000D

        MVI     G_0174, R0                      ; D5F7   0280 0174
        MVI     G_0175, R2                      ; D5F9   0282 0175
        MVO     R0,     G_0177                  ; D5FB   0240 0177
        MVO     R2,     G_0178                  ; D5FD   0242 0178

        JSR     R5,     L_6A1D                  ; D5FF   0004 0168 021D

        PULR    R1                              ; D602   02B1
        PULR    R7                              ; D603   02B7

L_D604:
        MVII    #$0006, R5                      ; D604   02BD 0006
        MVO     R5,     G_01EE                  ; D606   0245 01EE
        SLL     R3,     2                       ; D608   004F
        SLL     R3,     2                       ; D609   004F
        ADD     G_0186, R3                      ; D60A   02C3 0186
        MVO     R3,     G_0333                  ; D60C   0243 0333
        MVII    #$000D, R0                      ; D60E   02B8 000D

        JSR     R5,     X_RAND2                 ; D610   0004 0114 029E

        INCR    R0                              ; D613   0008
        MVII    #$0129, R2                      ; D614   02BA 0129

        JSR     R5,     L_64D9                  ; D616   0004 0164 00D9

        MVII    #$0333, R4                      ; D619   02BC 0333
        MVII    #$0007, R2                      ; D61B   02BA 0007
        MVO     R2,     G_01C9                  ; D61D   0242 01C9

        JSR     R5,     L_5D92                  ; D61F   0004 015C 0192
        JSR     R5,     L_698B                  ; D622   0004 0168 018B

        PULR    R1                              ; D625   02B1
        PULR    R7                              ; D626   02B7

        DECLE   $0275,  $0271,  $0280,  $035C   ; D627   0275 0271 0280 035C
        DECLE   $0080,  $0224,  $0008,  $0281   ; D62B   0080 0224 0008 0281
        DECLE   $01C9,  $0379,  $00FF,  $0224   ; D62F   01C9 0379 00FF 0224
        DECLE   $000E,  $02F9,  $032C,  $0288   ; D633   000E 02F9 032C 0288
        DECLE   $0080,  $022B,  $0014,  $0283   ; D637   0080 022B 0014 0283
        DECLE   $01D1,  $0004,  $0190,  $002A   ; D63B   01D1 0004 0190 002A
        DECLE   $0016,  $0229,  $003D,  $0004   ; D63F   0016 0229 003D 0004

        ANDR    R3,     R4                      ; D643   019C
        SUB     .BTAB.83,R4                     ; D644   0304 0283
        XORR    R2,     R1                      ; D646   01D1
        B       L_D604                          ; D647   0220 0044

        DECLE   $0275,  $01E4,  $0004,  $0190   ; D649   0275 01E4 0004 0190
        DECLE   $002A,  $001C,  $002C,  $03FC   ; D64D   002A 001C 002C 03FC
        DECLE   $0001,  $0004                   ; D651   0001 0004

        ANDR    R2,     R0                      ; D653   0190
        ADCR    R2                              ; D654   002A
        DECR    R5                              ; D655   0015
        BC      L_D65A                          ; D656   0201 0002

        MVO     R4,     G_0345                  ; D658   0244 0345
L_D65A:
        MOVR    R4,     R5                      ; D65A   00A5
        MVII    #$0345, R4                      ; D65B   02BC 0345
        MVII    #$0241, R0                      ; D65D   02B8 0241
        ADD     G_0161, R0                      ; D65F   02C0 0161
        ADDR    R5,     R4                      ; D661   00EC
        ADDR    R5,     R7                      ; D662   00EF

        MVO@    R0,     R4                      ; D663   0260
        DECR    R0                              ; D664   0010
        MVO@    R0,     R4                      ; D665   0260
        MVO@    R0,     R4                      ; D666   0260
        ADDI    #$0005, R4                      ; D667   02FC 0005
        MVII    #$0132, R0                      ; D669   02B8 0132
        ADDR    R5,     R4                      ; D66B   00EC
        ADDR    R5,     R7                      ; D66C   00EF

        MVO@    R0,     R4                      ; D66D   0260
        SUBI    #$0085, R0                      ; D66E   0338 0085
        MVO@    R0,     R4                      ; D670   0260
        ADDI    #$0008, R0                      ; D671   02F8 0008
        MVO@    R0,     R4                      ; D673   0260
        ADDI    #$0005, R4                      ; D674   02FC 0005
        SDBD                                    ; D676   0001
        MVII    #$08EF, R0                      ; D677   02B8 00EF 0008
        ADDR    R5,     R4                      ; D67A   00EC
        ADDR    R5,     R7                      ; D67B   00EF

        MVO@    R0,     R4                      ; D67C   0260
        SDBD                                    ; D67D   0001
        MVII    #$1980, R0                      ; D67E   02B8 0080 0019
        MVO@    R0,     R4                      ; D681   0260
        ADDI    #$0010, R0                      ; D682   02F8 0010
        MVO@    R0,     R4                      ; D684   0260
        PULR    R7                              ; D685   02B7

        DECLE   $0275,  $0280,  $01CF,  $004C   ; D686   0275 0280 01CF 004C
        DECLE   $004C,  $02C0,  $0186,  $02B9   ; D68A   004C 02C0 0186 02B9
        DECLE   $0324,  $028A,  $03BA,  $03FF   ; D68E   0324 028A 03BA 03FF
        DECLE   $0150,  $020C,  $0234,  $0004   ; D692   0150 020C 0234 0004

        ANDR    R2,     R0                      ; D696   0190
        RSWD    R4                              ; D697   003C
        GSWD    R1                              ; D698   0031
        MVII    #$0001, R3                      ; D699   02BB 0001
        MVO     R3,     G_0353                  ; D69B   0243 0353
        ADD     G_0110, R3                      ; D69D   02C3 0110
        MVO     R3,     G_0110                  ; D69F   0243 0110
        MOVR    R3,     R0                      ; D6A1   0098
        DECR    R0                              ; D6A2   0010
        MVII    #$0005, R1                      ; D6A3   02B9 0005

        JSR     R5,     X_MPY                   ; D6A5   0004 011C 01DC
        DECLE   $0090,  $0004,  $01A8,  $03A2   ; D6A8   0090 0004 01A8 03A2
        DECLE   $0004,  $0190,  $0041,  $0031   ; D6AC   0004 0190 0041 0031
        DECLE   $02BC,  $0344,  $01C0,  $0260   ; D6B0   02BC 0344 01C0 0260
        DECLE   $0260,  $0034,  $0260,  $0260   ; D6B4   0260 0034 0260 0260
        DECLE   $0034,  $0260,  $0260,  $0034   ; D6B8   0034 0260 0260 0034
        DECLE   $0260,  $0260,  $02B8,  $00A2   ; D6BC   0260 0260 02B8 00A2
        DECLE   $0260,  $0001,  $02F8,  $0000   ; D6C0   0260 0001 02F8 0000
        DECLE   $0004,  $0260,  $02FC,  $0006   ; D6C4   0004 0260 02FC 0006
        DECLE   $0004                           ; D6C8   0004

        ANDR    R2,     R4                      ; D6C9   0194
        ADD@    R1,     R7                      ; D6CA   02CF

        DECLE   $0086,  $0009,  $0090,  $0009   ; D6CB   0086 0009 0090 0009
        DECLE   $0001,  $02A8,  $0260,  $0260   ; D6CF   0001 02A8 0260 0260
        DECLE   $0001,  $02A8,  $0260,  $0004   ; D6D3   0001 02A8 0260 0004

        ANDR    R2,     R4                      ; D6D7   0194
        ANDR    R5,     R2                      ; D6D8   01AA

        JSR     R5,     L_68E6                  ; D6D9   0004 0168 00E6
        DECLE   $0001,  $02B8,  $0000,  $0004   ; D6DC   0001 02B8 0000 0004
        DECLE   $0240,  $0319,  $01C0,  $0240   ; D6E0   0240 0319 01C0 0240
        DECLE   $0173,  $0004,  $0194,  $0331   ; D6E4   0173 0004 0194 0331
        DECLE   $0280,  $0319,  $0080,  $022C   ; D6E8   0280 0319 0080 022C
        DECLE   $0004,  $0240,  $0168,  $0004   ; D6EC   0004 0240 0168 0004

        ANDR    R2,     R0                      ; D6F0   0190
        SWAP    R1,     1                       ; D6F1   0041
        DECR    R4                              ; D6F2   0014

        JSR     R5,     L_5082                  ; D6F3   0004 0150 0082
        DECLE   $0004,  $0190,  $002A,  $0014   ; D6F6   0004 0190 002A 0014
        DECLE   $0221,  $0005,  $0280,  $0110   ; D6FA   0221 0005 0280 0110
        DECLE   $0340,  $01E3,  $020E,  $02BE   ; D6FE   0340 01E3 020E 02BE

        JSR     R5,     L_5B42                  ; D702   0004 0158 0342
        DECLE   $0009,  $01C0,  $02BC,  $0344   ; D705   0009 01C0 02BC 0344
        DECLE   $0260,  $0260,  $0260,  $0004   ; D709   0260 0260 0260 0004

        ANDR    R3,     R4                      ; D70D   019C
        XOR@    R2,     R5                      ; D70E   03D5

        JSR     R5,     L_544A                  ; D70F   0004 0154 004A

L_D712:
        MVI     G_0319, R0                      ; D712   0280 0319
        ANDI    #$0200, R0                      ; D714   03B8 0200
        BNEQ    L_D712                          ; D716   022C 0005

        JSR     R5,     L_5B42                  ; D718   0004 0158 0342
        DECLE   $0003                           ; D71B   0003

        JSR     R5,     L_5B48                  ; D71C   0004 0158 0348
        DECLE   $0000                           ; D71F   0000

        JSR     R5,     L_5E71                  ; D720   0004 015C 0271
        JSR     R5,     L_5C0C                  ; D723   0004 015C 000C
        DECLE   $0004                           ; D726   0004

        ANDR    R5,     R4                      ; D727   01AC
        ADD     .STIC.Y.6,R5                    ; D728   02C5 000E
        MVI     G_0110, R0                      ; D72A   0280 0110
        ADDI    #$0081, R0                      ; D72C   02F8 0081
        MVO@    R0,     R5                      ; D72E   0268
        CLRC                                    ; D72F   0006
        PULR    R7                              ; D730   02B7

        DECLE   $0275,  $0004,  $019C,  $03D5   ; D731   0275 0004 019C 03D5
        DECLE   $02BC,  $021B,  $0001,  $02B9   ; D735   02BC 021B 0001 02B9
        DECLE   $00C2,  $0008,  $0004,  $0198   ; D739   00C2 0008 0004 0198
        DECLE   $0023,  $000C,  $02FC,  $0008   ; D73D   0023 000C 02FC 0008
        DECLE   $02F9,  $0008,  $008B,  $0004   ; D741   02F9 0008 008B 0004
        DECLE   $0198,  $0023,  $0002,  $02F9   ; D745   0198 0023 0002 02F9
        DECLE   $0008,  $008A,  $0004,  $0198   ; D749   0008 008A 0004 0198
        DECLE   $0023,  $0002,  $0339,  $0010   ; D74D   0023 0002 0339 0010
        DECLE   $0004,  $0198,  $0023,  $0004   ; D751   0004 0198 0023 0004
        DECLE   $0091,  $0004,  $0198,  $0023   ; D755   0091 0004 0198 0023
        DECLE   $0002,  $0099,  $0004,  $0198   ; D759   0002 0099 0004 0198
        DECLE   $0023,  $0002,  $02FC,  $0009   ; D75D   0023 0002 02FC 0009
        DECLE   $02B9,  $0062,  $0088,  $02E0   ; D761   02B9 0062 0088 02E0
        DECLE   $0014,  $0260,  $02FC,  $0002   ; D765   0014 0260 02FC 0002
        DECLE   $00A5,  $0098,  $02E0,  $0268   ; D769   00A5 0098 02E0 0268
        DECLE   $0090,  $02E0,  $0268,  $0090   ; D76D   0090 02E0 0268 0090
        DECLE   $02E0,  $0268,  $0098,  $02E0   ; D771   02E0 0268 0098 02E0
        DECLE   $0268,  $02FC,  $0002,  $0088   ; D775   0268 02FC 0002 0088
        DECLE   $02E0,  $0014,  $0260,  $02FC   ; D779   02E0 0014 0260 02FC
        DECLE   $000A,  $02FB,  $0010,  $02E3   ; D77D   000A 02FB 0010 02E3
        DECLE   $0014,  $0263,  $02FC,  $0008   ; D781   0014 0263 02FC 0008
        DECLE   $02FA,  $0010,  $0091,  $02E2   ; D785   02FA 0010 0091 02E2
        DECLE   $0014,  $0262,  $02FC,  $000B   ; D789   0014 0262 02FC 000B
        DECLE   $0001,  $03F9,  $0005,  $0010   ; D78D   0001 03F9 0005 0010
        DECLE   $02F9,  $0008,  $0004,  $0198   ; D791   02F9 0008 0004 0198
        DECLE   $0023,  $0008,  $02FC,  $000B   ; D795   0023 0008 02FC 000B
        DECLE   $0280,  $0319,  $0001,  $03B8   ; D799   0280 0319 0001 03B8
        DECLE   $0000,  $0004,  $022C,  $0007   ; D79D   0000 0004 022C 0007
        DECLE   $02F9,  $0019,  $0004,  $0198   ; D7A1   02F9 0019 0004 0198
        DECLE   $0023,  $0001,  $02F9,  $0008   ; D7A5   0023 0001 02F9 0008
        DECLE   $0004,  $0198,  $0023,  $0008   ; D7A9   0004 0198 0023 0008
        DECLE   $02F9,  $0008,  $0004,  $0198   ; D7AD   02F9 0008 0004 0198
        DECLE   $0023,  $0001,  $02FC,  $0009   ; D7B1   0023 0001 02FC 0009
        DECLE   $02F9,  $0008,  $0004,  $0198   ; D7B5   02F9 0008 0004 0198
        DECLE   $0023,  $0001,  $02F9,  $0008   ; D7B9   0023 0001 02F9 0008
        DECLE   $0004,  $0198,  $0023,  $000A   ; D7BD   0004 0198 0023 000A
        DECLE   $02F9,  $0008,  $0004,  $0198   ; D7C1   02F9 0008 0004 0198
        DECLE   $0023,  $0001,  $02FC,  $0008   ; D7C5   0023 0001 02FC 0008
        DECLE   $02F9,  $0008,  $0004           ; D7C9   02F9 0008 0004

        ANDR    R3,     R0                      ; D7CC   0198
        NEGR    R3                              ; D7CD   0023
        INCR    R4                              ; D7CE   000C
        PULR    R7                              ; D7CF   02B7

        DECLE   $0275,  $02BC,  $0258,  $02B8   ; D7D0   0275 02BC 0258 02B8
        DECLE   $0001,  $02A1,  $03F9,  $0007   ; D7D4   0001 02A1 03F9 0007
        DECLE   $0014,  $0261,  $02FC,  $0008   ; D7D8   0014 0261 02FC 0008
        DECLE   $0010,  $0224,  $0009,  $02FC   ; D7DC   0010 0224 0009 02FC
        DECLE   $0003,  $0004,  $0194,  $03F8   ; D7E0   0003 0004 0194 03F8
        DECLE   $0002,  $0010,  $000C,  $02FC   ; D7E4   0002 0010 000C 02FC
        DECLE   $000B,  $0004,  $0194,  $03F8   ; D7E8   000B 0004 0194 03F8
        DECLE   $0005,  $0010,  $0006,  $02FC   ; D7EC   0005 0010 0006 02FC
        DECLE   $0009,  $0004,  $0194,  $03F8   ; D7F0   0009 0004 0194 03F8
        DECLE   $0001,  $0000,  $0000           ; D7F4   0001 0000 0000

        PULR    R7                              ; D7F7   02B7

        SDBD                                    ; D7F8   0001
        MVI@    R5,     R0                      ; D7F9   02A8
        MVI@    R5,     R2                      ; D7FA   02AA
        PSHR    R5                              ; D7FB   0275
        MOVR    R4,     R5                      ; D7FC   00A5
        ADDR    R2,     R7                      ; D7FD   00D7

        MVI@    R4,     R1                      ; D7FE   02A1
        XORR    R0,     R1                      ; D7FF   01C1
        MVO@    R1,     R5                      ; D800   0269
        MVI@    R4,     R1                      ; D801   02A1
        XORR    R0,     R1                      ; D802   01C1
        MVO@    R1,     R5                      ; D803   0269
        MVI@    R4,     R1                      ; D804   02A1
        XORR    R0,     R1                      ; D805   01C1
        MVO@    R1,     R5                      ; D806   0269
        MVI@    R4,     R1                      ; D807   02A1
        XORR    R0,     R1                      ; D808   01C1
        MVO@    R1,     R5                      ; D809   0269
        MVI@    R4,     R1                      ; D80A   02A1
        XORR    R0,     R1                      ; D80B   01C1
        MVO@    R1,     R5                      ; D80C   0269
        MVI@    R4,     R1                      ; D80D   02A1
        XORR    R0,     R1                      ; D80E   01C1
        MVO@    R1,     R5                      ; D80F   0269
        MVI@    R4,     R1                      ; D810   02A1
        XORR    R0,     R1                      ; D811   01C1
        MVO@    R1,     R5                      ; D812   0269
        MVI@    R4,     R1                      ; D813   02A1
        XORR    R0,     R1                      ; D814   01C1
        MVO@    R1,     R5                      ; D815   0269
        MVI@    R4,     R1                      ; D816   02A1
        XORR    R0,     R1                      ; D817   01C1
        MVO@    R1,     R5                      ; D818   0269
        MVI@    R4,     R1                      ; D819   02A1
        XORR    R0,     R1                      ; D81A   01C1
        MVO@    R1,     R5                      ; D81B   0269
        MVI@    R4,     R1                      ; D81C   02A1
        XORR    R0,     R1                      ; D81D   01C1
        MVO@    R1,     R5                      ; D81E   0269
        MVI@    R4,     R1                      ; D81F   02A1
        XORR    R0,     R1                      ; D820   01C1
        MVO@    R1,     R5                      ; D821   0269
        PULR    R7                              ; D822   02B7

        MVII    #$000C, R0                      ; D823   02B8 000C
        SUB@    R5,     R0                      ; D825   0328
        PSHR    R5                              ; D826   0275
        MOVR    R0,     R5                      ; D827   0085
        ADDR    R0,     R0                      ; D828   00C0
        ADDR    R5,     R0                      ; D829   00E8
        MOVR    R4,     R5                      ; D82A   00A5
        ADDR    R0,     R7                      ; D82B   00C7

        MOVR    R1,     R0                      ; D82C   0088
        ADD@    R4,     R0                      ; D82D   02E0
        MVO@    R0,     R5                      ; D82E   0268
        MOVR    R1,     R0                      ; D82F   0088
        ADD@    R4,     R0                      ; D830   02E0
        MVO@    R0,     R5                      ; D831   0268
        MOVR    R1,     R0                      ; D832   0088
        ADD@    R4,     R0                      ; D833   02E0
        MVO@    R0,     R5                      ; D834   0268
        MOVR    R1,     R0                      ; D835   0088
        ADD@    R4,     R0                      ; D836   02E0
        MVO@    R0,     R5                      ; D837   0268
        MOVR    R1,     R0                      ; D838   0088
        ADD@    R4,     R0                      ; D839   02E0
        MVO@    R0,     R5                      ; D83A   0268
        MOVR    R1,     R0                      ; D83B   0088
        ADD@    R4,     R0                      ; D83C   02E0
        MVO@    R0,     R5                      ; D83D   0268
        MOVR    R1,     R0                      ; D83E   0088
        ADD@    R4,     R0                      ; D83F   02E0
        MVO@    R0,     R5                      ; D840   0268
        MOVR    R1,     R0                      ; D841   0088
        ADD@    R4,     R0                      ; D842   02E0
        MVO@    R0,     R5                      ; D843   0268
        MOVR    R1,     R0                      ; D844   0088
        ADD@    R4,     R0                      ; D845   02E0
        MVO@    R0,     R5                      ; D846   0268
        MOVR    R1,     R0                      ; D847   0088
        ADD@    R4,     R0                      ; D848   02E0
        MVO@    R0,     R5                      ; D849   0268
        MOVR    R1,     R0                      ; D84A   0088
        ADD@    R4,     R0                      ; D84B   02E0
        MVO@    R0,     R5                      ; D84C   0268
        MOVR    R1,     R0                      ; D84D   0088
        ADD@    R4,     R0                      ; D84E   02E0
        MVO@    R0,     R5                      ; D84F   0268
        PULR    R7                              ; D850   02B7

        DECLE   $0280,  $0168,  $0010,  $0240   ; D851   0280 0168 0010 0240
        DECLE   $0168,  $03B8,  $00FF,  $0204   ; D855   0168 03B8 00FF 0204
        DECLE   $0071,  $03B8,  $003F,  $0378   ; D859   0071 03B8 003F 0378
        DECLE   $0020,  $0204,  $002D,  $0078   ; D85D   0020 0204 002D 0078
        DECLE   $0209,  $0052                   ; D861   0209 0052

        ANDI    #$0003, R0                      ; D863   03B8 0003
        SLL     R0,     2                       ; D865   004C
        SLL     R0,     2                       ; D866   004C
        ADDR    R7,     R0                      ; D867   00F8
        ADDI    #$00D0, R0                      ; D868   02F8 00D0
        MOVR    R0,     R4                      ; D86A   0084
        SDBD                                    ; D86B   0001
        MVII    #$3980, R1                      ; D86C   02B9 0080 0039

        JSR     R5,     L_5AD0                  ; D86F   0004 0158 02D0
        JSR     R5,     L_5AD0                  ; D872   0004 0158 02D0
        DECLE   $02B8,  $0248,  $0240,  $0000   ; D875   02B8 0248 0240 0000
        DECLE   $02F8,  $0048,  $0240,  $0001   ; D879   02F8 0048 0240 0001
        DECLE   $0001,  $02B8,  $0086,  $0009   ; D87D   0001 02B8 0086 0009
        DECLE   $0240,  $0010,  $0240,  $0011   ; D881   0240 0010 0240 0011
        DECLE   $0001,  $02B8,  $0090,  $0009   ; D885   0001 02B8 0090 0009
        DECLE   $0240,  $0012,  $0200,  $0028   ; D889   0240 0012 0200 0028

        MVI     G_0168, R1                      ; D88D   0281 0168
        SLR     R1,     2                       ; D88F   0065
        SLR     R1,     2                       ; D890   0065
        SLR     R1,     2                       ; D891   0065
        MOVR    R1,     R5                      ; D892   008D
        ADDR    R5,     R5                      ; D893   00ED
        SDBD                                    ; D894   0001
        ADDI    #$9978, R5                      ; D895   02FD 0078 0099
        MVI@    R5,     R0                      ; D898   02A8
        MVO     R0,     .STIC.X.2               ; D899   0240 0002
        MVI@    R5,     R0                      ; D89B   02A8
        CLRR    R5                              ; D89C   01ED
        MVO     R0,     .STIC.Y.2               ; D89D   0240 000A
        SLL     R1,     2                       ; D89F   004D
        SLL     R1,     2                       ; D8A0   004D
        SDBD                                    ; D8A1   0001
        ADDI    #$9980, R1                      ; D8A2   02F9 0080 0099
        MOVR    R1,     R4                      ; D8A5   008C
        ADDR    R5,     R4                      ; D8A6   00EC
        SDBD                                    ; D8A7   0001
        MVII    #$3990, R1                      ; D8A8   02B9 0090 0039

        JSR     R5,     L_5AD0                  ; D8AB   0004 0158 02D0
        JSR     R5,     L_5AD0                  ; D8AE   0004 0158 02D0
        DECLE   $02BD,  $0033,  $0245,  $01EE   ; D8B1   02BD 0033 0245 01EE
        DECLE   $0004,  $0194,  $03D0,  $0004   ; D8B5   0004 0194 03D0 0004
        DECLE   $019C,  $0101,  $0280,  $01D6   ; D8B9   019C 0101 0280 01D6
        DECLE   $0008,  $0240,  $01D6,  $0004   ; D8BD   0008 0240 01D6 0004

        ANDR    R5,     R4                      ; D8C1   01AC
        ADD@    R4,     R3                      ; D8C2   02E3

        JSR     R5,     X_PLAY_NOTE             ; D8C3   0004 0118 02BD
        JSR     R5,     L_6DB7                  ; D8C6   0004 016C 01B7

        SETC                                    ; D8C9   0007
        PULR    R7                              ; D8CA   02B7

        DECLE   $0004                           ; D8CB   0004

        ANDR    R2,     R0                      ; D8CC   0190
        RSWD    R4                              ; D8CD   003C
        DECR    R4                              ; D8CE   0014
        PULR    R7                              ; D8CF   02B7

        DECLE   $001C,  $001C,  $001C,  $001C   ; D8D0   001C 001C 001C 001C
        DECLE   $001C,  $001C,  $001C,  $001C   ; D8D4   001C 001C 001C 001C
        DECLE   $001C,  $003E,  $001C,  $0008   ; D8D8   001C 003E 001C 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; D8DC   0000 0000 0000 0000
        DECLE   $001C,  $001C,  $001C,  $001C   ; D8E0   001C 001C 001C 001C
        DECLE   $001C,  $003E,  $001C,  $0008   ; D8E4   001C 003E 001C 0008
        DECLE   $001C,  $001C,  $001C,  $003E   ; D8E8   001C 001C 001C 003E
        DECLE   $001C,  $0048,  $0078,  $0040   ; D8EC   001C 0048 0078 0040
        DECLE   $001C,  $001C,  $001C,  $003E   ; D8F0   001C 001C 001C 003E
        DECLE   $001C,  $0009,  $000F,  $0001   ; D8F4   001C 0009 000F 0001
        DECLE   $0000,  $0000,  $0000,  $00FF   ; D8F8   0000 0000 0000 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D8FC   00FF 00FF 00FF 00FF
        DECLE   $0000,  $001F,  $001F,  $001F   ; D900   0000 001F 001F 001F
        DECLE   $001F,  $001F,  $001F,  $0000   ; D904   001F 001F 001F 0000
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; D908   0000 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; D90C   00FF 00FF 00FF 0000
        DECLE   $0000,  $00F8,  $00F8,  $00F8   ; D910   0000 00F8 00F8 00F8
        DECLE   $00F8,  $00F8,  $00F8,  $0000   ; D914   00F8 00F8 00F8 0000
        DECLE   $0007,  $0007,  $0007,  $0007   ; D918   0007 0007 0007 0007
        DECLE   $0007,  $0007,  $0007,  $0000   ; D91C   0007 0007 0007 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D920   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; D924   00FF 00FF 00FF 0000
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; D928   00E0 00E0 00E0 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $0000   ; D92C   00E0 00E0 00E0 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D930   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D934   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0010,  $0020   ; D938   0000 0000 0010 0020
        DECLE   $0008,  $001C,  $0036,  $0022   ; D93C   0008 001C 0036 0022
        DECLE   $0042,  $0066,  $002C,  $0038   ; D940   0042 0066 002C 0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; D944   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $000C   ; D948   0000 0000 0004 000C
        DECLE   $0014,  $002C,  $0068,  $0048   ; D94C   0014 002C 0068 0048
        DECLE   $0050,  $0050,  $0038,  $0018   ; D950   0050 0050 0038 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; D954   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0020   ; D958   0000 0000 0000 0020
        DECLE   $0018,  $000C,  $0014,  $0024   ; D95C   0018 000C 0014 0024
        DECLE   $0024,  $002C,  $0018,  $0018   ; D960   0024 002C 0018 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; D964   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0000,  $0000   ; D968   0000 0010 0000 0000
        DECLE   $0010,  $0020,  $0018,  $002C   ; D96C   0010 0020 0018 002C
        DECLE   $0024,  $002C,  $0018,  $0018   ; D970   0024 002C 0018 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; D974   0000 0000 0000 0000
        DECLE   $0270,  $00B1,  $0268,  $00B8   ; D978   0270 00B1 0268 00B8
        DECLE   $0274,  $00BF,  $0260,  $00C8   ; D97C   0274 00BF 0260 00C8
        DECLE   $0000,  $0000,  $0000,  $0000   ; D980   0000 0000 0000 0000
        DECLE   $0008,  $001C,  $001C,  $001C   ; D984   0008 001C 001C 001C
        DECLE   $001C,  $000C,  $0000,  $001C   ; D988   001C 000C 0000 001C
        DECLE   $001C,  $0008,  $0000,  $0000   ; D98C   001C 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0030   ; D990   0000 0000 0000 0030
        DECLE   $0038,  $0078,  $0078,  $0078   ; D994   0038 0078 0078 0078
        DECLE   $0070,  $0030,  $0000,  $0048   ; D998   0070 0030 0000 0048
        DECLE   $0078,  $0030,  $0000,  $0000   ; D99C   0078 0030 0000 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; D9A0   0000 0000 0018 003C
        DECLE   $003E,  $003E,  $003E,  $001E   ; D9A4   003E 003E 003E 001E
        DECLE   $001E,  $001C,  $000C,  $0000   ; D9A8   001E 001C 000C 0000
        DECLE   $0012,  $001E,  $001E,  $000C   ; D9AC   0012 001E 001E 000C
        DECLE   $0008,  $001C,  $003E,  $003E   ; D9B0   0008 001C 003E 003E
        DECLE   $003E,  $003E,  $003E,  $003C   ; D9B4   003E 003E 003E 003C
        DECLE   $0018,  $0000,  $0024,  $003C   ; D9B8   0018 0000 0024 003C
        DECLE   $003C,  $003C,  $0018,  $0000   ; D9BC   003C 003C 0018 0000
        DECLE   $0004,  $01A4,  $0114,  $0003   ; D9C0   0004 01A4 0114 0003
        DECLE   $0275,  $0282,  $01CF,  $037A   ; D9C4   0275 0282 01CF 037A
        DECLE   $0032,  $020D,  $002E,  $037A   ; D9C8   0032 020D 002E 037A
        DECLE   $000A,  $0205,  $002A,  $02FA   ; D9CC   000A 0205 002A 02FA
        DECLE   $0189,  $0280,  $0187,  $007C   ; D9D0   0189 0280 0187 007C
        DECLE   $0209,  $0023,  $0290,  $03B8   ; D9D4   0209 0023 0290 03B8
        DECLE   $000F,  $0378,  $0008,  $0205   ; D9D8   000F 0378 0008 0205
        DECLE   $001C,  $0378,  $000B,  $0206   ; D9DC   001C 0378 000B 0206
        DECLE   $0031,  $0004                   ; D9E0   0031 0004

        MOVR    R3,     R0                      ; D9E2   0098
        XORR    R5,     R1                      ; D9E3   01E9

        JSRE    R4,     .EXEC.400               ; D9E4   0004 0015 0000
        DECLE   $0002,  $0016,  $02A3,  $02B8   ; D9E7   0002 0016 02A3 02B8
        DECLE   $0008,  $02E2,  $033A,  $000B   ; D9EB   0008 02E2 033A 000B
        DECLE   $0295,  $03BD,  $000F,  $0168   ; D9EF   0295 03BD 000F 0168
        DECLE   $0204,  $001D,  $0008,  $0013   ; D9F3   0204 001D 0008 0013
        DECLE   $022C,  $000C,  $0285,  $01D9   ; D9F7   022C 000C 0285 01D9
        DECLE   $03BD,  $00F0,  $020C,  $0036   ; D9FB   03BD 00F0 020C 0036
        DECLE   $0004                           ; D9FF   0004

        ANDR    R2,     R0                      ; DA00   0190
        ADCR    R2                              ; DA01   002A
        SLLC    R1,     1                       ; DA02   0059
        BNC     L_DA35                          ; DA03   0209 0030

L_DA05:
        MVI     .BTAB.7C,R0                     ; DA05   0280 027C
        DECLE   $0380,  $0318,  $0240,  $027C   ; DA07   0380 0318 0240 027C
        DECLE   $0240,  $01DA,  $0004           ; DA0B   0240 01DA 0004

        ANDR    R2,     R0                      ; DA0E   0190
        RSWD    R4                              ; DA0F   003C
        SLLC    R1,     1                       ; DA10   0059
        PULR    R7                              ; DA11   02B7

        DECLE   $0285,  $01D9,  $03BD,  $00F0   ; DA12   0285 01D9 03BD 00F0
        DECLE   $020C,  $001D,  $03B8,  $0003   ; DA16   020C 001D 03B8 0003
        DECLE   $004C,  $0240,  $01D9,  $033A   ; DA1A   004C 0240 01D9 033A
        DECLE   $0189,  $0242,  $01DA,  $0004   ; DA1E   0189 0242 01DA 0004
        DECLE   $0190,  $002A,  $0059,  $0201   ; DA22   0190 002A 0059 0201
        DECLE   $000E,  $0280,  $027C,  $0380   ; DA26   000E 0280 027C 0380
        DECLE   $0318,  $0001,  $02F8,  $00F8   ; DA2A   0318 0001 02F8 00F8
        DECLE   $0018,  $0240,  $027C,  $0004   ; DA2E   0018 0240 027C 0004

        ANDR    R2,     R0                      ; DA32   0190
        SWAP    R1,     1                       ; DA33   0041
        SLLC    R1,     1                       ; DA34   0059
L_DA35:
        PULR    R7                              ; DA35   02B7

        PSHR    R5                              ; DA36   0275
        MVI     G_01D9, R0                      ; DA37   0280 01D9
        MOVR    R0,     R1                      ; DA39   0081
        ANDI    #$0003, R0                      ; DA3A   03B8 0003
        BEQ     L_DA42                          ; DA3C   0204 0004

        DECR    R1                              ; DA3E   0011
        MVO     R1,     G_01D9                  ; DA3F   0241 01D9
        PULR    R7                              ; DA41   02B7

L_DA42:
        MOVR    R1,     R2                      ; DA42   008A
        ANDI    #$00F0, R1                      ; DA43   03B9 00F0
        SUBI    #$0010, R1                      ; DA45   0339 0010
        BEQ     L_DA52                          ; DA47   0204 0009

        SUBI    #$000F, R2                      ; DA49   033A 000F
        MVO     R2,     G_01D9                  ; DA4B   0242 01D9

        JSR     R5,     L_5B42                  ; DA4D   0004 0158 0342
        DECLE   $0007                           ; DA50   0007

        PULR    R7                              ; DA51   02B7

L_DA52:
        SUBI    #$0010, R2                      ; DA52   033A 0010
        MVO     R2,     G_01D9                  ; DA54   0242 01D9
        MVI     G_01DA, R1                      ; DA56   0281 01DA
        ADDI    #$0189, R1                      ; DA58   02F9 0189
        MVII    #$000E, R0                      ; DA5A   02B8 000E
        MVO@    R0,     R1                      ; DA5C   0248
        MVI     G_0187, R1                      ; DA5D   0281 0187
        ANDI    #$000E, R1                      ; DA5F   03B9 000E
        MVO     R1,     G_0187                  ; DA61   0241 0187
        MVI     G_01DA, R1                      ; DA63   0281 01DA
        MVII    #$000A, R2                      ; DA65   02BA 000A

        JSR     R5,     X_DIV                   ; DA67   0004 011C 01FB

        SLL     R0,     2                       ; DA6A   004C
        ADDR    R0,     R1                      ; DA6B   00C1
        SLL     R0,     2                       ; DA6C   004C
        ADDR    R0,     R1                      ; DA6D   00C1
        ADDI    #$0230, R1                      ; DA6E   02F9 0230
        MVI@    R1,     R0                      ; DA70   0288
        AND     G_0318, R0                      ; DA71   0380 0318
        MVO@    R0,     R1                      ; DA73   0248
        MVI     G_01CF, R2                      ; DA74   0282 01CF
        ADDI    #$0189, R2                      ; DA76   02FA 0189

        JSR     R5,     L_62C7                  ; DA78   0004 0160 02C7
        JSR     R5,     L_61DB                  ; DA7B   0004 0160 01DB
        DECLE   $0004                           ; DA7E   0004

        ANDR    R2,     R0                      ; DA7F   0190
        RSWD    R4                              ; DA80   003C
        INCR    R2                              ; DA81   000A
        B       L_DA05                          ; DA82   0220 007E

        MVI     G_0181, R3                      ; DA84   0283 0181
        ANDI    #$000F, R3                      ; DA86   03BB 000F
        SLL     R3,     2                       ; DA88   004F
        ADDR    R7,     R3                      ; DA89   00FB
        ADDI    #$01B5, R3                      ; DA8A   02FB 01B5
        MOVR    R5,     R7                      ; DA8C   00AF

        DECLE   $0275,  $0083,  $0004,  $0190   ; DA8D   0275 0083 0004 0190
        DECLE   $002A,  $000B,  $0201,  $0071   ; DA91   002A 000B 0201 0071
        DECLE   $0004                           ; DA95   0004

        ANDR    R2,     R0                      ; DA96   0190
        ADCR    R2                              ; DA97   002A
        INCR    R5                              ; DA98   000D
        BC      L_DB06                          ; DA99   0201 006B

        MOVR    R3,     R0                      ; DA9B   0098
        CMPI    #$0008, R0                      ; DA9C   0378 0008
        BGT     L_DB06                          ; DA9E   020E 0066

        SLL     R3,     2                       ; DAA0   004F
        ADDR    R7,     R3                      ; DAA1   00FB
        ADDI    #$019D, R3                      ; DAA2   02FB 019D
        MVI@    R3,     R1                      ; DAA4   0299
        SWAP    R1,     1                       ; DAA5   0041
        ANDI    #$0003, R1                      ; DAA6   03B9 0003
        MVI     G_0176, R2                      ; DAA8   0282 0176
        DECR    R2                              ; DAAA   0012
        BMI     L_DB06                          ; DAAB   020B 0059

        SARC    R2,     1                       ; DAAD   007A
        ADCR    R7                              ; DAAE   002F

        SLR     R1,     1                       ; DAAF   0061
L_DAB0:
        SARC    R1,     1                       ; DAB0   0079
        BNC     L_DB06                          ; DAB1   0209 0053

        MVI     G_0176, R2                      ; DAB3   0282 0176
        SUBI    #$0002, R2                      ; DAB5   033A 0002
        ANDI    #$0003, R2                      ; DAB7   03BA 0003
        SLL     R2,     2                       ; DAB9   004E
        SLL     R2,     2                       ; DABA   004E
        SLL     R2,     2                       ; DABB   004E
        ADDR    R2,     R0                      ; DABC   00D0
        MVI@    R3,     R1                      ; DABD   0299
        ANDI    #$00C0, R1                      ; DABE   03B9 00C0
        SLR     R1,     2                       ; DAC0   0065
        ADDR    R1,     R0                      ; DAC1   00C8
        MVO     R0,     G_0181                  ; DAC2   0240 0181
        INCR    R3                              ; DAC4   000B
        MVI@    R3,     R0                      ; DAC5   0298
        ANDI    #$001F, R0                      ; DAC6   03B8 001F
        MVO     R0,     G_0172                  ; DAC8   0240 0172

        JSR     R5,     L_5B48                  ; DACA   0004 0158 0348
        DECLE   $0002                           ; DACD   0002

        MVI     G_0346, R5                      ; DACE   0285 0346
        MVI     G_034E, R1                      ; DAD0   0281 034E
        MOVR    R1,     R0                      ; DAD2   0088
        SWAP    R0,     1                       ; DAD3   0040
        ANDI    #$0004, R0                      ; DAD4   03B8 0004
        SUBI    #$0002, R0                      ; DAD6   0338 0002
        NEGR    R0                              ; DAD8   0020
        ADDR    R5,     R0                      ; DAD9   00E8
        ANDI    #$007F, R1                      ; DADA   03B9 007F
        CLRR    R4                              ; DADC   01E4
        MVI     G_0181, R2                      ; DADD   0282 0181
        SLR     R2,     2                       ; DADF   0066
        SLR     R2,     2                       ; DAE0   0066
        SLR     R2,     2                       ; DAE1   0066
        SDBD                                    ; DAE2   0001
        MVII    #$0400, R5                      ; DAE3   02BD 0000 0004
        SARC    R2,     2                       ; DAE6   007E
        BNOV    L_DAED                          ; DAE7   020A 0004
        BNC     L_DAEC                          ; DAE9   0209 0001

        ADDR    R5,     R5                      ; DAEB   00ED
L_DAEC:
        XORR    R5,     R1                      ; DAEC   01E9
L_DAED:
        SDBD                                    ; DAED   0001
        DECLE   $02BA,  $0097,  $0009,  $02FB   ; DAEE   02BA 0097 0009 02FB
        DECLE   $0002,  $029B,  $004F,  $03BB   ; DAF2   0002 029B 004F 03BB
        DECLE   $0180,  $01D9,  $0240,  $034A   ; DAF6   0180 01D9 0240 034A
        DECLE   $0241,  $0352,  $0242,  $035A   ; DAFA   0241 0352 0242 035A
        DECLE   $0004                           ; DAFE   0004

        ANDR    R2,     R0                      ; DAFF   0190
        SWAP    R1,     1                       ; DB00   0041
        INCR    R3                              ; DB01   000B
        MVII    #$0009, R0                      ; DB02   02B8 0009
        MVO     R0,     G_01EE                  ; DB04   0240 01EE
L_DB06:
        PULR    R7                              ; DB06   02B7

        DECLE   $0275,  $0004,  $0198,  $0284   ; DB07   0275 0004 0198 0284
        DECLE   $009C,  $000C,  $0281,  $01DC   ; DB0B   009C 000C 0281 01DC
        DECLE   $03B9,  $0098,  $0204,  $0017   ; DB0F   03B9 0098 0204 0017
        DECLE   $0004,  $0190,  $003C,  $000B   ; DB13   0004 0190 003C 000B
        DECLE   $0281,  $01DC,  $02A0,  $03B8   ; DB17   0281 01DC 02A0 03B8
        DECLE   $0200,  $020C,  $005D,  $03B9   ; DB1B   0200 020C 005D 03B9
        DECLE   $0018,  $0204,  $0004,  $02A0   ; DB1F   0018 0204 0004 02A0
        DECLE   $0004,  $019C,  $0000           ; DB23   0004 019C 0000

        CLRR    R0                              ; DB26   01C0
        MVO     R0,     G_034A                  ; DB27   0240 034A
        PULR    R7                              ; DB29   02B7

        MVII    #$0172, R3                      ; DB2A   02BB 0172
        MVII    #$0002, R0                      ; DB2C   02B8 0002

        JSR     R5,     L_55E5                  ; DB2E   0004 0154 01E5
        DECLE   $0014,  $0281,  $0181,  $0065   ; DB31   0014 0281 0181 0065
        DECLE   $0065,  $008A,  $03BA,  $0003   ; DB35   0065 008A 03BA 0003
        DECLE   $000A,  $007A,  $0209,  $0005   ; DB39   000A 007A 0209 0005
        DECLE   $0004                           ; DB3D   0004

        ANDR    R2,     R0                      ; DB3E   0190
        SWAP    R3,     2                       ; DB3F   0047
        COMR    R6                              ; DB40   001E
        ADCR    R2                              ; DB41   002A
        SLR     R1,     2                       ; DB42   0065
        MOVR    R1,     R3                      ; DB43   008B
        MOVR    R2,     R0                      ; DB44   0090
        MVII    #$034A, R2                      ; DB45   02BA 034A
        SARC    R1,     1                       ; DB47   0079
        BNC     L_DB4C                          ; DB48   0209 0002

        ADDI    #$0008, R2                      ; DB4A   02FA 0008
L_DB4C:
        SARC    R1,     1                       ; DB4C   0079
        BNC     L_DB50                          ; DB4D   0209 0001

        NEGR    R0                              ; DB4F   0020
L_DB50:
        ADD@    R2,     R0                      ; DB50   02D0
        MVO@    R0,     R2                      ; DB51   0250
        MVI     G_034A, R0                      ; DB52   0280 034A
        ANDI    #$00FF, R0                      ; DB54   03B8 00FF
        ADDI    #$0004, R0                      ; DB56   02F8 0004
        SLR     R0,     2                       ; DB58   0064
        SLR     R0,     1                       ; DB59   0060
        MVI     G_0352, R1                      ; DB5A   0281 0352
        ANDI    #$007F, R1                      ; DB5C   03B9 007F
        ADDI    #$0004, R1                      ; DB5E   02F9 0004
        SLR     R1,     2                       ; DB60   0065
        SLR     R1,     1                       ; DB61   0061
        SUBI    #$0003, R1                      ; DB62   0339 0003
        SUBI    #$0009, R0                      ; DB64   0338 0009
        MOVR    R1,     R2                      ; DB66   008A
        SLL     R1,     2                       ; DB67   004D
        ADDR    R1,     R2                      ; DB68   00CA
        ADDR    R2,     R2                      ; DB69   00D2
        ADDR    R0,     R2                      ; DB6A   00C2
        ADDI    #$0189, R2                      ; DB6B   02FA 0189
        MOVR    R3,     R0                      ; DB6D   0098
        DECR    R0                              ; DB6E   0010
        ANDI    #$0003, R0                      ; DB6F   03B8 0003

        JSR     R5,     L_607C                  ; DB71   0004 0160 007C
        JSR     R5,     X_POW2                  ; DB74   0004 0114 0345
        DECLE   $0188,  $022C,  $0066           ; DB77   0188 022C 0066

        PULR    R7                              ; DB7A   02B7

        MVII    #$0020, R0                      ; DB7B   02B8 0020
        MVO     R0,     G_0172                  ; DB7D   0240 0172

        JSR     R5,     L_5B48                  ; DB7F   0004 0158 0348
        DECLE   $0002                           ; DB82   0002

        MVI     G_034A, R0                      ; DB83   0280 034A
        MVI     G_0352, R1                      ; DB85   0281 0352
        MVI     G_0181, R2                      ; DB87   0282 0181
        MOVR    R2,     R3                      ; DB89   0093
        ANDI    #$0008, R3                      ; DB8A   03BB 0008
        SLR     R3,     1                       ; DB8C   0063
        SLR     R2,     2                       ; DB8D   0066
        SLR     R2,     2                       ; DB8E   0066
        SLR     R2,     2                       ; DB8F   0066
        MVII    #$0002, R4                      ; DB90   02BC 0002
        SARC    R2,     2                       ; DB92   007E
        BOV     L_DB99                          ; DB93   0202 0004

        SDBD                                    ; DB95   0001
        MVII    #$FFF6, R4                      ; DB96   02BC 00F6 00FF
L_DB99:
        BNC     L_DB9F                          ; DB99   0209 0004

        ADDR    R4,     R1                      ; DB9B   00E1
        SUBR    R3,     R0                      ; DB9C   0118
        B       L_DBA1                          ; DB9D   0200 0002

L_DB9F:
        ADDR    R4,     R0                      ; DB9F   00E0
        SUBR    R3,     R1                      ; DBA0   0119
L_DBA1:
        SDBD                                    ; DBA1   0001
        DECLE   $03B9,  $007F,  $000C,  $0004   ; DBA2   03B9 007F 000C 0004
        DECLE   $0198,  $0284,  $02FB,  $0003   ; DBA6   0198 0284 02FB 0003
        DECLE   $029A,  $004E,  $0001,  $03BA   ; DBAA   029A 004E 0001 03BA
        DECLE   $0000,  $0004,  $00D0,  $029A   ; DBAE   0000 0004 00D0 029A
        DECLE   $004E,  $03BA,  $0280,  $01D1   ; DBB2   004E 03BA 0280 01D1
        DECLE   $0240,  $034A,  $0241,  $0352   ; DBB6   0240 034A 0241 0352
        DECLE   $0004                           ; DBBA   0004

        ANDR    R2,     R0                      ; DBBB   0190
        SWAP    R1,     1                       ; DBBC   0041
        INCR    R5                              ; DBBD   000D
        MVI     G_0181, R0                      ; DBBE   0280 0181
        ANDI    #$000F, R0                      ; DBC0   03B8 000F
        ADDI    #$0060, R0                      ; DBC2   02F8 0060
        MVO     R0,     G_0181                  ; DBC4   0240 0181
        MVII    #$000C, R0                      ; DBC6   02B8 000C
        MVO     R0,     G_01EE                  ; DBC8   0240 01EE
        PULR    R7                              ; DBCA   02B7

        DECLE   $0275,  $0283,  $0181,  $033B   ; DBCB   0275 0283 0181 033B
        DECLE   $0010,  $020B,  $0003           ; DBCF   0010 020B 0003

        MVO     R3,     G_0181                  ; DBD2   0243 0181
        PULR    R7                              ; DBD4   02B7

        DECLE   $0004                           ; DBD5   0004

        ANDR    R3,     R0                      ; DBD6   0198
        MVI     G_02FB, R4                      ; DBD7   0284 02FB
        EIS                                     ; DBD9   0002
        MVI@    R3,     R0                      ; DBDA   0298
L_DBDB:
        MVI     G_01DC, R1                      ; DBDB   0281 01DC
        DECLE   $03B9,  $0018,  $0204,  $0003   ; DBDD   03B9 0018 0204 0003
        DECLE   $0004,  $019C,  $0000,  $0281   ; DBE1   0004 019C 0000 0281
        DECLE   $01DC,  $03B9,  $0002,  $0204   ; DBE5   01DC 03B9 0002 0204
        DECLE   $000E,  $0004,  $0190,  $002A   ; DBE9   000E 0004 0190 002A
        DECLE   $007F,  $0201,  $0008,  $02B8   ; DBED   007F 0201 0008 02B8
        DECLE   $0065,  $0004,  $01A0,  $02FD   ; DBF1   0065 0004 01A0 02FD
        DECLE   $0004,  $01A4,  $00EA,  $0004   ; DBF5   0004 01A4 00EA 0004

        ANDR    R2,     R0                      ; DBF9   0190
        RSWD    R4                              ; DBFA   003C
        INCR    R5                              ; DBFB   000D
        CLRR    R0                              ; DBFC   01C0
        MVO     R0,     G_034A                  ; DBFD   0240 034A
        PULR    R7                              ; DBFF   02B7

        DECLE   $0275,  $0004                   ; DC00   0275 0004

        ANDR    R4,     R0                      ; DC02   01A0
        ADDI    #$0004, R5                      ; DC03   02FD 0004
        ANDR    R4,     R4                      ; DC05   01A4
        MOVR    R1,     R7                      ; DC06   008F

        DECLE   $022C,  $0102,  $0240,  $017A   ; DC07   022C 0102 0240 017A
        DECLE   $0004                           ; DC0B   0004

        ANDR    R4,     R4                      ; DC0C   01A4
        MOVR    R6,     R5                      ; DC0D   00B5
        SDBD                                    ; DC0E   0001
        MVII    #$F728, R5                      ; DC0F   02BD 0028 00F7
        MVO     R5,     G_035C                  ; DC12   0245 035C
        ADDI    #$0003, R5                      ; DC14   02FD 0003
        MVI@    R5,     R1                      ; DC16   02A9
        MVI@    R5,     R2                      ; DC17   02AA
        ANDI    #$001F, R1                      ; DC18   03B9 001F
        ANDI    #$001F, R2                      ; DC1A   03BA 001F
        SDBD                                    ; DC1C   0001
        ADDI    #$6C79, R1                      ; DC1D   02F9 0079 006C
        SDBD                                    ; DC20   0001
        ADDI    #$6C79, R2                      ; DC21   02FA 0079 006C
        MVI@    R1,     R0                      ; DC24   0288
        ANDI    #$000F, R0                      ; DC25   03B8 000F
        MVI@    R2,     R1                      ; DC27   0291
        ANDI    #$000F, R1                      ; DC28   03B9 000F
        SLL     R1,     2                       ; DC2A   004D
        SLL     R1,     2                       ; DC2B   004D
        ADDR    R1,     R0                      ; DC2C   00C8
        MVO     R0,     G_017F                  ; DC2D   0240 017F
        MVII    #$0001, R0                      ; DC2F   02B8 0001
        MVO     R0,     G_0170                  ; DC31   0240 0170
        MVII    #$004D, R0                      ; DC33   02B8 004D
        MVO     R0,     G_01D1                  ; DC35   0240 01D1

        JSR     R5,     L_698B                  ; DC37   0004 0168 018B
        JSR     R5,     L_5B48                  ; DC3A   0004 0158 0348
        DECLE   $0004                           ; DC3D   0004

        PULR    R7                              ; DC3E   02B7

        DECLE   $0286,  $0100,  $0026,  $0040   ; DC3F   0286 0100 0026 0040
        DECLE   $0185,  $0100,  $0026,  $0001   ; DC43   0185 0100 0026 0001
        DECLE   $0247,  $0100,  $0028,  $0022   ; DC47   0247 0100 0028 0022
        DECLE   $0144,  $0100,  $0028,  $0003   ; DC4B   0144 0100 0028 0003
        DECLE   $02C2,  $0320,  $00C6,  $00D5   ; DC4F   02C2 0320 00C6 00D5
        DECLE   $01C0,  $0320,  $00C6,  $0116   ; DC53   01C0 0320 00C6 0116
        DECLE   $0349,  $0066,  $0028,  $0000   ; DC57   0349 0066 0028 0000
        DECLE   $038D,  $0066,  $0026,  $0000   ; DC5B   038D 0066 0026 0000

        XOR@    R2,     R1                      ; DC5F   03D1
        B       L_DBDB                          ; DC60   0220 0086

        DECLE   $0180,  $0000,  $0000,  $0000   ; DC62   0180 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC66   0000 0000 0000 0000
        DECLE   $000F,  $0000,  $0000,  $0000   ; DC6A   000F 0000 0000 0000
        DECLE   $00F0,  $0030,  $003C,  $000C   ; DC6E   00F0 0030 003C 000C
        DECLE   $000F,  $0000,  $0000,  $0000   ; DC72   000F 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; DC76   0000 0000 0000 0008
        DECLE   $0008,  $0008,  $0008,  $0018   ; DC7A   0008 0008 0008 0018
        DECLE   $0018,  $0030,  $0030,  $0020   ; DC7E   0018 0030 0030 0020
        DECLE   $0020,  $0000,  $0000,  $0000   ; DC82   0020 0000 0000 0000
        DECLE   $0000,  $0000,  $0006,  $00FF   ; DC86   0000 0000 0006 00FF
        DECLE   $0006,  $0000,  $0000,  $0000   ; DC8A   0006 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC8E   0000 0000 0000 0000
        DECLE   $001C,  $0000,  $0000,  $0000   ; DC92   001C 0000 0000 0000
        DECLE   $0008,  $0008,  $0000,  $0000   ; DC96   0008 0008 0000 0000
        DECLE   $0000,  $0008,  $0008,  $0008   ; DC9A   0000 0008 0008 0008
        DECLE   $0008,  $0008,  $0008,  $0008   ; DC9E   0008 0008 0008 0008
        DECLE   $0008,  $0008,  $0008,  $0008   ; DCA2   0008 0008 0008 0008
        DECLE   $001C,  $001C,  $001C,  $0008   ; DCA6   001C 001C 001C 0008
        DECLE   $0008,  $0000,  $0018,  $001C   ; DCAA   0008 0000 0018 001C
        DECLE   $000E,  $0016,  $0020,  $0040   ; DCAE   000E 0016 0020 0040
        DECLE   $0000,  $0000,  $0040,  $0020   ; DCB2   0000 0000 0040 0020
        DECLE   $0016,  $000E,  $001C,  $0018   ; DCB6   0016 000E 001C 0018
        DECLE   $0000,  $0000                   ; DCBA   0000 0000

        EIS                                     ; DCBC   0002

        JSR     R4,     L_6870                  ; DCBD   0004 0068 0070
        DECLE   $0038,  $0018,  $0000,  $0000   ; DCC0   0038 0018 0000 0000
        DECLE   $0018,  $0038,  $0070,  $0068   ; DCC4   0018 0038 0070 0068
        DECLE   $0004,  $0002,  $0000,  $0004   ; DCC8   0004 0002 0000 0004

        INCR    R2                              ; DCCC   000A
L_DCCD:
        DECR    R7                              ; DCCD   0017
        ADCR    R7                              ; DCCE   002F

        SWAP    R2,     2                       ; DCCF   0046
L_DCD0:
        TSTR    R0                              ; DCD0   0080
        DECLE   $0000,  $0000,  $0020,  $0010   ; DCD1   0000 0000 0020 0010
        DECLE   $0008,  $0004,  $000A,  $001D   ; DCD5   0008 0004 000A 001D
        DECLE   $001E,  $000C,  $0000,  $0000   ; DCD9   001E 000C 0000 0000
        DECLE   $0001,  $0062,  $00F4,  $00E8   ; DCDD   0001 0062 00F4 00E8
        DECLE   $0050,  $0020,  $0030,  $0078   ; DCE1   0050 0020 0030 0078
        DECLE   $00B8,  $0050,  $0020,  $0010   ; DCE5   00B8 0050 0020 0010
        DECLE   $0008,  $0004,  $0000,  $0000   ; DCE9   0008 0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; DCED   0000 0000 0000 0002
        DECLE   $0007,  $0002,  $0000,  $003C   ; DCF1   0007 0002 0000 003C
        DECLE   $007E,  $00FF,  $00FF,  $00FF   ; DCF5   007E 00FF 00FF 00FF

        SARC    R2,     2                       ; DCF9   007E
        RSWD    R4                              ; DCFA   003C
        PSHR    R4                              ; DCFB   0274
        MVII    #$0050, R4                      ; DCFC   02BC 0050
        MVO     R4,     G_01CB                  ; DCFE   0244 01CB
        PULR    R7                              ; DD00   02B7

        DECLE   $0275,  $0281,  $01FE,  $03C1   ; DD01   0275 0281 01FE 03C1
        DECLE   $01FF,  $0379,  $00A5,  $0204   ; DD05   01FF 0379 00A5 0204
        DECLE   $0011,  $0004,  $0190,  $002A   ; DD09   0011 0004 0190 002A
        DECLE   $0014,  $0201,  $00DA,  $02BC   ; DD0D   0014 0201 00DA 02BC
        DECLE   $01CA,  $00A5,  $0001,  $02A0   ; DD11   01CA 00A5 0001 02A0
        DECLE   $0010,  $0268,  $0040,  $0268   ; DD15   0010 0268 0040 0268
        DECLE   $020C,  $0025                   ; DD19   020C 0025

        MVII    #$0080, R0                      ; DD1B   02B8 0080
        MVO     R0,     G_0102                  ; DD1D   0240 0102
        MVII    #$01FB, R4                      ; DD1F   02BC 01FB
        MOVR    R4,     R5                      ; DD21   00A5
        CLRR    R3                              ; DD22   01DB
        MVI@    R4,     R0                      ; DD23   02A0
        MVO@    R3,     R5                      ; DD24   026B
        MVI@    R4,     R1                      ; DD25   02A1
        MVO@    R3,     R5                      ; DD26   026B
        MVI@    R4,     R2                      ; DD27   02A2
        MVO@    R3,     R5                      ; DD28   026B
        MVI     G_011E, R3                      ; DD29   0283 011E
        PSHR    R2                              ; DD2B   0272
        PSHR    R3                              ; DD2C   0273

        JSR     R5,     .EXEC.4C3               ; DD2D   0004 0114 00C3
        DECLE   $02B3,  $02B2,  $0243,  $011E   ; DD30   02B3 02B2 0243 011E
        DECLE   $0004,  $009C,  $00FB,  $02BC   ; DD34   0004 009C 00FB 02BC
        DECLE   $01FB,  $0260,  $0261,  $0262   ; DD38   01FB 0260 0261 0262
        DECLE   $02B8,  $00A0,  $0240,  $0102   ; DD3C   02B8 00A0 0240 0102
        DECLE   $0004                           ; DD40   0004

        ANDR    R2,     R0                      ; DD41   0190
        ADCR    R2                              ; DD42   002A
        DECR    R4                              ; DD43   0014
        BC      L_DDEA                          ; DD44   0201 00A4

        MVI     .PSG0.rgt_hand,R1               ; DD46   0281 01FE
        XOR     .PSG0.lft_hand,R1               ; DD48   03C1 01FF
        MVII    #$01CD, R3                      ; DD4A   02BB 01CD
        CLRR    R0                              ; DD4C   01C0
        DECR    R0                              ; DD4D   0010
        CLRR    R2                              ; DD4E   01D2
        CMP@    R3,     R1                      ; DD4F   0359
        MVO@    R1,     R3                      ; DD50   0259
        BNEQ    L_DD61                          ; DD51   020C 000E

        MOVR    R1,     R3                      ; DD53   008B
        ANDI    #$001F, R3                      ; DD54   03BB 001F
        SLR     R1,     2                       ; DD56   0065
        SLR     R1,     2                       ; DD57   0065
        SLR     R1,     1                       ; DD58   0061
        ADDR    R7,     R1                      ; DD59   00F9
        ADDI    #$0010, R1                      ; DD5A   02F9 0010
        MVI@    R1,     R0                      ; DD5C   0288
        SUBI    #$0004, R0                      ; DD5D   0338 0004
        BGT     L_DD76                          ; DD5F   020E 0015

L_DD61:
        MVO     R2,     G_01CC                  ; DD61   0242 01CC
        DECLE   $0204,  $0026                   ; DD63   0204 0026

        INCR    R0                              ; DD65   0008
        BEQ     L_DD72                          ; DD66   0204 000A
        B       L_DDD1                          ; DD68   0200 0067

        DECLE   $0004,  $0002,  $0001,  $000B   ; DD6A   0004 0002 0001 000B
        DECLE   $0000,  $0005                   ; DD6E   0000 0005

        DECR    R1                              ; DD70   0011
        DIS                                     ; DD71   0003
L_DD72:
        CLRR    R0                              ; DD72   01C0
        MVO     R0,     G_01CE                  ; DD73   0240 01CE
        PULR    R7                              ; DD75   02B7

L_DD76:
        CMP     G_01CC, R0                      ; DD76   0340 01CC
        DECLE   $0240,  $01CC,  $0204,  $000F   ; DD78   0240 01CC 0204 000F
        DECLE   $0084,  $0004,  $0190,  $002A   ; DD7C   0084 0004 0190 002A
        DECLE   $0019,  $0201,  $0067,  $0273   ; DD80   0019 0201 0067 0273
        DECLE   $0004,  $019C,  $01EB,  $02B3   ; DD84   0004 019C 01EB 02B3
        DECLE   $0004,  $009C,  $00FB,  $0004   ; DD88   0004 009C 00FB 0004
        DECLE   $0190,  $002A,  $0019,  $0201   ; DD8C   0190 002A 0019 0201
        DECLE   $0059,  $02B9,  $0004,  $0004   ; DD90   0059 02B9 0004 0004
        DECLE   $019C,  $01A6,  $0018,  $0008   ; DD94   019C 01A6 0018 0008
        DECLE   $0009,  $0019,  $0011,  $0001   ; DD98   0009 0019 0011 0001
        DECLE   $0003,  $0013,  $0012,  $0002   ; DD9C   0003 0013 0012 0002
        DECLE   $0006,  $0016,  $0014,  $0004   ; DDA0   0006 0016 0014 0004

        INCR    R4                              ; DDA4   000C
        COMR    R4                              ; DDA5   001C
L_DDA6:
        MVII    #$0004, R2                      ; DDA6   02BA 0004
L_DDA8:
        CMP@    R5,     R3                      ; DDA8   036B
        DECLE   $0204,  $0008                   ; DDA9   0204 0008

        DECR    R2                              ; DDAB   0012
        BNEQ    L_DDA8                          ; DDAC   022C 0005

        DECR    R1                              ; DDAE   0011
        BNEQ    L_DDA6                          ; DDAF   022C 000A
        B       L_DDCE                          ; DDB1   0200 001B

        DECLE   $0004,  $009C,  $00FB,  $0004   ; DDB3   0004 009C 00FB 0004
        DECLE   $0190,  $002A,  $0056,  $0209   ; DDB7   0190 002A 0056 0209
        DECLE   $0012,  $0004                   ; DDBB   0012 0004

        ANDR    R2,     R0                      ; DDBD   0190
        ADCR    R2                              ; DDBE   002A
        MOVR    R0,     R7                      ; DDBF   0087
        BC      L_DDCE                          ; DDC0   0201 000C

        MVI     G_01D2, R2                      ; DDC2   0282 01D2
        TSTR    R2                              ; DDC4   0092
        BNEQ    L_DDD0                          ; DDC5   020C 0009

        MVII    #$0002, R0                      ; DDC7   02B8 0002

        JSR     R5,     X_RAND1                 ; DDC9   0004 0114 027D

        MOVR    R0,     R1                      ; DDCC   0081
        INCR    R1                              ; DDCD   0009
L_DDCE:
        MVO     R1,     G_01D2                  ; DDCE   0241 01D2
L_DDD0:
        PULR    R7                              ; DDD0   02B7

L_DDD1:
        MOVR    R3,     R5                      ; DDD1   009D
        DECLE   $03BB,  $000F,  $0224,  $0063   ; DDD2   03BB 000F 0224 0063
        DECLE   $01DD,  $022C,  $0066,  $02F8   ; DDD6   01DD 022C 0066 02F8
        DECLE   $0003,  $007B,  $0229,  $0004   ; DDDA   0003 007B 0229 0004
        DECLE   $022C,  $006D,  $0243,  $01D2   ; DDDE   022C 006D 0243 01D2
        DECLE   $0004                           ; DDE2   0004

        MOVR    R3,     R4                      ; DDE3   009C
        ADDR    R7,     R3                      ; DDE4   00FB
        INCR    R0                              ; DDE5   0008
        CMP     G_01CE, R0                      ; DDE6   0340 01CE
        MVO     R0,     G_01CE                  ; DDE8   0240 01CE
L_DDEA:
        PULR    R7                              ; DDEA   02B7

        DECLE   $0275,  $00FC,  $02FC,  $001C   ; DDEB   0275 00FC 02FC 001C
        DECLE   $00BB,  $02FB,  $002C,  $02BA   ; DDEF   00BB 02FB 002C 02BA
        DECLE   $0002,  $0001,  $02A1,  $0298   ; DDF3   0002 0001 02A1 0298
        DECLE   $0004                           ; DDF7   0004

        ANDR    R2,     R0                      ; DDF8   0190
        ADCR    R5                              ; DDF9   002D
        BNC     L_DE00                          ; DDFA   0209 0004

        TSTR    R1                              ; DDFC   0089
        BEQ     L_DDEA                          ; DDFD   0224 0014
        MOVR    R1,     R7                      ; DDFF   008F

L_DE00:
        INCR    R3                              ; DE00   000B
        DECLE   $0012,  $022C,  $000F,  $0001   ; DE01   0012 022C 000F 0001

        MVI@    R4,     R1                      ; DE05   02A1
        TSTR    R1                              ; DE06   0089
        BEQ     L_DDEA                          ; DE07   0224 001E
        MOVR    R1,     R7                      ; DE09   008F

        DECLE   $0060,  $0066,  $00D9,  $009E   ; DE0A   0060 0066 00D9 009E
        DECLE   $0064,  $0092,  $00CB,  $0066   ; DE0E   0064 0092 00CB 0066
        DECLE   $0083,  $0065,  $0083,  $0065   ; DE12   0083 0065 0083 0065
        DECLE   $007D,  $0067,  $0083,  $0065   ; DE16   007D 0067 0083 0065
        DECLE   $0083,  $0065,  $0015,  $0016   ; DE1A   0083 0065 0015 0016
        DECLE   $0275,  $0004,  $0190,  $0014   ; DE1E   0275 0004 0190 0014
        DECLE   $000A,  $002B,  $0000,  $020C   ; DE22   000A 002B 0000 020C
        DECLE   $007E,  $0281,  $01C9,  $0379   ; DE26   007E 0281 01C9 0379
        DECLE   $00FF,  $0204,  $0078,  $02F9   ; DE2A   00FF 0204 0078 02F9
        DECLE   $032C,  $0288,  $0080,  $020B   ; DE2E   032C 0288 0080 020B
        DECLE   $0072,  $0004                   ; DE32   0072 0004

        ANDR    R2,     R0                      ; DE34   0190
        ADCR    R2                              ; DE35   002A
        GSWD    R0                              ; DE36   0030
        BNC     L_DEA5                          ; DE37   0209 006C

        MVII    #$0174, R4                      ; DE39   02BC 0174
        MVII    #$0177, R5                      ; DE3B   02BD 0177
        MVII    #$0002, R0                      ; DE3D   02B8 0002
        MVI@    R4,     R1                      ; DE3F   02A1
        SUB@    R5,     R1                      ; DE40   0329
        BPL     L_DE44                          ; DE41   0203 0001

        NEGR    R1                              ; DE43   0021
L_DE44:
        CMPI    #$0006, R1                      ; DE44   0379 0006
        DECLE   $020D,  $005D,  $0010,  $022C   ; DE46   020D 005D 0010 022C
        DECLE   $000B,  $02B5,  $0004,  $0190   ; DE4A   000B 02B5 0004 0190
        DECLE   $003C,  $000B,  $01C9,  $02BC   ; DE4E   003C 000B 01C9 02BC
        DECLE   $0344,  $0261,  $0004           ; DE52   0344 0261 0004

        ANDR    R2,     R0                      ; DE55   0190
        ADCR    R2                              ; DE56   002A
        DECR    R5                              ; DE57   0015
        BNC     L_DE5D                          ; DE58   0209 0003

        INCR    R4                              ; DE5A   000C
        B       L_DE5F                          ; DE5B   0200 0002

L_DE5D:
        MVO     R1,     G_017D                  ; DE5D   0241 017D
L_DE5F:
        MVO@    R1,     R4                      ; DE5F   0261
        DECLE   $0261,  $0034,  $0261,  $0261   ; DE60   0261 0034 0261 0261
        DECLE   $0261,  $0034,  $0261,  $0261   ; DE64   0261 0034 0261 0261
        DECLE   $0004,  $019C,  $0363,  $0004   ; DE68   0004 019C 0363 0004
        DECLE   $019C,  $0355,  $0241,  $016F   ; DE6C   019C 0355 0241 016F
        DECLE   $0004,  $0190,  $0041,  $0016   ; DE70   0004 0190 0041 0016
        DECLE   $0004                           ; DE74   0004

        ANDR    R3,     R4                      ; DE75   019C
        MVI@    R4,     R6                      ; DE76   02A6

        JSR     R5,     L_5B48                  ; DE77   0004 0158 0348
        DECLE   $0000                           ; DE7A   0000

        MVII    #$0010, R0                      ; DE7B   02B8 0010
        MVI     G_01C9, R3                      ; DE7D   0283 01C9
        ADDI    #$032C, R3                      ; DE7F   02FB 032C
        MVI@    R3,     R1                      ; DE81   0299
        SDBD                                    ; DE82   0001
        ANDI    #$4000, R1                      ; DE83   03B9 0000 0040
        BEQ     L_DE89                          ; DE86   0204 0001

        ADDR    R0,     R0                      ; DE88   00C0
L_DE89:
        MVO     R0,     G_0161                  ; DE89   0240 0161

        JSR     R5,     L_507D                  ; DE8B   0004 0150 007D
        DECLE   $0160,  $0032,  $017E,  $00CC   ; DE8E   0160 0032 017E 00CC
        DECLE   $0000,  $0004,  $0194,  $0249   ; DE92   0000 0004 0194 0249
        DECLE   $0004,  $01A0,  $0068,  $0004   ; DE96   0004 01A0 0068 0004
        DECLE   $019C,  $02B1,  $0004,  $019C   ; DE9A   019C 02B1 0004 019C
        DECLE   $02A6,  $0004,  $01A0,  $018A   ; DE9E   02A6 0004 01A0 018A
        DECLE   $0004                           ; DEA2   0004

        ANDR    R3,     R4                      ; DEA3   019C
        MVI@    R4,     R6                      ; DEA4   02A6
L_DEA5:
        PULR    R7                              ; DEA5   02B7

        MVII    #$0001, R0                      ; DEA6   02B8 0001
        MVO     R0,     G_0102                  ; DEA8   0240 0102
L_DEAA:
        CMP     G_0102, R0                      ; DEAA   0340 0102
        BEQ     L_DEAA                          ; DEAC   0224 0003
        J       .EXEC.AAD                       ; DEAE   0004 0318 02AD

        DECLE   $0275,  $0001,  $02B9,  $00A6   ; DEB1   0275 0001 02B9 00A6
        DECLE   $0009,  $0282,  $0161,  $0066   ; DEB5   0009 0282 0161 0066
        DECLE   $0062,  $0094,  $02FA,  $026B   ; DEB9   0062 0094 02FA 026B
        DECLE   $0004                           ; DEBD   0004

        ANDR    R3,     R4                      ; DEBE   019C
        ADD@    R1,     R7                      ; DEBF   02CF

        DECLE   $02F9,  $0008,  $0004           ; DEC0   02F9 0008 0004

        ANDR    R3,     R4                      ; DEC3   019C
        ADD@    R1,     R7                      ; DEC4   02CF

        DECLE   $01C9,  $0004                   ; DEC5   01C9 0004

        ANDR    R3,     R4                      ; DEC7   019C
        ADD@    R1,     R7                      ; DEC8   02CF

        MOVR    R4,     R2                      ; DEC9   00A2
        BEQ     L_DEA5                          ; DECA   0224 0026

        ADDI    #$026A, R2                      ; DECC   02FA 026A
        INCR    R7                              ; DECE   000F

        PSHR    R5                              ; DECF   0275
L_DED0:
        MVI@    R2,     R0                      ; DED0   0290
        SDBD                                    ; DED1   0001
        ANDI    #$E000, R0                      ; DED2   03B8 0000 00E0
        ADDR    R1,     R0                      ; DED5   00C8
        MVO@    R0,     R2                      ; DED6   0250
        INCR    R2                              ; DED7   000A
        PULR    R7                              ; DED8   02B7

        DECLE   $0004,  $0190,  $002A,  $001C   ; DED9   0004 0190 002A 001C
        DECLE   $0229,  $0039,  $0004           ; DEDD   0229 0039 0004

        ANDR    R2,     R0                      ; DEE0   0190
        ADCR    R2                              ; DEE1   002A
        RLC     R3,     2                       ; DEE2   0057
        BC      L_DEA5                          ; DEE3   0221 003F

        MVII    #$0030, R0                      ; DEE5   02B8 0030
        CMP     G_016F, R0                      ; DEE7   0340 016F
        BLE     L_DEA5                          ; DEE9   0226 0045

        MVO     R0,     G_016F                  ; DEEB   0240 016F

        JSR     R5,     L_5B48                  ; DEED   0004 0158 0348
        DECLE   $0000,  $0280,  $0346,  $0281   ; DEF0   0000 0280 0346 0281
        DECLE   $034E,  $0338,  $0004,  $0339   ; DEF4   034E 0338 0004 0339
        DECLE   $0006,  $03F9,  $0180,  $0240   ; DEF8   0006 03F9 0180 0240
        DECLE   $0345,  $0241,  $034D,  $0004   ; DEFC   0345 0241 034D 0004

        ANDR    R2,     R0                      ; DF00   0190
        SWAP    R1,     1                       ; DF01   0041
        NEGR    R2                              ; DF02   0022
        PULR    R7                              ; DF03   02B7

        PSHR    R5                              ; DF04   0275

        JSR     R5,     L_5B42                  ; DF05   0004 0158 0342
        DECLE   $0009,  $0004                   ; DF08   0009 0004

        ANDR    R2,     R0                      ; DF0A   0190
        RSWD    R4                              ; DF0B   003C
        DECR    R6                              ; DF0C   0016

        JSR     R5,     L_544A                  ; DF0D   0004 0154 004A

        MVII    #$00C0, R0                      ; DF10   02B8 00C0
        MVO     R0,     G_016F                  ; DF12   0240 016F

        JSR     R5,     L_5B48                  ; DF14   0004 0158 0348
        DECLE   $0000,  $02BC,  $017D,  $01C0   ; DF17   0000 02BC 017D 01C0
        DECLE   $02B9,  $000C,  $0260,  $0261   ; DF1B   02B9 000C 0260 0261
        DECLE   $0260,  $0260,  $0004,  $0190   ; DF1F   0260 0260 0004 0190
        DECLE   $002A,  $0015,  $0209,  $000D   ; DF23   002A 0015 0209 000D
        DECLE   $0004,  $0190,  $003C,  $0027   ; DF27   0004 0190 003C 0027

        MVI     G_0345, R1                      ; DF2B   0281 0345
        MVI     G_034D, R2                      ; DF2D   0282 034D
        MVI     G_0355, R3                      ; DF2F   0283 0355
        PSHR    R1                              ; DF31   0271
        PSHR    R2                              ; DF32   0272
        PSHR    R3                              ; DF33   0273

        JSR     R5,     L_5E71                  ; DF34   0004 015C 0271
        DECLE   $0004                           ; DF37   0004

        ANDR    R2,     R0                      ; DF38   0190
        ADCR    R2                              ; DF39   002A
        DECR    R5                              ; DF3A   0015
        BNC     L_DF4A                          ; DF3B   0209 000D

        PULR    R3                              ; DF3D   02B3
        PULR    R2                              ; DF3E   02B2
        PULR    R1                              ; DF3F   02B1
        MVO     R1,     G_0345                  ; DF40   0241 0345
        MVO     R2,     G_034D                  ; DF42   0242 034D
        MVO     R3,     G_0355                  ; DF44   0243 0355
        MVII    #$0040, R1                      ; DF46   02B9 0040
        MVO     R1,     G_017D                  ; DF48   0241 017D

L_DF4A:
        JSR     R5,     L_5EF0                  ; DF4A   0004 015C 02F0
        DECLE   $0004                           ; DF4D   0004

        ANDR    R2,     R0                      ; DF4E   0190
        RSWD    R4                              ; DF4F   003C
        ADCR    R2                              ; DF50   002A

        JSR     R5,     L_5C0C                  ; DF51   0004 015C 000C

        PULR    R7                              ; DF54   02B7

        PSHR    R5                              ; DF55   0275
        MVII    #$0189, R4                      ; DF56   02BC 0189
        MOVR    R4,     R5                      ; DF58   00A5
        MVII    #$003C, R1                      ; DF59   02B9 003C
L_DF5B:
        MVI@    R4,     R0                      ; DF5B   02A0
        ANDI    #$000F, R0                      ; DF5C   03B8 000F
        MVO@    R0,     R5                      ; DF5E   0268
        DECR    R1                              ; DF5F   0011
        BNEQ    L_DF5B                          ; DF60   022C 0006
        PULR    R7                              ; DF62   02B7

        PSHR    R5                              ; DF63   0275

        JSR     R5,     L_5B42                  ; DF64   0004 0158 0342
        DECLE   $0008,  $0004                   ; DF67   0008 0004

        ANDR    R3,     R4                      ; DF69   019C
        XOR@    R2,     R5                      ; DF6A   03D5
        MVII    #$021B, R4                      ; DF6B   02BC 021B
        MOVR    R7,     R5                      ; DF6D   00BD
        ADDI    #$0023, R5                      ; DF6E   02FD 0023
L_DF70:
        MOVR    R4,     R3                      ; DF70   00A3
        MVI@    R5,     R2                      ; DF71   02AA
L_DF72:
        MVI@    R5,     R0                      ; DF72   02A8
        SLL     R0,     2                       ; DF73   004C
        SLL     R0,     1                       ; DF74   0048
        INCR    R0                              ; DF75   0008
        SDBD                                    ; DF76   0001
        CMPI    #$1000, R0                      ; DF77   0378 0000 0010
        BLT     L_DF7E                          ; DF7A   0205 0002

        ADDI    #$0002, R0                      ; DF7C   02F8 0002
L_DF7E:
        MVI@    R4,     R1                      ; DF7E   02A1
        SDBD                                    ; DF7F   0001
        ANDI    #$E000, R1                      ; DF80   03B9 0000 00E0
        ADDR    R1,     R0                      ; DF83   00C8
        DECR    R4                              ; DF84   0014
        MVO@    R0,     R4                      ; DF85   0260
        DECR    R2                              ; DF86   0012
        BNEQ    L_DF72                          ; DF87   022C 0016

        MOVR    R3,     R4                      ; DF89   009C
        ADDI    #$0014, R4                      ; DF8A   02FC 0014
        CMPI    #$0257, R4                      ; DF8C   037C 0257
        BNEQ    L_DF70                          ; DF8E   022C 001F
L_DF90:
        PULR    R7                              ; DF90   02B7

        DECLE   $000C,  $00F7,  $00DE,  $00DE   ; DF91   000C 00F7 00DE 00DE
        DECLE   $00E8,  $00DE,  $011A,  $00DE   ; DF95   00E8 00DE 011A 00DE
        DECLE   $0318,  $0318,  $0318,  $011B   ; DF99   0318 0318 0318 011B
        DECLE   $011C,  $0007,  $00DE,  $00DE   ; DF9D   011C 0007 00DE 00DE
        DECLE   $00F9,  $00EC,  $00E2,  $011A   ; DFA1   00F9 00EC 00E2 011A
        DECLE   $011B,  $0006,  $00C8,  $00C8   ; DFA5   011B 0006 00C8 00C8
        DECLE   $00C8,  $00C8,  $00C8,  $0119   ; DFA9   00C8 00C8 00C8 0119
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DFAD   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DFB1   00FF 00FF 00FF 00FF
        DECLE   $007C,  $0060,  $0000,  $0000   ; DFB5   007C 0060 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFB9   0000 0000 0000 0000

        RRC     R3,     2                       ; DFBD   0077
        SARC    R1,     2                       ; DFBE   007D
        SLL     R2,     2                       ; DFBF   004E
        SARC    R1,     1                       ; DFC0   0079
        SLR     R2,     2                       ; DFC1   0066
        RRC     R3,     1                       ; DFC2   0073
        SAR     R1,     2                       ; DFC3   006D
        RLC     R3,     1                       ; DFC4   0053
        MOVR    R1,     R6                      ; DFC5   008E
        ADDR    R2,     R7                      ; DFC6   00D7
        ADDR    R4,     R7                      ; DFC7   00E7

        DECLE   $00DB,  $00FF,  $00CF,  $00B8   ; DFC8   00DB 00FF 00CF 00B8
        DECLE   $00C0,  $00B7,  $004B,  $00BF   ; DFCC   00C0 00B7 004B 00BF
        DECLE   $007C,  $00E0,  $0000,  $0000   ; DFD0   007C 00E0 0000 0000
        DECLE   $0000                           ; DFD4   0000

        PSHR    R5                              ; DFD5   0275
        MVII    #$021B, R4                      ; DFD6   02BC 021B
        MOVR    R4,     R5                      ; DFD8   00A5
        MVII    #$0008, R3                      ; DFD9   02BB 0008
L_DFDB:
        MVII    #$000C, R2                      ; DFDB   02BA 000C
L_DFDD:
        MVI@    R4,     R0                      ; DFDD   02A0
L_DFDE:
        SDBD                                    ; DFDE   0001
        ANDI    #$E000, R0                      ; DFDF   03B8 0000 00E0
        MVO@    R0,     R5                      ; DFE2   0268
        DECR    R2                              ; DFE3   0012
        BNEQ    L_DFDD                          ; DFE4   022C 0008

        ADDI    #$0008, R4                      ; DFE6   02FC 0008
        ADDI    #$0008, R5                      ; DFE8   02FD 0008
        DECR    R3                              ; DFEA   0013
        BNEQ    L_DFDB                          ; DFEB   022C 0011
        PULR    R7                              ; DFED   02B7

        DECLE   $0004,  $0190,  $002A,  $0057   ; DFEE   0004 0190 002A 0057
        DECLE   $0201,  $0025,  $0280,  $01D2   ; DFF2   0201 0025 0280 01D2
        DECLE   $0080,  $0204                   ; DFF6   0080 0204

        NEGR    R0                              ; DFF8   0020
        DECR    R0                              ; DFF9   0010
        SLR     R0,     1                       ; DFFA   0060
        ADDR    R0,     R7                      ; DFFB   00C7

        DECR    R0                              ; DFFC   0010
        NEGR    R0                              ; DFFD   0020
        MVI     G_0161, R1                      ; DFFE   0281 0161

        ORG     $F000
        MVI     G_0160, R2                      ; F000   0282 0160
        ADDR    R0,     R1                      ; F002   00C1
        BLE     L_F082                          ; F003   0206 007D

        SUBI    #$0008, R2                      ; F005   033A 0008
        CMPR    R1,     R2                      ; F007   014A
        BLE     L_F018                          ; F008   0206 000E

        MVO     R1,     G_0161                  ; F00A   0241 0161
        MVII    #$0345, R4                      ; F00C   02BC 0345
        MOVR    R4,     R5                      ; F00E   00A5
        MVI@    R4,     R1                      ; F00F   02A1
        ADDR    R0,     R1                      ; F010   00C1
        MVO@    R1,     R5                      ; F011   0269
        MVI@    R4,     R1                      ; F012   02A1
        ADDR    R0,     R1                      ; F013   00C1
        MVO@    R1,     R5                      ; F014   0269
        MVI@    R4,     R1                      ; F015   02A1
        ADDR    R0,     R1                      ; F016   00C1
        MVO@    R1,     R5                      ; F017   0269
L_F018:
        ADDR    R0,     R0                      ; F018   00C0
        MVI     G_016F, R1                      ; F019   0281 016F
        CMPI    #$0030, R1                      ; F01B   0379 0030
        BLT     L_F021                          ; F01D   0205 0002

        MVII    #$0001, R0                      ; F01F   02B8 0001
L_F021:
        TSTR    R0                              ; F021   0080
        DECLE   $0224,  $0036                   ; F022   0224 0036

        ADDR    R0,     R1                      ; F024   00C1
        BPL     L_F029                          ; F025   0203 0002

        MVII    #$002E, R1                      ; F027   02B9 002E
L_F029:
        MOVR    R1,     R2                      ; F029   008A
        ANDI    #$0007, R2                      ; F02A   03BA 0007
        BNEQ    L_F063                          ; F02C   020C 0035

        MVI     G_0346, R2                      ; F02E   0282 0346
        MVI     G_034E, R3                      ; F030   0283 034E
        CMPI    #$0030, R1                      ; F032   0379 0030
        BGT     L_F03B                          ; F034   020E 0005
        BNEQ    L_F039                          ; F036   020C 0001

        CLRR    R1                              ; F038   01C9
L_F039:
        B       L_F05F                          ; F039   0200 0024

L_F03B:
        CMPI    #$0038, R1                      ; F03B   0379 0038
        BGT     L_F045                          ; F03D   020E 0006

        ADDI    #$0008, R2                      ; F03F   02FA 0008
        ADDI    #$0081, R3                      ; F041   02FB 0081
        B       L_F05B                          ; F043   0200 0016

L_F045:
        MVI     G_01CC, R0                      ; F045   0280 01CC
        DECLE   $0378,  $0001,  $020C,  $000C   ; F047   0378 0001 020C 000C
        DECLE   $0004                           ; F04B   0004

        ANDR    R2,     R0                      ; F04C   0190
        SWAP    R1,     1                       ; F04D   0041
        NEGR    R2                              ; F04E   0022
        MVII    #$0030, R1                      ; F04F   02B9 0030
        SUBI    #$0004, R2                      ; F051   033A 0004
        ADDI    #$007A, R3                      ; F053   02FB 007A
        B       L_F05B                          ; F055   0200 0004

        INCR    R2                              ; F057   000A
        ADDI    #$0085, R3                      ; F058   02FB 0085
        CLRR    R1                              ; F05A   01C9
L_F05B:
        MVO     R2,     G_0345                  ; F05B   0242 0345
        MVO     R3,     G_034D                  ; F05D   0243 034D

L_F05F:
        JSR     R5,     L_5B48                  ; F05F   0004 0158 0348
        DECLE   $0000                           ; F062   0000
L_F063:
        ANDI    #$003F, R1                      ; F063   03B9 003F
        MVO     R1,     G_016F                  ; F065   0241 016F
        INCR    R7                              ; F067   000F

        PSHR    R5                              ; F068   0275
L_F069:
        MVI     G_0161, R0                      ; F069   0280 0161
        ANDI    #$0007, R0                      ; F06B   03B8 0007
        SLL     R0,     2                       ; F06D   004C
        SLL     R0,     1                       ; F06E   0048
        MVI     G_016F, R3                      ; F06F   0283 016F
        SLR     R3,     2                       ; F071   0067
        SLR     R3,     1                       ; F072   0063
        DECR    R3                              ; F073   0013
L_F074:
        BEQ     L_F07B                          ; F074   0204 0005

        SUBI    #$0003, R3                      ; F076   033B 0003
        BGE     L_F074                          ; F078   022D 0005

        INCR    R0                              ; F07A   0008
L_F07B:
        MVO     R0,     G_01E2                  ; F07B   0240 01E2

        JSR     R5,     L_5B48                  ; F07D   0004 0158 0348
        DECLE   $0001                           ; F080   0001

        PULR    R7                              ; F081   02B7

L_F082:
        MVI     G_01C9, R3                      ; F082   0283 01C9
        ADDI    #$032C, R3                      ; F084   02FB 032C
        SDBD                                    ; F086   0001
        MVII    #$4000, R1                      ; F087   02B9 0000 0040
        MOVR    R1,     R2                      ; F08A   008A
        AND@    R3,     R1                      ; F08B   0399
        BEQ     L_F098                          ; F08C   0204 000A

        SLR     R1,     1                       ; F08E   0061
        MOVR    R1,     R2                      ; F08F   008A
        COMR    R2                              ; F090   001A
        AND@    R3,     R2                      ; F091   039A
        XORR    R1,     R2                      ; F092   01CA
        MVO@    R2,     R3                      ; F093   025A
        MVII    #$0004, R0                      ; F094   02B8 0004
        B       L_F09C                          ; F096   0200 0004

L_F098:
        XOR@    R3,     R2                      ; F098   03DA
        MVO@    R2,     R3                      ; F099   025A
        MVII    #$000C, R0                      ; F09A   02B8 000C
L_F09C:
        MVO     R0,     G_017C                  ; F09C   0240 017C
        DECLE   $0004,  $0190,  $003C,  $0030   ; F09E   0004 0190 003C 0030
        DECLE   $0004,  $039C,  $0305,  $01C9   ; F0A2   0004 039C 0305 01C9
        DECLE   $0004,  $0190,  $002A,  $002A   ; F0A6   0004 0190 002A 002A
        DECLE   $0209,  $00AB,  $01DB,  $0004   ; F0AA   0209 00AB 01DB 0004
        DECLE   $0190,  $002A,  $002D,  $0209   ; F0AE   0190 002A 002D 0209
        DECLE   $002C,  $0004                   ; F0B2   002C 0004

        ANDR    R2,     R0                      ; F0B4   0190
        ADCR    R2                              ; F0B5   002A
        ADCR    R6                              ; F0B6   002E
        MVII    #$0001, R3                      ; F0B7   02BB 0001
        ADCR    R7                              ; F0B9   002F

        NEGR    R3                              ; F0BA   0023
L_F0BB:
        MVI     G_0160, R1                      ; F0BB   0281 0160
        MVI     G_0161, R2                      ; F0BD   0282 0161
        SUBR    R3,     R1                      ; F0BF   0119
        CMPI    #$0058, R1                      ; F0C0   0379 0058
        BGE     L_F15C                          ; F0C2   020D 0098

        ADDI    #$0008, R2                      ; F0C4   02FA 0008
        CMPR    R2,     R1                      ; F0C6   0151
        BLE     L_F0DF                          ; F0C7   0206 0016

        MVO     R1,     G_0160                  ; F0C9   0241 0160
        MVII    #$0348, R4                      ; F0CB   02BC 0348
        MOVR    R4,     R5                      ; F0CD   00A5
        MVI@    R4,     R1                      ; F0CE   02A1
        SUBR    R3,     R1                      ; F0CF   0119
        MVO@    R1,     R5                      ; F0D0   0269
        MVI@    R4,     R1                      ; F0D1   02A1
        SUBR    R3,     R1                      ; F0D2   0119
        MVO@    R1,     R5                      ; F0D3   0269
        MVI@    R4,     R1                      ; F0D4   02A1
        SUBR    R3,     R1                      ; F0D5   0119
        MVO@    R1,     R5                      ; F0D6   0269
        MVI@    R4,     R1                      ; F0D7   02A1
        SUBR    R3,     R1                      ; F0D8   0119
        MVO@    R1,     R5                      ; F0D9   0269
        MVI     G_0344, R1                      ; F0DA   0281 0344
        SUBR    R3,     R1                      ; F0DC   0119
        MVO     R1,     G_0344                  ; F0DD   0241 0344
L_F0DF:
        MVI     G_0170, R1                      ; F0DF   0281 0170
        DECLE   $0004                           ; F0E1   0004

        ANDR    R2,     R0                      ; F0E2   0190
        ADCR    R2                              ; F0E3   002A
        ADCR    R7                              ; F0E4   002F

        CLRR    R0                              ; F0E5   01C0
L_F0E6:
        BNC     L_F0EA                          ; F0E6   0209 0002

        INCR    R0                              ; F0E8   0008
        MOVR    R0,     R3                      ; F0E9   0083
L_F0EA:
        ADDR    R3,     R3                      ; F0EA   00DB
        BEQ     L_F157                          ; F0EB   0204 006A

        ADDR    R3,     R1                      ; F0ED   00D9
        BPL     L_F0F6                          ; F0EE   0203 0006

        MVI     G_015F, R1                      ; F0F0   0281 015F
        SUBI    #$0002, R1                      ; F0F2   0339 0002
        B       L_F157                          ; F0F4   0200 0061

L_F0F6:
        MOVR    R1,     R2                      ; F0F6   008A
        ANDI    #$0007, R2                      ; F0F7   03BA 0007
        BNEQ    L_F157                          ; F0F9   020C 005C

        TSTR    R0                              ; F0FB   0080
        BEQ     L_F12F                          ; F0FC   0204 0031

        CMP     G_015F, R1                      ; F0FE   0341 015F
        BLT     L_F106                          ; F100   0205 0004

        CMP     G_015E, R1                      ; F102   0341 015E
        BNEQ    L_F108                          ; F104   020C 0002

L_F106:
        MVI     G_015F, R1                      ; F106   0281 015F
L_F108:
        MVI     G_035C, R3                      ; F108   0283 035C
        ADDI    #$0016, R3                      ; F10A   02FB 0016
        MVI@    R3,     R3                      ; F10C   029B
        DECR    R3                              ; F10D   0013
        BMI     L_F13C                          ; F10E   020B 002C

        SLL     R3,     2                       ; F110   004F
        SLL     R3,     2                       ; F111   004F
        MOVR    R1,     R2                      ; F112   008A
        ANDI    #$00F8, R2                      ; F113   03BA 00F8
        SUB     G_015F, R2                      ; F115   0302 015F
        ADDR    R2,     R2                      ; F117   00D2
        ADDR    R2,     R3                      ; F118   00D3
        SDBD                                    ; F119   0001
        ADDI    #$FBC0, R3                      ; F11A   02FB 00C0 00FB
        MVO     R3,     G_031B                  ; F11D   0243 031B
        MVI     G_0344, R5                      ; F11F   0285 0344
        SDBD                                    ; F121   0001
        ANDI    #$05FF, R5                      ; F122   03BD 00FF 0005
        XORI    #$0200, R5                      ; F125   03FD 0200
        MVO     R5,     G_0344                  ; F127   0245 0344

        JSR     R5,     L_5B48                  ; F129   0004 0158 0348
        DECLE   $0007                           ; F12C   0007

        B       L_F13C                          ; F12D   0200 000D

L_F12F:
        MVI     G_0344, R5                      ; F12F   0285 0344
        SDBD                                    ; F131   0001
        ANDI    #$05FF, R5                      ; F132   03BD 00FF 0005
        MVO     R5,     G_0344                  ; F135   0245 0344
        CMP     G_015F, R1                      ; F137   0341 015F
        BLT     L_F13C                          ; F139   0205 0001

        CLRR    R1                              ; F13B   01C9
L_F13C:
        MOVR    R1,     R2                      ; F13C   008A
        ANDI    #$00F8, R2                      ; F13D   03BA 00F8
        ADDR    R2,     R2                      ; F13F   00D2
        MVI     G_015D, R0                      ; F140   0280 015D
        MVI     G_035C, R3                      ; F142   0283 035C
        ADDI    #$0008, R3                      ; F144   02FB 0008
        MVI@    R3,     R3                      ; F146   029B
        SLL     R3,     2                       ; F147   004F
        SLL     R3,     2                       ; F148   004F
L_F149:
        ADDR    R2,     R3                      ; F149   00D3
        DECR    R0                              ; F14A   0010
        BNEQ    L_F149                          ; F14B   022C 0003

        SDBD                                    ; F14D   0001
        ADDI    #$D000, R3                      ; F14E   02FB 0000 00D0
        MVO     R3,     G_031A                  ; F151   0243 031A

        JSR     R5,     L_5B48                  ; F153   0004 0158 0348
        DECLE   $0006                           ; F156   0006
L_F157:
        ANDI    #$003E, R1                      ; F157   03B9 003E
        MVO     R1,     G_0170                  ; F159   0241 0170
        PULR    R7                              ; F15B   02B7

L_F15C:
        MVI     G_01C9, R1                      ; F15C   0281 01C9
        DECLE   $02F9,  $032C,  $02B8,  $000F   ; F15E   02F9 032C 02B8 000F
        DECLE   $0248,  $01C0,  $0240,  $017C   ; F162   0248 01C0 0240 017C
        DECLE   $0004                           ; F166   0004

        AND@    R3,     R4                      ; F167   039C
        SUB     .BTAB.75,R5                     ; F168   0305 0275
        MVI     G_031A, R4                      ; F16A   0284 031A
        SDBD                                    ; F16C   0001
        MVII    #$39C0, R1                      ; F16D   02B9 00C0 0039
        MVI     G_015D, R0                      ; F170   0280 015D

L_F172:
        JSR     R5,     L_5AD0                  ; F172   0004 0158 02D0
        JSR     R5,     L_5AD0                  ; F175   0004 0158 02D0

        DECR    R0                              ; F178   0010
        BNEQ    L_F172                          ; F179   022C 0008
        PULR    R7                              ; F17B   02B7

        PSHR    R5                              ; F17C   0275
        MVI     G_031B, R4                      ; F17D   0284 031B
        SDBD                                    ; F17F   0001
        MVII    #$39B0, R1                      ; F180   02B9 00B0 0039

        JSR     R5,     L_5AD0                  ; F183   0004 0158 02D0
        JSR     R5,     L_5AD0                  ; F186   0004 0158 02D0

        PULR    R7                              ; F189   02B7

        DECLE   $0275,  $0283,  $01C9,  $02FB   ; F18A   0275 0283 01C9 02FB
        DECLE   $032C,  $0299,  $0282,  $0109   ; F18E   032C 0299 0282 0109
        DECLE   $0066,  $0062,  $02FA,  $0003   ; F192   0066 0062 02FA 0003
        DECLE   $0001,  $03B9,  $0000,  $0020   ; F196   0001 03B9 0000 0020
        DECLE   $0204,  $0007,  $0004,  $0190   ; F19A   0204 0007 0004 0190
        DECLE   $0041,  $002D,  $01D2,  $0200   ; F19E   0041 002D 01D2 0200
        DECLE   $0004,  $0004,  $0190,  $003C   ; F1A2   0004 0004 0190 003C
        DECLE   $002D,  $0004,  $0190,  $0041   ; F1A6   002D 0004 0190 0041
        DECLE   $002E,  $0004,  $0190,  $003C   ; F1AA   002E 0004 0190 003C
        DECLE   $002F                           ; F1AE   002F

        MVO     R2,     G_017C                  ; F1AF   0242 017C
        MVI     G_01C9, R5                      ; F1B1   0285 01C9
        ADDI    #$013A, R5                      ; F1B3   02FD 013A
        MVI@    R5,     R0                      ; F1B5   02A8
        MVO     R0,     G_0166                  ; F1B6   0240 0166
        MVI     G_035C, R5                      ; F1B8   0285 035C
        ADDI    #$0005, R5                      ; F1BA   02FD 0005
        MVI@    R5,     R0                      ; F1BC   02A8
        SLR     R0,     2                       ; F1BD   0064
        SLR     R0,     2                       ; F1BE   0064
        SLR     R0,     2                       ; F1BF   0064
        MVO     R0,     G_0162                  ; F1C0   0240 0162
        SLL     R0,     1                       ; F1C2   0048
        NEGR    R0                              ; F1C3   0020
        ADDI    #$0014, R0                      ; F1C4   02F8 0014
        MVO     R0,     G_0163                  ; F1C6   0240 0163
        MVI@    R5,     R0                      ; F1C8   02A8
        ANDI    #$000F, R0                      ; F1C9   03B8 000F
        MVII    #$001A, R1                      ; F1CB   02B9 001A
        SUB     G_01E0, R1                      ; F1CD   0301 01E0
        MVI     G_0107, R3                      ; F1CF   0283 0107
        SUBI    #$0030, R3                      ; F1D1   033B 0030
        SARC    R2,     2                       ; F1D3   007E
        SARC    R3,     2                       ; F1D4   007F
        SUBR    R3,     R1                      ; F1D5   0119
        SUBR    R0,     R1                      ; F1D6   0101
        BGT     L_F1DB                          ; F1D7   020E 0002

        MVII    #$0001, R1                      ; F1D9   02B9 0001
L_F1DB:
        MVO     R1,     G_0164                  ; F1DB   0241 0164
        DECLE   $0015,  $02A9,  $0275,  $0065   ; F1DD   0015 02A9 0275 0065
        DECLE   $0065,  $008A,  $03B9,  $0007   ; F1E1   0065 008A 03B9 0007
        DECLE   $00F9,  $02F9,  $010A,  $0280   ; F1E5   00F9 02F9 010A 0280
        DECLE   $0109,  $007C,  $0078,  $0034   ; F1E9   0109 007C 0078 0034
        DECLE   $007C,  $0010,  $0004,  $0190   ; F1ED   007C 0010 0004 0190
        DECLE   $0015,  $005D,  $0000,  $00C1   ; F1F1   0015 005D 0000 00C1
        DECLE   $0288,  $0010,  $0240,  $0167   ; F1F5   0288 0010 0240 0167
        DECLE   $0040,  $0240,  $0168,  $0066   ; F1F9   0040 0240 0168 0066
        DECLE   $0062,  $0091,  $03BA,  $0001   ; F1FD   0062 0091 03BA 0001
        DECLE   $0242,  $0169,  $008A,  $03BA   ; F201   0242 0169 008A 03BA
        DECLE   $0002,  $0204,  $0006,  $0004   ; F205   0002 0204 0006 0004

        ANDR    R2,     R0                      ; F209   0190
        SWAP    R1,     1                       ; F20A   0041
        GSWD    R3                              ; F20B   0033
        B       L_F212                          ; F20C   0200 0004

        DECLE   $0004                           ; F20E   0004

        ANDR    R2,     R0                      ; F20F   0190
        RSWD    R4                              ; F210   003C
        GSWD    R3                              ; F211   0033
L_F212:
        MOVR    R1,     R2                      ; F212   008A
        DECLE   $03BA,  $0004,  $0204,  $0006   ; F213   03BA 0004 0204 0006
        DECLE   $0004                           ; F217   0004

        ANDR    R2,     R0                      ; F218   0190
        SWAP    R1,     1                       ; F219   0041
        NOP                                     ; F21A   0034
        B       L_F221                          ; F21B   0200 0004

        DECLE   $0004                           ; F21D   0004

        ANDR    R2,     R0                      ; F21E   0190
        RSWD    R4                              ; F21F   003C
        NOP                                     ; F220   0034
L_F221:
        PULR    R5                              ; F221   02B5
        MVI@    R5,     R0                      ; F222   02A8
        MVO     R0,     G_0165                  ; F223   0240 0165
        INCR    R5                              ; F225   000D
        MVI@    R5,     R0                      ; F226   02A8
        MOVR    R0,     R1                      ; F227   0081
        ANDI    #$000F, R1                      ; F228   03B9 000F
        SLL     R1,     2                       ; F22A   004D
        SLL     R1,     1                       ; F22B   0049
        MVO     R1,     G_015E                  ; F22C   0241 015E
        MOVR    R0,     R1                      ; F22E   0081
        SLR     R1,     1                       ; F22F   0061
        ANDI    #$0078, R1                      ; F230   03B9 0078
        MVO     R1,     G_015F                  ; F232   0241 015F
        SWAP    R0,     1                       ; F234   0040
        ANDI    #$0003, R0                      ; F235   03B8 0003
        INCR    R0                              ; F237   0008
        MVO     R0,     G_015D                  ; F238   0240 015D
        MVII    #$0348, R4                      ; F23A   02BC 0348
L_F23C:
        MVI@    R5,     R3                      ; F23C   02AB
        SARC    R3,     1                       ; F23D   007B
        BNC     L_F244                          ; F23E   0209 0004

        SDBD                                    ; F240   0001
        ADDI    #$0400, R3                      ; F241   02FB 0000 0004
L_F244:
        ADDI    #$0274, R3                      ; F244   02FB 0274
        MVO@    R3,     R4                      ; F246   0263
        DECR    R0                              ; F247   0010
        BNEQ    L_F23C                          ; F248   022C 000D

        MVI     G_015D, R0                      ; F24A   0280 015D
        SUBR    R0,     R5                      ; F24C   0105
        SUBR    R0,     R4                      ; F24D   0104
        ADDI    #$0004, R5                      ; F24E   02FD 0004
        ADDI    #$0008, R4                      ; F250   02FC 0008
L_F252:
        MVI@    R5,     R3                      ; F252   02AB
        ADDI    #$00A0, R3                      ; F253   02FB 00A0
        MVO@    R3,     R4                      ; F255   0263
        DECR    R0                              ; F256   0010
        BNEQ    L_F252                          ; F257   022C 0006

        MVI     G_015D, R0                      ; F259   0280 015D
        SUBR    R0,     R5                      ; F25B   0105
        SUBR    R0,     R4                      ; F25C   0104
        ADDI    #$0004, R5                      ; F25D   02FD 0004
        ADDI    #$0008, R4                      ; F25F   02FC 0008
        CLRR    R2                              ; F261   01D2
        SDBD                                    ; F262   0001
        MVII    #$29C0, R1                      ; F263   02B9 00C0 0029
L_F266:
        PSHR    R0                              ; F266   0270
        MVI@    R5,     R3                      ; F267   02AB
        ANDI    #$001F, R3                      ; F268   03BB 001F
        SDBD                                    ; F26A   0001
        ADDI    #$6C79, R3                      ; F26B   02FB 0079 006C
        MVI@    R3,     R0                      ; F26E   0298
        SLL     R0,     2                       ; F26F   004C
        SLL     R0,     2                       ; F270   004C
        ANDI    #$00F0, R0                      ; F271   03B8 00F0
        SWAP    R0,     1                       ; F273   0040
        SLR     R2,     2                       ; F274   0066
        SLR     R2,     2                       ; F275   0066
        ADDR    R0,     R2                      ; F276   00C2
        MVI@    R3,     R0                      ; F277   0298
        SLR     R0,     2                       ; F278   0064
        SLR     R0,     2                       ; F279   0064
        SARC    R0,     1                       ; F27A   0078
        BNC     L_F281                          ; F27B   0209 0004

        SDBD                                    ; F27D   0001
        ADDI    #$1000, R0                      ; F27E   02F8 0000 0010
L_F281:
        ADDR    R1,     R0                      ; F281   00C8
        MVO@    R0,     R4                      ; F282   0260
        ADDI    #$0010, R1                      ; F283   02F9 0010
        PULR    R0                              ; F285   02B0
        DECR    R0                              ; F286   0010
        BNEQ    L_F266                          ; F287   022C 0022

        MVI     G_015D, R0                      ; F289   0280 015D
        SUBI    #$0004, R0                      ; F28B   0338 0004
L_F28D:
        BEQ     L_F294                          ; F28D   0204 0005

        SLR     R2,     2                       ; F28F   0066
        SLR     R2,     2                       ; F290   0066
        INCR    R0                              ; F291   0008
        B       L_F28D                          ; F292   0220 0006

L_F294:
        MVO     R2,     G_017F                  ; F294   0242 017F
        SWAP    R2,     1                       ; F296   0042
        MVO     R2,     G_0180                  ; F297   0242 0180
        SUB     G_015D, R5                      ; F299   0305 015D
        MVI@    R5,     R0                      ; F29B   02A8
        SLR     R0,     2                       ; F29C   0064
        SLR     R0,     2                       ; F29D   0064
        SLR     R0,     1                       ; F29E   0060
        NEGR    R0                              ; F29F   0020
        ADDI    #$0074, R0                      ; F2A0   02F8 0074
        MVI@    R5,     R1                      ; F2A2   02A9
        SLR     R1,     2                       ; F2A3   0065
        SLR     R1,     2                       ; F2A4   0065
        SLR     R1,     1                       ; F2A5   0061
        ADDI    #$00A0, R1                      ; F2A6   02F9 00A0
        MVI@    R5,     R2                      ; F2A8   02AA
        PSHR    R2                              ; F2A9   0272
        MVI@    R5,     R3                      ; F2AA   02AB
        MOVR    R3,     R2                      ; F2AB   009A
        ANDI    #$0080, R3                      ; F2AC   03BB 0080
        ANDI    #$0300, R2                      ; F2AE   03BA 0300
        SLL     R3,     2                       ; F2B0   004F
        SLL     R3,     1                       ; F2B1   004B
        ADDR    R3,     R0                      ; F2B2   00D8
        ADDR    R2,     R1                      ; F2B3   00D1
        MVO     R0,     G_0344                  ; F2B4   0240 0344
        MVO     R1,     G_034C                  ; F2B6   0241 034C
        PULR    R2                              ; F2B8   02B2
        SLR     R2,     2                       ; F2B9   0066
        SLR     R2,     2                       ; F2BA   0066
        SLR     R2,     1                       ; F2BB   0062
        SDBD                                    ; F2BC   0001
        ADDI    #$6C79, R2                      ; F2BD   02FA 0079 006C
        MVI@    R2,     R0                      ; F2C0   0290
        ANDI    #$00F0, R0                      ; F2C1   03B8 00F0
        SLR     R0,     2                       ; F2C3   0064
        SLR     R0,     2                       ; F2C4   0064
        SARC    R0,     1                       ; F2C5   0078
        BNC     L_F2CC                          ; F2C6   0209 0004

        SDBD                                    ; F2C8   0001
        ADDI    #$1000, R0                      ; F2C9   02F8 0000 0010
L_F2CC:
        SDBD                                    ; F2CC   0001
        ADDI    #$09B0, R0                      ; F2CD   02F8 00B0 0009
        MVO     R0,     G_0354                  ; F2D0   0240 0354
        MVI@    R2,     R0                      ; F2D2   0290
        ANDI    #$000F, R0                      ; F2D3   03B8 000F
        MVI@    R5,     R2                      ; F2D5   02AA

        JSR     R5,     L_6C99                  ; F2D6   0004 016C 0099
        DECLE   $0000                           ; F2D9   0000

        SLL     R2,     2                       ; F2DA   004E
        SLL     R2,     2                       ; F2DB   004E
        BEQ     L_F2E2                          ; F2DC   0204 0004

        SDBD                                    ; F2DE   0001
        ADDI    #$FBC0, R2                      ; F2DF   02FA 00C0 00FB
L_F2E2:
        MVO     R2,     G_031B                  ; F2E2   0242 031B

        JSR     R5,     L_5B48                  ; F2E4   0004 0158 0348
        DECLE   $0007,  $0004                   ; F2E7   0007 0004

        ANDR    R2,     R0                      ; F2E9   0190
        SWAP    R1,     1                       ; F2EA   0041
        ADCR    R2                              ; F2EB   002A
        CLRR    R1                              ; F2EC   01C9
        B       L_F13C                          ; F2ED   0220 01B2

        DECLE   $0000,  $0000,  $03E9,  $00FB   ; F2EF   0000 0000 03E9 00FB
        DECLE   $007E,  $0033,  $0015,  $0006   ; F2F3   007E 0033 0015 0006
        DECLE   $0003,  $0002,  $0002,  $0001   ; F2F7   0003 0002 0002 0001

        SDBD                                    ; F2FB   0001
        MVI@    R5,     R0                      ; F2FC   02A8
        PSHR    R5                              ; F2FD   0275
        PSHR    R1                              ; F2FE   0271
        PSHR    R2                              ; F2FF   0272
        MOVR    R0,     R1                      ; F300   0081
        ANDI    #$00E0, R1                      ; F301   03B9 00E0
        SUBR    R1,     R0                      ; F303   0108
        MOVR    R0,     R2                      ; F304   0082
        CLRR    R0                              ; F305   01C0
L_F306:
        PSHR    R0                              ; F306   0270
        MOVR    R2,     R0                      ; F307   0090

        JSR     R5,     X_RAND2                 ; F308   0004 0114 029E

        INCR    R0                              ; F30B   0008
        ADD@    R6,     R0                      ; F30C   02F0
        SUBI    #$0020, R1                      ; F30D   0339 0020
        BGT     L_F306                          ; F30F   022E 000A

        PULR    R2                              ; F311   02B2
        PULR    R1                              ; F312   02B1
        PULR    R7                              ; F313   02B7

        DECLE   $0275,  $0280,  $01D6,  $03B8   ; F314   0275 0280 01D6 03B8
        DECLE   $001F,  $020C,  $0173,  $0281   ; F318   001F 020C 0173 0281
        DECLE   $017C,  $0011,  $020B,  $0009   ; F31C   017C 0011 020B 0009
        DECLE   $0004                           ; F320   0004

        ANDR    R2,     R0                      ; F321   0190
        ADCR    R2                              ; F322   002A
        NEGR    R2                              ; F323   0022
        BC      L_F329                          ; F324   0201 0003

        MVO     R1,     G_017C                  ; F326   0241 017C
        PULR    R7                              ; F328   02B7

L_F329:
        CLRR    R1                              ; F329   01C9
        DECLE   $0241,  $017C,  $0004,  $0190   ; F32A   0241 017C 0004 0190
        DECLE   $0041,  $002E,  $0004,  $0190   ; F32E   0041 002E 0004 0190
        DECLE   $0041,  $002D,  $0281,  $0160   ; F332   0041 002D 0281 0160
        DECLE   $0301,  $0161,  $0379,  $000C   ; F336   0301 0161 0379 000C
        DECLE   $020E,  $0108,  $0004,  $0190   ; F33A   020E 0108 0004 0190
        DECLE   $0041,  $002F,  $0004,  $0190   ; F33E   0041 002F 0004 0190
        DECLE   $002A,  $0022,  $0209,  $008D   ; F342   002A 0022 0209 008D
        DECLE   $0004,  $01A0,  $02FC,  $0034   ; F346   0004 01A0 02FC 0034
        DECLE   $0283,  $01D4,  $03BB,  $000F   ; F34A   0283 01D4 03BB 000F
        DECLE   $02FB,  $012A,  $029A,  $03BA   ; F34E   02FB 012A 029A 03BA
        DECLE   $0007,  $00FA,  $02FA,  $01A6   ; F352   0007 00FA 02FA 01A6
        DECLE   $02D0,  $0004,  $0190,  $0015   ; F356   02D0 0004 0190 0015
        DECLE   $005E,  $005E,  $005E,  $005E   ; F35A   005E 005E 005E 005E
        DECLE   $005E,  $005E,  $005B,  $005B   ; F35E   005E 005E 005B 005B
        DECLE   $005B,  $005A,  $007D,  $00A6   ; F362   005B 005A 007D 00A6
        DECLE   $00A4,  $0000,  $0340,  $0164   ; F366   00A4 0000 0340 0164
        DECLE   $0205,  $0067,  $02B8,  $002D   ; F36A   0205 0067 02B8 002D
        DECLE   $0240,  $01EE,  $0299,  $0065   ; F36E   0240 01EE 0299 0065
        DECLE   $0061,  $0339,  $000C,  $0061   ; F372   0061 0339 000C 0061
        DECLE   $02C1,  $0169,  $0001,  $02F9   ; F376   02C1 0169 0001 02F9
        DECLE   $0002,  $00A5,  $0288,  $0004   ; F37A   0002 00A5 0288 0004
        DECLE   $01A0,  $02FD,  $02D0,  $0283   ; F37E   01A0 02FD 02D0 0283
        DECLE   $0107,  $0067,  $0067,  $033B   ; F382   0107 0067 0067 033B
        DECLE   $0003,  $0270,  $0004,  $0190   ; F386   0003 0270 0004 0190
        DECLE   $0014,  $0079,  $0079,  $0079   ; F38A   0014 0079 0079 0079
        DECLE   $0081,  $0081,  $0081,  $0000   ; F38E   0081 0081 0081 0000
        DECLE   $0020,  $0004,  $0190,  $0015   ; F392   0020 0004 0190 0015
        DECLE   $007D,  $007D,  $007D,  $00A4   ; F396   007D 007D 007D 00A4
        DECLE   $00A4,  $005A,  $00AA,  $00A6   ; F39A   00A4 005A 00AA 00A6
        DECLE   $0034,  $0000                   ; F39E   0034 0000

        ADDR    R0,     R3                      ; F3A0   00C3
        PULR    R0                              ; F3A1   02B0
        ADDR    R3,     R0                      ; F3A2   00D8
        BGT     L_F3A7                          ; F3A3   020E 0002

        MVII    #$0001, R0                      ; F3A5   02B8 0001
L_F3A7:
        PSHR    R0                              ; F3A7   0270
        DECLE   $0004                           ; F3A8   0004

        ANDR    R4,     R4                      ; F3A9   01A4
        MOVR    R1,     R7                      ; F3AA   008F

        DECLE   $020C,  $0025,  $0285,  $01C9   ; F3AB   020C 0025 0285 01C9
        DECLE   $02FD,  $0122,  $02AB,  $0067   ; F3AF   02FD 0122 02AB 0067
        DECLE   $0063,  $0273,  $0004,  $01A4   ; F3B3   0063 0273 0004 01A4
        DECLE   $00B5,  $02B3,  $037B,  $0002   ; F3B7   00B5 02B3 037B 0002
        DECLE   $0204,  $0011,  $0004,  $0190   ; F3BB   0204 0011 0004 0190
        DECLE   $0014,  $00AA,  $00A8,  $0000   ; F3BF   0014 00AA 00A8 0000
        DECLE   $0010,  $0004,  $0194,  $01A0   ; F3C3   0010 0004 0194 01A0
        DECLE   $0109,  $02B8,  $0001,  $0004   ; F3C7   0109 02B8 0001 0004

        ANDR    R2,     R4                      ; F3CB   0194
        ANDR    R4,     R0                      ; F3CC   01A0
        SUBR    R0,     R7                      ; F3CD   0107

        DECLE   $02B0,  $0004,  $039C,  $0305   ; F3CE   02B0 0004 039C 0305
        DECLE   $02B0,  $0004,  $0190,  $002A   ; F3D2   02B0 0004 0190 002A
        DECLE   $002F,  $0209,  $006B           ; F3D6   002F 0209 006B

        MVII    #$000D, R0                      ; F3D9   02B8 000D

        JSR     R5,     X_RAND2                 ; F3DB   0004 0114 029E
        DECLE   $0010,  $0204,  $0016,  $0004   ; F3DE   0010 0204 0016 0004
        DECLE   $01A0,  $02FC,  $0034,  $0020   ; F3E2   01A0 02FC 0034 0020
        DECLE   $0004                           ; F3E6   0004

        ANDR    R2,     R0                      ; F3E7   0190
        DECR    R5                              ; F3E8   0015
        SARC    R2,     1                       ; F3E9   007A
        MOVR    R0,     R2                      ; F3EA   0082
        MOVR    R0,     R3                      ; F3EB   0083
        MOVR    R0,     R4                      ; F3EC   0084
        MOVR    R3,     R7                      ; F3ED   009F
        MOVR    R3,     R7                      ; F3EE   009F

        DECLE   $00A9,  $00A9,  $0000,  $0020   ; F3EF   00A9 00A9 0000 0020
        DECLE   $0300,  $0163,  $020B,  $004D   ; F3F3   0300 0163 020B 004D
        DECLE   $0280,  $0165,  $0004,  $01A0   ; F3F7   0280 0165 0004 01A0
        DECLE   $02FD,  $0081,  $0004,  $0190   ; F3FB   02FD 0081 0004 0190
        DECLE   $002A,  $0033,  $0209,  $0009   ; F3FF   002A 0033 0209 0009
        DECLE   $0004,  $0190,  $0014,  $0053   ; F403   0004 0190 0014 0053
        DECLE   $007B,  $0000,  $0204,  $0001   ; F407   007B 0000 0204 0001
        DECLE   $0065,  $0004                   ; F40B   0065 0004

        ANDR    R2,     R0                      ; F40D   0190
        DECR    R4                              ; F40E   0014
        SARC    R2,     2                       ; F40F   007E
        MOVR    R0,     R4                      ; F410   0084
        MOVR    R0,     R5                      ; F411   0085
        MOVR    R3,     R7                      ; F412   009F

        MOVR    R5,     R1                      ; F413   00A9
        MOVR    R4,     R7                      ; F414   00A7

        DECLE   $0000,  $0020,  $00C8,  $0206   ; F415   0000 0020 00C8 0206
        DECLE   $001A,  $0378,  $0006,  $0206   ; F419   001A 0378 0006 0206
        DECLE   $0008,  $0004,  $0190,  $002A   ; F41D   0008 0004 0190 002A
        DECLE   $0086,  $0209,  $0002,  $0338   ; F421   0086 0209 0002 0338
        DECLE   $0004,  $0004,  $01A4,  $00EA   ; F425   0004 0004 01A4 00EA
        DECLE   $02B8,  $001E,  $0004           ; F429   02B8 001E 0004

        ANDR    R2,     R0                      ; F42C   0190
        INCR    R2                              ; F42D   000A
        BC      L_F432                          ; F42E   0201 0002

        ADDI    #$0003, R0                      ; F430   02F8 0003
L_F432:
        MVO     R0,     G_01EE                  ; F432   0240 01EE
        DECLE   $0004,  $0190,  $002A,  $0034   ; F434   0004 0190 002A 0034
        DECLE   $0209,  $000A,  $0004,  $0190   ; F438   0209 000A 0004 0190
        DECLE   $002A,  $007C,  $0201,  $0004   ; F43C   002A 007C 0201 0004
        DECLE   $0004,  $0194,  $0187,  $0001   ; F440   0004 0194 0187 0001
        DECLE   $0004                           ; F444   0004

        ANDR    R2,     R0                      ; F445   0190
        RSWD    R4                              ; F446   003C
        NEGR    R2                              ; F447   0022
        MVI     G_01EE, R0                      ; F448   0280 01EE
        TSTR    R0                              ; F44A   0080
        BNEQ    L_F48E                          ; F44B   020C 0041

        MVII    #$0003, R0                      ; F44D   02B8 0003

        JSR     R5,     X_RAND2                 ; F44F   0004 0114 029E

        PSHR    R0                              ; F452   0270
        ADDR    R0,     R0                      ; F453   00C0
        ADD@    R6,     R0                      ; F454   02F0
        ADDI    #$0024, R0                      ; F455   02F8 0024
        MVO     R0,     G_01EE                  ; F457   0240 01EE
        PULR    R7                              ; F459   02B7

        PSHR    R5                              ; F45A   0275
        MVI     G_010C, R0                      ; F45B   0280 010C

        JSR     R5,     L_DFDE                  ; F45D   0004 01DC 03DE
        DECLE   $0081,  $0280,  $0168,  $0040   ; F460   0081 0280 0168 0040
        DECLE   $02C0,  $0167,  $020B,  $0020   ; F464   02C0 0167 020B 0020
        DECLE   $0004                           ; F468   0004

        ANDR    R2,     R0                      ; F469   0190
        ADCR    R2                              ; F46A   002A
        MOVR    R4,     R3                      ; F46B   00A3
        ADCR    R7                              ; F46C   002F
        INCR    R7                              ; F46D   000F

L_F46E:
        ADDR    R1,     R1                      ; F46E   00C9
L_F46F:
        SUBR    R1,     R0                      ; F46F   0108
        DECLE   $0203,  $0017,  $02B8,  $0001   ; F470   0203 0017 02B8 0001
        DECLE   $0004,  $0194,  $01A0,  $0109   ; F474   0004 0194 01A0 0109
        DECLE   $0004,  $0190,  $003C,  $002F   ; F478   0004 0190 003C 002F
        DECLE   $0004,  $0190,  $003C,  $002E   ; F47C   0004 0190 003C 002E
        DECLE   $0004                           ; F480   0004

        ANDR    R2,     R0                      ; F481   0190
        SWAP    R1,     1                       ; F482   0041
        ADCR    R5                              ; F483   002D
        MVII    #$00FF, R0                      ; F484   02B8 00FF
        MVO     R0,     G_017C                  ; F486   0240 017C
        PULR    R7                              ; F488   02B7

        MVO     R0,     G_0167                  ; F489   0240 0167
        SWAP    R0,     1                       ; F48B   0040
        MVO     R0,     G_0168                  ; F48C   0240 0168
L_F48E:
        PULR    R7                              ; F48E   02B7

        PSHR    R5                              ; F48F   0275
        TSTR    R0                              ; F490   0080
        BNEQ    L_F494                          ; F491   020C 0001

        INCR    R0                              ; F493   0008
L_F494:
        MVI     G_01C9, R5                      ; F494   0285 01C9
        CMPI    #$00FF, R5                      ; F496   037D 00FF
        BEQ     L_F4B3                          ; F498   0204 0019

        ADDI    #$032C, R5                      ; F49A   02FD 032C
        MVI@    R5,     R5                      ; F49C   02AD
        TSTR    R5                              ; F49D   00AD
        BMI     L_F4B3                          ; F49E   020B 0013

        MVI     G_01C9, R5                      ; F4A0   0285 01C9
        ADDI    #$0122, R5                      ; F4A2   02FD 0122
        MVI@    R5,     R5                      ; F4A4   02AD
        TSTR    R5                              ; F4A5   00AD
        BEQ     L_F4B3                          ; F4A6   0204 000B

        MVI     G_01C9, R5                      ; F4A8   0285 01C9
        ADDI    #$013A, R5                      ; F4AA   02FD 013A
        NEGR    R0                              ; F4AC   0020
        ADD@    R5,     R0                      ; F4AD   02E8
        BGT     L_F4B1                          ; F4AE   020E 0001

        CLRR    R0                              ; F4B0   01C0
L_F4B1:
        DECR    R5                              ; F4B1   0015
        MVO@    R0,     R5                      ; F4B2   0268
L_F4B3:
        TSTR    R0                              ; F4B3   0080
        PULR    R7                              ; F4B4   02B7

        DECLE   $0275,  $0271,  $0285,  $01C9   ; F4B5   0275 0271 0285 01C9
        DECLE   $02FD,  $0122,  $02A8,  $0064   ; F4B9   02FD 0122 02A8 0064
        DECLE   $0060,  $0378,  $000D,  $020B   ; F4BD   0060 0378 000D 020B
        DECLE   $000A,  $0004,  $0190,  $002A   ; F4C1   000A 0004 0190 002A
        DECLE   $003E,  $0209,  $0004,  $0004   ; F4C5   003E 0209 0004 0004

        ANDR    R4,     R4                      ; F4C9   01A4
        SUBR    R2,     R4                      ; F4CA   0114
        DIS                                     ; F4CB   0003
        SUBI    #$0003, R0                      ; F4CC   0338 0003
        BGE     L_F4D1                          ; F4CE   020D 0001

        CLRR    R0                              ; F4D0   01C0

L_F4D1:
        JSR     R5,     X_POW2                  ; F4D1   0004 0114 0345
        DECLE   $0004                           ; F4D4   0004

        ANDR    R5,     R0                      ; F4D5   01A8
        AND@    R4,     R2                      ; F4D6   03A2
        MVI     G_01C9, R5                      ; F4D7   0285 01C9
        ADDI    #$032C, R5                      ; F4D9   02FD 032C
        MVII    #$0080, R0                      ; F4DB   02B8 0080
        SWAP    R0,     1                       ; F4DD   0040
        MOVR    R0,     R1                      ; F4DE   0081
        COMR    R1                              ; F4DF   0019
        AND@    R5,     R1                      ; F4E0   03A9
        XORR    R0,     R1                      ; F4E1   01C1
        DECR    R5                              ; F4E2   0015
        MVO@    R1,     R5                      ; F4E3   0269
        SUBI    #$020B, R5                      ; F4E4   033D 020B
        CLRR    R0                              ; F4E6   01C0
        MVO@    R0,     R5                      ; F4E7   0268
        PULR    R1                              ; F4E8   02B1
        PULR    R7                              ; F4E9   02B7

        DECLE   $0275,  $0285,  $010E,  $0105   ; F4EA   0275 0285 010E 0105
        DECLE   $0245,  $010E,  $0206,  $0004   ; F4EE   0245 010E 0206 0004

        JSR     R5,     L_54BD                  ; F4F2   0004 0154 00BD

        PULR    R7                              ; F4F5   02B7

        DECLE   $0004,  $01A4,  $0114,  $0002   ; F4F6   0004 01A4 0114 0002
        DECLE   $0000,  $0000,  $0001,  $0001   ; F4FA   0000 0000 0001 0001
        DECLE   $0002,  $0002,  $0003,  $0005   ; F4FE   0002 0002 0003 0005

        NEGR    R6                              ; F502   0026
        NEGR    R4                              ; F503   0024
        ADCR    R0                              ; F504   0028
        ADCR    R4                              ; F505   002C
        ADCR    R4                              ; F506   002C
        NEGR    R3                              ; F507   0023
        NEGR    R6                              ; F508   0026
        SWAP    R0,     2                       ; F509   0044
        NEGR    R5                              ; F50A   0025
        SWAP    R2,     2                       ; F50B   0046
        NEGR    R6                              ; F50C   0026
        NEGR    R4                              ; F50D   0024
        NEGR    R6                              ; F50E   0026
        NEGR    R6                              ; F50F   0026
        NEGR    R6                              ; F510   0026
        ADCR    R2                              ; F511   002A
        ADCR    R2                              ; F512   002A
        SLR     R2,     2                       ; F513   0066
        MVI@    R5,     R1                      ; F514   02A9
        MVO     R1,     G_015E                  ; F515   0241 015E
        MVII    #$0344, R4                      ; F517   02BC 0344
        MVII    #$0008, R0                      ; F519   02B8 0008

        JSR     R5,     X_FILL_ZERO             ; F51B   0004 0114 0338

        MVI     G_015E, R1                      ; F51E   0281 015E
        INCR    R1                              ; F520   0009
        ADDR    R7,     R1                      ; F521   00F9
        ADD@    R1,     R7                      ; F522   02CF

        JSRE    R4,     .EXEC.422               ; F523   0004 0015 0022
        DECLE   $0059,  $0006,  $0004,  $01A4   ; F526   0059 0006 0004 01A4
        DECLE   $02A8,  $0004                   ; F52A   02A8 0004

        ANDR    R4,     R4                      ; F52C   01A4
        XORR    R7,     R1                      ; F52D   01F9
        MVII    #$0036, R1                      ; F52E   02B9 0036
        MVO     R1,     G_01EE                  ; F530   0241 01EE
        MVII    #$0002, R1                      ; F532   02B9 0002
        MVII    #$0080, R2                      ; F534   02BA 0080
        B       L_F58A                          ; F536   0200 0052

        DECLE   $0007,  $0004,  $01A4,  $02A8   ; F538   0007 0004 01A4 02A8
        DECLE   $0004,  $01A4,  $0201,  $02B9   ; F53C   0004 01A4 0201 02B9
        DECLE   $0001                           ; F540   0001

        MVII    #$0064, R2                      ; F541   02BA 0064
        B       L_F58A                          ; F543   0200 0045

        DECLE   $0004,  $01A8,  $0079,  $0004   ; F545   0004 01A8 0079 0004

        ANDR    R4,     R6                      ; F549   01A6
        CMP     .STIC.X.4,R5                    ; F54A   0345 0004
        ANDR    R4,     R4                      ; F54C   01A4
        CMPR    R2,     R7                      ; F54D   0157
        RRC     R3,     2                       ; F54E   0077
        CLRC                                    ; F54F   0006
        MVI     G_0063, R1                      ; F550   0281 0063
        ADDR    R4,     R0                      ; F552   00E0
        SAR     R3,     1                       ; F553   006B
        COMR    R0                              ; F554   0018
        RRC     R3,     2                       ; F555   0077
        INCR    R0                              ; F556   0008
        MVII    #$0348, R4                      ; F557   02BC 0348
        SDBD                                    ; F559   0001
        MVI@    R5,     R0                      ; F55A   02A8
        MVO@    R0,     R4                      ; F55B   0260
        MVI@    R5,     R0                      ; F55C   02A8
        MVO@    R0,     R4                      ; F55D   0260
        ADDI    #$0006, R4                      ; F55E   02FC 0006
        MVI@    R5,     R0                      ; F560   02A8
        MVO@    R0,     R4                      ; F561   0260
        MVI@    R5,     R0                      ; F562   02A8
        MVO@    R0,     R4                      ; F563   0260
        ADDI    #$0006, R4                      ; F564   02FC 0006
        SDBD                                    ; F566   0001
        MVI@    R5,     R0                      ; F567   02A8
        MVO@    R0,     R4                      ; F568   0260
        SDBD                                    ; F569   0001
        MVI@    R5,     R0                      ; F56A   02A8
        MVO@    R0,     R4                      ; F56B   0260
        MVII    #$017D, R4                      ; F56C   02BC 017D
        MVII    #$0004, R0                      ; F56E   02B8 0004

        JSR     R5,     X_FILL_ZERO             ; F570   0004 0114 0338

        MVII    #$003C, R1                      ; F573   02B9 003C
        MVO     R1,     G_01EE                  ; F575   0241 01EE
        MVII    #$0001, R1                      ; F577   02B9 0001
        CLRR    R2                              ; F579   01D2
        B       L_F58A                          ; F57A   0200 000E

        DECLE   $0004,  $01A8,  $0079,  $0004   ; F57C   0004 01A8 0079 0004

        ANDR    R4,     R6                      ; F580   01A6
        CMP     .BTAB.B9,R5                     ; F581   0345 02B9
        RSWD    R1                              ; F583   0039
        MVO     R1,     G_01EE                  ; F584   0241 01EE
        MVII    #$0004, R1                      ; F586   02B9 0004
        MVII    #$0020, R2                      ; F588   02BA 0020
L_F58A:
        MVO     R1,     G_0103                  ; F58A   0241 0103
        MVO     R1,     G_0102                  ; F58C   0241 0102
        MVO     R2,     G_015D                  ; F58E   0242 015D
L_F590:
        EIS                                     ; F590   0002
        DECLE   $0280,  $0102,  $0010,  $0223   ; F591   0280 0102 0010 0223
        DECLE   $0005,  $0280,  $0103,  $0240   ; F595   0005 0280 0103 0240
        DECLE   $0102,  $0280,  $015D,  $0010   ; F599   0102 0280 015D 0010
        DECLE   $0240,  $015D,  $0204,  $00AD   ; F59D   0240 015D 0204 00AD
        DECLE   $0004                           ; F5A1   0004

        ANDR    R4,     R4                      ; F5A2   01A4
        ANDR    R5,     R4                      ; F5A3   01AC

        JSR     R5,     .EXEC.AAD               ; F5A4   0004 0118 02AD
        JSR     R5,     L_6DB7                  ; F5A7   0004 016C 01B7

        B       L_F590                          ; F5AA   0220 001B

        PSHR    R5                              ; F5AC   0275
        MVI     G_015E, R1                      ; F5AD   0281 015E
        INCR    R1                              ; F5AF   0009
        ADDR    R7,     R1                      ; F5B0   00F9
        ADD@    R1,     R7                      ; F5B1   02CF

        DECLE   $0005                           ; F5B2   0005

        SLR     R0,     1                       ; F5B3   0060
        SAR     R3,     2                       ; F5B4   006F
        RRC     R0,     1                       ; F5B5   0070
        COMR    R6                              ; F5B6   001E
        ANDI    #$001F, R0                      ; F5B7   03B8 001F
        BNEQ    L_F5C1                          ; F5B9   020C 0006

        MVI     G_01D2, R1                      ; F5BB   0281 01D2
        XORI    #$0006, R1                      ; F5BD   03F9 0006
        MVO     R1,     G_01D2                  ; F5BF   0241 01D2
L_F5C1:
        MVI     G_0174, R1                      ; F5C1   0281 0174
        DECLE   $02F9,  $0003,  $0301,  $01D2   ; F5C3   02F9 0003 0301 01D2
        DECLE   $0241,  $0174,  $0004,  $01A4   ; F5C7   0241 0174 0004 01A4
        DECLE   $01E2,  $0004                   ; F5CB   01E2 0004

        ANDR    R4,     R4                      ; F5CD   01A4
        XORR    R7,     R1                      ; F5CE   01F9
        PULR    R7                              ; F5CF   02B7

        DECLE   $0281,  $0174,  $0011,  $0241   ; F5D0   0281 0174 0011 0241
        DECLE   $0174,  $0379,  $0068,  $0205   ; F5D4   0174 0379 0068 0205
        DECLE   $0005,  $0281,  $0175,  $0009   ; F5D8   0005 0281 0175 0009
        DECLE   $0241,  $0175,  $0004           ; F5DC   0241 0175 0004

        ANDR    R4,     R4                      ; F5DF   01A4
        XORR    R4,     R2                      ; F5E0   01E2
        PULR    R7                              ; F5E1   02B7

        PSHR    R5                              ; F5E2   0275
        SDBD                                    ; F5E3   0001
        MVII    #$A5F8, R4                      ; F5E4   02BC 00F8 00A5
        MVII    #$016F, R3                      ; F5E7   02BB 016F
        MVII    #$0000, R0                      ; F5E9   02B8 0000

        JSR     R5,     L_55E5                  ; F5EB   0004 0154 01E5
        JSR     R5,     L_5E71                  ; F5EE   0004 015C 0271

        SDBD                                    ; F5F1   0001
        MVII    #$09A7, R0                      ; F5F2   02B8 00A7 0009
        MVO     R0,     G_0356                  ; F5F5   0240 0356
        PULR    R7                              ; F5F7   02B7

        MOVR    R4,     R3                      ; F5F8   00A3
        SDBD                                    ; F5F9   0001
        MVII    #$2000, R0                      ; F5FA   02B8 0000 0020
        MVII    #$0355, R4                      ; F5FD   02BC 0355
        B       L_F607                          ; F5FF   0200 0006

        SDBD                                    ; F601   0001
        MVII    #$0800, R0                      ; F602   02B8 0000 0008
        MVII    #$034D, R4                      ; F605   02BC 034D
L_F607:
        PSHR    R5                              ; F607   0275
        MOVR    R4,     R5                      ; F608   00A5
        MOVR    R0,     R1                      ; F609   0081
        MOVR    R0,     R2                      ; F60A   0082
        XOR@    R4,     R0                      ; F60B   03E0
        XOR@    R4,     R1                      ; F60C   03E1
        XOR@    R4,     R2                      ; F60D   03E2
        MVO@    R0,     R5                      ; F60E   0268
        MVO@    R1,     R5                      ; F60F   0269
        MVO@    R2,     R5                      ; F610   026A
        PULR    R7                              ; F611   02B7

        DECLE   $0280,  $0175,  $0008,  $0378   ; F612   0280 0175 0008 0378
        DECLE   $005C,  $020E,  $0008           ; F616   005C 020E 0008

        MVO     R0,     G_0175                  ; F619   0240 0175

        JSR     R5,     L_5E71                  ; F61B   0004 015C 0271
        DECLE   $0004,  $01A4,  $0201,  $02B7   ; F61E   0004 01A4 0201 02B7
        DECLE   $0004                           ; F622   0004

        ANDR    R5,     R0                      ; F623   01A8
        SARC    R1,     1                       ; F624   0079
        SDBD                                    ; F625   0001
        MVII    #$3800, R4                      ; F626   02BC 0000 0038
        MVI     G_015D, R1                      ; F629   0281 015D
        SUBI    #$0010, R1                      ; F62B   0339 0010
        BEQ     L_F635                          ; F62D   0204 0006
        BMI     L_F63A                          ; F62F   020B 0009

        ADDR    R1,     R4                      ; F631   00CC
        DECR    R4                              ; F632   0014
        CLRR    R0                              ; F633   01C0
        MVO@    R0,     R4                      ; F634   0260
L_F635:
        ADDR    R7,     R1                      ; F635   00F9
        ADDI    #$0008, R1                      ; F636   02F9 0008
        MVI@    R1,     R0                      ; F638   0288
        MVO@    R0,     R4                      ; F639   0260

L_F63A:
        JSR     R5,     L_5751                  ; F63A   0004 0154 0351

        PULR    R7                              ; F63D   02B7

        DECLE   $0003,  $000F,  $001F,  $003F   ; F63E   0003 000F 001F 003F
        DECLE   $007F,  $007F,  $00FF,  $00FF   ; F642   007F 007F 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; F646   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; F64A   00FF 00FF 00FF 00FF

        MVI     G_015E, R1                      ; F64E   0281 015E
        INCR    R1                              ; F650   0009
        ADDR    R7,     R1                      ; F651   00F9
        ADD@    R1,     R7                      ; F652   02CF

        DECLE   $0005,  $0023,  $002F,  $0035   ; F653   0005 0023 002F 0035
        DECLE   $0032,  $0001,  $02BC,  $0014   ; F657   0032 0001 02BC 0014
        DECLE   $0050,  $0274,  $0004,  $01A8   ; F65B   0050 0274 0004 01A8
        DECLE   $0079,  $0003,  $0004,  $01A4   ; F65F   0079 0003 0004 01A4
        DECLE   $037D,  $0004,  $0150,  $007D   ; F663   037D 0004 0150 007D
        DECLE   $0319,  $0001,  $0105,  $0000   ; F667   0319 0001 0105 0000
        DECLE   $0102,  $0090,  $0100,  $0051   ; F66B   0102 0090 0100 0051
        DECLE   $0101,  $0057,  $0000           ; F66F   0101 0057 0000

        PULR    R5                              ; F672   02B5
        J       L_5751                          ; F673   0004 0354 0351

        DECLE   $0240,  $0345,  $0240,  $0346   ; F676   0240 0345 0240 0346
        DECLE   $0240,  $0347,  $02B8,  $0002   ; F67A   0240 0347 02B8 0002
        DECLE   $0240,  $015E,  $0220,  $0136   ; F67E   0240 015E 0220 0136
        DECLE   $0004,  $03A8,  $008E,  $0004   ; F682   0004 03A8 008E 0004
        DECLE   $03A8,  $0091,  $00BD,  $02FD   ; F686   03A8 0091 00BD 02FD
        DECLE   $0008,  $0275,  $0006,  $0033   ; F68A   0008 0275 0006 0033
        DECLE   $0273,  $0200,  $0020,  $0004   ; F68E   0273 0200 0020 0004
        DECLE   $0150,  $007D,  $0174,  $0078   ; F692   0150 007D 0174 0078
        DECLE   $0175,  $0050,  $01D2,  $0004   ; F696   0175 0050 01D2 0004
        DECLE   $0103,  $0002,  $0102,  $0002   ; F69A   0103 0002 0102 0002
        DECLE   $015D,  $0078,  $015E,  $0004   ; F69E   015D 0078 015E 0004
        DECLE   $0000                           ; F6A2   0000

        JSR     R5,     L_5E71                  ; F6A3   0004 015C 0271

        B       L_F590                          ; F6A6   0220 0117

        DECLE   $0275,  $0033,  $0273,  $0004   ; F6A8   0275 0033 0273 0004
        DECLE   $01A8,  $0079,  $0004           ; F6AC   01A8 0079 0004

        ANDR    R4,     R6                      ; F6AF   01A6
        CMP     G_01C0, R5                      ; F6B0   0345 01C0
        MVO     R0,     G_0319                  ; F6B2   0240 0319
        MVII    #$0001, R0                      ; F6B4   02B8 0001
        MVO     R0,     G_0173                  ; F6B6   0240 0173

        JSR     R5,     L_507D                  ; F6B8   0004 0150 007D
        DECLE   $0175,  $0034,  $01D2,  $0002   ; F6BB   0175 0034 01D2 0002
        DECLE   $016F,  $0002,  $0174,  $0064   ; F6BF   016F 0002 0174 0064
        DECLE   $0000                           ; F6C3   0000

        PULR    R3                              ; F6C4   02B3
        RSWD    R3                              ; F6C5   003B
        BNC     L_F6D0                          ; F6C6   0209 0008

        ADDI    #$0010, R0                      ; F6C8   02F8 0010
        MVO     R0,     G_0174                  ; F6CA   0240 0174
        MVII    #$00C0, R0                      ; F6CC   02B8 00C0
        MVO     R0,     G_016F                  ; F6CE   0240 016F

L_F6D0:
        JSR     R5,     L_5E71                  ; F6D0   0004 015C 0271

        CLRR    R0                              ; F6D3   01C0
        MVO     R0,     G_0102                  ; F6D4   0240 0102
        MVO     R0,     G_015D                  ; F6D6   0240 015D
        PULR    R7                              ; F6D8   02B7

L_F6D9:
        SDBD                                    ; F6D9   0001
        MVI@    R5,     R0                      ; F6DA   02A8
        MVO@    R0,     R1                      ; F6DB   0248
        MVI@    R5,     R1                      ; F6DC   02A9
        TSTR    R1                              ; F6DD   0089
        BNEQ    L_F6D9                          ; F6DE   022C 0006
        MOVR    R5,     R7                      ; F6E0   00AF

        DECLE   $0275,  $02BC,  $0200,  $0001   ; F6E1   0275 02BC 0200 0001
        DECLE   $02BB,  $00DF,  $00A7,  $0004   ; F6E5   02BB 00DF 00A7 0004
        DECLE   $01A4,  $03AB,  $0280,  $025B   ; F6E9   01A4 03AB 0280 025B
        DECLE   $0240,  $0247,  $0240,  $024C   ; F6ED   0240 0247 0240 024C
        DECLE   $02BC,  $026F,  $02BD,  $025B   ; F6F1   02BC 026F 02BD 025B
        DECLE   $02A0,  $0001,  $02B9,  $0000   ; F6F5   02A0 0001 02B9 0000
        DECLE   $0006,  $0241,  $0298,  $0241   ; F6F9   0006 0241 0298 0241
        DECLE   $02AC,  $0241,  $02C0,  $02A1   ; F6FD   02AC 0241 02C0 02A1
        DECLE   $0268,  $0269,  $0034,  $0269   ; F701   0268 0269 0034 0269
        DECLE   $0269,  $0034,  $0269,  $0268   ; F705   0269 0034 0269 0268
        DECLE   $02FD,  $000E,  $02FC,  $0013   ; F709   02FD 000E 02FC 0013
        DECLE   $037D,  $02BF,  $022B,  $0010   ; F70D   037D 02BF 022B 0010
        DECLE   $02BD,  $02BD,  $0001,  $02B8   ; F711   02BD 02BD 0001 02B8
        DECLE   $0000,  $0022,  $0268,  $037D   ; F715   0000 0022 0268 037D
        DECLE   $02F0,  $022B,  $0004,  $01C0   ; F719   02F0 022B 0004 01C0
        DECLE   $0240,  $025A,  $0004           ; F71D   0240 025A 0004

        ANDR    R4,     R4                      ; F720   01A4
        ADD@    R3,     R4                      ; F721   02DC
        MVI@    R3,     R1                      ; F722   0299
        DIS                                     ; F723   0003
        INCR    R0                              ; F724   0008
        MVI@    R3,     R2                      ; F725   029A
        INCR    R3                              ; F726   000B
        INCR    R0                              ; F727   0008
        MVI@    R5,     R5                      ; F728   02AD
        SLL     R3,     1                       ; F729   004B
        INCR    R0                              ; F72A   0008
        MVI@    R5,     R6                      ; F72B   02AE
        SLL     R3,     1                       ; F72C   004B
        INCR    R0                              ; F72D   0008
        MVI@    R3,     R7                      ; F72E   029F

        DECLE   $0014,  $0008,  $02B4,  $001C   ; F72F   0014 0008 02B4 001C
        DECLE   $0008,  $02B2,  $0024,  $0008   ; F733   0008 02B2 0024 0008
        DECLE   $02AA,  $005C,  $0008,  $02C5   ; F737   02AA 005C 0008 02C5
        DECLE   $001D,  $0028,  $02C6,  $0015   ; F73B   001D 0028 02C6 0015
        DECLE   $0028,  $02B3,  $0015,  $0028   ; F73F   0028 02B3 0015 0028
        DECLE   $0000,  $02B7,  $0275,  $0004   ; F743   0000 02B7 0275 0004
        DECLE   $01A4,  $037D,  $02BC,  $0200   ; F747   01A4 037D 02BC 0200
        DECLE   $0001                           ; F74B   0001

        MVII    #$00DD, R3                      ; F74C   02BB 00DD
        MOVR    R4,     R7                      ; F74E   00A7

        DECLE   $0004                           ; F74F   0004

        ANDR    R4,     R4                      ; F750   01A4
        AND@    R5,     R3                      ; F751   03AB
        MVO     R0,     .STIC.VIDEN             ; F752   0240 0020
        MVII    #$0344, R4                      ; F754   02BC 0344
        CLRR    R0                              ; F756   01C0
        MVO@    R0,     R4                      ; F757   0260
        MVO@    R0,     R4                      ; F758   0260
        MVO@    R0,     R4                      ; F759   0260
        MVO@    R0,     R4                      ; F75A   0260
        MVO@    R0,     R4                      ; F75B   0260
        MVO@    R0,     R4                      ; F75C   0260
        MVII    #$0200, R3                      ; F75D   02BB 0200
        MVII    #$0070, R0                      ; F75F   02B8 0070
        ADDR    R3,     R0                      ; F761   00D8
        ADDR    R3,     R3                      ; F762   00DB
        MVO@    R0,     R4                      ; F763   0260
        ADDI    #$0007, R0                      ; F764   02F8 0007
        MVO@    R0,     R4                      ; F766   0260
        ADDI    #$0006, R4                      ; F767   02FC 0006
        MVII    #$01D0, R0                      ; F769   02B8 01D0
        MVO@    R0,     R4                      ; F76B   0260
        ADDR    R3,     R0                      ; F76C   00D8
        ADDR    R3,     R3                      ; F76D   00DB
        MVO@    R0,     R4                      ; F76E   0260
        ADDI    #$0006, R4                      ; F76F   02FC 0006
        MVO@    R3,     R4                      ; F771   0263
        MVO@    R3,     R4                      ; F772   0263
        SDBD                                    ; F773   0001
        MVII    #$5751, R0                      ; F774   02B8 0051 0057
        MVO     R0,     .ISRVEC.0               ; F777   0240 0100
        SWAP    R0,     1                       ; F779   0040
        MVO     R0,     .ISRVEC.1               ; F77A   0240 0101
        PULR    R7                              ; F77C   02B7

        PSHR    R5                              ; F77D   0275
        CLRR    R4                              ; F77E   01E4
        CLRR    R0                              ; F77F   01C0
        MVO@    R0,     R4                      ; F780   0260
        MVO@    R0,     R4                      ; F781   0260
        MVO@    R0,     R4                      ; F782   0260
        MVO@    R0,     R4                      ; F783   0260
        MVO@    R0,     R4                      ; F784   0260
        MVO@    R0,     R4                      ; F785   0260
        MVO@    R0,     R4                      ; F786   0260
        MVO@    R0,     R4                      ; F787   0260
        MVO     R0,     .STIC.MODE              ; F788   0240 0021
        MVO     R0,     .STIC.BORD              ; F78A   0240 002C
        SDBD                                    ; F78C   0001
        MVII    #$3800, R1                      ; F78D   02B9 0000 0038
        SDBD                                    ; F790   0001
        MVII    #$5341, R4                      ; F791   02BC 0041 0053

        JSR     R5,     L_5AC7                  ; F794   0004 0158 02C7
        DECLE   $0014                           ; F797   0014

        ADDI    #$0008, R1                      ; F798   02F9 0008

        JSR     R5,     L_5AC7                  ; F79A   0004 0158 02C7
        DECLE   $0002                           ; F79D   0002

        ADDI    #$0008, R1                      ; F79E   02F9 0008

        JSR     R5,     L_5AC7                  ; F7A0   0004 0158 02C7
        DECLE   $0008                           ; F7A3   0008

        MOVR    R1,     R4                      ; F7A4   008C
        MVII    #$0020, R1                      ; F7A5   02B9 0020

        JSR     R5,     L_5AE4                  ; F7A7   0004 0158 02E4

        PULR    R7                              ; F7AA   02B7

        PSHR    R5                              ; F7AB   0275
L_F7AC:
        INCR    R3                              ; F7AC   000B
        MVI@    R3,     R0                      ; F7AD   0298
        MOVR    R0,     R5                      ; F7AE   0085
        BEQ     L_F7CF                          ; F7AF   0204 001E

        ANDI    #$0007, R5                      ; F7B1   03BD 0007
        BEQ     L_F7C6                          ; F7B3   0204 0011

        SUBR    R5,     R0                      ; F7B5   0128
        BEQ     L_F7BC                          ; F7B6   0204 0004

        SDBD                                    ; F7B8   0001
        ADDI    #$0800, R0                      ; F7B9   02F8 0000 0008
L_F7BC:
        ADDR    R5,     R5                      ; F7BC   00ED
        SDBD                                    ; F7BD   0001
        ADDI    #$A7CE, R5                      ; F7BE   02FD 00CE 00A7
        SDBD                                    ; F7C1   0001
        ADD@    R5,     R0                      ; F7C2   02E8
        MVO@    R0,     R4                      ; F7C3   0260
        B       L_F7AC                          ; F7C4   0220 0019

L_F7C6:
        DECR    R4                              ; F7C6   0014
        MVI@    R4,     R1                      ; F7C7   02A1
L_F7C8:
        MVO@    R1,     R4                      ; F7C8   0261
        SUBI    #$0008, R0                      ; F7C9   0338 0008
        BNEQ    L_F7C8                          ; F7CB   022C 0004
        B       L_F7AC                          ; F7CD   0220 0022
L_F7CF:
        PULR    R7                              ; F7CF   02B7

        DECLE   $0001,  $0032,  $0000,  $0002   ; F7D0   0001 0032 0000 0002
        DECLE   $0004,  $0000,  $0003,  $0000   ; F7D4   0004 0000 0003 0000
        DECLE   $0005,  $0000,  $0004,  $0022   ; F7D8   0005 0000 0004 0022
        DECLE   $0005,  $0020,  $0001,  $0098   ; F7DC   0005 0020 0001 0098
        DECLE   $0001,  $0058,  $0011,  $0019   ; F7E0   0001 0058 0011 0019
        DECLE   $0001,  $0068,  $0011,  $0019   ; F7E4   0001 0068 0011 0019
        DECLE   $0001,  $0011,  $0002,  $0002   ; F7E8   0001 0011 0002 0002
        DECLE   $0019,  $0001,  $0011,  $0019   ; F7EC   0019 0001 0011 0019
        DECLE   $0001,  $0030,  $0011,  $0019   ; F7F0   0001 0030 0011 0019
        DECLE   $0011,  $0002,  $0002,  $0021   ; F7F4   0011 0002 0002 0021
        DECLE   $0002,  $0012,  $001A,  $0002   ; F7F8   0002 0012 001A 0002
        DECLE   $0021,  $0012,  $001A,  $0019   ; F7FC   0021 0012 001A 0019
        DECLE   $0001,  $0019,  $0011,  $0019   ; F800   0001 0019 0011 0019
        DECLE   $0001                           ; F804   0001

        DECR    R1                              ; F805   0011
        EIS                                     ; F806   0002
        NEGR    R0                              ; F807   0020
        DECR    R2                              ; F808   0012
        NEGR    R2                              ; F809   0022
        DIS                                     ; F80A   0003
        DIS                                     ; F80B   0003
        COMR    R2                              ; F80C   001A
        DECR    R2                              ; F80D   0012
        DIS                                     ; F80E   0003
        DIS                                     ; F80F   0003
        COMR    R2                              ; F810   001A
        COMR    R1                              ; F811   0019
        EIS                                     ; F812   0002
        DECR    R0                              ; F813   0010
        NEGR    R1                              ; F814   0021
        EIS                                     ; F815   0002
        NEGR    R0                              ; F816   0020
        DECR    R2                              ; F817   0012
        NEGR    R2                              ; F818   0022
        ADCR    R4                              ; F819   002C
        DIS                                     ; F81A   0003
        COMR    R0                              ; F81B   0018
        ADCR    R4                              ; F81C   002C
        DIS                                     ; F81D   0003
        DIS                                     ; F81E   0003
        COMR    R2                              ; F81F   001A
        EIS                                     ; F820   0002
        EIS                                     ; F821   0002
        DECR    R2                              ; F822   0012
        NEGR    R2                              ; F823   0022
        COMR    R2                              ; F824   001A
        EIS                                     ; F825   0002
        EIS                                     ; F826   0002
        DECR    R2                              ; F827   0012
        NEGR    R2                              ; F828   0022
        DIS                                     ; F829   0003
        DECR    R3                              ; F82A   0013
        NOP                                     ; F82B   0034
        RSWD    R4                              ; F82C   003C
        COMR    R0                              ; F82D   0018
        NOP                                     ; F82E   0034
        DIS                                     ; F82F   0003
        DECR    R0                              ; F830   0010
        EIS                                     ; F831   0002
        DECR    R2                              ; F832   0012
        DIS                                     ; F833   0003
        DECR    R0                              ; F834   0010
        COMR    R2                              ; F835   001A
        DECR    R2                              ; F836   0012
        DIS                                     ; F837   0003
        DIS                                     ; F838   0003
        DECR    R3                              ; F839   0013
        RLC     R3,     1                       ; F83A   0053
        NOP                                     ; F83B   0034
        SWAP    R0,     2                       ; F83C   0044
        COMR    R0                              ; F83D   0018
        NOP                                     ; F83E   0034
        DIS                                     ; F83F   0003
        SWAP    R0,     1                       ; F840   0040
        DECR    R3                              ; F841   0013
        COMR    R3                              ; F842   001B
        DECR    R3                              ; F843   0013
        SETC                                    ; F844   0007
        RLC     R3,     1                       ; F845   0053
        NOP                                     ; F846   0034
        SLR     R0,     2                       ; F847   0064
        COMR    R0                              ; F848   0018
        NOP                                     ; F849   0034
        COMR    R3                              ; F84A   001B
        DIS                                     ; F84B   0003
        NEGR    R0                              ; F84C   0020
        DECR    R3                              ; F84D   0013
        COMR    R3                              ; F84E   001B
        DECR    R3                              ; F84F   0013
        SETC                                    ; F850   0007
        COMR    R0                              ; F851   0018
        RLC     R3,     1                       ; F852   0053
        NOP                                     ; F853   0034
        SLR     R0,     2                       ; F854   0064
        COMR    R0                              ; F855   0018
        NOP                                     ; F856   0034
        SETC                                    ; F857   0007
        COMR    R3                              ; F858   001B
        DECR    R3                              ; F859   0013
        DIS                                     ; F85A   0003
        DIS                                     ; F85B   0003
        DECR    R3                              ; F85C   0013
L_F85D:
        DECR    R7                              ; F85D   0017

        DECLE   $0006,  $001F                   ; F85E   0006 001F
L_F860:
        DECR    R7                              ; F860   0017

        DECLE   $001F                           ; F861   001F
L_F862:
        DECR    R7                              ; F862   0017

        DECLE   $0006,  $005D,  $0034,  $0064   ; F863   0006 005D 0034 0064
        DECLE   $0018,  $0034,  $001E,  $0007   ; F867   0018 0034 001E 0007
        DECLE   $0007,  $0006,  $001F           ; F86B   0007 0006 001F
L_F86E:
        DECR    R7                              ; F86E   0017

        CLRC                                    ; F86F   0006
        DECR    R6                              ; F870   0016
L_F871:
        DECR    R7                              ; F871   0017

        DECLE   $0006,  $0048,  $0016,  $0006   ; F872   0006 0048 0016 0006
        DECLE   $001F                           ; F876   001F
L_F877:
        DECR    R7                              ; F877   0017

        DECLE   $0000                           ; F878   0000

        PSHR    R5                              ; F879   0275
        MVI     .ISRVEC.0,R1                    ; F87A   0281 0100
        MVI     .ISRVEC.1,R2                    ; F87C   0282 0101
        MOVR    R7,     R0                      ; F87E   00B8
        ADDI    #$0008, R0                      ; F87F   02F8 0008
        MVO     R0,     .ISRVEC.0               ; F881   0240 0100
        SWAP    R0,     1                       ; F883   0040
        MVO     R0,     .ISRVEC.1               ; F884   0240 0101
L_F886:
        DECR    R7                              ; F886   0017

        SUBI    #$0008, R6                      ; F887   033E 0008
        MVO     R1,     .ISRVEC.0               ; F889   0241 0100
        MVO     R2,     .ISRVEC.1               ; F88B   0242 0101
        PULR    R7                              ; F88D   02B7

        DECLE   $01C0,  $0240,  $010E,  $0004   ; F88E   01C0 0240 010E 0004

        ANDR    R5,     R0                      ; F892   01A8
        ANDR    R1,     R5                      ; F893   018D

        JSR     R5,     L_6D77                  ; F894   0004 016C 0177

        MVI     G_0107, R0                      ; F897   0280 0107
        SLR     R0,     2                       ; F899   0064
        SLR     R0,     1                       ; F89A   0060
        MVO     R0,     G_034C                  ; F89B   0240 034C
        MVI     G_0108, R0                      ; F89D   0280 0108
        SLR     R0,     2                       ; F89F   0064
        SLR     R0,     1                       ; F8A0   0060
        MVO     R0,     G_034D                  ; F8A1   0240 034D
        MVI     G_0109, R0                      ; F8A3   0280 0109
        SLR     R0,     2                       ; F8A5   0064
        SLR     R0,     1                       ; F8A6   0060
        MVO     R0,     G_034E                  ; F8A7   0240 034E
        MVI     G_010B, R0                      ; F8A9   0280 010B
        SWAP    R0,     1                       ; F8AB   0040
        ADD     G_010A, R0                      ; F8AC   02C0 010A
        MVO     R0,     G_034F                  ; F8AE   0240 034F
        MVI     G_01DF, R0                      ; F8B0   0280 01DF
        SWAP    R0,     1                       ; F8B2   0040
        ADD     G_01DE, R0                      ; F8B3   02C0 01DE
        MVO     R0,     G_0350                  ; F8B5   0240 0350
        MVI     G_01D4, R1                      ; F8B7   0281 01D4
        MOVR    R1,     R0                      ; F8B9   0088
        BEQ     L_F8C2                          ; F8BA   0204 0006

        ANDI    #$000F, R1                      ; F8BC   03B9 000F
        ADDI    #$012A, R1                      ; F8BE   02F9 012A
        MVI@    R1,     R0                      ; F8C0   0288
        INCR    R7                              ; F8C1   000F

L_F8C2:
        DECR    R0                              ; F8C2   0010
L_F8C3:
        ANDI    #$00FF, R0                      ; F8C3   03B8 00FF
        DECLE   $0240,  $0351,  $0280,  $0112   ; F8C5   0240 0351 0280 0112
        DECLE   $004C,  $004C,  $02C0,  $01EF   ; F8C9   004C 004C 02C0 01EF
        DECLE   $0240,  $0352,  $02BB,  $0353   ; F8CD   0240 0352 02BB 0353
        DECLE   $0004,  $01A8,  $01C7           ; F8D1   0004 01A8 01C7

        CLRR    R0                              ; F8D4   01C0
        MVI     G_0352, R3                      ; F8D5   0283 0352
        SARC    R3,     1                       ; F8D7   007B
        ADCR    R0                              ; F8D8   0028
        SLL     R0,     2                       ; F8D9   004C
        SLL     R0,     2                       ; F8DA   004C
        SWAP    R0,     1                       ; F8DB   0040
        MVI     G_0353, R2                      ; F8DC   0282 0353
        ANDI    #$000F, R2                      ; F8DE   03BA 000F
        ADDR    R2,     R0                      ; F8E0   00D0
        MVI     G_0351, R1                      ; F8E1   0281 0351
        ANDI    #$00F0, R1                      ; F8E3   03B9 00F0
        ADDR    R1,     R0                      ; F8E5   00C8
        XOR     G_0351, R1                      ; F8E6   03C1 0351
        MVI     G_031C, R2                      ; F8E8   0282 031C
        SDBD                                    ; F8EA   0001
        ANDI    #$0F00, R2                      ; F8EB   03BA 0000 000F
        ADDR    R2,     R0                      ; F8EE   00D0
        XOR     G_031C, R2                      ; F8EF   03C2 031C
        MVO     R0,     G_0354                  ; F8F1   0240 0354
        MOVR    R3,     R0                      ; F8F3   0098
        SLR     R3,     2                       ; F8F4   0067
        SLR     R3,     2                       ; F8F5   0067
        SLR     R3,     1                       ; F8F6   0063
        ANDI    #$001F, R0                      ; F8F7   03B8 001F
        SWAP    R0,     1                       ; F8F9   0040
        ADDR    R0,     R1                      ; F8FA   00C1
        MVI     G_0353, R0                      ; F8FB   0280 0353
        ANDI    #$00F0, R0                      ; F8FD   03B8 00F0
        ADDR    R0,     R1                      ; F8FF   00C1
        MVO     R1,     G_0355                  ; F900   0241 0355
        MOVR    R2,     R0                      ; F902   0090
        ANDI    #$00F0, R0                      ; F903   03B8 00F0
        XORR    R0,     R2                      ; F905   01C2
        SWAP    R2,     1                       ; F906   0042
        SARC    R3,     1                       ; F907   007B
        BNC     L_F90E                          ; F908   0209 0004

        SDBD                                    ; F90A   0001
        ADDI    #$1000, R2                      ; F90B   02FA 0000 0010
L_F90E:
        MVI     G_0353, R1                      ; F90E   0281 0353
        DECLE   $0041,  $03B9,  $00FF,  $0271   ; F910   0041 03B9 00FF 0271
        DECLE   $03B9,  $000F,  $00CA,  $0242   ; F914   03B9 000F 00CA 0242
        DECLE   $0356,  $03F1,  $0064,  $0064   ; F918   0356 03F1 0064 0064
        DECLE   $00C8,  $0043,  $00C3,  $0243   ; F91C   00C8 0043 00C3 0243
        DECLE   $0357,  $0280,  $010E,  $0080   ; F920   0357 0280 010E 0080
        DECLE   $0204,  $0029,  $0004           ; F924   0204 0029 0004

        ANDR    R2,     R0                      ; F927   0190
        ADCR    R2                              ; F928   002A
        MOVR    R5,     R3                      ; F929   00AB
        BNC     L_F94F                          ; F92A   0209 0023

        SDBD                                    ; F92C   0001
        MVII    #$0907, R3                      ; F92D   02BB 0007 0009
        MVII    #$0265, R4                      ; F930   02BC 0265
        MVI     G_0354, R0                      ; F932   0280 0354

        JSR     R5,     L_FF68                  ; F934   0004 01FC 0368

        MVII    #$0069, R5                      ; F937   02BD 0069
        MVO@    R5,     R4                      ; F939   0265
        MVI     G_0355, R0                      ; F93A   0280 0355

        JSR     R5,     L_FF68                  ; F93C   0004 01FC 0368

        MVII    #$0069, R5                      ; F93F   02BD 0069
        MVO@    R5,     R4                      ; F941   0265
        MVI     G_0356, R0                      ; F942   0280 0356

        JSR     R5,     L_FF68                  ; F944   0004 01FC 0368

        MVII    #$0069, R5                      ; F947   02BD 0069
        MVO@    R5,     R4                      ; F949   0265
        MVI     G_0357, R0                      ; F94A   0280 0357

        JSR     R5,     L_FF68                  ; F94C   0004 01FC 0368

L_F94F:
        SDBD                                    ; F94F   0001
        MVII    #$0803, R3                      ; F950   02BB 0003 0008
        SDBD                                    ; F953   0001
        MVII    #$AD4D, R5                      ; F954   02BD 004D 00AD
        ADD     G_0112, R5                      ; F957   02C5 0112
        SDBD                                    ; F959   0001
        MVII    #$ACC1, R4                      ; F95A   02BC 00C1 00AC
        ADD@    R5,     R4                      ; F95D   02EC
        MVI@    R4,     R0                      ; F95E   02A0
        ADDI    #$0064, R0                      ; F95F   02F8 0064

        JSR     R5,     L_51C5                  ; F961   0004 0150 01C5

        SDBD                                    ; F964   0001
        MVII    #$AD58, R5                      ; F965   02BD 0058 00AD
        ADD     G_01EF, R5                      ; F968   02C5 01EF
        SDBD                                    ; F96A   0001
        MVII    #$ACC1, R4                      ; F96B   02BC 00C1 00AC
        ADD@    R5,     R4                      ; F96E   02EC
        MVI@    R4,     R0                      ; F96F   02A0
        ADDI    #$0078, R0                      ; F970   02F8 0078

        JSR     R5,     L_51C5                  ; F972   0004 0150 01C5
        JSR     R5,     .EXEC.4C3               ; F975   0004 0114 00C3

        DIS                                     ; F978   0003
        MVII    #$02F1, R6                      ; F979   02BE 02F1
        SDBD                                    ; F97B   0001
        MVII    #$0026, R0                      ; F97C   02B8 0026 0000
        SDBD                                    ; F97F   0001
        MVII    #$0011, R1                      ; F980   02B9 0011 0000
        MVO     R0,     .ISRVEC.0               ; F983   0240 0100
        MVO     R1,     .ISRVEC.1               ; F985   0241 0101

        JSR     R5,     .EXEC.A83               ; F987   0004 0118 0283

        J       .EXEC.041                       ; F98A   0004 0310 0041

        DECLE   $0275,  $0004                   ; F98D   0275 0004

        ANDR    R5,     R0                      ; F98F   01A8
        SARC    R1,     1                       ; F990   0079
        DIS                                     ; F991   0003
        CLRR    R0                              ; F992   01C0
        MVO     R0,     .STIC.CS.0              ; F993   0240 0028
        MVO     R0,     .STIC.BORD              ; F995   0240 002C
        SDBD                                    ; F997   0001
        MVII    #$5209, R4                      ; F998   02BC 0009 0052
        SDBD                                    ; F99B   0001
        MVII    #$3800, R1                      ; F99C   02B9 0000 0038

        JSR     R5,     L_5AC7                  ; F99F   0004 0158 02C7
        DECLE   $001C                           ; F9A2   001C

        ADDI    #$0020, R1                      ; F9A3   02F9 0020

        JSR     R5,     L_5AC7                  ; F9A5   0004 0158 02C7
        DECLE   $000A                           ; F9A8   000A

        MOVR    R7,     R4                      ; F9A9   00BC
        ADDI    #$0041, R4                      ; F9AA   02FC 0041

        JSR     R5,     L_51C9                  ; F9AC   0004 0150 01C9

        MVII    #$0344, R4                      ; F9AF   02BC 0344
        MVII    #$0014, R0                      ; F9B1   02B8 0014

        JSR     R5,     X_FILL_ZERO             ; F9B3   0004 0114 0338

        MVII    #$017D, R4                      ; F9B6   02BC 017D
        MVII    #$0004, R0                      ; F9B8   02B8 0004

        JSR     R5,     X_FILL_ZERO             ; F9BA   0004 0114 0338

        CLRR    R4                              ; F9BD   01E4
        MVO@    R0,     R4                      ; F9BE   0260
        MVO@    R0,     R4                      ; F9BF   0260
        EIS                                     ; F9C0   0002
        PULR    R7                              ; F9C1   02B7

        MVO     R0,     G_035E                  ; F9C2   0240 035E
        ADD@    R3,     R0                      ; F9C4   02D8
        MVO@    R0,     R3                      ; F9C5   0258
        MOVR    R5,     R7                      ; F9C6   00AF

        DECLE   $0275,  $0280,  $031C,  $0258   ; F9C7   0275 0280 031C 0258
        DECLE   $0004,  $01A8,  $01C2,  $02BC   ; F9CB   0004 01A8 01C2 02BC
        DECLE   $034C,  $02A0,  $004C,  $004C   ; F9CF   034C 02A0 004C 004C
        DECLE   $02E0,  $004C,  $004C,  $02E0   ; F9D3   02E0 004C 004C 02E0
        DECLE   $0004,  $01A8,  $01C2,  $02A0   ; F9D7   0004 01A8 01C2 02A0
        DECLE   $03E0,  $0004,  $01A8,  $01C2   ; F9DB   03E0 0004 01A8 01C2
        DECLE   $02A0,  $0040,  $02C0,  $0110   ; F9DF   02A0 0040 02C0 0110
        DECLE   $0004,  $01A8,  $01C2,  $02A0   ; F9E3   0004 01A8 01C2 02A0
        DECLE   $0004                           ; F9E7   0004

        ANDR    R5,     R0                      ; F9E8   01A8
        XORR    R0,     R2                      ; F9E9   01C2
        PULR    R7                              ; F9EA   02B7

        DECLE   $03F8,  $0274,  $0245,  $01C7   ; F9EB   03F8 0274 0245 01C7
        DECLE   $0288,  $03EC,  $0274,  $002D   ; F9EF   0288 03EC 0274 002D
        DECLE   $012E,  $003B,  $03EC,  $0089   ; F9F3   012E 003B 03EC 0089
        DECLE   $020C,  $01ED                   ; F9F7   020C 01ED

        NEGR    R3                              ; F9F9   0023
        SUBI    #$03EA, R3                      ; F9FA   033B 03EA
        MVI@    R1,     R7                      ; F9FC   028F

        DECLE   $02E5,  $025B,  $0196,  $019B   ; F9FD   02E5 025B 0196 019B
        DECLE   $03FA,  $00B8,  $0205,  $0249   ; FA01   03FA 00B8 0205 0249
        DECLE   $00AE,  $0065,  $037B,  $0292   ; FA05   00AE 0065 037B 0292
        DECLE   $00A1,  $0275,  $0245,  $03F4   ; FA09   00A1 0275 0245 03F4
        DECLE   $03F4,  $03FE,  $03FE,  $0000   ; FA0D   03F4 03FE 03FE 0000

        PSHR    R5                              ; FA11   0275
        SDBD                                    ; FA12   0001
        MVII    #$0907, R2                      ; FA13   02BA 0007 0009
        MVI@    R5,     R1                      ; FA16   02A9
        ADDI    #$0005, R1                      ; FA17   02F9 0005
        MVO@    R2,     R1                      ; FA19   024A
        MVII    #$0005, R0                      ; FA1A   02B8 0005
        PULR    R5                              ; FA1C   02B5
        MVII    #$0001, R4                      ; FA1D   02BC 0001
        B       L_FA28                          ; FA1F   0200 0007

        MVII    #$0004, R0                      ; FA21   02B8 0004
        B       L_FA27                          ; FA23   0200 0002

        MVII    #$0002, R0                      ; FA25   02B8 0002
L_FA27:
        CLRR    R4                              ; FA27   01E4
L_FA28:
        MVI@    R5,     R1                      ; FA28   02A9
        PSHR    R5                              ; FA29   0275
        MOVR    R7,     R5                      ; FA2A   00BD
        ADDI    #$001C, R5                      ; FA2B   02FD 001C
        PSHR    R5                              ; FA2D   0275
        ADDR    R0,     R1                      ; FA2E   00C1
        ADDR    R1,     R4                      ; FA2F   00CC
        DECR    R1                              ; FA30   0011
        CLRR    R2                              ; FA31   01D2
        MVII    #$0007, R3                      ; FA32   02BB 0007
        MOVR    R3,     R5                      ; FA34   009D
        ADDI    #$01F8, R5                      ; FA35   02FD 01F8
        MVO     R4,     G_0104                  ; FA37   0244 0104
        MVO@    R5,     R4                      ; FA39   0265

        JSR     R5,     .EXEC.910               ; FA3A   0004 0118 0110

        PULR    R5                              ; FA3D   02B5
        PULR    R5                              ; FA3E   02B5
        PULR    R5                              ; FA3F   02B5
        MVI     G_0104, R4                      ; FA40   0284 0104
        ADDI    #$0200, R4                      ; FA42   02FC 0200
        CLRR    R5                              ; FA44   01ED
        MVO@    R5,     R4                      ; FA45   0265
        PULR    R7                              ; FA46   02B7

        DECLE   $0004,  $0190,  $0041,  $0019   ; FA47   0004 0190 0041 0019
        DECLE   $0004                           ; FA4B   0004

        ANDR    R5,     R0                      ; FA4C   01A8
        SARC    R1,     1                       ; FA4D   0079

        JSR     R5,     L_5751                  ; FA4E   0004 0154 0351
        DECLE   $0004,  $019C,  $0101,  $0220   ; FA51   0004 019C 0101 0220
        DECLE   $000A                           ; FA55   000A

        CMPI    #$000B, R0                      ; FA56   0378 000B
        BLT     L_FA60                          ; FA58   0205 0006
        BEQ     L_FA5F                          ; FA5A   0204 0003

        MVII    #$000B, R0                      ; FA5C   02B8 000B
        INCR    R7                              ; FA5E   000F

L_FA5F:
        CLRR    R0                              ; FA5F   01C0
L_FA60:
        CLRR    R1                              ; FA60   01C9

        JSR     R5,     .EXEC.94C               ; FA61   0004 0118 014C

        MVI     G_0132, R1                      ; FA64   0281 0132
        ADDI    #$0200, R1                      ; FA66   02F9 0200
        MVI@    R1,     R0                      ; FA68   0288
        MOVR    R0,     R2                      ; FA69   0082

        JSR     R5,     X_CLAMP                 ; FA6A   0004 0114 0270

        MOVR    R0,     R7                      ; FA6D   0087
        ADDR    R1,     R7                      ; FA6E   00CF

        CMPR    R2,     R0                      ; FA6F   0150
        BNEQ    L_FA77                          ; FA70   020C 0005

        SDBD                                    ; FA72   0001
        ADDI    #$0880, R0                      ; FA73   02F8 0080 0008
        MVO@    R0,     R1                      ; FA76   0248
L_FA77:
        PULR    R7                              ; FA77   02B7

        DECLE   $0000,  $0000,  $003C,  $0018   ; FA78   0000 0000 003C 0018
        DECLE   $002C,  $005E,  $007E,  $003C   ; FA7C   002C 005E 007E 003C
        DECLE   $0000,  $003C,  $0018,  $0018   ; FA80   0000 003C 0018 0018
        DECLE   $002C,  $005E,  $007E,  $007E   ; FA84   002C 005E 007E 007E
        DECLE   $0000,  $0006,  $006C,  $009A   ; FA88   0000 0006 006C 009A
        DECLE   $00C6,  $007C,  $0038,  $0000   ; FA8C   00C6 007C 0038 0000
        DECLE   $00F8,  $00B8,  $0000,  $0070   ; FA90   00F8 00B8 0000 0070
        DECLE   $0070,  $0068,  $007F,  $006F   ; FA94   0070 0068 007F 006F
        DECLE   $0038,  $006C,  $0038,  $007C   ; FA98   0038 006C 0038 007C
        DECLE   $00C6,  $0082,  $0044,  $0038   ; FA9C   00C6 0082 0044 0038
        DECLE   $003C,  $004E,  $0045,  $0028   ; FAA0   003C 004E 0045 0028
        DECLE   $007E,  $00B9,  $003C,  $003E   ; FAA4   007E 00B9 003C 003E
        DECLE   $0008,  $0010,  $003A,  $007C   ; FAA8   0008 0010 003A 007C
        DECLE   $00B8,  $0010,  $0020,  $0000   ; FAAC   00B8 0010 0020 0000
        DECLE   $0004,  $0008,  $001D,  $0036   ; FAB0   0004 0008 001D 0036
        DECLE   $006C,  $00B8,  $0010,  $0020   ; FAB4   006C 00B8 0010 0020
        DECLE   $0010,  $0028,  $0044,  $0062   ; FAB8   0010 0028 0044 0062
        DECLE   $0074,  $003A,  $001C,  $0008   ; FABC   0074 003A 001C 0008
        DECLE   $0000,  $0000,  $0040,  $00EA   ; FAC0   0000 0000 0040 00EA
        DECLE   $00BE,  $00E0,  $0040,  $0000   ; FAC4   00BE 00E0 0040 0000
        DECLE   $0044,  $0092,  $0028,  $0092   ; FAC8   0044 0092 0028 0092
        DECLE   $0000,  $0010,  $0010,  $0010   ; FACC   0000 0010 0010 0010
        DECLE   $0000,  $0010,  $0038,  $0010   ; FAD0   0000 0010 0038 0010
        DECLE   $0038,  $005C,  $007C,  $0038   ; FAD4   0038 005C 007C 0038
        DECLE   $0000,  $0000,  $0000,  $0008   ; FAD8   0000 0000 0000 0008
        DECLE   $0010,  $0060,  $0020,  $0000   ; FADC   0010 0060 0020 0000
        DECLE   $0010,  $0008,  $0004,  $0004   ; FAE0   0010 0008 0004 0004
        DECLE   $0004,  $0004,  $0008,  $0010   ; FAE4   0004 0004 0008 0010
        DECLE   $0000,  $0018,  $001C,  $000E   ; FAE8   0000 0018 001C 000E
        DECLE   $0016,  $0020,  $0040,  $0080   ; FAEC   0016 0020 0040 0080
        DECLE   $0000,  $0028,  $003C,  $003C   ; FAF0   0000 0028 003C 003C
        DECLE   $0028,  $0020,  $0020,  $0020   ; FAF4   0028 0020 0020 0020
        DECLE   $0000,  $0006,  $0006,  $0008   ; FAF8   0000 0006 0006 0008
        DECLE   $0010,  $0020,  $0040,  $0080   ; FAFC   0010 0020 0040 0080
        DECLE   $0000,  $0000,  $0000,  $0004   ; FB00   0000 0000 0000 0004
        DECLE   $0008,  $0050,  $0020,  $0050   ; FB04   0008 0050 0020 0050
        DECLE   $0038,  $007C,  $0038,  $0010   ; FB08   0038 007C 0038 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; FB0C   0010 0010 0010 0010
        DECLE   $0000,  $0002,  $0004,  $0008   ; FB10   0000 0002 0004 0008
        DECLE   $0090,  $00A0,  $0040,  $00B0   ; FB14   0090 00A0 0040 00B0
        DECLE   $0003,  $0007,  $000E,  $001C   ; FB18   0003 0007 000E 001C
        DECLE   $00B8,  $00F0,  $0060,  $00B0   ; FB1C   00B8 00F0 0060 00B0
        DECLE   $0000,  $000C,  $000C,  $000C   ; FB20   0000 000C 000C 000C
        DECLE   $004C,  $00AC,  $00BC,  $007F   ; FB24   004C 00AC 00BC 007F
        DECLE   $0000,  $0000,  $0000,  $006C   ; FB28   0000 0000 0000 006C
        DECLE   $0082,  $0054,  $0000,  $0000   ; FB2C   0082 0054 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; FB30   0000 0000 0000 0010
        DECLE   $0028,  $0054,  $00AA,  $0000   ; FB34   0028 0054 00AA 0000
        DECLE   $0081,  $0081,  $0042,  $0024   ; FB38   0081 0081 0042 0024
        DECLE   $0018,  $0024,  $0018,  $0000   ; FB3C   0018 0024 0018 0000
        DECLE   $0000,  $0000,  $0028,  $0054   ; FB40   0000 0000 0028 0054
        DECLE   $0038,  $0054,  $0028,  $0000   ; FB44   0038 0054 0028 0000
        DECLE   $0000,  $0028,  $0082,  $0000   ; FB48   0000 0028 0082 0000
        DECLE   $0038,  $0044,  $0028,  $0010   ; FB4C   0038 0044 0028 0010
        DECLE   $0000,  $0010,  $0028,  $0092   ; FB50   0000 0010 0028 0092
        DECLE   $00FE,  $00AA,  $00FE,  $0000   ; FB54   00FE 00AA 00FE 0000
        DECLE   $0010,  $0082,  $0000,  $007C   ; FB58   0010 0082 0000 007C
        DECLE   $00AA,  $0054,  $0028,  $0010   ; FB5C   00AA 0054 0028 0010
        DECLE   $0000,  $0000,  $0000,  $0070   ; FB60   0000 0000 0000 0070
        DECLE   $00F9,  $00FE,  $0071,  $0000   ; FB64   00F9 00FE 0071 0000
        DECLE   $0054,  $0082,  $0051,  $000A   ; FB68   0054 0082 0051 000A
        DECLE   $0004,  $000E,  $0004,  $0004   ; FB6C   0004 000E 0004 0004
        DECLE   $0000                           ; FB70   0000

        RSWD    R6                              ; FB71   003E
        RSWD    R6                              ; FB72   003E
        RSWD    R6                              ; FB73   003E
        COMR    R4                              ; FB74   001C
        INCR    R0                              ; FB75   0008
        INCR    R0                              ; FB76   0008
        COMR    R4                              ; FB77   001C
        PSHR    R5                              ; FB78   0275
        CLRR    R3                              ; FB79   01DB
        MVII    #$000F, R0                      ; FB7A   02B8 000F
        MVII    #$0113, R5                      ; FB7C   02BD 0113
        MOVR    R5,     R4                      ; FB7E   00AC
L_FB7F:
        MVI@    R5,     R1                      ; FB7F   02A9
        XORI    #$0080, R1                      ; FB80   03F9 0080
        MVO@    R1,     R4                      ; FB82   0261
        DECR    R0                              ; FB83   0010
        BNEQ    L_FB7F                          ; FB84   022C 0006

        MVII    #$001E, R1                      ; FB86   02B9 001E
        MVII    #$026E, R4                      ; FB88   02BC 026E
L_FB8A:
        MVII    #$0001, R0                      ; FB8A   02B8 0001
        MOVR    R4,     R5                      ; FB8C   00A5
        MVI@    R5,     R2                      ; FB8D   02AA
        RLC     R2,     2                       ; FB8E   0056
        RRC     R0,     2                       ; FB8F   0074
        RRC     R2,     2                       ; FB90   0076
        MVO@    R2,     R4                      ; FB91   0262
        DECR    R1                              ; FB92   0011
        BNEQ    L_FB8A                          ; FB93   022C 000A
        PULR    R7                              ; FB95   02B7

        PSHR    R3                              ; FB96   0273
        MVI@    R5,     R3                      ; FB97   02AB
        ADD@    R3,     R0                      ; FB98   02D8
        MVO@    R0,     R3                      ; FB99   0258
        INCR    R3                              ; FB9A   000B
        SWAP    R0,     1                       ; FB9B   0040
        ADD@    R3,     R0                      ; FB9C   02D8
        MVO@    R0,     R3                      ; FB9D   0258
        SWAP    R0,     1                       ; FB9E   0040
        PULR    R3                              ; FB9F   02B3
        MOVR    R5,     R7                      ; FBA0   00AF

        DECLE   $02A8,  $0275,  $0004,  $01A8   ; FBA1   02A8 0275 0004 01A8
        DECLE   $0396,  $010A,  $0271,  $0272   ; FBA5   0396 010A 0271 0272
        DECLE   $0273,  $0274,  $0004,  $01A8   ; FBA9   0273 0274 0004 01A8
        DECLE   $03C1,  $0341,  $01E0,  $0204   ; FBAD   03C1 0341 01E0 0204
        DECLE   $000A,  $0241,  $01E0,  $0004   ; FBB1   000A 0241 01E0 0004

        ANDR    R5,     R0                      ; FBB5   01A8
        XOR@    R3,     R2                      ; FBB6   03DA
        MVO     R2,     G_010F                  ; FBB7   0242 010F

        JSR     R5,     L_54BD                  ; FBB9   0004 0154 00BD

        PULR    R4                              ; FBBC   02B4
        PULR    R3                              ; FBBD   02B3
        PULR    R2                              ; FBBE   02B2
        PULR    R1                              ; FBBF   02B1
        PULR    R7                              ; FBC0   02B7

        PSHR    R5                              ; FBC1   0275
        MVI     G_010B, R1                      ; FBC2   0281 010B
        SWAP    R1,     1                       ; FBC4   0041
        ADD     G_010A, R1                      ; FBC5   02C1 010A
        PSHR    R3                              ; FBC7   0273
        CLRR    R0                              ; FBC8   01C0
        MVII    #$0001, R3                      ; FBC9   02BB 0001
        MVII    #$0064, R2                      ; FBCB   02BA 0064

        JSR     R5,     .EXEC.E06               ; FBCD   0004 011C 0206

        MVII    #$0001, R1                      ; FBD0   02B9 0001
        TSTR    R0                              ; FBD2   0080
L_FBD3:
        BEQ     L_FBD9                          ; FBD3   0204 0004

        INCR    R1                              ; FBD5   0009
        SLR     R0,     1                       ; FBD6   0060
        B       L_FBD3                          ; FBD7   0220 0005
L_FBD9:
        PULR    R7                              ; FBD9   02B7

        PSHR    R5                              ; FBDA   0275
        MVI     G_0108, R1                      ; FBDB   0281 0108
        SLR     R1,     2                       ; FBDD   0065
        SLR     R1,     1                       ; FBDE   0061
        ADDI    #$0003, R1                      ; FBDF   02F9 0003
        MVI     G_01E0, R0                      ; FBE1   0280 01E0
        INCR    R0                              ; FBE3   0008

        JSR     R5,     X_MPY                   ; FBE4   0004 011C 01DC

        SLR     R2,     1                       ; FBE7   0062
        PULR    R7                              ; FBE8   02B7

        COMR    R0                              ; FBE9   0018
        RSWD    R1                              ; FBEA   0039
        RLC     R1,     2                       ; FBEB   0055
        SWAP    R0,     1                       ; FBEC   0040
        SAR     R2,     2                       ; FBED   006E
        SARC    R2,     1                       ; FBEE   007A
        SLL     R3,     1                       ; FBEF   004B
        NEGR    R2                              ; FBF0   0022
        SLLC    R0,     1                       ; FBF1   0058
        SARC    R0,     2                       ; FBF2   007C
        INCR    R6                              ; FBF3   000E
        MOVR    R1,     R5                      ; FBF4   008D
        MOVR    R1,     R7                      ; FBF5   008F

        DECLE   $0091,  $0093,  $0095,  $0098   ; FBF6   0091 0093 0095 0098
        DECLE   $009B,  $00AD,  $00B2,  $00B7   ; FBFA   009B 00AD 00B2 00B7
        DECLE   $00BC,  $00A0,  $00A3,  $0098   ; FBFE   00BC 00A0 00A3 0098
        DECLE   $0124,  $00FF                   ; FC02   0124 00FF

        SARC    R3,     2                       ; FC04   007F
        MOVR    R0,     R7                      ; FC05   0087
        INCR    R7                              ; FC06   000F

        DIS                                     ; FC07   0003
L_FC08:
        ADDR    R5,     R1                      ; FC08   00E9
        DECLE   $00EA,  $00D5,  $004B,  $0048   ; FC09   00EA 00D5 004B 0048
        DECLE   $0083,  $00A4,  $0082,  $007F   ; FC0D   0083 00A4 0082 007F
        DECLE   $009E,  $0000,  $0324,  $00FF   ; FC11   009E 0000 0324 00FF

        MOVR    R2,     R3                      ; FC15   0093
        ADDR    R6,     R0                      ; FC16   00F0
        ADDR    R5,     R2                      ; FC17   00EA
        ADDR    R5,     R3                      ; FC18   00EB
        ADDR    R5,     R4                      ; FC19   00EC
        ADDR    R5,     R5                      ; FC1A   00ED
        ADDR    R5,     R6                      ; FC1B   00EE
        ADDR    R5,     R7                      ; FC1C   00EF

        DECLE   $0038,  $0084,  $0080,  $0000   ; FC1D   0038 0084 0080 0000
        DECLE   $010A,  $0064,  $0000,  $0046   ; FC21   010A 0064 0000 0046
        DECLE   $003F                           ; FC25   003F

        MOVR    R3,     R0                      ; FC26   0098
        SLR     R3,     2                       ; FC27   0067
        ADDR    R5,     R3                      ; FC28   00EB
        ADDR    R5,     R3                      ; FC29   00EB
        INCR    R7                              ; FC2A   000F
        INCR    R7                              ; FC2B   000F

L_FC2C:
        GSWD    R0                              ; FC2C   0030
L_FC2D:
        SUB@    R4,     R4                      ; FC2D   0324
        DECLE   $003F                           ; FC2E   003F

        MOVR    R0,     R7                      ; FC2F   0087
        MOVR    R0,     R7                      ; FC30   0087
        MOVR    R0,     R7                      ; FC31   0087

        DECLE   $00E9,  $0007,  $0008,  $0040   ; FC32   00E9 0007 0008 0040
        DECLE   $0082,  $0000,  $010A,  $0064   ; FC36   0082 0000 010A 0064
        DECLE   $0000,  $0124,  $0001,  $001F   ; FC3A   0000 0124 0001 001F
        DECLE   $0018,  $001A,  $0000,  $0046   ; FC3E   0018 001A 0000 0046
        DECLE   $003F                           ; FC42   003F

        SAR     R3,     2                       ; FC43   006F
        SAR     R3,     2                       ; FC44   006F
        SAR     R3,     2                       ; FC45   006F
        SAR     R3,     2                       ; FC46   006F
        MOVR    R1,     R7                      ; FC47   008F

        DECLE   $00E8,  $0028,  $0324,  $003F   ; FC48   00E8 0028 0324 003F
        DECLE   $009E,  $007E,  $0086,  $0076   ; FC4C   009E 007E 0086 0076
        DECLE   $00EE,  $00E6,  $0030,  $0082   ; FC50   00EE 00E6 0030 0082
        DECLE   $0083,  $0084,  $0000,  $010A   ; FC54   0083 0084 0000 010A
        DECLE   $00F4,  $010B,  $0001,  $0000   ; FC58   00F4 010B 0001 0000
        DECLE   $0206,  $00FF,  $0071,  $00B7   ; FC5C   0206 00FF 0071 00B7
        DECLE   $00BE,  $00C5,  $00AC,  $00D3   ; FC60   00BE 00C5 00AC 00D3
        DECLE   $0021,  $001A,  $0109,  $0078   ; FC64   0021 001A 0109 0078
        DECLE   $0000,  $0106,  $0001,  $0072   ; FC68   0000 0106 0001 0072
        DECLE   $001A,  $0078,  $0000,  $0324   ; FC6C   001A 0078 0000 0324
        DECLE   $007F,  $008E,  $0057,  $0056   ; FC70   007F 008E 0057 0056
        DECLE   $0055,  $0003,  $0005,  $0005   ; FC74   0055 0003 0005 0005
        DECLE   $0030,  $007C,  $007F,  $0080   ; FC78   0030 007C 007F 0080
        DECLE   $0000,  $010B,  $0001,  $010A   ; FC7C   0000 010B 0001 010A
        DECLE   $002C,  $0000,  $0011,  $0006   ; FC80   002C 0000 0011 0006
        DECLE   $0002,  $0011,  $0008,  $014D   ; FC84   0002 0011 0008 014D
        DECLE   $0011,  $000C,  $029A,  $0011   ; FC88   0011 000C 029A 0011
        DECLE   $0014,  $03E7,  $0109,  $000C   ; FC8C   0014 03E7 0109 000C
        DECLE   $001A,  $0000,  $0109,  $0012   ; FC90   001A 0000 0109 0012
        DECLE   $001A,  $0000,  $0109,  $0020   ; FC94   001A 0000 0109 0020
        DECLE   $001A,  $0000,  $0109,  $0020   ; FC98   001A 0000 0109 0020
        DECLE   $001A,  $003D,  $00AB,  $0000   ; FC9C   001A 003D 00AB 0000
        DECLE   $0109,  $000E,  $003C,  $0000   ; FCA0   0109 000E 003C 0000
        DECLE   $0109,  $0020,  $003E,  $003D   ; FCA4   0109 0020 003E 003D
        DECLE   $0000,  $0109,  $0006,  $003E   ; FCA8   0000 0109 0006 003E
        DECLE   $001A,  $003D,  $0000,  $0109   ; FCAC   001A 003D 0000 0109
        DECLE   $000C,  $003E,  $001A,  $003D   ; FCB0   000C 003E 001A 003D
        DECLE   $0000,  $0109,  $0012,  $003E   ; FCB4   0000 0109 0012 003E
        DECLE   $001A,  $003D,  $0000,  $0109   ; FCB8   001A 003D 0000 0109
        DECLE   $0018,  $003E,  $001A,  $003D   ; FCBC   0018 003E 001A 003D
        DECLE   $0000,  $0216                   ; FCC0   0000 0216

        MVO@    R5,     R4                      ; FCC2   0265
        ANDR    R0,     R5                      ; FCC3   0185
        RRC     R0,     2                       ; FCC4   0074
        CMP@    R4,     R1                      ; FCC5   0361
        MOVR    R2,     R6                      ; FCC6   0096
        MOVR    R5,     R6                      ; FCC7   00AE
        MVI@    R2,     R5                      ; FCC8   0295
        MVO     R5,     .STIC.X.0               ; FCC9   0245 0000
        ADD@    R1,     R4                      ; FCCB   02CC
        ADD@    R5,     R0                      ; FCCC   02E8
        MOVR    R4,     R5                      ; FCCD   00A5
        ANDR    R3,     R3                      ; FCCE   019B
        MVI@    R1,     R7                      ; FCCF   028F

        CMP@    R6,     R6                      ; FCD0   0376
        SUBR    R4,     R5                      ; FCD1   0125
        ADDI    #$03E3, R3                      ; FCD2   02FB 03E3
        MVO@    R1,     R5                      ; FCD4   0269
        MOVR    R0,     R5                      ; FCD5   0085
        CMP@    R5,     R3                      ; FCD6   036B
        MOVR    R7,     R1                      ; FCD7   00B9
        CMP@    R6,     R4                      ; FCD8   0374
        XORR    R7,     R3                      ; FCD9   01FB
        MVO@    R5,     R4                      ; FCDA   0265
        ANDR    R0,     R5                      ; FCDB   0185
        RRC     R0,     2                       ; FCDC   0074
        CMP@    R4,     R0                      ; FCDD   0360
        MVI@    R2,     R2                      ; FCDE   0292
        ANDR    R0,     R5                      ; FCDF   0185
        ADD     G_0193, R5                      ; FCE0   02C5 0193
        CMP@    R4,     R4                      ; FCE2   0364
        MOVR    R4,     R5                      ; FCE3   00A5
        B       L_FEFC                          ; FCE4   0200 0216

        DECLE   $0265,  $0185,  $0074,  $0363   ; FCE6   0265 0185 0074 0363
        DECLE   $0101,  $0241,  $0074,  $00B2   ; FCEA   0101 0241 0074 00B2
        DECLE   $0000,  $0250,  $03F4,  $0000   ; FCEE   0000 0250 03F4 0000

        MVO@    R6,     R2                      ; FCF2   0256
        MVI@    R1,     R0                      ; FCF3   0288
        MOVR    R7,     R3                      ; FCF4   00BB
        MVI@    R1,     R7                      ; FCF5   028F

        DECLE   $02E5,  $0240,  $0256,  $0061   ; FCF6   02E5 0240 0256 0061
        DECLE   $0281,  $006F,  $01A2,  $0260   ; FCFA   0281 006F 01A2 0260
        DECLE   $0255,  $00F2,  $0029,  $019B   ; FCFE   0255 00F2 0029 019B
        DECLE   $0235,  $00B3,  $0280,  $0254   ; FD02   0235 00B3 0280 0254
        DECLE   $0288,  $00BB,  $0068,  $002C   ; FD06   0288 00BB 0068 002C
        DECLE   $0185,  $01C7                   ; FD0A   0185 01C7

        MOVR    R4,     R0                      ; FD0C   00A0
        MVO@    R5,     R2                      ; FD0D   0255
        ADD@    R5,     R1                      ; FD0E   02E9
        CMP     .BTAB.44,R1                     ; FD0F   0341 0244
        CMP@    R5,     R0                      ; FD11   0368
        MVI@    R5,     R6                      ; FD12   02AE
        MVI     .BTAB.54,R0                     ; FD13   0280 0254
        MVI@    R1,     R0                      ; FD15   0288
        MOVR    R7,     R3                      ; FD16   00BB
        ADDR    R1,     R7                      ; FD17   00CF

        DECLE   $0254,  $0245,  $0273,  $0000   ; FD18   0254 0245 0273 0000
        DECLE   $0257,  $01CF,  $02C9,  $0065   ; FD1C   0257 01CF 02C9 0065
        DECLE   $0000                           ; FD20   0000

        MVO@    R7,     R2                      ; FD21   0257
        ADDR    R2,     R2                      ; FD22   00D2
        SUBR    R4,     R1                      ; FD23   0121
        MVO     R0,     .BTAB.56                ; FD24   0240 0256
        ADD@    R4,     R1                      ; FD26   02E1
        MVO@    R2,     R2                      ; FD27   0252
        SUBR    R5,     R7                      ; FD28   012F

        MVO     R0,     .BTAB.57                ; FD29   0240 0257
        CMPR    R5,     R6                      ; FD2B   016E
        SUBR    R4,     R7                      ; FD2C   0127

        DECLE   $0114,  $0000,  $0258,  $02E1   ; FD2D   0114 0000 0258 02E1
        DECLE   $0126,  $0000,  $0257,  $0032   ; FD31   0126 0000 0257 0032
        DECLE   $0068,  $00B2,  $0000,  $0256   ; FD35   0068 00B2 0000 0256
        DECLE   $02E1,  $024C,  $01F2,  $0080   ; FD39   02E1 024C 01F2 0080
        DECLE   $0257,  $0292,  $0024,  $00B2   ; FD3D   0257 0292 0024 00B2
        DECLE   $0000                           ; FD41   0000

        MVO@    R5,     R2                      ; FD42   0255
        SWAP    R1,     1                       ; FD43   0041
        MVO     R2,     .STIC.EDGE              ; FD44   0242 0032
        SUBR    R4,     R1                      ; FD46   0121
        CLRR    R0                              ; FD47   01C0
        MVO@    R6,     R2                      ; FD48   0256
        ADD@    R4,     R1                      ; FD49   02E1
        MVO@    R4,     R1                      ; FD4A   024C
        XORR    R4,     R3                      ; FD4B   01E3
        CMPR    R4,     R0                      ; FD4C   0160
        SLLC    R3,     1                       ; FD4D   005B
        SLR     R0,     2                       ; FD4E   0064
        RRC     R2,     1                       ; FD4F   0072
        SAR     R1,     1                       ; FD50   0069
        SARC    R0,     2                       ; FD51   007C
        MOVR    R0,     R1                      ; FD52   0081
        SAR     R2,     2                       ; FD53   006E
        SLR     R0,     1                       ; FD54   0060
        RRC     R3,     2                       ; FD55   0077
        MOVR    R0,     R7                      ; FD56   0087

        DECLE   $005B,  $005B,  $0031,  $0031   ; FD57   005B 005B 0031 0031
        DECLE   $0031,  $0037,  $0037,  $0037   ; FD5B   0031 0037 0037 0037

        RLC     R3,     1                       ; FD5F   0053
        RLC     R3,     1                       ; FD60   0053
        RLC     R3,     1                       ; FD61   0053
        RLC     R3,     1                       ; FD62   0053
        SWAP    R0,     2                       ; FD63   0044
        SLL     R0,     2                       ; FD64   004C
        RSWD    R5                              ; FD65   003D
        PSHR    R5                              ; FD66   0275

        JSR     R5,     L_6D64                  ; FD67   0004 016C 0164

        SDBD                                    ; FD6A   0001
        MVII    #$0864, R3                      ; FD6B   02BB 0064 0008
        SDBD                                    ; FD6E   0001
        MVII    #$ACE5, R4                      ; FD6F   02BC 00E5 00AC

        JSR     R5,     L_51C4                  ; FD72   0004 0150 01C4

        SDBD                                    ; FD75   0001
        MVII    #$ACCB, R4                      ; FD76   02BC 00CB 00AC

        JSR     R5,     L_51C4                  ; FD79   0004 0150 01C4

L_FD7C:
        CLRR    R1                              ; FD7C   01C9
L_FD7D:
        MVO     R1,     G_0112                  ; FD7D   0241 0112
        DECLE   $0004                           ; FD7F   0004

        ANDR    R5,     R4                      ; FD80   01AC
        MVO@    R4,     R3                      ; FD81   025C
        MVI     G_0112, R1                      ; FD82   0281 0112
        INCR    R1                              ; FD84   0009
        CMPI    #$000A, R1                      ; FD85   0379 000A
        BMI     L_FD7D                          ; FD87   022B 000B
        B       L_FD7C                          ; FD89   0220 000E

        PSHR    R5                              ; FD8B   0275

        JSR     R5,     L_6D64                  ; FD8C   0004 016C 0164

        SDBD                                    ; FD8F   0001
        MVII    #$0864, R3                      ; FD90   02BB 0064 0008
        SDBD                                    ; FD93   0001
        MVII    #$ACC1, R4                      ; FD94   02BC 00C1 00AC

        JSR     R5,     L_51C4                  ; FD97   0004 0150 01C4
        JSR     R5,     L_51C4                  ; FD9A   0004 0150 01C4

        DECR    R3                              ; FD9D   0013

        JSR     R5,     L_51C4                  ; FD9E   0004 0150 01C4

L_FDA1:
        CLRR    R1                              ; FDA1   01C9
L_FDA2:
        MVO     R1,     G_01EF                  ; FDA2   0241 01EF
        ADDI    #$000B, R1                      ; FDA4   02F9 000B
        PSHR    R1                              ; FDA6   0271
        SDBD                                    ; FDA7   0001
        MVII    #$ABE9, R4                      ; FDA8   02BC 00E9 00AB
        ADDR    R1,     R4                      ; FDAB   00CC
        ADD@    R4,     R4                      ; FDAC   02E4
        INCR    R4                              ; FDAD   000C
        MVI@    R4,     R0                      ; FDAE   02A0
        SDBD                                    ; FDAF   0001
        MVII    #$0943, R3                      ; FDB0   02BB 0043 0009

        JSR     R5,     L_FF83                  ; FDB3   0004 01FC 0383

        MVI@    R1,     R7                      ; FDB6   028F

        DECLE   $02B1,  $0004                   ; FDB7   02B1 0004

        ANDR    R5,     R4                      ; FDB9   01AC
        MVO@    R4,     R3                      ; FDBA   025C
        MVI     G_01EF, R1                      ; FDBB   0281 01EF
        INCR    R1                              ; FDBD   0009
        CMPI    #$000E, R1                      ; FDBE   0379 000E
        BMI     L_FDA2                          ; FDC0   022B 001F
        B       L_FDA1                          ; FDC2   0220 0022

        DECLE   $0275,  $0283,  $0112,  $0004   ; FDC4   0275 0283 0112 0004
        DECLE   $01AC,  $01D2,  $0283,  $01EF   ; FDC8   01AC 01D2 0283 01EF
        DECLE   $02FB,  $000B,  $0004           ; FDCC   02FB 000B 0004

        ANDR    R5,     R4                      ; FDCF   01AC
        CLRR    R2                              ; FDD0   01D2
        PULR    R7                              ; FDD1   02B7

        PSHR    R5                              ; FDD2   0275
        SDBD                                    ; FDD3   0001
        MVII    #$ABE9, R4                      ; FDD4   02BC 00E9 00AB
        ADDR    R3,     R4                      ; FDD7   00DC
        ADD@    R4,     R4                      ; FDD8   02E4
        MVI@    R4,     R3                      ; FDD9   02A3
        SARC    R3,     1                       ; FDDA   007B
        BNC     L_FDE0                          ; FDDB   0209 0003

        MVI@    R4,     R0                      ; FDDD   02A0
        MVO     R0,     G_01E3                  ; FDDE   0240 01E3
L_FDE0:
        SARC    R3,     1                       ; FDE0   007B
        DECLE   $0209,  $0015,  $02BA,  $0107   ; FDE1   0209 0015 02BA 0107
        DECLE   $0004                           ; FDE5   0004

        ANDR    R4,     R0                      ; FDE6   01A0
        ADDI    #$0066, R4                      ; FDE7   02FC 0066
        SUBI    #$0003, R0                      ; FDE9   0338 0003

        JSR     R5,     X_CLAMP                 ; FDEB   0004 0114 0270
        DECLE   $0003,  $000A,  $004C,  $0048   ; FDEE   0003 000A 004C 0048
        DECLE   $0250,  $000A,  $037A,  $010A   ; FDF2   0250 000A 037A 010A
        DECLE   $022C,  $0012,  $007B,  $0209   ; FDF6   022C 0012 007B 0209
        DECLE   $000D,  $02A2,  $0242,  $01D3   ; FDFA   000D 02A2 0242 01D3
        DECLE   $02BD,  $0132,  $02A0,  $0268   ; FDFE   02BD 0132 02A0 0268
        DECLE   $007A,  $022C,  $0004,  $0004   ; FE02   007A 022C 0004 0004

        ANDR    R5,     R4                      ; FE06   01AC
        MVI     G_007B, R4                      ; FE07   0284 007B
        BNC     L_FE10                          ; FE09   0209 0005

        MVI     G_035E, R0                      ; FE0B   0280 035E
        XORR    R7,     R0                      ; FE0D   01F8
        MVO     R0,     G_031C                  ; FE0E   0240 031C
L_FE10:
        SARC    R3,     1                       ; FE10   007B
        BNC     L_FE1B                          ; FE11   0209 0008

        MVI@    R4,     R0                      ; FE13   02A0
        SWAP    R0,     1                       ; FE14   0040
        SDBD                                    ; FE15   0001
        XORI    #$D5EA, R0                      ; FE16   03F8 00EA 00D5
        MVO     R0,     G_031C                  ; FE19   0240 031C
L_FE1B:
        SARC    R3,     1                       ; FE1B   007B
        BNC     L_FE24                          ; FE1C   0209 0006

        MVI@    R4,     R0                      ; FE1E   02A0
        MVII    #$0107, R5                      ; FE1F   02BD 0107
        MVO@    R0,     R5                      ; FE21   0268
        MVO@    R0,     R5                      ; FE22   0268
        MVO@    R0,     R5                      ; FE23   0268
L_FE24:
        SARC    R3,     1                       ; FE24   007B
        BNC     L_FE34                          ; FE25   0209 000D

        MVI@    R4,     R0                      ; FE27   02A0
        MVII    #$0003, R1                      ; FE28   02B9 0003
        MVII    #$0107, R5                      ; FE2A   02BD 0107
L_FE2C:
        CMP@    R5,     R0                      ; FE2C   0368
        BLE     L_FE31                          ; FE2D   0206 0002

        DECR    R5                              ; FE2F   0015
        MVO@    R0,     R5                      ; FE30   0268
L_FE31:
        DECR    R1                              ; FE31   0011
        BNEQ    L_FE2C                          ; FE32   022C 0007

L_FE34:
        SARC    R3,     1                       ; FE34   007B
        BNC     L_FE44                          ; FE35   0209 000D

        MVI@    R4,     R0                      ; FE37   02A0
        MVII    #$0003, R1                      ; FE38   02B9 0003
        MVII    #$0107, R5                      ; FE3A   02BD 0107
L_FE3C:
        CMP@    R5,     R0                      ; FE3C   0368
        BGE     L_FE41                          ; FE3D   020D 0002

        DECR    R5                              ; FE3F   0015
        MVO@    R0,     R5                      ; FE40   0268
L_FE41:
        DECR    R1                              ; FE41   0011
        BNEQ    L_FE3C                          ; FE42   022C 0007

L_FE44:
        SARC    R3,     1                       ; FE44   007B
        BNC     L_FE50                          ; FE45   0209 0009

L_FE47:
        MVI@    R4,     R0                      ; FE47   02A0
        DECLE   $0080,  $0204,  $0005,  $0004   ; FE48   0080 0204 0005 0004

        ANDR    R2,     R0                      ; FE4C   0190
        SWAP    R2,     1                       ; FE4D   0042
        B       L_FE47                          ; FE4E   0220 0008

L_FE50:
        SARC    R3,     1                       ; FE50   007B
        BNC     L_FE5B                          ; FE51   0209 0008

L_FE53:
        MVI@    R4,     R1                      ; FE53   02A1
        TSTR    R1                              ; FE54   0089
        BEQ     L_FE5B                          ; FE55   0204 0004

        MVI@    R4,     R0                      ; FE57   02A0
        MVO@    R0,     R1                      ; FE58   0248
        B       L_FE53                          ; FE59   0220 0007
L_FE5B:
        PULR    R7                              ; FE5B   02B7

        PSHR    R5                              ; FE5C   0275
        SDBD                                    ; FE5D   0001
        MVII    #$AD4D, R5                      ; FE5E   02BD 004D 00AD
        ADDR    R1,     R5                      ; FE61   00CD
        SDBD                                    ; FE62   0001
        MVII    #$ACC1, R4                      ; FE63   02BC 00C1 00AC
        ADD@    R5,     R4                      ; FE66   02EC
        SDBD                                    ; FE67   0001
        MVII    #$0867, R3                      ; FE68   02BB 0067 0008

        JSR     R5,     L_51C4                  ; FE6B   0004 0150 01C4

        EIS                                     ; FE6E   0002

        JSR     R5,     .EXEC.4C3               ; FE6F   0004 0114 00C3

        MOVR    R5,     R1                      ; FE72   00A9
        SDBD                                    ; FE73   0001
        ANDI    #$E0E0, R1                      ; FE74   03B9 00E0 00E0
        CMPR    R5,     R1                      ; FE77   0169
        BNEQ    L_FE7B                          ; FE78   020C 0001

        PULR    R5                              ; FE7A   02B5
L_FE7B:
        SDBD                                    ; FE7B   0001
        MVII    #$ACEF, R4                      ; FE7C   02BC 00EF 00AC
        CLRR    R3                              ; FE7F   01DB

        JSR     R5,     L_51C4                  ; FE80   0004 0150 01C4

        PULR    R7                              ; FE83   02B7

        PSHR    R5                              ; FE84   0275
        MVII    #$0080, R0                      ; FE85   02B8 0080
        SWAP    R0,     1                       ; FE87   0040
        MVI     G_01D3, R1                      ; FE88   0281 01D3
        MVII    #$033C, R2                      ; FE8A   02BA 033C
        MVII    #$000F, R5                      ; FE8C   02BD 000F
L_FE8E:
        MVO@    R5,     R2                      ; FE8E   0255
        SARC    R1,     1                       ; FE8F   0079
        ADCR    R7                              ; FE90   002F

        MVO@    R0,     R2                      ; FE91   0250
L_FE92:
        ADDI    #$0010, R5                      ; FE92   02FD 0010
        INCR    R2                              ; FE94   000A
        CMPI    #$0344, R2                      ; FE95   037A 0344
        BNEQ    L_FE8E                          ; FE97   022C 000A
        PULR    R7                              ; FE99   02B7

        PSHR    R0                              ; FE9A   0270
        MVI@    R4,     R0                      ; FE9B   02A0
        DECR    R4                              ; FE9C   0014
        AND     G_0318, R0                      ; FE9D   0380 0318
        SDBD                                    ; FE9F   0001
        ADD@    R5,     R0                      ; FEA0   02E8
        MVO@    R0,     R4                      ; FEA1   0260
        PULR    R0                              ; FEA2   02B0
        MOVR    R5,     R7                      ; FEA3   00AF

        PSHR    R5                              ; FEA4   0275
        MVI@    R4,     R5                      ; FEA5   02A5
        DECR    R4                              ; FEA6   0014
        AND     G_0318, R5                      ; FEA7   0385 0318
        MVO@    R5,     R4                      ; FEA9   0265
        PULR    R7                              ; FEAA   02B7

        PSHR    R5                              ; FEAB   0275
        MVI@    R4,     R5                      ; FEAC   02A5
        DECR    R4                              ; FEAD   0014
        AND     G_0318, R5                      ; FEAE   0385 0318
        ADDR    R0,     R5                      ; FEB0   00C5
        MVO@    R5,     R4                      ; FEB1   0265
        PULR    R7                              ; FEB2   02B7

        COMR    R0                              ; FEB3   0018
        PSHR    R1                              ; FEB4   0271
        PSHR    R3                              ; FEB5   0273
L_FEB6:
        MVI@    R5,     R3                      ; FEB6   02AB
        TSTR    R3                              ; FEB7   009B
        BEQ     L_FEC1                          ; FEB8   0204 0007

        MVI@    R3,     R1                      ; FEBA   0299
        COMR    R1                              ; FEBB   0019
        ANDR    R0,     R1                      ; FEBC   0181
        COMR    R1                              ; FEBD   0019
        MVO@    R1,     R3                      ; FEBE   0259
        B       L_FEB6                          ; FEBF   0220 000A

L_FEC1:
        PULR    R3                              ; FEC1   02B3
        PULR    R1                              ; FEC2   02B1
        COMR    R0                              ; FEC3   0018
        MOVR    R5,     R7                      ; FEC4   00AF

        MVI@    R5,     R0                      ; FEC5   02A8
        PSHR    R5                              ; FEC6   0275
        PSHR    R1                              ; FEC7   0271
        MVII    #$01E7, R5                      ; FEC8   02BD 01E7
L_FECA:
        MVI@    R5,     R1                      ; FECA   02A9
        DECR    R1                              ; FECB   0011
        BMI     L_FED4                          ; FECC   020B 0006

        CMPI    #$01EB, R5                      ; FECE   037D 01EB
        BNEQ    L_FECA                          ; FED0   022C 0007

        PULR    R1                              ; FED2   02B1
        PULR    R7                              ; FED3   02B7

L_FED4:
        INCR    R0                              ; FED4   0008
        DECLE   $0015,  $0268,  $0275,  $037D   ; FED5   0015 0268 0275 037D
        DECLE   $01E8,  $020C,  $0004,  $0004   ; FED9   01E8 020C 0004 0004

        ANDR    R2,     R0                      ; FEDD   0190
        SWAP    R1,     1                       ; FEDE   0041
        NEGR    R0                              ; FEDF   0020
        PULR    R5                              ; FEE0   02B5
        PULR    R1                              ; FEE1   02B1
        PULR    R7                              ; FEE2   02B7

        PSHR    R5                              ; FEE3   0275
        MVI     G_01D6, R0                      ; FEE4   0280 01D6
        ANDI    #$0007, R0                      ; FEE6   03B8 0007
        BNEQ    L_FF02                          ; FEE8   020C 0018

        MVI     G_01EC, R0                      ; FEEA   0280 01EC
        ANDI    #$00F0, R0                      ; FEEC   03B8 00F0
        BNEQ    L_FF03                          ; FEEE   020C 0013

        MVII    #$02C9, R1                      ; FEF0   02B9 02C9
        MOVR    R1,     R4                      ; FEF2   008C
        INCR    R4                              ; FEF3   000C

        JSR     R5,     L_5AD0                  ; FEF4   0004 0158 02D0
        JSR     R5,     L_5AD0                  ; FEF7   0004 0158 02D0
        DECLE   $0271,  $0004                   ; FEFA   0271 0004
L_FEFC:
        ANDR    R5,     R4                      ; FEFC   01AC
        SUB@    R1,     R2                      ; FEFD   030A
        ADDI    #$0007, R0                      ; FEFE   02F8 0007
        PULR    R1                              ; FF00   02B1
        MVO@    R0,     R1                      ; FF01   0248
L_FF02:
        PULR    R7                              ; FF02   02B7

L_FF03:
        MVI     G_01EC, R0                      ; FF03   0280 01EC
        SUBI    #$0010, R0                      ; FF05   0338 0010
        MVO     R0,     G_01EC                  ; FF07   0240 01EC
        PULR    R7                              ; FF09   02B7

        DECLE   $0275,  $0282,  $01E7,  $0042   ; FF0A   0275 0282 01E7 0042
        DECLE   $0042,  $020B,  $0045,  $0204   ; FF0E   0042 020B 0045 0204
        DECLE   $005C,  $0004,  $0190,  $002A   ; FF12   005C 0004 0190 002A
        DECLE   $0020,  $0209,  $0011,  $0004   ; FF16   0020 0209 0011 0004

        ANDR    R2,     R0                      ; FF1A   0190
        RSWD    R4                              ; FF1B   003C
        NEGR    R0                              ; FF1C   0020
        SDBD                                    ; FF1D   0001
        ADDI    #$AFB0, R2                      ; FF1E   02FA 00B0 00AF
        MVI@    R2,     R4                      ; FF21   0294
        ADD@    R2,     R4                      ; FF22   02D4
        ADD@    R2,     R4                      ; FF23   02D4
        SDBD                                    ; FF24   0001
        ADDI    #$D000, R4                      ; FF25   02FC 0000 00D0
        B       L_FF2E                          ; FF28   0200 0004

        MVII    #$01E5, R5                      ; FF2A   02BD 01E5
        SDBD                                    ; FF2C   0001
        MVI@    R5,     R4                      ; FF2D   02AC
L_FF2E:
        MVI@    R4,     R0                      ; FF2E   02A0
        DECLE   $03B8,  $0300,  $004C,  $02A2   ; FF2F   03B8 0300 004C 02A2
        DECLE   $03BA,  $0300,  $00D0,  $004C   ; FF33   03BA 0300 00D0 004C
        DECLE   $02E0,  $0040,  $03B8,  $003F   ; FF37   02E0 0040 03B8 003F
        DECLE   $0204,  $0032,  $0244,  $01E5   ; FF3B   0204 0032 0244 01E5
        DECLE   $00A2,  $0042,  $0242,  $01E6   ; FF3F   00A2 0042 0242 01E6
        DECLE   $0378,  $001B,  $0204,  $000D   ; FF43   0378 001B 0204 000D
        DECLE   $004C,  $0048,  $02F8,  $0100   ; FF47   004C 0048 02F8 0100
        DECLE   $0004                           ; FF4B   0004

        ANDR    R2,     R0                      ; FF4C   0190
        ADCR    R2                              ; FF4D   002A
        NEGR    R1                              ; FF4E   0021
        BNC     L_FF02                          ; FF4F   0229 004E

        SUBI    #$00A0, R0                      ; FF51   0338 00A0
        INCR    R7                              ; FF53   000F

        CLRR    R0                              ; FF54   01C0
L_FF55:
        PULR    R7                              ; FF55   02B7

        SUBI    #$0081, R2                      ; FF56   033A 0081
        CMPI    #$000A, R2                      ; FF58   037A 000A
        BMI     L_FF66                          ; FF5A   020B 000A

        MOVR    R2,     R1                      ; FF5C   0091
        MVII    #$000A, R2                      ; FF5D   02BA 000A

        JSR     R5,     X_DIV                   ; FF5F   0004 011C 01FB

        ADDI    #$0081, R1                      ; FF62   02F9 0081
        B       L_FF68                          ; FF64   0200 0002

L_FF66:
        CLRR    R1                              ; FF66   01C9
L_FF67:
        MOVR    R2,     R0                      ; FF67   0090
L_FF68:
        MVO     R1,     G_01E7                  ; FF68   0241 01E7
        SLL     R0,     2                       ; FF6A   004C
        SLL     R0,     1                       ; FF6B   0048
        ADDI    #$0080, R0                      ; FF6C   02F8 0080
        PULR    R7                              ; FF6E   02B7

        DECLE   $0004                           ; FF6F   0004

        ANDR    R2,     R0                      ; FF70   0190
        SWAP    R1,     1                       ; FF71   0041
        NEGR    R0                              ; FF72   0020
        MVII    #$01E7, R4                      ; FF73   02BC 01E7
        MOVR    R4,     R5                      ; FF75   00A5
        INCR    R5                              ; FF76   000D
        MVI@    R5,     R0                      ; FF77   02A8
        MVO@    R0,     R4                      ; FF78   0260
        MVI@    R5,     R0                      ; FF79   02A8
        MVO@    R0,     R4                      ; FF7A   0260
        MVI@    R5,     R0                      ; FF7B   02A8
        MVO@    R0,     R4                      ; FF7C   0260
        CLRR    R0                              ; FF7D   01C0
L_FF7E:
        MVO@    R0,     R4                      ; FF7E   0260
        PULR    R7                              ; FF7F   02B7

        PSHR    R5                              ; FF80   0275
        MVI     G_033A, R0                      ; FF81   0280 033A
L_FF83:
        ANDI    #$0007, R0                      ; FF83   03B8 0007
        BNEQ    L_FF02                          ; FF85   022C 0084

        MVII    #$02C9, R1                      ; FF87   02B9 02C9
        MOVR    R1,     R4                      ; FF89   008C
        INCR    R4                              ; FF8A   000C

        JSR     R5,     L_5AD0                  ; FF8B   0004 0158 02D0
        JSR     R5,     L_5AD0                  ; FF8E   0004 0158 02D0
        DECLE   $0271,  $0004                   ; FF91   0271 0004

        ANDR    R5,     R4                      ; FF93   01AC
        SUB@    R1,     R2                      ; FF94   030A
        TSTR    R0                              ; FF95   0080
        BNEQ    L_FF9E                          ; FF96   020C 0006

        SDBD                                    ; FF98   0001
        MVII    #$2200, R0                      ; FF99   02B8 0000 0022
        B       L_FFAE                          ; FF9C   0200 0010

L_FF9E:
        ADD     G_0336, R0                      ; FF9E   02C0 0336
        CMP     G_0334, R0                      ; FFA0   0340 0334
        BNEQ    L_FFAE                          ; FFA2   020C 000A

        MVI     G_0335, R0                      ; FFA4   0280 0335
        CLRR    R1                              ; FFA6   01C9
        MVO     R1,     G_0335                  ; FFA7   0241 0335
        TSTR    R0                              ; FFA9   0080
        BNEQ    L_FFAE                          ; FFAA   020C 0002

        MVI     G_0334, R0                      ; FFAC   0280 0334
L_FFAE:
        PULR    R1                              ; FFAE   02B1
        MVO@    R0,     R1                      ; FFAF   0248
        PULR    R7                              ; FFB0   02B7

        DECLE   $0000,  $0023,  $0030,  $004D   ; FFB1   0000 0023 0030 004D
        DECLE   $0035,  $003F                   ; FFB5   0035 003F
L_FFB7:
        RLC     R1,     2                       ; FFB7   0055
        SAR     R0,     1                       ; FFB8   0068
        SAR     R3,     2                       ; FFB9   006F
        MOVR    R0,     R3                      ; FFBA   0083
        TSTR    R2                              ; FFBB   0092
        MOVR    R3,     R6                      ; FFBC   009E
        MOVR    R6,     R1                      ; FFBD   00B1
        ADDR    R1,     R6                      ; FFBE   00CE
        ADDR    R3,     R0                      ; FFBF   00D8
        ADDR    R3,     R6                      ; FFC0   00DE
        ADDR    R5,     R6                      ; FFC1   00EE
        ADDR    R6,     R6                      ; FFC2   00F6
        SUBR    R0,     R3                      ; FFC3   0103
        SUBR    R3,     R1                      ; FFC4   0119
        SUBR    R5,     R7                      ; FFC5   012F

        DECLE   $0144,  $0158,  $016A,  $017A   ; FFC6   0144 0158 016A 017A
        DECLE   $0182,  $018C,  $019C,  $01A3   ; FFCA   0182 018C 019C 01A3
        DECLE   $01B1,  $01BF,  $01D1,  $01E3   ; FFCE   01B1 01BF 01D1 01E3
        DECLE   $01F7,  $0205,  $0221,  $0239   ; FFD2   01F7 0205 0221 0239
        DECLE   $024D,  $0267,  $027D           ; FFD6   024D 0267 027D

        MVI@    R1,     R1                      ; FFD9   0289
        MVI@    R2,     R7                      ; FFDA   0297
        MVI@    R4,     R7                      ; FFDB   02A7
        MVI@    R5,     R7                      ; FFDC   02AF

        MVII    #$02C0, R0                      ; FFDD   02B8 02C0
        ADD@    R1,     R2                      ; FFDF   02CA
        ADD@    R3,     R3                      ; FFE0   02DB
        ADD@    R5,     R3                      ; FFE1   02EB
        SUB     G_0363, R4                      ; FFE2   0304 0363
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFFC   0000 0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $507B       $507F  
;;  $507D       $501D   $DE8B   $F6B8  
;;  $5082       $D6F3  
;;  $5093       <entry>
;;  $50CB       $50CE   $50FD   $5103   $5115  
;;  $5110       $5113  
;;  $5122       $514E   $515E   $517B   $519B   $51D9   $51F2  
;;  $5123       $50D7  
;;  $512E       $512C  
;;  $513C       $5156   $51A3  
;;  $513F       $5160   $5176  
;;  $5150       $516F  
;;  $5190       $5142  
;;  $5193       $5133   $5166  
;;  $5194       $5192  
;;  $51C4       $5452   $5455   $FD72   $FD79   $FD97   $FD9A   $FD9E   $FE6B  
;;  $51C4       $FE80  
;;  $51C5       $54A6   $6D0E   $6D5A   $F961   $F972  
;;  $51C9       $F9AC  
;;  $51D0       $51C7  
;;  $51D4       $51DE  
;;  $51D5       $51D3   $51FE   $5207  
;;  $51EC       $51E8  
;;  $51ED       $51EB  
;;  $51FD       $51F9  
;;  $5200       $51E0   $5205  
;;  $544A       $5041   $D70F   $DF0D  
;;  $547D       $5044  
;;  $54B1       $54B4  
;;  $54BD       $5047   $6C75   $D1E4   $D2BE   $D327   $D59C   $F4F2   $FBB9  
;;  $54C6       $54CB  
;;  $54F1       $54E9  
;;  $54F3       $54EF  
;;  $5509       $54FB   $5503   $5514  
;;  $5516       $550A  
;;  $551D       $5517  
;;  $5527       $551B  
;;  $552E       $5521  
;;  $552F       $5073  
;;  $5553       $554E  
;;  $55A3       $559E  
;;  $55AC       $5610   $5622  
;;  $55C9       $559B  
;;  $55E5       $5618   $5628   $5F56   $DB2E   $F5EB  
;;  $55FE       $55FB  
;;  $5605       $55F0  
;;  $5607       $55EC  
;;  $5609       $5592   $5CDE  
;;  $561C       $5595  
;;  $562D       $568A  
;;  $563E       $563B  
;;  $564E       $564A  
;;  $565D       $5679  
;;  $5676       $5662  
;;  $5680       $5686  
;;  $5685       $5682  
;;  $568D       $566D  
;;  $568E       $5722  
;;  $56A3       $56A1  
;;  $56C3       $572F  
;;  $56F7       $56F5  
;;  $5702       $56FB  
;;  $5705       $5700  
;;  $5724       $56E6   $56EF   $570B   $573F  
;;  $5731       $56B3  
;;  $5741       $5736  
;;  $5748       $5746  
;;  $574B       $5749  
;;  $574E       $574C  
;;  $5751       $5055   $F63A   $F673   $FA4E  
;;  $575E       $57EF  
;;  $5761       $5817  
;;  $5764       $5833  
;;  $5767       $5864  
;;  $576A       $587E  
;;  $576D       $5897  
;;  $5770       $58C0   $58CF  
;;  $577A       $5775  
;;  $5780       $5920  
;;  $5783       $57C5  
;;  $5785       $5755  
;;  $5792       $5790  
;;  $579D       $599B   $59AC  
;;  $57A3       $5A76  
;;  $57A6       $5AA4  
;;  $57A9       $5AAB  
;;  $57AC       $5AAD  
;;  $57AF       $5AB4  
;;  $57B2       $5783   $5795   $58FF   $59E3   $5A05   $5ABB  
;;  $57B6       $5759  
;;  $57C7       $575C  
;;  $57EE       $57E3  
;;  $57F1       $575F  
;;  $5816       $580E  
;;  $5819       $5762  
;;  $5822       $5830  
;;  $5832       $5823  
;;  $5835       $5765  
;;  $585C       $5856  
;;  $5860       $5850  
;;  $5866       $5768  
;;  $586F       $587B  
;;  $5880       $576B  
;;  $5893       $588F  
;;  $5899       $576E  
;;  $58B8       $58BC  
;;  $58BE       $58B9  
;;  $58C8       $58C4  
;;  $58C9       $58CC  
;;  $58D1       $5772  
;;  $58E1       $58F7   $5942  
;;  $58E5       $58E9  
;;  $58EF       $577B  
;;  $5901       $577E  
;;  $5922       $5778  
;;  $5944       $579B  
;;  $5994       $5998  
;;  $59A1       $598C  
;;  $59BC       $5949  
;;  $5A48       $57A1  
;;  $5A63       $5A60  
;;  $5A78       $57A4  
;;  $5A8E       $5A8B  
;;  $5AA3       $5A9E  
;;  $5AA6       $57A7  
;;  $5AAD       $57AA  
;;  $5AAF       $57AD  
;;  $5AB6       $57B0  
;;  $5AC7       $59CB   $F794   $F79A   $F7A0   $F99F   $F9A5  
;;  $5AC9       $5ACD  
;;  $5AD0       $582C   $5876   $5893   $58E5   $590A   $590D   $5910   $5913  
;;  $5AD0       $5916   $5919   $591C   $5959   $595C   $59A5   $59A8   $59D1  
;;  $5AD0       $5A6F   $5A72   $5A9A   $5AA0   $5AC9   $5E3B   $5E3E   $5E41  
;;  $5AD0       $6918   $6984   $D86F   $D872   $D8AB   $D8AE   $F172   $F175  
;;  $5AD0       $F183   $F186   $FEF4   $FEF7   $FF8B   $FF8E  
;;  $5AE4       $57BC   $58A7   $58D8   $F7A7  
;;  $5AE6       $5AEF  
;;  $5AF2       $57DB   $57EB  
;;  $5B1A       $5806   $5813  
;;  $5B42       $504D   $5523   $5B7B   $5C62   $61C7   $66BD   $D702   $D718  
;;  $5B42       $DA4D   $DF05   $DF64  
;;  $5B48       $5FD0   $65BD   $D71C   $DACA   $DB7F   $DC3A   $DE77   $DEED  
;;  $5B48       $DF14   $F05F   $F07D   $F129   $F153   $F2E4  
;;  $5B49       $5601  
;;  $5B4C       $5B46  
;;  $5B5A       $5FBC   $6495  
;;  $5B5F       $5B5C  
;;  $5B89       $5B87  
;;  $5B9B       $5B97  
;;  $5BAA       $5BA7  
;;  $5BBB       $5BC8  
;;  $5BCA       $5BAE  
;;  $5BCE       $5BB4  
;;  $5BD9       $5BF2  
;;  $5BDA       $5BEB  
;;  $5BE0       $5BE6  
;;  $5BF4       $5BBC  
;;  $5BF5       $5C1A  
;;  $5BFE       $5C09  
;;  $5C02       $5C06  
;;  $5C0C       $5FBF   $D1C5   $D40B   $D723   $DF51  
;;  $5C57       $5C3D  
;;  $5C6F       $5CD3  
;;  $5C88       $5C7C  
;;  $5CA8       $5CA4  
;;  $5CB7       $5CB3  
;;  $5CC2       $5CBC  
;;  $5CD2       $5C75  
;;  $5CDE       $5CD0  
;;  $5CE6       $5D36  
;;  $5CEA       $5CE4   $5D38  
;;  $5CFF       $5CF8  
;;  $5D04       $5D13  
;;  $5D13       $5D0F  
;;  $5D15       $5D09  
;;  $5D17       $5CFD  
;;  $5D35       $5CF0  
;;  $5D4F       $5D2A   $5D33  
;;  $5D92       $5D24   $6BD0   $D61F  
;;  $5DCC       $5E08  
;;  $5DE4       $5DDD  
;;  $5DF4       $5DE9  
;;  $5E05       $5DCE   $5DD4   $5DE2   $5DF2  
;;  $5E0B       $57B2  
;;  $5E19       $5E10   $5E16  
;;  $5E4E       $5E67  
;;  $5E58       $5E55  
;;  $5E5A       $5E52  
;;  $5E63       $5E60  
;;  $5E65       $5E5D  
;;  $5E6D       $5E14  
;;  $5E71       $5FAE   $64CC   $6591   $67D5   $D720   $DF34   $F5EE   $F61B  
;;  $5E71       $F6A3   $F6D0  
;;  $5E72       $5FC3  
;;  $5E93       $5E85   $5E8B   $5E90  
;;  $5EA1       $5E9D  
;;  $5EB9       $5EB6  
;;  $5ED6       $5EBA  
;;  $5EF0       $6199   $64CF   $DF4A  
;;  $5F0A       $5F3E   $6A8B  
;;  $5F1A       $5F13   $5F17  
;;  $5F1D       $5550  
;;  $5F53       $5F50  
;;  $5F6B       $5F64  
;;  $5F75       $5F3A   $5F6E  
;;  $5F7A       $5F73  
;;  $5F83       $5FDC  
;;  $5F84       $5F82  
;;  $5FAC       $5FA9  
;;  $5FC2       $5FCA  
;;  $5FC3       $5F68   $5F80   $5F8A  
;;  $5FC6       $5F33  
;;  $5FD7       $5F77   $6B29  
;;  $5FE8       $6001   $6042  
;;  $5FEA       $5FE1  
;;  $5FF7       $5FED  
;;  $6000       $5FF4   $600D   $6017   $603B  
;;  $6003       $5FE4  
;;  $6010       $6006  
;;  $6035       $6026  
;;  $6041       $5FF9   $5FFE   $6012   $601D   $6033  
;;  $6044       $5F7C   $5FD8   $615D  
;;  $6061       $605E  
;;  $6068       $6064  
;;  $6071       $604E   $6051   $6055   $6059  
;;  $607A       $6074  
;;  $607B       $6078  
;;  $607C       $609C   $6244   $62D5   $65A3   $65AB   $DB71  
;;  $6093       $608D  
;;  $6095       $6084   $6088   $6091  
;;  $609B       $60DD   $60E5   $60FD   $6107   $6113   $6129  
;;  $60A7       $60E2   $6110  
;;  $60B7       $60B1  
;;  $60BC       $60B5  
;;  $60C4       $60CF  
;;  $60C9       $60BE  
;;  $60D1       $60BA   $60C2   $60C7   $60CB  
;;  $60D8       $5FF1   $5FFB   $6022   $602F  
;;  $60E8       $60FB   $6134  
;;  $60EA       $60A4   $611C   $6132  
;;  $60EB       $60E9  
;;  $60F2       $600A   $6014  
;;  $6154       $5598  
;;  $616D       $616A  
;;  $6174       $6163   $6170  
;;  $61CB       $61C3  
;;  $61DB       $5C4F   $DA7B  
;;  $61FF       $61F4   $61F8  
;;  $620C       $61FD  
;;  $6218       $6282  
;;  $626B       $6255  
;;  $6271       $625D   $6261  
;;  $6280       $6222   $6226   $622A   $622E   $6235   $623A   $624D   $6269  
;;  $6284       $6159   $6161   $6176   $61E0  
;;  $6285       $61FA   $6264  
;;  $6292       $628E  
;;  $629E       $6289  
;;  $62B0       $62AE  
;;  $62C7       $5C4C   $61CF   $DA78  
;;  $62D4       $62DE  
;;  $62E1       $636B  
;;  $62FB       $62F3  
;;  $6302       $62F9  
;;  $631D       $6319  
;;  $6324       $6300  
;;  $632B       $6327  
;;  $633A       $6336  
;;  $6340       $6332  
;;  $6344       $633E  
;;  $634A       $633C  
;;  $635C       $6352  
;;  $6360       $635A  
;;  $6366       $6322   $6358  
;;  $63DF       $63BA   $63C0   $63C9  
;;  $6408       $6401  
;;  $6437       $6433  
;;  $6469       $6465  
;;  $6474       $63B6   $6425   $642B   $6439  
;;  $6489       $6483  
;;  $648B       $D1D1  
;;  $64D9       $6414   $6BC2   $D616  
;;  $64EB       $64F3  
;;  $64F9       $6390   $6395   $D1CE  
;;  $64FA       $6502   $6509  
;;  $650C       $5C7F   $5CFA   $6498  
;;  $6516       $6517   $651A  
;;  $651F       $643B  
;;  $6529       $652A  
;;  $6552       $5DDF  
;;  $655C       $6561  
;;  $6563       $655D  
;;  $6581       $6557  
;;  $65B2       $659F   $65A8  
;;  $65B4       $6598  
;;  $65BD       $65B8  
;;  $65ED       $65ED  
;;  $65FE       $65FE  
;;  $6626       $661F  
;;  $6629       $6624  
;;  $6634       $6634  
;;  $6656       $663C   $6645   $664C  
;;  $6674       $6666  
;;  $6706       $6706  
;;  $6711       $66D2  
;;  $672E       $6728  
;;  $674A       $6747  
;;  $6768       $6606   $669C   $66A2   $66C9   $6783   $D308  
;;  $67AE       $677B   $6789   $679C  
;;  $67B9       $676C   $6779  
;;  $67BA       $67B7  
;;  $67DC       $6637   $663F   $6648   $6652   $6678   $6688   $671A   $671F  
;;  $67DC       $6730   $6758  
;;  $67E4       $67AE  
;;  $67ED       $666A   $6736   $67E8  
;;  $67F4       $67FA   $67FF  
;;  $6802       $67F7  
;;  $6803       $6801  
;;  $6804       $67E1   $6812   $6826  
;;  $6805       $6663   $66D4   $671C   $6780  
;;  $681A       $680C  
;;  $6825       $682F  
;;  $682C       $681F  
;;  $6835       $6818   $682A  
;;  $683C       $68B2  
;;  $684D       $6840  
;;  $684E       $6571   $67A4   $6832   $6848  
;;  $6854       $6850  
;;  $6857       $5032   $67BC  
;;  $6870       $DCBD  
;;  $6876       $6872   $687E  
;;  $6880       $504A   $6936  
;;  $688E       $6896   $689C  
;;  $689E       $6898  
;;  $68A1       $68BB  
;;  $68B8       $68A6   $68AC  
;;  $68BE       $5E02   $6574   $68B5  
;;  $68DB       $68D7  
;;  $68DE       $68D1  
;;  $68E6       $D6D9  
;;  $68EB       $6912  
;;  $690D       $68FF  
;;  $690E       $6904  
;;  $690F       $68ED   $68F3  
;;  $6922       $6926  
;;  $6932       $692C  
;;  $693A       $55A9  
;;  $6956       $6948   $6951  
;;  $6957       $6943  
;;  $695D       $6959  
;;  $6967       $5AA7  
;;  $6979       $697C  
;;  $6984       $6988  
;;  $698B       $5D4F   $6BD3   $D622   $DC37  
;;  $69C8       $69C2  
;;  $69D5       $69D1  
;;  $6A03       $69FD  
;;  $6A0E       $698F  
;;  $6A15       $69E8  
;;  $6A1D       $6A8F   $D5FF  
;;  $6A32       $6A2E  
;;  $6A47       $6A43  
;;  $6A66       $6953  
;;  $6ABC       $6A21   $6A5F   $6AAA  
;;  $6ABD       $6A87   $6A95  
;;  $6ACB       $6AC7  
;;  $6AE2       $6AE2  
;;  $6AF3       $6ACB  
;;  $6AF7       $6AFC  
;;  $6B06       $6D85  
;;  $6B0F       $6AF8  
;;  $6B14       $6B01  
;;  $6B17       $6B06   $6B0D  
;;  $6B24       $6B3B  
;;  $6B30       $6B48   $6B4D   $6B52   $6B57  
;;  $6B39       $6B35  
;;  $6B3E       $6B2E  
;;  $6B5A       $55A3  
;;  $6BAC       $6BA2   $6BA8  
;;  $6BDF       $6BDA   $6BE9   $6BEE   $6BF3   $6C24   $6C64   $6C70  
;;  $6BFE       $6C26  
;;  $6C1F       $6B65  
;;  $6C6B       $6BDC  
;;  $6C6C       $6C5D   $6C6A  
;;  $6C75       $6C43   $6C68  
;;  $6C99       $670C   $67C7   $F2D6  
;;  $6CA8       $6CA3  
;;  $6CF7       $668A  
;;  $6D21       $6D21  
;;  $6D64       $FD67   $FD8C  
;;  $6D6D       $6D74  
;;  $6D77       $F894  
;;  $6DB7       $5076   $50E0   $D8C6   $F5A7  
;;  $6DCB       $6DC9  
;;  $6DD6       $6DBB  
;;  $6DE2       $6E16  
;;  $6E4C       $6E4A  
;;  $6E59       $6E57  
;;  $6E78       $6E76  
;;  $6F72       $6F70  
;;  $6F92       $6EA5  
;;  $6F94       $6F9E  
;;  $6FE3       $6FE3  
;;  $6FF6       $6FF4  
;;  $D000       $D007  
;;  $D016       $D024  
;;  $D022       $D020  
;;  $D026       $D018  
;;  $D02E       $D02C  
;;  $D038       $D035  
;;  $D04B       $D03F   $D045  
;;  $D06B       $D068  
;;  $D06D       $D05D  
;;  $D073       $D06F  
;;  $D075       $D06B  
;;  $D0BA       $D0B8  
;;  $D136       $D090  
;;  $D1B7       $D1A4   $D1B0  
;;  $D1E4       $D217  
;;  $D1E7       $D223   $D231   $D243  
;;  $D1EB       $D208   $D213   $D22D  
;;  $D1ED       $D1E9  
;;  $D1EF       $D190   $D19A   $D19F   $D1B5   $D1F6   $D20E  
;;  $D358       $D354  
;;  $D3A5       $D39E   $D3A1  
;;  $D3C0       $D3B8  
;;  $D456       $D452  
;;  $D462       $D45B  
;;  $D4A1       $D497   $D49E  
;;  $D4DF       $D4DC  
;;  $D50C       $D267   $D27A   $D306   $D4CD   $D4D6  
;;  $D555       $D552  
;;  $D557       $D542   $D56E  
;;  $D566       $D562  
;;  $D584       $D580  
;;  $D59C       $D535   $D598  
;;  $D604       $D5E9   $D5EF   $D5F5   $D647  
;;  $D65A       $D656  
;;  $D712       $D716  
;;  $DA05       $DA82  
;;  $DA35       $DA03  
;;  $DA42       $DA3C  
;;  $DA52       $DA47  
;;  $DAB0       $DAAE  
;;  $DAEC       $DAE9  
;;  $DAED       $DAE7  
;;  $DB06       $DA99   $DA9E   $DAAB   $DAB1  
;;  $DB4C       $DB48  
;;  $DB50       $DB4D  
;;  $DB99       $DB93  
;;  $DB9F       $DB99  
;;  $DBA1       $DB9D  
;;  $DBDB       $DC60  
;;  $DCCD       $DCCD  
;;  $DCD0       $DCCE  
;;  $DD61       $DD51  
;;  $DD72       $DD66  
;;  $DD76       $DD5F  
;;  $DDA6       $DDAF  
;;  $DDA8       $DDAC  
;;  $DDCE       $DDB1   $DDC0  
;;  $DDD0       $DDC5  
;;  $DDD1       $DD68  
;;  $DDEA       $DD44   $DDFD   $DE07  
;;  $DE00       $DDFA  
;;  $DE44       $DE41  
;;  $DE5D       $DE58  
;;  $DE5F       $DE5B  
;;  $DE89       $DE86  
;;  $DEA5       $DE37   $DECA   $DEE3   $DEE9  
;;  $DEAA       $DEAC  
;;  $DED0       $DECE  
;;  $DF4A       $DF3B  
;;  $DF5B       $DF60  
;;  $DF70       $DF8E  
;;  $DF72       $DF87  
;;  $DF7E       $DF7A  
;;  $DF90       $644D  
;;  $DFDB       $DFEB  
;;  $DFDD       $DFE4  
;;  $DFDE       $6906   $D4B6   $F45D  
;;  $F018       $F008  
;;  $F021       $F01D  
;;  $F029       $F025  
;;  $F039       $F036  
;;  $F03B       $F034  
;;  $F045       $F03D  
;;  $F05B       $F043   $F055  
;;  $F05F       $F039  
;;  $F063       $F02C  
;;  $F069       $F067  
;;  $F074       $F078  
;;  $F07B       $F074  
;;  $F082       $F003  
;;  $F098       $F08C  
;;  $F09C       $F096  
;;  $F0BB       $F0B9  
;;  $F0DF       $F0C7  
;;  $F0E6       $F0E4  
;;  $F0EA       $F0E6  
;;  $F0F6       $F0EE  
;;  $F106       $F100  
;;  $F108       $F104  
;;  $F12F       $F0FC  
;;  $F13C       $F10E   $F12D   $F139   $F2ED  
;;  $F149       $F14B  
;;  $F157       $F0EB   $F0F4   $F0F9  
;;  $F15C       $F0C2  
;;  $F172       $F179  
;;  $F1DB       $F1D7  
;;  $F212       $F20C  
;;  $F221       $F21B  
;;  $F23C       $F248  
;;  $F244       $F23E  
;;  $F252       $F257  
;;  $F266       $F287  
;;  $F281       $F27B  
;;  $F28D       $F292  
;;  $F294       $F28D  
;;  $F2CC       $F2C6  
;;  $F2E2       $F2DC  
;;  $F306       $F30F  
;;  $F329       $F324  
;;  $F3A7       $F3A3  
;;  $F432       $F42E  
;;  $F46E       $F46C  
;;  $F46F       $F46D  
;;  $F48E       $F44B  
;;  $F494       $F491  
;;  $F4B1       $F4AE  
;;  $F4B3       $F498   $F49E   $F4A6  
;;  $F4D1       $F4CE  
;;  $F58A       $F536   $F543   $F57A  
;;  $F590       $F5AA   $F6A6  
;;  $F5C1       $F5B9  
;;  $F607       $F5FF  
;;  $F635       $F62D  
;;  $F63A       $F62F  
;;  $F6D0       $F6C6  
;;  $F6D9       $F6DE  
;;  $F7AC       $F7C4   $F7CD  
;;  $F7BC       $F7B6  
;;  $F7C6       $F7B3  
;;  $F7C8       $F7CB  
;;  $F7CF       $F7AF  
;;  $F85D       $F85D  
;;  $F860       $F860  
;;  $F862       $F862  
;;  $F86E       $F86E  
;;  $F871       $F871  
;;  $F877       $F877  
;;  $F886       $F886  
;;  $F8C2       $F8BA  
;;  $F8C3       $F8C1  
;;  $F90E       $F908  
;;  $F94F       $F92A  
;;  $FA27       $FA23  
;;  $FA28       $FA1F  
;;  $FA5F       $FA5A  
;;  $FA60       $FA58   $FA5E  
;;  $FA77       $FA70  
;;  $FB7F       $FB84  
;;  $FB8A       $FB93  
;;  $FBD3       $FBD7  
;;  $FBD9       $FBD3  
;;  $FC08       $FC06  
;;  $FC2C       $FC2A  
;;  $FC2D       $FC2B  
;;  $FD7C       $FD89  
;;  $FD7D       $FD87  
;;  $FDA1       $FDC2  
;;  $FDA2       $FDC0  
;;  $FDE0       $FDDB  
;;  $FE10       $FE09  
;;  $FE1B       $FE11  
;;  $FE24       $FE1C  
;;  $FE2C       $FE32  
;;  $FE31       $FE2D  
;;  $FE34       $FE25  
;;  $FE3C       $FE42  
;;  $FE41       $FE3D  
;;  $FE44       $FE35  
;;  $FE47       $FE4E  
;;  $FE50       $FE45  
;;  $FE53       $FE59  
;;  $FE5B       $FE51   $FE55  
;;  $FE7B       $FE78  
;;  $FE8E       $FE97  
;;  $FE92       $FE90  
;;  $FEB6       $FEBF  
;;  $FEC1       $FEB8  
;;  $FECA       $FED0  
;;  $FED4       $FECC  
;;  $FEFC       $FCE4  
;;  $FF02       $FEE8   $FF4F   $FF85  
;;  $FF03       $FEEE  
;;  $FF2E       $FF28  
;;  $FF55       $FF53  
;;  $FF66       $FF5A  
;;  $FF67       $6D3E   $6DA5   $6DB0  
;;  $FF68       $F934   $F93C   $F944   $F94C   $FF64  
;;  $FF7E       $6D30   $6D37   $6D46   $6D5F  
;;  $FF83       $6D82   $6D8C   $6D96   $6D9C   $FDB3  
;;  $FF9E       $FF96  
;;  $FFAE       $FF9C   $FFA2   $FFAA  
;;  $FFB7       $5083  
;; ======================================================================== ;;
