
        ORG     $5000
.HEADER:
        BIDECLE $501C           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $5023           ; 5004  Ptr: Start of game
        BIDECLE $500C           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $501E           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5021           ; 500A  Ptr: Date/Title
.GFX_LIST_500C:
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5014  CART PIC #01
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5018  
.TIMER:
        BIDECLE $0000           ; 501C  End of timer table

.GRAM_INIT_501E:
        DECLE   $0001           ; 501E  # of GRAM cards to init
        DECLE   $0001,  $0300   ; 501F  #00-06:  CART #00-06 ----
.TITLE:
        DECLE   $0052                           ; 5021  Cartridge year
        DECLE   $0000                           ; 5022  

.TITLECODE:
        DIS                                     ; 5023   0003
        DECLE   $02B8,  $005A,  $0240,  $0100   ; 5024  CART PIC #03
        DECLE   $02B8,  $0057,  $0240,  $0101   ; 5028  
        DECLE   $02BE,  $02F0,  $01ED,  $02BC   ; 502C  CART PIC #04
        DECLE   $0102,  $0265,  $037C,  $0360   ; 5030  
        DECLE   $0226,  $0004,  $02B8,  $03FF   ; 5034  CART PIC #05
        DECLE   $0240,  $034F,  $0240,  $0350   ; 5038  
        DECLE   $0040,  $0240,  $012E,  $0240   ; 503C  CART PIC #06
        DECLE   $012F,  $0004,  $0158,  $01D9   ; 5040  

        MVII    #$0261, R4                      ; 5044   02BC 0261
        MVII    #$02A1, R1                      ; 5046   02B9 02A1
        MVO@    R1,     R4                      ; 5048   0261
        MVII    #$0269, R1                      ; 5049   02B9 0269
        MVO@    R1,     R4                      ; 504B   0261
        MOVR    R7,     R5                      ; 504C   00BD
        ADDI    #$007A, R5                      ; 504D   02FD 007A
        MVII    #$0269, R4                      ; 504F   02BC 0269
L_5051:
        MVI@    R5,     R1                      ; 5051   02A9
        MVO@    R1,     R4                      ; 5052   0261
        TSTR    R1                              ; 5053   0089
        BNEQ    L_5051                          ; 5054   022C 0004

        MVII    #$0102, R3                      ; 5056   02BB 0102
        MVII    #$00FE, R2                      ; 5058   02BA 00FE
        MVO@    R2,     R3                      ; 505A   025A
L_505B:
        EIS                                     ; 505B   0002
        CMP@    R3,     R2                      ; 505C   035A
        BEQ     L_505B                          ; 505D   0224 0003

        MVII    #$01FE, R1                      ; 505F   02B9 01FE
        INCR    R2                              ; 5061   000A
L_5062:
        MVO@    R2,     R3                      ; 5062   025A
        XORI    #$0001, R1                      ; 5063   03F9 0001
        MVI@    R1,     R5                      ; 5065   028D
        CMPI    #$007E, R5                      ; 5066   037D 007E
        BEQ     L_5074                          ; 5068   0204 000A

        CMPI    #$00BE, R5                      ; 506A   037D 00BE
        BNEQ    L_5062                          ; 506C   022C 000B

        MVII    #$01FF, R1                      ; 506E   02B9 01FF
        MVII    #$0001, R0                      ; 5070   02B8 0001
        MVO     R0,     G_013F                  ; 5072   0240 013F
L_5074:
        MVO     R1,     G_0348                  ; 5074   0241 0348

        JSR     R5,     L_59D9                  ; 5076   0004 0158 01D9

L_5079:
        MVI     G_0348, R1                      ; 5079   0281 0348
        MVI@    R1,     R2                      ; 507B   028A
        MVO     R2,     G_0131                  ; 507C   0242 0131
        MVI     G_0132, R2                      ; 507E   0282 0132
        SUBI    #$005A, R2                      ; 5080   033A 005A
        BNEQ    L_5091                          ; 5082   020C 000D

        MVO     R2,     G_0102                  ; 5084   0242 0102
        MVI     G_0358, R0                      ; 5086   0280 0358
        CMPI    #$0028, R0                      ; 5088   0378 0028
        BNC     L_50B0                          ; 508A   0209 0024

        JSR     R5,     L_5473                  ; 508C   0004 0154 0073

        B       L_50B0                          ; 508F   0200 001F

L_5091:
        JSR     R5,     L_523B                  ; 5091   0004 0150 023B

        MVI     G_0103, R0                      ; 5094   0280 0103
        SARC    R0,     1                       ; 5096   0078
        BNC     L_509F                          ; 5097   0209 0006

        JSR     R5,     L_5562                  ; 5099   0004 0154 0162
        JSR     R5,     L_5BFE                  ; 509C   0004 0158 03FE
L_509F:
        JSR     R5,     L_5473                  ; 509F   0004 0154 0073
        JSR     R5,     L_5A6C                  ; 50A2   0004 0158 026C
        JSR     R5,     L_5961                  ; 50A5   0004 0158 0161
        JSR     R5,     L_50D4                  ; 50A8   0004 0150 00D4

        MVI     G_0104, R1                      ; 50AB   0281 0104
        INCR    R1                              ; 50AD   0009
        MVO     R1,     G_0104                  ; 50AE   0241 0104
L_50B0:
        MVI     G_0358, R2                      ; 50B0   0282 0358
        INCR    R2                              ; 50B2   000A
        MVO     R2,     G_0358                  ; 50B3   0242 0358
        SLR     R2,     1                       ; 50B5   0062
        CMPR    R7,     R2                      ; 50B6   017A
        BNC     L_50BD                          ; 50B7   0209 0004

        MVII    #$005A, R1                      ; 50B9   02B9 005A
        MVO     R1,     G_0132                  ; 50BB   0241 0132

L_50BD:
        JSR     R5,     L_59C8                  ; 50BD   0004 0158 01C8
        DECLE   $0001                           ; 50C0   0001

        CMP     G_0102, R3                      ; 50C1   0343 0102
        BNEQ    L_5079                          ; 50C3   022C 004B
        B       L_50BD                          ; 50C5   0220 0009

        DECLE   $01B9,  $0179,  $0191,  $0169   ; 50C7   01B9 0179 0191 0169
        DECLE   $0001,  $01B9,  $0141,  $0179   ; 50CB   0001 01B9 0141 0179
        DECLE   $0169,  $0181,  $0129,  $0191   ; 50CF   0169 0181 0129 0191
        DECLE   $0000                           ; 50D3   0000
L_50D4:
        PSHR    R5                              ; 50D4   0275
        CLRR    R3                              ; 50D5   01DB
        MVI     G_0104, R1                      ; 50D6   0281 0104
        MVI     G_0103, R2                      ; 50D8   0282 0103
        INCR    R2                              ; 50DA   000A
        ADDR    R7,     R2                      ; 50DB   00FA
        ADD@    R2,     R7                      ; 50DC   02D7

        DECLE   $0123,  $0044,  $0092,  $0004   ; 50DD   0123 0044 0092 0004

        TSTR    R1                              ; 50E1   0089
        BNEQ    L_5222                          ; 50E2   020C 013E

        CMP     G_034F, R3                      ; 50E4   0343 034F
        BNEQ    L_50EF                          ; 50E6   020C 0007

        MVII    #$034F, R4                      ; 50E8   02BC 034F
        ADD     G_013F, R4                      ; 50EA   02C4 013F
        CMP@    R4,     R3                      ; 50EC   0363
        BEQ     L_50F5                          ; 50ED   0204 0006

L_50EF:
        MVO     R3,     G_0103                  ; 50EF   0243 0103
        MVO     R3,     G_0354                  ; 50F1   0243 0354
        MVO     R3,     .PSG0.chn_c_vol         ; 50F3   0243 01FD
L_50F5:
        CMP     G_034F, R3                      ; 50F5   0343 034F
        BEQ     L_50FD                          ; 50F7   0204 0004

        CMP     G_0350, R3                      ; 50F9   0343 0350
        BEQ     L_5222                          ; 50FB   0204 0125

L_50FD:
        ADD     G_013F, R3                      ; 50FD   02C3 013F
        BEQ     L_5222                          ; 50FF   0204 0121

        MOVR    R3,     R1                      ; 5101   0099
        XOR     G_0348, R3                      ; 5102   03C3 0348
        MVO     R3,     G_0348                  ; 5104   0243 0348
        XOR     G_013E, R1                      ; 5106   03C1 013E
        MVO     R1,     G_013E                  ; 5108   0241 013E
        MOVR    R7,     R5                      ; 510A   00BD
        ADDI    #$0010, R5                      ; 510B   02FD 0010
L_510D:
        MVI@    R5,     R3                      ; 510D   02AB
        MOVR    R3,     R2                      ; 510E   009A
        INCR    R2                              ; 510F   000A
        MVI@    R3,     R0                      ; 5110   0298
        MVI@    R2,     R1                      ; 5111   0291
        MVO@    R1,     R3                      ; 5112   0259
        MVO@    R0,     R2                      ; 5113   0250
        CMPI    #$0105, R3                      ; 5114   037B 0105
        BNEQ    L_510D                          ; 5116   022C 000A

        JSR     R5,     L_59DA                  ; 5118   0004 0158 01DA

        CMP@    R1,     R7                      ; 511B   034F
        SUBR    R5,     R6                      ; 511C   012E
        CMP@    R1,     R5                      ; 511D   034D
        CMP@    R1,     R3                      ; 511E   034B
        SUBR    R5,     R4                      ; 511F   012C
        SUBR    R0,     R5                      ; 5120   0105
        CMP     G_034F, R3                      ; 5121   0343 034F
        BNEQ    L_5151                          ; 5123   020C 002C

        MVII    #$0349, R4                      ; 5125   02BC 0349
        MOVR    R4,     R5                      ; 5127   00A5
        MVI@    R4,     R1                      ; 5128   02A1
        ADD@    R4,     R1                      ; 5129   02E1
        CMP     G_012C, R3                      ; 512A   0343 012C
        BNEQ    L_514F                          ; 512C   020C 0021

        MVO     R3,     G_0122                  ; 512E   0243 0122
        MVO     R3,     G_0123                  ; 5130   0243 0123
        MVO     R3,     G_0104                  ; 5132   0243 0104
        MOVR    R7,     R4                      ; 5134   00BC
        ADDI    #$02D9, R4                      ; 5135   02FC 02D9
        MVO     R4,     G_0352                  ; 5137   0244 0352
        MVII    #$007A, R4                      ; 5139   02BC 007A
        MVO     R4,     G_0108                  ; 513B   0244 0108
        MVO     R4,     G_010C                  ; 513D   0244 010C
        MVO     R4,     G_010D                  ; 513F   0244 010D
        MVII    #$00C1, R4                      ; 5141   02BC 00C1
        MVO     R4,     G_0110                  ; 5143   0244 0110
        MVO     R4,     G_0114                  ; 5145   0244 0114
        MVO     R4,     G_0115                  ; 5147   0244 0115
        INCR    R3                              ; 5149   000B
L_514A:
        ADDI    #$0002, R3                      ; 514A   02FB 0002
        MVO     R3,     G_0103                  ; 514C   0243 0103
        PULR    R7                              ; 514E   02B7

L_514F:
        MVO@    R3,     R5                      ; 514F   026B
        MVO@    R1,     R5                      ; 5150   0269

L_5151:
        JSR     R5,     L_522E                  ; 5151   0004 0150 022E

        CMP     G_034A, R0                      ; 5154   0340 034A
        BNEQ    L_5200                          ; 5156   020C 00A8

        MVI     G_0116, R0                      ; 5158   0280 0116
        ADD     G_0117, R0                      ; 515A   02C0 0117
        BNEQ    L_5200                          ; 515C   020C 00A2

        MVO     R3,     G_0104                  ; 515E   0243 0104
        MVO     R3,     G_0130                  ; 5160   0243 0130
        MVI     G_0105, R0                      ; 5162   0280 0105
        ANDI    #$0003, R0                      ; 5164   03B8 0003
        BNEQ    L_516D                          ; 5166   020C 0005

        MVI     G_012C, R0                      ; 5168   0280 012C
        INCR    R0                              ; 516A   0008
        MVO     R0,     G_012C                  ; 516B   0240 012C
L_516D:
        B       L_514A                          ; 516D   0220 0024

        ANDI    #$000F, R1                      ; 516F   03B9 000F
        BNEQ    L_5200                          ; 5171   020C 008D

        ADD     G_0130, R1                      ; 5173   02C1 0130
        BEQ     L_5185                          ; 5175   0204 000E

        ADDI    #$01FF, R1                      ; 5177   02F9 01FF
        MVI@    R1,     R0                      ; 5179   0288
        ADDI    #$0004, R0                      ; 517A   02F8 0004
        MVO@    R0,     R1                      ; 517C   0248
        SUBI    #$0014, R1                      ; 517D   0339 0014
        MVI@    R1,     R0                      ; 517F   0288
        ADDI    #$0003, R0                      ; 5180   02F8 0003
        MVO@    R0,     R1                      ; 5182   0248
        SUBI    #$01EB, R1                      ; 5183   0339 01EB
L_5185:
        INCR    R1                              ; 5185   0009
        CMPI    #$00DC, R1                      ; 5186   0379 00DC
        BGT     L_51B0                          ; 5188   020E 0026

        MOVR    R1,     R2                      ; 518A   008A
        ADDI    #$01FF, R2                      ; 518B   02FA 01FF
        MVI@    R2,     R0                      ; 518D   0290
        SLR     R0,     2                       ; 518E   0064
        CMPI    #$0205, R0                      ; 518F   0378 0205
        BNEQ    L_5185                          ; 5191   022C 000D

        DECR    R0                              ; 5193   0010
        SLL     R0,     2                       ; 5194   004C
        MVO@    R0,     R2                      ; 5195   0250
        SUBI    #$0014, R2                      ; 5196   033A 0014
        MVI@    R2,     R0                      ; 5198   0290
        SUBI    #$0003, R0                      ; 5199   0338 0003
        MVO@    R0,     R2                      ; 519B   0250
        MVO     R1,     G_0130                  ; 519C   0241 0130
        MVI     G_0105, R1                      ; 519E   0281 0105
        CLRR    R2                              ; 51A0   01D2
L_51A1:
        ADDI    #$0032, R2                      ; 51A1   02FA 0032
        DECR    R1                              ; 51A3   0011
        BNEQ    L_51A1                          ; 51A4   022C 0004

        MOVR    R7,     R4                      ; 51A6   00BC
        ADDI    #$02B6, R4                      ; 51A7   02FC 02B6
        MVO     R4,     G_0354                  ; 51A9   0244 0354
        MVO     R3,     G_0138                  ; 51AB   0243 0138

        JSR     R5,     L_59AF                  ; 51AD   0004 0158 01AF

L_51B0:
        MVI     G_013F, R3                      ; 51B0   0283 013F
        SLL     R3,     1                       ; 51B2   004B
        ADD     G_013F, R3                      ; 51B3   02C3 013F
        MVO     R3,     G_0103                  ; 51B5   0243 0103
        CLRR    R0                              ; 51B7   01C0
        MVO     R0,     G_0122                  ; 51B8   0240 0122
        MVO     R0,     G_0123                  ; 51BA   0240 0123
        MVI     G_012E, R0                      ; 51BC   0280 012E
        CMPI    #$00FA, R0                      ; 51BE   0378 00FA
        BGE     L_51C4                          ; 51C0   020D 0002

        ADDI    #$0003, R0                      ; 51C2   02F8 0003
L_51C4:
        MVO     R0,     G_012E                  ; 51C4   0240 012E
        MVI     G_012C, R1                      ; 51C6   0281 012C
        DECR    R1                              ; 51C8   0011
        BMI     L_51FB                          ; 51C9   020B 0030

        MVI     G_0351, R4                      ; 51CB   0284 0351
        ANDI    #$0007, R4                      ; 51CD   03BC 0007
        MOVR    R7,     R5                      ; 51CF   00BD
        ADDI    #$0054, R5                      ; 51D0   02FD 0054
        ADDR    R5,     R4                      ; 51D2   00EC
        MVII    #$000B, R0                      ; 51D3   02B8 000B
L_51D5:
        DECR    R0                              ; 51D5   0010
        BEQ     L_51FB                          ; 51D6   0204 0023

        MVI@    R4,     R3                      ; 51D8   02A3
        TSTR    R3                              ; 51D9   009B
        BNEQ    L_51DF                          ; 51DA   020C 0003

        SUBI    #$000B, R4                      ; 51DC   033C 000B
        MVI@    R4,     R3                      ; 51DE   02A3
L_51DF:
        MVI@    R3,     R2                      ; 51DF   029A
        TSTR    R2                              ; 51E0   0092
        BNEQ    L_51D5                          ; 51E1   022C 000D

        SUBR    R5,     R4                      ; 51E3   012C
        MVII    #$0001, R0                      ; 51E4   02B8 0001
L_51E6:
        SLL     R0,     1                       ; 51E6   0048
        DECR    R4                              ; 51E7   0014
        BPL     L_51E6                          ; 51E8   0223 0003

        SLR     R0,     1                       ; 51EA   0060
        XOR     G_034F, R0                      ; 51EB   03C0 034F
        MVO     R0,     G_034F                  ; 51ED   0240 034F
        MVO     R1,     G_012C                  ; 51EF   0241 012C
        MVO     R3,     G_0359                  ; 51F1   0243 0359
        MOVR    R7,     R4                      ; 51F3   00BC
        ADDI    #$0253, R4                      ; 51F4   02FC 0253
        MVII    #$006D, R1                      ; 51F6   02B9 006D

        JSR     R5,     L_56DD                  ; 51F8   0004 0154 02DD

L_51FB:
        MOVR    R7,     R0                      ; 51FB   00B8
        ADDI    #$0258, R0                      ; 51FC   02F8 0258
        MVO     R0,     G_0354                  ; 51FE   0240 0354
L_5200:
        MVI     G_0110, R1                      ; 5200   0281 0110
        TSTR    R1                              ; 5202   0089
        BNEQ    L_5222                          ; 5203   020C 001D

        MVI     G_0318, R2                      ; 5205   0282 0318
        CMPI    #$005F, R2                      ; 5207   037A 005F
        BNEQ    L_5222                          ; 5209   020C 0017

        MVI     G_0310, R2                      ; 520B   0282 0310
        ANDI    #$00F0, R2                      ; 520D   03BA 00F0
        CMPI    #$0050, R2                      ; 520F   037A 0050
        BNEQ    L_5222                          ; 5211   020C 000F

        MVO     R1,     G_0118                  ; 5213   0241 0118
        MVII    #$0080, R1                      ; 5215   02B9 0080
        MVO     R1,     G_0110                  ; 5217   0241 0110
        MVII    #$0300, R2                      ; 5219   02BA 0300
        MVO     R2,     G_0310                  ; 521B   0242 0310
        MOVR    R7,     R2                      ; 521D   00BA
        ADDI    #$01E2, R2                      ; 521E   02FA 01E2
        MVO     R2,     G_0352                  ; 5220   0242 0352
L_5222:
        PULR    R7                              ; 5222   02B7

        DECLE   $0228,  $0229,  $0250,  $0251   ; 5223   0228 0229 0250 0251
        DECLE   $0278,  $0279,  $02A0,  $02A1   ; 5227   0278 0279 02A0 02A1
        DECLE   $02C8,  $02C9,  $0000           ; 522B   02C8 02C9 0000
L_522E:
        MVI     G_0105, R1                      ; 522E   0281 0105
        MVII    #$000F, R0                      ; 5230   02B8 000F
        CMPR    R1,     R0                      ; 5232   0148
        ADCR    R7                              ; 5233   002F

        MOVR    R0,     R1                      ; 5234   0081
L_5235:
        MOVR    R1,     R2                      ; 5235   008A
        SLL     R1,     1                       ; 5236   0049
        MOVR    R1,     R0                      ; 5237   0088
        SLL     R1,     2                       ; 5238   004D
        ADDR    R1,     R0                      ; 5239   00C8
        MOVR    R5,     R7                      ; 523A   00AF

L_523B:
        PSHR    R5                              ; 523B   0275
        MVII    #$0122, R4                      ; 523C   02BC 0122
        MVII    #$033C, R2                      ; 523E   02BA 033C
L_5240:
        MVI@    R4,     R0                      ; 5240   02A0
        XORI    #$0080, R0                      ; 5241   03F8 0080
        SUBI    #$0080, R0                      ; 5243   0338 0080
        ADD@    R2,     R0                      ; 5245   02D0
        MVII    #$03FF, R3                      ; 5246   02BB 03FF
        CMPR    R3,     R0                      ; 5248   0158
        BNC     L_524F                          ; 5249   0209 0004

        TSTR    R0                              ; 524B   0080
        BMI     L_5254                          ; 524C   020B 0006

        MOVR    R3,     R0                      ; 524E   0098
