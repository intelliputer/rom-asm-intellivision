
        ORG     $5000
.HEADER:
        BIDECLE $5FF4           ; 5000  Ptr: MOB graphic images
        BIDECLE $5015           ; 5002  Ptr: EXEC timer table
        BIDECLE $5033           ; 5004  Ptr: Start of game
        BIDECLE $5F54           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $50DA           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5027           ; 500A  Ptr: Date/Title
        DECLE   $0003           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0008           ; 5013  Border color init

        DECLE   $01F8                           ; 5014   01F8
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 5015  Timer dispatch/interval
        DECLE   $0090,  $0057,  $0004,  $0080; 5019  Timer dispatch/interval
        DECLE   $00BB,  $0057,  $0005,  $0080; 501D  Timer dispatch/interval
        DECLE   $0057,  $0054,  $0005,  $0080; 5021  Timer dispatch/interval
        BIDECLE $0000           ; 5025  End of timer table

.TITLE:
        DECLE   $004E                           ; 5027  Cartridge year
        STRING  "BACKGAMMON"                    ; 5028  Title string
        DECLE   $0000                           ; 5032  

.START:
        PSHR    R5                              ; 5033   0275
        SDBD                                    ; 5034   0001
        MVII    #$5431, R0                      ; 5035   02B8 0031 0054
        MVO     R0,     G_0349                  ; 5038   0240 0349
        MVII    #$0001, R0                      ; 503A   02B8 0001
        MVO     R0,     G_0147                  ; 503C   0240 0147
        CLRR    R0                              ; 503E   01C0
        MVO     R0,     G_018B                  ; 503F   0240 018B
        MVO     R0,     G_031F                  ; 5041   0240 031F
        MVO     R0,     G_0320                  ; 5043   0240 0320

        JSR     R5,     L_504F                  ; 5045   0004 0150 004F
        JSR     R5,     L_5088                  ; 5048   0004 0150 0088
        JSR     R5,     L_52A4                  ; 504B   0004 0150 02A4

        PULR    R7                              ; 504E   02B7

L_504F:
        PSHR    R5                              ; 504F   0275
        MVII    #$0200, R4                      ; 5050   02BC 0200
        SDBD                                    ; 5052   0001
        MVII    #$1908, R1                      ; 5053   02B9 0008 0019
        MVII    #$00F0, R0                      ; 5056   02B8 00F0

        JSR     R5,     X_FILL_MEM              ; 5058   0004 0114 0341

        MVII    #$000C, R2                      ; 505B   02BA 000C
        SDBD                                    ; 505D   0001
        MVII    #$18E4, R0                      ; 505E   02B8 00E4 0018
        MVII    #$0201, R1                      ; 5061   02B9 0201

        JSR     R5,     L_517A                  ; 5063   0004 0150 017A

        SDBD                                    ; 5066   0001
        MVII    #$1914, R0                      ; 5067   02B8 0014 0019
        MVII    #$020F, R1                      ; 506A   02B9 020F

        JSR     R5,     L_517A                  ; 506C   0004 0150 017A

L_506F:
        SDBD                                    ; 506F   0001
        MVII    #$50FB, R0                      ; 5070   02B8 00FB 0050
        MVO     R0,     G_035D                  ; 5073   0240 035D
        MVII    #$0001, R0                      ; 5075   02B8 0001
        MVO     R0,     G_0104                  ; 5077   0240 0104
        SDBD                                    ; 5079   0001
        MVII    #$50CA, R1                      ; 507A   02B9 00CA 0050
        SDBD                                    ; 507D   0001
        MVII    #$031D, R2                      ; 507E   02BA 001D 0003

        JSR     R5,     X_INIT_MOB              ; 5081   0004 0114 02B2
        JSR     R5,     L_5477                  ; 5084   0004 0154 0077

        PULR    R7                              ; 5087   02B7

L_5088:
        PSHR    R5                              ; 5088   0275
        MVII    #$0001, R0                      ; 5089   02B8 0001
        MVO     R0,     G_0187                  ; 508B   0240 0187
        MVII    #$000E, R0                      ; 508D   02B8 000E
        SDBD                                    ; 508F   0001
        MVII    #$0325, R4                      ; 5090   02BC 0025 0003

        JSR     R5,     X_FILL_ZERO             ; 5093   0004 0114 0338

        MVII    #$0002, R0                      ; 5096   02B8 0002
        NEGR    R0                              ; 5098   0020
        MVII    #$0002, R1                      ; 5099   02B9 0002

        JSR     R5,     X_PACK_BYTES            ; 509B   0004 0114 034F

        MVO     R0,     G_0325                  ; 509E   0240 0325
        MVII    #$0005, R0                      ; 50A0   02B8 0005
        MVII    #$0005, R1                      ; 50A2   02B9 0005
        NEGR    R1                              ; 50A4   0021

        JSR     R5,     X_PACK_BYTES            ; 50A5   0004 0114 034F

        MVO     R0,     G_032A                  ; 50A8   0240 032A
        MVII    #$0003, R0                      ; 50AA   02B8 0003
        MVII    #$0003, R1                      ; 50AC   02B9 0003
        NEGR    R1                              ; 50AE   0021

        JSR     R5,     X_PACK_BYTES            ; 50AF   0004 0114 034F

        MVO     R0,     G_032C                  ; 50B2   0240 032C
        MVII    #$0005, R0                      ; 50B4   02B8 0005
        NEGR    R0                              ; 50B6   0020
        MVII    #$0005, R1                      ; 50B7   02B9 0005

        JSR     R5,     X_PACK_BYTES            ; 50B9   0004 0114 034F

        MVO     R0,     G_0330                  ; 50BC   0240 0330
        CLRR    R0                              ; 50BE   01C0
        COMR    R0                              ; 50BF   0018
        MVO     R0,     G_0346                  ; 50C0   0240 0346
        PULR    R7                              ; 50C2   02B7
        ADD@    R4,     R7                      ; 50C3   02E7

        DECLE   $0058,  $00D8,  $0055,  $0001   ; 50C4   0058 00D8 0055 0001
        DECLE   $0000,  $0000,  $0086,  $0000   ; 50C8   0000 0000 0086 0000
        DECLE   $00C3,  $0050,  $0000,  $0000   ; 50CC   00C3 0050 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50D0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50D4   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 50D8   0000 0000
.GRAM_INIT_50DA:
        DECLE   $0023           ; 50DA  # of GRAM cards to init
        DECLE   $0001,  $0100   ; 50DB  #00-02:  CART #00-02 ----
        DECLE   $015D,  $003C   ; 50DD  #03   :  4x4 tile
        DECLE   $0007,  $0200   ; 50DF  #04-08:  CART #03-07 ----
        DECLE   $01DD,  $003C   ; 50E1  #09   :  4x4 tile
        DECLE   $0201,  $01C0   ; 50E3  #0A-0D:  GRAM #00-03 X---
        DECLE   $0101,  $03C0   ; 50E5  #0E-15:  GRAM #00-07 -Y--
        DECLE   $0111,  $0040   ; 50E7  #16-16:  GRAM #08-08 -Y--
        DECLE   $0301,  $01C0   ; 50E9  #17-1A:  GRAM #00-03 XY--
        DECLE   $02E1,  $01DC   ; 50EB  #1B   :  4x4 tile
        DECLE   $0199,  $0334   ; 50ED  #1C   :  4x4 tile
        DECLE   $01FF,  $0004   ; 50EF  #1D   :  4x4 tile
        DECLE   $00CD,  $019C   ; 50F1  #1E   :  4x4 tile
        DECLE   $0025,  $0070   ; 50F3  #1F-1F:  GROM #12-12 ----
        DECLE   $0027,  $0078   ; 50F5  #20-20:  GROM #13-13 ---R
        DECLE   $0001,  $0004   ; 50F7  #21   :  4x4 tile
        DECLE   $0267,  $00CC   ; 50F9  #22   :  4x4 tile

        DECLE   $0009,  $0051,  $000D,  $0051   ; 50FB   0009 0051 000D 0051
        DECLE   $0005,  $0051,  $0000,  $0000   ; 50FF   0005 0051 0000 0000
        DECLE   $0000,  $0000                   ; 5103   0000 0000

        PSHR    R5                              ; 5105   0275
        MVI     G_0349, R2                      ; 5106   0282 0349
        MOVR    R2,     R7                      ; 5108   0097

        MVI     G_0348, R2                      ; 5109   0282 0348
        B       L_5111                          ; 510B   0200 0004

        MVI     G_0347, R2                      ; 510D   0282 0347
        B       L_5111                          ; 510F   0200 0000

L_5111:
        PSHR    R5                              ; 5111   0275
        TSTR    R0                              ; 5112   0080
        BMI     L_5127                          ; 5113   020B 0012

        TSTR    R2                              ; 5115   0092
        BEQ     L_5127                          ; 5116   0204 000F

        MVI     G_0335, R3                      ; 5118   0283 0335
        TSTR    R3                              ; 511A   009B
        BMI     L_5121                          ; 511B   020B 0004

        ADD     G_0337, R1                      ; 511D   02C1 0337
        BNEQ    L_5127                          ; 511F   020C 0006
L_5121:
        MOVR    R2,     R7                      ; 5121   0097

L_5122:
        MVII    #$0001, R0                      ; 5122   02B8 0001

        JSR     R5,     X_PLAY_RAZZ4            ; 5124   0004 011C 02C4

L_5127:
        PULR    R7                              ; 5127   02B7

        JSR     R5,     L_5148                  ; 5128   0004 0150 0148

        BNC     L_513A                          ; 512B   0209 000D

        JSR     R5,     L_53D9                  ; 512D   0004 0150 03D9

        MVI     G_034E, R0                      ; 5130   0280 034E
        MVI     G_034D, R1                      ; 5132   0281 034D
        CLRR    R2                              ; 5134   01D2
        CMPR    R0,     R1                      ; 5135   0141
        BLT     L_5142                          ; 5136   0205 000A
        BGT     L_5141                          ; 5138   020E 0007

L_513A:
        SDBD                                    ; 513A   0001
        MVII    #$550E, R0                      ; 513B   02B8 000E 0055
        MVO     R0,     G_0347                  ; 513E   0240 0347
        PULR    R7                              ; 5140   02B7

L_5141:
        COMR    R2                              ; 5141   001A
L_5142:
        MVO     R2,     G_0337                  ; 5142   0242 0337

        JSR     R5,     L_5AC3                  ; 5144   0004 0158 02C3

        PULR    R7                              ; 5147   02B7

L_5148:
        CMPI    #$0007, R0                      ; 5148   0378 0007
        BLT     L_5152                          ; 514A   0205 0006

        CMPI    #$0009, R0                      ; 514C   0378 0009
        BGT     L_5152                          ; 514E   020E 0002

        SETC                                    ; 5150   0007
        MOVR    R5,     R7                      ; 5151   00AF

L_5152:
        CLRC                                    ; 5152   0006
        MOVR    R5,     R7                      ; 5153   00AF

L_5154:
        PSHR    R5                              ; 5154   0275
        CLRR    R0                              ; 5155   01C0
        PSHR    R1                              ; 5156   0271
L_5157:
        TSTR    R1                              ; 5157   0089
        BEQ     L_515E                          ; 5158   0204 0004

        DECR    R1                              ; 515A   0011
        ADDR    R2,     R0                      ; 515B   00D0
        B       L_5157                          ; 515C   0220 0006

L_515E:
        PULR    R1                              ; 515E   02B1
        PULR    R7                              ; 515F   02B7

L_5160:
        PSHR    R5                              ; 5160   0275
        MVII    #$000C, R1                      ; 5161   02B9 000C
        PSHR    R2                              ; 5163   0272
        PSHR    R4                              ; 5164   0274
        ADDI    #$0200, R2                      ; 5165   02FA 0200
L_5167:
        SDBD                                    ; 5167   0001
        MVI@    R4,     R0                      ; 5168   02A0
        MVO@    R0,     R2                      ; 5169   0250
        ADDI    #$0014, R2                      ; 516A   02FA 0014
        DECR    R1                              ; 516C   0011
        BNEQ    L_5167                          ; 516D   022C 0007

        PULR    R4                              ; 516F   02B4
        PULR    R2                              ; 5170   02B2
        PULR    R7                              ; 5171   02B7

L_5172:
        PSHR    R5                              ; 5172   0275
        PSHR    R4                              ; 5173   0274
        SDBD                                    ; 5174   0001
        MVII    #$FE00, R4                      ; 5175   02BC 0000 00FE
        B       L_517D                          ; 5178   0200 0003

L_517A:
        PSHR    R5                              ; 517A   0275
        PSHR    R4                              ; 517B   0274
        CLRR    R4                              ; 517C   01E4
L_517D:
        PSHR    R2                              ; 517D   0272
        TSTR    R2                              ; 517E   0092
L_517F:
        BEQ     L_518C                          ; 517F   0204 000B

        PSHR    R0                              ; 5181   0270
        MVI@    R1,     R5                      ; 5182   028D
        ANDR    R4,     R5                      ; 5183   01A5
        XORR    R5,     R0                      ; 5184   01E8
        MVO@    R0,     R1                      ; 5185   0248
        PULR    R0                              ; 5186   02B0
        ADDI    #$0014, R1                      ; 5187   02F9 0014
        DECR    R2                              ; 5189   0012
        B       L_517F                          ; 518A   0220 000C

L_518C:
        PULR    R2                              ; 518C   02B2
        PULR    R4                              ; 518D   02B4
        PULR    R7                              ; 518E   02B7

L_518F:
        PSHR    R5                              ; 518F   0275
        CMPI    #$000D, R0                      ; 5190   0378 000D
        BLT     L_51A3                          ; 5192   0205 000F
        BGT     L_519D                          ; 5194   020E 0007

        MVII    #$0008, R0                      ; 5196   02B8 0008
        SDBD                                    ; 5198   0001
        MVII    #$5FDC, R1                      ; 5199   02B9 00DC 005F
        PULR    R7                              ; 519C   02B7

L_519D:
        CLRR    R0                              ; 519D   01C0
        SDBD                                    ; 519E   0001
        MVII    #$5FC4, R1                      ; 519F   02B9 00C4 005F
        PULR    R7                              ; 51A2   02B7

L_51A3:
        SUBI    #$0006, R0                      ; 51A3   0338 0006
        BGT     L_51B6                          ; 51A5   020E 000F

        ADDI    #$0007, R0                      ; 51A7   02F8 0007
        RRC     R0,     1                       ; 51A9   0070
        SDBD                                    ; 51AA   0001
        MVII    #$5F94, R1                      ; 51AB   02B9 0094 005F
        BNC     L_51B4                          ; 51AE   0209 0004

        SDBD                                    ; 51B0   0001
        MVII    #$5FAC, R1                      ; 51B1   02B9 00AC 005F
L_51B4:
        RLC     R0,     1                       ; 51B4   0050
        PULR    R7                              ; 51B5   02B7

L_51B6:
        ADDI    #$0008, R0                      ; 51B6   02F8 0008
        RRC     R0,     1                       ; 51B8   0070
        SDBD                                    ; 51B9   0001
        MVII    #$5FAC, R1                      ; 51BA   02B9 00AC 005F
        BNC     L_51C3                          ; 51BD   0209 0004

        SDBD                                    ; 51BF   0001
        MVII    #$5F94, R1                      ; 51C0   02B9 0094 005F
L_51C3:
        RLC     R0,     1                       ; 51C3   0050
        PULR    R7                              ; 51C4   02B7

L_51C5:
        PSHR    R5                              ; 51C5   0275
        MVI@    R1,     R5                      ; 51C6   028D
        SDBD                                    ; 51C7   0001
        ANDI    #$FE00, R5                      ; 51C8   03BD 0000 00FE
        PULR    R7                              ; 51CB   02B7

L_51CC:
        PSHR    R5                              ; 51CC   0275
        TSTR    R3                              ; 51CD   009B
        BPL     L_51D1                          ; 51CE   0203 0001

        NEGR    R3                              ; 51D0   0023
L_51D1:
        PSHR    R3                              ; 51D1   0273
        SDBD                                    ; 51D2   0001
        ADDI    #$0324, R3                      ; 51D3   02FB 0024 0003
        MVI@    R3,     R0                      ; 51D6   0298

        JSR     R5,     X_UNPK_BYTES            ; 51D7   0004 0114 0357

        MOVR    R1,     R3                      ; 51DA   008B
        PULR    R0                              ; 51DB   02B0
        PSHR    R0                              ; 51DC   0270

        JSR     R5,     L_518F                  ; 51DD   0004 0150 018F

        MOVR    R0,     R2                      ; 51E0   0082
        MOVR    R1,     R4                      ; 51E1   008C

        JSR     R5,     L_5160                  ; 51E2   0004 0150 0160

        TSTR    R3                              ; 51E5   009B
        BNEQ    L_51EA                          ; 51E6   020C 0002
        B       L_5233                          ; 51E8   0200 0049

L_51EA:
        PSHR    R3                              ; 51EA   0273
        TSTR    R3                              ; 51EB   009B
        BPL     L_51EF                          ; 51EC   0203 0001

        NEGR    R3                              ; 51EE   0023
L_51EF:
        SUBI    #$0005, R3                      ; 51EF   033B 0005
        BGE     L_5205                          ; 51F1   020D 0012

        PULR    R3                              ; 51F3   02B3
        MVII    #$0027, R0                      ; 51F4   02B8 0027
        TSTR    R3                              ; 51F6   009B
        BPL     L_51FC                          ; 51F7   0203 0003

        MVII    #$0020, R0                      ; 51F9   02B8 0020
        NEGR    R3                              ; 51FB   0023
L_51FC:
        MOVR    R2,     R1                      ; 51FC   0091
        ADDI    #$0214, R1                      ; 51FD   02F9 0214
        MOVR    R3,     R2                      ; 51FF   009A

        JSR     R5,     L_5172                  ; 5200   0004 0150 0172

        B       L_5233                          ; 5203   0200 002E

L_5205:
        PULR    R4                              ; 5205   02B4
        PSHR    R4                              ; 5206   0274
        MVII    #$0027, R0                      ; 5207   02B8 0027
        TSTR    R4                              ; 5209   00A4
        BPL     L_520E                          ; 520A   0203 0002

        MVII    #$0020, R0                      ; 520C   02B8 0020
L_520E:
        MOVR    R2,     R1                      ; 520E   0091
        ADDI    #$0214, R1                      ; 520F   02F9 0214
        MVII    #$0005, R2                      ; 5211   02BA 0005

        JSR     R5,     L_5172                  ; 5213   0004 0150 0172

        SUBI    #$0014, R1                      ; 5216   0339 0014
        PULR    R4                              ; 5218   02B4
        MVII    #$002F, R0                      ; 5219   02B8 002F
        MVII    #$0037, R2                      ; 521B   02BA 0037
        TSTR    R4                              ; 521D   00A4
        BPL     L_5224                          ; 521E   0203 0004

        MVII    #$0028, R0                      ; 5220   02B8 0028
        MVII    #$0030, R2                      ; 5222   02BA 0030

L_5224:
        JSR     R5,     L_51C5                  ; 5224   0004 0150 01C5

        XORR    R5,     R0                      ; 5227   01E8
        XORR    R5,     R2                      ; 5228   01EA
L_5229:
        TSTR    R3                              ; 5229   009B
        BNEQ    L_522E                          ; 522A   020C 0002
        B       L_5233                          ; 522C   0200 0005

L_522E:
        CMPI    #$0001, R3                      ; 522E   037B 0001
        BGT     L_5238                          ; 5230   020E 0006

        MVO@    R0,     R1                      ; 5232   0248
L_5233:
        PULR    R3                              ; 5233   02B3

        JSR     R5,     L_523F                  ; 5234   0004 0150 023F

        PULR    R7                              ; 5237   02B7

L_5238:
        MVO@    R2,     R1                      ; 5238   024A
        SUBI    #$0002, R3                      ; 5239   033B 0002
        SUBI    #$0014, R1                      ; 523B   0339 0014
        B       L_5229                          ; 523D   0220 0015

