
        ORG     $5000
.HEADER:
        JSRD    R5,     X_INIT                  ; 5000   0004 0112 0026

L_5003:
        MOVR    R5,     R7                      ; 5003   00AF
        PSHR    R0                              ; 5004   0270
        GSWD    R0                              ; 5005   0030
        PSHR    R0                              ; 5006   0270
        PSHR    R1                              ; 5007   0271
        PSHR    R2                              ; 5008   0272
        NOP                                     ; 5009   0034
        PSHR    R3                              ; 500A   0273
        PSHR    R4                              ; 500B   0274
        PSHR    R5                              ; 500C   0275
        MOVR    R7,     R5                      ; 500D   00BD
        ADDI    #$0006, R5                      ; 500E   02FD 0006
        MVII    #$0100, R4                      ; 5010   02BC 0100
        SDBD                                    ; 5012   0001
        MVI@    R4,     R7                      ; 5013   02A7
        PULR    R5                              ; 5014   02B5
        PULR    R4                              ; 5015   02B4
        PULR    R3                              ; 5016   02B3
        PULR    R2                              ; 5017   02B2
        PULR    R1                              ; 5018   02B1
        PULR    R0                              ; 5019   02B0
        RSWD    R0                              ; 501A   0038
        PULR    R0                              ; 501B   02B0
        PULR    R7                              ; 501C   02B7
        MVI@    R5,     R1                      ; 501D   02A9
        SWAP    R1,     1                       ; 501E   0041
        MVI@    R1,     R0                      ; 501F   0288
        SWAP    R0,     1                       ; 5020   0040
        ANDI    #$00FC, R0                      ; 5021   03B8 00FC
        BNEQ    L_5003                          ; 5023   022C 0021

        MOVR    R1,     R7                      ; 5025   008F
        MVII    #$02F1, R6                      ; 5026   02BE 02F1

        JSR     R5,     .EXEC.A83               ; 5028   0004 0118 0283

        MVII    #$0026, R0                      ; 502B   02B8 0026
        MVO     R0,     .ISRVEC.0               ; 502D   0240 0100
        MVII    #$0011, R0                      ; 502F   02B8 0011
        MVO     R0,     .ISRVEC.1               ; 5031   0240 0101
        SDBD                                    ; 5033   0001
        MVII    #$5014, R0                      ; 5034   02B8 0014 0050
        MVO     R0,     G_02F0                  ; 5037   0240 02F0

        JSR     R5,     X_CHK_KBD_OR_CBL        ; 5039   0004 0110 001D

        RRC     R0,     1                       ; 503C   0070

        JSR     R5,     X_CHK_KBD_OR_CBL        ; 503D   0004 0110 001D

        SLL     R0,     1                       ; 5040   0048
        MVII    #$00FE, R0                      ; 5041   02B8 00FE
        MVII    #$0102, R4                      ; 5043   02BC 0102

        JSR     R5,     X_FILL_ZERO             ; 5045   0004 0114 0338
        JSR     R5,     .EXEC.060               ; 5048   0004 0110 0060

        CMP@    R3,     R6                      ; 504B   035E
        XORI    #$0147, R7                      ; 504C   03FF 0147
        DECLE   $0001                           ; 504E   0001

        SUBR    R2,     R5                      ; 504F   0115
        INCR    R4                              ; 5050   000C
        SUBR    R2,     R6                      ; 5051   0116
        MOVR    R4,     R0                      ; 5052   00A0
        SUBR    R2,     R7                      ; 5053   0117
        INCR    R0                              ; 5054   0008
        SUBR    R3,     R0                      ; 5055   0118
        SLR     R0,     1                       ; 5056   0060
        SUBR    R3,     R1                      ; 5057   0119
        INCR    R0                              ; 5058   0008
        SUBR    R0,     R4                      ; 5059   0104
        INCR    R0                              ; 505A   0008
        SUBR    R0,     R2                      ; 505B   0102
        MOVR    R0,     R4                      ; 505C   0084
        DECLE   $0000                           ; 505D   0000
L_505E:
        MVI@    R5,     R0                      ; 505E   02A8
        MVO@    R0,     R1                      ; 505F   0248
        MVI@    R5,     R1                      ; 5060   02A9
        TSTR    R1                              ; 5061   0089
        BNEQ    L_505E                          ; 5062   022C 0005

        EIS                                     ; 5064   0002
L_5065:
        CMP     G_0102, R0                      ; 5065   0340 0102
        BEQ     L_5065                          ; 5067   0224 0003

        JSR     R5,     .EXEC.E38               ; 5069   0004 011C 0238
        JSRD    R5,     .EXEC.7B3               ; 506C   0004 0116 03B3
        JSR     R5,     .EXEC.7FE               ; 506F   0004 0114 03FE

        MVII    #$0090, R0                      ; 5072   02B8 0090
        MVO     R0,     G_0102                  ; 5074   0240 0102
        SDBD                                    ; 5076   0001
        MVII    #$1906, R0                      ; 5077   02B8 0006 0019
        MVO     R0,     G_035D                  ; 507A   0240 035D

        JSR     R5,     .EXEC.4F1               ; 507C   0004 0114 00F1
        JSR     R5,     .EXEC.41C               ; 507F   0004 0114 001C
        JSR     R5,     X_READ_ROM_HDR          ; 5082   0004 0110 00AB

        INCR    R6                              ; 5085   000E
        MVO     R5,     G_0105                  ; 5086   0245 0105
        SUBI    #$000B, R4                      ; 5088   033C 000B
        MOVR    R7,     R5                      ; 508A   00BD
        ADDI    #$0004, R5                      ; 508B   02FD 0004
        SDBD                                    ; 508D   0001
        MVI@    R4,     R7                      ; 508E   02A7
L_508F:
        EIS                                     ; 508F   0002
        MVI     G_0102, R0                      ; 5090   0280 0102
        DECR    R0                              ; 5092   0010
        BPL     L_508F                          ; 5093   0223 0005

        MVI     G_0103, R1                      ; 5095   0281 0103
        MVO     R1,     G_0102                  ; 5097   0241 0102
        NEGR    R0                              ; 5099   0020

        JSR     R5,     X_RAND1                 ; 509A   0004 0114 027D
        JSR     R5,     .EXEC.1FA               ; 509D   0004 0110 01FA
        JSR     R5,     .EXEC.7D5               ; 50A0   0004 0114 03D5
        JSR     R5,     .EXEC.4F1               ; 50A3   0004 0114 00F1
        JSR     R5,     .EXEC.AAD               ; 50A6   0004 0118 02AD

        B       L_508F                          ; 50A9   0220 001B

        MVI@    R5,     R4                      ; 50AB   02AC
        PSHR    R5                              ; 50AC   0275
        CMPI    #$000C, R4                      ; 50AD   037C 000C
        BGE     L_50B8                          ; 50AF   020D 0007

        ADD     G_02F0, R4                      ; 50B1   02C4 02F0
        SUBI    #$0014, R4                      ; 50B3   033C 0014
        SDBD                                    ; 50B5   0001
        MVI@    R4,     R5                      ; 50B6   02A5
        PULR    R7                              ; 50B7   02B7
L_50B8:
        ADD     G_02F0, R4                      ; 50B8   02C4 02F0
        SUBI    #$0014, R4                      ; 50BA   033C 0014
        MVI@    R4,     R5                      ; 50BC   02A5
        PULR    R7                              ; 50BD   02B7
L_50BE:
        SARC    R1,     2                       ; 50BE   007D
        BC      L_5100                          ; 50BF   0201 003F
        BOV     L_50D6                          ; 50C1   0202 0013

        SARC    R1,     2                       ; 50C3   007D
        BC      L_5101                          ; 50C4   0201 003B
        BOV     L_514E                          ; 50C6   0202 0086

        SARC    R1,     2                       ; 50C8   007D
        BC      L_5107                          ; 50C9   0201 003C
        BOV     L_511E                          ; 50CB   0202 0051

        MVII    #$0080, R1                      ; 50CD   02B9 0080
        MVO     R1,     .STIC.BORD              ; 50CF   0241 002C
        INCR    R1                              ; 50D1   0009
        MVO     R1,     G_0102                  ; 50D2   0241 0102
        B       L_50FE                          ; 50D4   0200 0028

L_50D6:
        MVI     .STIC.MODE,R5                   ; 50D6   0285 0021
        CLRR    R5                              ; 50D8   01ED
        MVII    #$0030, R4                      ; 50D9   02BC 0030
        MVO@    R5,     R4                      ; 50DB   0265
        MVO@    R5,     R4                      ; 50DC   0265
        MVO@    R5,     R4                      ; 50DD   0265
        MVII    #$000B, R0                      ; 50DE   02B8 000B
        MVO     R0,     .STIC.CS.0              ; 50E0   0240 0028
        MVO     R0,     .STIC.BORD              ; 50E2   0240 002C
L_50E4:
        MVO@    R0,     R5                      ; 50E4   0268
        CMPI    #$0008, R5                      ; 50E5   037D 0008
        BNEQ    L_50E4                          ; 50E7   022C 0004

        SDBD                                    ; 50E9   0001
        MVII    #$36A8, R1                      ; 50EA   02B9 00A8 0036
        MVII    #$0007, R3                      ; 50ED   02BB 0007
        MVII    #$023D, R4                      ; 50EF   02BC 023D

        JSRD    R5,     X_PRINT_R1              ; 50F1   0004 011A 0067

        MOVR    R5,     R1                      ; 50F4   00A9
        MVII    #$02C9, R4                      ; 50F5   02BC 02C9

        JSR     R5,     X_PRINT_R1              ; 50F7   0004 0118 0067

        MVII    #$0088, R0                      ; 50FA   02B8 0088
L_50FC:
        MVO     R0,     G_0102                  ; 50FC   0240 0102
L_50FE:
        MVO     R0,     .STIC.VIDEN             ; 50FE   0240 0020
L_5100:
        PULR    R7                              ; 5100   02B7
L_5101:
        MVO     R1,     G_0102                  ; 5101   0241 0102

        JSRD    R5,     X_DO_GRAM_INIT          ; 5103   0004 011E 032F

        PULR    R7                              ; 5106   02B7

L_5107:
        JSR     R5,     X_READ_ROM_HDR          ; 5107   0004 0110 00AB

        INCR    R5                              ; 510A   000D
        MVO     R5,     .STIC.EDGE              ; 510B   0245 0032
        MVI@    R4,     R0                      ; 510D   02A0
        SARC    R0,     1                       ; 510E   0078
        MVI     .STIC.MODE,R0                   ; 510F   0280 0021
        BNC     L_5115                          ; 5111   0209 0002

        MVO     R0,     .STIC.MODE              ; 5113   0240 0021
L_5115:
        MVII    #$0028, R1                      ; 5115   02B9 0028
        MVII    #$0005, R0                      ; 5117   02B8 0005

        JSR     R5,     .EXEC.730               ; 5119   0004 0114 0330

L_511C:
        MVO     R1,     G_0106                  ; 511C   0241 0106
L_511E:
        MVI     G_0106, R1                      ; 511E   0281 0106
        MVO     R1,     .STIC.BORD              ; 5120   0241 002C
        MVII    #$0003, R0                      ; 5122   02B8 0003
        B       L_50FC                          ; 5124   0220 0029

        PSHR    R5                              ; 5126   0275
        MVI     G_0102, R1                      ; 5127   0281 0102
        SWAP    R1,     1                       ; 5129   0041
        SWAP    R1,     1                       ; 512A   0041
        BMI     L_50BE                          ; 512B   022B 006E

        DECR    R1                              ; 512D   0011
        BMI     L_514E                          ; 512E   020B 001E

        MVO     R1,     G_0102                  ; 5130   0241 0102
        CMPI    #$0003, R1                      ; 5132   0379 0003
        BGE     L_514E                          ; 5134   020D 0018

        JSR     R5,     .EXEC.154               ; 5136   0004 0110 0154

        MVI     G_0114, R0                      ; 5139   0280 0114
        TSTR    R0                              ; 513B   0080
        BEQ     L_5144                          ; 513C   0204 0006

        XOR     G_0102, R0                      ; 513E   03C0 0102
        BNEQ    L_514E                          ; 5140   020C 000C

        MVO     R0,     G_0114                  ; 5142   0240 0114
L_5144:
        MVO     R0,     .STIC.VIDEN             ; 5144   0240 0020

        JSR     R5,     .EXEC.1C0               ; 5146   0004 0110 01C0
        JSR     R5,     .EXEC.414               ; 5149   0004 0114 0014

        B       L_5150                          ; 514C   0200 0002

L_514E:
        MVO     R0,     .STIC.VIDEN             ; 514E   0240 0020
L_5150:
        PULR    R5                              ; 5150   02B5
        J       X_PLAY_NOTE                     ; 5151   0004 0318 02BD

        PSHR    R5                              ; 5154   0275
        SLL     R1,     1                       ; 5155   0049
        ADDR    R1,     R7                      ; 5156   00CF
        B       L_51AB                          ; 5157   0200 0052
        B       L_5161                          ; 5159   0200 0006

        CLRR    R5                              ; 515B   01ED
        MVII    #$031D, R4                      ; 515C   02BC 031D
        CLRR    R3                              ; 515E   01DB
        B       L_5167                          ; 515F   0200 0006

L_5161:
        MVII    #$0004, R5                      ; 5161   02BD 0004
        MVII    #$033D, R4                      ; 5163   02BC 033D
        MVII    #$0004, R3                      ; 5165   02BB 0004
L_5167:
        MVI@    R4,     R0                      ; 5167   02A0
        MOVR    R0,     R1                      ; 5168   0081
        SLR     R1,     2                       ; 5169   0065
        SLR     R1,     2                       ; 516A   0065
        ANDI    #$0380, R1                      ; 516B   03B9 0380
        SLL     R1,     1                       ; 516D   0049
        MVI@    R4,     R2                      ; 516E   02A2
        TSTR    R2                              ; 516F   0092
        MVI@    R4,     R2                      ; 5170   02A2
        BEQ     L_5177                          ; 5171   0204 0004

        CMP     G_0104, R3                      ; 5173   0343 0104
        BLT     L_517A                          ; 5175   0205 0003

L_5177:
        MVII    #$00FF, R2                      ; 5177   02BA 00FF
        INCR    R7                              ; 5179   000F
L_517A:
        SWAP    R2,     1                       ; 517A   0042
        ANDI    #$00FF, R2                      ; 517B   03BA 00FF
        XORR    R2,     R1                      ; 517D   01D1
        MVO@    R1,     R5                      ; 517E   0269
        MOVR    R0,     R1                      ; 517F   0081
        SLR     R1,     1                       ; 5180   0061
        ANDI    #$03E0, R1                      ; 5181   03B9 03E0
        SLL     R1,     2                       ; 5183   004D
        MVI@    R4,     R2                      ; 5184   02A2
        SWAP    R2,     1                       ; 5185   0042
        ANDI    #$007F, R2                      ; 5186   03BA 007F
        XORR    R2,     R1                      ; 5188   01D1
        ADDI    #$0007, R5                      ; 5189   02FD 0007
        MVO@    R1,     R5                      ; 518B   0269
        MOVR    R0,     R1                      ; 518C   0081
        ANDI    #$0007, R0                      ; 518D   03B8 0007
        ANDI    #$0030, R1                      ; 518F   03B9 0030
        XORI    #$0008, R1                      ; 5191   03F9 0008
        SWAP    R1,     1                       ; 5193   0041
        XORR    R0,     R1                      ; 5194   01C1
        MOVR    R3,     R2                      ; 5195   009A
        ADD     G_02F0, R2                      ; 5196   02C2 02F0
        XOR@    R2,     R1                      ; 5198   03D1
        ADDI    #$0007, R5                      ; 5199   02FD 0007
        MVO@    R1,     R5                      ; 519B   0269
        ADDI    #$0007, R5                      ; 519C   02FD 0007
        CLRR    R0                              ; 519E   01C0
        MVO@    R0,     R5                      ; 519F   0268
        ADDI    #$0004, R4                      ; 51A0   02FC 0004
        SUBI    #$0018, R5                      ; 51A2   033D 0018
        INCR    R3                              ; 51A4   000B
        MOVR    R3,     R0                      ; 51A5   0098
        ANDI    #$0003, R0                      ; 51A6   03B8 0003
        BNEQ    L_5167                          ; 51A8   022C 0042

        PULR    R7                              ; 51AA   02B7
L_51AB:
        MVII    #$0018, R4                      ; 51AB   02BC 0018
        MVII    #$0107, R5                      ; 51AD   02BD 0107
L_51AF:
        MVI@    R4,     R0                      ; 51AF   02A0
        MVO@    R0,     R5                      ; 51B0   0268
        SWAP    R0,     1                       ; 51B1   0040
        RRC     R0,     1                       ; 51B2   0070
        NOP                                     ; 51B3   0034
        RRC     R2,     1                       ; 51B4   0072
        RRC     R0,     1                       ; 51B5   0070
        RRC     R3,     1                       ; 51B6   0073
        CMPI    #$010F, R5                      ; 51B7   037D 010F
        BNEQ    L_51AF                          ; 51B9   022C 000B

        SWAP    R2,     1                       ; 51BB   0042
        MVO@    R2,     R5                      ; 51BC   026A
        SWAP    R3,     1                       ; 51BD   0043
        MVO@    R3,     R5                      ; 51BE   026B
        PULR    R7                              ; 51BF   02B7
        PSHR    R5                              ; 51C0   0275
        MVI     G_0112, R4                      ; 51C1   0284 0112
        MVI     G_0111, R2                      ; 51C3   0282 0111
        SARC    R2,     2                       ; 51C5   007E

        JSR     R5,     .EXEC.1D1               ; 51C6   0004 0110 01D1

        MVI     G_0113, R4                      ; 51C9   0284 0113
        MVI     G_0111, R2                      ; 51CB   0282 0111
        SLR     R2,     1                       ; 51CD   0062
        SARC    R2,     1                       ; 51CE   007A
        INCR    R2                              ; 51CF   000A
        INCR    R7                              ; 51D0   000F
        PSHR    R5                              ; 51D1   0275
        DECR    R4                              ; 51D2   0014
        BMI     L_5100                          ; 51D3   022B 00D4

        CLRR    R1                              ; 51D5   01C9
        ADCR    R1                              ; 51D6   0029
        ADDR    R4,     R4                      ; 51D7   00E4
        ADDR    R4,     R4                      ; 51D8   00E4
        ADDR    R4,     R4                      ; 51D9   00E4
        MVI     G_02F0, R5                      ; 51DA   0285 02F0
L_51DC:
        ADDR    R5,     R2                      ; 51DC   00EA
        SUBI    #$0014, R5                      ; 51DD   033D 0014
        SDBD                                    ; 51DF   0001
        ADD@    R5,     R4                      ; 51E0   02EC
        MVI@    R2,     R5                      ; 51E1   0295
        SDBD                                    ; 51E2   0001
        ADDI    #$3800, R5                      ; 51E3   02FD 0000 0038
L_51E6:
        MVI@    R4,     R0                      ; 51E6   02A0
        MVO@    R0,     R5                      ; 51E7   0268
        MVI@    R4,     R0                      ; 51E8   02A0
        MVO@    R0,     R5                      ; 51E9   0268
        MVI@    R4,     R0                      ; 51EA   02A0
        MVO@    R0,     R5                      ; 51EB   0268
        MVI@    R4,     R0                      ; 51EC   02A0
        MVO@    R0,     R5                      ; 51ED   0268
        MVI@    R4,     R0                      ; 51EE   02A0
        MVO@    R0,     R5                      ; 51EF   0268
        MVI@    R4,     R0                      ; 51F0   02A0
        MVO@    R0,     R5                      ; 51F1   0268
        MVI@    R4,     R0                      ; 51F2   02A0
        MVO@    R0,     R5                      ; 51F3   0268
        MVI@    R4,     R0                      ; 51F4   02A0
        MVO@    R0,     R5                      ; 51F5   0268
        DECR    R1                              ; 51F6   0011
        BEQ     L_51E6                          ; 51F7   0224 0012

        PULR    R7                              ; 51F9   02B7
        PSHR    R5                              ; 51FA   0275
        CLRR    R0                              ; 51FB   01C0
        MVII    #$031D, R1                      ; 51FC   02B9 031D
        MVII    #$0001, R2                      ; 51FE   02BA 0001
        B       L_5221                          ; 5200   0200 001F

L_5202:
        MVO     R0,     G_011B                  ; 5202   0240 011B
        MVO     R1,     G_031B                  ; 5204   0241 031B
        MVO     R2,     G_011C                  ; 5206   0242 011C

        JSR     R5,     .EXEC.226               ; 5208   0004 0110 0226

        ADCR    R7                              ; 520B   002F
        DECR    R2                              ; 520C   0012

        JSR     R5,     .EXEC.226               ; 520D   0004 0110 0226

        INCR    R3                              ; 5210   000B
        DECR    R3                              ; 5211   0013

        JSR     R5,     .EXEC.226               ; 5212   0004 0110 0226

        ADDR    R7,     R1                      ; 5215   00F9
        DECR    R3                              ; 5216   0013
L_5217:
        MVI     G_011C, R2                      ; 5217   0282 011C
        SLL     R2,     1                       ; 5219   004A
        MVI     G_031B, R1                      ; 521A   0281 031B
        ADDI    #$0008, R1                      ; 521C   02F9 0008
        MVI     G_011B, R0                      ; 521E   0280 011B
        INCR    R0                              ; 5220   0008
L_5221:
        CMP     G_0104, R0                      ; 5221   0340 0104
        BLT     L_5202                          ; 5223   0225 0022

