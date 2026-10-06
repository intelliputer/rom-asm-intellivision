
        ORG     $5000
.HEADER:
        BIDECLE $5E6D           ; 5000  Ptr: MOB graphic images
        BIDECLE $5026           ; 5002  Ptr: EXEC timer table
        BIDECLE $5075           ; 5004  Ptr: Start of game
        BIDECLE $5DC0           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5E54           ; 5008  Ptr: GRAM init sequence
        BIDECLE $501C           ; 500A  Ptr: Date/Title
        DECLE   $0000           ; 500C  Key-click / flags
        DECLE   $0001           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0001,  $0004   ; 500F  Color Stack init (0, 1)
        DECLE   $0001,  $0001   ; 5011  Color Stack init (2, 3)
        DECLE   $0001           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TITLE:
        DECLE   $004E                           ; 501C  Cartridge year
        STRING  "FOOTBALL"                      ; 501D  Title string
        DECLE   $0000                           ; 5025  

.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 5026  Timer dispatch/interval
        DECLE   $00EF,  $0056,  $000F,  $0000; 502A  Timer dispatch/interval
        DECLE   $0034,  $0050,  $0001,  $0000; 502E  Timer dispatch/interval
        BIDECLE $0000           ; 5032  End of timer table

L_5034:
        PSHR    R5                              ; 5034   0275

        JSR     R5,     L_537F                  ; 5035   0004 0150 037F
        JSR     R5,     L_5902                  ; 5038   0004 0158 0102
        JSR     R5,     L_55F7                  ; 503B   0004 0154 01F7
        JSR     R5,     L_5646                  ; 503E   0004 0154 0246
        JSR     R5,     L_5722                  ; 5041   0004 0154 0322
        JSR     R5,     L_5687                  ; 5044   0004 0154 0287
        JSR     R5,     L_54E8                  ; 5047   0004 0154 00E8

        PULR    R7                              ; 504A   02B7

L_504B:
        PSHR    R5                              ; 504B   0275
        CLRR    R2                              ; 504C   01D2
        MVII    #$031D, R5                      ; 504D   02BD 031D
        MVII    #$0007, R0                      ; 504F   02B8 0007

        JSR     R4,     L_505C                  ; 5051   0004 0050 005C
        DECLE   $0040                           ; 5054   0040

        RLC     R1,     1                       ; 5055   0051
        RLC     R1,     1                       ; 5056   0051
        RLC     R1,     1                       ; 5057   0051
        SWAP    R2,     1                       ; 5058   0042
        RLC     R2,     1                       ; 5059   0052
        RLC     R2,     1                       ; 505A   0052
        RLC     R2,     1                       ; 505B   0052
L_505C:
        MVII    #$0018, R1                      ; 505C   02B9 0018
        SWAP    R1,     1                       ; 505E   0041
        XOR@    R4,     R1                      ; 505F   03E1
        MVO@    R1,     R5                      ; 5060   0269
        MVO@    R2,     R5                      ; 5061   026A
        MVO@    R2,     R5                      ; 5062   026A
        MVII    #$000A, R1                      ; 5063   02B9 000A
        CMPI    #$0003, R0                      ; 5065   0378 0003
        BGT     L_506B                          ; 5067   020E 0002

        MVII    #$005A, R1                      ; 5069   02B9 005A
L_506B:
        SWAP    R1,     1                       ; 506B   0041
        MVO@    R1,     R5                      ; 506C   0269
        INCR    R5                              ; 506D   000D
        MVO@    R0,     R5                      ; 506E   0268
        MVO@    R2,     R5                      ; 506F   026A
        INCR    R5                              ; 5070   000D
        DECR    R0                              ; 5071   0010
        BPL     L_505C                          ; 5072   0223 0017
        PULR    R7                              ; 5074   02B7

.START:
        PSHR    R5                              ; 5075   0275
        CLRR    R0                              ; 5076   01C0
        MVO     R0,     G_0117                  ; 5077   0240 0117
        MVII    #$00B4, R0                      ; 5079   02B8 00B4
        MVO     R0,     G_0116                  ; 507B   0240 0116
        MVII    #$0050, R0                      ; 507D   02B8 0050
        MVO     R0,     G_0184                  ; 507F   0240 0184
        INCR    R7                              ; 5081   000F

        PSHR    R5                              ; 5082   0275
L_5083:
        MVI     G_017E, R0                      ; 5083   0280 017E
        CMPI    #$0004, R0                      ; 5085   0378 0004
        BGE     L_5125                          ; 5087   020D 009C

        MVII    #$016A, R4                      ; 5089   02BC 016A
        MVII    #$0007, R0                      ; 508B   02B8 0007

        JSR     R5,     X_FILL_ZERO             ; 508D   0004 0114 0338
        JSR     R5,     L_559A                  ; 5090   0004 0154 019A
        JSR     R5,     L_504B                  ; 5093   0004 0150 004B

        MVI     G_017E, R0                      ; 5096   0280 017E
        SARC    R0,     2                       ; 5098   007C
        MVII    #$0050, R0                      ; 5099   02B8 0050
        BNOV    L_50A2                          ; 509B   020A 0005

        JSR     R5,     L_55B7                  ; 509D   0004 0154 01B7

        MVII    #$0014, R0                      ; 50A0   02B8 0014
L_50A2:
        MVO     R0,     G_017F                  ; 50A2   0240 017F

        JSR     R5,     L_5FCE                  ; 50A4   0004 015C 03CE

        INCR    R7                              ; 50A7   000F

        PSHR    R5                              ; 50A8   0275
L_50A9:
        MVII    #$000F, R0                      ; 50A9   02B8 000F
        MVO     R0,     G_0170                  ; 50AB   0240 0170
        CLRR    R0                              ; 50AD   01C0
        MVO     R0,     G_016F                  ; 50AE   0240 016F
        INCR    R0                              ; 50B0   0008
        MVO     R0,     G_0181                  ; 50B1   0240 0181

        JSR     R5,     L_593C                  ; 50B3   0004 0158 013C

        PULR    R7                              ; 50B6   02B7

        PSHR    R5                              ; 50B7   0275

        JSR     R5,     L_5597                  ; 50B8   0004 0154 0197
        DECLE   $0001                           ; 50BB   0001

        JSR     R5,     L_5132                  ; 50BC   0004 0150 0132
        JSR     R5,     L_5C85                  ; 50BF   0004 015C 0085

        MVII    #$0060, R4                      ; 50C2   02BC 0060
        MVII    #$0068, R3                      ; 50C4   02BB 0068

        JSR     R5,     L_5C8E                  ; 50C6   0004 015C 008E
        BIDECLE $5733                           ; 50C9   0033 0057

        PULR    R7                              ; 50CB   02B7

L_50CC:
        PSHR    R5                              ; 50CC   0275

        JSR     R5,     L_55F0                  ; 50CD   0004 0154 01F0
        JSR     R5,     L_59FF                  ; 50D0   0004 0158 01FF
        JSR     R5,     L_5132                  ; 50D3   0004 0150 0132
        JSR     R5,     .EXEC.A61               ; 50D6   0004 0118 0261

        INCR    R2                              ; 50D9   000A
        MVII    #$0005, R0                      ; 50DA   02B8 0005

        JSR     R5,     X_PLAY_CHEER1           ; 50DC   0004 011C 02D5

        MVI     G_017E, R0                      ; 50DF   0280 017E
        INCR    R0                              ; 50E1   0008
        MVO     R0,     G_017E                  ; 50E2   0240 017E
        SARC    R0,     1                       ; 50E4   0078
        BC      L_5100                          ; 50E5   0201 0019

        CLRR    R4                              ; 50E7   01E4
        MVII    #$00AA, R0                      ; 50E8   02B8 00AA

        JSR     R5,     L_56B6                  ; 50EA   0004 0154 02B6

        MVI     G_016B, R0                      ; 50ED   0280 016B
        SLL     R0,     1                       ; 50EF   0048
        MVO     R0,     G_0191                  ; 50F0   0240 0191
        MVII    #$0070, R4                      ; 50F2   02BC 0070
        MVII    #$0078, R3                      ; 50F4   02BB 0078

        JSR     R5,     L_5C8E                  ; 50F6   0004 015C 008E
        BIDECLE $5082                           ; 50F9   0082 0050

        JSR     R5,     L_5597                  ; 50FB   0004 0154 0197
        DECLE   $0000                           ; 50FE   0000

        PULR    R7                              ; 50FF   02B7

L_5100:
        JSR     R5,     L_510E                  ; 5100   0004 0150 010E
        DECLE   $017F                           ; 5103   017F

        JSR     R5,     L_510E                  ; 5104   0004 0150 010E
        DECLE   $0185                           ; 5107   0185

        JSR     R5,     L_521C                  ; 5108   0004 0150 021C
        BIDECLE $50A8                           ; 510B   00A8 0050

        PULR    R7                              ; 510D   02B7

L_510E:
        MVI@    R5,     R3                      ; 510E   02AB
        MVI@    R3,     R0                      ; 510F   0298
        NEGR    R0                              ; 5110   0020
        ADDI    #$0064, R0                      ; 5111   02F8 0064
        MVO@    R0,     R3                      ; 5113   0258
        MOVR    R5,     R7                      ; 5114   00AF

L_5115:
        PSHR    R5                              ; 5115   0275

        JSR     R5,     L_511B                  ; 5116   0004 0150 011B

        PULR    R5                              ; 5119   02B5
        ADD@    R5,     R0                      ; 511A   02E8
L_511B:
        PSHR    R5                              ; 511B   0275

        JSR     R5,     L_55AF                  ; 511C   0004 0154 01AF

        BC      L_5124                          ; 511F   0201 0003

        NEGR    R0                              ; 5121   0020
        ADDI    #$0064, R0                      ; 5122   02F8 0064
L_5124:
        PULR    R7                              ; 5124   02B7

L_5125:
        MVII    #$000F, R0                      ; 5125   02B8 000F

        JSR     R5,     X_PLAY_CHEER1           ; 5127   0004 011C 02D5
        JSR     R5,     L_5597                  ; 512A   0004 0154 0197
        DECLE   $000A                           ; 512D   000A

        JSR     R5,     L_548F                  ; 512E   0004 0154 008F

        PULR    R7                              ; 5131   02B7

L_5132:
        PSHR    R5                              ; 5132   0275
        MVII    #$0020, R1                      ; 5133   02B9 0020
        SWAP    R1,     1                       ; 5135   0041
        CLRR    R4                              ; 5136   01E4
        MVO     R4,     .BTAB.28                ; 5137   0244 0228
        MVO     R1,     .BTAB.14                ; 5139   0241 0214
        MVI     G_0184, R2                      ; 513B   0282 0184
        MVO     R4,     G_0194                  ; 513D   0244 0194
        MVO     R1,     .BTAB.DC                ; 513F   0241 02DC
        SUBI    #$000C, R2                      ; 5141   033A 000C
L_5143:
        PSHR    R2                              ; 5143   0272
        PSHR    R4                              ; 5144   0274

        JSR     R5,     L_5151                  ; 5145   0004 0150 0151

        PULR    R4                              ; 5148   02B4
        PULR    R2                              ; 5149   02B2
        INCR    R2                              ; 514A   000A
        INCR    R4                              ; 514B   000C
        CMPI    #$0014, R4                      ; 514C   037C 0014
        BLT     L_5143                          ; 514E   0225 000C
        PULR    R7                              ; 5150   02B7

L_5151:
        PSHR    R5                              ; 5151   0275
        ADDI    #$0200, R4                      ; 5152   02FC 0200
        MVII    #$0013, R3                      ; 5154   02BB 0013
        SDBD                                    ; 5156   0001
        CMPI    #$FFF7, R2                      ; 5157   037A 00F7 00FF
        BEQ     L_519F                          ; 515A   0204 0043

        MVII    #$0021, R3                      ; 515C   02BB 0021
        BLT     L_519F                          ; 515E   0205 003F

        CMPI    #$006E, R2                      ; 5160   037A 006E
        BGT     L_519F                          ; 5162   020E 003B

        MVII    #$000F, R3                      ; 5164   02BB 000F
        BEQ     L_519F                          ; 5166   0204 0037

        MVII    #$000A, R3                      ; 5168   02BB 000A
        TSTR    R2                              ; 516A   0092
        BMI     L_519F                          ; 516B   020B 0032

        CMPI    #$0065, R2                      ; 516D   037A 0065
        BGT     L_519F                          ; 516F   020E 002E

        MVII    #$0001, R1                      ; 5171   02B9 0001
        BEQ     L_519E                          ; 5173   0204 0029

        MVII    #$0000, R3                      ; 5175   02BB 0000
        CMPI    #$0001, R2                      ; 5177   037A 0001
        BEQ     L_519F                          ; 5179   0204 0024

        MOVR    R2,     R1                      ; 517B   0091
        MVII    #$0005, R2                      ; 517C   02BA 0005

        JSR     R5,     X_DIV                   ; 517E   0004 011C 01FB

        CMPI    #$0001, R1                      ; 5181   0379 0001
        BGT     L_519F                          ; 5183   020E 001A

        MVII    #$0001, R5                      ; 5185   02BD 0001
        TSTR    R1                              ; 5187   0089
        BNEQ    L_519A                          ; 5188   020C 0010

        SARC    R0,     1                       ; 518A   0078
        MOVR    R0,     R5                      ; 518B   0085
        RLC     R0,     1                       ; 518C   0050
        MVII    #$0017, R3                      ; 518D   02BB 0017
        MVII    #$0006, R1                      ; 518F   02B9 0006
        TSTR    R0                              ; 5191   0080
        BEQ     L_519E                          ; 5192   0204 000A

        CMPR    R1,     R5                      ; 5194   014D
        BLT     L_519A                          ; 5195   0205 0003

        SUBI    #$000A, R5                      ; 5197   033D 000A
        NEGR    R5                              ; 5199   0025
L_519A:
        SARC    R0,     1                       ; 519A   0078
        BC      L_519F                          ; 519B   0201 0002

        MOVR    R5,     R1                      ; 519D   00A9
L_519E:
        INCR    R7                              ; 519E   000F

L_519F:
        CLRR    R1                              ; 519F   01C9
L_51A0:
        SDBD                                    ; 51A0   0001
        ADDI    #$5E30, R3                      ; 51A1   02FB 0030 005E
        MVII    #$0009, R2                      ; 51A4   02BA 0009
        CLRR    R0                              ; 51A6   01C0

        JSR     R5,     L_51D0                  ; 51A7   0004 0150 01D0

L_51AA:
        MVI@    R3,     R0                      ; 51AA   0298
        INCR    R3                              ; 51AB   000B
        SARC    R0,     1                       ; 51AC   0078
        MOVR    R0,     R5                      ; 51AD   0085
        SLL     R0,     1                       ; 51AE   0048
        BNC     L_51B5                          ; 51AF   0209 0004

        MVI@    R3,     R0                      ; 51B1   0298
        INCR    R3                              ; 51B2   000B
        B       L_51B7                          ; 51B3   0200 0002

L_51B5:
        MVII    #$0001, R5                      ; 51B5   02BD 0001
L_51B7:
        PSHR    R0                              ; 51B7   0270
        PSHR    R5                              ; 51B8   0275

        JSR     R5,     L_51D0                  ; 51B9   0004 0150 01D0

        PULR    R5                              ; 51BC   02B5
        PULR    R0                              ; 51BD   02B0
        DECR    R2                              ; 51BE   0012
        BEQ     L_51C6                          ; 51BF   0204 0005

        DECR    R5                              ; 51C1   0015
        BNEQ    L_51B7                          ; 51C2   022C 000C
        B       L_51AA                          ; 51C4   0220 001B

L_51C6:
        ADDR    R1,     R3                      ; 51C6   00CB
        MVI@    R3,     R0                      ; 51C7   0298

        JSR     R5,     L_51D0                  ; 51C8   0004 0150 01D0

        CLRR    R0                              ; 51CB   01C0

        JSR     R5,     L_51D0                  ; 51CC   0004 0150 01D0

        PULR    R7                              ; 51CF   02B7

L_51D0:
        PSHR    R1                              ; 51D0   0271
        MVI@    R4,     R1                      ; 51D1   02A1
        DECR    R4                              ; 51D2   0014
        SDBD                                    ; 51D3   0001
        ANDI    #$2000, R1                      ; 51D4   03B9 0000 0020
        SLL     R0,     2                       ; 51D7   004C
        XORI    #$0007, R0                      ; 51D8   03F8 0007
        XORR    R1,     R0                      ; 51DA   01C8
        MVO@    R0,     R4                      ; 51DB   0260
        ADDI    #$0013, R4                      ; 51DC   02FC 0013
        PULR    R1                              ; 51DE   02B1
        MOVR    R5,     R7                      ; 51DF   00AF

L_51E0:
        PSHR    R5                              ; 51E0   0275
        MOVR    R2,     R3                      ; 51E1   0093
        SLL     R3,     1                       ; 51E2   004B
        DECR    R3                              ; 51E3   0013
        ADD     G_0198, R3                      ; 51E4   02C3 0198
        MVO     R3,     G_0198                  ; 51E6   0243 0198
        MOVR    R2,     R0                      ; 51E8   0090
        MVI     G_0184, R2                      ; 51E9   0282 0184
        DECR    R2                              ; 51EB   0012
        CLRR    R4                              ; 51EC   01E4
        TSTR    R0                              ; 51ED   0080
        BNEQ    L_51F4                          ; 51EE   020C 0004

        ADDI    #$0002, R2                      ; 51F0   02FA 0002
        MVII    #$0013, R4                      ; 51F2   02BC 0013
L_51F4:
        MVO     R2,     G_0184                  ; 51F4   0242 0184
        CLRR    R0                              ; 51F6   01C0
        TSTR    R2                              ; 51F7   0092
        BNEQ    L_51FC                          ; 51F8   020C 0002

        MVII    #$0001, R0                      ; 51FA   02B8 0001
L_51FC:
        CMPI    #$006A, R2                      ; 51FC   037A 006A
        BNEQ    L_5202                          ; 51FE   020C 0002

        MVII    #$0002, R0                      ; 5200   02B8 0002
L_5202:
        MVI     G_0183, R1                      ; 5202   0281 0183
        ANDI    #$00FC, R1                      ; 5204   03B9 00FC
        XORR    R0,     R1                      ; 5206   01C1
        MVO     R1,     G_0183                  ; 5207   0241 0183
        CLRR    R1                              ; 5209   01C9
        TSTR    R0                              ; 520A   0080
        BEQ     L_520F                          ; 520B   0204 0002

        MVO     R1,     G_0160                  ; 520D   0241 0160
L_520F:
        ADDR    R4,     R2                      ; 520F   00E2
        SUBI    #$000C, R2                      ; 5210   033A 000C

        JSR     R5,     L_5151                  ; 5212   0004 0150 0151
        JSR     R5,     L_56B2                  ; 5215   0004 0154 02B2
        JSR     R5,     L_522B                  ; 5218   0004 0150 022B

        PULR    R7                              ; 521B   02B7

L_521C:
        SDBD                                    ; 521C   0001
        MVI@    R5,     R3                      ; 521D   02AB
        PSHR    R5                              ; 521E   0275
        MVO     R3,     G_0192                  ; 521F   0243 0192
        SWAP    R3,     1                       ; 5221   0043
        MVO     R3,     G_0193                  ; 5222   0243 0193
        MVII    #$0002, R0                      ; 5224   02B8 0002

        JSR     R5,     X_CLR_BIT               ; 5226   0004 0114 02E6

        ANDR    R0,     R3                      ; 5229   0183
        INCR    R7                              ; 522A   000F