L_524F:
        SUBI    #$001E, R0                      ; 524F   0338 001E
        BPL     L_525E                          ; 5251   0203 000B

        CLRR    R0                              ; 5253   01C0
L_5254:
        NEGR    R3                              ; 5254   0023
        CMPR    R3,     R0                      ; 5255   0158
        BGT     L_5259                          ; 5256   020E 0001

        MOVR    R3,     R0                      ; 5258   0098
L_5259:
        ADDI    #$001E, R0                      ; 5259   02F8 001E
        BMI     L_525E                          ; 525B   020B 0001

        CLRR    R0                              ; 525D   01C0
L_525E:
        MVO@    R0,     R2                      ; 525E   0250
        INCR    R2                              ; 525F   000A
        MVO@    R0,     R2                      ; 5260   0250
        SUBI    #$0005, R2                      ; 5261   033A 0005
        MVO@    R0,     R2                      ; 5263   0250
        ADDI    #$000C, R2                      ; 5264   02FA 000C
        CMPI    #$0123, R4                      ; 5266   037C 0123
        BEQ     L_5240                          ; 5268   0224 0029

        MVII    #$0310, R1                      ; 526A   02B9 0310
        MVII    #$0338, R5                      ; 526C   02BD 0338
        MVII    #$0328, R3                      ; 526E   02BB 0328
        MOVR    R7,     R4                      ; 5270   00BC
        ADDI    #$0162, R4                      ; 5271   02FC 0162
        MVII    #$01FF, R2                      ; 5273   02BA 01FF
L_5275:
        SLR     R2,     1                       ; 5275   0062
L_5276:
        MVI@    R3,     R0                      ; 5276   0298
        ADD@    R5,     R0                      ; 5277   02E8
        PSHR    R2                              ; 5278   0272
        MVI@    R4,     R2                      ; 5279   02A2
        SWAP    R2,     1                       ; 527A   0042
        CMPR    R0,     R2                      ; 527B   0142
        BC      L_5281                          ; 527C   0201 0003

        INCR    R4                              ; 527E   000C
        B       L_5286                          ; 527F   0200 0005

L_5281:
        MVI@    R4,     R2                      ; 5281   02A2
        SWAP    R2,     1                       ; 5282   0042
        CMPR    R2,     R0                      ; 5283   0150
        BC      L_5297                          ; 5284   0201 0011

L_5286:
        MOVR    R2,     R0                      ; 5286   0090
        SARC    R2,     1                       ; 5287   007A
        CLRR    R2                              ; 5288   01D2
        DECR    R5                              ; 5289   0015
        MVO@    R2,     R5                      ; 528A   026A
        BC      L_5297                          ; 528B   0201 000A

        PSHR    R1                              ; 528D   0271
        ANDI    #$0007, R1                      ; 528E   03B9 0007
        ADDI    #$0310, R1                      ; 5290   02F9 0310
        MVO@    R2,     R1                      ; 5292   024A
        SUBI    #$0200, R1                      ; 5293   0339 0200
        MVO@    R2,     R1                      ; 5295   024A
        PULR    R1                              ; 5296   02B1
L_5297:
        PULR    R2                              ; 5297   02B2
        MVO@    R0,     R3                      ; 5298   0258
        SWAP    R0,     1                       ; 5299   0040
        ANDR    R2,     R0                      ; 529A   0190
        PSHR    R4                              ; 529B   0274
        MVI@    R1,     R4                      ; 529C   028C
        COMR    R2                              ; 529D   001A
        ANDR    R2,     R4                      ; 529E   0194
        COMR    R2                              ; 529F   001A
        ADDR    R0,     R4                      ; 52A0   00C4
        MVO@    R4,     R1                      ; 52A1   024C
        PULR    R4                              ; 52A2   02B4
        INCR    R1                              ; 52A3   0009
        INCR    R3                              ; 52A4   000B
        CMPI    #$0318, R1                      ; 52A5   0379 0318
        BEQ     L_5275                          ; 52A7   0224 0033

        CMPI    #$0320, R1                      ; 52A9   0379 0320
        BLT     L_5276                          ; 52AB   0225 0036

        MVII    #$0120, R1                      ; 52AD   02B9 0120
L_52AF:
        MVI@    R1,     R0                      ; 52AF   0288
        ANDI    #$000F, R0                      ; 52B0   03B8 000F
        MOVR    R1,     R2                      ; 52B2   008A
        SUBI    #$000A, R2                      ; 52B3   033A 000A
        MVI@    R2,     R4                      ; 52B5   0294
        ANDI    #$00C0, R4                      ; 52B6   03BC 00C0
        CMPI    #$0080, R4                      ; 52B8   037C 0080
        BNEQ    L_5320                          ; 52BA   020C 0064

        MVII    #$0110, R3                      ; 52BC   02BB 0110
L_52BE:
        SARC    R0,     1                       ; 52BE   0078
        BC      L_52C6                          ; 52BF   0201 0005
        BEQ     L_5320                          ; 52C1   0204 005D

L_52C3:
        INCR    R3                              ; 52C3   000B
        B       L_52BE                          ; 52C4   0220 0007

L_52C6:
        MVI@    R3,     R5                      ; 52C6   029D
        ANDI    #$00C0, R5                      ; 52C7   03BD 00C0
        CMPR    R4,     R5                      ; 52C9   0165
        BNEQ    L_52C3                          ; 52CA   022C 0008

        MOVR    R3,     R4                      ; 52CC   009C
        ADDI    #$0008, R4                      ; 52CD   02FC 0008
        MVI@    R4,     R5                      ; 52CF   02A5
        MVII    #$00C1, R0                      ; 52D0   02B8 00C1
        MOVR    R7,     R4                      ; 52D2   00BC
        ADDI    #$0162, R4                      ; 52D3   02FC 0162
        CMPI    #$0012, R5                      ; 52D5   037D 0012
        BGT     L_530F                          ; 52D7   020E 0036

        MVO@    R0,     R3                      ; 52D9   0258
        TSTR    R5                              ; 52DA   00AD
        BNEQ    L_52E9                          ; 52DB   020C 000C

        MVII    #$007A, R3                      ; 52DD   02BB 007A
        MVO     R3,     G_0108                  ; 52DF   0243 0108
        SUBI    #$0027, R4                      ; 52E1   033C 0027
        MVO     R4,     G_0352                  ; 52E3   0244 0352
        MVO     R5,     G_0136                  ; 52E5   0245 0136
        B       L_5302                          ; 52E7   0200 0019

L_52E9:
        CLRR    R5                              ; 52E9   01ED
        SUBI    #$0008, R3                      ; 52EA   033B 0008
        MVO@    R5,     R3                      ; 52EC   025D
        ADDI    #$0208, R3                      ; 52ED   02FB 0208
        MVO@    R5,     R3                      ; 52EF   025D
        MOVR    R1,     R3                      ; 52F0   008B
        ADDI    #$020E, R3                      ; 52F1   02FB 020E
        MVI@    R3,     R4                      ; 52F3   029C
        ADDI    #$0200, R4                      ; 52F4   02FC 0200
        MVO@    R4,     R3                      ; 52F6   025C
        SUBI    #$0208, R3                      ; 52F7   033B 0208
        MVI@    R3,     R4                      ; 52F9   029C
        DECR    R4                              ; 52FA   0014
        MVO@    R4,     R3                      ; 52FB   025C
        SDBD                                    ; 52FC   0001
        MVII    #$5425, R4                      ; 52FD   02BC 0025 0054
        BNEQ    L_531C                          ; 5300   020C 001A

L_5302:
        MOVR    R7,     R4                      ; 5302   00BC
        ADDI    #$0126, R4                      ; 5303   02FC 0126
        MOVR    R1,     R3                      ; 5305   008B
        ADDI    #$0008, R3                      ; 5306   02FB 0008
        MVI@    R3,     R3                      ; 5308   029B
        CMPI    #$0006, R3                      ; 5309   037B 0006
        BLE     L_530F                          ; 530B   0206 0002

        SUBI    #$0008, R4                      ; 530D   033C 0008
L_530F:
        MVO@    R0,     R2                      ; 530F   0250
        SUBI    #$0008, R2                      ; 5310   033A 0008
        MVII    #$0056, R0                      ; 5312   02B8 0056
        MVO@    R0,     R2                      ; 5314   0250
        ADDI    #$0230, R2                      ; 5315   02FA 0230
        CLRR    R5                              ; 5317   01ED
        MVO@    R5,     R2                      ; 5318   0255
        ADDI    #$0008, R2                      ; 5319   02FA 0008
        MVO@    R5,     R2                      ; 531B   0255
L_531C:
        MVO     R4,     G_0353                  ; 531C   0244 0353
        MVO     R5,     G_0137                  ; 531E   0245 0137
L_5320:
        INCR    R1                              ; 5320   0009
        CMPI    #$0121, R1                      ; 5321   0379 0121
        BEQ     L_52AF                          ; 5323   0224 0075

        CLRR    R0                              ; 5325   01C0
        MVO     R0,     G_0102                  ; 5326   0240 0102
        MVII    #$0111, R1                      ; 5328   02B9 0111
L_532A:
        MVI@    R1,     R0                      ; 532A   0288
        ANDI    #$00C0, R0                      ; 532B   03B8 00C0
        CMPI    #$0080, R0                      ; 532D   0378 0080
        BNEQ    L_53BD                          ; 532F   020C 008C

        MOVR    R1,     R4                      ; 5331   008C
        ADDI    #$0200, R4                      ; 5332   02FC 0200
        SLL     R0,     1                       ; 5334   0048
        AND@    R4,     R0                      ; 5335   03A0
        BEQ     L_53BD                          ; 5336   0204 0085

        JSR     R5,     L_5DDB                  ; 5338   0004 015C 01DB

        CMPI    #$0014, R2                      ; 533B   037A 0014
        BGE     L_53BD                          ; 533D   020D 007E

        ADDI    #$0027, R4                      ; 533F   02FC 0027
        MVI@    R4,     R4                      ; 5341   02A4
        CMPI    #$0300, R4                      ; 5342   037C 0300
        BNEQ    L_5348                          ; 5344   020C 0002

        ADDI    #$0008, R5                      ; 5346   02FD 0008
L_5348:
        PSHR    R1                              ; 5348   0271
        CLRR    R0                              ; 5349   01C0
L_534A:
        PSHR    R0                              ; 534A   0270
        PSHR    R5                              ; 534B   0275
        PSHR    R3                              ; 534C   0273
        CMPI    #$02DC, R3                      ; 534D   037B 02DC
        BGE     L_53B3                          ; 534F   020D 0062

        MVI@    R3,     R2                      ; 5351   029A
        MVII    #$000B, R3                      ; 5352   02BB 000B
        ANDI    #$01F8, R2                      ; 5354   03BA 01F8
        SLR     R2,     2                       ; 5356   0066
        SLR     R2,     1                       ; 5357   0062
        SUBI    #$0004, R2                      ; 5358   033A 0004
        BMI     L_53B3                          ; 535A   020B 0057

        SUBI    #$0002, R2                      ; 535C   033A 0002
        BEQ     L_53B3                          ; 535E   0204 0053
        BPL     L_5366                          ; 5360   0203 0004

        ADDR    R2,     R0                      ; 5362   00D0
        ADDR    R3,     R0                      ; 5363   00D8
        B       L_536C                          ; 5364   0200 0006

L_5366:
        DECR    R2                              ; 5366   0012
L_5367:
        INCR    R0                              ; 5367   0008
        SUBR    R3,     R2                      ; 5368   011A
        BPL     L_5367                          ; 5369   0223 0003

        ADDR    R3,     R2                      ; 536B   00DA
L_536C:
        DECR    R0                              ; 536C   0010
        MOVR    R5,     R3                      ; 536D   00AB
        ADDR    R7,     R3                      ; 536E   00FB
        ADDI    #$0054, R3                      ; 536F   02FB 0054
        MVI@    R3,     R3                      ; 5371   029B
L_5372:
        SARC    R3,     1                       ; 5372   007B
        DECR    R0                              ; 5373   0010
        BPL     L_5372                          ; 5374   0223 0003
        BNC     L_53B3                          ; 5376   0209 003B

        PULR    R3                              ; 5378   02B3
        PSHR    R3                              ; 5379   0273
        MOVR    R7,     R4                      ; 537A   00BC
        ADDI    #$00B6, R4                      ; 537B   02FC 00B6
        CMPI    #$0008, R5                      ; 537D   037D 0008
        BGE     L_5390                          ; 537F   020D 000F

        SUBI    #$000C, R4                      ; 5381   033C 000C
        MVII    #$00C2, R0                      ; 5383   02B8 00C2
        MVO@    R0,     R1                      ; 5385   0248
        SUBI    #$0008, R1                      ; 5386   0339 0008
        CLRR    R0                              ; 5388   01C0
        MVO@    R0,     R1                      ; 5389   0248
        ADDI    #$0208, R1                      ; 538A   02F9 0208
        MVO@    R0,     R1                      ; 538C   0248
        TSTR    R2                              ; 538D   0092
        BMI     L_53B3                          ; 538E   020B 0023

L_5390:
        MVO     R4,     G_0353                  ; 5390   0244 0353
        CLRR    R4                              ; 5392   01E4
        MVO     R4,     G_0137                  ; 5393   0244 0137
        MVO@    R4,     R3                      ; 5395   025C
        CMPI    #$0007, R2                      ; 5396   037A 0007
        BLT     L_53A6                          ; 5398   0205 000C

        ANDI    #$0001, R2                      ; 539A   03BA 0001
        BNEQ    L_53A3                          ; 539C   020C 0005

        DECR    R3                              ; 539E   0013
        MVO@    R4,     R3                      ; 539F   025C
        INCR    R3                              ; 53A0   000B
        B       L_53A6                          ; 53A1   0200 0003

L_53A3:
        INCR    R3                              ; 53A3   000B
        MVO@    R4,     R3                      ; 53A4   025C
        DECR    R3                              ; 53A5   0013
L_53A6:
        TSTR    R2                              ; 53A6   0092
        BMI     L_53B3                          ; 53A7   020B 000A

        MVI     G_034A, R2                      ; 53A9   0282 034A
        INCR    R2                              ; 53AB   000A
        MVO     R2,     G_034A                  ; 53AC   0242 034A
        MVI     G_0105, R2                      ; 53AE   0282 0105

        JSR     R5,     L_59AE                  ; 53B0   0004 0158 01AE

L_53B3:
        PULR    R3                              ; 53B3   02B3
        PULR    R5                              ; 53B4   02B5
        PULR    R0                              ; 53B5   02B0
        ADDI    #$0014, R3                      ; 53B6   02FB 0014
        XORI    #$0004, R0                      ; 53B8   03F8 0004
        BNEQ    L_534A                          ; 53BA   022C 0071

        PULR    R1                              ; 53BC   02B1
L_53BD:
        INCR    R1                              ; 53BD   0009
        CMPI    #$0113, R1                      ; 53BE   0379 0113
        BLE     L_532A                          ; 53C0   0226 0097
        PULR    R7                              ; 53C2   02B7

        DECLE   $0003,  $0202,  $0206,  $0204   ; 53C3   0003 0202 0206 0204
        DECLE   $020C,  $0208,  $0018,  $0010   ; 53C7   020C 0208 0018 0010
        DECLE   $0203,  $0207,  $0306,  $030E   ; 53CB   0203 0207 0306 030E
        DECLE   $030C,  $031C,  $0318,  $0138   ; 53CF   030C 031C 0318 0138
        DECLE   $017F,  $0112,  $00B0,  $0001   ; 53D3   017F 0112 00B0 0001
        DECLE   $00B0,  $0001,  $00B0,  $0001   ; 53D7   00B0 0001 00B0 0001
        DECLE   $0179,  $010C,  $0179,  $010C   ; 53DB   0179 010C 0179 010C
        DECLE   $00B0,  $0001,  $00B0,  $0001   ; 53DF   00B0 0001 00B0 0001

        CMPR    R3,     R7                      ; 53E3   015F
        SUBR    R1,     R7                      ; 53E4   010F

        DECLE   $0068,  $0001,  $0068,  $0001   ; 53E5   0068 0001 0068 0001
        DECLE   $0068,  $0001,  $0159,  $0109   ; 53E9   0068 0001 0159 0109
        DECLE   $015D,  $010D,  $0068,  $0001   ; 53ED   015D 010D 0068 0001
        DECLE   $0068,  $0001,  $0034,  $0086   ; 53F1   0068 0001 0034 0086
        DECLE   $0000,  $0010,  $0010,  $02C6   ; 53F5   0000 0010 0010 02C6
        DECLE   $0010,  $02D6,  $0010,  $02E6   ; 53F9   0010 02D6 0010 02E6
        DECLE   $0010,  $0206                   ; 53FD   0010 0206

        NEGR    R0                              ; 53FF   0020
        MOVR    R2,     R4                      ; 5400   0094
        MVI@    R2,     R6                      ; 5401   0296
        SLR     R0,     1                       ; 5402   0060
        BLE     L_5405                          ; 5403   0206 0000

L_5405:
        ADDR    R6,     R6                      ; 5405   00F6
        DECLE   $0020,  $0080,  $002A,  $0018   ; 5406   0020 0080 002A 0018
        DECLE   $0010,  $0230                   ; 540A   0010 0230

        BLE     L_540E                          ; 540C   0206 0000

L_540E:
        ADDR    R6,     R6                      ; 540E   00F6
        DECLE   $0020,  $0000,  $000A,  $0000   ; 540F   0020 0000 000A 0000

        CLRR    R4                              ; 5413   01E4
        NEGR    R0                              ; 5414   0020
        CMPR    R0,     R4                      ; 5415   0144
        NEGR    R0                              ; 5416   0020
        ADDR    R0,     R4                      ; 5417   00C4
        NEGR    R0                              ; 5418   0020
        SLR     R0,     2                       ; 5419   0064
        NEGR    R0                              ; 541A   0020
        NOP                                     ; 541B   0034
        NEGR    R0                              ; 541C   0020
        DECR    R4                              ; 541D   0014
        NEGR    R0                              ; 541E   0020
        BLE     L_5421                          ; 541F   0206 0000
L_5421:
        ADDR    R4,     R7                      ; 5421   00E7

        DECLE   $0060,  $0100,  $0083,  $00B7   ; 5422   0060 0100 0083 00B7

        DECR    R0                              ; 5426   0010
        SUBR    R0,     R0                      ; 5427   0100
        SWAP    R3,     1                       ; 5428   0043
        ADDR    R4,     R7                      ; 5429   00E7

        GSWD    R0                              ; 542A   0030
        SUBR    R0,     R0                      ; 542B   0100
        INCR    R3                              ; 542C   000B
        INCR    R0                              ; 542D   0008
        DECR    R0                              ; 542E   0010
        MOVR    R6,     R0                      ; 542F   00B0
        CMPR    R2,     R3                      ; 5430   0153
        ADDR    R0,     R7                      ; 5431   00C7

        DECLE   $0000,  $000F,  $0043,  $00F7   ; 5432   0000 000F 0043 00F7
        DECLE   $0000                           ; 5436   0000

        INCR    R7                              ; 5437   000F

        NEGR    R0                              ; 5438   0020
L_5439:
        MOVR    R4,     R5                      ; 5439   00A5
        DECLE   $00D3,  $0020,  $0075,  $0076   ; 543A   00D3 0020 0075 0076
        DECLE   $0020,  $0045,  $0043,  $0020   ; 543E   0020 0045 0043 0020
        DECLE   $0025,  $00B7                   ; 5442   0025 00B7

        NEGR    R0                              ; 5444   0020
        BUSC    L_5447                          ; 5445   0207 0000

L_5447:
        ADDR    R3,     R0                      ; 5447   00D8
        GSWD    R0                              ; 5448   0030
        BPL     L_54EC                          ; 5449   0203 00A1

        XORI    #$03E0, R4                      ; 544B   03FC 03E0
        GSWD    R0                              ; 544D   0030
        INCR    R4                              ; 544E   000C
        DECR    R0                              ; 544F   0010
        GSWD    R0                              ; 5450   0030
        SLR     R2,     1                       ; 5451   0062
        NOPP                                    ; 5452   0208 0000
        GSWD    R1                              ; 5454   0031
        ADDR    R7,     R0                      ; 5455   00F8
        MOVR    R4,     R0                      ; 5456   00A0
        B       L_5499                          ; 5457   0200 0040

        DECLE   $0208,  $0020,  $0062,  $0000   ; 5459   0208 0020 0062 0000
        DECLE   $00D8,  $0030,  $0203,  $03FC   ; 545D   00D8 0030 0203 03FC
        DECLE   $03C8,  $0100,  $0208,  $0000   ; 5461   03C8 0100 0208 0000
        DECLE   $00D8,  $0020,  $0201,  $00A1   ; 5465   00D8 0020 0201 00A1
        DECLE   $000C,  $0020,  $0030,  $03FC   ; 5469   000C 0020 0030 03FC
        DECLE   $03F0,  $0030,  $0062,  $000C   ; 546D   03F0 0030 0062 000C
        DECLE   $0000                           ; 5471   0000

        INCR    R1                              ; 5472   0009