L_5225:
        PULR    R7                              ; 5225   02B7
        MVI     G_031B, R1                      ; 5226   0281 031B
        INCR    R1                              ; 5228   0009
        MVI@    R1,     R4                      ; 5229   028C
        TSTR    R4                              ; 522A   00A4
        BEQ     L_5217                          ; 522B   0224 0015

        SDBD                                    ; 522D   0001
        MVI@    R5,     R7                      ; 522E   02AF
        PSHR    R5                              ; 522F   0275
        MVO     R4,     G_0319                  ; 5230   0244 0319
        MVI@    R4,     R1                      ; 5232   02A1
        ANDI    #$0300, R1                      ; 5233   03B9 0300
        BNEQ    L_5249                          ; 5235   020C 0012

        MVI     G_011C, R0                      ; 5237   0280 011C
        AND     G_0110, R0                      ; 5239   0380 0110
        BEQ     L_5249                          ; 523B   0204 000C

        PSHR    R4                              ; 523D   0274
        DECR    R4                              ; 523E   0014
        SDBD                                    ; 523F   0001
        XOR@    R4,     R1                      ; 5240   03E1
        BEQ     L_5248                          ; 5241   0204 0005

        MVO     R1,     G_031C                  ; 5243   0241 031C

        JSR     R5,     .EXEC.4A1               ; 5245   0004 0114 00A1

L_5248:
        PULR    R4                              ; 5248   02B4
L_5249:
        ADDI    #$0005, R4                      ; 5249   02FC 0005
        MVI@    R4,     R0                      ; 524B   02A0
        SARC    R0,     1                       ; 524C   0078
        BNC     L_5261                          ; 524D   0209 0012

        SDBD                                    ; 524F   0001
        MVI@    R4,     R2                      ; 5250   02A2
        MVI     G_011C, R1                      ; 5251   0281 011C
        AND     G_010F, R1                      ; 5253   0381 010F
        BEQ     L_5260                          ; 5255   0204 0009

        MVO     R2,     G_031C                  ; 5257   0242 031C
        PSHR    R0                              ; 5259   0270
        PSHR    R4                              ; 525A   0274

        JSR     R5,     .EXEC.4A1               ; 525B   0004 0114 00A1

        PULR    R4                              ; 525E   02B4
        PULR    R0                              ; 525F   02B0
L_5260:
        TSTR    R0                              ; 5260   0080
L_5261:
        BEQ     L_5225                          ; 5261   0224 003D

        MVI     G_011B, R1                      ; 5263   0281 011B
        ADDI    #$0107, R1                      ; 5265   02F9 0107
        MVI@    R1,     R1                      ; 5267   0289
        ANDI    #$00FF, R1                      ; 5268   03B9 00FF
        BEQ     L_5225                          ; 526A   0224 0046

        CLRR    R5                              ; 526C   01ED
L_526D:
        SARC    R1,     1                       ; 526D   0079
        BNC     L_5292                          ; 526E   0209 0022

        PSHR    R5                              ; 5270   0275
        PSHR    R4                              ; 5271   0274
        PSHR    R1                              ; 5272   0271
        PSHR    R0                              ; 5273   0270
L_5274:
        MVI@    R4,     R2                      ; 5274   02A2
        SWAP    R2,     1                       ; 5275   0042
        RRC     R2,     2                       ; 5276   0076
        CLRR    R3                              ; 5277   01DB
        RLC     R3,     2                       ; 5278   0057
        MVI@    R4,     R1                      ; 5279   02A1
        SWAP    R1,     1                       ; 527A   0041
        RRC     R1,     1                       ; 527B   0071
        RLC     R3,     1                       ; 527C   0053
        CMPR    R5,     R3                      ; 527D   016B
        BNEQ    L_528B                          ; 527E   020C 000B

        SLL     R1,     1                       ; 5280   0049
        SLL     R2,     2                       ; 5281   004E
        SWAP    R2,     1                       ; 5282   0042
        XORR    R1,     R2                      ; 5283   01CA
        MVO     R2,     G_031C                  ; 5284   0242 031C

        JSR     R5,     .EXEC.29B               ; 5286   0004 0110 029B

        B       L_528E                          ; 5289   0200 0003

L_528B:
        DECR    R0                              ; 528B   0010
        BNEQ    L_5274                          ; 528C   022C 0019

L_528E:
        PULR    R0                              ; 528E   02B0
        PULR    R1                              ; 528F   02B1
        PULR    R4                              ; 5290   02B4
        PULR    R5                              ; 5291   02B5
L_5292:
        INCR    R5                              ; 5292   000D
        CMP     G_0104, R5                      ; 5293   0345 0104
        BGE     L_5225                          ; 5295   022D 0071

        TSTR    R1                              ; 5297   0089
        BNEQ    L_526D                          ; 5298   022C 002C

        PULR    R7                              ; 529A   02B7
        PSHR    R5                              ; 529B   0275
        MOVR    R3,     R0                      ; 529C   0098

        JSR     R5,     .EXEC.76C               ; 529D   0004 0114 036C

        INCR    R1                              ; 52A0   0009
        MVI@    R1,     R0                      ; 52A1   0288
        TSTR    R0                              ; 52A2   0080
        BEQ     L_5225                          ; 52A3   0224 007F

        MVI     G_031B, R1                      ; 52A5   0281 031B
        INCR    R1                              ; 52A7   0009
        MVI@    R1,     R2                      ; 52A8   028A
        CMP     G_0319, R2                      ; 52A9   0342 0319
        BEQ     L_54A0                          ; 52AB   0204 01F3

        PULR    R7                              ; 52AD   02B7
        PSHR    R5                              ; 52AE   0275

        JSR     R5,     .EXEC.6F7               ; 52AF   0004 0114 02F7

        BNC     L_5225                          ; 52B2   0229 008E

        MVII    #$0001, R0                      ; 52B4   02B8 0001
        CMPR    R4,     R5                      ; 52B6   0165
        BLE     L_52E5                          ; 52B7   0206 002C

        SLL     R0,     1                       ; 52B9   0048
        B       L_52E5                          ; 52BA   0200 0029

        PSHR    R5                              ; 52BC   0275

        JSR     R5,     .EXEC.70F               ; 52BD   0004 0114 030F

        BNC     L_5225                          ; 52C0   0229 009C

        MVII    #$0001, R0                      ; 52C2   02B8 0001
        CMPR    R4,     R5                      ; 52C4   0165
        BLE     L_52CD                          ; 52C5   0206 0006

        SLL     R0,     1                       ; 52C7   0048
        B       L_52CD                          ; 52C8   0200 0003

        PSHR    R5                              ; 52CA   0275
        MVII    #$0003, R0                      ; 52CB   02B8 0003
L_52CD:
        PSHR    R0                              ; 52CD   0270
        MOVR    R1,     R4                      ; 52CE   008C
        MOVR    R3,     R0                      ; 52CF   0098

        JSR     R5,     .EXEC.76C               ; 52D0   0004 0114 036C

        ADDI    #$0003, R1                      ; 52D3   02F9 0003
        MVI@    R1,     R0                      ; 52D5   0288
        MVII    #$00FF, R2                      ; 52D6   02BA 00FF
        SWAP    R0,     1                       ; 52D8   0040
        ANDR    R2,     R0                      ; 52D9   0190
        DECR    R1                              ; 52DA   0011
        SWAP    R2,     1                       ; 52DB   0042
        AND@    R1,     R2                      ; 52DC   038A
        XORR    R0,     R2                      ; 52DD   01C2
        MOVR    R4,     R1                      ; 52DE   00A1
        PULR    R0                              ; 52DF   02B0
        B       L_52E5                          ; 52E0   0200 0003

        PSHR    R5                              ; 52E2   0275
        MVII    #$0003, R0                      ; 52E3   02B8 0003
L_52E5:
        PSHR    R3                              ; 52E5   0273
        MOVR    R1,     R4                      ; 52E6   008C
        ADDI    #$0002, R4                      ; 52E7   02FC 0002
        ADDI    #$0004, R1                      ; 52E9   02F9 0004
        MVI@    R1,     R3                      ; 52EB   028B

        JSR     R5,     .EXEC.2FB               ; 52EC   0004 0110 02FB

        SWAP    R3,     1                       ; 52EF   0043
        SWAP    R2,     1                       ; 52F0   0042

        JSR     R5,     .EXEC.2FB               ; 52F1   0004 0110 02FB

        SWAP    R3,     1                       ; 52F4   0043
        SWAP    R2,     1                       ; 52F5   0042
        MVO@    R3,     R1                      ; 52F6   024B
        SUBI    #$0004, R1                      ; 52F7   0339 0004
        PULR    R3                              ; 52F9   02B3
        PULR    R7                              ; 52FA   02B7
        CMP@    R4,     R2                      ; 52FB   0362
        TSTR    R3                              ; 52FC   009B
        BC      L_5307                          ; 52FD   0201 0008
        BPL     L_5309                          ; 52FF   0203 0008

L_5301:
        SARC    R0,     1                       ; 5301   0078
        BNC     L_535C                          ; 5302   0209 0058

        ANDI    #$00FF, R3                      ; 5304   03BB 00FF
        MOVR    R5,     R7                      ; 5306   00AF
L_5307:
        BPL     L_5301                          ; 5307   0223 0007

L_5309:
        SLR     R0,     1                       ; 5309   0060
        MOVR    R5,     R7                      ; 530A   00AF
        PSHR    R5                              ; 530B   0275
        MOVR    R1,     R5                      ; 530C   008D
        DECR    R5                              ; 530D   0015
        MVI@    R5,     R3                      ; 530E   02AB
        INCR    R5                              ; 530F   000D
        MVI@    R5,     R1                      ; 5310   02A9
        MVO     R1,     G_0319                  ; 5311   0241 0319
        MVI     G_011C, R2                      ; 5313   0282 011C
        AND     G_011A, R2                      ; 5315   0382 011A
        MVI@    R5,     R2                      ; 5317   02AA
        MVO     R2,     G_031A                  ; 5318   0242 031A
        MVI@    R5,     R0                      ; 531A   02A8
        BEQ     L_5329                          ; 531B   0204 000C

        MOVR    R0,     R1                      ; 531D   0081
        MOVR    R0,     R2                      ; 531E   0082
        ANDI    #$00FF, R2                      ; 531F   03BA 00FF
        XORR    R2,     R1                      ; 5321   01D1
        SWAP    R2,     1                       ; 5322   0042
        SUBI    #$000B, R5                      ; 5323   033D 000B
        ADD@    R5,     R1                      ; 5325   02E9
        ADD@    R5,     R2                      ; 5326   02EA
        B       L_532F                          ; 5327   0200 0006

L_5329:
        RLC     R3,     1                       ; 5329   0053
        BC      L_532F                          ; 532A   0201 0003

        JSR     R5,     .EXEC.477               ; 532C   0004 0114 0077

L_532F:
        MVI@    R4,     R3                      ; 532F   02A3
        ANDI    #$0300, R3                      ; 5330   03BB 0300
        SWAP    R3,     1                       ; 5332   0043
        MOVR    R3,     R5                      ; 5333   009D
        DECR    R4                              ; 5334   0014
        SDBD                                    ; 5335   0001
        MVI@    R4,     R3                      ; 5336   02A3
        MVO     R3,     G_031C                  ; 5337   0243 031C
        MVI     G_031B, R3                      ; 5339   0283 031B
        ADDI    #$0002, R3                      ; 533B   02FB 0002
        MOVR    R3,     R4                      ; 533D   009C
        CMP@    R3,     R1                      ; 533E   0359
        MVO@    R1,     R4                      ; 533F   0261
        BNEQ    L_5346                          ; 5340   020C 0004

        CMP@    R4,     R2                      ; 5342   0362
        BEQ     L_5225                          ; 5343   0224 011F

        DECR    R4                              ; 5345   0014
L_5346:
        MVO@    R2,     R4                      ; 5346   0262
        DECR    R5                              ; 5347   0015
        BMI     L_5225                          ; 5348   022B 0124
        BNEQ    L_535D                          ; 534A   020C 0011

        MOVR    R1,     R0                      ; 534C   0088
        XOR     G_0319, R0                      ; 534D   03C0 0319
        BPL     L_5358                          ; 534F   0203 0007

        MOVR    R1,     R0                      ; 5351   0088
        RLC     R0,     1                       ; 5352   0050
        BUSC    L_5358                          ; 5353   0207 0003

        JSR     R5,     .EXEC.3B1               ; 5355   0004 0110 03B1

L_5358:
        TSTR    R2                              ; 5358   0092
        PULR    R5                              ; 5359   02B5
        BMI     L_53BA                          ; 535A   020B 005E

L_535C:
        MOVR    R5,     R7                      ; 535C   00AF
L_535D:
        MVII    #$00FF, R4                      ; 535D   02BC 00FF
        SWAP    R1,     1                       ; 535F   0041
        ANDR    R4,     R1                      ; 5360   01A1
        SWAP    R2,     1                       ; 5361   0042
        ANDR    R4,     R2                      ; 5362   01A2
        DECR    R5                              ; 5363   0015
        BEQ     L_5397                          ; 5364   0204 0031

        MVI     G_0319, R3                      ; 5366   0283 0319
        SWAP    R3,     1                       ; 5368   0043
        ANDR    R4,     R3                      ; 5369   01A3
        CMP     G_0116, R3                      ; 536A   0343 0116
        BGT     L_5225                          ; 536C   022E 0148

        CMP     G_0117, R3                      ; 536E   0343 0117
        BLT     L_5225                          ; 5370   0225 014C

        MVI     G_031A, R3                      ; 5372   0283 031A
        SWAP    R3,     1                       ; 5374   0043
        ANDR    R4,     R3                      ; 5375   01A3
        CMP     G_0118, R3                      ; 5376   0343 0118
        BGT     L_5225                          ; 5378   022E 0154

        CMP     G_0119, R3                      ; 537A   0343 0119
        BLT     L_5225                          ; 537C   0225 0158

        CLRR    R0                              ; 537E   01C0
        CMP     G_0116, R1                      ; 537F   0341 0116
        BGT     L_5388                          ; 5381   020E 0005

        INCR    R0                              ; 5383   0008
        CMP     G_0117, R1                      ; 5384   0341 0117
        BGE     L_538B                          ; 5386   020D 0003

L_5388:
        JSR     R5,     .EXEC.3C3               ; 5388   0004 0110 03C3

L_538B:
        MVII    #$0002, R0                      ; 538B   02B8 0002
        CMP     G_0118, R2                      ; 538D   0342 0118
        BGT     L_53C4                          ; 538F   020E 0033

        INCR    R0                              ; 5391   0008
        CMP     G_0119, R2                      ; 5392   0342 0119
        BLT     L_53C4                          ; 5394   0205 002E

        PULR    R7                              ; 5396   02B7
L_5397:
        CMPI    #$00A7, R1                      ; 5397   0379 00A7
        BLE     L_53A4                          ; 5399   0206 0009

        CLRR    R0                              ; 539B   01C0
        CMPI    #$00B3, R1                      ; 539C   0379 00B3
        BLT     L_53A1                          ; 539E   0205 0001

        INCR    R0                              ; 53A0   0008

L_53A1:
        JSR     R5,     .EXEC.3C3               ; 53A1   0004 0110 03C3

L_53A4:
        CMPI    #$0067, R2                      ; 53A4   037A 0067
        BLE     L_5225                          ; 53A6   0226 0182

        MVII    #$0002, R0                      ; 53A8   02B8 0002
        CMPI    #$0073, R2                      ; 53AA   037A 0073
        BLT     L_53C4                          ; 53AC   0205 0016

        INCR    R0                              ; 53AE   0008
        B       L_53C4                          ; 53AF   0200 0013

        RLC     R1,     1                       ; 53B1   0051
        GSWD    R0                              ; 53B2   0030
        RRC     R1,     1                       ; 53B3   0071
        RSWD    R0                              ; 53B4   0038
        CLRR    R0                              ; 53B5   01C0
        BNC     L_53C3                          ; 53B6   0209 000B
        B       L_53C2                          ; 53B8   0200 0008

L_53BA:
        RLC     R2,     2                       ; 53BA   0056
        GSWD    R0                              ; 53BB   0030
        RRC     R2,     2                       ; 53BC   0076
        RSWD    R0                              ; 53BD   0038
        MVII    #$0002, R0                      ; 53BE   02B8 0002
        BNOV    L_53C3                          ; 53C0   020A 0001

L_53C2:
        INCR    R0                              ; 53C2   0008
L_53C3:
        PSHR    R5                              ; 53C3   0275
L_53C4:
        MVII    #$0001, R5                      ; 53C4   02BD 0001
        CMPR    R5,     R0                      ; 53C6   0168
        BLE     L_53CA                          ; 53C7   0206 0001

        ADDR    R5,     R5                      ; 53C9   00ED
L_53CA:
        PSHR    R1                              ; 53CA   0271
        PSHR    R2                              ; 53CB   0272
        MVI     G_031B, R1                      ; 53CC   0281 031B
        INCR    R1                              ; 53CE   0009
        ADDR    R5,     R1                      ; 53CF   00E9
        ADDI    #$0318, R5                      ; 53D0   02FD 0318
        MVI@    R5,     R2                      ; 53D2   02AA
        MVI@    R1,     R3                      ; 53D3   028B
        MVO@    R2,     R1                      ; 53D4   024A
        MOVR    R0,     R2                      ; 53D5   0082

        JSR     R5,     .EXEC.4A1               ; 53D6   0004 0114 00A1

        PULR    R2                              ; 53D9   02B2
        PULR    R1                              ; 53DA   02B1
        PULR    R7                              ; 53DB   02B7
        MVI     G_011C, R0                      ; 53DC   0280 011C
        MVI     G_031B, R4                      ; 53DE   0284 031B
        PSHR    R5                              ; 53E0   0275
        ADDI    #$0002, R4                      ; 53E1   02FC 0002
        MVI@    R4,     R3                      ; 53E3   02A3
        MVI@    R4,     R5                      ; 53E4   02A5
L_53E5:
        MVI     G_011A, R1                      ; 53E5   0281 011A
        ANDR    R0,     R1                      ; 53E7   0181
        BEQ     L_5225                          ; 53E8   0224 01C4

        SLR     R0,     1                       ; 53EA   0060
        MVI@    R4,     R1                      ; 53EB   02A1
        MOVR    R1,     R2                      ; 53EC   008A
        ANDI    #$00FF, R2                      ; 53ED   03BA 00FF
        XORR    R2,     R1                      ; 53EF   01D1
        SWAP    R2,     1                       ; 53F0   0042
        SUBR    R1,     R3                      ; 53F1   010B
        SUBR    R2,     R5                      ; 53F2   0115
        SUBI    #$000B, R4                      ; 53F3   033C 000B
        MVO@    R3,     R4                      ; 53F5   0263
        MVO@    R5,     R4                      ; 53F6   0265
        B       L_53E5                          ; 53F7   0220 0013

        ADDI    #$0005, R1                      ; 53F9   02F9 0005
        MVI@    R1,     R3                      ; 53FB   028B
        SUBI    #$0001, R3                      ; 53FC   033B 0001
        BLT     L_535C                          ; 53FE   0225 00A3

        MVO@    R3,     R1                      ; 5400   024B
        MVI     G_011B, R0                      ; 5401   0280 011B
        BEQ     L_5496                          ; 5403   0204 0091

        ANDI    #$000F, R3                      ; 5405   03BB 000F
        BNEQ    L_535C                          ; 5407   022C 00AC

        MVII    #$013B, R2                      ; 5409   02BA 013B
        ADDR    R0,     R2                      ; 540B   00C2
        XOR@    R2,     R3                      ; 540C   03D3
        BEQ     L_535C                          ; 540D   0224 00B2

        INCR    R1                              ; 540F   0009
        MVI@    R1,     R2                      ; 5410   028A
        J       .EXEC.9B9                       ; 5411   0004 0318 01B9

        MVI     G_0111, R0                      ; 5414   0280 0111
        SLR     R0,     2                       ; 5416   0064
        ADDI    #$0002, R0                      ; 5417   02F8 0002
        CLRR    R1                              ; 5419   01C9
        B       L_5423                          ; 541A   0200 0007

        MVII    #$0001, R1                      ; 541C   02B9 0001
        CMPI    #$0003, R0                      ; 541E   0378 0003
        BGT     L_5423                          ; 5420   020E 0001

        SLL     R1,     1                       ; 5422   0049
L_5423:
        PSHR    R5                              ; 5423   0275
        PSHR    R1                              ; 5424   0271
        ANDI    #$0006, R0                      ; 5425   03B8 0006

        JSR     R5,     .EXEC.43F               ; 5427   0004 0114 003F

        PSHR    R3                              ; 542A   0273
        PSHR    R1                              ; 542B   0271
        INCR    R0                              ; 542C   0008

        JSR     R5,     .EXEC.43F               ; 542D   0004 0114 003F

        DECR    R0                              ; 5430   0010
        SARC    R1,     1                       ; 5431   0079
        RLC     R0,     1                       ; 5432   0050
        PULR    R1                              ; 5433   02B1
        SARC    R1,     1                       ; 5434   0079
        RLC     R0,     1                       ; 5435   0050
        PULR    R2                              ; 5436   02B2
        PULR    R1                              ; 5437   02B1
        MVII    #$0111, R5                      ; 5438   02BD 0111
        MVO@    R0,     R5                      ; 543A   0268
        MVO@    R2,     R5                      ; 543B   026A
        MVO@    R3,     R5                      ; 543C   026B
        MVO@    R1,     R5                      ; 543D   0269
        PULR    R7                              ; 543E   02B7
        PSHR    R5                              ; 543F   0275
        CLRR    R3                              ; 5440   01DB
        CMP     G_0104, R0                      ; 5441   0340 0104
        BGE     L_5225                          ; 5443   022D 021F

        JSR     R5,     .EXEC.76C               ; 5445   0004 0114 036C

        MVI@    R1,     R4                      ; 5448   028C
        INCR    R1                              ; 5449   0009
        MVI@    R1,     R2                      ; 544A   028A
        TSTR    R2                              ; 544B   0092
        BEQ     L_5225                          ; 544C   0224 0228

        ADDI    #$0004, R1                      ; 544E   02F9 0004
        ADDI    #$0004, R2                      ; 5450   02FA 0004
        MVI@    R1,     R3                      ; 5452   028B
        SAR     R3,     2                       ; 5453   006F
        ANDI    #$00FC, R3                      ; 5454   03BB 00FC
        CMPI    #$00FC, R3                      ; 5456   037B 00FC
        BEQ     L_545F                          ; 5458   0204 0005

        SWAP    R3,     1                       ; 545A   0043
        ADD@    R1,     R3                      ; 545B   02CB
        BNC     L_5468                          ; 545C   0209 000A

        INCR    R7                              ; 545E   000F