L_522B:
        PSHR    R5                              ; 522B   0275
L_522C:
        MVI     G_0183, R0                      ; 522C   0280 0183
        ANDI    #$0004, R0                      ; 522E   03B8 0004
        BEQ     L_5253                          ; 5230   0204 0021

        MVI     G_017F, R0                      ; 5232   0280 017F

        JSR     R5,     L_55AF                  ; 5234   0004 0154 01AF

        BNC     L_523B                          ; 5237   0209 0002

        ADDI    #$0006, R0                      ; 5239   02F8 0006
L_523B:
        MVII    #$007F, R1                      ; 523B   02B9 007F
        SUB     G_0184, R0                      ; 523D   0300 0184
        BNEQ    L_524E                          ; 523F   020C 000D

        MVO     R0,     G_0160                  ; 5241   0240 0160
        MVII    #$0002, R0                      ; 5243   02B8 0002

        JSR     R5,     X_SET_BIT               ; 5245   0004 0114 02DB

        ANDR    R0,     R3                      ; 5248   0183
        MVII    #$0192, R4                      ; 5249   02BC 0192
        PULR    R5                              ; 524B   02B5
        SDBD                                    ; 524C   0001
        MVI@    R4,     R7                      ; 524D   02A7
L_524E:
        BLT     L_5251                          ; 524E   0205 0001

        NEGR    R1                              ; 5250   0021
L_5251:
        MVO     R1,     G_0160                  ; 5251   0241 0160
L_5253:
        PULR    R7                              ; 5253   02B7

L_5254:
        PSHR    R5                              ; 5254   0275

        JSR     R5,     L_5260                  ; 5255   0004 0150 0260
        DECLE   $0000,  $0001                   ; 5258   0000 0001

        JSR     R5,     L_5260                  ; 525A   0004 0150 0260
        DECLE   $0001,  $0002                   ; 525D   0001 0002

        PULR    R7                              ; 525F   02B7

L_5260:
        MVI@    R5,     R0                      ; 5260   02A8
        MVI@    R5,     R1                      ; 5261   02A9
        SDBD                                    ; 5262   0001
        XORI    #$18C0, R1                      ; 5263   03F9 00C0 0018
        PSHR    R5                              ; 5266   0275

        JSR     R5,     L_55AF                  ; 5267   0004 0154 01AF

        BC      L_5278                          ; 526A   0201 000C

        MVII    #$000C, R5                      ; 526C   02BD 000C
        MVII    #$000F, R3                      ; 526E   02BB 000F
        CMP     G_016B, R0                      ; 5270   0340 016B
        BEQ     L_5284                          ; 5272   0204 0010

        MVII    #$000B, R3                      ; 5274   02BB 000B
        B       L_5282                          ; 5276   0200 000A

L_5278:
        MVII    #$0006, R5                      ; 5278   02BD 0006
        MVII    #$0008, R3                      ; 527A   02BB 0008
        CMP     G_016B, R0                      ; 527C   0340 016B
        BNEQ    L_5284                          ; 527E   020C 0004

        MVII    #$0004, R3                      ; 5280   02BB 0004
L_5282:
        SUBI    #$0030, R1                      ; 5282   0339 0030
L_5284:
        MVII    #$0264, R0                      ; 5284   02B8 0264
        ADDR    R0,     R5                      ; 5286   00C5
        ADDR    R0,     R3                      ; 5287   00C3
        SDBD                                    ; 5288   0001
        MVII    #$08A7, R0                      ; 5289   02B8 00A7 0008
        MVO@    R0,     R5                      ; 528C   0268
        MVO@    R1,     R3                      ; 528D   0259
        PULR    R7                              ; 528E   02B7

L_528F:
        CLRR    R0                              ; 528F   01C0
L_5290:
        PSHR    R5                              ; 5290   0275
        PSHR    R0                              ; 5291   0270
        MVO     R0,     G_0198                  ; 5292   0240 0198

        JSR     R5,     L_5132                  ; 5294   0004 0150 0132

        PULR    R0                              ; 5297   02B0

        JSR     R5,     L_52A3                  ; 5298   0004 0150 02A3
        DECLE   $0000,  $0001                   ; 529B   0000 0001

        JSR     R5,     L_52A3                  ; 529D   0004 0150 02A3
        DECLE   $0001,  $0002                   ; 52A0   0001 0002

        PULR    R7                              ; 52A2   02B7

L_52A3:
        MVI@    R5,     R1                      ; 52A3   02A9
        MVI@    R5,     R2                      ; 52A4   02AA
        SDBD                                    ; 52A5   0001
        XORI    #$1878, R2                      ; 52A6   03FA 0078 0018
        PSHR    R5                              ; 52A9   0275
        MVII    #$0001, R3                      ; 52AA   02BB 0001
        SDBD                                    ; 52AC   0001
        MVII    #$52D0, R4                      ; 52AD   02BC 00D0 0052

        JSR     R5,     L_55AF                  ; 52B0   0004 0154 01AF

        BC      L_52B7                          ; 52B3   0201 0002

        ADDI    #$0004, R4                      ; 52B5   02FC 0004
L_52B7:
        CMP     G_016B, R1                      ; 52B7   0341 016B
        BEQ     L_52BE                          ; 52B9   0204 0003

        INCR    R3                              ; 52BB   000B
        ADDI    #$0002, R4                      ; 52BC   02FC 0002
L_52BE:
        ADD@    R4,     R2                      ; 52BE   02E2
        MVI@    R4,     R4                      ; 52BF   02A4
        ADDR    R0,     R4                      ; 52C0   00C4
        BLT     L_52CF                          ; 52C1   0205 000C

        CMPI    #$0014, R4                      ; 52C3   037C 0014
        BGE     L_52CF                          ; 52C5   020D 0008

        ADDI    #$0264, R4                      ; 52C7   02FC 0264
L_52C9:
        MVO@    R2,     R4                      ; 52C9   0262
        ADDI    #$0008, R2                      ; 52CA   02FA 0008
        DECR    R3                              ; 52CC   0013
        BNEQ    L_52C9                          ; 52CD   022C 0005
L_52CF:
        PULR    R7                              ; 52CF   02B7

        DECLE   $0030,  $0006,  $0038,  $0007   ; 52D0   0030 0006 0038 0007
        DECLE   $0000                           ; 52D4   0000

        INCR    R5                              ; 52D5   000D
        INCR    R0                              ; 52D6   0008
        INCR    R3                              ; 52D7   000B
L_52D8:
        PSHR    R5                              ; 52D8   0275

        JSR     R5,     .EXEC.772               ; 52D9   0004 0114 0372

        SAR     R2,     2                       ; 52DC   006E
        INCR    R2                              ; 52DD   000A
        SAR     R2,     1                       ; 52DE   006A
        MOVR    R2,     R0                      ; 52DF   0090
        SUBI    #$000E, R0                      ; 52E0   0338 000E
        ADD     G_0184, R0                      ; 52E2   02C0 0184
        DECR    R2                              ; 52E4   0012

        JSR     R5,     L_55AF                  ; 52E5   0004 0154 01AF

        MOVR    R0,     R1                      ; 52E8   0081
        ADCR    R0                              ; 52E9   0028
        PULR    R7                              ; 52EA   02B7

L_52EB:
        PSHR    R5                              ; 52EB   0275
        PSHR    R0                              ; 52EC   0270

        JSR     R5,     .EXEC.76C               ; 52ED   0004 0114 036C

        MVI     G_0196, R0                      ; 52F0   0280 0196
        SUB     G_0184, R0                      ; 52F2   0300 0184

        JSR     R5,     X_CLAMP                 ; 52F4   0004 0114 0270
        DECLE   $0000                           ; 52F7   0000

        DECR    R6                              ; 52F8   0016
        SLL     R0,     2                       ; 52F9   004C
        SLL     R0,     1                       ; 52FA   0048
        SWAP    R0,     1                       ; 52FB   0040
        MOVR    R1,     R5                      ; 52FC   008D
        ADDI    #$0002, R5                      ; 52FD   02FD 0002
        MVO@    R0,     R5                      ; 52FF   0268
        MVI     G_0195, R0                      ; 5300   0280 0195
        SWAP    R0,     1                       ; 5302   0040
        MVO@    R0,     R5                      ; 5303   0268
        CLRR    R0                              ; 5304   01C0
        MVO@    R0,     R5                      ; 5305   0268
        MVII    #$000E, R0                      ; 5306   02B8 000E
        MVO@    R0,     R5                      ; 5308   0268

        JSR     R5,     L_5375                  ; 5309   0004 0150 0375

        SDBD                                    ; 530C   0001
        MVII    #$5F9F, R4                      ; 530D   02BC 009F 005F
        CMPI    #$031D, R1                      ; 5310   0379 031D
        BEQ     L_5319                          ; 5312   0204 0005

        SDBD                                    ; 5314   0001
        MVII    #$5F90, R4                      ; 5315   02BC 0090 005F
        MOVR    R3,     R2                      ; 5318   009A

L_5319:
        JSR     R5,     L_55AF                  ; 5319   0004 0154 01AF

        BNC     L_5320                          ; 531C   0209 0002

        XORI    #$0200, R2                      ; 531E   03FA 0200
L_5320:
        SDBD                                    ; 5320   0001
        XORI    #$5840, R2                      ; 5321   03FA 0040 0058
        MVO@    R2,     R1                      ; 5324   024A
        INCR    R1                              ; 5325   0009
        MVO@    R4,     R1                      ; 5326   024C
        PULR    R0                              ; 5327   02B0

        JSR     R5,     .EXEC.41C               ; 5328   0004 0114 001C

        MVI     G_0198, R0                      ; 532B   0280 0198

        JSR     R5,     X_EXT_SIGN_LO           ; 532D   0004 0114 0268
        JSR     R5,     L_5290                  ; 5330   0004 0150 0290

        PULR    R7                              ; 5333   02B7

L_5334:
        PSHR    R5                              ; 5334   0275
        PSHR    R0                              ; 5335   0270

        JSR     R5,     L_52D8                  ; 5336   0004 0150 02D8

        MVO     R3,     G_0195                  ; 5339   0243 0195
        ADDI    #$000E, R1                      ; 533B   02F9 000E
        MVO     R1,     G_0196                  ; 533D   0241 0196
        SAR     R3,     2                       ; 533F   006F
        SAR     R3,     1                       ; 5340   006B
        DECR    R3                              ; 5341   0013
        MOVR    R2,     R4                      ; 5342   0094
        MOVR    R3,     R0                      ; 5343   0098
        MVII    #$0014, R1                      ; 5344   02B9 0014

        JSR     R5,     X_MPY                   ; 5346   0004 011C 01DC

        ADDR    R2,     R4                      ; 5349   00D4
        SDBD                                    ; 534A   0001
        MVII    #$0898, R1                      ; 534B   02B9 0098 0008

        JSR     R5,     L_5375                  ; 534E   0004 0150 0375
        JSR     R5,     L_55AF                  ; 5351   0004 0154 01AF

        BNC     L_5358                          ; 5354   0209 0002

        ADDI    #$0030, R1                      ; 5356   02F9 0030
L_5358:
        XORR    R2,     R1                      ; 5358   01D1
        ADDI    #$0200, R4                      ; 5359   02FC 0200
        MVO@    R1,     R4                      ; 535B   0261
        PULR    R0                              ; 535C   02B0

        JSR     R5,     .EXEC.76C               ; 535D   0004 0114 036C

        SDBD                                    ; 5360   0001
        MVII    #$588F, R2                      ; 5361   02BA 008F 0058
        MVO@    R2,     R1                      ; 5364   024A
        INCR    R1                              ; 5365   0009
        SDBD                                    ; 5366   0001
        MVII    #$5F7E, R2                      ; 5367   02BA 007E 005F
        MVO@    R2,     R1                      ; 536A   024A
        ADDI    #$0004, R1                      ; 536B   02F9 0004
        CLRR    R2                              ; 536D   01D2
        MVO@    R2,     R1                      ; 536E   024A
        INCR    R1                              ; 536F   0009
        MVO@    R2,     R1                      ; 5370   024A

        JSR     R5,     .EXEC.41C               ; 5371   0004 0114 001C

        PULR    R7                              ; 5374   02B7

L_5375:
        MVI     G_016B, R2                      ; 5375   0282 016B
        SLL     R2,     1                       ; 5377   004A
        MVII    #$0011, R3                      ; 5378   02BB 0011
        BEQ     L_537E                          ; 537A   0204 0002

        MVII    #$0012, R3                      ; 537C   02BB 0012
L_537E:
        MOVR    R5,     R7                      ; 537E   00AF

L_537F:
        PSHR    R5                              ; 537F   0275

        JSR     R5,     L_5402                  ; 5380   0004 0154 0002

        MVI     G_016A, R0                      ; 5383   0280 016A
        CMPI    #$0009, R0                      ; 5385   0378 0009
        BEQ     L_53FA                          ; 5387   0204 0071

        MVI     G_0182, R0                      ; 5389   0280 0182
        MVI     G_0194, R1                      ; 538B   0281 0194
        ANDI    #$0040, R0                      ; 538D   03B8 0040
        BNEQ    L_53A7                          ; 538F   020C 0016

        ANDI    #$0004, R1                      ; 5391   03B9 0004
        BEQ     L_53FA                          ; 5393   0204 0065

        XOR     G_0194, R1                      ; 5395   03C1 0194
        MVO     R1,     G_0194                  ; 5397   0241 0194
        MVII    #$02DC, R4                      ; 5399   02BC 02DC
        MVII    #$0020, R3                      ; 539B   02BB 0020
        SWAP    R3,     1                       ; 539D   0043
        INCR    R7                              ; 539E   000F

L_539F:
        PSHR    R5                              ; 539F   0275
L_53A0:
        MVII    #$0014, R0                      ; 53A0   02B8 0014

        JSR     R5,     X_PRPAD_R5              ; 53A2   0004 0118 0071
        DECLE   $0000                           ; 53A5   0000

        PULR    R7                              ; 53A6   02B7

L_53A7:
        MOVR    R1,     R0                      ; 53A7   0088
        ANDI    #$0004, R1                      ; 53A8   03B9 0004
        BNEQ    L_53FA                          ; 53AA   020C 004E

        XORI    #$0004, R0                      ; 53AC   03F8 0004
        MVO     R0,     G_0194                  ; 53AE   0240 0194
        MVII    #$02DE, R4                      ; 53B0   02BC 02DE
        MVII    #$0007, R3                      ; 53B2   02BB 0007
        MVI     G_016C, R0                      ; 53B4   0280 016C

        JSR     R5,     L_54CC                  ; 53B6   0004 0154 00CC
        JSR     R5,     X_PRINT_R5              ; 53B9   0004 0118 007B
        STRING  " and  G"                       ; 53BC  
        DECLE   $0000                           ; 53C3   0000

        MVI     G_0180, R0                      ; 53C4   0280 0180
        SWAP    R0,     1                       ; 53C6   0040
        SWAP    R0,     1                       ; 53C7   0040
        BMI     L_53D1                          ; 53C8   020B 0007

        MVII    #$0003, R1                      ; 53CA   02B9 0003
        SUBR    R1,     R4                      ; 53CC   010C

        JSR     R5,     X_PRNUM_RGT             ; 53CD   0004 0118 00C5

        ADDR    R1,     R4                      ; 53D0   00CC

L_53D1:
        JSR     R5,     X_PRINT_R5              ; 53D1   0004 0118 007B
        STRING  " on 50"                        ; 53D4  
        DECLE   $0000                           ; 53DA   0000

        MVI     G_017F, R0                      ; 53DB   0280 017F
        MVII    #$0002, R2                      ; 53DD   02BA 0002
        MVI     G_017E, R1                      ; 53DF   0281 017E
        SARC    R1,     1                       ; 53E1   0079
        BNC     L_53E5                          ; 53E2   0209 0001

        CLRR    R2                              ; 53E4   01D2
L_53E5:
        MVII    #$0002, R1                      ; 53E5   02B9 0002
        CMPI    #$0032, R0                      ; 53E7   0378 0032
        BEQ     L_53FA                          ; 53E9   0204 000F
        BLT     L_53F2                          ; 53EB   0205 0005

        XORI    #$0002, R2                      ; 53ED   03FA 0002
        NEGR    R0                              ; 53EF   0020
        ADDI    #$0064, R0                      ; 53F0   02F8 0064
L_53F2:
        SUBR    R1,     R4                      ; 53F2   010C
        MOVR    R2,     R3                      ; 53F3   0093
        TSTR    R0                              ; 53F4   0080
        BEQ     L_53FB                          ; 53F5   0204 0004

        JSR     R5,     X_PRNUM_RGT             ; 53F7   0004 0118 00C5

L_53FA:
        PULR    R7                              ; 53FA   02B7

L_53FB:
        JSR     R5,     X_PRINT_R5              ; 53FB   0004 0118 007B
        STRING  " G"                            ; 53FE   0020 0047
        DECLE   $0000                           ; 5400   0000

        PULR    R7                              ; 5401   02B7

L_5402:
        PSHR    R5                              ; 5402   0275
        MVII    #$0200, R4                      ; 5403   02BC 0200
        CLRR    R3                              ; 5405   01DB
        MVI     G_0182, R0                      ; 5406   0280 0182
        MVI     G_0194, R1                      ; 5408   0281 0194
        MOVR    R0,     R5                      ; 540A   0085
        ANDI    #$0010, R5                      ; 540B   03BD 0010
        BEQ     L_542D                          ; 540D   0204 001E

        ANDI    #$0080, R0                      ; 540F   03B8 0080
        BNEQ    L_5417                          ; 5411   020C 0004

        JSR     R5,     L_5480                  ; 5413   0004 0154 0080
        DECLE   $0001                           ; 5416   0001
L_5417:
        MVI     G_0170, R0                      ; 5417   0280 0170
        MVII    #$0002, R1                      ; 5419   02B9 0002
        MVII    #$0007, R3                      ; 541B   02BB 0007
        MVII    #$0206, R4                      ; 541D   02BC 0206

        JSR     R5,     X_PRNUM_RGT             ; 541F   0004 0118 00C5

        MVII    #$0208, R4                      ; 5422   02BC 0208
        MVII    #$00D7, R0                      ; 5424   02B8 00D7
        MVO@    R0,     R4                      ; 5426   0260
        MVI     G_016F, R0                      ; 5427   0280 016F

        JSR     R5,     X_PRNUM_ZRO             ; 5429   0004 0118 00AD

        PULR    R7                              ; 542C   02B7

L_542D:
        JSR     R5,     L_5480                  ; 542D   0004 0154 0080
        DECLE   $0002                           ; 5430   0002

        MVI     G_0185, R0                      ; 5431   0280 0185
        CMP     G_017F, R0                      ; 5433   0340 017F
        BEQ     L_543C                          ; 5435   0204 0005

        JSR     R5,     L_5460                  ; 5437   0004 0154 0060
        DECLE   $0000,  $0000                   ; 543A   0000 0000