L_5473:
        PSHR    R5                              ; 5473   0275
        MVI     G_0348, R1                      ; 5474   0281 0348
        MVI@    R1,     R3                      ; 5476   028B
        CMP     G_0131, R3                      ; 5477   0343 0131
        BNEQ    L_5541                          ; 5479   020C 00C6

        MVI     G_0132, R2                      ; 547B   0282 0132
        CMPI    #$00FF, R3                      ; 547D   037B 00FF
        BEQ     L_5486                          ; 547F   0204 0005

        MVO     R3,     G_0132                  ; 5481   0243 0132
        CLRR    R4                              ; 5483   01E4
        MVO     R4,     G_0358                  ; 5484   0244 0358
L_5486:
        CMPI    #$005A, R3                      ; 5486   037B 005A
        BEQ     L_548E                          ; 5488   0204 0004

        CMPI    #$005A, R2                      ; 548A   037A 005A
        BNEQ    L_5493                          ; 548C   020C 0005

L_548E:
        MVII    #$003F, R4                      ; 548E   02BC 003F
        MVO     R4,     .PSG0.chan_enable       ; 5490   0244 01F8
        PULR    R7                              ; 5492   02B7

L_5493:
        MVI     G_0103, R0                      ; 5493   0280 0103
        CMPI    #$0003, R0                      ; 5495   0378 0003
        BEQ     L_5541                          ; 5497   0204 00A8

L_5499:
        TSTR    R0                              ; 5499   0080
        BNEQ    L_54C0                          ; 549A   020C 0024

        CMPI    #$005F, R3                      ; 549C   037B 005F
        BNEQ    L_54C0                          ; 549E   020C 0020

        CMPI    #$005F, R2                      ; 54A0   037A 005F
        BNEQ    L_5541                          ; 54A2   020C 009D

        MVO     R0,     G_013C                  ; 54A4   0240 013C
        MVO     R0,     G_034A                  ; 54A6   0240 034A
        INCR    R0                              ; 54A8   0008
        MVO     R0,     G_0103                  ; 54A9   0240 0103
        MVI     G_0105, R2                      ; 54AB   0282 0105
        CMPI    #$0064, R2                      ; 54AD   037A 0064
        ADCR    R7                              ; 54AF   002F

        INCR    R2                              ; 54B0   000A
L_54B1:
        MVO     R2,     G_0105                  ; 54B1   0242 0105

        JSR     R5,     L_522E                  ; 54B3   0004 0150 022E

        MVO     R0,     G_0349                  ; 54B6   0240 0349
        MVO     R2,     G_013D                  ; 54B8   0242 013D
        MOVR    R7,     R3                      ; 54BA   00BB
        SUBI    #$004B, R3                      ; 54BB   033B 004B
        MVO     R3,     G_0354                  ; 54BD   0243 0354
        PULR    R7                              ; 54BF   02B7

L_54C0:
        MOVR    R7,     R1                      ; 54C0   00B9
        SUBI    #$00BC, R1                      ; 54C1   0339 00BC
        MVII    #$0300, R4                      ; 54C3   02BC 0300
        MVII    #$0080, R5                      ; 54C5   02BD 0080
        ANDI    #$00E0, R3                      ; 54C7   03BB 00E0
        CMPI    #$0040, R3                      ; 54C9   037B 0040
        BEQ     L_54DA                          ; 54CB   0204 000D

        CMPI    #$0020, R3                      ; 54CD   037B 0020
        BEQ     L_54D4                          ; 54CF   0204 0003

        CMPR    R5,     R3                      ; 54D1   016B
        BNEQ    L_552E                          ; 54D2   020C 005A

L_54D4:
        MVII    #$000D, R3                      ; 54D4   02BB 000D
        MVII    #$002A, R0                      ; 54D6   02B8 002A
        B       L_54E3                          ; 54D8   0200 0009

L_54DA:
        SUBI    #$0012, R1                      ; 54DA   0339 0012
        ADDR    R4,     R4                      ; 54DC   00E4
        MVII    #$0012, R0                      ; 54DD   02B8 0012
        CMP     G_0110, R5                      ; 54DF   0345 0110
        BNEQ    L_552E                          ; 54E1   020C 004B

L_54E3:
        CMP     G_0114, R5                      ; 54E3   0345 0114
        BNEQ    L_552E                          ; 54E5   020C 0047

        MVII    #$0111, R2                      ; 54E7   02BA 0111

        JSR     R5,     L_572D                  ; 54E9   0004 0154 032D

L_54EC:
        BNEQ    L_552E                          ; 54EC   020C 0040

        MVII    #$0080, R5                      ; 54EE   02BD 0080
        CMPI    #$0300, R4                      ; 54F0   037C 0300
        BNEQ    L_54FD                          ; 54F2   020C 0009

        MVI     G_012E, R5                      ; 54F4   0285 012E
        DECR    R5                              ; 54F6   0015
        BMI     L_552E                          ; 54F7   020B 0035

        MVO     R5,     G_012E                  ; 54F9   0245 012E
        MVII    #$0083, R5                      ; 54FB   02BD 0083
L_54FD:
        MVO     R1,     G_0352                  ; 54FD   0241 0352
        CLRR    R1                              ; 54FF   01C9
        MVO     R1,     G_0136                  ; 5500   0241 0136
        INCR    R1                              ; 5502   0009
        MVO     R1,     G_010C                  ; 5503   0241 010C
        MVO@    R5,     R2                      ; 5505   0255
        INCR    R5                              ; 5506   000D
        MVO     R5,     G_0114                  ; 5507   0245 0114
        MVII    #$0008, R5                      ; 5509   02BD 0008
        ADDR    R5,     R2                      ; 550B   00EA
        MVO@    R0,     R2                      ; 550C   0250
        ADDI    #$01F8, R2                      ; 550D   02FA 01F8
        MVII    #$0300, R1                      ; 550F   02B9 0300
        MVO@    R1,     R2                      ; 5511   0251
        ADDR    R5,     R2                      ; 5512   00EA
        MVO@    R5,     R2                      ; 5513   0255
        ADDR    R5,     R2                      ; 5514   00EA
        MOVR    R2,     R1                      ; 5515   0091
        SUBI    #$0321, R1                      ; 5516   0339 0321
        SLL     R1,     2                       ; 5518   004D
        SLL     R1,     1                       ; 5519   0049
        SDBD                                    ; 551A   0001
        ADDI    #$19AB, R1                      ; 551B   02F9 00AB 0019
        MVO@    R1,     R2                      ; 551E   0251
        ADDR    R5,     R2                      ; 551F   00EA
        MVI     G_0328, R1                      ; 5520   0281 0328
        MVO@    R1,     R2                      ; 5522   0251
        ADDR    R5,     R2                      ; 5523   00EA
        MVI     G_0330, R1                      ; 5524   0281 0330
        SUBI    #$0100, R1                      ; 5526   0339 0100
        MVO@    R1,     R2                      ; 5528   0251
        ADDR    R5,     R2                      ; 5529   00EA
        MVO@    R4,     R2                      ; 552A   0254
        SUBI    #$0230, R2                      ; 552B   033A 0230
        MVO@    R3,     R2                      ; 552D   0253
L_552E:
        MVI     G_0131, R1                      ; 552E   0281 0131
        ANDI    #$001F, R1                      ; 5530   03B9 001F
        ADDR    R7,     R1                      ; 5532   00F9
        ADDI    #$000F, R1                      ; 5533   02F9 000F
        MVI@    R1,     R0                      ; 5535   0288
        MOVR    R0,     R1                      ; 5536   0081
        ANDI    #$001F, R0                      ; 5537   03B8 001F
        XORR    R0,     R1                      ; 5539   01C1
        SLL     R0,     2                       ; 553A   004C
        ADDR    R0,     R0                      ; 553B   00C0
        MVO     R0,     G_0123                  ; 553C   0240 0123
        SLR     R1,     2                       ; 553E   0065
        MVO     R1,     G_0122                  ; 553F   0241 0122
L_5541:
        PULR    R7                              ; 5541   02B7

        DECLE   $0000,  $0000,  $0000,  $035A   ; 5542   0000 0000 0000 035A
        DECLE   $0000,  $0000,  $0346,  $033D   ; 5546   0000 0000 0346 033D
        DECLE   $0000,  $00DA,  $0000,  $0079   ; 554A   0000 00DA 0000 0079
        DECLE   $00C6,  $00E3,  $03A7,  $0000   ; 554E   00C6 00E3 03A7 0000
        DECLE   $0000,  $0000,  $0000,  $03B9   ; 5552   0000 0000 0000 03B9
        DECLE   $0000,  $0000,  $0323,  $0300   ; 5556   0000 0000 0323 0300
        DECLE   $0000,  $00FD,  $0000,  $0018   ; 555A   0000 00FD 0000 0018
        DECLE   $0067,  $0100,  $0008,  $0000   ; 555E   0067 0100 0008 0000
L_5562:
        PSHR    R5                              ; 5562   0275
        CLRR    R4                              ; 5563   01E4
        MVI     G_0105, R0                      ; 5564   0280 0105
        MVI     G_0107, R5                      ; 5566   0285 0107
        MOVR    R5,     R3                      ; 5568   00AB
        SLL     R0,     2                       ; 5569   004C
        ADDI    #$000A, R0                      ; 556A   02F8 000A
        MVII    #$0064, R2                      ; 556C   02BA 0064
        CMPR    R0,     R2                      ; 556E   0142
        ADCR    R7                              ; 556F   002F

        MOVR    R2,     R0                      ; 5570   0090
L_5571:
        ADDR    R0,     R5                      ; 5571   00C5
        MVO     R5,     G_0107                  ; 5572   0245 0107
        SLL     R2,     1                       ; 5574   004A
        CMPR    R2,     R5                      ; 5575   0155
        BLT     L_557B                          ; 5576   0205 0003

        MOVR    R2,     R5                      ; 5578   0095
        MVO     R4,     G_0107                  ; 5579   0244 0107
L_557B:
        ADDI    #$0214, R3                      ; 557B   02FB 0214
        ADDI    #$0214, R5                      ; 557D   02FD 0214
L_557F:
        SDBD                                    ; 557F   0001
        MVII    #$ABB4, R0                      ; 5580   02B8 00B4 00AB
        MVII    #$0008, R1                      ; 5583   02B9 0008
L_5585:
        MVI@    R3,     R2                      ; 5585   029A
        SAR     R2,     2                       ; 5586   006E
        BMI     L_558F                          ; 5587   020B 0006

        INCR    R3                              ; 5589   000B
        CMPR    R5,     R3                      ; 558A   016B
        BLT     L_5585                          ; 558B   0225 0007
        B       L_5678                          ; 558D   0200 00E9

L_558F:
        SAR     R2,     1                       ; 558F   006A
        SUBR    R0,     R2                      ; 5590   0102
        ADD@    R2,     R7                      ; 5591   02D7

        ADDR    R3,     R1                      ; 5592   00D9
        ADDR    R3,     R7                      ; 5593   00DF
        ADDR    R3,     R7                      ; 5594   00DF
        ADDR    R3,     R7                      ; 5595   00DF
        ADDR    R3,     R7                      ; 5596   00DF

        DECLE   $0032,  $00A0,  $0037           ; 5597   0032 00A0 0037

        ADCR    R5                              ; 559A   002D
        ADDR    R4,     R2                      ; 559B   00E2
        MOVR    R3,     R0                      ; 559C   0098
        ADDR    R4,     R2                      ; 559D   00E2
        ADDR    R3,     R7                      ; 559E   00DF
        ADDR    R3,     R7                      ; 559F   00DF
        ADDR    R3,     R7                      ; 55A0   00DF
        ADDR    R3,     R7                      ; 55A1   00DF

        DECLE   $0032,  $00A0,  $0037           ; 55A2   0032 00A0 0037

        ADCR    R5                              ; 55A5   002D
        ADDR    R4,     R2                      ; 55A6   00E2
        MOVR    R3,     R0                      ; 55A7   0098
        ADDR    R4,     R2                      ; 55A8   00E2
        ADDR    R3,     R7                      ; 55A9   00DF
        ADDR    R3,     R7                      ; 55AA   00DF
        ADDR    R3,     R7                      ; 55AB   00DF
        ADDR    R3,     R7                      ; 55AC   00DF

        DECLE   $0032,  $00A0,  $0037           ; 55AD   0032 00A0 0037

        ADCR    R5                              ; 55B0   002D
        ADDR    R4,     R2                      ; 55B1   00E2
        MOVR    R3,     R0                      ; 55B2   0098
        ADDR    R4,     R2                      ; 55B3   00E2
        ADDR    R3,     R7                      ; 55B4   00DF
        ADDR    R3,     R7                      ; 55B5   00DF
        ADDR    R3,     R7                      ; 55B6   00DF
        ADDR    R3,     R7                      ; 55B7   00DF

        DECLE   $0032,  $00A0,  $0037           ; 55B8   0032 00A0 0037

        ADCR    R5                              ; 55BB   002D
        ADDR    R4,     R2                      ; 55BC   00E2
        MOVR    R3,     R0                      ; 55BD   0098
        ADDR    R4,     R2                      ; 55BE   00E2
        MVI@    R3,     R2                      ; 55BF   029A
        ADDI    #$0010, R2                      ; 55C0   02FA 0010
        MVO@    R2,     R3                      ; 55C2   025A
        INCR    R3                              ; 55C3   000B
        MVI@    R3,     R2                      ; 55C4   029A
        ADDI    #$0010, R2                      ; 55C5   02FA 0010
        B       L_5673                          ; 55C7   0200 00AA

        MVI@    R3,     R2                      ; 55C9   029A
        ADDR    R1,     R2                      ; 55CA   00CA
        DECR    R3                              ; 55CB   0013
        CMP@    R3,     R4                      ; 55CC   035C
        BNEQ    L_55D3                          ; 55CD   020C 0004

        MVO@    R2,     R3                      ; 55CF   025A
        INCR    R3                              ; 55D0   000B
        B       L_5672                          ; 55D1   0200 009F

L_55D3:
        MVI@    R3,     R2                      ; 55D3   029A
        INCR    R3                              ; 55D4   000B
        ANDI    #$01F8, R2                      ; 55D5   03BA 01F8
        BEQ     L_55FE                          ; 55D7   0204 0025

        CMPI    #$0010, R2                      ; 55D9   037A 0010
        BGT     L_5605                          ; 55DB   020E 0028

        PSHR    R3                              ; 55DD   0273
        BLT     L_55E2                          ; 55DE   0205 0002

        SUBI    #$0014, R3                      ; 55E0   033B 0014
L_55E2:
        DECR    R3                              ; 55E2   0013
        PSHR    R5                              ; 55E3   0275
        SDBD                                    ; 55E4   0001
        MVII    #$180B, R5                      ; 55E5   02BD 000B 0018
        CMP@    R3,     R5                      ; 55E8   035D
        MVO@    R5,     R3                      ; 55E9   025D
        BNEQ    L_55EF                          ; 55EA   020C 0003

        JSR     R5,     L_56BE                  ; 55EC   0004 0154 02BE

L_55EF:
        PULR    R5                              ; 55EF   02B5
        PULR    R3                              ; 55F0   02B3
        MVI     G_034A, R4                      ; 55F1   0284 034A
        INCR    R4                              ; 55F3   000C
        MVO     R4,     G_034A                  ; 55F4   0244 034A
L_55F6:
        CLRR    R4                              ; 55F6   01E4
        MVO@    R4,     R3                      ; 55F7   025C
        INCR    R3                              ; 55F8   000B
        CMPR    R5,     R3                      ; 55F9   016B
        BLT     L_557F                          ; 55FA   0225 007C
        B       L_5678                          ; 55FC   0200 007A

L_55FE:
        MVI     G_0349, R4                      ; 55FE   0284 0349
        INCR    R4                              ; 5600   000C
        MVO     R4,     G_0349                  ; 5601   0244 0349
        B       L_55F6                          ; 5603   0220 000E

L_5605:
        CMPI    #$0028, R2                      ; 5605   037A 0028
        BGE     L_5627                          ; 5607   020D 001E

        MVI@    R3,     R2                      ; 5609   029A
        SDBD                                    ; 560A   0001
        CMPI    #$0B18, R2                      ; 560B   037A 0018 000B
        BGE     L_5614                          ; 560E   020D 0004

        ADDI    #$0050, R2                      ; 5610   02FA 0050
        B       L_5673                          ; 5612   0200 005F

L_5614:
        SUBI    #$0030, R2                      ; 5614   033A 0030
        PSHR    R3                              ; 5616   0273
L_5617:
        DECR    R3                              ; 5617   0013
        MVI@    R3,     R4                      ; 5618   029C
        SDBD                                    ; 5619   0001
        CMPI    #$0821, R4                      ; 561A   037C 0021 0008
        BEQ     L_5617                          ; 561D   0224 0007

        TSTR    R4                              ; 561F   00A4
        BNEQ    L_5626                          ; 5620   020C 0004

        MVO@    R2,     R3                      ; 5622   025A
        PULR    R3                              ; 5623   02B3
        B       L_562F                          ; 5624   0200 0009

L_5626:
        PULR    R3                              ; 5626   02B3
L_5627:
        MOVR    R1,     R2                      ; 5627   008A
        B       L_563C                          ; 5628   0200 0012

        MVI@    R3,     R2                      ; 562A   029A
        SUBI    #$0048, R2                      ; 562B   033A 0048
        MVO@    R2,     R3                      ; 562D   025A
        INCR    R3                              ; 562E   000B
L_562F:
        MVO@    R4,     R3                      ; 562F   025C
        B       L_5674                          ; 5630   0200 0042

        DECR    R3                              ; 5632   0013
        MVI@    R3,     R2                      ; 5633   029A
        INCR    R3                              ; 5634   000B
        SLR     R2,     2                       ; 5635   0066
        CMPI    #$0208, R2                      ; 5636   037A 0208
        MVII    #$0050, R2                      ; 5638   02BA 0050
        BEQ     L_5643                          ; 563A   0204 0007

L_563C:
        MVI     G_0351, R4                      ; 563C   0284 0351
        ADDR    R3,     R4                      ; 563E   00DC
        ANDI    #$0001, R4                      ; 563F   03BC 0001
        BEQ     L_5645                          ; 5641   0204 0002

L_5643:
        SUBI    #$0058, R2                      ; 5643   033A 0058
L_5645:
        NEGR    R2                              ; 5645   0022
        ADD@    R3,     R2                      ; 5646   02DA
        MVII    #$0014, R4                      ; 5647   02BC 0014
        SLR     R2,     2                       ; 5649   0066
        CMPI    #$02F0, R2                      ; 564A   037A 02F0
        BEQ     L_5659                          ; 564C   0204 000B

        CMPI    #$0284, R2                      ; 564E   037A 0284
        BEQ     L_5656                          ; 5650   0204 0004

        CLRR    R4                              ; 5652   01E4
        SLL     R2,     2                       ; 5653   004E
        B       L_5673                          ; 5654   0200 001D

L_5656:
        ADDI    #$00B0, R2                      ; 5656   02FA 00B0
        NEGR    R4                              ; 5658   0024
L_5659:
        SUBI    #$0058, R2                      ; 5659   033A 0058
        PSHR    R3                              ; 565B   0273
        ADDR    R4,     R3                      ; 565C   00E3
        MVI@    R3,     R4                      ; 565D   029C
        TSTR    R4                              ; 565E   00A4
        BEQ     L_5665                          ; 565F   0204 0004

        PULR    R3                              ; 5661   02B3
        CLRR    R4                              ; 5662   01E4
        B       L_5674                          ; 5663   0200 000F

L_5665:
        SLL     R2,     2                       ; 5665   004E
        MVO@    R2,     R3                      ; 5666   025A
        PULR    R3                              ; 5667   02B3
        CLRR    R4                              ; 5668   01E4
        B       L_562F                          ; 5669   0220 003B

        MVI     G_0351, R2                      ; 566B   0282 0351
        ANDI    #$001F, R2                      ; 566D   03BA 001F
        BNEQ    L_5674                          ; 566F   020C 0003

        MVI@    R3,     R2                      ; 5671   029A
L_5672:
        ADDR    R1,     R2                      ; 5672   00CA
L_5673:
        MVO@    R2,     R3                      ; 5673   025A
L_5674:
        INCR    R3                              ; 5674   000B
        CMPR    R5,     R3                      ; 5675   016B
        BLT     L_5585                          ; 5676   0225 00F2