L_545F:
        MVI@    R1,     R3                      ; 545F   028B
        INCR    R3                              ; 5460   000B
        MOVR    R3,     R5                      ; 5461   009D
        ANDI    #$000F, R5                      ; 5462   03BD 000F
        CMP@    R2,     R5                      ; 5464   0355
        BNEQ    L_5468                          ; 5465   020C 0001

        XORR    R5,     R3                      ; 5467   01EB
L_5468:
        MVO@    R3,     R1                      ; 5468   024B
        ANDI    #$000F, R3                      ; 5469   03BB 000F
        CLRC                                    ; 546B   0006
        ANDI    #$0040, R4                      ; 546C   03BC 0040
        BEQ     L_5472                          ; 546E   0204 0002

        SLL     R3,     1                       ; 5470   004B
        SETC                                    ; 5471   0007
L_5472:
        RLC     R1,     1                       ; 5472   0051
        INCR    R2                              ; 5473   000A
        ADD@    R2,     R3                      ; 5474   02D3
        INCR    R3                              ; 5475   000B
        PULR    R7                              ; 5476   02B7
        PSHR    R2                              ; 5477   0272
        MOVR    R0,     R2                      ; 5478   0082
        BEQ     L_5494                          ; 5479   0204 0019

        ANDI    #$00FF, R2                      ; 547B   03BA 00FF
        XORR    R2,     R0                      ; 547D   01D0
        SWAP    R2,     1                       ; 547E   0042
        ADD     G_0115, R7                      ; 547F   02C7 0115
        SAR     R0,     2                       ; 5481   006C
        SAR     R2,     2                       ; 5482   006E
        SAR     R0,     2                       ; 5483   006C
        SAR     R2,     2                       ; 5484   006E
        SAR     R0,     2                       ; 5485   006C
        ADDR    R0,     R1                      ; 5486   00C1
        SAR     R2,     2                       ; 5487   006E
        ADD@    R6,     R2                      ; 5488   02F2
        MOVR    R5,     R7                      ; 5489   00AF
        SAR     R0,     2                       ; 548A   006C
        SAR     R2,     2                       ; 548B   006E
        NOP                                     ; 548C   0034
        SAR     R0,     2                       ; 548D   006C
        SAR     R2,     2                       ; 548E   006E
        SAR     R0,     2                       ; 548F   006C
        SAR     R2,     2                       ; 5490   006E
        SAR     R0,     1                       ; 5491   0068
        ADDR    R0,     R1                      ; 5492   00C1
        SAR     R2,     1                       ; 5493   006A
L_5494:
        ADD@    R6,     R2                      ; 5494   02F2
        MOVR    R5,     R7                      ; 5495   00AF
L_5496:
        PSHR    R5                              ; 5496   0275
        ADDI    #$0002, R4                      ; 5497   02FC 0002
        SDBD                                    ; 5499   0001
        MVI@    R4,     R1                      ; 549A   02A1
        MVO     R1,     G_031C                  ; 549B   0241 031C

        JSR     R5,     .EXEC.98D               ; 549D   0004 0118 018D

L_54A0:
        PULR    R5                              ; 54A0   02B5
        MVI     G_031B, R1                      ; 54A1   0281 031B
        INCR    R1                              ; 54A3   0009
        MVI@    R1,     R4                      ; 54A4   028C
        DECR    R1                              ; 54A5   0011
        TSTR    R4                              ; 54A6   00A4
        BEQ     L_535C                          ; 54A7   0224 014C

        MVI     G_031C, R4                      ; 54A9   0284 031C
        TSTR    R4                              ; 54AB   00A4
        BEQ     L_535C                          ; 54AC   0224 0151

        MVI     G_011B, R0                      ; 54AE   0280 011B
        MOVR    R4,     R7                      ; 54B0   00A7
        PSHR    R4                              ; 54B1   0274
L_54B2:
        MVII    #$0019, R4                      ; 54B2   02BC 0019
        MVO     R4,     G_011E                  ; 54B4   0244 011E
L_54B6:
        PULR    R7                              ; 54B6   02B7
L_54B7:
        MVII    #$00FF, R1                      ; 54B7   02B9 00FF
L_54B9:
        MVI@    R2,     R0                      ; 54B9   0290
        SWAP    R0,     1                       ; 54BA   0040
        XOR@    R3,     R0                      ; 54BB   03D8
        COMR    R0                              ; 54BC   0018
        BNEQ    L_54B7                          ; 54BD   022C 0007

        DECR    R1                              ; 54BF   0011
        BNEQ    L_54B9                          ; 54C0   022C 0008

        MOVR    R5,     R7                      ; 54C2   00AF
        PSHR    R5                              ; 54C3   0275
        PSHR    R0                              ; 54C4   0270
        PSHR    R1                              ; 54C5   0271
        MVII    #$01FE, R2                      ; 54C6   02BA 01FE
        MVII    #$01FF, R3                      ; 54C8   02BB 01FF

        JSR     R5,     .EXEC.4B7               ; 54CA   0004 0114 00B7

L_54CD:
        INCR    R0                              ; 54CD   0008

        JSR     R5,     X_RAND1                 ; 54CE   0004 0114 027D

        MVI@    R2,     R0                      ; 54D1   0290
        SWAP    R0,     1                       ; 54D2   0040
        XOR@    R3,     R0                      ; 54D3   03D8
        COMR    R0                              ; 54D4   0018
        BEQ     L_54CD                          ; 54D5   0224 0009

        MVII    #$01FF, R0                      ; 54D7   02B8 01FF
L_54D9:
        DECR    R0                              ; 54D9   0010
        BNEQ    L_54D9                          ; 54DA   022C 0002

        MVI@    R2,     R0                      ; 54DC   0290
        SWAP    R0,     1                       ; 54DD   0040
        XOR@    R3,     R0                      ; 54DE   03D8
        COMR    R0                              ; 54DF   0018
        PSHR    R0                              ; 54E0   0270

        JSR     R5,     .EXEC.4B7               ; 54E1   0004 0114 00B7

        PULR    R5                              ; 54E4   02B5
        PULR    R1                              ; 54E5   02B1
        PULR    R0                              ; 54E6   02B0
        B       L_54B2                          ; 54E7   0220 0036

        DECLE   $0001                           ; 54E9   0001

        XORI    #$03FE, R7                      ; 54EA   03FF 03FE
        CLRC                                    ; 54EC   0006
        XORI    #$0004, R5                      ; 54ED   03FD 0004
        INCR    R0                              ; 54EF   0008
        DECLE   $0000                           ; 54F0   0000

        PSHR    R5                              ; 54F1   0275
        MVII    #$005A, R1                      ; 54F2   02B9 005A
        CMP     .PSG0.rgt_hand,R1               ; 54F4   0341 01FE
        BEQ     L_5507                          ; 54F6   0204 000F

        CMP     .PSG0.lft_hand,R1               ; 54F8   0341 01FF
        BEQ     L_5507                          ; 54FA   0204 000B

        MVII    #$011D, R4                      ; 54FC   02BC 011D
        MOVR    R4,     R5                      ; 54FE   00A5
        SDBD                                    ; 54FF   0001
        MVI@    R4,     R0                      ; 5500   02A0
        DECR    R0                              ; 5501   0010
        MVO@    R0,     R5                      ; 5502   0268
        SWAP    R0,     1                       ; 5503   0040
        MVO@    R0,     R5                      ; 5504   0268
        BNEQ    L_5523                          ; 5505   020C 001C

L_5507:
        MVII    #$0080, R0                      ; 5507   02B8 0080
        MVO     R0,     G_0102                  ; 5509   0240 0102
        MVII    #$01FB, R4                      ; 550B   02BC 01FB
        MOVR    R4,     R5                      ; 550D   00A5
        CLRR    R3                              ; 550E   01DB
        MVI@    R4,     R0                      ; 550F   02A0
        MVO@    R3,     R5                      ; 5510   026B
        MVI@    R4,     R1                      ; 5511   02A1
        MVO@    R3,     R5                      ; 5512   026B
        MVI@    R4,     R2                      ; 5513   02A2
        MVO@    R3,     R5                      ; 5514   026B
        PSHR    R2                              ; 5515   0272

        JSR     R5,     .EXEC.4C3               ; 5516   0004 0114 00C3

        PULR    R2                              ; 5519   02B2
        MVII    #$01FB, R5                      ; 551A   02BD 01FB
        MVO@    R0,     R5                      ; 551C   0268
        MVO@    R1,     R5                      ; 551D   0269
        MVO@    R2,     R5                      ; 551E   026A
        MVII    #$00A0, R0                      ; 551F   02B8 00A0
        MVO     R0,     G_0102                  ; 5521   0240 0102
L_5523:
        MVII    #$011F, R1                      ; 5523   02B9 011F
        MVI     .PSG0.lft_hand,R2               ; 5525   0282 01FF

        JSR     R5,     .EXEC.52F               ; 5527   0004 0114 012F

        MVII    #$0120, R1                      ; 552A   02B9 0120
        MVI     .PSG0.rgt_hand,R2               ; 552C   0282 01FE
        INCR    R7                              ; 552E   000F
        PSHR    R5                              ; 552F   0275
        XORI    #$00FF, R2                      ; 5530   03FA 00FF
        CLRR    R0                              ; 5532   01C0
        MOVR    R1,     R3                      ; 5533   008B
        ADDI    #$0004, R3                      ; 5534   02FB 0004
        CMP@    R3,     R2                      ; 5536   035A
        MVO@    R2,     R3                      ; 5537   025A
        BNEQ    L_554B                          ; 5538   020C 0011

        MOVR    R2,     R3                      ; 553A   0093
        ANDI    #$001F, R3                      ; 553B   03BB 001F
        SLR     R2,     2                       ; 553D   0066
        SLR     R2,     2                       ; 553E   0066
        SLR     R2,     1                       ; 553F   0062
        ADDR    R7,     R2                      ; 5540   00FA
        SUBI    #$0058, R2                      ; 5541   033A 0058
        MVI@    R2,     R0                      ; 5543   0290

        JSR     R5,     X_EXT_SIGN_LO           ; 5544   0004 0114 0268

        CMPI    #$0001, R0                      ; 5547   0378 0001
        BGT     L_5568                          ; 5549   020E 001D

L_554B:
        MOVR    R1,     R2                      ; 554B   008A
        ADDI    #$0002, R2                      ; 554C   02FA 0002
        MVI@    R2,     R4                      ; 554E   0294
        TSTR    R4                              ; 554F   00A4
        BEQ     L_5561                          ; 5550   0204 000F

        PSHR    R0                              ; 5552   0270
        PSHR    R1                              ; 5553   0271
        PSHR    R3                              ; 5554   0273
        CLRR    R0                              ; 5555   01C0
        MVO@    R0,     R2                      ; 5556   0250
        DECR    R0                              ; 5557   0010
        ADDR    R4,     R4                      ; 5558   00E4
        ADDI    #$0002, R4                      ; 5559   02FC 0002

        JSR     R5,     .EXEC.5EB               ; 555B   0004 0114 01EB

        PULR    R3                              ; 555E   02B3
        PULR    R1                              ; 555F   02B1
        PULR    R0                              ; 5560   02B0
L_5561:
        MOVR    R0,     R4                      ; 5561   0084
        BEQ     L_55AC                          ; 5562   0204 0048
        BMI     L_55BB                          ; 5564   020B 0055
        B       L_5590                          ; 5566   0200 0028

L_5568:
        PSHR    R3                              ; 5568   0273
        PSHR    R1                              ; 5569   0271
        MOVR    R0,     R4                      ; 556A   0084
        SUBI    #$0002, R0                      ; 556B   0338 0002
        SLR     R0,     1                       ; 556D   0060
        ADDI    #$0002, R1                      ; 556E   02F9 0002
        ADD     G_035D, R4                      ; 5570   02C4 035D
        CMP@    R1,     R0                      ; 5572   0348
        MVO@    R0,     R1                      ; 5573   0248
        SDBD                                    ; 5574   0001
        MVI@    R4,     R2                      ; 5575   02A2
        BEQ     L_5588                          ; 5576   0204 0010

        JSR     R5,     X_READ_ROM_HDR          ; 5578   0004 0110 00AB

        INCR    R4                              ; 557B   000C
        MOVR    R5,     R3                      ; 557C   00AB
        SLR     R3,     2                       ; 557D   0067
L_557E:
        SARC    R3,     1                       ; 557E   007B
        DECR    R0                              ; 557F   0010
        BNEQ    L_557E                          ; 5580   022C 0003

        JSR     R5,     .EXEC.605               ; 5582   0004 0114 0205

        MVII    #$0001, R0                      ; 5585   02B8 0001
        INCR    R7                              ; 5587   000F
L_5588:
        CLRR    R0                              ; 5588   01C0
        PULR    R1                              ; 5589   02B1
        PSHR    R1                              ; 558A   0271

        JSR     R5,     .EXEC.5EF               ; 558B   0004 0114 01EF

        PULR    R1                              ; 558E   02B1
        PULR    R3                              ; 558F   02B3
L_5590:
        MVII    #$000F, R0                      ; 5590   02B8 000F
        CLRR    R4                              ; 5592   01E4

        JSR     R5,     .EXEC.5A6               ; 5593   0004 0114 01A6

        DECR    R2                              ; 5596   0012
        DECR    R3                              ; 5597   0013
        DIS                                     ; 5598   0003
        DECLE   $0001                           ; 5599   0001

        DECR    R1                              ; 559A   0011
        COMR    R1                              ; 559B   0019
        INCR    R1                              ; 559C   0009
        INCR    R0                              ; 559D   0008
        COMR    R0                              ; 559E   0018
        COMR    R4                              ; 559F   001C
        INCR    R4                              ; 55A0   000C

        JSR     R4,     .EXEC.416               ; 55A1   0004 0014 0016

        CLRC                                    ; 55A4   0006
        EIS                                     ; 55A5   0002
L_55A6:
        CMP@    R5,     R3                      ; 55A6   036B
        BEQ     L_55DC                          ; 55A7   0204 0033

        DECR    R0                              ; 55A9   0010
        BPL     L_55A6                          ; 55AA   0223 0005

L_55AC:
        MVI@    R1,     R0                      ; 55AC   0288
        MOVR    R0,     R2                      ; 55AD   0082
        ANDI    #$00BF, R2                      ; 55AE   03BA 00BF
        XORI    #$0040, R2                      ; 55B0   03FA 0040
        MVO@    R2,     R1                      ; 55B2   024A
        ANDI    #$00C0, R0                      ; 55B3   03B8 00C0
        BNEQ    L_54B6                          ; 55B5   022C 0100

        DECR    R0                              ; 55B7   0010
        CLRR    R4                              ; 55B8   01E4
        B       L_55EA                          ; 55B9   0200 002F

L_55BB:
        INCR    R4                              ; 55BB   000C
        MOVR    R3,     R5                      ; 55BC   009D
        ANDI    #$000F, R3                      ; 55BD   03BB 000F
        BEQ     L_55AC                          ; 55BF   0224 0014

        XORR    R3,     R5                      ; 55C1   01DD
        BNEQ    L_55AC                          ; 55C2   022C 0017

L_55C4:
        ADDI    #$0003, R4                      ; 55C4   02FC 0003
        SARC    R3,     1                       ; 55C6   007B
        BNC     L_55C4                          ; 55C7   0229 0004
        BNEQ    L_55AC                          ; 55C9   022C 001E

        MOVR    R4,     R0                      ; 55CB   00A0
        CMPI    #$000B, R0                      ; 55CC   0378 000B
        BEQ     L_55D4                          ; 55CE   0204 0004
        BMI     L_55D6                          ; 55D0   020B 0004

        ADDI    #$000A, R0                      ; 55D2   02F8 000A
L_55D4:
        SUBI    #$000B, R0                      ; 55D4   0338 000B
L_55D6:
        ANDI    #$007F, R0                      ; 55D6   03B8 007F
        XORI    #$0080, R0                      ; 55D8   03F8 0080
        MVII    #$0002, R4                      ; 55DA   02BC 0002
L_55DC:
        CMP@    R1,     R0                      ; 55DC   0348
        BEQ     L_54B6                          ; 55DD   0224 0128

        MVO@    R0,     R1                      ; 55DF   0248
        PSHR    R1                              ; 55E0   0271
        PSHR    R4                              ; 55E1   0274

        JSR     R5,     .EXEC.5F9               ; 55E2   0004 0114 01F9

        PULR    R4                              ; 55E5   02B4
        PULR    R1                              ; 55E6   02B1
        MVI@    R1,     R0                      ; 55E7   0288
        ANDI    #$007F, R0                      ; 55E8   03B8 007F
L_55EA:
        PULR    R5                              ; 55EA   02B5
        ADD     G_035D, R4                      ; 55EB   02C4 035D
        SDBD                                    ; 55ED   0001
        MVI@    R4,     R2                      ; 55EE   02A2

        JSR     R4,     .EXEC.4B1               ; 55EF   0004 0014 00B1

        TSTR    R2                              ; 55F2   0092
        BNEQ    L_55F6                          ; 55F3   020C 0001

L_55F5:
        MOVR    R5,     R7                      ; 55F5   00AF
L_55F6:
        SUBI    #$011F, R1                      ; 55F6   0339 011F
        MOVR    R2,     R7                      ; 55F8   0097
        PSHR    R5                              ; 55F9   0275

        JSR     R5,     X_READ_ROM_HDR          ; 55FA   0004 0110 00AB

        INCR    R4                              ; 55FD   000C
        MOVR    R5,     R1                      ; 55FE   00A9
        PULR    R5                              ; 55FF   02B5
        SARC    R1,     1                       ; 5600   0079
        SWAP    R0,     2                       ; 5601   0044
        BPL     L_5605                          ; 5602   0203 0001

        SARC    R1,     1                       ; 5604   0079
L_5605:
        BNC     L_55F5                          ; 5605   0229 0011

        JSR     R4,     X_SFX_OK                ; 5607   0004 001C 02AD

        PSHR    R5                              ; 560A   0275

        JSR     R5,     X_PLAY_SFX1             ; 560B   0004 0118 03BB

        XOR@    R5,     R1                      ; 560E   03E9
        DECLE   $0005                           ; 560F   0005

        INCR    R4                              ; 5610   000C
        TSTR    R0                              ; 5611   0080
        ADCR    R3                              ; 5612   002B
        SWAP    R0,     1                       ; 5613   0040
        COMR    R0                              ; 5614   0018
        INCR    R3                              ; 5615   000B
        SUBR    R5,     R3                      ; 5616   012B
        XOR@    R1,     R7                      ; 5617   03CF
        DECLE   $0000                           ; 5618   0000

        COMR    R0                              ; 5619   0018
        ADCR    R5                              ; 561A   002D
        RSWD    R3                              ; 561B   003B
        SWAP    R0,     1                       ; 561C   0040
        RSWD    R3                              ; 561D   003B
        ADCR    R5                              ; 561E   002D
        COMR    R0                              ; 561F   0018
        DECLE   $0000                           ; 5620   0000

        XOR@    R5,     R0                      ; 5621   03E8
        XOR@    R2,     R3                      ; 5622   03D3
        XOR     G_03C0, R5                      ; 5623   03C5 03C0
        XOR     G_03D3, R5                      ; 5625   03C5 03D3
        XOR@    R5,     R0                      ; 5627   03E8
        MVI@    R5,     R0                      ; 5628   02A8
        PSHR    R5                              ; 5629   0275
        PSHR    R2                              ; 562A   0272

        JSR     R5,     .EXEC.637               ; 562B   0004 0114 0237

        PSHR    R2                              ; 562E   0272

        JSR     R5,     .EXEC.63D               ; 562F   0004 0114 023D

        PULR    R0                              ; 5632   02B0
        MOVR    R2,     R1                      ; 5633   0091
        PULR    R2                              ; 5634   02B2
        B       L_5750                          ; 5635   0200 0119

        PSHR    R5                              ; 5637   0275
        PSHR    R1                              ; 5638   0271
        ADDI    #$0004, R1                      ; 5639   02F9 0004
        B       L_5641                          ; 563B   0200 0004

        PSHR    R5                              ; 563D   0275
        PSHR    R1                              ; 563E   0271
        ADDI    #$0008, R1                      ; 563F   02F9 0008
L_5641:
        PSHR    R0                              ; 5641   0270
        TSTR    R0                              ; 5642   0080
        BPL     L_5648                          ; 5643   0203 0003

        ADDI    #$0008, R1                      ; 5645   02F9 0008
        NEGR    R0                              ; 5647   0020
