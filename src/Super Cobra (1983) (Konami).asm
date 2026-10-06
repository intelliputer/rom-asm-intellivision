
        ORG     $5000
.HEADER:
        ADDR    R2,     R1                      ; 5000   00D1
        RLC     R2,     2                       ; 5001   0056
        NEGR    R3                              ; 5002   0023
        RLC     R0,     1                       ; 5003   0050
        ADDR    R2,     R0                      ; 5004   00D0
        RLC     R0,     1                       ; 5005   0050
        ADDR    R2,     R1                      ; 5006   00D1
        RLC     R2,     2                       ; 5007   0056
        COMR    R4                              ; 5008   001C
        RLC     R0,     1                       ; 5009   0050
        ADCR    R5                              ; 500A   002D
        RLC     R0,     1                       ; 500B   0050
        TSTR    R0                              ; 500C   0080
        DECLE   $0001,  $0000,  $0000,  $0000   ; 500D   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 5011   0000 0000 0000

        ANDR    R0,     R0                      ; 5014   0180
        ANDR    R2,     R0                      ; 5015   0190
        ANDR    R4,     R0                      ; 5016   01A0
        ANDR    R6,     R0                      ; 5017   01B0
        CLRR    R0                              ; 5018   01C0
        XORR    R2,     R0                      ; 5019   01D0
        XORR    R4,     R0                      ; 501A   01E0
        XORR    R6,     R0                      ; 501B   01F0
        COMR    R0                              ; 501C   0018
        DECLE   $0001                           ; 501D   0001

        AND     .STIC.A.1,R0                    ; 501E   0380 0011
        AND     .STIC.MODE,R0                   ; 5020   0380 0021
        AND     G_0066, R0                      ; 5022   0380 0066
        SLLC    R1,     2                       ; 5024   005D
        DECLE   $0001                           ; 5025   0001
L_5026:
        DECLE   $0000                           ; 5026   0000

        SLLC    R0,     1                       ; 5027   0058
        RLC     R1,     1                       ; 5028   0051
        ADDR    R5,     R6                      ; 5029   00EE
        EIS                                     ; 502A   0002
        DECLE   $0000,  $0000                   ; 502B   0000 0000

        RLC     R2,     1                       ; 502D   0052
        DECLE   $0000                           ; 502E   0000

        PSHR    R5                              ; 502F   0275
        SDBD                                    ; 5030   0001
        MVII    #$59E1, R1                      ; 5031   02B9 00E1 0059
        MVO     R1,     .ISRVEC.0               ; 5034   0241 0100
        SWAP    R1,     1                       ; 5036   0041
        MVO     R1,     .ISRVEC.1               ; 5037   0241 0101

        JSR     R5,     L_52C1                  ; 5039   0004 0150 02C1

        MVII    #$0001, R1                      ; 503C   02B9 0001
        MVO     R1,     G_015D                  ; 503E   0241 015D
        MVO     R1,     G_015E                  ; 5040   0241 015E

        JSR     R5,     L_5089                  ; 5042   0004 0150 0089

        BPL     L_5055                          ; 5045   0203 000E

        ANDR    R0,     R6                      ; 5047   0186
        SUBR    R1,     R6                      ; 5048   010E
        ANDR    R2,     R6                      ; 5049   0196
        CMPR    R3,     R6                      ; 504A   015E
        SUBR    R5,     R6                      ; 504B   012E
        ANDR    R2,     R6                      ; 504C   0196
        CLRC                                    ; 504D   0006
        SUBR    R2,     R6                      ; 504E   0116
        ANDR    R2,     R6                      ; 504F   0196
        CMPR    R7,     R6                      ; 5050   017E
        ANDR    R4,     R6                      ; 5051   01A6
        CMPR    R0,     R6                      ; 5052   0146
        SUBR    R5,     R6                      ; 5053   012E
        ANDR    R2,     R6                      ; 5054   0196
L_5055:
        ANDR    R3,     R6                      ; 5055   019E
        DECLE   $021A                           ; 5056   021A

        SETC                                    ; 5057   0007
        ANDR    R0,     R6                      ; 5058   0186
        ANDR    R2,     R6                      ; 5059   0196
        SUBR    R5,     R6                      ; 505A   012E
        ANDR    R3,     R6                      ; 505B   019E
        SUBR    R5,     R6                      ; 505C   012E
        CMPR    R6,     R6                      ; 505D   0176
        ANDR    R4,     R6                      ; 505E   01A6
        ANDR    R3,     R6                      ; 505F   019E
        MVO@    R7,     R2                      ; 5060   0257
        SETC                                    ; 5061   0007
        CMPR    R3,     R6                      ; 5062   015E
        DECLE   $027E                           ; 5063   027E

        PSHR    R6                              ; 5064   0276
        BGT     L_52D5                          ; 5065   020E 026E

        MVO@    R6,     R1                      ; 5067   024E
        RSWD    R6                              ; 5068   003E
        MVI@    R3,     R6                      ; 5069   029E
        DECLE   $027D                           ; 506A   027D

        INCR    R2                              ; 506B   000A
        ANDR    R3,     R6                      ; 506C   019E
        ANDR    R5,     R6                      ; 506D   01AE
        ANDR    R0,     R6                      ; 506E   0186
        SUBR    R5,     R6                      ; 506F   012E
        ANDR    R2,     R6                      ; 5070   0196
        CLRC                                    ; 5071   0006
        SUBR    R3,     R6                      ; 5072   011E
        CMPR    R7,     R6                      ; 5073   017E
        SUBR    R2,     R6                      ; 5074   0116
        ANDR    R2,     R6                      ; 5075   0196
        SUBR    R1,     R6                      ; 5076   010E
        ADD@    R1,     R5                      ; 5077   02CD
        INCR    R0                              ; 5078   0008
        SUBR    R3,     R6                      ; 5079   011E
        DECLE   $027E                           ; 507A   027E

        MVI     .BTAB.96,R6                     ; 507B   0286 0296
        CLRC                                    ; 507D   0006
        MOVR    R1,     R6                      ; 507E   008E
        ADDR    R1,     R6                      ; 507F   00CE
        ADDR    R0,     R6                      ; 5080   00C6
        MOVR    R3,     R6                      ; 5081   009E
        DECLE   $0000                           ; 5082   0000
L_5083:
        MVI@    R5,     R1                      ; 5083   02A9
L_5084:
        MVI@    R5,     R2                      ; 5084   02AA
        MVO@    R2,     R4                      ; 5085   0262
        DECR    R1                              ; 5086   0011
        BPL     L_5084                          ; 5087   0223 0004

L_5089:
        MVI@    R5,     R4                      ; 5089   02AC
        TSTR    R4                              ; 508A   00A4
        BNEQ    L_5083                          ; 508B   022C 0009

        JSR     R5,     X_PLAY_MUS2             ; 508D   0004 0118 035D

        SUBR    R0,     R4                      ; 5090   0104
        SUBR    R2,     R4                      ; 5091   0114
        SUBR    R0,     R4                      ; 5092   0104
        SUBR    R6,     R4                      ; 5093   0134
        SUBR    R0,     R4                      ; 5094   0104
        SUBR    R2,     R4                      ; 5095   0114
        SUBR    R0,     R4                      ; 5096   0104
        SUBR    R6,     R4                      ; 5097   0134
        SUBR    R0,     R4                      ; 5098   0104
        SUBR    R2,     R4                      ; 5099   0114
        SUBR    R0,     R4                      ; 509A   0104
        SUBR    R6,     R4                      ; 509B   0134
        SUBR    R0,     R4                      ; 509C   0104
        SUBR    R2,     R4                      ; 509D   0114
        SUBR    R0,     R4                      ; 509E   0104
        SUBR    R6,     R4                      ; 509F   0134
        CMPR    R2,     R4                      ; 50A0   0154
        CMPR    R6,     R4                      ; 50A1   0174
        CMPR    R2,     R4                      ; 50A2   0154
        ANDR    R0,     R4                      ; 50A3   0184
        CMPR    R2,     R4                      ; 50A4   0154
        CMPR    R6,     R4                      ; 50A5   0174
        CMPR    R2,     R4                      ; 50A6   0154
        ANDR    R0,     R4                      ; 50A7   0184
        CMPR    R2,     R4                      ; 50A8   0154
        CMPR    R6,     R4                      ; 50A9   0174
        CMPR    R2,     R4                      ; 50AA   0154
        ANDR    R0,     R4                      ; 50AB   0184
        CMPR    R2,     R4                      ; 50AC   0154
        CMPR    R6,     R4                      ; 50AD   0174
        CMPR    R2,     R4                      ; 50AE   0154
        ANDR    R0,     R4                      ; 50AF   0184
        SUBR    R1,     R4                      ; 50B0   010C

        JSR     R5,     G_0CCC                  ; 50B1   0004 010C 00CC

        SUBR    R1,     R4                      ; 50B4   010C

        JSR     R5,     G_0D0C                  ; 50B5   0004 010C 010C

        ADDR    R1,     R4                      ; 50B8   00CC
        SUBR    R1,     R4                      ; 50B9   010C
        SUBR    R7,     R4                      ; 50BA   013C
        SUBR    R1,     R4                      ; 50BB   010C
        ADDR    R1,     R4                      ; 50BC   00CC
        SUBR    R1,     R4                      ; 50BD   010C
        SUBR    R7,     R4                      ; 50BE   013C
        SUBR    R1,     R4                      ; 50BF   010C
        ADDR    R1,     R4                      ; 50C0   00CC
        SUBR    R1,     R4                      ; 50C1   010C
        ADDR    R1,     R4                      ; 50C2   00CC
        SUBR    R1,     R4                      ; 50C3   010C
        ADDR    R1,     R4                      ; 50C4   00CC
        SUBR    R1,     R4                      ; 50C5   010C
        ADDR    R1,     R4                      ; 50C6   00CC
        SUBR    R1,     R4                      ; 50C7   010C
        DECLE   $0001                           ; 50C8   0001

        SUBR    R1,     R4                      ; 50C9   010C
        SUBR    R1,     R4                      ; 50CA   010C
        SUBR    R1,     R4                      ; 50CB   010C
        SUBR    R1,     R4                      ; 50CC   010C
        SUBR    R0,     R7                      ; 50CD   0107
        DECLE   $0000                           ; 50CE   0000

        PULR    R7                              ; 50CF   02B7
        PSHR    R5                              ; 50D0   0275
        MVII    #$0001, R0                      ; 50D1   02B8 0001
        INCR    R7                              ; 50D3   000F
L_50D4:
        CLRR    R0                              ; 50D4   01C0
        PSHR    R0                              ; 50D5   0270

        JSR     R5,     L_52C1                  ; 50D6   0004 0150 02C1

        MVII    #$022A, R4                      ; 50D9   02BC 022A
        MVII    #$0001, R1                      ; 50DB   02B9 0001
        MVII    #$015D, R5                      ; 50DD   02BD 015D
        MVO@    R1,     R5                      ; 50DF   0269
        MVO@    R1,     R5                      ; 50E0   0269
        MVO@    R1,     R5                      ; 50E1   0269
        MVO@    R1,     R5                      ; 50E2   0269
        MVII    #$0006, R3                      ; 50E3   02BB 0006

        JSR     R5,     X_PRINT_R5              ; 50E5   0004 0118 007B

        RLC     R0,     1                       ; 50E8   0050
        SAR     R0,     2                       ; 50E9   006C
        SLR     R1,     1                       ; 50EA   0061
        SARC    R1,     1                       ; 50EB   0079
        SLR     R1,     2                       ; 50EC   0065
        RRC     R2,     1                       ; 50ED   0072
        RRC     R3,     1                       ; 50EE   0073
        NEGR    R0                              ; 50EF   0020
        RSWD    R7                              ; 50F0   003F
        DECLE   $0000                           ; 50F1   0000

        ADD@    R6,     R7                      ; 50F2   02F7
        PULR    R7                              ; 50F3   02B7

L_50F4:
        JSR     R5,     L_50FF                  ; 50F4   0004 0150 00FF
        DECLE   $0000,  $0000                   ; 50F7   0000 0000

        EIS                                     ; 50F9   0002
        RLC     R1,     1                       ; 50FA   0051
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50FB   0000 0000 0000 0000
L_50FF:
        MVO     R5,     G_035D                  ; 50FF   0245 035D
        PULR    R7                              ; 5101   02B7
        PSHR    R5                              ; 5102   0275
        MVI     G_015F, R1                      ; 5103   0281 015F
        TSTR    R1                              ; 5105   0089
        BEQ     L_50D4                          ; 5106   0224 0033

        MVI     G_0162, R1                      ; 5108   0281 0162
        TSTR    R1                              ; 510A   0089
        BNEQ    L_5168                          ; 510B   020C 005B

        ANDI    #$000F, R0                      ; 510D   03B8 000F
        MVI     G_0161, R1                      ; 510F   0281 0161
        TSTR    R1                              ; 5111   0089
        BEQ     L_512C                          ; 5112   0204 0018

        CMPI    #$0005, R0                      ; 5114   0378 0005
        BGT     L_5154                          ; 5116   020E 003C

        TSTR    R0                              ; 5118   0080
        BEQ     L_5154                          ; 5119   0204 0039

        MVI     G_0161, R1                      ; 511B   0281 0161
        DECR    R1                              ; 511D   0011
        MVO     R1,     G_0161                  ; 511E   0241 0161
        MVO     R0,     G_0162                  ; 5120   0240 0162
        MVII    #$0007, R3                      ; 5122   02BB 0007
        MVII    #$0001, R1                      ; 5124   02B9 0001
        MVII    #$029E, R4                      ; 5126   02BC 029E

        JSR     R5,     X_PRNUM_RGT             ; 5128   0004 0118 00C5

        PULR    R7                              ; 512B   02B7
L_512C:
        MVII    #$0009, R4                      ; 512C   02BC 0009
        CMPI    #$0001, R0                      ; 512E   0378 0001
        BEQ     L_5138                          ; 5130   0204 0006

        CMPI    #$0002, R0                      ; 5132   0378 0002
        BNEQ    L_5154                          ; 5134   020C 001E

        MVO     R4,     G_0174                  ; 5136   0244 0174
L_5138:
        MVO     R0,     G_0161                  ; 5138   0240 0161
        MVO     R4,     G_0164                  ; 513A   0244 0164
        MVII    #$0007, R3                      ; 513C   02BB 0007
        MVII    #$023A, R4                      ; 513E   02BC 023A
        MVII    #$0001, R1                      ; 5140   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 5142   0004 0118 00C5

        DECR    R3                              ; 5145   0013
        MVII    #$028E, R4                      ; 5146   02BC 028E

        JSR     R5,     X_PRINT_R5              ; 5148   0004 0118 007B

        SLL     R0,     2                       ; 514B   004C
        SLR     R1,     2                       ; 514C   0065
        RRC     R2,     2                       ; 514D   0076
        SLR     R1,     2                       ; 514E   0065
        SAR     R0,     2                       ; 514F   006C
        NEGR    R0                              ; 5150   0020
        RSWD    R7                              ; 5151   003F
        DECLE   $0000                           ; 5152   0000

        PULR    R7                              ; 5153   02B7

L_5154:
        JSR     R5,     X_PLAY_RAZZ2            ; 5154   0004 011C 02BD

        PULR    R7                              ; 5157   02B7
        PSHR    R5                              ; 5158   0275
L_5159:
        SDBD                                    ; 5159   0001
        MVII    #$5162, R5                      ; 515A   02BD 0062 0051
        PSHR    R5                              ; 515D   0275
        MVII    #$0005, R1                      ; 515E   02B9 0005
        B       L_516E                          ; 5160   0200 000C

        CLRR    R0                              ; 5162   01C0
        CLRR    R1                              ; 5163   01C9

        JSR     R5,     L_55CA                  ; 5164   0004 0154 01CA

        PULR    R7                              ; 5167   02B7
L_5168:
        CMPI    #$0005, R1                      ; 5168   0379 0005
        BNEQ    L_516E                          ; 516A   020C 0002
        B       L_5159                          ; 516C   0220 0014

L_516E:
        DECR    R1                              ; 516E   0011
        MVO     R1,     G_0162                  ; 516F   0241 0162
        BEQ     L_517F                          ; 5171   0204 000C

        MVII    #$0006, R1                      ; 5173   02B9 0006
        MVO     R1,     G_0164                  ; 5175   0241 0164
        MVI     G_0161, R0                      ; 5177   0280 0161
        CMPI    #$0001, R0                      ; 5179   0378 0001
        BNEQ    L_517F                          ; 517B   020C 0002

        MVO     R1,     G_0174                  ; 517D   0241 0174
L_517F:
        SDBD                                    ; 517F   0001
        MVII    #$6753, R1                      ; 5180   02B9 0053 0067
        SDBD                                    ; 5183   0001
        MVII    #$66BD, R2                      ; 5184   02BA 00BD 0066
        MVII    #$00FF, R3                      ; 5187   02BB 00FF
        MVII    #$0004, R4                      ; 5189   02BC 0004
        MVII    #$0166, R5                      ; 518B   02BD 0166
        MVII    #$0001, R0                      ; 518D   02B8 0001
L_518F:
        MVO@    R1,     R5                      ; 518F   0269
        SWAP    R1,     1                       ; 5190   0041
        MVO@    R1,     R5                      ; 5191   0269
        SWAP    R1,     1                       ; 5192   0041
        MVO@    R4,     R5                      ; 5193   026C
        MVO@    R2,     R5                      ; 5194   026A
        SWAP    R2,     1                       ; 5195   0042
        MVO@    R2,     R5                      ; 5196   026A
        SWAP    R2,     1                       ; 5197   0042
        INCR    R5                              ; 5198   000D
        MVO@    R3,     R5                      ; 5199   026B
        ADDI    #$0009, R5                      ; 519A   02FD 0009
        DECR    R0                              ; 519C   0010
        BPL     L_518F                          ; 519D   0223 000F

        MVII    #$0164, R4                      ; 519F   02BC 0164
        MVII    #$01B0, R1                      ; 51A1   02B9 01B0
        MVII    #$0020, R0                      ; 51A3   02B8 0020

        JSR     R5,     .EXEC.730               ; 51A5   0004 0114 0330

L_51A8:
        SDBD                                    ; 51A8   0001
        MVII    #$5027, R1                      ; 51A9   02B9 0027 0050

        JSR     R5,     X_TIMER_STOP            ; 51AC   0004 0118 0038
        JSR     R5,     L_65E8                  ; 51AF   0004 0164 01E8

        CLRR    R1                              ; 51B2   01C9
        MVO     R1,     G_01D1                  ; 51B3   0241 01D1
        MVO     R1,     G_015D                  ; 51B5   0241 015D
        MVO     R1,     G_015E                  ; 51B7   0241 015E
        MVO     R1,     G_01E2                  ; 51B9   0241 01E2
        DECR    R1                              ; 51BB   0011
        MVO     R1,     G_016C                  ; 51BC   0241 016C
        MVO     R1,     G_017C                  ; 51BE   0241 017C
        MVII    #$0184, R4                      ; 51C0   02BC 0184
        MVII    #$002B, R0                      ; 51C2   02B8 002B
        MVO     R4,     G_035D                  ; 51C4   0244 035D

        JSR     R5,     X_FILL_ZERO             ; 51C6   0004 0114 0338
        JSR     R5,     L_52C1                  ; 51C9   0004 0150 02C1

        MVII    #$0004, R1                      ; 51CC   02B9 0004
        MVO     R1,     G_0103                  ; 51CE   0241 0103
        SLR     R1,     1                       ; 51D0   0061
        MVO     R1,     G_0160                  ; 51D1   0241 0160
        MVO     R1,     G_01D6                  ; 51D3   0241 01D6
        MVII    #$02DC, R4                      ; 51D5   02BC 02DC
        SDBD                                    ; 51D7   0001
        MVII    #$0872, R1                      ; 51D8   02B9 0072 0008
        MVII    #$0013, R0                      ; 51DB   02B8 0013
L_51DD:
        MVO@    R1,     R4                      ; 51DD   0261
        DECR    R0                              ; 51DE   0010
        BPL     L_51DD                          ; 51DF   0223 0003

        JSR     R5,     L_52FA                  ; 51E1   0004 0150 02FA

        MVII    #$0227, R1                      ; 51E4   02B9 0227
        CLRR    R0                              ; 51E6   01C0
L_51E7:
        ADDI    #$0014, R1                      ; 51E7   02F9 0014
        MVI@    R1,     R2                      ; 51E9   028A
        ANDI    #$01F8, R2                      ; 51EA   03BA 01F8
        CMPI    #$0070, R2                      ; 51EC   037A 0070
        BNEQ    L_51F3                          ; 51EE   020C 0003

        INCR    R0                              ; 51F0   0008
        B       L_51E7                          ; 51F1   0220 000B

L_51F3:
        DECR    R0                              ; 51F3   0010
        BMI     L_5219                          ; 51F4   020B 0023

        INCR    R0                              ; 51F6   0008
        CLRR    R3                              ; 51F7   01DB
L_51F8:
        PSHR    R0                              ; 51F8   0270
        PSHR    R3                              ; 51F9   0273
        MVII    #$023B, R1                      ; 51FA   02B9 023B
        SUBR    R0,     R1                      ; 51FC   0101
        SDBD                                    ; 51FD   0001
        MVII    #$0872, R4                      ; 51FE   02BC 0072 0008
L_5201:
        MVO@    R4,     R1                      ; 5201   024C
        DECR    R3                              ; 5202   0013
        BMI     L_5209                          ; 5203   020B 0004

        ADDI    #$0014, R1                      ; 5205   02F9 0014
        B       L_5201                          ; 5207   0220 0007

L_5209:
        SDBD                                    ; 5209   0001
        MVII    #$089A, R4                      ; 520A   02BC 009A 0008
        MVO@    R4,     R1                      ; 520D   024C
        PULR    R3                              ; 520E   02B3
        PULR    R0                              ; 520F   02B0
        INCR    R3                              ; 5210   000B
        DECR    R0                              ; 5211   0010
        BPL     L_51F8                          ; 5212   0223 001B

        SDBD                                    ; 5214   0001
        MVII    #$0862, R4                      ; 5215   02BC 0062 0008
        MVO@    R4,     R1                      ; 5218   024C
L_5219:
        MVII    #$02EF, R1                      ; 5219   02B9 02EF
        CLRR    R0                              ; 521B   01C0
L_521C:
        SUBI    #$0014, R1                      ; 521C   0339 0014
        MVI@    R1,     R2                      ; 521E   028A
        ANDI    #$01F8, R2                      ; 521F   03BA 01F8
        CMPI    #$0070, R2                      ; 5221   037A 0070
        BNEQ    L_5228                          ; 5223   020C 0003

        INCR    R0                              ; 5225   0008
        B       L_521C                          ; 5226   0220 000B

L_5228:
        DECR    R0                              ; 5228   0010
        BMI     L_524E                          ; 5229   020B 0023

        INCR    R0                              ; 522B   0008
        CLRR    R3                              ; 522C   01DB
L_522D:
        PSHR    R0                              ; 522D   0270
        PSHR    R3                              ; 522E   0273
        MVII    #$02DB, R1                      ; 522F   02B9 02DB
        SUBR    R0,     R1                      ; 5231   0101
        SDBD                                    ; 5232   0001
        MVII    #$0872, R4                      ; 5233   02BC 0072 0008
L_5236:
        MVO@    R4,     R1                      ; 5236   024C
        DECR    R3                              ; 5237   0013
        BMI     L_523E                          ; 5238   020B 0004

        SUBI    #$0014, R1                      ; 523A   0339 0014
        B       L_5236                          ; 523C   0220 0007

L_523E:
        SDBD                                    ; 523E   0001
        MVII    #$085A, R4                      ; 523F   02BC 005A 0008
        MVO@    R4,     R1                      ; 5242   024C
        PULR    R3                              ; 5243   02B3
        PULR    R0                              ; 5244   02B0
        INCR    R3                              ; 5245   000B
        DECR    R0                              ; 5246   0010
        BPL     L_522D                          ; 5247   0223 001B

        SDBD                                    ; 5249   0001
        MVII    #$086A, R4                      ; 524A   02BC 006A 0008
        MVO@    R4,     R1                      ; 524D   024C
L_524E:
        SDBD                                    ; 524E   0001
        MVII    #$597C, R1                      ; 524F   02B9 007C 0059
        MVII    #$031D, R2                      ; 5252   02BA 031D
        MVII    #$0002, R0                      ; 5254   02B8 0002

        JSR     R5,     X_INIT_MOBS             ; 5256   0004 0114 02B4

        MVII    #$0215, R4                      ; 5259   02BC 0215
        MVII    #$0006, R3                      ; 525B   02BB 0006

        JSR     R5,     X_PRINT_R5              ; 525D   0004 0118 007B

        SWAP    R3,     2                       ; 5260   0047
        SWAP    R1,     2                       ; 5261   0045
        RLC     R0,     2                       ; 5262   0054
        NEGR    R0                              ; 5263   0020
        RLC     R2,     1                       ; 5264   0052
        SWAP    R1,     2                       ; 5265   0045
        SWAP    R1,     1                       ; 5266   0041
        SWAP    R0,     2                       ; 5267   0044
        SLLC    R1,     1                       ; 5268   0059
        NEGR    R0                              ; 5269   0020
        RLC     R0,     1                       ; 526A   0050
        SLL     R0,     2                       ; 526B   004C
        SWAP    R1,     1                       ; 526C   0041
        SLLC    R1,     1                       ; 526D   0059
        SWAP    R1,     2                       ; 526E   0045
        RLC     R2,     1                       ; 526F   0052
        NEGR    R0                              ; 5270   0020
        DECLE   $0000                           ; 5271   0000

        MVI     G_0163, R0                      ; 5272   0280 0163
        INCR    R0                              ; 5274   0008
        MVII    #$0006, R3                      ; 5275   02BB 0006
L_5277:
        MVII    #$0001, R1                      ; 5277   02B9 0001
        MVII    #$0226, R4                      ; 5279   02BC 0226

        JSR     R5,     X_PRNUM_RGT             ; 527B   0004 0118 00C5

        SLR     R3,     1                       ; 527E   0063
        MVO     R3,     G_0160                  ; 527F   0243 0160

L_5281:
        JSR     R5,     L_528E                  ; 5281   0004 0150 028E

        ADDR    R1,     R2                      ; 5284   00CA
        RLC     R1,     2                       ; 5285   0055
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5286   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 528A   0000 0000 0000 0000
L_528E:
        MVO     R5,     G_035D                  ; 528E   0245 035D
        SLR     R3,     1                       ; 5290   0063
        MVO     R3,     G_0185                  ; 5291   0243 0185
        MVO     R3,     G_019A                  ; 5293   0243 019A

L_5295:
        JSR     R5,     X_PLAY_SFX1             ; 5295   0004 0118 03BB

        RRC     R3,     2                       ; 5298   0077
        SLR     R0,     1                       ; 5299   0060
        SLR     R2,     2                       ; 529A   0066
        AND@    R1,     R1                      ; 529B   0389
        ADDR    R5,     R3                      ; 529C   00EB
        RLC     R0,     1                       ; 529D   0050
        XORR    R7,     R5                      ; 529E   01FD
        SLLC    R0,     1                       ; 529F   0058
        XORR    R4,     R0                      ; 52A0   01E0
        RLC     R0,     2                       ; 52A1   0054
        XORR    R6,     R0                      ; 52A2   01F0
        INCR    R4                              ; 52A3   000C
        CMPR    R3,     R4                      ; 52A4   015C
        MVI@    R1,     R3                      ; 52A5   028B
        RRC     R3,     2                       ; 52A6   0077
        SAR     R3,     1                       ; 52A7   006B
        SLR     R2,     2                       ; 52A8   0066
L_52A9:
        MVII    #$0187, R4                      ; 52A9   02BC 0187
        MVII    #$0005, R0                      ; 52AB   02B8 0005
        B       L_52C5                          ; 52AD   0200 0016

L_52AF:
        MVII    #$0214, R4                      ; 52AF   02BC 0214
        MVII    #$0014, R0                      ; 52B1   02B8 0014
        B       L_52C5                          ; 52B3   0200 0010

L_52B5:
        MVII    #$031D, R4                      ; 52B5   02BC 031D
        MVII    #$0040, R0                      ; 52B7   02B8 0040
        B       L_52C5                          ; 52B9   0200 000A

L_52BB:
        MVII    #$0208, R4                      ; 52BB   02BC 0208
        MVII    #$0008, R0                      ; 52BD   02B8 0008
        B       L_52C5                          ; 52BF   0200 0004

L_52C1:
        MVII    #$0200, R4                      ; 52C1   02BC 0200
        MVII    #$00F0, R0                      ; 52C3   02B8 00F0
L_52C5:
        PSHR    R5                              ; 52C5   0275

        JSR     R5,     X_FILL_ZERO             ; 52C6   0004 0114 0338

        PULR    R7                              ; 52C9   02B7
L_52CA:
        MVII    #$0174, R4                      ; 52CA   02BC 0174
        MVII    #$0010, R3                      ; 52CC   02BB 0010
        NEGR    R3                              ; 52CE   0023
        ADD     G_0163, R7                      ; 52CF   02C7 0163
        ADDR    R3,     R4                      ; 52D1   00DC
        ADDR    R1,     R4                      ; 52D2   00CC
        MOVR    R5,     R7                      ; 52D3   00AF
L_52D4:
        PSHR    R5                              ; 52D4   0275
L_52D5:
        MVII    #$0227, R2                      ; 52D5   02BA 0227
        MVII    #$000A, R0                      ; 52D7   02B8 000A
L_52D9:
        PSHR    R2                              ; 52D9   0272
        PSHR    R0                              ; 52DA   0270
        MOVR    R2,     R1                      ; 52DB   0091
        DECR    R1                              ; 52DC   0011
        MVII    #$0005, R0                      ; 52DD   02B8 0005
        MVI@    R2,     R3                      ; 52DF   0293
L_52E0:
        DECR    R2                              ; 52E0   0012
        MVI@    R2,     R4                      ; 52E1   0294
        DECR    R2                              ; 52E2   0012
        MVI@    R2,     R5                      ; 52E3   0295
        DECR    R2                              ; 52E4   0012
        MVO@    R3,     R1                      ; 52E5   024B
        DECR    R1                              ; 52E6   0011
        MVO@    R4,     R1                      ; 52E7   024C
        DECR    R1                              ; 52E8   0011
        MVI@    R2,     R3                      ; 52E9   0293
        MVO@    R5,     R1                      ; 52EA   024D
        DECR    R1                              ; 52EB   0011
        DECR    R0                              ; 52EC   0010
        BPL     L_52E0                          ; 52ED   0223 000E

        DECR    R2                              ; 52EF   0012
        MVI@    R1,     R4                      ; 52F0   028C
        MVO@    R3,     R1                      ; 52F1   024B
        PULR    R0                              ; 52F2   02B0
        PULR    R2                              ; 52F3   02B2
        ADDI    #$0014, R2                      ; 52F4   02FA 0014
        DECR    R0                              ; 52F6   0010
        BPL     L_52D9                          ; 52F7   0223 001F

        INCR    R7                              ; 52F9   000F
L_52FA:
        PSHR    R5                              ; 52FA   0275
        MVII    #$0009, R0                      ; 52FB   02B8 0009
        CLRR    R1                              ; 52FD   01C9
        MVII    #$023B, R4                      ; 52FE   02BC 023B
L_5300:
        MVO@    R1,     R4                      ; 5300   0261
        ADDI    #$0013, R4                      ; 5301   02FC 0013
        DECR    R0                              ; 5303   0010
        BPL     L_5300                          ; 5304   0223 0005

        MVII    #$0002, R1                      ; 5306   02B9 0002

        JSR     R5,     L_52CA                  ; 5308   0004 0150 02CA

        PSHR    R4                              ; 530B   0274
        MVO     R4,     G_019B                  ; 530C   0244 019B
        SDBD                                    ; 530E   0001
        MVI@    R4,     R5                      ; 530F   02A5
        ADDI    #$0003, R4                      ; 5310   02FC 0003
        MOVR    R4,     R3                      ; 5312   00A3
        MVI@    R3,     R1                      ; 5313   0299
        DECR    R1                              ; 5314   0011
        BPL     L_5434                          ; 5315   0203 011D

        MVII    #$0008, R0                      ; 5317   02B8 0008
        SDBD                                    ; 5319   0001
        MVII    #$671E, R4                      ; 531A   02BC 001E 0067
L_531D:
        SDBD                                    ; 531D   0001
        MVI@    R4,     R2                      ; 531E   02A2
        CMPR    R2,     R5                      ; 531F   0155
        BEQ     L_542F                          ; 5320   0204 010D

        DECR    R0                              ; 5322   0010
        BPL     L_531D                          ; 5323   0223 0007

        MVI@    R5,     R1                      ; 5325   02A9
        PSHR    R1                              ; 5326   0271
        ANDI    #$001F, R1                      ; 5327   03B9 001F
        MOVR    R1,     R2                      ; 5329   008A
        SLR     R1,     1                       ; 532A   0061
        SLR     R1,     2                       ; 532B   0065
        ANDI    #$0007, R2                      ; 532C   03BA 0007
        SDBD                                    ; 532E   0001
        MVII    #$0870, R3                      ; 532F   02BB 0070 0008
        XOR     G_01D6, R3                      ; 5332   03C3 01D6
        MVI     G_0162, R4                      ; 5334   0284 0162
        CMPI    #$0001, R4                      ; 5336   037C 0001
        BEQ     L_533F                          ; 5338   0204 0005

        CMPI    #$0003, R4                      ; 533A   037C 0003
        BGE     L_533F                          ; 533C   020D 0001

        DECR    R2                              ; 533E   0012
L_533F:
        MVII    #$023B, R4                      ; 533F   02BC 023B
L_5341:
        DECR    R2                              ; 5341   0012
        BMI     L_5349                          ; 5342   020B 0005

        MVO@    R3,     R4                      ; 5344   0263
        ADDI    #$0013, R4                      ; 5345   02FC 0013
        B       L_5341                          ; 5347   0220 0007

L_5349:
        CMPI    #$023B, R4                      ; 5349   037C 023B
        BEQ     L_536D                          ; 534B   0204 0020

        SUBI    #$0014, R4                      ; 534D   033C 0014
        SLL     R1,     1                       ; 534F   0049
        PSHR    R1                              ; 5350   0271
        SLL     R1,     2                       ; 5351   004D
        SUB@    R6,     R1                      ; 5352   0331
        ADDR    R1,     R7                      ; 5353   00CF
        SDBD                                    ; 5354   0001
        MVII    #$0840, R2                      ; 5355   02BA 0040 0008
        B       L_550D                          ; 5358   0200 01B3

        SDBD                                    ; 535A   0001
        MVII    #$0898, R2                      ; 535B   02BA 0098 0008
        B       L_536A                          ; 535E   0200 000A

        SDBD                                    ; 5360   0001
        MVII    #$08A0, R2                      ; 5361   02BA 00A0 0008
        B       L_536A                          ; 5364   0200 0004

        SDBD                                    ; 5366   0001
        MVII    #$0860, R2                      ; 5367   02BA 0060 0008
L_536A:
        XOR     G_01D6, R2                      ; 536A   03C2 01D6
        MVO@    R2,     R4                      ; 536C   0262
L_536D:
        PULR    R1                              ; 536D   02B1
        SLR     R1,     2                       ; 536E   0065
        SLR     R1,     2                       ; 536F   0065
        SLR     R1,     1                       ; 5370   0061
        MOVR    R1,     R2                      ; 5371   008A
        SLR     R1,     1                       ; 5372   0061
        SLR     R1,     2                       ; 5373   0065
        ANDI    #$0007, R2                      ; 5374   03BA 0007
        SDBD                                    ; 5376   0001
        MVII    #$0870, R3                      ; 5377   02BB 0070 0008
        XOR     G_01D6, R3                      ; 537A   03C3 01D6
        MVI     G_0162, R4                      ; 537C   0284 0162
        CMPI    #$0001, R4                      ; 537E   037C 0001
        BGT     L_5383                          ; 5380   020E 0001

        DECR    R2                              ; 5382   0012
L_5383:
        MVII    #$02EF, R4                      ; 5383   02BC 02EF
L_5385:
        DECR    R2                              ; 5385   0012
        BMI     L_538D                          ; 5386   020B 0005

        MVO@    R3,     R4                      ; 5388   0263
        SUBI    #$0015, R4                      ; 5389   033C 0015
        B       L_5385                          ; 538B   0220 0007

L_538D:
        DECR    R1                              ; 538D   0011
        BMI     L_53F0                          ; 538E   020B 0060

        SLL     R1,     1                       ; 5390   0049
        PSHR    R1                              ; 5391   0271
        SLL     R1,     2                       ; 5392   004D
        SUB@    R6,     R1                      ; 5393   0331
        ADDR    R1,     R7                      ; 5394   00CF
        SDBD                                    ; 5395   0001
        MVII    #$0868, R2                      ; 5396   02BA 0068 0008
        B       L_53A5                          ; 5399   0200 000A

        SDBD                                    ; 539B   0001
        MVII    #$0850, R2                      ; 539C   02BA 0050 0008
        B       L_53A5                          ; 539F   0200 0004

        SDBD                                    ; 53A1   0001
        MVII    #$0858, R2                      ; 53A2   02BA 0058 0008
L_53A5:
        XOR     G_01D6, R2                      ; 53A5   03C2 01D6
        MVO@    R2,     R4                      ; 53A7   0262
L_53A8:
        MOVR    R5,     R1                      ; 53A8   00A9
        PULR    R4                              ; 53A9   02B4
        SDBD                                    ; 53AA   0001
        CMPI    #$6FFF, R1                      ; 53AB   0379 00FF 006F
        BLT     L_53C2                          ; 53AE   0205 0012

        SDBD                                    ; 53B0   0001
        MVII    #$6753, R1                      ; 53B1   02B9 0053 0067
        SDBD                                    ; 53B4   0001
        MVII    #$66BD, R3                      ; 53B5   02BB 00BD 0066
        ADDI    #$0003, R4                      ; 53B8   02FC 0003
        MVO@    R3,     R4                      ; 53BA   0263
        SWAP    R3,     1                       ; 53BB   0043
        MVO@    R3,     R4                      ; 53BC   0263
        SUBI    #$0005, R4                      ; 53BD   033C 0005
        CLRR    R5                              ; 53BF   01ED
        MVO     R5,     G_01D1                  ; 53C0   0245 01D1
L_53C2:
        MVO@    R1,     R4                      ; 53C2   0261
        SWAP    R1,     1                       ; 53C3   0041
        MVO@    R1,     R4                      ; 53C4   0261
        SWAP    R1,     1                       ; 53C5   0041
        SDBD                                    ; 53C6   0001
        CMPI    #$6FDF, R1                      ; 53C7   0379 00DF 006F
        BNEQ    L_53EA                          ; 53CA   020C 001E

        SDBD                                    ; 53CC   0001
        MVII    #$58D3, R1                      ; 53CD   02B9 00D3 0058
        MVII    #$0004, R0                      ; 53D0   02B8 0004
        MVO     R0,     G_0102                  ; 53D2   0240 0102
        SLR     R0,     1                       ; 53D4   0060
        MVII    #$032D, R2                      ; 53D5   02BA 032D

        JSR     R5,     X_INIT_MOBS             ; 53D7   0004 0114 02B4
        JSR     R5,     L_52BB                  ; 53DA   0004 0150 02BB

        MVII    #$0058, R1                      ; 53DD   02B9 0058
        MVI     G_0162, R0                      ; 53DF   0280 0162
        CMPI    #$0002, R0                      ; 53E1   0378 0002
        BGE     L_53EA                          ; 53E3   020D 0005

        SWAP    R1,     1                       ; 53E5   0041
        MVO     R1,     G_0338                  ; 53E6   0241 0338
        MVO     R1,     G_0330                  ; 53E8   0241 0330
L_53EA:
        MVI     G_019C, R1                      ; 53EA   0281 019C
        INCR    R1                              ; 53EC   0009
        MVO     R1,     G_019C                  ; 53ED   0241 019C
        PULR    R7                              ; 53EF   02B7
L_53F0:
        PSHR    R4                              ; 53F0   0274
        MVI     G_019B, R4                      ; 53F1   0284 019B
        ADDI    #$0102, R4                      ; 53F3   02FC 0102
        MVI@    R4,     R2                      ; 53F5   02A2
        SDBD                                    ; 53F6   0001
        MVI@    R4,     R3                      ; 53F7   02A3
        DECR    R2                              ; 53F8   0012
        BPL     L_5401                          ; 53F9   0203 0006

        MVI@    R3,     R1                      ; 53FB   0299
        INCR    R3                              ; 53FC   000B
        MVII    #$0004, R2                      ; 53FD   02BA 0004
        B       L_5408                          ; 53FF   0200 0007

L_5401:
        PSHR    R2                              ; 5401   0272
        MVI@    R3,     R1                      ; 5402   0299
L_5403:
        SLR     R1,     2                       ; 5403   0065
        DECR    R2                              ; 5404   0012
        BPL     L_5403                          ; 5405   0223 0003

        PULR    R2                              ; 5407   02B2
L_5408:
        ANDI    #$0003, R1                      ; 5408   03B9 0003
        SUBI    #$0003, R4                      ; 540A   033C 0003
        MVO@    R2,     R4                      ; 540C   0262
        MVO@    R3,     R4                      ; 540D   0263
        SWAP    R3,     1                       ; 540E   0043
        MVO@    R3,     R4                      ; 540F   0263
        PULR    R4                              ; 5410   02B4
        SLL     R1,     1                       ; 5411   0049
        PSHR    R1                              ; 5412   0271
        SLL     R1,     2                       ; 5413   004D
        SUB@    R6,     R1                      ; 5414   0331
        ADDR    R1,     R7                      ; 5415   00CF
        SDBD                                    ; 5416   0001
        MVII    #$0831, R2                      ; 5417   02BA 0031 0008
        B       L_542C                          ; 541A   0200 0010

        SDBD                                    ; 541C   0001
        MVII    #$082C, R2                      ; 541D   02BA 002C 0008
        B       L_542C                          ; 5420   0200 000A

        SDBD                                    ; 5422   0001
        MVII    #$0827, R2                      ; 5423   02BA 0027 0008
        B       L_542C                          ; 5426   0200 0004

        SDBD                                    ; 5428   0001
        MVII    #$083F, R2                      ; 5429   02BA 003F 0008
L_542C:
        MVO@    R2,     R4                      ; 542C   0262
        B       L_53A8                          ; 542D   0220 0086

L_542F:
        MVI@    R5,     R1                      ; 542F   02A9
        MVI     G_019B, R3                      ; 5430   0283 019B
        ADDI    #$0105, R3                      ; 5432   02FB 0105
L_5434:
        MVO@    R1,     R3                      ; 5434   0259
        SDBD                                    ; 5435   0001
        CMPI    #$6F7A, R5                      ; 5436   037D 007A 006F
        BC      L_5475                          ; 5439   0201 003A

        SDBD                                    ; 543B   0001
        CMPI    #$6E01, R5                      ; 543C   037D 0001 006E
        BC      L_5447                          ; 543F   0201 0006

        SDBD                                    ; 5441   0001
        CMPI    #$6CF7, R5                      ; 5442   037D 00F7 006C
        BC      L_5475                          ; 5445   0201 002E

L_5447:
        MVI@    R5,     R1                      ; 5447   02A9
        TSTR    R1                              ; 5448   0089
        BEQ     L_5475                          ; 5449   0204 002A

        MOVR    R1,     R2                      ; 544B   008A
        ANDI    #$000F, R2                      ; 544C   03BA 000F
        SLR     R1,     2                       ; 544E   0065
        SLR     R1,     2                       ; 544F   0065
        PSHR    R1                              ; 5450   0271
        ANDI    #$0003, R1                      ; 5451   03B9 0003
        PSHR    R5                              ; 5453   0275

        JSR     R5,     L_549E                  ; 5454   0004 0154 009E

        PULR    R5                              ; 5457   02B5
        MVI     G_0162, R4                      ; 5458   0284 0162
        CMPI    #$0001, R4                      ; 545A   037C 0001
        BEQ     L_5463                          ; 545C   0204 0005

        CMPI    #$0003, R4                      ; 545E   037C 0003
        BGE     L_5463                          ; 5460   020D 0001

        DECR    R2                              ; 5462   0012
L_5463:
        MVII    #$023B, R4                      ; 5463   02BC 023B
L_5465:
        DECR    R2                              ; 5465   0012
        BMI     L_546D                          ; 5466   020B 0005

        MVO@    R3,     R4                      ; 5468   0263
        ADDI    #$0013, R4                      ; 5469   02FC 0013
        B       L_5465                          ; 546B   0220 0007

L_546D:
        PULR    R1                              ; 546D   02B1
        PSHR    R5                              ; 546E   0275
        SLR     R1,     2                       ; 546F   0065

        JSR     R5,     L_549E                  ; 5470   0004 0154 009E

        PULR    R5                              ; 5473   02B5
        MVO@    R3,     R4                      ; 5474   0263
L_5475:
        MVI@    R5,     R1                      ; 5475   02A9
        MOVR    R1,     R2                      ; 5476   008A
        ANDI    #$000F, R2                      ; 5477   03BA 000F
        SLR     R1,     2                       ; 5479   0065
        SLR     R1,     2                       ; 547A   0065
        PSHR    R1                              ; 547B   0271
        ANDI    #$0003, R1                      ; 547C   03B9 0003
        PSHR    R5                              ; 547E   0275

        JSR     R5,     L_549E                  ; 547F   0004 0154 009E

        PULR    R5                              ; 5482   02B5
        MVI     G_0162, R4                      ; 5483   0284 0162
        CMPI    #$0001, R4                      ; 5485   037C 0001
        BGT     L_548A                          ; 5487   020E 0001

        DECR    R2                              ; 5489   0012
L_548A:
        MVII    #$02EF, R4                      ; 548A   02BC 02EF
L_548C:
        DECR    R2                              ; 548C   0012
        BMI     L_5494                          ; 548D   020B 0005

        MVO@    R3,     R4                      ; 548F   0263
        SUBI    #$0015, R4                      ; 5490   033C 0015
        B       L_548C                          ; 5492   0220 0007

L_5494:
        PULR    R1                              ; 5494   02B1
        PSHR    R5                              ; 5495   0275
        SLR     R1,     2                       ; 5496   0065

        JSR     R5,     L_549E                  ; 5497   0004 0154 009E

        PULR    R5                              ; 549A   02B5
        MVO@    R3,     R4                      ; 549B   0263
        B       L_53A8                          ; 549C   0220 00F5

L_549E:
        PSHR    R5                              ; 549E   0275
        ANDI    #$000F, R1                      ; 549F   03B9 000F
        SLL     R1,     1                       ; 54A1   0049
        PSHR    R1                              ; 54A2   0271
        SLL     R1,     2                       ; 54A3   004D
        SUB@    R6,     R1                      ; 54A4   0331
        ADDR    R1,     R7                      ; 54A5   00CF
        SDBD                                    ; 54A6   0001
        MVII    #$2E79, R3                      ; 54A7   02BB 0079 002E
        B       L_5504                          ; 54AA   0200 0058

        SDBD                                    ; 54AC   0001
        MVII    #$1C90, R3                      ; 54AD   02BB 0090 001C
        B       L_5504                          ; 54B0   0200 0052

        SDBD                                    ; 54B2   0001
        MVII    #$08A9, R3                      ; 54B3   02BB 00A9 0008
        B       L_5504                          ; 54B6   0200 004C

        SDBD                                    ; 54B8   0001
        MVII    #$0849, R3                      ; 54B9   02BB 0049 0008
        B       L_5504                          ; 54BC   0200 0046

        SDBD                                    ; 54BE   0001
        MVII    #$0811, R3                      ; 54BF   02BB 0011 0008
        B       L_5504                          ; 54C2   0200 0040

        SDBD                                    ; 54C4   0001
        MVII    #$0889, R3                      ; 54C5   02BB 0089 0008
        B       L_5504                          ; 54C8   0200 003A

        SDBD                                    ; 54CA   0001
        MVII    #$0881, R3                      ; 54CB   02BB 0081 0008
        B       L_5504                          ; 54CE   0200 0034

        SDBD                                    ; 54D0   0001
        MVII    #$0886, R3                      ; 54D1   02BB 0086 0008
        B       L_5504                          ; 54D4   0200 002E

        SDBD                                    ; 54D6   0001
        MVII    #$082C, R3                      ; 54D7   02BB 002C 0008
        B       L_5504                          ; 54DA   0200 0028

        SDBD                                    ; 54DC   0001
        MVII    #$0831, R3                      ; 54DD   02BB 0031 0008
        B       L_5504                          ; 54E0   0200 0022

        SDBD                                    ; 54E2   0001
        MVII    #$083F, R3                      ; 54E3   02BB 003F 0008
        B       L_5504                          ; 54E6   0200 001C

        SDBD                                    ; 54E8   0001
        MVII    #$0827, R3                      ; 54E9   02BB 0027 0008
        B       L_5504                          ; 54EC   0200 0016

        SDBD                                    ; 54EE   0001
        MVII    #$66A9, R1                      ; 54EF   02B9 00A9 0066
        B       L_5505                          ; 54F2   0200 0011

        SDBD                                    ; 54F4   0001
        MVII    #$0000, R3                      ; 54F5   02BB 0000 0000
        B       L_5504                          ; 54F8   0200 000A

        SDBD                                    ; 54FA   0001
        MVII    #$0872, R3                      ; 54FB   02BB 0072 0008
        B       L_5504                          ; 54FE   0200 0004

        SDBD                                    ; 5500   0001
        MVII    #$0819, R3                      ; 5501   02BB 0019 0008
L_5504:
        PULR    R7                              ; 5504   02B7
L_5505:
        MVI     G_01D1, R3                      ; 5505   0283 01D1
        ADDR    R3,     R1                      ; 5507   00D9
        INCR    R3                              ; 5508   000B
        MVO     R3,     G_01D1                  ; 5509   0243 01D1
        MVI@    R1,     R3                      ; 550B   028B
        PULR    R7                              ; 550C   02B7
L_550D:
        SDBD                                    ; 550D   0001
        CMPI    #$6B4F, R5                      ; 550E   037D 004F 006B
        BGT     L_536A                          ; 5511   022E 01A8

        SDBD                                    ; 5513   0001
        CMPI    #$6A43, R5                      ; 5514   037D 0043 006A
        BLT     L_536A                          ; 5517   0225 01AE

        SDBD                                    ; 5519   0001
        MVII    #$0819, R2                      ; 551A   02BA 0019 0008
        MVO@    R2,     R4                      ; 551D   0262
        B       L_536D                          ; 551E   0220 01B2

L_5520:
        PSHR    R5                              ; 5520   0275
        SDBD                                    ; 5521   0001
        MVII    #$667D, R5                      ; 5522   02BD 007D 0066
        MVI     G_018B, R0                      ; 5525   0280 018B
        SLL     R0,     1                       ; 5527   0048
        ADDR    R0,     R5                      ; 5528   00C5
        SDBD                                    ; 5529   0001
        MVI@    R5,     R1                      ; 552A   02A9
        MVI     G_0189, R4                      ; 552B   0284 0189
        INCR    R4                              ; 552D   000C
        MVO     R4,     G_0189                  ; 552E   0244 0189
        MVI@    R1,     R3                      ; 5530   028B
        CMPR    R3,     R4                      ; 5531   015C
        BGT     L_5539                          ; 5532   020E 0005

        ADDR    R4,     R1                      ; 5534   00E1
        MVI@    R1,     R2                      ; 5535   028A
        MVO     R2,     .BTAB.27                ; 5536   0242 0227
        PULR    R7                              ; 5538   02B7
L_5539:
        CMPI    #$0002, R0                      ; 5539   0378 0002
        BLT     L_557C                          ; 553B   0205 003F
        BEQ     L_5552                          ; 553D   0204 0013

        CMPI    #$0006, R0                      ; 553F   0378 0006
        BEQ     L_5563                          ; 5541   0204 0020

        MVII    #$0187, R4                      ; 5543   02BC 0187
        CLRR    R1                              ; 5545   01C9
        MVO@    R1,     R4                      ; 5546   0261
        MVO@    R1,     R4                      ; 5547   0261
        MVO@    R1,     R4                      ; 5548   0261
        INCR    R1                              ; 5549   0009
        MVI@    R4,     R2                      ; 554A   02A2
        XORR    R1,     R2                      ; 554B   01CA
        DECR    R4                              ; 554C   0014
        MVO@    R2,     R4                      ; 554D   0262
        SLL     R2,     1                       ; 554E   004A
        ADDR    R2,     R1                      ; 554F   00D1
        MVO@    R1,     R4                      ; 5550   0261
        PULR    R7                              ; 5551   02B7
L_5552:
        INCR    R0                              ; 5552   0008
        SUBI    #$000B, R4                      ; 5553   033C 000B
        CMPI    #$0005, R4                      ; 5555   037C 0005
        BGE     L_5539                          ; 5557   022D 001F

        PSHR    R4                              ; 5559   0274
        MVII    #$000A, R1                      ; 555A   02B9 000A

        JSR     R5,     L_52CA                  ; 555C   0004 0150 02CA

        ADD@    R6,     R4                      ; 555F   02F4
        CLRR    R2                              ; 5560   01D2
        B       L_556E                          ; 5561   0200 000B

L_5563:
        INCR    R0                              ; 5563   0008
        SUBI    #$000B, R4                      ; 5564   033C 000B
        CMPI    #$0002, R4                      ; 5566   037C 0002
        BGE     L_5539                          ; 5568   022D 0030

        ADDI    #$0190, R4                      ; 556A   02FC 0190
        MVII    #$0001, R2                      ; 556C   02BA 0001
L_556E:
        MVI@    R4,     R1                      ; 556E   02A1
        ADDI    #$0010, R1                      ; 556F   02F9 0010
        SLL     R1,     1                       ; 5571   0049
        SLL     R1,     2                       ; 5572   004D
        XORI    #$0007, R1                      ; 5573   03F9 0007
        MVO     R1,     .BTAB.27                ; 5575   0241 0227
        MVII    #$0187, R3                      ; 5577   02BB 0187
        ADDR    R2,     R3                      ; 5579   00D3
        MVO@    R1,     R3                      ; 557A   0259
        PULR    R7                              ; 557B   02B7
L_557C:
        CLRR    R1                              ; 557C   01C9

        JSR     R5,     L_52CA                  ; 557D   0004 0150 02CA

        MVI@    R4,     R0                      ; 5580   02A0
        DECR    R0                              ; 5581   0010
        MVII    #$0007, R3                      ; 5582   02BB 0007
        MVII    #$0226, R4                      ; 5584   02BC 0226
        MVII    #$0002, R1                      ; 5586   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 5588   0004 0118 00C5

        MVII    #$00FF, R0                      ; 558B   02B8 00FF
        B       L_5539                          ; 558D   0220 0055

L_558F:
        PSHR    R5                              ; 558F   0275
        MVII    #$0002, R1                      ; 5590   02B9 0002

        JSR     R5,     L_52CA                  ; 5592   0004 0150 02CA

        SDBD                                    ; 5595   0001
        MVII    #$6730, R5                      ; 5596   02BD 0030 0067
        SDBD                                    ; 5599   0001
        MVI@    R4,     R1                      ; 559A   02A1
        DECR    R5                              ; 559B   0015
        MVII    #$000A, R0                      ; 559C   02B8 000A
        CLRR    R3                              ; 559E   01DB
L_559F:
        INCR    R5                              ; 559F   000D
        SDBD                                    ; 55A0   0001
        MVI@    R5,     R2                      ; 55A1   02AA
        CMPR    R2,     R1                      ; 55A2   0151
        BEQ     L_55B4                          ; 55A3   0204 000F

        INCR    R3                              ; 55A5   000B
        DECR    R0                              ; 55A6   0010
        BPL     L_559F                          ; 55A7   0223 0009

        ADDI    #$0004, R4                      ; 55A9   02FC 0004
        MVI@    R4,     R1                      ; 55AB   02A1
        SUBI    #$0002, R1                      ; 55AC   0339 0002
        BPL     L_55B1                          ; 55AE   0203 0001

        CLRR    R1                              ; 55B0   01C9
L_55B1:
        DECR    R4                              ; 55B1   0014
        MVO@    R1,     R4                      ; 55B2   0261
        PULR    R7                              ; 55B3   02B7
L_55B4:
        ADDI    #$0005, R4                      ; 55B4   02FC 0005
        MVO@    R3,     R4                      ; 55B6   0263
        MVII    #$0007, R1                      ; 55B7   02B9 0007
        MVO     R1,     G_0160                  ; 55B9   0241 0160
        INCR    R7                              ; 55BB   000F
L_55BC:
        PSHR    R5                              ; 55BC   0275
        CLRR    R1                              ; 55BD   01C9

        JSR     R5,     L_52CA                  ; 55BE   0004 0150 02CA

        MOVR    R4,     R1                      ; 55C1   00A1
        ADDI    #$004C, R1                      ; 55C2   02F9 004C
        MVII    #$000A, R0                      ; 55C4   02B8 000A

        JSR     R5,     .EXEC.730               ; 55C6   0004 0114 0330

        PULR    R7                              ; 55C9   02B7
L_55CA:
        PSHR    R5                              ; 55CA   0275
        CMP     G_0163, R1                      ; 55CB   0341 0163
        BNEQ    L_5647                          ; 55CD   020C 0078

        MVI     G_0160, R3                      ; 55CF   0283 0160
        CMPI    #$0003, R3                      ; 55D1   037B 0003
        BLT     L_5647                          ; 55D3   0205 0072
        BEQ     L_55E8                          ; 55D5   0204 0011

        CMPI    #$0005, R3                      ; 55D7   037B 0005
        BEQ     L_5647                          ; 55D9   0204 006C

        CMPI    #$0006, R3                      ; 55DB   037B 0006
        BEQ     L_5647                          ; 55DD   0204 0068

        MVO     R0,     G_01EC                  ; 55DF   0240 01EC
        TSTR    R0                              ; 55E1   0080
        BPL     L_55EF                          ; 55E2   0203 000B

        CLRR    R1                              ; 55E4   01C9
        MVO     R1,     G_0321                  ; 55E5   0241 0321
        PULR    R7                              ; 55E7   02B7
L_55E8:
        MVII    #$0004, R1                      ; 55E8   02B9 0004
        MVO     R1,     G_0160                  ; 55EA   0241 0160

        JSR     R5,     L_56CA                  ; 55EC   0004 0154 02CA

L_55EF:
        MVII    #$031D, R1                      ; 55EF   02B9 031D

        JSR     R5,     .EXEC.777               ; 55F1   0004 0114 0377

        ANDI    #$000F, R0                      ; 55F4   03B8 000F
        MOVR    R2,     R4                      ; 55F6   0094
        MOVR    R3,     R5                      ; 55F7   009D
        MVII    #$0018, R3                      ; 55F8   02BB 0018
        MVII    #$0040, R2                      ; 55FA   02BA 0040
        CMPI    #$0002, R0                      ; 55FC   0378 0002
        BEQ     L_5631                          ; 55FE   0204 0031
        BGT     L_5605                          ; 5600   020E 0003

        MOVR    R5,     R3                      ; 5602   00AB
        B       L_5631                          ; 5603   0200 002C

L_5605:
        CMPI    #$0006, R0                      ; 5605   0378 0006
        BGT     L_5611                          ; 5607   020E 0008
        BLT     L_560E                          ; 5609   0205 0003

        MVII    #$0010, R2                      ; 560B   02BA 0010
        INCR    R7                              ; 560D   000F
L_560E:
        MOVR    R4,     R2                      ; 560E   00A2
        B       L_5631                          ; 560F   0200 0020

L_5611:
        CMPI    #$000A, R0                      ; 5611   0378 000A
        BGT     L_5622                          ; 5613   020E 000D
        BLT     L_561D                          ; 5615   0205 0006

        MVII    #$0010, R2                      ; 5617   02BA 0010
        MVII    #$005D, R3                      ; 5619   02BB 005D
        B       L_5631                          ; 561B   0200 0014

L_561D:
        MVII    #$0010, R2                      ; 561D   02BA 0010
        MOVR    R5,     R3                      ; 561F   00AB
        B       L_5631                          ; 5620   0200 000F

L_5622:
        CMPI    #$000E, R0                      ; 5622   0378 000E
        BGT     L_5630                          ; 5624   020E 000A
        BLT     L_562C                          ; 5626   0205 0004

        MVII    #$005D, R3                      ; 5628   02BB 005D
        B       L_5631                          ; 562A   0200 0005

L_562C:
        MOVR    R4,     R2                      ; 562C   00A2
        MVII    #$005D, R3                      ; 562D   02BB 005D
        INCR    R7                              ; 562F   000F
L_5630:
        MOVR    R5,     R3                      ; 5630   00AB
L_5631:
        CMPR    R4,     R2                      ; 5631   0162
        BEQ     L_5640                          ; 5632   0204 000C

        MVI     G_0162, R4                      ; 5634   0284 0162
        CMPI    #$0004, R4                      ; 5636   037C 0004
        BEQ     L_5640                          ; 5638   0204 0006

        MVI     G_01A1, R4                      ; 563A   0284 01A1
        SUBI    #$0007, R4                      ; 563C   033C 0007
        NEGR    R4                              ; 563E   0024
        ADDR    R4,     R2                      ; 563F   00E2
L_5640:
        SWAP    R2,     1                       ; 5640   0042
        XORR    R3,     R2                      ; 5641   01DA
        MVII    #$0024, R3                      ; 5642   02BB 0024

        JSR     R5,     .EXEC.9A1               ; 5644   0004 0118 01A1

L_5647:
        PULR    R7                              ; 5647   02B7
L_5648:
        PSHR    R5                              ; 5648   0275
        TSTR    R0                              ; 5649   0080
        BEQ     L_567A                          ; 564A   0204 002E

        DECR    R0                              ; 564C   0010
        BEQ     L_5650                          ; 564D   0204 0001

        PULR    R7                              ; 564F   02B7
L_5650:
        MVI     .BTAB.06,R1                     ; 5650   0281 0206
        TSTR    R1                              ; 5652   0089
        BNEQ    L_5647                          ; 5653   022C 000D

        MVII    #$031F, R5                      ; 5655   02BD 031F
        MVII    #$0204, R4                      ; 5657   02BC 0204
        MVI@    R5,     R1                      ; 5659   02A9
        MVII    #$0200, R0                      ; 565A   02B8 0200
        SLL     R0,     2                       ; 565C   004C
        ADDR    R0,     R1                      ; 565D   00C1
        MVO@    R1,     R4                      ; 565E   0261
        MVI@    R5,     R1                      ; 565F   02A9
        ADDR    R0,     R1                      ; 5660   00C1
        MVO@    R1,     R4                      ; 5661   0261
        MVII    #$0120, R1                      ; 5662   02B9 0120
        MVO@    R1,     R4                      ; 5664   0261

        JSR     R5,     X_PLAY_SFX1             ; 5665   0004 0118 03BB

        RRC     R3,     2                       ; 5668   0077
        SLR     R0,     1                       ; 5669   0060
        SLR     R2,     2                       ; 566A   0066
        AND@    R1,     R1                      ; 566B   0389
        SWAP    R0,     1                       ; 566C   0040
        SARC    R0,     2                       ; 566D   007C
        SLL     R0,     1                       ; 566E   0048
        ADDR    R6,     R4                      ; 566F   00F4
        SAR     R0,     2                       ; 5670   006C
        SUB@    R6,     R0                      ; 5671   0330
        INCR    R3                              ; 5672   000B
        DECLE   $0001                           ; 5673   0001

        RSWD    R0                              ; 5674   0038
        MOVR    R1,     R7                      ; 5675   008F
        RSWD    R4                              ; 5676   003C
        RRC     R3,     2                       ; 5677   0077
        SLR     R2,     2                       ; 5678   0066
        SLR     R2,     2                       ; 5679   0066
L_567A:
        CLRR    R0                              ; 567A   01C0
        MVII    #$0001, R1                      ; 567B   02B9 0001
L_567D:
        MVI     G_0186, R2                      ; 567D   0282 0186
        ANDR    R1,     R2                      ; 567F   018A
        BEQ     L_568A                          ; 5680   0204 0008

        INCR    R0                              ; 5682   0008
        SLL     R1,     1                       ; 5683   0049
        CMPI    #$0002, R1                      ; 5684   0379 0002
        BGT     L_5647                          ; 5686   022E 0040
        B       L_567D                          ; 5688   0220 000C

L_568A:
        PSHR    R0                              ; 568A   0270
        CMPI    #$0002, R1                      ; 568B   0379 0002
        BEQ     L_56A5                          ; 568D   0204 0016

        MVII    #$031F, R5                      ; 568F   02BD 031F
        MVII    #$0327, R4                      ; 5691   02BC 0327
        MVI@    R5,     R1                      ; 5693   02A9
        SDBD                                    ; 5694   0001
        ANDI    #$FE00, R1                      ; 5695   03B9 0000 00FE
        SDBD                                    ; 5698   0001
        ADDI    #$0800, R1                      ; 5699   02F9 0000 0008
        MVO@    R1,     R4                      ; 569C   0261
        MVI@    R5,     R1                      ; 569D   02A9
        ADDI    #$0300, R1                      ; 569E   02F9 0300
        MVO@    R1,     R4                      ; 56A0   0261
        CLRR    R3                              ; 56A1   01DB
        MVO@    R3,     R4                      ; 56A2   0263
        B       L_56B7                          ; 56A3   0200 0012

L_56A5:
        MVII    #$031F, R5                      ; 56A5   02BD 031F
        MVII    #$0200, R4                      ; 56A7   02BC 0200
L_56A9:
        MVI@    R5,     R1                      ; 56A9   02A9
        SDBD                                    ; 56AA   0001
        ANDI    #$FE00, R1                      ; 56AB   03B9 0000 00FE
        SDBD                                    ; 56AE   0001
        ADDI    #$0800, R1                      ; 56AF   02F9 0000 0008
        MVO@    R1,     R4                      ; 56B2   0261
        MVI@    R5,     R1                      ; 56B3   02A9
        ADDI    #$0300, R1                      ; 56B4   02F9 0300
        MVO@    R1,     R4                      ; 56B6   0261
L_56B7:
        PULR    R0                              ; 56B7   02B0

        JSR     R5,     X_CLR_BIT               ; 56B8   0004 0114 02E6

        ANDR    R0,     R6                      ; 56BB   0186

L_56BC:
        JSR     R5,     X_PLAY_SFX1             ; 56BC   0004 0118 03BB

        SARC    R1,     1                       ; 56BF   0079
        BGE     L_5A79                          ; 56C0   020D 03B7

        RSWD    R4                              ; 56C2   003C
        ANDR    R3,     R0                      ; 56C3   0198
        INCR    R3                              ; 56C4   000B
        MOVR    R1,     R7                      ; 56C5   008F
        COMR    R6                              ; 56C6   001E
        RRC     R3,     2                       ; 56C7   0077
        SLR     R2,     2                       ; 56C8   0066
        SLR     R2,     2                       ; 56C9   0066
L_56CA:
        SDBD                                    ; 56CA   0001
        MVII    #$57F9, R4                      ; 56CB   02BC 00F9 0057
        MVO     R4,     G_035D                  ; 56CE   0244 035D
        MOVR    R5,     R7                      ; 56D0   00AF
        TSTR    R0                              ; 56D1   0080
        ADDR    R7,     R0                      ; 56D2   00F8
        ADDR    R7,     R0                      ; 56D3   00F8
        ADDR    R7,     R0                      ; 56D4   00F8
        TSTR    R0                              ; 56D5   0080
        DECLE   $0000,  $0000,  $0000           ; 56D6   0000 0000 0000

        ADDR    R0,     R0                      ; 56D9   00C0
        DECLE   $0000,  $0000                   ; 56DA   0000 0000
L_56DC:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56DC   0000 0000 0000 0000
        DECLE   $0000                           ; 56E0   0000

        ADDR    R7,     R7                      ; 56E1   00FF
        MOVR    R5,     R3                      ; 56E2   00AB
        ADDR    R2,     R7                      ; 56E3   00D7
        ADDR    R7,     R7                      ; 56E4   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56E5   0000 0000 0000 0000

        RSWD    R0                              ; 56E9   0038
        DECR    R0                              ; 56EA   0010
        SARC    R0,     2                       ; 56EB   007C
        RSWD    R0                              ; 56EC   0038
        SARC    R0,     2                       ; 56ED   007C
        DECR    R0                              ; 56EE   0010
        DECLE   $0000,  $0000                   ; 56EF   0000 0000

        COMR    R0                              ; 56F1   0018
        COMR    R0                              ; 56F2   0018
        COMR    R0                              ; 56F3   0018
        COMR    R0                              ; 56F4   0018
        COMR    R0                              ; 56F5   0018
        COMR    R0                              ; 56F6   0018
        RSWD    R4                              ; 56F7   003C
        NEGR    R4                              ; 56F8   0024
        DECLE   $0000                           ; 56F9   0000

        COMR    R0                              ; 56FA   0018
        NEGR    R4                              ; 56FB   0024
        SAR     R2,     2                       ; 56FC   006E
        SLR     R2,     2                       ; 56FD   0066
        ADCR    R4                              ; 56FE   002C
        SLLC    R2,     1                       ; 56FF   005A
        MOVR    R0,     R1                      ; 5700   0081
        DECLE   $0000,  $0000                   ; 5701   0000 0000

        MOVR    R3,     R4                      ; 5703   009C
        SARC    R0,     2                       ; 5704   007C
        RRC     R0,     2                       ; 5705   0074
        SAR     R2,     1                       ; 5706   006A
        ADDR    R7,     R6                      ; 5707   00FE
        ADDR    R7,     R6                      ; 5708   00FE
        DECLE   $0000,  $0000,  $0000           ; 5709   0000 0000 0000

        DECR    R0                              ; 570C   0010
        RSWD    R0                              ; 570D   0038
        RSWD    R0                              ; 570E   0038
        RSWD    R0                              ; 570F   0038
        SWAP    R0,     2                       ; 5710   0044
        MOVR    R5,     R6                      ; 5711   00AE
        ADDR    R7,     R3                      ; 5712   00FB
        MOVR    R6,     R5                      ; 5713   00B5
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5714   0000 0000 0000 0000
        DECLE   $0000                           ; 5718   0000

        INCR    R7                              ; 5719   000F
        CLRC                                    ; 571A   0006

        JSRD    R4,     G_0402                  ; 571B   0004 0006 0002

        CLRC                                    ; 571E   0006

        JSRD    R4,     G_0480                  ; 571F   0004 0006 0080

        ADDR    R0,     R0                      ; 5722   00C0
        ADDR    R4,     R0                      ; 5723   00E0
        SAR     R0,     1                       ; 5724   0068
        SARC    R0,     1                       ; 5725   0078
        ADDR    R3,     R6                      ; 5726   00DE
        ADDR    R3,     R2                      ; 5727   00DA
        ADDR    R7,     R3                      ; 5728   00FB
        DECLE   $0000,  $0001                   ; 5729   0000 0001

        DECR    R3                              ; 572B   0013
        COMR    R7                              ; 572C   001F
        DECLE   $0037,  $0037                   ; 572D   0037 0037

        SARC    R1,     2                       ; 572F   007D
        ADDR    R7,     R5                      ; 5730   00FD
        SARC    R3,     1                       ; 5731   007B
        ADCR    R2                              ; 5732   002A
        COMR    R6                              ; 5733   001E
        INCR    R0                              ; 5734   0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5735   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5739   0000 0000 0000 0000

        DECR    R0                              ; 573D   0010
        SARC    R0,     1                       ; 573E   0078
        RLC     R0,     2                       ; 573F   0054
        ADDR    R3,     R6                      ; 5740   00DE
        SWAP    R3,     1                       ; 5741   0043
        ADDR    R7,     R7                      ; 5742   00FF
        MOVR    R7,     R5                      ; 5743   00BD
        MOVR    R6,     R7                      ; 5744   00B7
        ADDR    R7,     R7                      ; 5745   00FF
        SAR     R3,     2                       ; 5746   006F
        ADDR    R7,     R5                      ; 5747   00FD
        ADDR    R7,     R1                      ; 5748   00F9
        EIS                                     ; 5749   0002
        SARC    R2,     2                       ; 574A   007E
        SWAP    R0,     1                       ; 574B   0040
        SARC    R2,     2                       ; 574C   007E
        EIS                                     ; 574D   0002
        SARC    R2,     2                       ; 574E   007E
        SWAP    R0,     1                       ; 574F   0040
        SARC    R2,     2                       ; 5750   007E
        ADDR    R6,     R0                      ; 5751   00F0
        ADDR    R6,     R0                      ; 5752   00F0
        ADDR    R6,     R0                      ; 5753   00F0
        ADDR    R6,     R0                      ; 5754   00F0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5755   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5759   0000 0000 0000 0000

        ADDR    R7,     R7                      ; 575D   00FF
        MOVR    R5,     R3                      ; 575E   00AB
        ADDR    R2,     R7                      ; 575F   00D7
        ADDR    R7,     R7                      ; 5760   00FF
        DECLE   $0000                           ; 5761   0000

        SARC    R2,     2                       ; 5762   007E
        SWAP    R2,     1                       ; 5763   0042
        SARC    R2,     2                       ; 5764   007E
        DECLE   $0000                           ; 5765   0000

        SARC    R2,     2                       ; 5766   007E
        SWAP    R2,     1                       ; 5767   0042
        SARC    R2,     2                       ; 5768   007E
        SARC    R3,     2                       ; 5769   007F
        DECLE   $0036,  $0036                   ; 576A   0036 0036

        ADCR    R7                              ; 576C   002F
        SETC                                    ; 576D   0007
        DIS                                     ; 576E   0003
        DIS                                     ; 576F   0003
        DECLE   $0001                           ; 5770   0001

        TSTR    R7                              ; 5771   00BF
        MOVR    R7,     R6                      ; 5772   00BE
        ADDR    R5,     R4                      ; 5773   00EC
        ADDR    R5,     R4                      ; 5774   00EC
        ADDR    R7,     R0                      ; 5775   00F8
        ADDR    R1,     R0                      ; 5776   00C8
        MOVR    R6,     R0                      ; 5777   00B0
        DECLE   $0000                           ; 5778   0000

        ADDR    R6,     R0                      ; 5779   00F0
        SLR     R0,     1                       ; 577A   0060
        NEGR    R0                              ; 577B   0020
        SLR     R0,     1                       ; 577C   0060
        SWAP    R0,     1                       ; 577D   0040
        SLR     R0,     1                       ; 577E   0060
        NEGR    R0                              ; 577F   0020
        SLR     R0,     1                       ; 5780   0060
        DECLE   $0000,  $0000,  $0000           ; 5781   0000 0000 0000

        COMR    R7                              ; 5784   001F

        JSRD    R4,     G_040E                  ; 5785   0004 0006 000E

        INCR    R7                              ; 5788   000F
        COMR    R7                              ; 5789   001F
        SARC    R3,     2                       ; 578A   007F
        SARC    R3,     2                       ; 578B   007F
        INCR    R6                              ; 578C   000E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 578D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 5791   0000 0000 0000

        INCR    R6                              ; 5794   000E

        JSRD    R4,     G_040E                  ; 5795   0004 0006 000E

        SLL     R3,     2                       ; 5798   004F
        SLLC    R3,     2                       ; 5799   005F
        SARC    R3,     2                       ; 579A   007F
        SARC    R3,     2                       ; 579B   007F
        INCR    R6                              ; 579C   000E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 579D   0000 0000 0000 0000

        ADDR    R0,     R0                      ; 57A1   00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57A2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57A6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57AA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 57AE   0000 0000

        COMR    R4                              ; 57B0   001C
        RSWD    R0                              ; 57B1   0038
        COMR    R4                              ; 57B2   001C
        INCR    R0                              ; 57B3   0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57B4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 57B8   0000 0000 0000

        INCR    R0                              ; 57BB   0008
        SLL     R1,     1                       ; 57BC   0049
        NEGR    R2                              ; 57BD   0022
        RRC     R0,     2                       ; 57BE   0074
        SLL     R0,     2                       ; 57BF   004C
        RSWD    R4                              ; 57C0   003C
        SARC    R2,     1                       ; 57C1   007A
        SARC    R0,     2                       ; 57C2   007C
        RSWD    R6                              ; 57C3   003E
        ADDR    R7,     R1                      ; 57C4   00F9
        SAR     R0,     2                       ; 57C5   006C
        NEGR    R4                              ; 57C6   0024
        SWAP    R0,     1                       ; 57C7   0040
        TSTR    R0                              ; 57C8   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57C9   0000 0000 0000 0000

        SWAP    R0,     1                       ; 57CD   0040
        DECR    R0                              ; 57CE   0010
        DECLE   $0000                           ; 57CF   0000

        SWAP    R0,     1                       ; 57D0   0040
        RSWD    R0                              ; 57D1   0038
        DECR    R0                              ; 57D2   0010
        EIS                                     ; 57D3   0002
        SWAP    R0,     1                       ; 57D4   0040
        INCR    R0                              ; 57D5   0008
        DECLE   $0000                           ; 57D6   0000

        DECR    R0                              ; 57D7   0010
        DECLE   $0001,  $0000,  $0000,  $0000   ; 57D8   0001 0000 0000 0000
        DECLE   $0000                           ; 57DC   0000

        SWAP    R2,     1                       ; 57DD   0042
        NEGR    R4                              ; 57DE   0024
        RSWD    R0                              ; 57DF   0038
        SWAP    R0,     2                       ; 57E0   0044
        MOVR    R0,     R4                      ; 57E1   0084
        SWAP    R0,     2                       ; 57E2   0044
        ADCR    R0                              ; 57E3   0028
        RLC     R0,     2                       ; 57E4   0054
        RLC     R2,     1                       ; 57E5   0052
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57E6   0000 0000 0000 0000
        DECLE   $0000                           ; 57EA   0000

        ADCR    R1                              ; 57EB   0029
        EIS                                     ; 57EC   0002
        MOVR    R3,     R2                      ; 57ED   009A
        DECR    R0                              ; 57EE   0010
        SWAP    R0,     1                       ; 57EF   0040
        SWAP    R2,     1                       ; 57F0   0042
        TSTR    R0                              ; 57F1   0080
        SWAP    R0,     1                       ; 57F2   0040
        EIS                                     ; 57F3   0002
        DECLE   $0000                           ; 57F4   0000

        RLC     R0,     1                       ; 57F5   0050
        ADCR    R2                              ; 57F6   002A
        SWAP    R0,     1                       ; 57F7   0040
        MOVR    R0,     R1                      ; 57F8   0081
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57F9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57FD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5801   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5805   0000 0000 0000 0000
        DECLE   $0000                           ; 5809   0000

        TSTR    R0                              ; 580A   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 580B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 580F   0000 0000 0000 0000
        DECLE   $0000                           ; 5813   0000

        RSWD    R7                              ; 5814   003F
        RSWD    R4                              ; 5815   003C
        RSWD    R4                              ; 5816   003C
        SARC    R2,     2                       ; 5817   007E
        SARC    R2,     2                       ; 5818   007E
        SARC    R2,     2                       ; 5819   007E
        RSWD    R4                              ; 581A   003C
        RSWD    R4                              ; 581B   003C
        ADDR    R7,     R4                      ; 581C   00FC
        DECLE   $0000,  $0000,  $0000,  $0000   ; 581D   0000 0000 0000 0000

        DIS                                     ; 5821   0003
        SETC                                    ; 5822   0007
        INCR    R6                              ; 5823   000E
        RSWD    R4                              ; 5824   003C
        RSWD    R4                              ; 5825   003C
        RSWD    R4                              ; 5826   003C
        SARC    R2,     2                       ; 5827   007E
        SARC    R2,     2                       ; 5828   007E
        SARC    R2,     2                       ; 5829   007E
        RSWD    R4                              ; 582A   003C
        RSWD    R4                              ; 582B   003C
        RSWD    R4                              ; 582C   003C
        RRC     R0,     1                       ; 582D   0070
        ADDR    R4,     R0                      ; 582E   00E0
        ADDR    R0,     R0                      ; 582F   00C0
        DECLE   $0000                           ; 5830   0000

        COMR    R0                              ; 5831   0018
        COMR    R0                              ; 5832   0018
        COMR    R0                              ; 5833   0018
        RSWD    R4                              ; 5834   003C
        RSWD    R4                              ; 5835   003C
        RSWD    R4                              ; 5836   003C
        SARC    R2,     2                       ; 5837   007E
        SARC    R2,     2                       ; 5838   007E
        SARC    R2,     2                       ; 5839   007E
        RSWD    R4                              ; 583A   003C
        RSWD    R4                              ; 583B   003C
        RSWD    R4                              ; 583C   003C
        COMR    R0                              ; 583D   0018
        COMR    R0                              ; 583E   0018
        COMR    R0                              ; 583F   0018
        DECLE   $0000                           ; 5840   0000

        ADDR    R0,     R0                      ; 5841   00C0
        ADDR    R4,     R0                      ; 5842   00E0
        RRC     R0,     1                       ; 5843   0070
        RSWD    R4                              ; 5844   003C
        RSWD    R4                              ; 5845   003C
        RSWD    R4                              ; 5846   003C
        SARC    R2,     2                       ; 5847   007E
        SARC    R2,     2                       ; 5848   007E
        SARC    R2,     2                       ; 5849   007E
        RSWD    R4                              ; 584A   003C
        RSWD    R4                              ; 584B   003C
        RSWD    R4                              ; 584C   003C
        INCR    R6                              ; 584D   000E
        SETC                                    ; 584E   0007
        DIS                                     ; 584F   0003
        DECLE   $0000                           ; 5850   0000

        COMR    R0                              ; 5851   0018
        RSWD    R4                              ; 5852   003C
        SARC    R2,     2                       ; 5853   007E
        SARC    R2,     2                       ; 5854   007E
        ADDR    R2,     R7                      ; 5855   00D7
        SAR     R3,     2                       ; 5856   006F
        ADDR    R7,     R7                      ; 5857   00FF
        MOVR    R5,     R2                      ; 5858   00AA
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5859   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 585D   0000 0000 0000 0000

        ADDR    R7,     R7                      ; 5861   00FF
        ADDR    R7,     R7                      ; 5862   00FF
        MOVR    R0,     R1                      ; 5863   0081
        TSTR    R1                              ; 5864   0089
        MOVR    R7,     R5                      ; 5865   00BD
        MOVR    R4,     R5                      ; 5866   00A5
        MOVR    R4,     R1                      ; 5867   00A1
        MOVR    R4,     R1                      ; 5868   00A1
        MOVR    R7,     R5                      ; 5869   00BD
        MOVR    R0,     R5                      ; 586A   0085
        MOVR    R0,     R5                      ; 586B   0085
        MOVR    R4,     R5                      ; 586C   00A5
        MOVR    R7,     R5                      ; 586D   00BD
        TSTR    R1                              ; 586E   0089
        MOVR    R0,     R1                      ; 586F   0081
        ADDR    R7,     R7                      ; 5870   00FF
        DECLE   $0000,  $0000                   ; 5871   0000 0000

        SARC    R2,     2                       ; 5873   007E
        RRC     R2,     2                       ; 5874   0076
        SWAP    R2,     1                       ; 5875   0042
        SLLC    R2,     1                       ; 5876   005A
        SLLC    R1,     2                       ; 5877   005D
        SLLC    R1,     2                       ; 5878   005D
        SWAP    R2,     1                       ; 5879   0042
        SARC    R2,     1                       ; 587A   007A
        SARC    R2,     1                       ; 587B   007A
        SLLC    R2,     1                       ; 587C   005A
        SWAP    R2,     1                       ; 587D   0042
        RRC     R2,     2                       ; 587E   0076
        SARC    R2,     2                       ; 587F   007E
        SARC    R3,     1                       ; 5880   007B
        SLR     R0,     2                       ; 5881   0064
        DECLE   $0000,  $0000,  $0001           ; 5882   0000 0000 0001

        GSWD    R2                              ; 5885   0032
        EIS                                     ; 5886   0002
        MOVR    R1,     R5                      ; 5887   008D
        SLR     R0,     2                       ; 5888   0064
        SARC    R3,     1                       ; 5889   007B
        SLR     R0,     2                       ; 588A   0064
        DECLE   $0000,  $0000,  $0001           ; 588B   0000 0000 0001

        NOP                                     ; 588E   0034
        EIS                                     ; 588F   0002
        MOVR    R1,     R5                      ; 5890   008D
        SLR     R0,     2                       ; 5891   0064
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5892   0000 0000 0000 0000
        DECLE   $0001                           ; 5896   0001

        COMR    R2                              ; 5897   001A
        DECLE   $0000,  $0000,  $0000           ; 5898   0000 0000 0000

        SWAP    R3,     1                       ; 589B   0043
        COMR    R0                              ; 589C   0018
        MOVR    R7,     R3                      ; 589D   00BB
        SLLC    R0,     1                       ; 589E   0058
        DECLE   $0000,  $0000,  $0000,  $0000   ; 589F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58A3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58A7   0000 0000 0000 0000

        MOVR    R4,     R3                      ; 58AB   00A3
        COMR    R0                              ; 58AC   0018
        ADDR    R0,     R6                      ; 58AD   00C6
        SLLC    R0,     1                       ; 58AE   0058
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58AF   0000 0000 0000 0000
        DECLE   $0000                           ; 58B3   0000

        MOVR    R0,     R1                      ; 58B4   0081
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58B5   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 58B9   0000 0000

        ADDR    R7,     R2                      ; 58BB   00FA
        SLR     R0,     2                       ; 58BC   0064
        MOVR    R3,     R1                      ; 58BD   0099
        SLR     R3,     1                       ; 58BE   0063
        DECLE   $0001                           ; 58BF   0001

        GSWD    R0                              ; 58C0   0030
        DIS                                     ; 58C1   0003
        ADDR    R7,     R2                      ; 58C2   00FA
        SLR     R0,     2                       ; 58C3   0064
        ADDR    R7,     R2                      ; 58C4   00FA
        SLR     R0,     2                       ; 58C5   0064
        MOVR    R3,     R4                      ; 58C6   009C
        SLR     R0,     2                       ; 58C7   0064
        MOVR    R3,     R4                      ; 58C8   009C
        SLR     R0,     2                       ; 58C9   0064
        DECLE   $0001                           ; 58CA   0001

        NEGR    R7                              ; 58CB   0027
        DIS                                     ; 58CC   0003
        MOVR    R3,     R4                      ; 58CD   009C
        SLR     R0,     2                       ; 58CE   0064
        MOVR    R3,     R4                      ; 58CF   009C
        SLR     R0,     2                       ; 58D0   0064
        MOVR    R3,     R4                      ; 58D1   009C
        CMPR    R4,     R4                      ; 58D2   0164
        SWAP    R2,     1                       ; 58D3   0042
        COMR    R0                              ; 58D4   0018
        TSTR    R0                              ; 58D5   0080
        SLLC    R0,     1                       ; 58D6   0058
        DECLE   $0000                           ; 58D7   0000

        MOVR    R3,     R0                      ; 58D8   0098
        DECLE   $0000                           ; 58D9   0000

        RLC     R0,     1                       ; 58DA   0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58DB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58DF   0000 0000 0000 0000

        SWAP    R3,     2                       ; 58E3   0047
        COMR    R0                              ; 58E4   0018
        TSTR    R1                              ; 58E5   0089
        SLLC    R0,     1                       ; 58E6   0058
        DECLE   $0000                           ; 58E7   0000

        MOVR    R3,     R0                      ; 58E8   0098
        DECLE   $0000                           ; 58E9   0000

        RLC     R0,     1                       ; 58EA   0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58EB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58EF   0000 0000 0000 0000

        SWAP    R2,     1                       ; 58F3   0042
        COMR    R0                              ; 58F4   0018
        DIS                                     ; 58F5   0003
        SLLC    R1,     1                       ; 58F6   0059
        DECLE   $0000                           ; 58F7   0000

        RSWD    R0                              ; 58F8   0038
        DECLE   $0000                           ; 58F9   0000

        SWAP    R0,     1                       ; 58FA   0040
        DECLE   $0000,  $0000,  $0000           ; 58FB   0000 0000 0000

        RSWD    R7                              ; 58FE   003F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58FF   0000 0000 0000 0000
L_5903:
        SAR     R1,     2                       ; 5903   006D
        SLR     R0,     2                       ; 5904   0064
        ADDR    R1,     R4                      ; 5905   00CC
        SLR     R3,     1                       ; 5906   0063

        JSR     R4,     G_2803                  ; 5907   0004 0028 0003

        ADDR    R5,     R0                      ; 590A   00E8
        SLR     R0,     2                       ; 590B   0064
        ADDR    R5,     R0                      ; 590C   00E8
        SLR     R0,     2                       ; 590D   0064
        ADDR    R5,     R0                      ; 590E   00E8
        CMPR    R4,     R4                      ; 590F   0164
        MOVR    R0,     R1                      ; 5910   0081
        COMR    R0                              ; 5911   0018
        NEGR    R0                              ; 5912   0020
        SLLC    R1,     1                       ; 5913   0059
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5914   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5918   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 591C   0000 0000 0000 0000

        SAR     R1,     2                       ; 5920   006D
        SLR     R0,     2                       ; 5921   0064
        ADDR    R6,     R5                      ; 5922   00F5
        SLR     R0,     2                       ; 5923   0064
        DECLE   $0001                           ; 5924   0001

        DIS                                     ; 5925   0003
        DIS                                     ; 5926   0003
        ADDR    R6,     R5                      ; 5927   00F5
        SLR     R0,     2                       ; 5928   0064
        ADDR    R6,     R5                      ; 5929   00F5
        SLR     R0,     2                       ; 592A   0064
        MOVR    R0,     R7                      ; 592B   0087
        COMR    R0                              ; 592C   0018
        RSWD    R3                              ; 592D   003B
        SLLC    R1,     1                       ; 592E   0059
        DECLE   $0000,  $0000,  $0000,  $0000   ; 592F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5933   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5937   0000 0000 0000 0000

        ADDR    R6,     R1                      ; 593B   00F1
        SLR     R0,     2                       ; 593C   0064
        SAR     R1,     2                       ; 593D   006D
        SLR     R0,     2                       ; 593E   0064
        DECLE   $0001,  $0004                   ; 593F   0001 0004

        DIS                                     ; 5941   0003
        ADDR    R6,     R1                      ; 5942   00F1
        SLR     R0,     2                       ; 5943   0064
        ADDR    R6,     R1                      ; 5944   00F1
        SLR     R0,     2                       ; 5945   0064
        MOVR    R0,     R7                      ; 5946   0087
        COMR    R0                              ; 5947   0018
        RLC     R2,     2                       ; 5948   0056
        SLLC    R1,     1                       ; 5949   0059
        DECLE   $0000,  $0000,  $0000,  $0000   ; 594A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 594E   0000 0000 0000 0000
        DECLE   $0000                           ; 5952   0000
L_5953:
        DECLE   $0000,  $0000,  $0000           ; 5953   0000 0000 0000

        SAR     R1,     2                       ; 5956   006D
        SLR     R0,     2                       ; 5957   0064
        DECLE   $0001                           ; 5958   0001

        SLR     R0,     2                       ; 5959   0064
        DECLE   $0001                           ; 595A   0001

        SETC                                    ; 595B   0007
        DIS                                     ; 595C   0003
        ADDR    R5,     R3                      ; 595D   00EB
        SLR     R0,     2                       ; 595E   0064
        ADDR    R5,     R3                      ; 595F   00EB
        SLR     R0,     2                       ; 5960   0064
        MOVR    R4,     R7                      ; 5961   00A7
        COMR    R0                              ; 5962   0018
        RRC     R1,     1                       ; 5963   0071
        SLLC    R1,     1                       ; 5964   0059
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5965   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5969   0000 0000 0000 0000

        DECR    R4                              ; 596D   0014
        DECLE   $0000,  $0000,  $0000           ; 596E   0000 0000 0000

        ADDR    R0,     R3                      ; 5971   00C3
        SLR     R0,     2                       ; 5972   0064
        ADDR    R0,     R3                      ; 5973   00C3
        SLR     R0,     2                       ; 5974   0064
        DECLE   $0001                           ; 5975   0001

        NEGR    R7                              ; 5976   0027
        DECLE   $0001                           ; 5977   0001

        ADDR    R0,     R3                      ; 5978   00C3
        SLR     R0,     2                       ; 5979   0064
        ADDR    R0,     R3                      ; 597A   00C3
        SLR     R0,     2                       ; 597B   0064
        SWAP    R3,     2                       ; 597C   0047
        RSWD    R0                              ; 597D   0038
        MOVR    R3,     R4                      ; 597E   009C
        SLLC    R1,     1                       ; 597F   0059
        DECLE   $0000                           ; 5980   0000

        COMR    R0                              ; 5981   0018
        DECLE   $0000                           ; 5982   0000

        COMR    R0                              ; 5983   0018
        DECLE   $0000,  $0000,  $0000           ; 5984   0000 0000 0000

        RSWD    R7                              ; 5987   003F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5988   0000 0000 0000 0000

        SETC                                    ; 598C   0007
        RSWD    R0                              ; 598D   0038
        TSTR    R2                              ; 598E   0092
        SLLC    R0,     1                       ; 598F   0058
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5990   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5994   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5998   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 599C   0000 0000

        SLL     R2,     1                       ; 599E   004A
        SLR     R1,     2                       ; 599F   0065
        EIS                                     ; 59A0   0002
        DECR    R6                              ; 59A1   0016
        INCR    R5                              ; 59A2   000D
        TSTR    R4                              ; 59A3   00A4
        SLR     R1,     2                       ; 59A4   0065
        MVO@    R6,     R1                      ; 59A5   024E
        SLR     R1,     2                       ; 59A6   0065
        MVO@    R2,     R2                      ; 59A7   0252
        CMPR    R4,     R5                      ; 59A8   0165
        CMPR    R2,     R6                      ; 59A9   0156
        SLR     R1,     2                       ; 59AA   0065
        CMPR    R3,     R2                      ; 59AB   015A
        CMPR    R4,     R5                      ; 59AC   0165
        CMP@    R3,     R6                      ; 59AD   035E
        SLR     R1,     2                       ; 59AE   0065
        CMP@    R4,     R2                      ; 59AF   0362
        CMPR    R4,     R5                      ; 59B0   0165
        SWAP    R2,     1                       ; 59B1   0042
        RSWD    R0                              ; 59B2   0038
        ADDR    R2,     R1                      ; 59B3   00D1
        SLLC    R1,     1                       ; 59B4   0059
        DECLE   $0000                           ; 59B5   0000

        RLC     R0,     1                       ; 59B6   0050
        DECLE   $0000                           ; 59B7   0000

        GSWD    R0                              ; 59B8   0030
        DECLE   $0000,  $0000,  $0000,  $0001   ; 59B9   0000 0000 0000 0001

        INCR    R7                              ; 59BD   000F
        DECLE   $0000,  $0000,  $0000           ; 59BE   0000 0000 0000

        SWAP    R3,     1                       ; 59C1   0043
        RSWD    R0                              ; 59C2   0038
        ADDR    R3,     R0                      ; 59C3   00D8
        SLLC    R1,     1                       ; 59C4   0059
        DECLE   $0000                           ; 59C5   0000

        RLC     R0,     1                       ; 59C6   0050
        DECLE   $0000                           ; 59C7   0000

        GSWD    R0                              ; 59C8   0030
        DECLE   $0000,  $0000,  $0000,  $0001   ; 59C9   0000 0000 0000 0001

        INCR    R7                              ; 59CD   000F
        DECLE   $0000,  $0000,  $0000           ; 59CE   0000 0000 0000

        ADDR    R3,     R0                      ; 59D1   00D8
        SLR     R0,     2                       ; 59D2   0064
        ADDR    R3,     R0                      ; 59D3   00D8
        SLR     R0,     2                       ; 59D4   0064
        DIS                                     ; 59D5   0003
        COMR    R3                              ; 59D6   001B
        DECLE   $0000                           ; 59D7   0000

        ADDR    R3,     R0                      ; 59D8   00D8
        SLR     R0,     2                       ; 59D9   0064
        ADDR    R3,     R0                      ; 59DA   00D8
        SLR     R0,     2                       ; 59DB   0064
        DIS                                     ; 59DC   0003
        NEGR    R1                              ; 59DD   0021
        DECLE   $0000,  $0000,  $0000           ; 59DE   0000 0000 0000

        PSHR    R5                              ; 59E1   0275
        MVI     G_01E5, R1                      ; 59E2   0281 01E5
        TSTR    R1                              ; 59E4   0089
        BEQ     L_59EA                          ; 59E5   0204 0003

        MVO     R1,     .STIC.VIDEN             ; 59E7   0241 0020
        PULR    R7                              ; 59E9   02B7
L_59EA:
        DECR    R1                              ; 59EA   0011
        MVO     R1,     G_01E5                  ; 59EB   0241 01E5
        MVI     G_015D, R1                      ; 59ED   0281 015D
        MVO     R1,     .STIC.BORD              ; 59EF   0241 002C
        MVI     G_015E, R1                      ; 59F1   0281 015E
        MVO     R1,     .STIC.CS.0              ; 59F3   0241 0028
        SARC    R1,     1                       ; 59F5   0079
        BNC     L_59FC                          ; 59F6   0209 0004

        MVI     .STIC.MODE,R1                   ; 59F8   0281 0021
        ADDI    #$0006, R7                      ; 59FA   02FF 0006
L_59FC:
        MVO     R1,     .STIC.MODE              ; 59FC   0241 0021
        MVII    #$0003, R3                      ; 59FE   02BB 0003
        MVO     R3,     .STIC.EDGE              ; 5A00   0243 0032
        MVI     G_0102, R1                      ; 5A02   0281 0102
        SWAP    R1,     1                       ; 5A04   0041
        SWAP    R1,     1                       ; 5A05   0041
        BEQ     L_5BD1                          ; 5A06   0204 01C9
        BMI     L_5BD1                          ; 5A08   020B 01C7

        MVI     G_0160, R2                      ; 5A0A   0282 0160
        CMPI    #$0003, R2                      ; 5A0C   037A 0003
        BLT     L_5BD1                          ; 5A0E   0205 01C1
        BGT     L_5A18                          ; 5A10   020E 0006

        MVII    #$0007, R1                      ; 5A12   02B9 0007
        MVO     R1,     .STIC.HDLY              ; 5A14   0241 0030
        B       L_5BD1                          ; 5A16   0200 01B9

L_5A18:
        CMPI    #$0007, R2                      ; 5A18   037A 0007
        BGE     L_5A20                          ; 5A1A   020D 0004

        CMPI    #$0004, R2                      ; 5A1C   037A 0004
        BGT     L_5BD1                          ; 5A1E   020E 01B1

L_5A20:
        CMPI    #$0004, R1                      ; 5A20   0379 0004
        BEQ     L_5A84                          ; 5A22   0204 0060
        BGT     L_5BD1                          ; 5A24   020E 01AB

        CMPI    #$0003, R1                      ; 5A26   0379 0003
        BEQ     L_5A30                          ; 5A28   0204 0006

        CMPI    #$0002, R1                      ; 5A2A   0379 0002
        BEQ     L_5AC4                          ; 5A2C   0204 0096
        BLT     L_5AFE                          ; 5A2E   0205 00CE

L_5A30:
        MVI     .BTAB.08,R1                     ; 5A30   0281 0208
        TSTR    R1                              ; 5A32   0089
        BEQ     L_5A60                          ; 5A33   0204 002B

        PSHR    R1                              ; 5A35   0271
        SLL     R1,     1                       ; 5A36   0049
        SLL     R1,     2                       ; 5A37   004D
        ADDI    #$031F, R1                      ; 5A38   02F9 031F
        DECR    R1                              ; 5A3A   0011
        SDBD                                    ; 5A3B   0001
        MVII    #$5971, R2                      ; 5A3C   02BA 0071 0059
        CMP@    R1,     R2                      ; 5A3F   034A
        BEQ     L_5A47                          ; 5A40   0204 0005

        JSR     R5,     L_52BB                  ; 5A42   0004 0150 02BB

        B       L_5A60                          ; 5A45   0200 0019

L_5A47:
        INCR    R1                              ; 5A47   0009
        PULR    R2                              ; 5A48   02B2
        MVI@    R1,     R3                      ; 5A49   028B
        SUBI    #$0100, R3                      ; 5A4A   033B 0100
        MVO@    R3,     R1                      ; 5A4C   024B
        SWAP    R3,     1                       ; 5A4D   0043
        ANDI    #$00FF, R3                      ; 5A4E   03BB 00FF
        XORI    #$0300, R3                      ; 5A50   03FB 0300
        MVO@    R3,     R2                      ; 5A52   0253
        ADDI    #$0008, R2                      ; 5A53   02FA 0008
        INCR    R1                              ; 5A55   0009
        MVI@    R1,     R3                      ; 5A56   028B
        SUBI    #$0200, R3                      ; 5A57   033B 0200
        MVO@    R3,     R1                      ; 5A59   024B
        SWAP    R3,     1                       ; 5A5A   0043
        ANDI    #$007F, R3                      ; 5A5B   03BB 007F
        XORI    #$0100, R3                      ; 5A5D   03FB 0100
        MVO@    R3,     R2                      ; 5A5F   0253
L_5A60:
        MVI     G_0327, R1                      ; 5A60   0281 0327
        SDBD                                    ; 5A62   0001
        ADDI    #$0400, R1                      ; 5A63   02F9 0000 0004
        MVO     R1,     G_0327                  ; 5A66   0241 0327
        SWAP    R1,     1                       ; 5A68   0041
        ANDI    #$00FF, R1                      ; 5A69   03B9 00FF
        SDBD                                    ; 5A6B   0001
        XORI    #$0700, R1                      ; 5A6C   03F9 0000 0007
        MVO     R1,     .STIC.X.1               ; 5A6F   0241 0001
        MVI     G_0328, R1                      ; 5A71   0281 0328
        SWAP    R1,     1                       ; 5A73   0041
        ANDI    #$007F, R1                      ; 5A74   03B9 007F
        XORI    #$0100, R1                      ; 5A76   03F9 0100
        MVO     R1,     .STIC.Y.1               ; 5A78   0241 0009
        SDBD                                    ; 5A7A   0001
        MVII    #$0997, R1                      ; 5A7B   02B9 0097 0009
        MVO     R1,     .STIC.A.1               ; 5A7E   0241 0011
        MVII    #$0006, R1                      ; 5A80   02B9 0006
        B       L_5B1A                          ; 5A82   0200 0096

L_5A84:
        MVI     .BTAB.08,R2                     ; 5A84   0282 0208
        TSTR    R2                              ; 5A86   0092
        BEQ     L_5AA0                          ; 5A87   0204 0017

        MVI     .BTAB.0A,R3                     ; 5A89   0283 020A
        DECR    R3                              ; 5A8B   0013
        MVO     R3,     .BTAB.0A                ; 5A8C   0243 020A
        ANDI    #$00FF, R3                      ; 5A8E   03BB 00FF
        XORI    #$0300, R3                      ; 5A90   03FB 0300
        MVO@    R3,     R2                      ; 5A92   0253
        ADDI    #$0008, R2                      ; 5A93   02FA 0008
        MVI     .BTAB.0B,R3                     ; 5A95   0283 020B
        SUBI    #$0002, R3                      ; 5A97   033B 0002
        MVO     R3,     .BTAB.0B                ; 5A99   0243 020B
        ANDI    #$007F, R3                      ; 5A9B   03BB 007F
        XORI    #$0100, R3                      ; 5A9D   03FB 0100
L_5A9F:
        MVO@    R3,     R2                      ; 5A9F   0253
L_5AA0:
        MVI     .BTAB.00,R1                     ; 5AA0   0281 0200
        SDBD                                    ; 5AA2   0001
        ADDI    #$0400, R1                      ; 5AA3   02F9 0000 0004
        MVO     R1,     .BTAB.00                ; 5AA6   0241 0200
        SWAP    R1,     1                       ; 5AA8   0041
        ANDI    #$00FF, R1                      ; 5AA9   03B9 00FF
        SDBD                                    ; 5AAB   0001
        XORI    #$0700, R1                      ; 5AAC   03F9 0000 0007
        MVO     R1,     .STIC.X.1               ; 5AAF   0241 0001
        MVI     .BTAB.01,R1                     ; 5AB1   0281 0201
        SWAP    R1,     1                       ; 5AB3   0041
        ANDI    #$007F, R1                      ; 5AB4   03B9 007F
        XORI    #$0100, R1                      ; 5AB6   03F9 0100
        MVO     R1,     .STIC.Y.1               ; 5AB8   0241 0009
        SDBD                                    ; 5ABA   0001
        MVII    #$0997, R1                      ; 5ABB   02B9 0097 0009
        MVO     R1,     .STIC.A.1               ; 5ABE   0241 0011
        MVII    #$0002, R1                      ; 5AC0   02B9 0002
        B       L_5B1A                          ; 5AC2   0200 0056

L_5AC4:
        MVI     .BTAB.08,R2                     ; 5AC4   0282 0208
        TSTR    R2                              ; 5AC6   0092
        BEQ     L_5AE0                          ; 5AC7   0204 0017

        MVI     .BTAB.0C,R3                     ; 5AC9   0283 020C
        DECR    R3                              ; 5ACB   0013
        MVO     R3,     .BTAB.0C                ; 5ACC   0243 020C
        ANDI    #$00FF, R3                      ; 5ACE   03BB 00FF
        XORI    #$0300, R3                      ; 5AD0   03FB 0300
        MVO@    R3,     R2                      ; 5AD2   0253
        ADDI    #$0008, R2                      ; 5AD3   02FA 0008
        MVI     .BTAB.0D,R3                     ; 5AD5   0283 020D
        SUBI    #$0002, R3                      ; 5AD7   033B 0002
        MVO     R3,     .BTAB.0D                ; 5AD9   0243 020D
        ANDI    #$007F, R3                      ; 5ADB   03BB 007F
        XORI    #$0100, R3                      ; 5ADD   03FB 0100
L_5ADF:
        MVO@    R3,     R2                      ; 5ADF   0253
L_5AE0:
        MVI     .BTAB.04,R1                     ; 5AE0   0281 0204
        SWAP    R1,     1                       ; 5AE2   0041
        ANDI    #$00FF, R1                      ; 5AE3   03B9 00FF
        XORI    #$0300, R1                      ; 5AE5   03F9 0300
        MVO     R1,     .STIC.X.1               ; 5AE7   0241 0001
        MVI     .BTAB.05,R1                     ; 5AE9   0281 0205
        ADD     .BTAB.06,R1                     ; 5AEB   02C1 0206
        MVO     R1,     .BTAB.05                ; 5AED   0241 0205
        SWAP    R1,     1                       ; 5AEF   0041
        ANDI    #$007F, R1                      ; 5AF0   03B9 007F
        MVO     R1,     .STIC.Y.1               ; 5AF2   0241 0009
        SDBD                                    ; 5AF4   0001
L_5AF5:
        MVII    #$0807, R1                      ; 5AF5   02B9 0007 0008
        MVO     R1,     .STIC.A.1               ; 5AF8   0241 0011
        MVII    #$0004, R1                      ; 5AFA   02B9 0004
        B       L_5B1A                          ; 5AFC   0200 001C

L_5AFE:
        MVI     .BTAB.04,R1                     ; 5AFE   0281 0204
        SWAP    R1,     1                       ; 5B00   0041
        ANDI    #$00FF, R1                      ; 5B01   03B9 00FF
        XORI    #$0300, R1                      ; 5B03   03F9 0300
        MVO     R1,     .STIC.X.1               ; 5B05   0241 0001
        MVI     .BTAB.05,R1                     ; 5B07   0281 0205
        ADD     .BTAB.06,R1                     ; 5B09   02C1 0206
        MVO     R1,     .BTAB.05                ; 5B0B   0241 0205
        SWAP    R1,     1                       ; 5B0D   0041
        ANDI    #$007F, R1                      ; 5B0E   03B9 007F
        MVO     R1,     .STIC.Y.1               ; 5B10   0241 0009
        SDBD                                    ; 5B12   0001
        MVII    #$0807, R1                      ; 5B13   02B9 0007 0008
        MVO     R1,     .STIC.A.1               ; 5B16   0241 0011
        MVII    #$0002, R1                      ; 5B18   02B9 0002
L_5B1A:
        MVO     R1,     G_018C                  ; 5B1A   0241 018C
        MVI     .STIC.C.1,R1                    ; 5B1C   0281 0019
        SLR     R1,     2                       ; 5B1E   0065
        MVO     R1,     G_018D                  ; 5B1F   0241 018D
        CLRR    R1                              ; 5B21   01C9
        MVO     R1,     .STIC.C.1               ; 5B22   0241 0019
L_5B24:
        MVO     R1,     G_0108                  ; 5B24   0241 0108
        MVI     G_0160, R2                      ; 5B26   0282 0160
        CMPI    #$0008, R2                      ; 5B28   037A 0008
        BGT     L_5BD1                          ; 5B2A   020E 00A5
        BEQ     L_5BCD                          ; 5B2C   0204 009F

        CMPI    #$0007, R2                      ; 5B2E   037A 0007
        BEQ     L_5BD1                          ; 5B30   0204 009F

        MVI     G_0184, R1                      ; 5B32   0281 0184
        DECR    R1                              ; 5B34   0011
        BMI     L_5B3B                          ; 5B35   020B 0004

        MVO     R1,     G_0184                  ; 5B37   0241 0184
        B       L_5BD1                          ; 5B39   0200 0096

L_5B3B:
        MVI     G_0185, R1                      ; 5B3B   0281 0185
        MVO     R1,     G_0184                  ; 5B3D   0241 0184
        MVI     .STIC.HDLY,R1                   ; 5B3F   0281 0030
        ANDI    #$0007, R1                      ; 5B41   03B9 0007
        DECR    R1                              ; 5B43   0011
        BMI     L_5B6A                          ; 5B44   020B 0024

        MVO     R1,     G_01A1                  ; 5B46   0241 01A1
        MVO     R1,     .STIC.HDLY              ; 5B48   0241 0030
        CLRR    R3                              ; 5B4A   01DB
        MVI     G_019A, R0                      ; 5B4B   0280 019A
        MVII    #$031F, R2                      ; 5B4D   02BA 031F
L_5B4F:
        MVII    #$0008, R5                      ; 5B4F   02BD 0008
        MVII    #$0100, R4                      ; 5B51   02BC 0100
L_5B53:
        MVI@    R3,     R1                      ; 5B53   0299
        INCR    R1                              ; 5B54   0009
        MVO@    R1,     R3                      ; 5B55   0259
        INCR    R3                              ; 5B56   000B
        MVI@    R2,     R1                      ; 5B57   0291
        ADDR    R4,     R1                      ; 5B58   00E1
        MVO@    R1,     R2                      ; 5B59   0251
        ADDR    R5,     R2                      ; 5B5A   00EA
        DECR    R0                              ; 5B5B   0010
        BPL     L_5B53                          ; 5B5C   0223 000A

        MVI     .BTAB.00,R1                     ; 5B5E   0281 0200
        ADDR    R4,     R1                      ; 5B60   00E1
        MVO     R1,     .BTAB.00                ; 5B61   0241 0200
        MVI     .BTAB.04,R1                     ; 5B63   0281 0204
        ADDR    R4,     R1                      ; 5B65   00E1
        MVO     R1,     .BTAB.04                ; 5B66   0241 0204
        B       L_5BD1                          ; 5B68   0200 0067

L_5B6A:
        CLRR    R3                              ; 5B6A   01DB
        MVII    #$0007, R0                      ; 5B6B   02B8 0007
        MVO     R0,     .STIC.HDLY              ; 5B6D   0240 0030
        MVO     R0,     G_01A1                  ; 5B6F   0240 01A1
        MVI     G_019A, R0                      ; 5B71   0280 019A
        MVII    #$031F, R2                      ; 5B73   02BA 031F
        MVII    #$0008, R5                      ; 5B75   02BD 0008
        SDBD                                    ; 5B77   0001
        MVII    #$0700, R4                      ; 5B78   02BC 0000 0007
L_5B7B:
        MVI@    R3,     R1                      ; 5B7B   0299
        SUBI    #$0007, R1                      ; 5B7C   0339 0007
        MVO@    R1,     R3                      ; 5B7E   0259
        INCR    R3                              ; 5B7F   000B
        MVI@    R2,     R1                      ; 5B80   0291
        SUBR    R4,     R1                      ; 5B81   0121
        MVO@    R1,     R2                      ; 5B82   0251
        ADDR    R5,     R2                      ; 5B83   00EA
        DECR    R0                              ; 5B84   0010
        BPL     L_5B7B                          ; 5B85   0223 000B

        MVI     .BTAB.00,R1                     ; 5B87   0281 0200
        SDBD                                    ; 5B89   0001
        MVII    #$0700, R4                      ; 5B8A   02BC 0000 0007
        SUBR    R4,     R1                      ; 5B8D   0121
        MVO     R1,     .BTAB.00                ; 5B8E   0241 0200
        MVI     .BTAB.04,R1                     ; 5B90   0281 0204
        SUBR    R4,     R1                      ; 5B92   0121
        MVO     R1,     .BTAB.04                ; 5B93   0241 0204
        MVII    #$0001, R3                      ; 5B95   02BB 0001
        MVII    #$0006, R0                      ; 5B97   02B8 0006
        MVII    #$0327, R2                      ; 5B99   02BA 0327
        MVI     G_019A, R1                      ; 5B9B   0281 019A
        SUBR    R1,     R0                      ; 5B9D   0108
        ADDR    R1,     R3                      ; 5B9E   00CB
        SLL     R1,     1                       ; 5B9F   0049
        SLL     R1,     2                       ; 5BA0   004D
        ADDR    R1,     R2                      ; 5BA1   00CA
        MVII    #$0008, R5                      ; 5BA2   02BD 0008
        SDBD                                    ; 5BA4   0001
        MVII    #$0800, R4                      ; 5BA5   02BC 0000 0008
L_5BA8:
        MVI@    R3,     R1                      ; 5BA8   0299
        SUBI    #$0008, R1                      ; 5BA9   0339 0008
        MVO@    R1,     R3                      ; 5BAB   0259
        INCR    R3                              ; 5BAC   000B
        MVI@    R2,     R1                      ; 5BAD   0291
        SUBR    R4,     R1                      ; 5BAE   0121
        MVO@    R1,     R2                      ; 5BAF   0251
        ADDR    R5,     R2                      ; 5BB0   00EA
        DECR    R0                              ; 5BB1   0010
        BPL     L_5BA8                          ; 5BB2   0223 000B

        MVI     .BTAB.0A,R1                     ; 5BB4   0281 020A
        SUBI    #$0008, R1                      ; 5BB6   0339 0008
        MVO     R1,     .BTAB.0A                ; 5BB8   0241 020A
        MVI     .BTAB.0C,R1                     ; 5BBA   0281 020C
        SUBI    #$0008, R1                      ; 5BBC   0339 0008
        MVO     R1,     .BTAB.0C                ; 5BBE   0241 020C
        MVO     R7,     .STIC.VIDEN             ; 5BC0   0247 0020

        JSR     R5,     L_52D4                  ; 5BC2   0004 0150 02D4
        JSR     R5,     L_5520                  ; 5BC5   0004 0154 0120
        JSR     R5,     L_558F                  ; 5BC8   0004 0154 018F

        B       L_5C08                          ; 5BCB   0200 003B

L_5BCD:
        MVII    #$0004, R1                      ; 5BCD   02B9 0004
        MVO     R1,     G_0160                  ; 5BCF   0241 0160

L_5BD1:
        JSR     R5,     X_DEF_ISR               ; 5BD1   0004 0110 0126

        ADD     G_018C, R7                      ; 5BD4   02C7 018C
        B       L_5C08                          ; 5BD6   0200 0030
        B       L_5C10                          ; 5BD8   0200 0036
        B       L_5C6B                          ; 5BDA   0200 008F

        MVI     G_018D, R1                      ; 5BDC   0281 018D
        TSTR    R1                              ; 5BDE   0089
        BEQ     L_5C08                          ; 5BDF   0204 0027

        MOVR    R1,     R3                      ; 5BE1   008B
        ANDI    #$003F, R3                      ; 5BE2   03BB 003F
        BEQ     L_5BEB                          ; 5BE4   0204 0005

        JSR     R5,     L_5C97                  ; 5BE6   0004 015C 0097

        BNC     L_5C08                          ; 5BE9   0209 001D

L_5BEB:
        CLRR    R2                              ; 5BEB   01D2
        ANDI    #$0040, R1                      ; 5BEC   03B9 0040
        BEQ     L_5BFD                          ; 5BEE   0204 000D

        MVI     .BTAB.00,R2                     ; 5BF0   0282 0200
        MVI     .BTAB.01,R3                     ; 5BF2   0283 0201

        JSR     R5,     L_5D0F                  ; 5BF4   0004 015C 010F

        BC      L_5BFD                          ; 5BF7   0201 0004

L_5BF9:
        INCR    R1                              ; 5BF9   0009

        JSR     R5,     L_5D20                  ; 5BFA   0004 015C 0120

L_5BFD:
        MVII    #$0200, R4                      ; 5BFD   02BC 0200
        MVO@    R2,     R4                      ; 5BFF   0262
        MVO@    R2,     R4                      ; 5C00   0262
        MVO@    R2,     R4                      ; 5C01   0262
        MVII    #$0001, R0                      ; 5C02   02B8 0001

        JSR     R5,     X_SET_BIT               ; 5C04   0004 0114 02DB

        ANDR    R0,     R6                      ; 5C07   0186
L_5C08:
        CLRR    R1                              ; 5C08   01C9
        MVO     R1,     G_018C                  ; 5C09   0241 018C
        MVO     R1,     G_018D                  ; 5C0B   0241 018D
        MVO     R1,     G_01E5                  ; 5C0D   0241 01E5
        PULR    R7                              ; 5C0F   02B7
L_5C10:
        MVI     G_018D, R1                      ; 5C10   0281 018D
        TSTR    R1                              ; 5C12   0089
        BEQ     L_5C08                          ; 5C13   0224 000C

        MOVR    R1,     R3                      ; 5C15   008B
        ANDI    #$003F, R3                      ; 5C16   03BB 003F
        BEQ     L_5C1F                          ; 5C18   0204 0005

        JSR     R5,     L_5C97                  ; 5C1A   0004 015C 0097

        BNC     L_5C08                          ; 5C1D   0229 0016

L_5C1F:
        CLRR    R2                              ; 5C1F   01D2
        ANDI    #$0040, R1                      ; 5C20   03B9 0040
        BEQ     L_5C64                          ; 5C22   0204 0040

        MVI     .BTAB.04,R2                     ; 5C24   0282 0204
        MVI     .BTAB.05,R3                     ; 5C26   0283 0205
        PSHR    R3                              ; 5C28   0273
        PSHR    R2                              ; 5C29   0272

        JSR     R5,     L_632E                  ; 5C2A   0004 0160 032E

        BC      L_5C33                          ; 5C2D   0201 0004

L_5C2F:
        PULR    R2                              ; 5C2F   02B2
        PULR    R3                              ; 5C30   02B3
        B       L_5C5B                          ; 5C31   0200 0028

L_5C33:
        CMPI    #$032D, R2                      ; 5C33   037A 032D
        BLT     L_5C2F                          ; 5C35   0225 0007

        SDBD                                    ; 5C37   0001
        MVII    #$59B1, R4                      ; 5C38   02BC 00B1 0059
        MVII    #$0007, R1                      ; 5C3B   02B9 0007
L_5C3D:
        SDBD                                    ; 5C3D   0001
        MVI@    R4,     R5                      ; 5C3E   02A5
        MVO@    R5,     R2                      ; 5C3F   0255
        INCR    R2                              ; 5C40   000A
        DECR    R1                              ; 5C41   0011
L_5C42:
        BPL     L_5C3D                          ; 5C42   0223 0006

        SUBI    #$0008, R2                      ; 5C44   033A 0008
        MOVR    R2,     R4                      ; 5C46   0094
L_5C47:
        MOVR    R4,     R1                      ; 5C47   00A1
        ADDI    #$0002, R4                      ; 5C48   02FC 0002
        MVII    #$0200, R0                      ; 5C4A   02B8 0200
        SLL     R0,     1                       ; 5C4C   0048
        NEGR    R0                              ; 5C4D   0020
        PULR    R2                              ; 5C4E   02B2
        PULR    R3                              ; 5C4F   02B3
        ADDR    R0,     R3                      ; 5C50   00C3
        ADDR    R0,     R2                      ; 5C51   00C2
        MVO@    R2,     R4                      ; 5C52   0262
        MVO@    R3,     R4                      ; 5C53   0263
        NEGR    R0                              ; 5C54   0020
        ADDR    R0,     R3                      ; 5C55   00C3
        ADDR    R0,     R2                      ; 5C56   00C2
        MVI@    R1,     R4                      ; 5C57   028C
        XORI    #$0005, R4                      ; 5C58   03FC 0005
        MVO@    R4,     R1                      ; 5C5A   024C

L_5C5B:
        JSR     R5,     L_5D0F                  ; 5C5B   0004 015C 010F

        BC      L_5C64                          ; 5C5E   0201 0004

        INCR    R1                              ; 5C60   0009

        JSR     R5,     L_5D20                  ; 5C61   0004 015C 0120

L_5C64:
        MVII    #$0204, R4                      ; 5C64   02BC 0204
        MVO@    R2,     R4                      ; 5C66   0262
        MVO@    R2,     R4                      ; 5C67   0262
        MVO@    R2,     R4                      ; 5C68   0262
        B       L_5C08                          ; 5C69   0220 0062

L_5C6B:
        MVI     G_018D, R1                      ; 5C6B   0281 018D
        TSTR    R1                              ; 5C6D   0089
        BEQ     L_5C08                          ; 5C6E   0224 0067

        MOVR    R1,     R3                      ; 5C70   008B
        ANDI    #$003F, R3                      ; 5C71   03BB 003F
        BEQ     L_5C7A                          ; 5C73   0204 0005

        JSR     R5,     L_5C97                  ; 5C75   0004 015C 0097

        BNC     L_5C08                          ; 5C78   0229 0071

L_5C7A:
        CLRR    R2                              ; 5C7A   01D2
        ANDI    #$0040, R1                      ; 5C7B   03B9 0040
        BEQ     L_5C8C                          ; 5C7D   0204 000D

        MVI     G_0327, R2                      ; 5C7F   0282 0327
        MVI     G_0328, R3                      ; 5C81   0283 0328

        JSR     R5,     L_5D0F                  ; 5C83   0004 015C 010F

        BC      L_5C8C                          ; 5C86   0201 0004

        INCR    R1                              ; 5C88   0009

        JSR     R5,     L_5D20                  ; 5C89   0004 015C 0120

L_5C8C:
        MVO     R2,     G_0327                  ; 5C8C   0242 0327
        MVO     R2,     G_0328                  ; 5C8E   0242 0328
        CLRR    R0                              ; 5C90   01C0

        JSR     R5,     X_SET_BIT               ; 5C91   0004 0114 02DB

        ANDR    R0,     R6                      ; 5C94   0186
L_5C95:
        B       L_5C08                          ; 5C95   0220 008E

L_5C97:
        PSHR    R5                              ; 5C97   0275
        PSHR    R1                              ; 5C98   0271
        MVII    #$0002, R0                      ; 5C99   02B8 0002
        MVII    #$032E, R2                      ; 5C9B   02BA 032E
L_5C9D:
        SARC    R3,     1                       ; 5C9D   007B
        BC      L_5CA9                          ; 5C9E   0201 0009

L_5CA0:
        ADDI    #$0008, R2                      ; 5CA0   02FA 0008
        INCR    R0                              ; 5CA2   0008
        CMPI    #$0007, R0                      ; 5CA3   0378 0007
L_5CA5:
        BLE     L_5C9D                          ; 5CA5   0226 0009
        B       L_5CC1                          ; 5CA7   0200 0018

L_5CA9:
        MVI@    R2,     R4                      ; 5CA9   0294
        SDBD                                    ; 5CAA   0001
        CMPI    #$59D1, R4                      ; 5CAB   037C 00D1 0059
        BGE     L_5CA0                          ; 5CAE   022D 000F

        MVI@    R2,     R3                      ; 5CB0   0293
        SDBD                                    ; 5CB1   0001
        MVII    #$5CF7, R5                      ; 5CB2   02BD 00F7 005C
        MVII    #$0005, R2                      ; 5CB5   02BA 0005
L_5CB7:
        SDBD                                    ; 5CB7   0001
        MVI@    R5,     R4                      ; 5CB8   02AC
        CMPR    R4,     R3                      ; 5CB9   0163
        BEQ     L_5CC4                          ; 5CBA   0204 0008

        ADDI    #$0002, R5                      ; 5CBC   02FD 0002
        DECR    R2                              ; 5CBE   0012
        BPL     L_5CB7                          ; 5CBF   0223 0009

L_5CC1:
        CLRC                                    ; 5CC1   0006
        B       L_5CF5                          ; 5CC2   0200 0031

L_5CC4:
        MVO     R4,     .BTAB.12                ; 5CC4   0244 0212
        SDBD                                    ; 5CC6   0001
        MVI@    R5,     R4                      ; 5CC7   02AC
        SDBD                                    ; 5CC8   0001
        MVII    #$5CD3, R5                      ; 5CC9   02BD 00D3 005C
        MVI     G_011B, R3                      ; 5CCC   0283 011B
        MVO     R3,     .BTAB.11                ; 5CCE   0243 0211
        MVO     R0,     G_011B                  ; 5CD0   0240 011B
        MOVR    R4,     R7                      ; 5CD2   00A7
        MVI     .BTAB.12,R4                     ; 5CD3   0284 0212
        SDBD                                    ; 5CD5   0001
        CMPI    #$5880, R4                      ; 5CD6   037C 0080 0058
        BNEQ    L_5CEA                          ; 5CD9   020C 000F

        MVII    #$0003, R0                      ; 5CDB   02B8 0003
        MVO     R0,     G_011B                  ; 5CDD   0240 011B

        JSR     R5,     L_64E8                  ; 5CDF   0004 0164 00E8

        CLRR    R3                              ; 5CE2   01DB
        MVO     R3,     G_0199                  ; 5CE3   0243 0199
        INCR    R3                              ; 5CE5   000B
        MVO     R3,     G_0185                  ; 5CE6   0243 0185
        MVO     R3,     G_019A                  ; 5CE8   0243 019A
L_5CEA:
        MVI     .BTAB.11,R3                     ; 5CEA   0283 0211
        MVO     R3,     G_011B                  ; 5CEC   0243 011B
        MVI     G_019C, R1                      ; 5CEE   0281 019C
        ADDI    #$0064, R1                      ; 5CF0   02F9 0064
        MVO     R1,     G_019C                  ; 5CF2   0241 019C
        SETC                                    ; 5CF4   0007
L_5CF5:
        PULR    R1                              ; 5CF5   02B1
        PULR    R7                              ; 5CF6   02B7
        RSWD    R3                              ; 5CF7   003B
        SLLC    R1,     1                       ; 5CF8   0059
        ADDR    R6,     R1                      ; 5CF9   00F1
        SLR     R0,     2                       ; 5CFA   0064
        DIS                                     ; 5CFB   0003
        SLLC    R1,     1                       ; 5CFC   0059
        ADDR    R5,     R0                      ; 5CFD   00E8
        SLR     R0,     2                       ; 5CFE   0064
        RLC     R2,     2                       ; 5CFF   0056
        SLLC    R1,     1                       ; 5D00   0059
        ADDR    R5,     R3                      ; 5D01   00EB
        SLR     R0,     2                       ; 5D02   0064
        NEGR    R0                              ; 5D03   0020
        SLLC    R1,     1                       ; 5D04   0059
        ADDR    R6,     R5                      ; 5D05   00F5
        SLR     R0,     2                       ; 5D06   0064
        MOVR    R7,     R3                      ; 5D07   00BB
        SLLC    R0,     1                       ; 5D08   0058
        ADDR    R7,     R2                      ; 5D09   00FA
        SLR     R0,     2                       ; 5D0A   0064
        TSTR    R0                              ; 5D0B   0080
        SLLC    R0,     1                       ; 5D0C   0058
        ADDR    R6,     R1                      ; 5D0D   00F1
        SLR     R0,     2                       ; 5D0E   0064
L_5D0F:
        SWAP    R2,     1                       ; 5D0F   0042
        SWAP    R3,     1                       ; 5D10   0043
        ANDI    #$0078, R3                      ; 5D11   03BB 0078
        ANDI    #$00FF, R2                      ; 5D13   03BA 00FF
        SLR     R2,     2                       ; 5D15   0066
        SLR     R2,     1                       ; 5D16   0062
        DECR    R2                              ; 5D17   0012
        SLR     R3,     1                       ; 5D18   0063
        PSHR    R3                              ; 5D19   0273
        SLL     R3,     2                       ; 5D1A   004F
        ADD@    R6,     R3                      ; 5D1B   02F3
        ADDI    #$01EC, R3                      ; 5D1C   02FB 01EC
        ADDR    R3,     R2                      ; 5D1E   00DA
        MOVR    R2,     R1                      ; 5D1F   0091
L_5D20:
        CLRR    R2                              ; 5D20   01D2
        MVII    #$0001, R0                      ; 5D21   02B8 0001
L_5D23:
        MVI@    R1,     R3                      ; 5D23   028B
        SLR     R3,     2                       ; 5D24   0067
        SLR     R3,     1                       ; 5D25   0063
        ANDI    #$003F, R3                      ; 5D26   03BB 003F
        CMPI    #$0003, R3                      ; 5D28   037B 0003
        BLT     L_5D59                          ; 5D2A   0205 002D

        CMPI    #$0008, R3                      ; 5D2C   037B 0008
        BGE     L_5D59                          ; 5D2E   020D 0029

        SDBD                                    ; 5D30   0001
        CMPI    #$5D66, R5                      ; 5D31   037D 0066 005D
        BGE     L_5D56                          ; 5D34   020D 0020

        CMPI    #$0005, R3                      ; 5D36   037B 0005
        BNEQ    L_5D50                          ; 5D38   020C 0016

        PSHR    R1                              ; 5D3A   0271
        PSHR    R5                              ; 5D3B   0275
        MVII    #$0008, R1                      ; 5D3C   02B9 0008

        JSR     R5,     L_52CA                  ; 5D3E   0004 0150 02CA

        MVI@    R4,     R1                      ; 5D41   02A1
        ADDI    #$002A, R1                      ; 5D42   02F9 002A
        CMPI    #$00FF, R1                      ; 5D44   0379 00FF
        BLE     L_5D4A                          ; 5D46   0206 0002

        MVII    #$00FF, R1                      ; 5D48   02B9 00FF
L_5D4A:
        DECR    R4                              ; 5D4A   0014
        MVO@    R1,     R4                      ; 5D4B   0261
        MVO     R2,     G_01E2                  ; 5D4C   0242 01E2
        PULR    R5                              ; 5D4E   02B5
        PULR    R1                              ; 5D4F   02B1
L_5D50:
        MVI     G_019C, R3                      ; 5D50   0283 019C
        ADDI    #$0032, R3                      ; 5D52   02FB 0032
        MVO     R3,     G_019C                  ; 5D54   0243 019C
L_5D56:
        MVO@    R2,     R1                      ; 5D56   024A
        SETC                                    ; 5D57   0007
        MOVR    R5,     R7                      ; 5D58   00AF
L_5D59:
        DECR    R0                              ; 5D59   0010
        BMI     L_5D62                          ; 5D5A   020B 0006

        ADDI    #$0014, R1                      ; 5D5C   02F9 0014
        CMPI    #$02EE, R1                      ; 5D5E   0379 02EE
        BLE     L_5D23                          ; 5D60   0226 003E

L_5D62:
        SUBI    #$0014, R1                      ; 5D62   0339 0014
        CLRC                                    ; 5D64   0006
        MOVR    R5,     R7                      ; 5D65   00AF
        PSHR    R5                              ; 5D66   0275
        MVI     G_0160, R1                      ; 5D67   0281 0160
L_5D69:
        CMPI    #$0003, R1                      ; 5D69   0379 0003
        BGT     L_5D6E                          ; 5D6B   020E 0001

        PULR    R7                              ; 5D6D   02B7
L_5D6E:
        CMPI    #$0009, R1                      ; 5D6E   0379 0009
        BEQ     L_5E2C                          ; 5D70   0204 00BA

        CMPI    #$0006, R1                      ; 5D72   0379 0006
        BNEQ    L_5E93                          ; 5D74   020C 011D

        JSR     R5,     L_52AF                  ; 5D76   0004 0150 02AF

        MVII    #$0007, R3                      ; 5D79   02BB 0007
        MVII    #$021A, R4                      ; 5D7B   02BC 021A

        JSR     R5,     L_5E79                  ; 5D7D   0004 015C 0279

        MVI     G_0163, R0                      ; 5D80   0280 0163
        INCR    R0                              ; 5D82   0008
L_5D83:
        MVII    #$0001, R1                      ; 5D83   02B9 0001
        MVII    #$0221, R4                      ; 5D85   02BC 0221

        JSR     R5,     X_PRNUM_RGT             ; 5D87   0004 0118 00C5

        MVII    #$022C, R4                      ; 5D8A   02BC 022C

        JSR     R5,     L_5E86                  ; 5D8C   0004 015C 0286

        MVII    #$000A, R1                      ; 5D8F   02B9 000A

        JSR     R5,     L_52CA                  ; 5D91   0004 0150 02CA

        MVII    #$0233, R1                      ; 5D94   02B9 0233
        MVII    #$0007, R3                      ; 5D96   02BB 0007

        JSR     R5,     L_5E68                  ; 5D98   0004 015C 0268

        MVO     R1,     .BTAB.08                ; 5D9B   0241 0208

        JSR     R5,     L_52CA                  ; 5D9D   0004 0150 02CA

        PSHR    R4                              ; 5DA0   0274
        MOVR    R4,     R1                      ; 5DA1   00A1
        ADDI    #$004C, R4                      ; 5DA2   02FC 004C
        MVII    #$000A, R0                      ; 5DA4   02B8 000A

        JSR     R5,     .EXEC.730               ; 5DA6   0004 0114 0330
        JSR     R5,     L_65E8                  ; 5DA9   0004 0164 01E8

        PULR    R4                              ; 5DAC   02B4
L_5DAD:
        MOVR    R4,     R2                      ; 5DAD   00A2
        ADDI    #$0002, R4                      ; 5DAE   02FC 0002
        SDBD                                    ; 5DB0   0001
        MVI@    R4,     R1                      ; 5DB1   02A1
        SDBD                                    ; 5DB2   0001
        CMPI    #$6F7A, R1                      ; 5DB3   0379 007A 006F
        BLE     L_5DBD                          ; 5DB6   0206 0005

        PSHR    R2                              ; 5DB8   0272

        JSR     R5,     L_5F1E                  ; 5DB9   0004 015C 031E

        PULR    R2                              ; 5DBC   02B2
L_5DBD:
        MVI@    R2,     R3                      ; 5DBD   0293
        DECR    R3                              ; 5DBE   0013
        MVO@    R3,     R2                      ; 5DBF   0253
        MVII    #$0010, R4                      ; 5DC0   02BC 0010
        NEGR    R4                              ; 5DC2   0024
        ADD     G_0163, R7                      ; 5DC3   02C7 0163
        NEGR    R4                              ; 5DC5   0024
        ADDR    R4,     R2                      ; 5DC6   00E2
        ADD@    R2,     R3                      ; 5DC7   02D3
        BEQ     L_5DE8                          ; 5DC8   0204 001E

        MVI     G_0163, R1                      ; 5DCA   0281 0163
        CLRR    R0                              ; 5DCC   01C0
        XOR     G_0161, R0                      ; 5DCD   03C0 0161
        BEQ     L_5DD9                          ; 5DCF   0204 0008

        XORI    #$0001, R1                      ; 5DD1   03F9 0001
L_5DD3:
        MVI@    R2,     R2                      ; 5DD3   0292
        TSTR    R2                              ; 5DD4   0092
        BEQ     L_5DD9                          ; 5DD5   0204 0002

        MVO     R1,     G_0163                  ; 5DD7   0241 0163

L_5DD9:
        JSR     R5,     L_52B5                  ; 5DD9   0004 0150 02B5

        MVII    #$0004, R2                      ; 5DDC   02BA 0004
        MVO     R2,     G_0102                  ; 5DDE   0242 0102
        MVII    #$007F, R1                      ; 5DE0   02B9 007F

        JSR     R5,     L_6390                  ; 5DE2   0004 0160 0390

L_5DE5:
        J       L_51A8                          ; 5DE5   0004 0350 01A8

L_5DE8:
        MVI     G_0161, R0                      ; 5DE8   0280 0161
        SLL     R0,     1                       ; 5DEA   0048
        ADDR    R0,     R7                      ; 5DEB   00C7
        B       L_5E0B                          ; 5DEC   0200 001D

        MVII    #$0006, R3                      ; 5DEE   02BB 0006
        MVII    #$0256, R4                      ; 5DF0   02BC 0256

        JSR     R5,     L_5E79                  ; 5DF2   0004 015C 0279

        CLRR    R0                              ; 5DF5   01C0
        MVO     R0,     G_0163                  ; 5DF6   0240 0163
        INCR    R0                              ; 5DF8   0008
        MOVR    R0,     R1                      ; 5DF9   0081
        MVII    #$025D, R4                      ; 5DFA   02BC 025D

        JSR     R5,     X_PRNUM_RGT             ; 5DFC   0004 0118 00C5

        MVII    #$0268, R4                      ; 5DFF   02BC 0268

        JSR     R5,     L_5E86                  ; 5E01   0004 015C 0286

        MVII    #$016E, R4                      ; 5E04   02BC 016E
        MVII    #$026F, R1                      ; 5E06   02B9 026F

L_5E08:
        JSR     R5,     L_5E68                  ; 5E08   0004 015C 0268

L_5E0B:
        MVII    #$0007, R3                      ; 5E0B   02BB 0007
        MVII    #$0291, R4                      ; 5E0D   02BC 0291

        JSR     R5,     X_PRINT_R5              ; 5E0F   0004 0118 007B

L_5E12:
        SWAP    R3,     2                       ; 5E12   0047
L_5E13:
        SWAP    R1,     1                       ; 5E13   0041
        SLL     R1,     2                       ; 5E14   004D
        SWAP    R1,     2                       ; 5E15   0045
        NEGR    R0                              ; 5E16   0020
        NEGR    R0                              ; 5E17   0020
        SLL     R3,     2                       ; 5E18   004F
        RLC     R2,     2                       ; 5E19   0056
        SWAP    R1,     2                       ; 5E1A   0045
        RLC     R2,     1                       ; 5E1B   0052
        DECLE   $0000                           ; 5E1C   0000

        JSR     R5,     L_52B5                  ; 5E1D   0004 0150 02B5

        SDBD                                    ; 5E20   0001
        MVII    #$5027, R1                      ; 5E21   02B9 0027 0050

        JSR     R5,     L_6209                  ; 5E24   0004 0160 0209

        MVII    #$0009, R1                      ; 5E27   02B9 0009
        MVO     R1,     G_0160                  ; 5E29   0241 0160
        PULR    R7                              ; 5E2B   02B7
L_5E2C:
        MVI     .PSG0.lft_hand,R1               ; 5E2C   0281 01FF
        CMPI    #$00FF, R1                      ; 5E2E   0379 00FF
        BNEQ    L_5E39                          ; 5E30   020C 0007

        MVI     .PSG0.rgt_hand,R1               ; 5E32   0281 01FE
        CMPI    #$00FF, R1                      ; 5E34   0379 00FF
        BNEQ    L_5E39                          ; 5E36   020C 0001

        PULR    R7                              ; 5E38   02B7
L_5E39:
        CMPI    #$00D7, R1                      ; 5E39   0379 00D7
        BEQ     L_5E47                          ; 5E3B   0204 000A

        MVII    #$015F, R4                      ; 5E3D   02BC 015F
        MVII    #$0092, R0                      ; 5E3F   02B8 0092

        JSR     R5,     X_FILL_ZERO             ; 5E41   0004 0114 0338

        J       L_50F4                          ; 5E44   0004 0350 00F4

L_5E47:
        MVII    #$016E, R4                      ; 5E47   02BC 016E
        MVII    #$0006, R0                      ; 5E49   02B8 0006

        JSR     R5,     X_FILL_ZERO             ; 5E4B   0004 0114 0338

        MVII    #$017E, R4                      ; 5E4E   02BC 017E
        MVII    #$0006, R0                      ; 5E50   02B8 0006

        JSR     R5,     X_FILL_ZERO             ; 5E52   0004 0114 0338

        MVII    #$0006, R1                      ; 5E55   02B9 0006
L_5E57:
        MVI     G_0162, R0                      ; 5E57   0280 0162
        TSTR    R0                              ; 5E59   0080
        BNEQ    L_5E5E                          ; 5E5A   020C 0002

        ADDI    #$0003, R1                      ; 5E5C   02F9 0003
L_5E5E:
        MVO     R1,     G_0164                  ; 5E5E   0241 0164
        MVI     G_0161, R0                      ; 5E60   0280 0161
L_5E62:
        ADDR    R0,     R7                      ; 5E62   00C7
        CLRR    R1                              ; 5E63   01C9
        MVO     R1,     G_0174                  ; 5E64   0241 0174
        B       L_5DE5                          ; 5E66   0220 0082

L_5E68:
        PSHR    R5                              ; 5E68   0275
        MOVR    R1,     R5                      ; 5E69   008D
        MVII    #$0005, R0                      ; 5E6A   02B8 0005
L_5E6C:
        MVI@    R4,     R1                      ; 5E6C   02A1
        ADDI    #$0010, R1                      ; 5E6D   02F9 0010
        SLL     R1,     2                       ; 5E6F   004D
        SLL     R1,     1                       ; 5E70   0049
        XORR    R3,     R1                      ; 5E71   01D9
        MVO@    R1,     R5                      ; 5E72   0269
        DECR    R0                              ; 5E73   0010
        BPL     L_5E6C                          ; 5E74   0223 0009

L_5E76:
        CLRR    R1                              ; 5E76   01C9
        MVO@    R1,     R5                      ; 5E77   0269
        PULR    R7                              ; 5E78   02B7
L_5E79:
        PSHR    R5                              ; 5E79   0275

        JSR     R5,     X_PRINT_R5              ; 5E7A   0004 0118 007B

        RLC     R0,     1                       ; 5E7D   0050
        SLL     R0,     2                       ; 5E7E   004C
        SWAP    R1,     1                       ; 5E7F   0041
        SLLC    R1,     1                       ; 5E80   0059
        SWAP    R1,     2                       ; 5E81   0045
        RLC     R2,     1                       ; 5E82   0052
        NEGR    R0                              ; 5E83   0020
        DECLE   $0000                           ; 5E84   0000

        PULR    R7                              ; 5E85   02B7
L_5E86:
        PSHR    R5                              ; 5E86   0275

        JSR     R5,     X_PRINT_R5              ; 5E87   0004 0118 007B

L_5E8A:
        RLC     R3,     1                       ; 5E8A   0053
        SWAP    R3,     1                       ; 5E8B   0043
        SLL     R3,     2                       ; 5E8C   004F
        RLC     R2,     1                       ; 5E8D   0052
        SWAP    R1,     2                       ; 5E8E   0045
        NEGR    R0                              ; 5E8F   0020
        NEGR    R0                              ; 5E90   0020
        DECLE   $0000                           ; 5E91   0000

        PULR    R7                              ; 5E92   02B7
L_5E93:
        BLT     L_5F32                          ; 5E93   0205 009D

        JSR     R5,     L_52AF                  ; 5E95   0004 0150 02AF

        MVII    #$0007, R3                      ; 5E98   02BB 0007
        MVII    #$0219, R4                      ; 5E9A   02BC 0219

L_5E9C:
        JSR     R5,     X_PRINT_R5              ; 5E9C   0004 0118 007B

        GSWD    R0                              ; 5E9F   0030
        GSWD    R0                              ; 5EA0   0030
        GSWD    R0                              ; 5EA1   0030
        NEGR    R0                              ; 5EA2   0020
        SLL     R1,     2                       ; 5EA3   004D
        SLL     R1,     1                       ; 5EA4   0049
        SLL     R0,     2                       ; 5EA5   004C
        SWAP    R1,     2                       ; 5EA6   0045
        RLC     R3,     1                       ; 5EA7   0053
        DECLE   $0000                           ; 5EA8   0000

        MVII    #$0009, R1                      ; 5EA9   02B9 0009

        JSR     R5,     L_52CA                  ; 5EAB   0004 0150 02CA

        MVI@    R4,     R0                      ; 5EAE   02A0
        TSTR    R0                              ; 5EAF   0080
        BEQ     L_5EC4                          ; 5EB0   0204 0012

L_5EB2:
        MVII    #$0007, R3                      ; 5EB2   02BB 0007
        MVII    #$0002, R1                      ; 5EB4   02B9 0002
        MVII    #$0217, R4                      ; 5EB6   02BC 0217

        JSR     R5,     X_PRNUM_RGT             ; 5EB8   0004 0118 00C5
        JSR     R5,     L_52A9                  ; 5EBB   0004 0150 02A9

        MVII    #$0008, R1                      ; 5EBE   02B9 0008
        MVO     R1,     G_0160                  ; 5EC0   0241 0160
        B       L_600C                          ; 5EC2   0200 0148

L_5EC4:
        MVI     G_0199, R1                      ; 5EC4   0281 0199
        CMPI    #$0003, R1                      ; 5EC6   0379 0003
        BNEQ    L_5EF5                          ; 5EC8   020C 002B

        MVII    #$0007, R3                      ; 5ECA   02BB 0007
        MVII    #$0217, R4                      ; 5ECC   02BC 0217

        JSR     R5,     X_PRINT_R5              ; 5ECE   0004 0118 007B

        SWAP    R3,     1                       ; 5ED1   0043
        SLL     R3,     2                       ; 5ED2   004F
        SLL     R2,     2                       ; 5ED3   004E
        SWAP    R3,     2                       ; 5ED4   0047
        RLC     R2,     1                       ; 5ED5   0052
        SWAP    R1,     1                       ; 5ED6   0041
        RLC     R0,     2                       ; 5ED7   0054
        RLC     R1,     2                       ; 5ED8   0055
        SLL     R0,     2                       ; 5ED9   004C
        SWAP    R1,     1                       ; 5EDA   0041
        RLC     R0,     2                       ; 5EDB   0054
        SLL     R1,     1                       ; 5EDC   0049
        SLL     R3,     2                       ; 5EDD   004F
        SLL     R2,     2                       ; 5EDE   004E
        RLC     R3,     1                       ; 5EDF   0053
        DECLE   $0000                           ; 5EE0   0000

        MVI     G_0162, R1                      ; 5EE1   0281 0162
        CMPI    #$0003, R1                      ; 5EE3   0379 0003
        BLE     L_5DD9                          ; 5EE5   0226 010D

        CLRR    R1                              ; 5EE7   01C9
        MVO     R1,     G_0199                  ; 5EE8   0241 0199
        MVO     R1,     G_032E                  ; 5EEA   0241 032E
        MVO     R1,     G_0326                  ; 5EEC   0241 0326
        INCR    R1                              ; 5EEE   0009
        MVO     R1,     G_0185                  ; 5EEF   0241 0185
        MVO     R1,     G_019A                  ; 5EF1   0241 019A
        B       L_600C                          ; 5EF3   0200 0117

L_5EF5:
        MVI     G_0162, R1                      ; 5EF5   0281 0162
        CMPI    #$0003, R1                      ; 5EF7   0379 0003
        BLE     L_5EFF                          ; 5EF9   0206 0004

        ADDI    #$000B, R0                      ; 5EFB   02F8 000B
        B       L_5EB2                          ; 5EFD   0220 004C

L_5EFF:
        JSR     R5,     L_5F1E                  ; 5EFF   0004 015C 031E

        MVII    #$0007, R3                      ; 5F02   02BB 0007
        MVII    #$0217, R4                      ; 5F04   02BC 0217

        JSR     R5,     X_PRINT_R5              ; 5F06   0004 0118 007B

        SWAP    R3,     1                       ; 5F09   0043
        SLL     R0,     1                       ; 5F0A   0048
        SWAP    R1,     1                       ; 5F0B   0041
        SLL     R0,     2                       ; 5F0C   004C
        SLL     R0,     2                       ; 5F0D   004C
        SWAP    R1,     2                       ; 5F0E   0045
        SLL     R2,     2                       ; 5F0F   004E
        SWAP    R3,     2                       ; 5F10   0047
        SWAP    R1,     2                       ; 5F11   0045
        NEGR    R0                              ; 5F12   0020
        SWAP    R1,     1                       ; 5F13   0041
        SWAP    R3,     2                       ; 5F14   0047
        SWAP    R1,     1                       ; 5F15   0041
        SLL     R1,     1                       ; 5F16   0049
        SLL     R2,     2                       ; 5F17   004E
        DECLE   $0000                           ; 5F18   0000

        JSR     R5,     L_65E8                  ; 5F19   0004 0164 01E8

        B       L_5DD9                          ; 5F1C   0220 0144

L_5F1E:
        PSHR    R5                              ; 5F1E   0275
        SDBD                                    ; 5F1F   0001
        MVII    #$0002, R1                      ; 5F20   02B9 0002 0000

        JSR     R5,     L_52CA                  ; 5F23   0004 0150 02CA

        SDBD                                    ; 5F26   0001
        MVII    #$6F7A, R1                      ; 5F27   02B9 007A 006F
        MVO@    R1,     R4                      ; 5F2A   0261
        SWAP    R1,     1                       ; 5F2B   0041
        MVO@    R1,     R4                      ; 5F2C   0261
        ADDI    #$0003, R4                      ; 5F2D   02FC 0003
        CLRR    R2                              ; 5F2F   01D2
        MVO@    R2,     R4                      ; 5F30   0262
        PULR    R7                              ; 5F31   02B7
L_5F32:
        MVII    #$0008, R1                      ; 5F32   02B9 0008

        JSR     R5,     L_52CA                  ; 5F34   0004 0150 02CA

        MVI@    R4,     R1                      ; 5F37   02A1
        CMPI    #$0050, R1                      ; 5F38   0379 0050
        BGT     L_5F77                          ; 5F3A   020E 003B

        CMPI    #$0005, R1                      ; 5F3C   0379 0005
        BGT     L_5F4B                          ; 5F3E   020E 000B

        MVII    #$000C, R0                      ; 5F40   02B8 000C
        MVO     R0,     G_01E2                  ; 5F42   0240 01E2
        MVI     G_0163, R1                      ; 5F44   0281 0163

        JSR     R5,     L_55CA                  ; 5F46   0004 0154 01CA

        B       L_5F77                          ; 5F49   0200 002C

L_5F4B:
        MVI     G_01A0, R2                      ; 5F4B   0282 01A0
        DECR    R2                              ; 5F4D   0012
        BMI     L_5F54                          ; 5F4E   020B 0004

        MVO     R2,     G_01A0                  ; 5F50   0242 01A0
        B       L_5F77                          ; 5F52   0200 0023

L_5F54:
        JSR     R5,     L_52AF                  ; 5F54   0004 0150 02AF

        MVII    #$0002, R3                      ; 5F57   02BB 0002
        MVII    #$0218, R4                      ; 5F59   02BC 0218

        JSR     R5,     X_PRINT_R5              ; 5F5B   0004 0118 007B

        SWAP    R2,     2                       ; 5F5E   0046
        RLC     R1,     2                       ; 5F5F   0055
        SWAP    R1,     2                       ; 5F60   0045
        SLL     R0,     2                       ; 5F61   004C
        NEGR    R0                              ; 5F62   0020
        SWAP    R3,     1                       ; 5F63   0043
        RLC     R2,     1                       ; 5F64   0052
        SLL     R1,     1                       ; 5F65   0049
        RLC     R0,     2                       ; 5F66   0054
        SLL     R1,     1                       ; 5F67   0049
        SWAP    R3,     1                       ; 5F68   0043
        SWAP    R1,     1                       ; 5F69   0041
        SLL     R0,     2                       ; 5F6A   004C
        DECLE   $0000                           ; 5F6B   0000

        JSR     R5,     L_52A9                  ; 5F6C   0004 0150 02A9

        MVII    #$0003, R1                      ; 5F6F   02B9 0003
        MVO     R1,     G_018B                  ; 5F71   0241 018B
        MVII    #$0077, R1                      ; 5F73   02B9 0077
        MVO     R1,     G_01A0                  ; 5F75   0241 01A0
L_5F77:
        MVI     G_01E3, R1                      ; 5F77   0281 01E3
        TSTR    R1                              ; 5F79   0089
        BEQ     L_5F82                          ; 5F7A   0204 0006

        CLRR    R1                              ; 5F7C   01C9
        MVO     R1,     G_01E3                  ; 5F7D   0241 01E3

        JSR     R5,     L_6536                  ; 5F7F   0004 0164 0136

L_5F82:
        MVI     G_019F, R1                      ; 5F82   0281 019F
        DECR    R1                              ; 5F84   0011
        BMI     L_5F8B                          ; 5F85   020B 0004

        MVO     R1,     G_019F                  ; 5F87   0241 019F
        B       L_5FD9                          ; 5F89   0200 004E

L_5F8B:
        MVI     G_01A1, R2                      ; 5F8B   0282 01A1
        CMPI    #$0002, R2                      ; 5F8D   037A 0002
        BLT     L_600C                          ; 5F8F   0205 007B

        MVII    #$0098, R1                      ; 5F91   02B9 0098
        MVO     R1,     G_019F                  ; 5F93   0241 019F

        JSR     R5,     L_5F9C                  ; 5F95   0004 015C 039C

        EIS                                     ; 5F98   0002
        DIS                                     ; 5F99   0003
        DECLE   $0005                           ; 5F9A   0005

        CLRC                                    ; 5F9B   0006
L_5F9C:
        MVI     G_01D7, R1                      ; 5F9C   0281 01D7
        ADDR    R1,     R5                      ; 5F9E   00CD
        INCR    R1                              ; 5F9F   0009
        ANDI    #$0003, R1                      ; 5FA0   03B9 0003
        MVO     R1,     G_01D7                  ; 5FA2   0241 01D7
        MVI@    R5,     R1                      ; 5FA4   02A9
        MVO     R1,     G_01D6                  ; 5FA5   0241 01D6
        MVII    #$00C7, R0                      ; 5FA7   02B8 00C7
        MVII    #$0228, R4                      ; 5FA9   02BC 0228
L_5FAB:
        MVI@    R4,     R2                      ; 5FAB   02A2
        DECR    R4                              ; 5FAC   0014
        PSHR    R2                              ; 5FAD   0272
        SLR     R2,     1                       ; 5FAE   0062
        SLR     R2,     2                       ; 5FAF   0066
        ANDI    #$003F, R2                      ; 5FB0   03BA 003F
        CMPI    #$0008, R2                      ; 5FB2   037A 0008
        BEQ     L_5FC8                          ; 5FB4   0204 0012

        CMPI    #$0009, R2                      ; 5FB6   037A 0009
        BLE     L_5FD1                          ; 5FB8   0206 0017

        CMPI    #$000E, R2                      ; 5FBA   037A 000E
        BLE     L_5FC8                          ; 5FBC   0206 000A

        CMPI    #$0012, R2                      ; 5FBE   037A 0012
        BLE     L_5FD1                          ; 5FC0   0206 000F

        CMPI    #$0014, R2                      ; 5FC2   037A 0014
        BLE     L_5FC8                          ; 5FC4   0206 0002
        B       L_5FD1                          ; 5FC6   0200 0009

L_5FC8:
        PULR    R2                              ; 5FC8   02B2
        SDBD                                    ; 5FC9   0001
        ANDI    #$FFF8, R2                      ; 5FCA   03BA 00F8 00FF
        XORR    R1,     R2                      ; 5FCD   01CA
        MVO@    R2,     R4                      ; 5FCE   0262
        ADDI    #$0002, R7                      ; 5FCF   02FF 0002
L_5FD1:
        PULR    R2                              ; 5FD1   02B2
        INCR    R4                              ; 5FD2   000C
        DECR    R0                              ; 5FD3   0010
        BPL     L_5FAB                          ; 5FD4   0223 002A

        JSR     R5,     L_55BC                  ; 5FD6   0004 0154 01BC

L_5FD9:
        MVII    #$0009, R4                      ; 5FD9   02BC 0009
        MVII    #$0010, R3                      ; 5FDB   02BB 0010
        MVII    #$021F, R5                      ; 5FDD   02BD 021F
L_5FDF:
        MVII    #$0020, R2                      ; 5FDF   02BA 0020
        ADDI    #$0008, R3                      ; 5FE1   02FB 0008
        ADDI    #$000C, R5                      ; 5FE3   02FD 000C
        MVII    #$0007, R0                      ; 5FE5   02B8 0007
L_5FE7:
        MVI@    R5,     R1                      ; 5FE7   02A9
        SDBD                                    ; 5FE8   0001
        ANDI    #$0FFF, R1                      ; 5FE9   03B9 00FF 000F
        SDBD                                    ; 5FEC   0001
        CMPI    #$0827, R1                      ; 5FED   0379 0027 0008
        BEQ     L_622B                          ; 5FF0   0204 0239

        SDBD                                    ; 5FF2   0001
        CMPI    #$083F, R1                      ; 5FF3   0379 003F 0008
        BEQ     L_6291                          ; 5FF6   0204 0299

        SDBD                                    ; 5FF8   0001
        CMPI    #$0831, R1                      ; 5FF9   0379 0031 0008
        BEQ     L_62CD                          ; 5FFC   0204 02CF

        SDBD                                    ; 5FFE   0001
        CMPI    #$0819, R1                      ; 5FFF   0379 0019 0008
        BEQ     L_625E                          ; 6002   0204 025A

L_6004:
        ADDI    #$0008, R2                      ; 6004   02FA 0008
        DECR    R0                              ; 6006   0010
        BPL     L_5FE7                          ; 6007   0223 0021

        DECR    R4                              ; 6009   0014
        BPL     L_5FDF                          ; 600A   0223 002C

L_600C:
        MVI     G_0162, R1                      ; 600C   0281 0162
        CMPI    #$0003, R1                      ; 600E   0379 0003
        BGT     L_6091                          ; 6010   020E 007F

        MVI     G_01E2, R1                      ; 6012   0281 01E2
        TSTR    R1                              ; 6014   0089
        BNEQ    L_6091                          ; 6015   020C 007A

        MVII    #$01FF, R1                      ; 6017   02B9 01FF
        SUB     G_0163, R1                      ; 6019   0301 0163
        MVI@    R1,     R2                      ; 601B   028A
        MVO     R2,     G_01E8                  ; 601C   0242 01E8
        CMPI    #$00FF, R2                      ; 601E   037A 00FF
        BEQ     L_608A                          ; 6020   0204 0068

        MVII    #$0002, R4                      ; 6022   02BC 0002
        MVII    #$0001, R0                      ; 6024   02B8 0001
        MVII    #$001F, R3                      ; 6026   02BB 001F
        CMPR    R3,     R2                      ; 6028   015A
        BLT     L_6052                          ; 6029   0205 0027
        BEQ     L_6082                          ; 602B   0204 0055

        CMPI    #$003F, R2                      ; 602D   037A 003F
        BLT     L_6052                          ; 602F   0205 0021
        BEQ     L_6082                          ; 6031   0204 004F

        CLRR    R0                              ; 6033   01C0
        CMPI    #$005F, R2                      ; 6034   037A 005F
        BLT     L_6052                          ; 6036   0205 001A
        BEQ     L_6082                          ; 6038   0204 0048

        DECR    R3                              ; 603A   0013
        CMPI    #$007E, R2                      ; 603B   037A 007E
        BLT     L_6052                          ; 603D   0205 0013
        BEQ     L_6082                          ; 603F   0204 0041

        INCR    R3                              ; 6041   000B
        INCR    R0                              ; 6042   0008
        CMPI    #$009F, R2                      ; 6043   037A 009F
        BLT     L_6052                          ; 6045   0205 000B
        BEQ     L_6082                          ; 6047   0204 0039

        DECR    R3                              ; 6049   0013
        CMPI    #$00DE, R2                      ; 604A   037A 00DE
        BEQ     L_6082                          ; 604C   0204 0034
        BLT     L_6052                          ; 604E   0205 0002

        NEGR    R0                              ; 6050   0020
        INCR    R3                              ; 6051   000B
L_6052:
        PSHR    R0                              ; 6052   0270
        ANDR    R3,     R2                      ; 6053   019A
        SDBD                                    ; 6054   0001
        MVII    #$666D, R4                      ; 6055   02BC 006D 0066
        CLRR    R0                              ; 6058   01C0
L_6059:
        MVI@    R4,     R5                      ; 6059   02A5
        ANDR    R3,     R5                      ; 605A   019D
        CMPR    R2,     R5                      ; 605B   0155
        BEQ     L_6066                          ; 605C   0204 0008

        INCR    R0                              ; 605E   0008
        CMPI    #$000F, R0                      ; 605F   0378 000F
        BLE     L_6059                          ; 6061   0226 0009

        CLRR    R4                              ; 6063   01E4
        B       L_607E                          ; 6064   0200 0018

L_6066:
        SARC    R3,     1                       ; 6066   007B
        BC      L_6078                          ; 6067   0201 000F

        MVI     G_01EC, R1                      ; 6069   0281 01EC
        TSTR    R1                              ; 606B   0089
        BEQ     L_6078                          ; 606C   0204 000A

        CMPI    #$000B, R1                      ; 606E   0379 000B
        BLT     L_6078                          ; 6070   0205 0006

        CMPI    #$000E, R1                      ; 6072   0379 000E
        BGE     L_6078                          ; 6074   020D 0002

        MVII    #$000C, R0                      ; 6076   02B8 000C
L_6078:
        MVI     G_0163, R1                      ; 6078   0281 0163

        JSR     R5,     L_55CA                  ; 607A   0004 0154 01CA

        CLRR    R4                              ; 607D   01E4
L_607E:
        PULR    R0                              ; 607E   02B0
        TSTR    R0                              ; 607F   0080
        BMI     L_6091                          ; 6080   020B 000F

L_6082:
        PSHR    R4                              ; 6082   0274

        JSR     R5,     L_5648                  ; 6083   0004 0154 0248

        PULR    R4                              ; 6086   02B4
        ADDR    R4,     R7                      ; 6087   00E7
        B       L_6091                          ; 6088   0200 0007

L_608A:
        CLRR    R0                              ; 608A   01C0
        DECR    R0                              ; 608B   0010
        MVI     G_0163, R1                      ; 608C   0281 0163

        JSR     R5,     L_55CA                  ; 608E   0004 0154 01CA

L_6091:
        MVII    #$0002, R1                      ; 6091   02B9 0002

        JSR     R5,     L_52CA                  ; 6093   0004 0150 02CA

        SDBD                                    ; 6096   0001
        MVI@    R4,     R5                      ; 6097   02A5
        SDBD                                    ; 6098   0001
        CMPI    #$68FC, R5                      ; 6099   037D 00FC 0068
        BLT     L_610B                          ; 609C   0205 006D

        SDBD                                    ; 609E   0001
        CMPI    #$6A35, R5                      ; 609F   037D 0035 006A
        BGT     L_610B                          ; 60A2   020E 0067

        SDBD                                    ; 60A4   0001
        CMPI    #$695D, R5                      ; 60A5   037D 005D 0069
        BLT     L_60B0                          ; 60A8   0205 0006

        SDBD                                    ; 60AA   0001
        CMPI    #$696D, R5                      ; 60AB   037D 006D 0069
        BLT     L_610B                          ; 60AE   0205 005B

L_60B0:
        MVI     G_018E, R1                      ; 60B0   0281 018E
        DECR    R1                              ; 60B2   0011
        BMI     L_60B9                          ; 60B3   020B 0004

        MVO     R1,     G_018E                  ; 60B5   0241 018E
        B       L_6180                          ; 60B7   0200 00C7

L_60B9:
        MVII    #$000A, R1                      ; 60B9   02B9 000A
        MVO     R1,     G_018E                  ; 60BB   0241 018E

        JSR     R5,     L_632E                  ; 60BD   0004 0160 032E

        BNC     L_6180                          ; 60C0   0209 00BE

        ADDI    #$0193, R3                      ; 60C2   02FB 0193
        MVII    #$0002, R1                      ; 60C4   02B9 0002
        MVO@    R1,     R3                      ; 60C6   0259
        MVII    #$023B, R4                      ; 60C7   02BC 023B
        MVII    #$0018, R5                      ; 60C9   02BD 0018
        MVII    #$0008, R0                      ; 60CB   02B8 0008
L_60CD:
        MVI@    R4,     R1                      ; 60CD   02A1
        ADDI    #$0013, R4                      ; 60CE   02FC 0013
        TSTR    R1                              ; 60D0   0089
        BEQ     L_60DA                          ; 60D1   0204 0007

        ADDI    #$0008, R5                      ; 60D3   02FD 0008
        DECR    R0                              ; 60D5   0010
        BPL     L_60CD                          ; 60D6   0223 000A
        B       L_6180                          ; 60D8   0200 00A6

L_60DA:
        PSHR    R5                              ; 60DA   0275
        SDBD                                    ; 60DB   0001
        MVII    #$58F3, R1                      ; 60DC   02B9 00F3 0058
        INCR    R2                              ; 60DF   000A
        MVI@    R2,     R5                      ; 60E0   0295
L_60E1:
        DECR    R2                              ; 60E1   0012
        TSTR    R5                              ; 60E2   00AD
        BEQ     L_60E8                          ; 60E3   0204 0003

        DECR    R6                              ; 60E5   0016
        B       L_610B                          ; 60E6   0200 0023

L_60E8:
        JSR     R5,     X_INIT_MOB              ; 60E8   0004 0114 02B2

        MOVR    R2,     R1                      ; 60EB   0091
        ADDI    #$0002, R1                      ; 60EC   02F9 0002
        PULR    R3                              ; 60EE   02B3
        MVII    #$0098, R2                      ; 60EF   02BA 0098
        SWAP    R2,     1                       ; 60F1   0042
        MVO@    R2,     R1                      ; 60F2   024A
        INCR    R1                              ; 60F3   0009
        SWAP    R3,     1                       ; 60F4   0043
        MVO@    R3,     R1                      ; 60F5   024B
        MVII    #$0088, R2                      ; 60F6   02BA 0088
        SWAP    R2,     1                       ; 60F8   0042
        MVI     G_0320, R3                      ; 60F9   0283 0320
        SWAP    R3,     1                       ; 60FB   0043
        ANDI    #$007F, R3                      ; 60FC   03BB 007F
        XORR    R3,     R2                      ; 60FE   01DA
        MVII    #$0030, R3                      ; 60FF   02BB 0030
        SUBI    #$0003, R1                      ; 6101   0339 0003

        JSR     R5,     .EXEC.9A1               ; 6103   0004 0118 01A1
        JSR     R5,     L_65FF                  ; 6106   0004 0164 01FF

        B       L_6180                          ; 6109   0200 0075

L_610B:
        MVII    #$0002, R1                      ; 610B   02B9 0002

        JSR     R5,     L_52CA                  ; 610D   0004 0150 02CA

        SDBD                                    ; 6110   0001
        MVI@    R4,     R5                      ; 6111   02A5
        SDBD                                    ; 6112   0001
        CMPI    #$6C6B, R5                      ; 6113   037D 006B 006C
        BLT     L_6180                          ; 6116   0205 0068

        SDBD                                    ; 6118   0001
        CMPI    #$6CEB, R5                      ; 6119   037D 00EB 006C
        BGT     L_6180                          ; 611C   020E 0062

        MVI     G_018E, R1                      ; 611E   0281 018E
        DECR    R1                              ; 6120   0011
        BMI     L_6127                          ; 6121   020B 0004

        MVO     R1,     G_018E                  ; 6123   0241 018E
        B       L_6180                          ; 6125   0200 0059

L_6127:
        MVII    #$000E, R1                      ; 6127   02B9 000E
        MVO     R1,     G_018E                  ; 6129   0241 018E

        JSR     R5,     L_632E                  ; 612B   0004 0160 032E

        BNC     L_6180                          ; 612E   0209 0050

        MVII    #$0002, R0                      ; 6130   02B8 0002
        MVII    #$0335, R4                      ; 6132   02BC 0335
L_6134:
        CMPR    R4,     R2                      ; 6134   0162
        BEQ     L_6180                          ; 6135   0204 0049

        ADDI    #$0010, R4                      ; 6137   02FC 0010
        DECR    R0                              ; 6139   0010
        BPL     L_6134                          ; 613A   0223 0007

        MVII    #$023B, R4                      ; 613C   02BC 023B
        MVII    #$0018, R5                      ; 613E   02BD 0018
        MVII    #$0008, R0                      ; 6140   02B8 0008
L_6142:
        MVI@    R4,     R1                      ; 6142   02A1
        ADDI    #$0013, R4                      ; 6143   02FC 0013
        TSTR    R1                              ; 6145   0089
        BEQ     L_614F                          ; 6146   0204 0007

        ADDI    #$0008, R5                      ; 6148   02FD 0008
        DECR    R0                              ; 614A   0010
        BPL     L_6142                          ; 614B   0223 000A
        B       L_6180                          ; 614D   0200 0031

L_614F:
        PSHR    R5                              ; 614F   0275
        MVII    #$0098, R3                      ; 6150   02BB 0098
        PSHR    R3                              ; 6152   0273
        SDBD                                    ; 6153   0001
        MVII    #$589B, R1                      ; 6154   02B9 009B 0058

        JSR     R5,     L_635C                  ; 6157   0004 0160 035C

        ADDI    #$0009, R1                      ; 615A   02F9 0009
        MVI@    R1,     R4                      ; 615C   028C
        TSTR    R4                              ; 615D   00A4
        BNEQ    L_6180                          ; 615E   020C 0020

        DECR    R1                              ; 6160   0011
        SWAP    R3,     1                       ; 6161   0043
        PSHR    R3                              ; 6162   0273
        SWAP    R2,     1                       ; 6163   0042
        PSHR    R2                              ; 6164   0272
        MOVR    R1,     R2                      ; 6165   008A
        SDBD                                    ; 6166   0001
        MVII    #$58AB, R1                      ; 6167   02B9 00AB 0058

        JSR     R5,     L_635C                  ; 616A   0004 0160 035C

        MVII    #$0088, R2                      ; 616D   02BA 0088
        SWAP    R2,     1                       ; 616F   0042
        MVI     G_0320, R3                      ; 6170   0283 0320
        SWAP    R3,     1                       ; 6172   0043
        ANDI    #$007F, R3                      ; 6173   03BB 007F
        XORR    R3,     R2                      ; 6175   01DA
        MVII    #$0010, R3                      ; 6176   02BB 0010
        SUBI    #$0008, R1                      ; 6178   0339 0008

        JSR     R5,     .EXEC.9A1               ; 617A   0004 0118 01A1
        JSR     R5,     L_661D                  ; 617D   0004 0164 021D

L_6180:
        MVI     G_0160, R1                      ; 6180   0281 0160
        CMPI    #$0005, R1                      ; 6182   0379 0005
        BNEQ    L_6195                          ; 6184   020C 000F

        JSR     R5,     L_6653                  ; 6186   0004 0164 0253

        MVII    #$00C7, R0                      ; 6189   02B8 00C7
        MVII    #$0228, R4                      ; 618B   02BC 0228
L_618D:
        MVI@    R4,     R1                      ; 618D   02A1
        XORI    #$0007, R1                      ; 618E   03F9 0007
        DECR    R4                              ; 6190   0014
        MVO@    R1,     R4                      ; 6191   0261
        DECR    R0                              ; 6192   0010
        BPL     L_618D                          ; 6193   0223 0007

L_6195:
        MVI     G_019C, R2                      ; 6195   0282 019C
        TSTR    R2                              ; 6197   0092
        BEQ     L_61BD                          ; 6198   0204 0023

        MVI     G_0187, R1                      ; 619A   0281 0187
        TSTR    R1                              ; 619C   0089
        BNEQ    L_61BD                          ; 619D   020C 001E

        MVO     R1,     G_019C                  ; 619F   0241 019C
        MVII    #$0183, R3                      ; 61A1   02BB 0183
        MVII    #$0010, R0                      ; 61A3   02B8 0010
        NEGR    R0                              ; 61A5   0020
        ADD     G_0163, R7                      ; 61A6   02C7 0163
        ADDR    R0,     R3                      ; 61A8   00C3
        MVII    #$000A, R4                      ; 61A9   02BC 000A
        MVII    #$0005, R0                      ; 61AB   02B8 0005
        ADD@    R3,     R2                      ; 61AD   02DA
L_61AE:
        CMPR    R4,     R2                      ; 61AE   0162
        BLT     L_61B5                          ; 61AF   0205 0004

        SUBR    R4,     R2                      ; 61B1   0122
        INCR    R1                              ; 61B2   0009
        B       L_61AE                          ; 61B3   0220 0006

L_61B5:
        MVO@    R2,     R3                      ; 61B5   025A
        DECR    R3                              ; 61B6   0013
        ADD@    R3,     R1                      ; 61B7   02D9
        MOVR    R1,     R2                      ; 61B8   008A
        CLRR    R1                              ; 61B9   01C9
        DECR    R0                              ; 61BA   0010
        BPL     L_61AE                          ; 61BB   0223 000E

L_61BD:
        MVI     G_0187, R2                      ; 61BD   0282 0187
        TSTR    R2                              ; 61BF   0092
        BNEQ    L_61DD                          ; 61C0   020C 001B

        MVII    #$0008, R1                      ; 61C2   02B9 0008

        JSR     R5,     L_52CA                  ; 61C4   0004 0150 02CA

        MVI@    R4,     R2                      ; 61C7   02A2
        MVII    #$0192, R3                      ; 61C8   02BB 0192
        MVII    #$000A, R4                      ; 61CA   02BC 000A
        MVII    #$0002, R0                      ; 61CC   02B8 0002
        CLRR    R1                              ; 61CE   01C9
L_61CF:
        CMPR    R4,     R2                      ; 61CF   0162
        BLT     L_61D6                          ; 61D0   0205 0004

        SUBR    R4,     R2                      ; 61D2   0122
        INCR    R1                              ; 61D3   0009
        B       L_61CF                          ; 61D4   0220 0006

L_61D6:
        MVO@    R2,     R3                      ; 61D6   025A
        DECR    R3                              ; 61D7   0013
        MOVR    R1,     R2                      ; 61D8   008A
        CLRR    R1                              ; 61D9   01C9
        DECR    R0                              ; 61DA   0010
        BPL     L_61CF                          ; 61DB   0223 000D

L_61DD:
        MVI     G_0162, R1                      ; 61DD   0281 0162
        CMPI    #$0003, R1                      ; 61DF   0379 0003
        BLE     L_6202                          ; 61E1   0206 001F

        MVO     R1,     G_011E                  ; 61E3   0241 011E
        MVI     G_019E, R1                      ; 61E5   0281 019E
        DECR    R1                              ; 61E7   0011
        BMI     L_61EE                          ; 61E8   020B 0004

        MVO     R1,     G_019E                  ; 61EA   0241 019E
        B       L_6202                          ; 61EC   0200 0014

L_61EE:
        MVII    #$000F, R1                      ; 61EE   02B9 000F
        MVO     R1,     G_019E                  ; 61F0   0241 019E
        MVII    #$000F, R0                      ; 61F2   02B8 000F

        JSR     R5,     X_RAND2                 ; 61F4   0004 0114 029E

        PSHR    R0                              ; 61F7   0270
        CLRR    R1                              ; 61F8   01C9

        JSR     R5,     L_55CA                  ; 61F9   0004 0154 01CA

        PULR    R0                              ; 61FC   02B0
        ANDI    #$0001, R0                      ; 61FD   03B8 0001

        JSR     R5,     L_5648                  ; 61FF   0004 0154 0248

L_6202:
        MVI     G_011E, R1                      ; 6202   0281 011E
        CMPI    #$0002, R1                      ; 6204   0379 0002
        BGT     L_6211                          ; 6206   020E 0009

        INCR    R7                              ; 6208   000F
L_6209:
        PSHR    R5                              ; 6209   0275
        SDBD                                    ; 620A   0001
        MVII    #$5027, R1                      ; 620B   02B9 0027 0050

        JSR     R5,     X_TIMER_START           ; 620E   0004 0118 0044

L_6211:
        MVI     G_0199, R1                      ; 6211   0281 0199
        TSTR    R1                              ; 6213   0089
        BEQ     L_622A                          ; 6214   0204 0014

        MVI     G_031F, R2                      ; 6216   0282 031F
        SDBD                                    ; 6218   0001
        ADDI    #$0800, R2                      ; 6219   02FA 0000 0008
        MVO     R2,     G_032F                  ; 621C   0242 032F
        MVO     R2,     G_0337                  ; 621E   0242 0337
        MVI     G_0320, R2                      ; 6220   0282 0320
        SDBD                                    ; 6222   0001
        ADDI    #$0600, R2                      ; 6223   02FA 0000 0006
        MVO     R2,     G_0330                  ; 6226   0242 0330
        MVO     R2,     G_0338                  ; 6228   0242 0338
L_622A:
        PULR    R7                              ; 622A   02B7
L_622B:
        MVI     G_01A2, R4                      ; 622B   0284 01A2
        DECR    R4                              ; 622D   0014
        BMI     L_6234                          ; 622E   020B 0004

L_6230:
        MVO     R4,     G_01A2                  ; 6230   0244 01A2
        B       L_600C                          ; 6232   0220 0227

L_6234:
        JSR     R4,     L_6342                  ; 6234   0004 0060 0342

        ANDI    #$0002, R0                      ; 6237   03B8 0002
        BEQ     L_600C                          ; 6239   0224 022E

        PSHR    R3                              ; 623B   0273
        PSHR    R2                              ; 623C   0272
        PSHR    R5                              ; 623D   0275

        JSR     R5,     L_632E                  ; 623E   0004 0160 032E

        PULR    R5                              ; 6241   02B5
        BC      L_6248                          ; 6242   0201 0004

        SUBI    #$0002, R6                      ; 6244   033E 0002
        B       L_600C                          ; 6246   0220 023B

L_6248:
        DECR    R5                              ; 6248   0015
        CLRR    R1                              ; 6249   01C9
        MVO@    R1,     R5                      ; 624A   0269
        SDBD                                    ; 624B   0001
        MVII    #$592B, R1                      ; 624C   02B9 002B 0059

        JSR     R5,     L_635C                  ; 624F   0004 0160 035C

        MVII    #$0028, R3                      ; 6252   02BB 0028
        XORI    #$0010, R2                      ; 6254   03FA 0010

        JSR     R5,     .EXEC.9A1               ; 6256   0004 0118 01A1
        JSR     R5,     L_65ED                  ; 6259   0004 0164 01ED

        B       L_600C                          ; 625C   0220 0251

L_625E:
        MVI     G_01A2, R4                      ; 625E   0284 01A2
        DECR    R4                              ; 6260   0014
        BMI     L_6267                          ; 6261   020B 0004

        MVO     R4,     G_01A2                  ; 6263   0244 01A2
        B       L_600C                          ; 6265   0220 025A

L_6267:
        JSR     R4,     L_6342                  ; 6267   0004 0060 0342

        ANDI    #$0040, R0                      ; 626A   03B8 0040
        BEQ     L_600C                          ; 626C   0224 0261

        PSHR    R3                              ; 626E   0273
        PSHR    R2                              ; 626F   0272
        PSHR    R5                              ; 6270   0275

        JSR     R5,     L_632E                  ; 6271   0004 0160 032E

        PULR    R5                              ; 6274   02B5
        BC      L_627B                          ; 6275   0201 0004

        SUBI    #$0002, R6                      ; 6277   033E 0002
        B       L_600C                          ; 6279   0220 026E

L_627B:
        DECR    R5                              ; 627B   0015
        CLRR    R1                              ; 627C   01C9
        MVO@    R1,     R5                      ; 627D   0269
        SDBD                                    ; 627E   0001
        MVII    #$5910, R1                      ; 627F   02B9 0010 0059

        JSR     R5,     L_635C                  ; 6282   0004 0160 035C

        MVII    #$0020, R3                      ; 6285   02BB 0020
        XORI    #$0068, R2                      ; 6287   03FA 0068

        JSR     R5,     .EXEC.9A1               ; 6289   0004 0118 01A1
        JSR     R5,     L_661D                  ; 628C   0004 0164 021D

        B       L_600C                          ; 628F   0220 0284

L_6291:
        MVI     G_01A2, R4                      ; 6291   0284 01A2
        DECR    R4                              ; 6293   0014
        BMI     L_629A                          ; 6294   020B 0004

        MVO     R4,     G_01A2                  ; 6296   0244 01A2
        B       L_600C                          ; 6298   0220 028D

L_629A:
        JSR     R4,     L_6342                  ; 629A   0004 0060 0342

        ANDI    #$0004, R0                      ; 629D   03B8 0004
        BEQ     L_600C                          ; 629F   0224 0294

        PSHR    R3                              ; 62A1   0273
        PSHR    R2                              ; 62A2   0272
        PSHR    R5                              ; 62A3   0275

        JSR     R5,     L_632E                  ; 62A4   0004 0160 032E

        PULR    R5                              ; 62A7   02B5
        BC      L_62AE                          ; 62A8   0201 0004

        SUBI    #$0002, R6                      ; 62AA   033E 0002
        B       L_600C                          ; 62AC   0220 02A1

L_62AE:
        MVII    #$0002, R4                      ; 62AE   02BC 0002
        ADDI    #$0193, R3                      ; 62B0   02FB 0193
        MVO@    R4,     R3                      ; 62B2   025C
        DECR    R5                              ; 62B3   0015
        CLRR    R1                              ; 62B4   01C9
        MVO@    R1,     R5                      ; 62B5   0269
        SDBD                                    ; 62B6   0001
        MVII    #$5946, R1                      ; 62B7   02B9 0046 0059

        JSR     R5,     L_635C                  ; 62BA   0004 0160 035C

        SWAP    R3,     1                       ; 62BD   0043
        SUBI    #$000C, R3                      ; 62BE   033B 000C
        ANDI    #$007F, R3                      ; 62C0   03BB 007F
        XORR    R3,     R2                      ; 62C2   01DA
        MVII    #$0030, R3                      ; 62C3   02BB 0030

        JSR     R5,     .EXEC.9A1               ; 62C5   0004 0118 01A1
        JSR     R5,     L_6635                  ; 62C8   0004 0164 0235

        B       L_600C                          ; 62CB   0220 02C0

L_62CD:
        PSHR    R1                              ; 62CD   0271
        MVI     G_018F, R1                      ; 62CE   0281 018F
        DECR    R1                              ; 62D0   0011
        BMI     L_62D8                          ; 62D1   020B 0005

        MVO     R1,     G_018F                  ; 62D3   0241 018F
        PULR    R1                              ; 62D5   02B1
        B       L_6004                          ; 62D6   0220 02D3

L_62D8:
        PULR    R1                              ; 62D8   02B1
        CLRR    R0                              ; 62D9   01C0
        MVII    #$0001, R1                      ; 62DA   02B9 0001
L_62DC:
        MVI     .BTAB.09,R4                     ; 62DC   0284 0209
        ANDR    R1,     R4                      ; 62DE   018C
        BEQ     L_62E9                          ; 62DF   0204 0008

        INCR    R0                              ; 62E1   0008
        SLL     R1,     1                       ; 62E2   0049
        CMPI    #$0002, R0                      ; 62E3   0378 0002
        BLE     L_62DC                          ; 62E5   0226 000A
        B       L_600C                          ; 62E7   0220 02DC

L_62E9:
        SLL     R0,     1                       ; 62E9   0048
        ADDR    R0,     R7                      ; 62EA   00C7
        B       L_62F1                          ; 62EB   0200 0004
        B       L_630E                          ; 62ED   0200 001F
        B       L_6315                          ; 62EF   0200 0024

L_62F1:
        PSHR    R0                              ; 62F1   0270
        PSHR    R3                              ; 62F2   0273
        PSHR    R2                              ; 62F3   0272

        JSR     R5,     L_632E                  ; 62F4   0004 0160 032E

        BC      L_62FD                          ; 62F7   0201 0004

        SUBI    #$0003, R6                      ; 62F9   033E 0003
        B       L_600C                          ; 62FB   0220 02F0

L_62FD:
        ADDI    #$0002, R3                      ; 62FD   02FB 0002
        MVO     R3,     .BTAB.13                ; 62FF   0243 0213
        SDBD                                    ; 6301   0001
        MVII    #$5961, R1                      ; 6302   02B9 0061 0059

        JSR     R5,     L_635C                  ; 6305   0004 0160 035C

        MVI     .BTAB.13,R3                     ; 6308   0283 0213
        MVO     R3,     .BTAB.08                ; 630A   0243 0208
        B       L_631F                          ; 630C   0200 0011

L_630E:
        PSHR    R0                              ; 630E   0270
        MVII    #$020A, R5                      ; 630F   02BD 020A
        MVO@    R2,     R5                      ; 6311   026A
        MVO@    R3,     R5                      ; 6312   026B
        B       L_631F                          ; 6313   0200 000A

L_6315:
        PSHR    R0                              ; 6315   0270
        MVII    #$020C, R5                      ; 6316   02BD 020C
        MVO@    R2,     R5                      ; 6318   026A
        MVO@    R3,     R5                      ; 6319   026B

        JSR     R5,     L_636D                  ; 631A   0004 0160 036D

        B       L_6321                          ; 631D   0200 0002

L_631F:
        MVII    #$0003, R0                      ; 631F   02B8 0003
L_6321:
        MVO     R0,     G_018F                  ; 6321   0240 018F
        PULR    R0                              ; 6323   02B0
        SLR     R0,     1                       ; 6324   0060

        JSR     R5,     X_CLR_BIT               ; 6325   0004 0114 02E6

        BNC     L_632E                          ; 6328   0209 0004

        CMPR    R2,     R4                      ; 632A   0154
        MVII    #$0220, R4                      ; 632B   02BC 0220
        SUB@    R4,     R1                      ; 632D   0321
L_632E:
        MVII    #$032E, R2                      ; 632E   02BA 032E
        MVII    #$0005, R1                      ; 6330   02B9 0005
        CLRR    R3                              ; 6332   01DB
        CLRR    R4                              ; 6333   01E4
L_6334:
        CMP@    R2,     R4                      ; 6334   0354
        BEQ     L_633F                          ; 6335   0204 0008

        ADDI    #$0008, R2                      ; 6337   02FA 0008
        INCR    R3                              ; 6339   000B
        DECR    R1                              ; 633A   0011
        BPL     L_6334                          ; 633B   0223 0008

        CLRC                                    ; 633D   0006
        MOVR    R5,     R7                      ; 633E   00AF
L_633F:
        DECR    R2                              ; 633F   0012
        SETC                                    ; 6340   0007
        MOVR    R5,     R7                      ; 6341   00AF
L_6342:
        PSHR    R4                              ; 6342   0274
        PSHR    R3                              ; 6343   0273
        PSHR    R1                              ; 6344   0271
        MVII    #$0009, R1                      ; 6345   02B9 0009
        PSHR    R5                              ; 6347   0275

        JSR     R5,     L_52CA                  ; 6348   0004 0150 02CA

        PULR    R5                              ; 634B   02B5
        MVI@    R4,     R1                      ; 634C   02A1
        PSHR    R1                              ; 634D   0271
        SLL     R1,     1                       ; 634E   0049
        ADD@    R6,     R1                      ; 634F   02F1
        SDBD                                    ; 6350   0001
        MVII    #$6730, R4                      ; 6351   02BC 0030 0067
        ADDI    #$0002, R1                      ; 6354   02F9 0002
        ADDR    R1,     R4                      ; 6356   00CC
        MVI@    R4,     R1                      ; 6357   02A1
        MOVR    R1,     R0                      ; 6358   0088
        PULR    R1                              ; 6359   02B1
        PULR    R3                              ; 635A   02B3
        PULR    R7                              ; 635B   02B7
L_635C:
        PSHR    R5                              ; 635C   0275

        JSR     R5,     X_INIT_MOB              ; 635D   0004 0114 02B2

        PULR    R5                              ; 6360   02B5
        MOVR    R2,     R1                      ; 6361   0091
        PULR    R2                              ; 6362   02B2
        SWAP    R2,     1                       ; 6363   0042
        ADDI    #$0002, R1                      ; 6364   02F9 0002
        MVO@    R2,     R1                      ; 6366   024A
        INCR    R1                              ; 6367   0009
        PULR    R3                              ; 6368   02B3
        SWAP    R3,     1                       ; 6369   0043
        MVO@    R3,     R1                      ; 636A   024B
        SUBI    #$0003, R1                      ; 636B   0339 0003
L_636D:
        PSHR    R5                              ; 636D   0275
        MVI     G_0162, R0                      ; 636E   0280 0162
        NEGR    R0                              ; 6370   0020
        ADDI    #$0005, R0                      ; 6371   02F8 0005
        PSHR    R0                              ; 6373   0270
        SLL     R0,     2                       ; 6374   004C
        ADD@    R6,     R0                      ; 6375   02F0
        ADDI    #$000C, R0                      ; 6376   02F8 000C

        JSR     R5,     X_RAND2                 ; 6378   0004 0114 029E

        MVO     R0,     G_01A2                  ; 637B   0240 01A2
        PULR    R7                              ; 637D   02B7
L_637E:
        MVI     G_011B, R1                      ; 637E   0281 011B
        ANDI    #$0007, R1                      ; 6380   03B9 0007
        MOVR    R1,     R3                      ; 6382   008B
        SLL     R1,     1                       ; 6383   0049
        SLL     R1,     2                       ; 6384   004D
        ADDI    #$031D, R1                      ; 6385   02F9 031D
        MOVR    R1,     R4                      ; 6387   008C
        CMPI    #$0325, R1                      ; 6388   0379 0325
        BLE     L_638E                          ; 638A   0206 0002

        SETC                                    ; 638C   0007
        INCR    R7                              ; 638D   000F
L_638E:
        CLRC                                    ; 638E   0006
        MOVR    R5,     R7                      ; 638F   00AF
L_6390:
        MVII    #$03FF, R0                      ; 6390   02B8 03FF
L_6392:
        DECR    R0                              ; 6392   0010
        BPL     L_6392                          ; 6393   0223 0002

        DECR    R1                              ; 6395   0011
        BPL     L_6390                          ; 6396   0223 0007

        MOVR    R5,     R7                      ; 6398   00AF
        PSHR    R5                              ; 6399   0275

        JSR     R5,     L_637E                  ; 639A   0004 0160 037E

        BC      L_63A0                          ; 639D   0201 0001

        PULR    R7                              ; 639F   02B7
L_63A0:
        MVI     G_0320, R3                      ; 63A0   0283 0320
        SWAP    R3,     1                       ; 63A2   0043
        ANDI    #$007F, R3                      ; 63A3   03BB 007F
        MVII    #$0010, R0                      ; 63A5   02B8 0010

        JSR     R5,     X_RAND2                 ; 63A7   0004 0114 029E

        SARC    R0,     1                       ; 63AA   0078
        BNC     L_63AF                          ; 63AB   0209 0002

        SUBR    R0,     R3                      ; 63AD   0103
        INCR    R7                              ; 63AE   000F
L_63AF:
        ADDR    R0,     R3                      ; 63AF   00C3
        TSTR    R3                              ; 63B0   009B
        BPL     L_63B4                          ; 63B1   0203 0001

        NEGR    R3                              ; 63B3   0023
L_63B4:
        ANDI    #$007F, R3                      ; 63B4   03BB 007F
        CMPI    #$001C, R3                      ; 63B6   037B 001C
        BGT     L_63BC                          ; 63B8   020E 0002

        MVII    #$001C, R3                      ; 63BA   02BB 001C
L_63BC:
        ADDI    #$0002, R1                      ; 63BC   02F9 0002
        MVI@    R1,     R2                      ; 63BE   028A
        SUBI    #$0002, R1                      ; 63BF   0339 0002
        SDBD                                    ; 63C1   0001
        ANDI    #$FF00, R2                      ; 63C2   03BA 0000 00FF
        XORR    R3,     R2                      ; 63C5   01DA
        MVII    #$0028, R3                      ; 63C6   02BB 0028

        JSR     R5,     .EXEC.9A1               ; 63C8   0004 0118 01A1

        PULR    R7                              ; 63CB   02B7
        PSHR    R5                              ; 63CC   0275

        JSR     R5,     L_637E                  ; 63CD   0004 0160 037E

        BC      L_63D3                          ; 63D0   0201 0001

        PULR    R7                              ; 63D2   02B7
L_63D3:
        ADDI    #$0191, R3                      ; 63D3   02FB 0191
        MVI@    R3,     R2                      ; 63D5   029A
        DECR    R2                              ; 63D6   0012
        BMI     L_63FD                          ; 63D7   020B 0024

        MVO@    R2,     R3                      ; 63D9   025A
        CMPI    #$0001, R2                      ; 63DA   037A 0001
        BEQ     L_63F3                          ; 63DC   0204 0015

        PSHR    R1                              ; 63DE   0271
        CLRR    R0                              ; 63DF   01C0

        JSR     R5,     .EXEC.772               ; 63E0   0004 0114 0372

        PULR    R1                              ; 63E3   02B1
        PSHR    R1                              ; 63E4   0271
        CLRR    R2                              ; 63E5   01D2
        XORR    R3,     R2                      ; 63E6   01DA
        MVII    #$0030, R3                      ; 63E7   02BB 0030

        JSR     R5,     .EXEC.9A1               ; 63E9   0004 0118 01A1

        PULR    R1                              ; 63EC   02B1
        ADDI    #$0006, R1                      ; 63ED   02F9 0006
        MVI@    R1,     R2                      ; 63EF   028A
        SLL     R2,     1                       ; 63F0   004A
        MVO@    R2,     R1                      ; 63F1   024A
        PULR    R7                              ; 63F2   02B7
L_63F3:
        ADDI    #$0004, R1                      ; 63F3   02F9 0004
        CLRR    R2                              ; 63F5   01D2
        MVO@    R2,     R1                      ; 63F6   024A
        ADDI    #$0002, R1                      ; 63F7   02F9 0002
        MVII    #$0007, R2                      ; 63F9   02BA 0007
        MVO@    R2,     R1                      ; 63FB   024A
        PULR    R7                              ; 63FC   02B7
L_63FD:
        INCR    R4                              ; 63FD   000C
        CLRR    R2                              ; 63FE   01D2
        MVO@    R2,     R4                      ; 63FF   0262
        PULR    R7                              ; 6400   02B7
        PSHR    R5                              ; 6401   0275

        JSR     R5,     L_637E                  ; 6402   0004 0160 037E

        BC      L_6408                          ; 6405   0201 0001

        PULR    R7                              ; 6407   02B7
L_6408:
        ADDI    #$0191, R3                      ; 6408   02FB 0191
        MVI@    R3,     R2                      ; 640A   029A
        DECR    R2                              ; 640B   0012
        BMI     L_6469                          ; 640C   020B 005B

        MVO@    R2,     R3                      ; 640E   025A
        CMPI    #$0001, R2                      ; 640F   037A 0001
        BNEQ    L_643E                          ; 6411   020C 002B

        ADDI    #$0002, R1                      ; 6413   02F9 0002
        MVI@    R1,     R2                      ; 6415   028A
        SWAP    R2,     1                       ; 6416   0042
        ANDI    #$00FF, R2                      ; 6417   03BA 00FF
        INCR    R1                              ; 6419   0009
        MVI@    R1,     R3                      ; 641A   028B
        SWAP    R3,     1                       ; 641B   0043
        ANDI    #$007F, R3                      ; 641C   03BB 007F
        MVII    #$0020, R4                      ; 641E   02BC 0020
        MVI     G_035E, R0                      ; 6420   0280 035E
        SARC    R0,     1                       ; 6422   0078
        BC      L_6426                          ; 6423   0201 0001

        NEGR    R4                              ; 6425   0024
L_6426:
        ADDR    R4,     R2                      ; 6426   00E2
        BPL     L_642A                          ; 6427   0203 0001

        CLRR    R2                              ; 6429   01D2
L_642A:
        ANDI    #$00FF, R2                      ; 642A   03BA 00FF
        SWAP    R2,     1                       ; 642C   0042
        SUBI    #$0020, R3                      ; 642D   033B 0020
        BPL     L_6433                          ; 642F   0203 0002

        MVII    #$0018, R3                      ; 6431   02BB 0018
L_6433:
        ANDI    #$007F, R3                      ; 6433   03BB 007F
        XORR    R3,     R2                      ; 6435   01DA
        MVII    #$0030, R3                      ; 6436   02BB 0030
        SUBI    #$0003, R1                      ; 6438   0339 0003

        JSR     R5,     .EXEC.9A1               ; 643A   0004 0118 01A1

        PULR    R7                              ; 643D   02B7
L_643E:
        ADDI    #$0004, R1                      ; 643E   02F9 0004
        MVI@    R1,     R2                      ; 6440   028A
        MVII    #$0020, R3                      ; 6441   02BB 0020
        SDBD                                    ; 6443   0001
        ANDI    #$FF00, R2                      ; 6444   03BA 0000 00FF
        BPL     L_644A                          ; 6447   0203 0001

        NEGR    R3                              ; 6449   0023
L_644A:
        SUBI    #$0002, R1                      ; 644A   0339 0002
        MVI@    R1,     R2                      ; 644C   028A
        SWAP    R2,     1                       ; 644D   0042
        ANDI    #$00FF, R2                      ; 644E   03BA 00FF
        ADDR    R3,     R2                      ; 6450   00DA
        ANDI    #$00FF, R2                      ; 6451   03BA 00FF
        CMPI    #$00B0, R2                      ; 6453   037A 00B0
        BLT     L_6458                          ; 6455   0205 0001

        CLRR    R2                              ; 6457   01D2
L_6458:
        SWAP    R2,     1                       ; 6458   0042
        XORI    #$0068, R2                      ; 6459   03FA 0068
L_645B:
        MVII    #$0030, R3                      ; 645B   02BB 0030
        SUBI    #$0002, R1                      ; 645D   0339 0002
        MVI@    R1,     R4                      ; 645F   028C
        SDBD                                    ; 6460   0001
        XORI    #$0400, R4                      ; 6461   03FC 0000 0004
        MVO@    R4,     R1                      ; 6464   024C

        JSR     R5,     .EXEC.9A1               ; 6465   0004 0118 01A1

L_6468:
        PULR    R7                              ; 6468   02B7
L_6469:
        INCR    R4                              ; 6469   000C
        CLRR    R1                              ; 646A   01C9
L_646B:
        MVO@    R1,     R4                      ; 646B   0261
        PULR    R7                              ; 646C   02B7
        PSHR    R5                              ; 646D   0275

        JSR     R5,     L_637E                  ; 646E   0004 0160 037E

        BC      L_6474                          ; 6471   0201 0001

        PULR    R7                              ; 6473   02B7
L_6474:
        ADDI    #$0191, R3                      ; 6474   02FB 0191
        CLRR    R2                              ; 6476   01D2
        MVO@    R2,     R3                      ; 6477   025A
        INCR    R4                              ; 6478   000C
        MVO@    R2,     R4                      ; 6479   0262
        PULR    R7                              ; 647A   02B7
        PSHR    R5                              ; 647B   0275

        JSR     R5,     L_637E                  ; 647C   0004 0160 037E

        BC      L_6482                          ; 647F   0201 0001

        PULR    R7                              ; 6481   02B7
L_6482:
        CLRR    R2                              ; 6482   01D2
        INCR    R4                              ; 6483   000C
        MVO@    R2,     R4                      ; 6484   0262
        MVO     R2,     G_0199                  ; 6485   0242 0199
        INCR    R2                              ; 6487   000A
        MVO     R2,     G_0185                  ; 6488   0242 0185
        MVO     R2,     G_019A                  ; 648A   0242 019A
        PULR    R7                              ; 648C   02B7
        PSHR    R5                              ; 648D   0275
L_648E:
        MVI     G_0199, R1                      ; 648E   0281 0199
        TSTR    R1                              ; 6490   0089
        BNEQ    L_649B                          ; 6491   020C 0008

        MVII    #$0003, R1                      ; 6493   02B9 0003
        MVO     R1,     G_0199                  ; 6495   0241 0199
        MVO     R1,     G_019A                  ; 6497   0241 019A
        MVO     R1,     G_0185                  ; 6499   0241 0185
L_649B:
        PULR    R7                              ; 649B   02B7
        PSHR    R5                              ; 649C   0275

        JSR     R5,     L_637E                  ; 649D   0004 0160 037E

        BC      L_64A3                          ; 64A0   0201 0001

        PULR    R7                              ; 64A2   02B7
L_64A3:
        SUBI    #$0007, R1                      ; 64A3   0339 0007
        MVI@    R1,     R2                      ; 64A5   028A
        SDBD                                    ; 64A6   0001
        CMPI    #$58BB, R2                      ; 64A7   037A 00BB 0058
        BNEQ    L_64BF                          ; 64AA   020C 0013

        SUBI    #$0006, R4                      ; 64AC   033C 0006
        MVI@    R4,     R2                      ; 64AE   02A2
        SWAP    R2,     1                       ; 64AF   0042
        MVI@    R4,     R3                      ; 64B0   02A3
        SWAP    R3,     1                       ; 64B1   0043
        PSHR    R3                              ; 64B2   0273
        PSHR    R2                              ; 64B3   0272
        MOVR    R1,     R2                      ; 64B4   008A
        ADDI    #$0007, R2                      ; 64B5   02FA 0007
        SDBD                                    ; 64B7   0001
        MVII    #$58AB, R1                      ; 64B8   02B9 00AB 0058

        JSR     R5,     L_635C                  ; 64BB   0004 0160 035C

        PULR    R7                              ; 64BE   02B7
L_64BF:
        INCR    R4                              ; 64BF   000C
        CLRR    R1                              ; 64C0   01C9
        MVO@    R1,     R4                      ; 64C1   0261
        PULR    R7                              ; 64C2   02B7
        PSHR    R5                              ; 64C3   0275
        CLRR    R1                              ; 64C4   01C9
        MVO     R1,     .BTAB.08                ; 64C5   0241 0208

        JSR     R5,     L_637E                  ; 64C7   0004 0160 037E

        BC      L_64CD                          ; 64CA   0201 0001

        PULR    R7                              ; 64CC   02B7
L_64CD:
        INCR    R4                              ; 64CD   000C
        CLRR    R1                              ; 64CE   01C9
        MVO@    R1,     R4                      ; 64CF   0261
        MVII    #$0208, R4                      ; 64D0   02BC 0208
        MVII    #$0008, R0                      ; 64D2   02B8 0008

        JSR     R5,     X_FILL_ZERO             ; 64D4   0004 0114 0338

        PULR    R7                              ; 64D7   02B7
        PSHR    R5                              ; 64D8   0275

        JSR     R5,     L_637E                  ; 64D9   0004 0160 037E

        INCR    R4                              ; 64DC   000C
        CLRR    R3                              ; 64DD   01DB
        MVO@    R3,     R4                      ; 64DE   0263
        CMPI    #$0325, R1                      ; 64DF   0379 0325
        BGT     L_64E7                          ; 64E1   020E 0004

        MVII    #$0006, R1                      ; 64E3   02B9 0006
        MVO     R1,     G_0160                  ; 64E5   0241 0160
L_64E7:
        PULR    R7                              ; 64E7   02B7
L_64E8:
        CLRR    R1                              ; 64E8   01C9
        B       L_64ED                          ; 64E9   0200 0002

        MVII    #$0005, R1                      ; 64EB   02B9 0005
L_64ED:
        MVII    #$0006, R0                      ; 64ED   02B8 0006
        B       L_64FD                          ; 64EF   0200 000C

        MVII    #$0005, R1                      ; 64F1   02B9 0005
        B       L_64F7                          ; 64F3   0200 0002

        MVII    #$0003, R1                      ; 64F5   02B9 0003
L_64F7:
        CLRR    R0                              ; 64F7   01C0
        B       L_64FD                          ; 64F8   0200 0003

        MVII    #$0001, R1                      ; 64FA   02B9 0001
        CLRR    R0                              ; 64FC   01C0
L_64FD:
        PSHR    R5                              ; 64FD   0275
        PSHR    R1                              ; 64FE   0271

        JSR     R5,     L_637E                  ; 64FF   0004 0160 037E

        BC      L_6506                          ; 6502   0201 0002

        PULR    R1                              ; 6504   02B1
        PULR    R7                              ; 6505   02B7
L_6506:
        MOVR    R1,     R5                      ; 6506   008D
        ADDI    #$0002, R4                      ; 6507   02FC 0002
        PSHR    R4                              ; 6509   0274
        MVI@    R4,     R1                      ; 650A   02A1
        PSHR    R1                              ; 650B   0271
        MVI@    R4,     R1                      ; 650C   02A1
        PSHR    R1                              ; 650D   0271
        ADDR    R0,     R7                      ; 650E   00C7
        SDBD                                    ; 650F   0001
        MVII    #$59B1, R4                      ; 6510   02BC 00B1 0059
        B       L_6519                          ; 6513   0200 0004

        SDBD                                    ; 6515   0001
        MVII    #$59C1, R4                      ; 6516   02BC 00C1 0059
L_6519:
        MVII    #$0007, R1                      ; 6519   02B9 0007
L_651B:
        SDBD                                    ; 651B   0001
        MVI@    R4,     R2                      ; 651C   02A2
        MVO@    R2,     R5                      ; 651D   026A
        DECR    R1                              ; 651E   0011
        BPL     L_651B                          ; 651F   0223 0005

        PULR    R3                              ; 6521   02B3
        PULR    R2                              ; 6522   02B2
        PULR    R4                              ; 6523   02B4
        MVO@    R2,     R4                      ; 6524   0262
        MVO@    R3,     R4                      ; 6525   0263
        SUBI    #$0004, R4                      ; 6526   033C 0004
        MVO     R4,     G_01E3                  ; 6528   0244 01E3
        MOVR    R4,     R1                      ; 652A   00A1
        PULR    R0                              ; 652B   02B0
        MVI@    R1,     R4                      ; 652C   028C
        XORR    R0,     R4                      ; 652D   01C4
        MVO@    R4,     R1                      ; 652E   024C

        JSR     R5,     L_5D0F                  ; 652F   0004 015C 010F
        JSR     R5,     L_5D20                  ; 6532   0004 015C 0120

        PULR    R7                              ; 6535   02B7
L_6536:
        PSHR    R5                              ; 6536   0275

        JSR     R5,     X_PLAY_SFX1             ; 6537   0004 0118 03BB

        RRC     R3,     2                       ; 653A   0077
        SLR     R0,     1                       ; 653B   0060
        SLR     R2,     2                       ; 653C   0066
        SLL     R3,     2                       ; 653D   004F
        DECR    R6                              ; 653E   0016
        SARC    R1,     1                       ; 653F   0079
        INCR    R3                              ; 6540   000B
        AND@    R6,     R7                      ; 6541   03B7
        XOR@    R6,     R5                      ; 6542   03F5
        XOR@    R5,     R5                      ; 6543   03ED
        ADDR    R0,     R7                      ; 6544   00C7
        NEGR    R3                              ; 6545   0023
        XOR@    R6,     R4                      ; 6546   03F4
        RRC     R3,     2                       ; 6547   0077
        SLR     R2,     2                       ; 6548   0066
        SLR     R2,     2                       ; 6549   0066
        CLRR    R0                              ; 654A   01C0
        MVO     R0,     G_0321                  ; 654B   0240 0321
        MOVR    R5,     R7                      ; 654D   00AF
        MVII    #$032E, R2                      ; 654E   02BA 032E
        B       L_6564                          ; 6550   0200 0012

        MVII    #$0336, R2                      ; 6552   02BA 0336
        B       L_6564                          ; 6554   0200 000E

        MVII    #$033E, R2                      ; 6556   02BA 033E
        B       L_6564                          ; 6558   0200 000A

        MVII    #$0346, R2                      ; 655A   02BA 0346
        B       L_6564                          ; 655C   0200 0006

        MVII    #$034E, R2                      ; 655E   02BA 034E
        B       L_6564                          ; 6560   0200 0002

        MVII    #$0356, R2                      ; 6562   02BA 0356
L_6564:
        PSHR    R5                              ; 6564   0275
        MVI@    R2,     R1                      ; 6565   0291
        SDBD                                    ; 6566   0001
        CMPI    #$59D1, R1                      ; 6567   0379 00D1 0059
        BGE     L_65E7                          ; 656A   020D 007B

        SDBD                                    ; 656C   0001
        CMPI    #$5889, R1                      ; 656D   0379 0089 0058
        BLE     L_648E                          ; 6570   0226 00E3

        INCR    R7                              ; 6572   000F
        PSHR    R5                              ; 6573   0275
        MVI     G_0162, R0                      ; 6574   0280 0162
        CMPI    #$0004, R0                      ; 6576   0378 0004
        BLT     L_65B7                          ; 6578   0205 003D

L_657A:
        MVI     G_019D, R1                      ; 657A   0281 019D
L_657C:
        DECR    R1                              ; 657C   0011
        BMI     L_658E                          ; 657D   020B 000F

        MVO     R1,     G_019D                  ; 657F   0241 019D
        MVI     G_0320, R1                      ; 6581   0281 0320
L_6583:
        SWAP    R1,     1                       ; 6583   0041
        ANDI    #$007F, R1                      ; 6584   03B9 007F
        CMPI    #$0028, R1                      ; 6586   0379 0028
        BGT     L_658E                          ; 6588   020E 0004

        MVII    #$000C, R0                      ; 658A   02B8 000C
        B       L_6590                          ; 658C   0200 0002

L_658E:
        MVII    #$0004, R0                      ; 658E   02B8 0004
L_6590:
        CLRR    R1                              ; 6590   01C9

        JSR     R5,     L_55CA                  ; 6591   0004 0154 01CA

        MVI     G_0321, R0                      ; 6594   0280 0321
        ANDI    #$00FF, R0                      ; 6596   03B8 00FF

        JSR     R5,     X_EXT_SIGN_LO           ; 6598   0004 0114 0268

        ADD     G_0320, R0                      ; 659B   02C0 0320
        MVO     R0,     G_0320                  ; 659D   0240 0320
        MVII    #$0001, R3                      ; 659F   02BB 0001
        MVO     R3,     G_019D                  ; 65A1   0243 019D
        PULR    R7                              ; 65A3   02B7
        PSHR    R5                              ; 65A4   0275
        MVI     G_0162, R0                      ; 65A5   0280 0162
        CMPI    #$0004, R0                      ; 65A7   0378 0004
        BEQ     L_657A                          ; 65A9   0224 0030

        MVI     G_019D, R1                      ; 65AB   0281 019D
        NEGR    R0                              ; 65AD   0020
        ADDI    #$0004, R0                      ; 65AE   02F8 0004
        INCR    R1                              ; 65B0   0009
        CMPR    R0,     R1                      ; 65B1   0141
        BEQ     L_65B7                          ; 65B2   0204 0003

        MVO     R1,     G_019D                  ; 65B4   0241 019D
        PULR    R7                              ; 65B6   02B7
L_65B7:
        CLRR    R0                              ; 65B7   01C0
        MVO     R0,     G_019D                  ; 65B8   0240 019D
        MVI     G_031F, R0                      ; 65BA   0280 031F
        PSHR    R0                              ; 65BC   0270
        MVI     G_0320, R0                      ; 65BD   0280 0320
        PSHR    R0                              ; 65BF   0270
        MVII    #$0002, R0                      ; 65C0   02B8 0002
        SDBD                                    ; 65C2   0001
        MVII    #$59B1, R1                      ; 65C3   02B9 00B1 0059
        MVII    #$031D, R2                      ; 65C6   02BA 031D

        JSR     R5,     X_INIT_MOBS             ; 65C8   0004 0114 02B4

        MVII    #$031D, R4                      ; 65CB   02BC 031D
        MVI@    R4,     R1                      ; 65CD   02A1
        XORI    #$0003, R1                      ; 65CE   03F9 0003
        DECR    R4                              ; 65D0   0014
        MVO@    R1,     R4                      ; 65D1   0261
        PULR    R3                              ; 65D2   02B3
        PULR    R2                              ; 65D3   02B2
        INCR    R4                              ; 65D4   000C
        MVO@    R2,     R4                      ; 65D5   0262
        MVO@    R3,     R4                      ; 65D6   0263
L_65D7:
        ADDI    #$0002, R4                      ; 65D7   02FC 0002
        MVII    #$002D, R1                      ; 65D9   02B9 002D
        MVO@    R1,     R4                      ; 65DB   0261
        ADDI    #$0003, R4                      ; 65DC   02FC 0003
        MVO@    R2,     R4                      ; 65DE   0262
        MVO@    R3,     R4                      ; 65DF   0263
        ADDI    #$0002, R4                      ; 65E0   02FC 0002
        MVO@    R1,     R4                      ; 65E2   0261
        MVII    #$0005, R0                      ; 65E3   02B8 0005
        MVO     R0,     G_0160                  ; 65E5   0240 0160
L_65E7:
        PULR    R7                              ; 65E7   02B7
L_65E8:
        PSHR    R5                              ; 65E8   0275

        JSR     R5,     X_PLAY_SFX1             ; 65E9   0004 0118 03BB

        ADD@    R1,     R7                      ; 65EC   02CF
L_65ED:
        PSHR    R5                              ; 65ED   0275

        JSR     R5,     X_PLAY_SFX1             ; 65EE   0004 0118 03BB

        RRC     R3,     2                       ; 65F1   0077
        SLR     R0,     1                       ; 65F2   0060
        SLR     R2,     2                       ; 65F3   0066
        SARC    R1,     1                       ; 65F4   0079
        BGE     L_69AE                          ; 65F5   020D 03B7

        SUBR    R1,     R3                      ; 65F7   010B
        ADDR    R3,     R4                      ; 65F8   00DC
        CMPR    R4,     R0                      ; 65F9   0160
        MOVR    R1,     R7                      ; 65FA   008F
        SARC    R0,     1                       ; 65FB   0078
        RRC     R3,     2                       ; 65FC   0077
        SLR     R2,     2                       ; 65FD   0066
        SLR     R2,     2                       ; 65FE   0066
L_65FF:
        PSHR    R5                              ; 65FF   0275

        JSR     R5,     X_PLAY_SFX1             ; 6600   0004 0118 03BB

        RRC     R3,     2                       ; 6603   0077
        SLR     R0,     1                       ; 6604   0060
        SLR     R2,     2                       ; 6605   0066
        AND@    R1,     R1                      ; 6606   0389
        SWAP    R0,     1                       ; 6607   0040
        SARC    R2,     2                       ; 6608   007E
        SLL     R0,     1                       ; 6609   0048
        SARC    R2,     2                       ; 660A   007E
        SAR     R0,     2                       ; 660B   006C
        SUB@    R6,     R0                      ; 660C   0330
        MVI@    R1,     R3                      ; 660D   028B
        DECLE   $0001                           ; 660E   0001

        RSWD    R2                              ; 660F   003A
        DECLE   $0001                           ; 6610   0001

        RSWD    R0                              ; 6611   0038
        MOVR    R1,     R7                      ; 6612   008F
        RSWD    R4                              ; 6613   003C
        SDBD                                    ; 6614   0001
        XOR@    R1,     R2                      ; 6615   03CA
        SDBD                                    ; 6616   0001
        XOR@    R1,     R0                      ; 6617   03C8
        MOVR    R1,     R7                      ; 6618   008F
        RSWD    R4                              ; 6619   003C
        RRC     R3,     2                       ; 661A   0077
        SLR     R2,     2                       ; 661B   0066
        SLR     R2,     2                       ; 661C   0066
L_661D:
        PSHR    R5                              ; 661D   0275

        JSR     R5,     X_PLAY_SFX1             ; 661E   0004 0118 03BB

        RRC     R3,     2                       ; 6621   0077
        SLR     R0,     1                       ; 6622   0060
        SLR     R2,     2                       ; 6623   0066
        AND@    R1,     R1                      ; 6624   0389
        SWAP    R0,     1                       ; 6625   0040
        SARC    R2,     2                       ; 6626   007E
        SWAP    R0,     1                       ; 6627   0040
        RSWD    R6                              ; 6628   003E
        MOVR    R5,     R4                      ; 6629   00AC
        ADDR    R1,     R0                      ; 662A   00C8
        INCR    R3                              ; 662B   000B
        DECLE   $0001                           ; 662C   0001

        RSWD    R2                              ; 662D   003A
        DECLE   $0001                           ; 662E   0001

        RSWD    R0                              ; 662F   0038
        MOVR    R1,     R7                      ; 6630   008F
        SLLC    R2,     1                       ; 6631   005A
        RRC     R3,     2                       ; 6632   0077
        SLR     R2,     2                       ; 6633   0066
        SLR     R2,     2                       ; 6634   0066
L_6635:
        PSHR    R5                              ; 6635   0275

        JSR     R5,     X_PLAY_SFX1             ; 6636   0004 0118 03BB

        RRC     R3,     2                       ; 6639   0077
        SLR     R0,     1                       ; 663A   0060
        SLR     R2,     2                       ; 663B   0066
        AND@    R1,     R1                      ; 663C   0389
        SWAP    R0,     1                       ; 663D   0040
        SARC    R2,     2                       ; 663E   007E
        SLL     R0,     1                       ; 663F   0048
        SARC    R2,     2                       ; 6640   007E
        ADDR    R5,     R4                      ; 6641   00EC
        ANDR    R3,     R0                      ; 6642   0198
        MVI@    R1,     R3                      ; 6643   028B
        DECLE   $0001                           ; 6644   0001

        RSWD    R2                              ; 6645   003A
        DECLE   $0001                           ; 6646   0001

        RSWD    R0                              ; 6647   0038
        MOVR    R1,     R7                      ; 6648   008F
        SARC    R0,     1                       ; 6649   0078
        SDBD                                    ; 664A   0001
        XOR@    R1,     R2                      ; 664B   03CA
        SDBD                                    ; 664C   0001
        XOR@    R1,     R0                      ; 664D   03C8
        MOVR    R1,     R7                      ; 664E   008F
        SARC    R0,     1                       ; 664F   0078
        RRC     R3,     2                       ; 6650   0077
        SLR     R2,     2                       ; 6651   0066
        SLR     R2,     2                       ; 6652   0066
L_6653:
        PSHR    R5                              ; 6653   0275

        JSR     R5,     X_PLAY_SFX1             ; 6654   0004 0118 03BB

        SLL     R3,     2                       ; 6657   004F
        GSWD    R2                              ; 6658   0032
        SARC    R1,     1                       ; 6659   0079
        XOR@    R5,     R5                      ; 665A   03ED
        XOR@    R6,     R5                      ; 665B   03F5
        ADDR    R0,     R7                      ; 665C   00C7
        NEGR    R3                              ; 665D   0023
        XOR@    R6,     R4                      ; 665E   03F4
        ADD@    R1,     R7                      ; 665F   02CF
L_6660:
        PSHR    R4                              ; 6660   0274

        JSR     R5,     .EXEC.A83               ; 6661   0004 0118 0283

        PULR    R4                              ; 6664   02B4
        PULR    R7                              ; 6665   02B7
        PULR    R4                              ; 6666   02B4

        JSR     R5,     L_5295                  ; 6667   0004 0150 0295

        PULR    R7                              ; 666A   02B7
        PULR    R4                              ; 666B   02B4
        PULR    R7                              ; 666C   02B7
        ADDR    R7,     R5                      ; 666D   00FD
        ADDR    R7,     R1                      ; 666E   00F9
        ADDR    R5,     R1                      ; 666F   00E9
        ADDR    R5,     R3                      ; 6670   00EB
        ADDR    R7,     R3                      ; 6671   00FB
        ADDR    R6,     R3                      ; 6672   00F3
        ADDR    R4,     R3                      ; 6673   00E3
        ADDR    R4,     R7                      ; 6674   00E7
        ADDR    R6,     R7                      ; 6675   00F7
        ADDR    R6,     R6                      ; 6676   00F6
        ADDR    R4,     R6                      ; 6677   00E6
        ADDR    R5,     R6                      ; 6678   00EE
        ADDR    R7,     R6                      ; 6679   00FE
        ADDR    R7,     R4                      ; 667A   00FC
        ADDR    R5,     R4                      ; 667B   00EC
        ADDR    R5,     R5                      ; 667C   00ED
        MOVR    R0,     R5                      ; 667D   0085
        SLR     R2,     2                       ; 667E   0066
        MOVR    R2,     R3                      ; 667F   0093
        SLR     R2,     2                       ; 6680   0066
        MOVR    R3,     R6                      ; 6681   009E
        SLR     R2,     2                       ; 6682   0066
        MOVR    R3,     R6                      ; 6683   009E
        SLR     R2,     2                       ; 6684   0066
        INCR    R5                              ; 6685   000D
        CLRC                                    ; 6686   0006
        CLRC                                    ; 6687   0006
        CLRC                                    ; 6688   0006
        SUBR    R3,     R6                      ; 6689   011E
        CMPR    R0,     R6                      ; 668A   0146
        CMPR    R7,     R6                      ; 668B   017E
        ANDR    R0,     R6                      ; 668C   0186
        ANDR    R0,     R6                      ; 668D   0186
        SUBR    R5,     R6                      ; 668E   012E
        ANDR    R2,     R6                      ; 668F   0196
        ANDR    R3,     R6                      ; 6690   019E
        ADDR    R2,     R6                      ; 6691   00D6
        CLRC                                    ; 6692   0006
        INCR    R2                              ; 6693   000A
        CLRC                                    ; 6694   0006
        CLRC                                    ; 6695   0006
        CLRC                                    ; 6696   0006
        ANDR    R3,     R6                      ; 6697   019E
        SUBR    R3,     R6                      ; 6698   011E
        CMPR    R7,     R6                      ; 6699   017E
        ANDR    R2,     R6                      ; 669A   0196
        SUBR    R5,     R6                      ; 669B   012E
        ADDR    R2,     R6                      ; 669C   00D6
        CLRC                                    ; 669D   0006
        INCR    R2                              ; 669E   000A
        CLRC                                    ; 669F   0006
        CLRC                                    ; 66A0   0006
        CLRC                                    ; 66A1   0006
        CLRC                                    ; 66A2   0006
        SUBR    R6,     R6                      ; 66A3   0136
        ANDR    R5,     R6                      ; 66A4   01AE
        SUBR    R5,     R6                      ; 66A5   012E
        CMPR    R4,     R6                      ; 66A6   0166
        ADDR    R2,     R6                      ; 66A7   00D6
        CLRC                                    ; 66A8   0006
        CMPR    R3,     R6                      ; 66A9   015E
        CMPR    R7,     R6                      ; 66AA   017E
        CMPR    R6,     R6                      ; 66AB   0176
        SUBR    R1,     R6                      ; 66AC   010E
        CMPR    R5,     R6                      ; 66AD   016E
        CMPR    R1,     R6                      ; 66AE   014E
        ANDR    R0,     R6                      ; 66AF   0186
        SUBR    R1,     R6                      ; 66B0   010E
        ANDR    R2,     R6                      ; 66B1   0196
        CMPR    R3,     R6                      ; 66B2   015E
        SUBR    R5,     R6                      ; 66B3   012E
        ANDR    R2,     R6                      ; 66B4   0196
        SUBR    R2,     R6                      ; 66B5   0116
        ANDR    R2,     R6                      ; 66B6   0196
        CMPR    R7,     R6                      ; 66B7   017E
        ANDR    R4,     R6                      ; 66B8   01A6
        CMPR    R0,     R6                      ; 66B9   0146
        SUBR    R5,     R6                      ; 66BA   012E
        ANDR    R2,     R6                      ; 66BB   0196
        ANDR    R3,     R6                      ; 66BC   019E
        MVI@    R2,     R1                      ; 66BD   0291
        MVI@    R2,     R1                      ; 66BE   0291
        MVO@    R1,     R1                      ; 66BF   0249
        MOVR    R3,     R1                      ; 66C0   0099
        MOVR    R3,     R2                      ; 66C1   009A
        DECLE   $0005                           ; 66C2   0005

        MVI@    R2,     R2                      ; 66C3   0292
        DECLE   $0228                           ; 66C4   0228

        MOVR    R4,     R5                      ; 66C5   00A5
        MVI     .BTAB.6A,R2                     ; 66C6   0282 026A
        SAR     R2,     1                       ; 66C8   006A
        ANDR    R4,     R4                      ; 66C9   01A4
        XOR@    R6,     R1                      ; 66CA   03F1
        XORR    R6,     R7                      ; 66CB   01F7
        SUB     G_03CF, R7                      ; 66CC   0307 03CF
        CMPR    R1,     R7                      ; 66CE   014F
        CMPR    R1,     R5                      ; 66CF   014D
        CMP@    R1,     R5                      ; 66D0   034D
        XOR@    R6,     R0                      ; 66D1   03F0
        SARC    R3,     2                       ; 66D2   007F
        XORR    R0,     R7                      ; 66D3   01C7
        SUB@    R6,     R7                      ; 66D4   0337
        XOR@    R1,     R7                      ; 66D5   03CF
        SUBR    R3,     R7                      ; 66D6   011F
        XOR@    R2,     R1                      ; 66D7   03D1
        XOR@    R1,     R7                      ; 66D8   03CF
        CMPR    R7,     R7                      ; 66D9   017F
        MVO@    R1,     R4                      ; 66DA   0261
        ANDR    R1,     R1                      ; 66DB   0189
        MVO     R6,     G_006A                  ; 66DC   0246 006A
        MVO@    R4,     R2                      ; 66DE   0254
        SUBR    R5,     R2                      ; 66DF   012A
        SUBR    R5,     R1                      ; 66E0   0129
        SUBR    R5,     R1                      ; 66E1   0129
        ANDR    R2,     R1                      ; 66E2   0191
        MVO@    R1,     R1                      ; 66E3   0249
        MOVR    R5,     R1                      ; 66E4   00A9
        SUBR    R3,     R1                      ; 66E5   0119
        MVI@    R3,     R1                      ; 66E6   0299
        MVI@    R5,     R2                      ; 66E7   02AA
        DECLE   $021A                           ; 66E8   021A

        MVO@    R1,     R5                      ; 66E9   0269
        TSTR    R4                              ; 66EA   00A4
        ANDR    R5,     R2                      ; 66EB   01AA
        SUBR    R3,     R2                      ; 66EC   011A
        BC      L_6468                          ; 66ED   0221 0286
        BOV     L_645B                          ; 66EF   0222 0295

        SLL     R2,     1                       ; 66F1   004A
        MVO@    R1,     R5                      ; 66F2   0269
        TSTR    R1                              ; 66F3   0089
        MVO     R6,     .BTAB.4A                ; 66F4   0246 024A
        CMPR    R0,     R0                      ; 66F6   0140
        SUBR    R0,     R4                      ; 66F7   0104
        SUBR    R2,     R1                      ; 66F8   0111
        CMPR    R2,     R0                      ; 66F9   0150
        SWAP    R1,     1                       ; 66FA   0041
        RLC     R0,     1                       ; 66FB   0050

        JSR     R4,     G_0445                  ; 66FC   0004 0004 0045

        SUBR    R2,     R1                      ; 66FF   0111
        MVO@    R0,     R3                      ; 6700   0258
        SLR     R1,     1                       ; 6701   0061
        RLC     R1,     1                       ; 6702   0051
        COMR    R2                              ; 6703   001A
        SUBR    R4,     R5                      ; 6704   0125
        RLC     R1,     1                       ; 6705   0051
        DECR    R0                              ; 6706   0010
        ANDR    R2,     R0                      ; 6707   0190
        MVO     R1,     .BTAB.A5                ; 6708   0241 02A5
        SUBR    R2,     R2                      ; 670A   0112
        MVI@    R3,     R1                      ; 670B   0299
        DECLE   $0216                           ; 670C   0216

        MOVR    R5,     R2                      ; 670D   00AA
        SUBR    R3,     R1                      ; 670E   0119
        MOVR    R3,     R1                      ; 670F   0099
        SLR     R1,     1                       ; 6710   0061
        MVI@    R4,     R4                      ; 6711   02A4
        DECR    R2                              ; 6712   0012
        MVO@    R2,     R1                      ; 6713   024A
        MVI@    R2,     R2                      ; 6714   0292
        BLE     L_65ED                          ; 6715   0226 0129

        SAR     R2,     1                       ; 6717   006A
        MVO     R6,     .BTAB.2A                ; 6718   0246 022A
        CMPR    R2,     R1                      ; 671A   0151
        MOVR    R5,     R1                      ; 671B   00A9
        DECLE   $021A                           ; 671C   021A

        SLR     R0,     1                       ; 671D   0060
        SLLC    R3,     2                       ; 671E   005F
        SLR     R3,     2                       ; 671F   0067
        MOVR    R2,     R1                      ; 6720   0091
        SLR     R3,     2                       ; 6721   0067
        SLR     R3,     2                       ; 6722   0067
        SAR     R0,     1                       ; 6723   0068
        ADDR    R5,     R6                      ; 6724   00EE
        SAR     R2,     1                       ; 6725   006A
        ADDR    R7,     R2                      ; 6726   00FA
        SAR     R0,     2                       ; 6727   006C
        NEGR    R0                              ; 6728   0020
        SAR     R1,     2                       ; 6729   006D
        DECLE   $0001                           ; 672A   0001

        SAR     R2,     2                       ; 672B   006E
        SARC    R2,     1                       ; 672C   007A
        SAR     R3,     2                       ; 672D   006F
        ADDR    R7,     R7                      ; 672E   00FF
        SARC    R3,     2                       ; 672F   007F
        RLC     R3,     1                       ; 6730   0053
        SLR     R3,     2                       ; 6731   0067
        DIS                                     ; 6732   0003
        GSWD    R0                              ; 6733   0030
        SAR     R0,     1                       ; 6734   0068
        DECLE   $0005                           ; 6735   0005

        ADDR    R6,     R4                      ; 6736   00F4
        SAR     R0,     1                       ; 6737   0068
        DECR    R1                              ; 6738   0011
        SAR     R0,     1                       ; 6739   0068
        SAR     R1,     1                       ; 673A   0069
        DECR    R1                              ; 673B   0011
        SWAP    R3,     1                       ; 673C   0043
        SAR     R2,     1                       ; 673D   006A
        ADDR    R7,     R7                      ; 673E   00FF
        SLL     R3,     2                       ; 673F   004F
        SAR     R3,     1                       ; 6740   006B
        ADDR    R7,     R7                      ; 6741   00FF
        INCR    R4                              ; 6742   000C
        SAR     R0,     2                       ; 6743   006C
        ADDR    R7,     R7                      ; 6744   00FF
        SLLC    R0,     2                       ; 6745   005C
        SAR     R0,     2                       ; 6746   006C
        INCR    R1                              ; 6747   0009
        ADDR    R6,     R7                      ; 6748   00F7
        SAR     R0,     2                       ; 6749   006C
        DECLE   $0005,  $0001                   ; 674A   0005 0001

        SAR     R2,     2                       ; 674C   006E
        DIS                                     ; 674D   0003
        SARC    R2,     1                       ; 674E   007A
        SAR     R3,     2                       ; 674F   006F
        DECLE   $0005                           ; 6750   0005

        ADDR    R7,     R7                      ; 6751   00FF
        SAR     R3,     2                       ; 6752   006F
        B       L_6855                          ; 6753   0200 0100

L_6755:
        SUB     G_0320, R0                      ; 6755   0300 0320
        SLL     R1,     1                       ; 6757   0049
        DECLE   $023A                           ; 6758   023A

        ADCR    R2                              ; 6759   002A
        SUBR    R6,     R2                      ; 675A   0132
        ADCR    R2                              ; 675B   002A
L_675C:
        DECLE   $0212                           ; 675C   0212

        COMR    R2                              ; 675D   001A
        COMR    R2                              ; 675E   001A
L_675F:
        INCR    R4                              ; 675F   000C
        AND     G_0346, R0                      ; 6760   0380 0346
        CLRR    R2                              ; 6762   01D2
        CMP     G_0182, R5                      ; 6763   0345 0182
        ADD@    R2,     R5                      ; 6765   02D5
        CLRR    R2                              ; 6766   01D2
        ADD     G_0182, R5                      ; 6767   02C5 0182
        ADD@    R2,     R5                      ; 6769   02D5
        CLRR    R2                              ; 676A   01D2
L_676B:
        BLT     L_68EF                          ; 676B   0205 0182

        CMPR    R2,     R5                      ; 676D   0155
        CLRR    R2                              ; 676E   01D2
        MOVR    R2,     R4                      ; 676F   0094
        ANDR    R0,     R2                      ; 6770   0182
        CMP     G_01D2, R4                      ; 6771   0344 01D2
        DECLE   $0214                           ; 6773   0214

        ANDR    R0,     R2                      ; 6774   0182
        MVO     R4,     G_01D2                  ; 6775   0244 01D2
        MVO@    R4,     R2                      ; 6777   0254
        ANDR    R0,     R2                      ; 6778   0182
        CMPR    R0,     R4                      ; 6779   0144
        MVO     R0,     .BTAB.20                ; 677A   0240 0220
        NEGR    R0                              ; 677C   0020
        SUB@    R4,     R0                      ; 677D   0320
        B       L_675F                          ; 677E   0220 0020
        B       L_6882                          ; 6780   0200 0100

        SUB     .STIC.VIDEN,R0                  ; 6782   0300 0020
        NEGR    R0                              ; 6784   0020
        NEGR    R0                              ; 6785   0020
        SUBR    R4,     R0                      ; 6786   0120
        SUB@    R4,     R0                      ; 6787   0320
        SWAP    R0,     1                       ; 6788   0040
        SWAP    R0,     1                       ; 6789   0040
        B       L_676B                          ; 678A   0220 0020

        NEGR    R0                              ; 678C   0020
        SUBR    R4,     R0                      ; 678D   0120
        NEGR    R0                              ; 678E   0020
        SUB@    R4,     R0                      ; 678F   0320
        SWAP    R0,     1                       ; 6790   0040
        EIS                                     ; 6791   0002
        DECLE   $0000                           ; 6792   0000

        CMPR    R1,     R0                      ; 6793   0148
        DECLE   $0000                           ; 6794   0000

        MOVR    R3,     R0                      ; 6795   0098
        DECLE   $0000                           ; 6796   0000

        MOVR    R0,     R7                      ; 6797   0087
        B       L_6A9A                          ; 6798   0200 0300

        SUB@    R4,     R0                      ; 679A   0320
        CMP     G_0060, R0                      ; 679B   0340 0060
        SLR     R0,     1                       ; 679D   0060
        MVO     R0,     G_0040                  ; 679E   0240 0040
        SWAP    R0,     1                       ; 67A0   0040
        CMP     G_0360, R0                      ; 67A1   0340 0360
        AND     G_00A0, R0                      ; 67A3   0380 00A0
        AND@    R4,     R0                      ; 67A5   03A0
        ADDR    R0,     R0                      ; 67A6   00C0
        ADDR    R0,     R0                      ; 67A7   00C0
        XOR     .BTAB.C0,R0                     ; 67A8   03C0 02C0
        ADDR    R0,     R0                      ; 67AA   00C0
        ADDR    R0,     R0                      ; 67AB   00C0
        CLRR    R0                              ; 67AC   01C0
        CLRR    R0                              ; 67AD   01C0
        ADDR    R0,     R0                      ; 67AE   00C0
        ADDR    R0,     R0                      ; 67AF   00C0
        MVI@    R4,     R0                      ; 67B0   02A0
        MVI     .BTAB.60,R0                     ; 67B1   0280 0260
        SLR     R0,     1                       ; 67B3   0060
        SLR     R0,     1                       ; 67B4   0060
        MVO     R0,     G_0140                  ; 67B5   0240 0140
        CMP@    R1,     R1                      ; 67B7   0349
        CMP@    R5,     R2                      ; 67B8   036A
        ANDR    R3,     R3                      ; 67B9   019B
        MVO@    R3,     R5                      ; 67BA   026B
        MVO@    R4,     R1                      ; 67BB   024C
        CMP@    R1,     R5                      ; 67BC   034D
        MVO@    R6,     R1                      ; 67BD   024E
        RLC     R2,     2                       ; 67BE   0056
        CMPR    R3,     R6                      ; 67BF   015E
        DECLE   $023E,  $0035                   ; 67C0   023E 0035
L_67C2:
        RSWD    R5                              ; 67C2   003D
        SUBR    R6,     R4                      ; 67C3   0134
        RSWD    R4                              ; 67C4   003C
        SUBI    #$034C, R4                      ; 67C5   033C 034C
        CMP@    R6,     R4                      ; 67C7   0374
        AND@    R3,     R4                      ; 67C8   039C
        MVI@    R2,     R3                      ; 67C9   0293
        TSTR    R2                              ; 67CA   0092
L_67CB:
        AND@    R3,     R2                      ; 67CB   039A
        ANDI    #$02A1, R2                      ; 67CC   03BA 02A1
        MVI     .IV.FIFO,R1                     ; 67CE   0281 0081
        MOVR    R0,     R1                      ; 67D0   0081
        MOVR    R0,     R1                      ; 67D1   0081
        AND     G_01A1, R1                      ; 67D2   0381 01A1
        MVI     .BTAB.61,R1                     ; 67D4   0281 0261
        MVO     R1,     .BTAB.21                ; 67D6   0241 0221
        BC      L_68DB                          ; 67D8   0201 0101

        SUB     .BTAB.0A,R1                     ; 67DA   0301 020A
        SUBR    R3,     R3                      ; 67DC   011B
        COMR    R3                              ; 67DD   001B
        INCR    R3                              ; 67DE   000B
        SUB@    R2,     R3                      ; 67DF   0313
        ADCR    R3                              ; 67E0   002B
        ADCR    R4                              ; 67E1   002C
        SUB@    R5,     R5                      ; 67E2   032D
        CMPR    R1,     R6                      ; 67E3   014E
        RLC     R2,     2                       ; 67E4   0056
        RLC     R1,     2                       ; 67E5   0055
        CMP@    R3,     R5                      ; 67E6   035D
        SARC    R1,     2                       ; 67E7   007D
        SARC    R1,     2                       ; 67E8   007D
        CMP@    R6,     R4                      ; 67E9   0374
        ANDR    R2,     R3                      ; 67EA   0193
        AND@    R3,     R3                      ; 67EB   039B
        MVI@    R3,     R3                      ; 67EC   029B
        ANDR    R3,     R3                      ; 67ED   019B
        TSTR    R3                              ; 67EE   009B
        TSTR    R3                              ; 67EF   009B
        DECLE   $027B                           ; 67F0   027B

        SARC    R3,     1                       ; 67F1   007B
        SARC    R3,     1                       ; 67F2   007B
        MVO@    R3,     R3                      ; 67F3   025B
        SLLC    R3,     1                       ; 67F4   005B
        SLL     R3,     1                       ; 67F5   004B
        CMPR    R3,     R4                      ; 67F6   015C
        RLC     R3,     1                       ; 67F7   0053
        DECLE   $0232                           ; 67F8   0232

        SUBR    R5,     R2                      ; 67F9   012A
        RSWD    R3                              ; 67FA   003B
        SUBR    R6,     R2                      ; 67FB   0132
        SUBI    #$015A, R2                      ; 67FC   033A 015A
        DECLE   $023A                           ; 67FE   023A

        SUBR    R6,     R1                      ; 67FF   0131
        SUBI    #$0359, R1                      ; 6800   0339 0359
        CMP@    R5,     R1                      ; 6802   0369
        AND@    R1,     R2                      ; 6803   038A
        ANDR    R7,     R3                      ; 6804   01BB
        ANDR    R7,     R3                      ; 6805   01BB
        MVI@    R1,     R3                      ; 6806   028B
        DECLE   $027C                           ; 6807   027C

        MVO@    R4,     R1                      ; 6808   024C
        CMPR    R1,     R5                      ; 6809   014D
L_680A:
        SLL     R2,     2                       ; 680A   004E
        RLC     R2,     2                       ; 680B   0056
        SLLC    R2,     2                       ; 680C   005E
        RLC     R1,     2                       ; 680D   0055
        CMP@    R3,     R5                      ; 680E   035D
        MVO@    R4,     R3                      ; 680F   025C
        RLC     R0,     2                       ; 6810   0054
        DECLE   $0233                           ; 6811   0233

        ADCR    R3                              ; 6812   002B
        BNEQ    L_6922                          ; 6813   020C 010D

        SUBR    R1,     R6                      ; 6815   010E
        COMR    R7                              ; 6816   001F
        COMR    R7                              ; 6817   001F
        SUBR    R2,     R6                      ; 6818   0116
        SUBR    R2,     R5                      ; 6819   0115
        SUBR    R2,     R4                      ; 681A   0114
        DECR    R3                              ; 681B   0013
        INCR    R3                              ; 681C   000B
        INCR    R4                              ; 681D   000C
        INCR    R5                              ; 681E   000D
        SUBR    R1,     R6                      ; 681F   010E
        SUB@    R2,     R6                      ; 6820   0316
        SUB@    R6,     R5                      ; 6821   0335
        CMP@    R2,     R4                      ; 6822   0354
        MVO@    R3,     R2                      ; 6823   0253
        DECLE   $0232                           ; 6824   0232

        SUBR    R6,     R1                      ; 6825   0131
        SUBR    R4,     R0                      ; 6826   0120
        SUBR    R4,     R0                      ; 6827   0120
        SUBR    R4,     R0                      ; 6828   0120
        SUBR    R4,     R0                      ; 6829   0120
        SUBR    R4,     R0                      ; 682A   0120
        SUBR    R4,     R0                      ; 682B   0120
        SUBR    R4,     R0                      ; 682C   0120
        SUBR    R4,     R0                      ; 682D   0120
        SUBR    R4,     R0                      ; 682E   0120
        SUBR    R4,     R0                      ; 682F   0120
        SUB@    R4,     R0                      ; 6830   0320
        CMP     G_0361, R0                      ; 6831   0340 0361
        AND     G_03A1, R1                      ; 6833   0381 03A1
        MVII    #$0289, R1                      ; 6835   02B9 0289
        MVO@    R2,     R5                      ; 6837   026A
        MVO@    R3,     R3                      ; 6838   025B
        SLLC    R3,     1                       ; 6839   005B
        SLLC    R3,     1                       ; 683A   005B
L_683B:
        SLLC    R3,     1                       ; 683B   005B
        RLC     R2,     1                       ; 683C   0052
        RLC     R1,     1                       ; 683D   0051
        SWAP    R0,     1                       ; 683E   0040
L_683F:
        DECLE   $0239                           ; 683F   0239

        ADCR    R1                              ; 6840   0029
        GSWD    R1                              ; 6841   0031
        SUBI    #$0359, R1                      ; 6842   0339 0359
        CMP@    R4,     R1                      ; 6844   0361
        MVO@    R1,     R4                      ; 6845   0261
        SAR     R1,     1                       ; 6846   0069
        SAR     R2,     1                       ; 6847   006A
        SARC    R3,     1                       ; 6848   007B
        CMPI    #$039B, R3                      ; 6849   037B 039B
        ANDR    R5,     R3                      ; 684B   01AB
        ANDR    R6,     R3                      ; 684C   01B3
        MOVR    R7,     R3                      ; 684D   00BB
        MOVR    R7,     R3                      ; 684E   00BB
        MOVR    R6,     R2                      ; 684F   00B2
        MOVR    R6,     R1                      ; 6850   00B1
        MOVR    R4,     R0                      ; 6851   00A0
        MOVR    R4,     R0                      ; 6852   00A0
        MVI     .BTAB.60,R0                     ; 6853   0280 0260
L_6855:
        MVO     R0,     G_0140                  ; 6855   0240 0140
        SWAP    R0,     1                       ; 6857   0040
        SWAP    R0,     1                       ; 6858   0040
        SWAP    R0,     1                       ; 6859   0040
        B       L_683B                          ; 685A   0220 0020

        NEGR    R0                              ; 685C   0020
        SUB@    R4,     R0                      ; 685D   0320
        SWAP    R0,     1                       ; 685E   0040
        SWAP    R0,     1                       ; 685F   0040
        SWAP    R0,     1                       ; 6860   0040
        SWAP    R0,     1                       ; 6861   0040
        CMP     G_0060, R0                      ; 6862   0340 0060
        MVO     R0,     G_0040                  ; 6864   0240 0040
        CMP     .STIC.X.2,R0                    ; 6866   0340 0002
        DECLE   $0000                           ; 6868   0000

        CMPR    R1,     R0                      ; 6869   0148
L_686A:
        DECLE   $0000                           ; 686A   0000

        MOVR    R3,     R0                      ; 686B   0098
        DECLE   $0000                           ; 686C   0000

        MOVR    R0,     R7                      ; 686D   0087
        SUBR    R4,     R0                      ; 686E   0120
        SUB@    R4,     R0                      ; 686F   0320
        CMP     G_0060, R0                      ; 6870   0340 0060
        SLR     R0,     1                       ; 6872   0060
        MVO     R0,     G_0040                  ; 6873   0240 0040
        SWAP    R0,     1                       ; 6875   0040
        CMP     G_0360, R0                      ; 6876   0340 0360
        AND     G_03A0, R0                      ; 6878   0380 03A0
        CLRR    R0                              ; 687A   01C0
        ADDR    R0,     R0                      ; 687B   00C0
        XOR     .UART.0,R0                      ; 687C   03C0 00E0
        ADDR    R4,     R0                      ; 687E   00E0
        XOR@    R4,     R0                      ; 687F   03E0
        ADD@    R4,     R0                      ; 6880   02E0
        ADDR    R4,     R0                      ; 6881   00E0
L_6882:
        ADDR    R4,     R0                      ; 6882   00E0
        ADDR    R4,     R0                      ; 6883   00E0
        XORR    R4,     R0                      ; 6884   01E0
        XORR    R4,     R0                      ; 6885   01E0
        ADDR    R4,     R0                      ; 6886   00E0
L_6887:
        ADDR    R4,     R0                      ; 6887   00E0
        ADD     .BTAB.A0,R0                     ; 6888   02C0 02A0
        MVI     .IV.ALD,R0                      ; 688A   0280 0080
        TSTR    R0                              ; 688C   0080
        MVO@    R0,     R4                      ; 688D   0260
        MVO     R0,     .STIC.CS.1              ; 688E   0240 0029
        ADCR    R2                              ; 6890   002A
L_6891:
        ADCR    R3                              ; 6891   002B
        ADCR    R4                              ; 6892   002C
        SUBI    #$0354, R5                      ; 6893   033D 0354
        CMP@    R6,     R3                      ; 6895   0373
        AND@    R3,     R3                      ; 6896   039B
        AND@    R6,     R2                      ; 6897   03B2
        MVII    #$03B1, R2                      ; 6898   02BA 03B1
        XOR     G_03E0, R0                      ; 689A   03C0 03E0
        ADD@    R4,     R0                      ; 689C   02E0
        ADD     G_00C9, R0                      ; 689D   02C0 00C9
        ADDR    R3,     R2                      ; 689F   00DA
        ADDR    R3,     R2                      ; 68A0   00DA
        ADDR    R3,     R2                      ; 68A1   00DA
        MVII    #$01AA, R2                      ; 68A2   02BA 01AA
        MVI@    R3,     R3                      ; 68A4   029B
        DECLE   $027B                           ; 68A5   027B

        SARC    R3,     1                       ; 68A6   007B
        SARC    R3,     1                       ; 68A7   007B
        RRC     R2,     1                       ; 68A8   0072
L_68A9:
        CMPR    R5,     R2                      ; 68A9   016A
        RRC     R2,     1                       ; 68AA   0072
        CMP@    R5,     R2                      ; 68AB   036A
        TSTR    R3                              ; 68AC   009B
        TSTR    R2                              ; 68AD   0092
        MOVR    R3,     R2                      ; 68AE   009A
        ANDR    R3,     R2                      ; 68AF   019A
        MOVR    R3,     R2                      ; 68B0   009A
        PSHR    R1                              ; 68B1   0271
        MVO     R0,     G_0341                  ; 68B2   0240 0341
        CMPR    R4,     R1                      ; 68B4   0161
        SLR     R1,     1                       ; 68B5   0061
        MVO     R0,     G_0049                  ; 68B6   0240 0049
        BNOV    L_6887                          ; 68B8   022A 0032

        DECLE   $021A                           ; 68BA   021A

        COMR    R2                              ; 68BB   001A
        COMR    R2                              ; 68BC   001A
        SUB@    R3,     R2                      ; 68BD   031A
        SUB@    R5,     R2                      ; 68BE   032A
        CMP@    R1,     R3                      ; 68BF   034B
        CMP@    R5,     R4                      ; 68C0   036C
        DECLE   $027D                           ; 68C1   027D

        SARC    R1,     2                       ; 68C2   007D
        RRC     R0,     2                       ; 68C3   0074
        SAR     R0,     2                       ; 68C4   006C
        MVO@    R3,     R2                      ; 68C5   0253
        DECLE   $0232                           ; 68C6   0232

        SUB@    R6,     R1                      ; 68C7   0331
        B       L_68A9                          ; 68C8   0220 0020

        NEGR    R0                              ; 68CA   0020
        NEGR    R0                              ; 68CB   0020
        SUB@    R4,     R0                      ; 68CC   0320
        CMP     G_0060, R0                      ; 68CD   0340 0060
        MVO@    R1,     R1                      ; 68CF   0249
        CMPR    R1,     R2                      ; 68D0   014A
        RLC     R2,     1                       ; 68D1   0052
        CMPR    R1,     R2                      ; 68D2   014A
        CMP@    R2,     R2                      ; 68D3   0352
        MVO@    R2,     R1                      ; 68D4   024A
        DECLE   $0232                           ; 68D5   0232
L_68D6:
        GSWD    R1                              ; 68D6   0031
        SUB@    R4,     R0                      ; 68D7   0320
        CMP     G_0360, R0                      ; 68D8   0340 0360
        AND     .BTAB.80,R0                     ; 68DA   0380 0280
        TSTR    R0                              ; 68DC   0080
        MVO@    R0,     R4                      ; 68DD   0260
        SLR     R0,     1                       ; 68DE   0060
        SLR     R0,     1                       ; 68DF   0060
        MVO     R0,     .BTAB.20                ; 68E0   0240 0220
        SUBR    R4,     R0                      ; 68E2   0120
        NEGR    R0                              ; 68E3   0020
        NEGR    R0                              ; 68E4   0020
L_68E5:
        SUB@    R4,     R0                      ; 68E5   0320
        CMP     G_0060, R0                      ; 68E6   0340 0060
        SLR     R0,     1                       ; 68E8   0060
        MVO     R0,     .BTAB.20                ; 68E9   0240 0220
        SUBR    R4,     R0                      ; 68EB   0120
        SUBR    R4,     R0                      ; 68EC   0120
        SUBR    R4,     R0                      ; 68ED   0120
        SUBR    R4,     R0                      ; 68EE   0120
L_68EF:
        SUBR    R4,     R0                      ; 68EF   0120
        SUBR    R4,     R0                      ; 68F0   0120
        SUBR    R4,     R0                      ; 68F1   0120
        SUBR    R4,     R0                      ; 68F2   0120
        SUBR    R4,     R0                      ; 68F3   0120
        SUB@    R4,     R0                      ; 68F4   0320
        B       L_68D6                          ; 68F5   0220 0020

        NEGR    R0                              ; 68F7   0020
L_68F8:
        NEGR    R0                              ; 68F8   0020
        NEGR    R0                              ; 68F9   0020
        NEGR    R0                              ; 68FA   0020
        SUB@    R4,     R0                      ; 68FB   0320
        CMPR    R0,     R0                      ; 68FC   0140
        SWAP    R0,     1                       ; 68FD   0040
        SWAP    R0,     1                       ; 68FE   0040
        CMP     G_0360, R0                      ; 68FF   0340 0360
        MVO@    R0,     R4                      ; 6901   0260
        MVO     R0,     G_0040                  ; 6902   0240 0040
        B       L_68E5                          ; 6904   0220 0020

        NEGR    R0                              ; 6906   0020
        NEGR    R0                              ; 6907   0020
        NEGR    R0                              ; 6908   0020
        SUB@    R4,     R0                      ; 6909   0320
        SWAP    R0,     1                       ; 690A   0040
        SWAP    R0,     1                       ; 690B   0040
        CMP     G_0060, R0                      ; 690C   0340 0060
        SLR     R0,     1                       ; 690E   0060
        SLR     R0,     1                       ; 690F   0060
        SLR     R0,     1                       ; 6910   0060
        CMP@    R4,     R0                      ; 6911   0360
L_6912:
        ANDR    R0,     R0                      ; 6912   0180
        MVO@    R0,     R4                      ; 6913   0260
        SLR     R0,     1                       ; 6914   0060
        SLR     R0,     1                       ; 6915   0060
        MVO     R0,     G_0040                  ; 6916   0240 0040
        SWAP    R0,     1                       ; 6918   0040
        SWAP    R0,     1                       ; 6919   0040
        SWAP    R0,     1                       ; 691A   0040
L_691B:
        CMP     G_0360, R0                      ; 691B   0340 0360
        MVO@    R0,     R4                      ; 691D   0260
        MVO     R0,     G_0040                  ; 691E   0240 0040
        SWAP    R0,     1                       ; 6920   0040
        SWAP    R0,     1                       ; 6921   0040
L_6922:
        CMP     G_0060, R0                      ; 6922   0340 0060
        SLR     R0,     1                       ; 6924   0060
        SLR     R0,     1                       ; 6925   0060
        SLR     R0,     1                       ; 6926   0060
        SWAP    R0,     1                       ; 6927   0040
        SWAP    R0,     1                       ; 6928   0040
        CMPR    R0,     R0                      ; 6929   0140
L_692A:
        SWAP    R0,     1                       ; 692A   0040
        CMP     G_0360, R0                      ; 692B   0340 0360
        MVO@    R0,     R4                      ; 692D   0260
        MVO     R0,     G_0040                  ; 692E   0240 0040
        SWAP    R0,     1                       ; 6930   0040
L_6931:
        B       L_6912                          ; 6931   0220 0020

        NEGR    R0                              ; 6933   0020
        SUB@    R4,     R0                      ; 6934   0320
        CMPR    R0,     R0                      ; 6935   0140
        SWAP    R0,     1                       ; 6936   0040
        SWAP    R0,     1                       ; 6937   0040
        SWAP    R0,     1                       ; 6938   0040
        SWAP    R0,     1                       ; 6939   0040
        CMP     G_0060, R0                      ; 693A   0340 0060
        MVO     R0,     G_0040                  ; 693C   0240 0040
        B       L_661F                          ; 693E   0220 0320

        SWAP    R0,     1                       ; 6940   0040
        SWAP    R0,     1                       ; 6941   0040
        SWAP    R0,     1                       ; 6942   0040
        CMP     G_0060, R0                      ; 6943   0340 0060
        SLR     R0,     1                       ; 6945   0060
        CMP@    R4,     R0                      ; 6946   0360
        MVO@    R0,     R4                      ; 6947   0260
        MVO     R0,     .BTAB.20                ; 6948   0240 0220
        NEGR    R0                              ; 694A   0020
        NEGR    R0                              ; 694B   0020
        NEGR    R0                              ; 694C   0020
        SUB@    R4,     R0                      ; 694D   0320
        SWAP    R0,     1                       ; 694E   0040
        SWAP    R0,     1                       ; 694F   0040
        B       L_6931                          ; 6950   0220 0020

        NEGR    R0                              ; 6952   0020
        NEGR    R0                              ; 6953   0020
L_6954:
        NEGR    R0                              ; 6954   0020
        SUBR    R4,     R0                      ; 6955   0120
        NEGR    R0                              ; 6956   0020
        NEGR    R0                              ; 6957   0020
        SUB@    R4,     R0                      ; 6958   0320
        CMP     G_0060, R0                      ; 6959   0340 0060
        SLR     R0,     1                       ; 695B   0060
        MVO     R0,     G_0140                  ; 695C   0240 0140
        B       L_683F                          ; 695E   0220 0120

        SUBR    R4,     R0                      ; 6960   0120
        SUBR    R4,     R0                      ; 6961   0120
        SUBR    R4,     R0                      ; 6962   0120
        SUBR    R4,     R0                      ; 6963   0120
        SUBR    R4,     R0                      ; 6964   0120
        SUBR    R4,     R0                      ; 6965   0120
        SUBR    R4,     R0                      ; 6966   0120
        SUBR    R4,     R0                      ; 6967   0120
        SUB@    R4,     R0                      ; 6968   0320
        CMP     G_0360, R0                      ; 6969   0340 0360
        AND     .BTAB.80,R0                     ; 696B   0380 0280
        ANDR    R0,     R0                      ; 696D   0180
        TSTR    R0                              ; 696E   0080
        MVO@    R0,     R4                      ; 696F   0260
        SLR     R0,     1                       ; 6970   0060
        SLR     R0,     1                       ; 6971   0060
        MVO     R0,     .BTAB.20                ; 6972   0240 0220
        NEGR    R0                              ; 6974   0020
        NEGR    R0                              ; 6975   0020
        NEGR    R0                              ; 6976   0020
        NEGR    R0                              ; 6977   0020
        SUB@    R4,     R0                      ; 6978   0320
        CMP     G_0360, R0                      ; 6979   0340 0360
        MVO@    R0,     R4                      ; 697B   0260
        SLR     R0,     1                       ; 697C   0060
        SLR     R0,     1                       ; 697D   0060
        MVO     R0,     .BTAB.20                ; 697E   0240 0220
        SUB@    R4,     R0                      ; 6980   0320
        CMP@    R1,     R1                      ; 6981   0349
        CMPI    #$039A, R2                      ; 6982   037A 039A
        ANDI    #$03D1, R2                      ; 6984   03BA 03D1
        ADD     .BTAB.A9,R0                     ; 6986   02C0 02A9
        MVI@    R1,     R2                      ; 6988   028A
        MOVR    R1,     R3                      ; 6989   008B
        MOVR    R3,     R4                      ; 698A   009C
        MOVR    R3,     R4                      ; 698B   009C
        MOVR    R3,     R4                      ; 698C   009C
        AND@    R2,     R3                      ; 698D   0393
L_698E:
        MVI@    R2,     R2                      ; 698E   0292
        MOVR    R3,     R2                      ; 698F   009A
        PSHR    R1                              ; 6990   0271
        MVO@    R1,     R1                      ; 6991   0249
        SLLC    R2,     1                       ; 6992   005A
        DECLE   $023A                           ; 6993   023A

        ADCR    R2                              ; 6994   002A
        ADCR    R3                              ; 6995   002B
        SUBR    R5,     R4                      ; 6996   012C
        DECLE   $021D                           ; 6997   021D

        SUBR    R3,     R5                      ; 6998   011D
        SUB@    R2,     R4                      ; 6999   0314
        GSWD    R3                              ; 699A   0033
        ADCR    R3                              ; 699B   002B
        ADCR    R4                              ; 699C   002C
        ADCR    R5                              ; 699D   002D
        SUBR    R5,     R6                      ; 699E   012E
        SUB@    R6,     R6                      ; 699F   0336
        CMPR    R2,     R5                      ; 69A0   0155
        DECLE   $0234                           ; 69A1   0234

        SUBR    R2,     R3                      ; 69A2   0113
        SUB@    R2,     R2                      ; 69A3   0312
        SUB@    R6,     R1                      ; 69A4   0331
        CMP@    R3,     R1                      ; 69A5   0359
        CMP@    R5,     R1                      ; 69A6   0369
        ANDR    R1,     R2                      ; 69A7   018A
        TSTR    R2                              ; 69A8   0092
        PSHR    R1                              ; 69A9   0271
        SLR     R0,     1                       ; 69AA   0060
        MVO     R1,     G_0041                  ; 69AB   0241 0041
        BC      L_698E                          ; 69AD   0221 0020

        ADCR    R1                              ; 69AF   0029
        SUB@    R5,     R2                      ; 69B0   032A
        AND@    R1,     R3                      ; 69B1   038B
        MVI@    R3,     R4                      ; 69B2   029C
        MOVR    R3,     R4                      ; 69B3   009C
        MOVR    R3,     R4                      ; 69B4   009C
        MOVR    R2,     R3                      ; 69B5   0093
        TSTR    R3                              ; 69B6   009B
        DECLE   $027B                           ; 69B7   027B

        MVO@    R2,     R2                      ; 69B8   0252
        DECLE   $0231                           ; 69B9   0231

        NEGR    R0                              ; 69BA   0020
        NEGR    R0                              ; 69BB   0020
        NEGR    R0                              ; 69BC   0020
        SUB@    R5,     R1                      ; 69BD   0329
        CMP@    R1,     R2                      ; 69BE   034A
        RRC     R2,     1                       ; 69BF   0072
        MVO@    R2,     R1                      ; 69C0   024A
        CMPR    R3,     R3                      ; 69C1   015B
        SLL     R3,     1                       ; 69C2   004B
        DECLE   $0233                           ; 69C3   0233

        RSWD    R3                              ; 69C4   003B
        SUB@    R6,     R2                      ; 69C5   0332
        DECLE   $023A                           ; 69C6   023A

        GSWD    R1                              ; 69C7   0031
        SUB@    R4,     R0                      ; 69C8   0320
        CMP     G_0360, R0                      ; 69C9   0340 0360
        AND     G_03A0, R0                      ; 69CB   0380 03A0
        XOR     G_03E0, R0                      ; 69CD   03C0 03E0
        ADD@    R4,     R0                      ; 69CF   02E0
        XORR    R4,     R0                      ; 69D0   01E0
        ADDR    R4,     R0                      ; 69D1   00E0
        ADD     G_00C0, R0                      ; 69D2   02C0 00C0
        MVI@    R4,     R0                      ; 69D4   02A0
        MOVR    R4,     R0                      ; 69D5   00A0
        AND@    R4,     R0                      ; 69D6   03A0
L_69D7:
        XOR     .BTAB.C0,R0                     ; 69D7   03C0 02C0
        MVI@    R4,     R0                      ; 69D9   02A0
        MVI     .BTAB.60,R0                     ; 69DA   0280 0260
        SLR     R0,     1                       ; 69DC   0060
        SLR     R0,     1                       ; 69DD   0060
L_69DE:
        SLR     R0,     1                       ; 69DE   0060
        SLR     R0,     1                       ; 69DF   0060
        SLR     R0,     1                       ; 69E0   0060
        SLR     R0,     1                       ; 69E1   0060
        MVO     R0,     G_0140                  ; 69E2   0240 0140
        SWAP    R0,     1                       ; 69E4   0040
        SWAP    R0,     1                       ; 69E5   0040
        SWAP    R0,     1                       ; 69E6   0040
        SWAP    R0,     1                       ; 69E7   0040
        SWAP    R0,     1                       ; 69E8   0040
        B       L_69CA                          ; 69E9   0220 0020

        NEGR    R0                              ; 69EB   0020
        NEGR    R0                              ; 69EC   0020
        SUBR    R4,     R0                      ; 69ED   0120
        NEGR    R0                              ; 69EE   0020
        NEGR    R0                              ; 69EF   0020
        NEGR    R0                              ; 69F0   0020
        SUB@    R4,     R0                      ; 69F1   0320
        SWAP    R0,     1                       ; 69F2   0040
        SWAP    R0,     1                       ; 69F3   0040
        SWAP    R0,     1                       ; 69F4   0040
        SWAP    R0,     1                       ; 69F5   0040
        B       L_69D7                          ; 69F6   0220 0020

        SUB@    R4,     R0                      ; 69F8   0320
        CMP     G_0160, R0                      ; 69F9   0340 0160
        MVO     R0,     G_0040                  ; 69FB   0240 0040
        B       L_69DE                          ; 69FD   0220 0020

        NEGR    R0                              ; 69FF   0020
        SUB@    R4,     R0                      ; 6A00   0320
        CMP     G_0360, R0                      ; 6A01   0340 0360
        AND     .BTAB.80,R0                     ; 6A03   0380 0280
        TSTR    R0                              ; 6A05   0080
        TSTR    R0                              ; 6A06   0080
        MVO@    R0,     R4                      ; 6A07   0260
        SLR     R0,     1                       ; 6A08   0060
        CMP@    R4,     R0                      ; 6A09   0360
        AND     .BTAB.80,R0                     ; 6A0A   0380 0280
        MVO@    R0,     R4                      ; 6A0C   0260
        SLR     R0,     1                       ; 6A0D   0060
        SLR     R0,     1                       ; 6A0E   0060
        SLR     R0,     1                       ; 6A0F   0060
        SLR     R0,     1                       ; 6A10   0060
        SLR     R0,     1                       ; 6A11   0060
        MVO     R0,     .BTAB.29                ; 6A12   0240 0229
        BNOV    L_6D21                          ; 6A14   020A 030B

        SUB@    R6,     R3                      ; 6A16   0333
        CMP@    R3,     R3                      ; 6A17   035B
        CMP@    R5,     R3                      ; 6A18   036B
        ANDR    R3,     R4                      ; 6A19   019C
        MVO@    R4,     R5                      ; 6A1A   026C
        MVO@    R5,     R1                      ; 6A1B   024D
        CMPR    R3,     R6                      ; 6A1C   015E
        SLLC    R2,     2                       ; 6A1D   005E
        CMPR    R2,     R5                      ; 6A1E   0155
        DECLE   $0234                           ; 6A1F   0234

        RSWD    R4                              ; 6A20   003C
        RSWD    R4                              ; 6A21   003C
        SUBR    R6,     R3                      ; 6A22   0133
        GSWD    R2                              ; 6A23   0032
        SUB@    R6,     R1                      ; 6A24   0331
        CMP@    R1,     R1                      ; 6A25   0349
        CMPR    R5,     R2                      ; 6A26   016A
        CMP@    R6,     R2                      ; 6A27   0372
        AND@    R1,     R2                      ; 6A28   038A
        AND@    R6,     R2                      ; 6A29   03B2
        PULR    R1                              ; 6A2A   02B1
        MOVR    R4,     R0                      ; 6A2B   00A0
        AND@    R4,     R1                      ; 6A2C   03A1
        XOR     G_03E1, R1                      ; 6A2D   03C1 03E1
        ADD@    R4,     R1                      ; 6A2F   02E1
        ADD     G_00C1, R1                      ; 6A30   02C1 00C1
        XORR    R0,     R1                      ; 6A32   01C1
        ADDR    R0,     R1                      ; 6A33   00C1
        XOR     .BTAB.C0,R1                     ; 6A34   03C1 02C0
        MVI@    R4,     R0                      ; 6A36   02A0
        MVI     .BTAB.60,R0                     ; 6A37   0280 0260
        MVO     R0,     .BTAB.20                ; 6A39   0240 0220
        SUBR    R4,     R0                      ; 6A3B   0120
        SUBR    R4,     R0                      ; 6A3C   0120
        SUBR    R4,     R0                      ; 6A3D   0120
        SUBR    R4,     R0                      ; 6A3E   0120
        SUBR    R4,     R0                      ; 6A3F   0120
        SUBR    R4,     R0                      ; 6A40   0120
        SUBR    R4,     R0                      ; 6A41   0120
        SUBR    R4,     R0                      ; 6A42   0120
        SUBR    R4,     R0                      ; 6A43   0120
        SUB@    R4,     R0                      ; 6A44   0320
        CMP     G_0360, R0                      ; 6A45   0340 0360
        AND@    R1,     R1                      ; 6A47   0389
        MVI@    R1,     R2                      ; 6A48   028A
        MVO@    R3,     R5                      ; 6A49   026B
        CMPR    R7,     R4                      ; 6A4A   017C
        RRC     R3,     1                       ; 6A4B   0073
        CMPR    R4,     R3                      ; 6A4C   0163
        SAR     R3,     1                       ; 6A4D   006B
        CMP@    R4,     R4                      ; 6A4E   0364
        MVO@    R4,     R4                      ; 6A4F   0264
        MVO@    R3,     R2                      ; 6A50   0253
        RLC     R2,     1                       ; 6A51   0052
        SLLC    R2,     1                       ; 6A52   005A
        CMP     G_0163, R3                      ; 6A53   0343 0163
        CMP@    R4,     R3                      ; 6A55   0363
        ANDR    R2,     R1                      ; 6A56   0191
        ANDR    R0,     R1                      ; 6A57   0181
        AND     G_01A9, R1                      ; 6A58   0381 01A9
        MVI@    R3,     R2                      ; 6A5A   029A
        ANDR    R0,     R3                      ; 6A5B   0183
        MVO@    R2,     R5                      ; 6A5C   026A
        SARC    R3,     1                       ; 6A5D   007B
        SAR     R3,     1                       ; 6A5E   006B
        MVO@    R4,     R3                      ; 6A5F   025C
        SLL     R0,     2                       ; 6A60   004C
        DECLE   $023D                           ; 6A61   023D

        RSWD    R5                              ; 6A62   003D
        NOP                                     ; 6A63   0034
        SUB@    R6,     R3                      ; 6A64   0333
        CMP@    R2,     R2                      ; 6A65   0352
L_6A66:
        CMP@    R6,     R1                      ; 6A66   0371
        ANDR    R1,     R1                      ; 6A67   0189
        MOVR    R1,     R2                      ; 6A68   008A
        MVO@    R3,     R5                      ; 6A69   026B
        CMPR    R7,     R4                      ; 6A6A   017C
        CMPR    R7,     R4                      ; 6A6B   017C
        RRC     R3,     1                       ; 6A6C   0073
        SAR     R3,     1                       ; 6A6D   006B
        CMPR    R4,     R4                      ; 6A6E   0164
        CMPR    R5,     R4                      ; 6A6F   016C
        SLR     R1,     2                       ; 6A70   0065
        CMPR    R6,     R4                      ; 6A71   0174
        CMPI    #$0393, R4                      ; 6A72   037C 0393
        ANDR    R4,     R3                      ; 6A74   01A3
        ANDR    R4,     R3                      ; 6A75   01A3
        ANDR    R5,     R3                      ; 6A76   01AB
        MVI@    R3,     R4                      ; 6A77   029C
        ANDR    R2,     R3                      ; 6A78   0193
        ANDR    R3,     R3                      ; 6A79   019B
        PSHR    R2                              ; 6A7A   0272
        CMP@    R4,     R2                      ; 6A7B   0362
        MVO@    R2,     R4                      ; 6A7C   0262
        CMP@    R5,     R2                      ; 6A7D   036A
        ANDR    R1,     R3                      ; 6A7E   018B
        ANDR    R3,     R4                      ; 6A7F   019C
        ANDR    R0,     R4                      ; 6A80   0184
        ANDR    R0,     R4                      ; 6A81   0184
        MOVR    R2,     R3                      ; 6A82   0093
        DECLE   $027B                           ; 6A83   027B

        CMPR    R4,     R3                      ; 6A84   0163
        CMP@    R4,     R3                      ; 6A85   0363
        PSHR    R2                              ; 6A86   0272
        SLR     R2,     1                       ; 6A87   0062
        MVO     R2,     G_0142                  ; 6A88   0242 0142
        CMPR    R3,     R2                      ; 6A8A   015A
        CMPR    R2,     R1                      ; 6A8B   0151
        SWAP    R0,     1                       ; 6A8C   0040
        B       L_6755                          ; 6A8D   0220 0339

        CMP@    R3,     R1                      ; 6A8F   0359
        CMP@    R5,     R1                      ; 6A90   0369
        AND@    R1,     R2                      ; 6A91   038A
        MVI@    R1,     R3                      ; 6A92   028B
        ANDR    R3,     R4                      ; 6A93   019C
        RRC     R3,     1                       ; 6A94   0073
        MVO     R3,     G_004B                  ; 6A95   0243 004B
        CMPR    R0,     R4                      ; 6A97   0144
        BEQ     L_6A66                          ; 6A98   0224 0033

L_6A9A:
        GSWD    R2                              ; 6A9A   0032
        SUB@    R4,     R2                      ; 6A9B   0322
        CMPR    R0,     R2                      ; 6A9C   0142
        CMP     G_0171, R2                      ; 6A9D   0342 0171
        CMP@    R4,     R1                      ; 6A9F   0361
        ANDR    R0,     R1                      ; 6AA0   0181
        MVO@    R1,     R5                      ; 6AA1   0269
        CMPR    R4,     R2                      ; 6AA2   0162
        SAR     R2,     1                       ; 6AA3   006A
        SAR     R3,     1                       ; 6AA4   006B
        MVO@    R4,     R3                      ; 6AA5   025C
        SLL     R0,     2                       ; 6AA6   004C
        CMPR    R2,     R4                      ; 6AA7   0154
        DECLE   $0233                           ; 6AA8   0233

        GSWD    R2                              ; 6AA9   0032
        GSWD    R1                              ; 6AAA   0031
        SUBI    #$0359, R1                      ; 6AAB   0339 0359
        CMPI    #$0399, R1                      ; 6AAD   0379 0399
        MVI@    R1,     R1                      ; 6AAF   0289
        MVO@    R2,     R4                      ; 6AB0   0262
        MVO     R2,     G_004A                  ; 6AB1   0242 004A
        CMPR    R1,     R3                      ; 6AB3   014B
        SLLC    R0,     2                       ; 6AB4   005C
        CMP     G_0364, R4                      ; 6AB5   0344 0364
        MVO@    R4,     R4                      ; 6AB7   0264
        MVO@    R4,     R1                      ; 6AB8   024C
        CMPR    R1,     R5                      ; 6AB9   014D
        SLLC    R2,     2                       ; 6ABA   005E
        CMPR    R2,     R5                      ; 6ABB   0155
        CMPR    R0,     R5                      ; 6ABC   0145
        CMPR    R0,     R5                      ; 6ABD   0145
        CMPR    R0,     R5                      ; 6ABE   0145
        SLL     R1,     2                       ; 6ABF   004D
        CMPR    R0,     R6                      ; 6AC0   0146
L_6AC1:
        CMPR    R0,     R6                      ; 6AC1   0146
        CMPR    R0,     R6                      ; 6AC2   0146
        CMPR    R2,     R5                      ; 6AC3   0155
        CMPR    R0,     R5                      ; 6AC4   0145
        BLT     L_6A89                          ; 6AC5   0225 003D

        ADCR    R5                              ; 6AC7   002D
        SUBR    R7,     R6                      ; 6AC8   013E
        SUBR    R4,     R6                      ; 6AC9   0126
        SUBR    R4,     R6                      ; 6ACA   0126
        SUB@    R4,     R6                      ; 6ACB   0326
        CMP@    R2,     R5                      ; 6ACC   0355
        CMPR    R6,     R4                      ; 6ACD   0174
        RRC     R3,     1                       ; 6ACE   0073
        MVO@    R2,     R2                      ; 6ACF   0252
        RLC     R1,     1                       ; 6AD0   0051
        SLL     R1,     1                       ; 6AD1   0049
        CMP@    R1,     R2                      ; 6AD2   034A
        CMP@    R4,     R3                      ; 6AD3   0363
        DECLE   $027B                           ; 6AD4   027B

        MVO@    R3,     R1                      ; 6AD5   024B
        SLLC    R0,     2                       ; 6AD6   005C
        CMPR    R0,     R4                      ; 6AD7   0144
        CMPR    R0,     R4                      ; 6AD8   0144
        RLC     R3,     1                       ; 6AD9   0053
        RLC     R2,     1                       ; 6ADA   0052
        CMP     G_0162, R2                      ; 6ADB   0342 0162
        CMP@    R4,     R2                      ; 6ADD   0362
        ANDR    R2,     R1                      ; 6ADE   0191
        ANDR    R0,     R1                      ; 6ADF   0181
        AND     G_01A9, R1                      ; 6AE0   0381 01A9
        ANDR    R4,     R2                      ; 6AE2   01A2
        MVI@    R1,     R2                      ; 6AE3   028A
L_6AE4:
        TSTR    R3                              ; 6AE4   009B
        MOVR    R1,     R3                      ; 6AE5   008B
        DECLE   $027C                           ; 6AE6   027C

        RRC     R3,     1                       ; 6AE7   0073
        MVO@    R2,     R2                      ; 6AE8   0252
        SLLC    R1,     1                       ; 6AE9   0059
        SLLC    R1,     1                       ; 6AEA   0059
        CMP@    R3,     R1                      ; 6AEB   0359
        CMPI    #$0399, R1                      ; 6AEC   0379 0399
        DECR    R4                              ; 6AEE   0014
        ADDR    R0,     R2                      ; 6AEF   00C2
        CMPR    R2,     R5                      ; 6AF0   0155
        XOR@    R2,     R3                      ; 6AF1   03D3
        CMP     G_0342, R4                      ; 6AF2   0344 0342
        CMPR    R2,     R5                      ; 6AF4   0155
        CMP@    R2,     R2                      ; 6AF5   0352
        CMP     .ISRVEC.0,R4                    ; 6AF6   0344 0100
        CMPR    R2,     R5                      ; 6AF8   0155
        SUBR    R0,     R0                      ; 6AF9   0100
        CMP     .ISRVEC.0,R4                    ; 6AFA   0344 0100
        MVO@    R7,     R2                      ; 6AFC   0257
        XOR@    R2,     R1                      ; 6AFD   03D1
        CMP     G_03C1, R3                      ; 6AFE   0343 03C1
        CMP@    R2,     R3                      ; 6B00   0353
        CMP@    R2,     R1                      ; 6B01   0351
        BPL     L_6EC5                          ; 6B02   0203 03C1

        CMP@    R2,     R3                      ; 6B04   0353
        CMP@    R2,     R1                      ; 6B05   0351
        BPL     L_6EC9                          ; 6B06   0203 03C1

        CMP@    R2,     R3                      ; 6B08   0353
        CMP@    R2,     R1                      ; 6B09   0351
        BPL     L_6ECD                          ; 6B0A   0203 03C1

        CMP@    R2,     R3                      ; 6B0C   0353
        CMP     .BTAB.13,R1                     ; 6B0D   0341 0213
        XOR@    R2,     R1                      ; 6B0F   03D1
        CMP     G_0341, R3                      ; 6B10   0343 0341
        DECLE   $0213                           ; 6B12   0213

        XOR@    R2,     R1                      ; 6B13   03D1
        CMP     G_0380, R3                      ; 6B14   0343 0380
        CMP@    R2,     R7                      ; 6B16   0357
        AND     G_0086, R0                      ; 6B17   0380 0086
        PSHR    R1                              ; 6B19   0271
        MVO@    R1,     R3                      ; 6B1A   0259
        CMP@    R3,     R1                      ; 6B1B   0359
        CMPR    R5,     R1                      ; 6B1C   0169
        SAR     R2,     1                       ; 6B1D   006A
        MVO@    R3,     R1                      ; 6B1E   024B
        CMPR    R0,     R4                      ; 6B1F   0144
        CMP     .BTAB.5C,R4                     ; 6B20   0344 025C
        DECLE   $0233                           ; 6B22   0233

        SUBR    R6,     R2                      ; 6B23   0132
        ADCR    R2                              ; 6B24   002A
        SUBR    R5,     R3                      ; 6B25   012B
        SUBR    R4,     R4                      ; 6B26   0124
        SUBR    R4,     R4                      ; 6B27   0124
        SUBR    R4,     R4                      ; 6B28   0124
        SUB@    R6,     R3                      ; 6B29   0333
        CMP@    R2,     R2                      ; 6B2A   0352
        CMP@    R6,     R1                      ; 6B2B   0371
        AND@    R1,     R1                      ; 6B2C   0389
        MVI@    R1,     R2                      ; 6B2D   028A
        DECLE   $027B                           ; 6B2E   027B

        CMPR    R7,     R3                      ; 6B2F   017B
        RRC     R2,     1                       ; 6B30   0072
        CMPR    R4,     R2                      ; 6B31   0162
        SAR     R2,     1                       ; 6B32   006A
        CMPR    R4,     R3                      ; 6B33   0163
        MVO     R3,     G_004B                  ; 6B34   0243 004B
        RLC     R3,     1                       ; 6B36   0053
        CMP@    R2,     R2                      ; 6B37   0352
        ANDR    R0,     R2                      ; 6B38   0182
        CMP@    R4,     R2                      ; 6B39   0362
        CMPR    R4,     R2                      ; 6B3A   0162
        AND@    R2,     R1                      ; 6B3B   0391
        MVI     G_0181, R1                      ; 6B3C   0281 0181
        MVO@    R1,     R5                      ; 6B3E   0269
        CMPR    R4,     R2                      ; 6B3F   0162
        SAR     R2,     1                       ; 6B40   006A
        CMPR    R5,     R3                      ; 6B41   016B
        MVO@    R4,     R3                      ; 6B42   025C
        CMPR    R2,     R3                      ; 6B43   0153
        DECLE   $023B                           ; 6B44   023B

        SUBR    R4,     R1                      ; 6B45   0121
        SUBR    R6,     R1                      ; 6B46   0131
        SUBR    R4,     R0                      ; 6B47   0120
        SUBR    R4,     R0                      ; 6B48   0120
        SUBR    R4,     R0                      ; 6B49   0120
        SUBR    R4,     R0                      ; 6B4A   0120
        SUBR    R4,     R0                      ; 6B4B   0120
        SUBR    R4,     R0                      ; 6B4C   0120
L_6B4D:
        SUBR    R4,     R0                      ; 6B4D   0120
        SUBR    R4,     R0                      ; 6B4E   0120
        SUB@    R4,     R0                      ; 6B4F   0320
        CMP     G_0360, R0                      ; 6B50   0340 0360
        AND     G_03A0, R0                      ; 6B52   0380 03A0
        ADDR    R0,     R0                      ; 6B54   00C0
        XOR     G_03E0, R0                      ; 6B55   03C0 03E0
        ADD@    R4,     R0                      ; 6B57   02E0
L_6B58:
        XORR    R4,     R0                      ; 6B58   01E0
        ADD     G_00C0, R0                      ; 6B59   02C0 00C0
        ADDR    R0,     R0                      ; 6B5B   00C0
        ADDR    R0,     R0                      ; 6B5C   00C0
        ADDR    R0,     R0                      ; 6B5D   00C0
        XOR     G_03E0, R0                      ; 6B5E   03C0 03E0
        ADD@    R4,     R0                      ; 6B60   02E0
        ADD     .BTAB.A0,R0                     ; 6B61   02C0 02A0
        MVI     .BTAB.60,R0                     ; 6B63   0280 0260
        SLR     R0,     1                       ; 6B65   0060
        SLR     R0,     1                       ; 6B66   0060
        CMP@    R4,     R0                      ; 6B67   0360
        AND     .BTAB.80,R0                     ; 6B68   0380 0280
        MVO@    R0,     R4                      ; 6B6A   0260
        MVO     R0,     .BTAB.20                ; 6B6B   0240 0220
        NEGR    R0                              ; 6B6D   0020
        NEGR    R0                              ; 6B6E   0020
        SUB@    R4,     R0                      ; 6B6F   0320
        CMP     G_0360, R0                      ; 6B70   0340 0360
        ANDR    R0,     R0                      ; 6B72   0180
        MVO@    R0,     R4                      ; 6B73   0260
        MVO     R0,     G_0040                  ; 6B74   0240 0040
        SWAP    R0,     1                       ; 6B76   0040
        B       L_6B58                          ; 6B77   0220 0020

        NEGR    R0                              ; 6B79   0020
        NEGR    R0                              ; 6B7A   0020
        SUB@    R4,     R0                      ; 6B7B   0320
        CMP     G_0360, R0                      ; 6B7C   0340 0360
        AND     G_03A0, R0                      ; 6B7E   0380 03A0
        CLRR    R0                              ; 6B80   01C0
        MVI@    R4,     R0                      ; 6B81   02A0
        MVI     .BTAB.60,R0                     ; 6B82   0280 0260
        SLR     R0,     1                       ; 6B84   0060
        SLR     R0,     1                       ; 6B85   0060
        SLR     R0,     1                       ; 6B86   0060
        CMPR    R4,     R0                      ; 6B87   0160
        MVO     R0,     .BTAB.20                ; 6B88   0240 0220
        SUB@    R4,     R0                      ; 6B8A   0320
        CMP     G_0360, R0                      ; 6B8B   0340 0360
        AND     G_03A0, R0                      ; 6B8D   0380 03A0
        MVI@    R5,     R1                      ; 6B8F   02A9
        MVI@    R1,     R2                      ; 6B90   028A
        ANDR    R1,     R3                      ; 6B91   018B
        MOVR    R3,     R4                      ; 6B92   009C
        MOVR    R2,     R3                      ; 6B93   0093
        AND@    R2,     R2                      ; 6B94   0392
        AND@    R5,     R2                      ; 6B95   03AA
        MVII    #$00B2, R3                      ; 6B96   02BB 00B2
        ANDI    #$01DA, R2                      ; 6B98   03BA 01DA
        ADDR    R1,     R2                      ; 6B9A   00CA
        ADDR    R2,     R2                      ; 6B9B   00D2
        XORR    R2,     R1                      ; 6B9C   01D1
        XOR     G_03F9, R0                      ; 6B9D   03C0 03F9
        ADDI    #$02C0, R1                      ; 6B9F   02F9 02C0
        MVI@    R5,     R1                      ; 6BA1   02A9
        MOVR    R7,     R2                      ; 6BA2   00BA
        ANDR    R6,     R1                      ; 6BA3   01B1
        AND@    R5,     R1                      ; 6BA4   03A9
        ADDR    R1,     R2                      ; 6BA5   00CA
        CLRR    R2                              ; 6BA6   01D2
        XORR    R2,     R1                      ; 6BA7   01D1
        XOR     G_03E0, R0                      ; 6BA8   03C0 03E0
        ADD@    R4,     R0                      ; 6BAA   02E0
        ADD     .BTAB.A0,R0                     ; 6BAB   02C0 02A0
        MVI     .BTAB.60,R0                     ; 6BAD   0280 0260
        MVO     R0,     .BTAB.20                ; 6BAF   0240 0220
        SUB@    R4,     R0                      ; 6BB1   0320
        CMP     G_0360, R0                      ; 6BB2   0340 0360
        MVO@    R0,     R4                      ; 6BB4   0260
        MVO     R0,     G_0040                  ; 6BB5   0240 0040
        SWAP    R0,     1                       ; 6BB7   0040
        B       L_6B99                          ; 6BB8   0220 0020

        NEGR    R0                              ; 6BBA   0020
        NEGR    R0                              ; 6BBB   0020
        SUB@    R4,     R0                      ; 6BBC   0320
        CMP     G_0360, R0                      ; 6BBD   0340 0360
        AND     .BTAB.80,R0                     ; 6BBF   0380 0280
        TSTR    R0                              ; 6BC1   0080
        TSTR    R0                              ; 6BC2   0080
        TSTR    R0                              ; 6BC3   0080
L_6BC4:
        MVO@    R0,     R4                      ; 6BC4   0260
        MVO     R0,     G_0040                  ; 6BC5   0240 0040
        CMP@    R1,     R1                      ; 6BC7   0349
        CMP@    R5,     R2                      ; 6BC8   036A
        MVO@    R3,     R5                      ; 6BC9   026B
        MVO@    R4,     R1                      ; 6BCA   024C
        BGE     L_6B9E                          ; 6BCB   022D 002E

        RSWD    R7                              ; 6BCD   003F
        DECLE   $0036                           ; 6BCE   0036
L_6BCF:
        DECLE   $0035                           ; 6BCF   0035

        SUB@    R6,     R4                      ; 6BD0   0334
        CMP@    R2,     R3                      ; 6BD1   0353
        CMPI    #$0392, R3                      ; 6BD2   037B 0392
        AND@    R5,     R2                      ; 6BD4   03AA
        PULR    R2                              ; 6BD5   02B2
        MVI@    R1,     R2                      ; 6BD6   028A
        MOVR    R1,     R3                      ; 6BD7   008B
        MOVR    R3,     R4                      ; 6BD8   009C
        ANDR    R2,     R3                      ; 6BD9   0193
        AND@    R2,     R2                      ; 6BDA   0392
        AND@    R5,     R2                      ; 6BDB   03AA
        PULR    R2                              ; 6BDC   02B2
        MVI@    R2,     R1                      ; 6BDD   0291
        MVO@    R0,     R4                      ; 6BDE   0260
        MVO     R0,     .BTAB.20                ; 6BDF   0240 0220
        SUBR    R4,     R0                      ; 6BE1   0120
        NEGR    R0                              ; 6BE2   0020
        SUB@    R4,     R0                      ; 6BE3   0320
        CMPR    R0,     R0                      ; 6BE4   0140
        CMP     G_0360, R0                      ; 6BE5   0340 0360
        AND     .BTAB.80,R0                     ; 6BE7   0380 0280
        MVO@    R0,     R4                      ; 6BE9   0260
        SAR     R1,     1                       ; 6BEA   0069
        SAR     R2,     1                       ; 6BEB   006A
        MVO@    R3,     R1                      ; 6BEC   024B
        CMPR    R1,     R4                      ; 6BED   014C
        SLLC    R1,     2                       ; 6BEE   005D
        CMPR    R2,     R4                      ; 6BEF   0154
        BNEQ    L_6BC4                          ; 6BF0   022C 002D

        RSWD    R6                              ; 6BF2   003E
        SUB@    R6,     R5                      ; 6BF3   0335
        CMP@    R2,     R4                      ; 6BF4   0354
        CMP@    R6,     R3                      ; 6BF5   0373
        AND@    R2,     R2                      ; 6BF6   0392
        AND@    R6,     R1                      ; 6BF7   03B1
        MVI@    R4,     R0                      ; 6BF8   02A0
        MVI     .IV.ALD,R0                      ; 6BF9   0280 0080
        TSTR    R0                              ; 6BFB   0080
        TSTR    R0                              ; 6BFC   0080
        TSTR    R0                              ; 6BFD   0080
        TSTR    R0                              ; 6BFE   0080
        AND     .BTAB.80,R0                     ; 6BFF   0380 0280
L_6C01:
        MVO@    R0,     R4                      ; 6C01   0260
        MVO     R0,     .BTAB.20                ; 6C02   0240 0220
        SUBR    R4,     R0                      ; 6C04   0120
        SUBR    R4,     R0                      ; 6C05   0120
        SUBR    R4,     R0                      ; 6C06   0120
        SUBR    R4,     R0                      ; 6C07   0120
        SUBR    R4,     R0                      ; 6C08   0120
        SUBR    R4,     R0                      ; 6C09   0120
        SUBR    R4,     R0                      ; 6C0A   0120
        SUBR    R4,     R0                      ; 6C0B   0120
        SUBR    R4,     R0                      ; 6C0C   0120
        SUB@    R4,     R0                      ; 6C0D   0320
        CMP     G_0060, R0                      ; 6C0E   0340 0060
        SLR     R0,     1                       ; 6C10   0060
L_6C11:
        MVO     R0,     G_0040                  ; 6C11   0240 0040
        SWAP    R0,     1                       ; 6C13   0040
        SWAP    R0,     1                       ; 6C14   0040
        SWAP    R0,     1                       ; 6C15   0040
        SWAP    R0,     1                       ; 6C16   0040
        SWAP    R0,     1                       ; 6C17   0040
        CMP     G_0160, R0                      ; 6C18   0340 0160
        SLR     R0,     1                       ; 6C1A   0060
        SLR     R0,     1                       ; 6C1B   0060
        SLR     R0,     1                       ; 6C1C   0060
        SLR     R0,     1                       ; 6C1D   0060
        MVO     R0,     G_0040                  ; 6C1E   0240 0040
        B       L_6C01                          ; 6C20   0220 0020

        NEGR    R0                              ; 6C22   0020
L_6C23:
        NEGR    R0                              ; 6C23   0020
        SUBR    R4,     R0                      ; 6C24   0120
        NEGR    R0                              ; 6C25   0020
        NEGR    R0                              ; 6C26   0020
        SUB@    R4,     R0                      ; 6C27   0320
        CMP     G_0040, R0                      ; 6C28   0340 0040
        SWAP    R0,     1                       ; 6C2A   0040
        CMP     G_0060, R0                      ; 6C2B   0340 0060
        SLR     R0,     1                       ; 6C2D   0060
        CMPR    R4,     R0                      ; 6C2E   0160
        MVO     R0,     .BTAB.20                ; 6C2F   0240 0220
        NEGR    R0                              ; 6C31   0020
        NEGR    R0                              ; 6C32   0020
        NEGR    R0                              ; 6C33   0020
        NEGR    R0                              ; 6C34   0020
        NEGR    R0                              ; 6C35   0020
        NEGR    R0                              ; 6C36   0020
        SUB@    R4,     R0                      ; 6C37   0320
        CMP     G_0060, R0                      ; 6C38   0340 0060
        SLR     R0,     1                       ; 6C3A   0060
        CMP@    R4,     R0                      ; 6C3B   0360
        ANDR    R0,     R0                      ; 6C3C   0180
        MVO@    R0,     R4                      ; 6C3D   0260
        MVO     R0,     G_0340                  ; 6C3E   0240 0340
        MVO     R0,     G_0040                  ; 6C40   0240 0040
        B       L_6C23                          ; 6C42   0220 0020

        NEGR    R0                              ; 6C44   0020
        NEGR    R0                              ; 6C45   0020
        NEGR    R0                              ; 6C46   0020
        SUB@    R4,     R0                      ; 6C47   0320
        CMP     G_0360, R0                      ; 6C48   0340 0360
        MVO@    R0,     R4                      ; 6C4A   0260
        MVO     R0,     G_0040                  ; 6C4B   0240 0040
        SWAP    R0,     1                       ; 6C4D   0040
        CMP     G_0060, R0                      ; 6C4E   0340 0060
        SLR     R0,     1                       ; 6C50   0060
        CMPR    R4,     R0                      ; 6C51   0160
        SLR     R0,     1                       ; 6C52   0060
        MVO     R0,     .BTAB.20                ; 6C53   0240 0220
        SUBR    R4,     R0                      ; 6C55   0120
        SUBR    R4,     R0                      ; 6C56   0120
        SUBR    R4,     R0                      ; 6C57   0120
        SUBR    R4,     R0                      ; 6C58   0120
        SUBR    R4,     R0                      ; 6C59   0120
        SUBR    R4,     R0                      ; 6C5A   0120
        SUBR    R4,     R0                      ; 6C5B   0120
        SUB@    R4,     R0                      ; 6C5C   0320
        CMP     G_0360, R0                      ; 6C5D   0340 0360
        TSTR    R0                              ; 6C5F   0080
        TSTR    R0                              ; 6C60   0080
        TSTR    R0                              ; 6C61   0080
        TSTR    R0                              ; 6C62   0080
L_6C63:
        MVO@    R0,     R4                      ; 6C63   0260
        SLR     R0,     1                       ; 6C64   0060
        SLR     R0,     1                       ; 6C65   0060
        SLR     R0,     1                       ; 6C66   0060
        SLR     R0,     1                       ; 6C67   0060
        CMP@    R4,     R0                      ; 6C68   0360
        AND     G_03A0, R0                      ; 6C69   0380 03A0
        XOR     G_03E0, R0                      ; 6C6B   03C0 03E0
        ADD@    R4,     R0                      ; 6C6D   02E0
        ADDR    R4,     R0                      ; 6C6E   00E0
L_6C6F:
        ADDR    R4,     R0                      ; 6C6F   00E0
        ADDR    R4,     R0                      ; 6C70   00E0
        XORR    R4,     R0                      ; 6C71   01E0
        XOR@    R4,     R0                      ; 6C72   03E0
        ADD@    R4,     R0                      ; 6C73   02E0
        ADDR    R4,     R0                      ; 6C74   00E0
        ADDR    R4,     R0                      ; 6C75   00E0
        ADDR    R4,     R0                      ; 6C76   00E0
        ADDR    R4,     R0                      ; 6C77   00E0
        ADD     .BTAB.A0,R0                     ; 6C78   02C0 02A0
        MVI     .IV.ALD,R0                      ; 6C7A   0280 0080
        MVO@    R0,     R4                      ; 6C7C   0260
        MVO     R0,     G_0340                  ; 6C7D   0240 0340
        CMPR    R4,     R0                      ; 6C7F   0160
        MVO     R0,     G_0040                  ; 6C80   0240 0040
        B       L_6C63                          ; 6C82   0220 0020

        NEGR    R0                              ; 6C84   0020
        SUB@    R4,     R0                      ; 6C85   0320
        CMP     G_0360, R0                      ; 6C86   0340 0360
        AND     G_00A0, R0                      ; 6C88   0380 00A0
        MOVR    R4,     R0                      ; 6C8A   00A0
L_6C8B:
        MVI     .IV.ALD,R0                      ; 6C8B   0280 0080
        AND     G_03A0, R0                      ; 6C8D   0380 03A0
        CLRR    R0                              ; 6C8F   01C0
        MVI@    R4,     R0                      ; 6C90   02A0
        MVI     .IV.ALD,R0                      ; 6C91   0280 0080
        TSTR    R0                              ; 6C93   0080
        AND     .BTAB.80,R0                     ; 6C94   0380 0280
        TSTR    R0                              ; 6C96   0080
        TSTR    R0                              ; 6C97   0080
        TSTR    R0                              ; 6C98   0080
        MVO@    R0,     R4                      ; 6C99   0260
        MVO     R0,     .BTAB.20                ; 6C9A   0240 0220
        SUB@    R5,     R1                      ; 6C9C   0329
        CMP@    R1,     R2                      ; 6C9D   034A
        CMPR    R7,     R3                      ; 6C9E   017B
        SAR     R3,     1                       ; 6C9F   006B
        MVO@    R4,     R3                      ; 6CA0   025C
        SLLC    R0,     2                       ; 6CA1   005C
        BNEQ    L_6C6F                          ; 6CA2   022C 0034

L_6CA4:
        GSWD    R3                              ; 6CA4   0033
        RSWD    R3                              ; 6CA5   003B
        SUBI    #$034B, R3                      ; 6CA6   033B 034B
        CMPI    #$027C, R4                      ; 6CA8   037C 027C
        SAR     R0,     2                       ; 6CAA   006C
        SARC    R1,     2                       ; 6CAB   007D
        RRC     R0,     2                       ; 6CAC   0074
        SARC    R0,     2                       ; 6CAD   007C
        MVO@    R3,     R2                      ; 6CAE   0253
        DECLE   $0232                           ; 6CAF   0232

        SUBR    R6,     R1                      ; 6CB0   0131
        RSWD    R1                              ; 6CB1   0039
        RSWD    R1                              ; 6CB2   0039
        RSWD    R1                              ; 6CB3   0039
        SUBI    #$0359, R1                      ; 6CB4   0339 0359
        CMPR    R7,     R1                      ; 6CB6   0179
        SAR     R1,     1                       ; 6CB7   0069
        MVO@    R2,     R1                      ; 6CB8   024A
        SLL     R3,     1                       ; 6CB9   004B
        CMPR    R2,     R3                      ; 6CBA   0153
        CMP@    R1,     R3                      ; 6CBB   034B
        MVO@    R3,     R2                      ; 6CBC   0253
        BMI     L_6C8B                          ; 6CBD   022B 0033

        SUBI    #$0152, R3                      ; 6CBF   033B 0152
        RLC     R1,     1                       ; 6CC1   0051
        SWAP    R0,     1                       ; 6CC2   0040
        B       L_6CA4                          ; 6CC3   0220 0020

        NEGR    R0                              ; 6CC5   0020
        NEGR    R0                              ; 6CC6   0020
        SUB@    R4,     R0                      ; 6CC7   0320
        CMP     .BTAB.40,R0                     ; 6CC8   0340 0240
        SWAP    R0,     1                       ; 6CCA   0040
        SWAP    R0,     1                       ; 6CCB   0040
        SWAP    R0,     1                       ; 6CCC   0040
        CMP     G_0060, R0                      ; 6CCD   0340 0060
        SLR     R0,     1                       ; 6CCF   0060
        SLR     R0,     1                       ; 6CD0   0060
        SLR     R0,     1                       ; 6CD1   0060
        MVO     R0,     G_0040                  ; 6CD2   0240 0040
        CMP     G_0360, R0                      ; 6CD4   0340 0360
        AND     G_03A0, R0                      ; 6CD6   0380 03A0
        XOR     G_03E0, R0                      ; 6CD8   03C0 03E0
        ADD@    R4,     R0                      ; 6CDA   02E0
        ADDR    R4,     R0                      ; 6CDB   00E0
        ADD     G_00C0, R0                      ; 6CDC   02C0 00C0
        MVI@    R4,     R0                      ; 6CDE   02A0
        MOVR    R4,     R0                      ; 6CDF   00A0
        AND@    R4,     R0                      ; 6CE0   03A0
        XOR     .BTAB.C0,R0                     ; 6CE1   03C0 02C0
        MVI@    R4,     R0                      ; 6CE3   02A0
        MVI     .BTAB.60,R0                     ; 6CE4   0280 0260
        SLR     R0,     1                       ; 6CE6   0060
        SLR     R0,     1                       ; 6CE7   0060
        SLR     R0,     1                       ; 6CE8   0060
        SLR     R0,     1                       ; 6CE9   0060
        SLR     R0,     1                       ; 6CEA   0060
        MVO     R0,     G_0040                  ; 6CEB   0240 0040
        SWAP    R0,     1                       ; 6CED   0040
        B       L_6BCF                          ; 6CEE   0220 0120

        SUBR    R4,     R0                      ; 6CF0   0120
        SUBR    R4,     R0                      ; 6CF1   0120
        SUBR    R4,     R0                      ; 6CF2   0120
        SUBR    R4,     R0                      ; 6CF3   0120
        SUBR    R4,     R0                      ; 6CF4   0120
        SUBR    R4,     R0                      ; 6CF5   0120
        SUBR    R4,     R0                      ; 6CF6   0120
        SUB@    R4,     R0                      ; 6CF7   0320
L_6CF8:
        SWAP    R0,     1                       ; 6CF8   0040
        B       L_6CF8                          ; 6CF9   0220 0002

        CMPR    R1,     R0                      ; 6CFB   0148
        MOVR    R3,     R0                      ; 6CFC   0098
        MOVR    R0,     R7                      ; 6CFD   0087
        SUBR    R4,     R0                      ; 6CFE   0120
        SUB@    R4,     R0                      ; 6CFF   0320
        CMP     G_0360, R0                      ; 6D00   0340 0360
        MVO@    R0,     R4                      ; 6D02   0260
        SLR     R0,     1                       ; 6D03   0060
        SLR     R0,     1                       ; 6D04   0060
        MVO     R0,     G_0040                  ; 6D05   0240 0040
        SWAP    R0,     1                       ; 6D07   0040
        CMP     G_0360, R0                      ; 6D08   0340 0360
        AND     G_00A0, R0                      ; 6D0A   0380 00A0
        AND@    R4,     R0                      ; 6D0C   03A0
        ADDR    R0,     R0                      ; 6D0D   00C0
        ADDR    R0,     R0                      ; 6D0E   00C0
        XOR     .BTAB.C0,R0                     ; 6D0F   03C0 02C0
        ADDR    R0,     R0                      ; 6D11   00C0
        ADDR    R0,     R0                      ; 6D12   00C0
        CLRR    R0                              ; 6D13   01C0
        CLRR    R0                              ; 6D14   01C0
        ADDR    R0,     R0                      ; 6D15   00C0
        CLRR    R0                              ; 6D16   01C0
        CLRR    R0                              ; 6D17   01C0
        ADDR    R0,     R0                      ; 6D18   00C0
        ADDR    R0,     R0                      ; 6D19   00C0
        MVI@    R4,     R0                      ; 6D1A   02A0
        MVI     .BTAB.60,R0                     ; 6D1B   0280 0260
        SLR     R0,     1                       ; 6D1D   0060
        SLR     R0,     1                       ; 6D1E   0060
        MVO     R0,     G_00D6                  ; 6D1F   0240 00D6
L_6D21:
        CMPR    R2,     R6                      ; 6D21   0156
        MVI     .BTAB.95,R5                     ; 6D22   0285 0295
        BLT     L_6DFB                          ; 6D24   0205 00D5

        CMPR    R0,     R6                      ; 6D26   0146
        ADDR    R2,     R5                      ; 6D27   00D5
        MVO     R4,     .BTAB.94                ; 6D28   0244 0294
        BEQ     L_6E81                          ; 6D2A   0204 0155

        MVI     G_0155, R4                      ; 6D2C   0284 0155
        MVI     G_0154, R3                      ; 6D2E   0283 0154
        MVI     G_0153, R2                      ; 6D30   0282 0153
        BPL     L_6F87                          ; 6D32   0203 0253

        MVI     G_0147, R6                      ; 6D34   0286 0147
        MVI     G_0157, R6                      ; 6D36   0286 0157
        MVI     G_0157, R6                      ; 6D38   0286 0157
        MOVR    R0,     R6                      ; 6D3A   0086
        MVI@    R2,     R5                      ; 6D3B   0295
        MVI     .BTAB.95,R5                     ; 6D3C   0285 0295
        MVI     .BTAB.15,R5                     ; 6D3E   0285 0215
        MOVR    R0,     R4                      ; 6D40   0084
        MVO@    R4,     R2                      ; 6D41   0254
        CMPR    R1,     R0                      ; 6D42   0148
        MVI@    R2,     R7                      ; 6D43   0297
        CMPR    R0,     R7                      ; 6D44   0147
        MVI@    R2,     R7                      ; 6D45   0297
        CMPR    R1,     R0                      ; 6D46   0148
        MVI@    R2,     R7                      ; 6D47   0297
        CMPR    R1,     R0                      ; 6D48   0148
        CMP@    R2,     R4                      ; 6D49   0354
        CMP     .BTAB.94,R4                     ; 6D4A   0344 0294
        MVO     R4,     .BTAB.14                ; 6D4C   0244 0214
        BEQ     L_6F64                          ; 6D4E   0204 0214
        BEQ     L_6EA9                          ; 6D50   0204 0157

        MVI     G_0156, R6                      ; 6D52   0286 0156
        MVI     G_0156, R5                      ; 6D54   0285 0156
        MVI     .BTAB.96,R6                     ; 6D56   0286 0296
        CMPR    R0,     R7                      ; 6D58   0147
        MOVR    R3,     R0                      ; 6D59   0098
        MVO@    R0,     R1                      ; 6D5A   0248
        MVI@    R3,     R0                      ; 6D5B   0298
        MVI     .BTAB.97,R7                     ; 6D5C   0287 0297
        MOVR    R0,     R6                      ; 6D5E   0086
        MVI@    R2,     R6                      ; 6D5F   0296
        MVI     .BTAB.95,R6                     ; 6D60   0286 0295
        CMPR    R0,     R6                      ; 6D62   0146
        MVI@    R2,     R5                      ; 6D63   0295
        CMPR    R0,     R6                      ; 6D64   0146
        MVI@    R2,     R4                      ; 6D65   0294
        CMPR    R0,     R5                      ; 6D66   0145
        MVO@    R4,     R2                      ; 6D67   0254
        CMPR    R0,     R5                      ; 6D68   0145
        DECLE   $0214                           ; 6D69   0214

        CMPR    R0,     R7                      ; 6D6A   0147
        MVI@    R2,     R7                      ; 6D6B   0297
        MVI     .BTAB.56,R6                     ; 6D6C   0286 0256
        MVI     .BTAB.96,R6                     ; 6D6E   0286 0296
        BLE     L_6EB8                          ; 6D70   0206 0146

        CMP@    R2,     R4                      ; 6D72   0354
        MVI     G_0155, R4                      ; 6D73   0284 0155
        MVI     G_0155, R4                      ; 6D75   0284 0155
        CMP     .BTAB.93,R4                     ; 6D77   0344 0293
        CMPR    R0,     R4                      ; 6D79   0144
        DECLE   $0213                           ; 6D7A   0213

        MVI     .BTAB.13,R4                     ; 6D7B   0284 0213
        MVI     .BTAB.13,R4                     ; 6D7D   0284 0213
        MVI     G_0343, R4                      ; 6D7F   0284 0343
        CMPR    R2,     R5                      ; 6D81   0155
        MVI     .BTAB.95,R5                     ; 6D82   0285 0295
        MVI     G_0142, R5                      ; 6D84   0285 0142
        CMP@    R2,     R2                      ; 6D86   0352
        BOV     L_6FDD                          ; 6D87   0202 0254

        MVI     .BTAB.93,R4                     ; 6D89   0284 0293
        CMPR    R0,     R7                      ; 6D8B   0147
        MVI@    R2,     R6                      ; 6D8C   0296
        CMPR    R0,     R7                      ; 6D8D   0147
        CMP@    R2,     R4                      ; 6D8E   0354
        CMP     .BTAB.94,R4                     ; 6D8F   0344 0294
        MVO     R4,     .BTAB.14                ; 6D91   0244 0214
        BEQ     L_6FA9                          ; 6D93   0204 0214
        BEQ     L_6EEE                          ; 6D95   0204 0157

        MVI     G_0357, R6                      ; 6D97   0286 0357
        MVI     G_0356, R5                      ; 6D99   0285 0356
        MVI     .BTAB.96,R6                     ; 6D9B   0286 0296
        ADDR    R1,     R0                      ; 6D9D   00C8
        CMP@    R3,     R1                      ; 6D9E   0359
        MVO@    R0,     R1                      ; 6D9F   0248
        MVI@    R3,     R0                      ; 6DA0   0298
        MVI     .BTAB.97,R7                     ; 6DA1   0287 0297
        MVI     .BTAB.96,R6                     ; 6DA3   0286 0296
        MVI     G_0156, R5                      ; 6DA5   0285 0156
        MVI     G_0155, R4                      ; 6DA7   0284 0155
        MVI     G_0155, R4                      ; 6DA9   0284 0155
        MVO     R4,     G_0155                  ; 6DAB   0244 0155
        MVI     G_0147, R4                      ; 6DAD   0284 0147
        DECLE   $0216                           ; 6DAF   0216

        CMPR    R3,     R0                      ; 6DB0   0158
        MVI     .BTAB.96,R7                     ; 6DB1   0287 0296
        MVO     R6,     .BTAB.96                ; 6DB3   0246 0296
        MVI     .BTAB.16,R6                     ; 6DB5   0286 0216
        CMPR    R2,     R6                      ; 6DB7   0156
        CMP     .BTAB.94,R4                     ; 6DB8   0344 0294
        CMPR    R0,     R5                      ; 6DBA   0145
        MVI@    R2,     R4                      ; 6DBB   0294
        CMPR    R0,     R5                      ; 6DBC   0145
        MOVR    R2,     R4                      ; 6DBD   0094
        MVI     G_0154, R3                      ; 6DBE   0283 0154
        BPL     G_7046                          ; 6DC0   0203 0284

        DECLE   $0213                           ; 6DC2   0213

        MVI     .BTAB.13,R4                     ; 6DC3   0284 0213
        MVI     G_0353, R4                      ; 6DC5   0284 0353
        CMPR    R0,     R6                      ; 6DC7   0146
        MVI@    R2,     R6                      ; 6DC8   0296
        MVI     .BTAB.96,R6                     ; 6DC9   0286 0296
        CMP     G_0354, R4                      ; 6DCB   0344 0354
        CMP     .BTAB.14,R4                     ; 6DCD   0344 0214
        CMP     .BTAB.55,R4                     ; 6DCF   0344 0255
        MVI     .BTAB.93,R5                     ; 6DD1   0285 0293
        CMPR    R0,     R7                      ; 6DD3   0147
        MVI@    R2,     R6                      ; 6DD4   0296
        MVI     .BTAB.96,R6                     ; 6DD5   0286 0296
        CMPR    R0,     R7                      ; 6DD7   0147
        CMPR    R2,     R7                      ; 6DD8   0157
        CMP     .BTAB.55,R5                     ; 6DD9   0345 0255
        MVI     .BTAB.05,R5                     ; 6DDB   0285 0205
        CMPR    R2,     R6                      ; 6DDD   0156
        MVI     G_0156, R5                      ; 6DDE   0285 0156
        MVI     G_0155, R4                      ; 6DE0   0284 0155
        MVI     G_0156, R4                      ; 6DE2   0284 0156
        BLE     G_703C                          ; 6DE4   0206 0256

        MVI     G_0158, R7                      ; 6DE6   0287 0158
        MVI     G_0148, R7                      ; 6DE8   0287 0148
        DECLE   $0217                           ; 6DEA   0217

        CMPR    R1,     R0                      ; 6DEB   0148
        CMPR    R0,     R6                      ; 6DEC   0146
        MVI@    R2,     R6                      ; 6DED   0296
        MVI     .BTAB.96,R6                     ; 6DEE   0286 0296
        MVI     .BTAB.16,R6                     ; 6DF0   0286 0216
        CMP     .BTAB.55,R5                     ; 6DF2   0345 0255
        CMPR    R0,     R7                      ; 6DF4   0147
        MVI@    R2,     R6                      ; 6DF5   0296
        CMPR    R0,     R6                      ; 6DF6   0146
        MVI@    R2,     R6                      ; 6DF7   0296
        SUBR    R4,     R0                      ; 6DF8   0120
        SUBR    R4,     R0                      ; 6DF9   0120
        SUBR    R4,     R0                      ; 6DFA   0120
L_6DFB:
        SUBR    R4,     R0                      ; 6DFB   0120
        SUBR    R4,     R0                      ; 6DFC   0120
        SUBR    R4,     R0                      ; 6DFD   0120
        SUBR    R4,     R0                      ; 6DFE   0120
        SUBR    R4,     R0                      ; 6DFF   0120
        SUBR    R4,     R0                      ; 6E00   0120
        TSTR    R6                              ; 6E01   00B6
        SUBR    R0,     R2                      ; 6E02   0102
        DECLE   $0216                           ; 6E03   0216

        SUBR    R2,     R2                      ; 6E04   0112
        BLE     L_6F08                          ; 6E05   0206 0101

        CMP@    R2,     R6                      ; 6E07   0356
        SUBR    R2,     R1                      ; 6E08   0111
        CMP     .ISRVEC.1,R6                    ; 6E09   0346 0101
        CMP@    R2,     R6                      ; 6E0B   0356
        SUBR    R2,     R1                      ; 6E0C   0111
        BUSC    L_6F10                          ; 6E0D   0207 0101

        CMP@    R2,     R7                      ; 6E0F   0357
        SUBR    R2,     R1                      ; 6E10   0111
        CMP     .ISRVEC.1,R6                    ; 6E11   0346 0101
        CMP@    R2,     R6                      ; 6E13   0356
        SUBR    R2,     R1                      ; 6E14   0111
        CMP     G_0102, R6                      ; 6E15   0346 0102
        CMP@    R2,     R6                      ; 6E17   0356
        SUBR    R2,     R2                      ; 6E18   0112
        CMP     G_0102, R6                      ; 6E19   0346 0102
        DECLE   $0216                           ; 6E1B   0216

        SUBR    R2,     R2                      ; 6E1C   0112
        BLE     L_6F21                          ; 6E1D   0206 0102

        DECLE   $0216                           ; 6E1F   0216

        CMP@    R2,     R1                      ; 6E20   0351
        BLE     G_7174                          ; 6E21   0206 0351

        CMP@    R2,     R6                      ; 6E23   0356
        CMP     G_0346, R1                      ; 6E24   0341 0346
        CMP@    R2,     R1                      ; 6E26   0351
        CMP@    R1,     R0                      ; 6E27   0348
        CMP     G_0358, R1                      ; 6E28   0341 0358
        CMP@    R2,     R1                      ; 6E2A   0351
        CMP@    R1,     R0                      ; 6E2B   0348
        CMP     G_0358, R1                      ; 6E2C   0341 0358
        CMP@    R2,     R1                      ; 6E2E   0351
        CMP@    R1,     R0                      ; 6E2F   0348
        CMP     .BTAB.D2,R1                     ; 6E30   0341 02D2
        CMP@    R2,     R1                      ; 6E32   0351
        ADD     G_0341, R2                      ; 6E33   02C2 0341
        MVO@    R2,     R2                      ; 6E35   0252
        CMP@    R2,     R1                      ; 6E36   0351
        CMP     G_0351, R2                      ; 6E37   0342 0351
        CMP     G_0341, R2                      ; 6E39   0342 0341
        CMP@    R2,     R2                      ; 6E3B   0352
        CMP@    R2,     R1                      ; 6E3C   0351
        BOV     L_6F40                          ; 6E3D   0202 0101

        DECLE   $0212                           ; 6E3F   0212

        CMP@    R2,     R7                      ; 6E40   0357
        BOV     G_718A                          ; 6E41   0202 0347

        DECLE   $0212                           ; 6E43   0212

        CMP@    R2,     R7                      ; 6E44   0357
        BOV     G_718E                          ; 6E45   0202 0347

        DECLE   $0212                           ; 6E47   0212

        CMP@    R2,     R7                      ; 6E48   0357
        CMP     G_0347, R2                      ; 6E49   0342 0347
        CMP@    R2,     R2                      ; 6E4B   0352
        CMP@    R2,     R4                      ; 6E4C   0354
        CMP     G_0344, R2                      ; 6E4D   0342 0344
        CMP@    R2,     R2                      ; 6E4F   0352
        CMP     G_0352, R4                      ; 6E50   0344 0352
        CMP     G_0352, R4                      ; 6E52   0344 0352
        CMP@    R2,     R4                      ; 6E54   0354
        CMP     G_0344, R5                      ; 6E55   0345 0344
        CMP@    R2,     R5                      ; 6E57   0355
        CMP@    R2,     R4                      ; 6E58   0354
        CMP     G_0354, R1                      ; 6E59   0341 0354
        CMP     G_0354, R1                      ; 6E5B   0341 0354
        CMP     G_0354, R1                      ; 6E5D   0341 0354
        CMP     G_0344, R1                      ; 6E5F   0341 0344
        CMP@    R2,     R1                      ; 6E61   0351
        CMP@    R2,     R4                      ; 6E62   0354
        CMP     G_0107, R1                      ; 6E63   0341 0107
        CMP@    R2,     R1                      ; 6E65   0351
        SUBR    R2,     R7                      ; 6E66   0117
        BC      L_6F70                          ; 6E67   0201 0107

        DECLE   $0211                           ; 6E69   0211

        SUBR    R2,     R7                      ; 6E6A   0117
        BC      L_6F74                          ; 6E6B   0201 0107

        DECLE   $0211                           ; 6E6D   0211

        SUBR    R2,     R7                      ; 6E6E   0117
        BC      G_71B2                          ; 6E6F   0201 0341

        ADD@    R2,     R1                      ; 6E71   02D1
        CMP@    R2,     R1                      ; 6E72   0351
        ADD     G_0341, R1                      ; 6E73   02C1 0341
        ADD@    R2,     R1                      ; 6E75   02D1
        CMP@    R2,     R1                      ; 6E76   0351
        ADD     G_0351, R1                      ; 6E77   02C1 0351
        ADD     G_0351, R1                      ; 6E79   02C1 0351
        ADD     G_0351, R1                      ; 6E7B   02C1 0351
        ADD     G_0351, R1                      ; 6E7D   02C1 0351
        ADD@    R2,     R1                      ; 6E7F   02D1
        CMP     .BTAB.41,R1                     ; 6E80   0341 0241
        CMP@    R2,     R1                      ; 6E82   0351
        CMP@    R3,     R0                      ; 6E83   0358
        CMP     G_0358, R1                      ; 6E84   0341 0358
        CMP@    R2,     R1                      ; 6E86   0351
        CMP@    R1,     R0                      ; 6E87   0348
        CMP     G_0358, R1                      ; 6E88   0341 0358
        CMP     G_0358, R1                      ; 6E8A   0341 0358
        CMP@    R2,     R1                      ; 6E8C   0351
        CMP     G_0351, R1                      ; 6E8D   0341 0351
        CMP     G_0351, R1                      ; 6E8F   0341 0351
        CMP     G_0341, R1                      ; 6E91   0341 0341
        CMP@    R2,     R1                      ; 6E93   0351
        CMP@    R2,     R1                      ; 6E94   0351
        CMP     G_0341, R1                      ; 6E95   0341 0341
        CMP@    R2,     R1                      ; 6E97   0351
        CMP@    R2,     R1                      ; 6E98   0351
        CMP     G_0341, R1                      ; 6E99   0341 0341
        CMP@    R2,     R1                      ; 6E9B   0351
        CMP@    R2,     R1                      ; 6E9C   0351
        CMP     G_0105, R1                      ; 6E9D   0341 0105
        CMP@    R2,     R3                      ; 6E9F   0353
        SUBR    R2,     R5                      ; 6EA0   0115
        CMP     G_0105, R1                      ; 6EA1   0341 0105
        CMP@    R2,     R1                      ; 6EA3   0351
        SUBR    R0,     R5                      ; 6EA4   0105
        CMP     G_0105, R1                      ; 6EA5   0341 0105
        CMP     G_0105, R1                      ; 6EA7   0341 0105
L_6EA9:
        CMP     G_0358, R1                      ; 6EA9   0341 0358
        CMP     G_0107, R1                      ; 6EAB   0341 0107
        CMP@    R2,     R1                      ; 6EAD   0351
        SUBR    R2,     R7                      ; 6EAE   0117
        CMP     G_0107, R1                      ; 6EAF   0341 0107
        CMP@    R2,     R1                      ; 6EB1   0351
        SUBR    R2,     R1                      ; 6EB2   0111
        ADD     .ISRVEC.1,R1                    ; 6EB3   02C1 0101
        ADD@    R2,     R1                      ; 6EB5   02D1
        SUBR    R2,     R1                      ; 6EB6   0111
        ADD     .ISRVEC.1,R1                    ; 6EB7   02C1 0101
        ADD@    R2,     R1                      ; 6EB9   02D1
        SUBR    R0,     R1                      ; 6EBA   0101
        ADD@    R2,     R1                      ; 6EBB   02D1
        SUBR    R0,     R1                      ; 6EBC   0101
        ADD@    R2,     R1                      ; 6EBD   02D1
        SUBR    R0,     R1                      ; 6EBE   0101
        ADD@    R2,     R1                      ; 6EBF   02D1
        SUBR    R0,     R1                      ; 6EC0   0101
        CMP@    R2,     R1                      ; 6EC1   0351
        SUBR    R2,     R1                      ; 6EC2   0111
        CMP     .ISRVEC.1,R7                    ; 6EC3   0347 0101
L_6EC5:
        CMP@    R2,     R7                      ; 6EC5   0357
        SUBR    R2,     R1                      ; 6EC6   0111
        CMP     .ISRVEC.0,R7                    ; 6EC7   0347 0100
L_6EC9:
        CMP@    R2,     R7                      ; 6EC9   0357
        SUBR    R0,     R0                      ; 6ECA   0100
        CMP     .ISRVEC.0,R7                    ; 6ECB   0347 0100
L_6ECD:
        CMP@    R2,     R7                      ; 6ECD   0357
        SUBR    R0,     R0                      ; 6ECE   0100
        CMP@    R1,     R0                      ; 6ECF   0348
        SUBR    R0,     R0                      ; 6ED0   0100
        CMP@    R3,     R0                      ; 6ED1   0358
        SUBR    R0,     R0                      ; 6ED2   0100
        CMPR    R0,     R7                      ; 6ED3   0147
        SUBR    R0,     R0                      ; 6ED4   0100
        CMP@    R2,     R7                      ; 6ED5   0357
        SUBR    R0,     R0                      ; 6ED6   0100
        CMP     .ISRVEC.1,R7                    ; 6ED7   0347 0101
        CMP@    R2,     R7                      ; 6ED9   0357
        CMP@    R2,     R2                      ; 6EDA   0352
        CMP     G_0342, R7                      ; 6EDB   0347 0342
        CMP@    R4,     R7                      ; 6EDD   0367
        CMP@    R2,     R2                      ; 6EDE   0352
        ADD     G_0342, R1                      ; 6EDF   02C1 0342
        CMP@    R2,     R1                      ; 6EE1   0351
        CMP@    R2,     R2                      ; 6EE2   0352
        CMP     G_0342, R1                      ; 6EE3   0341 0342
        CMP@    R2,     R1                      ; 6EE5   0351
        CMP@    R2,     R2                      ; 6EE6   0352
        CMP     G_0352, R1                      ; 6EE7   0341 0352
        CMP     G_0352, R1                      ; 6EE9   0341 0352
        CMP     G_0348, R1                      ; 6EEB   0341 0348
        CMP@    R2,     R1                      ; 6EED   0351
L_6EEE:
        CMP@    R3,     R0                      ; 6EEE   0358
        CMP     G_0348, R1                      ; 6EEF   0341 0348
        CMP@    R2,     R1                      ; 6EF1   0351
        CMP@    R3,     R0                      ; 6EF2   0358
        CMP     G_0348, R1                      ; 6EF3   0341 0348
        CMP@    R2,     R1                      ; 6EF5   0351
        CMP@    R3,     R0                      ; 6EF6   0358
        CMP     G_0348, R1                      ; 6EF7   0341 0348
        CMP@    R2,     R1                      ; 6EF9   0351
        CMP@    R3,     R0                      ; 6EFA   0358
        CMP     G_0341, R1                      ; 6EFB   0341 0341
        ADD@    R2,     R1                      ; 6EFD   02D1
        CMP@    R2,     R1                      ; 6EFE   0351
        ADD     G_0341, R1                      ; 6EFF   02C1 0341
        ADD@    R2,     R1                      ; 6F01   02D1
        CMP@    R2,     R1                      ; 6F02   0351
        ADD     G_0351, R1                      ; 6F03   02C1 0351
        ADD     G_0351, R1                      ; 6F05   02C1 0351
        ADD     G_0351, R1                      ; 6F07   02C1 0351
        ADD     G_0341, R1                      ; 6F09   02C1 0341
        ADD@    R2,     R1                      ; 6F0B   02D1
        CMP@    R2,     R1                      ; 6F0C   0351
        MVO     R1,     G_0341                  ; 6F0D   0241 0341
        CMP@    R3,     R0                      ; 6F0F   0358
L_6F10:
        CMP@    R2,     R1                      ; 6F10   0351
        CMP     G_0341, R7                      ; 6F11   0347 0341
        CMP@    R2,     R7                      ; 6F13   0357
        CMP@    R2,     R1                      ; 6F14   0351
        CMP     G_0341, R7                      ; 6F15   0347 0341
        CMP@    R2,     R7                      ; 6F17   0357
        CMP@    R2,     R1                      ; 6F18   0351
        CMP     G_0341, R7                      ; 6F19   0347 0341
        CMP@    R2,     R6                      ; 6F1B   0356
        CMP@    R2,     R1                      ; 6F1C   0351
        CMP     G_0341, R6                      ; 6F1D   0346 0341
        CMP@    R2,     R6                      ; 6F1F   0356
        CMP@    R2,     R3                      ; 6F20   0353
L_6F21:
        CMP     G_0343, R6                      ; 6F21   0346 0343
        CMP@    R2,     R6                      ; 6F23   0356
        CMP@    R2,     R3                      ; 6F24   0353
        CMP     G_0102, R6                      ; 6F25   0346 0102
        CMP@    R2,     R6                      ; 6F27   0356
        SUBR    R2,     R2                      ; 6F28   0112
        CMP     G_0102, R6                      ; 6F29   0346 0102
        CMP@    R2,     R6                      ; 6F2B   0356
        CMP@    R2,     R2                      ; 6F2C   0352
        CMPR    R0,     R6                      ; 6F2D   0146
        CMP     G_0156, R2                      ; 6F2E   0342 0156
        CMP@    R2,     R2                      ; 6F30   0352
        CMPR    R0,     R6                      ; 6F31   0146
        SUBR    R0,     R2                      ; 6F32   0102
        CMP@    R2,     R7                      ; 6F33   0357
L_6F34:
        SUBR    R2,     R1                      ; 6F34   0111
        CMP     G_0341, R7                      ; 6F35   0347 0341
        CMP@    R2,     R7                      ; 6F37   0357
        CMP@    R2,     R1                      ; 6F38   0351
        CMP     G_0341, R7                      ; 6F39   0347 0341
        CMP@    R4,     R7                      ; 6F3B   0367
        CMP@    R2,     R1                      ; 6F3C   0351
        ADD     G_0341, R1                      ; 6F3D   02C1 0341
        CMP@    R2,     R1                      ; 6F3F   0351
L_6F40:
        CMP@    R2,     R1                      ; 6F40   0351
        CMP     G_0351, R1                      ; 6F41   0341 0351
        CMP     G_0341, R1                      ; 6F43   0341 0341
        CMP@    R2,     R1                      ; 6F45   0351
        CMP     G_0351, R1                      ; 6F46   0341 0351
        CMP     G_0351, R1                      ; 6F48   0341 0351
        CMP@    R3,     R0                      ; 6F4A   0358
        CMP     G_0348, R1                      ; 6F4B   0341 0348
        CMP@    R2,     R1                      ; 6F4D   0351
        CMP@    R3,     R0                      ; 6F4E   0358
        CMP     G_0348, R1                      ; 6F4F   0341 0348
        CMP@    R2,     R1                      ; 6F51   0351
        CMP@    R3,     R0                      ; 6F52   0358
        CMP     G_0341, R1                      ; 6F53   0341 0341
        ADD@    R2,     R1                      ; 6F55   02D1
        CMP@    R2,     R1                      ; 6F56   0351
        ADD     G_0341, R1                      ; 6F57   02C1 0341
        ADD@    R2,     R1                      ; 6F59   02D1
        CMP@    R2,     R1                      ; 6F5A   0351
        ADD     G_0341, R1                      ; 6F5B   02C1 0341
        MVO@    R1,     R2                      ; 6F5D   0251
        CMP     .BTAB.D1,R1                     ; 6F5E   0341 02D1
        CMP     .BTAB.D1,R1                     ; 6F60   0341 02D1
        CMP     .BTAB.D1,R1                     ; 6F62   0341 02D1
L_6F64:
        CMP@    R2,     R1                      ; 6F64   0351
        CMP@    R1,     R0                      ; 6F65   0348
        CMP     G_0358, R1                      ; 6F66   0341 0358
        CMP@    R2,     R1                      ; 6F68   0351
        CMP@    R1,     R0                      ; 6F69   0348
        CMP     .BTAB.97,R1                     ; 6F6A   0341 0297
        CMP@    R2,     R1                      ; 6F6C   0351
        BUSC    G_72B0                          ; 6F6D   0207 0341

        MVO@    R7,     R2                      ; 6F6F   0257
L_6F70:
        SUBR    R4,     R0                      ; 6F70   0120
        SUBR    R4,     R0                      ; 6F71   0120
        SUBR    R4,     R0                      ; 6F72   0120
        SUBR    R4,     R0                      ; 6F73   0120
L_6F74:
        SUBR    R4,     R0                      ; 6F74   0120
        SUBR    R4,     R0                      ; 6F75   0120
        SUBR    R4,     R0                      ; 6F76   0120
        SUBR    R4,     R0                      ; 6F77   0120
        SUBR    R4,     R0                      ; 6F78   0120
        SUBR    R4,     R0                      ; 6F79   0120
        SAR     R3,     1                       ; 6F7A   006B
        CMP@    R2,     R7                      ; 6F7B   0357
        MVI     G_0377, R7                      ; 6F7C   0287 0377
        CMP     .BTAB.52,R2                     ; 6F7E   0342 0252
        MVO@    R0,     R1                      ; 6F80   0248
        MVI@    R3,     R0                      ; 6F81   0298
        CMPR    R1,     R0                      ; 6F82   0148
        CMPR    R2,     R7                      ; 6F83   0157
        BUSC    G_719D                          ; 6F84   0207 0217

        CMP     G_0342, R2                      ; 6F86   0342 0342
        CMP     .BTAB.55,R2                     ; 6F88   0342 0255
        MVI     G_00D5, R5                      ; 6F8A   0285 00D5
        MVI     G_0366, R6                      ; 6F8C   0286 0366
        CMP     G_0341, R2                      ; 6F8E   0342 0341
        CMP@    R2,     R1                      ; 6F90   0351
        CMPR    R1,     R0                      ; 6F91   0148
        SUB@    R3,     R0                      ; 6F92   0318
        SUB@    R1,     R0                      ; 6F93   0308
        SUB@    R3,     R0                      ; 6F94   0318
        SUB@    R3,     R0                      ; 6F95   0318
        SUB@    R1,     R0                      ; 6F96   0308
        SUB@    R3,     R0                      ; 6F97   0318
        CMPR    R1,     R0                      ; 6F98   0148
        CMP@    R2,     R4                      ; 6F99   0354
        BLT     G_72F0                          ; 6F9A   0205 0354

        DECLE   $0214                           ; 6F9C   0214

        CMP     .BTAB.03,R3                     ; 6F9D   0343 0203
        CMP@    R2,     R3                      ; 6F9F   0353
        CMP     G_0343, R3                      ; 6FA0   0343 0343
        CMP@    R2,     R3                      ; 6FA2   0353
        CMP     G_0158, R2                      ; 6FA3   0342 0158
        CMPR    R3,     R0                      ; 6FA5   0158
        CMP     G_0352, R2                      ; 6FA6   0342 0352
        CMP     .BTAB.52,R2                     ; 6FA8   0342 0252
        CMP     .BTAB.92,R2                     ; 6FAA   0342 0292
        BOV     G_7300                          ; 6FAC   0202 0352

        MVO     R6,     G_0356                  ; 6FAE   0246 0356
        CMP     .BTAB.52,R2                     ; 6FB0   0342 0252
        MVI     .BTAB.48,R5                     ; 6FB2   0285 0248
        CMP@    R2,     R5                      ; 6FB4   0355
        CMP     .BTAB.52,R2                     ; 6FB5   0342 0252
        MVI     .BTAB.95,R5                     ; 6FB7   0285 0295
        CMP     G_0158, R2                      ; 6FB9   0342 0158
        SUB@    R1,     R0                      ; 6FBB   0308
        SUB@    R1,     R0                      ; 6FBC   0308
        SUB@    R3,     R0                      ; 6FBD   0318
        SUB@    R1,     R0                      ; 6FBE   0308
        SUB@    R3,     R0                      ; 6FBF   0318
        SUB@    R1,     R0                      ; 6FC0   0308
        CMPR    R3,     R0                      ; 6FC1   0158
        CMP     G_0355, R2                      ; 6FC2   0342 0355
        CMP     .BTAB.55,R5                     ; 6FC4   0345 0255
        CMP     G_0342, R2                      ; 6FC6   0342 0342
        MVI@    R2,     R4                      ; 6FC8   0294
        MVI     .BTAB.96,R5                     ; 6FC9   0285 0296
        CMP     G_0158, R4                      ; 6FCB   0344 0158
        SUB@    R1,     R0                      ; 6FCD   0308
        SUB@    R3,     R0                      ; 6FCE   0318
        SUB@    R1,     R0                      ; 6FCF   0308
        SUB@    R3,     R0                      ; 6FD0   0318
        SUB@    R1,     R0                      ; 6FD1   0308
        SUB@    R3,     R0                      ; 6FD2   0318
        SUB@    R1,     R0                      ; 6FD3   0308
        SUB@    R3,     R0                      ; 6FD4   0318
        CMPR    R1,     R0                      ; 6FD5   0148
        CMP@    R2,     R2                      ; 6FD6   0352
        CMP     G_0355, R5                      ; 6FD7   0345 0355
        MVO     R5,     G_0352                  ; 6FD9   0245 0352
        CMP     G_0352, R2                      ; 6FDB   0342 0352
L_6FDD:
        CMP     G_0352, R2                      ; 6FDD   0342 0352
        MVI     G_0352, R2                      ; 6FDF   0282 0352
        CMP     G_0352, R2                      ; 6FE1   0342 0352
        MVO     R7,     .BTAB.47                ; 6FE3   0247 0247
        CMP@    R2,     R2                      ; 6FE5   0352
        CMP@    R2,     R2                      ; 6FE6   0352
        SUBR    R4,     R0                      ; 6FE7   0120
        SUBR    R4,     R0                      ; 6FE8   0120
        SUBR    R4,     R0                      ; 6FE9   0120
        SUBR    R4,     R0                      ; 6FEA   0120
        SUBR    R4,     R0                      ; 6FEB   0120
        SUBR    R4,     R0                      ; 6FEC   0120
        SUBR    R4,     R0                      ; 6FED   0120
        SUBR    R4,     R0                      ; 6FEE   0120
        SUBR    R4,     R0                      ; 6FEF   0120
        SUBR    R4,     R0                      ; 6FF0   0120
        SUBR    R4,     R0                      ; 6FF1   0120
        SUBR    R4,     R0                      ; 6FF2   0120
        SUBR    R4,     R0                      ; 6FF3   0120
        SUBR    R4,     R0                      ; 6FF4   0120
        SUBR    R4,     R0                      ; 6FF5   0120
        SUBR    R4,     R0                      ; 6FF6   0120
        SUBR    R4,     R0                      ; 6FF7   0120
        SUBR    R4,     R0                      ; 6FF8   0120
        SUBR    R4,     R0                      ; 6FF9   0120
        SUBR    R4,     R0                      ; 6FFA   0120
        SUBR    R4,     R0                      ; 6FFB   0120
        SUBR    R4,     R0                      ; 6FFC   0120
        SUBR    R4,     R0                      ; 6FFD   0120
        SUBR    R4,     R0                      ; 6FFE   0120
        CMP@    R3,     R2                      ; 6FFF   035A

        ORG     $D000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D000   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D004   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D008   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D00C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D010   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D014   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D018   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D01C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D020   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D024   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D028   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D02C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D030   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D034   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D038   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D03C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D040   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D044   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D048   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D04C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D050   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D054   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D058   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D05C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D060   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D064   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D068   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D06C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D070   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D074   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D078   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D07C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D080   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D084   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D088   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D08C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D090   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D094   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D098   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D09C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0A0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0A4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0A8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0AC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0B0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0B4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0B8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0BC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0C0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0C4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0C8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0CC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0D0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0D4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0D8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0DC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0E0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0E4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0E8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0EC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0F0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0F4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0F8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0FC   0000 0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;; ======================================================================== ;;
