
        ORG     $5000
.HEADER:
        BIDECLE $5A8A           ; 5000  Ptr: MOB graphic images
        BIDECLE $5037           ; 5002  Ptr: EXEC timer table
        BIDECLE $505B           ; 5004  Ptr: Start of game
        BIDECLE $5A8A           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5051           ; 5008  Ptr: GRAM init sequence
        BIDECLE $501C           ; 500A  Ptr: Date/Title
        DECLE   $0000           ; 500C  Key-click / flags
        DECLE   $0002           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $00F0,  $00E0,  $00D0,  $00C0   ; 5014   00F0 00E0 00D0 00C0
        DECLE   $00B0,  $00A0,  $0090,  $0080   ; 5018   00B0 00A0 0090 0080
.TITLE:
        DECLE   $0051                           ; 501C  Cartridge year
        STRING  "SPACE HAWK"                    ; 501D  Title string
        DECLE   $0000                           ; 5027  

        DECLE   $0043,  $006F,  $0070,  $0072   ; 5028   0043 006F 0070 0072
        DECLE   $0040,  $0031,  $0039,  $0038   ; 502C   0040 0031 0039 0038
        DECLE   $0031,  $004D,  $0061,  $0074   ; 5030   0031 004D 0061 0074
        DECLE   $0074,  $0065,  $006C           ; 5034   0074 0065 006C
.TIMER:
        DECLE   $001D,  $005E,  $0001,  $0000; 5037  Timer dispatch/interval
        DECLE   $00C7,  $005F,  $0001,  $0000; 503B  Timer dispatch/interval
        DECLE   $00CC,  $0050,  $0001,  $0000; 503F  Timer dispatch/interval
        DECLE   $000F,  $0054,  $0007,  $0000; 5043  Timer dispatch/interval
        DECLE   $004B,  $0053,  $0001,  $0000; 5047  Timer dispatch/interval
        DECLE   $0045,  $0055,  $0001,  $0000; 504B  Timer dispatch/interval
        BIDECLE $0000           ; 504F  End of timer table

.GRAM_INIT_5051:
        DECLE   $0009           ; 5051  # of GRAM cards to init
        DECLE   $0001,  $0080   ; 5052  #00-01:  CART #00-01 ----
        DECLE   $0201,  $0080   ; 5054  #02-03:  CART #00-01 X---
        DECLE   $0301,  $0080   ; 5056  #04-05:  CART #00-01 XY--
        DECLE   $0003,  $0080   ; 5058  #06-07:  CART #01-02 ----
        DECLE   $0006           ; 505A  #08   :  CART #03    ----

.START:
        PSHR    R5                              ; 505B   0275
        MVII    #$0001, R1                      ; 505C   02B9 0001
        MVO     R1,     G_018F                  ; 505E   0241 018F
        MVII    #$0006, R0                      ; 5060   02B8 0006
        MVII    #$0179, R4                      ; 5062   02BC 0179

        JSR     R5,     X_FILL_MEM              ; 5064   0004 0114 0341

        MVII    #$0080, R0                      ; 5067   02B8 0080
        MVO     R0,     G_012C                  ; 5069   0240 012C
        MVO     R0,     G_012E                  ; 506B   0240 012E
        MVO     R0,     G_0130                  ; 506D   0240 0130
        MVII    #$0200, R4                      ; 506F   02BC 0200
        MVII    #$00F0, R0                      ; 5071   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5073   0004 0114 0338

        MVII    #$031D, R4                      ; 5076   02BC 031D
        MVII    #$0040, R0                      ; 5078   02B8 0040

        JSR     R5,     X_FILL_ZERO             ; 507A   0004 0114 0338

        MVII    #$031E, R4                      ; 507D   02BC 031E
        SDBD                                    ; 507F   0001
        MVII    #$5CF9, R0                      ; 5080   02B8 00F9 005C
        MVO@    R0,     R4                      ; 5083   0260
        SDBD                                    ; 5084   0001
        MVII    #$5CF2, R0                      ; 5085   02B8 00F2 005C
        MVO     R0,     G_0356                  ; 5088   0240 0356
        MVII    #$0053, R0                      ; 508A   02B8 0053
        SWAP    R0,     1                       ; 508C   0040
        MVO@    R0,     R4                      ; 508D   0260
        MVII    #$0033, R0                      ; 508E   02B8 0033
        SWAP    R0,     1                       ; 5090   0040
        MVO@    R0,     R4                      ; 5091   0260
        SDBD                                    ; 5092   0001
        MVII    #$5D0F, R0                      ; 5093   02B8 000F 005D
        MVO     R0,     G_0326                  ; 5096   0240 0326
        MVO     R0,     G_032E                  ; 5098   0240 032E
        MVII    #$000E, R0                      ; 509A   02B8 000E
        MVO     R0,     G_0115                  ; 509C   0240 0115
        MVII    #$0008, R0                      ; 509E   02B8 0008

        JSR     R5,     L_538F                  ; 50A0   0004 0150 038F

        MVI     .ISRVEC.0,R2                    ; 50A3   0282 0100
        MVI     .ISRVEC.1,R1                    ; 50A5   0281 0101
        MVO     R2,     G_0160                  ; 50A7   0242 0160
        MVO     R1,     G_0161                  ; 50A9   0241 0161
        MVII    #$00F0, R0                      ; 50AB   02B8 00F0
        MVII    #$0001, R1                      ; 50AD   02B9 0001
        MVII    #$0200, R4                      ; 50AF   02BC 0200

        JSRE    R5,     L_55F7                  ; 50B1   0004 0155 01F7

        MVII    #$0006, R0                      ; 50B4   02B8 0006
        MVO     R0,     G_034C                  ; 50B6   0240 034C
        MVII    #$01F4, R0                      ; 50B8   02B8 01F4

        JSR     R5,     L_5830                  ; 50BA   0004 0158 0030

        MVII    #$000A, R0                      ; 50BD   02B8 000A
        J       L_549F                          ; 50BF   0004 0354 009F

        SAR     R0,     2                       ; 50C2   006C
        RLC     R3,     1                       ; 50C3   0053
        MOVR    R3,     R6                      ; 50C4   009E
        RLC     R0,     2                       ; 50C5   0054
        DECR    R1                              ; 50C6   0011
        RLC     R0,     2                       ; 50C7   0054
        MOVR    R5,     R0                      ; 50C8   00A8
        RLC     R3,     1                       ; 50C9   0053
        MOVR    R5,     R0                      ; 50CA   00A8
        RLC     R3,     1                       ; 50CB   0053
L_50CC:
        PSHR    R5                              ; 50CC   0275

        JSR     R5,     L_59EC                  ; 50CD   0004 0158 01EC
        JSR     R5,     L_50F7                  ; 50D0   0004 0150 00F7

        MVI     G_017C, R0                      ; 50D3   0280 017C
        TSTR    R0                              ; 50D5   0080
        BEQ     L_5189                          ; 50D6   0204 00B1

        MVI     G_0183, R0                      ; 50D8   0280 0183
        DECR    R0                              ; 50DA   0010
        BMI     L_50F6                          ; 50DB   020B 0019

        MVO     R0,     G_0183                  ; 50DD   0240 0183
        MOVR    R0,     R2                      ; 50DF   0082
        MVII    #$0001, R0                      ; 50E0   02B8 0001
        MVI     G_035E, R1                      ; 50E2   0281 035E
        MVII    #$0189, R3                      ; 50E4   02BB 0189
        RRC     R2,     1                       ; 50E6   0072
        BC      L_50EB                          ; 50E7   0201 0002

        ADDI    #$0003, R3                      ; 50E9   02FB 0003
L_50EB:
        RRC     R1,     1                       ; 50EB   0071
        BC      L_50EF                          ; 50EC   0201 0001

        NEGR    R0                              ; 50EE   0020
L_50EF:
        ADD@    R3,     R0                      ; 50EF   02D8

        JSR     R5,     X_CLAMP                 ; 50F0   0004 0114 0270
        DECLE   $0000                           ; 50F3   0000

        SETC                                    ; 50F4   0007
        MVO@    R0,     R3                      ; 50F5   0258
L_50F6:
        PULR    R7                              ; 50F6   02B7

L_50F7:
        PSHR    R5                              ; 50F7   0275
        MVI     G_035E, R0                      ; 50F8   0280 035E
        SLR     R0,     2                       ; 50FA   0064
        SLR     R0,     2                       ; 50FB   0064
        BNEQ    L_5103                          ; 50FC   020C 0005

        MVII    #$0009, R0                      ; 50FE   02B8 0009
        J       L_549F                          ; 5100   0004 0354 009F

L_5103:
        MVI     G_035E, R2                      ; 5103   0282 035E
        ANDI    #$007F, R2                      ; 5105   03BA 007F
        BNEQ    L_5128                          ; 5107   020C 001F

        JSR     R5,     L_55CB                  ; 5109   0004 0154 01CB

        TSTR    R1                              ; 510C   0089
        BEQ     L_5128                          ; 510D   0204 0019

        INCR    R1                              ; 510F   0009
        SDBD                                    ; 5110   0001
        MVII    #$5D6F, R0                      ; 5111   02B8 006F 005D
        MVO@    R0,     R1                      ; 5114   0248
        ADDI    #$0003, R1                      ; 5115   02F9 0003
        MOVR    R1,     R4                      ; 5117   008C
        MVII    #$0014, R0                      ; 5118   02B8 0014

        JSR     R5,     L_513F                  ; 511A   0004 0150 013F

        INCR    R4                              ; 511D   000C
        CLRR    R0                              ; 511E   01C0
        MVO@    R0,     R4                      ; 511F   0260
        SDBD                                    ; 5120   0001
        MVII    #$508F, R0                      ; 5121   02B8 008F 0050
        MVO@    R0,     R1                      ; 5124   0248
        MVII    #$0012, R0                      ; 5125   02B8 0012
        MVO@    R0,     R4                      ; 5127   0260
L_5128:
        PULR    R7                              ; 5128   02B7

L_5129:
        PSHR    R5                              ; 5129   0275
        MVI     G_0163, R1                      ; 512A   0281 0163
        INCR    R1                              ; 512C   0009
        ANDI    #$0007, R1                      ; 512D   03B9 0007
        MVO     R1,     G_0163                  ; 512F   0241 0163
        SDBD                                    ; 5131   0001
        ADDI    #$5137, R1                      ; 5132   02F9 0037 0051
        MVI@    R1,     R0                      ; 5135   0288
        PULR    R7                              ; 5136   02B7

        DECLE   $0003,  $0014,  $0005           ; 5137   0003 0014 0005

        CLRC                                    ; 513A   0006
        DECR    R5                              ; 513B   0015
        DECR    R2                              ; 513C   0012
        DECR    R4                              ; 513D   0014
        DECR    R5                              ; 513E   0015
L_513F:
        PSHR    R5                              ; 513F   0275
        PSHR    R0                              ; 5140   0270
        MVII    #$00A6, R0                      ; 5141   02B8 00A6

        JSR     R5,     X_RAND2                 ; 5143   0004 0114 029E

        INCR    R0                              ; 5146   0008
        MOVR    R0,     R1                      ; 5147   0081
        MVII    #$0067, R0                      ; 5148   02B8 0067

        JSR     R5,     X_RAND2                 ; 514A   0004 0114 029E

        INCR    R0                              ; 514D   0008
        MOVR    R0,     R2                      ; 514E   0082
        MVII    #$0002, R0                      ; 514F   02B8 0002

        JSR     R5,     X_RAND1                 ; 5151   0004 0114 027D

        SLL     R0,     1                       ; 5154   0048
        ADDR    R0,     R7                      ; 5155   00C7
        B       L_5167                          ; 5156   0200 000F
        B       L_5163                          ; 5158   0200 0009
        B       L_5160                          ; 515A   0200 0004

        MVII    #$0068, R2                      ; 515C   02BA 0068
        B       L_5168                          ; 515E   0200 0008

L_5160:
        CLRR    R2                              ; 5160   01D2
        B       L_5168                          ; 5161   0200 0005

L_5163:
        MVII    #$00A7, R1                      ; 5163   02B9 00A7
        B       L_5168                          ; 5165   0200 0001

L_5167:
        CLRR    R1                              ; 5167   01C9
L_5168:
        SUBI    #$0002, R4                      ; 5168   033C 0002
        SWAP    R1,     1                       ; 516A   0041
        MVO@    R1,     R4                      ; 516B   0261
        SWAP    R2,     1                       ; 516C   0042
        MVO@    R2,     R4                      ; 516D   0262
        PULR    R3                              ; 516E   02B3
        MVII    #$0028, R0                      ; 516F   02B8 0028

        JSR     R5,     X_RAND2                 ; 5171   0004 0114 029E

        ADDI    #$001F, R0                      ; 5174   02F8 001F
        MOVR    R0,     R1                      ; 5176   0081
        MVII    #$0028, R0                      ; 5177   02B8 0028

        JSR     R5,     X_RAND2                 ; 5179   0004 0114 029E

        ADDI    #$003F, R0                      ; 517C   02F8 003F

        JSR     R5,     X_PACK_BYTES            ; 517E   0004 0114 034F

        MOVR    R0,     R2                      ; 5181   0082
        MOVR    R4,     R1                      ; 5182   00A1
        SUBI    #$0004, R1                      ; 5183   0339 0004

        JSR     R5,     .EXEC.9A3               ; 5185   0004 0118 01A3

        PULR    R7                              ; 5188   02B7

L_5189:
        MVI     G_016A, R0                      ; 5189   0280 016A

        JSR     R5,     .EXEC.76C               ; 518B   0004 0114 036C

        INCR    R1                              ; 518E   0009
        MVI@    R1,     R0                      ; 518F   0288
        SDBD                                    ; 5190   0001
        CMPI    #$5D42, R0                      ; 5191   0378 0042 005D
        BEQ     L_51F7                          ; 5194   0204 0061

        JSR     R5,     L_55CB                  ; 5196   0004 0154 01CB

        TSTR    R1                              ; 5199   0089
        BEQ     L_52F5                          ; 519A   0204 0159

        MVI     G_016A, R0                      ; 519C   0280 016A
        TSTR    R0                              ; 519E   0080
        BNEQ    L_520F                          ; 519F   020C 006E

        SDBD                                    ; 51A1   0001
        MVII    #$5A4F, R2                      ; 51A2   02BA 004F 005A
        ADD     G_0179, R2                      ; 51A5   02C2 0179
        MVI@    R2,     R0                      ; 51A7   0290

        JSR     R5,     X_RAND2                 ; 51A8   0004 0114 029E

        TSTR    R0                              ; 51AB   0080
        BNEQ    L_52B5                          ; 51AC   020C 0107

        JSR     R5,     .EXEC.766               ; 51AE   0004 0114 0366

        MVO     R0,     G_016A                  ; 51B1   0240 016A
        INCR    R1                              ; 51B3   0009
        SDBD                                    ; 51B4   0001
        MVII    #$5D3B, R0                      ; 51B5   02B8 003B 005D
        MVO@    R0,     R1                      ; 51B8   0248
        ADDI    #$0003, R1                      ; 51B9   02F9 0003
        SDBD                                    ; 51BB   0001
        MVII    #$5A18, R2                      ; 51BC   02BA 0018 005A
        ADD     G_0179, R2                      ; 51BF   02C2 0179
        MVI@    R2,     R0                      ; 51C1   0290
        SLR     R0,     2                       ; 51C2   0064
        MVO     R0,     G_016C                  ; 51C3   0240 016C
        MOVR    R1,     R4                      ; 51C5   008C

        JSR     R5,     L_513F                  ; 51C6   0004 0150 013F

        ADDI    #$0005, R1                      ; 51C9   02F9 0005
        MVII    #$0100, R0                      ; 51CB   02B8 0100
        MVO@    R0,     R1                      ; 51CD   0248
        INCR    R1                              ; 51CE   0009
        MVII    #$0005, R0                      ; 51CF   02B8 0005
        MVO@    R0,     R1                      ; 51D1   0248
        SUBI    #$0006, R1                      ; 51D2   0339 0006
        SDBD                                    ; 51D4   0001
        MVII    #$580F, R2                      ; 51D5   02BA 000F 0058
        MVI     G_0179, R3                      ; 51D8   0283 0179
        CMPI    #$0008, R3                      ; 51DA   037B 0008
        BLT     L_51E9                          ; 51DC   0205 000B

        SDBD                                    ; 51DE   0001
        ADDI    #$5A4F, R3                      ; 51DF   02FB 004F 005A
        MVI@    R3,     R0                      ; 51E2   0298

        JSR     R5,     X_RAND2                 ; 51E3   0004 0114 029E

        TSTR    R0                              ; 51E6   0080
        BEQ     L_51ED                          ; 51E7   0204 0004

L_51E9:
        SDBD                                    ; 51E9   0001
        XORI    #$2080, R2                      ; 51EA   03FA 0080 0020
L_51ED:
        MVO@    R2,     R1                      ; 51ED   024A
        MVII    #$0005, R0                      ; 51EE   02B8 0005
        MVO     R0,     G_016B                  ; 51F0   0240 016B
        MVII    #$0003, R0                      ; 51F2   02B8 0003
        MVO     R0,     G_0181                  ; 51F4   0240 0181
        PULR    R7                              ; 51F6   02B7

L_51F7:
        ADDI    #$0005, R1                      ; 51F7   02F9 0005
        MVI@    R1,     R3                      ; 51F9   028B
        SLR     R3,     1                       ; 51FA   0063
        SDBD                                    ; 51FB   0001
        ADDI    #$520A, R3                      ; 51FC   02FB 000A 0052
        MVI@    R3,     R2                      ; 51FF   029A
        SUBI    #$0006, R1                      ; 5200   0339 0006
        MVI@    R1,     R0                      ; 5202   0288
        SDBD                                    ; 5203   0001
        ANDI    #$FFF8, R0                      ; 5204   03B8 00F8 00FF
        XORR    R2,     R0                      ; 5207   01D0
        MVO@    R0,     R1                      ; 5208   0248
        PULR    R7                              ; 5209   02B7
L_520A:
        DECR    R7                              ; 520A   0017

        EIS                                     ; 520B   0002
        DECR    R2                              ; 520C   0012
        CLRC                                    ; 520D   0006
        SETC                                    ; 520E   0007
L_520F:
        MVI     G_016E, R0                      ; 520F   0280 016E
        TSTR    R0                              ; 5211   0080
        BNEQ    L_52F5                          ; 5212   020C 00E1

        MVI     G_016A, R0                      ; 5214   0280 016A

        JSR     R5,     .EXEC.76C               ; 5216   0004 0114 036C

        SDBD                                    ; 5219   0001
        MVII    #$5030, R2                      ; 521A   02BA 0030 0050
        SDBD                                    ; 521D   0001
        MVII    #$4828, R4                      ; 521E   02BC 0028 0048

        JSR     R5,     .EXEC.6F7               ; 5221   0004 0114 02F7

        BNC     L_5230                          ; 5224   0209 000A

        MOVR    R1,     R3                      ; 5226   008B
        MVI     G_016B, R0                      ; 5227   0280 016B
        TSTR    R0                              ; 5229   0080
        BEQ     L_525F                          ; 522A   0204 0033

        DECR    R0                              ; 522C   0010
        MVO     R0,     G_016B                  ; 522D   0240 016B
        PULR    R7                              ; 522F   02B7