L_523F:
        PSHR    R5                              ; 523F   0275
        MOVR    R3,     R0                      ; 5240   0098
        SDBD                                    ; 5241   0001
        ADDI    #$0324, R3                      ; 5242   02FB 0024 0003

        JSR     R5,     L_518F                  ; 5245   0004 0150 018F

        MOVR    R0,     R2                      ; 5248   0082
        MVI@    R3,     R0                      ; 5249   0298

        JSR     R5,     X_UNPK_BYTES            ; 524A   0004 0114 0357

        MOVR    R0,     R1                      ; 524D   0081
        TSTR    R1                              ; 524E   0089
        BNEQ    L_5252                          ; 524F   020C 0001
        PULR    R7                              ; 5251   02B7

L_5252:
        PSHR    R1                              ; 5252   0271
        MVII    #$0097, R0                      ; 5253   02B8 0097
        TSTR    R1                              ; 5255   0089
        BPL     L_525B                          ; 5256   0203 0003

        MVII    #$0090, R0                      ; 5258   02B8 0090
        NEGR    R1                              ; 525A   0021
L_525B:
        CMPI    #$0005, R1                      ; 525B   0379 0005
        BGE     L_5275                          ; 525D   020D 0016

        MOVR    R0,     R3                      ; 525F   0083
        MOVR    R2,     R4                      ; 5260   0094
        PSHR    R1                              ; 5261   0271
        SUBI    #$000B, R1                      ; 5262   0339 000B
        NEGR    R1                              ; 5264   0021
        ADDI    #$0200, R4                      ; 5265   02FC 0200
        MVII    #$0014, R2                      ; 5267   02BA 0014

        JSR     R5,     L_5154                  ; 5269   0004 0150 0154

        ADDR    R4,     R0                      ; 526C   00E0
        PULR    R2                              ; 526D   02B2
        MOVR    R0,     R1                      ; 526E   0081
        MOVR    R3,     R0                      ; 526F   0098

        JSR     R5,     L_5172                  ; 5270   0004 0150 0172

        PULR    R0                              ; 5273   02B0
        PULR    R7                              ; 5274   02B7

L_5275:
        MOVR    R2,     R1                      ; 5275   0091
        ADDI    #$0278, R1                      ; 5276   02F9 0278
        MVII    #$0005, R2                      ; 5278   02BA 0005

        JSR     R5,     L_5172                  ; 527A   0004 0150 0172

        PULR    R0                              ; 527D   02B0
        MVII    #$009F, R3                      ; 527E   02BB 009F
        MVII    #$00A7, R4                      ; 5280   02BC 00A7
        TSTR    R0                              ; 5282   0080
        BPL     L_528A                          ; 5283   0203 0005

        MVII    #$0098, R3                      ; 5285   02BB 0098
        MVII    #$00A0, R4                      ; 5287   02BC 00A0
        NEGR    R0                              ; 5289   0020
L_528A:
        SUBI    #$0005, R0                      ; 528A   0338 0005
        SUBI    #$0064, R1                      ; 528C   0339 0064

        JSR     R5,     L_51C5                  ; 528E   0004 0150 01C5

        XORR    R5,     R4                      ; 5291   01EC
        XORR    R5,     R3                      ; 5292   01EB
L_5293:
        TSTR    R0                              ; 5293   0080
        BNEQ    L_5297                          ; 5294   020C 0001
        PULR    R7                              ; 5296   02B7

L_5297:
        CMPI    #$0001, R0                      ; 5297   0378 0001
        BGT     L_529D                          ; 5299   020E 0002

        MVO@    R3,     R1                      ; 529B   024B
        PULR    R7                              ; 529C   02B7

L_529D:
        MVO@    R4,     R1                      ; 529D   024C
        SUBI    #$0002, R0                      ; 529E   0338 0002
        ADDI    #$0014, R1                      ; 52A0   02F9 0014
        B       L_5293                          ; 52A2   0220 0010

L_52A4:
        PSHR    R5                              ; 52A4   0275
        CLRR    R3                              ; 52A5   01DB
L_52A6:
        INCR    R3                              ; 52A6   000B
        CMPI    #$000E, R3                      ; 52A7   037B 000E
        BGT     L_52B2                          ; 52A9   020E 0007

        PSHR    R3                              ; 52AB   0273

        JSR     R5,     L_51CC                  ; 52AC   0004 0150 01CC

        PULR    R3                              ; 52AF   02B3
        B       L_52A6                          ; 52B0   0220 000B

L_52B2:
        JSR     R5,     L_57EA                  ; 52B2   0004 0154 03EA
        JSR     R5,     L_52B9                  ; 52B5   0004 0150 02B9

        PULR    R7                              ; 52B8   02B7

L_52B9:
        PSHR    R5                              ; 52B9   0275
        MVI     G_0337, R2                      ; 52BA   0282 0337
        MVI     G_0346, R0                      ; 52BC   0280 0346
        TSTR    R0                              ; 52BE   0080
        BPL     L_52C2                          ; 52BF   0203 0001
        PULR    R7                              ; 52C1   02B7

L_52C2:
        JSR     R5,     X_UNPK_BYTES            ; 52C2   0004 0114 0357

        CMPR    R0,     R1                      ; 52C5   0141
        BEQ     L_52DB                          ; 52C6   0204 0013

        PSHR    R1                              ; 52C8   0271
        MOVR    R0,     R3                      ; 52C9   0083
        MVI     G_0333, R0                      ; 52CA   0280 0333

        JSR     R5,     X_UNPK_BYTES            ; 52CC   0004 0114 0357

        PSHR    R1                              ; 52CF   0271
        MOVR    R0,     R1                      ; 52D0   0081
        MOVR    R3,     R0                      ; 52D1   0098

        JSR     R5,     L_539A                  ; 52D2   0004 0150 039A

        PULR    R1                              ; 52D5   02B1
        PULR    R0                              ; 52D6   02B0

        JSR     R5,     L_5395                  ; 52D7   0004 0150 0395

        PULR    R7                              ; 52DA   02B7

L_52DB:
        MVII    #$0238, R3                      ; 52DB   02BB 0238
        CLRR    R4                              ; 52DD   01E4
        TSTR    R2                              ; 52DE   0092
        BEQ     L_52E3                          ; 52DF   0204 0002

        MVII    #$0007, R4                      ; 52E1   02BC 0007
L_52E3:
        MVI     G_0186, R1                      ; 52E3   0281 0186

        JSR     R5,     L_52F8                  ; 52E5   0004 0150 02F8

        ADDI    #$0028, R3                      ; 52E8   02FB 0028

        JSR     R5,     L_52F8                  ; 52EA   0004 0150 02F8

        ADDI    #$0028, R3                      ; 52ED   02FB 0028

        JSR     R5,     L_52F8                  ; 52EF   0004 0150 02F8

        ADDI    #$0028, R3                      ; 52F2   02FB 0028

        JSR     R5,     L_52F8                  ; 52F4   0004 0150 02F8

        PULR    R7                              ; 52F7   02B7

L_52F8:
        PSHR    R5                              ; 52F8   0275
        PSHR    R4                              ; 52F9   0274
        PSHR    R0                              ; 52FA   0270
        TSTR    R1                              ; 52FB   0089
        BEQ     L_5301                          ; 52FC   0204 0003

        DECR    R1                              ; 52FE   0011
        B       L_5307                          ; 52FF   0200 0006

L_5301:
        SDBD                                    ; 5301   0001
        ANDI    #$FFF8, R4                      ; 5302   03BC 00F8 00FF
        XORI    #$0006, R4                      ; 5305   03FC 0006
L_5307:
        PSHR    R1                              ; 5307   0271
        PSHR    R2                              ; 5308   0272
        PSHR    R3                              ; 5309   0273
        DECR    R0                              ; 530A   0010
        BNEQ    L_531F                          ; 530B   020C 0012

        SDBD                                    ; 530D   0001
        MVII    #$1807, R0                      ; 530E   02B8 0007 0018
        SDBD                                    ; 5311   0001
        MVII    #$1857, R1                      ; 5312   02B9 0057 0018
        SDBD                                    ; 5315   0001
        MVII    #$1877, R2                      ; 5316   02BA 0077 0018
        SDBD                                    ; 5319   0001
        MVII    #$18BF, R5                      ; 531A   02BD 00BF 0018
        B       L_5383                          ; 531D   0200 0064

L_531F:
        DECR    R0                              ; 531F   0010
        BNEQ    L_5334                          ; 5320   020C 0012

        SDBD                                    ; 5322   0001
        MVII    #$184F, R0                      ; 5323   02B8 004F 0018
        SDBD                                    ; 5326   0001
        MVII    #$186F, R1                      ; 5327   02B9 006F 0018
        SDBD                                    ; 532A   0001
        MVII    #$188F, R2                      ; 532B   02BA 008F 0018
        SDBD                                    ; 532E   0001
        MVII    #$18DF, R5                      ; 532F   02BD 00DF 0018
        B       L_5383                          ; 5332   0200 004F

L_5334:
        DECR    R0                              ; 5334   0010
        BNEQ    L_5349                          ; 5335   020C 0012

        SDBD                                    ; 5337   0001
        MVII    #$1807, R0                      ; 5338   02B8 0007 0018
        SDBD                                    ; 533B   0001
        MVII    #$185F, R1                      ; 533C   02B9 005F 0018
        SDBD                                    ; 533F   0001
        MVII    #$187F, R2                      ; 5340   02BA 007F 0018
        SDBD                                    ; 5343   0001
        MVII    #$18BF, R5                      ; 5344   02BD 00BF 0018
        B       L_5383                          ; 5347   0200 003A

L_5349:
        DECR    R0                              ; 5349   0010
        BNEQ    L_535E                          ; 534A   020C 0012

        SDBD                                    ; 534C   0001
        MVII    #$181F, R0                      ; 534D   02B8 001F 0018
        SDBD                                    ; 5350   0001
        MVII    #$186F, R1                      ; 5351   02B9 006F 0018
        SDBD                                    ; 5354   0001
        MVII    #$188F, R2                      ; 5355   02BA 008F 0018
        SDBD                                    ; 5358   0001
        MVII    #$18D7, R5                      ; 5359   02BD 00D7 0018
        B       L_5383                          ; 535C   0200 0025

L_535E:
        DECR    R0                              ; 535E   0010
        BNEQ    L_5373                          ; 535F   020C 0012

        SDBD                                    ; 5361   0001
        MVII    #$180F, R0                      ; 5362   02B8 000F 0018
        SDBD                                    ; 5365   0001
        MVII    #$185F, R1                      ; 5366   02B9 005F 0018
        SDBD                                    ; 5369   0001
        MVII    #$187F, R2                      ; 536A   02BA 007F 0018
        SDBD                                    ; 536D   0001
        MVII    #$18C7, R5                      ; 536E   02BD 00C7 0018
        B       L_5383                          ; 5371   0200 0010

L_5373:
        SDBD                                    ; 5373   0001
        MVII    #$1817, R0                      ; 5374   02B8 0017 0018
        SDBD                                    ; 5377   0001
        MVII    #$1867, R1                      ; 5378   02B9 0067 0018
        SDBD                                    ; 537B   0001
        MVII    #$1887, R2                      ; 537C   02BA 0087 0018
        SDBD                                    ; 537F   0001
        MVII    #$18CF, R5                      ; 5380   02BD 00CF 0018
L_5383:
        XORR    R4,     R0                      ; 5383   01E0
        XORR    R4,     R1                      ; 5384   01E1
        XORR    R4,     R2                      ; 5385   01E2
        XORR    R4,     R5                      ; 5386   01E5
        MVO@    R0,     R3                      ; 5387   0258
        INCR    R3                              ; 5388   000B
        MVO@    R1,     R3                      ; 5389   0259
        ADDI    #$0013, R3                      ; 538A   02FB 0013
        MVO@    R2,     R3                      ; 538C   025A
        INCR    R3                              ; 538D   000B
        MVO@    R5,     R3                      ; 538E   025D
        PULR    R3                              ; 538F   02B3
        PULR    R2                              ; 5390   02B2
        PULR    R1                              ; 5391   02B1
        PULR    R0                              ; 5392   02B0
        PULR    R4                              ; 5393   02B4
        PULR    R7                              ; 5394   02B7

L_5395:
        PSHR    R5                              ; 5395   0275
        MVII    #$0028, R3                      ; 5396   02BB 0028
        B       L_539C                          ; 5398   0200 0002

L_539A:
        PSHR    R5                              ; 539A   0275
        CLRR    R3                              ; 539B   01DB
L_539C:
        MVI     G_0337, R2                      ; 539C   0282 0337
        ADDI    #$0260, R3                      ; 539E   02FB 0260
        MVII    #$0007, R4                      ; 53A0   02BC 0007
        TSTR    R2                              ; 53A2   0092
        BNEQ    L_53A6                          ; 53A3   020C 0001

        CLRR    R4                              ; 53A5   01E4

L_53A6:
        JSR     R5,     L_52F8                  ; 53A6   0004 0150 02F8

        PULR    R7                              ; 53A9   02B7

L_53AA:
        PSHR    R5                              ; 53AA   0275

        JSR     R5,     L_53D6                  ; 53AB   0004 0150 03D6

        CLRR    R2                              ; 53AE   01D2
        COMR    R2                              ; 53AF   001A
        B       L_53B7                          ; 53B0   0200 0005

L_53B2:
        PSHR    R5                              ; 53B2   0275

        JSR     R5,     L_53D6                  ; 53B3   0004 0150 03D6

        CLRR    R2                              ; 53B6   01D2
L_53B7:
        MVII    #$0002, R1                      ; 53B7   02B9 0002
        MVII    #$0011, R4                      ; 53B9   02BC 0011
        CMPI    #$0064, R0                      ; 53BB   0378 0064
        BLT     L_53C3                          ; 53BD   0205 0004

        MVII    #$0010, R4                      ; 53BF   02BC 0010
        MVII    #$0004, R1                      ; 53C1   02B9 0004
L_53C3:
        ADDI    #$0214, R4                      ; 53C3   02FC 0214
        SDBD                                    ; 53C5   0001
        MVII    #$1000, R3                      ; 53C6   02BB 0000 0010
        TSTR    R2                              ; 53C9   0092
        BPL     L_53D2                          ; 53CA   0203 0006

        ADDI    #$00B4, R4                      ; 53CC   02FC 00B4
        SDBD                                    ; 53CE   0001
        MVII    #$1007, R3                      ; 53CF   02BB 0007 0010

L_53D2:
        JSR     R5,     X_PRNUM_LFT             ; 53D2   0004 0118 009E

        PULR    R7                              ; 53D5   02B7

L_53D6:
        MVI     G_0334, R0                      ; 53D6   0280 0334
        MOVR    R5,     R7                      ; 53D8   00AF

L_53D9:
        PSHR    R5                              ; 53D9   0275
        MVI     G_0331, R0                      ; 53DA   0280 0331

        JSR     R5,     X_UNPK_BYTES            ; 53DC   0004 0114 0357

        MOVR    R0,     R2                      ; 53DF   0082
        PSHR    R1                              ; 53E0   0271
        MVII    #$0019, R1                      ; 53E1   02B9 0019

        JSR     R5,     L_5154                  ; 53E3   0004 0150 0154

        MVO     R0,     G_034D                  ; 53E6   0240 034D
        PULR    R2                              ; 53E8   02B2
        NEGR    R2                              ; 53E9   0022

        JSR     R5,     L_5154                  ; 53EA   0004 0150 0154

        MVO     R0,     G_034E                  ; 53ED   0240 034E
        SDBD                                    ; 53EF   0001
        MVII    #$0325, R4                      ; 53F0   02BC 0025 0003
        MVII    #$0001, R3                      ; 53F3   02BB 0001
L_53F5:
        MVI@    R4,     R0                      ; 53F5   02A0

        JSR     R5,     X_UNPK_BYTES            ; 53F6   0004 0114 0357

        PSHR    R1                              ; 53F9   0271
        MOVR    R3,     R1                      ; 53FA   0099
        MOVR    R0,     R2                      ; 53FB   0082

        JSR     R5,     L_5418                  ; 53FC   0004 0154 0018
        JSR     R5,     L_5154                  ; 53FF   0004 0150 0154
        JSR     R5,     L_5420                  ; 5402   0004 0154 0020

        PULR    R2                              ; 5405   02B2
        MOVR    R3,     R1                      ; 5406   0099
        NEGR    R2                              ; 5407   0022

        JSR     R5,     L_5418                  ; 5408   0004 0154 0018
        JSR     R5,     L_5154                  ; 540B   0004 0150 0154

        NEGR    R0                              ; 540E   0020

        JSR     R5,     L_5420                  ; 540F   0004 0154 0020

        INCR    R3                              ; 5412   000B
        CMPI    #$000D, R3                      ; 5413   037B 000D
        BNEQ    L_53F5                          ; 5415   022C 0021
        PULR    R7                              ; 5417   02B7

L_5418:
        PSHR    R5                              ; 5418   0275
        TSTR    R2                              ; 5419   0092
        BPL     L_541F                          ; 541A   0203 0003

        SUBI    #$0019, R1                      ; 541C   0339 0019
        NEGR    R1                              ; 541E   0021
L_541F:
        PULR    R7                              ; 541F   02B7

L_5420:
        PSHR    R5                              ; 5420   0275
        MVI     G_034D, R1                      ; 5421   0281 034D
        MVI     G_034E, R2                      ; 5423   0282 034E
        TSTR    R0                              ; 5425   0080
        BPL     L_542D                          ; 5426   0203 0005

        NEGR    R0                              ; 5428   0020
        ADDR    R0,     R2                      ; 5429   00C2
        MVO     R2,     G_034E                  ; 542A   0242 034E
        PULR    R7                              ; 542C   02B7

L_542D:
        ADDR    R0,     R1                      ; 542D   00C1
        MVO     R1,     G_034D                  ; 542E   0241 034D
        PULR    R7                              ; 5430   02B7

        JSR     R5,     L_53D9                  ; 5431   0004 0150 03D9

        SDBD                                    ; 5434   0001
        MVII    #$5472, R0                      ; 5435   02B8 0072 0054
        MVO     R0,     G_0349                  ; 5438   0240 0349

        JSR     R5,     L_57FF                  ; 543A   0004 0154 03FF

        MVI     G_034D, R0                      ; 543D   0280 034D
        MVO     R0,     G_0334                  ; 543F   0240 0334

        JSR     R5,     L_53AA                  ; 5441   0004 0150 03AA

        MVI     G_034E, R0                      ; 5444   0280 034E
        MVO     R0,     G_0334                  ; 5446   0240 0334

        JSR     R5,     L_53B2                  ; 5448   0004 0150 03B2

        MVII    #$0006, R1                      ; 544B   02B9 0006
        MVO     R1,     G_0189                  ; 544D   0241 0189
        SDBD                                    ; 544F   0001
        MVII    #$5021, R1                      ; 5450   02B9 0021 0050

        JSR     R5,     X_TIMER_START           ; 5453   0004 0118 0044

        PULR    R7                              ; 5456   02B7

L_5457:
        PSHR    R5                              ; 5457   0275
        MVI     G_0189, R0                      ; 5458   0280 0189
        DECR    R0                              ; 545A   0010
        MVO     R0,     G_0189                  ; 545B   0240 0189
        TSTR    R0                              ; 545D   0080
        BEQ     L_5468                          ; 545E   0204 0008

        SDBD                                    ; 5460   0001
        MVII    #$5021, R1                      ; 5461   02B9 0021 0050

        JSR     R5,     X_TIMER_START           ; 5464   0004 0118 0044

        PULR    R7                              ; 5467   02B7

L_5468:
        SDBD                                    ; 5468   0001
        MVII    #$5431, R0                      ; 5469   02B8 0031 0054
        MVO     R0,     G_0349                  ; 546C   0240 0349

        JSR     R5,     L_57FF                  ; 546E   0004 0154 03FF

        PULR    R7                              ; 5471   02B7

        MVII    #$0006, R0                      ; 5472   02B8 0006
        MVO     R0,     G_0189                  ; 5474   0240 0189
        PULR    R7                              ; 5476   02B7

