
        ORG     $5000
.HEADER:
        BIDECLE $630A           ; 5000  Ptr: MOB graphic images
        BIDECLE $50B1           ; 5002  Ptr: EXEC timer table
        BIDECLE $501A           ; 5004  Ptr: Start of game
        BIDECLE $653A           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $65C2           ; 5008  Ptr: GRAM init sequence
        BIDECLE $50A5           ; 500A  Ptr: Date/Title
        DECLE   $0000           ; 500C  Key-click / flags
        DECLE   $0003           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0004,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init


        XORR    R6,     R0                      ; 5014   01F0
        XORR    R4,     R0                      ; 5015   01E0
        XORR    R2,     R0                      ; 5016   01D0
        CLRR    R0                              ; 5017   01C0
        ANDR    R6,     R0                      ; 5018   01B0
        XORR    R3,     R0                      ; 5019   01D8
.START:
        PSHR    R5                              ; 501A   0275

        JSR     R5,     L_569F                  ; 501B   0004 0154 029F

        MVO     R0,     G_034C                  ; 501E   0240 034C
        SDBD                                    ; 5020   0001
        MVII    #$5717, R0                      ; 5021   02B8 0017 0057
        MVO     R0,     G_035D                  ; 5024   0240 035D
        SDBD                                    ; 5026   0001
        MVII    #$5374, R0                      ; 5027   02B8 0074 0053
        MVO     R0,     G_033C                  ; 502A   0240 033C

        JSR     R5,     L_5E8B                  ; 502C   0004 015C 028B
        DECLE   $001C                           ; 502F   001C

        CLRR    R1                              ; 5030   01C9
        MVO     R1,     G_01CF                  ; 5031   0241 01CF
        MVO     R1,     G_01D0                  ; 5033   0241 01D0
        MVO     R1,     G_01D9                  ; 5035   0241 01D9
        SDBD                                    ; 5037   0001
        MVII    #$6A12, R4                      ; 5038   02BC 0012 006A
        SDBD                                    ; 503B   0001
        MVI@    R4,     R1                      ; 503C   02A1
        MVII    #$01D1, R5                      ; 503D   02BD 01D1
        MVO@    R1,     R5                      ; 503F   0269
        SWAP    R1,     1                       ; 5040   0041
        MVO@    R1,     R5                      ; 5041   0269
        SDBD                                    ; 5042   0001
        MVII    #$6A24, R4                      ; 5043   02BC 0024 006A
        SDBD                                    ; 5046   0001
        MVI@    R4,     R1                      ; 5047   02A1
        MVO@    R1,     R5                      ; 5048   0269
        SWAP    R1,     1                       ; 5049   0041
        MVO@    R1,     R5                      ; 504A   0269
        PULR    R5                              ; 504B   02B5
L_504C:
        EIS                                     ; 504C   0002
        MVI     G_0102, R0                      ; 504D   0280 0102
        DECR    R0                              ; 504F   0010
        BPL     L_504C                          ; 5050   0223 0005

        MVI     G_0103, R1                      ; 5052   0281 0103
        MVO     R1,     G_0102                  ; 5054   0241 0102
        MVI     G_034C, R0                      ; 5056   0280 034C
        ANDI    #$0002, R0                      ; 5058   03B8 0002
        BEQ     L_5076                          ; 505A   0204 001A

        MVI     G_01CB, R0                      ; 505C   0280 01CB
        TSTR    R0                              ; 505E   0080
        BNEQ    L_5066                          ; 505F   020C 0005

        JSR     R5,     L_50BD                  ; 5061   0004 0150 00BD
        BIDECLE $50EC                           ; 5064   00EC 0050
L_5066:
        MVI     G_01CC, R0                      ; 5066   0280 01CC
        TSTR    R0                              ; 5068   0080
        BNEQ    L_5070                          ; 5069   020C 0005

        JSR     R5,     L_50BD                  ; 506B   0004 0150 00BD
        BIDECLE $50F0                           ; 506E   00F0 0050
L_5070:
        JSR     R5,     .EXEC.1FA               ; 5070   0004 0110 01FA
        DECLE   $0004,  $016C,  $012C           ; 5073   0004 016C 012C
L_5076:
        JSR     R5,     .EXEC.7D5               ; 5076   0004 0114 03D5
        JSR     R5,     .EXEC.4F1               ; 5079   0004 0114 00F1
        JSR     R5,     .EXEC.AAD               ; 507C   0004 0118 02AD

        B       L_504C                          ; 507F   0220 0034

L_5081:
        JSR     R5,     L_514E                  ; 5081   0004 0150 014E

        CLRR    R0                              ; 5084   01C0
        MVO     R0,     G_017E                  ; 5085   0240 017E
        MVO     R0,     G_017F                  ; 5087   0240 017F
        MVII    #$0002, R0                      ; 5089   02B8 0002
        COMR    R0                              ; 508B   0018
        AND     G_034C, R0                      ; 508C   0380 034C
        MVO     R0,     G_034C                  ; 508E   0240 034C
        SDBD                                    ; 5090   0001
        MVII    #$5374, R0                      ; 5091   02B8 0074 0053
        MVO     R0,     G_033C                  ; 5094   0240 033C

        JSR     R5,     L_5E8B                  ; 5096   0004 015C 028B
        DECLE   $001C                           ; 5099   001C

        MVI     G_034C, R5                      ; 509A   0285 034C
        ANDI    #$0004, R5                      ; 509C   03BD 0004
        BEQ     L_50A4                          ; 509E   0204 0004

        JSR     R5,     L_5E8B                  ; 50A0   0004 015C 028B
        DECLE   $0000                           ; 50A3   0000
L_50A4:
        PULR    R7                              ; 50A4   02B7

.TITLE:
        DECLE   $0052                           ; 50A5  Cartridge year
        STRING  "MOTO-CROSS"                    ; 50A6  Title string
        DECLE   $0000                           ; 50B0  

.TIMER:
        DECLE   $009D,  $0052,  $0001,  $0000; 50B1  Timer dispatch/interval
        DECLE   $001D,  $0069,  $0004,  $0000; 50B5  Timer dispatch/interval
        BIDECLE $0000           ; 50B9  End of timer table

        DECLE   $0000,  $0000                   ; 50BB   0000 0000
L_50BD:
        SDBD                                    ; 50BD   0001
        MVI@    R5,     R4                      ; 50BE   02AC
        PSHR    R5                              ; 50BF   0275
        MVI@    R4,     R5                      ; 50C0   02A5
        MVI@    R5,     R0                      ; 50C1   02A8

        JSR     R5,     X_UNPK_BYTES            ; 50C2   0004 0114 0357

        SUB     G_01DE, R1                      ; 50C5   0301 01DE
        SUB     G_01DB, R0                      ; 50C7   0300 01DB

        JSR     R5,     X_PACK_BYTES            ; 50C9   0004 0114 034F
        JSR     R5,     X_UNPK_BYTES            ; 50CC   0004 0114 0357

        SLL     R0,     2                       ; 50CF   004C
        SLL     R0,     2                       ; 50D0   004C
        MVI@    R4,     R5                      ; 50D1   02A5
        MVI@    R5,     R2                      ; 50D2   02AA
        MVI@    R4,     R5                      ; 50D3   02A5
        MVI@    R5,     R3                      ; 50D4   02AB
        SLL     R1,     2                       ; 50D5   004D
        SLL     R1,     2                       ; 50D6   004D
        ADDR    R1,     R3                      ; 50D7   00CB
        ADDR    R0,     R2                      ; 50D8   00C2
        SWAP    R2,     1                       ; 50D9   0042
        SWAP    R3,     1                       ; 50DA   0043
        MVO     R2,     G_01C7                  ; 50DB   0242 01C7
        MVO     R3,     G_01C8                  ; 50DD   0243 01C8
        MVI@    R4,     R0                      ; 50DF   02A0
        MVO     R0,     G_0117                  ; 50E0   0240 0117

        JSR     R5,     L_5CB7                  ; 50E2   0004 015C 00B7
        JSR     R5,     L_5B42                  ; 50E5   0004 0158 0342
        JSR     R5,     L_5CCB                  ; 50E8   0004 015C 00CB

        PULR    R7                              ; 50EB   02B7

        SUB@    R4,     R1                      ; 50EC   0321
        SUB@    R3,     R7                      ; 50ED   031F

        DECLE   $0320,  $0000                   ; 50EE   0320 0000

        SUBI    #$0337, R1                      ; 50F0   0339 0337
        SUBI    #$0001, R0                      ; 50F2   0338 0001

L_50F4:
        JSR     R5,     L_569F                  ; 50F4   0004 0154 029F

        SDBD                                    ; 50F7   0001
        MVII    #$5717, R0                      ; 50F8   02B8 0017 0057
        MVO     R0,     G_035D                  ; 50FB   0240 035D
        SDBD                                    ; 50FD   0001
        MVII    #$5109, R0                      ; 50FE   02B8 0009 0051
        MVO     R0,     G_033C                  ; 5101   0240 033C
        CLRR    R0                              ; 5103   01C0
        MVO     R0,     G_0316                  ; 5104   0240 0316
        MVO     R0,     G_0317                  ; 5106   0240 0317
        PULR    R7                              ; 5108   02B7

        JSR     R5,     L_5E8B                  ; 5109   0004 015C 028B
        DECLE   $0268                           ; 510C   0268

        MVII    #$022E, R4                      ; 510D   02BC 022E
        CLRR    R3                              ; 510F   01DB

        JSR     R5,     X_PRINT_R5              ; 5110   0004 0118 007B
        STRING  "FINAL"                         ; 5113  
        DECLE   $0000                           ; 5118   0000

        MVII    #$0242, R4                      ; 5119   02BC 0242

        JSR     R5,     X_PRINT_R5              ; 511B   0004 0118 007B
        STRING  "TIME"                          ; 511E   0054 0049 004D 0045
        DECLE   $0000                           ; 5122   0000

        MVI     G_0324, R0                      ; 5123   0280 0324
        SLR     R0,     2                       ; 5125   0064
        BEQ     L_5131                          ; 5126   0204 0009

        MVII    #$0002, R3                      ; 5128   02BB 0002
        MVII    #$0235, R4                      ; 512A   02BC 0235
        MVII    #$0003, R1                      ; 512C   02B9 0003

        JSR     R5,     X_PRNUM_RGT             ; 512E   0004 0118 00C5

L_5131:
        MVI     G_032C, R0                      ; 5131   0280 032C
        SLR     R0,     2                       ; 5133   0064
        BEQ     L_513E                          ; 5134   0204 0008

        CLRR    R3                              ; 5136   01DB
        MVII    #$0249, R4                      ; 5137   02BC 0249
        MVII    #$0003, R1                      ; 5139   02B9 0003

        JSR     R5,     X_PRNUM_RGT             ; 513B   0004 0118 00C5

L_513E:
        SDBD                                    ; 513E   0001
        MVII    #$5145, R0                      ; 513F   02B8 0045 0051
        MVO     R0,     G_033C                  ; 5142   0240 033C
        PULR    R7                              ; 5144   02B7

        CMPI    #$0001, R0                      ; 5145   0378 0001
        BEQ     L_51E7                          ; 5147   0204 009E

        CMPI    #$0002, R0                      ; 5149   0378 0002
        BEQ     L_5081                          ; 514B   0224 00CB
        PULR    R7                              ; 514D   02B7

L_514E:
        PSHR    R5                              ; 514E   0275
        MVII    #$0003, R1                      ; 514F   02B9 0003
        MVII    #$0007, R3                      ; 5151   02BB 0007
        MVI     G_0318, R4                      ; 5153   0284 0318

        JSR     R5,     X_PRNUM_RGT             ; 5155   0004 0118 00C5
        JSR     R5,     L_56AC                  ; 5158   0004 0154 02AC

        PULR    R7                              ; 515B   02B7

        CMPI    #$000A, R0                      ; 515C   0378 000A
        BC      L_5174                          ; 515E   0201 0014

        TSTR    R0                              ; 5160   0080
        BNEQ    L_5165                          ; 5161   020C 0002

        MVII    #$000A, R0                      ; 5163   02B8 000A
L_5165:
        MVO     R0,     G_0129                  ; 5165   0240 0129

        JSR     R5,     L_514E                  ; 5167   0004 0150 014E

        SDBD                                    ; 516A   0001
        MVII    #$5175, R0                      ; 516B   02B8 0075 0051
        MVO     R0,     G_033C                  ; 516E   0240 033C

        JSR     R5,     L_5E8B                  ; 5170   0004 015C 028B
        DECLE   $00CC                           ; 5173   00CC
L_5174:
        PULR    R7                              ; 5174   02B7

        CMPI    #$0006, R0                      ; 5175   0378 0006
        BC      L_5174                          ; 5177   0221 0004

        TSTR    R0                              ; 5179   0080
        BEQ     L_5174                          ; 517A   0224 0007

        MVO     R0,     G_012A                  ; 517C   0240 012A

        JSR     R5,     L_514E                  ; 517E   0004 0150 014E

        SDBD                                    ; 5181   0001
        MVII    #$51B4, R0                      ; 5182   02B8 00B4 0051
        MVO     R0,     G_033C                  ; 5185   0240 033C
        MVI     G_012A, R0                      ; 5187   0280 012A
        CMPI    #$0004, R0                      ; 5189   0378 0004
        BC      L_51A9                          ; 518B   0201 001C

        JSR     R5,     L_5E8B                  ; 518D   0004 015C 028B
        DECLE   $02D4                           ; 5190   02D4

        MVI     G_012A, R0                      ; 5191   0280 012A
        CMPI    #$0002, R0                      ; 5193   0378 0002
        BEQ     L_51B3                          ; 5195   0204 001C

        MVII    #$0001, R0                      ; 5197   02B8 0001
        MVO     R0,     G_017F                  ; 5199   0240 017F
        PULR    R7                              ; 519B   02B7

L_519C:
        MVI     G_017E, R0                      ; 519C   0280 017E
        TSTR    R0                              ; 519E   0080
        BEQ     L_51B3                          ; 519F   0204 0012

        MVI     G_017F, R0                      ; 51A1   0280 017F
        TSTR    R0                              ; 51A3   0080
        BEQ     L_51B3                          ; 51A4   0204 000D

        JSR     R5,     L_56AC                  ; 51A6   0004 0154 02AC
L_51A9:
        JSR     R5,     L_5E8B                  ; 51A9   0004 015C 028B
        DECLE   $0204                           ; 51AC   0204

        SDBD                                    ; 51AD   0001
        MVII    #$51DB, R0                      ; 51AE   02B8 00DB 0051
        MVO     R0,     G_033C                  ; 51B1   0240 033C
L_51B3:
        PULR    R7                              ; 51B3   02B7

        MOVR    R1,     R3                      ; 51B4   008B
        TSTR    R0                              ; 51B5   0080
        BEQ     L_51B3                          ; 51B6   0224 0004

        CMPI    #$0003, R0                      ; 51B8   0378 0003
        BC      L_51B3                          ; 51BA   0221 0008

        MOVR    R0,     R4                      ; 51BC   0084
        DECR    R0                              ; 51BD   0010
        SLL     R0,     1                       ; 51BE   0048
        INCR    R0                              ; 51BF   0008
        SDBD                                    ; 51C0   0001
        ADDI    #$017E, R3                      ; 51C1   02FB 007E 0001
        MVI@    R3,     R2                      ; 51C4   029A
        TSTR    R2                              ; 51C5   0092
        BNEQ    L_51B3                          ; 51C6   022C 0014

        MVO@    R0,     R3                      ; 51C8   0258
        MOVR    R4,     R0                      ; 51C9   00A0
        CLRR    R3                              ; 51CA   01DB
        TSTR    R1                              ; 51CB   0089
        MVII    #$0001, R1                      ; 51CC   02B9 0001
        MVII    #$02BD, R4                      ; 51CE   02BC 02BD
        BNEQ    L_51D6                          ; 51D0   020C 0004

        MVII    #$0002, R3                      ; 51D2   02BB 0002
        MVII    #$02A9, R4                      ; 51D4   02BC 02A9

L_51D6:
        JSR     R5,     X_PRNUM_RGT             ; 51D6   0004 0118 00C5

        B       L_519C                          ; 51D9   0220 003E

        MVII    #$0001, R1                      ; 51DB   02B9 0001
        CMPR    R1,     R0                      ; 51DD   0148
        BEQ     L_51E5                          ; 51DE   0204 0005

        CMPI    #$0002, R0                      ; 51E0   0378 0002
        BNEQ    L_5174                          ; 51E2   022C 006F

        CLRR    R1                              ; 51E4   01C9
L_51E5:
        MVO     R1,     G_0116                  ; 51E5   0241 0116

L_51E7:
        JSR     R5,     L_514E                  ; 51E7   0004 0150 014E
        JSR     R5,     L_569F                  ; 51EA   0004 0154 029F

        MVI     G_017E, R3                      ; 51ED   0283 017E
        PSHR    R3                              ; 51EF   0273
        MVI     G_017F, R3                      ; 51F0   0283 017F
        PSHR    R3                              ; 51F2   0273
        MVO     R0,     G_01C9                  ; 51F3   0240 01C9
        MVO     R0,     G_01CA                  ; 51F5   0240 01CA
        MVO     R0,     G_012F                  ; 51F7   0240 012F
        MVO     R0,     G_0324                  ; 51F9   0240 0324
        MVO     R0,     G_032C                  ; 51FB   0240 032C
        MVO     R0,     G_0163                  ; 51FD   0240 0163
        MVO     R0,     G_012B                  ; 51FF   0240 012B
        MVO     R0,     G_0318                  ; 5201   0240 0318
        MVO     R0,     G_012C                  ; 5203   0240 012C
        MVII    #$0020, R1                      ; 5205   02B9 0020
        MVII    #$0164, R4                      ; 5207   02BC 0164
L_5209:
        MVO@    R0,     R4                      ; 5209   0260
        DECR    R1                              ; 520A   0011
        BNEQ    L_5209                          ; 520B   022C 0003

        PULR    R3                              ; 520D   02B3
        MVO     R3,     G_017F                  ; 520E   0243 017F
        PULR    R3                              ; 5210   02B3
        MVO     R3,     G_017E                  ; 5211   0243 017E
        MVII    #$0020, R0                      ; 5213   02B8 0020
        COMR    R0                              ; 5215   0018
        AND     G_034C, R0                      ; 5216   0380 034C
        MVO     R0,     G_034C                  ; 5218   0240 034C
        MVI     G_012A, R0                      ; 521A   0280 012A
        DECR    R0                              ; 521C   0010
        SLL     R0,     1                       ; 521D   0048
        MOVR    R0,     R4                      ; 521E   0084
        SDBD                                    ; 521F   0001
        ADDI    #$5724, R4                      ; 5220   02FC 0024 0057
        MVI@    R4,     R0                      ; 5223   02A0
        MVO     R0,     G_0180                  ; 5224   0240 0180
        MVI@    R4,     R0                      ; 5226   02A0
        MVO     R0,     G_0181                  ; 5227   0240 0181
        SDBD                                    ; 5229   0001
        MVII    #$5893, R0                      ; 522A   02B8 0093 0058
        MVO     R0,     G_035D                  ; 522D   0240 035D
        MVI     G_0129, R0                      ; 522F   0280 0129
        MVO     R0,     G_012D                  ; 5231   0240 012D
        MVO     R0,     G_012E                  ; 5233   0240 012E
        MVII    #$004E, R3                      ; 5235   02BB 004E
        MVII    #$0002, R1                      ; 5237   02B9 0002
        MVO     R3,     G_0134                  ; 5239   0243 0134
        MVO     R1,     G_0135                  ; 523B   0241 0135
        MVII    #$0006, R0                      ; 523D   02B8 0006
        MVO     R0,     G_0104                  ; 523F   0240 0104
        MVI     G_0116, R0                      ; 5241   0280 0116
        ADD     G_0135, R0                      ; 5243   02C0 0135
        MVO     R0,     G_0135                  ; 5245   0240 0135

        JSR     R5,     L_5D63                  ; 5247   0004 015C 0163

        MVII    #$000E, R2                      ; 524A   02BA 000E
        MVI     G_0116, R0                      ; 524C   0280 0116
        TSTR    R0                              ; 524E   0080
        BEQ     L_5253                          ; 524F   0204 0002

        SUBI    #$0008, R2                      ; 5251   033A 0008
L_5253:
        MVII    #$0174, R4                      ; 5253   02BC 0174
        MVII    #$0172, R5                      ; 5255   02BD 0172
        MVO@    R2,     R4                      ; 5257   0262
        MVO@    R2,     R5                      ; 5258   026A
        MVO@    R2,     R4                      ; 5259   0262
        MVO@    R2,     R5                      ; 525A   026A
        MVII    #$0002, R3                      ; 525B   02BB 0002
        MVII    #$031D, R2                      ; 525D   02BA 031D
        SDBD                                    ; 525F   0001
        MVII    #$572E, R1                      ; 5260   02B9 002E 0057
        MVI     G_034C, R0                      ; 5263   0280 034C
        PSHR    R0                              ; 5265   0270
L_5266:
        MVII    #$0003, R0                      ; 5266   02B8 0003

        JSR     R5,     X_INIT_MOBS             ; 5268   0004 0114 02B4

        ADDI    #$0018, R2                      ; 526B   02FA 0018
        DECR    R3                              ; 526D   0013
        BNEQ    L_5266                          ; 526E   022C 0009

        PULR    R0                              ; 5270   02B0
        MVO     R0,     G_034C                  ; 5271   0240 034C
        MVII    #$0040, R0                      ; 5273   02B8 0040
        MVO     R0,     G_0335                  ; 5275   0240 0335
        MVII    #$0061, R0                      ; 5277   02B8 0061
        SWAP    R0,     1                       ; 5279   0040
        MVO     R0,     G_0337                  ; 527A   0240 0337
        SDBD                                    ; 527C   0001
        SUBI    #$0700, R0                      ; 527D   0338 0000 0007
        MVO     R0,     G_0347                  ; 5280   0240 0347
        MVII    #$002D, R0                      ; 5282   02B8 002D
        SWAP    R0,     1                       ; 5284   0040
        MVO     R0,     G_0338                  ; 5285   0240 0338
        SDBD                                    ; 5287   0001
        ADDI    #$0500, R0                      ; 5288   02F8 0000 0005
        MVO     R0,     G_0348                  ; 528B   0240 0348
        MVII    #$0012, R0                      ; 528D   02B8 0012
        MVO     R0,     G_011A                  ; 528F   0240 011A
        MVII    #$0002, R0                      ; 5291   02B8 0002
        MVO     R0,     G_0115                  ; 5293   0240 0115
        COMR    R0                              ; 5295   0018
        AND     G_034C, R0                      ; 5296   0380 034C
        XORI    #$0002, R0                      ; 5298   03F8 0002
        MVO     R0,     G_034C                  ; 529A   0240 034C
        PULR    R7                              ; 529C   02B7

L_529D:
        PSHR    R5                              ; 529D   0275
        MVI     G_0180, R4                      ; 529E   0284 0180
        CMPI    #$0004, R4                      ; 52A0   037C 0004
        BNEQ    L_52AA                          ; 52A2   020C 0006

        MVI     G_0181, R4                      ; 52A4   0284 0181
        CMPI    #$0004, R4                      ; 52A6   037C 0004
        BEQ     L_50F4                          ; 52A8   0224 01B5

L_52AA:
        MVI     G_0180, R4                      ; 52AA   0284 0180
        CMPI    #$0004, R4                      ; 52AC   037C 0004
        BNEQ    L_52B3                          ; 52AE   020C 0003

        CLRR    R0                              ; 52B0   01C0
        MVO     R0,     G_0316                  ; 52B1   0240 0316
L_52B3:
        MVI     G_0181, R4                      ; 52B3   0284 0181
        CMPI    #$0004, R4                      ; 52B5   037C 0004
        BNEQ    L_52BC                          ; 52B7   020C 0003

        CLRR    R0                              ; 52B9   01C0
        MVO     R0,     G_0317                  ; 52BA   0240 0317
L_52BC:
        MVI     G_017A, R0                      ; 52BC   0280 017A
        TSTR    R0                              ; 52BE   0080
        BNEQ    L_52D3                          ; 52BF   020C 0012

        MVI     G_017B, R0                      ; 52C1   0280 017B
        TSTR    R0                              ; 52C3   0080
        BNEQ    L_52D3                          ; 52C4   020C 000D

        MVI     G_0334, R2                      ; 52C6   0282 0334
        TSTR    R2                              ; 52C8   0092
        BNEQ    L_52DE                          ; 52C9   020C 0013

        INCR    R2                              ; 52CB   000A
        MVO     R2,     G_0334                  ; 52CC   0242 0334

        JSR     R5,     L_6A05                  ; 52CE   0004 0168 0205

        B       L_52DE                          ; 52D1   0200 000B

L_52D3:
        MVI     G_0334, R2                      ; 52D3   0282 0334
        TSTR    R2                              ; 52D5   0092
        BEQ     L_52DE                          ; 52D6   0204 0006

        CLRR    R2                              ; 52D8   01D2
        MVO     R2,     G_0334                  ; 52D9   0242 0334

        JSR     R5,     L_69E1                  ; 52DB   0004 0168 01E1

L_52DE:
        MVII    #$000A, R0                      ; 52DE   02B8 000A
        MVO     R0,     G_011D                  ; 52E0   0240 011D
        MVI     G_034C, R0                      ; 52E2   0280 034C
        ANDI    #$0010, R0                      ; 52E4   03B8 0010
        BEQ     L_52F4                          ; 52E6   0204 000C

        MVI     G_012F, R0                      ; 52E8   0280 012F

        JSR     R5,     L_66E8                  ; 52EA   0004 0164 02E8

        MVII    #$0010, R0                      ; 52ED   02B8 0010
        COMR    R0                              ; 52EF   0018
        AND     G_034C, R0                      ; 52F0   0380 034C
        MVO     R0,     G_034C                  ; 52F2   0240 034C
L_52F4:
        CLRR    R0                              ; 52F4   01C0
L_52F5:
        MVO     R0,     G_0117                  ; 52F5   0240 0117

        JSR     R5,     L_5CB7                  ; 52F7   0004 015C 00B7
        JSR     R5,     L_6777                  ; 52FA   0004 0164 0377
        JSR     R5,     L_5782                  ; 52FD   0004 0154 0382

        CLRR    R3                              ; 5300   01DB

        JSR     R5,     L_6CDB                  ; 5301   0004 016C 00DB

        BEQ     L_530E                          ; 5304   0204 0008

        MVI     G_0355, R0                      ; 5306   0280 0355
        INCR    R0                              ; 5308   0008
        INCR    R0                              ; 5309   0008
        ANDI    #$000F, R0                      ; 530A   03B8 000F
        MVO     R0,     G_0355                  ; 530C   0240 0355
L_530E:
        MVI     G_034C, R0                      ; 530E   0280 034C
        ANDI    #$0001, R0                      ; 5310   03B8 0001
        BNEQ    L_5317                          ; 5312   020C 0003

        JSR     R5,     L_57E6                  ; 5314   0004 0154 03E6
L_5317:
        JSR     R5,     L_5901                  ; 5317   0004 0158 0101
        JSR     R5,     L_6707                  ; 531A   0004 0164 0307
        JSR     R5,     L_5CCB                  ; 531D   0004 015C 00CB

        MVI     G_0117, R0                      ; 5320   0280 0117
        INCR    R0                              ; 5322   0008
        CMPI    #$0002, R0                      ; 5323   0378 0002
        BNEQ    L_52F5                          ; 5325   022C 0031

        MVI     G_034C, R0                      ; 5327   0280 034C
        XORI    #$0001, R0                      ; 5329   03F8 0001
        MVO     R0,     G_034C                  ; 532B   0240 034C

        JSR     R5,     L_661D                  ; 532D   0004 0164 021D
        JSR     R5,     L_6995                  ; 5330   0004 0168 0195

        PULR    R7                              ; 5333   02B7

L_5334:
        SDBD                                    ; 5334   0001
        MVII    #$1800, R4                      ; 5335   02BC 0000 0018
        INCR    R7                              ; 5338   000F

L_5339:
        CLRR    R4                              ; 5339   01E4
L_533A:
        SDBD                                    ; 533A   0001
        ADDI    #$534E, R3                      ; 533B   02FB 004E 0053
        MVI@    R3,     R1                      ; 533E   0299
        MVII    #$0003, R2                      ; 533F   02BA 0003
L_5341:
        MVI@    R1,     R0                      ; 5341   0288
        SDBD                                    ; 5342   0001
        ANDI    #$E3FF, R0                      ; 5343   03B8 00FF 00E3
        XORR    R4,     R0                      ; 5346   01E0
        MVO@    R0,     R1                      ; 5347   0248
        ADDI    #$0008, R1                      ; 5348   02F9 0008
        DECR    R2                              ; 534A   0012
        BNEQ    L_5341                          ; 534B   022C 000B
        MOVR    R5,     R7                      ; 534D   00AF

        SUB@    R3,     R5                      ; 534E   031D
        SUB@    R6,     R5                      ; 534F   0335
L_5350:
        PSHR    R5                              ; 5350   0275
        MOVR    R3,     R0                      ; 5351   0098
        ADDI    #$0176, R3                      ; 5352   02FB 0176
        MVII    #$0002, R2                      ; 5354   02BA 0002
L_5356:
        MVI@    R3,     R1                      ; 5356   0299
        SWAP    R1,     1                       ; 5357   0041
        SAR     R1,     1                       ; 5358   0069
        SWAP    R1,     1                       ; 5359   0041
        NEGR    R1                              ; 535A   0021
        MVO@    R1,     R3                      ; 535B   0259
        INCR    R3                              ; 535C   000B
        INCR    R3                              ; 535D   000B
        DECR    R2                              ; 535E   0012
        BNEQ    L_5356                          ; 535F   022C 000A

        MOVR    R0,     R3                      ; 5361   0083
        SDBD                                    ; 5362   0001
        ADDI    #$534E, R3                      ; 5363   02FB 004E 0053
        MVI@    R3,     R1                      ; 5366   0299
        ADDI    #$0008, R1                      ; 5367   02F9 0008
        MVI@    R1,     R0                      ; 5369   0288
        SDBD                                    ; 536A   0001
        ANDI    #$FBFF, R0                      ; 536B   03B8 00FF 00FB
        SDBD                                    ; 536E   0001
        XORI    #$0400, R0                      ; 536F   03F8 0000 0004
        MVO@    R0,     R1                      ; 5372   0248
        PULR    R7                              ; 5373   02B7

        TSTR    R0                              ; 5374   0080
        BEQ     L_50A4                          ; 5375   0224 02D2

        MVI     G_034C, R1                      ; 5377   0281 034C
        ANDI    #$0004, R1                      ; 5379   03B9 0004
        BNEQ    L_5381                          ; 537B   020C 0004

        CMPI    #$0005, R0                      ; 537D   0378 0005
        BC      L_50A4                          ; 537F   0221 02DC

L_5381:
        CMPI    #$0006, R0                      ; 5381   0378 0006
        BC      L_50A4                          ; 5383   0221 02E0

        PSHR    R0                              ; 5385   0270

        JSR     R5,     L_514E                  ; 5386   0004 0150 014E

        PULR    R0                              ; 5389   02B0
        DECR    R0                              ; 538A   0010
        CMPI    #$0003, R0                      ; 538B   0378 0003
        MVO     R0,     G_0185                  ; 538D   0240 0185
        SDBD                                    ; 538F   0001
        MVII    #$5402, R0                      ; 5390   02B8 0002 0054
        MVO     R0,     G_033C                  ; 5393   0240 033C
        BNEQ    L_539D                          ; 5395   020C 0006

        SDBD                                    ; 5397   0001
        MVII    #$570F, R0                      ; 5398   02B8 000F 0057
        MVO     R0,     G_035D                  ; 539B   0240 035D
L_539D:
        CLRR    R0                              ; 539D   01C0
        MVO     R0,     G_0181                  ; 539E   0240 0181

        JSR     R5,     L_53E8                  ; 53A0   0004 0150 03E8

        MVO     R0,     .STIC.MODE              ; 53A3   0240 0021

        JSR     R5,     L_5E8B                  ; 53A5   0004 015C 028B
        DECLE   $0098                           ; 53A8   0098

        MVI     G_0185, R0                      ; 53A9   0280 0185
        CMPI    #$0003, R0                      ; 53AB   0378 0003
        BEQ     L_53B8                          ; 53AD   0204 0009

        CMPI    #$0004, R0                      ; 53AF   0378 0004
        BNEQ    L_53E4                          ; 53B1   020C 0031

        DECR    R0                              ; 53B3   0010
        MVO     R0,     G_0185                  ; 53B4   0240 0185
        B       L_53E4                          ; 53B6   0200 002C

L_53B8:
        MVII    #$0040, R0                      ; 53B8   02B8 0040
        MVII    #$0187, R4                      ; 53BA   02BC 0187

        JSR     R5,     X_FILL_ZERO             ; 53BC   0004 0114 0338

        MVII    #$0001, R0                      ; 53BF   02B8 0001
        MVO     R0,     G_0135                  ; 53C1   0240 0135
        MVII    #$0004, R0                      ; 53C3   02B8 0004
        COMR    R0                              ; 53C5   0018
        AND     G_034C, R0                      ; 53C6   0380 034C
        XORI    #$0004, R0                      ; 53C8   03F8 0004
        MVO     R0,     G_034C                  ; 53CA   0240 034C
        MVII    #$0028, R0                      ; 53CC   02B8 0028
        MVO     R0,     G_0188                  ; 53CE   0240 0188
        MVII    #$0002, R0                      ; 53D0   02B8 0002
        MVO     R0,     G_0133                  ; 53D2   0240 0133
        CLRR    R0                              ; 53D4   01C0
        MVO     R0,     G_013A                  ; 53D5   0240 013A
        MVO     R0,     G_0134                  ; 53D7   0240 0134
        MVO     R0,     G_0136                  ; 53D9   0240 0136
        MVO     R0,     G_0137                  ; 53DB   0240 0137

L_53DD:
        JSR     R5,     L_549C                  ; 53DD   0004 0154 009C

        CMPI    #$0002, R0                      ; 53E0   0378 0002
        BNEQ    L_53DD                          ; 53E2   022C 0006

L_53E4:
        JSR     R5,     L_565A                  ; 53E4   0004 0154 025A

        PULR    R7                              ; 53E7   02B7

L_53E8:
        CLRR    R0                              ; 53E8   01C0
        MVO     R0,     G_0180                  ; 53E9   0240 0180
        MVII    #$0042, R0                      ; 53EB   02B8 0042
        MVII    #$0056, R1                      ; 53ED   02B9 0056
        MVO     R0,     .ISRVEC.0               ; 53EF   0240 0100
        MVO     R1,     .ISRVEC.1               ; 53F1   0241 0101
L_53F3:
        EIS                                     ; 53F3   0002
        MVI     G_0180, R0                      ; 53F4   0280 0180
        TSTR    R0                              ; 53F6   0080
        BEQ     L_53F3                          ; 53F7   0224 0005

        MVII    #$00B3, R0                      ; 53F9   02B8 00B3
        MVII    #$0056, R1                      ; 53FB   02B9 0056
        MVO     R0,     .ISRVEC.0               ; 53FD   0240 0100
        MVO     R1,     .ISRVEC.1               ; 53FF   0241 0101
        MOVR    R5,     R7                      ; 5401   00AF
        B       L_5680                          ; 5402   0200 027C

        PSHR    R5                              ; 5404   0275
        CMPI    #$000B, R0                      ; 5405   0378 000B
        BNEQ    L_541F                          ; 5407   020C 0016

        MVI     G_0180, R0                      ; 5409   0280 0180
        TSTR    R0                              ; 540B   0080
        BNEQ    L_5680                          ; 540C   020C 0272

        JSR     R5,     L_547C                  ; 540E   0004 0154 007C

        CLRR    R0                              ; 5411   01C0
L_5412:
        MVO     R0,     G_0137                  ; 5412   0240 0137

L_5414:
        JSR     R5,     L_549C                  ; 5414   0004 0154 009C

        CMPI    #$0002, R0                      ; 5417   0378 0002
        BNEQ    L_5414                          ; 5419   022C 0006

        JSR     R5,     L_565A                  ; 541B   0004 0154 025A

        PULR    R7                              ; 541E   02B7

L_541F:
        CMPI    #$000A, R0                      ; 541F   0378 000A
        BNEQ    L_549B                          ; 5421   020C 0078

        MVI     G_0134, R1                      ; 5423   0281 0134
        SLL     R1,     2                       ; 5425   004D
        SLL     R1,     1                       ; 5426   0049
        ADD     G_0133, R1                      ; 5427   02C1 0133
        CMPI    #$0002, R1                      ; 5429   0379 0002
        BEQ     L_549B                          ; 542B   0204 006E

        ADDI    #$0187, R1                      ; 542D   02F9 0187
        CLRR    R0                              ; 542F   01C0
        MVO@    R0,     R1                      ; 5430   0248
        MVI     G_0133, R0                      ; 5431   0280 0133
        SUB     G_0135, R0                      ; 5433   0300 0135
        MVO     R0,     G_0133                  ; 5435   0240 0133
        MVI     G_0134, R0                      ; 5437   0280 0134
        SUB     G_0136, R0                      ; 5439   0300 0136
        MVO     R0,     G_0134                  ; 543B   0240 0134
        MVI     G_0134, R1                      ; 543D   0281 0134
        SLL     R1,     2                       ; 543F   004D
        SLL     R1,     1                       ; 5440   0049
        ADD     G_0133, R1                      ; 5441   02C1 0133
        ADDI    #$0187, R1                      ; 5443   02F9 0187
        MVI@    R1,     R1                      ; 5445   0289
        ANDI    #$001F, R1                      ; 5446   03B9 001F
        CMPI    #$0007, R1                      ; 5448   0379 0007
        BNC     L_544E                          ; 544A   0209 0002

        MVII    #$0005, R1                      ; 544C   02B9 0005
L_544E:
        SLL     R1,     2                       ; 544E   004D
        SDBD                                    ; 544F   0001
        ADDI    #$6EEA, R1                      ; 5450   02F9 00EA 006E
L_5453:
        INCR    R1                              ; 5453   0009
        INCR    R1                              ; 5454   0009
        MVI@    R1,     R0                      ; 5455   0288
        ANDI    #$000F, R0                      ; 5456   03B8 000F
        DECR    R0                              ; 5458   0010
        ANDI    #$00FF, R0                      ; 5459   03B8 00FF
        CMP     G_0135, R0                      ; 545B   0340 0135
        BNEQ    L_5453                          ; 545D   022C 000B

        INCR    R1                              ; 545F   0009
        MVI@    R1,     R0                      ; 5460   0288
        ANDI    #$000F, R0                      ; 5461   03B8 000F
        DECR    R0                              ; 5463   0010
        ANDI    #$00FF, R0                      ; 5464   03B8 00FF
        DECR    R1                              ; 5466   0011
        CMP     G_0136, R0                      ; 5467   0340 0136
        BNEQ    L_5453                          ; 5469   022C 0017

        SUBI    #$0018, R1                      ; 546B   0339 0018
        MVI@    R1,     R0                      ; 546D   0288
        ANDI    #$000F, R0                      ; 546E   03B8 000F
        DECR    R0                              ; 5470   0010
        MVO     R0,     G_0135                  ; 5471   0240 0135
        INCR    R1                              ; 5473   0009
        MVI@    R1,     R0                      ; 5474   0288
        ANDI    #$000F, R0                      ; 5475   03B8 000F
        DECR    R0                              ; 5477   0010
        MVO     R0,     G_0136                  ; 5478   0240 0136
        B       L_5412                          ; 547A   0220 0069

L_547C:
        MVI     G_0131, R0                      ; 547C   0280 0131
        MVO     R0,     G_0135                  ; 547E   0240 0135
        ADD     G_0133, R0                      ; 5480   02C0 0133
        MVO     R0,     G_0133                  ; 5482   0240 0133
        MVI     G_0132, R0                      ; 5484   0280 0132
        MVO     R0,     G_0136                  ; 5486   0240 0136
        ADD     G_0134, R0                      ; 5488   02C0 0134
        MVO     R0,     G_0134                  ; 548A   0240 0134
        MOVR    R5,     R7                      ; 548C   00AF

        PSHR    R5                              ; 548D   0275
        TSTR    R0                              ; 548E   0080
        BMI     L_549B                          ; 548F   020B 000A

L_5491:
        JSR     R5,     L_549C                  ; 5491   0004 0154 009C

        CMPI    #$0002, R0                      ; 5494   0378 0002
        BNEQ    L_5491                          ; 5496   022C 0006

        JSR     R5,     L_565A                  ; 5498   0004 0154 025A

L_549B:
        PULR    R7                              ; 549B   02B7

L_549C:
        PSHR    R5                              ; 549C   0275
        CLRR    R0                              ; 549D   01C0
        MVO     R0,     G_0180                  ; 549E   0240 0180
        MVI     G_0137, R0                      ; 54A0   0280 0137
L_54A2:
        INCR    R0                              ; 54A2   0008
        CMPI    #$0008, R0                      ; 54A3   0378 0008
        BEQ     L_54A2                          ; 54A5   0224 0004

        CMPI    #$0012, R0                      ; 54A7   0378 0012
        BNEQ    L_54AD                          ; 54A9   020C 0002

        MVII    #$0001, R0                      ; 54AB   02B8 0001
L_54AD:
        MVO     R0,     G_0137                  ; 54AD   0240 0137
        MOVR    R0,     R1                      ; 54AF   0081
        CMPI    #$0007, R1                      ; 54B0   0379 0007
        BNC     L_54B6                          ; 54B2   0209 0002

        MVII    #$0005, R1                      ; 54B4   02B9 0005
L_54B6:
        SLL     R1,     2                       ; 54B6   004D
        SDBD                                    ; 54B7   0001
        ADDI    #$6ED4, R1                      ; 54B8   02F9 00D4 006E
        MVII    #$0020, R5                      ; 54BB   02BD 0020
        MVO     R5,     G_015D                  ; 54BD   0245 015D

        JSR     R5,     L_562C                  ; 54BF   0004 0154 022C

        BEQ     L_54CE                          ; 54C2   0204 000A

        ADDI    #$0002, R1                      ; 54C4   02F9 0002
        CLRR    R5                              ; 54C6   01ED
        MVO     R5,     G_015D                  ; 54C7   0245 015D

        JSR     R5,     L_562C                  ; 54C9   0004 0154 022C

        BNEQ    L_55FB                          ; 54CC   020C 012D

L_54CE:
        MVII    #$0001, R3                      ; 54CE   02BB 0001
        ADDI    #$0018, R1                      ; 54D0   02F9 0018
        MVI@    R1,     R0                      ; 54D2   0288
        ANDI    #$000F, R0                      ; 54D3   03B8 000F
        DECR    R0                              ; 54D5   0010
        ANDI    #$00FF, R0                      ; 54D6   03B8 00FF
        MVO     R0,     G_0131                  ; 54D8   0240 0131
        ADD     G_0133, R0                      ; 54DA   02C0 0133
        ANDI    #$00FF, R0                      ; 54DC   03B8 00FF
        TSTR    R0                              ; 54DE   0080
        BEQ     L_54E2                          ; 54DF   0204 0001

        CLRR    R3                              ; 54E1   01DB
L_54E2:
        CMPI    #$0008, R0                      ; 54E2   0378 0008
        BC      L_55FB                          ; 54E4   0201 0115

        INCR    R1                              ; 54E6   0009
        MVI@    R1,     R2                      ; 54E7   028A
        ANDI    #$000F, R2                      ; 54E8   03BA 000F
        DECR    R2                              ; 54EA   0012
        MVO     R2,     G_0132                  ; 54EB   0242 0132
        ADD     G_0134, R2                      ; 54ED   02C2 0134
        ANDI    #$00FF, R2                      ; 54EF   03BA 00FF
        BNEQ    L_5500                          ; 54F1   020C 000D

        TSTR    R3                              ; 54F3   009B
        BEQ     L_5500                          ; 54F4   0204 000A

        MVI     G_0137, R0                      ; 54F6   0280 0137
        MVO     R0,     G_018F                  ; 54F8   0240 018F
        MVII    #$0001, R0                      ; 54FA   02B8 0001
        MVO     R0,     G_0180                  ; 54FC   0240 0180
        B       L_55F8                          ; 54FE   0200 00F8

L_5500:
        CMPI    #$0008, R2                      ; 5500   037A 0008
        BC      L_55FB                          ; 5502   0201 00F7

        SLL     R2,     2                       ; 5504   004E
        SLL     R2,     1                       ; 5505   004A
        ADDR    R0,     R2                      ; 5506   00C2
        ADDI    #$0187, R2                      ; 5507   02FA 0187
        MVI@    R2,     R1                      ; 5509   0291
        TSTR    R1                              ; 550A   0089
        BNEQ    L_55FB                          ; 550B   020C 00EE

        MVI     G_0134, R1                      ; 550D   0281 0134
        SLL     R1,     2                       ; 550F   004D
        SLL     R1,     1                       ; 5510   0049
        ADD     G_0133, R1                      ; 5511   02C1 0133
        ADDI    #$0187, R1                      ; 5513   02F9 0187
        MVI     G_013A, R5                      ; 5515   0285 013A
        TSTR    R5                              ; 5517   00AD
        BNEQ    L_5543                          ; 5518   020C 0029

        MOVR    R1,     R3                      ; 551A   008B
        MVI     G_0135, R0                      ; 551B   0280 0135

        JSR     R5,     X_EXT_SIGN_LO           ; 551D   0004 0114 0268

        NEGR    R0                              ; 5520   0020
        ADDR    R0,     R3                      ; 5521   00C3
        MVI@    R3,     R5                      ; 5522   029D
        ANDI    #$001F, R5                      ; 5523   03BD 001F
        TSTR    R0                              ; 5525   0080
        BEQ     L_5543                          ; 5526   0204 001B

        MVI     G_0137, R4                      ; 5528   0284 0137
        BPL     L_552F                          ; 552A   0203 0003

        XORR    R4,     R5                      ; 552C   01E5
        XORR    R5,     R4                      ; 552D   01EC
        XORR    R4,     R5                      ; 552E   01E5
L_552F:
        SDBD                                    ; 552F   0001
        MVII    #$6F07, R3                      ; 5530   02BB 0007 006F
        ADDR    R4,     R3                      ; 5533   00E3
        MVI@    R3,     R0                      ; 5534   0298
        ANDI    #$0003, R0                      ; 5535   03B8 0003
        SDBD                                    ; 5537   0001
        MVII    #$6F07, R3                      ; 5538   02BB 0007 006F
        ADDR    R5,     R3                      ; 553B   00EB
        MVI@    R3,     R3                      ; 553C   029B
        SLR     R3,     2                       ; 553D   0067
        ANDI    #$0003, R3                      ; 553E   03BB 0003
        CMPR    R0,     R3                      ; 5540   0143
        BNEQ    L_55FB                          ; 5541   020C 00B8

L_5543:
        MVI     G_0137, R0                      ; 5543   0280 0137
        XOR     G_015D, R0                      ; 5545   03C0 015D
        MVO@    R0,     R1                      ; 5547   0248
        MVII    #$00FF, R0                      ; 5548   02B8 00FF
        MVO@    R0,     R2                      ; 554A   0250
L_554B:
        CLRR    R0                              ; 554B   01C0
        MVO     R0,     G_0139                  ; 554C   0240 0139
        MVO     R0,     G_0138                  ; 554E   0240 0138
        MVII    #$0007, R3                      ; 5550   02BB 0007
L_5552:
        MVII    #$0007, R2                      ; 5552   02BA 0007

L_5554:
        JSR     R5,     L_5613                  ; 5554   0004 0154 0213

        CMPI    #$00FF, R0                      ; 5557   0378 00FF
        BNEQ    L_557D                          ; 5559   020C 0022

        TSTR    R2                              ; 555B   0092
        BEQ     L_5563                          ; 555C   0204 0005

        DECR    R2                              ; 555E   0012

        JSR     R5,     L_55FD                  ; 555F   0004 0154 01FD

        INCR    R2                              ; 5562   000A
L_5563:
        TSTR    R3                              ; 5563   009B
        BEQ     L_556B                          ; 5564   0204 0005

        DECR    R3                              ; 5566   0013

        JSR     R5,     L_55FD                  ; 5567   0004 0154 01FD

        INCR    R3                              ; 556A   000B
L_556B:
        CMPI    #$0007, R2                      ; 556B   037A 0007
        BEQ     L_5574                          ; 556D   0204 0005

        INCR    R2                              ; 556F   000A

        JSR     R5,     L_55FD                  ; 5570   0004 0154 01FD

        DECR    R2                              ; 5573   0012
L_5574:
        CMPI    #$0007, R3                      ; 5574   037B 0007
        BEQ     L_557D                          ; 5576   0204 0005

        INCR    R3                              ; 5578   000B

        JSR     R5,     L_55FD                  ; 5579   0004 0154 01FD

        DECR    R3                              ; 557C   0013
L_557D:
        DECR    R2                              ; 557D   0012
        BPL     L_5554                          ; 557E   0223 002B

        DECR    R3                              ; 5580   0013
        BPL     L_5552                          ; 5581   0223 0030

        MVI     G_0138, R0                      ; 5583   0280 0138
        TSTR    R0                              ; 5585   0080
        BEQ     L_558D                          ; 5586   0204 0005

        MVI     G_0139, R0                      ; 5588   0280 0139
        TSTR    R0                              ; 558A   0080
        BEQ     L_554B                          ; 558B   0224 0041

L_558D:
        MVII    #$0040, R0                      ; 558D   02B8 0040
        MVII    #$0187, R1                      ; 558F   02B9 0187
L_5591:
        MVI@    R1,     R2                      ; 5591   028A
        CMPI    #$00FF, R2                      ; 5592   037A 00FF
        BNEQ    L_5598                          ; 5594   020C 0002

        CLRR    R2                              ; 5596   01D2
        MVO@    R2,     R1                      ; 5597   024A
L_5598:
        INCR    R1                              ; 5598   0009
        DECR    R0                              ; 5599   0010
        BNEQ    L_5591                          ; 559A   022C 000A

        MVI     G_0138, R0                      ; 559C   0280 0138
        TSTR    R0                              ; 559E   0080
        BEQ     L_55FB                          ; 559F   0204 005A

        MVI     G_0131, R1                      ; 55A1   0281 0131
        CMPI    #$00FF, R1                      ; 55A3   0379 00FF
        BNEQ    L_55B7                          ; 55A5   020C 0010

        MVI     G_0137, R1                      ; 55A7   0281 0137
        CMPI    #$0009, R1                      ; 55A9   0379 0009
        BNC     L_55F8                          ; 55AB   0209 004B

        CMPI    #$000E, R1                      ; 55AD   0379 000E
        BEQ     L_55F8                          ; 55AF   0204 0047

        CMPI    #$0010, R1                      ; 55B1   0379 0010
        BEQ     L_55F8                          ; 55B3   0204 0043
        B       L_55C9                          ; 55B5   0200 0012

L_55B7:
        CMPI    #$0001, R1                      ; 55B7   0379 0001
        BNEQ    L_55F8                          ; 55B9   020C 003D

        MVI     G_0137, R1                      ; 55BB   0281 0137
        CMPI    #$0009, R1                      ; 55BD   0379 0009
        BNC     L_55F8                          ; 55BF   0209 0037

        CMPI    #$000F, R1                      ; 55C1   0379 000F
        BEQ     L_55F8                          ; 55C3   0204 0033

        CMPI    #$0011, R1                      ; 55C5   0379 0011
        BEQ     L_55F8                          ; 55C7   0204 002F

L_55C9:
        MVI     G_0133, R4                      ; 55C9   0284 0133
        PSHR    R4                              ; 55CB   0274
        MVI     G_0134, R4                      ; 55CC   0284 0134
        PSHR    R4                              ; 55CE   0274
        MVI     G_0137, R4                      ; 55CF   0284 0137
        PSHR    R4                              ; 55D1   0274

        JSR     R5,     L_547C                  ; 55D2   0004 0154 007C

        MVII    #$0004, R0                      ; 55D5   02B8 0004
        MVO     R0,     G_0137                  ; 55D7   0240 0137
        MVII    #$0001, R5                      ; 55D9   02BD 0001
        MVO     R5,     G_013A                  ; 55DB   0245 013A

        JSR     R5,     L_549C                  ; 55DD   0004 0154 009C

        CLRR    R5                              ; 55E0   01ED
        MVO     R5,     G_013A                  ; 55E1   0245 013A
        PSHR    R0                              ; 55E3   0270
        MVI     G_0133, R2                      ; 55E4   0282 0133
        MVI     G_0134, R3                      ; 55E6   0283 0134

        JSR     R5,     L_5613                  ; 55E8   0004 0154 0213

        CLRR    R0                              ; 55EB   01C0
        MVO@    R0,     R1                      ; 55EC   0248
        PULR    R0                              ; 55ED   02B0
        PULR    R4                              ; 55EE   02B4
        MVO     R4,     G_0137                  ; 55EF   0244 0137
        PULR    R4                              ; 55F1   02B4
        MVO     R4,     G_0134                  ; 55F2   0244 0134
        PULR    R4                              ; 55F4   02B4
        MVO     R4,     G_0133                  ; 55F5   0244 0133
        PULR    R7                              ; 55F7   02B7

L_55F8:
        MVII    #$0002, R0                      ; 55F8   02B8 0002
        PULR    R7                              ; 55FA   02B7

L_55FB:
        CLRR    R0                              ; 55FB   01C0
        PULR    R7                              ; 55FC   02B7

L_55FD:
        PSHR    R5                              ; 55FD   0275

        JSR     R5,     L_5613                  ; 55FE   0004 0154 0213

        TSTR    R0                              ; 5601   0080
        BNEQ    L_5612                          ; 5602   020C 000E

        DECR    R0                              ; 5604   0010
        MVO@    R0,     R1                      ; 5605   0248
        MVII    #$0001, R0                      ; 5606   02B8 0001
        MVO     R0,     G_0138                  ; 5608   0240 0138
        TSTR    R2                              ; 560A   0092
        BNEQ    L_5612                          ; 560B   020C 0005

        TSTR    R3                              ; 560D   009B
        BNEQ    L_5612                          ; 560E   020C 0002

        MVO     R0,     G_0139                  ; 5610   0240 0139
L_5612:
        PULR    R7                              ; 5612   02B7

L_5613:
        PSHR    R5                              ; 5613   0275
        PSHR    R4                              ; 5614   0274
        MOVR    R3,     R1                      ; 5615   0099
        SLL     R1,     2                       ; 5616   004D
        SLL     R1,     1                       ; 5617   0049
        ADDR    R2,     R1                      ; 5618   00D1
        MVI     G_0185, R5                      ; 5619   0285 0185
        MOVR    R5,     R4                      ; 561B   00AC
        ADDR    R4,     R4                      ; 561C   00E4
        SDBD                                    ; 561D   0001
        ADDI    #$5E83, R4                      ; 561E   02FC 0083 005E
        SDBD                                    ; 5621   0001
        ADD@    R4,     R1                      ; 5622   02E1
        MVI@    R1,     R0                      ; 5623   0288
        PULR    R4                              ; 5624   02B4
        CMPI    #$0003, R5                      ; 5625   037D 0003
        BEQ     L_549B                          ; 5627   0224 018D

        SLR     R0,     2                       ; 5629   0064
        SLR     R0,     2                       ; 562A   0064
        PULR    R7                              ; 562B   02B7

L_562C:
        PSHR    R5                              ; 562C   0275
        MVI@    R1,     R0                      ; 562D   0288
        ANDI    #$000F, R0                      ; 562E   03B8 000F
        DECR    R0                              ; 5630   0010
        ANDI    #$00FF, R0                      ; 5631   03B8 00FF
        CMP     G_0135, R0                      ; 5633   0340 0135
        BNEQ    L_549B                          ; 5635   022C 019B

        INCR    R1                              ; 5637   0009
        MVI@    R1,     R0                      ; 5638   0288
        ANDI    #$000F, R0                      ; 5639   03B8 000F
        DECR    R0                              ; 563B   0010
        ANDI    #$00FF, R0                      ; 563C   03B8 00FF
        DECR    R1                              ; 563E   0011
        CMP     G_0136, R0                      ; 563F   0340 0136
        PULR    R7                              ; 5641   02B7

        PSHR    R5                              ; 5642   0275
        SDBD                                    ; 5643   0001
        MVII    #$6D15, R5                      ; 5644   02BD 0015 006D
        MVI     G_0181, R0                      ; 5647   0280 0181
        TSTR    R0                              ; 5649   0080
        BEQ     L_5650                          ; 564A   0204 0004

        SDBD                                    ; 564C   0001
        MVII    #$65C2, R5                      ; 564D   02BD 00C2 0065

L_5650:
        JSRD    R4,     X_NEW_GRAM_INIT         ; 5650   0004 001E 0335

        MVII    #$0001, R0                      ; 5653   02B8 0001
        MVO     R0,     G_0180                  ; 5655   0240 0180
        MVO     R0,     .STIC.VIDEN             ; 5657   0240 0020
        PULR    R7                              ; 5659   02B7

L_565A:
        PSHR    R5                              ; 565A   0275
        MVII    #$0001, R0                      ; 565B   02B8 0001
        MVO     R0,     G_0187                  ; 565D   0240 0187
        MVII    #$0007, R3                      ; 565F   02BB 0007
L_5661:
        MVII    #$0007, R2                      ; 5661   02BA 0007

L_5663:
        JSR     R5,     L_5613                  ; 5663   0004 0154 0213

        ANDI    #$001F, R0                      ; 5666   03B8 001F
        SLL     R0,     2                       ; 5668   004C
        SLL     R0,     1                       ; 5669   0048
        SDBD                                    ; 566A   0001
        ADDI    #$2A07, R0                      ; 566B   02F8 0007 002A
        MOVR    R3,     R1                      ; 566E   0099
        SLL     R1,     2                       ; 566F   004D
        ADDR    R3,     R1                      ; 5670   00D9
        SLL     R1,     2                       ; 5671   004D
        ADDR    R2,     R1                      ; 5672   00D1
        ADDI    #$022E, R1                      ; 5673   02F9 022E
        MVO@    R0,     R1                      ; 5675   0248
        DECR    R2                              ; 5676   0012
        BPL     L_5663                          ; 5677   0223 0015

        DECR    R3                              ; 5679   0013
        BPL     L_5661                          ; 567A   0223 001A

        CLRR    R0                              ; 567C   01C0
        MVO     R0,     G_0187                  ; 567D   0240 0187
        PULR    R7                              ; 567F   02B7

L_5680:
        JSR     R5,     L_56AC                  ; 5680   0004 0154 02AC

        MVII    #$0001, R1                      ; 5683   02B9 0001
        MVO     R1,     G_0187                  ; 5685   0241 0187
        MVO     R1,     G_0181                  ; 5687   0241 0181

        JSR     R5,     L_53E8                  ; 5689   0004 0150 03E8

        MVI     .STIC.MODE,R0                   ; 568C   0280 0021
        SDBD                                    ; 568E   0001
        MVII    #$5717, R0                      ; 568F   02B8 0017 0057
        MVO     R0,     G_035D                  ; 5692   0240 035D
        SDBD                                    ; 5694   0001
        MVII    #$515C, R0                      ; 5695   02B8 005C 0051
        MVO     R0,     G_033C                  ; 5698   0240 033C

        JSR     R5,     L_5E8B                  ; 569A   0004 015C 028B
        DECLE   $009C                           ; 569D   009C

        PULR    R7                              ; 569E   02B7

L_569F:
        MVII    #$0128, R1                      ; 569F   02B9 0128
        MVII    #$0002, R0                      ; 56A1   02B8 0002
L_56A3:
        MVI@    R1,     R2                      ; 56A3   028A
        COMR    R2                              ; 56A4   001A
        MVO@    R2,     R1                      ; 56A5   024A
        SUBI    #$0002, R1                      ; 56A6   0339 0002
        DECR    R0                              ; 56A8   0010
        BNEQ    L_56A3                          ; 56A9   022C 0007
        MOVR    R5,     R7                      ; 56AB   00AF

L_56AC:
        MVII    #$0080, R0                      ; 56AC   02B8 0080
        SWAP    R0,     1                       ; 56AE   0040
L_56AF:
        DECR    R0                              ; 56AF   0010
        BNEQ    L_56AF                          ; 56B0   022C 0002
        MOVR    R5,     R7                      ; 56B2   00AF

        DECLE   $0275,  $01C0,  $0240,  $0006   ; 56B3   0275 01C0 0240 0006
        DECLE   $0240,  $0007,  $0280,  $0102   ; 56B7   0240 0007 0280 0102
        DECLE   $0378,  $0001,  $0204,  $004C   ; 56BB   0378 0001 0204 004C
        DECLE   $0378,  $0002,  $0204,  $0016   ; 56BF   0378 0002 0204 0016
        DECLE   $0378,  $0003,  $020C,  $0044   ; 56C3   0378 0003 020C 0044
        DECLE   $0004,  $0154,  $02EB           ; 56C7   0004 0154 02EB
        BIDECLE $56FB                           ; 56CA   00FB 0056
        DECLE   $0005,  $0000                   ; 56CC   0005 0000

        JSR     R5,     X_DEF_ISR               ; 56CE   0004 0110 0126
        JSR     R5,     L_56EB                  ; 56D1   0004 0154 02EB
        BIDECLE $56FB                           ; 56D4   00FB 0056
        DECLE   $0005,  $0001                   ; 56D6   0005 0001

        PULR    R7                              ; 56D8   02B7

        JSR     R5,     L_56EB                  ; 56D9   0004 0154 02EB
        BIDECLE $5705                           ; 56DC   0005 0057
        DECLE   $0003,  $0000                   ; 56DE   0003 0000

        JSR     R5,     X_DEF_ISR               ; 56E0   0004 0110 0126
        JSR     R5,     L_56EB                  ; 56E3   0004 0154 02EB
        BIDECLE $5705                           ; 56E6   0005 0057
        DECLE   $0003,  $0001                   ; 56E8   0003 0001

        PULR    R7                              ; 56EA   02B7

L_56EB:
        SDBD                                    ; 56EB   0001
        MVI@    R5,     R4                      ; 56EC   02AC
        MVI@    R5,     R3                      ; 56ED   02AB
        MVI@    R5,     R0                      ; 56EE   02A8
L_56EF:
        MVI@    R4,     R2                      ; 56EF   02A2
        MVI@    R2,     R1                      ; 56F0   0291
        SWAP    R1,     1                       ; 56F1   0041
        ADDR    R0,     R7                      ; 56F2   00C7

        NEGR    R1                              ; 56F3   0021
        MVI@    R4,     R2                      ; 56F4   02A2
        ADD@    R2,     R1                      ; 56F5   02D1
        MVO@    R1,     R2                      ; 56F6   0251
        DECR    R3                              ; 56F7   0013
        BNEQ    L_56EF                          ; 56F8   022C 000A
        MOVR    R5,     R7                      ; 56FA   00AF

        CMPR    R4,     R6                      ; 56FB   0166
        SUB@    R4,     R0                      ; 56FC   0320
        CMPR    R4,     R6                      ; 56FD   0166
        SUB@    R5,     R0                      ; 56FE   0328
        CMPR    R4,     R7                      ; 56FF   0167
        SUBI    #$016A, R0                      ; 5700   0338 016A
        SUB@    R6,     R0                      ; 5702   0330
        CMPR    R5,     R0                      ; 5703   0168
        SUB@    R5,     R7                      ; 5704   032F

        CMPR    R4,     R7                      ; 5705   0167
        CMP     G_016B, R0                      ; 5706   0340 016B
        CMP@    R1,     R0                      ; 5708   0348
        CMPR    R5,     R1                      ; 5709   0169
        CMP     .STIC.X.4,R7                    ; 570A   0347 0004
        SUBR    R2,     R0                      ; 570C   0110
        SUBR    R4,     R6                      ; 570D   0126
        PULR    R7                              ; 570E   02B7

        DECLE   $008D,  $0054,  $0004,  $0054   ; 570F   008D 0054 0004 0054
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5713   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0021,  $0057   ; 5717   0000 0000 0021 0057
        DECLE   $0000,  $0000,  $0000,  $0000   ; 571B   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 571F   0000 0000

        PSHR    R5                              ; 5721   0275
        MVI     G_033C, R7                      ; 5722   0287 033C

        DECR    R0                              ; 5724   0010

        JSR     R4,     .EXEC.010               ; 5725   0004 0010 0010

        DECR    R0                              ; 5728   0010
        DECR    R1                              ; 5729   0011
        DECR    R1                              ; 572A   0011

        JSRE    R4,     .EXEC.011               ; 572B   0004 0011 0011
        DECLE   $0042,  $0000,  $005E,  $0057   ; 572E   0042 0000 005E 0057
        DECLE   $0000,  $0055,  $0000,  $0032   ; 5732   0000 0055 0000 0032
        DECLE   $0000,  $0000,  $0007,  $0000   ; 5736   0000 0000 0007 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 573A   0000 0000 0000 0000
        DECLE   $0047,  $0000,  $0074,  $0057   ; 573E   0047 0000 0074 0057
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5742   0000 0000 0000 0000
        DECLE   $03FF,  $0002,  $0007,  $0000   ; 5746   03FF 0002 0007 0000
        DECLE   $0014,  $0000,  $0000,  $0000   ; 574A   0014 0000 0000 0000
        DECLE   $0000,  $0020,  $007B,  $0057   ; 574E   0000 0020 007B 0057
        DECLE   $0000,  $004E,  $0000,  $0037   ; 5752   0000 004E 0000 0037
        DECLE   $0000,  $0000,  $0007,  $0000   ; 5756   0000 0000 0007 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 575A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00E0,  $0066   ; 575E   0000 0000 00E0 0066
        DECLE   $000A,  $0000,  $0004,  $0003   ; 5762   000A 0000 0004 0003
        DECLE   $0069,  $0203,  $0169,  $0000   ; 5766   0069 0203 0169 0000
        DECLE   $0000,  $00E0,  $0066,  $000A   ; 576A   0000 00E0 0066 000A
        DECLE   $0032,  $0004,  $0003,  $0069   ; 576E   0032 0004 0003 0069
        DECLE   $0203,  $0169,  $0000,  $0000   ; 5772   0203 0169 0000 0000
        DECLE   $0054,  $0068,  $000A,  $0014   ; 5776   0054 0068 000A 0014
        DECLE   $0000,  $0000,  $0000,  $0030   ; 577A   0000 0000 0000 0030
        DECLE   $0068,  $000A,  $0028,  $0000   ; 577E   0068 000A 0028 0000
L_5782:
        PSHR    R5                              ; 5782   0275
        MVI     G_0117, R1                      ; 5783   0281 0117
        ADDI    #$01CB, R1                      ; 5785   02F9 01CB
        MVI@    R1,     R0                      ; 5787   0288
        TSTR    R0                              ; 5788   0080
        BNEQ    L_57E5                          ; 5789   020C 005A

        MVII    #$0002, R3                      ; 578B   02BB 0002

        JSR     R5,     L_6CDB                  ; 578D   0004 016C 00DB

        BEQ     L_57CF                          ; 5790   0204 003D

        MVI     G_0353, R1                      ; 5792   0281 0353
        TSTR    R1                              ; 5794   0089
        BNEQ    L_57CF                          ; 5795   020C 0038

        MVI     G_035B, R0                      ; 5797   0280 035B
        TSTR    R0                              ; 5799   0080
        BNEQ    L_57AA                          ; 579A   020C 000E

        MVI     G_035A, R1                      ; 579C   0281 035A
        ANDI    #$0001, R1                      ; 579E   03B9 0001
        BNEQ    L_57CF                          ; 57A0   020C 002D

        MVI     G_035A, R2                      ; 57A2   0282 035A
        ANDI    #$0002, R2                      ; 57A4   03BA 0002
        BEQ     L_57AA                          ; 57A6   0204 0002
        B       L_57AE                          ; 57A8   0200 0004

L_57AA:
        MVI     G_0355, R1                      ; 57AA   0281 0355
        B       L_57B0                          ; 57AC   0200 0002

L_57AE:
        ADDI    #$0004, R1                      ; 57AE   02F9 0004
L_57B0:
        SUB     G_0354, R1                      ; 57B0   0301 0354
        ANDI    #$000F, R1                      ; 57B2   03B9 000F
        BEQ     L_57CF                          ; 57B4   0204 0019

        JSR     R5,     L_57D9                  ; 57B6   0004 0154 03D9

        BPL     L_57E5                          ; 57B9   0203 002A

        CMPI    #$0008, R1                      ; 57BB   0379 0008
        BC      L_57C9                          ; 57BD   0201 000A

        MVI     G_0355, R1                      ; 57BF   0281 0355
        DECR    R1                              ; 57C1   0011
        DECR    R1                              ; 57C2   0011
L_57C3:
        ANDI    #$000E, R1                      ; 57C3   03B9 000E
        MVO     R1,     G_0355                  ; 57C5   0241 0355
        B       L_57E5                          ; 57C7   0200 001C

L_57C9:
        MVI     G_0355, R1                      ; 57C9   0281 0355
        INCR    R1                              ; 57CB   0009
        INCR    R1                              ; 57CC   0009
        B       L_57C3                          ; 57CD   0220 000B

L_57CF:
        JSR     R5,     L_57D9                  ; 57CF   0004 0154 03D9

        BPL     L_57E5                          ; 57D2   0203 0011

        CLRR    R0                              ; 57D4   01C0
        MVO     R0,     G_0359                  ; 57D5   0240 0359
        B       L_57E5                          ; 57D7   0200 000C

L_57D9:
        PSHR    R5                              ; 57D9   0275
        MVI     G_0359, R0                      ; 57DA   0280 0359
        MVI     G_0358, R2                      ; 57DC   0282 0358
        TSTR    R2                              ; 57DE   0092
        BEQ     L_57E5                          ; 57DF   0204 0004

        SUBI    #$0028, R0                      ; 57E1   0338 0028
        MVO     R0,     G_0359                  ; 57E3   0240 0359
L_57E5:
        PULR    R7                              ; 57E5   02B7

L_57E6:
        PSHR    R5                              ; 57E6   0275
        MVI     G_0334, R3                      ; 57E7   0283 0334
        PSHR    R3                              ; 57E9   0273
        MVI     G_033C, R3                      ; 57EA   0283 033C
        PSHR    R3                              ; 57EC   0273
        MVII    #$0003, R3                      ; 57ED   02BB 0003

        JSR     R5,     L_6CDB                  ; 57EF   0004 016C 00DB

        BEQ     L_5854                          ; 57F2   0204 0060

        MVI     G_0353, R1                      ; 57F4   0281 0353
        TSTR    R1                              ; 57F6   0089
        BNEQ    L_5854                          ; 57F7   020C 005B

        MVI     G_0355, R1                      ; 57F9   0281 0355
        MVI     G_0358, R0                      ; 57FB   0280 0358

        JSR     R5,     .EXEC.629               ; 57FD   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 5800   0004 0114 0357

        MOVR    R0,     R2                      ; 5803   0082
        MOVR    R1,     R3                      ; 5804   008B
        MVI     G_0356, R0                      ; 5805   0280 0356
        MVI     G_0357, R1                      ; 5807   0281 0357

        JSR     R5,     X_PACK_BYTES            ; 5809   0004 0114 034F
        JSR     R5,     X_UNPK_BYTES            ; 580C   0004 0114 0357

        SUBR    R0,     R2                      ; 580F   0102
        MOVR    R2,     R0                      ; 5810   0090
        MVO     R2,     G_0334                  ; 5811   0242 0334
        SUBR    R1,     R3                      ; 5813   010B
        MVO     R3,     G_033C                  ; 5814   0243 033C

        JSR     R5,     X_SQUARE                ; 5816   0004 011C 01DB

        MOVR    R2,     R3                      ; 5819   0093
        MVI     G_033C, R0                      ; 581A   0280 033C

        JSR     R5,     X_SQUARE                ; 581C   0004 011C 01DB

        ADDR    R2,     R3                      ; 581F   00D3
        MOVR    R3,     R1                      ; 5820   0099
        MVII    #$00EA, R2                      ; 5821   02BA 00EA
        TSTR    R1                              ; 5823   0089
        BMI     L_5829                          ; 5824   020B 0003

        JSR     R5,     X_SQRT                  ; 5826   0004 011C 0223

L_5829:
        MOVR    R2,     R4                      ; 5829   0094
        CMPI    #$0014, R2                      ; 582A   037A 0014
        BC      L_585B                          ; 582C   0201 002D

L_582E:
        MVI     G_0356, R0                      ; 582E   0280 0356
        MVI     G_0357, R1                      ; 5830   0281 0357
        MVI     G_0334, R2                      ; 5832   0282 0334
        MVI     G_033C, R3                      ; 5834   0283 033C
        ADDR    R3,     R1                      ; 5836   00D9
        ADDR    R2,     R0                      ; 5837   00D0
        MVO     R0,     G_0356                  ; 5838   0240 0356
        MVO     R1,     G_0357                  ; 583A   0241 0357

        JSR     R5,     X_EXT_SIGN_LO           ; 583C   0004 0114 0268
        JSR     R5,     X_SQUARE                ; 583F   0004 011C 01DB

        MOVR    R2,     R3                      ; 5842   0093
        MVI     G_0357, R0                      ; 5843   0280 0357

        JSR     R5,     X_EXT_SIGN_LO           ; 5845   0004 0114 0268
        JSR     R5,     X_SQUARE                ; 5848   0004 011C 01DB

        ADDR    R2,     R3                      ; 584B   00D3
        MOVR    R3,     R1                      ; 584C   0099

        JSR     R5,     X_SQRT                  ; 584D   0004 011C 0223

        INCR    R2                              ; 5850   000A
        SLR     R2,     1                       ; 5851   0062
        MVO     R2,     G_0358                  ; 5852   0242 0358
L_5854:
        PULR    R3                              ; 5854   02B3
        MVO     R3,     G_033C                  ; 5855   0243 033C
        PULR    R3                              ; 5857   02B3
        MVO     R3,     G_0334                  ; 5858   0243 0334
        PULR    R7                              ; 585A   02B7

L_585B:
        PSHR    R4                              ; 585B   0274
        CMPI    #$0028, R4                      ; 585C   037C 0028
        BNC     L_5873                          ; 585E   0209 0013

        MVI     G_0318, R0                      ; 5860   0280 0318
        MVI     G_0117, R1                      ; 5862   0281 0117
        INCR    R1                              ; 5864   0009
        ANDR    R1,     R0                      ; 5865   0188
        BNEQ    L_587C                          ; 5866   020C 0014

        MVI     G_0318, R0                      ; 5868   0280 0318
        XORR    R1,     R0                      ; 586A   01C8
        MVO     R0,     G_0318                  ; 586B   0240 0318
        MVII    #$0004, R0                      ; 586D   02B8 0004
        MVO     R0,     G_01DA                  ; 586F   0240 01DA
        B       L_587C                          ; 5871   0200 0009

L_5873:
        MVI     G_0117, R1                      ; 5873   0281 0117
        INCR    R1                              ; 5875   0009
        XORI    #$0003, R1                      ; 5876   03F9 0003
        AND     G_0318, R1                      ; 5878   0381 0318
        MVO     R1,     G_0318                  ; 587A   0241 0318
L_587C:
        PULR    R4                              ; 587C   02B4
        MVI     G_0334, R1                      ; 587D   0281 0334
        SLL     R1,     2                       ; 587F   004D
        SLL     R1,     1                       ; 5880   0049
        MOVR    R4,     R2                      ; 5881   00A2

        JSR     R5,     X_DIV                   ; 5882   0004 011C 01FB

        MVO     R0,     G_0334                  ; 5885   0240 0334
        MVI     G_033C, R1                      ; 5887   0281 033C
        SLL     R1,     2                       ; 5889   004D
        SLL     R1,     1                       ; 588A   0049
        MOVR    R4,     R2                      ; 588B   00A2

        JSR     R5,     X_DIV                   ; 588C   0004 011C 01FB

        MVO     R0,     G_033C                  ; 588F   0240 033C
        B       L_582E                          ; 5891   0220 0064

        DECLE   $009D,  $0058,  $0000,  $0000   ; 5893   009D 0058 0000 0000

        ADDR    R0,     R6                      ; 5897   00C6
        SLLC    R0,     1                       ; 5898   0058
        ADDR    R7,     R3                      ; 5899   00FB
        SLLC    R0,     1                       ; 589A   0058
        ADDR    R7,     R3                      ; 589B   00FB
        SLLC    R0,     1                       ; 589C   0058
        PSHR    R5                              ; 589D   0275
        MVO     R1,     G_0117                  ; 589E   0241 0117
        PSHR    R0                              ; 58A0   0270

        JSR     R5,     L_5CB7                  ; 58A1   0004 015C 00B7

        PULR    R0                              ; 58A4   02B0
        TSTR    R0                              ; 58A5   0080
        BMI     L_58BC                          ; 58A6   020B 0014

        MVII    #$0001, R3                      ; 58A8   02BB 0001
        MOVR    R0,     R1                      ; 58AA   0081

        JSR     R5,     L_6CDB                  ; 58AB   0004 016C 00DB

        BEQ     L_58B8                          ; 58AE   0204 0008

        MVI     G_035A, R2                      ; 58B0   0282 035A
        ANDI    #$0002, R2                      ; 58B2   03BA 0002
        MVO     R2,     G_035A                  ; 58B4   0242 035A
        MVO     R1,     G_0354                  ; 58B6   0241 0354

L_58B8:
        JSR     R5,     L_5CCB                  ; 58B8   0004 015C 00CB

        PULR    R7                              ; 58BB   02B7

L_58BC:
        MVI     G_035A, R0                      ; 58BC   0280 035A
        ANDI    #$0002, R0                      ; 58BE   03B8 0002
        XORI    #$0001, R0                      ; 58C0   03F8 0001
        MVO     R0,     G_035A                  ; 58C2   0240 035A
        B       L_58B8                          ; 58C4   0220 000D

        PSHR    R5                              ; 58C6   0275
        CLRR    R4                              ; 58C7   01E4
        INCR    R4                              ; 58C8   000C
L_58C9:
        PSHR    R4                              ; 58C9   0274
        PSHR    R0                              ; 58CA   0270
        MVO     R1,     G_0117                  ; 58CB   0241 0117

        JSR     R5,     L_5CB7                  ; 58CD   0004 015C 00B7

        PULR    R0                              ; 58D0   02B0
        PULR    R4                              ; 58D1   02B4
        TSTR    R0                              ; 58D2   0080
        BNEQ    L_58B8                          ; 58D3   022C 001C

        MVI     G_0353, R0                      ; 58D5   0280 0353
        TSTR    R0                              ; 58D7   0080
        BNEQ    L_58B8                          ; 58D8   022C 0021

        MVI     G_035B, R3                      ; 58DA   0283 035B
        TSTR    R3                              ; 58DC   009B
        BNEQ    L_58B8                          ; 58DD   022C 0026

        MVII    #$01CB, R5                      ; 58DF   02BD 01CB
        ADD     G_0117, R5                      ; 58E1   02C5 0117
        MVI@    R5,     R5                      ; 58E3   02AD
        TSTR    R5                              ; 58E4   00AD
        BNEQ    L_58B8                          ; 58E5   022C 002E

        MVI     G_0358, R3                      ; 58E7   0283 0358
        ADDR    R4,     R3                      ; 58E9   00E3
        BMI     L_58F4                          ; 58EA   020B 0008

        CMPI    #$002C, R3                      ; 58EC   037B 002C
        BC      L_58F7                          ; 58EE   0201 0007

L_58F0:
        MVO     R3,     G_0358                  ; 58F0   0243 0358
        B       L_58B8                          ; 58F2   0220 003B

L_58F4:
        CLRR    R3                              ; 58F4   01DB
        B       L_58F0                          ; 58F5   0220 0006

L_58F7:
        MVII    #$002B, R3                      ; 58F7   02BB 002B
        B       L_58F0                          ; 58F9   0220 000A

        PSHR    R5                              ; 58FB   0275
        CLRR    R4                              ; 58FC   01E4
        DECR    R4                              ; 58FD   0014
        DECR    R4                              ; 58FE   0014
        B       L_58C9                          ; 58FF   0220 0037

L_5901:
        PSHR    R5                              ; 5901   0275
        MVII    #$0005, R3                      ; 5902   02BB 0005

        JSR     R5,     L_6CDB                  ; 5904   0004 016C 00DB

        BEQ     L_5ADF                          ; 5907   0204 01D6

        MVI     G_0117, R0                      ; 5909   0280 0117
        PSHR    R0                              ; 590B   0270
        SLL     R0,     1                       ; 590C   0048
        ADD@    R6,     R0                      ; 590D   02F0

        JSR     R5,     .EXEC.772               ; 590E   0004 0114 0372

        MVO     R2,     G_01C7                  ; 5911   0242 01C7
        MVO     R3,     G_01C8                  ; 5913   0243 01C8

        JSR     R5,     L_5E23                  ; 5915   0004 015C 0223

        MVI     G_013A, R2                      ; 5918   0282 013A
        MVI     G_0184, R3                      ; 591A   0283 0184
        MVI     G_0136, R0                      ; 591C   0280 0136
        CMPI    #$0007, R0                      ; 591E   0378 0007
        BNC     L_5924                          ; 5920   0209 0002

        MVII    #$0005, R0                      ; 5922   02B8 0005
L_5924:
        SDBD                                    ; 5924   0001
        MVII    #$6F47, R4                      ; 5925   02BC 0047 006F
        ADDR    R0,     R4                      ; 5928   00C4
        MVI@    R4,     R0                      ; 5929   02A0
        ANDI    #$000F, R0                      ; 592A   03B8 000F
        BEQ     L_5931                          ; 592C   0204 0003

        NEGR    R2                              ; 592E   0022
        ADDI    #$008D, R2                      ; 592F   02FA 008D
L_5931:
        ADDI    #$0005, R4                      ; 5931   02FC 0005
        MVI@    R4,     R0                      ; 5933   02A0
        ANDI    #$000F, R0                      ; 5934   03B8 000F
        BEQ     L_593B                          ; 5936   0204 0003

        NEGR    R3                              ; 5938   0023
        ADDI    #$0090, R3                      ; 5939   02FB 0090
L_593B:
        ADDI    #$0005, R4                      ; 593B   02FC 0005
        MVI@    R4,     R0                      ; 593D   02A0
        ANDI    #$000F, R0                      ; 593E   03B8 000F
        BEQ     L_5943                          ; 5940   0204 0001

        CLRR    R2                              ; 5942   01D2
L_5943:
        ADDI    #$0005, R4                      ; 5943   02FC 0005
        MVI@    R4,     R0                      ; 5945   02A0
        ANDI    #$000F, R0                      ; 5946   03B8 000F
        BEQ     L_594B                          ; 5948   0204 0001

        CLRR    R3                              ; 594A   01DB
L_594B:
        MOVR    R2,     R0                      ; 594B   0090

        JSR     R5,     X_SQUARE                ; 594C   0004 011C 01DB

        MOVR    R2,     R4                      ; 594F   0094
        MOVR    R3,     R0                      ; 5950   0098

        JSR     R5,     X_SQUARE                ; 5951   0004 011C 01DB

        ADDR    R4,     R2                      ; 5954   00E2
        SDBD                                    ; 5955   0001
        CMPI    #$05F1, R2                      ; 5956   037A 00F1 0005
        BNC     L_5CA1                          ; 5959   0209 0346

        SDBD                                    ; 595B   0001
        CMPI    #$2BE4, R2                      ; 595C   037A 00E4 002B
        BC      L_5CA1                          ; 595F   0201 0340

        MVII    #$0003, R3                      ; 5961   02BB 0003

        JSR     R5,     L_6CDB                  ; 5963   0004 016C 00DB

        BEQ     L_5A08                          ; 5966   0204 00A0

        MVI     G_0181, R0                      ; 5968   0280 0181
        CMPI    #$0004, R0                      ; 596A   0378 0004
        BEQ     L_5A08                          ; 596C   0204 009A

        MVI     G_0180, R0                      ; 596E   0280 0180
        CMPI    #$0004, R0                      ; 5970   0378 0004
        BEQ     L_5A08                          ; 5972   0204 0094

        MVI     G_0117, R1                      ; 5974   0281 0117
        MOVR    R1,     R2                      ; 5976   008A
        SDBD                                    ; 5977   0001
        ADDI    #$0161, R1                      ; 5978   02F9 0061 0001
        XORI    #$0001, R2                      ; 597B   03FA 0001
        SDBD                                    ; 597D   0001
        ADDI    #$0161, R2                      ; 597E   02FA 0061 0001
        MVI@    R1,     R0                      ; 5981   0288
        MVI@    R2,     R3                      ; 5982   0293
        CMP     G_0137, R3                      ; 5983   0343 0137
        BNEQ    L_59D0                          ; 5985   020C 0049

        MVI     G_0137, R0                      ; 5987   0280 0137
        MVO@    R0,     R1                      ; 5989   0248
        MVI     G_0136, R4                      ; 598A   0284 0136
        CMPI    #$0007, R4                      ; 598C   037C 0007
        BNC     L_5992                          ; 598E   0209 0002

        MVII    #$0005, R4                      ; 5990   02BC 0005
L_5992:
        DECR    R4                              ; 5992   0014
        MVI     G_0186, R5                      ; 5993   0285 0186
        TSTR    R5                              ; 5995   00AD
        BEQ     L_599A                          ; 5996   0204 0002

        MVII    #$0001, R5                      ; 5998   02BD 0001
L_599A:
        SDBD                                    ; 599A   0001
        ADDI    #$6F78, R4                      ; 599B   02FC 0078 006F
        MVI@    R4,     R0                      ; 599E   02A0
        ANDI    #$000F, R0                      ; 599F   03B8 000F
        MVI     G_0139, R1                      ; 59A1   0281 0139
        ADDI    #$0030, R1                      ; 59A3   02F9 0030
        TSTR    R0                              ; 59A5   0080
        BEQ     L_59B6                          ; 59A6   0204 000E

        MVI     G_0138, R1                      ; 59A8   0281 0138
        ADDI    #$0020, R1                      ; 59AA   02F9 0020
        DECR    R0                              ; 59AC   0010
        BEQ     L_59B6                          ; 59AD   0204 0007

        MVI     G_013A, R1                      ; 59AF   0281 013A
        DECR    R0                              ; 59B1   0010
        BEQ     L_59B6                          ; 59B2   0204 0002

        MVI     G_0184, R1                      ; 59B4   0281 0184
L_59B6:
        CLRR    R0                              ; 59B6   01C0
        CMPI    #$0050, R1                      ; 59B7   0379 0050
        ADCR    R0                              ; 59B9   0028
        ADDI    #$0005, R4                      ; 59BA   02FC 0005
        XOR@    R4,     R0                      ; 59BC   03E0
        XORR    R5,     R0                      ; 59BD   01E8
        ANDI    #$000F, R0                      ; 59BE   03B8 000F
        MVI     G_0117, R2                      ; 59C0   0282 0117
        TSTR    R2                              ; 59C2   0092
        BNEQ    L_59C9                          ; 59C3   020C 0004

        MVO     R0,     G_0163                  ; 59C5   0240 0163
        B       L_5A08                          ; 59C7   0200 003F

L_59C9:
        SUB     G_0163, R0                      ; 59C9   0300 0163
        NEGR    R0                              ; 59CB   0020
        MVO     R0,     G_0163                  ; 59CC   0240 0163
        B       L_5A08                          ; 59CE   0200 0038

L_59D0:
        CMPR    R0,     R3                      ; 59D0   0143
        BNEQ    L_59D6                          ; 59D1   020C 0003

        CLRR    R4                              ; 59D3   01E4
        MVO     R4,     G_0163                  ; 59D4   0244 0163
L_59D6:
        SUB     G_0137, R0                      ; 59D6   0300 0137
        BEQ     L_5A08                          ; 59D8   0204 002E

        CLRR    R2                              ; 59DA   01D2

        JSR     R5,     X_EXT_SIGN_LO           ; 59DB   0004 0114 0268

        BPL     L_59E2                          ; 59DE   0203 0002

        NEGR    R0                              ; 59E0   0020
        INCR    R2                              ; 59E1   000A
L_59E2:
        SLR     R0,     2                       ; 59E2   0064
        ADDR    R0,     R2                      ; 59E3   00C2
        MVI     G_0186, R3                      ; 59E4   0283 0186
        SLR     R3,     2                       ; 59E6   0067
        SLR     R3,     2                       ; 59E7   0067
        SLR     R3,     1                       ; 59E8   0063
        PSHR    R3                              ; 59E9   0273
        MVI     G_0136, R0                      ; 59EA   0280 0136
        CMPI    #$0007, R0                      ; 59EC   0378 0007
        BNC     L_59F2                          ; 59EE   0209 0002

        MVII    #$0005, R0                      ; 59F0   02B8 0005
L_59F2:
        DECR    R0                              ; 59F2   0010
        SLL     R0,     2                       ; 59F3   004C
        ADDR    R0,     R2                      ; 59F4   00C2
        SDBD                                    ; 59F5   0001
        ADDI    #$6F60, R2                      ; 59F6   02FA 0060 006F
        MVI@    R2,     R0                      ; 59F9   0290
        ANDI    #$000F, R0                      ; 59FA   03B8 000F
        XOR@    R6,     R0                      ; 59FC   03F0
        XOR     G_0117, R0                      ; 59FD   03C0 0117
        SLL     R0,     1                       ; 59FF   0048
        DECR    R0                              ; 5A00   0010
        ADD     G_0163, R0                      ; 5A01   02C0 0163
        MVO     R0,     G_0163                  ; 5A03   0240 0163
        MVI     G_0137, R0                      ; 5A05   0280 0137
        MVO@    R0,     R1                      ; 5A07   0248
L_5A08:
        MVI     G_013A, R2                      ; 5A08   0282 013A
        MVI     G_0184, R3                      ; 5A0A   0283 0184
        MVI     G_0136, R1                      ; 5A0C   0281 0136
        CMPI    #$0008, R1                      ; 5A0E   0379 0008
        BNEQ    L_5A4D                          ; 5A10   020C 003B

        MVI     G_0117, R1                      ; 5A12   0281 0117
        MOVR    R1,     R3                      ; 5A14   008B
        ADDI    #$012B, R3                      ; 5A15   02FB 012B
        ADDI    #$012D, R1                      ; 5A17   02F9 012D
        MVI     G_013A, R0                      ; 5A19   0280 013A
        MVI     G_0116, R4                      ; 5A1B   0284 0116
        TSTR    R4                              ; 5A1D   00A4
        BEQ     L_5A23                          ; 5A1E   0204 0003

        NEGR    R0                              ; 5A20   0020
        ADDI    #$0094, R0                      ; 5A21   02F8 0094
L_5A23:
        CMPI    #$0044, R0                      ; 5A23   0378 0044
        BNC     L_5A4D                          ; 5A25   0209 0026

        CMPI    #$0062, R0                      ; 5A27   0378 0062
        BC      L_5A46                          ; 5A29   0201 001B

        MVI@    R3,     R2                      ; 5A2B   029A
        TSTR    R2                              ; 5A2C   0092
        BNEQ    L_5A4D                          ; 5A2D   020C 001E

        MVII    #$0001, R2                      ; 5A2F   02BA 0001
        MVO@    R2,     R3                      ; 5A31   025A
        MVI@    R1,     R2                      ; 5A32   028A
        DECR    R2                              ; 5A33   0012
        BPL     L_5A43                          ; 5A34   0203 000D

        MVII    #$0020, R4                      ; 5A36   02BC 0020
        COMR    R4                              ; 5A38   001C
        AND     G_034C, R4                      ; 5A39   0384 034C
        XORI    #$0020, R4                      ; 5A3B   03FC 0020
        MVO     R4,     G_034C                  ; 5A3D   0244 034C
        MVII    #$000F, R4                      ; 5A3F   02BC 000F
        MVO     R4,     G_035B                  ; 5A41   0244 035B
L_5A43:
        MVO@    R2,     R1                      ; 5A43   024A
        B       L_5A4D                          ; 5A44   0200 0007

L_5A46:
        CLRR    R4                              ; 5A46   01E4
        CMPI    #$0078, R0                      ; 5A47   0378 0078
        BC      L_5A4C                          ; 5A49   0201 0001

        INCR    R4                              ; 5A4B   000C
L_5A4C:
        MVO@    R4,     R3                      ; 5A4C   025C
L_5A4D:
        MVII    #$0006, R3                      ; 5A4D   02BB 0006

        JSR     R5,     L_6CDB                  ; 5A4F   0004 016C 00DB

        BEQ     L_5ADF                          ; 5A52   0204 008B

        MVI     G_0353, R1                      ; 5A54   0281 0353
        TSTR    R1                              ; 5A56   0089
        BNEQ    L_5ADF                          ; 5A57   020C 0086

        CLRR    R0                              ; 5A59   01C0
        MVI     G_013A, R2                      ; 5A5A   0282 013A
        MVI     G_0184, R3                      ; 5A5C   0283 0184
        CMPI    #$0032, R3                      ; 5A5E   037B 0032
        ADCR    R0                              ; 5A60   0028
        CMPI    #$0069, R3                      ; 5A61   037B 0069
        ADCR    R0                              ; 5A63   0028
        SLL     R0,     2                       ; 5A64   004C
        CMPI    #$0032, R2                      ; 5A65   037A 0032
        ADCR    R0                              ; 5A67   0028
        CMPI    #$0069, R2                      ; 5A68   037A 0069
        ADCR    R0                              ; 5A6A   0028
        MVI     G_0136, R1                      ; 5A6B   0281 0136
        CMPI    #$0005, R1                      ; 5A6D   0379 0005
        BC      L_5A91                          ; 5A6F   0201 0020

        SDBD                                    ; 5A71   0001
        ADDI    #$6F18, R1                      ; 5A72   02F9 0018 006F
        MVI     G_0136, R3                      ; 5A75   0283 0136
        SLL     R3,     2                       ; 5A77   004F
        MVI@    R1,     R5                      ; 5A78   028D
        ANDI    #$000F, R5                      ; 5A79   03BD 000F
        CMPR    R5,     R0                      ; 5A7B   0168
        BNEQ    L_5A7F                          ; 5A7C   020C 0001

        INCR    R3                              ; 5A7E   000B
L_5A7F:
        MVI     G_0186, R0                      ; 5A7F   0280 0186
        TSTR    R0                              ; 5A81   0080
        BEQ     L_5A86                          ; 5A82   0204 0002

        ADDI    #$0002, R3                      ; 5A84   02FB 0002
L_5A86:
        SDBD                                    ; 5A86   0001
        ADDI    #$6F2C, R3                      ; 5A87   02FB 002C 006F
        MVI@    R3,     R0                      ; 5A8A   0298
        ANDI    #$000F, R0                      ; 5A8B   03B8 000F
        MVO     R0,     G_0354                  ; 5A8D   0240 0354
        B       L_5AAD                          ; 5A8F   0200 001C

L_5A91:
        CMPI    #$0006, R1                      ; 5A91   0379 0006
        BEQ     L_5A98                          ; 5A93   0204 0003

        MVII    #$0005, R1                      ; 5A95   02B9 0005
        SLR     R0,     2                       ; 5A97   0064
L_5A98:
        ANDI    #$0003, R0                      ; 5A98   03B8 0003
        SLL     R1,     2                       ; 5A9A   004D
        SLL     R1,     1                       ; 5A9B   0049
        ADDR    R0,     R1                      ; 5A9C   00C1
        MVI     G_0186, R2                      ; 5A9D   0282 0186
        TSTR    R2                              ; 5A9F   0092
        BEQ     L_5AA4                          ; 5AA0   0204 0002

        ADDI    #$0004, R1                      ; 5AA2   02F9 0004
L_5AA4:
        SDBD                                    ; 5AA4   0001
        ADDI    #$6EF5, R1                      ; 5AA5   02F9 00F5 006E
        MVI@    R1,     R0                      ; 5AA8   0288
        ANDI    #$000F, R0                      ; 5AA9   03B8 000F
        MVO     R0,     G_0354                  ; 5AAB   0240 0354
L_5AAD:
        MVI     G_035B, R1                      ; 5AAD   0281 035B
        MVII    #$0007, R2                      ; 5AAF   02BA 0007
        SDBD                                    ; 5AB1   0001
        MVII    #$5CB0, R4                      ; 5AB2   02BC 00B0 005C
L_5AB5:
        CMP@    R4,     R1                      ; 5AB5   0361
        BEQ     L_5ADF                          ; 5AB6   0204 0027

        DECR    R2                              ; 5AB8   0012
        BNEQ    L_5AB5                          ; 5AB9   022C 0005

        MVI     G_0136, R1                      ; 5ABB   0281 0136
        CMPI    #$0006, R1                      ; 5ABD   0379 0006
        BNEQ    L_5AC6                          ; 5ABF   020C 0005

        JSR     R5,     L_5AE0                  ; 5AC1   0004 0158 02E0

        B       L_5ADC                          ; 5AC4   0200 0016

L_5AC6:
        CMPI    #$0005, R1                      ; 5AC6   0379 0005
        BNC     L_5ADC                          ; 5AC8   0209 0012

        MVI     G_035C, R1                      ; 5ACA   0281 035C
        TSTR    R1                              ; 5ACC   0089
        BNEQ    L_5ADC                          ; 5ACD   020C 000D

        JSR     R5,     L_5C88                  ; 5ACF   0004 015C 0088

        MVI     G_0184, R0                      ; 5AD2   0280 0184
        MVO     R0,     G_013A                  ; 5AD4   0240 013A

        JSR     R5,     L_5AE0                  ; 5AD6   0004 0158 02E0
        JSR     R5,     L_5C88                  ; 5AD9   0004 015C 0088
L_5ADC:
        JSR     R5,     L_5C91                  ; 5ADC   0004 015C 0091

L_5ADF:
        PULR    R7                              ; 5ADF   02B7

L_5AE0:
        PSHR    R5                              ; 5AE0   0275
        MVI     G_0117, R1                      ; 5AE1   0281 0117
        XORI    #$0001, R1                      ; 5AE3   03F9 0001
        MOVR    R1,     R0                      ; 5AE5   0088
        ADDI    #$0180, R1                      ; 5AE6   02F9 0180
        MVI@    R1,     R1                      ; 5AE8   0289
        CMPI    #$0004, R1                      ; 5AE9   0379 0004
        BEQ     L_5B41                          ; 5AEB   0204 0054

        SLL     R0,     2                       ; 5AED   004C

        JSR     R5,     .EXEC.772               ; 5AEE   0004 0114 0372

        PSHR    R2                              ; 5AF1   0272
        PSHR    R3                              ; 5AF2   0273
        MVI     G_0117, R0                      ; 5AF3   0280 0117
        SLL     R0,     2                       ; 5AF5   004C

        JSR     R5,     .EXEC.772               ; 5AF6   0004 0114 0372

        SUB@    R6,     R3                      ; 5AF9   0333
        SUB@    R6,     R2                      ; 5AFA   0332
        SLL     R3,     1                       ; 5AFB   004B
        PSHR    R3                              ; 5AFC   0273
        SUBR    R2,     R3                      ; 5AFD   0113
        ADD@    R6,     R2                      ; 5AFE   02F2
        MVI     G_0136, R4                      ; 5AFF   0284 0136
        CMPI    #$0006, R4                      ; 5B01   037C 0006
        BEQ     L_5B08                          ; 5B03   0204 0003

        XORR    R2,     R3                      ; 5B05   01D3
        XORR    R3,     R2                      ; 5B06   01DA
        XORR    R2,     R3                      ; 5B07   01D3
L_5B08:
        CLRR    R4                              ; 5B08   01E4
        MVI     G_0354, R0                      ; 5B09   0280 0354
        CMPI    #$0005, R0                      ; 5B0B   0378 0005
        BNC     L_5B19                          ; 5B0D   0209 000A

        CMPI    #$000D, R0                      ; 5B0F   0378 000D
        BC      L_5B41                          ; 5B11   0201 002E

        CMPI    #$0007, R0                      ; 5B13   0378 0007
        BNC     L_5B41                          ; 5B15   0209 002A

        MVII    #$0001, R4                      ; 5B17   02BC 0001
L_5B19:
        MVI     G_013A, R0                      ; 5B19   0280 013A
        SUBR    R2,     R0                      ; 5B1B   0110
        CMPI    #$004D, R0                      ; 5B1C   0378 004D
        BNC     L_5B22                          ; 5B1E   0209 0002

        ADDI    #$0002, R4                      ; 5B20   02FC 0002
L_5B22:
        ADDI    #$000F, R2                      ; 5B22   02FA 000F
        CMPI    #$001E, R2                      ; 5B24   037A 001E
        BC      L_5B41                          ; 5B26   0201 0019

        ADDI    #$0028, R3                      ; 5B28   02FB 0028
        CMPI    #$0050, R3                      ; 5B2A   037B 0050
        BC      L_5B41                          ; 5B2C   0201 0013

        CMPI    #$0028, R3                      ; 5B2E   037B 0028
        BNC     L_5B34                          ; 5B30   0209 0002

        ADDI    #$0004, R4                      ; 5B32   02FC 0004
L_5B34:
        SDBD                                    ; 5B34   0001
        ADDI    #$6F40, R4                      ; 5B35   02FC 0040 006F
        MVI@    R4,     R0                      ; 5B38   02A0
        ANDI    #$000F, R0                      ; 5B39   03B8 000F
        CMPI    #$0001, R0                      ; 5B3B   0378 0001
        BEQ     L_5B41                          ; 5B3D   0204 0002

        MVO     R0,     G_0354                  ; 5B3F   0240 0354
L_5B41:
        PULR    R7                              ; 5B41   02B7

L_5B42:
        PSHR    R5                              ; 5B42   0275

        JSR     R5,     L_5E23                  ; 5B43   0004 015C 0223

        MVI     G_013A, R2                      ; 5B46   0282 013A
        MVI     G_0184, R3                      ; 5B48   0283 0184
        MVI     G_0136, R0                      ; 5B4A   0280 0136
        CMPI    #$0007, R0                      ; 5B4C   0378 0007
        BNC     L_5B60                          ; 5B4E   0209 0010

        SLL     R0,     2                       ; 5B50   004C
        SLL     R0,     1                       ; 5B51   0048
        MOVR    R0,     R4                      ; 5B52   0084
        SDBD                                    ; 5B53   0001
        ADDI    #$6F60, R4                      ; 5B54   02FC 0060 006F

        JSR     R5,     L_5C7A                  ; 5B57   0004 015C 007A

        BC      L_5B71                          ; 5B5A   0201 0015

        MVII    #$01F0, R0                      ; 5B5C   02B8 01F0
        B       L_5B61                          ; 5B5E   0200 0001

L_5B60:
        CLRR    R0                              ; 5B60   01C0
L_5B61:
        CLRR    R3                              ; 5B61   01DB
L_5B62:
        MVO     R3,     G_035C                  ; 5B62   0243 035C
        SAR     R0,     1                       ; 5B64   0068
        MVO     R0,     G_0160                  ; 5B65   0240 0160
        CMPI    #$0002, R3                      ; 5B67   037B 0002
        BNEQ    L_5B6D                          ; 5B69   020C 0002

        MVII    #$00FF, R3                      ; 5B6B   02BB 00FF
L_5B6D:
        MVO     R3,     G_015F                  ; 5B6D   0243 015F
        B       L_5BA5                          ; 5B6F   0200 0034

L_5B71:
        JSR     R5,     L_5C7A                  ; 5B71   0004 015C 007A

        BNC     L_5B60                          ; 5B74   0229 0015

        JSR     R5,     L_5C7A                  ; 5B76   0004 015C 007A

        BC      L_5B82                          ; 5B79   0201 0007

        MOVR    R2,     R0                      ; 5B7B   0090
        SUBI    #$0028, R0                      ; 5B7C   0338 0028
        CLRR    R3                              ; 5B7E   01DB
        INCR    R3                              ; 5B7F   000B
        B       L_5B62                          ; 5B80   0220 001F

L_5B82:
        JSR     R5,     L_5C7A                  ; 5B82   0004 015C 007A

        BNC     L_5B60                          ; 5B85   0229 0026

        JSR     R5,     L_5C7A                  ; 5B87   0004 015C 007A

        BC      L_5B90                          ; 5B8A   0201 0004

        MVII    #$0010, R0                      ; 5B8C   02B8 0010
        B       L_5B61                          ; 5B8E   0220 002E

L_5B90:
        JSR     R5,     L_5C7A                  ; 5B90   0004 015C 007A

        BC      L_5B9C                          ; 5B93   0201 0007

        MVII    #$0058, R0                      ; 5B95   02B8 0058
        SUBR    R2,     R0                      ; 5B97   0110
        MVII    #$0002, R3                      ; 5B98   02BB 0002
        B       L_5B62                          ; 5B9A   0220 0039

L_5B9C:
        JSR     R5,     L_5C7A                  ; 5B9C   0004 015C 007A

        BC      L_5B60                          ; 5B9F   0221 0040

        MVII    #$01F0, R0                      ; 5BA1   02B8 01F0
        B       L_5B61                          ; 5BA3   0220 0043

L_5BA5:
        MVI     G_034E, R0                      ; 5BA5   0280 034E
        SUB     G_0160, R0                      ; 5BA7   0300 0160

        JSR     R5,     X_EXT_SIGN_LO           ; 5BA9   0004 0114 0268

        MOVR    R0,     R2                      ; 5BAC   0082
        SAR     R2,     1                       ; 5BAD   006A
        MVO     R2,     G_034F                  ; 5BAE   0242 034F
        MVII    #$0005, R1                      ; 5BB0   02B9 0005
        MVI     G_0160, R0                      ; 5BB2   0280 0160

        JSR     R5,     X_EXT_SIGN_LO           ; 5BB4   0004 0114 0268
        JSR     R5,     X_MPY                   ; 5BB7   0004 011C 01DC

        MOVR    R2,     R3                      ; 5BBA   0093
        MVI     G_034E, R0                      ; 5BBB   0280 034E

        JSR     R5,     X_EXT_SIGN_LO           ; 5BBD   0004 0114 0268

        SUBR    R0,     R3                      ; 5BC0   0103
        SAR     R3,     2                       ; 5BC1   006F
        MVO     R3,     G_0350                  ; 5BC2   0243 0350
        MVI     G_0353, R0                      ; 5BC4   0280 0353
        TSTR    R0                              ; 5BC6   0080
        BEQ     L_5C1D                          ; 5BC7   0204 0054

L_5BC9:
        MVI     G_0352, R0                      ; 5BC9   0280 0352

        JSR     R5,     X_EXT_SIGN_LO           ; 5BCB   0004 0114 0268

        SLL     R0,     2                       ; 5BCE   004C
        SLL     R0,     2                       ; 5BCF   004C
        MVII    #$034D, R4                      ; 5BD0   02BC 034D
        SDBD                                    ; 5BD2   0001
        ADD@    R4,     R0                      ; 5BD3   02E0
        MVO     R0,     G_034D                  ; 5BD4   0240 034D
        SWAP    R0,     1                       ; 5BD6   0040
        MVO     R0,     G_034E                  ; 5BD7   0240 034E
        MVI     G_0352, R0                      ; 5BD9   0280 0352
        SUBI    #$0008, R0                      ; 5BDB   0338 0008
        MVO     R0,     G_0352                  ; 5BDD   0240 0352
        MVI     G_034E, R0                      ; 5BDF   0280 034E
        MVI     G_0160, R1                      ; 5BE1   0281 0160

        JSR     R5,     X_PACK_BYTES            ; 5BE3   0004 0114 034F
        JSR     R5,     X_UNPK_BYTES            ; 5BE6   0004 0114 0357

        SUBR    R1,     R0                      ; 5BE9   0108
        INCR    R0                              ; 5BEA   0008
        BPL     L_5C75                          ; 5BEB   0203 0088

        MVI     G_015F, R0                      ; 5BED   0280 015F
        MVI     G_0356, R1                      ; 5BEF   0281 0356

        JSR     R5,     X_PACK_BYTES            ; 5BF1   0004 0114 034F
        JSR     R5,     X_UNPK_BYTES            ; 5BF4   0004 0114 0357

        NEGR    R0                              ; 5BF7   0020

        JSR     R5,     X_MPY                   ; 5BF8   0004 011C 01DC

        TSTR    R2                              ; 5BFB   0092
        BPL     L_5C18                          ; 5BFC   0203 001A

        MVI     G_035B, R0                      ; 5BFE   0280 035B
        CMPI    #$0002, R0                      ; 5C00   0378 0002
        BC      L_5C18                          ; 5C02   0201 0014

        MVII    #$0001, R0                      ; 5C04   02B8 0001
        MVI     G_0117, R3                      ; 5C06   0283 0117
        CLRR    R4                              ; 5C08   01E4
        MVO     R4,     G_0358                  ; 5C09   0244 0358
        MVO     R4,     G_0356                  ; 5C0B   0244 0356
        MVO     R4,     G_0357                  ; 5C0D   0244 0357

        JSR     R5,     L_5CCB                  ; 5C0F   0004 015C 00CB
        JSR     R5,     L_6BF6                  ; 5C12   0004 0168 03F6
        JSR     R5,     L_5CB7                  ; 5C15   0004 015C 00B7

L_5C18:
        CLRR    R0                              ; 5C18   01C0
        MVO     R0,     G_0353                  ; 5C19   0240 0353
        B       L_5C71                          ; 5C1B   0200 0054

L_5C1D:
        MVI     G_0356, R0                      ; 5C1D   0280 0356
        ADD     G_0357, R0                      ; 5C1F   02C0 0357
        MVI     G_0351, R1                      ; 5C21   0281 0351
        SUB     G_015F, R1                      ; 5C23   0301 015F
        BEQ     L_5C71                          ; 5C25   0204 004A

        JSR     R5,     X_PACK_BYTES            ; 5C27   0004 0114 034F
        JSR     R5,     X_UNPK_BYTES            ; 5C2A   0004 0114 0357
        JSR     R5,     X_MPY                   ; 5C2D   0004 011C 01DC

        DECR    R2                              ; 5C30   0012
        BMI     L_5C4F                          ; 5C31   020B 001C

        MVII    #$0001, R0                      ; 5C33   02B8 0001
        MVO     R0,     G_0353                  ; 5C35   0240 0353
        MVI     G_0356, R0                      ; 5C37   0280 0356
        ADD     G_0357, R0                      ; 5C39   02C0 0357
        MVI     G_0351, R1                      ; 5C3B   0281 0351

        JSR     R5,     X_PACK_BYTES            ; 5C3D   0004 0114 034F
        JSR     R5,     X_UNPK_BYTES            ; 5C40   0004 0114 0357
        JSR     R5,     X_MPY                   ; 5C43   0004 011C 01DC

        SAR     R2,     1                       ; 5C46   006A
        MVII    #$00FF, R0                      ; 5C47   02B8 00FF
        MVO     R2,     G_0352                  ; 5C49   0242 0352
        MVO     R0,     G_034D                  ; 5C4B   0240 034D
        B       L_5BC9                          ; 5C4D   0220 0085

L_5C4F:
        MVI     G_035B, R3                      ; 5C4F   0283 035B
        CMPI    #$0002, R3                      ; 5C51   037B 0002
        BC      L_5C71                          ; 5C53   0201 001C

        MVI     G_0351, R3                      ; 5C55   0283 0351
        TSTR    R3                              ; 5C57   009B
        BEQ     L_5C64                          ; 5C58   0204 000A

        MVI     G_0358, R1                      ; 5C5A   0281 0358
        SWAP    R1,     1                       ; 5C5C   0041
        MVII    #$00C6, R2                      ; 5C5D   02BA 00C6

        JSR     R5,     X_DIV                   ; 5C5F   0004 011C 01FB

        B       L_5C6D                          ; 5C62   0200 0009

L_5C64:
        MVI     G_0358, R0                      ; 5C64   0280 0358
        MVII    #$00C6, R1                      ; 5C66   02B9 00C6

        JSR     R5,     X_MPY                   ; 5C68   0004 011C 01DC

        SWAP    R2,     1                       ; 5C6B   0042
        MOVR    R2,     R0                      ; 5C6C   0090
L_5C6D:
        ANDI    #$00FF, R0                      ; 5C6D   03B8 00FF
        MVO     R0,     G_0358                  ; 5C6F   0240 0358
L_5C71:
        MVI     G_0160, R0                      ; 5C71   0280 0160
        MVO     R0,     G_034E                  ; 5C73   0240 034E
L_5C75:
        MVI     G_015F, R0                      ; 5C75   0280 015F
        MVO     R0,     G_0351                  ; 5C77   0240 0351
        PULR    R7                              ; 5C79   02B7

L_5C7A:
        PSHR    R5                              ; 5C7A   0275
        PSHR    R3                              ; 5C7B   0273
        MVI@    R4,     R3                      ; 5C7C   02A3
        ANDI    #$001F, R3                      ; 5C7D   03BB 001F
        BEQ     L_5C85                          ; 5C7F   0204 0004

        SLL     R3,     1                       ; 5C81   004B
        INCR    R3                              ; 5C82   000B
        SLL     R3,     2                       ; 5C83   004F
        SLL     R3,     1                       ; 5C84   004B
L_5C85:
        CMPR    R3,     R2                      ; 5C85   015A
        PULR    R3                              ; 5C86   02B3
        PULR    R7                              ; 5C87   02B7

L_5C88:
        MVII    #$0008, R0                      ; 5C88   02B8 0008
        SUB     G_0354, R0                      ; 5C8A   0300 0354
        ANDI    #$000F, R0                      ; 5C8C   03B8 000F
        MVO     R0,     G_0354                  ; 5C8E   0240 0354
        MOVR    R5,     R7                      ; 5C90   00AF

L_5C91:
        MVI     G_0358, R0                      ; 5C91   0280 0358
        CMPI    #$001F, R0                      ; 5C93   0378 001F
        BEQ     L_5CA0                          ; 5C95   0204 0009
        BMI     L_5C9D                          ; 5C97   020B 0004

        DECR    R0                              ; 5C99   0010
        DECR    R0                              ; 5C9A   0010
        B       L_5C9E                          ; 5C9B   0200 0001

L_5C9D:
        INCR    R0                              ; 5C9D   0008
L_5C9E:
        MVO     R0,     G_0358                  ; 5C9E   0240 0358
L_5CA0:
        MOVR    R5,     R7                      ; 5CA0   00AF

L_5CA1:
        JSR     R5,     L_5CCB                  ; 5CA1   0004 015C 00CB

        MVI     G_0117, R3                      ; 5CA4   0283 0117
        MVII    #$0002, R0                      ; 5CA6   02B8 0002

        JSR     R5,     L_6BF6                  ; 5CA8   0004 0168 03F6
        JSR     R5,     L_5CB7                  ; 5CAB   0004 015C 00B7

        B       L_5A08                          ; 5CAE   0220 02A7

        DECLE   $000B,  $000E,  $0005           ; 5CB0   000B 000E 0005

        CLRC                                    ; 5CB3   0006
        COMR    R0                              ; 5CB4   0018
        COMR    R1                              ; 5CB5   0019
        DIS                                     ; 5CB6   0003
L_5CB7:
        MVI     G_0117, R1                      ; 5CB7   0281 0117
        SDBD                                    ; 5CB9   0001
        MVII    #$034D, R4                      ; 5CBA   02BC 004D 0003
        SDBD                                    ; 5CBD   0001
        ADDI    #$0164, R1                      ; 5CBE   02F9 0064 0001
        MVII    #$0010, R2                      ; 5CC1   02BA 0010
L_5CC3:
        MVI@    R1,     R0                      ; 5CC3   0288
        MVO@    R0,     R4                      ; 5CC4   0260
        ADDI    #$0002, R1                      ; 5CC5   02F9 0002
        DECR    R2                              ; 5CC7   0012
        BNEQ    L_5CC3                          ; 5CC8   022C 0006
        MOVR    R5,     R7                      ; 5CCA   00AF

L_5CCB:
        MVI     G_0117, R1                      ; 5CCB   0281 0117
        SDBD                                    ; 5CCD   0001
        MVII    #$034D, R4                      ; 5CCE   02BC 004D 0003
        SDBD                                    ; 5CD1   0001
        ADDI    #$0164, R1                      ; 5CD2   02F9 0064 0001
        MVII    #$0010, R2                      ; 5CD5   02BA 0010
L_5CD7:
        MVI@    R4,     R0                      ; 5CD7   02A0
        MVO@    R0,     R1                      ; 5CD8   0248
        ADDI    #$0002, R1                      ; 5CD9   02F9 0002
        DECR    R2                              ; 5CDB   0012
        BNEQ    L_5CD7                          ; 5CDC   022C 0006
        MOVR    R5,     R7                      ; 5CDE   00AF

L_5CDF:
        PSHR    R5                              ; 5CDF   0275

        JSR     R5,     L_5D05                  ; 5CE0   0004 015C 0105

        MVI     G_0136, R1                      ; 5CE3   0281 0136
        CLRR    R3                              ; 5CE5   01DB
        TSTR    R1                              ; 5CE6   0089
        BEQ     L_5CF9                          ; 5CE7   0204 0010

        SLL     R1,     1                       ; 5CE9   0049
        SLL     R1,     2                       ; 5CEA   004D
        ADD     G_0119, R1                      ; 5CEB   02C1 0119
        SLL     R1,     2                       ; 5CED   004D
        SLL     R1,     1                       ; 5CEE   0049
        ADD     G_0118, R1                      ; 5CEF   02C1 0118
        SDBD                                    ; 5CF1   0001
        ADDI    #$5E8A, R1                      ; 5CF2   02F9 008A 005E
        MVI@    R1,     R3                      ; 5CF5   028B

        JSR     R5,     L_5D82                  ; 5CF6   0004 015C 0182

L_5CF9:
        MVI     G_0133, R1                      ; 5CF9   0281 0133
        PSHR    R1                              ; 5CFB   0271
        SLL     R1,     2                       ; 5CFC   004D
        ADD@    R6,     R1                      ; 5CFD   02F1
        SLL     R1,     2                       ; 5CFE   004D
        ADD     G_0132, R1                      ; 5CFF   02C1 0132
        ADDI    #$0200, R1                      ; 5D01   02F9 0200
        MVO@    R3,     R1                      ; 5D03   024B
        PULR    R7                              ; 5D04   02B7

L_5D05:
        PSHR    R5                              ; 5D05   0275
        MVI     G_0130, R2                      ; 5D06   0282 0130
        SLR     R2,     1                       ; 5D08   0062
        NEGR    R2                              ; 5D09   0022
        ADDI    #$0028, R2                      ; 5D0A   02FA 0028
        ADD     G_0131, R2                      ; 5D0C   02C2 0131
        MVO     R2,     G_0144                  ; 5D0E   0242 0144
        ANDI    #$00FE, R2                      ; 5D10   03BA 00FE
        ADD     G_0130, R2                      ; 5D12   02C2 0130
        SUBI    #$0050, R2                      ; 5D14   033A 0050
        MVO     R2,     G_0143                  ; 5D16   0242 0143
        MVI     G_0143, R3                      ; 5D18   0283 0143
        SLR     R3,     2                       ; 5D1A   0067
        SLR     R3,     1                       ; 5D1B   0063
        CMPI    #$0008, R3                      ; 5D1C   037B 0008
        BC      L_5D5F                          ; 5D1E   0201 003F

        MVI     G_0144, R1                      ; 5D20   0281 0144
        ANDI    #$03F8, R1                      ; 5D22   03B9 03F8
        CMPI    #$0040, R1                      ; 5D24   0379 0040
        BC      L_5D5F                          ; 5D26   0201 0037

        ADDR    R1,     R3                      ; 5D28   00CB
        MVO     R3,     G_0137                  ; 5D29   0243 0137

        JSR     R5,     L_5D3B                  ; 5D2B   0004 015C 013B

        MVI     G_0144, R1                      ; 5D2E   0281 0144
        ANDI    #$0007, R1                      ; 5D30   03B9 0007
        MVO     R1,     G_0119                  ; 5D32   0241 0119
        MVI     G_0143, R1                      ; 5D34   0281 0143
        ANDI    #$0007, R1                      ; 5D36   03B9 0007
        MVO     R1,     G_0118                  ; 5D38   0241 0118
        PULR    R7                              ; 5D3A   02B7

L_5D3B:
        PSHR    R5                              ; 5D3B   0275
        MVI     G_0137, R3                      ; 5D3C   0283 0137
        SDBD                                    ; 5D3E   0001
        MVII    #$5E83, R4                      ; 5D3F   02BC 0083 005E
        MVI     G_0185, R5                      ; 5D42   0285 0185
        ADDR    R5,     R4                      ; 5D44   00EC
        ADDR    R5,     R4                      ; 5D45   00EC
        SDBD                                    ; 5D46   0001
        ADD@    R4,     R3                      ; 5D47   02E3
        MVI@    R3,     R1                      ; 5D48   0299
        CMPI    #$0003, R5                      ; 5D49   037D 0003
        BEQ     L_5D4F                          ; 5D4B   0204 0002

        SLR     R1,     2                       ; 5D4D   0065
        SLR     R1,     2                       ; 5D4E   0065
L_5D4F:
        MOVR    R1,     R4                      ; 5D4F   008C
        ANDI    #$001F, R1                      ; 5D50   03B9 001F
        MVO     R1,     G_0136                  ; 5D52   0241 0136
        XORR    R4,     R1                      ; 5D54   01E1
        MVI     G_0116, R5                      ; 5D55   0285 0116
        TSTR    R5                              ; 5D57   00AD
        BEQ     L_5D5C                          ; 5D58   0204 0002

        XORI    #$0020, R1                      ; 5D5A   03F9 0020
L_5D5C:
        MVO     R1,     G_0186                  ; 5D5C   0241 0186
        PULR    R7                              ; 5D5E   02B7

L_5D5F:
        CLRR    R3                              ; 5D5F   01DB
        MVO     R3,     G_0136                  ; 5D60   0243 0136
        PULR    R7                              ; 5D62   02B7

L_5D63:
        PSHR    R5                              ; 5D63   0275
        MVII    #$0013, R0                      ; 5D64   02B8 0013
L_5D66:
        MVO     R0,     G_0132                  ; 5D66   0240 0132
        ADD     G_0134, R0                      ; 5D68   02C0 0134
        MVO     R0,     G_0130                  ; 5D6A   0240 0130
        MVII    #$000B, R0                      ; 5D6C   02B8 000B
L_5D6E:
        MVO     R0,     G_0133                  ; 5D6E   0240 0133
        ADD     G_0135, R0                      ; 5D70   02C0 0135
        MVO     R0,     G_0131                  ; 5D72   0240 0131

        JSR     R5,     L_5CDF                  ; 5D74   0004 015C 00DF

        MVI     G_0133, R0                      ; 5D77   0280 0133
        DECR    R0                              ; 5D79   0010
        BPL     L_5D6E                          ; 5D7A   0223 000D

        MVI     G_0132, R0                      ; 5D7C   0280 0132
        DECR    R0                              ; 5D7E   0010
        BPL     L_5D66                          ; 5D7F   0223 001A
        PULR    R7                              ; 5D81   02B7

L_5D82:
        PSHR    R5                              ; 5D82   0275
        MOVR    R3,     R2                      ; 5D83   009A
        ANDI    #$0100, R2                      ; 5D84   03BA 0100
        BNEQ    L_5D9C                          ; 5D86   020C 0014

        ANDI    #$00FF, R3                      ; 5D88   03BB 00FF
        CMPI    #$00B7, R3                      ; 5D8A   037B 00B7
        BC      L_5D97                          ; 5D8C   0201 0009

        CMPI    #$00B4, R3                      ; 5D8E   037B 00B4
        BNC     L_5D97                          ; 5D90   0209 0005

        SLL     R3,     2                       ; 5D92   004F
        SLL     R3,     1                       ; 5D93   004B
        ADDI    #$0005, R3                      ; 5D94   02FB 0005
        PULR    R7                              ; 5D96   02B7

L_5D97:
        SLL     R3,     1                       ; 5D97   004B
        SLL     R3,     2                       ; 5D98   004F
        ADDI    #$0003, R3                      ; 5D99   02FB 0003
        PULR    R7                              ; 5D9B   02B7

L_5D9C:
        MOVR    R3,     R2                      ; 5D9C   009A
        ANDI    #$003F, R3                      ; 5D9D   03BB 003F
        CMPI    #$0032, R3                      ; 5D9F   037B 0032
        BNEQ    L_5DB1                          ; 5DA1   020C 000E

        CMPI    #$0132, R2                      ; 5DA3   037A 0132
        BNEQ    L_5DAC                          ; 5DA5   020C 0005

        SDBD                                    ; 5DA7   0001
        MVII    #$1990, R3                      ; 5DA8   02BB 0090 0019
        PULR    R7                              ; 5DAB   02B7

L_5DAC:
        SDBD                                    ; 5DAC   0001
        MVII    #$1991, R3                      ; 5DAD   02BB 0091 0019
        PULR    R7                              ; 5DB0   02B7

L_5DB1:
        ADDI    #$0100, R3                      ; 5DB1   02FB 0100
        SLL     R3,     1                       ; 5DB3   004B
        SLL     R2,     2                       ; 5DB4   004E
        SWAP    R2,     1                       ; 5DB5   0042
        ANDI    #$0003, R2                      ; 5DB6   03BA 0003
        SLL     R3,     2                       ; 5DB8   004F
        SDBD                                    ; 5DB9   0001
        ADDI    #$6F84, R2                      ; 5DBA   02FA 0084 006F
        MVI@    R2,     R5                      ; 5DBD   0295
        ANDI    #$000F, R5                      ; 5DBE   03BD 000F
        XORR    R5,     R3                      ; 5DC0   01EB
        PULR    R7                              ; 5DC1   02B7

L_5DC2:
        PSHR    R5                              ; 5DC2   0275
        TSTR    R0                              ; 5DC3   0080
        BEQ     L_5DDD                          ; 5DC4   0204 0017

        PSHR    R4                              ; 5DC6   0274
        SDBD                                    ; 5DC7   0001
        MVII    #$0130, R2                      ; 5DC8   02BA 0030 0001
        SDBD                                    ; 5DCB   0001
        MVII    #$0131, R3                      ; 5DCC   02BB 0031 0001
        MVII    #$0003, R4                      ; 5DCF   02BC 0003
L_5DD1:
        MVI@    R2,     R5                      ; 5DD1   0295
        MVI@    R3,     R1                      ; 5DD2   0299
        MVO@    R5,     R3                      ; 5DD3   025D
        MVO@    R1,     R2                      ; 5DD4   0251
        INCR    R2                              ; 5DD5   000A
        INCR    R3                              ; 5DD6   000B
        INCR    R2                              ; 5DD7   000A
        INCR    R3                              ; 5DD8   000B
        DECR    R4                              ; 5DD9   0014
        BNEQ    L_5DD1                          ; 5DDA   022C 000A

        PULR    R4                              ; 5DDC   02B4
L_5DDD:
        PULR    R7                              ; 5DDD   02B7

L_5DDE:
        PSHR    R5                              ; 5DDE   0275
        MOVR    R2,     R0                      ; 5DDF   0090
        SLL     R2,     2                       ; 5DE0   004E
        SLR     R0,     1                       ; 5DE1   0060
        MOVR    R2,     R4                      ; 5DE2   0094
        SDBD                                    ; 5DE3   0001
        ADDI    #$6FF0, R4                      ; 5DE4   02FC 00F0 006F

        JSR     R5,     L_5DC2                  ; 5DE7   0004 015C 01C2

        MVI     G_0134, R2                      ; 5DEA   0282 0134
        MVI@    R4,     R5                      ; 5DEC   02A5
        ANDI    #$001F, R5                      ; 5DED   03BD 001F
        ADDR    R5,     R2                      ; 5DEF   00EA
        DECR    R2                              ; 5DF0   0012
        MVO     R2,     G_0134                  ; 5DF1   0242 0134
        MVI@    R4,     R3                      ; 5DF3   02A3
        ANDI    #$001F, R3                      ; 5DF4   03BB 001F
        MVO     R3,     G_0132                  ; 5DF6   0243 0132
        ADDR    R3,     R2                      ; 5DF8   00DA
        MVO     R2,     G_0130                  ; 5DF9   0242 0130
        MVI     G_0135, R3                      ; 5DFB   0283 0135
        MVO     R3,     G_0131                  ; 5DFD   0243 0131
        CLRR    R3                              ; 5DFF   01DB
        MVO     R3,     G_0133                  ; 5E00   0243 0133

        JSR     R5,     L_5DC2                  ; 5E02   0004 015C 01C2

        MVI@    R4,     R1                      ; 5E05   02A1
        ANDI    #$001F, R1                      ; 5E06   03B9 001F
L_5E08:
        PSHR    R1                              ; 5E08   0271
        PSHR    R0                              ; 5E09   0270

        JSR     R5,     L_5CDF                  ; 5E0A   0004 015C 00DF

        PULR    R0                              ; 5E0D   02B0

        JSR     R5,     L_5DC2                  ; 5E0E   0004 015C 01C2

        MVI     G_0131, R2                      ; 5E11   0282 0131
        INCR    R2                              ; 5E13   000A
        MVO     R2,     G_0131                  ; 5E14   0242 0131
        MVI     G_0133, R2                      ; 5E16   0282 0133
        INCR    R2                              ; 5E18   000A
        MVO     R2,     G_0133                  ; 5E19   0242 0133

        JSR     R5,     L_5DC2                  ; 5E1B   0004 015C 01C2

        PULR    R1                              ; 5E1E   02B1
        DECR    R1                              ; 5E1F   0011
        BNEQ    L_5E08                          ; 5E20   022C 0019
        PULR    R7                              ; 5E22   02B7

L_5E23:
        PSHR    R5                              ; 5E23   0275
        MVI     G_01C7, R2                      ; 5E24   0282 01C7
        MVI     G_01C8, R3                      ; 5E26   0283 01C8
        ADDI    #$0028, R2                      ; 5E28   02FA 0028
        ADDI    #$0027, R3                      ; 5E2A   02FB 0027
        ANDI    #$00FF, R2                      ; 5E2C   03BA 00FF
        ANDI    #$00FF, R3                      ; 5E2E   03BB 00FF
        SUBI    #$0028, R2                      ; 5E30   033A 0028
        SUBI    #$0028, R3                      ; 5E32   033B 0028
        MOVR    R2,     R0                      ; 5E34   0090
        MOVR    R3,     R1                      ; 5E35   0099
        SAR     R0,     2                       ; 5E36   006C
        DECR    R0                              ; 5E37   0010
        SAR     R0,     1                       ; 5E38   0068
        ADD     G_0134, R0                      ; 5E39   02C0 0134
        SAR     R1,     2                       ; 5E3B   006D
        SAR     R1,     1                       ; 5E3C   0069
        ADD     G_0135, R1                      ; 5E3D   02C1 0135
        MVO     R0,     G_0130                  ; 5E3F   0240 0130
        MVO     R1,     G_0131                  ; 5E41   0241 0131

        JSR     R5,     L_5D05                  ; 5E43   0004 015C 0105

        MVI     G_0119, R0                      ; 5E46   0280 0119
        ANDI    #$00FE, R0                      ; 5E48   03B8 00FE
        NEGR    R0                              ; 5E4A   0020
        ADDI    #$0006, R0                      ; 5E4B   02F8 0006
        ADD     G_0118, R0                      ; 5E4D   02C0 0118
        MVO     R0,     G_0138                  ; 5E4F   0240 0138
        MVI     G_0119, R0                      ; 5E51   0280 0119
        INCR    R0                              ; 5E53   0008
        SLR     R0,     1                       ; 5E54   0060
        MVI     G_0118, R1                      ; 5E55   0281 0118
        SLR     R1,     1                       ; 5E57   0061
        ADDR    R1,     R0                      ; 5E58   00C8
        MVO     R0,     G_0139                  ; 5E59   0240 0139
        MVI     G_01C7, R2                      ; 5E5B   0282 01C7
        MVI     G_01C8, R3                      ; 5E5D   0283 01C8
        ADDI    #$0004, R2                      ; 5E5F   02FA 0004
        ADDI    #$0007, R3                      ; 5E61   02FB 0007
        ANDI    #$0007, R2                      ; 5E63   03BA 0007
        ANDI    #$0007, R3                      ; 5E65   03BB 0007
        MVI     G_0138, R0                      ; 5E67   0280 0138
        SLL     R0,     2                       ; 5E69   004C
        SLL     R0,     1                       ; 5E6A   0048
        MVI     G_0139, R1                      ; 5E6B   0281 0139
        SLL     R1,     2                       ; 5E6D   004D
        SLL     R1,     1                       ; 5E6E   0049
        ADDR    R2,     R0                      ; 5E6F   00D0
        ADDR    R3,     R1                      ; 5E70   00D9
        MVO     R0,     G_0138                  ; 5E71   0240 0138
        MVO     R1,     G_0139                  ; 5E73   0241 0139
        MOVR    R1,     R2                      ; 5E75   008A
        SLL     R2,     1                       ; 5E76   004A
        MOVR    R2,     R3                      ; 5E77   0093
        ADDR    R0,     R2                      ; 5E78   00C2
        SUBI    #$0030, R2                      ; 5E79   033A 0030
        SUBR    R0,     R3                      ; 5E7B   0103
        ADDI    #$003F, R3                      ; 5E7C   02FB 003F
        MVO     R2,     G_013A                  ; 5E7E   0242 013A
        MVO     R3,     G_0184                  ; 5E80   0243 0184
        PULR    R7                              ; 5E82   02B7

        SLLC    R0,     1                       ; 5E83   0058
        SAR     R3,     2                       ; 5E84   006F
        COMR    R0                              ; 5E85   0018
        SAR     R3,     2                       ; 5E86   006F
        ADDR    R3,     R0                      ; 5E87   00D8
        SAR     R2,     2                       ; 5E88   006E
        MOVR    R0,     R7                      ; 5E89   0087

        DECLE   $0001                           ; 5E8A   0001
L_5E8B:
        MVII    #$0215, R2                      ; 5E8B   02BA 0215
        MVI@    R5,     R4                      ; 5E8D   02AC
        ADDR    R4,     R4                      ; 5E8E   00E4
        PSHR    R5                              ; 5E8F   0275
        PSHR    R4                              ; 5E90   0274
        MVII    #$00F0, R0                      ; 5E91   02B8 00F0
        MVII    #$0200, R4                      ; 5E93   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5E95   0004 0114 0338

        PULR    R4                              ; 5E98   02B4
        CLRR    R5                              ; 5E99   01ED
        SDBD                                    ; 5E9A   0001
        ADDI    #$5ECA, R4                      ; 5E9B   02FC 00CA 005E
L_5E9E:
        MVII    #$0008, R1                      ; 5E9E   02B9 0008
        CLRR    R0                              ; 5EA0   01C0
L_5EA1:
        SLL     R0,     1                       ; 5EA1   0048
        MVI@    R4,     R3                      ; 5EA2   02A3
        SWAP    R3,     1                       ; 5EA3   0043
        SLR     R3,     1                       ; 5EA4   0063
        ANDI    #$0001, R3                      ; 5EA5   03BB 0001
        ADDR    R3,     R0                      ; 5EA7   00D8
        DECR    R1                              ; 5EA8   0011
        BNEQ    L_5EA1                          ; 5EA9   022C 0009

        TSTR    R5                              ; 5EAB   00AD
        BEQ     L_5EB4                          ; 5EAC   0204 0006

        MVII    #$0220, R2                      ; 5EAE   02BA 0220
        ADDR    R0,     R2                      ; 5EB0   00C2
        CLRR    R5                              ; 5EB1   01ED
        B       L_5E9E                          ; 5EB2   0220 0015

L_5EB4:
        CMPI    #$0060, R0                      ; 5EB4   0378 0060
        BEQ     L_5EC7                          ; 5EB6   0204 000F

        CMPI    #$005F, R0                      ; 5EB8   0378 005F
        BNEQ    L_5EBF                          ; 5EBA   020C 0003

        INCR    R5                              ; 5EBC   000D
        B       L_5E9E                          ; 5EBD   0220 0020

L_5EBF:
        SLL     R0,     2                       ; 5EBF   004C
        SLL     R0,     1                       ; 5EC0   0048
        ADDI    #$0007, R0                      ; 5EC1   02F8 0007
        MVO@    R0,     R2                      ; 5EC3   0250
        INCR    R2                              ; 5EC4   000A
        B       L_5E9E                          ; 5EC5   0220 0028

L_5EC7:
        MVO     R2,     G_0318                  ; 5EC7   0242 0318
        PULR    R7                              ; 5EC9   02B7

        DECLE   $0000,  $0200,  $0000,  $0200   ; 5ECA   0000 0200 0000 0200
        DECLE   $0200,  $0200                   ; 5ECE   0200 0200

        B       L_60D2                          ; 5ED0   0200 0200
        B       L_5ED4                          ; 5ED2   0200 0000

L_5ED4:
        ANDR    R6,     R4                      ; 5ED4   01B4
        DECLE   $0000                           ; 5ED5   0000

        ANDR    R6,     R4                      ; 5ED6   01B4
        B       L_61F1                          ; 5ED7   0200 0318

        DECLE   $0200,  $0000,  $0000           ; 5ED9   0200 0000 0000

        ANDR    R6,     R4                      ; 5EDC   01B4
        AND@    R6,     R4                      ; 5EDD   03B4
        MOVR    R2,     R5                      ; 5EDE   0095
        SUB@    R2,     R5                      ; 5EDF   0315
        SUBR    R2,     R6                      ; 5EE0   0116
        SUB@    R2,     R7                      ; 5EE1   0317

        DECLE   $0000,  $01B4,  $00CB,  $00CB   ; 5EE2   0000 01B4 00CB 00CB
        DECLE   $005F,  $005F,  $005F,  $005F   ; 5EE6   005F 005F 005F 005F
        DECLE   $0000,  $0000,  $031A,  $0094   ; 5EEA   0000 0000 031A 0094
        DECLE   $025F,  $025F,  $025F,  $025F   ; 5EEE   025F 025F 025F 025F
        DECLE   $0000,  $03B4,  $005F,  $005F   ; 5EF2   0000 03B4 005F 005F
        DECLE   $025F,  $025F,  $0111,  $005F   ; 5EF6   025F 025F 0111 005F
        DECLE   $0000,  $0200,  $011C,  $011B   ; 5EFA   0000 0200 011C 011B
        DECLE   $005F,  $025F,  $0110,  $0110   ; 5EFE   005F 025F 0110 0110
        DECLE   $0000,  $031D,  $005F,  $025F   ; 5F02   0000 031D 005F 025F
        DECLE   $025F,  $0312,  $0332,  $0372   ; 5F06   025F 0312 0332 0372
        DECLE   $0000,  $0200,  $0200,  $0200   ; 5F0A   0000 0200 0200 0200
        DECLE   $0000,  $0000,  $0200,  $0200   ; 5F0E   0000 0000 0200 0200
        DECLE   $0079,  $0000,  $01B4,  $0200   ; 5F12   0079 0000 01B4 0200
        DECLE   $0000,  $0200,  $0000,  $0000   ; 5F16   0000 0200 0000 0000
        DECLE   $005F,  $0071,  $007D,  $0105   ; 5F1A   005F 0071 007D 0105
        DECLE   $01B4,  $0000,  $0000,  $0000   ; 5F1E   01B4 0000 0000 0000

        SLLC    R3,     2                       ; 5F22   005F
        SLLC    R3,     2                       ; 5F23   005F
        MVO@    R7,     R3                      ; 5F24   025F
        SUBR    R0,     R6                      ; 5F25   0106
        AND@    R6,     R4                      ; 5F26   03B4
        B       L_6129                          ; 5F27   0200 0200

        DECLE   $0000                           ; 5F29   0000

        SLLC    R3,     2                       ; 5F2A   005F
        MVO@    R7,     R3                      ; 5F2B   025F
        SLLC    R3,     2                       ; 5F2C   005F
        SLLC    R3,     2                       ; 5F2D   005F
        SLLC    R3,     2                       ; 5F2E   005F
        SUB     .STIC.X.0,R7                    ; 5F2F   0307 0000
        B       L_5F92                          ; 5F31   0200 005F

        DECLE   $025F,  $005F,  $025F,  $007F   ; 5F33   025F 005F 025F 007F
        DECLE   $0308,  $0200,  $0200,  $0132   ; 5F37   0308 0200 0200 0132
        DECLE   $030C,  $005F,  $025F,  $025F   ; 5F3B   030C 005F 025F 025F
        DECLE   $025F,  $027B,  $03B4,  $0132   ; 5F3F   025F 027B 03B4 0132
        DECLE   $030E,  $005F,  $025F,  $025F   ; 5F43   030E 005F 025F 025F
        DECLE   $0273,  $0000                   ; 5F47   0273 0000

        B       L_5F4B                          ; 5F49   0200 0000

L_5F4B:
        SUBR    R6,     R2                      ; 5F4B   0132
        MOVR    R3,     R2                      ; 5F4C   009A
        MVO@    R7,     R3                      ; 5F4D   025F
        SLLC    R3,     2                       ; 5F4E   005F
        SLLC    R3,     2                       ; 5F4F   005F
        SUBR    R1,     R1                      ; 5F50   0109
        B       L_6057                          ; 5F51   0200 0104

        DECLE   $0104,  $005F,  $005F,  $030B   ; 5F53   0104 005F 005F 030B
        DECLE   $030A,  $0000,  $0200,  $005F   ; 5F57   030A 0000 0200 005F
        DECLE   $009B,  $005F,  $025F,  $005F   ; 5F5B   009B 005F 025F 005F
        DECLE   $005F,  $03B4,  $0200           ; 5F5F   005F 03B4 0200

        SLLC    R3,     2                       ; 5F62   005F
        SLLC    R3,     2                       ; 5F63   005F
        SLLC    R3,     2                       ; 5F64   005F
        SLLC    R3,     2                       ; 5F65   005F
        SUBR    R3,     R7                      ; 5F66   011F

        DECLE   $0000,  $0000,  $0000           ; 5F67   0000 0000 0000

        SLLC    R3,     2                       ; 5F6A   005F
        SLLC    R3,     2                       ; 5F6B   005F
        MVO@    R7,     R3                      ; 5F6C   025F
        MVO@    R7,     R3                      ; 5F6D   025F
        ADDR    R1,     R0                      ; 5F6E   00C8
        ADDR    R1,     R0                      ; 5F6F   00C8
        AND@    R6,     R4                      ; 5F70   03B4
        B       L_6075                          ; 5F71   0200 0102

        DECLE   $0300,  $0000,  $0320,  $01B4   ; 5F73   0300 0000 0320 01B4
        DECLE   $03B4,  $0000,  $0000,  $0000   ; 5F77   03B4 0000 0000 0000
        DECLE   $0303,  $01B4,  $0000,  $01B4   ; 5F7B   0303 01B4 0000 01B4
        DECLE   $01B4,  $0000,  $0200,  $0000   ; 5F7F   01B4 0000 0200 0000
        DECLE   $0200,  $0000,  $0000,  $0200   ; 5F83   0200 0000 0000 0200
        DECLE   $0200,  $0200,  $0000,  $0000   ; 5F87   0200 0200 0000 0000
        DECLE   $0200,  $0070,  $005F,  $005F   ; 5F8B   0200 0070 005F 005F
        DECLE   $025F,  $011E,  $0000           ; 5F8F   025F 011E 0000
L_5F92:
        ANDR    R6,     R4                      ; 5F92   01B4
        DECLE   $0278,  $005F,  $005F,  $005F   ; 5F93   0278 005F 005F 005F
        DECLE   $005F,  $0119,  $0372,  $0000   ; 5F97   005F 0119 0372 0000
        DECLE   $03B4,  $0114,  $027C,  $005F   ; 5F9B   03B4 0114 027C 005F
        DECLE   $005F,  $025F,  $005F,  $0000   ; 5F9F   005F 025F 005F 0000
        DECLE   $0200,  $0113,  $005F,  $005F   ; 5FA3   0200 0113 005F 005F
        DECLE   $025F,  $005F,  $005F,  $0000   ; 5FA7   025F 005F 005F 0000

        B       L_5FAD                          ; 5FAB   0200 0000

L_5FAD:
        AND@    R6,     R4                      ; 5FAD   03B4
        SUB@    R1,     R7                      ; 5FAE   030F

        DECLE   $025F,  $025F,  $025F,  $0000   ; 5FAF   025F 025F 025F 0000
        DECLE   $0000,  $0200,  $03B4,  $010D   ; 5FB3   0000 0200 03B4 010D
        DECLE   $027E,  $0272,  $005F,  $0000   ; 5FB7   027E 0272 005F 0000
        DECLE   $0000,  $0200,  $0000,  $0000   ; 5FBB   0000 0200 0000 0000
        DECLE   $0000,  $03B4,  $027A,  $0000   ; 5FBF   0000 03B4 027A 0000
        DECLE   $0200,  $0000,  $0000,  $0200   ; 5FC3   0200 0000 0000 0200
        DECLE   $0200,  $0200,  $0200,  $0000   ; 5FC7   0200 0200 0200 0000

        SUB@    R6,     R2                      ; 5FCB   0332
        CMPR    R6,     R2                      ; 5FCC   0172
        B       L_5FCF                          ; 5FCD   0200 0000
L_5FCF:
        B       L_6103                          ; 5FCF   0200 0132
        B       L_6040                          ; 5FD1   0200 006D

        CMP@    R6,     R2                      ; 5FD3   0372
        SAR     R1,     2                       ; 5FD4   006D
        B       L_6044                          ; 5FD5   0200 006D

        DECLE   $0000,  $026D,  $0172,  $005F   ; 5FD7   0000 026D 0172 005F
        DECLE   $0271,  $005F,  $0271,  $005F   ; 5FDB   0271 005F 0271 005F
        DECLE   $0071,  $025F,  $0271,  $005F   ; 5FDF   0071 025F 0271 005F
        DECLE   $025F,  $005F,  $005F,  $005F   ; 5FE3   025F 005F 005F 005F
        DECLE   $025F,  $005F,  $025F,  $005F   ; 5FE7   025F 005F 025F 005F
        DECLE   $005F,  $005F,  $005F,  $005F   ; 5FEB   005F 005F 005F 005F
        DECLE   $005F,  $005F,  $005F,  $0072   ; 5FEF   005F 005F 005F 0072
        DECLE   $005F,  $0072,  $005F,  $0072   ; 5FF3   005F 0072 005F 0072
        DECLE   $005F,  $0272,  $025F,  $0172   ; 5FF7   005F 0272 025F 0172
        DECLE   $026E,  $0332,  $006E,  $0000   ; 5FFB   026E 0332 006E 0000
        DECLE   $006E,  $0172,  $006E,  $0000   ; 5FFF   006E 0172 006E 0000
        DECLE   $0332,  $0132,  $0200,  $0200   ; 6003   0332 0132 0200 0200
        DECLE   $0332,  $0200                   ; 6007   0332 0200

        CMP@    R6,     R2                      ; 6009   0372
        SUBR    R6,     R2                      ; 600A   0132
        B       L_607D                          ; 600B   0200 0070

        DECLE   $025F,  $025F,  $025F,  $026F   ; 600D   025F 025F 025F 026F
        DECLE   $0172,  $0000                   ; 6011   0172 0000

        SAR     R0,     2                       ; 6013   006C
        SLLC    R3,     2                       ; 6014   005F
        SLLC    R3,     2                       ; 6015   005F
        SLLC    R3,     2                       ; 6016   005F
        RRC     R3,     1                       ; 6017   0073
        B       L_621A                          ; 6018   0200 0200

        DECLE   $0000                           ; 601A   0000

        SUBR    R6,     R2                      ; 601B   0132
        RRC     R0,     1                       ; 601C   0070
        SLLC    R3,     2                       ; 601D   005F
        SLLC    R3,     2                       ; 601E   005F
        SLLC    R3,     2                       ; 601F   005F
        SAR     R3,     2                       ; 6020   006F
        CMPR    R6,     R2                      ; 6021   0172
        CMPR    R6,     R2                      ; 6022   0172
        MVO@    R4,     R5                      ; 6023   026C
        SLLC    R3,     2                       ; 6024   005F
        SLLC    R3,     2                       ; 6025   005F
        MVO@    R7,     R3                      ; 6026   025F
        PSHR    R3                              ; 6027   0273
        B       L_622A                          ; 6028   0200 0200

        DECLE   $0000,  $0200,  $0070,  $005F   ; 602A   0000 0200 0070 005F
        DECLE   $005F,  $025F,  $026F,  $0172   ; 602E   005F 025F 026F 0172
        DECLE   $0000                           ; 6032   0000

        SAR     R0,     2                       ; 6033   006C
        SLLC    R3,     2                       ; 6034   005F
        SLLC    R3,     2                       ; 6035   005F
        SLLC    R3,     2                       ; 6036   005F
        RRC     R3,     1                       ; 6037   0073
        SUBR    R6,     R2                      ; 6038   0132
        CMPR    R6,     R2                      ; 6039   0172
        SUBR    R6,     R2                      ; 603A   0132
        SUBR    R6,     R2                      ; 603B   0132
        PSHR    R0                              ; 603C   0270
        SLLC    R3,     2                       ; 603D   005F
        MVO@    R7,     R3                      ; 603E   025F
        MVO@    R7,     R3                      ; 603F   025F
L_6040:
        SAR     R3,     2                       ; 6040   006F
        SUBR    R6,     R2                      ; 6041   0132
        CMPR    R6,     R2                      ; 6042   0172
        MVO@    R4,     R5                      ; 6043   026C
L_6044:
        SLLC    R3,     2                       ; 6044   005F
        SLLC    R3,     2                       ; 6045   005F
        SLLC    R3,     2                       ; 6046   005F
        RRC     R3,     1                       ; 6047   0073
        SUBR    R6,     R2                      ; 6048   0132
        B       L_617D                          ; 6049   0200 0132
        B       L_60BA                          ; 604B   0200 006D

        PULR    R5                              ; 604D   02B5
        XORR    R6,     R0                      ; 604E   01F0
        ANDR    R6,     R4                      ; 604F   01B4
        ANDR    R6,     R4                      ; 6050   01B4
        ANDR    R6,     R4                      ; 6051   01B4
        SAR     R1,     2                       ; 6052   006D
        MVO@    R4,     R5                      ; 6053   026C
        SUBR    R4,     R4                      ; 6054   0124
        SUB@    R5,     R0                      ; 6055   0328
        SAR     R1,     2                       ; 6056   006D
L_6057:
        SUBR    R6,     R2                      ; 6057   0132
        MVO@    R5,     R5                      ; 6058   026D
        CMP@    R6,     R2                      ; 6059   0372
        SLLC    R3,     2                       ; 605A   005F
        PSHR    R1                              ; 605B   0271
        MVO@    R7,     R3                      ; 605C   025F
        SUBR    R4,     R3                      ; 605D   0123
        SLLC    R3,     2                       ; 605E   005F
        SUBR    R5,     R1                      ; 605F   0129
        SLLC    R3,     2                       ; 6060   005F
        RRC     R1,     1                       ; 6061   0071
        SLLC    R3,     2                       ; 6062   005F
        SUB@    R4,     R3                      ; 6063   0323
        SUBR    R4,     R4                      ; 6064   0124
        MVO@    R7,     R3                      ; 6065   025F
        SUB@    R4,     R4                      ; 6066   0324
        MVO@    R7,     R3                      ; 6067   025F
        MVO@    R7,     R3                      ; 6068   025F
        MVO@    R7,     R3                      ; 6069   025F
        MVO@    R7,     R3                      ; 606A   025F
        SLLC    R3,     2                       ; 606B   005F
        RRC     R2,     1                       ; 606C   0072
        SUB@    R4,     R3                      ; 606D   0323
        SLLC    R3,     2                       ; 606E   005F
        SUB@    R4,     R3                      ; 606F   0323
        MVO@    R7,     R3                      ; 6070   025F
        SLLC    R3,     2                       ; 6071   005F
        RRC     R2,     1                       ; 6072   0072
        RRC     R3,     1                       ; 6073   0073
        CMPR    R6,     R3                      ; 6074   0173
L_6075:
        SUB@    R4,     R7                      ; 6075   0327

        RRC     R2,     1                       ; 6076   0072
        MVO@    R7,     R3                      ; 6077   025F
        RRC     R2,     1                       ; 6078   0072
        MVO@    R7,     R3                      ; 6079   025F
        SUBR    R6,     R2                      ; 607A   0132
        SAR     R2,     2                       ; 607B   006E
        ANDR    R6,     R4                      ; 607C   01B4
L_607D:
        XORR    R5,     R3                      ; 607D   01EB
        DECLE   $03ED,  $0325,  $01B4,  $026E   ; 607E   03ED 0325 01B4 026E
        DECLE   $0000,  $01B4,  $0000,  $03ED   ; 6082   0000 01B4 0000 03ED
        DECLE   $0000,  $0172,  $03B4,  $0172   ; 6086   0000 0172 03B4 0172
        DECLE   $0000,  $0000,  $0172,  $0172   ; 608A   0000 0000 0172 0172
        DECLE   $0132,  $0000,  $0000,  $0000   ; 608E   0132 0000 0000 0000
        DECLE   $006D,  $0132,  $026D,  $0132   ; 6092   006D 0132 026D 0132
        DECLE   $006D,  $0372,  $006D,  $0000   ; 6096   006D 0372 006D 0000

        SLLC    R3,     2                       ; 609A   005F
        PSHR    R1                              ; 609B   0271
        SLLC    R3,     2                       ; 609C   005F
        RRC     R1,     1                       ; 609D   0071
        SUBR    R4,     R4                      ; 609E   0124
        PSHR    R1                              ; 609F   0271
        SLLC    R3,     2                       ; 60A0   005F
        PSHR    R1                              ; 60A1   0271
        SLLC    R3,     2                       ; 60A2   005F
        MVO@    R7,     R3                      ; 60A3   025F
        SLLC    R3,     2                       ; 60A4   005F
        SUBR    R4,     R3                      ; 60A5   0123
        MVO@    R7,     R3                      ; 60A6   025F
        MVO@    R7,     R3                      ; 60A7   025F
        SLLC    R3,     2                       ; 60A8   005F
        MVO@    R7,     R3                      ; 60A9   025F
        SLLC    R3,     2                       ; 60AA   005F
        MVO@    R7,     R3                      ; 60AB   025F
        SLLC    R3,     2                       ; 60AC   005F
        SLLC    R3,     2                       ; 60AD   005F
        SUB@    R4,     R4                      ; 60AE   0324
        MVO@    R7,     R3                      ; 60AF   025F
        MVO@    R7,     R3                      ; 60B0   025F
        MVO@    R7,     R3                      ; 60B1   025F
        RRC     R2,     1                       ; 60B2   0072
        MVO@    R7,     R3                      ; 60B3   025F
        RRC     R2,     1                       ; 60B4   0072
        SUB@    R4,     R3                      ; 60B5   0323
        RRC     R2,     1                       ; 60B6   0072
        SLLC    R3,     2                       ; 60B7   005F
        PSHR    R2                              ; 60B8   0272
        MVO@    R7,     R3                      ; 60B9   025F
L_60BA:
        CMPR    R6,     R2                      ; 60BA   0172
        DECLE   $026E,  $0000,  $026E,  $0372   ; 60BB   026E 0000 026E 0372
        DECLE   $026E,  $0200,  $026E,  $0332   ; 60BF   026E 0200 026E 0332
        DECLE   $0132,  $0000,  $0132,  $0172   ; 60C3   0132 0000 0132 0172
        DECLE   $0000,  $0200,  $0132,  $0172   ; 60C7   0000 0200 0132 0172
        DECLE   $0000,  $0000,  $0200,  $0000   ; 60CB   0000 0000 0200 0000
        DECLE   $0200,  $0000,  $0000           ; 60CF   0200 0000 0000
L_60D2:
        CMPR    R6,     R2                      ; 60D2   0172
        DECLE   $0000                           ; 60D3   0000

        SUBR    R6,     R2                      ; 60D4   0132
        SUBR    R6,     R2                      ; 60D5   0132
        B       L_62D8                          ; 60D6   0200 0200

        DECLE   $0000,  $0200,  $006D,  $0132   ; 60D8   0000 0200 006D 0132
        DECLE   $006D,  $0200,  $006D,  $0172   ; 60DC   006D 0200 006D 0172
        DECLE   $006D,  $0372,  $005F,  $0071   ; 60E0   006D 0372 005F 0071
        DECLE   $005F,  $0071,  $005F,  $0071   ; 60E4   005F 0071 005F 0071
        DECLE   $005F,  $0071,  $005F,  $005F   ; 60E8   005F 0071 005F 005F
        DECLE   $025F,  $005F,  $005F,  $025F   ; 60EC   025F 005F 005F 025F
        DECLE   $005F,  $005F,  $005F,  $025F   ; 60F0   005F 005F 005F 025F
        DECLE   $005F,  $005F,  $005F,  $025F   ; 60F4   005F 005F 005F 025F
        DECLE   $005F,  $025F,  $0072,  $025F   ; 60F8   005F 025F 0072 025F
        DECLE   $0072,  $005F,  $0272,  $025F   ; 60FC   0072 005F 0272 025F
        DECLE   $0072,  $025F,  $0000           ; 6100   0072 025F 0000
L_6103:
        MVO@    R6,     R5                      ; 6103   026E
        CMPR    R6,     R2                      ; 6104   0172
        SAR     R2,     2                       ; 6105   006E
        SUB@    R6,     R2                      ; 6106   0332
        MVO@    R6,     R5                      ; 6107   026E
        SUB@    R6,     R2                      ; 6108   0332
        MVO@    R6,     R5                      ; 6109   026E
        SAR     R1,     2                       ; 610A   006D
        CMP@    R6,     R2                      ; 610B   0372
        SAR     R1,     2                       ; 610C   006D
        SUB@    R6,     R2                      ; 610D   0332
        MVO@    R5,     R5                      ; 610E   026D
        SUB@    R6,     R2                      ; 610F   0332
        MVO@    R5,     R5                      ; 6110   026D
        SUB@    R6,     R2                      ; 6111   0332
        SLLC    R3,     2                       ; 6112   005F
        PSHR    R1                              ; 6113   0271
        MVO@    R7,     R3                      ; 6114   025F
        RRC     R1,     1                       ; 6115   0071
        MVO@    R7,     R3                      ; 6116   025F
        PSHR    R1                              ; 6117   0271
        MVO@    R7,     R3                      ; 6118   025F
        RRC     R1,     1                       ; 6119   0071
        SLLC    R3,     2                       ; 611A   005F
        SLLC    R3,     2                       ; 611B   005F
        SLLC    R3,     2                       ; 611C   005F
        MVO@    R7,     R3                      ; 611D   025F
        SLLC    R3,     2                       ; 611E   005F
        SLLC    R3,     2                       ; 611F   005F
        MVO@    R7,     R3                      ; 6120   025F
        MVO@    R7,     R3                      ; 6121   025F
        SLLC    R3,     2                       ; 6122   005F
        SLLC    R3,     2                       ; 6123   005F
        SLLC    R3,     2                       ; 6124   005F
        SLLC    R3,     2                       ; 6125   005F
        MVO@    R7,     R3                      ; 6126   025F
        MVO@    R7,     R3                      ; 6127   025F
        SLLC    R3,     2                       ; 6128   005F
L_6129:
        MVO@    R7,     R3                      ; 6129   025F
        DECLE   $0072,  $005F,  $0272,  $025F   ; 612A   0072 005F 0272 025F
        DECLE   $0072,  $005F,  $0072,  $005F   ; 612E   0072 005F 0072 005F
        DECLE   $0132,  $026E,  $0000           ; 6132   0132 026E 0000

        SAR     R2,     2                       ; 6135   006E
L_6136:
        SUB@    R6,     R2                      ; 6136   0332
        DECLE   $026E,  $0172,  $006E,  $0000   ; 6137   026E 0172 006E 0000
        DECLE   $0200,  $0172,  $0172,  $0000   ; 613B   0200 0172 0172 0000
        DECLE   $0132,  $0000,  $0200,  $0000   ; 613F   0132 0000 0200 0000
        DECLE   $0200,  $0000,  $0200,  $0200   ; 6143   0200 0000 0200 0200
        DECLE   $0000,  $0000,  $0372,  $0000   ; 6147   0000 0000 0372 0000

        B       L_61BA                          ; 614B   0200 006D

        MOVR    R6,     R5                      ; 614D   00B5
        XORR    R6,     R0                      ; 614E   01F0
        B       L_62C3                          ; 614F   0200 0172

        DECLE   $0372,  $0132,  $026C,  $0124   ; 6151   0372 0132 026C 0124
        DECLE   $0328,  $012A,  $01EF           ; 6155   0328 012A 01EF

        AND@    R6,     R4                      ; 6158   03B4
        ANDR    R6,     R4                      ; 6159   01B4
        SAR     R1,     2                       ; 615A   006D
        ANDR    R6,     R4                      ; 615B   01B4
        RRC     R0,     1                       ; 615C   0070
        SUBR    R4,     R3                      ; 615D   0123
        SLLC    R3,     2                       ; 615E   005F
        SUBR    R5,     R1                      ; 615F   0129
        SUBR    R4,     R1                      ; 6160   0121
        XORR    R6,     R1                      ; 6161   01F1
        SLLC    R3,     2                       ; 6162   005F
        PSHR    R1                              ; 6163   0271
        SUBR    R4,     R4                      ; 6164   0124
        MVO@    R7,     R3                      ; 6165   025F
        SLLC    R3,     2                       ; 6166   005F
        MVO@    R7,     R3                      ; 6167   025F
        SUB@    R4,     R4                      ; 6168   0324
        RRC     R1,     1                       ; 6169   0071
        SLLC    R3,     2                       ; 616A   005F
        MVO@    R7,     R3                      ; 616B   025F
        RRC     R2,     1                       ; 616C   0072
        SUB@    R4,     R3                      ; 616D   0323
        SLLC    R3,     2                       ; 616E   005F
        SLLC    R3,     2                       ; 616F   005F
        MVO@    R7,     R3                      ; 6170   025F
        SUB@    R4,     R3                      ; 6171   0323
        SLLC    R3,     2                       ; 6172   005F
        RRC     R3,     1                       ; 6173   0073
        CMPR    R6,     R3                      ; 6174   0173
        SUBR    R4,     R7                      ; 6175   0127

        SUBR    R4,     R6                      ; 6176   0126
        SLLC    R3,     2                       ; 6177   005F
        SUBR    R4,     R4                      ; 6178   0124
        SLLC    R3,     2                       ; 6179   005F
        RRC     R2,     1                       ; 617A   0072
        SLLC    R3,     2                       ; 617B   005F
        MVO@    R7,     R5                      ; 617C   026F
L_617D:
        XORR    R5,     R3                      ; 617D   01EB
        DECLE   $01EE,  $0125,  $0322,  $0323   ; 617E   01EE 0125 0322 0323
        DECLE   $0132,  $026E,  $01F5,  $01EB   ; 6182   0132 026E 01F5 01EB
        DECLE   $03ED,  $03EC,  $03B4,  $026E   ; 6186   03ED 03EC 03B4 026E
        DECLE   $0000,  $0200                   ; 618A   0000 0200

        SAR     R1,     2                       ; 618C   006D
        TSTR    R6                              ; 618D   00B6
        MVO@    R5,     R5                      ; 618E   026D
        SUB@    R6,     R2                      ; 618F   0332
        SAR     R1,     2                       ; 6190   006D
        SUB@    R6,     R2                      ; 6191   0332
        MOVR    R6,     R4                      ; 6192   00B4
        MVO@    R4,     R5                      ; 6193   026C
        SLLC    R3,     2                       ; 6194   005F
        PSHR    R1                              ; 6195   0271
        SLLC    R3,     2                       ; 6196   005F
        RRC     R1,     1                       ; 6197   0071
        SLLC    R3,     2                       ; 6198   005F
        RRC     R1,     1                       ; 6199   0071
        SAR     R1,     2                       ; 619A   006D
        AND@    R6,     R4                      ; 619B   03B4
        RRC     R0,     1                       ; 619C   0070
        MVO@    R7,     R3                      ; 619D   025F
        MVO@    R7,     R3                      ; 619E   025F
        MVO@    R7,     R3                      ; 619F   025F
        MVO@    R7,     R3                      ; 61A0   025F
        MVO@    R7,     R3                      ; 61A1   025F
        SLLC    R3,     2                       ; 61A2   005F
        PSHR    R1                              ; 61A3   0271
        SLLC    R3,     2                       ; 61A4   005F
        MVO@    R7,     R3                      ; 61A5   025F
        MVO@    R7,     R3                      ; 61A6   025F
        SLLC    R3,     2                       ; 61A7   005F
        MVO@    R7,     R3                      ; 61A8   025F
        SLLC    R3,     2                       ; 61A9   005F
        SLLC    R3,     2                       ; 61AA   005F
        SLLC    R3,     2                       ; 61AB   005F
        RRC     R2,     1                       ; 61AC   0072
        MVO@    R7,     R3                      ; 61AD   025F
        RRC     R2,     1                       ; 61AE   0072
        SLLC    R3,     2                       ; 61AF   005F
        PSHR    R2                              ; 61B0   0272
        SLLC    R3,     2                       ; 61B1   005F
        SLLC    R3,     2                       ; 61B2   005F
        RRC     R3,     1                       ; 61B3   0073
        CMPR    R6,     R3                      ; 61B4   0173
        SAR     R2,     2                       ; 61B5   006E
        AND@    R6,     R4                      ; 61B6   03B4
        MVO@    R6,     R5                      ; 61B7   026E
        CMPR    R6,     R2                      ; 61B8   0172
        MVO@    R6,     R5                      ; 61B9   026E
L_61BA:
        RRC     R2,     1                       ; 61BA   0072
        DECLE   $005F,  $006F,  $02B6,  $0172   ; 61BB   005F 006F 02B6 0172
        DECLE   $01B4,  $03B4,  $0000,  $00B4   ; 61BF   01B4 03B4 0000 00B4
        DECLE   $006E,  $00B6,  $0132,  $0000   ; 61C3   006E 00B6 0132 0000
        DECLE   $0000,  $0000,  $0000,  $006D   ; 61C7   0000 0000 0000 006D
        DECLE   $01B4,  $026D,  $02B4,  $0000   ; 61CB   01B4 026D 02B4 0000
        DECLE   $0000,  $00B4,  $0000           ; 61CF   0000 00B4 0000

        SLLC    R3,     2                       ; 61D2   005F
        PSHR    R1                              ; 61D3   0271
        SUBR    R4,     R4                      ; 61D4   0124
        SUBR    R5,     R0                      ; 61D5   0128
        SUB@    R5,     R2                      ; 61D6   032A
        B       L_634B                          ; 61D7   0200 0172

        SUBR    R6,     R2                      ; 61D9   0132
        SLLC    R3,     2                       ; 61DA   005F
        MVO@    R7,     R3                      ; 61DB   025F
        SLLC    R3,     2                       ; 61DC   005F
        SUBR    R4,     R3                      ; 61DD   0123
        SLLC    R3,     2                       ; 61DE   005F
        SUBR    R5,     R1                      ; 61DF   0129
        SUBR    R4,     R1                      ; 61E0   0121
        PULR    R4                              ; 61E1   02B4
        SLLC    R3,     2                       ; 61E2   005F
        MVO@    R7,     R3                      ; 61E3   025F
        SUBR    R4,     R4                      ; 61E4   0124
        MVO@    R7,     R3                      ; 61E5   025F
        MVO@    R7,     R3                      ; 61E6   025F
        SLLC    R3,     2                       ; 61E7   005F
        SUBR    R4,     R4                      ; 61E8   0124
        PSHR    R1                              ; 61E9   0271
        RRC     R2,     1                       ; 61EA   0072
        MVO@    R7,     R3                      ; 61EB   025F
        RRC     R2,     1                       ; 61EC   0072
        SUBR    R4,     R3                      ; 61ED   0123
        SLLC    R3,     2                       ; 61EE   005F
        MVO@    R7,     R3                      ; 61EF   025F
        SLLC    R3,     2                       ; 61F0   005F
L_61F1:
        SUB@    R4,     R3                      ; 61F1   0323
        ANDR    R6,     R4                      ; 61F2   01B4
        MVO@    R6,     R5                      ; 61F3   026E
        CMPR    R6,     R3                      ; 61F4   0173
        SUB@    R4,     R7                      ; 61F5   0327

        DECLE   $0126,  $005F,  $0324,  $005F   ; 61F6   0126 005F 0324 005F
        DECLE   $0000,  $0372,  $0132,  $02B4   ; 61FA   0000 0372 0132 02B4
        DECLE   $0000,  $0125,  $0322,  $0323   ; 61FE   0000 0125 0322 0323
        DECLE   $0000                           ; 6202   0000

        B       L_62B9                          ; 6203   0200 00B4
        B       L_6407                          ; 6205   0200 0200

        DECLE   $0200,  $02B5,  $026E,  $0172   ; 6207   0200 02B5 026E 0172
        DECLE   $0332,  $0172,  $0000,  $0173   ; 620B   0332 0172 0000 0173
        DECLE   $02B6,  $02B4,  $00B4,  $006D   ; 620F   02B6 02B4 00B4 006D
        DECLE   $0132,  $006D,  $03B4,  $012A   ; 6213   0132 006D 03B4 012A
        DECLE   $0000                           ; 6217   0000

        ANDR    R6,     R4                      ; 6218   01B4
        AND@    R6,     R4                      ; 6219   03B4
L_621A:
        SLLC    R3,     2                       ; 621A   005F
        RRC     R1,     1                       ; 621B   0071
        SLLC    R3,     2                       ; 621C   005F
        RRC     R1,     1                       ; 621D   0071
        MVO@    R7,     R3                      ; 621E   025F
        PSHR    R1                              ; 621F   0271
        SUBR    R4,     R1                      ; 6220   0121
        PULR    R4                              ; 6221   02B4
        SLLC    R3,     2                       ; 6222   005F
        SLLC    R3,     2                       ; 6223   005F
        SLLC    R3,     2                       ; 6224   005F
        MVO@    R7,     R3                      ; 6225   025F
        SUBR    R4,     R4                      ; 6226   0124
        SLLC    R3,     2                       ; 6227   005F
        SUBR    R4,     R4                      ; 6228   0124
        PSHR    R1                              ; 6229   0271
L_622A:
        SLLC    R3,     2                       ; 622A   005F
        DECLE   $005F,  $005F,  $005F,  $005F   ; 622B   005F 005F 005F 005F
        DECLE   $0123,  $005F,  $0123,  $0072   ; 622F   0123 005F 0123 0072
        DECLE   $005F,  $0272,  $025F,  $0126   ; 6233   005F 0272 025F 0126
        DECLE   $005F,  $0124,  $005F,  $0172   ; 6237   005F 0124 005F 0172
        DECLE   $026E,  $0000                   ; 623B   026E 0000

        SAR     R2,     2                       ; 623D   006E
        SUB@    R6,     R2                      ; 623E   0332
        MVO@    R6,     R5                      ; 623F   026E
        SUBR    R4,     R2                      ; 6240   0122
        SUBR    R4,     R3                      ; 6241   0123
        CMPR    R6,     R2                      ; 6242   0172
        SUB@    R6,     R2                      ; 6243   0332
        ANDR    R6,     R4                      ; 6244   01B4
        ANDR    R6,     R4                      ; 6245   01B4
        TSTR    R6                              ; 6246   00B6
        TSTR    R6                              ; 6247   00B6
        MOVR    R6,     R5                      ; 6248   00B5
        MVO@    R6,     R5                      ; 6249   026E
        SAR     R1,     2                       ; 624A   006D
        AND@    R6,     R4                      ; 624B   03B4
        SAR     R1,     2                       ; 624C   006D
        CMP@    R6,     R3                      ; 624D   0373
        PULR    R4                              ; 624E   02B4
        TSTR    R6                              ; 624F   00B6
        CMPR    R6,     R2                      ; 6250   0172
        B       L_62B2                          ; 6251   0200 005F

        PSHR    R1                              ; 6253   0271
        SUBR    R4,     R4                      ; 6254   0124
        SUBR    R5,     R0                      ; 6255   0128
        SAR     R1,     2                       ; 6256   006D
        SUB@    R6,     R2                      ; 6257   0332
        SAR     R1,     2                       ; 6258   006D
        AND@    R6,     R4                      ; 6259   03B4
        SLLC    R3,     2                       ; 625A   005F
        MVO@    R7,     R3                      ; 625B   025F
        SLLC    R3,     2                       ; 625C   005F
        SUB@    R4,     R3                      ; 625D   0323
        SLLC    R3,     2                       ; 625E   005F
        SUBR    R5,     R1                      ; 625F   0129
        MVO@    R7,     R3                      ; 6260   025F
        RRC     R1,     1                       ; 6261   0071
        SLLC    R3,     2                       ; 6262   005F
        MVO@    R7,     R3                      ; 6263   025F
        SUBR    R4,     R4                      ; 6264   0124
        MVO@    R7,     R3                      ; 6265   025F
        SUB@    R4,     R4                      ; 6266   0324
        MVO@    R7,     R3                      ; 6267   025F
        MVO@    R7,     R3                      ; 6268   025F
        MVO@    R7,     R3                      ; 6269   025F
        RRC     R2,     1                       ; 626A   0072
        SLLC    R3,     2                       ; 626B   005F
        PSHR    R2                              ; 626C   0272
        SUBR    R4,     R3                      ; 626D   0123
        SLLC    R3,     2                       ; 626E   005F
        SUBR    R4,     R3                      ; 626F   0123
        SLLC    R3,     2                       ; 6270   005F
        MVO@    R7,     R3                      ; 6271   025F
        ANDR    R6,     R4                      ; 6272   01B4
        SAR     R2,     2                       ; 6273   006E
        PULR    R6                              ; 6274   02B6
        SUB@    R4,     R7                      ; 6275   0327

        DECLE   $0072,  $005F,  $0072,  $005F   ; 6276   0072 005F 0072 005F
        DECLE   $0000,  $0372,  $0000,  $00B6   ; 627A   0000 0372 0000 00B6
        DECLE   $0200,  $0325,  $01B4,  $006E   ; 627E   0200 0325 01B4 006E
        DECLE   $0000,  $0332,  $00B4,  $0000   ; 6282   0000 0332 00B4 0000
        DECLE   $0000                           ; 6286   0000

        TSTR    R6                              ; 6287   00B6
        ANDR    R6,     R4                      ; 6288   01B4
        CMP@    R6,     R2                      ; 6289   0372
        ANDR    R6,     R4                      ; 628A   01B4
        B       L_62FA                          ; 628B   0200 006D

        PULR    R6                              ; 628D   02B6
        MVO@    R5,     R5                      ; 628E   026D
        SUBR    R6,     R2                      ; 628F   0132
        SAR     R1,     2                       ; 6290   006D
        SUB@    R6,     R2                      ; 6291   0332
        SAR     R1,     2                       ; 6292   006D
        SAR     R0,     2                       ; 6293   006C
        SLLC    R3,     2                       ; 6294   005F
        RRC     R1,     1                       ; 6295   0071
        SLLC    R3,     2                       ; 6296   005F
        RRC     R1,     1                       ; 6297   0071
        SLLC    R3,     2                       ; 6298   005F
        RRC     R1,     1                       ; 6299   0071
        SLLC    R3,     2                       ; 629A   005F
        RRC     R1,     1                       ; 629B   0071
        MVO@    R7,     R3                      ; 629C   025F
        SLLC    R3,     2                       ; 629D   005F
        MVO@    R7,     R3                      ; 629E   025F
        MVO@    R7,     R3                      ; 629F   025F
        MVO@    R7,     R3                      ; 62A0   025F
        MVO@    R7,     R3                      ; 62A1   025F
        SLLC    R3,     2                       ; 62A2   005F
        SUB@    R4,     R3                      ; 62A3   0323
        SLLC    R3,     2                       ; 62A4   005F
        MVO@    R7,     R3                      ; 62A5   025F
        SLLC    R3,     2                       ; 62A6   005F
        SLLC    R3,     2                       ; 62A7   005F
        SLLC    R3,     2                       ; 62A8   005F
        SLLC    R3,     2                       ; 62A9   005F
        SLLC    R3,     2                       ; 62AA   005F
        MVO@    R7,     R3                      ; 62AB   025F
        RRC     R2,     1                       ; 62AC   0072
        MVO@    R7,     R3                      ; 62AD   025F
        RRC     R2,     1                       ; 62AE   0072
        MVO@    R7,     R3                      ; 62AF   025F
        RRC     R2,     1                       ; 62B0   0072
        SLLC    R3,     2                       ; 62B1   005F
L_62B2:
        RRC     R2,     1                       ; 62B2   0072
        DECLE   $0273,  $0173,  $006E,  $03B4   ; 62B3   0273 0173 006E 03B4
        DECLE   $006E,  $0000                   ; 62B7   006E 0000
L_62B9:
        MVO@    R6,     R5                      ; 62B9   026E
        ANDR    R6,     R4                      ; 62BA   01B4
        MVO@    R6,     R5                      ; 62BB   026E
        TSTR    R6                              ; 62BC   00B6
        TSTR    R6                              ; 62BD   00B6
        CMP@    R6,     R2                      ; 62BE   0372
        SUB@    R6,     R2                      ; 62BF   0332
        AND@    R6,     R4                      ; 62C0   03B4
        CMP@    R6,     R2                      ; 62C1   0372
        CMPR    R6,     R2                      ; 62C2   0172
L_62C3:
        PULR    R4                              ; 62C3   02B4
        DECLE   $00B6,  $0000,  $0200,  $03B4   ; 62C4   00B6 0000 0200 03B4
        DECLE   $0200,  $0000,  $0000,  $0200   ; 62C8   0200 0000 0000 0200
        DECLE   $0373,  $00B6,  $0172,  $0000   ; 62CC   0373 00B6 0172 0000
        DECLE   $0000,  $0000                   ; 62D0   0000 0000

        ANDR    R6,     R4                      ; 62D2   01B4
        PULR    R4                              ; 62D3   02B4
        SAR     R1,     2                       ; 62D4   006D
        AND@    R6,     R4                      ; 62D5   03B4
        MVO@    R5,     R5                      ; 62D6   026D
        CMP@    R6,     R2                      ; 62D7   0372
L_62D8:
        MVO@    R5,     R5                      ; 62D8   026D
        DECLE   $0200,  $006D                   ; 62D9   0200 006D

        CMPR    R6,     R2                      ; 62DB   0172
        PSHR    R0                              ; 62DC   0270
        PSHR    R1                              ; 62DD   0271
        SLLC    R3,     2                       ; 62DE   005F
        PSHR    R1                              ; 62DF   0271
        MVO@    R7,     R3                      ; 62E0   025F
        PSHR    R1                              ; 62E1   0271
        SLLC    R3,     2                       ; 62E2   005F
        RRC     R1,     1                       ; 62E3   0071
        MVO@    R7,     R3                      ; 62E4   025F
        MVO@    R7,     R3                      ; 62E5   025F
        SLLC    R3,     2                       ; 62E6   005F
        SLLC    R3,     2                       ; 62E7   005F
        MVO@    R7,     R3                      ; 62E8   025F
        SLLC    R3,     2                       ; 62E9   005F
        SLLC    R3,     2                       ; 62EA   005F
        MVO@    R7,     R3                      ; 62EB   025F
        SUBR    R4,     R4                      ; 62EC   0124
        SLLC    R3,     2                       ; 62ED   005F
        SLLC    R3,     2                       ; 62EE   005F
        MVO@    R7,     R3                      ; 62EF   025F
        SLLC    R3,     2                       ; 62F0   005F
        MVO@    R7,     R3                      ; 62F1   025F
        SLLC    R3,     2                       ; 62F2   005F
        SUB@    R4,     R3                      ; 62F3   0323
        RRC     R2,     1                       ; 62F4   0072
        MVO@    R7,     R3                      ; 62F5   025F
        RRC     R2,     1                       ; 62F6   0072
        MVO@    R7,     R3                      ; 62F7   025F
        PSHR    R2                              ; 62F8   0272
        SLLC    R3,     2                       ; 62F9   005F
L_62FA:
        RRC     R2,     1                       ; 62FA   0072
        DECLE   $025F,  $006F,  $006E,  $0172   ; 62FB   025F 006F 006E 0172
        DECLE   $026E,  $01B4,  $026E,  $00B4   ; 62FF   026E 01B4 026E 00B4
        DECLE   $026E,  $00B6,  $03B4,  $0132   ; 6303   026E 00B6 03B4 0132
        DECLE   $01B4,  $0200,  $01B4,  $0000   ; 6307   01B4 0200 01B4 0000
        DECLE   $0200,  $0000,  $0200,  $000A   ; 630B   0200 0000 0200 000A
        DECLE   $000C,  $02C5,  $0266,  $00E3   ; 630F   000C 02C5 0266 00E3
        DECLE   $02A5,  $00CB,  $00AD,  $00DB   ; 6313   02A5 00CB 00AD 00DB
        DECLE   $0266,  $0000,  $0200,  $0000   ; 6317   0266 0000 0200 0000
        DECLE   $0000,  $0000,  $0209,  $0200   ; 631B   0000 0000 0209 0200
        DECLE   $0205,  $0202                   ; 631F   0205 0202

        PSHR    R3                              ; 6321   0273
        RRC     R1,     1                       ; 6322   0071
        ADD@    R6,     R3                      ; 6323   02F3
        MOVR    R4,     R5                      ; 6324   00A5
        ADD     .BTAB.B0,R2                     ; 6325   02C2 02B0
        ADD@    R2,     R0                      ; 6327   02D0
        MVO@    R0,     R4                      ; 6328   0260
        B       L_632B                          ; 6329   0200 0000
L_632B:
        B       L_632D                          ; 632B   0200 0000
L_632D:
        B       L_652F                          ; 632D   0200 0200

        DECLE   $0200,  $0210,  $0010,  $0038   ; 632F   0200 0210 0010 0038
        DECLE   $0038,  $0010,  $0210,  $0038   ; 6333   0038 0010 0210 0038
        DECLE   $0010,  $0000,  $0200,  $0000   ; 6337   0010 0000 0200 0000
        DECLE   $0000,  $0000,  $0020,  $0240   ; 633B   0000 0000 0020 0240
        DECLE   $0248,  $00D3,  $0286,  $00CD   ; 633F   0248 00D3 0286 00CD
        DECLE   $00A3,  $02D1,  $026F,  $020B   ; 6343   00A3 02D1 026F 020B
        DECLE   $000E,  $0004                   ; 6347   000E 0004

        B       L_634B                          ; 6349   0200 0000
L_634B:
        B       L_634D                          ; 634B   0200 0000

L_634D:
        NEGR    R0                              ; 634D   0020
        DECLE   $0050,  $0232,  $0027,  $02EE   ; 634E   0050 0232 0027 02EE
        DECLE   $0043,  $02A5,  $00D3,  $02B5   ; 6352   0043 02A5 00D3 02B5
        DECLE   $00DB,  $0066,  $0200,  $0200   ; 6356   00DB 0066 0200 0200
        DECLE   $0000,  $0000,  $0000,  $0000   ; 635A   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $0059,  $0028   ; 635E   0000 0040 0059 0028
        DECLE   $00B3,  $0073,  $00B9,  $02DB   ; 6362   00B3 0073 00B9 02DB
        DECLE   $00BA,  $00D0,  $0260,  $0000   ; 6366   00BA 00D0 0260 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 636A   0000 0000 0000 0000
        DECLE   $0200,  $0228,  $0010,  $0210   ; 636E   0200 0228 0010 0210
        DECLE   $0028,  $0010,  $0210,  $0038   ; 6372   0028 0010 0210 0038
        DECLE   $0210,  $0210,  $0200,  $0000   ; 6376   0210 0210 0200 0000
        DECLE   $0000,  $0200,  $0000,  $0000   ; 637A   0000 0200 0000 0000
        DECLE   $0200,  $020A,  $0245,  $022A   ; 637E   0200 020A 0245 022A
        DECLE   $0066,  $0273,  $0053,  $0261   ; 6382   0066 0273 0053 0261
        DECLE   $022F,  $0205,  $0207,  $0202   ; 6386   022F 0205 0207 0202
        DECLE   $0200,  $0000,  $0000,  $0090   ; 638A   0200 0000 0000 0090
        DECLE   $0260,  $00F0,  $02C0,  $00C0   ; 638E   0260 00F0 02C0 00C0
        DECLE   $00A0,  $020E,  $020F,  $000B   ; 6392   00A0 020E 020F 000B
        DECLE   $0016,  $0016,  $001A,  $000C   ; 6396   0016 0016 001A 000C
        DECLE   $0000                           ; 639A   0000

        B       L_639D                          ; 639B   0200 0000

L_639D:
        MVO@    R0,     R4                      ; 639D   0260
        B       L_6136                          ; 639E   0220 0269

        DECLE   $0245,  $0262,  $002E,  $0242   ; 63A0   0245 0262 002E 0242
        DECLE   $000F,  $0003,  $020D,  $000B   ; 63A4   000F 0003 020D 000B
        DECLE   $020D,  $0006,  $0000,  $0018   ; 63A8   020D 0006 0000 0018
        DECLE   $0218,  $0200,  $0010,  $0030   ; 63AC   0218 0200 0010 0030
        DECLE   $0230,  $0238,  $0034,  $0230   ; 63B0   0230 0238 0034 0230
        DECLE   $0018,  $000C,  $000C,  $0018   ; 63B4   0018 000C 000C 0018
        DECLE   $0010,  $0210,  $0000,  $020C   ; 63B8   0010 0210 0000 020C
        DECLE   $000C,  $0018,  $023C,  $027E   ; 63BC   000C 0018 023C 027E
        DECLE   $0079,  $0218,  $001C,  $021E   ; 63C0   0079 0218 001C 021E

        CLRC                                    ; 63C4   0006
        INCR    R6                              ; 63C5   000E
        INCR    R4                              ; 63C6   000C
        SKIP                                    ; 63C7   0208
        INCR    R0                              ; 63C8   0008
        B       L_63CB                          ; 63C9   0200 0000

L_63CB:
        COMR    R0                              ; 63CB   0018
        DECLE   $0018,  $0000,  $0018,  $003C   ; 63CC   0018 0000 0018 003C
        DECLE   $007E,  $005A,  $003C,  $0018   ; 63D0   007E 005A 003C 0018
        DECLE   $023C,  $027E,  $0066,  $0024   ; 63D4   023C 027E 0066 0024
        DECLE   $0224,  $0024,  $0000,  $0260   ; 63D8   0224 0024 0000 0260
        DECLE   $0060,  $0030,  $0030,  $0078   ; 63DC   0060 0030 0030 0078
        DECLE   $00B8,  $0278,  $0038,  $0270   ; 63E0   00B8 0278 0038 0270
        DECLE   $0040,  $0060,  $0030,  $0010   ; 63E4   0040 0060 0030 0010
        DECLE   $0200,  $0200,  $0000,  $0218   ; 63E8   0200 0200 0000 0218
        DECLE   $0018,  $0000,  $0008,  $020C   ; 63EC   0018 0000 0008 020C
        DECLE   $000C,  $021C,  $002C,  $000C   ; 63F0   000C 021C 002C 000C
        DECLE   $0018,  $0230,  $0230,  $0218   ; 63F4   0018 0230 0230 0218
        DECLE   $0208,  $0208,  $0000,  $0200   ; 63F8   0208 0208 0000 0200
        DECLE   $0060,  $0260,  $0230,  $0270   ; 63FC   0060 0260 0230 0270
        DECLE   $02A8,  $0238,  $0078,  $0238   ; 6400   02A8 0238 0078 0238
        DECLE   $0218,  $0210                   ; 6404   0218 0210

        COMR    R0                              ; 6406   0018
L_6407:
        INCR    R0                              ; 6407   0008
        DECLE   $0208,  $0000,  $0000           ; 6408   0208 0000 0000

        COMR    R0                              ; 640B   0018
        COMR    R0                              ; 640C   0018
        B       L_6427                          ; 640D   0200 0018

        DECLE   $003C,  $007E,  $025A,  $003C   ; 640F   003C 007E 025A 003C
        DECLE   $0018,  $003C,  $007E,  $0266   ; 6413   0018 003C 007E 0266
        DECLE   $0224,  $0024,  $0224,  $0000   ; 6417   0224 0024 0224 0000
        DECLE   $0000,  $0260,  $0260,  $0200   ; 641B   0000 0260 0260 0200
        DECLE   $00F0,  $00A8,  $02F4,  $0078   ; 641F   00F0 00A8 02F4 0078
        DECLE   $0278                           ; 6423   0278

        NEGR    R4                              ; 6424   0024
        NOP                                     ; 6425   0034
        RRC     R0,     1                       ; 6426   0070
L_6427:
        MVO@    R0,     R4                      ; 6427   0260
        DECLE   $0040,  $0240,  $0000,  $0230   ; 6428   0040 0240 0000 0230
        DECLE   $0030,  $0230,  $0010,  $0018   ; 642C   0030 0230 0010 0018
        DECLE   $02F8,  $0258,  $0018,  $0008   ; 6430   02F8 0258 0018 0008
        DECLE   $006C,  $007C,  $007C,  $0040   ; 6434   006C 007C 007C 0040
        DECLE   $0020,  $0020,  $0018,  $0018   ; 6438   0020 0020 0018 0018
        DECLE   $0030,  $0270,  $0078,  $0074   ; 643C   0030 0270 0078 0074
        DECLE   $0264,  $0074,  $0070,  $0050   ; 6440   0264 0074 0070 0050
        DECLE   $0050,  $0058,  $0240,  $0260   ; 6444   0050 0058 0240 0260
        DECLE   $0000,  $0200,  $0000,  $0000   ; 6448   0000 0200 0000 0000
        DECLE   $0200,  $0000,  $021E,  $023C   ; 644C   0200 0000 021E 023C
        DECLE   $0238,  $0000,  $0000           ; 6450   0238 0000 0000

        B       L_6455                          ; 6453   0200 0000

L_6455:
        EIS                                     ; 6455   0002
        DECLE   $0204,  $0218,  $0218,  $0210   ; 6456   0204 0218 0218 0210
        DECLE   $0008,  $0208,  $0018,  $0218   ; 645A   0008 0208 0018 0218
        DECLE   $0218,  $0210,  $0200,  $0200   ; 645E   0218 0210 0200 0200
        DECLE   $0210,  $0018,  $0018,  $021C   ; 6462   0210 0018 0018 021C
        DECLE   $021C,  $020C,  $0204,  $0000   ; 6466   021C 020C 0204 0000
        DECLE   $0000,  $0200,  $0200,  $0000   ; 646A   0000 0200 0200 0000
        DECLE   $000E,  $001C,  $0038,  $0000   ; 646E   000E 001C 0038 0000
        DECLE   $0000,  $0200,  $0000,  $0202   ; 6472   0000 0200 0000 0202
        DECLE   $0204,  $0208,  $0218,  $0210   ; 6476   0204 0208 0218 0210
        DECLE   $0008,  $0018,  $0218,  $0018   ; 647A   0008 0018 0218 0018
        DECLE   $0018,  $0010,  $0200,  $0000   ; 647E   0018 0010 0200 0000
        DECLE   $0000,  $0000,  $0208,  $0218   ; 6482   0000 0000 0208 0218
        DECLE   $001C,  $001E,  $020C,  $0200   ; 6486   001C 001E 020C 0200
        DECLE   $0010,  $0230,  $0018,  $0218   ; 648A   0010 0230 0018 0218
        DECLE   $0018,  $0208,  $000C,  $0000   ; 648E   0018 0208 000C 0000
        DECLE   $0018,  $0218,  $0008,  $0008   ; 6492   0018 0218 0008 0008
        DECLE   $0008,  $020C,  $0004,  $0204   ; 6496   0008 020C 0004 0204
        DECLE   $0000,  $0200,  $0000,  $0000   ; 649A   0000 0200 0000 0000
        DECLE   $000A,  $020C                   ; 649E   000A 020C

        ADDR    R0,     R5                      ; 64A0   00C5
        MVO@    R6,     R4                      ; 64A1   0266
        ADDR    R4,     R3                      ; 64A2   00E3
        ADD@    R4,     R7                      ; 64A3   02E7

        DECLE   $00AD,  $02CB,  $00BD,  $0066   ; 64A4   00AD 02CB 00BD 0066
        DECLE   $0200,  $0000,  $0000           ; 64A8   0200 0000 0000

        B       L_64AD                          ; 64AB   0200 0000

L_64AD:
        INCR    R1                              ; 64AD   0009
        B       L_64B5                          ; 64AE   0200 0005

        EIS                                     ; 64B0   0002
        PSHR    R3                              ; 64B1   0273
        RRC     R1,     1                       ; 64B2   0071
        ADD@    R6,     R3                      ; 64B3   02F3
        ADDR    R0,     R7                      ; 64B4   00C7

L_64B5:
        MOVR    R4,     R2                      ; 64B5   00A2
        DECLE   $02D0,  $02B0,  $0260,  $0000   ; 64B6   02D0 02B0 0260 0000
        DECLE   $0000,  $0200,  $0000,  $0000   ; 64BA   0000 0200 0000 0000
        DECLE   $0000,  $0200,  $0210,  $0210   ; 64BE   0000 0200 0210 0210
        DECLE   $0038,  $0238,  $0010,  $0210   ; 64C2   0038 0238 0010 0210
        DECLE   $0238,  $0210,  $0200,  $0200   ; 64C6   0238 0210 0200 0200
        DECLE   $0000                           ; 64CA   0000

        B       L_64CD                          ; 64CB   0200 0000

L_64CD:
        NEGR    R0                              ; 64CD   0020
        DECLE   $0040,  $0248,  $02D3,  $02C6   ; 64CE   0040 0248 02D3 02C6
        DECLE   $00AD,  $00E1,  $00B3,  $026D   ; 64D2   00AD 00E1 00B3 026D
        DECLE   $000B,  $000E,  $0004,  $0200   ; 64D6   000B 000E 0004 0200
        DECLE   $0000,  $0000,  $0000,  $0020   ; 64DA   0000 0000 0000 0020
        DECLE   $0250,  $0232,  $0027           ; 64DE   0250 0232 0027

        ADD@    R5,     R6                      ; 64E1   02EE
        SWAP    R3,     1                       ; 64E2   0043
        ADDR    R4,     R7                      ; 64E3   00E7

        DECLE   $02B5,  $00D3,  $00BD,  $0266   ; 64E4   02B5 00D3 00BD 0266
        DECLE   $0000,  $0000,  $0000,  $0200   ; 64E8   0000 0000 0000 0200
        DECLE   $0000,  $0000,  $0200,  $0040   ; 64EC   0000 0000 0200 0040
        DECLE   $0059,  $0228,  $00B3,  $0271   ; 64F0   0059 0228 00B3 0271
        DECLE   $00DB,  $02B1,  $00DA,  $00B0   ; 64F4   00DB 02B1 00DA 00B0
        DECLE   $0260,  $0000,  $0000,  $0200   ; 64F8   0260 0000 0000 0200
        DECLE   $0000,  $0000,  $0000,  $0228   ; 64FC   0000 0000 0000 0228
        DECLE   $0010,  $0210,  $0028,  $0210   ; 6500   0010 0210 0028 0210

        DECR    R0                              ; 6504   0010
        RSWD    R0                              ; 6505   0038
        DECR    R0                              ; 6506   0010
        DECR    R0                              ; 6507   0010
        B       L_670A                          ; 6508   0200 0200

        DECLE   $0000                           ; 650A   0000

        B       L_650D                          ; 650B   0200 0000
L_650D:
        B       L_650F                          ; 650D   0200 0000
L_650F:
        BNOV    L_6556                          ; 650F   020A 0045

        DECLE   $002A,  $0066,  $0253,  $0073   ; 6511   002A 0066 0253 0073
        DECLE   $0063,  $022D,  $0007,  $0005   ; 6515   0063 022D 0007 0005

        BOV     L_651B                          ; 6519   0202 0000
L_651B:
        B       L_651D                          ; 651B   0200 0000

L_651D:
        MOVR    R2,     R0                      ; 651D   0090
        DECLE   $0260,  $02F0,  $02A0,  $02C0   ; 651E   0260 02F0 02A0 02C0
        DECLE   $00C0,  $020E,  $000F,  $000B   ; 6522   00C0 020E 000F 000B
        DECLE   $0216,  $021A,  $0216,  $000C   ; 6526   0216 021A 0216 000C
        DECLE   $0000                           ; 652A   0000

        B       L_652D                          ; 652B   0200 0000

L_652D:
        SLR     R0,     1                       ; 652D   0060
        NEGR    R0                              ; 652E   0020
L_652F:
        SAR     R1,     1                       ; 652F   0069
        DECLE   $0045,  $0262,  $004E,  $0222   ; 6530   0045 0262 004E 0222
        DECLE   $000F,  $0005,  $020B,  $020D   ; 6534   000F 0005 020B 020D
        DECLE   $000B,  $0006                   ; 6538   000B 0006
.GFX_LIST_653A:
        DECLE   $0000,  $0200,  $0000,  $021F   ; 653A   0000 0200 0000 021F
        DECLE   $021F,  $0218,  $0218,  $0218   ; 653E   021F 0218 0218 0218
        DECLE   $0000,  $0200                   ; 6542   0000 0200

        COMR    R0                              ; 6544   0018
        ADDI    #$02E7, R7                      ; 6545   02FF 02E7

        DECLE   $0000,  $0200                   ; 6547   0000 0200

        B       L_654B                          ; 6549   0200 0000

L_654B:
        INCR    R0                              ; 654B   0008
        DECLE   $0008,  $02FF,  $00FF,  $0008   ; 654C   0008 02FF 00FF 0008
        DECLE   $0208,  $0000,  $0000,  $0000   ; 6550   0208 0000 0000 0000

        COMR    R0                              ; 6554   0018
        RSWD    R4                              ; 6555   003C
L_6556:
        ADD@    R4,     R7                      ; 6556   02E7

        DECLE   $02C3,  $0000,  $0200,  $0000   ; 6557   02C3 0000 0200 0000
        DECLE   $0000,  $0207,  $001F,  $02F8   ; 655B   0000 0207 001F 02F8
        DECLE   $02E0,  $0000,  $0000,  $0000   ; 655F   02E0 0000 0000 0000

        B       L_6565                          ; 6563   0200 0000

L_6565:
        ADDR    R6,     R0                      ; 6565   00F0
        DECLE   $00FF,  $020F,  $0000,  $0200   ; 6566   00FF 020F 0000 0200
        DECLE   $0000,  $0242,  $0082,  $0084   ; 656A  CART PIC #06
        DECLE   $0008,  $0208,  $0210,  $0010   ; 656E  
        DECLE   $0040,  $0240,  $0020,  $0222   ; 6572  CART PIC #07
        DECLE   $0022,  $0211,  $0010,  $00EB   ; 6576  
        DECLE   $0008,  $0008,  $0004,  $0004   ; 657A  CART PIC #08
        DECLE   $0084,  $0024,  $000A,  $0000   ; 657E  
        DECLE   $0020,  $0010,  $0210,  $020A   ; 6582  CART PIC #09
        DECLE   $0001,  $0041,  $0280,  $0080   ; 6586  
        DECLE   $0048,  $0224,  $008A,  $0042   ; 658A  CART PIC #0A
        DECLE   $0221,  $0011,  $0001,  $0281   ; 658E  
        DECLE   $00C0,  $0230,  $000C,  $0083   ; 6592  CART PIC #0B
        DECLE   $0040,  $0210,  $0208,  $0240   ; 6596  
        DECLE   $0042,  $0242,  $0024,  $0004   ; 659A  CART PIC #0C
        DECLE   $0208,  $0008,  $0030,  $00C0   ; 659E  
        DECLE   $0002,  $0247,  $00D7,  $02FE   ; 65A2  CART PIC #0D
        DECLE   $007A,  $025A,  $0050,  $0010   ; 65A6  
        DECLE   $00C0,  $02E0,  $0290,  $0080   ; 65AA  CART PIC #0E
        DECLE   $0080,  $0080,  $0080,  $0080   ; 65AE  
        DECLE   $0070,  $00D0,  $00EE,  $000B   ; 65B2  CART PIC #0F
        DECLE   $00E7,  $00B0,  $0058,  $0038   ; 65B6  
        DECLE   $0084,  $0088,  $0050,  $0020   ; 65BA  CART PIC #10
        DECLE   $0021,  $0011,  $000A,  $000A   ; 65BE  
.GRAM_INIT_65C2:
        DECLE   $0037           ; 65C2  # of GRAM cards to init
        DECLE   $0315,  $0286   ; 65C3  #00   :  Algo #1
        DECLE   $0111,  $0034   ; 65C5  #01   :  4x4 tile
        DECLE   $0229,  $015E   ; 65C7  #02   :  Algo #1
        DECLE   $0215,  $0176   ; 65C9  #03   :  Algo #1
        DECLE   $0281,  $0016   ; 65CB  #04   :  Algo #1
        DECLE   $027D,  $0002   ; 65CD  #05   :  Algo #1
        DECLE   $0271,  $0392   ; 65CF  #06   :  Algo #1
        DECLE   $010D,  $0040   ; 65D1  #07-07:  GRAM #06-06 -Y--
        DECLE   $010B,  $0040   ; 65D3  #08-08:  GRAM #05-05 -Y--
        DECLE   $0207,  $0040   ; 65D5  #09-09:  GRAM #03-03 X---
        DECLE   $0205,  $0040   ; 65D7  #0A-0A:  GRAM #02-02 X---
        DECLE   $0201,  $0040   ; 65D9  #0B-0B:  GRAM #00-00 X---
        DECLE   $02D1,  $00A5   ; 65DB  #0C   :  Algo #2
        DECLE   $0211,  $0040   ; 65DD  #0D-0D:  GRAM #08-08 X---
        DECLE   $0119,  $0040   ; 65DF  #0E-0E:  GRAM #0C-0C -Y--
        DECLE   $020F,  $0040   ; 65E1  #0F-0F:  GRAM #07-07 X---
        DECLE   $0201,  $002E   ; 65E3  #10   :  Algo #1
        DECLE   $0221,  $007E   ; 65E5  #11   :  Algo #1
        DECLE   $0223,  $0040   ; 65E7  #12-12:  GRAM #11-11 X---
        DECLE   $011F,  $0040   ; 65E9  #13-13:  GRAM #0F-0F -Y--
        DECLE   $011B,  $0040   ; 65EB  #14-14:  GRAM #0D-0D -Y--
        DECLE   $03A1,  $0046   ; 65ED  #15   :  Algo #1
        DECLE   $0117,  $0040   ; 65EF  #16-16:  GRAM #0B-0B -Y--
        DECLE   $0115,  $0040   ; 65F1  #17-17:  GRAM #0A-0A -Y--
        DECLE   $0113,  $0040   ; 65F3  #18-18:  GRAM #09-09 -Y--
        DECLE   $021D,  $0040   ; 65F5  #19-19:  GRAM #0E-0E X---
        DECLE   $022B,  $0040   ; 65F7  #1A-1A:  GRAM #15-15 X---
        DECLE   $022D,  $0040   ; 65F9  #1B-1B:  GRAM #16-16 X---
        DECLE   $022F,  $0040   ; 65FB  #1C-1C:  GRAM #17-17 X---
        DECLE   $0231,  $0040   ; 65FD  #1D-1D:  GRAM #18-18 X---
        DECLE   $0133,  $0040   ; 65FF  #1E-1E:  GRAM #19-19 -Y--
        DECLE   $03A5,  $0040   ; 6601  #1F-1F:  GRAM #12-12 XYI-
        DECLE   $023F,  $0040   ; 6603  #20-20:  GRAM #1F-1F X---
        DECLE   $0377,  $01B2   ; 6605  #21   :  Algo #1
        DECLE   $02BB,  $00F2   ; 6607  #22   :  Algo #1
        DECLE   $01FF,  $00EE   ; 6609  #23   :  Algo #1
        DECLE   $0347,  $0040   ; 660B  #24-24:  GRAM #23-23 XY--
        DECLE   $02FD,  $0211   ; 660D  #25   :  Algo #2
        DECLE   $008B,  $0040   ; 660F  #26-26:  GRAM #05-05 --I-
        DECLE   $0343,  $0040   ; 6611  #27-27:  GRAM #21-21 XY--
        DECLE   $0345,  $0040   ; 6613  #28-28:  GRAM #22-22 XY--
        DECLE   $009B,  $0040   ; 6615  #29-29:  GRAM #0D-0D --I-
        DECLE   $034B,  $0040   ; 6617  #2A-2A:  GRAM #25-25 XY--
        DECLE   $000D,  $0380   ; 6619  #2B-32:  CART #06-0D ----
        DECLE   $001D,  $0180   ; 661B  #33-36:  CART #0E-11 ----

L_661D:
        PSHR    R5                              ; 661D   0275
        MVI     G_034C, R0                      ; 661E   0280 034C
        ANDI    #$0008, R0                      ; 6620   03B8 0008
        BNEQ    L_6634                          ; 6622   020C 0010

        MVI     G_012F, R0                      ; 6624   0280 012F
        XOR     G_01C9, R0                      ; 6626   03C0 01C9
        PSHR    R0                              ; 6628   0270
        SLL     R0,     1                       ; 6629   0048
        ADD@    R6,     R0                      ; 662A   02F0

        JSR     R5,     .EXEC.76C               ; 662B   0004 0114 036C

        ADDI    #$0004, R1                      ; 662E   02F9 0004
        MVI@    R1,     R0                      ; 6630   0288
        ANDI    #$00FF, R0                      ; 6631   03B8 00FF
        MVO@    R0,     R1                      ; 6633   0248
L_6634:
        CLRR    R0                              ; 6634   01C0
        MVI     G_012F, R2                      ; 6635   0282 012F
        XOR     G_01C9, R2                      ; 6637   03C2 01C9
        MOVR    R2,     R4                      ; 6639   0094
        MVII    #$0004, R3                      ; 663A   02BB 0004

        JSR     R5,     L_6CC9                  ; 663C   0004 016C 00C9

        BEQ     L_6648                          ; 663F   0204 0007

        MVI     G_012F, R2                      ; 6641   0282 012F
        XOR     G_01C9, R2                      ; 6643   03C2 01C9
        ADDI    #$0176, R2                      ; 6645   02FA 0176
        MVI@    R2,     R0                      ; 6647   0290

L_6648:
        JSR     R5,     X_EXT_SIGN_LO           ; 6648   0004 0114 0268

        MVI     G_012F, R2                      ; 664B   0282 012F
        XOR     G_01C9, R2                      ; 664D   03C2 01C9
        SLL     R2,     1                       ; 664F   004A
        SLL     R2,     2                       ; 6650   004E
        PSHR    R2                              ; 6651   0272
        SLL     R2,     1                       ; 6652   004A
        ADD@    R6,     R2                      ; 6653   02F2
        ADDI    #$0321, R2                      ; 6654   02FA 0321
        MOVR    R0,     R3                      ; 6656   0083
        MVI@    R2,     R0                      ; 6657   0290

        JSR     R5,     X_UNPK_BYTES            ; 6658   0004 0114 0357

        SUBR    R3,     R0                      ; 665B   0118
        MVI     G_034C, R5                      ; 665C   0285 034C
        ANDI    #$0020, R5                      ; 665E   03BD 0020
        BEQ     L_6663                          ; 6660   0204 0001

        CLRR    R0                              ; 6662   01C0
L_6663:
        MVO     R0,     G_01DB                  ; 6663   0240 01DB
        MVI     G_034C, R0                      ; 6665   0280 034C
        ANDI    #$0008, R0                      ; 6667   03B8 0008
        BNEQ    L_667D                          ; 6669   020C 0012

        MVI     G_012F, R0                      ; 666B   0280 012F
        XOR     G_01CA, R0                      ; 666D   03C0 01CA
        PSHR    R0                              ; 666F   0270
        SLL     R0,     1                       ; 6670   0048
        ADD@    R6,     R0                      ; 6671   02F0

        JSR     R5,     .EXEC.76C               ; 6672   0004 0114 036C

        ADDI    #$0004, R1                      ; 6675   02F9 0004
        MVI@    R1,     R0                      ; 6677   0288
        SDBD                                    ; 6678   0001
        ANDI    #$FF00, R0                      ; 6679   03B8 0000 00FF
        MVO@    R0,     R1                      ; 667C   0248
L_667D:
        CLRR    R0                              ; 667D   01C0
        MVI     G_012F, R2                      ; 667E   0282 012F
        XOR     G_01CA, R2                      ; 6680   03C2 01CA
        MOVR    R2,     R4                      ; 6682   0094
        MVII    #$0004, R3                      ; 6683   02BB 0004

        JSR     R5,     L_6CC9                  ; 6685   0004 016C 00C9

        BEQ     L_6691                          ; 6688   0204 0007

        MVI     G_012F, R2                      ; 668A   0282 012F
        XOR     G_01CA, R2                      ; 668C   03C2 01CA
        ADDI    #$0178, R2                      ; 668E   02FA 0178
        MVI@    R2,     R0                      ; 6690   0290

L_6691:
        JSR     R5,     X_EXT_SIGN_LO           ; 6691   0004 0114 0268

        SAR     R0,     1                       ; 6694   0068
        MVI     G_012F, R2                      ; 6695   0282 012F
        XOR     G_01CA, R2                      ; 6697   03C2 01CA
        SLL     R2,     1                       ; 6699   004A
        SLL     R2,     2                       ; 669A   004E
        PSHR    R2                              ; 669B   0272
        SLL     R2,     1                       ; 669C   004A
        ADD@    R6,     R2                      ; 669D   02F2
        ADDI    #$0321, R2                      ; 669E   02FA 0321
        MOVR    R0,     R4                      ; 66A0   0084
        MVI@    R2,     R0                      ; 66A1   0290

        JSR     R5,     X_UNPK_BYTES            ; 66A2   0004 0114 0357

        SUBR    R4,     R1                      ; 66A5   0121
        MVI     G_034C, R5                      ; 66A6   0285 034C
        ANDI    #$0020, R5                      ; 66A8   03BD 0020
        BEQ     L_66AD                          ; 66AA   0204 0001

        CLRR    R1                              ; 66AC   01C9
L_66AD:
        MVO     R1,     G_01DE                  ; 66AD   0241 01DE
        MVII    #$0001, R4                      ; 66AF   02BC 0001
L_66B1:
        CLRR    R0                              ; 66B1   01C0
        PSHR    R4                              ; 66B2   0274
        MVII    #$0004, R3                      ; 66B3   02BB 0004

        JSR     R5,     L_6CC9                  ; 66B5   0004 016C 00C9

        PULR    R4                              ; 66B8   02B4
        BEQ     L_66C5                          ; 66B9   0204 000A

        MOVR    R4,     R3                      ; 66BB   00A3
        ADDI    #$0176, R3                      ; 66BC   02FB 0176
        MVI@    R3,     R0                      ; 66BE   0298
        ADDI    #$0002, R3                      ; 66BF   02FB 0002
        MVI@    R3,     R1                      ; 66C1   0299

        JSR     R5,     X_PACK_BYTES            ; 66C2   0004 0114 034F
L_66C5:
        JSR     R5,     X_UNPK_BYTES            ; 66C5   0004 0114 0357

        SAR     R1,     1                       ; 66C8   0069
        ADD     G_01DB, R0                      ; 66C9   02C0 01DB
        ADD     G_01DE, R1                      ; 66CB   02C1 01DE
        MOVR    R4,     R3                      ; 66CD   00A3
        PSHR    R3                              ; 66CE   0273
        SLL     R3,     1                       ; 66CF   004B
        ADD@    R6,     R3                      ; 66D0   02F3
        SLL     R3,     1                       ; 66D1   004B
        SLL     R3,     2                       ; 66D2   004F
        ADDI    #$0321, R3                      ; 66D3   02FB 0321

        JSR     R5,     X_PACK_BYTES            ; 66D5   0004 0114 034F

        MVO@    R0,     R3                      ; 66D8   0258
        ADDI    #$0010, R3                      ; 66D9   02FB 0010
        MVO@    R0,     R3                      ; 66DB   0258
        DECR    R4                              ; 66DC   0014
        BPL     L_66B1                          ; 66DD   0223 002D
        PULR    R7                              ; 66DF   02B7

        MVII    #$0008, R0                      ; 66E0   02B8 0008
        COMR    R0                              ; 66E2   0018
        AND     G_034C, R0                      ; 66E3   0380 034C
        MVO     R0,     G_034C                  ; 66E5   0240 034C
        MOVR    R5,     R7                      ; 66E7   00AF

L_66E8:
        PSHR    R5                              ; 66E8   0275
        MVO     R0,     G_012F                  ; 66E9   0240 012F
        PSHR    R0                              ; 66EB   0270
        SLL     R0,     1                       ; 66EC   0048
        ADD@    R6,     R0                      ; 66ED   02F0

        JSR     R5,     .EXEC.76C               ; 66EE   0004 0114 036C
        DECLE   $02BB,  $000F,  $0001           ; 66F1   02BB 000F 0001

        MVII    #$0033, R2                      ; 66F4   02BA 0033
        RLC     R3,     1                       ; 66F6   0053

        JSR     R5,     .EXEC.9A1               ; 66F7   0004 0118 01A1

        MVII    #$0008, R0                      ; 66FA   02B8 0008
        COMR    R0                              ; 66FC   0018
        AND     G_034C, R0                      ; 66FD   0380 034C
        XORI    #$0008, R0                      ; 66FF   03F8 0008
        MVO     R0,     G_034C                  ; 6701   0240 034C

        JSR     R5,     L_661D                  ; 6703   0004 0164 021D

        PULR    R7                              ; 6706   02B7

L_6707:
        PSHR    R5                              ; 6707   0275
        MVI     G_0355, R3                      ; 6708   0283 0355
L_670A:
        SLR     R3,     1                       ; 670A   0063
        MVI     G_035C, R1                      ; 670B   0281 035C
        TSTR    R1                              ; 670D   0089
        BEQ     L_671A                          ; 670E   0204 000A

        SLL     R1,     2                       ; 6710   004D
        SLL     R1,     1                       ; 6711   0049
        SDBD                                    ; 6712   0001
        ADDI    #$6F80, R1                      ; 6713   02F9 0080 006F
        ADDR    R3,     R1                      ; 6716   00D9
        MVI@    R1,     R3                      ; 6717   028B
        ANDI    #$000F, R3                      ; 6718   03BB 000F
L_671A:
        MVI     G_0117, R2                      ; 671A   0282 0117
        SLL     R2,     2                       ; 671C   004E
        PSHR    R2                              ; 671D   0272
        SLL     R2,     1                       ; 671E   004A
        ADD@    R6,     R2                      ; 671F   02F2
        SLL     R2,     1                       ; 6720   004A
        ADDI    #$0332, R2                      ; 6721   02FA 0332
        MVO@    R3,     R2                      ; 6723   0253
        MVI     G_0353, R0                      ; 6724   0280 0353
        TSTR    R0                              ; 6726   0080
        BNEQ    L_676C                          ; 6727   020C 0043

        SUBI    #$0010, R2                      ; 6729   033A 0010
        MVO@    R3,     R2                      ; 672B   0253
        SUBI    #$0004, R2                      ; 672C   033A 0004
        MVI     G_0117, R5                      ; 672E   0285 0117
        MVI     G_0344, R1                      ; 6730   0281 0344
        TSTR    R5                              ; 6732   00AD
        BNEQ    L_6736                          ; 6733   020C 0001

        SWAP    R1,     1                       ; 6735   0041
L_6736:
        MOVR    R1,     R0                      ; 6736   0088
        ANDI    #$00FF, R1                      ; 6737   03B9 00FF
        MVI     G_0358, R4                      ; 6739   0284 0358
        ADDR    R4,     R4                      ; 673B   00E4
        ADDR    R4,     R4                      ; 673C   00E4
        ADDR    R4,     R1                      ; 673D   00E1
        CMPI    #$0100, R1                      ; 673E   0379 0100
        BNC     L_6748                          ; 6740   0209 0006

        MVI@    R2,     R4                      ; 6742   0294
        SDBD                                    ; 6743   0001
        XORI    #$0037, R4                      ; 6744   03FC 0037 0000
        MVO@    R4,     R2                      ; 6747   0254
L_6748:
        SDBD                                    ; 6748   0001
        ANDI    #$FF00, R0                      ; 6749   03B8 0000 00FF
        ANDI    #$00FF, R1                      ; 674C   03B9 00FF
        XORR    R0,     R1                      ; 674E   01C1
        TSTR    R5                              ; 674F   00AD
        BNEQ    L_6753                          ; 6750   020C 0001

        SWAP    R1,     1                       ; 6752   0041
L_6753:
        MVO     R1,     G_0344                  ; 6753   0241 0344
        ADDI    #$000C, R2                      ; 6755   02FA 000C
        MVO@    R3,     R2                      ; 6757   0253
        SUBI    #$0001, R2                      ; 6758   033A 0001
        SDBD                                    ; 675A   0001
        ADDI    #$676D, R3                      ; 675B   02FB 006D 0067
        MVI@    R3,     R0                      ; 675E   0298
        MOVR    R0,     R1                      ; 675F   0081
        ANDI    #$000F, R0                      ; 6760   03B8 000F
        SLR     R1,     2                       ; 6762   0065
        SLR     R1,     2                       ; 6763   0065
        SUBI    #$0008, R1                      ; 6764   0339 0008
        SUBI    #$0008, R0                      ; 6766   0338 0008

        JSR     R5,     X_PACK_BYTES            ; 6768   0004 0114 034F

        MVO@    R0,     R2                      ; 676B   0250
L_676C:
        PULR    R7                              ; 676C   02B7

        SAR     R0,     1                       ; 676D   0068
        SARC    R0,     1                       ; 676E   0078
        SAR     R0,     1                       ; 676F   0068
        SARC    R2,     1                       ; 6770   007A
        SAR     R0,     1                       ; 6771   0068
        SARC    R2,     1                       ; 6772   007A
        SAR     R0,     1                       ; 6773   0068
        SARC    R2,     1                       ; 6774   007A
        SAR     R1,     1                       ; 6775   0069
        SARC    R3,     1                       ; 6776   007B
L_6777:
        PSHR    R5                              ; 6777   0275
        MVI     G_035B, R2                      ; 6778   0282 035B
        CMPI    #$000F, R2                      ; 677A   037A 000F
        BEQ     L_678A                          ; 677C   0204 000C

        MVI     G_0180, R2                      ; 677E   0282 0180
        CMPI    #$0004, R2                      ; 6780   037A 0004
        BEQ     L_67C8                          ; 6782   0204 0044

        MVI     G_0181, R2                      ; 6784   0282 0181
        CMPI    #$0004, R2                      ; 6786   037A 0004
        BEQ     L_67C8                          ; 6788   0204 003E

L_678A:
        MVI     G_0117, R2                      ; 678A   0282 0117
        SDBD                                    ; 678C   0001
        ADDI    #$01CB, R2                      ; 678D   02FA 00CB 0001
        MVI@    R2,     R2                      ; 6790   0292
        TSTR    R2                              ; 6791   0092
        BNEQ    L_6860                          ; 6792   020C 00CC

        MVI     G_0117, R0                      ; 6794   0280 0117
        PSHR    R0                              ; 6796   0270
        SLL     R0,     1                       ; 6797   0048
        ADD@    R6,     R0                      ; 6798   02F0

        JSR     R5,     .EXEC.772               ; 6799   0004 0114 0372

        ADD     G_01DD, R2                      ; 679C   02C2 01DD
        ADD     G_01E0, R3                      ; 679E   02C3 01E0
        CMPI    #$0014, R3                      ; 67A0   037B 0014
        BPL     L_67AA                          ; 67A2   0203 0006

        JSR     R5,     L_67C9                  ; 67A4   0004 0164 03C9
        DECLE   $0001,  $0000                   ; 67A7   0001 0000

        SWAP    R0,     1                       ; 67A9   0040
L_67AA:
        CMPI    #$005C, R3                      ; 67AA   037B 005C
        BMI     L_67B4                          ; 67AC   020B 0006

        JSR     R5,     L_67C9                  ; 67AE   0004 0164 03C9
        DECLE   $0001                           ; 67B1   0001

        SWAP    R0,     1                       ; 67B2   0040
        SWAP    R0,     1                       ; 67B3   0040
L_67B4:
        CMPI    #$0014, R2                      ; 67B4   037A 0014
        BPL     L_67BE                          ; 67B6   0203 0006

        JSR     R5,     L_67C9                  ; 67B8   0004 0164 03C9
        DECLE   $0000,  $0000                   ; 67BB   0000 0000

        TSTR    R0                              ; 67BD   0080
L_67BE:
        CMPI    #$009C, R2                      ; 67BE   037A 009C
        BMI     L_67C8                          ; 67C0   020B 0006

        JSR     R5,     L_67C9                  ; 67C2   0004 0164 03C9
        DECLE   $0000                           ; 67C5   0000

        TSTR    R0                              ; 67C6   0080
        TSTR    R0                              ; 67C7   0080
L_67C8:
        PULR    R7                              ; 67C8   02B7

L_67C9:
        PSHR    R2                              ; 67C9   0272
        PSHR    R3                              ; 67CA   0273
        MVII    #$0356, R2                      ; 67CB   02BA 0356
        MVII    #$01C9, R3                      ; 67CD   02BB 01C9
        ADD@    R5,     R2                      ; 67CF   02EA
        DECR    R5                              ; 67D0   0015
        ADD@    R5,     R3                      ; 67D1   02EB
        MVI@    R2,     R0                      ; 67D2   0290
        MVI@    R5,     R1                      ; 67D3   02A9
        MVI@    R5,     R4                      ; 67D4   02AC
        PSHR    R5                              ; 67D5   0275
        TSTR    R1                              ; 67D6   0089
        BEQ     L_67E2                          ; 67D7   0204 0009

        TSTR    R0                              ; 67D9   0080
        BEQ     L_67EF                          ; 67DA   0204 0013

        CMPI    #$0064, R0                      ; 67DC   0378 0064
        BC      L_67EF                          ; 67DE   0201 000F
        B       L_67E6                          ; 67E0   0200 0004

L_67E2:
        CMPI    #$0064, R0                      ; 67E2   0378 0064
        BNC     L_67EF                          ; 67E4   0209 0009

L_67E6:
        COMR    R4                              ; 67E6   001C
        AND     G_034C, R4                      ; 67E7   0384 034C
        XORR    R1,     R4                      ; 67E9   01CC
        MVO     R4,     G_034C                  ; 67EA   0244 034C
        MVII    #$0001, R0                      ; 67EC   02B8 0001
        MVO@    R0,     R3                      ; 67EE   0258
L_67EF:
        MVI     G_035B, R0                      ; 67EF   0280 035B
        CMPI    #$000F, R0                      ; 67F1   0378 000F
        BNEQ    L_6800                          ; 67F3   020C 000B

        MVII    #$0004, R0                      ; 67F5   02B8 0004
        MVO     R0,     G_035B                  ; 67F7   0240 035B
        MVI     G_0117, R3                      ; 67F9   0283 0117

        JSR     R5,     L_5339                  ; 67FB   0004 0150 0339

        B       L_682C                          ; 67FE   0200 002C

L_6800:
        MVII    #$0008, R0                      ; 6800   02B8 0008
        COMR    R0                              ; 6802   0018
        AND     G_034C, R0                      ; 6803   0380 034C
        MVO     R0,     G_034C                  ; 6805   0240 034C
        MVI     G_0117, R1                      ; 6807   0281 0117
        XORI    #$0001, R1                      ; 6809   03F9 0001
        MOVR    R1,     R0                      ; 680B   0088
        SDBD                                    ; 680C   0001
        ADDI    #$01CB, R1                      ; 680D   02F9 00CB 0001
        MVII    #$0001, R2                      ; 6810   02BA 0001
        MVO@    R2,     R1                      ; 6812   024A
        PSHR    R0                              ; 6813   0270
        SLL     R0,     1                       ; 6814   0048
        ADD@    R6,     R0                      ; 6815   02F0
        ADDI    #$0002, R0                      ; 6816   02F8 0002

        JSR     R5,     .EXEC.76C               ; 6818   0004 0114 036C

        ADDI    #$0006, R1                      ; 681B   02F9 0006
        MVII    #$0004, R0                      ; 681D   02B8 0004
        MVO@    R0,     R1                      ; 681F   0248
        SUBI    #$0008, R1                      ; 6820   0339 0008
        MVI@    R1,     R0                      ; 6822   0288
        SDBD                                    ; 6823   0001
        ANDI    #$7FFF, R0                      ; 6824   03B8 00FF 007F
        SDBD                                    ; 6827   0001
        XORI    #$8000, R0                      ; 6828   03F8 0000 0080
        MVO@    R0,     R1                      ; 682B   0248
L_682C:
        PULR    R5                              ; 682C   02B5
        PULR    R3                              ; 682D   02B3
L_682E:
        PULR    R2                              ; 682E   02B2
        MOVR    R5,     R7                      ; 682F   00AF

        PSHR    R5                              ; 6830   0275
        PSHR    R0                              ; 6831   0270
        DECR    R0                              ; 6832   0010

        JSR     R5,     .EXEC.76C               ; 6833   0004 0114 036C

        ADDI    #$0006, R1                      ; 6836   02F9 0006
        MVI@    R1,     R0                      ; 6838   0288
        SDBD                                    ; 6839   0001
        ANDI    #$7FFF, R0                      ; 683A   03B8 00FF 007F
        MVO@    R0,     R1                      ; 683D   0248
        PULR    R0                              ; 683E   02B0
        SLR     R0,     2                       ; 683F   0064
        MOVR    R0,     R1                      ; 6840   0081
        MOVR    R0,     R2                      ; 6841   0082
        SDBD                                    ; 6842   0001
        ADDI    #$01CB, R1                      ; 6843   02F9 00CB 0001
        CLRR    R2                              ; 6846   01D2
        MVO@    R2,     R1                      ; 6847   024A
        MVO     R0,     G_012F                  ; 6848   0240 012F
        MVII    #$0010, R0                      ; 684A   02B8 0010
        COMR    R0                              ; 684C   0018
        AND     G_034C, R0                      ; 684D   0380 034C
        XORI    #$0010, R0                      ; 684F   03F8 0010
        MVO     R0,     G_034C                  ; 6851   0240 034C
        PULR    R7                              ; 6853   02B7

        PSHR    R5                              ; 6854   0275
        SLR     R0,     1                       ; 6855   0060
        BEQ     L_685A                          ; 6856   0204 0002

        MVII    #$0001, R0                      ; 6858   02B8 0001
L_685A:
        MOVR    R0,     R3                      ; 685A   0083
        CLRR    R0                              ; 685B   01C0

        JSR     R5,     L_6BF6                  ; 685C   0004 0168 03F6

        PULR    R7                              ; 685F   02B7

L_6860:
        MVI     G_01C9, R1                      ; 6860   0281 01C9
        TSTR    R1                              ; 6862   0089
        BEQ     L_689F                          ; 6863   0204 003A

        MVI     G_0117, R0                      ; 6865   0280 0117
        PSHR    R0                              ; 6867   0270
        SLL     R0,     1                       ; 6868   0048
        ADD@    R6,     R0                      ; 6869   02F0

        JSR     R5,     .EXEC.772               ; 686A   0004 0114 0372

        MVI     G_034C, R4                      ; 686D   0284 034C
        ANDI    #$0080, R4                      ; 686F   03BC 0080
        BEQ     L_688A                          ; 6871   0204 0017

        CMPI    #$000A, R2                      ; 6873   037A 000A
        BNC     L_68DE                          ; 6875   0209 0067

        CMPI    #$0067, R2                      ; 6877   037A 0067
        BNC     L_689F                          ; 6879   0209 0024

        MVI     G_0117, R5                      ; 687B   0285 0117
        XORI    #$0001, R5                      ; 687D   03FD 0001
        ADDI    #$0176, R5                      ; 687F   02FD 0176
        MVI@    R5,     R5                      ; 6881   02AD
        CMPI    #$0064, R5                      ; 6882   037D 0064
        BNC     L_689F                          ; 6884   0209 0019

L_6886:
        CLRR    R0                              ; 6886   01C0
        MVO     R0,     G_01C9                  ; 6887   0240 01C9
        PULR    R7                              ; 6889   02B7

L_688A:
        CMPI    #$00A0, R2                      ; 688A   037A 00A0
        BC      L_68DE                          ; 688C   0201 0050

        CMPI    #$003F, R2                      ; 688E   037A 003F
        BC      L_689F                          ; 6890   0201 000D

        MVI     G_0117, R5                      ; 6892   0285 0117
        XORI    #$0001, R5                      ; 6894   03FD 0001
        ADDI    #$0176, R5                      ; 6896   02FD 0176
        MVI@    R5,     R5                      ; 6898   02AD
        CMPI    #$0064, R5                      ; 6899   037D 0064
        BC      L_689F                          ; 689B   0201 0002
        B       L_6886                          ; 689D   0220 0018

L_689F:
        MVI     G_01CA, R1                      ; 689F   0281 01CA
        TSTR    R1                              ; 68A1   0089
        BEQ     L_67C8                          ; 68A2   0224 00DB

        MVI     G_0117, R0                      ; 68A4   0280 0117
        PSHR    R0                              ; 68A6   0270
        SLL     R0,     1                       ; 68A7   0048
        ADD@    R6,     R0                      ; 68A8   02F0

        JSR     R5,     .EXEC.772               ; 68A9   0004 0114 0372

        MVI     G_034C, R4                      ; 68AC   0284 034C
        ANDI    #$0040, R4                      ; 68AE   03BC 0040
        BEQ     L_68C9                          ; 68B0   0204 0017

        CMPI    #$000A, R3                      ; 68B2   037B 000A
        BNC     L_68DE                          ; 68B4   0209 0028

        CMPI    #$003D, R3                      ; 68B6   037B 003D
        BNC     L_67C8                          ; 68B8   0229 00F1

        MVI     G_0117, R5                      ; 68BA   0285 0117
        XORI    #$0001, R5                      ; 68BC   03FD 0001
        ADDI    #$0178, R5                      ; 68BE   02FD 0178
        MVI@    R5,     R5                      ; 68C0   02AD
        CMPI    #$0064, R5                      ; 68C1   037D 0064
        BNC     L_67C8                          ; 68C3   0229 00FC

L_68C5:
        CLRR    R0                              ; 68C5   01C0
        MVO     R0,     G_01CA                  ; 68C6   0240 01CA
        PULR    R7                              ; 68C8   02B7

L_68C9:
        CMPI    #$0060, R3                      ; 68C9   037B 0060
        BC      L_68DE                          ; 68CB   0201 0011

        CMPI    #$0029, R3                      ; 68CD   037B 0029
        BC      L_67C8                          ; 68CF   0221 0108

        MVI     G_0117, R5                      ; 68D1   0285 0117
        XORI    #$0001, R5                      ; 68D3   03FD 0001
        ADDI    #$0178, R5                      ; 68D5   02FD 0178
        MVI@    R5,     R5                      ; 68D7   02AD
        CMPI    #$0064, R5                      ; 68D8   037D 0064
        BC      L_67C8                          ; 68DA   0221 0113
        B       L_68C5                          ; 68DC   0220 0018

L_68DE:
        MVI     G_0117, R3                      ; 68DE   0283 0117
        XORI    #$0001, R3                      ; 68E0   03FB 0001
        PSHR    R3                              ; 68E2   0273

        JSR     R5,     L_5339                  ; 68E3   0004 0150 0339

        PULR    R1                              ; 68E6   02B1
        MOVR    R1,     R2                      ; 68E7   008A
        SLL     R2,     2                       ; 68E8   004E
        SLL     R2,     1                       ; 68E9   004A
        ADDI    #$0324, R2                      ; 68EA   02FA 0324
        MVII    #$0004, R0                      ; 68EC   02B8 0004
        ADDI    #$0180, R1                      ; 68EE   02F9 0180
        MVO@    R0,     R1                      ; 68F0   0248
        CLRR    R0                              ; 68F1   01C0
        MVO@    R0,     R2                      ; 68F2   0250
        MVO     R0,     G_0163                  ; 68F3   0240 0163
        MVO     R0,     G_01C9                  ; 68F5   0240 01C9
        MVO     R0,     G_01CA                  ; 68F7   0240 01CA
        MVO     R0,     G_01CB                  ; 68F9   0240 01CB
        MVO     R0,     G_01CC                  ; 68FB   0240 01CC
        MVI     G_0117, R0                      ; 68FD   0280 0117

        JSR     R5,     L_66E8                  ; 68FF   0004 0164 02E8

        PULR    R7                              ; 6902   02B7

        PSHR    R5                              ; 6903   0275
        PSHR    R0                              ; 6904   0270
        SDBD                                    ; 6905   0001
        MVII    #$0603, R4                      ; 6906   02BC 0003 0006

        JSR     R5,     .EXEC.70F               ; 6909   0004 0114 030F

        PULR    R0                              ; 690C   02B0
        BNC     L_691C                          ; 690D   0209 000D

        MVII    #$0001, R0                      ; 690F   02B8 0001
        CLRR    R3                              ; 6911   01DB

        JSR     R5,     L_6BF6                  ; 6912   0004 0168 03F6

        MVII    #$0001, R0                      ; 6915   02B8 0001
        MVII    #$0001, R3                      ; 6917   02BB 0001

        JSR     R5,     L_6BF6                  ; 6919   0004 0168 03F6

L_691C:
        PULR    R7                              ; 691C   02B7

L_691D:
        PSHR    R5                              ; 691D   0275
        CLRR    R1                              ; 691E   01C9
        MVII    #$0002, R0                      ; 691F   02B8 0002
        MVII    #$0324, R2                      ; 6921   02BA 0324
L_6923:
        MVII    #$0008, R3                      ; 6923   02BB 0008
        MOVR    R1,     R4                      ; 6925   008C

        JSR     R5,     L_6CC9                  ; 6926   0004 016C 00C9

        BEQ     L_6934                          ; 6929   0204 0009

        MVI@    R2,     R5                      ; 692B   0295
        SDBD                                    ; 692C   0001
        CMPI    #$0F9C, R5                      ; 692D   037D 009C 000F
        BEQ     L_6934                          ; 6930   0204 0002

        INCR    R5                              ; 6932   000D
        MVO@    R5,     R2                      ; 6933   0255
L_6934:
        INCR    R1                              ; 6934   0009
        ADDI    #$0008, R2                      ; 6935   02FA 0008
        DECR    R0                              ; 6937   0010
        BNEQ    L_6923                          ; 6938   022C 0016

        MVI     G_0134, R0                      ; 693A   0280 0134
        CMPI    #$0044, R0                      ; 693C   0378 0044
        BNC     L_691C                          ; 693E   0229 0023

        CMPI    #$0056, R0                      ; 6940   0378 0056
        BC      L_691C                          ; 6942   0221 0027

        MVI     G_0135, R0                      ; 6944   0280 0135
        CMPI    #$0000, R0                      ; 6946   0378 0000
        BNC     L_691C                          ; 6948   0229 002D

        CMPI    #$000B, R0                      ; 694A   0378 000B
        BC      L_691C                          ; 694C   0221 0031

        MVII    #$031D, R4                      ; 694E   02BC 031D
        SUB     G_0134, R4                      ; 6950   0304 0134
        MVI     G_0135, R0                      ; 6952   0280 0135
        SLL     R0,     2                       ; 6954   004C
        PSHR    R0                              ; 6955   0270
        SLL     R0,     2                       ; 6956   004C
        ADD@    R6,     R0                      ; 6957   02F0
        SUBR    R0,     R4                      ; 6958   0104
        MVII    #$0003, R1                      ; 6959   02B9 0003
        MVI     G_0324, R0                      ; 695B   0280 0324
        MVII    #$0002, R3                      ; 695D   02BB 0002
        SLR     R0,     2                       ; 695F   0064
        MVI     G_0180, R5                      ; 6960   0285 0180
        CMPI    #$0004, R5                      ; 6962   037D 0004
        BEQ     L_696B                          ; 6964   0204 0005

        JSR     R5,     X_PRNUM_RGT             ; 6966   0004 0118 00C5

        B       L_6977                          ; 6969   0200 000C

L_696B:
        CLRR    R0                              ; 696B   01C0
        MVI     G_034C, R3                      ; 696C   0283 034C
        ANDI    #$0020, R3                      ; 696E   03BB 0020
        BNEQ    L_6977                          ; 6970   020C 0005

        MVO@    R0,     R4                      ; 6972   0260
        MVO@    R0,     R4                      ; 6973   0260
        MVO@    R0,     R4                      ; 6974   0260
        SUBI    #$0003, R4                      ; 6975   033C 0003
L_6977:
        MVI     G_0181, R5                      ; 6977   0285 0181
        ADDI    #$0014, R4                      ; 6979   02FC 0014
        CMPI    #$0004, R5                      ; 697B   037D 0004
        BEQ     L_698A                          ; 697D   0204 000B

        MVI     G_032C, R0                      ; 697F   0280 032C
        MVII    #$0000, R3                      ; 6981   02BB 0000
        SLR     R0,     2                       ; 6983   0064

        JSR     R5,     X_PRNUM_RGT             ; 6984   0004 0118 00C5

        B       L_691C                          ; 6987   0220 006C
        PULR    R7                              ; 6989   02B7

L_698A:
        CLRR    R0                              ; 698A   01C0
        MVI     G_034C, R3                      ; 698B   0283 034C
        ANDI    #$0020, R3                      ; 698D   03BB 0020
        BNEQ    L_691C                          ; 698F   022C 0074

        MVO@    R0,     R4                      ; 6991   0260
        MVO@    R0,     R4                      ; 6992   0260
        MVO@    R0,     R4                      ; 6993   0260
        PULR    R7                              ; 6994   02B7

L_6995:
        PSHR    R5                              ; 6995   0275
        MVII    #$0002, R5                      ; 6996   02BD 0002
        SDBD                                    ; 6998   0001
        MVII    #$01CD, R1                      ; 6999   02B9 00CD 0001
        MVII    #$017A, R2                      ; 699C   02BA 017A
        MVII    #$0316, R3                      ; 699E   02BB 0316
L_69A0:
        MVII    #$0003, R4                      ; 69A0   02BC 0003
        MVI@    R2,     R0                      ; 69A2   0290
        CMP@    R1,     R0                      ; 69A3   0348
        MVO@    R0,     R1                      ; 69A4   0248
        BMI     L_69AB                          ; 69A5   020B 0004
        BEQ     L_69AC                          ; 69A7   0204 0003
        B       L_69AD                          ; 69A9   0200 0002

L_69AB:
        DECR    R4                              ; 69AB   0014
L_69AC:
        DECR    R4                              ; 69AC   0014
L_69AD:
        CMPI    #$0002, R0                      ; 69AD   0378 0002
        BC      L_69B2                          ; 69AF   0201 0001

        CLRR    R4                              ; 69B1   01E4
L_69B2:
        MVO@    R4,     R3                      ; 69B2   025C
        INCR    R1                              ; 69B3   0009
        INCR    R2                              ; 69B4   000A
        INCR    R3                              ; 69B5   000B
        DECR    R5                              ; 69B6   0015
        BNEQ    L_69A0                          ; 69B7   022C 0018

        MVI     G_01CB, R4                      ; 69B9   0284 01CB
        TSTR    R4                              ; 69BB   00A4
        BNEQ    L_69E0                          ; 69BC   020C 0022

        MVI     G_01CC, R4                      ; 69BE   0284 01CC
        TSTR    R4                              ; 69C0   00A4
        BNEQ    L_69E0                          ; 69C1   020C 001D

        MVI     G_0180, R4                      ; 69C3   0284 0180
        CMPI    #$0004, R4                      ; 69C5   037C 0004
        BEQ     L_69E0                          ; 69C7   0204 0017

        MVI     G_0181, R4                      ; 69C9   0284 0181
        CMPI    #$0004, R4                      ; 69CB   037C 0004
        BEQ     L_69E0                          ; 69CD   0204 0011

        CLRR    R0                              ; 69CF   01C0
        MVI     G_0163, R1                      ; 69D0   0281 0163
        SWAP    R1,     2                       ; 69D2   0045
        BEQ     L_69E0                          ; 69D3   0204 000B
        BPL     L_69D8                          ; 69D5   0203 0001

        INCR    R0                              ; 69D7   0008
L_69D8:
        MVI     G_012F, R3                      ; 69D8   0283 012F
        CMPR    R0,     R3                      ; 69DA   0143
        BEQ     L_69E0                          ; 69DB   0204 0003

        JSR     R5,     L_66E8                  ; 69DD   0004 0164 02E8

L_69E0:
        PULR    R7                              ; 69E0   02B7

L_69E1:
        PSHR    R5                              ; 69E1   0275

        JSR     R5,     X_PLAY_SFX2             ; 69E2   0004 0118 03BE
        DECLE   $0014                           ; 69E5  SFX prio
        DECLE   $005D                           ; 69E6  SFX data
        DECLE   $0299                           ; 69E7  SFX data
        DECLE   $014D                           ; 69E8  SFX data
        DECLE   $0368,  $03B8                   ; 69E9  SFX data
        DECLE   $0364,  $02F0                   ; 69EB  SFX data
        DECLE   $0077,  $00F5,  $0069           ; 69ED  SFX data
        DECLE   $0077,  $00FE,  $0069           ; 69F0  SFX data
        DECLE   $0023,  $03E2                   ; 69F3  SFX data
UC_69F5:
        MVI     G_0316, R1                      ; 69F5  SLIB UCALL target
        MVII    #$01D1, R2                      ; 69F7   02BA 01D1
        CLRR    R3                              ; 69F9   01DB

L_69FA:
        JSR     R5,     L_6A74                  ; 69FA   0004 0168 0274

        PULR    R7                              ; 69FD   02B7

UC_69FE:
        MVI     G_0317, R1                      ; 69FE  SLIB UCALL target
        MVII    #$01D3, R2                      ; 6A00   02BA 01D3
        MOVR    R6,     R3                      ; 6A02   00B3
        B       L_69FA                          ; 6A03   0220 000A

L_6A05:
        PSHR    R5                              ; 6A05   0275

        JSR     R5,     X_PLAY_SFX2             ; 6A06   0004 0118 03BE
        DECLE   $0014                           ; 6A09  SFX prio
        DECLE   $003D,  $0369,  $0005           ; 6A0A   003D 0369 0005

        SAR     R3,     1                       ; 6A0D   006B
        CMP     G_03E8, R0                      ; 6A0E   0340 03E8
        NEGR    R3                              ; 6A10   0023
        XOR@    R4,     R5                      ; 6A11   03E5
        MOVR    R7,     R0                      ; 6A12   00B8
        INCR    R3                              ; 6A13   000B
        MOVR    R0,     R4                      ; 6A14   0084
        DIS                                     ; 6A15   0003
        INCR    R7                              ; 6A16   000F

        DECLE   $0000                           ; 6A17   0000
L_6A18:
        ADDR    R2,     R0                      ; 6A18   00D0
        DECLE   $0007,  $0023,  $0003,  $0009   ; 6A19   0007 0023 0003 0009
        DECLE   $0000,  $0008,  $0007,  $005B   ; 6A1D   0000 0008 0007 005B
        DECLE   $0002,  $0009,  $0000           ; 6A21   0002 0009 0000

        ADDR    R6,     R0                      ; 6A24   00F0
        INCR    R2                              ; 6A25   000A
        MOVR    R7,     R4                      ; 6A26   00BC
        EIS                                     ; 6A27   0002
        INCR    R7                              ; 6A28   000F

        DECLE   $0000                           ; 6A29   0000
L_6A2A:
        INCR    R0                              ; 6A2A   0008
        DECLE   $0007,  $005B,  $0002,  $0009   ; 6A2B   0007 005B 0002 0009
        DECLE   $0000,  $00A4,  $0006,  $00F7   ; 6A2F   0000 00A4 0006 00F7
        DECLE   $0001,  $0009,  $0000           ; 6A33   0001 0009 0000

        INCR    R7                              ; 6A36   000F

        COMR    R1                              ; 6A37   0019
L_6A38:
        INCR    R6                              ; 6A38   000E
        INCR    R7                              ; 6A39   000F

        INCR    R5                              ; 6A3A   000D
L_6A3B:
        INCR    R0                              ; 6A3B   0008
        DECLE   $000C,  $0004,  $000B,  $0002   ; 6A3C   000C 0004 000B 0002
        DECLE   $000A,  $0002,  $0009,  $0002   ; 6A40   000A 0002 0009 0002
        DECLE   $0008,  $0002,  $0007,  $0002   ; 6A44   0008 0002 0007 0002
        DECLE   $0006,  $0001,  $0005,  $0001   ; 6A48   0006 0001 0005 0001
        DECLE   $03FF                           ; 6A4C   03FF

        CLRC                                    ; 6A4D   0006
        INCR    R4                              ; 6A4E   000C
        SETC                                    ; 6A4F   0007
        INCR    R4                              ; 6A50   000C
        INCR    R0                              ; 6A51   0008
        INCR    R4                              ; 6A52   000C
        INCR    R1                              ; 6A53   0009
        INCR    R4                              ; 6A54   000C
        INCR    R2                              ; 6A55   000A
        INCR    R4                              ; 6A56   000C
        INCR    R3                              ; 6A57   000B
        INCR    R4                              ; 6A58   000C
        INCR    R4                              ; 6A59   000C
        INCR    R4                              ; 6A5A   000C
        INCR    R5                              ; 6A5B   000D
        INCR    R4                              ; 6A5C   000C
        INCR    R6                              ; 6A5D   000E
        INCR    R4                              ; 6A5E   000C
        INCR    R7                              ; 6A5F   000F

        INCR    R4                              ; 6A60   000C
L_6A61:
        INCR    R6                              ; 6A61   000E
        DECLE   $000C,  $000D,  $000C,  $000B   ; 6A62   000C 000D 000C 000B
        DECLE   $000C,  $000A,  $000C,  $0009   ; 6A66   000C 000A 000C 0009
        DECLE   $000C,  $0008,  $000C,  $0007   ; 6A6A   000C 0008 000C 0007
        DECLE   $000C,  $0006,  $000C,  $0005   ; 6A6E   000C 0006 000C 0005
        DECLE   $000C,  $03FF                   ; 6A72   000C 03FF
L_6A74:
        PSHR    R5                              ; 6A74   0275
        PSHR    R4                              ; 6A75   0274
        MOVR    R2,     R4                      ; 6A76   0094
        INCR    R1                              ; 6A77   0009
        ADDR    R7,     R1                      ; 6A78   00F9
        ADD@    R1,     R7                      ; 6A79   02CF

        DECLE   $00D6,  $007C,  $0077,  $0004   ; 6A7A   00D6 007C 0077 0004

        JSR     R5,     L_6B72                  ; 6A7E   0004 0168 0372

        SDBD                                    ; 6A81   0001
        MVI@    R4,     R1                      ; 6A82   02A1
        TSTR    R3                              ; 6A83   009B
        BNEQ    L_6ACA                          ; 6A84   020C 0044

        MVII    #$000D, R0                      ; 6A86   02B8 000D
        MVO     R0,     .PSG0.chn_b_vol         ; 6A88   0240 01FC
        SDBD                                    ; 6A8A   0001
        MVII    #$6A12, R5                      ; 6A8B   02BD 0012 006A
        ADD     G_01CF, R5                      ; 6A8E   02C5 01CF
        ADDI    #$0002, R5                      ; 6A90   02FD 0002
        SDBD                                    ; 6A92   0001
        CMP@    R5,     R1                      ; 6A93   0369
        BLE     L_6AB7                          ; 6A94   0206 0021

        SDBD                                    ; 6A96   0001
        SUB@    R5,     R1                      ; 6A97   0329
L_6A98:
        SUBI    #$0002, R4                      ; 6A98   033C 0002
L_6A9A:
        SDBD                                    ; 6A9A   0001
        ANDI    #$0FFF, R1                      ; 6A9B   03B9 00FF 000F
        MVO@    R1,     R4                      ; 6A9E   0261
        SWAP    R1,     1                       ; 6A9F   0041
        MVO@    R1,     R4                      ; 6AA0   0261
        MOVR    R1,     R2                      ; 6AA1   008A
        SWAP    R1,     1                       ; 6AA2   0041
        ANDI    #$00FF, R1                      ; 6AA3   03B9 00FF
        TSTR    R3                              ; 6AA5   009B
        BNEQ    L_6AAE                          ; 6AA6   020C 0006

        MVO     R1,     .PSG0.chn_b_lo          ; 6AA8   0241 01F1
        MVO     R2,     .PSG0.chn_b_hi          ; 6AAA   0242 01F5
        B       L_6AB2                          ; 6AAC   0200 0004

L_6AAE:
        MVO     R1,     .PSG0.chn_c_lo          ; 6AAE   0241 01F2
        MVO     R2,     .PSG0.chn_c_hi          ; 6AB0   0242 01F6

L_6AB2:
        JSR     R5,     L_6B8F                  ; 6AB2   0004 0168 038F

        PULR    R4                              ; 6AB5   02B4
        PULR    R7                              ; 6AB6   02B7

L_6AB7:
        MVI     G_01CF, R2                      ; 6AB7   0282 01CF
        ADDI    #$0006, R2                      ; 6AB9   02FA 0006
        CMPI    #$000C, R2                      ; 6ABB   037A 000C
        BGT     L_6AF1                          ; 6ABD   020E 0032

        MVO     R2,     G_01CF                  ; 6ABF   0242 01CF
        SDBD                                    ; 6AC1   0001
        MVII    #$6A12, R5                      ; 6AC2   02BD 0012 006A
        ADDR    R2,     R5                      ; 6AC5   00D5
        SDBD                                    ; 6AC6   0001
        MVI@    R5,     R1                      ; 6AC7   02A9
        B       L_6A98                          ; 6AC8   0220 0031

L_6ACA:
        MVII    #$000D, R0                      ; 6ACA   02B8 000D
        MVO     R0,     .PSG0.chn_c_vol         ; 6ACC   0240 01FD
        SDBD                                    ; 6ACE   0001
        MVII    #$6A24, R5                      ; 6ACF   02BD 0024 006A
        ADD     G_01D0, R5                      ; 6AD2   02C5 01D0
        ADDI    #$0002, R5                      ; 6AD4   02FD 0002
        SDBD                                    ; 6AD6   0001
        CMP@    R5,     R1                      ; 6AD7   0369
        BLE     L_6ADE                          ; 6AD8   0206 0004

        SDBD                                    ; 6ADA   0001
        SUB@    R5,     R1                      ; 6ADB   0329
        B       L_6A98                          ; 6ADC   0220 0045

L_6ADE:
        MVI     G_01D0, R2                      ; 6ADE   0282 01D0
        ADDI    #$0006, R2                      ; 6AE0   02FA 0006
        CMPI    #$000C, R2                      ; 6AE2   037A 000C
        BGT     L_6AF1                          ; 6AE4   020E 000B

        MVO     R2,     G_01D0                  ; 6AE6   0242 01D0
        SDBD                                    ; 6AE8   0001
        MVII    #$6A24, R5                      ; 6AE9   02BD 0024 006A
        ADDR    R2,     R5                      ; 6AEC   00D5
        SDBD                                    ; 6AED   0001
        MVI@    R5,     R1                      ; 6AEE   02A9
        B       L_6A98                          ; 6AEF   0220 0058

L_6AF1:
        JSR     R5,     L_6B72                  ; 6AF1   0004 0168 0372

        B       L_6AB2                          ; 6AF4   0220 0043

        JSR     R5,     L_6B72                  ; 6AF6   0004 0168 0372

        SDBD                                    ; 6AF9   0001
        MVI@    R4,     R1                      ; 6AFA   02A1
        TSTR    R3                              ; 6AFB   009B
        BNEQ    L_6B27                          ; 6AFC   020C 0029

        MVII    #$000D, R0                      ; 6AFE   02B8 000D
        MVO     R0,     .PSG0.chn_b_vol         ; 6B00   0240 01FC
        SDBD                                    ; 6B02   0001
        MVII    #$6A12, R5                      ; 6B03   02BD 0012 006A
        ADD     G_01CF, R5                      ; 6B06   02C5 01CF
        SDBD                                    ; 6B08   0001
        CMP@    R5,     R1                      ; 6B09   0369
        BGE     L_6B14                          ; 6B0A   020D 0008

        ADDI    #$0002, R5                      ; 6B0C   02FD 0002
        SDBD                                    ; 6B0E   0001
        MVI@    R5,     R0                      ; 6B0F   02A8
        SLL     R0,     1                       ; 6B10   0048
        ADDR    R0,     R1                      ; 6B11   00C1
        B       L_6A98                          ; 6B12   0220 007B

L_6B14:
        MVI     G_01CF, R2                      ; 6B14   0282 01CF
        SUBI    #$0006, R2                      ; 6B16   033A 0006
        BMI     L_6AF1                          ; 6B18   022B 0028

        MVO     R2,     G_01CF                  ; 6B1A   0242 01CF
        SDBD                                    ; 6B1C   0001
        MVII    #$6A12, R5                      ; 6B1D   02BD 0012 006A
        ADDR    R2,     R5                      ; 6B20   00D5
        ADDI    #$0002, R5                      ; 6B21   02FD 0002
        SDBD                                    ; 6B23   0001
        MVI@    R5,     R1                      ; 6B24   02A9
        B       L_6A98                          ; 6B25   0220 008E

L_6B27:
        MVII    #$000D, R0                      ; 6B27   02B8 000D
        MVO     R0,     .PSG0.chn_c_vol         ; 6B29   0240 01FD
        SDBD                                    ; 6B2B   0001
        MVII    #$6A24, R5                      ; 6B2C   02BD 0024 006A
        ADD     G_01D0, R5                      ; 6B2F   02C5 01D0
        SDBD                                    ; 6B31   0001
        CMP@    R5,     R1                      ; 6B32   0369
        BGE     L_6B3D                          ; 6B33   020D 0008

        ADDI    #$0002, R5                      ; 6B35   02FD 0002
        SDBD                                    ; 6B37   0001
        MVI@    R5,     R0                      ; 6B38   02A8
        SLL     R0,     1                       ; 6B39   0048
        ADDR    R0,     R1                      ; 6B3A   00C1
        B       L_6A98                          ; 6B3B   0220 00A4

L_6B3D:
        MVI     G_01D0, R2                      ; 6B3D   0282 01D0
        SUBI    #$0006, R2                      ; 6B3F   033A 0006
        BMI     L_6AF1                          ; 6B41   022B 0051

        MVO     R2,     G_01D0                  ; 6B43   0242 01D0
        SDBD                                    ; 6B45   0001
        MVII    #$6A24, R5                      ; 6B46   02BD 0024 006A
        ADDR    R2,     R5                      ; 6B49   00D5
        ADDI    #$0002, R5                      ; 6B4A   02FD 0002
        SDBD                                    ; 6B4C   0001
        MVI@    R5,     R1                      ; 6B4D   02A9
        B       L_6A98                          ; 6B4E   0220 00B7

        TSTR    R3                              ; 6B50   009B
        BNEQ    L_6B62                          ; 6B51   020C 000F

        MVO     R3,     .PSG0.chn_b_vol         ; 6B53   0243 01FC
        MVO     R3,     G_01CF                  ; 6B55   0243 01CF

        JSR     R5,     L_6B72                  ; 6B57   0004 0168 0372

        SDBD                                    ; 6B5A   0001
        MVII    #$6A12, R5                      ; 6B5B   02BD 0012 006A
        SDBD                                    ; 6B5E   0001
        MVI@    R5,     R1                      ; 6B5F   02A9
        B       L_6A9A                          ; 6B60   0220 00C7

L_6B62:
        CLRR    R1                              ; 6B62   01C9
        MVO     R1,     .PSG0.chn_c_vol         ; 6B63   0241 01FD
        MVO     R1,     G_01D0                  ; 6B65   0241 01D0

        JSR     R5,     L_6B72                  ; 6B67   0004 0168 0372

        SDBD                                    ; 6B6A   0001
        MVII    #$6A24, R5                      ; 6B6B   02BD 0024 006A
        SDBD                                    ; 6B6E   0001
        MVI@    R5,     R1                      ; 6B6F   02A9
        B       L_6A9A                          ; 6B70   0220 00D7

L_6B72:
        PSHR    R5                              ; 6B72   0275
        PSHR    R3                              ; 6B73   0273
        MVII    #$01F8, R2                      ; 6B74   02BA 01F8
        MVI@    R2,     R0                      ; 6B76   0290
        MVII    #$01FC, R2                      ; 6B77   02BA 01FC
        MVI@    R2,     R3                      ; 6B79   0293
        TSTR    R3                              ; 6B7A   009B
        BEQ     L_6B89                          ; 6B7B   0204 000C

        MVII    #$00DF, R3                      ; 6B7D   02BB 00DF
        MVII    #$00EF, R5                      ; 6B7F   02BD 00EF
L_6B81:
        COMR    R0                              ; 6B81   0018
        ANDR    R3,     R0                      ; 6B82   0198
        COMR    R0                              ; 6B83   0018
        ANDR    R5,     R0                      ; 6B84   01A8
        MVO     R0,     .PSG0.chan_enable       ; 6B85   0240 01F8
        PULR    R3                              ; 6B87   02B3
        PULR    R7                              ; 6B88   02B7

L_6B89:
        MVII    #$00EF, R3                      ; 6B89   02BB 00EF
        MVII    #$00DF, R5                      ; 6B8B   02BD 00DF
        B       L_6B81                          ; 6B8D   0220 000D

L_6B8F:
        PSHR    R5                              ; 6B8F   0275
        MVI     G_01DA, R1                      ; 6B90   0281 01DA
        TSTR    R1                              ; 6B92   0089
        BNEQ    L_6B97                          ; 6B93   020C 0002
        B       L_6BE4                          ; 6B95   0200 004D
L_6B97:
        ADDR    R1,     R7                      ; 6B97   00CF

        DECLE   $0000,  $0000                   ; 6B98   0000 0000

        B       L_6BA0                          ; 6B9A   0200 0004
        B       L_6BCB                          ; 6B9C   0200 002D
        B       L_6BE3                          ; 6B9E   0200 0043

L_6BA0:
        CLRR    R1                              ; 6BA0   01C9
        MVO     R1,     G_01DA                  ; 6BA1   0241 01DA
        MVII    #$00FE, R3                      ; 6BA3   02BB 00FE
        MVII    #$00F7, R5                      ; 6BA5   02BD 00F7
        SDBD                                    ; 6BA7   0001
        MVII    #$6BB2, R2                      ; 6BA8   02BA 00B2 006B
        PSHR    R2                              ; 6BAB   0272
        PSHR    R3                              ; 6BAC   0273
        MVII    #$01F8, R2                      ; 6BAD   02BA 01F8
        MVI@    R2,     R0                      ; 6BAF   0290
        B       L_6B81                          ; 6BB0   0220 0030

        SDBD                                    ; 6BB2   0001
        MVII    #$6A36, R4                      ; 6BB3   02BC 0036 006A
L_6BB6:
        MVI@    R4,     R1                      ; 6BB6   02A1
        CMPI    #$03FF, R1                      ; 6BB7   0379 03FF
        BNEQ    L_6BBF                          ; 6BB9   020C 0004

        CLRR    R1                              ; 6BBB   01C9
        MVO     R1,     .PSG0.chn_a_vol         ; 6BBC   0241 01FB
        PULR    R7                              ; 6BBE   02B7

L_6BBF:
        MVO     R1,     .PSG0.chn_a_vol         ; 6BBF   0241 01FB
        MVI@    R4,     R1                      ; 6BC1   02A1
        MVO     R1,     G_01D9                  ; 6BC2   0241 01D9
        MOVR    R4,     R1                      ; 6BC4   00A1
        MVO     R1,     G_01D7                  ; 6BC5   0241 01D7
        SWAP    R1,     1                       ; 6BC7   0041
        MVO     R1,     G_01D8                  ; 6BC8   0241 01D8
        PULR    R7                              ; 6BCA   02B7

L_6BCB:
        CLRR    R1                              ; 6BCB   01C9
        MVO     R1,     G_01DA                  ; 6BCC   0241 01DA
        MVII    #$00FE, R3                      ; 6BCE   02BB 00FE
        MVII    #$00F7, R5                      ; 6BD0   02BD 00F7
        SDBD                                    ; 6BD2   0001
        MVII    #$6BDD, R2                      ; 6BD3   02BA 00DD 006B
        PSHR    R2                              ; 6BD6   0272
        PSHR    R3                              ; 6BD7   0273
        MVII    #$01F8, R2                      ; 6BD8   02BA 01F8
        MVI@    R2,     R0                      ; 6BDA   0290
        B       L_6B81                          ; 6BDB   0220 005B

        SDBD                                    ; 6BDD   0001
        MVII    #$6A4D, R4                      ; 6BDE   02BC 004D 006A
        B       L_6BB6                          ; 6BE1   0220 002C
L_6BE3:
        PULR    R7                              ; 6BE3   02B7

L_6BE4:
        MVI     G_01D9, R0                      ; 6BE4   0280 01D9
        DECR    R0                              ; 6BE6   0010
        BEQ     L_6BEE                          ; 6BE7   0204 0005
        BMI     L_6BED                          ; 6BE9   020B 0002

        MVO     R0,     G_01D9                  ; 6BEB   0240 01D9
L_6BED:
        PULR    R7                              ; 6BED   02B7

L_6BEE:
        MVO     R0,     G_01D9                  ; 6BEE   0240 01D9
        MVII    #$01D7, R5                      ; 6BF0   02BD 01D7
        SDBD                                    ; 6BF2   0001
        MVI@    R5,     R4                      ; 6BF3   02AC
        B       L_6BB6                          ; 6BF4   0220 003F

L_6BF6:
        PSHR    R5                              ; 6BF6   0275
        PSHR    R0                              ; 6BF7   0270
        MVII    #$0003, R0                      ; 6BF8   02B8 0003
        ADDI    #$0180, R3                      ; 6BFA   02FB 0180
        MVI@    R3,     R1                      ; 6BFC   0299

        JSR     R5,     X_MPY                   ; 6BFD   0004 011C 01DC

        ADD@    R6,     R2                      ; 6C00   02F2
        SDBD                                    ; 6C01   0001
        ADDI    #$6F98, R2                      ; 6C02   02FA 0098 006F
        MVI@    R2,     R0                      ; 6C05   0290
        SLR     R0,     2                       ; 6C06   0064
        SLR     R0,     2                       ; 6C07   0064
        NOP                                     ; 6C08   0034
        SLR     R0,     1                       ; 6C09   0060
        CMPI    #$001F, R0                      ; 6C0A   0378 001F
        BEQ     L_6C2E                          ; 6C0C   0204 0020

        MVO@    R0,     R3                      ; 6C0E   0258
        MOVR    R0,     R4                      ; 6C0F   0084
        MOVR    R0,     R1                      ; 6C10   0081
        SDBD                                    ; 6C11   0001
        ADDI    #$6FE6, R1                      ; 6C12   02F9 00E6 006F
        MVI@    R1,     R2                      ; 6C15   028A
        SLR     R2,     2                       ; 6C16   0066
        NOP                                     ; 6C17   0034
        SLR     R2,     1                       ; 6C18   0062
        SLR     R2,     2                       ; 6C19   0066
        SUBI    #$0180, R3                      ; 6C1A   033B 0180
        MOVR    R3,     R0                      ; 6C1C   0098
        PSHR    R0                              ; 6C1D   0270
        SLL     R0,     1                       ; 6C1E   0048
        ADD@    R6,     R0                      ; 6C1F   02F0

        JSR     R5,     .EXEC.76C               ; 6C20   0004 0114 036C

        ADDI    #$000E, R1                      ; 6C23   02F9 000E
        MVO@    R2,     R1                      ; 6C25   024A
        ADDR    R4,     R4                      ; 6C26   00E4
        SDBD                                    ; 6C27   0001
        ADDI    #$6C35, R4                      ; 6C28   02FC 0035 006C

        JSR     R5,     L_6C2F                  ; 6C2B   0004 016C 002F

L_6C2E:
        PULR    R7                              ; 6C2E   02B7

L_6C2F:
        SDBD                                    ; 6C2F   0001
        MVI@    R4,     R2                      ; 6C30   02A2
        TSTR    R2                              ; 6C31   0092
        BEQ     L_6C2E                          ; 6C32   0224 0005
        MOVR    R2,     R7                      ; 6C34   0097

        DECLE   $0034,  $0053,  $0034,  $0053   ; 6C35   0034 0053 0034 0053
        DECLE   $0034,  $0053,  $0034,  $0053   ; 6C39   0034 0053 0034 0053
        DECLE   $0039,  $0053,  $0069,  $006C   ; 6C3D   0039 0053 0069 006C
        DECLE   $0069,  $006C,  $008C,  $006C   ; 6C41   0069 006C 008C 006C
        DECLE   $008C,  $006C,  $0050,  $0053   ; 6C45   008C 006C 0050 0053
        DECLE   $0050,  $0053,  $0098,  $006C   ; 6C49   0050 0053 0098 006C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C4D   0000 0000 0000 0000
        DECLE   $0098,  $006C,  $0000,  $0000   ; 6C51   0098 006C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C55   0000 0000 0000 0000
        DECLE   $0091,  $006C,  $0091,  $006C   ; 6C59   0091 006C 0091 006C
        DECLE   $00B6,  $006C,  $00B6,  $006C   ; 6C5D   00B6 006C 00B6 006C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C65   0000 0000 0000 0000

        PSHR    R5                              ; 6C69   0275
        PSHR    R3                              ; 6C6A   0273
        MOVR    R3,     R2                      ; 6C6B   009A
        ADDI    #$017A, R2                      ; 6C6C   02FA 017A
        MVI@    R2,     R0                      ; 6C6E   0290
        MVI     G_0174, R1                      ; 6C6F   0281 0174
        SLL     R3,     2                       ; 6C71   004F
        DECR    R3                              ; 6C72   0013
        DECR    R3                              ; 6C73   0013
        ADDR    R3,     R1                      ; 6C74   00D9
        PULR    R3                              ; 6C75   02B3
        ANDI    #$000F, R1                      ; 6C76   03B9 000F
        CMPI    #$0003, R0                      ; 6C78   0378 0003
        BC      L_6C7E                          ; 6C7A   0201 0002

        MVII    #$0003, R0                      ; 6C7C   02B8 0003

L_6C7E:
        JSR     R5,     .EXEC.629               ; 6C7E   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 6C81   0004 0114 0357

        MOVR    R3,     R4                      ; 6C84   009C
        ADDI    #$0176, R3                      ; 6C85   02FB 0176
        ADDI    #$0178, R4                      ; 6C87   02FC 0178
        MVO@    R0,     R3                      ; 6C89   0258
        MVO@    R1,     R4                      ; 6C8A   0261
        PULR    R5                              ; 6C8B   02B5
        MVII    #$0002, R0                      ; 6C8C   02B8 0002
        MVO     R0,     G_01DA                  ; 6C8E   0240 01DA
        MOVR    R5,     R7                      ; 6C90   00AF

L_6C91:
        ADDI    #$0172, R3                      ; 6C91   02FB 0172
        MVI@    R3,     R0                      ; 6C93   0298
        ADDI    #$0002, R3                      ; 6C94   02FB 0002
        MVO@    R0,     R3                      ; 6C96   0258
        MOVR    R5,     R7                      ; 6C97   00AF

        PSHR    R5                              ; 6C98   0275
        PSHR    R3                              ; 6C99   0273
        ADDI    #$0176, R3                      ; 6C9A   02FB 0176
        MVI@    R3,     R0                      ; 6C9C   0298
        INCR    R3                              ; 6C9D   000B
        INCR    R3                              ; 6C9E   000B
        MVI@    R3,     R1                      ; 6C9F   0299
        SLL     R1,     1                       ; 6CA0   0049

        JSR     R5,     X_PACK_BYTES            ; 6CA1   0004 0114 034F
        JSR     R5,     X_UNPK_BYTES            ; 6CA4   0004 0114 0357
        JSR     R5,     .EXEC.A2F               ; 6CA7   0004 0118 022F

        PULR    R3                              ; 6CAA   02B3
        PSHR    R3                              ; 6CAB   0273
        SLR     R1,     1                       ; 6CAC   0061
        SLL     R1,     1                       ; 6CAD   0049
        ADDI    #$0174, R3                      ; 6CAE   02FB 0174
        MVO@    R1,     R3                      ; 6CB0   0259
        PULR    R3                              ; 6CB1   02B3

        JSR     R5,     L_5334                  ; 6CB2   0004 0150 0334

        PULR    R7                              ; 6CB5   02B7

        PSHR    R5                              ; 6CB6   0275
        PSHR    R3                              ; 6CB7   0273
        CLRR    R0                              ; 6CB8   01C0
        ADDI    #$0176, R3                      ; 6CB9   02FB 0176
        MVO@    R0,     R3                      ; 6CBB   0258
        INCR    R3                              ; 6CBC   000B
        INCR    R3                              ; 6CBD   000B
        MVO@    R0,     R3                      ; 6CBE   0258
        PULR    R3                              ; 6CBF   02B3
        PSHR    R3                              ; 6CC0   0273

        JSR     R5,     L_5350                  ; 6CC1   0004 0150 0350

        PULR    R3                              ; 6CC4   02B3

        JSR     R5,     L_6C91                  ; 6CC5   0004 016C 0091

        PULR    R7                              ; 6CC8   02B7

L_6CC9:
        PSHR    R5                              ; 6CC9   0275
        PSHR    R4                              ; 6CCA   0274
        ADDI    #$01CB, R4                      ; 6CCB   02FC 01CB
        MVI@    R4,     R4                      ; 6CCD   02A4
        TSTR    R4                              ; 6CCE   00A4
        PULR    R4                              ; 6CCF   02B4
        BEQ     L_6CD6                          ; 6CD0   0204 0004

        MVII    #$0003, R4                      ; 6CD2   02BC 0003
        B       L_6CEA                          ; 6CD4   0200 0014

L_6CD6:
        ADDI    #$0180, R4                      ; 6CD6   02FC 0180
        MVI@    R4,     R4                      ; 6CD8   02A4
        B       L_6CEA                          ; 6CD9   0200 000F

L_6CDB:
        PSHR    R5                              ; 6CDB   0275
        MVI     G_035B, R4                      ; 6CDC   0284 035B
        PSHR    R1                              ; 6CDE   0271
        MVI     G_0117, R1                      ; 6CDF   0281 0117
        ADDI    #$01CB, R1                      ; 6CE1   02F9 01CB
        MVI@    R1,     R1                      ; 6CE3   0289
        TSTR    R1                              ; 6CE4   0089
        BEQ     L_6CE9                          ; 6CE5   0204 0002

        MVII    #$0003, R4                      ; 6CE7   02BC 0003
L_6CE9:
        PULR    R1                              ; 6CE9   02B1
L_6CEA:
        PSHR    R0                              ; 6CEA   0270
        SDBD                                    ; 6CEB   0001
        ADDI    #$6CFB, R4                      ; 6CEC   02FC 00FB 006C
        MVI@    R4,     R0                      ; 6CEF   02A0
        TSTR    R3                              ; 6CF0   009B
        BEQ     L_6CF7                          ; 6CF1   0204 0004

L_6CF3:
        SLR     R0,     1                       ; 6CF3   0060
        DECR    R3                              ; 6CF4   0013
        BNEQ    L_6CF3                          ; 6CF5   022C 0003

L_6CF7:
        ANDI    #$0001, R0                      ; 6CF7   03B8 0001
        PULR    R0                              ; 6CF9   02B0
        PULR    R7                              ; 6CFA   02B7

        DECLE   $013E,  $017C,  $0006,  $0002   ; 6CFB   013E 017C 0006 0002
        DECLE   $0000                           ; 6CFF   0000

        CMPR    R6,     R3                      ; 6D00   0173
        CMPR    R6,     R1                      ; 6D01   0171
        ANDR    R6,     R3                      ; 6D02   01B3
        ANDR    R6,     R1                      ; 6D03   01B1
        ANDR    R4,     R2                      ; 6D04   01A2
        ANDR    R4,     R0                      ; 6D05   01A0
        XORR    R6,     R2                      ; 6D06   01F2
L_6D07:
        NEGR    R2                              ; 6D07   0022
        NEGR    R0                              ; 6D08   0020
        XORR    R6,     R0                      ; 6D09   01F0
        SARC    R0,     2                       ; 6D0A   007C
        DECR    R0                              ; 6D0B   0010
        DECR    R0                              ; 6D0C   0010
        CMPR    R7,     R4                      ; 6D0D   017C
        CMPR    R7,     R4                      ; 6D0E   017C
        ANDR    R6,     R2                      ; 6D0F   01B2
        ANDR    R6,     R0                      ; 6D10   01B0
        ANDR    R6,     R3                      ; 6D11   01B3
        ANDR    R6,     R1                      ; 6D12   01B1
        CMPR    R6,     R3                      ; 6D13   0173
L_6D14:
        CMPR    R6,     R1                      ; 6D14   0171
        DECLE   $0012,  $0001,  $0010,  $0000   ; 6D15   0012 0001 0010 0000
        DECLE   $0003,  $0148,  $0027           ; 6D19   0003 0148 0027

        RRC     R0,     1                       ; 6D1C   0070
        RSWD    R1                              ; 6D1D   0039
        GSWD    R0                              ; 6D1E   0030
        DIS                                     ; 6D1F   0003
        TSTR    R0                              ; 6D20   0080
        DECR    R5                              ; 6D21   0015
        RRC     R0,     1                       ; 6D22   0070
        DECR    R3                              ; 6D23   0013
        RRC     R0,     1                       ; 6D24   0070
        SETC                                    ; 6D25   0007
        TSTR    R0                              ; 6D26   0080
        SKIP                                    ; 6D27   0208
        INCR    R2                              ; 6D28   000A
        SUB@    R1,     R2                      ; 6D29   030A
        SUBR    R1,     R2                      ; 6D2A   010A
        BNOV    L_6FA2                          ; 6D2B   020A 0275

        MVII    #$01DB, R4                      ; 6D2D   02BC 01DB
        MVII    #$01E3, R5                      ; 6D2F   02BD 01E3
L_6D31:
        MVI@    R4,     R0                      ; 6D31   02A0
        SWAP    R0,     1                       ; 6D32   0040
        SAR     R0,     2                       ; 6D33   006C
        SAR     R0,     2                       ; 6D34   006C
        MOVR    R4,     R3                      ; 6D35   00A3
        SDBD                                    ; 6D36   0001
        ADD@    R4,     R0                      ; 6D37   02E0
        MVO@    R0,     R3                      ; 6D38   0258
        SWAP    R0,     1                       ; 6D39   0040
        MOVR    R0,     R2                      ; 6D3A   0082
        INCR    R3                              ; 6D3B   000B
        SUB@    R3,     R0                      ; 6D3C   0318
        MOVR    R2,     R1                      ; 6D3D   0091
        ANDI    #$0007, R1                      ; 6D3E   03B9 0007
        MVO@    R1,     R3                      ; 6D40   0259
        XORR    R1,     R2                      ; 6D41   01CA
        MVO@    R2,     R5                      ; 6D42   026A
        INCR    R5                              ; 6D43   000D
        MVO@    R2,     R5                      ; 6D44   026A
        ADDI    #$0003, R5                      ; 6D45   02FD 0003
        SUBR    R0,     R2                      ; 6D47   0102
        MVO@    R2,     R5                      ; 6D48   026A
        INCR    R5                              ; 6D49   000D
        MVO@    R2,     R5                      ; 6D4A   026A
        SUBI    #$0006, R5                      ; 6D4B   033D 0006
        CMPI    #$01E9, R5                      ; 6D4D   037D 01E9
        BNEQ    L_6D31                          ; 6D4F   022C 001F

        MVII    #$0003, R5                      ; 6D51   02BD 0003
L_6D53:
        MVO     R5,     G_01EF                  ; 6D53   0245 01EF
        MVII    #$0100, R5                      ; 6D55   02BD 0100
        MVI@    R5,     R0                      ; 6D57   02A8
        MVO@    R0,     R4                      ; 6D58   0260
        MVI@    R5,     R0                      ; 6D59   02A8
        MVO@    R0,     R4                      ; 6D5A   0260
        MVII    #$0082, R0                      ; 6D5B   02B8 0082
        MVII    #$006D, R1                      ; 6D5D   02B9 006D
        MVO     R0,     .ISRVEC.0               ; 6D5F   0240 0100
        MVO     R1,     .ISRVEC.1               ; 6D61   0241 0101
L_6D63:
        EIS                                     ; 6D63   0002
        MVI     G_01EF, R2                      ; 6D64   0282 01EF
        SARC    R2,     2                       ; 6D66   007E
        BNC     L_6D7C                          ; 6D67   0209 0013
        BOV     L_6D63                          ; 6D69   0222 0007

        JSR     R5,     L_5DDE                  ; 6D6B   0004 015C 01DE

        MVII    #$0003, R2                      ; 6D6E   02BA 0003
        MVO     R2,     G_01EF                  ; 6D70   0242 01EF
        MVII    #$00B6, R0                      ; 6D72   02B8 00B6
        MVII    #$006D, R1                      ; 6D74   02B9 006D
        MVO     R0,     .ISRVEC.0               ; 6D76   0240 0100
        MVO     R1,     .ISRVEC.1               ; 6D78   0241 0101
        B       L_6D63                          ; 6D7A   0220 0018
L_6D7C:
        BNOV    L_6D81                          ; 6D7C   020A 0003

        JSR     R5,     L_5DDE                  ; 6D7E   0004 015C 01DE

L_6D81:
        PULR    R7                              ; 6D81   02B7

        PSHR    R5                              ; 6D82   0275
        MVI     G_01E3, R4                      ; 6D83   0284 01E3
        TSTR    R4                              ; 6D85   00A4
        BEQ     L_6D8D                          ; 6D86   0204 0005

        MVI     G_01E6, R4                      ; 6D88   0284 01E6
        TSTR    R4                              ; 6D8A   00A4
        BNEQ    L_6DAB                          ; 6D8B   020C 001E

L_6D8D:
        JSR     R5,     L_6E79                  ; 6D8D   0004 016C 0279

        MVI     G_01DD, R0                      ; 6D90   0280 01DD
        MVO     R0,     .STIC.HDLY              ; 6D92   0240 0030
        MVI     G_01E0, R0                      ; 6D94   0280 01E0
        MVO     R0,     .STIC.VDLY              ; 6D96   0240 0031

        JSR     R5,     L_6DDC                  ; 6D98   0004 016C 01DC

        CLRR    R2                              ; 6D9B   01D2
        SUBI    #$0008, R2                      ; 6D9C   033A 0008

        JSR     R5,     L_6DE8                  ; 6D9E   0004 016C 01E8
        JSR     R5,     L_6E1B                  ; 6DA1   0004 016C 021B

        TSTR    R2                              ; 6DA4   0092
        BMI     L_6DC0                          ; 6DA5   020B 0019

        MVII    #$0002, R0                      ; 6DA7   02B8 0002
        B       L_6DC0                          ; 6DA9   0200 0015

L_6DAB:
        NEGR    R4                              ; 6DAB   0024

        JSR     R5,     L_6DC8                  ; 6DAC   0004 016C 01C8
        JSR     R5,     L_6DE8                  ; 6DAF   0004 016C 01E8

        MVII    #$0001, R0                      ; 6DB2   02B8 0001
        B       L_6DC0                          ; 6DB4   0200 000A

        PSHR    R5                              ; 6DB6   0275
        MOVR    R6,     R4                      ; 6DB7   00B4

        JSR     R5,     L_6DC8                  ; 6DB8   0004 016C 01C8
        JSR     R5,     L_6E1B                  ; 6DBB   0004 016C 021B

        MVII    #$0002, R0                      ; 6DBE   02B8 0002
L_6DC0:
        SLL     R2,     2                       ; 6DC0   004E
        XORR    R0,     R2                      ; 6DC1   01C2
        MVO     R2,     G_01EF                  ; 6DC2   0242 01EF

        JSR     R5,     X_PLAY_NOTE             ; 6DC4   0004 0118 02BD

        PULR    R7                              ; 6DC7   02B7

L_6DC8:
        PSHR    R5                              ; 6DC8   0275
        PSHR    R4                              ; 6DC9   0274

        JSR     R5,     L_6E79                  ; 6DCA   0004 016C 0279

        PULR    R4                              ; 6DCD   02B4
        TSTR    R4                              ; 6DCE   00A4
        BGT     L_6DD5                          ; 6DCF   020E 0004

        MVI     G_01DD, R0                      ; 6DD1   0280 01DD
        MVO     R0,     .STIC.HDLY              ; 6DD3   0240 0030
L_6DD5:
        BMI     L_6DDB                          ; 6DD5   020B 0004

        MVI     G_01E0, R0                      ; 6DD7   0280 01E0
        MVO     R0,     .STIC.VDLY              ; 6DD9   0240 0031
L_6DDB:
        INCR    R7                              ; 6DDB   000F

L_6DDC:
        PSHR    R5                              ; 6DDC   0275
L_6DDD:
        MVO     R0,     .STIC.VIDEN             ; 6DDD   0240 0020
        MVI     G_01E1, R0                      ; 6DDF   0280 01E1
        MVI     G_01E2, R1                      ; 6DE1   0281 01E2
        MVO     R0,     .ISRVEC.0               ; 6DE3   0240 0100
        MVO     R1,     .ISRVEC.1               ; 6DE5   0241 0101
        PULR    R7                              ; 6DE7   02B7

L_6DE8:
        PSHR    R5                              ; 6DE8   0275
        MVI     G_01E3, R0                      ; 6DE9   0280 01E3
        SWAP    R0,     2                       ; 6DEB   0044
        BEQ     L_6E1A                          ; 6DEC   0204 002C
        BPL     L_6E04                          ; 6DEE   0203 0014

        MVII    #$0200, R5                      ; 6DF0   02BD 0200
        MVII    #$0201, R4                      ; 6DF2   02BC 0201
        CLRR    R2                              ; 6DF4   01D2
L_6DF5:
        MVII    #$0013, R3                      ; 6DF5   02BB 0013
L_6DF7:
        MVI@    R4,     R0                      ; 6DF7   02A0
        MVO@    R0,     R5                      ; 6DF8   0268
        DECR    R3                              ; 6DF9   0013
        BNEQ    L_6DF7                          ; 6DFA   022C 0004

        MVO@    R2,     R5                      ; 6DFC   026A
        INCR    R4                              ; 6DFD   000C
        CMPI    #$02E6, R4                      ; 6DFE   037C 02E6
        BLT     L_6DF5                          ; 6E00   0225 000C
        B       L_6E1A                          ; 6E02   0200 0016

L_6E04:
        MVII    #$0212, R5                      ; 6E04   02BD 0212
        MVII    #$0003, R1                      ; 6E06   02B9 0003
        CLRR    R2                              ; 6E08   01D2
L_6E09:
        MVII    #$0013, R3                      ; 6E09   02BB 0013
L_6E0B:
        MVI@    R5,     R0                      ; 6E0B   02A8
        MVO@    R0,     R5                      ; 6E0C   0268
        SUBR    R1,     R5                      ; 6E0D   010D
        DECR    R3                              ; 6E0E   0013
        BNEQ    L_6E0B                          ; 6E0F   022C 0005

        INCR    R5                              ; 6E11   000D
        MVO@    R2,     R5                      ; 6E12   026A
        ADDI    #$0025, R5                      ; 6E13   02FD 0025
        CMPI    #$02F0, R5                      ; 6E15   037D 02F0
        BLT     L_6E09                          ; 6E17   0225 000F

        INCR    R2                              ; 6E19   000A
L_6E1A:
        PULR    R7                              ; 6E1A   02B7

L_6E1B:
        PSHR    R5                              ; 6E1B   0275
        MVI     G_01E6, R0                      ; 6E1C   0280 01E6
        SWAP    R0,     2                       ; 6E1E   0044
        BEQ     L_6E78                          ; 6E1F   0204 0057
        BMI     L_6E6C                          ; 6E21   020B 0049

        MVII    #$02DC, R5                      ; 6E23   02BD 02DC
        MVII    #$0214, R4                      ; 6E25   02BC 0214
        MVII    #$0200, R2                      ; 6E27   02BA 0200
        MVII    #$0014, R1                      ; 6E29   02B9 0014
        MVII    #$000A, R0                      ; 6E2B   02B8 000A
L_6E2D:
        PSHR    R0                              ; 6E2D   0270
        MVII    #$0004, R3                      ; 6E2E   02BB 0004
L_6E30:
        MVI@    R4,     R0                      ; 6E30   02A0
        MVO@    R0,     R5                      ; 6E31   0268
        MVI@    R4,     R0                      ; 6E32   02A0
        MVO@    R0,     R5                      ; 6E33   0268
        MVI@    R4,     R0                      ; 6E34   02A0
        MVO@    R0,     R5                      ; 6E35   0268
        MVI@    R4,     R0                      ; 6E36   02A0
        MVO@    R0,     R5                      ; 6E37   0268
        MVI@    R4,     R0                      ; 6E38   02A0
        MVO@    R0,     R5                      ; 6E39   0268
        DECR    R3                              ; 6E3A   0013
        BNEQ    L_6E30                          ; 6E3B   022C 000C

        SUBR    R1,     R4                      ; 6E3D   010C
        SUBR    R1,     R5                      ; 6E3E   010D
        XORR    R2,     R5                      ; 6E3F   01D5
        XORR    R5,     R2                      ; 6E40   01EA
        XORR    R2,     R5                      ; 6E41   01D5
        MVII    #$0004, R3                      ; 6E42   02BB 0004
L_6E44:
        MVI@    R5,     R0                      ; 6E44   02A8
        MVO@    R0,     R4                      ; 6E45   0260
        MVI@    R5,     R0                      ; 6E46   02A8
        MVO@    R0,     R4                      ; 6E47   0260
        MVI@    R5,     R0                      ; 6E48   02A8
        MVO@    R0,     R4                      ; 6E49   0260
        MVI@    R5,     R0                      ; 6E4A   02A8
        MVO@    R0,     R4                      ; 6E4B   0260
        MVI@    R5,     R0                      ; 6E4C   02A8
        MVO@    R0,     R4                      ; 6E4D   0260
        DECR    R3                              ; 6E4E   0013
        BNEQ    L_6E44                          ; 6E4F   022C 000C

        SUBR    R1,     R5                      ; 6E51   010D
        PULR    R0                              ; 6E52   02B0
        DECR    R0                              ; 6E53   0010
        BNEQ    L_6E2D                          ; 6E54   022C 0028

        XORR    R2,     R5                      ; 6E56   01D5
        XORR    R5,     R2                      ; 6E57   01EA
        XORR    R2,     R5                      ; 6E58   01D5
        MVII    #$0004, R3                      ; 6E59   02BB 0004
L_6E5B:
        MVI@    R5,     R0                      ; 6E5B   02A8
        MVO@    R0,     R4                      ; 6E5C   0260
        MVI@    R5,     R0                      ; 6E5D   02A8
        MVO@    R0,     R4                      ; 6E5E   0260
        MVI@    R5,     R0                      ; 6E5F   02A8
        MVO@    R0,     R4                      ; 6E60   0260
        MVI@    R5,     R0                      ; 6E61   02A8
        MVO@    R0,     R4                      ; 6E62   0260
        MVI@    R5,     R0                      ; 6E63   02A8
        MVO@    R0,     R4                      ; 6E64   0260
        DECR    R3                              ; 6E65   0013
        BNEQ    L_6E5B                          ; 6E66   022C 000C

        MVII    #$0003, R2                      ; 6E68   02BA 0003
        B       L_6E78                          ; 6E6A   0200 000C

L_6E6C:
        MVII    #$0200, R5                      ; 6E6C   02BD 0200
        MVII    #$0214, R4                      ; 6E6E   02BC 0214
L_6E70:
        MVI@    R4,     R0                      ; 6E70   02A0
        MVO@    R0,     R5                      ; 6E71   0268
        CMPI    #$02DC, R5                      ; 6E72   037D 02DC
        BNEQ    L_6E70                          ; 6E74   022C 0005

        MVII    #$0002, R2                      ; 6E76   02BA 0002
L_6E78:
        PULR    R7                              ; 6E78   02B7

L_6E79:
        PSHR    R5                              ; 6E79   0275
        MVII    #$031D, R2                      ; 6E7A   02BA 031D
        CLRR    R3                              ; 6E7C   01DB
L_6E7D:
        MVII    #$01E9, R5                      ; 6E7D   02BD 01E9
        MVI@    R2,     R0                      ; 6E7F   0290
        SLL     R0,     1                       ; 6E80   0048
        BPL     L_6E85                          ; 6E81   0203 0002

        MVII    #$01E3, R5                      ; 6E83   02BD 01E3
L_6E85:
        ADDI    #$0002, R2                      ; 6E85   02FA 0002
        TSTR    R4                              ; 6E87   00A4
        BLE     L_6E8E                          ; 6E88   0206 0004

        ADDI    #$0003, R5                      ; 6E8A   02FD 0003
        B       L_6EA9                          ; 6E8C   0200 001B

L_6E8E:
        INCR    R5                              ; 6E8E   000D
        MVI@    R2,     R0                      ; 6E8F   0290
        SDBD                                    ; 6E90   0001
        ADD@    R5,     R0                      ; 6E91   02E8
        MVO@    R0,     R2                      ; 6E92   0250
        MVI@    R3,     R1                      ; 6E93   0299
        SDBD                                    ; 6E94   0001
        ANDI    #$FF00, R1                      ; 6E95   03B9 0000 00FF
        SWAP    R0,     1                       ; 6E98   0040
        CMPI    #$0002, R3                      ; 6E99   037B 0002
        BNEQ    L_6E9F                          ; 6E9B   020C 0002

        SUB     G_0168, R0                      ; 6E9D   0300 0168
L_6E9F:
        CMPI    #$0005, R3                      ; 6E9F   037B 0005
        BNEQ    L_6EA5                          ; 6EA1   020C 0002

        SUB     G_0169, R0                      ; 6EA3   0300 0169
L_6EA5:
        ANDI    #$00FF, R0                      ; 6EA5   03B8 00FF
        XORR    R1,     R0                      ; 6EA7   01C8
        MVO@    R0,     R3                      ; 6EA8   0258
L_6EA9:
        INCR    R2                              ; 6EA9   000A
        TSTR    R4                              ; 6EAA   00A4
        BMI     L_6ECA                          ; 6EAB   020B 001D

        INCR    R5                              ; 6EAD   000D
        MVI@    R2,     R0                      ; 6EAE   0290
        SDBD                                    ; 6EAF   0001
        ADD@    R5,     R0                      ; 6EB0   02E8
        MVO@    R0,     R2                      ; 6EB1   0250
        XORI    #$0008, R3                      ; 6EB2   03FB 0008
        MVI@    R3,     R1                      ; 6EB4   0299
        SWAP    R0,     1                       ; 6EB5   0040
        SDBD                                    ; 6EB6   0001
        ANDI    #$FF80, R1                      ; 6EB7   03B9 0080 00FF
        PSHR    R3                              ; 6EBA   0273
        SDBD                                    ; 6EBB   0001
        ADDI    #$6ECA, R3                      ; 6EBC   02FB 00CA 006E
        PSHR    R4                              ; 6EBF   0274
        MVI@    R3,     R4                      ; 6EC0   029C
        SUB@    R4,     R0                      ; 6EC1   0320
        PULR    R4                              ; 6EC2   02B4
        PULR    R3                              ; 6EC3   02B3
        ANDI    #$007F, R0                      ; 6EC4   03B8 007F
        XORR    R1,     R0                      ; 6EC6   01C8
        MVO@    R0,     R3                      ; 6EC7   0258
        XORI    #$0008, R3                      ; 6EC8   03FB 0008
L_6ECA:
        ADDI    #$0005, R2                      ; 6ECA   02FA 0005
        INCR    R3                              ; 6ECC   000B
        CMPI    #$0006, R3                      ; 6ECD   037B 0006
        BNEQ    L_6E7D                          ; 6ECF   022C 0053
        PULR    R7                              ; 6ED1   02B7

        DECLE   $0166,  $0166,  $016A,  $0167   ; 6ED2   0166 0166 016A 0167
        DECLE   $0167,  $016B,  $0010,  $0281   ; 6ED6   0167 016B 0010 0281
        DECLE   $0251,  $02E0,  $02B1,  $0310   ; 6EDA   0251 02E0 02B1 0310
        DECLE   $0022,  $0001,  $0062,  $0211   ; 6EDE   0022 0001 0062 0211
        DECLE   $0071,  $0072,  $0071,  $0072   ; 6EE2   0071 0072 0071 0072
        DECLE   $0030,  $0001,  $0062,  $0241   ; 6EE6   0030 0001 0062 0241
        DECLE   $02E0,  $0311,  $0301,  $02F2   ; 6EEA   02E0 0311 0301 02F2
        DECLE   $0021,  $0000,  $0061,  $0212   ; 6EEE   0021 0000 0061 0212
        DECLE   $00E2,  $0111,  $0100,  $00F1   ; 6EF2   00E2 0111 0100 00F1
        DECLE   $0031,  $0002,  $0061,  $0240   ; 6EF6   0031 0002 0061 0240
        DECLE   $0300,  $02A1,  $02A2,  $02F1   ; 6EFA   0300 02A1 02A2 02F1
        DECLE   $0021,  $0000,  $0042,  $00E1   ; 6EFE   0021 0000 0042 00E1
        DECLE   $00B0,  $00B1,  $00B1,  $0112   ; 6F02   00B0 00B1 00B1 0112
        DECLE   $0031,  $0000,  $0005,  $0005   ; 6F06   0031 0000 0005 0005
        DECLE   $0005,  $0005,  $0005,  $0005   ; 6F0A   0005 0005 0005 0005
        DECLE   $0005,  $0005,  $0000,  $000A   ; 6F0E   0005 0005 0000 000A
        DECLE   $0000,  $0002,  $0008,  $0004   ; 6F12   0000 0002 0008 0004

        INCR    R1                              ; 6F16   0009
        CLRC                                    ; 6F17   0006
        DECR    R1                              ; 6F18   0011
        MVI@    R1,     R2                      ; 6F19   028A
        MVO@    R0,     R3                      ; 6F1A   0258
        PSHR    R0                              ; 6F1B   0270
        ADD@    R4,     R2                      ; 6F1C   02E2
        MVII    #$0316, R0                      ; 6F1D   02B8 0316
        NEGR    R4                              ; 6F1F   0024
        SWAP    R0,     1                       ; 6F20   0040
        ADDR    R5,     R4                      ; 6F21   00EC
        SUBR    R3,     R6                      ; 6F22   011E
        B       L_6D14                          ; 6F23   0220 0210

        DECLE   $0070,  $0072,  $0034,  $0010   ; 6F25   0070 0072 0034 0010
        DECLE   $030C,  $02FA,  $0238,  $0240   ; 6F29   030C 02FA 0238 0240
        DECLE   $0270,  $0270,  $0020,  $006E   ; 6F2D   0270 0270 0020 006E
        DECLE   $0212,  $007A,  $0226,  $021A   ; 6F31   0212 007A 0226 021A
        DECLE   $00EE,  $0116,  $0032,  $0066   ; 6F35   00EE 0116 0032 0066
        DECLE   $026A,  $0012,  $023E,  $0242   ; 6F39   026A 0012 023E 0242
        DECLE   $0276,  $025E,  $002A,  $0041   ; 6F3D   0276 025E 002A 0041
        DECLE   $003C,  $0041,  $0058,  $0070   ; 6F41   003C 0041 0058 0070
        DECLE   $0221,  $0214,  $0031,  $0011   ; 6F45   0221 0214 0031 0011
        DECLE   $0300,  $02D0,  $0291,  $0310   ; 6F49   0300 02D0 0291 0310
        DECLE   $0230                           ; 6F4D   0230

        MVO     R1,     .STIC.MODE              ; 6F4E   0241 0021
        SWAP    R0,     1                       ; 6F50   0040
        ADDR    R4,     R0                      ; 6F51   00E0
        MOVR    R2,     R0                      ; 6F52   0090
        ADDR    R0,     R0                      ; 6F53   00C0
        MOVR    R4,     R0                      ; 6F54   00A0
        ADDR    R2,     R0                      ; 6F55   00D0
        SUBR    R2,     R0                      ; 6F56   0110
        GSWD    R0                              ; 6F57   0030
        DECR    R1                              ; 6F58   0011
        MVI     .BTAB.50,R0                     ; 6F59   0280 0250
        PSHR    R0                              ; 6F5B   0270
        NEGR    R0                              ; 6F5C   0020
        DECR    R0                              ; 6F5D   0010
        PSHR    R0                              ; 6F5E   0270
        NEGR    R1                              ; 6F5F   0021
        SWAP    R0,     1                       ; 6F60   0040
        RRC     R0,     1                       ; 6F61   0070
        BC      L_6D53                          ; 6F62   0221 0210

        GSWD    R0                              ; 6F64   0030
        SWAP    R1,     1                       ; 6F65   0041
        B       L_6D07                          ; 6F66   0220 0260

        DECLE   $0010,  $0270,  $0230,  $0241   ; 6F68   0010 0270 0230 0241
        DECLE   $02E1,  $0310,  $0230           ; 6F6C   02E1 0310 0230

        MVO@    R0,     R4                      ; 6F6F   0260
        SWAP    R1,     1                       ; 6F70   0041
        RLC     R0,     1                       ; 6F71   0050
        B       L_6D63                          ; 6F72   0220 0210

        DECLE   $0100,  $00F0,  $0221,  $0260   ; 6F74   0100 00F0 0221 0260
        DECLE   $0011,  $0270,  $0231,  $0240   ; 6F78   0011 0270 0231 0240
        DECLE   $0022,  $0013,  $0230,  $0260   ; 6F7C   0022 0013 0230 0260
        DECLE   $0041,  $0101,  $00D1,  $0111   ; 6F80   0041 0101 00D1 0111
        DECLE   $0033,  $0067,  $0216,  $0035   ; 6F84   0033 0067 0216 0035
        DECLE   $0011,  $02E1,  $02B2,  $02B5   ; 6F88   0011 02E1 02B2 02B5
        DECLE   $0315,  $0235,  $0266,  $0001   ; 6F8C   0315 0235 0266 0001
        DECLE   $0040,  $0101,  $00D2,  $00C8   ; 6F90   0040 0101 00D2 00C8
        DECLE   $00D4,  $0115,  $0036,  $0009   ; 6F94   00D4 0115 0036 0009
        DECLE   $03E0,  $00A2,  $00E3,  $03E0   ; 6F98   03E0 00A2 00E3 03E0
        DECLE   $00C4,  $0105,  $0000           ; 6F9C   00C4 0105 0000

        XOR@    R5,     R1                      ; 6F9F   03E9
        XOR@    R4,     R0                      ; 6FA0   03E0
        ADCR    R1                              ; 6FA1   0029
L_6FA2:
        XOR@    R4,     R0                      ; 6FA2   03E0
        DECLE   $03E0,  $03E0,  $03E0,  $03E0   ; 6FA3   03E0 03E0 03E0 03E0
        DECLE   $0280,  $0309,  $02C0,  $02A0   ; 6FA7   0280 0309 02C0 02A0
        DECLE   $0320,  $02E0,  $0120,  $03E0   ; 6FAB   0320 02E0 0120 03E0
        DECLE   $03E0,  $0140,  $03E0,  $03E0   ; 6FAF   03E0 0140 03E0 03E0
        DECLE   $0160,  $03E9,  $03E0,  $01C0   ; 6FB3   0160 03E9 03E0 01C0
        DECLE   $03E0,  $03E1,  $0240,  $03E3   ; 6FB7   03E0 03E1 0240 03E3
        DECLE   $03E0,  $03E4,  $03E6,  $03E9   ; 6FBB   03E0 03E4 03E6 03E9
        DECLE   $03E0,  $03E1,  $03E0,  $0263   ; 6FBF   03E0 03E1 03E0 0263
        DECLE   $03E0,  $03E9,  $03E0,  $03E0   ; 6FC3   03E0 03E9 03E0 03E0
        DECLE   $03E0,  $0040,  $03E0,  $03E0   ; 6FC7   03E0 0040 03E0 03E0
        DECLE   $0060,  $03E4,  $03E6,  $0009   ; 6FCB   0060 03E4 03E6 0009
        DECLE   $03E0,  $03E0,  $0020,  $03E0   ; 6FCF   03E0 03E0 0020 03E0
        DECLE   $03E5,  $0000,  $03E6,  $03E9   ; 6FD3   03E5 0000 03E6 03E9
        DECLE   $0020,  $03E0,  $03E0,  $0120   ; 6FD7   0020 03E0 03E0 0120
        DECLE   $03E0,  $03E4,  $0145,  $03E0   ; 6FDB   03E0 03E4 0145 03E0
        DECLE   $03E9,  $0280,  $0302,  $02C3   ; 6FDF   03E9 0280 0302 02C3
        DECLE   $02A0,  $0329,  $02E0,  $0000   ; 6FE3   02A0 0329 02E0 0000
        DECLE   $0000,  $0281,  $0280,  $0002   ; 6FE7   0000 0281 0280 0002
        DECLE   $00C9,  $00C0,  $00C0,  $00C0   ; 6FEB   00C9 00C0 00C0 00C0
        DECLE   $0140,  $0142,  $0193,  $000C   ; 6FEF   0140 0142 0193 000C
        DECLE   $0001,  $0180,  $0000           ; 6FF3   0001 0180 0000

        CMPR    R1,     R4                      ; 6FF6   014C
        CMPR    R0,     R1                      ; 6FF7   0141
        CMPR    R0,     R2                      ; 6FF8   0142
        CMPR    R1,     R3                      ; 6FF9   014B
        CMPR    R2,     R4                      ; 6FFA   0154
        CMPR    R0,     R1                      ; 6FFB   0141
        ADDR    R0,     R0                      ; 6FFC   00C0
        ADDR    R0,     R0                      ; 6FFD   00C0
        ADDR    R2,     R4                      ; 6FFE   00D4
        ADDR    R0,     R1                      ; 6FFF   00C1
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $501A       <entry>
;;  $504C       $5050   $507F  
;;  $5066       $505F  
;;  $5070       $5069  
;;  $5076       $505A  
;;  $5081       $514B  
;;  $50A4       $509E   $5375   $537F   $5383  
;;  $50BD       $5061   $506B  
;;  $50F4       $52A8  
;;  $5131       $5126  
;;  $513E       $5134  
;;  $514E       $5081   $5167   $517E   $51E7   $5386  
;;  $5165       $5161  
;;  $5174       $515E   $5177   $517A   $51E2  
;;  $519C       $51D9  
;;  $51A9       $518B  
;;  $51B3       $5195   $519F   $51A4   $51B6   $51BA   $51C6  
;;  $51D6       $51D0  
;;  $51E5       $51DE  
;;  $51E7       $5147  
;;  $5209       $520B  
;;  $5253       $524F  
;;  $5266       $526E  
;;  $529D       <entry>
;;  $52AA       $52A2  
;;  $52B3       $52AE  
;;  $52BC       $52B7  
;;  $52D3       $52BF   $52C4  
;;  $52DE       $52C9   $52D1   $52D6  
;;  $52F4       $52E6  
;;  $52F5       $5325  
;;  $530E       $5304  
;;  $5317       $5312  
;;  $5334       $6CB2  
;;  $5339       $67FB   $68E3  
;;  $533A       $5338  
;;  $5341       $534B  
;;  $5350       $6CC1  
;;  $5356       $535F  
;;  $5381       $537B  
;;  $539D       $5395  
;;  $53B8       $53AD  
;;  $53DD       $53E2  
;;  $53E4       $53B1   $53B6  
;;  $53E8       $53A0   $5689  
;;  $53F3       $53F7  
;;  $5412       $547A  
;;  $5414       $5419  
;;  $541F       $5407  
;;  $544E       $544A  
;;  $5453       $545D   $5469  
;;  $547C       $540E   $55D2  
;;  $5491       $5496  
;;  $549B       $5421   $542B   $548F   $5627   $5635  
;;  $549C       $53DD   $5414   $5491   $55DD  
;;  $54A2       $54A5  
;;  $54AD       $54A9  
;;  $54B6       $54B2  
;;  $54CE       $54C2  
;;  $54E2       $54DF  
;;  $5500       $54F1   $54F4  
;;  $552F       $552A  
;;  $5543       $5518   $5526  
;;  $554B       $558B  
;;  $5552       $5581  
;;  $5554       $557E  
;;  $5563       $555C  
;;  $556B       $5564  
;;  $5574       $556D  
;;  $557D       $5559   $5576  
;;  $558D       $5586  
;;  $5591       $559A  
;;  $5598       $5594  
;;  $55B7       $55A5  
;;  $55C9       $55B5  
;;  $55F8       $54FE   $55AB   $55AF   $55B3   $55B9   $55BF   $55C3   $55C7  
;;  $55FB       $54CC   $54E4   $5502   $550B   $5541   $559F  
;;  $55FD       $555F   $5567   $5570   $5579  
;;  $5612       $5602   $560B   $560E  
;;  $5613       $5554   $55E8   $55FE   $5663  
;;  $562C       $54BF   $54C9  
;;  $5650       $564A  
;;  $565A       $53E4   $541B   $5498  
;;  $5661       $567A  
;;  $5663       $5677  
;;  $5680       $5402   $540C  
;;  $569F       $501B   $50F4   $51EA  
;;  $56A3       $56A9  
;;  $56AC       $5158   $51A6   $5680  
;;  $56AF       $56B0  
;;  $56EB       $56D1   $56D9   $56E3  
;;  $56EF       $56F8  
;;  $5782       $52FD  
;;  $57AA       $579A   $57A6  
;;  $57AE       $57A8  
;;  $57B0       $57AC  
;;  $57C3       $57CD  
;;  $57C9       $57BD  
;;  $57CF       $5790   $5795   $57A0   $57B4  
;;  $57D9       $57B6   $57CF  
;;  $57E5       $5789   $57B9   $57C7   $57D2   $57D7   $57DF  
;;  $57E6       $5314  
;;  $5829       $5824  
;;  $582E       $5891  
;;  $5854       $57F2   $57F7  
;;  $585B       $582C  
;;  $5873       $585E  
;;  $587C       $5866   $5871  
;;  $58B8       $58AE   $58C4   $58D3   $58D8   $58DD   $58E5   $58F2  
;;  $58BC       $58A6  
;;  $58C9       $58FF  
;;  $58F0       $58F5   $58F9  
;;  $58F4       $58EA  
;;  $58F7       $58EE  
;;  $5901       $5317  
;;  $5924       $5920  
;;  $5931       $592C  
;;  $593B       $5936  
;;  $5943       $5940  
;;  $594B       $5948  
;;  $5992       $598E  
;;  $599A       $5996  
;;  $59B6       $59A6   $59AD   $59B2  
;;  $59C9       $59C3  
;;  $59D0       $5985  
;;  $59D6       $59D1  
;;  $59E2       $59DE  
;;  $59F2       $59EE  
;;  $5A08       $5966   $596C   $5972   $59C7   $59CE   $59D8   $5CAE  
;;  $5A23       $5A1E  
;;  $5A43       $5A34  
;;  $5A46       $5A29  
;;  $5A4C       $5A49  
;;  $5A4D       $5A10   $5A25   $5A2D   $5A44  
;;  $5A7F       $5A7C  
;;  $5A86       $5A82  
;;  $5A91       $5A6F  
;;  $5A98       $5A93  
;;  $5AA4       $5AA0  
;;  $5AAD       $5A8F  
;;  $5AB5       $5AB9  
;;  $5AC6       $5ABF  
;;  $5ADC       $5AC4   $5AC8   $5ACD  
;;  $5ADF       $5907   $5A52   $5A57   $5AB6  
;;  $5AE0       $5AC1   $5AD6  
;;  $5B08       $5B03  
;;  $5B19       $5B0D  
;;  $5B22       $5B1E  
;;  $5B34       $5B30  
;;  $5B41       $5AEB   $5B11   $5B15   $5B26   $5B2C   $5B3D  
;;  $5B42       $50E5  
;;  $5B60       $5B4E   $5B74   $5B85   $5B9F  
;;  $5B61       $5B5E   $5B8E   $5BA3  
;;  $5B62       $5B80   $5B9A  
;;  $5B6D       $5B69  
;;  $5B71       $5B5A  
;;  $5B82       $5B79  
;;  $5B90       $5B8A  
;;  $5B9C       $5B93  
;;  $5BA5       $5B6F  
;;  $5BC9       $5C4D  
;;  $5C18       $5BFC   $5C02  
;;  $5C1D       $5BC7  
;;  $5C4F       $5C31  
;;  $5C64       $5C58  
;;  $5C6D       $5C62  
;;  $5C71       $5C1B   $5C25   $5C53  
;;  $5C75       $5BEB  
;;  $5C7A       $5B57   $5B71   $5B76   $5B82   $5B87   $5B90   $5B9C  
;;  $5C85       $5C7F  
;;  $5C88       $5ACF   $5AD9  
;;  $5C91       $5ADC  
;;  $5C9D       $5C97  
;;  $5C9E       $5C9B  
;;  $5CA0       $5C95  
;;  $5CA1       $5959   $595F  
;;  $5CB7       $50E2   $52F7   $58A1   $58CD   $5C15   $5CAB  
;;  $5CC3       $5CC8  
;;  $5CCB       $50E8   $531D   $58B8   $5C0F   $5CA1  
;;  $5CD7       $5CDC  
;;  $5CDF       $5D74   $5E0A  
;;  $5CF9       $5CE7  
;;  $5D05       $5CE0   $5E43  
;;  $5D3B       $5D2B  
;;  $5D4F       $5D4B  
;;  $5D5C       $5D58  
;;  $5D5F       $5D1E   $5D26  
;;  $5D63       $5247  
;;  $5D66       $5D7F  
;;  $5D6E       $5D7A  
;;  $5D82       $5CF6  
;;  $5D97       $5D8C   $5D90  
;;  $5D9C       $5D86  
;;  $5DAC       $5DA5  
;;  $5DB1       $5DA1  
;;  $5DC2       $5DE7   $5E02   $5E0E   $5E1B  
;;  $5DD1       $5DDA  
;;  $5DDD       $5DC4  
;;  $5DDE       $6D6B   $6D7E  
;;  $5E08       $5E20  
;;  $5E23       $5915   $5B43  
;;  $5E8B       $502C   $5096   $50A0   $5109   $5170   $518D   $51A9   $53A5  
;;  $5E8B       $569A  
;;  $5E9E       $5EB2   $5EBD   $5EC5  
;;  $5EA1       $5EA9  
;;  $5EB4       $5EAC  
;;  $5EBF       $5EBA  
;;  $5EC7       $5EB6  
;;  $5ED4       $5ED2  
;;  $5F4B       $5F49  
;;  $5F92       $5F31  
;;  $5FAD       $5FAB  
;;  $5FCF       $5FCD  
;;  $6040       $5FD1  
;;  $6044       $5FD5  
;;  $6057       $5F51  
;;  $6075       $5F71  
;;  $607D       $600B  
;;  $60BA       $604B  
;;  $60D2       $5ED0  
;;  $6103       $5FCF  
;;  $6129       $5F27  
;;  $6136       $639E  
;;  $617D       $6049  
;;  $61BA       $614B  
;;  $61F1       $5ED7  
;;  $621A       $6018  
;;  $622A       $6028  
;;  $62B2       $6251  
;;  $62B9       $6203  
;;  $62C3       $614F  
;;  $62D8       $60D6  
;;  $62FA       $628B  
;;  $632B       $6329  
;;  $632D       $632B  
;;  $634B       $61D7   $6349  
;;  $634D       $634B  
;;  $639D       $639B  
;;  $63CB       $63C9  
;;  $6407       $6205  
;;  $6427       $640D  
;;  $6455       $6453  
;;  $64AD       $64AB  
;;  $64B5       $64AE  
;;  $64CD       $64CB  
;;  $650D       $650B  
;;  $650F       $650D  
;;  $651B       $6519  
;;  $651D       $651B  
;;  $652D       $652B  
;;  $652F       $632D  
;;  $654B       $6549  
;;  $6556       $650F  
;;  $6565       $6563  
;;  $661D       $532D   $6703  
;;  $6634       $6622  
;;  $6648       $663F  
;;  $6663       $6660  
;;  $667D       $6669  
;;  $6691       $6688  
;;  $66AD       $66AA  
;;  $66B1       $66DD  
;;  $66C5       $66B9  
;;  $66E8       $52EA   $68FF   $69DD  
;;  $6707       $531A  
;;  $670A       $6508  
;;  $671A       $670E  
;;  $6736       $6733  
;;  $6748       $6740  
;;  $6753       $6750  
;;  $676C       $6727  
;;  $6777       $52FA  
;;  $678A       $677C  
;;  $67AA       $67A2  
;;  $67B4       $67AC  
;;  $67BE       $67B6  
;;  $67C8       $6782   $6788   $67C0   $68A2   $68B8   $68C3   $68CF   $68DA  
;;  $67C9       $67A4   $67AE   $67B8   $67C2  
;;  $67E2       $67D7  
;;  $67E6       $67E0  
;;  $67EF       $67DA   $67DE   $67E4  
;;  $6800       $67F3  
;;  $682C       $67FE  
;;  $682E       $6545  
;;  $685A       $6856  
;;  $6860       $6792  
;;  $6886       $689D  
;;  $688A       $6871  
;;  $689F       $6863   $6879   $6884   $6890   $689B  
;;  $68C5       $68DC  
;;  $68C9       $68B0  
;;  $68DE       $6875   $688C   $68B4   $68CB  
;;  $691C       $690D   $693E   $6942   $6948   $694C   $6987   $698F  
;;  $691D       <entry>
;;  $6923       $6938  
;;  $6934       $6929   $6930  
;;  $696B       $6964  
;;  $6977       $6969   $6970  
;;  $698A       $697D  
;;  $6995       $5330  
;;  $69A0       $69B7  
;;  $69AB       $69A5  
;;  $69AC       $69A7  
;;  $69AD       $69A9  
;;  $69B2       $69AF  
;;  $69D8       $69D5  
;;  $69E0       $69BC   $69C1   $69C7   $69CD   $69D3   $69DB  
;;  $69E1       $52DB  
;;  $69F5       <entry>
;;  $69FA       $6A03  
;;  $69FE       <entry>
;;  $6A05       $52CE  
;;  $6A18       $6A16  
;;  $6A2A       $6A28  
;;  $6A38       $6A36  
;;  $6A3B       $6A39  
;;  $6A61       $6A5F  
;;  $6A74       $69FA  
;;  $6A98       $6AC8   $6ADC   $6AEF   $6B12   $6B25   $6B3B   $6B4E  
;;  $6A9A       $6B60   $6B70  
;;  $6AAE       $6AA6  
;;  $6AB2       $6AAC   $6AF4  
;;  $6AB7       $6A94  
;;  $6ACA       $6A84  
;;  $6ADE       $6AD8  
;;  $6AF1       $6ABD   $6AE4   $6B18   $6B41  
;;  $6B14       $6B0A  
;;  $6B27       $6AFC  
;;  $6B3D       $6B33  
;;  $6B62       $6B51  
;;  $6B72       $6A7E   $6AF1   $6AF6   $6B57   $6B67  
;;  $6B81       $6B8D   $6BB0   $6BDB  
;;  $6B89       $6B7B  
;;  $6B8F       $6AB2  
;;  $6B97       $6B93  
;;  $6BA0       $6B9A  
;;  $6BB6       $6BE1   $6BF4  
;;  $6BBF       $6BB9  
;;  $6BCB       $6B9C  
;;  $6BE3       $6B9E  
;;  $6BE4       $6B95  
;;  $6BED       $6BE9  
;;  $6BEE       $6BE7  
;;  $6BF6       $5C12   $5CA8   $685C   $6912   $6919  
;;  $6C2E       $6C0C   $6C32  
;;  $6C2F       $6C2B  
;;  $6C7E       $6C7A  
;;  $6C91       $6CC5  
;;  $6CC9       $663C   $6685   $66B5   $6926  
;;  $6CD6       $6CD0  
;;  $6CDB       $5301   $578D   $57EF   $58AB   $5904   $5963   $5A4F  
;;  $6CE9       $6CE5  
;;  $6CEA       $6CD4   $6CD9  
;;  $6CF3       $6CF5  
;;  $6CF7       $6CF1  
;;  $6D07       $6F66  
;;  $6D14       $6F23  
;;  $6D31       $6D4F  
;;  $6D53       $6F62  
;;  $6D63       $6D69   $6D7A   $6F72  
;;  $6D7C       $6D67  
;;  $6D81       $6D7C  
;;  $6D8D       $6D86  
;;  $6DAB       $6D8B  
;;  $6DC0       $6DA5   $6DA9   $6DB4  
;;  $6DC8       $6DAC   $6DB8  
;;  $6DD5       $6DCF  
;;  $6DDB       $6DD5  
;;  $6DDC       $6D98  
;;  $6DDD       $6DDB  
;;  $6DE8       $6D9E   $6DAF  
;;  $6DF5       $6E00  
;;  $6DF7       $6DFA  
;;  $6E04       $6DEE  
;;  $6E09       $6E17  
;;  $6E0B       $6E0F  
;;  $6E1A       $6DEC   $6E02  
;;  $6E1B       $6DA1   $6DBB  
;;  $6E2D       $6E54  
;;  $6E30       $6E3B  
;;  $6E44       $6E4F  
;;  $6E5B       $6E66  
;;  $6E6C       $6E21  
;;  $6E70       $6E74  
;;  $6E78       $6E1F   $6E6A  
;;  $6E79       $6D8D   $6DCA  
;;  $6E7D       $6ECF  
;;  $6E85       $6E81  
;;  $6E8E       $6E88  
;;  $6E9F       $6E9B  
;;  $6EA5       $6EA1  
;;  $6EA9       $6E8C  
;;  $6ECA       $6EAB  
;;  $6FA2       $6D2B  
;; ======================================================================== ;;