L_5230:
        MVII    #$0002, R0                      ; 5230   02B8 0002

        JSR     R5,     X_RAND1                 ; 5232   0004 0114 027D

        TSTR    R0                              ; 5235   0080
        BNEQ    L_52F5                          ; 5236   020C 00BD

        MVII    #$0007, R0                      ; 5238   02B8 0007

        JSR     R5,     X_RAND1                 ; 523A   0004 0114 027D

        MOVR    R0,     R2                      ; 523D   0082
        MVII    #$00FF, R3                      ; 523E   02BB 00FF
        TSTR    R4                              ; 5240   00A4
        BMI     L_524B                          ; 5241   020B 0008

        ADDI    #$0010, R2                      ; 5243   02FA 0010
        SWAP    R2,     1                       ; 5245   0042
        XORI    #$005F, R2                      ; 5246   03FA 005F
        SWAP    R3,     1                       ; 5248   0043
        B       L_5253                          ; 5249   0200 0008

L_524B:
        ANDI    #$003F, R2                      ; 524B   03BA 003F
        ADDI    #$0010, R2                      ; 524D   02FA 0010
        SDBD                                    ; 524F   0001
        XORI    #$9F00, R2                      ; 5250   03FA 0000 009F
L_5253:
        MVI     G_035E, R0                      ; 5253   0280 035E
        RRC     R0,     1                       ; 5255   0070
        BNC     L_5259                          ; 5256   0209 0001

        ANDR    R3,     R2                      ; 5258   019A
L_5259:
        MVI     G_016C, R3                      ; 5259   0283 016C

        JSR     R5,     .EXEC.9A3               ; 525B   0004 0118 01A3

        PULR    R7                              ; 525E   02B7

L_525F:
        JSR     R5,     L_55CB                  ; 525F   0004 0154 01CB

        MOVR    R1,     R4                      ; 5262   008C
        BEQ     L_52F5                          ; 5263   0204 0090

        MVII    #$0014, R0                      ; 5265   02B8 0014
        SUB     G_016C, R0                      ; 5267   0300 016C
        MVO     R0,     G_016B                  ; 5269   0240 016B
        MVI     G_0179, R2                      ; 526B   0282 0179
        CMPI    #$000D, R2                      ; 526D   037A 000D
        BLT     L_5286                          ; 526F   0205 0015

        SDBD                                    ; 5271   0001
        ADDI    #$5A4F, R2                      ; 5272   02FA 004F 005A
        MVI@    R2,     R0                      ; 5275   0290

        JSR     R5,     X_RAND2                 ; 5276   0004 0114 029E

        TSTR    R0                              ; 5279   0080
        BNEQ    L_5286                          ; 527A   020C 000A

        MVI     G_0184, R0                      ; 527C   0280 0184
        TSTR    R0                              ; 527E   0080
        BNEQ    L_5286                          ; 527F   020C 0005

        JSR     R5,     .EXEC.766               ; 5281   0004 0114 0366

        MVO     R0,     G_0184                  ; 5284   0240 0184
L_5286:
        INCR    R4                              ; 5286   000C
        SDBD                                    ; 5287   0001
        MVII    #$5D1E, R0                      ; 5288   02B8 001E 005D
        MVO@    R0,     R4                      ; 528B   0260
        MOVR    R3,     R1                      ; 528C   0099
        ADDI    #$0002, R1                      ; 528D   02F9 0002
        MVI@    R1,     R0                      ; 528F   0288
        MVO@    R0,     R4                      ; 5290   0260
        INCR    R1                              ; 5291   0009
        MVI@    R1,     R0                      ; 5292   0288
        MVO@    R0,     R4                      ; 5293   0260
        INCR    R4                              ; 5294   000C
        MVI     G_035E, R0                      ; 5295   0280 035E
        ANDI    #$0003, R0                      ; 5297   03B8 0003
        MVO@    R0,     R4                      ; 5299   0260
        MVI     G_017A, R0                      ; 529A   0280 017A
        SLL     R0,     1                       ; 529C   0048
        MVO@    R0,     R4                      ; 529D   0260
        SUBI    #$0003, R4                      ; 529E   033C 0003
        CLRR    R0                              ; 52A0   01C0
        MVO@    R0,     R4                      ; 52A1   0260
        MVI     G_035E, R2                      ; 52A2   0282 035E
        ANDI    #$0300, R2                      ; 52A4   03BA 0300
        SLL     R2,     1                       ; 52A6   004A

        JSR     R5,     L_5129                  ; 52A7   0004 0150 0129

        SDBD                                    ; 52AA   0001
        XORI    #$5848, R0                      ; 52AB   03F8 0048 0058
        XORR    R2,     R0                      ; 52AE   01D0
        SUBI    #$0005, R4                      ; 52AF   033C 0005
        MVO@    R0,     R4                      ; 52B1   0260
        J       L_5D7F                          ; 52B2   0004 035C 017F

L_52B5:
        MVI@    R2,     R0                      ; 52B5   0290
        SLL     R0,     1                       ; 52B6   0048

        JSR     R5,     X_RAND2                 ; 52B7   0004 0114 029E

        TSTR    R0                              ; 52BA   0080
        BNEQ    L_52F5                          ; 52BB   020C 0038

        INCR    R1                              ; 52BD   0009
        SDBD                                    ; 52BE   0001
        MVII    #$5D25, R0                      ; 52BF   02B8 0025 005D
        MVO@    R0,     R1                      ; 52C2   0248
        ADDI    #$0003, R1                      ; 52C3   02F9 0003
        MVI     G_0179, R2                      ; 52C5   0282 0179
        CMPI    #$0005, R2                      ; 52C7   037A 0005
        BLT     L_52F5                          ; 52C9   0205 002A

        SDBD                                    ; 52CB   0001
        ADDI    #$5A18, R2                      ; 52CC   02FA 0018 005A
        MVI@    R2,     R0                      ; 52CF   0290
        SLR     R0,     2                       ; 52D0   0064
        MOVR    R1,     R4                      ; 52D1   008C

        JSR     R5,     L_513F                  ; 52D2   0004 0150 013F

        MOVR    R1,     R2                      ; 52D5   008A
        MVII    #$0008, R0                      ; 52D6   02B8 0008
        MVO@    R0,     R2                      ; 52D8   0250
        CLRR    R0                              ; 52D9   01C0

        JSR     R5,     L_55CB                  ; 52DA   0004 0154 01CB

        TSTR    R1                              ; 52DD   0089
        MVO@    R0,     R2                      ; 52DE   0250
        BEQ     L_52F5                          ; 52DF   0204 0014

        INCR    R4                              ; 52E1   000C
        MVII    #$0200, R3                      ; 52E2   02BB 0200
        MVO@    R3,     R4                      ; 52E4   0263
        SUBI    #$0006, R4                      ; 52E5   033C 0006
        SDBD                                    ; 52E7   0001
        MVII    #$584F, R0                      ; 52E8   02B8 004F 0058
        MVO@    R0,     R4                      ; 52EB   0260
        DECR    R4                              ; 52EC   0014
        MVII    #$0005, R0                      ; 52ED   02B8 0005

        JSR     R5,     .EXEC.730               ; 52EF   0004 0114 0330

        XORI    #$0102, R3                      ; 52F2   03FB 0102
        MVO@    R3,     R5                      ; 52F4   026B
L_52F5:
        PULR    R7                              ; 52F5   02B7

        PSHR    R5                              ; 52F6   0275
        MOVR    R1,     R4                      ; 52F7   008C
        MVI@    R1,     R2                      ; 52F8   028A
        ANDI    #$0008, R2                      ; 52F9   03BA 0008
        BEQ     L_533C                          ; 52FB   0204 003F

        MVI     G_031F, R0                      ; 52FD   0280 031F
        SWAP    R0,     1                       ; 52FF   0040
        MVI     G_0320, R1                      ; 5300   0281 0320
        SWAP    R1,     1                       ; 5302   0041

        JSR     R5,     X_PACK_BYTES            ; 5303   0004 0114 034F

        MOVR    R0,     R2                      ; 5306   0082
        MVI     G_0179, R5                      ; 5307   0285 0179
        SDBD                                    ; 5309   0001
        ADDI    #$5A3B, R5                      ; 530A   02FD 003B 005A
        MVI@    R5,     R3                      ; 530D   02AB
        SLR     R3,     2                       ; 530E   0067
        MOVR    R3,     R0                      ; 530F   0098
        SLR     R3,     1                       ; 5310   0063

        JSR     R5,     X_RAND2                 ; 5311   0004 0114 029E

        ADDR    R0,     R3                      ; 5314   00C3
        MOVR    R4,     R1                      ; 5315   00A1

        JSR     R5,     .EXEC.9A3               ; 5316   0004 0118 01A3

        MOVR    R4,     R1                      ; 5319   00A1

        JSR     R5,     .EXEC.766               ; 531A   0004 0114 0366

        CMP     G_0184, R0                      ; 531D   0340 0184
        BEQ     L_533D                          ; 531F   0204 001C

        INCR    R4                              ; 5321   000C
        MVI@    R4,     R0                      ; 5322   02A0
        SDBD                                    ; 5323   0001
        CMPI    #$5D2C, R0                      ; 5324   0378 002C 005D
        BEQ     L_5337                          ; 5327   0204 000E

        MVI     G_0179, R5                      ; 5329   0285 0179
        SDBD                                    ; 532B   0001
        ADDI    #$5A3B, R5                      ; 532C   02FD 003B 005A
        MVI@    R5,     R0                      ; 532F   02A8
        SLR     R0,     2                       ; 5330   0064

        JSR     R5,     X_RAND2                 ; 5331   0004 0114 029E

        TSTR    R0                              ; 5334   0080
        BEQ     L_533C                          ; 5335   0204 0005

L_5337:
        ADDI    #$0004, R4                      ; 5337   02FC 0004
        MVII    #$0004, R0                      ; 5339   02B8 0004
        MVO@    R0,     R4                      ; 533B   0260
L_533C:
        PULR    R7                              ; 533C   02B7

L_533D:
        JSR     R5,     L_5129                  ; 533D   0004 0150 0129

        MVI@    R4,     R3                      ; 5340   02A3
        SDBD                                    ; 5341   0001
        ANDI    #$FFF8, R3                      ; 5342   03BB 00F8 00FF
        XORR    R0,     R3                      ; 5345   01C3
        DECR    R4                              ; 5346   0014
        MVO@    R3,     R4                      ; 5347   0263
        INCR    R4                              ; 5348   000C
        B       L_5337                          ; 5349   0220 0013

L_534B:
        PSHR    R5                              ; 534B   0275
        MVI     G_0165, R0                      ; 534C   0280 0165
        ADD     G_017D, R0                      ; 534E   02C0 017D
        ANDI    #$000F, R0                      ; 5350   03B8 000F
        MVO     R0,     G_0165                  ; 5352   0240 0165
        J       L_5390                          ; 5354   0004 0350 0390

        PSHR    R5                              ; 5357   0275
        MOVR    R1,     R3                      ; 5358   008B

        JSR     R5,     L_55CB                  ; 5359   0004 0154 01CB

        TSTR    R1                              ; 535C   0089
        BNEQ    L_536B                          ; 535D   020C 000C

        ADDI    #$0004, R3                      ; 535F   02FB 0004
        MVI@    R3,     R0                      ; 5361   0298

        JSR     R5,     X_UNPK_BYTES            ; 5362   0004 0114 0357

        NEGR    R0                              ; 5365   0020
        NEGR    R1                              ; 5366   0021

        JSR     R5,     X_PACK_BYTES            ; 5367   0004 0114 034F

        MVO@    R0,     R3                      ; 536A   0258
L_536B:
        PULR    R7                              ; 536B   02B7

        PSHR    R5                              ; 536C   0275
        MVI     G_017F, R1                      ; 536D   0281 017F
        TSTR    R1                              ; 536F   0089
        BEQ     L_5390                          ; 5370   0204 001E

        MVII    #$0080, R1                      ; 5372   02B9 0080
        TSTR    R0                              ; 5374   0080
        BPL     L_537A                          ; 5375   0203 0003

L_5377:
        MVO     R1,     G_012E                  ; 5377   0241 012E
        PULR    R7                              ; 5379   02B7

L_537A:
        ADDI    #$000C, R0                      ; 537A   02F8 000C
        ANDI    #$000F, R0                      ; 537C   03B8 000F
        BEQ     L_5377                          ; 537E   0224 0008

        SUBI    #$0008, R0                      ; 5380   0338 0008
        BEQ     L_5377                          ; 5382   0224 000C

        MVII    #$0001, R2                      ; 5384   02BA 0001
        BMI     L_5389                          ; 5386   020B 0001

        NEGR    R2                              ; 5388   0022
L_5389:
        MVO     R2,     G_017D                  ; 5389   0242 017D
        CLRR    R1                              ; 538B   01C9
        MVO     R1,     G_012E                  ; 538C   0241 012E
        PULR    R7                              ; 538E   02B7

L_538F:
        PSHR    R5                              ; 538F   0275
L_5390:
        TSTR    R0                              ; 5390   0080
        BMI     L_53A7                          ; 5391   020B 0014

        MVO     R0,     G_0165                  ; 5393   0240 0165
        MOVR    R0,     R1                      ; 5395   0081
        ANDI    #$0007, R1                      ; 5396   03B9 0007
        MVO     R1,     G_0322                  ; 5398   0241 0322
        SDBD                                    ; 539A   0001
        MVII    #$1859, R2                      ; 539B   02BA 0059 0018
        SUBR    R1,     R0                      ; 539E   0108
        BNEQ    L_53A5                          ; 539F   020C 0004

        SDBD                                    ; 53A1   0001
        XORI    #$0600, R2                      ; 53A2   03FA 0000 0006
L_53A5:
        MVO     R2,     G_031D                  ; 53A5   0242 031D
L_53A7:
        PULR    R7                              ; 53A7   02B7

L_53A8:
        PSHR    R5                              ; 53A8   0275
        MVI     G_017C, R2                      ; 53A9   0282 017C
        TSTR    R2                              ; 53AB   0092
        BNEQ    L_5544                          ; 53AC   020C 0196

        MVO     R2,     .PSG0.chn_c_vol         ; 53AE   0242 01FD
        INCR    R0                              ; 53B0   0008
        BEQ     L_53D8                          ; 53B1   0204 0025

        JSR     R5,     L_5447                  ; 53B3   0004 0154 0047

        MVII    #$000A, R2                      ; 53B6   02BA 000A
        MVO     R2,     .PSG0.chn_c_vol         ; 53B8   0242 01FD
        MVII    #$0015, R2                      ; 53BA   02BA 0015
        MVO     R2,     .PSG0.chan_enable       ; 53BC   0242 01F8
        SDBD                                    ; 53BE   0001
        MVII    #$5A18, R1                      ; 53BF   02B9 0018 005A
        ADD     G_0179, R1                      ; 53C2   02C1 0179
        MVI@    R1,     R0                      ; 53C4   0288

        JSR     R5,     X_CLAMP                 ; 53C5   0004 0114 0270
        DECLE   $0000                           ; 53C8   0000

        RSWD    R4                              ; 53C9   003C
        MVI     G_0165, R1                      ; 53CA   0281 0165
        ADDI    #$0008, R1                      ; 53CC   02F9 0008
        ANDI    #$000F, R1                      ; 53CE   03B9 000F

        JSR     R5,     .EXEC.629               ; 53D0   0004 0114 0229

        MVI     G_017B, R2                      ; 53D3   0282 017B
        TSTR    R2                              ; 53D5   0092
        BEQ     L_53E6                          ; 53D6   0204 000E

L_53D8:
        PSHR    R0                              ; 53D8   0270
        MVII    #$0187, R3                      ; 53D9   02BB 0187
        MVII    #$0166, R4                      ; 53DB   02BC 0166

        JSR     R5,     L_53EE                  ; 53DD   0004 0150 03EE

        PULR    R0                              ; 53E0   02B0
        SWAP    R0,     1                       ; 53E1   0040
        MVII    #$018A, R3                      ; 53E2   02BB 018A
        B       L_53EF                          ; 53E4   0200 0009

L_53E6:
        JSR     R5,     X_UNPK_BYTES            ; 53E6   0004 0114 0357

        MVO     R1,     G_018A                  ; 53E9   0241 018A
        MVO     R0,     G_0187                  ; 53EB   0240 0187
        PULR    R7                              ; 53ED   02B7

L_53EE:
        PSHR    R5                              ; 53EE   0275
L_53EF:
        SDBD                                    ; 53EF   0001
        ANDI    #$FF00, R0                      ; 53F0   03B8 0000 00FF
        SAR     R0,     2                       ; 53F3   006C
        SAR     R0,     2                       ; 53F4   006C
        SAR     R0,     2                       ; 53F5   006C
        SDBD                                    ; 53F6   0001
        ADD@    R4,     R0                      ; 53F7   02E0
        MOVR    R0,     R1                      ; 53F8   0081
        BPL     L_53FC                          ; 53F9   0203 0001

        NEGR    R1                              ; 53FB   0021
L_53FC:
        SDBD                                    ; 53FC   0001
        MVII    #$7800, R2                      ; 53FD   02BA 0000 0078
        CMPR    R1,     R2                      ; 5400   014A
        BGT     L_5408                          ; 5401   020E 0005

        TSTR    R0                              ; 5403   0080
        BPL     L_5407                          ; 5404   0203 0001

        NEGR    R2                              ; 5406   0022
L_5407:
        MOVR    R2,     R0                      ; 5407   0090
L_5408:
        SUBI    #$0002, R4                      ; 5408   033C 0002
        MVO@    R0,     R4                      ; 540A   0260
        SWAP    R0,     1                       ; 540B   0040
        MVO@    R0,     R4                      ; 540C   0260
        MVO@    R0,     R3                      ; 540D   0258
        PULR    R7                              ; 540E   02B7