L_5477:
        PSHR    R5                              ; 5477   0275
        CLRR    R0                              ; 5478   01C0
        MVO     R0,     G_0348                  ; 5479   0240 0348
        COMR    R0                              ; 547B   0018
        MVO     R0,     G_0335                  ; 547C   0240 0335
        SDBD                                    ; 547E   0001
        MVII    #$5E2B, R0                      ; 547F   02B8 002B 005E
        MVO     R0,     G_0347                  ; 5482   0240 0347
        PULR    R7                              ; 5484   02B7

L_5485:
        JSR     R5,     L_5088                  ; 5485   0004 0150 0088
        JSR     R5,     L_52A4                  ; 5488   0004 0150 02A4

        MVII    #$0001, R3                      ; 548B   02BB 0001
        MVO     R3,     G_0352                  ; 548D   0243 0352

        JSR     R5,     L_5742                  ; 548F   0004 0154 0342

L_5492:
        MVII    #$000A, R0                      ; 5492   02B8 000A

        JSR     R5,     .EXEC.A62               ; 5494   0004 0118 0262

        MVI     G_0350, R0                      ; 5497   0280 0350
        TSTR    R0                              ; 5499   0080
        BNEQ    L_5492                          ; 549A   022C 0009

        MVI     G_0351, R0                      ; 549C   0280 0351
        TSTR    R0                              ; 549E   0080
        BNEQ    L_5492                          ; 549F   022C 000E

        MVI     G_0333, R0                      ; 54A1   0280 0333

        JSR     R5,     X_UNPK_BYTES            ; 54A3   0004 0114 0357

        CLRR    R2                              ; 54A6   01D2
        CLRR    R3                              ; 54A7   01DB
        MVO     R3,     G_0352                  ; 54A8   0243 0352
        INCR    R3                              ; 54AA   000B
        CMPR    R0,     R1                      ; 54AB   0141
        BEQ     L_5485                          ; 54AC   0224 0028
        BLT     L_54B2                          ; 54AE   0205 0002

        NEGR    R3                              ; 54B0   0023
        COMR    R2                              ; 54B1   001A
L_54B2:
        MVO     R3,     G_034A                  ; 54B2   0243 034A
        MVO     R2,     G_0337                  ; 54B4   0242 0337
        MVI     G_031D, R0                      ; 54B6   0280 031D
        SDBD                                    ; 54B8   0001
        XORI    #$1000, R0                      ; 54B9   03F8 0000 0010
        MVO     R0,     G_031D                  ; 54BC   0240 031D
        MVII    #$0002, R0                      ; 54BE   02B8 0002
        MVO     R0,     G_0186                  ; 54C0   0240 0186

        JSR     R5,     L_5A29                  ; 54C2   0004 0158 0229
        JSR     R5,     L_57EA                  ; 54C5   0004 0154 03EA
        JSR     R5,     L_52B9                  ; 54C8   0004 0150 02B9
        JSR     R5,     L_5E43                  ; 54CB   0004 015C 0243

        BNC     L_54D3                          ; 54CE   0209 0003
        J       L_5DF3                          ; 54D0   0004 035C 01F3

L_54D3:
        JSR     R5,     L_54E5                  ; 54D3   0004 0154 00E5

        SDBD                                    ; 54D6   0001
        MVII    #$5814, R0                      ; 54D7   02B8 0014 0058
        MVO     R0,     G_0348                  ; 54DA   0240 0348
        SDBD                                    ; 54DC   0001
        MVII    #$550E, R0                      ; 54DD   02B8 000E 0055
        MVO     R0,     G_0347                  ; 54E0   0240 0347
        J       L_5814                          ; 54E2   0004 0358 0014

L_54E5:
        PSHR    R5                              ; 54E5   0275

        JSR     R5,     L_5506                  ; 54E6   0004 0154 0106
        JSR     R5,     L_5E79                  ; 54E9   0004 015C 0279
        JSR     R5,     L_550A                  ; 54EC   0004 0154 010A

        MVI     G_0180, R0                      ; 54EF   0280 0180
        MVO     R0,     G_0185                  ; 54F1   0240 0185
        PULR    R7                              ; 54F3   02B7

L_54F4:
        PSHR    R5                              ; 54F4   0275
        MVI     G_0346, R0                      ; 54F5   0280 0346

        JSR     R5,     X_UNPK_BYTES            ; 54F7   0004 0114 0357

        CMPR    R0,     R1                      ; 54FA   0141
        BEQ     L_5504                          ; 54FB   0204 0007

        MVI     G_0186, R1                      ; 54FD   0281 0186
        DECR    R1                              ; 54FF   0011
        BEQ     L_5504                          ; 5500   0204 0002

        CLRC                                    ; 5502   0006
        PULR    R7                              ; 5503   02B7

L_5504:
        SETC                                    ; 5504   0007
        PULR    R7                              ; 5505   02B7

L_5506:
        MVI     G_034A, R4                      ; 5506   0284 034A
        PSHR    R4                              ; 5508   0274
        MOVR    R5,     R7                      ; 5509   00AF

L_550A:
        PULR    R4                              ; 550A   02B4
        MVO     R4,     G_034A                  ; 550B   0244 034A
        MOVR    R5,     R7                      ; 550D   00AF

        JSR     R5,     L_5148                  ; 550E   0004 0150 0148

        BNC     L_551A                          ; 5511   0209 0007

        SDBD                                    ; 5513   0001
        MVII    #$5128, R0                      ; 5514   02B8 0028 0051
        MVO     R0,     G_0347                  ; 5517   0240 0347
        PULR    R7                              ; 5519   02B7

L_551A:
        TSTR    R0                              ; 551A   0080
        BNEQ    L_5543                          ; 551B   020C 0026

        JSR     R5,     L_5AE7                  ; 551D   0004 0158 02E7

        MVI     G_034A, R4                      ; 5520   0284 034A
        MVI     G_0337, R3                      ; 5522   0283 0337
        TSTR    R4                              ; 5524   00A4
        BPL     L_5528                          ; 5525   0203 0001

        MOVR    R1,     R0                      ; 5527   0088
L_5528:
        TSTR    R3                              ; 5528   009B
        BPL     L_552C                          ; 5529   0203 0001

        NEGR    R0                              ; 552B   0020
L_552C:
        MVII    #$0002, R1                      ; 552C   02B9 0002
        CMPR    R1,     R0                      ; 552E   0148
        BLT     L_5542                          ; 552F   0205 0011

        MOVR    R1,     R2                      ; 5531   008A
        MVI     G_0333, R0                      ; 5532   0280 0333

        JSR     R5,     X_UNPK_BYTES            ; 5534   0004 0114 0357

        CMPR    R0,     R1                      ; 5537   0141
        BNEQ    L_5542                          ; 5538   020C 0008

        MVI     G_0186, R0                      ; 553A   0280 0186
        CMPI    #$0002, R0                      ; 553C   0378 0002
        BLT     L_5542                          ; 553E   0205 0002

        MVO     R2,     G_0187                  ; 5540   0242 0187
L_5542:
        PULR    R7                              ; 5542   02B7

L_5543:
        JSR     R5,     L_5A72                  ; 5543   0004 0158 0272

        BC      L_5542                          ; 5546   0221 0005

        PSHR    R0                              ; 5548   0270

        JSR     R5,     L_59A3                  ; 5549   0004 0158 01A3

        PULR    R3                              ; 554C   02B3
        BNC     L_557C                          ; 554D   0209 002D

L_554F:
        MVI     G_0333, R0                      ; 554F   0280 0333
        PSHR    R0                              ; 5551   0270

        JSR     R5,     L_5690                  ; 5552   0004 0154 0290

        BNC     L_555A                          ; 5555   0209 0003

        PULR    R0                              ; 5557   02B0
        B       L_557C                          ; 5558   0200 0022

L_555A:
        PSHR    R3                              ; 555A   0273

        JSR     R5,     L_5E43                  ; 555B   0004 015C 0243

        BC      L_557F                          ; 555E   0201 001F

        JSR     R5,     L_54F4                  ; 5560   0004 0154 00F4

        BC      L_557F                          ; 5563   0201 001A

        PULR    R3                              ; 5565   02B3
        PSHR    R3                              ; 5566   0273

        JSR     R5,     L_5506                  ; 5567   0004 0154 0106

        MOVR    R3,     R0                      ; 556A   0098

        JSR     R5,     L_5C2B                  ; 556B   0004 015C 002B

        MVI     G_0180, R0                      ; 556E   0280 0180
        MVI     G_0185, R1                      ; 5570   0281 0185

        JSR     R5,     L_550A                  ; 5572   0004 0154 010A

        PULR    R3                              ; 5575   02B3
        PULR    R4                              ; 5576   02B4
        CMPR    R1,     R0                      ; 5577   0148
        BGE     L_5581                          ; 5578   020D 0007

        MVO     R4,     G_0333                  ; 557A   0244 0333
L_557C:
        J       L_5122                          ; 557C   0004 0350 0122

L_557F:
        PULR    R3                              ; 557F   02B3
        PULR    R4                              ; 5580   02B4
L_5581:
        CLRR    R0                              ; 5581   01C0
        MVO     R0,     G_0348                  ; 5582   0240 0348
        MVO     R0,     G_0347                  ; 5584   0240 0347
        MVI     G_018A, R0                      ; 5586   0280 018A
        PSHR    R0                              ; 5588   0270
        CLRR    R0                              ; 5589   01C0
        MVO     R0,     G_018A                  ; 558A   0240 018A
        PSHR    R3                              ; 558C   0273

        JSR     R5,     L_5840                  ; 558D   0004 0158 0040
        JSR     R5,     L_58E7                  ; 5590   0004 0158 00E7

        PULR    R0                              ; 5593   02B0

        JSR     R5,     L_5B03                  ; 5594   0004 0158 0303

        PULR    R0                              ; 5597   02B0
        MVO     R0,     G_018A                  ; 5598   0240 018A
        MVI     G_016C, R0                      ; 559A   0280 016C

        JSR     R5,     X_EXT_SIGN_LO           ; 559C   0004 0114 0268

        MOVR    R0,     R3                      ; 559F   0083
        MVO     R3,     G_034A                  ; 55A0   0243 034A

        JSR     R5,     L_5AE7                  ; 55A2   0004 0158 02E7

        PSHR    R0                              ; 55A5   0270
        PSHR    R1                              ; 55A6   0271
        MVI     G_034C, R0                      ; 55A7   0280 034C

        JSR     R5,     X_UNPK_BYTES            ; 55A9   0004 0114 0357
        JSR     R5,     L_5AF8                  ; 55AC   0004 0158 02F8

        MVI     G_016C, R0                      ; 55AF   0280 016C

        JSR     R5,     X_EXT_SIGN_LO           ; 55B1   0004 0114 0268

        MOVR    R0,     R3                      ; 55B4   0083

        JSR     R5,     L_51CC                  ; 55B5   0004 0150 01CC

        PULR    R1                              ; 55B8   02B1
        PULR    R0                              ; 55B9   02B0

        JSR     R5,     L_5AF8                  ; 55BA   0004 0158 02F8

        MVI     G_0167, R0                      ; 55BD   0280 0167

        JSR     R5,     X_EXT_SIGN_LO           ; 55BF   0004 0114 0268

        MVO     R0,     G_034A                  ; 55C2   0240 034A

        JSR     R5,     L_5840                  ; 55C4   0004 0158 0040

        MVI     G_0355, R0                      ; 55C7   0280 0355
        MVI     G_0356, R1                      ; 55C9   0281 0356
        SWAP    R0,     1                       ; 55CB   0040
        SWAP    R1,     1                       ; 55CC   0041

        JSR     R5,     X_PACK_BYTES            ; 55CD   0004 0114 034F

        MOVR    R0,     R2                      ; 55D0   0082
        MVII    #$0032, R3                      ; 55D1   02BB 0032
        CLRR    R0                              ; 55D3   01C0

        JSR     R5,     .EXEC.9AD               ; 55D4   0004 0118 01AD

        PULR    R7                              ; 55D7   02B7

        PSHR    R5                              ; 55D8   0275

        JSR     R5,     .EXEC.60A               ; 55D9   0004 0114 020A

        MVI     G_0167, R0                      ; 55DC   0280 0167

        JSR     R5,     X_EXT_SIGN_LO           ; 55DE   0004 0114 0268

        MOVR    R0,     R3                      ; 55E1   0083

        JSR     R5,     L_51CC                  ; 55E2   0004 0150 01CC

        MVI     G_0167, R0                      ; 55E5   0280 0167

        JSR     R5,     X_EXT_SIGN_LO           ; 55E7   0004 0114 0268

        CMPI    #$000E, R0                      ; 55EA   0378 000E
        BEQ     L_55F4                          ; 55EC   0204 0006

        SDBD                                    ; 55EE   0001
        CMPI    #$FFF2, R0                      ; 55EF   0378 00F2 00FF
        BNEQ    L_55F9                          ; 55F2   020C 0005

L_55F4:
        JSR     R5,     L_5813                  ; 55F4   0004 0158 0013

        B       L_55FE                          ; 55F7   0200 0005

L_55F9:
        MVO     R0,     G_034A                  ; 55F9   0240 034A

        JSR     R5,     L_5840                  ; 55FB   0004 0158 0040
L_55FE:
        JSR     R5,     L_58E7                  ; 55FE   0004 0158 00E7

        MVII    #$000D, R3                      ; 5601   02BB 000D

        JSR     R5,     L_51CC                  ; 5603   0004 0150 01CC

        MVII    #$000E, R3                      ; 5606   02BB 000E

        JSR     R5,     L_51CC                  ; 5608   0004 0150 01CC

        MVII    #$0001, R0                      ; 560B   02B8 0001
        MVO     R0,     G_0187                  ; 560D   0240 0187

        JSR     R5,     L_52B9                  ; 560F   0004 0150 02B9
        JSR     R5,     L_5E43                  ; 5612   0004 015C 0243

        BNC     L_561F                          ; 5615   0209 0008

        MVII    #$000F, R0                      ; 5617   02B8 000F

        JSR     R5,     .EXEC.A62               ; 5619   0004 0118 0262

        J       L_5E04                          ; 561C   0004 035C 0204

L_561F:
        JSR     R5,     L_595A                  ; 561F   0004 0158 015A

        BC      L_5631                          ; 5622   0201 000D

        SDBD                                    ; 5624   0001
        MVII    #$5814, R0                      ; 5625   02B8 0014 0058
        MVO     R0,     G_0348                  ; 5628   0240 0348
        SDBD                                    ; 562A   0001
        MVII    #$550E, R0                      ; 562B   02B8 000E 0055
        MVO     R0,     G_0347                  ; 562E   0240 0347
        PULR    R7                              ; 5630   02B7

L_5631:
        SDBD                                    ; 5631   0001
        MVII    #$5A7D, R0                      ; 5632   02B8 007D 005A
        MVO     R0,     G_0347                  ; 5635   0240 0347
        PULR    R7                              ; 5637   02B7

L_5638:
        PSHR    R5                              ; 5638   0275
        MVI     G_0187, R4                      ; 5639   0284 0187
        TSTR    R2                              ; 563B   0092
        BPL     L_5645                          ; 563C   0203 0007

        TSTR    R1                              ; 563E   0089
        BPL     L_5643                          ; 563F   0203 0002

        ADDR    R4,     R1                      ; 5641   00E1
        PULR    R7                              ; 5642   02B7

L_5643:
        SUBR    R4,     R1                      ; 5643   0121
        PULR    R7                              ; 5644   02B7

L_5645:
        TSTR    R0                              ; 5645   0080
        BPL     L_564A                          ; 5646   0203 0002

        ADDR    R4,     R0                      ; 5648   00E0
        PULR    R7                              ; 5649   02B7

L_564A:
        SUBR    R4,     R0                      ; 564A   0120
        PULR    R7                              ; 564B   02B7

L_564C:
        PSHR    R5                              ; 564C   0275
        MVI     G_0187, R4                      ; 564D   0284 0187
        MVI     G_0337, R3                      ; 564F   0283 0337
        TSTR    R2                              ; 5651   0092
        BPL     L_5672                          ; 5652   0203 001E

        TSTR    R3                              ; 5654   009B
        BPL     L_5664                          ; 5655   0203 000D

        CMPI    #$0001, R1                      ; 5657   0379 0001
        BNEQ    L_5661                          ; 5659   020C 0006

        MOVR    R4,     R1                      ; 565B   00A1
        NEGR    R1                              ; 565C   0021

        JSR     R5,     L_56C0                  ; 565D   0004 0154 02C0

        PULR    R7                              ; 5660   02B7

L_5661:
        SUBR    R4,     R1                      ; 5661   0121
        B       L_568E                          ; 5662   0200 002A

L_5664:
        SDBD                                    ; 5664   0001
        CMPI    #$FFFF, R1                      ; 5665   0379 00FF 00FF
        BNEQ    L_566F                          ; 5668   020C 0005

        MOVR    R4,     R1                      ; 566A   00A1

        JSR     R5,     L_56B6                  ; 566B   0004 0154 02B6

        PULR    R7                              ; 566E   02B7

L_566F:
        ADDR    R4,     R1                      ; 566F   00E1
        B       L_568E                          ; 5670   0200 001C

L_5672:
        TSTR    R3                              ; 5672   009B
        BPL     L_5682                          ; 5673   0203 000D

        CMPI    #$0001, R0                      ; 5675   0378 0001
        BNEQ    L_567F                          ; 5677   020C 0006

        MOVR    R4,     R0                      ; 5679   00A0
        NEGR    R0                              ; 567A   0020

        JSR     R5,     L_56C0                  ; 567B   0004 0154 02C0

        PULR    R7                              ; 567E   02B7

L_567F:
        SUBR    R4,     R0                      ; 567F   0120
        B       L_568E                          ; 5680   0200 000C

L_5682:
        SDBD                                    ; 5682   0001
        CMPI    #$FFFF, R0                      ; 5683   0378 00FF 00FF
        BNEQ    L_568D                          ; 5686   020C 0005

        MOVR    R4,     R0                      ; 5688   00A0

        JSR     R5,     L_56B6                  ; 5689   0004 0154 02B6

        PULR    R7                              ; 568C   02B7

L_568D:
        ADDR    R4,     R0                      ; 568D   00E0
L_568E:
        CLRC                                    ; 568E   0006
        PULR    R7                              ; 568F   02B7

L_5690:
        PSHR    R5                              ; 5690   0275
        MVI     G_0186, R2                      ; 5691   0282 0186
        MVI     G_0333, R0                      ; 5693   0280 0333

        JSR     R5,     X_UNPK_BYTES            ; 5695   0004 0114 0357

        TSTR    R3                              ; 5698   009B
        BEQ     L_56A1                          ; 5699   0204 0006

        CMPR    R0,     R3                      ; 569B   0143
        BEQ     L_56A3                          ; 569C   0204 0005

        CMPR    R1,     R3                      ; 569E   014B
        BEQ     L_56AA                          ; 569F   0204 0009

L_56A1:
        SETC                                    ; 56A1   0007
        PULR    R7                              ; 56A2   02B7

L_56A3:
        CMPI    #$0002, R2                      ; 56A3   037A 0002
        BGT     L_56AF                          ; 56A5   020E 0008

        CLRR    R0                              ; 56A7   01C0
        B       L_56AF                          ; 56A8   0200 0005

L_56AA:
        CMPI    #$0002, R2                      ; 56AA   037A 0002
        BGT     L_56AF                          ; 56AC   020E 0001

        CLRR    R1                              ; 56AE   01C9

L_56AF:
        JSR     R5,     X_PACK_BYTES            ; 56AF   0004 0114 034F

        MVO     R0,     G_0333                  ; 56B2   0240 0333
        CLRC                                    ; 56B4   0006
        PULR    R7                              ; 56B5   02B7