L_543C:
        MVI     G_0185, R0                      ; 543C   0280 0185

        JSR     R5,     L_5115                  ; 543E   0004 0150 0115

        INCR    R1                              ; 5441   0009
        MOVR    R0,     R2                      ; 5442   0082

        JSR     R5,     L_5115                  ; 5443   0004 0150 0115
        DECLE   $0001                           ; 5446   0001

        MOVR    R0,     R3                      ; 5447   0083
        MVI     G_017F, R0                      ; 5448   0280 017F
        CMPR    R0,     R2                      ; 544A   0142
        BEQ     L_5452                          ; 544B   0204 0005

        JSR     R5,     L_5460                  ; 544D   0004 0154 0060
        DECLE   $0000,  $0007                   ; 5450   0000 0007
L_5452:
        MOVR    R3,     R0                      ; 5452   0098

        JSR     R5,     L_5460                  ; 5453   0004 0154 0060
        DECLE   $0001,  $0008                   ; 5456   0001 0008

        PULR    R7                              ; 5458   02B7

L_5459:
        MVI     G_0194, R0                      ; 5459   0280 0194
L_545B:
        ANDI    #$00FD, R0                      ; 545B   03B8 00FD
        MVO     R0,     G_0194                  ; 545D   0240 0194
        MOVR    R5,     R7                      ; 545F   00AF

L_5460:
        MVI@    R5,     R2                      ; 5460   02AA
        MVI@    R5,     R1                      ; 5461   02A9
        ADDI    #$000C, R0                      ; 5462   02F8 000C
        MOVR    R0,     R4                      ; 5464   0084
        SDBD                                    ; 5465   0001
        ADDI    #$0490, R1                      ; 5466   02F9 0090 0004
        MVI     G_017E, R0                      ; 5469   0280 017E
        XOR     G_016B, R0                      ; 546B   03C0 016B
        ANDI    #$0001, R0                      ; 546D   03B8 0001
        XORR    R0,     R2                      ; 546F   01C2
        SLL     R0,     2                       ; 5470   004C
        SLL     R0,     1                       ; 5471   0048
        XORR    R0,     R1                      ; 5472   01C1
        ADDR    R2,     R4                      ; 5473   00D4
        SUB     G_0184, R4                      ; 5474   0304 0184
        BLT     L_547F                          ; 5476   0205 0007

        CMPI    #$0014, R4                      ; 5478   037C 0014
        BGE     L_547F                          ; 547A   020D 0003

        ADDI    #$0200, R4                      ; 547C   02FC 0200
        MVO@    R1,     R4                      ; 547E   0261
L_547F:
        MOVR    R5,     R7                      ; 547F   00AF

L_5480:
        MVI@    R5,     R2                      ; 5480   02AA
        PSHR    R5                              ; 5481   0275
        MOVR    R1,     R0                      ; 5482   0088
        ANDR    R2,     R0                      ; 5483   0190
        BNEQ    L_5489                          ; 5484   020C 0003

        JSR     R5,     L_539F                  ; 5486   0004 0150 039F

L_5489:
        ANDI    #$00FC, R1                      ; 5489   03B9 00FC
        XORR    R2,     R1                      ; 548B   01D1
        MVO     R1,     G_0194                  ; 548C   0241 0194
        PULR    R7                              ; 548E   02B7

L_548F:
        PSHR    R5                              ; 548F   0275
        MVII    #$000D, R0                      ; 5490   02B8 000D

        JSR     R5,     X_CLR_BIT               ; 5492   0004 0114 02E6
        DECLE   $0228                           ; 5495   0228

        MVII    #$020B, R4                      ; 5496   02BC 020B
        CLRR    R3                              ; 5498   01DB
        MVII    #$001D, R0                      ; 5499   02B8 001D

        JSR     R5,     X_PRPAD_R5              ; 549B   0004 0118 0071
        STRING  " Visitor"                      ; 549E  
        DECLE   $0000                           ; 54A6   0000

        MVII    #$0222, R4                      ; 54A7   02BC 0222
        MVII    #$0003, R1                      ; 54A9   02B9 0003
        MVI     G_017C, R0                      ; 54AB   0280 017C

        JSR     R5,     X_PRNUM_RGT             ; 54AD   0004 0118 00C5

        MVII    #$0216, R4                      ; 54B0   02BC 0216
        MVII    #$0002, R3                      ; 54B2   02BB 0002
        MVI     G_017D, R0                      ; 54B4   0280 017D

        JSR     R5,     X_PRNUM_LFT             ; 54B6   0004 0118 009E

        MVII    #$0200, R4                      ; 54B9   02BC 0200

        JSR     R5,     X_PRINT_R5              ; 54BB   0004 0118 007B
        STRING  " Home "                        ; 54BE  
        DECLE   $0000                           ; 54C4   0000

        MVII    #$021B, R4                      ; 54C5   02BC 021B
        MVII    #$0007, R3                      ; 54C7   02BB 0007
        MVI     G_017E, R0                      ; 54C9   0280 017E
        PULR    R5                              ; 54CB   02B5
L_54CC:
        MOVR    R7,     R1                      ; 54CC   00B9
        ADDI    #$0007, R1                      ; 54CD   02F9 0007
        SLL     R0,     2                       ; 54CF   004C
        ADDR    R0,     R1                      ; 54D0   00C1
        J       X_PRINT_R1                      ; 54D1   0004 0318 0067

        DECLE   $0031,  $0073,  $0074,  $0000   ; 54D4   0031 0073 0074 0000
        DECLE   $0032,  $006E,  $0064,  $0000   ; 54D8   0032 006E 0064 0000
        DECLE   $0033,  $0072,  $0064,  $0000   ; 54DC   0033 0072 0064 0000
        DECLE   $0034,  $0074,  $0068,  $0000   ; 54E0   0034 0074 0068 0000
        DECLE   $0045,  $006E,  $0064,  $0000   ; 54E4   0045 006E 0064 0000
L_54E8:
        PSHR    R5                              ; 54E8   0275
        MVII    #$0160, R4                      ; 54E9   02BC 0160
        MVI@    R4,     R0                      ; 54EB   02A0
        SWAP    R0,     1                       ; 54EC   0040
        SAR     R0,     2                       ; 54ED   006C
        SAR     R0,     2                       ; 54EE   006C
        SAR     R0,     1                       ; 54EF   0068
        MOVR    R4,     R3                      ; 54F0   00A3
        SDBD                                    ; 54F1   0001
        ADD@    R4,     R0                      ; 54F2   02E0
        MVO@    R0,     R3                      ; 54F3   0258
        SWAP    R0,     1                       ; 54F4   0040
        MOVR    R0,     R2                      ; 54F5   0082
        INCR    R3                              ; 54F6   000B
        SUB@    R3,     R0                      ; 54F7   0318
        MOVR    R2,     R1                      ; 54F8   0091
        ANDI    #$0007, R1                      ; 54F9   03B9 0007
        MVO@    R1,     R3                      ; 54FB   0259
        XORR    R1,     R2                      ; 54FC   01CA
        MVII    #$0166, R5                      ; 54FD   02BD 0166
        MVO@    R2,     R5                      ; 54FF   026A
        SUBR    R0,     R2                      ; 5500   0102
        INCR    R5                              ; 5501   000D
        MVO@    R2,     R5                      ; 5502   026A
        MVII    #$0003, R3                      ; 5503   02BB 0003
        MVO@    R3,     R5                      ; 5505   026B
        MVII    #$0100, R5                      ; 5506   02BD 0100
        SDBD                                    ; 5508   0001
        MVI@    R5,     R0                      ; 5509   02A8
        MVO@    R0,     R4                      ; 550A   0260
        SWAP    R0,     1                       ; 550B   0040
        MVO@    R0,     R4                      ; 550C   0260
        MOVR    R7,     R0                      ; 550D   00B8
        ADDI    #$0016, R0                      ; 550E   02F8 0016
        MVO     R0,     .ISRVEC.0               ; 5510   0240 0100
        SWAP    R0,     1                       ; 5512   0040
        MVO     R0,     .ISRVEC.1               ; 5513   0240 0101
L_5515:
        EIS                                     ; 5515   0002
        MVI     G_0169, R2                      ; 5516   0282 0169
        SARC    R2,     2                       ; 5518   007E
        BC      L_5515                          ; 5519   0221 0005
        BNOV    L_5520                          ; 551B   020A 0003

        JSR     R5,     L_51E0                  ; 551D   0004 0150 01E0
L_5520:
        JSR     R5,     X_PLAY_NOTE             ; 5520   0004 0118 02BD

        PULR    R7                              ; 5523   02B7

        PSHR    R5                              ; 5524   0275
        MVII    #$031D, R2                      ; 5525   02BA 031D
        CLRR    R3                              ; 5527   01DB
L_5528:
        MVII    #$0167, R5                      ; 5528   02BD 0167
        MVI@    R2,     R0                      ; 552A   0290
        SLL     R0,     1                       ; 552B   0048
        BPL     L_5530                          ; 552C   0203 0002

        MVII    #$0165, R5                      ; 552E   02BD 0165
L_5530:
        ADDI    #$0002, R2                      ; 5530   02FA 0002
        MVI@    R2,     R0                      ; 5532   0290
        SDBD                                    ; 5533   0001
        ADD@    R5,     R0                      ; 5534   02E8
        MVO@    R0,     R2                      ; 5535   0250
        MVI@    R3,     R0                      ; 5536   0298
        MOVR    R0,     R1                      ; 5537   0081
        ANDI    #$00FF, R1                      ; 5538   03B9 00FF
        XORR    R1,     R0                      ; 553A   01C8
        DECR    R5                              ; 553B   0015
        ADD@    R5,     R1                      ; 553C   02E9
        ANDI    #$00FF, R1                      ; 553D   03B9 00FF
        XORR    R1,     R0                      ; 553F   01C8
        MVO@    R0,     R3                      ; 5540   0258
        ADDI    #$0006, R2                      ; 5541   02FA 0006
        INCR    R3                              ; 5543   000B
        CMPI    #$0008, R3                      ; 5544   037B 0008
        BNEQ    L_5528                          ; 5546   022C 001F

        MVI     G_0162, R0                      ; 5548   0280 0162
        MVO     R0,     .STIC.HDLY              ; 554A   0240 0030
        MVO     R0,     .STIC.VIDEN             ; 554C   0240 0020
        MVII    #$0163, R4                      ; 554E   02BC 0163
        SDBD                                    ; 5550   0001
        MVI@    R4,     R0                      ; 5551   02A0
        MVO     R0,     .ISRVEC.0               ; 5552   0240 0100
        SWAP    R0,     1                       ; 5554   0040
        MVO     R0,     .ISRVEC.1               ; 5555   0240 0101
        CLRR    R2                              ; 5557   01D2
        MVI     G_0166, R0                      ; 5558   0280 0166
        SWAP    R0,     2                       ; 555A   0044
        BEQ     L_5592                          ; 555B   0204 0035
        BPL     L_5577                          ; 555D   0203 0018

        MVII    #$0200, R4                      ; 555F   02BC 0200
        MOVR    R4,     R5                      ; 5561   00A5
L_5562:
        MVI@    R4,     R0                      ; 5562   02A0
        SDBD                                    ; 5563   0001
        ANDI    #$2000, R0                      ; 5564   03B8 0000 0020
        XOR@    R4,     R0                      ; 5567   03E0
        MVO@    R0,     R5                      ; 5568   0268
        MVII    #$0012, R3                      ; 5569   02BB 0012
L_556B:
        MVI@    R4,     R0                      ; 556B   02A0
        MVO@    R0,     R5                      ; 556C   0268
        DECR    R3                              ; 556D   0013
        BNEQ    L_556B                          ; 556E   022C 0004

        INCR    R5                              ; 5570   000D
        CMPI    #$02E6, R4                      ; 5571   037C 02E6
        BLT     L_5562                          ; 5573   0225 0012
        B       L_5590                          ; 5575   0200 0019

L_5577:
        MVII    #$0212, R5                      ; 5577   02BD 0212
        MVII    #$0003, R1                      ; 5579   02B9 0003
L_557B:
        MVII    #$0012, R3                      ; 557B   02BB 0012
L_557D:
        MVI@    R5,     R0                      ; 557D   02A8
        MVO@    R0,     R5                      ; 557E   0268
        SUBR    R1,     R5                      ; 557F   010D
        DECR    R3                              ; 5580   0013
        BNEQ    L_557D                          ; 5581   022C 0005

        MVI@    R5,     R0                      ; 5583   02A8
        SDBD                                    ; 5584   0001
        ANDI    #$5FFF, R0                      ; 5585   03B8 00FF 005F
        MVO@    R0,     R5                      ; 5588   0268
        ADDI    #$0024, R5                      ; 5589   02FD 0024
        CMPI    #$02F0, R5                      ; 558B   037D 02F0
        BLT     L_557B                          ; 558D   0225 0013

        INCR    R2                              ; 558F   000A
L_5590:
        MVII    #$0002, R0                      ; 5590   02B8 0002
L_5592:
        SLL     R2,     2                       ; 5592   004E
        XORR    R0,     R2                      ; 5593   01C2
        MVO     R2,     G_0169                  ; 5594   0242 0169
        PULR    R7                              ; 5596   02B7

L_5597:
        MVI@    R5,     R0                      ; 5597   02A8
L_5598:
        MVO     R0,     G_016A                  ; 5598   0240 016A

L_559A:
        JSR     R4,     L_55A9                  ; 559A   0004 0054 01A9
        DECLE   $0000                           ; 559D   0000

        SWAP    R0,     1                       ; 559E   0040
        ADDR    R2,     R0                      ; 559F   00D0
        RLC     R0,     1                       ; 55A0   0050
        SWAP    R0,     1                       ; 55A1   0040
        ADCR    R7                              ; 55A2   002F

        ADCR    R1                              ; 55A3   0029
L_55A4:
        ADCR    R3                              ; 55A4   002B
        DECLE   $0029,  $0000,  $0090,  $002F   ; 55A5   0029 0000 0090 002F
L_55A9:
        ADD     G_016A, R4                      ; 55A9   02C4 016A
        MVI@    R4,     R0                      ; 55AB   02A0
        MVO     R0,     G_0182                  ; 55AC   0240 0182
        MOVR    R5,     R7                      ; 55AE   00AF

L_55AF:
        PSHR    R0                              ; 55AF   0270
        MVI     G_017E, R0                      ; 55B0   0280 017E
        XOR     G_016B, R0                      ; 55B2   03C0 016B
        SARC    R0,     1                       ; 55B4   0078
        PULR    R0                              ; 55B5   02B0
        MOVR    R5,     R7                      ; 55B6   00AF

L_55B7:
        PSHR    R5                              ; 55B7   0275
        MVII    #$0020, R0                      ; 55B8   02B8 0020
        MVII    #$031D, R1                      ; 55BA   02B9 031D
        MVII    #$033D, R2                      ; 55BC   02BA 033D
L_55BE:
        MVI@    R1,     R3                      ; 55BE   028B
        MVI@    R2,     R5                      ; 55BF   0295
        MVO@    R5,     R1                      ; 55C0   024D
        MVO@    R3,     R2                      ; 55C1   0253
        INCR    R1                              ; 55C2   0009
        INCR    R2                              ; 55C3   000A
        DECR    R0                              ; 55C4   0010
        BNEQ    L_55BE                          ; 55C5   022C 0008

        INCR    R0                              ; 55C7   0008
        XOR     G_016B, R0                      ; 55C8   03C0 016B
        MVO     R0,     G_016B                  ; 55CA   0240 016B
        MVI     G_0179, R0                      ; 55CC   0280 0179
        SLL     R0,     2                       ; 55CE   004C
        SLL     R0,     2                       ; 55CF   004C
        MOVR    R0,     R1                      ; 55D0   0081
        SWAP    R1,     1                       ; 55D1   0041
        XORR    R1,     R0                      ; 55D2   01C8
        MVO     R0,     G_0179                  ; 55D3   0240 0179
        PULR    R7                              ; 55D5   02B7

L_55D6:
        JSR     R4,     L_55ED                  ; 55D6   0004 0054 01ED
        DECLE   $0000,  $0000,  $0052,  $0057   ; 55D9   0000 0000 0052 0057
        DECLE   $008A,  $0058,  $0074,  $0058   ; 55DD   008A 0058 0074 0058
        DECLE   $0074,  $0058,  $0000,  $0000   ; 55E1   0074 0058 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55E5   0000 0000 0000 0000

        ADDR    R0,     R1                      ; 55E9   00C1
        SLLC    R2,     1                       ; 55EA   005A
        ADDR    R0,     R1                      ; 55EB   00C1
        SLLC    R2,     1                       ; 55EC   005A
L_55ED:
        ADD@    R5,     R4                      ; 55ED   02EC
        B       L_55F4                          ; 55EE   0200 0004

L_55F0:
        SDBD                                    ; 55F0   0001
        MVII    #$1906, R4                      ; 55F1   02BC 0006 0019
L_55F4:
        MVO     R4,     G_035D                  ; 55F4   0244 035D
L_55F6:
        MOVR    R5,     R7                      ; 55F6   00AF

L_55F7:
        PSHR    R5                              ; 55F7   0275

        JSR     R5,     L_561E                  ; 55F8   0004 0154 021E
        DECLE   $0000,  $0001,  $0002,  $0019   ; 55FB   0000 0001 0002 0019

        MVI     G_016A, R3                      ; 55FF   0283 016A
        CMPI    #$000B, R3                      ; 5601   037B 000B
        BNEQ    L_5616                          ; 5603   020C 0011

        TSTR    R0                              ; 5605   0080
        BEQ     L_5616                          ; 5606   0204 000E

        MVII    #$0001, R0                      ; 5608   02B8 0001
        MVO     R0,     G_035B                  ; 560A   0240 035B

        JSR     R5,     L_5597                  ; 560C   0004 0154 0197
        DECLE   $0005                           ; 560F   0005

        MVII    #$000E, R0                      ; 5610   02B8 000E

        JSR     R5,     X_CLR_BIT               ; 5612   0004 0114 02E6

        CMP@    R2,     R5                      ; 5615   0355

L_5616:
        JSR     R5,     L_561E                  ; 5616   0004 0154 021E
        DECLE   $0004,  $0000,  $0001,  $001B   ; 5619   0004 0000 0001 001B

        PULR    R7                              ; 561D   02B7

L_561E:
        MVI@    R5,     R0                      ; 561E   02A8
        MVI     G_016B, R2                      ; 561F   0282 016B
        XOR@    R5,     R2                      ; 5621   03EA
        MVI     G_0182, R1                      ; 5622   0281 0182
        AND@    R5,     R1                      ; 5624   03A9
        MVI@    R5,     R4                      ; 5625   02AC
        BEQ     L_55F6                          ; 5626   0224 0031

        PSHR    R5                              ; 5628   0275

        JSR     R5,     .EXEC.76C               ; 5629   0004 0114 036C
        JSR     R5,     X_POW2                  ; 562C   0004 0114 0345

        AND     G_0179, R0                      ; 562F   0380 0179
        BNEQ    L_5718                          ; 5631   020C 00E5

        MOVR    R1,     R3                      ; 5633   008B
        ADDI    #$0004, R3                      ; 5634   02FB 0004
        ADDI    #$011F, R2                      ; 5636   02FA 011F
        MVI@    R2,     R1                      ; 5638   0291
        MOVR    R1,     R2                      ; 5639   008A
        ANDI    #$00C0, R2                      ; 563A   03BA 00C0
        BNEQ    L_5643                          ; 563C   020C 0005

        MOVR    R4,     R0                      ; 563E   00A0

        JSR     R5,     .EXEC.629               ; 563F   0004 0114 0229

        INCR    R7                              ; 5642   000F