L_540F:
        MVII    #$0001, R0                      ; 540F   02B8 0001
        PSHR    R5                              ; 5411   0275
        DECR    R0                              ; 5412   0010
        BNEQ    L_5446                          ; 5413   020C 0031

        MVI     G_017C, R2                      ; 5415   0282 017C
        TSTR    R2                              ; 5417   0092
        BNEQ    L_5446                          ; 5418   020C 002C

        JSR     R5,     L_548E                  ; 541A   0004 0154 008E

        TSTR    R1                              ; 541D   0089
        BEQ     L_5446                          ; 541E   0204 0026

        MOVR    R1,     R3                      ; 5420   008B
        MOVR    R1,     R4                      ; 5421   008C
        ADDI    #$0002, R4                      ; 5422   02FC 0002
        MVI     G_031F, R0                      ; 5424   0280 031F
        MVO@    R0,     R4                      ; 5426   0260
        MVI     G_0320, R0                      ; 5427   0280 0320
        MVO@    R0,     R4                      ; 5429   0260
        MVI     G_0179, R1                      ; 542A   0281 0179
        SLR     R1,     2                       ; 542C   0065
        SDBD                                    ; 542D   0001
        ADDI    #$5A2C, R1                      ; 542E   02F9 002C 005A
        MOVR    R1,     R2                      ; 5431   008A
        MVI@    R1,     R0                      ; 5432   0288
        MVI     G_0165, R1                      ; 5433   0281 0165

        JSR     R5,     .EXEC.629               ; 5435   0004 0114 0229

        MVO@    R0,     R4                      ; 5438   0260
        ADDI    #$0005, R2                      ; 5439   02FA 0005
        MVI@    R2,     R0                      ; 543B   0290
        MVO@    R0,     R4                      ; 543C   0260
        ADDI    #$0005, R2                      ; 543D   02FA 0005
        MVI@    R2,     R0                      ; 543F   0290
        MVO@    R0,     R4                      ; 5440   0260
        SDBD                                    ; 5441   0001
        MVII    #$184D, R0                      ; 5442   02B8 004D 0018
        MVO@    R0,     R3                      ; 5445   0258
L_5446:
        PULR    R7                              ; 5446   02B7

L_5447:
        PSHR    R5                              ; 5447   0275
        MVII    #$0355, R4                      ; 5448   02BC 0355
        MOVR    R4,     R3                      ; 544A   00A3
        MVI@    R4,     R0                      ; 544B   02A0
        MOVR    R0,     R2                      ; 544C   0082
        ANDI    #$0008, R0                      ; 544D   03B8 0008
        BNEQ    L_548D                          ; 544F   020C 003C

        SDBD                                    ; 5451   0001
        ANDI    #$0600, R2                      ; 5452   03BA 0000 0006
        MVI     G_0165, R2                      ; 5455   0282 0165
        BNEQ    L_545B                          ; 5457   020C 0002

        ADDI    #$0008, R2                      ; 5459   02FA 0008
L_545B:
        ADDI    #$0002, R2                      ; 545B   02FA 0002
        ANDI    #$000F, R2                      ; 545D   03BA 000F
        SLR     R2,     2                       ; 545F   0066
        MVI     G_031F, R0                      ; 5460   0280 031F
        MVI     G_0320, R1                      ; 5462   0281 0320
        TSTR    R2                              ; 5464   0092
        BEQ     L_5471                          ; 5465   0204 000A

        DECR    R2                              ; 5467   0012
        BEQ     L_546F                          ; 5468   0204 0005

        ADDI    #$0300, R1                      ; 546A   02F9 0300
        RRC     R2,     1                       ; 546C   0072
        BNC     L_5471                          ; 546D   0209 0002

L_546F:
        SUBI    #$0300, R0                      ; 546F   0338 0300
L_5471:
        INCR    R4                              ; 5471   000C
        ADDI    #$0100, R0                      ; 5472   02F8 0100
        MVO@    R0,     R4                      ; 5474   0260
        MVO@    R1,     R4                      ; 5475   0261
        MVII    #$0006, R0                      ; 5476   02B8 0006
        MVI     G_0165, R1                      ; 5478   0281 0165
        ADDI    #$0008, R1                      ; 547A   02F9 0008
        ANDI    #$000F, R1                      ; 547C   03B9 000F

        JSR     R5,     .EXEC.629               ; 547E   0004 0114 0229

        MVO@    R0,     R4                      ; 5481   0260
        MVII    #$03F0, R0                      ; 5482   02B8 03F0
        MVO@    R0,     R4                      ; 5484   0260
        MVII    #$0004, R0                      ; 5485   02B8 0004
        MVO@    R0,     R4                      ; 5487   0260
        SDBD                                    ; 5488   0001
        MVII    #$181C, R0                      ; 5489   02B8 001C 0018
        MVO@    R0,     R3                      ; 548C   0258
L_548D:
        PULR    R7                              ; 548D   02B7

L_548E:
        MVII    #$0325, R1                      ; 548E   02B9 0325
        MVI@    R1,     R0                      ; 5490   0288
        ANDI    #$0008, R0                      ; 5491   03B8 0008
        BEQ     L_549D                          ; 5493   0204 0008

        MVII    #$032D, R1                      ; 5495   02B9 032D
        MVI@    R1,     R0                      ; 5497   0288
        ANDI    #$0008, R0                      ; 5498   03B8 0008
        BEQ     L_549D                          ; 549A   0204 0001

        CLRR    R1                              ; 549C   01C9
L_549D:
        MOVR    R5,     R7                      ; 549D   00AF

        PSHR    R5                              ; 549E   0275
L_549F:
        MVI     G_0130, R2                      ; 549F   0282 0130
        SUBI    #$0080, R2                      ; 54A1   033A 0080
        BNEQ    L_551B                          ; 54A3   020C 0076

        SLL     R0,     1                       ; 54A5   0048
        ADDR    R0,     R7                      ; 54A6   00C7
        B       L_54BD                          ; 54A7   0200 0014
        B       L_54BE                          ; 54A9   0200 0013
        B       L_54C4                          ; 54AB   0200 0017
        B       L_54BD                          ; 54AD   0200 000E
        B       L_54F6                          ; 54AF   0200 0045
        B       L_54F9                          ; 54B1   0200 0046
        B       L_54BD                          ; 54B3   0200 0008
        B       L_5502                          ; 54B5   0200 004B
        B       L_5503                          ; 54B7   0200 004A
        B       L_54CB                          ; 54B9   0200 0010
        B       L_5506                          ; 54BB   0200 0049
L_54BD:
        PULR    R7                              ; 54BD   02B7

L_54BE:
        INCR    R0                              ; 54BE   0008
        MVO     R0,     G_015D                  ; 54BF   0240 015D
        MVO     R2,     G_012C                  ; 54C1   0242 012C
        PULR    R7                              ; 54C3   02B7

L_54C4:
        MVO     R2,     G_015D                  ; 54C4   0242 015D
        MVII    #$0080, R0                      ; 54C6   02B8 0080
        MVO     R0,     G_012C                  ; 54C8   0240 012C
        PULR    R7                              ; 54CA   02B7

L_54CB:
        MVI     G_017C, R0                      ; 54CB   0280 017C
        XOR     G_016E, R0                      ; 54CD   03C0 016E
        BNEQ    L_551B                          ; 54CF   020C 004A

        MVII    #$00C8, R0                      ; 54D1   02B8 00C8
        NEGR    R0                              ; 54D3   0020

        JSR     R5,     L_5830                  ; 54D4   0004 0158 0030

        TSTR    R0                              ; 54D7   0080
        BEQ     L_54DD                          ; 54D8   0204 0003
        J       X_PLAY_RAZZ2                    ; 54DA   0004 031C 02BD

L_54DD:
        MVO     R2,     G_0187                  ; 54DD   0242 0187
        MVO     R2,     G_018A                  ; 54DF   0242 018A
        MVO     R2,     G_0182                  ; 54E1   0242 0182

        JSR     R5,     L_5E0B                  ; 54E3   0004 015C 020B

        MVII    #$0003, R3                      ; 54E6   02BB 0003

        JSR     R5,     L_552F                  ; 54E8   0004 0154 012F

        SDBD                                    ; 54EB   0001
        MVII    #$551A, R1                      ; 54EC   02B9 001A 0055
        MVO     R1,     G_035C                  ; 54EF   0241 035C
        CLRR    R2                              ; 54F1   01D2
        MVO     R2,     G_0130                  ; 54F2   0242 0130
        B       L_54FB                          ; 54F4   0200 0005

L_54F6:
        MVO     R0,     G_017B                  ; 54F6   0240 017B
        PULR    R7                              ; 54F8   02B7

L_54F9:
        MVO     R2,     G_017B                  ; 54F9   0242 017B
L_54FB:
        MVII    #$0166, R4                      ; 54FB   02BC 0166
        MVO@    R2,     R4                      ; 54FD   0262
        MVO@    R2,     R4                      ; 54FE   0262
        MVO@    R2,     R4                      ; 54FF   0262
        MVO@    R2,     R4                      ; 5500   0262
        PULR    R7                              ; 5501   02B7

L_5502:
        INCR    R2                              ; 5502   000A
L_5503:
        MVO     R2,     G_017F                  ; 5503   0242 017F
        PULR    R7                              ; 5505   02B7

L_5506:
        MVII    #$0001, R0                      ; 5506   02B8 0001
        MVO     R0,     G_017C                  ; 5508   0240 017C

        JSR     R5,     L_55DC                  ; 550A   0004 0154 01DC

        SDBD                                    ; 550D   0001
        MVII    #$1906, R1                      ; 550E   02B9 0006 0019
        MVO     R1,     G_035D                  ; 5511   0241 035D
        MVII    #$0014, R1                      ; 5513   02B9 0014
        MVO     R1,     G_0323                  ; 5515   0241 0323
        CLRR    R0                              ; 5517   01C0

        JSR     R5,     L_5830                  ; 5518   0004 0158 0030

L_551B:
        PULR    R7                              ; 551B   02B7

        DECLE   $0269,  $00AC,  $0254,  $00C2   ; 551C   0269 00AC 0254 00C2
        DECLE   $023F,  $00EA,  $022A,  $0106   ; 5520   023F 00EA 022A 0106
        DECLE   $0215,  $012E,  $0000,  $0000   ; 5524   0215 012E 0000 0000
        DECLE   $0215,  $0125,  $023F           ; 5528   0215 0125 023F

        ADDR    R4,     R1                      ; 552B   00E1
        MVO@    R1,     R5                      ; 552C   0269
        MOVR    R5,     R7                      ; 552D   00AF

        DECLE   $0001                           ; 552E   0001
L_552F:
        PSHR    R5                              ; 552F   0275
L_5530:
        MVII    #$0200, R1                      ; 5530   02B9 0200
        MVI@    R1,     R0                      ; 5532   0288
        SDBD                                    ; 5533   0001
        XORI    #$2000, R0                      ; 5534   03F8 0000 0020
        MVO@    R0,     R1                      ; 5537   0248
        INCR    R1                              ; 5538   0009
        MVO     R3,     G_017C                  ; 5539   0243 017C
L_553B:
        MVI@    R1,     R0                      ; 553B   0288
        XORI    #$0007, R0                      ; 553C   03F8 0007
        MVO@    R0,     R1                      ; 553E   0248
        INCR    R1                              ; 553F   0009
        CMPI    #$02F0, R1                      ; 5540   0379 02F0
        BNEQ    L_553B                          ; 5542   022C 0008
L_5544:
        PULR    R7                              ; 5544   02B7

L_5545:
        PSHR    R5                              ; 5545   0275
        MVI     G_035C, R4                      ; 5546   0284 035C
        MVI     G_0182, R0                      ; 5548   0280 0182
        XORI    #$0001, R0                      ; 554A   03F8 0001
        MVO     R0,     G_0182                  ; 554C   0240 0182
        BEQ     L_5554                          ; 554E   0204 0004

        ADDI    #$0002, R4                      ; 5550   02FC 0002
        MVO     R4,     G_035C                  ; 5552   0244 035C
L_5554:
        MVI@    R4,     R2                      ; 5554   02A2
        TSTR    R2                              ; 5555   0092
        BNEQ    L_5572                          ; 5556   020C 001A

        TSTR    R0                              ; 5558   0080
        BNEQ    L_5561                          ; 5559   020C 0006

        MVII    #$0020, R0                      ; 555B   02B8 0020
        SWAP    R0,     1                       ; 555D   0040
        MVO     R0,     .BTAB.00                ; 555E   0240 0200
        PULR    R7                              ; 5560   02B7

L_5561:
        CLRR    R0                              ; 5561   01C0
        MVO     R0,     .BTAB.00                ; 5562   0240 0200

        JSR     R5,     L_55C0                  ; 5564   0004 0154 01C0

        MVII    #$0008, R0                      ; 5567   02B8 0008
        MVO     R0,     G_0323                  ; 5569   0240 0323
        SDBD                                    ; 556B   0001
        MVII    #$5D08, R0                      ; 556C   02B8 0008 005D
        MVO     R0,     G_031E                  ; 556F   0240 031E
        PULR    R7                              ; 5571   02B7

L_5572:
        CMPI    #$0001, R2                      ; 5572   037A 0001
        BNEQ    L_557D                          ; 5574   020C 0007

        CLRR    R3                              ; 5576   01DB
        MVII    #$0080, R0                      ; 5577   02B8 0080
        MVO     R0,     G_0130                  ; 5579   0240 0130
        B       L_5530                          ; 557B   0220 004C

L_557D:
        MVI@    R4,     R3                      ; 557D   02A3
        MOVR    R3,     R0                      ; 557E   0098
        ANDI    #$000F, R0                      ; 557F   03B8 000F

        JSR     R5,     L_59C0                  ; 5581   0004 0158 01C0

        SLR     R3,     2                       ; 5584   0067
        SLR     R3,     2                       ; 5585   0067
        MOVR    R3,     R1                      ; 5586   0099
        ADDR    R2,     R3                      ; 5587   00D3
        SUBI    #$0008, R1                      ; 5588   0339 0008
        SDBD                                    ; 558A   0001
        MVII    #$2000, R4                      ; 558B   02BC 0000 0020
L_558E:
        MVI@    R2,     R0                      ; 558E   0290
        XORR    R4,     R0                      ; 558F   01E0
        MVI@    R3,     R0                      ; 5590   0298
        XORR    R4,     R0                      ; 5591   01E0
        MVO@    R0,     R2                      ; 5592   0250
        MVO@    R0,     R3                      ; 5593   0258
        ADDI    #$0014, R2                      ; 5594   02FA 0014
        ADDI    #$0014, R3                      ; 5596   02FB 0014
        DECR    R1                              ; 5598   0011
        BNEQ    L_558E                          ; 5599   022C 000C
        PULR    R7                              ; 559B   02B7

L_559C:
        PSHR    R5                              ; 559C   0275
        PSHR    R1                              ; 559D   0271
        MOVR    R0,     R3                      ; 559E   0083

        JSR     R5,     .EXEC.76C               ; 559F   0004 0114 036C

        MVI@    R1,     R0                      ; 55A2   0288
        ANDI    #$0008, R0                      ; 55A3   03B8 0008
        MVI@    R1,     R0                      ; 55A5   0288
        BEQ     L_55BE                          ; 55A6   0204 0016

        SDBD                                    ; 55A8   0001
        ANDI    #$E7F7, R0                      ; 55A9   03B8 00F7 00E7
        MVO@    R0,     R1                      ; 55AC   0248
        MOVR    R3,     R2                      ; 55AD   009A
        XOR     G_016A, R2                      ; 55AE   03C2 016A
        BNEQ    L_55B4                          ; 55B0   020C 0002

        MVO     R2,     G_016A                  ; 55B2   0242 016A
L_55B4:
        XOR     G_0184, R3                      ; 55B4   03C3 0184
        BNEQ    L_55BA                          ; 55B6   020C 0002

        MVO     R3,     G_0184                  ; 55B8   0243 0184
L_55BA:
        ADDI    #$0005, R1                      ; 55BA   02F9 0005
        CLRR    R3                              ; 55BC   01DB
        MVO@    R3,     R1                      ; 55BD   024B
L_55BE:
        PULR    R1                              ; 55BE   02B1
        PULR    R7                              ; 55BF   02B7

L_55C0:
        PSHR    R5                              ; 55C0   0275
        MVII    #$0007, R1                      ; 55C1   02B9 0007
L_55C3:
        MOVR    R1,     R0                      ; 55C3   0088

        JSR     R5,     L_559C                  ; 55C4   0004 0154 019C

        DECR    R1                              ; 55C7   0011
        BPL     L_55C3                          ; 55C8   0223 0006
        PULR    R7                              ; 55CA   02B7

L_55CB:
        PSHR    R0                              ; 55CB   0270
        MVII    #$0335, R1                      ; 55CC   02B9 0335
L_55CE:
        MVI@    R1,     R0                      ; 55CE   0288
        ANDI    #$0008, R0                      ; 55CF   03B8 0008
        BEQ     L_55DA                          ; 55D1   0204 0007

        ADDI    #$0008, R1                      ; 55D3   02F9 0008
        CMPI    #$034D, R1                      ; 55D5   0379 034D
        BLE     L_55CE                          ; 55D7   0226 000A

        CLRR    R1                              ; 55D9   01C9
L_55DA:
        PULR    R0                              ; 55DA   02B0
        MOVR    R5,     R7                      ; 55DB   00AF

L_55DC:
        CLRR    R2                              ; 55DC   01D2
        MVO     R2,     G_0187                  ; 55DD   0242 0187
        MVO     R2,     G_018A                  ; 55DF   0242 018A
        INCR    R2                              ; 55E1   000A
        B       L_55E5                          ; 55E2   0200 0001

L_55E4:
        CLRR    R2                              ; 55E4   01D2
L_55E5:
        MVII    #$031D, R1                      ; 55E5   02B9 031D
L_55E7:
        MVI@    R1,     R0                      ; 55E7   0288
        SLL     R0,     1                       ; 55E8   0048
        SETC                                    ; 55E9   0007
        TSTR    R2                              ; 55EA   0092
        BNEQ    L_55EE                          ; 55EB   020C 0001

        CLRC                                    ; 55ED   0006
L_55EE:
        RRC     R0,     1                       ; 55EE   0070
        MVO@    R0,     R1                      ; 55EF   0248
        ADDI    #$0008, R1                      ; 55F0   02F9 0008
        CMPI    #$0355, R1                      ; 55F2   0379 0355
        BLE     L_55E7                          ; 55F4   0226 000E
        MOVR    R5,     R7                      ; 55F6   00AF

L_55F7:
        PSHR    R5                              ; 55F7   0275
L_55F8:
        MOVR    R4,     R3                      ; 55F8   00A3
        PSHR    R1                              ; 55F9   0271

        JSR     R5,     X_MPY                   ; 55FA   0004 011C 01DC

        ADDR    R2,     R3                      ; 55FD   00D3
        PULR    R2                              ; 55FE   02B2
        DECR    R2                              ; 55FF   0012
L_5600:
        MVII    #$0004, R0                      ; 5600   02B8 0004

        JSR     R5,     X_RAND2                 ; 5602   0004 0114 029E

        TSTR    R0                              ; 5605   0080
        BEQ     L_560B                          ; 5606   0204 0003

        CLRR    R0                              ; 5608   01C0
        B       L_5627                          ; 5609   0200 001C