L_56B6:
        CLRR    R2                              ; 56B6   01D2
        CLRR    R3                              ; 56B7   01DB
        DECR    R3                              ; 56B8   0013
        B       L_56CA                          ; 56B9   0200 000F

L_56BB:
        CLRR    R2                              ; 56BB   01D2
        CLRR    R3                              ; 56BC   01DB
        INCR    R3                              ; 56BD   000B
        B       L_56CA                          ; 56BE   0200 000A

L_56C0:
        CLRR    R2                              ; 56C0   01D2
        CLRR    R3                              ; 56C1   01DB
        INCR    R2                              ; 56C2   000A
        B       L_56CA                          ; 56C3   0200 0005

L_56C5:
        CLRR    R2                              ; 56C5   01D2
        CLRR    R3                              ; 56C6   01DB
        DECR    R2                              ; 56C7   0012
        B       L_56CA                          ; 56C8   0200 0000

L_56CA:
        PSHR    R5                              ; 56CA   0275
        PSHR    R1                              ; 56CB   0271
        PSHR    R0                              ; 56CC   0270
        MVI     G_0331, R0                      ; 56CD   0280 0331

        JSR     R5,     X_UNPK_BYTES            ; 56CF   0004 0114 0357

        ADDR    R2,     R0                      ; 56D2   00D0
        ADDR    R3,     R1                      ; 56D3   00D9

        JSR     R5,     X_PACK_BYTES            ; 56D4   0004 0114 034F

        MVO     R0,     G_0331                  ; 56D7   0240 0331
        PULR    R0                              ; 56D9   02B0
        PULR    R1                              ; 56DA   02B1
        SETC                                    ; 56DB   0007
        PULR    R7                              ; 56DC   02B7

L_56DD:
        JSR     R5,     L_5742                  ; 56DD   0004 0154 0342

L_56E0:
        MVII    #$000A, R0                      ; 56E0   02B8 000A

        JSR     R5,     .EXEC.A62               ; 56E2   0004 0118 0262

        MVI     G_0350, R0                      ; 56E5   0280 0350
        TSTR    R0                              ; 56E7   0080
        BNEQ    L_56E0                          ; 56E8   022C 0009

        MVI     G_0351, R0                      ; 56EA   0280 0351
        TSTR    R0                              ; 56EC   0080
        BNEQ    L_56E0                          ; 56ED   022C 000E

        MVI     G_0333, R0                      ; 56EF   0280 0333
        MVII    #$0002, R2                      ; 56F1   02BA 0002

        JSR     R5,     X_UNPK_BYTES            ; 56F3   0004 0114 0357

        CMPR    R0,     R1                      ; 56F6   0141
        BNEQ    L_56FB                          ; 56F7   020C 0002

        MVII    #$0004, R2                      ; 56F9   02BA 0004
L_56FB:
        MVO     R2,     G_0186                  ; 56FB   0242 0186

        JSR     R5,     L_5A29                  ; 56FD   0004 0158 0229
        JSR     R5,     L_52B9                  ; 5700   0004 0150 02B9
        JSR     R5,     L_595A                  ; 5703   0004 0158 015A

        BNC     L_571C                          ; 5706   0209 0014

        JSR     R5,     L_5E43                  ; 5708   0004 015C 0243

        BNC     L_5715                          ; 570B   0209 0008

        MVII    #$000F, R0                      ; 570D   02B8 000F

        JSR     R5,     .EXEC.A62               ; 570F   0004 0118 0262

        J       L_5A8A                          ; 5712   0004 0358 028A

L_5715:
        SDBD                                    ; 5715   0001
        MVII    #$5A83, R0                      ; 5716   02B8 0083 005A
        MVO     R0,     G_0347                  ; 5719   0240 0347
        PULR    R7                              ; 571B   02B7

L_571C:
        JSR     R5,     L_5E43                  ; 571C   0004 015C 0243

        BNC     L_5724                          ; 571F   0209 0003
        J       L_5DF3                          ; 5721   0004 035C 01F3

L_5724:
        JSR     R5,     L_54F4                  ; 5724   0004 0154 00F4

        BC      L_572C                          ; 5727   0201 0003

        JSR     R5,     L_54E5                  ; 5729   0004 0154 00E5

L_572C:
        SDBD                                    ; 572C   0001
        MVII    #$5814, R0                      ; 572D   02B8 0014 0058
        MVO     R0,     G_0348                  ; 5730   0240 0348
        SDBD                                    ; 5732   0001
        MVII    #$550E, R0                      ; 5733   02B8 000E 0055
        MVO     R0,     G_0347                  ; 5736   0240 0347
        PULR    R7                              ; 5738   02B7

L_5739:
        PSHR    R5                              ; 5739   0275
        MVII    #$000F, R0                      ; 573A   02B8 000F

        JSR     R5,     X_RAND2                 ; 573C   0004 0114 029E

        ADDI    #$0002, R0                      ; 573F   02F8 0002
        PULR    R7                              ; 5741   02B7

L_5742:
        PSHR    R5                              ; 5742   0275

        JSR     R5,     L_5739                  ; 5743   0004 0154 0339

        MVO     R0,     G_0350                  ; 5746   0240 0350

        JSR     R5,     L_5739                  ; 5748   0004 0154 0339

        MVO     R0,     G_0351                  ; 574B   0240 0351
        SDBD                                    ; 574D   0001
        MVII    #$5019, R1                      ; 574E   02B9 0019 0050

        JSR     R5,     X_TIMER_START           ; 5751   0004 0118 0044

        SDBD                                    ; 5754   0001
        MVII    #$501D, R1                      ; 5755   02B9 001D 0050

        JSR     R5,     X_TIMER_START           ; 5758   0004 0118 0044

        PULR    R7                              ; 575B   02B7

L_575C:
        PSHR    R5                              ; 575C   0275
        MVII    #$0006, R0                      ; 575D   02B8 0006

        JSR     R5,     X_RAND2                 ; 575F   0004 0114 029E

        INCR    R0                              ; 5762   0008
        PULR    R7                              ; 5763   02B7

L_5764:
        PSHR    R5                              ; 5764   0275
        MVII    #$000A, R1                      ; 5765   02B9 000A
L_5767:
        MVII    #$0005, R0                      ; 5767   02B8 0005

        JSR     R5,     X_RAND2                 ; 5769   0004 0114 029E

        DECR    R1                              ; 576C   0011
        BNEQ    L_5767                          ; 576D   022C 0007

        JSR     R5,     L_575C                  ; 576F   0004 0154 035C

        MOVR    R0,     R2                      ; 5772   0082
        MVI     G_0333, R0                      ; 5773   0280 0333

        JSR     R5,     X_UNPK_BYTES            ; 5775   0004 0114 0357

        MOVR    R2,     R1                      ; 5778   0091

        JSR     R5,     X_PACK_BYTES            ; 5779   0004 0114 034F

        MVO     R0,     G_0333                  ; 577C   0240 0333
        PULR    R7                              ; 577E   02B7

L_577F:
        PSHR    R5                              ; 577F   0275

        JSR     R5,     L_575C                  ; 5780   0004 0154 035C

        MOVR    R0,     R2                      ; 5783   0082
        MVI     G_0333, R0                      ; 5784   0280 0333

        JSR     R5,     X_UNPK_BYTES            ; 5786   0004 0114 0357

        MOVR    R2,     R0                      ; 5789   0090

        JSR     R5,     X_PACK_BYTES            ; 578A   0004 0114 034F

        MVO     R0,     G_0333                  ; 578D   0240 0333
        PULR    R7                              ; 578F   02B7

L_5790:
        PSHR    R5                              ; 5790   0275
        MVI     G_0352, R0                      ; 5791   0280 0352
        TSTR    R0                              ; 5793   0080
        BEQ     L_5799                          ; 5794   0204 0003

        CLRR    R0                              ; 5796   01C0
        MVO     R0,     G_0337                  ; 5797   0240 0337

L_5799:
        JSR     R5,     L_577F                  ; 5799   0004 0154 037F

        MVI     G_0350, R0                      ; 579C   0280 0350
        DECR    R0                              ; 579E   0010
        MVO     R0,     G_0350                  ; 579F   0240 0350
        PSHR    R0                              ; 57A1   0270
        BEQ     L_57AB                          ; 57A2   0204 0007

        SDBD                                    ; 57A4   0001
        MVII    #$5019, R1                      ; 57A5   02B9 0019 0050

        JSR     R5,     X_TIMER_START           ; 57A8   0004 0118 0044

L_57AB:
        PULR    R3                              ; 57AB   02B3
        MVI     G_0333, R0                      ; 57AC   0280 0333

        JSR     R5,     X_UNPK_BYTES            ; 57AE   0004 0114 0357

        CLRR    R1                              ; 57B1   01C9
        TSTR    R3                              ; 57B2   009B
        BNEQ    L_57B6                          ; 57B3   020C 0001

        INCR    R1                              ; 57B5   0009

L_57B6:
        JSR     R5,     L_539A                  ; 57B6   0004 0150 039A

        B       L_57E6                          ; 57B9   0200 002B

L_57BB:
        PSHR    R5                              ; 57BB   0275
        MVI     G_0352, R0                      ; 57BC   0280 0352
        TSTR    R0                              ; 57BE   0080
        BEQ     L_57C5                          ; 57BF   0204 0004

        CLRR    R0                              ; 57C1   01C0
        COMR    R0                              ; 57C2   0018
        MVO     R0,     G_0337                  ; 57C3   0240 0337

L_57C5:
        JSR     R5,     L_5764                  ; 57C5   0004 0154 0364

        MVI     G_0351, R0                      ; 57C8   0280 0351
        DECR    R0                              ; 57CA   0010
        MVO     R0,     G_0351                  ; 57CB   0240 0351
        PSHR    R0                              ; 57CD   0270
        BEQ     L_57D7                          ; 57CE   0204 0007

        SDBD                                    ; 57D0   0001
        MVII    #$501D, R1                      ; 57D1   02B9 001D 0050

        JSR     R5,     X_TIMER_START           ; 57D4   0004 0118 0044

L_57D7:
        PULR    R3                              ; 57D7   02B3
        MVI     G_0333, R0                      ; 57D8   0280 0333

        JSR     R5,     X_UNPK_BYTES            ; 57DA   0004 0114 0357

        MOVR    R1,     R0                      ; 57DD   0088
        CLRR    R1                              ; 57DE   01C9
        TSTR    R3                              ; 57DF   009B
        BNEQ    L_57E3                          ; 57E0   020C 0001

        INCR    R1                              ; 57E2   0009

L_57E3:
        JSR     R5,     L_5395                  ; 57E3   0004 0150 0395
L_57E6:
        JSR     R5,     .EXEC.60A               ; 57E6   0004 0114 020A

        PULR    R7                              ; 57E9   02B7

L_57EA:
        PSHR    R5                              ; 57EA   0275
        MVII    #$0238, R1                      ; 57EB   02B9 0238

        JSR     R5,     L_57F4                  ; 57ED   0004 0154 03F4

        MVII    #$0239, R1                      ; 57F0   02B9 0239
        B       L_57F5                          ; 57F2   0200 0001

L_57F4:
        PSHR    R5                              ; 57F4   0275
L_57F5:
        MVII    #$0008, R2                      ; 57F5   02BA 0008
        SDBD                                    ; 57F7   0001
        MVII    #$1908, R0                      ; 57F8   02B8 0008 0019

        JSR     R5,     L_517A                  ; 57FB   0004 0150 017A

        PULR    R7                              ; 57FE   02B7

L_57FF:
        PSHR    R5                              ; 57FF   0275
        SDBD                                    ; 5800   0001
        MVII    #$1908, R0                      ; 5801   02B8 0008 0019
        MVII    #$0224, R4                      ; 5804   02BC 0224

        JSR     R5,     L_580C                  ; 5806   0004 0158 000C

        MVII    #$02D8, R4                      ; 5809   02BC 02D8
        PULR    R5                              ; 580B   02B5
L_580C:
        MVII    #$0004, R1                      ; 580C   02B9 0004
L_580E:
        MVO@    R0,     R4                      ; 580E   0260
        DECR    R1                              ; 580F   0011
        BNEQ    L_580E                          ; 5810   022C 0003
        MOVR    R5,     R7                      ; 5812   00AF

L_5813:
        PSHR    R5                              ; 5813   0275

L_5814:
        JSR     R5,     L_5AB1                  ; 5814   0004 0158 02B1

        BNC     L_581A                          ; 5817   0209 0001
        PULR    R7                              ; 5819   02B7

L_581A:
        MVII    #$0001, R0                      ; 581A   02B8 0001

        JSR     R5,     L_5896                  ; 581C   0004 0158 0096

        CMPI    #$000E, R1                      ; 581F   0379 000E
        BNEQ    L_5826                          ; 5821   020C 0003

        DECR    R1                              ; 5823   0011
        B       L_582D                          ; 5824   0200 0007

L_5826:
        SDBD                                    ; 5826   0001
        CMPI    #$FFF2, R1                      ; 5827   0379 00F2 00FF
        BNEQ    L_582D                          ; 582A   020C 0001

        INCR    R1                              ; 582C   0009
L_582D:
        MVO     R1,     G_034A                  ; 582D   0241 034A
        MOVR    R1,     R0                      ; 582F   0088

        JSR     R5,     L_5874                  ; 5830   0004 0158 0074

        BNC     L_5814                          ; 5833   0229 0020

        JSR     R5,     L_5840                  ; 5835   0004 0158 0040
        JSR     R5,     L_58E7                  ; 5838   0004 0158 00E7

        MVII    #$0001, R0                      ; 583B   02B8 0001
        MVO     R0,     G_0187                  ; 583D   0240 0187
        PULR    R7                              ; 583F   02B7

L_5840:
        PSHR    R5                              ; 5840   0275

        JSR     R5,     L_5906                  ; 5841   0004 0158 0106

        MVI     G_034A, R0                      ; 5844   0280 034A
        TSTR    R0                              ; 5846   0080
        BPL     L_584A                          ; 5847   0203 0001

        NEGR    R0                              ; 5849   0020
L_584A:
        CMPI    #$000D, R0                      ; 584A   0378 000D
        BNEQ    L_5854                          ; 584C   020C 0006

        SDBD                                    ; 584E   0001
        MVII    #$4800, R0                      ; 584F   02B8 0000 0048
        B       L_5871                          ; 5852   0200 001D

L_5854:
        CMPI    #$000E, R0                      ; 5854   0378 000E
        BNEQ    L_585D                          ; 5856   020C 0005

        MVII    #$0008, R0                      ; 5858   02B8 0008
        SWAP    R0,     1                       ; 585A   0040
        B       L_5871                          ; 585B   0200 0014

L_585D:
        SDBD                                    ; 585D   0001
        MVII    #$0800, R2                      ; 585E   02BA 0000 0008
        MOVR    R0,     R1                      ; 5861   0081

        JSR     R5,     L_5154                  ; 5862   0004 0150 0154

        SDBD                                    ; 5865   0001
        ADDI    #$1000, R0                      ; 5866   02F8 0000 0010
        CMPI    #$0006, R1                      ; 5869   0379 0006
        BLE     L_5871                          ; 586B   0206 0004

        SDBD                                    ; 586D   0001
        ADDI    #$0800, R0                      ; 586E   02F8 0000 0008
L_5871:
        MVO     R0,     G_0355                  ; 5871   0240 0355
        PULR    R7                              ; 5873   02B7

L_5874:
        PSHR    R5                              ; 5874   0275
        PSHR    R0                              ; 5875   0270
        MOVR    R0,     R2                      ; 5876   0082
        TSTR    R0                              ; 5877   0080
        BPL     L_587B                          ; 5878   0203 0001

        NEGR    R0                              ; 587A   0020
L_587B:
        SDBD                                    ; 587B   0001
        MVII    #$0324, R1                      ; 587C   02B9 0024 0003
        ADDR    R0,     R1                      ; 587F   00C1
        MVI@    R1,     R0                      ; 5880   0288

        JSR     R5,     X_UNPK_BYTES            ; 5881   0004 0114 0357

        MVI     G_0337, R3                      ; 5884   0283 0337
        TSTR    R2                              ; 5886   0092
        BPL     L_588A                          ; 5887   0203 0001

        MOVR    R1,     R0                      ; 5889   0088
L_588A:
        TSTR    R0                              ; 588A   0080
        BEQ     L_5890                          ; 588B   0204 0003

        XORR    R0,     R3                      ; 588D   01C3
        BPL     L_5893                          ; 588E   0203 0003

L_5890:
        CLRC                                    ; 5890   0006
        PULR    R0                              ; 5891   02B0
        PULR    R7                              ; 5892   02B7

L_5893:
        SETC                                    ; 5893   0007
        PULR    R0                              ; 5894   02B0
        PULR    R7                              ; 5895   02B7

L_5896:
        PSHR    R5                              ; 5896   0275
        PSHR    R0                              ; 5897   0270
        MVI     G_034A, R3                      ; 5898   0283 034A
        MOVR    R3,     R4                      ; 589A   009C
        CMPI    #$000D, R3                      ; 589B   037B 000D
        BEQ     L_58A5                          ; 589D   0204 0006

        SDBD                                    ; 589F   0001
        CMPI    #$FFF3, R3                      ; 58A0   037B 00F3 00FF
        BNEQ    L_58A6                          ; 58A3   020C 0001

L_58A5:
        CLRR    R3                              ; 58A5   01DB
L_58A6:
        PSHR    R2                              ; 58A6   0272
        MVI     G_0337, R2                      ; 58A7   0282 0337
        TSTR    R2                              ; 58A9   0092
        BPL     L_58C5                          ; 58AA   0203 0019

        NEGR    R0                              ; 58AC   0020
        CMPR    R0,     R3                      ; 58AD   0143
        BLT     L_58BC                          ; 58AE   0205 000C

        TSTR    R3                              ; 58B0   009B
        BEQ     L_58BC                          ; 58B1   0204 0009

        TSTR    R4                              ; 58B3   00A4
        BPL     L_58BC                          ; 58B4   0203 0006

        SDBD                                    ; 58B6   0001
        MVII    #$FFF2, R3                      ; 58B7   02BB 00F2 00FF
        B       L_58DB                          ; 58BA   0200 001F

L_58BC:
        SUBR    R0,     R3                      ; 58BC   0103
        CMPI    #$000C, R3                      ; 58BD   037B 000C
        BLE     L_58C3                          ; 58BF   0206 0002

        SUBI    #$0019, R3                      ; 58C1   033B 0019
L_58C3:
        B       L_58DB                          ; 58C3   0200 0016

L_58C5:
        CMPR    R0,     R3                      ; 58C5   0143
        BGT     L_58D2                          ; 58C6   020E 000A

        TSTR    R3                              ; 58C8   009B
        BEQ     L_58D2                          ; 58C9   0204 0007

        TSTR    R4                              ; 58CB   00A4
        BMI     L_58D2                          ; 58CC   020B 0004

        MVII    #$000E, R3                      ; 58CE   02BB 000E
        B       L_58DB                          ; 58D0   0200 0009

L_58D2:
        SUBR    R0,     R3                      ; 58D2   0103
        SDBD                                    ; 58D3   0001
        CMPI    #$FFF4, R3                      ; 58D4   037B 00F4 00FF
        BGE     L_58DB                          ; 58D7   020D 0002

        ADDI    #$0019, R3                      ; 58D9   02FB 0019
L_58DB:
        MOVR    R3,     R1                      ; 58DB   0099
        TSTR    R3                              ; 58DC   009B
        BPL     L_58E0                          ; 58DD   0203 0001

        NEGR    R3                              ; 58DF   0023
L_58E0:
        SDBD                                    ; 58E0   0001
        ADDI    #$0324, R3                      ; 58E1   02FB 0024 0003
        PULR    R2                              ; 58E4   02B2
        PULR    R0                              ; 58E5   02B0
        PULR    R7                              ; 58E6   02B7