L_5643:
        CLRR    R0                              ; 5643   01C0
L_5644:
        MVO@    R0,     R3                      ; 5644   0258
        PULR    R7                              ; 5645   02B7

L_5646:
        MVII    #$031D, R1                      ; 5646   02B9 031D
        MVI     G_016A, R3                      ; 5648   0283 016A
        TSTR    R3                              ; 564A   009B
        BEQ     L_5653                          ; 564B   0204 0006

        SUBI    #$0009, R3                      ; 564D   033B 0009
        BEQ     L_5653                          ; 564F   0204 0002

        MVI     G_0179, R3                      ; 5651   0283 0179
L_5653:
        MOVR    R1,     R4                      ; 5653   008C
        ADDI    #$0005, R4                      ; 5654   02FC 0005
        MVI@    R1,     R0                      ; 5656   0288
        ANDI    #$0008, R0                      ; 5657   03B8 0008
        BNEQ    L_567B                          ; 5659   020C 0020

        MVI@    R1,     R2                      ; 565B   028A
        SDBD                                    ; 565C   0001
        ANDI    #$FDFF, R2                      ; 565D   03BA 00FF 00FD
        DECR    R4                              ; 5660   0014
        XOR@    R4,     R0                      ; 5661   03E0
        BEQ     L_566C                          ; 5662   0204 0008
        BMI     L_5668                          ; 5664   020B 0002

        XORI    #$0200, R2                      ; 5666   03FA 0200
L_5668:
        MVO@    R2,     R1                      ; 5668   024A
        MVII    #$03E0, R2                      ; 5669   02BA 03E0
        INCR    R7                              ; 566B   000F

L_566C:
        CLRR    R2                              ; 566C   01D2
L_566D:
        MVI@    R4,     R0                      ; 566D   02A0
        DECR    R4                              ; 566E   0014
        SDBD                                    ; 566F   0001
        ANDI    #$FC0F, R0                      ; 5670   03B8 000F 00FC
        SARC    R3,     1                       ; 5673   007B
        SLL     R3,     1                       ; 5674   004B
        BNC     L_5679                          ; 5675   0209 0002

        MVII    #$01F0, R2                      ; 5677   02BA 01F0
L_5679:
        XORR    R2,     R0                      ; 5679   01D0
        INCR    R7                              ; 567A   000F

L_567B:
        CLRR    R0                              ; 567B   01C0
L_567C:
        MVO@    R0,     R4                      ; 567C   0260
        SLR     R3,     1                       ; 567D   0063
        ADDI    #$0008, R1                      ; 567E   02F9 0008
        CMPI    #$0355, R1                      ; 5680   0379 0355
        BLE     L_5653                          ; 5682   0226 0030

        MVO     R3,     G_017B                  ; 5684   0243 017B
        MOVR    R5,     R7                      ; 5686   00AF

L_5687:
        PSHR    R5                              ; 5687   0275
        MVI     G_0182, R5                      ; 5688   0285 0182
        ANDI    #$0020, R5                      ; 568A   03BD 0020
        BEQ     L_5718                          ; 568C   0204 008A

        CLRR    R0                              ; 568E   01C0

        JSR     R5,     .EXEC.772               ; 568F   0004 0114 0372

        MVII    #$0033, R4                      ; 5692   02BC 0033
        MVI     G_016A, R5                      ; 5694   0285 016A
        CMPI    #$0008, R5                      ; 5696   037D 0008
        BNEQ    L_569C                          ; 5698   020C 0002

        MVII    #$007F, R4                      ; 569A   02BC 007F
L_569C:
        MVII    #$0001, R3                      ; 569C   02BB 0001
        ADD     G_0162, R2                      ; 569E   02C2 0162
        CMPI    #$0020, R2                      ; 56A0   037A 0020
        BLT     L_56AA                          ; 56A2   0205 0006

        CMPI    #$0090, R2                      ; 56A4   037A 0090
        BLT     L_56AF                          ; 56A6   0205 0007

        NEGR    R4                              ; 56A8   0024
        SLL     R3,     1                       ; 56A9   004B
L_56AA:
        AND     G_0183, R3                      ; 56AA   0383 0183
        BNEQ    L_56AF                          ; 56AC   020C 0001

        MOVR    R4,     R0                      ; 56AE   00A0
L_56AF:
        MVO     R0,     G_0160                  ; 56AF   0240 0160
        PULR    R7                              ; 56B1   02B7

L_56B2:
        MVII    #$00C8, R4                      ; 56B2   02BC 00C8
        MVII    #$00B0, R0                      ; 56B4   02B8 00B0
L_56B6:
        PSHR    R5                              ; 56B6   0275
        MVII    #$031D, R1                      ; 56B7   02B9 031D

L_56B9:
        JSR     R5,     .EXEC.777               ; 56B9   0004 0114 0377

        MOVR    R0,     R3                      ; 56BC   0083
        CMPR    R3,     R2                      ; 56BD   015A
        BLE     L_56C9                          ; 56BE   0206 0009

        CMPR    R4,     R2                      ; 56C0   0162
        BLT     L_56C4                          ; 56C1   0205 0001

        CLRR    R3                              ; 56C3   01DB
L_56C4:
        SWAP    R3,     1                       ; 56C4   0043
        MOVR    R1,     R2                      ; 56C5   008A
        ADDI    #$0002, R2                      ; 56C6   02FA 0002
        MVO@    R3,     R2                      ; 56C8   0253
L_56C9:
        ADDI    #$0008, R1                      ; 56C9   02F9 0008
        CMPI    #$0355, R1                      ; 56CB   0379 0355
        BLE     L_56B9                          ; 56CD   0226 0015
        PULR    R7                              ; 56CF   02B7

L_56D0:
        CLRR    R0                              ; 56D0   01C0
L_56D1:
        PSHR    R5                              ; 56D1   0275

        JSR     R5,     L_52D8                  ; 56D2   0004 0150 02D8

        MOVR    R0,     R4                      ; 56D5   0084

        JSR     R5,     L_511B                  ; 56D6   0004 0150 011B

        CLRR    R2                              ; 56D9   01D2
        MVII    #$000A, R5                      ; 56DA   02BD 000A
        CMPR    R3,     R5                      ; 56DC   015D
        RLC     R2,     1                       ; 56DD   0052
        CMPI    #$0057, R3                      ; 56DE   037B 0057
        RLC     R2,     1                       ; 56E0   0052
        ADDI    #$0013, R0                      ; 56E1   02F8 0013
        CMPR    R5,     R0                      ; 56E3   0168
        RLC     R2,     1                       ; 56E4   0052
        CMPI    #$0014, R0                      ; 56E5   0378 0014
        RLC     R2,     1                       ; 56E7   0052
        CMPI    #$0078, R0                      ; 56E8   0378 0078
        RLC     R2,     1                       ; 56EA   0052
        CMPI    #$0082, R0                      ; 56EB   0378 0082
        RLC     R2,     1                       ; 56ED   0052
        PULR    R7                              ; 56EE   02B7

L_56EF:
        PSHR    R5                              ; 56EF   0275
        MVI     G_0181, R2                      ; 56F0   0282 0181
        SARC    R2,     1                       ; 56F2   007A
        BC      L_5718                          ; 56F3   0201 0023

        MVII    #$016F, R4                      ; 56F5   02BC 016F
        MVI@    R4,     R1                      ; 56F7   02A1
        DECR    R4                              ; 56F8   0014
        SDBD                                    ; 56F9   0001
        MVI@    R4,     R0                      ; 56FA   02A0
        TSTR    R1                              ; 56FB   0089
        BNEQ    L_5700                          ; 56FC   020C 0002

        SUBI    #$00C4, R0                      ; 56FE   0338 00C4
L_5700:
        DECR    R0                              ; 5700   0010
        MVO     R0,     G_016F                  ; 5701   0240 016F
        SWAP    R0,     1                       ; 5703   0040
        MVO     R0,     G_0170                  ; 5704   0240 0170
        BNEQ    L_5718                          ; 5706   020C 0010

        MVII    #$0003, R0                      ; 5708   02B8 0003
        MVO     R0,     G_0181                  ; 570A   0240 0181

        JSR     R5,     L_5FDF                  ; 570C   0004 015C 03DF

        MVI     G_016A, R0                      ; 570F   0280 016A
        CMPI    #$0004, R0                      ; 5711   0378 0004
        BGT     L_5718                          ; 5713   020E 0003

        JSR     R5,     L_50CC                  ; 5715   0004 0150 00CC

L_5718:
        PULR    R7                              ; 5718   02B7

L_5719:
        MVI     G_0181, R0                      ; 5719   0280 0181
        ANDI    #$00FE, R0                      ; 571B   03B8 00FE
        XORI    #$0001, R0                      ; 571D   03F8 0001
        MVO     R0,     G_0181                  ; 571F   0240 0181
        MOVR    R5,     R7                      ; 5721   00AF

L_5722:
        MVI     G_0182, R0                      ; 5722   0280 0182
        ANDI    #$0003, R0                      ; 5724   03B8 0003
        BEQ     L_55F6                          ; 5726   0224 0131

        MVI     .PSG0.rgt_hand,R0               ; 5728   0280 01FE
        COMR    R0                              ; 572A   0018
        MVO     R0,     G_0124                  ; 572B   0240 0124
        MVI     .PSG0.lft_hand,R0               ; 572D   0280 01FF
        COMR    R0                              ; 572F   0018
        MVO     R0,     G_0123                  ; 5730   0240 0123
        MOVR    R5,     R7                      ; 5732   00AF

        PSHR    R5                              ; 5733   0275

        JSR     R5,     L_5254                  ; 5734   0004 0150 0254
        JSR     R5,     L_548F                  ; 5737   0004 0154 008F
        JSR     R5,     L_5597                  ; 573A   0004 0154 0197
        DECLE   $0002                           ; 573D   0002

        JSR     R5,     L_55D6                  ; 573E   0004 0154 01D6
        DECLE   $0000                           ; 5741   0000

        MVII    #$0171, R4                      ; 5742   02BC 0171
        MVII    #$000B, R0                      ; 5744   02B8 000B

        JSR     R5,     X_FILL_ZERO             ; 5746   0004 0114 0338

L_5749:
        PULR    R7                              ; 5749   02B7

L_574A:
        MVII    #$0004, R0                      ; 574A   02B8 0004
        J       X_FILL_ZERO                     ; 574C   0004 0314 0338

L_574F:
        CLRR    R0                              ; 574F   01C0
        MVO@    R0,     R4                      ; 5750   0260
        MOVR    R5,     R7                      ; 5751   00AF

        MOVR    R1,     R3                      ; 5752   008B
        TSTR    R0                              ; 5753   0080
        BEQ     L_586E                          ; 5754   0204 0118

        MVI     G_016A, R2                      ; 5756   0282 016A
        CMPI    #$0003, R2                      ; 5758   037A 0003
        BEQ     L_57D5                          ; 575A   0204 0079

        MVI     G_0171, R2                      ; 575C   0282 0171
        XOR     G_016B, R1                      ; 575E   03C1 016B
        BEQ     L_5780                          ; 5760   0204 001E

        ANDI    #$0001, R2                      ; 5762   03BA 0001
        BNEQ    L_57D5                          ; 5764   020C 006F

        MVII    #$0172, R4                      ; 5766   02BC 0172
        CMPI    #$000A, R0                      ; 5768   0378 000A
        BEQ     L_574A                          ; 576A   0224 0021

        PSHR    R5                              ; 576C   0275
        MVI     G_0172, R1                      ; 576D   0281 0172
        ADDR    R7,     R1                      ; 576F   00F9
        ADDI    #$003A, R1                      ; 5770   02F9 003A
        MVI@    R1,     R1                      ; 5772   0289

        JSR     R5,     L_57B6                  ; 5773   0004 0154 03B6

        MVI     G_0171, R5                      ; 5776   0285 0171
        XORI    #$0001, R5                      ; 5778   03FD 0001
        MVO     R5,     G_0171                  ; 577A   0245 0171

        JSR     R5,     L_57D8                  ; 577C   0004 0154 03D8

        PULR    R7                              ; 577F   02B7

L_5780:
        ANDI    #$0002, R2                      ; 5780   03BA 0002
        BNEQ    L_57D5                          ; 5782   020C 0051

        MVII    #$0176, R4                      ; 5784   02BC 0176
        CMPI    #$000A, R0                      ; 5786   0378 000A
        BEQ     L_574F                          ; 5788   0224 003A

        PSHR    R5                              ; 578A   0275
        CLRR    R1                              ; 578B   01C9
        MVII    #$0002, R2                      ; 578C   02BA 0002

        JSR     R5,     L_57B7                  ; 578E   0004 0154 03B7

        DECR    R4                              ; 5791   0014
        MVI@    R4,     R0                      ; 5792   02A0
        MVO@    R0,     R4                      ; 5793   0260
        MVI     G_0171, R5                      ; 5794   0285 0171
        ANDI    #$00F5, R5                      ; 5796   03BD 00F5
        XORI    #$0002, R5                      ; 5798   03FD 0002
        MVO     R5,     G_0171                  ; 579A   0245 0171

        JSR     R5,     L_57D8                  ; 579C   0004 0154 03D8
        JSR     R5,     L_5834                  ; 579F   0004 0158 0034

        MVII    #$0004, R0                      ; 57A2   02B8 0004

        JSR     R5,     L_5C9D                  ; 57A4   0004 015C 009D
        BIDECLE $5863                           ; 57A7   0063 0058

        PULR    R7                              ; 57A9   02B7

        DECLE   $0000,  $0001,  $0000,  $0003   ; 57AA   0000 0001 0000 0003
        DECLE   $0006,  $0003,  $0000,  $0009   ; 57AE   0006 0003 0000 0009
        DECLE   $0000,  $0002,  $0000           ; 57B2   0000 0002 0000

        INCR    R1                              ; 57B5   0009
L_57B6:
        CLRR    R2                              ; 57B6   01D2
L_57B7:
        PSHR    R5                              ; 57B7   0275
        MOVR    R7,     R5                      ; 57B8   00BD
        SUBI    #$000B, R5                      ; 57B9   033D 000B
        ADDR    R2,     R5                      ; 57BB   00D5
L_57BC:
        MVI@    R4,     R2                      ; 57BC   02A2
        TSTR    R2                              ; 57BD   0092
        BNEQ    L_57CA                          ; 57BE   020C 000A

        SUB@    R5,     R0                      ; 57C0   0328
        BLE     L_57D3                          ; 57C1   0206 0010

        CMP@    R5,     R0                      ; 57C3   0368
        BGT     L_57D3                          ; 57C4   020E 000D

        DECR    R4                              ; 57C6   0014
        MVO@    R0,     R4                      ; 57C7   0260
        DECR    R6                              ; 57C8   0016
        PULR    R7                              ; 57C9   02B7

L_57CA:
        ADDI    #$0002, R5                      ; 57CA   02FD 0002
        DECR    R1                              ; 57CC   0011
        BPL     L_57BC                          ; 57CD   0223 0012

        CMPI    #$000B, R0                      ; 57CF   0378 000B
        BEQ     L_5749                          ; 57D1   0224 0089

L_57D3:
        DECR    R6                              ; 57D3   0016
        PULR    R5                              ; 57D4   02B5
L_57D5:
        J       X_PLAY_RAZZ2                    ; 57D5   0004 031C 02BD

L_57D8:
        MVI     G_016A, R2                      ; 57D8   0282 016A
        CMPI    #$0004, R2                      ; 57DA   037A 0004
        BEQ     L_586E                          ; 57DC   0204 0090

        JSR     R5,     L_5FAB                  ; 57DE   0004 015C 03AB

        MVI     G_0171, R2                      ; 57E1   0282 0171
        MVI     G_0172, R4                      ; 57E3   0284 0172
        CMPI    #$0002, R4                      ; 57E5   037C 0002
        BEQ     L_5808                          ; 57E7   0204 001F

        XORI    #$0003, R2                      ; 57E9   03FA 0003
        ANDI    #$0003, R2                      ; 57EB   03BA 0003
        BNEQ    L_5749                          ; 57ED   022C 00A5

        JSR     R5,     L_582E                  ; 57EF   0004 0158 002E

        CLRR    R0                              ; 57F2   01C0

        JSR     R5,     L_5C9D                  ; 57F3   0004 015C 009D
        BIDECLE $5850                           ; 57F6   0050 0058

        JSR     R5,     L_5834                  ; 57F8   0004 0158 0034

        MVII    #$0004, R0                      ; 57FB   02B8 0004

        JSR     R5,     L_5CA4                  ; 57FD   0004 015C 00A4
L_5800:
        JSR     R5,     L_5597                  ; 5800   0004 0154 0197
        DECLE   $0003                           ; 5803   0003

        JSR     R5,     L_528F                  ; 5804   0004 0150 028F

        PULR    R7                              ; 5807   02B7

L_5808:
        ANDI    #$0001, R2                      ; 5808   03BA 0001
        BEQ     L_5749                          ; 580A   0224 00C2

        XORI    #$0002, R2                      ; 580C   03FA 0002
        MVO     R2,     G_0171                  ; 580E   0242 0171
        MVII    #$0028, R4                      ; 5810   02BC 0028
        MVII    #$0058, R3                      ; 5812   02BB 0058

        JSR     R5,     L_5C8E                  ; 5814   0004 015C 008E
        BIDECLE $586F                           ; 5817   006F 0058

        MVI     G_0197, R0                      ; 5819   0280 0197
        CMPI    #$005F, R0                      ; 581B   0378 005F
        BGE     L_5800                          ; 581D   022D 001E

        MVII    #$0030, R2                      ; 581F   02BA 0030

        JSR     R5,     L_5CEF                  ; 5821   0004 015C 00EF

        MVO     R2,     G_035C                  ; 5824   0242 035C
        MVII    #$000E, R0                      ; 5826   02B8 000E

        JSR     R5,     X_SET_BIT               ; 5828   0004 0114 02DB

        CMP@    R2,     R5                      ; 582B   0355
        B       L_5800                          ; 582C   0220 002D

L_582E:
        MVII    #$0000, R4                      ; 582E   02BC 0000
        MVI     G_0173, R3                      ; 5830   0283 0173
        B       L_5838                          ; 5832   0200 0004

L_5834:
        MVII    #$0030, R4                      ; 5834   02BC 0030
        MVI     G_0177, R3                      ; 5836   0283 0177
L_5838:
        PSHR    R5                              ; 5838   0275

        JSR     R5,     L_583F                  ; 5839   0004 0158 003F

        SLL     R3,     2                       ; 583C   004F
        ADDR    R3,     R4                      ; 583D   00DC
        PULR    R7                              ; 583E   02B7

L_583F:
        PSHR    R5                              ; 583F   0275

        JSR     R5,     L_5C85                  ; 5840   0004 015C 0085

        CLRR    R2                              ; 5843   01D2
        DECR    R3                              ; 5844   0013
        BEQ     L_584D                          ; 5845   0204 0006

        INCR    R3                              ; 5847   000B
        SARC    R3,     1                       ; 5848   007B
        SLL     R3,     1                       ; 5849   004B
        RLC     R2,     1                       ; 584A   0052
        SLL     R2,     1                       ; 584B   004A
        XORR    R2,     R0                      ; 584C   01D0