L_560B:
        MVII    #$0003, R0                      ; 560B   02B8 0003

        JSR     R5,     X_RAND1                 ; 560D   0004 0114 027D

        XORI    #$0100, R0                      ; 5610   03F8 0100
        SLL     R0,     2                       ; 5612   004C
        SLL     R0,     1                       ; 5613   0048
        SDBD                                    ; 5614   0001
        CMPI    #$0838, R0                      ; 5615   0378 0038 0008
        BNEQ    L_5625                          ; 5618   020C 000B

        MVII    #$0003, R0                      ; 561A   02B8 0003

        JSR     R5,     X_RAND1                 ; 561C   0004 0114 027D

        SDBD                                    ; 561F   0001
        XORI    #$1838, R0                      ; 5620   03F8 0038 0018
        B       L_5627                          ; 5623   0200 0002

L_5625:
        XORI    #$0007, R0                      ; 5625   03F8 0007
L_5627:
        MVO@    R0,     R4                      ; 5627   0260
        ADDR    R2,     R4                      ; 5628   00D4
        CMPR    R3,     R4                      ; 5629   015C
        BLT     L_5600                          ; 562A   0225 002B
        PULR    R7                              ; 562C   02B7

L_562D:
        PSHR    R5                              ; 562D   0275
        SDBD                                    ; 562E   0001
        MVII    #$5642, R3                      ; 562F   02BB 0042 0056
        MOVR    R3,     R1                      ; 5632   0099
        ADDR    R2,     R1                      ; 5633   00D1
        MVI@    R1,     R4                      ; 5634   028C
        ADDI    #$0200, R4                      ; 5635   02FC 0200
        ADDI    #$0004, R3                      ; 5637   02FB 0004
        MOVR    R3,     R1                      ; 5639   0099
        ADDR    R2,     R1                      ; 563A   00D1
        MVI@    R1,     R0                      ; 563B   0288
        ADDI    #$0004, R3                      ; 563C   02FB 0004
        ADDR    R2,     R3                      ; 563E   00D3
        MVI@    R3,     R1                      ; 563F   0299
        B       L_55F8                          ; 5640   0220 0049

        DECLE   $0013,  $0000,  $00DC,  $0000   ; 5642   0013 0000 00DC 0000
        DECLE   $000C,  $000C,  $0014,  $0014   ; 5646   000C 000C 0014 0014
        DECLE   $0014,  $0014,  $0001,  $0001   ; 564A   0014 0014 0001 0001

        PSHR    R5                              ; 564E   0275
        MVI     G_017C, R1                      ; 564F   0281 017C
        TSTR    R1                              ; 5651   0089
        BNEQ    L_573C                          ; 5652   020C 00E8

        MOVR    R0,     R4                      ; 5654   0084
        MOVR    R3,     R0                      ; 5655   0098

        JSR     R5,     .EXEC.76C               ; 5656   0004 0114 036C

        MOVR    R1,     R3                      ; 5659   008B
        INCR    R1                              ; 565A   0009
        MVI@    R1,     R2                      ; 565B   028A
        CMP     G_0184, R0                      ; 565C   0340 0184
        BEQ     L_56A1                          ; 565E   0204 0041

        SDBD                                    ; 5660   0001
        CMPI    #$5D42, R2                      ; 5661   037A 0042 005D
        BGE     L_573C                          ; 5664   020D 00D6

        MOVR    R4,     R0                      ; 5666   00A0
        SDBD                                    ; 5667   0001
        CMPI    #$5D3B, R2                      ; 5668   037A 003B 005D
        BEQ     L_5673                          ; 566B   0204 0006

        SDBD                                    ; 566D   0001
        CMPI    #$5D2C, R2                      ; 566E   037A 002C 005D
        BNEQ    L_56C9                          ; 5671   020C 0056

L_5673:
        JSR     R5,     .EXEC.76C               ; 5673   0004 0114 036C

        INCR    R1                              ; 5676   0009
        MVI@    R1,     R4                      ; 5677   028C
        SDBD                                    ; 5678   0001
        CMPI    #$5D0F, R4                      ; 5679   037C 000F 005D
        BNEQ    L_573C                          ; 567C   020C 00BE

        DECR    R1                              ; 567E   0011
        MVI@    R1,     R0                      ; 567F   0288
        ANDI    #$0002, R0                      ; 5680   03B8 0002
        BNEQ    L_573C                          ; 5682   020C 00B8

        MVI@    R1,     R0                      ; 5684   0288
        SDBD                                    ; 5685   0001
        XORI    #$C803, R0                      ; 5686   03F8 0003 00C8
        MVO@    R0,     R1                      ; 5689   0248
        ADDI    #$0006, R1                      ; 568A   02F9 0006
        MVI@    R1,     R0                      ; 568C   0288
        SLR     R0,     1                       ; 568D   0060
        BEQ     L_5691                          ; 568E   0204 0001

        MVO@    R0,     R1                      ; 5690   0248
L_5691:
        SDBD                                    ; 5691   0001
        CMPI    #$5D2C, R2                      ; 5692   037A 002C 005D
        BEQ     L_569E                          ; 5695   0204 0007

        MVI     G_0181, R0                      ; 5697   0280 0181
        DECR    R0                              ; 5699   0010
        MVO     R0,     G_0181                  ; 569A   0240 0181
        BEQ     L_56C9                          ; 569C   0204 002B
L_569E:
        J       L_5DC1                          ; 569E   0004 035C 01C1

L_56A1:
        MOVR    R4,     R0                      ; 56A1   00A0
        MVI@    R3,     R4                      ; 56A2   029C
        ANDI    #$0007, R4                      ; 56A3   03BC 0007
        SUBI    #$0005, R4                      ; 56A5   033C 0005
        BEQ     L_56C2                          ; 56A7   0204 0019

        JSR     R5,     .EXEC.76C               ; 56A9   0004 0114 036C

        ADDI    #$0004, R1                      ; 56AC   02F9 0004
        MOVR    R1,     R3                      ; 56AE   008B
        MVI     G_035E, R2                      ; 56AF   0282 035E
        MVI@    R3,     R0                      ; 56B1   0298

        JSR     R5,     X_UNPK_BYTES            ; 56B2   0004 0114 0357

        RRC     R2,     1                       ; 56B5   0072
        BNC     L_56BC                          ; 56B6   0209 0004

        NEGR    R0                              ; 56B8   0020
        RRC     R2,     1                       ; 56B9   0072
        BNC     L_56BD                          ; 56BA   0209 0001

L_56BC:
        NEGR    R1                              ; 56BC   0021

L_56BD:
        JSR     R5,     X_PACK_BYTES            ; 56BD   0004 0114 034F

        MVO@    R0,     R3                      ; 56C0   0258
        PULR    R7                              ; 56C1   02B7

L_56C2:
        MVO     R4,     G_0184                  ; 56C2   0244 0184
        MOVR    R2,     R4                      ; 56C4   0094
        MVII    #$0032, R0                      ; 56C5   02B8 0032
        B       L_56E9                          ; 56C7   0200 0020

L_56C9:
        MOVR    R2,     R4                      ; 56C9   0094
        MVI@    R3,     R2                      ; 56CA   029A
        MVII    #$0005, R0                      ; 56CB   02B8 0005
        SDBD                                    ; 56CD   0001
        CMPI    #$5D1E, R4                      ; 56CE   037C 001E 005D
        BEQ     L_56E2                          ; 56D1   0204 000F

        MVII    #$0032, R0                      ; 56D3   02B8 0032
        SDBD                                    ; 56D5   0001
        CMPI    #$5D25, R4                      ; 56D6   037C 0025 005D
        BEQ     L_56E9                          ; 56D9   0204 000E

        SLL     R0,     2                       ; 56DB   004C
        SDBD                                    ; 56DC   0001
        CMPI    #$5D3B, R4                      ; 56DD   037C 003B 005D
        BNEQ    L_56F2                          ; 56E0   020C 0010

L_56E2:
        SDBD                                    ; 56E2   0001
        ANDI    #$2000, R2                      ; 56E3   03BA 0000 0020
        BNEQ    L_56E9                          ; 56E6   020C 0001

        SLL     R0,     2                       ; 56E8   004C

L_56E9:
        JSR     R5,     L_5830                  ; 56E9   0004 0158 0030

        SDBD                                    ; 56EC   0001
        CMPI    #$5D3B, R4                      ; 56ED   037C 003B 005D
        BEQ     L_5719                          ; 56F0   0204 0027

L_56F2:
        SDBD                                    ; 56F2   0001
        CMPI    #$5D1E, R4                      ; 56F3   037C 001E 005D
        BNEQ    L_571E                          ; 56F6   020C 0026

        MOVR    R3,     R4                      ; 56F8   009C
        ADDI    #$0005, R3                      ; 56F9   02FB 0005
        MVI@    R3,     R1                      ; 56FB   0299
        CMPI    #$0001, R1                      ; 56FC   0379 0001
        BGT     L_573D                          ; 56FE   020E 003D

        JSR     R5,     L_55CB                  ; 5700   0004 0154 01CB

        TSTR    R1                              ; 5703   0089
        BEQ     L_5757                          ; 5704   0204 0051

        MVII    #$0002, R0                      ; 5706   02B8 0002
        MVO@    R0,     R3                      ; 5708   0258
        DECR    R3                              ; 5709   0013
        MVI@    R3,     R0                      ; 570A   0298

        JSR     R5,     X_UNPK_BYTES            ; 570B   0004 0114 0357

        MOVR    R0,     R2                      ; 570E   0082
        SUBR    R1,     R2                      ; 570F   010A
        ADDR    R0,     R1                      ; 5710   00C1
        MOVR    R2,     R0                      ; 5711   0090

        JSR     R5,     X_PACK_BYTES            ; 5712   0004 0114 034F

        MVO@    R0,     R3                      ; 5715   0258
        J       L_5DD1                          ; 5716   0004 035C 01D1

L_5719:
        PSHR    R3                              ; 5719   0273

        JSR     R5,     L_5DFD                  ; 571A   0004 015C 01FD

        PULR    R3                              ; 571D   02B3
L_571E:
        MOVR    R3,     R1                      ; 571E   0099
        PSHR    R1                              ; 571F   0271

        JSR     R5,     L_5DC0                  ; 5720   0004 015C 01C0

        PULR    R1                              ; 5723   02B1
        MVI@    R1,     R0                      ; 5724   0288
        SDBD                                    ; 5725   0001
        ANDI    #$FFBF, R0                      ; 5726   03B8 00BF 00FF
        MVO@    R0,     R1                      ; 5729   0248
        INCR    R1                              ; 572A   0009
        SDBD                                    ; 572B   0001
        MVII    #$5D42, R0                      ; 572C   02B8 0042 005D
L_572F:
        MVO@    R0,     R1                      ; 572F   0248
        ADDI    #$0003, R1                      ; 5730   02F9 0003
        CLRR    R0                              ; 5732   01C0
        MVO@    R0,     R1                      ; 5733   0248
        INCR    R1                              ; 5734   0009
        MVII    #$03F5, R0                      ; 5735   02B8 03F5
        MVO@    R0,     R1                      ; 5737   0248
        INCR    R1                              ; 5738   0009
        MVII    #$0009, R0                      ; 5739   02B8 0009
        MVO@    R0,     R1                      ; 573B   0248
L_573C:
        PULR    R7                              ; 573C   02B7

L_573D:
        MOVR    R4,     R1                      ; 573D   00A1
        MVI     G_0179, R2                      ; 573E   0282 0179
        SDBD                                    ; 5740   0001
        ADDI    #$5A4F, R2                      ; 5741   02FA 004F 005A
        MVI@    R2,     R0                      ; 5744   0290

        JSR     R5,     X_RAND2                 ; 5745   0004 0114 029E
        DECLE   $0080,  $0204,  $000D,  $0271   ; 5748   0080 0204 000D 0271
        DECLE   $0004,  $015C,  $01D7           ; 574C   0004 015C 01D7

        PULR    R1                              ; 574F   02B1
        INCR    R1                              ; 5750   0009
        SDBD                                    ; 5751   0001
        MVII    #$5D51, R0                      ; 5752   02B8 0051 005D
        B       L_572F                          ; 5755   0220 0027

L_5757:
        MOVR    R4,     R1                      ; 5757   00A1
        PSHR    R1                              ; 5758   0271

        JSR     R5,     L_5DD0                  ; 5759   0004 015C 01D0

        PULR    R1                              ; 575C   02B1
        SDBD                                    ; 575D   0001
        MVII    #$78DD, R2                      ; 575E   02BA 00DD 0078
        MVI     G_0179, R3                      ; 5761   0283 0179
        MOVR    R3,     R4                      ; 5763   009C
        CMPI    #$000A, R4                      ; 5764   037C 000A
        BLT     L_5773                          ; 5766   0205 000B

        SDBD                                    ; 5768   0001
        ADDI    #$5A4F, R3                      ; 5769   02FB 004F 005A
        MVI@    R3,     R0                      ; 576C   0298

        JSR     R5,     X_RAND2                 ; 576D   0004 0114 029E

        TSTR    R0                              ; 5770   0080
        BEQ     L_577B                          ; 5771   0204 0008

L_5773:
        MVO@    R2,     R1                      ; 5773   024A
        INCR    R1                              ; 5774   0009
        SDBD                                    ; 5775   0001
        MVII    #$5D60, R0                      ; 5776   02B8 0060 005D
        B       L_572F                          ; 5779   0220 004B

L_577B:
        XORI    #$0005, R2                      ; 577B   03FA 0005
        CMPI    #$000F, R4                      ; 577D   037C 000F
        BGE     L_5785                          ; 577F   020D 0004

        SDBD                                    ; 5781   0001
        XORI    #$2080, R2                      ; 5782   03FA 0080 0020
L_5785:
        MVO@    R2,     R1                      ; 5785   024A
        INCR    R1                              ; 5786   0009
        SDBD                                    ; 5787   0001
        MVII    #$5D2C, R0                      ; 5788   02B8 002C 005D
        MVO@    R0,     R1                      ; 578B   0248
        ADDI    #$0004, R1                      ; 578C   02F9 0004
        MVII    #$0201, R0                      ; 578E   02B8 0201
        MVO@    R0,     R1                      ; 5790   0248
        INCR    R1                              ; 5791   0009
        MVII    #$0006, R0                      ; 5792   02B8 0006
        MVO@    R0,     R1                      ; 5794   0248
        PULR    R7                              ; 5795   02B7

        PSHR    R5                              ; 5796   0275
        MVI     G_017C, R0                      ; 5797   0280 017C
        XOR     G_016E, R0                      ; 5799   03C0 016E
        BNEQ    L_57D5                          ; 579B   020C 0038

        MVII    #$0166, R4                      ; 579D   02BC 0166
        MVO@    R0,     R4                      ; 579F   0260
        MVO@    R0,     R4                      ; 57A0   0260
        MVO@    R0,     R4                      ; 57A1   0260
        MVO@    R0,     R4                      ; 57A2   0260
        MVO     R0,     G_012E                  ; 57A3   0240 012E
        INCR    R0                              ; 57A5   0008
        MVO     R0,     G_017C                  ; 57A6   0240 017C

        JSR     R5,     L_55DC                  ; 57A8   0004 0154 01DC
        JSR     R5,     L_55C0                  ; 57AB   0004 0154 01C0
        JSR     R5,     L_57D6                  ; 57AE   0004 0154 03D6

        MVII    #$0028, R0                      ; 57B1   02B8 0028
        SUB     G_0179, R0                      ; 57B3   0300 0179
        MVO     R0,     G_0323                  ; 57B5   0240 0323
        DECR    R0                              ; 57B7   0010
        MVO     R0,     G_0183                  ; 57B8   0240 0183

        JSR     R5,     L_5DFD                  ; 57BA   0004 015C 01FD

        MVI     G_034C, R0                      ; 57BD   0280 034C
        DECR    R0                              ; 57BF   0010
        MVO     R0,     G_034C                  ; 57C0   0240 034C
        SDBD                                    ; 57C2   0001
        MVII    #$1906, R0                      ; 57C3   02B8 0006 0019
        MVO     R0,     G_035D                  ; 57C6   0240 035D
        MVII    #$0064, R0                      ; 57C8   02B8 0064
        NEGR    R0                              ; 57CA   0020

        JSR     R5,     L_5830                  ; 57CB   0004 0158 0030

        MVII    #$0004, R0                      ; 57CE   02B8 0004
        MVO     R0,     G_015E                  ; 57D0   0240 015E

        JSR     R5,     L_59C0                  ; 57D2   0004 0158 01C0

L_57D5:
        PULR    R7                              ; 57D5   02B7

L_57D6:
        PSHR    R5                              ; 57D6   0275
        MVII    #$031D, R1                      ; 57D7   02B9 031D
        MOVR    R1,     R4                      ; 57D9   008C
        MVI@    R1,     R0                      ; 57DA   0288
        SDBD                                    ; 57DB   0001
        XORI    #$1808, R0                      ; 57DC   03F8 0008 0018
        MVO@    R0,     R4                      ; 57DF   0260
        SDBD                                    ; 57E0   0001
        MVII    #$5CF9, R0                      ; 57E1   02B8 00F9 005C
        MVO@    R0,     R4                      ; 57E4   0260
        MVII    #$0053, R0                      ; 57E5   02B8 0053
        SWAP    R0,     1                       ; 57E7   0040
        MVO@    R0,     R4                      ; 57E8   0260
        PULR    R7                              ; 57E9   02B7

L_57EA:
        PSHR    R5                              ; 57EA   0275
        MVII    #$0014, R0                      ; 57EB   02B8 0014
        MVII    #$0001, R1                      ; 57ED   02B9 0001
        MVII    #$02C8, R4                      ; 57EF   02BC 02C8

        JSR     R5,     L_55F7                  ; 57F1   0004 0154 01F7

        MVI     G_015E, R0                      ; 57F4   0280 015E
        CMPI    #$0000, R0                      ; 57F6   0378 0000
        BEQ     L_581B                          ; 57F8   0204 0021

        MVI     G_034C, R0                      ; 57FA   0280 034C
        DECR    R0                              ; 57FC   0010
        BNEQ    L_5805                          ; 57FD   020C 0006
        J       L_595F                          ; 57FF   0004 0358 015F

        JSR     R5,     L_57D6                  ; 5802   0004 0154 03D6

L_5805:
        CLRR    R0                              ; 5805   01C0
        MVO     R0,     G_0188                  ; 5806   0240 0188
        MVO     R0,     G_018B                  ; 5808   0240 018B

        JSR     R5,     L_59BE                  ; 580A   0004 0158 01BE

        MVII    #$0033, R0                      ; 580D   02B8 0033
        SWAP    R0,     1                       ; 580F   0040
        MVO     R0,     G_0320                  ; 5810   0240 0320
        MVI     G_0165, R0                      ; 5812   0280 0165

        JSR     R5,     L_538F                  ; 5814   0004 0150 038F

        MVII    #$0080, R0                      ; 5817   02B8 0080
        MVO     R0,     G_012E                  ; 5819   0240 012E