L_58E7:
        PSHR    R5                              ; 58E7   0275

        JSR     R5,     L_5949                  ; 58E8   0004 0158 0149

        BNC     L_58FA                          ; 58EB   0209 000D

        MVII    #$000D, R0                      ; 58ED   02B8 000D
        MVI     G_0337, R1                      ; 58EF   0281 0337
        TSTR    R1                              ; 58F1   0089
        BPL     L_58F5                          ; 58F2   0203 0001

        NEGR    R0                              ; 58F4   0020
L_58F5:
        MVO     R0,     G_034A                  ; 58F5   0240 034A

        JSR     R5,     L_5840                  ; 58F7   0004 0158 0040

L_58FA:
        MVI     G_0355, R0                      ; 58FA   0280 0355
        MVO     R0,     G_031F                  ; 58FC   0240 031F
        MVI     G_0356, R0                      ; 58FE   0280 0356
        MVO     R0,     G_0320                  ; 5900   0240 0320
        CLRR    R0                              ; 5902   01C0
        MVO     R0,     G_0321                  ; 5903   0240 0321
        PULR    R7                              ; 5905   02B7

L_5906:
        PSHR    R5                              ; 5906   0275

        JSR     R5,     L_5AE7                  ; 5907   0004 0158 02E7

        PSHR    R1                              ; 590A   0271
        MOVR    R0,     R1                      ; 590B   0081
        PULR    R0                              ; 590C   02B0
        MVII    #$0005, R3                      ; 590D   02BB 0005
        MVII    #$0008, R2                      ; 590F   02BA 0008
        MVI     G_034A, R5                      ; 5911   0285 034A
        TSTR    R5                              ; 5913   00AD
        BPL     L_591A                          ; 5914   0203 0004

        NEGR    R3                              ; 5916   0023
        INCR    R3                              ; 5917   000B
        NEGR    R2                              ; 5918   0022
        MOVR    R0,     R1                      ; 5919   0081
L_591A:
        TSTR    R1                              ; 591A   0089
        BPL     L_591E                          ; 591B   0203 0001

        NEGR    R1                              ; 591D   0021
L_591E:
        CMPI    #$0005, R1                      ; 591E   0379 0005
        BLE     L_5927                          ; 5920   0206 0005

        SUBI    #$0006, R1                      ; 5922   0339 0006
        SLR     R1,     1                       ; 5924   0061
        B       L_592A                          ; 5925   0200 0003

L_5927:
        NEGR    R1                              ; 5927   0021
        ADDI    #$0005, R1                      ; 5928   02F9 0005

L_592A:
        JSR     R5,     L_5154                  ; 592A   0004 0150 0154

        ADDI    #$0034, R0                      ; 592D   02F8 0034
        ADDR    R3,     R0                      ; 592F   00D8
        SWAP    R0,     1                       ; 5930   0040
        MVO     R0,     G_0356                  ; 5931   0240 0356
        PULR    R7                              ; 5933   02B7

L_5934:
        PSHR    R5                              ; 5934   0275

        JSR     R5,     L_5949                  ; 5935   0004 0158 0149

        BNC     L_5948                          ; 5938   0209 000E

        CLRR    R0                              ; 593A   01C0
L_593B:
        INCR    R0                              ; 593B   0008
        PSHR    R0                              ; 593C   0270

        JSR     R5,     L_597B                  ; 593D   0004 0158 017B

        PULR    R0                              ; 5940   02B0
        BNC     L_5948                          ; 5941   0209 0005

        CMPI    #$0006, R0                      ; 5943   0378 0006
        BLT     L_593B                          ; 5945   0225 000B

        SETC                                    ; 5947   0007
L_5948:
        PULR    R7                              ; 5948   02B7

L_5949:
        PSHR    R5                              ; 5949   0275
        MVI     G_0337, R2                      ; 594A   0282 0337
        MVI     G_0331, R0                      ; 594C   0280 0331

        JSR     R5,     X_UNPK_BYTES            ; 594E   0004 0114 0357

        TSTR    R2                              ; 5951   0092
        BPL     L_5955                          ; 5952   0203 0001

        MOVR    R1,     R0                      ; 5954   0088
L_5955:
        TSTR    R0                              ; 5955   0080
        BEQ     L_5979                          ; 5956   0204 0021
        B       L_5977                          ; 5958   0200 001D

L_595A:
        PSHR    R5                              ; 595A   0275

        JSR     R5,     L_5AB1                  ; 595B   0004 0158 02B1

        BC      L_5977                          ; 595E   0201 0017

        MVI     G_0186, R0                      ; 5960   0280 0186
        TSTR    R0                              ; 5962   0080
        BEQ     L_5977                          ; 5963   0204 0012

        MVI     G_0333, R0                      ; 5965   0280 0333

        JSR     R5,     X_UNPK_BYTES            ; 5967   0004 0114 0357

        PSHR    R1                              ; 596A   0271

        JSR     R5,     L_597B                  ; 596B   0004 0158 017B

        BNC     L_5975                          ; 596E   0209 0005

        PULR    R0                              ; 5970   02B0

        JSR     R5,     L_597B                  ; 5971   0004 0158 017B

        PULR    R7                              ; 5974   02B7

L_5975:
        PULR    R0                              ; 5975   02B0
        PULR    R7                              ; 5976   02B7

L_5977:
        SETC                                    ; 5977   0007
        PULR    R7                              ; 5978   02B7

L_5979:
        CLRC                                    ; 5979   0006
        PULR    R7                              ; 597A   02B7

L_597B:
        PSHR    R5                              ; 597B   0275
        TSTR    R0                              ; 597C   0080
        BNEQ    L_5981                          ; 597D   020C 0002
        B       L_5977                          ; 597F   0220 0009

L_5981:
        MVI     G_034A, R1                      ; 5981   0281 034A
        PSHR    R1                              ; 5983   0271
        CLRR    R1                              ; 5984   01C9
        MVO     R1,     G_034A                  ; 5985   0241 034A
        PSHR    R0                              ; 5987   0270

        JSR     R5,     L_5949                  ; 5988   0004 0158 0149

        BNC     L_5995                          ; 598B   0209 0008

        PULR    R0                              ; 598D   02B0

        JSR     R5,     L_59A3                  ; 598E   0004 0158 01A3

        BNC     L_599E                          ; 5991   0209 000B
        B       L_599B                          ; 5993   0200 0006

L_5995:
        PULR    R0                              ; 5995   02B0

        JSR     R5,     L_5A07                  ; 5996   0004 0158 0207

        BC      L_599E                          ; 5999   0201 0003

L_599B:
        CLRC                                    ; 599B   0006
        B       L_599F                          ; 599C   0200 0001

L_599E:
        SETC                                    ; 599E   0007
L_599F:
        PULR    R1                              ; 599F   02B1
        MVO     R1,     G_034A                  ; 59A0   0241 034A
        PULR    R7                              ; 59A2   02B7

L_59A3:
        PSHR    R5                              ; 59A3   0275

        JSR     R5,     L_5896                  ; 59A4   0004 0158 0096

        PSHR    R0                              ; 59A7   0270
        MVI@    R3,     R0                      ; 59A8   0298
        SDBD                                    ; 59A9   0001
        CMPI    #$0332, R3                      ; 59AA   037B 0032 0003
        BEQ     L_59C7                          ; 59AD   0204 0018

        MOVR    R1,     R2                      ; 59AF   008A

        JSR     R5,     X_UNPK_BYTES            ; 59B0   0004 0114 0357

        TSTR    R2                              ; 59B3   0092
        BPL     L_59B7                          ; 59B4   0203 0001

        MOVR    R1,     R0                      ; 59B6   0088
L_59B7:
        MVI     G_0337, R2                      ; 59B7   0282 0337
        TSTR    R2                              ; 59B9   0092
        BMI     L_59BD                          ; 59BA   020B 0001

        NEGR    R0                              ; 59BC   0020
L_59BD:
        CMPI    #$0002, R0                      ; 59BD   0378 0002
        BLT     L_59C4                          ; 59BF   0205 0003

L_59C1:
        PULR    R0                              ; 59C1   02B0
        B       L_5979                          ; 59C2   0220 004A

L_59C4:
        PULR    R0                              ; 59C4   02B0
        B       L_5977                          ; 59C5   0220 004F

L_59C7:
        MVI     G_0337, R2                      ; 59C7   0282 0337

        JSR     R5,     X_UNPK_BYTES            ; 59C9   0004 0114 0357

        TSTR    R2                              ; 59CC   0092
        BPL     L_59D1                          ; 59CD   0203 0002

        NEGR    R1                              ; 59CF   0021
        MOVR    R1,     R0                      ; 59D0   0088
L_59D1:
        MOVR    R0,     R3                      ; 59D1   0083
        SDBD                                    ; 59D2   0001
        MVII    #$0325, R4                      ; 59D3   02BC 0025 0003
L_59D6:
        MVI@    R4,     R0                      ; 59D6   02A0

        JSR     R5,     X_UNPK_BYTES            ; 59D7   0004 0114 0357

        TSTR    R2                              ; 59DA   0092
        BPL     L_59DF                          ; 59DB   0203 0002

        NEGR    R1                              ; 59DD   0021
        MOVR    R1,     R0                      ; 59DE   0088
L_59DF:
        TSTR    R0                              ; 59DF   0080
        BMI     L_59E7                          ; 59E0   020B 0005
        BEQ     L_59E7                          ; 59E2   0204 0003

        ADDR    R0,     R3                      ; 59E4   00C3
        MVO     R4,     G_034B                  ; 59E5   0244 034B
L_59E7:
        SDBD                                    ; 59E7   0001
        CMPI    #$032B, R4                      ; 59E8   037C 002B 0003
        BLT     L_59D6                          ; 59EB   0225 0016

        CMPI    #$000F, R3                      ; 59ED   037B 000F
        BNEQ    L_59C1                          ; 59EF   022C 002F

        PULR    R3                              ; 59F1   02B3
        PSHR    R3                              ; 59F2   0273
        MVI     G_034A, R0                      ; 59F3   0280 034A
        TSTR    R0                              ; 59F5   0080
        BPL     L_59F9                          ; 59F6   0203 0001

        NEGR    R0                              ; 59F8   0020
L_59F9:
        MVI     G_034B, R1                      ; 59F9   0281 034B
        SDBD                                    ; 59FB   0001
        SUBI    #$0325, R1                      ; 59FC   0339 0025 0003
        CMPR    R0,     R1                      ; 59FF   0141
        BEQ     L_59C4                          ; 5A00   0224 003D

        CMPR    R0,     R3                      ; 5A02   0143
        BEQ     L_59C4                          ; 5A03   0224 0040
        B       L_59C1                          ; 5A05   0220 0045

L_5A07:
        PSHR    R5                              ; 5A07   0275
        PSHR    R0                              ; 5A08   0270
L_5A09:
        MVII    #$0001, R0                      ; 5A09   02B8 0001

        JSR     R5,     L_5896                  ; 5A0B   0004 0158 0096

        SDBD                                    ; 5A0E   0001
        CMPI    #$0332, R3                      ; 5A0F   037B 0032 0003
        BGE     L_5A26                          ; 5A12   020D 0012

        MVO     R1,     G_034A                  ; 5A14   0241 034A
        MOVR    R1,     R0                      ; 5A16   0088

        JSR     R5,     L_5874                  ; 5A17   0004 0158 0074

        BNC     L_5A09                          ; 5A1A   0229 0012

        PULR    R0                              ; 5A1C   02B0
        PSHR    R0                              ; 5A1D   0270

        JSR     R5,     L_59A3                  ; 5A1E   0004 0158 01A3

        BNC     L_5A09                          ; 5A21   0229 0019

        CLRC                                    ; 5A23   0006
        B       L_5A27                          ; 5A24   0200 0001

L_5A26:
        SETC                                    ; 5A26   0007
L_5A27:
        PULR    R0                              ; 5A27   02B0
        PULR    R7                              ; 5A28   02B7

L_5A29:
        PSHR    R5                              ; 5A29   0275
        SDBD                                    ; 5A2A   0001
        MVII    #$0325, R4                      ; 5A2B   02BC 0025 0003
        SDBD                                    ; 5A2E   0001
        MVII    #$0338, R3                      ; 5A2F   02BB 0038 0003
        MVII    #$000F, R2                      ; 5A32   02BA 000F

        JSR     R5,     L_5A6A                  ; 5A34   0004 0158 026A

        MVI     G_0186, R0                      ; 5A37   0280 0186
        MVO     R0,     G_0188                  ; 5A39   0240 0188
        PULR    R7                              ; 5A3B   02B7

L_5A3C:
        PSHR    R5                              ; 5A3C   0275
        SDBD                                    ; 5A3D   0001
        MVII    #$0338, R4                      ; 5A3E   02BC 0038 0003
        SDBD                                    ; 5A41   0001
        MVII    #$0325, R3                      ; 5A42   02BB 0025 0003
        MVII    #$000F, R2                      ; 5A45   02BA 000F

        JSR     R5,     L_5A6A                  ; 5A47   0004 0158 026A

        SDBD                                    ; 5A4A   0001
        MVII    #$5814, R0                      ; 5A4B   02B8 0014 0058
        MVO     R0,     G_0348                  ; 5A4E   0240 0348
        SDBD                                    ; 5A50   0001
        MVII    #$550E, R0                      ; 5A51   02B8 000E 0055
        MVO     R0,     G_0347                  ; 5A54   0240 0347
        MVII    #$0001, R0                      ; 5A56   02B8 0001
        MVI     G_0337, R1                      ; 5A58   0281 0337
        TSTR    R1                              ; 5A5A   0089
        BPL     L_5A5E                          ; 5A5B   0203 0001

        NEGR    R0                              ; 5A5D   0020
L_5A5E:
        MVO     R0,     G_034A                  ; 5A5E   0240 034A
        MVI     G_0188, R0                      ; 5A60   0280 0188
        MVO     R0,     G_0186                  ; 5A62   0240 0186

        JSR     R5,     L_52A4                  ; 5A64   0004 0150 02A4

        J       L_5814                          ; 5A67   0004 0358 0014

L_5A6A:
        PSHR    R5                              ; 5A6A   0275
        MOVR    R3,     R5                      ; 5A6B   009D
L_5A6C:
        MVI@    R4,     R0                      ; 5A6C   02A0
        MVO@    R0,     R5                      ; 5A6D   0268
        DECR    R2                              ; 5A6E   0012
        BNEQ    L_5A6C                          ; 5A6F   022C 0004
        PULR    R7                              ; 5A71   02B7

L_5A72:
        PSHR    R5                              ; 5A72   0275
        CMPI    #$000A, R0                      ; 5A73   0378 000A
        CLRC                                    ; 5A75   0006
        BNEQ    L_5A7C                          ; 5A76   020C 0004

        JSR     R5,     L_5A3C                  ; 5A78   0004 0158 023C

        SETC                                    ; 5A7B   0007
L_5A7C:
        PULR    R7                              ; 5A7C   02B7

        JSR     R5,     L_5A72                  ; 5A7D   0004 0158 0272

        BNC     L_5A83                          ; 5A80   0209 0001
        PULR    R7                              ; 5A82   02B7

L_5A83:
        CMPI    #$000B, R0                      ; 5A83   0378 000B
        BEQ     L_5A8A                          ; 5A85   0204 0003
        J       L_5122                          ; 5A87   0004 0350 0122

L_5A8A:
        JSR     R5,     L_5AB1                  ; 5A8A   0004 0158 02B1

        BNC     L_5A93                          ; 5A8D   0209 0004

        JSR     R5,     L_5AC3                  ; 5A8F   0004 0158 02C3

        PULR    R7                              ; 5A92   02B7

L_5A93:
        MVI     G_0337, R0                      ; 5A93   0280 0337
        COMR    R0                              ; 5A95   0018
        MVO     R0,     G_0337                  ; 5A96   0240 0337

        JSR     R5,     L_57EA                  ; 5A98   0004 0154 03EA

        CLRR    R0                              ; 5A9B   01C0
        MVO     R0,     G_034A                  ; 5A9C   0240 034A
        COMR    R0                              ; 5A9E   0018
        MVO     R0,     G_0346                  ; 5A9F   0240 0346

        JSR     R5,     L_5934                  ; 5AA1   0004 0158 0134

        BC      L_5A93                          ; 5AA4   0221 0012

        JSR     R5,     L_5813                  ; 5AA6   0004 0158 0013

        CLRR    R0                              ; 5AA9   01C0
        MVO     R0,     G_0348                  ; 5AAA   0240 0348
        MVO     R0,     G_0347                  ; 5AAC   0240 0347
        J       L_56DD                          ; 5AAE   0004 0354 02DD

L_5AB1:
        PSHR    R5                              ; 5AB1   0275
        MVI     G_0332, R0                      ; 5AB2   0280 0332
        MVII    #$000F, R2                      ; 5AB4   02BA 000F

        JSR     R5,     X_UNPK_BYTES            ; 5AB6   0004 0114 0357

        CMPR    R2,     R0                      ; 5AB9   0150
        BEQ     L_5AC1                          ; 5ABA   0204 0005

        ADDR    R2,     R1                      ; 5ABC   00D1
        BEQ     L_5AC1                          ; 5ABD   0204 0002

        CLRC                                    ; 5ABF   0006
        PULR    R7                              ; 5AC0   02B7

L_5AC1:
        SETC                                    ; 5AC1   0007
        PULR    R7                              ; 5AC2   02B7

L_5AC3:
        PSHR    R5                              ; 5AC3   0275
        MVI     G_0337, R2                      ; 5AC4   0282 0337

        JSR     R5,     L_5E43                  ; 5AC6   0004 015C 0243

        BC      L_5AD5                          ; 5AC9   0201 000A

        MVI     G_0335, R0                      ; 5ACB   0280 0335
        TSTR    R0                              ; 5ACD   0080
        BEQ     L_5AD5                          ; 5ACE   0204 0005

        JSR     R5,     L_5F2C                  ; 5AD0   0004 015C 032C

        B       L_5AD8                          ; 5AD3   0200 0003

L_5AD5:
        JSR     R5,     L_5F46                  ; 5AD5   0004 015C 0346

L_5AD8:
        J       L_506F                          ; 5AD8   0004 0350 006F

L_5ADB:
        ADD     G_018A, R3                      ; 5ADB   02C3 018A
        MVO@    R0,     R3                      ; 5ADD   0258
        MOVR    R5,     R7                      ; 5ADE   00AF

L_5ADF:
        PSHR    R5                              ; 5ADF   0275
        ADD     G_018A, R3                      ; 5AE0   02C3 018A
        MVI@    R3,     R0                      ; 5AE2   0298

        JSR     R5,     X_EXT_SIGN_LO           ; 5AE3   0004 0114 0268

        PULR    R7                              ; 5AE6   02B7

L_5AE7:
        PSHR    R5                              ; 5AE7   0275

        JSR     R5,     L_5D52                  ; 5AE8   0004 015C 0152

        MVI@    R3,     R0                      ; 5AEB   0298

        JSR     R5,     X_UNPK_BYTES            ; 5AEC   0004 0114 0357

        PULR    R7                              ; 5AEF   02B7

L_5AF0:
        SDBD                                    ; 5AF0   0001
        MVII    #$0357, R3                      ; 5AF1   02BB 0057 0003
        ADD     G_018A, R3                      ; 5AF4   02C3 018A
        MVI@    R3,     R0                      ; 5AF6   0298
        MOVR    R5,     R7                      ; 5AF7   00AF

L_5AF8:
        PSHR    R5                              ; 5AF8   0275

        JSR     R5,     X_PACK_BYTES            ; 5AF9   0004 0114 034F

        PSHR    R0                              ; 5AFC   0270

        JSR     R5,     L_5D52                  ; 5AFD   0004 015C 0152

        PULR    R0                              ; 5B00   02B0
        MVO@    R0,     R3                      ; 5B01   0258
        PULR    R7                              ; 5B02   02B7