L_5678:
        MVI     G_0105, R1                      ; 5678   0281 0105
        CMPI    #$0011, R1                      ; 567A   0379 0011
        BGE     L_5686                          ; 567C   020D 0008

        MVI     G_0104, R0                      ; 567E   0280 0104
        ADDR    R7,     R1                      ; 5680   00F9
        ADDI    #$002C, R1                      ; 5681   02F9 002C
        AND@    R1,     R0                      ; 5683   0388
        BNEQ    L_56AD                          ; 5684   020C 0027

L_5686:
        MVI     G_0351, R0                      ; 5686   0280 0351
        ANDI    #$003F, R0                      ; 5688   03B8 003F
        CMPI    #$0028, R0                      ; 568A   0378 0028
        BGE     L_56AD                          ; 568C   020D 001F

        MOVR    R0,     R1                      ; 568E   0081
        ANDI    #$0003, R0                      ; 568F   03B8 0003
        XORR    R0,     R1                      ; 5691   01C1
        MOVR    R1,     R2                      ; 5692   008A
        SLL     R1,     2                       ; 5693   004D
        ADDR    R2,     R1                      ; 5694   00D1
        ADDI    #$0226, R1                      ; 5695   02F9 0226
        MVI@    R1,     R2                      ; 5697   028A
        INCR    R1                              ; 5698   0009
        ADD@    R1,     R2                      ; 5699   02CA
        BNEQ    L_56AD                          ; 569A   020C 0011

        MVI     G_0349, R4                      ; 569C   0284 0349
        DECR    R4                              ; 569E   0014
        BMI     L_56AD                          ; 569F   020B 000C

        MVO     R4,     G_0349                  ; 56A1   0244 0349
        MOVR    R0,     R4                      ; 56A3   0084
        SLL     R0,     1                       ; 56A4   0048
        ADDR    R0,     R4                      ; 56A5   00C4
        SLL     R0,     2                       ; 56A6   004C
        ADDR    R4,     R0                      ; 56A7   00E0
        ADDI    #$0147, R0                      ; 56A8   02F8 0147
        SLL     R0,     2                       ; 56AA   004C
        SLL     R0,     1                       ; 56AB   0048
        MVO@    R0,     R1                      ; 56AC   0248
L_56AD:
        PULR    R7                              ; 56AD   02B7

        DECLE   $001F,  $001F,  $000F,  $001F   ; 56AE   001F 001F 000F 001F

        INCR    R7                              ; 56B2   000F
        INCR    R7                              ; 56B3   000F

L_56B4:
        SETC                                    ; 56B4   0007
L_56B5:
        INCR    R7                              ; 56B5   000F

        SETC                                    ; 56B6   0007
L_56B7:
        SETC                                    ; 56B7   0007
        DECLE   $0003,  $0007,  $0003,  $0003   ; 56B8   0003 0007 0003 0003
        DECLE   $0001                           ; 56BC   0001

        DIS                                     ; 56BD   0003
L_56BE:
        CLRR    R2                              ; 56BE   01D2
        MVO@    R2,     R3                      ; 56BF   025A
        ADDI    #$0014, R3                      ; 56C0   02FB 0014
        MVO@    R2,     R3                      ; 56C2   025A
        SDBD                                    ; 56C3   0001
        MVII    #$5223, R4                      ; 56C4   02BC 0023 0052
        MOVR    R4,     R0                      ; 56C7   00A0
L_56C8:
        CMP@    R4,     R3                      ; 56C8   0363
        BNEQ    L_56C8                          ; 56C9   022C 0002

        SUBR    R0,     R4                      ; 56CB   0104
        MVII    #$0001, R1                      ; 56CC   02B9 0001
L_56CE:
        SLL     R1,     1                       ; 56CE   0049
        DECR    R4                              ; 56CF   0014
        BNEQ    L_56CE                          ; 56D0   022C 0003

        SLR     R1,     1                       ; 56D2   0061
        XOR     G_034F, R1                      ; 56D3   03C1 034F
        MVO     R1,     G_034F                  ; 56D5   0241 034F
        MOVR    R7,     R4                      ; 56D7   00BC
        SUBI    #$0273, R4                      ; 56D8   033C 0273
        MVII    #$0060, R1                      ; 56DA   02B9 0060
        PSHR    R5                              ; 56DC   0275
L_56DD:
        MVO     R4,     G_0354                  ; 56DD   0244 0354
        MVO     R2,     G_0138                  ; 56DF   0242 0138

        JSR     R5,     L_572B                  ; 56E1   0004 0154 032B

        BEQ     L_56ED                          ; 56E4   0204 0007

        MVII    #$0111, R2                      ; 56E6   02BA 0111

        JSR     R5,     L_572D                  ; 56E8   0004 0154 032D

        BNEQ    L_5717                          ; 56EB   020C 002A

L_56ED:
        MVII    #$00C1, R4                      ; 56ED   02BC 00C1
        MVO@    R4,     R2                      ; 56EF   0254
        MVII    #$0008, R4                      ; 56F0   02BC 0008
        SUBR    R4,     R2                      ; 56F2   0122
        MVO@    R1,     R2                      ; 56F3   0251
        ADDI    #$0208, R2                      ; 56F4   02FA 0208
        MVII    #$0200, R1                      ; 56F6   02B9 0200
        MVO@    R1,     R2                      ; 56F8   0251
        ADDR    R4,     R2                      ; 56F9   00E2
        SLR     R1,     1                       ; 56FA   0061
        MVO@    R1,     R2                      ; 56FB   0251
        ADDR    R4,     R2                      ; 56FC   00E2
        MOVR    R2,     R1                      ; 56FD   0091
        SUBI    #$0326, R1                      ; 56FE   0339 0326
        BPL     L_5705                          ; 5700   0203 0003

        SUBI    #$0002, R1                      ; 5702   0339 0002
        INCR    R7                              ; 5704   000F

L_5705:
        SLL     R1,     1                       ; 5705   0049
L_5706:
        SLL     R1,     1                       ; 5706   0049
        ADDI    #$0279, R1                      ; 5707   02F9 0279
        SLL     R1,     2                       ; 5709   004D
        MVO@    R1,     R2                      ; 570A   0251
        ADDR    R4,     R2                      ; 570B   00E2

        JSR     R5,     L_5718                  ; 570C   0004 0154 0318

        MVO@    R1,     R2                      ; 570F   0251
        ADDR    R4,     R2                      ; 5710   00E2
        MVO@    R0,     R2                      ; 5711   0250
        ADDR    R4,     R2                      ; 5712   00E2
        CLRR    R5                              ; 5713   01ED
        MVO@    R5,     R2                      ; 5714   0255
        ADDR    R4,     R2                      ; 5715   00E2
        MVO@    R5,     R2                      ; 5716   0255
L_5717:
        PULR    R7                              ; 5717   02B7

L_5718:
        MOVR    R3,     R1                      ; 5718   0099
        SUBI    #$0200, R1                      ; 5719   0339 0200
        CLRR    R0                              ; 571B   01C0
L_571C:
        ADDI    #$0008, R0                      ; 571C   02F8 0008
        SUBI    #$0014, R1                      ; 571E   0339 0014
        BPL     L_571C                          ; 5720   0223 0005

        ADDI    #$0014, R1                      ; 5722   02F9 0014
        SWAP    R0,     1                       ; 5724   0040
        INCR    R1                              ; 5725   0009
        SLL     R1,     2                       ; 5726   004D
        SLL     R1,     1                       ; 5727   0049
        INCR    R1                              ; 5728   0009
        SWAP    R1,     1                       ; 5729   0041
        MOVR    R5,     R7                      ; 572A   00AF

L_572B:
        MVII    #$0116, R2                      ; 572B   02BA 0116
L_572D:
        PSHR    R5                              ; 572D   0275
L_572E:
        MVI@    R2,     R5                      ; 572E   0295
        TSTR    R5                              ; 572F   00AD
        BEQ     L_5739                          ; 5730   0204 0007

        INCR    R2                              ; 5732   000A
        MOVR    R2,     R5                      ; 5733   0095
        ANDI    #$0003, R5                      ; 5734   03BD 0003
        BNEQ    L_572E                          ; 5736   022C 0009

        TSTR    R2                              ; 5738   0092
L_5739:
        PULR    R7                              ; 5739   02B7

        DECLE   $0001,  $011C,  $027C,  $0284   ; 573A   0001 011C 027C 0284
        DECLE   $02CC,  $0294,  $024C,  $023C   ; 573E   02CC 0294 024C 023C
        DECLE   $0244,  $02A4,  $0001,  $008C   ; 5742   0244 02A4 0001 008C
        DECLE   $00CC,  $00C4,  $009C,  $0001   ; 5746   00CC 00C4 009C 0001
        DECLE   $0108,  $0218,  $02A0,  $0248   ; 574A   0108 0218 02A0 0248
        DECLE   $02B0,  $0248,  $0298,  $0248   ; 574E   02B0 0248 0298 0248
        DECLE   $0278,  $0270,  $0060,  $0001   ; 5752   0278 0270 0060 0001
        DECLE   $0148,  $0270,  $0218           ; 5756   0148 0270 0218

        RRC     R0,     1                       ; 5759   0070
        MVI     G_0102, R0                      ; 575A   0280 0102
        INCR    R0                              ; 575C   0008
        MVO     R0,     G_0102                  ; 575D   0240 0102
        CLRR    R5                              ; 575F   01ED
        CMPI    #$00FF, R0                      ; 5760   0378 00FF
        BLT     L_57FB                          ; 5762   0205 0097
        BGT     L_57A3                          ; 5764   020E 003D

        MVI     .STIC.MODE,R1                   ; 5766   0281 0021
        MVII    #$000E, R1                      ; 5768   02B9 000E
        MVO     R1,     .STIC.CS.0              ; 576A   0241 0028
        CLRR    R4                              ; 576C   01E4
L_576D:
        MVO@    R5,     R4                      ; 576D   0265
        CMPI    #$0020, R4                      ; 576E   037C 0020
        BLT     L_576D                          ; 5770   0225 0004

        MVII    #$0030, R4                      ; 5772   02BC 0030
        MVO@    R5,     R4                      ; 5774   0265
        MVO@    R5,     R4                      ; 5775   0265
        MVO@    R5,     R4                      ; 5776   0265
        SDBD                                    ; 5777   0001
        MVII    #$5DF9, R5                      ; 5778   02BD 00F9 005D
        MVII    #$0030, R2                      ; 577B   02BA 0030
        SDBD                                    ; 577D   0001
        MVII    #$3800, R4                      ; 577E   02BC 0000 0038
L_5781:
        MVI@    R5,     R1                      ; 5781   02A9
        MVO@    R1,     R4                      ; 5782   0261
        DECR    R2                              ; 5783   0012
        BNEQ    L_5781                          ; 5784   022C 0004

        MVII    #$0004, R3                      ; 5786   02BB 0004
        INCR    R2                              ; 5788   000A
L_5789:
        ADDI    #$000B, R2                      ; 5789   02FA 000B
L_578B:
        MVI@    R5,     R1                      ; 578B   02A9
        MVO@    R1,     R4                      ; 578C   0261
        MVI@    R5,     R1                      ; 578D   02A9
        MVO@    R1,     R4                      ; 578E   0261
        CLRR    R1                              ; 578F   01C9
        MVO@    R1,     R4                      ; 5790   0261
        MVO@    R1,     R4                      ; 5791   0261
        MVO@    R1,     R4                      ; 5792   0261
        MVO@    R1,     R4                      ; 5793   0261
        MVO@    R1,     R4                      ; 5794   0261
        MVO@    R1,     R4                      ; 5795   0261
        DECR    R2                              ; 5796   0012
        BNEQ    L_578B                          ; 5797   022C 000D

        SUBI    #$0016, R5                      ; 5799   033D 0016
        MVO@    R1,     R4                      ; 579B   0261
        MVO@    R1,     R4                      ; 579C   0261
        DECR    R3                              ; 579D   0013
        BNEQ    L_5789                          ; 579E   022C 0016

        CLRR    R5                              ; 57A0   01ED
        B       L_580A                          ; 57A1   0200 0067

L_57A3:
        MVII    #$0133, R4                      ; 57A3   02BC 0133
        MVI@    R4,     R1                      ; 57A5   02A1
        INCR    R1                              ; 57A6   0009
        CMPI    #$000C, R1                      ; 57A7   0379 000C
        BLT     L_57AD                          ; 57A9   0205 0002

        MVII    #$0002, R1                      ; 57AB   02B9 0002
L_57AD:
        MVO     R1,     G_0133                  ; 57AD   0241 0133
        MOVR    R1,     R0                      ; 57AF   0088
        ANDI    #$0001, R0                      ; 57B0   03B8 0001
        BNEQ    L_57D1                          ; 57B2   020C 001D

        SLR     R1,     1                       ; 57B4   0061
        MVI@    R4,     R2                      ; 57B5   02A2
        MVI@    R4,     R3                      ; 57B6   02A3
        MVI     .STIC.A.1,R0                    ; 57B7   0280 0011
        ADDR    R7,     R1                      ; 57B9   00F9
        ADD@    R1,     R7                      ; 57BA   02CF

        DECLE   $0005,  $001A,  $001E,  $000C   ; 57BB   0005 001A 001E 000C
        DECLE   $0036                           ; 57BF   0036

        ADDR    R7,     R3                      ; 57C0   00FB
        SUBI    #$0087, R3                      ; 57C1   033B 0087
        ADDR    R2,     R3                      ; 57C3   00D3
        MVI@    R3,     R0                      ; 57C4   0298
L_57C5:
        MVO     R0,     .STIC.A.1               ; 57C5   0240 0011
        MVII    #$0052, R0                      ; 57C7   02B8 0052
L_57C9:
        MVO     R0,     .STIC.Y.1               ; 57C9   0240 0009
L_57CB:
        SLL     R2,     2                       ; 57CB   004E
        SLL     R2,     1                       ; 57CC   004A
        ADDI    #$0220, R2                      ; 57CD   02FA 0220
        MVO     R2,     .STIC.X.1               ; 57CF   0242 0001
L_57D1:
        MVO     R5,     .STIC.VIDEN             ; 57D1   0245 0020
        B       L_589B                          ; 57D3   0200 00C6

        MVII    #$0150, R0                      ; 57D5   02B8 0150
        B       L_57C9                          ; 57D7   0220 000F

        MOVR    R2,     R4                      ; 57D9   0094
        ADDI    #$02B7, R4                      ; 57DA   02FC 02B7
        MVO@    R0,     R4                      ; 57DC   0260
        INCR    R2                              ; 57DD   000A
        ANDI    #$000F, R2                      ; 57DE   03BA 000F
        MVO     R2,     G_0134                  ; 57E0   0242 0134
        BNEQ    L_57E8                          ; 57E2   020C 0004

        XORI    #$0010, R3                      ; 57E4   03FB 0010
        MVO     R3,     G_0135                  ; 57E6   0243 0135
L_57E8:
        MOVR    R2,     R3                      ; 57E8   0093
        ADDI    #$02B7, R3                      ; 57E9   02FB 02B7
        MVI@    R3,     R0                      ; 57EB   0298
        MVO@    R5,     R3                      ; 57EC   025D
        MVO     R0,     .STIC.A.1               ; 57ED   0240 0011
        B       L_57CB                          ; 57EF   0220 0025

        DECR    R0                              ; 57F1   0010
        BLE     L_57D1                          ; 57F2   0226 0022

        INCR    R0                              ; 57F4   0008
        ANDI    #$0007, R0                      ; 57F5   03B8 0007
        ADDI    #$0068, R0                      ; 57F7   02F8 0068
        B       L_57C5                          ; 57F9   0220 0035

L_57FB:
        MVI     G_0132, R1                      ; 57FB   0281 0132
        CMPI    #$005A, R1                      ; 57FD   0379 005A
        BNEQ    L_5805                          ; 57FF   020C 0004

        MVO     R5,     .STIC.BORD              ; 5801   0245 002C
        B       L_589B                          ; 5803   0200 0096

L_5805:
        MVO     R5,     .STIC.VIDEN             ; 5805   0245 0020
        DECR    R0                              ; 5807   0010
L_5808:
        BNEQ    L_5856                          ; 5808   020C 004C

L_580A:
        MVII    #$000F, R1                      ; 580A   02B9 000F
L_580C:
        MVO     R1,     .STIC.BORD              ; 580C   0241 002C
        MVII    #$0006, R0                      ; 580E   02B8 0006
        MVII    #$0310, R4                      ; 5810   02BC 0310
L_5812:
        MVI@    R4,     R1                      ; 5812   02A1
        MVO@    R1,     R5                      ; 5813   0269
        MVI@    R4,     R1                      ; 5814   02A1
        MVO@    R1,     R5                      ; 5815   0269
        MVI@    R4,     R1                      ; 5816   02A1
        MVO@    R1,     R5                      ; 5817   0269
        MVI@    R4,     R1                      ; 5818   02A1
        MVO@    R1,     R5                      ; 5819   0269
        DECR    R0                              ; 581A   0010
        BNEQ    L_5812                          ; 581B   022C 000A

        MVII    #$001E, R5                      ; 581D   02BD 001E
        MOVR    R5,     R4                      ; 581F   00AC
        MVI@    R5,     R1                      ; 5820   02A9
L_5821:
        MVO@    R0,     R4                      ; 5821   0260
        MVO     R1,     G_0120                  ; 5822   0241 0120
        MVI@    R5,     R1                      ; 5824   02A9
        MVO@    R0,     R4                      ; 5825   0260
        MVO     R1,     G_0121                  ; 5826   0241 0121
        SDBD                                    ; 5828   0001
        MVII    #$39A0, R5                      ; 5829   02BD 00A0 0039
        MVII    #$0118, R3                      ; 582C   02BB 0118
        SDBD                                    ; 582E   0001
        MVII    #$5E41, R2                      ; 582F   02BA 0041 005E
        DECR    R0                              ; 5832   0010
L_5833:
        MVI@    R3,     R4                      ; 5833   029C
        ADDR    R4,     R4                      ; 5834   00E4
        ADDR    R4,     R4                      ; 5835   00E4
        ADDR    R2,     R4                      ; 5836   00D4
        NEGR    R0                              ; 5837   0020
L_5838:
        MVI@    R4,     R1                      ; 5838   02A1
        MVO@    R1,     R5                      ; 5839   0269
        MVI@    R4,     R1                      ; 583A   02A1
        MVO@    R1,     R5                      ; 583B   0269
        MVI@    R4,     R1                      ; 583C   02A1
        MVO@    R1,     R5                      ; 583D   0269
        MVI@    R4,     R1                      ; 583E   02A1
        MVO@    R1,     R5                      ; 583F   0269
        MVI@    R4,     R1                      ; 5840   02A1
        MVO@    R1,     R5                      ; 5841   0269
        MVI@    R4,     R1                      ; 5842   02A1
        MVO@    R1,     R5                      ; 5843   0269
        MVI@    R4,     R1                      ; 5844   02A1
        MVO@    R1,     R5                      ; 5845   0269
        MVI@    R4,     R1                      ; 5846   02A1
        MVO@    R1,     R5                      ; 5847   0269
        INCR    R3                              ; 5848   000B
        CMPI    #$011C, R3                      ; 5849   037B 011C
        BLE     L_5833                          ; 584B   0226 0019

        DECR    R3                              ; 584D   0013
        DECR    R0                              ; 584E   0010
        BEQ     L_5838                          ; 584F   0224 0018

        INCR    R3                              ; 5851   000B
        CMPI    #$0120, R3                      ; 5852   037B 0120
        BNEQ    L_5833                          ; 5854   022C 0022

L_5856:
        MVII    #$0352, R4                      ; 5856   02BC 0352
L_5858:
        MOVR    R4,     R2                      ; 5858   00A2
        SUBI    #$015E, R2                      ; 5859   033A 015E
        MVI@    R2,     R1                      ; 585B   0291
        SWAP    R1,     1                       ; 585C   0041
        MOVR    R2,     R3                      ; 585D   0093
        SUBI    #$0004, R3                      ; 585E   033B 0004
        ADD@    R3,     R1                      ; 5860   02D9
        MOVR    R4,     R5                      ; 5861   00A5
        ADDI    #$0003, R5                      ; 5862   02FD 0003
        ADD@    R5,     R1                      ; 5864   02E9
        MVO@    R1,     R3                      ; 5865   0259
        SWAP    R1,     1                       ; 5866   0041
        MVO@    R1,     R2                      ; 5867   0251
        MVI@    R4,     R3                      ; 5868   02A3
        DECR    R4                              ; 5869   0014
        SUBI    #$00BE, R2                      ; 586A   033A 00BE
        MVI@    R2,     R1                      ; 586C   0291
        DECR    R1                              ; 586D   0011
        BMI     L_5873                          ; 586E   020B 0003

        MVO@    R1,     R2                      ; 5870   0251
        BNEQ    L_5896                          ; 5871   020C 0023