L_584D:
        MVO     R0,     G_0191                  ; 584D   0240 0191
        PULR    R7                              ; 584F   02B7

        PSHR    R5                              ; 5850   0275

        JSR     R5,     L_5597                  ; 5851   0004 0154 0197
        DECLE   $0004                           ; 5854   0004

        JSR     R5,     L_5863                  ; 5855   0004 0158 0063
        JSR     R5,     .EXEC.A61               ; 5858   0004 0118 0261

        DECR    R4                              ; 585B   0014
        MVI     G_0171, R0                      ; 585C   0280 0171
        XORI    #$0004, R0                      ; 585E   03F8 0004
        MVO     R0,     G_0171                  ; 5860   0240 0171
        PULR    R7                              ; 5862   02B7

L_5863:
        MVI     G_0171, R0                      ; 5863   0280 0171
        ANDI    #$00F5, R0                      ; 5865   03B8 00F5
        XORI    #$0008, R0                      ; 5867   03F8 0008
        MVO     R0,     G_0171                  ; 5869   0240 0171
        CLRR    R0                              ; 586B   01C0
        MVO     R0,     G_0176                  ; 586C   0240 0176
L_586E:
        MOVR    R5,     R7                      ; 586E   00AF

        MVII    #$000F, R0                      ; 586F   02B8 000F
        MVO     R0,     G_0171                  ; 5871   0240 0171
        MOVR    R5,     R7                      ; 5873   00AF

        DECR    R0                              ; 5874   0010
        BNEQ    L_586E                          ; 5875   022C 0008

        MVI     G_0181, R0                      ; 5877   0280 0181
        SARC    R0,     1                       ; 5879   0078
        BC      L_586E                          ; 587A   0221 000D

        ADDI    #$016D, R1                      ; 587C   02F9 016D
        MVI@    R1,     R2                      ; 587E   028A
        INCR    R2                              ; 587F   000A
        CMPI    #$0003, R2                      ; 5880   037A 0003
        BGT     L_586E                          ; 5882   022E 0015

        SETC                                    ; 5884   0007
        RLC     R0,     1                       ; 5885   0050
        MVO     R0,     G_0181                  ; 5886   0240 0181
        MVO@    R2,     R1                      ; 5888   024A
        MOVR    R5,     R7                      ; 5889   00AF

        PSHR    R5                              ; 588A   0275
        DECR    R0                              ; 588B   0010
        BNEQ    L_5A1E                          ; 588C   020C 0190

        XOR     G_016B, R1                      ; 588E   03C1 016B
        BEQ     L_5A1E                          ; 5890   0204 018C

        MVI     G_0171, R0                      ; 5892   0280 0171
        XORI    #$000C, R0                      ; 5894   03F8 000C
        ANDI    #$000C, R0                      ; 5896   03B8 000C
        BNEQ    L_5A1E                          ; 5898   020C 0184

        MVI     G_016C, R0                      ; 589A   0280 016C
        INCR    R0                              ; 589C   0008
        MVO     R0,     G_016C                  ; 589D   0240 016C

        JSR     R5,     L_5FBA                  ; 589F   0004 015C 03BA
        JSR     R5,     L_58D6                  ; 58A2   0004 0158 00D6
        JSR     R5,     L_5A50                  ; 58A5   0004 0158 0250
        JSR     R5,     L_5597                  ; 58A8   0004 0154 0197
        DECLE   $0006                           ; 58AB   0006

        MVII    #$0003, R0                      ; 58AC   02B8 0003
        MVO     R0,     G_0171                  ; 58AE   0240 0171
        CLRR    R0                              ; 58B0   01C0
        MVO     R0,     G_0181                  ; 58B1   0240 0181

        JSR     R5,     L_5334                  ; 58B3   0004 0150 0334

        CLRR    R0                              ; 58B6   01C0

        JSR     R5,     .EXEC.772               ; 58B7   0004 0114 0372

        SWAP    R2,     1                       ; 58BA   0042
        XORR    R3,     R2                      ; 58BB   01DA
        MVII    #$0034, R0                      ; 58BC   02B8 0034
        SWAP    R0,     1                       ; 58BE   0040
        MVO     R0,     G_0320                  ; 58BF   0240 0320
        MVII    #$001A, R0                      ; 58C1   02B8 001A

        JSR     R5,     L_511B                  ; 58C3   0004 0150 011B

        ADDI    #$0022, R0                      ; 58C6   02F8 0022
        SWAP    R0,     1                       ; 58C8   0040
        MVO     R0,     G_031F                  ; 58C9   0240 031F
        MVII    #$003C, R3                      ; 58CB   02BB 003C

        JSR     R5,     .EXEC.9A1               ; 58CD   0004 0118 01A1

        PULR    R7                              ; 58D0   02B7

L_58D1:
        PSHR    R5                              ; 58D1   0275

        JSR     R5,     L_55B7                  ; 58D2   0004 0154 01B7

        INCR    R7                              ; 58D5   000F

L_58D6:
        PSHR    R5                              ; 58D6   0275

L_58D7:
        JSR     R4,     L_58E6                  ; 58D7   0004 0058 00E6
        DECLE   $0000                           ; 58DA   0000
        BIDECLE $5F9F                           ; 58DB   009F 005F
        DECLE   $0003,  $0090,  $005F,  $0000   ; 58DD   0003 0090 005F 0000

        MOVR    R3,     R7                      ; 58E1   009F

        SLLC    R3,     2                       ; 58E2   005F
        DIS                                     ; 58E3   0003
        RRC     R1,     2                       ; 58E4   0075
        SLLC    R3,     2                       ; 58E5   005F
L_58E6:
        MVII    #$031E, R1                      ; 58E6   02B9 031E
        MVII    #$0004, R0                      ; 58E8   02B8 0004
        MVI     G_0179, R3                      ; 58EA   0283 0179
L_58EC:
        MVI@    R4,     R5                      ; 58EC   02A5
        SDBD                                    ; 58ED   0001
        MVI@    R4,     R2                      ; 58EE   02A2
L_58EF:
        SARC    R3,     1                       ; 58EF   007B
        BC      L_58F8                          ; 58F0   0201 0006

        MVO@    R2,     R1                      ; 58F2   024A
        ADDI    #$0005, R1                      ; 58F3   02F9 0005
        MVO@    R5,     R1                      ; 58F5   024D
        SUBI    #$0005, R1                      ; 58F6   0339 0005
L_58F8:
        ADDI    #$0008, R1                      ; 58F8   02F9 0008
        SUBI    #$0001, R5                      ; 58FA   033D 0001
        BGT     L_58EF                          ; 58FC   022E 000E

        DECR    R0                              ; 58FE   0010
        BNEQ    L_58EC                          ; 58FF   022C 0014
        PULR    R7                              ; 5901   02B7

L_5902:
        PSHR    R5                              ; 5902   0275
        MVI     G_0182, R5                      ; 5903   0285 0182
        ANDI    #$0004, R5                      ; 5905   03BD 0004
        BEQ     L_5A1E                          ; 5907   0204 0115

        JSR     R5,     L_56D0                  ; 5909   0004 0154 02D0

        SARC    R2,     2                       ; 590C   007E
        BOV     L_59AB                          ; 590D   0202 009C

        SARC    R2,     2                       ; 590F   007E
        BNOV    L_598D                          ; 5910   020A 007B
        BEQ     L_591E                          ; 5912   0204 000A

        JSR     R5,     L_59FF                  ; 5914   0004 0158 01FF
        JSR     R5,     L_5923                  ; 5917   0004 0158 0123
        JSR     R5,     L_5719                  ; 591A   0004 0154 0319

        PULR    R7                              ; 591D   02B7
L_591E:
        BNC     L_5A1E                          ; 591E   0209 00FE

        MVO     R2,     G_0178                  ; 5920   0242 0178
        PULR    R7                              ; 5922   02B7

L_5923:
        PSHR    R5                              ; 5923   0275

        JSR     R5,     L_56D0                  ; 5924   0004 0154 02D0

        MVO     R4,     G_017F                  ; 5927   0244 017F
        SARC    R2,     2                       ; 5929   007E
        BOV     L_59B0                          ; 592A   0202 0084

        SARC    R2,     1                       ; 592C   007A
        BNC     L_5990                          ; 592D   0209 0061
        INCR    R7                              ; 592F   000F

L_5930:
        PSHR    R5                              ; 5930   0275

L_5931:
        JSR     R5,     L_5459                  ; 5931   0004 0154 0059
        JSR     R5,     X_PLAY_WHST1            ; 5934   0004 011C 031B
        JSR     R5,     .EXEC.A61               ; 5937   0004 0118 0261

        DECR    R4                              ; 593A   0014
        INCR    R7                              ; 593B   000F

L_593C:
        PSHR    R5                              ; 593C   0275
L_593D:
        MVI     G_016C, R3                      ; 593D   0283 016C
        TSTR    R3                              ; 593F   009B
        BEQ     L_594F                          ; 5940   0204 000D

        JSR     R5,     L_597C                  ; 5942   0004 0158 017C

        CMPR    R0,     R1                      ; 5945   0141
        BGT     L_594F                          ; 5946   020E 0007

        CMPI    #$0004, R3                      ; 5948   037B 0004
        BLT     L_595C                          ; 594A   0205 0010

L_594C:
        JSR     R5,     L_58D1                  ; 594C   0004 0158 00D1

L_594F:
        CLRR    R3                              ; 594F   01DB
        MVO     R3,     G_016C                  ; 5950   0243 016C

        JSR     R5,     L_5719                  ; 5952   0004 0154 0319
        JSR     R5,     L_5459                  ; 5955   0004 0154 0059

        MVI     G_017F, R0                      ; 5958   0280 017F
        MVO     R0,     G_0185                  ; 595A   0240 0185

L_595C:
        JSR     R5,     L_597C                  ; 595C   0004 0158 017C

        CMPI    #$0064, R0                      ; 595F   0378 0064
        BLT     L_5965                          ; 5961   0205 0002

        COMR    R0                              ; 5963   0018
        INCR    R7                              ; 5964   000F

L_5965:
        SUBR    R1,     R0                      ; 5965   0108
L_5966:
        MVO     R0,     G_0180                  ; 5966   0240 0180

        JSR     R5,     L_5597                  ; 5968   0004 0154 0197
        DECLE   $0000                           ; 596B   0000

        MVI     G_0181, R0                      ; 596C   0280 0181
        ANDI    #$0002, R0                      ; 596E   03B8 0002
        BNEQ    L_5978                          ; 5970   020C 0006

        JSR     R5,     L_521C                  ; 5972   0004 0150 021C
        BIDECLE $50B7                           ; 5975   00B7 0050

        PULR    R7                              ; 5977   02B7

L_5978:
        JSR     R5,     L_50CC                  ; 5978   0004 0150 00CC

        PULR    R7                              ; 597B   02B7

L_597C:
        PSHR    R5                              ; 597C   0275
        MVI     G_017F, R0                      ; 597D   0280 017F

        JSR     R5,     L_511B                  ; 597F   0004 0150 011B

        MOVR    R0,     R1                      ; 5982   0081
        MVO     R0,     G_0197                  ; 5983   0240 0197
        MVI     G_0185, R0                      ; 5985   0280 0185

        JSR     R5,     L_511B                  ; 5987   0004 0150 011B

        ADDI    #$000A, R0                      ; 598A   02F8 000A
        PULR    R7                              ; 598C   02B7

L_598D:
        JSR     R5,     L_59FF                  ; 598D   0004 0158 01FF
L_5990:
        JSR     R5,     X_PLAY_WHST1            ; 5990   0004 011C 031B

        MVI     G_0178, R0                      ; 5993   0280 0178
        TSTR    R0                              ; 5995   0080
        BNEQ    L_59F2                          ; 5996   020C 005A

        MVII    #$017D, R1                      ; 5998   02B9 017D
        SUB     G_016B, R1                      ; 599A   0301 016B
        MVII    #$0002, R0                      ; 599C   02B8 0002

        JSR     R4,     L_59CC                  ; 599E   0004 0058 01CC
        DECLE   $0020,  $0020,  $0020,  $0053   ; 59A1   0020 0020 0020 0053
        DECLE   $0041,  $0046,  $0045,  $0054   ; 59A5   0041 0046 0045 0054
        DECLE   $0059,  $0000                   ; 59A9   0059 0000
L_59AB:
        MVII    #$0329, R4                      ; 59AB   02BC 0329

        JSR     R5,     L_5A01                  ; 59AD   0004 0158 0201
L_59B0:
        JSR     R4,     L_59C0                  ; 59B0   0004 0058 01C0
        DECLE   $0007,  $0054,  $004F,  $0055   ; 59B3   0007 0054 004F 0055
        DECLE   $0043,  $0048,  $0044,  $004F   ; 59B7   0043 0048 0044 004F
        DECLE   $0057,  $004E,  $0020,  $0021   ; 59BB   0057 004E 0020 0021
        DECLE   $0000                           ; 59BF   0000
L_59C0:
        PSHR    R4                              ; 59C0   0274
        MVII    #$0005, R0                      ; 59C1   02B8 0005

        JSR     R5,     X_PLAY_CHEER1           ; 59C3   0004 011C 02D5

        MVII    #$017C, R1                      ; 59C6   02B9 017C
        ADD     G_016B, R1                      ; 59C8   02C1 016B
        PULR    R4                              ; 59CA   02B4
        MVI@    R4,     R0                      ; 59CB   02A0
L_59CC:
        MVI@    R1,     R2                      ; 59CC   028A
        ADDR    R0,     R2                      ; 59CD   00C2
        MVO@    R2,     R1                      ; 59CE   024A
        MOVR    R4,     R1                      ; 59CF   00A1
        MVII    #$0010, R0                      ; 59D0   02B8 0010
        MVII    #$0007, R3                      ; 59D2   02BB 0007
        MVII    #$02E0, R4                      ; 59D4   02BC 02E0

        JSR     R5,     X_PRPAD_R1              ; 59D6   0004 0118 006C
        JSR     R5,     L_5597                  ; 59D9   0004 0154 0197
        DECLE   $0009                           ; 59DC   0009

        JSR     R5,     .EXEC.A61               ; 59DD   0004 0118 0261

        COMR    R6                              ; 59E0   001E

        JSR     R5,     L_59FF                  ; 59E1   0004 0158 01FF

        MVII    #$000A, R0                      ; 59E4   02B8 000A

        JSR     R5,     X_PLAY_CHEER1           ; 59E6   0004 011C 02D5

        MVII    #$0050, R0                      ; 59E9   02B8 0050

        JSR     R5,     L_511B                  ; 59EB   0004 0150 011B

        MVO     R0,     G_017F                  ; 59EE   0240 017F
        B       L_594C                          ; 59F0   0220 00A5

L_59F2:
        JSR     R5,     .EXEC.A61               ; 59F2   0004 0118 0261

        INCR    R2                              ; 59F5   000A
        MVII    #$0014, R0                      ; 59F6   02B8 0014

        JSR     R5,     L_511B                  ; 59F8   0004 0150 011B

        MVO     R0,     G_017F                  ; 59FB   0240 017F
        B       L_594F                          ; 59FD   0220 00AF

L_59FF:
        MVII    #$0321, R4                      ; 59FF   02BC 0321
L_5A01:
        PSHR    R5                              ; 5A01   0275
        MVII    #$0008, R2                      ; 5A02   02BA 0008
        CLRR    R0                              ; 5A04   01C0
        MVI     G_0179, R3                      ; 5A05   0283 0179
L_5A07:
        MVO@    R0,     R4                      ; 5A07   0260
        SARC    R3,     1                       ; 5A08   007B
        BNC     L_5A0D                          ; 5A09   0209 0002

        MVO@    R0,     R4                      ; 5A0B   0260
        INCR    R7                              ; 5A0C   000F

L_5A0D:
        MVO@    R2,     R4                      ; 5A0D   0262
L_5A0E:
        MVO@    R0,     R4                      ; 5A0E   0260
        ADDI    #$0005, R4                      ; 5A0F   02FC 0005
        CMPI    #$035D, R4                      ; 5A11   037C 035D
        BLT     L_5A07                          ; 5A13   0225 000D

        MVO     R3,     G_0160                  ; 5A15   0243 0160

        JSR     R5,     L_5597                  ; 5A17   0004 0154 0197
        DECLE   $0000                           ; 5A1A   0000

        JSR     R5,     L_55F0                  ; 5A1B   0004 0154 01F0

L_5A1E:
        PULR    R7                              ; 5A1E   02B7

        PSHR    R5                              ; 5A1F   0275
        MVI     G_017A, R0                      ; 5A20   0280 017A
        DECR    R0                              ; 5A22   0010
        BMI     L_5A3A                          ; 5A23   020B 0015
        BNEQ    L_5A8C                          ; 5A25   020C 0065

        JSR     R5,     L_52EB                  ; 5A27   0004 0150 02EB

        MVII    #$0001, R0                      ; 5A2A   02B8 0001
        MVO     R0,     G_035B                  ; 5A2C   0240 035B
        MVII    #$0007, R0                      ; 5A2E   02B8 0007
        MVII    #$0004, R3                      ; 5A30   02BB 0004

        JSR     R5,     L_5AFE                  ; 5A32   0004 0158 02FE
        JSR     R5,     L_56D1                  ; 5A35   0004 0154 02D1

        B       L_5B6C                          ; 5A38   0200 0132

L_5A3A:
        CLRR    R0                              ; 5A3A   01C0

        JSR     R5,     L_52EB                  ; 5A3B   0004 0150 02EB
        JSR     R5,     L_55D6                  ; 5A3E   0004 0154 01D6

        INCR    R2                              ; 5A41   000A
        MVII    #$0005, R0                      ; 5A42   02B8 0005
        MVI     G_0172, R5                      ; 5A44   0285 0172
        CMPI    #$0002, R5                      ; 5A46   037D 0002
        BNEQ    L_5A4C                          ; 5A48   020C 0002

        MVII    #$000B, R0                      ; 5A4A   02B8 000B

L_5A4C:
        JSR     R5,     L_5598                  ; 5A4C   0004 0154 0198

        PULR    R7                              ; 5A4F   02B7

L_5A50:
        PSHR    R5                              ; 5A50   0275
        MVI     G_0172, R1                      ; 5A51   0281 0172
        ADDR    R7,     R1                      ; 5A53   00F9
        ADD@    R1,     R7                      ; 5A54   02CF

        MOVR    R5,     R0                      ; 5A55   00A8
        DIS                                     ; 5A56   0003
        SETC                                    ; 5A57   0007
        CLRR    R0                              ; 5A58   01C0
        MVO     R0,     G_035B                  ; 5A59   0240 035B
        PULR    R7                              ; 5A5B   02B7

        JSR     R5,     L_5A6D                  ; 5A5C   0004 0158 026D

        MVI     G_0174, R0                      ; 5A5F   0280 0174
        MVII    #$001B, R3                      ; 5A61   02BB 001B

        JSR     R5,     .EXEC.9B9               ; 5A63   0004 0118 01B9

        INCR    R1                              ; 5A66   0009
        SDBD                                    ; 5A67   0001
        MVII    #$5F9F, R0                      ; 5A68   02B8 009F 005F
        MVO@    R0,     R1                      ; 5A6B   0248
        PULR    R7                              ; 5A6C   02B7