L_5B03:
        PSHR    R5                              ; 5B03   0275
        PSHR    R0                              ; 5B04   0270

        JSR     R5,     L_5AF0                  ; 5B05   0004 0158 02F0

        INCR    R3                              ; 5B08   000B
        MVO@    R0,     R3                      ; 5B09   0258
        SDBD                                    ; 5B0A   0001
        MVII    #$0180, R3                      ; 5B0B   02BB 0080 0001

        JSR     R5,     L_5ADF                  ; 5B0E   0004 0158 02DF

        INCR    R3                              ; 5B11   000B
        MVO@    R0,     R3                      ; 5B12   0258

        JSR     R5,     L_5AE7                  ; 5B13   0004 0158 02E7

        MVI     G_034A, R2                      ; 5B16   0282 034A

        JSR     R5,     L_5638                  ; 5B18   0004 0154 0238
        JSR     R5,     L_5AF8                  ; 5B1B   0004 0158 02F8

        MVO     R0,     G_034C                  ; 5B1E   0240 034C
        SDBD                                    ; 5B20   0001
        MVII    #$016C, R3                      ; 5B21   02BB 006C 0001
        MVI     G_034A, R0                      ; 5B24   0280 034A

        JSR     R5,     L_5ADB                  ; 5B26   0004 0158 02DB

        PULR    R0                              ; 5B29   02B0
        SDBD                                    ; 5B2A   0001
        MVII    #$015D, R3                      ; 5B2B   02BB 005D 0001

        JSR     R5,     L_5ADB                  ; 5B2E   0004 0158 02DB
        JSR     R5,     L_5896                  ; 5B31   0004 0158 0096

        MVO     R1,     G_034A                  ; 5B34   0241 034A
        MOVR    R1,     R0                      ; 5B36   0088
        SDBD                                    ; 5B37   0001
        MVII    #$0167, R3                      ; 5B38   02BB 0067 0001

        JSR     R5,     L_5ADB                  ; 5B3B   0004 0158 02DB
        JSR     R5,     L_5AE7                  ; 5B3E   0004 0158 02E7

        MVI     G_034A, R2                      ; 5B41   0282 034A

        JSR     R5,     L_564C                  ; 5B43   0004 0154 024C

        CLRR    R4                              ; 5B46   01E4
        BNC     L_5B4A                          ; 5B47   0209 0001

        COMR    R4                              ; 5B49   001C

L_5B4A:
        JSR     R5,     L_5AF8                  ; 5B4A   0004 0158 02F8

        SDBD                                    ; 5B4D   0001
        MVII    #$0162, R3                      ; 5B4E   02BB 0062 0001
        MOVR    R4,     R0                      ; 5B51   00A0

        JSR     R5,     L_5ADB                  ; 5B52   0004 0158 02DB

        MVI     G_0186, R0                      ; 5B55   0280 0186
        SUB     G_0187, R0                      ; 5B57   0300 0187
        MVO     R0,     G_0186                  ; 5B59   0240 0186
        BEQ     L_5B72                          ; 5B5B   0204 0015

        MVI     G_0333, R0                      ; 5B5D   0280 0333

        JSR     R5,     X_UNPK_BYTES            ; 5B5F   0004 0114 0357

        TSTR    R0                              ; 5B62   0080
        BNEQ    L_5B66                          ; 5B63   020C 0001

        MOVR    R1,     R0                      ; 5B65   0088
L_5B66:
        PSHR    R0                              ; 5B66   0270

        JSR     R5,     L_597B                  ; 5B67   0004 0158 017B

        PULR    R0                              ; 5B6A   02B0
        BC      L_5B72                          ; 5B6B   0201 0005

        JSR     R5,     L_5C4B                  ; 5B6D   0004 015C 004B

        CLRC                                    ; 5B70   0006
        PULR    R7                              ; 5B71   02B7

L_5B72:
        JSR     R5,     L_5C4B                  ; 5B72   0004 015C 004B

        SETC                                    ; 5B75   0007
        PULR    R7                              ; 5B76   02B7

L_5B77:
        PSHR    R5                              ; 5B77   0275

        JSR     R5,     L_5C46                  ; 5B78   0004 015C 0046

        SDBD                                    ; 5B7B   0001
        MVII    #$0162, R3                      ; 5B7C   02BB 0062 0001

        JSR     R5,     L_5ADF                  ; 5B7F   0004 0158 02DF

        TSTR    R0                              ; 5B82   0080
        BEQ     L_5BC4                          ; 5B83   0204 003F

        MVI     G_0337, R0                      ; 5B85   0280 0337
        TSTR    R0                              ; 5B87   0080
        BPL     L_5B8F                          ; 5B88   0203 0005

        JSR     R5,     L_56C5                  ; 5B8A   0004 0154 02C5

        B       L_5B92                          ; 5B8D   0200 0003

L_5B8F:
        JSR     R5,     L_56BB                  ; 5B8F   0004 0154 02BB

L_5B92:
        SDBD                                    ; 5B92   0001
        MVII    #$0167, R3                      ; 5B93   02BB 0067 0001

        JSR     R5,     L_5ADF                  ; 5B96   0004 0158 02DF

        MVO     R0,     G_034A                  ; 5B99   0240 034A

        JSR     R5,     L_5AE7                  ; 5B9B   0004 0158 02E7

        MVI     G_034A, R2                      ; 5B9E   0282 034A
        TSTR    R2                              ; 5BA0   0092
        BPL     L_5BA6                          ; 5BA1   0203 0003

        NEGR    R1                              ; 5BA3   0021
        B       L_5BA7                          ; 5BA4   0200 0001

L_5BA6:
        NEGR    R0                              ; 5BA6   0020

L_5BA7:
        JSR     R5,     L_5AF8                  ; 5BA7   0004 0158 02F8

        SDBD                                    ; 5BAA   0001
        MVII    #$016C, R3                      ; 5BAB   02BB 006C 0001

        JSR     R5,     L_5ADF                  ; 5BAE   0004 0158 02DF

        MVO     R0,     G_034A                  ; 5BB1   0240 034A

        JSR     R5,     L_5AE7                  ; 5BB3   0004 0158 02E7

        MVI     G_034A, R2                      ; 5BB6   0282 034A

        JSR     R5,     L_564C                  ; 5BB8   0004 0154 024C
        JSR     R5,     L_5AF8                  ; 5BBB   0004 0158 02F8

        MVI     G_0186, R0                      ; 5BBE   0280 0186
        INCR    R0                              ; 5BC0   0008
        MVO     R0,     G_0186                  ; 5BC1   0240 0186
        PULR    R7                              ; 5BC3   02B7

L_5BC4:
        SDBD                                    ; 5BC4   0001
        MVII    #$0167, R3                      ; 5BC5   02BB 0067 0001

        JSR     R5,     L_5ADF                  ; 5BC8   0004 0158 02DF

        MVO     R0,     G_034A                  ; 5BCB   0240 034A

        JSR     R5,     L_5AE7                  ; 5BCD   0004 0158 02E7

        MVI     G_034A, R2                      ; 5BD0   0282 034A

        JSR     R5,     L_5638                  ; 5BD2   0004 0154 0238

        B       L_5BA7                          ; 5BD5   0220 002F

L_5BD7:
        PSHR    R5                              ; 5BD7   0275
        SDBD                                    ; 5BD8   0001
        MVII    #$0180, R3                      ; 5BD9   02BB 0080 0001

        JSR     R5,     L_5ADF                  ; 5BDC   0004 0158 02DF

        INCR    R3                              ; 5BDF   000B
        MVI@    R3,     R1                      ; 5BE0   0299
        CMPR    R0,     R1                      ; 5BE1   0141
        BGT     L_5BEE                          ; 5BE2   020E 000A
        BNEQ    L_5C2A                          ; 5BE4   020C 0044

        JSR     R5,     L_5AF0                  ; 5BE6   0004 0158 02F0

        INCR    R3                              ; 5BE9   000B
        MVI@    R3,     R1                      ; 5BEA   0299
        CMPR    R0,     R1                      ; 5BEB   0141
        BLE     L_5C2A                          ; 5BEC   0206 003C

L_5BEE:
        SDBD                                    ; 5BEE   0001
        MVII    #$0181, R3                      ; 5BEF   02BB 0081 0001

        JSR     R5,     L_5ADF                  ; 5BF2   0004 0158 02DF

        DECR    R3                              ; 5BF5   0013
        MVO@    R0,     R3                      ; 5BF6   0258
        SDBD                                    ; 5BF7   0001
        MVII    #$0358, R3                      ; 5BF8   02BB 0058 0003
        ADD     G_018A, R3                      ; 5BFB   02C3 018A
        MVI@    R3,     R0                      ; 5BFD   0298
        DECR    R3                              ; 5BFE   0013
        MVO@    R0,     R3                      ; 5BFF   0258
        SDBD                                    ; 5C00   0001
        MVII    #$016C, R3                      ; 5C01   02BB 006C 0001

        JSR     R5,     L_5ADF                  ; 5C04   0004 0158 02DF

        SDBD                                    ; 5C07   0001
        MVII    #$0171, R3                      ; 5C08   02BB 0071 0001

        JSR     R5,     L_5ADB                  ; 5C0B   0004 0158 02DB

        SDBD                                    ; 5C0E   0001
        MVII    #$0167, R3                      ; 5C0F   02BB 0067 0001

        JSR     R5,     L_5ADF                  ; 5C12   0004 0158 02DF

        SDBD                                    ; 5C15   0001
        MVII    #$0176, R3                      ; 5C16   02BB 0076 0001

        JSR     R5,     L_5ADB                  ; 5C19   0004 0158 02DB

        SDBD                                    ; 5C1C   0001
        MVII    #$015D, R3                      ; 5C1D   02BB 005D 0001

        JSR     R5,     L_5ADF                  ; 5C20   0004 0158 02DF

        SDBD                                    ; 5C23   0001
        MVII    #$017B, R3                      ; 5C24   02BB 007B 0001

        JSR     R5,     L_5ADB                  ; 5C27   0004 0158 02DB

L_5C2A:
        PULR    R7                              ; 5C2A   02B7

L_5C2B:
        PSHR    R5                              ; 5C2B   0275

        JSR     R5,     L_5EAF                  ; 5C2C   0004 015C 02AF

        B       L_5C32                          ; 5C2F   0200 0001

L_5C31:
        PSHR    R5                              ; 5C31   0275

L_5C32:
        JSR     R5,     L_5B03                  ; 5C32   0004 0158 0303

        BC      L_5C3C                          ; 5C35   0201 0005

        JSR     R5,     L_5DA3                  ; 5C37   0004 015C 01A3

        B       L_5C3F                          ; 5C3A   0200 0003
L_5C3C:
        J       L_5C52                          ; 5C3C   0004 035C 0052

L_5C3F:
        JSR     R5,     L_5B77                  ; 5C3F   0004 0158 0377
        JSR     R5,     L_5BD7                  ; 5C42   0004 0158 03D7

        PULR    R7                              ; 5C45   02B7

L_5C46:
        MVII    #$0001, R3                      ; 5C46   02BB 0001
        NEGR    R3                              ; 5C48   0023
        B       L_5C4D                          ; 5C49   0200 0002

L_5C4B:
        MVII    #$0001, R3                      ; 5C4B   02BB 0001
L_5C4D:
        ADD     G_018A, R3                      ; 5C4D   02C3 018A
        MVO     R3,     G_018A                  ; 5C4F   0243 018A
        MOVR    R5,     R7                      ; 5C51   00AF

L_5C52:
        JSR     R5,     L_53D9                  ; 5C52   0004 0150 03D9

        CLRR    R0                              ; 5C55   01C0
        MVI     G_018A, R1                      ; 5C56   0281 018A
        SDBD                                    ; 5C58   0001
        MVII    #$015D, R5                      ; 5C59   02BD 005D 0001
L_5C5C:
        ADD@    R5,     R0                      ; 5C5C   02E8
        DECR    R1                              ; 5C5D   0011
        BNEQ    L_5C5C                          ; 5C5E   022C 0003

        SDBD                                    ; 5C60   0001
        MVII    #$0180, R3                      ; 5C61   02BB 0080 0001

        JSR     R5,     L_5ADB                  ; 5C64   0004 0158 02DB
        JSR     R5,     L_5E43                  ; 5C67   0004 015C 0243

        BC      L_5C6F                          ; 5C6A   0201 0003
        J       L_5C3F                          ; 5C6C   0004 035C 003F

L_5C6F:
        MVI     G_0332, R0                      ; 5C6F   0280 0332

        JSR     R5,     X_UNPK_BYTES            ; 5C71   0004 0114 0357

        MOVR    R1,     R3                      ; 5C74   008B
        NEGR    R3                              ; 5C75   0023
        MVO     R0,     G_034B                  ; 5C76   0240 034B

        JSR     R5,     L_5F0E                  ; 5C78   0004 015C 030E

        SAR     R0,     1                       ; 5C7B   0068
        ADDR    R3,     R0                      ; 5C7C   00D8
        SDBD                                    ; 5C7D   0001
        MVII    #$0357, R3                      ; 5C7E   02BB 0057 0003

        JSR     R5,     L_5ADB                  ; 5C81   0004 0158 02DB

        CLRR    R0                              ; 5C84   01C0
        MVO     R0,     G_034A                  ; 5C85   0240 034A
        MVO     R0,     G_0336                  ; 5C87   0240 0336
        MVO     R0,     G_0352                  ; 5C89   0240 0352
L_5C8B:
        MVII    #$0001, R0                      ; 5C8B   02B8 0001

        JSR     R5,     L_5896                  ; 5C8D   0004 0158 0096

        MOVR    R1,     R0                      ; 5C90   0088

        JSR     R5,     L_5D5D                  ; 5C91   0004 015C 015D

        MOVR    R1,     R2                      ; 5C94   008A
        MVO     R1,     G_034A                  ; 5C95   0241 034A

        JSR     R5,     L_5AE7                  ; 5C97   0004 0158 02E7

        TSTR    R2                              ; 5C9A   0092
        BPL     L_5C9E                          ; 5C9B   0203 0001

        MOVR    R1,     R0                      ; 5C9D   0088
L_5C9E:
        TSTR    R0                              ; 5C9E   0080
        BEQ     L_5D09                          ; 5C9F   0204 0068
        BMI     L_5CA8                          ; 5CA1   020B 0005

        JSR     R5,     L_5D3A                  ; 5CA3   0004 015C 013A

        B       L_5D09                          ; 5CA6   0200 0061

L_5CA8:
        JSR     R5,     L_5EEE                  ; 5CA8   0004 015C 02EE

        BC      L_5D09                          ; 5CAB   0201 005C

        JSR     R5,     L_5EC5                  ; 5CAD   0004 015C 02C5

        BC      L_5D06                          ; 5CB0   0201 0054

        INCR    R0                              ; 5CB2   0008
        BEQ     L_5CE1                          ; 5CB3   0204 002C

        JSR     R5,     L_5EBB                  ; 5CB5   0004 015C 02BB

        BC      L_5D09                          ; 5CB8   0201 004F

        JSR     R5,     L_5D30                  ; 5CBA   0004 015C 0130

        CLRR    R3                              ; 5CBD   01DB
        COMR    R3                              ; 5CBE   001B
        SDBD                                    ; 5CBF   0001
        MVII    #$FFF7, R4                      ; 5CC0   02BC 00F7 00FF
        BC      L_5CD2                          ; 5CC3   0201 000D

        JSR     R5,     L_5E52                  ; 5CC5   0004 015C 0252

        CLRR    R3                              ; 5CC8   01DB
        COMR    R3                              ; 5CC9   001B
        SDBD                                    ; 5CCA   0001
        MVII    #$FFF7, R4                      ; 5CCB   02BC 00F7 00FF
        BC      L_5CD2                          ; 5CCE   0201 0002

        SUBI    #$0002, R3                      ; 5CD0   033B 0002

L_5CD2:
        JSR     R5,     L_5E65                  ; 5CD2   0004 015C 0265

        BNC     L_5D09                          ; 5CD5   0209 0032

        JSR     R5,     L_5D30                  ; 5CD7   0004 015C 0130

        MVII    #$0001, R0                      ; 5CDA   02B8 0001
        BC      L_5D06                          ; 5CDC   0201 0028

        INCR    R0                              ; 5CDE   0008
        B       L_5D06                          ; 5CDF   0200 0025

L_5CE1:
        JSR     R5,     L_5D30                  ; 5CE1   0004 015C 0130

        BC      L_5D09                          ; 5CE4   0201 0023

        JSR     R5,     L_5EBB                  ; 5CE6   0004 015C 02BB

        BC      L_5D06                          ; 5CE9   0201 001B

        JSR     R5,     L_5E52                  ; 5CEB   0004 015C 0252

        CLRR    R0                              ; 5CEE   01C0
        COMR    R0                              ; 5CEF   0018
        BNC     L_5D06                          ; 5CF0   0209 0014

        MVII    #$0001, R3                      ; 5CF2   02BB 0001
        MVII    #$0007, R4                      ; 5CF4   02BC 0007
        NEGR    R3                              ; 5CF6   0023
        NEGR    R4                              ; 5CF7   0024

        JSR     R5,     L_5E65                  ; 5CF8   0004 015C 0265

        BNC     L_5D06                          ; 5CFB   0209 0009

        SUBI    #$0002, R0                      ; 5CFD   0338 0002

        JSR     R5,     L_5E6F                  ; 5CFF   0004 015C 026F

        BNC     L_5D06                          ; 5D02   0209 0002

        SUBI    #$0004, R0                      ; 5D04   0338 0004

L_5D06:
        JSR     R5,     L_5D21                  ; 5D06   0004 015C 0121
L_5D09:
        JSR     R5,     L_5D70                  ; 5D09   0004 015C 0170

        MOVR    R0,     R4                      ; 5D0C   0084
        INCR    R4                              ; 5D0D   000C
        BNEQ    L_5C8B                          ; 5D0E   022C 0084

        MVI     G_0352, R0                      ; 5D10   0280 0352
        TSTR    R0                              ; 5D12   0080
        BNEQ    L_5D1B                          ; 5D13   020C 0006

        JSR     R5,     L_5F0E                  ; 5D15   0004 015C 030E
        JSR     R5,     L_5D21                  ; 5D18   0004 015C 0121

L_5D1B:
        CLRR    R0                              ; 5D1B   01C0
        MVO     R0,     G_0352                  ; 5D1C   0240 0352
        J       L_5C3F                          ; 5D1E   0004 035C 003F

L_5D21:
        PSHR    R5                              ; 5D21   0275
        PSHR    R0                              ; 5D22   0270

        JSR     R5,     L_5AF0                  ; 5D23   0004 0158 02F0

        PULR    R1                              ; 5D26   02B1
        ADDR    R1,     R0                      ; 5D27   00C8
        SDBD                                    ; 5D28   0001
        MVII    #$0357, R3                      ; 5D29   02BB 0057 0003

        JSR     R5,     L_5ADB                  ; 5D2C   0004 0158 02DB

        PULR    R7                              ; 5D2F   02B7

L_5D30:
        MVI     G_034B, R1                      ; 5D30   0281 034B
        CMPI    #$000F, R1                      ; 5D32   0379 000F
        BLT     L_5D38                          ; 5D34   0205 0002

        SETC                                    ; 5D36   0007
        MOVR    R5,     R7                      ; 5D37   00AF

L_5D38:
        CLRC                                    ; 5D38   0006
        MOVR    R5,     R7                      ; 5D39   00AF

L_5D3A:
        PSHR    R5                              ; 5D3A   0275
        MVI     G_034B, R1                      ; 5D3B   0281 034B
        ADDR    R0,     R1                      ; 5D3D   00C1
        MVO     R1,     G_034B                  ; 5D3E   0241 034B
        MVII    #$0001, R4                      ; 5D40   02BC 0001
        MVII    #$0008, R3                      ; 5D42   02BB 0008

        JSR     R5,     L_5E65                  ; 5D44   0004 015C 0265

        BNC     L_5D51                          ; 5D47   0209 0008

        DECR    R0                              ; 5D49   0010
        BEQ     L_5D51                          ; 5D4A   0204 0005

        MVI     G_0336, R0                      ; 5D4C   0280 0336
        INCR    R0                              ; 5D4E   0008
        MVO     R0,     G_0336                  ; 5D4F   0240 0336
