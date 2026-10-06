
        ORG     $5000
.HEADER:
        PSHR    R5                              ; 5000   0275

        JSR     R5,     G_7FD5                  ; 5001   0004 017C 03D5

        SDBD                                    ; 5004   0001
        ANDI    #$3FFF, R0                      ; 5005   03B8 00FF 003F
        MVO     R0,     G_0347                  ; 5008   0240 0347
        MVO     R0,     G_0349                  ; 500A   0240 0349
        CLRR    R0                              ; 500C   01C0
        MVO     R0,     G_0348                  ; 500D   0240 0348
        MVII    #$0191, R4                      ; 500F   02BC 0191
        MVO@    R0,     R4                      ; 5011   0260
        MVO@    R0,     R4                      ; 5012   0260
        MVO@    R0,     R4                      ; 5013   0260
        MVII    #$034B, R4                      ; 5014   02BC 034B
        MVII    #$0006, R0                      ; 5016   02B8 0006

        JSR     R5,     L_6F9A                  ; 5018   0004 016C 039A

        MVII    #$0102, R4                      ; 501B   02BC 0102
        ADDI    #$0016, R4                      ; 501D   02FC 0016
        MVII    #$0002, R0                      ; 501F   02B8 0002
        MVO@    R0,     R4                      ; 5021   0260
        MVO@    R0,     R4                      ; 5022   0260
        ADDI    #$002E, R4                      ; 5023   02FC 002E
        CLRR    R0                              ; 5025   01C0
        MVO@    R0,     R4                      ; 5026   0260
        MVO@    R0,     R4                      ; 5027   0260
        MVII    #$0102, R3                      ; 5028   02BB 0102
L_502A:
        MVI@    R3,     R2                      ; 502A   029A
        ANDI    #$000F, R2                      ; 502B   03BA 000F
        CMPI    #$0001, R2                      ; 502D   037A 0001
        BNEQ    L_5035                          ; 502F   020C 0004

        CLRR    R0                              ; 5031   01C0
        MVO@    R0,     R3                      ; 5032   0258
        B       L_503A                          ; 5033   0200 0005

L_5035:
        CMPI    #$000F, R2                      ; 5035   037A 000F
        BEQ     L_503A                          ; 5037   0204 0001

        MVO@    R2,     R3                      ; 5039   025A
L_503A:
        INCR    R3                              ; 503A   000B
        CMPI    #$011A, R3                      ; 503B   037B 011A
        BNEQ    L_502A                          ; 503D   022C 0014

        CLRR    R0                              ; 503F   01C0
        MVO     R0,     G_0152                  ; 5040   0240 0152
        MVI     G_016C, R0                      ; 5042   0280 016C
        TSTR    R0                              ; 5044   0080
        BNEQ    L_507A                          ; 5045   020C 0033

        MVI     G_0347, R1                      ; 5047   0281 0347
        SLL     R1,     1                       ; 5049   0049
        SWAP    R1,     1                       ; 504A   0041
        ANDI    #$00FF, R1                      ; 504B   03B9 00FF
        MVO     R1,     G_016E                  ; 504D   0241 016E
        SLL     R1,     1                       ; 504F   0049
        SDBD                                    ; 5050   0001
        ADDI    #$6501, R1                      ; 5051   02F9 0001 0065
        CLRR    R0                              ; 5054   01C0
        MVO     R0,     G_016C                  ; 5055   0240 016C

L_5057:
        JSR     R5,     L_51D6                  ; 5057   0004 0150 01D6
        JSR     R5,     L_51D6                  ; 505A   0004 0150 01D6
        JSR     R5,     L_51EA                  ; 505D   0004 0150 01EA

        INCR    R0                              ; 5060   0008
        CMPI    #$0014, R0                      ; 5061   0378 0014
        BNEQ    L_5057                          ; 5063   022C 000D

        MVI     G_0347, R0                      ; 5065   0280 0347
        ANDI    #$0070, R0                      ; 5067   03B8 0070
        MOVR    R0,     R1                      ; 5069   0081
        SLL     R0,     2                       ; 506A   004C
        SDBD                                    ; 506B   0001
        ADDI    #$691D, R0                      ; 506C   02F8 001D 0069
        MVO     R0,     G_034A                  ; 506F   0240 034A
        SLR     R1,     2                       ; 5071   0065
        SLR     R1,     2                       ; 5072   0065
        SDBD                                    ; 5073   0001
        ADDI    #$5288, R1                      ; 5074   02F9 0088 0052
        MVI@    R1,     R1                      ; 5077   0289
        MVO     R1,     G_0177                  ; 5078   0241 0177
L_507A:
        PULR    R7                              ; 507A   02B7
L_507B:
        PSHR    R5                              ; 507B   0275
        MVI     G_0347, R0                      ; 507C   0280 0347
        XOR     G_0349, R0                      ; 507E   03C0 0349
        SDBD                                    ; 5080   0001
        ANDI    #$FF80, R0                      ; 5081   03B8 0080 00FF
        BEQ     L_51B6                          ; 5084   0204 0130

        MVII    #$02A0, R4                      ; 5086   02BC 02A0
        MVII    #$000A, R0                      ; 5088   02B8 000A
        MVI     G_016D, R1                      ; 508A   0281 016D
        TSTR    R1                              ; 508C   0089
        BNEQ    L_5124                          ; 508D   020C 0095

        MVI     G_016C, R2                      ; 508F   0282 016C
        TSTR    R2                              ; 5091   0092
        BNEQ    L_50FE                          ; 5092   020C 006A

        JSR     R5,     L_520F                  ; 5094   0004 0150 020F

        CLRR    R0                              ; 5097   01C0
        MVO     R0,     .BTAB.B3                ; 5098   0240 02B3
        MVO     R0,     .BTAB.C7                ; 509A   0240 02C7
        NOP                                     ; 509C   0034
        MVO     R0,     .BTAB.DB                ; 509D   0240 02DB
        MVO     R0,     .BTAB.EF                ; 509F   0240 02EF
        MVI     G_0347, R1                      ; 50A1   0281 0347
        SLL     R1,     1                       ; 50A3   0049
        SWAP    R1,     1                       ; 50A4   0041
        ANDI    #$00FF, R1                      ; 50A5   03B9 00FF
        MVO     R1,     G_016E                  ; 50A7   0241 016E
        ADDI    #$0013, R1                      ; 50A9   02F9 0013
        SLL     R1,     1                       ; 50AB   0049
        SDBD                                    ; 50AC   0001
        ADDI    #$6501, R1                      ; 50AD   02F9 0001 0065
        MVII    #$0013, R0                      ; 50B0   02B8 0013

        JSR     R5,     L_51D6                  ; 50B2   0004 0150 01D6
        JSR     R5,     L_51D6                  ; 50B5   0004 0150 01D6
        JSR     R5,     L_51EA                  ; 50B8   0004 0150 01EA

        MVII    #$0191, R3                      ; 50BB   02BB 0191
L_50BD:
        MVI@    R3,     R2                      ; 50BD   029A
        CMPI    #$00A0, R2                      ; 50BE   037A 00A0
        BMI     L_50F9                          ; 50C0   020B 0037

        ADDI    #$0200, R2                      ; 50C2   02FA 0200
        MOVR    R2,     R1                      ; 50C4   0091
        ADDI    #$0003, R3                      ; 50C5   02FB 0003
        MVI@    R3,     R5                      ; 50C7   029D
        MOVR    R5,     R0                      ; 50C8   00A8
        ANDI    #$0007, R5                      ; 50C9   03BD 0007
        DECR    R5                              ; 50CB   0015
        SWAP    R0,     2                       ; 50CC   0044
        BPL     L_50D2                          ; 50CD   0203 0003

        SUBR    R5,     R1                      ; 50CF   0129
        B       L_50DD                          ; 50D0   0200 000B

L_50D2:
        ADDR    R5,     R2                      ; 50D2   00EA
        ADDI    #$0003, R3                      ; 50D3   02FB 0003
        MVI@    R3,     R5                      ; 50D5   029D
        SUBI    #$0003, R3                      ; 50D6   033B 0003
        ADDI    #$0200, R5                      ; 50D8   02FD 0200
        CMPR    R5,     R1                      ; 50DA   0169
        BEQ     L_50F0                          ; 50DB   0204 0013

L_50DD:
        DECR    R1                              ; 50DD   0011
        MVI@    R1,     R0                      ; 50DE   0288
        ANDI    #$0004, R0                      ; 50DF   03B8 0004
        BEQ     L_50EE                          ; 50E1   0204 000B

        MVI@    R1,     R0                      ; 50E3   0288
        SWAP    R0,     1                       ; 50E4   0040
        SLR     R0,     2                       ; 50E5   0064
        ANDI    #$0038, R0                      ; 50E6   03B8 0038
        SDBD                                    ; 50E8   0001
        ADDI    #$0802, R0                      ; 50E9   02F8 0002 0008
        B       L_50EF                          ; 50EC   0200 0001

L_50EE:
        CLRR    R0                              ; 50EE   01C0
L_50EF:
        MVO@    R0,     R1                      ; 50EF   0248
L_50F0:
        MVI@    R3,     R4                      ; 50F0   029C
        ANDI    #$0038, R4                      ; 50F1   03BC 0038
        MOVR    R2,     R1                      ; 50F3   0091

        JSR     R5,     L_6231                  ; 50F4   0004 0160 0231

        SUBI    #$0003, R3                      ; 50F7   033B 0003
L_50F9:
        INCR    R3                              ; 50F9   000B
        CMPI    #$0194, R3                      ; 50FA   037B 0194
        BNEQ    L_50BD                          ; 50FC   022C 0040

L_50FE:
        MVII    #$034B, R3                      ; 50FE   02BB 034B
        SDBD                                    ; 5100   0001
        MVII    #$09A3, R4                      ; 5101   02BC 00A3 0009
        CLRR    R5                              ; 5104   01ED
L_5105:
        MVI@    R3,     R2                      ; 5105   029A
        MOVR    R2,     R1                      ; 5106   0091
        BEQ     L_5115                          ; 5107   0204 000C

        ANDI    #$03FF, R1                      ; 5109   03B9 03FF
        MVO@    R5,     R1                      ; 510B   024D
        DECR    R1                              ; 510C   0011
        SDBD                                    ; 510D   0001
        SUBI    #$0401, R2                      ; 510E   033A 0001 0004
        BMI     L_511C                          ; 5111   020B 0009

        MVO@    R4,     R1                      ; 5113   024C
        MVO@    R2,     R3                      ; 5114   025A
L_5115:
        INCR    R3                              ; 5115   000B
        CMPI    #$0351, R3                      ; 5116   037B 0351
        BNEQ    L_5105                          ; 5118   022C 0014
        B       L_51B6                          ; 511A   0200 009A

L_511C:
        MVO@    R5,     R3                      ; 511C   025D
        INCR    R3                              ; 511D   000B
        CMPI    #$0351, R3                      ; 511E   037B 0351
        BNEQ    L_5105                          ; 5120   022C 001C
        B       L_51B6                          ; 5122   0200 0092

L_5124:
        MVI     G_016C, R2                      ; 5124   0282 016C
        TSTR    R2                              ; 5126   0092
        BNEQ    L_518E                          ; 5127   020C 0065

        JSR     R5,     L_5226                  ; 5129   0004 0150 0226

        CLRR    R0                              ; 512C   01C0
        MVO     R0,     .BTAB.A0                ; 512D   0240 02A0
        MVO     R0,     .BTAB.B4                ; 512F   0240 02B4
        NOP                                     ; 5131   0034
        MVO     R0,     .BTAB.C8                ; 5132   0240 02C8
        MVO     R0,     .BTAB.DC                ; 5134   0240 02DC
        MVI     G_0347, R1                      ; 5136   0281 0347
        SLL     R1,     1                       ; 5138   0049
        SWAP    R1,     1                       ; 5139   0041
        ANDI    #$00FF, R1                      ; 513A   03B9 00FF
        MVO     R1,     G_016E                  ; 513C   0241 016E
        SLL     R1,     1                       ; 513E   0049
        SDBD                                    ; 513F   0001
        ADDI    #$6501, R1                      ; 5140   02F9 0001 0065

        JSR     R5,     L_51D6                  ; 5143   0004 0150 01D6
        JSR     R5,     L_51D6                  ; 5146   0004 0150 01D6
        JSR     R5,     L_51EA                  ; 5149   0004 0150 01EA

        MVII    #$0191, R3                      ; 514C   02BB 0191
L_514E:
        MVI@    R3,     R2                      ; 514E   029A
        CMPI    #$00A0, R2                      ; 514F   037A 00A0
        BMI     L_5189                          ; 5151   020B 0036

        ADDI    #$0200, R2                      ; 5153   02FA 0200
        MOVR    R2,     R1                      ; 5155   0091
L_5156:
        ADDI    #$0003, R3                      ; 5156   02FB 0003
        MVI@    R3,     R5                      ; 5158   029D
        MOVR    R5,     R0                      ; 5159   00A8
        ANDI    #$0007, R5                      ; 515A   03BD 0007
        DECR    R5                              ; 515C   0015
        SWAP    R0,     2                       ; 515D   0044
        BPL     L_516D                          ; 515E   0203 000D

        SUBR    R5,     R1                      ; 5160   0129
        ADDI    #$0003, R3                      ; 5161   02FB 0003
        MVI@    R3,     R5                      ; 5163   029D
        SUBI    #$0003, R3                      ; 5164   033B 0003
        ADDI    #$0200, R5                      ; 5166   02FD 0200
        CMPR    R5,     R2                      ; 5168   016A
        BEQ     L_5181                          ; 5169   0204 0016
        B       L_516E                          ; 516B   0200 0001

L_516D:
        ADDR    R5,     R2                      ; 516D   00EA
L_516E:
        INCR    R2                              ; 516E   000A
        MVI@    R2,     R0                      ; 516F   0290
        ANDI    #$0004, R0                      ; 5170   03B8 0004
        BEQ     L_517F                          ; 5172   0204 000B

        MVI@    R2,     R0                      ; 5174   0290
        SWAP    R0,     1                       ; 5175   0040
        SLR     R0,     2                       ; 5176   0064
        ANDI    #$0038, R0                      ; 5177   03B8 0038
        SDBD                                    ; 5179   0001
        ADDI    #$0802, R0                      ; 517A   02F8 0002 0008
        B       L_5180                          ; 517D   0200 0001

L_517F:
        CLRR    R0                              ; 517F   01C0
L_5180:
        MVO@    R0,     R2                      ; 5180   0250
L_5181:
        MVI@    R3,     R4                      ; 5181   029C
        ANDI    #$0038, R4                      ; 5182   03BC 0038

        JSR     R5,     L_6231                  ; 5184   0004 0160 0231

        SUBI    #$0003, R3                      ; 5187   033B 0003
L_5189:
        INCR    R3                              ; 5189   000B
        CMPI    #$0194, R3                      ; 518A   037B 0194
        BNEQ    L_514E                          ; 518C   022C 003F

L_518E:
        MVII    #$034B, R3                      ; 518E   02BB 034B
        SDBD                                    ; 5190   0001
        MVII    #$09A3, R4                      ; 5191   02BC 00A3 0009
        CLRR    R5                              ; 5194   01ED
L_5195:
        MVI@    R3,     R2                      ; 5195   029A
        MOVR    R2,     R1                      ; 5196   0091
        BEQ     L_51A9                          ; 5197   0204 0010

        ANDI    #$03FF, R1                      ; 5199   03B9 03FF
        MVO@    R5,     R1                      ; 519B   024D
        INCR    R1                              ; 519C   0009
        SDBD                                    ; 519D   0001
        ADDI    #$0401, R2                      ; 519E   02FA 0001 0004
        SDBD                                    ; 51A1   0001
        CMPI    #$5000, R2                      ; 51A2   037A 0000 0050
        BPL     L_51B0                          ; 51A5   0203 0009

        MVO@    R4,     R1                      ; 51A7   024C
        MVO@    R2,     R3                      ; 51A8   025A
L_51A9:
        INCR    R3                              ; 51A9   000B
        CMPI    #$0351, R3                      ; 51AA   037B 0351
        BNEQ    L_5195                          ; 51AC   022C 0018
        B       L_51B6                          ; 51AE   0200 0006

L_51B0:
        MVO@    R5,     R3                      ; 51B0   025D
        INCR    R3                              ; 51B1   000B
        CMPI    #$0351, R3                      ; 51B2   037B 0351
        BNEQ    L_5195                          ; 51B4   022C 0020

L_51B6:
        MVI     G_0348, R0                      ; 51B6   0280 0348
        SWAP    R0,     1                       ; 51B8   0040
        ANDI    #$0080, R0                      ; 51B9   03B8 0080
        MVO     R0,     G_016D                  ; 51BB   0240 016D

        JSR     R5,     L_523C                  ; 51BD   0004 0150 023C

        MVI     G_0347, R0                      ; 51C0   0280 0347
        ANDI    #$0070, R0                      ; 51C2   03B8 0070
        MOVR    R0,     R1                      ; 51C4   0081
        SLL     R0,     2                       ; 51C5   004C
        SDBD                                    ; 51C6   0001
        ADDI    #$691D, R0                      ; 51C7   02F8 001D 0069
        MVO     R0,     G_034A                  ; 51CA   0240 034A
        SLR     R1,     2                       ; 51CC   0065
        SLR     R1,     2                       ; 51CD   0065
        SDBD                                    ; 51CE   0001
        ADDI    #$5288, R1                      ; 51CF   02F9 0088 0052
        MVI@    R1,     R1                      ; 51D2   0289
        MVO     R1,     G_0177                  ; 51D3   0241 0177
        PULR    R7                              ; 51D5   02B7
L_51D6:
        MVI@    R1,     R2                      ; 51D6   028A
        INCR    R1                              ; 51D7   0009
        MOVR    R2,     R3                      ; 51D8   0093
        BEQ     L_51E9                          ; 51D9   0204 000E

        SLR     R3,     2                       ; 51DB   0067
        SLR     R3,     2                       ; 51DC   0067
        ANDI    #$0038, R3                      ; 51DD   03BB 0038
        SDBD                                    ; 51DF   0001
        ADDI    #$0802, R3                      ; 51E0   02FB 0002 0008
        ANDI    #$007F, R2                      ; 51E3   03BA 007F
        ADDI    #$028C, R2                      ; 51E5   02FA 028C
L_51E7:
        ADDR    R0,     R2                      ; 51E7   00C2
        MVO@    R3,     R2                      ; 51E8   0253
L_51E9:
        MOVR    R5,     R7                      ; 51E9   00AF
L_51EA:
        MOVR    R0,     R2                      ; 51EA   0082
        ADD     G_016E, R2                      ; 51EB   02C2 016E
        CMPI    #$00A0, R2                      ; 51ED   037A 00A0
        BMI     L_51F3                          ; 51EF   020B 0002

        SUBI    #$00A0, R2                      ; 51F1   033A 00A0
L_51F3:
        MVII    #$016F, R4                      ; 51F3   02BC 016F
        MVII    #$0008, R3                      ; 51F5   02BB 0008
L_51F7:
        CMP@    R4,     R2                      ; 51F7   0362
        BEQ     L_51FE                          ; 51F8   0204 0004

        DECR    R3                              ; 51FA   0013
        BNEQ    L_51F7                          ; 51FB   022C 0005

        MOVR    R5,     R7                      ; 51FD   00AF
L_51FE:
        MOVR    R4,     R2                      ; 51FE   00A2
        MVII    #$02DC, R3                      ; 51FF   02BB 02DC
        ADDR    R0,     R3                      ; 5201   00C3
        SDBD                                    ; 5202   0001
        MVII    #$09ED, R4                      ; 5203   02BC 00ED 0009
        DECR    R2                              ; 5206   0012
        SUBI    #$016F, R2                      ; 5207   033A 016F
        SARC    R2,     2                       ; 5209   007E
        RRC     R2,     2                       ; 520A   0076
        RRC     R2,     1                       ; 520B   0072
        ADDR    R2,     R4                      ; 520C   00D4
        MVO@    R4,     R3                      ; 520D   025C
        MOVR    R5,     R7                      ; 520E   00AF
L_520F:
        PSHR    R5                              ; 520F   0275
        MOVR    R4,     R5                      ; 5210   00A5
        INCR    R5                              ; 5211   000D
L_5212:
        MVI@    R5,     R1                      ; 5212   02A9
        MVO@    R1,     R4                      ; 5213   0261
        MVI@    R5,     R1                      ; 5214   02A9
        MVO@    R1,     R4                      ; 5215   0261
        MVI@    R5,     R1                      ; 5216   02A9
        MVO@    R1,     R4                      ; 5217   0261
        MVI@    R5,     R1                      ; 5218   02A9
        MVO@    R1,     R4                      ; 5219   0261
        MVI@    R5,     R1                      ; 521A   02A9
        MVO@    R1,     R4                      ; 521B   0261
        MVI@    R5,     R1                      ; 521C   02A9
        MVO@    R1,     R4                      ; 521D   0261
        MVI@    R5,     R1                      ; 521E   02A9
        MVO@    R1,     R4                      ; 521F   0261
        MVI@    R5,     R1                      ; 5220   02A9
        MVO@    R1,     R4                      ; 5221   0261
        DECR    R0                              ; 5222   0010
        BNEQ    L_5212                          ; 5223   022C 0012

        PULR    R7                              ; 5225   02B7
L_5226:
        PSHR    R5                              ; 5226   0275
        MOVR    R4,     R5                      ; 5227   00A5
L_5228:
        MVI@    R5,     R1                      ; 5228   02A9
        MVO@    R2,     R4                      ; 5229   0262
        MVI@    R5,     R2                      ; 522A   02AA
        MVO@    R1,     R4                      ; 522B   0261
        MVI@    R5,     R1                      ; 522C   02A9
        MVO@    R2,     R4                      ; 522D   0262
        MVI@    R5,     R2                      ; 522E   02AA
        MVO@    R1,     R4                      ; 522F   0261
        MVI@    R5,     R1                      ; 5230   02A9
        MVO@    R2,     R4                      ; 5231   0262
        MVI@    R5,     R2                      ; 5232   02AA
        MVO@    R1,     R4                      ; 5233   0261
        MVI@    R5,     R1                      ; 5234   02A9
        MVO@    R2,     R4                      ; 5235   0262
        MVI@    R5,     R2                      ; 5236   02AA
        MVO@    R1,     R4                      ; 5237   0261
        DECR    R0                              ; 5238   0010
        BNEQ    L_5228                          ; 5239   022C 0012

        PULR    R7                              ; 523B   02B7
L_523C:
        MVI     G_0347, R0                      ; 523C   0280 0347
        MVO     R0,     G_0349                  ; 523E   0240 0349
        ADD     G_0348, R0                      ; 5240   02C0 0348
        MVO     R0,     G_0347                  ; 5242   0240 0347
L_5244:
        BPL     L_524D                          ; 5244   0203 0007

        SDBD                                    ; 5246   0001
        ADDI    #$5000, R0                      ; 5247   02F8 0000 0050
        MVO     R0,     G_0347                  ; 524A   0240 0347
        MOVR    R5,     R7                      ; 524C   00AF
L_524D:
        SDBD                                    ; 524D   0001
        CMPI    #$5000, R0                      ; 524E   0378 0000 0050
        BMI     L_5259                          ; 5251   020B 0006

        SDBD                                    ; 5253   0001
        SUBI    #$5000, R0                      ; 5254   0338 0000 0050
        MVO     R0,     G_0347                  ; 5257   0240 0347
L_5259:
        MOVR    R5,     R7                      ; 5259   00AF
L_525A:
        MOVR    R5,     R0                      ; 525A   00A8
        MVI     G_034A, R5                      ; 525B   0285 034A
        SDBD                                    ; 525D   0001
        MVII    #$3800, R4                      ; 525E   02BC 0000 0038
        MVII    #$0008, R1                      ; 5261   02B9 0008
L_5263:
        MVI@    R5,     R3                      ; 5263   02AB
        MVO@    R3,     R4                      ; 5264   0263
        MVI@    R5,     R3                      ; 5265   02AB
        MVO@    R3,     R4                      ; 5266   0263
        MVI@    R5,     R3                      ; 5267   02AB
        MVO@    R3,     R4                      ; 5268   0263
        MVI@    R5,     R3                      ; 5269   02AB
        MVO@    R3,     R4                      ; 526A   0263
        MVI@    R5,     R3                      ; 526B   02AB
        MVO@    R3,     R4                      ; 526C   0263
        MVI@    R5,     R3                      ; 526D   02AB
        MVO@    R3,     R4                      ; 526E   0263
        MVI@    R5,     R3                      ; 526F   02AB
        MVO@    R3,     R4                      ; 5270   0263
        MVI@    R5,     R3                      ; 5271   02AB
        MVO@    R3,     R4                      ; 5272   0263
        DECR    R1                              ; 5273   0011
        BNEQ    L_5263                          ; 5274   022C 0012

        MVI     G_0177, R1                      ; 5276   0281 0177
        SDBD                                    ; 5278   0001
        MVII    #$39A0, R4                      ; 5279   02BC 00A0 0039
        MVO@    R1,     R4                      ; 527C   0261
        MVO@    R1,     R4                      ; 527D   0261
        SDBD                                    ; 527E   0001
        MVII    #$39E8, R4                      ; 527F   02BC 00E8 0039
        MVO@    R1,     R4                      ; 5282   0261
        INCR    R4                              ; 5283   000C
        MVO@    R1,     R4                      ; 5284   0261
        MVO@    R1,     R4                      ; 5285   0261
        MVO@    R1,     R4                      ; 5286   0261
        MOVR    R0,     R7                      ; 5287   0087
        DECLE   $0001                           ; 5288   0001

        EIS                                     ; 5289   0002

        JSR     R4,     G_0810                  ; 528A   0004 0008 0010

        NEGR    R0                              ; 528D   0020
        SWAP    R0,     1                       ; 528E   0040
        TSTR    R0                              ; 528F   0080
L_5290:
        MVI@    R5,     R0                      ; 5290   02A8
        MVO     R0,     G_0349                  ; 5291   0240 0349
        PSHR    R5                              ; 5293   0275
        SDBD                                    ; 5294   0001
        MVII    #$52A8, R0                      ; 5295   02B8 00A8 0052
        MVO     R0,     .ISRVEC.0               ; 5298   0240 0100
        SWAP    R0,     1                       ; 529A   0040
        MVO     R0,     .ISRVEC.1               ; 529B   0240 0101
        CLRR    R0                              ; 529D   01C0
        MVO     R0,     G_0347                  ; 529E   0240 0347
L_52A0:
        EIS                                     ; 52A0   0002
        MVI     G_0347, R0                      ; 52A1   0280 0347
        ANDI    #$0080, R0                      ; 52A3   03B8 0080
        BEQ     L_52A0                          ; 52A5   0224 0006

        PULR    R7                              ; 52A7   02B7
        PSHR    R5                              ; 52A8   0275
        DIS                                     ; 52A9   0003
        SDBD                                    ; 52AA   0001
        MVII    #$53C0, R4                      ; 52AB   02BC 00C0 0053
        SDBD                                    ; 52AE   0001
        MVII    #$3800, R5                      ; 52AF   02BD 0000 0038
L_52B2:
        MVI@    R4,     R0                      ; 52B2   02A0
        MOVR    R0,     R1                      ; 52B3   0081
        SWAP    R1,     1                       ; 52B4   0041
        ANDI    #$0003, R1                      ; 52B5   03B9 0003
L_52B7:
        MVO@    R0,     R5                      ; 52B7   0268
        DECR    R1                              ; 52B8   0011
        BPL     L_52B7                          ; 52B9   0223 0003

        SDBD                                    ; 52BB   0001
        CMPI    #$3A00, R5                      ; 52BC   037D 0000 003A
        BLT     L_52B2                          ; 52BF   0225 000E

        SDBD                                    ; 52C1   0001
        MVII    #$54FC, R4                      ; 52C2   02BC 00FC 0054
        CLRR    R5                              ; 52C5   01ED
        MVII    #$000C, R3                      ; 52C6   02BB 000C
L_52C8:
        MVI@    R4,     R0                      ; 52C8   02A0
        MVO@    R0,     R5                      ; 52C9   0268
        DECR    R3                              ; 52CA   0013
        BNEQ    L_52C8                          ; 52CB   022C 0004

        MVII    #$000C, R3                      ; 52CD   02BB 000C
L_52CF:
        SDBD                                    ; 52CF   0001
        MVI@    R4,     R0                      ; 52D0   02A0
        MVO@    R0,     R5                      ; 52D1   0268
        DECR    R3                              ; 52D2   0013
L_52D3:
        BNEQ    L_52CF                          ; 52D3   022C 0005

        CLRR    R0                              ; 52D5   01C0
        MVO     R0,     .STIC.HDLY              ; 52D6   0240 0030
        MVO     R0,     .STIC.VDLY              ; 52D8   0240 0031
        MVO     R0,     .STIC.EDGE              ; 52DA   0240 0032
        MVO     R0,     .STIC.BORD              ; 52DC   0240 002C
        MVO     R0,     .STIC.MODE              ; 52DE   0240 0021
        CLRR    R1                              ; 52E0   01C9
        MVII    #$0200, R4                      ; 52E1   02BC 0200
L_52E3:
        MVO@    R1,     R4                      ; 52E3   0261
        CMPI    #$02F0, R4                      ; 52E4   037C 02F0
        BLT     L_52E3                          ; 52E6   0225 0004

        SDBD                                    ; 52E8   0001
        MVII    #$5520, R4                      ; 52E9   02BC 0020 0055
L_52EC:
        MVI@    R4,     R5                      ; 52EC   02A5
        SDBD                                    ; 52ED   0001
        CMPI    #$5598, R4                      ; 52EE   037C 0098 0055
        BGT     L_5310                          ; 52F1   020E 001D

L_52F3:
        MVI@    R4,     R0                      ; 52F3   02A0
        PSHR    R4                              ; 52F4   0274
        MOVR    R0,     R1                      ; 52F5   0081
        MOVR    R0,     R2                      ; 52F6   0082
        MOVR    R0,     R4                      ; 52F7   0084
        ANDI    #$01F8, R0                      ; 52F8   03B8 01F8
        ANDI    #$0003, R4                      ; 52FA   03BC 0003
        ANDI    #$0004, R2                      ; 52FC   03BA 0004
        SWAP    R2,     1                       ; 52FE   0042
        SLL     R2,     1                       ; 52FF   004A
        XORR    R2,     R0                      ; 5300   01D0
        ADDR    R4,     R4                      ; 5301   00E4
        SDBD                                    ; 5302   0001
        ADDI    #$5598, R4                      ; 5303   02FC 0098 0055
        SDBD                                    ; 5306   0001
        XOR@    R4,     R0                      ; 5307   03E0
        MVO@    R0,     R5                      ; 5308   0268
        PULR    R4                              ; 5309   02B4
        CMPI    #$0200, R1                      ; 530A   0379 0200
        BLT     L_52F3                          ; 530C   0225 001A
        B       L_52EC                          ; 530E   0220 0023

L_5310:
        MVII    #$0001, R0                      ; 5310   02B8 0001
        MVO     R0,     .BTAB.00                ; 5312   0240 0200
        MVO     R0,     .BTAB.01                ; 5314   0240 0201
        MVII    #$0007, R0                      ; 5316   02B8 0007
        MVO     R0,     .BTAB.02                ; 5318   0240 0202
        SDBD                                    ; 531A   0001
        MVII    #$5325, R0                      ; 531B   02B8 0025 0053
        MVO     R0,     .ISRVEC.0               ; 531E   0240 0100
        SWAP    R0,     1                       ; 5320   0040
        MVO     R0,     .ISRVEC.1               ; 5321   0240 0101
        EIS                                     ; 5323   0002
        PULR    R7                              ; 5324   02B7
        PSHR    R5                              ; 5325   0275
        MVO     R0,     .STIC.VIDEN             ; 5326   0240 0020
        MVI     .BTAB.00,R0                     ; 5328   0280 0200
        DECR    R0                              ; 532A   0010
        MVO     R0,     .BTAB.00                ; 532B   0240 0200
        BNEQ    L_537B                          ; 532D   020C 004C

        MVII    #$0002, R0                      ; 532F   02B8 0002
        MVO     R0,     .BTAB.00                ; 5331   0240 0200
        MVI     .BTAB.02,R1                     ; 5333   0281 0202
        INCR    R1                              ; 5335   0009
        ANDI    #$0007, R1                      ; 5336   03B9 0007
        MVO     R1,     .BTAB.02                ; 5338   0241 0202
        BEQ     L_5345                          ; 533A   0204 0009

        DECR    R1                              ; 533C   0011
        SDBD                                    ; 533D   0001
        ADDI    #$39B0, R1                      ; 533E   02F9 00B0 0039
        CLRR    R0                              ; 5341   01C0
        MVO@    R0,     R1                      ; 5342   0248
        B       L_537B                          ; 5343   0200 0036

L_5345:
        MVII    #$0008, R2                      ; 5345   02BA 0008
        MVII    #$00FF, R0                      ; 5347   02B8 00FF
        SDBD                                    ; 5349   0001
        MVII    #$39B0, R4                      ; 534A   02BC 00B0 0039
L_534D:
        MVO@    R0,     R4                      ; 534D   0260
        DECR    R2                              ; 534E   0012
        BNEQ    L_534D                          ; 534F   022C 0003

        SDBD                                    ; 5351   0001
        MVII    #$55B8, R5                      ; 5352   02BD 00B8 0055
        MVI     .BTAB.03,R4                     ; 5355   0284 0203
        DECR    R4                              ; 5357   0014
        BPL     L_535C                          ; 5358   0203 0002

        MVII    #$0005, R4                      ; 535A   02BC 0005
L_535C:
        MVO     R4,     .BTAB.03                ; 535C   0244 0203
        ADDR    R4,     R4                      ; 535E   00E4
        SDBD                                    ; 535F   0001
        ADDI    #$55A0, R4                      ; 5360   02FC 00A0 0055
L_5363:
        SDBD                                    ; 5363   0001
        MVI@    R5,     R1                      ; 5364   02A9
        SDBD                                    ; 5365   0001
        MVI@    R4,     R2                      ; 5366   02A2
L_5367:
        MVI@    R1,     R3                      ; 5367   028B
        TSTR    R3                              ; 5368   009B
        BEQ     L_5375                          ; 5369   0204 000A

        MVI@    R3,     R0                      ; 536B   0298
L_536C:
        SDBD                                    ; 536C   0001
        ANDI    #$09F8, R0                      ; 536D   03B8 00F8 0009
        XORR    R2,     R0                      ; 5370   01D0
        MVO@    R0,     R3                      ; 5371   0258
        INCR    R1                              ; 5372   0009
        B       L_5367                          ; 5373   0220 000D

L_5375:
        SDBD                                    ; 5375   0001
        CMPI    #$55C2, R5                      ; 5376   037D 00C2 0055
        BNEQ    L_5363                          ; 5379   022C 0017

L_537B:
        MVI     .BTAB.01,R0                     ; 537B   0280 0201
        DECR    R0                              ; 537D   0010
        MVO     R0,     .BTAB.01                ; 537E   0240 0201
        BNEQ    L_539A                          ; 5380   020C 0018

        MVII    #$0003, R0                      ; 5382   02B8 0003
        MVO     R0,     .BTAB.01                ; 5384   0240 0201
        MVII    #$028F, R4                      ; 5386   02BC 028F
        MVII    #$0022, R3                      ; 5388   02BB 0022
        MVI@    R4,     R1                      ; 538A   02A1
        MOVR    R1,     R0                      ; 538B   0088
        INCR    R1                              ; 538C   0009
        ANDI    #$0007, R1                      ; 538D   03B9 0007
L_538F:
        SDBD                                    ; 538F   0001
        ANDI    #$FFF8, R0                      ; 5390   03B8 00F8 00FF
        XORR    R1,     R0                      ; 5393   01C8
        DECR    R4                              ; 5394   0014
        MVO@    R0,     R4                      ; 5395   0260
        MVI@    R4,     R0                      ; 5396   02A0
        DECR    R3                              ; 5397   0013
        BNEQ    L_538F                          ; 5398   022C 000A

L_539A:
        MVII    #$01FE, R5                      ; 539A   02BD 01FE
        MVII    #$00FF, R0                      ; 539C   02B8 00FF
        CMP@    R5,     R0                      ; 539E   0368
        BNEQ    L_53B5                          ; 539F   020C 0014

        CMP@    R5,     R0                      ; 53A1   0368
        BNEQ    L_53B5                          ; 53A2   020C 0011

        MVI     G_0349, R0                      ; 53A4   0280 0349
        DECR    R0                              ; 53A6   0010
        MVO     R0,     G_0349                  ; 53A7   0240 0349
        BNEQ    L_53BC                          ; 53A9   020C 0011

        MVII    #$01FF, R5                      ; 53AB   02BD 01FF
        MVO     R5,     G_0181                  ; 53AD   0245 0181
        MVII    #$00FF, R0                      ; 53AF   02B8 00FF
        MVO     R0,     G_0347                  ; 53B1   0240 0347
        B       L_53BC                          ; 53B3   0200 0007

L_53B5:
        DECR    R5                              ; 53B5   0015
        MVO     R5,     G_0181                  ; 53B6   0245 0181
        MVII    #$0080, R0                      ; 53B8   02B8 0080
        MVO     R0,     G_0347                  ; 53BA   0240 0347

L_53BC:
        JSR     R5,     G_7FD5                  ; 53BC   0004 017C 03D5

        PULR    R7                              ; 53BF   02B7
        SUBR    R0,     R0                      ; 53C0   0100

        JSR     R4,     .STIC.Y.6               ; 53C1   0004 0000 000E
        DECLE   $0000                           ; 53C4   0000

        COMR    R7                              ; 53C5   001F
        DECLE   $0000                           ; 53C6   0000

        SUBR    R0,     R0                      ; 53C7   0100
        COMR    R7                              ; 53C8   001F
        DECLE   $0000                           ; 53C9   0000

        COMR    R7                              ; 53CA   001F
        DECLE   $0000,  $0001,  $0000           ; 53CB   0000 0001 0000

        SUBR    R0,     R0                      ; 53CE   0100
        ADDR    R7,     R4                      ; 53CF   00FC
        DECLE   $0000                           ; 53D0   0000

        ADDR    R7,     R4                      ; 53D1   00FC
        DECLE   $0000                           ; 53D2   0000

        ADDR    R0,     R0                      ; 53D3   00C0
        DECLE   $0000                           ; 53D4   0000

        SUBR    R0,     R0                      ; 53D5   0100
        DECR    R0                              ; 53D6   0010
        DECLE   $0000                           ; 53D7   0000

        RSWD    R0                              ; 53D8   0038
        DECLE   $0000                           ; 53D9   0000

        SARC    R0,     2                       ; 53DA   007C
        DECLE   $0000                           ; 53DB   0000

        SUBR    R0,     R0                      ; 53DC   0100
        DIS                                     ; 53DD   0003
        DECLE   $0000                           ; 53DE   0000

        SETC                                    ; 53DF   0007
        DECLE   $0000                           ; 53E0   0000

        SETC                                    ; 53E1   0007
        DECLE   $0000                           ; 53E2   0000

        SUBR    R0,     R0                      ; 53E3   0100
        ADDR    R6,     R0                      ; 53E4   00F0
        DECLE   $0000                           ; 53E5   0000

        COMR    R4                              ; 53E6   001C
        DECLE   $0000                           ; 53E7   0000

        COMR    R4                              ; 53E8   001C
        DECLE   $0000                           ; 53E9   0000

        SUBR    R0,     R0                      ; 53EA   0100
        INCR    R6                              ; 53EB   000E
        DECLE   $0000                           ; 53EC   0000

        INCR    R6                              ; 53ED   000E
        DECLE   $0000                           ; 53EE   0000

        INCR    R6                              ; 53EF   000E
        DECLE   $0000                           ; 53F0   0000

        RSWD    R3                              ; 53F1   003B
        DECLE   $0000                           ; 53F2   0000

        SARC    R3,     2                       ; 53F3   007F
        DECLE   $0000                           ; 53F4   0000

        ADDR    R4,     R0                      ; 53F5   00E0
        B       L_5479                          ; 53F6   0200 0081

        DECLE   $0000                           ; 53F8   0000

        ADDR    R0,     R1                      ; 53F9   00C1
        DECLE   $0000                           ; 53FA   0000

        ADDR    R4,     R1                      ; 53FB   00E1
        B       L_54BE                          ; 53FC   0200 00C0

        DECLE   $0000                           ; 53FE   0000

        ADDR    R0,     R1                      ; 53FF   00C1
        DECLE   $0000                           ; 5400   0000

        ADDR    R0,     R3                      ; 5401   00C3
        B       L_54F2                          ; 5402   0200 00EE

        DECLE   $0000                           ; 5404   0000

        ADDR    R7,     R7                      ; 5405   00FF
        DECLE   $0000                           ; 5406   0000

        MOVR    R0,     R3                      ; 5407   0083
        B       L_5411                          ; 5408   0200 0007

        DECLE   $0000                           ; 540A   0000

        SETC                                    ; 540B   0007
        DECLE   $0000                           ; 540C   0000

        MOVR    R0,     R7                      ; 540D   0087
        B       L_5480                          ; 540E   0200 0070

        DECLE   $0000                           ; 5410   0000
L_5411:
        COMR    R4                              ; 5411   001C
        DECLE   $0000                           ; 5412   0000

        INCR    R6                              ; 5413   000E
        B       L_5424                          ; 5414   0200 000E

        DECLE   $0000                           ; 5416   0000

        INCR    R6                              ; 5417   000E
        DECLE   $0000                           ; 5418   0000

        INCR    R6                              ; 5419   000E
        B       L_541C                          ; 541A   0200 0000

L_541C:
        DECLE   $0001                           ; 541C   0001

        DIS                                     ; 541D   0003
        SETC                                    ; 541E   0007
        INCR    R7                              ; 541F   000F
        COMR    R7                              ; 5420   001F
        RSWD    R7                              ; 5421   003F
        SARC    R3,     2                       ; 5422   007F
        XORI    #$00EF, R7                      ; 5423   03FF 00EF
        ADDR    R3,     R7                      ; 5425   00DF
        MOVR    R3,     R6                      ; 5426   009E
        RSWD    R6                              ; 5427   003E
        COMR    R7                              ; 5428   001F
        MOVR    R3,     R7                      ; 5429   009F
        ANDR    R7,     R7                      ; 542A   01BF
        CMPR    R7,     R7                      ; 542B   017F
        CLRR    R7                              ; 542C   01FF
        XORR    R7,     R5                      ; 542D   01FD
        XORR    R7,     R3                      ; 542E   01FB
        DIS                                     ; 542F   0003
        ADDR    R0,     R7                      ; 5430   00C7
        ANDR    R0,     R7                      ; 5431   0187
        XORI    #$00E0, R7                      ; 5432   03FF 00E0
        ADDI    #$03BF, R4                      ; 5434   02FC 03BF
        CMPR    R7,     R7                      ; 5436   017F
        CLRR    R7                              ; 5437   01FF
        XOR@    R6,     R7                      ; 5438   03F7
        SETC                                    ; 5439   0007
        ADD     G_008E, R7                      ; 543A   02C7 008E
        XORR    R1,     R6                      ; 543C   01CE
        ADDR    R5,     R6                      ; 543D   00EE
        ADDR    R5,     R7                      ; 543E   00EF
        ADDI    #$03FF, R7                      ; 543F   02FF 03FF
        SARC    R1,     1                       ; 5441   0079
        DECLE   $027C                           ; 5442   027C
L_5443:
        SETC                                    ; 5443   0007
        ADDR    R0,     R7                      ; 5444   00C7
        ADDR    R4,     R3                      ; 5445   00E3
        ADDR    R6,     R3                      ; 5446   00F3
        ADDR    R7,     R3                      ; 5447   00FB
        ADDI    #$01FE, R5                      ; 5448   02FD 01FE
        CLRR    R7                              ; 544A   01FF
        ADDR    R6,     R0                      ; 544B   00F0
        ADDR    R7,     R6                      ; 544C   00FE
        CLRR    R7                              ; 544D   01FF
        CLRR    R7                              ; 544E   01FF
        CMPR    R7,     R7                      ; 544F   017F
        RSWD    R5                              ; 5450   003D
        RSWD    R4                              ; 5451   003C
        SUBR    R3,     R7                      ; 5452   011F
        DECLE   $0000                           ; 5453   0000

        ADDR    R0,     R0                      ; 5454   00C0
        XORR    R4,     R0                      ; 5455   01E0
        ADD@    R6,     R0                      ; 5456   02F0
        ADDR    R7,     R4                      ; 5457   00FC
        ADDR    R7,     R6                      ; 5458   00FE
        ADDR    R7,     R4                      ; 5459   00FC
        ADDR    R7,     R1                      ; 545A   00F9
        XORI    #$00FF, R7                      ; 545B   03FF 00FF
        SARC    R1,     2                       ; 545D   007D
        ADDR    R7,     R5                      ; 545E   00FD
        XORR    R7,     R3                      ; 545F   01FB
        ADDR    R6,     R7                      ; 5460   00F7
        ADDR    R4,     R7                      ; 5461   00E7
        ADDR    R1,     R7                      ; 5462   00CF
        INCR    R7                              ; 5463   000F
        ADDR    R7,     R7                      ; 5464   00FF
        XORR    R6,     R0                      ; 5465   01F0
        XORI    #$00FF, R7                      ; 5466   03FF 00FF
        BESC    L_5749                          ; 5468   020F 02DF

        ANDR    R7,     R7                      ; 546A   01BF
        ADDR    R7,     R0                      ; 546B   00F8
        MVI     G_0301, R0                      ; 546C   0280 0301
        ADDR    R7,     R7                      ; 546E   00FF
        XORR    R7,     R0                      ; 546F   01F8
        XORI    #$00FF, R7                      ; 5470   03FF 00FF
        ADDR    R0,     R7                      ; 5472   00C7
        SUBR    R0,     R7                      ; 5473   0107
        XOR@    R6,     R7                      ; 5474   03F7
        ADDR    R6,     R7                      ; 5475   00F7
        ADDI    #$00DF, R7                      ; 5476   02FF 00DF
        XORR    R1,     R7                      ; 5478   01CF
L_5479:
        XORR    R0,     R7                      ; 5479   01C7
        MOVR    R7,     R4                      ; 547A   00BC
        ANDR    R7,     R6                      ; 547B   01BE
        TSTR    R7                              ; 547C   00BF
        XOR@    R3,     R7                      ; 547D   03DF
        DECLE   $027E                           ; 547E   027E

        ADDI    #$00FE, R7                      ; 547F   02FF 00FE
        ADDR    R7,     R4                      ; 5481   00FC
        ADDR    R7,     R7                      ; 5482   00FF
        ADDR    R7,     R0                      ; 5483   00F8
        ADDR    R7,     R4                      ; 5484   00FC
        DECLE   $027F                           ; 5485   027F

        SUBR    R7,     R7                      ; 5486   013F
        MOVR    R1,     R7                      ; 5487   008F
        INCR    R7                              ; 5488   000F
        SETC                                    ; 5489   0007
        ADDR    R6,     R7                      ; 548A   00F7
        XORR    R7,     R3                      ; 548B   01FB
        XORR    R7,     R5                      ; 548C   01FD
        CLRR    R7                              ; 548D   01FF
        ADDR    R3,     R7                      ; 548E   00DF
        ADDR    R1,     R7                      ; 548F   00CF
        ADDR    R4,     R7                      ; 5490   00E7
        ADDR    R4,     R3                      ; 5491   00E3
        ADDR    R6,     R1                      ; 5492   00F1
        ADDR    R6,     R0                      ; 5493   00F0
        DECLE   $0000                           ; 5494   0000

        TSTR    R0                              ; 5495   0080
        ADDR    R0,     R0                      ; 5496   00C0
        ADDR    R4,     R0                      ; 5497   00E0
        ADDR    R6,     R0                      ; 5498   00F0
        ADDR    R7,     R0                      ; 5499   00F8
        ADDR    R7,     R4                      ; 549A   00FC
        ADDR    R7,     R6                      ; 549B   00FE
        XORI    #$00FF, R7                      ; 549C   03FF 00FF
        B       L_569F                          ; 549E   0200 01FF

        ADDR    R5,     R7                      ; 54A0   00EF
        ADDR    R1,     R7                      ; 54A1   00CF
        INCR    R7                              ; 54A2   000F
        B       L_57A4                          ; 54A3   0200 02FF

        ANDR    R7,     R7                      ; 54A5   01BF
        B       L_589F                          ; 54A6   0200 03F7

        ADDR    R6,     R7                      ; 54A8   00F7
        B       L_558A                          ; 54A9   0200 00DF

        XORR    R1,     R7                      ; 54AB   01CF
        XORR    R0,     R7                      ; 54AC   01C7
        B       L_55AE                          ; 54AD   0200 00FF

        XOR@    R3,     R7                      ; 54AF   03DF
        B       L_57B1                          ; 54B0   0200 02FF

        ADDR    R7,     R6                      ; 54B2   00FE
        ADDR    R7,     R0                      ; 54B3   00F8
        B       L_5735                          ; 54B4   0200 027F

        SUBR    R7,     R7                      ; 54B6   013F
        B       L_57B8                          ; 54B7   0200 02FF

        XORR    R7,     R5                      ; 54B9   01FD
        B       L_55BB                          ; 54BA   0200 00FF

        ADDR    R6,     R7                      ; 54BC   00F7
        ADDR    R6,     R3                      ; 54BD   00F3
L_54BE:
        ADDR    R6,     R1                      ; 54BE   00F1
        ADDR    R6,     R0                      ; 54BF   00F0
        B       L_5543                          ; 54C0   0200 0081

        SUB     .BTAB.00,R1                     ; 54C2   0301 0200
        RSWD    R6                              ; 54C4   003E
        SWAP    R1,     1                       ; 54C5   0041
        SLLC    R1,     2                       ; 54C6   005D
        RLC     R1,     2                       ; 54C7   0055
        SLLC    R1,     1                       ; 54C8   0059
        RLC     R1,     2                       ; 54C9   0055
        SWAP    R1,     1                       ; 54CA   0041
        RSWD    R6                              ; 54CB   003E
        SARC    R0,     2                       ; 54CC   007C
        MOVR    R0,     R2                      ; 54CD   0082
        MOVR    R7,     R2                      ; 54CE   00BA
        ANDR    R4,     R2                      ; 54CF   01A2
        MOVR    R7,     R2                      ; 54D0   00BA
        MOVR    R0,     R2                      ; 54D1   0082
        SARC    R0,     2                       ; 54D2   007C
        XORI    #$03FF, R7                      ; 54D3   03FF 03FF
        SUB@    R6,     R0                      ; 54D5   0330
        DECLE   $0230,  $0000                   ; 54D6   0230 0000

        XORI    #$00FF, R7                      ; 54D8   03FF 00FF
        ADDR    R7,     R6                      ; 54DA   00FE
        ADDR    R7,     R0                      ; 54DB   00F8
        ADDR    R4,     R0                      ; 54DC   00E0
        SUB     .ISRVEC.0,R0                    ; 54DD   0300 0100
        DIS                                     ; 54DF   0003
        COMR    R7                              ; 54E0   001F
        ADDR    R7,     R6                      ; 54E1   00FE
        ADDR    R7,     R4                      ; 54E2   00FC
        ADDR    R7,     R0                      ; 54E3   00F8
        ADDR    R4,     R0                      ; 54E4   00E0
        TSTR    R0                              ; 54E5   0080
        B       L_54E8                          ; 54E6   0200 0000

L_54E8:
        DECLE   $0001                           ; 54E8   0001

        DIS                                     ; 54E9   0003
        INCR    R7                              ; 54EA   000F
        RSWD    R7                              ; 54EB   003F
        ADDI    #$01F3, R7                      ; 54EC   02FF 01F3
        XORR    R4,     R3                      ; 54EE   01E3
        XORR    R0,     R3                      ; 54EF   01C3
        MOVR    R0,     R3                      ; 54F0   0083
        DIS                                     ; 54F1   0003
L_54F2:
        SUBR    R0,     R3                      ; 54F2   0103
        SUBR    R0,     R7                      ; 54F3   0107
        INCR    R7                              ; 54F4   000F
        COMR    R7                              ; 54F5   001F
        RSWD    R7                              ; 54F6   003F
        SARC    R3,     2                       ; 54F7   007F
        XOR@    R6,     R3                      ; 54F8   03F3
        XOR@    R6,     R3                      ; 54F9   03F3
        XOR@    R6,     R3                      ; 54FA   03F3
        XOR@    R6,     R3                      ; 54FB   03F3
        SUBI    #$0340, R0                      ; 54FC   0338 0340
        CMP@    R1,     R0                      ; 54FE   0348
        CMP@    R1,     R0                      ; 54FF   0348
        CMP@    R5,     R0                      ; 5500   0368
        CMP@    R4,     R0                      ; 5501   0360
        CMP@    R3,     R0                      ; 5502   0358
L_5503:
        CMP@    R3,     R0                      ; 5503   0358
        ANDR    R4,     R0                      ; 5504   01A0
        ANDR    R4,     R0                      ; 5505   01A0
        ANDR    R3,     R0                      ; 5506   0198
        ANDR    R1,     R0                      ; 5507   0188
        MOVR    R4,     R0                      ; 5508   00A0
        DECLE   $0005                           ; 5509   0005

        MOVR    R4,     R0                      ; 550A   00A0
        DECLE   $0005                           ; 550B   0005

        MOVR    R3,     R0                      ; 550C   0098
        DECLE   $0005                           ; 550D   0005

        MOVR    R1,     R0                      ; 550E   0088
        DECLE   $0005                           ; 550F   0005

        ADDR    R0,     R0                      ; 5510   00C0
        INCR    R1                              ; 5511   0009
        ADDR    R2,     R0                      ; 5512   00D0
        INCR    R1                              ; 5513   0009
        ADDR    R4,     R0                      ; 5514   00E0
        INCR    R1                              ; 5515   0009
        ADDR    R6,     R0                      ; 5516   00F0
        INCR    R1                              ; 5517   0009
        ADDR    R0,     R0                      ; 5518   00C0
        INCR    R1                              ; 5519   0009
        ADDR    R2,     R0                      ; 551A   00D0
        INCR    R1                              ; 551B   0009
        ADDR    R4,     R0                      ; 551C   00E0
        INCR    R1                              ; 551D   0009
        ADDR    R6,     R0                      ; 551E   00F0
        INCR    R1                              ; 551F   0009
        SKIP                                    ; 5520   0208
        ANDR    R6,     R6                      ; 5521   01B6
        ANDR    R6,     R6                      ; 5522   01B6
        AND@    R6,     R6                      ; 5523   03B6
        DECLE   $021C                           ; 5524   021C

        ANDR    R6,     R6                      ; 5525   01B6
        ANDR    R6,     R6                      ; 5526   01B6
        AND@    R6,     R6                      ; 5527   03B6
        DECLE   $0230                           ; 5528   0230

        ANDR    R6,     R6                      ; 5529   01B6
        ANDR    R6,     R6                      ; 552A   01B6
        AND@    R6,     R6                      ; 552B   03B6
        MVO     R2,     G_01B6                  ; 552C   0242 01B6
        ANDR    R6,     R6                      ; 552E   01B6
        ANDR    R6,     R6                      ; 552F   01B6
        ANDR    R6,     R6                      ; 5530   01B6
        ANDR    R6,     R6                      ; 5531   01B6
L_5532:
        ANDR    R6,     R6                      ; 5532   01B6
        AND@    R6,     R6                      ; 5533   03B6
        MVO@    R6,     R2                      ; 5534   0256
        ANDR    R6,     R6                      ; 5535   01B6
        ANDR    R6,     R6                      ; 5536   01B6
        DECLE   $0000                           ; 5537   0000

        ANDR    R6,     R6                      ; 5538   01B6
        DECLE   $0000                           ; 5539   0000
L_553A:
        ANDR    R6,     R6                      ; 553A   01B6
        AND@    R6,     R6                      ; 553B   03B6
        MVO@    R2,     R5                      ; 553C   026A
        CLRC                                    ; 553D   0006
        INCR    R6                              ; 553E   000E
L_553F:
        DECR    R6                              ; 553F   0016
        COMR    R6                              ; 5540   001E
        NEGR    R6                              ; 5541   0026
        ADCR    R6                              ; 5542   002E
L_5543:
        DECLE   $0036                           ; 5543   0036

        AND@    R4,     R6                      ; 5544   03A6
L_5545:
        DECLE   $027E                           ; 5545   027E

        RSWD    R6                              ; 5546   003E
        SWAP    R2,     2                       ; 5547   0046
        SLL     R2,     2                       ; 5548   004E
        RLC     R2,     2                       ; 5549   0056
        SLLC    R2,     2                       ; 554A   005E
        SLR     R2,     2                       ; 554B   0066
        MVO@    R6,     R5                      ; 554C   026E
        MVI@    R1,     R7                      ; 554D   028F
        RRC     R1,     2                       ; 554E   0075
        SARC    R3,     2                       ; 554F   007F
        MOVR    R0,     R5                      ; 5550   0085
        MOVR    R1,     R7                      ; 5551   008F
        MOVR    R2,     R7                      ; 5552   0097
        MOVR    R3,     R5                      ; 5553   009D
        MOVR    R4,     R7                      ; 5554   00A7
L_5555:
        TSTR    R5                              ; 5555   00AD
        MOVR    R6,     R7                      ; 5556   00B7
        MOVR    R7,     R5                      ; 5557   00BD
        ADDR    R0,     R7                      ; 5558   00C7
        ADDR    R1,     R7                      ; 5559   00CF
        ADD@    R2,     R5                      ; 555A   02D5
        MVI@    R4,     R2                      ; 555B   02A2
        RRC     R1,     2                       ; 555C   0075
        ADDR    R3,     R7                      ; 555D   00DF
        ADDR    R4,     R7                      ; 555E   00E7
        ADDR    R5,     R7                      ; 555F   00EF
        ADDR    R6,     R7                      ; 5560   00F7
        ADDR    R7,     R7                      ; 5561   00FF
        SUBR    R0,     R7                      ; 5562   0107
        SUBR    R1,     R7                      ; 5563   010F
        SUBR    R2,     R7                      ; 5564   0117
        SUBR    R3,     R7                      ; 5565   011F
        SUBR    R4,     R7                      ; 5566   0127
        SUBR    R5,     R7                      ; 5567   012F
        SUBR    R6,     R7                      ; 5568   0137
        SUBR    R7,     R7                      ; 5569   013F
        CMP     .BTAB.B6,R5                     ; 556A   0345 02B6
        CMPR    R1,     R4                      ; 556C   014C
        CMPR    R1,     R4                      ; 556D   014C
        CMPR    R2,     R4                      ; 556E   0154
        CMPR    R1,     R4                      ; 556F   014C
        CMPR    R3,     R4                      ; 5570   015C
        ANDR    R3,     R4                      ; 5571   019C
        CMPR    R1,     R4                      ; 5572   014C
        CMPR    R4,     R4                      ; 5573   0164
        CMPR    R5,     R4                      ; 5574   016C
        CMPR    R6,     R4                      ; 5575   0174
        CMPR    R7,     R4                      ; 5576   017C
        ANDR    R0,     R4                      ; 5577   0184
        ANDR    R1,     R4                      ; 5578   018C
        ANDR    R2,     R4                      ; 5579   0194
        CMP@    R1,     R4                      ; 557A   034C
        ADD@    R1,     R4                      ; 557B   02CC
        ANDR    R5,     R6                      ; 557C   01AE
        MOVR    R1,     R2                      ; 557D   008A
        ADDR    R1,     R2                      ; 557E   00CA
        ADDR    R0,     R2                      ; 557F   00C2
        MOVR    R3,     R2                      ; 5580   009A
        DECLE   $0000,  $0000                   ; 5581   0000 0000

        SUBR    R1,     R2                      ; 5583   010A
        ANDR    R4,     R2                      ; 5584   01A2
        SUBR    R1,     R2                      ; 5585   010A
        ANDR    R2,     R2                      ; 5586   0192
        ANDI    #$02DE, R6                      ; 5587   03BE 02DE
        ANDR    R5,     R6                      ; 5589   01AE
L_558A:
        MOVR    R1,     R2                      ; 558A   008A
        ADDR    R1,     R2                      ; 558B   00CA
        ADDR    R0,     R2                      ; 558C   00C2
L_558D:
        MOVR    R0,     R2                      ; 558D   0082
        DECLE   $0000,  $0000                   ; 558E   0000 0000

        ANDR    R7,     R2                      ; 5590   01BA
        CMPR    R1,     R2                      ; 5591   014A
        CMPR    R4,     R2                      ; 5592   0162
        CMPR    R4,     R2                      ; 5593   0162
        CMPR    R1,     R2                      ; 5594   014A
        SUBR    R1,     R2                      ; 5595   010A
        CMPR    R5,     R2                      ; 5596   016A
        AND@    R3,     R2                      ; 5597   039A
        EIS                                     ; 5598   0002
        DECLE   $0000                           ; 5599   0000

        CLRC                                    ; 559A   0006
        DECLE   $0000,  $0001,  $0000           ; 559B   0000 0001 0000

        CLRC                                    ; 559E   0006

        JSRE    R4,     .STIC.X.4               ; 559F   0004 0001 0004
        JSRD    R4,     .STIC.X.5               ; 55A2   0004 0002 0005

        NEGR    R0                              ; 55A5   0020
        CLRC                                    ; 55A6   0006
        NEGR    R2                              ; 55A7   0022
        DIS                                     ; 55A8   0003
        NEGR    R4                              ; 55A9   0024
        EIS                                     ; 55AA   0002
        CLRC                                    ; 55AB   0006
        DECLE   $0001                           ; 55AC   0001

        JSR     R4,     G_0402                  ; 55AD   0004 0004 0002
        DECLE   $0005                           ; 55B0   0005

        NEGR    R0                              ; 55B1   0020
        CLRC                                    ; 55B2   0006
        NEGR    R2                              ; 55B3   0022
        DIS                                     ; 55B4   0003
L_55B5:
        NEGR    R4                              ; 55B5   0024
        EIS                                     ; 55B6   0002
        CLRC                                    ; 55B7   0006
        ADDR    R0,     R2                      ; 55B8   00C2
        RLC     R1,     2                       ; 55B9   0055
        ADDR    R0,     R6                      ; 55BA   00C6
L_55BB:
        RLC     R1,     2                       ; 55BB   0055
        ADDR    R1,     R2                      ; 55BC   00CA
        RLC     R1,     2                       ; 55BD   0055
        ADDR    R1,     R6                      ; 55BE   00CE
        RLC     R1,     2                       ; 55BF   0055
        ADDR    R2,     R6                      ; 55C0   00D6
        RLC     R1,     2                       ; 55C1   0055
        SKIP                                    ; 55C2   0208
        BNC     L_57CF                          ; 55C3   0209 020A

        DECLE   $0000                           ; 55C5   0000
L_55C6:
        DECLE   $021C,  $021D,  $021E,  $0000   ; 55C6   021C 021D 021E 0000
        DECLE   $0230,  $0231,  $0232,  $0000   ; 55CA   0230 0231 0232 0000

        MVO     R2,     .BTAB.43                ; 55CE   0242 0243
        MVO     R4,     .BTAB.45                ; 55D0   0244 0245
        MVO     R6,     .BTAB.47                ; 55D2   0246 0247
        MVO@    R0,     R1                      ; 55D4   0248
        DECLE   $0000                           ; 55D5   0000

        MVO@    R6,     R2                      ; 55D6   0256
        MVO@    R7,     R2                      ; 55D7   0257
        MVO@    R1,     R3                      ; 55D8   0259
        MVO@    R3,     R3                      ; 55D9   025B
        MVO@    R4,     R3                      ; 55DA   025C
        DECLE   $0000                           ; 55DB   0000
L_55DC:
        PSHR    R5                              ; 55DC   0275
        MVI     G_014E, R0                      ; 55DD   0280 014E
        TSTR    R0                              ; 55DF   0080
        BNEQ    L_5720                          ; 55E0   020C 013E

        MVI     G_0181, R2                      ; 55E2   0282 0181
        ADDI    #$0100, R2                      ; 55E4   02FA 0100
        MVII    #$0178, R3                      ; 55E6   02BB 0178
        CLRR    R0                              ; 55E8   01C0
        MVO     R0,     G_017C                  ; 55E9   0240 017C
        COMR    R0                              ; 55EB   0018
        MVO     R0,     G_017D                  ; 55EC   0240 017D
        PSHR    R2                              ; 55EE   0272
        PSHR    R3                              ; 55EF   0273
L_55F0:
        MVI@    R2,     R0                      ; 55F0   0290
        TSTR    R0                              ; 55F1   0080
        BNEQ    L_55F6                          ; 55F2   020C 0002

        MVII    #$00FF, R0                      ; 55F4   02B8 00FF
L_55F6:
        CMP@    R3,     R0                      ; 55F6   0358
        BNEQ    L_5685                          ; 55F7   020C 008C

        CMPI    #$005A, R0                      ; 55F9   0378 005A
        BEQ     L_56BE                          ; 55FB   0204 00C1

        CMPI    #$0076, R0                      ; 55FD   0378 0076
        BEQ     L_5690                          ; 55FF   0204 008F

        CMPI    #$00FF, R0                      ; 5601   0378 00FF
        BEQ     L_5675                          ; 5603   0204 0070

        MOVR    R0,     R1                      ; 5605   0081
        SLL     R1,     2                       ; 5606   004D
        SLL     R1,     1                       ; 5607   0049
        SWAP    R1,     1                       ; 5608   0041
        ANDI    #$0007, R1                      ; 5609   03B9 0007
        INCR    R1                              ; 560B   0009
        ADDR    R7,     R1                      ; 560C   00F9
        ADD@    R1,     R7                      ; 560D   02CF
        DECR    R7                              ; 560E   0017
        DECR    R3                              ; 560F   0013
        INCR    R3                              ; 5610   000B
        RLC     R3,     1                       ; 5611   0053
        INCR    R7                              ; 5612   000F
        RLC     R3,     1                       ; 5613   0053
        RLC     R3,     1                       ; 5614   0053
        INCR    R0                              ; 5615   0008
        CLRR    R1                              ; 5616   01C9
        B       L_5627                          ; 5617   0200 000E

        MVII    #$0001, R1                      ; 5619   02B9 0001
        B       L_5627                          ; 561B   0200 000A

        MVII    #$0002, R1                      ; 561D   02B9 0002
        B       L_5627                          ; 561F   0200 0006

        MVII    #$0004, R1                      ; 5621   02B9 0004
        B       L_5627                          ; 5623   0200 0002

        MVII    #$0007, R1                      ; 5625   02B9 0007
L_5627:
        MVO     R1,     G_017C                  ; 5627   0241 017C
        ANDI    #$001F, R0                      ; 5629   03B8 001F
        CMPI    #$001F, R0                      ; 562B   0378 001F
        BNEQ    L_5635                          ; 562D   020C 0006

        MVII    #$00FF, R3                      ; 562F   02BB 00FF
        MVO     R3,     G_017D                  ; 5631   0243 017D
        B       L_5675                          ; 5633   0200 0040

L_5635:
        MVI     G_017B, R1                      ; 5635   0281 017B
        MOVR    R1,     R2                      ; 5637   008A
        SLR     R2,     2                       ; 5638   0066
        SLR     R2,     2                       ; 5639   0066
        ANDI    #$000F, R1                      ; 563A   03B9 000F
        SDBD                                    ; 563C   0001
        MVII    #$575B, R5                      ; 563D   02BD 005B 0057
        ADDR    R1,     R5                      ; 5640   00CD
        MVII    #$0010, R1                      ; 5641   02B9 0010
L_5643:
        CLRR    R3                              ; 5643   01DB
        CLRR    R4                              ; 5644   01E4
L_5645:
        CMP@    R5,     R0                      ; 5645   0368
        BEQ     L_565D                          ; 5646   0204 0015

        SDBD                                    ; 5648   0001
        CMPI    #$576B, R5                      ; 5649   037D 006B 0057
        BNEQ    L_5652                          ; 564C   020C 0004

        SDBD                                    ; 564E   0001
        MVII    #$575B, R5                      ; 564F   02BD 005B 0057
L_5652:
        INCR    R4                              ; 5652   000C
        CMPR    R4,     R2                      ; 5653   0162
        BNEQ    L_5658                          ; 5654   020C 0002

        CLRR    R4                              ; 5656   01E4
        INCR    R3                              ; 5657   000B
L_5658:
        DECR    R1                              ; 5658   0011
        BNEQ    L_5645                          ; 5659   022C 0015
        B       L_5685                          ; 565B   0200 0028

L_565D:
        MVO     R3,     G_017D                  ; 565D   0243 017D
        B       L_5675                          ; 565F   0200 0014

        SDBD                                    ; 5661   0001
        MVII    #$576B, R4                      ; 5662   02BC 006B 0057
        MVII    #$0080, R1                      ; 5665   02B9 0080
L_5667:
        CMP@    R4,     R0                      ; 5667   0360
        BEQ     L_5673                          ; 5668   0204 0009

        SDBD                                    ; 566A   0001
        CMPI    #$5777, R4                      ; 566B   037C 0077 0057
        BEQ     L_5685                          ; 566E   0204 0015

        INCR    R1                              ; 5670   0009
        B       L_5667                          ; 5671   0220 000B

L_5673:
        MVO     R1,     G_017D                  ; 5673   0241 017D
L_5675:
        PULR    R5                              ; 5675   02B5
        PULR    R2                              ; 5676   02B2
        MVI@    R2,     R0                      ; 5677   0290
        TSTR    R0                              ; 5678   0080
        BNEQ    L_567D                          ; 5679   020C 0002

        MVII    #$00FF, R0                      ; 567B   02B8 00FF
L_567D:
        MVO@    R0,     R5                      ; 567D   0268
        MVI     G_017C, R0                      ; 567E   0280 017C
        MVO@    R0,     R5                      ; 5680   0268
        MVI     G_017D, R0                      ; 5681   0280 017D
        MVO@    R0,     R5                      ; 5683   0268
        PULR    R7                              ; 5684   02B7
L_5685:
        PULR    R5                              ; 5685   02B5
        PSHR    R5                              ; 5686   0275
        INCR    R5                              ; 5687   000D
        MVI@    R5,     R0                      ; 5688   02A8
        MVO     R0,     G_017C                  ; 5689   0240 017C
        MVI@    R5,     R0                      ; 568B   02A8
        MVO     R0,     G_017D                  ; 568C   0240 017D
        B       L_5675                          ; 568E   0220 001A

L_5690:
        JSR     R5,     L_5715                  ; 5690   0004 0154 0315

        CLRR    R0                              ; 5693   01C0
        MVO     R0,     G_017E                  ; 5694   0240 017E
        MVO     R0,     G_017F                  ; 5696   0240 017F
        MVI     .ISRVEC.1,R0                    ; 5698   0280 0101
        PSHR    R0                              ; 569A   0270
        MVI     .ISRVEC.0,R0                    ; 569B   0280 0100
        PSHR    R0                              ; 569D   0270
        SDBD                                    ; 569E   0001
L_569F:
        MVII    #$56FC, R0                      ; 569F   02B8 00FC 0056
        MVO     R0,     .ISRVEC.0               ; 56A2   0240 0100
        SWAP    R0,     1                       ; 56A4   0040
        MVO     R0,     .ISRVEC.1               ; 56A5   0240 0101
        MVII    #$000A, R4                      ; 56A7   02BC 000A
        CLRR    R0                              ; 56A9   01C0
L_56AA:
        MVI@    R2,     R5                      ; 56AA   0295
        CMPI    #$00FF, R5                      ; 56AB   037D 00FF
        BNEQ    L_56AA                          ; 56AD   022C 0004

L_56AF:
        DECR    R0                              ; 56AF   0010
        BEQ     L_56B9                          ; 56B0   0204 0007

        MVI@    R2,     R5                      ; 56B2   0295
        CMPI    #$00FF, R5                      ; 56B3   037D 00FF
        BNEQ    L_56EB                          ; 56B5   020C 0034
        B       L_56AF                          ; 56B7   0220 0009

L_56B9:
        DECR    R4                              ; 56B9   0014
        BNEQ    L_56AF                          ; 56BA   022C 000C
        B       L_56D0                          ; 56BC   0200 0012

L_56BE:
        JSR     R5,     L_5715                  ; 56BE   0004 0154 0315

        MVI     .ISRVEC.1,R0                    ; 56C1   0280 0101
        PSHR    R0                              ; 56C3   0270
        MVI     .ISRVEC.0,R0                    ; 56C4   0280 0100
        PSHR    R0                              ; 56C6   0270
        SDBD                                    ; 56C7   0001
        MVII    #$56FC, R0                      ; 56C8   02B8 00FC 0056
        MVO     R0,     .ISRVEC.0               ; 56CB   0240 0100
        SWAP    R0,     1                       ; 56CD   0040
        MVO     R0,     .ISRVEC.1               ; 56CE   0240 0101
L_56D0:
        MVII    #$0001, R0                      ; 56D0   02B8 0001
        MVO     R0,     G_017E                  ; 56D2   0240 017E
        INCR    R0                              ; 56D4   0008
        MVO     R0,     G_017F                  ; 56D5   0240 017F
L_56D7:
        MVI@    R2,     R5                      ; 56D7   0295
        CMPI    #$00FF, R5                      ; 56D8   037D 00FF
        BNEQ    L_56D7                          ; 56DA   022C 0004

L_56DC:
        MVI@    R2,     R5                      ; 56DC   0295
        CMPI    #$00FF, R5                      ; 56DD   037D 00FF
        BEQ     L_56DC                          ; 56DF   0224 0004

        MVII    #$0002, R0                      ; 56E1   02B8 0002
        MVO     R0,     G_017E                  ; 56E3   0240 017E
L_56E5:
        MVI     G_017E, R0                      ; 56E5   0280 017E
        CMPI    #$0002, R0                      ; 56E7   0378 0002
        BEQ     L_56E5                          ; 56E9   0224 0005

L_56EB:
        MVI@    R2,     R5                      ; 56EB   0295
        CMPI    #$00FF, R5                      ; 56EC   037D 00FF
        BNEQ    L_56EB                          ; 56EE   022C 0004

        PULR    R0                              ; 56F0   02B0
        PULR    R1                              ; 56F1   02B1
        MVO     R0,     .ISRVEC.0               ; 56F2   0240 0100
        MVO     R1,     .ISRVEC.1               ; 56F4   0241 0101
        MVI     G_0180, R0                      ; 56F6   0280 0180
        MVO     R0,     .PSG0.chan_enable       ; 56F8   0240 01F8
        B       L_55F0                          ; 56FA   0220 010B

        MVI     G_017E, R1                      ; 56FC   0281 017E
        INCR    R1                              ; 56FE   0009
        ADDR    R7,     R1                      ; 56FF   00F9
        ADD@    R1,     R7                      ; 5700   02CF
        INCR    R7                              ; 5701   000F
        DIS                                     ; 5702   0003
        INCR    R1                              ; 5703   0009
        CLRR    R0                              ; 5704   01C0
        MVO     R0,     .STIC.BORD              ; 5705   0240 002C
        MVO     R0,     G_017E                  ; 5707   0240 017E
        MOVR    R5,     R7                      ; 5709   00AF
        CLRR    R0                              ; 570A   01C0
        MVO     R0,     .STIC.BORD              ; 570B   0240 002C
        MVO     R0,     G_017E                  ; 570D   0240 017E
        MOVR    R5,     R7                      ; 570F   00AF
        ADD     G_017F, R7                      ; 5710   02C7 017F
        MVO     R0,     .STIC.VIDEN             ; 5712   0240 0020
        MOVR    R5,     R7                      ; 5714   00AF
L_5715:
        MVI     .PSG0.chan_enable,R0            ; 5715   0280 01F8
        MVO     R0,     G_0180                  ; 5717   0240 0180
        ANDI    #$00C0, R0                      ; 5719   03B8 00C0
        XORI    #$003F, R0                      ; 571B   03F8 003F
        MVO     R0,     .PSG0.chan_enable       ; 571D   0240 01F8
        MOVR    R5,     R7                      ; 571F   00AF
L_5720:
        MVII    #$01FE, R5                      ; 5720   02BD 01FE
        MVII    #$00FF, R0                      ; 5722   02B8 00FF
        CMP@    R5,     R0                      ; 5724   0368
        BNEQ    L_574F                          ; 5725   020C 0028

        CMP@    R5,     R0                      ; 5727   0368
        BNEQ    L_574F                          ; 5728   020C 0025

        JSR     R5,     G_7FD5                  ; 572A   0004 017C 03D5

        ANDI    #$03C0, R0                      ; 572D   03B8 03C0
        BNEQ    L_5741                          ; 572F   020C 0010

        JSR     R5,     G_7FD5                  ; 5731   0004 017C 03D5

        TSTR    R0                              ; 5734   0080
L_5735:
        BPL     L_573D                          ; 5735   0203 0006

        ANDI    #$000F, R0                      ; 5737   03B8 000F
        MVO     R0,     G_017A                  ; 5739   0240 017A
        B       L_5741                          ; 573B   0200 0004

L_573D:
        MVII    #$00FF, R0                      ; 573D   02B8 00FF
        MVO     R0,     G_017A                  ; 573F   0240 017A

L_5741:
        JSR     R5,     G_7FD5                  ; 5741   0004 017C 03D5

        ANDI    #$03C0, R0                      ; 5744   03B8 03C0
        BNEQ    L_574E                          ; 5746   020C 0006

        MVI     G_0179, R0                      ; 5748   0280 0179
        XORI    #$0002, R0                      ; 574A   03F8 0002
        MVO     R0,     G_0179                  ; 574C   0240 0179
L_574E:
        PULR    R7                              ; 574E   02B7
L_574F:
        DECR    R5                              ; 574F   0015
        MVO     R5,     G_0181                  ; 5750   0245 0181
        CLRR    R0                              ; 5752   01C0
        MVO     R0,     G_014E                  ; 5753   0240 014E
        CLRR    R0                              ; 5755   01C0
        MVO     R0,     G_0347                  ; 5756   0240 0347
        J       G_7021                          ; 5758   0004 0370 0021

        COMR    R3                              ; 575B   001B
        DECR    R3                              ; 575C   0013
        DIS                                     ; 575D   0003
        SETC                                    ; 575E   0007
        DECR    R7                              ; 575F   0017
        DECR    R6                              ; 5760   0016
        CLRC                                    ; 5761   0006
        INCR    R6                              ; 5762   000E
        COMR    R6                              ; 5763   001E
        COMR    R4                              ; 5764   001C
        INCR    R4                              ; 5765   000C
        INCR    R5                              ; 5766   000D
        COMR    R5                              ; 5767   001D
        COMR    R1                              ; 5768   0019
        INCR    R1                              ; 5769   0009
        INCR    R3                              ; 576A   000B
        MOVR    R6,     R7                      ; 576B   00B7
        SARC    R2,     2                       ; 576C   007E
        MOVR    R7,     R6                      ; 576D   00BE
        ADDR    R3,     R6                      ; 576E   00DE
        SARC    R1,     2                       ; 576F   007D
        MOVR    R7,     R5                      ; 5770   00BD
        ADDR    R3,     R5                      ; 5771   00DD
        SARC    R3,     1                       ; 5772   007B
        MOVR    R7,     R3                      ; 5773   00BB
        ADDR    R3,     R3                      ; 5774   00DB
        RRC     R3,     2                       ; 5775   0077
        ADDR    R2,     R7                      ; 5776   00D7
L_5777:
        MVI     .STIC.C.0,R0                    ; 5777   0280 0018
        MVO     R0,     G_0351                  ; 5779   0240 0351
        MVII    #$001B, R4                      ; 577B   02BC 001B
        CLRR    R1                              ; 577D   01C9
        MVO     R1,     .STIC.C.0               ; 577E   0241 0018
        MVII    #$0100, R2                      ; 5780   02BA 0100
        MVI@    R4,     R0                      ; 5782   02A0
        ANDR    R2,     R0                      ; 5783   0190
        ADDR    R0,     R1                      ; 5784   00C1
        SLR     R1,     1                       ; 5785   0061
        MVI@    R4,     R0                      ; 5786   02A0
        ANDR    R2,     R0                      ; 5787   0190
        ADDR    R0,     R1                      ; 5788   00C1
        SLR     R1,     1                       ; 5789   0061
        MVI@    R4,     R0                      ; 578A   02A0
        ANDR    R2,     R0                      ; 578B   0190
        ADDR    R0,     R1                      ; 578C   00C1
        SLR     R1,     1                       ; 578D   0061
        MVI@    R4,     R0                      ; 578E   02A0
        ANDR    R2,     R0                      ; 578F   0190
        ADDR    R0,     R1                      ; 5790   00C1
        SLR     R1,     1                       ; 5791   0061
        MVI@    R4,     R0                      ; 5792   02A0
        ANDR    R2,     R0                      ; 5793   0190
        ADDR    R0,     R1                      ; 5794   00C1
        SLR     R1,     1                       ; 5795   0061
        MVO     R1,     G_0352                  ; 5796   0241 0352
        CLRR    R0                              ; 5798   01C0
        MVII    #$001B, R4                      ; 5799   02BC 001B
        MVO@    R0,     R4                      ; 579B   0260
        MVO@    R0,     R4                      ; 579C   0260
        MVO@    R0,     R4                      ; 579D   0260
        MVO@    R0,     R4                      ; 579E   0260
        MVO@    R0,     R4                      ; 579F   0260
        MOVR    R5,     R7                      ; 57A0   00AF
L_57A1:
        PSHR    R5                              ; 57A1   0275
        MVI     G_0352, R0                      ; 57A2   0280 0352
L_57A4:
        SLR     R0,     2                       ; 57A4   0064
        SLR     R0,     1                       ; 57A5   0060
        MVII    #$0312, R1                      ; 57A6   02B9 0312
L_57A8:
        INCR    R1                              ; 57A8   0009
        CMPI    #$0318, R1                      ; 57A9   0379 0318
        BEQ     L_57F8                          ; 57AB   0204 004B

        RRC     R0,     1                       ; 57AD   0070
        BNC     L_57A8                          ; 57AE   0229 0007

        MVI@    R1,     R2                      ; 57B0   028A
L_57B1:
        SUBI    #$0004, R2                      ; 57B1   033A 0004
        SLR     R2,     2                       ; 57B3   0066
        SLR     R2,     1                       ; 57B4   0062
        ANDI    #$001F, R2                      ; 57B5   03BA 001F
        ADDI    #$0008, R1                      ; 57B7   02F9 0008
        MVI@    R1,     R3                      ; 57B9   028B
        SUBI    #$0008, R1                      ; 57BA   0339 0008
        SUBI    #$0008, R3                      ; 57BC   033B 0008
        MOVR    R3,     R5                      ; 57BE   009D
        ANDI    #$0078, R3                      ; 57BF   03BB 0078
        ADDR    R3,     R3                      ; 57C1   00DB
        PSHR    R3                              ; 57C2   0273
        SLR     R3,     2                       ; 57C3   0067
        ADD@    R6,     R3                      ; 57C4   02F3
        ADDR    R3,     R2                      ; 57C5   00DA
        ADDI    #$0200, R2                      ; 57C6   02FA 0200
        MVI@    R2,     R3                      ; 57C8   0293
        ANDI    #$03F8, R3                      ; 57C9   03BB 03F8
        SUBI    #$01A8, R3                      ; 57CB   033B 01A8
        BMI     L_57E0                          ; 57CD   020B 0011

L_57CF:
        CMPI    #$0040, R3                      ; 57CF   037B 0040
        BPL     L_57E0                          ; 57D1   0203 000D

        SLR     R3,     2                       ; 57D3   0067
        SLR     R3,     1                       ; 57D4   0063
        INCR    R3                              ; 57D5   000B
        ANDI    #$0007, R5                      ; 57D6   03BD 0007
        CMPR    R3,     R5                      ; 57D8   015D
        BPL     L_57A8                          ; 57D9   0223 0032

        JSR     R5,     L_58E7                  ; 57DB   0004 0158 00E7

        B       L_57A8                          ; 57DE   0220 0037

L_57E0:
        ADDI    #$0014, R2                      ; 57E0   02FA 0014
        MVI@    R2,     R3                      ; 57E2   0293
        ANDI    #$03F8, R3                      ; 57E3   03BB 03F8
        SUBI    #$01A8, R3                      ; 57E5   033B 01A8
        BMI     L_57A8                          ; 57E7   022B 0040

        CMPI    #$0040, R3                      ; 57E9   037B 0040
        BPL     L_57A8                          ; 57EB   0223 0044

        SLR     R3,     2                       ; 57ED   0067
        SLR     R3,     1                       ; 57EE   0063
        DECR    R3                              ; 57EF   0013
        CMPR    R5,     R3                      ; 57F0   016B
        BPL     L_57A8                          ; 57F1   0223 004A

        JSR     R5,     L_58E7                  ; 57F3   0004 0158 00E7

        B       L_57A8                          ; 57F6   0220 004F

L_57F8:
        MVI     G_0184, R0                      ; 57F8   0280 0184
        TSTR    R0                              ; 57FA   0080
        BNEQ    L_5860                          ; 57FB   020C 0063

        MVI     G_0351, R0                      ; 57FD   0280 0351
        ANDI    #$01FF, R0                      ; 57FF   03B8 01FF
        BEQ     L_5860                          ; 5801   0204 005D

        CMPI    #$0100, R0                      ; 5803   0378 0100
        BEQ     L_5853                          ; 5805   0204 004C

        MVII    #$0311, R1                      ; 5807   02B9 0311
        SLR     R0,     2                       ; 5809   0064
L_580A:
        INCR    R1                              ; 580A   0009
        RRC     R0,     1                       ; 580B   0070
        BNC     L_580A                          ; 580C   0229 0003

        CMPI    #$0312, R1                      ; 580E   0379 0312
        BEQ     L_5825                          ; 5810   0204 0013

        ADDI    #$0010, R1                      ; 5812   02F9 0010
        MVI@    R1,     R2                      ; 5814   028A
        TSTR    R2                              ; 5815   0092
        BEQ     L_5860                          ; 5816   0204 0048

        SDBD                                    ; 5818   0001
        CMPI    #$0994, R2                      ; 5819   037A 0094 0009
        BEQ     L_5861                          ; 581C   0204 0043

        SUBI    #$0010, R1                      ; 581E   0339 0010

        JSR     R5,     L_58E7                  ; 5820   0004 0158 00E7

        B       L_582A                          ; 5823   0200 0005

L_5825:
        MVI     G_0354, R4                      ; 5825   0284 0354
        INCR    R4                              ; 5827   000C
        MVO     R4,     G_0354                  ; 5828   0244 0354
L_582A:
        MVII    #$0004, R1                      ; 582A   02B9 0004
        MVO     R1,     G_0184                  ; 582C   0241 0184

        JSR     R5,     L_59B5                  ; 582E   0004 0158 01B5
        JSR     R5,     L_59B5                  ; 5831   0004 0158 01B5

        MVII    #$0010, R1                      ; 5834   02B9 0010

        JSR     R5,     L_5DBF                  ; 5836   0004 015C 01BF
        JSR     R5,     G_7C6C                  ; 5839   0004 017C 006C

        MVI     G_014E, R0                      ; 583C   0280 014E
        TSTR    R0                              ; 583E   0080
        BEQ     L_5847                          ; 583F   0204 0006

        JSR     R5,     L_5D6D                  ; 5841   0004 015C 016D
        JSR     R5,     G_787C                  ; 5844   0004 0178 007C

L_5847:
        MVI     G_0182, R0                      ; 5847   0280 0182
        DECR    R0                              ; 5849   0010
        BMI     L_5985                          ; 584A   020B 0139

        MVO     R0,     G_0182                  ; 584C   0240 0182

        JSR     R5,     L_6DA1                  ; 584E   0004 016C 01A1

        B       L_5860                          ; 5851   0200 000D

L_5853:
        MVI     G_0153, R0                      ; 5853   0280 0153
        TSTR    R0                              ; 5855   0080
        BNEQ    L_5860                          ; 5856   020C 0008

        MVI     G_0318, R0                      ; 5858   0280 0318
        ANDI    #$007F, R0                      ; 585A   03B8 007F
        CMPI    #$0042, R0                      ; 585C   0378 0042
        BMI     L_582A                          ; 585E   022B 0035

L_5860:
        PULR    R7                              ; 5860   02B7
L_5861:
        CLRR    R5                              ; 5861   01ED
        MVO@    R5,     R1                      ; 5862   024D
        SUBI    #$0008, R1                      ; 5863   0339 0008
        MVO@    R5,     R1                      ; 5865   024D
        SUBI    #$0008, R1                      ; 5866   0339 0008
        MVI@    R1,     R2                      ; 5868   028A
        MVO@    R5,     R1                      ; 5869   024D
        SWAP    R2,     1                       ; 586A   0042
        SLR     R2,     2                       ; 586B   0066
        SLR     R2,     1                       ; 586C   0062
        ANDI    #$001F, R2                      ; 586D   03BA 001F
        ADDI    #$0102, R2                      ; 586F   02FA 0102
        MVO@    R5,     R2                      ; 5871   0255
        SDBD                                    ; 5872   0001
        MVII    #$6DEC, R5                      ; 5873   02BD 00EC 006D
        MVO     R5,     G_0340                  ; 5876   0245 0340
        MVI     G_014D, R5                      ; 5878   0285 014D
        INCR    R5                              ; 587A   000D
        MVO     R5,     G_014D                  ; 587B   0245 014D
        MVI     G_0354, R5                      ; 587D   0285 0354
        ADDI    #$0014, R5                      ; 587F   02FD 0014
        MVO     R5,     G_0354                  ; 5881   0245 0354
        MVII    #$000A, R1                      ; 5883   02B9 000A

        JSR     R5,     L_5DBF                  ; 5885   0004 015C 01BF

        B       L_5860                          ; 5888   0220 0029

L_588A:
        PSHR    R5                              ; 588A   0275
        PSHR    R3                              ; 588B   0273
        MVI@    R3,     R1                      ; 588C   0299
        MOVR    R1,     R0                      ; 588D   0088
        ANDI    #$000F, R0                      ; 588E   03B8 000F
        CMPI    #$000F, R0                      ; 5890   0378 000F
        BEQ     L_58A1                          ; 5892   0204 000D

        ANDI    #$00F0, R1                      ; 5894   03B9 00F0
        BEQ     L_58AB                          ; 5896   0204 0013

        SLR     R1,     2                       ; 5898   0065
        SLR     R1,     2                       ; 5899   0065
        ADDI    #$0310, R1                      ; 589A   02F9 0310

        JSR     R5,     L_58E7                  ; 589C   0004 0158 00E7

L_589F:
        PULR    R3                              ; 589F   02B3
        PULR    R7                              ; 58A0   02B7
L_58A1:
        CLRR    R5                              ; 58A1   01ED
        MVO@    R5,     R3                      ; 58A2   025D
        MVI     G_0354, R3                      ; 58A3   0283 0354
        ADDI    #$0006, R3                      ; 58A5   02FB 0006
        MVO     R3,     G_0354                  ; 58A7   0243 0354
        PULR    R3                              ; 58A9   02B3
        PULR    R7                              ; 58AA   02B7
L_58AB:
        MOVR    R3,     R2                      ; 58AB   009A
        MVI@    R2,     R3                      ; 58AC   0293
        ANDI    #$000F, R3                      ; 58AD   03BB 000F
        CMPI    #$000C, R3                      ; 58AF   037B 000C
        BNEQ    L_58C5                          ; 58B1   020C 0012

        MVI@    R2,     R3                      ; 58B3   0293
        ANDI    #$00F0, R3                      ; 58B4   03BB 00F0
        ADDI    #$000D, R3                      ; 58B6   02FB 000D
        MVO@    R3,     R2                      ; 58B8   0253
        ADDI    #$0018, R2                      ; 58B9   02FA 0018
        CLRR    R5                              ; 58BB   01ED
        MVO@    R5,     R2                      ; 58BC   0255
        MVI     G_0354, R3                      ; 58BD   0283 0354
        ADDI    #$0006, R3                      ; 58BF   02FB 0006
        MVO     R3,     G_0354                  ; 58C1   0243 0354
        PULR    R3                              ; 58C3   02B3
        PULR    R7                              ; 58C4   02B7
L_58C5:
        CMPI    #$0007, R3                      ; 58C5   037B 0007
        BNEQ    L_58DA                          ; 58C7   020C 0011

        MOVR    R2,     R3                      ; 58C9   0093
        CLRR    R0                              ; 58CA   01C0
        MVO@    R0,     R3                      ; 58CB   0258

        JSR     R5,     G_78FD                  ; 58CC   0004 0178 00FD
        JSR     R5,     L_6403                  ; 58CF   0004 0164 0003

        MVI     G_0354, R3                      ; 58D2   0283 0354
        ADDI    #$0028, R3                      ; 58D4   02FB 0028
        MVO     R3,     G_0354                  ; 58D6   0243 0354
        PULR    R3                              ; 58D8   02B3
        PULR    R7                              ; 58D9   02B7
L_58DA:
        SDBD                                    ; 58DA   0001
        ADDI    #$5A3A, R3                      ; 58DB   02FB 003A 005A
        MVI@    R3,     R4                      ; 58DE   029C
        ADD     G_0354, R4                      ; 58DF   02C4 0354
        MVO     R4,     G_0354                  ; 58E1   0244 0354
        CLRR    R3                              ; 58E3   01DB
        MVO@    R3,     R2                      ; 58E4   0253
        PULR    R3                              ; 58E5   02B3
        PULR    R7                              ; 58E6   02B7
L_58E7:
        PSHR    R5                              ; 58E7   0275
        MVI@    R1,     R2                      ; 58E8   028A
        TSTR    R2                              ; 58E9   0092
        BEQ     L_5984                          ; 58EA   0204 0098

        SWAP    R2,     1                       ; 58EC   0042
        SLR     R2,     2                       ; 58ED   0066
        SLR     R2,     1                       ; 58EE   0062
        ANDI    #$001F, R2                      ; 58EF   03BA 001F
        CMPI    #$001F, R2                      ; 58F1   037A 001F
        BEQ     L_5984                          ; 58F3   0204 008F

        ADDI    #$0102, R2                      ; 58F5   02FA 0102
        MVI@    R2,     R3                      ; 58F7   0293
        ANDI    #$000F, R3                      ; 58F8   03BB 000F
        CMPI    #$000D, R3                      ; 58FA   037B 000D
        BEQ     L_5984                          ; 58FC   0204 0086

        CMPI    #$0003, R3                      ; 58FE   037B 0003
        BMI     L_5984                          ; 5900   020B 0082

        PSHR    R0                              ; 5902   0270
        PSHR    R1                              ; 5903   0271
        PSHR    R2                              ; 5904   0272
        PSHR    R3                              ; 5905   0273
        MVII    #$0008, R1                      ; 5906   02B9 0008
        CMPI    #$0007, R3                      ; 5908   037B 0007
        BNEQ    L_590E                          ; 590A   020C 0002

        MVII    #$0009, R1                      ; 590C   02B9 0009
L_590E:
        CMPI    #$000A, R3                      ; 590E   037B 000A
        BNEQ    L_5914                          ; 5910   020C 0002

        MVII    #$000B, R1                      ; 5912   02B9 000B

L_5914:
        JSR     R5,     L_5DBF                  ; 5914   0004 015C 01BF

        PULR    R3                              ; 5917   02B3
        PULR    R2                              ; 5918   02B2
        PULR    R1                              ; 5919   02B1
        PULR    R0                              ; 591A   02B0
        CMPI    #$000C, R3                      ; 591B   037B 000C
        BNEQ    L_594E                          ; 591D   020C 002F

        MVI@    R2,     R3                      ; 591F   0293
        ANDI    #$00F0, R3                      ; 5920   03BB 00F0
        BEQ     L_5984                          ; 5922   0204 0060

        ADDI    #$000D, R3                      ; 5924   02FB 000D
        MVO@    R3,     R2                      ; 5926   0253
        ADDI    #$0018, R2                      ; 5927   02FA 0018
        CLRR    R5                              ; 5929   01ED
        MVO@    R5,     R2                      ; 592A   0255
        ANDI    #$00F0, R3                      ; 592B   03BB 00F0
        SLR     R3,     2                       ; 592D   0067
        SLR     R3,     2                       ; 592E   0067
        ADDI    #$0320, R3                      ; 592F   02FB 0320
        SDBD                                    ; 5931   0001
        MVII    #$0994, R5                      ; 5932   02BD 0094 0009
        MVO@    R5,     R3                      ; 5935   025D
        SUBI    #$0010, R3                      ; 5936   033B 0010
        MVI@    R3,     R5                      ; 5938   029D
        SDBD                                    ; 5939   0001
        ANDI    #$FEFF, R5                      ; 593A   03BD 00FF 00FE
        MVO@    R5,     R3                      ; 593D   025D
        MVI     G_0354, R3                      ; 593E   0283 0354
        ADDI    #$0006, R3                      ; 5940   02FB 0006
        MVO     R3,     G_0354                  ; 5942   0243 0354
        PSHR    R0                              ; 5944   0270
        PSHR    R1                              ; 5945   0271
        MVII    #$000D, R1                      ; 5946   02B9 000D

        JSR     R5,     L_5DBF                  ; 5948   0004 015C 01BF

        PULR    R1                              ; 594B   02B1
        PULR    R0                              ; 594C   02B0
        PULR    R7                              ; 594D   02B7
L_594E:
        CMPI    #$0007, R3                      ; 594E   037B 0007
        BNEQ    L_596A                          ; 5950   020C 0018

        PSHR    R0                              ; 5952   0270
        PSHR    R1                              ; 5953   0271
L_5954:
        CLRR    R0                              ; 5954   01C0
        MVO@    R0,     R1                      ; 5955   0248
        ADDI    #$0010, R1                      ; 5956   02F9 0010
        MVO@    R0,     R1                      ; 5958   0248
        MOVR    R2,     R3                      ; 5959   0093
        MVO@    R0,     R3                      ; 595A   0258

        JSR     R5,     G_78FD                  ; 595B   0004 0178 00FD
        JSR     R5,     L_6403                  ; 595E   0004 0164 0003

        MVI     G_0354, R3                      ; 5961   0283 0354
        ADDI    #$0028, R3                      ; 5963   02FB 0028
        MVO     R3,     G_0354                  ; 5965   0243 0354
        PULR    R1                              ; 5967   02B1
        PULR    R0                              ; 5968   02B0
        PULR    R7                              ; 5969   02B7
L_596A:
        SDBD                                    ; 596A   0001
        ADDI    #$5A3A, R3                      ; 596B   02FB 003A 005A
        MVI@    R3,     R4                      ; 596E   029C
        ADD     G_0354, R4                      ; 596F   02C4 0354
        MVO     R4,     G_0354                  ; 5971   0244 0354
        MVI@    R2,     R3                      ; 5973   0293
        ANDI    #$00F0, R3                      ; 5974   03BB 00F0
        INCR    R3                              ; 5976   000B
        MVO@    R3,     R2                      ; 5977   0253
        CLRR    R3                              ; 5978   01DB
        ADDI    #$0018, R2                      ; 5979   02FA 0018
        MVO@    R3,     R2                      ; 597B   0253
        MVI@    R1,     R3                      ; 597C   028B
        ANDI    #$02FF, R3                      ; 597D   03BB 02FF
        SDBD                                    ; 597F   0001
        ADDI    #$F800, R3                      ; 5980   02FB 0000 00F8
        MVO@    R3,     R1                      ; 5983   024B
L_5984:
        PULR    R7                              ; 5984   02B7

L_5985:
        JSR     R5,     L_59BD                  ; 5985   0004 0158 01BD

        MVII    #$0269, R1                      ; 5988   02B9 0269
        SDBD                                    ; 598A   0001
        MVII    #$59AC, R4                      ; 598B   02BC 00AC 0059
        MVII    #$0009, R0                      ; 598E   02B8 0009

        JSR     R5,     L_6FA2                  ; 5990   0004 016C 03A2

        CLRR    R0                              ; 5993   01C0
L_5994:
        DECR    R0                              ; 5994   0010
        NOP                                     ; 5995   0034
        NOP                                     ; 5996   0034
        NOP                                     ; 5997   0034
        BNEQ    L_5994                          ; 5998   022C 0005

        MVII    #$007F, R0                      ; 599A   02B8 007F
        MVO     R0,     G_0182                  ; 599C   0240 0182
        MVO     R0,     G_0183                  ; 599E   0240 0183
        MVII    #$0001, R0                      ; 59A0   02B8 0001
        MVO     R0,     G_014E                  ; 59A2   0240 014E

        JSR     R5,     L_5D6D                  ; 59A4   0004 015C 016D
        JSR     R5,     G_787C                  ; 59A7   0004 0178 007C

        B       L_5860                          ; 59AA   0220 014B

        SUBR    R7,     R1                      ; 59AC   0139
        SUBR    R1,     R1                      ; 59AD   0109
        CMPR    R5,     R1                      ; 59AE   0169
        SUBR    R5,     R1                      ; 59AF   0129
        DECLE   $0001                           ; 59B0   0001

        CMPR    R7,     R1                      ; 59B1   0179
        ANDR    R6,     R1                      ; 59B2   01B1
        SUBR    R5,     R1                      ; 59B3   0129
        ANDR    R2,     R1                      ; 59B4   0191
L_59B5:
        PSHR    R5                              ; 59B5   0275
        MVI     G_0353, R2                      ; 59B6   0282 0353
        CMP     G_0354, R2                      ; 59B8   0342 0354
        BEQ     L_5A19                          ; 59BA   0204 005D

        INCR    R7                              ; 59BC   000F
L_59BD:
        PSHR    R5                              ; 59BD   0275
        MVI     G_014E, R3                      ; 59BE   0283 014E
        TSTR    R3                              ; 59C0   009B
        BEQ     L_59C7                          ; 59C1   0204 0004

        MVI     G_0353, R3                      ; 59C3   0283 0353
        MVO     R3,     G_0354                  ; 59C5   0243 0354
L_59C7:
        MVI     G_0353, R2                      ; 59C7   0282 0353
        CLRR    R3                              ; 59C9   01DB
        MVII    #$0190, R1                      ; 59CA   02B9 0190

        JSR     R5,     G_7FC5                  ; 59CC   0004 017C 03C5

        PSHR    R2                              ; 59CF   0272
        MVI     G_0354, R2                      ; 59D0   0282 0354
        MVII    #$0190, R1                      ; 59D2   02B9 0190
        CLRR    R3                              ; 59D4   01DB

        JSR     R5,     G_7FC5                  ; 59D5   0004 017C 03C5

        SUB@    R6,     R2                      ; 59D8   0332
        BEQ     L_59EF                          ; 59D9   0204 0014

        MVI     G_0182, R0                      ; 59DB   0280 0182
        ADDR    R2,     R0                      ; 59DD   00D0
        MVO     R0,     G_0182                  ; 59DE   0240 0182
        ADD     G_0183, R2                      ; 59E0   02C2 0183
        MVO     R2,     G_0183                  ; 59E2   0242 0183

        JSR     R5,     L_6DC0                  ; 59E4   0004 016C 01C0
        JSR     R5,     L_6DA1                  ; 59E7   0004 016C 01A1

        MVII    #$000F, R1                      ; 59EA   02B9 000F

        JSR     R5,     L_5DBF                  ; 59EC   0004 015C 01BF

L_59EF:
        MVI     G_0354, R2                      ; 59EF   0282 0354
        MVO     R2,     G_0353                  ; 59F1   0242 0353
        MVII    #$0190, R1                      ; 59F3   02B9 0190
        CLRR    R3                              ; 59F5   01DB

        JSR     R5,     G_7FC5                  ; 59F6   0004 017C 03C5

        PSHR    R3                              ; 59F9   0273
        CLRR    R4                              ; 59FA   01E4
        MOVR    R2,     R0                      ; 59FB   0090
        BEQ     L_5A09                          ; 59FC   0204 000B

        MVII    #$0218, R1                      ; 59FE   02B9 0218
        MVII    #$0002, R2                      ; 5A00   02BA 0002
        MVII    #$0001, R3                      ; 5A02   02BB 0001

        JSR     R5,     L_6FAA                  ; 5A04   0004 016C 03AA

        MVII    #$0081, R4                      ; 5A07   02BC 0081
L_5A09:
        PULR    R0                              ; 5A09   02B0
        PSHR    R0                              ; 5A0A   0270
        SLL     R0,     2                       ; 5A0B   004C
        ADD@    R6,     R0                      ; 5A0C   02F0
        PSHR    R0                              ; 5A0D   0270
        SLL     R0,     2                       ; 5A0E   004C
        ADD@    R6,     R0                      ; 5A0F   02F0
        MVII    #$021C, R1                      ; 5A10   02B9 021C
        MVII    #$0004, R2                      ; 5A12   02BA 0004
        MVII    #$0001, R3                      ; 5A14   02BB 0001

        JSR     R5,     L_6FAA                  ; 5A16   0004 016C 03AA

L_5A19:
        PULR    R7                              ; 5A19   02B7
L_5A1A:
        PSHR    R5                              ; 5A1A   0275
        MVI     G_0189, R0                      ; 5A1B   0280 0189
        TSTR    R0                              ; 5A1D   0080
        BEQ     L_5A39                          ; 5A1E   0204 0019

L_5A20:
        MVII    #$0185, R4                      ; 5A20   02BC 0185
        MVI     G_0354, R5                      ; 5A22   0285 0354
L_5A24:
        MVI@    R4,     R3                      ; 5A24   02A3
        ADDI    #$0102, R3                      ; 5A25   02FB 0102
        MVI@    R3,     R2                      ; 5A27   029A
        CLRR    R1                              ; 5A28   01C9
        MVO@    R1,     R3                      ; 5A29   0259
        ANDI    #$000F, R2                      ; 5A2A   03BA 000F
        SDBD                                    ; 5A2C   0001
        ADDI    #$5A3A, R2                      ; 5A2D   02FA 003A 005A
        ADD@    R2,     R5                      ; 5A30   02D5
        DECR    R0                              ; 5A31   0010
        BNEQ    L_5A24                          ; 5A32   022C 000F

        MVO     R5,     G_0354                  ; 5A34   0245 0354
        CLRR    R0                              ; 5A36   01C0
        MVO     R0,     G_0189                  ; 5A37   0240 0189
L_5A39:
        PULR    R7                              ; 5A39   02B7
        DECLE   $0000,  $0000,  $0000           ; 5A3A   0000 0000 0000

        INCR    R2                              ; 5A3D   000A
        INCR    R0                              ; 5A3E   0008
        DECLE   $0000,  $0000                   ; 5A3F   0000 0000

        ADCR    R0                              ; 5A41   0028
        DECLE   $0000,  $0000                   ; 5A42   0000 0000

        CLRC                                    ; 5A44   0006
        DECLE   $0000                           ; 5A45   0000

        CLRC                                    ; 5A46   0006
        DECLE   $0000                           ; 5A47   0000

        CLRC                                    ; 5A48   0006
        CLRC                                    ; 5A49   0006

        JSR     R5,     G_78FD                  ; 5A4A   0004 0178 00FD

        SUB     G_0344, R0                      ; 5A4D   0300 0344
        ANDI    #$01FF, R0                      ; 5A4F   03B8 01FF
        ADDI    #$0018, R3                      ; 5A51   02FB 0018
        MVI@    R3,     R2                      ; 5A53   029A
        INCR    R2                              ; 5A54   000A
        MOVR    R2,     R4                      ; 5A55   0094
        MVO@    R2,     R3                      ; 5A56   025A
        SLR     R2,     2                       ; 5A57   0066
        SLR     R2,     2                       ; 5A58   0066
        ADDR    R2,     R1                      ; 5A59   00D1
        CMPI    #$007F, R1                      ; 5A5A   0379 007F
L_5A5C:
        BMI     L_5A7D                          ; 5A5C   020B 001F

        CMPI    #$0034, R4                      ; 5A5E   037C 0034
        BMI     L_5A8A                          ; 5A60   020B 0028

        SUBI    #$0018, R3                      ; 5A62   033B 0018
L_5A64:
        MVI@    R3,     R2                      ; 5A64   029A
        CLRR    R5                              ; 5A65   01ED
        MVO@    R5,     R3                      ; 5A66   025D
        ANDI    #$00F0, R2                      ; 5A67   03BA 00F0
        BEQ     L_5A7A                          ; 5A69   0204 000F

        SLR     R2,     2                       ; 5A6B   0066
        SLR     R2,     2                       ; 5A6C   0066
        ADDI    #$0310, R2                      ; 5A6D   02FA 0310
        MVO@    R5,     R2                      ; 5A6F   0255
        ADDI    #$0010, R2                      ; 5A70   02FA 0010
        MVO@    R5,     R2                      ; 5A72   0255
        PSHR    R3                              ; 5A73   0273
        MVII    #$000B, R1                      ; 5A74   02B9 000B

        JSR     R5,     L_5DBF                  ; 5A76   0004 015C 01BF

        PULR    R3                              ; 5A79   02B3
L_5A7A:
        J       G_7813                          ; 5A7A   0004 0378 0013

L_5A7D:
        SUBI    #$0018, R3                      ; 5A7D   033B 0018
        MVI@    R3,     R2                      ; 5A7F   029A
        ANDI    #$0070, R2                      ; 5A80   03BA 0070
        BEQ     L_5AE2                          ; 5A82   0204 005E

        JSR     R5,     G_7C1B                  ; 5A84   0004 017C 001B

        J       G_7813                          ; 5A87   0004 0378 0013

L_5A8A:
        SUBI    #$0018, R3                      ; 5A8A   033B 0018
        MVI@    R3,     R2                      ; 5A8C   029A
        ANDI    #$00F0, R2                      ; 5A8D   03BA 00F0
        BEQ     L_5AD9                          ; 5A8F   0204 0048

        SLR     R2,     2                       ; 5A91   0066
        SLR     R2,     2                       ; 5A92   0066
        ADDI    #$0310, R2                      ; 5A93   02FA 0310
        MVI@    R2,     R1                      ; 5A95   0291
        CLRR    R5                              ; 5A96   01ED
        MVO@    R5,     R2                      ; 5A97   0255
        ADDI    #$0010, R2                      ; 5A98   02FA 0010
        MVO@    R5,     R2                      ; 5A9A   0255
        ANDI    #$00FF, R1                      ; 5A9B   03B9 00FF
        SUBI    #$0004, R1                      ; 5A9D   0339 0004
        SLR     R1,     2                       ; 5A9F   0065
        SLR     R1,     1                       ; 5AA0   0061
        MOVR    R1,     R0                      ; 5AA1   0088
        ADDI    #$02DC, R1                      ; 5AA2   02F9 02DC
        MVI@    R1,     R5                      ; 5AA4   028D
        TSTR    R5                              ; 5AA5   00AD
        BNEQ    L_5A64                          ; 5AA6   022C 0043

        SDBD                                    ; 5AA8   0001
        MVII    #$09EC, R5                      ; 5AA9   02BD 00EC 0009
        MVO@    R5,     R1                      ; 5AAC   024D
        ADD     G_016E, R0                      ; 5AAD   02C0 016E
        CMPI    #$00A0, R0                      ; 5AAF   0378 00A0
        BMI     L_5AB5                          ; 5AB1   020B 0002

        SUBI    #$00A0, R0                      ; 5AB3   0338 00A0
L_5AB5:
        MVII    #$0001, R1                      ; 5AB5   02B9 0001
        MVII    #$016F, R4                      ; 5AB7   02BC 016F
L_5AB9:
        MVI@    R4,     R5                      ; 5AB9   02A5
        CMPI    #$00FF, R5                      ; 5ABA   037D 00FF
        BEQ     L_5AC5                          ; 5ABC   0204 0007

        SLL     R1,     1                       ; 5ABE   0049
        CMPI    #$0100, R1                      ; 5ABF   0379 0100
        BNEQ    L_5AB9                          ; 5AC1   022C 0009
        B       L_5A64                          ; 5AC3   0220 0060

L_5AC5:
        DECR    R4                              ; 5AC5   0014
        MVO@    R0,     R4                      ; 5AC6   0260
L_5AC7:
        MVI     G_0354, R5                      ; 5AC7   0285 0354
        ADDI    #$000A, R5                      ; 5AC9   02FD 000A
        MVO     R5,     G_0354                  ; 5ACB   0245 0354
        PSHR    R3                              ; 5ACD   0273
        MVII    #$000A, R1                      ; 5ACE   02B9 000A

        JSR     R5,     L_5DBF                  ; 5AD0   0004 015C 01BF

        PULR    R3                              ; 5AD3   02B3
        CLRR    R0                              ; 5AD4   01C0
        MVO@    R0,     R3                      ; 5AD5   0258
        J       G_7813                          ; 5AD6   0004 0378 0013

L_5AD9:
        MVII    #$0001, R0                      ; 5AD9   02B8 0001
        PSHR    R3                              ; 5ADB   0273

        JSR     R5,     G_7941                  ; 5ADC   0004 0178 0141

        PULR    R3                              ; 5ADF   02B3
        B       L_5AC7                          ; 5AE0   0220 001A

L_5AE2:
        JSR     R5,     G_7934                  ; 5AE2   0004 0178 0134

        BNC     L_5B06                          ; 5AE5   0209 001F

        MVII    #$0323, R4                      ; 5AE7   02BC 0323
        MVII    #$0005, R5                      ; 5AE9   02BD 0005
L_5AEB:
        MVI@    R4,     R2                      ; 5AEB   02A2
        TSTR    R2                              ; 5AEC   0092
        BEQ     L_5AF4                          ; 5AED   0204 0005

        DECR    R5                              ; 5AEF   0015
        BNEQ    L_5AEB                          ; 5AF0   022C 0006
        B       L_5B06                          ; 5AF2   0200 0012

L_5AF4:
        DECR    R4                              ; 5AF4   0014
        SDBD                                    ; 5AF5   0001
        MVII    #$0994, R5                      ; 5AF6   02BD 0094 0009
        MVO@    R5,     R4                      ; 5AF9   0265
        SUBI    #$0011, R4                      ; 5AFA   033C 0011

        JSR     R5,     G_7919                  ; 5AFC   0004 0178 0119

        MOVR    R4,     R2                      ; 5AFF   00A2
        SUBI    #$0319, R2                      ; 5B00   033A 0319
        SLL     R2,     2                       ; 5B02   004E
        SLL     R2,     2                       ; 5B03   004E
        ADD@    R3,     R2                      ; 5B04   02DA
        MVO@    R2,     R3                      ; 5B05   025A

L_5B06:
        JSR     R5,     G_790A                  ; 5B06   0004 0178 010A

        J       G_7813                          ; 5B09   0004 0378 0013

L_5B0C:
        PSHR    R5                              ; 5B0C   0275
        MVII    #$0310, R4                      ; 5B0D   02BC 0310
        MVII    #$0018, R0                      ; 5B0F   02B8 0018

        JSR     R5,     L_6F9A                  ; 5B11   0004 016C 039A

        MVI     G_014D, R0                      ; 5B14   0280 014D

        JSR     R5,     G_7941                  ; 5B16   0004 0178 0141

        CLRR    R0                              ; 5B19   01C0
        MVO     R0,     G_014D                  ; 5B1A   0240 014D
        MVII    #$0102, R3                      ; 5B1C   02BB 0102
L_5B1E:
        MVI@    R3,     R0                      ; 5B1E   0298
        ANDI    #$000F, R0                      ; 5B1F   03B8 000F
        CMPI    #$000C, R0                      ; 5B21   0378 000C
        BEQ     L_5B2C                          ; 5B23   0204 0007

        CMPI    #$000D, R0                      ; 5B25   0378 000D
        BNEQ    L_5B36                          ; 5B27   020C 000D

        CLRR    R0                              ; 5B29   01C0
        B       L_5B2E                          ; 5B2A   0200 0002

L_5B2C:
        MVII    #$000E, R0                      ; 5B2C   02B8 000E
L_5B2E:
        MVO@    R0,     R3                      ; 5B2E   0258
        MVII    #$0001, R0                      ; 5B2F   02B8 0001
        PSHR    R3                              ; 5B31   0273

        JSR     R5,     G_7941                  ; 5B32   0004 0178 0141

        PULR    R3                              ; 5B35   02B3
L_5B36:
        INCR    R3                              ; 5B36   000B
        CMPI    #$011A, R3                      ; 5B37   037B 011A
        BNEQ    L_5B1E                          ; 5B39   022C 001C

        MVII    #$0102, R3                      ; 5B3B   02BB 0102
L_5B3D:
        CLRR    R0                              ; 5B3D   01C0
        MVI@    R3,     R1                      ; 5B3E   0299
        ANDI    #$000F, R1                      ; 5B3F   03B9 000F
        CMPI    #$000F, R1                      ; 5B41   0379 000F
        BEQ     L_5B50                          ; 5B43   0204 000B

        CMPI    #$0003, R1                      ; 5B45   0379 0003
        BPL     L_5B4A                          ; 5B47   0203 0001

        MOVR    R0,     R1                      ; 5B49   0081
L_5B4A:
        CMPI    #$0004, R1                      ; 5B4A   0379 0004
        BNEQ    L_5B4F                          ; 5B4C   020C 0001

        MOVR    R0,     R1                      ; 5B4E   0081
L_5B4F:
        MVO@    R1,     R3                      ; 5B4F   0259
L_5B50:
        INCR    R3                              ; 5B50   000B
        CMPI    #$011A, R3                      ; 5B51   037B 011A
        BNEQ    L_5B3D                          ; 5B53   022C 0017

        MVII    #$0102, R3                      ; 5B55   02BB 0102
L_5B57:
        MVI@    R3,     R2                      ; 5B57   029A
        CMPI    #$000E, R2                      ; 5B58   037A 000E
        BNEQ    L_5B67                          ; 5B5A   020C 000B

        ADDI    #$0018, R3                      ; 5B5C   02FB 0018
        CLRR    R0                              ; 5B5E   01C0
        MVO@    R0,     R3                      ; 5B5F   0258
        ADDI    #$0018, R3                      ; 5B60   02FB 0018
        MVII    #$0002, R0                      ; 5B62   02B8 0002
        MVO@    R0,     R3                      ; 5B64   0258
        SUBI    #$0030, R3                      ; 5B65   033B 0030
L_5B67:
        INCR    R3                              ; 5B67   000B
        CMPI    #$011A, R3                      ; 5B68   037B 011A
        BNEQ    L_5B57                          ; 5B6A   022C 0014

        JSR     R5,     G_7FD5                  ; 5B6C   0004 017C 03D5

        MOVR    R0,     R2                      ; 5B6F   0082
        MVII    #$0102, R3                      ; 5B70   02BB 0102

L_5B72:
        JSR     R5,     G_78FD                  ; 5B72   0004 0178 00FD

        ADDR    R2,     R0                      ; 5B75   00D0

        JSR     R5,     G_790A                  ; 5B76   0004 0178 010A

        INCR    R3                              ; 5B79   000B
        CMPI    #$011A, R3                      ; 5B7A   037B 011A
        BNEQ    L_5B72                          ; 5B7C   022C 000B

        MVII    #$0102, R3                      ; 5B7E   02BB 0102
L_5B80:
        MVI@    R3,     R2                      ; 5B80   029A
        CMPI    #$000E, R2                      ; 5B81   037A 000E
        BEQ     L_5B89                          ; 5B83   0204 0004

        CMPI    #$000A, R2                      ; 5B85   037A 000A
        BNEQ    L_5B96                          ; 5B87   020C 000D

L_5B89:
        JSR     R5,     G_78FD                  ; 5B89   0004 0178 00FD
        JSR     R5,     G_7934                  ; 5B8C   0004 0178 0134

        BNC     L_5B96                          ; 5B8F   0209 0005

        ADDI    #$00FF, R0                      ; 5B91   02F8 00FF

        JSR     R5,     G_790A                  ; 5B93   0004 0178 010A

L_5B96:
        INCR    R3                              ; 5B96   000B
        CMPI    #$011A, R3                      ; 5B97   037B 011A
        BNEQ    L_5B80                          ; 5B99   022C 001A

        MVII    #$0102, R4                      ; 5B9B   02BC 0102
        ADDI    #$0016, R4                      ; 5B9D   02FC 0016
        MVII    #$0002, R0                      ; 5B9F   02B8 0002
        MVO@    R0,     R4                      ; 5BA1   0260
        MVO@    R0,     R4                      ; 5BA2   0260
        ADDI    #$002E, R4                      ; 5BA3   02FC 002E
        CLRR    R0                              ; 5BA5   01C0
        MVO@    R0,     R4                      ; 5BA6   0260
        MVO@    R0,     R4                      ; 5BA7   0260
        PULR    R7                              ; 5BA8   02B7
L_5BA9:
        PSHR    R5                              ; 5BA9   0275
        MVI     G_0183, R0                      ; 5BAA   0280 0183
        DECR    R0                              ; 5BAC   0010
        BMI     L_5BD4                          ; 5BAD   020B 0025

        MVO     R0,     G_0183                  ; 5BAF   0240 0183

        JSR     R5,     L_6DC0                  ; 5BB1   0004 016C 01C0

        MVII    #$0004, R1                      ; 5BB4   02B9 0004

        JSR     R5,     L_5DBF                  ; 5BB6   0004 015C 01BF

        MVII    #$0102, R3                      ; 5BB9   02BB 0102
L_5BBB:
        MVI@    R3,     R2                      ; 5BBB   029A
        ANDI    #$000F, R2                      ; 5BBC   03BA 000F
        CMPI    #$000D, R2                      ; 5BBE   037A 000D
        CMPI    #$0003, R2                      ; 5BC0   037A 0003
        BMI     L_5BCF                          ; 5BC2   020B 000B

        JSR     R5,     G_78FD                  ; 5BC4   0004 0178 00FD
        JSR     R5,     G_7934                  ; 5BC7   0004 0178 0134

        BNC     L_5BCF                          ; 5BCA   0209 0003

        JSR     R5,     L_588A                  ; 5BCC   0004 0158 008A

L_5BCF:
        INCR    R3                              ; 5BCF   000B
        CMPI    #$011A, R3                      ; 5BD0   037B 011A
        BNEQ    L_5BBB                          ; 5BD2   022C 0018

L_5BD4:
        PULR    R7                              ; 5BD4   02B7
L_5BD5:
        PSHR    R5                              ; 5BD5   0275
        MVII    #$0102, R3                      ; 5BD6   02BB 0102
        CLRR    R4                              ; 5BD8   01E4
        CLRR    R5                              ; 5BD9   01ED
L_5BDA:
        MVI@    R3,     R2                      ; 5BDA   029A
        ANDI    #$000F, R2                      ; 5BDB   03BA 000F
        CMPI    #$0003, R2                      ; 5BDD   037A 0003
        BMI     L_5BEF                          ; 5BDF   020B 000E

        CMPI    #$000D, R2                      ; 5BE1   037A 000D
        BEQ     L_5BEE                          ; 5BE3   0204 0009

        CMPI    #$0004, R2                      ; 5BE5   037A 0004
        BEQ     L_5BEF                          ; 5BE7   0204 0006

        INCR    R4                              ; 5BE9   000C
        CMPI    #$000C, R2                      ; 5BEA   037A 000C
        BNEQ    L_5BEF                          ; 5BEC   020C 0001

L_5BEE:
        INCR    R5                              ; 5BEE   000D
L_5BEF:
        INCR    R3                              ; 5BEF   000B
        CMPI    #$011A, R3                      ; 5BF0   037B 011A
        BNEQ    L_5BDA                          ; 5BF2   022C 0019

        ADD     G_014D, R5                      ; 5BF4   02C5 014D
        TSTR    R4                              ; 5BF6   00A4
        BNEQ    L_5C89                          ; 5BF7   020C 0090

        PSHR    R5                              ; 5BF9   0275
        SDBD                                    ; 5BFA   0001
        MVII    #$5D56, R0                      ; 5BFB   02B8 0056 005D
        MVO     R0,     .ISRVEC.0               ; 5BFE   0240 0100
        SWAP    R0,     1                       ; 5C00   0040
        MVO     R0,     .ISRVEC.1               ; 5C01   0240 0101

        JSR     R5,     L_5D66                  ; 5C03   0004 015C 0166

        SDBD                                    ; 5C06   0001
        MVII    #$5D7E, R4                      ; 5C07   02BC 007E 005D
        MVII    #$022A, R1                      ; 5C0A   02B9 022A
        MVII    #$000B, R0                      ; 5C0C   02B8 000B

        JSR     R5,     L_6FA2                  ; 5C0E   0004 016C 03A2

        SDBD                                    ; 5C11   0001
        MVII    #$5D89, R4                      ; 5C12   02BC 0089 005D
        MVII    #$0255, R1                      ; 5C15   02B9 0255
        MVII    #$0009, R0                      ; 5C17   02B8 0009

        JSR     R5,     L_6FA2                  ; 5C19   0004 016C 03A2

        SDBD                                    ; 5C1C   0001
        MVII    #$5D92, R4                      ; 5C1D   02BC 0092 005D
        MVII    #$028E, R1                      ; 5C20   02B9 028E
        MVII    #$000B, R0                      ; 5C22   02B8 000B

        JSR     R5,     L_6FA2                  ; 5C24   0004 016C 03A2

        MVI     G_018B, R0                      ; 5C27   0280 018B
        CMPI    #$00FF, R0                      ; 5C29   0378 00FF
        BEQ     L_5C37                          ; 5C2B   0204 000A

        MVII    #$0238, R1                      ; 5C2D   02B9 0238
        MVII    #$0003, R2                      ; 5C2F   02BA 0003
        MVII    #$0001, R3                      ; 5C31   02BB 0001
        CLRR    R4                              ; 5C33   01E4

        JSR     R5,     L_6FAA                  ; 5C34   0004 016C 03AA

L_5C37:
        MVI     G_018B, R0                      ; 5C37   0280 018B
        CMPI    #$0005, R0                      ; 5C39   0378 0005
        BPL     L_5C40                          ; 5C3B   0203 0003

        SLL     R0,     2                       ; 5C3D   004C
        B       L_5C42                          ; 5C3E   0200 0002

L_5C40:
        MVII    #$0014, R0                      ; 5C40   02B8 0014
L_5C42:
        PSHR    R0                              ; 5C42   0270
        MOVR    R0,     R5                      ; 5C43   0085
        SLL     R0,     2                       ; 5C44   004C
        ADDR    R5,     R0                      ; 5C45   00E8
        MOVR    R0,     R5                      ; 5C46   0085
        SLL     R0,     2                       ; 5C47   004C
        ADDR    R5,     R0                      ; 5C48   00E8
        MVII    #$029C, R1                      ; 5C49   02B9 029C
        MVII    #$0003, R2                      ; 5C4B   02BA 0003
        MVII    #$0001, R3                      ; 5C4D   02BB 0001
        CLRR    R4                              ; 5C4F   01E4

        JSR     R5,     L_6FAA                  ; 5C50   0004 016C 03AA
        JSR     R5,     L_5D47                  ; 5C53   0004 015C 0147

        PULR    R1                              ; 5C56   02B1
        SDBD                                    ; 5C57   0001
        MVII    #$09EC, R3                      ; 5C58   02BB 00EC 0009
        MVII    #$02B6, R4                      ; 5C5B   02BC 02B6
        ADD@    R6,     R0                      ; 5C5D   02F0
L_5C5E:
        SDBD                                    ; 5C5E   0001
        MVII    #$0BB8, R5                      ; 5C5F   02BD 00B8 000B
L_5C62:
        DECR    R5                              ; 5C62   0015
        BNEQ    L_5C62                          ; 5C63   022C 0002

        DECR    R0                              ; 5C65   0010
        BMI     L_5C71                          ; 5C66   020B 0009

        MVI     G_0354, R2                      ; 5C68   0282 0354
        ADDR    R1,     R2                      ; 5C6A   00CA
        MVO     R2,     G_0354                  ; 5C6B   0242 0354
        MVO@    R3,     R4                      ; 5C6D   0263
        INCR    R4                              ; 5C6E   000C
        B       L_5C5E                          ; 5C6F   0220 0012

L_5C71:
        CLRR    R0                              ; 5C71   01C0
L_5C72:
        NOP                                     ; 5C72   0034
        NOP                                     ; 5C73   0034
        NOP                                     ; 5C74   0034
        DECR    R0                              ; 5C75   0010
        BNEQ    L_5C72                          ; 5C76   022C 0005

        JSR     R5,     L_5D66                  ; 5C78   0004 015C 0166
        JSR     R5,     G_787C                  ; 5C7B   0004 0178 007C

        SDBD                                    ; 5C7E   0001
        MVII    #$70BB, R0                      ; 5C7F   02B8 00BB 0070
        MVO     R0,     .ISRVEC.0               ; 5C82   0240 0100
        SWAP    R0,     1                       ; 5C84   0040
        MVO     R0,     .ISRVEC.1               ; 5C85   0240 0101
        B       L_5D3E                          ; 5C87   0200 00B5

L_5C89:
        MVI     G_016C, R0                      ; 5C89   0280 016C
        TSTR    R0                              ; 5C8B   0080
        BNEQ    L_5CC7                          ; 5C8C   020C 0039

        TSTR    R5                              ; 5C8E   00AD
        BNEQ    L_5CC7                          ; 5C8F   020C 0036

        MVII    #$016F, R5                      ; 5C91   02BD 016F
        MVII    #$00FF, R0                      ; 5C93   02B8 00FF
        MVII    #$0008, R1                      ; 5C95   02B9 0008
L_5C97:
        AND@    R5,     R0                      ; 5C97   03A8
        DECR    R1                              ; 5C98   0011
        BNEQ    L_5C97                          ; 5C99   022C 0003

        CMPI    #$00FF, R0                      ; 5C9B   0378 00FF
        BNEQ    L_5CC7                          ; 5C9D   020C 0028

        MVII    #$0001, R0                      ; 5C9F   02B8 0001
        MVO     R0,     G_016C                  ; 5CA1   0240 016C

        JSR     R5,     G_7C76                  ; 5CA3   0004 017C 0076

        SDBD                                    ; 5CA6   0001
        MVII    #$6DDC, R0                      ; 5CA7   02B8 00DC 006D
        MVO     R0,     G_0340                  ; 5CAA   0240 0340
        MVII    #$0102, R3                      ; 5CAC   02BB 0102
L_5CAE:
        MVI@    R3,     R0                      ; 5CAE   0298
        ANDI    #$000F, R0                      ; 5CAF   03B8 000F
        CMPI    #$000E, R0                      ; 5CB1   0378 000E
        BEQ     L_5CB9                          ; 5CB3   0204 0004

        CMPI    #$000C, R0                      ; 5CB5   0378 000C
        BNEQ    L_5CBC                          ; 5CB7   020C 0003

L_5CB9:
        JSR     R5,     G_7A96                  ; 5CB9   0004 0178 0296

L_5CBC:
        INCR    R3                              ; 5CBC   000B
        CMPI    #$011A, R3                      ; 5CBD   037B 011A
        BNEQ    L_5CAE                          ; 5CBF   022C 0012

        MVII    #$0004, R0                      ; 5CC1   02B8 0004
        MVO     R0,     G_0184                  ; 5CC3   0240 0184
        B       L_5D3E                          ; 5CC5   0200 0077

L_5CC7:
        CMPI    #$0004, R4                      ; 5CC7   037C 0004
        BMI     L_5CD1                          ; 5CC9   020B 0006

        MVI     G_0341, R0                      ; 5CCB   0280 0341
        CMPI    #$02BC, R0                      ; 5CCD   0378 02BC
        BMI     L_5CE2                          ; 5CCF   020B 0011

L_5CD1:
        JSR     R5,     L_5D74                  ; 5CD1   0004 015C 0174

        SDBD                                    ; 5CD4   0001
        ADDI    #$5D43, R2                      ; 5CD5   02FA 0043 005D

        JSR     R5,     G_7FD5                  ; 5CD8   0004 017C 03D5

        SLR     R0,     1                       ; 5CDB   0060
        CMP@    R2,     R0                      ; 5CDC   0350
        BPL     L_5CE2                          ; 5CDD   0203 0003

        JSR     R5,     L_66F0                  ; 5CDF   0004 0164 02F0

L_5CE2:
        MVI     G_0152, R0                      ; 5CE2   0280 0152
        TSTR    R0                              ; 5CE4   0080
        BNEQ    L_5D3E                          ; 5CE5   020C 0057

        SDBD                                    ; 5CE7   0001
        MVII    #$576B, R4                      ; 5CE8   02BC 006B 0057
        MVII    #$000C, R0                      ; 5CEB   02B8 000C
        MVI     G_0181, R3                      ; 5CED   0283 0181
        ADDI    #$0100, R3                      ; 5CEF   02FB 0100
        MVI@    R3,     R5                      ; 5CF1   029D
L_5CF2:
        CMP@    R4,     R5                      ; 5CF2   0365
        BEQ     L_5CFA                          ; 5CF3   0204 0005

        DECR    R0                              ; 5CF5   0010
        BNEQ    L_5CF2                          ; 5CF6   022C 0005
        B       L_5D3E                          ; 5CF8   0200 0044

L_5CFA:
        MVII    #$0310, R4                      ; 5CFA   02BC 0310
        MVII    #$0018, R0                      ; 5CFC   02B8 0018

        JSR     R5,     L_6F9A                  ; 5CFE   0004 016C 039A
        JSR     R5,     L_5D6D                  ; 5D01   0004 015C 016D
        JSR     R5,     G_7FD5                  ; 5D04   0004 017C 03D5

        MOVR    R0,     R4                      ; 5D07   0084
        MVII    #$0102, R3                      ; 5D08   02BB 0102
        MVII    #$0016, R2                      ; 5D0A   02BA 0016

L_5D0C:
        JSR     R5,     G_78FD                  ; 5D0C   0004 0178 00FD

        ADDR    R4,     R0                      ; 5D0F   00E0

        JSR     R5,     G_790A                  ; 5D10   0004 0178 010A

        INCR    R3                              ; 5D13   000B
        DECR    R2                              ; 5D14   0012
        BNEQ    L_5D0C                          ; 5D15   022C 000A

        MVII    #$0064, R2                      ; 5D17   02BA 0064

L_5D19:
        JSR     R5,     L_5D6D                  ; 5D19   0004 015C 016D

        DECR    R2                              ; 5D1C   0012
        BNEQ    L_5D19                          ; 5D1D   022C 0005

        JSR     R5,     .HEADER                 ; 5D1F   0004 0150 0000
        JSR     R5,     G_72A1                  ; 5D22   0004 0170 02A1
        JSR     R5,     L_5D74                  ; 5D25   0004 015C 0174

        SDBD                                    ; 5D28   0001
        ADDI    #$5D3F, R2                      ; 5D29   02FA 003F 005D

        JSR     R5,     G_7FE2                  ; 5D2C   0004 017C 03E2

        AND@    R2,     R5                      ; 5D2F   0395
L_5D30:
        DECR    R5                              ; 5D30   0015
        BMI     L_5D3A                          ; 5D31   020B 0007

        PSHR    R5                              ; 5D33   0275

        JSR     R5,     L_66F0                  ; 5D34   0004 0164 02F0

        PULR    R5                              ; 5D37   02B5
        B       L_5D30                          ; 5D38   0220 0009

L_5D3A:
        MVII    #$0002, R0                      ; 5D3A   02B8 0002
        MVO     R0,     G_0152                  ; 5D3C   0240 0152
L_5D3E:
        PULR    R7                              ; 5D3E   02B7
        DECLE   $0001,  $0001                   ; 5D3F   0001 0001

        DIS                                     ; 5D41   0003
        DIS                                     ; 5D42   0003
        COMR    R1                              ; 5D43   0019
        RSWD    R4                              ; 5D44   003C
        SLR     R0,     2                       ; 5D45   0064
        MOVR    R4,     R0                      ; 5D46   00A0
L_5D47:
        MVII    #$016F, R4                      ; 5D47   02BC 016F
        CLRR    R0                              ; 5D49   01C0
        MVII    #$0008, R3                      ; 5D4A   02BB 0008
        MVII    #$00FF, R1                      ; 5D4C   02B9 00FF
L_5D4E:
        CMP@    R4,     R1                      ; 5D4E   0361
        BEQ     L_5D52                          ; 5D4F   0204 0001

        INCR    R0                              ; 5D51   0008
L_5D52:
        DECR    R3                              ; 5D52   0013
        BNEQ    L_5D4E                          ; 5D53   022C 0006

        MOVR    R5,     R7                      ; 5D55   00AF
        PSHR    R5                              ; 5D56   0275
        MVO     R0,     .STIC.VIDEN             ; 5D57   0240 0020
        MVII    #$0070, R1                      ; 5D59   02B9 0070
        MVII    #$0008, R4                      ; 5D5B   02BC 0008
        MVII    #$0008, R0                      ; 5D5D   02B8 0008

        JSR     R5,     L_6F9B                  ; 5D5F   0004 016C 039B
        JSR     R5,     G_757E                  ; 5D62   0004 0174 017E

        PULR    R7                              ; 5D65   02B7
L_5D66:
        MVII    #$0200, R4                      ; 5D66   02BC 0200
        MVII    #$00F0, R0                      ; 5D68   02B8 00F0
        J       L_6F9A                          ; 5D6A   0004 036C 039A

L_5D6D:
        MVII    #$023C, R4                      ; 5D6D   02BC 023C
        MVII    #$00B4, R0                      ; 5D6F   02B8 00B4
        J       L_6F9A                          ; 5D71   0004 036C 039A

L_5D74:
        MVI     G_018B, R2                      ; 5D74   0282 018B
        SLR     R2,     1                       ; 5D76   0062
        CMPI    #$0004, R2                      ; 5D77   037A 0004
        BMI     L_5D7D                          ; 5D79   020B 0002

        MVII    #$0003, R2                      ; 5D7B   02BA 0003
L_5D7D:
        MOVR    R5,     R7                      ; 5D7D   00AF
        SUBR    R1,     R1                      ; 5D7E   0109
        ANDR    R4,     R1                      ; 5D7F   01A1
        ANDR    R4,     R1                      ; 5D80   01A1
        SUBR    R1,     R1                      ; 5D81   0109
        SUBR    R3,     R1                      ; 5D82   0119
        CMPR    R3,     R1                      ; 5D83   0159
        DECLE   $0001                           ; 5D84   0001

        ANDR    R7,     R1                      ; 5D85   01B9
        SUBR    R1,     R1                      ; 5D86   0109
        ANDR    R6,     R1                      ; 5D87   01B1
        SUBR    R5,     R1                      ; 5D88   0129
        SUBR    R3,     R1                      ; 5D89   0119
        CMPR    R7,     R1                      ; 5D8A   0179
        CMPR    R5,     R1                      ; 5D8B   0169
        ANDR    R0,     R1                      ; 5D8C   0181
        CMPR    R4,     R1                      ; 5D8D   0161
        SUBR    R5,     R1                      ; 5D8E   0129
        ANDR    R4,     R1                      ; 5D8F   01A1
        SUBR    R5,     R1                      ; 5D90   0129
        SUBR    R4,     R1                      ; 5D91   0121
        SUBR    R2,     R1                      ; 5D92   0111
        CMPR    R7,     R1                      ; 5D93   0179
        CMPR    R6,     R1                      ; 5D94   0171
        ANDR    R5,     R1                      ; 5D95   01A9
        ANDR    R3,     R1                      ; 5D96   0199
        DECLE   $0001                           ; 5D97   0001

        ANDR    R4,     R1                      ; 5D98   01A1
        CMPR    R1,     R1                      ; 5D99   0149
        CMPR    R5,     R1                      ; 5D9A   0169
        SUBR    R5,     R1                      ; 5D9B   0129
        ANDR    R3,     R1                      ; 5D9C   0199
        ADDR    R2,     R5                      ; 5D9D   00D5
        SLLC    R1,     2                       ; 5D9E   005D
        SLL     R0,     1                       ; 5D9F   0048
        SLLC    R2,     2                       ; 5DA0   005E
        SWAP    R3,     1                       ; 5DA1   0043
        SLR     R0,     1                       ; 5DA2   0060
        SLR     R2,     1                       ; 5DA3   0062
        SLLC    R2,     2                       ; 5DA4   005E
        MOVR    R1,     R5                      ; 5DA5   008D
        SLLC    R2,     2                       ; 5DA6   005E
        MOVR    R4,     R2                      ; 5DA7   00A2
        SLLC    R2,     2                       ; 5DA8   005E
        MOVR    R7,     R1                      ; 5DA9   00B9
        SLLC    R2,     2                       ; 5DAA   005E
        RRC     R2,     1                       ; 5DAB   0072
        SLLC    R3,     2                       ; 5DAC   005F
        MOVR    R3,     R7                      ; 5DAD   009F
        SLLC    R3,     2                       ; 5DAE   005F
        ADDR    R4,     R0                      ; 5DAF   00E0
        SLLC    R3,     2                       ; 5DB0   005F
        ADDR    R6,     R5                      ; 5DB1   00F5
        SLLC    R3,     2                       ; 5DB2   005F
        NOP                                     ; 5DB3   0034
        SLR     R0,     1                       ; 5DB4   0060
        MOVR    R1,     R0                      ; 5DB5   0088
        SLR     R0,     1                       ; 5DB6   0060
        TSTR    R5                              ; 5DB7   00AD
        SLR     R0,     1                       ; 5DB8   0060
        ADDR    R2,     R4                      ; 5DB9   00D4
        SLR     R0,     1                       ; 5DBA   0060
        DECLE   $0037                           ; 5DBB   0037

        SLR     R1,     1                       ; 5DBC   0061
        RLC     R3,     1                       ; 5DBD   0053
        SLLC    R2,     2                       ; 5DBE   005E
L_5DBF:
        PSHR    R5                              ; 5DBF   0275
        MVI     G_014E, R0                      ; 5DC0   0280 014E
        TSTR    R0                              ; 5DC2   0080
        BNEQ    L_5DD4                          ; 5DC3   020C 000F

        SLL     R1,     1                       ; 5DC5   0049
        MOVR    R1,     R4                      ; 5DC6   008C
        SDBD                                    ; 5DC7   0001
        ADDI    #$5D9D, R4                      ; 5DC8   02FC 009D 005D
        SDBD                                    ; 5DCB   0001
        MVI@    R4,     R5                      ; 5DCC   02A5
        SDBD                                    ; 5DCD   0001
        MVII    #$5DD4, R4                      ; 5DCE   02BC 00D4 005D
        J       G_74E5                          ; 5DD1   0004 0374 00E5

L_5DD4:
        PULR    R7                              ; 5DD4   02B7
        ADDR    R7,     R7                      ; 5DD5   00FF
        ADDR    R2,     R3                      ; 5DD6   00D3
        ADDR    R7,     R0                      ; 5DD7   00F8
        ADDR    R3,     R1                      ; 5DD8   00D9
        RLC     R0,     2                       ; 5DD9   0054
        DECR    R6                              ; 5DDA   0016
        DECLE   $0000                           ; 5DDB   0000

        ADDR    R3,     R1                      ; 5DDC   00D9
        RLC     R0,     2                       ; 5DDD   0054
        DECLE   $0036,  $0000                   ; 5DDE   0036 0000

        ADDR    R3,     R1                      ; 5DE0   00D9
        RLC     R0,     2                       ; 5DE1   0054
        RLC     R2,     2                       ; 5DE2   0056
        DECLE   $0000                           ; 5DE3   0000

        DECR    R2                              ; 5DE4   0012
        DECLE   $0000,  $0001                   ; 5DE5   0000 0001

        DIS                                     ; 5DE7   0003
        DECR    R1                              ; 5DE8   0011
        DIS                                     ; 5DE9   0003
        NEGR    R1                              ; 5DEA   0021
        DIS                                     ; 5DEB   0003
        DECR    R2                              ; 5DEC   0012
        DECLE   $0000                           ; 5DED   0000

        SWAP    R1,     1                       ; 5DEE   0041
        DIS                                     ; 5DEF   0003
        RLC     R1,     1                       ; 5DF0   0051
        DIS                                     ; 5DF1   0003
        SLR     R1,     1                       ; 5DF2   0061
        DIS                                     ; 5DF3   0003
        DECR    R2                              ; 5DF4   0012
        DECLE   $0000                           ; 5DF5   0000

        ADDR    R2,     R1                      ; 5DF6   00D1
        DIS                                     ; 5DF7   0003
        ADDR    R0,     R1                      ; 5DF8   00C1
        DIS                                     ; 5DF9   0003
        ADDR    R4,     R1                      ; 5DFA   00E1
        DIS                                     ; 5DFB   0003
        SWAP    R2,     1                       ; 5DFC   0042
        DECLE   $0001                           ; 5DFD   0001

        MOVR    R2,     R1                      ; 5DFE   0091
        DIS                                     ; 5DFF   0003
        SARC    R1,     1                       ; 5E00   0079
        RLC     R0,     2                       ; 5E01   0054
        COMR    R4                              ; 5E02   001C
        DECLE   $0000                           ; 5E03   0000

        RSWD    R1                              ; 5E04   0039
        RLC     R1,     2                       ; 5E05   0055
        SLLC    R0,     2                       ; 5E06   005C
        DECLE   $0000                           ; 5E07   0000

        SWAP    R2,     1                       ; 5E08   0042
        INCR    R1                              ; 5E09   0009
        RLC     R1,     1                       ; 5E0A   0051
        DIS                                     ; 5E0B   0003
        SWAP    R1,     1                       ; 5E0C   0041
        DIS                                     ; 5E0D   0003
        SLR     R1,     1                       ; 5E0E   0061
        DIS                                     ; 5E0F   0003
        SWAP    R2,     1                       ; 5E10   0042
        DECLE   $0000                           ; 5E11   0000

        DECR    R1                              ; 5E12   0011
        DIS                                     ; 5E13   0003
        DECLE   $0001                           ; 5E14   0001

        DIS                                     ; 5E15   0003
        NEGR    R1                              ; 5E16   0021
        DIS                                     ; 5E17   0003
        SWAP    R2,     1                       ; 5E18   0042
        DECLE   $0000                           ; 5E19   0000

        ADDR    R2,     R1                      ; 5E1A   00D1
        EIS                                     ; 5E1B   0002
        ADDR    R0,     R1                      ; 5E1C   00C1
        EIS                                     ; 5E1D   0002
        ADDR    R4,     R1                      ; 5E1E   00E1
        EIS                                     ; 5E1F   0002
        SWAP    R2,     1                       ; 5E20   0042
        DECLE   $0000                           ; 5E21   0000

        MOVR    R2,     R1                      ; 5E22   0091
        EIS                                     ; 5E23   0002
        MOVR    R0,     R1                      ; 5E24   0081
        EIS                                     ; 5E25   0002
        MOVR    R4,     R1                      ; 5E26   00A1
        EIS                                     ; 5E27   0002
        SWAP    R2,     1                       ; 5E28   0042
        DECLE   $0000                           ; 5E29   0000

        RLC     R1,     1                       ; 5E2A   0051
        EIS                                     ; 5E2B   0002
        ADDR    R3,     R1                      ; 5E2C   00D9
        RLC     R0,     2                       ; 5E2D   0054
        DECR    R2                              ; 5E2E   0012
        DECLE   $0000                           ; 5E2F   0000

        ADDR    R3,     R1                      ; 5E30   00D9
        RLC     R0,     2                       ; 5E31   0054
        RLC     R2,     1                       ; 5E32   0052
        DECLE   $0000                           ; 5E33   0000

        SWAP    R2,     1                       ; 5E34   0042
        DECLE   $0000                           ; 5E35   0000

        DECR    R1                              ; 5E36   0011
        EIS                                     ; 5E37   0002
        DECLE   $0001                           ; 5E38   0001

        EIS                                     ; 5E39   0002
        NEGR    R1                              ; 5E3A   0021
        EIS                                     ; 5E3B   0002
        SWAP    R2,     1                       ; 5E3C   0042
        DECLE   $0000                           ; 5E3D   0000

        ADDR    R2,     R1                      ; 5E3E   00D1
        DECLE   $0001                           ; 5E3F   0001

        ADDR    R0,     R1                      ; 5E40   00C1
        DECLE   $0001                           ; 5E41   0001

        ADDR    R4,     R1                      ; 5E42   00E1
        DECLE   $0001                           ; 5E43   0001

        SWAP    R2,     1                       ; 5E44   0042
        DECLE   $0000                           ; 5E45   0000

        SETC                                    ; 5E46   0007
        DECLE   $0000                           ; 5E47   0000

        INCR    R4                              ; 5E48   000C
        ADDR    R2,     R3                      ; 5E49   00D3
        ADDR    R3,     R7                      ; 5E4A   00DF
        SLR     R3,     1                       ; 5E4B   0063
        DECR    R6                              ; 5E4C   0016
        NEGR    R0                              ; 5E4D   0020
        EIS                                     ; 5E4E   0002
        ADDR    R6,     R2                      ; 5E4F   00F2
        INCR    R7                              ; 5E50   000F
        ADDR    R0,     R6                      ; 5E51   00C6
        RSWD    R7                              ; 5E52   003F
        ADDR    R6,     R4                      ; 5E53   00F4
        ADDR    R2,     R3                      ; 5E54   00D3
        ADDR    R3,     R7                      ; 5E55   00DF
        SLR     R3,     1                       ; 5E56   0063
        DECLE   $0000                           ; 5E57   0000

        RRC     R3,     1                       ; 5E58   0073
        DECLE   $0000                           ; 5E59   0000

        ADCR    R0                              ; 5E5A   0028
        INCR    R4                              ; 5E5B   000C
        SWAP    R3,     1                       ; 5E5C   0043
        TSTR    R0                              ; 5E5D   0080
        ADDR    R0,     R2                      ; 5E5E   00C2
        ADCR    R3                              ; 5E5F   002B
        SETC                                    ; 5E60   0007
        DECLE   $0000                           ; 5E61   0000

        MOVR    R4,     R7                      ; 5E62   00A7
        ADDR    R2,     R3                      ; 5E63   00D3
        ADDR    R0,     R7                      ; 5E64   00C7
        SLR     R3,     1                       ; 5E65   0063
        DECLE   $0000                           ; 5E66   0000

        RRC     R3,     1                       ; 5E67   0073
        INCR    R0                              ; 5E68   0008
        INCR    R0                              ; 5E69   0008
        INCR    R4                              ; 5E6A   000C
        COMR    R0                              ; 5E6B   0018
        INCR    R4                              ; 5E6C   000C
        SWAP    R3,     1                       ; 5E6D   0043
        DIS                                     ; 5E6E   0003
        ADDR    R4,     R1                      ; 5E6F   00E1
        DIS                                     ; 5E70   0003
        MOVR    R4,     R2                      ; 5E71   00A2
        DECLE   $0000                           ; 5E72   0000

        NEGR    R1                              ; 5E73   0021
        DIS                                     ; 5E74   0003
        ADDR    R0,     R2                      ; 5E75   00C2
        DIS                                     ; 5E76   0003
        SWAP    R3,     1                       ; 5E77   0043

        JSRD    R4,     G_B004                  ; 5E78   0004 00B2 0004

        SWAP    R3,     1                       ; 5E7B   0043
        DECLE   $0005                           ; 5E7C   0005

        MOVR    R6,     R2                      ; 5E7D   00B2
        DECLE   $0004                           ; 5E7E   0004

        SWAP    R3,     1                       ; 5E7F   0043
        CLRC                                    ; 5E80   0006
        ADDR    R4,     R2                      ; 5E81   00E2
        DECLE   $0001                           ; 5E82   0001

        ADCR    R0                              ; 5E83   0028
        INCR    R4                              ; 5E84   000C
        SWAP    R3,     1                       ; 5E85   0043
        GSWD    R2                              ; 5E86   0032
        RRC     R3,     1                       ; 5E87   0073
        DECLE   $0000                           ; 5E88   0000

        SWAP    R2,     1                       ; 5E89   0042
        CLRC                                    ; 5E8A   0006
        SETC                                    ; 5E8B   0007
        DECLE   $0000                           ; 5E8C   0000

        MOVR    R0,     R4                      ; 5E8D   0084
        ADDR    R2,     R3                      ; 5E8E   00D3
        ADDR    R3,     R7                      ; 5E8F   00DF
        SLR     R3,     1                       ; 5E90   0063
        DECLE   $0000                           ; 5E91   0000

        RRC     R3,     1                       ; 5E92   0073
        INCR    R0                              ; 5E93   0008
        SWAP    R3,     1                       ; 5E94   0043
        EIS                                     ; 5E95   0002
        ADCR    R0                              ; 5E96   0028
        INCR    R4                              ; 5E97   000C
        ADDR    R6,     R2                      ; 5E98   00F2
        DECLE   $0000                           ; 5E99   0000

        RRC     R3,     1                       ; 5E9A   0073
        DECLE   $0000                           ; 5E9B   0000

        SWAP    R3,     1                       ; 5E9C   0043
        GSWD    R2                              ; 5E9D   0032
        SWAP    R2,     1                       ; 5E9E   0042
        CLRC                                    ; 5E9F   0006
        SETC                                    ; 5EA0   0007
        DECLE   $0000                           ; 5EA1   0000

        SWAP    R0,     2                       ; 5EA2   0044
        ADDR    R2,     R3                      ; 5EA3   00D3
        ADDR    R7,     R3                      ; 5EA4   00FB
        MOVR    R1,     R3                      ; 5EA5   008B
        RSWD    R7                              ; 5EA6   003F
        MOVR    R1,     R4                      ; 5EA7   008C
        DECLE   $0001                           ; 5EA8   0001

        JSR     R4,     G_0044                  ; 5EA9   0004 0000 0044

        DECR    R4                              ; 5EAC   0014
        MOVR    R1,     R2                      ; 5EAD   008A
        DECR    R6                              ; 5EAE   0016
        MOVR    R1,     R4                      ; 5EAF   008C
        DECLE   $0001                           ; 5EB0   0001

        NEGR    R2                              ; 5EB1   0022
        DECLE   $0000                           ; 5EB2   0000

        DECR    R4                              ; 5EB3   0014
        GSWD    R2                              ; 5EB4   0032
        MOVR    R2,     R5                      ; 5EB5   0095
        ADDR    R7,     R5                      ; 5EB6   00FD
        SETC                                    ; 5EB7   0007
        DECLE   $0000                           ; 5EB8   0000

        MOVR    R6,     R2                      ; 5EB9   00B2
        ADDR    R2,     R3                      ; 5EBA   00D3
        ADDR    R7,     R5                      ; 5EBB   00FD
        MOVR    R0,     R4                      ; 5EBC   0084

        JSRE    R4,     G_880A                  ; 5EBD   0004 0089 000A

        RSWD    R4                              ; 5EC0   003C
        DECLE   $0000                           ; 5EC1   0000

        EIS                                     ; 5EC2   0002
        DECLE   $0000                           ; 5EC3   0000

        SLL     R1,     1                       ; 5EC4   0049
        INCR    R3                              ; 5EC5   000B
        SETC                                    ; 5EC6   0007
        DECLE   $0000                           ; 5EC7   0000

        EIS                                     ; 5EC8   0002
        DECLE   $0000                           ; 5EC9   0000

        MOVR    R4,     R5                      ; 5ECA   00A5
        ADDR    R7,     R4                      ; 5ECB   00FC
        ADDR    R1,     R1                      ; 5ECC   00C9
        DECLE   $0000                           ; 5ECD   0000

        RSWD    R0                              ; 5ECE   0038
        DECLE   $0000                           ; 5ECF   0000

        DECR    R2                              ; 5ED0   0012
        DECLE   $0000                           ; 5ED1   0000

        MOVR    R0,     R4                      ; 5ED2   0084

        JSRE    R4,     G_080D                  ; 5ED3   0004 0009 000D

        DIS                                     ; 5ED6   0003
        DECLE   $0000                           ; 5ED7   0000

        EIS                                     ; 5ED8   0002
        DECLE   $0000                           ; 5ED9   0000

        INCR    R1                              ; 5EDA   0009
        INCR    R6                              ; 5EDB   000E
        DIS                                     ; 5EDC   0003
        DECLE   $0000                           ; 5EDD   0000

        EIS                                     ; 5EDE   0002
        DECLE   $0000                           ; 5EDF   0000

        MOVR    R4,     R5                      ; 5EE0   00A5
        ADDR    R7,     R4                      ; 5EE1   00FC
        ADDR    R1,     R1                      ; 5EE2   00C9
        DECLE   $0000                           ; 5EE3   0000

        DIS                                     ; 5EE4   0003
        DECLE   $0000                           ; 5EE5   0000

        DECR    R2                              ; 5EE6   0012
        DECLE   $0000                           ; 5EE7   0000

        MOVR    R0,     R4                      ; 5EE8   0084

        JSRE    R4,     G_880A                  ; 5EE9   0004 0089 000A

        DIS                                     ; 5EEC   0003
        DECLE   $0000                           ; 5EED   0000

        EIS                                     ; 5EEE   0002
        DECLE   $0000                           ; 5EEF   0000

        SLL     R1,     1                       ; 5EF0   0049
        INCR    R3                              ; 5EF1   000B
        DIS                                     ; 5EF2   0003
        DECLE   $0000                           ; 5EF3   0000

        EIS                                     ; 5EF4   0002
        DECLE   $0000                           ; 5EF5   0000

        INCR    R1                              ; 5EF6   0009
        INCR    R5                              ; 5EF7   000D
        DIS                                     ; 5EF8   0003
        DECLE   $0000                           ; 5EF9   0000

        EIS                                     ; 5EFA   0002
        DECLE   $0000                           ; 5EFB   0000

        INCR    R1                              ; 5EFC   0009
        INCR    R6                              ; 5EFD   000E
        DIS                                     ; 5EFE   0003
        DECLE   $0000                           ; 5EFF   0000

        EIS                                     ; 5F00   0002
        DECLE   $0000                           ; 5F01   0000

        MOVR    R4,     R5                      ; 5F02   00A5
        ADDR    R7,     R1                      ; 5F03   00F9
        TSTR    R1                              ; 5F04   0089
        INCR    R2                              ; 5F05   000A
        DIS                                     ; 5F06   0003
        DECLE   $0000                           ; 5F07   0000

        EIS                                     ; 5F08   0002
        DECLE   $0000                           ; 5F09   0000

        SLL     R1,     1                       ; 5F0A   0049
        INCR    R3                              ; 5F0B   000B
        DIS                                     ; 5F0C   0003
        DECLE   $0000                           ; 5F0D   0000

        EIS                                     ; 5F0E   0002
        DECLE   $0000                           ; 5F0F   0000

        SLL     R1,     1                       ; 5F10   0049
        INCR    R4                              ; 5F11   000C
        DIS                                     ; 5F12   0003
        DECLE   $0000                           ; 5F13   0000

        EIS                                     ; 5F14   0002
        DECLE   $0000                           ; 5F15   0000

        INCR    R1                              ; 5F16   0009
        INCR    R5                              ; 5F17   000D
        DIS                                     ; 5F18   0003
        DECLE   $0000                           ; 5F19   0000

        EIS                                     ; 5F1A   0002
        DECLE   $0000                           ; 5F1B   0000

        TSTR    R1                              ; 5F1C   0089
        INCR    R2                              ; 5F1D   000A
        DIS                                     ; 5F1E   0003
        DECLE   $0000                           ; 5F1F   0000

        EIS                                     ; 5F20   0002
        DECLE   $0000                           ; 5F21   0000

        SLL     R1,     1                       ; 5F22   0049
        INCR    R3                              ; 5F23   000B
        DIS                                     ; 5F24   0003
        DECLE   $0000                           ; 5F25   0000

        EIS                                     ; 5F26   0002
        DECLE   $0000                           ; 5F27   0000

        INCR    R1                              ; 5F28   0009
        INCR    R5                              ; 5F29   000D
        DIS                                     ; 5F2A   0003
        DECLE   $0000                           ; 5F2B   0000

        EIS                                     ; 5F2C   0002
        DECLE   $0000                           ; 5F2D   0000

        INCR    R1                              ; 5F2E   0009
        INCR    R6                              ; 5F2F   000E
        DIS                                     ; 5F30   0003
        DECLE   $0000                           ; 5F31   0000

        EIS                                     ; 5F32   0002
        DECLE   $0000                           ; 5F33   0000

        TSTR    R1                              ; 5F34   0089
        INCR    R2                              ; 5F35   000A
        DIS                                     ; 5F36   0003
        DECLE   $0000                           ; 5F37   0000

        EIS                                     ; 5F38   0002
        DECLE   $0000                           ; 5F39   0000

        SLL     R1,     1                       ; 5F3A   0049
        INCR    R3                              ; 5F3B   000B
        DIS                                     ; 5F3C   0003
        DECLE   $0000                           ; 5F3D   0000

        EIS                                     ; 5F3E   0002
        DECLE   $0000                           ; 5F3F   0000

        SLL     R1,     1                       ; 5F40   0049
        INCR    R4                              ; 5F41   000C
        DIS                                     ; 5F42   0003
        DECLE   $0000                           ; 5F43   0000

        EIS                                     ; 5F44   0002
        DECLE   $0000                           ; 5F45   0000

        INCR    R1                              ; 5F46   0009
        INCR    R5                              ; 5F47   000D
        DIS                                     ; 5F48   0003
        DECLE   $0000                           ; 5F49   0000

        EIS                                     ; 5F4A   0002
        DECLE   $0000                           ; 5F4B   0000

        SLL     R1,     1                       ; 5F4C   0049
        INCR    R4                              ; 5F4D   000C
        DIS                                     ; 5F4E   0003
        DECLE   $0000                           ; 5F4F   0000

        EIS                                     ; 5F50   0002
        DECLE   $0000                           ; 5F51   0000

        SLL     R1,     1                       ; 5F52   0049
        INCR    R3                              ; 5F53   000B
        DECLE   $0036,  $0000                   ; 5F54   0036 0000

        EIS                                     ; 5F56   0002
        DECLE   $0000                           ; 5F57   0000

        TSTR    R1                              ; 5F58   0089
        INCR    R2                              ; 5F59   000A
        NOP                                     ; 5F5A   0034
        DECLE   $0000                           ; 5F5B   0000

        EIS                                     ; 5F5C   0002
        DECLE   $0000                           ; 5F5D   0000

        SLL     R1,     1                       ; 5F5E   0049
        INCR    R3                              ; 5F5F   000B
        GSWD    R2                              ; 5F60   0032
        DECLE   $0000                           ; 5F61   0000

        EIS                                     ; 5F62   0002
        DECLE   $0000                           ; 5F63   0000

        SLL     R1,     1                       ; 5F64   0049
        INCR    R4                              ; 5F65   000C
        GSWD    R0                              ; 5F66   0030
        DECLE   $0000                           ; 5F67   0000

        EIS                                     ; 5F68   0002
        DECLE   $0000                           ; 5F69   0000

        SLL     R1,     1                       ; 5F6A   0049
        INCR    R3                              ; 5F6B   000B
        ADCR    R6                              ; 5F6C   002E
        DECLE   $0000                           ; 5F6D   0000

        EIS                                     ; 5F6E   0002
        DECLE   $0000                           ; 5F6F   0000

        SETC                                    ; 5F70   0007
        DECLE   $0000                           ; 5F71   0000

        ADCR    R1                              ; 5F72   0029
        ADDR    R2,     R3                      ; 5F73   00D3
        ADDR    R7,     R6                      ; 5F74   00FE
        ADDR    R0,     R4                      ; 5F75   00C4
        INCR    R2                              ; 5F76   000A
        INCR    R1                              ; 5F77   0009
        DECLE   $0005                           ; 5F78   0005

        COMR    R2                              ; 5F79   001A
        DECLE   $0000                           ; 5F7A   0000

        EIS                                     ; 5F7B   0002
        DECLE   $0000                           ; 5F7C   0000

        SLL     R1,     1                       ; 5F7D   0049
        DECLE   $0005,  $0001,  $0000           ; 5F7E   0005 0001 0000

        EIS                                     ; 5F81   0002
        DECLE   $0000                           ; 5F82   0000

        SARC    R1,     1                       ; 5F83   0079
        DECLE   $0005,  $0001,  $0000           ; 5F84   0005 0001 0000

        EIS                                     ; 5F87   0002
        DECLE   $0000                           ; 5F88   0000

        MOVR    R7,     R1                      ; 5F89   00B9
        DECLE   $0005,  $0001,  $0000           ; 5F8A   0005 0001 0000

        EIS                                     ; 5F8D   0002
        DECLE   $0000                           ; 5F8E   0000

        ADDR    R5,     R1                      ; 5F8F   00E9
        DECLE   $0005,  $0001,  $0000           ; 5F90   0005 0001 0000

        EIS                                     ; 5F93   0002
        DECLE   $0000                           ; 5F94   0000

        ADCR    R1                              ; 5F95   0029
        CLRC                                    ; 5F96   0006
        DECR    R4                              ; 5F97   0014
        DECLE   $0000                           ; 5F98   0000

        DECR    R2                              ; 5F99   0012
        DECLE   $0000                           ; 5F9A   0000

        MOVR    R6,     R5                      ; 5F9B   00B5
        ADDR    R6,     R6                      ; 5F9C   00F6
        SETC                                    ; 5F9D   0007
        DECLE   $0000                           ; 5F9E   0000

        NEGR    R1                              ; 5F9F   0021
        ADDR    R2,     R3                      ; 5FA0   00D3
        ADDR    R7,     R6                      ; 5FA1   00FE
        SAR     R1,     1                       ; 5FA2   0069
        GSWD    R3                              ; 5FA3   0033
        COMR    R4                              ; 5FA4   001C
        DECLE   $0000                           ; 5FA5   0000

        DECR    R2                              ; 5FA6   0012
        DECLE   $0000                           ; 5FA7   0000

        MOVR    R3,     R1                      ; 5FA8   0099
        DECLE   $0037,  $0001,  $0000           ; 5FA9   0037 0001 0000

        DECR    R2                              ; 5FAC   0012
        DECLE   $0000,  $0001,  $0000           ; 5FAD   0000 0001 0000

        GSWD    R2                              ; 5FB0   0032
        DECLE   $0000                           ; 5FB1   0000

        SAR     R1,     1                       ; 5FB2   0069
        GSWD    R3                              ; 5FB3   0033
        COMR    R0                              ; 5FB4   0018
        DECLE   $0000                           ; 5FB5   0000

        DECR    R2                              ; 5FB6   0012
        DECLE   $0000                           ; 5FB7   0000

        MOVR    R3,     R1                      ; 5FB8   0099
        DECLE   $0037,  $0001,  $0000           ; 5FB9   0037 0001 0000

        DECR    R2                              ; 5FBC   0012
        DECLE   $0000,  $0001,  $0000           ; 5FBD   0000 0001 0000

        GSWD    R2                              ; 5FC0   0032
        DECLE   $0000                           ; 5FC1   0000

        SAR     R1,     1                       ; 5FC2   0069
        GSWD    R3                              ; 5FC3   0033
        DECR    R4                              ; 5FC4   0014
        DECLE   $0000                           ; 5FC5   0000

        DECR    R2                              ; 5FC6   0012
        DECLE   $0000                           ; 5FC7   0000

        MOVR    R3,     R1                      ; 5FC8   0099
        DECLE   $0037,  $0001,  $0000           ; 5FC9   0037 0001 0000

        DECR    R2                              ; 5FCC   0012
        DECLE   $0000,  $0001,  $0000           ; 5FCD   0000 0001 0000

        GSWD    R2                              ; 5FD0   0032
        DECLE   $0000                           ; 5FD1   0000

        SAR     R1,     1                       ; 5FD2   0069
        GSWD    R3                              ; 5FD3   0033
        DECR    R0                              ; 5FD4   0010
        DECLE   $0000                           ; 5FD5   0000

        DECR    R2                              ; 5FD6   0012
        DECLE   $0000                           ; 5FD7   0000

        MOVR    R3,     R1                      ; 5FD8   0099
        DECLE   $0037,  $0001,  $0000           ; 5FD9   0037 0001 0000

        DECR    R2                              ; 5FDC   0012
        DECLE   $0000                           ; 5FDD   0000

        SETC                                    ; 5FDE   0007
        DECLE   $0000                           ; 5FDF   0000

        RLC     R0,     2                       ; 5FE0   0054
        ADDR    R2,     R3                      ; 5FE1   00D3
        ADDR    R7,     R3                      ; 5FE2   00FB

        JSR     R4,     G_28B9                  ; 5FE3   0004 0028 00B9

        DECR    R1                              ; 5FE6   0011
        RLC     R2,     2                       ; 5FE7   0056
        DECLE   $0000                           ; 5FE8   0000

        DECR    R2                              ; 5FE9   0012
        DECLE   $0000                           ; 5FEA   0000

        COMR    R1                              ; 5FEB   0019
        GSWD    R2                              ; 5FEC   0032
        RLC     R2,     2                       ; 5FED   0056
        DECLE   $0000                           ; 5FEE   0000

        DECR    R2                              ; 5FEF   0012
        DECLE   $0000                           ; 5FF0   0000

        MOVR    R0,     R5                      ; 5FF1   0085
        ADDR    R7,     R4                      ; 5FF2   00FC
        SETC                                    ; 5FF3   0007
        DECLE   $0000                           ; 5FF4   0000

        SLL     R0,     2                       ; 5FF5   004C
        ADDR    R2,     R3                      ; 5FF6   00D3
        ADDR    R7,     R3                      ; 5FF7   00FB
        RRC     R3,     1                       ; 5FF8   0073
        DECLE   $0000                           ; 5FF9   0000

        ADCR    R0                              ; 5FFA   0028
        INCR    R4                              ; 5FFB   000C
        SWAP    R3,     1                       ; 5FFC   0043
        GSWD    R0                              ; 5FFD   0030

        JSR     R4,     G_0C39                  ; 5FFE   0004 000C 0039

        DECR    R5                              ; 6001   0015
        DECLE   $0005,  $0000                   ; 6002   0005 0000

        DECR    R2                              ; 6004   0012
        DECLE   $0000                           ; 6005   0000

        ADDR    R7,     R1                      ; 6006   00F9
        DECR    R4                              ; 6007   0014
L_6008:
        DECLE   $0005,  $0000                   ; 6008   0005 0000

        DECR    R2                              ; 600A   0012
        DECLE   $0000                           ; 600B   0000

        ADDR    R3,     R1                      ; 600C   00D9
        DECR    R1                              ; 600D   0011
        DECLE   $0005,  $0000                   ; 600E   0005 0000

        DECR    R2                              ; 6010   0012
        DECLE   $0000                           ; 6011   0000

        MOVR    R3,     R1                      ; 6012   0099
        DECR    R1                              ; 6013   0011
        DECLE   $0005,  $0000                   ; 6014   0005 0000

        DECR    R2                              ; 6016   0012
        DECLE   $0000                           ; 6017   0000

        SAR     R1,     1                       ; 6018   0069
        INCR    R5                              ; 6019   000D
        DECLE   $0005,  $0000                   ; 601A   0005 0000

        DECR    R2                              ; 601C   0012
        DECLE   $0000                           ; 601D   0000

        SLL     R1,     1                       ; 601E   0049
        INCR    R5                              ; 601F   000D
        DECLE   $0005                           ; 6020   0005
L_6021:
        DECLE   $0000                           ; 6021   0000

        DECR    R2                              ; 6022   0012
        DECLE   $0000                           ; 6023   0000

        ADDR    R1,     R1                      ; 6024   00C9
        COMR    R2                              ; 6025   001A
        DECLE   $0005,  $0000                   ; 6026   0005 0000

        DECR    R2                              ; 6028   0012
        DECLE   $0000                           ; 6029   0000

        TSTR    R1                              ; 602A   0089
        COMR    R2                              ; 602B   001A
        DECLE   $0005,  $0000                   ; 602C   0005 0000

        DECR    R2                              ; 602E   0012
        DECLE   $0000                           ; 602F   0000

        MOVR    R0,     R5                      ; 6030   0085
        ADDR    R6,     R3                      ; 6031   00F3
        SETC                                    ; 6032   0007
        DECLE   $0000                           ; 6033   0000

        SWAP    R0,     2                       ; 6034   0044
        ADDR    R2,     R3                      ; 6035   00D3
        ADDR    R3,     R7                      ; 6036   00DF
        SLR     R3,     1                       ; 6037   0063
        DECLE   $0000                           ; 6038   0000

        SWAP    R3,     1                       ; 6039   0043
        ADCR    R0                              ; 603A   0028
        ADCR    R0                              ; 603B   0028
        INCR    R4                              ; 603C   000C
        RRC     R3,     1                       ; 603D   0073
        DECLE   $0000                           ; 603E   0000

        SWAP    R2,     1                       ; 603F   0042
        CLRC                                    ; 6040   0006
        SETC                                    ; 6041   0007
        DECLE   $0000                           ; 6042   0000

        ADCR    R4                              ; 6043   002C
        ADDR    R2,     R3                      ; 6044   00D3
        ADDR    R3,     R7                      ; 6045   00DF
        SLR     R3,     1                       ; 6046   0063
        DECLE   $0005                           ; 6047   0005

        ADDR    R4,     R1                      ; 6048   00E1
        DIS                                     ; 6049   0003
        EIS                                     ; 604A   0002
        DECLE   $0000                           ; 604B   0000

        SLR     R3,     1                       ; 604C   0063
        DECR    R4                              ; 604D   0014
        ADDR    R4,     R1                      ; 604E   00E1
        DIS                                     ; 604F   0003
        DECR    R2                              ; 6050   0012
        DECLE   $0000                           ; 6051   0000

        MOVR    R4,     R1                      ; 6052   00A1
        DIS                                     ; 6053   0003
        DECR    R2                              ; 6054   0012
        DECLE   $0000                           ; 6055   0000

        SLR     R1,     1                       ; 6056   0061
        DIS                                     ; 6057   0003
        DECR    R2                              ; 6058   0012
        DECLE   $0000                           ; 6059   0000

        NEGR    R1                              ; 605A   0021
        DIS                                     ; 605B   0003
        SLR     R3,     1                       ; 605C   0063
        DECR    R0                              ; 605D   0010
        SWAP    R2,     1                       ; 605E   0042
        DECLE   $0000                           ; 605F   0000

        SLR     R3,     1                       ; 6060   0063
        INCR    R6                              ; 6061   000E
        NEGR    R1                              ; 6062   0021
        DIS                                     ; 6063   0003
        SWAP    R2,     1                       ; 6064   0042
        DECLE   $0000                           ; 6065   0000

        SLR     R3,     1                       ; 6066   0063
        CLRC                                    ; 6067   0006
        ADDR    R4,     R1                      ; 6068   00E1
        EIS                                     ; 6069   0002
        SWAP    R2,     1                       ; 606A   0042
        DECLE   $0000                           ; 606B   0000

        SLR     R3,     1                       ; 606C   0063

        JSRE    R4,     G_A002                  ; 606D   0004 00A1 0002

        SLR     R2,     1                       ; 6070   0062
        DECLE   $0000                           ; 6071   0000

        SLR     R3,     1                       ; 6072   0063
        EIS                                     ; 6073   0002
        MOVR    R0,     R2                      ; 6074   0082
        DECLE   $0000                           ; 6075   0000

        SLR     R3,     1                       ; 6076   0063
        DECLE   $0001                           ; 6077   0001

        SLR     R2,     1                       ; 6078   0062
        DECLE   $0000                           ; 6079   0000

        SLR     R1,     1                       ; 607A   0061
        EIS                                     ; 607B   0002
        SWAP    R2,     1                       ; 607C   0042
        DECLE   $0000                           ; 607D   0000

        NEGR    R1                              ; 607E   0021
        EIS                                     ; 607F   0002
        SWAP    R2,     1                       ; 6080   0042
        DECLE   $0000                           ; 6081   0000

        ADDR    R4,     R1                      ; 6082   00E1
        DECLE   $0001                           ; 6083   0001

        SWAP    R2,     1                       ; 6084   0042
        DECLE   $0000                           ; 6085   0000

        SETC                                    ; 6086   0007
        DECLE   $0000                           ; 6087   0000

        RSWD    R4                              ; 6088   003C
        ADDR    R2,     R3                      ; 6089   00D3
        ADDR    R3,     R3                      ; 608A   00DB
        SLR     R3,     1                       ; 608B   0063
        DECLE   $0005                           ; 608C   0005

        INCR    R1                              ; 608D   0009
        INCR    R5                              ; 608E   000D
        SLLC    R0,     2                       ; 608F   005C
        DECLE   $0000                           ; 6090   0000

        EIS                                     ; 6091   0002
        DECLE   $0000                           ; 6092   0000

        INCR    R1                              ; 6093   0009
        INCR    R4                              ; 6094   000C
        DECLE   $0005,  $0000                   ; 6095   0005 0000

        EIS                                     ; 6097   0002
        DECLE   $0000                           ; 6098   0000

        SLR     R3,     1                       ; 6099   0063

        JSRE    R4,     G_080B                  ; 609A   0004 0009 000B
        DECLE   $0005,  $0000                   ; 609D   0005 0000

        EIS                                     ; 609F   0002
        DECLE   $0000                           ; 60A0   0000

        SLR     R3,     1                       ; 60A1   0063
        DIS                                     ; 60A2   0003
        INCR    R1                              ; 60A3   0009
        INCR    R2                              ; 60A4   000A
        DECLE   $0005,  $0000                   ; 60A5   0005 0000

        EIS                                     ; 60A7   0002
        DECLE   $0000                           ; 60A8   0000

        SLR     R3,     1                       ; 60A9   0063
        EIS                                     ; 60AA   0002
        SETC                                    ; 60AB   0007
        DECLE   $0000                           ; 60AC   0000

        ADCR    R2                              ; 60AD   002A
        ADDR    R2,     R3                      ; 60AE   00D3
        ADDR    R7,     R5                      ; 60AF   00FD
        MOVR    R0,     R4                      ; 60B0   0084
        RSWD    R4                              ; 60B1   003C
        ADDR    R1,     R3                      ; 60B2   00CB
        DECR    R7                              ; 60B3   0017
        MOVR    R1,     R6                      ; 60B4   008E
        DECLE   $0001                           ; 60B5   0001

        JSRE    R4,     G_00CA                  ; 60B6   0004 0001 00CA

        INCR    R6                              ; 60B9   000E
        MOVR    R1,     R6                      ; 60BA   008E
        DECLE   $0001                           ; 60BB   0001

        NEGR    R2                              ; 60BC   0022
        DECLE   $0000                           ; 60BD   0000

        DECR    R4                              ; 60BE   0014
        DIS                                     ; 60BF   0003
        MOVR    R4,     R5                      ; 60C0   00A5
        ADDR    R7,     R5                      ; 60C1   00FD
        DECR    R1                              ; 60C2   0011
        DIS                                     ; 60C3   0003
        NEGR    R2                              ; 60C4   0022
        DECLE   $0000                           ; 60C5   0000

        ADDR    R2,     R1                      ; 60C6   00D1
        EIS                                     ; 60C7   0002
        NEGR    R2                              ; 60C8   0022
        DECLE   $0000                           ; 60C9   0000

        MOVR    R2,     R1                      ; 60CA   0091
        EIS                                     ; 60CB   0002
        NEGR    R2                              ; 60CC   0022
        DECLE   $0000                           ; 60CD   0000

        RLC     R1,     1                       ; 60CE   0051
        EIS                                     ; 60CF   0002
        NEGR    R2                              ; 60D0   0022
        DECLE   $0000                           ; 60D1   0000

        SETC                                    ; 60D2   0007
        DECLE   $0000                           ; 60D3   0000

        RLC     R0,     2                       ; 60D4   0054
        ADDR    R2,     R3                      ; 60D5   00D3
        ADDR    R3,     R7                      ; 60D6   00DF
        SLR     R3,     1                       ; 60D7   0063
        INCR    R7                              ; 60D8   000F
        NEGR    R1                              ; 60D9   0021
        EIS                                     ; 60DA   0002
        EIS                                     ; 60DB   0002
        DECLE   $0000                           ; 60DC   0000

        SLR     R3,     1                       ; 60DD   0063
        DECR    R1                              ; 60DE   0011
        SLR     R1,     1                       ; 60DF   0061
        EIS                                     ; 60E0   0002
        EIS                                     ; 60E1   0002
        DECLE   $0000                           ; 60E2   0000

        SLR     R3,     1                       ; 60E3   0063
        DECR    R5                              ; 60E4   0015
        MOVR    R4,     R1                      ; 60E5   00A1
        EIS                                     ; 60E6   0002
        DECR    R2                              ; 60E7   0012
        DECLE   $0000                           ; 60E8   0000

        SLR     R3,     1                       ; 60E9   0063
        COMR    R1                              ; 60EA   0019
        ADDR    R4,     R1                      ; 60EB   00E1
        EIS                                     ; 60EC   0002
        DECR    R2                              ; 60ED   0012
        DECLE   $0000                           ; 60EE   0000

        SLR     R3,     1                       ; 60EF   0063
        DECLE   $0000                           ; 60F0   0000

        NEGR    R1                              ; 60F1   0021
        DIS                                     ; 60F2   0003
        DECR    R2                              ; 60F3   0012
        DECLE   $0000                           ; 60F4   0000

        SLR     R1,     1                       ; 60F5   0061
        DIS                                     ; 60F6   0003
        DECR    R2                              ; 60F7   0012
        DECLE   $0000                           ; 60F8   0000

        MOVR    R4,     R1                      ; 60F9   00A1
        DIS                                     ; 60FA   0003
        DECR    R2                              ; 60FB   0012
        DECLE   $0000                           ; 60FC   0000

        ADDR    R4,     R1                      ; 60FD   00E1
        DIS                                     ; 60FE   0003
        DECR    R2                              ; 60FF   0012
        DECLE   $0000                           ; 6100   0000

        SLR     R3,     1                       ; 6101   0063
        COMR    R3                              ; 6102   001B
        NEGR    R2                              ; 6103   0022
        DECLE   $0000                           ; 6104   0000

        SLR     R3,     1                       ; 6105   0063
        DECR    R7                              ; 6106   0017
        NEGR    R2                              ; 6107   0022
        DECLE   $0000                           ; 6108   0000

        SLR     R3,     1                       ; 6109   0063
        DECR    R3                              ; 610A   0013
        NEGR    R2                              ; 610B   0022
        DECLE   $0000                           ; 610C   0000

        SLR     R3,     1                       ; 610D   0063
        DECR    R1                              ; 610E   0011
        NEGR    R2                              ; 610F   0022
        DECLE   $0000                           ; 6110   0000

        SLR     R1,     1                       ; 6111   0061
        DIS                                     ; 6112   0003
        SLR     R3,     1                       ; 6113   0063
        INCR    R5                              ; 6114   000D
        NEGR    R2                              ; 6115   0022
        DECLE   $0000                           ; 6116   0000

        SLR     R3,     1                       ; 6117   0063
        INCR    R3                              ; 6118   000B
        NEGR    R2                              ; 6119   0022
        DECLE   $0000                           ; 611A   0000

        MOVR    R4,     R1                      ; 611B   00A1
        DIS                                     ; 611C   0003
        SLR     R3,     1                       ; 611D   0063
        INCR    R1                              ; 611E   0009
        NEGR    R2                              ; 611F   0022
        DECLE   $0000                           ; 6120   0000

        SLR     R3,     1                       ; 6121   0063
        SETC                                    ; 6122   0007
        NEGR    R2                              ; 6123   0022
        DECLE   $0000                           ; 6124   0000

        SLR     R3,     1                       ; 6125   0063
        DECLE   $0005                           ; 6126   0005

        NEGR    R2                              ; 6127   0022
        DECLE   $0000                           ; 6128   0000

        SLR     R3,     1                       ; 6129   0063
        DIS                                     ; 612A   0003
        NEGR    R2                              ; 612B   0022
        DECLE   $0000                           ; 612C   0000

        SLR     R3,     1                       ; 612D   0063
        EIS                                     ; 612E   0002
        NEGR    R2                              ; 612F   0022
        DECLE   $0000                           ; 6130   0000

        SLR     R3,     1                       ; 6131   0063
        DECLE   $0001                           ; 6132   0001

        NEGR    R2                              ; 6133   0022
        DECLE   $0000                           ; 6134   0000

        SETC                                    ; 6135   0007
        DECLE   $0000                           ; 6136   0000

        MOVR    R2,     R6                      ; 6137   0096
        ADDR    R2,     R3                      ; 6138   00D3
        ADDR    R7,     R1                      ; 6139   00F9
        SWAP    R3,     1                       ; 613A   0043
        DECLE   $0001                           ; 613B   0001

        DIS                                     ; 613C   0003
        SARC    R3,     2                       ; 613D   007F
        ADCR    R0                              ; 613E   0028
        INCR    R4                              ; 613F   000C
        COMR    R0                              ; 6140   0018
        INCR    R4                              ; 6141   000C
        RRC     R3,     1                       ; 6142   0073
        INCR    R6                              ; 6143   000E
        INCR    R3                              ; 6144   000B
        SAR     R3,     1                       ; 6145   006B
        MOVR    R1,     R6                      ; 6146   008E
        DECLE   $0001                           ; 6147   0001

        SWAP    R0,     2                       ; 6148   0044
        DECLE   $0000                           ; 6149   0000

        JSRD    R4,     G_288A                  ; 614A   0004 002A 008A

        INCR    R6                              ; 614D   000E
        MOVR    R1,     R6                      ; 614E   008E
        DECLE   $0001                           ; 614F   0001

        ADCR    R3                              ; 6150   002B
        DECLE   $0001                           ; 6151   0001

        MOVR    R1,     R6                      ; 6152   008E
        DECLE   $0001                           ; 6153   0001

        MOVR    R3,     R2                      ; 6154   009A
        DECR    R6                              ; 6155   0016
        MOVR    R1,     R6                      ; 6156   008E
        DECLE   $0001                           ; 6157   0001

        RLC     R2,     1                       ; 6158   0052
        DECLE   $0000                           ; 6159   0000

        ADCR    R3                              ; 615A   002B
        DIS                                     ; 615B   0003
        MOVR    R1,     R6                      ; 615C   008E
        DECLE   $0001,  $0005                   ; 615D   0001 0005

        ADDR    R7,     R3                      ; 615F   00FB
        SETC                                    ; 6160   0007
        DECLE   $0000                           ; 6161   0000
L_6162:
        PSHR    R5                              ; 6162   0275
        MVI     G_0190, R0                      ; 6163   0280 0190
        TSTR    R0                              ; 6165   0080
        BNEQ    L_61BF                          ; 6166   020C 0057

        MVI     G_0154, R0                      ; 6168   0280 0154
        DECR    R0                              ; 616A   0010
        BMI     L_61BF                          ; 616B   020B 0052

        MVO     R0,     G_0154                  ; 616D   0240 0154
        MVII    #$0191, R4                      ; 616F   02BC 0191
        MVII    #$0003, R3                      ; 6171   02BB 0003
L_6173:
        MVI@    R4,     R0                      ; 6173   02A0
        TSTR    R0                              ; 6174   0080
        BEQ     L_617C                          ; 6175   0204 0005

        DECR    R3                              ; 6177   0013
        BNEQ    L_6173                          ; 6178   022C 0006
        B       L_61BF                          ; 617A   0200 0043

L_617C:
        DECR    R4                              ; 617C   0014
        MVI     G_0150, R1                      ; 617D   0281 0150
        SDBD                                    ; 617F   0001
        ADDI    #$61C0, R1                      ; 6180   02F9 00C0 0061
        MVI     G_0343, R0                      ; 6183   0280 0343
        ADD@    R1,     R0                      ; 6185   02C8
        SLR     R0,     2                       ; 6186   0064
        SLR     R0,     1                       ; 6187   0060
        ANDI    #$001F, R0                      ; 6188   03B8 001F
        MVI     G_0318, R1                      ; 618A   0281 0318
        SUBI    #$0006, R1                      ; 618C   0339 0006
        MOVR    R1,     R2                      ; 618E   008A
        ANDI    #$0078, R1                      ; 618F   03B9 0078
        ADDR    R1,     R1                      ; 6191   00C9
        PSHR    R1                              ; 6192   0271
        SLR     R1,     2                       ; 6193   0065
        ADD@    R6,     R1                      ; 6194   02F1
        MOVR    R1,     R5                      ; 6195   008D
        ADDR    R0,     R1                      ; 6196   00C1
        PSHR    R1                              ; 6197   0271
        PSHR    R4                              ; 6198   0274
        ADDI    #$0200, R1                      ; 6199   02F9 0200
        ADDI    #$0003, R4                      ; 619B   02FC 0003
        MVI     G_0150, R0                      ; 619D   0280 0150
        SWAP    R0,     1                       ; 619F   0040
        SLR     R0,     1                       ; 61A0   0060
        BEQ     L_61A5                          ; 61A1   0204 0002

        ADDI    #$0013, R5                      ; 61A3   02FD 0013
L_61A5:
        INCR    R0                              ; 61A5   0008
        ANDI    #$0007, R2                      ; 61A6   03BA 0007
        SLL     R2,     2                       ; 61A8   004E
        SLL     R2,     1                       ; 61A9   004A
        ADDR    R2,     R0                      ; 61AA   00D0
        MVO@    R0,     R4                      ; 61AB   0260
        ADDI    #$0002, R4                      ; 61AC   02FC 0002
        MVO@    R5,     R4                      ; 61AE   0265
        MOVR    R2,     R4                      ; 61AF   0094

        JSR     R5,     L_6231                  ; 61B0   0004 0160 0231

        MVII    #$0006, R0                      ; 61B3   02B8 0006
        MVO     R0,     G_0190                  ; 61B5   0240 0190
        PULR    R4                              ; 61B7   02B4
        PULR    R1                              ; 61B8   02B1
        MVO@    R1,     R4                      ; 61B9   0261
        MVII    #$0002, R1                      ; 61BA   02B9 0002

        JSR     R5,     L_5DBF                  ; 61BC   0004 015C 01BF

L_61BF:
        PULR    R7                              ; 61BF   02B7
        XOR@    R6,     R0                      ; 61C0   03F0
        INCR    R0                              ; 61C1   0008
L_61C2:
        PSHR    R5                              ; 61C2   0275
        MVI     G_0153, R0                      ; 61C3   0280 0153
        DECR    R0                              ; 61C5   0010
        BMI     L_61CA                          ; 61C6   020B 0002

        MVO     R0,     G_0153                  ; 61C8   0240 0153
L_61CA:
        MVII    #$0191, R3                      ; 61CA   02BB 0191
        MVII    #$0194, R2                      ; 61CC   02BA 0194
L_61CE:
        MVI@    R3,     R1                      ; 61CE   0299
        TSTR    R1                              ; 61CF   0089
        BEQ     L_6223                          ; 61D0   0204 0051

        ADDI    #$0006, R3                      ; 61D2   02FB 0006
        MVI@    R3,     R0                      ; 61D4   0298
        SUBI    #$0006, R3                      ; 61D5   033B 0006
        CMPR    R0,     R1                      ; 61D7   0141
        BEQ     L_61F3                          ; 61D8   0204 0019

        DECR    R1                              ; 61DA   0011
        MVI@    R2,     R0                      ; 61DB   0290
        SWAP    R0,     2                       ; 61DC   0044
        BPL     L_61E1                          ; 61DD   0203 0002

        ADDI    #$0002, R1                      ; 61DF   02F9 0002
L_61E1:
        MVO@    R1,     R3                      ; 61E1   0259
        ADDI    #$0200, R1                      ; 61E2   02F9 0200
        MOVR    R0,     R4                      ; 61E4   0084
        ANDI    #$0038, R4                      ; 61E5   03BC 0038

        JSR     R5,     L_6231                  ; 61E7   0004 0160 0231

        MVI@    R2,     R0                      ; 61EA   0290
        INCR    R0                              ; 61EB   0008
        MVO@    R0,     R2                      ; 61EC   0250
        ANDI    #$0007, R0                      ; 61ED   03B8 0007
        CMPI    #$0006, R0                      ; 61EF   0378 0006
        BMI     L_6223                          ; 61F1   020B 0030

L_61F3:
        MVI@    R3,     R1                      ; 61F3   0299
        ADDI    #$0200, R1                      ; 61F4   02F9 0200
        MVI@    R2,     R0                      ; 61F6   0290
        DECR    R0                              ; 61F7   0010
        MVO@    R0,     R2                      ; 61F8   0250
        MOVR    R0,     R5                      ; 61F9   0085
        ANDI    #$0007, R5                      ; 61FA   03BD 0007
        PSHR    R5                              ; 61FC   0275
        SWAP    R0,     2                       ; 61FD   0044
        BPL     L_6201                          ; 61FE   0203 0001

        NEGR    R5                              ; 6200   0025
L_6201:
        ADDR    R5,     R1                      ; 6201   00E9
        MVI@    R1,     R0                      ; 6202   0288
        MOVR    R0,     R5                      ; 6203   0085
        ANDI    #$0004, R0                      ; 6204   03B8 0004
        BNEQ    L_6211                          ; 6206   020C 0009

        TSTR    R5                              ; 6208   00AD
        BPL     L_621C                          ; 6209   0203 0011

        SDBD                                    ; 620B   0001
        MVII    #$09A3, R0                      ; 620C   02B8 00A3 0009
        B       L_621D                          ; 620F   0200 000C

L_6211:
        MVI@    R1,     R0                      ; 6211   0288
        SWAP    R0,     1                       ; 6212   0040
        SLR     R0,     2                       ; 6213   0064
        ANDI    #$0038, R0                      ; 6214   03B8 0038
        SDBD                                    ; 6216   0001
        ADDI    #$0802, R0                      ; 6217   02F8 0002 0008
        B       L_621D                          ; 621A   0200 0001

L_621C:
        CLRR    R0                              ; 621C   01C0
L_621D:
        MVO@    R0,     R1                      ; 621D   0248
        PULR    R5                              ; 621E   02B5
        TSTR    R5                              ; 621F   00AD
        BNEQ    L_6223                          ; 6220   020C 0001

        MVO@    R5,     R3                      ; 6222   025D
L_6223:
        INCR    R2                              ; 6223   000A
        INCR    R3                              ; 6224   000B
        CMPI    #$0194, R3                      ; 6225   037B 0194
        BNEQ    L_61CE                          ; 6227   022C 005A

        MVI     G_0190, R0                      ; 6229   0280 0190
        DECR    R0                              ; 622B   0010
        BMI     L_6230                          ; 622C   020B 0002

        MVO     R0,     G_0190                  ; 622E   0240 0190
L_6230:
        PULR    R7                              ; 6230   02B7
L_6231:
        MVI@    R1,     R0                      ; 6231   0288
        TSTR    R0                              ; 6232   0080
        BEQ     L_6263                          ; 6233   0204 002E

        ANDI    #$01F8, R0                      ; 6235   03B8 01F8
        CMPI    #$0040, R0                      ; 6237   0378 0040
        BMI     L_625F                          ; 6239   020B 0024

        CMPI    #$01E8, R0                      ; 623B   0378 01E8
        BEQ     L_624C                          ; 623D   0204 000D

        CMPI    #$0128, R0                      ; 623F   0378 0128
        BMI     L_624B                          ; 6241   020B 0008

        CMPI    #$0158, R0                      ; 6243   0378 0158
        BMI     L_6270                          ; 6245   020B 0029

        CMPI    #$01A0, R0                      ; 6247   0378 01A0
        BEQ     L_626A                          ; 6249   0204 001F

L_624B:
        MOVR    R5,     R7                      ; 624B   00AF
L_624C:
        PSHR    R5                              ; 624C   0275
        MVI@    R1,     R0                      ; 624D   0288
        SLLC    R0,     2                       ; 624E   005C
        RLC     R0,     2                       ; 624F   0054
        RLC     R0,     1                       ; 6250   0050
        ANDI    #$0007, R0                      ; 6251   03B8 0007
        ADDI    #$016F, R0                      ; 6253   02F8 016F
        MOVR    R0,     R5                      ; 6255   0085
        MVII    #$00FF, R0                      ; 6256   02B8 00FF
        MVO@    R0,     R5                      ; 6258   0268
        SDBD                                    ; 6259   0001
        ADDI    #$09AB, R4                      ; 625A   02FC 00AB 0009
        MVO@    R4,     R1                      ; 625D   024C
        PULR    R7                              ; 625E   02B7
L_625F:
        SWAP    R0,     1                       ; 625F   0040
        SLL     R0,     2                       ; 6260   004C
        ADDI    #$0004, R0                      ; 6261   02F8 0004
L_6263:
        ADDR    R4,     R0                      ; 6263   00E0
        SDBD                                    ; 6264   0001
        ADDI    #$09AB, R0                      ; 6265   02F8 00AB 0009
        MVO@    R0,     R1                      ; 6268   0248
L_6269:
        MOVR    R5,     R7                      ; 6269   00AF
L_626A:
        SDBD                                    ; 626A   0001
        ADDI    #$89AB, R4                      ; 626B   02FC 00AB 0089
        MVO@    R4,     R1                      ; 626E   024C
        MOVR    R5,     R7                      ; 626F   00AF
L_6270:
        PSHR    R5                              ; 6270   0275
        PSHR    R1                              ; 6271   0271
        PSHR    R2                              ; 6272   0272
        SUBI    #$023C, R1                      ; 6273   0339 023C
        MVII    #$0002, R2                      ; 6275   02BA 0002
L_6277:
        INCR    R2                              ; 6277   000A
        SUBI    #$0014, R1                      ; 6278   0339 0014
        BPL     L_6277                          ; 627A   0223 0004

        SLL     R2,     2                       ; 627C   004E
        SLL     R2,     1                       ; 627D   004A
        MOVR    R4,     R0                      ; 627E   00A0
        SLR     R0,     2                       ; 627F   0064
        SLR     R0,     1                       ; 6280   0060
        ADDR    R0,     R2                      ; 6281   00C2
        SLL     R2,     1                       ; 6282   004A
        SUBI    #$0040, R2                      ; 6283   033A 0040
        MVII    #$0102, R1                      ; 6285   02B9 0102
L_6287:
        MVI@    R1,     R0                      ; 6287   0288
        ANDI    #$000F, R0                      ; 6288   03B8 000F
        CMPI    #$000F, R0                      ; 628A   0378 000F
        BNEQ    L_62AD                          ; 628C   020C 001F

        ADDI    #$0226, R1                      ; 628E   02F9 0226
        MVI@    R1,     R0                      ; 6290   0288
        SWAP    R0,     1                       ; 6291   0040
        SLR     R0,     1                       ; 6292   0060
        ANDI    #$0078, R0                      ; 6293   03B8 0078
        ANDI    #$0078, R2                      ; 6295   03BA 0078
        CMPR    R0,     R2                      ; 6297   0142
        BNEQ    L_62AB                          ; 6298   020C 0011

        MVI     G_0189, R5                      ; 629A   0285 0189
        ADDI    #$0185, R5                      ; 629C   02FD 0185
        MOVR    R1,     R0                      ; 629E   0088
        SUBI    #$0328, R0                      ; 629F   0338 0328
        MVO@    R0,     R5                      ; 62A1   0268
        CMPI    #$0008, R5                      ; 62A2   037D 0008
L_62A4:
        BNEQ    L_62A7                          ; 62A4   020C 0001

        DECR    R5                              ; 62A6   0015
L_62A7:
        SUBI    #$0185, R5                      ; 62A7   033D 0185
        MVO     R5,     G_0189                  ; 62A9   0245 0189
L_62AB:
        SUBI    #$0226, R1                      ; 62AB   0339 0226
L_62AD:
        INCR    R1                              ; 62AD   0009
        CMPI    #$011A, R1                      ; 62AE   0379 011A
        BNEQ    L_6287                          ; 62B0   022C 002A

        PULR    R2                              ; 62B2   02B2
        PULR    R1                              ; 62B3   02B1
        SDBD                                    ; 62B4   0001
        ADDI    #$09A8, R4                      ; 62B5   02FC 00A8 0009
        MVO@    R4,     R1                      ; 62B8   024C
        PULR    R7                              ; 62B9   02B7
L_62BA:
        PSHR    R5                              ; 62BA   0275
        MVII    #$0007, R3                      ; 62BB   02BB 0007
L_62BD:
        MVII    #$0008, R0                      ; 62BD   02B8 0008
        SDBD                                    ; 62BF   0001
        MVII    #$62D4, R4                      ; 62C0   02BC 00D4 0062
        MVII    #$003C, R1                      ; 62C3   02B9 003C
        ADDR    R3,     R4                      ; 62C5   00DC
        SUBR    R3,     R1                      ; 62C6   0119
        SLL     R1,     2                       ; 62C7   004D
        SLL     R1,     1                       ; 62C8   0049
        SDBD                                    ; 62C9   0001
        ADDI    #$3800, R1                      ; 62CA   02F9 0000 0038

        JSR     R5,     L_6FA2                  ; 62CD   0004 016C 03A2

        DECR    R3                              ; 62D0   0013
        BPL     L_62BD                          ; 62D1   0223 0015

        PULR    R7                              ; 62D3   02B7
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62D4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 62D8   0000 0000 0000

        ADDR    R7,     R7                      ; 62DB   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62DC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62E0   0000 0000 0000 0000

        JSR     R5,     G_78FD                  ; 62E4   0004 0178 00FD

        SUB     G_0344, R0                      ; 62E7   0300 0344
        ADD     G_035C, R0                      ; 62E9   02C0 035C
        ANDI    #$01FF, R0                      ; 62EB   03B8 01FF
        MVI@    R3,     R2                      ; 62ED   029A
        ANDI    #$0070, R2                      ; 62EE   03BA 0070
        BEQ     L_62F8                          ; 62F0   0204 0006

        JSR     R5,     G_7C1B                  ; 62F2   0004 017C 001B

        J       G_7813                          ; 62F5   0004 0378 0013

L_62F8:
        JSR     R5,     G_7934                  ; 62F8   0004 0178 0134

        BNC     L_631C                          ; 62FB   0209 001F

        MVII    #$0323, R4                      ; 62FD   02BC 0323
        MVII    #$0005, R5                      ; 62FF   02BD 0005
L_6301:
        MVI@    R4,     R2                      ; 6301   02A2
        TSTR    R2                              ; 6302   0092
        BEQ     L_630A                          ; 6303   0204 0005

        DECR    R5                              ; 6305   0015
        BNEQ    L_6301                          ; 6306   022C 0006
        B       L_631C                          ; 6308   0200 0012

L_630A:
        DECR    R4                              ; 630A   0014
        SDBD                                    ; 630B   0001
        MVII    #$08F1, R5                      ; 630C   02BD 00F1 0008
        MVO@    R5,     R4                      ; 630F   0265
        SUBI    #$0011, R4                      ; 6310   033C 0011

        JSR     R5,     G_7919                  ; 6312   0004 0178 0119

        MOVR    R4,     R2                      ; 6315   00A2
        SUBI    #$0319, R2                      ; 6316   033A 0319
        SLL     R2,     2                       ; 6318   004E
        SLL     R2,     2                       ; 6319   004E
        ADD@    R3,     R2                      ; 631A   02DA
        MVO@    R2,     R3                      ; 631B   025A

L_631C:
        JSR     R5,     G_790A                  ; 631C   0004 0178 010A

        J       G_7813                          ; 631F   0004 0378 0013

        JSR     R5,     G_78FD                  ; 6322   0004 0178 00FD

        SUB     G_0344, R0                      ; 6325   0300 0344
        ADD     G_035C, R0                      ; 6327   02C0 035C
        ADDI    #$0018, R3                      ; 6329   02FB 0018
        MVI@    R3,     R4                      ; 632B   029C
        ANDI    #$000F, R4                      ; 632C   03BC 000F
        ADDR    R4,     R4                      ; 632E   00E4
        SDBD                                    ; 632F   0001
        ADDI    #$6492, R4                      ; 6330   02FC 0092 0064
        ADD@    R4,     R0                      ; 6333   02E0
        ADD@    R4,     R1                      ; 6334   02E1
        ANDI    #$01FF, R0                      ; 6335   03B8 01FF
        ANDI    #$007F, R1                      ; 6337   03B9 007F
        ADDI    #$0018, R3                      ; 6339   02FB 0018
        MVI@    R3,     R2                      ; 633B   029A
        DECR    R2                              ; 633C   0012
        MVO@    R2,     R3                      ; 633D   025A
        BNEQ    L_636F                          ; 633E   020C 002F

        PSHR    R1                              ; 6340   0271
        SUBI    #$0030, R3                      ; 6341   033B 0030
        MVI@    R3,     R2                      ; 6343   029A
        ANDI    #$00F0, R2                      ; 6344   03BA 00F0
        SLR     R2,     2                       ; 6346   0066
        SLR     R2,     1                       ; 6347   0062
        SDBD                                    ; 6348   0001
        ADDI    #$64D2, R2                      ; 6349   02FA 00D2 0064
        MOVR    R2,     R5                      ; 634C   0095
        SDBD                                    ; 634D   0001
        MVI@    R5,     R4                      ; 634E   02AC
        ADDI    #$0018, R3                      ; 634F   02FB 0018
        MVI@    R3,     R2                      ; 6351   029A
        ANDI    #$00F0, R2                      ; 6352   03BA 00F0
        MOVR    R2,     R5                      ; 6354   0095
        SLR     R2,     2                       ; 6355   0066
        SLR     R2,     2                       ; 6356   0066
        ADDR    R2,     R4                      ; 6357   00D4
        MVI@    R4,     R1                      ; 6358   02A1
        MOVR    R1,     R2                      ; 6359   008A
        ANDI    #$000F, R1                      ; 635A   03B9 000F
        ADDR    R5,     R1                      ; 635C   00E9
        ADDI    #$0010, R1                      ; 635D   02F9 0010
        MVI@    R4,     R5                      ; 635F   02A5
        CMPI    #$00FF, R5                      ; 6360   037D 00FF
        BNEQ    L_6366                          ; 6362   020C 0002

        ANDI    #$000F, R1                      ; 6364   03B9 000F
L_6366:
        MVO@    R1,     R3                      ; 6366   0259
        ADDI    #$0018, R3                      ; 6367   02FB 0018
        ANDI    #$00F0, R2                      ; 6369   03BA 00F0
        SLR     R2,     1                       ; 636B   0062
        NOP                                     ; 636C   0034
        MVO@    R2,     R3                      ; 636D   025A
        PULR    R1                              ; 636E   02B1
L_636F:
        SUBI    #$0030, R3                      ; 636F   033B 0030

        JSR     R5,     G_7934                  ; 6371   0004 0178 0134

        BNC     L_63E3                          ; 6374   0209 006D

        MVII    #$0002, R5                      ; 6376   02BD 0002
        MOVR    R0,     R2                      ; 6378   0082
        SUB     G_035D, R2                      ; 6379   0302 035D
        BMI     L_637E                          ; 637B   020B 0001

        NEGR    R5                              ; 637D   0025
L_637E:
        MVO     R5,     G_01AD                  ; 637E   0245 01AD
        PSHR    R0                              ; 6380   0270
        PSHR    R1                              ; 6381   0271
        PSHR    R3                              ; 6382   0273
        SUBI    #$00E0, R0                      ; 6383   0338 00E0
        MOVR    R0,     R2                      ; 6385   0082
        SLL     R0,     2                       ; 6386   004C
        ADDR    R2,     R0                      ; 6387   00D0
        MOVR    R0,     R2                      ; 6388   0082
        SLR     R0,     2                       ; 6389   0064
        SLR     R0,     2                       ; 638A   0064
        CMPI    #$0014, R0                      ; 638B   0378 0014
        BPL     L_63D5                          ; 638D   0203 0046

        ADDI    #$0040, R1                      ; 638F   02F9 0040
        MOVR    R1,     R3                      ; 6391   008B
        ANDI    #$00F0, R1                      ; 6392   03B9 00F0
        MOVR    R1,     R5                      ; 6394   008D
        SLR     R1,     2                       ; 6395   0065
        ADDR    R5,     R1                      ; 6396   00E9
        ADDR    R0,     R1                      ; 6397   00C1
        SLR     R3,     1                       ; 6398   0063
        ANDI    #$0007, R3                      ; 6399   03BB 0007
        SLR     R2,     1                       ; 639B   0062
        ANDI    #$0007, R2                      ; 639C   03BA 0007
        MVII    #$01A0, R4                      ; 639E   02BC 01A0
        MVII    #$0006, R5                      ; 63A0   02BD 0006
L_63A2:
        CMP@    R4,     R1                      ; 63A2   0361
        BEQ     L_63B7                          ; 63A3   0204 0012

        DECR    R5                              ; 63A5   0015
        BNEQ    L_63A2                          ; 63A6   022C 0005

        MVII    #$01A0, R4                      ; 63A8   02BC 01A0
        MVII    #$0006, R5                      ; 63AA   02BD 0006
        CLRR    R0                              ; 63AC   01C0
L_63AD:
        CMP@    R4,     R0                      ; 63AD   0360
        BEQ     L_63B5                          ; 63AE   0204 0005

        DECR    R5                              ; 63B0   0015
        BNEQ    L_63AD                          ; 63B1   022C 0005
        B       L_63D5                          ; 63B3   0200 0020

L_63B5:
        DECR    R4                              ; 63B5   0014
        MVO@    R1,     R4                      ; 63B6   0261
L_63B7:
        MOVR    R4,     R0                      ; 63B7   00A0
        SUBI    #$01A1, R0                      ; 63B8   0338 01A1
        SLL     R0,     2                       ; 63BA   004C
        SLL     R0,     1                       ; 63BB   0048
        SDBD                                    ; 63BC   0001
        ADDI    #$3928, R0                      ; 63BD   02F8 0028 0039
        ADDR    R3,     R0                      ; 63C0   00D8
        MVII    #$0355, R3                      ; 63C1   02BB 0355
        ADD     G_01AC, R3                      ; 63C3   02C3 01AC
        MVO@    R0,     R3                      ; 63C5   0258
        SDBD                                    ; 63C6   0001
        ADDI    #$64DE, R2                      ; 63C7   02FA 00DE 0064
        MVI@    R2,     R2                      ; 63CA   0292
        MVII    #$01A6, R3                      ; 63CB   02BB 01A6
        ADD     G_01AC, R3                      ; 63CD   02C3 01AC
        MVO@    R2,     R3                      ; 63CF   025A
        MVI     G_01AC, R3                      ; 63D0   0283 01AC
        INCR    R3                              ; 63D2   000B
        MVO     R3,     G_01AC                  ; 63D3   0243 01AC
L_63D5:
        PULR    R3                              ; 63D5   02B3
        PULR    R1                              ; 63D6   02B1
        PULR    R0                              ; 63D7   02B0

        JSR     R5,     G_790A                  ; 63D8   0004 0178 010A

        MVII    #$0007, R1                      ; 63DB   02B9 0007

        JSR     R5,     G_76C4                  ; 63DD   0004 0174 02C4

        J       G_7813                          ; 63E0   0004 0378 0013

L_63E3:
        JSR     R5,     G_790A                  ; 63E3   0004 0178 010A

        J       G_7813                          ; 63E6   0004 0378 0013

L_63E9:
        PSHR    R5                              ; 63E9   0275
        MVII    #$0102, R3                      ; 63EA   02BB 0102
        MVII    #$0018, R4                      ; 63EC   02BC 0018
L_63EE:
        MVI@    R3,     R2                      ; 63EE   029A
        TSTR    R2                              ; 63EF   0092
        BEQ     L_63F8                          ; 63F0   0204 0006

        INCR    R3                              ; 63F2   000B
        DECR    R4                              ; 63F3   0014
        BNEQ    L_63EE                          ; 63F4   022C 0007
        B       L_6402                          ; 63F6   0200 000A

L_63F8:
        MVII    #$0007, R2                      ; 63F8   02BA 0007
        MVO@    R2,     R3                      ; 63FA   025A

        JSR     R5,     G_790A                  ; 63FB   0004 0178 010A

        MVII    #$0001, R5                      ; 63FE   02BD 0001
        MVO     R5,     G_035C                  ; 6400   0245 035C
L_6402:
        PULR    R7                              ; 6402   02B7
L_6403:
        PSHR    R5                              ; 6403   0275
        MVII    #$0102, R3                      ; 6404   02BB 0102
        MVII    #$0006, R5                      ; 6406   02BD 0006
        MVII    #$0018, R4                      ; 6408   02BC 0018
L_640A:
        MVI@    R3,     R2                      ; 640A   029A
        TSTR    R2                              ; 640B   0092
        BNEQ    L_6429                          ; 640C   020C 001B

        MOVR    R5,     R2                      ; 640E   00AA
        DECR    R2                              ; 640F   0012
        SLL     R2,     2                       ; 6410   004E
        SLL     R2,     2                       ; 6411   004E
        ADDI    #$000F, R2                      ; 6412   02FA 000F
        MVO@    R2,     R3                      ; 6414   025A
        ADDI    #$0018, R3                      ; 6415   02FB 0018
        MVO@    R5,     R3                      ; 6417   025D
        ADDI    #$0018, R3                      ; 6418   02FB 0018
        MVO@    R5,     R3                      ; 641A   025D
        SUBI    #$0030, R3                      ; 641B   033B 0030
        PSHR    R0                              ; 641D   0270
        PSHR    R1                              ; 641E   0271
        PSHR    R5                              ; 641F   0275

        JSR     R5,     G_790A                  ; 6420   0004 0178 010A

        PULR    R5                              ; 6423   02B5
        PULR    R1                              ; 6424   02B1
        PULR    R0                              ; 6425   02B0
        DECR    R5                              ; 6426   0015
        BEQ     L_642D                          ; 6427   0204 0004

L_6429:
        INCR    R3                              ; 6429   000B
        DECR    R4                              ; 642A   0014
        BNEQ    L_640A                          ; 642B   022C 0022

L_642D:
        MVII    #$0001, R5                      ; 642D   02BD 0001
        MVO     R5,     G_035C                  ; 642F   0245 035C
        PULR    R7                              ; 6431   02B7
L_6432:
        MOVR    R5,     R0                      ; 6432   00A8
        SDBD                                    ; 6433   0001
        MVII    #$3928, R4                      ; 6434   02BC 0028 0039
        MVII    #$0006, R1                      ; 6437   02B9 0006
        CLRR    R3                              ; 6439   01DB
L_643A:
        MVO@    R3,     R4                      ; 643A   0263
        MVO@    R3,     R4                      ; 643B   0263
        MVO@    R3,     R4                      ; 643C   0263
        MVO@    R3,     R4                      ; 643D   0263
        MVO@    R3,     R4                      ; 643E   0263
        MVO@    R3,     R4                      ; 643F   0263
        MVO@    R3,     R4                      ; 6440   0263
        MVO@    R3,     R4                      ; 6441   0263
        DECR    R1                              ; 6442   0011
        BNEQ    L_643A                          ; 6443   022C 000A

        MVII    #$0355, R4                      ; 6445   02BC 0355
        MVII    #$01A6, R5                      ; 6447   02BD 01A6
        B       L_644E                          ; 6449   0200 0003

L_644B:
        MVI@    R3,     R2                      ; 644B   029A
        XOR@    R5,     R2                      ; 644C   03EA
        MVO@    R2,     R3                      ; 644D   025A
L_644E:
        MVI@    R4,     R3                      ; 644E   02A3
        TSTR    R3                              ; 644F   009B
        BNEQ    L_644B                          ; 6450   022C 0006

        MOVR    R0,     R7                      ; 6452   0087
L_6453:
        PSHR    R5                              ; 6453   0275
        MVII    #$019A, R4                      ; 6454   02BC 019A
        CLRR    R0                              ; 6456   01C0
        MVII    #$0006, R2                      ; 6457   02BA 0006
L_6459:
        MVI@    R4,     R1                      ; 6459   02A1
        TSTR    R1                              ; 645A   0089
        BEQ     L_6460                          ; 645B   0204 0003

        ADDI    #$0200, R1                      ; 645D   02F9 0200
        MVO@    R0,     R1                      ; 645F   0248
L_6460:
        DECR    R2                              ; 6460   0012
L_6461:
        BNEQ    L_6459                          ; 6461   022C 0009

        MVII    #$019A, R4                      ; 6463   02BC 019A
        MVII    #$01A0, R5                      ; 6465   02BD 01A0
        MVII    #$0006, R2                      ; 6467   02BA 0006
L_6469:
        MVI@    R5,     R1                      ; 6469   02A9
        MVO@    R1,     R4                      ; 646A   0261
        DECR    R2                              ; 646B   0012
        BNEQ    L_6469                          ; 646C   022C 0004

        MVII    #$01A0, R5                      ; 646E   02BD 01A0
        SDBD                                    ; 6470   0001
        MVII    #$092A, R3                      ; 6471   02BB 002A 0009
        MVII    #$0006, R2                      ; 6474   02BA 0006
L_6476:
        MVI@    R5,     R1                      ; 6476   02A9
        TSTR    R1                              ; 6477   0089
        BEQ     L_647D                          ; 6478   0204 0003

        ADDI    #$0200, R1                      ; 647A   02F9 0200
        MVO@    R3,     R1                      ; 647C   024B
L_647D:
        ADDI    #$0008, R3                      ; 647D   02FB 0008
        DECR    R2                              ; 647F   0012
        BNEQ    L_6476                          ; 6480   022C 000B

        CLRR    R0                              ; 6482   01C0
        MVII    #$01A0, R4                      ; 6483   02BC 01A0
        MVII    #$0355, R5                      ; 6485   02BD 0355
L_6487:
        MVII    #$0003, R3                      ; 6487   02BB 0003
L_6489:
        MVO@    R0,     R4                      ; 6489   0260
        MVO@    R0,     R4                      ; 648A   0260
        MVO@    R0,     R5                      ; 648B   0268
        MVO@    R0,     R5                      ; 648C   0268
        DECR    R3                              ; 648D   0013
        BNEQ    L_6489                          ; 648E   022C 0006

        MVO@    R0,     R5                      ; 6490   0268
        PULR    R7                              ; 6491   02B7
        DECLE   $0001,  $0000                   ; 6492   0001 0000

        XORI    #$0000, R7                      ; 6494   03FF 0000
        DECLE   $0001                           ; 6496   0001

        XORI    #$03FF, R6                      ; 6497   03FE 03FF
        XORI    #$0001, R6                      ; 6499   03FE 0001
        EIS                                     ; 649B   0002
        XORI    #$0002, R7                      ; 649C   03FF 0002
        DECLE   $0000                           ; 649E   0000

        XORI    #$0000, R6                      ; 649F   03FE 0000
        EIS                                     ; 64A1   0002
        DECR    R2                              ; 64A2   0012
        DECR    R1                              ; 64A3   0011
        DECR    R4                              ; 64A4   0014
        NEGR    R1                              ; 64A5   0021
        DECR    R7                              ; 64A6   0017
        DECR    R2                              ; 64A7   0012
        ADDR    R7,     R7                      ; 64A8   00FF
        DECR    R3                              ; 64A9   0013
        NEGR    R7                              ; 64AA   0027
        NEGR    R2                              ; 64AB   0022
        DECR    R7                              ; 64AC   0017
        DECR    R5                              ; 64AD   0015
        DECR    R6                              ; 64AE   0016
        ADDR    R7,     R7                      ; 64AF   00FF
        DECR    R0                              ; 64B0   0010
        DECR    R7                              ; 64B1   0017
        NEGR    R3                              ; 64B2   0023
        NEGR    R7                              ; 64B3   0027
        NEGR    R2                              ; 64B4   0022
        DECR    R5                              ; 64B5   0015
        ADDR    R7,     R7                      ; 64B6   00FF
        DECR    R5                              ; 64B7   0015
        DECR    R6                              ; 64B8   0016
        DECR    R4                              ; 64B9   0014
        DECR    R2                              ; 64BA   0012
        DECR    R7                              ; 64BB   0017
        NEGR    R3                              ; 64BC   0023
        NEGR    R0                              ; 64BD   0020
        DECR    R5                              ; 64BE   0015
        ADDR    R7,     R7                      ; 64BF   00FF
        DECR    R0                              ; 64C0   0010
        DECR    R3                              ; 64C1   0013
        DECR    R5                              ; 64C2   0015
        DECR    R7                              ; 64C3   0017
        DECR    R0                              ; 64C4   0010
        DECR    R6                              ; 64C5   0016
        ADDR    R7,     R7                      ; 64C6   00FF
        DECR    R3                              ; 64C7   0013
        NEGR    R0                              ; 64C8   0020
        NEGR    R7                              ; 64C9   0027
        DECR    R3                              ; 64CA   0013
        DECR    R7                              ; 64CB   0017
        DECR    R2                              ; 64CC   0012
        DECR    R3                              ; 64CD   0013
        DECR    R5                              ; 64CE   0015
        DECR    R7                              ; 64CF   0017
        DECR    R2                              ; 64D0   0012
        ADDR    R7,     R7                      ; 64D1   00FF
        MOVR    R4,     R2                      ; 64D2   00A2
        SLR     R0,     2                       ; 64D3   0064
        MOVR    R5,     R1                      ; 64D4   00A9
        SLR     R0,     2                       ; 64D5   0064
        MOVR    R6,     R0                      ; 64D6   00B0
        SLR     R0,     2                       ; 64D7   0064
        MOVR    R6,     R7                      ; 64D8   00B7
        SLR     R0,     2                       ; 64D9   0064
        ADDR    R0,     R0                      ; 64DA   00C0
        SLR     R0,     2                       ; 64DB   0064
        ADDR    R0,     R7                      ; 64DC   00C7
        SLR     R0,     2                       ; 64DD   0064
        ADDR    R0,     R0                      ; 64DE   00C0
        ADDR    R0,     R0                      ; 64DF   00C0
        SLR     R0,     1                       ; 64E0   0060
        GSWD    R0                              ; 64E1   0030
        COMR    R0                              ; 64E2   0018
        INCR    R4                              ; 64E3   000C
        CLRC                                    ; 64E4   0006
        DIS                                     ; 64E5   0003
L_64E6:
        PSHR    R5                              ; 64E6   0275
        MVI     G_01AD, R0                      ; 64E7   0280 01AD
        TSTR    R0                              ; 64E9   0080
        BEQ     L_64FC                          ; 64EA   0204 0010

        MVI     G_0318, R1                      ; 64EC   0281 0318
        ANDI    #$007F, R1                      ; 64EE   03B9 007F
        CMPI    #$0048, R1                      ; 64F0   0379 0048
        BPL     L_64FC                          ; 64F2   0203 0008

        XORI    #$0080, R0                      ; 64F4   03F8 0080
        SUBI    #$0080, R0                      ; 64F6   0338 0080
        MVO     R0,     G_035C                  ; 64F8   0240 035C
        B       L_6500                          ; 64FA   0200 0004

L_64FC:
        MVII    #$0001, R1                      ; 64FC   02B9 0001
        MVO     R1,     G_035C                  ; 64FE   0241 035C
L_6500:
        PULR    R7                              ; 6500   02B7
        RSWD    R4                              ; 6501   003C
        DECLE   $0000                           ; 6502   0000

        MOVR    R7,     R4                      ; 6503   00BC
        DECLE   $0000,  $023C,  $0000           ; 6504   0000 023C 0000

        ANDI    #$0000, R4                      ; 6507   03BC 0000
        RSWD    R4                              ; 6509   003C
        DECLE   $0000                           ; 650A   0000

        RSWD    R4                              ; 650B   003C
        DECLE   $0000                           ; 650C   0000

        RSWD    R4                              ; 650D   003C
        DECLE   $0000                           ; 650E   0000

        MOVR    R7,     R4                      ; 650F   00BC
        DECLE   $0000,  $023C,  $0000           ; 6510   0000 023C 0000

        MVII    #$0350, R4                      ; 6513   02BC 0350
        XOR@    R2,     R0                      ; 6515   03D0
        DECLE   $0000                           ; 6516   0000

        ADDR    R2,     R0                      ; 6517   00D0
        DECLE   $0000                           ; 6518   0000

        CMPR    R2,     R0                      ; 6519   0150
        ANDR    R7,     R4                      ; 651A   01BC
        SUBR    R7,     R4                      ; 651B   013C
        ANDR    R5,     R0                      ; 651C   01A8
        DECLE   $0228,  $0000                   ; 651D   0228 0000

        MVI@    R5,     R0                      ; 651F   02A8
        SUBI    #$03BC, R4                      ; 6520   033C 03BC
        DECLE   $0000                           ; 6522   0000

        RSWD    R4                              ; 6523   003C
        DECLE   $0000                           ; 6524   0000

        MOVR    R7,     R4                      ; 6525   00BC
        DECLE   $0000,  $023C,  $0000           ; 6526   0000 023C 0000

        ANDI    #$0000, R4                      ; 6529   03BC 0000
        MOVR    R7,     R4                      ; 652B   00BC
        DECLE   $0000,  $023C,  $0000           ; 652C   0000 023C 0000

        ANDI    #$0000, R4                      ; 652F   03BC 0000
        RSWD    R4                              ; 6531   003C
        DECLE   $0000                           ; 6532   0000

        MOVR    R7,     R4                      ; 6533   00BC
        DECLE   $0000,  $023C,  $0000           ; 6534   0000 023C 0000

        ANDI    #$0000, R4                      ; 6537   03BC 0000
        RSWD    R4                              ; 6539   003C
        DECLE   $0000                           ; 653A   0000

        RSWD    R4                              ; 653B   003C
        DECLE   $0000                           ; 653C   0000

        MOVR    R7,     R4                      ; 653D   00BC
        DECLE   $0000                           ; 653E   0000

        SUBR    R7,     R4                      ; 653F   013C
        ANDR    R5,     R0                      ; 6540   01A8
        DECLE   $0228,  $0000                   ; 6541   0228 0000

        MVI@    R5,     R0                      ; 6543   02A8
        SUBI    #$03BC, R4                      ; 6544   033C 03BC
        DECLE   $0000                           ; 6546   0000

        MOVR    R7,     R4                      ; 6547   00BC
        DECLE   $0000,  $023C,  $0000           ; 6548   0000 023C 0000

        MVII    #$0350, R4                      ; 654B   02BC 0350
        XOR@    R2,     R0                      ; 654D   03D0
        DECLE   $0000                           ; 654E   0000

        RLC     R0,     1                       ; 654F   0050
        DECLE   $0000                           ; 6550   0000

        ADDR    R2,     R0                      ; 6551   00D0
        DECLE   $0000                           ; 6552   0000

        CMPR    R2,     R0                      ; 6553   0150
        ANDR    R7,     R4                      ; 6554   01BC
        DECLE   $023C,  $0000                   ; 6555   023C 0000

        ANDI    #$0000, R4                      ; 6557   03BC 0000
        MOVR    R7,     R4                      ; 6559   00BC
        DECLE   $0000                           ; 655A   0000

        SUBR    R7,     R4                      ; 655B   013C
        ANDR    R5,     R0                      ; 655C   01A8
        DECLE   $0228,  $0000                   ; 655D   0228 0000

        AND@    R5,     R0                      ; 655F   03A8
        DECLE   $0000                           ; 6560   0000

        MOVR    R5,     R0                      ; 6561   00A8
        DECLE   $0000,  $0228,  $0000           ; 6562   0000 0228 0000

        MVI@    R5,     R0                      ; 6565   02A8
        SUBI    #$03BC, R4                      ; 6566   033C 03BC
        DECLE   $0000                           ; 6568   0000

        RSWD    R4                              ; 6569   003C
        DECLE   $0000                           ; 656A   0000

        RSWD    R4                              ; 656B   003C
        DECLE   $0000                           ; 656C   0000

        RSWD    R4                              ; 656D   003C
        DECLE   $0000                           ; 656E   0000

        MOVR    R7,     R4                      ; 656F   00BC
        DECLE   $0000                           ; 6570   0000

        SUBR    R7,     R4                      ; 6571   013C
        ANDR    R5,     R0                      ; 6572   01A8
        SUBR    R5,     R0                      ; 6573   0128
        ANDR    R2,     R4                      ; 6574   0194
        DECLE   $0214,  $0000                   ; 6575   0214 0000

        MVI@    R2,     R4                      ; 6577   0294
        SUB@    R5,     R0                      ; 6578   0328
        AND@    R5,     R0                      ; 6579   03A8
        DECLE   $0000                           ; 657A   0000

        ADCR    R0                              ; 657B   0028
        DECLE   $0000                           ; 657C   0000

        ADCR    R0                              ; 657D   0028
        DECLE   $0000                           ; 657E   0000

        ADCR    R0                              ; 657F   0028
        DECLE   $0000                           ; 6580   0000

        MOVR    R5,     R0                      ; 6581   00A8
        DECLE   $0000,  $0228,  $0000           ; 6582   0000 0228 0000

        MVI@    R5,     R0                      ; 6585   02A8
        SUBI    #$03BC, R4                      ; 6586   033C 03BC
        DECLE   $0000                           ; 6588   0000

        RSWD    R4                              ; 6589   003C
        DECLE   $0000                           ; 658A   0000

        MOVR    R7,     R4                      ; 658B   00BC
        DECLE   $0000                           ; 658C   0000

        SUBR    R7,     R4                      ; 658D   013C
        ANDR    R5,     R0                      ; 658E   01A8
        DECLE   $0228,  $0000                   ; 658F   0228 0000

        MVI@    R5,     R0                      ; 6591   02A8
        SUBI    #$03BC, R4                      ; 6592   033C 03BC
        DECLE   $0000                           ; 6594   0000

        MOVR    R7,     R4                      ; 6595   00BC
        DECLE   $0000,  $023C,  $0000           ; 6596   0000 023C 0000

        ANDI    #$0000, R4                      ; 6599   03BC 0000
        RSWD    R4                              ; 659B   003C
        DECLE   $0000                           ; 659C   0000

        RSWD    R4                              ; 659D   003C
        DECLE   $0000                           ; 659E   0000

        RSWD    R4                              ; 659F   003C
        DECLE   $0000                           ; 65A0   0000

        RSWD    R4                              ; 65A1   003C
        DECLE   $0000                           ; 65A2   0000

        RSWD    R4                              ; 65A3   003C
        DECLE   $0000                           ; 65A4   0000

        RSWD    R4                              ; 65A5   003C
        DECLE   $0000                           ; 65A6   0000

        RSWD    R4                              ; 65A7   003C
        DECLE   $0000                           ; 65A8   0000

        RSWD    R4                              ; 65A9   003C
        DECLE   $0000                           ; 65AA   0000

        RSWD    R4                              ; 65AB   003C
        DECLE   $0000                           ; 65AC   0000

        RSWD    R4                              ; 65AD   003C
        DECLE   $0000                           ; 65AE   0000

        RSWD    R4                              ; 65AF   003C
        DECLE   $0000                           ; 65B0   0000

        RSWD    R4                              ; 65B1   003C
        DECLE   $0000                           ; 65B2   0000

        RSWD    R4                              ; 65B3   003C
        DECLE   $0000                           ; 65B4   0000

        RSWD    R4                              ; 65B5   003C
        DECLE   $0000                           ; 65B6   0000

        RSWD    R4                              ; 65B7   003C
        DECLE   $0000                           ; 65B8   0000

        RSWD    R4                              ; 65B9   003C
        DECLE   $0000                           ; 65BA   0000

        RSWD    R4                              ; 65BB   003C
        DECLE   $0000                           ; 65BC   0000

        MOVR    R7,     R4                      ; 65BD   00BC
        DECLE   $0000,  $023C,  $0000           ; 65BE   0000 023C 0000

        ANDI    #$0000, R4                      ; 65C1   03BC 0000
        RSWD    R4                              ; 65C3   003C
        DECLE   $0000                           ; 65C4   0000

        RSWD    R4                              ; 65C5   003C
        DECLE   $0000                           ; 65C6   0000

        RSWD    R4                              ; 65C7   003C
        DECLE   $0000                           ; 65C8   0000

        RSWD    R4                              ; 65C9   003C
        DECLE   $0000                           ; 65CA   0000

        RSWD    R4                              ; 65CB   003C
        DECLE   $0000                           ; 65CC   0000

        MOVR    R7,     R4                      ; 65CD   00BC
        DECLE   $0000,  $023C,  $0000           ; 65CE   0000 023C 0000

        MVII    #$0350, R4                      ; 65D1   02BC 0350
        XOR@    R2,     R0                      ; 65D3   03D0
        DECLE   $0000                           ; 65D4   0000

        RLC     R0,     1                       ; 65D5   0050
        DECLE   $0000                           ; 65D6   0000

        ADDR    R2,     R0                      ; 65D7   00D0
        DECLE   $0000                           ; 65D8   0000

        CMPR    R2,     R0                      ; 65D9   0150
        ANDR    R7,     R4                      ; 65DA   01BC
        SUBR    R7,     R4                      ; 65DB   013C
        ANDR    R5,     R0                      ; 65DC   01A8
        DECLE   $0228,  $0000                   ; 65DD   0228 0000

        MVI@    R5,     R0                      ; 65DF   02A8
        SUBI    #$03BC, R4                      ; 65E0   033C 03BC
        DECLE   $0000                           ; 65E2   0000

        RSWD    R4                              ; 65E3   003C
        DECLE   $0000                           ; 65E4   0000

        RSWD    R4                              ; 65E5   003C
        DECLE   $0000                           ; 65E6   0000

        RSWD    R4                              ; 65E7   003C
        DECLE   $0000                           ; 65E8   0000

        RSWD    R4                              ; 65E9   003C
        DECLE   $0000                           ; 65EA   0000

        RSWD    R4                              ; 65EB   003C
        DECLE   $0000                           ; 65EC   0000

        RSWD    R4                              ; 65ED   003C
        DECLE   $0000                           ; 65EE   0000

        RSWD    R4                              ; 65EF   003C
        DECLE   $0000                           ; 65F0   0000

        RSWD    R4                              ; 65F1   003C
        DECLE   $0000                           ; 65F2   0000

        RSWD    R4                              ; 65F3   003C
        DECLE   $0000                           ; 65F4   0000

        RSWD    R4                              ; 65F5   003C
        DECLE   $0000                           ; 65F6   0000

        RSWD    R4                              ; 65F7   003C
        DECLE   $0000                           ; 65F8   0000

        RSWD    R4                              ; 65F9   003C
        DECLE   $0000                           ; 65FA   0000

        RSWD    R4                              ; 65FB   003C
        DECLE   $0000                           ; 65FC   0000

        RSWD    R4                              ; 65FD   003C
        DECLE   $0000                           ; 65FE   0000

        RSWD    R4                              ; 65FF   003C
        DECLE   $0000                           ; 6600   0000

        RSWD    R4                              ; 6601   003C
        DECLE   $0000                           ; 6602   0000

        RSWD    R4                              ; 6603   003C
        DECLE   $0000                           ; 6604   0000

        RSWD    R4                              ; 6605   003C
        DECLE   $0000                           ; 6606   0000

        MOVR    R7,     R4                      ; 6607   00BC
        DECLE   $0000                           ; 6608   0000

        SUBR    R7,     R4                      ; 6609   013C
        ANDR    R5,     R0                      ; 660A   01A8
        DECLE   $0228,  $0000                   ; 660B   0228 0000

        AND@    R5,     R0                      ; 660D   03A8
        DECLE   $0000                           ; 660E   0000

        ADCR    R0                              ; 660F   0028
        DECLE   $0000                           ; 6610   0000

        ADCR    R0                              ; 6611   0028
        DECLE   $0000                           ; 6612   0000

        ADCR    R0                              ; 6613   0028
        DECLE   $0000                           ; 6614   0000

        ADCR    R0                              ; 6615   0028
        DECLE   $0000                           ; 6616   0000

        ADCR    R0                              ; 6617   0028
        DECLE   $0000                           ; 6618   0000

        ADCR    R0                              ; 6619   0028
        DECLE   $0000                           ; 661A   0000

        ADCR    R0                              ; 661B   0028
        DECLE   $0000                           ; 661C   0000

        ADCR    R0                              ; 661D   0028
        DECLE   $0000                           ; 661E   0000

        ADCR    R0                              ; 661F   0028
        DECLE   $0000                           ; 6620   0000

        ADCR    R0                              ; 6621   0028
        DECLE   $0000                           ; 6622   0000

        ADCR    R0                              ; 6623   0028
        DECLE   $0000                           ; 6624   0000

        ADCR    R0                              ; 6625   0028
        DECLE   $0000                           ; 6626   0000

        ADCR    R0                              ; 6627   0028
        DECLE   $0000                           ; 6628   0000

        ADCR    R0                              ; 6629   0028
        DECLE   $0000                           ; 662A   0000

        ADCR    R0                              ; 662B   0028
        DECLE   $0000                           ; 662C   0000

        MOVR    R5,     R0                      ; 662D   00A8
        DECLE   $0000,  $0228,  $0000           ; 662E   0000 0228 0000

        MVI@    R5,     R0                      ; 6631   02A8
        SUBI    #$03BC, R4                      ; 6632   033C 03BC
        DECLE   $0000                           ; 6634   0000

        RSWD    R4                              ; 6635   003C
        DECLE   $0000                           ; 6636   0000

        RSWD    R4                              ; 6637   003C
        DECLE   $0000                           ; 6638   0000

        RSWD    R4                              ; 6639   003C
        DECLE   $0000                           ; 663A   0000

        RSWD    R4                              ; 663B   003C
        DECLE   $0000                           ; 663C   0000

        RSWD    R4                              ; 663D   003C
        DECLE   $0000                           ; 663E   0000

        RSWD    R4                              ; 663F   003C
        DECLE   $0000                           ; 6640   0000

        RSWD    R4                              ; 6641   003C
        DECLE   $0000                           ; 6642   0000

        MOVR    R7,     R4                      ; 6643   00BC
        DECLE   $0000,  $023C,  $0000           ; 6644   0000 023C 0000

        ANDI    #$0000, R4                      ; 6647   03BC 0000
        RSWD    R4                              ; 6649   003C
        DECLE   $0000                           ; 664A   0000

        RSWD    R4                              ; 664B   003C
        DECLE   $0000                           ; 664C   0000

        RSWD    R4                              ; 664D   003C
        DECLE   $0000                           ; 664E   0000

        MOVR    R7,     R4                      ; 664F   00BC
        DECLE   $0000,  $023C,  $0000           ; 6650   0000 023C 0000

        MVII    #$0350, R4                      ; 6653   02BC 0350
        XOR@    R2,     R0                      ; 6655   03D0
        DECLE   $0000                           ; 6656   0000

        ADDR    R2,     R0                      ; 6657   00D0
        DECLE   $0000                           ; 6658   0000

        CMPR    R2,     R0                      ; 6659   0150
        ANDR    R7,     R4                      ; 665A   01BC
        SUBR    R7,     R4                      ; 665B   013C
        ANDR    R5,     R0                      ; 665C   01A8
        DECLE   $0228,  $0000                   ; 665D   0228 0000

        MVI@    R5,     R0                      ; 665F   02A8
        SUBI    #$03BC, R4                      ; 6660   033C 03BC
        DECLE   $0000                           ; 6662   0000

        RSWD    R4                              ; 6663   003C
        DECLE   $0000                           ; 6664   0000

        MOVR    R7,     R4                      ; 6665   00BC
        DECLE   $0000,  $023C,  $0000           ; 6666   0000 023C 0000

        ANDI    #$0000, R4                      ; 6669   03BC 0000
        MOVR    R7,     R4                      ; 666B   00BC

        JSR     R5,     G_78FD                  ; 666C   0004 0178 00FD

        SUB     G_0344, R0                      ; 666F   0300 0344
        ADDI    #$0018, R3                      ; 6671   02FB 0018
        MVI@    R3,     R4                      ; 6673   029C
        MOVR    R4,     R5                      ; 6674   00A5
        ADDR    R4,     R4                      ; 6675   00E4
        SDBD                                    ; 6676   0001
        ADDI    #$6734, R4                      ; 6677   02FC 0034 0067
        ADD@    R4,     R0                      ; 667A   02E0
        ADD@    R4,     R1                      ; 667B   02E1
        ANDI    #$01FF, R0                      ; 667C   03B8 01FF
        ANDI    #$007F, R1                      ; 667E   03B9 007F
        ADDI    #$0018, R3                      ; 6680   02FB 0018
        MOVR    R1,     R2                      ; 6682   008A
        SUB@    R3,     R2                      ; 6683   031A
        ANDI    #$00F8, R2                      ; 6684   03BA 00F8
        BEQ     L_66A0                          ; 6686   0204 0018

        CMPI    #$00BE, R0                      ; 6688   0378 00BE
        BMI     L_66A6                          ; 668A   020B 001A

        CMPI    #$014A, R0                      ; 668C   0378 014A
        BPL     L_66A6                          ; 668E   0203 0016

        CMPI    #$0004, R5                      ; 6690   037D 0004
        BPL     L_66AF                          ; 6692   0203 001B

        MOVR    R0,     R2                      ; 6694   0082
        SUBI    #$0100, R2                      ; 6695   033A 0100
        BPL     L_669A                          ; 6697   0203 0001

        NEGR    R2                              ; 6699   0022
L_669A:
        CMPI    #$000A, R2                      ; 669A   037A 000A
        BPL     L_66AF                          ; 669C   0203 0011
        B       L_66A6                          ; 669E   0200 0006

L_66A0:
        JSR     R5,     G_7FE2                  ; 66A0   0004 017C 03E2

        ANDI    #$0007, R5                      ; 66A3   03BD 0007
        ADDR    R5,     R1                      ; 66A5   00E9

L_66A6:
        JSR     R5,     L_6719                  ; 66A6   0004 0164 0319

        SUBI    #$0018, R3                      ; 66A9   033B 0018
        MVO@    R4,     R3                      ; 66AB   025C
        ADDI    #$0018, R3                      ; 66AC   02FB 0018
        MVO@    R2,     R3                      ; 66AE   025A
L_66AF:
        SUBI    #$0030, R3                      ; 66AF   033B 0030
        MVI@    R3,     R2                      ; 66B1   029A
        ANDI    #$0070, R2                      ; 66B2   03BA 0070
        BEQ     L_66C6                          ; 66B4   0204 0010

        JSR     R5,     G_7C1B                  ; 66B6   0004 017C 001B

        MVII    #$000C, R1                      ; 66B9   02B9 000C

        JSR     R5,     G_76C4                  ; 66BB   0004 0174 02C4

        MVII    #$000C, R1                      ; 66BE   02B9 000C

        JSR     R5,     G_76C4                  ; 66C0   0004 0174 02C4

        J       G_7813                          ; 66C3   0004 0378 0013

L_66C6:
        JSR     R5,     G_7934                  ; 66C6   0004 0178 0134

        BNC     L_66EA                          ; 66C9   0209 001F

        MVII    #$0323, R4                      ; 66CB   02BC 0323
        MVII    #$0005, R5                      ; 66CD   02BD 0005
L_66CF:
        MVI@    R4,     R2                      ; 66CF   02A2
        TSTR    R2                              ; 66D0   0092
        BEQ     L_66D8                          ; 66D1   0204 0005

        DECR    R5                              ; 66D3   0015
        BNEQ    L_66CF                          ; 66D4   022C 0006
        B       L_66EA                          ; 66D6   0200 0012

L_66D8:
        DECR    R4                              ; 66D8   0014
        SDBD                                    ; 66D9   0001
        MVII    #$0986, R5                      ; 66DA   02BD 0086 0009
        MVO@    R5,     R4                      ; 66DD   0265
        SUBI    #$0011, R4                      ; 66DE   033C 0011

        JSR     R5,     G_7919                  ; 66E0   0004 0178 0119

        MOVR    R4,     R2                      ; 66E3   00A2
        SUBI    #$0319, R2                      ; 66E4   033A 0319
        SLL     R2,     2                       ; 66E6   004E
        SLL     R2,     2                       ; 66E7   004E
        ADD@    R3,     R2                      ; 66E8   02DA
        MVO@    R2,     R3                      ; 66E9   025A

L_66EA:
        JSR     R5,     G_790A                  ; 66EA   0004 0178 010A

        J       G_7813                          ; 66ED   0004 0378 0013

L_66F0:
        PSHR    R5                              ; 66F0   0275
        MVII    #$0102, R3                      ; 66F1   02BB 0102
        CLRR    R0                              ; 66F3   01C0
L_66F4:
        CMP@    R3,     R0                      ; 66F4   0358
        BEQ     L_66FE                          ; 66F5   0204 0007

        INCR    R3                              ; 66F7   000B
        CMPI    #$011A, R3                      ; 66F8   037B 011A
        BNEQ    L_66F4                          ; 66FA   022C 0007
        B       L_6718                          ; 66FC   0200 001A

L_66FE:
        MVII    #$0004, R1                      ; 66FE   02B9 0004
        MVO@    R1,     R3                      ; 6700   0259
        ADDI    #$0018, R3                      ; 6701   02FB 0018
        MVII    #$012C, R0                      ; 6703   02B8 012C
        MVII    #$0010, R1                      ; 6705   02B9 0010

        JSR     R5,     L_6719                  ; 6707   0004 0164 0319

        MVO@    R4,     R3                      ; 670A   025C
        ADDI    #$0018, R3                      ; 670B   02FB 0018
        MVO@    R2,     R3                      ; 670D   025A
        SUBI    #$0030, R3                      ; 670E   033B 0030

        JSR     R5,     G_790A                  ; 6710   0004 0178 010A

        MVII    #$000E, R1                      ; 6713   02B9 000E

        JSR     R5,     L_5DBF                  ; 6715   0004 015C 01BF

L_6718:
        PULR    R7                              ; 6718   02B7
L_6719:
        PSHR    R5                              ; 6719   0275
        CLRR    R4                              ; 671A   01E4
        CMP     G_035D, R0                      ; 671B   0340 035D
        BPL     L_6721                          ; 671D   0203 0002

        MVII    #$0003, R4                      ; 671F   02BC 0003
L_6721:
        CMP     G_035E, R1                      ; 6721   0341 035E
        BPL     L_6727                          ; 6723   0203 0002

        XORI    #$0001, R4                      ; 6725   03FC 0001
L_6727:
        MOVR    R0,     R2                      ; 6727   0082
        SUB     G_035D, R2                      ; 6728   0302 035D
        BPL     L_672D                          ; 672A   0203 0001

        NEGR    R2                              ; 672C   0022
L_672D:
        CMPI    #$0020, R2                      ; 672D   037A 0020
        BPL     L_6733                          ; 672F   0203 0002

        ADDI    #$0004, R4                      ; 6731   02FC 0004
L_6733:
        PULR    R7                              ; 6733   02B7
        XORI    #$03FE, R1                      ; 6734   03F9 03FE
        XORI    #$0002, R1                      ; 6736   03F9 0002
        SETC                                    ; 6738   0007
        EIS                                     ; 6739   0002
        SETC                                    ; 673A   0007
        XORI    #$03FD, R6                      ; 673B   03FE 03FD
        XORI    #$03FD, R5                      ; 673D   03FD 03FD
        DIS                                     ; 673F   0003
        DIS                                     ; 6740   0003
        DIS                                     ; 6741   0003
        DIS                                     ; 6742   0003
        XORI    #$0004, R5                      ; 6743   03FD 0004
        CMPR    R7,     R0                      ; 6745   0178
        ADDR    R7,     R5                      ; 6746   00FD
        SUB     G_0344, R0                      ; 6747   0300 0344
        ADDI    #$0001, R0                      ; 6749   02F8 0001
        ADDI    #$0030, R3                      ; 674B   02FB 0030
        MVI@    R3,     R2                      ; 674D   029A
        TSTR    R2                              ; 674E   0092
        BEQ     L_6753                          ; 674F   0204 0002

        SUBI    #$0002, R0                      ; 6751   0338 0002
L_6753:
        ANDI    #$01FF, R0                      ; 6753   03B8 01FF
        MOVR    R1,     R2                      ; 6755   008A
        SUBI    #$0020, R2                      ; 6756   033A 0020
        NEGR    R2                              ; 6758   0022
        SAR     R2,     2                       ; 6759   006E
        SAR     R2,     2                       ; 675A   006E
        SUBI    #$0018, R3                      ; 675B   033B 0018
        MVI@    R3,     R4                      ; 675D   029C
        XORI    #$0080, R4                      ; 675E   03FC 0080
        SUBI    #$0080, R4                      ; 6760   033C 0080
        ADDR    R4,     R2                      ; 6762   00E2
        MVO@    R2,     R3                      ; 6763   025A
        SAR     R2,     2                       ; 6764   006E
        SAR     R2,     2                       ; 6765   006E
        ADDR    R2,     R1                      ; 6766   00D1
        ANDI    #$007F, R1                      ; 6767   03B9 007F
        SUBI    #$0018, R3                      ; 6769   033B 0018
        MVI@    R3,     R2                      ; 676B   029A
        ANDI    #$0070, R2                      ; 676C   03BA 0070
        BEQ     L_67C8                          ; 676E   0204 0058

        JSR     R5,     G_7C1B                  ; 6770   0004 017C 001B
        JSR     R5,     G_7FE2                  ; 6773   0004 017C 03E2

        MOVR    R5,     R4                      ; 6776   00AC
        ANDI    #$02C0, R5                      ; 6777   03BD 02C0
        BNEQ    L_67C5                          ; 6779   020C 004A

        MVII    #$034B, R5                      ; 677B   02BD 034B
        CLRR    R2                              ; 677D   01D2
L_677E:
        CMP@    R5,     R2                      ; 677E   036A
        BEQ     L_6787                          ; 677F   0204 0006

        CMPI    #$0351, R5                      ; 6781   037D 0351
        BNEQ    L_677E                          ; 6783   022C 0006
        B       L_67C5                          ; 6785   0200 003E

L_6787:
        DECR    R5                              ; 6787   0015
        MVI@    R3,     R2                      ; 6788   029A
        ANDI    #$00F0, R2                      ; 6789   03BA 00F0
        BEQ     L_67C5                          ; 678B   0204 0038

        SLR     R2,     2                       ; 678D   0066
        SLR     R2,     2                       ; 678E   0066
        ADDI    #$0318, R2                      ; 678F   02FA 0318
        MVI@    R2,     R1                      ; 6791   0291
        SUBI    #$0004, R1                      ; 6792   0339 0004
        ANDI    #$0078, R1                      ; 6794   03B9 0078
        SLR     R1,     1                       ; 6796   0061
        MOVR    R1,     R0                      ; 6797   0088
        SLL     R1,     2                       ; 6798   004D
        ADDR    R0,     R1                      ; 6799   00C1
        SUBI    #$0008, R2                      ; 679A   033A 0008
        MVI@    R2,     R0                      ; 679C   0290
        SUBI    #$0004, R0                      ; 679D   0338 0004
        ANDI    #$00FF, R0                      ; 679F   03B8 00FF
        SLR     R0,     2                       ; 67A1   0064
        SLR     R0,     1                       ; 67A2   0060
        CMPI    #$0014, R0                      ; 67A3   0378 0014
        BPL     L_67C5                          ; 67A5   0203 001E

        ADDR    R0,     R1                      ; 67A7   00C1
        CMPI    #$003C, R1                      ; 67A8   0379 003C
        BMI     L_67C5                          ; 67AA   020B 0019

        CMPI    #$00B4, R1                      ; 67AC   0379 00B4
        BPL     L_67C5                          ; 67AE   0203 0015

        SDBD                                    ; 67B0   0001
        MVII    #$09A3, R4                      ; 67B1   02BC 00A3 0009
        ADDI    #$0200, R1                      ; 67B4   02F9 0200
        DECR    R1                              ; 67B6   0011
        CMP@    R1,     R4                      ; 67B7   034C
        BEQ     L_67C5                          ; 67B8   0204 000B

        ADDI    #$0002, R1                      ; 67BA   02F9 0002
        CMP@    R1,     R4                      ; 67BC   034C
        BEQ     L_67C5                          ; 67BD   0204 0006

        DECR    R1                              ; 67BF   0011
        SWAP    R0,     1                       ; 67C0   0040
        SLL     R0,     2                       ; 67C1   004C
        ADDR    R1,     R0                      ; 67C2   00C8
        MVO@    R0,     R5                      ; 67C3   0268
        MVO@    R4,     R1                      ; 67C4   024C
L_67C5:
        J       G_7813                          ; 67C5   0004 0378 0013

L_67C8:
        JSR     R5,     G_7934                  ; 67C8   0004 0178 0134

        BNC     L_67EC                          ; 67CB   0209 001F

        MVII    #$0323, R4                      ; 67CD   02BC 0323
        MVII    #$0005, R5                      ; 67CF   02BD 0005
L_67D1:
        MVI@    R4,     R2                      ; 67D1   02A2
        TSTR    R2                              ; 67D2   0092
        BEQ     L_67DA                          ; 67D3   0204 0005

        DECR    R5                              ; 67D5   0015
        BNEQ    L_67D1                          ; 67D6   022C 0006
        B       L_67EC                          ; 67D8   0200 0012

L_67DA:
        DECR    R4                              ; 67DA   0014
        SDBD                                    ; 67DB   0001
        MVII    #$1977, R5                      ; 67DC   02BD 0077 0019
        MVO@    R5,     R4                      ; 67DF   0265
        SUBI    #$0011, R4                      ; 67E0   033C 0011

        JSR     R5,     G_7919                  ; 67E2   0004 0178 0119

        MOVR    R4,     R2                      ; 67E5   00A2
        SUBI    #$0319, R2                      ; 67E6   033A 0319
        SLL     R2,     2                       ; 67E8   004E
        SLL     R2,     2                       ; 67E9   004E
        ADD@    R3,     R2                      ; 67EA   02DA
        MVO@    R2,     R3                      ; 67EB   025A

L_67EC:
        JSR     R5,     G_790A                  ; 67EC   0004 0178 010A

        J       G_7813                          ; 67EF   0004 0378 0013

L_67F2:
        PSHR    R5                              ; 67F2   0275
        MVII    #$0102, R3                      ; 67F3   02BB 0102
        CLRR    R0                              ; 67F5   01C0
L_67F6:
        CMP@    R3,     R0                      ; 67F6   0358
        BEQ     L_6800                          ; 67F7   0204 0007

        INCR    R3                              ; 67F9   000B
        CMPI    #$011A, R3                      ; 67FA   037B 011A
        BNEQ    L_67F6                          ; 67FC   022C 0007
        B       L_681C                          ; 67FE   0200 001C

L_6800:
        MVII    #$0003, R1                      ; 6800   02B9 0003
        MVO@    R1,     R3                      ; 6802   0259
        ADDI    #$0018, R3                      ; 6803   02FB 0018
        MVII    #$0020, R1                      ; 6805   02B9 0020
        MVO@    R1,     R3                      ; 6807   0259
        ADDI    #$0018, R3                      ; 6808   02FB 0018
        MOVR    R3,     R2                      ; 680A   009A
        ANDI    #$0001, R2                      ; 680B   03BA 0001
        MVO@    R2,     R3                      ; 680D   025A
        SUBI    #$0030, R3                      ; 680E   033B 0030
        MVII    #$0020, R1                      ; 6810   02B9 0020
        MOVR    R3,     R0                      ; 6812   0098
        SLL     R0,     2                       ; 6813   004C
        SLL     R0,     2                       ; 6814   004C
        NOP                                     ; 6815   0034
        SLL     R0,     2                       ; 6816   004C
        ANDI    #$01FF, R0                      ; 6817   03B8 01FF

        JSR     R5,     G_790A                  ; 6819   0004 0178 010A

L_681C:
        PULR    R7                              ; 681C   02B7
L_681D:
        PSHR    R5                              ; 681D   0275

        JSR     R5,     L_6835                  ; 681E   0004 0168 0035

        MVII    #$0328, R4                      ; 6821   02BC 0328
        MVII    #$0102, R5                      ; 6823   02BD 0102
L_6825:
        MVI@    R5,     R1                      ; 6825   02A9
        MVI@    R4,     R2                      ; 6826   02A2
        AND     G_014C, R1                      ; 6827   0381 014C
        BEQ     L_6830                          ; 6829   0204 0005

        PSHR    R5                              ; 682B   0275

        JSR     R5,     L_6878                  ; 682C   0004 0168 0078

        PULR    R5                              ; 682F   02B5
L_6830:
        CMPI    #$0118, R5                      ; 6830   037D 0118
        BNEQ    L_6825                          ; 6832   022C 000E

        PULR    R7                              ; 6834   02B7
L_6835:
        PSHR    R5                              ; 6835   0275
        MVI     G_01AE, R0                      ; 6836   0280 01AE
        TSTR    R0                              ; 6838   0080
        BEQ     L_6870                          ; 6839   0204 0035

        MVI     G_016C, R0                      ; 683B   0280 016C
        TSTR    R0                              ; 683D   0080
        BNEQ    L_6870                          ; 683E   020C 0030

        MVI     G_0347, R2                      ; 6840   0282 0347
        CLRR    R3                              ; 6842   01DB
        MVII    #$0140, R1                      ; 6843   02B9 0140

        JSR     R5,     G_7FC5                  ; 6845   0004 017C 03C5

        ADDI    #$0021, R2                      ; 6848   02FA 0021
        MOVR    R2,     R3                      ; 684A   0093
        ANDI    #$0038, R2                      ; 684B   03BA 0038
        SLR     R2,     1                       ; 684D   0062
        ANDI    #$0007, R3                      ; 684E   03BB 0007
        SLL     R3,     2                       ; 6850   004F
        SLL     R3,     2                       ; 6851   004F
        SLL     R3,     2                       ; 6852   004F
        ADDR    R3,     R2                      ; 6853   00DA
        SDBD                                    ; 6854   0001
        ADDI    #$6B1D, R2                      ; 6855   02FA 001D 006B
        MOVR    R2,     R4                      ; 6858   0094
        CLRR    R2                              ; 6859   01D2
        MVII    #$01AF, R5                      ; 685A   02BD 01AF
        MVII    #$0008, R0                      ; 685C   02B8 0008
L_685E:
        MVO@    R2,     R5                      ; 685E   026A
        MVO@    R2,     R5                      ; 685F   026A
        MVO@    R2,     R5                      ; 6860   026A
        MVO@    R2,     R5                      ; 6861   026A
        SDBD                                    ; 6862   0001
        MVI@    R4,     R1                      ; 6863   02A1
        MVO@    R1,     R5                      ; 6864   0269
        SWAP    R1,     1                       ; 6865   0041
        MVO@    R1,     R5                      ; 6866   0269
        SDBD                                    ; 6867   0001
        MVI@    R4,     R1                      ; 6868   02A1
        MVO@    R1,     R5                      ; 6869   0269
        SWAP    R1,     1                       ; 686A   0041
        MVO@    R1,     R5                      ; 686B   0269
        DECR    R0                              ; 686C   0010
        BNEQ    L_685E                          ; 686D   022C 0010

        PULR    R7                              ; 686F   02B7
L_6870:
        MVII    #$01AF, R4                      ; 6870   02BC 01AF
        MVII    #$0040, R0                      ; 6872   02B8 0040

        JSR     R5,     L_6F9A                  ; 6874   0004 016C 039A

        PULR    R7                              ; 6877   02B7
L_6878:
        MVI     G_01AE, R3                      ; 6878   0283 01AE
        MOVR    R2,     R1                      ; 687A   0091
        SWAP    R2,     1                       ; 687B   0042
        BMI     L_6883                          ; 687C   020B 0005

        TSTR    R3                              ; 687E   009B
        BNEQ    L_689B                          ; 687F   020C 001A
        B       L_6886                          ; 6881   0200 0003

L_6883:
        TSTR    R3                              ; 6883   009B
        BEQ     L_689B                          ; 6884   0204 0015

L_6886:
        SLR     R1,     2                       ; 6886   0065
        SLR     R1,     1                       ; 6887   0061
        MOVR    R1,     R3                      ; 6888   008B
        ANDI    #$0038, R1                      ; 6889   03B9 0038
        SLR     R2,     2                       ; 688B   0066
        SLR     R2,     2                       ; 688C   0066
        ANDI    #$0007, R2                      ; 688D   03BA 0007
        ADDR    R2,     R1                      ; 688F   00D1
        ADDI    #$01AF, R1                      ; 6890   02F9 01AF
        ANDI    #$0007, R3                      ; 6892   03BB 0007
        SDBD                                    ; 6894   0001
        ADDI    #$689C, R3                      ; 6895   02FB 009C 0068
        MVI@    R3,     R3                      ; 6898   029B
        XOR@    R1,     R3                      ; 6899   03CB
        MVO@    R3,     R1                      ; 689A   024B
L_689B:
        MOVR    R5,     R7                      ; 689B   00AF
        TSTR    R0                              ; 689C   0080
        SWAP    R0,     1                       ; 689D   0040
        NEGR    R0                              ; 689E   0020
        DECR    R0                              ; 689F   0010
        INCR    R0                              ; 68A0   0008

        JSRD    R4,     .STIC.X.1               ; 68A1   0004 0002 0001

L_68A4:
        PSHR    R5                              ; 68A4   0275
        MVII    #$01AF, R4                      ; 68A5   02BC 01AF
        SDBD                                    ; 68A7   0001
        MVII    #$3840, R5                      ; 68A8   02BD 0040 0038
        MVII    #$0008, R0                      ; 68AB   02B8 0008
L_68AD:
        MVI@    R4,     R1                      ; 68AD   02A1
        MVO@    R1,     R5                      ; 68AE   0269
        MVI@    R4,     R1                      ; 68AF   02A1
        MVO@    R1,     R5                      ; 68B0   0269
        MVI@    R4,     R1                      ; 68B1   02A1
        MVO@    R1,     R5                      ; 68B2   0269
        MVI@    R4,     R1                      ; 68B3   02A1
        MVO@    R1,     R5                      ; 68B4   0269
        MVI@    R4,     R1                      ; 68B5   02A1
        MVO@    R1,     R5                      ; 68B6   0269
        MVI@    R4,     R1                      ; 68B7   02A1
        MVO@    R1,     R5                      ; 68B8   0269
        MVI@    R4,     R1                      ; 68B9   02A1
        MVO@    R1,     R5                      ; 68BA   0269
        MVI@    R4,     R1                      ; 68BB   02A1
        MVO@    R1,     R5                      ; 68BC   0269
        DECR    R0                              ; 68BD   0010
        BNEQ    L_68AD                          ; 68BE   022C 0012

        PULR    R7                              ; 68C0   02B7
L_68C1:
        PSHR    R5                              ; 68C1   0275
        MVII    #$01AF, R4                      ; 68C2   02BC 01AF
        SDBD                                    ; 68C4   0001
        MVII    #$3880, R5                      ; 68C5   02BD 0080 0038
        MVII    #$0008, R0                      ; 68C8   02B8 0008
        B       L_68AD                          ; 68CA   0220 001E

        MOVR    R5,     R7                      ; 68CC   00AF
L_68CD:
        PSHR    R5                              ; 68CD   0275
        MVI     G_0342, R0                      ; 68CE   0280 0342
        SLR     R0,     2                       ; 68D0   0064
        SLR     R0,     1                       ; 68D1   0060
        ANDI    #$001F, R0                      ; 68D2   03B8 001F
        SLL     R0,     2                       ; 68D4   004C
        SLL     R0,     2                       ; 68D5   004C
        SLL     R0,     1                       ; 68D6   0048
        NOP                                     ; 68D7   0034
        SAR     R0,     2                       ; 68D8   006C
        SAR     R0,     2                       ; 68D9   006C
        PSHR    R0                              ; 68DA   0270
        SAR     R0,     1                       ; 68DB   0068
        ADD@    R6,     R0                      ; 68DC   02F0
        PSHR    R0                              ; 68DD   0270
        SAR     R0,     2                       ; 68DE   006C
        SAR     R0,     2                       ; 68DF   006C
        ADD@    R6,     R0                      ; 68E0   02F0
        ADDI    #$00E0, R0                      ; 68E1   02F8 00E0
        MVO     R0,     G_035D                  ; 68E3   0240 035D
        MVI     G_0318, R1                      ; 68E5   0281 0318
        ANDI    #$007F, R1                      ; 68E7   03B9 007F
        SUBI    #$0020, R1                      ; 68E9   0339 0020
        SLL     R1,     1                       ; 68EB   0049
        MVO     R1,     G_035E                  ; 68EC   0241 035E
        PULR    R7                              ; 68EE   02B7
        MVI@    R3,     R2                      ; 68EF   029A
        SLR     R2,     2                       ; 68F0   0066
        SLR     R2,     2                       ; 68F1   0066
        ANDI    #$0007, R2                      ; 68F2   03BA 0007
        CMPI    #$0003, R2                      ; 68F4   037A 0003
        BMI     L_6919                          ; 68F6   020B 0021

        SDBD                                    ; 68F8   0001
        ADDI    #$0320, R2                      ; 68F9   02FA 0020 0003
        ADDI    #$0018, R3                      ; 68FC   02FB 0018
        MVI@    R3,     R1                      ; 68FE   0299
        INCR    R1                              ; 68FF   0009
        MVO@    R1,     R3                      ; 6900   0259
        SUBI    #$0018, R3                      ; 6901   033B 0018
        CMPI    #$0008, R1                      ; 6903   0379 0008
        BEQ     L_6910                          ; 6905   0204 0009

        ADDI    #$00D5, R1                      ; 6907   02F9 00D5
        SLL     R1,     2                       ; 6909   004D
        SLL     R1,     1                       ; 690A   0049
        ADDI    #$0002, R1                      ; 690B   02F9 0002
        MVO@    R1,     R2                      ; 690D   0251
        B       L_6916                          ; 690E   0200 0006

L_6910:
        CLRR    R0                              ; 6910   01C0
        MVO@    R0,     R2                      ; 6911   0250
        SUBI    #$0010, R2                      ; 6912   033A 0010
        MVO@    R0,     R2                      ; 6914   0250
        MVO@    R0,     R3                      ; 6915   0258
L_6916:
        J       G_7813                          ; 6916   0004 0378 0013

L_6919:
        CLRR    R0                              ; 6919   01C0
        MVO@    R0,     R3                      ; 691A   0258
        B       L_6916                          ; 691B   0220 0006

        DECLE   $0000,  $0000,  $0000,  $0000   ; 691D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6921   0000 0000 0000

        MOVR    R5,     R2                      ; 6924   00AA
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6925   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6929   0000 0000 0000

        MOVR    R5,     R2                      ; 692C   00AA
        DECLE   $0001                           ; 692D   0001

        EIS                                     ; 692E   0002

        JSR     R4,     G_0810                  ; 692F   0004 0008 0010

        NEGR    R0                              ; 6932   0020
        SWAP    R0,     1                       ; 6933   0040
        TSTR    R0                              ; 6934   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6935   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6939   0000 0000 0000 0000
        DECLE   $0001                           ; 693D   0001

        EIS                                     ; 693E   0002

        JSR     R4,     G_0810                  ; 693F   0004 0008 0010

        NEGR    R0                              ; 6942   0020
        SWAP    R0,     1                       ; 6943   0040
        TSTR    R0                              ; 6944   0080
        TSTR    R0                              ; 6945   0080
        SWAP    R0,     1                       ; 6946   0040
        NEGR    R0                              ; 6947   0020
        DECR    R0                              ; 6948   0010
        INCR    R0                              ; 6949   0008

        JSRD    R4,     .STIC.X.1               ; 694A   0004 0002 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 694D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6951   0000 0000 0000 0000

        TSTR    R0                              ; 6955   0080
        SWAP    R0,     1                       ; 6956   0040
        NEGR    R0                              ; 6957   0020
        DECR    R0                              ; 6958   0010
        INCR    R0                              ; 6959   0008

        JSRD    R4,     .STIC.X.1               ; 695A   0004 0002 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 695D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6961   0000 0000 0000

        RLC     R1,     2                       ; 6964   0055
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6965   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6969   0000 0000 0000

        RLC     R1,     2                       ; 696C   0055
        EIS                                     ; 696D   0002

        JSR     R4,     G_0810                  ; 696E   0004 0008 0010

        NEGR    R0                              ; 6971   0020
        SWAP    R0,     1                       ; 6972   0040
        TSTR    R0                              ; 6973   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6974   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6978   0000 0000 0000 0000
        DECLE   $0001                           ; 697C   0001

        DIS                                     ; 697D   0003

        JSR     R4,     G_0810                  ; 697E   0004 0008 0010

        NEGR    R0                              ; 6981   0020
        SWAP    R0,     1                       ; 6982   0040
        TSTR    R0                              ; 6983   0080
        DECLE   $0000,  $0000                   ; 6984   0000 0000

        TSTR    R0                              ; 6986   0080
        SWAP    R0,     1                       ; 6987   0040
        NEGR    R0                              ; 6988   0020
        DECR    R0                              ; 6989   0010
        INCR    R0                              ; 698A   0008

        JSRD    R4,     .STIC.X.1               ; 698B   0004 0002 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 698E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6992   0000 0000 0000 0000

        TSTR    R0                              ; 6996   0080
        SWAP    R0,     1                       ; 6997   0040
        NEGR    R0                              ; 6998   0020
        DECR    R0                              ; 6999   0010
        INCR    R0                              ; 699A   0008
        DECLE   $0004                           ; 699B   0004

        DIS                                     ; 699C   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 699D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 69A1   0000 0000 0000

        MOVR    R5,     R2                      ; 69A4   00AA
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69A5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001           ; 69A9   0000 0000 0001

        MOVR    R5,     R2                      ; 69AC   00AA

        JSR     R4,     G_0810                  ; 69AD   0004 0008 0010

        NEGR    R0                              ; 69B0   0020
        SWAP    R0,     1                       ; 69B1   0040
        TSTR    R0                              ; 69B2   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69B3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69B7   0000 0000 0000 0000
        DECLE   $0001                           ; 69BB   0001

        EIS                                     ; 69BC   0002
        CLRC                                    ; 69BD   0006
        INCR    R1                              ; 69BE   0009
        DECR    R0                              ; 69BF   0010
        NEGR    R0                              ; 69C0   0020
        SWAP    R0,     1                       ; 69C1   0040
        TSTR    R0                              ; 69C2   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69C3   0000 0000 0000 0000

        TSTR    R0                              ; 69C7   0080
        SWAP    R0,     1                       ; 69C8   0040
        NEGR    R0                              ; 69C9   0020
        DECR    R0                              ; 69CA   0010
        INCR    R0                              ; 69CB   0008

        JSRD    R4,     .STIC.X.1               ; 69CC   0004 0002 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69CF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69D3   0000 0000 0000 0000

        TSTR    R0                              ; 69D7   0080
        SWAP    R0,     1                       ; 69D8   0040
        NEGR    R0                              ; 69D9   0020
        DECR    R0                              ; 69DA   0010
        INCR    R0                              ; 69DB   0008
        CLRC                                    ; 69DC   0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69DD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 69E1   0000 0000 0000

        RLC     R1,     2                       ; 69E4   0055
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E5   0000 0000 0000 0000
        DECLE   $0000,  $0001                   ; 69E9   0000 0001

        EIS                                     ; 69EB   0002
        RLC     R0,     2                       ; 69EC   0054
        INCR    R0                              ; 69ED   0008
        DECR    R0                              ; 69EE   0010
        NEGR    R0                              ; 69EF   0020
        SWAP    R0,     1                       ; 69F0   0040
        TSTR    R0                              ; 69F1   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F6   0000 0000 0000 0000
        DECLE   $0001                           ; 69FA   0001

        EIS                                     ; 69FB   0002

        JSR     R4,     G_0C12                  ; 69FC   0004 000C 0012

        NEGR    R1                              ; 69FF   0021
        SWAP    R0,     1                       ; 6A00   0040
        TSTR    R0                              ; 6A01   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A02   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6A06   0000 0000

        TSTR    R0                              ; 6A08   0080
        SWAP    R0,     1                       ; 6A09   0040
        NEGR    R0                              ; 6A0A   0020
        DECR    R0                              ; 6A0B   0010
        INCR    R0                              ; 6A0C   0008

        JSRD    R4,     .STIC.X.1               ; 6A0D   0004 0002 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A14   0000 0000 0000 0000

        TSTR    R0                              ; 6A18   0080
        SWAP    R0,     1                       ; 6A19   0040
        NEGR    R0                              ; 6A1A   0020
        DECR    R0                              ; 6A1B   0010
        INCR    R5                              ; 6A1C   000D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6A21   0000 0000 0000

        MOVR    R5,     R2                      ; 6A24   00AA
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A25   0000 0000 0000 0000
        DECLE   $0001                           ; 6A29   0001

        EIS                                     ; 6A2A   0002

        JSR     R4,     G_A810                  ; 6A2B   0004 00A8 0010

        NEGR    R0                              ; 6A2E   0020
        SWAP    R0,     1                       ; 6A2F   0040
        TSTR    R0                              ; 6A30   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A35   0000 0000 0000 0000
        DECLE   $0001                           ; 6A39   0001

        EIS                                     ; 6A3A   0002

        JSR     R4,     G_0818                  ; 6A3B   0004 0008 0018

        NEGR    R4                              ; 6A3E   0024
        SWAP    R2,     1                       ; 6A3F   0042
        MOVR    R0,     R1                      ; 6A40   0081
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A45   0000 0000 0000 0000

        TSTR    R0                              ; 6A49   0080
        SWAP    R0,     1                       ; 6A4A   0040
        NEGR    R0                              ; 6A4B   0020
        DECR    R0                              ; 6A4C   0010
        INCR    R0                              ; 6A4D   0008

        JSRD    R4,     .STIC.X.1               ; 6A4E   0004 0002 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A55   0000 0000 0000 0000

        TSTR    R0                              ; 6A59   0080
        SWAP    R0,     1                       ; 6A5A   0040
        NEGR    R0                              ; 6A5B   0020
        COMR    R2                              ; 6A5C   001A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6A61   0000 0000 0000

        RLC     R1,     2                       ; 6A64   0055
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6A65   0000 0000 0000 0001

        EIS                                     ; 6A69   0002

        JSR     R4,     G_0850                  ; 6A6A   0004 0008 0050

        NEGR    R0                              ; 6A6D   0020
        SWAP    R0,     1                       ; 6A6E   0040
        TSTR    R0                              ; 6A6F   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A70   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A74   0000 0000 0000 0000
        DECLE   $0001                           ; 6A78   0001

        EIS                                     ; 6A79   0002

        JSR     R4,     G_0810                  ; 6A7A   0004 0008 0010

        GSWD    R0                              ; 6A7D   0030
        SLL     R0,     1                       ; 6A7E   0048
        MOVR    R0,     R4                      ; 6A7F   0084
        EIS                                     ; 6A80   0002
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6A81   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A85   0000 0000 0000 0000
        DECLE   $0000                           ; 6A89   0000

        TSTR    R0                              ; 6A8A   0080
        SWAP    R0,     1                       ; 6A8B   0040
        NEGR    R0                              ; 6A8C   0020
        DECR    R0                              ; 6A8D   0010
        INCR    R0                              ; 6A8E   0008

        JSRD    R4,     .STIC.X.1               ; 6A8F   0004 0002 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A92   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A96   0000 0000 0000 0000

        TSTR    R0                              ; 6A9A   0080
        SWAP    R0,     1                       ; 6A9B   0040
        DECLE   $0035,  $0000,  $0000,  $0000   ; 6A9C   0035 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AA0   0000 0000 0000 0000

        MOVR    R5,     R2                      ; 6AA4   00AA
        DECLE   $0000,  $0000,  $0001           ; 6AA5   0000 0000 0001

        EIS                                     ; 6AA8   0002

        JSR     R4,     G_0810                  ; 6AA9   0004 0008 0010

        MOVR    R4,     R0                      ; 6AAC   00A0
        SWAP    R0,     1                       ; 6AAD   0040
        TSTR    R0                              ; 6AAE   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AAF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB3   0000 0000 0000 0000
        DECLE   $0001                           ; 6AB7   0001

        EIS                                     ; 6AB8   0002

        JSR     R4,     G_0810                  ; 6AB9   0004 0008 0010

        NEGR    R0                              ; 6ABC   0020
        SLR     R0,     1                       ; 6ABD   0060
        MOVR    R2,     R0                      ; 6ABE   0090
        INCR    R0                              ; 6ABF   0008

        JSRD    R4,     .STIC.X.1               ; 6AC0   0004 0002 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AC3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AC7   0000 0000 0000 0000

        TSTR    R0                              ; 6ACB   0080
        SWAP    R0,     1                       ; 6ACC   0040
        NEGR    R0                              ; 6ACD   0020
        DECR    R0                              ; 6ACE   0010
        INCR    R0                              ; 6ACF   0008

        JSRD    R4,     .STIC.X.1               ; 6AD0   0004 0002 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AD3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AD7   0000 0000 0000 0000

        TSTR    R0                              ; 6ADB   0080
        SAR     R2,     1                       ; 6ADC   006A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ADD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6AE1   0000 0000 0000

        RLC     R1,     2                       ; 6AE4   0055
        DECLE   $0000,  $0001                   ; 6AE5   0000 0001

        EIS                                     ; 6AE7   0002

        JSR     R4,     G_0810                  ; 6AE8   0004 0008 0010

        NEGR    R0                              ; 6AEB   0020
        SWAP    R0,     1                       ; 6AEC   0040
        TSTR    R0                              ; 6AED   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AF2   0000 0000 0000 0000
        DECLE   $0001                           ; 6AF6   0001

        EIS                                     ; 6AF7   0002

        JSR     R4,     G_0810                  ; 6AF8   0004 0008 0010

        NEGR    R0                              ; 6AFB   0020
        SWAP    R0,     1                       ; 6AFC   0040
        ADDR    R0,     R0                      ; 6AFD   00C0
        NEGR    R0                              ; 6AFE   0020
        DECR    R0                              ; 6AFF   0010
        INCR    R0                              ; 6B00   0008

        JSRD    R4,     .STIC.X.1               ; 6B01   0004 0002 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B04   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B08   0000 0000 0000 0000

        TSTR    R0                              ; 6B0C   0080
        SWAP    R0,     1                       ; 6B0D   0040
        NEGR    R0                              ; 6B0E   0020
        DECR    R0                              ; 6B0F   0010
        INCR    R0                              ; 6B10   0008

        JSRD    R4,     .STIC.X.1               ; 6B11   0004 0002 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B18   0000 0000 0000 0000

        ADDR    R2,     R5                      ; 6B1C   00D5
        INCR    R0                              ; 6B1D   0008
        DECR    R4                              ; 6B1E   0014
        ADDR    R4,     R3                      ; 6B1F   00E3
        DECLE   $0000,  $0000                   ; 6B20   0000 0000

        JSRD    R4,     G_F801                  ; 6B22   0004 00FA 0001
        DECLE   $0001                           ; 6B25   0001

        NEGR    R2                              ; 6B26   0022
        SLLC    R0,     2                       ; 6B27   005C
        TSTR    R0                              ; 6B28   0080
        DECLE   $0000                           ; 6B29   0000

        ADDR    R6,     R0                      ; 6B2A   00F0
        INCR    R7                              ; 6B2B   000F
        DECLE   $0000,  $0000,  $0000           ; 6B2C   0000 0000 0000

        ADDR    R7,     R7                      ; 6B2F   00FF
        DECLE   $0000,  $0000                   ; 6B30   0000 0000

        INCR    R0                              ; 6B32   0008
        MOVR    R2,     R7                      ; 6B33   0097
        SLR     R0,     1                       ; 6B34   0060
        DECLE   $0000                           ; 6B35   0000

        INCR    R7                              ; 6B36   000F
        ADDR    R6,     R0                      ; 6B37   00F0
        DECLE   $0000,  $0000                   ; 6B38   0000 0000

        ADDR    R7,     R0                      ; 6B3A   00F8
        SETC                                    ; 6B3B   0007
        DECLE   $0000                           ; 6B3C   0000

        INCR    R0                              ; 6B3D   0008
        DECR    R4                              ; 6B3E   0014
        ADDR    R4,     R3                      ; 6B3F   00E3
        DECLE   $0000,  $0000                   ; 6B40   0000 0000

        JSRD    R4,     G_F801                  ; 6B42   0004 00FA 0001
        DECLE   $0001                           ; 6B45   0001

        NEGR    R2                              ; 6B46   0022
        SLLC    R0,     2                       ; 6B47   005C
        TSTR    R0                              ; 6B48   0080
        DECLE   $0000                           ; 6B49   0000

        ADDR    R6,     R0                      ; 6B4A   00F0
        INCR    R7                              ; 6B4B   000F
        DECLE   $0000,  $0000,  $0000           ; 6B4C   0000 0000 0000

        ADDR    R7,     R7                      ; 6B4F   00FF
        DECLE   $0000,  $0000                   ; 6B50   0000 0000

        INCR    R0                              ; 6B52   0008
        MOVR    R2,     R7                      ; 6B53   0097
        SLR     R0,     1                       ; 6B54   0060
        DECLE   $0000                           ; 6B55   0000

        INCR    R7                              ; 6B56   000F
        ADDR    R6,     R0                      ; 6B57   00F0
        DECLE   $0000,  $0000                   ; 6B58   0000 0000

        ADDR    R7,     R0                      ; 6B5A   00F8
        SETC                                    ; 6B5B   0007
        DECLE   $0000                           ; 6B5C   0000

        DECR    R0                              ; 6B5D   0010
        ADCR    R0                              ; 6B5E   0028
        ADDR    R0,     R7                      ; 6B5F   00C7
        DECLE   $0000,  $0000                   ; 6B60   0000 0000

        INCR    R0                              ; 6B62   0008
        ADDR    R6,     R4                      ; 6B63   00F4
        DIS                                     ; 6B64   0003
        EIS                                     ; 6B65   0002
        SWAP    R1,     2                       ; 6B66   0045
        MOVR    R7,     R0                      ; 6B67   00B8
        DECLE   $0000,  $0000                   ; 6B68   0000 0000

        ADDR    R4,     R0                      ; 6B6A   00E0
        COMR    R7                              ; 6B6B   001F
        DECLE   $0000,  $0000,  $0000           ; 6B6C   0000 0000 0000

        ADDR    R7,     R7                      ; 6B6F   00FF
        DECLE   $0000,  $0000                   ; 6B70   0000 0000

        DECR    R0                              ; 6B72   0010
        ADCR    R7                              ; 6B73   002F
        ADDR    R0,     R0                      ; 6B74   00C0
        DECLE   $0000                           ; 6B75   0000

        COMR    R7                              ; 6B76   001F
        ADDR    R4,     R0                      ; 6B77   00E0
        DECLE   $0000,  $0000                   ; 6B78   0000 0000

        ADDR    R6,     R0                      ; 6B7A   00F0
        INCR    R7                              ; 6B7B   000F
        DECLE   $0000                           ; 6B7C   0000

        DECR    R0                              ; 6B7D   0010
        ADCR    R0                              ; 6B7E   0028
        ADDR    R0,     R7                      ; 6B7F   00C7
        DECLE   $0000,  $0000                   ; 6B80   0000 0000

        INCR    R0                              ; 6B82   0008
        ADDR    R6,     R4                      ; 6B83   00F4
        DIS                                     ; 6B84   0003
        EIS                                     ; 6B85   0002
        SWAP    R1,     2                       ; 6B86   0045
        MOVR    R7,     R0                      ; 6B87   00B8
        DECLE   $0000,  $0000                   ; 6B88   0000 0000

        ADDR    R4,     R0                      ; 6B8A   00E0
        COMR    R7                              ; 6B8B   001F
        DECLE   $0000,  $0000,  $0000           ; 6B8C   0000 0000 0000

        ADDR    R7,     R7                      ; 6B8F   00FF
        DECLE   $0000,  $0000                   ; 6B90   0000 0000

        DECR    R0                              ; 6B92   0010
        ADCR    R7                              ; 6B93   002F
        ADDR    R0,     R0                      ; 6B94   00C0
        DECLE   $0000                           ; 6B95   0000

        COMR    R7                              ; 6B96   001F
        ADDR    R4,     R0                      ; 6B97   00E0
        DECLE   $0000,  $0000                   ; 6B98   0000 0000

        ADDR    R6,     R0                      ; 6B9A   00F0
        INCR    R7                              ; 6B9B   000F
        DECLE   $0000                           ; 6B9C   0000

        NEGR    R0                              ; 6B9D   0020
        RLC     R0,     1                       ; 6B9E   0050
        MOVR    R1,     R7                      ; 6B9F   008F
        DECLE   $0000,  $0000                   ; 6BA0   0000 0000

        DECR    R0                              ; 6BA2   0010
        ADDR    R5,     R1                      ; 6BA3   00E9
        CLRC                                    ; 6BA4   0006
        DECLE   $0004                           ; 6BA5   0004

        MOVR    R1,     R3                      ; 6BA6   008B
        RRC     R0,     1                       ; 6BA7   0070
        DECLE   $0000,  $0000                   ; 6BA8   0000 0000

        ADDR    R0,     R0                      ; 6BAA   00C0
        RSWD    R7                              ; 6BAB   003F
        DECLE   $0000,  $0000,  $0000           ; 6BAC   0000 0000 0000

        ADDR    R7,     R6                      ; 6BAF   00FE
        DECLE   $0001,  $0000                   ; 6BB0   0001 0000

        NEGR    R0                              ; 6BB2   0020
        SLLC    R3,     2                       ; 6BB3   005F
        TSTR    R0                              ; 6BB4   0080
        DECLE   $0000                           ; 6BB5   0000

        RSWD    R7                              ; 6BB6   003F
        ADDR    R0,     R0                      ; 6BB7   00C0
        DECLE   $0000,  $0000                   ; 6BB8   0000 0000

        ADDR    R4,     R0                      ; 6BBA   00E0
        COMR    R7                              ; 6BBB   001F
        DECLE   $0000                           ; 6BBC   0000

        NEGR    R0                              ; 6BBD   0020
        RLC     R0,     1                       ; 6BBE   0050
        MOVR    R1,     R7                      ; 6BBF   008F
        DECLE   $0000,  $0000                   ; 6BC0   0000 0000

        DECR    R0                              ; 6BC2   0010
        ADDR    R5,     R1                      ; 6BC3   00E9
        CLRC                                    ; 6BC4   0006
        DECLE   $0004                           ; 6BC5   0004

        MOVR    R1,     R3                      ; 6BC6   008B
        RRC     R0,     1                       ; 6BC7   0070
        DECLE   $0000,  $0000                   ; 6BC8   0000 0000

        ADDR    R0,     R0                      ; 6BCA   00C0
        RSWD    R7                              ; 6BCB   003F
        DECLE   $0000,  $0000,  $0000           ; 6BCC   0000 0000 0000

        ADDR    R7,     R6                      ; 6BCF   00FE
        DECLE   $0001,  $0000                   ; 6BD0   0001 0000

        NEGR    R0                              ; 6BD2   0020
        SLLC    R3,     2                       ; 6BD3   005F
        TSTR    R0                              ; 6BD4   0080
        DECLE   $0000                           ; 6BD5   0000

        RSWD    R7                              ; 6BD6   003F
        ADDR    R0,     R0                      ; 6BD7   00C0
        DECLE   $0000,  $0000                   ; 6BD8   0000 0000

        ADDR    R4,     R0                      ; 6BDA   00E0
        COMR    R7                              ; 6BDB   001F
        DECLE   $0000                           ; 6BDC   0000

        SWAP    R0,     1                       ; 6BDD   0040
        MOVR    R4,     R0                      ; 6BDE   00A0
        COMR    R7                              ; 6BDF   001F
        DECLE   $0000,  $0000                   ; 6BE0   0000 0000

        NEGR    R1                              ; 6BE2   0021
        ADDR    R2,     R2                      ; 6BE3   00D2
        INCR    R4                              ; 6BE4   000C
        INCR    R0                              ; 6BE5   0008
        DECR    R7                              ; 6BE6   0017
        ADDR    R4,     R0                      ; 6BE7   00E0
        DECLE   $0000,  $0000                   ; 6BE8   0000 0000

        TSTR    R0                              ; 6BEA   0080
        SARC    R3,     2                       ; 6BEB   007F
        DECLE   $0000,  $0000,  $0000           ; 6BEC   0000 0000 0000

        ADDR    R7,     R4                      ; 6BEF   00FC
        DIS                                     ; 6BF0   0003
        DECLE   $0000                           ; 6BF1   0000

        SWAP    R0,     1                       ; 6BF2   0040
        TSTR    R7                              ; 6BF3   00BF
        DECLE   $0000,  $0000                   ; 6BF4   0000 0000

        SARC    R3,     2                       ; 6BF6   007F
        TSTR    R0                              ; 6BF7   0080
        DECLE   $0000,  $0000                   ; 6BF8   0000 0000

        ADDR    R0,     R0                      ; 6BFA   00C0
        RSWD    R7                              ; 6BFB   003F
        DECLE   $0000                           ; 6BFC   0000

        SWAP    R0,     1                       ; 6BFD   0040
        MOVR    R4,     R0                      ; 6BFE   00A0
        COMR    R7                              ; 6BFF   001F
        DECLE   $0000,  $0000                   ; 6C00   0000 0000

        NEGR    R1                              ; 6C02   0021
        ADDR    R2,     R2                      ; 6C03   00D2
        INCR    R4                              ; 6C04   000C
        INCR    R0                              ; 6C05   0008
        DECR    R7                              ; 6C06   0017
        ADDR    R4,     R0                      ; 6C07   00E0
        DECLE   $0000,  $0000                   ; 6C08   0000 0000

        TSTR    R0                              ; 6C0A   0080
        SARC    R3,     2                       ; 6C0B   007F
        DECLE   $0000,  $0000,  $0000           ; 6C0C   0000 0000 0000

        ADDR    R7,     R4                      ; 6C0F   00FC
        DIS                                     ; 6C10   0003
        DECLE   $0000                           ; 6C11   0000

        SWAP    R0,     1                       ; 6C12   0040
        TSTR    R7                              ; 6C13   00BF
        DECLE   $0000,  $0000                   ; 6C14   0000 0000

        SARC    R3,     2                       ; 6C16   007F
        TSTR    R0                              ; 6C17   0080
        DECLE   $0000,  $0000                   ; 6C18   0000 0000

        ADDR    R0,     R0                      ; 6C1A   00C0
        RSWD    R7                              ; 6C1B   003F
        DECLE   $0000                           ; 6C1C   0000

        TSTR    R0                              ; 6C1D   0080
        SWAP    R0,     1                       ; 6C1E   0040
        RSWD    R7                              ; 6C1F   003F
        DECLE   $0000,  $0000                   ; 6C20   0000 0000

        SWAP    R2,     1                       ; 6C22   0042
        MOVR    R4,     R5                      ; 6C23   00A5
        COMR    R0                              ; 6C24   0018
        DECR    R0                              ; 6C25   0010
        ADCR    R7                              ; 6C26   002F
        ADDR    R0,     R0                      ; 6C27   00C0
        DECLE   $0000,  $0000,  $0000           ; 6C28   0000 0000 0000

        ADDR    R7,     R7                      ; 6C2B   00FF
        DECLE   $0000,  $0000,  $0000           ; 6C2C   0000 0000 0000

        ADDR    R7,     R1                      ; 6C2F   00F9
        CLRC                                    ; 6C30   0006
        DECLE   $0000                           ; 6C31   0000

        TSTR    R0                              ; 6C32   0080
        SARC    R3,     2                       ; 6C33   007F
        DECLE   $0000,  $0000                   ; 6C34   0000 0000

        ADDR    R7,     R7                      ; 6C36   00FF
        DECLE   $0000,  $0000,  $0000           ; 6C37   0000 0000 0000

        MOVR    R0,     R1                      ; 6C3A   0081
        SARC    R2,     2                       ; 6C3B   007E
        DECLE   $0000                           ; 6C3C   0000

        TSTR    R0                              ; 6C3D   0080
        SWAP    R0,     1                       ; 6C3E   0040
        RSWD    R7                              ; 6C3F   003F
        DECLE   $0000,  $0000                   ; 6C40   0000 0000

        SWAP    R2,     1                       ; 6C42   0042
        MOVR    R4,     R5                      ; 6C43   00A5
        COMR    R0                              ; 6C44   0018
        DECR    R0                              ; 6C45   0010
        ADCR    R7                              ; 6C46   002F
        ADDR    R0,     R0                      ; 6C47   00C0
        DECLE   $0000,  $0000,  $0000           ; 6C48   0000 0000 0000

        ADDR    R7,     R7                      ; 6C4B   00FF
        DECLE   $0000,  $0000,  $0000           ; 6C4C   0000 0000 0000

        ADDR    R7,     R1                      ; 6C4F   00F9
        CLRC                                    ; 6C50   0006
        DECLE   $0000                           ; 6C51   0000

        TSTR    R0                              ; 6C52   0080
        SARC    R3,     2                       ; 6C53   007F
        DECLE   $0000,  $0000                   ; 6C54   0000 0000

        ADDR    R7,     R7                      ; 6C56   00FF
        DECLE   $0000,  $0000,  $0000           ; 6C57   0000 0000 0000

        MOVR    R0,     R1                      ; 6C5A   0081
        SARC    R2,     2                       ; 6C5B   007E
        DECLE   $0000,  $0000                   ; 6C5C   0000 0000

        TSTR    R0                              ; 6C5E   0080
        SARC    R3,     2                       ; 6C5F   007F
        DECLE   $0000,  $0000                   ; 6C60   0000 0000

        MOVR    R0,     R4                      ; 6C62   0084
        SLL     R3,     1                       ; 6C63   004B
        GSWD    R0                              ; 6C64   0030
        NEGR    R0                              ; 6C65   0020
        SLLC    R2,     2                       ; 6C66   005E
        MOVR    R0,     R1                      ; 6C67   0081
        DECLE   $0000,  $0000,  $0000           ; 6C68   0000 0000 0000

        ADDR    R7,     R7                      ; 6C6B   00FF
        DECLE   $0000,  $0000,  $0001           ; 6C6C   0000 0000 0001

        ADDR    R6,     R2                      ; 6C6F   00F2
        INCR    R4                              ; 6C70   000C
        DECLE   $0000,  $0001                   ; 6C71   0000 0001

        ADDR    R7,     R6                      ; 6C73   00FE
        DECLE   $0000,  $0000                   ; 6C74   0000 0000

        ADDR    R7,     R7                      ; 6C76   00FF
        DECLE   $0000,  $0000,  $0001           ; 6C77   0000 0000 0001

        EIS                                     ; 6C7A   0002
        ADDR    R7,     R4                      ; 6C7B   00FC
        DECLE   $0000,  $0000                   ; 6C7C   0000 0000

        TSTR    R0                              ; 6C7E   0080
        SARC    R3,     2                       ; 6C7F   007F
        DECLE   $0000,  $0000                   ; 6C80   0000 0000

        MOVR    R0,     R4                      ; 6C82   0084
        SLL     R3,     1                       ; 6C83   004B
        GSWD    R0                              ; 6C84   0030
        NEGR    R0                              ; 6C85   0020
        SLLC    R2,     2                       ; 6C86   005E
        MOVR    R0,     R1                      ; 6C87   0081
        DECLE   $0000,  $0000,  $0000           ; 6C88   0000 0000 0000

        ADDR    R7,     R7                      ; 6C8B   00FF
        DECLE   $0000,  $0000,  $0001           ; 6C8C   0000 0000 0001

        ADDR    R6,     R2                      ; 6C8F   00F2
        INCR    R4                              ; 6C90   000C
        DECLE   $0000,  $0001                   ; 6C91   0000 0001

        ADDR    R7,     R6                      ; 6C93   00FE
        DECLE   $0000,  $0000                   ; 6C94   0000 0000

        ADDR    R7,     R7                      ; 6C96   00FF
        DECLE   $0000,  $0000,  $0001           ; 6C97   0000 0000 0001

        EIS                                     ; 6C9A   0002
        ADDR    R7,     R4                      ; 6C9B   00FC
        DECLE   $0000,  $0000,  $0001           ; 6C9C   0000 0000 0001

        ADDR    R7,     R6                      ; 6C9F   00FE
        DECLE   $0000,  $0000                   ; 6CA0   0000 0000

        INCR    R0                              ; 6CA2   0008
        MOVR    R2,     R7                      ; 6CA3   0097
        SLR     R0,     1                       ; 6CA4   0060
        SWAP    R0,     1                       ; 6CA5   0040
        MOVR    R7,     R4                      ; 6CA6   00BC
        DIS                                     ; 6CA7   0003
        DECLE   $0000,  $0000,  $0000           ; 6CA8   0000 0000 0000

        ADDR    R7,     R7                      ; 6CAB   00FF
        DECLE   $0000,  $0000                   ; 6CAC   0000 0000

        EIS                                     ; 6CAE   0002
        ADDR    R4,     R5                      ; 6CAF   00E5
        COMR    R0                              ; 6CB0   0018
        DECLE   $0000                           ; 6CB1   0000

        DIS                                     ; 6CB2   0003
        ADDR    R7,     R4                      ; 6CB3   00FC
        DECLE   $0000,  $0000                   ; 6CB4   0000 0000

        ADDR    R7,     R6                      ; 6CB6   00FE
        DECLE   $0001,  $0000                   ; 6CB7   0001 0000

        EIS                                     ; 6CB9   0002
        DECLE   $0005                           ; 6CBA   0005

        ADDR    R7,     R0                      ; 6CBB   00F8
        DECLE   $0000,  $0000,  $0001           ; 6CBC   0000 0000 0001

        ADDR    R7,     R6                      ; 6CBF   00FE
        DECLE   $0000,  $0000                   ; 6CC0   0000 0000

        INCR    R0                              ; 6CC2   0008
        MOVR    R2,     R7                      ; 6CC3   0097
        SLR     R0,     1                       ; 6CC4   0060
        SWAP    R0,     1                       ; 6CC5   0040
        MOVR    R7,     R4                      ; 6CC6   00BC
        DIS                                     ; 6CC7   0003
        DECLE   $0000,  $0000,  $0000           ; 6CC8   0000 0000 0000

        ADDR    R7,     R7                      ; 6CCB   00FF
        DECLE   $0000,  $0000                   ; 6CCC   0000 0000

        EIS                                     ; 6CCE   0002
        ADDR    R4,     R5                      ; 6CCF   00E5
        COMR    R0                              ; 6CD0   0018
        DECLE   $0000                           ; 6CD1   0000

        DIS                                     ; 6CD2   0003
        ADDR    R7,     R4                      ; 6CD3   00FC
        DECLE   $0000,  $0000                   ; 6CD4   0000 0000

        ADDR    R7,     R6                      ; 6CD6   00FE
        DECLE   $0001,  $0000                   ; 6CD7   0001 0000

        EIS                                     ; 6CD9   0002
        DECLE   $0005                           ; 6CDA   0005

        ADDR    R7,     R0                      ; 6CDB   00F8
        DECLE   $0000,  $0000                   ; 6CDC   0000 0000

        EIS                                     ; 6CDE   0002
        ADDR    R7,     R5                      ; 6CDF   00FD
        DECLE   $0000,  $0000                   ; 6CE0   0000 0000

        DECR    R1                              ; 6CE2   0011
        ADCR    R6                              ; 6CE3   002E
        ADDR    R0,     R0                      ; 6CE4   00C0
        TSTR    R0                              ; 6CE5   0080
        SARC    R0,     1                       ; 6CE6   0078
        SETC                                    ; 6CE7   0007
        DECLE   $0000,  $0000,  $0000           ; 6CE8   0000 0000 0000

        ADDR    R7,     R7                      ; 6CEB   00FF
        DECLE   $0000,  $0000,  $0004           ; 6CEC   0000 0000 0004

        ADDR    R1,     R3                      ; 6CEF   00CB
        GSWD    R0                              ; 6CF0   0030
        DECLE   $0000                           ; 6CF1   0000

        SETC                                    ; 6CF2   0007
        ADDR    R7,     R0                      ; 6CF3   00F8
        DECLE   $0000,  $0000                   ; 6CF4   0000 0000

        ADDR    R7,     R4                      ; 6CF6   00FC
        DIS                                     ; 6CF7   0003
        DECLE   $0000                           ; 6CF8   0000

        JSRD    R4,     G_08F1                  ; 6CF9   0004 000A 00F1
        DECLE   $0000,  $0000                   ; 6CFC   0000 0000

        EIS                                     ; 6CFE   0002
        ADDR    R7,     R5                      ; 6CFF   00FD
        DECLE   $0000,  $0000                   ; 6D00   0000 0000

        DECR    R1                              ; 6D02   0011
        ADCR    R6                              ; 6D03   002E
        ADDR    R0,     R0                      ; 6D04   00C0
        TSTR    R0                              ; 6D05   0080
        SARC    R0,     1                       ; 6D06   0078
        SETC                                    ; 6D07   0007
        DECLE   $0000,  $0000,  $0000           ; 6D08   0000 0000 0000

        ADDR    R7,     R7                      ; 6D0B   00FF
        DECLE   $0000,  $0000,  $0004           ; 6D0C   0000 0000 0004

        ADDR    R1,     R3                      ; 6D0F   00CB
        GSWD    R0                              ; 6D10   0030
        DECLE   $0000                           ; 6D11   0000

        SETC                                    ; 6D12   0007
        ADDR    R7,     R0                      ; 6D13   00F8
        DECLE   $0000,  $0000                   ; 6D14   0000 0000

        ADDR    R7,     R4                      ; 6D16   00FC
        DIS                                     ; 6D17   0003
        DECLE   $0000                           ; 6D18   0000

        JSRD    R4,     G_08F1                  ; 6D19   0004 000A 00F1
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D1C   0000 0000 0000 0000
        DECLE   $0000                           ; 6D20   0000

        SLLC    R0,     2                       ; 6D21   005C
        RSWD    R6                              ; 6D22   003E
        SLLC    R0,     2                       ; 6D23   005C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D24   0000 0000 0000 0000

        SLR     R0,     1                       ; 6D28   0060
        ADDR    R6,     R0                      ; 6D29   00F0
        SARC    R3,     2                       ; 6D2A   007F
        DECLE   $0000,  $0000                   ; 6D2B   0000 0000

        COMR    R0                              ; 6D2D   0018
        COMR    R0                              ; 6D2E   0018
        COMR    R0                              ; 6D2F   0018
        ADDR    R7,     R7                      ; 6D30   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D31   0000 0000 0000 0000

        SLR     R0,     1                       ; 6D35   0060
        SLR     R0,     1                       ; 6D36   0060
        SLR     R0,     1                       ; 6D37   0060
        ADDR    R7,     R7                      ; 6D38   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D39   0000 0000 0000 0000

        CLRC                                    ; 6D3D   0006
        CLRC                                    ; 6D3E   0006
        CLRC                                    ; 6D3F   0006
        ADDR    R7,     R7                      ; 6D40   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D41   0000 0000 0000 0000
L_6D45:
        PSHR    R5                              ; 6D45   0275
        MVII    #$0028, R0                      ; 6D46   02B8 0028
        SDBD                                    ; 6D48   0001
        MVII    #$3900, R1                      ; 6D49   02B9 0000 0039
        SDBD                                    ; 6D4C   0001
        MVII    #$6D1D, R4                      ; 6D4D   02BC 001D 006D

        JSR     R5,     L_6FA2                  ; 6D50   0004 016C 03A2

        PULR    R7                              ; 6D53   02B7
L_6D54:
        PSHR    R5                              ; 6D54   0275
        SDBD                                    ; 6D55   0001
        MVII    #$0669, R1                      ; 6D56   02B9 0069 0006
        MVII    #$0014, R0                      ; 6D59   02B8 0014
        MVII    #$0228, R4                      ; 6D5B   02BC 0228
L_6D5D:
        MVO@    R1,     R4                      ; 6D5D   0261
        DECR    R0                              ; 6D5E   0010
        BNEQ    L_6D5D                          ; 6D5F   022C 0003

        MVII    #$02E1, R0                      ; 6D61   02B8 02E1
        MVO     R0,     .BTAB.0A                ; 6D63   0240 020A
        MVO     R0,     .BTAB.13                ; 6D65   0240 0213
        MVO     R0,     .BTAB.1E                ; 6D67   0240 021E
        MVO     R0,     .BTAB.27                ; 6D69   0240 0227
        SDBD                                    ; 6D6B   0001
        MVII    #$0911, R0                      ; 6D6C   02B8 0011 0009
        MVO     R0,     .BTAB.32                ; 6D6F   0240 0232
        MVO     R0,     .BTAB.3B                ; 6D71   0240 023B
        SDBD                                    ; 6D73   0001
        MVII    #$0919, R0                      ; 6D74   02B8 0019 0009
        MVO     R0,     .BTAB.36                ; 6D77   0240 0236
        SDBD                                    ; 6D79   0001
        MVII    #$0921, R0                      ; 6D7A   02B8 0021 0009
        MVO     R0,     .BTAB.37                ; 6D7D   0240 0237
        MVII    #$0008, R0                      ; 6D7F   02B8 0008
        MVII    #$020B, R4                      ; 6D81   02BC 020B
        SDBD                                    ; 6D83   0001
        MVII    #$0844, R1                      ; 6D84   02B9 0044 0008
L_6D87:
        MVO@    R1,     R4                      ; 6D87   0261
        ADDI    #$0008, R1                      ; 6D88   02F9 0008
        DECR    R0                              ; 6D8A   0010
        BNEQ    L_6D87                          ; 6D8B   022C 0005

        MVII    #$0008, R0                      ; 6D8D   02B8 0008
        MVII    #$021F, R4                      ; 6D8F   02BC 021F
L_6D91:
        MVO@    R1,     R4                      ; 6D91   0261
        ADDI    #$0008, R1                      ; 6D92   02F9 0008
        DECR    R0                              ; 6D94   0010
        BNEQ    L_6D91                          ; 6D95   022C 0005

        JSR     R5,     L_6DA1                  ; 6D97   0004 016C 01A1
        JSR     R5,     L_6DC0                  ; 6D9A   0004 016C 01C0
        JSR     R5,     L_59BD                  ; 6D9D   0004 0158 01BD

        PULR    R7                              ; 6DA0   02B7
L_6DA1:
        PSHR    R5                              ; 6DA1   0275
        MVII    #$0201, R4                      ; 6DA2   02BC 0201
        CLRR    R0                              ; 6DA4   01C0
        MVO@    R0,     R4                      ; 6DA5   0260
        MVO@    R0,     R4                      ; 6DA6   0260
        MVO@    R0,     R4                      ; 6DA7   0260
        NOP                                     ; 6DA8   0034
        MVO@    R0,     R4                      ; 6DA9   0260
        MVO@    R0,     R4                      ; 6DAA   0260
        SDBD                                    ; 6DAB   0001
        MVII    #$190D, R0                      ; 6DAC   02B8 000D 0019
        MVI     G_0182, R1                      ; 6DAF   0281 0182
        CMPI    #$0006, R1                      ; 6DB1   0379 0006
        BMI     L_6DB7                          ; 6DB3   020B 0002

        MVII    #$0005, R1                      ; 6DB5   02B9 0005
L_6DB7:
        MVII    #$0201, R4                      ; 6DB7   02BC 0201
L_6DB9:
        DECR    R1                              ; 6DB9   0011
        BMI     L_6DBF                          ; 6DBA   020B 0003

        MVO@    R0,     R4                      ; 6DBC   0260
        B       L_6DB9                          ; 6DBD   0220 0005

L_6DBF:
        PULR    R7                              ; 6DBF   02B7
L_6DC0:
        PSHR    R5                              ; 6DC0   0275
        MVII    #$0207, R4                      ; 6DC1   02BC 0207
        CLRR    R0                              ; 6DC3   01C0
        MVO@    R0,     R4                      ; 6DC4   0260
        MVO@    R0,     R4                      ; 6DC5   0260
        MVO@    R0,     R4                      ; 6DC6   0260
        SDBD                                    ; 6DC7   0001
        MVII    #$1900, R0                      ; 6DC8   02B8 0000 0019
L_6DCB:
        MVI     G_0183, R1                      ; 6DCB   0281 0183
        CMPI    #$0004, R1                      ; 6DCD   0379 0004
        BMI     L_6DD3                          ; 6DCF   020B 0002

        MVII    #$0003, R1                      ; 6DD1   02B9 0003
L_6DD3:
        MVII    #$0207, R4                      ; 6DD3   02BC 0207
L_6DD5:
        DECR    R1                              ; 6DD5   0011
        BMI     L_6DDB                          ; 6DD6   020B 0003

        MVO@    R0,     R4                      ; 6DD8   0260
        B       L_6DD5                          ; 6DD9   0220 0005

L_6DDB:
        PULR    R7                              ; 6DDB   02B7
        DECR    R0                              ; 6DDC   0010
        COMR    R0                              ; 6DDD   0018
        COMR    R0                              ; 6DDE   0018
        COMR    R6                              ; 6DDF   001E
        INCR    R7                              ; 6DE0   000F
        COMR    R4                              ; 6DE1   001C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE2   0000 0000 0000 0000
        DECLE   $0000                           ; 6DE6   0000
L_6DE7:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE7   0000 0000 0000 0000
        DECLE   $0000                           ; 6DEB   0000

        DECR    R0                              ; 6DEC   0010
        COMR    R0                              ; 6DED   0018
        COMR    R0                              ; 6DEE   0018
        COMR    R6                              ; 6DEF   001E
        INCR    R7                              ; 6DF0   000F
        COMR    R4                              ; 6DF1   001C
        DECLE   $0000                           ; 6DF2   0000

        INCR    R0                              ; 6DF3   0008
        INCR    R0                              ; 6DF4   0008
        INCR    R0                              ; 6DF5   0008
        INCR    R0                              ; 6DF6   0008
        INCR    R0                              ; 6DF7   0008
        INCR    R0                              ; 6DF8   0008
        DECLE   $0000,  $0000,  $0000           ; 6DF9   0000 0000 0000

        RSWD    R0                              ; 6DFC   0038
        SARC    R0,     2                       ; 6DFD   007C
        RLC     R0,     2                       ; 6DFE   0054
        RLC     R0,     2                       ; 6DFF   0054
        RLC     R0,     2                       ; 6E00   0054
        RSWD    R0                              ; 6E01   0038
        RSWD    R0                              ; 6E02   0038
        RLC     R0,     2                       ; 6E03   0054
        TSTR    R2                              ; 6E04   0092
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6E09   0000 0000 0000

        RSWD    R0                              ; 6E0C   0038
        SARC    R0,     2                       ; 6E0D   007C
        RLC     R0,     2                       ; 6E0E   0054
        RLC     R0,     2                       ; 6E0F   0054
        RLC     R0,     2                       ; 6E10   0054
        RSWD    R0                              ; 6E11   0038
        RSWD    R0                              ; 6E12   0038
        RLC     R0,     2                       ; 6E13   0054
        TSTR    R2                              ; 6E14   0092
        DECLE   $0000                           ; 6E15   0000

        DECR    R0                              ; 6E16   0010
        RSWD    R0                              ; 6E17   0038
        RSWD    R0                              ; 6E18   0038
        DECR    R0                              ; 6E19   0010
        DECR    R0                              ; 6E1A   0010
        DECR    R0                              ; 6E1B   0010
        RSWD    R0                              ; 6E1C   0038
        SARC    R0,     2                       ; 6E1D   007C
        RLC     R0,     2                       ; 6E1E   0054
        SARC    R0,     2                       ; 6E1F   007C
        RLC     R0,     2                       ; 6E20   0054
        RSWD    R0                              ; 6E21   0038
        RSWD    R0                              ; 6E22   0038
        RLC     R0,     2                       ; 6E23   0054
        TSTR    R2                              ; 6E24   0092
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6E29   0000 0000 0000

        DECR    R0                              ; 6E2C   0010
        DECR    R0                              ; 6E2D   0010
        RLC     R0,     2                       ; 6E2E   0054
        DECR    R0                              ; 6E2F   0010
        ADCR    R0                              ; 6E30   0028
        ADDR    R2,     R6                      ; 6E31   00D6
        ADCR    R0                              ; 6E32   0028
        DECR    R0                              ; 6E33   0010
        RLC     R0,     2                       ; 6E34   0054
        DECR    R0                              ; 6E35   0010
        DECR    R0                              ; 6E36   0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E37   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6E3B   0000 0000

        DECR    R0                              ; 6E3D   0010
        DECR    R0                              ; 6E3E   0010
        ADCR    R0                              ; 6E3F   0028
        DECR    R0                              ; 6E40   0010
        SAR     R0,     2                       ; 6E41   006C
        DECR    R0                              ; 6E42   0010
        ADCR    R0                              ; 6E43   0028
        DECR    R0                              ; 6E44   0010
        DECR    R0                              ; 6E45   0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E46   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6E4A   0000 0000

        RSWD    R4                              ; 6E4C   003C
        SLLC    R2,     1                       ; 6E4D   005A
        ADDR    R3,     R3                      ; 6E4E   00DB
        ADDR    R7,     R7                      ; 6E4F   00FF
        SARC    R2,     2                       ; 6E50   007E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6E59   0000 0000 0000

        RSWD    R6                              ; 6E5C   003E
        EIS                                     ; 6E5D   0002
        ADDR    R7,     R2                      ; 6E5E   00FA
        MOVR    R1,     R2                      ; 6E5F   008A
        MOVR    R1,     R2                      ; 6E60   008A
        MOVR    R5,     R2                      ; 6E61   00AA
        MOVR    R5,     R2                      ; 6E62   00AA
        MOVR    R1,     R2                      ; 6E63   008A
        MOVR    R1,     R0                      ; 6E64   0088
        ADDR    R7,     R0                      ; 6E65   00F8
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E66   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6E6A   0000 0000

        RSWD    R6                              ; 6E6C   003E
        EIS                                     ; 6E6D   0002
        ADDR    R7,     R2                      ; 6E6E   00FA
        ADDR    R7,     R2                      ; 6E6F   00FA
        ADDR    R7,     R2                      ; 6E70   00FA
        ADDR    R3,     R2                      ; 6E71   00DA
        ADDR    R3,     R2                      ; 6E72   00DA
        ADDR    R7,     R2                      ; 6E73   00FA
        ADDR    R7,     R0                      ; 6E74   00F8
        ADDR    R7,     R0                      ; 6E75   00F8
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E76   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6E7A   0000 0000

        RSWD    R6                              ; 6E7C   003E
        EIS                                     ; 6E7D   0002
        ADDR    R7,     R2                      ; 6E7E   00FA
        ADDR    R7,     R2                      ; 6E7F   00FA
        MOVR    R1,     R2                      ; 6E80   008A
        MOVR    R5,     R2                      ; 6E81   00AA
        MOVR    R1,     R2                      ; 6E82   008A
        MOVR    R1,     R2                      ; 6E83   008A
        ADDR    R7,     R0                      ; 6E84   00F8
        ADDR    R7,     R0                      ; 6E85   00F8
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E86   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E8A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E8E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E92   0000 0000 0000 0000

        DECR    R0                              ; 6E96   0010
        RSWD    R0                              ; 6E97   0038
        RSWD    R0                              ; 6E98   0038
        DECR    R0                              ; 6E99   0010
        DECR    R0                              ; 6E9A   0010
        DECR    R0                              ; 6E9B   0010
        NEGR    R0                              ; 6E9C   0020
        NEGR    R0                              ; 6E9D   0020
        ADDR    R7,     R0                      ; 6E9E   00F8
        NEGR    R0                              ; 6E9F   0020
        NEGR    R0                              ; 6EA0   0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6EA9   0000 0000 0000

        TSTR    R0                              ; 6EAC   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6EB1   0000 0000 0000
L_6EB4:
        PSHR    R5                              ; 6EB4   0275
        SDBD                                    ; 6EB5   0001
        MVII    #$6DFC, R4                      ; 6EB6   02BC 00FC 006D
        SDBD                                    ; 6EB9   0001
        MVII    #$38C0, R1                      ; 6EBA   02B9 00C0 0038
        MVII    #$0010, R0                      ; 6EBD   02B8 0010

        JSR     R5,     L_6FA2                  ; 6EBF   0004 016C 03A2

        SDBD                                    ; 6EC2   0001
        MVII    #$6E0C, R4                      ; 6EC3   02BC 000C 006E
        SDBD                                    ; 6EC6   0001
        MVII    #$38D0, R1                      ; 6EC7   02B9 00D0 0038
        MVII    #$0010, R0                      ; 6ECA   02B8 0010

        JSR     R5,     L_6FA2                  ; 6ECC   0004 016C 03A2

        SDBD                                    ; 6ECF   0001
        MVII    #$6E1C, R4                      ; 6ED0   02BC 001C 006E
        SDBD                                    ; 6ED3   0001
        MVII    #$38E0, R1                      ; 6ED4   02B9 00E0 0038
        MVII    #$0010, R0                      ; 6ED7   02B8 0010

        JSR     R5,     L_6FA2                  ; 6ED9   0004 016C 03A2

        SDBD                                    ; 6EDC   0001
        MVII    #$6E2C, R4                      ; 6EDD   02BC 002C 006E
        SDBD                                    ; 6EE0   0001
        MVII    #$38F0, R1                      ; 6EE1   02B9 00F0 0038
        MVII    #$0010, R0                      ; 6EE4   02B8 0010

        JSR     R5,     L_6FA2                  ; 6EE6   0004 016C 03A2

        SDBD                                    ; 6EE9   0001
        MVII    #$39E8, R4                      ; 6EEA   02BC 00E8 0039
        MVII    #$0008, R0                      ; 6EED   02B8 0008

        JSR     R5,     L_6F9A                  ; 6EEF   0004 016C 039A

        PULR    R7                              ; 6EF2   02B7
L_6EF3:
        PSHR    R5                              ; 6EF3   0275
        SDBD                                    ; 6EF4   0001
        MVII    #$6E8C, R4                      ; 6EF5   02BC 008C 006E
        SDBD                                    ; 6EF8   0001
        MVII    #$3990, R1                      ; 6EF9   02B9 0090 0039
        MVII    #$0010, R0                      ; 6EFC   02B8 0010

        JSR     R5,     L_6FA2                  ; 6EFE   0004 016C 03A2

        SDBD                                    ; 6F01   0001
        MVII    #$39A0, R4                      ; 6F02   02BC 00A0 0039
        MVII    #$0008, R0                      ; 6F05   02B8 0008

        JSR     R5,     L_6F9A                  ; 6F07   0004 016C 039A

        SDBD                                    ; 6F0A   0001
        MVII    #$6E5C, R4                      ; 6F0B   02BC 005C 006E
        SDBD                                    ; 6F0E   0001
        MVII    #$3970, R1                      ; 6F0F   02B9 0070 0039
        MVII    #$0010, R0                      ; 6F12   02B8 0010

        JSR     R5,     L_6FA2                  ; 6F14   0004 016C 03A2

        SDBD                                    ; 6F17   0001
        MVII    #$6E9C, R4                      ; 6F18   02BC 009C 006E
        SDBD                                    ; 6F1B   0001
        MVII    #$3960, R1                      ; 6F1C   02B9 0060 0039
        MVII    #$0010, R0                      ; 6F1F   02B8 0010

        JSR     R5,     L_6FA2                  ; 6F21   0004 016C 03A2

        SDBD                                    ; 6F24   0001
        MVII    #$6E4C, R4                      ; 6F25   02BC 004C 006E
        SDBD                                    ; 6F28   0001
        MVII    #$3980, R1                      ; 6F29   02B9 0080 0039
        MVII    #$0010, R0                      ; 6F2C   02B8 0010

        JSR     R5,     L_6FA2                  ; 6F2E   0004 016C 03A2

        SDBD                                    ; 6F31   0001
        MVII    #$6EAC, R4                      ; 6F32   02BC 00AC 006E
        SDBD                                    ; 6F35   0001
        MVII    #$3958, R1                      ; 6F36   02B9 0058 0039
        MVII    #$0008, R0                      ; 6F39   02B8 0008

        JSR     R5,     L_6FA2                  ; 6F3B   0004 016C 03A2

        PULR    R7                              ; 6F3E   02B7
L_6F3F:
        PSHR    R5                              ; 6F3F   0275
        MVI     G_035F, R3                      ; 6F40   0283 035F
        ANDI    #$00FF, R3                      ; 6F42   03BB 00FF
        SDBD                                    ; 6F44   0001
        ADDI    #$6E5C, R3                      ; 6F45   02FB 005C 006E
        MOVR    R3,     R4                      ; 6F48   009C
        SDBD                                    ; 6F49   0001
        MVII    #$3970, R1                      ; 6F4A   02B9 0070 0039

        JSR     R5,     L_6F86                  ; 6F4D   0004 016C 0386
        JSR     R5,     L_6F86                  ; 6F50   0004 016C 0386

        MVI     G_035F, R3                      ; 6F53   0283 035F
        SWAP    R3,     1                       ; 6F55   0043
        ANDI    #$007F, R3                      ; 6F56   03BB 007F
        SDBD                                    ; 6F58   0001
        ADDI    #$6E2C, R3                      ; 6F59   02FB 002C 006E
        MOVR    R3,     R4                      ; 6F5C   009C
        SDBD                                    ; 6F5D   0001
        MVII    #$38F0, R1                      ; 6F5E   02B9 00F0 0038

        JSR     R5,     L_6F86                  ; 6F61   0004 016C 0386
        JSR     R5,     L_6F86                  ; 6F64   0004 016C 0386

        MVI     G_035F, R0                      ; 6F67   0280 035F
        SDBD                                    ; 6F69   0001
        XORI    #$8000, R0                      ; 6F6A   03F8 0000 0080
        BMI     L_6F83                          ; 6F6D   020B 0014

        MOVR    R0,     R1                      ; 6F6F   0081
        ANDI    #$00FF, R1                      ; 6F70   03B9 00FF
        ADDI    #$0010, R1                      ; 6F72   02F9 0010
        CMPI    #$0021, R1                      ; 6F74   0379 0021
        BMI     L_6F79                          ; 6F76   020B 0001

        CLRR    R1                              ; 6F78   01C9
L_6F79:
        SWAP    R0,     1                       ; 6F79   0040
        ADDI    #$0010, R0                      ; 6F7A   02F8 0010
        CMPI    #$0011, R0                      ; 6F7C   0378 0011
        BMI     L_6F81                          ; 6F7E   020B 0001

        CLRR    R0                              ; 6F80   01C0
L_6F81:
        SWAP    R0,     1                       ; 6F81   0040
        ADDR    R1,     R0                      ; 6F82   00C8
L_6F83:
        MVO     R0,     G_035F                  ; 6F83   0240 035F
        PULR    R7                              ; 6F85   02B7
L_6F86:
        MOVR    R5,     R2                      ; 6F86   00AA
        MOVR    R1,     R5                      ; 6F87   008D
        MVI@    R4,     R0                      ; 6F88   02A0
        MVO@    R0,     R5                      ; 6F89   0268
        MVI@    R4,     R0                      ; 6F8A   02A0
        MVO@    R0,     R5                      ; 6F8B   0268
        MVI@    R4,     R0                      ; 6F8C   02A0
        MVO@    R0,     R5                      ; 6F8D   0268
        MVI@    R4,     R0                      ; 6F8E   02A0
        MVO@    R0,     R5                      ; 6F8F   0268
        MVI@    R4,     R0                      ; 6F90   02A0
        MVO@    R0,     R5                      ; 6F91   0268
        MVI@    R4,     R0                      ; 6F92   02A0
        MVO@    R0,     R5                      ; 6F93   0268
        MVI@    R4,     R0                      ; 6F94   02A0
        MVO@    R0,     R5                      ; 6F95   0268
        MVI@    R4,     R0                      ; 6F96   02A0
        MVO@    R0,     R5                      ; 6F97   0268
        MOVR    R5,     R1                      ; 6F98   00A9
        MOVR    R2,     R7                      ; 6F99   0097
L_6F9A:
        CLRR    R1                              ; 6F9A   01C9
L_6F9B:
        DECR    R0                              ; 6F9B   0010
        BMI     L_6FA1                          ; 6F9C   020B 0003

        MVO@    R1,     R4                      ; 6F9E   0261
        B       L_6F9B                          ; 6F9F   0220 0005

L_6FA1:
        MOVR    R5,     R7                      ; 6FA1   00AF
L_6FA2:
        PSHR    R5                              ; 6FA2   0275
        MOVR    R1,     R5                      ; 6FA3   008D
L_6FA4:
        MVI@    R4,     R1                      ; 6FA4   02A1
        MVO@    R1,     R5                      ; 6FA5   0269
L_6FA6:
        DECR    R0                              ; 6FA6   0010
        BNEQ    L_6FA4                          ; 6FA7   022C 0004

        PULR    R7                              ; 6FA9   02B7
L_6FAA:
        PSHR    R5                              ; 6FAA   0275
        MOVR    R2,     R5                      ; 6FAB   0095
        MOVR    R0,     R2                      ; 6FAC   0082
        MOVR    R5,     R0                      ; 6FAD   00A8
L_6FAE:
        PSHR    R1                              ; 6FAE   0271
        DECR    R0                              ; 6FAF   0010
        PSHR    R3                              ; 6FB0   0273
        CLRR    R3                              ; 6FB1   01DB
        MVII    #$000A, R1                      ; 6FB2   02B9 000A
        PSHR    R4                              ; 6FB4   0274

        JSR     R5,     G_7FC5                  ; 6FB5   0004 017C 03C5

        PULR    R4                              ; 6FB8   02B4
        ADDI    #$0010, R3                      ; 6FB9   02FB 0010
        SLL     R3,     2                       ; 6FBB   004F
        SLL     R3,     1                       ; 6FBC   004B
        PULR    R5                              ; 6FBD   02B5
        PULR    R1                              ; 6FBE   02B1
        XORR    R5,     R3                      ; 6FBF   01EB
        MVO@    R3,     R1                      ; 6FC0   024B
        DECR    R1                              ; 6FC1   0011
        MOVR    R5,     R3                      ; 6FC2   00AB
        TSTR    R2                              ; 6FC3   0092
        BNEQ    L_6FAE                          ; 6FC4   022C 0017

        TSTR    R0                              ; 6FC6   0080
        BEQ     L_6FCE                          ; 6FC7   0204 0005

L_6FC9:
        MVO@    R4,     R1                      ; 6FC9   024C
        DECR    R1                              ; 6FCA   0011
        DECR    R0                              ; 6FCB   0010
        BNEQ    L_6FC9                          ; 6FCC   022C 0004

L_6FCE:
        PULR    R7                              ; 6FCE   02B7
        DECLE   $0217                           ; 6FCF   0217

        TSTR    R0                              ; 6FD0   0080
        BEQ     G_70D3                          ; 6FD1   0204 0100

        DECLE   $0000,  $0000,  $0000           ; 6FD3   0000 0000 0000

        ADDR    R3,     R1                      ; 6FD6   00D9
        XORI    #$03FF, R7                      ; 6FD7   03FF 03FF
        DECLE   $0000                           ; 6FD9   0000

        XORI    #$0000, R7                      ; 6FDA   03FF 0000
        XORI    #$0000, R7                      ; 6FDC   03FF 0000
        XORI    #$0000, R7                      ; 6FDE   03FF 0000
        SLL     R0,     1                       ; 6FE0   0048
        XORI    #$0021, R7                      ; 6FE1   03FF 0021
        XORI    #$0009, R6                      ; 6FE3   03FE 0009
        XORI    #$0210, R7                      ; 6FE5   03FF 0210
        XORI    #$03FF, R7                      ; 6FE7   03FF 03FF
        DECLE   $0000                           ; 6FE9   0000

        XORI    #$0000, R7                      ; 6FEA   03FF 0000
        XORI    #$0000, R7                      ; 6FEC   03FF 0000
        XORI    #$0000, R7                      ; 6FEE   03FF 0000
        RRC     R1,     2                       ; 6FF0   0075
        XORI    #$007E, R7                      ; 6FF1   03FF 007E
        XORI    #$0035, R7                      ; 6FF3   03FF 0035
        SUB     G_00E9, R0                      ; 6FF5   0300 00E9
        XORI    #$03FF, R7                      ; 6FF7   03FF 03FF
        DECLE   $0000                           ; 6FF9   0000

        XORI    #$0000, R7                      ; 6FFA   03FF 0000
        XORI    #$0000, R7                      ; 6FFC   03FF 0000
        XORI    #$0000, R7                      ; 6FFE   03FF 0000

        ORG     $D000
        DIS                                     ; D000   0003
        MVII    #$02F1, R6                      ; D001   02BE 02F1
        MVII    #$0100, R4                      ; D003   02BC 0100
        MVII    #$00F0, R0                      ; D005   02B8 00F0

        JSR     R5,     L_6F9A                  ; D007   0004 016C 039A

        MVII    #$0200, R4                      ; D00A   02BC 0200
        MVII    #$0160, R0                      ; D00C   02B8 0160

        JSR     R5,     L_6F9A                  ; D00E   0004 016C 039A

        SDBD                                    ; D011   0001
        ADDI    #$AAAA, R3                      ; D012   02FB 00AA 00AA
        MVO     R3,     G_0346                  ; D015   0243 0346

        JSR     R5,     G_7264                  ; D017   0004 0170 0264
        JSR     R5,     G_71FB                  ; D01A   0004 0170 01FB
        JSR     R5,     L_5290                  ; D01D   0004 0150 0290

        SUBR    R0,     R0                      ; D020   0100
L_D021:
        DIS                                     ; D021   0003
        MVI     G_0181, R2                      ; D022   0282 0181
        MVI     G_0347, R3                      ; D024   0283 0347
        MVI     G_0346, R6                      ; D026   0286 0346
        MVII    #$0100, R4                      ; D028   02BC 0100
        MVII    #$00F0, R0                      ; D02A   02B8 00F0

        JSR     R5,     L_6F9A                  ; D02C   0004 016C 039A

        MVII    #$0200, R4                      ; D02F   02BC 0200
        MVII    #$0160, R0                      ; D031   02B8 0160

        JSR     R5,     L_6F9A                  ; D033   0004 016C 039A

        MVO     R2,     G_0181                  ; D036   0242 0181
        MVO     R3,     G_0347                  ; D038   0243 0347
        MVO     R6,     G_0346                  ; D03A   0246 0346
        MVII    #$02F1, R6                      ; D03C   02BE 02F1
        MVII    #$0010, R0                      ; D03E   02B8 0010
        MVO     R0,     G_017B                  ; D040   0240 017B
        MVII    #$0001, R0                      ; D042   02B8 0001
        MVO     R0,     G_014C                  ; D044   0240 014C
        MVII    #$0002, R0                      ; D046   02B8 0002
        MVO     R0,     G_0182                  ; D048   0240 0182
        MVII    #$0003, R0                      ; D04A   02B8 0003
        MVO     R0,     G_0183                  ; D04C   0240 0183
        MVI     G_0347, R0                      ; D04E   0280 0347
        CMPI    #$00FF, R0                      ; D050   0378 00FF
        BMI     L_D062                          ; D052   020B 000E

        MVII    #$007F, R1                      ; D054   02B9 007F
        MVO     R1,     G_0182                  ; D056   0241 0182
        MVO     R1,     G_0183                  ; D058   0241 0183
        CMPI    #$01FF, R0                      ; D05A   0378 01FF
        BEQ     L_D062                          ; D05C   0204 0004

        MVII    #$0001, R1                      ; D05E   02B9 0001
        MVO     R1,     G_014E                  ; D060   0241 014E
L_D062:
        SDBD                                    ; D062   0001
        MVII    #$70C8, R0                      ; D063   02B8 00C8 0070
        MVII    #$0100, R5                      ; D066   02BD 0100
        MVO@    R0,     R5                      ; D068   0268
        SWAP    R0,     1                       ; D069   0040
        MVO@    R0,     R5                      ; D06A   0268
L_D06B:
        EIS                                     ; D06B   0002
        MVI     G_014A, R0                      ; D06C   0280 014A
        CMPI    #$0004, R0                      ; D06E   0378 0004
        BNEQ    L_D06B                          ; D070   022C 0006

        MVII    #$00FF, R0                      ; D072   02B8 00FF
        MVO     R0,     G_014F                  ; D074   0240 014F
        CLRR    R1                              ; D076   01C9

        JSR     R5,     L_5DBF                  ; D077   0004 015C 01BF

L_D07A:
        EIS                                     ; D07A   0002
        CLRR    R0                              ; D07B   01C0
        MVO     R0,     G_014A                  ; D07C   0240 014A
        INCR    R0                              ; D07E   0008
        MVO     R0,     G_014B                  ; D07F   0240 014B

        JSR     R5,     L_6453                  ; D081   0004 0164 0053
        JSR     R5,     G_72CB                  ; D084   0004 0170 02CB

L_D087:
        EIS                                     ; D087   0002
        MVI     G_014A, R0                      ; D088   0280 014A
        TSTR    R0                              ; D08A   0080
        BEQ     L_D087                          ; D08B   0224 0005

        MVI     G_0184, R0                      ; D08D   0280 0184
        DECR    R0                              ; D08F   0010
        BMI     L_D094                          ; D090   020B 0002

        MVO     R0,     G_0184                  ; D092   0240 0184

L_D094:
        JSR     R5,     L_57A1                  ; D094   0004 0154 03A1
        JSR     R5,     L_5A1A                  ; D097   0004 0158 021A
        JSR     R5,     G_77EF                  ; D09A   0004 0174 03EF
        JSR     R5,     G_727E                  ; D09D   0004 0170 027E

        MVI     G_0342, R0                      ; D0A0   0280 0342
        MVO     R0,     G_0310                  ; D0A2   0240 0310
        CLRR    R0                              ; D0A4   01C0
        MVO     R0,     G_014B                  ; D0A5   0240 014B

        JSR     R5,     L_59B5                  ; D0A7   0004 0158 01B5
        JSR     R5,     L_5BD5                  ; D0AA   0004 0158 03D5

        MVI     G_0341, R0                      ; D0AD   0280 0341
        INCR    R0                              ; D0AF   0008
        MVO     R0,     G_0341                  ; D0B0   0240 0341
L_D0B2:
        EIS                                     ; D0B2   0002
        MVI     G_014A, R0                      ; D0B3   0280 014A
        CMPI    #$0004, R0                      ; D0B5   0378 0004
        BEQ     L_D07A                          ; D0B7   0224 003E
        B       L_D0B2                          ; D0B9   0220 0008

        PSHR    R5                              ; D0BB   0275
        MVI     G_014A, R1                      ; D0BC   0281 014A
        SDBD                                    ; D0BE   0001
        ADDI    #$70C3, R1                      ; D0BF   02F9 00C3 0070
        ADD@    R1,     R7                      ; D0C2   02CF
        TSTR    R5                              ; D0C3   00AD
        ADCR    R7                              ; D0C4   002F
        SLL     R3,     2                       ; D0C5   004F
        MOVR    R0,     R5                      ; D0C6   0085
        MOVR    R0,     R1                      ; D0C7   0081
        DIS                                     ; D0C8   0003
        PSHR    R5                              ; D0C9   0275

        JSR     R5,     G_7252                  ; D0CA   0004 0170 0252
        JSR     R5,     G_7264                  ; D0CD   0004 0170 0264
        JSR     R5,     L_6D45                  ; D0D0   0004 016C 0145
        JSR     R5,     L_6EB4                  ; D0D3   0004 016C 02B4
        JSR     R5,     L_6EF3                  ; D0D6   0004 016C 02F3
        JSR     R5,     L_62BA                  ; D0D9   0004 0160 02BA
        JSR     R5,     G_787C                  ; D0DC   0004 0178 007C
        JSR     R5,     L_525A                  ; D0DF   0004 0150 025A

        MVII    #$0004, R0                      ; D0E2   02B8 0004
        MVO     R0,     G_014A                  ; D0E4   0240 014A
        SDBD                                    ; D0E6   0001
        MVII    #$70BB, R0                      ; D0E7   02B8 00BB 0070
        MVII    #$0100, R5                      ; D0EA   02BD 0100
        MVO@    R0,     R5                      ; D0EC   0268
        SWAP    R0,     1                       ; D0ED   0040
        MVO@    R0,     R5                      ; D0EE   0268
        MVO     R0,     .STIC.VIDEN             ; D0EF   0240 0020
        PULR    R7                              ; D0F1   02B7
        MVO     R0,     .STIC.VIDEN             ; D0F2   0240 0020

        JSR     R5,     L_525A                  ; D0F4   0004 0150 025A
        JSR     R5,     L_68A4                  ; D0F7   0004 0168 00A4

        SDBD                                    ; D0FA   0001
        MVII    #$71C3, R0                      ; D0FB   02B8 00C3 0071
        MVO     R0,     .ISRVEC.0               ; D0FE   0240 0100
        SWAP    R0,     1                       ; D100   0040
        MVO     R0,     .ISRVEC.1               ; D101   0240 0101

        JSR     R5,     L_507B                  ; D103   0004 0150 007B

        MVII    #$0001, R0                      ; D106   02B8 0001
        MVO     R0,     G_01AE                  ; D108   0240 01AE

        JSR     R5,     L_681D                  ; D10A   0004 0168 001D
        JSR     R5,     L_55DC                  ; D10D   0004 0154 01DC

        B       L_D129                          ; D110   0200 0017

        MVO     R0,     .STIC.VIDEN             ; D112   0240 0020

        JSR     R5,     L_525A                  ; D114   0004 0150 025A
        JSR     R5,     L_68C1                  ; D117   0004 0168 00C1

        SDBD                                    ; D11A   0001
        MVII    #$71C3, R0                      ; D11B   02B8 00C3 0071
        MVO     R0,     .ISRVEC.0               ; D11E   0240 0100
        SWAP    R0,     1                       ; D120   0040
        MVO     R0,     .ISRVEC.1               ; D121   0240 0101

        JSR     R5,     L_507B                  ; D123   0004 0150 007B
        JSR     R5,     L_61C2                  ; D126   0004 0160 01C2

L_D129:
        MVI     G_014A, R0                      ; D129   0280 014A
        INCR    R0                              ; D12B   0008
        MVO     R0,     G_014A                  ; D12C   0240 014A

L_D12E:
        JSR     R5,     G_757E                  ; D12E   0004 0174 017E

        DECR    R6                              ; D131   0016
        PULR    R5                              ; D132   02B5
        PULR    R4                              ; D133   02B4
        PULR    R3                              ; D134   02B3
        PULR    R2                              ; D135   02B2
        PULR    R1                              ; D136   02B1
        SDBD                                    ; D137   0001
        MVII    #$70BB, R0                      ; D138   02B8 00BB 0070
        MVO     R0,     .ISRVEC.0               ; D13B   0240 0100
        SWAP    R0,     1                       ; D13D   0040
        MVO     R0,     .ISRVEC.1               ; D13E   0240 0101
        PULR    R0                              ; D140   02B0
        RSWD    R0                              ; D141   0038
        PULR    R0                              ; D142   02B0
        PULR    R7                              ; D143   02B7
L_D144:
        MVO     R0,     .STIC.VIDEN             ; D144   0240 0020
        B       L_D12E                          ; D146   0220 0019

        MVI     G_014B, R1                      ; D148   0281 014B
        TSTR    R1                              ; D14A   0089
        BNEQ    L_D144                          ; D14B   022C 0008

        JSR     R5,     G_71C6                  ; D14D   0004 0170 01C6

        MVO     R0,     .STIC.VIDEN             ; D150   0240 0020

        JSR     R5,     L_525A                  ; D152   0004 0150 025A
        JSR     R5,     L_6432                  ; D155   0004 0164 0032

        SDBD                                    ; D158   0001
        MVII    #$71C3, R0                      ; D159   02B8 00C3 0071
        MVO     R0,     .ISRVEC.0               ; D15C   0240 0100
        SWAP    R0,     1                       ; D15E   0040
        MVO     R0,     .ISRVEC.1               ; D15F   0240 0101
        MVI     G_0342, R0                      ; D161   0280 0342
        MVO     R0,     G_0343                  ; D163   0240 0343

        JSR     R5,     L_507B                  ; D165   0004 0150 007B
        JSR     R5,     L_61C2                  ; D168   0004 0160 01C2
        JSR     R5,     L_55DC                  ; D16B   0004 0154 01DC

        B       L_D129                          ; D16E   0220 0046

        JSR     R5,     L_5777                  ; D170   0004 0154 0377
        JSR     R5,     G_7271                  ; D173   0004 0170 0271

        MVO     R0,     .STIC.VIDEN             ; D176   0240 0020

        JSR     R5,     L_525A                  ; D178   0004 0150 025A

        MVI     G_0340, R4                      ; D17B   0284 0340
        SDBD                                    ; D17D   0001
        MVII    #$39F0, R5                      ; D17E   02BD 00F0 0039
        MVI@    R4,     R0                      ; D181   02A0
        MVO@    R0,     R5                      ; D182   0268
        MVI@    R4,     R0                      ; D183   02A0
        MVO@    R0,     R5                      ; D184   0268
        MVI@    R4,     R0                      ; D185   02A0
        MVO@    R0,     R5                      ; D186   0268
        MVI@    R4,     R0                      ; D187   02A0
        MVO@    R0,     R5                      ; D188   0268
        MVI@    R4,     R0                      ; D189   02A0
        MVO@    R0,     R5                      ; D18A   0268
        MVI@    R4,     R0                      ; D18B   02A0
        MVO@    R0,     R5                      ; D18C   0268
        MVI@    R4,     R0                      ; D18D   02A0
        MVO@    R0,     R5                      ; D18E   0268
        MVI@    R4,     R0                      ; D18F   02A0
        MVO@    R0,     R5                      ; D190   0268
        MVI@    R4,     R0                      ; D191   02A0
        MVO@    R0,     R5                      ; D192   0268
        MVI@    R4,     R0                      ; D193   02A0
        MVO@    R0,     R5                      ; D194   0268
        MVI@    R4,     R0                      ; D195   02A0
        MVO@    R0,     R5                      ; D196   0268
        MVI@    R4,     R0                      ; D197   02A0
        MVO@    R0,     R5                      ; D198   0268
        MVI@    R4,     R0                      ; D199   02A0
        MVO@    R0,     R5                      ; D19A   0268
        MVI@    R4,     R0                      ; D19B   02A0
        MVO@    R0,     R5                      ; D19C   0268
        MVI@    R4,     R0                      ; D19D   02A0
        MVO@    R0,     R5                      ; D19E   0268
        MVI@    R4,     R0                      ; D19F   02A0
        MVO@    R0,     R5                      ; D1A0   0268

        JSR     R5,     L_6F3F                  ; D1A1   0004 016C 033F

        SDBD                                    ; D1A4   0001
        MVII    #$71C3, R0                      ; D1A5   02B8 00C3 0071
        MVO     R0,     .ISRVEC.0               ; D1A8   0240 0100
        SWAP    R0,     1                       ; D1AA   0040
        MVO     R0,     .ISRVEC.1               ; D1AB   0240 0101

        JSR     R5,     L_507B                  ; D1AD   0004 0150 007B

        CLRR    R0                              ; D1B0   01C0
        MVO     R0,     G_01AE                  ; D1B1   0240 01AE
        MVI     G_014C, R0                      ; D1B3   0280 014C
        SLL     R0,     1                       ; D1B5   0048
        CMPI    #$0010, R0                      ; D1B6   0378 0010
        BMI     L_D1BC                          ; D1B8   020B 0002

        MVII    #$0001, R0                      ; D1BA   02B8 0001
L_D1BC:
        MVO     R0,     G_014C                  ; D1BC   0240 014C

        JSR     R5,     L_681D                  ; D1BE   0004 0168 001D

        B       L_D129                          ; D1C1   0220 0099

        MVO     R0,     .STIC.VIDEN             ; D1C3   0240 0020
        MOVR    R5,     R7                      ; D1C5   00AF
        PSHR    R5                              ; D1C6   0275
        MVII    #$0310, R4                      ; D1C7   02BC 0310
        CLRR    R5                              ; D1C9   01ED
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
        MVI@    R4,     R1                      ; D1D8   02A1
        MVO@    R1,     R5                      ; D1D9   0269
        MVI@    R4,     R1                      ; D1DA   02A1
        MVO@    R1,     R5                      ; D1DB   0269
        MVI@    R4,     R1                      ; D1DC   02A1
        MVO@    R1,     R5                      ; D1DD   0269
        MVI@    R4,     R1                      ; D1DE   02A1
        MVO@    R1,     R5                      ; D1DF   0269
        MVI@    R4,     R1                      ; D1E0   02A1
        MVO@    R1,     R5                      ; D1E1   0269
        MVI@    R4,     R1                      ; D1E2   02A1
        MVO@    R1,     R5                      ; D1E3   0269
        MVI@    R4,     R1                      ; D1E4   02A1
        MVO@    R1,     R5                      ; D1E5   0269
        MVI@    R4,     R1                      ; D1E6   02A1
        MVO@    R1,     R5                      ; D1E7   0269
        MVI@    R4,     R1                      ; D1E8   02A1
        MVO@    R1,     R5                      ; D1E9   0269
        MVI@    R4,     R1                      ; D1EA   02A1
        MVO@    R1,     R5                      ; D1EB   0269
        MVI@    R4,     R1                      ; D1EC   02A1
        MVO@    R1,     R5                      ; D1ED   0269
        MVI@    R4,     R1                      ; D1EE   02A1
        MVO@    R1,     R5                      ; D1EF   0269
        MVI@    R4,     R1                      ; D1F0   02A1
        MVO@    R1,     R5                      ; D1F1   0269
        MVI@    R4,     R1                      ; D1F2   02A1
        MVO@    R1,     R5                      ; D1F3   0269
        MVI@    R4,     R1                      ; D1F4   02A1
        MVO@    R1,     R5                      ; D1F5   0269
        MVI@    R4,     R1                      ; D1F6   02A1
        MVO@    R1,     R5                      ; D1F7   0269
        MVI@    R4,     R1                      ; D1F8   02A1
        MVO@    R1,     R5                      ; D1F9   0269
        PULR    R7                              ; D1FA   02B7
        MVII    #$01FE, R1                      ; D1FB   02B9 01FE
        MVI@    R1,     R0                      ; D1FD   0288
        TSTR    R0                              ; D1FE   0080
        BNEQ    L_D24A                          ; D1FF   020C 0049

        MVII    #$0008, R0                      ; D201   02B8 0008
        MVII    #$0206, R1                      ; D203   02B9 0206
        SDBD                                    ; D205   0001
        MVII    #$724B, R4                      ; D206   02BC 004B 0072

        JSR     R5,     L_6FA2                  ; D209   0004 016C 03A2

        MVII    #$000C, R0                      ; D20C   02B8 000C
        MVII    #$022C, R1                      ; D20E   02B9 022C
        SDBD                                    ; D210   0001
        MVII    #$724C, R4                      ; D211   02BC 004C 0072

        JSR     R5,     L_6FA2                  ; D214   0004 016C 03A2

        MVII    #$003C, R0                      ; D217   02B8 003C
        MVII    #$0250, R1                      ; D219   02B9 0250
        SDBD                                    ; D21B   0001
        MVII    #$724D, R4                      ; D21C   02BC 004D 0072

        JSR     R5,     L_6FA2                  ; D21F   0004 016C 03A2

        MVII    #$0001, R0                      ; D222   02B8 0001
        MVO     R0,     G_0347                  ; D224   0240 0347
        SDBD                                    ; D226   0001
        MVII    #$723D, R0                      ; D227   02B8 003D 0072
        MVII    #$0100, R5                      ; D22A   02BD 0100
        MVO@    R0,     R5                      ; D22C   0268
        SWAP    R0,     1                       ; D22D   0040
        MVO@    R0,     R5                      ; D22E   0268
L_D22F:
        EIS                                     ; D22F   0002
        MVI     G_0347, R0                      ; D230   0280 0347
        TSTR    R0                              ; D232   0080
        BNEQ    L_D22F                          ; D233   022C 0005

        MVII    #$01FF, R0                      ; D235   02B8 01FF
        MVO     R0,     G_0347                  ; D237   0240 0347
        MVO     R0,     G_0181                  ; D239   0240 0181
        B       L_D021                          ; D23B   0220 021B

        MVO     R0,     .STIC.VIDEN             ; D23D   0240 0020
        MVII    #$01FF, R1                      ; D23F   02B9 01FF
        MVI@    R1,     R0                      ; D241   0288
        CMPI    #$00FF, R0                      ; D242   0378 00FF
        BEQ     L_D249                          ; D244   0204 0003

        CLRR    R0                              ; D246   01C0
        MVO     R0,     G_0347                  ; D247   0240 0347
L_D249:
        MOVR    R5,     R7                      ; D249   00AF
L_D24A:
        MOVR    R5,     R7                      ; D24A   00AF
        INCR    R2                              ; D24B   000A
        INCR    R2                              ; D24C   000A
        DECLE   $0000                           ; D24D   0000

        ANDR    R0,     R1                      ; D24E   0181
        SUBR    R4,     R1                      ; D24F   0121
        SUBR    R6,     R1                      ; D250   0131
        DECLE   $0000                           ; D251   0000

        PSHR    R5                              ; D252   0275
        CLRR    R0                              ; D253   01C0
        MVI     .STIC.MODE,R3                   ; D254   0283 0021
        MVO     R0,     .STIC.BORD              ; D256   0240 002C
        MVII    #$0030, R5                      ; D258   02BD 0030
        MVO@    R0,     R5                      ; D25A   0268
        MVO@    R0,     R5                      ; D25B   0268
        MVO@    R0,     R5                      ; D25C   0268
        CLRR    R4                              ; D25D   01E4
        MVII    #$0020, R0                      ; D25E   02B8 0020

        JSR     R5,     L_6F9A                  ; D260   0004 016C 039A

        PULR    R7                              ; D263   02B7
        PSHR    R5                              ; D264   0275
        MVII    #$01F0, R4                      ; D265   02BC 01F0
        MVII    #$000E, R0                      ; D267   02B8 000E

        JSR     R5,     L_6F9A                  ; D269   0004 016C 039A

        MVII    #$003F, R0                      ; D26C   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; D26E   0240 01F8
        PULR    R7                              ; D270   02B7
        PSHR    R5                              ; D271   0275
        MVI     .STIC.MODE,R0                   ; D272   0280 0021
        CLRR    R0                              ; D274   01C0
        MVO     R0,     .STIC.BORD              ; D275   0240 002C
        MVII    #$0028, R5                      ; D277   02BD 0028
        MVO@    R0,     R5                      ; D279   0268
        MVO@    R0,     R5                      ; D27A   0268
        MVO@    R0,     R5                      ; D27B   0268
        MVO@    R0,     R5                      ; D27C   0268
        PULR    R7                              ; D27D   02B7
        PSHR    R5                              ; D27E   0275
        MVI     G_0342, R0                      ; D27F   0280 0342
        ANDI    #$00FF, R0                      ; D281   03B8 00FF
        SAR     R0,     2                       ; D283   006C
        SAR     R0,     2                       ; D284   006C
        PSHR    R0                              ; D285   0270
        SAR     R0,     1                       ; D286   0068
        ADD@    R6,     R0                      ; D287   02F0
        PSHR    R0                              ; D288   0270
        SAR     R0,     2                       ; D289   006C
        SAR     R0,     2                       ; D28A   006C
        ADD@    R6,     R0                      ; D28B   02F0
        SLR     R0,     1                       ; D28C   0060
        ADDI    #$027A, R0                      ; D28D   02F8 027A
        MVO     R0,     G_0311                  ; D28F   0240 0311
        MVI     G_0318, R0                      ; D291   0280 0318
        ANDI    #$007F, R0                      ; D293   03B8 007F
        SLR     R0,     2                       ; D295   0064
        ADDI    #$007F, R0                      ; D296   02F8 007F
        MVO     R0,     G_0319                  ; D298   0240 0319
        SDBD                                    ; D29A   0001
        MVII    #$0967, R0                      ; D29B   02B8 0067 0009
        MVO     R0,     G_0321                  ; D29E   0240 0321
        PULR    R7                              ; D2A0   02B7
        PSHR    R5                              ; D2A1   0275
        SDBD                                    ; D2A2   0001
        MVII    #$0720, R0                      ; D2A3   02B8 0020 0007
        MVO     R0,     G_0310                  ; D2A6   0240 0310
        MVO     R0,     G_0342                  ; D2A8   0240 0342
        MVO     R0,     G_0343                  ; D2AA   0240 0343
        MVII    #$00C8, R0                      ; D2AC   02B8 00C8
        MVO     R0,     G_0318                  ; D2AE   0240 0318
        SDBD                                    ; D2B0   0001
        MVII    #$09F1, R0                      ; D2B1   02B8 00F1 0009
        MVO     R0,     G_0320                  ; D2B4   0240 0320
        CLRR    R0                              ; D2B6   01C0
        MVO     R0,     G_0151                  ; D2B7   0240 0151
        INCR    R0                              ; D2B9   0008
        MVO     R0,     G_0150                  ; D2BA   0240 0150
        SDBD                                    ; D2BC   0001
        MVII    #$6DDC, R0                      ; D2BD   02B8 00DC 006D
        MVO     R0,     G_0340                  ; D2C0   0240 0340
        MVII    #$0002, R0                      ; D2C2   02B8 0002
        MVO     R0,     G_0152                  ; D2C4   0240 0152
        MVII    #$0003, R0                      ; D2C6   02B8 0003
        MVO     R0,     G_0154                  ; D2C8   0240 0154
        PULR    R7                              ; D2CA   02B7
        PSHR    R5                              ; D2CB   0275
        MVI     G_0184, R1                      ; D2CC   0281 0184
        TSTR    R1                              ; D2CE   0089
        BNEQ    L_D330                          ; D2CF   020C 005F

        JSR     R5,     G_7471                  ; D2D1   0004 0174 0071

        MVI     G_017A, R1                      ; D2D4   0281 017A
        CMPI    #$00FF, R1                      ; D2D6   0379 00FF
        BEQ     L_D308                          ; D2D8   0204 002E

        CMPI    #$0080, R1                      ; D2DA   0379 0080
        BMI     L_D2E5                          ; D2DC   020B 0007

        MVI     G_0152, R0                      ; D2DE   0280 0152
        DECR    R0                              ; D2E0   0010
        MVO     R0,     G_0152                  ; D2E1   0240 0152
        B       L_D330                          ; D2E3   0200 004B

L_D2E5:
        MVII    #$0002, R0                      ; D2E5   02B8 0002
        MVO     R0,     G_0152                  ; D2E7   0240 0152
        MVI     G_0150, R0                      ; D2E9   0280 0150
        SLL     R0,     2                       ; D2EB   004C
        SLL     R0,     2                       ; D2EC   004C
        ADDR    R0,     R1                      ; D2ED   00C1
        SDBD                                    ; D2EE   0001
        ADDI    #$74C4, R1                      ; D2EF   02F9 00C4 0074
        MVI@    R1,     R1                      ; D2F2   0289
        MOVR    R1,     R0                      ; D2F3   0088
        ANDI    #$0003, R0                      ; D2F4   03B8 0003
        BEQ     L_D2FB                          ; D2F6   0204 0003

        JSR     R5,     G_7444                  ; D2F8   0004 0174 0044

L_D2FB:
        SLR     R1,     2                       ; D2FB   0065
        ANDI    #$0003, R1                      ; D2FC   03B9 0003
        BEQ     L_D308                          ; D2FE   0204 0008

        SLR     R1,     1                       ; D300   0061
        ANDI    #$0001, R1                      ; D301   03B9 0001

        JSR     R5,     G_7338                  ; D303   0004 0170 0338

        B       L_D30B                          ; D306   0200 0003

L_D308:
        JSR     R5,     G_73DE                  ; D308   0004 0170 03DE
L_D30B:
        JSR     R5,     G_7412                  ; D30B   0004 0174 0012

        MVI     G_0179, R0                      ; D30E   0280 0179
        ANDI    #$0006, R0                      ; D310   03B8 0006
        BEQ     L_D319                          ; D312   0204 0005

        JSR     R5,     L_6162                  ; D314   0004 0160 0162

        B       L_D31D                          ; D317   0200 0004

L_D319:
        MVII    #$0003, R5                      ; D319   02BD 0003
        MVO     R5,     G_0154                  ; D31B   0245 0154
L_D31D:
        MVI     G_0179, R0                      ; D31D   0280 0179
        ANDI    #$0001, R0                      ; D31F   03B8 0001
        MOVR    R0,     R1                      ; D321   0081
        XOR     G_018A, R0                      ; D322   03C0 018A
        BEQ     L_D330                          ; D324   0204 000A

        TSTR    R1                              ; D326   0089
        BEQ     L_D334                          ; D327   0204 000B

        JSR     R5,     L_5BA9                  ; D329   0004 0158 03A9

        MVII    #$0001, R0                      ; D32C   02B8 0001
        MVO     R0,     G_018A                  ; D32E   0240 018A

L_D330:
        JSR     R5,     L_68CD                  ; D330   0004 0168 00CD

        PULR    R7                              ; D333   02B7
L_D334:
        MVO     R1,     G_018A                  ; D334   0241 018A
        B       L_D330                          ; D336   0220 0007

        PSHR    R5                              ; D338   0275
        CMP     G_0150, R1                      ; D339   0341 0150
        BNEQ    L_D36E                          ; D33B   020C 0031

        CLRR    R4                              ; D33D   01E4
        MVI     G_0151, R0                      ; D33E   0280 0151
        TSTR    R0                              ; D340   0080
        BEQ     L_D34B                          ; D341   0204 0008

        MVI     G_0150, R1                      ; D343   0281 0150
        MVII    #$0020, R4                      ; D345   02BC 0020
        TSTR    R1                              ; D347   0089
        BEQ     L_D34B                          ; D348   0204 0001

        NEGR    R4                              ; D34A   0024
L_D34B:
        MVI     G_0348, R2                      ; D34B   0282 0348
        ADDR    R4,     R2                      ; D34D   00E2
        MVII    #$0004, R3                      ; D34E   02BB 0004
        TSTR    R1                              ; D350   0089
        BNEQ    L_D354                          ; D351   020C 0001

        NEGR    R3                              ; D353   0023
L_D354:
        ADDR    R3,     R2                      ; D354   00DA
        MOVR    R2,     R3                      ; D355   0093
        BPL     L_D359                          ; D356   0203 0001

        NEGR    R3                              ; D358   0023
L_D359:
        CMPI    #$0032, R3                      ; D359   037B 0032
        BPL     L_D360                          ; D35B   0203 0003

        SUBR    R4,     R2                      ; D35D   0122
        MVO     R2,     G_0348                  ; D35E   0242 0348
L_D360:
        MVI     G_014F, R0                      ; D360   0280 014F
        CMPI    #$00FF, R0                      ; D362   0378 00FF
        BNEQ    L_D36D                          ; D364   020C 0007

        MVII    #$0001, R1                      ; D366   02B9 0001

        JSR     R5,     L_5DBF                  ; D368   0004 015C 01BF

        MVO     R0,     G_014F                  ; D36B   0240 014F
L_D36D:
        PULR    R7                              ; D36D   02B7
L_D36E:
        MVII    #$0006, R1                      ; D36E   02B9 0006
        MVO     R1,     G_0153                  ; D370   0241 0153
        MVI     G_0150, R1                      ; D372   0281 0150
        TSTR    R1                              ; D374   0089
        BEQ     L_D3AC                          ; D375   0204 0035

        SDBD                                    ; D377   0001
        MVII    #$8000, R2                      ; D378   02BA 0000 0080
        MVI     G_0342, R3                      ; D37B   0283 0342
        SWAP    R3,     1                       ; D37D   0043
        SDBD                                    ; D37E   0001
        ANDI    #$FFF8, R3                      ; D37F   03BB 00F8 00FF
        SUBR    R3,     R2                      ; D382   011A
        BMI     L_D391                          ; D383   020B 000C

        CLRR    R3                              ; D385   01DB
        SDBD                                    ; D386   0001
        MVII    #$0800, R1                      ; D387   02B9 0000 0008

        JSR     R5,     G_7FC5                  ; D38A   0004 017C 03C5

        MVI     G_0151, R1                      ; D38D   0281 0151
        MVO     R2,     G_0151                  ; D38F   0242 0151
L_D391:
        CLRR    R0                              ; D391   01C0
        MVO     R0,     G_0150                  ; D392   0240 0150
        MVI     G_0318, R0                      ; D394   0280 0318
        SDBD                                    ; D396   0001
        ANDI    #$FBFF, R0                      ; D397   03B8 00FF 00FB
        SDBD                                    ; D39A   0001
        XORI    #$0400, R0                      ; D39B   03F8 0000 0004
        MVO     R0,     G_0318                  ; D39E   0240 0318
        MVI     G_0348, R0                      ; D3A0   0280 0348
        MVII    #$0020, R2                      ; D3A2   02BA 0020
        TSTR    R1                              ; D3A4   0089
        BEQ     L_D3A8                          ; D3A5   0204 0001

        ADDR    R2,     R2                      ; D3A7   00D2
L_D3A8:
        SUBR    R2,     R0                      ; D3A8   0110
        MVO     R0,     G_0348                  ; D3A9   0240 0348
        PULR    R7                              ; D3AB   02B7
L_D3AC:
        SDBD                                    ; D3AC   0001
        MVII    #$2000, R3                      ; D3AD   02BB 0000 0020
        MVI     G_0342, R2                      ; D3B0   0282 0342
        SWAP    R2,     1                       ; D3B2   0042
        SDBD                                    ; D3B3   0001
        ANDI    #$FFF8, R2                      ; D3B4   03BA 00F8 00FF
        SUBR    R3,     R2                      ; D3B7   011A
        BMI     L_D3C6                          ; D3B8   020B 000C

        CLRR    R3                              ; D3BA   01DB
        SDBD                                    ; D3BB   0001
        MVII    #$0800, R1                      ; D3BC   02B9 0000 0008

        JSR     R5,     G_7FC5                  ; D3BF   0004 017C 03C5

        MVI     G_0151, R1                      ; D3C2   0281 0151
        MVO     R2,     G_0151                  ; D3C4   0242 0151
L_D3C6:
        MVII    #$0001, R0                      ; D3C6   02B8 0001
        MVO     R0,     G_0150                  ; D3C8   0240 0150
        MVI     G_0318, R0                      ; D3CA   0280 0318
        SDBD                                    ; D3CC   0001
        ANDI    #$FBFF, R0                      ; D3CD   03B8 00FF 00FB
        MVO     R0,     G_0318                  ; D3D0   0240 0318
        MVI     G_0348, R0                      ; D3D2   0280 0348
        MVII    #$0020, R2                      ; D3D4   02BA 0020
        TSTR    R1                              ; D3D6   0089
        BEQ     L_D3DA                          ; D3D7   0204 0001

        ADDR    R2,     R2                      ; D3D9   00D2
L_D3DA:
        ADDR    R2,     R0                      ; D3DA   00D0
        MVO     R0,     G_0348                  ; D3DB   0240 0348
        PULR    R7                              ; D3DD   02B7
        PSHR    R5                              ; D3DE   0275
        MVI     G_0348, R0                      ; D3DF   0280 0348
        CLRR    R2                              ; D3E1   01D2
        MVI     G_0151, R1                      ; D3E2   0281 0151
        TSTR    R1                              ; D3E4   0089
        BEQ     L_D3F0                          ; D3E5   0204 0009

        MVI     G_0150, R1                      ; D3E7   0281 0150
        MVII    #$0020, R2                      ; D3E9   02BA 0020
        TSTR    R1                              ; D3EB   0089
        BEQ     L_D3EF                          ; D3EC   0204 0001

        NEGR    R2                              ; D3EE   0022
L_D3EF:
        ADDR    R2,     R0                      ; D3EF   00D0
L_D3F0:
        TSTR    R0                              ; D3F0   0080
        BMI     L_D3FC                          ; D3F1   020B 0009

        SUBI    #$0004, R0                      ; D3F3   0338 0004
        BMI     L_D405                          ; D3F5   020B 000E

        SUBR    R2,     R0                      ; D3F7   0110
        MVO     R0,     G_0348                  ; D3F8   0240 0348
        B       L_D408                          ; D3FA   0200 000C

L_D3FC:
        ADDI    #$0004, R0                      ; D3FC   02F8 0004
        BPL     L_D405                          ; D3FE   0203 0005

        SUBR    R2,     R0                      ; D400   0110
        MVO     R0,     G_0348                  ; D401   0240 0348
        B       L_D408                          ; D403   0200 0003

L_D405:
        NEGR    R2                              ; D405   0022
        MVO     R2,     G_0348                  ; D406   0242 0348
L_D408:
        MVI     G_014F, R1                      ; D408   0281 014F
        CMPI    #$00FF, R1                      ; D40A   0379 00FF
        BEQ     L_D411                          ; D40C   0204 0003

        JSR     R5,     G_753D                  ; D40E   0004 0174 013D

L_D411:
        PULR    R7                              ; D411   02B7
        PSHR    R5                              ; D412   0275
        MVI     G_0151, R1                      ; D413   0281 0151
        DECR    R1                              ; D415   0011
        BMI     L_D443                          ; D416   020B 002B

        MVO     R1,     G_0151                  ; D418   0241 0151
        MVI     G_0342, R0                      ; D41A   0280 0342
        SWAP    R0,     1                       ; D41C   0040
        MVI     G_0150, R1                      ; D41D   0281 0150
        TSTR    R1                              ; D41F   0089
        BEQ     L_D42B                          ; D420   0204 0009

        SDBD                                    ; D422   0001
        SUBI    #$0800, R0                      ; D423   0338 0000 0008
        SWAP    R0,     1                       ; D426   0040
        MVO     R0,     G_0342                  ; D427   0240 0342
        B       L_D432                          ; D429   0200 0007

L_D42B:
        SDBD                                    ; D42B   0001
        ADDI    #$0800, R0                      ; D42C   02F8 0000 0008
        SWAP    R0,     1                       ; D42F   0040
        MVO     R0,     G_0342                  ; D430   0240 0342
L_D432:
        MVI     G_0151, R0                      ; D432   0280 0151
        TSTR    R0                              ; D434   0080
        BNEQ    L_D443                          ; D435   020C 000C

        MVII    #$0020, R0                      ; D437   02B8 0020
        MVI     G_0150, R1                      ; D439   0281 0150
        TSTR    R1                              ; D43B   0089
        BEQ     L_D43F                          ; D43C   0204 0001

        NEGR    R0                              ; D43E   0020
L_D43F:
        ADD     G_0348, R0                      ; D43F   02C0 0348
        MVO     R0,     G_0348                  ; D441   0240 0348
L_D443:
        PULR    R7                              ; D443   02B7
        PSHR    R5                              ; D444   0275
        ANDI    #$0002, R0                      ; D445   03B8 0002
        BEQ     L_D45D                          ; D447   0204 0014

        MVI     G_0318, R0                      ; D449   0280 0318
        SWAP    R0,     1                       ; D44B   0040
        MOVR    R0,     R2                      ; D44C   0082
        SDBD                                    ; D44D   0001
        ANDI    #$7FF0, R2                      ; D44E   03BA 00F0 007F
        SDBD                                    ; D451   0001
        CMPI    #$6000, R2                      ; D452   037A 0000 0060
        BPL     L_D470                          ; D455   0203 0019

        ADDI    #$0200, R0                      ; D457   02F8 0200
        SWAP    R0,     1                       ; D459   0040
        MVO     R0,     G_0318                  ; D45A   0240 0318
        PULR    R7                              ; D45C   02B7
L_D45D:
        MVI     G_0318, R0                      ; D45D   0280 0318
        SWAP    R0,     1                       ; D45F   0040
        MOVR    R0,     R2                      ; D460   0082
        SDBD                                    ; D461   0001
        ANDI    #$7FF0, R2                      ; D462   03BA 00F0 007F
        SDBD                                    ; D465   0001
        CMPI    #$2000, R2                      ; D466   037A 0000 0020
        BMI     L_D470                          ; D469   020B 0005

        SUBI    #$0200, R0                      ; D46B   0338 0200
        SWAP    R0,     1                       ; D46D   0040
        MVO     R0,     G_0318                  ; D46E   0240 0318
L_D470:
        PULR    R7                              ; D470   02B7
        PSHR    R5                              ; D471   0275
        MVI     G_014D, R0                      ; D472   0280 014D
        TSTR    R0                              ; D474   0080
        BEQ     L_D4C3                          ; D475   0204 004C

        MVI     G_0318, R1                      ; D477   0281 0318
        ANDI    #$007F, R1                      ; D479   03B9 007F
        CMPI    #$0060, R1                      ; D47B   0379 0060
        BMI     L_D4C3                          ; D47D   020B 0044

        MVI     G_0342, R1                      ; D47F   0281 0342
        ANDI    #$00FF, R1                      ; D481   03B9 00FF
        SUBI    #$0004, R1                      ; D483   0339 0004
        SLR     R1,     2                       ; D485   0065
        SLR     R1,     1                       ; D486   0061
        MOVR    R1,     R2                      ; D487   008A
        ADDI    #$02DC, R2                      ; D488   02FA 02DC
        MVI@    R2,     R3                      ; D48A   0293
        TSTR    R3                              ; D48B   009B
        BNEQ    L_D4C3                          ; D48C   020C 0035

        DECR    R0                              ; D48E   0010
        MVO     R0,     G_014D                  ; D48F   0240 014D
        BNEQ    L_D499                          ; D491   020C 0006

        SDBD                                    ; D493   0001
        MVII    #$6DDC, R0                      ; D494   02B8 00DC 006D
        MVO     R0,     G_0340                  ; D497   0240 0340
L_D499:
        SDBD                                    ; D499   0001
L_D49A:
        MVII    #$09ED, R5                      ; D49A   02BD 00ED 0009
        MVO@    R5,     R2                      ; D49D   0255
        ADD     G_016E, R1                      ; D49E   02C1 016E
        CMPI    #$00A0, R1                      ; D4A0   0379 00A0
        BMI     L_D4A6                          ; D4A2   020B 0002

        SUBI    #$00A0, R1                      ; D4A4   0339 00A0
L_D4A6:
        MVII    #$0001, R2                      ; D4A6   02BA 0001
        MVII    #$016F, R3                      ; D4A8   02BB 016F
L_D4AA:
        MVI@    R3,     R4                      ; D4AA   029C
        CMPI    #$00FF, R4                      ; D4AB   037C 00FF
        BEQ     L_D4B7                          ; D4AD   0204 0008

        SLL     R2,     1                       ; D4AF   004A
        INCR    R3                              ; D4B0   000B
        CMPI    #$0100, R2                      ; D4B1   037A 0100
        BNEQ    L_D4AA                          ; D4B3   022C 000A
        B       L_D4C3                          ; D4B5   0200 000C

L_D4B7:
        MVO@    R1,     R3                      ; D4B7   0259
        MVI     G_0354, R5                      ; D4B8   0285 0354
L_D4BA:
        ADDI    #$0014, R5                      ; D4BA   02FD 0014
        MVO     R5,     G_0354                  ; D4BC   0245 0354
        MVII    #$000A, R1                      ; D4BE   02B9 000A

        JSR     R5,     L_5DBF                  ; D4C0   0004 015C 01BF

L_D4C3:
        PULR    R7                              ; D4C3   02B7
        DECLE   $0001,  $0005,  $0005           ; D4C4   0001 0005 0005

        JSR     R4,     G_0404                  ; D4C7   0004 0004 0004

        CLRC                                    ; D4CA   0006
        CLRC                                    ; D4CB   0006
        EIS                                     ; D4CC   0002
        EIS                                     ; D4CD   0002
        EIS                                     ; D4CE   0002
        INCR    R0                              ; D4CF   0008
        INCR    R0                              ; D4D0   0008
        INCR    R0                              ; D4D1   0008
        DECLE   $0001,  $0001,  $0001,  $0001   ; D4D2   0001 0001 0001 0001
        DECLE   $0001                           ; D4D6   0001

        JSR     R4,     G_0404                  ; D4D7   0004 0004 0004

        EIS                                     ; D4DA   0002
        EIS                                     ; D4DB   0002
        EIS                                     ; D4DC   0002
L_D4DD:
        INCR    R2                              ; D4DD   000A
        INCR    R2                              ; D4DE   000A
        INCR    R0                              ; D4DF   0008
        INCR    R0                              ; D4E0   0008
        INCR    R0                              ; D4E1   0008
        INCR    R1                              ; D4E2   0009
        INCR    R1                              ; D4E3   0009
        DECLE   $0001                           ; D4E4   0001

        PSHR    R4                              ; D4E5   0274
        CLRR    R0                              ; D4E6   01C0
        MVO     R0,     G_0168                  ; D4E7   0240 0168
        MVI@    R5,     R0                      ; D4E9   02A8
        PSHR    R5                              ; D4EA   0275
        MOVR    R0,     R1                      ; D4EB   0081
        SLR     R1,     2                       ; D4EC   0065
        SLR     R1,     1                       ; D4ED   0061
        ANDI    #$0007, R0                      ; D4EE   03B8 0007
        MVII    #$0164, R4                      ; D4F0   02BC 0164
L_D4F2:
        MVI@    R4,     R2                      ; D4F2   02A2
        MOVR    R2,     R3                      ; D4F3   0093
        SLR     R3,     2                       ; D4F4   0067
        SLR     R3,     1                       ; D4F5   0063
        ANDR    R0,     R2                      ; D4F6   0182
        BEQ     L_D4FF                          ; D4F7   0204 0006

        CMP     G_0168, R3                      ; D4F9   0343 0168
        BLE     L_D4FF                          ; D4FB   0206 0002

        MVO     R3,     G_0168                  ; D4FD   0243 0168
L_D4FF:
        CMPI    #$0167, R4                      ; D4FF   037C 0167
        BLT     L_D4F2                          ; D501   0225 0010

        CMP     G_0168, R1                      ; D503   0341 0168
        BLT     L_D525                          ; D505   0205 001E

        MVII    #$0164, R4                      ; D507   02BC 0164
        CLRR    R1                              ; D509   01C9
L_D50A:
        MVI@    R4,     R2                      ; D50A   02A2
        MOVR    R0,     R5                      ; D50B   0085
        ANDR    R2,     R5                      ; D50C   0195
        BEQ     L_D512                          ; D50D   0204 0003

        JSR     R5,     G_753D                  ; D50F   0004 0174 013D

L_D512:
        INCR    R1                              ; D512   0009
        CMPI    #$0167, R4                      ; D513   037C 0167
        BLT     L_D50A                          ; D515   0225 000C

        MVII    #$0164, R4                      ; D517   02BC 0164
        MVI@    R4,     R2                      ; D519   02A2
        TSTR    R2                              ; D51A   0092
        BEQ     L_D529                          ; D51B   0204 000C

        MVI@    R4,     R2                      ; D51D   02A2
        TSTR    R2                              ; D51E   0092
        BEQ     L_D529                          ; D51F   0204 0008

        MVI@    R4,     R2                      ; D521   02A2
        TSTR    R2                              ; D522   0092
        BEQ     L_D529                          ; D523   0204 0004

L_D525:
        CLRR    R0                              ; D525   01C0
        COMR    R0                              ; D526   0018
        DECR    R6                              ; D527   0016
        PULR    R7                              ; D528   02B7
L_D529:
        DECR    R4                              ; D529   0014
        PULR    R5                              ; D52A   02B5
        DECR    R5                              ; D52B   0015
        MVI@    R5,     R0                      ; D52C   02A8
        MVO@    R0,     R4                      ; D52D   0260
        DECR    R4                              ; D52E   0014
        SUBI    #$0164, R4                      ; D52F   033C 0164
        MOVR    R4,     R0                      ; D531   00A0
        MOVR    R4,     R3                      ; D532   00A3
        SLL     R3,     1                       ; D533   004B
        ADDR    R3,     R4                      ; D534   00DC
        ADDI    #$0155, R4                      ; D535   02FC 0155
        INCR    R4                              ; D537   000C
        MOVR    R5,     R1                      ; D538   00A9
        MVO@    R1,     R4                      ; D539   0261
        SWAP    R1,     1                       ; D53A   0041
        MVO@    R1,     R4                      ; D53B   0261
        PULR    R7                              ; D53C   02B7
        PSHR    R5                              ; D53D   0275
        PSHR    R1                              ; D53E   0271
        ADDI    #$0164, R1                      ; D53F   02F9 0164
        PSHR    R1                              ; D541   0271
        MVI@    R1,     R2                      ; D542   028A
        CMPI    #$000C, R2                      ; D543   037A 000C
        BNEQ    L_D54B                          ; D545   020C 0004

        MVII    #$00FF, R3                      ; D547   02BB 00FF
        MVO     R3,     G_014F                  ; D549   0243 014F
L_D54B:
        ANDI    #$0007, R2                      ; D54B   03BA 0007
        MOVR    R2,     R5                      ; D54D   0095
        SLL     R2,     2                       ; D54E   004E
        SLL     R2,     1                       ; D54F   004A
        XORR    R5,     R2                      ; D550   01EA
        MOVR    R2,     R5                      ; D551   0095
        CLRR    R1                              ; D552   01C9
        MVII    #$0001, R3                      ; D553   02BB 0001
        MVO     R3,     G_0163                  ; D555   0243 0163
        MVI     .PSG0.chan_enable,R3            ; D557   0283 01F8
        COMR    R5                              ; D559   001D
        ANDR    R5,     R3                      ; D55A   01AB
        XORR    R2,     R3                      ; D55B   01D3
        MVO     R3,     .PSG0.chan_enable       ; D55C   0243 01F8
        MVO     R1,     G_0163                  ; D55E   0241 0163
        MVII    #$01FB, R3                      ; D560   02BB 01FB
        RRC     R2,     1                       ; D562   0072
        BNC     L_D566                          ; D563   0209 0001

        MVO@    R1,     R3                      ; D565   0259
L_D566:
        INCR    R3                              ; D566   000B
        RRC     R2,     1                       ; D567   0072
        BNC     L_D56B                          ; D568   0209 0001

        MVO@    R1,     R3                      ; D56A   0259
L_D56B:
        INCR    R3                              ; D56B   000B
        RRC     R2,     1                       ; D56C   0072
        BNC     L_D570                          ; D56D   0209 0001

        MVO@    R1,     R3                      ; D56F   0259
L_D570:
        PULR    R5                              ; D570   02B5
        MVO@    R1,     R5                      ; D571   0269
        PULR    R5                              ; D572   02B5
        PSHR    R5                              ; D573   0275
        MOVR    R5,     R3                      ; D574   00AB
        SLL     R3,     1                       ; D575   004B
        ADDR    R3,     R5                      ; D576   00DD
        ADDI    #$0155, R5                      ; D577   02FD 0155
        MVO@    R1,     R5                      ; D579   0269
        MVO@    R1,     R5                      ; D57A   0269
        MVO@    R1,     R5                      ; D57B   0269
        PULR    R1                              ; D57C   02B1
        PULR    R7                              ; D57D   02B7
        PSHR    R5                              ; D57E   0275
        MVII    #$00FF, R0                      ; D57F   02B8 00FF
        MVO     R0,     G_0167                  ; D581   0240 0167
        MVII    #$0155, R4                      ; D583   02BC 0155
L_D585:
        CMPI    #$015C, R4                      ; D585   037C 015C
        BLT     L_D58A                          ; D587   0205 0001

        PULR    R7                              ; D589   02B7
L_D58A:
        MVI     G_0167, R0                      ; D58A   0280 0167
        INCR    R0                              ; D58C   0008
        MVO     R0,     G_0167                  ; D58D   0240 0167
        MVI@    R4,     R0                      ; D58F   02A0
        TSTR    R0                              ; D590   0080
        BLE     L_D59A                          ; D591   0206 0007

        DECR    R0                              ; D593   0010
        DECR    R4                              ; D594   0014
        MVO@    R0,     R4                      ; D595   0260
        ADDI    #$0002, R4                      ; D596   02FC 0002
        B       L_D585                          ; D598   0220 0014

L_D59A:
        SDBD                                    ; D59A   0001
        MVI@    R4,     R5                      ; D59B   02A5
        TSTR    R5                              ; D59C   00AD
        BEQ     L_D585                          ; D59D   0224 0019

L_D59F:
        SDBD                                    ; D59F   0001
        MVI@    R5,     R1                      ; D5A0   02A9
        MOVR    R1,     R3                      ; D5A1   008B
        SLR     R1,     2                       ; D5A2   0065
        SLR     R1,     2                       ; D5A3   0065
        MOVR    R1,     R2                      ; D5A4   008A
        ANDI    #$000F, R3                      ; D5A5   03BB 000F
        SDBD                                    ; D5A7   0001
        ADDI    #$75B1, R3                      ; D5A8   02FB 00B1 0075
        MVI@    R3,     R3                      ; D5AB   029B
        SDBD                                    ; D5AC   0001
        ADDI    #$75BD, R3                      ; D5AD   02FB 00BD 0075
        MOVR    R3,     R7                      ; D5B0   009F
        DECLE   $0000,  $0035                   ; D5B1   0000 0035

        ADCR    R4                              ; D5B3   002C
        RSWD    R5                              ; D5B4   003D
        SLR     R0,     1                       ; D5B5   0060
        SARC    R2,     1                       ; D5B6   007A
        MOVR    R1,     R0                      ; D5B7   0088
        MOVR    R2,     R3                      ; D5B8   0093
        MOVR    R3,     R2                      ; D5B9   009A
        MOVR    R4,     R2                      ; D5BA   00A2
        ADDR    R0,     R2                      ; D5BB   00C2
        ADDR    R2,     R3                      ; D5BC   00D3
        ANDI    #$0003, R2                      ; D5BD   03BA 0003
        MOVR    R2,     R3                      ; D5BF   0093
        ADDI    #$01FB, R2                      ; D5C0   02FA 01FB
        SLR     R1,     2                       ; D5C2   0065
        MOVR    R1,     R0                      ; D5C3   0088
        ANDI    #$0007, R0                      ; D5C4   03B8 0007
        ADDI    #$0007, R0                      ; D5C6   02F8 0007
        MVO@    R0,     R2                      ; D5C8   0250
        SLR     R1,     2                       ; D5C9   0065
        SLR     R1,     1                       ; D5CA   0061
        MOVR    R1,     R0                      ; D5CB   0088
        ANDI    #$0007, R0                      ; D5CC   03B8 0007
        SLR     R1,     2                       ; D5CE   0065
        SLR     R1,     1                       ; D5CF   0061
        SLL     R1,     1                       ; D5D0   0049
        MOVR    R4,     R2                      ; D5D1   00A2
        MOVR    R1,     R4                      ; D5D2   008C
        SDBD                                    ; D5D3   0001
        ADDI    #$76AC, R4                      ; D5D4   02FC 00AC 0076
        SDBD                                    ; D5D7   0001
        MVI@    R4,     R1                      ; D5D8   02A1
        MOVR    R2,     R4                      ; D5D9   0094
L_D5DA:
        DECR    R0                              ; D5DA   0010
        BLT     L_D5E0                          ; D5DB   0205 0003

        SLR     R1,     1                       ; D5DD   0061
        B       L_D5DA                          ; D5DE   0220 0005

L_D5E0:
        ADDI    #$01F0, R3                      ; D5E0   02FB 01F0
        MVO@    R1,     R3                      ; D5E2   0259
        SWAP    R1,     1                       ; D5E3   0041
        ADDI    #$0004, R3                      ; D5E4   02FB 0004
        MVO@    R1,     R3                      ; D5E6   0259
        B       L_D59F                          ; D5E7   0220 0049

        SUBI    #$0003, R4                      ; D5E9   033C 0003
        MVO@    R1,     R4                      ; D5EB   0261
L_D5EC:
        MOVR    R5,     R0                      ; D5EC   00A8
        MVO@    R0,     R4                      ; D5ED   0260
        SWAP    R0,     1                       ; D5EE   0040
        MVO@    R0,     R4                      ; D5EF   0260
        B       L_D585                          ; D5F0   0220 006C

        ANDI    #$0003, R1                      ; D5F2   03B9 0003
        ADDI    #$01FB, R1                      ; D5F4   02F9 01FB
        SLR     R2,     2                       ; D5F6   0066
        MVO@    R2,     R1                      ; D5F7   024A
        B       L_D59F                          ; D5F8   0220 005A

        ANDI    #$0007, R2                      ; D5FA   03BA 0007
        ADDI    #$01F3, R2                      ; D5FC   02FA 01F3
        SLR     R1,     2                       ; D5FE   0065
        SLR     R1,     1                       ; D5FF   0061
        CLRC                                    ; D600   0006
        RRC     R1,     1                       ; D601   0071
        BNC     L_D61A                          ; D602   0209 0016

        MOVR    R1,     R3                      ; D604   008B
        CMPI    #$01F8, R2                      ; D605   037A 01F8
        BNEQ    L_D617                          ; D607   020C 000E

        MVI     G_0163, R0                      ; D609   0280 0163
        TSTR    R0                              ; D60B   0080
        BEQ     L_D614                          ; D60C   0204 0006

        SUBI    #$0002, R4                      ; D60E   033C 0002
        SUBI    #$0002, R5                      ; D610   033D 0002
        B       L_D5EC                          ; D612   0220 0027

L_D614:
        AND@    R2,     R1                      ; D614   0391
        B       L_D61A                          ; D615   0200 0003

L_D617:
        COMR    R1                              ; D617   0019
        AND@    R2,     R1                      ; D618   0391
        XORR    R3,     R1                      ; D619   01D9
L_D61A:
        MVO@    R1,     R2                      ; D61A   0251
        B       L_D59F                          ; D61B   0220 007D

        MOVR    R2,     R3                      ; D61D   0093
        SLR     R2,     2                       ; D61E   0066
        MOVR    R2,     R1                      ; D61F   0091
        SLR     R1,     2                       ; D620   0065
        SLR     R1,     1                       ; D621   0061
        ANDI    #$0007, R2                      ; D622   03BA 0007
        ADDI    #$015E, R2                      ; D624   02FA 015E
        ANDI    #$0003, R3                      ; D626   03BB 0003
        BEQ     L_D634                          ; D628   0204 000A

        CMPI    #$0001, R3                      ; D62A   037B 0001
        BGT     L_D631                          ; D62C   020E 0003

        ADD@    R2,     R1                      ; D62E   02D1
        B       L_D634                          ; D62F   0200 0003

L_D631:
        MVI@    R2,     R0                      ; D631   0290
        SUBR    R1,     R0                      ; D632   0108
        MOVR    R0,     R1                      ; D633   0081
L_D634:
        MVO@    R1,     R2                      ; D634   0251
        B       L_D59F                          ; D635   0220 0097

        SLR     R1,     2                       ; D637   0065
        ANDI    #$0003, R2                      ; D638   03BA 0003
        ADDI    #$015E, R2                      ; D63A   02FA 015E
        MVI@    R2,     R0                      ; D63C   0290
        DECR    R0                              ; D63D   0010
        BNEQ    L_D643                          ; D63E   020C 0003

        MVO@    R0,     R2                      ; D640   0250
        B       L_D59F                          ; D641   0220 00A3

L_D643:
        MVO@    R0,     R2                      ; D643   0250
        MOVR    R1,     R2                      ; D644   008A
        SWAP    R2,     1                       ; D645   0042
        RRC     R2,     2                       ; D646   0076
        BNOV    L_D64D                          ; D647   020A 0004

        SDBD                                    ; D649   0001
        XORI    #$FC00, R1                      ; D64A   03F9 0000 00FC
L_D64D:
        ADDR    R1,     R5                      ; D64D   00CD
        B       L_D59F                          ; D64E   0220 00B0

        MVI     G_0167, R1                      ; D650   0281 0167

        JSR     R5,     G_753D                  ; D652   0004 0174 013D

        B       L_D585                          ; D655   0220 00D1

        ANDI    #$0003, R2                      ; D657   03BA 0003
L_D659:
        ADDI    #$01FB, R2                      ; D659   02FA 01FB
        SLR     R1,     2                       ; D65B   0065
        MVO@    R1,     R2                      ; D65C   0251
        B       L_D59F                          ; D65D   0220 00BF

        SDBD                                    ; D65F   0001
        MVI@    R5,     R0                      ; D660   02A8
        CLRC                                    ; D661   0006
        RRC     R0,     1                       ; D662   0070
        BNC     L_D66A                          ; D663   0209 0005

        MOVR    R0,     R1                      ; D665   0081
        ADDI    #$01F0, R1                      ; D666   02F9 01F0
        B       L_D678                          ; D668   0200 000E

L_D66A:
        MOVR    R0,     R1                      ; D66A   0081
        ANDI    #$000F, R0                      ; D66B   03B8 000F
        SLR     R1,     2                       ; D66D   0065
        SLR     R1,     2                       ; D66E   0065
        ADDI    #$01FB, R1                      ; D66F   02F9 01FB
        MVI@    R1,     R3                      ; D671   028B
        ANDI    #$0030, R3                      ; D672   03BB 0030
        XORR    R3,     R0                      ; D674   01D8
        MVO@    R0,     R1                      ; D675   0248
        SUBI    #$000B, R1                      ; D676   0339 000B
L_D678:
        MVO@    R2,     R1                      ; D678   024A
        ADDI    #$0004, R1                      ; D679   02F9 0004
        SWAP    R2,     1                       ; D67B   0042
        MVO@    R2,     R1                      ; D67C   024A
        B       L_D59F                          ; D67D   0220 00DF

        SDBD                                    ; D67F   0001
        MVI@    R5,     R2                      ; D680   02AA
        MOVR    R1,     R0                      ; D681   0088
        SLR     R0,     2                       ; D682   0064
        SLR     R0,     1                       ; D683   0060
        MOVR    R5,     R3                      ; D684   00AB
        MOVR    R2,     R5                      ; D685   0095
        SDBD                                    ; D686   0001
        MVI@    R5,     R2                      ; D687   02AA
        MOVR    R3,     R5                      ; D688   009D
        ANDI    #$0007, R1                      ; D689   03B9 0007
        ADDI    #$015E, R1                      ; D68B   02F9 015E
        ADD@    R1,     R2                      ; D68D   02CA
        B       L_D66A                          ; D68E   0220 0025

        SDBD                                    ; D690   0001
        MVI@    R5,     R3                      ; D691   02AB
        SLR     R1,     2                       ; D692   0065
        ANDI    #$0003, R2                      ; D693   03BA 0003
        BEQ     L_D6A6                          ; D695   0204 000F

        MOVR    R5,     R0                      ; D697   00A8
        MOVR    R3,     R5                      ; D698   009D
        CMPI    #$0001, R2                      ; D699   037A 0001
        BGT     L_D6A1                          ; D69B   020E 0004

        SDBD                                    ; D69D   0001
        ADD@    R5,     R1                      ; D69E   02E9
        B       L_D6A5                          ; D69F   0200 0004

L_D6A1:
        SDBD                                    ; D6A1   0001
        MVI@    R5,     R2                      ; D6A2   02AA
        SUBR    R1,     R2                      ; D6A3   010A
        MOVR    R2,     R1                      ; D6A4   0091
L_D6A5:
        MOVR    R0,     R5                      ; D6A5   0085
L_D6A6:
        MVO@    R1,     R3                      ; D6A6   0259
        SWAP    R1,     1                       ; D6A7   0041
        INCR    R3                              ; D6A8   000B
        MVO@    R1,     R3                      ; D6A9   0259
        B       L_D59F                          ; D6AA   0220 010C

        SLLC    R1,     2                       ; D6AC   005D
        INCR    R5                              ; D6AD   000D
        MOVR    R3,     R4                      ; D6AE   009C
        INCR    R4                              ; D6AF   000C
        ADDR    R4,     R7                      ; D6B0   00E7
        INCR    R3                              ; D6B1   000B
        RSWD    R4                              ; D6B2   003C
        INCR    R3                              ; D6B3   000B
        TSTR    R3                              ; D6B4   009B
        INCR    R2                              ; D6B5   000A
        EIS                                     ; D6B6   0002
        INCR    R2                              ; D6B7   000A
        RRC     R3,     1                       ; D6B8   0073
        INCR    R1                              ; D6B9   0009
        ADDR    R5,     R3                      ; D6BA   00EB
        INCR    R0                              ; D6BB   0008
        SAR     R3,     1                       ; D6BC   006B
        INCR    R0                              ; D6BD   0008
        ADDR    R6,     R2                      ; D6BE   00F2
        SETC                                    ; D6BF   0007
        TSTR    R0                              ; D6C0   0080
        SETC                                    ; D6C1   0007
        DECR    R4                              ; D6C2   0014
        SETC                                    ; D6C3   0007
        PSHR    R5                              ; D6C4   0275

        JSR     R5,     L_5D74                  ; D6C5   0004 015C 0174

        SDBD                                    ; D6C8   0001
        ADDI    #$76D3, R2                      ; D6C9   02FA 00D3 0076

        JSR     R5,     G_7FE2                  ; D6CC   0004 017C 03E2

        AND@    R2,     R5                      ; D6CF   0395
        BEQ     L_D6D8                          ; D6D0   0204 0006

        PULR    R7                              ; D6D2   02B7
        XOR@    R6,     R0                      ; D6D3   03F0
        XOR@    R4,     R0                      ; D6D4   03E0
        XOR     G_0380, R0                      ; D6D5   03C0 0380
        PSHR    R5                              ; D6D7   0275
L_D6D8:
        MVII    #$0102, R4                      ; D6D8   02BC 0102
        ADDI    #$0046, R4                      ; D6DA   02FC 0046
        CLRR    R5                              ; D6DC   01ED
        CMP@    R4,     R5                      ; D6DD   0365
        BEQ     L_D6E3                          ; D6DE   0204 0003

L_D6E0:
        CMP@    R4,     R5                      ; D6E0   0365
        BNEQ    L_D73F                          ; D6E1   020C 005C

L_D6E3:
        PSHR    R3                              ; D6E3   0273
        PSHR    R4                              ; D6E4   0274

        JSR     R5,     L_5DBF                  ; D6E5   0004 015C 01BF

        PULR    R4                              ; D6E8   02B4
        PULR    R3                              ; D6E9   02B3

        JSR     R5,     G_78FD                  ; D6EA   0004 0178 00FD

        ADDI    #$0040, R1                      ; D6ED   02F9 0040
        SLR     R1,     1                       ; D6EF   0061
        MOVR    R1,     R2                      ; D6F0   008A
        ANDI    #$00F0, R2                      ; D6F1   03BA 00F0
        ADDI    #$0002, R2                      ; D6F3   02FA 0002
        SUBI    #$0031, R4                      ; D6F5   033C 0031
        MVO@    R2,     R4                      ; D6F7   0262
        ADDI    #$0017, R4                      ; D6F8   02FC 0017
        MOVR    R1,     R2                      ; D6FA   008A
        SLL     R2,     2                       ; D6FB   004E
        SLL     R2,     2                       ; D6FC   004E
        MVO@    R2,     R4                      ; D6FD   0262
        SUBI    #$00E0, R0                      ; D6FE   0338 00E0
        MOVR    R0,     R5                      ; D700   0085
        SLL     R0,     2                       ; D701   004C
        ADDR    R5,     R0                      ; D702   00E8
        SLR     R0,     1                       ; D703   0060
        PSHR    R0                              ; D704   0270

        JSR     R5,     G_7FE2                  ; D705   0004 017C 03E2

L_D708:
        ANDI    #$0003, R5                      ; D708   03BD 0003
        MVI     G_0318, R2                      ; D70A   0282 0318
        ANDI    #$007F, R2                      ; D70C   03BA 007F
        SUBR    R2,     R1                      ; D70E   0111
        BPL     L_D716                          ; D70F   0203 0005

        MVII    #$0008, R2                      ; D711   02BA 0008
        SUBR    R5,     R2                      ; D713   012A
        MOVR    R2,     R5                      ; D714   0095
        NEGR    R1                              ; D715   0021
L_D716:
        MVI     G_0310, R2                      ; D716   0282 0310
        ANDI    #$00FF, R2                      ; D718   03BA 00FF
        SUBR    R2,     R0                      ; D71A   0110
        BPL     L_D722                          ; D71B   0203 0005

        MVII    #$0010, R2                      ; D71D   02BA 0010
        SUBR    R5,     R2                      ; D71F   012A
        MOVR    R2,     R5                      ; D720   0095
        NEGR    R0                              ; D721   0020
L_D722:
        MOVR    R1,     R2                      ; D722   008A
        SLL     R2,     2                       ; D723   004E
        CMPR    R2,     R0                      ; D724   0150
        BMI     L_D72B                          ; D725   020B 0004

        ANDI    #$0008, R5                      ; D727   03BD 0008
        ADDI    #$0004, R5                      ; D729   02FD 0004
L_D72B:
        ADDI    #$0017, R4                      ; D72B   02FC 0017
        ADDR    R0,     R1                      ; D72D   00C1
        SLR     R1,     2                       ; D72E   0065
        ADDI    #$000A, R1                      ; D72F   02F9 000A
        MVO@    R1,     R4                      ; D731   0261
        PULR    R1                              ; D732   02B1
        SLL     R1,     2                       ; D733   004D
        SLL     R1,     2                       ; D734   004D
        MOVR    R5,     R2                      ; D735   00AA
        SWAP    R2,     1                       ; D736   0042
        SLL     R2,     2                       ; D737   004E
        SLL     R2,     2                       ; D738   004E
        ADDR    R2,     R1                      ; D739   00D1
        SUBI    #$0031, R4                      ; D73A   033C 0031
        ADDI    #$0226, R4                      ; D73C   02FC 0226
        MVO@    R1,     R4                      ; D73E   0261
L_D73F:
        PULR    R7                              ; D73F   02B7
        ADDI    #$0030, R3                      ; D740   02FB 0030
        MVI@    R3,     R2                      ; D742   029A
        DECR    R2                              ; D743   0012
        BMI     L_D7BC                          ; D744   020B 0076

        MVO@    R2,     R3                      ; D746   025A
        SUBI    #$0018, R3                      ; D747   033B 0018
        MVI@    R3,     R1                      ; D749   0299
        SUBI    #$0018, R3                      ; D74A   033B 0018
        MVI@    R3,     R0                      ; D74C   0298
        ANDI    #$00F0, R0                      ; D74D   03B8 00F0
        SLL     R0,     2                       ; D74F   004C
        SLL     R0,     2                       ; D750   004C
        ADDR    R0,     R1                      ; D751   00C1
        ADDI    #$0226, R3                      ; D752   02FB 0226
        MVI@    R3,     R2                      ; D754   029A
        MOVR    R2,     R0                      ; D755   0090
        SDBD                                    ; D756   0001
        ANDI    #$0FFF, R0                      ; D757   03B8 00FF 000F
        SWAP    R2,     1                       ; D75A   0042
        SLR     R2,     2                       ; D75B   0066
        SLR     R2,     2                       ; D75C   0066
        ANDI    #$000F, R2                      ; D75D   03BA 000F
        MOVR    R2,     R4                      ; D75F   0094
        MVI     G_0348, R2                      ; D760   0282 0348
        SLL     R2,     2                       ; D762   004E
        SUBR    R2,     R0                      ; D763   0110
        ADDR    R4,     R4                      ; D764   00E4
        SDBD                                    ; D765   0001
        ADDI    #$77CF, R4                      ; D766   02FC 00CF 0077
        MVI@    R4,     R2                      ; D769   02A2
        XORI    #$0200, R2                      ; D76A   03FA 0200
        SUBI    #$0200, R2                      ; D76C   033A 0200
        ADDR    R2,     R0                      ; D76E   00D0
        BMI     L_D7B8                          ; D76F   020B 0047

        SDBD                                    ; D771   0001
        CMPI    #$0A80, R0                      ; D772   0378 0080 000A
        BPL     L_D7B8                          ; D775   0203 0041

        MVI@    R4,     R2                      ; D777   02A2
        XORI    #$0200, R2                      ; D778   03FA 0200
        SUBI    #$0200, R2                      ; D77A   033A 0200
        ADDR    R2,     R1                      ; D77C   00D1
        BMI     L_D7B8                          ; D77D   020B 0039

        CMPI    #$0200, R1                      ; D77F   0379 0200
        BMI     L_D7B8                          ; D781   020B 0035

        SDBD                                    ; D783   0001
        CMPI    #$0680, R1                      ; D784   0379 0080 0006
        BPL     L_D7B8                          ; D787   0203 002F

        MVI@    R3,     R2                      ; D789   029A
        SDBD                                    ; D78A   0001
        ANDI    #$F000, R2                      ; D78B   03BA 0000 00F0
        ADDR    R0,     R2                      ; D78E   00C2
        MVO@    R2,     R3                      ; D78F   025A
        SUBI    #$0226, R3                      ; D790   033B 0226
        MOVR    R1,     R2                      ; D792   008A
        SLR     R2,     2                       ; D793   0066
        SLR     R2,     2                       ; D794   0066
        ANDI    #$00F0, R2                      ; D795   03BA 00F0
        ADDI    #$0002, R2                      ; D797   02FA 0002
        MVO@    R2,     R3                      ; D799   025A
        ADDI    #$0018, R3                      ; D79A   02FB 0018
        MVO@    R1,     R3                      ; D79C   0259
        SUBI    #$0018, R3                      ; D79D   033B 0018
        MOVR    R3,     R2                      ; D79F   009A
        XOR     G_0341, R2                      ; D7A0   03C2 0341
        ANDI    #$0001, R2                      ; D7A2   03BA 0001
        BEQ     L_D7CC                          ; D7A4   0204 0026

        SLR     R0,     2                       ; D7A6   0064
        SLR     R0,     2                       ; D7A7   0064
        ADDI    #$0300, R0                      ; D7A8   02F8 0300
        MVO     R0,     G_0312                  ; D7AA   0240 0312
        SLR     R1,     2                       ; D7AC   0065
        SLR     R1,     2                       ; D7AD   0065
        MVO     R1,     G_031A                  ; D7AE   0241 031A
        SDBD                                    ; D7B0   0001
        MVII    #$095F, R5                      ; D7B1   02BD 005F 0009
        MVO     R5,     G_0322                  ; D7B4   0245 0322
        B       L_D7CC                          ; D7B6   0200 0014

L_D7B8:
        SUBI    #$0226, R3                      ; D7B8   033B 0226
        ADDI    #$0030, R3                      ; D7BA   02FB 0030
L_D7BC:
        CLRR    R0                              ; D7BC   01C0
        MVO@    R0,     R3                      ; D7BD   0258
        SUBI    #$0030, R3                      ; D7BE   033B 0030
        MOVR    R3,     R2                      ; D7C0   009A
        XOR     G_0341, R2                      ; D7C1   03C2 0341
        ANDI    #$0001, R2                      ; D7C3   03BA 0001
        BEQ     L_D7CC                          ; D7C5   0204 0005

        CLRR    R0                              ; D7C7   01C0
        MVO     R0,     G_0312                  ; D7C8   0240 0312
        MVO     R0,     G_0322                  ; D7CA   0240 0322
L_D7CC:
        J       G_7813                          ; D7CC   0004 0378 0013

        DECLE   $0000                           ; D7CF   0000

        XOR@    R2,     R2                      ; D7D0   03D2
        XOR@    R5,     R7                      ; D7D1   03EF
        XOR@    R2,     R5                      ; D7D2   03D5
        XOR@    R3,     R7                      ; D7D3   03DF
        XOR@    R3,     R7                      ; D7D4   03DF
        XOR@    R2,     R5                      ; D7D5   03D5
        XOR@    R5,     R7                      ; D7D6   03EF
        XOR@    R2,     R2                      ; D7D7   03D2
        DECLE   $0000                           ; D7D8   0000

        XOR@    R2,     R5                      ; D7D9   03D5
        DECR    R1                              ; D7DA   0011
        XOR@    R3,     R7                      ; D7DB   03DF
        NEGR    R1                              ; D7DC   0021
        XOR@    R5,     R7                      ; D7DD   03EF
        ADCR    R3                              ; D7DE   002B
        DECLE   $0000                           ; D7DF   0000

        ADCR    R6                              ; D7E0   002E
        DECR    R1                              ; D7E1   0011
        ADCR    R3                              ; D7E2   002B
        NEGR    R1                              ; D7E3   0021
        NEGR    R1                              ; D7E4   0021
        ADCR    R3                              ; D7E5   002B
        DECR    R1                              ; D7E6   0011
        ADCR    R6                              ; D7E7   002E
        DECLE   $0000                           ; D7E8   0000

        ADCR    R3                              ; D7E9   002B
        XOR@    R5,     R7                      ; D7EA   03EF
        NEGR    R1                              ; D7EB   0021
        XOR@    R3,     R7                      ; D7EC   03DF
        DECR    R1                              ; D7ED   0011
        XOR@    R2,     R5                      ; D7EE   03D5
        PSHR    R5                              ; D7EF   0275
        CLRR    R3                              ; D7F0   01DB
        MVO     R3,     G_01AC                  ; D7F1   0243 01AC
        MVO     R3,     G_01AD                  ; D7F3   0243 01AD
        MVI     G_0348, R2                      ; D7F5   0282 0348
        TSTR    R2                              ; D7F7   0092
        GSWD    R0                              ; D7F8   0030
        BPL     L_D7FC                          ; D7F9   0203 0001

        NEGR    R2                              ; D7FB   0022
L_D7FC:
        MVII    #$0009, R1                      ; D7FC   02B9 0009

        JSR     R5,     G_7FC5                  ; D7FE   0004 017C 03C5

        RSWD    R0                              ; D801   0038
        BPL     L_D805                          ; D802   0203 0001

        NEGR    R2                              ; D804   0022
L_D805:
        MVO     R2,     G_0344                  ; D805   0242 0344
        MVII    #$0102, R3                      ; D807   02BB 0102
L_D809:
        MVI@    R3,     R5                      ; D809   029D
        ANDI    #$000F, R5                      ; D80A   03BD 000F
        ADDR    R5,     R5                      ; D80C   00ED
        SDBD                                    ; D80D   0001
        ADDI    #$781C, R5                      ; D80E   02FD 001C 0078
        SDBD                                    ; D811   0001
        MVI@    R5,     R7                      ; D812   02AF
        INCR    R3                              ; D813   000B
        CMPI    #$011A, R3                      ; D814   037B 011A
        BNEQ    L_D809                          ; D816   022C 000E

        JSR     R5,     L_64E6                  ; D818   0004 0164 00E6

        PULR    R7                              ; D81B   02B7
        DECR    R3                              ; D81C   0013
        SARC    R0,     1                       ; D81D   0078
        ADDR    R5,     R7                      ; D81E   00EF
        SAR     R0,     1                       ; D81F   0068
        SWAP    R0,     1                       ; D820   0040
        RRC     R3,     2                       ; D821   0077
        SWAP    R0,     2                       ; D822   0044
        SLR     R3,     2                       ; D823   0067
        SAR     R0,     2                       ; D824   006C
        SLR     R2,     2                       ; D825   0066
        RSWD    R4                              ; D826   003C
        SARC    R0,     1                       ; D827   0078
        RSWD    R4                              ; D828   003C
        SARC    R0,     1                       ; D829   0078
        ADDR    R4,     R4                      ; D82A   00E4
        SLR     R2,     1                       ; D82B   0062
        RSWD    R4                              ; D82C   003C
        SARC    R0,     1                       ; D82D   0078
        RSWD    R4                              ; D82E   003C
        SARC    R0,     1                       ; D82F   0078
        MOVR    R1,     R5                      ; D830   008D
        SARC    R1,     1                       ; D831   0079
        RSWD    R4                              ; D832   003C
        SARC    R0,     1                       ; D833   0078
        SETC                                    ; D834   0007
        SARC    R2,     1                       ; D835   007A
        SLL     R2,     1                       ; D836   004A
        SLLC    R2,     1                       ; D837   005A
        INCR    R4                              ; D838   000C
        SARC    R3,     1                       ; D839   007B
        NEGR    R2                              ; D83A   0022
        SLR     R3,     1                       ; D83B   0063
        CLRR    R0                              ; D83C   01C0
        MVO@    R0,     R3                      ; D83D   0258
        J       G_7813                          ; D83E   0004 0378 0013

        PSHR    R5                              ; D841   0275
        MVII    #$000A, R1                      ; D842   02B9 000A
        MVII    #$0102, R3                      ; D844   02BB 0102
L_D846:
        MVI@    R3,     R0                      ; D846   0298
        TSTR    R0                              ; D847   0080
        BNEQ    L_D871                          ; D848   020C 0027

        MOVR    R3,     R2                      ; D84A   009A
        ADDI    #$0226, R2                      ; D84B   02FA 0226

        JSR     R5,     G_7FD5                  ; D84D   0004 017C 03D5

        SDBD                                    ; D850   0001
        ANDI    #$3FFF, R0                      ; D851   03B8 00FF 003F
        MVO@    R0,     R2                      ; D854   0250
        ADDI    #$0018, R3                      ; D855   02FB 0018
        MVII    #$0008, R0                      ; D857   02B8 0008
        MVO@    R0,     R3                      ; D859   0258
        ADDI    #$0018, R3                      ; D85A   02FB 0018
        MVII    #$0003, R0                      ; D85C   02B8 0003
        MVO@    R0,     R3                      ; D85E   0258
        SUBI    #$0030, R3                      ; D85F   033B 0030
        MVII    #$000E, R0                      ; D861   02B8 000E
        MVO@    R0,     R3                      ; D863   0258
        MVI     G_016C, R0                      ; D864   0280 016C
        TSTR    R0                              ; D866   0080
        BEQ     L_D86E                          ; D867   0204 0005

        PSHR    R1                              ; D869   0271

        JSR     R5,     G_7A96                  ; D86A   0004 0178 0296

        PULR    R1                              ; D86D   02B1
L_D86E:
        DECR    R1                              ; D86E   0011
        BEQ     L_D876                          ; D86F   0204 0005

L_D871:
        INCR    R3                              ; D871   000B
        CMPI    #$011A, R3                      ; D872   037B 011A
        BNEQ    L_D846                          ; D874   022C 002F

L_D876:
        MVII    #$000E, R1                      ; D876   02B9 000E

        JSR     R5,     L_5DBF                  ; D878   0004 015C 01BF

        PULR    R7                              ; D87B   02B7
        PSHR    R5                              ; D87C   0275
        MVII    #$0102, R3                      ; D87D   02BB 0102
        MVI     G_014D, R0                      ; D87F   0280 014D
L_D881:
        MVI@    R3,     R2                      ; D881   029A
        ANDI    #$000E, R2                      ; D882   03BA 000E
        CMPI    #$000C, R2                      ; D884   037A 000C
        BNEQ    L_D889                          ; D886   020C 0001

        INCR    R0                              ; D888   0008
L_D889:
        INCR    R3                              ; D889   000B
        CMPI    #$011A, R3                      ; D88A   037B 011A
        BNEQ    L_D881                          ; D88C   022C 000C

        JSR     R5,     G_7941                  ; D88E   0004 0178 0141

        CLRR    R0                              ; D891   01C0
        MVO     R0,     G_014D                  ; D892   0240 014D

        JSR     R5,     L_6D54                  ; D894   0004 016C 0154

        MVI     G_018B, R0                      ; D897   0280 018B
        INCR    R0                              ; D899   0008
        ANDI    #$00FF, R0                      ; D89A   03B8 00FF
        BEQ     L_D8A0                          ; D89C   0204 0002

        MVO     R0,     G_018B                  ; D89E   0240 018B
L_D8A0:
        MVII    #$0102, R4                      ; D8A0   02BC 0102
        MVII    #$0018, R0                      ; D8A2   02B8 0018

        JSR     R5,     L_6F9A                  ; D8A4   0004 016C 039A

        MVII    #$0310, R4                      ; D8A7   02BC 0310
        MVII    #$0018, R0                      ; D8A9   02B8 0018

        JSR     R5,     L_6F9A                  ; D8AB   0004 016C 039A

        CLRR    R0                              ; D8AE   01C0
        MVO     R0,     G_0341                  ; D8AF   0240 0341
        MVI     G_018B, R2                      ; D8B1   0282 018B
        CMPI    #$0001, R2                      ; D8B3   037A 0001
        BEQ     L_D8C0                          ; D8B5   0204 0009

        CLRR    R3                              ; D8B7   01DB
        MVII    #$0005, R1                      ; D8B8   02B9 0005

        JSR     R5,     G_7FC5                  ; D8BA   0004 017C 03C5

        TSTR    R3                              ; D8BD   009B
        BNEQ    L_D8C8                          ; D8BE   020C 0008

L_D8C0:
        CLRR    R0                              ; D8C0   01C0
        MVO     R0,     G_016C                  ; D8C1   0240 016C
        MVII    #$0008, R0                      ; D8C3   02B8 0008

        JSR     R5,     G_7941                  ; D8C5   0004 0178 0141
L_D8C8:
        JSR     R5,     .HEADER                 ; D8C8   0004 0150 0000
        JSR     R5,     G_72A1                  ; D8CB   0004 0170 02A1

        MVII    #$0004, R0                      ; D8CE   02B8 0004
        MVO     R0,     G_0184                  ; D8D0   0240 0184
        MVII    #$0102, R4                      ; D8D2   02BC 0102
        ADDI    #$0016, R4                      ; D8D4   02FC 0016
        MVII    #$0002, R0                      ; D8D6   02B8 0002
        MVO@    R0,     R4                      ; D8D8   0260
        MVO@    R0,     R4                      ; D8D9   0260
        ADDI    #$002E, R4                      ; D8DA   02FC 002E
        CLRR    R0                              ; D8DC   01C0
        MVO@    R0,     R4                      ; D8DD   0260
        MVO@    R0,     R4                      ; D8DE   0260

        JSR     R5,     G_7841                  ; D8DF   0004 0178 0041

        MVI     G_018B, R0                      ; D8E2   0280 018B
        CMPI    #$0001, R0                      ; D8E4   0378 0001
        BEQ     L_D8FC                          ; D8E6   0204 0014

        MVII    #$0064, R0                      ; D8E8   02B8 0064
        MVII    #$0020, R1                      ; D8EA   02B9 0020

        JSR     R5,     L_63E9                  ; D8EC   0004 0160 03E9

        MVII    #$010E, R0                      ; D8EF   02B8 010E
        MVII    #$0020, R1                      ; D8F1   02B9 0020

        JSR     R5,     L_63E9                  ; D8F3   0004 0160 03E9
        JSR     R5,     L_67F2                  ; D8F6   0004 0164 03F2
        JSR     R5,     L_67F2                  ; D8F9   0004 0164 03F2

L_D8FC:
        PULR    R7                              ; D8FC   02B7
        PSHR    R5                              ; D8FD   0275
        MOVR    R3,     R5                      ; D8FE   009D
        ADDI    #$0226, R5                      ; D8FF   02FD 0226
        MVI@    R5,     R0                      ; D901   02A8
        MOVR    R0,     R1                      ; D902   0081
        ANDI    #$01FF, R0                      ; D903   03B8 01FF
        SWAP    R1,     1                       ; D905   0041
        SLR     R1,     1                       ; D906   0061
        ANDI    #$007F, R1                      ; D907   03B9 007F
        PULR    R7                              ; D909   02B7
        PSHR    R5                              ; D90A   0275
        MOVR    R3,     R5                      ; D90B   009D
        ADDI    #$0226, R5                      ; D90C   02FD 0226
        ANDI    #$01FF, R0                      ; D90E   03B8 01FF
        SLL     R1,     1                       ; D910   0049
        SWAP    R1,     1                       ; D911   0041
        SDBD                                    ; D912   0001
        ANDI    #$FE00, R1                      ; D913   03B9 0000 00FE
        ADDR    R1,     R0                      ; D916   00C8
        MVO@    R0,     R5                      ; D917   0268
        PULR    R7                              ; D918   02B7
        PSHR    R5                              ; D919   0275
        MOVR    R3,     R2                      ; D91A   009A
        SUBI    #$0102, R2                      ; D91B   033A 0102
        SWAP    R2,     1                       ; D91D   0042
        SLL     R2,     2                       ; D91E   004E
        SLL     R2,     1                       ; D91F   004A
        PSHR    R2                              ; D920   0272
        MOVR    R0,     R2                      ; D921   0082
        SUBI    #$00E0, R2                      ; D922   033A 00E0
        PSHR    R2                              ; D924   0272
        SLL     R2,     2                       ; D925   004E
        ADD@    R6,     R2                      ; D926   02F2
        SLR     R2,     1                       ; D927   0062
        ADDI    #$0300, R2                      ; D928   02FA 0300
        ADD@    R6,     R2                      ; D92A   02F2
        MVO@    R2,     R4                      ; D92B   0262
        ADDI    #$0007, R4                      ; D92C   02FC 0007
        MOVR    R1,     R2                      ; D92E   008A
        SLR     R2,     1                       ; D92F   0062
        ADDI    #$00A0, R2                      ; D930   02FA 00A0
        MVO@    R2,     R4                      ; D932   0262
        PULR    R7                              ; D933   02B7
        PSHR    R5                              ; D934   0275
        CMPI    #$00E0, R0                      ; D935   0378 00E0
        BMI     L_D93F                          ; D937   020B 0006

        CMPI    #$012C, R0                      ; D939   0378 012C
        BPL     L_D93F                          ; D93B   0203 0002

        SETC                                    ; D93D   0007
        PULR    R7                              ; D93E   02B7
L_D93F:
        CLRC                                    ; D93F   0006
        PULR    R7                              ; D940   02B7
        PSHR    R5                              ; D941   0275
        MOVR    R0,     R3                      ; D942   0083
        BEQ     L_D97C                          ; D943   0204 0037

        CMPI    #$0008, R3                      ; D945   037B 0008
        BNEQ    L_D952                          ; D947   020C 0009

        MVII    #$016F, R4                      ; D949   02BC 016F
        MVII    #$0008, R0                      ; D94B   02B8 0008
        MVII    #$00FF, R1                      ; D94D   02B9 00FF

        JSR     R5,     L_6F9B                  ; D94F   0004 016C 039B

L_D952:
        DECR    R3                              ; D952   0013
        BMI     L_D97C                          ; D953   020B 0027

L_D955:
        JSR     R5,     G_7FD5                  ; D955   0004 017C 03D5

        ANDI    #$000F, R0                      ; D958   03B8 000F
        SDBD                                    ; D95A   0001
        ADDI    #$797D, R0                      ; D95B   02F8 007D 0079
        MOVR    R0,     R1                      ; D95E   0081
        MVI@    R1,     R0                      ; D95F   0288
        MVII    #$016F, R4                      ; D960   02BC 016F
        MVII    #$0008, R5                      ; D962   02BD 0008
L_D964:
        CMP@    R4,     R0                      ; D964   0360
        BEQ     L_D955                          ; D965   0224 0011

        DECR    R5                              ; D967   0015
        BNEQ    L_D964                          ; D968   022C 0005

        MVII    #$016F, R4                      ; D96A   02BC 016F
        MVII    #$0008, R5                      ; D96C   02BD 0008
        MVII    #$00FF, R2                      ; D96E   02BA 00FF
L_D970:
        CMP@    R4,     R2                      ; D970   0362
        BEQ     L_D978                          ; D971   0204 0005

        DECR    R5                              ; D973   0015
        BNEQ    L_D970                          ; D974   022C 0005
        B       L_D97C                          ; D976   0200 0004

L_D978:
        DECR    R4                              ; D978   0014
        MVO@    R0,     R4                      ; D979   0260
        B       L_D952                          ; D97A   0220 0029

L_D97C:
        PULR    R7                              ; D97C   02B7
        CLRC                                    ; D97D   0006
        INCR    R0                              ; D97E   0008
        COMR    R1                              ; D97F   0019
        COMR    R3                              ; D980   001B
        NEGR    R4                              ; D981   0024
        GSWD    R0                              ; D982   0030
        RSWD    R5                              ; D983   003D
        SLL     R3,     1                       ; D984   004B
        SLL     R2,     2                       ; D985   004E
        SLLC    R1,     2                       ; D986   005D
        SAR     R1,     2                       ; D987   006D
        SARC    R1,     2                       ; D988   007D
        MOVR    R1,     R2                      ; D989   008A
        MOVR    R3,     R2                      ; D98A   009A
        MOVR    R3,     R5                      ; D98B   009D
        SLL     R1,     1                       ; D98C   0049

L_D98D:
        JSR     R5,     G_78FD                  ; D98D   0004 0178 00FD

        SUB     G_0344, R0                      ; D990   0300 0344

        JSR     R5,     L_5D74                  ; D992   0004 015C 0174

        SLR     R2,     1                       ; D995   0062
        INCR    R2                              ; D996   000A
        MOVR    R2,     R4                      ; D997   0094
        MVI     G_035D, R2                      ; D998   0282 035D
        INCR    R2                              ; D99A   000A
        SUBR    R0,     R2                      ; D99B   0102
        BPL     L_D9A0                          ; D99C   0203 0002

        ADDI    #$0200, R2                      ; D99E   02FA 0200
L_D9A0:
        CMPI    #$0100, R2                      ; D9A0   037A 0100
        BMI     L_D9A6                          ; D9A2   020B 0002

        SUBI    #$0200, R2                      ; D9A4   033A 0200
L_D9A6:
        TSTR    R2                              ; D9A6   0092
        BPL     L_D9AB                          ; D9A7   0203 0002

        NEGR    R4                              ; D9A9   0024
        NEGR    R2                              ; D9AA   0022
L_D9AB:
        ADDR    R4,     R0                      ; D9AB   00E0

        JSR     R5,     G_7FE2                  ; D9AC   0004 017C 03E2

        ANDI    #$000F, R5                      ; D9AF   03BD 000F
        SUBI    #$0007, R5                      ; D9B1   033D 0007
        ADDR    R5,     R1                      ; D9B3   00E9
        CMPI    #$0014, R2                      ; D9B4   037A 0014
        BPL     L_D9C5                          ; D9B6   0203 000D

        JSR     R5,     L_5D74                  ; D9B8   0004 015C 0174

        ADDI    #$0002, R2                      ; D9BB   02FA 0002
        CMP     G_035E, R1                      ; D9BD   0341 035E
        BMI     L_D9C4                          ; D9BF   020B 0003

        SUBR    R2,     R1                      ; D9C1   0111
        B       L_D9C5                          ; D9C2   0200 0001

L_D9C4:
        ADDR    R2,     R1                      ; D9C4   00D1
L_D9C5:
        ANDI    #$01FF, R0                      ; D9C5   03B8 01FF
        ANDI    #$007F, R1                      ; D9C7   03B9 007F
        MVI@    R3,     R2                      ; D9C9   029A
        ANDI    #$0070, R2                      ; D9CA   03BA 0070
        BEQ     L_D9D9                          ; D9CC   0204 000B

        JSR     R5,     G_7C1B                  ; D9CE   0004 017C 001B

        MVII    #$0005, R1                      ; D9D1   02B9 0005

        JSR     R5,     G_76D7                  ; D9D3   0004 0174 02D7

        J       G_7813                          ; D9D6   0004 0378 0013

L_D9D9:
        JSR     R5,     G_7934                  ; D9D9   0004 0178 0134

        BNC     L_DA01                          ; D9DC   0209 0023

        MVII    #$0323, R4                      ; D9DE   02BC 0323
        MVII    #$0005, R5                      ; D9E0   02BD 0005
L_D9E2:
        MVI@    R4,     R2                      ; D9E2   02A2
        TSTR    R2                              ; D9E3   0092
        BEQ     L_D9EF                          ; D9E4   0204 0009

        DECR    R5                              ; D9E6   0015
        BNEQ    L_D9E2                          ; D9E7   022C 0006

        ADDI    #$00FF, R0                      ; D9E9   02F8 00FF
        ANDI    #$01FF, R0                      ; D9EB   03B8 01FF
        B       L_DA01                          ; D9ED   0200 0012

L_D9EF:
        DECR    R4                              ; D9EF   0014
        SDBD                                    ; D9F0   0001
        MVII    #$18E7, R5                      ; D9F1   02BD 00E7 0018
        MVO@    R5,     R4                      ; D9F4   0265
        SUBI    #$0011, R4                      ; D9F5   033C 0011

        JSR     R5,     G_7919                  ; D9F7   0004 0178 0119

        MOVR    R4,     R2                      ; D9FA   00A2
        SUBI    #$0319, R2                      ; D9FB   033A 0319
        SLL     R2,     2                       ; D9FD   004E
        SLL     R2,     2                       ; D9FE   004E
        ADD@    R3,     R2                      ; D9FF   02DA
        MVO@    R2,     R3                      ; DA00   025A

L_DA01:
        JSR     R5,     G_790A                  ; DA01   0004 0178 010A

        J       G_7813                          ; DA04   0004 0378 0013

        JSR     R5,     G_78FD                  ; DA07   0004 0178 00FD

        SUB     G_0344, R0                      ; DA0A   0300 0344

        JSR     R5,     L_5D74                  ; DA0C   0004 015C 0174

        SLR     R2,     1                       ; DA0F   0062
        INCR    R2                              ; DA10   000A
        SUBR    R2,     R1                      ; DA11   0111
        CMPI    #$0005, R1                      ; DA12   0379 0005
        BPL     L_DA23                          ; DA14   0203 000D

        JSR     R5,     G_7A96                  ; DA16   0004 0178 0296

        PSHR    R3                              ; DA19   0273
        MVII    #$000B, R1                      ; DA1A   02B9 000B

        JSR     R5,     L_5DBF                  ; DA1C   0004 015C 01BF

        PULR    R3                              ; DA1F   02B3
        J       G_7813                          ; DA20   0004 0378 0013

L_DA23:
        MVI@    R3,     R2                      ; DA23   029A
        ANDI    #$0070, R2                      ; DA24   03BA 0070
        BEQ     L_DA33                          ; DA26   0204 000B

        JSR     R5,     G_7C1B                  ; DA28   0004 017C 001B

        MVII    #$000C, R1                      ; DA2B   02B9 000C

        JSR     R5,     G_76D7                  ; DA2D   0004 0174 02D7

        J       G_7813                          ; DA30   0004 0378 0013

L_DA33:
        JSR     R5,     G_7934                  ; DA33   0004 0178 0134

        BNC     L_DA5B                          ; DA36   0209 0023

        MVII    #$0323, R4                      ; DA38   02BC 0323
        MVII    #$0005, R5                      ; DA3A   02BD 0005
L_DA3C:
        MVI@    R4,     R2                      ; DA3C   02A2
        TSTR    R2                              ; DA3D   0092
        BEQ     L_DA49                          ; DA3E   0204 0009

        DECR    R5                              ; DA40   0015
        BNEQ    L_DA3C                          ; DA41   022C 0006

        ADDI    #$00FF, R0                      ; DA43   02F8 00FF
        ANDI    #$01FF, R0                      ; DA45   03B8 01FF
        B       L_DA5B                          ; DA47   0200 0012

L_DA49:
        DECR    R4                              ; DA49   0014
        SDBD                                    ; DA4A   0001
        MVII    #$08D4, R5                      ; DA4B   02BD 00D4 0008
        MVO@    R5,     R4                      ; DA4E   0265
        SUBI    #$0011, R4                      ; DA4F   033C 0011

        JSR     R5,     G_7919                  ; DA51   0004 0178 0119

        MOVR    R4,     R2                      ; DA54   00A2
        SUBI    #$0319, R2                      ; DA55   033A 0319
        SLL     R2,     2                       ; DA57   004E
        SLL     R2,     2                       ; DA58   004E
        ADD@    R3,     R2                      ; DA59   02DA
        MVO@    R2,     R3                      ; DA5A   025A

L_DA5B:
        JSR     R5,     G_790A                  ; DA5B   0004 0178 010A

        J       G_7813                          ; DA5E   0004 0378 0013

L_DA61:
        MVI@    R3,     R4                      ; DA61   029C
        ADDI    #$016F, R4                      ; DA62   02FC 016F
        SUBI    #$0030, R3                      ; DA64   033B 0030
        MVI@    R3,     R2                      ; DA66   029A
        ANDI    #$00F0, R2                      ; DA67   03BA 00F0
        ADDI    #$000C, R2                      ; DA69   02FA 000C
        MVO@    R2,     R3                      ; DA6B   025A
        ANDI    #$0070, R2                      ; DA6C   03BA 0070
        BEQ     L_DA79                          ; DA6E   0204 0009

        SLR     R2,     2                       ; DA70   0066
        SLR     R2,     2                       ; DA71   0066
        ADDI    #$0320, R2                      ; DA72   02FA 0320
        SDBD                                    ; DA74   0001
        MVII    #$08D4, R5                      ; DA75   02BD 00D4 0008
        MVO@    R5,     R2                      ; DA78   0255
L_DA79:
        MVI@    R4,     R2                      ; DA79   02A2
        DECR    R4                              ; DA7A   0014
        MVII    #$00FF, R5                      ; DA7B   02BD 00FF
        MVO@    R5,     R4                      ; DA7D   0265
        CLRR    R5                              ; DA7E   01ED
        SUB     G_016E, R2                      ; DA7F   0302 016E
        BPL     L_DA85                          ; DA81   0203 0002

        ADDI    #$00A0, R2                      ; DA83   02FA 00A0
L_DA85:
        CMPI    #$0014, R2                      ; DA85   037A 0014
        BPL     L_DA8C                          ; DA87   0203 0003

        ADDI    #$02DC, R2                      ; DA89   02FA 02DC
        MVO@    R5,     R2                      ; DA8B   0255
L_DA8C:
        MVII    #$0006, R1                      ; DA8C   02B9 0006
        PSHR    R3                              ; DA8E   0273

        JSR     R5,     L_5DBF                  ; DA8F   0004 015C 01BF

        PULR    R3                              ; DA92   02B3
        J       G_7813                          ; DA93   0004 0378 0013

        MVI@    R3,     R2                      ; DA96   029A
        ANDI    #$00F0, R2                      ; DA97   03BA 00F0
        ADDI    #$000A, R2                      ; DA99   02FA 000A
        MVO@    R2,     R3                      ; DA9B   025A
        ANDI    #$0070, R2                      ; DA9C   03BA 0070
        BEQ     L_DAA9                          ; DA9E   0204 0009

        SLR     R2,     2                       ; DAA0   0066
        SLR     R2,     2                       ; DAA1   0066
        ADDI    #$0320, R2                      ; DAA2   02FA 0320
        SDBD                                    ; DAA4   0001
        MVII    #$18E7, R4                      ; DAA5   02BC 00E7 0018
        MVO@    R4,     R2                      ; DAA8   0254
L_DAA9:
        MOVR    R5,     R7                      ; DAA9   00AF

L_DAAA:
        JSR     R5,     L_5D74                  ; DAAA   0004 015C 0174

        SDBD                                    ; DAAD   0001
        ADDI    #$7AD4, R2                      ; DAAE   02FA 00D4 007A

        JSR     R5,     G_7FE2                  ; DAB1   0004 017C 03E2

        ANDI    #$03FF, R5                      ; DAB4   03BD 03FF
        CMP@    R2,     R5                      ; DAB6   0355
        BPL     L_DB2C                          ; DAB7   0203 0073

        MVI@    R3,     R2                      ; DAB9   029A
        ADDI    #$016F, R2                      ; DABA   02FA 016F
        MVI@    R2,     R5                      ; DABC   0295
        CMPI    #$00FF, R5                      ; DABD   037D 00FF
        BEQ     L_DB2C                          ; DABF   0204 006B

        SUBI    #$0018, R3                      ; DAC1   033B 0018
        MVI@    R3,     R2                      ; DAC3   029A
        MVII    #$0010, R5                      ; DAC4   02BD 0010
        MVO@    R5,     R3                      ; DAC6   025D
        SUBI    #$0018, R3                      ; DAC7   033B 0018
        J       G_7813                          ; DAC9   0004 0378 0013

        DECLE   $0001                           ; DACC   0001

        EIS                                     ; DACD   0002

        JSR     R4,     G_0810                  ; DACE   0004 0008 0010

        NEGR    R0                              ; DAD1   0020
        SWAP    R0,     1                       ; DAD2   0040
        TSTR    R0                              ; DAD3   0080
        MOVR    R4,     R0                      ; DAD4   00A0
        ADDR    R3,     R4                      ; DAD5   00DC
        SUBR    R5,     R4                      ; DAD6   012C
        XORR    R6,     R4                      ; DAD7   01F4
L_DAD8:
        ADDI    #$0018, R3                      ; DAD8   02FB 0018
        MVI@    R3,     R4                      ; DADA   029C
        ADDI    #$016F, R4                      ; DADB   02FC 016F
        MVI@    R4,     R2                      ; DADD   02A2
        CMPI    #$00FF, R2                      ; DADE   037A 00FF
        BEQ     L_DB2C                          ; DAE0   0204 004A

        ANDI    #$01FF, R0                      ; DAE2   03B8 01FF
        SUB     G_016E, R2                      ; DAE4   0302 016E
L_DAE6:
        ADDI    #$0048, R2                      ; DAE6   02FA 0048
        PSHR    R2                              ; DAE8   0272
        SLL     R2,     1                       ; DAE9   004A
        ADD@    R6,     R2                      ; DAEA   02F2
        PSHR    R2                              ; DAEB   0272
        SLL     R2,     2                       ; DAEC   004E
        SLL     R2,     2                       ; DAED   004E
        ADD@    R6,     R2                      ; DAEE   02F2
        SAR     R2,     2                       ; DAEF   006E
        SAR     R2,     2                       ; DAF0   006E
        ANDI    #$01FF, R2                      ; DAF1   03BA 01FF
        MVII    #$0001, R5                      ; DAF3   02BD 0001
        SUBR    R0,     R2                      ; DAF5   0102
        BEQ     L_DAFD                          ; DAF6   0204 0005
        BPL     L_DAFE                          ; DAF8   0203 0004

        NEGR    R5                              ; DAFA   0025
        B       L_DAFE                          ; DAFB   0200 0001

L_DAFD:
        CLRR    R5                              ; DAFD   01ED
L_DAFE:
        ADDR    R5,     R0                      ; DAFE   00E8
        MVII    #$007B, R2                      ; DAFF   02BA 007B
        SUBR    R1,     R2                      ; DB01   010A
        BMI     L_DA61                          ; DB02   022B 00A2

        JSR     R5,     L_5D74                  ; DB04   0004 015C 0174

        SLR     R2,     1                       ; DB07   0062
        INCR    R2                              ; DB08   000A
        ADDR    R2,     R1                      ; DB09   00D1
        B       L_DBDB                          ; DB0A   0200 00CF

        JSR     R5,     G_78FD                  ; DB0C   0004 0178 00FD

        SUB     G_0344, R0                      ; DB0F   0300 0344
        ADDI    #$0018, R3                      ; DB11   02FB 0018
        MVI@    R3,     R4                      ; DB13   029C
        CMPI    #$0010, R4                      ; DB14   037C 0010
        BEQ     L_DAD8                          ; DB16   0224 003F
        BPL     L_DBA5                          ; DB18   0203 008B

        ADDR    R4,     R4                      ; DB1A   00E4
        SDBD                                    ; DB1B   0001
        ADDI    #$7C42, R4                      ; DB1C   02FC 0042 007C
        ADD@    R4,     R0                      ; DB1F   02E0
        ADD@    R4,     R1                      ; DB20   02E1
        ANDI    #$01FF, R0                      ; DB21   03B8 01FF
        ANDI    #$007F, R1                      ; DB23   03B9 007F
        ADDI    #$0018, R3                      ; DB25   02FB 0018
        MVI@    R3,     R2                      ; DB27   029A
        DECR    R2                              ; DB28   0012
        MVO@    R2,     R3                      ; DB29   025A
        BNEQ    L_DBDB                          ; DB2A   020C 00AF

L_DB2C:
        SUBI    #$0018, R3                      ; DB2C   033B 0018

        JSR     R5,     G_7FE2                  ; DB2E   0004 017C 03E2

        MOVR    R5,     R2                      ; DB31   00AA
        BMI     L_DB89                          ; DB32   020B 0055

        CMPI    #$002D, R1                      ; DB34   0379 002D
        BPL     L_DB89                          ; DB36   0203 0051

        PSHR    R0                              ; DB38   0270
        PSHR    R1                              ; DB39   0271
        PSHR    R3                              ; DB3A   0273
        ANDI    #$0001, R3                      ; DB3B   03BB 0001
        MOVR    R0,     R2                      ; DB3D   0082
        SLR     R2,     2                       ; DB3E   0066
        ADDR    R0,     R2                      ; DB3F   00C2
        SLR     R2,     2                       ; DB40   0066
        SUBI    #$0048, R2                      ; DB41   033A 0048
        ADD     G_016E, R2                      ; DB43   02C2 016E
        BPL     L_DB4B                          ; DB45   0203 0004

        ADDI    #$00A0, R2                      ; DB47   02FA 00A0
        B       L_DB51                          ; DB49   0200 0006

L_DB4B:
        CMPI    #$00A0, R2                      ; DB4B   037A 00A0
        BMI     L_DB51                          ; DB4D   020B 0002

        SUBI    #$00A0, R2                      ; DB4F   033A 00A0
L_DB51:
        MVII    #$00C8, R0                      ; DB51   02B8 00C8
        CLRR    R1                              ; DB53   01C9
        MVII    #$016F, R4                      ; DB54   02BC 016F
L_DB56:
        MVI@    R4,     R5                      ; DB56   02A5
        CMPI    #$00FF, R5                      ; DB57   037D 00FF
        BEQ     L_DB6B                          ; DB59   0204 0010

        SUBR    R2,     R5                      ; DB5B   0115
        BPL     L_DB60                          ; DB5C   0203 0002

        ADDI    #$00A0, R5                      ; DB5E   02FD 00A0
L_DB60:
        TSTR    R3                              ; DB60   009B
        BNEQ    L_DB66                          ; DB61   020C 0003

        SUBI    #$00A0, R5                      ; DB63   033D 00A0
        NEGR    R5                              ; DB65   0025
L_DB66:
        CMPR    R5,     R0                      ; DB66   0168
        BMI     L_DB6B                          ; DB67   020B 0002

        MOVR    R5,     R0                      ; DB69   00A8
        MOVR    R4,     R1                      ; DB6A   00A1
L_DB6B:
        CMPI    #$0177, R4                      ; DB6B   037C 0177
        BNEQ    L_DB56                          ; DB6D   022C 0018

        DECR    R1                              ; DB6F   0011
        BMI     L_DB86                          ; DB70   020B 0014

        MVII    #$0011, R5                      ; DB72   02BD 0011
        ADDR    R3,     R5                      ; DB74   00DD
        PULR    R3                              ; DB75   02B3
        MVO@    R5,     R3                      ; DB76   025D
        SUBI    #$016F, R1                      ; DB77   0339 016F
        ADDI    #$0018, R3                      ; DB79   02FB 0018
        MVO@    R1,     R3                      ; DB7B   0259
        SUBI    #$0030, R3                      ; DB7C   033B 0030
        PULR    R1                              ; DB7E   02B1
        PULR    R0                              ; DB7F   02B0

        JSR     R5,     G_790A                  ; DB80   0004 0178 010A

        J       G_7813                          ; DB83   0004 0378 0013

L_DB86:
        PULR    R3                              ; DB86   02B3
        PULR    R1                              ; DB87   02B1
        PULR    R0                              ; DB88   02B0
L_DB89:
        PSHR    R2                              ; DB89   0272
        ANDI    #$000E, R2                      ; DB8A   03BA 000E
        MOVR    R3,     R5                      ; DB8C   009D
        ANDI    #$0001, R5                      ; DB8D   03BD 0001
        ADDR    R5,     R2                      ; DB8F   00EA
        MVO@    R2,     R3                      ; DB90   025A
        PULR    R2                              ; DB91   02B2
        SWAP    R2,     1                       ; DB92   0042
        ANDI    #$0037, R2                      ; DB93   03BA 0037
        XORI    #$0008, R2                      ; DB95   03FA 0008
        ADDI    #$0018, R3                      ; DB97   02FB 0018
        MVO@    R2,     R3                      ; DB99   025A
        SUBI    #$0030, R3                      ; DB9A   033B 0030

        JSR     R5,     G_790A                  ; DB9C   0004 0178 010A

        J       G_7813                          ; DB9F   0004 0378 0013
L_DBA2:
        J       G_7B2C                          ; DBA2   0004 0378 032C

L_DBA5:
        ADDR    R4,     R4                      ; DBA5   00E4
        SDBD                                    ; DBA6   0001
        ADDI    #$7C42, R4                      ; DBA7   02FC 0042 007C

        JSR     R5,     L_5D74                  ; DBAA   0004 015C 0174

        ADDR    R2,     R2                      ; DBAD   00D2
        ANDI    #$0004, R2                      ; DBAE   03BA 0004
        ADDR    R2,     R4                      ; DBB0   00D4
        ADD@    R4,     R0                      ; DBB1   02E0
        ANDI    #$01FF, R0                      ; DBB2   03B8 01FF
        CMPI    #$0050, R1                      ; DBB4   0379 0050
        BPL     L_DBBA                          ; DBB6   0203 0002

        ADDI    #$0002, R1                      ; DBB8   02F9 0002
L_DBBA:
        ADDI    #$0018, R3                      ; DBBA   02FB 0018
        MVI@    R3,     R2                      ; DBBC   029A
        ADDI    #$016F, R2                      ; DBBD   02FA 016F
        MVI@    R2,     R2                      ; DBBF   0292
        CMPI    #$00FF, R2                      ; DBC0   037A 00FF
        BEQ     L_DBA2                          ; DBC2   0224 0021

        SUB     G_016E, R2                      ; DBC4   0302 016E
        ADDI    #$0048, R2                      ; DBC6   02FA 0048
        PSHR    R2                              ; DBC8   0272
        SLL     R2,     1                       ; DBC9   004A
        ADD@    R6,     R2                      ; DBCA   02F2
        PSHR    R2                              ; DBCB   0272
        SLL     R2,     2                       ; DBCC   004E
        SLL     R2,     2                       ; DBCD   004E
        ADD@    R6,     R2                      ; DBCE   02F2
        SAR     R2,     2                       ; DBCF   006E
        SAR     R2,     2                       ; DBD0   006E
        ANDI    #$01FF, R2                      ; DBD1   03BA 01FF
        SUBR    R0,     R2                      ; DBD3   0102
        BPL     L_DBD7                          ; DBD4   0203 0001

        NEGR    R2                              ; DBD6   0022
L_DBD7:
        CMPI    #$0008, R2                      ; DBD7   037A 0008
        BMI     L_DAAA                          ; DBD9   022B 0130

L_DBDB:
        SUBI    #$0030, R3                      ; DBDB   033B 0030
        MVI@    R3,     R2                      ; DBDD   029A
        ANDI    #$0070, R2                      ; DBDE   03BA 0070
        BEQ     L_DBED                          ; DBE0   0204 000B

        JSR     R5,     G_7C1B                  ; DBE2   0004 017C 001B

        MVII    #$000C, R1                      ; DBE5   02B9 000C

        JSR     R5,     G_76C4                  ; DBE7   0004 0174 02C4

        J       G_7813                          ; DBEA   0004 0378 0013

L_DBED:
        JSR     R5,     G_7934                  ; DBED   0004 0178 0134

        BNC     L_DC15                          ; DBF0   0209 0023

        MVII    #$0323, R4                      ; DBF2   02BC 0323
        MVII    #$0005, R5                      ; DBF4   02BD 0005
L_DBF6:
        MVI@    R4,     R2                      ; DBF6   02A2
        TSTR    R2                              ; DBF7   0092
        BEQ     L_DC03                          ; DBF8   0204 0009

        DECR    R5                              ; DBFA   0015
        BNEQ    L_DBF6                          ; DBFB   022C 0006

        ADDI    #$00FF, R0                      ; DBFD   02F8 00FF
        ANDI    #$01FF, R0                      ; DBFF   03B8 01FF
        B       L_DC15                          ; DC01   0200 0012

L_DC03:
        DECR    R4                              ; DC03   0014
        SDBD                                    ; DC04   0001
        MVII    #$08C4, R5                      ; DC05   02BD 00C4 0008
        MVO@    R5,     R4                      ; DC08   0265
        SUBI    #$0011, R4                      ; DC09   033C 0011

        JSR     R5,     G_7919                  ; DC0B   0004 0178 0119

        MOVR    R4,     R2                      ; DC0E   00A2
        SUBI    #$0319, R2                      ; DC0F   033A 0319
        SLL     R2,     2                       ; DC11   004E
        SLL     R2,     2                       ; DC12   004E
        ADD@    R3,     R2                      ; DC13   02DA
        MVO@    R2,     R3                      ; DC14   025A

L_DC15:
        JSR     R5,     G_790A                  ; DC15   0004 0178 010A

        J       G_7813                          ; DC18   0004 0378 0013

        PSHR    R5                              ; DC1B   0275

        JSR     R5,     G_7934                  ; DC1C   0004 0178 0134

        BC      L_DC33                          ; DC1F   0201 0012

        MVI@    R3,     R5                      ; DC21   029D
        MOVR    R5,     R2                      ; DC22   00AA
        ANDI    #$008F, R5                      ; DC23   03BD 008F
        MVO@    R5,     R3                      ; DC25   025D
        SLR     R2,     2                       ; DC26   0066
        SLR     R2,     2                       ; DC27   0066
        ANDI    #$0007, R2                      ; DC28   03BA 0007
        ADDI    #$0310, R2                      ; DC2A   02FA 0310
        CLRR    R5                              ; DC2C   01ED
        MVO@    R5,     R2                      ; DC2D   0255
        ADDI    #$0010, R2                      ; DC2E   02FA 0010
        MVO@    R5,     R2                      ; DC30   0255
        B       L_DC3E                          ; DC31   0200 000B

L_DC33:
        MVI@    R3,     R2                      ; DC33   029A
        SLR     R2,     2                       ; DC34   0066
        SLR     R2,     2                       ; DC35   0066
        ANDI    #$0007, R2                      ; DC36   03BA 0007
        ADDI    #$0310, R2                      ; DC38   02FA 0310
        MOVR    R2,     R4                      ; DC3A   0094

        JSR     R5,     G_7919                  ; DC3B   0004 0178 0119
L_DC3E:
        JSR     R5,     G_790A                  ; DC3E   0004 0178 010A

        PULR    R7                              ; DC41   02B7
        DECLE   $0000                           ; DC42   0000

        XORI    #$0000, R6                      ; DC43   03FE 0000
        XORI    #$03FF, R6                      ; DC45   03FE 03FF
        XORI    #$0001, R7                      ; DC47   03FF 0001
        XORI    #$03FF, R7                      ; DC49   03FF 03FF
        XORI    #$0001, R7                      ; DC4B   03FF 0001
        XORI    #$03FF, R7                      ; DC4D   03FF 03FF
        XORI    #$0001, R7                      ; DC4F   03FF 0001
        XORI    #$03FF, R7                      ; DC51   03FF 03FF
        DECLE   $0000,  $0001,  $0000           ; DC53   0000 0001 0000

        XORI    #$0001, R7                      ; DC56   03FF 0001
        DECLE   $0001                           ; DC58   0001

        SDBD                                    ; DC59   0001
        XORI    #$0101, R7                      ; DC5A   03FF 0001 0001
        SDBD                                    ; DC5D   0001
        XORI    #$0101, R7                      ; DC5E   03FF 0001 0001
        DECLE   $0001,  $0000                   ; DC61   0001 0000

        SDBD                                    ; DC63   0001
        XORI    #$0100, R7                      ; DC64   03FF 0000 0001
        DECLE   $0000                           ; DC67   0000

        XORI    #$0000, R6                      ; DC68   03FE 0000
        EIS                                     ; DC6A   0002
        DECLE   $0000                           ; DC6B   0000

        PSHR    R5                              ; DC6C   0275
        SDBD                                    ; DC6D   0001
        MVII    #$7D52, R0                      ; DC6E   02B8 0052 007D

        JSR     R5,     G_7D1D                  ; DC71   0004 017C 011D

        B       L_DC98                          ; DC74   0200 0022

        PSHR    R5                              ; DC76   0275
        MVII    #$0003, R1                      ; DC77   02B9 0003

        JSR     R5,     L_5DBF                  ; DC79   0004 015C 01BF

        SDBD                                    ; DC7C   0001
        MVII    #$7CBC, R0                      ; DC7D   02B8 00BC 007C

        JSR     R5,     G_7D1D                  ; DC80   0004 017C 011D

        SDBD                                    ; DC83   0001
        MVII    #$7CBC, R0                      ; DC84   02B8 00BC 007C

        JSR     R5,     G_7D1D                  ; DC87   0004 017C 011D

        SDBD                                    ; DC8A   0001
        MVII    #$7CBC, R0                      ; DC8B   02B8 00BC 007C

        JSR     R5,     G_7D1D                  ; DC8E   0004 017C 011D

        SDBD                                    ; DC91   0001
        MVII    #$7CBC, R0                      ; DC92   02B8 00BC 007C

        JSR     R5,     G_7D1D                  ; DC95   0004 017C 011D
L_DC98:
        JSR     R5,     L_5B0C                  ; DC98   0004 0158 030C
        JSR     R5,     L_5D66                  ; DC9B   0004 015C 0166
        JSR     R5,     .HEADER                 ; DC9E   0004 0150 0000
        JSR     R5,     G_72A1                  ; DCA1   0004 0170 02A1

        SDBD                                    ; DCA4   0001
        MVII    #$7E0C, R0                      ; DCA5   02B8 000C 007E
        MVO     R0,     .ISRVEC.0               ; DCA8   0240 0100
        SWAP    R0,     1                       ; DCAA   0040
        MVO     R0,     .ISRVEC.1               ; DCAB   0240 0101
L_DCAD:
        SDBD                                    ; DCAD   0001
        MVII    #$70BB, R0                      ; DCAE   02B8 00BB 0070
        MVII    #$0100, R4                      ; DCB1   02BC 0100
        SDBD                                    ; DCB3   0001
        CMP@    R4,     R0                      ; DCB4   0360
        BNEQ    L_DCAD                          ; DCB5   022C 0009

        JSR     R5,     L_6D54                  ; DCB7   0004 016C 0154

        PULR    R7                              ; DCBA   02B7
        PULR    R7                              ; DCBB   02B7
        PSHR    R5                              ; DCBC   0275
        DIS                                     ; DCBD   0003
        CLRR    R0                              ; DCBE   01C0
        MVO     R0,     .STIC.X.1               ; DCBF   0240 0001
        MVO     R0,     .STIC.A.1               ; DCC1   0240 0011
        MVO     R0,     G_016A                  ; DCC3   0240 016A

        JSR     R5,     G_7E2B                  ; DCC5   0004 017C 022B

        SDBD                                    ; DCC8   0001
        MVII    #$7CD3, R0                      ; DCC9   02B8 00D3 007C
        MVO     R0,     .ISRVEC.0               ; DCCC   0240 0100
        SWAP    R0,     1                       ; DCCE   0040
        MVO     R0,     .ISRVEC.1               ; DCCF   0240 0101
        EIS                                     ; DCD1   0002
        PULR    R7                              ; DCD2   02B7
        PSHR    R5                              ; DCD3   0275
        MVO     R0,     .STIC.VIDEN             ; DCD4   0240 0020
        MVI     G_016B, R0                      ; DCD6   0280 016B
        DECR    R0                              ; DCD8   0010
        MVO     R0,     G_016B                  ; DCD9   0240 016B
        BNEQ    L_DE05                          ; DCDB   020C 0128

        MVII    #$0002, R0                      ; DCDD   02B8 0002
        MVO     R0,     G_016B                  ; DCDF   0240 016B
        MVI     G_016A, R1                      ; DCE1   0281 016A
        MOVR    R1,     R0                      ; DCE3   0088
        INCR    R0                              ; DCE4   0008
        ANDI    #$000F, R0                      ; DCE5   03B8 000F
        MVO     R0,     G_016A                  ; DCE7   0240 016A
        BEQ     L_DDFC                          ; DCE9   0204 0111

        MVII    #$0000, R0                      ; DCEB   02B8 0000
        MVO     R0,     .STIC.CS.0              ; DCED   0240 0028

        JSR     R5,     G_7FD5                  ; DCEF   0004 017C 03D5

        ANDI    #$0030, R0                      ; DCF2   03B8 0030
        BNEQ    L_DCFA                          ; DCF4   020C 0004

        MVII    #$000D, R0                      ; DCF6   02B8 000D
        MVO     R0,     .STIC.CS.0              ; DCF8   0240 0028
L_DCFA:
        SDBD                                    ; DCFA   0001
        MVII    #$7FB9, R4                      ; DCFB   02BC 00B9 007F
L_DCFE:
        MVI@    R4,     R2                      ; DCFE   02A2
        MVI@    R4,     R3                      ; DCFF   02A3
        PSHR    R4                              ; DD00   0274

        JSR     R5,     G_7D80                  ; DD01   0004 017C 0180

        PULR    R4                              ; DD04   02B4
        MVI@    R4,     R1                      ; DD05   02A1
        PSHR    R4                              ; DD06   0274
        NEGR    R1                              ; DD07   0021
        ADD     G_016A, R1                      ; DD08   02C1 016A
        BMI     L_DD0F                          ; DD0A   020B 0003

        JSR     R5,     G_7DAF                  ; DD0C   0004 017C 01AF

L_DD0F:
        PULR    R4                              ; DD0F   02B4
        SDBD                                    ; DD10   0001
        CMPI    #$7FC5, R4                      ; DD11   037C 00C5 007F
        BLT     L_DCFE                          ; DD14   0225 0017

        JSR     R5,     G_757E                  ; DD16   0004 0174 017E
        JSR     R5,     L_55DC                  ; DD19   0004 0154 01DC

        PULR    R7                              ; DD1C   02B7
        PSHR    R5                              ; DD1D   0275
        MVO     R0,     .ISRVEC.0               ; DD1E   0240 0100
        SWAP    R0,     1                       ; DD20   0040
        MVO     R0,     .ISRVEC.1               ; DD21   0240 0101
        MVII    #$0008, R0                      ; DD23   02B8 0008
        MVII    #$020B, R4                      ; DD25   02BC 020B

        JSR     R5,     L_6F9A                  ; DD27   0004 016C 039A

        MVII    #$0008, R0                      ; DD2A   02B8 0008
L_DD2C:
        MVII    #$021F, R4                      ; DD2C   02BC 021F

        JSR     R5,     L_6F9A                  ; DD2E   0004 016C 039A

        MVII    #$023C, R3                      ; DD31   02BB 023C
        CLRR    R2                              ; DD33   01D2
        MVII    #$00B4, R0                      ; DD34   02B8 00B4
L_DD36:
        MVI@    R3,     R1                      ; DD36   0299
        ANDI    #$01F8, R1                      ; DD37   03B9 01F8
        CMPI    #$0040, R1                      ; DD39   0379 0040
        BMI     L_DD3E                          ; DD3B   020B 0001

        MVO@    R2,     R3                      ; DD3D   025A
L_DD3E:
        INCR    R3                              ; DD3E   000B
        DECR    R0                              ; DD3F   0010
        BNEQ    L_DD36                          ; DD40   022C 000B

        MVII    #$0007, R0                      ; DD42   02B8 0007
        MVO     R0,     G_016B                  ; DD44   0240 016B
L_DD46:
        EIS                                     ; DD46   0002
        MVII    #$0100, R4                      ; DD47   02BC 0100
        SDBD                                    ; DD49   0001
        MVI@    R4,     R0                      ; DD4A   02A0
        SDBD                                    ; DD4B   0001
        CMPI    #$7E28, R0                      ; DD4C   0378 0028 007E
        BNEQ    L_DD46                          ; DD4F   022C 000A

        PULR    R7                              ; DD51   02B7
        PSHR    R5                              ; DD52   0275
        DIS                                     ; DD53   0003
        MVII    #$0008, R0                      ; DD54   02B8 0008
        MVII    #$0010, R4                      ; DD56   02BC 0010

        JSR     R5,     L_6F9A                  ; DD58   0004 016C 039A

        MVII    #$0007, R0                      ; DD5B   02B8 0007
        MVII    #$0001, R4                      ; DD5D   02BC 0001

        JSR     R5,     L_6F9A                  ; DD5F   0004 016C 039A

        CLRR    R0                              ; DD62   01C0
        MVO     R0,     G_016A                  ; DD63   0240 016A

        JSR     R5,     G_7E2B                  ; DD65   0004 017C 022B

        MVI     .STIC.X.0,R2                    ; DD68   0282 0000
        MVI     .STIC.Y.0,R3                    ; DD6A   0283 0008

        JSR     R5,     G_7D80                  ; DD6C   0004 017C 0180

        SDBD                                    ; DD6F   0001
        MVII    #$7D96, R0                      ; DD70   02B8 0096 007D
        MVO     R0,     .ISRVEC.0               ; DD73   0240 0100
        SWAP    R0,     1                       ; DD75   0040
        MVO     R0,     .ISRVEC.1               ; DD76   0240 0101
        EIS                                     ; DD78   0002

        JSR     R5,     G_757E                  ; DD79   0004 0174 017E
        JSR     R5,     L_55DC                  ; DD7C   0004 0154 01DC

        PULR    R7                              ; DD7F   02B7
        PSHR    R5                              ; DD80   0275
        ANDI    #$00F8, R2                      ; DD81   03BA 00F8
        SUBI    #$0004, R2                      ; DD83   033A 0004
        SLR     R2,     2                       ; DD85   0066
        SLR     R2,     1                       ; DD86   0062
        MVO     R2,     G_0169                  ; DD87   0242 0169
        ANDI    #$0078, R3                      ; DD89   03BB 0078
        SUBI    #$0006, R3                      ; DD8B   033B 0006
        SLR     R3,     1                       ; DD8D   0063
        ADDR    R3,     R2                      ; DD8E   00DA
        SLL     R3,     2                       ; DD8F   004F
        ADDR    R3,     R2                      ; DD90   00DA
        ADDI    #$01A6, R2                      ; DD91   02FA 01A6
        MVO     R2,     G_0345                  ; DD93   0242 0345
        PULR    R7                              ; DD95   02B7
        PSHR    R5                              ; DD96   0275
        MVO     R0,     .STIC.VIDEN             ; DD97   0240 0020
        MVI     G_016B, R0                      ; DD99   0280 016B
        DECR    R0                              ; DD9B   0010
        MVO     R0,     G_016B                  ; DD9C   0240 016B
        BNEQ    L_DE05                          ; DD9E   020C 0065

        MVII    #$0007, R0                      ; DDA0   02B8 0007
        MVO     R0,     G_016B                  ; DDA2   0240 016B
        MVI     G_016A, R1                      ; DDA4   0281 016A
        MOVR    R1,     R0                      ; DDA6   0088
        INCR    R0                              ; DDA7   0008
        ANDI    #$000F, R0                      ; DDA8   03B8 000F
        MVO     R0,     G_016A                  ; DDAA   0240 016A
        BEQ     L_DDFC                          ; DDAC   0204 004E

        PULR    R5                              ; DDAE   02B5
        PSHR    R5                              ; DDAF   0275
        MOVR    R1,     R5                      ; DDB0   008D
        CMPI    #$0006, R5                      ; DDB1   037D 0006
        BGE     L_DE05                          ; DDB3   020D 0050

        SDBD                                    ; DDB5   0001
        ADDI    #$7FA9, R1                      ; DDB6   02F9 00A9 007F
        MVI@    R1,     R1                      ; DDB9   0289
        SARC    R1,     1                       ; DDBA   0079
        SWAP    R1,     1                       ; DDBB   0041
        BNC     L_DDC0                          ; DDBC   0209 0002

        XORI    #$0010, R1                      ; DDBE   03F9 0010
L_DDC0:
        XORI    #$0008, R1                      ; DDC0   03F9 0008
        SWAP    R1,     1                       ; DDC2   0041
        ADDR    R5,     R5                      ; DDC3   00ED
        SDBD                                    ; DDC4   0001
        ADDI    #$7F9D, R5                      ; DDC5   02FD 009D 007F
        SDBD                                    ; DDC8   0001
        MVI@    R5,     R0                      ; DDC9   02A8
        MOVR    R0,     R5                      ; DDCA   0085
L_DDCB:
        MVI@    R5,     R3                      ; DDCB   02AB
        CMPI    #$00FF, R3                      ; DDCC   037B 00FF
        BEQ     L_DE05                          ; DDCE   0204 0035

        MOVR    R3,     R2                      ; DDD0   009A
        ANDI    #$000F, R2                      ; DDD1   03BA 000F
        MOVR    R3,     R4                      ; DDD3   009C
        ANDI    #$00F0, R3                      ; DDD4   03BB 00F0
        SLR     R3,     2                       ; DDD6   0067
        ADDR    R4,     R3                      ; DDD7   00E3
        ADD     G_0345, R3                      ; DDD8   02C3 0345
L_DDDA:
        MVI@    R5,     R4                      ; DDDA   02AC
        PSHR    R2                              ; DDDB   0272
        CMPI    #$023C, R3                      ; DDDC   037B 023C
        BLT     L_DDF3                          ; DDDE   0205 0013

        CMPI    #$02F0, R3                      ; DDE0   037B 02F0
        BGE     L_DDF3                          ; DDE2   020D 000F

        SUBI    #$0005, R2                      ; DDE4   033A 0005
        ADD     G_0169, R2                      ; DDE6   02C2 0169
        BLT     L_DDF3                          ; DDE8   0205 0009

        CMPI    #$0014, R2                      ; DDEA   037A 0014
        BGE     L_DDF3                          ; DDEC   020D 0005

        MOVR    R4,     R0                      ; DDEE   00A0
        ANDI    #$01F8, R0                      ; DDEF   03B8 01F8
        XORR    R1,     R0                      ; DDF1   01C8
        MVO@    R0,     R3                      ; DDF2   0258
L_DDF3:
        INCR    R3                              ; DDF3   000B
        PULR    R2                              ; DDF4   02B2
        INCR    R2                              ; DDF5   000A
        ANDI    #$0001, R4                      ; DDF6   03BC 0001
        BEQ     L_DDDA                          ; DDF8   0224 001F
        B       L_DDCB                          ; DDFA   0220 0030

L_DDFC:
        SDBD                                    ; DDFC   0001
        MVII    #$7E28, R0                      ; DDFD   02B8 0028 007E
        MVO     R0,     .ISRVEC.0               ; DE00   0240 0100
        SWAP    R0,     1                       ; DE02   0040
        MVO     R0,     .ISRVEC.1               ; DE03   0240 0101

L_DE05:
        JSR     R5,     G_757E                  ; DE05   0004 0174 017E
        JSR     R5,     L_55DC                  ; DE08   0004 0154 01DC

        PULR    R7                              ; DE0B   02B7
        PSHR    R5                              ; DE0C   0275

        JSR     R5,     L_62BA                  ; DE0D   0004 0160 02BA
        JSR     R5,     L_6EF3                  ; DE10   0004 016C 02F3

        SDBD                                    ; DE13   0001
        MVII    #$3840, R4                      ; DE14   02BC 0040 0038
        MVII    #$0080, R0                      ; DE17   02B8 0080

        JSR     R5,     L_6F9A                  ; DE19   0004 016C 039A

        MVO     R0,     .STIC.VIDEN             ; DE1C   0240 0020
        SDBD                                    ; DE1E   0001
        MVII    #$70BB, R0                      ; DE1F   02B8 00BB 0070
        MVO     R0,     .ISRVEC.0               ; DE22   0240 0100
        SWAP    R0,     1                       ; DE24   0040
        MVO     R0,     .ISRVEC.1               ; DE25   0240 0101
        PULR    R7                              ; DE27   02B7
        MVO     R0,     .STIC.VIDEN             ; DE28   0240 0020
        MOVR    R5,     R7                      ; DE2A   00AF
        PSHR    R5                              ; DE2B   0275
        SDBD                                    ; DE2C   0001
        MVII    #$7E4C, R5                      ; DE2D   02BD 004C 007E
        SDBD                                    ; DE30   0001
        MVII    #$3928, R4                      ; DE31   02BC 0028 0039
        MVII    #$0088, R3                      ; DE34   02BB 0088
L_DE36:
        MVI@    R5,     R0                      ; DE36   02A8
        MVO@    R0,     R4                      ; DE37   0260
        DECR    R3                              ; DE38   0013
        BNEQ    L_DE36                          ; DE39   022C 0004

        SDBD                                    ; DE3B   0001
        MVII    #$3840, R4                      ; DE3C   02BC 0040 0038
        MVII    #$0058, R3                      ; DE3F   02BB 0058
        SDBD                                    ; DE41   0001
        MVII    #$7ECB, R2                      ; DE42   02BA 00CB 007E
L_DE45:
        MVI@    R2,     R0                      ; DE45   0290
        MVO@    R0,     R4                      ; DE46   0260
        DECR    R2                              ; DE47   0012
        DECR    R3                              ; DE48   0013
        BNEQ    L_DE45                          ; DE49   022C 0005

        PULR    R7                              ; DE4B   02B7
        SLL     R0,     1                       ; DE4C   0048
        DECLE   $0000                           ; DE4D   0000

        INCR    R1                              ; DE4E   0009
        DECLE   $0000                           ; DE4F   0000

        NEGR    R0                              ; DE50   0020
        DECLE   $0000                           ; DE51   0000

        SWAP    R0,     2                       ; DE52   0044
        DECLE   $0000                           ; DE53   0000

        INCR    R0                              ; DE54   0008
        TSTR    R0                              ; DE55   0080
        DECLE   $0000                           ; DE56   0000

        JSR     R4,     .STIC.X.0               ; DE57   0004 0000 0000

        SWAP    R0,     1                       ; DE5A   0040
        DECLE   $0000,  $0000                   ; DE5B   0000 0000

        DECR    R0                              ; DE5D   0010
        DECLE   $0000,  $0000                   ; DE5E   0000 0000

        EIS                                     ; DE60   0002
        NEGR    R0                              ; DE61   0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE62   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE66   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; DE6A   0000 0000

        DECR    R4                              ; DE6C   0014
        NEGR    R0                              ; DE6D   0020
        INCR    R2                              ; DE6E   000A
        RLC     R0,     1                       ; DE6F   0050
        DECLE   $0001                           ; DE70   0001

        ADCR    R2                              ; DE71   002A
        MOVR    R0,     R4                      ; DE72   0084
        RLC     R2,     1                       ; DE73   0052
        MOVR    R2,     R0                      ; DE74   0090
        NEGR    R0                              ; DE75   0020
        MOVR    R1,     R0                      ; DE76   0088
        RLC     R2,     1                       ; DE77   0052
        SLL     R0,     1                       ; DE78   0048
        NEGR    R4                              ; DE79   0024
        INCR    R2                              ; DE7A   000A
        RLC     R0,     1                       ; DE7B   0050
        RLC     R0,     1                       ; DE7C   0050
        NEGR    R4                              ; DE7D   0024
        MOVR    R5,     R0                      ; DE7E   00A8
        RLC     R1,     2                       ; DE7F   0055
        MOVR    R5,     R2                      ; DE80   00AA
        DECLE   $0001                           ; DE81   0001

        TSTR    R4                              ; DE82   00A4
        EIS                                     ; DE83   0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE84   0000 0000 0000 0000

        TSTR    R0                              ; DE88   0080
        SWAP    R0,     1                       ; DE89   0040
        MOVR    R4,     R0                      ; DE8A   00A0
        SWAP    R0,     1                       ; DE8B   0040
        DECLE   $0000,  $0000,  $0000           ; DE8C   0000 0000 0000

        RLC     R0,     1                       ; DE8F   0050
        ADCR    R0                              ; DE90   0028
        RLC     R2,     1                       ; DE91   0052
        INCR    R1                              ; DE92   0009
        SWAP    R2,     1                       ; DE93   0042
        DECLE   $0000                           ; DE94   0000

        RLC     R0,     1                       ; DE95   0050
        MOVR    R2,     R5                      ; DE96   0095
        SLL     R2,     1                       ; DE97   004A
        DECR    R2                              ; DE98   0012
        SWAP    R1,     2                       ; DE99   0045
        DECLE   $0000                           ; DE9A   0000

        NEGR    R4                              ; DE9B   0024
        MOVR    R5,     R2                      ; DE9C   00AA
        MOVR    R2,     R5                      ; DE9D   0095
        SLL     R0,     1                       ; DE9E   0048
        EIS                                     ; DE9F   0002
        SWAP    R0,     2                       ; DEA0   0044
        EIS                                     ; DEA1   0002

        JSRE    R4,     .ECSRAM.025             ; DEA2   0004 0041 0025

        SLL     R2,     1                       ; DEA5   004A
        MOVR    R2,     R4                      ; DEA6   0094
        ADCR    R0                              ; DEA7   0028
        SWAP    R2,     1                       ; DEA8   0042
        DECR    R0                              ; DEA9   0010
        INCR    R0                              ; DEAA   0008
        TSTR    R0                              ; DEAB   0080
        DECLE   $0000,  $0000                   ; DEAC   0000 0000

        INCR    R0                              ; DEAE   0008
        DECR    R2                              ; DEAF   0012
        SLL     R1,     1                       ; DEB0   0049
        RLC     R2,     1                       ; DEB1   0052
        TSTR    R4                              ; DEB2   00A4

        JSR     R4,     G_2411                  ; DEB3   0004 0024 0011

        RLC     R0,     2                       ; DEB6   0054
        MOVR    R5,     R1                      ; DEB7   00A9
        RLC     R0,     1                       ; DEB8   0050
        MOVR    R1,     R0                      ; DEB9   0088
        RLC     R2,     1                       ; DEBA   0052
        MOVR    R2,     R1                      ; DEBB   0091
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEBC   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0005           ; DEC0   0001 0000 0005

        INCR    R0                              ; DEC3   0008
        DECR    R4                              ; DEC4   0014
        INCR    R2                              ; DEC5   000A
        DECR    R4                              ; DEC6   0014
        NEGR    R2                              ; DEC7   0022
        RLC     R0,     2                       ; DEC8   0054
        NEGR    R2                              ; DEC9   0022
        SLL     R0,     1                       ; DECA   0048
        NEGR    R4                              ; DECB   0024
        RLC     R0,     2                       ; DECC   0054
        MOVR    R5,     R0                      ; DECD   00A8
        RLC     R0,     1                       ; DECE   0050
        MOVR    R5,     R0                      ; DECF   00A8
        RLC     R2,     1                       ; DED0   0052
        MOVR    R2,     R0                      ; DED1   0090
        SLL     R0,     1                       ; DED2   0048
        MOVR    R4,     R2                      ; DED3   00A2
        EIS                                     ; DED4   0002
        ANDR    R3,     R0                      ; DED5   0198
        ANDR    R1,     R0                      ; DED6   0188
        ANDR    R0,     R0                      ; DED7   0180
        CMPR    R7,     R0                      ; DED8   0178
        CMPR    R6,     R0                      ; DED9   0170
        CMPR    R5,     R0                      ; DEDA   0168
        CMPR    R4,     R1                      ; DEDB   0161
        DECR    R1                              ; DEDC   0011
        ANDR    R3,     R0                      ; DEDD   0198
        ANDR    R2,     R0                      ; DEDE   0190
        SUBR    R5,     R0                      ; DEDF   0128
        SUBR    R6,     R0                      ; DEE0   0130
        SUBR    R5,     R0                      ; DEE1   0128
        SUBR    R6,     R0                      ; DEE2   0130
        SUBR    R5,     R0                      ; DEE3   0128
        CMPR    R3,     R0                      ; DEE4   0158
        CMPR    R4,     R1                      ; DEE5   0161
        NEGR    R1                              ; DEE6   0021
        ANDR    R4,     R0                      ; DEE7   01A0
        SUBR    R5,     R0                      ; DEE8   0128
        SUBR    R6,     R0                      ; DEE9   0130
        SUBR    R7,     R0                      ; DEEA   0138
        SUBR    R7,     R0                      ; DEEB   0138
        SUBR    R7,     R0                      ; DEEC   0138
        SUBR    R6,     R0                      ; DEED   0130
        SUBR    R5,     R0                      ; DEEE   0128
        CMPR    R2,     R1                      ; DEEF   0151
        GSWD    R1                              ; DEF0   0031
        ANDR    R5,     R0                      ; DEF1   01A8
        SUBR    R5,     R0                      ; DEF2   0128
        SUBR    R6,     R0                      ; DEF3   0130
        SUBR    R7,     R0                      ; DEF4   0138
        CMPR    R0,     R0                      ; DEF5   0140
        SUBR    R7,     R0                      ; DEF6   0138
        SUBR    R6,     R0                      ; DEF7   0130
        SUBR    R5,     R0                      ; DEF8   0128
        CMPR    R1,     R1                      ; DEF9   0149
        SWAP    R1,     1                       ; DEFA   0041
        ANDR    R5,     R0                      ; DEFB   01A8
        SUBR    R5,     R0                      ; DEFC   0128
        SUBR    R6,     R0                      ; DEFD   0130
        SUBR    R7,     R0                      ; DEFE   0138
        CMPR    R0,     R0                      ; DEFF   0140
        SUBR    R7,     R0                      ; DF00   0138
        SUBR    R6,     R0                      ; DF01   0130
        SUBR    R5,     R0                      ; DF02   0128
        CMPR    R1,     R1                      ; DF03   0149
        RLC     R1,     1                       ; DF04   0051
        ANDR    R5,     R0                      ; DF05   01A8
        SUBR    R5,     R0                      ; DF06   0128
        SUBR    R6,     R0                      ; DF07   0130
        SUBR    R7,     R0                      ; DF08   0138
        CMPR    R0,     R0                      ; DF09   0140
        SUBR    R7,     R0                      ; DF0A   0138
        SUBR    R6,     R0                      ; DF0B   0130
        SUBR    R5,     R0                      ; DF0C   0128
        CMPR    R1,     R1                      ; DF0D   0149
        SLR     R1,     1                       ; DF0E   0061
        SWAP    R0,     1                       ; DF0F   0040
        SUBR    R5,     R0                      ; DF10   0128
        SUBR    R6,     R0                      ; DF11   0130
        SUBR    R7,     R0                      ; DF12   0138
        SUBR    R7,     R0                      ; DF13   0138
        SUBR    R7,     R0                      ; DF14   0138
        SUBR    R6,     R0                      ; DF15   0130
        SUBR    R5,     R0                      ; DF16   0128
        MOVR    R2,     R1                      ; DF17   0091
        RRC     R1,     1                       ; DF18   0071
        SLL     R0,     1                       ; DF19   0048
        RLC     R0,     1                       ; DF1A   0050
        SUBR    R5,     R0                      ; DF1B   0128
        SUBR    R6,     R0                      ; DF1C   0130
        SUBR    R5,     R0                      ; DF1D   0128
        SUBR    R6,     R0                      ; DF1E   0130
        SUBR    R5,     R0                      ; DF1F   0128
        MOVR    R1,     R0                      ; DF20   0088
        MOVR    R0,     R1                      ; DF21   0081
        MOVR    R0,     R2                      ; DF22   0082
        SLL     R0,     1                       ; DF23   0048
        SLLC    R0,     1                       ; DF24   0058
        SLR     R0,     1                       ; DF25   0060
        SAR     R0,     1                       ; DF26   0068
        RRC     R0,     1                       ; DF27   0070
        SARC    R0,     1                       ; DF28   0078
        MOVR    R0,     R1                      ; DF29   0081
        ADDR    R7,     R7                      ; DF2A   00FF
        DECR    R2                              ; DF2B   0012
        ANDR    R3,     R0                      ; DF2C   0198
        ANDR    R1,     R0                      ; DF2D   0188
        ANDR    R0,     R0                      ; DF2E   0180
        CMPR    R7,     R0                      ; DF2F   0178
        CMPR    R6,     R0                      ; DF30   0170
        CMPR    R5,     R0                      ; DF31   0168
        CMPR    R4,     R1                      ; DF32   0161
        NEGR    R1                              ; DF33   0021
        ANDR    R3,     R0                      ; DF34   0198
        ANDR    R2,     R0                      ; DF35   0190
        SUBR    R5,     R0                      ; DF36   0128
        SUBR    R6,     R0                      ; DF37   0130
        SUBR    R5,     R0                      ; DF38   0128
        SUBR    R6,     R0                      ; DF39   0130
        SUBR    R5,     R0                      ; DF3A   0128
        CMPR    R3,     R0                      ; DF3B   0158
        CMPR    R4,     R1                      ; DF3C   0161
        GSWD    R1                              ; DF3D   0031
        ANDR    R4,     R0                      ; DF3E   01A0
        SUBR    R5,     R0                      ; DF3F   0128
        SUBR    R6,     R0                      ; DF40   0130
        SUBR    R7,     R0                      ; DF41   0138
        SUBR    R7,     R0                      ; DF42   0138
        SUBR    R7,     R0                      ; DF43   0138
        SUBR    R6,     R0                      ; DF44   0130
        SUBR    R5,     R0                      ; DF45   0128
        CMPR    R2,     R1                      ; DF46   0151
        SWAP    R1,     1                       ; DF47   0041
        ANDR    R5,     R0                      ; DF48   01A8
        SUBR    R5,     R0                      ; DF49   0128
        SUBR    R6,     R0                      ; DF4A   0130
        SUBR    R7,     R0                      ; DF4B   0138
        CMPR    R0,     R0                      ; DF4C   0140
        SUBR    R7,     R0                      ; DF4D   0138
        SUBR    R6,     R0                      ; DF4E   0130
        SUBR    R5,     R0                      ; DF4F   0128
        CMPR    R1,     R1                      ; DF50   0149
        RLC     R1,     1                       ; DF51   0051
        SWAP    R0,     1                       ; DF52   0040
        SUBR    R5,     R0                      ; DF53   0128
        SUBR    R6,     R0                      ; DF54   0130
        SUBR    R7,     R0                      ; DF55   0138
        SUBR    R7,     R0                      ; DF56   0138
        SUBR    R7,     R0                      ; DF57   0138
        SUBR    R6,     R0                      ; DF58   0130
        SUBR    R5,     R0                      ; DF59   0128
        MOVR    R2,     R1                      ; DF5A   0091
        SLR     R1,     1                       ; DF5B   0061
        SLL     R0,     1                       ; DF5C   0048
        RLC     R0,     1                       ; DF5D   0050
        SUBR    R5,     R0                      ; DF5E   0128
        SUBR    R6,     R0                      ; DF5F   0130
        SUBR    R5,     R0                      ; DF60   0128
        SUBR    R6,     R0                      ; DF61   0130
        SUBR    R5,     R0                      ; DF62   0128
        MOVR    R1,     R0                      ; DF63   0088
        MOVR    R0,     R1                      ; DF64   0081
        RRC     R2,     1                       ; DF65   0072
        SLL     R0,     1                       ; DF66   0048
        SLLC    R0,     1                       ; DF67   0058
        SLR     R0,     1                       ; DF68   0060
        SAR     R0,     1                       ; DF69   0068
        RRC     R0,     1                       ; DF6A   0070
        SARC    R0,     1                       ; DF6B   0078
        MOVR    R0,     R1                      ; DF6C   0081
        ADDR    R7,     R7                      ; DF6D   00FF
        NEGR    R3                              ; DF6E   0023
        ANDR    R3,     R0                      ; DF6F   0198
        ANDR    R1,     R0                      ; DF70   0188
        CMPR    R7,     R0                      ; DF71   0178
        CMPR    R5,     R0                      ; DF72   0168
        CMPR    R4,     R1                      ; DF73   0161
        GSWD    R3                              ; DF74   0033
        ANDR    R4,     R0                      ; DF75   01A0
        SUBR    R5,     R0                      ; DF76   0128
        SUBR    R6,     R0                      ; DF77   0130
        SUBR    R5,     R0                      ; DF78   0128
        CMPR    R2,     R1                      ; DF79   0151
        SWAP    R3,     1                       ; DF7A   0043
        ANDR    R5,     R0                      ; DF7B   01A8
        SUBR    R5,     R0                      ; DF7C   0128
        SUBR    R6,     R0                      ; DF7D   0130
        SUBR    R5,     R0                      ; DF7E   0128
        CMPR    R1,     R1                      ; DF7F   0149
        RLC     R3,     1                       ; DF80   0053
        SWAP    R0,     1                       ; DF81   0040
        SUBR    R5,     R0                      ; DF82   0128
        SUBR    R6,     R0                      ; DF83   0130
        SUBR    R5,     R0                      ; DF84   0128
        MOVR    R2,     R1                      ; DF85   0091
        SLR     R3,     1                       ; DF86   0063
        SLL     R0,     1                       ; DF87   0048
        SLLC    R0,     1                       ; DF88   0058
        SAR     R0,     1                       ; DF89   0068
        SARC    R0,     1                       ; DF8A   0078
        MOVR    R0,     R1                      ; DF8B   0081
        ADDR    R7,     R7                      ; DF8C   00FF
        NOP                                     ; DF8D   0034
        ANDR    R1,     R0                      ; DF8E   0188
        CMPR    R7,     R0                      ; DF8F   0178
        CMPR    R5,     R1                      ; DF90   0169
        SWAP    R0,     2                       ; DF91   0044
        ANDR    R5,     R0                      ; DF92   01A8
        SUBR    R5,     R0                      ; DF93   0128
        CMPR    R1,     R1                      ; DF94   0149
        RLC     R0,     2                       ; DF95   0054
        SLLC    R0,     1                       ; DF96   0058
        SAR     R0,     1                       ; DF97   0068
        SARC    R1,     1                       ; DF98   0079
        ADDR    R7,     R7                      ; DF99   00FF
        SWAP    R1,     2                       ; DF9A   0045
        CMPR    R3,     R1                      ; DF9B   0159
        ADDR    R7,     R7                      ; DF9C   00FF
        MOVR    R3,     R2                      ; DF9D   009A
        SARC    R3,     2                       ; DF9E   007F
        MOVR    R1,     R5                      ; DF9F   008D
        SARC    R3,     2                       ; DFA0   007F
        SAR     R2,     2                       ; DFA1   006E
        SARC    R3,     2                       ; DFA2   007F
        ADCR    R3                              ; DFA3   002B
        SARC    R3,     2                       ; DFA4   007F
        ADDR    R2,     R4                      ; DFA5   00D4
        SARC    R2,     2                       ; DFA6   007E
        ADDR    R2,     R4                      ; DFA7   00D4
        SARC    R2,     2                       ; DFA8   007E
        INCR    R6                              ; DFA9   000E
        INCR    R4                              ; DFAA   000C
        CLRC                                    ; DFAB   0006
        DECLE   $0005                           ; DFAC   0005

        JSR     R4,     .STIC.X.0               ; DFAD   0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFB4   0000 0000 0000 0000
        DECLE   $0000                           ; DFB8   0000

        ADCR    R4                              ; DFB9   002C
        SLLC    R0,     2                       ; DFBA   005C
        DECLE   $0001                           ; DFBB   0001

        MOVR    R1,     R4                      ; DFBC   008C
        RLC     R1,     2                       ; DFBD   0055
        DIS                                     ; DFBE   0003
        SAR     R0,     2                       ; DFBF   006C
        SLLC    R0,     2                       ; DFC0   005C
        INCR    R0                              ; DFC1   0008
        RSWD    R4                              ; DFC2   003C
        RLC     R2,     2                       ; DFC3   0056
        INCR    R5                              ; DFC4   000D
        MVII    #$0010, R4                      ; DFC5   02BC 0010
L_DFC7:
        SLLC    R2,     1                       ; DFC7   005A
        RLC     R3,     1                       ; DFC8   0053
        CLRC                                    ; DFC9   0006
        INCR    R2                              ; DFCA   000A
        SUBR    R1,     R3                      ; DFCB   010B
        BPL     L_DFD1                          ; DFCC   0203 0003

        ADDR    R1,     R3                      ; DFCE   00CB
        SAR     R2,     1                       ; DFCF   006A
        SLL     R2,     1                       ; DFD0   004A
L_DFD1:
        DECR    R4                              ; DFD1   0014
        BNEQ    L_DFC7                          ; DFD2   022C 000C

        MOVR    R5,     R7                      ; DFD4   00AF
        PSHR    R1                              ; DFD5   0271
        MVI     G_0346, R0                      ; DFD6   0280 0346
        MOVR    R0,     R1                      ; DFD8   0081
        SLL     R0,     2                       ; DFD9   004C
        SLL     R0,     2                       ; DFDA   004C
        ADDR    R1,     R0                      ; DFDB   00C8
        ADDI    #$0025, R0                      ; DFDC   02F8 0025
        MVO     R0,     G_0346                  ; DFDE   0240 0346
        PULR    R1                              ; DFE0   02B1
        MOVR    R5,     R7                      ; DFE1   00AF
        PSHR    R5                              ; DFE2   0275
        PSHR    R0                              ; DFE3   0270
        MVI     G_0346, R0                      ; DFE4   0280 0346
        MOVR    R0,     R5                      ; DFE6   0085
        SLL     R0,     2                       ; DFE7   004C
        SLL     R0,     2                       ; DFE8   004C
        ADDR    R5,     R0                      ; DFE9   00E8
        ADDI    #$0025, R0                      ; DFEA   02F8 0025
        MVO     R0,     G_0346                  ; DFEC   0240 0346
        MOVR    R0,     R5                      ; DFEE   0085
        PULR    R0                              ; DFEF   02B0
        PULR    R7                              ; DFF0   02B7
        CMP@    R1,     R4                      ; DFF1   034C
        SLL     R0,     2                       ; DFF2   004C
        SUB     .STIC.X.0,R0                    ; DFF3   0300 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF5   0000 0000 0000 0000
        DECLE   $0000                           ; DFF9   0000

        ADDR    R7,     R7                      ; DFFA   00FF
        DECLE   $0000                           ; DFFB   0000

        DECR    R0                              ; DFFC   0010
        DECLE   $0000,  $0000,  $0000           ; DFFD   0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;; ======================================================================== ;;