L_5873:
        MOVR    R4,     R2                      ; 5873   00A2
        SUBI    #$0219, R2                      ; 5874   033A 0219
        TSTR    R3                              ; 5876   009B
        BEQ     L_5896                          ; 5877   0204 001D

        MVI@    R3,     R5                      ; 5879   029D
        MOVR    R5,     R0                      ; 587A   00A8
        BEQ     L_5896                          ; 587B   0204 0019

        ANDI    #$000F, R5                      ; 587D   03BD 000F
        MOVR    R5,     R1                      ; 587F   00A9
        SLR     R0,     2                       ; 5880   0064
        SLR     R0,     2                       ; 5881   0064
        INCR    R5                              ; 5882   000D
        ADDR    R7,     R5                      ; 5883   00FD
        ADD@    R5,     R7                      ; 5884   02EF

        INCR    R5                              ; 5885   000D
        COMR    R4                              ; 5886   001C
        NEGR    R0                              ; 5887   0020
        NEGR    R6                              ; 5888   0026
        COMR    R1                              ; 5889   0019
        ADDR    R2,     R4                      ; 588A   00D4
        ADCR    R1                              ; 588B   0029
        ADCR    R1                              ; 588C   0029
        ADCR    R1                              ; 588D   0029
        SLL     R1,     2                       ; 588E   004D
        ADDR    R1,     R3                      ; 588F   00CB
        ADDR    R1,     R3                      ; 5890   00CB
        ADDR    R1,     R3                      ; 5891   00CB
        SUBI    #$0003, R2                      ; 5892   033A 0003
        MVO@    R0,     R2                      ; 5894   0250
        INCR    R3                              ; 5895   000B
L_5896:
        MVO@    R3,     R4                      ; 5896   0263
        CMPI    #$0354, R4                      ; 5897   037C 0354
        BLE     L_5858                          ; 5899   0226 0042
L_589B:
        J       X_ISRRET                        ; 589B   0004 0310 0014

        MVO     R0,     .PSG0.noise             ; 589E   0240 01F9
        INCR    R7                              ; 58A0   000F

        MVO@    R0,     R2                      ; 58A1   0250
L_58A2:
        INCR    R3                              ; 58A2   000B
        B       L_5873                          ; 58A3   0220 0031

        MVI@    R2,     R5                      ; 58A5   0295
        DECR    R5                              ; 58A6   0015
        MVO@    R5,     R2                      ; 58A7   0255
        BEQ     L_58A2                          ; 58A8   0224 0007

        NEGR    R0                              ; 58AA   0020
        ADDR    R0,     R3                      ; 58AB   00C3
        B       L_5873                          ; 58AC   0220 003A

        MVII    #$0024, R2                      ; 58AE   02BA 0024
        SUBI    #$0006, R1                      ; 58B0   0339 0006
        ADDR    R1,     R7                      ; 58B2   00CF

        SLR     R2,     1                       ; 58B3   0062
        SLR     R2,     1                       ; 58B4   0062
        COMR    R2                              ; 58B5   001A
        ADDI    #$01FB, R1                      ; 58B6   02F9 01FB
        MOVR    R0,     R5                      ; 58B8   0085
        ANDI    #$000F, R0                      ; 58B9   03B8 000F
        MVO@    R0,     R1                      ; 58BB   0248
        XORR    R0,     R5                      ; 58BC   01C5
        BNEQ    L_58A2                          ; 58BD   022C 001C

        INCR    R3                              ; 58BF   000B
        MVI@    R3,     R0                      ; 58C0   0298
        SUBI    #$000B, R1                      ; 58C1   0339 000B
        MVO@    R0,     R1                      ; 58C3   0248
        INCR    R3                              ; 58C4   000B
        MVI@    R3,     R0                      ; 58C5   0298
        ADDI    #$0004, R1                      ; 58C6   02F9 0004
        MVO@    R0,     R1                      ; 58C8   0248
        SLR     R0,     2                       ; 58C9   0064
        SLR     R0,     2                       ; 58CA   0064
        AND     .PSG0.chan_enable,R2            ; 58CB   0382 01F8
        XORR    R0,     R2                      ; 58CD   01C2
        MVO     R2,     .PSG0.chan_enable       ; 58CE   0242 01F8
        B       L_58A2                          ; 58D0   0220 002F

        MVO@    R3,     R4                      ; 58D2   0263
        MVI     G_013D, R1                      ; 58D3   0281 013D
        MVI     G_013C, R3                      ; 58D5   0283 013C
        CMPI    #$004C, R3                      ; 58D7   037B 004C
        BLT     L_58E2                          ; 58D9   0205 0007

        CLRR    R3                              ; 58DB   01DB
        CMPI    #$0022, R1                      ; 58DC   0379 0022
        ADCR    R7                              ; 58DE   002F

        INCR    R1                              ; 58DF   0009
L_58E0:
        MVO     R1,     G_013D                  ; 58E0   0241 013D
L_58E2:
        MOVR    R3,     R2                      ; 58E2   009A
        SLR     R3,     1                       ; 58E3   0063
        ADDR    R7,     R3                      ; 58E4   00FB
        ADDI    #$0039, R3                      ; 58E5   02FB 0039
        MVI@    R3,     R3                      ; 58E7   029B
        INCR    R2                              ; 58E8   000A
        MVO     R2,     G_013C                  ; 58E9   0242 013C
        SARC    R2,     1                       ; 58EB   007A
        BNC     L_58F0                          ; 58EC   0209 0002

        SLR     R3,     2                       ; 58EE   0067
        SLR     R3,     2                       ; 58EF   0067
L_58F0:
        ANDI    #$000F, R3                      ; 58F0   03BB 000F
        BEQ     L_5907                          ; 58F2   0204 0013

        ADDR    R1,     R3                      ; 58F4   00CB
        CLRR    R5                              ; 58F5   01ED
L_58F6:
        DECR    R5                              ; 58F6   0015
        SUBI    #$000C, R3                      ; 58F7   033B 000C
        BGT     L_58F6                          ; 58F9   022E 0004

        ADDI    #$0004, R5                      ; 58FB   02FD 0004
        ADDR    R7,     R3                      ; 58FD   00FB
        ADDI    #$0051, R3                      ; 58FE   02FB 0051
        MVI@    R3,     R2                      ; 5900   029A
        ADDR    R5,     R7                      ; 5901   00EF

        SLR     R2,     1                       ; 5902   0062
        SLR     R2,     1                       ; 5903   0062
        SLR     R2,     1                       ; 5904   0062
        MVII    #$0009, R3                      ; 5905   02BB 0009
L_5907:
        MVO     R2,     .PSG0.chn_c_lo          ; 5907   0242 01F2
        SWAP    R2,     1                       ; 5909   0042
        MVO     R2,     .PSG0.chn_c_hi          ; 590A   0242 01F6
        MVO     R3,     .PSG0.chn_c_vol         ; 590C   0243 01FD
        MVI     .PSG0.chan_enable,R3            ; 590E   0283 01F8
        ANDI    #$00DB, R3                      ; 5910   03BB 00DB
        XORI    #$0020, R3                      ; 5912   03FB 0020
        MVO     R3,     .PSG0.chan_enable       ; 5914   0243 01F8
        SLR     R1,     2                       ; 5916   0065
        SUBI    #$000D, R1                      ; 5917   0339 000D
        NEGR    R1                              ; 5919   0021
        MVO     R1,     G_0138                  ; 591A   0241 0138
        B       L_589B                          ; 591C   0220 0082

        SLR     R2,     2                       ; 591E   0066
        INCR    R5                              ; 591F   000D
        ADDR    R2,     R0                      ; 5920   00D0
        DECR    R3                              ; 5921   0013
        RLC     R2,     2                       ; 5922   0056
        INCR    R1                              ; 5923   0009
        SLR     R0,     1                       ; 5924   0060
        MOVR    R3,     R0                      ; 5925   0098
        SLR     R1,     2                       ; 5926   0065
        SLR     R0,     1                       ; 5927   0060
        MOVR    R2,     R6                      ; 5928   0096
        INCR    R1                              ; 5929   0009
        MOVR    R0,     R6                      ; 592A   0086
        RLC     R2,     2                       ; 592B   0056
        INCR    R1                              ; 592C   0009
        SAR     R1,     1                       ; 592D   0069
        MOVR    R0,     R6                      ; 592E   0086
        TSTR    R1                              ; 592F   0089
        MOVR    R1,     R3                      ; 5930   008B
        MOVR    R3,     R0                      ; 5931   0098
        INCR    R4                              ; 5932   000C
        SLR     R0,     1                       ; 5933   0060
        MOVR    R3,     R0                      ; 5934   0098
        MOVR    R7,     R1                      ; 5935   00B9
        TSTR    R0                              ; 5936   0080
        ADDR    R0,     R6                      ; 5937   00C6
        INCR    R1                              ; 5938   0009
        TSTR    R1                              ; 5939   0089
        MOVR    R7,     R5                      ; 593A   00BD
        INCR    R1                              ; 593B   0009
        ADDR    R2,     R0                      ; 593C   00D0
        MOVR    R3,     R6                      ; 593D   009E
        ADDR    R3,     R3                      ; 593E   00DB
        ADDR    R2,     R0                      ; 593F   00D0
        MOVR    R3,     R6                      ; 5940   009E
        ADDR    R3,     R4                      ; 5941   00DC
        MOVR    R7,     R2                      ; 5942   00BA
        MOVR    R3,     R0                      ; 5943   0098
        XORI    #$03C0, R1                      ; 5944   03F9 03C0
        AND@    R1,     R2                      ; 5946   038A
        CMP@    R2,     R7                      ; 5947   0357
        SUB@    R4,     R7                      ; 5948   0327

        ADDI    #$02CF, R2                      ; 5949   02FA 02CF
        MVI@    R4,     R7                      ; 594B   02A7

        DECLE   $0281,  $025D,  $023B,  $021B   ; 594C   0281 025D 023B 021B

        ADDI    #$034B, R1                      ; 5950   02F9 034B
        SWAP    R0,     1                       ; 5952   0040
        SLL     R0,     2                       ; 5953   004C
        INCR    R3                              ; 5954   000B
        ADD@    R3,     R0                      ; 5955   02D8
        MVO@    R0,     R1                      ; 5956   0248
        B       L_58A2                          ; 5957   0220 00B6

        MVO     R0,     .PSG0.chn_b_hi          ; 5959   0240 01F5
        INCR    R3                              ; 595B   000B
        MVI@    R3,     R0                      ; 595C   0298
        MVO     R0,     .PSG0.chn_b_lo          ; 595D   0240 01F1
        B       L_58A2                          ; 595F   0220 00BE

L_5961:
        PSHR    R5                              ; 5961   0275
        MOVR    R7,     R5                      ; 5962   00BD
        ADDI    #$003D, R5                      ; 5963   02FD 003D
L_5965:
        MVI@    R5,     R2                      ; 5965   02AA
        MVI@    R5,     R4                      ; 5966   02AC
        MVI@    R2,     R1                      ; 5967   0291
        CMPI    #$034B, R2                      ; 5968   037A 034B
        BLT     L_5976                          ; 596A   0205 000A
        BEQ     L_5973                          ; 596C   0204 0005

        MOVR    R1,     R3                      ; 596E   008B
        BEQ     L_5965                          ; 596F   0224 000B
        B       L_5976                          ; 5971   0200 0003

L_5973:
        NEGR    R3                              ; 5973   0023
        BNEQ    L_5977                          ; 5974   020C 0001

L_5976:
        MOVR    R1,     R3                      ; 5976   008B
L_5977:
        PSHR    R5                              ; 5977   0275
        MOVR    R7,     R5                      ; 5978   00BD
        ADDI    #$0031, R5                      ; 5979   02FD 0031
L_597B:
        MVI@    R5,     R0                      ; 597B   02A8
        CLRR    R2                              ; 597C   01D2
        CMPR    R0,     R3                      ; 597D   0143
        BNC     L_598A                          ; 597E   0209 000A

L_5980:
        INCR    R2                              ; 5980   000A
        SUBR    R0,     R1                      ; 5981   0101
        BPL     L_5980                          ; 5982   0223 0003

        DECR    R2                              ; 5984   0012
        ADDR    R0,     R1                      ; 5985   00C1
        SLL     R2,     2                       ; 5986   004E
        SLL     R2,     1                       ; 5987   004A
        B       L_5992                          ; 5988   0200 0008

L_598A:
        DECR    R0                              ; 598A   0010
        BEQ     L_5992                          ; 598B   0204 0005

        MVII    #$0318, R2                      ; 598D   02BA 0318
        SWAP    R2,     1                       ; 598F   0042
        B       L_5996                          ; 5990   0200 0004

L_5992:
        ADDI    #$0081, R2                      ; 5992   02FA 0081
        SUB     G_013E, R2                      ; 5994   0302 013E
L_5996:
        MVO@    R2,     R4                      ; 5996   0262
        DECR    R0                              ; 5997   0010
        BGT     L_597B                          ; 5998   022E 001E

        PULR    R5                              ; 599A   02B5
        CMPI    #$02E0, R4                      ; 599B   037C 02E0
        BLT     L_5965                          ; 599D   0225 0039
        PULR    R7                              ; 599F   02B7

        SUBR    R5,     R6                      ; 59A0   012E
        B       L_5CF0                          ; 59A1   0200 034D

        DECLE   $0205,  $034B,  $0209,  $0105   ; 59A3   0205 034B 0209 0105
        DECLE   $020E,  $012C,  $02DC,  $03E8   ; 59A7   020E 012C 02DC 03E8
        DECLE   $0064,  $000A,  $0001           ; 59AB   0064 000A 0001
L_59AE:
        PSHR    R5                              ; 59AE   0275
L_59AF:
        SDBD                                    ; 59AF   0001
        MVII    #$270F, R5                      ; 59B0   02BD 000F 0027
        MVI     G_034B, R4                      ; 59B3   0284 034B
        ADDR    R2,     R4                      ; 59B5   00D4
        CMPR    R5,     R4                      ; 59B6   016C
        BLE     L_59C5                          ; 59B7   0206 000C

        MVI     G_034D, R3                      ; 59B9   0283 034D
        CMPR    R5,     R3                      ; 59BB   016B
        BGE     L_59C4                          ; 59BC   020D 0006

        INCR    R3                              ; 59BE   000B
        MVO     R3,     G_034D                  ; 59BF   0243 034D
        SUBR    R5,     R4                      ; 59C1   012C
        DECR    R4                              ; 59C2   0014
        INCR    R7                              ; 59C3   000F

L_59C4:
        MOVR    R5,     R4                      ; 59C4   00AC
L_59C5:
        MVO     R4,     G_034B                  ; 59C5   0244 034B
        PULR    R7                              ; 59C7   02B7

L_59C8:
        MVI@    R5,     R1                      ; 59C8   02A9
        MOVR    R1,     R3                      ; 59C9   008B
        MVI     G_0351, R1                      ; 59CA   0281 0351
        CLRR    R0                              ; 59CC   01C0
L_59CD:
        SLLC    R1,     1                       ; 59CD   0059
        BC      L_59D2                          ; 59CE   0201 0002

        XORI    #$00BD, R1                      ; 59D0   03F9 00BD
L_59D2:
        RLC     R0,     1                       ; 59D2   0050
        DECR    R3                              ; 59D3   0013
        BNEQ    L_59CD                          ; 59D4   022C 0008

        MVO     R1,     G_0351                  ; 59D6   0241 0351
        MOVR    R5,     R7                      ; 59D8   00AF

L_59D9:
        PSHR    R5                              ; 59D9   0275
L_59DA:
        MVII    #$0318, R1                      ; 59DA   02B9 0318
        SWAP    R1,     1                       ; 59DC   0041
        MVII    #$0200, R4                      ; 59DD   02BC 0200
        MVII    #$02DC, R5                      ; 59DF   02BD 02DC
L_59E1:
        MVO@    R1,     R4                      ; 59E1   0261
        MVO@    R1,     R5                      ; 59E2   0269
        CMPI    #$0214, R4                      ; 59E3   037C 0214
        BLT     L_59E1                          ; 59E5   0225 0005

        CLRR    R5                              ; 59E7   01ED
L_59E8:
        MVI@    R4,     R0                      ; 59E8   02A0
        SLR     R0,     2                       ; 59E9   0064
        CMPI    #$020A, R0                      ; 59EA   0378 020A
        BEQ     L_59F4                          ; 59EC   0204 0006

        CMPI    #$0208, R0                      ; 59EE   0378 0208
        BEQ     L_59F4                          ; 59F0   0204 0002

        DECR    R4                              ; 59F2   0014
        MVO@    R5,     R4                      ; 59F3   0265
L_59F4:
        CMPI    #$02DC, R4                      ; 59F4   037C 02DC
        BLT     L_59E8                          ; 59F6   0225 000F

        MVO     R5,     G_0116                  ; 59F8   0245 0116
        MVO     R5,     G_0117                  ; 59FA   0245 0117
        MVO     R5,     G_0316                  ; 59FC   0245 0316
        MVO     R5,     G_0317                  ; 59FE   0245 0317
        MVO     R5,     G_0349                  ; 5A00   0245 0349
        MVII    #$02E4, R5                      ; 5A02   02BD 02E4
        MVII    #$03E1, R2                      ; 5A04   02BA 03E1
        MVO@    R2,     R5                      ; 5A06   026A
        SLR     R1,     1                       ; 5A07   0061
        SUBI    #$03E8, R1                      ; 5A08   0339 03E8
        MVO@    R1,     R5                      ; 5A0A   0269
        MVO@    R1,     R5                      ; 5A0B   0269
        MVII    #$03E9, R2                      ; 5A0C   02BA 03E9
        MVO@    R2,     R5                      ; 5A0E   026A
        SUBI    #$000B, R1                      ; 5A0F   0339 000B
        MOVR    R1,     R2                      ; 5A11   008A
        ADDI    #$0006, R2                      ; 5A12   02FA 0006
        SDBD                                    ; 5A14   0001
        MVII    #$5223, R4                      ; 5A15   02BC 0023 0052
        MVI     G_034F, R0                      ; 5A18   0280 034F
L_5A1A:
        MVI@    R4,     R3                      ; 5A1A   02A3
        SARC    R0,     1                       ; 5A1B   0078
        BNC     L_5A22                          ; 5A1C   0209 0004

        MVO@    R2,     R3                      ; 5A1E   025A
        SUBI    #$0014, R3                      ; 5A1F   033B 0014
        MVO@    R1,     R3                      ; 5A21   0259
L_5A22:
        BNEQ    L_5A1A                          ; 5A22   022C 0009

        MVII    #$0008, R5                      ; 5A24   02BD 0008
        MOVR    R7,     R4                      ; 5A26   00BC
        ADDI    #$002A, R4                      ; 5A27   02FC 002A
L_5A29:
        MVI@    R4,     R3                      ; 5A29   02A3
        MVI@    R4,     R1                      ; 5A2A   02A1
        MVO@    R1,     R3                      ; 5A2B   0259
        ADDR    R5,     R3                      ; 5A2C   00EB
        MVI@    R4,     R1                      ; 5A2D   02A1
        MVO@    R1,     R3                      ; 5A2E   0259
        ADDI    #$01F8, R3                      ; 5A2F   02FB 01F8
        MVI@    R4,     R1                      ; 5A31   02A1
        MVO@    R1,     R3                      ; 5A32   0259
        ADDR    R5,     R3                      ; 5A33   00EB
        MVI@    R4,     R1                      ; 5A34   02A1
        MVO@    R1,     R3                      ; 5A35   0259
        ADDR    R5,     R3                      ; 5A36   00EB
        SDBD                                    ; 5A37   0001
        MVI@    R4,     R1                      ; 5A38   02A1
        MVO@    R1,     R3                      ; 5A39   0259
        ADDR    R5,     R3                      ; 5A3A   00EB
        MVI@    R4,     R1                      ; 5A3B   02A1
        SWAP    R1,     1                       ; 5A3C   0041
        MVO@    R1,     R3                      ; 5A3D   0259
        ADDR    R5,     R3                      ; 5A3E   00EB
        MVI@    R4,     R1                      ; 5A3F   02A1
        SWAP    R1,     1                       ; 5A40   0041
        MVO@    R1,     R3                      ; 5A41   0259
        CMPI    #$0335, R3                      ; 5A42   037B 0335
        BNEQ    L_5A29                          ; 5A44   022C 001C

        MVII    #$0016, R2                      ; 5A46   02BA 0016
        MVO     R2,     G_010D                  ; 5A48   0242 010D
        MVI     G_0325, R2                      ; 5A4A   0282 0325
        SUB     G_013E, R2                      ; 5A4C   0302 013E
        MVO     R2,     G_0325                  ; 5A4E   0242 0325
        PULR    R7                              ; 5A50   02B7

        DECLE   $0110,  $0080,  $0000           ; 5A51   0110 0080 0000

        CMP@    R3,     R6                      ; 5A54   035E
        SWAP    R0,     2                       ; 5A55   0044
        MOVR    R4,     R0                      ; 5A56   00A0
        INCR    R1                              ; 5A57   0009
        SLLC    R2,     2                       ; 5A58   005E
        SWAP    R0,     2                       ; 5A59   0044
        SUBR    R2,     R4                      ; 5A5A   0114
        TSTR    R0                              ; 5A5B   0080
        EIS                                     ; 5A5C   0002
        CMP@    R3,     R0                      ; 5A5D   0358
        MOVR    R7,     R6                      ; 5A5E   00BE
        ADDR    R0,     R7                      ; 5A5F   00C7

        INCR    R1                              ; 5A60   0009
        SLLC    R0,     1                       ; 5A61   0058
        RSWD    R6                              ; 5A62   003E
        SUBR    R2,     R5                      ; 5A63   0115
        MOVR    R0,     R1                      ; 5A64   0081
        COMR    R2                              ; 5A65   001A
        CMP@    R3,     R0                      ; 5A66   0358
        ADDR    R0,     R2                      ; 5A67   00C2
        ADDR    R2,     R1                      ; 5A68   00D1
        ADCR    R1                              ; 5A69   0029
        SLLC    R0,     1                       ; 5A6A   0058
        SWAP    R2,     1                       ; 5A6B   0042