L_5A6D:
        PSHR    R5                              ; 5A6D   0275
        MVI     G_0175, R3                      ; 5A6E   0283 0175

        JSR     R5,     L_583F                  ; 5A70   0004 0158 003F

        MOVR    R3,     R4                      ; 5A73   009C
        ADDR    R7,     R4                      ; 5A74   00FC
        ADDI    #$0006, R4                      ; 5A75   02FC 0006

        JSR     R5,     L_5CED                  ; 5A77   0004 015C 00ED

        PULR    R7                              ; 5A7A   02B7

        GSWD    R0                              ; 5A7B   0030
        SLLC    R0,     2                       ; 5A7C   005C
        INCR    R4                              ; 5A7D   000C
        RRC     R0,     2                       ; 5A7E   0074
        COMR    R0                              ; 5A7F   0018
        SLL     R0,     2                       ; 5A80   004C
        INCR    R4                              ; 5A81   000C
        ADCR    R4                              ; 5A82   002C
        NEGR    R4                              ; 5A83   0024
        COMR    R4                              ; 5A84   001C
        CLRR    R3                              ; 5A85   01DB
        ADDI    #$0004, R1                      ; 5A86   02F9 0004
        MVO@    R3,     R1                      ; 5A88   024B
        J       .EXEC.98D                       ; 5A89   0004 0318 018D

L_5A8C:
        MVII    #$0006, R0                      ; 5A8C   02B8 0006
        MVO     R0,     G_0323                  ; 5A8E   0240 0323
        MVII    #$000E, R0                      ; 5A90   02B8 000E

        JSR     R5,     X_CLR_BIT               ; 5A92   0004 0114 02E6

        CMP@    R2,     R5                      ; 5A95   0355
        MVII    #$0001, R0                      ; 5A96   02B8 0001
        MVO     R0,     G_017A                  ; 5A98   0240 017A
        PULR    R7                              ; 5A9A   02B7

        PSHR    R5                              ; 5A9B   0275

        JSR     R5,     L_52EB                  ; 5A9C   0004 0150 02EB

        MVI     G_016A, R5                      ; 5A9F   0285 016A
        CMPI    #$0008, R5                      ; 5AA1   037D 0008
        BNEQ    L_5AB7                          ; 5AA3   020C 0012

        JSR     R5,     L_59FF                  ; 5AA5   0004 0158 01FF
        JSR     R4,     L_59C0                  ; 5AA8   0004 0058 01C0
        DECLE   $0003,  $0046,  $0049,  $0045   ; 5AAB   0003 0046 0049 0045
        DECLE   $004C,  $0044,  $0020,  $0047   ; 5AAF   004C 0044 0020 0047
        DECLE   $004F,  $0041,  $004C,  $0000   ; 5AB3   004F 0041 004C 0000
L_5AB7:
        JSR     R5,     L_59FF                  ; 5AB7   0004 0158 01FF
        JSR     R5,     L_5930                  ; 5ABA   0004 0158 0130
        JSR     R5,     L_5719                  ; 5ABD   0004 0154 0319

        PULR    R7                              ; 5AC0   02B7

        PSHR    R5                              ; 5AC1   0275
        DECR    R0                              ; 5AC2   0010
        BNEQ    L_5AFD                          ; 5AC3   020C 0038

        XOR     G_016B, R1                      ; 5AC5   03C1 016B
        BEQ     L_5AFD                          ; 5AC7   0204 0034

        MVI     G_0172, R5                      ; 5AC9   0285 0172
        INCR    R5                              ; 5ACB   000D
        ADDR    R7,     R5                      ; 5ACC   00FD
        ADD@    R5,     R7                      ; 5ACD   02EF

        DECLE   $002F,  $002F,  $0048,  $0004   ; 5ACE   002F 002F 0048 0004

        CLRR    R0                              ; 5AD2   01C0

        JSR     R5,     L_52D8                  ; 5AD3   0004 0150 02D8
        JSR     R5,     L_511B                  ; 5AD6   0004 0150 011B

        CMP     G_0197, R0                      ; 5AD9   0340 0197
        BGT     L_5AFD                          ; 5ADB   020E 0020

        CLRR    R0                              ; 5ADD   01C0
        MVO     R0,     G_0172                  ; 5ADE   0240 0172
        MVI     G_0174, R3                      ; 5AE0   0283 0174

        JSR     R5,     L_5AFE                  ; 5AE2   0004 0158 02FE
        JSR     R5,     L_5A6D                  ; 5AE5   0004 0158 026D

        MVI     G_0174, R0                      ; 5AE8   0280 0174
        MVII    #$0037, R3                      ; 5AEA   02BB 0037
        MVO     R3,     G_017B                  ; 5AEC   0243 017B

        JSR     R5,     .EXEC.9BB               ; 5AEE   0004 0118 01BB

        MVI     G_0174, R0                      ; 5AF1   0280 0174

        JSR     R5,     L_5334                  ; 5AF3   0004 0150 0334
        JSR     R5,     L_5597                  ; 5AF6   0004 0154 0197
        DECLE   $0007                           ; 5AF9   0007

        JSR     R5,     L_5FEA                  ; 5AFA   0004 015C 03EA

L_5AFD:
        PULR    R7                              ; 5AFD   02B7

L_5AFE:
        PSHR    R5                              ; 5AFE   0275

        JSR     R5,     .EXEC.76C               ; 5AFF   0004 0114 036C

        MOVR    R3,     R0                      ; 5B02   0098
        MOVR    R1,     R3                      ; 5B03   008B

        JSR     R5,     .EXEC.76C               ; 5B04   0004 0114 036C

        ADDI    #$0002, R3                      ; 5B07   02FB 0002
        ADDI    #$0002, R1                      ; 5B09   02F9 0002

        JSR     R5,     L_5B11                  ; 5B0B   0004 0158 0311

        INCR    R1                              ; 5B0E   0009
        INCR    R3                              ; 5B0F   000B
        PULR    R5                              ; 5B10   02B5
L_5B11:
        MVI@    R1,     R2                      ; 5B11   028A
        MVI@    R3,     R4                      ; 5B12   029C
        MVO@    R4,     R1                      ; 5B13   024C
        MVO@    R2,     R3                      ; 5B14   025A
        MOVR    R5,     R7                      ; 5B15   00AF

        MVI     G_016A, R3                      ; 5B16   0283 016A
        SUBI    #$000B, R3                      ; 5B18   033B 000B
        BNEQ    L_5AFD                          ; 5B1A   022C 001E

        JSR     R5,     L_5FAB                  ; 5B1C   0004 015C 03AB
        JSR     R5,     L_5597                  ; 5B1F   0004 0154 0197
        DECLE   $0008                           ; 5B22   0008

        CLRR    R0                              ; 5B23   01C0

        JSR     R5,     L_5334                  ; 5B24   0004 0150 0334

        MVII    #$001E, R0                      ; 5B27   02B8 001E

        JSR     R5,     X_RAND2                 ; 5B29   0004 0114 029E

        MOVR    R0,     R1                      ; 5B2C   0081
        MVII    #$001E, R0                      ; 5B2D   02B8 001E

        JSR     R5,     X_RAND2                 ; 5B2F   0004 0114 029E

        ADDR    R1,     R0                      ; 5B32   00C8
        ADDI    #$000F, R0                      ; 5B33   02F8 000F
        MOVR    R0,     R1                      ; 5B35   0081
        ADD     G_0197, R0                      ; 5B36   02C0 0197
        SLL     R1,     1                       ; 5B38   0049
        CMPI    #$006E, R0                      ; 5B39   0378 006E
        BLT     L_5B44                          ; 5B3B   0205 0007

        NEGR    R1                              ; 5B3D   0021
        MVII    #$000E, R0                      ; 5B3E   02B8 000E

        JSR     R5,     X_CLR_BIT               ; 5B40   0004 0114 02E6

        CMP@    R2,     R5                      ; 5B43   0355
L_5B44:
        MVO     R1,     G_0323                  ; 5B44   0241 0323
        MVII    #$007F, R0                      ; 5B46   02B8 007F
        SWAP    R0,     1                       ; 5B48   0040

        JSR     R5,     L_55AF                  ; 5B49   0004 0154 01AF

        BC      L_5B4F                          ; 5B4C   0201 0001

        NEGR    R0                              ; 5B4E   0020
L_5B4F:
        MVO     R0,     G_0321                  ; 5B4F   0240 0321
        MVII    #$0002, R0                      ; 5B51   02B8 0002
        MVO     R0,     G_017A                  ; 5B53   0240 017A
        PULR    R7                              ; 5B55   02B7

        PSHR    R5                              ; 5B56   0275

        JSR     R5,     L_5B7E                  ; 5B57   0004 0158 037E
        JSR     R5,     L_5B8A                  ; 5B5A   0004 0158 038A
L_5B5D:
        JSR     R5,     L_5597                  ; 5B5D   0004 0154 0197
        DECLE   $0005                           ; 5B60   0005

        JSR     R5,     L_5FA8                  ; 5B61   0004 015C 03A8

        PULR    R7                              ; 5B64   02B7

        PSHR    R5                              ; 5B65   0275

        JSR     R5,     L_5B7E                  ; 5B66   0004 0158 037E
        JSR     R5,     L_5B8A                  ; 5B69   0004 0158 038A

L_5B6C:
        ANDI    #$000C, R2                      ; 5B6C   03BA 000C
        BEQ     L_5B73                          ; 5B6E   0204 0003

        INCR    R2                              ; 5B70   000A
        MVO     R2,     G_0178                  ; 5B71   0242 0178
L_5B73:
        CLRR    R0                              ; 5B73   01C0
        MVO     R0,     G_0179                  ; 5B74   0240 0179

        JSR     R5,     L_58D1                  ; 5B76   0004 0158 00D1

        CLRR    R0                              ; 5B79   01C0
        MVO     R0,     G_016C                  ; 5B7A   0240 016C
        B       L_5B5D                          ; 5B7C   0220 0020

L_5B7E:
        MVI     G_017B, R2                      ; 5B7E   0282 017B
        TSTR    R2                              ; 5B80   0092
        BNEQ    L_5AFD                          ; 5B81   022C 0085

        MVI     G_016A, R2                      ; 5B83   0282 016A
        CMPI    #$0007, R2                      ; 5B85   037A 0007
        BNEQ    L_5AFD                          ; 5B87   022C 008B
        MOVR    R5,     R7                      ; 5B89   00AF

L_5B8A:
        PSHR    R5                              ; 5B8A   0275
        PSHR    R3                              ; 5B8B   0273

        JSR     R5,     L_52EB                  ; 5B8C   0004 0150 02EB

        PULR    R0                              ; 5B8F   02B0

        JSR     R5,     L_56D1                  ; 5B90   0004 0154 02D1

        PULR    R5                              ; 5B93   02B5
        MOVR    R2,     R3                      ; 5B94   0093
        ANDI    #$0031, R3                      ; 5B95   03BB 0031
        BNEQ    L_5AB7                          ; 5B97   022C 00E1
        MOVR    R5,     R7                      ; 5B99   00AF

        PSHR    R5                              ; 5B9A   0275
        MVI     G_0182, R2                      ; 5B9B   0282 0182
        ANDI    #$0008, R2                      ; 5B9D   03BA 0008
        BEQ     L_5BB5                          ; 5B9F   0204 0014

        PSHR    R1                              ; 5BA1   0271
        CLRR    R0                              ; 5BA2   01C0
        MVI     G_016A, R2                      ; 5BA3   0282 016A
        CMPI    #$0007, R2                      ; 5BA5   037A 0007
        BNEQ    L_5BAA                          ; 5BA7   020C 0001

        INCR    R0                              ; 5BA9   0008

L_5BAA:
        JSR     R5,     .EXEC.772               ; 5BAA   0004 0114 0372

        SWAP    R2,     1                       ; 5BAD   0042
        XORR    R3,     R2                      ; 5BAE   01DA
        MVII    #$001B, R3                      ; 5BAF   02BB 001B
        PULR    R1                              ; 5BB1   02B1

        JSR     R5,     .EXEC.9A3               ; 5BB2   0004 0118 01A3

L_5BB5:
        ADDI    #$0006, R1                      ; 5BB5   02F9 0006
L_5BB7:
        MVII    #$0004, R0                      ; 5BB7   02B8 0004
        MVO@    R0,     R1                      ; 5BB9   0248
        PULR    R7                              ; 5BBA   02B7

        PSHR    R5                              ; 5BBB   0275
        MVI     G_0182, R2                      ; 5BBC   0282 0182
        ANDI    #$0008, R2                      ; 5BBE   03BA 0008
        BEQ     L_5BB5                          ; 5BC0   0224 000C

        NEGR    R2                              ; 5BC2   0022
        MVII    #$0004, R0                      ; 5BC3   02B8 0004
        MOVR    R1,     R4                      ; 5BC5   008C
        ADDI    #$0002, R4                      ; 5BC6   02FC 0002
        PSHR    R1                              ; 5BC8   0271
        PSHR    R2                              ; 5BC9   0272
L_5BCA:
        PSHR    R4                              ; 5BCA   0274
        PSHR    R2                              ; 5BCB   0272
        PSHR    R0                              ; 5BCC   0270

        JSR     R5,     .EXEC.772               ; 5BCD   0004 0114 0372
        JSR     R5,     X_POW2                  ; 5BD0   0004 0114 0345

        AND     G_0179, R0                      ; 5BD3   0380 0179
        NEGR    R0                              ; 5BD5   0020
        BNEQ    L_5BDC                          ; 5BD6   020C 0004

        JSR     R5,     .EXEC.784               ; 5BD8   0004 0114 0384

        MOVR    R2,     R5                      ; 5BDB   0095
L_5BDC:
        PULR    R0                              ; 5BDC   02B0
        PULR    R2                              ; 5BDD   02B2
        PULR    R4                              ; 5BDE   02B4
        BMI     L_5BE7                          ; 5BDF   020B 0006

        CMPR    R2,     R5                      ; 5BE1   0155
        BC      L_5BE7                          ; 5BE2   0201 0003

        MOVR    R5,     R2                      ; 5BE4   00AA
        PULR    R5                              ; 5BE5   02B5
        PSHR    R0                              ; 5BE6   0270
L_5BE7:
        INCR    R0                              ; 5BE7   0008
        CMPI    #$0007, R0                      ; 5BE8   0378 0007
        BLE     L_5BCA                          ; 5BEA   0226 0021

        PULR    R0                              ; 5BEC   02B0
        TSTR    R0                              ; 5BED   0080
        BPL     L_5BAA                          ; 5BEE   0223 0045

        PULR    R1                              ; 5BF0   02B1
        ADDI    #$0004, R1                      ; 5BF1   02F9 0004
        CLRR    R0                              ; 5BF3   01C0
        MVO@    R0,     R1                      ; 5BF4   0248
        INCR    R1                              ; 5BF5   0009
        B       L_5BB7                          ; 5BF6   0220 0040

        PSHR    R5                              ; 5BF8   0275
        MVI     G_0182, R5                      ; 5BF9   0285 0182
        ANDI    #$0008, R5                      ; 5BFB   03BD 0008
        BEQ     L_5C33                          ; 5BFD   0204 0034

        SDBD                                    ; 5BFF   0001
        MVII    #$0403, R4                      ; 5C00   02BC 0003 0004

        JSR     R5,     .EXEC.70F               ; 5C03   0004 0114 030F

        BNC     L_5C33                          ; 5C06   0209 002B

        JSR     R5,     .EXEC.766               ; 5C08   0004 0114 0366

        PSHR    R3                              ; 5C0B   0273

        JSR     R5,     L_5C14                  ; 5C0C   0004 015C 0014

        PULR    R0                              ; 5C0F   02B0

        JSR     R5,     .EXEC.76C               ; 5C10   0004 0114 036C

        INCR    R7                              ; 5C13   000F

L_5C14:
        PSHR    R5                              ; 5C14   0275

L_5C15:
        JSR     R5,     X_CLR_BIT               ; 5C15   0004 0114 02E6

        CMPR    R7,     R1                      ; 5C18   0179
        INCR    R1                              ; 5C19   0009
        SDBD                                    ; 5C1A   0001
        MVII    #$5F89, R5                      ; 5C1B   02BD 0089 005F
        MVO@    R5,     R1                      ; 5C1E   024D
        ADDI    #$0003, R1                      ; 5C1F   02F9 0003
        CLRR    R5                              ; 5C21   01ED
        MVO@    R5,     R1                      ; 5C22   024D
        INCR    R1                              ; 5C23   0009
        MVO@    R5,     R1                      ; 5C24   024D
        INCR    R1                              ; 5C25   0009
        MOVR    R0,     R2                      ; 5C26   0082
        MVII    #$0006, R0                      ; 5C27   02B8 0006
        CMPI    #$0004, R2                      ; 5C29   037A 0004
        BNEQ    L_5C2E                          ; 5C2B   020C 0001

        DECR    R0                              ; 5C2D   0010

L_5C2E:
        JSR     R5,     X_RAND1                 ; 5C2E   0004 0114 027D

        INCR    R0                              ; 5C31   0008
        MVO@    R0,     R1                      ; 5C32   0248
L_5C33:
        PULR    R7                              ; 5C33   02B7

        PSHR    R5                              ; 5C34   0275
        SDBD                                    ; 5C35   0001
        MVII    #$5F75, R5                      ; 5C36   02BD 0075 005F
        CMPI    #$0004, R0                      ; 5C39   0378 0004
        BEQ     L_5C45                          ; 5C3B   0204 0008
        BGT     L_5C49                          ; 5C3D   020E 000A

        SDBD                                    ; 5C3F   0001
        MVII    #$5F90, R5                      ; 5C40   02BD 0090 005F
        B       L_5C49                          ; 5C43   0200 0004

L_5C45:
        SDBD                                    ; 5C45   0001
        MVII    #$5F9F, R5                      ; 5C46   02BD 009F 005F
L_5C49:
        INCR    R1                              ; 5C49   0009
        MVO@    R5,     R1                      ; 5C4A   024D

        JSR     R5,     X_SET_BIT               ; 5C4B   0004 0114 02DB

        CMPR    R7,     R1                      ; 5C4E   0179
        ADDI    #$0005, R1                      ; 5C4F   02F9 0005
        ANDI    #$0003, R0                      ; 5C51   03B8 0003
        MVO@    R0,     R1                      ; 5C53   0248
        PULR    R7                              ; 5C54   02B7

        PSHR    R5                              ; 5C55   0275
        MVI     G_0182, R5                      ; 5C56   0285 0182
        ANDI    #$0004, R5                      ; 5C58   03BD 0004
        BEQ     L_5C33                          ; 5C5A   0224 0028

        CMPI    #$0003, R0                      ; 5C5C   0378 0003
        BLE     L_5C33                          ; 5C5E   0226 002C

        MVI     G_017B, R5                      ; 5C60   0285 017B
        TSTR    R5                              ; 5C62   00AD
        BNEQ    L_5C33                          ; 5C63   022C 0031

        SDBD                                    ; 5C65   0001
        MVII    #$0403, R4                      ; 5C66   02BC 0003 0004

        JSR     R5,     .EXEC.70F               ; 5C69   0004 0114 030F

        BNC     L_5C33                          ; 5C6C   0229 003A

        JSR     R5,     L_59FF                  ; 5C6E   0004 0158 01FF

        MVII    #$000D, R0                      ; 5C71   02B8 000D
        ADDI    #$0005, R1                      ; 5C73   02F9 0005
        MVO@    R0,     R1                      ; 5C75   0248
        MVII    #$000B, R0                      ; 5C76   02B8 000B
        MVO     R0,     G_0322                  ; 5C78   0240 0322

        JSR     R5,     L_5923                  ; 5C7A   0004 0158 0123

        PULR    R7                              ; 5C7D   02B7

        DECLE   $0000,  $0000,  $0005,  $005D   ; 5C7E   0000 0000 0005 005D
        DECLE   $0008,  $0000,  $0000           ; 5C82   0008 0000 0000