L_5648:
        ANDI    #$000F, R1                      ; 5648   03B9 000F
        SDBD                                    ; 564A   0001
        ADDI    #$1618, R1                      ; 564B   02F9 0018 0016
        MVI@    R1,     R1                      ; 564E   0289
        SWAP    R1,     1                       ; 564F   0041
        SAR     R1,     2                       ; 5650   006D
        SAR     R1,     2                       ; 5651   006D
        CLRR    R2                              ; 5652   01D2
        SAR     R1,     2                       ; 5653   006D
        SAR     R1,     2                       ; 5654   006D
L_5655:
        SARC    R0,     1                       ; 5655   0078
        BNC     L_5659                          ; 5656   0209 0001

        ADDR    R1,     R2                      ; 5658   00CA
L_5659:
        SLL     R1,     1                       ; 5659   0049
        TSTR    R0                              ; 565A   0080
        BNEQ    L_5655                          ; 565B   022C 0007

        SLL     R2,     2                       ; 565D   004E
        SLL     R2,     1                       ; 565E   004A
        ADDI    #$0080, R2                      ; 565F   02FA 0080
        SAR     R2,     2                       ; 5661   006E
        SAR     R2,     2                       ; 5662   006E
        SAR     R2,     2                       ; 5663   006E
        SAR     R2,     2                       ; 5664   006E
        PULR    R0                              ; 5665   02B0
        PULR    R1                              ; 5666   02B1
        PULR    R7                              ; 5667   02B7
        SWAP    R0,     1                       ; 5668   0040
        PSHR    R5                              ; 5669   0275
L_566A:
        SAR     R0,     2                       ; 566A   006C
        NOP                                     ; 566B   0034
        SAR     R0,     2                       ; 566C   006C
        SAR     R0,     2                       ; 566D   006C
        SAR     R0,     2                       ; 566E   006C
        PULR    R7                              ; 566F   02B7
        CMP@    R5,     R0                      ; 5670   0368
        BLT     L_5679                          ; 5671   0205 0006

        CMP@    R5,     R0                      ; 5673   0368
        BLE     L_5678                          ; 5674   0206 0002

        DECR    R5                              ; 5676   0015
        MVI@    R5,     R0                      ; 5677   02A8
L_5678:
        MOVR    R5,     R7                      ; 5678   00AF
L_5679:
        DECR    R5                              ; 5679   0015
        MVI@    R5,     R0                      ; 567A   02A8
        INCR    R5                              ; 567B   000D
        MOVR    R5,     R7                      ; 567C   00AF
        PSHR    R5                              ; 567D   0275
        MOVR    R0,     R5                      ; 567E   0085
        BEQ     L_57D4                          ; 567F   0204 0153

        PSHR    R1                              ; 5681   0271
        PSHR    R2                              ; 5682   0272
        CLRR    R2                              ; 5683   01D2
        MVI     G_035E, R0                      ; 5684   0280 035E
L_5686:
        SLL     R0,     2                       ; 5686   004C
        SLL     R0,     2                       ; 5687   004C
        MOVR    R0,     R1                      ; 5688   0081
        XOR     G_035E, R0                      ; 5689   03C0 035E
        SWAP    R1,     1                       ; 568B   0041
        SLL     R1,     1                       ; 568C   0049
        XORR    R1,     R0                      ; 568D   01C8
        SLL     R1,     2                       ; 568E   004D
        XORR    R1,     R0                      ; 568F   01C8
        RLC     R0,     1                       ; 5690   0050
        MVI     G_035E, R0                      ; 5691   0280 035E
        RLC     R0,     1                       ; 5693   0050
        MVO     R0,     G_035E                  ; 5694   0240 035E
        SETC                                    ; 5696   0007
        RLC     R2,     1                       ; 5697   0052
        DECR    R5                              ; 5698   0015
        BNEQ    L_5686                          ; 5699   022C 0014

        ANDR    R2,     R0                      ; 569B   0190
        B       L_57D2                          ; 569C   0200 0134

        PSHR    R5                              ; 569E   0275
        PSHR    R1                              ; 569F   0271
        PSHR    R2                              ; 56A0   0272
        MOVR    R0,     R1                      ; 56A1   0081
        BEQ     L_57D2                          ; 56A2   0204 012E

        CLRR    R2                              ; 56A4   01D2
L_56A5:
        INCR    R2                              ; 56A5   000A
        SLR     R0,     1                       ; 56A6   0060
        BNEQ    L_56A5                          ; 56A7   022C 0003

L_56A9:
        MOVR    R2,     R0                      ; 56A9   0090

        JSR     R5,     X_RAND1                 ; 56AA   0004 0114 027D

        CMPR    R1,     R0                      ; 56AD   0148
        BGE     L_56A9                          ; 56AE   022D 0006
        B       L_57D2                          ; 56B0   0200 0120

        MVII    #$0001, R0                      ; 56B2   02B8 0001
        PSHR    R5                              ; 56B4   0275

        JSR     R5,     .EXEC.7C1               ; 56B5   0004 0114 03C1

        MOVR    R1,     R4                      ; 56B8   008C
        MOVR    R2,     R5                      ; 56B9   0095
        MOVR    R0,     R2                      ; 56BA   0082
L_56BB:
        MOVR    R5,     R1                      ; 56BB   00A9

        JSR     R5,     .EXEC.992               ; 56BC   0004 0118 0192
        JSR     R5,     .EXEC.6D5               ; 56BF   0004 0114 02D5

        MOVR    R1,     R5                      ; 56C2   008D
        MVII    #$0008, R3                      ; 56C3   02BB 0008
L_56C5:
        SDBD                                    ; 56C5   0001
        MVI@    R4,     R1                      ; 56C6   02A1
        MVO@    R1,     R5                      ; 56C7   0269
        DECR    R3                              ; 56C8   0013
        BNEQ    L_56C5                          ; 56C9   022C 0005

        DECR    R2                              ; 56CB   0012
        BNEQ    L_56BB                          ; 56CC   022C 0012

        PULR    R7                              ; 56CE   02B7
        PSHR    R5                              ; 56CF   0275

        JSR     R5,     X_CLR_BIT               ; 56D0   0004 0114 02E6

        SUBR    R3,     R2                      ; 56D3   011A
        PULR    R7                              ; 56D4   02B7
        PSHR    R5                              ; 56D5   0275

        JSR     R5,     X_SET_BIT               ; 56D6   0004 0114 02DB

        SUBR    R3,     R2                      ; 56D9   011A
        PULR    R7                              ; 56DA   02B7
        PSHR    R0                              ; 56DB   0270
        PSHR    R1                              ; 56DC   0271
        MVI@    R5,     R1                      ; 56DD   02A9
        PSHR    R5                              ; 56DE   0275

        JSR     R5,     X_POW2                  ; 56DF   0004 0114 0345

        COMR    R0                              ; 56E2   0018
        AND@    R1,     R0                      ; 56E3   0388
        B       L_56F1                          ; 56E4   0200 000B

        PSHR    R0                              ; 56E6   0270
        PSHR    R1                              ; 56E7   0271
        MVI@    R5,     R1                      ; 56E8   02A9
        PSHR    R5                              ; 56E9   0275

        JSR     R5,     X_POW2                  ; 56EA   0004 0114 0345

        MOVR    R0,     R5                      ; 56ED   0085
        COMR    R0                              ; 56EE   0018
        AND@    R1,     R0                      ; 56EF   0388
        XORR    R5,     R0                      ; 56F0   01E8
L_56F1:
        MVO@    R0,     R1                      ; 56F1   0248
        PULR    R5                              ; 56F2   02B5
        PULR    R1                              ; 56F3   02B1
        PULR    R0                              ; 56F4   02B0
        PSHR    R5                              ; 56F5   0275
        PULR    R7                              ; 56F6   02B7
        PSHR    R5                              ; 56F7   0275
        PSHR    R2                              ; 56F8   0272

        JSR     R5,     .EXEC.777               ; 56F9   0004 0114 0377

        PULR    R5                              ; 56FC   02B5
        PSHR    R5                              ; 56FD   0275
        MOVR    R5,     R0                      ; 56FE   00A8
        ANDI    #$00FF, R5                      ; 56FF   03BD 00FF
        XORR    R5,     R0                      ; 5701   01E8
        SWAP    R0,     1                       ; 5702   0040
        SUBR    R0,     R2                      ; 5703   0102
        BPL     L_5707                          ; 5704   0203 0001

        NEGR    R2                              ; 5706   0022
L_5707:
        SUBR    R5,     R3                      ; 5707   012B
        BPL     L_570B                          ; 5708   0203 0001

        NEGR    R3                              ; 570A   0023
L_570B:
        PULR    R0                              ; 570B   02B0
        PSHR    R1                              ; 570C   0271
        B       L_5722                          ; 570D   0200 0013

        PSHR    R5                              ; 570F   0275
        MOVR    R3,     R0                      ; 5710   0098

        JSR     R5,     .EXEC.777               ; 5711   0004 0114 0377

        PSHR    R1                              ; 5714   0271
        PSHR    R2                              ; 5715   0272
        PSHR    R3                              ; 5716   0273

        JSR     R5,     .EXEC.772               ; 5717   0004 0114 0372

        SUB@    R6,     R3                      ; 571A   0333
        BPL     L_571E                          ; 571B   0203 0001

        NEGR    R3                              ; 571D   0023
L_571E:
        SUB@    R6,     R2                      ; 571E   0332
        BPL     L_5722                          ; 571F   0203 0001

        NEGR    R2                              ; 5721   0022
L_5722:
        MOVR    R4,     R1                      ; 5722   00A1
        ANDI    #$00FF, R4                      ; 5723   03BC 00FF
        XORR    R4,     R1                      ; 5725   01E1
        SWAP    R1,     1                       ; 5726   0041
        SUBR    R2,     R1                      ; 5727   0111
        BNC     L_572B                          ; 5728   0209 0001

        SUBR    R3,     R4                      ; 572A   011C
L_572B:
        MOVR    R1,     R5                      ; 572B   008D
        PULR    R1                              ; 572C   02B1
        MOVR    R0,     R2                      ; 572D   0082
        MOVR    R0,     R3                      ; 572E   0083
        PULR    R7                              ; 572F   02B7
        PSHR    R5                              ; 5730   0275
        MOVR    R1,     R5                      ; 5731   008D
L_5732:
        MVI@    R4,     R1                      ; 5732   02A1
        MVO@    R1,     R5                      ; 5733   0269
        DECR    R0                              ; 5734   0010
        BNEQ    L_5732                          ; 5735   022C 0004

        PULR    R7                              ; 5737   02B7
        PSHR    R5                              ; 5738   0275
        CLRR    R5                              ; 5739   01ED
L_573A:
        PSHR    R0                              ; 573A   0270
L_573B:
        MVO@    R5,     R4                      ; 573B   0265
        DECR    R0                              ; 573C   0010
        BNEQ    L_573B                          ; 573D   022C 0003

        PULR    R0                              ; 573F   02B0
        PULR    R7                              ; 5740   02B7
        PSHR    R5                              ; 5741   0275
        MOVR    R1,     R5                      ; 5742   008D
        B       L_573A                          ; 5743   0220 000A

        PSHR    R5                              ; 5745   0275
        MOVR    R0,     R5                      ; 5746   0085
        MVII    #$0001, R0                      ; 5747   02B8 0001
        INCR    R7                              ; 5749   000F
L_574A:
        SLL     R0,     1                       ; 574A   0048
        DECR    R5                              ; 574B   0015
        BPL     L_574A                          ; 574C   0223 0003

        PULR    R7                              ; 574E   02B7
        PSHR    R5                              ; 574F   0275
L_5750:
        ANDI    #$00FF, R0                      ; 5750   03B8 00FF
        SWAP    R0,     1                       ; 5752   0040
        ANDI    #$00FF, R1                      ; 5753   03B9 00FF
        XORR    R1,     R0                      ; 5755   01C8
        PULR    R7                              ; 5756   02B7
        PSHR    R5                              ; 5757   0275
        PSHR    R0                              ; 5758   0270

        JSR     R5,     X_EXT_SIGN_LO           ; 5759   0004 0114 0268

        MOVR    R0,     R1                      ; 575C   0081
        PULR    R0                              ; 575D   02B0
        B       L_566A                          ; 575E   0220 00F5

        PSHR    R5                              ; 5760   0275
        INCR    R1                              ; 5761   0009
        MVI@    R1,     R0                      ; 5762   0288
        DECR    R1                              ; 5763   0011
        TSTR    R0                              ; 5764   0080
        PULR    R7                              ; 5765   02B7
        MOVR    R1,     R0                      ; 5766   0088
        SUBI    #$031D, R0                      ; 5767   0338 031D
        SLR     R0,     2                       ; 5769   0064
        SLR     R0,     1                       ; 576A   0060
        MOVR    R5,     R7                      ; 576B   00AF
        MOVR    R0,     R1                      ; 576C   0081
        SLL     R1,     2                       ; 576D   004D
        SLL     R1,     1                       ; 576E   0049
        ADDI    #$031D, R1                      ; 576F   02F9 031D
        MOVR    R5,     R7                      ; 5771   00AF
        PSHR    R5                              ; 5772   0275

        JSR     R5,     .EXEC.76C               ; 5773   0004 0114 036C

        INCR    R7                              ; 5776   000F
        PSHR    R5                              ; 5777   0275
        MOVR    R1,     R5                      ; 5778   008D
        ADDI    #$0002, R5                      ; 5779   02FD 0002
        MVI@    R5,     R2                      ; 577B   02AA
        SWAP    R2,     1                       ; 577C   0042
        ANDI    #$00FF, R2                      ; 577D   03BA 00FF
        MVI@    R5,     R3                      ; 577F   02AB
        SWAP    R3,     1                       ; 5780   0043
        ANDI    #$00FF, R3                      ; 5781   03BB 00FF
        PULR    R7                              ; 5783   02B7
        MVI@    R4,     R0                      ; 5784   02A0
        SWAP    R0,     1                       ; 5785   0040
        ANDI    #$00FF, R0                      ; 5786   03B8 00FF
        MVI@    R4,     R1                      ; 5788   02A1
        SWAP    R1,     1                       ; 5789   0041
        ANDI    #$00FF, R1                      ; 578A   03B9 00FF
        PSHR    R5                              ; 578C   0275
        PSHR    R0                              ; 578D   0270
        SUBR    R2,     R0                      ; 578E   0110
        NEGR    R0                              ; 578F   0020
        PSHR    R0                              ; 5790   0270
        PSHR    R1                              ; 5791   0271

        JSR     R5,     X_SQUARE                ; 5792   0004 011C 01DB

        PULR    R0                              ; 5795   02B0
        MOVR    R0,     R4                      ; 5796   0084
        SUBR    R3,     R0                      ; 5797   0118
        NEGR    R0                              ; 5798   0020
        PSHR    R0                              ; 5799   0270
        PSHR    R2                              ; 579A   0272

        JSR     R5,     X_SQUARE                ; 579B   0004 011C 01DB

        ADD@    R6,     R2                      ; 579E   02F2
        PULR    R1                              ; 579F   02B1
        PULR    R0                              ; 57A0   02B0
        PULR    R3                              ; 57A1   02B3
        PULR    R7                              ; 57A2   02B7
        PSHR    R5                              ; 57A3   0275

        JSR     R5,     .EXEC.784               ; 57A4   0004 0114 0384

        MOVR    R0,     R3                      ; 57A7   0083
        MOVR    R1,     R4                      ; 57A8   008C
        MOVR    R2,     R1                      ; 57A9   0091
        PULR    R5                              ; 57AA   02B5
        J       X_SQRT                          ; 57AB   0004 031C 0223

        INCR    R1                              ; 57AE   0009
        CLRR    R0                              ; 57AF   01C0
        MVO@    R0,     R1                      ; 57B0   0248
        DECR    R1                              ; 57B1   0011
        MOVR    R5,     R7                      ; 57B2   00AF
        PSHR    R5                              ; 57B3   0275
        MVII    #$0007, R2                      ; 57B4   02BA 0007
L_57B6:
        MOVR    R2,     R0                      ; 57B6   0090

        JSR     R5,     .EXEC.76C               ; 57B7   0004 0114 036C
        JSR     R5,     .EXEC.7AE               ; 57BA   0004 0114 03AE

        DECR    R2                              ; 57BD   0012
        BPL     L_57B6                          ; 57BE   0223 0009

        PULR    R7                              ; 57C0   02B7
        PSHR    R1                              ; 57C1   0271
        PSHR    R2                              ; 57C2   0272
        PSHR    R3                              ; 57C3   0273
        PSHR    R4                              ; 57C4   0274
        SDBD                                    ; 57C5   0001
        MVII    #$17D0, R4                      ; 57C6   02BC 00D0 0017
        PSHR    R4                              ; 57C9   0274
        PSHR    R5                              ; 57CA   0275
        MOVR    R6,     R5                      ; 57CB   00B5
        SUBI    #$0003, R5                      ; 57CC   033D 0003
        MVI@    R5,     R4                      ; 57CE   02AC
        PULR    R7                              ; 57CF   02B7
        PULR    R4                              ; 57D0   02B4
        PULR    R3                              ; 57D1   02B3
L_57D2:
        PULR    R2                              ; 57D2   02B2
        PULR    R1                              ; 57D3   02B1
L_57D4:
        PULR    R7                              ; 57D4   02B7
        PSHR    R5                              ; 57D5   0275

        JSR     R5,     X_READ_ROM_HDR          ; 57D6   0004 0110 00AB

        EIS                                     ; 57D9   0002
        MVII    #$0125, R4                      ; 57DA   02BC 0125
L_57DC:
        SDBD                                    ; 57DC   0001
        MVI@    R5,     R0                      ; 57DD   02A8
        SDBD                                    ; 57DE   0001
        MVI@    R5,     R3                      ; 57DF   02AB
        TSTR    R0                              ; 57E0   0080
        BEQ     L_581D                          ; 57E1   0204 003A

        MOVR    R4,     R2                      ; 57E3   00A2
        SDBD                                    ; 57E4   0001
        MVI@    R4,     R1                      ; 57E5   02A1
        SUBI    #$0001, R1                      ; 57E6   0339 0001
        BLT     L_57DC                          ; 57E8   0225 000D

        MOVR    R2,     R4                      ; 57EA   0094
        MVO@    R1,     R4                      ; 57EB   0261
        SWAP    R1,     1                       ; 57EC   0041
        MVO@    R1,     R4                      ; 57ED   0261
        BNEQ    L_57DC                          ; 57EE   022C 0013

        MOVR    R2,     R4                      ; 57F0   0094
        MVO@    R3,     R4                      ; 57F1   0263
        SWAP    R3,     1                       ; 57F2   0043
        MVO@    R3,     R4                      ; 57F3   0263
        PSHR    R5                              ; 57F4   0275
        MOVR    R7,     R5                      ; 57F5   00BD
        ADDI    #$0004, R5                      ; 57F6   02FD 0004
        PSHR    R4                              ; 57F8   0274
        MOVR    R0,     R7                      ; 57F9   0087
        PULR    R4                              ; 57FA   02B4
        PULR    R5                              ; 57FB   02B5
        B       L_57DC                          ; 57FC   0220 0021

        PSHR    R5                              ; 57FE   0275

        JSR     R5,     X_READ_ROM_HDR          ; 57FF   0004 0110 00AB

        EIS                                     ; 5802   0002
        MVII    #$0125, R4                      ; 5803   02BC 0125
L_5805:
        SDBD                                    ; 5805   0001
        MVI@    R5,     R0                      ; 5806   02A8
        TSTR    R0                              ; 5807   0080
        BEQ     L_581D                          ; 5808   0204 0013

        SDBD                                    ; 580A   0001
        MVI@    R5,     R0                      ; 580B   02A8
        MVO@    R0,     R4                      ; 580C   0260
        SWAP    R0,     1                       ; 580D   0040
        MVO@    R0,     R4                      ; 580E   0260
        B       L_5805                          ; 580F   0220 000B

        PSHR    R5                              ; 5811   0275
        PSHR    R4                              ; 5812   0274

        JSR     R5,     X_READ_ROM_HDR          ; 5813   0004 0110 00AB

        EIS                                     ; 5816   0002
        PULR    R4                              ; 5817   02B4
        SUBR    R5,     R1                      ; 5818   0129
        SAR     R1,     1                       ; 5819   0069
        ADDI    #$0125, R1                      ; 581A   02F9 0125
        MOVR    R1,     R5                      ; 581C   008D
L_581D:
        PULR    R7                              ; 581D   02B7
        PSHR    R5                              ; 581E   0275
        PSHR    R1                              ; 581F   0271
        PSHR    R2                              ; 5820   0272
        MOVR    R1,     R5                      ; 5821   008D
        SDBD                                    ; 5822   0001
        MVI@    R5,     R0                      ; 5823   02A8
        SDBD                                    ; 5824   0001
        MVI@    R5,     R2                      ; 5825   02AA
        SLL     R2,     1                       ; 5826   004A
        SLR     R2,     1                       ; 5827   0062

        JSR     R5,     .EXEC.811               ; 5828   0004 0118 0011

        MVO@    R2,     R5                      ; 582B   026A
        SWAP    R2,     1                       ; 582C   0042
        MVO@    R2,     R5                      ; 582D   026A
        PULR    R2                              ; 582E   02B2
        PULR    R1                              ; 582F   02B1
        PULR    R7                              ; 5830   02B7
        PSHR    R5                              ; 5831   0275
        PSHR    R1                              ; 5832   0271

        JSR     R5,     .EXEC.811               ; 5833   0004 0118 0011

        B       L_584D                          ; 5836   0200 0015

        PSHR    R5                              ; 5838   0275
        PSHR    R1                              ; 5839   0271

        JSR     R5,     .EXEC.811               ; 583A   0004 0118 0011

        SDBD                                    ; 583D   0001