L_5A6C:
        PSHR    R5                              ; 5A6C   0275
        MVII    #$0110, R1                      ; 5A6D   02B9 0110
L_5A6F:
        MVI@    R1,     R2                      ; 5A6F   028A
        CMPI    #$0080, R2                      ; 5A70   037A 0080
        BLE     L_5A92                          ; 5A72   0206 001E

        DECR    R2                              ; 5A74   0012
        MVO@    R2,     R1                      ; 5A75   024A
        ANDI    #$003F, R2                      ; 5A76   03BA 003F
        BNEQ    L_5A92                          ; 5A78   020C 0018

L_5A7A:
        MOVR    R1,     R3                      ; 5A7A   008B
        SUBI    #$0008, R3                      ; 5A7B   033B 0008
        MVI@    R3,     R4                      ; 5A7D   029C
        ADDR    R7,     R4                      ; 5A7E   00FC
        ADDI    #$00B5, R4                      ; 5A7F   02FC 00B5
        MVI@    R4,     R2                      ; 5A81   02A2
        SARC    R2,     2                       ; 5A82   007E
        BOV     L_5A9D                          ; 5A83   0202 0018
        BC      L_5A98                          ; 5A85   0201 0011

        ADD@    R1,     R2                      ; 5A87   02CA
        MVO@    R2,     R1                      ; 5A88   024A
L_5A89:
        MVI@    R4,     R0                      ; 5A89   02A0
        MOVR    R1,     R2                      ; 5A8A   008A
        ADDI    #$0008, R2                      ; 5A8B   02FA 0008
        MVO@    R0,     R2                      ; 5A8D   0250
        MVI@    R3,     R4                      ; 5A8E   029C
        ADDI    #$0002, R4                      ; 5A8F   02FC 0002
L_5A91:
        MVO@    R4,     R3                      ; 5A91   025C
L_5A92:
        INCR    R1                              ; 5A92   0009
        CMPI    #$0117, R1                      ; 5A93   0379 0117
        BLE     L_5A6F                          ; 5A95   0226 0027
        PULR    R7                              ; 5A97   02B7

L_5A98:
        NEGR    R2                              ; 5A98   0022
        ADD@    R3,     R2                      ; 5A99   02DA
        MVO@    R2,     R3                      ; 5A9A   025A
        B       L_5A7A                          ; 5A9B   0220 0022

L_5A9D:
        INCR    R2                              ; 5A9D   000A
        ADDR    R7,     R2                      ; 5A9E   00FA
        ADD@    R2,     R7                      ; 5A9F   02D7

        DECLE   $005A,  $0061,  $002F,  $0005   ; 5AA0   005A 0061 002F 0005

        SLL     R3,     2                       ; 5AA4   004F

        JSR     R5,     L_5DDB                  ; 5AA5   0004 015C 01DB

        SLR     R2,     1                       ; 5AA8   0062
        BNEQ    L_5AC7                          ; 5AA9   020C 001C

        CMPI    #$02DC, R3                      ; 5AAB   037B 02DC
        BGE     L_5AC7                          ; 5AAD   020D 0018

        MVI@    R3,     R0                      ; 5AAF   0298
        ANDI    #$01F8, R0                      ; 5AB0   03B8 01F8
        SUBI    #$0008, R0                      ; 5AB2   0338 0008
        BEQ     L_5ABC                          ; 5AB4   0204 0006

        SUBI    #$0008, R0                      ; 5AB6   0338 0008
        BNEQ    L_5AC7                          ; 5AB8   020C 000D

        SUBI    #$0014, R3                      ; 5ABA   033B 0014
L_5ABC:
        PSHR    R1                              ; 5ABC   0271
        MVO@    R0,     R1                      ; 5ABD   0248
        ADDI    #$0200, R1                      ; 5ABE   02F9 0200
        MVO@    R0,     R1                      ; 5AC0   0248

        JSR     R5,     L_56BE                  ; 5AC1   0004 0154 02BE

        PULR    R1                              ; 5AC4   02B1
        B       L_5A92                          ; 5AC5   0220 0034

L_5AC7:
        MOVR    R1,     R3                      ; 5AC7   008B
        SUBI    #$0008, R3                      ; 5AC8   033B 0008
        MVI@    R3,     R4                      ; 5ACA   029C
        INCR    R4                              ; 5ACB   000C
        MVO@    R4,     R3                      ; 5ACC   025C
        B       L_5A7A                          ; 5ACD   0220 0054

        MVI     G_033D, R2                      ; 5ACF   0282 033D
        TSTR    R2                              ; 5AD1   0092
        BPL     L_5AD5                          ; 5AD2   0203 0001

        NEGR    R2                              ; 5AD4   0022
L_5AD5:
        MVI     G_0345, R0                      ; 5AD5   0280 0345
        TSTR    R0                              ; 5AD7   0080
        BPL     L_5ADB                          ; 5AD8   0203 0001

        NEGR    R0                              ; 5ADA   0020
L_5ADB:
        ADDR    R2,     R0                      ; 5ADB   00D0
        SLL     R0,     2                       ; 5ADC   004C
        SWAP    R0,     1                       ; 5ADD   0040
        ANDI    #$001F, R0                      ; 5ADE   03B8 001F
        MVII    #$0007, R5                      ; 5AE0   02BD 0007
        CMPR    R0,     R5                      ; 5AE2   0145
        ADCR    R7                              ; 5AE3   002F

        MOVR    R5,     R0                      ; 5AE4   00A8
L_5AE5:
        NEGR    R0                              ; 5AE5   0020
        ADDI    #$0008, R0                      ; 5AE6   02F8 0008
        ADD@    R1,     R0                      ; 5AE8   02C8
        MVO@    R0,     R1                      ; 5AE9   0248
        ANDR    R5,     R0                      ; 5AEA   01A8
        BEQ     L_5A92                          ; 5AEB   0224 005A
        B       L_5A89                          ; 5AED   0220 0065

        MVI     G_0359, R4                      ; 5AEF   0284 0359
        MVII    #$0205, R0                      ; 5AF1   02B8 0205
        SLL     R0,     2                       ; 5AF3   004C
        MVO@    R0,     R4                      ; 5AF4   0260
        SUBI    #$0006, R0                      ; 5AF5   0338 0006
        SUBI    #$0015, R4                      ; 5AF7   033C 0015
        MVO@    R0,     R4                      ; 5AF9   0260
        CLRR    R4                              ; 5AFA   01E4
        MVO@    R4,     R1                      ; 5AFB   024C
        MOVR    R1,     R3                      ; 5AFC   008B
        ADDI    #$0200, R3                      ; 5AFD   02FB 0200
        B       L_5A91                          ; 5AFF   0220 006F

        MVI@    R3,     R4                      ; 5B01   029C
        INCR    R4                              ; 5B02   000C
        MVO@    R4,     R3                      ; 5B03   025C
        MVII    #$00CF, R0                      ; 5B04   02B8 00CF
        MVO@    R0,     R1                      ; 5B06   0248
        ADDI    #$001A, R3                      ; 5B07   02FB 001A
        MVI@    R3,     R4                      ; 5B09   029C
        ADDR    R4,     R4                      ; 5B0A   00E4
        ADDR    R7,     R4                      ; 5B0B   00FC
        ADDI    #$0010, R4                      ; 5B0C   02FC 0010
        MVI@    R4,     R2                      ; 5B0E   02A2
        MVI@    R4,     R0                      ; 5B0F   02A0
        SUBI    #$000A, R3                      ; 5B10   033B 000A
        MVO@    R0,     R3                      ; 5B12   0258
        ADDI    #$01F8, R3                      ; 5B13   02FB 01F8
        MVI@    R3,     R4                      ; 5B15   029C
        ANDI    #$0200, R4                      ; 5B16   03BC 0200
        MVO@    R4,     R3                      ; 5B18   025C

        JSR     R5,     L_59AE                  ; 5B19   0004 0158 01AE

        B       L_5A92                          ; 5B1C   0220 008B

        DECLE   $0019,  $005E,  $0032,  $0060   ; 5B1E   0019 005E 0032 0060
        DECLE   $0064,  $004E,  $004B,  $004C   ; 5B22   0064 004E 004B 004C
        DECLE   $00C8,  $0052,  $0064,  $004E   ; 5B26   00C8 0052 0064 004E
        DECLE   $02BC,  $0054,  $01F4,  $0050   ; 5B2A   02BC 0054 01F4 0050
        DECLE   $02BC,  $0054,  $01F4,  $0050   ; 5B2E   02BC 0054 01F4 0050
        DECLE   $03E8,  $0056,  $0002,  $0004   ; 5B32   03E8 0056 0002 0004
        DECLE   $0006,  $0004,  $000A,  $0008   ; 5B36   0006 0004 000A 0008
        DECLE   $000E,  $0004,  $000A,  $0004   ; 5B3A   000E 0004 000A 0004
        DECLE   $0006,  $0000                   ; 5B3E   0006 0000

        EIS                                     ; 5B40   0002
        INCR    R4                              ; 5B41   000C
        ADCR    R2                              ; 5B42   002A
        INCR    R4                              ; 5B43   000C
        ADCR    R4                              ; 5B44   002C
        INCR    R4                              ; 5B45   000C
        ADCR    R6                              ; 5B46   002E
        INCR    R4                              ; 5B47   000C
        GSWD    R0                              ; 5B48   0030
        NEGR    R1                              ; 5B49   0021
        INCR    R2                              ; 5B4A   000A
        COMR    R2                              ; 5B4B   001A
        INCR    R2                              ; 5B4C   000A
        NEGR    R2                              ; 5B4D   0022
        INCR    R2                              ; 5B4E   000A
        NEGR    R6                              ; 5B4F   0026
        COMR    R1                              ; 5B50   0019
        DECR    R0                              ; 5B51   0010
        GSWD    R2                              ; 5B52   0032
        DECR    R0                              ; 5B53   0010
        NOP                                     ; 5B54   0034
        INCR    R6                              ; 5B55   000E
        DECR    R5                              ; 5B56   0015
        INCR    R4                              ; 5B57   000C
        RSWD    R0                              ; 5B58   0038
        INCR    R4                              ; 5B59   000C
        RSWD    R2                              ; 5B5A   003A
        INCR    R4                              ; 5B5B   000C
        RSWD    R4                              ; 5B5C   003C
        INCR    R6                              ; 5B5D   000E
        COMR    R5                              ; 5B5E   001D
        INCR    R0                              ; 5B5F   0008
        RSWD    R6                              ; 5B60   003E
        INCR    R0                              ; 5B61   0008
        SWAP    R0,     1                       ; 5B62   0040
        INCR    R0                              ; 5B63   0008
        SWAP    R2,     1                       ; 5B64   0042
        INCR    R6                              ; 5B65   000E
        COMR    R5                              ; 5B66   001D
        INCR    R0                              ; 5B67   0008
        SWAP    R0,     2                       ; 5B68   0044
        INCR    R0                              ; 5B69   0008
        SWAP    R2,     2                       ; 5B6A   0046
        INCR    R0                              ; 5B6B   0008
        SLL     R0,     1                       ; 5B6C   0048
        INCR    R6                              ; 5B6D   000E
        COMR    R5                              ; 5B6E   001D
        INCR    R0                              ; 5B6F   0008
        SLLC    R0,     1                       ; 5B70   0058

        JSRD    R4,     L_5808                  ; 5B71   0004 005A 0008

        SLLC    R0,     2                       ; 5B74   005C

        JSRD    R4,     L_5821                  ; 5B75   0004 005A 0021

        DECR    R0                              ; 5B78   0010
        SLLC    R0,     1                       ; 5B79   0058

        JSRD    R4,     L_580C                  ; 5B7A   0004 005A 000C
        DECLE   $005C,  $0008,  $005A,  $0021   ; 5B7D   005C 0008 005A 0021
        DECLE   $0014,  $001E,  $000C,  $0020   ; 5B81   0014 001E 000C 0020
        DECLE   $0008,  $0036,  $0008,  $0020   ; 5B85   0008 0036 0008 0020
        DECLE   $0021,  $0020,  $0018,  $0020   ; 5B89   0021 0020 0018 0020
        DECLE   $0014,  $0020,  $0016,  $0020   ; 5B8D   0014 0020 0016 0020
        DECLE   $006C,  $0006,  $0002,  $0018   ; 5B91   006C 0006 0002 0018
        DECLE   $0062,  $0018,  $004A,  $0018   ; 5B95   0062 0018 004A 0018
        DECLE   $0018,  $0018,  $0014,  $0018   ; 5B99   0018 0018 0014 0018
        DECLE   $0016,  $0018,  $006C,  $0002   ; 5B9D   0016 0018 006C 0002
        DECLE   $0018,  $006C,  $0018,  $0016   ; 5BA1   0018 006C 0018 0016
        DECLE   $0018,  $0014,  $0018,  $0018   ; 5BA5   0018 0014 0018 0018
        DECLE   $0018,  $004A,  $0018,  $0062   ; 5BA9   0018 004A 0018 0062
        DECLE   $0012,  $0020,  $0064,  $0020   ; 5BAD   0012 0020 0064 0020
        DECLE   $0066,  $0020,  $0068,  $0020   ; 5BB1   0066 0020 0068 0020
        DECLE   $006A,  $0002,  $0011,  $0012   ; 5BB5   006A 0002 0011 0012
        DECLE   $0024,  $0023,  $0064,  $0033   ; 5BB9   0024 0023 0064 0033
        DECLE   $00A4,  $0036,  $0088,  $002A   ; 5BBD   00A4 0036 0088 002A
        DECLE   $0099,  $0083,  $0059,  $0053   ; 5BC1   0099 0083 0059 0053
        DECLE   $0077,  $00B9,  $009D,  $0021   ; 5BC5   0077 00B9 009D 0021
        DECLE   $0020,  $0123,  $0063,  $0030   ; 5BC9   0020 0123 0063 0030
        DECLE   $01AB,  $0036,  $0040,  $0133   ; 5BCD   01AB 0036 0040 0133
        DECLE   $0020,  $0050,  $00BB,  $0027   ; 5BD1   0020 0050 00BB 0027
        DECLE   $0080,  $00CD,  $0024,  $0050   ; 5BD5   0080 00CD 0024 0050
        DECLE   $021D                           ; 5BD9   021D

        RRC     R0,     2                       ; 5BDA   0074
        SLR     R0,     1                       ; 5BDB   0060
        ANDR    R6,     R3                      ; 5BDC   01B3
        GSWD    R2                              ; 5BDD   0032
        SLR     R0,     1                       ; 5BDE   0060
        MVI@    R4,     R3                      ; 5BDF   02A3
        GSWD    R0                              ; 5BE0   0030
        RLC     R0,     1                       ; 5BE1   0050
        XORR    R0,     R4                      ; 5BE2   01C4
        RRC     R3,     1                       ; 5BE3   0073
        GSWD    R0                              ; 5BE4   0030
        XOR@    R1,     R5                      ; 5BE5   03CD
        RRC     R3,     2                       ; 5BE6   0077
        SWAP    R0,     1                       ; 5BE7   0040
        MOVR    R0,     R7                      ; 5BE8   0087

        DECLE   $0004,  $0107,  $03F5,  $0187   ; 5BE9   0004 0107 03F5 0187

        RRC     R2,     2                       ; 5BED   0076
        MOVR    R0,     R7                      ; 5BEE   0087

        DECLE   $0004,  $0203,  $0037,  $0207   ; 5BEF   0004 0203 0037 0207
        DECLE   $0035,  $0187                   ; 5BF3   0035 0187

        COMR    R2                              ; 5BF5   001A
        MOVR    R0,     R7                      ; 5BF6   0087

        INCR    R1                              ; 5BF7   0009
        SUBR    R0,     R7                      ; 5BF8   0107

        ADDR    R7,     R4                      ; 5BF9   00FC
        MVI     G_007B, R5                      ; 5BFA   0285 007B
        MVI     .STIC.C.7,R5                    ; 5BFC   0285 001F
L_5BFE:
        PSHR    R5                              ; 5BFE   0275
        MVI     G_0105, R4                      ; 5BFF   0284 0105
        MVI     G_0349, R1                      ; 5C01   0281 0349
        SLR     R1,     1                       ; 5C03   0061
        BEQ     L_5C80                          ; 5C04   0204 007A

        JSR     R5,     L_572B                  ; 5C06   0004 0154 032B

        BNEQ    L_5C80                          ; 5C09   020C 0075

        MVI     G_0104, R1                      ; 5C0B   0281 0104
        ANDI    #$000F, R1                      ; 5C0D   03B9 000F
        BNEQ    L_5C80                          ; 5C0F   020C 006F

        JSR     R5,     L_59C8                  ; 5C11   0004 0158 01C8
        DECLE   $0005                           ; 5C14   0005

        MOVR    R0,     R3                      ; 5C15   0083
        SLR     R3,     1                       ; 5C16   0063
        CMPR    R4,     R3                      ; 5C17   0163
        BGE     L_5C80                          ; 5C18   020D 0066

        ADDR    R7,     R3                      ; 5C1A   00FB
        SUBI    #$0064, R3                      ; 5C1B   033B 0064
        MVI@    R3,     R1                      ; 5C1D   0299
        SARC    R0,     1                       ; 5C1E   0078
        BC      L_5C23                          ; 5C1F   0201 0002

        SLR     R1,     2                       ; 5C21   0065
        SLR     R1,     2                       ; 5C22   0065
L_5C23:
        ANDI    #$000F, R1                      ; 5C23   03B9 000F
        MVII    #$0081, R5                      ; 5C25   02BD 0081
        MVO@    R5,     R2                      ; 5C27   0255
        SUBI    #$0008, R2                      ; 5C28   033A 0008
        MOVR    R1,     R4                      ; 5C2A   008C
        ADDR    R4,     R4                      ; 5C2B   00E4
        ADDR    R1,     R4                      ; 5C2C   00CC
        ADDR    R7,     R4                      ; 5C2D   00FC
        SUBI    #$006A, R4                      ; 5C2E   033C 006A
        MVI@    R4,     R0                      ; 5C30   02A0
        MOVR    R0,     R5                      ; 5C31   0085
        ANDI    #$007F, R5                      ; 5C32   03BD 007F
        MVO@    R5,     R2                      ; 5C34   0255
        SLL     R0,     1                       ; 5C35   0048
        SWAP    R0,     1                       ; 5C36   0040
        ADDI    #$001C, R2                      ; 5C37   02FA 001C
        MVII    #$0002, R5                      ; 5C39   02BD 0002
        CLRR    R3                              ; 5C3B   01DB
        MVO@    R3,     R2                      ; 5C3C   0253
        SUBR    R5,     R2                      ; 5C3D   012A
        MVO@    R1,     R2                      ; 5C3E   0251
        SUBR    R5,     R2                      ; 5C3F   012A
        MVO@    R0,     R2                      ; 5C40   0250
        SUBR    R5,     R2                      ; 5C41   012A

        JSR     R5,     L_59C8                  ; 5C42   0004 0158 01C8
        DECLE   $000C                           ; 5C45   000C

        MOVR    R0,     R1                      ; 5C46   0081
        ANDI    #$003F, R0                      ; 5C47   03B8 003F
        ADDI    #$0020, R0                      ; 5C49   02F8 0020
        MVO@    R0,     R2                      ; 5C4B   0250
        ADDI    #$01F2, R2                      ; 5C4C   02FA 01F2
        MVI@    R4,     R0                      ; 5C4E   02A0
        MOVR    R0,     R3                      ; 5C4F   0083
        ANDI    #$00F0, R3                      ; 5C50   03BB 00F0
        XORR    R3,     R0                      ; 5C52   01D8
        PSHR    R3                              ; 5C53   0273
        SWAP    R3,     1                       ; 5C54   0043
        SLR     R3,     2                       ; 5C55   0067
        ADDI    #$0300, R3                      ; 5C56   02FB 0300
        MVO@    R3,     R2                      ; 5C58   0253
        MVII    #$0008, R5                      ; 5C59   02BD 0008
        ADDR    R5,     R2                      ; 5C5B   00EA
        PULR    R3                              ; 5C5C   02B3
        MVO@    R3,     R2                      ; 5C5D   0253
        ADDR    R5,     R2                      ; 5C5E   00EA
        ANDI    #$0060, R3                      ; 5C5F   03BB 0060
        SWAP    R3,     1                       ; 5C61   0043
        SLR     R3,     2                       ; 5C62   0067
        ADDR    R0,     R3                      ; 5C63   00C3
        ADDI    #$01E0, R3                      ; 5C64   02FB 01E0
        CMPI    #$0326, R2                      ; 5C66   037A 0326
        BEQ     L_5C6C                          ; 5C68   0204 0002

        ADDI    #$0010, R3                      ; 5C6A   02FB 0010