L_5C85:
        MVI     G_017E, R0                      ; 5C85   0280 017E
        ANDI    #$0001, R0                      ; 5C87   03B8 0001
        XOR     G_016B, R0                      ; 5C89   03C0 016B
        MVO     R0,     G_0191                  ; 5C8B   0240 0191
        MOVR    R5,     R7                      ; 5C8D   00AF

L_5C8E:
        SDBD                                    ; 5C8E   0001
        MVI@    R5,     R1                      ; 5C8F   02A9
        PSHR    R5                              ; 5C90   0275
        PSHR    R3                              ; 5C91   0273
        CLRR    R0                              ; 5C92   01C0
        MVO     R0,     G_0190                  ; 5C93   0240 0190

        JSR     R5,     L_5C9F                  ; 5C95   0004 015C 009F

        PULR    R4                              ; 5C98   02B4
        MVII    #$0004, R0                      ; 5C99   02B8 0004
        B       L_5CA5                          ; 5C9B   0200 0008

L_5C9D:
        SDBD                                    ; 5C9D   0001
        MVI@    R5,     R1                      ; 5C9E   02A9
L_5C9F:
        MVO     R1,     G_0186                  ; 5C9F   0241 0186
        SWAP    R1,     1                       ; 5CA1   0041
        MVO     R1,     G_0187                  ; 5CA2   0241 0187
L_5CA4:
        PSHR    R5                              ; 5CA4   0275
L_5CA5:
        CLRR    R5                              ; 5CA5   01ED
        MVO     R5,     G_0179                  ; 5CA6   0245 0179
        ADDR    R7,     R4                      ; 5CA8   00FC
        ADDI    #$0097, R4                      ; 5CA9   02FC 0097
L_5CAB:
        MVI@    R4,     R2                      ; 5CAB   02A2
        SWAP    R2,     1                       ; 5CAC   0042
        ANDI    #$0003, R2                      ; 5CAD   03BA 0003
        MVI@    R4,     R3                      ; 5CAF   02A3
        SWAP    R3,     1                       ; 5CB0   0043
        RRC     R3,     2                       ; 5CB1   0077
        RLC     R2,     2                       ; 5CB2   0056
        MVI     G_0191, R3                      ; 5CB3   0283 0191
        ANDI    #$0001, R3                      ; 5CB5   03BB 0001
        SLL     R3,     1                       ; 5CB7   004B
        XORR    R3,     R2                      ; 5CB8   01DA
        MOVR    R0,     R5                      ; 5CB9   0085
        ADDI    #$0188, R5                      ; 5CBA   02FD 0188
        MVO@    R2,     R5                      ; 5CBC   026A
        SUBI    #$0002, R4                      ; 5CBD   033C 0002

        JSR     R5,     L_5CED                  ; 5CBF   0004 015C 00ED

        MVII    #$001E, R3                      ; 5CC2   02BB 001E

        JSR     R5,     .EXEC.9AD               ; 5CC4   0004 0118 01AD

        PSHR    R0                              ; 5CC7   0270
        PSHR    R1                              ; 5CC8   0271
        MVII    #$000E, R0                      ; 5CC9   02B8 000E

        JSR     R5,     .EXEC.6E9               ; 5CCB   0004 0114 02E9

        INCR    R1                              ; 5CCE   0009
        MOVR    R7,     R5                      ; 5CCF   00BD
        SUBI    #$0052, R5                      ; 5CD0   033D 0052
        MVO@    R5,     R1                      ; 5CD2   024D
        ADDI    #$0004, R1                      ; 5CD3   02F9 0004
        MVI@    R1,     R5                      ; 5CD5   028D
        ANDI    #$000F, R5                      ; 5CD6   03BD 000F
        CMPI    #$000B, R5                      ; 5CD8   037D 000B
        BGE     L_5CDD                          ; 5CDA   020D 0001

        CLRR    R5                              ; 5CDC   01ED
L_5CDD:
        XORI    #$03E0, R5                      ; 5CDD   03FD 03E0
        MVO@    R5,     R1                      ; 5CDF   024D
        INCR    R0                              ; 5CE0   0008
        MOVR    R0,     R5                      ; 5CE1   0085
        ANDI    #$0003, R5                      ; 5CE2   03BD 0003
        BNEQ    L_5CAB                          ; 5CE4   022C 003A

        MVI     G_0190, R0                      ; 5CE6   0280 0190
        ADDI    #$0004, R0                      ; 5CE8   02F8 0004
        MVO     R0,     G_0190                  ; 5CEA   0240 0190
L_5CEC:
        PULR    R7                              ; 5CEC   02B7

L_5CED:
        SDBD                                    ; 5CED   0001
        MVI@    R4,     R2                      ; 5CEE   02A2
L_5CEF:
        MVI     G_0191, R3                      ; 5CEF   0283 0191
        ANDI    #$0001, R3                      ; 5CF1   03BB 0001
        BEQ     L_5CFC                          ; 5CF3   0204 0007

        COMR    R2                              ; 5CF5   001A
        XORI    #$00FF, R2                      ; 5CF6   03FA 00FF
        SDBD                                    ; 5CF8   0001
        ADDI    #$A900, R2                      ; 5CF9   02FA 0000 00A9
L_5CFC:
        XOR     G_0191, R3                      ; 5CFC   03C3 0191
        BEQ     L_5D04                          ; 5CFE   0204 0004

        XORI    #$00FF, R2                      ; 5D00   03FA 00FF
        SUBI    #$009F, R2                      ; 5D02   033A 009F
L_5D04:
        MOVR    R5,     R7                      ; 5D04   00AF

        PSHR    R5                              ; 5D05   0275

        JSR     R5,     .EXEC.98D               ; 5D06   0004 0118 018D

        MOVR    R0,     R3                      ; 5D09   0083
        ADDI    #$0188, R3                      ; 5D0A   02FB 0188
        MVI@    R3,     R3                      ; 5D0C   029B
        SARC    R3,     1                       ; 5D0D   007B
        BNC     L_5D15                          ; 5D0E   0209 0005

        JSR     R5,     .EXEC.7AE               ; 5D10   0004 0114 03AE

        B       L_5D30                          ; 5D13   0200 001B

L_5D15:
        MVI@    R1,     R5                      ; 5D15   028D
        SDBD                                    ; 5D16   0001
        ANDI    #$FDFF, R5                      ; 5D17   03BD 00FF 00FD
        SARC    R3,     1                       ; 5D1A   007B
        BNC     L_5D1F                          ; 5D1B   0209 0002

        XORI    #$0200, R5                      ; 5D1D   03FD 0200
L_5D1F:
        MVO@    R5,     R1                      ; 5D1F   024D
        ADDI    #$0007, R1                      ; 5D20   02F9 0007
        MVI@    R1,     R2                      ; 5D22   028A
        SUBI    #$0005, R1                      ; 5D23   0339 0005
        MOVR    R1,     R5                      ; 5D25   008D
        MVO@    R2,     R5                      ; 5D26   026A
        SWAP    R2,     1                       ; 5D27   0042
        MVO@    R2,     R5                      ; 5D28   026A
        CLRR    R2                              ; 5D29   01D2
        MVO@    R2,     R5                      ; 5D2A   026A
        ADDR    R7,     R3                      ; 5D2B   00FB
        ADDI    #$0010, R3                      ; 5D2C   02FB 0010
        MVI@    R3,     R3                      ; 5D2E   029B
        MVO@    R3,     R5                      ; 5D2F   026B
L_5D30:
        MVI     G_0190, R0                      ; 5D30   0280 0190
        DECR    R0                              ; 5D32   0010
        MVO     R0,     G_0190                  ; 5D33   0240 0190
        BNEQ    L_5CEC                          ; 5D35   022C 004A

        MVII    #$0186, R4                      ; 5D37   02BC 0186
        PULR    R5                              ; 5D39   02B5
        SDBD                                    ; 5D3A   0001
        MVI@    R4,     R7                      ; 5D3B   02A7

        DECLE   $0009,  $000D,  $000A,  $000E   ; 5D3C   0009 000D 000A 000E
        DECLE   $0330,  $0078,  $0130,  $0088   ; 5D40   0330 0078 0130 0088
        DECLE   $013E,  $0072,  $0122,  $0072   ; 5D44   013E 0072 0122 0072
        DECLE   $0330,  $0078,  $014E,  $0072   ; 5D48   0330 0078 014E 0072
        DECLE   $0124,  $0072,  $013C,  $0072   ; 5D4C   0124 0072 013C 0072
        DECLE   $0330,  $0078,  $014E,  $0082   ; 5D50   0330 0078 014E 0082
        DECLE   $0124,  $0072,  $013C,  $0072   ; 5D54   0124 0072 013C 0072
        DECLE   $0330,  $0078,  $013C,  $007E   ; 5D58   0330 0078 013C 007E
        DECLE   $0120,  $0072,  $0140,  $0072   ; 5D5C   0120 0072 0140 0072
        DECLE   $0330,  $0078,  $0138,  $0072   ; 5D60   0330 0078 0138 0072
        DECLE   $0120,  $0072,  $0128,  $0072   ; 5D64   0120 0072 0128 0072
        DECLE   $0330,  $0098,  $0120,  $0072   ; 5D68   0330 0098 0120 0072
        DECLE   $013E,  $0072,  $0135,  $0088   ; 5D6C   013E 0072 0135 0088
        DECLE   $0330,  $013C,  $0130,  $0154   ; 5D70   0330 013C 0130 0154
        DECLE   $0140,  $0164,  $0120,  $0164   ; 5D74   0140 0164 0120 0164
        DECLE   $0338,  $0152,  $0128,  $0152   ; 5D78   0338 0152 0128 0152
        DECLE   $0140,  $0164,  $0120,  $0164   ; 5D7C   0140 0164 0120 0164
        DECLE   $0330,  $014C,  $0114,  $0158   ; 5D80   0330 014C 0114 0158
        DECLE   $0140,  $0164,  $0120,  $0164   ; 5D84   0140 0164 0120 0164
        DECLE   $033A,  $0144,  $0126,  $0144   ; 5D88   033A 0144 0126 0144
        DECLE   $0142,  $0164,  $011E,  $0164   ; 5D8C   0142 0164 011E 0164
        DECLE   $033E,  $0154,  $011C,  $0164   ; 5D90   033E 0154 011C 0164
        DECLE   $013C,  $0164,  $0126,  $0164   ; 5D94   013C 0164 0126 0164
        DECLE   $0330,  $0154,  $0140,  $0164   ; 5D98   0330 0154 0140 0164
        DECLE   $0120,  $0164,  $0330,  $0120   ; 5D9C   0120 0164 0330 0120
        DECLE   $032C,  $008D,  $0234,  $0188   ; 5DA0   032C 008D 0234 0188
        DECLE   $0224,  $0188,  $0026,  $0180   ; 5DA4   0224 0188 0026 0180
        DECLE   $032C,  $0158,  $0038,  $0060   ; 5DA8   032C 0158 0038 0060
        DECLE   $0028,  $0060,  $0020,  $0060   ; 5DAC   0028 0060 0020 0060
        DECLE   $000A,  $0200,  $000A,  $0200   ; 5DB0   000A 0200 000A 0200
        DECLE   $000A,  $0200,  $000A,  $0200   ; 5DB4   000A 0200 000A 0200
        DECLE   $005A,  $0200,  $005A,  $0200   ; 5DB8   005A 0200 005A 0200
        DECLE   $005A,  $0200,  $005A,  $0200   ; 5DBC   005A 0200 005A 0200
.GFX_LIST_5DC0:
        DECLE   $007C,  $006C,  $006C,  $006C   ; 5DC0  CART PIC #00
        DECLE   $007C,  $0001,  $00FF,  $00FF   ; 5DC4  
        DECLE   $0039,  $0019,  $0019,  $0019   ; 5DC8  CART PIC #01
        DECLE   $003D,  $0001,  $00FF,  $00FF   ; 5DCC  
        DECLE   $007D,  $000D,  $007D,  $0061   ; 5DD0  CART PIC #02
        DECLE   $007D,  $0001,  $00FF,  $00FF   ; 5DD4  
        DECLE   $007D,  $000D,  $003D,  $000D   ; 5DD8  CART PIC #03
        DECLE   $007D,  $0001,  $00FF,  $00FF   ; 5DDC  
        DECLE   $006D,  $006D,  $006D,  $007D   ; 5DE0  CART PIC #04
        DECLE   $000D,  $0001,  $00FF,  $00FF   ; 5DE4  
        DECLE   $007D,  $0061,  $007D,  $000D   ; 5DE8  CART PIC #05
        DECLE   $007D,  $0001,  $00FF,  $00FF   ; 5DEC  
        DECLE   $00FD,  $00C1,  $00DD,  $00CD   ; 5DF0  CART PIC #06
        DECLE   $00FD,  $0001,  $00FF,  $00FF   ; 5DF4  
        DECLE   $007E,  $0060,  $006E,  $0066   ; 5DF8  CART PIC #07
        DECLE   $007E,  $0000,  $00FF,  $00FF   ; 5DFC  
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 5E00  CART PIC #08
        DECLE   $00FC,  $006E,  $004B,  $0085   ; 5E04  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E08  CART PIC #09
        DECLE   $0003,  $0007,  $000D,  $000A   ; 5E0C  
        DECLE   $0000,  $0000,  $0000,  $0030   ; 5E10  CART PIC #0A
        DECLE   $00F0,  $0060,  $0020,  $0010   ; 5E14  
        DECLE   $0000,  $00C0,  $007C,  $003E   ; 5E18  CART PIC #0B
        DECLE   $0016,  $000E,  $0002,  $0006   ; 5E1C  
        DECLE   $0000,  $0060,  $0078,  $003C   ; 5E20  CART PIC #0C
        DECLE   $00FC,  $001C,  $0016,  $0032   ; 5E24  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E28  CART PIC #0D
        DECLE   $0000,  $0000,  $0003,  $0000   ; 5E2C  
        DECLE   $0202,  $0005,  $0000,  $0200   ; 5E30   0202 0005 0000 0200
        DECLE   $0000,  $0200,  $0007,  $0000   ; 5E34   0000 0200 0007 0000
        DECLE   $0206,  $020E,  $0190,  $0011   ; 5E38   0206 020E 0190 0011
        DECLE   $0000,  $0196,  $021C,  $0208   ; 5E3C   0000 0196 021C 0208
        DECLE   $0011,  $0182,  $0204,  $020A   ; 5E40   0011 0182 0204 020A
        DECLE   $0011,  $0180,  $020C,  $0208   ; 5E44   0011 0180 020C 0208
        DECLE   $0011,  $0182,  $0204,  $0210   ; 5E48   0011 0182 0204 0210
        DECLE   $0212,  $0214,  $0216,  $0218   ; 5E4C   0212 0214 0216 0218
        DECLE   $021A,  $0013,  $0000,  $0000   ; 5E50   021A 0013 0000 0000