L_583E:
        MVI@    R5,     R0                      ; 583E   02A8
        SLL     R0,     1                       ; 583F   0048
        SETC                                    ; 5840   0007
        RRC     R0,     1                       ; 5841   0070
        B       L_584D                          ; 5842   0200 0009

        PSHR    R5                              ; 5844   0275
        PSHR    R1                              ; 5845   0271

        JSR     R5,     .EXEC.811               ; 5846   0004 0118 0011

        SDBD                                    ; 5849   0001
        MVI@    R5,     R0                      ; 584A   02A8
        SLL     R0,     1                       ; 584B   0048
        SLR     R0,     1                       ; 584C   0060
L_584D:
        MVO@    R0,     R1                      ; 584D   0248
        INCR    R1                              ; 584E   0009
        SWAP    R0,     1                       ; 584F   0040
        MVO@    R0,     R1                      ; 5850   0248
        PULR    R1                              ; 5851   02B1
        PULR    R7                              ; 5852   02B7
        PSHR    R5                              ; 5853   0275
        PSHR    R1                              ; 5854   0271
        PSHR    R4                              ; 5855   0274
        MOVR    R3,     R5                      ; 5856   009D
L_5857:
        MVO@    R5,     R4                      ; 5857   0265
        MVI     G_0105, R1                      ; 5858   0281 0105
        RRC     R1,     1                       ; 585A   0071
        BC      L_5861                          ; 585B   0201 0004

        SDBD                                    ; 585D   0001
        ANDI    #$DFFF, R5                      ; 585E   03BD 00FF 00DF
L_5861:
        DECR    R0                              ; 5861   0010
        BNEQ    L_5857                          ; 5862   022C 000C

        PULR    R4                              ; 5864   02B4
        PULR    R1                              ; 5865   02B1
        PULR    R7                              ; 5866   02B7
        PSHR    R5                              ; 5867   0275
        SETC                                    ; 5868   0007
        MOVR    R1,     R5                      ; 5869   008D
        B       L_587C                          ; 586A   0200 0010

        PSHR    R5                              ; 586C   0275
        SETC                                    ; 586D   0007
        MOVR    R1,     R5                      ; 586E   008D
        B       L_5872                          ; 586F   0200 0001

        CLRC                                    ; 5871   0006
L_5872:
        SLL     R3,     1                       ; 5872   004B
        RRC     R3,     1                       ; 5873   0073
        PSHR    R5                              ; 5874   0275

        JSR     R5,     .EXEC.853               ; 5875   0004 0118 0053

        PULR    R5                              ; 5878   02B5
        B       L_587E                          ; 5879   0200 0003

        CLRC                                    ; 587B   0006
L_587C:
        SLL     R3,     1                       ; 587C   004B
        RRC     R3,     1                       ; 587D   0073
L_587E:
        PSHR    R3                              ; 587E   0273
L_587F:
        MVI@    R5,     R0                      ; 587F   02A8
        ANDI    #$007F, R0                      ; 5880   03B8 007F
        BNEQ    L_5889                          ; 5882   020C 0005

        TSTR    R3                              ; 5884   009B
        PULR    R3                              ; 5885   02B3
        BMI     L_58FE                          ; 5886   020B 0076

        MOVR    R5,     R7                      ; 5888   00AF
L_5889:
        SUBI    #$0020, R0                      ; 5889   0338 0020
        SLL     R0,     2                       ; 588B   004C
        SLL     R0,     1                       ; 588C   0048
        XORR    R3,     R0                      ; 588D   01D8
        MVO@    R0,     R4                      ; 588E   0260
        MVI     G_0105, R0                      ; 588F   0280 0105
        RRC     R0,     1                       ; 5891   0070
        BC      L_587F                          ; 5892   0221 0014

        SDBD                                    ; 5894   0001
        ANDI    #$DFFF, R3                      ; 5895   03BB 00FF 00DF
        B       L_587F                          ; 5898   0220 001A

        DECLE   $0001                           ; 589A   0001

        INCR    R2                              ; 589B   000A
        SLR     R0,     2                       ; 589C   0064
        XOR@    R5,     R0                      ; 589D   03E8
        PSHR    R5                              ; 589E   0275
        PSHR    R0                              ; 589F   0270
        MOVR    R1,     R0                      ; 58A0   0088

        JSR     R5,     .EXEC.853               ; 58A1   0004 0118 0053

        PULR    R0                              ; 58A4   02B0

        JSR     R5,     .EXEC.7C1               ; 58A5   0004 0114 03C1

        SLL     R3,     1                       ; 58A8   004B
        SETC                                    ; 58A9   0007
        RRC     R3,     1                       ; 58AA   0073
        B       L_58C9                          ; 58AB   0200 001C

        PSHR    R5                              ; 58AD   0275

        JSR     R5,     .EXEC.7C1               ; 58AE   0004 0114 03C1

        MVII    #$0080, R2                      ; 58B1   02BA 0080
        XORR    R3,     R2                      ; 58B3   01DA
        B       L_58CA                          ; 58B4   0200 0014

        PSHR    R5                              ; 58B6   0275
        PSHR    R0                              ; 58B7   0270
        MVI     G_0105, R0                      ; 58B8   0280 0105
        RRC     R0,     1                       ; 58BA   0070
        BC      L_58C3                          ; 58BB   0201 0006

        SDBD                                    ; 58BD   0001
        MVII    #$DFFF, R5                      ; 58BE   02BD 00FF 00DF
        ANDR    R5,     R3                      ; 58C1   01AB
        ANDR    R5,     R2                      ; 58C2   01AA
L_58C3:
        PULR    R0                              ; 58C3   02B0
        PULR    R7                              ; 58C4   02B7
        PSHR    R5                              ; 58C5   0275

        JSR     R5,     .EXEC.7C1               ; 58C6   0004 0114 03C1

L_58C9:
        MOVR    R3,     R2                      ; 58C9   009A
L_58CA:
        TSTR    R0                              ; 58CA   0080
        BPL     L_58D6                          ; 58CB   0203 0009

        NEGR    R0                              ; 58CD   0020
        DECR    R1                              ; 58CE   0011
        MVII    #$0068, R5                      ; 58CF   02BD 0068
        XORR    R3,     R5                      ; 58D1   01DD
        MVO@    R5,     R4                      ; 58D2   0265

        JSR     R5,     .EXEC.8B6               ; 58D3   0004 0118 00B6

L_58D6:
        ADDR    R7,     R1                      ; 58D6   00F9
        SUBI    #$003E, R1                      ; 58D7   0339 003E
L_58D9:
        MVI@    R1,     R5                      ; 58D9   028D
        CMPR    R5,     R0                      ; 58DA   0168
        BPL     L_58EA                          ; 58DB   0203 000D

        DECR    R5                              ; 58DD   0015
        BEQ     L_58EA                          ; 58DE   0204 000A

        TSTR    R3                              ; 58E0   009B
        BMI     L_58E7                          ; 58E1   020B 0004

        MVO@    R2,     R4                      ; 58E3   0262

        JSR     R5,     .EXEC.8B6               ; 58E4   0004 0118 00B6

L_58E7:
        DECR    R1                              ; 58E7   0011
        B       L_58D9                          ; 58E8   0220 0010

L_58EA:
        MVII    #$0080, R2                      ; 58EA   02BA 0080
L_58EC:
        SUB@    R1,     R0                      ; 58EC   0308
        BMI     L_58F3                          ; 58ED   020B 0004

        ADDI    #$0008, R2                      ; 58EF   02FA 0008
        B       L_58EC                          ; 58F1   0220 0006

L_58F3:
        ADD@    R1,     R0                      ; 58F3   02C8
        XORR    R3,     R2                      ; 58F4   01DA
        MVO@    R2,     R4                      ; 58F5   0262

        JSR     R5,     .EXEC.8B6               ; 58F6   0004 0118 00B6

        MVI@    R1,     R2                      ; 58F9   028A
        DECR    R1                              ; 58FA   0011
        DECR    R2                              ; 58FB   0012
        BNEQ    L_58EA                          ; 58FC   022C 0013

L_58FE:
        PULR    R7                              ; 58FE   02B7

        JSR     R4,     .EXEC.910               ; 58FF   0004 0018 0110
        DECLE   $0000,  $0000                   ; 5902   0000 0000

        SLL     R0,     2                       ; 5904   004C
        COMR    R1                              ; 5905   0019
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5906   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 590A   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 590E   0000 0000

        MVO     R4,     G_035D                  ; 5910   0244 035D
        MVII    #$0131, R4                      ; 5912   02BC 0131
        MVO@    R2,     R4                      ; 5914   0262
        SUBI    #$0200, R1                      ; 5915   0339 0200
        MVO@    R1,     R4                      ; 5917   0261
        MVO@    R0,     R4                      ; 5918   0260
        ADDI    #$0003, R4                      ; 5919   02FC 0003
        MVO@    R5,     R4                      ; 591B   0265
        MOVR    R5,     R0                      ; 591C   00A8
        SWAP    R0,     1                       ; 591D   0040
        MVO@    R0,     R4                      ; 591E   0260
        MVO@    R3,     R4                      ; 591F   0263
        SWAP    R3,     1                       ; 5920   0043
        MVO@    R3,     R4                      ; 5921   0263
L_5922:
        MVII    #$0132, R4                      ; 5922   02BC 0132
        MVI@    R4,     R1                      ; 5924   02A1
        ADDI    #$0200, R1                      ; 5925   02F9 0200
        MVI@    R4,     R0                      ; 5927   02A0
        CLRR    R5                              ; 5928   01ED
        MVO@    R5,     R4                      ; 5929   0265
        MVO@    R5,     R4                      ; 592A   0265
        MVO@    R5,     R4                      ; 592B   0265
        ADDI    #$0002, R4                      ; 592C   02FC 0002
        SDBD                                    ; 592E   0001
        XOR@    R4,     R5                      ; 592F   03E5
L_5930:
        MVO@    R5,     R1                      ; 5930   024D
        DECR    R1                              ; 5931   0011
        DECR    R0                              ; 5932   0010
        BNEQ    L_5930                          ; 5933   022C 0004

        PULR    R7                              ; 5935   02B7
        PSHR    R5                              ; 5936   0275
L_5937:
        MVI     G_0149, R0                      ; 5937   0280 0149
        TSTR    R0                              ; 5939   0080
        BEQ     L_58FE                          ; 593A   0224 003D

        MVI     G_035F, R0                      ; 593C   0280 035F
        SDBD                                    ; 593E   0001
        SUBI    #$160A, R0                      ; 593F   0338 000A 0016
        BMI     L_58FE                          ; 5942   022B 0045

        CMPI    #$0014, R0                      ; 5944   0378 0014
        BGT     L_58FE                          ; 5946   022E 0049

        JSR     R5,     X_PLAY_RAZZ2            ; 5948   0004 011C 02BD

        PULR    R7                              ; 594B   02B7
        PSHR    R5                              ; 594C   0275
        CMP     G_0131, R1                      ; 594D   0341 0131
        BNEQ    L_58FE                          ; 594F   022C 0052

        CMPI    #$000A, R0                      ; 5951   0378 000A
        BEQ     L_5922                          ; 5953   0224 0032

        MVII    #$0134, R5                      ; 5955   02BD 0134
        MVI@    R5,     R2                      ; 5957   02AA
        CMPI    #$000B, R0                      ; 5958   0378 000B
        BNEQ    L_5967                          ; 595A   020C 000B

        MOVR    R7,     R0                      ; 595C   00B8
        SUBI    #$0057, R0                      ; 595D   0338 0057
        MVI     G_035D, R3                      ; 595F   0283 035D
        MVO     R0,     G_035D                  ; 5961   0240 035D
        SDBD                                    ; 5963   0001
        MVI@    R5,     R0                      ; 5964   02A8
        SDBD                                    ; 5965   0001
        MVI@    R5,     R7                      ; 5966   02AF
L_5967:
        MVII    #$0133, R5                      ; 5967   02BD 0133
        CMP@    R5,     R2                      ; 5969   036A
        BEQ     L_5937                          ; 596A   0224 0034

        INCR    R2                              ; 596C   000A
        MVO@    R2,     R5                      ; 596D   026A
        MOVR    R5,     R4                      ; 596E   00AC
        SDBD                                    ; 596F   0001
        MVI@    R5,     R1                      ; 5970   02A9
        SLL     R1,     1                       ; 5971   0049
        PSHR    R1                              ; 5972   0271
        SLL     R1,     2                       ; 5973   004D
        ADD@    R6,     R1                      ; 5974   02F1
        ADDR    R0,     R1                      ; 5975   00C1
        MVO@    R1,     R4                      ; 5976   0261
        SWAP    R1,     1                       ; 5977   0041
        MVO@    R1,     R4                      ; 5978   0261
        MVI     G_0132, R1                      ; 5979   0281 0132
        ADDI    #$0200, R1                      ; 597B   02F9 0200
        SLL     R0,     2                       ; 597D   004C
        SLL     R0,     1                       ; 597E   0048
        ADDI    #$0080, R0                      ; 597F   02F8 0080
        ADDI    #$0002, R5                      ; 5981   02FD 0002
        SDBD                                    ; 5983   0001
        XOR@    R5,     R0                      ; 5984   03E8
L_5985:
        MVI@    R1,     R3                      ; 5985   028B
        MVO@    R0,     R1                      ; 5986   0248
        MOVR    R3,     R0                      ; 5987   0098
        DECR    R1                              ; 5988   0011
        DECR    R2                              ; 5989   0012
        BNEQ    L_5985                          ; 598A   022C 0006

        PULR    R7                              ; 598C   02B7
        PSHR    R5                              ; 598D   0275

        JSR     R5,     .EXEC.76C               ; 598E   0004 0114 036C

        INCR    R7                              ; 5991   000F
        PSHR    R5                              ; 5992   0275

        JSR     R5,     .EXEC.766               ; 5993   0004 0114 0366

        PSHR    R1                              ; 5996   0271
        ADDI    #$0006, R1                      ; 5997   02F9 0006
        CLRR    R5                              ; 5999   01ED
        MVO@    R5,     R1                      ; 599A   024D
        MOVR    R0,     R1                      ; 599B   0081
        ADDI    #$013B, R1                      ; 599C   02F9 013B
        MVO@    R5,     R1                      ; 599E   024D
        PULR    R1                              ; 599F   02B1
L_59A0:
        PULR    R7                              ; 59A0   02B7
        SETC                                    ; 59A1   0007
        INCR    R7                              ; 59A2   000F
        CLRC                                    ; 59A3   0006
        RLC     R3,     1                       ; 59A4   0053
        PSHR    R5                              ; 59A5   0275
        B       L_59C1                          ; 59A6   0200 0019

        PSHR    R5                              ; 59A8   0275

        JSR     R5,     .EXEC.766               ; 59A9   0004 0114 0366

        INCR    R7                              ; 59AC   000F
        PSHR    R5                              ; 59AD   0275

        JSR     R5,     .EXEC.76C               ; 59AE   0004 0114 036C

        MOVR    R0,     R5                      ; 59B1   0085
        ADDI    #$013B, R5                      ; 59B2   02FD 013B
        MVO@    R3,     R5                      ; 59B4   026B
        ADDI    #$0007, R1                      ; 59B5   02F9 0007
        MVO@    R2,     R1                      ; 59B7   024A
        PULR    R5                              ; 59B8   02B5
        SETC                                    ; 59B9   0007
        INCR    R7                              ; 59BA   000F
        CLRC                                    ; 59BB   0006
        PSHR    R5                              ; 59BC   0275
        RLC     R3,     1                       ; 59BD   0053

        JSR     R5,     .EXEC.76C               ; 59BE   0004 0114 036C
L_59C1:
        JSR     R5,     .EXEC.7C1               ; 59C1   0004 0114 03C1

        ADDI    #$0002, R1                      ; 59C4   02F9 0002
        MOVR    R1,     R4                      ; 59C6   008C
        PSHR    R4                              ; 59C7   0274
        PSHR    R3                              ; 59C8   0273
        MOVR    R2,     R3                      ; 59C9   0093
L_59CA:
        ANDI    #$00FF, R3                      ; 59CA   03BB 00FF
        XORR    R3,     R2                      ; 59CC   01DA
        SWAP    R2,     1                       ; 59CD   0042

        JSR     R5,     .EXEC.7A3               ; 59CE   0004 0114 03A3

        PULR    R1                              ; 59D1   02B1
        MOVR    R3,     R0                      ; 59D2   0098
        BPL     L_59D6                          ; 59D3   0203 0001

        NEGR    R3                              ; 59D5   0023
L_59D6:
        ADDR    R3,     R3                      ; 59D6   00DB
        SARC    R1,     1                       ; 59D7   0079
        SLL     R1,     1                       ; 59D8   0049
        RLC     R3,     1                       ; 59D9   0053
        PSHR    R3                              ; 59DA   0273
        PSHR    R1                              ; 59DB   0271
        MOVR    R2,     R3                      ; 59DC   0093

        JSR     R5,     X_MPY                   ; 59DD   0004 011C 01DC

        PULR    R1                              ; 59E0   02B1
        PULR    R5                              ; 59E1   02B5
        MOVR    R4,     R0                      ; 59E2   00A0
        BPL     L_59E6                          ; 59E3   0203 0001

        NEGR    R4                              ; 59E5   0024
L_59E6:
        ADDR    R4,     R4                      ; 59E6   00E4
        ADDR    R4,     R4                      ; 59E7   00E4
        CMPR    R5,     R4                      ; 59E8   016C
        BLT     L_59F0                          ; 59E9   0205 0005

        ANDI    #$0001, R5                      ; 59EB   03BD 0001
        XORR    R4,     R5                      ; 59ED   01E5
        XORI    #$0002, R5                      ; 59EE   03FD 0002
L_59F0:
        PSHR    R5                              ; 59F0   0275
        MOVR    R2,     R4                      ; 59F1   0094

        JSR     R5,     X_MPY                   ; 59F2   0004 011C 01DC

        MOVR    R2,     R1                      ; 59F5   0091
        MOVR    R3,     R2                      ; 59F6   009A

        JSR     R5,     X_DIVR                  ; 59F7   0004 011C 01F8

        MOVR    R3,     R2                      ; 59FA   009A
        MOVR    R0,     R3                      ; 59FB   0083
        MOVR    R4,     R1                      ; 59FC   00A1

        JSR     R5,     X_DIVR                  ; 59FD   0004 011C 01F8

        ANDI    #$00FF, R3                      ; 5A00   03BB 00FF
        ANDI    #$00FF, R0                      ; 5A02   03B8 00FF
        SWAP    R0,     1                       ; 5A04   0040
        XORR    R3,     R0                      ; 5A05   01D8
        PULR    R3                              ; 5A06   02B3
        PULR    R4                              ; 5A07   02B4
        ADDI    #$0002, R4                      ; 5A08   02FC 0002
        MVO@    R0,     R4                      ; 5A0A   0260
        SARC    R3,     1                       ; 5A0B   007B
        BNC     L_59A0                          ; 5A0C   0229 006D

        CLRR    R1                              ; 5A0E   01C9
        CLRR    R2                              ; 5A0F   01D2

        JSR     R5,     .EXEC.477               ; 5A10   0004 0114 0077

        SARC    R3,     1                       ; 5A13   007B
        BC      L_5A17                          ; 5A14   0201 0001

        MOVR    R1,     R2                      ; 5A16   008A
L_5A17:
        TSTR    R2                              ; 5A17   0092
        BPL     L_5A1B                          ; 5A18   0203 0001

        NEGR    R2                              ; 5A1A   0022
L_5A1B:
        MOVR    R3,     R1                      ; 5A1B   0099
        SWAP    R1,     1                       ; 5A1C   0041
        SLR     R1,     1                       ; 5A1D   0061
        SLR     R2,     1                       ; 5A1E   0062

        JSR     R5,     X_DIVR                  ; 5A1F   0004 011C 01F8

        TSTR    R0                              ; 5A22   0080
        BNEQ    L_5A28                          ; 5A23   020C 0003

        DECR    R4                              ; 5A25   0014
        MVO@    R0,     R4                      ; 5A26   0260
        INCR    R0                              ; 5A27   0008
L_5A28:
        INCR    R4                              ; 5A28   000C
        MVO@    R0,     R4                      ; 5A29   0260
        MOVR    R4,     R1                      ; 5A2A   00A1

        JSR     R5,     .EXEC.766               ; 5A2B   0004 0114 0366

        PULR    R7                              ; 5A2E   02B7
        PSHR    R5                              ; 5A2F   0275
        PSHR    R2                              ; 5A30   0272
        CLRR    R5                              ; 5A31   01ED
        NEGR    R1                              ; 5A32   0021
        BGE     L_5A39                          ; 5A33   020D 0004

        ADDI    #$0008, R5                      ; 5A35   02FD 0008
        NEGR    R0                              ; 5A37   0020
        NEGR    R1                              ; 5A38   0021
L_5A39:
        TSTR    R0                              ; 5A39   0080
        BGE     L_5A42                          ; 5A3A   020D 0006

        MOVR    R1,     R2                      ; 5A3C   008A
        NEGR    R0                              ; 5A3D   0020
        MOVR    R0,     R1                      ; 5A3E   0081
        MOVR    R2,     R0                      ; 5A3F   0090
        ADDI    #$0004, R5                      ; 5A40   02FD 0004
L_5A42:
        MOVR    R1,     R2                      ; 5A42   008A
        SLL     R2,     2                       ; 5A43   004E
        CMPR    R2,     R0                      ; 5A44   0150
        BGT     L_5A59                          ; 5A45   020E 0012

        INCR    R5                              ; 5A47   000D
        MOVR    R0,     R2                      ; 5A48   0082
        SUBR    R1,     R2                      ; 5A49   010A
        SLL     R2,     2                       ; 5A4A   004E
        CMPR    R2,     R0                      ; 5A4B   0150
        BLE     L_5A59                          ; 5A4C   0206 000B

        INCR    R5                              ; 5A4E   000D
        NEGR    R2                              ; 5A4F   0022
        CMPR    R2,     R1                      ; 5A50   0151
        BGT     L_5A59                          ; 5A51   020E 0006

        INCR    R5                              ; 5A53   000D
        SLL     R0,     2                       ; 5A54   004C
        CMPR    R0,     R1                      ; 5A55   0141
        BLE     L_5A59                          ; 5A56   0206 0001

        INCR    R5                              ; 5A58   000D