L_581B:
        JSR     R5,     L_55E4                  ; 581B   0004 0154 01E4

        MVI     G_017C, R0                      ; 581E   0280 017C
        XORI    #$0001, R0                      ; 5820   03F8 0001
        MVO     R0,     G_017C                  ; 5822   0240 017C
        CLRR    R0                              ; 5824   01C0
        DECR    R0                              ; 5825   0010

        JSR     R5,     L_53A8                  ; 5826   0004 0150 03A8

        SDBD                                    ; 5829   0001
        MVII    #$50C2, R2                      ; 582A   02BA 00C2 0050
        MVO     R2,     G_035D                  ; 582D   0242 035D
        PULR    R7                              ; 582F   02B7

L_5830:
        PSHR    R5                              ; 5830   0275

        JSR     R5,     .EXEC.7C1               ; 5831   0004 0114 03C1

        MOVR    R0,     R2                      ; 5834   0082
        MOVR    R2,     R4                      ; 5835   0094
        MVI     G_016E, R0                      ; 5836   0280 016E
        TSTR    R0                              ; 5838   0080
        BNEQ    L_5924                          ; 5839   020C 00E9

        MVI     G_017A, R1                      ; 583B   0281 017A
        MOVR    R2,     R0                      ; 583D   0090

        JSR     R5,     X_MPY                   ; 583E   0004 011C 01DC

        MVI     G_0324, R0                      ; 5841   0280 0324
        ADDR    R2,     R0                      ; 5843   00D0
        MVI     G_032C, R1                      ; 5844   0281 032C
L_5846:
        TSTR    R0                              ; 5846   0080
        BPL     L_5859                          ; 5847   0203 0010

        TSTR    R1                              ; 5849   0089
        BNEQ    L_5854                          ; 584A   020C 0008

        NEGR    R4                              ; 584C   0024
        CMPI    #$00C8, R4                      ; 584D   037C 00C8
        BEQ     L_5926                          ; 584F   0204 00D5

        CLRR    R0                              ; 5851   01C0
        B       L_5862                          ; 5852   0200 000E

L_5854:
        ADDI    #$03E8, R0                      ; 5854   02F8 03E8
        DECR    R1                              ; 5856   0011
        B       L_5846                          ; 5857   0220 0012

L_5859:
        CMPI    #$03E8, R0                      ; 5859   0378 03E8
        BLT     L_5862                          ; 585B   0205 0005

        SUBI    #$03E8, R0                      ; 585D   0338 03E8
        INCR    R1                              ; 585F   0009
        B       L_5846                          ; 5860   0220 001B

L_5862:
        MVO     R0,     G_0324                  ; 5862   0240 0324
        MVO     R1,     G_032C                  ; 5864   0241 032C
        MVI     G_017C, R2                      ; 5866   0282 017C
        XORI    #$0001, R2                      ; 5868   03FA 0001
L_586A:
        TSTR    R2                              ; 586A   0092
        BNEQ    L_5874                          ; 586B   020C 0007

        MVII    #$0007, R3                      ; 586D   02BB 0007
        MVII    #$02CA, R4                      ; 586F   02BC 02CA

        JSR     R5,     L_5929                  ; 5871   0004 0158 0129

L_5874:
        MVI     G_033C, R0                      ; 5874   0280 033C
        MVI     G_032C, R1                      ; 5876   0281 032C
        CMPR    R1,     R0                      ; 5878   0148
        BEQ     L_58A4                          ; 5879   0204 0029
        BGT     L_58AD                          ; 587B   020E 0030

        MVO     R1,     G_033C                  ; 587D   0241 033C
        MOVR    R1,     R0                      ; 587F   0088
        MVI     G_0324, R3                      ; 5880   0283 0324
        MVO     R3,     G_0334                  ; 5882   0243 0334
L_5884:
        MVI     G_0354, R1                      ; 5884   0281 0354

        JSR     R5,     L_5946                  ; 5886   0004 0158 0146

        SDBD                                    ; 5889   0001
        ADDI    #$589D, R3                      ; 588A   02FB 009D 0058
        ADD@    R3,     R1                      ; 588D   02D9
        CMPR    R1,     R0                      ; 588E   0148
        BLT     L_589A                          ; 588F   0205 0009

        MVI     G_034C, R3                      ; 5891   0283 034C
        INCR    R3                              ; 5893   000B
        MVO     R3,     G_034C                  ; 5894   0243 034C
        MVO     R1,     G_0354                  ; 5896   0241 0354
        B       L_5884                          ; 5898   0220 0015

L_589A:
        MVI     G_032C, R1                      ; 589A   0281 032C
        B       L_58AD                          ; 589C   0200 000F

        DECLE   $0001,  $0001,  $0001,  $0002   ; 589E   0001 0001 0001 0002
        DECLE   $0003,  $0005                   ; 58A2   0003 0005
L_58A4:
        MVI     G_0334, R3                      ; 58A4   0283 0334
        MVI     G_0324, R4                      ; 58A6   0284 0324
        CMPR    R4,     R3                      ; 58A8   0163
        BGE     L_58AD                          ; 58A9   020D 0002

        MVO     R4,     G_0334                  ; 58AB   0244 0334

L_58AD:
        JSR     R5,     L_5946                  ; 58AD   0004 0158 0146

        MVI     G_0179, R1                      ; 58B0   0281 0179
        MVO     R4,     G_0179                  ; 58B2   0244 0179
        CMPR    R1,     R4                      ; 58B4   014C
        BLE     L_58D4                          ; 58B5   0206 001D

        JSR     R5,     L_5D76                  ; 58B7   0004 015C 0176
        JSR     R5,     L_55DC                  ; 58BA   0004 0154 01DC

        MVII    #$0001, R0                      ; 58BD   02B8 0001
        MVO     R0,     G_017C                  ; 58BF   0240 017C
        MVII    #$0010, R1                      ; 58C1   02B9 0010
        SWAP    R1,     1                       ; 58C3   0041

L_58C4:
        JSR     R5,     X_RAND2                 ; 58C4   0004 0114 029E

        DECR    R1                              ; 58C7   0011
        BNEQ    L_58C4                          ; 58C8   022C 0005

        INCR    R1                              ; 58CA   0009
        MVO     R1,     G_0180                  ; 58CB   0241 0180
        MVI     G_0324, R0                      ; 58CD   0280 0324
        MVI     G_032C, R1                      ; 58CF   0281 032C
        CLRR    R2                              ; 58D1   01D2
        B       L_586A                          ; 58D2   0220 0069

L_58D4:
        TSTR    R2                              ; 58D4   0092
        BNEQ    L_58E5                          ; 58D5   020C 000E

        MVI     G_017A, R0                      ; 58D7   0280 017A
        ADDI    #$0010, R0                      ; 58D9   02F8 0010
        SLL     R0,     2                       ; 58DB   004C
        SLL     R0,     1                       ; 58DC   0048
        XORI    #$0007, R0                      ; 58DD   03F8 0007
        MVII    #$02D9, R4                      ; 58DF   02BC 02D9
        MVO@    R0,     R4                      ; 58E1   0260
        MVII    #$02C7, R0                      ; 58E2   02B8 02C7
        MVO@    R0,     R4                      ; 58E4   0260
L_58E5:
        MVI     G_034C, R1                      ; 58E5   0281 034C
        TSTR    R2                              ; 58E7   0092
        BNEQ    L_5924                          ; 58E8   020C 003A

        MVII    #$0008, R0                      ; 58EA   02B8 0008
        MVII    #$02D1, R4                      ; 58EC   02BC 02D1

        JSR     R5,     X_FILL_ZERO             ; 58EE   0004 0114 0338

        SUBI    #$0001, R1                      ; 58F1   0339 0001
        BLE     L_5911                          ; 58F3   0206 001C

        MOVR    R1,     R0                      ; 58F5   0088
        MVII    #$0008, R1                      ; 58F6   02B9 0008
        SLL     R1,     2                       ; 58F8   004D
        SLL     R1,     1                       ; 58F9   0049
        SDBD                                    ; 58FA   0001
        XORI    #$0801, R1                      ; 58FB   03F9 0001 0008
        MVII    #$02D2, R4                      ; 58FE   02BC 02D2
        CMPI    #$0007, R0                      ; 5900   0378 0007
        BGT     L_5909                          ; 5902   020E 0005

        JSR     R5,     X_FILL_MEM              ; 5904   0004 0114 0341

        B       L_5911                          ; 5907   0200 0008

L_5909:
        MVO@    R1,     R4                      ; 5909   0261
        MVII    #$0004, R1                      ; 590A   02B9 0004
        MVII    #$0001, R3                      ; 590C   02BB 0001

        JSR     R5,     X_PRNUM_LFT             ; 590E   0004 0118 009E

L_5911:
        MVI     G_0180, R2                      ; 5911   0282 0180
        TSTR    R2                              ; 5913   0092
        BEQ     L_5924                          ; 5914   0204 000E

        MVII    #$0028, R1                      ; 5916   02B9 0028
        SWAP    R1,     1                       ; 5918   0041

L_5919:
        JSR     R5,     X_RAND2                 ; 5919   0004 0114 029E

        DECR    R1                              ; 591C   0011
        BNEQ    L_5919                          ; 591D   022C 0005

        MVO     R1,     G_0180                  ; 591F   0241 0180

        JSR     R5,     L_57EA                  ; 5921   0004 0154 03EA

L_5924:
        CLRR    R0                              ; 5924   01C0
        PULR    R7                              ; 5925   02B7

L_5926:
        MVII    #$0001, R0                      ; 5926   02B8 0001
        PULR    R7                              ; 5928   02B7

L_5929:
        PSHR    R5                              ; 5929   0275
        PSHR    R0                              ; 592A   0270
        TSTR    R1                              ; 592B   0089
        BEQ     L_593B                          ; 592C   0204 000D

        MOVR    R1,     R0                      ; 592E   0088
        MVII    #$0004, R1                      ; 592F   02B9 0004

        JSR     R5,     X_PRNUM_RGT             ; 5931   0004 0118 00C5

        PULR    R0                              ; 5934   02B0
        DECR    R1                              ; 5935   0011
        ADDI    #$0004, R4                      ; 5936   02FC 0004
        J       .EXEC.8AE                       ; 5938   0004 0318 00AE

L_593B:
        MVII    #$0004, R0                      ; 593B   02B8 0004

        JSR     R5,     X_FILL_ZERO             ; 593D   0004 0114 0338

        PULR    R0                              ; 5940   02B0
        MVII    #$0003, R1                      ; 5941   02B9 0003
        J       .EXEC.8C6                       ; 5943   0004 0318 00C6

L_5946:
        PSHR    R5                              ; 5946   0275
        SDBD                                    ; 5947   0001
        MVII    #$5A63, R5                      ; 5948   02BD 0063 005A
        CLRR    R4                              ; 594B   01E4
L_594C:
        MVI@    R5,     R3                      ; 594C   02AB
        CMPR    R1,     R3                      ; 594D   014B
        BGT     L_5955                          ; 594E   020E 0005

        INCR    R4                              ; 5950   000C
        CMPI    #$0013, R4                      ; 5951   037C 0013
        BNEQ    L_594C                          ; 5953   022C 0008

L_5955:
        SDBD                                    ; 5955   0001
        MVII    #$5A76, R3                      ; 5956   02BB 0076 005A
        ADDR    R4,     R3                      ; 5959   00E3
        MVI@    R3,     R3                      ; 595A   029B
        MVO     R3,     G_017A                  ; 595B   0243 017A
        PULR    R7                              ; 595D   02B7

        PSHR    R5                              ; 595E   0275
L_595F:
        MVI     G_016E, R0                      ; 595F   0280 016E
        TSTR    R0                              ; 5961   0080
        BNEQ    L_59AE                          ; 5962   020C 004A

        MVO     R0,     G_017C                  ; 5964   0240 017C
        INCR    R0                              ; 5966   0008
        MVO     R0,     G_016E                  ; 5967   0240 016E

        JSR     R5,     L_55C0                  ; 5969   0004 0154 01C0

        MVII    #$0050, R0                      ; 596C   02B8 0050
        MVO     R0,     G_012C                  ; 596E   0240 012C
        MVO     R0,     G_012E                  ; 5970   0240 012E
        MVII    #$000C, R0                      ; 5972   02B8 000C
        MVO     R0,     G_0179                  ; 5974   0240 0179
        MVII    #$0001, R0                      ; 5976   02B8 0001
        MVO     R0,     G_015E                  ; 5978   0240 015E

        JSR     R5,     L_59C0                  ; 597A   0004 0158 01C0

        MVII    #$0007, R3                      ; 597D   02BB 0007
        MVII    #$0252, R4                      ; 597F   02BC 0252

        JSR     R5,     X_PRINT_R5              ; 5981   0004 0118 007B
        STRING  "Game Over"                     ; 5984  
        DECLE   $0000                           ; 598D   0000

        MVII    #$027A, R4                      ; 598E   02BC 027A

        JSR     R5,     X_PRINT_R5              ; 5990   0004 0118 007B
        STRING  "Peak Score"                    ; 5993  
        DECLE   $0000                           ; 599D   0000

        MVI     G_0334, R0                      ; 599E   0280 0334
        MVI     G_033C, R1                      ; 59A0   0281 033C

        JSR     R5,     L_5929                  ; 59A2   0004 0158 0129

L_59A5:
        INCR    R4                              ; 59A5   000C
        BNEQ    L_59A5                          ; 59A6   022C 0002

        SDBD                                    ; 59A8   0001
        MVII    #$59AF, R0                      ; 59A9   02B8 00AF 0059
        MVO     R0,     G_035D                  ; 59AC   0240 035D
L_59AE:
        PULR    R7                              ; 59AE   02B7

        MOVR    R7,     R1                      ; 59AF   00B9
        SLLC    R1,     1                       ; 59B0   0059
        MOVR    R7,     R1                      ; 59B1   00B9
        SLLC    R1,     1                       ; 59B2   0059
        MOVR    R7,     R1                      ; 59B3   00B9
        SLLC    R1,     1                       ; 59B4   0059
        MOVR    R7,     R1                      ; 59B5   00B9
        SLLC    R1,     1                       ; 59B6   0059
        MOVR    R7,     R1                      ; 59B7   00B9
        SLLC    R1,     1                       ; 59B8   0059
        MVII    #$02F1, R6                      ; 59B9   02BE 02F1
        JD      .EXEC.041                       ; 59BB   0004 0312 0041

L_59BE:
        MVO     R0,     G_015E                  ; 59BE   0240 015E
L_59C0:
        MVO     R0,     G_015F                  ; 59C0   0240 015F
        DIS                                     ; 59C2   0003
        SDBD                                    ; 59C3   0001
        MVII    #$00D1, R0                      ; 59C4   02B8 00D1 0000
        MVO     R0,     .ISRVEC.0               ; 59C7   0240 0100
        SDBD                                    ; 59C9   0001
        MVII    #$0059, R0                      ; 59CA   02B8 0059 0000
        MVO     R0,     .ISRVEC.1               ; 59CD   0240 0101
        EIS                                     ; 59CF   0002
        MOVR    R5,     R7                      ; 59D0   00AF

        MVI     G_015F, R0                      ; 59D1   0280 015F
        MVO     R0,     .STIC.CS.0              ; 59D3   0240 0028
        MVO     R0,     .STIC.CS.2              ; 59D5   0240 002A
        MVI     G_017C, R1                      ; 59D7   0281 017C
        RRC     R1,     2                       ; 59D9   0075
        BOV     L_59E0                          ; 59DA   0202 0004

        MVO     R0,     .STIC.BORD              ; 59DC   0240 002C
        MVO     R0,     G_0106                  ; 59DE   0240 0106
L_59E0:
        MVI     G_0160, R0                      ; 59E0   0280 0160
        MVO     R0,     .ISRVEC.0               ; 59E2   0240 0100
        MVI     G_0161, R0                      ; 59E4   0280 0161
        MVO     R0,     .ISRVEC.1               ; 59E6   0240 0101
        MVII    #$0160, R4                      ; 59E8   02BC 0160
        SDBD                                    ; 59EA   0001
        MVI@    R4,     R7                      ; 59EB   02A7

L_59EC:
        MVI     G_035E, R2                      ; 59EC   0282 035E
        ANDI    #$00FF, R2                      ; 59EE   03BA 00FF
L_59F0:
        INCR    R2                              ; 59F0   000A
        MOVR    R2,     R1                      ; 59F1   0091
        CMPI    #$00F0, R1                      ; 59F2   0379 00F0
        BGE     L_5A17                          ; 59F4   020D 0021

        ADDI    #$0200, R1                      ; 59F6   02F9 0200
        MVI@    R1,     R0                      ; 59F8   0288
        TSTR    R0                              ; 59F9   0080
        BEQ     L_59F0                          ; 59FA   0224 000B

        ANDI    #$03F8, R0                      ; 59FC   03B8 03F8
        CMPI    #$0038, R0                      ; 59FE   0378 0038
        BGE     L_59F0                          ; 5A00   022D 0011

        MVI@    R1,     R0                      ; 5A02   0288
        XORI    #$0007, R0                      ; 5A03   03F8 0007
        MVO@    R0,     R1                      ; 5A05   0248
        MVI     G_017E, R1                      ; 5A06   0281 017E
        ADDI    #$0200, R1                      ; 5A08   02F9 0200
        MVI@    R1,     R0                      ; 5A0A   0288
        ANDI    #$03F8, R0                      ; 5A0B   03B8 03F8
        CMPI    #$0038, R0                      ; 5A0D   0378 0038
        BGE     L_5A15                          ; 5A0F   020D 0004

        MVI@    R1,     R0                      ; 5A11   0288
        XORI    #$0007, R0                      ; 5A12   03F8 0007
        MVO@    R0,     R1                      ; 5A14   0248
L_5A15:
        MVO     R2,     G_017E                  ; 5A15   0242 017E