.GRAM_INIT_5E54:
        DECLE   $001A           ; 5E54  # of GRAM cards to init
        DECLE   $005D,  $0207   ; 5E55  #00   :  Algo #2
        DECLE   $028F,  $0361   ; 5E57  #01   :  Algo #2
        DECLE   $0319,  $02E3   ; 5E59  #02   :  Algo #2
        DECLE   $0103,  $00C0   ; 5E5B  #03-04:  GRAM #01-02 -Y--
        DECLE   $0209,  $0040   ; 5E5D  #05-05:  GRAM #04-04 X---
        DECLE   $010B,  $0040   ; 5E5F  #06-06:  GRAM #05-05 -Y--
        DECLE   $0001,  $0380   ; 5E61  #07-0E:  CART #00-07 ----
        DECLE   $0011,  $0280   ; 5E63  #0F-14:  CART #08-0D ----
        DECLE   $021F,  $0040   ; 5E65  #15-15:  GRAM #0F-0F X---
        DECLE   $0223,  $0040   ; 5E67  #16-16:  GRAM #11-11 X---
        DECLE   $0221,  $0040   ; 5E69  #17-17:  GRAM #10-10 X---
        DECLE   $0225,  $00C0   ; 5E6B  #18-19:  GRAM #12-13 X---

        DECLE   $0030,  $0010,  $003C,  $001E   ; 5E6D   0030 0010 003C 001E
        DECLE   $001A,  $00FA,  $0000,  $0018   ; 5E71   001A 00FA 0000 0018
        DECLE   $0018,  $003C,  $0024,  $0066   ; 5E75   0018 003C 0024 0066
        DECLE   $0043,  $0041,  $00C0,  $0000   ; 5E79   0043 0041 00C0 0000
        DECLE   $0060,  $0020,  $0078,  $003C   ; 5E7D   0060 0020 0078 003C
        DECLE   $003E,  $007A,  $0002,  $0018   ; 5E81   003E 007A 0002 0018
        DECLE   $001C,  $003C,  $0024,  $0027   ; 5E85   001C 003C 0024 0027
        DECLE   $0021,  $0021,  $0020,  $0060   ; 5E89   0021 0021 0020 0060
        DECLE   $0060,  $0020,  $0078,  $003C   ; 5E8D   0060 0020 0078 003C
        DECLE   $003C,  $003C,  $007C,  $0018   ; 5E91   003C 003C 007C 0018
        DECLE   $0018,  $0018,  $0018,  $001E   ; 5E95   0018 0018 0018 001E
        DECLE   $0012,  $0012,  $0010,  $0030   ; 5E99   0012 0012 0010 0030
        DECLE   $0060,  $0020,  $0070,  $0030   ; 5E9D   0060 0020 0070 0030
        DECLE   $0030,  $0030,  $0030,  $0030   ; 5EA1   0030 0030 0030 0030
        DECLE   $0030,  $0030,  $0030,  $003C   ; 5EA5   0030 0030 0030 003C
        DECLE   $0014,  $0014,  $0010,  $0030   ; 5EA9   0014 0014 0010 0030
        DECLE   $0060,  $0020,  $0078,  $003C   ; 5EAD   0060 0020 0078 003C
        DECLE   $003C,  $003C,  $007C,  $0018   ; 5EB1   003C 003C 007C 0018
        DECLE   $0038,  $007C,  $0044,  $0074   ; 5EB5   0038 007C 0044 0074
        DECLE   $0014,  $0004,  $0004,  $0008   ; 5EB9   0014 0004 0004 0008
        DECLE   $0060,  $0020,  $0078,  $003C   ; 5EBD   0060 0020 0078 003C
        DECLE   $003E,  $007A,  $0002,  $0018   ; 5EC1   003E 007A 0002 0018
        DECLE   $0038,  $00FC,  $0084,  $00E4   ; 5EC5   0038 00FC 0084 00E4
        DECLE   $0024,  $0022,  $0002,  $0002   ; 5EC9   0024 0022 0002 0002
        DECLE   $0030,  $0010,  $003C,  $001E   ; 5ECD   0030 0010 003C 001E
        DECLE   $001A,  $00FA,  $0000,  $0018   ; 5ED1   001A 00FA 0000 0018
        DECLE   $0018,  $00FC,  $0084,  $0046   ; 5ED5   0018 00FC 0084 0046
        DECLE   $0042,  $0003,  $0001,  $0001   ; 5ED9   0042 0003 0001 0001
        DECLE   $0030,  $0010,  $003F,  $0019   ; 5EDD   0030 0010 003F 0019
        DECLE   $00F9,  $0018,  $0000,  $0018   ; 5EE1   00F9 0018 0000 0018
        DECLE   $0018,  $00FC,  $0084,  $0086   ; 5EE5   0018 00FC 0084 0086
        DECLE   $0082,  $0003,  $0001,  $0000   ; 5EE9   0082 0003 0001 0000
        DECLE   $0018,  $0008,  $001C,  $001E   ; 5EED   0018 0008 001C 001E
        DECLE   $001A,  $002D,  $002D,  $0021   ; 5EF1   001A 002D 002D 0021
        DECLE   $000D,  $000C,  $0014,  $0014   ; 5EF5   000D 000C 0014 0014
        DECLE   $0012,  $0012,  $0012,  $0036   ; 5EF9   0012 0012 0012 0036
        DECLE   $0000,  $0000,  $00C0,  $0070   ; 5EFD   0000 0000 00C0 0070
        DECLE   $00F8,  $007C,  $003A,  $0026   ; 5F01   00F8 007C 003A 0026
        DECLE   $0016,  $000E,  $0006,  $0006   ; 5F05   0016 000E 0006 0006
        DECLE   $0006,  $0002,  $0002,  $0006   ; 5F09   0006 0002 0002 0006
        DECLE   $0000,  $0000,  $0018,  $0018   ; 5F0D   0000 0000 0018 0018
        DECLE   $0024,  $005A,  $005A,  $003C   ; 5F11   0024 005A 005A 003C
        DECLE   $0024,  $0018,  $0018,  $0018   ; 5F15   0024 0018 0018 0018
        DECLE   $0018,  $0018,  $0000,  $003C   ; 5F19   0018 0018 0000 003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F21   0000 0000 0000 0000

        ADDR    R0,     R1                      ; 5F25   00C1
        MOVR    R0,     R5                      ; 5F26   0085
        ADDR    R0,     R7                      ; 5F27   00C7

        DECLE   $00EE,  $00EA,  $00BB,  $0099   ; 5F28   00EE 00EA 00BB 0099
        DECLE   $00F9,  $0000,  $0000,  $0000   ; 5F2C   00F9 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F30   0000 0000 0000 0000
        DECLE   $0000,  $00C3,  $0042,  $00F2   ; 5F34   0000 00C3 0042 00F2
        DECLE   $007B,  $003E,  $0026,  $0026   ; 5F38   007B 003E 0026 0026
        DECLE   $00E6,  $0000,  $0000,  $0000   ; 5F3C   00E6 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 5F40   0000 0000 0000 00C0
        DECLE   $0078,  $00FC,  $0076,  $006E   ; 5F44   0078 00FC 0076 006E
        DECLE   $004E,  $004A,  $004F,  $0045   ; 5F48   004E 004A 004F 0045
        DECLE   $0085,  $0000,  $0000,  $0000   ; 5F4C   0085 0000 0000 0000
        DECLE   $0000,  $0060,  $0038,  $007C   ; 5F50   0000 0060 0038 007C
        DECLE   $001E,  $001A,  $0036           ; 5F54   001E 001A 0036

        SAR     R0,     2                       ; 5F57   006C
        INCR    R4                              ; 5F58   000C
        INCR    R4                              ; 5F59   000C
        INCR    R7                              ; 5F5A   000F

        INCR    R1                              ; 5F5B   0009
L_5F5C:
        COMR    R1                              ; 5F5C   0019
        DECLE   $0000,  $0000,  $0060,  $0038   ; 5F5D   0000 0000 0060 0038
        DECLE   $007C,  $001E,  $001E,  $00F2   ; 5F61   007C 001E 001E 00F2
        DECLE   $000C,  $000C,  $003C,  $0024   ; 5F65   000C 000C 003C 0024
        DECLE   $0026,  $0063,  $0001,  $0001   ; 5F69   0026 0063 0001 0001
        DECLE   $0000,  $0000,  $0038,  $0000   ; 5F6D   0000 0000 0038 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F71   0000 0000 0000 0000
        DECLE   $0300,  $0000,  $009A,  $005B   ; 5F75   0300 0000 009A 005B
        DECLE   $0008,  $0000,  $0002,  $0055   ; 5F79   0008 0000 0002 0055
        DECLE   $005C,  $029B,  $005A,  $001F   ; 5F7D   005C 029B 005A 001F
        DECLE   $005A,  $0001                   ; 5F81   005A 0001

        NEGR    R0                              ; 5F83   0020

        JSRD    R4,     L_545B                  ; 5F84   0004 0056 005B
        DECLE   $0165,  $005B,  $0000,  $0000   ; 5F87   0165 005B 0000 0000
        DECLE   $0034,  $005C,  $0002,  $001C   ; 5F8B   0034 005C 0002 001C
        DECLE   $0000,  $0300,  $0000,  $00BB   ; 5F8F   0000 0300 0000 00BB
        DECLE   $005B,  $0008,  $0000,  $0008   ; 5F93   005B 0008 0000 0008
        DECLE   $01F8,  $005B,  $01F8,  $015B   ; 5F97   01F8 005B 01F8 015B
        DECLE   $03F8,  $005B,  $03F8,  $015B   ; 5F9B   03F8 005B 03F8 015B
        DECLE   $0300,  $0000,  $0085,  $005A   ; 5F9F   0300 0000 0085 005A
        DECLE   $0008,  $0000                   ; 5FA3   0008 0000

        EIS                                     ; 5FA5   0002
        RLC     R1,     2                       ; 5FA6   0055
        SLLC    R0,     2                       ; 5FA7   005C
L_5FA8:
        MVI     G_016B, R3                      ; 5FA8   0283 016B
        INCR    R3                              ; 5FAA   000B
L_5FAB:
        PSHR    R5                              ; 5FAB   0275
        MOVR    R3,     R0                      ; 5FAC   0098

        JSR     R5,     X_PLAY_SFX1             ; 5FAD   0004 0118 03BB
        DECLE   $03E9                           ; 5FB0  SFX data
        DECLE   $03C0,  $0280                   ; 5FB1  SFX data
        DECLE   $0003,  $000C                   ; 5FB3  SFX data
        DECLE   $0380,  $0080                   ; 5FB5  SFX data
        DECLE   $006B                           ; 5FB7  SFX data
        DECLE   $00EB                           ; 5FB8  SFX data
        DECLE   $02CF                           ; 5FB9  SFX end

L_5FBA:
        PSHR    R5                              ; 5FBA   0275

        JSR     R5,     X_PLAY_SFX1             ; 5FBB   0004 0118 03BB
        DECLE   $0389                           ; 5FBE  SFX data
        DECLE   $0200,  $02C0                   ; 5FBF  SFX data
        DECLE   $0218,  $0100                   ; 5FC1  SFX data
        DECLE   $0214,  $0300                   ; 5FC3  SFX data
        DECLE   $0001,  $0303                   ; 5FC5  SFX data
        DECLE   $00CE                           ; 5FC7  SFX data
        DECLE   $00EB                           ; 5FC8  SFX data
        DECLE   $038E                           ; 5FC9  SFX data
        DECLE   $0001,  $01E3                   ; 5FCA  SFX data
        DECLE   $02EB                           ; 5FCC  SFX data
        DECLE   $02CF                           ; 5FCD  SFX end

L_5FCE:
        PSHR    R5                              ; 5FCE   0275

        JSR     R5,     X_PLAY_MUS2             ; 5FCF   0004 0118 035D
        DECLE   $018C                           ; 5FD2  Note (short)
        DECLE   $01DC                           ; 5FD3  Note (short)
        DECLE   $021C                           ; 5FD4  Note (short)
        DECLE   $024E                           ; 5FD5  Note (short)
        DECLE   $021C                           ; 5FD6  Note (short)
        DECLE   $024F                           ; 5FD7  Note (short)
        DECLE   $0000                           ; 5FD8  End of music

        MVII    #$0008, R0                      ; 5FD9   02B8 0008

        JSR     R5,     X_PLAY_CHEER1           ; 5FDB   0004 011C 02D5

        PULR    R7                              ; 5FDE   02B7

L_5FDF:
        PSHR    R5                              ; 5FDF   0275

        JSR     R5,     X_PLAY_SFX1             ; 5FE0   0004 0118 03BB
        DECLE   $0079                           ; 5FE3  SFX data
        DECLE   $03ED                           ; 5FE4  SFX data
        DECLE   $03B7                           ; 5FE5  SFX data
        DECLE   $004C,  $0000                   ; 5FE6  SFX data
        DECLE   $000B                           ; 5FE8  SFX data
        DECLE   $03CF                           ; 5FE9  SFX end

L_5FEA:
        PSHR    R5                              ; 5FEA   0275

        JSR     R5,     X_PLAY_SFX1             ; 5FEB   0004 0118 03BB
        DECLE   $03E9                           ; 5FEE  SFX data
        DECLE   $02C0,  $0040                   ; 5FEF  SFX data
        DECLE   $0001,  $0004                   ; 5FF1  SFX data
        DECLE   $008F,  $012B                   ; 5FF3  SFX data
        DECLE   $02CF                           ; 5FF5  SFX end

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5FFE   0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5034       <entry>
;;  $504B       $5093  
;;  $505C       $5051   $5072  
;;  $506B       $5067  
;;  $5075       <entry>
;;  $5083       $5081  
;;  $50A2       $509B  
;;  $50A9       $50A7  
;;  $50CC       $5715   $5978  
;;  $5100       $50E5  
;;  $510E       $5100   $5104  
;;  $5115       $543E   $5443  
;;  $511B       $5116   $56D6   $58C3   $597F   $5987   $59EB   $59F8   $5AD6  
;;  $5124       $511F  
;;  $5125       $5087  
;;  $5132       $50BC   $50D3   $5294  
;;  $5143       $514E  
;;  $5151       $5145   $5212  
;;  $519A       $5188   $5195  
;;  $519E       $5173   $5192  
;;  $519F       $515A   $515E   $5162   $5166   $516B   $516F   $5179   $5183  
;;  $519F       $519B  
;;  $51A0       $519E  
;;  $51AA       $51C4  
;;  $51B5       $51AF  
;;  $51B7       $51B3   $51C2  
;;  $51C6       $51BF  
;;  $51D0       $51A7   $51B9   $51C8   $51CC  
;;  $51E0       $551D  
;;  $51F4       $51EE  
;;  $51FC       $51F8  
;;  $5202       $51FE  
;;  $520F       $520B  
;;  $521C       $5108   $5972  
;;  $522B       $5218  
;;  $522C       $522A  
;;  $523B       $5237  
;;  $524E       $523F  
;;  $5251       $524E  
;;  $5253       $5230  
;;  $5254       $5734  
;;  $5260       $5255   $525A  
;;  $5278       $526A  
;;  $5282       $5276  
;;  $5284       $5272   $527E  
;;  $528F       $5804  
;;  $5290       $5330  
;;  $52A3       $5298   $529D  
;;  $52B7       $52B3  
;;  $52BE       $52B9  
;;  $52C9       $52CD  
;;  $52CF       $52C1   $52C5  
;;  $52D8       $5336   $56D2   $5AD3  
;;  $52EB       $5A27   $5A3B   $5A9C   $5B8C  
;;  $5319       $5312  
;;  $5320       $531C  
;;  $5334       $58B3   $5AF3   $5B24  
;;  $5358       $5354  
;;  $5375       $5309   $534E  
;;  $537E       $537A  
;;  $537F       $5035  
;;  $539F       $5486  
;;  $53A0       $539E  
;;  $53A7       $538F  
;;  $53D1       $53C8  
;;  $53E5       $53E2  
;;  $53F2       $53EB  
;;  $53FA       $5387   $5393   $53AA   $53E9  
;;  $53FB       $53F5  
;;  $5402       $5380  
;;  $5417       $5411  
;;  $542D       $540D  
;;  $543C       $5435  
;;  $5452       $544B  
;;  $5459       $5931   $5955  
;;  $545B       $5F84  
;;  $5460       $5437   $544D   $5453  
;;  $547F       $5476   $547A  
;;  $5480       $5413   $542D  
;;  $5489       $5484  
;;  $548F       $512E   $5737  
;;  $54CC       $53B6  
;;  $54E8       $5047  
;;  $5515       $5519  
;;  $5520       $551B  
;;  $5528       $5546  
;;  $5530       $552C  
;;  $5562       $5573  
;;  $556B       $556E  
;;  $5577       $555D  
;;  $557B       $558D  
;;  $557D       $5581  
;;  $5590       $5575  
;;  $5592       $555B  
;;  $5597       $50B8   $50FB   $512A   $560C   $573A   $5800   $5851   $58A8  
;;  $5597       $5968   $59D9   $5A17   $5AF6   $5B1F   $5B5D  
;;  $5598       $5A4C  
;;  $559A       $5090  
;;  $55A4       $55A2  
;;  $55A9       $559A  
;;  $55AF       $511C   $5234   $5267   $52B0   $52E5   $5319   $5351   $5B49  
;;  $55B7       $509D   $58D2  
;;  $55BE       $55C5  
;;  $55D6       $573E   $5A3E  
;;  $55ED       $55D6  
;;  $55F0       $50CD   $5A1B  
;;  $55F4       $55EE  
;;  $55F6       $5626   $5726  
;;  $55F7       $503B  
;;  $5616       $5603   $5606  
;;  $561E       $55F8   $5616  
;;  $5643       $563C  
;;  $5644       $5642  
;;  $5646       $503E  
;;  $5653       $564B   $564F   $5682  
;;  $5668       $5664  
;;  $566C       $5662  
;;  $566D       $566B  
;;  $5679       $5675  
;;  $567B       $5659  
;;  $567C       $567A  
;;  $5687       $5044  
;;  $569C       $5698  
;;  $56AA       $56A2  
;;  $56AF       $56A6   $56AC  
;;  $56B2       $5215  
;;  $56B6       $50EA  
;;  $56B9       $56CD  
;;  $56C4       $56C1  
;;  $56C9       $56BE  
;;  $56D0       $5909   $5924  
;;  $56D1       $5A35   $5B90  
;;  $56EF       <entry>
;;  $5700       $56FC  
;;  $5718       $5631   $568C   $56F3   $5706   $5713  
;;  $5719       $591A   $5952   $5ABD  
;;  $5722       $5041  
;;  $5749       $57D1   $57ED   $580A  
;;  $574A       $576A  
;;  $574F       $5788  
;;  $5780       $5760  
;;  $57B6       $5773  
;;  $57B7       $578E  
;;  $57BC       $57CD  
;;  $57CA       $57BE  
;;  $57D3       $57C1   $57C4  
;;  $57D5       $575A   $5764   $5782  
;;  $57D8       $577C   $579C  
;;  $5800       $581D   $582C  
;;  $5808       $57E7  
;;  $582E       $57EF  
;;  $5834       $579F   $57F8  
;;  $5838       $5832  
;;  $583F       $5839   $5A70  
;;  $584D       $5845  
;;  $5863       $5855  
;;  $586E       $5754   $57DC   $5875   $587A   $5882  
;;  $58D1       $594C   $5B76  
;;  $58D6       $58A2  
;;  $58D7       $58D5  
;;  $58E6       $58D7  
;;  $58EC       $58FF  
;;  $58EF       $58FC  
;;  $58F8       $58F0  
;;  $5902       $5038  
;;  $591E       $5912  
;;  $5923       $5917   $5C7A  
;;  $5930       $5ABA  
;;  $5931       $592F  
;;  $593C       $50B3  
;;  $593D       $593B  
;;  $594C       $59F0  
;;  $594F       $5940   $5946   $59FD  
;;  $595C       $594A  
;;  $5965       $5961  
;;  $5966       $5964  
;;  $5978       $5970  
;;  $597C       $5942   $595C  
;;  $598D       $5910  
;;  $5990       $592D  
;;  $59AB       $590D  
;;  $59B0       $592A  
;;  $59C0       $59B0   $5AA8  
;;  $59CC       $599E  
;;  $59F2       $5996  
;;  $59FF       $50D0   $5914   $598D   $59E1   $5AA5   $5AB7   $5C6E  
;;  $5A01       $59AD  
;;  $5A07       $5A13  
;;  $5A0D       $5A09  
;;  $5A0E       $5A0C  
;;  $5A1E       $588C   $5890   $5898   $5907   $591E  
;;  $5A3A       $5A23  
;;  $5A4C       $5A48  
;;  $5A50       $58A5  
;;  $5A6D       $5A5C   $5AE5  
;;  $5A8C       $5A25  
;;  $5AB7       $5AA3   $5B97  
;;  $5AFD       $5AC3   $5AC7   $5ADB   $5B1A   $5B81   $5B87  
;;  $5AFE       $5A32   $5AE2  
;;  $5B11       $5B0B  
;;  $5B44       $5B3B  
;;  $5B4F       $5B4C  
;;  $5B5D       $5B7C  
;;  $5B6C       $5A38  
;;  $5B73       $5B6E  
;;  $5B7E       $5B57   $5B66  
;;  $5B8A       $5B5A   $5B69  
;;  $5BAA       $5BA7   $5BEE  
;;  $5BB5       $5B9F   $5BC0  
;;  $5BB7       $5BF6  
;;  $5BCA       $5BEA  
;;  $5BDC       $5BD6  
;;  $5BE7       $5BDF   $5BE2  
;;  $5C14       $5C0C  
;;  $5C15       $5C13  
;;  $5C2E       $5C2B  
;;  $5C33       $5BFD   $5C06   $5C5A   $5C5E   $5C63   $5C6C  
;;  $5C45       $5C3B  
;;  $5C49       $5C3D   $5C43  
;;  $5C85       $50BF   $5840  
;;  $5C8E       $50C6   $50F6   $5814  
;;  $5C9D       $57A4   $57F3  
;;  $5C9F       $5C95  
;;  $5CA4       $57FD  
;;  $5CA5       $5C9B  
;;  $5CAB       $5CE4  
;;  $5CDD       $5CDA  
;;  $5CEC       $5D35  
;;  $5CED       $5A77   $5CBF  
;;  $5CEF       $5821  
;;  $5CFC       $5CF3  
;;  $5D04       $5CFE  
;;  $5D15       $5D0E  
;;  $5D1F       $5D1B  
;;  $5D30       $5D13  
;;  $5F5C       $5F5A  
;;  $5FA8       $5B61  
;;  $5FAB       $57DE   $5B1C  
;;  $5FBA       $589F  
;;  $5FCE       $50A4  
;;  $5FDF       $570C  
;;  $5FEA       $5AFA  
;; ======================================================================== ;;