L_5A59:
        MOVR    R5,     R1                      ; 5A59   00A9
L_5A5A:
        ANDI    #$000F, R1                      ; 5A5A   03B9 000F
        PULR    R2                              ; 5A5C   02B2
        PULR    R7                              ; 5A5D   02B7
        PSHR    R5                              ; 5A5E   0275
        MOVR    R1,     R5                      ; 5A5F   008D
        INCR    R7                              ; 5A60   000F
        MVI@    R5,     R0                      ; 5A61   02A8
        MVO     R5,     G_0143                  ; 5A62   0245 0143
        MOVR    R5,     R1                      ; 5A64   00A9
        SWAP    R1,     1                       ; 5A65   0041
        MVO     R1,     G_0144                  ; 5A66   0241 0144

        JSR     R5,     X_READ_ROM_HDR          ; 5A68   0004 0110 00AB

        EIS                                     ; 5A6B   0002
        MOVR    R5,     R1                      ; 5A6C   00A9
        PULR    R5                              ; 5A6D   02B5
        J       .EXEC.831                       ; 5A6E   0004 0318 0031

        PSHR    R5                              ; 5A71   0275
        MVII    #$0143, R5                      ; 5A72   02BD 0143
        SDBD                                    ; 5A74   0001
        MVI@    R5,     R7                      ; 5A75   02AF
        CMP     G_0146, R3                      ; 5A76   0343 0146
        BLT     L_5A93                          ; 5A78   0205 0019
        BGT     L_5A80                          ; 5A7A   020E 0004

        RRC     R3,     1                       ; 5A7C   0073
        BC      L_5A93                          ; 5A7D   0201 0014

        RLC     R3,     1                       ; 5A7F   0053
L_5A80:
        MVO     R3,     G_0146                  ; 5A80   0243 0146
        MOVR    R4,     R7                      ; 5A82   00A7
        PSHR    R5                              ; 5A83   0275
        PSHR    R0                              ; 5A84   0270
        PSHR    R1                              ; 5A85   0271
        MVII    #$01F0, R4                      ; 5A86   02BC 01F0
        MVII    #$000E, R0                      ; 5A88   02B8 000E

        JSR     R5,     X_FILL_ZERO             ; 5A8A   0004 0114 0338

        MVII    #$0038, R0                      ; 5A8D   02B8 0038
        MVO     R0,     .PSG0.chan_enable       ; 5A8F   0240 01F8
        PULR    R1                              ; 5A91   02B1
        PULR    R0                              ; 5A92   02B0
L_5A93:
        PULR    R7                              ; 5A93   02B7
L_5A94:
        MVII    #$0002, R4                      ; 5A94   02BC 0002
        MVO     R4,     G_0148                  ; 5A96   0244 0148
        MVO     R5,     G_035F                  ; 5A98   0245 035F

        JSR     R5,     .EXEC.A83               ; 5A9A   0004 0118 0283

L_5A9D:
        MVO     R0,     G_0149                  ; 5A9D   0240 0149
        CLRR    R0                              ; 5A9F   01C0
        MVO     R0,     G_0145                  ; 5AA0   0240 0145
        PULR    R7                              ; 5AA2   02B7
L_5AA3:
        SUBI    #$0003, R6                      ; 5AA3   033E 0003

L_5AA5:
        JSR     R5,     .EXEC.A83               ; 5AA5   0004 0118 0283

L_5AA8:
        MVII    #$00FF, R0                      ; 5AA8   02B8 00FF
        MVO     R0,     G_0145                  ; 5AAA   0240 0145
        PULR    R7                              ; 5AAC   02B7
        MVI     G_0145, R0                      ; 5AAD   0280 0145
        DECR    R0                              ; 5AAF   0010
        BMI     L_5ABC                          ; 5AB0   020B 000A

        PSHR    R5                              ; 5AB2   0275
        CLRR    R0                              ; 5AB3   01C0
        MVO     R0,     G_0145                  ; 5AB4   0240 0145
        MVO     R0,     G_0149                  ; 5AB6   0240 0149
        MVO     R0,     G_0146                  ; 5AB8   0240 0146
        MVI     G_035F, R7                      ; 5ABA   0287 035F
L_5ABC:
        MOVR    R5,     R7                      ; 5ABC   00AF
        MVII    #$0148, R1                      ; 5ABD   02B9 0148
        MVI@    R1,     R0                      ; 5ABF   0288
        DECR    R0                              ; 5AC0   0010
        MVO@    R0,     R1                      ; 5AC1   0248
        BNEQ    L_5ABC                          ; 5AC2   022C 0007

        MVI     G_0147, R2                      ; 5AC4   0282 0147
        MVO@    R2,     R1                      ; 5AC6   024A
        XOR     G_0145, R0                      ; 5AC7   03C0 0145
        BNEQ    L_5ABC                          ; 5AC9   022C 000E

        PSHR    R5                              ; 5ACB   0275
        ADD     G_0149, R7                      ; 5ACC   02C7 0149
        MVO@    R0,     R1                      ; 5ACE   0248
        PULR    R7                              ; 5ACF   02B7
        B       L_5B2B                          ; 5AD0   0200 0059
        B       L_5B52                          ; 5AD2   0200 007E
        B       L_5B61                          ; 5AD4   0200 008B
        B       L_5B72                          ; 5AD6   0200 009A
        B       L_5B99                          ; 5AD8   0200 00BF
        B       L_5BFE                          ; 5ADA   0200 0122

        SLLC    R1,     2                       ; 5ADC   005D
        INCR    R5                              ; 5ADD   000D
        MOVR    R3,     R4                      ; 5ADE   009C
        INCR    R4                              ; 5ADF   000C
        ADDR    R4,     R7                      ; 5AE0   00E7
        INCR    R3                              ; 5AE1   000B
        RSWD    R4                              ; 5AE2   003C
        INCR    R3                              ; 5AE3   000B
        TSTR    R3                              ; 5AE4   009B
        INCR    R2                              ; 5AE5   000A
        DIS                                     ; 5AE6   0003
        INCR    R2                              ; 5AE7   000A
        RRC     R2,     1                       ; 5AE8   0072
        INCR    R1                              ; 5AE9   0009
        ADDR    R5,     R3                      ; 5AEA   00EB
        INCR    R0                              ; 5AEB   0008
        SAR     R3,     1                       ; 5AEC   006B
        INCR    R0                              ; 5AED   0008
        ADDR    R6,     R2                      ; 5AEE   00F2
        SETC                                    ; 5AEF   0007
        SARC    R3,     2                       ; 5AF0   007F
        SETC                                    ; 5AF1   0007
        DECR    R4                              ; 5AF2   0014
        SETC                                    ; 5AF3   0007
        PSHR    R5                              ; 5AF4   0275
        PSHR    R3                              ; 5AF5   0273
        PSHR    R4                              ; 5AF6   0274
        CLRR    R1                              ; 5AF7   01C9
L_5AF8:
        MVI     G_035F, R5                      ; 5AF8   0285 035F
        MVI@    R5,     R3                      ; 5AFA   02AB
        MVO     R5,     G_035F                  ; 5AFB   0245 035F
        TSTR    R3                              ; 5AFD   009B
        BEQ     L_5AA3                          ; 5AFE   0224 005C

        SARC    R3,     2                       ; 5B00   007F
        RLC     R1,     2                       ; 5B01   0055
        SARC    R3,     1                       ; 5B02   007B
        RLC     R1,     1                       ; 5B03   0051
        CLRR    R2                              ; 5B04   01D2
        SARC    R3,     1                       ; 5B05   007B
        RLC     R2,     1                       ; 5B06   0052
        CMPI    #$003F, R3                      ; 5B07   037B 003F
        BEQ     L_5AF8                          ; 5B09   0224 0012

        INCR    R1                              ; 5B0B   0009
        SLL     R1,     2                       ; 5B0C   004D
        MOVR    R3,     R0                      ; 5B0D   0098
        BEQ     L_5B24                          ; 5B0E   0204 0014

        CLRR    R4                              ; 5B10   01E4
        MVII    #$000C, R5                      ; 5B11   02BD 000C
L_5B13:
        INCR    R4                              ; 5B13   000C
        SUBR    R5,     R3                      ; 5B14   012B
        BPL     L_5B13                          ; 5B15   0223 0003

        ADDR    R3,     R5                      ; 5B17   00DD
        ADDR    R5,     R5                      ; 5B18   00ED
        ADDR    R7,     R5                      ; 5B19   00FD
        SUBI    #$003E, R5                      ; 5B1A   033D 003E
        SDBD                                    ; 5B1C   0001
        MVI@    R5,     R0                      ; 5B1D   02A8
L_5B1E:
        SLR     R0,     1                       ; 5B1E   0060
        DECR    R4                              ; 5B1F   0014
        BNEQ    L_5B1E                          ; 5B20   022C 0003

        INCR    R0                              ; 5B22   0008
        SLR     R0,     1                       ; 5B23   0060
L_5B24:
        PULR    R4                              ; 5B24   02B4
        PULR    R3                              ; 5B25   02B3
        PULR    R7                              ; 5B26   02B7
        MVII    #$0002, R0                      ; 5B27   02B8 0002
        B       L_5A94                          ; 5B29   0220 0096

L_5B2B:
        JSR     R5,     .EXEC.AF4               ; 5B2B   0004 0118 02F4

        TSTR    R2                              ; 5B2E   0092
        BEQ     L_5B37                          ; 5B2F   0204 0006

        SUBI    #$0002, R1                      ; 5B31   0339 0002
        MVII    #$0004, R5                      ; 5B33   02BD 0004
        MVO     R5,     G_0149                  ; 5B35   0245 0149

L_5B37:
        JSR     R5,     .EXEC.BAE               ; 5B37   0004 0118 03AE

        MVII    #$01F0, R5                      ; 5B3A   02BD 01F0
        MVO@    R0,     R5                      ; 5B3C   0268
        MVO@    R0,     R5                      ; 5B3D   0268
        MVO@    R0,     R5                      ; 5B3E   0268
        CLRR    R2                              ; 5B3F   01D2
        MVO@    R2,     R5                      ; 5B40   026A
        SWAP    R0,     1                       ; 5B41   0040
        MVO@    R0,     R5                      ; 5B42   0268
        MVO@    R0,     R5                      ; 5B43   0268
        MVO@    R0,     R5                      ; 5B44   0268
L_5B45:
        CLRR    R2                              ; 5B45   01D2
        MVO@    R2,     R5                      ; 5B46   026A
        ADDI    #$0003, R5                      ; 5B47   02FD 0003
        TSTR    R0                              ; 5B49   0080
        BEQ     L_5B4E                          ; 5B4A   0204 0002

        MVII    #$000F, R0                      ; 5B4C   02B8 000F
L_5B4E:
        MVO@    R0,     R5                      ; 5B4E   0268
        MVO@    R0,     R5                      ; 5B4F   0268
        MVO@    R0,     R5                      ; 5B50   0268
        PULR    R7                              ; 5B51   02B7

L_5B52:
        JSR     R5,     .EXEC.A83               ; 5B52   0004 0118 0283

        MVII    #$0002, R1                      ; 5B55   02B9 0002

        JSR     R5,     .EXEC.BAE               ; 5B57   0004 0118 03AE

        MVO     R1,     G_0149                  ; 5B5A   0241 0149
        PULR    R7                              ; 5B5C   02B7
        MVII    #$0006, R0                      ; 5B5D   02B8 0006
        B       L_5A94                          ; 5B5F   0220 00CC

L_5B61:
        JSR     R5,     .EXEC.AF4               ; 5B61   0004 0118 02F4

        TSTR    R2                              ; 5B64   0092
        BEQ     L_5B6D                          ; 5B65   0204 0006

        SUBI    #$0002, R1                      ; 5B67   0339 0002
        MVII    #$0008, R5                      ; 5B69   02BD 0008
        MVO     R5,     G_0149                  ; 5B6B   0245 0149

L_5B6D:
        JSR     R5,     .EXEC.B7F               ; 5B6D   0004 0118 037F

        B       L_5B45                          ; 5B70   0220 002C

L_5B72:
        JSR     R5,     .EXEC.A83               ; 5B72   0004 0118 0283

        MVII    #$0002, R1                      ; 5B75   02B9 0002

        JSR     R5,     .EXEC.BAE               ; 5B77   0004 0118 03AE

        MVII    #$0006, R1                      ; 5B7A   02B9 0006
        MVO     R1,     G_0149                  ; 5B7C   0241 0149
        PULR    R7                              ; 5B7E   02B7
        PSHR    R5                              ; 5B7F   0275

        JSR     R5,     .EXEC.BAE               ; 5B80   0004 0118 03AE

        MVII    #$01F0, R5                      ; 5B83   02BD 01F0
        MVO@    R0,     R5                      ; 5B85   0268
        SLR     R0,     1                       ; 5B86   0060
        MVO@    R0,     R5                      ; 5B87   0268
        SLR     R0,     1                       ; 5B88   0060
        MVO@    R0,     R5                      ; 5B89   0268
        CLRR    R2                              ; 5B8A   01D2
        MVO@    R2,     R5                      ; 5B8B   026A
        SLL     R0,     2                       ; 5B8C   004C
        SWAP    R0,     1                       ; 5B8D   0040
        MVO@    R0,     R5                      ; 5B8E   0268
        NOP                                     ; 5B8F   0034
        SLR     R0,     1                       ; 5B90   0060
        MVO@    R0,     R5                      ; 5B91   0268
        SLR     R0,     1                       ; 5B92   0060
        MVO@    R0,     R5                      ; 5B93   0268
        PULR    R7                              ; 5B94   02B7
        MVII    #$000A, R0                      ; 5B95   02B8 000A
        B       L_5A94                          ; 5B97   0220 0104

L_5B99:
        JSR     R5,     .EXEC.AF4               ; 5B99   0004 0118 02F4
        JSR     R5,     .EXEC.B7F               ; 5B9C   0004 0118 037F

        MVII    #$0020, R1                      ; 5B9F   02B9 0020
        MVO@    R1,     R5                      ; 5BA1   0269
        ADDI    #$0002, R5                      ; 5BA2   02FD 0002
        MVO@    R2,     R5                      ; 5BA4   026A
        TSTR    R0                              ; 5BA5   0080
        BEQ     L_5BAA                          ; 5BA6   0204 0002

        MVII    #$003F, R0                      ; 5BA8   02B8 003F
L_5BAA:
        MVO@    R0,     R5                      ; 5BAA   0268
        MVO@    R0,     R5                      ; 5BAB   0268
        MVO@    R0,     R5                      ; 5BAC   0268
        PULR    R7                              ; 5BAD   02B7
        PSHR    R5                              ; 5BAE   0275
        PSHR    R0                              ; 5BAF   0270
        MVI     G_0147, R5                      ; 5BB0   0285 0147
        CLRR    R0                              ; 5BB2   01C0
L_5BB3:
        ADDR    R1,     R0                      ; 5BB3   00C8
        DECR    R5                              ; 5BB4   0015
        BNEQ    L_5BB3                          ; 5BB5   022C 0003

        MVO     R0,     G_0148                  ; 5BB7   0240 0148
        PULR    R0                              ; 5BB9   02B0
        PULR    R7                              ; 5BBA   02B7
        MVII    #$0080, R3                      ; 5BBB   02BB 0080
        INCR    R7                              ; 5BBD   000F
        MVI@    R5,     R3                      ; 5BBE   02AB

        JSR     R4,     .EXEC.A76               ; 5BBF   0004 0018 0276

        MVII    #$0002, R4                      ; 5BC2   02BC 0002
        MVO     R4,     G_0148                  ; 5BC4   0244 0148
        MVO     R5,     G_035F                  ; 5BC6   0245 035F
L_5BC8:
        DECR    R4                              ; 5BC8   0014
        MVO     R0,     G_0159                  ; 5BC9   0240 0159
        MVO     R4,     G_014A                  ; 5BCB   0244 014A
        MVII    #$000A, R0                      ; 5BCD   02B8 000A
        MVII    #$014B, R4                      ; 5BCF   02BC 014B

        JSR     R5,     X_FILL_ZERO             ; 5BD1   0004 0114 0338

        MVII    #$000C, R0                      ; 5BD4   02B8 000C
        B       L_5A9D                          ; 5BD6   0220 013A

        DECLE   $0000                           ; 5BD8   0000

        EIS                                     ; 5BD9   0002
        DECLE   $0004                           ; 5BDA   0004

        INCR    R3                              ; 5BDB   000B
        COMR    R2                              ; 5BDC   001A
        RSWD    R3                              ; 5BDD   003B
        SARC    R0,     1                       ; 5BDE   0078
        ADDR    R6,     R5                      ; 5BDF   00F5
        SETC                                    ; 5BE0   0007
        DECLE   $0000                           ; 5BE1   0000

        SETC                                    ; 5BE2   0007
        INCR    R1                              ; 5BE3   0009
        INCR    R4                              ; 5BE4   000C
        DECR    R2                              ; 5BE5   0012
        DECR    R3                              ; 5BE6   0013
        DECLE   $0000                           ; 5BE7   0000

        SUBR    R2,     R0                      ; 5BE8   0110
        ADCR    R7                              ; 5BE9   002F
        TSTR    R4                              ; 5BEA   00A4
        ADDR    R5,     R0                      ; 5BEB   00E8
        ADDR    R0,     R4                      ; 5BEC   00C4
        SUBR    R6,     R7                      ; 5BED   0137
        CMPR    R1,     R5                      ; 5BEE   014D
        CMPR    R5,     R6                      ; 5BEF   016E
        ADDR    R0,     R1                      ; 5BF0   00C1
        CMPR    R0,     R3                      ; 5BF1   0143
        SWAP    R3,     1                       ; 5BF2   0043
        RRC     R2,     2                       ; 5BF3   0076
        ADDR    R1,     R7                      ; 5BF4   00CF
        ADDR    R3,     R5                      ; 5BF5   00DD
        CMPR    R4,     R2                      ; 5BF6   0162
        MOVR    R6,     R0                      ; 5BF7   00B0
        SUBR    R4,     R7                      ; 5BF8   0127
        ADDR    R1,     R3                      ; 5BF9   00CB
        CMPR    R0,     R2                      ; 5BFA   0142
        SUBR    R7,     R4                      ; 5BFB   013C
        SUBR    R5,     R1                      ; 5BFC   0129
        SUBR    R4,     R3                      ; 5BFD   0123
L_5BFE:
        MVII    #$01F0, R3                      ; 5BFE   02BB 01F0
        MVII    #$014B, R4                      ; 5C00   02BC 014B
L_5C02:
        MVI@    R4,     R0                      ; 5C02   02A0
        MVI@    R4,     R1                      ; 5C03   02A1
        ADDR    R1,     R0                      ; 5C04   00C8
        NEGR    R1                              ; 5C05   0021
        DECR    R4                              ; 5C06   0014
        MVO@    R1,     R4                      ; 5C07   0261

        JSR     R5,     X_EXT_SIGN_LO           ; 5C08   0004 0114 0268

        BEQ     L_5C15                          ; 5C0B   0204 0008

        ADD@    R3,     R0                      ; 5C0D   02D8
        MVO@    R0,     R3                      ; 5C0E   0258
        MOVR    R3,     R2                      ; 5C0F   009A
        ADDI    #$0004, R2                      ; 5C10   02FA 0004
        SWAP    R0,     1                       ; 5C12   0040
        ADD@    R2,     R0                      ; 5C13   02D0
        MVO@    R0,     R2                      ; 5C14   0250
L_5C15:
        INCR    R3                              ; 5C15   000B
        CMPI    #$0151, R4                      ; 5C16   037C 0151
        BNEQ    L_5C02                          ; 5C18   022C 0017

        MVII    #$0155, R2                      ; 5C1A   02BA 0155
        MVI@    R4,     R0                      ; 5C1C   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 5C1D   0004 0114 0268

        ADD@    R2,     R0                      ; 5C20   02D0

        JSR     R5,     X_CLAMP                 ; 5C21   0004 0114 0270
        DECLE   $0004                           ; 5C24   0004

        SARC    R3,     2                       ; 5C25   007F
L_5C26:
        MVO@    R0,     R2                      ; 5C26   0250
        SLR     R0,     2                       ; 5C27   0064
        ADDI    #$0006, R3                      ; 5C28   02FB 0006
        MVO@    R0,     R3                      ; 5C2A   0258
        INCR    R3                              ; 5C2B   000B
L_5C2C:
        INCR    R2                              ; 5C2C   000A
        INCR    R3                              ; 5C2D   000B
        MVI@    R4,     R0                      ; 5C2E   02A0
        TSTR    R0                              ; 5C2F   0080
        BEQ     L_5C39                          ; 5C30   0204 0007

        ADD@    R2,     R0                      ; 5C32   02D0
        MVO@    R0,     R2                      ; 5C33   0250
        SLR     R0,     2                       ; 5C34   0064
        SLR     R0,     1                       ; 5C35   0060
        ANDI    #$000F, R0                      ; 5C36   03B8 000F
        MVO@    R0,     R3                      ; 5C38   0258