L_5C6C:
        MVO@    R3,     R2                      ; 5C6C   0253
        ADDR    R5,     R2                      ; 5C6D   00EA
        MVII    #$00A7, R0                      ; 5C6E   02B8 00A7
        SWAP    R0,     1                       ; 5C70   0040
        MVO@    R0,     R2                      ; 5C71   0250
        ADDR    R5,     R2                      ; 5C72   00EA
        SLL     R1,     2                       ; 5C73   004D
        SDBD                                    ; 5C74   0001
        ADDI    #$1400, R1                      ; 5C75   02F9 0000 0014
        MVO@    R1,     R2                      ; 5C78   0251
        ADDR    R5,     R2                      ; 5C79   00EA
        MVI@    R4,     R0                      ; 5C7A   02A0
        NEGR    R0                              ; 5C7B   0020
        MVO@    R0,     R2                      ; 5C7C   0250
        ADDR    R5,     R2                      ; 5C7D   00EA
        CLRR    R0                              ; 5C7E   01C0
        MVO@    R0,     R2                      ; 5C7F   0250
L_5C80:
        MVII    #$0124, R1                      ; 5C80   02B9 0124
L_5C82:
        PSHR    R1                              ; 5C82   0271
        MVI@    R1,     R0                      ; 5C83   0288
        DECR    R0                              ; 5C84   0010
        MVO@    R0,     R1                      ; 5C85   0248
        BNEQ    L_5DAA                          ; 5C86   020C 0122

        MOVR    R1,     R2                      ; 5C88   008A
        SUBI    #$000E, R2                      ; 5C89   033A 000E
        MVI@    R2,     R0                      ; 5C8B   0290
        ANDI    #$00C0, R0                      ; 5C8C   03B8 00C0
        CMPI    #$0080, R0                      ; 5C8E   0378 0080
        BNEQ    L_5DAA                          ; 5C90   020C 0118

        PSHR    R2                              ; 5C92   0272
        ADDI    #$0012, R2                      ; 5C93   02FA 0012
        MVI@    R2,     R4                      ; 5C95   0294
        ADDR    R4,     R4                      ; 5C96   00E4
        ADDR    R7,     R4                      ; 5C97   00FC
        SUBI    #$00B2, R4                      ; 5C98   033C 00B2
        MVI@    R4,     R3                      ; 5C9A   02A3
        MOVR    R3,     R5                      ; 5C9B   009D
        ANDI    #$007F, R5                      ; 5C9C   03BD 007F
        MVO@    R5,     R1                      ; 5C9E   024D
        XORR    R5,     R3                      ; 5C9F   01EB
        SLL     R3,     1                       ; 5CA0   004B
        SWAP    R3,     1                       ; 5CA1   0043
        MVI@    R4,     R1                      ; 5CA2   02A1
        MOVR    R1,     R0                      ; 5CA3   0088
        ANDI    #$000F, R0                      ; 5CA4   03B8 000F
        PSHR    R0                              ; 5CA6   0270
        PSHR    R3                              ; 5CA7   0273
        XORR    R0,     R1                      ; 5CA8   01C1
        BEQ     L_5CEE                          ; 5CA9   0204 0043

        AND     G_0351, R1                      ; 5CAB   0381 0351
        BNEQ    L_5CEE                          ; 5CAD   020C 003F

        ADDR    R7,     R3                      ; 5CAF   00FB
        ADDI    #$00FF, R3                      ; 5CB0   02FB 00FF
        MVI@    R3,     R4                      ; 5CB2   029C
        MOVR    R2,     R1                      ; 5CB3   0091
        SUBI    #$0012, R1                      ; 5CB4   0339 0012

        JSR     R5,     L_5DDB                  ; 5CB6   0004 015C 01DB

        INCR    R3                              ; 5CB9   000B
        MVI@    R3,     R0                      ; 5CBA   0298
        TSTR    R0                              ; 5CBB   0080
        BNEQ    L_5CEE                          ; 5CBC   020C 0030

        CMPI    #$02DC, R3                      ; 5CBE   037B 02DC
        BGE     L_5CEE                          ; 5CC0   020D 002C

        CMPI    #$0002, R2                      ; 5CC2   037A 0002
        BLE     L_5CEE                          ; 5CC4   0206 0028

        CMPI    #$0012, R2                      ; 5CC6   037A 0012
        BGE     L_5CEE                          ; 5CC8   020D 0024

        CMPI    #$0029, R4                      ; 5CCA   037C 0029
        BGT     L_5CDF                          ; 5CCC   020E 0011
        BEQ     L_5CD4                          ; 5CCE   0204 0004

        CMPI    #$0004, R5                      ; 5CD0   037D 0004
        BNEQ    L_5CEE                          ; 5CD2   020C 001A

L_5CD4:
        MOVR    R3,     R5                      ; 5CD4   009D
        SUBI    #$0013, R5                      ; 5CD5   033D 0013
        ADD@    R5,     R0                      ; 5CD7   02E8
        ADDI    #$0025, R5                      ; 5CD8   02FD 0025
        ADD@    R5,     R0                      ; 5CDA   02E8
        BNEQ    L_5CEE                          ; 5CDB   020C 0011
        B       L_5CE9                          ; 5CDD   0200 000A

L_5CDF:
        ADDI    #$0013, R3                      ; 5CDF   02FB 0013
        CMP@    R3,     R0                      ; 5CE1   0358
        BNEQ    L_5CEE                          ; 5CE2   020C 000A

        MVI     G_034A, R0                      ; 5CE4   0280 034A
        DECR    R0                              ; 5CE6   0010
        MVO     R0,     G_034A                  ; 5CE7   0240 034A
L_5CE9:
        SDBD                                    ; 5CE9   0001
        XORI    #$0800, R4                      ; 5CEA   03FC 0000 0008
        MVO@    R4,     R3                      ; 5CED   025C
L_5CEE:
        PULR    R3                              ; 5CEE   02B3
        PULR    R0                              ; 5CEF   02B0
L_5CF0:
        PULR    R1                              ; 5CF0   02B1
        PSHR    R1                              ; 5CF1   0271
        PSHR    R0                              ; 5CF2   0270
        ADDI    #$0014, R1                      ; 5CF3   02F9 0014
        CMPI    #$0004, R3                      ; 5CF5   037B 0004
        MVI@    R1,     R3                      ; 5CF7   028B
        BGE     L_5D69                          ; 5CF8   020D 006F

        DECR    R3                              ; 5CFA   0013
        BPL     L_5D05                          ; 5CFB   0203 0008

        MVI     G_0351, R0                      ; 5CFD   0280 0351
        ANDI    #$0007, R0                      ; 5CFF   03B8 0007
        INCR    R0                              ; 5D01   0008
        MOVR    R0,     R3                      ; 5D02   0083
        INCR    R0                              ; 5D03   0008
        MVO@    R0,     R1                      ; 5D04   0248
L_5D05:
        MOVR    R3,     R5                      ; 5D05   009D
        SDBD                                    ; 5D06   0001
        ADDI    #$5223, R5                      ; 5D07   02FD 0023 0052
        MVII    #$0007, R4                      ; 5D0A   02BC 0007
        SUBI    #$0014, R1                      ; 5D0C   0339 0014
L_5D0E:
        MVI@    R5,     R2                      ; 5D0E   02AA
        TSTR    R2                              ; 5D0F   0092
        BNEQ    L_5D15                          ; 5D10   020C 0003

        SUBI    #$000B, R5                      ; 5D12   033D 000B
        INCR    R7                              ; 5D14   000F

L_5D15:
        MVI@    R2,     R0                      ; 5D15   0290
L_5D16:
        SLR     R0,     2                       ; 5D16   0064
        CMPI    #$0205, R0                      ; 5D17   0378 0205
        BEQ     L_5D24                          ; 5D19   0204 0009

        DECR    R4                              ; 5D1B   0014
        BNEQ    L_5D0E                          ; 5D1C   022C 000F

        MVI     G_0328, R3                      ; 5D1E   0283 0328
        MVI     G_0330, R0                      ; 5D20   0280 0330
        B       L_5D2B                          ; 5D22   0200 0007

L_5D24:
        PSHR    R1                              ; 5D24   0271
        MOVR    R2,     R3                      ; 5D25   0093

        JSR     R5,     L_5718                  ; 5D26   0004 0154 0318

        MOVR    R1,     R3                      ; 5D29   008B
        PULR    R1                              ; 5D2A   02B1
L_5D2B:
        SLR     R3,     2                       ; 5D2B   0067
        ADDI    #$0218, R1                      ; 5D2C   02F9 0218
        MVI@    R1,     R2                      ; 5D2E   028A
        SLR     R2,     2                       ; 5D2F   0066
        SUBR    R3,     R2                      ; 5D30   011A
        MVII    #$0008, R3                      ; 5D31   02BB 0008
        BMI     L_5D67                          ; 5D33   020B 0032

        CLRR    R4                              ; 5D35   01E4
        ADDI    #$0008, R1                      ; 5D36   02F9 0008
        MVI@    R1,     R1                      ; 5D38   0289
        SUBR    R0,     R1                      ; 5D39   0101
        BPL     L_5D3E                          ; 5D3A   0203 0002

        INCR    R4                              ; 5D3C   000C
        NEGR    R1                              ; 5D3D   0021
L_5D3E:
        SLR     R1,     2                       ; 5D3E   0065
        MVII    #$0008, R3                      ; 5D3F   02BB 0008
        SLR     R2,     2                       ; 5D41   0066
        SLR     R2,     2                       ; 5D42   0066
        SLR     R2,     2                       ; 5D43   0066
        BEQ     L_5D67                          ; 5D44   0204 0021

        CLRR    R0                              ; 5D46   01C0
        MOVR    R2,     R3                      ; 5D47   0093
L_5D48:
        ADDR    R2,     R2                      ; 5D48   00D2
        CMPR    R2,     R1                      ; 5D49   0151
        BC      L_5D48                          ; 5D4A   0221 0003

L_5D4C:
        ADDR    R0,     R0                      ; 5D4C   00C0
        SARC    R2,     1                       ; 5D4D   007A
        CMPR    R2,     R1                      ; 5D4E   0151
        BNC     L_5D53                          ; 5D4F   0209 0002

        SUBR    R2,     R1                      ; 5D51   0111
        INCR    R0                              ; 5D52   0008
L_5D53:
        CMPR    R2,     R3                      ; 5D53   0153
        BNEQ    L_5D4C                          ; 5D54   022C 0009

        MVII    #$0007, R3                      ; 5D56   02BB 0007
        MOVR    R7,     R5                      ; 5D58   00BD
        ADDI    #$007C, R5                      ; 5D59   02FD 007C
L_5D5B:
        INCR    R3                              ; 5D5B   000B
        MVI@    R5,     R1                      ; 5D5C   02A9
        DECR    R1                              ; 5D5D   0011
        CMPR    R1,     R0                      ; 5D5E   0148
        BC      L_5D5B                          ; 5D5F   0221 0005

        TSTR    R4                              ; 5D61   00A4
        BEQ     L_5D67                          ; 5D62   0204 0003

        SUBI    #$0010, R3                      ; 5D64   033B 0010
        NEGR    R3                              ; 5D66   0023
L_5D67:
        B       L_5D88                          ; 5D67   0200 001F
L_5D69:
        BEQ     L_5D79                          ; 5D69   0204 000E

        ANDI    #$0008, R3                      ; 5D6B   03BB 0008
        XORI    #$0004, R3                      ; 5D6D   03FB 0004
        MVI     G_0104, R0                      ; 5D6F   0280 0104
        ANDI    #$0007, R0                      ; 5D71   03B8 0007
        BNEQ    L_5D87                          ; 5D73   020C 0012

        XORI    #$0008, R3                      ; 5D75   03FB 0008
        B       L_5D87                          ; 5D77   0200 000E

L_5D79:
        MOVR    R3,     R5                      ; 5D79   009D
        ANDI    #$0013, R5                      ; 5D7A   03BD 0013
        BNEQ    L_5D84                          ; 5D7C   020C 0006

        MVI     G_0104, R5                      ; 5D7E   0285 0104
        ANDI    #$0005, R5                      ; 5D80   03BD 0005
        BNEQ    L_5D87                          ; 5D82   020C 0003

L_5D84:
        INCR    R3                              ; 5D84   000B
        ANDI    #$001F, R3                      ; 5D85   03BB 001F
L_5D87:
        MVO@    R3,     R1                      ; 5D87   024B
L_5D88:
        MVI     G_0105, R0                      ; 5D88   0280 0105
        SLR     R0,     2                       ; 5D8A   0064
        ADD@    R6,     R0                      ; 5D8B   02F0
        PULR    R1                              ; 5D8C   02B1
        ADDR    R7,     R3                      ; 5D8D   00FB
        ADDI    #$0027, R3                      ; 5D8E   02FB 0027
        MVI@    R3,     R2                      ; 5D90   029A
        ANDI    #$001F, R2                      ; 5D91   03BA 001F
        ADDI    #$0228, R1                      ; 5D93   02F9 0228
        MVII    #$0010, R5                      ; 5D95   02BD 0010
        XORR    R5,     R2                      ; 5D97   01EA
        SUBR    R5,     R2                      ; 5D98   012A
        MVI@    R3,     R3                      ; 5D99   029B
        SLR     R3,     2                       ; 5D9A   0067
        SLR     R3,     2                       ; 5D9B   0067
        SLR     R3,     1                       ; 5D9C   0063
        XORR    R5,     R3                      ; 5D9D   01EB
        SUBR    R5,     R3                      ; 5D9E   012B
        CLRR    R4                              ; 5D9F   01E4
        CLRR    R5                              ; 5DA0   01ED
L_5DA1:
        ADDR    R2,     R4                      ; 5DA1   00D4
        ADDR    R3,     R5                      ; 5DA2   00DD
        DECR    R0                              ; 5DA3   0010
        BNEQ    L_5DA1                          ; 5DA4   022C 0004

        MVO@    R4,     R1                      ; 5DA6   024C
        ADDI    #$0008, R1                      ; 5DA7   02F9 0008
        MVO@    R5,     R1                      ; 5DA9   024D
L_5DAA:
        PULR    R1                              ; 5DAA   02B1
        INCR    R1                              ; 5DAB   0009
        CMPI    #$0125, R1                      ; 5DAC   0379 0125
        BEQ     L_5C82                          ; 5DAE   0224 012D
        PULR    R7                              ; 5DB0   02B7

        DECLE   $0029,  $0021,  $0230,  $0230   ; 5DB1   0029 0021 0230 0230
        DECLE   $01E0,  $01FD,  $01FA,  $01B7   ; 5DB5   01E0 01FD 01FA 01B7
        DECLE   $0175,  $0133,  $00D1,  $0070   ; 5DB9   0175 0133 00D1 0070
        DECLE   $0010,  $03B0,  $0351,  $02F3   ; 5DBD   0010 03B0 0351 02F3
        DECLE   $02B5,  $0277,  $023A,  $021D   ; 5DC1   02B5 0277 023A 021D
        DECLE   $0200,  $0203,  $0226,  $0269   ; 5DC5   0200 0203 0226 0269
        DECLE   $02AB,  $02ED,  $034F,  $03AF   ; 5DC9   02AB 02ED 034F 03AF

        INCR    R7                              ; 5DCD   000F

        SAR     R3,     2                       ; 5DCE   006F
L_5DCF:
        ADDR    R1,     R7                      ; 5DCF   00CF

        DECLE   $012D,  $016B,  $01A9,  $01E6   ; 5DD0   012D 016B 01A9 01E6
        DECLE   $01E3,  $0008,  $0015,  $0023   ; 5DD4   01E3 0008 0015 0023
        DECLE   $0036,  $004F,  $0000           ; 5DD8   0036 004F 0000
L_5DDB:
        PSHR    R5                              ; 5DDB   0275
        MOVR    R1,     R3                      ; 5DDC   008B
        ADDI    #$0208, R3                      ; 5DDD   02FB 0208
        MVI@    R3,     R5                      ; 5DDF   029D
        ANDI    #$0007, R5                      ; 5DE0   03BD 0007
        MVI@    R3,     R2                      ; 5DE2   029A
        SUBI    #$0008, R2                      ; 5DE3   033A 0008
        ANDI    #$0078, R2                      ; 5DE5   03BA 0078
        SLR     R2,     1                       ; 5DE7   0062
        MOVR    R2,     R3                      ; 5DE8   0093
        SLL     R2,     2                       ; 5DE9   004E
        ADDR    R2,     R3                      ; 5DEA   00D3
        MOVR    R1,     R2                      ; 5DEB   008A
        ADDI    #$0200, R2                      ; 5DEC   02FA 0200
        MVI@    R2,     R2                      ; 5DEE   0292
        SUBI    #$0008, R2                      ; 5DEF   033A 0008
        ANDI    #$00F8, R2                      ; 5DF1   03BA 00F8
        SLR     R2,     2                       ; 5DF3   0066
        SLR     R2,     1                       ; 5DF4   0062
        ADDR    R2,     R3                      ; 5DF5   00D3
        ADDI    #$0200, R3                      ; 5DF6   02FB 0200
        PULR    R7                              ; 5DF8   02B7

        DECLE   $0000,  $0000,  $00FF,  $0033   ; 5DF9   0000 0000 00FF 0033
        DECLE   $00FF,  $0033,  $0000,  $0000   ; 5DFD   00FF 0033 0000 0000
        DECLE   $0000,  $0000,  $0004           ; 5E01   0000 0000 0004

        INCR    R6                              ; 5E04   000E
        INCR    R6                              ; 5E05   000E
        INCR    R6                              ; 5E06   000E
        INCR    R6                              ; 5E07   000E

        JSR     R4,     .EXEC.415               ; 5E08   0004 0014 0015
        DECLE   $000D,  $0006,  $0006,  $0004   ; 5E0B   000D 0006 0006 0004
        DECLE   $0006,  $000F,  $00FF,  $00FF   ; 5E0F   0006 000F 00FF 00FF
        DECLE   $00C9,  $00C9,  $00FF,  $00C9   ; 5E13   00C9 00C9 00FF 00C9
        DECLE   $00C9,  $00FF,  $0000,  $0000   ; 5E17   00C9 00FF 0000 0000
        DECLE   $0000,  $0000,  $0000,  $007E   ; 5E1B   0000 0000 0000 007E
        DECLE   $00FF,  $007E,  $0000,  $0000   ; 5E1F   00FF 007E 0000 0000
        DECLE   $0000,  $001C,  $003E,  $007E   ; 5E23   0000 001C 003E 007E
        DECLE   $003C,  $0000,  $0000,  $0006   ; 5E27   003C 0000 0000 0006
        DECLE   $0000                           ; 5E2B   0000

        INCR    R7                              ; 5E2C   000F

        DECLE   $0004                           ; 5E2D   0004