L_5A17:
        MOVR    R5,     R7                      ; 5A17   00AF

        DECLE   $001E,  $0020,  $0022,  $0024   ; 5A18   001E 0020 0022 0024
        DECLE   $0026,  $0028,  $002A,  $002C   ; 5A1C   0026 0028 002A 002C
        DECLE   $002E,  $0030,  $0032,  $0034   ; 5A20   002E 0030 0032 0034
        DECLE   $0036                           ; 5A24   0036

        RSWD    R0                              ; 5A25   0038
        RSWD    R2                              ; 5A26   003A
        RSWD    R4                              ; 5A27   003C
        RSWD    R6                              ; 5A28   003E
        SWAP    R0,     1                       ; 5A29   0040
        SWAP    R2,     1                       ; 5A2A   0042
        SWAP    R0,     2                       ; 5A2B   0044
        INCR    R4                              ; 5A2C   000C
        DECR    R0                              ; 5A2D   0010
        DECR    R4                              ; 5A2E   0014
        COMR    R0                              ; 5A2F   0018
        COMR    R4                              ; 5A30   001C
        SUBR    R0,     R0                      ; 5A31   0100
        CMPR    R2,     R0                      ; 5A32   0150
        CLRR    R0                              ; 5A33   01C0
        XORR    R6,     R0                      ; 5A34   01F0
        PSHR    R0                              ; 5A35   0270
        DECR    R4                              ; 5A36   0014
        INCR    R7                              ; 5A37   000F

        INCR    R4                              ; 5A38   000C
L_5A39:
        INCR    R2                              ; 5A39   000A
        INCR    R1                              ; 5A3A   0009
        INCR    R6                              ; 5A3B   000E
        INCR    R7                              ; 5A3C   000F

        DECR    R0                              ; 5A3D   0010
L_5A3E:
        DECR    R2                              ; 5A3E   0012
        DECLE   $0014,  $0016,  $0018,  $001A   ; 5A3F   0014 0016 0018 001A
        DECLE   $001C,  $001E,  $0020,  $0022   ; 5A43   001C 001E 0020 0022
        DECLE   $0025,  $0028,  $002B,  $002E   ; 5A47   0025 0028 002B 002E
        DECLE   $0032,  $0036                   ; 5A4B   0032 0036

        RSWD    R2                              ; 5A4D   003A
        RSWD    R6                              ; 5A4E   003E
        DECR    R4                              ; 5A4F   0014
        INCR    R7                              ; 5A50   000F

        INCR    R4                              ; 5A51   000C
L_5A52:
        INCR    R2                              ; 5A52   000A
        DECLE   $0009,  $0008,  $0008,  $0007   ; 5A53   0009 0008 0008 0007
        DECLE   $0007,  $0006,  $0006,  $0005   ; 5A57   0007 0006 0006 0005
        DECLE   $0005,  $0004,  $0004,  $0003   ; 5A5B   0005 0004 0004 0003
        DECLE   $0003,  $0002,  $0001,  $0001   ; 5A5F   0003 0002 0001 0001
        DECLE   $0001,  $0002,  $0005           ; 5A63   0001 0002 0005

        SETC                                    ; 5A66   0007
        INCR    R2                              ; 5A67   000A
        INCR    R4                              ; 5A68   000C
        INCR    R7                              ; 5A69   000F

        DECR    R4                              ; 5A6A   0014
L_5A6B:
        COMR    R6                              ; 5A6B   001E
        DECLE   $0028,  $0032,  $004B,  $0064   ; 5A6C   0028 0032 004B 0064
        DECLE   $0096,  $00C8,  $012C,  $01F4   ; 5A70   0096 00C8 012C 01F4
        DECLE   $02EE,  $03E8,  $0001,  $0002   ; 5A74   02EE 03E8 0001 0002
        DECLE   $0002,  $0003,  $0003,  $0003   ; 5A78   0002 0003 0003 0003
        DECLE   $0003,  $0003,  $0004,  $0004   ; 5A7C   0003 0003 0004 0004
        DECLE   $0004,  $0005,  $0005,  $0005   ; 5A80   0004 0005 0005 0005
        DECLE   $0005,  $0006,  $0006,  $0006   ; 5A84   0005 0006 0006 0006
        DECLE   $0006,  $0006                   ; 5A88   0006 0006
.GFX_LIST_5A8A:
        DECLE   $0000,  $0000,  $0002,  $0000   ; 5A8A  CART PIC #00
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A8E  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A92  CART PIC #01
        DECLE   $0000,  $0000,  $0000,  $0080   ; 5A96  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A9A  CART PIC #02
        DECLE   $0006,  $0009,  $0006,  $0000   ; 5A9E  
        DECLE   $0018,  $005A,  $003E,  $000C   ; 5AA2  CART PIC #03
        DECLE   $0034,  $0022,  $0066,  $0000   ; 5AA6  
        DECLE   $0000,  $0000,  $0000,  $0010   ; 5AAA   0000 0000 0000 0010
        DECLE   $0028,  $0046,  $0045,  $0089   ; 5AAE   0028 0046 0045 0089
        DECLE   $0089,  $0045,  $0046,  $0028   ; 5AB2   0089 0045 0046 0028
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5AB6   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $000A   ; 5ABA   0000 0000 0004 000A
        DECLE   $0011,  $0029,  $004A,  $0044   ; 5ABE   0011 0029 004A 0044
        DECLE   $0082,  $0082,  $0044,  $0044   ; 5AC2   0082 0082 0044 0044
        DECLE   $0028,  $0010,  $0000,  $0000   ; 5AC6   0028 0010 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0024   ; 5ACA   0000 0000 0018 0024
        DECLE   $0042,  $0042,  $0081,  $0081   ; 5ACE   0042 0042 0081 0081
        DECLE   $0081,  $0081,  $0042,  $0042   ; 5AD2   0081 0081 0042 0042
        DECLE   $0024,  $0018,  $0000,  $0000   ; 5AD6   0024 0018 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0066   ; 5ADA   0000 0000 0018 0066
        DECLE   $0042,  $0042,  $0081,  $0081   ; 5ADE   0042 0042 0081 0081
        DECLE   $0081,  $0081,  $0042,  $0042   ; 5AE2   0081 0081 0042 0042
        DECLE   $0066,  $0018,  $0000,  $0000   ; 5AE6   0066 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AEA   0000 0000 0000 0000
        DECLE   $0020,  $0020,  $0004,  $0000   ; 5AEE   0020 0020 0004 0000
        DECLE   $0000,  $0000,  $0008,  $0010   ; 5AF2   0000 0000 0008 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0020,  $0010   ; 5AFA   0000 0000 0020 0010
        DECLE   $0070,  $0022,  $0006,  $0005   ; 5AFE   0070 0022 0006 0005
        DECLE   $0000,  $0000,  $0010,  $0020   ; 5B02   0000 0000 0010 0020
        DECLE   $0030,  $0010,  $0000,  $0000   ; 5B06   0030 0010 0000 0000
        DECLE   $0000,  $0020,  $0018,  $00B0   ; 5B0A   0000 0020 0018 00B0
        DECLE   $00F1,  $0062,  $0052,  $0084   ; 5B0E   00F1 0062 0052 0084
        DECLE   $001E,  $000A,  $0051,  $007A   ; 5B12   001E 000A 0051 007A
        DECLE   $0070,  $0020,  $0000,  $0000   ; 5B16   0070 0020 0000 0000
        DECLE   $0040,  $0028,  $00BC,  $0078   ; 5B1A   0040 0028 00BC 0078
        DECLE   $0030,  $006B,  $00F2,  $004C   ; 5B1E   0030 006B 00F2 004C
        DECLE   $001E,  $002E,  $0037,  $0077   ; 5B22   001E 002E 0037 0077
        DECLE   $00DA,  $0070,  $0040,  $0000   ; 5B26   00DA 0070 0040 0000
        DECLE   $0000,  $0020,  $0070,  $00F0   ; 5B2A   0000 0020 0070 00F0
        DECLE   $0060,  $0061,  $0072,  $0046   ; 5B2E   0060 0061 0072 0046
        DECLE   $0006,  $0013,  $0036,  $0070   ; 5B32   0006 0013 0036 0070
        DECLE   $007A,  $0020,  $0000,  $0000   ; 5B36   007A 0020 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0020   ; 5B3A   0000 0000 0010 0020
        DECLE   $0060,  $0070,  $0022,  $0006   ; 5B3E   0060 0070 0022 0006
        DECLE   $0004,  $0002,  $0010,  $0070   ; 5B42   0004 0002 0010 0070
        DECLE   $0068,  $0000,  $0000,  $0000   ; 5B46   0068 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0020   ; 5B4A   0000 0000 0018 0020
        DECLE   $0048,  $0042,  $0081,  $0081   ; 5B4E   0048 0042 0081 0081
        DECLE   $0081,  $0005,  $0000,  $0040   ; 5B52   0081 0005 0000 0040
        DECLE   $0024,  $0018,  $0000,  $0000   ; 5B56   0024 0018 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0024   ; 5B5A   0000 0000 0010 0024
        DECLE   $0000,  $0042,  $0081,  $0081   ; 5B5E   0000 0042 0081 0081
        DECLE   $0020,  $0000,  $0002,  $0040   ; 5B62   0020 0000 0002 0040
        DECLE   $0020,  $0008,  $0000,  $0000   ; 5B66   0020 0008 0000 0000
        DECLE   $0000,  $0000,  $0022,  $0000   ; 5B6A   0000 0000 0022 0000
        DECLE   $0000,  $0040,  $0001,  $0004   ; 5B6E   0000 0040 0001 0004
        DECLE   $0000,  $0040,  $0002,  $0000   ; 5B72   0000 0040 0002 0000
        DECLE   $0040,  $0000,  $0008,  $0000   ; 5B76   0040 0000 0008 0000
        DECLE   $0000,  $0042,  $0000,  $0000   ; 5B7A   0000 0042 0000 0000
        DECLE   $0000,  $0081,  $0000,  $0004   ; 5B7E   0000 0081 0000 0004
        DECLE   $0000,  $0000,  $0040,  $0002   ; 5B82   0000 0000 0040 0002
        DECLE   $0000,  $0040,  $0004,  $0000   ; 5B86   0000 0040 0004 0000
        DECLE   $0001,  $0040,  $0000,  $0000   ; 5B8A   0001 0040 0000 0000
        DECLE   $0080,  $0000,  $0000,  $0002   ; 5B8E   0080 0000 0000 0002
        DECLE   $0000,  $0000,  $0000,  $0081   ; 5B92   0000 0000 0000 0081
        DECLE   $0000,  $0000,  $0040,  $0004   ; 5B96   0000 0000 0040 0004
        DECLE   $0080,  $0000,  $0000,  $0000   ; 5B9A   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5B9E   0000 0000 0000 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BA2   0000 0000 0000 0000
        DECLE   $0080,  $0000,  $0000,  $0080   ; 5BA6   0080 0000 0000 0080
        DECLE   $0000,  $0001,  $0000,  $0008   ; 5BAA   0000 0001 0000 0008
        DECLE   $0002,  $0009,  $0000,  $0014   ; 5BAE   0002 0009 0000 0014
        DECLE   $0000,  $0048,  $0000,  $0040   ; 5BB2   0000 0048 0000 0040
        DECLE   $0020,  $0040,  $00E0,  $0040   ; 5BB6   0020 0040 00E0 0040
        DECLE   $0002,  $0000,  $0007,  $0000   ; 5BBA   0002 0000 0007 0000
        DECLE   $0001,  $0010,  $0000,  $0020   ; 5BBE   0001 0010 0000 0020
        DECLE   $0004,  $0024,  $0000,  $0000   ; 5BC2   0004 0024 0000 0000
        DECLE   $0000,  $0040,  $00E0,  $0060   ; 5BC6   0000 0040 00E0 0060
        DECLE   $0000,  $0001,  $0000,  $0008   ; 5BCA   0000 0001 0000 0008
        DECLE   $0004,  $0005,  $0004,  $0000   ; 5BCE   0004 0005 0004 0000
        DECLE   $0010,  $0040,  $0000,  $0020   ; 5BD2   0010 0040 0000 0020
        DECLE   $0000,  $0060,  $00E0,  $0040   ; 5BD6   0000 0060 00E0 0040
        DECLE   $0060,  $0060,  $0060,  $0030   ; 5BDA   0060 0060 0060 0030
        DECLE   $0038,  $00F8,  $0008,  $0030   ; 5BDE   0038 00F8 0008 0030
        DECLE   $0030,  $0020,  $0050,  $0058   ; 5BE2   0030 0020 0050 0058
        DECLE   $0048,  $0020,  $0020,  $0000   ; 5BE6   0048 0020 0020 0000
        DECLE   $0060,  $0060,  $0060,  $0030   ; 5BEA   0060 0060 0060 0030
        DECLE   $0038,  $0078,  $0080,  $0030   ; 5BEE   0038 0078 0080 0030
        DECLE   $0030,  $002E,  $0012,  $0018   ; 5BF2   0030 002E 0012 0018
        DECLE   $0008,  $0008,  $0000,  $0000   ; 5BF6   0008 0008 0000 0000
        DECLE   $0000,  $0000,  $0001,  $00DA   ; 5BFA   0000 0000 0001 00DA
        DECLE   $00F2,  $00FE,  $0038,  $0028   ; 5BFE   00F2 00FE 0038 0028
        DECLE   $0049,  $0046,  $0000,  $0000   ; 5C02   0049 0046 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C06   0000 0000 0000 0000
        DECLE   $0006,  $0004,  $0004           ; 5C0A   0006 0004 0004

        SLR     R0,     2                       ; 5C0D   0064
        COMR    R5                              ; 5C0E   001D
        ADDR    R7,     R5                      ; 5C0F   00FD
        ADDR    R7,     R5                      ; 5C10   00FD
        ADDR    R2,     R7                      ; 5C11   00D7

        DECLE   $0010,  $0020,  $0020,  $0000   ; 5C12   0010 0020 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C16   0000 0000 0000 0000
        DECLE   $000C,  $0008,  $000B,  $000A   ; 5C1A   000C 0008 000B 000A
        DECLE   $006A,  $00BE,  $003E,  $00F8   ; 5C1E   006A 00BE 003E 00F8
        DECLE   $00D0,  $00D0,  $0010,  $0010   ; 5C22   00D0 00D0 0010 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C26   0000 0000 0000 0000
        DECLE   $000C,  $0008,  $000B,  $000A   ; 5C2A   000C 0008 000B 000A
        DECLE   $006A,  $00BE,  $003E,  $0038   ; 5C2E   006A 00BE 003E 0038
        DECLE   $00F0,  $00D0,  $00C8,  $0008   ; 5C32   00F0 00D0 00C8 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C36   0000 0000 0000 0000
        DECLE   $00C0,  $008C,  $0088,  $0048   ; 5C3A   00C0 008C 0088 0048
        DECLE   $0048,  $0058,  $0060,  $0000   ; 5C3E   0048 0058 0060 0000
        DECLE   $0060,  $00E0,  $00B8,  $00B4   ; 5C42   0060 00E0 00B8 00B4
        DECLE   $0034,  $0030,  $0000,  $0000   ; 5C46   0034 0030 0000 0000
        DECLE   $0060,  $0040,  $004C,  $0028   ; 5C4A   0060 0040 004C 0028
        DECLE   $0028,  $0030,  $00B0,  $0080   ; 5C4E   0028 0030 00B0 0080
        DECLE   $0070,  $003C,  $0032,  $0018   ; 5C52   0070 003C 0032 0018
        DECLE   $0018,  $0018,  $0000,  $0000   ; 5C56   0018 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C5A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 5C5E   0000 0000 0000 0018
        DECLE   $0018,  $0018,  $0000,  $0000   ; 5C62   0018 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C66   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C6A   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $0018,  $0018   ; 5C6E   0000 0004 0018 0018
        DECLE   $0038,  $003C,  $001C,  $0008   ; 5C72   0038 003C 001C 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C76   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C7A   0000 0000 0000 0000
        DECLE   $0000,  $0024,  $001C,  $0018   ; 5C7E   0000 0024 001C 0018
        DECLE   $0078,  $007C,  $003E,  $003C   ; 5C82   0078 007C 003E 003C
        DECLE   $001C,  $0008,  $0000,  $0000   ; 5C86   001C 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 5C8A   0000 0000 0000 0010
        DECLE   $000C,  $000C,  $005C,  $007E   ; 5C8E   000C 000C 005C 007E
        DECLE   $007E,  $00FC,  $00F8,  $007C   ; 5C92   007E 00FC 00F8 007C
        DECLE   $007C,  $003E,  $0016,  $0006   ; 5C96   007C 003E 0016 0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C9A   0000 0000 0000 0000
        DECLE   $0004,  $0008,  $0002,  $0000   ; 5C9E   0004 0008 0002 0000
        DECLE   $0000,  $0000,  $0000           ; 5CA2   0000 0000 0000

        INCR    R0                              ; 5CA5   0008

        JSR     R4,     .EXEC.00C               ; 5CA6   0004 0010 000C
        DECLE   $0000,  $0000,  $0002,  $0010   ; 5CA9   0000 0000 0002 0010
        DECLE   $0008,  $0002,  $0010,  $0004   ; 5CAD   0008 0002 0010 0004
        DECLE   $0000,  $0000,  $0044,  $00AA   ; 5CB1   0000 0000 0044 00AA
        DECLE   $0010,  $0038,  $0044,  $0000   ; 5CB5   0010 0038 0044 0000
        DECLE   $0000,  $0000,  $00C6,  $0028   ; 5CB9   0000 0000 00C6 0028
        DECLE   $0010,  $0038,  $0044,  $0000   ; 5CBD   0010 0038 0044 0000
        DECLE   $0000,  $0000,  $0000,  $0028   ; 5CC1   0000 0000 0000 0028
        DECLE   $00D6,  $0038,  $0044,  $0000   ; 5CC5   00D6 0038 0044 0000
        DECLE   $0000,  $0000,  $0028,  $0000   ; 5CC9   0000 0000 0028 0000
        DECLE   $00D6,  $0030,  $0008,  $0042   ; 5CCD   00D6 0030 0008 0042
        DECLE   $0000,  $0022,  $0000,  $0080   ; 5CD1   0000 0022 0000 0080
        DECLE   $0053,  $0030,  $0000,  $0009   ; 5CD5   0053 0030 0000 0009
        DECLE   $0080,  $0000,  $0080,  $0041   ; 5CD9   0080 0000 0080 0041
        DECLE   $0012,  $0030,  $0040,  $0008   ; 5CDD   0012 0030 0040 0008
        DECLE   $0002,  $0081,  $0000,  $0090   ; 5CE1   0002 0081 0000 0090
        DECLE   $0040,  $0000,  $0004,  $0000   ; 5CE5   0040 0000 0004 0000
        DECLE   $0040,  $0000,  $0000,  $0008   ; 5CE9   0040 0000 0000 0008
        DECLE   $0040,  $0020,  $0000,  $0000   ; 5CED   0040 0020 0000 0000
        DECLE   $0002,  $0300,  $0000,  $009C   ; 5CF1   0002 0300 0000 009C
        DECLE   $0055,  $0003,  $0042,  $0000   ; 5CF5   0055 0003 0042 0000
        DECLE   $0300,  $0000,  $00EA,  $0057   ; 5CF9   0300 0000 00EA 0057
        DECLE   $0008,  $002A,  $0008,  $0296   ; 5CFD   0008 002A 0008 0296
        DECLE   $0157,  $0196,  $0057,  $0196   ; 5D01   0157 0196 0057 0196
        DECLE   $0157,  $0396,  $0057,  $0300   ; 5D05   0157 0396 0057 0300
        DECLE   $0000,  $0002,  $0058,  $0008   ; 5D09   0000 0002 0058 0008
        DECLE   $002A,  $0000,  $029C,  $0055   ; 5D0D   002A 0000 029C 0055
        DECLE   $009C,  $0055,  $0004,  $003A   ; 5D11   009C 0055 0004 003A
        DECLE   $0008,  $024E,  $0156,  $014E   ; 5D15   0008 024E 0156 014E
        DECLE   $0056,  $014E,  $0156,  $034E   ; 5D19   0056 014E 0156 034E
        DECLE   $0056,  $029C,  $0055,  $00F6   ; 5D1D   0056 029C 0055 00F6
        DECLE   $0052,  $0008,  $0004,  $0000   ; 5D21   0052 0008 0004 0000
        DECLE   $029C,  $0055,  $0000,  $0000   ; 5D25   029C 0055 0000 0000
        DECLE   $0003,  $0024,  $0000,  $0100   ; 5D29   0003 0024 0000 0100
        DECLE   $0000,  $00F6,  $0052,  $0003   ; 5D2D   0000 00F6 0052 0003
        DECLE   $0010,  $0008,  $024E,  $0156   ; 5D31   0010 0008 024E 0156
        DECLE   $014E,  $0056,  $014E,  $0156   ; 5D35   014E 0056 014E 0156
        DECLE   $034E,  $0056,  $029C,  $0055   ; 5D39   034E 0056 029C 0055
        DECLE   $0057,  $0053,  $0003,  $0045   ; 5D3D   0057 0053 0003 0045
        DECLE   $0000,  $0100,  $0000,  $009C   ; 5D41   0000 0100 0000 009C
        DECLE   $0055,  $0006,  $0047,  $0008   ; 5D45   0055 0006 0047 0008
        DECLE   $024E,  $0156,  $014E,  $0056   ; 5D49   024E 0156 014E 0056
        DECLE   $014E,  $0156,  $034E,  $0056   ; 5D4D   014E 0156 034E 0056
        DECLE   $0100,  $0000,  $009C,  $0055   ; 5D51   0100 0000 009C 0055
        DECLE   $0006,  $0018,  $0008,  $024E   ; 5D55   0006 0018 0008 024E
        DECLE   $0156,  $014E,  $0056,  $014E   ; 5D59   0156 014E 0056 014E
        DECLE   $0156,  $034E,  $0056,  $0100   ; 5D5D   0156 034E 0056 0100
        DECLE   $0000,  $009C,  $0055,  $0006   ; 5D61   0000 009C 0055 0006
        DECLE   $000C,  $0008,  $024E,  $0156   ; 5D65   000C 0008 024E 0156
        DECLE   $014E,  $0056,  $014E,  $0156   ; 5D69   014E 0056 014E 0156
        DECLE   $034E,  $0056,  $039C,  $0055   ; 5D6D   034E 0056 039C 0055
        DECLE   $009C,  $0055,  $0001,  $0000   ; 5D71   009C 0055 0001 0000
        DECLE   $0000                           ; 5D75   0000