L_5C39:
        CMPI    #$0155, R4                      ; 5C39   037C 0155
        BNEQ    L_5C2C                          ; 5C3B   022C 0010

        MVI     G_014A, R0                      ; 5C3D   0280 014A
        DECR    R0                              ; 5C3F   0010
        MVO     R0,     G_014A                  ; 5C40   0240 014A
        BNEQ    L_5A93                          ; 5C42   022C 01B0

        MVI     G_035F, R4                      ; 5C44   0284 035F
        MOVR    R7,     R5                      ; 5C46   00BD
        DECR    R5                              ; 5C47   0015
        PSHR    R5                              ; 5C48   0275
        MVI@    R4,     R0                      ; 5C49   02A0
        CLRR    R1                              ; 5C4A   01C9
        SUBI    #$006E, R5                      ; 5C4B   033D 006E
        MOVR    R5,     R2                      ; 5C4D   00AA
        ADDI    #$0006, R2                      ; 5C4E   02FA 0006
L_5C50:
        INCR    R2                              ; 5C50   000A
        SARC    R0,     1                       ; 5C51   0078
        RLC     R1,     1                       ; 5C52   0051
        CMP@    R5,     R1                      ; 5C53   0369
        BGE     L_5C50                          ; 5C54   022D 0005

        SUBI    #$0002, R5                      ; 5C56   033D 0002
        SUB@    R5,     R1                      ; 5C58   0329
        DECR    R5                              ; 5C59   0015
        SUB@    R5,     R1                      ; 5C5A   0329
        ADD@    R2,     R2                      ; 5C5B   02D2
        ADDR    R1,     R2                      ; 5C5C   00CA
        MVII    #$01F0, R3                      ; 5C5D   02BB 01F0
        ADD@    R2,     R7                      ; 5C5F   02D7
        CLRR    R2                              ; 5C60   01D2
        SARC    R0,     2                       ; 5C61   007C
        RLC     R2,     2                       ; 5C62   0056
        MVI@    R4,     R1                      ; 5C63   02A1
        ADDR    R2,     R3                      ; 5C64   00D3
        MVO@    R1,     R3                      ; 5C65   0259
        ADDI    #$0004, R3                      ; 5C66   02FB 0004
        SLL     R1,     2                       ; 5C68   004D
        SLL     R1,     2                       ; 5C69   004D
        SLL     R1,     2                       ; 5C6A   004D
        SLLC    R1,     2                       ; 5C6B   005D
        RLC     R0,     2                       ; 5C6C   0054
        MOVR    R0,     R1                      ; 5C6D   0081
        SLR     R1,     2                       ; 5C6E   0065
        SLR     R1,     2                       ; 5C6F   0065
        MVO@    R0,     R3                      ; 5C70   0258
        CMPI    #$0003, R2                      ; 5C71   037A 0003
        BEQ     L_5C89                          ; 5C73   0204 0014

        CLRR    R0                              ; 5C75   01C0
        MOVR    R2,     R5                      ; 5C76   0095
        ADDR    R5,     R5                      ; 5C77   00ED
        ADDI    #$014B, R5                      ; 5C78   02FD 014B
        MVO@    R0,     R5                      ; 5C7A   0268
        MVO@    R0,     R5                      ; 5C7B   0268
        MOVR    R1,     R0                      ; 5C7C   0088
        BEQ     L_5A93                          ; 5C7D   0224 01EB

        SUBR    R2,     R3                      ; 5C7F   0113
        ADDI    #$0007, R3                      ; 5C80   02FB 0007
        DECR    R1                              ; 5C82   0011
        BNEQ    L_5D4D                          ; 5C83   020C 00C8

        MVII    #$0030, R0                      ; 5C85   02B8 0030
        B       L_5D4D                          ; 5C87   0200 00C4

L_5C89:
        ADDI    #$0003, R3                      ; 5C89   02FB 0003
        MVI@    R3,     R0                      ; 5C8B   0298
        MVO@    R0,     R3                      ; 5C8C   0258
        MVO@    R0,     R3                      ; 5C8D   0258
        PULR    R7                              ; 5C8E   02B7
        MVI@    R4,     R1                      ; 5C8F   02A1
        CLRR    R2                              ; 5C90   01D2
        SARC    R1,     2                       ; 5C91   007D
        RLC     R2,     2                       ; 5C92   0056
        MVII    #$014B, R5                      ; 5C93   02BD 014B
        CMPI    #$0003, R2                      ; 5C95   037A 0003
        BNEQ    L_5C9E                          ; 5C97   020C 0005

        MVO@    R1,     R5                      ; 5C99   0269
        MVO@    R0,     R5                      ; 5C9A   0268
        MVO@    R1,     R5                      ; 5C9B   0269
        MVO@    R0,     R5                      ; 5C9C   0268
        CLRR    R2                              ; 5C9D   01D2
L_5C9E:
        ADDR    R2,     R5                      ; 5C9E   00D5
        ADDR    R2,     R5                      ; 5C9F   00D5
        MVO@    R1,     R5                      ; 5CA0   0269
        MVO@    R0,     R5                      ; 5CA1   0268
        PULR    R7                              ; 5CA2   02B7

        JSR     R5,     .EXEC.CC2               ; 5CA3   0004 011C 00C2

L_5CA6:
        MVI@    R3,     R5                      ; 5CA6   029D
        ADDI    #$0004, R3                      ; 5CA7   02FB 0004
        MVI@    R3,     R1                      ; 5CA9   0299
        ANDI    #$000F, R1                      ; 5CAA   03B9 000F
        SWAP    R1,     1                       ; 5CAC   0041
        XORR    R5,     R1                      ; 5CAD   01E9

        JSR     R5,     .EXEC.CEC               ; 5CAE   0004 011C 00EC

        SWAP    R1,     1                       ; 5CB1   0041
        MVO@    R1,     R3                      ; 5CB2   0259
        SUBI    #$0004, R3                      ; 5CB3   033B 0004
        SWAP    R1,     1                       ; 5CB5   0041
        MVO@    R1,     R3                      ; 5CB6   0259
        INCR    R3                              ; 5CB7   000B
        CMPI    #$01F3, R3                      ; 5CB8   037B 01F3
        BNEQ    L_5CA6                          ; 5CBA   022C 0015

        PULR    R7                              ; 5CBC   02B7
        SWAP    R1,     1                       ; 5CBD   0041
        SAR     R1,     2                       ; 5CBE   006D
        SAR     R1,     2                       ; 5CBF   006D
        SAR     R1,     2                       ; 5CC0   006D
        SAR     R1,     2                       ; 5CC1   006D
        INCR    R0                              ; 5CC2   0008
        ADDR    R0,     R0                      ; 5CC3   00C0
        MVO     R5,     G_035F                  ; 5CC4   0245 035F
        MOVR    R0,     R2                      ; 5CC6   0082
L_5CC7:
        MOVR    R2,     R0                      ; 5CC7   0090
        CLRR    R5                              ; 5CC8   01ED
L_5CC9:
        INCR    R5                              ; 5CC9   000D
        SLR     R0,     1                       ; 5CCA   0060
        BNEQ    L_5CC9                          ; 5CCB   022C 0003

        MOVR    R5,     R0                      ; 5CCD   00A8

        JSR     R5,     X_RAND1                 ; 5CCE   0004 0114 027D

        CMPR    R2,     R0                      ; 5CD1   0150
        BGE     L_5CC7                          ; 5CD2   022D 000C

        MVI     G_035F, R7                      ; 5CD4   0287 035F

        JSR     R5,     .EXEC.CC2               ; 5CD6   0004 011C 00C2

        MVII    #$014B, R3                      ; 5CD9   02BB 014B
L_5CDB:
        MVI@    R3,     R1                      ; 5CDB   0299
        SWAP    R1,     1                       ; 5CDC   0041
        SAR     R1,     2                       ; 5CDD   006D
        SAR     R1,     2                       ; 5CDE   006D
        SAR     R1,     2                       ; 5CDF   006D
        SAR     R1,     2                       ; 5CE0   006D

        JSR     R5,     .EXEC.CEC               ; 5CE1   0004 011C 00EC

        MVO@    R1,     R3                      ; 5CE4   0259
        ADDI    #$0002, R3                      ; 5CE5   02FB 0002
        CMPI    #$0151, R3                      ; 5CE7   037B 0151
        BNEQ    L_5CDB                          ; 5CE9   022C 000F

        PULR    R7                              ; 5CEB   02B7
        PSHR    R5                              ; 5CEC   0275
        MOVR    R0,     R2                      ; 5CED   0082
        MOVR    R1,     R5                      ; 5CEE   008D
        CLRR    R1                              ; 5CEF   01C9
        SARC    R2,     1                       ; 5CF0   007A
        BNC     L_5CF6                          ; 5CF1   0209 0003

        NEGR    R5                              ; 5CF3   0025
        INCR    R7                              ; 5CF4   000F
L_5CF5:
        ADDR    R5,     R1                      ; 5CF5   00E9
L_5CF6:
        DECR    R2                              ; 5CF6   0012
        BPL     L_5CF5                          ; 5CF7   0223 0003

        MOVR    R0,     R2                      ; 5CF9   0082
        SARC    R2,     1                       ; 5CFA   007A
        BNC     L_5CFE                          ; 5CFB   0209 0001

        NEGR    R5                              ; 5CFD   0025
L_5CFE:
        SAR     R1,     2                       ; 5CFE   006D
        SAR     R1,     2                       ; 5CFF   006D
        INCR    R1                              ; 5D00   0009
        SAR     R1,     1                       ; 5D01   0069
        ADDR    R5,     R1                      ; 5D02   00E9
        PULR    R7                              ; 5D03   02B7
        ADDI    #$0008, R3                      ; 5D04   02FB 0008
        MVO@    R0,     R3                      ; 5D06   0258
        MOVR    R0,     R1                      ; 5D07   0081
        SLR     R1,     2                       ; 5D08   0065
        SLR     R1,     1                       ; 5D09   0061
        ANDR    R1,     R0                      ; 5D0A   0188
        CLRR    R1                              ; 5D0B   01C9
        ADDI    #$0002, R3                      ; 5D0C   02FB 0002
        B       L_5D14                          ; 5D0E   0200 0004

        ADDI    #$000A, R3                      ; 5D10   02FB 000A
        MVII    #$0030, R1                      ; 5D12   02B9 0030
L_5D14:
        MVII    #$0151, R2                      ; 5D14   02BA 0151
        CLRR    R5                              ; 5D16   01ED
L_5D17:
        INCR    R2                              ; 5D17   000A
        INCR    R3                              ; 5D18   000B
        SARC    R0,     1                       ; 5D19   0078
        BNC     L_5D1E                          ; 5D1A   0209 0002

        MVO@    R1,     R3                      ; 5D1C   0259
        MVO@    R5,     R2                      ; 5D1D   0255
L_5D1E:
        BNEQ    L_5D17                          ; 5D1E   022C 0008

        PULR    R7                              ; 5D20   02B7
        MVO     R0,     .PSG0.envelope          ; 5D21   0240 01FA
        PULR    R7                              ; 5D23   02B7
        MVO     R0,     .PSG0.noise             ; 5D24   0240 01F9
        SLL     R0,     2                       ; 5D26   004C
        MVO     R0,     G_0155                  ; 5D27   0240 0155
        CLRR    R0                              ; 5D29   01C0
        INCR    R7                              ; 5D2A   000F
        MVI@    R4,     R0                      ; 5D2B   02A0
        MVO     R0,     G_0151                  ; 5D2C   0240 0151
        PULR    R7                              ; 5D2E   02B7
        MVI     G_0155, R1                      ; 5D2F   0281 0155

        JSR     R5,     .EXEC.CC2               ; 5D31   0004 011C 00C2
        JSR     R5,     .EXEC.CEC               ; 5D34   0004 011C 00EC

        MVO     R1,     G_0155                  ; 5D37   0241 0155
        SLR     R1,     2                       ; 5D39   0065
        MVO     R1,     .PSG0.noise             ; 5D3A   0241 01F9
        PULR    R7                              ; 5D3C   02B7
        MVI     G_0151, R1                      ; 5D3D   0281 0151

        JSR     R5,     .EXEC.CBD               ; 5D3F   0004 011C 00BD
        JSR     R5,     .EXEC.CEC               ; 5D42   0004 011C 00EC

        MVO     R1,     G_0151                  ; 5D45   0241 0151
        PULR    R7                              ; 5D47   02B7
        ADDI    #$000B, R3                      ; 5D48   02FB 000B
        CLRR    R2                              ; 5D4A   01D2
        SARC    R0,     2                       ; 5D4B   007C
        RLC     R2,     2                       ; 5D4C   0056
L_5D4D:
        CLRR    R1                              ; 5D4D   01C9
        CMPI    #$0003, R2                      ; 5D4E   037A 0003
        BNEQ    L_5D54                          ; 5D50   020C 0002

        INCR    R1                              ; 5D52   0009
        CLRR    R2                              ; 5D53   01D2
L_5D54:
        ADDR    R2,     R3                      ; 5D54   00D3
        MOVR    R3,     R5                      ; 5D55   009D
        MVO@    R0,     R5                      ; 5D56   0268
        TSTR    R1                              ; 5D57   0089
        BEQ     L_5D5C                          ; 5D58   0204 0002

        MVO@    R0,     R5                      ; 5D5A   0268
        MVO@    R0,     R5                      ; 5D5B   0268
L_5D5C:
        MVII    #$0156, R5                      ; 5D5C   02BD 0156
        ADDR    R2,     R5                      ; 5D5E   00D5
        SLL     R0,     2                       ; 5D5F   004C
        SLL     R0,     1                       ; 5D60   0048
        ADDI    #$0152, R2                      ; 5D61   02FA 0152
        CLRR    R3                              ; 5D63   01DB
        MVO@    R0,     R5                      ; 5D64   0268
        MVO@    R3,     R2                      ; 5D65   0253
        TSTR    R1                              ; 5D66   0089
        BEQ     L_5A93                          ; 5D67   0224 02D5

        MVO@    R0,     R5                      ; 5D69   0268
        MVO@    R0,     R5                      ; 5D6A   0268
        INCR    R2                              ; 5D6B   000A
        MVO@    R3,     R2                      ; 5D6C   0253
        INCR    R2                              ; 5D6D   000A
        MVO@    R3,     R2                      ; 5D6E   0253
        PULR    R7                              ; 5D6F   02B7
        CLRR    R2                              ; 5D70   01D2
        SARC    R0,     2                       ; 5D71   007C
        RLC     R2,     2                       ; 5D72   0056
        SWAP    R0,     1                       ; 5D73   0040
        MVII    #$0152, R5                      ; 5D74   02BD 0152
        SLL     R0,     2                       ; 5D76   004C
        SAR     R0,     2                       ; 5D77   006C
        SWAP    R0,     1                       ; 5D78   0040
        CMPI    #$0003, R2                      ; 5D79   037A 0003
        BNEQ    L_5D80                          ; 5D7B   020C 0003

        MVO@    R0,     R5                      ; 5D7D   0268
        MVO@    R0,     R5                      ; 5D7E   0268
        INCR    R7                              ; 5D7F   000F
L_5D80:
        ADDR    R2,     R5                      ; 5D80   00D5
        MVO@    R0,     R5                      ; 5D81   0268
        PULR    R7                              ; 5D82   02B7
        INCR    R0                              ; 5D83   0008
        MVO     R0,     G_0147                  ; 5D84   0240 0147
        PULR    R7                              ; 5D86   02B7
        SDBD                                    ; 5D87   0001
        MVI@    R4,     R7                      ; 5D88   02A7
        PULR    R5                              ; 5D89   02B5
        RRC     R0,     2                       ; 5D8A   0074
        BNOV    L_5D91                          ; 5D8B   020A 0004

        SDBD                                    ; 5D8D   0001
        MVII    #$1A93, R4                      ; 5D8E   02BC 0093 001A
L_5D91:
        MVO     R4,     G_035F                  ; 5D91   0244 035F
        BNC     L_5AA5                          ; 5D93   0229 02EF
        B       L_5AA8                          ; 5D95   0220 02EE

        CLRR    R3                              ; 5D97   01DB
        SARC    R0,     2                       ; 5D98   007C
        RLC     R3,     2                       ; 5D99   0057
        B       L_5D9E                          ; 5D9A   0200 0002

        MOVR    R0,     R3                      ; 5D9C   0083
        MVI@    R4,     R0                      ; 5D9D   02A0
L_5D9E:
        ADDI    #$0159, R3                      ; 5D9E   02FB 0159
        MVO@    R0,     R3                      ; 5DA0   0258
        PULR    R7                              ; 5DA1   02B7
        MVI@    R4,     R0                      ; 5DA2   02A0
        INCR    R0                              ; 5DA3   0008
L_5DA4:
        TSTR    R0                              ; 5DA4   0080
        BEQ     L_5A93                          ; 5DA5   0224 0313

        MVO     R0,     G_014A                  ; 5DA7   0240 014A
        MVO     R4,     G_035F                  ; 5DA9   0244 035F
        PULR    R5                              ; 5DAB   02B5
        PULR    R7                              ; 5DAC   02B7
        MVI@    R4,     R1                      ; 5DAD   02A1
        CLRR    R2                              ; 5DAE   01D2
        SARC    R1,     2                       ; 5DAF   007D
        RLC     R2,     2                       ; 5DB0   0056
        ADDI    #$0159, R2                      ; 5DB1   02FA 0159
        MVI@    R2,     R5                      ; 5DB3   0295
        DECR    R5                              ; 5DB4   0015
        BMI     L_5DBA                          ; 5DB5   020B 0003

        MVO@    R5,     R2                      ; 5DB7   0255
        BEQ     L_5DA4                          ; 5DB8   0224 0015

L_5DBA:
        SWAP    R1,     1                       ; 5DBA   0041
        SAR     R1,     2                       ; 5DBB   006D
        SAR     R1,     2                       ; 5DBC   006D
        SAR     R1,     2                       ; 5DBD   006D
        SAR     R1,     2                       ; 5DBE   006D
        ADDR    R1,     R4                      ; 5DBF   00CC
        B       L_5DA4                          ; 5DC0   0220 001D

        MVI@    R4,     R1                      ; 5DC2   02A1
        SARC    R1,     2                       ; 5DC3   007D
        RLC     R0,     2                       ; 5DC4   0054
        SARC    R1,     1                       ; 5DC5   0079
        RLC     R0,     1                       ; 5DC6   0050
        INCR    R0                              ; 5DC7   0008

        JSR     R5,     .EXEC.CC4               ; 5DC8   0004 011C 00C4

        ADDR    R1,     R0                      ; 5DCB   00C8
        B       L_5DA4                          ; 5DCC   0220 0029

        MVI@    R4,     R1                      ; 5DCE   02A1
        CLRR    R3                              ; 5DCF   01DB
        SARC    R1,     2                       ; 5DD0   007D
        RLC     R3,     2                       ; 5DD1   0057
        SARC    R1,     2                       ; 5DD2   007D
        RLC     R0,     2                       ; 5DD3   0054
        INCR    R0                              ; 5DD4   0008

        JSR     R5,     .EXEC.CC4               ; 5DD5   0004 011C 00C4

        ADDR    R1,     R0                      ; 5DD8   00C8
        B       L_5D9E                          ; 5DD9   0220 003C

        MOVR    R0,     R1                      ; 5DDB   0081
        PSHR    R3                              ; 5DDC   0273
        CLRR    R3                              ; 5DDD   01DB
        CLRR    R2                              ; 5DDE   01D2
        TSTR    R0                              ; 5DDF   0080
        BPL     L_5DE4                          ; 5DE0   0203 0002

        NEGR    R0                              ; 5DE2   0020
        INCR    R3                              ; 5DE3   000B
L_5DE4:
        TSTR    R1                              ; 5DE4   0089
        BPL     L_5DE9                          ; 5DE5   0203 0002

        NEGR    R1                              ; 5DE7   0021
        INCR    R3                              ; 5DE8   000B
L_5DE9:
        B       L_5DED                          ; 5DE9   0200 0002

L_5DEB:
        ADDR    R0,     R2                      ; 5DEB   00C2
L_5DEC:
        SLL     R0,     1                       ; 5DEC   0048
L_5DED:
        SARC    R1,     1                       ; 5DED   0079
        BC      L_5DEB                          ; 5DEE   0221 0004
        BNEQ    L_5DEC                          ; 5DF0   022C 0005

        SARC    R3,     1                       ; 5DF2   007B
        BNC     L_5DF6                          ; 5DF3   0209 0001

        NEGR    R2                              ; 5DF5   0022
L_5DF6:
        PULR    R3                              ; 5DF6   02B3
        MOVR    R5,     R7                      ; 5DF7   00AF
        MOVR    R2,     R0                      ; 5DF8   0090
        SARC    R0,     1                       ; 5DF9   0078
        ADDR    R0,     R1                      ; 5DFA   00C1
        PSHR    R3                              ; 5DFB   0273
        CLRR    R0                              ; 5DFC   01C0
        MVII    #$0001, R3                      ; 5DFD   02BB 0001
        TSTR    R2                              ; 5DFF   0092
        BEQ     L_5E21                          ; 5E00   0204 001F
        BPL     L_5E06                          ; 5E02   0203 0002

        NEGR    R2                              ; 5E04   0022
        INCR    R0                              ; 5E05   0008
L_5E06:
        INCR    R7                              ; 5E06   000F
L_5E07:
        SLL     R3,     1                       ; 5E07   004B
        SLLC    R2,     1                       ; 5E08   005A
        BNC     L_5E07                          ; 5E09   0229 0003

        RRC     R2,     1                       ; 5E0B   0072
        TSTR    R1                              ; 5E0C   0089
        BPL     L_5E11                          ; 5E0D   0203 0002

        NEGR    R1                              ; 5E0F   0021
        INCR    R0                              ; 5E10   0008