L_5E2E:
        INCR    R2                              ; 5E2E   000A
        DECLE   $0000,  $003C,  $0010,  $0028   ; 5E2F   0000 003C 0010 0028
        DECLE   $0000,  $00F0,  $00F0,  $0000   ; 5E33   0000 00F0 00F0 0000
        DECLE   $0040,  $00A0,  $0000,  $0003   ; 5E37   0040 00A0 0000 0003
        DECLE   $0000,  $00C0,  $0001,  $0002   ; 5E3B   0000 00C0 0001 0002
        DECLE   $0000,  $0080,  $00FE,  $00FF   ; 5E3F   0000 0080 00FE 00FF
        DECLE   $00FF,  $00FE,  $000C,  $001E   ; 5E43   00FF 00FE 000C 001E
        DECLE   $001E,  $000C,  $0000,  $001C   ; 5E47   001E 000C 0000 001C
        DECLE   $0018,  $001E,  $000C,  $0008   ; 5E4B   0018 001E 000C 0008
        DECLE   $0008,  $001C,  $0028,  $006A   ; 5E4F   0008 001C 0028 006A
        DECLE   $00E2,  $00C3,  $0041,  $0061   ; 5E53   00E2 00C3 0041 0061
        DECLE   $0021,  $0020,  $0000,  $001C   ; 5E57   0021 0020 0000 001C
        DECLE   $0018,  $001E,  $000C,  $0008   ; 5E5B   0018 001E 000C 0008
        DECLE   $0008,  $001C,  $0028,  $006A   ; 5E5F   0008 001C 0028 006A
        DECLE   $0062,  $00C3,  $00C1,  $0071   ; 5E63   0062 00C3 00C1 0071
        DECLE   $0031,  $0010,  $0000,  $001C   ; 5E67   0031 0010 0000 001C
        DECLE   $0018,  $001E,  $000C,  $0008   ; 5E6B   0018 001E 000C 0008
        DECLE   $0008,  $001C,  $0028,  $002A   ; 5E6F   0008 001C 0028 002A
        DECLE   $0062,  $0043,  $00C1,  $00F9   ; 5E73   0062 0043 00C1 00F9
        DECLE   $0079,  $0008,  $0000,  $001C   ; 5E77   0079 0008 0000 001C
        DECLE   $001C,  $001E,  $000C,  $0008   ; 5E7B   001C 001E 000C 0008
        DECLE   $0008,  $001C,  $0008,  $002A   ; 5E7F   0008 001C 0008 002A
        DECLE   $0022,  $0063,  $0041,  $007D   ; 5E83   0022 0063 0041 007D
        DECLE   $003D,  $0004,  $0000,  $0000   ; 5E87   003D 0004 0000 0000
        DECLE   $0076,  $00BB,  $006D,  $00D6   ; 5E8B   0076 00BB 006D 00D6
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E8F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 5E93   0000 0000 0000 0010
        DECLE   $006E,  $00FD,  $0000,  $0000   ; 5E97   006E 00FD 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E9B   0000 0000 0000 0000
        DECLE   $0038,  $00F5,  $0000,  $0000   ; 5E9F   0038 00F5 0000 0000
        DECLE   $0000,  $0000,  $0038,  $007C   ; 5EA3   0000 0000 0038 007C
        DECLE   $00EE,  $0076,  $0014,  $0014   ; 5EA7   00EE 0076 0014 0014
        DECLE   $001C,  $001C,  $001C,  $001C   ; 5EAB   001C 001C 001C 001C
        DECLE   $0000,  $001C,  $001C,  $001C   ; 5EAF   0000 001C 001C 001C
        DECLE   $001C,  $0034,  $0064,  $0044   ; 5EB3   001C 0034 0064 0044
        DECLE   $0044,  $0066,  $0036,  $005F   ; 5EB7   0044 0066 0036 005F
        DECLE   $006D,  $00BB,  $007E,  $00BC   ; 5EBB   006D 00BB 007E 00BC
        DECLE   $00FE,  $0070,  $0000,  $0000   ; 5EBF   00FE 0070 0000 0000
        DECLE   $0036,  $00DF,  $007D,  $00BE   ; 5EC3   0036 00DF 007D 00BE
        DECLE   $00FE,  $0070,  $0014,  $0014   ; 5EC7   00FE 0070 0014 0014
        DECLE   $001C,  $001C,  $001C,  $001C   ; 5ECB   001C 001C 001C 001C
        DECLE   $0000,  $001C,  $001C,  $000C   ; 5ECF   0000 001C 001C 000C
        DECLE   $003C,  $0038,  $0030,  $0010   ; 5ED3   003C 0038 0030 0010
        DECLE   $0010,  $0018,  $0014,  $0014   ; 5ED7   0010 0018 0014 0014
        DECLE   $001C,  $001C,  $001C,  $001C   ; 5EDB   001C 001C 001C 001C
        DECLE   $0000,  $001C,  $001C,  $001C   ; 5EDF   0000 001C 001C 001C
        DECLE   $0014,  $0014,  $0034,  $0026   ; 5EE3   0014 0014 0034 0026
        DECLE   $0020,  $0030,  $0038,  $0028   ; 5EE7   0020 0030 0038 0028
        DECLE   $0074,  $006C,  $007C,  $007C   ; 5EEB   0074 006C 007C 007C
        DECLE   $0038,  $0038,  $0038,  $0038   ; 5EEF   0038 0038 0038 0038
        DECLE   $007C,  $0068,  $007C,  $0074   ; 5EF3   007C 0068 007C 0074
        DECLE   $0038,  $0038,  $0038,  $0038   ; 5EF7   0038 0038 0038 0038
        DECLE   $007C,  $007C,  $006C,  $005C   ; 5EFB   007C 007C 006C 005C
        DECLE   $0028,  $0038,  $0038,  $0038   ; 5EFF   0028 0038 0038 0038
        DECLE   $005C,  $007C,  $002C,  $007C   ; 5F03   005C 007C 002C 007C
        DECLE   $0038,  $0038,  $0000,  $0000   ; 5F07   0038 0038 0000 0000
        DECLE   $0000,  $00C0,  $0060,  $00FC   ; 5F0B   0000 00C0 0060 00FC
        DECLE   $00FE,  $006B,  $0000,  $0000   ; 5F0F   00FE 006B 0000 0000
        DECLE   $0080,  $0040,  $0060,  $00FC   ; 5F13   0080 0040 0060 00FC
        DECLE   $00FE,  $0055,  $0000,  $0000   ; 5F17   00FE 0055 0000 0000
        DECLE   $0000,  $0080,  $007E,  $00FF   ; 5F1B   0000 0080 007E 00FF
        DECLE   $00FF,  $0076,  $000E,  $001F   ; 5F1F   00FF 0076 000E 001F
        DECLE   $001F,  $00DF,  $006E,  $00F4   ; 5F23   001F 00DF 006E 00F4
        DECLE   $00FE,  $0077,  $000E,  $001F   ; 5F27   00FE 0077 000E 001F
        DECLE   $009F,  $005F,  $006E,  $00F4   ; 5F2B   009F 005F 006E 00F4
        DECLE   $00FE,  $005B,  $000E,  $001F   ; 5F2F   00FE 005B 000E 001F
        DECLE   $009F,  $005F,  $006E,  $00F4   ; 5F33   009F 005F 006E 00F4
        DECLE   $00FE,  $006D,  $0000,  $00C0   ; 5F37   00FE 006D 0000 00C0
        DECLE   $0060,  $00D0,  $00FC,  $00FE   ; 5F3B   0060 00D0 00FC 00FE
        DECLE   $00FF,  $0077,  $0080,  $0040   ; 5F3F   00FF 0077 0080 0040
        DECLE   $0060,  $00D0,  $00FC,  $00FE   ; 5F43   0060 00D0 00FC 00FE
        DECLE   $00FF,  $005B,  $0080,  $0040   ; 5F47   00FF 005B 0080 0040
        DECLE   $0060,  $00D0,  $00FC,  $00FE   ; 5F4B   0060 00D0 00FC 00FE
        DECLE   $00FF,  $006D,  $0000,  $0000   ; 5F4F   00FF 006D 0000 0000
        DECLE   $0000,  $0030,  $0078,  $00FF   ; 5F53   0000 0030 0078 00FF
        DECLE   $00CF,  $0006,  $0000,  $0000   ; 5F57   00CF 0006 0000 0000
        DECLE   $0000,  $000C,  $001E,  $00FF   ; 5F5B   0000 000C 001E 00FF
        DECLE   $00F3,  $0060,  $0000,  $0000   ; 5F5F   00F3 0060 0000 0000
        DECLE   $0000                           ; 5F63   0000

        SWAP    R2,     1                       ; 5F64   0042
        ADDR    R4,     R7                      ; 5F65   00E7

        DECLE   $00FF,  $003C,  $0018,  $0000   ; 5F66   00FF 003C 0018 0000
        DECLE   $0000,  $0008,  $003A,  $004D   ; 5F6A   0000 0008 003A 004D
        DECLE   $0009,  $000C,  $001E,  $0000   ; 5F6E   0009 000C 001E 0000
        DECLE   $00EE,  $0028,  $002C,  $0042   ; 5F72   00EE 0028 002C 0042
        DECLE   $0042,  $004C,  $0000,  $0000   ; 5F76   0042 004C 0000 0000
        DECLE   $004A,  $00D5,  $0055,  $0055   ; 5F7A   004A 00D5 0055 0055
        DECLE   $0055,  $00EA,  $0000,  $0000   ; 5F7E   0055 00EA 0000 0000
        DECLE   $00EA,  $0095,  $00D5,  $0035   ; 5F82   00EA 0095 00D5 0035
        DECLE   $0035,  $00CA,  $0000,  $0000   ; 5F86   0035 00CA 0000 0000
        DECLE   $004A,  $00B5,  $0035,  $0055   ; 5F8A   004A 00B5 0035 0055
        DECLE   $0095,  $00EA,  $0000,  $0000   ; 5F8E   0095 00EA 0000 0000
        DECLE   $00EA,  $0035,  $0035,  $0055   ; 5F92   00EA 0035 0035 0055
        DECLE   $0055,  $004A,  $0000,  $0000   ; 5F96   0055 004A 0000 0000
        DECLE   $00AA,  $00D5,  $00D5,  $00D5   ; 5F9A   00AA 00D5 00D5 00D5
        DECLE   $00D5,  $00AA,  $0000,  $000E   ; 5F9E   00D5 00AA 0000 000E
        DECLE   $001D,  $001F,  $005E,  $002C   ; 5FA2   001D 001F 005E 002C
        DECLE   $003E,  $0014,  $0022,  $0000   ; 5FA6   003E 0014 0022 0000
        DECLE   $0000,  $0000,  $005E,  $002F   ; 5FAA   0000 0000 005E 002F
        DECLE   $003F,  $0014,  $0022,  $0000   ; 5FAE   003F 0014 0022 0000
        DECLE   $0000,  $0000,  $0050,  $002F   ; 5FB2   0000 0000 0050 002F
        DECLE   $003F,  $001F,  $002E,  $0000   ; 5FB6   003F 001F 002E 0000
        DECLE   $004E,  $00A8,  $002C,  $0042   ; 5FBA   004E 00A8 002C 0042
        DECLE   $0082,  $00EC,  $0000,  $0000   ; 5FBE   0082 00EC 0000 0000
        DECLE   $00E4,  $008A,  $00CA,  $002A   ; 5FC2   00E4 008A 00CA 002A
        DECLE   $002A,  $00C4,  $0000,  $0000   ; 5FC6   002A 00C4 0000 0000
        DECLE   $0068,  $001A,  $000D,  $000C   ; 5FCA   0068 001A 000D 000C
        DECLE   $0008,  $000C,  $001E,  $0000   ; 5FCE   0008 000C 001E 0000
        DECLE   $00F0,  $00FC,  $00FE,  $001F   ; 5FD2   00F0 00FC 00FE 001F
        DECLE   $003B,  $003C,  $0018,  $0000   ; 5FD6   003B 003C 0018 0000
        DECLE   $00E0,  $00F8,  $00FC,  $001E   ; 5FDA   00E0 00F8 00FC 001E
        DECLE   $003F,  $003F,  $001A,  $0000   ; 5FDE   003F 003F 001A 0000
        DECLE   $00A0,  $0078,  $00D4,  $002A   ; 5FE2   00A0 0078 00D4 002A
        DECLE   $0015,  $003A,  $001A,  $0000   ; 5FE6   0015 003A 001A 0000
        DECLE   $0020,  $0068,  $0090,  $000A   ; 5FEA   0020 0068 0090 000A
        DECLE   $0011,  $0030,  $0008,  $0000   ; 5FEE   0011 0030 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF2   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5FF6   0000 0000

        RRC     R0,     2                       ; 5FF8   0074
        NEGR    R0                              ; 5FF9   0020
        NEGR    R0                              ; 5FFA   0020
        RLC     R0,     2                       ; 5FFB   0054
        SLL     R2,     1                       ; 5FFC   004A
        SLL     R0,     2                       ; 5FFD   004C
        NEGR    R0                              ; 5FFE   0020
        NEGR    R0                              ; 5FFF   0020
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5023       <entry>
;;  $5051       $5054  
;;  $505B       $505D  
;;  $5062       $506C  
;;  $5074       $5068  
;;  $5079       $50C3  
;;  $5091       $5082  
;;  $509F       $5097  
;;  $50B0       $508A   $508F  
;;  $50BD       $50B7   $50C5  
;;  $50D4       $50A8  
;;  $50EF       $50E6  
;;  $50F5       $50ED  
;;  $50FD       $50F7  
;;  $510D       $5116  
;;  $514A       $516D  
;;  $514F       $512C  
;;  $5151       $5123  
;;  $516D       $5166  
;;  $5185       $5175   $5191  
;;  $51A1       $51A4  
;;  $51B0       $5188  
;;  $51C4       $51C0  
;;  $51D5       $51E1  
;;  $51DF       $51DA  
;;  $51E6       $51E8  
;;  $51FB       $51C9   $51D6  
;;  $5200       $5156   $515C   $5171  
;;  $5222       $50E2   $50FB   $50FF   $5203   $5209   $5211  
;;  $522E       $5151   $54B3  
;;  $5235       $5233  
;;  $523B       $5091  
;;  $5240       $5268  
;;  $524F       $5249  
;;  $5254       $524C  
;;  $5259       $5256  
;;  $525E       $5251   $525B  
;;  $5275       $52A7  
;;  $5276       $52AB  
;;  $5281       $527C  
;;  $5286       $527F  
;;  $5297       $5284   $528B  
;;  $52AF       $5323  
;;  $52BE       $52C4  
;;  $52C3       $52CA  
;;  $52C6       $52BF  
;;  $52E9       $52DB  
;;  $5302       $52E7  
;;  $530F       $52D7   $530B  
;;  $531C       $5300  
;;  $5320       $52BA   $52C1  
;;  $532A       $53C0  
;;  $5348       $5344  
;;  $534A       $53BA  
;;  $5366       $5360  
;;  $5367       $5369  
;;  $536C       $5364  
;;  $5372       $5374  
;;  $5390       $537F  
;;  $53A3       $539C  
;;  $53A6       $5398   $53A1  
;;  $53B3       $534F   $535A   $535E   $5376   $538E   $53A7  
;;  $53BD       $532F   $5336   $533D  
;;  $5405       $5403  
;;  $540E       $540C  
;;  $5421       $541F  
;;  $5439       $5437  
;;  $5447       $5445  
;;  $5473       $508C   $509F  
;;  $5486       $547F  
;;  $548E       $5488  
;;  $5493       $548C  
;;  $5499       $5457  
;;  $54B1       $54AF  
;;  $54C0       $549A   $549E  
;;  $54D4       $54CF  
;;  $54DA       $54CB  
;;  $54E3       $54D8  
;;  $54EC       $5449  
;;  $54FD       $54F2  
;;  $552E       $54D2   $54E1   $54E5   $54EC   $54F7  
;;  $5541       $5479   $5497   $54A2  
;;  $5562       $5099  
;;  $5571       $556F  
;;  $557B       $5576  
;;  $557F       $55FA  
;;  $5585       $558B   $5676  
;;  $558F       $5587  
;;  $55D3       $55CD  
;;  $55E2       $55DE  
;;  $55EF       $55EA  
;;  $55F6       $5603  
;;  $55FE       $55D7  
;;  $5605       $55DB  
;;  $5614       $560E  
;;  $5617       $561D  
;;  $5626       $5620  
;;  $5627       $5607  
;;  $562F       $5624   $5669  
;;  $563C       $5628  
;;  $5643       $563A  
;;  $5645       $5641  
;;  $5656       $5650  
;;  $5659       $564C  
;;  $5665       $565F  
;;  $5672       $55D1  
;;  $5673       $55C7   $5612   $5654  
;;  $5674       $5630   $5663   $566F  
;;  $5678       $558D   $55FC  
;;  $5686       $567C  
;;  $56AD       $5684   $568C   $569A   $569F  
;;  $56B4       $56B2  
;;  $56B5       $56B3  
;;  $56B7       $56B5  
;;  $56BE       $55EC   $5AC1  
;;  $56C8       $56C9  
;;  $56CE       $56D0  
;;  $56DD       $51F8  
;;  $56ED       $56E4  
;;  $5705       $5700  
;;  $5706       $5704  
;;  $5717       $56EB  
;;  $5718       $570C   $5D26  
;;  $571C       $5720  
;;  $572B       $56E1   $5C06  
;;  $572D       $54E9   $56E8  
;;  $572E       $5736  
;;  $5739       $5730  
;;  $576D       $5770  
;;  $5781       $5784  
;;  $5789       $579E  
;;  $578B       $5797  
;;  $57A3       $5764  
;;  $57AD       $57A9  
;;  $57C5       $57F9  
;;  $57C9       $57D7  
;;  $57CB       $57EF  
;;  $57D1       $57B2   $57F2  
;;  $57E8       $57E2  
;;  $57FB       $5762  
;;  $5805       $57FF  
;;  $5808       $5B71  
;;  $580A       $57A1  
;;  $580C       $5B7A  
;;  $5812       $581B  
;;  $5821       $5B75  
;;  $5833       $584B   $5854  
;;  $5838       $584F  
;;  $5856       $5808  
;;  $5858       $5899  
;;  $5873       $586E   $58A3   $58AC  
;;  $5896       $5871   $5877   $587B  
;;  $589B       $57D3   $5803   $591C  
;;  $58A2       $58A0   $58A8   $58BD   $58D0   $5957   $595F  
;;  $58E0       $58DE  
;;  $58E2       $58D9  
;;  $58F0       $58EC  
;;  $58F6       $58F9  
;;  $5907       $58F2  
;;  $5961       $50A5  
;;  $5965       $596F   $599D  
;;  $5973       $596C  
;;  $5976       $596A   $5971  
;;  $5977       $5974  
;;  $597B       $5998  
;;  $5980       $5982  
;;  $598A       $597E  
;;  $5992       $5988   $598B  
;;  $5996       $5990  
;;  $59AE       $53B0   $5B19  
;;  $59AF       $51AD  
;;  $59C4       $59BC  
;;  $59C5       $59B7   $59C3  
;;  $59C8       $50BD   $5C11   $5C42  
;;  $59CD       $59D4  
;;  $59D2       $59CE  
;;  $59D9       $5076  
;;  $59DA       $5118  
;;  $59E1       $59E5  
;;  $59E8       $59F6  
;;  $59F4       $59EC   $59F0  
;;  $5A1A       $5A22  
;;  $5A22       $5A1C  
;;  $5A29       $5A44  
;;  $5A6C       $50A2  
;;  $5A6F       $5A95  
;;  $5A7A       $5A9B   $5ACD  
;;  $5A89       $5AED  
;;  $5A91       $5AFF  
;;  $5A92       $5A72   $5A78   $5AC5   $5AEB   $5B1C  
;;  $5A98       $5A85  
;;  $5A9D       $5A83  
;;  $5ABC       $5AB4  
;;  $5AC7       $5AA9   $5AAD   $5AB8  
;;  $5AD5       $5AD2  
;;  $5ADB       $5AD8  
;;  $5AE5       $5AE3  
;;  $5BFE       $509C  
;;  $5C23       $5C1F  
;;  $5C6C       $5C68  
;;  $5C80       $5C04   $5C09   $5C0F   $5C18  
;;  $5C82       $5DAE  
;;  $5CD4       $5CCE  
;;  $5CDF       $5CCC  
;;  $5CE9       $5CDD  
;;  $5CEE       $5CA9   $5CAD   $5CBC   $5CC0   $5CC4   $5CC8   $5CD2   $5CDB  
;;  $5CEE       $5CE2  
;;  $5CF0       $59A1  
;;  $5D05       $5CFB  
;;  $5D0E       $5D1C  
;;  $5D15       $5D10  
;;  $5D16       $5D14  
;;  $5D24       $5D19  
;;  $5D2B       $5D22  
;;  $5D3E       $5D3A  
;;  $5D48       $5D4A  
;;  $5D4C       $5D54  
;;  $5D53       $5D4F  
;;  $5D5B       $5D5F  
;;  $5D67       $5D33   $5D44   $5D62  
;;  $5D69       $5CF8  
;;  $5D79       $5D69  
;;  $5D84       $5D7C  
;;  $5D87       $5D73   $5D77   $5D82  
;;  $5D88       $5D67  
;;  $5DA1       $5DA4  
;;  $5DAA       $5C86   $5C90  
;;  $5DCF       $5DCD  
;;  $5DDB       $5338   $5AA5   $5CB6  
;;  $5E2E       $5E2C  
;; ======================================================================== ;;