L_5D76:
        PSHR    R5                              ; 5D76   0275

        JSR     R5,     X_PLAY_MUS2             ; 5D77   0004 0118 035D
        DECLE   $013A                           ; 5D7A  Note (short)
        DECLE   $03F4,  $00CC                   ; 5D7B  Note (long)
        DECLE   $0000                           ; 5D7D  End of music

        PULR    R7                              ; 5D7E   02B7

L_5D7F:
        JSR     R5,     X_PLAY_SFX1             ; 5D7F   0004 0118 03BB
        DECLE   $0209                           ; 5D82  SFX data
        DECLE   $03B7                           ; 5D83  SFX data
        DECLE   $0300,  $00EC                   ; 5D84  SFX data
        DECLE   $0308,  $0096                   ; 5D86  SFX data
        DECLE   $0304,  $0160                   ; 5D88  SFX data
        DECLE   $0031,  $0038                   ; 5D8A  SFX data
        DECLE   $0051,  $004A                   ; 5D8C  SFX data
        DECLE   $0021,  $03D9                   ; 5D8E  SFX data
        DECLE   $000C,  $02BB                   ; 5D90  SFX data
        DECLE   $000B                           ; 5D92  SFX data
        DECLE   $016B                           ; 5D93  SFX data
        DECLE   $01CF                           ; 5D94  SFX end


        MVII    #$0080, R0                      ; 5D95   02B8 0080
        MVO     R0,     G_0146                  ; 5D97   0240 0146
        SDBD                                    ; 5D99   0001
        MVII    #$5D9F, R3                      ; 5D9A   02BB 009F 005D
        B       L_5DB5                          ; 5D9D   0200 0016

        SDBD                                    ; 5D9F   0001
        MVII    #$5DAF, R1                      ; 5DA0   02B9 00AF 005D
        MVO     R1,     G_035F                  ; 5DA3   0241 035F
        MVII    #$0001, R0                      ; 5DA5   02B8 0001
        MVO     R0,     G_014A                  ; 5DA7   0240 014A
        SLL     R0,     1                       ; 5DA9   0048
        MVO     R0,     G_0148                  ; 5DAA   0240 0148
        J       .EXEC.BD4                       ; 5DAC   0004 0318 03D4

        SUBR    R1,     R5                      ; 5DAF   010D
        INCR    R7                              ; 5DB0   000F

        CLRC                                    ; 5DB1   0006
L_5DB2:
        XOR@    R1,     R6                      ; 5DB2   03CE
        AND@    R5,     R3                      ; 5DB3   03AB
        ADD@    R1,     R7                      ; 5DB4   02CF

L_5DB5:
        PSHR    R3                              ; 5DB5   0273
        MVII    #$01F0, R3                      ; 5DB6   02BB 01F0
        MVII    #$000F, R0                      ; 5DB8   02B8 000F

        JSR     R5,     X_RAND2                 ; 5DBA   0004 0114 029E

        J       .EXEC.CA3                       ; 5DBD   0004 031C 00A3

L_5DC0:
        PSHR    R5                              ; 5DC0   0275

L_5DC1:
        JSR     R5,     .EXEC.A83               ; 5DC1   0004 0118 0283
        JSR     R5,     X_PLAY_SFX1             ; 5DC4   0004 0118 03BB
        DECLE   $0319                           ; 5DC7  SFX data
        DECLE   $003C,  $03A0                   ; 5DC8  SFX data
        DECLE   $00B7                           ; 5DCA  SFX data
        DECLE   $03ED                           ; 5DCB  SFX data
        DECLE   $000B                           ; 5DCC  SFX data
        DECLE   $008F,  $0021                   ; 5DCD  SFX data
        DECLE   $02CF                           ; 5DCF  SFX end

L_5DD0:
        PSHR    R5                              ; 5DD0   0275

L_5DD1:
        JSR     R5,     X_PLAY_SFX1             ; 5DD1   0004 0118 03BB
        DECLE   $015D                           ; 5DD4  SFX data
        DECLE   $0003,  $0016                   ; 5DD5  SFX data
        DECLE   $0275                           ; 5DD7  SFX data
        DECLE   $0004,  $0118                   ; 5DD8  SFX data
        DECLE   $03BB                           ; 5DDA  SFX data
        DECLE   $015D                           ; 5DDB  SFX data
        DECLE   $03F9                           ; 5DDC  SFX data
        DECLE   $0040,  $01AC                   ; 5DDD  SFX data
        DECLE   $0048,  $00D6                   ; 5DDF  SFX data
        DECLE   $0044,  $03F9                   ; 5DE1  SFX data
        DECLE   $01CF                           ; 5DE3  SFX end


        SDBD                                    ; 5DE4   0001
        MVII    #$5DEA, R3                      ; 5DE5   02BB 00EA 005D
        B       L_5DB5                          ; 5DE8   0220 0034

        JSR     R5,     X_PLAY_SFX1             ; 5DEA   0004 0118 03BB
        DECLE   $0003,  $0012                   ; 5DED  SFX data
        DECLE   $0001,  $0043                   ; 5DEF  SFX data
        DECLE   $0003,  $000A                   ; 5DF1  SFX data
        DECLE   $0001,  $03C3                   ; 5DF3  SFX data
        DECLE   $03B7                           ; 5DF5  SFX data
        DECLE   $003C,  $01A7                   ; 5DF6  SFX data
        DECLE   $0309                           ; 5DF8  SFX data
        DECLE   $000B                           ; 5DF9  SFX data
        DECLE   $008F,  $001D                   ; 5DFA  SFX data
        DECLE   $02CF                           ; 5DFC  SFX end

L_5DFD:
        PSHR    R5                              ; 5DFD   0275

        JSR     R5,     X_PLAY_SFX2             ; 5DFE   0004 0118 03BE
        DECLE   $00A0                           ; 5E01  SFX prio
        DECLE   $03ED                           ; 5E02  SFX data
        DECLE   $000F,  $03F4                   ; 5E03  SFX data
        DECLE   $0079                           ; 5E05  SFX data
        DECLE   $010C,  $0000                   ; 5E06  SFX data
        DECLE   $03B7                           ; 5E08  SFX data
        DECLE   $000B                           ; 5E09  SFX data
        DECLE   $03CF                           ; 5E0A  SFX end

L_5E0B:
        PSHR    R5                              ; 5E0B   0275

        JSR     R5,     X_PLAY_SFX2             ; 5E0C   0004 0118 03BE
        DECLE   $00A0                           ; 5E0F  SFX prio
        DECLE   $03C0,  $0025                   ; 5E10  SFX data
        DECLE   $03C8,  $0028                   ; 5E12  SFX data
        DECLE   $03C4,  $002B                   ; 5E14  SFX data
        DECLE   $0001,  $0007                   ; 5E16  SFX data
        DECLE   $03DE                           ; 5E18  SFX data
        DECLE   $0389                           ; 5E19  SFX data
        DECLE   $008F,  $0017                   ; 5E1A  SFX data
        DECLE   $02CF                           ; 5E1C  SFX end

L_5E1D:
        PSHR    R5                              ; 5E1D   0275
        MVI     G_0123, R0                      ; 5E1E   0280 0123
        ANDI    #$00E0, R0                      ; 5E20   03B8 00E0
        CMPI    #$0020, R0                      ; 5E22   0378 0020
        BEQ     L_5E31                          ; 5E24   0204 000B

        MVI     G_0124, R0                      ; 5E26   0280 0124
        ANDI    #$00E0, R0                      ; 5E28   03B8 00E0
        CMPI    #$0020, R0                      ; 5E2A   0378 0020
        BEQ     L_5E31                          ; 5E2C   0204 0003

        JSR     R5,     .EXEC.4F1               ; 5E2E   0004 0114 00F1

L_5E31:
        MVII    #$0187, R4                      ; 5E31   02BC 0187
        MVII    #$0190, R5                      ; 5E33   02BD 0190
L_5E35:
        MVI@    R4,     R0                      ; 5E35   02A0
        SWAP    R0,     1                       ; 5E36   0040
        SAR     R0,     2                       ; 5E37   006C
        SAR     R0,     2                       ; 5E38   006C
        MVI     G_018F, R3                      ; 5E39   0283 018F
        TSTR    R3                              ; 5E3B   009B
        BNEQ    L_5E3F                          ; 5E3C   020C 0001

        SAR     R0,     1                       ; 5E3E   0068
L_5E3F:
        MOVR    R4,     R3                      ; 5E3F   00A3
        SDBD                                    ; 5E40   0001
        ADD@    R4,     R0                      ; 5E41   02E0
        MVO@    R0,     R3                      ; 5E42   0258
        SWAP    R0,     1                       ; 5E43   0040
        MOVR    R0,     R2                      ; 5E44   0082
        INCR    R3                              ; 5E45   000B
        SUB@    R3,     R0                      ; 5E46   0318
        MOVR    R2,     R1                      ; 5E47   0091
        ANDI    #$0007, R1                      ; 5E48   03B9 0007
        MVO@    R1,     R3                      ; 5E4A   0259
        XORR    R1,     R2                      ; 5E4B   01CA
        MVO@    R2,     R5                      ; 5E4C   026A
        INCR    R5                              ; 5E4D   000D
        MVO@    R2,     R5                      ; 5E4E   026A
        ADDI    #$0003, R5                      ; 5E4F   02FD 0003
        SUBR    R0,     R2                      ; 5E51   0102
        MVO@    R2,     R5                      ; 5E52   026A
        INCR    R5                              ; 5E53   000D
        MVO@    R2,     R5                      ; 5E54   026A
        SUBI    #$0006, R5                      ; 5E55   033D 0006
        CMPI    #$0196, R5                      ; 5E57   037D 0196
        BNEQ    L_5E35                          ; 5E59   022C 0025

        MVII    #$0003, R5                      ; 5E5B   02BD 0003
        MVO     R5,     G_019C                  ; 5E5D   0245 019C
        MVII    #$0100, R5                      ; 5E5F   02BD 0100
        SDBD                                    ; 5E61   0001
        MVI@    R5,     R0                      ; 5E62   02A8
        MVO@    R0,     R4                      ; 5E63   0260
        SWAP    R0,     1                       ; 5E64   0040
        MVO@    R0,     R4                      ; 5E65   0260
        MVII    #$008F, R0                      ; 5E66   02B8 008F
        MVII    #$005E, R1                      ; 5E68   02B9 005E
        DIS                                     ; 5E6A   0003
        MVO     R0,     .ISRVEC.0               ; 5E6B   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5E6D   0241 0101
L_5E6F:
        EIS                                     ; 5E6F   0002
        MVI     G_019C, R2                      ; 5E70   0282 019C
        SARC    R2,     2                       ; 5E72   007E
        BNC     L_5E89                          ; 5E73   0209 0014
        BOV     L_5E6F                          ; 5E75   0222 0007

        JSR     R5,     L_562D                  ; 5E77   0004 0154 022D

        MVII    #$0003, R2                      ; 5E7A   02BA 0003
        MVO     R2,     G_019C                  ; 5E7C   0242 019C
        MVII    #$00C3, R0                      ; 5E7E   02B8 00C3
        MVII    #$005E, R1                      ; 5E80   02B9 005E
        DIS                                     ; 5E82   0003
        MVO     R0,     .ISRVEC.0               ; 5E83   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5E85   0241 0101
        B       L_5E6F                          ; 5E87   0220 0019
L_5E89:
        BNOV    L_5E8E                          ; 5E89   020A 0003

        JSR     R5,     L_562D                  ; 5E8B   0004 0154 022D

L_5E8E:
        PULR    R7                              ; 5E8E   02B7

        PSHR    R5                              ; 5E8F   0275
        MVI     G_0190, R4                      ; 5E90   0284 0190
        TSTR    R4                              ; 5E92   00A4
        BEQ     L_5E9A                          ; 5E93   0204 0005

        MVI     G_0193, R4                      ; 5E95   0284 0193
        TSTR    R4                              ; 5E97   00A4
        BNEQ    L_5EB8                          ; 5E98   020C 001E

L_5E9A:
        JSR     R5,     L_5F86                  ; 5E9A   0004 015C 0386

        MVI     G_0189, R0                      ; 5E9D   0280 0189
        MVO     R0,     .STIC.HDLY              ; 5E9F   0240 0030
        MVI     G_018C, R0                      ; 5EA1   0280 018C
        MVO     R0,     .STIC.VDLY              ; 5EA3   0240 0031

        JSR     R5,     L_5EE9                  ; 5EA5   0004 015C 02E9

        CLRR    R2                              ; 5EA8   01D2
        SUBI    #$0008, R2                      ; 5EA9   033A 0008

        JSR     R5,     L_5EF5                  ; 5EAB   0004 015C 02F5
        JSR     R5,     L_5F28                  ; 5EAE   0004 015C 0328

        TSTR    R2                              ; 5EB1   0092
        BMI     L_5ECD                          ; 5EB2   020B 0019

        MVII    #$0002, R0                      ; 5EB4   02B8 0002
        B       L_5ECD                          ; 5EB6   0200 0015

L_5EB8:
        NEGR    R4                              ; 5EB8   0024

        JSR     R5,     L_5ED5                  ; 5EB9   0004 015C 02D5
        JSR     R5,     L_5EF5                  ; 5EBC   0004 015C 02F5

        MVII    #$0001, R0                      ; 5EBF   02B8 0001
        B       L_5ECD                          ; 5EC1   0200 000A

        PSHR    R5                              ; 5EC3   0275
        MOVR    R6,     R4                      ; 5EC4   00B4

        JSR     R5,     L_5ED5                  ; 5EC5   0004 015C 02D5
        JSR     R5,     L_5F28                  ; 5EC8   0004 015C 0328

        MVII    #$0002, R0                      ; 5ECB   02B8 0002
L_5ECD:
        SLL     R2,     2                       ; 5ECD   004E
        XORR    R0,     R2                      ; 5ECE   01C2
        MVO     R2,     G_019C                  ; 5ECF   0242 019C

        JSR     R5,     X_PLAY_NOTE             ; 5ED1   0004 0118 02BD

        PULR    R7                              ; 5ED4   02B7

L_5ED5:
        PSHR    R5                              ; 5ED5   0275
        PSHR    R4                              ; 5ED6   0274

        JSR     R5,     L_5F86                  ; 5ED7   0004 015C 0386

        PULR    R4                              ; 5EDA   02B4
        TSTR    R4                              ; 5EDB   00A4
        BGT     L_5EE2                          ; 5EDC   020E 0004

        MVI     G_0189, R0                      ; 5EDE   0280 0189
        MVO     R0,     .STIC.HDLY              ; 5EE0   0240 0030
L_5EE2:
        BMI     L_5EE8                          ; 5EE2   020B 0004

        MVI     G_018C, R0                      ; 5EE4   0280 018C
        MVO     R0,     .STIC.VDLY              ; 5EE6   0240 0031
L_5EE8:
        INCR    R7                              ; 5EE8   000F

L_5EE9:
        PSHR    R5                              ; 5EE9   0275
L_5EEA:
        MVO     R0,     .STIC.VIDEN             ; 5EEA   0240 0020
        MVI     G_018D, R0                      ; 5EEC   0280 018D
        MVI     G_018E, R1                      ; 5EEE   0281 018E
        MVO     R0,     .ISRVEC.0               ; 5EF0   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5EF2   0241 0101
        PULR    R7                              ; 5EF4   02B7