L_5D51:
        PULR    R7                              ; 5D51   02B7

L_5D52:
        MVI     G_034A, R3                      ; 5D52   0283 034A
        TSTR    R3                              ; 5D54   009B
        BPL     L_5D58                          ; 5D55   0203 0001

        NEGR    R3                              ; 5D57   0023
L_5D58:
        SDBD                                    ; 5D58   0001
        ADDI    #$0324, R3                      ; 5D59   02FB 0024 0003
        MOVR    R5,     R7                      ; 5D5C   00AF

L_5D5D:
        PSHR    R4                              ; 5D5D   0274
        MVI     G_018B, R4                      ; 5D5E   0284 018B
        SDBD                                    ; 5D60   0001
        ADDI    #$018C, R4                      ; 5D61   02FC 008C 0001
        MVO@    R0,     R4                      ; 5D64   0260
        SWAP    R0,     1                       ; 5D65   0040
        MVO@    R0,     R4                      ; 5D66   0260
        SWAP    R0,     1                       ; 5D67   0040
        SDBD                                    ; 5D68   0001
        SUBI    #$018C, R4                      ; 5D69   033C 008C 0001
        MVO     R4,     G_018B                  ; 5D6C   0244 018B
        PULR    R4                              ; 5D6E   02B4
        MOVR    R5,     R7                      ; 5D6F   00AF

L_5D70:
        PSHR    R4                              ; 5D70   0274
        MVI     G_018B, R4                      ; 5D71   0284 018B
        SDBD                                    ; 5D73   0001
        ADDI    #$018A, R4                      ; 5D74   02FC 008A 0001
        SDBD                                    ; 5D77   0001
        MVI@    R4,     R0                      ; 5D78   02A0
        SDBD                                    ; 5D79   0001
        SUBI    #$018E, R4                      ; 5D7A   033C 008E 0001
        MVO     R4,     G_018B                  ; 5D7D   0244 018B
        PULR    R4                              ; 5D7F   02B4
        MOVR    R5,     R7                      ; 5D80   00AF

L_5D81:
        PSHR    R5                              ; 5D81   0275

        JSR     R5,     L_5D5D                  ; 5D82   0004 015C 015D
        JSR     R5,     L_597B                  ; 5D85   0004 0158 017B

        BC      L_5DD5                          ; 5D88   0201 004B

        JSR     R5,     L_5949                  ; 5D8A   0004 0158 0149

        CLRR    R1                              ; 5D8D   01C9
        MVO     R1,     G_034A                  ; 5D8E   0241 034A
        BNC     L_5DCA                          ; 5D90   0209 0038

        MVI     G_0337, R1                      ; 5D92   0281 0337
        MVII    #$000D, R0                      ; 5D94   02B8 000D
        TSTR    R1                              ; 5D96   0089
        BPL     L_5D9A                          ; 5D97   0203 0001

        NEGR    R0                              ; 5D99   0020
L_5D9A:
        MVO     R0,     G_034A                  ; 5D9A   0240 034A

        JSR     R5,     L_5D70                  ; 5D9C   0004 015C 0170
        JSR     R5,     L_5C31                  ; 5D9F   0004 015C 0031

        PULR    R7                              ; 5DA2   02B7

L_5DA3:
        PSHR    R5                              ; 5DA3   0275

        JSR     R5,     L_5D5D                  ; 5DA4   0004 015C 015D

        CLRR    R0                              ; 5DA7   01C0

        JSR     R5,     L_5E43                  ; 5DA8   0004 015C 0243

        BC      L_5DB1                          ; 5DAB   0201 0004

        MVO     R0,     G_034A                  ; 5DAD   0240 034A
        B       L_5DCA                          ; 5DAF   0200 0019

L_5DB1:
        SDBD                                    ; 5DB1   0001
        MVII    #$016B, R3                      ; 5DB2   02BB 006B 0001

        JSR     R5,     L_5ADF                  ; 5DB5   0004 0158 02DF

        MVO     R0,     G_034A                  ; 5DB8   0240 034A

        JSR     R5,     L_5874                  ; 5DBA   0004 0158 0074

        BNC     L_5DCA                          ; 5DBD   0209 000B

        JSR     R5,     L_5D70                  ; 5DBF   0004 015C 0170
        JSR     R5,     L_5D5D                  ; 5DC2   0004 015C 015D
        JSR     R5,     L_59A3                  ; 5DC5   0004 0158 01A3

        BC      L_5DD9                          ; 5DC8   0201 000F

L_5DCA:
        JSR     R5,     L_5D70                  ; 5DCA   0004 015C 0170
L_5DCD:
        JSR     R5,     L_5D5D                  ; 5DCD   0004 015C 015D
        JSR     R5,     L_5A07                  ; 5DD0   0004 0158 0207

        BNC     L_5DD9                          ; 5DD3   0209 0004

L_5DD5:
        JSR     R5,     L_5D70                  ; 5DD5   0004 015C 0170

        PULR    R7                              ; 5DD8   02B7

L_5DD9:
        JSR     R5,     L_5D70                  ; 5DD9   0004 015C 0170

        MOVR    R0,     R1                      ; 5DDC   0081

        JSR     R5,     L_5D5D                  ; 5DDD   0004 015C 015D

        MVI     G_034A, R0                      ; 5DE0   0280 034A

        JSR     R5,     L_5D5D                  ; 5DE2   0004 015C 015D

        MOVR    R1,     R0                      ; 5DE5   0088

        JSR     R5,     L_5C31                  ; 5DE6   0004 015C 0031
        JSR     R5,     L_5D70                  ; 5DE9   0004 015C 0170

        MVO     R0,     G_034A                  ; 5DEC   0240 034A

        JSR     R5,     L_5D70                  ; 5DEE   0004 015C 0170

        B       L_5DCD                          ; 5DF1   0220 0025

L_5DF3:
        JSR     R5,     L_5F1B                  ; 5DF3   0004 015C 031B
        JSR     R5,     L_5E79                  ; 5DF6   0004 015C 0279
        DECLE   $0004,  $015C,  $0327           ; 5DF9   0004 015C 0327
L_5DFC:
        JSR     R5,     L_595A                  ; 5DFC   0004 0158 015A

        BC      L_5E0B                          ; 5DFF   0201 000A
        J       L_5E0E                          ; 5E01   0004 035C 020E

L_5E04:
        MVI     G_018A, R3                      ; 5E04   0283 018A
        INCR    R3                              ; 5E06   000B
        MVO     R3,     G_018A                  ; 5E07   0243 018A
        B       L_5DFC                          ; 5E09   0220 000E
L_5E0B:
        J       L_5A8A                          ; 5E0B   0004 0358 028A

L_5E0E:
        JSR     R5,     .EXEC.60A               ; 5E0E   0004 0114 020A

        SDBD                                    ; 5E11   0001
        MVII    #$0171, R3                      ; 5E12   02BB 0071 0001

        JSR     R5,     L_5ADF                  ; 5E15   0004 0158 02DF

        MVO     R0,     G_034A                  ; 5E18   0240 034A
        SDBD                                    ; 5E1A   0001
        MVII    #$017B, R3                      ; 5E1B   02BB 007B 0001

        JSR     R5,     L_5ADF                  ; 5E1E   0004 0158 02DF
        JSR     R5,     L_59A3                  ; 5E21   0004 0158 01A3

        BC      L_5E27                          ; 5E24   0201 0001

        NOP                                     ; 5E26   0034
L_5E27:
        MOVR    R0,     R3                      ; 5E27   0083
        J       L_554F                          ; 5E28   0004 0354 014F

        SUBI    #$0007, R0                      ; 5E2B   0338 0007
        BEQ     L_5E3A                          ; 5E2D   0204 000B

        DECR    R0                              ; 5E2F   0010
        BNEQ    L_5E35                          ; 5E30   020C 0003

        DECR    R0                              ; 5E32   0010
        B       L_5E3A                          ; 5E33   0200 0005

L_5E35:
        DECR    R0                              ; 5E35   0010
        BNEQ    L_5E42                          ; 5E36   020C 000A

        SUBI    #$0002, R0                      ; 5E38   0338 0002
L_5E3A:
        MVO     R0,     G_0335                  ; 5E3A   0240 0335

        JSR     R5,     L_52A4                  ; 5E3C   0004 0150 02A4

        J       L_5485                          ; 5E3F   0004 0354 0085
L_5E42:
        PULR    R7                              ; 5E42   02B7

L_5E43:
        PSHR    R5                              ; 5E43   0275
        MVI     G_0335, R1                      ; 5E44   0281 0335
        TSTR    R1                              ; 5E46   0089
        BPL     L_5E50                          ; 5E47   0203 0007

        MVI     G_0337, R1                      ; 5E49   0281 0337
        TSTR    R1                              ; 5E4B   0089
        BPL     L_5E50                          ; 5E4C   0203 0002

        SETC                                    ; 5E4E   0007
        PULR    R7                              ; 5E4F   02B7

L_5E50:
        CLRC                                    ; 5E50   0006
        PULR    R7                              ; 5E51   02B7

L_5E52:
        PSHR    R5                              ; 5E52   0275
        PSHR    R2                              ; 5E53   0272

        JSR     R5,     L_5E5F                  ; 5E54   0004 015C 025F
        JSR     R5,     L_5949                  ; 5E57   0004 0158 0149
        JSR     R5,     L_5E5F                  ; 5E5A   0004 015C 025F

        PULR    R2                              ; 5E5D   02B2
        PULR    R7                              ; 5E5E   02B7

L_5E5F:
        MVI     G_0337, R0                      ; 5E5F   0280 0337
        COMR    R0                              ; 5E61   0018
        MVO     R0,     G_0337                  ; 5E62   0240 0337
        MOVR    R5,     R7                      ; 5E64   00AF

L_5E65:
        CMPR    R3,     R2                      ; 5E65   015A
        BGT     L_5E6D                          ; 5E66   020E 0005

        CMPR    R4,     R2                      ; 5E68   0162
        BLT     L_5E6D                          ; 5E69   0205 0002

        SETC                                    ; 5E6B   0007
        MOVR    R5,     R7                      ; 5E6C   00AF

L_5E6D:
        CLRC                                    ; 5E6D   0006
        MOVR    R5,     R7                      ; 5E6E   00AF

L_5E6F:
        MVI     G_0336, R1                      ; 5E6F   0281 0336
        CMPI    #$0005, R1                      ; 5E71   0379 0005
        BLT     L_5E77                          ; 5E73   0205 0002

        SETC                                    ; 5E75   0007
        MOVR    R5,     R7                      ; 5E76   00AF

L_5E77:
        CLRC                                    ; 5E77   0006
        MOVR    R5,     R7                      ; 5E78   00AF

L_5E79:
        PSHR    R5                              ; 5E79   0275

        JSR     R5,     L_5EAF                  ; 5E7A   0004 015C 02AF

        MVI     G_0333, R0                      ; 5E7D   0280 0333

        JSR     R5,     X_UNPK_BYTES            ; 5E7F   0004 0114 0357

        PSHR    R0                              ; 5E82   0270
        MOVR    R1,     R0                      ; 5E83   0088

        JSR     R5,     L_5D5D                  ; 5E84   0004 015C 015D

        CLRR    R0                              ; 5E87   01C0

        JSR     R5,     X_PACK_BYTES            ; 5E88   0004 0114 034F

        MVO     R0,     G_0333                  ; 5E8B   0240 0333
        PULR    R0                              ; 5E8D   02B0

        JSR     R5,     L_5D5D                  ; 5E8E   0004 015C 015D
        JSR     R5,     L_5D81                  ; 5E91   0004 015C 0181

        CLRR    R1                              ; 5E94   01C9

        JSR     R5,     L_5D70                  ; 5E95   0004 015C 0170
        JSR     R5,     X_PACK_BYTES            ; 5E98   0004 0114 034F

        MVO     R0,     G_0333                  ; 5E9B   0240 0333

        JSR     R5,     L_5D70                  ; 5E9D   0004 015C 0170

        PSHR    R0                              ; 5EA0   0270

        JSR     R5,     L_54F4                  ; 5EA1   0004 0154 00F4

        PULR    R0                              ; 5EA4   02B0
        BC      L_5EAA                          ; 5EA5   0201 0003

        JSR     R5,     L_5D81                  ; 5EA7   0004 015C 0181

L_5EAA:
        MVI     G_0346, R0                      ; 5EAA   0280 0346
        MVO     R0,     G_0333                  ; 5EAC   0240 0333
        PULR    R7                              ; 5EAE   02B7

L_5EAF:
        SDBD                                    ; 5EAF   0001
        MVII    #$FC18, R3                      ; 5EB0   02BB 0018 00FC
        MVO     R3,     G_0357                  ; 5EB3   0243 0357
        CLRR    R3                              ; 5EB5   01DB
        MVO     R3,     G_0180                  ; 5EB6   0243 0180
        MVO     R3,     G_018A                  ; 5EB8   0243 018A
        MOVR    R5,     R7                      ; 5EBA   00AF

L_5EBB:
        MVI     G_0335, R0                      ; 5EBB   0280 0335
        INCR    R0                              ; 5EBD   0008
        BEQ     L_5EC2                          ; 5EBE   0204 0002

        CLRC                                    ; 5EC0   0006
        MOVR    R5,     R7                      ; 5EC1   00AF

L_5EC2:
        COMR    R0                              ; 5EC2   0018
        SETC                                    ; 5EC3   0007
        MOVR    R5,     R7                      ; 5EC4   00AF

L_5EC5:
        PSHR    R5                              ; 5EC5   0275
        PSHR    R0                              ; 5EC6   0270
        MVI     G_0352, R1                      ; 5EC7   0281 0352
        TSTR    R1                              ; 5EC9   0089
        BNEQ    L_5EE7                          ; 5ECA   020C 001B

        PSHR    R2                              ; 5ECC   0272

        JSR     R5,     L_5949                  ; 5ECD   0004 0158 0149

        PULR    R2                              ; 5ED0   02B2
        BC      L_5EE7                          ; 5ED1   0201 0014

        JSR     R5,     L_5D30                  ; 5ED3   0004 015C 0130

        BNC     L_5EE7                          ; 5ED6   0209 000F

        PULR    R0                              ; 5ED8   02B0
        MVII    #$0001, R3                      ; 5ED9   02BB 0001
        MVII    #$0006, R4                      ; 5EDB   02BC 0006
        NEGR    R3                              ; 5EDD   0023
        NEGR    R4                              ; 5EDE   0024

        JSR     R5,     L_5E65                  ; 5EDF   0004 015C 0265

        BNC     L_5EE5                          ; 5EE2   0209 0001

        CLRR    R0                              ; 5EE4   01C0
L_5EE5:
        SETC                                    ; 5EE5   0007
        PULR    R7                              ; 5EE6   02B7

L_5EE7:
        PULR    R0                              ; 5EE7   02B0
        CLRR    R1                              ; 5EE8   01C9
        COMR    R1                              ; 5EE9   0019
        MVO     R1,     G_0352                  ; 5EEA   0241 0352
        CLRC                                    ; 5EEC   0006
        PULR    R7                              ; 5EED   02B7

L_5EEE:
        PSHR    R5                              ; 5EEE   0275
        MVII    #$0006, R3                      ; 5EEF   02BB 0006
        MVII    #$0001, R4                      ; 5EF1   02BC 0001

        JSR     R5,     L_5E65                  ; 5EF3   0004 015C 0265

        BNC     L_5F0D                          ; 5EF6   0209 0015

        PSHR    R0                              ; 5EF8   0270

        JSR     R5,     L_5EC5                  ; 5EF9   0004 015C 02C5

        PULR    R0                              ; 5EFC   02B0
        BNC     L_5F02                          ; 5EFD   0209 0003

        SLL     R0,     1                       ; 5EFF   0048
        B       L_5F09                          ; 5F00   0200 0007

L_5F02:
        PSHR    R0                              ; 5F02   0270

        JSR     R5,     L_5F0E                  ; 5F03   0004 015C 030E

        PULR    R0                              ; 5F06   02B0
        BNC     L_5F0D                          ; 5F07   0209 0004

L_5F09:
        JSR     R5,     L_5D21                  ; 5F09   0004 015C 0121

        SETC                                    ; 5F0C   0007
L_5F0D:
        PULR    R7                              ; 5F0D   02B7

L_5F0E:
        MVI     G_034D, R0                      ; 5F0E   0280 034D
        MVI     G_034E, R1                      ; 5F10   0281 034E
        SUBR    R1,     R0                      ; 5F12   0108
        CMPI    #$0005, R0                      ; 5F13   0378 0005
        BGE     L_5F19                          ; 5F15   020D 0002

        CLRC                                    ; 5F17   0006
        MOVR    R5,     R7                      ; 5F18   00AF

L_5F19:
        SETC                                    ; 5F19   0007
        MOVR    R5,     R7                      ; 5F1A   00AF

L_5F1B:
        PSHR    R5                              ; 5F1B   0275

        JSR     R5,     X_PLAY_SFX1             ; 5F1C   0004 0118 03BB
        DECLE   $001D                           ; 5F1F  SFX data
        DECLE   $03E9                           ; 5F20  SFX data
        DECLE   $0040,  $00C0                   ; 5F21  SFX data
        DECLE   $03DB                           ; 5F23  SFX data
        DECLE   $000B                           ; 5F24  SFX data
        DECLE   $0083,  $03E8                   ; 5F25  SFX data
        DECLE   $0275                           ; 5F27  SFX data
        DECLE   $0004,  $0118                   ; 5F28  SFX data
        DECLE   $03BB                           ; 5F2A  SFX data
        DECLE   $03CF                           ; 5F2B  SFX end

L_5F2C:
        PSHR    R5                              ; 5F2C   0275

        JSR     R5,     X_PLAY_MUS2             ; 5F2D   0004 0118 035D
        DECLE   $00CA                           ; 5F30  Note (short)
        DECLE   $011A                           ; 5F31  Note (short)
        DECLE   $013A                           ; 5F32  Note (short)
        DECLE   $015A                           ; 5F33  Note (short)
        DECLE   $013A                           ; 5F34  Note (short)
        DECLE   $011A                           ; 5F35  Note (short)
        DECLE   $013A                           ; 5F36  Note (short)
        DECLE   $015D                           ; 5F37  Note (short)
        DECLE   $011D                           ; 5F38  Note (short)
        DECLE   $03F4,  $011E                   ; 5F39  Note (long)
        DECLE   $0000                           ; 5F3B  End of music

        JSR     R5,     X_PLAY_SFX1             ; 5F3C   0004 0118 03BB
        DECLE   $0079                           ; 5F3F  SFX data
        DECLE   $03B7                           ; 5F40  SFX data
        DECLE   $03ED                           ; 5F41  SFX data
        DECLE   $010C,  $0000                   ; 5F42  SFX data
        DECLE   $000B                           ; 5F44  SFX data
        DECLE   $03CF                           ; 5F45  SFX end

L_5F46:
        PSHR    R5                              ; 5F46   0275

        JSR     R5,     X_PLAY_MUS2             ; 5F47   0004 0118 035D
        DECLE   $03F4,  $005C                   ; 5F4A  Note (long)
        DECLE   $03F4,  $002C                   ; 5F4C  Note (long)
        DECLE   $03F2,  $007E                   ; 5F4E  Note (long)
        DECLE   $03F6,  $0020                   ; 5F50  Note (long)
        DECLE   $0000                           ; 5F52  End of music

        PULR    R7                              ; 5F53   02B7