L_5E11:
        SARC    R0,     1                       ; 5E11   0078
        RRC     R3,     1                       ; 5E12   0073
        CLRR    R0                              ; 5E13   01C0
L_5E14:
        SLR     R2,     1                       ; 5E14   0062
        CMPR    R2,     R1                      ; 5E15   0151
        BLT     L_5E1A                          ; 5E16   0205 0002

        SUBR    R2,     R1                      ; 5E18   0111
        SETC                                    ; 5E19   0007
L_5E1A:
        RLC     R0,     1                       ; 5E1A   0050
        SARC    R3,     1                       ; 5E1B   007B
        BNC     L_5E14                          ; 5E1C   0229 0009
        BEQ     L_5E21                          ; 5E1E   0204 0001

        NEGR    R0                              ; 5E20   0020
L_5E21:
        PULR    R3                              ; 5E21   02B3
        MOVR    R5,     R7                      ; 5E22   00AF
        PSHR    R5                              ; 5E23   0275
        MOVR    R1,     R2                      ; 5E24   008A
        SLR     R2,     1                       ; 5E25   0062
L_5E26:
        PSHR    R2                              ; 5E26   0272
        PSHR    R1                              ; 5E27   0271

        JSR     R5,     X_DIVR                  ; 5E28   0004 011C 01F8

        PULR    R1                              ; 5E2B   02B1
        PULR    R2                              ; 5E2C   02B2
        ADDR    R0,     R2                      ; 5E2D   00C2
        SLR     R2,     1                       ; 5E2E   0062
        SUBR    R2,     R0                      ; 5E2F   0110
        BPL     L_5E33                          ; 5E30   0203 0001

        NEGR    R0                              ; 5E32   0020
L_5E33:
        CMPI    #$0002, R0                      ; 5E33   0378 0002
        BPL     L_5E26                          ; 5E35   0223 0010

        PULR    R7                              ; 5E37   02B7
        PSHR    R5                              ; 5E38   0275
        MVII    #$00F0, R0                      ; 5E39   02B8 00F0
        MVII    #$0200, R4                      ; 5E3B   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5E3D   0004 0114 0338

        MVII    #$0216, R4                      ; 5E40   02BC 0216
L_5E42:
        SDBD                                    ; 5E42   0001
        MVII    #$052F, R0                      ; 5E43   02B8 002F 0005
L_5E46:
        MVO@    R0,     R4                      ; 5E46   0260
        INCR    R4                              ; 5E47   000C
        CMPI    #$021E, R4                      ; 5E48   037C 021E
        BNEQ    L_5E4F                          ; 5E4A   020C 0003

        INCR    R4                              ; 5E4C   000C
        SUBI    #$0008, R0                      ; 5E4D   0338 0008
L_5E4F:
        DECR    R0                              ; 5E4F   0010
        CMPI    #$0227, R4                      ; 5E50   037C 0227
        BNEQ    L_5E46                          ; 5E52   022C 000D

        MVII    #$0082, R0                      ; 5E54   02B8 0082
        MVO     R0,     G_0102                  ; 5E56   0240 0102
        EIS                                     ; 5E58   0002
L_5E59:
        CMP     G_0102, R0                      ; 5E59   0340 0102
        BEQ     L_5E59                          ; 5E5B   0224 0003

        MVII    #$0007, R3                      ; 5E5D   02BB 0007

        JSR     R5,     X_READ_ROM_HDR          ; 5E5F   0004 0110 00AB

        INCR    R2                              ; 5E62   000A
        PSHR    R4                              ; 5E63   0274
        MVI@    R5,     R0                      ; 5E64   02A8
        PSHR    R5                              ; 5E65   0275
        MVII    #$0002, R1                      ; 5E66   02B9 0002
        MVII    #$02D2, R4                      ; 5E68   02BC 02D2

        JSR     R5,     X_PRNUM_RGT             ; 5E6A   0004 0118 00C5

        PULR    R4                              ; 5E6D   02B4
        MOVR    R4,     R1                      ; 5E6E   00A1
        SDBD                                    ; 5E6F   0001
        MVII    #$052D, R2                      ; 5E70   02BA 002D 0005
L_5E73:
        DECR    R2                              ; 5E73   0012
        MVI@    R4,     R0                      ; 5E74   02A0
        TSTR    R0                              ; 5E75   0080
        BNEQ    L_5E73                          ; 5E76   022C 0004

        SLR     R2,     1                       ; 5E78   0062
        MOVR    R2,     R4                      ; 5E79   0094

        JSR     R5,     X_PRINT_R1              ; 5E7A   0004 0118 0067

        PULR    R1                              ; 5E7D   02B1
        MVI@    R1,     R1                      ; 5E7E   0289
        SWAP    R1,     2                       ; 5E7F   0045
        BPL     L_5E87                          ; 5E80   0203 0005

        MOVR    R5,     R4                      ; 5E82   00AC
        MOVR    R7,     R5                      ; 5E83   00BD
        ADDI    #$0003, R5                      ; 5E84   02FD 0003
        MOVR    R4,     R7                      ; 5E86   00A7

L_5E87:
        JSRE    R5,     .EXEC.4C3               ; 5E87   0004 0115 00C3

        DIS                                     ; 5E8A   0003
        MOVR    R5,     R1                      ; 5E8B   00A9
        ANDI    #$00FF, R1                      ; 5E8C   03B9 00FF
        BNEQ    L_5E92                          ; 5E8E   020C 0002

        XORR    R5,     R1                      ; 5E90   01E9
        SWAP    R1,     1                       ; 5E91   0041
L_5E92:
        MOVR    R1,     R2                      ; 5E92   008A
        ANDI    #$001F, R1                      ; 5E93   03B9 001F
L_5E95:
        DECR    R1                              ; 5E95   0011
        MVII    #$0003, R0                      ; 5E96   02B8 0003
        BNEQ    L_5EAA                          ; 5E98   020C 0010

        SLL     R0,     1                       ; 5E9A   0048
        SLR     R2,     2                       ; 5E9B   0066
        SLR     R2,     2                       ; 5E9C   0066
        SARC    R2,     2                       ; 5E9D   007E
        BOV     L_5EA8                          ; 5E9E   0202 0008

        DECR    R0                              ; 5EA0   0010
        SARC    R2,     1                       ; 5EA1   007A
        BC      L_5EA8                          ; 5EA2   0201 0004

        DECR    R0                              ; 5EA4   0010
        SARC    R2,     1                       ; 5EA5   007A
        BNC     L_5E95                          ; 5EA6   0229 0012
L_5EA8:
        BNEQ    L_5E95                          ; 5EA8   022C 0014

L_5EAA:
        MVO     R0,     G_0103                  ; 5EAA   0240 0103
        PULR    R7                              ; 5EAC   02B7
        MVI     G_0149, R1                      ; 5EAD   0281 0149
        TSTR    R1                              ; 5EAF   0089
        BNEQ    L_5EB3                          ; 5EB0   020C 0001

        MOVR    R4,     R7                      ; 5EB2   00A7
L_5EB3:
        MOVR    R5,     R7                      ; 5EB3   00AF
        PSHR    R5                              ; 5EB4   0275

        JSR     R5,     X_PLAY_SFX2             ; 5EB5   0004 0118 03BE

        ADDR    R7,     R7                      ; 5EB8   00FF
        ADD@    R1,     R7                      ; 5EB9   02CF

        JSR     R4,     X_SFX_OK                ; 5EBA   0004 001C 02AD

        MVII    #$0005, R0                      ; 5EBD   02B8 0005
        B       L_5EC4                          ; 5EBF   0200 0003

        JSR     R4,     X_SFX_OK                ; 5EC1   0004 001C 02AD

L_5EC4:
        PSHR    R5                              ; 5EC4   0275

        JSR     R5,     X_PLAY_SFX1             ; 5EC5   0004 0118 03BB

        SWAP    R0,     1                       ; 5EC8   0040
        COMR    R0                              ; 5EC9   0018
        SLL     R0,     1                       ; 5ECA   0048
        GSWD    R0                              ; 5ECB   0030
        SWAP    R0,     2                       ; 5ECC   0044
        SLR     R0,     1                       ; 5ECD   0060
        INCR    R4                              ; 5ECE   000C
        GSWD    R3                              ; 5ECF   0033
        AND@    R1,     R1                      ; 5ED0   0389
        BMI     L_5F96                          ; 5ED1   020B 00C3

        XORI    #$02CF, R0                      ; 5ED3   03F8 02CF
        PSHR    R5                              ; 5ED5   0275

        JSR     R5,     X_PLAY_SFX1             ; 5ED6   0004 0118 03BB
        DECLE   $0279                           ; 5ED9   0279

        XOR@    R5,     R5                      ; 5EDA   03ED
        SUBR    R0,     R5                      ; 5EDB   0105
        ANDR    R4,     R5                      ; 5EDC   01A5
        SLR     R2,     1                       ; 5EDD   0062
        SAR     R2,     1                       ; 5EDE   006A
        XORR    R5,     R3                      ; 5EDF   01EB
        EIS                                     ; 5EE0   0002
        INCR    R2                              ; 5EE1   000A
        INCR    R7                              ; 5EE2   000F
        XORI    #$008F, R7                      ; 5EE3   03FF 008F
        DECR    R3                              ; 5EE5   0013
        INCR    R7                              ; 5EE6   000F
        DECLE   $0000                           ; 5EE7   0000

        DECR    R3                              ; 5EE8   0013
        COMR    R1                              ; 5EE9   0019
        DIS                                     ; 5EEA   0003
        SLR     R1,     1                       ; 5EEB   0061
        ADD@    R5,     R1                      ; 5EEC   02E9
        MVI     G_0050, R0                      ; 5EED   0280 0050
        CMPR    R3,     R3                      ; 5EEF   015B
        DECLE   $0001                           ; 5EF0   0001

        XORI    #$03EB, R0                      ; 5EF1   03F8 03EB
        DECR    R3                              ; 5EF3   0013
        ADCR    R6                              ; 5EF4   002E
        NEGR    R3                              ; 5EF5   0023
        DECR    R6                              ; 5EF6   0016
        DECLE   $0001                           ; 5EF7   0001

        INCR    R4                              ; 5EF8   000C
        CMPR    R5,     R3                      ; 5EF9   016B
        DECLE   $0001                           ; 5EFA   0001

        XOR@    R6,     R4                      ; 5EFB   03F4
        ADDR    R0,     R3                      ; 5EFC   00C3
        XOR@    R4,     R6                      ; 5EFD   03E6
        DECLE   $0001                           ; 5EFE   0001

        INCR    R0                              ; 5EFF   0008
        XOR@    R5,     R3                      ; 5F00   03EB
        ADDI    #$0157, R1                      ; 5F01   02F9 0157
        ADCR    R6                              ; 5F03   002E
        DECR    R3                              ; 5F04   0013
        COMR    R1                              ; 5F05   0019
        DIS                                     ; 5F06   0003
        NEGR    R5                              ; 5F07   0025
        ADD@    R1,     R1                      ; 5F08   02C9
        MVI     .BTAB.00,R0                     ; 5F09   0280 0200
        SUB@    R1,     R0                      ; 5F0B   0308
        MVO     R0,     G_03EB                  ; 5F0C   0240 03EB
        ADDI    #$0097, R1                      ; 5F0E   02F9 0097
        SWAP    R0,     1                       ; 5F10   0040
        DIS                                     ; 5F11   0003
        CMP@    R2,     R4                      ; 5F12   0354
        XOR@    R6,     R2                      ; 5F13   03F2
        XORI    #$000F, R2                      ; 5F14   03FA 000F
        EIS                                     ; 5F16   0002
        MOVR    R1,     R7                      ; 5F17   008F
        NEGR    R7                              ; 5F18   0027
        XORI    #$03CF, R1                      ; 5F19   03F9 03CF
        MVII    #$000E, R0                      ; 5F1B   02B8 000E
        PSHR    R5                              ; 5F1D   0275

        JSR     R5,     X_PLAY_SFX1             ; 5F1E   0004 0118 03BB

        AND@    R1,     R1                      ; 5F21   0389
        CMP     .STIC.CS.0,R0                   ; 5F22   0340 0028
        CMP@    R1,     R0                      ; 5F24   0348
        ADCR    R1                              ; 5F25   0029
        CMP     .STIC.CS.2,R4                   ; 5F26   0344 002A
        SAR     R3,     1                       ; 5F28   006B
        ADD     .STIC.HDLY,R0                   ; 5F29   02C0 0030
        ADD@    R6,     R5                      ; 5F2B   02F5
        NEGR    R3                              ; 5F2C   0023
        XOR@    R2,     R0                      ; 5F2D   03D0
        ADD@    R1,     R7                      ; 5F2E   02CF
        PSHR    R5                              ; 5F2F   0275

        JSR     R5,     X_READ_ROM_HDR          ; 5F30   0004 0110 00AB

        INCR    R0                              ; 5F33   0008
        INCR    R7                              ; 5F34   000F
        PSHR    R4                              ; 5F35   0274
        PSHR    R5                              ; 5F36   0275
        SDBD                                    ; 5F37   0001
        MVII    #$36DF, R3                      ; 5F38   02BB 00DF 0036
        MOVR    R3,     R4                      ; 5F3B   009C
        ADDI    #$003A, R4                      ; 5F3C   02FC 003A
        MVII    #$0200, R5                      ; 5F3E   02BD 0200
L_5F40:
        MVI@    R3,     R0                      ; 5F40   0298
        INCR    R3                              ; 5F41   000B
        MVII    #$0004, R2                      ; 5F42   02BA 0004
L_5F44:
        MVI@    R4,     R1                      ; 5F44   02A1
        SWAP    R1,     1                       ; 5F45   0041
        SARC    R0,     2                       ; 5F46   007C
        RRC     R1,     2                       ; 5F47   0075
        SLR     R1,     2                       ; 5F48   0065
        SLR     R1,     2                       ; 5F49   0065
        SLR     R1,     2                       ; 5F4A   0065
        MVO@    R1,     R5                      ; 5F4B   0269
        DECR    R2                              ; 5F4C   0012
        BNEQ    L_5F44                          ; 5F4D   022C 000A

        CMPI    #$02E7, R5                      ; 5F4F   037D 02E7
        BLT     L_5F40                          ; 5F51   0225 0012

        PULR    R5                              ; 5F53   02B5
        MVI@    R5,     R0                      ; 5F54   02A8
        MOVR    R5,     R3                      ; 5F55   00AB
        SDBD                                    ; 5F56   0001
        MVII    #$3800, R5                      ; 5F57   02BD 0000 0038
        MOVR    R7,     R1                      ; 5F5A   00B9
        DECR    R1                              ; 5F5B   0011
        PSHR    R1                              ; 5F5C   0271
        MVI@    R3,     R1                      ; 5F5D   0299
        INCR    R3                              ; 5F5E   000B
        SARC    R1,     1                       ; 5F5F   0079
        CLRR    R2                              ; 5F60   01D2
        BNC     L_5F65                          ; 5F61   0209 0002

        MVI@    R3,     R2                      ; 5F63   029A
        INCR    R3                              ; 5F64   000B
L_5F65:
        PSHR    R0                              ; 5F65   0270
        PSHR    R5                              ; 5F66   0275
        PSHR    R3                              ; 5F67   0273
        MVII    #$02E8, R4                      ; 5F68   02BC 02E8
        SARC    R2,     1                       ; 5F6A   007A
        BNC     L_5F6F                          ; 5F6B   0209 0002

        MVII    #$0213, R7                      ; 5F6D   02BF 0213
L_5F6F:
        SARC    R2,     1                       ; 5F6F   007A
        BC      L_5FB1                          ; 5F70   0201 003F

        SARC    R2,     1                       ; 5F72   007A
        BNC     L_5F79                          ; 5F73   0209 0004

        CLRR    R3                              ; 5F75   01DB
        SWAP    R2,     1                       ; 5F76   0042
        MVII    #$0200, R7                      ; 5F77   02BF 0200

L_5F79:
        JSR     R5,     .BTAB.D3                ; 5F79   0004 0100 02D3

        SDBD                                    ; 5F7C   0001
        MVII    #$3000, R4                      ; 5F7D   02BC 0000 0030
        SARC    R2,     1                       ; 5F80   007A
        BC      L_5F92                          ; 5F81   0201 000F

        JSR     R5,     X_READ_ROM_HDR          ; 5F83   0004 0110 00AB

        CLRC                                    ; 5F86   0006
        MOVR    R5,     R4                      ; 5F87   00AC
        MOVR    R2,     R0                      ; 5F88   0090
        ANDI    #$0002, R0                      ; 5F89   03B8 0002
        BEQ     L_5F92                          ; 5F8B   0204 0005

        XORR    R0,     R2                      ; 5F8D   01C2
        SDBD                                    ; 5F8E   0001
        MVII    #$3800, R4                      ; 5F8F   02BC 0000 0038
L_5F92:
        SWAP    R1,     1                       ; 5F92   0041
        SLL     R1,     2                       ; 5F93   004D
        SARC    R2,     2                       ; 5F94   007E
        RRC     R1,     2                       ; 5F95   0075
L_5F96:
        SWAP    R1,     1                       ; 5F96   0041
        MVI     .BTAB.E6,R0                     ; 5F97   0280 02E6
        ADDR    R0,     R1                      ; 5F99   00C1
        SUBR    R0,     R2                      ; 5F9A   0102
        BEQ     L_5FA3                          ; 5F9B   0204 0006

        PULR    R2                              ; 5F9D   02B2
        SUBI    #$0002, R2                      ; 5F9E   033A 0002
        PSHR    R2                              ; 5FA0   0272
        MOVR    R0,     R2                      ; 5FA1   0082
        INCR    R2                              ; 5FA2   000A
L_5FA3:
        MVO     R2,     .BTAB.E6                ; 5FA3   0242 02E6
        SLL     R1,     2                       ; 5FA5   004D
        ADDR    R1,     R1                      ; 5FA6   00C9
        ADDR    R1,     R4                      ; 5FA7   00CC
        MVII    #$02E8, R1                      ; 5FA8   02B9 02E8
        MVII    #$0008, R0                      ; 5FAA   02B8 0008

        JSR     R5,     .EXEC.730               ; 5FAC   0004 0114 0330

        MVII    #$0247, R7                      ; 5FAF   02BF 0247
L_5FB1:
        MOVR    R1,     R0                      ; 5FB1   0088
        ANDI    #$0080, R0                      ; 5FB2   03B8 0080
        XORR    R0,     R1                      ; 5FB4   01C1
        SARC    R2,     1                       ; 5FB5   007A
        RLC     R0,     1                       ; 5FB6   0050
        CLRR    R3                              ; 5FB7   01DB
        SARC    R2,     2                       ; 5FB8   007E
        RLC     R3,     2                       ; 5FB9   0057
        SARC    R2,     1                       ; 5FBA   007A
        RLC     R3,     1                       ; 5FBB   0053
        SARC    R0,     1                       ; 5FBC   0078
        RLC     R2,     1                       ; 5FBD   0052
        SLL     R0,     2                       ; 5FBE   004C
        SWAP    R0,     1                       ; 5FBF   0040
        TSTR    R3                              ; 5FC0   009B
        BNEQ    L_5FC6                          ; 5FC1   020C 0003

        MOVR    R0,     R3                      ; 5FC3   0083
        SLL     R3,     2                       ; 5FC4   004F
        CLRR    R0                              ; 5FC5   01C0
L_5FC6:
        PSHR    R0                              ; 5FC6   0270
        PSHR    R3                              ; 5FC7   0273

        JSR     R5,     .BTAB.C3                ; 5FC8   0004 0100 02C3

        PULR    R5                              ; 5FCB   02B5
        MVII    #$0200, R0                      ; 5FCC   02B8 0200
L_5FCE:
        SLR     R0,     1                       ; 5FCE   0060
        DECR    R5                              ; 5FCF   0015
        BPL     L_5FCE                          ; 5FD0   0223 0003

        SWAP    R2,     1                       ; 5FD2   0042
        SLL     R1,     2                       ; 5FD3   004D
        XORR    R2,     R1                      ; 5FD4   01D1
        XOR@    R6,     R1                      ; 5FD5   03F1
        SLL     R1,     2                       ; 5FD6   004D
        SLL     R1,     2                       ; 5FD7   004D

L_5FD8:
        JSR     R5,     .BTAB.DC                ; 5FD8   0004 0100 02DC

        SLLC    R1,     1                       ; 5FDB   0059
        BNC     L_5FD8                          ; 5FDC   0229 0005

        SLLC    R1,     1                       ; 5FDE   0059
        BNC     L_5FEE                          ; 5FDF   0209 000D

L_5FE1:
        SLR     R0,     1                       ; 5FE1   0060
        BNEQ    L_5FE6                          ; 5FE2   020C 0002

        MVII    #$0100, R0                      ; 5FE4   02B8 0100

L_5FE6:
        JSR     R5,     .BTAB.DC                ; 5FE6   0004 0100 02DC

        SLLC    R1,     1                       ; 5FE9   0059
        BNC     L_5FE1                          ; 5FEA   0229 000A
        B       L_5FD8                          ; 5FEC   0220 0015

L_5FEE:
        SLL     R0,     1                       ; 5FEE   0048
        ANDI    #$01FF, R0                      ; 5FEF   03B8 01FF
        BNEQ    L_5FF4                          ; 5FF1   020C 0001

        INCR    R0                              ; 5FF3   0008

L_5FF4:
        JSR     R5,     .BTAB.DC                ; 5FF4   0004 0100 02DC

        SLLC    R1,     1                       ; 5FF7   0059
        BNC     L_5FEE                          ; 5FF8   0229 000B
        B       L_5FD8                          ; 5FFA   0220 0023

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFC   0000 0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;; ======================================================================== ;;