L_5EF5:
        PSHR    R5                              ; 5EF5   0275
        MVI     G_0190, R0                      ; 5EF6   0280 0190
        SWAP    R0,     2                       ; 5EF8   0044
        BEQ     L_5F27                          ; 5EF9   0204 002C
        BPL     L_5F11                          ; 5EFB   0203 0014

        MVII    #$0200, R5                      ; 5EFD   02BD 0200
        MVII    #$0201, R4                      ; 5EFF   02BC 0201
        CLRR    R2                              ; 5F01   01D2
L_5F02:
        MVII    #$0013, R3                      ; 5F02   02BB 0013
L_5F04:
        MVI@    R4,     R0                      ; 5F04   02A0
        MVO@    R0,     R5                      ; 5F05   0268
        DECR    R3                              ; 5F06   0013
        BNEQ    L_5F04                          ; 5F07   022C 0004

        MVO@    R2,     R5                      ; 5F09   026A
        INCR    R4                              ; 5F0A   000C
        CMPI    #$02E6, R4                      ; 5F0B   037C 02E6
        BLT     L_5F02                          ; 5F0D   0225 000C
        B       L_5F27                          ; 5F0F   0200 0016

L_5F11:
        MVII    #$0212, R5                      ; 5F11   02BD 0212
        MVII    #$0003, R1                      ; 5F13   02B9 0003
        CLRR    R2                              ; 5F15   01D2
L_5F16:
        MVII    #$0013, R3                      ; 5F16   02BB 0013
L_5F18:
        MVI@    R5,     R0                      ; 5F18   02A8
        MVO@    R0,     R5                      ; 5F19   0268
        SUBR    R1,     R5                      ; 5F1A   010D
        DECR    R3                              ; 5F1B   0013
        BNEQ    L_5F18                          ; 5F1C   022C 0005

        INCR    R5                              ; 5F1E   000D
        MVO@    R2,     R5                      ; 5F1F   026A
        ADDI    #$0025, R5                      ; 5F20   02FD 0025
        CMPI    #$02F0, R5                      ; 5F22   037D 02F0
        BLT     L_5F16                          ; 5F24   0225 000F

        INCR    R2                              ; 5F26   000A
L_5F27:
        PULR    R7                              ; 5F27   02B7

L_5F28:
        PSHR    R5                              ; 5F28   0275
        MVI     G_0193, R0                      ; 5F29   0280 0193
        SWAP    R0,     2                       ; 5F2B   0044
        BEQ     L_5F85                          ; 5F2C   0204 0057
        BMI     L_5F79                          ; 5F2E   020B 0049

        MVII    #$02DC, R5                      ; 5F30   02BD 02DC
        MVII    #$0214, R4                      ; 5F32   02BC 0214
        MVII    #$0200, R2                      ; 5F34   02BA 0200
        MVII    #$0014, R1                      ; 5F36   02B9 0014
        MVII    #$000A, R0                      ; 5F38   02B8 000A
L_5F3A:
        PSHR    R0                              ; 5F3A   0270
        MVII    #$0004, R3                      ; 5F3B   02BB 0004
L_5F3D:
        MVI@    R4,     R0                      ; 5F3D   02A0
        MVO@    R0,     R5                      ; 5F3E   0268
        MVI@    R4,     R0                      ; 5F3F   02A0
        MVO@    R0,     R5                      ; 5F40   0268
        MVI@    R4,     R0                      ; 5F41   02A0
        MVO@    R0,     R5                      ; 5F42   0268
        MVI@    R4,     R0                      ; 5F43   02A0
        MVO@    R0,     R5                      ; 5F44   0268
        MVI@    R4,     R0                      ; 5F45   02A0
        MVO@    R0,     R5                      ; 5F46   0268
        DECR    R3                              ; 5F47   0013
        BNEQ    L_5F3D                          ; 5F48   022C 000C

        SUBR    R1,     R4                      ; 5F4A   010C
        SUBR    R1,     R5                      ; 5F4B   010D
        XORR    R2,     R5                      ; 5F4C   01D5
        XORR    R5,     R2                      ; 5F4D   01EA
        XORR    R2,     R5                      ; 5F4E   01D5
        MVII    #$0004, R3                      ; 5F4F   02BB 0004
L_5F51:
        MVI@    R5,     R0                      ; 5F51   02A8
        MVO@    R0,     R4                      ; 5F52   0260
        MVI@    R5,     R0                      ; 5F53   02A8
        MVO@    R0,     R4                      ; 5F54   0260
        MVI@    R5,     R0                      ; 5F55   02A8
        MVO@    R0,     R4                      ; 5F56   0260
        MVI@    R5,     R0                      ; 5F57   02A8
        MVO@    R0,     R4                      ; 5F58   0260
        MVI@    R5,     R0                      ; 5F59   02A8
        MVO@    R0,     R4                      ; 5F5A   0260
        DECR    R3                              ; 5F5B   0013
        BNEQ    L_5F51                          ; 5F5C   022C 000C

        SUBR    R1,     R5                      ; 5F5E   010D
        PULR    R0                              ; 5F5F   02B0
        DECR    R0                              ; 5F60   0010
        BNEQ    L_5F3A                          ; 5F61   022C 0028

        XORR    R2,     R5                      ; 5F63   01D5
        XORR    R5,     R2                      ; 5F64   01EA
        XORR    R2,     R5                      ; 5F65   01D5
        MVII    #$0004, R3                      ; 5F66   02BB 0004
L_5F68:
        MVI@    R5,     R0                      ; 5F68   02A8
        MVO@    R0,     R4                      ; 5F69   0260
        MVI@    R5,     R0                      ; 5F6A   02A8
        MVO@    R0,     R4                      ; 5F6B   0260
        MVI@    R5,     R0                      ; 5F6C   02A8
        MVO@    R0,     R4                      ; 5F6D   0260
        MVI@    R5,     R0                      ; 5F6E   02A8
        MVO@    R0,     R4                      ; 5F6F   0260
        MVI@    R5,     R0                      ; 5F70   02A8
        MVO@    R0,     R4                      ; 5F71   0260
        DECR    R3                              ; 5F72   0013
        BNEQ    L_5F68                          ; 5F73   022C 000C

        MVII    #$0003, R2                      ; 5F75   02BA 0003
        B       L_5F85                          ; 5F77   0200 000C

L_5F79:
        MVII    #$0200, R5                      ; 5F79   02BD 0200
        MVII    #$0214, R4                      ; 5F7B   02BC 0214
L_5F7D:
        MVI@    R4,     R0                      ; 5F7D   02A0
        MVO@    R0,     R5                      ; 5F7E   0268
        CMPI    #$02DC, R5                      ; 5F7F   037D 02DC
        BNEQ    L_5F7D                          ; 5F81   022C 0005

        MVII    #$0002, R2                      ; 5F83   02BA 0002
L_5F85:
        PULR    R7                              ; 5F85   02B7

L_5F86:
        PSHR    R5                              ; 5F86   0275
        MVII    #$031D, R2                      ; 5F87   02BA 031D
        CLRR    R3                              ; 5F89   01DB
L_5F8A:
        MVII    #$0196, R5                      ; 5F8A   02BD 0196
        MVI@    R2,     R0                      ; 5F8C   0290
        ADDI    #$0002, R2                      ; 5F8D   02FA 0002
        SLL     R0,     1                       ; 5F8F   0048
        BPL     L_5F94                          ; 5F90   0203 0002

        MVII    #$0190, R5                      ; 5F92   02BD 0190
L_5F94:
        TSTR    R4                              ; 5F94   00A4
        BLE     L_5F9B                          ; 5F95   0206 0004

        ADDI    #$0003, R5                      ; 5F97   02FD 0003
        B       L_5FA9                          ; 5F99   0200 000E

L_5F9B:
        MVI@    R3,     R0                      ; 5F9B   0298
        MOVR    R0,     R1                      ; 5F9C   0081
        ANDI    #$00FF, R1                      ; 5F9D   03B9 00FF
        XORR    R1,     R0                      ; 5F9F   01C8
        ADD@    R5,     R1                      ; 5FA0   02E9
        ANDI    #$00FF, R1                      ; 5FA1   03B9 00FF
        XORR    R1,     R0                      ; 5FA3   01C8
        MVO@    R0,     R3                      ; 5FA4   0258
        MVI@    R2,     R0                      ; 5FA5   0290
        SDBD                                    ; 5FA6   0001
        ADD@    R5,     R0                      ; 5FA7   02E8
        MVO@    R0,     R2                      ; 5FA8   0250
L_5FA9:
        INCR    R2                              ; 5FA9   000A
        TSTR    R4                              ; 5FAA   00A4
        BMI     L_5FBF                          ; 5FAB   020B 0012

        XORI    #$0008, R3                      ; 5FAD   03FB 0008
        MVI@    R3,     R0                      ; 5FAF   0298
        MOVR    R0,     R1                      ; 5FB0   0081
        ANDI    #$007F, R1                      ; 5FB1   03B9 007F
        XORR    R1,     R0                      ; 5FB3   01C8
        ADD@    R5,     R1                      ; 5FB4   02E9
        ANDI    #$007F, R1                      ; 5FB5   03B9 007F
        XORR    R1,     R0                      ; 5FB7   01C8
        MVO@    R0,     R3                      ; 5FB8   0258
        XORI    #$0008, R3                      ; 5FB9   03FB 0008
        MVI@    R2,     R0                      ; 5FBB   0290
        SDBD                                    ; 5FBC   0001
        ADD@    R5,     R0                      ; 5FBD   02E8
        MVO@    R0,     R2                      ; 5FBE   0250
L_5FBF:
        ADDI    #$0005, R2                      ; 5FBF   02FA 0005
        INCR    R3                              ; 5FC1   000B
        CMPI    #$0008, R3                      ; 5FC2   037B 0008
        BNEQ    L_5F8A                          ; 5FC4   022C 003B
        PULR    R7                              ; 5FC6   02B7

L_5FC7:
        PSHR    R5                              ; 5FC7   0275

        JSR     R5,     .EXEC.7C1               ; 5FC8   0004 0114 03C1

        MVII    #$0315, R1                      ; 5FCB   02B9 0315
L_5FCD:
        ADDI    #$0008, R1                      ; 5FCD   02F9 0008
        CMPI    #$035D, R1                      ; 5FCF   0379 035D
        BGE     L_5FED                          ; 5FD1   020D 001A

        MVII    #$0054, R2                      ; 5FD3   02BA 0054
        SUB     G_0189, R2                      ; 5FD5   0302 0189
        SWAP    R2,     1                       ; 5FD7   0042
        ADDI    #$0034, R2                      ; 5FD8   02FA 0034
        SUB     G_018C, R2                      ; 5FDA   0302 018C
        SDBD                                    ; 5FDC   0001
        MVII    #$5434, R4                      ; 5FDD   02BC 0034 0054

        JSR     R5,     .EXEC.6F7               ; 5FE0   0004 0114 02F7

        BC      L_5FCD                          ; 5FE3   0221 0017

        JSR     R5,     .EXEC.766               ; 5FE5   0004 0114 0366
        JSR     R5,     L_559C                  ; 5FE8   0004 0154 019C

        B       L_5FCD                          ; 5FEB   0220 001F
L_5FED:
        PULR    R7                              ; 5FED   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5FFE   0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $505B       <entry>
;;  $50CC       <entry>
;;  $50EB       $50E7  
;;  $50EF       $50EC  
;;  $50F6       $50DB  
;;  $50F7       $50D0  
;;  $5103       $50FC  
;;  $5128       $5107   $510D  
;;  $5129       $52A7   $533D  
;;  $513F       $511A   $51C6   $52D2  
;;  $5160       $515A  
;;  $5163       $5158  
;;  $5167       $5156  
;;  $5168       $515E   $5161   $5165  
;;  $5189       $50D6  
;;  $51E9       $51DC  
;;  $51ED       $51E7  
;;  $51F7       $5194  
;;  $520A       $520A  
;;  $520F       $519F  
;;  $5230       $5224  
;;  $524B       $5241  
;;  $5253       $5249  
;;  $5259       $5256  
;;  $525F       $522A  
;;  $5286       $526F   $527A   $527F  
;;  $52B5       $51AC  
;;  $52F5       $519A   $5212   $5236   $5263   $52BB   $52C9   $52DF  
;;  $5337       $5327   $5349  
;;  $533C       $52FB   $5335  
;;  $533D       $531F  
;;  $534B       <entry>
;;  $536B       $535D  
;;  $5377       $537E   $5382  
;;  $537A       $5375  
;;  $5389       $5386  
;;  $538F       $50A0   $5814  
;;  $5390       $5354   $5370  
;;  $53A5       $539F  
;;  $53A7       $5391  
;;  $53A8       $5826  
;;  $53D8       $53B1  
;;  $53E6       $53D6  
;;  $53EE       $53DD  
;;  $53EF       $53E4  
;;  $53FC       $53F9  
;;  $5407       $5404  
;;  $5408       $5401  
;;  $540F       <entry>
;;  $5446       $5413   $5418   $541E  
;;  $5447       $53B3  
;;  $545B       $5457  
;;  $546F       $5468  
;;  $5471       $5465   $546D  
;;  $548D       $544F  
;;  $548E       $541A  
;;  $549D       $5493   $549A  
;;  $549F       $50BF   $5100  
;;  $54BD       $54A7   $54AD   $54B3  
;;  $54BE       $54A9  
;;  $54C4       $54AB  
;;  $54CB       $54B9  
;;  $54DD       $54D8  
;;  $54F6       $54AF  
;;  $54F9       $54B1  
;;  $54FB       $54F4  
;;  $5502       $54B5  
;;  $5503       $54B7  
;;  $5506       $54BB  
;;  $551B       $54A3   $54CF  
;;  $552F       $54E8  
;;  $5530       $557B  
;;  $553B       $5542  
;;  $5544       $53AC  
;;  $5545       <entry>
;;  $5554       $554E  
;;  $5561       $5559  
;;  $5572       $5556  
;;  $557D       $5574  
;;  $558E       $5599  
;;  $559C       $55C4   $5FE8  
;;  $55B4       $55B0  
;;  $55BA       $55B6  
;;  $55BE       $55A6  
;;  $55C0       $5564   $57AB   $5969  
;;  $55C3       $55C8  
;;  $55CB       $5109   $5196   $525F   $52DA   $5359   $5700  
;;  $55CE       $55D7  
;;  $55DA       $55D1  
;;  $55DC       $550A   $57A8   $58BA  
;;  $55E4       $581B  
;;  $55E5       $55E2  
;;  $55E7       $55F4  
;;  $55EE       $55EB  
;;  $55F7       $50B1   $57F1  
;;  $55F8       $5640  
;;  $5600       $562A  
;;  $560B       $5606  
;;  $5625       $5618  
;;  $5627       $5609   $5623  
;;  $562D       $5E77   $5E8B  
;;  $5673       $566B  
;;  $5691       $568E  
;;  $569E       $5695  
;;  $56A1       $565E  
;;  $56BC       $56B6  
;;  $56BD       $56BA  
;;  $56C2       $56A7  
;;  $56C9       $5671   $569C  
;;  $56E2       $56D1  
;;  $56E9       $56C7   $56D9   $56E6  
;;  $56F2       $56E0  
;;  $5719       $56F0  
;;  $571E       $56F6  
;;  $572F       $5755   $5779  
;;  $573C       $5652   $5664   $567C   $5682  
;;  $573D       $56FE  
;;  $5757       $5704  
;;  $5773       $5766  
;;  $577B       $5771  
;;  $5785       $577F  
;;  $57D5       $579B  
;;  $57D6       $57AE   $5802  
;;  $57EA       $5921  
;;  $5805       $57FD  
;;  $581B       $57F8  
;;  $5830       $50BA   $54D4   $5518   $56E9   $57CB  
;;  $5846       $5857   $5860  
;;  $5854       $584A  
;;  $5859       $5847  
;;  $5862       $5852   $585B  
;;  $586A       $58D2  
;;  $5874       $586B  
;;  $5884       $5898  
;;  $589A       $588F  
;;  $58A4       $5879  
;;  $58AD       $587B   $589C   $58A9  
;;  $58C4       $58C8  
;;  $58D4       $58B5  
;;  $58E5       $58D5  
;;  $5909       $5902  
;;  $5911       $58F3   $5907  
;;  $5919       $591D  
;;  $5924       $5839   $58E8   $5914  
;;  $5926       $584F  
;;  $5929       $5871   $59A2  
;;  $593B       $592C  
;;  $5946       $5886   $58AD  
;;  $594C       $5953  
;;  $5955       $594E  
;;  $595F       $57FF  
;;  $59A5       $59A6  
;;  $59AE       $5962  
;;  $59BE       $580A  
;;  $59C0       $5581   $57D2   $597A  
;;  $59E0       $59DA  
;;  $59EC       $50CD  
;;  $59F0       $59FA   $5A00  
;;  $5A15       $5A0F  
;;  $5A17       $59F4  
;;  $5A39       $5A37  
;;  $5A3E       $5A3C  
;;  $5A52       $5A50  
;;  $5A6B       $5A69  
;;  $5D76       $58B7  
;;  $5D7F       $52B2  
;;  $5DB2       $5DB0  
;;  $5DB5       $5D9D   $5DE8  
;;  $5DC0       $5720  
;;  $5DC1       $569E  
;;  $5DD0       $5759  
;;  $5DD1       $5716  
;;  $5DFD       $571A   $57BA  
;;  $5E0B       $54E3  
;;  $5E1D       <entry>
;;  $5E31       $5E24   $5E2C  
;;  $5E35       $5E59  
;;  $5E3F       $5E3C  
;;  $5E6F       $5E75   $5E87  
;;  $5E89       $5E73  
;;  $5E8E       $5E89  
;;  $5E9A       $5E93  
;;  $5EB8       $5E98  
;;  $5ECD       $5EB2   $5EB6   $5EC1  
;;  $5ED5       $5EB9   $5EC5  
;;  $5EE2       $5EDC  
;;  $5EE8       $5EE2  
;;  $5EE9       $5EA5  
;;  $5EEA       $5EE8  
;;  $5EF5       $5EAB   $5EBC  
;;  $5F02       $5F0D  
;;  $5F04       $5F07  
;;  $5F11       $5EFB  
;;  $5F16       $5F24  
;;  $5F18       $5F1C  
;;  $5F27       $5EF9   $5F0F  
;;  $5F28       $5EAE   $5EC8  
;;  $5F3A       $5F61  
;;  $5F3D       $5F48  
;;  $5F51       $5F5C  
;;  $5F68       $5F73  
;;  $5F79       $5F2E  
;;  $5F7D       $5F81  
;;  $5F85       $5F2C   $5F77  
;;  $5F86       $5E9A   $5ED7  
;;  $5F8A       $5FC4  
;;  $5F94       $5F90  
;;  $5F9B       $5F95  
;;  $5FA9       $5F99  
;;  $5FBF       $5FAB  
;;  $5FC7       <entry>
;;  $5FCD       $5FE3   $5FEB  
;;  $5FED       $5FD1  
;; ======================================================================== ;;