.GFX_LIST_5F54:
        DECLE   $0000,  $0000,  $003F,  $003F   ; 5F54  CART PIC #00
        DECLE   $003F,  $003F,  $003F,  $003E   ; 5F58  
        DECLE   $0000,  $0000,  $003F,  $003F   ; 5F5C  CART PIC #01
        DECLE   $0033,  $0033,  $003F,  $003E   ; 5F60  
        DECLE   $0000,  $0000,  $003F,  $003F   ; 5F64  CART PIC #02
        DECLE   $0032,  $0032,  $003F,  $003F   ; 5F68  
        DECLE   $003C,  $007E,  $00FF,  $00FF   ; 5F6C  CART PIC #03
        DECLE   $00FF,  $007E,  $003C,  $0000   ; 5F70  
        DECLE   $003C,  $007E,  $00FF,  $00C3   ; 5F74  CART PIC #04
        DECLE   $00FF,  $007E,  $003C,  $0000   ; 5F78  
        DECLE   $003C,  $007E,  $00C3,  $00FF   ; 5F7C  CART PIC #05
        DECLE   $00C3,  $007E,  $003C,  $0000   ; 5F80  
        DECLE   $007E,  $007E,  $007E,  $007E   ; 5F84  CART PIC #06
        DECLE   $003C,  $003C,  $003C,  $003C   ; 5F88  
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5F8C  CART PIC #07
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F90  

        ADDR    R5,     R2                      ; 5F94   00EA
        ADCR    R0                              ; 5F95   0028
        ADDR    R7,     R2                      ; 5F96   00FA
        INCR    R6                              ; 5F97   000E
        RSWD    R2                              ; 5F98   003A
        INCR    R6                              ; 5F99   000E
        ADDR    R6,     R2                      ; 5F9A   00F2
        INCR    R6                              ; 5F9B   000E
        EIS                                     ; 5F9C   0002
        INCR    R7                              ; 5F9D   000F

        SWAP    R2,     1                       ; 5F9E   0042
L_5F9F:
        INCR    R6                              ; 5F9F   000E
        DECLE   $00B0,  $000E,  $0000           ; 5FA0   00B0 000E 0000

        INCR    R7                              ; 5FA3   000F

        ADDR    R6,     R0                      ; 5FA4   00F0
L_5FA5:
        INCR    R6                              ; 5FA5   000E
        DECLE   $00A8,  $000E,  $00F8,  $000E   ; 5FA6   00A8 000E 00F8 000E
        DECLE   $00EC,  $0008,  $00E8,  $0028   ; 5FAA   00EC 0008 00E8 0028
        DECLE   $00F8,  $000E,  $0038,  $000E   ; 5FAE   00F8 000E 0038 000E
        DECLE   $00F0,  $000E,  $0000           ; 5FB2   00F0 000E 0000

        INCR    R7                              ; 5FB5   000F

        SWAP    R0,     1                       ; 5FB6   0040
L_5FB7:
        INCR    R6                              ; 5FB7   000E
        MOVR    R6,     R2                      ; 5FB8   00B2
        INCR    R6                              ; 5FB9   000E
        EIS                                     ; 5FBA   0002
        INCR    R7                              ; 5FBB   000F

        ADDR    R6,     R2                      ; 5FBC   00F2
L_5FBD:
        INCR    R6                              ; 5FBD   000E
        MOVR    R5,     R2                      ; 5FBE   00AA
        INCR    R6                              ; 5FBF   000E
        ADDR    R7,     R2                      ; 5FC0   00FA
        INCR    R6                              ; 5FC1   000E
        ADDR    R5,     R4                      ; 5FC2   00EC
        INCR    R4                              ; 5FC3   000C
        INCR    R0                              ; 5FC4   0008
        COMR    R1                              ; 5FC5   0019
        INCR    R0                              ; 5FC6   0008
        COMR    R1                              ; 5FC7   0019
        INCR    R0                              ; 5FC8   0008
        COMR    R1                              ; 5FC9   0019
        INCR    R0                              ; 5FCA   0008
        COMR    R1                              ; 5FCB   0019
        INCR    R0                              ; 5FCC   0008
        COMR    R1                              ; 5FCD   0019
        INCR    R0                              ; 5FCE   0008
        COMR    R1                              ; 5FCF   0019
        INCR    R0                              ; 5FD0   0008
        COMR    R1                              ; 5FD1   0019
        INCR    R0                              ; 5FD2   0008
        COMR    R1                              ; 5FD3   0019
        INCR    R0                              ; 5FD4   0008
        COMR    R1                              ; 5FD5   0019
        INCR    R0                              ; 5FD6   0008
        COMR    R1                              ; 5FD7   0019
        INCR    R0                              ; 5FD8   0008
        COMR    R1                              ; 5FD9   0019
        INCR    R0                              ; 5FDA   0008
        COMR    R1                              ; 5FDB   0019
        INCR    R0                              ; 5FDC   0008
        ADCR    R1                              ; 5FDD   0029
        INCR    R0                              ; 5FDE   0008
        ADCR    R1                              ; 5FDF   0029
        INCR    R0                              ; 5FE0   0008
        ADCR    R1                              ; 5FE1   0029
        INCR    R0                              ; 5FE2   0008
        ADCR    R1                              ; 5FE3   0029
        INCR    R0                              ; 5FE4   0008
        ADCR    R1                              ; 5FE5   0029
        INCR    R0                              ; 5FE6   0008
        ADCR    R1                              ; 5FE7   0029
        INCR    R0                              ; 5FE8   0008
        ADCR    R1                              ; 5FE9   0029
        INCR    R0                              ; 5FEA   0008
        ADCR    R1                              ; 5FEB   0029
        INCR    R0                              ; 5FEC   0008
        ADCR    R1                              ; 5FED   0029
        INCR    R0                              ; 5FEE   0008
        ADCR    R1                              ; 5FEF   0029
        INCR    R0                              ; 5FF0   0008
        ADCR    R1                              ; 5FF1   0029
        INCR    R0                              ; 5FF2   0008
        ADCR    R1                              ; 5FF3   0029
        RSWD    R4                              ; 5FF4   003C
        SARC    R2,     2                       ; 5FF5   007E
        ADDR    R0,     R3                      ; 5FF6   00C3
        ADDR    R0,     R3                      ; 5FF7   00C3
        ADDR    R0,     R3                      ; 5FF8   00C3
        SARC    R2,     2                       ; 5FF9   007E
        RSWD    R4                              ; 5FFA   003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFB   0000 0000 0000 0000
        DECLE   $0000                           ; 5FFF   0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5033       <entry>
;;  $504F       $5045  
;;  $506F       $5AD8  
;;  $5088       $5048   $5485  
;;  $5111       $510B   $510F  
;;  $5121       $511B  
;;  $5122       $557C   $5A87  
;;  $5127       $5113   $5116   $511F  
;;  $513A       $512B  
;;  $5141       $5138  
;;  $5142       $5136  
;;  $5148       $5128   $550E  
;;  $5152       $514A   $514E  
;;  $5154       $5269   $53E3   $53EA   $53FF   $540B   $5862   $592A  
;;  $5157       $515C  
;;  $515E       $5158  
;;  $5160       $51E2  
;;  $5167       $516D  
;;  $5172       $5200   $5213   $5270   $527A  
;;  $517A       $5063   $506C   $57FB  
;;  $517D       $5178  
;;  $517F       $518A  
;;  $518C       $517F  
;;  $518F       $51DD   $5245  
;;  $519D       $5194  
;;  $51A3       $5192  
;;  $51B4       $51AE  
;;  $51B6       $51A5  
;;  $51C3       $51BD  
;;  $51C5       $5224   $528E  
;;  $51CC       $52AC   $55B5   $55E2   $5603   $5608  
;;  $51D1       $51CE  
;;  $51EA       $51E6  
;;  $51EF       $51EC  
;;  $51FC       $51F7  
;;  $5205       $51F1  
;;  $520E       $520A  
;;  $5224       $521E  
;;  $5229       $523D  
;;  $522E       $522A  
;;  $5233       $51E8   $5203   $522C  
;;  $5238       $5230  
;;  $523F       $5234  
;;  $5252       $524F  
;;  $525B       $5256  
;;  $5275       $525D  
;;  $528A       $5283  
;;  $5293       $52A2  
;;  $5297       $5294  
;;  $529D       $5299  
;;  $52A4       $504B   $5488   $5A64   $5E3C  
;;  $52A6       $52B0  
;;  $52B2       $52A9  
;;  $52B9       $52B5   $54C8   $560F   $5700  
;;  $52C2       $52BF  
;;  $52DB       $52C6  
;;  $52E3       $52DF  
;;  $52F8       $52E5   $52EA   $52EF   $52F4   $53A6  
;;  $5301       $52FC  
;;  $5307       $52FF  
;;  $531F       $530B  
;;  $5334       $5320  
;;  $5349       $5335  
;;  $535E       $534A  
;;  $5373       $535F  
;;  $5383       $531D   $5332   $5347   $535C   $5371  
;;  $5395       $52D7   $57E3  
;;  $539A       $52D2   $57B6  
;;  $539C       $5398  
;;  $53A6       $53A3  
;;  $53AA       $5441  
;;  $53B2       $5448  
;;  $53B7       $53B0  
;;  $53C3       $53BD  
;;  $53D2       $53CA  
;;  $53D6       $53AB   $53B3  
;;  $53D9       $512D   $5431   $5C52  
;;  $53F5       $5415  
;;  $5418       $53FC   $5408  
;;  $541F       $541A  
;;  $5420       $5402   $540F  
;;  $542D       $5426  
;;  $5457       <entry>
;;  $5468       $545E  
;;  $5477       $5084  
;;  $5485       $54AC   $5E3F  
;;  $5492       $549A   $549F  
;;  $54B2       $54AE  
;;  $54D3       $54CE  
;;  $54E5       $54D3   $5729  
;;  $54F4       $5560   $5724   $5EA1  
;;  $5504       $54FB   $5500  
;;  $5506       $54E6   $5567  
;;  $550A       $54EC   $5572  
;;  $551A       $5511  
;;  $5528       $5525  
;;  $552C       $5529  
;;  $5542       $552F   $5538   $553E   $5546  
;;  $5543       $551B  
;;  $554F       $5E28  
;;  $555A       $5555  
;;  $557C       $554D   $5558  
;;  $557F       $555E   $5563  
;;  $5581       $5578  
;;  $55F4       $55EC  
;;  $55F9       $55F2  
;;  $55FE       $55F7  
;;  $561F       $5615  
;;  $5631       $5622  
;;  $5638       $5B18   $5BD2  
;;  $5643       $563F  
;;  $5645       $563C  
;;  $564A       $5646  
;;  $564C       $5B43   $5BB8  
;;  $5661       $5659  
;;  $5664       $5655  
;;  $566F       $5668  
;;  $5672       $5652  
;;  $567F       $5677  
;;  $5682       $5673  
;;  $568D       $5686  
;;  $568E       $5662   $5670   $5680  
;;  $5690       $5552  
;;  $56A1       $5699  
;;  $56A3       $569C  
;;  $56AA       $569F  
;;  $56AF       $56A5   $56A8   $56AC  
;;  $56B6       $566B   $5689  
;;  $56BB       $5B8F  
;;  $56C0       $565D   $567B  
;;  $56C5       $5B8A  
;;  $56CA       $56B9   $56BE   $56C3   $56C8  
;;  $56DD       $5AAE  
;;  $56E0       $56E8   $56ED  
;;  $56FB       $56F7  
;;  $5715       $570B  
;;  $571C       $5706  
;;  $5724       $571F  
;;  $572C       $5727  
;;  $5739       $5743   $5748  
;;  $5742       $548F   $56DD  
;;  $575C       $576F   $5780  
;;  $5764       $57C5  
;;  $5767       $576D  
;;  $577F       $5799  
;;  $5790       <entry>
;;  $5799       $5794  
;;  $57AB       $57A2  
;;  $57B6       $57B3  
;;  $57BB       <entry>
;;  $57C5       $57BF  
;;  $57D7       $57CE  
;;  $57E3       $57E0  
;;  $57E6       $57B9  
;;  $57EA       $52B2   $54C5   $5A98  
;;  $57F4       $57ED  
;;  $57F5       $57F2  
;;  $57FF       $543A   $546E  
;;  $580C       $5806  
;;  $580E       $5810  
;;  $5813       $55F4   $5AA6  
;;  $5814       $54E2   $5833   $5A67  
;;  $581A       $5817  
;;  $5826       $5821  
;;  $582D       $5824   $582A  
;;  $5840       $558D   $55C4   $55FB   $5835   $58F7  
;;  $584A       $5847  
;;  $5854       $584C  
;;  $585D       $5856  
;;  $5871       $5852   $585B   $586B  
;;  $5874       $5830   $5A17   $5DBA  
;;  $587B       $5878  
;;  $588A       $5887  
;;  $5890       $588B  
;;  $5893       $588E  
;;  $5896       $581C   $59A4   $5A0B   $5B31   $5C8D  
;;  $58A5       $589D  
;;  $58A6       $58A3  
;;  $58BC       $58AE   $58B1   $58B4  
;;  $58C3       $58BF  
;;  $58C5       $58AA  
;;  $58D2       $58C6   $58C9   $58CC  
;;  $58DB       $58BA   $58C3   $58D0   $58D7  
;;  $58E0       $58DD  
;;  $58E7       $5590   $55FE   $5838  
;;  $58F5       $58F2  
;;  $58FA       $58EB  
;;  $5906       $5841  
;;  $591A       $5914  
;;  $591E       $591B  
;;  $5927       $5920  
;;  $592A       $5925  
;;  $5934       $5AA1  
;;  $593B       $5945  
;;  $5948       $5938   $5941  
;;  $5949       $58E8   $5935   $5988   $5D8A   $5E57   $5ECD  
;;  $5955       $5952  
;;  $595A       $561F   $5703   $5DFC  
;;  $5975       $596E  
;;  $5977       $5958   $595E   $5963   $597F   $59C5  
;;  $5979       $5956   $59C2  
;;  $597B       $593D   $596B   $5971   $5B67   $5D85  
;;  $5981       $597D  
;;  $5995       $598B  
;;  $599B       $5993  
;;  $599E       $5991   $5999  
;;  $599F       $599C  
;;  $59A3       $5549   $598E   $5A1E   $5DC5   $5E21  
;;  $59B7       $59B4  
;;  $59BD       $59BA  
;;  $59C1       $59EF   $5A05  
;;  $59C4       $59BF   $5A00   $5A03  
;;  $59C7       $59AD  
;;  $59D1       $59CD  
;;  $59D6       $59EB  
;;  $59DF       $59DB  
;;  $59E7       $59E0   $59E2  
;;  $59F9       $59F6  
;;  $5A07       $5996   $5DD0  
;;  $5A09       $5A1A   $5A21  
;;  $5A26       $5A12  
;;  $5A27       $5A24  
;;  $5A29       $54C2   $56FD  
;;  $5A3C       $5A78  
;;  $5A5E       $5A5B  
;;  $5A6A       $5A34   $5A47  
;;  $5A6C       $5A6F  
;;  $5A72       $5543   $5A7D  
;;  $5A7C       $5A76  
;;  $5A83       $5A80  
;;  $5A8A       $5712   $5A85   $5E0B  
;;  $5A93       $5A8D   $5AA4  
;;  $5AB1       $5814   $595B   $5A8A  
;;  $5AC1       $5ABA   $5ABD  
;;  $5AC3       $5144   $5A8F  
;;  $5AD5       $5AC9   $5ACE  
;;  $5AD8       $5AD3  
;;  $5ADB       $5B26   $5B2E   $5B3B   $5B52   $5C0B   $5C19   $5C27   $5C64  
;;  $5ADB       $5C81   $5D2C  
;;  $5ADF       $5B0E   $5B7F   $5B96   $5BAE   $5BC8   $5BDC   $5BF2   $5C04  
;;  $5ADF       $5C12   $5C20   $5DB5   $5E15   $5E1E  
;;  $5AE7       $551D   $55A2   $5907   $5B13   $5B3E   $5B9B   $5BB3   $5BCD  
;;  $5AE7       $5C97  
;;  $5AF0       $5B05   $5BE6   $5D23  
;;  $5AF8       $55AC   $55BA   $5B1B   $5B4A   $5BA7   $5BBB  
;;  $5B03       $5594   $5C32  
;;  $5B4A       $5B47  
;;  $5B66       $5B63  
;;  $5B72       $5B5B   $5B6B  
;;  $5B77       $5C3F  
;;  $5B8F       $5B88  
;;  $5B92       $5B8D  
;;  $5BA6       $5BA1  
;;  $5BA7       $5BA4   $5BD5  
;;  $5BC4       $5B83  
;;  $5BD7       $5C42  
;;  $5BEE       $5BE2  
;;  $5C2A       $5BE4   $5BEC  
;;  $5C2B       $556B  
;;  $5C31       $5D9F   $5DE6  
;;  $5C32       $5C2F  
;;  $5C3C       $5C35  
;;  $5C3F       $5C3A   $5C6C   $5D1E  
;;  $5C46       $5B78  
;;  $5C4B       $5B6D   $5B72  
;;  $5C4D       $5C49  
;;  $5C52       $5C3C  
;;  $5C5C       $5C5E  
;;  $5C6F       $5C6A  
;;  $5C8B       $5D0E  
;;  $5C9E       $5C9B  
;;  $5CA8       $5CA1  
;;  $5CD2       $5CC3   $5CCE  
;;  $5CE1       $5CB3  
;;  $5D06       $5CB0   $5CDC   $5CDF   $5CE9   $5CF0   $5CFB   $5D02  
;;  $5D09       $5C9F   $5CA6   $5CAB   $5CB8   $5CD5   $5CE4  
;;  $5D1B       $5D13  
;;  $5D21       $5D06   $5D18   $5F09  
;;  $5D30       $5CBA   $5CD7   $5CE1   $5ED3  
;;  $5D38       $5D34  
;;  $5D3A       $5CA3  
;;  $5D51       $5D47   $5D4A  
;;  $5D52       $5AE8   $5AFD  
;;  $5D58       $5D55  
;;  $5D5D       $5C91   $5D82   $5DA4   $5DC2   $5DCD   $5DDD   $5DE2   $5E84  
;;  $5D5D       $5E8E  
;;  $5D70       $5D09   $5D9C   $5DBF   $5DCA   $5DD5   $5DD9   $5DE9   $5DEE  
;;  $5D70       $5E95   $5E9D  
;;  $5D81       $5E91   $5EA7  
;;  $5D9A       $5D97  
;;  $5DA3       $5C37  
;;  $5DB1       $5DAB  
;;  $5DCA       $5D90   $5DAF   $5DBD  
;;  $5DCD       $5DF1  
;;  $5DD5       $5D88  
;;  $5DD9       $5DC8   $5DD3  
;;  $5DF3       $54D0   $5721  
;;  $5DFC       $5E09  
;;  $5E04       $561C  
;;  $5E0B       $5DFF  
;;  $5E0E       $5E01  
;;  $5E27       $5E24  
;;  $5E35       $5E30  
;;  $5E3A       $5E2D   $5E33  
;;  $5E42       $5E36  
;;  $5E43       $54CB   $555B   $5612   $5708   $571C   $5AC6   $5C67   $5DA8  
;;  $5E50       $5E47   $5E4C  
;;  $5E52       $5CC5   $5CEB  
;;  $5E5F       $5E54   $5E5A  
;;  $5E65       $5CD2   $5CF8   $5D44   $5EDF   $5EF3  
;;  $5E6D       $5E66   $5E69  
;;  $5E6F       $5CFF  
;;  $5E77       $5E73  
;;  $5E79       $54E9   $5DF6  
;;  $5EAA       $5EA5  
;;  $5EAF       $5C2C   $5E7A  
;;  $5EBB       $5CB5   $5CE6  
;;  $5EC2       $5EBE  
;;  $5EC5       $5CAD   $5EF9  
;;  $5EE5       $5EE2  
;;  $5EE7       $5ECA   $5ED1   $5ED6  
;;  $5EEE       $5CA8  
;;  $5F02       $5EFD  
;;  $5F09       $5F00  
;;  $5F0D       $5EF6   $5F07  
;;  $5F0E       $5C78   $5D15   $5F03  
;;  $5F19       $5F15  
;;  $5F1B       $5DF3  
;;  $5F2C       $5AD0  
;;  $5F46       $5AD5  
;;  $5F9F       $5F9D  
;;  $5FA5       $5FA3  
;;  $5FB7       $5FB5  
;;  $5FBD       $5FBB  
;; ======================================================================== ;;
