
        ORG     $5000
.HEADER:
        DECLE   $0275,  $0280   ; 5000  Ptr: MOB graphic images
        DECLE   $015F,  $0080   ; 5002  Ptr: EXEC timer table
.GFX_LIST_5004:
        DECLE   $020C,  $03CF   ; 5004  Ptr: Start of game
        BIDECLE $5004           ; 5006  Ptr: Backgnd gfx list
        DECLE   $011D,  $0280   ; 5008  Ptr: GRAM init sequence
        DECLE   $015E,  $0378   ; 500A  Ptr: Date/Title
        DECLE   $00FF           ; 500C  Key-click / flags
        DECLE   $020C           ; 500D  Border extension
        DECLE   $0029           ; 500E  Color Stack / FGBG
        DECLE   $0280,  $031E   ; 500F  Color Stack init (0, 1)
        DECLE   $03B8,  $00FF   ; 5011  Color Stack init (2, 3)
        DECLE   $0378           ; 5013  Border color init


        SLLC    R0,     1                       ; 5014   0058
        BNEQ    L_5030                          ; 5015   020C 0019

        MVI     G_0326, R0                      ; 5017   0280 0326
        ANDI    #$007F, R0                      ; 5019   03B8 007F
        CMPI    #$0038, R0                      ; 501B   0378 0038
        BNEQ    L_5034                          ; 501D   020C 0015

        MVII    #$0002, R0                      ; 501F   02B8 0002
        MVO     R0,     G_0158                  ; 5021   0240 0158

        JSR     R5,     L_5E02                  ; 5023   0004 015C 0202

        CLRR    R4                              ; 5026   01E4
        MVO     R4,     G_015E                  ; 5027   0244 015E
        CLRR    R5                              ; 5029   01ED
        MVI     G_0159, R2                      ; 502A   0282 0159
        MVI     G_015A, R3                      ; 502C   0283 015A
        B       L_50DC                          ; 502E   0200 00AC

L_5030:
        MVII    #$0003, R1                      ; 5030   02B9 0003
        B       L_5084                          ; 5032   0200 0050

L_5034:
        MVII    #$0001, R1                      ; 5034   02B9 0001
        B       L_5084                          ; 5036   0200 004C

        MVI     G_0163, R0                      ; 5038   0280 0163
        TSTR    R0                              ; 503A   0080
        BNEQ    L_5243                          ; 503B   020C 0206

        MVI     G_01AA, R0                      ; 503D   0280 01AA
        XOR     G_01AD, R0                      ; 503F   03C0 01AD
        BNEQ    L_5045                          ; 5041   020C 0002

        MVO     R0,     G_0165                  ; 5043   0240 0165
L_5045:
        MVI     G_01AB, R1                      ; 5045   0281 01AB
        AND     G_01AE, R1                      ; 5047   0381 01AE
        SWAP    R1,     2                       ; 5049   0045
        BMI     L_505E                          ; 504A   020B 0012

        ANDI    #$0003, R1                      ; 504C   03B9 0003
        SDBD                                    ; 504E   0001
        ADDI    #$55D0, R1                      ; 504F   02F9 00D0 0055
        MVI@    R1,     R1                      ; 5052   0289
        CMP     G_0158, R1                      ; 5053   0341 0158
        BNEQ    L_5062                          ; 5055   020C 000B

        MVI     G_015D, R5                      ; 5057   0285 015D
        TSTR    R5                              ; 5059   00AD
        BNEQ    L_5243                          ; 505A   020C 01E7
        B       L_5062                          ; 505C   0200 0004

L_505E:
        MVII    #$00FF, R1                      ; 505E   02B9 00FF
        B       L_5107                          ; 5060   0200 00A5

L_5062:
        CLRR    R0                              ; 5062   01C0
        MVO     R0,     G_0164                  ; 5063   0240 0164
        MVII    #$0003, R0                      ; 5065   02B8 0003

        JSR     R5,     L_515B                  ; 5067   0004 0150 015B

        BNC     L_5082                          ; 506A   0209 0016

        MOVR    R1,     R2                      ; 506C   008A
        ANDI    #$0003, R2                      ; 506D   03BA 0003
        SDBD                                    ; 506F   0001
        ADDI    #$55D4, R2                      ; 5070   02FA 00D4 0055
        MVI@    R2,     R2                      ; 5073   0292
        MVI     G_0158, R0                      ; 5074   0280 0158
        ANDI    #$0007, R0                      ; 5076   03B8 0007
        CMPR    R0,     R2                      ; 5078   0142
        BEQ     L_5084                          ; 5079   0204 0009

        MVII    #$0007, R0                      ; 507B   02B8 0007

        JSR     R5,     L_515B                  ; 507D   0004 0150 015B

        BC      L_5084                          ; 5080   0201 0002

L_5082:
        MVI     G_0158, R1                      ; 5082   0281 0158
L_5084:
        PSHR    R1                              ; 5084   0271

        JSR     R5,     L_61A1                  ; 5085   0004 0160 01A1
        DECLE   $000A                           ; 5088   000A

        PULR    R1                              ; 5089   02B1
        MVO     R1,     G_0158                  ; 508A   0241 0158
        ANDI    #$0003, R1                      ; 508C   03B9 0003

        JSR     R5,     L_521D                  ; 508E   0004 0150 021D

        BC      L_53AE                          ; 5091   0201 031B

        MVII    #$0003, R0                      ; 5093   02B8 0003

        JSR     R5,     L_515B                  ; 5095   0004 0150 015B

        BNC     L_509F                          ; 5098   0209 0005

        JSR     R5,     L_516A                  ; 509A   0004 0150 016A

        BC      L_53AE                          ; 509D   0201 030F

L_509F:
        MVI     G_0158, R1                      ; 509F   0281 0158
        ANDI    #$0003, R1                      ; 50A1   03B9 0003
        MVII    #$0001, R0                      ; 50A3   02B8 0001
        MVI     G_014C, R2                      ; 50A5   0282 014C
        TSTR    R2                              ; 50A7   0092
        BEQ     L_50B5                          ; 50A8   0204 000B

        MVI     G_0159, R2                      ; 50AA   0282 0159
        SARC    R2,     1                       ; 50AC   007A
        BC      L_50B5                          ; 50AD   0201 0006

        MVI     G_015A, R2                      ; 50AF   0282 015A
        SARC    R2,     1                       ; 50B1   007A
        BC      L_50B5                          ; 50B2   0201 0001

        INCR    R0                              ; 50B4   0008
L_50B5:
        MVI     G_0159, R2                      ; 50B5   0282 0159
        MVI     G_015A, R3                      ; 50B7   0283 015A
        CLRR    R4                              ; 50B9   01E4
        CLRR    R5                              ; 50BA   01ED
        INCR    R1                              ; 50BB   0009
        ADDR    R7,     R1                      ; 50BC   00F9
        ADD@    R1,     R7                      ; 50BD   02CF

        DECLE   $0004                           ; 50BE   0004

        INCR    R3                              ; 50BF   000B
        COMR    R5                              ; 50C0   001D
        DECR    R6                              ; 50C1   0016
        SUBR    R0,     R3                      ; 50C2   0103
        SDBD                                    ; 50C3   0001
        MVII    #$0C00, R5                      ; 50C4   02BD 0000 000C
        B       L_50DC                          ; 50C7   0200 0013

        ADDR    R0,     R3                      ; 50C9   00C3
        SDBD                                    ; 50CA   0001
        MVII    #$0C00, R5                      ; 50CB   02BD 0000 000C
        SDBD                                    ; 50CE   0001
        MVII    #$0C00, R4                      ; 50CF   02BC 0000 000C
        B       L_50DC                          ; 50D2   0200 0008

        SUBR    R0,     R2                      ; 50D4   0102
        SDBD                                    ; 50D5   0001
        MVII    #$0400, R4                      ; 50D6   02BC 0000 0004
        B       L_50DC                          ; 50D9   0200 0001

        ADDR    R0,     R2                      ; 50DB   00C2
L_50DC:
        MVO     R2,     G_0159                  ; 50DC   0242 0159
        MVO     R3,     G_015A                  ; 50DE   0243 015A
        MVI     G_031E, R0                      ; 50E0   0280 031E
        SDBD                                    ; 50E2   0001
        ANDI    #$FF00, R0                      ; 50E3   03B8 0000 00FF
        XORR    R2,     R0                      ; 50E6   01D0
        MVO     R0,     G_031E                  ; 50E7   0240 031E
        MVO     R0,     G_031F                  ; 50E9   0240 031F
        MVI     G_0326, R0                      ; 50EB   0280 0326
        SDBD                                    ; 50ED   0001
        ANDI    #$F380, R0                      ; 50EE   03B8 0080 00F3
        XORR    R3,     R0                      ; 50F1   01D8
        XORR    R4,     R0                      ; 50F2   01E0
        MVO     R0,     G_0326                  ; 50F3   0240 0326
        MVO     R0,     G_0327                  ; 50F5   0240 0327
        MVI     G_0336, R0                      ; 50F7   0280 0336
        INCR    R0                              ; 50F9   0008
        ANDI    #$03FF, R0                      ; 50FA   03B8 03FF
        XORR    R5,     R0                      ; 50FC   01E8
        MVO     R0,     G_0336                  ; 50FD   0240 0336
        SDBD                                    ; 50FF   0001
        ADDI    #$0400, R0                      ; 5100   02F8 0000 0004
        MVO     R0,     G_0337                  ; 5103   0240 0337
        B       L_53AE                          ; 5105   0200 02A7

L_5107:
        MVI     G_015D, R0                      ; 5107   0280 015D
        TSTR    R0                              ; 5109   0080
        BNEQ    L_5243                          ; 510A   020C 0137

        MVII    #$0003, R0                      ; 510C   02B8 0003

        JSR     R5,     L_515B                  ; 510E   0004 0150 015B

        BC      L_5117                          ; 5111   0201 0004

        MVI     G_0158, R1                      ; 5113   0281 0158
        B       L_5084                          ; 5115   0220 0092

L_5117:
        JSR     R5,     L_616D                  ; 5117   0004 0160 016D
        DECLE   $000A                           ; 511A   000A

        B       L_53AE                          ; 511B   0200 0291

        PSHR    R5                              ; 511D   0275
        MVI     G_031E, R1                      ; 511E   0281 031E
        MVO     R1,     G_0159                  ; 5120   0241 0159
        MVI     G_0326, R0                      ; 5122   0280 0326
        ANDI    #$007F, R0                      ; 5124   03B8 007F
        MVO     R0,     G_015A                  ; 5126   0240 015A
        CMPI    #$0358, R1                      ; 5128   0379 0358
        BNEQ    L_515A                          ; 512A   020C 002E

        CMPI    #$0038, R0                      ; 512C   0378 0038
        BNEQ    L_515A                          ; 512E   020C 002A

        MVI     .BTAB.82,R0                     ; 5130   0280 0282
        SDBD                                    ; 5132   0001
        ANDI    #$4000, R0                      ; 5133   03B8 0000 0040
        BEQ     L_515A                          ; 5136   0204 0022

        MVI     .BTAB.82,R0                     ; 5138   0280 0282
        SDBD                                    ; 513A   0001
        ANDI    #$AFF8, R0                      ; 513B   03B8 00F8 00AF
        ADDI    #$005F, R0                      ; 513E   02F8 005F
        MVO     R0,     .BTAB.82                ; 5140   0240 0282

        JSR     R5,     L_6CB6                  ; 5142   0004 016C 00B6
        DECLE   $0006                           ; 5145   0006

        JSR     R5,     L_6C94                  ; 5146   0004 016C 0094
        DECLE   $001E,  $0006                   ; 5149   001E 0006

        MVI     G_0350, R0                      ; 514B   0280 0350
        MOVR    R0,     R1                      ; 514D   0081
        SWAP    R1,     1                       ; 514E   0041
        ANDI    #$00FF, R0                      ; 514F   03B8 00FF
        ANDI    #$00FF, R1                      ; 5151   03B9 00FF

        JSR     R5,     L_5940                  ; 5153   0004 0158 0140
        JSR     R5,     L_61A1                  ; 5156   0004 0160 01A1
        DECLE   $0008                           ; 5159   0008
L_515A:
        PULR    R7                              ; 515A   02B7

L_515B:
        PSHR    R5                              ; 515B   0275
        MVI     G_0159, R5                      ; 515C   0285 0159
        ANDR    R0,     R5                      ; 515E   0185
        BNEQ    L_5168                          ; 515F   020C 0007

        MVI     G_015A, R5                      ; 5161   0285 015A
        ANDR    R0,     R5                      ; 5163   0185
        BNEQ    L_5168                          ; 5164   020C 0002

        SETC                                    ; 5166   0007
        PULR    R7                              ; 5167   02B7

L_5168:
        CLRC                                    ; 5168   0006
        PULR    R7                              ; 5169   02B7

L_516A:
        PSHR    R5                              ; 516A   0275
        MVI     G_015A, R0                      ; 516B   0280 015A
        MVI     G_0159, R1                      ; 516D   0281 0159
        MVI     G_0158, R4                      ; 516F   0284 0158
        ANDI    #$0003, R4                      ; 5171   03BC 0003
        INCR    R4                              ; 5173   000C
        ADDR    R7,     R4                      ; 5174   00FC
        ADD@    R4,     R7                      ; 5175   02E7

        DECLE   $0004                           ; 5176   0004

        INCR    R0                              ; 5177   0008
        INCR    R7                              ; 5178   000F

        INCR    R3                              ; 5179   000B
L_517A:
        SUBI    #$0008, R0                      ; 517A   0338 0008
        B       L_5186                          ; 517C   0200 0008

        INCR    R0                              ; 517E   0008
        B       L_5186                          ; 517F   0200 0005

        SUBI    #$0008, R1                      ; 5181   0339 0008
        B       L_5186                          ; 5183   0200 0001

        INCR    R1                              ; 5185   0009

L_5186:
        JSR     R5,     L_51F4                  ; 5186   0004 0150 01F4

        BOV     L_51F2                          ; 5189   0202 0067
        BC      L_51C3                          ; 518B   0201 0036

        MVI@    R2,     R1                      ; 518D   0291
        SLR     R1,     1                       ; 518E   0061
        ANDI    #$00FC, R1                      ; 518F   03B9 00FC
        MVI     G_0158, R5                      ; 5191   0285 0158
        ANDI    #$0003, R5                      ; 5193   03BD 0003
        ADDR    R5,     R1                      ; 5195   00E9
        SDBD                                    ; 5196   0001
        ADDI    #$5FED, R1                      ; 5197   02F9 00ED 005F
        MVI@    R1,     R1                      ; 519A   0289
        MVII    #$0007, R0                      ; 519B   02B8 0007

        JSR     R5,     L_515B                  ; 519D   0004 0150 015B

        BNC     L_51A7                          ; 51A0   0209 0005

        SLR     R1,     2                       ; 51A2   0065
        SLR     R1,     2                       ; 51A3   0065
        SLR     R1,     1                       ; 51A4   0061
        B       L_51B8                          ; 51A5   0200 0011

L_51A7:
        ANDI    #$001F, R1                      ; 51A7   03B9 001F
        MVI@    R2,     R0                      ; 51A9   0290
        SLR     R0,     2                       ; 51AA   0064
        SLR     R0,     1                       ; 51AB   0060
        ANDI    #$001F, R0                      ; 51AC   03B8 001F
        CMPR    R1,     R0                      ; 51AE   0148
        BEQ     L_51B8                          ; 51AF   0204 0007

        PSHR    R1                              ; 51B1   0271

        JSR     R5,     L_593E                  ; 51B2   0004 0158 013E
        DECLE   $0000,  $0005                   ; 51B5   0000 0005

        PULR    R1                              ; 51B7   02B1
L_51B8:
        ANDI    #$001F, R1                      ; 51B8   03B9 001F
        SLL     R1,     2                       ; 51BA   004D
        SLL     R1,     1                       ; 51BB   0049
        MVI@    R2,     R0                      ; 51BC   0290
        SDBD                                    ; 51BD   0001
        ANDI    #$FF07, R0                      ; 51BE   03B8 0007 00FF
        XORR    R1,     R0                      ; 51C1   01C8
        MVO@    R0,     R2                      ; 51C2   0250
L_51C3:
        MVII    #$0007, R0                      ; 51C3   02B8 0007

        JSR     R5,     L_515B                  ; 51C5   0004 0150 015B

        BNC     L_51F0                          ; 51C8   0209 0026

        JSR     R5,     L_55D8                  ; 51CA   0004 0154 01D8

        MVI     G_015A, R0                      ; 51CD   0280 015A
        MVI     G_0159, R1                      ; 51CF   0281 0159

        JSR     R5,     L_51F4                  ; 51D1   0004 0150 01F4

        BC      L_51F0                          ; 51D4   0201 001A

        MVI@    R2,     R3                      ; 51D6   0293
        SLR     R3,     1                       ; 51D7   0063
        ANDI    #$00FC, R3                      ; 51D8   03BB 00FC
        MVI     G_0158, R5                      ; 51DA   0285 0158
        ANDI    #$0003, R5                      ; 51DC   03BD 0003
        ADDR    R5,     R3                      ; 51DE   00EB
        SDBD                                    ; 51DF   0001
        ADDI    #$606D, R3                      ; 51E0   02FB 006D 0060
        MVI@    R3,     R3                      ; 51E3   029B
        TSTR    R3                              ; 51E4   009B
        BEQ     L_51F0                          ; 51E5   0204 0009

        SLL     R3,     2                       ; 51E7   004F
        SLL     R3,     1                       ; 51E8   004B
        MVI@    R2,     R0                      ; 51E9   0290
        SDBD                                    ; 51EA   0001
        ANDI    #$FF07, R0                      ; 51EB   03B8 0007 00FF
        XORR    R3,     R0                      ; 51EE   01D8
        MVO@    R0,     R2                      ; 51EF   0250
L_51F0:
        CLRC                                    ; 51F0   0006
        PULR    R7                              ; 51F1   02B7

L_51F2:
        SETC                                    ; 51F2   0007
        PULR    R7                              ; 51F3   02B7

L_51F4:
        PSHR    R5                              ; 51F4   0275
        DECR    R0                              ; 51F5   0010
        SLR     R0,     2                       ; 51F6   0064
        SLR     R0,     1                       ; 51F7   0060
        SLL     R0,     2                       ; 51F8   004C
        MOVR    R0,     R2                      ; 51F9   0082
        SLL     R0,     2                       ; 51FA   004C
        ADDR    R0,     R2                      ; 51FB   00C2
        DECR    R1                              ; 51FC   0011
        SLR     R1,     2                       ; 51FD   0065
        SLR     R1,     1                       ; 51FE   0061
        ADDR    R1,     R2                      ; 51FF   00CA
        ADDI    #$0200, R2                      ; 5200   02FA 0200
        MVI@    R2,     R5                      ; 5202   0295
        SDBD                                    ; 5203   0001
        ANDI    #$0800, R5                      ; 5204   03BD 0000 0008
        BEQ     L_5210                          ; 5207   0204 0007

        MVI@    R2,     R5                      ; 5209   0295
        ANDI    #$0100, R5                      ; 520A   03BD 0100
        BNEQ    L_5210                          ; 520C   020C 0002

        CLRC                                    ; 520E   0006
        PULR    R7                              ; 520F   02B7

L_5210:
        MVI@    R2,     R5                      ; 5210   0295
        ANDI    #$01F8, R5                      ; 5211   03BD 01F8
        CMPI    #$0100, R5                      ; 5213   037D 0100
        BEQ     L_5219                          ; 5215   0204 0002

        SETC                                    ; 5217   0007
        PULR    R7                              ; 5218   02B7

L_5219:
        MVII    #$0003, R0                      ; 5219   02B8 0003
        SARC    R0,     2                       ; 521B   007C
        PULR    R7                              ; 521C   02B7

L_521D:
        PSHR    R5                              ; 521D   0275
        MVI     G_0159, R2                      ; 521E   0282 0159
        MVI     G_015A, R3                      ; 5220   0283 015A
        INCR    R1                              ; 5222   0009
        ADDR    R7,     R1                      ; 5223   00F9
        ADD@    R1,     R7                      ; 5224   02CF

        DECLE   $0004                           ; 5225   0004

        INCR    R2                              ; 5226   000A
        DECR    R0                              ; 5227   0010
        DECR    R6                              ; 5228   0016
        CMPI    #$0010, R3                      ; 5229   037B 0010
        BGT     L_5241                          ; 522B   020E 0014

        SETC                                    ; 522D   0007
        PULR    R7                              ; 522E   02B7

        CMPI    #$0060, R3                      ; 522F   037B 0060
        BLT     L_5241                          ; 5231   0205 000E

        SETC                                    ; 5233   0007
        PULR    R7                              ; 5234   02B7

        CMPI    #$0098, R2                      ; 5235   037A 0098
        BLT     L_5241                          ; 5237   0205 0008

        SETC                                    ; 5239   0007
        PULR    R7                              ; 523A   02B7

        CMPI    #$0010, R2                      ; 523B   037A 0010
        BGT     L_5241                          ; 523D   020E 0002

        SETC                                    ; 523F   0007
        PULR    R7                              ; 5240   02B7

L_5241:
        CLRC                                    ; 5241   0006
        PULR    R7                              ; 5242   02B7

L_5243:
        MVI     G_015D, R1                      ; 5243   0281 015D
        TSTR    R1                              ; 5245   0089
        BNEQ    L_5250                          ; 5246   020C 0008

        MVI     G_0165, R1                      ; 5248   0281 0165
        TSTR    R1                              ; 524A   0089
        BNEQ    L_5045                          ; 524B   022C 0207

        INCR    R1                              ; 524D   0009
        MVO     R0,     G_0165                  ; 524E   0240 0165
L_5250:
        MVI     G_0160, R1                      ; 5250   0281 0160
        TSTR    R1                              ; 5252   0089
        BNEQ    L_53DF                          ; 5253   020C 018A

        MVI     G_01A8, R1                      ; 5255   0281 01A8
        ANDI    #$0080, R1                      ; 5257   03B9 0080
        BNEQ    L_53AE                          ; 5259   020C 0153

        MVI     G_01A7, R1                      ; 525B   0281 01A7
        ANDI    #$0080, R1                      ; 525D   03B9 0080
        BNEQ    L_533C                          ; 525F   020C 00DB

L_5261:
        MVI     G_015D, R1                      ; 5261   0281 015D
        INCR    R1                              ; 5263   0009
        MVO     R1,     G_015D                  ; 5264   0241 015D
        INCR    R1                              ; 5266   0009
        ADDR    R7,     R1                      ; 5267   00F9
        ADD@    R1,     R7                      ; 5268   02CF

        CMPR    R5,     R5                      ; 5269   016D
        DECR    R0                              ; 526A   0010
        MOVR    R7,     R2                      ; 526B   00BA
        MOVR    R7,     R2                      ; 526C   00BA
        MOVR    R7,     R2                      ; 526D   00BA
        MOVR    R7,     R2                      ; 526E   00BA
        MOVR    R7,     R2                      ; 526F   00BA
        MOVR    R7,     R2                      ; 5270   00BA
        MOVR    R7,     R2                      ; 5271   00BA
        MOVR    R7,     R2                      ; 5272   00BA
        MOVR    R7,     R2                      ; 5273   00BA
        ADDR    R0,     R2                      ; 5274   00C2
        MOVR    R7,     R2                      ; 5275   00BA
        MOVR    R7,     R2                      ; 5276   00BA
        MOVR    R7,     R2                      ; 5277   00BA
        CMPR    R0,     R5                      ; 5278   0145

        JSR     R5,     L_61A1                  ; 5279   0004 0160 01A1
        DECLE   $0006                           ; 527C   0006

        CLRR    R0                              ; 527D   01C0
        MVO     R0,     G_0162                  ; 527E   0240 0162
        INCR    R0                              ; 5280   0008
        MVO     R0,     G_015C                  ; 5281   0240 015C
        MVI     G_0158, R1                      ; 5283   0281 0158
        ANDI    #$0003, R1                      ; 5285   03B9 0003
        INCR    R1                              ; 5287   0009
        ADDR    R7,     R1                      ; 5288   00F9
        ADD@    R1,     R7                      ; 5289   02CF

        JSRD    R4,     .EXEC.C41               ; 528A   0004 001E 0041

        SLLC    R1,     2                       ; 528D   005D
        MVI     G_031E, R0                      ; 528E   0280 031E
        MVII    #$0344, R4                      ; 5290   02BC 0344
        SDBD                                    ; 5292   0001
        ANDI    #$FEFF, R0                      ; 5293   03B8 00FF 00FE
        XORI    #$0100, R0                      ; 5296   03F8 0100
        MVO@    R0,     R4                      ; 5298   0260
        MVO@    R0,     R4                      ; 5299   0260
        MVI     G_0326, R0                      ; 529A   0280 0326
        ANDI    #$007F, R0                      ; 529C   03B8 007F
        SUBI    #$000D, R0                      ; 529E   0338 000D
        XORI    #$0200, R0                      ; 52A0   03F8 0200
        MVO@    R0,     R4                      ; 52A2   0260
        SUBI    #$000F, R0                      ; 52A3   0338 000F
        MVO@    R0,     R4                      ; 52A5   0260
        B       L_52C3                          ; 52A6   0200 001B

        MVI     G_031E, R0                      ; 52A8   0280 031E
        INCR    R0                              ; 52AA   0008
        MVII    #$0344, R4                      ; 52AB   02BC 0344
        SDBD                                    ; 52AD   0001
        ANDI    #$FEFF, R0                      ; 52AE   03B8 00FF 00FE
        XORI    #$0100, R0                      ; 52B1   03F8 0100
        MVO@    R0,     R4                      ; 52B3   0260
        MVO@    R0,     R4                      ; 52B4   0260
        MVI     G_0326, R0                      ; 52B5   0280 0326
        ANDI    #$007F, R0                      ; 52B7   03B8 007F
        ADDI    #$0005, R0                      ; 52B9   02F8 0005
        SDBD                                    ; 52BB   0001
        XORI    #$0E00, R0                      ; 52BC   03F8 0000 000E
        MVO@    R0,     R4                      ; 52BF   0260
        ADDI    #$000F, R0                      ; 52C0   02F8 000F
        MVO@    R0,     R4                      ; 52C2   0260
L_52C3:
        SDBD                                    ; 52C3   0001
        MVII    #$5580, R0                      ; 52C4   02B8 0080 0055
        MVO     R0,     G_0342                  ; 52C7   0240 0342
        B       L_530F                          ; 52C9   0200 0044

        MVI     G_031E, R0                      ; 52CB   0280 031E
        SDBD                                    ; 52CD   0001
        ADDI    #$0405, R0                      ; 52CE   02F8 0005 0004
        MVII    #$0344, R4                      ; 52D1   02BC 0344
        SDBD                                    ; 52D3   0001
        ANDI    #$FEFF, R0                      ; 52D4   03B8 00FF 00FE
        XORI    #$0100, R0                      ; 52D7   03F8 0100
        MVO@    R0,     R4                      ; 52D9   0260
        ADDI    #$000F, R0                      ; 52DA   02F8 000F
        MVO@    R0,     R4                      ; 52DC   0260
        MVI     G_0326, R0                      ; 52DD   0280 0326
        ANDI    #$007F, R0                      ; 52DF   03B8 007F
        XORI    #$0100, R0                      ; 52E1   03F8 0100
        MVO@    R0,     R4                      ; 52E3   0260
        MVO@    R0,     R4                      ; 52E4   0260
        B       L_5305                          ; 52E5   0200 001E

        MVI     G_031E, R0                      ; 52E7   0280 031E
        SUBI    #$000D, R0                      ; 52E9   0338 000D
        SDBD                                    ; 52EB   0001
        ADDI    #$0400, R0                      ; 52EC   02F8 0000 0004
        MVII    #$0344, R4                      ; 52EF   02BC 0344
        SDBD                                    ; 52F1   0001
        ANDI    #$FEFF, R0                      ; 52F2   03B8 00FF 00FE
        XORI    #$0100, R0                      ; 52F5   03F8 0100
        MVO@    R0,     R4                      ; 52F7   0260
        SUBI    #$000F, R0                      ; 52F8   0338 000F
        MVO@    R0,     R4                      ; 52FA   0260
        MVI     G_0326, R0                      ; 52FB   0280 0326
        ANDI    #$007F, R0                      ; 52FD   03B8 007F
        SDBD                                    ; 52FF   0001
        XORI    #$0500, R0                      ; 5300   03F8 0000 0005
        MVO@    R0,     R4                      ; 5303   0260
        MVO@    R0,     R4                      ; 5304   0260
L_5305:
        SDBD                                    ; 5305   0001
        MVII    #$5530, R0                      ; 5306   02B8 0030 0055
        MVO     R0,     G_0342                  ; 5309   0240 0342
        MVII    #$0001, R0                      ; 530B   02B8 0001
        MVO     R0,     G_0162                  ; 530D   0240 0162
L_530F:
        SDBD                                    ; 530F   0001
        MVII    #$09F2, R0                      ; 5310   02B8 00F2 0009
        MVO@    R0,     R4                      ; 5313   0260
        ADDI    #$0008, R0                      ; 5314   02F8 0008
        MVO@    R0,     R4                      ; 5316   0260
        SDBD                                    ; 5317   0001
        MVII    #$39F0, R0                      ; 5318   02B8 00F0 0039
        MVO     R0,     G_0343                  ; 531B   0240 0343
        MVII    #$0007, R0                      ; 531D   02B8 0007
        MVO     R0,     G_0102                  ; 531F   0240 0102
        B       L_53D6                          ; 5321   0200 00B3

        MVI     G_0342, R0                      ; 5323   0280 0342
        ADDI    #$0008, R0                      ; 5325   02F8 0008
        MVO     R0,     G_0342                  ; 5327   0240 0342
        B       L_53D6                          ; 5329   0200 00AB

        MVI     G_0343, R0                      ; 532B   0280 0343
        TSTR    R0                              ; 532D   0080
        BEQ     L_53AE                          ; 532E   0204 007E

        ADDI    #$0008, R0                      ; 5330   02F8 0008
        MVO     R0,     G_0343                  ; 5332   0240 0343
        MVI     G_0342, R0                      ; 5334   0280 0342
        SUBI    #$0040, R0                      ; 5336   0338 0040
        MVO     R0,     G_0342                  ; 5338   0240 0342
        B       L_53D6                          ; 533A   0200 009A

L_533C:
        MVI     G_0158, R1                      ; 533C   0281 0158
        ANDI    #$0003, R1                      ; 533E   03B9 0003
        INCR    R1                              ; 5340   0009
        ADDR    R7,     R1                      ; 5341   00F9
        ADD@    R1,     R7                      ; 5342   02CF

        DECLE   $000F,  $0027,  $0004           ; 5343   000F 0027 0004

        COMR    R3                              ; 5346   001B
        MVI     G_015A, R1                      ; 5347   0281 015A
        MVI     G_0159, R0                      ; 5349   0280 0159
        ADD     G_015D, R0                      ; 534B   02C0 015D
        ADD     G_015D, R0                      ; 534D   02C0 015D
        MOVR    R0,     R3                      ; 534F   0083
        B       L_5373                          ; 5350   0200 0021

        MVI     G_015A, R1                      ; 5352   0281 015A
        SUB     G_015D, R1                      ; 5354   0301 015D
        SUB     G_015D, R1                      ; 5356   0301 015D
        MOVR    R1,     R3                      ; 5358   008B
        NEGR    R3                              ; 5359   0023
        MVI     G_0159, R0                      ; 535A   0280 0159
        B       L_5373                          ; 535C   0200 0015

        MVI     G_0159, R0                      ; 535E   0280 0159
        SUB     G_015D, R0                      ; 5360   0300 015D
        SUB     G_015D, R0                      ; 5362   0300 015D
        MOVR    R0,     R3                      ; 5364   0083
        NEGR    R3                              ; 5365   0023
        MVI     G_015A, R1                      ; 5366   0281 015A
        B       L_5373                          ; 5368   0200 0009

        MVI     G_015A, R1                      ; 536A   0281 015A
        ADD     G_015D, R1                      ; 536C   02C1 015D
        ADD     G_015D, R1                      ; 536E   02C1 015D
        MOVR    R1,     R3                      ; 5370   008B
        MVI     G_0159, R0                      ; 5371   0280 0159
L_5373:
        DECR    R1                              ; 5373   0011
        SLR     R1,     2                       ; 5374   0065
        SLR     R1,     1                       ; 5375   0061
        SLL     R1,     2                       ; 5376   004D
        MOVR    R1,     R2                      ; 5377   008A
        SLL     R1,     2                       ; 5378   004D
        ADDR    R1,     R2                      ; 5379   00CA
        DECR    R0                              ; 537A   0010
        SLR     R0,     2                       ; 537B   0064
        SLR     R0,     1                       ; 537C   0060
        ADDR    R0,     R2                      ; 537D   00C2
        ADDI    #$0200, R2                      ; 537E   02FA 0200
        MVI@    R2,     R0                      ; 5380   0290
        SDBD                                    ; 5381   0001
        ANDI    #$0800, R0                      ; 5382   03B8 0000 0008
        BEQ     L_5261                          ; 5385   0224 0125

        MVI@    R2,     R0                      ; 5387   0290
        ANDI    #$01F8, R0                      ; 5388   03B8 01F8
        CMPI    #$0100, R0                      ; 538A   0378 0100
        BEQ     L_53AE                          ; 538C   0204 0020
        BGT     L_5261                          ; 538E   022E 012E

        SLR     R0,     2                       ; 5390   0064
        SDBD                                    ; 5391   0001
        MVII    #$612D, R2                      ; 5392   02BA 002D 0061
        ADDR    R0,     R2                      ; 5395   00C2
        MVI     G_0158, R0                      ; 5396   0280 0158
        ANDI    #$0003, R0                      ; 5398   03B8 0003
        CMPI    #$0002, R0                      ; 539A   0378 0002
        BLT     L_539F                          ; 539C   0205 0001

        INCR    R2                              ; 539E   000A
L_539F:
        MVI@    R2,     R0                      ; 539F   0290
        MVI     G_0158, R2                      ; 53A0   0282 0158
        SARC    R2,     1                       ; 53A2   007A
        BC      L_53A7                          ; 53A3   0201 0002

        SLR     R0,     2                       ; 53A5   0064
        SLR     R0,     2                       ; 53A6   0064
L_53A7:
        ANDI    #$0007, R3                      ; 53A7   03BB 0007
        ANDI    #$000F, R0                      ; 53A9   03B8 000F
        CMPR    R3,     R0                      ; 53AB   0158
        BGT     L_5261                          ; 53AC   022E 014C

L_53AE:
        CLRR    R0                              ; 53AE   01C0
        MVO     R0,     G_0346                  ; 53AF   0240 0346
        MVO     R0,     G_015D                  ; 53B1   0240 015D
        MVO     R0,     G_0162                  ; 53B3   0240 0162
        NOP                                     ; 53B5   0034
        MVO     R0,     G_0343                  ; 53B6   0240 0343
        MVO     R0,     G_0160                  ; 53B8   0240 0160
        MVII    #$0008, R0                      ; 53BA   02B8 0008
        MVO     R0,     G_0102                  ; 53BC   0240 0102

        JSR     R5,     L_6CB6                  ; 53BE   0004 016C 00B6
        DECLE   $0005                           ; 53C1   0005

        JSR     R5,     L_5447                  ; 53C2   0004 0154 0047

        MVI     G_014C, R1                      ; 53C5   0281 014C
        MVII    #$0002, R0                      ; 53C7   02B8 0002
        TSTR    R1                              ; 53C9   0089
        BEQ     L_53D1                          ; 53CA   0204 0005

        MVII    #$0008, R1                      ; 53CC   02B9 0008
        MVO     R1,     G_014B                  ; 53CE   0241 014B
        INCR    R0                              ; 53D0   0008

L_53D1:
        JSR     R5,     L_6C95                  ; 53D1   0004 016C 0095
        DECLE   $0000                           ; 53D4   0000

        PULR    R7                              ; 53D5   02B7

L_53D6:
        JSR     R5,     L_5447                  ; 53D6   0004 0154 0047
        JSR     R5,     L_6C94                  ; 53D9   0004 016C 0094
        DECLE   $0001,  $0000                   ; 53DC   0001 0000

        PULR    R7                              ; 53DE   02B7

L_53DF:
        MVI     G_0163, R0                      ; 53DF   0280 0163
        TSTR    R0                              ; 53E1   0080
        BEQ     L_53D6                          ; 53E2   0224 000D

        MVII    #$000F, R0                      ; 53E4   02B8 000F
        MVO     R0,     G_0164                  ; 53E6   0240 0164
        MVI     G_0161, R1                      ; 53E8   0281 0161
        ADDI    #$011B, R1                      ; 53EA   02F9 011B
        MVI@    R1,     R0                      ; 53EC   0288
        CMPI    #$0001, R0                      ; 53ED   0378 0001
        BNEQ    L_53F6                          ; 53EF   020C 0005

        CLRR    R0                              ; 53F1   01C0
        MVO     R0,     G_0160                  ; 53F2   0240 0160
        B       L_53D6                          ; 53F4   0220 001F

L_53F6:
        CMPI    #$0003, R0                      ; 53F6   0378 0003
        BEQ     L_53FE                          ; 53F8   0204 0004

        CMPI    #$0004, R0                      ; 53FA   0378 0004
        BNEQ    L_53D6                          ; 53FC   022C 0027

L_53FE:
        INCR    R0                              ; 53FE   0008
        MVO@    R0,     R1                      ; 53FF   0248
        CMPI    #$0005, R0                      ; 5400   0378 0005
        BGE     L_540C                          ; 5402   020D 0008

        PSHR    R0                              ; 5404   0270
        PSHR    R1                              ; 5405   0271

        JSR     R5,     L_61A1                  ; 5406   0004 0160 01A1
        DECLE   $0007                           ; 5409   0007

        B       L_5412                          ; 540A   0200 0006

L_540C:
        PSHR    R0                              ; 540C   0270
        PSHR    R1                              ; 540D   0271

        JSR     R5,     L_61A1                  ; 540E   0004 0160 01A1
        DECLE   $0005                           ; 5411   0005
L_5412:
        PULR    R1                              ; 5412   02B1
        PULR    R0                              ; 5413   02B0
        ADDI    #$0006, R1                      ; 5414   02F9 0006
        MVII    #$002D, R2                      ; 5416   02BA 002D
        CLRR    R5                              ; 5418   01ED
        CMPI    #$0005, R0                      ; 5419   0378 0005
        BNEQ    L_5426                          ; 541B   020C 0009

        SLR     R2,     2                       ; 541D   0066
        ADD     G_0162, R5                      ; 541E   02C5 0162
        BEQ     L_5426                          ; 5420   0204 0004

        SDBD                                    ; 5422   0001
        MVII    #$1000, R5                      ; 5423   02BD 0000 0010
L_5426:
        MVO@    R2,     R1                      ; 5426   024A
        PSHR    R0                              ; 5427   0270
        MVI     G_0161, R1                      ; 5428   0281 0161
        ADDI    #$0318, R1                      ; 542A   02F9 0318
        MVI@    R1,     R0                      ; 542C   0288
        SDBD                                    ; 542D   0001
        ANDI    #$7FFF, R0                      ; 542E   03B8 00FF 007F
        COMR    R5                              ; 5431   001D
        ANDR    R5,     R0                      ; 5432   01A8
        COMR    R5                              ; 5433   001D
        XORR    R5,     R0                      ; 5434   01E8
        MVO@    R0,     R1                      ; 5435   0248

        JSR     R5,     L_6CB6                  ; 5436   0004 016C 00B6
        DECLE   $0005                           ; 5439   0005

        JSR     R5,     L_6C94                  ; 543A   0004 016C 0094
        DECLE   $002D,  $0005                   ; 543D   002D 0005

        PULR    R0                              ; 543F   02B0
        CMPI    #$0005, R0                      ; 5440   0378 0005
        BNEQ    L_53D6                          ; 5442   022C 006D

        NOP                                     ; 5444   0034
        B       L_53AE                          ; 5445   0220 0098

L_5447:
        PSHR    R5                              ; 5447   0275
        MVI     G_015D, R1                      ; 5448   0281 015D
        TSTR    R1                              ; 544A   0089
        BEQ     L_54CC                          ; 544B   0204 007F

        MVI     G_0160, R1                      ; 544D   0281 0160
        CMPI    #$0080, R1                      ; 544F   0379 0080
        BEQ     L_5456                          ; 5451   0204 0003

        TSTR    R1                              ; 5453   0089
        BNEQ    L_54CC                          ; 5454   020C 0076

L_5456:
        CLRR    R1                              ; 5456   01C9
        MVI     G_01A6, R2                      ; 5457   0282 01A6
L_5459:
        SARC    R2,     1                       ; 5459   007A
        BC      L_5463                          ; 545A   0201 0007

        INCR    R1                              ; 545C   0009
        CMPI    #$0006, R1                      ; 545D   0379 0006
        BNEQ    L_5459                          ; 545F   022C 0007
        B       L_54CC                          ; 5461   0200 0069

L_5463:
        MVO     R1,     G_0161                  ; 5463   0241 0161
        MOVR    R1,     R3                      ; 5465   008B
        ADDI    #$011B, R3                      ; 5466   02FB 011B
        MVI@    R3,     R0                      ; 5468   0298
        TSTR    R0                              ; 5469   0080
        BEQ     L_5459                          ; 546A   0224 0012

        CMPI    #$0002, R0                      ; 546C   0378 0002
        BNEQ    L_5478                          ; 546E   020C 0008

        CLRR    R0                              ; 5470   01C0
        MVO     R0,     G_0165                  ; 5471   0240 0165
        MVII    #$0080, R0                      ; 5473   02B8 0080
        MVO     R0,     G_0160                  ; 5475   0240 0160
        PULR    R7                              ; 5477   02B7

L_5478:
        CMPI    #$0005, R0                      ; 5478   0378 0005
        BGE     L_5459                          ; 547A   022D 0022

        CMPI    #$0001, R0                      ; 547C   0378 0001
        BNEQ    L_5481                          ; 547E   020C 0001

        INCR    R0                              ; 5480   0008
L_5481:
        INCR    R0                              ; 5481   0008
        MVO@    R0,     R3                      ; 5482   0258
        PSHR    R0                              ; 5483   0270
        PSHR    R1                              ; 5484   0271
        PSHR    R3                              ; 5485   0273
        CMPI    #$0005, R0                      ; 5486   0378 0005
        BGE     L_5490                          ; 5488   020D 0006

        JSR     R5,     L_61A1                  ; 548A   0004 0160 01A1
        DECLE   $0007                           ; 548D   0007

        B       L_5494                          ; 548E   0200 0004

L_5490:
        JSR     R5,     L_61A1                  ; 5490   0004 0160 01A1
        DECLE   $0005                           ; 5493   0005
L_5494:
        PULR    R3                              ; 5494   02B3
        PULR    R1                              ; 5495   02B1
        PULR    R0                              ; 5496   02B0
        ADDI    #$0006, R3                      ; 5497   02FB 0006
        MVII    #$002D, R2                      ; 5499   02BA 002D
        MVO@    R2,     R3                      ; 549B   025A
        MVI     G_0158, R1                      ; 549C   0281 0158
        XORI    #$0080, R1                      ; 549E   03F9 0080
        MVO     R1,     G_0158                  ; 54A0   0241 0158
        MVI     G_0344, R1                      ; 54A2   0281 0344
        XORI    #$0100, R1                      ; 54A4   03F9 0100
        MVO     R1,     G_0344                  ; 54A6   0241 0344
        MVI     G_0345, R1                      ; 54A8   0281 0345
        XORI    #$0100, R1                      ; 54AA   03F9 0100
        MVO     R1,     G_0345                  ; 54AC   0241 0345
        CLRR    R1                              ; 54AE   01C9
        MVO     R1,     G_01A6                  ; 54AF   0241 01A6
        MVII    #$000F, R0                      ; 54B1   02B8 000F
        MVO     R0,     G_0164                  ; 54B3   0240 0164
        MVI     G_0161, R1                      ; 54B5   0281 0161
        ADDI    #$0318, R1                      ; 54B7   02F9 0318
        MVI@    R1,     R2                      ; 54B9   028A
        SDBD                                    ; 54BA   0001
        ANDI    #$7FFF, R2                      ; 54BB   03BA 00FF 007F
        MVO@    R2,     R1                      ; 54BE   024A

        JSR     R5,     L_6CB6                  ; 54BF   0004 016C 00B6
        DECLE   $0005                           ; 54C2   0005

        JSR     R5,     L_6C94                  ; 54C3   0004 016C 0094
        DECLE   $002D,  $0005                   ; 54C6   002D 0005

        MVII    #$0001, R0                      ; 54C8   02B8 0001
        MVO     R0,     G_0160                  ; 54CA   0240 0160
L_54CC:
        PULR    R7                              ; 54CC   02B7

        PSHR    R5                              ; 54CD   0275
        CLRR    R5                              ; 54CE   01ED
        MVO     R5,     G_0160                  ; 54CF   0245 0160
        MVO     R5,     G_0346                  ; 54D1   0245 0346
        MVO     R5,     G_015D                  ; 54D3   0245 015D
        NOP                                     ; 54D5   0034
        MVO     R5,     G_0343                  ; 54D6   0245 0343
        MVO     R5,     G_0160                  ; 54D8   0245 0160
        MVO     R5,     G_0164                  ; 54DA   0245 0164
        PULR    R7                              ; 54DC   02B7

L_54DD:
        PSHR    R5                              ; 54DD   0275
        MVI     G_015F, R0                      ; 54DE   0280 015F
        TSTR    R0                              ; 54E0   0080
        BNEQ    L_5523                          ; 54E1   020C 0040

        MVI     G_015C, R4                      ; 54E3   0284 015C
        TSTR    R4                              ; 54E5   00A4
        BNEQ    L_5512                          ; 54E6   020C 002A

        ADD     G_0343, R4                      ; 54E8   02C4 0343
        BEQ     L_551F                          ; 54EA   0204 0033

        MVI     G_0342, R5                      ; 54EC   0285 0342
        MVI@    R5,     R0                      ; 54EE   02A8
        MVO@    R0,     R4                      ; 54EF   0260
        MVI@    R5,     R0                      ; 54F0   02A8
        MVO@    R0,     R4                      ; 54F1   0260
        MVI@    R5,     R0                      ; 54F2   02A8
        MVO@    R0,     R4                      ; 54F3   0260
        MVI@    R5,     R0                      ; 54F4   02A8
        MVO@    R0,     R4                      ; 54F5   0260
        MVI@    R5,     R0                      ; 54F6   02A8
        MVO@    R0,     R4                      ; 54F7   0260
        MVI@    R5,     R0                      ; 54F8   02A8
        MVO@    R0,     R4                      ; 54F9   0260
        MVI@    R5,     R0                      ; 54FA   02A8
        MVO@    R0,     R4                      ; 54FB   0260
        MVI@    R5,     R0                      ; 54FC   02A8
        MVO@    R0,     R4                      ; 54FD   0260
        MVI     G_015B, R4                      ; 54FE   0284 015B
        XORI    #$0001, R4                      ; 5500   03FC 0001
        MVO     R4,     G_015B                  ; 5502   0244 015B
        ADDI    #$0344, R4                      ; 5504   02FC 0344
        MVI@    R4,     R0                      ; 5506   02A0
        MVO     R0,     .STIC.X.7               ; 5507   0240 0007
        INCR    R4                              ; 5509   000C
        MVI@    R4,     R0                      ; 550A   02A0
        MVO     R0,     .STIC.Y.7               ; 550B   0240 000F
        INCR    R4                              ; 550D   000C
        MVI@    R4,     R0                      ; 550E   02A0
        MVO     R0,     .STIC.A.7               ; 550F   0240 0017
L_5511:
        PULR    R7                              ; 5511   02B7

L_5512:
        SDBD                                    ; 5512   0001
        MVII    #$39F0, R4                      ; 5513   02BC 00F0 0039
        MVII    #$0010, R0                      ; 5516   02B8 0010

        JSR     R5,     L_6CFF                  ; 5518   0004 016C 00FF

        CLRR    R0                              ; 551B   01C0
        MVO     R0,     G_015C                  ; 551C   0240 015C
        PULR    R7                              ; 551E   02B7

L_551F:
        ADD     G_0113, R4                      ; 551F   02C4 0113
        BNEQ    L_5511                          ; 5521   022C 0011

L_5523:
        MVI     G_031F, R0                      ; 5523   0280 031F
        MVO     R0,     .STIC.X.7               ; 5525   0240 0007
        MVI     G_0327, R0                      ; 5527   0280 0327
        MVO     R0,     .STIC.Y.7               ; 5529   0240 000F
        MVI     G_032F, R0                      ; 552B   0280 032F
        MVO     R0,     .STIC.A.7               ; 552D   0240 0017
        PULR    R7                              ; 552F   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5530   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $0000,  $0000   ; 5534   0000 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5538   0000 0000 0000 0000
        DECLE   $0080,  $00C0,  $0080,  $0000   ; 553C   0080 00C0 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5540   0000 0000 0000 0000
        DECLE   $0040,  $00E0,  $0040,  $0000   ; 5544   0040 00E0 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0020   ; 5548   0000 0000 0000 0020
        DECLE   $0070,  $00A0,  $0000,  $0000   ; 554C   0070 00A0 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0038   ; 5550   0000 0000 0010 0038
        DECLE   $0050,  $0080,  $0000,  $0000   ; 5554   0050 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0028   ; 5558   0000 0000 0000 0028
        DECLE   $005C,  $0088,  $0000,  $0000   ; 555C   005C 0088 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0020   ; 5560   0000 0000 0000 0020
        DECLE   $0054,  $008E,  $0004,  $0000   ; 5564   0054 008E 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0020   ; 5568   0000 0000 0000 0020
        DECLE   $0050,  $008A,  $0007,  $0002   ; 556C   0050 008A 0007 0002
        DECLE   $0000,  $0000,  $0000,  $0020   ; 5570   0000 0000 0000 0020
        DECLE   $0051,  $008B,  $0005,  $0000   ; 5574   0051 008B 0005 0000
        DECLE   $0000,  $0000,  $0000,  $0020   ; 5578   0000 0000 0000 0020
        DECLE   $0051,  $008A,  $0004,  $0000   ; 557C   0051 008A 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5580   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; 5584   0000 0000 0000 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5588   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $000E   ; 558C   0000 0000 0004 000E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5590   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $000E,  $0004   ; 5594   0000 0004 000E 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5598   0000 0000 0000 0000
        DECLE   $0008,  $001C,  $0008,  $0004   ; 559C   0008 001C 0008 0004
        DECLE   $0000,  $0000,  $0000,  $0010   ; 55A0   0000 0000 0000 0010
        DECLE   $0038,  $0010,  $0008,  $0004   ; 55A4   0038 0010 0008 0004
        DECLE   $0000,  $0000,  $0008,  $001C   ; 55A8   0000 0000 0008 001C
        DECLE   $0008,  $0010,  $0008,  $0004   ; 55AC   0008 0010 0008 0004
        DECLE   $0000,  $0004,  $000E,  $0004   ; 55B0   0000 0004 000E 0004
        DECLE   $0008,  $0010,  $0008,  $0004   ; 55B4   0008 0010 0008 0004
        DECLE   $0002,  $0007,  $0002,  $0004   ; 55B8   0002 0007 0002 0004
        DECLE   $0008,  $0010,  $0008,  $0004   ; 55BC   0008 0010 0008 0004
        DECLE   $000E,  $0004,  $0002,  $0004   ; 55C0   000E 0004 0002 0004
        DECLE   $0008,  $0010,  $0008,  $0004   ; 55C4   0008 0010 0008 0004
        DECLE   $0008,  $0004,  $0002,  $0004   ; 55C8   0008 0004 0002 0004
        DECLE   $0008,  $0010,  $0008,  $0004   ; 55CC   0008 0010 0008 0004
        DECLE   $0000,  $0003,  $0001,  $0002   ; 55D0   0000 0003 0001 0002
        DECLE   $0001,  $0000                   ; 55D4   0001 0000

        DIS                                     ; 55D6   0003
        EIS                                     ; 55D7   0002
L_55D8:
        PSHR    R5                              ; 55D8   0275
        MVI     G_015A, R0                      ; 55D9   0280 015A
        MOVR    R0,     R1                      ; 55DB   0081
        ANDI    #$0007, R1                      ; 55DC   03B9 0007
        BNEQ    L_563B                          ; 55DE   020C 005B

        SUBI    #$0008, R0                      ; 55E0   0338 0008
        MVI     G_0159, R1                      ; 55E2   0281 0159
        MOVR    R1,     R2                      ; 55E4   008A
        ANDI    #$0007, R2                      ; 55E5   03BA 0007
        BNEQ    L_563B                          ; 55E7   020C 0052

        JSR     R5,     L_51F4                  ; 55E9   0004 0150 01F4

        BNOV    L_563B                          ; 55EC   020A 004D

        JSR     R5,     L_58B7                  ; 55EE   0004 0158 00B7

        BPL     L_55F5                          ; 55F1   0203 0002

        MVII    #$0080, R0                      ; 55F3   02B8 0080
L_55F5:
        MVO     R0,     G_0166                  ; 55F5   0240 0166
        MVI     G_0159, R3                      ; 55F7   0283 0159
        XORI    #$0300, R3                      ; 55F9   03FB 0300
        MVO     R3,     G_034A                  ; 55FB   0243 034A
        SWAP    R0,     2                       ; 55FD   0044
        BMI     L_5603                          ; 55FE   020B 0003

        MVO@    R3,     R1                      ; 5600   024B
        ADDI    #$0008, R1                      ; 5601   02F9 0008
L_5603:
        MVI     G_015A, R3                      ; 5603   0283 015A
        ADDI    #$00F8, R3                      ; 5605   02FB 00F8
        MVO     R3,     G_034B                  ; 5607   0243 034B
        SWAP    R0,     2                       ; 5609   0044
        BMI     L_5618                          ; 560A   020B 000C

        MVO@    R3,     R1                      ; 560C   024B
        ADDI    #$0008, R1                      ; 560D   02F9 0008
        SDBD                                    ; 560F   0001
        MVII    #$197B, R3                      ; 5610   02BB 007B 0019
        MVO@    R3,     R1                      ; 5613   024B
        MVII    #$0001, R1                      ; 5614   02B9 0001
        MVO     R1,     G_0113                  ; 5616   0241 0113
L_5618:
        MVII    #$0001, R0                      ; 5618   02B8 0001
        MVO     R0,     G_0167                  ; 561A   0240 0167
        MVI@    R2,     R0                      ; 561C   0290
        SDBD                                    ; 561D   0001
        SUBI    #$2008, R0                      ; 561E   0338 0008 0020
        SDBD                                    ; 5621   0001
        XORI    #$8000, R0                      ; 5622   03F8 0000 0080
        MVO@    R0,     R2                      ; 5625   0250
        INCR    R2                              ; 5626   000A
        MVI@    R2,     R0                      ; 5627   0290
        SDBD                                    ; 5628   0001
        XORI    #$2000, R0                      ; 5629   03F8 0000 0020
        MVO@    R0,     R2                      ; 562C   0250
        SDBD                                    ; 562D   0001
        MVII    #$58CE, R0                      ; 562E   02B8 00CE 0058
        MVO     R0,     G_034C                  ; 5631   0240 034C

        JSR     R5,     L_6C94                  ; 5633   0004 016C 0094
        DECLE   $0006,  $0002                   ; 5636   0006 0002

        JSR     R5,     L_563C                  ; 5638   0004 0154 023C

L_563B:
        PULR    R7                              ; 563B   02B7

L_563C:
        PSHR    R5                              ; 563C   0275
        MVII    #$0318, R1                      ; 563D   02B9 0318
        MVII    #$0320, R2                      ; 563F   02BA 0320
        MVII    #$011B, R3                      ; 5641   02BB 011B
        MVI     G_034B, R4                      ; 5643   0284 034B
        MVI     G_034A, R5                      ; 5645   0285 034A
        ANDI    #$007F, R4                      ; 5647   03BC 007F
        ADDI    #$0008, R4                      ; 5649   02FC 0008
        ANDI    #$00FF, R5                      ; 564B   03BD 00FF
L_564D:
        MVI@    R2,     R0                      ; 564D   0290
        ANDI    #$007F, R0                      ; 564E   03B8 007F
        SUBR    R4,     R0                      ; 5650   0120
        BMI     L_5671                          ; 5651   020B 001E

        MVI@    R1,     R0                      ; 5653   0288
        ANDI    #$00FF, R0                      ; 5654   03B8 00FF
        SUBR    R5,     R0                      ; 5656   0128
        BPL     L_565A                          ; 5657   0203 0001

        NEGR    R0                              ; 5659   0020
L_565A:
        CMPI    #$000C, R0                      ; 565A   0378 000C
        BGT     L_5671                          ; 565C   020E 0013

        MVI@    R3,     R0                      ; 565E   0298
        DECR    R0                              ; 565F   0010
        BNEQ    L_5671                          ; 5660   020C 000F

        PSHR    R3                              ; 5662   0273
        SUBI    #$011B, R3                      ; 5663   033B 011B
        ADDI    #$0115, R3                      ; 5665   02FB 0115
        PSHR    R3                              ; 5667   0273
        MVI@    R3,     R3                      ; 5668   029B
        SDBD                                    ; 5669   0001
        ADDI    #$58C5, R3                      ; 566A   02FB 00C5 0058
        MVI@    R3,     R0                      ; 566D   0298
        PULR    R3                              ; 566E   02B3
        MVO@    R0,     R3                      ; 566F   0258
        PULR    R3                              ; 5670   02B3
L_5671:
        INCR    R1                              ; 5671   0009
        INCR    R2                              ; 5672   000A
        INCR    R3                              ; 5673   000B
        CMPI    #$031E, R1                      ; 5674   0379 031E
        BNEQ    L_564D                          ; 5676   022C 002A
        PULR    R7                              ; 5678   02B7

        PSHR    R5                              ; 5679   0275
        MVI     G_034B, R0                      ; 567A   0280 034B
        SDBD                                    ; 567C   0001
        XORI    #$0400, R0                      ; 567D   03F8 0000 0004
        MVO     R0,     G_034B                  ; 5680   0240 034B
        MVI     G_0166, R1                      ; 5682   0281 0166
        SWAP    R1,     2                       ; 5684   0045
        BMI     L_568C                          ; 5685   020B 0005

        ANDI    #$0007, R1                      ; 5687   03B9 0007
        ADDI    #$0320, R1                      ; 5689   02F9 0320
        MVO@    R0,     R1                      ; 568B   0248
L_568C:
        MVI     G_0167, R0                      ; 568C   0280 0167
        INCR    R0                              ; 568E   0008
        MVO     R0,     G_0167                  ; 568F   0240 0167
        CMPI    #$0006, R0                      ; 5691   0378 0006
        BEQ     L_569B                          ; 5693   0204 0006

        JSR     R5,     L_6C94                  ; 5695   0004 016C 0094
        DECLE   $0006,  $0002                   ; 5698   0006 0002

        PULR    R7                              ; 569A   02B7

L_569B:
        JSR     R5,     L_61A1                  ; 569B   0004 0160 01A1
        DECLE   $0010                           ; 569E   0010

        INCR    R7                              ; 569F   000F

        PSHR    R5                              ; 56A0   0275

L_56A1:
        JSR     R5,     L_5822                  ; 56A1   0004 0158 0022

        BC      L_5772                          ; 56A4   0201 00CC

        MVI     G_034B, R0                      ; 56A6   0280 034B
        ADDI    #$0002, R0                      ; 56A8   02F8 0002
        MVO     R0,     G_034B                  ; 56AA   0240 034B
        MVI     G_0166, R1                      ; 56AC   0281 0166
        SWAP    R1,     2                       ; 56AE   0045
        BMI     L_56B6                          ; 56AF   020B 0005

        ANDI    #$0007, R1                      ; 56B1   03B9 0007
        ADDI    #$0320, R1                      ; 56B3   02F9 0320
        MVO@    R0,     R1                      ; 56B5   0248

L_56B6:
        JSR     R5,     L_6C94                  ; 56B6   0004 016C 0094
        DECLE   $0001,  $0003                   ; 56B9   0001 0003

        JSR     R5,     L_56BF                  ; 56BB   0004 0154 02BF

        PULR    R7                              ; 56BE   02B7

L_56BF:
        PSHR    R5                              ; 56BF   0275
        MVII    #$0320, R1                      ; 56C0   02B9 0320
        MVII    #$0318, R2                      ; 56C2   02BA 0318
        MVII    #$011B, R3                      ; 56C4   02BB 011B
        MVI     G_034B, R4                      ; 56C6   0284 034B
        MVI     G_034A, R5                      ; 56C8   0285 034A
        ANDI    #$007F, R4                      ; 56CA   03BC 007F
        SUBI    #$0008, R4                      ; 56CC   033C 0008
        ANDI    #$00FF, R5                      ; 56CE   03BD 00FF
L_56D0:
        MVI@    R1,     R0                      ; 56D0   0288
        TSTR    R0                              ; 56D1   0080
        BPL     L_56E0                          ; 56D2   0203 000C

        ANDI    #$007F, R0                      ; 56D4   03B8 007F
        CMPI    #$0062, R0                      ; 56D6   0378 0062
        BEQ     L_5760                          ; 56D8   0204 0086

        MVI@    R1,     R0                      ; 56DA   0288
        INCR    R0                              ; 56DB   0008
        INCR    R0                              ; 56DC   0008
        MVO@    R0,     R1                      ; 56DD   0248
        B       L_5760                          ; 56DE   0200 0080

L_56E0:
        ANDI    #$007F, R0                      ; 56E0   03B8 007F
        SUBR    R4,     R0                      ; 56E2   0120
        CMPI    #$0002, R0                      ; 56E3   0378 0002
        BLE     L_5760                          ; 56E5   0206 0079

        CMPI    #$000E, R0                      ; 56E7   0378 000E
        BGT     L_5760                          ; 56E9   020E 0075

        MVI@    R2,     R0                      ; 56EB   0290
        ANDI    #$00FF, R0                      ; 56EC   03B8 00FF
        SUBR    R5,     R0                      ; 56EE   0128
        CMPI    #$0004, R0                      ; 56EF   0378 0004
        BGT     L_5760                          ; 56F1   020E 006D

        SDBD                                    ; 56F3   0001
        CMPI    #$FFFA, R0                      ; 56F4   0378 00FA 00FF
        BLT     L_5760                          ; 56F7   0205 0067

        CMPI    #$031E, R2                      ; 56F9   037A 031E
        BEQ     L_571B                          ; 56FB   0204 001E

        MVI@    R3,     R0                      ; 56FD   0298
        TSTR    R0                              ; 56FE   0080
        BEQ     L_5760                          ; 56FF   0204 005F

        CMPI    #$0002, R0                      ; 5701   0378 0002
        BNEQ    L_571B                          ; 5703   020C 0016

        PSHR    R1                              ; 5705   0271
        SUBI    #$0320, R1                      ; 5706   0339 0320
        ADDI    #$0339, R1                      ; 5708   02F9 0339
        MVI@    R1,     R0                      ; 570A   0288
        PULR    R1                              ; 570B   02B1
        ADDI    #$0008, R1                      ; 570C   02F9 0008
        MVO@    R0,     R1                      ; 570E   0248
        ADDI    #$0008, R1                      ; 570F   02F9 0008
        MVI@    R1,     R0                      ; 5711   0288
        SDBD                                    ; 5712   0001
        SUBI    #$0400, R0                      ; 5713   0338 0000 0004
        MVO@    R0,     R1                      ; 5716   0248
        SUBI    #$0010, R1                      ; 5717   0339 0010
        B       L_5732                          ; 5719   0200 0017

L_571B:
        CMPI    #$0007, R0                      ; 571B   0378 0007
        BNEQ    L_5732                          ; 571D   020C 0013

        MVI     G_0156, R0                      ; 571F   0280 0156
        TSTR    R0                              ; 5721   0080
        BEQ     L_5732                          ; 5722   0204 000E

        PSHR    R3                              ; 5724   0273
        MVII    #$0318, R3                      ; 5725   02BB 0318
        ADD     G_0155, R3                      ; 5727   02C3 0155
        CLRR    R0                              ; 5729   01C0
        MVO@    R0,     R3                      ; 572A   0258
        PULR    R3                              ; 572B   02B3
        MVO     R0,     G_033F                  ; 572C   0240 033F
        MVO     R0,     G_0156                  ; 572E   0240 0156
        MVO     R0,     G_0155                  ; 5730   0240 0155
L_5732:
        MVI@    R2,     R0                      ; 5732   0290
        SDBD                                    ; 5733   0001
        ANDI    #$FF00, R0                      ; 5734   03B8 0000 00FF
        XORR    R5,     R0                      ; 5737   01E8
        MVO@    R0,     R2                      ; 5738   0250
        MVI@    R1,     R0                      ; 5739   0288
        SDBD                                    ; 573A   0001
        ANDI    #$F380, R0                      ; 573B   03B8 0080 00F3
        SDBD                                    ; 573E   0001
        XORI    #$8000, R0                      ; 573F   03F8 0000 0080
        ADDR    R4,     R0                      ; 5742   00E0
        ADDI    #$0010, R0                      ; 5743   02F8 0010
        MVO@    R0,     R1                      ; 5745   0248
        ADDI    #$0010, R1                      ; 5746   02F9 0010
        MVI@    R1,     R0                      ; 5748   0288
        SDBD                                    ; 5749   0001
        ADDI    #$0800, R0                      ; 574A   02F8 0000 0008
        SDBD                                    ; 574D   0001
        ANDI    #$FC00, R0                      ; 574E   03B8 0000 00FC
        MVO@    R0,     R1                      ; 5751   0248
        SUBI    #$0010, R1                      ; 5752   0339 0010
        CLRR    R0                              ; 5754   01C0
        MVO@    R0,     R3                      ; 5755   0258
        PSHR    R1                              ; 5756   0271
        PSHR    R2                              ; 5757   0272
        PSHR    R3                              ; 5758   0273

        JSR     R5,     L_61A1                  ; 5759   0004 0160 01A1
        DECLE   $0004                           ; 575C   0004

        PULR    R3                              ; 575D   02B3
        PULR    R2                              ; 575E   02B2
        PULR    R1                              ; 575F   02B1
L_5760:
        INCR    R1                              ; 5760   0009
        INCR    R2                              ; 5761   000A
        INCR    R3                              ; 5762   000B
        CMPI    #$031E, R2                      ; 5763   037A 031E
        BLE     L_56D0                          ; 5765   0226 0096

        DECR    R1                              ; 5767   0011
        MVI@    R1,     R0                      ; 5768   0288
        TSTR    R0                              ; 5769   0080
        BPL     L_5771                          ; 576A   0203 0005

        CLRR    R0                              ; 576C   01C0
        MVO@    R0,     R2                      ; 576D   0250
        INCR    R0                              ; 576E   0008
        MVO     R0,     G_015F                  ; 576F   0240 015F
L_5771:
        PULR    R7                              ; 5771   02B7

L_5772:
        JSR     R5,     L_61A1                  ; 5772   0004 0160 01A1
        DECLE   $0009                           ; 5775   0009

        INCR    R7                              ; 5776   000F

        PSHR    R5                              ; 5777   0275
L_5778:
        MVI     G_034C, R0                      ; 5778   0280 034C
        ADDI    #$0008, R0                      ; 577A   02F8 0008
        SDBD                                    ; 577C   0001
        CMPI    #$58EE, R0                      ; 577D   0378 00EE 0058
        BEQ     L_578A                          ; 5780   0204 0008

        MVO     R0,     G_034C                  ; 5782   0240 034C

        JSR     R5,     L_6C94                  ; 5784   0004 016C 0094
        DECLE   $0003,  $0004                   ; 5787   0003 0004

        PULR    R7                              ; 5789   02B7

L_578A:
        MVI     G_0166, R1                      ; 578A   0281 0166
        MOVR    R1,     R2                      ; 578C   008A
        MVII    #$00FF, R0                      ; 578D   02B8 00FF
        MVO     R0,     G_0166                  ; 578F   0240 0166
        SWAP    R1,     2                       ; 5791   0045
        BMI     L_57A5                          ; 5792   020B 0011

        MOVR    R2,     R1                      ; 5794   0091
        CLRR    R0                              ; 5795   01C0
        ADDI    #$0318, R1                      ; 5796   02F9 0318
        MVO@    R0,     R1                      ; 5798   0248
        ADDI    #$0010, R1                      ; 5799   02F9 0010
        SLL     R2,     1                       ; 579B   004A
        ADDI    #$0030, R2                      ; 579C   02FA 0030
        SLL     R2,     2                       ; 579E   004E
        ADDR    R2,     R2                      ; 579F   00D2
        SDBD                                    ; 57A0   0001
        XORI    #$0800, R2                      ; 57A1   03FA 0000 0008
        MVO@    R2,     R1                      ; 57A4   024A
L_57A5:
        MVII    #$0320, R1                      ; 57A5   02B9 0320
        MVII    #$0318, R2                      ; 57A7   02BA 0318
        CLRR    R0                              ; 57A9   01C0
L_57AA:
        MVI@    R1,     R5                      ; 57AA   028D
        TSTR    R5                              ; 57AB   00AD
        BPL     L_57B2                          ; 57AC   0203 0004

        INCR    R0                              ; 57AE   0008
        CLRR    R4                              ; 57AF   01E4
        MVO@    R4,     R1                      ; 57B0   024C
        MVO@    R4,     R2                      ; 57B1   0254
L_57B2:
        INCR    R2                              ; 57B2   000A
        INCR    R1                              ; 57B3   0009
        CMPI    #$031D, R2                      ; 57B4   037A 031D
        BLE     L_57AA                          ; 57B6   0226 000D

        PSHR    R0                              ; 57B8   0270
        CLRR    R4                              ; 57B9   01E4
        MVO     R4,     G_0167                  ; 57BA   0244 0167
        DECR    R0                              ; 57BC   0010
        BMI     L_5802                          ; 57BD   020B 0043

        PSHR    R0                              ; 57BF   0270

        JSR     R5,     L_58B7                  ; 57C0   0004 0158 00B7

        MOVR    R0,     R2                      ; 57C3   0082
        MVI     G_034A, R0                      ; 57C4   0280 034A
        ANDI    #$02FF, R0                      ; 57C6   03B8 02FF
        MVO@    R0,     R1                      ; 57C8   0248
        ADDI    #$0008, R1                      ; 57C9   02F9 0008
        MVI     G_034B, R0                      ; 57CB   0280 034B
        ANDI    #$007F, R0                      ; 57CD   03B8 007F
        CMPI    #$0060, R0                      ; 57CF   0378 0060
        BLE     L_57D5                          ; 57D1   0206 0002

        MVII    #$0060, R0                      ; 57D3   02B8 0060
L_57D5:
        XORI    #$0080, R0                      ; 57D5   03F8 0080
        MVO@    R0,     R1                      ; 57D7   0248
        ADDI    #$0008, R1                      ; 57D8   02F9 0008
        MOVR    R2,     R3                      ; 57DA   0093
        ADDI    #$011B, R3                      ; 57DB   02FB 011B
        MVII    #$0006, R0                      ; 57DD   02B8 0006
        MVO@    R0,     R3                      ; 57DF   0258
        SUBI    #$011B, R3                      ; 57E0   033B 011B
        ADDI    #$0121, R3                      ; 57E2   02FB 0121
        MVII    #$001E, R0                      ; 57E4   02B8 001E
        MVO@    R0,     R3                      ; 57E6   0258
        SLL     R2,     1                       ; 57E7   004A
        ADDI    #$0030, R2                      ; 57E8   02FA 0030
        SLL     R2,     2                       ; 57EA   004E
        ADDR    R2,     R2                      ; 57EB   00D2
        SDBD                                    ; 57EC   0001
        XORI    #$0807, R2                      ; 57ED   03FA 0007 0008
        MVO@    R2,     R1                      ; 57F0   024A
        ADDI    #$0008, R1                      ; 57F1   02F9 0008
        PULR    R0                              ; 57F3   02B0
        SLL     R0,     2                       ; 57F4   004C
        SDBD                                    ; 57F5   0001
        MVII    #$58EE, R4                      ; 57F6   02BC 00EE 0058
        ADDR    R0,     R4                      ; 57F9   00C4
        SDBD                                    ; 57FA   0001
        MVI@    R4,     R0                      ; 57FB   02A0
        MVO@    R0,     R1                      ; 57FC   0248
        MVI@    R4,     R0                      ; 57FD   02A0
        MVI@    R4,     R1                      ; 57FE   02A1

        JSR     R5,     L_5940                  ; 57FF   0004 0158 0140

L_5802:
        MVI     G_0168, R0                      ; 5802   0280 0168
        INCR    R0                              ; 5804   0008
        MVO     R0,     G_0168                  ; 5805   0240 0168
        CMPI    #$0002, R0                      ; 5807   0378 0002
        BNEQ    L_5814                          ; 5809   020C 0009

        MVI     G_034F, R0                      ; 580B   0280 034F
        MVO     R0,     .BTAB.82                ; 580D   0240 0282

        JSR     R5,     L_6C94                  ; 580F   0004 016C 0094
        DECLE   $00FF,  $0006                   ; 5812   00FF 0006
L_5814:
        PULR    R0                              ; 5814   02B0
        MVI     G_0326, R4                      ; 5815   0284 0326
        TSTR    R4                              ; 5817   00A4
        BPL     L_581D                          ; 5818   0203 0003

        JSR     R5,     L_5AA3                  ; 581A   0004 0158 02A3

L_581D:
        PULR    R7                              ; 581D   02B7

        CLRR    R0                              ; 581E   01C0
        MVO     R0,     .BTAB.82                ; 581F   0240 0282
        MOVR    R5,     R7                      ; 5821   00AF

L_5822:
        PSHR    R5                              ; 5822   0275
        MVI     G_034B, R0                      ; 5823   0280 034B
        MOVR    R0,     R1                      ; 5825   0081
        ANDI    #$0003, R1                      ; 5826   03B9 0003
        BNEQ    L_588F                          ; 5828   020C 0065

        ANDI    #$007F, R0                      ; 582A   03B8 007F
        MVI     G_034A, R1                      ; 582C   0281 034A
        ANDI    #$00FF, R1                      ; 582E   03B9 00FF
        INCR    R0                              ; 5830   0008

        JSR     R5,     L_51F4                  ; 5831   0004 0150 01F4

        CMPI    #$02F0, R2                      ; 5834   037A 02F0
        BGE     L_5891                          ; 5836   020D 0059

        MVI@    R2,     R1                      ; 5838   0291
        SLR     R1,     2                       ; 5839   0065
        SLR     R1,     1                       ; 583A   0061
        ANDI    #$003F, R1                      ; 583B   03B9 003F
        SDBD                                    ; 583D   0001
        ADDI    #$60ED, R1                      ; 583E   02F9 00ED 0060
        MVII    #$0040, R0                      ; 5841   02B8 0040
        MVI     G_034B, R3                      ; 5843   0283 034B
        ANDI    #$0007, R3                      ; 5845   03BB 0007
        BEQ     L_584A                          ; 5847   0204 0001

        ADDR    R0,     R0                      ; 5849   00C0
L_584A:
        AND@    R1,     R0                      ; 584A   0388
        BEQ     L_5891                          ; 584B   0204 0044

        MVI@    R2,     R1                      ; 584D   0291
        SLR     R1,     1                       ; 584E   0061
        ANDI    #$00FC, R1                      ; 584F   03B9 00FC
        SDBD                                    ; 5851   0001
        ADDI    #$5FED, R1                      ; 5852   02F9 00ED 005F
        INCR    R1                              ; 5855   0009
        MVI@    R1,     R0                      ; 5856   0288
        TSTR    R3                              ; 5857   009B
        BNEQ    L_585D                          ; 5858   020C 0003

        SLR     R0,     2                       ; 585A   0064
        SLR     R0,     2                       ; 585B   0064
        SLR     R0,     1                       ; 585C   0060
L_585D:
        ANDI    #$001F, R0                      ; 585D   03B8 001F
L_585F:
        SLL     R0,     2                       ; 585F   004C
        SLL     R0,     1                       ; 5860   0048
        MVI@    R2,     R4                      ; 5861   0294
        SDBD                                    ; 5862   0001
        ANDI    #$FF07, R4                      ; 5863   03BC 0007 00FF
        XORR    R4,     R0                      ; 5866   01E0
        MVO@    R0,     R2                      ; 5867   0250
        TSTR    R3                              ; 5868   009B
        BNEQ    L_588F                          ; 5869   020C 0024

        MVI     G_034B, R0                      ; 586B   0280 034B
        ANDI    #$007F, R0                      ; 586D   03B8 007F
        MVI     G_034A, R1                      ; 586F   0281 034A
        ANDI    #$00FF, R1                      ; 5871   03B9 00FF

        JSR     R5,     L_51F4                  ; 5873   0004 0150 01F4

        MVI@    R2,     R1                      ; 5876   0291
        TSTR    R1                              ; 5877   0089
        BMI     L_588F                          ; 5878   020B 0015

        SLR     R1,     1                       ; 587A   0061
        ANDI    #$00FC, R1                      ; 587B   03B9 00FC
        SDBD                                    ; 587D   0001
        ADDI    #$606D, R1                      ; 587E   02F9 006D 0060
        INCR    R1                              ; 5881   0009
        MVI@    R1,     R1                      ; 5882   0289
        TSTR    R1                              ; 5883   0089
        BEQ     L_588F                          ; 5884   0204 0009

        SLL     R1,     2                       ; 5886   004D
        SLL     R1,     1                       ; 5887   0049
        MVI@    R2,     R0                      ; 5888   0290
        SDBD                                    ; 5889   0001
        ANDI    #$FF07, R0                      ; 588A   03B8 0007 00FF
        XORR    R1,     R0                      ; 588D   01C8
        MVO@    R0,     R2                      ; 588E   0250
L_588F:
        CLRC                                    ; 588F   0006
        PULR    R7                              ; 5890   02B7

L_5891:
        SETC                                    ; 5891   0007
        PULR    R7                              ; 5892   02B7

L_5893:
        PSHR    R5                              ; 5893   0275
        MVI     G_0166, R1                      ; 5894   0281 0166
        CMPI    #$00FF, R1                      ; 5896   0379 00FF
        BEQ     L_58B6                          ; 5898   0204 001C

        ANDI    #$0007, R1                      ; 589A   03B9 0007
        MVI     G_034A, R0                      ; 589C   0280 034A
        MVO@    R0,     R1                      ; 589E   0248
        ADDI    #$0008, R1                      ; 589F   02F9 0008
        MVI     G_034B, R0                      ; 58A1   0280 034B
        MVO@    R0,     R1                      ; 58A3   0248
        SDBD                                    ; 58A4   0001
        MVII    #$197B, R0                      ; 58A5   02B8 007B 0019
        ADDI    #$0008, R1                      ; 58A8   02F9 0008
        MVO@    R0,     R1                      ; 58AA   0248
        SDBD                                    ; 58AB   0001
        MVII    #$3978, R1                      ; 58AC   02B9 0078 0039
        MVI     G_034C, R4                      ; 58AF   0284 034C
        MVII    #$0008, R0                      ; 58B1   02B8 0008

        JSR     R5,     L_6D27                  ; 58B3   0004 016C 0127

L_58B6:
        PULR    R7                              ; 58B6   02B7

L_58B7:
        PSHR    R5                              ; 58B7   0275
        MVII    #$031D, R1                      ; 58B8   02B9 031D
        MVII    #$0005, R0                      ; 58BA   02B8 0005
L_58BC:
        MVI@    R1,     R5                      ; 58BC   028D
        TSTR    R5                              ; 58BD   00AD
        BEQ     L_58C4                          ; 58BE   0204 0004

        DECR    R1                              ; 58C0   0011
        DECR    R0                              ; 58C1   0010
        BPL     L_58BC                          ; 58C2   0223 0007
L_58C4:
        PULR    R7                              ; 58C4   02B7

        DECLE   $0000,  $0002,  $0001,  $0000   ; 58C5   0000 0002 0001 0000
        DECLE   $0008,  $0000,  $0000,  $0000   ; 58C9   0008 0000 0000 0000
        DECLE   $0004,  $0000,  $0038,  $007C   ; 58CD   0004 0000 0038 007C
        DECLE   $00FE,  $00FE,  $007C,  $003C   ; 58D1   00FE 00FE 007C 003C
        DECLE   $0008,  $0000,  $0000,  $0000   ; 58D5   0008 0000 0000 0000
        DECLE   $006C,  $00FE,  $00FE,  $007C   ; 58D9   006C 00FE 00FE 007C
        DECLE   $003C,  $0000,  $0000,  $0000   ; 58DD   003C 0000 0000 0000
        DECLE   $0000,  $0044,  $00EE,  $00FE   ; 58E1   0000 0044 00EE 00FE
        DECLE   $007C,  $0000,  $0000,  $0000   ; 58E5   007C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0044   ; 58E9   0000 0000 0000 0044
        DECLE   $00EE,  $0000,  $0078,  $0003   ; 58ED   00EE 0000 0078 0003
        DECLE   $0001,  $0000,  $007C,  $0002   ; 58F1   0001 0000 007C 0002
        DECLE   $0019,  $0000,  $0080,  $0003   ; 58F5   0019 0000 0080 0003
        DECLE   $0004,  $0000,  $0084,  $0003   ; 58F9   0004 0000 0084 0003
        DECLE   $0006,  $0000,  $0088,  $0003   ; 58FD   0006 0000 0088 0003
        DECLE   $0008,  $0000,  $008C,  $0004   ; 5901   0008 0000 008C 0004
        DECLE   $0001                           ; 5905   0001
L_5906:
        PSHR    R5                              ; 5906   0275
        MVI     G_0171, R0                      ; 5907   0280 0171
        TSTR    R0                              ; 5909   0080
        BNEQ    L_593D                          ; 590A   020C 0031

        INCR    R0                              ; 590C   0008
        MVO     R0,     G_0171                  ; 590D   0240 0171
        MVO     R0,     .STIC.VIDEN             ; 590F   0240 0020
        MVII    #$0003, R0                      ; 5911   02B8 0003
        SDBD                                    ; 5913   0001
        MVII    #$3931, R3                      ; 5914   02BB 0031 0039
        MVII    #$0169, R1                      ; 5917   02B9 0169
L_5919:
        MVI@    R1,     R2                      ; 5919   028A
        SLL     R2,     2                       ; 591A   004E
        ADD@    R1,     R2                      ; 591B   02CA
        SDBD                                    ; 591C   0001
        MVII    #$59CF, R4                      ; 591D   02BC 00CF 0059
        ADDR    R2,     R4                      ; 5920   00D4
        INCR    R1                              ; 5921   0009
        MVI@    R1,     R2                      ; 5922   028A
        SLL     R2,     2                       ; 5923   004E
        ADD@    R1,     R2                      ; 5924   02CA
        INCR    R1                              ; 5925   0009
        SDBD                                    ; 5926   0001
        MVII    #$59CF, R5                      ; 5927   02BD 00CF 0059
        ADDR    R2,     R5                      ; 592A   00D5
        PSHR    R0                              ; 592B   0270
        MVII    #$0005, R0                      ; 592C   02B8 0005
L_592E:
        MVI@    R5,     R2                      ; 592E   02AA
        SLL     R2,     2                       ; 592F   004E
        SLL     R2,     2                       ; 5930   004E
        XOR@    R4,     R2                      ; 5931   03E2
        MVO@    R2,     R3                      ; 5932   025A
        INCR    R3                              ; 5933   000B
        DECR    R0                              ; 5934   0010
        BNEQ    L_592E                          ; 5935   022C 0008

        PULR    R0                              ; 5937   02B0
        ADDI    #$0003, R3                      ; 5938   02FB 0003
        DECR    R0                              ; 593A   0010
        BNEQ    L_5919                          ; 593B   022C 0023
L_593D:
        PULR    R7                              ; 593D   02B7

L_593E:
        MVI@    R5,     R0                      ; 593E   02A8
        MVI@    R5,     R1                      ; 593F   02A9
L_5940:
        PSHR    R5                              ; 5940   0275
        PSHR    R2                              ; 5941   0272
        PSHR    R3                              ; 5942   0273
        PSHR    R4                              ; 5943   0274
        MVI     G_015E, R5                      ; 5944   0285 015E
        TSTR    R5                              ; 5946   00AD
        BNEQ    L_5997                          ; 5947   020C 004E

        MVO     R5,     G_0171                  ; 5949   0245 0171
        MVI     G_016D, R5                      ; 594B   0285 016D
        PSHR    R5                              ; 594D   0275
        MVII    #$0169, R3                      ; 594E   02BB 0169
        ADDR    R0,     R3                      ; 5950   00C3
L_5951:
        ADD@    R3,     R1                      ; 5951   02D9
        CMPI    #$0009, R1                      ; 5952   0379 0009
        BGT     L_5959                          ; 5954   020E 0003

        MVO@    R1,     R3                      ; 5956   0259
        B       L_596B                          ; 5957   0200 0012

L_5959:
        CLRR    R4                              ; 5959   01E4
L_595A:
        SUBI    #$000A, R1                      ; 595A   0339 000A
        BMI     L_5961                          ; 595C   020B 0003

        INCR    R4                              ; 595E   000C
        B       L_595A                          ; 595F   0220 0006

L_5961:
        ADDI    #$000A, R1                      ; 5961   02F9 000A
        MVO@    R1,     R3                      ; 5963   0259
        MOVR    R4,     R1                      ; 5964   00A1
        INCR    R3                              ; 5965   000B
        INCR    R0                              ; 5966   0008
        CMPI    #$0006, R0                      ; 5967   0378 0006
        BNEQ    L_5951                          ; 5969   022C 0019

L_596B:
        MVI     G_016D, R0                      ; 596B   0280 016D
        CMP@    R6,     R0                      ; 596D   0370
        BEQ     L_5997                          ; 596E   0204 0027

        CMP     G_016F, R0                      ; 5970   0340 016F
        BNEQ    L_5997                          ; 5972   020C 0023

        MVI     G_0170, R1                      ; 5974   0281 0170
        CMPI    #$0004, R1                      ; 5976   0379 0004
        BEQ     L_597C                          ; 5978   0204 0002

        MVII    #$0003, R1                      ; 597A   02B9 0003
L_597C:
        MVO     R1,     G_0170                  ; 597C   0241 0170
        ADDR    R1,     R0                      ; 597E   00C8
        MVII    #$0004, R1                      ; 597F   02B9 0004
        MVO     R1,     G_0170                  ; 5981   0241 0170
        CMPI    #$000A, R0                      ; 5983   0378 000A
        BLT     L_5989                          ; 5985   0205 0002

        SUBI    #$000A, R0                      ; 5987   0338 000A
L_5989:
        MVO     R0,     G_016F                  ; 5989   0240 016F
        MVI     G_0175, R0                      ; 598B   0280 0175
        INCR    R0                              ; 598D   0008
        MVO     R0,     G_0175                  ; 598E   0240 0175

        JSR     R5,     L_5DD2                  ; 5990   0004 015C 01D2
        JSR     R5,     L_61A1                  ; 5993   0004 0160 01A1
        DECLE   $0002                           ; 5996   0002
L_5997:
        PULR    R4                              ; 5997   02B4
        PULR    R3                              ; 5998   02B3
        PULR    R2                              ; 5999   02B2
        PULR    R7                              ; 599A   02B7

L_599B:
        PSHR    R5                              ; 599B   0275
        PSHR    R0                              ; 599C   0270
        SDBD                                    ; 599D   0001
        MVII    #$0931, R0                      ; 599E   02B8 0031 0009
        MVII    #$0203, R1                      ; 59A1   02B9 0203
        MVII    #$0003, R5                      ; 59A3   02BD 0003
L_59A5:
        MVO@    R0,     R1                      ; 59A5   0248
        ADDI    #$0008, R0                      ; 59A6   02F8 0008
        DECR    R1                              ; 59A8   0011
        DECR    R5                              ; 59A9   0015
        BNEQ    L_59A5                          ; 59AA   022C 0006

        MVII    #$020B, R1                      ; 59AC   02B9 020B
        MVII    #$0003, R5                      ; 59AE   02BD 0003
L_59B0:
        MVO@    R0,     R1                      ; 59B0   0248
        ADDI    #$0008, R0                      ; 59B1   02F8 0008
        DECR    R1                              ; 59B3   0011
        DECR    R5                              ; 59B4   0015
        BNEQ    L_59B0                          ; 59B5   022C 0006

        PULR    R0                              ; 59B7   02B0
        MVII    #$0169, R4                      ; 59B8   02BC 0169
        MVII    #$0006, R0                      ; 59BA   02B8 0006

        JSR     R5,     L_6CFF                  ; 59BC   0004 016C 00FF

        SDBD                                    ; 59BF   0001
        MVII    #$0969, R0                      ; 59C0   02B8 0069 0009
        MVO     R0,     .BTAB.12                ; 59C3   0240 0212
        MVII    #$0001, R0                      ; 59C5   02B8 0001
        MVO     R0,     G_016F                  ; 59C7   0240 016F
        MVO     R0,     G_0170                  ; 59C9   0240 0170
        DECR    R0                              ; 59CB   0010
        MVO     R0,     G_0171                  ; 59CC   0240 0171
        PULR    R7                              ; 59CE   02B7

        INCR    R0                              ; 59CF   0008
        INCR    R2                              ; 59D0   000A
        INCR    R2                              ; 59D1   000A
        INCR    R2                              ; 59D2   000A
        INCR    R0                              ; 59D3   0008
        INCR    R5                              ; 59D4   000D
        INCR    R1                              ; 59D5   0009
        INCR    R5                              ; 59D6   000D
        INCR    R5                              ; 59D7   000D
        INCR    R0                              ; 59D8   0008
        INCR    R0                              ; 59D9   0008
        INCR    R6                              ; 59DA   000E
        INCR    R0                              ; 59DB   0008
        INCR    R3                              ; 59DC   000B
        INCR    R0                              ; 59DD   0008
        INCR    R0                              ; 59DE   0008
        INCR    R6                              ; 59DF   000E
        INCR    R4                              ; 59E0   000C
        INCR    R6                              ; 59E1   000E
        INCR    R0                              ; 59E2   0008
        INCR    R2                              ; 59E3   000A
        INCR    R2                              ; 59E4   000A
        INCR    R0                              ; 59E5   0008
        INCR    R6                              ; 59E6   000E
        INCR    R6                              ; 59E7   000E
        INCR    R0                              ; 59E8   0008
        INCR    R3                              ; 59E9   000B
        INCR    R0                              ; 59EA   0008
        INCR    R6                              ; 59EB   000E
        INCR    R0                              ; 59EC   0008
        INCR    R0                              ; 59ED   0008
        INCR    R3                              ; 59EE   000B
        INCR    R0                              ; 59EF   0008
        INCR    R2                              ; 59F0   000A
        INCR    R0                              ; 59F1   0008
        INCR    R0                              ; 59F2   0008
        INCR    R6                              ; 59F3   000E
        INCR    R5                              ; 59F4   000D
        INCR    R5                              ; 59F5   000D
        INCR    R5                              ; 59F6   000D
        INCR    R0                              ; 59F7   0008
        INCR    R2                              ; 59F8   000A
        INCR    R0                              ; 59F9   0008
        INCR    R2                              ; 59FA   000A
        INCR    R0                              ; 59FB   0008
        INCR    R0                              ; 59FC   0008
        INCR    R2                              ; 59FD   000A
        INCR    R0                              ; 59FE   0008
        INCR    R6                              ; 59FF   000E
        INCR    R0                              ; 5A00   0008
L_5A01:
        PSHR    R5                              ; 5A01   0275
        MVI     G_0164, R0                      ; 5A02   0280 0164
        DECR    R0                              ; 5A04   0010
        BMI     L_5A0B                          ; 5A05   020B 0004

        MVO     R0,     G_0164                  ; 5A07   0240 0164
        BNEQ    L_5A17                          ; 5A09   020C 000C

L_5A0B:
        MVI     G_01AA, R0                      ; 5A0B   0280 01AA
        XOR     G_01AD, R0                      ; 5A0D   03C0 01AD
        BNEQ    L_5A14                          ; 5A0F   020C 0003

        MVO     R0,     G_0163                  ; 5A11   0240 0163
        PULR    R7                              ; 5A13   02B7

L_5A14:
        MVII    #$0001, R0                      ; 5A14   02B8 0001
        INCR    R7                              ; 5A16   000F

L_5A17:
        CLRR    R0                              ; 5A17   01C0
L_5A18:
        MVO     R0,     G_0163                  ; 5A18   0240 0163
        PULR    R7                              ; 5A1A   02B7

L_5A1B:
        PSHR    R5                              ; 5A1B   0275
        MVI     G_015F, R0                      ; 5A1C   0280 015F
        TSTR    R0                              ; 5A1E   0080
        BNEQ    L_5AA4                          ; 5A1F   020C 0083

        JSR     R5,     L_6CC7                  ; 5A21   0004 016C 00C7
        JSR     R5,     L_61A1                  ; 5A24   0004 0160 01A1
        DECLE   $000B                           ; 5A27   000B

        MVII    #$0318, R4                      ; 5A28   02BC 0318
        MVII    #$0006, R0                      ; 5A2A   02B8 0006

        JSR     R5,     L_6CFF                  ; 5A2C   0004 016C 00FF

        MVII    #$0145, R4                      ; 5A2F   02BC 0145
        MVII    #$0006, R0                      ; 5A31   02B8 0006

        JSR     R5,     L_6CFF                  ; 5A33   0004 016C 00FF

        CLRR    R0                              ; 5A36   01C0
        MVO     R0,     G_0346                  ; 5A37   0240 0346
        MVO     R0,     G_015D                  ; 5A39   0240 015D
        MVO     R0,     G_0162                  ; 5A3B   0240 0162
        NOP                                     ; 5A3D   0034
        MVO     R0,     .BTAB.82                ; 5A3E   0240 0282
        MVO     R0,     G_033F                  ; 5A40   0240 033F
        MVO     R0,     G_0168                  ; 5A42   0240 0168
        NOP                                     ; 5A44   0034
        MVO     R0,     G_0156                  ; 5A45   0240 0156
        MVO     R0,     G_0343                  ; 5A47   0240 0343
        MVO     R0,     G_0160                  ; 5A49   0240 0160
        MVO     R0,     G_014B                  ; 5A4B   0240 014B
        COMR    R0                              ; 5A4D   0018
        MVO     R0,     G_0166                  ; 5A4E   0240 0166
        MVII    #$0008, R0                      ; 5A50   02B8 0008
        MVO     R0,     G_0102                  ; 5A52   0240 0102

        JSR     R5,     L_6D14                  ; 5A54   0004 016C 0114
        DECLE   $0078                           ; 5A57   0078

        JSR     R5,     L_5A62                  ; 5A58   0004 0158 0262
        DECLE   $02B8,  $0002,  $0240,  $0158   ; 5A5B   02B8 0002 0240 0158
        DECLE   $0004                           ; 5A5F   0004

        CMP@    R6,     R0                      ; 5A60   0370
        SLLC    R1,     1                       ; 5A61   0059
L_5A62:
        PSHR    R5                              ; 5A62   0275
        CLRR    R0                              ; 5A63   01C0
        MVO     R0,     G_014B                  ; 5A64   0240 014B
        SDBD                                    ; 5A66   0001
        MVII    #$0708, R0                      ; 5A67   02B8 0008 0007
        MVI     G_0173, R1                      ; 5A6A   0281 0173
        SLL     R1,     2                       ; 5A6C   004D
        SLL     R1,     2                       ; 5A6D   004D
        SLL     R1,     1                       ; 5A6E   0049
        SUBR    R1,     R0                      ; 5A6F   0108
        BPL     L_5A73                          ; 5A70   0203 0001

        CLRR    R0                              ; 5A72   01C0
L_5A73:
        INCR    R0                              ; 5A73   0008

        JSR     R5,     L_6D15                  ; 5A74   0004 016C 0115

        MVII    #$0008, R0                      ; 5A77   02B8 0008
        MVO     R0,     G_014B                  ; 5A79   0240 014B

        JSR     R5,     L_61A1                  ; 5A7B   0004 0160 01A1
        DECLE   $0012                           ; 5A7E   0012

        PULR    R7                              ; 5A7F   02B7

L_5A80:
        MVI     G_01A5, R0                      ; 5A80   0280 01A5
        CLRR    R1                              ; 5A82   01C9
        ANDI    #$003F, R0                      ; 5A83   03B8 003F
L_5A85:
        SARC    R0,     1                       ; 5A85   0078
        BNC     L_5A97                          ; 5A86   0209 000F

        MOVR    R1,     R2                      ; 5A88   008A
        CMP     G_0155, R1                      ; 5A89   0341 0155
        BEQ     L_5AA3                          ; 5A8B   0204 0016

        ADDI    #$011B, R2                      ; 5A8D   02FA 011B
        MVI@    R2,     R3                      ; 5A8F   0293
        TSTR    R3                              ; 5A90   009B
        BEQ     L_5A85                          ; 5A91   0224 000D

        CMPI    #$0002, R3                      ; 5A93   037B 0002
        BLE     L_5A9C                          ; 5A95   0206 0005

L_5A97:
        INCR    R1                              ; 5A97   0009
        TSTR    R0                              ; 5A98   0080
        BNEQ    L_5A85                          ; 5A99   022C 0015
        MOVR    R5,     R7                      ; 5A9B   00AF

L_5A9C:
        PSHR    R5                              ; 5A9C   0275

        JSR     R5,     L_61A1                  ; 5A9D   0004 0160 01A1
        DECLE   $000C                           ; 5AA0   000C

        B       L_5AA8                          ; 5AA1   0200 0005

L_5AA3:
        PSHR    R5                              ; 5AA3   0275

L_5AA4:
        JSR     R5,     L_61A1                  ; 5AA4   0004 0160 01A1
        DECLE   $000D                           ; 5AA7   000D
L_5AA8:
        MVI     G_0172, R0                      ; 5AA8   0280 0172
        TSTR    R0                              ; 5AAA   0080
        BNEQ    L_5BA6                          ; 5AAB   020C 00F9

        MVO     R0,     G_0346                  ; 5AAD   0240 0346
        MVO     R0,     G_015D                  ; 5AAF   0240 015D
        MVO     R0,     G_0162                  ; 5AB1   0240 0162
        NOP                                     ; 5AB3   0034
        MVO     R0,     G_0343                  ; 5AB4   0240 0343
        MVO     R0,     G_0160                  ; 5AB6   0240 0160
        INCR    R0                              ; 5AB8   0008
        MVO     R0,     G_0172                  ; 5AB9   0240 0172
        MVII    #$0008, R0                      ; 5ABB   02B8 0008
        MVO     R0,     G_0102                  ; 5ABD   0240 0102
        MVII    #$0145, R4                      ; 5ABF   02BC 0145
        MVII    #$0006, R0                      ; 5AC1   02B8 0006

        JSR     R5,     L_6CFF                  ; 5AC3   0004 016C 00FF
        JSR     R5,     L_6CB6                  ; 5AC6   0004 016C 00B6
        DECLE   $0001                           ; 5AC9   0001

        JSR     R5,     L_6CB6                  ; 5ACA   0004 016C 00B6
        DECLE   $0000                           ; 5ACD   0000

        JSR     R5,     L_5BAA                  ; 5ACE   0004 0158 03AA

        CLRR    R0                              ; 5AD1   01C0
        MVO     R0,     .BTAB.82                ; 5AD2   0240 0282
        MVI     G_031E, R0                      ; 5AD4   0280 031E
        MVO     R0,     G_031F                  ; 5AD6   0240 031F
        MVI     G_0326, R0                      ; 5AD8   0280 0326
        SDBD                                    ; 5ADA   0001
        ANDI    #$F7FF, R0                      ; 5ADB   03B8 00FF 00F7
        MOVR    R0,     R1                      ; 5ADE   0081
        ANDI    #$007F, R1                      ; 5ADF   03B9 007F
        CMPI    #$0060, R1                      ; 5AE1   0379 0060
        BLE     L_5AE7                          ; 5AE3   0206 0002

        MVII    #$0060, R1                      ; 5AE5   02B9 0060
L_5AE7:
        SDBD                                    ; 5AE7   0001
        ANDI    #$FF80, R0                      ; 5AE8   03B8 0080 00FF
        ADDR    R1,     R0                      ; 5AEB   00C8
        MVO     R0,     G_0326                  ; 5AEC   0240 0326
        MVO     R0,     G_0327                  ; 5AEE   0240 0327
        SDBD                                    ; 5AF0   0001
        MVII    #$5000, R0                      ; 5AF1   02B8 0000 0050
        MVO     R0,     G_0336                  ; 5AF4   0240 0336
        SDBD                                    ; 5AF6   0001
        MVII    #$5400, R0                      ; 5AF7   02B8 0000 0054
        MVO     R0,     G_0337                  ; 5AFA   0240 0337
        MVII    #$0318, R4                      ; 5AFC   02BC 0318
        MVII    #$0006, R0                      ; 5AFE   02B8 0006

        JSR     R5,     L_6CFF                  ; 5B00   0004 016C 00FF

        CLRR    R0                              ; 5B03   01C0
        MVO     R0,     G_033F                  ; 5B04   0240 033F
        MVO     R0,     G_0156                  ; 5B06   0240 0156
        COMR    R0                              ; 5B08   0018
        MVO     R0,     G_0166                  ; 5B09   0240 0166

        JSR     R5,     L_6CC7                  ; 5B0B   0004 016C 00C7

        MVII    #$004B, R0                      ; 5B0E   02B8 004B
L_5B10:
        MVI     G_0113, R1                      ; 5B10   0281 0113
        DECLE   $0379,  $0002,  $022C,  $0005   ; 5B12   0379 0002 022C 0005
        DECLE   $0270,  $0004,  $0170,  $021B   ; 5B16   0270 0004 0170 021B

        PULR    R0                              ; 5B1A   02B0
        CLRR    R1                              ; 5B1B   01C9
        MVO     R1,     G_0113                  ; 5B1C   0241 0113
        DECR    R0                              ; 5B1E   0010
        BNEQ    L_5B10                          ; 5B1F   022C 0010

        CLRR    R1                              ; 5B21   01C9
        MVII    #$011B, R4                      ; 5B22   02BC 011B
        MVII    #$0127, R5                      ; 5B24   02BD 0127
        MVI@    R4,     R0                      ; 5B26   02A0
        TSTR    R0                              ; 5B27   0080
        BEQ     L_5B66                          ; 5B28   0204 003C

        CMPI    #$0005, R0                      ; 5B2A   0378 0005
        BEQ     L_5B66                          ; 5B2C   0204 0038

        CMPI    #$0006, R0                      ; 5B2E   0378 0006
        BEQ     L_5B66                          ; 5B30   0204 0034

        MVI@    R5,     R2                      ; 5B32   02AA
        MVI@    R5,     R0                      ; 5B33   02A8
        TSTR    R0                              ; 5B34   0080
        BEQ     L_5B68                          ; 5B35   0204 0031

        MVII    #$0001, R3                      ; 5B37   02BB 0001
        DECR    R4                              ; 5B39   0014
        MVO@    R3,     R4                      ; 5B3A   0263
        MOVR    R1,     R3                      ; 5B3B   008B
        ADDI    #$0318, R3                      ; 5B3C   02FB 0318
        XORI    #$0300, R0                      ; 5B3E   03F8 0300
        MVO@    R0,     R3                      ; 5B40   0258
        ADDI    #$0008, R3                      ; 5B41   02FB 0008
        MVI@    R5,     R0                      ; 5B43   02A8
        MVO@    R0,     R3                      ; 5B44   0258
        ADDI    #$0008, R3                      ; 5B45   02FB 0008
        CMPI    #$0001, R2                      ; 5B47   037A 0001
        BNEQ    L_5B53                          ; 5B49   020C 0008

        SDBD                                    ; 5B4B   0001
        MVII    #$1800, R0                      ; 5B4C   02B8 0000 0018
        MVII    #$0002, R2                      ; 5B4F   02BA 0002
        B       L_5B59                          ; 5B51   0200 0006

L_5B53:
        SDBD                                    ; 5B53   0001
        MVII    #$3400, R0                      ; 5B54   02B8 0000 0034
        MVII    #$0005, R2                      ; 5B57   02BA 0005
L_5B59:
        PSHR    R2                              ; 5B59   0272
        MVI@    R3,     R2                      ; 5B5A   029A
        SDBD                                    ; 5B5B   0001
        ANDI    #$EFF8, R2                      ; 5B5C   03BA 00F8 00EF
        XOR@    R6,     R2                      ; 5B5F   03F2
        MVO@    R2,     R3                      ; 5B60   025A
        ADDI    #$0008, R3                      ; 5B61   02FB 0008
        MVO@    R0,     R3                      ; 5B63   0258
        B       L_5B69                          ; 5B64   0200 0003

L_5B66:
        ADDI    #$0002, R5                      ; 5B66   02FD 0002
L_5B68:
        INCR    R5                              ; 5B68   000D
L_5B69:
        INCR    R1                              ; 5B69   0009
        DECLE   $0379,  $0006,  $022C,  $0047   ; 5B6A   0379 0006 022C 0047
        DECLE   $02B8,  $0358,  $02BC,  $031E   ; 5B6E   02B8 0358 02BC 031E
        DECLE   $0260,  $0260,  $02FC,  $0006   ; 5B72   0260 0260 02FC 0006
        DECLE   $02B8,  $00B8,  $0260,  $0260   ; 5B76   02B8 00B8 0260 0260
        DECLE   $02FC,  $000E,  $0001,  $02B8   ; 5B7A   02FC 000E 0001 02B8
        DECLE   $0000,  $0000,  $0008,  $0260   ; 5B7E   0000 0000 0008 0260
        DECLE   $0001,  $02F8,  $0000,  $0004   ; 5B82   0001 02F8 0000 0004
        DECLE   $0260,  $01C0,  $0240,  $0172   ; 5B86   0260 01C0 0240 0172
        DECLE   $0240,  $015F,  $02B8,  $0002   ; 5B8A   0240 015F 02B8 0002
        DECLE   $0240,  $0158,  $0280,  $0175   ; 5B8E   0240 0158 0280 0175
        DECLE   $0010,  $020C,  $0003,  $0004   ; 5B92   0010 020C 0003 0004

        CMPR    R7,     R0                      ; 5B96   0178
        MVO@    R2,     R4                      ; 5B97   0262
        MVO     R0,     G_0175                  ; 5B98   0240 0175

        JSR     R5,     L_5DD2                  ; 5B9A   0004 015C 01D2
        JSR     R5,     L_55D8                  ; 5B9D   0004 0154 01D8
        DECLE   $0004,  $0150,  $0000,  $0004   ; 5BA0   0004 0150 0000 0004

        CMPR    R6,     R0                      ; 5BA4   0170
        CMP@    R1,     R1                      ; 5BA5   0349

L_5BA6:
        JSR     R5,     L_5A62                  ; 5BA6   0004 0158 0262

        PULR    R7                              ; 5BA9   02B7

L_5BAA:
        PSHR    R5                              ; 5BAA   0275
L_5BAB:
        MVI     G_0167, R0                      ; 5BAB   0280 0167
        DECLE   $0080,  $0204,  $0011,  $0004   ; 5BAD   0080 0204 0011 0004
        DECLE   $0171,  $021B                   ; 5BB1   0171 021B

        JSRE    R5,     L_6C55                  ; 5BB3   0004 016D 0055

L_5BB6:
        MVI     G_0113, R0                      ; 5BB6   0280 0113
        CMPI    #$0002, R0                      ; 5BB8   0378 0002
        BNEQ    L_5BB6                          ; 5BBA   022C 0005

        CLRR    R0                              ; 5BBC   01C0
        MVO     R0,     G_0113                  ; 5BBD   0240 0113
        B       L_5BAB                          ; 5BBF   0220 0015
        PULR    R7                              ; 5BC1   02B7

L_5BC2:
        PSHR    R5                              ; 5BC2   0275
        MVI     G_0173, R1                      ; 5BC3   0281 0173
        CMPI    #$0012, R1                      ; 5BC5   0379 0012
        BGT     L_5BEE                          ; 5BC7   020E 0025

        DECR    R1                              ; 5BC9   0011
        SLL     R1,     1                       ; 5BCA   0049
        MOVR    R1,     R5                      ; 5BCB   008D
        SLL     R1,     1                       ; 5BCC   0049
        ADDR    R1,     R5                      ; 5BCD   00CD
        SDBD                                    ; 5BCE   0001
        ADDI    #$5C1B, R5                      ; 5BCF   02FD 001B 005C
        SDBD                                    ; 5BD2   0001
        MVI@    R5,     R0                      ; 5BD3   02A8
        MVO     R0,     G_034F                  ; 5BD4   0240 034F
        SDBD                                    ; 5BD6   0001
        MVI@    R5,     R0                      ; 5BD7   02A8
        MVO     R0,     G_0350                  ; 5BD8   0240 0350
        SDBD                                    ; 5BDA   0001
        MVI@    R5,     R4                      ; 5BDB   02AC
        SDBD                                    ; 5BDC   0001
        MVII    #$3908, R1                      ; 5BDD   02B9 0008 0039
        MVII    #$0008, R0                      ; 5BE0   02B8 0008

        JSR     R5,     L_6D27                  ; 5BE2   0004 016C 0127

        SDBD                                    ; 5BE5   0001
        MVII    #$3960, R1                      ; 5BE6   02B9 0060 0039
        MVII    #$0008, R0                      ; 5BE9   02B8 0008

        JSR     R5,     L_6D27                  ; 5BEB   0004 016C 0127

L_5BEE:
        MVI     G_0173, R0                      ; 5BEE   0280 0173
        CLRR    R1                              ; 5BF0   01C9
L_5BF1:
        SUBI    #$000A, R0                      ; 5BF1   0338 000A
        BMI     L_5BF8                          ; 5BF3   020B 0003

        INCR    R1                              ; 5BF5   0009
        B       L_5BF1                          ; 5BF6   0220 0006

L_5BF8:
        ADDI    #$000A, R0                      ; 5BF8   02F8 000A
        MOVR    R0,     R4                      ; 5BFA   0084
        SLL     R0,     2                       ; 5BFB   004C
        ADDR    R0,     R4                      ; 5BFC   00C4
        MOVR    R1,     R5                      ; 5BFD   008D
        SLL     R1,     2                       ; 5BFE   004D
        ADDR    R1,     R5                      ; 5BFF   00CD
        SDBD                                    ; 5C00   0001
        ADDI    #$59CF, R4                      ; 5C01   02FC 00CF 0059
        SDBD                                    ; 5C04   0001
        ADDI    #$59CF, R5                      ; 5C05   02FD 00CF 0059
        SDBD                                    ; 5C08   0001
        MVII    #$3969, R2                      ; 5C09   02BA 0069 0039
        MVII    #$0005, R0                      ; 5C0C   02B8 0005
L_5C0E:
        MVI@    R5,     R1                      ; 5C0E   02A9
        SLL     R1,     2                       ; 5C0F   004D
        SLL     R1,     2                       ; 5C10   004D
        XOR@    R4,     R1                      ; 5C11   03E1
        MVO@    R1,     R2                      ; 5C12   0251
        INCR    R2                              ; 5C13   000A
        DECR    R0                              ; 5C14   0010
        BNEQ    L_5C0E                          ; 5C15   022C 0008

        CLRR    R0                              ; 5C17   01C0
        MVO     R0,     G_0113                  ; 5C18   0240 0113
        PULR    R7                              ; 5C1A   02B7

        DECLE   $000A,  $0059,  $0002,  $0004   ; 5C1B   000A 0059 0002 0004

        MOVR    R0,     R7                      ; 5C1F   0087

        SLLC    R0,     2                       ; 5C20   005C
        INCR    R7                              ; 5C21   000F

        SLL     R1,     1                       ; 5C22   0049
L_5C23:
        EIS                                     ; 5C23   0002
        CLRC                                    ; 5C24   0006
        MOVR    R2,     R7                      ; 5C25   0097

        SLLC    R0,     2                       ; 5C26   005C
        INCR    R0                              ; 5C27   0008
        SLLC    R1,     1                       ; 5C28   0059
        EIS                                     ; 5C29   0002
        INCR    R0                              ; 5C2A   0008
        MOVR    R4,     R7                      ; 5C2B   00A7

        DECLE   $005C,  $000C,  $0049,  $0003   ; 5C2C   005C 000C 0049 0003
        DECLE   $0001,  $00B7,  $005C,  $000C   ; 5C30   0001 00B7 005C 000C
        DECLE   $0049,  $0003,  $0001,  $00B7   ; 5C34   0049 0003 0001 00B7

        SLLC    R0,     2                       ; 5C38   005C
        INCR    R7                              ; 5C39   000F

        SLLC    R1,     1                       ; 5C3A   0059
L_5C3B:
        DIS                                     ; 5C3B   0003
        EIS                                     ; 5C3C   0002
        ADDR    R0,     R7                      ; 5C3D   00C7

        SLLC    R0,     2                       ; 5C3E   005C
        INCR    R7                              ; 5C3F   000F

        SLLC    R1,     1                       ; 5C40   0059
L_5C41:
        DIS                                     ; 5C41   0003
        EIS                                     ; 5C42   0002
        ADDR    R0,     R7                      ; 5C43   00C7

        SLLC    R0,     2                       ; 5C44   005C
        INCR    R5                              ; 5C45   000D
        SLL     R1,     1                       ; 5C46   0049
        DIS                                     ; 5C47   0003
        DIS                                     ; 5C48   0003
        ADDR    R2,     R7                      ; 5C49   00D7

        SLLC    R0,     2                       ; 5C4A   005C
        INCR    R5                              ; 5C4B   000D
        SLL     R1,     1                       ; 5C4C   0049
        DIS                                     ; 5C4D   0003
        DIS                                     ; 5C4E   0003
        ADDR    R2,     R7                      ; 5C4F   00D7

        DECLE   $005C,  $000A,  $0049,  $0003   ; 5C50   005C 000A 0049 0003
        DECLE   $0004,  $00E7,  $005C,  $000A   ; 5C54   0004 00E7 005C 000A
        DECLE   $0049,  $0003,  $0004           ; 5C58   0049 0003 0004

        ADDR    R4,     R7                      ; 5C5B   00E7

        SLLC    R0,     2                       ; 5C5C   005C
        INCR    R7                              ; 5C5D   000F

        SLL     R1,     1                       ; 5C5E   0049
L_5C5F:
        DIS                                     ; 5C5F   0003
        DECLE   $0005,  $00F7                   ; 5C60   0005 00F7

        SLLC    R0,     2                       ; 5C62   005C
        INCR    R7                              ; 5C63   000F

        SLL     R1,     1                       ; 5C64   0049
L_5C65:
        DIS                                     ; 5C65   0003
        DECLE   $0005,  $00F7                   ; 5C66   0005 00F7

        SLLC    R0,     2                       ; 5C68   005C
        INCR    R2                              ; 5C69   000A
        SLL     R1,     1                       ; 5C6A   0049
        DIS                                     ; 5C6B   0003
        CLRC                                    ; 5C6C   0006
        SETC                                    ; 5C6D   0007
        SLLC    R1,     2                       ; 5C6E   005D
        INCR    R2                              ; 5C6F   000A
        SLL     R1,     1                       ; 5C70   0049
        DIS                                     ; 5C71   0003
        CLRC                                    ; 5C72   0006
        SETC                                    ; 5C73   0007
        SLLC    R1,     2                       ; 5C74   005D
        INCR    R7                              ; 5C75   000F

        SLL     R1,     1                       ; 5C76   0049
L_5C77:
        DIS                                     ; 5C77   0003
        SETC                                    ; 5C78   0007
L_5C79:
        DECR    R7                              ; 5C79   0017

        SLLC    R1,     2                       ; 5C7A   005D
        INCR    R7                              ; 5C7B   000F

        SLL     R1,     1                       ; 5C7C   0049
L_5C7D:
        DIS                                     ; 5C7D   0003
        SETC                                    ; 5C7E   0007
L_5C7F:
        DECR    R7                              ; 5C7F   0017

        DECLE   $005D,  $000E,  $0059,  $0003   ; 5C80   005D 000E 0059 0003
        DECLE   $0008,  $0027,  $005D,  $0008   ; 5C84   0008 0027 005D 0008
        DECLE   $001E,  $001F,  $003E,  $003C   ; 5C88   001E 001F 003E 003C
        DECLE   $0078,  $0060,  $00C0,  $00A0   ; 5C8C   0078 0060 00C0 00A0
        DECLE   $00A0,  $00EE,  $002A,  $002E   ; 5C90   00A0 00EE 002A 002E
        DECLE   $0007,  $0005,  $0007,  $0010   ; 5C94   0007 0005 0007 0010
        DECLE   $0054,  $00FE,  $00FE,  $00FE   ; 5C98   0054 00FE 00FE 00FE
        DECLE   $007C,  $0038,  $0010,  $00E0   ; 5C9C   007C 0038 0010 00E0
        DECLE   $0080,  $00EE,  $00AA,  $00EE   ; 5CA0   0080 00EE 00AA 00EE
        DECLE   $0007,  $0005,  $0007,  $0000   ; 5CA4   0007 0005 0007 0000
        DECLE   $0018,  $007E,  $00FF,  $00FF   ; 5CA8   0018 007E 00FF 00FF
        DECLE   $0018,  $0018,  $0000,  $00E0   ; 5CAC   0018 0018 0000 00E0
        DECLE   $00A0,  $00EE,  $00AA,  $00EE   ; 5CB0   00A0 00EE 00AA 00EE
        DECLE   $0007,  $0005                   ; 5CB4   0007 0005

        SETC                                    ; 5CB6   0007
        DIS                                     ; 5CB7   0003
        SETC                                    ; 5CB8   0007
        INCR    R6                              ; 5CB9   000E
        INCR    R4                              ; 5CBA   000C
        COMR    R4                              ; 5CBB   001C
        RSWD    R4                              ; 5CBC   003C
        SARC    R0,     1                       ; 5CBD   0078
        ADDR    R6,     R0                      ; 5CBE   00F0
        SWAP    R0,     1                       ; 5CBF   0040
        SLLC    R0,     2                       ; 5CC0   005C
        RLC     R0,     2                       ; 5CC1   0054
        COMR    R4                              ; 5CC2   001C
        INCR    R2                              ; 5CC3   000A
        INCR    R7                              ; 5CC4   000F

        DECLE   $0005                           ; 5CC5   0005
L_5CC6:
        SETC                                    ; 5CC6   0007
        DECLE   $0018,  $003C,  $003C,  $00FF   ; 5CC7   0018 003C 003C 00FF
        DECLE   $00FF,  $00FF,  $00FF           ; 5CCB   00FF 00FF 00FF

        SARC    R2,     2                       ; 5CCE   007E
        ADDR    R4,     R0                      ; 5CCF   00E0
        RSWD    R4                              ; 5CD0   003C
        ADDR    R6,     R4                      ; 5CD1   00F4
        MOVR    R3,     R6                      ; 5CD2   009E
        ADDR    R5,     R2                      ; 5CD3   00EA
        INCR    R7                              ; 5CD4   000F

        DECLE   $0005                           ; 5CD5   0005
L_5CD6:
        SETC                                    ; 5CD6   0007
        DECLE   $0000,  $0081,  $00C3,  $00FF   ; 5CD7   0000 0081 00C3 00FF
        DECLE   $00FF,  $00FF                   ; 5CDB   00FF 00FF

        SARC    R2,     2                       ; 5CDD   007E
        SWAP    R2,     1                       ; 5CDE   0042
        ADDR    R4,     R0                      ; 5CDF   00E0
        RSWD    R4                              ; 5CE0   003C
        ADDR    R6,     R4                      ; 5CE1   00F4
        RSWD    R6                              ; 5CE2   003E
        ADDR    R5,     R2                      ; 5CE3   00EA
        INCR    R7                              ; 5CE4   000F

        DECLE   $0005                           ; 5CE5   0005
L_5CE6:
        SETC                                    ; 5CE6   0007
        DECLE   $0000,  $007E,  $00FF,  $00FF   ; 5CE7   0000 007E 00FF 00FF
        DECLE   $00FF,  $00FF                   ; 5CEB   00FF 00FF

        SARC    R2,     2                       ; 5CED   007E
        RSWD    R4                              ; 5CEE   003C
        MOVR    R4,     R0                      ; 5CEF   00A0
        MOVR    R7,     R4                      ; 5CF0   00BC
        ADDR    R6,     R4                      ; 5CF1   00F4
        RSWD    R6                              ; 5CF2   003E
        ADCR    R2                              ; 5CF3   002A
        INCR    R7                              ; 5CF4   000F

        DECLE   $0005                           ; 5CF5   0005
L_5CF6:
        SETC                                    ; 5CF6   0007
        DECLE   $0000,  $0000,  $0018,  $007E   ; 5CF7   0000 0000 0018 007E
        DECLE   $00FF,  $00FF                   ; 5CFB   00FF 00FF

        SARC    R2,     2                       ; 5CFD   007E
        COMR    R0                              ; 5CFE   0018
        ADDR    R4,     R0                      ; 5CFF   00E0
        MOVR    R3,     R4                      ; 5D00   009C
        ADDR    R6,     R4                      ; 5D01   00F4
        RSWD    R6                              ; 5D02   003E
        ADDR    R5,     R2                      ; 5D03   00EA
        INCR    R7                              ; 5D04   000F

        DECLE   $0005                           ; 5D05   0005
L_5D06:
        SETC                                    ; 5D06   0007
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 5D07   0000 0000 0000 00FF
        DECLE   $00DB,  $0076,  $003C,  $0000   ; 5D0B   00DB 0076 003C 0000

        ADDR    R4,     R0                      ; 5D0F   00E0
        MOVR    R3,     R4                      ; 5D10   009C
        ADDR    R6,     R4                      ; 5D11   00F4
        MOVR    R7,     R6                      ; 5D12   00BE
        ADDR    R5,     R2                      ; 5D13   00EA
        INCR    R7                              ; 5D14   000F

        DECLE   $0005                           ; 5D15   0005
L_5D16:
        SETC                                    ; 5D16   0007
        SLLC    R2,     1                       ; 5D17   005A
        SARC    R2,     2                       ; 5D18   007E
        SARC    R2,     2                       ; 5D19   007E
        RSWD    R4                              ; 5D1A   003C
        COMR    R0                              ; 5D1B   0018
        COMR    R0                              ; 5D1C   0018
        COMR    R0                              ; 5D1D   0018
        COMR    R0                              ; 5D1E   0018
        ADDR    R4,     R0                      ; 5D1F   00E0
        RSWD    R4                              ; 5D20   003C
        NOP                                     ; 5D21   0034
        SLLC    R2,     2                       ; 5D22   005E
        SLL     R2,     1                       ; 5D23   004A
        INCR    R7                              ; 5D24   000F

        DECLE   $0005                           ; 5D25   0005
L_5D26:
        SETC                                    ; 5D26   0007
        SWAP    R0,     1                       ; 5D27   0040
        ADDR    R7,     R0                      ; 5D28   00F8
        RLC     R0,     2                       ; 5D29   0054
        SAR     R2,     1                       ; 5D2A   006A
        RLC     R1,     2                       ; 5D2B   0055
        ADCR    R2                              ; 5D2C   002A
        DECR    R5                              ; 5D2D   0015
        INCR    R2                              ; 5D2E   000A
        ADDR    R4,     R0                      ; 5D2F   00E0
        MOVR    R7,     R4                      ; 5D30   00BC
        ADDR    R6,     R4                      ; 5D31   00F4
        MOVR    R7,     R6                      ; 5D32   00BE
        ADDR    R5,     R2                      ; 5D33   00EA
        INCR    R7                              ; 5D34   000F

        DECLE   $0005                           ; 5D35   0005
L_5D36:
        SETC                                    ; 5D36   0007
L_5D37:
        PSHR    R5                              ; 5D37   0275
        MVI     G_0173, R0                      ; 5D38   0280 0173
        MOVR    R0,     R2                      ; 5D3A   0082
        INCR    R0                              ; 5D3B   0008
        MVO     R0,     G_0173                  ; 5D3C   0240 0173
        MVII    #$0006, R1                      ; 5D3E   02B9 0006

        JSR     R5,     L_6CCE                  ; 5D40   0004 016C 00CE

        SDBD                                    ; 5D43   0001
        MVII    #$5E51, R5                      ; 5D44   02BD 0051 005E
        MVO     R3,     G_0174                  ; 5D47   0243 0174
        ADDR    R3,     R5                      ; 5D49   00DD
        ADDR    R3,     R5                      ; 5D4A   00DD
        SDBD                                    ; 5D4B   0001
        MVI@    R5,     R4                      ; 5D4C   02AC
L_5D4D:
        MVI@    R4,     R1                      ; 5D4D   02A1
        MVI@    R4,     R0                      ; 5D4E   02A0
        TSTR    R1                              ; 5D4F   0089
        BEQ     L_5D84                          ; 5D50   0204 0032

        MOVR    R1,     R2                      ; 5D52   008A
        SARC    R2,     1                       ; 5D53   007A
        BC      L_5D5E                          ; 5D54   0201 0008

        MVII    #$0020, R2                      ; 5D56   02BA 0020
        MVII    #$0040, R3                      ; 5D58   02BB 0040
        MVII    #$0001, R5                      ; 5D5A   02BD 0001
        B       L_5D64                          ; 5D5C   0200 0006

L_5D5E:
        MVII    #$0030, R2                      ; 5D5E   02BA 0030
        MVII    #$0048, R3                      ; 5D60   02BB 0048
        MVII    #$0014, R5                      ; 5D62   02BD 0014
L_5D64:
        PSHR    R4                              ; 5D64   0274
        MVI@    R1,     R4                      ; 5D65   028C
        SDBD                                    ; 5D66   0001
        ANDI    #$EE00, R4                      ; 5D67   03BC 0000 00EE
        XORR    R2,     R4                      ; 5D6A   01D4
        MVO@    R4,     R1                      ; 5D6B   024C
        ADDI    #$0008, R2                      ; 5D6C   02FA 0008
L_5D6E:
        ADDR    R5,     R1                      ; 5D6E   00E9
        MVI@    R1,     R4                      ; 5D6F   028C
        SDBD                                    ; 5D70   0001
        ANDI    #$EE00, R4                      ; 5D71   03BC 0000 00EE
        XORR    R3,     R4                      ; 5D74   01DC
        MVO@    R4,     R1                      ; 5D75   024C
        DECR    R0                              ; 5D76   0010
        BNEQ    L_5D6E                          ; 5D77   022C 000A

        ADDR    R5,     R1                      ; 5D79   00E9
        MVI@    R1,     R4                      ; 5D7A   028C
        SDBD                                    ; 5D7B   0001
        ANDI    #$EE00, R4                      ; 5D7C   03BC 0000 00EE
        XORR    R2,     R4                      ; 5D7F   01D4
        MVO@    R4,     R1                      ; 5D80   024C
        PULR    R4                              ; 5D81   02B4
        B       L_5D4D                          ; 5D82   0220 0036

L_5D84:
        DECR    R4                              ; 5D84   0014
        SDBD                                    ; 5D85   0001
        MVII    #$2900, R0                      ; 5D86   02B8 0000 0029
L_5D89:
        MVI@    R4,     R1                      ; 5D89   02A1
        TSTR    R1                              ; 5D8A   0089
        BEQ     L_5D97                          ; 5D8B   0204 000A

        MVO@    R0,     R1                      ; 5D8D   0248
        INCR    R1                              ; 5D8E   0009
        MVI@    R1,     R2                      ; 5D8F   028A
        SDBD                                    ; 5D90   0001
        XORI    #$2000, R2                      ; 5D91   03FA 0000 0020
        MVO@    R2,     R1                      ; 5D94   024A
        B       L_5D89                          ; 5D95   0220 000D

L_5D97:
        MVI     G_0173, R0                      ; 5D97   0280 0173
L_5D99:
        DECR    R0                              ; 5D99   0010
        BEQ     L_5DAE                          ; 5D9A   0204 0012

        SDBD                                    ; 5D9C   0001
        MVII    #$0848, R0                      ; 5D9D   02B8 0048 0008
        MVO     R0,     .BTAB.32                ; 5DA0   0240 0232
        MVO     R0,     .BTAB.46                ; 5DA2   0240 0246
        MVO     R0,     .BTAB.5A                ; 5DA4   0240 025A
        MVO     R0,     .BTAB.6E                ; 5DA6   0240 026E
        ADDI    #$00A8, R0                      ; 5DA8   02F8 00A8
        MVO     R0,     .BTAB.82                ; 5DAA   0240 0282
        B       L_5DB2                          ; 5DAC   0200 0004

L_5DAE:
        MVII    #$0003, R5                      ; 5DAE   02BD 0003
        MVO     R5,     G_0175                  ; 5DB0   0245 0175
L_5DB2:
        SDBD                                    ; 5DB2   0001
        MVII    #$5E9D, R5                      ; 5DB3   02BD 009D 005E
        MVI     G_0174, R3                      ; 5DB6   0283 0174
        SLR     R3,     1                       ; 5DB8   0063
        ADDR    R3,     R5                      ; 5DB9   00DD
        ADDR    R3,     R5                      ; 5DBA   00DD
        SDBD                                    ; 5DBB   0001
        MVI@    R5,     R4                      ; 5DBC   02AC
        MVII    #$0228, R3                      ; 5DBD   02BB 0228
L_5DBF:
        SDBD                                    ; 5DBF   0001
        MVI@    R4,     R1                      ; 5DC0   02A1
        MVI@    R4,     R0                      ; 5DC1   02A0
L_5DC2:
        MVI@    R3,     R2                      ; 5DC2   029A
        SDBD                                    ; 5DC3   0001
        ANDI    #$EFF8, R2                      ; 5DC4   03BA 00F8 00EF
        XORR    R1,     R2                      ; 5DC7   01CA
        MVO@    R2,     R3                      ; 5DC8   025A
        INCR    R3                              ; 5DC9   000B
        DECR    R0                              ; 5DCA   0010
        BNEQ    L_5DC2                          ; 5DCB   022C 000A

        CMPI    #$02F0, R3                      ; 5DCD   037B 02F0
        BNEQ    L_5DBF                          ; 5DCF   022C 0011

        PULR    R5                              ; 5DD1   02B5
L_5DD2:
        MVII    #$0005, R0                      ; 5DD2   02B8 0005
        SDBD                                    ; 5DD4   0001
        MVII    #$08F8, R1                      ; 5DD5   02B9 00F8 0008
        MVII    #$02DC, R2                      ; 5DD8   02BA 02DC
L_5DDA:
        MOVR    R2,     R3                      ; 5DDA   0093
        INCR    R3                              ; 5DDB   000B
        MVI@    R3,     R4                      ; 5DDC   029C
        SDBD                                    ; 5DDD   0001
        ANDI    #$1007, R4                      ; 5DDE   03BC 0007 0010
        XORR    R1,     R4                      ; 5DE1   01CC
        MVO@    R4,     R2                      ; 5DE2   0254
        SUBI    #$0014, R2                      ; 5DE3   033A 0014
        DECR    R0                              ; 5DE5   0010
        BNEQ    L_5DDA                          ; 5DE6   022C 000D

        MVI     G_0175, R0                      ; 5DE8   0280 0175
        DECR    R0                              ; 5DEA   0010
        BMI     L_5E01                          ; 5DEB   020B 0014
        BEQ     L_5E01                          ; 5DED   0204 0012

        CMPI    #$0005, R0                      ; 5DEF   0378 0005
        BLE     L_5DF5                          ; 5DF1   0206 0002

        MVII    #$0005, R0                      ; 5DF3   02B8 0005
L_5DF5:
        SDBD                                    ; 5DF5   0001
        MVII    #$0977, R1                      ; 5DF6   02B9 0077 0009
        MVII    #$02DC, R2                      ; 5DF9   02BA 02DC
L_5DFB:
        MVO@    R1,     R2                      ; 5DFB   0251
        SUBI    #$0014, R2                      ; 5DFC   033A 0014
        DECR    R0                              ; 5DFE   0010
        BNEQ    L_5DFB                          ; 5DFF   022C 0005
L_5E01:
        MOVR    R5,     R7                      ; 5E01   00AF

L_5E02:
        PSHR    R5                              ; 5E02   0275
        CLRR    R0                              ; 5E03   01C0
        SDBD                                    ; 5E04   0001
        MVII    #$5EBE, R5                      ; 5E05   02BD 00BE 005E
        ADD     G_0174, R5                      ; 5E08   02C5 0174
        ADD     G_0174, R5                      ; 5E0A   02C5 0174
        SDBD                                    ; 5E0C   0001
        MVI@    R5,     R4                      ; 5E0D   02AC
        MVII    #$0127, R5                      ; 5E0E   02BD 0127
        MVI     G_0173, R2                      ; 5E10   0282 0173
        CMPI    #$0006, R2                      ; 5E12   037A 0006
        BLE     L_5E22                          ; 5E14   0206 000C

        MVI     G_0174, R2                      ; 5E16   0282 0174
        SDBD                                    ; 5E18   0001
        MVII    #$5ECA, R5                      ; 5E19   02BD 00CA 005E
        ADDR    R2,     R5                      ; 5E1C   00D5
        ADDR    R2,     R5                      ; 5E1D   00D5
        SDBD                                    ; 5E1E   0001
        MVI@    R5,     R4                      ; 5E1F   02AC
        MVII    #$0127, R5                      ; 5E20   02BD 0127
L_5E22:
        MVII    #$0318, R2                      ; 5E22   02BA 0318
        ADDR    R0,     R2                      ; 5E24   00C2
        MVI@    R4,     R3                      ; 5E25   02A3
        CMPI    #$00FF, R3                      ; 5E26   037B 00FF
        BEQ     L_5E49                          ; 5E28   0204 001F

        MVO@    R3,     R5                      ; 5E2A   026B
        MVI@    R4,     R3                      ; 5E2B   02A3
        MVO@    R3,     R2                      ; 5E2C   0253
        MVO@    R3,     R5                      ; 5E2D   026B
        MVI@    R4,     R3                      ; 5E2E   02A3
        ADDI    #$0008, R2                      ; 5E2F   02FA 0008
        MVO@    R3,     R2                      ; 5E31   0253
        MVO@    R3,     R5                      ; 5E32   026B
        MVI@    R4,     R3                      ; 5E33   02A3
        SDBD                                    ; 5E34   0001
        XORI    #$0800, R3                      ; 5E35   03FB 0000 0008
        ADDI    #$0008, R2                      ; 5E38   02FA 0008
        MVO@    R3,     R2                      ; 5E3A   0253
        SDBD                                    ; 5E3B   0001
        MVI@    R4,     R3                      ; 5E3C   02A3
        ADDI    #$0008, R2                      ; 5E3D   02FA 0008
        MVO@    R3,     R2                      ; 5E3F   0253
        MVII    #$011B, R3                      ; 5E40   02BB 011B
        ADDR    R0,     R3                      ; 5E42   00C3
        MVII    #$0001, R2                      ; 5E43   02BA 0001
        MVO@    R2,     R3                      ; 5E45   025A
        INCR    R0                              ; 5E46   0008
        B       L_5E22                          ; 5E47   0220 0026

L_5E49:
        MVII    #$0145, R4                      ; 5E49   02BC 0145
        MVII    #$0006, R0                      ; 5E4B   02B8 0006

        JSR     R5,     L_6CFF                  ; 5E4D   0004 016C 00FF

        PULR    R7                              ; 5E50   02B7

        DECLE   $005D,  $005E,  $006A,  $005E   ; 5E51   005D 005E 006A 005E
        DECLE   $007A,  $005E,  $008A,  $005E   ; 5E55   007A 005E 008A 005E
        DECLE   $007A,  $005E,  $006A,  $005E   ; 5E59   007A 005E 006A 005E
        DECLE   $0252,  $0003,  $0234           ; 5E5D   0252 0003 0234

        DIS                                     ; 5E60   0003
        MVI     .STIC.X.3,R0                    ; 5E61   0280 0003
        MVI@    R1,     R7                      ; 5E63   028F

        DECLE   $0002,  $0000,  $028E,  $029B   ; 5E64   0002 0000 028E 029B
        DECLE   $0244,  $0000,  $0252,  $0002   ; 5E68   0244 0000 0252 0002
        DECLE   $0237,  $0003,  $027B,  $0002   ; 5E6C   0237 0003 027B 0002
        DECLE   $02D4,  $0003,  $0280,  $0003   ; 5E70   02D4 0003 0280 0003
        DECLE   $0000                           ; 5E74   0000

        MVI@    R4,     R7                      ; 5E75   02A7

        MVO@    R0,     R4                      ; 5E76   0260
        MVI@    R5,     R5                      ; 5E77   02AD
        MVO     R4,     .STIC.X.0               ; 5E78   0244 0000
        MVO@    R3,     R2                      ; 5E7A   0253
        EIS                                     ; 5E7B   0002
        MVI@    R5,     R0                      ; 5E7C   02A8
        DIS                                     ; 5E7D   0003
        MVI     .STIC.X.2,R7                    ; 5E7E   0287 0002

        DECLE   $0239,  $0004,  $0280,  $0003   ; 5E80   0239 0004 0280 0003
        DECLE   $0000,  $0242,  $024B,  $02B1   ; 5E84   0000 0242 024B 02B1
        DECLE   $0291,  $0000,  $023F,  $0002   ; 5E88   0291 0000 023F 0002
        DECLE   $025C,  $0002,  $0289,  $0003   ; 5E8C   025C 0002 0289 0003
        DECLE   $02BE,  $0002,  $02CC,  $0003   ; 5E90   02BE 0002 02CC 0003
        DECLE   $0280,  $0003,  $0000           ; 5E94   0280 0003 0000

        MVO@    R1,     R2                      ; 5E97   0251
        MVI@    R2,     R1                      ; 5E98   0291
        MVO@    R5,     R1                      ; 5E99   024D
        MVI@    R5,     R7                      ; 5E9A   02AF

        MVO     R3,     .STIC.X.0               ; 5E9B   0243 0000
        MOVR    R4,     R3                      ; 5E9D   00A3
        SLLC    R2,     2                       ; 5E9E   005E
        MOVR    R5,     R4                      ; 5E9F   00AC
        SLLC    R2,     2                       ; 5EA0   005E
        MOVR    R6,     R5                      ; 5EA1   00B5
        SLLC    R2,     2                       ; 5EA2   005E
        EIS                                     ; 5EA3   0002
        DECR    R0                              ; 5EA4   0010
        RLC     R0,     1                       ; 5EA5   0050

        JSR     R4,     .EXEC.050               ; 5EA6   0004 0010 0050
        DECLE   $0002,  $0000,  $0028,  $0000   ; 5EA9   0002 0000 0028 0000

        DECR    R0                              ; 5EAD   0010
        RLC     R0,     1                       ; 5EAE   0050
        EIS                                     ; 5EAF   0002
        DECR    R0                              ; 5EB0   0010
        RLC     R0,     1                       ; 5EB1   0050

        JSR     R4,     .EXEC.028               ; 5EB2   0004 0010 0028
        DECLE   $0000,  $0010,  $0050,  $0002   ; 5EB5   0000 0010 0050 0002
        DECLE   $0000,  $0050,  $0007,  $0010   ; 5EB9   0000 0050 0007 0010
        DECLE   $0028,  $00D6,  $005E,  $00E9   ; 5EBD   0028 00D6 005E 00E9
        DECLE   $005E,  $0002,  $005F,  $001B   ; 5EC1   005E 0002 005F 001B
        DECLE   $005F,  $003A,  $005F,  $0059   ; 5EC5   005F 003A 005F 0059
        DECLE   $005F,  $007E,  $005F,  $0059   ; 5EC9   005F 007E 005F 0059
        DECLE   $005F,  $00A3,  $005F,  $00C8   ; 5ECD   005F 00A3 005F 00C8
        DECLE   $005F,  $00A3,  $005F,  $0059   ; 5ED1   005F 00A3 005F 0059
        DECLE   $005F,  $0001,  $0318,  $00A8   ; 5ED5   005F 0001 0318 00A8
        DECLE   $0182,  $0000,  $0018,  $0002   ; 5ED9   0182 0000 0018 0002
        DECLE   $0368,  $0098,  $0195,  $0000   ; 5EDD   0368 0098 0195 0000
        DECLE   $0034,  $0001,  $0320,  $00C0   ; 5EE1   0034 0001 0320 00C0
        DECLE   $01A2,  $0000,  $0018,  $00FF   ; 5EE5   01A2 0000 0018 00FF
        DECLE   $0001,  $0318,  $00A8,  $0182   ; 5EE9   0001 0318 00A8 0182
        DECLE   $0000,  $0018,  $0002,  $0380   ; 5EED   0000 0018 0002 0380
        DECLE   $0098,  $0195,  $0000,  $0034   ; 5EF1   0098 0195 0000 0034
        DECLE   $0001,  $0320,  $00B8,  $01A2   ; 5EF5   0001 0320 00B8 01A2
        DECLE   $0000,  $0018,  $0002,  $0368   ; 5EF9   0000 0018 0002 0368
        DECLE   $00D8,  $01B5,  $0000,  $0034   ; 5EFD   00D8 01B5 0000 0034
        DECLE   $00FF,  $0002,  $0320,  $00A8   ; 5F01   00FF 0002 0320 00A8
        DECLE   $0185,  $0000,  $0034,  $0001   ; 5F05   0185 0000 0034 0001
        DECLE   $0348,  $00C8,  $0192,  $0000   ; 5F09   0348 00C8 0192 0000
        DECLE   $0018,  $0002,  $0380,  $00B8   ; 5F0D   0018 0002 0380 00B8
        DECLE   $01A5,  $0000,  $0034,  $0001   ; 5F11   01A5 0000 0034 0001
        DECLE   $0390,  $0098,  $01B2,  $0000   ; 5F15   0390 0098 01B2 0000
        DECLE   $0018,  $00FF,  $0001,  $0320   ; 5F19   0018 00FF 0001 0320
        DECLE   $00A0,  $0182,  $0000,  $0018   ; 5F1D   00A0 0182 0000 0018
        DECLE   $0002,  $0368,  $00A8,  $0195   ; 5F21   0002 0368 00A8 0195
        DECLE   $0000,  $0034,  $0001,  $0390   ; 5F25   0000 0034 0001 0390
        DECLE   $00B8,  $01A2,  $0000,  $0018   ; 5F29   00B8 01A2 0000 0018
        DECLE   $0002,  $0358,  $00D0,  $01B5   ; 5F2D   0002 0358 00D0 01B5
        DECLE   $0000,  $0034,  $0001,  $0328   ; 5F31   0000 0034 0001 0328
        DECLE   $00D8,  $01C2,  $0000,  $0018   ; 5F35   00D8 01C2 0000 0018
        DECLE   $00FF,  $0002,  $0320,  $00A8   ; 5F39   00FF 0002 0320 00A8
        DECLE   $0185,  $0000,  $0034,  $0001   ; 5F3D   0185 0000 0034 0001
        DECLE   $0348,  $00C8,  $0192,  $0000   ; 5F41   0348 00C8 0192 0000
        DECLE   $0018,  $0002,  $0380,  $00B8   ; 5F45   0018 0002 0380 00B8
        DECLE   $01A5,  $0000,  $0034,  $0001   ; 5F49   01A5 0000 0034 0001
        DECLE   $0390,  $0098,  $01B2,  $0000   ; 5F4D   0390 0098 01B2 0000
        DECLE   $0018,  $0002,  $0320,  $00A8   ; 5F51   0018 0002 0320 00A8
        DECLE   $01C5,  $0000,  $0034,  $00FF   ; 5F55   01C5 0000 0034 00FF
        DECLE   $0001,  $0318,  $00A8,  $0182   ; 5F59   0001 0318 00A8 0182
        DECLE   $0000,  $0018,  $0002,  $0380   ; 5F5D   0000 0018 0002 0380
        DECLE   $0098,  $0195,  $0000,  $0034   ; 5F61   0098 0195 0000 0034
        DECLE   $0001,  $0320,  $00B8,  $01A2   ; 5F65   0001 0320 00B8 01A2
        DECLE   $0000,  $0018,  $0002,  $0368   ; 5F69   0000 0018 0002 0368
        DECLE   $00D8,  $01B5,  $0000,  $0034   ; 5F6D   00D8 01B5 0000 0034
        DECLE   $0002,  $0318,  $00A8,  $01C5   ; 5F71   0002 0318 00A8 01C5
        DECLE   $0000,  $0034,  $0001,  $0368   ; 5F75   0000 0034 0001 0368
        DECLE   $00D8,  $01D2,  $0000,  $0018   ; 5F79   00D8 01D2 0000 0018
        DECLE   $00FF,  $0001,  $0318,  $00A8   ; 5F7D   00FF 0001 0318 00A8
        DECLE   $0182,  $0000,  $0018,  $0002   ; 5F81   0182 0000 0018 0002
        DECLE   $0368,  $0098,  $0195,  $0000   ; 5F85   0368 0098 0195 0000
        DECLE   $0034,  $0001,  $0320,  $00C0   ; 5F89   0034 0001 0320 00C0
        DECLE   $01A2,  $0000,  $0018,  $0001   ; 5F8D   01A2 0000 0018 0001
        DECLE   $0318,  $00A8,  $01B2,  $0000   ; 5F91   0318 00A8 01B2 0000
        DECLE   $0018,  $0002,  $0370,  $0098   ; 5F95   0018 0002 0370 0098
        DECLE   $01C5,  $0000,  $0034,  $0001   ; 5F99   01C5 0000 0034 0001
        DECLE   $0320,  $00C8,  $01D2,  $0000   ; 5F9D   0320 00C8 01D2 0000
        DECLE   $0018,  $00FF,  $0001,  $0320   ; 5FA1   0018 00FF 0001 0320
        DECLE   $00B8,  $0182,  $0000,  $0018   ; 5FA5   00B8 0182 0000 0018
        DECLE   $0002,  $0380,  $00C0,  $0195   ; 5FA9   0002 0380 00C0 0195
        DECLE   $0000,  $0034,  $0001,  $0320   ; 5FAD   0000 0034 0001 0320
        DECLE   $00B8,  $01A2,  $0000,  $0018   ; 5FB1   00B8 01A2 0000 0018
        DECLE   $0002,  $0358,  $00C8,  $01B5   ; 5FB5   0002 0358 00C8 01B5
        DECLE   $0000,  $0034,  $0002,  $0390   ; 5FB9   0000 0034 0002 0390
        DECLE   $00A8,  $01C5,  $0000,  $0034   ; 5FBD   00A8 01C5 0000 0034
        DECLE   $0001,  $0390,  $00A8,  $01D2   ; 5FC1   0001 0390 00A8 01D2
        DECLE   $0000,  $0018,  $00FF,  $0002   ; 5FC5   0000 0018 00FF 0002
        DECLE   $0320,  $00A8,  $0185,  $0000   ; 5FC9   0320 00A8 0185 0000
        DECLE   $0034,  $0001,  $0370,  $00A8   ; 5FCD   0034 0001 0370 00A8
        DECLE   $0192,  $0000,  $0018,  $0002   ; 5FD1   0192 0000 0018 0002
        DECLE   $0390,  $00C0,  $01A5,  $0000   ; 5FD5   0390 00C0 01A5 0000
        DECLE   $0034,  $0001,  $0390,  $00C0   ; 5FD9   0034 0001 0390 00C0
        DECLE   $01B2,  $0000,  $0018,  $0002   ; 5FDD   01B2 0000 0018 0002
        DECLE   $0368,  $00D0,  $01C5,  $0000   ; 5FE1   0368 00D0 01C5 0000
        DECLE   $0034,  $0001,  $0340,  $00D8   ; 5FE5   0034 0001 0340 00D8
        DECLE   $01D2,  $0000,  $0018,  $00FF   ; 5FE9   01D2 0000 0018 00FF

        B       L_624F                          ; 5FED   0200 0260

        DECLE   $0140,  $0004                   ; 5FEF   0140 0004

        MVO     R1,     .BTAB.21                ; 5FF1   0241 0221
        NEGR    R5                              ; 5FF3   0025
        CMPR    R0,     R1                      ; 5FF4   0141
        SWAP    R2,     2                       ; 5FF5   0046
        CMPR    R4,     R2                      ; 5FF6   0162
        MVO     R2,     .BTAB.02                ; 5FF7   0242 0202
        CMPR    R4,     R3                      ; 5FF9   0163
        SLR     R3,     2                       ; 5FFA   0067
        BPL     L_5D99                          ; 5FFB   0223 0263

        CMP     G_03A4, R4                      ; 5FFD   0344 03A4
        ANDR    R0,     R4                      ; 5FFF   0184
        MOVR    R0,     R4                      ; 6000   0084
        AND     G_0365, R5                      ; 6001   0385 0365
        MOVR    R4,     R5                      ; 6003   00A5
        SUBR    R0,     R5                      ; 6004   0105
        ADDR    R0,     R6                      ; 6005   00C6
        ANDR    R4,     R6                      ; 6006   01A6
        AND     G_0346, R6                      ; 6007   0386 0346
        SUBR    R4,     R7                      ; 6009   0127
        ADDR    R4,     R7                      ; 600A   00E7

        DECLE   $0367,  $03A7,  $0108,  $03C8   ; 600B   0367 03A7 0108 03C8
        DECLE   $0108,  $0108,  $0129,  $0129   ; 600F   0108 0108 0129 0129
        DECLE   $03C9,  $0129,  $028A,  $02EA   ; 6013   03C9 0129 028A 02EA
        DECLE   $0148,  $0148,  $0169,  $0169   ; 6017   0148 0148 0169 0169
        DECLE   $02CB,  $02AB,  $01CC,  $032C   ; 601B   02CB 02AB 01CC 032C
        DECLE   $0188,  $018C,  $01AD,  $01A9   ; 601F   0188 018C 01AD 01A9
        DECLE   $030D,  $01ED,  $01CE,  $03CE   ; 6023   030D 01ED 01CE 03CE
        DECLE   $01C8,  $01CE,  $01EF,  $01E9   ; 6027   01C8 01CE 01EF 01E9
        DECLE   $03CF,  $01EF,  $021A,  $02B0   ; 602B   03CF 01EF 021A 02B0
        DECLE   $0290,  $021A,  $02D1,  $023B   ; 602F   0290 021A 02D1 023B
        DECLE   $023B,  $02F1,  $025C,  $02D2   ; 6033   023B 02F1 025C 02D2
        DECLE   $025C,  $0292,  $02B3,  $027D   ; 6037   025C 0292 02B3 027D

        ADD@    R6,     R3                      ; 603B   02F3
        MVO@    R7,     R5                      ; 603C   026F
        MVI@    R1,     R6                      ; 603D   028E
        XOR@    R2,     R4                      ; 603E   03D4
        MVI@    R1,     R0                      ; 603F   0288
        MVI@    R1,     R0                      ; 6040   0288
        MVI@    R5,     R1                      ; 6041   02A9
        MVI@    R5,     R1                      ; 6042   02A9
        XOR@    R2,     R5                      ; 6043   03D5
        MVI@    R5,     R7                      ; 6044   02AF

        DECLE   $02DE,  $02DE,  $02D8,  $03D6   ; 6045   02DE 02DE 02D8 03D6
        DECLE   $03D7,  $02F9,  $02FE,  $02FE   ; 6049   03D7 02F9 02FE 02FE
        DECLE   $0318,  $031E,  $0318,  $03D8   ; 604D   0318 031E 0318 03D8
        DECLE   $03D9,  $0339,  $033E,  $0339   ; 6051   03D9 0339 033E 0339
        DECLE   $035A,  $013A,  $011A,  $035A   ; 6055   035A 013A 011A 035A
        DECLE   $03DB,  $037B,  $037B,  $03DB   ; 6059   03DB 037B 037B 03DB
        DECLE   $039C,  $03DC,  $039C,  $011C   ; 605D   039C 03DC 039C 011C
        DECLE   $013D,  $03BD,  $03DD,  $03BD   ; 6061   013D 03BD 03DD 03BD
        DECLE   $03DE,  $03DE,  $03DE,  $03DE   ; 6065   03DE 03DE 03DE 03DE
        DECLE   $005F,  $007F,  $003F,  $001F   ; 6069   005F 007F 003F 001F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 606D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6071   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6075   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6079   0000 0000 0000 0000
        DECLE   $001D,  $001A,  $0000,  $0008   ; 607D   001D 001A 0000 0008
        DECLE   $001B,  $001C,  $0008,  $0000   ; 6081   001B 001C 0008 0000
        DECLE   $0009,  $0000,  $001A,  $001C   ; 6085   0009 0000 001A 001C
        DECLE   $0000,  $0009,  $001D,  $001B   ; 6089   0000 0009 001D 001B
        DECLE   $001E,  $0000,  $0000,  $0000   ; 608D   001E 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001E   ; 6091   0000 0000 0000 001E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6095   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6099   0000 0000 0000 0000
        DECLE   $0019,  $000E,  $0000,  $0008   ; 609D   0019 000E 0000 0008
        DECLE   $0009,  $0000                   ; 60A1   0009 0000

        INCR    R7                              ; 60A3   000F

        COMR    R0                              ; 60A4   0018
L_60A5:
        COMR    R6                              ; 60A5   001E
        DECLE   $0000,  $0000,  $0008,  $0009   ; 60A6   0000 0000 0008 0009
        DECLE   $0000,  $0000,  $001E,  $0000   ; 60AA   0000 0000 001E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60AE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60B2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60B6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60BA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60BE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60C2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60C6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001E   ; 60CA   0000 0000 0000 001E
        DECLE   $0000,  $001E,  $0000,  $0000   ; 60CE   0000 001E 0000 0000
        DECLE   $001E,  $0000,  $001E,  $0009   ; 60D2   001E 0000 001E 0009
        DECLE   $0000,  $0000,  $0008,  $0000   ; 60D6   0000 0000 0008 0000
        DECLE   $001E,  $001E,  $0000,  $001E   ; 60DA   001E 001E 0000 001E
        DECLE   $0000,  $0008,  $0000,  $0000   ; 60DE   0000 0008 0000 0000
        DECLE   $0009,  $0000,  $001E,  $0000   ; 60E2   0009 0000 001E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60E6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60EA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 60EE   0000 0000

        SWAP    R0,     1                       ; 60F0   0040
        SLR     R0,     2                       ; 60F1   0064
        SAR     R0,     1                       ; 60F2   0068
        SLR     R2,     1                       ; 60F3   0062
        ADDR    R4,     R1                      ; 60F4   00E1
        SAR     R2,     2                       ; 60F5   006E
        ADDR    R4,     R7                      ; 60F6   00E7

        DECLE   $0020,  $00C0,  $0064,  $00E2   ; 60F7   0020 00C0 0064 00E2
        DECLE   $0066,  $00E6,  $0000,  $0040   ; 60FB   0066 00E6 0000 0040
        DECLE   $0000                           ; 60FF   0000

        SWAP    R0,     1                       ; 6100   0040
        NEGR    R0                              ; 6101   0020
        ADDR    R0,     R0                      ; 6102   00C0
        ADDR    R0,     R0                      ; 6103   00C0
        ADDR    R4,     R0                      ; 6104   00E0
        ADDR    R5,     R2                      ; 6105   00EA
        ADDR    R4,     R5                      ; 6106   00E5
        SLR     R2,     2                       ; 6107   0066
        ADDR    R5,     R1                      ; 6108   00E9
        SAR     R2,     1                       ; 6109   006A
        ADDR    R4,     R5                      ; 610A   00E5
        ADDR    R5,     R7                      ; 610B   00EF

        DECLE   $0000,  $0004                   ; 610C   0000 0004

        EIS                                     ; 610E   0002
        DECR    R0                              ; 610F   0010
        TSTR    R0                              ; 6110   0080
        INCR    R4                              ; 6111   000C
        INCR    R3                              ; 6112   000B
        GSWD    R0                              ; 6113   0030
        ADDR    R4,     R0                      ; 6114   00E0
        INCR    R7                              ; 6115   000F

        ADDR    R6,     R0                      ; 6116   00F0
L_6117:
        CLRC                                    ; 6117   0006
        DECLE   $0090,  $000E,  $00B0,  $003E   ; 6118   0090 000E 00B0 003E
        DECLE   $00BC,  $0014,  $0082,  $0012   ; 611C   00BC 0014 0082 0012
        DECLE   $0084,  $0016,  $0094,  $0093   ; 6120   0084 0016 0094 0093
        DECLE   $00C6,  $00BB,  $00EE,  $003C   ; 6124   00C6 00BB 00EE 003C
        DECLE   $00EB,  $003B,  $00EC,  $00AA   ; 6128   00EB 003B 00EC 00AA
        DECLE   $0000,  $0000,  $0004,  $0000   ; 612C   0000 0000 0004 0000
        DECLE   $0040,  $0040,  $0000,  $0004   ; 6130   0040 0040 0000 0004
        DECLE   $0000,  $00FF,  $00F7,  $00FF   ; 6134   0000 00FF 00F7 00FF
        DECLE   $007F,  $007F,  $00FF,  $00F7   ; 6138   007F 007F 00FF 00F7
        DECLE   $00FF,  $007F,  $00FF,  $00FF   ; 613C   00FF 007F 00FF 00FF
        DECLE   $00F7,  $0000,  $00FF,  $00FF   ; 6140   00F7 0000 00FF 00FF
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; 6144   0000 00FF 00FF 00FF
        DECLE   $00FF,  $007F,  $00FF,  $00FF   ; 6148   00FF 007F 00FF 00FF
        DECLE   $00F7,  $0040,  $0004,  $0004   ; 614C   00F7 0040 0004 0004
        DECLE   $0040,  $0040,  $0040,  $0004   ; 6150   0040 0040 0040 0004
        DECLE   $0004,  $0060,  $00FF,  $00FF   ; 6154   0004 0060 00FF 00FF
        DECLE   $0006,  $00FF,  $0060,  $0006   ; 6158   0006 00FF 0060 0006
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 615C   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6160   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6164   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 6168   00FF 00FF 00FF 0000
        DECLE   $0000                           ; 616C   0000
L_616D:
        MVI@    R5,     R3                      ; 616D   02AB
        MVII    #$00FF, R2                      ; 616E   02BA 00FF
        ADDI    #$0176, R3                      ; 6170   02FB 0176
        MVI@    R3,     R1                      ; 6172   0299
        CMPR    R1,     R2                      ; 6173   014A
        BEQ     L_617A                          ; 6174   0204 0004

        MVO@    R2,     R3                      ; 6176   025A
        J       L_69A7                          ; 6177   0004 0368 01A7
L_617A:
        MOVR    R5,     R7                      ; 617A   00AF

        DECLE   $00BB,  $0061,  $00AC,  $0062   ; 617B   00BB 0061 00AC 0062
        DECLE   $001B,  $0063,  $0058,  $0063   ; 617F   001B 0063 0058 0063
        DECLE   $007D,  $0063,  $00B2,  $0063   ; 6183   007D 0063 00B2 0063
        DECLE   $005C,  $0064,  $00DB,  $0063   ; 6187   005C 0064 00DB 0063
        DECLE   $0085,  $0064,  $009E,  $0064   ; 618B   0085 0064 009E 0064
        DECLE   $00F3,  $0067,  $00DD,  $0064   ; 618F   00F3 0067 00DD 0064
        DECLE   $004E,  $0065,  $0077,  $0065   ; 6193   004E 0065 0077 0065
        DECLE   $00EE,  $0065,  $0035,  $0066   ; 6197   00EE 0065 0035 0066
        DECLE   $0072,  $0066,  $00BF           ; 619B   0072 0066 00BF

        SLR     R2,     2                       ; 619E   0066
        SWAP    R2,     2                       ; 619F   0046
        SLR     R3,     2                       ; 61A0   0067
L_61A1:
        MVI@    R5,     R1                      ; 61A1   02A9
        PSHR    R5                              ; 61A2   0275
        PSHR    R1                              ; 61A3   0271
        SDBD                                    ; 61A4   0001
        MVII    #$617B, R4                      ; 61A5   02BC 007B 0061
        ADDR    R1,     R4                      ; 61A8   00CC
        ADDR    R1,     R4                      ; 61A9   00CC
        SDBD                                    ; 61AA   0001
        MVI@    R4,     R5                      ; 61AB   02A5
        SDBD                                    ; 61AC   0001
        MVII    #$61B3, R4                      ; 61AD   02BC 00B3 0061
        J       L_694A                          ; 61B0   0004 0368 014A

        MVII    #$0176, R1                      ; 61B3   02B9 0176
        ADD@    R6,     R1                      ; 61B5   02F1
        TSTR    R0                              ; 61B6   0080
        BMI     L_61BA                          ; 61B7   020B 0001

        MVO@    R0,     R1                      ; 61B9   0248
L_61BA:
        PULR    R7                              ; 61BA   02B7

        DECLE   $0029,  $00D3,  $00FE,  $0080   ; 61BB   0029 00D3 00FE 0080
        DECLE   $0049,  $0082,  $0000,  $0080   ; 61BF   0049 0082 0000 0080
        DECLE   $0059,  $0042,  $0000,  $0001   ; 61C3   0059 0042 0000 0001
        DECLE   $0000,  $0042,  $0000,  $0080   ; 61C7   0000 0042 0000 0080
        DECLE   $0059,  $0042,  $0000,  $0001   ; 61CB   0059 0042 0000 0001
        DECLE   $0000,  $0042,  $0000,  $0080   ; 61CF   0000 0042 0000 0080
        DECLE   $0059,  $0042,  $0000,  $0001   ; 61D3   0059 0042 0000 0001
        DECLE   $0000,  $0042,  $0000,  $0080   ; 61D7   0000 0042 0000 0080
        DECLE   $0047,  $0082,  $0000,  $0080   ; 61DB   0047 0082 0000 0080
        DECLE   $0057,  $0042,  $0000,  $0001   ; 61DF   0057 0042 0000 0001
        DECLE   $0000,  $0042,  $0000,  $0080   ; 61E3   0000 0042 0000 0080
        DECLE   $0057,  $0042,  $0000,  $0001   ; 61E7   0057 0042 0000 0001
        DECLE   $0000,  $0042,  $0000,  $0080   ; 61EB   0000 0042 0000 0080
        DECLE   $0057,  $0042,  $0000,  $0001   ; 61EF   0057 0042 0000 0001
        DECLE   $0000,  $0042,  $0000,  $0080   ; 61F3   0000 0042 0000 0080
        DECLE   $0045,  $0082,  $0000,  $0080   ; 61F7   0045 0082 0000 0080
        DECLE   $0055,  $0042,  $0000,  $0001   ; 61FB   0055 0042 0000 0001
        DECLE   $0000,  $0042,  $0000,  $0080   ; 61FF   0000 0042 0000 0080
        DECLE   $0055,  $0042,  $0000,  $0001   ; 6203   0055 0042 0000 0001
        DECLE   $0000,  $0042,  $0000,  $0080   ; 6207   0000 0042 0000 0080
        DECLE   $0055,  $0042,  $0000,  $0001   ; 620B   0055 0042 0000 0001
        DECLE   $0000,  $00C2,  $0000,  $0080   ; 620F   0000 00C2 0000 0080
        DECLE   $0059,  $0042,  $0000,  $0001   ; 6213   0059 0042 0000 0001
        DECLE   $0000,  $0042,  $0000,  $0080   ; 6217   0000 0042 0000 0080
        DECLE   $0059,  $0042,  $0000,  $0001   ; 621B   0059 0042 0000 0001
        DECLE   $0000,  $0042,  $0000,  $0080   ; 621F   0000 0042 0000 0080
        DECLE   $0059,  $0042,  $0000,  $0001   ; 6223   0059 0042 0000 0001
        DECLE   $0000,  $0042,  $0000,  $0080   ; 6227   0000 0042 0000 0080
        DECLE   $0059,  $0082,  $0000,  $0001   ; 622B   0059 0082 0000 0001
        DECLE   $0000,  $0082,  $0000,  $0080   ; 622F   0000 0082 0000 0080
        DECLE   $0029,  $0082,  $0000,  $0001   ; 6233   0029 0082 0000 0001
        DECLE   $0000,  $0082,  $0000,  $0080   ; 6237   0000 0082 0000 0080
        DECLE   $0059,  $0042,  $0000,  $0001   ; 623B   0059 0042 0000 0001
        DECLE   $0000,  $0042,  $0000,  $0080   ; 623F   0000 0042 0000 0080
        DECLE   $0029,  $0002,  $0001,  $0080   ; 6243   0029 0002 0001 0080
        DECLE   $0059,  $0042,  $0000,  $0001   ; 6247   0059 0042 0000 0001
        DECLE   $0000,  $0042,  $0000           ; 624B   0000 0042 0000

        TSTR    R0                              ; 624E   0080
L_624F:
        SARC    R1,     1                       ; 624F   0079
        DECLE   $0042,  $0000,  $0001,  $0000   ; 6250   0042 0000 0001 0000
        DECLE   $0042,  $0000,  $0080,  $0029   ; 6254   0042 0000 0080 0029
        DECLE   $0042,  $0000,  $0001,  $0000   ; 6258   0042 0000 0001 0000
        DECLE   $0042,  $0000,  $0080,  $0029   ; 625C   0042 0000 0080 0029
        DECLE   $0042,  $0000,  $0001,  $0000   ; 6260   0042 0000 0001 0000
        DECLE   $0042,  $0000,  $0080,  $0029   ; 6264   0042 0000 0080 0029
        DECLE   $0002,  $0001,  $0080,  $0007   ; 6268   0002 0001 0080 0007
        DECLE   $0082,  $0000                   ; 626C   0082 0000

        TSTR    R0                              ; 626E   0080
        MOVR    R4,     R7                      ; 626F   00A7

        DECLE   $0082,  $0000,  $0001,  $0000   ; 6270   0082 0000 0001 0000
        DECLE   $0082,  $0000,  $0080,  $00B7   ; 6274   0082 0000 0080 00B7
        DECLE   $0082,  $0000,  $0001,  $0000   ; 6278   0082 0000 0001 0000
        DECLE   $0082,  $0000,  $0080,  $0057   ; 627C   0082 0000 0080 0057
        DECLE   $0082,  $0000,  $0001,  $0000   ; 6280   0082 0000 0001 0000
        DECLE   $0082,  $0000,  $0080,  $00B7   ; 6284   0082 0000 0080 00B7
        DECLE   $0042,  $0000,  $0001,  $0000   ; 6288   0042 0000 0001 0000
        DECLE   $0042,  $0000,  $0080,  $0057   ; 628C   0042 0000 0080 0057
        DECLE   $0002,  $0001,  $0080,  $00B7   ; 6290   0002 0001 0080 00B7
        DECLE   $0002,  $0001,  $0080,  $0007   ; 6294   0002 0001 0080 0007
        DECLE   $0042,  $0000,  $0001,  $0000   ; 6298   0042 0000 0001 0000
        DECLE   $0042,  $0000,  $0080,  $0007   ; 629C   0042 0000 0080 0007
        DECLE   $0042,  $0000,  $0001,  $0000   ; 62A0   0042 0000 0001 0000
        DECLE   $0042,  $0000,  $0080,  $0007   ; 62A4   0042 0000 0080 0007
        DECLE   $0002,  $0002,  $0007,  $0000   ; 62A8   0002 0002 0007 0000
        DECLE   $002A,  $00D3,  $00FD,  $0082   ; 62AC   002A 00D3 00FD 0082
        DECLE   $0006,  $0010,  $0055,  $0042   ; 62B0   0006 0010 0055 0042
        DECLE   $0000,  $0011,  $0000,  $0042   ; 62B4   0000 0011 0000 0042
        DECLE   $0000,  $0010,  $0075,  $0042   ; 62B8   0000 0010 0075 0042
        DECLE   $0000,  $0011,  $0000,  $0042   ; 62BC   0000 0011 0000 0042
        DECLE   $0000,  $0010,  $0095,  $0042   ; 62C0   0000 0010 0095 0042
        DECLE   $0000,  $0011,  $0000,  $0042   ; 62C4   0000 0011 0000 0042
        DECLE   $0000,  $0044,  $0010,  $0010   ; 62C8   0000 0044 0010 0010
        DECLE   $00A5,  $0042,  $0000,  $0011   ; 62CC   00A5 0042 0000 0011
        DECLE   $0000,  $0042,  $0000,  $0010   ; 62D0   0000 0042 0000 0010
        DECLE   $0055,  $0042,  $0000,  $0011   ; 62D4   0055 0042 0000 0011
        DECLE   $0000,  $0042,  $0000,  $0095   ; 62D8   0000 0042 0000 0095
        DECLE   $00FB,  $0010,  $0085,  $0042   ; 62DC   00FB 0010 0085 0042
        DECLE   $0000,  $0011,  $0000,  $0042   ; 62E0   0000 0011 0000 0042
        DECLE   $0000,  $0044,  $0006,  $0010   ; 62E4   0000 0044 0006 0010
        DECLE   $0055,  $0042,  $0000,  $0011   ; 62E8   0055 0042 0000 0011
        DECLE   $0000,  $0042,  $0000           ; 62EC   0000 0042 0000

        MOVR    R2,     R5                      ; 62EF   0095
        ADDR    R7,     R5                      ; 62F0   00FD
        SWAP    R0,     2                       ; 62F1   0044

        JSR     R4,     .EXEC.085               ; 62F2   0004 0010 0085
        DECLE   $0042,  $0000,  $0011,  $0000   ; 62F5   0042 0000 0011 0000
        DECLE   $0042,  $0000,  $0010,  $0055   ; 62F9   0042 0000 0010 0055
        DECLE   $0042,  $0000,  $0011,  $0000   ; 62FD   0042 0000 0011 0000
        DECLE   $0042,  $0000                   ; 6301   0042 0000

        MOVR    R2,     R5                      ; 6303   0095
        ADDR    R7,     R3                      ; 6304   00FB
        SWAP    R0,     2                       ; 6305   0044

        JSR     R4,     .EXEC.095               ; 6306   0004 0010 0095
        DECLE   $0042,  $0000,  $0011,  $0000   ; 6309   0042 0000 0011 0000
        DECLE   $0042,  $0000,  $0010,  $0055   ; 630D   0042 0000 0010 0055
        DECLE   $0042,  $0000,  $0011,  $0000   ; 6311   0042 0000 0011 0000
        DECLE   $0042,  $0000,  $0095,  $00FB   ; 6315   0042 0000 0095 00FB
        DECLE   $0007,  $0000,  $0052,  $00D3   ; 6319   0007 0000 0052 00D3
        DECLE   $00FD,  $0050,  $00A9,  $0032   ; 631D   00FD 0050 00A9 0032
        DECLE   $0000,  $0011,  $0000,  $0032   ; 6321   0000 0011 0000 0032
        DECLE   $0000,  $0050,  $0009,  $0032   ; 6325   0000 0050 0009 0032
        DECLE   $0000,  $0011,  $0000,  $0032   ; 6329   0000 0011 0000 0032
        DECLE   $0000,  $0050,  $002B,  $0032   ; 632D   0000 0050 002B 0032
        DECLE   $0000,  $0011,  $0000,  $0032   ; 6331   0000 0011 0000 0032
        DECLE   $0000,  $0050,  $00A9,  $0032   ; 6335   0000 0050 00A9 0032
        DECLE   $0000,  $0011,  $0000,  $0032   ; 6339   0000 0011 0000 0032
        DECLE   $0000,  $0050,  $0059,  $0062   ; 633D   0000 0050 0059 0062
        DECLE   $0000,  $0011,  $0000,  $0062   ; 6341   0000 0011 0000 0062
        DECLE   $0000,  $0050,  $007B,  $00C2   ; 6345   0000 0050 007B 00C2
        DECLE   $0000,  $0011,  $0000,  $00C2   ; 6349   0000 0011 0000 00C2
        DECLE   $0000,  $0050,  $005B,  $00C2   ; 634D   0000 0050 005B 00C2
        DECLE   $0000,  $0011,  $0000,  $0082   ; 6351   0000 0011 0000 0082
        DECLE   $0001,  $0007,  $0000,  $0011   ; 6355   0001 0007 0000 0011
        DECLE   $00D3,  $00FE,  $0040,  $0049   ; 6359   00D3 00FE 0040 0049
        DECLE   $0042,  $0000,  $0040,  $0039   ; 635D   0042 0000 0040 0039
        DECLE   $0042,  $0000,  $0040,  $0049   ; 6361   0042 0000 0040 0049
        DECLE   $0042,  $0000,  $0040,  $0039   ; 6365   0042 0000 0040 0039
        DECLE   $0042,  $0000,  $0040,  $0047   ; 6369   0042 0000 0040 0047
        DECLE   $0042,  $0000,  $0040,  $0037   ; 636D   0042 0000 0040 0037
        DECLE   $0042,  $0000,  $0040,  $0047   ; 6371   0042 0000 0040 0047
        DECLE   $0042,  $0000,  $0040,  $0037   ; 6375   0042 0000 0040 0037
        DECLE   $0042,  $0000,  $0007,  $0000   ; 6379   0042 0000 0007 0000
        DECLE   $002A,  $00D3,  $00FD,  $0090   ; 637D   002A 00D3 00FD 0090
        DECLE   $0019,  $0022,  $0000,  $0090   ; 6381   0019 0022 0000 0090
        DECLE   $0029,  $0022,  $0000,  $0090   ; 6385   0029 0022 0000 0090
        DECLE   $0039,  $0022,  $0000,  $0090   ; 6389   0039 0022 0000 0090
        DECLE   $0049,  $0022,  $0000,  $0090   ; 638D   0049 0022 0000 0090
        DECLE   $0059,  $0022,  $0000,  $0090   ; 6391   0059 0022 0000 0090
        DECLE   $0069,  $0022,  $0000,  $0090   ; 6395   0069 0022 0000 0090
        DECLE   $0079,  $0022,  $0000,  $0090   ; 6399   0079 0022 0000 0090
        DECLE   $0089,  $0022,  $0000,  $0090   ; 639D   0089 0022 0000 0090
        DECLE   $0099,  $0022,  $0000,  $0090   ; 63A1   0099 0022 0000 0090
        DECLE   $00A9,  $0022,  $0000,  $0090   ; 63A5   00A9 0022 0000 0090
        DECLE   $00B9,  $0022,  $0000,  $0090   ; 63A9   00B9 0022 0000 0090
        DECLE   $000B,  $0042,  $0000,  $0007   ; 63AD   000B 0042 0000 0007
        DECLE   $0000,  $002A,  $00D3,  $00FD   ; 63B1   0000 002A 00D3 00FD
        DECLE   $0090,  $00B7,  $0012,  $0000   ; 63B5   0090 00B7 0012 0000
        DECLE   $0090,  $0009,  $0012,  $0000   ; 63B9   0090 0009 0012 0000
        DECLE   $0090,  $0019,  $0012,  $0000   ; 63BD   0090 0019 0012 0000
        DECLE   $0090,  $0029,  $0012,  $0000   ; 63C1   0090 0029 0012 0000
        DECLE   $0090,  $0039,  $0012,  $0000   ; 63C5   0090 0039 0012 0000
        DECLE   $0090,  $00A9,  $0022,  $0000   ; 63C9   0090 00A9 0022 0000
        DECLE   $0090,  $0099,  $0022,  $0000   ; 63CD   0090 0099 0022 0000
        DECLE   $0090,  $00B9,  $0022,  $0000   ; 63D1   0090 00B9 0022 0000
        DECLE   $0090,  $000B,  $0082,  $0000   ; 63D5   0090 000B 0082 0000
        DECLE   $0007,  $0000                   ; 63D9   0007 0000

        ADCR    R1                              ; 63DB   0029
        ADDR    R2,     R3                      ; 63DC   00D3
        ADDR    R7,     R6                      ; 63DD   00FE
        SWAP    R0,     1                       ; 63DE   0040
L_63DF:
        DECR    R7                              ; 63DF   0017

        DECLE   $0002,  $0000,  $0001,  $0000   ; 63E0   0002 0000 0001 0000
        DECLE   $0002,  $0000,  $0049,  $0018   ; 63E4   0002 0000 0049 0018
        DECLE   $0001,  $0000,  $0002,  $0000   ; 63E8   0001 0000 0002 0000
        DECLE   $0001,  $0000,  $0002,  $0000   ; 63EC   0001 0000 0002 0000
        DECLE   $0040,  $0027,  $0002,  $0000   ; 63F0   0040 0027 0002 0000
        DECLE   $0001,  $0000,  $0002,  $0000   ; 63F4   0001 0000 0002 0000
        DECLE   $00F9,  $0016,  $0001,  $0000   ; 63F8   00F9 0016 0001 0000
        DECLE   $0002,  $0000,  $0001,  $0000   ; 63FC   0002 0000 0001 0000
        DECLE   $0002,  $0000,  $0040,  $0037   ; 6400   0002 0000 0040 0037
        DECLE   $0002,  $0000,  $0001,  $0000   ; 6404   0002 0000 0001 0000
        DECLE   $0002,  $0000,  $0040,  $0057   ; 6408   0002 0000 0040 0057
        DECLE   $0002,  $0000,  $0001,  $0000   ; 640C   0002 0000 0001 0000
        DECLE   $0002,  $0000,  $0009,  $0013   ; 6410   0002 0000 0009 0013
        DECLE   $0001,  $0000,  $0002,  $0000   ; 6414   0001 0000 0002 0000
        DECLE   $0001,  $0000,  $0002,  $0000   ; 6418   0001 0000 0002 0000
        DECLE   $0029,  $0012,  $0001,  $0000   ; 641C   0029 0012 0001 0000
        DECLE   $0002,  $0000,  $0040,  $0077   ; 6420   0002 0000 0040 0077
        DECLE   $0002,  $0000,  $0001,  $0000   ; 6424   0002 0000 0001 0000
        DECLE   $0002,  $0000                   ; 6428   0002 0000

        SWAP    R0,     1                       ; 642A   0040
        MOVR    R0,     R7                      ; 642B   0087

        DECLE   $0002,  $0000,  $0040,  $0077   ; 642C   0002 0000 0040 0077
        DECLE   $0002,  $0000,  $0040,  $0067   ; 6430   0002 0000 0040 0067
        DECLE   $0002,  $0000,  $0040,  $0057   ; 6434   0002 0000 0040 0057
        DECLE   $0002,  $0000,  $0040,  $0047   ; 6438   0002 0000 0040 0047
        DECLE   $0002,  $0000,  $0040,  $0037   ; 643C   0002 0000 0040 0037
        DECLE   $0002,  $0000,  $00F9,  $0016   ; 6440   0002 0000 00F9 0016
        DECLE   $0001,  $0000,  $0002,  $0000   ; 6444   0001 0000 0002 0000
        DECLE   $0049,  $0018,  $0001,  $0000   ; 6448   0049 0018 0001 0000
        DECLE   $0002,  $0000                   ; 644C   0002 0000

        SWAP    R0,     1                       ; 644E   0040
L_644F:
        DECR    R7                              ; 644F   0017

        DECLE   $0002,  $0000,  $0040,  $00B5   ; 6450   0002 0000 0040 00B5
        DECLE   $0002,  $0000,  $0040,  $00A5   ; 6454   0002 0000 0040 00A5
        DECLE   $0002,  $0000,  $0007,  $0000   ; 6458   0002 0000 0007 0000
        DECLE   $002A,  $00D3,  $00FD,  $0050   ; 645C   002A 00D3 00FD 0050
        DECLE   $0009,  $0032,  $0000,  $0050   ; 6460   0009 0032 0000 0050
        DECLE   $0059,  $0032,  $0000,  $0050   ; 6464   0059 0032 0000 0050
        DECLE   $0099,  $0032,  $0000,  $0050   ; 6468   0099 0032 0000 0050
        DECLE   $0009,  $0032,  $0000,  $0050   ; 646C   0009 0032 0000 0050
        DECLE   $0059,  $0032,  $0000,  $0050   ; 6470   0059 0032 0000 0050
        DECLE   $0099,  $0032,  $0000,  $0050   ; 6474   0099 0032 0000 0050
        DECLE   $0009,  $0032,  $0000,  $0050   ; 6478   0009 0032 0000 0050
        DECLE   $0059,  $0032,  $0000,  $0050   ; 647C   0059 0032 0000 0050
        DECLE   $0099,  $0032,  $0000,  $0007   ; 6480   0099 0032 0000 0007
        DECLE   $0000,  $002C,  $00D3,  $00FB   ; 6484   0000 002C 00D3 00FB
        DECLE   $00A0,  $00AB,  $0042,  $0000   ; 6488   00A0 00AB 0042 0000
        DECLE   $00A0,  $00BB,  $0042,  $0000   ; 648C   00A0 00BB 0042 0000
        DECLE   $00A0,  $000D,  $0042,  $0000   ; 6490   00A0 000D 0042 0000
        DECLE   $00A0,  $003D,  $0042,  $0000   ; 6494   00A0 003D 0042 0000
        DECLE   $00A0,  $000D,  $0082,  $0000   ; 6498   00A0 000D 0082 0000
        DECLE   $0007,  $0000,  $002C,  $00D3   ; 649C   0007 0000 002C 00D3
        DECLE   $00FB,  $0060,  $0055,  $0022   ; 64A0   00FB 0060 0055 0022
        DECLE   $0000,  $0069,  $0028,  $0005   ; 64A4   0000 0069 0028 0005
        DECLE   $0000,  $0022,  $0000,  $0060   ; 64A8   0000 0022 0000 0060
        DECLE   $0055,  $0022,  $0000,  $0069   ; 64AC   0055 0022 0000 0069
        DECLE   $0028,  $0005,  $0000,  $0022   ; 64B0   0028 0005 0000 0022
        DECLE   $0000,  $0060,  $0055,  $0022   ; 64B4   0000 0060 0055 0022
        DECLE   $0000,  $0069,  $0028,  $0005   ; 64B8   0000 0069 0028 0005
        DECLE   $0000,  $0022,  $0000,  $0060   ; 64BC   0000 0022 0000 0060
        DECLE   $00A5,  $0022,  $0000,  $0060   ; 64C0   00A5 0022 0000 0060
        DECLE   $0095,  $0022,  $0000,  $0060   ; 64C4   0095 0022 0000 0060
        DECLE   $00A5,  $0022,  $0000,  $0060   ; 64C8   00A5 0022 0000 0060
        DECLE   $0095,  $0022,  $0000,  $0060   ; 64CC   0095 0022 0000 0060
        DECLE   $00A5,  $0022,  $0000,  $0060   ; 64D0   00A5 0022 0000 0060
        DECLE   $0095,  $0022,  $0000,  $0060   ; 64D4   0095 0022 0000 0060
        DECLE   $00A5,  $0022,  $0000,  $0007   ; 64D8   00A5 0022 0000 0007
        DECLE   $0000,  $003B,  $00D3,  $00FC   ; 64DC   0000 003B 00D3 00FC
        DECLE   $0000,  $0029,  $0011,  $0000   ; 64E0   0000 0029 0011 0000
        DECLE   $0062,  $0000,  $0000,  $0039   ; 64E4   0062 0000 0000 0039
        DECLE   $0062,  $0000,  $0000,  $0049   ; 64E8   0062 0000 0000 0049
        DECLE   $0062,  $0000,  $0000,  $0059   ; 64EC   0062 0000 0000 0059
        DECLE   $0010,  $0055,  $0062,  $0000   ; 64F0   0010 0055 0062 0000
        DECLE   $0001,  $0000,  $0011,  $0000   ; 64F4   0001 0000 0011 0000
        DECLE   $0062,  $0000,  $0000,  $0029   ; 64F8   0062 0000 0000 0029
        DECLE   $0062,  $0000,  $0000,  $0039   ; 64FC   0062 0000 0000 0039
        DECLE   $0010,  $0065,  $0062,  $0000   ; 6500   0010 0065 0062 0000
        DECLE   $0001,  $0000,  $0011,  $0000   ; 6504   0001 0000 0011 0000
        DECLE   $0062,  $0000,  $0000,  $0009   ; 6508   0062 0000 0000 0009
        DECLE   $0062,  $0000,  $0000,  $0029   ; 650C   0062 0000 0000 0029
        DECLE   $0010,  $0085,  $0062,  $0000   ; 6510   0010 0085 0062 0000
        DECLE   $0001,  $0000,  $0011,  $0000   ; 6514   0001 0000 0011 0000
        DECLE   $0062,  $0000,  $0000,  $00A7   ; 6518   0062 0000 0000 00A7
        DECLE   $0062,  $0000,  $0000,  $0009   ; 651C   0062 0000 0000 0009
        DECLE   $0010,  $0095,  $0062,  $0000   ; 6520   0010 0095 0062 0000
        DECLE   $0001,  $0000,  $0011,  $0000   ; 6524   0001 0000 0011 0000
        DECLE   $0062,  $0000,  $0000,  $0097   ; 6528   0062 0000 0000 0097
        DECLE   $0062,  $0000,  $0000,  $00A7   ; 652C   0062 0000 0000 00A7
        DECLE   $0010,  $00A5,  $00C2,  $0000   ; 6530   0010 00A5 00C2 0000
        DECLE   $0001,  $0000,  $0011,  $0000   ; 6534   0001 0000 0011 0000
        DECLE   $0062,  $0000,  $0000,  $00A9   ; 6538   0062 0000 0000 00A9
        DECLE   $0062,  $0000,  $0001,  $0000   ; 653C   0062 0000 0001 0000
        DECLE   $0062,  $0000,  $0000,  $00A7   ; 6540   0062 0000 0000 00A7
        DECLE   $0010,  $00A5,  $0082,  $0001   ; 6544   0010 00A5 0082 0001
        DECLE   $0001,  $0000,  $0011,  $0000   ; 6548   0001 0000 0011 0000
        DECLE   $0007,  $0000,  $004F,  $00D3   ; 654C   0007 0000 004F 00D3
        DECLE   $00F8,  $0000                   ; 6550   00F8 0000

        ADCR    R1                              ; 6552   0029
        DECR    R0                              ; 6553   0010
        MOVR    R0,     R7                      ; 6554   0087

        DECLE   $0042,  $0000,  $0000,  $00B7   ; 6555   0042 0000 0000 00B7
        DECLE   $0010,  $0057,  $0042,  $0000   ; 6559   0010 0057 0042 0000
        DECLE   $0000,  $0087,  $0010,  $0027   ; 655D   0000 0087 0010 0027
        DECLE   $0042,  $0000,  $0000,  $0077   ; 6561   0042 0000 0000 0077
        DECLE   $0010,  $00B5,  $0042,  $0000   ; 6565   0010 00B5 0042 0000
        DECLE   $0000                           ; 6569   0000

        ADCR    R1                              ; 656A   0029
        DECR    R0                              ; 656B   0010
        MOVR    R0,     R7                      ; 656C   0087

        DECLE   $0082,  $0000,  $0001,  $0000   ; 656D   0082 0000 0001 0000
        DECLE   $0011,  $0000,  $0082,  $0000   ; 6571   0011 0000 0082 0000
        DECLE   $0036,  $0000,  $004F,  $00D3   ; 6575   0036 0000 004F 00D3
        DECLE   $00F8,  $0000,  $0039,  $0010   ; 6579   00F8 0000 0039 0010
        DECLE   $00B7,  $0020,  $0077,  $0052   ; 657D   00B7 0020 0077 0052
        DECLE   $0000,  $0000                   ; 6581   0000 0000

        ADCR    R1                              ; 6583   0029
        DECR    R0                              ; 6584   0010
        MOVR    R4,     R7                      ; 6585   00A7

        DECLE   $0020,  $0067,  $0052,  $0000   ; 6586   0020 0067 0052 0000
        DECLE   $0000                           ; 658A   0000

        COMR    R1                              ; 658B   0019
        DECR    R0                              ; 658C   0010
        MOVR    R2,     R7                      ; 658D   0097

        DECLE   $0020,  $0057,  $0052,  $0000   ; 658E   0020 0057 0052 0000
        DECLE   $0000                           ; 6592   0000

        ADCR    R1                              ; 6593   0029
        DECR    R0                              ; 6594   0010
        MOVR    R4,     R7                      ; 6595   00A7

        DECLE   $00B9,  $002A,  $0005,  $0000   ; 6596   00B9 002A 0005 0000
        DECLE   $0052,  $0000,  $0000           ; 659A   0052 0000 0000

        COMR    R1                              ; 659D   0019
        DECR    R0                              ; 659E   0010
        MOVR    R2,     R7                      ; 659F   0097

        DECLE   $0020,  $0057,  $0052,  $0000   ; 65A0   0020 0057 0052 0000
        DECLE   $0000                           ; 65A4   0000

        INCR    R1                              ; 65A5   0009
        DECR    R0                              ; 65A6   0010
        MOVR    R0,     R7                      ; 65A7   0087

        DECLE   $0020,  $0047,  $0052,  $0000   ; 65A8   0020 0047 0052 0000
        DECLE   $0000                           ; 65AC   0000

        COMR    R1                              ; 65AD   0019
        DECR    R0                              ; 65AE   0010
        MOVR    R2,     R7                      ; 65AF   0097

        DECLE   $0020,  $0057,  $0052,  $0000   ; 65B0   0020 0057 0052 0000
        DECLE   $0000                           ; 65B4   0000

        INCR    R1                              ; 65B5   0009
        DECR    R0                              ; 65B6   0010
        MOVR    R0,     R7                      ; 65B7   0087

        DECLE   $0020,  $0047,  $0052,  $0000   ; 65B8   0020 0047 0052 0000
        DECLE   $0000,  $00B7,  $0010,  $0077   ; 65BC   0000 00B7 0010 0077
        DECLE   $0020,  $0037,  $0052,  $0000   ; 65C0   0020 0037 0052 0000
        DECLE   $0000                           ; 65C4   0000

        INCR    R1                              ; 65C5   0009
        DECR    R0                              ; 65C6   0010
        MOVR    R0,     R7                      ; 65C7   0087

        DECLE   $0020,  $0047,  $0052,  $0000   ; 65C8   0020 0047 0052 0000
        DECLE   $0000,  $00B7,  $0010,  $0077   ; 65CC   0000 00B7 0010 0077
        DECLE   $0020,  $0037,  $0052,  $0000   ; 65D0   0020 0037 0052 0000
        DECLE   $0000,  $00A7,  $0010,  $0067   ; 65D4   0000 00A7 0010 0067
        DECLE   $0020,  $0027,  $0052,  $0000   ; 65D8   0020 0027 0052 0000
        DECLE   $0000,  $00B7,  $0010,  $0077   ; 65DC   0000 00B7 0010 0077
        DECLE   $0020,  $0037,  $00A2,  $0000   ; 65E0   0020 0037 00A2 0000
        DECLE   $0000,  $0079,  $0010,  $00B7   ; 65E4   0000 0079 0010 00B7
        DECLE   $0020,  $00B7,  $00A2,  $0000   ; 65E8   0020 00B7 00A2 0000
        DECLE   $0007,  $0000,  $005B,  $00D3   ; 65EC   0007 0000 005B 00D3
        DECLE   $00FC,  $0000                   ; 65F0   00FC 0000

        RSWD    R1                              ; 65F2   0039
        DECR    R0                              ; 65F3   0010
        MOVR    R4,     R7                      ; 65F4   00A7

        DECLE   $0062,  $0000,  $0000,  $0049   ; 65F5   0062 0000 0000 0049
        DECLE   $0062,  $0000,  $0000,  $0059   ; 65F9   0062 0000 0000 0059
        DECLE   $0062,  $0000,  $0000           ; 65FD   0062 0000 0000

        SAR     R1,     1                       ; 6600   0069
        DECR    R0                              ; 6601   0010
        MOVR    R2,     R7                      ; 6602   0097

        DECLE   $00C2,  $0000,  $0000,  $0079   ; 6603   00C2 0000 0000 0079
        DECLE   $0062,  $0000,  $0000           ; 6607   0062 0000 0000

        TSTR    R1                              ; 660A   0089
        DECR    R0                              ; 660B   0010
        MOVR    R0,     R7                      ; 660C   0087

        DECLE   $00C2,  $0000,  $0000,  $0099   ; 660D   00C2 0000 0000 0099
        DECLE   $0062,  $0000,  $0010,  $0077   ; 6611   0062 0000 0010 0077
        DECLE   $00C2,  $0000,  $0000,  $0059   ; 6615   00C2 0000 0000 0059
        DECLE   $0062,  $0000,  $0000,  $0099   ; 6619   0062 0000 0000 0099
        DECLE   $0010,  $0067,  $00C2,  $0000   ; 661D   0010 0067 00C2 0000
        DECLE   $0011,  $0000,  $0062,  $0000   ; 6621   0011 0000 0062 0000
        DECLE   $0010,  $0057,  $0062,  $0000   ; 6625   0010 0057 0062 0000
        DECLE   $0001,  $0000,  $0062,  $0000   ; 6629   0001 0000 0062 0000
        DECLE   $0000,  $00A9,  $0010,  $00A5   ; 662D   0000 00A9 0010 00A5
        DECLE   $00C2,  $0000,  $0007,  $0000   ; 6631   00C2 0000 0007 0000
        DECLE   $002B,  $00D3,  $00FC,  $0000   ; 6635   002B 00D3 00FC 0000
        DECLE   $0089,  $0099,  $0004,  $0003   ; 6639   0089 0099 0004 0003
        DECLE   $0000,  $0012,  $0000,  $0011   ; 663D   0000 0012 0000 0011
        DECLE   $0000,  $0012,  $0000,  $0000   ; 6641   0000 0012 0000 0000
        DECLE   $0099,  $0099,  $0004,  $0003   ; 6645   0099 0099 0004 0003
        DECLE   $0000,  $0012,  $0000,  $0011   ; 6649   0000 0012 0000 0011
        DECLE   $0000,  $0012,  $0000,  $0000   ; 664D   0000 0012 0000 0000
        DECLE   $00A9,  $0099,  $0004,  $0003   ; 6651   00A9 0099 0004 0003
        DECLE   $0000,  $0012,  $0000,  $0011   ; 6655   0000 0012 0000 0011
        DECLE   $0000,  $0012,  $0000,  $0000   ; 6659   0000 0012 0000 0000
        DECLE   $00B9,  $0099,  $0004,  $0003   ; 665D   00B9 0099 0004 0003
        DECLE   $0000,  $0012,  $0000,  $0011   ; 6661   0000 0012 0000 0011
        DECLE   $0000,  $0012,  $0000,  $0000   ; 6665   0000 0012 0000 0000
        DECLE   $00A9,  $0099,  $0004,  $0003   ; 6669   00A9 0099 0004 0003
        DECLE   $0000,  $0022,  $0000,  $0007   ; 666D   0000 0022 0000 0007
        DECLE   $0000,  $0039,  $00D3,  $00FE   ; 6671   0000 0039 00D3 00FE
        DECLE   $0000,  $0055,  $0012,  $0000   ; 6675   0000 0055 0012 0000
        DECLE   $0000,  $0045,  $0012,  $0000   ; 6679   0000 0045 0012 0000
        DECLE   $0000,  $0055,  $0012,  $0000   ; 667D   0000 0055 0012 0000
        DECLE   $0000,  $0045,  $0012,  $0000   ; 6681   0000 0045 0012 0000
        DECLE   $0000,  $003B,  $0012,  $0000   ; 6685   0000 003B 0012 0000
        DECLE   $0000,  $002B,  $0012,  $0000   ; 6689   0000 002B 0012 0000
        DECLE   $0000,  $003B,  $0012,  $0000   ; 668D   0000 003B 0012 0000
        DECLE   $0000,  $0009,  $0012,  $0000   ; 6691   0000 0009 0012 0000
        DECLE   $0000,  $00B9,  $0012,  $0000   ; 6695   0000 00B9 0012 0000
        DECLE   $0000,  $0009,  $0012,  $0000   ; 6699   0000 0009 0012 0000
        DECLE   $0000,  $00B9,  $0012,  $0000   ; 669D   0000 00B9 0012 0000
        DECLE   $0000,  $002B,  $0012,  $0000   ; 66A1   0000 002B 0012 0000
        DECLE   $0000,  $001B,  $0012,  $0000   ; 66A5   0000 001B 0012 0000
        DECLE   $0000,  $002B,  $0012,  $0000   ; 66A9   0000 002B 0012 0000
        DECLE   $0000,  $001B,  $0012,  $0000   ; 66AD   0000 001B 0012 0000
        DECLE   $0000,  $003B,  $0012,  $0000   ; 66B1   0000 003B 0012 0000
        DECLE   $0000,  $002B,  $0012,  $0000   ; 66B5   0000 002B 0012 0000
        DECLE   $0000,  $003B,  $0022,  $0000   ; 66B9   0000 003B 0022 0000
        DECLE   $0007,  $0000,  $004D,  $00D3   ; 66BD   0007 0000 004D 00D3
        DECLE   $00FA,  $0000,  $0059,  $0020   ; 66C1   00FA 0000 0059 0020
        DECLE   $0037,  $0042,  $0000,  $0001   ; 66C5   0037 0042 0000 0001
        DECLE   $0000,  $0021,  $0000,  $0042   ; 66C9   0000 0021 0000 0042
        DECLE   $0000,  $0000,  $0059,  $0020   ; 66CD   0000 0000 0059 0020
        DECLE   $0055,  $0002,  $0001,  $0000   ; 66D1   0055 0002 0001 0000
        DECLE   $0029,  $0042,  $0000,  $0001   ; 66D5   0029 0042 0000 0001
        DECLE   $0000,  $0021,  $0000,  $0042   ; 66D9   0000 0021 0000 0042
        DECLE   $0000,  $0000,  $0039,  $0020   ; 66DD   0000 0000 0039 0020
        DECLE   $0037,  $0042,  $0000,  $0001   ; 66E1   0037 0042 0000 0001
        DECLE   $0000,  $0021,  $0000,  $0042   ; 66E5   0000 0021 0000 0042
        DECLE   $0000,  $0000,  $0059,  $0020   ; 66E9   0000 0000 0059 0020
        DECLE   $0055,  $0042,  $0000,  $0001   ; 66ED   0055 0042 0000 0001
        DECLE   $0000,  $0042,  $0000,  $0000   ; 66F1   0000 0042 0000 0000
        DECLE   $0079,  $0042,  $0000,  $0001   ; 66F5   0079 0042 0000 0001
        DECLE   $0000,  $0042,  $0000,  $0000   ; 66F9   0000 0042 0000 0000
        DECLE   $0099,  $0042,  $0000,  $0001   ; 66FD   0099 0042 0000 0001
        DECLE   $0000,  $0021,  $0000,  $0042   ; 6701   0000 0021 0000 0042
        DECLE   $0000,  $0000,  $00A9,  $0020   ; 6705   0000 0000 00A9 0020
        DECLE   $0037,  $0042,  $0000,  $0001   ; 6709   0037 0042 0000 0001
        DECLE   $0000,  $0021,  $0000,  $0042   ; 670D   0000 0021 0000 0042
        DECLE   $0000,  $0000,  $000B,  $0020   ; 6711   0000 0000 000B 0020
        DECLE   $0055,  $0042,  $0000,  $0001   ; 6715   0055 0042 0000 0001
        DECLE   $0000,  $0042,  $0000,  $0000   ; 6719   0000 0042 0000 0000
        DECLE   $003B,  $0042,  $0000,  $0001   ; 671D   003B 0042 0000 0001
        DECLE   $0000,  $0042,  $0000,  $0000   ; 6721   0000 0042 0000 0000
        DECLE   $003B,  $0042,  $0000,  $0001   ; 6725   003B 0042 0000 0001
        DECLE   $0000,  $00C2,  $0000,  $0021   ; 6729   0000 00C2 0000 0021
        DECLE   $0000,  $0042,  $0000,  $0020   ; 672D   0000 0042 0000 0020
        DECLE   $0055,  $0042,  $0000,  $0021   ; 6731   0055 0042 0000 0021
        DECLE   $0000,  $0042,  $0000,  $0020   ; 6735   0000 0042 0000 0020
        DECLE   $0055,  $0042,  $0000,  $0021   ; 6739   0055 0042 0000 0021
        DECLE   $0000,  $0042,  $0000,  $0020   ; 673D   0000 0042 0000 0020
        DECLE   $0055,  $0042,  $0000,  $0007   ; 6741   0055 0042 0000 0007
        DECLE   $0000,  $003B,  $00D3,  $00FC   ; 6745   0000 003B 00D3 00FC
        DECLE   $0000,  $0057,  $0042,  $0000   ; 6749   0000 0057 0042 0000
        DECLE   $0001,  $0000,  $0042,  $0000   ; 674D   0001 0000 0042 0000
        DECLE   $0000,  $0027,  $0010,  $00A5   ; 6751   0000 0027 0010 00A5
        DECLE   $0042,  $0000,  $0001,  $0000   ; 6755   0042 0000 0001 0000
        DECLE   $0011,  $0000,  $0042,  $0000   ; 6759   0011 0000 0042 0000
        DECLE   $0000,  $0037,  $0010,  $00A5   ; 675D   0000 0037 0010 00A5
        DECLE   $0042,  $0000,  $0001,  $0000   ; 6761   0042 0000 0001 0000
        DECLE   $0011,  $0000,  $0042,  $0000   ; 6765   0011 0000 0042 0000
        DECLE   $0000,  $0027,  $0010,  $00A5   ; 6769   0000 0027 0010 00A5
        DECLE   $0042,  $0000,  $0001,  $0000   ; 676D   0042 0000 0001 0000
        DECLE   $0011,  $0000,  $0042,  $0000   ; 6771   0011 0000 0042 0000
        DECLE   $0000,  $0067,  $0042,  $0000   ; 6775   0000 0067 0042 0000
        DECLE   $0001,  $0000,  $0042,  $0000   ; 6779   0001 0000 0042 0000
        DECLE   $0000,  $0027,  $0010,  $00A5   ; 677D   0000 0027 0010 00A5
        DECLE   $0042,  $0000,  $0001,  $0000   ; 6781   0042 0000 0001 0000
        DECLE   $0011,  $0000,  $0042,  $0000   ; 6785   0011 0000 0042 0000
        DECLE   $0000,  $0037,  $0010,  $00A5   ; 6789   0000 0037 0010 00A5
        DECLE   $0042,  $0000,  $0001,  $0000   ; 678D   0042 0000 0001 0000
        DECLE   $0011,  $0000,  $0042,  $0000   ; 6791   0011 0000 0042 0000
        DECLE   $0000,  $0027,  $0010,  $00A5   ; 6795   0000 0027 0010 00A5
        DECLE   $0042,  $0000,  $0001,  $0000   ; 6799   0042 0000 0001 0000
        DECLE   $0011,  $0000,  $0042,  $0000   ; 679D   0011 0000 0042 0000
        DECLE   $0000,  $0077,  $0042,  $0000   ; 67A1   0000 0077 0042 0000
        DECLE   $0001,  $0000,  $0042,  $0000   ; 67A5   0001 0000 0042 0000
        DECLE   $0000,  $0027,  $0010,  $00A5   ; 67A9   0000 0027 0010 00A5
        DECLE   $0042,  $0000,  $0001,  $0000   ; 67AD   0042 0000 0001 0000
        DECLE   $0011,  $0000,  $0042,  $0000   ; 67B1   0011 0000 0042 0000
        DECLE   $0000,  $0037,  $0010,  $00A5   ; 67B5   0000 0037 0010 00A5
        DECLE   $0042,  $0000,  $0001,  $0000   ; 67B9   0042 0000 0001 0000
        DECLE   $0011,  $0000,  $0042,  $0000   ; 67BD   0011 0000 0042 0000
        DECLE   $0000,  $0027,  $0010,  $00A5   ; 67C1   0000 0027 0010 00A5
        DECLE   $0042,  $0000,  $0001,  $0000   ; 67C5   0042 0000 0001 0000
        DECLE   $0011,  $0000,  $0082,  $0000   ; 67C9   0011 0000 0082 0000
        DECLE   $0000,  $0057,  $0010,  $00A5   ; 67CD   0000 0057 0010 00A5
        DECLE   $0042,  $0000,  $0001,  $0000   ; 67D1   0042 0000 0001 0000
        DECLE   $0011,  $0000,  $0042,  $0000   ; 67D5   0011 0000 0042 0000
        DECLE   $0000,  $0057,  $0010,  $00A5   ; 67D9   0000 0057 0010 00A5
        DECLE   $0042,  $0000,  $0001,  $0000   ; 67DD   0042 0000 0001 0000
        DECLE   $0011,  $0000,  $0042,  $0000   ; 67E1   0011 0000 0042 0000
        DECLE   $0000,  $0057,  $0010,  $00A5   ; 67E5   0000 0057 0010 00A5
        DECLE   $0042,  $0000,  $0001,  $0000   ; 67E9   0042 0000 0001 0000
        DECLE   $0011,  $0000,  $0042,  $0000   ; 67ED   0011 0000 0042 0000
        DECLE   $0007,  $0000,  $0027,  $00D3   ; 67F1   0007 0000 0027 00D3
        DECLE   $00F8,  $0000,  $0059,  $0010   ; 67F5   00F8 0000 0059 0010
        DECLE   $0029,  $0020,  $00A5,  $004C   ; 67F9   0029 0020 00A5 004C
        DECLE   $0000,  $0001,  $0000,  $0011   ; 67FD   0000 0001 0000 0011
        DECLE   $0000,  $0021,  $0000,  $004C   ; 6801   0000 0021 0000 004C
        DECLE   $0000,  $0000,  $0059,  $004C   ; 6805   0000 0000 0059 004C
        DECLE   $0000,  $0001,  $0000,  $004C   ; 6809   0000 0001 0000 004C
        DECLE   $0000,  $0000,  $0059,  $0010   ; 680D   0000 0000 0059 0010
        DECLE   $0029,  $0020,  $00A5,  $004C   ; 6811   0029 0020 00A5 004C
        DECLE   $0000,  $0011,  $0000,  $0021   ; 6815   0000 0011 0000 0021
        DECLE   $0000,  $004C,  $0000,  $0001   ; 6819   0000 004C 0000 0001
        DECLE   $0000,  $008C,  $0000,  $0000   ; 681D   0000 008C 0000 0000
        DECLE   $0059,  $0010,  $0029,  $0020   ; 6821   0059 0010 0029 0020
        DECLE   $0095,  $004C,  $0000,  $0001   ; 6825   0095 004C 0000 0001
        DECLE   $0000,  $0011,  $0000,  $0021   ; 6829   0000 0011 0000 0021
        DECLE   $0000,  $004C,  $0000,  $0000   ; 682D   0000 004C 0000 0000
        DECLE   $0059,  $004C,  $0000,  $0001   ; 6831   0059 004C 0000 0001
        DECLE   $0000,  $004C,  $0000,  $0000   ; 6835   0000 004C 0000 0000
        DECLE   $0059,  $0020,  $0095,  $004C   ; 6839   0059 0020 0095 004C
        DECLE   $0000,  $0001,  $0000,  $0021   ; 683D   0000 0001 0000 0021
        DECLE   $0000,  $004C,  $0000,  $0000   ; 6841   0000 004C 0000 0000
        DECLE   $0059,  $004C,  $0000,  $0001   ; 6845   0059 004C 0000 0001
        DECLE   $0000,  $004C,  $0000,  $0000   ; 6849   0000 004C 0000 0000
        DECLE   $0059,  $0010,  $0029,  $0020   ; 684D   0059 0010 0029 0020
        DECLE   $0085,  $004C,  $0000,  $0001   ; 6851   0085 004C 0000 0001
        DECLE   $0000,  $0011,  $0000,  $0021   ; 6855   0000 0011 0000 0021
        DECLE   $0000,  $004C,  $0000,  $0000   ; 6859   0000 004C 0000 0000
        DECLE   $0059,  $004C,  $0000,  $0001   ; 685D   0059 004C 0000 0001
        DECLE   $0000,  $004C,  $0000,  $0000   ; 6861   0000 004C 0000 0000
        DECLE   $0059,  $0010,  $0029,  $0020   ; 6865   0059 0010 0029 0020
        DECLE   $0085,  $004C,  $0000,  $0011   ; 6869   0085 004C 0000 0011
        DECLE   $0000,  $0021,  $0000,  $004C   ; 686D   0000 0021 0000 004C
        DECLE   $0000,  $0001,  $0000,  $0082   ; 6871   0000 0001 0000 0082
        DECLE   $0000,  $0000,  $0059,  $0010   ; 6875   0000 0000 0059 0010
        DECLE   $0029,  $0020,  $0075,  $004C   ; 6879   0029 0020 0075 004C
        DECLE   $0000,  $0001,  $0000,  $0011   ; 687D   0000 0001 0000 0011
        DECLE   $0000,  $0021,  $0000,  $004C   ; 6881   0000 0021 0000 004C
        DECLE   $0000,  $0000,  $0059,  $004C   ; 6885   0000 0000 0059 004C
        DECLE   $0000,  $0001,  $0000,  $004C   ; 6889   0000 0001 0000 004C
        DECLE   $0000,  $0000,  $0059,  $0020   ; 688D   0000 0000 0059 0020
        DECLE   $0075,  $004C,  $0000,  $0001   ; 6891   0075 004C 0000 0001
        DECLE   $0000,  $0021,  $0000,  $004C   ; 6895   0000 0021 0000 004C
        DECLE   $0000,  $0000,  $0029,  $004C   ; 6899   0000 0000 0029 004C
        DECLE   $0000,  $0001,  $0000,  $004C   ; 689D   0000 0001 0000 004C
        DECLE   $0000,  $0000,  $0039,  $0010   ; 68A1   0000 0000 0039 0010
        DECLE   $0009,  $0020,  $0065,  $004C   ; 68A5   0009 0020 0065 004C
        DECLE   $0000,  $0011,  $0000,  $0021   ; 68A9   0000 0011 0000 0021
        DECLE   $0000,  $004C,  $0000,  $0001   ; 68AD   0000 004C 0000 0001
        DECLE   $0000,  $0082,  $0000,  $0000   ; 68B1   0000 0082 0000 0000
        DECLE   $0039,  $0010,  $0009,  $0020   ; 68B5   0039 0010 0009 0020
        DECLE   $0065,  $004C,  $0000,  $0011   ; 68B9   0065 004C 0000 0011
        DECLE   $0000,  $0021,  $0000,  $004C   ; 68BD   0000 0021 0000 004C
        DECLE   $0000,  $0001,  $0000,  $0082   ; 68C1   0000 0001 0000 0082
        DECLE   $0000,  $0000,  $0039,  $0010   ; 68C5   0000 0000 0039 0010
        DECLE   $0009,  $0020,  $0065,  $004C   ; 68C9   0009 0020 0065 004C
        DECLE   $0000,  $0001,  $0000,  $0011   ; 68CD   0000 0001 0000 0011
        DECLE   $0000,  $0021,  $0000,  $004C   ; 68D1   0000 0021 0000 004C
        DECLE   $0000,  $0000,  $0029,  $004C   ; 68D5   0000 0000 0029 004C
        DECLE   $0000,  $0001,  $0000,  $004C   ; 68D9   0000 0001 0000 004C
        DECLE   $0000,  $0000,  $0039,  $0020   ; 68DD   0000 0000 0039 0020
        DECLE   $0065,  $004C,  $0000,  $0001   ; 68E1   0065 004C 0000 0001
        DECLE   $0000,  $0021,  $0000,  $004C   ; 68E5   0000 0021 0000 004C
        DECLE   $0000,  $0000,  $0059,  $004C   ; 68E9   0000 0000 0059 004C
        DECLE   $0000,  $0001,  $0000,  $004C   ; 68ED   0000 0001 0000 004C
        DECLE   $0000,  $0000,  $0039,  $0010   ; 68F1   0000 0000 0039 0010
        DECLE   $0009,  $0020,  $0055,  $004C   ; 68F5   0009 0020 0055 004C
        DECLE   $0000,  $0011,  $0000,  $0021   ; 68F9   0000 0011 0000 0021
        DECLE   $0000,  $004C,  $0000,  $0001   ; 68FD   0000 004C 0000 0001
        DECLE   $0000,  $0082,  $0000,  $0000   ; 6901   0000 0082 0000 0000
        DECLE   $0039,  $0010,  $0009,  $0020   ; 6905   0039 0010 0009 0020
        DECLE   $0055,  $004C,  $0000,  $0011   ; 6909   0055 004C 0000 0011
        DECLE   $0000,  $0021,  $0000,  $004C   ; 690D   0000 0021 0000 004C
        DECLE   $0000,  $0001,  $0000,  $0082   ; 6911   0000 0001 0000 0082
        DECLE   $0000,  $0000,  $0039,  $0010   ; 6915   0000 0000 0039 0010
        DECLE   $0009,  $0020,  $0075,  $004C   ; 6919   0009 0020 0075 004C
        DECLE   $0000,  $0001,  $0000,  $0011   ; 691D   0000 0001 0000 0011
        DECLE   $0000,  $0021,  $0000,  $004C   ; 6921   0000 0021 0000 004C
        DECLE   $0000,  $0000,  $0029,  $004C   ; 6925   0000 0000 0029 004C
        DECLE   $0000,  $0001,  $0000,  $004C   ; 6929   0000 0001 0000 004C
        DECLE   $0000,  $0000,  $0039,  $0010   ; 692D   0000 0000 0039 0010
        DECLE   $0009,  $0020,  $0095,  $004C   ; 6931   0009 0020 0095 004C
        DECLE   $0000,  $0001,  $0000,  $0011   ; 6935   0000 0001 0000 0011
        DECLE   $0000,  $0021,  $0000,  $004C   ; 6939   0000 0021 0000 004C
        DECLE   $0000,  $0000,  $0049,  $004C   ; 693D   0000 0000 0049 004C
        DECLE   $0000,  $0001,  $0000,  $004C   ; 6941   0000 0001 0000 004C
        DECLE   $0000,  $00E6,  $002A,  $0007   ; 6945   0000 00E6 002A 0007
        DECLE   $0000                           ; 6949   0000
L_694A:
        PSHR    R4                              ; 694A   0274
        CLRR    R0                              ; 694B   01C0
        MVO     R0,     G_019E                  ; 694C   0240 019E
        MVI@    R5,     R0                      ; 694E   02A8
        PSHR    R5                              ; 694F   0275
        MOVR    R0,     R1                      ; 6950   0081
        SLR     R1,     2                       ; 6951   0065
        SLR     R1,     1                       ; 6952   0061
        ANDI    #$0007, R0                      ; 6953   03B8 0007
        MVII    #$019A, R4                      ; 6955   02BC 019A
L_6957:
        MVI@    R4,     R2                      ; 6957   02A2
        MOVR    R2,     R3                      ; 6958   0093
        SLR     R3,     2                       ; 6959   0067
        SLR     R3,     1                       ; 695A   0063
        ANDR    R0,     R2                      ; 695B   0182
        BEQ     L_6964                          ; 695C   0204 0006

        CMP     G_019E, R3                      ; 695E   0343 019E
        BLE     L_6964                          ; 6960   0206 0002

        MVO     R3,     G_019E                  ; 6962   0243 019E
L_6964:
        CMPI    #$019D, R4                      ; 6964   037C 019D
        BLT     L_6957                          ; 6966   0225 0010

        CMP     G_019E, R1                      ; 6968   0341 019E
        BLT     L_698F                          ; 696A   0205 0023
        BGT     L_6971                          ; 696C   020E 0003

        RRC     R1,     1                       ; 696E   0071
        BNC     L_698F                          ; 696F   0209 001E

L_6971:
        MVII    #$019A, R4                      ; 6971   02BC 019A
        CLRR    R1                              ; 6973   01C9
L_6974:
        MVI@    R4,     R2                      ; 6974   02A2
        MOVR    R0,     R5                      ; 6975   0085
        ANDR    R2,     R5                      ; 6976   0195
        BEQ     L_697C                          ; 6977   0204 0003

        JSR     R5,     L_69A7                  ; 6979   0004 0168 01A7

L_697C:
        INCR    R1                              ; 697C   0009
        CMPI    #$019D, R4                      ; 697D   037C 019D
        BLT     L_6974                          ; 697F   0225 000C

        MVII    #$019A, R4                      ; 6981   02BC 019A
        MVI@    R4,     R2                      ; 6983   02A2
        TSTR    R2                              ; 6984   0092
        BEQ     L_6993                          ; 6985   0204 000C

        MVI@    R4,     R2                      ; 6987   02A2
        TSTR    R2                              ; 6988   0092
        BEQ     L_6993                          ; 6989   0204 0008

        MVI@    R4,     R2                      ; 698B   02A2
        TSTR    R2                              ; 698C   0092
        BEQ     L_6993                          ; 698D   0204 0004

L_698F:
        CLRR    R0                              ; 698F   01C0
        COMR    R0                              ; 6990   0018
        DECR    R6                              ; 6991   0016
        PULR    R7                              ; 6992   02B7

L_6993:
        DECR    R4                              ; 6993   0014
        PULR    R5                              ; 6994   02B5
        DECR    R5                              ; 6995   0015
        MVI@    R5,     R0                      ; 6996   02A8
        MVO@    R0,     R4                      ; 6997   0260
        DECR    R4                              ; 6998   0014
        SUBI    #$019A, R4                      ; 6999   033C 019A
        MOVR    R4,     R0                      ; 699B   00A0
        MOVR    R4,     R3                      ; 699C   00A3
        SLL     R3,     1                       ; 699D   004B
        ADDR    R3,     R4                      ; 699E   00DC
        ADDI    #$0189, R4                      ; 699F   02FC 0189
        INCR    R4                              ; 69A1   000C
        MOVR    R5,     R1                      ; 69A2   00A9
        MVO@    R1,     R4                      ; 69A3   0261
        SWAP    R1,     1                       ; 69A4   0041
        MVO@    R1,     R4                      ; 69A5   0261
        PULR    R7                              ; 69A6   02B7

L_69A7:
        PSHR    R5                              ; 69A7   0275
        PSHR    R1                              ; 69A8   0271
        ADDI    #$019A, R1                      ; 69A9   02F9 019A
        PSHR    R1                              ; 69AB   0271
        MVI@    R1,     R2                      ; 69AC   028A
        ANDI    #$0007, R2                      ; 69AD   03BA 0007
        MOVR    R2,     R5                      ; 69AF   0095
        SLL     R2,     2                       ; 69B0   004E
        SLL     R2,     1                       ; 69B1   004A
        XORR    R5,     R2                      ; 69B2   01EA
        MOVR    R2,     R5                      ; 69B3   0095
        MVI     .PSG0.chan_enable,R3            ; 69B4   0283 01F8
        COMR    R5                              ; 69B6   001D
        ANDR    R5,     R3                      ; 69B7   01AB
        XORR    R2,     R3                      ; 69B8   01D3
        MVO     R3,     .PSG0.chan_enable       ; 69B9   0243 01F8
        CLRR    R1                              ; 69BB   01C9
        MVII    #$01FB, R3                      ; 69BC   02BB 01FB
        RRC     R2,     1                       ; 69BE   0072
        BNC     L_69C2                          ; 69BF   0209 0001

        MVO@    R1,     R3                      ; 69C1   0259
L_69C2:
        INCR    R3                              ; 69C2   000B
        RRC     R2,     1                       ; 69C3   0072
        BNC     L_69C7                          ; 69C4   0209 0001

        MVO@    R1,     R3                      ; 69C6   0259
L_69C7:
        INCR    R3                              ; 69C7   000B
        RRC     R2,     1                       ; 69C8   0072
        BNC     L_69CC                          ; 69C9   0209 0001

        MVO@    R1,     R3                      ; 69CB   0259
L_69CC:
        PULR    R5                              ; 69CC   02B5
        MVO@    R1,     R5                      ; 69CD   0269
        PULR    R5                              ; 69CE   02B5
        MOVR    R5,     R3                      ; 69CF   00AB
        SLL     R3,     1                       ; 69D0   004B
        ADDR    R3,     R5                      ; 69D1   00DD
        ADDI    #$0189, R5                      ; 69D2   02FD 0189
        MVO@    R1,     R5                      ; 69D4   0269
        MVO@    R1,     R5                      ; 69D5   0269
        MVO@    R1,     R5                      ; 69D6   0269
        PULR    R7                              ; 69D7   02B7

L_69D8:
        PSHR    R5                              ; 69D8   0275
        MVII    #$00FF, R0                      ; 69D9   02B8 00FF
        MVO     R0,     G_019D                  ; 69DB   0240 019D
        MVII    #$0189, R4                      ; 69DD   02BC 0189
L_69DF:
        CMPI    #$0190, R4                      ; 69DF   037C 0190
        BLT     L_69E4                          ; 69E1   0205 0001
        PULR    R7                              ; 69E3   02B7

L_69E4:
        MVI     G_019D, R0                      ; 69E4   0280 019D
        INCR    R0                              ; 69E6   0008
        MVO     R0,     G_019D                  ; 69E7   0240 019D
        MVI@    R4,     R0                      ; 69E9   02A0
        DECR    R0                              ; 69EA   0010
        BLE     L_69F3                          ; 69EB   0206 0006

        DECR    R4                              ; 69ED   0014
        MVO@    R0,     R4                      ; 69EE   0260
        ADDI    #$0002, R4                      ; 69EF   02FC 0002
        B       L_69DF                          ; 69F1   0220 0013

L_69F3:
        SDBD                                    ; 69F3   0001
        MVI@    R4,     R5                      ; 69F4   02A5
        TSTR    R5                              ; 69F5   00AD
        BEQ     L_69DF                          ; 69F6   0224 0018

L_69F8:
        SDBD                                    ; 69F8   0001
        DECLE   $02A9,  $008B,  $0065,  $0065   ; 69F9   02A9 008B 0065 0065
        DECLE   $008A,  $03BB,  $000F,  $0001   ; 69FD   008A 03BB 000F 0001

        ADDI    #$000A, R3                      ; 6A01   02FB 000A
        SAR     R2,     1                       ; 6A03   006A
        MVI@    R3,     R3                      ; 6A04   029B
        SDBD                                    ; 6A05   0001
        ADDI    #$6A17, R3                      ; 6A06   02FB 0017 006A
        MOVR    R3,     R7                      ; 6A09   009F

        DECLE   $0000                           ; 6A0A   0000

        ADCR    R4                              ; 6A0B   002C
        RSWD    R5                              ; 6A0C   003D
        SWAP    R2,     2                       ; 6A0D   0046
        SLLC    R2,     2                       ; 6A0E   005E
        SARC    R0,     1                       ; 6A0F   0078
        MOVR    R0,     R6                      ; 6A10   0086
        MOVR    R2,     R1                      ; 6A11   0091
        MOVR    R3,     R0                      ; 6A12   0098
        MOVR    R3,     R0                      ; 6A13   0098
        MOVR    R7,     R0                      ; 6A14   00B8
        ADDR    R1,     R0                      ; 6A15   00C8
        GSWD    R2                              ; 6A16   0032
        ANDI    #$0003, R2                      ; 6A17   03BA 0003
        MOVR    R2,     R3                      ; 6A19   0093
        ADDI    #$01FB, R2                      ; 6A1A   02FA 01FB
        SLR     R1,     2                       ; 6A1C   0065
        MOVR    R1,     R0                      ; 6A1D   0088
        ANDI    #$0007, R0                      ; 6A1E   03B8 0007
        ADDI    #$0007, R0                      ; 6A20   02F8 0007
        MVO@    R0,     R2                      ; 6A22   0250
        SLR     R1,     2                       ; 6A23   0065
        SLR     R1,     1                       ; 6A24   0061
        MOVR    R1,     R0                      ; 6A25   0088
        ANDI    #$0007, R0                      ; 6A26   03B8 0007
        SLR     R1,     2                       ; 6A28   0065
        SLR     R1,     1                       ; 6A29   0061
        SLL     R1,     1                       ; 6A2A   0049
        MOVR    R4,     R2                      ; 6A2B   00A2
        MOVR    R1,     R4                      ; 6A2C   008C
        SDBD                                    ; 6A2D   0001
        ADDI    #$6ADF, R4                      ; 6A2E   02FC 00DF 006A
        SDBD                                    ; 6A31   0001
        MVI@    R4,     R1                      ; 6A32   02A1
        MOVR    R2,     R4                      ; 6A33   0094
L_6A34:
        DECR    R0                              ; 6A34   0010
        BLT     L_6A3A                          ; 6A35   0205 0003

        SLR     R1,     1                       ; 6A37   0061
        B       L_6A34                          ; 6A38   0220 0005

L_6A3A:
        ADDI    #$01F0, R3                      ; 6A3A   02FB 01F0
        MVO@    R1,     R3                      ; 6A3C   0259
        SWAP    R1,     1                       ; 6A3D   0041
        ADDI    #$0004, R3                      ; 6A3E   02FB 0004
        MVO@    R1,     R3                      ; 6A40   0259
        B       L_69F8                          ; 6A41   0220 004A

        ADDI    #$01FB, R1                      ; 6A43   02F9 01FB
        CLRR    R0                              ; 6A45   01C0
        MVO@    R0,     R1                      ; 6A46   0248
        B       L_69F8                          ; 6A47   0220 0050

        MVI     G_014C, R2                      ; 6A49   0282 014C
        TSTR    R2                              ; 6A4B   0092
        BEQ     L_6A54                          ; 6A4C   0204 0006

        DECR    R1                              ; 6A4E   0011
        CMPI    #$0004, R1                      ; 6A4F   0379 0004
        BLT     L_6A54                          ; 6A51   0205 0001

        DECR    R1                              ; 6A53   0011
L_6A54:
        SUBI    #$0003, R4                      ; 6A54   033C 0003
        MVO@    R1,     R4                      ; 6A56   0261
        MOVR    R5,     R0                      ; 6A57   00A8
        MVO@    R0,     R4                      ; 6A58   0260
        SWAP    R0,     1                       ; 6A59   0040
        MVO@    R0,     R4                      ; 6A5A   0260
        B       L_69DF                          ; 6A5B   0220 007D

        ANDI    #$0007, R2                      ; 6A5D   03BA 0007
        ADDI    #$01F3, R2                      ; 6A5F   02FA 01F3
        SLR     R1,     2                       ; 6A61   0065
        SLR     R1,     1                       ; 6A62   0061
        CLRC                                    ; 6A63   0006
        RRC     R1,     1                       ; 6A64   0071
        BNC     L_6A72                          ; 6A65   0209 000B

        MOVR    R1,     R3                      ; 6A67   008B
        CMPI    #$01F8, R2                      ; 6A68   037A 01F8
        BNEQ    L_6A6F                          ; 6A6A   020C 0003

        AND@    R2,     R1                      ; 6A6C   0391
        B       L_6A72                          ; 6A6D   0200 0003

L_6A6F:
        COMR    R1                              ; 6A6F   0019
        AND@    R2,     R1                      ; 6A70   0391
        XORR    R3,     R1                      ; 6A71   01D9
L_6A72:
        MVO@    R1,     R2                      ; 6A72   0251
        B       L_69F8                          ; 6A73   0220 007C

        MOVR    R2,     R3                      ; 6A75   0093
        SLR     R2,     2                       ; 6A76   0066
        MOVR    R2,     R1                      ; 6A77   0091
        SLR     R1,     2                       ; 6A78   0065
        SLR     R1,     1                       ; 6A79   0061
        ANDI    #$0007, R2                      ; 6A7A   03BA 0007
        ADDI    #$0192, R2                      ; 6A7C   02FA 0192
        ANDI    #$0003, R3                      ; 6A7E   03BB 0003
        BEQ     L_6A8C                          ; 6A80   0204 000A

        CMPI    #$0001, R3                      ; 6A82   037B 0001
        BGT     L_6A89                          ; 6A84   020E 0003

        ADD@    R2,     R1                      ; 6A86   02D1
        B       L_6A8C                          ; 6A87   0200 0003

L_6A89:
        MVI@    R2,     R0                      ; 6A89   0290
        SUBR    R1,     R0                      ; 6A8A   0108
        MOVR    R0,     R1                      ; 6A8B   0081
L_6A8C:
        MVO@    R1,     R2                      ; 6A8C   0251
        B       L_69F8                          ; 6A8D   0220 0096

        SLR     R1,     2                       ; 6A8F   0065
        ANDI    #$0003, R2                      ; 6A90   03BA 0003
        ADDI    #$0192, R2                      ; 6A92   02FA 0192
        MVI@    R2,     R0                      ; 6A94   0290
        DECR    R0                              ; 6A95   0010
        BNEQ    L_6A9B                          ; 6A96   020C 0003

        MVO@    R0,     R2                      ; 6A98   0250
        B       L_69F8                          ; 6A99   0220 00A2

L_6A9B:
        MVO@    R0,     R2                      ; 6A9B   0250
        MOVR    R1,     R2                      ; 6A9C   008A
        SWAP    R2,     1                       ; 6A9D   0042
        RRC     R2,     2                       ; 6A9E   0076
        BNOV    L_6AA5                          ; 6A9F   020A 0004

        SDBD                                    ; 6AA1   0001
        XORI    #$FC00, R1                      ; 6AA2   03F9 0000 00FC
L_6AA5:
        ADDR    R1,     R5                      ; 6AA5   00CD
        B       L_69F8                          ; 6AA6   0220 00AF

        MVI     G_019D, R1                      ; 6AA8   0281 019D

        JSR     R5,     L_69A7                  ; 6AAA   0004 0168 01A7

        B       L_69DF                          ; 6AAD   0220 00CF

        SDBD                                    ; 6AAF   0001
        MVI@    R5,     R0                      ; 6AB0   02A8
        CLRC                                    ; 6AB1   0006
        RRC     R0,     1                       ; 6AB2   0070
        BNC     L_6ABA                          ; 6AB3   0209 0005

        MOVR    R0,     R1                      ; 6AB5   0081
        ADDI    #$01F0, R1                      ; 6AB6   02F9 01F0
        B       L_6AC8                          ; 6AB8   0200 000E

L_6ABA:
        MOVR    R0,     R1                      ; 6ABA   0081
        ANDI    #$000F, R0                      ; 6ABB   03B8 000F
        SLR     R1,     2                       ; 6ABD   0065
        SLR     R1,     2                       ; 6ABE   0065
        ADDI    #$01FB, R1                      ; 6ABF   02F9 01FB
        MVI@    R1,     R3                      ; 6AC1   028B
        ANDI    #$0030, R3                      ; 6AC2   03BB 0030
        XORR    R3,     R0                      ; 6AC4   01D8
        MVO@    R0,     R1                      ; 6AC5   0248
        SUBI    #$000B, R1                      ; 6AC6   0339 000B
L_6AC8:
        MVO@    R2,     R1                      ; 6AC8   024A
        ADDI    #$0004, R1                      ; 6AC9   02F9 0004
        SWAP    R2,     1                       ; 6ACB   0042
        MVO@    R2,     R1                      ; 6ACC   024A
        B       L_69F8                          ; 6ACD   0220 00D6

        SDBD                                    ; 6ACF   0001
        MVI@    R5,     R2                      ; 6AD0   02AA
        MOVR    R1,     R0                      ; 6AD1   0088
        SLR     R0,     2                       ; 6AD2   0064
        MOVR    R5,     R3                      ; 6AD3   00AB
        MOVR    R2,     R5                      ; 6AD4   0095
        SDBD                                    ; 6AD5   0001
        MVI@    R5,     R2                      ; 6AD6   02AA
        MOVR    R3,     R5                      ; 6AD7   009D
        ANDI    #$0003, R1                      ; 6AD8   03B9 0003
        ADDI    #$0192, R1                      ; 6ADA   02F9 0192
        ADD@    R1,     R2                      ; 6ADC   02CA
        B       L_6ABA                          ; 6ADD   0220 0024

        SLLC    R1,     2                       ; 6ADF   005D
        INCR    R5                              ; 6AE0   000D
        MOVR    R3,     R4                      ; 6AE1   009C
        INCR    R4                              ; 6AE2   000C
        ADDR    R4,     R7                      ; 6AE3   00E7

        INCR    R3                              ; 6AE4   000B
        RSWD    R4                              ; 6AE5   003C
        INCR    R3                              ; 6AE6   000B
        TSTR    R3                              ; 6AE7   009B
        INCR    R2                              ; 6AE8   000A
        EIS                                     ; 6AE9   0002
        INCR    R2                              ; 6AEA   000A
        RRC     R3,     1                       ; 6AEB   0073
        INCR    R1                              ; 6AEC   0009
        ADDR    R5,     R3                      ; 6AED   00EB
        INCR    R0                              ; 6AEE   0008
        SAR     R3,     1                       ; 6AEF   006B
        INCR    R0                              ; 6AF0   0008
        ADDR    R6,     R2                      ; 6AF1   00F2
        SETC                                    ; 6AF2   0007
        TSTR    R0                              ; 6AF3   0080
        SETC                                    ; 6AF4   0007
        DECR    R4                              ; 6AF5   0014
        SETC                                    ; 6AF6   0007
L_6AF7:
        PSHR    R5                              ; 6AF7   0275
        J       L_6F2A                          ; 6AF8   0004 036C 032A

L_6AFB:
        MVII    #$0018, R3                      ; 6AFB   02BB 0018
        MVII    #$019F, R5                      ; 6AFD   02BD 019F
L_6AFF:
        MVI@    R3,     R0                      ; 6AFF   0298
        MVO@    R4,     R3                      ; 6B00   025C
        MVO@    R0,     R5                      ; 6B01   0268
        SWAP    R0,     1                       ; 6B02   0040
        RRC     R0,     1                       ; 6B03   0070
        RRC     R1,     1                       ; 6B04   0071
        RRC     R0,     1                       ; 6B05   0070
        RRC     R2,     1                       ; 6B06   0072
        INCR    R3                              ; 6B07   000B
        CMPI    #$0020, R3                      ; 6B08   037B 0020
        BNEQ    L_6AFF                          ; 6B0A   022C 000C

        SWAP    R1,     1                       ; 6B0C   0041
        MVO@    R1,     R5                      ; 6B0D   0269
        SWAP    R2,     1                       ; 6B0E   0042
        MVO@    R2,     R5                      ; 6B0F   026A
        PULR    R7                              ; 6B10   02B7

L_6B11:
        PSHR    R5                              ; 6B11   0275
        MVII    #$01FE, R2                      ; 6B12   02BA 01FE
        MVII    #$01A9, R3                      ; 6B14   02BB 01A9
L_6B16:
        CLRR    R0                              ; 6B16   01C0
        MVO     R0,     G_01B0                  ; 6B17   0240 01B0
        COMR    R0                              ; 6B19   0018
        MVO     R0,     G_01B1                  ; 6B1A   0240 01B1
        PSHR    R2                              ; 6B1C   0272
        PSHR    R3                              ; 6B1D   0273
L_6B1E:
        MVI@    R2,     R0                      ; 6B1E   0290
        TSTR    R0                              ; 6B1F   0080
        BNEQ    L_6B24                          ; 6B20   020C 0002

        MVII    #$00FF, R0                      ; 6B22   02B8 00FF
L_6B24:
        CMP@    R3,     R0                      ; 6B24   0358
        BNEQ    L_6BA7                          ; 6B25   020C 0080

        CMPI    #$005A, R0                      ; 6B27   0378 005A
        BEQ     L_6BBE                          ; 6B29   0204 0093

        CMPI    #$0076, R0                      ; 6B2B   0378 0076
        BEQ     L_6BB3                          ; 6B2D   0204 0084

        CMPI    #$00FF, R0                      ; 6B2F   0378 00FF
        BEQ     L_6B8F                          ; 6B31   0204 005C

        MOVR    R0,     R1                      ; 6B33   0081
        SLL     R1,     2                       ; 6B34   004D
        SLL     R1,     1                       ; 6B35   0049
        SWAP    R1,     1                       ; 6B36   0041
        ANDI    #$0007, R1                      ; 6B37   03B9 0007
        INCR    R1                              ; 6B39   0009
        ADDR    R7,     R1                      ; 6B3A   00F9
        ADD@    R1,     R7                      ; 6B3B   02CF
L_6B3C:
        DECR    R7                              ; 6B3C   0017

        DECR    R3                              ; 6B3D   0013
        INCR    R3                              ; 6B3E   000B
        RLC     R3,     1                       ; 6B3F   0053
        INCR    R7                              ; 6B40   000F

        RLC     R3,     1                       ; 6B41   0053
L_6B42:
        RLC     R3,     1                       ; 6B42   0053
        INCR    R0                              ; 6B43   0008
        CLRR    R1                              ; 6B44   01C9
        B       L_6B55                          ; 6B45   0200 000E

        MVII    #$0001, R1                      ; 6B47   02B9 0001
        B       L_6B55                          ; 6B49   0200 000A

        MVII    #$0002, R1                      ; 6B4B   02B9 0002
        B       L_6B55                          ; 6B4D   0200 0006

        MVII    #$0004, R1                      ; 6B4F   02B9 0004
        B       L_6B55                          ; 6B51   0200 0002

        MVII    #$0007, R1                      ; 6B53   02B9 0007
L_6B55:
        MVO     R1,     G_01B0                  ; 6B55   0241 01B0
        ANDI    #$001F, R0                      ; 6B57   03B8 001F
        CMPI    #$001F, R0                      ; 6B59   0378 001F
        BNEQ    L_6B63                          ; 6B5B   020C 0006

        MVII    #$00FF, R3                      ; 6B5D   02BB 00FF
        MVO     R3,     G_01B1                  ; 6B5F   0243 01B1
        B       L_6B8F                          ; 6B61   0200 002C

L_6B63:
        MVI     G_01AF, R1                      ; 6B63   0281 01AF
        DECLE   $008A,  $0066,  $0066,  $03B9   ; 6B65   008A 0066 0066 03B9
        DECLE   $000F,  $0001                   ; 6B69   000F 0001

        MVII    #$0045, R5                      ; 6B6B   02BD 0045
        SAR     R0,     2                       ; 6B6D   006C
        ADDR    R1,     R5                      ; 6B6E   00CD
        MVII    #$0010, R1                      ; 6B6F   02B9 0010
        CLRR    R3                              ; 6B71   01DB
        CLRR    R4                              ; 6B72   01E4
L_6B73:
        CMP@    R5,     R0                      ; 6B73   0368
        BEQ     L_6B8B                          ; 6B74   0204 0015

        SDBD                                    ; 6B76   0001
        CMPI    #$6C55, R5                      ; 6B77   037D 0055 006C
        BNEQ    L_6B80                          ; 6B7A   020C 0004

        SDBD                                    ; 6B7C   0001
        MVII    #$6C45, R5                      ; 6B7D   02BD 0045 006C
L_6B80:
        INCR    R4                              ; 6B80   000C
        CMPR    R4,     R2                      ; 6B81   0162
        BNEQ    L_6B86                          ; 6B82   020C 0002

        CLRR    R4                              ; 6B84   01E4
        INCR    R3                              ; 6B85   000B
L_6B86:
        DECR    R1                              ; 6B86   0011
        BNEQ    L_6B73                          ; 6B87   022C 0015
        B       L_6BA7                          ; 6B89   0200 001C

L_6B8B:
        MVO     R3,     G_01B1                  ; 6B8B   0243 01B1
        B       L_6B8F                          ; 6B8D   0200 0000

L_6B8F:
        PULR    R5                              ; 6B8F   02B5
        PULR    R2                              ; 6B90   02B2
        MVI@    R2,     R0                      ; 6B91   0290
        TSTR    R0                              ; 6B92   0080
        BNEQ    L_6B97                          ; 6B93   020C 0002

        MVII    #$00FF, R0                      ; 6B95   02B8 00FF
L_6B97:
        MVO@    R0,     R5                      ; 6B97   0268
        MVI     G_01B0, R0                      ; 6B98   0280 01B0
        MVO@    R0,     R5                      ; 6B9A   0268
        MVI     G_01B1, R0                      ; 6B9B   0280 01B1
        MVO@    R0,     R5                      ; 6B9D   0268
        CMPI    #$01FF, R2                      ; 6B9E   037A 01FF
        BEQ     L_6BB2                          ; 6BA0   0204 0010

        MVII    #$01AC, R3                      ; 6BA2   02BB 01AC
        INCR    R2                              ; 6BA4   000A
        B       L_6B16                          ; 6BA5   0220 0090

L_6BA7:
        PULR    R5                              ; 6BA7   02B5
        PSHR    R5                              ; 6BA8   0275
        INCR    R5                              ; 6BA9   000D
        MVI@    R5,     R0                      ; 6BAA   02A8
        MVO     R0,     G_01B0                  ; 6BAB   0240 01B0
        MVI@    R5,     R0                      ; 6BAD   02A8
        MVO     R0,     G_01B1                  ; 6BAE   0240 01B1
        B       L_6B8F                          ; 6BB0   0220 0022
L_6BB2:
        PULR    R7                              ; 6BB2   02B7

L_6BB3:
        PSHR    R3                              ; 6BB3   0273
        SDBD                                    ; 6BB4   0001
        MVII    #$0E10, R3                      ; 6BB5   02BB 0010 000E
        MVII    #$00FF, R4                      ; 6BB8   02BC 00FF
        MVO     R4,     G_01B2                  ; 6BBA   0244 01B2
        B       L_6BC4                          ; 6BBC   0200 0006

L_6BBE:
        PSHR    R3                              ; 6BBE   0273
        MVII    #$0001, R3                      ; 6BBF   02BB 0001
        CLRR    R4                              ; 6BC1   01E4
        MVO     R4,     G_01B2                  ; 6BC2   0244 01B2
L_6BC4:
        MVO     R3,     G_0351                  ; 6BC4   0243 0351
        MVII    #$01FB, R1                      ; 6BC6   02B9 01FB
        CLRR    R5                              ; 6BC8   01ED
L_6BC9:
        MVI@    R1,     R0                      ; 6BC9   0288
        MVO@    R5,     R1                      ; 6BCA   024D
        PSHR    R0                              ; 6BCB   0270
        INCR    R1                              ; 6BCC   0009
        CMPI    #$01FE, R1                      ; 6BCD   0379 01FE
        BNEQ    L_6BC9                          ; 6BCF   022C 0007

        MVI     .ISRVEC.0,R0                    ; 6BD1   0280 0100
        PSHR    R0                              ; 6BD3   0270
        MVI     .ISRVEC.1,R0                    ; 6BD4   0280 0101
        PSHR    R0                              ; 6BD6   0270
        SDBD                                    ; 6BD7   0001
        MVII    #$6C1D, R0                      ; 6BD8   02B8 001D 006C
        MVO     R0,     .ISRVEC.0               ; 6BDB   0240 0100
        SWAP    R0,     1                       ; 6BDD   0040
        MVO     R0,     .ISRVEC.1               ; 6BDE   0240 0101
        MVII    #$00FF, R1                      ; 6BE0   02B9 00FF
L_6BE2:
        EIS                                     ; 6BE2   0002
        MVI@    R2,     R0                      ; 6BE3   0290
        CMPR    R1,     R0                      ; 6BE4   0148
        BNEQ    L_6BE2                          ; 6BE5   022C 0004

L_6BE7:
        EIS                                     ; 6BE7   0002
        MVI@    R2,     R0                      ; 6BE8   0290
        CMPR    R1,     R0                      ; 6BE9   0148
        BEQ     L_6BE7                          ; 6BEA   0224 0004

        SDBD                                    ; 6BEC   0001
        MVII    #$8000, R3                      ; 6BED   02BB 0000 0080
L_6BF0:
        EIS                                     ; 6BF0   0002
        MVI@    R2,     R0                      ; 6BF1   0290
        CMPR    R1,     R0                      ; 6BF2   0148
        BNEQ    L_6BF0                          ; 6BF3   022C 0004

        ADD     G_0351, R0                      ; 6BF5   02C0 0351
        BPL     L_6BF0                          ; 6BF7   0223 0008

        MVI     G_01B2, R0                      ; 6BF9   0280 01B2
        CMPR    R1,     R0                      ; 6BFB   0148
        BEQ     L_6C0B                          ; 6BFC   0204 000D

        CMPR    R1,     R4                      ; 6BFE   014C
        BNEQ    L_6C0B                          ; 6BFF   020C 000A

        MVO     R1,     G_01B2                  ; 6C01   0241 01B2
        SDBD                                    ; 6C03   0001
        MVII    #$0E10, R3                      ; 6C04   02BB 0010 000E
        MVO     R3,     G_0351                  ; 6C07   0243 0351
        B       L_6BE2                          ; 6C09   0220 0028

L_6C0B:
        PULR    R0                              ; 6C0B   02B0
        PULR    R1                              ; 6C0C   02B1
        MVO     R0,     .ISRVEC.1               ; 6C0D   0240 0101
        MVO     R1,     .ISRVEC.0               ; 6C0F   0241 0100
        MVII    #$01FD, R1                      ; 6C11   02B9 01FD
L_6C13:
        PULR    R0                              ; 6C13   02B0
        MVO@    R0,     R1                      ; 6C14   0248
        DECR    R1                              ; 6C15   0011
        CMPI    #$01FA, R1                      ; 6C16   0379 01FA
        BNEQ    L_6C13                          ; 6C18   022C 0006

        PULR    R3                              ; 6C1A   02B3
        B       L_6B1E                          ; 6C1B   0220 00FE

        SDBD                                    ; 6C1D   0001
        CMPI    #$8000, R3                      ; 6C1E   037B 0000 0080
        BEQ     L_6C39                          ; 6C21   0204 0016

        MVI     G_0351, R3                      ; 6C23   0283 0351
        DECR    R3                              ; 6C25   0013
        BMI     L_6C38                          ; 6C26   020B 0010

        MVO     R3,     G_0351                  ; 6C28   0243 0351
        BNEQ    L_6C36                          ; 6C2A   020C 000A

        MVI     .STIC.BORD,R1                   ; 6C2C   0281 002C
        ANDI    #$000F, R1                      ; 6C2E   03B9 000F
        MVO     R1,     G_01B2                  ; 6C30   0241 01B2
        CLRR    R0                              ; 6C32   01C0
        MVO     R0,     .STIC.BORD              ; 6C33   0240 002C
        MOVR    R5,     R7                      ; 6C35   00AF

L_6C36:
        MVO     R0,     .STIC.VIDEN             ; 6C36   0240 0020
L_6C38:
        MOVR    R5,     R7                      ; 6C38   00AF

L_6C39:
        MVO     R3,     G_0351                  ; 6C39   0243 0351
        MVI     G_01B2, R1                      ; 6C3B   0281 01B2
        CMPI    #$00FF, R1                      ; 6C3D   0379 00FF
        BEQ     L_6C36                          ; 6C3F   0224 000A

        MVO     R1,     .STIC.BORD              ; 6C41   0241 002C
        B       L_6C36                          ; 6C43   0220 000E

        COMR    R3                              ; 6C45   001B
        DECR    R3                              ; 6C46   0013
        DIS                                     ; 6C47   0003
        SETC                                    ; 6C48   0007
L_6C49:
        DECR    R7                              ; 6C49   0017

        DECR    R6                              ; 6C4A   0016
        CLRC                                    ; 6C4B   0006
        INCR    R6                              ; 6C4C   000E
        COMR    R6                              ; 6C4D   001E
        COMR    R4                              ; 6C4E   001C
        INCR    R4                              ; 6C4F   000C
        INCR    R5                              ; 6C50   000D
        COMR    R5                              ; 6C51   001D
        COMR    R1                              ; 6C52   0019
        INCR    R1                              ; 6C53   0009
        INCR    R3                              ; 6C54   000B
L_6C55:
        PSHR    R5                              ; 6C55   0275
        MVII    #$01C8, R4                      ; 6C56   02BC 01C8
        MVII    #$0014, R0                      ; 6C58   02B8 0014

        JSR     R5,     L_6CFF                  ; 6C5A   0004 016C 00FF

        MVII    #$0001, R0                      ; 6C5D   02B8 0001
        MVO     R0,     G_01B3                  ; 6C5F   0240 01B3
        MVII    #$01B4, R4                      ; 6C61   02BC 01B4
L_6C63:
        MVI@    R4,     R1                      ; 6C63   02A1
        MVI@    R4,     R2                      ; 6C64   02A2
        TSTR    R1                              ; 6C65   0089
        BEQ     L_6C6F                          ; 6C66   0204 0007

        SUBI    #$0002, R4                      ; 6C68   033C 0002
        DECR    R1                              ; 6C6A   0011
        MVO@    R1,     R4                      ; 6C6B   0261
        BEQ     L_6C83                          ; 6C6C   0204 0015

        INCR    R4                              ; 6C6E   000C
L_6C6F:
        CMPI    #$01C8, R4                      ; 6C6F   037C 01C8
        BNEQ    L_6C63                          ; 6C71   022C 000F

        CLRR    R0                              ; 6C73   01C0
        MVO     R0,     G_01B3                  ; 6C74   0240 01B3
L_6C76:
        MVI@    R4,     R0                      ; 6C76   02A0
        MVI@    R4,     R1                      ; 6C77   02A1
        TSTR    R0                              ; 6C78   0080
        BEQ     L_6C82                          ; 6C79   0204 0007

        PSHR    R4                              ; 6C7B   0274

        JSR     R5,     L_6C96                  ; 6C7C   0004 016C 0096

        PULR    R4                              ; 6C7F   02B4
        B       L_6C76                          ; 6C80   0220 000B
L_6C82:
        PULR    R7                              ; 6C82   02B7

L_6C83:
        INCR    R4                              ; 6C83   000C
        PSHR    R4                              ; 6C84   0274
        SDBD                                    ; 6C85   0001
        MVII    #$7100, R4                      ; 6C86   02BC 0000 0071
        ADDR    R2,     R4                      ; 6C89   00D4
        ADDR    R2,     R4                      ; 6C8A   00D4
        SDBD                                    ; 6C8B   0001
        MVII    #$6C91, R5                      ; 6C8C   02BD 0091 006C
        SDBD                                    ; 6C8F   0001
        MVI@    R4,     R7                      ; 6C90   02A7

        PULR    R4                              ; 6C91   02B4
        B       L_6C6F                          ; 6C92   0220 0024

L_6C94:
        MVI@    R5,     R0                      ; 6C94   02A8
L_6C95:
        MVI@    R5,     R1                      ; 6C95   02A9
L_6C96:
        PSHR    R5                              ; 6C96   0275
        MVII    #$01B4, R4                      ; 6C97   02BC 01B4
        MVII    #$0014, R5                      ; 6C99   02BD 0014
        MVI     G_01B3, R2                      ; 6C9B   0282 01B3
        TSTR    R2                              ; 6C9D   0092
        BEQ     L_6CA4                          ; 6C9E   0204 0004

        MVII    #$01C8, R4                      ; 6CA0   02BC 01C8
        MVII    #$0014, R5                      ; 6CA2   02BD 0014
L_6CA4:
        ADDR    R4,     R5                      ; 6CA4   00E5
        ADDI    #$0014, R5                      ; 6CA5   02FD 0014
L_6CA7:
        MVI@    R4,     R2                      ; 6CA7   02A2
        TSTR    R2                              ; 6CA8   0092
        BEQ     L_6CB2                          ; 6CA9   0204 0007

        INCR    R4                              ; 6CAB   000C
        CMPR    R5,     R4                      ; 6CAC   016C
        BNEQ    L_6CA7                          ; 6CAD   022C 0007

        CLRR    R0                              ; 6CAF   01C0
L_6CB0:
        DECR    R7                              ; 6CB0   0017
        PULR    R7                              ; 6CB1   02B7

L_6CB2:
        DECR    R4                              ; 6CB2   0014
        MVO@    R0,     R4                      ; 6CB3   0260
        MVO@    R1,     R4                      ; 6CB4   0261
        PULR    R7                              ; 6CB5   02B7

L_6CB6:
        MVI@    R5,     R1                      ; 6CB6   02A9
        MVII    #$01B4, R4                      ; 6CB7   02BC 01B4
        CLRR    R0                              ; 6CB9   01C0
L_6CBA:
        INCR    R4                              ; 6CBA   000C
        CMP@    R4,     R1                      ; 6CBB   0361
        BNEQ    L_6CC2                          ; 6CBC   020C 0004

        SUBI    #$0002, R4                      ; 6CBE   033C 0002
        MVO@    R0,     R4                      ; 6CC0   0260
        MVO@    R0,     R4                      ; 6CC1   0260
L_6CC2:
        CMPI    #$01C8, R4                      ; 6CC2   037C 01C8
        BNEQ    L_6CBA                          ; 6CC4   022C 000B
        MOVR    R5,     R7                      ; 6CC6   00AF

L_6CC7:
        MVII    #$01B3, R4                      ; 6CC7   02BC 01B3
        MVII    #$0029, R0                      ; 6CC9   02B8 0029
        J       L_6CFF                          ; 6CCB   0004 036C 00FF

L_6CCE:
        MVII    #$0010, R4                      ; 6CCE   02BC 0010
        CLRR    R3                              ; 6CD0   01DB
L_6CD1:
        ADDR    R3,     R3                      ; 6CD1   00DB
        ADDR    R2,     R2                      ; 6CD2   00D2
        BNC     L_6CD6                          ; 6CD3   0209 0001

        INCR    R3                              ; 6CD5   000B
L_6CD6:
        CLRC                                    ; 6CD6   0006
        INCR    R2                              ; 6CD7   000A
        SUBR    R1,     R3                      ; 6CD8   010B
        BPL     L_6CDE                          ; 6CD9   0203 0003

        ADDR    R1,     R3                      ; 6CDB   00CB
        SAR     R2,     1                       ; 6CDC   006A
        SLL     R2,     1                       ; 6CDD   004A
L_6CDE:
        DECR    R4                              ; 6CDE   0014
        BNEQ    L_6CD1                          ; 6CDF   022C 000F
        MOVR    R5,     R7                      ; 6CE1   00AF

L_6CE2:
        PSHR    R1                              ; 6CE2   0271
        MVI     G_0352, R0                      ; 6CE3   0280 0352
        MOVR    R0,     R1                      ; 6CE5   0081
        SLL     R0,     2                       ; 6CE6   004C
        SLL     R0,     2                       ; 6CE7   004C
        ADDR    R1,     R0                      ; 6CE8   00C8
        ADDI    #$0025, R0                      ; 6CE9   02F8 0025
        MVO     R0,     G_0352                  ; 6CEB   0240 0352
        ANDI    #$00FF, R0                      ; 6CED   03B8 00FF
        PULR    R1                              ; 6CEF   02B1
        MOVR    R5,     R7                      ; 6CF0   00AF

L_6CF1:
        PSHR    R5                              ; 6CF1   0275
        PSHR    R2                              ; 6CF2   0272
        CLRR    R2                              ; 6CF3   01D2
L_6CF4:
        SLL     R2,     1                       ; 6CF4   004A
        INCR    R2                              ; 6CF5   000A
        DECR    R0                              ; 6CF6   0010
        BNEQ    L_6CF4                          ; 6CF7   022C 0004

        JSR     R5,     L_6CE2                  ; 6CF9   0004 016C 00E2

        ANDR    R2,     R0                      ; 6CFC   0190
        PULR    R2                              ; 6CFD   02B2
        PULR    R7                              ; 6CFE   02B7

L_6CFF:
        CLRR    R1                              ; 6CFF   01C9
L_6D00:
        DECR    R0                              ; 6D00   0010
        BMI     L_6D06                          ; 6D01   020B 0003

        MVO@    R1,     R4                      ; 6D03   0261
        B       L_6D00                          ; 6D04   0220 0005
L_6D06:
        MOVR    R5,     R7                      ; 6D06   00AF

L_6D07:
        PSHR    R5                              ; 6D07   0275
        MVI     G_0354, R0                      ; 6D08   0280 0354
        DECR    R0                              ; 6D0A   0010
        BMI     L_6D13                          ; 6D0B   020B 0006

        MVO     R0,     G_0354                  ; 6D0D   0240 0354
        BNEQ    L_6D13                          ; 6D0F   020C 0002
        MVI     G_0353, R7                      ; 6D11   0287 0353
L_6D13:
        PULR    R7                              ; 6D13   02B7

L_6D14:
        MVI@    R5,     R0                      ; 6D14   02A8
L_6D15:
        MVO     R5,     G_0353                  ; 6D15   0245 0353
        MVO     R0,     G_0354                  ; 6D17   0240 0354
        PULR    R7                              ; 6D19   02B7

L_6D1A:
        SDBD                                    ; 6D1A   0001
        MVI@    R5,     R1                      ; 6D1B   02A9
        MVO@    R1,     R4                      ; 6D1C   0261
        DECR    R0                              ; 6D1D   0010
        BNEQ    L_6D1A                          ; 6D1E   022C 0005
        MOVR    R5,     R7                      ; 6D20   00AF

L_6D21:
        MVI@    R5,     R1                      ; 6D21   02A9
        MVO@    R1,     R4                      ; 6D22   0261
        DECR    R0                              ; 6D23   0010
        BNEQ    L_6D21                          ; 6D24   022C 0004
        MOVR    R5,     R7                      ; 6D26   00AF

L_6D27:
        PSHR    R5                              ; 6D27   0275
        MOVR    R1,     R5                      ; 6D28   008D
L_6D29:
        MVI@    R4,     R1                      ; 6D29   02A1
        MVO@    R1,     R5                      ; 6D2A   0269
        DECR    R0                              ; 6D2B   0010
        BNEQ    L_6D29                          ; 6D2C   022C 0004
        PULR    R7                              ; 6D2E   02B7

L_6D2F:
        MVI@    R5,     R0                      ; 6D2F   02A8
        MVO     R0,     G_0355                  ; 6D30   0240 0355
        B       L_6DA6                          ; 6D32   0200 0072

        DECLE   $026A,  $0000,  $026B,  $0008   ; 6D34   026A 0000 026B 0008
        DECLE   $026C,  $0000,  $026D,  $0000   ; 6D38   026C 0000 026D 0000
        DECLE   $026E,  $0000,  $026F,  $0000   ; 6D3C   026E 0000 026F 0000
        DECLE   $0270,  $0000,  $027E,  $0000   ; 6D40   0270 0000 027E 0000
        DECLE   $027F,  $0010,  $0280,  $0018   ; 6D44   027F 0010 0280 0018
        DECLE   $0281,  $0020,  $0282,  $0028   ; 6D48   0281 0020 0282 0028
        DECLE   $0283,  $0030,  $0284,  $0038   ; 6D4C   0283 0030 0284 0038
        DECLE   $0292,  $0000,  $0293,  $0000   ; 6D50   0292 0000 0293 0000
        DECLE   $0294,  $0000,  $0295,  $0000   ; 6D54   0294 0000 0295 0000
        DECLE   $0296,  $0000,  $0297,  $0040   ; 6D58   0296 0000 0297 0040
        DECLE   $0298,  $0000,  $00FF,  $00FF   ; 6D5C   0298 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6D60   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6D64   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6D68   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00F3,  $00FB,  $00FB   ; 6D6C   00FF 00F3 00FB 00FB
        DECLE   $008B,  $0073,  $0073,  $0089   ; 6D70   008B 0073 0073 0089
        DECLE   $00FF,  $00FF,  $00BF,  $00FF   ; 6D74   00FF 00FF 00BF 00FF
        DECLE   $0038,  $00B7,  $00B7,  $0018   ; 6D78   0038 00B7 00B7 0018
        DECLE   $00FF,  $00F0,  $00FF,  $00FF   ; 6D7C   00FF 00F0 00FF 00FF
        DECLE   $00BF,  $0078,  $0077,  $00F7   ; 6D80   00BF 0078 0077 00F7
        DECLE   $0078,  $00FF,  $003F,  $00BF   ; 6D84   0078 00FF 003F 00BF
        DECLE   $00BF,  $00B7,  $0037,  $0036   ; 6D88   00BF 00B7 0037 0036
        DECLE   $00D9,  $00FF,  $00FF,  $00FF   ; 6D8C   00D9 00FF 00FF 00FF
        DECLE   $00FF,  $0071,  $006E,  $006E   ; 6D90   00FF 0071 006E 006E
        DECLE   $0071,  $00FE,  $00FF,  $00FF   ; 6D94   0071 00FE 00FF 00FF
        DECLE   $00FF,  $007F,  $00FF,  $00FF   ; 6D98   00FF 007F 00FF 00FF
        DECLE   $00FF,  $00FF,  $00E1,  $00FF   ; 6D9C   00FF 00FF 00E1 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6DA0   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF                   ; 6DA4   00FF 00FF
L_6DA6:
        PSHR    R5                              ; 6DA6   0275
        DIS                                     ; 6DA7   0003
        MVI     .PSG0.rgt_hand,R0               ; 6DA8   0280 01FE
        CMPI    #$0079, R0                      ; 6DAA   0378 0079
        BNEQ    L_6DB4                          ; 6DAC   020C 0006

        MVI     .PSG0.lft_hand,R0               ; 6DAE   0280 01FF
        CMPI    #$0079, R0                      ; 6DB0   0378 0079
        BEQ     L_6EF4                          ; 6DB2   0204 0140

L_6DB4:
        MVI     .PSG0.rgt_hand,R0               ; 6DB4   0280 01FE
        TSTR    R0                              ; 6DB6   0080
        BNEQ    L_6DE7                          ; 6DB7   020C 002E

        MVII    #$0007, R3                      ; 6DB9   02BB 0007
        MVII    #$0215, R4                      ; 6DBB   02BC 0215

        JSR     R5,     X_PRINT_R5              ; 6DBD   0004 0118 007B
        STRING  "  Programmed by   "            ; 6DC0  
        DECLE   $0000                           ; 6DD2   0000

        MVII    #$022C, R4                      ; 6DD3   02BC 022C

        JSR     R5,     X_PRINT_R5              ; 6DD5   0004 0118 007B
        STRING  "Mark Kennedy"                  ; 6DD8  
        DECLE   $0000                           ; 6DE4   0000

        B       L_6E40                          ; 6DE5   0200 0059

L_6DE7:
        MVII    #$0007, R3                      ; 6DE7   02BB 0007
        MVII    #$0215, R4                      ; 6DE9   02BC 0215

        JSR     R5,     X_PRINT_R5              ; 6DEB   0004 0118 007B
        STRING  " INTV Corporation "            ; 6DEE  
        DECLE   $0000                           ; 6E00   0000

        MVII    #$022E, R4                      ; 6E01   02BC 022E

        JSR     R5,     X_PRINT_R5              ; 6E03   0004 0118 007B
        STRING  "presents"                      ; 6E06  
        DECLE   $0000                           ; 6E0E   0000

        MVII    #$02C9, R4                      ; 6E0F   02BC 02C9

        JSR     R5,     X_PRINT_R5              ; 6E11   0004 0118 007B
        STRING  "Copr [C] 1987 INTV"            ; 6E14  
        DECLE   $0000                           ; 6E26   0000

        MVII    #$02DD, R4                      ; 6E27   02BC 02DD

        JSR     R5,     X_PRINT_R5              ; 6E29   0004 0118 007B
        STRING  "Copr [C] 1981 Namco"           ; 6E2C  
        DECLE   $0000                           ; 6E3F   0000
L_6E40:
        SDBD                                    ; 6E40   0001
        MVII    #$6E7A, R0                      ; 6E41   02B8 007A 006E
        MVO     R0,     .ISRVEC.0               ; 6E44   0240 0100
        SWAP    R0,     1                       ; 6E46   0040
        MVO     R0,     .ISRVEC.1               ; 6E47   0240 0101
        SDBD                                    ; 6E49   0001
        MVII    #$0801, R0                      ; 6E4A   02B8 0001 0008
        MVO     R0,     .BTAB.00                ; 6E4D   0240 0200
        MVII    #$000C, R0                      ; 6E4F   02B8 000C
        MVO     R0,     .BTAB.02                ; 6E51   0240 0202
        MVII    #$0001, R0                      ; 6E53   02B8 0001
        MVO     R0,     .BTAB.03                ; 6E55   0240 0203
        EIS                                     ; 6E57   0002

L_6E58:
        JSR     R5,     L_6CE2                  ; 6E58   0004 016C 00E2

        MVI     .PSG0.rgt_hand,R0               ; 6E5B   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 6E5D   0380 01FF
        CMPI    #$00FF, R0                      ; 6E5F   0378 00FF
        BNEQ    L_6E58                          ; 6E61   022C 000A

L_6E63:
        JSR     R5,     L_6CE2                  ; 6E63   0004 016C 00E2

        MVI     .PSG0.rgt_hand,R0               ; 6E66   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 6E68   0380 01FF
        CMPI    #$00FF, R0                      ; 6E6A   0378 00FF
        BEQ     L_6E63                          ; 6E6C   0224 000A

L_6E6E:
        JSR     R5,     L_6CE2                  ; 6E6E   0004 016C 00E2

        MVI     .PSG0.rgt_hand,R0               ; 6E71   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 6E73   0380 01FF
        CMPI    #$00FF, R0                      ; 6E75   0378 00FF
        BNEQ    L_6E6E                          ; 6E77   022C 000A
        PULR    R7                              ; 6E79   02B7

        PSHR    R5                              ; 6E7A   0275
        CLRR    R0                              ; 6E7B   01C0
        MVII    #$0032, R1                      ; 6E7C   02B9 0032
L_6E7E:
        MVO@    R0,     R1                      ; 6E7E   0248
        DECR    R1                              ; 6E7F   0011
        BPL     L_6E7E                          ; 6E80   0223 0003

        MVI     .STIC.MODE,R0                   ; 6E82   0280 0021
        MVII    #$0002, R0                      ; 6E84   02B8 0002
        MVO     R0,     .STIC.EDGE              ; 6E86   0240 0032
        MVI     .BTAB.02,R0                     ; 6E88   0280 0202
        DECR    R0                              ; 6E8A   0010
        MVO     R0,     .BTAB.02                ; 6E8B   0240 0202
        BNEQ    L_6EBC                          ; 6E8D   020C 002D

        MVII    #$000C, R0                      ; 6E8F   02B8 000C
        MVO     R0,     .BTAB.02                ; 6E91   0240 0202
        MVI     .BTAB.01,R0                     ; 6E93   0280 0201
        COMR    R0                              ; 6E95   0018
        MVO     R0,     .BTAB.01                ; 6E96   0240 0201
        MVI     .BTAB.03,R0                     ; 6E98   0280 0203
        DECR    R0                              ; 6E9A   0010
        MVO     R0,     .BTAB.03                ; 6E9B   0240 0203
        BNEQ    L_6EBC                          ; 6E9D   020C 001D

        MVII    #$0001, R0                      ; 6E9F   02B8 0001
        MVO     R0,     .BTAB.03                ; 6EA1   0240 0203
        MVI     .BTAB.00,R0                     ; 6EA3   0280 0200
        INCR    R0                              ; 6EA5   0008
        MOVR    R0,     R1                      ; 6EA6   0081
        SDBD                                    ; 6EA7   0001
        ANDI    #$1807, R0                      ; 6EA8   03B8 0007 0018
        ANDI    #$0008, R1                      ; 6EAB   03B9 0008
        BEQ     L_6EB3                          ; 6EAD   0204 0004

        SDBD                                    ; 6EAF   0001
        XORI    #$1000, R0                      ; 6EB0   03F8 0000 0010
L_6EB3:
        SDBD                                    ; 6EB3   0001
        CMPI    #$0800, R0                      ; 6EB4   0378 0000 0008
        BNEQ    L_6EBA                          ; 6EB7   020C 0001

        INCR    R0                              ; 6EB9   0008
L_6EBA:
        MVO     R0,     .BTAB.00                ; 6EBA   0240 0200
L_6EBC:
        MVI     .BTAB.01,R3                     ; 6EBC   0283 0201
        SDBD                                    ; 6EBE   0001
        MVII    #$6D5E, R4                      ; 6EBF   02BC 005E 006D
        SDBD                                    ; 6EC2   0001
        MVII    #$3800, R5                      ; 6EC3   02BD 0000 0038
L_6EC6:
        MVI@    R4,     R0                      ; 6EC6   02A0
        XORR    R3,     R0                      ; 6EC7   01D8
        MVO@    R0,     R5                      ; 6EC8   0268
        MVI@    R4,     R0                      ; 6EC9   02A0
        XORR    R3,     R0                      ; 6ECA   01D8
        MVO@    R0,     R5                      ; 6ECB   0268
        MVI@    R4,     R0                      ; 6ECC   02A0
        XORR    R3,     R0                      ; 6ECD   01D8
        MVO@    R0,     R5                      ; 6ECE   0268
        MVI@    R4,     R0                      ; 6ECF   02A0
        XORR    R3,     R0                      ; 6ED0   01D8
        MVO@    R0,     R5                      ; 6ED1   0268
        MVI@    R4,     R0                      ; 6ED2   02A0
        XORR    R3,     R0                      ; 6ED3   01D8
        MVO@    R0,     R5                      ; 6ED4   0268
        MVI@    R4,     R0                      ; 6ED5   02A0
        XORR    R3,     R0                      ; 6ED6   01D8
        MVO@    R0,     R5                      ; 6ED7   0268
        MVI@    R4,     R0                      ; 6ED8   02A0
        XORR    R3,     R0                      ; 6ED9   01D8
        MVO@    R0,     R5                      ; 6EDA   0268
        MVI@    R4,     R0                      ; 6EDB   02A0
        XORR    R3,     R0                      ; 6EDC   01D8
        MVO@    R0,     R5                      ; 6EDD   0268
        SDBD                                    ; 6EDE   0001
        CMPI    #$6DA6, R4                      ; 6EDF   037C 00A6 006D
        BNEQ    L_6EC6                          ; 6EE2   022C 001D

        SDBD                                    ; 6EE4   0001
        MVII    #$6D34, R4                      ; 6EE5   02BC 0034 006D
L_6EE8:
        MVI@    R4,     R1                      ; 6EE8   02A1
        MVI@    R4,     R0                      ; 6EE9   02A0
        XOR     .BTAB.00,R0                     ; 6EEA   03C0 0200
        MVO@    R0,     R1                      ; 6EEC   0248
        SDBD                                    ; 6EED   0001
        CMPI    #$6D5E, R4                      ; 6EEE   037C 005E 006D
        BNEQ    L_6EE8                          ; 6EF1   022C 000A
        PULR    R7                              ; 6EF3   02B7

L_6EF4:
        MVII    #$0026, R0                      ; 6EF4   02B8 0026
        MVO     R0,     .ISRVEC.0               ; 6EF6   0240 0100
        MVII    #$0011, R0                      ; 6EF8   02B8 0011
        MVO     R0,     .ISRVEC.1               ; 6EFA   0240 0101
        SDBD                                    ; 6EFC   0001
        MVII    #$9014, R0                      ; 6EFD   02B8 0014 0090
        MVO     R0,     G_02F0                  ; 6F00   0240 02F0
        MVII    #$02F1, R6                      ; 6F02   02BE 02F1
        J       .EXEC.041                       ; 6F04   0004 0310 0041

        RLC     R0,     1                       ; 6F07   0050
        RRC     R2,     1                       ; 6F08   0072
        SAR     R3,     2                       ; 6F09   006F
        SLR     R3,     2                       ; 6F0A   0067
        RRC     R2,     1                       ; 6F0B   0072
        SLR     R1,     1                       ; 6F0C   0061
        SAR     R1,     2                       ; 6F0D   006D
        SAR     R1,     2                       ; 6F0E   006D
        SLR     R1,     2                       ; 6F0F   0065
        SLR     R0,     2                       ; 6F10   0064
        NEGR    R0                              ; 6F11   0020
        SLR     R2,     1                       ; 6F12   0062
        SARC    R1,     1                       ; 6F13   0079
        NEGR    R0                              ; 6F14   0020
        SLL     R1,     2                       ; 6F15   004D
        SLR     R1,     1                       ; 6F16   0061
        RRC     R2,     1                       ; 6F17   0072
        SAR     R3,     1                       ; 6F18   006B
        NEGR    R0                              ; 6F19   0020
        SLL     R3,     1                       ; 6F1A   004B
        SLR     R1,     2                       ; 6F1B   0065
        SAR     R2,     2                       ; 6F1C   006E
        SAR     R2,     2                       ; 6F1D   006E
        SLR     R1,     2                       ; 6F1E   0065
        SLR     R0,     2                       ; 6F1F   0064
        SARC    R1,     1                       ; 6F20   0079
L_6F21:
        PSHR    R5                              ; 6F21   0275
        MVII    #$0001, R5                      ; 6F22   02BD 0001
        MVO     R5,     G_0317                  ; 6F24   0245 0317

        JSR     R5,     L_5A62                  ; 6F26   0004 0158 0262

        PULR    R7                              ; 6F29   02B7

L_6F2A:
        MVI     G_0317, R5                      ; 6F2A   0285 0317
        DECLE   $0015,  $020B,  $0015,  $0245   ; 6F2C   0015 020B 0015 0245
        DECLE   $0317,  $01C0,  $02BD,  $0018   ; 6F30   0317 01C0 02BD 0018
        DECLE   $0268,  $0268,  $0268,  $0268   ; 6F34   0268 0268 0268 0268
        DECLE   $0268,  $0268,  $0268,  $0268   ; 6F38   0268 0268 0268 0268
        DECLE   $0001,  $02BC,  $00FA,  $0070   ; 6F3C   0001 02BC 00FA 0070
        DECLE   $0004                           ; 6F40   0004

        CMPR    R6,     R0                      ; 6F41   0170
        XORR    R3,     R1                      ; 6F42   01D9
        PULR    R7                              ; 6F43   02B7

        CLRR    R1                              ; 6F44   01C9
        CLRR    R2                              ; 6F45   01D2
        CLRR    R4                              ; 6F46   01E4
        J       L_6AFB                          ; 6F47   0004 0368 02FB

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F4A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F4E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F52   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F56   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F5A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F5E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F62   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F66   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F6A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F6E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F72   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F76   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F7A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F7E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F82   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F86   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F8A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F8E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F92   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F96   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F9A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F9E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FAA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FAE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FBA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FBE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FCA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FCE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FDA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FDE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FFA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6FFE   0000 0000

        ORG     $D000

        DIS                                     ; D000   0003
        MVII    #$02F0, R6                      ; D001   02BE 02F0
        MVII    #$0100, R4                      ; D003   02BC 0100
        MVII    #$0260, R0                      ; D005   02B8 0260

        JSR     R5,     L_6CFF                  ; D007   0004 016C 00FF
        JSR     R5,     L_6D2F                  ; D00A   0004 016C 012F
        DECLE   $0000                           ; D00D   0000

        DIS                                     ; D00E   0003
        CLRR    R0                              ; D00F   01C0
        MVO     R0,     G_034D                  ; D010   0240 034D
        MVO     R0,     G_034E                  ; D012   0240 034E
        SDBD                                    ; D014   0001
        MVII    #$710E, R0                      ; D015   02B8 000E 0071
        MVO     R0,     .ISRVEC.0               ; D018   0240 0100
        SWAP    R0,     1                       ; D01A   0040
        MVO     R0,     .ISRVEC.1               ; D01B   0240 0101
        MVII    #$0003, R0                      ; D01D   02B8 0003
        MVO     R0,     G_0113                  ; D01F   0240 0113

L_D021:
        JSRE    R5,     L_6CE2                  ; D021   0004 016D 00E2

        MVI     G_0113, R0                      ; D024   0280 0113
        CMPI    #$0003, R0                      ; D026   0378 0003
        BEQ     L_D021                          ; D028   0224 0008

        MVI     G_034D, R2                      ; D02A   0282 034D
        MVI     G_034E, R3                      ; D02C   0283 034E
        MVI     G_0352, R4                      ; D02E   0284 0352
        CLRR    R0                              ; D030   01C0
        MVII    #$0102, R5                      ; D031   02BD 0102
L_D033:
        MVO@    R0,     R5                      ; D033   0268
        CMPI    #$0360, R5                      ; D034   037D 0360
        BNEQ    L_D033                          ; D036   022C 0004

        MVO     R4,     G_0352                  ; D038   0244 0352
        MVO     R3,     G_034E                  ; D03A   0243 034E
        MVO     R2,     G_034D                  ; D03C   0242 034D
        MVII    #$003F, R0                      ; D03E   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; D040   0240 01F8

        JSRD    R5,     L_61A1                  ; D042   0004 0162 01A1
        DECLE   $0000                           ; D045   0000

        JSR     R5,     L_61A1                  ; D046   0004 0160 01A1
        DECLE   $0001                           ; D049   0001

        MVII    #$0200, R4                      ; D04A   02BC 0200
        MVII    #$02F9, R1                      ; D04C   02B9 02F9
        MVII    #$0028, R0                      ; D04E   02B8 0028

        JSRE    R5,     L_6D00                  ; D050   0004 016D 0100
        JSR     R5,     L_599B                  ; D053   0004 0158 019B
        DECLE   $01C0,  $0240,  $0113,  $02BE   ; D056   01C0 0240 0113 02BE
        DECLE   $02F0,  $0004                   ; D05A   02F0 0004

        CMPR    R6,     R2                      ; D05C   0172
        MOVR    R0,     R2                      ; D05D   0082
        MVII    #$0004, R0                      ; D05E   02B8 0004
        MVO     R0,     G_0113                  ; D060   0240 0113

L_D062:
        JSRE    R5,     L_6C55                  ; D062   0004 016D 0055
        JSR     R5,     L_5A80                  ; D065   0004 0158 0280
        JSR     R5,     L_5A01                  ; D068   0004 0158 0201
        DECLE   $0004,  $0170,  $021B           ; D06B   0004 0170 021B

        JSR     R5,     L_6D07                  ; D06E   0004 016C 0107
        DECLE   $0004                           ; D071   0004

        CMPR    R6,     R0                      ; D072   0170
        MVO@    R7,     R5                      ; D073   026F

L_D074:
        JSRE    R5,     L_6CE2                  ; D074   0004 016D 00E2

        MVI     G_0113, R0                      ; D077   0280 0113
        CMPI    #$0002, R0                      ; D079   0378 0002
        BNEQ    L_D074                          ; D07B   022C 0008

        CLRR    R0                              ; D07D   01C0
        MVO     R0,     G_0113                  ; D07E   0240 0113
        B       L_D062                          ; D080   0220 001F

        PSHR    R5                              ; D082   0275
        MVII    #$004F, R0                      ; D083   02B8 004F
        MVO     R0,     G_01AF                  ; D085   0240 01AF
        MVII    #$00C8, R0                      ; D087   02B8 00C8
        SDBD                                    ; D089   0001
        MVII    #$08FB, R1                      ; D08A   02B9 00FB 0008
        MVII    #$0228, R4                      ; D08D   02BC 0228

        JSR     R5,     L_6D00                  ; D08F   0004 016C 0100

        SDBD                                    ; D092   0001
        MVII    #$09E7, R0                      ; D093   02B8 00E7 0009
        MVO     R0,     G_032E                  ; D096   0240 032E
        ADDI    #$000B, R0                      ; D098   02F8 000B
        MVO     R0,     G_032F                  ; D09A   0240 032F
        MVII    #$0102, R4                      ; D09C   02BC 0102
        MVII    #$0008, R0                      ; D09E   02B8 0008
        MVO@    R0,     R4                      ; D0A0   0260
        ADDR    R0,     R0                      ; D0A1   00C0

        JSR     R5,     L_6CFF                  ; D0A2   0004 016C 00FF

        SDBD                                    ; D0A5   0001
        MVII    #$7C90, R0                      ; D0A6   02B8 0090 007C
        MVO     R0,     G_0338                  ; D0A9   0240 0338
        MVII    #$0002, R0                      ; D0AB   02B8 0002
        MVII    #$0336, R4                      ; D0AD   02BC 0336

        JSR     R5,     L_6D1A                  ; D0AF   0004 016C 011A
        BIDECLE $0000                           ; D0B2   0000 0000
        DECLE   $0000,  $0004                   ; D0B4   0000 0004

        JSR     R5,     L_6C94                  ; D0B6   0004 016C 0094
        DECLE   $0003,  $0000                   ; D0B9   0003 0000

        JSR     R5,     L_6C94                  ; D0BB   0004 016C 0094
        DECLE   $0002,  $0001                   ; D0BE   0002 0001

        JSR     R5,     L_5D37                  ; D0C0   0004 015C 0137

        MVII    #$00FF, R0                      ; D0C3   02B8 00FF
        MVO     R0,     G_0166                  ; D0C5   0240 0166
        MVO     R0,     G_015E                  ; D0C7   0240 015E
        MVII    #$0388, R0                      ; D0C9   02B8 0388
        MVO     R0,     G_031E                  ; D0CB   0240 031E
        XORI    #$0100, R0                      ; D0CD   03F8 0100
        MVO     R0,     G_031F                  ; D0CF   0240 031F
        SDBD                                    ; D0D1   0001
        MVII    #$0490, R0                      ; D0D2   02B8 0090 0004
        MVO     R0,     G_0326                  ; D0D5   0240 0326
        MVO     R0,     G_0327                  ; D0D7   0240 0327
        MVI     G_0173, R0                      ; D0D9   0280 0173
        DECR    R0                              ; D0DB   0010
        BEQ     L_D0F6                          ; D0DC   0204 0018

        CLRR    R0                              ; D0DE   01C0
        MVO     R0,     G_015E                  ; D0DF   0240 015E
        MVII    #$0358, R0                      ; D0E1   02B8 0358
        MVO     R0,     G_031E                  ; D0E3   0240 031E
        XORI    #$0100, R0                      ; D0E5   03F8 0100
        MVO     R0,     G_031F                  ; D0E7   0240 031F
        MVII    #$00B8, R0                      ; D0E9   02B8 00B8
        MVO     R0,     G_0326                  ; D0EB   0240 0326
        MVO     R0,     G_0327                  ; D0ED   0240 0327
        MVII    #$0002, R0                      ; D0EF   02B8 0002
        MVO     R0,     G_0158                  ; D0F1   0240 0158

        JSR     R5,     L_5E02                  ; D0F3   0004 015C 0202
L_D0F6:
        JSR     R5,     L_6F21                  ; D0F6   0004 016C 0321

        PULR    R7                              ; D0F9   02B7

        DECLE   $0000,  $000B,  $0000,  $000B   ; D0FA   0000 000B 0000 000B
        DECLE   $0004,  $0000,  $0000           ; D0FE   0004 0000 0000

        RLC     R0,     1                       ; D101   0050
        SLL     R1,     1                       ; D102   0049
        RRC     R3,     1                       ; D103   0073
        SARC    R1,     1                       ; D104   0079
        RLC     R2,     2                       ; D105   0056
        MOVR    R4,     R0                      ; D106   00A0
        RLC     R2,     2                       ; D107   0056
        RRC     R3,     2                       ; D108   0077
        RLC     R3,     2                       ; D109   0057
        ADDR    R1,     R5                      ; D10A   00CD
        RLC     R0,     2                       ; D10B   0054
        COMR    R6                              ; D10C   001E
        SLLC    R0,     1                       ; D10D   0058
        PSHR    R5                              ; D10E   0275
        MVI     G_0113, R1                      ; D10F   0281 0113
        SLL     R1,     1                       ; D111   0049
        ADDR    R1,     R7                      ; D112   00CF
        B       L_D14D                          ; D113   0200 0038
        B       L_D15E                          ; D115   0200 0047
        B       L_D11D                          ; D117   0200 0004
        B       L_D12C                          ; D119   0200 0011
        B       L_D127                          ; D11B   0200 000A

L_D11D:
        MVO     R0,     .STIC.VIDEN             ; D11D   0240 0020

        JSR     R5,     L_6B11                  ; D11F   0004 0168 0311
        JSR     R5,     L_69D8                  ; D122   0004 0168 01D8

        EIS                                     ; D125   0002
        PULR    R7                              ; D126   02B7

L_D127:
        JSR     R5,     L_5BC2                  ; D127   0004 0158 03C2

        B       L_D11D                          ; D12A   0220 000E

L_D12C:
        DIS                                     ; D12C   0003
        SDBD                                    ; D12D   0001
        MVII    #$3800, R4                      ; D12E   02BC 0000 0038
        MVII    #$0200, R0                      ; D131   02B8 0200

        JSR     R5,     L_6CFF                  ; D133   0004 016C 00FF
        DECLE   $0001,  $02BC,  $00FA,  $0070   ; D136   0001 02BC 00FA 0070
        DECLE   $0004,  $0170,  $01D9,  $0004   ; D13A   0004 0170 01D9 0004
        DECLE   $0170,  $01FD,  $0001,  $02B9   ; D13E   0170 01FD 0001 02B9
        DECLE   $000F,  $007B,  $0004           ; D142   000F 007B 0004

        CMPR    R6,     R0                      ; D145   0170
        BNOV    L_D308                          ; D146   020A 01C0

        MVO     R0,     G_0113                  ; D148   0240 0113
        MVO     R0,     .STIC.VIDEN             ; D14A   0240 0020
        PULR    R7                              ; D14C   02B7

L_D14D:
        JSR     R5,     L_54DD                  ; D14D   0004 0154 00DD
        DECLE   $0004,  $0170,  $01A6,  $02BC   ; D150   0004 0170 01A6 02BC
        DECLE   $0102,  $0004                   ; D154   0102 0004

        CMPR    R6,     R0                      ; D156   0170
        CMPR    R6,     R3                      ; D157   0173
        MVII    #$0001, R0                      ; D158   02B8 0001
        MVO     R0,     G_0113                  ; D15A   0240 0113
        B       L_D11D                          ; D15C   0220 0040

L_D15E:
        JSR     R5,     L_6AF7                  ; D15E   0004 0168 02F7
        JSR     R5,     L_5893                  ; D161   0004 0158 0093
        JSR     R5,     L_54DD                  ; D164   0004 0154 00DD
        DECLE   $0004                           ; D167   0004

        CMPR    R6,     R4                      ; D168   0174
        MVO@    R6,     R3                      ; D169   025E

        JSR     R5,     L_5906                  ; D16A   0004 0158 0106

        MVII    #$0002, R0                      ; D16D   02B8 0002
        MVO     R0,     G_0113                  ; D16F   0240 0113
        B       L_D11D                          ; D171   0220 0055

        PSHR    R5                              ; D173   0275
        MVO     R5,     .STIC.VIDEN             ; D174   0245 0020
        MOVR    R6,     R0                      ; D176   00B0
        MVI@    R4,     R1                      ; D177   02A1
        SDBD                                    ; D178   0001
        MVII    #$3980, R6                      ; D179   02BE 0080 0039
L_D17C:
        TSTR    R1                              ; D17C   0089
        BEQ     L_D1A4                          ; D17D   0204 0025

        SDBD                                    ; D17F   0001
        MVI@    R4,     R5                      ; D180   02A5
        MVI@    R5,     R3                      ; D181   02AB
        PSHR    R3                              ; D182   0273
        MVI@    R5,     R3                      ; D183   02AB
        PSHR    R3                              ; D184   0273
        MVI@    R5,     R3                      ; D185   02AB
        PSHR    R3                              ; D186   0273
        MVI@    R5,     R3                      ; D187   02AB
        PSHR    R3                              ; D188   0273
        MVI@    R5,     R3                      ; D189   02AB
        PSHR    R3                              ; D18A   0273
        MVI@    R5,     R3                      ; D18B   02AB
        PSHR    R3                              ; D18C   0273
        MVI@    R5,     R3                      ; D18D   02AB
        PSHR    R3                              ; D18E   0273
        MVI@    R5,     R3                      ; D18F   02AB
        PSHR    R3                              ; D190   0273
        MVI@    R5,     R3                      ; D191   02AB
        PSHR    R3                              ; D192   0273
        MVI@    R5,     R3                      ; D193   02AB
        PSHR    R3                              ; D194   0273
        MVI@    R5,     R3                      ; D195   02AB
        PSHR    R3                              ; D196   0273
        MVI@    R5,     R3                      ; D197   02AB
        PSHR    R3                              ; D198   0273
        MVI@    R5,     R3                      ; D199   02AB
        PSHR    R3                              ; D19A   0273
        MVI@    R5,     R3                      ; D19B   02AB
        PSHR    R3                              ; D19C   0273
        MVI@    R5,     R3                      ; D19D   02AB
        PSHR    R3                              ; D19E   0273
        MVI@    R5,     R3                      ; D19F   02AB
        PSHR    R3                              ; D1A0   0273
        DECR    R1                              ; D1A1   0011
        B       L_D17C                          ; D1A2   0220 0027

L_D1A4:
        MOVR    R0,     R6                      ; D1A4   0086
        PULR    R7                              ; D1A5   02B7

        PSHR    R5                              ; D1A6   0275
        MVII    #$0318, R4                      ; D1A7   02BC 0318
        CLRR    R5                              ; D1A9   01ED
        MVI@    R4,     R1                      ; D1AA   02A1
        MVO@    R1,     R5                      ; D1AB   0269
        MVI@    R4,     R1                      ; D1AC   02A1
        MVO@    R1,     R5                      ; D1AD   0269
        MVI@    R4,     R1                      ; D1AE   02A1
        MVO@    R1,     R5                      ; D1AF   0269
        MVI@    R4,     R1                      ; D1B0   02A1
        MVO@    R1,     R5                      ; D1B1   0269
        MVI@    R4,     R1                      ; D1B2   02A1
        MVO@    R1,     R5                      ; D1B3   0269
        MVI@    R4,     R1                      ; D1B4   02A1
        MVO@    R1,     R5                      ; D1B5   0269
        MVI@    R4,     R1                      ; D1B6   02A1
        MVO@    R1,     R5                      ; D1B7   0269
        INCR    R4                              ; D1B8   000C
        INCR    R5                              ; D1B9   000D
        MVI@    R4,     R1                      ; D1BA   02A1
        MVO@    R1,     R5                      ; D1BB   0269
        MVI@    R4,     R1                      ; D1BC   02A1
        MVO@    R1,     R5                      ; D1BD   0269
        MVI@    R4,     R1                      ; D1BE   02A1
        MVO@    R1,     R5                      ; D1BF   0269
        MVI@    R4,     R1                      ; D1C0   02A1
        MVO@    R1,     R5                      ; D1C1   0269
        MVI@    R4,     R1                      ; D1C2   02A1
        MVO@    R1,     R5                      ; D1C3   0269
        MVI@    R4,     R1                      ; D1C4   02A1
        MVO@    R1,     R5                      ; D1C5   0269
        MVI@    R4,     R1                      ; D1C6   02A1
        MVO@    R1,     R5                      ; D1C7   0269
        INCR    R4                              ; D1C8   000C
        INCR    R5                              ; D1C9   000D
        MVI@    R4,     R1                      ; D1CA   02A1
        MVO@    R1,     R5                      ; D1CB   0269
        MVI@    R4,     R1                      ; D1CC   02A1
        MVO@    R1,     R5                      ; D1CD   0269
        MVI@    R4,     R1                      ; D1CE   02A1
        MVO@    R1,     R5                      ; D1CF   0269
        MVI@    R4,     R1                      ; D1D0   02A1
        MVO@    R1,     R5                      ; D1D1   0269
        MVI@    R4,     R1                      ; D1D2   02A1
        MVO@    R1,     R5                      ; D1D3   0269
        MVI@    R4,     R1                      ; D1D4   02A1
        MVO@    R1,     R5                      ; D1D5   0269
        MVI@    R4,     R1                      ; D1D6   02A1
        MVO@    R1,     R5                      ; D1D7   0269
        PULR    R7                              ; D1D8   02B7

        PSHR    R5                              ; D1D9   0275
        MVII    #$0028, R5                      ; D1DA   02BD 0028
        MVI@    R4,     R0                      ; D1DC   02A0
        MVO@    R0,     R5                      ; D1DD   0268
        MVI@    R4,     R0                      ; D1DE   02A0
        MVO@    R0,     R5                      ; D1DF   0268
        MVI@    R4,     R0                      ; D1E0   02A0
        MVO@    R0,     R5                      ; D1E1   0268
        MVI@    R4,     R0                      ; D1E2   02A0
        MVO@    R0,     R5                      ; D1E3   0268
        MVI@    R4,     R0                      ; D1E4   02A0
        RRC     R0,     1                       ; D1E5   0070
        BC      L_D1EC                          ; D1E6   0201 0004

        MVI     .STIC.MODE,R3                   ; D1E8   0283 0021
        B       L_D1EE                          ; D1EA   0200 0002

L_D1EC:
        MVO     R3,     .STIC.MODE              ; D1EC   0243 0021
L_D1EE:
        MVO@    R0,     R5                      ; D1EE   0268
        CLRR    R0                              ; D1EF   01C0
        MVII    #$0030, R5                      ; D1F0   02BD 0030
        MVO@    R0,     R5                      ; D1F2   0268
        MVO@    R0,     R5                      ; D1F3   0268
        MVI@    R4,     R0                      ; D1F4   02A0
        MVO@    R0,     R5                      ; D1F5   0268
        CLRR    R4                              ; D1F6   01E4
        MVII    #$0020, R0                      ; D1F7   02B8 0020

        JSR     R5,     L_6CFF                  ; D1F9   0004 016C 00FF

        PULR    R7                              ; D1FC   02B7

        PSHR    R5                              ; D1FD   0275
        MVII    #$01F0, R4                      ; D1FE   02BC 01F0
        MVII    #$000E, R0                      ; D200   02B8 000E

        JSR     R5,     L_6CFF                  ; D202   0004 016C 00FF

        MVII    #$003F, R0                      ; D205   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; D207   0240 01F8
        PULR    R7                              ; D209   02B7

        PSHR    R5                              ; D20A   0275
        MOVR    R1,     R5                      ; D20B   008D
        SDBD                                    ; D20C   0001
        MVII    #$3800, R4                      ; D20D   02BC 0000 0038
        MVI@    R5,     R2                      ; D210   02AA
        SLL     R2,     2                       ; D211   004E
        SLL     R2,     1                       ; D212   004A
L_D213:
        DECR    R2                              ; D213   0012
        BMI     L_D21A                          ; D214   020B 0004

        MVI@    R5,     R0                      ; D216   02A8
        MVO@    R0,     R4                      ; D217   0260
        B       L_D213                          ; D218   0220 0006
L_D21A:
        PULR    R7                              ; D21A   02B7

        PSHR    R5                              ; D21B   0275
        MVII    #$0330, R1                      ; D21C   02B9 0330
        MVII    #$0103, R4                      ; D21E   02BC 0103
        MVII    #$0001, R0                      ; D220   02B8 0001
        MVO     R0,     G_0114                  ; D222   0240 0114
L_D224:
        MVI@    R1,     R2                      ; D224   028A
        ANDI    #$007F, R2                      ; D225   03BA 007F
        DECR    R2                              ; D227   0012
        BMI     L_D23C                          ; D228   020B 0012
        BEQ     L_D23C                          ; D22A   0204 0010

        MVI@    R1,     R2                      ; D22C   028A
        DECR    R2                              ; D22D   0012
        MVO@    R2,     R1                      ; D22E   024A
        ADDI    #$0002, R4                      ; D22F   02FC 0002
L_D231:
        CMPI    #$0337, R1                      ; D231   0379 0337
        BEQ     L_D238                          ; D233   0204 0003

        INCR    R1                              ; D235   0009
        B       L_D224                          ; D236   0220 0013

L_D238:
        CLRR    R0                              ; D238   01C0
        MVO     R0,     G_0114                  ; D239   0240 0114
        PULR    R7                              ; D23B   02B7

L_D23C:
        MVI@    R1,     R2                      ; D23C   028A
        MOVR    R2,     R3                      ; D23D   0093
        MOVR    R2,     R0                      ; D23E   0090
        SLL     R2,     1                       ; D23F   004A
        SWAP    R2,     1                       ; D240   0042
        ANDI    #$0007, R2                      ; D241   03BA 0007
        SWAP    R3,     1                       ; D243   0043
        ANDI    #$00FC, R3                      ; D244   03BB 00FC
        MVI     G_0338, R5                      ; D246   0285 0338
        ADDR    R3,     R5                      ; D248   00DD
        SDBD                                    ; D249   0001
        MVI@    R5,     R3                      ; D24A   02AB
        PSHR    R1                              ; D24B   0271
        MOVR    R3,     R1                      ; D24C   0099
        ANDI    #$0007, R1                      ; D24D   03B9 0007
        ANDI    #$007F, R0                      ; D24F   03B8 007F
        BEQ     L_D258                          ; D251   0204 0005

        INCR    R2                              ; D253   000A
        CMPR    R1,     R2                      ; D254   014A
        BLE     L_D258                          ; D255   0206 0001

        CLRR    R2                              ; D257   01D2
L_D258:
        MOVR    R2,     R1                      ; D258   0091
        SLL     R1,     2                       ; D259   004D
        SLL     R1,     2                       ; D25A   004D
        SDBD                                    ; D25B   0001
        ADD@    R5,     R1                      ; D25C   02E9
        MVO@    R1,     R4                      ; D25D   0261
        SWAP    R1,     1                       ; D25E   0041
        MVO@    R1,     R4                      ; D25F   0261
        PULR    R1                              ; D260   02B1
        SLR     R3,     2                       ; D261   0067
        SLR     R3,     2                       ; D262   0067
        SWAP    R2,     1                       ; D263   0042
        SLR     R2,     1                       ; D264   0062
        MVI@    R1,     R0                      ; D265   0288
        SDBD                                    ; D266   0001
        ANDI    #$FC00, R0                      ; D267   03B8 0000 00FC
        XORR    R2,     R0                      ; D26A   01D0
        XORR    R3,     R0                      ; D26B   01D8
        MVO@    R0,     R1                      ; D26C   0248
        B       L_D231                          ; D26D   0220 003D

        PSHR    R5                              ; D26F   0275
        CLRR    R1                              ; D270   01C9
L_D271:
        MOVR    R1,     R2                      ; D271   008A
        ADDI    #$0121, R2                      ; D272   02FA 0121
        MVI@    R2,     R0                      ; D274   0290
        DECR    R0                              ; D275   0010
        BMI     L_D2C9                          ; D276   020B 0051

        MVO@    R0,     R2                      ; D278   0250
        BNEQ    L_D2C9                          ; D279   020C 004E

        MVII    #$001E, R0                      ; D27B   02B8 001E
        MVO@    R0,     R2                      ; D27D   0250
        SUBI    #$0006, R2                      ; D27E   033A 0006
        MVI@    R2,     R3                      ; D280   0293
        MVI@    R2,     R0                      ; D281   0290
        INCR    R3                              ; D282   000B
        ADDR    R7,     R3                      ; D283   00FB
        ADD@    R3,     R7                      ; D284   02DF

        DECLE   $0044,  $0044,  $0044,  $0008   ; D285   0044 0044 0044 0008
        DECLE   $002D,  $004A,  $0098,  $0044   ; D289   002D 004A 0098 0044
        DECLE   $0338,  $0002,  $0250,  $02BA   ; D28D   0338 0002 0250 02BA
        DECLE   $0318,  $00CA,  $0290,  $0001   ; D291   0318 00CA 0290 0001
        DECLE   $03B8,  $00FF,  $007F,  $0250   ; D295   03B8 00FF 007F 0250
        DECLE   $0093,  $02FA,  $0018,  $0290   ; D299   0093 02FA 0018 0290
        DECLE   $0008,  $0250,  $0298,  $0001   ; D29D   0008 0250 0298 0001
        DECLE   $03B8,  $0000,  $0040,  $0204   ; D2A1   03B8 0000 0040 0204
        DECLE   $0023,  $0298,  $0001,  $03F8   ; D2A5   0023 0298 0001 03F8
        DECLE   $0000,  $0040,  $0258,  $008A   ; D2A9   0000 0040 0258 008A
        DECLE   $0004                           ; D2AD   0004

        CMPR    R7,     R0                      ; D2AE   0178
        XORR    R5,     R1                      ; D2AF   01E9
        B       L_D2C9                          ; D2B0   0200 0017

        DECR    R0                              ; D2B2   0010
        MVO@    R0,     R2                      ; D2B3   0250
        MVII    #$0318, R2                      ; D2B4   02BA 0318
        ADDR    R1,     R2                      ; D2B6   00CA
        MVI@    R2,     R0                      ; D2B7   0290
        SDBD                                    ; D2B8   0001
        ANDI    #$7FFF, R0                      ; D2B9   03B8 00FF 007F
        MVO@    R0,     R2                      ; D2BC   0250
        ADDI    #$0018, R2                      ; D2BD   02FA 0018
        MVI@    R2,     R0                      ; D2BF   0290
        SDBD                                    ; D2C0   0001
        SUBI    #$0C00, R0                      ; D2C1   0338 0000 000C
        SDBD                                    ; D2C4   0001
        ANDI    #$FC00, R0                      ; D2C5   03B8 0000 00FC
        MVO@    R0,     R2                      ; D2C8   0250
L_D2C9:
        INCR    R1                              ; D2C9   0009
        CMPI    #$0006, R1                      ; D2CA   0379 0006
        BNEQ    L_D271                          ; D2CC   022C 005C
        PULR    R7                              ; D2CE   02B7

        MOVR    R1,     R2                      ; D2CF   008A
        MOVR    R1,     R3                      ; D2D0   008B
        MVII    #$0006, R0                      ; D2D1   02B8 0006
        ADDI    #$011B, R2                      ; D2D3   02FA 011B
        MVO@    R0,     R2                      ; D2D5   0250
        ADDI    #$0318, R3                      ; D2D6   02FB 0318
        MVI@    R3,     R5                      ; D2D8   029D
        ADDI    #$0008, R3                      ; D2D9   02FB 0008
        MVI@    R3,     R0                      ; D2DB   0298
        SDBD                                    ; D2DC   0001
        ANDI    #$F3FF, R0                      ; D2DD   03B8 00FF 00F3
        MVO@    R0,     R3                      ; D2E0   0258
        ANDI    #$007F, R0                      ; D2E1   03B8 007F
        CLRR    R4                              ; D2E3   01E4
        CMPI    #$0030, R0                      ; D2E4   0378 0030
        BLE     L_D2EE                          ; D2E6   0206 0006

        INCR    R4                              ; D2E8   000C
        CMPI    #$0050, R0                      ; D2E9   0378 0050
        BLE     L_D2EE                          ; D2EB   0206 0001

        INCR    R4                              ; D2ED   000C
L_D2EE:
        MOVR    R1,     R2                      ; D2EE   008A
        ADDR    R1,     R2                      ; D2EF   00CA
        ADDR    R1,     R2                      ; D2F0   00CA
        ADDI    #$0127, R2                      ; D2F1   02FA 0127
        MVI@    R2,     R0                      ; D2F3   0290
        DECR    R0                              ; D2F4   0010
        BEQ     L_D2FF                          ; D2F5   0204 0008

        SDBD                                    ; D2F7   0001
        ANDI    #$1000, R5                      ; D2F8   03BD 0000 0010
        BEQ     L_D2FF                          ; D2FB   0204 0002

        ADDI    #$0003, R4                      ; D2FD   02FC 0003
L_D2FF:
        ADDR    R4,     R4                      ; D2FF   00E4
        ADDR    R4,     R4                      ; D300   00E4
        SDBD                                    ; D301   0001
        ADDI    #$7A4A, R4                      ; D302   02FC 004A 007A
        ADDI    #$0008, R3                      ; D305   02FB 0008
        MVI@    R3,     R0                      ; D307   0298
L_D308:
        SDBD                                    ; D308   0001
        ANDI    #$EFF8, R0                      ; D309   03B8 00F8 00EF
        XORI    #$0007, R0                      ; D30C   03F8 0007
        MVO@    R0,     R3                      ; D30E   0258
        ADDI    #$0008, R3                      ; D30F   02FB 0008
        SDBD                                    ; D311   0001
        MVI@    R4,     R0                      ; D312   02A0
        MVO@    R0,     R3                      ; D313   0258
        PSHR    R1                              ; D314   0271
        MVI@    R4,     R0                      ; D315   02A0
        MVI@    R4,     R1                      ; D316   02A1

        JSR     R5,     L_5940                  ; D317   0004 0158 0140

        PULR    R1                              ; D31A   02B1
        B       L_D2C9                          ; D31B   0220 0053

        DECLE   $008A,  $008B,  $01C0,  $02FA   ; D31D   008A 008B 01C0 02FA
        DECLE   $011B,  $0250,  $02FB,  $0318   ; D321   011B 0250 02FB 0318
        DECLE   $0258,  $0004                   ; D325   0258 0004

        CMPR    R6,     R0                      ; D327   0170
        SUB@    R6,     R0                      ; D328   0330
        DECR    R0                              ; D329   0010
        BPL     L_D2C9                          ; D32A   0223 0062

        JSR     R5,     L_5A1B                  ; D32C   0004 0158 021B

        PULR    R7                              ; D32F   02B7

        PSHR    R5                              ; D330   0275
        PSHR    R1                              ; D331   0271
        MVII    #$011B, R1                      ; D332   02B9 011B
        CLRR    R0                              ; D334   01C0
L_D335:
        MVI@    R1,     R5                      ; D335   028D
        CMPI    #$0005, R5                      ; D336   037D 0005
        BEQ     L_D342                          ; D338   0204 0008

        CMPI    #$0006, R5                      ; D33A   037D 0006
        BEQ     L_D342                          ; D33C   0204 0004

        DECR    R5                              ; D33E   0015
        BMI     L_D342                          ; D33F   020B 0001

        INCR    R0                              ; D341   0008
L_D342:
        INCR    R1                              ; D342   0009
        CMPI    #$0121, R1                      ; D343   0379 0121
        BLT     L_D335                          ; D345   0225 0011

        PULR    R1                              ; D347   02B1
        PULR    R7                              ; D348   02B7

        PSHR    R5                              ; D349   0275
        CLRR    R1                              ; D34A   01C9
L_D34B:
        MOVR    R1,     R5                      ; D34B   008D
        ADDI    #$011B, R5                      ; D34C   02FD 011B
        MVI@    R5,     R2                      ; D34E   02AA
        INCR    R2                              ; D34F   000A
        ADDR    R7,     R2                      ; D350   00FA
        ADD@    R2,     R7                      ; D351   02D7

        DECLE   $001C,  $0008,  $0099,  $0056   ; D352   001C 0008 0099 0056
        DECLE   $0061,  $007B,  $001C,  $0027   ; D356   0061 007B 001C 0027
        DECLE   $0004,  $0174,  $0353,  $0004   ; D35A   0004 0174 0353 0004
        DECLE   $0174,  $03AF,  $0004,  $0178   ; D35E   0174 03AF 0004 0178
        DECLE   $0029,  $0004,  $0174,  $002E   ; D362   0029 0004 0174 002E
        DECLE   $0201,  $0006,  $0004,  $0174   ; D366   0201 0006 0004 0174
        DECLE   $03E6,  $0004                   ; D36A   03E6 0004

        CMPR    R6,     R4                      ; D36C   0174
        AND@    R1,     R3                      ; D36D   038B
L_D36E:
        INCR    R1                              ; D36E   0009
        CMPI    #$0006, R1                      ; D36F   0379 0006
        BNEQ    L_D34B                          ; D371   022C 0027

        JSR     R5,     L_6C94                  ; D373   0004 016C 0094
        DECLE   $0002,  $0001                   ; D376   0002 0001

        PULR    R7                              ; D378   02B7

        MVI     G_0156, R0                      ; D379   0280 0156
L_D37B:
        DECR    R0                              ; D37B   0010
        DECLE   $0240,  $0156,  $020C,  $0013   ; D37C   0240 0156 020C 0013
        DECLE   $0240,  $033F,  $0240,  $0340   ; D380   0240 033F 0240 0340
        DECLE   $0240,  $0341,  $0282,  $0155   ; D384   0240 0341 0282 0155
        DECLE   $02FA,  $0318,  $0250,  $02B8   ; D388   02FA 0318 0250 02B8
        DECLE   $0001,  $008A,  $02FA,  $011B   ; D38C   0001 008A 02FA 011B
        DECLE   $0250,  $0220,  $0038           ; D390   0250 0220 0038

        MOVR    R1,     R2                      ; D393   008A
        ADDI    #$019F, R2                      ; D394   02FA 019F
        MVI@    R2,     R0                      ; D396   0290
        ANDI    #$0080, R0                      ; D397   03B8 0080
        MVII    #$0001, R0                      ; D399   02B8 0001
        BNEQ    L_D37B                          ; D39B   022C 0021

        MOVR    R1,     R2                      ; D39D   008A
        ADDI    #$0330, R2                      ; D39E   02FA 0330
        MVI@    R2,     R0                      ; D3A0   0290
        SDBD                                    ; D3A1   0001
        ANDI    #$FC00, R0                      ; D3A2   03B8 0000 00FC
        MVO@    R0,     R2                      ; D3A5   0250
        B       L_D36E                          ; D3A6   0220 0039

        MOVR    R1,     R2                      ; D3A8   008A
        ADDI    #$0330, R2                      ; D3A9   02FA 0330
        MVI@    R2,     R0                      ; D3AB   0290
        SDBD                                    ; D3AC   0001
        ANDI    #$FC00, R0                      ; D3AD   03B8 0000 00FC
        MVO@    R0,     R2                      ; D3B0   0250
        B       L_D36E                          ; D3B1   0220 0044

        MOVR    R1,     R2                      ; D3B3   008A
        ADDI    #$0318, R2                      ; D3B4   02FA 0318
        MVI@    R2,     R0                      ; D3B6   0290
        TSTR    R0                              ; D3B7   0080
        BMI     L_D36E                          ; D3B8   022B 004B

        SDBD                                    ; D3BA   0001
        XORI    #$8000, R0                      ; D3BB   03F8 0000 0080
        MVO@    R0,     R2                      ; D3BE   0250
        ADDI    #$0018, R2                      ; D3BF   02FA 0018
        MVI@    R2,     R0                      ; D3C1   0290
        SDBD                                    ; D3C2   0001
        ADDI    #$0C00, R0                      ; D3C3   02F8 0000 000C
        SDBD                                    ; D3C6   0001
        ANDI    #$FC00, R0                      ; D3C7   03B8 0000 00FC
        MVO@    R0,     R2                      ; D3CA   0250
        B       L_D36E                          ; D3CB   0220 005E

        MOVR    R1,     R2                      ; D3CD   008A
        ADDI    #$0318, R2                      ; D3CE   02FA 0318
        MVI@    R2,     R0                      ; D3D0   0290
        TSTR    R0                              ; D3D1   0080
        BMI     L_D36E                          ; D3D2   022B 0065

        SDBD                                    ; D3D4   0001
        XORI    #$8000, R0                      ; D3D5   03F8 0000 0080
        SDBD                                    ; D3D8   0001
        ANDI    #$FEFF, R0                      ; D3D9   03B8 00FF 00FE
        MVO@    R0,     R2                      ; D3DC   0250
        ADDI    #$0018, R2                      ; D3DD   02FA 0018
        MVI@    R2,     R0                      ; D3DF   0290
        SDBD                                    ; D3E0   0001
        ADDI    #$0400, R0                      ; D3E1   02F8 0000 0004
        SDBD                                    ; D3E4   0001
        ANDI    #$FC00, R0                      ; D3E5   03B8 0000 00FC
        MVO@    R0,     R2                      ; D3E8   0250
        B       L_D36E                          ; D3E9   0220 007C

        PSHR    R1                              ; D3EB   0271

        JSR     R5,     L_61A1                  ; D3EC   0004 0160 01A1
        DECLE   $0003,  $02B1,  $0004,  $0174   ; D3EF   0003 02B1 0004 0174
        DECLE   $0353,  $0004,  $0174,  $03AF   ; D3F3   0353 0004 0174 03AF

        MOVR    R1,     R2                      ; D3F7   008A
        ADDI    #$0145, R2                      ; D3F8   02FA 0145
        MVI@    R2,     R5                      ; D3FA   0295
        TSTR    R5                              ; D3FB   00AD
        BEQ     L_D402                          ; D3FC   0204 0004

        CLRR    R5                              ; D3FE   01ED
        MVO@    R5,     R2                      ; D3FF   0255
        B       L_D36E                          ; D400   0220 0093

L_D402:
        INCR    R5                              ; D402   000D
        DECLE   $0255,  $0004,  $0174,  $0273   ; D403   0255 0004 0174 0273
        DECLE   $0221,  $00A0                   ; D407   0221 00A0

        PSHR    R1                              ; D409   0271
        MVII    #$0139, R2                      ; D40A   02BA 0139
        MVII    #$013F, R3                      ; D40C   02BB 013F
        ADDR    R1,     R2                      ; D40E   00CA
        ADDR    R1,     R3                      ; D40F   00CB
        ADDI    #$0115, R1                      ; D410   02F9 0115
        MVI@    R1,     R0                      ; D412   0288
        MVI@    R2,     R4                      ; D413   0294
        TSTR    R4                              ; D414   00A4
        BEQ     L_D426                          ; D415   0204 000F

        MVI@    R3,     R4                      ; D417   029C
        TSTR    R4                              ; D418   00A4
        BEQ     L_D41E                          ; D419   0204 0003

        CMP@    R2,     R0                      ; D41B   0350
        BEQ     L_D426                          ; D41C   0204 0008

L_D41E:
        MVI@    R2,     R0                      ; D41E   0290
        DECLE   $0080,  $0204,  $0004,  $0248   ; D41F   0080 0204 0004 0248
        DECLE   $02B1,  $0220,  $00BD           ; D423   02B1 0220 00BD
L_D426:
        MVI@    R3,     R0                      ; D426   0298
        DECLE   $0080,  $0224,  $000B,  $0248   ; D427   0080 0224 000B 0248
        DECLE   $02B1,  $0220,  $00C5,  $0275   ; D42B   02B1 0220 00C5 0275
        DECLE   $0271,  $0280,  $014D,  $03B8   ; D42F   0271 0280 014D 03B8
        DECLE   $0007,  $020C,  $01C2,  $0280   ; D433   0007 020C 01C2 0280
        DECLE   $014E,  $03B8,  $0007,  $020C   ; D437   014E 03B8 0007 020C
        DECLE   $01BC,  $0280,  $0156,  $0080   ; D43B   01BC 0280 0156 0080
        DECLE   $020C,  $01B7,  $008A,  $02FA   ; D43F   020C 01B7 008A 02FA
        DECLE   $011B,  $0290,  $0010,  $020C   ; D443   011B 0290 0010 020C
        DECLE   $01B0,  $033A,  $0006,  $0290   ; D447   01B0 033A 0006 0290
        DECLE   $0378,  $0002,  $0206,  $01A9   ; D44B   0378 0002 0206 01A9
        DECLE   $008A,  $004A,  $00CA,  $02FA   ; D44F   008A 004A 00CA 02FA
        DECLE   $0127,  $0290,  $0010,  $0204   ; D453   0127 0290 0010 0204
        DECLE   $01A0,  $0004                   ; D457   01A0 0004

        CMPR    R6,     R4                      ; D459   0174
        XORR    R7,     R3                      ; D45A   01FB
        BNC     L_D5F8                          ; D45B   0209 019B

        JSR     R5,     L_58B7                  ; D45D   0004 0158 00B7
        DECLE   $020B,  $0196,  $0240,  $0155   ; D460   020B 0196 0240 0155
        DECLE   $02B2,  $0272,  $02FA,  $0320   ; D464   02B2 0272 02FA 0320
        DECLE   $0290,  $02FA,  $0010,  $0293   ; D468   0290 02FA 0010 0293
        DECLE   $0001,  $03BB,  $0000,  $00FC   ; D46C   0001 03BB 0000 00FC
        DECLE   $0253,  $02BC,  $0001,  $0001   ; D470   0253 02BC 0001 0001
        DECLE   $03B8,  $0000,  $0004,  $020C   ; D474   03B8 0000 0004 020C
        DECLE   $00BC,  $0004,  $0174,  $021A   ; D478   00BC 0004 0174 021A

        INCR    R5                              ; D47C   000D
        ADDR    R7,     R5                      ; D47D   00FD
        ADD@    R5,     R7                      ; D47E   02EF

        DECLE   $0179,  $0004                   ; D47F   0179 0004

        RSWD    R2                              ; D481   003A
        RRC     R2,     2                       ; D482   0076
        MVI     G_014D, R0                      ; D483   0280 014D
        ADDI    #$0007, R0                      ; D485   02F8 0007
        XORI    #$0300, R0                      ; D487   03F8 0300
        MVO@    R0,     R1                      ; D489   0248
        CLRR    R0                              ; D48A   01C0
        MVO     R0,     G_033F                  ; D48B   0240 033F
        ADDI    #$0008, R1                      ; D48D   02F9 0008
        MVI     G_014E, R0                      ; D48F   0280 014E
        XORI    #$0080, R0                      ; D491   03F8 0080
        MVO@    R0,     R1                      ; D493   0248
        CLRR    R0                              ; D494   01C0
        MVO     R0,     G_0340                  ; D495   0240 0340
        MVI     G_0155, R0                      ; D497   0280 0155
        ADDR    R0,     R0                      ; D499   00C0
        ADDI    #$0030, R0                      ; D49A   02F8 0030
        SLL     R0,     2                       ; D49C   004C
        ADDR    R0,     R0                      ; D49D   00C0
        SDBD                                    ; D49E   0001
        XORI    #$0806, R0                      ; D49F   03F8 0006 0008
        ADDI    #$0008, R1                      ; D4A2   02F9 0008
        MVO@    R0,     R1                      ; D4A4   0248
        SDBD                                    ; D4A5   0001
        MVII    #$5800, R0                      ; D4A6   02B8 0000 0058
        ADDI    #$0008, R1                      ; D4A9   02F9 0008
        MVO@    R0,     R1                      ; D4AB   0248
        MVII    #$001E, R0                      ; D4AC   02B8 001E
        MVO     R0,     G_0156                  ; D4AE   0240 0156
        PULR    R1                              ; D4B0   02B1
        MOVR    R1,     R2                      ; D4B1   008A
        MVII    #$0007, R0                      ; D4B2   02B8 0007
        ADDI    #$011B, R2                      ; D4B4   02FA 011B
        MVO@    R0,     R2                      ; D4B6   0250
        SETC                                    ; D4B7   0007
        PULR    R7                              ; D4B8   02B7

        MVI     G_014D, R0                      ; D4B9   0280 014D
        ADDI    #$0007, R0                      ; D4BB   02F8 0007
        XORI    #$0300, R0                      ; D4BD   03F8 0300
        MVO@    R0,     R1                      ; D4BF   0248
        ADDI    #$0007, R0                      ; D4C0   02F8 0007
        MVO     R0,     G_033F                  ; D4C2   0240 033F
        ADDI    #$0008, R1                      ; D4C4   02F9 0008
        MVI     G_014E, R0                      ; D4C6   0280 014E
        XORI    #$0080, R0                      ; D4C8   03F8 0080
        MVO@    R0,     R1                      ; D4CA   0248
        MVO     R0,     G_0340                  ; D4CB   0240 0340
        MVI     G_0155, R0                      ; D4CD   0280 0155
        ADDR    R0,     R0                      ; D4CF   00C0
        ADDI    #$0030, R0                      ; D4D0   02F8 0030
        SLL     R0,     2                       ; D4D2   004C
        ADDR    R0,     R0                      ; D4D3   00C0
        SDBD                                    ; D4D4   0001
        XORI    #$0806, R0                      ; D4D5   03F8 0006 0008
        ADDI    #$0008, R1                      ; D4D8   02F9 0008
        MVO@    R0,     R1                      ; D4DA   0248
        SDBD                                    ; D4DB   0001
        MVII    #$5C00, R0                      ; D4DC   02B8 0000 005C
        ADDI    #$0008, R1                      ; D4DF   02F9 0008
        MVO@    R0,     R1                      ; D4E1   0248
        SDBD                                    ; D4E2   0001
        MVII    #$0916, R0                      ; D4E3   02B8 0016 0009
        MVO     R0,     G_0341                  ; D4E6   0240 0341
        MVII    #$001E, R0                      ; D4E8   02B8 001E
        MVO     R0,     G_0156                  ; D4EA   0240 0156
        PULR    R1                              ; D4EC   02B1
        MOVR    R1,     R2                      ; D4ED   008A
        MVII    #$0007, R0                      ; D4EE   02B8 0007
        ADDI    #$011B, R2                      ; D4F0   02FA 011B
        MVO@    R0,     R2                      ; D4F2   0250
        SETC                                    ; D4F3   0007
        PULR    R7                              ; D4F4   02B7

        MVI     G_014D, R0                      ; D4F5   0280 014D
        ADDI    #$0007, R0                      ; D4F7   02F8 0007
        SDBD                                    ; D4F9   0001
        XORI    #$0700, R0                      ; D4FA   03F8 0000 0007
        MVO@    R0,     R1                      ; D4FD   0248
        SDBD                                    ; D4FE   0001
        ADDI    #$040F, R0                      ; D4FF   02F8 000F 0004
        MVO     R0,     G_033F                  ; D502   0240 033F
        ADDI    #$0008, R1                      ; D504   02F9 0008
        MVI     G_014E, R0                      ; D506   0280 014E
        XORI    #$0080, R0                      ; D508   03F8 0080
        MVO@    R0,     R1                      ; D50A   0248
        MVO     R0,     G_0340                  ; D50B   0240 0340
        MVI     G_0155, R0                      ; D50D   0280 0155
        ADDR    R0,     R0                      ; D50F   00C0
        ADDI    #$0030, R0                      ; D510   02F8 0030
        SLL     R0,     2                       ; D512   004C
        ADDR    R0,     R0                      ; D513   00C0
        SDBD                                    ; D514   0001
        XORI    #$0806, R0                      ; D515   03F8 0006 0008
        ADDI    #$0008, R1                      ; D518   02F9 0008
        MVO@    R0,     R1                      ; D51A   0248
        SDBD                                    ; D51B   0001
        MVII    #$6000, R0                      ; D51C   02B8 0000 0060
        ADDI    #$0008, R1                      ; D51F   02F9 0008
        MVO@    R0,     R1                      ; D521   0248
        SDBD                                    ; D522   0001
        MVII    #$0916, R0                      ; D523   02B8 0016 0009
        MVO     R0,     G_0341                  ; D526   0240 0341
        MVII    #$001E, R0                      ; D528   02B8 001E
        MVO     R0,     G_0156                  ; D52A   0240 0156
        PULR    R1                              ; D52C   02B1
        MOVR    R1,     R2                      ; D52D   008A
        MVII    #$0007, R0                      ; D52E   02B8 0007
        ADDI    #$011B, R2                      ; D530   02FA 011B
        MVO@    R0,     R2                      ; D532   0250
        SETC                                    ; D533   0007
        PULR    R7                              ; D534   02B7

        DECLE   $0024,  $0004,  $0174,  $021A   ; D535   0024 0004 0174 021A

        INCR    R5                              ; D539   000D
        ADDR    R7,     R5                      ; D53A   00FD
        ADD@    R5,     R7                      ; D53B   02EF

        DECLE   $00BC,  $0004                   ; D53C   00BC 0004

        RSWD    R4                              ; D53E   003C
        SARC    R2,     1                       ; D53F   007A
        MVI     G_014D, R0                      ; D540   0280 014D
        SUBI    #$0007, R0                      ; D542   0338 0007
        XORI    #$0300, R0                      ; D544   03F8 0300
        MVO@    R0,     R1                      ; D546   0248
        CLRR    R0                              ; D547   01C0
        MVO     R0,     G_033F                  ; D548   0240 033F
        ADDI    #$0008, R1                      ; D54A   02F9 0008
        MVI     G_014E, R0                      ; D54C   0280 014E
        SDBD                                    ; D54E   0001
        XORI    #$0480, R0                      ; D54F   03F8 0080 0004
        MVO@    R0,     R1                      ; D552   0248
        CLRR    R0                              ; D553   01C0
        MVO     R0,     G_0340                  ; D554   0240 0340
        MVI     G_0155, R0                      ; D556   0280 0155
        ADDR    R0,     R0                      ; D558   00C0
        ADDI    #$0030, R0                      ; D559   02F8 0030
        SLL     R0,     2                       ; D55B   004C
        ADDR    R0,     R0                      ; D55C   00C0
        SDBD                                    ; D55D   0001
        XORI    #$0806, R0                      ; D55E   03F8 0006 0008
        ADDI    #$0008, R1                      ; D561   02F9 0008
        MVO@    R0,     R1                      ; D563   0248
        SDBD                                    ; D564   0001
        MVII    #$5800, R0                      ; D565   02B8 0000 0058
        ADDI    #$0008, R1                      ; D568   02F9 0008
        MVO@    R0,     R1                      ; D56A   0248
        MVII    #$001E, R0                      ; D56B   02B8 001E
        MVO     R0,     G_0156                  ; D56D   0240 0156
        PULR    R1                              ; D56F   02B1
        MOVR    R1,     R2                      ; D570   008A
        MVII    #$0007, R0                      ; D571   02B8 0007
        ADDI    #$011B, R2                      ; D573   02FA 011B
        MVO@    R0,     R2                      ; D575   0250
        SETC                                    ; D576   0007
        PULR    R7                              ; D577   02B7

        MVI     G_014D, R0                      ; D578   0280 014D
        SUBI    #$0007, R0                      ; D57A   0338 0007
        XORI    #$0300, R0                      ; D57C   03F8 0300
        MVO@    R0,     R1                      ; D57E   0248
        SUBI    #$0007, R0                      ; D57F   0338 0007
        MVO     R0,     G_033F                  ; D581   0240 033F
        ADDI    #$0008, R1                      ; D583   02F9 0008
        MVI     G_014E, R0                      ; D585   0280 014E
        SDBD                                    ; D587   0001
        XORI    #$0480, R0                      ; D588   03F8 0080 0004
        MVO@    R0,     R1                      ; D58B   0248
        MVO     R0,     G_0340                  ; D58C   0240 0340
        MVI     G_0155, R0                      ; D58E   0280 0155
        ADDR    R0,     R0                      ; D590   00C0
        ADDI    #$0030, R0                      ; D591   02F8 0030
        SLL     R0,     2                       ; D593   004C
        ADDR    R0,     R0                      ; D594   00C0
        SDBD                                    ; D595   0001
        XORI    #$0806, R0                      ; D596   03F8 0006 0008
        ADDI    #$0008, R1                      ; D599   02F9 0008
        MVO@    R0,     R1                      ; D59B   0248
        SDBD                                    ; D59C   0001
        MVII    #$5C00, R0                      ; D59D   02B8 0000 005C
        ADDI    #$0008, R1                      ; D5A0   02F9 0008
        MVO@    R0,     R1                      ; D5A2   0248
        SDBD                                    ; D5A3   0001
        MVII    #$0916, R0                      ; D5A4   02B8 0016 0009
        MVO     R0,     G_0341                  ; D5A7   0240 0341
        MVII    #$001E, R0                      ; D5A9   02B8 001E
        MVO     R0,     G_0156                  ; D5AB   0240 0156
        PULR    R1                              ; D5AD   02B1
        MOVR    R1,     R2                      ; D5AE   008A
        MVII    #$0007, R0                      ; D5AF   02B8 0007
        ADDI    #$011B, R2                      ; D5B1   02FA 011B
        MVO@    R0,     R2                      ; D5B3   0250
        SETC                                    ; D5B4   0007
        PULR    R7                              ; D5B5   02B7

        DECLE   $0280,  $014D,  $0338,  $000F   ; D5B6   0280 014D 0338 000F
        DECLE   $0001                           ; D5BA   0001

        XORI    #$0000, R0                      ; D5BB   03F8 0000
        SETC                                    ; D5BD   0007
        MVO@    R0,     R1                      ; D5BE   0248
        SDBD                                    ; D5BF   0001
        SUBI    #$0407, R0                      ; D5C0   0338 0007 0004
        MVO     R0,     G_033F                  ; D5C3   0240 033F
        ADDI    #$0008, R1                      ; D5C5   02F9 0008
        MVI     G_014E, R0                      ; D5C7   0280 014E
        SDBD                                    ; D5C9   0001
        XORI    #$0480, R0                      ; D5CA   03F8 0080 0004
        MVO@    R0,     R1                      ; D5CD   0248
        MVO     R0,     G_0340                  ; D5CE   0240 0340
        MVI     G_0155, R0                      ; D5D0   0280 0155
        ADDR    R0,     R0                      ; D5D2   00C0
        ADDI    #$0030, R0                      ; D5D3   02F8 0030
        SLL     R0,     2                       ; D5D5   004C
        ADDR    R0,     R0                      ; D5D6   00C0
        SDBD                                    ; D5D7   0001
        XORI    #$0806, R0                      ; D5D8   03F8 0006 0008
        ADDI    #$0008, R1                      ; D5DB   02F9 0008
        MVO@    R0,     R1                      ; D5DD   0248
        SDBD                                    ; D5DE   0001
        MVII    #$6000, R0                      ; D5DF   02B8 0000 0060
        ADDI    #$0008, R1                      ; D5E2   02F9 0008
        MVO@    R0,     R1                      ; D5E4   0248
        SDBD                                    ; D5E5   0001
        MVII    #$0916, R0                      ; D5E6   02B8 0016 0009
        MVO     R0,     G_0341                  ; D5E9   0240 0341
        MVII    #$001E, R0                      ; D5EB   02B8 001E
        MVO     R0,     G_0156                  ; D5ED   0240 0156
        PULR    R1                              ; D5EF   02B1
        MOVR    R1,     R2                      ; D5F0   008A
        MVII    #$0007, R0                      ; D5F1   02B8 0007
        ADDI    #$011B, R2                      ; D5F3   02FA 011B
        MVO@    R0,     R2                      ; D5F5   0250
        SETC                                    ; D5F6   0007
        PULR    R7                              ; D5F7   02B7

L_D5F8:
        PULR    R1                              ; D5F8   02B1
        CLRC                                    ; D5F9   0006
        PULR    R7                              ; D5FA   02B7

        PSHR    R5                              ; D5FB   0275
        MVII    #$0004, R0                      ; D5FC   02B8 0004
        MVI     G_015A, R5                      ; D5FE   0285 015A
        SUB     G_014E, R5                      ; D600   0305 014E
        BPL     L_D605                          ; D602   0203 0001

        NEGR    R5                              ; D604   0025
L_D605:
        CMPI    #$0004, R5                      ; D605   037D 0004
        BGT     L_D60A                          ; D607   020E 0001

        DECR    R0                              ; D609   0010
L_D60A:
        MVI     G_0173, R5                      ; D60A   0285 0173
        CMPI    #$0005, R5                      ; D60C   037D 0005
        BLT     L_D611                          ; D60E   0205 0001

        DECR    R0                              ; D610   0010

L_D611:
        JSR     R5,     L_6CF1                  ; D611   0004 016C 00F1

        BNEQ    L_D618                          ; D614   020C 0002

        SETC                                    ; D616   0007
        PULR    R7                              ; D617   02B7

L_D618:
        CLRC                                    ; D618   0006
        PULR    R7                              ; D619   02B7

        PSHR    R5                              ; D61A   0275
        PSHR    R2                              ; D61B   0272
        PSHR    R1                              ; D61C   0271
        PSHR    R0                              ; D61D   0270
        MVI     G_014E, R0                      ; D61E   0280 014E
        DECR    R0                              ; D620   0010
        SLR     R0,     2                       ; D621   0064
        SLR     R0,     1                       ; D622   0060
        SLL     R0,     2                       ; D623   004C
        MOVR    R0,     R1                      ; D624   0081
        SLL     R0,     2                       ; D625   004C
        ADDR    R0,     R1                      ; D626   00C1
        MVI     G_014D, R0                      ; D627   0280 014D
        DECR    R0                              ; D629   0010
        SLR     R0,     2                       ; D62A   0064
        SLR     R0,     1                       ; D62B   0060
        ADDR    R0,     R1                      ; D62C   00C1
        ADDI    #$0200, R1                      ; D62D   02F9 0200
        CLRR    R5                              ; D62F   01ED
L_D630:
        ADDR    R4,     R1                      ; D630   00E1
        MVI@    R1,     R2                      ; D631   028A
        SLR     R2,     2                       ; D632   0066
        SLR     R2,     1                       ; D633   0062
        MOVR    R2,     R0                      ; D634   0090
        ANDI    #$0100, R0                      ; D635   03B8 0100
        BEQ     L_D64D                          ; D637   0204 0014

        ANDI    #$003F, R2                      ; D639   03BA 003F
        CMPI    #$0020, R2                      ; D63B   037A 0020
        BGE     L_D64D                          ; D63D   020D 000E

        SDBD                                    ; D63F   0001
        ADDI    #$60ED, R2                      ; D640   02FA 00ED 0060
        MVI@    R2,     R0                      ; D643   0290
        ANDI    #$0020, R0                      ; D644   03B8 0020
        BEQ     L_D64D                          ; D646   0204 0005

        INCR    R5                              ; D648   000D
        CMPI    #$0003, R5                      ; D649   037D 0003
        BNEQ    L_D630                          ; D64B   022C 001C

L_D64D:
        TSTR    R5                              ; D64D   00AD
        BEQ     L_D65A                          ; D64E   0204 000A

        PSHR    R3                              ; D650   0273
        PSHR    R4                              ; D651   0274
        PSHR    R5                              ; D652   0275

        JSR     R5,     L_61A1                  ; D653   0004 0160 01A1
        DECLE   $000F                           ; D656   000F

        PULR    R5                              ; D657   02B5
        PULR    R4                              ; D658   02B4
        PULR    R3                              ; D659   02B3
L_D65A:
        PULR    R0                              ; D65A   02B0
        PULR    R1                              ; D65B   02B1
        PULR    R2                              ; D65C   02B2
        PULR    R7                              ; D65D   02B7

        MVI     G_0156, R0                      ; D65E   0280 0156
        TSTR    R0                              ; D660   0080
        BEQ     L_D672                          ; D661   0204 000F

        MVI     G_0155, R1                      ; D663   0281 0155
        MVI     G_033F, R0                      ; D665   0280 033F
        MVO@    R0,     R1                      ; D667   0248
        ADDI    #$0008, R1                      ; D668   02F9 0008
        MVI     G_0340, R0                      ; D66A   0280 0340
        MVO@    R0,     R1                      ; D66C   0248
        MVI     G_0341, R0                      ; D66D   0280 0341
        ADDI    #$0008, R1                      ; D66F   02F9 0008
        MVO@    R0,     R1                      ; D671   0248
L_D672:
        MOVR    R5,     R7                      ; D672   00AF

        PSHR    R5                              ; D673   0275
        PSHR    R1                              ; D674   0271
        MOVR    R1,     R2                      ; D675   008A
        ADDI    #$019F, R2                      ; D676   02FA 019F
        MVI@    R2,     R0                      ; D678   0290
        ANDI    #$0080, R0                      ; D679   03B8 0080
        BNEQ    L_D71A                          ; D67B   020C 009D

        MVI     G_014D, R0                      ; D67D   0280 014D
        ANDI    #$0007, R0                      ; D67F   03B8 0007
        BNEQ    L_D68B                          ; D681   020C 0008

        MVI     G_014E, R0                      ; D683   0280 014E
        ANDI    #$0003, R0                      ; D685   03B8 0003
        BEQ     L_D698                          ; D687   0204 000F
        B       L_D695                          ; D689   0200 000A

L_D68B:
        ANDI    #$0003, R0                      ; D68B   03B8 0003
        BNEQ    L_D695                          ; D68D   020C 0006

        MVI     G_014E, R0                      ; D68F   0280 014E
        ANDI    #$0007, R0                      ; D691   03B8 0007
        BEQ     L_D6A4                          ; D693   0204 000F

L_D695:
        PULR    R1                              ; D695   02B1
        CLRC                                    ; D696   0006
        PULR    R7                              ; D697   02B7

L_D698:
        MVI     G_014D, R2                      ; D698   0282 014D
        MVI     G_014E, R3                      ; D69A   0283 014E
        PSHR    R3                              ; D69C   0273
        MVII    #$013F, R4                      ; D69D   02BC 013F
        ADDR    R1,     R4                      ; D69F   00CC
        MVO     R4,     G_0153                  ; D6A0   0244 0153
        B       L_D6AE                          ; D6A2   0200 000A

L_D6A4:
        MVI     G_014D, R2                      ; D6A4   0282 014D
        MVI     G_014E, R3                      ; D6A6   0283 014E
        PSHR    R2                              ; D6A8   0272
        MVII    #$0139, R4                      ; D6A9   02BC 0139
        ADDR    R1,     R4                      ; D6AB   00CC
        MVO     R4,     G_0153                  ; D6AC   0244 0153
L_D6AE:
        DECR    R3                              ; D6AE   0013
        SLR     R3,     2                       ; D6AF   0067
        SLR     R3,     1                       ; D6B0   0063
        SLL     R3,     2                       ; D6B1   004F
        MOVR    R3,     R1                      ; D6B2   0099
        SLL     R3,     2                       ; D6B3   004F
        ADDR    R3,     R1                      ; D6B4   00D9
        DECR    R2                              ; D6B5   0012
        SLR     R2,     2                       ; D6B6   0066
        SLR     R2,     1                       ; D6B7   0062
        ADDR    R2,     R1                      ; D6B8   00D1
        ADDI    #$0200, R1                      ; D6B9   02F9 0200
        MVI@    R1,     R2                      ; D6BB   028A
        SLR     R2,     2                       ; D6BC   0066
        SLR     R2,     1                       ; D6BD   0062
        MOVR    R2,     R3                      ; D6BE   0093
        PULR    R5                              ; D6BF   02B5
        ANDI    #$0100, R2                      ; D6C0   03BA 0100
        BNEQ    L_D6CB                          ; D6C2   020C 0007

        MVII    #$0100, R2                      ; D6C4   02BA 0100
        ADD     G_0153, R2                      ; D6C6   02C2 0153
        MVI@    R2,     R0                      ; D6C8   0290
        B       L_D6FE                          ; D6C9   0200 0033

L_D6CB:
        ANDI    #$003F, R3                      ; D6CB   03BB 003F
        CMPI    #$0020, R3                      ; D6CD   037B 0020
        BGT     L_D6FE                          ; D6CF   020E 002D
        BEQ     L_D695                          ; D6D1   0224 003D

        SDBD                                    ; D6D3   0001
        ADDI    #$610D, R3                      ; D6D4   02FB 000D 0061
        MVII    #$0080, R1                      ; D6D7   02B9 0080
        ANDI    #$0007, R5                      ; D6D9   03BD 0007
        BNEQ    L_D6DE                          ; D6DB   020C 0001

        SLR     R1,     1                       ; D6DD   0061
L_D6DE:
        MVII    #$0001, R4                      ; D6DE   02BC 0001
        CLRR    R5                              ; D6E0   01ED
L_D6E1:
        MOVR    R1,     R0                      ; D6E1   0088
        AND@    R3,     R0                      ; D6E2   0398
        BEQ     L_D6E6                          ; D6E3   0204 0001

        ADDR    R4,     R5                      ; D6E5   00E5
L_D6E6:
        ADDR    R4,     R4                      ; D6E6   00E4
        SLR     R1,     2                       ; D6E7   0065
        BNEQ    L_D6E1                          ; D6E8   022C 0008

        MVII    #$0100, R1                      ; D6EA   02B9 0100
        ADD     G_0153, R1                      ; D6EC   02C1 0153
        MOVR    R5,     R0                      ; D6EE   00A8
        AND@    R1,     R0                      ; D6EF   0388
        BNEQ    L_D6FE                          ; D6F0   020C 000C

        MVII    #$0006, R0                      ; D6F2   02B8 0006
        CMPI    #$013F, R1                      ; D6F4   0379 013F
        BLT     L_D6F9                          ; D6F6   0205 0001

        NEGR    R0                              ; D6F8   0020
L_D6F9:
        ADDR    R0,     R1                      ; D6F9   00C1
        MOVR    R5,     R0                      ; D6FA   00A8
        AND@    R1,     R0                      ; D6FB   0388
        BEQ     L_D695                          ; D6FC   0224 0068

L_D6FE:
        MVI     G_014D, R2                      ; D6FE   0282 014D
        ANDI    #$0007, R2                      ; D700   03BA 0007
        BEQ     L_D709                          ; D702   0204 0005

        MOVR    R0,     R2                      ; D704   0082
        ANDI    #$0003, R2                      ; D705   03BA 0003
        BNEQ    L_D695                          ; D707   022C 0073

L_D709:
        MVI     G_014E, R2                      ; D709   0282 014E
        ANDI    #$0007, R2                      ; D70B   03BA 0007
        BEQ     L_D714                          ; D70D   0204 0005

        MOVR    R0,     R2                      ; D70F   0082
        ANDI    #$000C, R2                      ; D710   03BA 000C
        BNEQ    L_D695                          ; D712   022C 007E

L_D714:
        PULR    R1                              ; D714   02B1
        DECLE   $0004                           ; D715   0004

        CMPR    R6,     R4                      ; D716   0174
        SUB@    R5,     R6                      ; D717   032E
        SETC                                    ; D718   0007
        PULR    R7                              ; D719   02B7

L_D71A:
        PULR    R1                              ; D71A   02B1
        DECLE   $008A,  $02FA,  $0115,  $0290   ; D71B   008A 02FA 0115 0290
        DECLE   $0004                           ; D71F   0004

        CMPR    R6,     R4                      ; D720   0174
        SUB@    R5,     R6                      ; D721   032E
        MOVR    R1,     R2                      ; D722   008A
        ADDI    #$0318, R2                      ; D723   02FA 0318
        MVI@    R2,     R0                      ; D725   0290
        SDBD                                    ; D726   0001
        XORI    #$4000, R0                      ; D727   03F8 0000 0040
        MVO@    R0,     R2                      ; D72A   0250
        DECR    R6                              ; D72B   0016
        B       L_D36E                          ; D72C   0220 03BF

        PSHR    R5                              ; D72E   0275
        MOVR    R1,     R2                      ; D72F   008A
        ADDI    #$011B, R2                      ; D730   02FA 011B
        MVII    #$0001, R3                      ; D732   02BB 0001
        MVO@    R3,     R2                      ; D734   0253
        SUBI    #$0006, R2                      ; D735   033A 0006
        MVO@    R0,     R2                      ; D737   0250
        MVII    #$0339, R3                      ; D738   02BB 0339
        ADDR    R1,     R3                      ; D73A   00CB
        MVI@    R3,     R5                      ; D73B   029D
        MVII    #$0328, R2                      ; D73C   02BA 0328
        ADDR    R1,     R2                      ; D73E   00CA
        MVO@    R5,     R2                      ; D73F   0255
        ADDI    #$0008, R2                      ; D740   02FA 0008
        MVI@    R2,     R5                      ; D742   0295
        SDBD                                    ; D743   0001
        SUBI    #$0400, R5                      ; D744   033D 0000 0004
        SDBD                                    ; D747   0001
        ANDI    #$FF80, R5                      ; D748   03BD 0080 00FF
        INCR    R5                              ; D74B   000D
        MVO@    R5,     R2                      ; D74C   0255
        MOVR    R1,     R2                      ; D74D   008A
        ADDI    #$0145, R2                      ; D74E   02FA 0145
        CLRR    R5                              ; D750   01ED
        MVO@    R5,     R2                      ; D751   0255
        PULR    R7                              ; D752   02B7

        DECLE   $0275,  $02BA,  $0318,  $00CA   ; D753   0275 02BA 0318 00CA
        DECLE   $0290,  $0240,  $014D,  $02FA   ; D757   0290 0240 014D 02FA
        DECLE   $0008,  $0290,  $03B8,  $007F   ; D75B   0008 0290 03B8 007F
        DECLE   $0240,  $014E,  $0004           ; D75F   0240 014E 0004

        CMPR    R6,     R0                      ; D762   0170
        SUB@    R6,     R0                      ; D763   0330
        DECR    R0                              ; D764   0010
        BNEQ    L_D787                          ; D765   020C 0020

        MVI     G_014C, R0                      ; D767   0280 014C
        CMPI    #$0005, R0                      ; D769   0378 0005
        BEQ     L_D777                          ; D76B   0204 000A

        PSHR    R1                              ; D76D   0271

        JSR     R5,     L_61A1                  ; D76E   0004 0160 01A1
        DECLE   $0011                           ; D771   0011

        PULR    R1                              ; D772   02B1
        MVII    #$0005, R0                      ; D773   02B8 0005
        MVO     R0,     G_014C                  ; D775   0240 014C
L_D777:
        MVI     G_014E, R0                      ; D777   0280 014E
        CMPI    #$0010, R0                      ; D779   0378 0010
        BNEQ    L_D786                          ; D77B   020C 0009

        MVI     G_014D, R0                      ; D77D   0280 014D
        TSTR    R0                              ; D77F   0080
        BNEQ    L_D786                          ; D780   020C 0004

        JSR     R5,     L_5A1B                  ; D782   0004 0158 021B

        DECR    R6                              ; D785   0016
L_D786:
        PULR    R7                              ; D786   02B7

L_D787:
        CLRR    R0                              ; D787   01C0
        MVO     R0,     G_014C                  ; D788   0240 014C
        PULR    R7                              ; D78A   02B7

        MVII    #$0318, R2                      ; D78B   02BA 0318
        ADDR    R1,     R2                      ; D78D   00CA
        MVI@    R2,     R0                      ; D78E   0290
        SDBD                                    ; D78F   0001
        ANDI    #$FF00, R0                      ; D790   03B8 0000 00FF
        XOR     G_014D, R0                      ; D793   03C0 014D
        MVO@    R0,     R2                      ; D795   0250
        ADDI    #$0008, R2                      ; D796   02FA 0008
        MVI@    R2,     R0                      ; D798   0290
        SDBD                                    ; D799   0001
        ANDI    #$FF80, R0                      ; D79A   03B8 0080 00FF
        XOR     G_014E, R0                      ; D79D   03C0 014E
        DECR    R3                              ; D79F   0013
        BMI     L_D7AD                          ; D7A0   020B 000B

        SDBD                                    ; D7A2   0001
        ANDI    #$FBFF, R0                      ; D7A3   03B8 00FF 00FB
        DECR    R3                              ; D7A6   0013
        BMI     L_D7AD                          ; D7A7   020B 0004

        SDBD                                    ; D7A9   0001
        XORI    #$0400, R0                      ; D7AA   03F8 0000 0004
L_D7AD:
        MVO@    R0,     R2                      ; D7AD   0250
        MOVR    R5,     R7                      ; D7AE   00AF

        PSHR    R5                              ; D7AF   0275
        MVI     G_0159, R0                      ; D7B0   0280 0159
        MVI     G_014C, R5                      ; D7B2   0285 014C
        TSTR    R5                              ; D7B4   00AD
        BEQ     L_D7B9                          ; D7B5   0204 0002

        MVII    #$0010, R0                      ; D7B7   02B8 0010
L_D7B9:
        SUB     G_014D, R0                      ; D7B9   0300 014D
        BEQ     L_D7C6                          ; D7BB   0204 0009
        BGT     L_D7C3                          ; D7BD   020E 0004

        MVII    #$0008, R4                      ; D7BF   02BC 0008
        B       L_D7C7                          ; D7C1   0200 0004

L_D7C3:
        MVII    #$0004, R4                      ; D7C3   02BC 0004
        INCR    R7                              ; D7C5   000F

L_D7C6:
        CLRR    R4                              ; D7C6   01E4
L_D7C7:
        MVI     G_015A, R0                      ; D7C7   0280 015A
        MVI     G_014C, R5                      ; D7C9   0285 014C
        TSTR    R5                              ; D7CB   00AD
        BEQ     L_D7D0                          ; D7CC   0204 0002

        MVII    #$0010, R0                      ; D7CE   02B8 0010
L_D7D0:
        SUB     G_014E, R0                      ; D7D0   0300 014E
        BEQ     L_D7DD                          ; D7D2   0204 0009
        BLT     L_D7DA                          ; D7D4   0205 0004

        MVII    #$0002, R5                      ; D7D6   02BD 0002
        B       L_D7DE                          ; D7D8   0200 0004

L_D7DA:
        MVII    #$0001, R5                      ; D7DA   02BD 0001
        INCR    R7                              ; D7DC   000F

L_D7DD:
        CLRR    R5                              ; D7DD   01ED
L_D7DE:
        MVII    #$0139, R2                      ; D7DE   02BA 0139
        ADDR    R1,     R2                      ; D7E0   00CA
        MVO@    R4,     R2                      ; D7E1   0254
        ADDI    #$0006, R2                      ; D7E2   02FA 0006
        MVO@    R5,     R2                      ; D7E4   0255
        PULR    R7                              ; D7E5   02B7

        PSHR    R5                              ; D7E6   0275
        MVI     G_014C, R2                      ; D7E7   0282 014C
        TSTR    R2                              ; D7E9   0092
        BEQ     L_D7F2                          ; D7EA   0204 0006

        MVI     G_014E, R2                      ; D7EC   0282 014E
        CMPI    #$0010, R2                      ; D7EE   037A 0010
        BEQ     L_D81F                          ; D7F0   0204 002D

L_D7F2:
        MVII    #$0115, R2                      ; D7F2   02BA 0115
        ADDR    R1,     R2                      ; D7F4   00CA
        MVI@    R2,     R2                      ; D7F5   0292
        INCR    R2                              ; D7F6   000A
        ADDR    R7,     R2                      ; D7F7   00FA
        ADD@    R2,     R7                      ; D7F8   02D7

        DECLE   $0025,  $0009,  $0013,  $0025   ; D7F9   0025 0009 0013 0025
        DECLE   $001B,  $0025,  $0025,  $0025   ; D7FD   001B 0025 0025 0025
        DECLE   $0026,  $0280,  $014E,  $0004   ; D801   0026 0280 014E 0004

        CMPR    R7,     R0                      ; D805   0178
        CMPR    R6,     R4                      ; D806   0174
        SUBR    R4,     R0                      ; D807   0120
L_D808:
        MVO     R0,     G_014E                  ; D808   0240 014E
        CLRR    R3                              ; D80A   01DB
        PULR    R7                              ; D80B   02B7

        DECLE   $0280,  $014E,  $0004           ; D80C   0280 014E 0004

        CMPR    R7,     R0                      ; D80F   0178
        CMPR    R5,     R5                      ; D810   016D
        ADDR    R4,     R0                      ; D811   00E0
        B       L_D808                          ; D812   0220 000B

        DECLE   $0280,  $014D,  $0004           ; D814   0280 014D 0004

        CMPR    R7,     R0                      ; D817   0178
        CMPR    R5,     R5                      ; D818   016D
        ADDR    R4,     R0                      ; D819   00E0
        MVII    #$0001, R3                      ; D81A   02BB 0001
L_D81C:
        MVO     R0,     G_014D                  ; D81C   0240 014D
        PULR    R7                              ; D81E   02B7

L_D81F:
        MVI     G_014D, R0                      ; D81F   0280 014D
        DECLE   $0004                           ; D821   0004

        CMPR    R7,     R0                      ; D822   0178
        CMPR    R6,     R4                      ; D823   0174
        SUBR    R4,     R0                      ; D824   0120
        MVII    #$0002, R3                      ; D825   02BB 0002
        B       L_D81C                          ; D827   0220 000C

        DECLE   $0275,  $0271,  $0280,  $014D   ; D829   0275 0271 0280 014D
        DECLE   $03B8,  $0007,  $020C,  $00A0   ; D82D   03B8 0007 020C 00A0
        DECLE   $0280,  $014E,  $03B8,  $0007   ; D831   0280 014E 03B8 0007
        DECLE   $020C,  $009A,  $0004           ; D835   020C 009A 0004

        CMPR    R7,     R0                      ; D838   0178
        ADDR    R2,     R3                      ; D839   00D3
        MVI     G_014F, R2                      ; D83A   0282 014F
        MOVR    R2,     R5                      ; D83C   0095
        SDBD                                    ; D83D   0001
        ADDI    #$7A3A, R2                      ; D83E   02FA 003A 007A
        MVI@    R2,     R2                      ; D841   0292
        TSTR    R2                              ; D842   0092
        BEQ     L_D849                          ; D843   0204 0004

        MVI     G_0150, R5                      ; D845   0285 0150
        B       L_D853                          ; D847   0200 000A

L_D849:
        MOVR    R1,     R2                      ; D849   008A
        ADDI    #$0115, R2                      ; D84A   02FA 0115
L_D84C:
        MVI     G_014F, R3                      ; D84C   0283 014F
        CMP@    R2,     R3                      ; D84E   0353
        BEQ     L_D853                          ; D84F   0204 0002

        MVI     G_0150, R5                      ; D851   0285 0150
L_D853:
        MOVR    R1,     R2                      ; D853   008A
        ADDI    #$0139, R1                      ; D854   02F9 0139
        ADDI    #$013F, R2                      ; D856   02FA 013F
        MVI     G_014D, R3                      ; D858   0283 014D
        SUB     G_0159, R3                      ; D85A   0303 0159
        BPL     L_D85F                          ; D85C   0203 0001

        NEGR    R3                              ; D85E   0023
L_D85F:
        MVI     G_014E, R4                      ; D85F   0284 014E
        SUB     G_015A, R4                      ; D861   0304 015A
        BPL     L_D866                          ; D863   0203 0001

        NEGR    R4                              ; D865   0024
L_D866:
        CMPR    R3,     R4                      ; D866   015C
        BLT     L_D86B                          ; D867   0205 0002
        BGT     L_D881                          ; D869   020E 0016

L_D86B:
        MOVR    R5,     R0                      ; D86B   00A8
        AND@    R1,     R0                      ; D86C   0388
        BEQ     L_D87B                          ; D86D   0204 000C

        CMP     G_0151, R0                      ; D86F   0340 0151
        BNEQ    L_D8C5                          ; D871   020C 0052

        MOVR    R5,     R0                      ; D873   00A8
        AND@    R2,     R0                      ; D874   0390
        BNEQ    L_D8C5                          ; D875   020C 004E

        SDBD                                    ; D877   0001
        MVI@    R1,     R0                      ; D878   0288
        B       L_D8C5                          ; D879   0200 004A

L_D87B:
        MOVR    R5,     R0                      ; D87B   00A8
        DECLE   $0390,  $020C,  $0046,  $0200   ; D87C   0390 020C 0046 0200
        DECLE   $0013                           ; D880   0013
L_D881:
        MOVR    R5,     R0                      ; D881   00A8
        AND@    R2,     R0                      ; D882   0390
        BEQ     L_D890                          ; D883   0204 000B

        CMP     G_0151, R0                      ; D885   0340 0151
        BNEQ    L_D8C5                          ; D887   020C 003C

        MOVR    R5,     R0                      ; D889   00A8
        AND@    R1,     R0                      ; D88A   0388
        BNEQ    L_D8C5                          ; D88B   020C 0038

        MVI@    R2,     R0                      ; D88D   0290
        B       L_D8C5                          ; D88E   0200 0035

L_D890:
        MOVR    R5,     R0                      ; D890   00A8
        DECLE   $0388,  $020C,  $0031,  $0004   ; D891   0388 020C 0031 0004

        CMPR    R7,     R0                      ; D895   0178
        ANDR    R0,     R2                      ; D896   0182
        BC      L_D8C5                          ; D897   0201 002C

        PULR    R2                              ; D899   02B2
        PSHR    R2                              ; D89A   0272
        ADDI    #$0115, R2                      ; D89B   02FA 0115
        MVI@    R2,     R0                      ; D89D   0290
        COMR    R0                              ; D89E   0018
        AND     G_014F, R0                      ; D89F   0380 014F
        BNEQ    L_D8AC                          ; D8A1   020C 0009

        MVI     G_014F, R0                      ; D8A3   0280 014F
        TSTR    R0                              ; D8A5   0080
        BNEQ    L_D8AC                          ; D8A6   020C 0004

        MVI     G_0150, R0                      ; D8A8   0280 0150
        B       L_D8C5                          ; D8AA   0200 0019

L_D8AC:
        MVI     G_0152, R1                      ; D8AC   0281 0152
        COMR    R1                              ; D8AE   0019
        ANDR    R1,     R0                      ; D8AF   0188
        BNEQ    L_D8B6                          ; D8B0   020C 0004

        MVI     G_0152, R0                      ; D8B2   0280 0152
        B       L_D8C5                          ; D8B4   0200 000F

L_D8B6:
        MOVR    R0,     R1                      ; D8B6   0081
        MVII    #$0001, R0                      ; D8B7   02B8 0001
L_D8B9:
        SARC    R1,     1                       ; D8B9   0079
        BC      L_D8C5                          ; D8BA   0201 0009

        SLL     R0,     1                       ; D8BC   0048
        B       L_D8B9                          ; D8BD   0220 0005

        MVI@    R2,     R1                      ; D8BF   0291
        SDBD                                    ; D8C0   0001
        ADDI    #$7A31, R1                      ; D8C1   02F9 0031 007A
        MVI@    R1,     R0                      ; D8C4   0288
L_D8C5:
        PULR    R1                              ; D8C5   02B1
        PSHR    R1                              ; D8C6   0271
        ADDI    #$0115, R1                      ; D8C7   02F9 0115
        TSTR    R0                              ; D8C9   0080
        BNEQ    L_D8CE                          ; D8CA   020C 0002

        MVI     G_0151, R0                      ; D8CC   0280 0151
L_D8CE:
        MVO@    R0,     R1                      ; D8CE   0248
        MVO     R0,     G_0152                  ; D8CF   0240 0152
        PULR    R1                              ; D8D1   02B1
        PULR    R7                              ; D8D2   02B7

        DECLE   $0275,  $0271,  $01C0,  $0240   ; D8D3   0275 0271 01C0 0240
        DECLE   $014F,  $0280,  $014E,  $0060   ; D8D7   014F 0280 014E 0060
        DECLE   $0082,  $004C,  $00C2,  $0280   ; D8DB   0082 004C 00C2 0280
        DECLE   $014D,  $0064,  $0060,  $00C2   ; D8DF   014D 0064 0060 00C2
        DECLE   $02FA,  $01EB,  $0004,  $0178   ; D8E3   02FA 01EB 0004 0178
        DECLE   $0130,  $0081,  $02BC,  $0001   ; D8E7   0130 0081 02BC 0001
        DECLE   $033A,  $0014,  $0004           ; D8EB   033A 0014 0004

        CMPR    R7,     R0                      ; D8EE   0178
        SUBR    R2,     R7                      ; D8EF   0117

        DECLE   $02FA,  $0028,  $00E4,  $0004   ; D8F0   02FA 0028 00E4 0004

        CMPR    R7,     R0                      ; D8F4   0178
        SUBR    R2,     R7                      ; D8F5   0117

        DECLE   $033A,  $0013,  $00E4,  $0004   ; D8F6   033A 0013 00E4 0004

        CMPR    R7,     R0                      ; D8FA   0178
        SUBR    R2,     R7                      ; D8FB   0117

        DECLE   $033A,  $0002,  $00E4,  $0004   ; D8FC   033A 0002 00E4 0004

        CMPR    R7,     R0                      ; D900   0178
        SUBR    R2,     R7                      ; D901   0117

        MVI     G_014F, R5                      ; D902   0285 014F
        MVO     R5,     G_0150                  ; D904   0245 0150
        PULR    R1                              ; D906   02B1
        MOVR    R1,     R2                      ; D907   008A
        ADDI    #$0115, R2                      ; D908   02FA 0115
        MVI@    R2,     R2                      ; D90A   0292
        SDBD                                    ; D90B   0001
        ADDI    #$7A31, R2                      ; D90C   02FA 0031 007A
        MVI@    R2,     R0                      ; D90F   0290
        MVO     R0,     G_0151                  ; D910   0240 0151
        COMR    R0                              ; D912   0018
        ANDR    R5,     R0                      ; D913   01A8
        MVO     R0,     G_014F                  ; D914   0240 014F
        PULR    R7                              ; D916   02B7

        DECLE   $0275,  $0079,  $0209,  $0014   ; D917   0275 0079 0209 0014
        DECLE   $037A,  $02F0,  $020D,  $0010   ; D91B   037A 02F0 020D 0010
        DECLE   $0004                           ; D91F   0004

        CMPR    R7,     R0                      ; D920   0178
        SUBR    R6,     R0                      ; D921   0130
        MOVR    R4,     R5                      ; D922   00A5
        SDBD                                    ; D923   0001
        ADDI    #$7A31, R5                      ; D924   02FD 0031 007A
        AND@    R5,     R0                      ; D927   03A8
        BEQ     L_D92F                          ; D928   0204 0005

        MVI     G_014F, R0                      ; D92A   0280 014F
        XORR    R4,     R0                      ; D92C   01E0
        MVO     R0,     G_014F                  ; D92D   0240 014F
L_D92F:
        PULR    R7                              ; D92F   02B7

        MVI@    R2,     R3                      ; D930   0293
        SLR     R3,     2                       ; D931   0067
        SLR     R3,     1                       ; D932   0063
        MOVR    R3,     R0                      ; D933   0098
        ANDI    #$0100, R0                      ; D934   03B8 0100
        BEQ     L_D946                          ; D936   0204 000E

        ANDI    #$003F, R3                      ; D938   03BB 003F
        CMPI    #$0020, R3                      ; D93A   037B 0020
        BGE     L_D946                          ; D93C   020D 0008

        SDBD                                    ; D93E   0001
        ADDI    #$60ED, R3                      ; D93F   02FB 00ED 0060
        MVI@    R3,     R0                      ; D942   0298
        ANDI    #$000F, R0                      ; D943   03B8 000F
        MOVR    R5,     R7                      ; D945   00AF

L_D946:
        CLRR    R0                              ; D946   01C0
        MVI@    R2,     R3                      ; D947   0293
        ANDI    #$01F8, R3                      ; D948   03BB 01F8
        CMPI    #$0100, R3                      ; D94A   037B 0100
        BEQ     L_D96C                          ; D94C   0204 001E

        MVI     G_014E, R3                      ; D94E   0283 014E
        CMPI    #$0018, R3                      ; D950   037B 0018
        BLT     L_D956                          ; D952   0205 0002

        XORI    #$0001, R0                      ; D954   03F8 0001
L_D956:
        CMPI    #$0008, R3                      ; D956   037B 0008
        BLE     L_D95C                          ; D958   0206 0002

        XORI    #$0002, R0                      ; D95A   03F8 0002
L_D95C:
        MVI     G_014D, R3                      ; D95C   0283 014D
        CMPI    #$0008, R3                      ; D95E   037B 0008
        BLE     L_D964                          ; D960   0206 0002

        XORI    #$0008, R0                      ; D962   03F8 0008
L_D964:
        MVI     G_014D, R3                      ; D964   0283 014D
        CMPI    #$0098, R3                      ; D966   037B 0098
        BGE     L_D96C                          ; D968   020D 0002

        XORI    #$0004, R0                      ; D96A   03F8 0004
L_D96C:
        MOVR    R5,     R7                      ; D96C   00AF

        PSHR    R5                              ; D96D   0275
        SDBD                                    ; D96E   0001
        MVII    #$7A11, R5                      ; D96F   02BD 0011 007A
        B       L_D979                          ; D972   0200 0005

        PSHR    R5                              ; D974   0275
        SDBD                                    ; D975   0001
        MVII    #$7A21, R5                      ; D976   02BD 0021 007A
L_D979:
        PSHR    R0                              ; D979   0270
        ANDI    #$0007, R0                      ; D97A   03B8 0007
        ADDR    R0,     R5                      ; D97C   00C5
        ADD     G_014B, R5                      ; D97D   02C5 014B
        MVI@    R5,     R4                      ; D97F   02AC
        PULR    R0                              ; D980   02B0
        PULR    R7                              ; D981   02B7

        DECLE   $02B3,  $0273,  $009A,  $0275   ; D982   02B3 0273 009A 0275
        DECLE   $02FB,  $0145,  $0298,  $0010   ; D986   02FB 0145 0298 0010
        DECLE   $020B,  $003E,  $0258,  $0204   ; D98A   020B 003E 0258 0204
        DECLE   $0006,  $0300,  $014C,  $020B   ; D98E   0006 0300 014C 020B
        DECLE   $0002,  $020C,  $0052,  $0004   ; D992   0002 020C 0052 0004

        CMPR    R7,     R0                      ; D996   0178
        XORR    R5,     R1                      ; D997   01E9
        MOVR    R2,     R3                      ; D998   0093
        ADDI    #$0115, R2                      ; D999   02FA 0115
        MVI@    R2,     R0                      ; D99B   0290
        ANDI    #$0003, R0                      ; D99C   03B8 0003
        BNEQ    L_D9A4                          ; D99E   020C 0004

        ADDI    #$013F, R3                      ; D9A0   02FB 013F
        B       L_D9A6                          ; D9A2   0200 0002

L_D9A4:
        ADDI    #$0139, R3                      ; D9A4   02FB 0139
L_D9A6:
        SUBI    #$0115, R2                      ; D9A6   033A 0115

L_D9A8:
        JSR     R5,     L_6CE2                  ; D9A8   0004 016C 00E2

        PSHR    R3                              ; D9AB   0273
        MVII    #$003C, R3                      ; D9AC   02BB 003C
        MVI     G_0173, R5                      ; D9AE   0285 0173
        CMPI    #$0004, R5                      ; D9B0   037D 0004
        BLE     L_D9BA                          ; D9B2   0206 0006

        SLR     R3,     1                       ; D9B4   0063
        CMPI    #$0008, R5                      ; D9B5   037D 0008
        BLE     L_D9BA                          ; D9B7   0206 0001

        SLR     R3,     1                       ; D9B9   0063
L_D9BA:
        MVI     G_014C, R5                      ; D9BA   0285 014C
        TSTR    R5                              ; D9BC   00AD
        BEQ     L_D9C0                          ; D9BD   0204 0001

        SLR     R3,     1                       ; D9BF   0063
L_D9C0:
        ANDR    R3,     R0                      ; D9C0   0198
        PULR    R3                              ; D9C1   02B3
        BEQ     L_D9A8                          ; D9C2   0224 001B

        ADDI    #$0145, R2                      ; D9C4   02FA 0145
        MVO@    R0,     R2                      ; D9C6   0250
        MVI@    R3,     R0                      ; D9C7   0298
        SETC                                    ; D9C8   0007
        PULR    R7                              ; D9C9   02B7

L_D9CA:
        JSR     R5,     L_6CE2                  ; D9CA   0004 016C 00E2

        MVII    #$001F, R3                      ; D9CD   02BB 001F
        MVI     G_0173, R5                      ; D9CF   0285 0173
        CMPI    #$0004, R5                      ; D9D1   037D 0004
        BLE     L_D9DB                          ; D9D3   0206 0006

        SLR     R3,     1                       ; D9D5   0063
        CMPI    #$0008, R5                      ; D9D6   037D 0008
        BLE     L_D9DB                          ; D9D8   0206 0001

        SLR     R3,     1                       ; D9DA   0063
L_D9DB:
        MVI     G_014C, R5                      ; D9DB   0285 014C
        TSTR    R5                              ; D9DD   00AD
        BEQ     L_D9E1                          ; D9DE   0204 0001

        SLR     R3,     1                       ; D9E0   0063
L_D9E1:
        ANDR    R3,     R0                      ; D9E1   0198
        BEQ     L_D9CA                          ; D9E2   0224 0019

        ADDI    #$0145, R2                      ; D9E4   02FA 0145
        MVO@    R0,     R2                      ; D9E6   0250
L_D9E7:
        CLRC                                    ; D9E7   0006
        PULR    R7                              ; D9E8   02B7

        PSHR    R5                              ; D9E9   0275
        MOVR    R2,     R3                      ; D9EA   0093
        ADDI    #$011B, R3                      ; D9EB   02FB 011B
        MVI@    R3,     R0                      ; D9ED   0298
        DECR    R0                              ; D9EE   0010
        BNEQ    L_D9E7                          ; D9EF   022C 0009

        MVII    #$0002, R0                      ; D9F1   02B8 0002
        MVO@    R0,     R3                      ; D9F3   0258
        MOVR    R2,     R3                      ; D9F4   0093
        ADDI    #$0328, R3                      ; D9F5   02FB 0328
        MOVR    R2,     R5                      ; D9F7   0095
        ADDI    #$0339, R5                      ; D9F8   02FD 0339
        MVI@    R3,     R0                      ; D9FA   0298
        MVO@    R0,     R5                      ; D9FB   0268
        SDBD                                    ; D9FC   0001
        ANDI    #$EFF8, R0                      ; D9FD   03B8 00F8 00EF
        XORI    #$0007, R0                      ; DA00   03F8 0007
        MVO@    R0,     R3                      ; DA02   0258
        ADDI    #$0008, R3                      ; DA03   02FB 0008
        MVI@    R3,     R0                      ; DA05   0298
        SDBD                                    ; DA06   0001
        ADDI    #$0400, R0                      ; DA07   02F8 0000 0004
        SDBD                                    ; DA0A   0001
        ANDI    #$FF80, R0                      ; DA0B   03B8 0080 00FF
        INCR    R0                              ; DA0E   0008
        MVO@    R0,     R3                      ; DA0F   0258
        PULR    R7                              ; DA10   02B7

        DECLE   $0001,  $0001,  $0001,  $0001   ; DA11   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; DA15   0001 0001 0001 0001
        DECLE   $0001,  $0002,  $0001,  $0001   ; DA19   0001 0002 0001 0001
        DECLE   $0001,  $0002,  $0001,  $0001   ; DA1D   0001 0002 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; DA21   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; DA25   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0002   ; DA29   0001 0001 0001 0002
        DECLE   $0001,  $0001,  $0001,  $0002   ; DA2D   0001 0001 0001 0002
        DECLE   $0000,  $0002,  $0001,  $0000   ; DA31   0000 0002 0001 0000
        DECLE   $0008,  $0000,  $0000,  $0000   ; DA35   0008 0000 0000 0000
        DECLE   $0004,  $0001,  $0000,  $0000   ; DA39   0004 0001 0000 0000
        DECLE   $0001,  $0000,  $0001,  $0001   ; DA3D   0001 0000 0001 0001
        DECLE   $0001,  $0000,  $0001,  $0001   ; DA41   0001 0000 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; DA45   0001 0001 0001 0001
        DECLE   $0001,  $0000,  $0064,  $0002   ; DA49   0001 0000 0064 0002
        DECLE   $0002,  $0000,  $0068,  $0002   ; DA4D   0002 0000 0068 0002
        DECLE   $0003,  $0000,  $0070,  $0002   ; DA51   0003 0000 0070 0002
        DECLE   $0005,  $0000,  $006C,  $0002   ; DA55   0005 0000 006C 0002
        DECLE   $0004,  $0000,  $0074,  $0002   ; DA59   0004 0000 0074 0002
        DECLE   $0006,  $0000,  $0078,  $0003   ; DA5D   0006 0000 0078 0003
        DECLE   $0001                           ; DA61   0001

        PSHR    R5                              ; DA62   0275

        JSR     R5,     L_61A1                  ; DA63   0004 0160 01A1
        DECLE   $000E                           ; DA66   000E

        MVII    #$034D, R5                      ; DA67   02BD 034D
        MVII    #$0169, R1                      ; DA69   02B9 0169
        MVII    #$0002, R3                      ; DA6B   02BB 0002
        ADDI    #$0005, R1                      ; DA6D   02F9 0005
L_DA6F:
        CLRR    R0                              ; DA6F   01C0
        MVII    #$0003, R2                      ; DA70   02BA 0003
L_DA72:
        ADD@    R1,     R0                      ; DA72   02C8
        DECR    R1                              ; DA73   0011
        DECR    R2                              ; DA74   0012
        BEQ     L_DA7D                          ; DA75   0204 0006

        SLL     R0,     1                       ; DA77   0048
        PSHR    R0                              ; DA78   0270
        SLL     R0,     2                       ; DA79   004C
        ADD@    R6,     R0                      ; DA7A   02F0
        B       L_DA72                          ; DA7B   0220 000A

L_DA7D:
        DECR    R3                              ; DA7D   0013
        BEQ     L_DA83                          ; DA7E   0204 0003

        MOVR    R0,     R4                      ; DA80   0084
        B       L_DA6F                          ; DA81   0220 0013

L_DA83:
        CMP@    R5,     R4                      ; DA83   036C
        DECLE   $020E,  $0005,  $0205,  $0019   ; DA84   020E 0005 0205 0019
        DECLE   $0368,  $0206,  $0016,  $02BD   ; DA88   0368 0206 0016 02BD
        DECLE   $034D,  $026C,  $0268,  $01C0   ; DA8C   034D 026C 0268 01C0
        DECLE   $0240,  $0157,  $0001,  $02B8   ; DA90   0240 0157 0001 02B8
        DECLE   $00F2,  $007A,  $0240,  $0100   ; DA94   00F2 007A 0240 0100
        DECLE   $0040,  $0240,  $0101,  $0002   ; DA98   0040 0240 0101 0002
        DECLE   $0280,  $0157,  $0080,  $0224   ; DA9C   0280 0157 0080 0224
        DECLE   $0005,  $0004,  $0178,  $02B6   ; DAA0   0005 0004 0178 02B6
        DECLE   $02B8,  $003F,  $0240,  $01F8   ; DAA4   02B8 003F 0240 01F8
        DECLE   $0280,  $01FE,  $03C0,  $01FF   ; DAA8   0280 01FE 03C0 01FF
        DECLE   $022C,  $000C,  $0004,  $0178   ; DAAC   022C 000C 0004 0178
        DECLE   $02E4,  $02BE,  $02F0,  $0004   ; DAB0   02E4 02BE 02F0 0004

        CMP@    R6,     R0                      ; DAB4   0370
        ADCR    R2                              ; DAB5   002A
        PSHR    R5                              ; DAB6   0275
        MVII    #$0318, R4                      ; DAB7   02BC 0318
        MVII    #$0234, R1                      ; DAB9   02B9 0234
        MVII    #$0004, R0                      ; DABB   02B8 0004
L_DABD:
        MVO@    R1,     R4                      ; DABD   0261
        ADDI    #$0008, R1                      ; DABE   02F9 0008
        DECR    R0                              ; DAC0   0010
        BNEQ    L_DABD                          ; DAC1   022C 0005

        MVO     R0,     G_0114                  ; DAC3   0240 0114
        ADDI    #$0008, R1                      ; DAC5   02F9 0008
        MVII    #$0004, R0                      ; DAC7   02B8 0004
L_DAC9:
        MVO@    R1,     R4                      ; DAC9   0261
        ADDI    #$0008, R1                      ; DACA   02F9 0008
        DECR    R0                              ; DACC   0010
        BNEQ    L_DAC9                          ; DACD   022C 0005

        MVII    #$0058, R1                      ; DACF   02B9 0058
        MVII    #$0008, R0                      ; DAD1   02B8 0008

        JSR     R5,     L_6D00                  ; DAD3   0004 016C 0100

        MVII    #$0008, R0                      ; DAD6   02B8 0008

        JSR     R5,     L_6D21                  ; DAD8   0004 016C 0121
        DECLE   $013E,  $020E,  $026E,  $022E   ; DADB   013E 020E 026E 022E
        DECLE   $017E                           ; DADF   017E

        PULR    R6                              ; DAE0   02B6
        BGT     L_D84C                          ; DAE1   022E 0296
        PULR    R7                              ; DAE3   02B7

L_DAE4:
        EIS                                     ; DAE4   0002
        MVI     G_01AB, R0                      ; DAE5   0280 01AB
        XOR     G_01AE, R0                      ; DAE7   03C0 01AE
        BNEQ    L_DAF1                          ; DAE9   020C 0006

        MVI     G_01AA, R0                      ; DAEB   0280 01AA
        XOR     G_01AD, R0                      ; DAED   03C0 01AD
        BEQ     L_DAE4                          ; DAEF   0224 000C
L_DAF1:
        MOVR    R5,     R7                      ; DAF1   00AF

        PSHR    R5                              ; DAF2   0275
        MVO     R0,     .STIC.VIDEN             ; DAF3   0240 0020
        SDBD                                    ; DAF5   0001
        MVII    #$3930, R4                      ; DAF6   02BC 0030 0039
        SDBD                                    ; DAF9   0001
        MVII    #$3948, R1                      ; DAFA   02B9 0048 0039
        MVII    #$0018, R0                      ; DAFD   02B8 0018

        JSR     R5,     L_6D27                  ; DAFF   0004 016C 0127

        INCR    R0                              ; DB02   0008
        MVO     R0,     G_0157                  ; DB03   0240 0157
        SDBD                                    ; DB05   0001
        MVII    #$710E, R0                      ; DB06   02B8 000E 0071
        MVO     R0,     .ISRVEC.0               ; DB09   0240 0100
        SWAP    R0,     1                       ; DB0B   0040
        MVO     R0,     .ISRVEC.1               ; DB0C   0240 0101
        PULR    R7                              ; DB0E   02B7

        DECLE   $0030,  $00FF,  $00BC,  $00F8   ; DB0F   0030 00FF 00BC 00F8
        DECLE   $00F0,  $00F0,  $00B0,  $00F8   ; DB13   00F0 00F0 00B0 00F8
        DECLE   $00F8,  $00FF,  $003F           ; DB17   00F8 00FF 003F

        COMR    R3                              ; DB1A   001B
        INCR    R7                              ; DB1B   000F

        INCR    R5                              ; DB1C   000D
L_DB1D:
        INCR    R7                              ; DB1D   000F

        DECLE   $001F                           ; DB1E   001F
L_DB1F:
        RSWD    R3                              ; DB1F   003B
        DECLE   $00FF,  $00BF,  $00FB,  $00FF   ; DB20   00FF 00BF 00FB 00FF
        DECLE   $00E1,  $0081,  $0080,  $0080   ; DB24   00E1 0081 0080 0080
        DECLE   $0080,  $0080,  $00C1,  $00E3   ; DB28   0080 0080 00C1 00E3
        DECLE   $00FD,  $00BF,  $00FF,  $00FB   ; DB2C   00FD 00BF 00FF 00FB
        DECLE   $00FF,  $00A0,  $00C0,  $0080   ; DB30   00FF 00A0 00C0 0080
        DECLE   $0080,  $0080,  $00C0,  $00E0   ; DB34   0080 0080 00C0 00E0
        DECLE   $00FF,  $0003,  $0001,  $0000   ; DB38   00FF 0003 0001 0000
        DECLE   $0000,  $0000,  $0001,  $0003   ; DB3C   0000 0000 0001 0003
        DECLE   $00FF,  $00A3,  $00C1,  $0080   ; DB40   00FF 00A3 00C1 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; DB44   0080 0080 0080 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; DB48   0080 0080 0080 0080
        DECLE   $0080,  $0080,  $00C1,  $00E3   ; DB4C   0080 0080 00C1 00E3
        DECLE   $00FF,  $0000,  $0000,  $0000   ; DB50   00FF 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB54   0000 0000 0000 0000
        DECLE   $0080,  $0080,  $0080,  $0080   ; DB58   0080 0080 0080 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; DB5C   0080 0080 0080 0080
        DECLE   $00FF,  $003C,  $0018,  $0000   ; DB60   00FF 003C 0018 0000
        DECLE   $0000,  $0000,  $0018,  $0038   ; DB64   0000 0000 0018 0038
        DECLE   $0080,  $0080,  $00C1,  $00E3   ; DB68   0080 0080 00C1 00E3
        DECLE   $00E1,  $0081,  $0080,  $0080   ; DB6C   00E1 0081 0080 0080
        DECLE   $00FF,  $0020,  $0000,  $0000   ; DB70   00FF 0020 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0020   ; DB74   0000 0000 0000 0020
        DECLE   $0080,  $0080,  $00C1,  $0080   ; DB78   0080 0080 00C1 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; DB7C   0080 0080 0080 0080
        DECLE   $00FF,  $0020,  $0000,  $0000   ; DB80   00FF 0020 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB84   0000 0000 0000 0000
        DECLE   $0080,  $0080,  $00C0,  $0080   ; DB88   0080 0080 00C0 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; DB8C   0080 0080 0080 0080
        DECLE   $00FF,  $00BC,  $00F8,  $00F0   ; DB90   00FF 00BC 00F8 00F0
        DECLE   $00E0,  $0080,  $0080,  $0080   ; DB94   00E0 0080 0080 0080
        DECLE   $0000,  $0000,  $0001           ; DB98   0000 0000 0001

        DIS                                     ; DB9B   0003
        INCR    R5                              ; DB9C   000D
        INCR    R7                              ; DB9D   000F

        DECLE   $001F                           ; DB9E   001F
L_DB9F:
        RSWD    R3                              ; DB9F   003B
        DECLE   $00FF,  $003F,  $001B,  $000F   ; DBA0   00FF 003F 001B 000F
        DECLE   $0001,  $0001,  $0000,  $0000   ; DBA4   0001 0001 0000 0000
        DECLE   $0080,  $0080,  $00C0,  $00E0   ; DBA8   0080 0080 00C0 00E0
        DECLE   $00F0,  $00B0,  $00F8,  $00F8   ; DBAC   00F0 00B0 00F8 00F8
        DECLE   $00FF,  $003C,  $0018,  $0000   ; DBB0   00FF 003C 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DBB4   0000 0000 0000 0000
        DECLE   $0080,  $0080,  $00C0,  $00E0   ; DBB8   0080 0080 00C0 00E0
        DECLE   $00E0,  $0080,  $0080,  $0080   ; DBBC   00E0 0080 0080 0080
        DECLE   $0000,  $0000,  $0001,  $0003   ; DBC0   0000 0000 0001 0003
        DECLE   $0001,  $0001,  $0000,  $0000   ; DBC4   0001 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DBC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0038   ; DBCC   0000 0000 0018 0038
        DECLE   $0000,  $0000,  $0001,  $0000   ; DBD0   0000 0000 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DBD4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DBD8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0020   ; DBDC   0000 0000 0000 0020
        DECLE   $00FF,  $00A0,  $00C0,  $0080   ; DBE0   00FF 00A0 00C0 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; DBE4   0080 0080 0080 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; DBE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0003   ; DBEC   0000 0000 0001 0003
        DECLE   $00FF,  $0003,  $0001,  $0000   ; DBF0   00FF 0003 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DBF4   0000 0000 0000 0000
        DECLE   $0080,  $0080,  $0080,  $0080   ; DBF8   0080 0080 0080 0080
        DECLE   $0080,  $0080,  $00C0,  $00E0   ; DBFC   0080 0080 00C0 00E0
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC00   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC04   0000 0000 0000 0000
        DECLE   $00FF,  $00BF,  $00FB,  $00FF   ; DC08   00FF 00BF 00FB 00FF
        DECLE   $00FD,  $00BF,  $00FF,  $00FB   ; DC0C   00FD 00BF 00FF 00FB
        DECLE   $00FF,  $00C7,  $0083,  $0001   ; DC10   00FF 00C7 0083 0001
        DECLE   $0001,  $0083,  $00C3,  $00F7   ; DC14   0001 0083 00C3 00F7
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC1C   0000 0000 0000 0000
        DECLE   $0080,  $00E0,  $00F8,  $00FC   ; DC20   0080 00E0 00F8 00FC
        DECLE   $00AE,  $00FE,  $00F7,  $00BD   ; DC24   00AE 00FE 00F7 00BD
        DECLE   $00FF,  $00DB,  $007F,  $00FE   ; DC28   00FF 00DB 007F 00FE
        DECLE   $00FE,  $00B8,  $00F0,  $00C0   ; DC2C   00FE 00B8 00F0 00C0
        DECLE   $00E0,  $00F9,  $0074,  $00DE   ; DC30   00E0 00F9 0074 00DE
        DECLE   $00FB,  $00BF,  $00EF,  $00FF   ; DC34   00FB 00BF 00EF 00FF
        DECLE   $007B,  $00FF,  $00EF,  $007A   ; DC38   007B 00FF 00EF 007A
        DECLE   $00FC,  $00B8,  $00F2,  $00E0   ; DC3C   00FC 00B8 00F2 00E0
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC40   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC44   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC48   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC4C   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC50   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC54   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $0088,  $00AA,  $00AA   ; DC58   00FF 0088 00AA 00AA
        DECLE   $00AA,  $0088,  $00FF,  $00FF   ; DC5C   00AA 0088 00FF 00FF
        DECLE   $00FF,  $0088,  $00AA,  $00AA   ; DC60   00FF 0088 00AA 00AA
        DECLE   $00AA,  $0088,  $00FF,  $00FF   ; DC64   00AA 0088 00FF 00FF
        DECLE   $00FF,  $0088,  $00AA,  $00AA   ; DC68   00FF 0088 00AA 00AA
        DECLE   $00AA,  $0088,  $00FF,  $00FF   ; DC6C   00AA 0088 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC70   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC74   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC78   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC7C   00FF 00FF 00FF 00FF
        DECLE   $0000,  $000C,  $003E,  $007F   ; DC80   0000 000C 003E 007F
        DECLE   $00E0,  $007F,  $003F,  $0000   ; DC84   00E0 007F 003F 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC8C   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0020,  $007D   ; DC90   0001 0000 0020 007D
        DECLE   $0000,  $0000,  $0040,  $007D   ; DC94   0000 0000 0040 007D
        DECLE   $0000,  $0000,  $0080,  $007D   ; DC98   0000 0000 0080 007D
        DECLE   $0001,  $0000,  $0050,  $007D   ; DC9C   0001 0000 0050 007D
        DECLE   $0000,  $0000,  $0070,  $007D   ; DCA0   0000 0000 0070 007D
        DECLE   $0000,  $0000,  $0080,  $007D   ; DCA4   0000 0000 0080 007D
        DECLE   $0021,  $0001,  $0090,  $007D   ; DCA8   0021 0001 0090 007D
        DECLE   $0001,  $0001,  $0030,  $007E   ; DCAC   0001 0001 0030 007E
        DECLE   $0000,  $0000,  $0050,  $007E   ; DCB0   0000 0000 0050 007E
        DECLE   $0000,  $0000,  $00B0,  $007D   ; DCB4   0000 0000 00B0 007D
        DECLE   $0000,  $0000,  $00C0,  $007D   ; DCB8   0000 0000 00C0 007D
        DECLE   $0000,  $0000,  $0050,  $007E   ; DCBC   0000 0000 0050 007E
        DECLE   $0000,  $0000,  $0050,  $007E   ; DCC0   0000 0000 0050 007E
        DECLE   $0001,  $0001,  $00D0,  $007D   ; DCC4   0001 0001 00D0 007D
        DECLE   $0001,  $0001,  $0010,  $007E   ; DCC8   0001 0001 0010 007E
        DECLE   $0000,  $0000,  $0060,  $007E   ; DCCC   0000 0000 0060 007E
        DECLE   $0000,  $0000,  $00F0,  $007D   ; DCD0   0000 0000 00F0 007D
        DECLE   $0000,  $0000,  $0000,  $007E   ; DCD4   0000 0000 0000 007E
        DECLE   $0000,  $0000,  $0060,  $007E   ; DCD8   0000 0000 0060 007E
        DECLE   $0000,  $0000,  $0060,  $007E   ; DCDC   0000 0000 0060 007E
        DECLE   $00F4,  $0000,  $0070,  $007E   ; DCE0   00F4 0000 0070 007E
        DECLE   $00F4,  $0000,  $00C0,  $007E   ; DCE4   00F4 0000 00C0 007E
        DECLE   $0000,  $0000,  $0010,  $007F   ; DCE8   0000 0000 0010 007F
        DECLE   $0000,  $0000,  $0020,  $007F   ; DCEC   0000 0000 0020 007F
        DECLE   $0000,  $0000,  $0030,  $007F   ; DCF0   0000 0000 0030 007F
        DECLE   $0000,  $0000,  $0040,  $007F   ; DCF4   0000 0000 0040 007F
        DECLE   $0000,  $0000,  $0050,  $007F   ; DCF8   0000 0000 0050 007F
        DECLE   $0000,  $0000,  $0060,  $007F   ; DCFC   0000 0000 0060 007F
        DECLE   $0000,  $0000,  $0070,  $007F   ; DD00   0000 0000 0070 007F
        DECLE   $0000,  $0000,  $0080,  $007F   ; DD04   0000 0000 0080 007F
        DECLE   $0000,  $0000,  $0090,  $007F   ; DD08   0000 0000 0090 007F
        DECLE   $0000,  $0000,  $00A0,  $007F   ; DD0C   0000 0000 00A0 007F
        DECLE   $0000,  $0000,  $00B0,  $007F   ; DD10   0000 0000 00B0 007F
        DECLE   $0000,  $0000,  $00C0,  $007F   ; DD14   0000 0000 00C0 007F
        DECLE   $0000,  $0000,  $00D0,  $007F   ; DD18   0000 0000 00D0 007F
        DECLE   $0000,  $0000,  $00E0,  $007F   ; DD1C   0000 0000 00E0 007F
        DECLE   $0000,  $0000,  $0018,  $0038   ; DD20   0000 0000 0018 0038
        DECLE   $007C,  $00FE,  $0080,  $00C0   ; DD24   007C 00FE 0080 00C0
        DECLE   $00F8,  $0078,  $0000,  $00D8   ; DD28   00F8 0078 0000 00D8
        DECLE   $0078,  $0030,  $0020,  $0030   ; DD2C   0078 0030 0020 0030
        DECLE   $0000,  $0000,  $0018,  $0038   ; DD30   0000 0000 0018 0038
        DECLE   $007C,  $00FE,  $0080,  $00C0   ; DD34   007C 00FE 0080 00C0
        DECLE   $00FC,  $007C,  $0000,  $005C   ; DD38   00FC 007C 0000 005C
        DECLE   $00F8,  $00F0,  $0090,  $00D8   ; DD3C   00F8 00F0 0090 00D8
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $007E,  $003E   ; DD44   0000 0000 007E 003E
        DECLE   $0000,  $0002,  $00FF,  $0022   ; DD48   0000 0002 00FF 0022
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD50   0000 0000 0000 0000
        DECLE   $0000                           ; DD54   0000

        DECR    R4                              ; DD55   0014
        RLC     R1,     2                       ; DD56   0055
        ADDR    R2,     R5                      ; DD57   00D5
        ADDR    R2,     R7                      ; DD58   00D7
        ADDR    R2,     R7                      ; DD59   00D7

        DECLE   $00D4,  $0054,  $0070,  $0060   ; DD5A   00D4 0054 0070 0060
        DECLE   $0020,  $0000,  $0000,  $0000   ; DD5E   0020 0000 0000 0000
        DECLE   $0000,  $0000                   ; DD62   0000 0000

        DECR    R5                              ; DD64   0015
        DECR    R5                              ; DD65   0015
        RLC     R3,     2                       ; DD66   0057
        ADDR    R2,     R7                      ; DD67   00D7

        DECLE   $00D4,  $00D5,  $00D5,  $0057   ; DD68   00D4 00D5 00D5 0057
        DECLE   $0077,  $0060,  $0020,  $0000   ; DD6C   0077 0060 0020 0000
        DECLE   $0008,  $0008,  $001C,  $001C   ; DD70   0008 0008 001C 001C
        DECLE   $0008,  $0028,  $0028,  $0028   ; DD74   0008 0028 0028 0028
        DECLE   $0028,  $0028,  $0028,  $0028   ; DD78   0028 0028 0028 0028
        DECLE   $0008,  $0008,  $0008,  $0000   ; DD7C   0008 0008 0008 0000
        DECLE   $0018,  $007C,  $00FE,  $00FE   ; DD80   0018 007C 00FE 00FE
        DECLE   $00C0,  $00FC,  $00FC,  $007C   ; DD84   00C0 00FC 00FC 007C
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $003E,  $007F   ; DD90   0000 0000 003E 007F
        DECLE   $006D,  $006D,  $007F,  $007F   ; DD94   006D 006D 007F 007F
        DECLE   $007F,  $003E,  $0024,  $0024   ; DD98   007F 003E 0024 0024
        DECLE   $0024,  $0036,  $0000,  $0000   ; DD9C   0024 0036 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDA0   0000 0000 0000 0000
        DECLE   $0000,  $003E,  $007F,  $006D   ; DDA4   0000 003E 007F 006D
        DECLE   $006D,  $007F,  $007F,  $007F   ; DDA8   006D 007F 007F 007F
        DECLE   $003E,  $0024,  $0024,  $0036   ; DDAC   003E 0024 0024 0036
        DECLE   $0000,  $0000,  $003C,  $007E   ; DDB0   0000 0000 003C 007E
        DECLE   $00DB,  $00DB,  $00FF,  $00FF   ; DDB4   00DB 00DB 00FF 00FF
        DECLE   $007F,  $007E,  $003C,  $0024   ; DDB8   007F 007E 003C 0024
        DECLE   $0066,  $0000,  $0000,  $0000   ; DDBC   0066 0000 0000 0000
        DECLE   $0000,  $007C,  $006A,  $007E   ; DDC0   0000 007C 006A 007E
        DECLE   $00FE,  $00F2,  $00E1,  $00E2   ; DDC4   00FE 00F2 00E1 00E2
        DECLE   $00F0,  $00E1,  $007A,  $007F   ; DDC8   00F0 00E1 007A 007F
        DECLE   $003C,  $0066,  $0000,  $0000   ; DDCC   003C 0066 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; DDD0   0000 0000 0000 003C
        DECLE   $006E,  $007E,  $0070,  $0030   ; DDD4   006E 007E 0070 0030
        DECLE   $00FE,  $007C,  $0038,  $003C   ; DDD8   00FE 007C 0038 003C
        DECLE   $003C,  $003C,  $00F8,  $004C   ; DDDC   003C 003C 00F8 004C
        DECLE   $0000,  $0000,  $0000,  $003C   ; DDE0   0000 0000 0000 003C
        DECLE   $006E,  $007E,  $007E,  $003E   ; DDE4   006E 007E 007E 003E
        DECLE   $00FC,  $0070,  $0038,  $003C   ; DDE8   00FC 0070 0038 003C
        DECLE   $003C,  $0038,  $00FC,  $0046   ; DDEC   003C 0038 00FC 0046
        DECLE   $0000,  $0000,  $003C,  $007E   ; DDF0   0000 0000 003C 007E
        DECLE   $006E,  $007E,  $007E,  $007F   ; DDF4   006E 007E 007E 007F
        DECLE   $003F,  $00FF,  $007F,  $003F   ; DDF8   003F 00FF 007F 003F
        DECLE   $00FE,  $00FE,  $0044,  $0000   ; DDFC   00FE 00FE 0044 0000
        DECLE   $003E,  $007D,  $00DE,  $00F9   ; DE00   003E 007D 00DE 00F9
        DECLE   $00EA,  $00F1,  $0064,  $00F0   ; DE04   00EA 00F1 0064 00F0
        DECLE   $00F9,  $0071,  $00FA,  $00FF   ; DE08   00F9 0071 00FA 00FF
        DECLE   $00FE,  $007D,  $0000,  $0000   ; DE0C   00FE 007D 0000 0000
        DECLE   $0000,  $0000,  $006C,  $00AA   ; DE10   0000 0000 006C 00AA
        DECLE   $00AA,  $0044,  $0000,  $0010   ; DE14   00AA 0044 0000 0010
        DECLE   $0028,  $0044,  $0054,  $006C   ; DE18   0028 0044 0054 006C
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE1C   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; DE20   0000 0000

        MOVR    R0,     R2                      ; DE22   0082
        ADDR    R4,     R7                      ; DE23   00E7

        DECLE   $0092,  $0092,  $006C,  $0000   ; DE24   0092 0092 006C 0000
        DECLE   $0000,  $0044,  $007C,  $006C   ; DE28   0000 0044 007C 006C
        DECLE   $0028,  $0010,  $0000,  $0000   ; DE2C   0028 0010 0000 0000
        DECLE   $0000,  $0000,  $0038,  $007C   ; DE30   0000 0000 0038 007C
        DECLE   $00FE,  $0092,  $00FE,  $00FE   ; DE34   00FE 0092 00FE 00FE
        DECLE   $006C,  $0000,  $0000,  $0000   ; DE38   006C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0038   ; DE40   0000 0000 0000 0038
        DECLE   $007C,  $00FE,  $00D6,  $00D6   ; DE44   007C 00FE 00D6 00D6
        DECLE   $00FE,  $006C,  $0000,  $0000   ; DE48   00FE 006C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE4C   0000 0000 0000 0000
        DECLE   $003E,  $007F,  $0049,  $007F   ; DE50   003E 007F 0049 007F
        DECLE   $007F,  $007F,  $0000,  $0000   ; DE54   007F 007F 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE5C   0000 0000 0000 0000
        DECLE   $003C,  $006E,  $007E,  $007E   ; DE60   003C 006E 007E 007E
        DECLE   $007E,  $003C,  $0000,  $0000   ; DE64   007E 003C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE68   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE6C   0000 0000 0000 0000
        DECLE   $0010,  $0030,  $007C,  $00FE   ; DE70   0010 0030 007C 00FE
        DECLE   $0080,  $00C0,  $00FC,  $007C   ; DE74   0080 00C0 00FC 007C
        DECLE   $003C,  $003D,  $003F,  $003A   ; DE78   003C 003D 003F 003A
        DECLE   $0010,  $0010,  $001C,  $0018   ; DE7C   0010 0010 001C 0018
        DECLE   $0030,  $0030,  $0078,  $0070   ; DE80   0030 0030 0078 0070
        DECLE   $0060,  $00C0,  $008C,  $009D   ; DE84   0060 00C0 008C 009D
        DECLE   $00FD,  $003F,  $003E,  $003E   ; DE88   00FD 003F 003E 003E
        DECLE   $0007,  $0003,  $0001,  $0001   ; DE8C   0007 0003 0001 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE94   0000 0000 0000 0000
        DECLE   $0000                           ; DE98   0000

        INCR    R5                              ; DE99   000D
        ADDR    R1,     R7                      ; DE9A   00CF

        DECLE   $00CA,  $00D8,  $0051,  $007F   ; DE9B   00CA 00D8 0051 007F
        DECLE   $007F,  $0010,  $0092,  $0092   ; DE9F   007F 0010 0092 0092
        DECLE   $0054,  $0044,  $0000,  $0000   ; DEA3   0054 0044 0000 0000
        DECLE   $00C6,  $00C6,  $0000,  $0000   ; DEA7   00C6 00C6 0000 0000
        DECLE   $0044,  $0054,  $0092,  $0092   ; DEAB   0044 0054 0092 0092
        DECLE   $0010,  $0000,  $0000,  $0000   ; DEAF   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEB3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEB7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEBB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEBF   0000 0000 0000 0000
        DECLE   $0000,  $007E,  $003E,  $0001   ; DEC3   0000 007E 003E 0001
        DECLE   $0003,  $0040,  $0040,  $0040   ; DEC7   0003 0040 0040 0040
        DECLE   $0040,  $00E0,  $0040,  $0000   ; DECB   0040 00E0 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DECF   0000 0000 0000 0000
        DECLE   $0080,  $001A,  $003A,  $0072   ; DED3   0080 001A 003A 0072
        DECLE   $0060,  $0000,  $0040,  $0040   ; DED7   0060 0000 0040 0040
        DECLE   $0040,  $0040,  $00E0,  $0040   ; DEDB   0040 0040 00E0 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEDF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEE3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0030,  $0030   ; DEE7   0000 0000 0030 0030
        DECLE   $0034,  $0024,  $002C,  $0000   ; DEEB   0034 0024 002C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEEF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEF3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEF7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEFB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEFF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF03   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF07   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF0B   0000 0000 0000 0000
        DECLE   $0000,  $000C,  $0016,  $000F   ; DF0F   0000 000C 0016 000F
        DECLE   $0005,  $001F,  $007B,  $00FF   ; DF13   0005 001F 007B 00FF
        DECLE   $00EF,  $007D,  $001F           ; DF17   00EF 007D 001F

        SETC                                    ; DF1A   0007
        INCR    R7                              ; DF1B   000F

        COMR    R2                              ; DF1C   001A
L_DF1D:
        INCR    R4                              ; DF1D   000C
        DECLE   $0000,  $0000,  $0003,  $0027   ; DF1E   0000 0000 0003 0027

        INCR    R6                              ; DF22   000E
L_DF23:
        DECR    R7                              ; DF23   0017

        DECLE   $0003,  $0007,  $001B,  $00FF   ; DF24   0003 0007 001B 00FF
        DECLE   $0037,  $001D,  $0007,  $0003   ; DF28   0037 001D 0007 0003
        DECLE   $0021,  $0003,  $0026,  $0003   ; DF2C   0021 0003 0026 0003
        DECLE   $0000,  $0001,  $0000,  $0001   ; DF30   0000 0001 0000 0001
        DECLE   $001F,  $007F,  $00F7,  $00FD   ; DF34   001F 007F 00F7 00FD
        DECLE   $007F,  $001F,  $0001,  $0000   ; DF38   007F 001F 0001 0000
        DECLE   $0001,  $0003,  $0001,  $0000   ; DF3C   0001 0003 0001 0000
        DECLE   $00E0,  $00E0,  $0020,  $0020   ; DF40   00E0 00E0 0020 0020
        DECLE   $00EE,  $00EE,  $008A,  $008A   ; DF44   00EE 00EE 008A 008A
        DECLE   $00EE,  $00EE,  $0007,  $0007   ; DF48   00EE 00EE 0007 0007
        DECLE   $0005,  $0005,  $0007,  $0007   ; DF4C   0005 0005 0007 0007
        DECLE   $00E0,  $00E0,  $0020,  $0020   ; DF50   00E0 00E0 0020 0020
        DECLE   $00EE,  $00EE,  $002A,  $002A   ; DF54   00EE 00EE 002A 002A
        DECLE   $00EE,  $00EE,  $0007,  $0007   ; DF58   00EE 00EE 0007 0007
        DECLE   $0005,  $0005,  $0007,  $0007   ; DF5C   0005 0005 0007 0007
        DECLE   $00A0,  $00A0,  $00A0,  $00A0   ; DF60   00A0 00A0 00A0 00A0
        DECLE   $00EE,  $00EE,  $002A,  $002A   ; DF64   00EE 00EE 002A 002A
        DECLE   $002E,  $002E,  $0007,  $0007   ; DF68   002E 002E 0007 0007
        DECLE   $0005,  $0005,  $0007,  $0007   ; DF6C   0005 0005 0007 0007
        DECLE   $00E0,  $00E0,  $0080,  $0080   ; DF70   00E0 00E0 0080 0080
        DECLE   $00EE,  $00EE,  $002A,  $002A   ; DF74   00EE 00EE 002A 002A
        DECLE   $00EE,  $00EE,  $0007,  $0007   ; DF78   00EE 00EE 0007 0007
        DECLE   $0005,  $0005,  $0007,  $0007   ; DF7C   0005 0005 0007 0007
        DECLE   $00E0,  $00E0,  $0080,  $0080   ; DF80   00E0 00E0 0080 0080
        DECLE   $00EE,  $00EE,  $00AA,  $00AA   ; DF84   00EE 00EE 00AA 00AA
        DECLE   $00EE,  $00EE,  $0007,  $0007   ; DF88   00EE 00EE 0007 0007
        DECLE   $0005,  $0005,  $0007,  $0007   ; DF8C   0005 0005 0007 0007
        DECLE   $0040,  $0040,  $005C,  $005C   ; DF90   0040 0040 005C 005C
        DECLE   $0054,  $0054,  $005E,  $005E   ; DF94   0054 0054 005E 005E
        DECLE   $000A,  $000A,  $000F,  $000F   ; DF98   000A 000A 000F 000F
        DECLE   $0005,  $0005                   ; DF9C   0005 0005

        SETC                                    ; DF9E   0007
        SETC                                    ; DF9F   0007
        RRC     R0,     1                       ; DFA0   0070
        DECR    R0                              ; DFA1   0010
        RRC     R0,     1                       ; DFA2   0070
        SWAP    R0,     1                       ; DFA3   0040
        RRC     R0,     1                       ; DFA4   0070
        COMR    R4                              ; DFA5   001C
        DECR    R0                              ; DFA6   0010
        COMR    R4                              ; DFA7   001C

        JSR     R4,     .EXEC.C0E               ; DFA8   0004 001C 000E
        DECLE   $000A,  $000E,  $0007,  $0005   ; DFAB   000A 000E 0007 0005
        DECLE   $0007,  $0000,  $0000,  $0050   ; DFAF   0007 0000 0000 0050
        DECLE   $0050,  $0070,  $0010,  $0010   ; DFB3   0050 0070 0010 0010
        DECLE   $001C,  $0014,  $001C,  $000E   ; DFB7   001C 0014 001C 000E
        DECLE   $000A,  $000E,  $0007,  $0005   ; DFBB   000A 000E 0007 0005
        DECLE   $0007,  $0000,  $0000,  $0070   ; DFBF   0007 0000 0000 0070
        DECLE   $0040,  $0070,  $0050,  $0070   ; DFC3   0040 0070 0050 0070
        DECLE   $001C,  $0014,  $001C,  $000E   ; DFC7   001C 0014 001C 000E
        DECLE   $000A,  $000E,  $0007,  $0005   ; DFCB   000A 000E 0007 0005
        DECLE   $0007,  $0000,  $0000,  $0070   ; DFCF   0007 0000 0000 0070
        DECLE   $0050,  $0070,  $0050,  $0070   ; DFD3   0050 0070 0050 0070
        DECLE   $001C,  $0014,  $001C,  $000E   ; DFD7   001C 0014 001C 000E
        DECLE   $000A,  $000E,  $0007,  $0005   ; DFDB   000A 000E 0007 0005
        DECLE   $0007,  $0000,  $0040,  $0040   ; DFDF   0007 0000 0040 0040
        DECLE   $0040,  $0038,  $0028,  $0038   ; DFE3   0040 0038 0028 0038
        DECLE   $001C,  $0014,  $001C,  $000E   ; DFE7   001C 0014 001C 000E
        DECLE   $000A,  $000E,  $0007,  $0005   ; DFEB   000A 000E 0007 0005

        SETC                                    ; DFEF   0007
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFFC   0000 0000 0000 0000

        ORG     $F000
        DECLE   $0062,  $0091,  $001C,  $0090   ; F000   0062 0091 001C 0090
        DECLE   $00E6,  $009A,  $0002,  $0093   ; F004   00E6 009A 0002 0093
        DECLE   $00BB,  $0094,  $0036,  $0090   ; F008   00BB 0094 0036 0090
        DECLE   $00C0,  $0000,  $0000,  $0004   ; F00C   00C0 0000 0000 0004
        DECLE   $0008,  $0004,  $0008,  $0004   ; F010   0008 0004 0008 0004
        DECLE   $01F0,  $0198,  $01E0,  $01D0   ; F014   01F0 0198 01E0 01D0
        DECLE   $01C0,  $01A8,  $01B0,  $01A0   ; F018   01C0 01A8 01B0 01A0
        DECLE   $0031,  $009E,  $0001,  $0000   ; F01C   0031 009E 0001 0000
        DECLE   $00CD,  $009D,  $0005,  $0000   ; F020   00CD 009D 0005 0000
        DECLE   $005C,  $0099,  $00C8,  $0000   ; F024   005C 0099 00C8 0000
        DECLE   $0085,  $0099,  $003C,  $0000   ; F028   0085 0099 003C 0000
        DECLE   $0052,  $009A,  $00C8,  $0000   ; F02C   0052 009A 00C8 0000
        DECLE   $0011,  $009E,  $0019,  $0000   ; F030   0011 009E 0019 0000
        DECLE   $0000,  $0000,  $0057,  $0044   ; F034   0000 0000 0057 0044
        DECLE   $0000                           ; F038   0000

        PSHR    R5                              ; F039   0275
        MVII    #$00F0, R0                      ; F03A   02B8 00F0
        MVII    #$0200, R4                      ; F03C   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; F03E   0004 0114 0338

        CLRR    R0                              ; F041   01C0
        MVO     R0,     .STIC.CS.0              ; F042   0240 0028
        MVO     R0,     .STIC.BORD              ; F044   0240 002C
        MVII    #$0007, R3                      ; F046   02BB 0007
        MVII    #$0268, R4                      ; F048   02BC 0268

        JSR     R5,     X_PRINT_R5              ; F04A   0004 0118 007B
        STRING  "Deadly Dogs!"                  ; F04D  
        DECLE   $0000                           ; F059   0000

        PULR    R7                              ; F05A   02B7

        PSHR    R5                              ; F05B   0275
        MVI     G_011A, R0                      ; F05C   0280 011A
        ANDI    #$003F, R0                      ; F05E   03B8 003F
        MVO     R0,     G_011A                  ; F060   0240 011A
        CLRR    R0                              ; F062   01C0
        MVO     R0,     G_0331                  ; F063   0240 0331
L_F065:
        MVII    #$0014, R0                      ; F065   02B8 0014

        JSR     R5,     X_RAND2                 ; F067   0004 0114 029E

        INCR    R0                              ; F06A   0008
        MVO     R0,     G_012B                  ; F06B   0240 012B
L_F06D:
        CLRR    R0                              ; F06D   01C0
        MVO     R0,     G_0176                  ; F06E   0240 0176

        JSR     R5,     X_STOP_SFX              ; F070   0004 011C 02B4

        PULR    R7                              ; F073   02B7

        PSHR    R5                              ; F074   0275
        MVI     G_011A, R0                      ; F075   0280 011A
        ANDI    #$0003, R0                      ; F077   03B8 0003
        MVO     R0,     G_011A                  ; F079   0240 011A
        MVII    #$0020, R0                      ; F07B   02B8 0020
        MVII    #$032D, R4                      ; F07D   02BC 032D

        JSR     R5,     X_FILL_ZERO             ; F07F   0004 0114 0338
        DECLE   $0283,  $015D,  $009B,  $020C   ; F082   0283 015D 009B 020C
        DECLE   $0010                           ; F086   0010

        INCR    R3                              ; F087   000B
        MVO     R3,     G_0323                  ; F088   0243 0323
        SDBD                                    ; F08A   0001
        MVII    #$90FC, R0                      ; F08B   02B8 00FC 0090
        MVO     R0,     G_0326                  ; F08E   0240 0326
        CLRR    R0                              ; F090   01C0
        MVO     R0,     G_0172                  ; F091   0240 0172
        MVO     R0,     G_0173                  ; F093   0240 0173
        B       L_F065                          ; F095   0220 0031

        DECLE   $0004                           ; F097   0004

        ANDR    R3,     R0                      ; F098   0198
L_F099:
        DECR    R7                              ; F099   0017
        B       L_F06D                          ; F09A   0220 002E

        PSHR    R5                              ; F09C   0275
        MVO     R0,     G_032B                  ; F09D   0240 032B
        PSHR    R1                              ; F09F   0271
        MVII    #$0345, R1                      ; F0A0   02B9 0345

        JSR     R5,     .EXEC.777               ; F0A2   0004 0114 0377

        SUBI    #$0004, R3                      ; F0A5   033B 0004
        ADDI    #$0004, R2                      ; F0A7   02FA 0004
        SWAP    R2,     1                       ; F0A9   0042
        XORR    R3,     R2                      ; F0AA   01DA
        SDBD                                    ; F0AB   0001
        MVII    #$1006, R4                      ; F0AC   02BC 0006 0010
        PULR    R1                              ; F0AF   02B1

        JSR     R5,     .EXEC.6F7               ; F0B0   0004 0114 02F7

        BC      L_F0C4                          ; F0B3   0201 000F

        ADDI    #$0014, R2                      ; F0B5   02FA 0014
        SDBD                                    ; F0B7   0001
        MVII    #$0E10, R4                      ; F0B8   02BC 0010 000E

        JSR     R5,     .EXEC.6F7               ; F0BB   0004 0114 02F7

        BC      L_F0C4                          ; F0BE   0201 0004

        CLRR    R0                              ; F0C0   01C0
L_F0C1:
        MVO     R0,     G_0175                  ; F0C1   0240 0175
        PULR    R7                              ; F0C3   02B7

L_F0C4:
        MVII    #$0003, R0                      ; F0C4   02B8 0003
        B       L_F0C1                          ; F0C6   0220 0006

        PSHR    R5                              ; F0C8   0275
        MVI@    R1,     R0                      ; F0C9   0288
        XORI    #$0010, R0                      ; F0CA   03F8 0010
        MVO@    R0,     R1                      ; F0CC   0248
        PULR    R7                              ; F0CD   02B7

        DECLE   $0042,  $0018,  $00EE,  $0090   ; F0CE   0042 0018 00EE 0090
        DECLE   $0000,  $0053,  $0000,  $0033   ; F0D2   0000 0053 0000 0033
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0D6   0000 0000 0000 0000
        DECLE   $003C,  $0000                   ; F0DA   003C 0000

        INCR    R7                              ; F0DC   000F
        INCR    R7                              ; F0DD   000F

L_F0DE:
        MOVR    R0,     R6                      ; F0DE   0086
L_F0DF:
        RLC     R0,     1                       ; F0DF   0050
        DECLE   $00FC,  $0090,  $0000,  $0053   ; F0E0   00FC 0090 0000 0053
        DECLE   $0000,  $0033,  $0000,  $0000   ; F0E4   0000 0033 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0E8   0000 0000 0000 0000
        DECLE   $002D,  $0000,  $0300,  $0000   ; F0EC   002D 0000 0300 0000
        DECLE   $00C3,  $0093,  $0004,  $0000   ; F0F0   00C3 0093 0004 0000
        DECLE   $0000,  $033D,  $0094,  $00C3   ; F0F4   0000 033D 0094 00C3
        DECLE   $0093,  $0003,  $0016,  $0000   ; F0F8   0093 0003 0016 0000
        DECLE   $020E,  $0094,  $0019,  $0094   ; F0FC   020E 0094 0019 0094
        DECLE   $0001                           ; F100   0001

        COMR    R4                              ; F101   001C
        DECR    R0                              ; F102   0010
        ADDR    R2,     R4                      ; F103   00D4
        MOVR    R2,     R5                      ; F104   0095
        ADDR    R6,     R0                      ; F105   00F0
        ANDR    R2,     R6                      ; F106   0196
        ADD@    R2,     R4                      ; F107   02D4
        MOVR    R2,     R5                      ; F108   0095
        ADD@    R6,     R0                      ; F109   02F0
        ANDR    R2,     R6                      ; F10A   0196
        XORR    R2,     R4                      ; F10B   01D4
        MOVR    R2,     R5                      ; F10C   0095
        XORR    R6,     R0                      ; F10D   01F0
        ANDR    R2,     R6                      ; F10E   0196
        XOR@    R2,     R4                      ; F10F   03D4
        MOVR    R2,     R5                      ; F110   0095
        XOR@    R6,     R0                      ; F111   03F0
        ANDR    R2,     R6                      ; F112   0196
        B       L_F115                          ; F113   0200 0000
L_F115:
        ADCR    R7                              ; F115   002F

        MOVR    R2,     R4                      ; F116   0094
L_F117:
        EIS                                     ; F117   0002
        DECLE   $0024,  $0000,  $0100,  $0000   ; F118   0024 0000 0100 0000
        DECLE   $007B,  $0094,  $0002,  $0026   ; F11C   007B 0094 0002 0026
        DECLE   $0000,  $0300,  $0000,  $008A   ; F120   0000 0300 0000 008A
        DECLE   $0094,  $0004,  $0008,  $0000   ; F124   0094 0004 0008 0000
        DECLE   $020E,  $0094,  $009C,  $0090   ; F128   020E 0094 009C 0090
        DECLE   $0001,  $001C,  $000A,  $00D4   ; F12C   0001 001C 000A 00D4
        DECLE   $0095,  $023F,  $0097,  $023F   ; F130   0095 023F 0097 023F
        DECLE   $0197                           ; F134   0197

        CMPR    R3,     R2                      ; F135   015A
        MOVR    R2,     R7                      ; F136   0097

        DECLE   $013F,  $0197,  $0174,  $0090   ; F137   013F 0197 0174 0090
        DECLE   $005B,  $0090,  $0001,  $0028   ; F13B   005B 0090 0001 0028
        DECLE   $0002,  $0070,  $0096,  $0100   ; F13F   0002 0070 0096 0100
        DECLE   $0000,  $0000,  $0000,  $0002   ; F143   0000 0000 0000 0002
        DECLE   $002A,  $0002,  $0070,  $0096   ; F147   002A 0002 0070 0096
        DECLE   $0100,  $0000,  $00C8,  $0090   ; F14B   0100 0000 00C8 0090
        DECLE   $0004,  $002C,  $0000,  $0100   ; F14F   0004 002C 0000 0100
        DECLE   $0000,  $0000,  $0000,  $0001   ; F153   0000 0000 0000 0001
        DECLE   $0030,  $0002,  $0037,  $0098   ; F157   0030 0002 0037 0098
        DECLE   $0100,  $0000,  $00A5,  $0094   ; F15B   0100 0000 00A5 0094
        DECLE   $0001,  $0033,  $0000,  $001C   ; F15F   0001 0033 0000 001C
        DECLE   $003E,  $0016,  $003F,  $001F   ; F163   003E 0016 003F 001F
        DECLE   $000F,  $000F,  $000F,  $001F   ; F167   000F 000F 000F 001F
        DECLE   $003F,  $003E,  $003E,  $001C   ; F16B   003F 003E 003E 001C
        DECLE   $0002,  $00EE,  $0000,  $0018   ; F16F   0002 00EE 0000 0018
        DECLE   $003C,  $007C,  $002C,  $007E   ; F173   003C 007C 002C 007E
        DECLE   $007E,  $003E,  $003E,  $001F   ; F177   007E 003E 003E 001F
        DECLE   $001F,  $001F,  $001E,  $0001   ; F17B   001F 001F 001E 0001
        DECLE   $0007,  $0010,  $0070,  $0038   ; F17F   0007 0010 0070 0038
        DECLE   $007C,  $002C,  $007C,  $007C   ; F183   007C 002C 007C 007C
        DECLE   $0078,  $0078,  $007C,  $007E   ; F187   0078 0078 007C 007E
        DECLE   $007E,  $007E,  $003E,  $001C   ; F18B   007E 007E 003E 001C
        DECLE   $0000,  $0002,  $00EE,  $0038   ; F18F   0000 0002 00EE 0038
        DECLE   $003C,  $007E,  $002E,  $007E   ; F193   003C 007E 002E 007E
        DECLE   $007E,  $003F,  $003F,  $001F   ; F197   007E 003F 003F 001F
        DECLE   $001F,  $003F,  $003E,  $00FE   ; F19B   001F 003F 003E 00FE
        DECLE   $001C,  $0002,  $000E,  $0030   ; F19F   001C 0002 000E 0030
        DECLE   $0078,  $00A8,  $00F8,  $00EC   ; F1A3   0078 00A8 00F8 00EC
        DECLE   $00FC,  $0056,  $002E,  $0026   ; F1A7   00FC 0056 002E 0026
        DECLE   $002E,  $007E,  $0074,  $006C   ; F1AB   002E 007E 0074 006C
        DECLE   $0038,  $0018,  $00EE,  $0020   ; F1AF   0038 0018 00EE 0020
        DECLE   $0050,  $00A8,  $0050,  $00CC   ; F1B3   0050 00A8 0050 00CC
        DECLE   $0028,  $0054,  $002A,  $0014   ; F1B7   0028 0054 002A 0014
        DECLE   $002A,  $0054,  $0024,  $0048   ; F1BB   002A 0054 0024 0048
        DECLE   $0030,  $0008,  $00AA,  $0020   ; F1BF   0030 0008 00AA 0020
        DECLE   $0040,  $0028,  $0050,  $0008   ; F1C3   0040 0028 0050 0008
        DECLE   $0020,  $0044,  $0008,  $0014   ; F1C7   0020 0044 0008 0014
        DECLE   $0000,  $0044,  $0020,  $0048   ; F1CB   0000 0044 0020 0048
        DECLE   $0010,  $0008,  $00AA,  $0020   ; F1CF   0010 0008 00AA 0020
        DECLE   $0000,  $0000,  $0040,  $0008   ; F1D3   0000 0000 0040 0008
        DECLE   $0020,  $0004,  $0000,  $0010   ; F1D7   0020 0004 0000 0010
        DECLE   $0000,  $0004,  $0020,  $0000   ; F1DB   0000 0004 0020 0000
        DECLE   $0010,  $0000,  $00A2,  $0000   ; F1DF   0010 0000 00A2 0000
        DECLE   $0000,  $0000,  $0070,  $0078   ; F1E3   0000 0000 0070 0078
        DECLE   $00FC,  $00AC,  $00FC,  $00FE   ; F1E7   00FC 00AC 00FC 00FE
        DECLE   $007E,  $003E,  $007E,  $007E   ; F1EB   007E 003E 007E 007E
        DECLE   $007C,  $0038,  $00EE,  $0070   ; F1EF   007C 0038 00EE 0070
        DECLE   $0078,  $00AC,  $00AC,  $00FC   ; F1F3   0078 00AC 00AC 00FC
        DECLE   $00C4,  $0056,  $003E,  $003E   ; F1F7   00C4 0056 003E 003E
        DECLE   $003E,  $007E,  $007C,  $007C   ; F1FB   003E 007E 007C 007C
        DECLE   $0038,  $0018,  $00EE,  $0000   ; F1FF   0038 0018 00EE 0000
        DECLE   $0000,  $0000,  $0070,  $0078   ; F203   0000 0000 0070 0078
        DECLE   $00FC,  $00AC,  $00FC,  $00FE   ; F207   00FC 00AC 00FC 00FE
        DECLE   $007E,  $003E,  $007E,  $007E   ; F20B   007E 003E 007E 007E
        DECLE   $007C,  $0038,  $00EE,  $0070   ; F20F   007C 0038 00EE 0070
        DECLE   $0078,  $00FC,  $00AC,  $00FC   ; F213   0078 00FC 00AC 00FC
        DECLE   $00FC,  $007E,  $003E,  $003E   ; F217   00FC 007E 003E 003E
        DECLE   $003E,  $007E,  $007C,  $007C   ; F21B   003E 007E 007C 007C
        DECLE   $0038,  $0018,  $00EE,  $0038   ; F21F   0038 0018 00EE 0038
        DECLE   $007C,  $0054,  $007C,  $003E   ; F223   007C 0054 007C 003E
        DECLE   $001E,  $001E,  $001E,  $001E   ; F227   001E 001E 001E 001E
        DECLE   $003E,  $007E,  $007C,  $0038   ; F22B   003E 007E 007C 0038
        DECLE   $00E0,  $0000,  $000E,  $0038   ; F22F   00E0 0000 000E 0038
        DECLE   $007C,  $0054,  $00FC,  $00FC   ; F233   007C 0054 00FC 00FC
        DECLE   $00FC,  $00F8,  $00F8,  $00F8   ; F237   00FC 00F8 00F8 00F8
        DECLE   $00FC,  $00FC,  $007C,  $007C   ; F23B   00FC 00FC 007C 007C
        DECLE   $0038,  $000F,  $00E0,  $0000   ; F23F   0038 000F 00E0 0000
        DECLE   $0000,  $0003,  $0003,  $0000   ; F243   0000 0003 0003 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; F247   0000 0000 0000 0002
        DECLE   $0001,  $0001,  $0000,  $0000   ; F24B   0001 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F24F   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0001,  $0001   ; F253   0000 0001 0001 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; F257   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F25B   0000 0000 0000 0000
        DECLE   $0001,  $0001,  $0001,  $0000   ; F25F   0001 0001 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F263   0000 0000 0000 0000
        DECLE   $001C,  $0000,  $0000,  $0000   ; F267   001C 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0000   ; F26B   0000 0018 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F26F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; F273   0000 0000 0000 0006
        DECLE   $0006,  $0000,  $0000,  $0000   ; F277   0006 0000 0000 0000
        DECLE   $0000,  $0020,  $0020,  $0000   ; F27B   0000 0020 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F27F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0008   ; F283   0000 0000 0004 0008
        DECLE   $0010,  $0000,  $0000,  $0000   ; F287   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0008   ; F28B   0000 0000 0010 0008
        DECLE   $0004,  $0000,  $0000,  $0008   ; F28F   0004 0000 0000 0008
        DECLE   $0000,  $0041,  $0000,  $0000   ; F293   0000 0041 0000 0000
        DECLE   $0002,  $0000,  $0000,  $0001   ; F297   0002 0000 0000 0001
        DECLE   $0020,  $0000,  $0008,  $0000   ; F29B   0020 0000 0008 0000
        DECLE   $0002,  $0000,  $0000,  $0000   ; F29F   0002 0000 0000 0000
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; F2A3   0000 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00E0,  $00E0   ; F2A7   00FF 00FF 00E0 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; F2AB   00E0 00E0 00E0 00E0
        DECLE   $00E0,  $00F0,  $00F8,  $0018   ; F2AF   00E0 00F0 00F8 0018
        DECLE   $003C,  $0042,  $0000,  $00FF   ; F2B3   003C 0042 0000 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0018   ; F2B7   00FF 00FF 00FF 0018
        DECLE   $003C,  $0000,  $0042,  $00FF   ; F2BB   003C 0000 0042 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; F2BF   00FF 00FF 00FF 0000
        DECLE   $0000,  $00F0,  $0000,  $0000   ; F2C3   0000 00F0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F2C7   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $0000,  $0000   ; F2CB   0000 003C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F2CF   0000 0000 0000 0000
        DECLE   $0000,  $000F,  $0000,  $0000   ; F2D3   0000 000F 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F2D7   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $0000,  $0000   ; F2DB   0000 003C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0036   ; F2DF   0000 0000 0000 0036
        DECLE   $0036,  $005F,  $005F,  $0021   ; F2E3   0036 005F 005F 0021
        DECLE   $0021,  $003E,  $003E,  $001C   ; F2E7   0021 003E 003E 001C
        DECLE   $001C,  $0008,  $0008,  $0008   ; F2EB   001C 0008 0008 0008
        DECLE   $0008,  $003E,  $003E,  $0000   ; F2EF   0008 003E 003E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F2F3   0000 0000 0000 0000
        DECLE   $0004,  $001B,  $0000,  $0022   ; F2F7   0004 001B 0000 0022
        DECLE   $0074,  $00B8,  $0008,  $00F0   ; F2FB   0074 00B8 0008 00F0
        DECLE   $00F0,  $00F0,  $00F0,  $0004   ; F2FF   00F0 00F0 00F0 0004
        DECLE   $0004,  $0004,  $00FF,  $0004   ; F303   0004 0004 00FF 0004
        DECLE   $0004,  $0004,  $0004,  $0008   ; F307   0004 0004 0004 0008
        DECLE   $0008,  $0008,  $0008,  $0008   ; F30B   0008 0008 0008 0008
        DECLE   $0008,  $0008,  $00FF,  $00FF   ; F30F   0008 0008 00FF 00FF
        DECLE   $0040,  $0040,  $0040,  $0040   ; F313   0040 0040 0040 0040
        DECLE   $0040,  $0040,  $0040,  $0000   ; F317   0040 0040 0040 0000
        DECLE   $00FF,  $0000,  $00FF,  $0000   ; F31B   00FF 0000 00FF 0000
        DECLE   $00FF,  $0000,  $0000,  $0000   ; F31F   00FF 0000 0000 0000
        DECLE   $00FF,  $0003,  $00FC,  $000C   ; F323   00FF 0003 00FC 000C
        DECLE   $00F0,  $0030,  $0000,  $0275   ; F327   00F0 0030 0000 0275
        DECLE   $01DB,  $0243,  $0165,  $0082   ; F32B   01DB 0243 0165 0082
        DECLE   $0281,  $0163,  $0089,  $020C   ; F32F   0281 0163 0089 020C
        DECLE   $0004,  $0004                   ; F333   0004 0004

        ANDR    R2,     R4                      ; F335   0194
        ADDR    R7,     R0                      ; F336   00F8
        PULR    R7                              ; F337   02B7

        TSTR    R0                              ; F338   0080
        BMI     L_F34E                          ; F339   020B 0013

        MVII    #$0008, R1                      ; F33B   02B9 0008
        MVO     R1,     G_0322                  ; F33D   0241 0322
        MOVR    R0,     R1                      ; F33F   0081

        JSR     R5,     .EXEC.628               ; F340   0004 0114 0228
        DECLE   $000A,  $0004                   ; F343   000A 0004

        ANDR    R2,     R4                      ; F345   0194
        ANDR    R6,     R0                      ; F346   01B0
        MOVR    R7,     R1                      ; F347   00B9
        ADDI    #$0007, R1                      ; F348   02F9 0007
        ADDR    R2,     R1                      ; F34A   00D1
        MVI@    R1,     R0                      ; F34B   0288
        MVO     R0,     G_032A                  ; F34C   0240 032A
L_F34E:
        PULR    R7                              ; F34E   02B7

        DECLE   $0002,  $0002,  $0001,  $0001   ; F34F   0002 0002 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0002   ; F353   0001 0001 0001 0002
        DECLE   $0002,  $0002,  $0003,  $0003   ; F357   0002 0002 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0002   ; F35B   0003 0003 0003 0002
        DECLE   $0275,  $01C9,  $0241,  $0165   ; F35F   0275 01C9 0241 0165
        DECLE   $00B9,  $02F9,  $0053,  $00C1   ; F363   00B9 02F9 0053 00C1
        DECLE   $0288,  $0378,  $0080,  $0204   ; F367   0288 0378 0080 0204
        DECLE   $0015,  $0281,  $031D,  $005D   ; F36B   0015 0281 031D 005D
        DECLE   $0202,  $0007,  $01E4,  $0244   ; F36F   0202 0007 01E4 0244
        DECLE   $0163,  $0004                   ; F373   0163 0004

        ANDR    R2,     R4                      ; F375   0194
        CMPR    R7,     R5                      ; F376   017D
        PULR    R7                              ; F377   02B7

        MVII    #$0325, R1                      ; F378   02B9 0325
        MVI     G_032A, R0                      ; F37A   0280 032A
        CMPI    #$0004, R0                      ; F37C   0378 0004
        BEQ     L_F41A                          ; F37E   0204 009A
        PULR    R7                              ; F380   02B7

        SDBD                                    ; F381   0001
        MVII    #$90EE, R0                      ; F382   02B8 00EE 0090
        MVO     R0,     G_031E                  ; F385   0240 031E
        MVI     G_0325, R4                      ; F387   0284 0325
        MVII    #$0008, R2                      ; F389   02BA 0008
        SWAP    R2,     1                       ; F38B   0042
        MVI     G_0163, R0                      ; F38C   0280 0163
        XORI    #$0001, R0                      ; F38E   03F8 0001
        BEQ     L_F3A5                          ; F390   0204 0013

        MVI     G_031D, R3                      ; F392   0283 031D
        SLLC    R3,     2                       ; F394   005F
        BOV     L_F3AB                          ; F395   0202 0014

        XORR    R2,     R4                      ; F397   01D4
        MVII    #$0008, R3                      ; F398   02BB 0008
        MVO     R3,     G_0322                  ; F39A   0243 0322
        MVII    #$0002, R3                      ; F39C   02BB 0002
        MVO     R3,     G_032A                  ; F39E   0243 032A
        CLRR    R3                              ; F3A0   01DB
        MVO     R3,     G_0321                  ; F3A1   0243 0321
        B       L_F3B2                          ; F3A3   0200 000D

L_F3A5:
        COMR    R2                              ; F3A5   001A
        ANDR    R2,     R4                      ; F3A6   0194
        MVII    #$0006, R1                      ; F3A7   02B9 0006
        MVO     R1,     G_032A                  ; F3A9   0241 032A
L_F3AB:
        CLRR    R0                              ; F3AB   01C0
        MVII    #$000A, R1                      ; F3AC   02B9 000A
        MVO     R1,     G_0322                  ; F3AE   0241 0322
        MVO     R0,     G_0321                  ; F3B0   0240 0321
L_F3B2:
        MVO     R0,     G_0163                  ; F3B2   0240 0163
        MVO     R4,     G_0325                  ; F3B4   0244 0325
        PULR    R7                              ; F3B6   02B7

        DECLE   $000C,  $0006,  $0004,  $0002   ; F3B7   000C 0006 0004 0002
        DECLE   $0008,  $0080,  $0000           ; F3BB   0008 0080 0000

        INCR    R2                              ; F3BE   000A
        INCR    R4                              ; F3BF   000C
        INCR    R6                              ; F3C0   000E
        INCR    R2                              ; F3C1   000A
        INCR    R6                              ; F3C2   000E
        PSHR    R5                              ; F3C3   0275
        MOVR    R1,     R5                      ; F3C4   008D
        ADDI    #$0007, R1                      ; F3C5   02F9 0007
        MVI     G_016F, R0                      ; F3C7   0280 016F
        TSTR    R0                              ; F3C9   0080
        BNEQ    L_F3EF                          ; F3CA   020C 0023
        INCR    R7                              ; F3CC   000F

        PSHR    R5                              ; F3CD   0275
L_F3CE:
        MOVR    R1,     R2                      ; F3CE   008A
        MVI@    R2,     R0                      ; F3CF   0290
        SWAP    R0,     1                       ; F3D0   0040
        ANDI    #$00FF, R0                      ; F3D1   03B8 00FF
        MVI@    R2,     R3                      ; F3D3   0293
        ANDI    #$00FF, R3                      ; F3D4   03BB 00FF
        CMPR    R0,     R3                      ; F3D6   0143
        BGE     L_F3EE                          ; F3D7   020D 0015

        MVI@    R1,     R0                      ; F3D9   0288
        ADDI    #$0005, R0                      ; F3DA   02F8 0005
        MVO@    R0,     R1                      ; F3DC   0248
        ADDI    #$0008, R1                      ; F3DD   02F9 0008
        MVI@    R1,     R0                      ; F3DF   0288
        ADDI    #$0005, R0                      ; F3E0   02F8 0005
        MVO@    R0,     R1                      ; F3E2   0248
        DECR    R2                              ; F3E3   0012
        MVII    #$0050, R0                      ; F3E4   02B8 0050
        MVI@    R5,     R5                      ; F3E6   02AD
        ANDI    #$0008, R5                      ; F3E7   03BD 0008
        BEQ     L_F3ED                          ; F3E9   0204 0002

        MVII    #$001E, R0                      ; F3EB   02B8 001E
L_F3ED:
        MVO@    R0,     R2                      ; F3ED   0250
L_F3EE:
        PULR    R7                              ; F3EE   02B7

L_F3EF:
        MVII    #$000F, R0                      ; F3EF   02B8 000F
        MVI     G_016D, R5                      ; F3F1   0285 016D
        CMPI    #$0008, R5                      ; F3F3   037D 0008
        BLT     L_F3FF                          ; F3F5   0205 0008

        MVII    #$0014, R0                      ; F3F7   02B8 0014
        CMPI    #$000E, R5                      ; F3F9   037D 000E
        BLT     L_F3FF                          ; F3FB   0205 0002

        MVII    #$0019, R0                      ; F3FD   02B8 0019
L_F3FF:
        MOVR    R0,     R5                      ; F3FF   0085
        DECLE   $0040,  $01E8,  $0240,  $0324   ; F400   0040 01E8 0240 0324
        DECLE   $02B8,  $002D,  $0240,  $032C   ; F404   02B8 002D 0240 032C
        DECLE   $02B9,  $034D,  $0004           ; F408   02B9 034D 0004

        ANDR    R3,     R0                      ; F40B   0198
        AND@    R6,     R4                      ; F40C   03B4
        PULR    R7                              ; F40D   02B7

        DECLE   $0275,  $0378,  $0001,  $020C   ; F40E   0275 0378 0001 020C
        DECLE   $0007,  $0271,  $0004           ; F412   0007 0271 0004

        ANDR    R2,     R4                      ; F415   0194
        SLR     R1,     1                       ; F416   0061
        PULR    R1                              ; F417   02B1
        INCR    R7                              ; F418   000F

        PSHR    R5                              ; F419   0275
L_F41A:
        MVI@    R1,     R0                      ; F41A   0288
        SDBD                                    ; F41B   0001
        MVII    #$F777, R3                      ; F41C   02BB 0077 00F7
        ANDR    R3,     R0                      ; F41F   0198
        COMR    R3                              ; F420   001B
        XORR    R3,     R0                      ; F421   01D8
        MVO@    R0,     R1                      ; F422   0248
        MVII    #$0005, R0                      ; F423   02B8 0005
        ADDR    R0,     R1                      ; F425   00C1
        MVO@    R0,     R1                      ; F426   0248
        INCR    R1                              ; F427   0009
        MVI     G_0162, R0                      ; F428   0280 0162
        MVO@    R0,     R1                      ; F42A   0248
        CLRR    R0                              ; F42B   01C0
        MVO     R0,     G_0162                  ; F42C   0240 0162
        PULR    R7                              ; F42E   02B7

        PSHR    R5                              ; F42F   0275
        SDBD                                    ; F430   0001
        MVII    #$9128, R5                      ; F431   02BD 0028 0091
        MOVR    R1,     R3                      ; F434   008B
        INCR    R3                              ; F435   000B
        MVO@    R5,     R3                      ; F436   025D
        MVII    #$0001, R0                      ; F437   02B8 0001
        MVO     R0,     G_0162                  ; F439   0240 0162
        B       L_F41A                          ; F43B   0220 0022

        PSHR    R5                              ; F43D   0275
        TSTR    R0                              ; F43E   0080
        BEQ     L_F462                          ; F43F   0204 0021
        INCR    R7                              ; F441   000F

        PSHR    R5                              ; F442   0275
L_F443:
        MOVR    R0,     R4                      ; F443   0084
        SLR     R0,     1                       ; F444   0060
        MVO     R0,     G_0165                  ; F445   0240 0165
        ADDI    #$0004, R1                      ; F447   02F9 0004
        MVI@    R1,     R0                      ; F449   0288
        MOVR    R1,     R3                      ; F44A   008B

        JSR     R5,     X_UNPK_BYTES            ; F44B   0004 0114 0357

        ANDI    #$0002, R2                      ; F44E   03BA 0002
        BEQ     L_F454                          ; F450   0204 0002

        NEGR    R1                              ; F452   0021
        INCR    R7                              ; F453   000F

L_F454:
        NEGR    R0                              ; F454   0020

L_F455:
        JSR     R5,     X_PACK_BYTES            ; F455   0004 0114 034F
        DECLE   $0258,  $00A2,  $007A,  $0201   ; F458   0258 00A2 007A 0201
        DECLE   $0003,  $0004                   ; F45C   0003 0004

        ANDR    R2,     R4                      ; F45E   0194
        ANDR    R6,     R0                      ; F45F   01B0
        PULR    R7                              ; F460   02B7

        PSHR    R5                              ; F461   0275
L_F462:
        MOVR    R2,     R3                      ; F462   0093
        DECLE   $0240,  $015E,  $02F9,  $0002   ; F463   0240 015E 02F9 0002
        DECLE   $0288,  $0040,  $03B8,  $00FF   ; F467   0288 0040 03B8 00FF
        DECLE   $02F9,  $0002,  $02BA,  $0014   ; F46B   02F9 0002 02BA 0014
        DECLE   $0242,  $0161,  $0001,  $02BA   ; F46F   0242 0161 0001 02BA
        DECLE   $00CB,  $0098,  $02BC,  $003E   ; F473   00CB 0098 02BC 003E
        DECLE   $0004                           ; F477   0004

        ANDR    R3,     R0                      ; F478   0198
        ADDR    R2,     R7                      ; F479   00D7
        PULR    R7                              ; F47A   02B7

        PSHR    R5                              ; F47B   0275
        MOVR    R1,     R2                      ; F47C   008A
        SDBD                                    ; F47D   0001
        MVII    #$9D93, R1                      ; F47E   02B9 0093 009D

        JSR     R5,     X_INIT_MOB              ; F481   0004 0114 02B2

        ADDI    #$0006, R2                      ; F484   02FA 0006
        MVII    #$00C8, R0                      ; F486   02B8 00C8
        MVO@    R0,     R2                      ; F488   0250
        PULR    R7                              ; F489   02B7

        PSHR    R5                              ; F48A   0275
        MOVR    R1,     R4                      ; F48B   008C
        MVII    #$0008, R0                      ; F48C   02B8 0008

        JSR     R5,     X_FILL_ZERO             ; F48E   0004 0114 0338

        PULR    R7                              ; F491   02B7

        PSHR    R5                              ; F492   0275

        JSR     R5,     .EXEC.760               ; F493   0004 0114 0360

        BEQ     L_F4A3                          ; F496   0204 000B

        MOVR    R1,     R5                      ; F498   008D
        INCR    R5                              ; F499   000D
        SDBD                                    ; F49A   0001
        MVII    #$9121, R0                      ; F49B   02B8 0021 0091
        CMP@    R5,     R0                      ; F49E   0368
        BEQ     L_F4A3                          ; F49F   0204 0002

        CLRC                                    ; F4A1   0006
        PULR    R7                              ; F4A2   02B7

L_F4A3:
        SETC                                    ; F4A3   0007
        PULR    R7                              ; F4A4   02B7

        DECLE   $0275,  $0282,  $0174,  $0004   ; F4A5   0275 0282 0174 0004

        ANDR    R3,     R0                      ; F4A9   0198
        MOVR    R4,     R3                      ; F4AA   00A3
        MVI     G_0347, R0                      ; F4AB   0280 0347
        MVI     G_0348, R1                      ; F4AD   0281 0348
        SWAP    R1,     1                       ; F4AF   0041
        ADDI    #$0004, R1                      ; F4B0   02F9 0004
        SWAP    R1,     1                       ; F4B2   0041
        MVO     R0,     G_0357                  ; F4B3   0240 0357
        MVO     R1,     G_0358                  ; F4B5   0241 0358
        CLRR    R0                              ; F4B7   01C0
        MVO     R0,     G_0359                  ; F4B8   0240 0359
        PULR    R7                              ; F4BA   02B7

        DECLE   $0033,  $0001,  $003A,  $0000   ; F4BB   0033 0001 003A 0000
        DECLE   $0057,  $0058,  $0002,  $0001   ; F4BF   0057 0058 0002 0001
        DECLE   $000A,  $0053,  $0058,  $0001   ; F4C3   000A 0053 0058 0001
        DECLE   $0032,  $0004,  $004F,  $0058   ; F4C7   0032 0004 004F 0058
        DECLE   $0261,  $0181,  $0201,  $03C0   ; F4CB   0261 0181 0201 03C0
        DECLE   $0211,  $00C0,  $004B,  $0050   ; F4CF   0211 00C0 004B 0050
        DECLE   $0201,  $002A,  $0201,  $001A   ; F4D3   0201 002A 0201 001A
        DECLE   $0201,  $003A,  $0095,  $0022   ; F4D7   0201 003A 0095 0022
        DECLE   $00F9,  $0050,  $0281,  $0032   ; F4DB   00F9 0050 0281 0032
        DECLE   $0049,  $0050,  $030D,  $0271   ; F4DF   0049 0050 030D 0271
        DECLE   $007B,  $0050,  $0213,  $0040   ; F4E3   007B 0050 0213 0040
        DECLE   $0229,  $03C0,  $0239,  $0140   ; F4E7   0229 03C0 0239 0140
        DECLE   $0201,  $0012,  $0207,  $0048   ; F4EB   0201 0012 0207 0048

        MVO@    R5,     R2                      ; F4EF   0255
        ADDR    R0,     R0                      ; F4F0   00C0
        SUB     G_0048, R7                      ; F4F1   0307 0048
        SUBR    R4,     R7                      ; F4F3   0127

        SWAP    R0,     1                       ; F4F4   0040
        SETC                                    ; F4F5   0007
        TSTR    R0                              ; F4F6   0080
        SKIP                                    ; F4F7   0208
        PSHR    R5                              ; F4F8   0275
        SDBD                                    ; F4F9   0001
        MVII    #$90EE, R4                      ; F4FA   02BC 00EE 0090
        MVI     G_0165, R2                      ; F4FD   0282 0165
        MOVR    R2,     R1                      ; F4FF   0091
        SLL     R1,     2                       ; F500   004D
        SLL     R1,     2                       ; F501   004D
        ADDI    #$031E, R1                      ; F502   02F9 031E
        TSTR    R0                              ; F504   0080
        BMI     L_F55E                          ; F505   020B 0057

        TSTR    R2                              ; F507   0092
        BNEQ    L_F528                          ; F508   020C 001E

        MVI     G_0170, R3                      ; F50A   0283 0170
        SWAP    R3,     1                       ; F50C   0043
        TSTR    R3                              ; F50D   009B
        BMI     L_F524                          ; F50E   020B 0014
        BEQ     L_F51C                          ; F510   0204 000A

        CMPI    #$0004, R0                      ; F512   0378 0004
        BLT     L_F524                          ; F514   0205 000E

        CMPI    #$000C, R0                      ; F516   0378 000C
        BGT     L_F524                          ; F518   020E 000A
        B       L_F56B                          ; F51A   0200 004F

L_F51C:
        CMPI    #$0005, R0                      ; F51C   0378 0005
        BLT     L_F56B                          ; F51E   0205 004B

        CMPI    #$000C, R0                      ; F520   0378 000C
        BGT     L_F56B                          ; F522   020E 0047

L_F524:
        MVII    #$0080, R3                      ; F524   02BB 0080
        MVO     R3,     G_0170                  ; F526   0243 0170
L_F528:
        CMPI    #$0005, R0                      ; F528   0378 0005
        BGT     L_F530                          ; F52A   020E 0004

        CMPI    #$0002, R0                      ; F52C   0378 0002
        BGT     L_F538                          ; F52E   020E 0008

L_F530:
        CMPI    #$000D, R0                      ; F530   0378 000D
        BGT     L_F53B                          ; F532   020E 0007

        CMPI    #$000A, R0                      ; F534   0378 000A
        BLE     L_F53B                          ; F536   0206 0003

L_F538:
        MVII    #$0007, R5                      ; F538   02BD 0007
        INCR    R7                              ; F53A   000F

L_F53B:
        CLRR    R5                              ; F53B   01ED
L_F53C:
        ADDR    R5,     R4                      ; F53C   00EC
        DECLE   $024C,  $00AC,  $0004           ; F53D   024C 00AC 0004

        ANDR    R2,     R4                      ; F540   0194
        CMPR    R6,     R3                      ; F541   0173
        ADDI    #$0004, R1                      ; F542   02F9 0004
        MVII    #$03F0, R3                      ; F544   02BB 03F0
        MVO@    R3,     R1                      ; F546   024B
        MOVR    R1,     R2                      ; F547   008A
L_F548:
        MOVR    R0,     R1                      ; F548   0081
        ADDI    #$0002, R2                      ; F549   02FA 0002
        MVI@    R2,     R0                      ; F54B   0290
        ANDI    #$00FF, R0                      ; F54C   03B8 00FF

        JSR     R5,     .EXEC.629               ; F54E   0004 0114 0229
        DECLE   $033A,  $0003,  $0250,  $00A4   ; F551   033A 0003 0250 00A4
        DECLE   $020B,  $0006,  $0204,  $0001   ; F555   020B 0006 0204 0001
        DECLE   $0040,  $0004                   ; F559   0040 0004

        ANDR    R2,     R4                      ; F55B   0194
        ANDR    R6,     R0                      ; F55C   01B0
L_F55D:
        PULR    R7                              ; F55D   02B7

L_F55E:
        TSTR    R2                              ; F55E   0092
        DECLE   $0204,  $000A,  $00A3,  $024B   ; F55F   0204 000A 00A3 024B
        DECLE   $02BC,  $0006,  $0004           ; F563   02BC 0006 0004

        ANDR    R2,     R4                      ; F566   0194
        CMPR    R6,     R3                      ; F567   0173
        MVII    #$000A, R3                      ; F568   02BB 000A
        INCR    R7                              ; F56A   000F

L_F56B:
        CLRR    R3                              ; F56B   01DB
L_F56C:
        ADDI    #$0004, R1                      ; F56C   02F9 0004
        MVO@    R3,     R1                      ; F56E   024B
        CLRR    R0                              ; F56F   01C0
        DECR    R1                              ; F570   0011
        MVO@    R0,     R1                      ; F571   0248
        PULR    R7                              ; F572   02B7

        MOVR    R1,     R2                      ; F573   008A
        DECR    R2                              ; F574   0012
        MVI@    R2,     R3                      ; F575   0293
        SLLC    R3,     2                       ; F576   005F
        BOV     L_F57C                          ; F577   0202 0003

        ADDI    #$000D, R2                      ; F579   02FA 000D
        MVO@    R4,     R2                      ; F57B   0254
L_F57C:
        MOVR    R5,     R7                      ; F57C   00AF

        PSHR    R5                              ; F57D   0275
        MVO     R0,     G_0164                  ; F57E   0240 0164
        MVI     G_0165, R2                      ; F580   0282 0165
        MOVR    R2,     R0                      ; F582   0090
        SLL     R2,     2                       ; F583   004E
        SLL     R2,     2                       ; F584   004E
        ADDI    #$031D, R2                      ; F585   02FA 031D
        MVI@    R2,     R1                      ; F587   0291
        SLLC    R1,     2                       ; F588   005D
        BOV     L_F55D                          ; F589   0222 002D

        SETC                                    ; F58B   0007
        RRC     R1,     1                       ; F58C   0071
        SLR     R1,     1                       ; F58D   0061
        MVO@    R1,     R2                      ; F58E   0251
        ADDI    #$0008, R2                      ; F58F   02FA 0008
        MVI@    R2,     R1                      ; F591   0291
        SDBD                                    ; F592   0001
        ANDI    #$F77F, R1                      ; F593   03B9 007F 00F7
        SDBD                                    ; F596   0001
        XORI    #$0800, R1                      ; F597   03F9 0000 0008
        MVO@    R1,     R2                      ; F59A   0251
        ADDI    #$0005, R2                      ; F59B   02FA 0005
        MVII    #$0004, R1                      ; F59D   02B9 0004
        MVO@    R1,     R2                      ; F59F   0251
        SLL     R0,     1                       ; F5A0   0048
        INCR    R0                              ; F5A1   0008

        JSR     R5,     .EXEC.6D5               ; F5A2   0004 0114 02D5
        DECLE   $0272,  $0004                   ; F5A5   0272 0004

        ANDR    R3,     R4                      ; F5A7   019C
        CMP@    R2,     R0                      ; F5A8   0350
        PULR    R2                              ; F5A9   02B2
        CLRR    R4                              ; F5AA   01E4
        DECR    R4                              ; F5AB   0014
        MVI     G_0164, R0                      ; F5AC   0280 0164
        B       L_F548                          ; F5AE   0220 0067

        PSHR    R5                              ; F5B0   0275
        MVII    #$0002, R4                      ; F5B1   02BC 0002
        MVI     G_0165, R1                      ; F5B3   0281 0165
        SLL     R1,     2                       ; F5B5   004D
        SLL     R1,     2                       ; F5B6   004D
        ADDI    #$031D, R1                      ; F5B7   02F9 031D
        CLRR    R3                              ; F5B9   01DB
        TSTR    R0                              ; F5BA   0080
        BPL     L_F5BE                          ; F5BB   0203 0001

        MOVR    R4,     R3                      ; F5BD   00A3
L_F5BE:
        MVI@    R1,     R0                      ; F5BE   0288
        SDBD                                    ; F5BF   0001
        ANDI    #$FDFF, R0                      ; F5C0   03B8 00FF 00FD
        ADDR    R3,     R7                      ; F5C3   00DF

        XORI    #$0200, R0                      ; F5C4   03F8 0200
        MVO@    R0,     R1                      ; F5C6   0248
        ADDI    #$0008, R1                      ; F5C7   02F9 0008
        XORR    R4,     R3                      ; F5C9   01E3
        MVI@    R1,     R0                      ; F5CA   0288
        SDBD                                    ; F5CB   0001
        ANDI    #$FDFF, R0                      ; F5CC   03B8 00FF 00FD
        ADDR    R3,     R7                      ; F5CF   00DF

        XORI    #$0200, R0                      ; F5D0   03F8 0200
        MVO@    R0,     R1                      ; F5D2   0248
        PULR    R7                              ; F5D3   02B7

        DECLE   $0275,  $0004,  $0194,  $027D   ; F5D4   0275 0004 0194 027D

        BC      L_F633                          ; F5D8   0201 0059

        MVII    #$0005, R2                      ; F5DA   02BA 0005
        MVI@    R1,     R0                      ; F5DC   0288
        SLLC    R0,     2                       ; F5DD   005C
        BNOV    L_F5E1                          ; F5DE   020A 0001

        SLL     R2,     2                       ; F5E0   004E
L_F5E1:
        MVI@    R1,     R0                      ; F5E1   0288
        ANDI    #$0010, R0                      ; F5E2   03B8 0010
        BEQ     L_F5E7                          ; F5E4   0204 0001

        SLL     R2,     1                       ; F5E6   004A
L_F5E7:
        MVI@    R3,     R0                      ; F5E7   0298
        ANDI    #$0008, R0                      ; F5E8   03B8 0008
        BEQ     L_F5ED                          ; F5EA   0204 0001

        SLR     R2,     2                       ; F5EC   0066
L_F5ED:
        MOVR    R2,     R0                      ; F5ED   0090
        SLR     R0,     2                       ; F5EE   0064
        SUBR    R0,     R2                      ; F5EF   0102
        ADDR    R0,     R0                      ; F5F0   00C0

        JSR     R5,     X_RAND2                 ; F5F1   0004 0114 029E

        ADDR    R0,     R2                      ; F5F4   00C2
        ADDI    #$0007, R3                      ; F5F5   02FB 0007
        MVI@    R3,     R0                      ; F5F7   0298
        ANDI    #$00FF, R0                      ; F5F8   03B8 00FF
        SUBR    R2,     R0                      ; F5FA   0110
        BLE     L_F634                          ; F5FB   0206 0037

        MVI@    R3,     R0                      ; F5FD   0298
        SUBR    R2,     R0                      ; F5FE   0110
        MVO@    R0,     R3                      ; F5FF   0258
        DECR    R3                              ; F600   0013
        MVII    #$0050, R0                      ; F601   02B8 0050
        MVO@    R0,     R3                      ; F603   0258
        DECR    R3                              ; F604   0013
        MVII    #$0009, R0                      ; F605   02B8 0009
        MVO@    R0,     R3                      ; F607   0258
        DECR    R3                              ; F608   0013
        CLRR    R0                              ; F609   01C0
        MVO@    R0,     R3                      ; F60A   0258
        SUBI    #$0003, R3                      ; F60B   033B 0003
        SDBD                                    ; F60D   0001
        MVII    #$90EE, R5                      ; F60E   02BD 00EE 0090
        MVO@    R5,     R3                      ; F611   025D
        DECR    R3                              ; F612   0013
        MVI@    R3,     R0                      ; F613   0298
        ADDI    #$000D, R3                      ; F614   02FB 000D
        SLLC    R0,     2                       ; F616   005C
        BOV     L_F61C                          ; F617   0202 0003

        MVII    #$0006, R0                      ; F619   02B8 0006
        MVO@    R0,     R3                      ; F61B   0258
L_F61C:
        ADDI    #$0002, R3                      ; F61C   02FB 0002
        MVI@    R3,     R0                      ; F61E   0298
        SUBR    R2,     R0                      ; F61F   0110
        BPL     L_F623                          ; F620   0203 0001

        CLRR    R0                              ; F622   01C0
L_F623:
        MVO@    R0,     R3                      ; F623   0258
        DECLE   $0004                           ; F624   0004

        ANDR    R2,     R4                      ; F625   0194
        COMR    R1                              ; F626   0019

        JSR     R5,     X_PLAY_SFX1             ; F627   0004 0118 03BB
        DECLE   $00E9                           ; F62A  SFX data
        DECLE   $0050,  $01DC                   ; F62B  SFX data
        DECLE   $03B7                           ; F62D  SFX data
        DECLE   $03ED                           ; F62E  SFX data
        DECLE   $001C,  $03D0                   ; F62F  SFX data
        DECLE   $000B                           ; F631  SFX data
        DECLE   $03CF                           ; F632  SFX end

L_F633:
        PULR    R7                              ; F633   02B7

L_F634:
        SUBI    #$0007, R3                      ; F634   033B 0007
L_F636:
        MVI@    R3,     R0                      ; F636   0298
        ANDI    #$0017, R0                      ; F637   03B8 0017
        CMPI    #$0012, R0                      ; F639   0378 0012
        BEQ     L_F641                          ; F63B   0204 0004

        MVI@    R3,     R0                      ; F63D   0298
        SLLC    R0,     2                       ; F63E   005C
        BOV     L_F647                          ; F63F   0202 0006

L_F641:
        MOVR    R3,     R1                      ; F641   0099
        ADDI    #$0008, R1                      ; F642   02F9 0008

        JSR     R5,     .EXEC.7AE               ; F644   0004 0114 03AE

L_F647:
        MVI     G_015F, R0                      ; F647   0280 015F
        INCR    R0                              ; F649   0008

        JSR     R5,     .EXEC.6D5               ; F64A   0004 0114 02D5
        DECLE   $0004                           ; F64D   0004

        ANDR    R2,     R4                      ; F64E   0194
        AND@    R2,     R3                      ; F64F   0393

        JSR     R5,     X_PLAY_SFX1             ; F650   0004 0118 03BB
        DECLE   $0149                           ; F653  SFX data
        DECLE   $03B7                           ; F654  SFX data
        DECLE   $0040,  $0384                   ; F655  SFX data
        DECLE   $0048,  $0032                   ; F657  SFX data
        DECLE   $03F1,  $03E4                   ; F659  SFX data
        DECLE   $03F1,  $0002                   ; F65B  SFX data
        DECLE   $02AD                           ; F65D  SFX data
        DECLE   $001C,  $03D0                   ; F65E  SFX data
        DECLE   $000B                           ; F660  SFX data
        DECLE   $026B                           ; F661  SFX data
        DECLE   $004C,  $0388                   ; F662  SFX data
        DECLE   $010B                           ; F664  SFX data
        DECLE   $008F,  $0027                   ; F665  SFX data
        DECLE   $03F1,  $03FC                   ; F667  SFX data
        DECLE   $009C,  $0310                   ; F669  SFX data
        DECLE   $000B                           ; F66B  SFX data
        DECLE   $008F,  $0031                   ; F66C  SFX data
        DECLE   $03CF                           ; F66E  SFX end


        PULR    R7                              ; F66F   02B7

        DECLE   $0275,  $0243,  $015F,  $02B9   ; F670   0275 0243 015F 02B9
        DECLE   $031D,  $0004                   ; F674   031D 0004

        ANDR    R2,     R4                      ; F676   0194
        TSTR    R2                              ; F677   0092
        BC      L_F633                          ; F678   0221 0046

        MOVR    R1,     R3                      ; F67A   008B
        B       L_F636                          ; F67B   0220 0046

        PSHR    R5                              ; F67D   0275
        MVO     R0,     G_015E                  ; F67E   0240 015E
        MVO     R3,     G_015F                  ; F680   0243 015F
        SLL     R3,     2                       ; F682   004F
        SLL     R3,     1                       ; F683   004B
        ADDI    #$031E, R3                      ; F684   02FB 031E
        SDBD                                    ; F686   0001
        MVII    #$9121, R5                      ; F687   02BD 0021 0091
        CMP@    R3,     R5                      ; F68A   035D
        BEQ     L_F6A9                          ; F68B   0204 001C

        DECR    R3                              ; F68D   0013
        MOVR    R0,     R2                      ; F68E   0082
        DECR    R2                              ; F68F   0012
        CMP     G_015F, R2                      ; F690   0342 015F
        BEQ     L_F6AD                          ; F692   0204 0019

        MOVR    R1,     R2                      ; F694   008A
        ADDI    #$0005, R2                      ; F695   02FA 0005
        MVI@    R2,     R0                      ; F697   0290
        CMPI    #$0004, R0                      ; F698   0378 0004
        BNEQ    L_F6A9                          ; F69A   020C 000D

        MVI     G_015E, R0                      ; F69C   0280 015E
        SARC    R0,     1                       ; F69E   0078
        BEQ     L_F6AB                          ; F69F   0204 000A

        MVI     G_015F, R0                      ; F6A1   0280 015F
        TSTR    R0                              ; F6A3   0080
        BEQ     L_F6AB                          ; F6A4   0204 0005

        SARC    R0,     1                       ; F6A6   0078
        BEQ     L_F6AB                          ; F6A7   0204 0002

L_F6A9:
        SETC                                    ; F6A9   0007
        PULR    R7                              ; F6AA   02B7

L_F6AB:
        CLRC                                    ; F6AB   0006
        PULR    R7                              ; F6AC   02B7

L_F6AD:
        MVI@    R1,     R0                      ; F6AD   0288
        ANDI    #$0008, R0                      ; F6AE   03B8 0008
        BEQ     L_F6EE                          ; F6B0   0204 003C

        MVI@    R1,     R0                      ; F6B2   0288
        SDBD                                    ; F6B3   0001
        ANDI    #$F7F7, R0                      ; F6B4   03B8 00F7 00F7
        MVO@    R0,     R1                      ; F6B7   0248
        CLRR    R0                              ; F6B8   01C0
        ADDI    #$0005, R1                      ; F6B9   02F9 0005
        MVO@    R0,     R1                      ; F6BB   0248
        DECR    R1                              ; F6BC   0011
        CLRR    R0                              ; F6BD   01C0
        MVO@    R0,     R1                      ; F6BE   0248
        INCR    R1                              ; F6BF   0009
        MVI     G_015E, R0                      ; F6C0   0280 015E

        JSR     R5,     .EXEC.6CF               ; F6C2   0004 0114 02CF
        DECLE   $008A,  $033A,  $000D,  $0290   ; F6C5   008A 033A 000D 0290
        DECLE   $004C,  $0064,  $0250,  $000A   ; F6C9   004C 0064 0250 000A
        DECLE   $0001,  $02BD,  $00F5,  $0090   ; F6CD   0001 02BD 00F5 0090
        DECLE   $0355,  $020C,  $0011,  $0283   ; F6D1   0355 020C 0011 0283
        DECLE   $015F,  $0063,  $0243,  $0165   ; F6D5   015F 0063 0243 0165
        DECLE   $02FA,  $0003,  $0290,  $0040   ; F6D9   02FA 0003 0290 0040
        DECLE   $02BD,  $0007,  $024D,  $0004   ; F6DD   02BD 0007 024D 0004

        ANDR    R2,     R4                      ; F6E1   0194
        ANDR    R6,     R0                      ; F6E2   01B0
        B       L_F6A9                          ; F6E3   0220 003B

        ADDI    #$0004, R2                      ; F6E5   02FA 0004
        MVI@    R2,     R0                      ; F6E7   0290
        SLR     R0,     2                       ; F6E8   0064
        SARC    R0,     2                       ; F6E9   007C
        BNEQ    L_F6EE                          ; F6EA   020C 0002

        CLRR    R0                              ; F6EC   01C0
        MVO@    R0,     R2                      ; F6ED   0250
L_F6EE:
        B       L_F6A9                          ; F6EE   0220 0046

        DECLE   $0275,  $0004,  $0194,  $027D   ; F6F0   0275 0004 0194 027D

        BC      L_F73E                          ; F6F4   0201 0048

        CLRR    R0                              ; F6F6   01C0
        MVO     R0,     G_0175                  ; F6F7   0240 0175
        MVI     G_0163, R0                      ; F6F9   0280 0163
        TSTR    R0                              ; F6FB   0080
        BEQ     L_F73E                          ; F6FC   0204 0040

        SDBD                                    ; F6FE   0001
        MVII    #$911A, R3                      ; F6FF   02BB 001A 0091
        MVII    #$0007, R4                      ; F702   02BC 0007
L_F704:
        MOVR    R1,     R2                      ; F704   008A
        DECLE   $000A,  $0253,  $0274,  $0280   ; F705   000A 0253 0274 0280
        DECLE   $015E,  $0282,  $0175,  $0004   ; F709   015E 0282 0175 0004

        ANDR    R2,     R4                      ; F70D   0194
        SWAP    R2,     1                       ; F70E   0042
        MOVR    R3,     R2                      ; F70F   009A
        PULR    R4                              ; F710   02B4
        MVI@    R2,     R0                      ; F711   0290

        JSR     R5,     X_UNPK_BYTES            ; F712   0004 0114 0357
        JSR     R5,     .EXEC.A2F               ; F715   0004 0118 022F

        MVII    #$0014, R0                      ; F718   02B8 0014

        JSR     R5,     .EXEC.629               ; F71A   0004 0114 0229
        DECLE   $0250,  $000A,  $02B8,  $03F0   ; F71D   0250 000A 02B8 03F0
        DECLE   $0250,  $000A,  $0254,  $037C   ; F721   0250 000A 0254 037C
        DECLE   $0014,  $0204,  $000E,  $00B9   ; F725   0014 0204 000E 00B9
        DECLE   $02F9,  $00C2,  $02C1,  $016D   ; F729   02F9 00C2 02C1 016D
        DECLE   $028A,  $0004                   ; F72D   028A 0004

        ANDR    R3,     R4                      ; F72F   019C
        ADDI    #$0004, R1                      ; F730   02F9 0004
        ANDR    R3,     R4                      ; F732   019C
        AND@    R1,     R0                      ; F733   0388
        B       L_F739                          ; F734   0200 0003

        DECLE   $0004                           ; F736   0004

        ANDR    R3,     R4                      ; F737   019C
        AND@    R3,     R6                      ; F738   039E
L_F739:
        MVI     G_015E, R0                      ; F739   0280 015E

        JSR     R5,     .EXEC.41C               ; F73B   0004 0114 001C

L_F73E:
        PULR    R7                              ; F73E   02B7

        PSHR    R5                              ; F73F   0275
        MVI     G_032A, R3                      ; F740   0283 032A
        CMPI    #$0004, R3                      ; F742   037B 0004
        BEQ     L_F747                          ; F744   0204 0001
        PULR    R7                              ; F746   02B7

L_F747:
        MVI     G_0329, R3                      ; F747   0283 0329
        ANDI    #$00FF, R3                      ; F749   03BB 00FF
        BNEQ    L_F750                          ; F74B   020C 0003

        CLRR    R3                              ; F74D   01DB
        MVO     R3,     G_0175                  ; F74E   0243 0175
L_F750:
        SDBD                                    ; F750   0001
        MVII    #$9113, R3                      ; F751   02BB 0013 0091
        MVII    #$0014, R4                      ; F754   02BC 0014
        MVO     R0,     G_015E                  ; F756   0240 015E
        B       L_F704                          ; F758   0220 0055

        PSHR    R5                              ; F75A   0275
        MVI     G_032A, R3                      ; F75B   0283 032A
        CMPI    #$0004, R3                      ; F75D   037B 0004
        BEQ     L_F762                          ; F75F   0204 0001
        PULR    R7                              ; F761   02B7

L_F762:
        MVI     G_033D, R3                      ; F762   0283 033D
        DECLE   $009A,  $03BB,  $0010,  $022C   ; F764   009A 03BB 0010 022C
        DECLE   $0021,  $005E,  $020A,  $0026   ; F768   0021 005E 020A 0026
        DECLE   $0001,  $02BB,  $0007,  $0010   ; F76C   0001 02BB 0007 0010
        DECLE   $0243,  $033D,  $0001,  $02BB   ; F770   0243 033D 0001 02BB
        DECLE   $001A,  $0091,  $0243,  $033E   ; F774   001A 0091 0243 033E
        DECLE   $02BB,  $01E0,  $0243,  $0342   ; F778   02BB 01E0 0243 0342
        DECLE   $01DB,  $0243,  $034D,  $0243   ; F77C   01DB 0243 034D 0243
        DECLE   $0343,  $00B9,  $02F9,  $0069   ; F780   0343 00B9 02F9 0069
        DECLE   $02C1,  $016D,  $028A,  $0090   ; F784   02C1 016D 028A 0090
        DECLE   $004E,  $004A,  $00C2,  $00C2   ; F788   004E 004A 00C2 00C2
        DECLE   $0004                           ; F78C   0004

        ANDR    R3,     R4                      ; F78D   019C
        ADDI    #$0004, R1                      ; F78E   02F9 0004
        ANDR    R3,     R4                      ; F790   019C
        AND@    R1,     R0                      ; F791   0388
        PULR    R7                              ; F792   02B7

        DECLE   $0275,  $000B,  $0001,  $02B9   ; F793   0275 000B 0001 02B9
        DECLE   $0021,  $0091,  $0259,  $01C9   ; F797   0021 0091 0259 01C9
        DECLE   $02FB,  $0003,  $0259,  $000B   ; F79B   02FB 0003 0259 000B
        DECLE   $02B9,  $00C0,  $0259,  $000B   ; F79F   02B9 00C0 0259 000B
        DECLE   $02B9,  $001A,  $0259,  $0283   ; F7A3   02B9 001A 0259 0283
        DECLE   $015F,  $009B,  $0204,  $004F   ; F7A7   015F 009B 0204 004F
        DECLE   $00B9,  $02F9,  $003F,  $02C1   ; F7AB   00B9 02F9 003F 02C1
        DECLE   $016D,  $028A,  $0283,  $0166   ; F7AF   016D 028A 0283 0166
        DECLE   $0013,  $020C,  $0009,  $0280   ; F7B3   0013 020C 0009 0280
        DECLE   $0178,  $0080,  $020C,  $0004   ; F7B7   0178 0080 020C 0004
        DECLE   $0090,  $004E,  $00C2,  $00C2   ; F7BB   0090 004E 00C2 00C2
        DECLE   $0004                           ; F7BF   0004

        ANDR    R3,     R4                      ; F7C0   019C
        ADDI    #$0281, R1                      ; F7C1   02F9 0281
        CMPR    R3,     R5                      ; F7C3   015D
        TSTR    R1                              ; F7C4   0089
        BNEQ    L_F7EA                          ; F7C5   020C 0023

        CMPI    #$0002, R3                      ; F7C7   037B 0002
        BNEQ    L_F7CF                          ; F7C9   020C 0004

        MVII    #$00C8, R1                      ; F7CB   02B9 00C8
        MVO     R1,     G_012D                  ; F7CD   0241 012D
L_F7CF:
        MVO     R3,     G_0166                  ; F7CF   0243 0166
        TSTR    R3                              ; F7D1   009B
        BNEQ    L_F7EA                          ; F7D2   020C 0016

        CLRR    R1                              ; F7D4   01C9
        MVO     R1,     G_012D                  ; F7D5   0241 012D
        MVII    #$0003, R3                      ; F7D7   02BB 0003
        MVO     R3,     G_016F                  ; F7D9   0243 016F
        MVO     R3,     G_0166                  ; F7DB   0243 0166
        MVII    #$0050, R0                      ; F7DD   02B8 0050
        MVO     R0,     G_0323                  ; F7DF   0240 0323
        MVI     G_0172, R0                      ; F7E1   0280 0172
        TSTR    R0                              ; F7E3   0080
        BEQ     L_F7EA                          ; F7E4   0204 0004

        MVII    #$0001, R0                      ; F7E6   02B8 0001
        MVO     R0,     G_0176                  ; F7E8   0240 0176
L_F7EA:
        PULR    R7                              ; F7EA   02B7

        DECLE   $0005                           ; F7EB   0005

        INCR    R2                              ; F7EC   000A
        INCR    R7                              ; F7ED   000F

        COMR    R1                              ; F7EE   0019
L_F7EF:
        COMR    R6                              ; F7EF   001E
        DECLE   $0032,  $004B,  $0064,  $007D   ; F7F0   0032 004B 0064 007D
        DECLE   $0096,  $00C8,  $00FA,  $015E   ; F7F4   0096 00C8 00FA 015E
        DECLE   $01F4,  $03E8,  $02B9,  $031D   ; F7F8   01F4 03E8 02B9 031D
        DECLE   $02B8,  $00FF,  $0240,  $015D   ; F7FC   02B8 00FF 0240 015D
        DECLE   $0280,  $0173,  $0080,  $020C   ; F800   0280 0173 0080 020C
        DECLE   $002D,  $0004                   ; F804   002D 0004

        ANDR    R2,     R4                      ; F806   0194
        TSTR    R2                              ; F807   0092
        BC      L_F810                          ; F808   0201 0006

        MOVR    R1,     R4                      ; F80A   008C
        ADDI    #$0004, R4                      ; F80B   02FC 0004
        CLRR    R0                              ; F80D   01C0
        MVO@    R0,     R4                      ; F80E   0260
        MVO@    R0,     R4                      ; F80F   0260
L_F810:
        ADDI    #$0010, R1                      ; F810   02F9 0010
        DECLE   $0379,  $034D,  $0226,  $0010   ; F812   0379 034D 0226 0010

        INCR    R7                              ; F816   000F

        PSHR    R5                              ; F817   0275
L_F818:
        MVII    #$0008, R0                      ; F818   02B8 0008
        MVII    #$0129, R4                      ; F81A   02BC 0129

        JSR     R5,     X_FILL_ZERO             ; F81C   0004 0114 0338

        MVII    #$0003, R3                      ; F81F   02BB 0003
        MVII    #$0269, R4                      ; F821   02BC 0269

        JSR     R5,     X_PRINT_R5              ; F823   0004 0118 007B
        STRING  "GAME OVER"                     ; F826  
        DECLE   $0000                           ; F82F   0000

        B       L_F84C                          ; F830   0200 001A

        CLRR    R0                              ; F832   01C0
        MVO     R0,     G_034D                  ; F833   0240 034D
        B       L_F84C                          ; F835   0200 0015

        PSHR    R5                              ; F837   0275
        MOVR    R1,     R3                      ; F838   008B
        ADDI    #$0005, R3                      ; F839   02FB 0005
        MVI@    R3,     R0                      ; F83B   0298
        TSTR    R0                              ; F83C   0080
        BNEQ    L_F853                          ; F83D   020C 0014

        MVII    #$031F, R4                      ; F83F   02BC 031F
        MVI@    R4,     R0                      ; F841   02A0
        MVI@    R4,     R2                      ; F842   02A2
        MVO     R0,     G_034F                  ; F843   0240 034F
        MVO     R2,     G_0350                  ; F845   0242 0350
        CLRR    R0                              ; F847   01C0
        MVO     R0,     G_0351                  ; F848   0240 0351
        MVO@    R0,     R4                      ; F84A   0260
        MVO@    R0,     R4                      ; F84B   0260
L_F84C:
        SDBD                                    ; F84C   0001
        MVII    #$1906, R0                      ; F84D   02B8 0006 0019
        MVO     R0,     G_035D                  ; F850   0240 035D
        PULR    R7                              ; F852   02B7

L_F853:
        SUBI    #$0008, R1                      ; F853   0339 0008
        DECLE   $0004,  $0194,  $0092,  $0221   ; F855   0004 0194 0092 0221
        DECLE   $006F,  $0280,  $031D,  $03F8   ; F859   006F 0280 031D 03F8
        DECLE   $0016,  $0240,  $031D,  $0280   ; F85D   0016 0240 031D 0280
        DECLE   $015D,  $0080,  $022C,  $007A   ; F861   015D 0080 022C 007A
        DECLE   $0004,  $019C,  $037A,  $0220   ; F865   0004 019C 037A 0220
        DECLE   $006F,  $0275,  $02BA,  $00C0   ; F869   006F 0275 02BA 00C0
        DECLE   $0004                           ; F86D   0004

        ANDR    R3,     R0                      ; F86E   0198
        MOVR    R4,     R3                      ; F86F   00A3
        MVII    #$0003, R3                      ; F870   02BB 0003
        MVI     G_015F, R0                      ; F872   0280 015F
        SWAP    R0,     1                       ; F874   0040
        TSTR    R0                              ; F875   0080
        BPL     L_F879                          ; F876   0203 0001

        SLR     R3,     1                       ; F878   0063
L_F879:
        SWAP    R0,     1                       ; F879   0040
        ANDI    #$007F, R0                      ; F87A   03B8 007F
        MOVR    R0,     R1                      ; F87C   0081
        SLL     R0,     1                       ; F87D   0048
        ADDR    R1,     R0                      ; F87E   00C8
        MOVR    R7,     R5                      ; F87F   00BD
        ADDI    #$004B, R5                      ; F880   02FD 004B
        ADDR    R0,     R5                      ; F882   00C5
L_F883:
        MVI@    R5,     R1                      ; F883   02A9
        MVI@    R1,     R0                      ; F884   0288
        SLLC    R0,     2                       ; F885   005C
        BOV     L_F894                          ; F886   0202 000C
        BC      L_F890                          ; F888   0201 0006

        MVI@    R1,     R0                      ; F88A   0288
        SDBD                                    ; F88B   0001
        XORI    #$8001, R0                      ; F88C   03F8 0001 0080
        MVO@    R0,     R1                      ; F88F   0248
L_F890:
        DECR    R3                              ; F890   0013
        BNEQ    L_F883                          ; F891   022C 000F
        PULR    R7                              ; F893   02B7

L_F894:
        MVI     G_0177, R0                      ; F894   0280 0177
        INCR    R0                              ; F896   0008
        MVO     R0,     G_0177                  ; F897   0240 0177
        CMPI    #$0006, R0                      ; F899   0378 0006
        BLE     L_F890                          ; F89B   0226 000C

        MVII    #$00FF, R0                      ; F89D   02B8 00FF
        MVO     R0,     G_0172                  ; F89F   0240 0172
        B       L_F890                          ; F8A1   0220 0012

        PSHR    R5                              ; F8A3   0275
        MOVR    R7,     R5                      ; F8A4   00BD
        ADDI    #$0026, R5                      ; F8A5   02FD 0026
        CMPI    #$00C0, R2                      ; F8A7   037A 00C0
        BEQ     L_F8AD                          ; F8A9   0204 0002

        ADDR    R2,     R5                      ; F8AB   00D5
        CLRR    R2                              ; F8AC   01D2
L_F8AD:
        MVI@    R5,     R1                      ; F8AD   02A9
        MVI@    R1,     R0                      ; F8AE   0288
        TSTR    R2                              ; F8AF   0092
        BEQ     L_F8B7                          ; F8B0   0204 0005

        SLLC    R0,     2                       ; F8B2   005C
        BOV     L_F8BD                          ; F8B3   0202 0008
        BNC     L_F8BD                          ; F8B5   0209 0006

L_F8B7:
        MVI@    R1,     R0                      ; F8B7   0288
        SDBD                                    ; F8B8   0001
        ANDI    #$3FF8, R0                      ; F8B9   03B8 00F8 003F
        MVO@    R0,     R1                      ; F8BC   0248
L_F8BD:
        TSTR    R2                              ; F8BD   0092
        DECLE   $0204,  $0007                   ; F8BE   0204 0007

        SDBD                                    ; F8C0   0001
        CMPI    #$98D7, R5                      ; F8C1   037D 00D7 0098
        BLT     L_F8AD                          ; F8C4   0225 0018
        PULR    R7                              ; F8C6   02B7

        DECLE   $0004                           ; F8C7   0004

        ANDR    R3,     R4                      ; F8C8   019C
        XOR@    R2,     R0                      ; F8C9   03D0
        PULR    R7                              ; F8CA   02B7

        DECLE   $021B,  $021E,  $0221,  $0263   ; F8CB   021B 021E 0221 0263
        DECLE   $028B,  $02B3,  $02E3,  $02E6   ; F8CF   028B 02B3 02E3 02E6
        DECLE   $02E9,  $0250,  $0278           ; F8D3   02E9 0250 0278

        MVI@    R4,     R0                      ; F8D6   02A0
        PSHR    R5                              ; F8D7   0275
        MOVR    R2,     R5                      ; F8D8   0095
        ADDI    #$0002, R5                      ; F8D9   02FD 0002
L_F8DB:
        CMPR    R4,     R0                      ; F8DB   0160
        BLT     L_F8EA                          ; F8DC   0205 000C

        ADDI    #$0004, R4                      ; F8DE   02FC 0004
        CMPR    R4,     R0                      ; F8E0   0160
        BLE     L_F8EB                          ; F8E1   0206 0008

        INCR    R2                              ; F8E3   000A
        ADD     G_0161, R4                      ; F8E4   02C4 0161
        CMPR    R5,     R2                      ; F8E6   016A
        BLE     L_F8DB                          ; F8E7   0226 000D

        CLRC                                    ; F8E9   0006
L_F8EA:
        PULR    R7                              ; F8EA   02B7

L_F8EB:
        MVII    #$0006, R0                      ; F8EB   02B8 0006
        SARC    R3,     1                       ; F8ED   007B
        BC      L_F8F3                          ; F8EE   0201 0003

        ADDI    #$0006, R2                      ; F8F0   02FA 0006
        NEGR    R0                              ; F8F2   0020
L_F8F3:
        MOVR    R0,     R3                      ; F8F3   0083
        CLRR    R4                              ; F8F4   01E4
        PSHR    R1                              ; F8F5   0271
        CLRR    R1                              ; F8F6   01C9
        MOVR    R2,     R5                      ; F8F7   0095
L_F8F8:
        MVI@    R5,     R2                      ; F8F8   02AA
        MVI@    R2,     R0                      ; F8F9   0290
        SLLC    R0,     2                       ; F8FA   005C
        BOV     L_F90A                          ; F8FB   0202 000D
        BC      L_F903                          ; F8FD   0201 0004

L_F8FF:
        CLRC                                    ; F8FF   0006
        PULR    R1                              ; F900   02B1
        B       L_F93D                          ; F901   0200 003A

L_F903:
        SLR     R0,     2                       ; F903   0064
        DECR    R4                              ; F904   0014
        SDBD                                    ; F905   0001
        XORI    #$C004, R0                      ; F906   03F8 0004 00C0
        MVO@    R0,     R2                      ; F909   0250
L_F90A:
        DECR    R5                              ; F90A   0015
        TSTR    R1                              ; F90B   0089
        BNEQ    L_F917                          ; F90C   020C 0009

        MVI     G_015E, R0                      ; F90E   0280 015E
        SARC    R0,     1                       ; F910   0078
        BC      L_F8FF                          ; F911   0221 0013

        COMR    R1                              ; F913   0019
        ADDR    R3,     R5                      ; F914   00DD
        B       L_F8F8                          ; F915   0220 001E

L_F917:
        MVI@    R5,     R1                      ; F917   02A9
        DECLE   $0339,  $0200,  $0004           ; F918   0339 0200 0004

        ANDR    R3,     R4                      ; F91B   019C
        BOV     L_FBD3                          ; F91C   0202 02B5

        SUBI    #$0002, R5                      ; F91E   033D 0002
        MVII    #$0005, R3                      ; F920   02BB 0005
        SWAP    R1,     1                       ; F922   0041
        CMPI    #$000C, R1                      ; F923   0379 000C
        BLT     L_F945                          ; F925   0205 001E

        CMPI    #$009B, R1                      ; F927   0379 009B
        BGT     L_F944                          ; F929   020E 0019

L_F92B:
        SWAP    R1,     1                       ; F92B   0041
        MVO@    R1,     R5                      ; F92C   0269
        MVO@    R0,     R5                      ; F92D   0268
        MVI     G_016F, R0                      ; F92E   0280 016F
        TSTR    R0                              ; F930   0080
        BNEQ    L_F937                          ; F931   020C 0004

        MVII    #$00FF, R0                      ; F933   02B8 00FF
        MVO     R0,     G_0172                  ; F935   0240 0172
L_F937:
        MVII    #$0324, R1                      ; F937   02B9 0324
        DECLE   $0004                           ; F939   0004

        ANDR    R2,     R0                      ; F93A   0190
        XOR@    R1,     R5                      ; F93B   03CD
        SETC                                    ; F93C   0007
L_F93D:
        TSTR    R4                              ; F93D   00A4
        DECLE   $0203,  $0003,  $0004           ; F93E   0203 0003 0004

        ANDR    R3,     R4                      ; F941   019C
        XOR@    R2,     R0                      ; F942   03D0
        PULR    R7                              ; F943   02B7

L_F944:
        NEGR    R3                              ; F944   0023
L_F945:
        ADDR    R3,     R1                      ; F945   00D9
        B       L_F92B                          ; F946   0220 001C

        PSHR    R5                              ; F948   0275
        PSHR    R1                              ; F949   0271
        MOVR    R2,     R1                      ; F94A   0091

        JSR     R5,     .EXEC.777               ; F94B   0004 0114 0377

        SWAP    R2,     1                       ; F94E   0042
        XORR    R3,     R2                      ; F94F   01DA
        PULR    R1                              ; F950   02B1
        MOVR    R1,     R3                      ; F951   008B
        ADDI    #$0007, R3                      ; F952   02FB 0007
        MVI@    R3,     R0                      ; F954   0298
        ANDI    #$00FF, R0                      ; F955   03B8 00FF
        MOVR    R0,     R3                      ; F957   0083

        JSR     R5,     .EXEC.9A3               ; F958   0004 0118 01A3

        PULR    R7                              ; F95B   02B7

        PSHR    R5                              ; F95C   0275
        MVII    #$032D, R1                      ; F95D   02B9 032D
        MVII    #$0167, R4                      ; F95F   02BC 0167
        MVII    #$016A, R3                      ; F961   02BB 016A
        CLRR    R2                              ; F963   01D2
L_F964:
        MVI@    R4,     R0                      ; F964   02A0
        DECLE   $007C,  $020A,  $0007,  $0004   ; F965   007C 020A 0007 0004

        ANDR    R2,     R4                      ; F969   0194
        TSTR    R2                              ; F96A   0092
        BC      L_F975                          ; F96B   0201 0008

        ADDI    #$0028, R2                      ; F96D   02FA 0028
        MVII    #$0004, R0                      ; F96F   02B8 0004

        JSR     R5,     X_RAND2                 ; F971   0004 0114 029E

        MVO@    R0,     R3                      ; F974   0258
L_F975:
        INCR    R3                              ; F975   000B
        ADDI    #$0010, R1                      ; F976   02F9 0010
        CMPI    #$034D, R1                      ; F978   0379 034D
        BLE     L_F964                          ; F97A   0226 0017

        MVII    #$00C8, R0                      ; F97C   02B8 00C8
        SUBR    R2,     R0                      ; F97E   0110
        MVO     R0,     G_016E                  ; F97F   0240 016E
        SLR     R0,     1                       ; F981   0060
        MVO     R0,     G_0129                  ; F982   0240 0129
        PULR    R7                              ; F984   02B7

        PSHR    R5                              ; F985   0275
        MVI     G_0173, R0                      ; F986   0280 0173
        TSTR    R0                              ; F988   0080
        BNEQ    L_FA7E                          ; F989   020C 00F3

        MVII    #$0001, R0                      ; F98B   02B8 0001
        MVII    #$032D, R1                      ; F98D   02B9 032D
L_F98F:
        MVO     R0,     G_0165                  ; F98F   0240 0165
        DECLE   $0271,  $0004,  $0194,  $0092   ; F991   0271 0004 0194 0092
        DECLE   $0201,  $0095,  $02BA,  $031D   ; F995   0201 0095 02BA 031D
        DECLE   $0004                           ; F999   0004

        ANDR    R3,     R0                      ; F99A   0198
        CMPR    R1,     R0                      ; F99B   0148
        ADDI    #$0004, R1                      ; F99C   02F9 0004
        MVI@    R1,     R0                      ; F99E   0288

        JSR     R5,     X_UNPK_BYTES            ; F99F   0004 0114 0357
        JSR     R5,     .EXEC.A2F               ; F9A2   0004 0118 022F
        DECLE   $0241,  $0164,  $02B1,  $0271   ; F9A5   0241 0164 02B1 0271
        DECLE   $0004                           ; F9A9   0004

        ANDR    R3,     R0                      ; F9AA   0198
        PSHR    R2                              ; F9AB   0272
        MVII    #$0166, R1                      ; F9AC   02B9 0166
        ADD     G_0165, R1                      ; F9AE   02C1 0165
        MVI@    R1,     R3                      ; F9B0   028B
        CMPI    #$00C0, R3                      ; F9B1   037B 00C0
        BEQ     L_FA15                          ; F9B3   0204 0060

        CLRR    R0                              ; F9B5   01C0
        MVII    #$0018, R5                      ; F9B6   02BD 0018
L_F9B8:
        CMPR    R5,     R2                      ; F9B8   016A
        BLE     L_F9C5                          ; F9B9   0206 000A

        ADDI    #$0018, R5                      ; F9BB   02FD 0018
        ADDI    #$0002, R0                      ; F9BD   02F8 0002
        CMPI    #$0006, R0                      ; F9BF   0378 0006
        BLE     L_F9B8                          ; F9C1   0226 000A
        B       L_F9DD                          ; F9C3   0200 0018

L_F9C5:
        JSR     R5,     X_RAND2                 ; F9C5   0004 0114 029E
        DECLE   $0080,  $020C,  $0012,  $0280   ; F9C8   0080 020C 0012 0280
        DECLE   $0164,  $007F,  $0201,  $000A   ; F9CC   0164 007F 0201 000A

        BOV     L_FA3C                          ; F9D0   0202 006A

        MVII    #$0003, R0                      ; F9D2   02B8 0003

        JSR     R5,     X_RAND2                 ; F9D4   0004 0114 029E
        DECLE   $0010,  $02C0,  $0164,  $0004   ; F9D7   0010 02C0 0164 0004

        ANDR    R2,     R4                      ; F9DB   0194
        CMPR    R7,     R5                      ; F9DC   017D
L_F9DD:
        MVII    #$0002, R1                      ; F9DD   02B9 0002
        MVII    #$0169, R2                      ; F9DF   02BA 0169
        ADD     G_0165, R2                      ; F9E1   02C2 0165
        MVI@    R2,     R0                      ; F9E3   0290
        SLL     R0,     1                       ; F9E4   0048
        ADDR    R0,     R7                      ; F9E5   00C7
        B       L_FA0F                          ; F9E6   0200 0027
        B       L_F9F0                          ; F9E8   0200 0006
        B       L_F9ED                          ; F9EA   0200 0001

L_F9EC:
        NEGR    R1                              ; F9EC   0021
L_F9ED:
        MOVR    R1,     R0                      ; F9ED   0088
        B       L_FA23                          ; F9EE   0200 0033

L_F9F0:
        MVII    #$0003, R0                      ; F9F0   02B8 0003

        JSR     R5,     X_RAND2                 ; F9F2   0004 0114 029E

        TSTR    R0                              ; F9F5   0080
        BNEQ    L_FA04                          ; F9F6   020C 000C

        MVI     G_0164, R1                      ; F9F8   0281 0164

        JSR     R5,     .EXEC.628               ; F9FA   0004 0114 0228
        DECLE   $000A,  $0004                   ; F9FD   000A 0004

        ANDR    R2,     R4                      ; F9FF   0194
        ANDR    R6,     R0                      ; FA00   01B0
        NEGR    R1                              ; FA01   0021
        B       L_FA28                          ; FA02   0200 0024

L_FA04:
        SLL     R1,     1                       ; FA04   0049
        MVII    #$0002, R0                      ; FA05   02B8 0002

        JSR     R5,     X_RAND2                 ; FA07   0004 0114 029E

        TSTR    R0                              ; FA0A   0080
        BEQ     L_F9EC                          ; FA0B   0224 0020
        B       L_F9ED                          ; FA0D   0220 0021

L_FA0F:
        PULR    R1                              ; FA0F   02B1
        PSHR    R1                              ; FA10   0271
        MVI@    R1,     R0                      ; FA11   0288
        SLLC    R0,     2                       ; FA12   005C
        BOV     L_FA1B                          ; FA13   0202 0006

L_FA15:
        MVII    #$0002, R0                      ; FA15   02B8 0002
        CLRR    R1                              ; FA17   01C9
        DECR    R1                              ; FA18   0011
        B       L_FA1F                          ; FA19   0200 0004

L_FA1B:
        MVII    #$0009, R0                      ; FA1B   02B8 0009
        MVII    #$0006, R1                      ; FA1D   02B9 0006

L_FA1F:
        JSR     R5,     X_RAND2                 ; FA1F   0004 0114 029E

        ADDR    R1,     R0                      ; FA22   00C8
L_FA23:
        MVI     G_0164, R1                      ; FA23   0281 0164
        ADDR    R0,     R1                      ; FA25   00C1
        ANDI    #$000F, R1                      ; FA26   03B9 000F
L_FA28:
        MOVR    R1,     R0                      ; FA28   0088
        DECLE   $0004                           ; FA29   0004

        ANDR    R2,     R4                      ; FA2A   0194
        ADDR    R7,     R0                      ; FA2B   00F8
        PULR    R1                              ; FA2C   02B1
        ADDI    #$0010, R1                      ; FA2D   02F9 0010
        MVI     G_0165, R0                      ; FA2F   0280 0165
        INCR    R0                              ; FA31   0008
        CMPI    #$0003, R0                      ; FA32   0378 0003
        BLE     L_F98F                          ; FA34   0226 00A6

        MVI     G_016E, R0                      ; FA36   0280 016E
        SLR     R0,     2                       ; FA38   0064
        MVO     R0,     G_012B                  ; FA39   0240 012B
        PULR    R7                              ; FA3B   02B7

L_FA3C:
        CMPI    #$0023, R2                      ; FA3C   037A 0023
        DECLE   $022E,  $0065,  $02B1,  $0271   ; FA3E   022E 0065 02B1 0271
        DECLE   $02F9,  $0008,  $028D,  $03BD   ; FA42   02F9 0008 028D 03BD
        DECLE   $0017,  $037D,  $0007,  $0224   ; FA46   0017 037D 0007 0224
        DECLE   $0070,  $02F9,  $0006,  $02BD   ; FA4A   0070 02F9 0006 02BD
        DECLE   $0019,  $024D,  $0220,  $0077   ; FA4E   0019 024D 0220 0077

        PSHR    R5                              ; FA52   0275
        MVII    #$0003, R4                      ; FA53   02BC 0003
        MVII    #$034D, R1                      ; FA55   02B9 034D

L_FA57:
        JSR     R5,     .EXEC.760               ; FA57   0004 0114 0360
        DECLE   $0204,  $0009                   ; FA5A   0204 0009

        SUBI    #$0010, R1                      ; FA5C   0339 0010
        DECR    R4                              ; FA5E   0014
        BNEQ    L_FA57                          ; FA5F   022C 0009

L_FA61:
        CLRR    R1                              ; FA61   01C9
        MVO     R1,     G_012D                  ; FA62   0241 012D
        PULR    R7                              ; FA64   02B7

        DECLE   $0004                           ; FA65   0004

        ANDR    R3,     R0                      ; FA66   0198
        AND@    R6,     R4                      ; FA67   03B4
        MVI     G_0166, R0                      ; FA68   0280 0166
        INCR    R0                              ; FA6A   0008
        MVO     R0,     G_0166                  ; FA6B   0240 0166
        CMPI    #$0003, R0                      ; FA6D   0378 0003
        BEQ     L_FA61                          ; FA6F   0224 000F
        PULR    R7                              ; FA71   02B7

        PSHR    R5                              ; FA72   0275
        MOVR    R1,     R4                      ; FA73   008C
        ADDI    #$0002, R4                      ; FA74   02FC 0002
        CLRR    R0                              ; FA76   01C0

        JSR     R5,     .EXEC.772               ; FA77   0004 0114 0372
        JSR     R5,     .EXEC.7A3               ; FA7A   0004 0114 03A3

        PULR    R7                              ; FA7D   02B7

L_FA7E:
        MVII    #$0002, R1                      ; FA7E   02B9 0002
        DECLE   $0280,  $033D,  $005C,  $020A   ; FA80   0280 033D 005C 020A
        DECLE   $0031,  $02B9,  $0345,  $0004   ; FA84   0031 02B9 0345 0004

        ANDR    R3,     R0                      ; FA88   0198
        PSHR    R2                              ; FA89   0272
        MVII    #$0005, R0                      ; FA8A   02B8 0005
        MVII    #$0028, R5                      ; FA8C   02BD 0028
L_FA8E:
        CMPR    R5,     R2                      ; FA8E   016A
        BGE     L_FA97                          ; FA8F   020D 0006

        ADDI    #$0005, R0                      ; FA91   02F8 0005
        SUBI    #$0008, R5                      ; FA93   033D 0008
        BNEQ    L_FA8E                          ; FA95   022C 0008

L_FA97:
        MVO     R0,     G_0354                  ; FA97   0240 0354
        DECLE   $02B9,  $034D,  $02BA,  $031D   ; FA99   02B9 034D 02BA 031D
        DECLE   $0004                           ; FA9D   0004

        ANDR    R3,     R0                      ; FA9E   0198
        CMPR    R1,     R0                      ; FA9F   0148
        MVI     G_0359, R3                      ; FAA0   0283 0359
        TSTR    R3                              ; FAA2   009B
        BNEQ    L_FAE1                          ; FAA3   020C 003C

        CLRR    R3                              ; FAA5   01DB
        SDBD                                    ; FAA6   0001
        MVII    #$98CB, R4                      ; FAA7   02BC 00CB 0098
L_FAAA:
        MVI@    R4,     R1                      ; FAAA   02A1
        MVI@    R1,     R0                      ; FAAB   0288
        SLLC    R0,     2                       ; FAAC   005C
        BOV     L_FAC6                          ; FAAD   0202 0017

        INCR    R3                              ; FAAF   000B
        CMPI    #$000B, R3                      ; FAB0   037B 000B
        BLE     L_FAAA                          ; FAB2   0226 0009

        MVII    #$0001, R1                      ; FAB4   02B9 0001
        MVO     R1,     G_0176                  ; FAB6   0241 0176
        MVII    #$0010, R0                      ; FAB8   02B8 0010
        MVII    #$034D, R4                      ; FABA   02BC 034D

        JSR     R5,     X_FILL_ZERO             ; FABC   0004 0114 0338

        MVO     R0,     G_0331                  ; FABF   0240 0331
        CLRR    R0                              ; FAC1   01C0
        MVO     R0,     G_012B                  ; FAC2   0240 012B
        B       L_FB80                          ; FAC4   0200 00BA

L_FAC6:
        MVI     G_033D, R0                      ; FAC6   0280 033D
        DECLE   $03F8,  $0010,  $0240,  $033D   ; FAC8   03F8 0010 0240 033D
        DECLE   $02B8,  $0014,  $0240,  $0343   ; FACC   02B8 0014 0240 0343
        DECLE   $0243,  $0174,  $0339,  $0200   ; FAD0   0243 0174 0339 0200
        DECLE   $0004                           ; FAD4   0004

        ANDR    R3,     R4                      ; FAD5   019C
        BOV     L_FB18                          ; FAD6   0202 0040

        XORR    R1,     R0                      ; FAD8   01C8
        MOVR    R0,     R2                      ; FAD9   0082
        MVII    #$0355, R1                      ; FADA   02B9 0355
        MVII    #$001E, R3                      ; FADC   02BB 001E

        JSR     R5,     .EXEC.9A1               ; FADE   0004 0118 01A1

L_FAE1:
        MVII    #$001E, R0                      ; FAE1   02B8 001E
        MVO     R0,     G_012B                  ; FAE3   0240 012B
        PULR    R7                              ; FAE5   02B7

        PSHR    R5                              ; FAE6   0275
        MVII    #$0200, R4                      ; FAE7   02BC 0200
        MVII    #$00F0, R0                      ; FAE9   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; FAEB   0004 0114 0338

        MVO     R0,     G_016E                  ; FAEE   0240 016E
        MVO     R0,     G_0170                  ; FAF0   0240 0170
        MVII    #$0010, R4                      ; FAF2   02BC 0010
        MVO     R4,     G_0119                  ; FAF4   0244 0119
        CLRR    R4                              ; FAF6   01E4
        MVO     R4,     G_012D                  ; FAF7   0244 012D
        MVO     R4,     G_0317                  ; FAF9   0244 0317
        MVO     R4,     G_0318                  ; FAFB   0244 0318
        MVII    #$0002, R0                      ; FAFD   02B8 0002
        MOVR    R0,     R3                      ; FAFF   0083
        MVII    #$031D, R2                      ; FB00   02BA 031D
        SDBD                                    ; FB02   0001
        MVII    #$90CE, R1                      ; FB03   02B9 00CE 0090

        JSR     R5,     X_INIT_MOBS             ; FB06   0004 0114 02B4

        MVO     R3,     G_011A                  ; FB09   0243 011A
        INCR    R3                              ; FB0B   000B
        MVO     R3,     G_0166                  ; FB0C   0243 0166
        MVO     R3,     G_016F                  ; FB0E   0243 016F
        MVII    #$0012, R0                      ; FB10   02B8 0012
        SDBD                                    ; FB12   0001
        MVII    #$1986, R1                      ; FB13   02B9 0086 0019
        MVII    #$0201, R4                      ; FB16   02BC 0201

L_FB18:
        JSR     R5,     X_FILL_MEM              ; FB18   0004 0114 0341

        ADDI    #$0008, R1                      ; FB1B   02F9 0008
        MVII    #$0213, R4                      ; FB1D   02BC 0213
        MVO@    R1,     R4                      ; FB1F   0261
        ADDI    #$0008, R1                      ; FB20   02F9 0008
        MVII    #$0200, R4                      ; FB22   02BC 0200
        MVO@    R1,     R4                      ; FB24   0261
        MOVR    R7,     R1                      ; FB25   00B9
        ADDI    #$0060, R1                      ; FB26   02F9 0060
        MOVR    R7,     R5                      ; FB28   00BD
        ADDI    #$0063, R5                      ; FB29   02FD 0063
L_FB2B:
        MVII    #$0012, R2                      ; FB2B   02BA 0012
        MVI@    R1,     R0                      ; FB2D   0288
        SLL     R0,     2                       ; FB2E   004C
        SLL     R0,     1                       ; FB2F   0048
        MVI@    R5,     R4                      ; FB30   02AC
L_FB31:
        MVO@    R0,     R4                      ; FB31   0260
        DECR    R2                              ; FB32   0012
        BNEQ    L_FB31                          ; FB33   022C 0003

        INCR    R1                              ; FB35   0009
        MVI@    R1,     R0                      ; FB36   0288
        TSTR    R0                              ; FB37   0080
        BNEQ    L_FB2B                          ; FB38   022C 000E

        CLRR    R4                              ; FB3A   01E4
        MOVR    R7,     R5                      ; FB3B   00BD
        ADDI    #$005F, R5                      ; FB3C   02FD 005F
        MOVR    R7,     R1                      ; FB3E   00B9
        ADDI    #$0063, R1                      ; FB3F   02F9 0063
L_FB41:
        MVI@    R5,     R3                      ; FB41   02AB
        MVI@    R1,     R2                      ; FB42   028A
L_FB43:
        MVII    #$0008, R0                      ; FB43   02B8 0008
        SWAP    R0,     1                       ; FB45   0040
        XORR    R4,     R0                      ; FB46   01E0
        MVO@    R0,     R3                      ; FB47   0258
        ADDI    #$0014, R3                      ; FB48   02FB 0014
        ADDI    #$0008, R4                      ; FB4A   02FC 0008
        DECR    R2                              ; FB4C   0012
        BNEQ    L_FB43                          ; FB4D   022C 000B

        INCR    R1                              ; FB4F   0009
        MVI@    R1,     R0                      ; FB50   0288
        TSTR    R0                              ; FB51   0080
        BNEQ    L_FB41                          ; FB52   022C 0012

        INCR    R1                              ; FB54   0009
        MOVR    R7,     R4                      ; FB55   00BC
        ADDI    #$003B, R4                      ; FB56   02FC 003B
        MVI@    R5,     R3                      ; FB58   02AB
        MVI@    R1,     R2                      ; FB59   028A
L_FB5A:
        MVI@    R4,     R0                      ; FB5A   02A0
        SLL     R0,     2                       ; FB5B   004C
        SLL     R0,     1                       ; FB5C   0048
        MVO@    R0,     R3                      ; FB5D   0258
        ADDI    #$0014, R3                      ; FB5E   02FB 0014
        DECR    R2                              ; FB60   0012
        BNEQ    L_FB5A                          ; FB61   022C 0008

        MVII    #$0003, R4                      ; FB63   02BC 0003
        MVII    #$0229, R1                      ; FB65   02B9 0229
        MVII    #$0020, R2                      ; FB67   02BA 0020
        SWAP    R2,     1                       ; FB69   0042
L_FB6A:
        MVI@    R1,     R0                      ; FB6A   0288
        XORR    R2,     R0                      ; FB6B   01D0
        MVO@    R0,     R1                      ; FB6C   0248
        ADDI    #$0012, R1                      ; FB6D   02F9 0012
        MVI@    R1,     R0                      ; FB6F   0288
        XORR    R2,     R0                      ; FB70   01D0
        MVO@    R0,     R1                      ; FB71   0248
        ADDI    #$0002, R1                      ; FB72   02F9 0002
        DECR    R4                              ; FB74   0014
        BNEQ    L_FB6A                          ; FB75   022C 000C

        DECR    R1                              ; FB77   0011
        MVI@    R1,     R0                      ; FB78   0288
        XORR    R2,     R0                      ; FB79   01D0
        MVO@    R0,     R1                      ; FB7A   0248
        MVII    #$020E, R1                      ; FB7B   02B9 020E
        MVII    #$0087, R0                      ; FB7D   02B8 0087
        MVO@    R0,     R1                      ; FB7F   0248
L_FB80:
        MOVR    R7,     R0                      ; FB80   00B8
        ADDI    #$0029, R0                      ; FB81   02F8 0029
        MVO     R0,     G_035D                  ; FB83   0240 035D
        PULR    R7                              ; FB85   02B7

        SLLC    R3,     2                       ; FB86   005F
        ADDR    R1,     R5                      ; FB87   00CD
        ADDR    R1,     R7                      ; FB88   00CF

        ADDR    R1,     R4                      ; FB89   00CC
        ADDR    R1,     R7                      ; FB8A   00CF

        DECLE   $0000,  $0215,  $023D           ; FB8B   0000 0215 023D

        MVO@    R5,     R4                      ; FB8E   0265
        PULR    R5                              ; FB8F   02B5
        ADD@    R3,     R5                      ; FB90   02DD
        ADDR    R0,     R1                      ; FB91   00C1
        SUBR    R5,     R6                      ; FB92   012E
        ADDR    R0,     R1                      ; FB93   00C1
        SUBR    R2,     R3                      ; FB94   0113
        ADDR    R0,     R1                      ; FB95   00C1
        ADDR    R0,     R1                      ; FB96   00C1
        ADDR    R0,     R1                      ; FB97   00C1
        SUBR    R5,     R7                      ; FB98   012F

        DECLE   $00C1,  $0113,  $022D,  $0236   ; FB99   00C1 0113 022D 0236
        DECLE   $0227,  $0214,  $0229,  $023A   ; FB9D   0227 0214 0229 023A
        DECLE   $0231,  $000A,  $000A,  $000B   ; FBA1   0231 000A 000A 000B
        DECLE   $000B,  $0002,  $0002,  $0000   ; FBA5   000B 0002 0002 0000
        DECLE   $000A,  $002A,  $0093,  $005F   ; FBA9   000A 002A 0093 005F
        DECLE   $0093,  $0000,  $0000,  $0000   ; FBAD   0093 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; FBB1   0000 0000 0000

        PSHR    R5                              ; FBB4   0275
        MVI     G_016F, R3                      ; FBB5   0283 016F
        TSTR    R3                              ; FBB7   009B
        BNEQ    L_FCD1                          ; FBB8   020C 0117

        MVII    #$00FF, R0                      ; FBBA   02B8 00FF
        MVO     R0,     G_0178                  ; FBBC   0240 0178
        MOVR    R4,     R3                      ; FBBE   00A3
        MVII    #$0080, R4                      ; FBBF   02BC 0080
L_FBC1:
        MVII    #$0007, R0                      ; FBC1   02B8 0007
        MVO     R0,     G_0171                  ; FBC3   0240 0171
        MVII    #$0004, R0                      ; FBC5   02B8 0004

        JSR     R5,     X_RAND2                 ; FBC7   0004 0114 029E

        XORR    R0,     R4                      ; FBCA   01C4
        MOVR    R0,     R5                      ; FBCB   0085
        SLL     R0,     2                       ; FBCC   004C
        SLL     R0,     1                       ; FBCD   0048
        ADDR    R5,     R0                      ; FBCE   00E8
        MVO     R0,     G_015E                  ; FBCF   0240 015E
        MVO     R4,     G_015F                  ; FBD1   0244 015F
L_FBD3:
        MVO     R3,     G_0165                  ; FBD3   0243 0165
        MOVR    R1,     R4                      ; FBD5   008C
        PSHR    R1                              ; FBD6   0271
        SDBD                                    ; FBD7   0001
        MVII    #$1846, R0                      ; FBD8   02B8 0046 0018
        MVO@    R0,     R4                      ; FBDB   0260
        INCR    R4                              ; FBDC   000C
        MOVR    R7,     R5                      ; FBDD   00BD
        ADDI    #$016F, R5                      ; FBDE   02FD 016F
        ADD     G_015E, R5                      ; FBE0   02C5 015E
        MVI@    R5,     R0                      ; FBE2   02A8
        SWAP    R0,     1                       ; FBE3   0040
        MVO@    R0,     R4                      ; FBE4   0260
        MVI@    R5,     R0                      ; FBE5   02A8
        SWAP    R0,     1                       ; FBE6   0040
        MVO@    R0,     R4                      ; FBE7   0260
        MVI@    R5,     R0                      ; FBE8   02A8
        MVO     R0,     G_0164                  ; FBE9   0240 0164
        MVII    #$0003, R4                      ; FBEB   02BC 0003
        MOVR    R7,     R3                      ; FBED   00BB
        ADDI    #$0180, R3                      ; FBEE   02FB 0180
        ADD     G_0165, R3                      ; FBF0   02C3 0165
        ADD     G_0165, R3                      ; FBF2   02C3 0165
        ADD     G_0165, R3                      ; FBF4   02C3 0165
        MVII    #$0002, R0                      ; FBF6   02B8 0002
L_FBF8:
        MVI     G_016D, R1                      ; FBF8   0281 016D
        MVII    #$0005, R2                      ; FBFA   02BA 0005

        JSR     R5,     X_DIV                   ; FBFC   0004 011C 01FB

        MOVR    R3,     R2                      ; FBFF   009A
        ADDR    R0,     R2                      ; FC00   00C2
        MVI@    R2,     R0                      ; FC01   0290
        SUBI    #$0004, R1                      ; FC02   0339 0004
        BEQ     L_FC0A                          ; FC04   0204 0004

L_FC06:
        SLR     R0,     2                       ; FC06   0064
        INCR    R1                              ; FC07   0009
        BNEQ    L_FC06                          ; FC08   022C 0003

L_FC0A:
        ANDI    #$0003, R0                      ; FC0A   03B8 0003
        PSHR    R0                              ; FC0C   0270
        ADDI    #$0009, R3                      ; FC0D   02FB 0009
        DECR    R4                              ; FC0F   0014
        BNEQ    L_FBF8                          ; FC10   022C 0019

        MVII    #$0166, R1                      ; FC12   02B9 0166
        ADD     G_0165, R1                      ; FC14   02C1 0165
        PULR    R4                              ; FC16   02B4
        MVI     G_0317, R0                      ; FC17   0280 0317
        CMPI    #$0008, R0                      ; FC19   0378 0008
        BLT     L_FC27                          ; FC1B   0205 000A

        MVII    #$0002, R0                      ; FC1D   02B8 0002

        JSR     R5,     X_RAND2                 ; FC1F   0004 0114 029E

        TSTR    R0                              ; FC22   0080
        BNEQ    L_FC27                          ; FC23   020C 0002

        MVII    #$00C0, R4                      ; FC25   02BC 00C0
L_FC27:
        MVO@    R4,     R1                      ; FC27   024C
        PULR    R3                              ; FC28   02B3
        PULR    R2                              ; FC29   02B2
        PULR    R1                              ; FC2A   02B1
        PSHR    R1                              ; FC2B   0271
        CMPI    #$0003, R2                      ; FC2C   037A 0003
        BNEQ    L_FC37                          ; FC2E   020C 0007

        MVI@    R1,     R0                      ; FC30   0288
        SDBD                                    ; FC31   0001
        MVII    #$185B, R0                      ; FC32   02B8 005B 0018
        MVO@    R0,     R1                      ; FC35   0248
        CLRR    R2                              ; FC36   01D2
L_FC37:
        ADDI    #$0007, R1                      ; FC37   02F9 0007
        MVII    #$000A, R0                      ; FC39   02B8 000A
        ADDR    R2,     R0                      ; FC3B   00D0
        SLL     R2,     2                       ; FC3C   004E
        ADDR    R2,     R0                      ; FC3D   00D0
        PSHR    R0                              ; FC3E   0270
        SLR     R0,     1                       ; FC3F   0060

        JSR     R5,     X_RAND2                 ; FC40   0004 0114 029E

        ADD@    R6,     R0                      ; FC43   02F0
        MOVR    R0,     R5                      ; FC44   0085
        SWAP    R0,     1                       ; FC45   0040
        XORR    R5,     R0                      ; FC46   01E8
        MVO@    R0,     R1                      ; FC47   0248
        SUBI    #$0007, R1                      ; FC48   0339 0007
        CLRR    R2                              ; FC4A   01D2
        CMPI    #$00C0, R4                      ; FC4B   037C 00C0
        BNEQ    L_FC70                          ; FC4D   020C 0021

        SDBD                                    ; FC4F   0001
        MVII    #$585A, R0                      ; FC50   02B8 005A 0058
        MVO@    R0,     R1                      ; FC53   0248
        ADDI    #$0008, R1                      ; FC54   02F9 0008
        MVII    #$0008, R0                      ; FC56   02B8 0008
        MOVR    R1,     R4                      ; FC58   008C

        JSR     R5,     X_FILL_ZERO             ; FC59   0004 0114 0338

        MOVR    R1,     R4                      ; FC5C   008C
        SDBD                                    ; FC5D   0001
        MVII    #$1807, R0                      ; FC5E   02B8 0007 0018
        MVO@    R0,     R4                      ; FC61   0260
        SDBD                                    ; FC62   0001
        MVII    #$9152, R0                      ; FC63   02B8 0052 0091
        MVO@    R0,     R4                      ; FC66   0260
        ADDI    #$0003, R4                      ; FC67   02FC 0003
        MVII    #$0002, R0                      ; FC69   02B8 0002
        MVO@    R0,     R4                      ; FC6B   0260
        CLRR    R4                              ; FC6C   01E4
        MOVR    R1,     R2                      ; FC6D   008A
        B       L_FC8F                          ; FC6E   0200 001F

L_FC70:
        CMPI    #$0002, R4                      ; FC70   037C 0002
        BNEQ    L_FC85                          ; FC72   020C 0011

        MVI@    R1,     R0                      ; FC74   0288
        SDBD                                    ; FC75   0001
        MVII    #$1840, R0                      ; FC76   02B8 0040 0018
        MVO@    R0,     R1                      ; FC79   0248
        MVI     G_016D, R0                      ; FC7A   0280 016D
        SLR     R0,     1                       ; FC7C   0060

        JSR     R5,     X_RAND2                 ; FC7D   0004 0114 029E

        MOVR    R7,     R5                      ; FC80   00BD
        ADDI    #$010B, R5                      ; FC81   02FD 010B
        ADDR    R0,     R5                      ; FC83   00C5
        MVI@    R5,     R2                      ; FC84   02AA
L_FC85:
        MOVR    R2,     R4                      ; FC85   0094
        ADDI    #$0008, R1                      ; FC86   02F9 0008
        MOVR    R1,     R2                      ; FC88   008A
        MOVR    R7,     R1                      ; FC89   00B9
        ADDI    #$0109, R1                      ; FC8A   02F9 0109

        JSR     R5,     X_INIT_MOB              ; FC8C   0004 0114 02B2

L_FC8F:
        MVI     G_0165, R0                      ; FC8F   0280 0165
        SLL     R0,     1                       ; FC91   0048
        INCR    R0                              ; FC92   0008

        JSR     R5,     .EXEC.6CF               ; FC93   0004 0114 02CF
        DECLE   $0290,  $01E0,  $0250,  $02FA   ; FC96   0290 01E0 0250 02FA
        DECLE   $0007,  $02B8,  $001E,  $00D8   ; FC9A   0007 02B8 001E 00D8
        DECLE   $004F,  $00D8,  $0250,  $0280   ; FC9E   004F 00D8 0250 0280
        DECLE   $0164,  $0004                   ; FCA2   0164 0004

        ANDR    R2,     R4                      ; FCA4   0194
        ADDR    R7,     R0                      ; FCA5   00F8
        PULR    R1                              ; FCA6   02B1
        MVI     G_0317, R0                      ; FCA7   0280 0317
        TSTR    R0                              ; FCA9   0080
        BEQ     L_FCBA                          ; FCAA   0204 000E

        MVII    #$000C, R0                      ; FCAC   02B8 000C

        JSR     R5,     X_RAND2                 ; FCAE   0004 0114 029E

        TSTR    R0                              ; FCB1   0080
        BNEQ    L_FCBA                          ; FCB2   020C 0006

        MVI@    R1,     R2                      ; FCB4   028A
        SDBD                                    ; FCB5   0001
        ANDI    #$EFFF, R0                      ; FCB6   03B8 00FF 00EF
        MVO@    R2,     R1                      ; FCB9   024A
L_FCBA:
        SUBI    #$0010, R1                      ; FCBA   0339 0010
        DECLE   $0280,  $015E,  $02F8,  $0003   ; FCBC   0280 015E 02F8 0003
        DECLE   $0240,  $015E,  $0283,  $016F   ; FCC0   0240 015E 0283 016F
        DECLE   $009B,  $0204,  $0006,  $0013   ; FCC4   009B 0204 0006 0013
        DECLE   $0243,  $016F,  $009B,  $022C   ; FCC8   0243 016F 009B 022C
        DECLE   $00F9,  $0004                   ; FCCC   00F9 0004

        ANDR    R3,     R0                      ; FCCE   0198
        SAR     R2,     1                       ; FCCF   006A
        PULR    R7                              ; FCD0   02B7

L_FCD1:
        MVII    #$0030, R0                      ; FCD1   02B8 0030
        MVII    #$032D, R4                      ; FCD3   02BC 032D

        JSR     R5,     X_FILL_ZERO             ; FCD5   0004 0114 0338

        CLRR    R4                              ; FCD8   01E4
        MVO     R4,     G_0178                  ; FCD9   0244 0178
        MVI     G_0172, R0                      ; FCDB   0280 0172
        TSTR    R0                              ; FCDD   0080
        BEQ     L_FBC1                          ; FCDE   0224 011E

        MVO     R0,     G_0173                  ; FCE0   0240 0173
        MVO     R4,     G_012B                  ; FCE2   0244 012B
        MVO     R4,     G_0177                  ; FCE4   0244 0177
        INCR    R4                              ; FCE6   000C
        MVO     R4,     G_0171                  ; FCE7   0244 0171
        MOVR    R7,     R5                      ; FCE9   00BD
        ADDI    #$00B9, R5                      ; FCEA   02FD 00B9
        MVII    #$032D, R4                      ; FCEC   02BC 032D
L_FCEE:
        SDBD                                    ; FCEE   0001
        MVI@    R5,     R0                      ; FCEF   02A8
        MVO@    R0,     R4                      ; FCF0   0260
        SDBD                                    ; FCF1   0001
        MVI@    R5,     R0                      ; FCF2   02A8
        MVO@    R0,     R4                      ; FCF3   0260
        ADDI    #$0002, R4                      ; FCF4   02FC 0002
        SDBD                                    ; FCF6   0001
        MVI@    R5,     R0                      ; FCF7   02A8
        MVO@    R0,     R4                      ; FCF8   0260
        ADDI    #$0003, R4                      ; FCF9   02FC 0003
        CMPI    #$0355, R4                      ; FCFB   037C 0355
        BLE     L_FCEE                          ; FCFD   0226 0010

        MVII    #$032F, R4                      ; FCFF   02BC 032F
        MVII    #$0003, R0                      ; FD01   02B8 0003

        JSR     R5,     X_RAND2                 ; FD03   0004 0114 029E

        MOVR    R7,     R5                      ; FD06   00BD
        ADDI    #$00C0, R5                      ; FD07   02FD 00C0
        ADDR    R0,     R5                      ; FD09   00C5
        ADDR    R0,     R5                      ; FD0A   00C5
        MVI@    R5,     R0                      ; FD0B   02A8
        SWAP    R0,     1                       ; FD0C   0040
        MVO@    R0,     R4                      ; FD0D   0260
        MVI@    R5,     R0                      ; FD0E   02A8
        SWAP    R0,     1                       ; FD0F   0040
        MVO@    R0,     R4                      ; FD10   0260
        MVI     G_011A, R0                      ; FD11   0280 011A
        XORI    #$00F8, R0                      ; FD13   03F8 00F8
        MVO     R0,     G_011A                  ; FD15   0240 011A
        MVII    #$00A0, R0                      ; FD17   02B8 00A0
        MVO     R0,     G_0342                  ; FD19   0240 0342
        MVII    #$00D0, R0                      ; FD1B   02B8 00D0
        MVO     R0,     G_034A                  ; FD1D   0240 034A
        MVII    #$032D, R1                      ; FD1F   02B9 032D
        MVII    #$0014, R0                      ; FD21   02B8 0014

        JSR     R5,     X_RAND2                 ; FD23   0004 0114 029E

        ADDI    #$003E, R0                      ; FD26   02F8 003E
        SWAP    R0,     1                       ; FD28   0040
        MOVR    R0,     R2                      ; FD29   0082
        MVII    #$0014, R0                      ; FD2A   02B8 0014

        JSR     R5,     X_RAND2                 ; FD2C   0004 0114 029E

        ADDI    #$0022, R0                      ; FD2F   02F8 0022
        XORR    R0,     R2                      ; FD31   01C2
        MVII    #$0003, R0                      ; FD32   02B8 0003

        JSR     R5,     X_RAND2                 ; FD34   0004 0114 029E

        MVII    #$0007, R3                      ; FD37   02BB 0007
        ADDR    R0,     R3                      ; FD39   00C3

        JSR     R5,     .EXEC.9A1               ; FD3A   0004 0118 01A1
        DECLE   $0001,  $02B8,  $0028,  $0091   ; FD3D   0001 02B8 0028 0091
        DECLE   $0240,  $0326,  $02B8,  $0001   ; FD41   0240 0326 02B8 0001
        DECLE   $0240,  $032B,  $02BA,  $00C0   ; FD45   0240 032B 02BA 00C0
        DECLE   $0004                           ; FD49   0004

        ANDR    R3,     R0                      ; FD4A   0198
        MOVR    R4,     R3                      ; FD4B   00A3
        PULR    R7                              ; FD4C   02B7

        DECLE   $0040,  $0010,  $000C,  $0058   ; FD4D   0040 0010 000C 0058
        DECLE   $0010,  $000C,  $006F,  $0010   ; FD51   0010 000C 006F 0010
        DECLE   $000C,  $009A,  $0027,  $0008   ; FD55   000C 009A 0027 0008
        DECLE   $009C,  $0037                   ; FD59   009C 0037

        INCR    R0                              ; FD5B   0008
        MOVR    R3,     R6                      ; FD5C   009E
        SWAP    R3,     2                       ; FD5D   0047
        INCR    R0                              ; FD5E   0008
        SWAP    R0,     1                       ; FD5F   0040
        SLLC    R3,     2                       ; FD60   005F

        JSR     R4,     L_585F                  ; FD61   0004 0058 005F
        DECLE   $0004,  $006F,  $005F,  $0004   ; FD64   0004 006F 005F 0004
        DECLE   $000C,  $0027,  $0000,  $000A   ; FD68   000C 0027 0000 000A
        DECLE   $0037,  $0000,  $0009,  $0047   ; FD6C   0037 0000 0009 0047
        DECLE   $0000,  $0000,  $0135,  $029E   ; FD70   0000 0000 0135 029E
        DECLE   $0005,  $0155,  $037A,  $0015   ; FD74   0005 0155 037A 0015
        DECLE   $0157,  $01AA,  $0055,  $0105   ; FD78   0157 01AA 0055 0105
        DECLE   $0196,  $0015,  $0159,  $015A   ; FD7C   0196 0015 0159 015A
        DECLE   $0005,  $0154,  $01AA,  $0000   ; FD80   0005 0154 01AA 0000
        DECLE   $0105,  $0296,  $0005,  $0159   ; FD84   0105 0296 0005 0159
        DECLE   $015A,  $0001,  $0195,  $01AA   ; FD88   015A 0001 0195 01AA
        DECLE   $0000,  $0000,  $0012,  $0006   ; FD8C   0000 0000 0012 0006
        DECLE   $0012,  $0006,  $0012,  $0081   ; FD90   0012 0006 0012 0081
        DECLE   $0010,  $00FC,  $0090,  $0000   ; FD94   0010 00FC 0090 0000
        DECLE   $0053,  $0000,  $0001,  $0000   ; FD98   0053 0000 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD9C   0000 0000 0000 0000
        DECLE   $0000,  $001E,  $0000,  $0042   ; FDA0   0000 001E 0000 0042
        DECLE   $0079,  $0039,  $0091,  $0000   ; FDA4   0079 0039 0091 0000
        DECLE   $0000,  $0042,  $007B,  $0039   ; FDA8   0000 0042 007B 0039
        DECLE   $0091,  $0000                   ; FDAC   0091 0000

        INCR    R7                              ; FDAE   000F
        MOVR    R2,     R7                      ; FDAF   0097

L_FDB0:
        SLLC    R0,     1                       ; FDB0   0058
        DECLE   $004B,  $0091,  $0000,  $00FC   ; FDB1   004B 0091 0000 00FC
        DECLE   $0004,  $0078,  $0042,  $0091   ; FDB5   0004 0078 0042 0091
        DECLE   $0001,  $00FC,  $0047,  $0058   ; FDB9   0001 00FC 0047 0058
        DECLE   $0052,  $0091,  $0004,  $0004   ; FDBD   0052 0091 0004 0004
        DECLE   $0087,  $0058,  $005B,  $0091   ; FDC1   0087 0058 005B 0091
        DECLE   $0000,  $0000,  $0001,  $0024   ; FDC5   0000 0000 0001 0024
        DECLE   $0040,  $0001,  $00A4,  $0037   ; FDC9   0040 0001 00A4 0037

        PSHR    R5                              ; FDCD   0275
        MVII    #$031D, R1                      ; FDCE   02B9 031D
L_FDD0:
        MOVR    R1,     R3                      ; FDD0   008B
        DECLE   $02FB,  $0008,  $0298,  $03B8   ; FDD1   02FB 0008 0298 03B8
        DECLE   $0008,  $0204,  $001C,  $008C   ; FDD5   0008 0204 001C 008C
        DECLE   $0004                           ; FDD9   0004

        ANDR    R2,     R4                      ; FDDA   0194
        TSTR    R2                              ; FDDB   0092
        BC      L_FDEE                          ; FDDC   0201 0010

        CMPI    #$031D, R1                      ; FDDE   0379 031D
        BNEQ    L_FDE7                          ; FDE0   020C 0005

        MVI     G_0329, R0                      ; FDE2   0280 0329
        TSTR    R0                              ; FDE4   0080
        BEQ     L_FDFB                          ; FDE5   0204 0014

L_FDE7:
        MOVR    R1,     R2                      ; FDE7   008A
        DECLE   $0099,  $0004                   ; FDE8   0099 0004

        ANDR    R3,     R0                      ; FDEA   0198
        CMPR    R1,     R0                      ; FDEB   0148
        B       L_FDF3                          ; FDEC   0200 0005

L_FDEE:
        ADDI    #$0008, R1                      ; FDEE   02F9 0008

        JSR     R5,     .EXEC.7AE               ; FDF0   0004 0114 03AE

L_FDF3:
        MOVR    R4,     R1                      ; FDF3   00A1
L_FDF4:
        ADDI    #$0010, R1                      ; FDF4   02F9 0010
        CMPI    #$034D, R1                      ; FDF6   0379 034D
        BLE     L_FDD0                          ; FDF8   0226 0029
        PULR    R7                              ; FDFA   02B7

L_FDFB:
        MVII    #$0001, R0                      ; FDFB   02B8 0001

        JSR     R5,     .EXEC.6CF               ; FDFD   0004 0114 02CF

        B       L_FDF4                          ; FE00   0220 000D

        PSHR    R5                              ; FE02   0275
        MVII    #$0014, R2                      ; FE03   02BA 0014

        JSR     R5,     X_DIV                   ; FE05   0004 011C 01FB

        INCR    R0                              ; FE08   0008
        SLL     R0,     2                       ; FE09   004C
        SLL     R0,     1                       ; FE0A   0048
        INCR    R1                              ; FE0B   0009
        SLL     R1,     2                       ; FE0C   004D
        SLL     R1,     1                       ; FE0D   0049
        SWAP    R1,     1                       ; FE0E   0041
        SWAP    R0,     1                       ; FE0F   0040
        PULR    R7                              ; FE10   02B7

        PSHR    R5                              ; FE11   0275
        MVII    #$0335, R1                      ; FE12   02B9 0335
L_FE14:
        MVI@    R1,     R0                      ; FE14   0288
        DECLE   $03B8,  $0017,  $0378,  $0007   ; FE15   03B8 0017 0378 0007
        DECLE   $020C,  $000F,  $008B,  $02FB   ; FE19   020C 000F 008B 02FB
        DECLE   $0005,  $0298,  $0378,  $0004   ; FE1D   0005 0298 0378 0004
        DECLE   $020C,  $0007,  $008C,  $02BA   ; FE21   020C 0007 008C 02BA
        DECLE   $031D,  $0004                   ; FE25   031D 0004

        ANDR    R3,     R0                      ; FE27   0198
        CMPR    R1,     R0                      ; FE28   0148
        MOVR    R4,     R1                      ; FE29   00A1
        ADDI    #$0010, R1                      ; FE2A   02F9 0010
        CMPI    #$0355, R1                      ; FE2C   0379 0355
        BLE     L_FE14                          ; FE2E   0226 001B
        PULR    R7                              ; FE30   02B7

        PSHR    R5                              ; FE31   0275
        MVI     G_0176, R0                      ; FE32   0280 0176
        SLL     R0,     1                       ; FE34   0048
        ADDR    R0,     R7                      ; FE35   00C7
        B       L_FE48                          ; FE36   0200 0010
        B       L_FE3F                          ; FE38   0200 0005

        DECLE   $0004                           ; FE3A   0004

        ANDR    R3,     R4                      ; FE3B   019C
        ANDI    #$0200, R2                      ; FE3C   03BA 0200
        INCR    R1                              ; FE3E   0009
L_FE3F:
        MVI     G_0323, R0                      ; FE3F   0280 0323
        DECLE   $0378,  $0028,  $020E,  $0003   ; FE41   0378 0028 020E 0003
        DECLE   $0004                           ; FE45   0004

        ANDR    R3,     R4                      ; FE46   019C
        AND@    R5,     R3                      ; FE47   03AB
L_FE48:
        CLRR    R0                              ; FE48   01C0
        MVII    #$031D, R1                      ; FE49   02B9 031D
L_FE4B:
        PSHR    R1                              ; FE4B   0271
        MVO     R0,     G_015E                  ; FE4C   0240 015E
        ADDI    #$0004, R1                      ; FE4E   02F9 0004
        MVI@    R1,     R2                      ; FE50   028A
        MVI@    R1,     R3                      ; FE51   028B
        SWAP    R2,     1                       ; FE52   0042
        ANDI    #$00FF, R2                      ; FE53   03BA 00FF
        BNEQ    L_FE5B                          ; FE55   020C 0004

        SWAP    R3,     1                       ; FE57   0043
        TSTR    R3                              ; FE58   009B
        BPL     L_FE7E                          ; FE59   0203 0023

L_FE5B:
        MVII    #$0010, R2                      ; FE5B   02BA 0010
        MVII    #$0014, R3                      ; FE5D   02BB 0014
        MVII    #$0093, R4                      ; FE5F   02BC 0093
        DECR    R1                              ; FE61   0011
        MVI@    R1,     R0                      ; FE62   0288
        SWAP    R0,     1                       ; FE63   0040
        ANDI    #$00FF, R0                      ; FE64   03B8 00FF
L_FE66:
        CMPR    R2,     R0                      ; FE66   0150
        BLE     L_FE6F                          ; FE67   0206 0006

        ADDI    #$0008, R2                      ; FE69   02FA 0008
        DECR    R3                              ; FE6B   0013
        INCR    R4                              ; FE6C   000C
        B       L_FE66                          ; FE6D   0220 0008

L_FE6F:
        MVO     R0,     G_015F                  ; FE6F   0240 015F
        DECR    R1                              ; FE71   0011
        MVI@    R1,     R0                      ; FE72   0288
        SWAP    R0,     1                       ; FE73   0040
        ANDI    #$00FF, R0                      ; FE74   03B8 00FF
        ADDI    #$0002, R1                      ; FE76   02F9 0002
        CMPR    R3,     R0                      ; FE78   0158
        BLT     L_FE89                          ; FE79   0205 000E

        CMPR    R4,     R0                      ; FE7B   0160
        BGT     L_FEAD                          ; FE7C   020E 002F

L_FE7E:
        PULR    R1                              ; FE7E   02B1
        ADDI    #$0008, R1                      ; FE7F   02F9 0008
        MVI     G_015E, R0                      ; FE81   0280 015E
        INCR    R0                              ; FE83   0008
        CMP     G_0171, R0                      ; FE84   0340 0171
        BLE     L_FE4B                          ; FE86   0226 003C
        PULR    R7                              ; FE88   02B7

L_FE89:
        CLRR    R4                              ; FE89   01E4
        MVII    #$0001, R2                      ; FE8A   02BA 0001
        MVI@    R1,     R0                      ; FE8C   0288
        SDBD                                    ; FE8D   0001
        ANDI    #$FF00, R0                      ; FE8E   03B8 0000 00FF
        TSTR    R0                              ; FE91   0080
        BEQ     L_FE96                          ; FE92   0204 0002
        BPL     L_FE7E                          ; FE94   0223 0017

L_FE96:
        MVI     G_015E, R0                      ; FE96   0280 015E
        DECLE   $0078,  $0201,  $0028,  $0050   ; FE98   0078 0201 0028 0050
        DECLE   $0204,  $0018                   ; FE9C   0204 0018

        MVI@    R1,     R3                      ; FE9E   028B
        SWAP    R3,     1                       ; FE9F   0043
        ANDI    #$00FF, R3                      ; FEA0   03BB 00FF
        BNEQ    L_FEA6                          ; FEA2   020C 0002

        MVII    #$0003, R2                      ; FEA4   02BA 0003
L_FEA6:
        SUBI    #$0004, R1                      ; FEA6   0339 0004
        DECLE   $0004                           ; FEA8   0004

        ANDR    R2,     R4                      ; FEA9   0194
        RSWD    R5                              ; FEAA   003D
        B       L_FE7E                          ; FEAB   0220 002E

L_FEAD:
        MVII    #$0001, R4                      ; FEAD   02BC 0001
        CLRR    R2                              ; FEAF   01D2
        MVI@    R1,     R0                      ; FEB0   0288
        TSTR    R0                              ; FEB1   0080
        BMI     L_FE7E                          ; FEB2   022B 0035
        B       L_FE96                          ; FEB4   0220 001F

        DECLE   $0004                           ; FEB6   0004

        ANDR    R3,     R4                      ; FEB7   019C
        ADD@    R2,     R7                      ; FEB8   02D7
        BC      L_FE7E                          ; FEB9   0221 003C

        CLRR    R0                              ; FEBB   01C0
        MVO@    R0,     R1                      ; FEBC   0248
        MVI     G_0160, R2                      ; FEBD   0282 0160
        MVO     R2,     G_0170                  ; FEBF   0242 0170
        B       L_FE7E                          ; FEC1   0220 0044

        DECLE   $0009,  $028A,  $037A,  $0004   ; FEC3   0009 028A 037A 0004
        DECLE   $022C,  $004A,  $0011,  $0080   ; FEC7   022C 004A 0011 0080
        DECLE   $020C,  $0003,  $0004,  $019C   ; FECB   020C 0003 0004 019C
        DECLE   $02E3,  $0339,  $0004,  $0004   ; FECF   02E3 0339 0004 0004

        ANDR    R2,     R4                      ; FED3   0194
        COMR    R1                              ; FED4   0019
        B       L_FE7E                          ; FED5   0220 0058

        PSHR    R5                              ; FED7   0275
        MVO     R2,     G_0160                  ; FED8   0242 0160
        MVI     G_031E, R0                      ; FEDA   0280 031E
        SDBD                                    ; FEDC   0001
        CMPI    #$90F5, R0                      ; FEDD   0378 00F5 0090
        BEQ     L_FEF7                          ; FEE0   0204 0015
        INCR    R7                              ; FEE2   000F

        PSHR    R5                              ; FEE3   0275
L_FEE4:
        MVI     G_015F, R0                      ; FEE4   0280 015F
        DECLE   $02BA,  $000C,  $0242,  $0161   ; FEE6   02BA 000C 0242 0161
        DECLE   $0001,  $02BA,  $00CE,  $0098   ; FEEA   0001 02BA 00CE 0098
        DECLE   $00A3,  $02BC,  $0026,  $0271   ; FEEE   00A3 02BC 0026 0271
        DECLE   $0004                           ; FEF2   0004

        ANDR    R3,     R0                      ; FEF3   0198
        ADDR    R2,     R7                      ; FEF4   00D7

        PULR    R1                              ; FEF5   02B1
        PULR    R7                              ; FEF6   02B7

L_FEF7:
        CLRC                                    ; FEF7   0006
        PULR    R7                              ; FEF8   02B7

        PSHR    R5                              ; FEF9   0275
        PSHR    R3                              ; FEFA   0273
        MVI     G_0318, R0                      ; FEFB   0280 0318
        MVI     G_0317, R1                      ; FEFD   0281 0317
        ADDR    R2,     R0                      ; FEFF   00D0
L_FF00:
        SDBD                                    ; FF00   0001
        CMPI    #$270F, R0                      ; FF01   0378 000F 0027
        BGT     L_FF38                          ; FF04   020E 0032

        MVI     G_016D, R3                      ; FF06   0283 016D
        MOVR    R7,     R4                      ; FF08   00BC
        ADDI    #$0039, R4                      ; FF09   02FC 0039
        ADDR    R3,     R4                      ; FF0B   00DC
L_FF0C:
        CMPI    #$000E, R3                      ; FF0C   037B 000E
        BGE     L_FF1C                          ; FF0E   020D 000C

        TSTR    R1                              ; FF10   0089
        BNEQ    L_FF3F                          ; FF11   020C 002C

        MVI@    R4,     R2                      ; FF13   02A2
        MOVR    R2,     R5                      ; FF14   0095
        SLL     R2,     2                       ; FF15   004E
        SLL     R2,     1                       ; FF16   004A
        ADDR    R5,     R2                      ; FF17   00EA
        ADDR    R5,     R2                      ; FF18   00EA
        CMPR    R2,     R0                      ; FF19   0150
        BGE     L_FF3F                          ; FF1A   020D 0023

L_FF1C:
        MVO     R0,     G_0318                  ; FF1C   0240 0318
        MVO     R1,     G_0317                  ; FF1E   0241 0317
        MVO     R3,     G_016D                  ; FF20   0243 016D
        MOVR    R1,     R5                      ; FF22   008D
        MVII    #$0004, R1                      ; FF23   02B9 0004
        MVII    #$020A, R4                      ; FF25   02BC 020A
        MVII    #$0007, R3                      ; FF27   02BB 0007
        TSTR    R5                              ; FF29   00AD
        BEQ     L_FF33                          ; FF2A   0204 0007

        PSHR    R5                              ; FF2C   0275

        JSR     R5,     X_PRNUM_ZRO             ; FF2D   0004 0118 00AD

        PULR    R0                              ; FF30   02B0
        SUBI    #$0004, R4                      ; FF31   033C 0004

L_FF33:
        JSR     R5,     X_PRNUM_RGT             ; FF33   0004 0118 00C5

        PULR    R3                              ; FF36   02B3
        PULR    R7                              ; FF37   02B7

L_FF38:
        INCR    R1                              ; FF38   0009
        SDBD                                    ; FF39   0001
        SUBI    #$2710, R0                      ; FF3A   0338 0010 0027
        B       L_FF00                          ; FF3D   0220 003E

L_FF3F:
        INCR    R3                              ; FF3F   000B
        B       L_FF0C                          ; FF40   0220 0035

        INCR    R2                              ; FF42   000A
        DECR    R4                              ; FF43   0014
        COMR    R6                              ; FF44   001E
        GSWD    R2                              ; FF45   0032
        SLL     R3,     1                       ; FF46   004B
        SLR     R0,     2                       ; FF47   0064
        MOVR    R2,     R6                      ; FF48   0096
        ADDR    R1,     R0                      ; FF49   00C8
        ADDR    R7,     R2                      ; FF4A   00FA
        SUBR    R5,     R4                      ; FF4B   012C
        ANDR    R2,     R0                      ; FF4C   0190
        XORR    R6,     R4                      ; FF4D   01F4
        ADD@    R5,     R6                      ; FF4E   02EE
        XOR@    R5,     R0                      ; FF4F   03E8
        PSHR    R5                              ; FF50   0275

        JSR     R5,     X_PLAY_SFX2             ; FF51   0004 0118 03BE
        DECLE   $0014                           ; FF54  SFX prio
        DECLE   $0379                           ; FF55  SFX data
        DECLE   $00B7                           ; FF56  SFX data
        DECLE   $002D                           ; FF57  SFX data
        DECLE   $000C,  $000A                   ; FF58  SFX data
        DECLE   $028B                           ; FF5A  SFX data
        DECLE   $002B                           ; FF5B  SFX data
        DECLE   $0077,  $0061,  $009F           ; FF5C  SFX data
        DECLE   $02CF                           ; FF5F  SFX end


        PULR    R7                              ; FF60   02B7

        ADDI    #$0007, R3                      ; FF61   02FB 0007
        MVI@    R3,     R0                      ; FF63   0298
        SWAP    R0,     1                       ; FF64   0040
        SUBI    #$0004, R3                      ; FF65   033B 0004
        ADD@    R3,     R0                      ; FF67   02D8
        INCR    R0                              ; FF68   0008
        MVO@    R0,     R3                      ; FF69   0258
        SWAP    R0,     1                       ; FF6A   0040
        ADDI    #$0004, R3                      ; FF6B   02FB 0004
        MVO@    R0,     R3                      ; FF6D   0258
        SUBI    #$0007, R3                      ; FF6E   033B 0007
        SWAP    R0,     1                       ; FF70   0040
        CMPI    #$0028, R0                      ; FF71   0378 0028
        BGE     L_FF79                          ; FF73   020D 0004

        SDBD                                    ; FF75   0001
        MVII    #$9F5B, R4                      ; FF76   02BC 005B 009F
L_FF79:
        PULR    R7                              ; FF79   02B7

        PSHR    R5                              ; FF7A   0275

        JSR     R5,     X_PLAY_SFX1             ; FF7B   0004 0118 03BB
        DECLE   $0269                           ; FF7E  SFX data
        DECLE   $0040,  $02EE                   ; FF7F  SFX data
        DECLE   $01B7                           ; FF81  SFX data
        DECLE   $002D                           ; FF82  SFX data
        DECLE   $001C,  $03D0                   ; FF83  SFX data
        DECLE   $010B                           ; FF85  SFX data
        DECLE   $03CF                           ; FF86  SFX end


        PULR    R7                              ; FF87   02B7

        PSHR    R5                              ; FF88   0275

        JSR     R5,     X_PLAY_SFX1             ; FF89   0004 0118 03BB
        DECLE   $0349                           ; FF8C  SFX data
        DECLE   $0040,  $0064                   ; FF8D  SFX data
        DECLE   $0048,  $004B                   ; FF8F  SFX data
        DECLE   $014D                           ; FF91  SFX data
        DECLE   $002C,  $03B8                   ; FF92  SFX data
        DECLE   $000B                           ; FF94  SFX data
        DECLE   $006B                           ; FF95  SFX data
        DECLE   $0049                           ; FF96  SFX data
        DECLE   $03B7                           ; FF97  SFX data
        DECLE   $0040,  $0032                   ; FF98  SFX data
        DECLE   $0048,  $004B                   ; FF9A  SFX data
        DECLE   $03CF                           ; FF9C  SFX end


        PULR    R7                              ; FF9D   02B7

        PSHR    R5                              ; FF9E   0275

        JSR     R5,     X_PLAY_SFX2             ; FF9F   0004 0118 03BE
        DECLE   $0014                           ; FFA2  SFX prio
        DECLE   $03E9                           ; FFA3  SFX data
        DECLE   $0040,  $01F4                   ; FFA4  SFX data
        DECLE   $001C,  $03D0                   ; FFA6  SFX data
        DECLE   $000B                           ; FFA8  SFX data
        DECLE   $03CF                           ; FFA9  SFX end


        PULR    R7                              ; FFAA   02B7

        PSHR    R5                              ; FFAB   0275

        JSR     R5,     X_PLAY_SFX2             ; FFAC   0004 0118 03BE
        DECLE   $0005                           ; FFAF  SFX prio
        DECLE   $0359                           ; FFB0  SFX data
        DECLE   $0358,  $0114                   ; FFB1  SFX data
        DECLE   $00B7                           ; FFB3  SFX data
        DECLE   $028D                           ; FFB4  SFX data
        DECLE   $000C,  $0028                   ; FFB5  SFX data
        DECLE   $028B                           ; FFB7  SFX data
        DECLE   $03CF                           ; FFB8  SFX end


        PULR    R7                              ; FFB9   02B7

        PSHR    R5                              ; FFBA   0275

        JSR     R5,     X_PLAY_SFX2             ; FFBB   0004 0118 03BE
        DECLE   $0005                           ; FFBE  SFX prio
        DECLE   $0379                           ; FFBF  SFX data
        DECLE   $00B7                           ; FFC0  SFX data
        DECLE   $002D                           ; FFC1  SFX data
        DECLE   $000C,  $001E                   ; FFC2  SFX data
        DECLE   $028B                           ; FFC4  SFX data
        DECLE   $0107                           ; FFC5  SFX data
        DECLE   $0057,  $000C                   ; FFC6  SFX data
        DECLE   $000B                           ; FFC8  SFX data
        DECLE   $0057,  $000C                   ; FFC9  SFX data
        DECLE   $017D                           ; FFCB  SFX data
        DECLE   $0023,  $03DB                   ; FFCC  SFX data
        DECLE   $02CF                           ; FFCE  SFX end


        PULR    R7                              ; FFCF   02B7

        PSHR    R5                              ; FFD0   0275

        JSR     R5,     X_PLAY_SFX1             ; FFD1   0004 0118 03BB
        DECLE   $0379                           ; FFD4  SFX data
        DECLE   $00B7                           ; FFD5  SFX data
        DECLE   $028D                           ; FFD6  SFX data
        DECLE   $007C,  $014C                   ; FFD7  SFX data
        DECLE   $000B                           ; FFD9  SFX data
        DECLE   $00AB                           ; FFDA  SFX data
        DECLE   $00ED                           ; FFDB  SFX data
        DECLE   $000B                           ; FFDC  SFX data
        DECLE   $03CF                           ; FFDD  SFX end


        PULR    R7                              ; FFDE   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; FFDF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFEB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFEF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFFB   0000 0000 0000 0000
        DECLE   $0000                           ; FFFF   0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5030       $5015  
;;  $5034       $501D  
;;  $5045       $5041   $524B  
;;  $505E       $504A  
;;  $5062       $5055   $505C  
;;  $5082       $506A  
;;  $5084       $5032   $5036   $5079   $5080   $5115  
;;  $509F       $5098  
;;  $50B5       $50A8   $50AD   $50B2  
;;  $50DC       $502E   $50C7   $50D2   $50D9  
;;  $5107       $5060  
;;  $5117       $5111  
;;  $515A       $512A   $512E   $5136  
;;  $515B       $5067   $507D   $5095   $510E   $519D   $51C5  
;;  $5168       $515F   $5164  
;;  $516A       $509A  
;;  $517A       $5178  
;;  $5186       $517C   $517F   $5183  
;;  $51A7       $51A0  
;;  $51B8       $51A5   $51AF  
;;  $51C3       $518B  
;;  $51F0       $51C8   $51D4   $51E5  
;;  $51F2       $5189  
;;  $51F4       $5186   $51D1   $55E9   $5831   $5873  
;;  $5210       $5207   $520C  
;;  $5219       $5215  
;;  $521D       $508E  
;;  $5241       $522B   $5231   $5237   $523D  
;;  $5243       $503B   $505A   $510A  
;;  $5250       $5246  
;;  $5261       $5385   $538E   $53AC  
;;  $52C3       $52A6  
;;  $5305       $52E5  
;;  $530F       $52C9  
;;  $533C       $525F  
;;  $5373       $5350   $535C   $5368  
;;  $539F       $539C  
;;  $53A7       $53A3  
;;  $53AE       $5091   $509D   $5105   $511B   $5259   $532E   $538C   $5445  
;;  $53D1       $53CA  
;;  $53D6       $5321   $5329   $533A   $53E2   $53F4   $53FC   $5442  
;;  $53DF       $5253  
;;  $53F6       $53EF  
;;  $53FE       $53F8  
;;  $540C       $5402  
;;  $5412       $540A  
;;  $5426       $541B   $5420  
;;  $5447       $53C2   $53D6  
;;  $5456       $5451  
;;  $5459       $545F   $546A   $547A  
;;  $5463       $545A  
;;  $5478       $546E  
;;  $5481       $547E  
;;  $5490       $5488  
;;  $5494       $548E  
;;  $54CC       $544B   $5454   $5461  
;;  $54DD       $D14D   $D164  
;;  $5511       $5521  
;;  $5512       $54E6  
;;  $551F       $54EA  
;;  $5523       $54E1  
;;  $55D8       $51CA   $5B9D  
;;  $55F5       $55F1  
;;  $5603       $55FE  
;;  $5618       $560A  
;;  $563B       $55DE   $55E7   $55EC  
;;  $563C       $5638  
;;  $564D       $5676  
;;  $565A       $5657  
;;  $5671       $5651   $565C   $5660  
;;  $568C       $5685  
;;  $569B       $5693  
;;  $56A1       $569F  
;;  $56B6       $56AF  
;;  $56BF       $56BB  
;;  $56D0       $5765  
;;  $56E0       $56D2  
;;  $571B       $56FB   $5703  
;;  $5732       $5719   $571D   $5722  
;;  $5760       $56D8   $56DE   $56E5   $56E9   $56F1   $56F7   $56FF  
;;  $5771       $576A  
;;  $5772       $56A4  
;;  $5778       $5776  
;;  $578A       $5780  
;;  $57A5       $5792  
;;  $57AA       $57B6  
;;  $57B2       $57AC  
;;  $57D5       $57D1  
;;  $5802       $57BD  
;;  $5814       $5809  
;;  $581D       $5818  
;;  $5822       $56A1  
;;  $584A       $5847  
;;  $585D       $5858  
;;  $585F       $FD61  
;;  $588F       $5828   $5869   $5878   $5884  
;;  $5891       $5836   $584B  
;;  $5893       $D161  
;;  $58B6       $5898  
;;  $58B7       $55EE   $57C0   $D45D  
;;  $58BC       $58C2  
;;  $58C4       $58BE  
;;  $5906       $D16A  
;;  $5919       $593B  
;;  $592E       $5935  
;;  $593D       $590A  
;;  $593E       $51B2  
;;  $5940       $5153   $57FF   $D317  
;;  $5951       $5969  
;;  $5959       $5954  
;;  $595A       $595F  
;;  $5961       $595C  
;;  $596B       $5957  
;;  $597C       $5978  
;;  $5989       $5985  
;;  $5997       $5947   $596E   $5972  
;;  $599B       $D053  
;;  $59A5       $59AA  
;;  $59B0       $59B5  
;;  $5A01       $D068  
;;  $5A0B       $5A05  
;;  $5A14       $5A0F  
;;  $5A17       $5A09  
;;  $5A18       $5A16  
;;  $5A1B       $D32C   $D782  
;;  $5A62       $5A58   $5BA6   $6F26  
;;  $5A73       $5A70  
;;  $5A80       $D065  
;;  $5A85       $5A91   $5A99  
;;  $5A97       $5A86  
;;  $5A9C       $5A95  
;;  $5AA3       $581A   $5A8B  
;;  $5AA4       $5A1F  
;;  $5AA8       $5AA1  
;;  $5AE7       $5AE3  
;;  $5B10       $5B1F  
;;  $5B53       $5B49  
;;  $5B59       $5B51  
;;  $5B66       $5B28   $5B2C   $5B30  
;;  $5B68       $5B35  
;;  $5B69       $5B64  
;;  $5BA6       $5AAB  
;;  $5BAA       $5ACE  
;;  $5BAB       $5BBF  
;;  $5BB6       $5BBA  
;;  $5BC2       $D127  
;;  $5BEE       $5BC7  
;;  $5BF1       $5BF6  
;;  $5BF8       $5BF3  
;;  $5C0E       $5C15  
;;  $5C23       $5C21  
;;  $5C3B       $5C39  
;;  $5C41       $5C3F  
;;  $5C5F       $5C5D  
;;  $5C65       $5C63  
;;  $5C77       $5C75  
;;  $5C79       $5C79  
;;  $5C7D       $5C7B  
;;  $5C7F       $5C7F  
;;  $5CC6       $5CC4  
;;  $5CD6       $5CD4  
;;  $5CE6       $5CE4  
;;  $5CF6       $5CF4  
;;  $5D06       $5D04  
;;  $5D16       $5D14  
;;  $5D26       $5D24  
;;  $5D36       $5D34  
;;  $5D37       $D0C0  
;;  $5D4D       $5D82  
;;  $5D5E       $5D54  
;;  $5D64       $5D5C  
;;  $5D6E       $5D77  
;;  $5D84       $5D50  
;;  $5D89       $5D95  
;;  $5D97       $5D8B  
;;  $5D99       $5FFB  
;;  $5DAE       $5D9A  
;;  $5DB2       $5DAC  
;;  $5DBF       $5DCF  
;;  $5DC2       $5DCB  
;;  $5DD2       $5990   $5B9A  
;;  $5DDA       $5DE6  
;;  $5DF5       $5DF1  
;;  $5DFB       $5DFF  
;;  $5E01       $5DEB   $5DED  
;;  $5E02       $5023   $D0F3  
;;  $5E22       $5E14   $5E47  
;;  $5E49       $5E28  
;;  $60A5       $60A3  
;;  $6117       $6115  
;;  $616D       $5117  
;;  $617A       $6174  
;;  $61A1       $5085   $5156   $5279   $5406   $540E   $548A   $5490   $569B  
;;  $61A1       $5759   $5772   $5993   $5A24   $5A7B   $5A9D   $5AA4   $D042  
;;  $61A1       $D046   $D3EC   $D653   $D76E   $DA63  
;;  $61BA       $61B7  
;;  $624F       $5FED  
;;  $63DF       $63DF  
;;  $644F       $644F  
;;  $694A       $61B0  
;;  $6957       $6966  
;;  $6964       $695C   $6960  
;;  $6971       $696C  
;;  $6974       $697F  
;;  $697C       $6977  
;;  $698F       $696A   $696F  
;;  $6993       $6985   $6989   $698D  
;;  $69A7       $6177   $6979   $6AAA  
;;  $69C2       $69BF  
;;  $69C7       $69C4  
;;  $69CC       $69C9  
;;  $69D8       $D122  
;;  $69DF       $69F1   $69F6   $6A5B   $6AAD  
;;  $69E4       $69E1  
;;  $69F3       $69EB  
;;  $69F8       $6A41   $6A47   $6A73   $6A8D   $6A99   $6AA6   $6ACD  
;;  $6A34       $6A38  
;;  $6A3A       $6A35  
;;  $6A54       $6A4C   $6A51  
;;  $6A6F       $6A6A  
;;  $6A72       $6A65   $6A6D  
;;  $6A89       $6A84  
;;  $6A8C       $6A80   $6A87  
;;  $6A9B       $6A96  
;;  $6AA5       $6A9F  
;;  $6ABA       $6AB3   $6ADD  
;;  $6AC8       $6AB8  
;;  $6AF7       $D15E  
;;  $6AFB       $6F47  
;;  $6AFF       $6B0A  
;;  $6B11       $D11F  
;;  $6B16       $6BA5  
;;  $6B1E       $6C1B  
;;  $6B24       $6B20  
;;  $6B3C       $6B3C  
;;  $6B42       $6B40  
;;  $6B55       $6B45   $6B49   $6B4D   $6B51  
;;  $6B63       $6B5B  
;;  $6B73       $6B87  
;;  $6B80       $6B7A  
;;  $6B86       $6B82  
;;  $6B8B       $6B74  
;;  $6B8F       $6B31   $6B61   $6B8D   $6BB0  
;;  $6B97       $6B93  
;;  $6BA7       $6B25   $6B89  
;;  $6BB2       $6BA0  
;;  $6BB3       $6B2D  
;;  $6BBE       $6B29  
;;  $6BC4       $6BBC  
;;  $6BC9       $6BCF  
;;  $6BE2       $6BE5   $6C09  
;;  $6BE7       $6BEA  
;;  $6BF0       $6BF3   $6BF7  
;;  $6C0B       $6BFC   $6BFF  
;;  $6C13       $6C18  
;;  $6C36       $6C2A   $6C3F   $6C43  
;;  $6C38       $6C26  
;;  $6C39       $6C21  
;;  $6C49       $6C49  
;;  $6C55       $5BB3   $D062  
;;  $6C63       $6C71  
;;  $6C6F       $6C66   $6C92  
;;  $6C76       $6C80  
;;  $6C82       $6C79  
;;  $6C83       $6C6C  
;;  $6C94       $5146   $53D9   $543A   $54C3   $5633   $5695   $56B6   $5784  
;;  $6C94       $580F   $D0B6   $D0BB   $D373  
;;  $6C95       $53D1  
;;  $6C96       $6C7C  
;;  $6CA4       $6C9E  
;;  $6CA7       $6CAD  
;;  $6CB0       $6CB0  
;;  $6CB2       $6CA9  
;;  $6CB6       $5142   $53BE   $5436   $54BF   $5AC6   $5ACA  
;;  $6CBA       $6CC4  
;;  $6CC2       $6CBC  
;;  $6CC7       $5A21   $5B0B  
;;  $6CCE       $5D40  
;;  $6CD1       $6CDF  
;;  $6CD6       $6CD3  
;;  $6CDE       $6CD9  
;;  $6CE2       $6CF9   $6E58   $6E63   $6E6E   $D021   $D074   $D9A8   $D9CA  
;;  $6CF1       $D611  
;;  $6CF4       $6CF7  
;;  $6CFF       $5518   $59BC   $5A2C   $5A33   $5AC3   $5B00   $5E4D   $6C5A  
;;  $6CFF       $6CCB   $D007   $D0A2   $D133   $D1F9   $D202  
;;  $6D00       $6D04   $D050   $D08F   $DAD3  
;;  $6D06       $6D01  
;;  $6D07       $D06E  
;;  $6D13       $6D0B   $6D0F  
;;  $6D14       $5A54  
;;  $6D15       $5A74  
;;  $6D1A       $6D1E   $D0AF  
;;  $6D21       $6D24   $DAD8  
;;  $6D27       $58B3   $5BE2   $5BEB   $DAFF  
;;  $6D29       $6D2C  
;;  $6D2F       $D00A  
;;  $6DA6       $6D32  
;;  $6DB4       $6DAC  
;;  $6DE7       $6DB7  
;;  $6E40       $6DE5  
;;  $6E58       $6E61  
;;  $6E63       $6E6C  
;;  $6E6E       $6E77  
;;  $6E7E       $6E80  
;;  $6EB3       $6EAD  
;;  $6EBA       $6EB7  
;;  $6EBC       $6E8D   $6E9D  
;;  $6EC6       $6EE2  
;;  $6EE8       $6EF1  
;;  $6EF4       $6DB2  
;;  $6F21       $D0F6  
;;  $6F2A       $6AF8  
;;  $D021       $D028  
;;  $D033       $D036  
;;  $D062       $D080  
;;  $D074       $D07B  
;;  $D0F6       $D0DC  
;;  $D11D       $D117   $D12A   $D15C   $D171  
;;  $D127       $D11B  
;;  $D12C       $D119  
;;  $D14D       $D113  
;;  $D15E       $D115  
;;  $D17C       $D1A2  
;;  $D1A4       $D17D  
;;  $D1EC       $D1E6  
;;  $D1EE       $D1EA  
;;  $D213       $D218  
;;  $D21A       $D214  
;;  $D224       $D236  
;;  $D231       $D26D  
;;  $D238       $D233  
;;  $D23C       $D228   $D22A  
;;  $D258       $D251   $D255  
;;  $D271       $D2CC  
;;  $D2C9       $D276   $D279   $D2B0   $D31B   $D32A  
;;  $D2EE       $D2E6   $D2EB  
;;  $D2FF       $D2F5   $D2FB  
;;  $D308       $D146  
;;  $D335       $D345  
;;  $D342       $D338   $D33C   $D33F  
;;  $D34B       $D371  
;;  $D36E       $D3A6   $D3B1   $D3B8   $D3CB   $D3D2   $D3E9   $D400   $D72C  
;;  $D37B       $D39B  
;;  $D402       $D3FC  
;;  $D41E       $D419  
;;  $D426       $D415   $D41C  
;;  $D5F8       $D45B  
;;  $D605       $D602  
;;  $D60A       $D607  
;;  $D611       $D60E  
;;  $D618       $D614  
;;  $D630       $D64B  
;;  $D64D       $D637   $D63D   $D646  
;;  $D65A       $D64E  
;;  $D672       $D661  
;;  $D68B       $D681  
;;  $D695       $D689   $D68D   $D6D1   $D6FC   $D707   $D712  
;;  $D698       $D687  
;;  $D6A4       $D693  
;;  $D6AE       $D6A2  
;;  $D6CB       $D6C2  
;;  $D6DE       $D6DB  
;;  $D6E1       $D6E8  
;;  $D6E6       $D6E3  
;;  $D6F9       $D6F6  
;;  $D6FE       $D6C9   $D6CF   $D6F0  
;;  $D709       $D702  
;;  $D714       $D70D  
;;  $D71A       $D67B  
;;  $D777       $D76B  
;;  $D786       $D77B   $D780  
;;  $D787       $D765  
;;  $D7AD       $D7A0   $D7A7  
;;  $D7B9       $D7B5  
;;  $D7C3       $D7BD  
;;  $D7C6       $D7BB  
;;  $D7C7       $D7C1   $D7C5  
;;  $D7D0       $D7CC  
;;  $D7DA       $D7D4  
;;  $D7DD       $D7D2  
;;  $D7DE       $D7D8   $D7DC  
;;  $D7F2       $D7EA  
;;  $D808       $D812  
;;  $D81C       $D827  
;;  $D81F       $D7F0  
;;  $D849       $D843  
;;  $D84C       $DAE1  
;;  $D853       $D847   $D84F  
;;  $D85F       $D85C  
;;  $D866       $D863  
;;  $D86B       $D867  
;;  $D87B       $D86D  
;;  $D881       $D869  
;;  $D890       $D883  
;;  $D8AC       $D8A1   $D8A6  
;;  $D8B6       $D8B0  
;;  $D8B9       $D8BD  
;;  $D8C5       $D871   $D875   $D879   $D887   $D88B   $D88E   $D897   $D8AA  
;;  $D8C5       $D8B4   $D8BA  
;;  $D8CE       $D8CA  
;;  $D92F       $D928  
;;  $D946       $D936   $D93C  
;;  $D956       $D952  
;;  $D95C       $D958  
;;  $D964       $D960  
;;  $D96C       $D94C   $D968  
;;  $D979       $D972  
;;  $D9A4       $D99E  
;;  $D9A6       $D9A2  
;;  $D9A8       $D9C2  
;;  $D9BA       $D9B2   $D9B7  
;;  $D9C0       $D9BD  
;;  $D9CA       $D9E2  
;;  $D9DB       $D9D3   $D9D8  
;;  $D9E1       $D9DE  
;;  $D9E7       $D9EF  
;;  $DA6F       $DA81  
;;  $DA72       $DA7B  
;;  $DA7D       $DA75  
;;  $DA83       $DA7E  
;;  $DABD       $DAC1  
;;  $DAC9       $DACD  
;;  $DAE4       $DAEF  
;;  $DAF1       $DAE9  
;;  $DB1D       $DB1B  
;;  $DB1F       $DB1D  
;;  $DB9F       $DB9D  
;;  $DF1D       $DF1B  
;;  $DF23       $DF23  
;;  $F065       $F095  
;;  $F06D       $F09A  
;;  $F099       $F099  
;;  $F0C1       $F0C6  
;;  $F0C4       $F0B3   $F0BE  
;;  $F0DE       $F0DC  
;;  $F0DF       $F0DD  
;;  $F115       $F113  
;;  $F117       $F115  
;;  $F34E       $F339  
;;  $F3A5       $F390  
;;  $F3AB       $F395  
;;  $F3B2       $F3A3  
;;  $F3CE       $F3CC  
;;  $F3ED       $F3E9  
;;  $F3EE       $F3D7  
;;  $F3EF       $F3CA  
;;  $F3FF       $F3F5   $F3FB  
;;  $F41A       $F37E   $F418   $F43B  
;;  $F443       $F441  
;;  $F454       $F450  
;;  $F455       $F453  
;;  $F462       $F43F  
;;  $F4A3       $F496   $F49F  
;;  $F51C       $F510  
;;  $F524       $F50E   $F514   $F518  
;;  $F528       $F508  
;;  $F530       $F52A  
;;  $F538       $F52E  
;;  $F53B       $F532   $F536  
;;  $F53C       $F53A  
;;  $F548       $F5AE  
;;  $F55D       $F589  
;;  $F55E       $F505  
;;  $F56B       $F51A   $F51E   $F522  
;;  $F56C       $F56A  
;;  $F57C       $F577  
;;  $F5BE       $F5BB  
;;  $F5E1       $F5DE  
;;  $F5E7       $F5E4  
;;  $F5ED       $F5EA  
;;  $F61C       $F617  
;;  $F623       $F620  
;;  $F633       $F5D8   $F678  
;;  $F634       $F5FB  
;;  $F636       $F67B  
;;  $F641       $F63B  
;;  $F647       $F63F  
;;  $F6A9       $F68B   $F69A   $F6E3   $F6EE  
;;  $F6AB       $F69F   $F6A4   $F6A7  
;;  $F6AD       $F692  
;;  $F6EE       $F6B0   $F6EA  
;;  $F704       $F758  
;;  $F739       $F734  
;;  $F73E       $F6F4   $F6FC  
;;  $F747       $F744  
;;  $F750       $F74B  
;;  $F762       $F75F  
;;  $F7CF       $F7C9  
;;  $F7EA       $F7C5   $F7D2   $F7E4  
;;  $F7EF       $F7ED  
;;  $F810       $F808  
;;  $F818       $F816  
;;  $F84C       $F830   $F835  
;;  $F853       $F83D  
;;  $F879       $F876  
;;  $F883       $F891  
;;  $F890       $F888   $F89B   $F8A1  
;;  $F894       $F886  
;;  $F8AD       $F8A9   $F8C4  
;;  $F8B7       $F8B0  
;;  $F8BD       $F8B3   $F8B5  
;;  $F8DB       $F8E7  
;;  $F8EA       $F8DC  
;;  $F8EB       $F8E1  
;;  $F8F3       $F8EE  
;;  $F8F8       $F915  
;;  $F8FF       $F911  
;;  $F903       $F8FD  
;;  $F90A       $F8FB  
;;  $F917       $F90C  
;;  $F92B       $F946  
;;  $F937       $F931  
;;  $F93D       $F901  
;;  $F944       $F929  
;;  $F945       $F925  
;;  $F964       $F97A  
;;  $F975       $F96B  
;;  $F98F       $FA34  
;;  $F9B8       $F9C1  
;;  $F9C5       $F9B9  
;;  $F9DD       $F9C3  
;;  $F9EC       $FA0B  
;;  $F9ED       $F9EA   $FA0D  
;;  $F9F0       $F9E8  
;;  $FA04       $F9F6  
;;  $FA0F       $F9E6  
;;  $FA15       $F9B3  
;;  $FA1B       $FA13  
;;  $FA1F       $FA19  
;;  $FA23       $F9EE  
;;  $FA28       $FA02  
;;  $FA3C       $F9D0  
;;  $FA57       $FA5F  
;;  $FA61       $FA6F  
;;  $FA7E       $F989  
;;  $FA8E       $FA95  
;;  $FA97       $FA8F  
;;  $FAAA       $FAB2  
;;  $FAC6       $FAAD  
;;  $FAE1       $FAA3  
;;  $FB18       $FAD6  
;;  $FB2B       $FB38  
;;  $FB31       $FB33  
;;  $FB41       $FB52  
;;  $FB43       $FB4D  
;;  $FB5A       $FB61  
;;  $FB6A       $FB75  
;;  $FB80       $FAC4  
;;  $FBC1       $FCDE  
;;  $FBD3       $F91C  
;;  $FBF8       $FC10  
;;  $FC06       $FC08  
;;  $FC0A       $FC04  
;;  $FC27       $FC1B   $FC23  
;;  $FC37       $FC2E  
;;  $FC70       $FC4D  
;;  $FC85       $FC72  
;;  $FC8F       $FC6E  
;;  $FCBA       $FCAA   $FCB2  
;;  $FCD1       $FBB8  
;;  $FCEE       $FCFD  
;;  $FDB0       $FDAE  
;;  $FDD0       $FDF8  
;;  $FDE7       $FDE0  
;;  $FDEE       $FDDC  
;;  $FDF3       $FDEC  
;;  $FDF4       $FE00  
;;  $FDFB       $FDE5  
;;  $FE14       $FE2E  
;;  $FE3F       $FE38  
;;  $FE48       $FE36  
;;  $FE4B       $FE86  
;;  $FE5B       $FE55  
;;  $FE66       $FE6D  
;;  $FE6F       $FE67  
;;  $FE7E       $FE59   $FE94   $FEAB   $FEB2   $FEB9   $FEC1   $FED5  
;;  $FE89       $FE79  
;;  $FE96       $FE92   $FEB4  
;;  $FEA6       $FEA2  
;;  $FEAD       $FE7C  
;;  $FEE4       $FEE2  
;;  $FEF7       $FEE0  
;;  $FF00       $FF3D  
;;  $FF0C       $FF40  
;;  $FF1C       $FF0E  
;;  $FF33       $FF2A  
;;  $FF38       $FF04  
;;  $FF3F       $FF11   $FF1A  
;;  $FF79       $FF73  
;; ======================================================================== ;;
