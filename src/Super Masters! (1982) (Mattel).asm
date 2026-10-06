
        ORG     $5000
.HEADER:
        MOVR    R3,     R6                      ; 5000   009E
        SLLC    R2,     2                       ; 5001   005E
        INCR    R5                              ; 5002   000D
        RLC     R0,     1                       ; 5003   0050
        INCR    R5                              ; 5004   000D
        RLC     R0,     1                       ; 5005   0050
        INCR    R5                              ; 5006   000D
        RLC     R0,     1                       ; 5007   0050
        INCR    R5                              ; 5008   000D
        RLC     R0,     1                       ; 5009   0050
        INCR    R5                              ; 500A   000D
        RLC     R0,     1                       ; 500B   0050
        ADDR    R0,     R0                      ; 500C   00C0
        RLC     R2,     1                       ; 500D   0052
        RLC     R3,     1                       ; 500E   0053
        RLC     R1,     2                       ; 500F   0055
        RLC     R0,     1                       ; 5010   0050
        SWAP    R1,     2                       ; 5011   0045
        RLC     R2,     1                       ; 5012   0052
        NEGR    R0                              ; 5013   0020
        SLL     R1,     2                       ; 5014   004D
        SWAP    R1,     1                       ; 5015   0041
        RLC     R3,     1                       ; 5016   0053
        RLC     R0,     2                       ; 5017   0054
        SWAP    R1,     2                       ; 5018   0045
        RLC     R2,     1                       ; 5019   0052
        RLC     R3,     1                       ; 501A   0053
        NEGR    R1                              ; 501B   0021
        DECLE   $0000                           ; 501C   0000

        CLRR    R0                              ; 501D   01C0
        MVO     R0,     G_0102                  ; 501E   0240 0102
        MVII    #$02F1, R6                      ; 5020   02BE 02F1

        JSR     R5,     L_516F                  ; 5022   0004 0150 016F

        ADDR    R7,     R1                      ; 5025   00F9
        SLLC    R1,     1                       ; 5026   0059
        MVII    #$00EB, R0                      ; 5027   02B8 00EB
        MVII    #$0104, R4                      ; 5029   02BC 0104

        JSR     R5,     X_FILL_ZERO             ; 502B   0004 0114 0338
        JSR     R5,     L_51E2                  ; 502E   0004 0150 01E2
        JSR     R5,     L_50F5                  ; 5031   0004 0150 00F5

        MVII    #$00F0, R0                      ; 5034   02B8 00F0
        MVII    #$0200, R4                      ; 5036   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5038   0004 0114 0338
        JSR     R5,     .EXEC.A83               ; 503B   0004 0118 0283
        JSR     R5,     L_5213                  ; 503E   0004 0150 0213

L_5041:
        EIS                                     ; 5041   0002
        MVI     G_0102, R0                      ; 5042   0280 0102
        DECR    R0                              ; 5044   0010
        BPL     L_5041                          ; 5045   0223 0005

        JSR     R5,     L_53A0                  ; 5047   0004 0150 03A0
        JSR     R5,     L_528B                  ; 504A   0004 0150 028B
        JSR     R5,     L_55B2                  ; 504D   0004 0154 01B2
        JSR     R5,     L_58C3                  ; 5050   0004 0158 00C3

        MVII    #$0001, R0                      ; 5053   02B8 0001

        JSR     R5,     X_RAND1                 ; 5055   0004 0114 027D
        JSR     R5,     L_51AE                  ; 5058   0004 0150 01AE
        JSR     R5,     .EXEC.AAD               ; 505B   0004 0118 02AD
        JSR     R5,     L_5118                  ; 505E   0004 0150 0118

        MVI     G_012D, R1                      ; 5061   0281 012D
        CLRR    R2                              ; 5063   01D2
        SLL     R1,     2                       ; 5064   004D
        SLL     R1,     1                       ; 5065   0049
        ADDI    #$0086, R1                      ; 5066   02F9 0086
        ADDI    #$0201, R2                      ; 5068   02FA 0201
        MVO@    R1,     R2                      ; 506A   0251
        CLRR    R1                              ; 506B   01C9
        MVO     R1,     G_012D                  ; 506C   0241 012D
        MVI     G_0103, R1                      ; 506E   0281 0103
        MVO     R1,     G_0102                  ; 5070   0241 0102
        B       L_5041                          ; 5072   0220 0032

L_5074:
        MVI@    R5,     R3                      ; 5074   02AB
L_5075:
        MVI@    R5,     R2                      ; 5075   02AA
        SDBD                                    ; 5076   0001
        MVI@    R5,     R1                      ; 5077   02A9
L_5078:
        MVI@    R3,     R0                      ; 5078   0298
        CMPR    R1,     R0                      ; 5079   0148
        BLT     L_5083                          ; 507A   0205 0007

        ADDR    R2,     R1                      ; 507C   00D1
        ADDI    #$0010, R0                      ; 507D   02F8 0010
        CMPR    R1,     R0                      ; 507F   0148
        BLT     L_5084                          ; 5080   0205 0002

        SUBR    R2,     R1                      ; 5082   0111
L_5083:
        MOVR    R1,     R0                      ; 5083   0088
L_5084:
        MOVR    R5,     R7                      ; 5084   00AF
        MVI@    R5,     R3                      ; 5085   02AB
L_5086:
        MVI@    R5,     R2                      ; 5086   02AA
        SDBD                                    ; 5087   0001
        MVI@    R5,     R1                      ; 5088   02A9
        MVI@    R3,     R0                      ; 5089   0298
        SUBI    #$0010, R0                      ; 508A   0338 0010
        CMPR    R1,     R0                      ; 508C   0148
        BGE     L_5084                          ; 508D   022D 000A

        SUBR    R2,     R1                      ; 508F   0111
        ADDR    R2,     R1                      ; 5090   00D1
        MOVR    R1,     R0                      ; 5091   0088
        MOVR    R5,     R7                      ; 5092   00AF
L_5093:
        SDBD                                    ; 5093   0001
        MVI@    R5,     R1                      ; 5094   02A9
        SDBD                                    ; 5095   0001
        MVI@    R5,     R2                      ; 5096   02AA
        SDBD                                    ; 5097   0001
        MVI@    R5,     R0                      ; 5098   02A8
        MVO@    R1,     R4                      ; 5099   0261
        PSHR    R4                              ; 509A   0274
        ADDI    #$0007, R4                      ; 509B   02FC 0007
        MVO@    R2,     R4                      ; 509D   0262
        ADDI    #$0007, R4                      ; 509E   02FC 0007
        MVO@    R0,     R4                      ; 50A0   0260
        PULR    R4                              ; 50A1   02B4
        MOVR    R5,     R7                      ; 50A2   00AF
L_50A3:
        PSHR    R5                              ; 50A3   0275
        SLL     R1,     1                       ; 50A4   0049

        JSR     R5,     L_50CA                  ; 50A5   0004 0150 00CA
        DECLE   $0000,  $0000                   ; 50A8   0000 0000

        ADDR    R5,     R0                      ; 50AA   00E8
        ADDR    R7,     R7                      ; 50AB   00FF
        ADDR    R2,     R3                      ; 50AC   00D3
        ADDR    R7,     R7                      ; 50AD   00FF
        ADDR    R0,     R5                      ; 50AE   00C5
        ADDR    R7,     R7                      ; 50AF   00FF
        ADDR    R0,     R0                      ; 50B0   00C0
        ADDR    R7,     R7                      ; 50B1   00FF
        ADDR    R0,     R5                      ; 50B2   00C5
        ADDR    R7,     R7                      ; 50B3   00FF
        ADDR    R2,     R3                      ; 50B4   00D3
        ADDR    R7,     R7                      ; 50B5   00FF
        ADDR    R5,     R0                      ; 50B6   00E8
        ADDR    R7,     R7                      ; 50B7   00FF
        DECLE   $0000,  $0000                   ; 50B8   0000 0000

        COMR    R0                              ; 50BA   0018
        DECLE   $0000                           ; 50BB   0000

        ADCR    R5                              ; 50BC   002D
        DECLE   $0000                           ; 50BD   0000

        RSWD    R3                              ; 50BE   003B
        DECLE   $0000                           ; 50BF   0000

        SWAP    R0,     1                       ; 50C0   0040
        DECLE   $0000                           ; 50C1   0000

        RSWD    R3                              ; 50C2   003B
        DECLE   $0000                           ; 50C3   0000

        ADCR    R5                              ; 50C4   002D
        DECLE   $0000                           ; 50C5   0000

        COMR    R0                              ; 50C6   0018
        DECLE   $0000,  $0000,  $0000           ; 50C7   0000 0000 0000
L_50CA:
        ADDR    R1,     R5                      ; 50CA   00CD
        SDBD                                    ; 50CB   0001
        MVI@    R5,     R2                      ; 50CC   02AA
        SUBR    R1,     R5                      ; 50CD   010D
        ADDI    #$0016, R1                      ; 50CE   02F9 0016
        ANDI    #$001E, R1                      ; 50D0   03B9 001E
        ADDR    R1,     R5                      ; 50D2   00CD
        SDBD                                    ; 50D3   0001
        MVI@    R5,     R1                      ; 50D4   02A9
        CLRR    R3                              ; 50D5   01DB
        CLRR    R5                              ; 50D6   01ED
        SARC    R0,     1                       ; 50D7   0078
        BNC     L_50DC                          ; 50D8   0209 0002

        ADDR    R2,     R3                      ; 50DA   00D3
        ADDR    R1,     R5                      ; 50DB   00CD
L_50DC:
        SLL     R1,     1                       ; 50DC   0049
        SLL     R2,     1                       ; 50DD   004A
        SARC    R0,     1                       ; 50DE   0078
        BNC     L_50E3                          ; 50DF   0209 0002

        ADDR    R2,     R3                      ; 50E1   00D3
        ADDR    R1,     R5                      ; 50E2   00CD
L_50E3:
        SLL     R1,     1                       ; 50E3   0049
        SLL     R2,     1                       ; 50E4   004A
        SARC    R0,     1                       ; 50E5   0078
        BNC     L_50EA                          ; 50E6   0209 0002

        ADDR    R2,     R3                      ; 50E8   00D3
        ADDR    R1,     R5                      ; 50E9   00CD
L_50EA:
        SLL     R1,     1                       ; 50EA   0049
        SLL     R2,     1                       ; 50EB   004A
        SARC    R0,     1                       ; 50EC   0078
        BNC     L_50F1                          ; 50ED   0209 0002

        ADDR    R2,     R3                      ; 50EF   00D3
        ADDR    R1,     R5                      ; 50F0   00CD
L_50F1:
        SAR     R3,     1                       ; 50F1   006B
        MOVR    R5,     R0                      ; 50F2   00A8
        SAR     R0,     1                       ; 50F3   0068
        PULR    R7                              ; 50F4   02B7
L_50F5:
        MVII    #$01FE, R2                      ; 50F5   02BA 01FE
        MVII    #$01FF, R3                      ; 50F7   02BB 01FF
        MVII    #$00FF, R4                      ; 50F9   02BC 00FF
L_50FB:
        MVII    #$03FF, R1                      ; 50FB   02B9 03FF
L_50FD:
        MVI@    R3,     R0                      ; 50FD   0298
        AND@    R2,     R0                      ; 50FE   0390
        CMPR    R4,     R0                      ; 50FF   0160
        BEQ     L_50FB                          ; 5100   0224 0006

        DECR    R1                              ; 5102   0011
        BNEQ    L_50FD                          ; 5103   022C 0007

        CLRR    R1                              ; 5105   01C9
        MVI@    R2,     R0                      ; 5106   0290
        CMPR    R4,     R0                      ; 5107   0160
        BEQ     L_510B                          ; 5108   0204 0001

        INCR    R1                              ; 510A   0009
L_510B:
        MVO     R1,     G_0105                  ; 510B   0241 0105
L_510D:
        MVII    #$03FF, R1                      ; 510D   02B9 03FF
L_510F:
        MVI@    R3,     R0                      ; 510F   0298
        AND@    R2,     R0                      ; 5110   0390
        CMPR    R4,     R0                      ; 5111   0160
        BNEQ    L_510D                          ; 5112   022C 0006

        DECR    R1                              ; 5114   0011
        BNEQ    L_510F                          ; 5115   022C 0007

L_5117:
        MOVR    R5,     R7                      ; 5117   00AF
L_5118:
        MVI     G_0115, R0                      ; 5118   0280 0115
        DECR    R0                              ; 511A   0010
        MVO     R0,     G_0115                  ; 511B   0240 0115
        MVII    #$005A, R2                      ; 511D   02BA 005A
        CMP     .PSG0.rgt_hand,R2               ; 511F   0342 01FE
        BEQ     L_5132                          ; 5121   0204 000F

        CMP     .PSG0.lft_hand,R2               ; 5123   0342 01FF
        BEQ     L_5132                          ; 5125   0204 000B

        ANDI    #$007F, R0                      ; 5127   03B8 007F
        BNEQ    L_5117                          ; 5129   022C 0013

        MVI     G_0104, R0                      ; 512B   0280 0104
        DECR    R0                              ; 512D   0010
        MVO     R0,     G_0104                  ; 512E   0240 0104
        BNEQ    L_5117                          ; 5130   022C 001A

L_5132:
        PSHR    R5                              ; 5132   0275

        JSR     R5,     L_5AAB                  ; 5133   0004 0158 02AB

        MVI     .STIC.BORD,R0                   ; 5136   0280 002C
        PSHR    R0                              ; 5138   0270
        CLRR    R0                              ; 5139   01C0
        MVO     R0,     .STIC.BORD              ; 513A   0240 002C

        JSR     R5,     L_516F                  ; 513C   0004 0150 016F

        DECR    R7                              ; 513F   0017
        RLC     R1,     1                       ; 5140   0051
        MVII    #$01FB, R4                      ; 5141   02BC 01FB
        MOVR    R4,     R5                      ; 5143   00A5
        CLRR    R3                              ; 5144   01DB
        MVI@    R4,     R0                      ; 5145   02A0
        MVO@    R3,     R5                      ; 5146   026B
        MVI@    R4,     R1                      ; 5147   02A1
        MVO@    R3,     R5                      ; 5148   026B
        MVI@    R4,     R2                      ; 5149   02A2
        MVO@    R3,     R5                      ; 514A   026B
        PSHR    R0                              ; 514B   0270
        PSHR    R1                              ; 514C   0271
        PSHR    R2                              ; 514D   0272
L_514E:
        MVI     .PSG0.rgt_hand,R0               ; 514E   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 5150   0380 01FF
        CMPI    #$00FF, R0                      ; 5152   0378 00FF
        BNEQ    L_514E                          ; 5154   022C 0007

        JSR     R5,     L_50F5                  ; 5156   0004 0150 00F5
        JSR     R5,     L_5AAB                  ; 5159   0004 0158 02AB

        PULR    R2                              ; 515C   02B2
        PULR    R1                              ; 515D   02B1
        PULR    R0                              ; 515E   02B0
        MVII    #$01FB, R5                      ; 515F   02BD 01FB
        MVO@    R0,     R5                      ; 5161   0268
        MVO@    R1,     R5                      ; 5162   0269
        MVO@    R2,     R5                      ; 5163   026A
        PULR    R0                              ; 5164   02B0
        MVO     R0,     .STIC.BORD              ; 5165   0240 002C
        MVO     R0,     .STIC.VIDEN             ; 5167   0240 0020

        JSR     R5,     L_516F                  ; 5169   0004 0150 016F

        ADDR    R7,     R1                      ; 516C   00F9
        SLLC    R1,     1                       ; 516D   0059
        PULR    R7                              ; 516E   02B7
L_516F:
        MVI@    R5,     R0                      ; 516F   02A8
        MVI@    R5,     R1                      ; 5170   02A9
        MVO     R0,     .ISRVEC.0               ; 5171   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5173   0241 0101
        MOVR    R5,     R7                      ; 5175   00AF
        PSHR    R5                              ; 5176   0275
        MOVR    R2,     R5                      ; 5177   0095
        B       L_519A                          ; 5178   0200 0020

        SDBD                                    ; 517A   0001
        MVI@    R5,     R2                      ; 517B   02AA
        MVI@    R5,     R4                      ; 517C   02AC
L_517D:
        PSHR    R5                              ; 517D   0275
        MOVR    R2,     R5                      ; 517E   0095
        MOVR    R0,     R2                      ; 517F   0082
        ANDI    #$000F, R2                      ; 5180   03BA 000F
        SLL     R2,     1                       ; 5182   004A
        SLR     R0,     2                       ; 5183   0064
        SLR     R0,     2                       ; 5184   0064
        SUBI    #$0022, R2                      ; 5185   033A 0022
        SUBR    R2,     R7                      ; 5187   0117
        PSHR    R5                              ; 5188   0275
        MOVR    R2,     R5                      ; 5189   0095
L_518A:
        MVI@    R5,     R1                      ; 518A   02A9
        MVO@    R1,     R4                      ; 518B   0261
        MVI@    R5,     R1                      ; 518C   02A9
        MVO@    R1,     R4                      ; 518D   0261
        MVI@    R5,     R1                      ; 518E   02A9
        MVO@    R1,     R4                      ; 518F   0261
        MVI@    R5,     R1                      ; 5190   02A9
        MVO@    R1,     R4                      ; 5191   0261
        MVI@    R5,     R1                      ; 5192   02A9
        MVO@    R1,     R4                      ; 5193   0261
        MVI@    R5,     R1                      ; 5194   02A9
        MVO@    R1,     R4                      ; 5195   0261
        MVI@    R5,     R1                      ; 5196   02A9
        MVO@    R1,     R4                      ; 5197   0261
        MVI@    R5,     R1                      ; 5198   02A9
        MVO@    R1,     R4                      ; 5199   0261
L_519A:
        MVI@    R5,     R1                      ; 519A   02A9
        MVO@    R1,     R4                      ; 519B   0261
        MVI@    R5,     R1                      ; 519C   02A9
        MVO@    R1,     R4                      ; 519D   0261
        MVI@    R5,     R1                      ; 519E   02A9
        MVO@    R1,     R4                      ; 519F   0261
        MVI@    R5,     R1                      ; 51A0   02A9
        MVO@    R1,     R4                      ; 51A1   0261
        MVI@    R5,     R1                      ; 51A2   02A9
        MVO@    R1,     R4                      ; 51A3   0261
        MVI@    R5,     R1                      ; 51A4   02A9
        MVO@    R1,     R4                      ; 51A5   0261
        MVI@    R5,     R1                      ; 51A6   02A9
        MVO@    R1,     R4                      ; 51A7   0261
        MVI@    R5,     R1                      ; 51A8   02A9
        MVO@    R1,     R4                      ; 51A9   0261
        DECR    R0                              ; 51AA   0010
        BPL     L_518A                          ; 51AB   0223 0022

        PULR    R7                              ; 51AD   02B7
L_51AE:
        PSHR    R5                              ; 51AE   0275
        MVII    #$0080, R3                      ; 51AF   02BB 0080
        SDBD                                    ; 51B1   0001
        MVII    #$4300, R2                      ; 51B2   02BA 0000 0043
        MVII    #$010F, R4                      ; 51B5   02BC 010F
        MVII    #$0319, R5                      ; 51B7   02BD 0319
        MVI@    R4,     R0                      ; 51B9   02A0
        SWAP    R0,     1                       ; 51BA   0040
        XORR    R3,     R0                      ; 51BB   01D8
        ADDI    #$0002, R4                      ; 51BC   02FC 0002
        MVI@    R4,     R1                      ; 51BE   02A1
        XORR    R2,     R1                      ; 51BF   01D1
        INCR    R4                              ; 51C0   000C
        XOR@    R4,     R0                      ; 51C1   03E0
        MVO@    R1,     R5                      ; 51C2   0269
        MVO@    R1,     R5                      ; 51C3   0269
        ADDI    #$0006, R5                      ; 51C4   02FD 0006
        MVO@    R0,     R5                      ; 51C6   0268
        MVO@    R0,     R5                      ; 51C7   0268
        MVII    #$016D, R4                      ; 51C8   02BC 016D
        MVII    #$031B, R5                      ; 51CA   02BD 031B
L_51CC:
        MVI@    R4,     R0                      ; 51CC   02A0
        SWAP    R0,     1                       ; 51CD   0040
        XORR    R3,     R0                      ; 51CE   01D8
        ADDI    #$0002, R4                      ; 51CF   02FC 0002
        MVI@    R4,     R1                      ; 51D1   02A1
        XORR    R2,     R1                      ; 51D2   01D1
        INCR    R4                              ; 51D3   000C
        XOR@    R4,     R0                      ; 51D4   03E0
        MVO@    R1,     R5                      ; 51D5   0269
        ADDI    #$0007, R5                      ; 51D6   02FD 0007
        MVO@    R0,     R5                      ; 51D8   0268
        SUBI    #$0008, R5                      ; 51D9   033D 0008
        ADDI    #$000A, R4                      ; 51DB   02FC 000A
        CMPI    #$0320, R5                      ; 51DD   037D 0320
        BLE     L_51CC                          ; 51DF   0226 0014

        PULR    R7                              ; 51E1   02B7
L_51E2:
        PSHR    R5                              ; 51E2   0275
        EIS                                     ; 51E3   0002

        JSR     R5,     L_5AAB                  ; 51E4   0004 0158 02AB

        MVII    #$0000, R0                      ; 51E7   02B8 0000
        MVII    #$0028, R4                      ; 51E9   02BC 0028
        MVO@    R0,     R4                      ; 51EB   0260
        MVO@    R0,     R4                      ; 51EC   0260
        MVO@    R0,     R4                      ; 51ED   0260
        MVO@    R0,     R4                      ; 51EE   0260
        MVO@    R0,     R4                      ; 51EF   0260
        MVII    #$0021, R0                      ; 51F0   02B8 0021
        CLRR    R4                              ; 51F2   01E4

        JSR     R5,     X_FILL_ZERO             ; 51F3   0004 0114 0338

        MVII    #$0001, R3                      ; 51F6   02BB 0001
        MVII    #$023C, R4                      ; 51F8   02BC 023C

        JSR     R5,     X_PRINT_R5              ; 51FA   0004 0118 007B

        NEGR    R0                              ; 51FD   0020
        NEGR    R0                              ; 51FE   0020
        NEGR    R0                              ; 51FF   0020
        NEGR    R0                              ; 5200   0020
        RLC     R2,     1                       ; 5201   0052
        SWAP    R1,     1                       ; 5202   0041
        SLLC    R1,     1                       ; 5203   0059
        NEGR    R0                              ; 5204   0020
        SLL     R3,     1                       ; 5205   004B
        SWAP    R1,     1                       ; 5206   0041
        SWAP    R1,     2                       ; 5207   0045
        RLC     R3,     1                       ; 5208   0053
        RLC     R0,     2                       ; 5209   0054
        SLL     R2,     2                       ; 520A   004E
        SWAP    R1,     2                       ; 520B   0045
        RLC     R2,     1                       ; 520C   0052
        NEGR    R0                              ; 520D   0020
        NEGR    R0                              ; 520E   0020
        NEGR    R0                              ; 520F   0020
        NEGR    R0                              ; 5210   0020
        DECLE   $0000                           ; 5211   0000

        PULR    R7                              ; 5212   02B7
L_5213:
        PSHR    R5                              ; 5213   0275

        JSR     R5,     L_5AAB                  ; 5214   0004 0158 02AB

        MVII    #$0000, R0                      ; 5217   02B8 0000
        MVII    #$0005, R1                      ; 5219   02B9 0005
        MVII    #$0028, R5                      ; 521B   02BD 0028
        MVO@    R0,     R5                      ; 521D   0268
        MVO@    R0,     R5                      ; 521E   0268
        MVO@    R0,     R5                      ; 521F   0268
        MVO@    R0,     R5                      ; 5220   0268
        MVO@    R0,     R5                      ; 5221   0268
        SDBD                                    ; 5222   0001
        MVII    #$3800, R4                      ; 5223   02BC 0000 0038
        SDBD                                    ; 5226   0001
        MVII    #$61FE, R2                      ; 5227   02BA 00FE 0061
        MVII    #$0140, R0                      ; 522A   02B8 0140

        JSR     R5,     L_517D                  ; 522C   0004 0150 017D

        MVO     R0,     .STIC.MODE              ; 522F   0240 0021
        MVO     R0,     .STIC.VIDEN             ; 5231   0240 0020
        MVII    #$0040, R0                      ; 5233   02B8 0040
        MVII    #$0319, R4                      ; 5235   02BC 0319

        JSR     R5,     X_FILL_ZERO             ; 5237   0004 0114 0338

        MVII    #$004C, R0                      ; 523A   02B8 004C
        MVII    #$0110, R4                      ; 523C   02BC 0110

        JSR     R5,     X_FILL_ZERO             ; 523E   0004 0114 0338
        JSR     R5,     L_5546                  ; 5241   0004 0154 0146

        SUBI    #$009E, R5                      ; 5244   033D 009E
        SLLC    R2,     2                       ; 5246   005E
        ADCR    R6                              ; 5247   002E
        SLLC    R3,     2                       ; 5248   005F
        SARC    R2,     2                       ; 5249   007E
        SLR     R0,     1                       ; 524A   0060
        DECLE   $0000,  $0000                   ; 524B   0000 0000

        JSR     R5,     L_5546                  ; 524D   0004 0154 0146

        CMP@    R1,     R1                      ; 5250   0349
        DECLE   $0000                           ; 5251   0000

        INCR    R0                              ; 5252   0008
        DECLE   $0000                           ; 5253   0000

        ADCR    R0                              ; 5254   0028
        DECLE   $0000                           ; 5255   0000

        ADCR    R2                              ; 5256   002A
        DECLE   $0000                           ; 5257   0000

        RSWD    R4                              ; 5258   003C
        DECLE   $0000,  $0000                   ; 5259   0000 0000

        JSR     R5,     L_554F                  ; 525B   0004 0154 014F

        SUBR    R0,     R4                      ; 525E   0104
        ADDR    R7,     R7                      ; 525F   00FF
        SUBR    R0,     R3                      ; 5260   0103
        EIS                                     ; 5261   0002
        SUBR    R4,     R0                      ; 5262   0120
        ADD@    R5,     R0                      ; 5263   02E8
        SUBR    R4,     R1                      ; 5264   0121
        RLC     R3,     1                       ; 5265   0053
        DECLE   $0000                           ; 5266   0000

        MVII    #$0002, R0                      ; 5267   02B8 0002
        MVO     R0,     G_013A                  ; 5269   0240 013A

        JSR     R5,     L_5B63                  ; 526B   0004 0158 0363

        MVII    #$0319, R4                      ; 526E   02BC 0319

        JSR     R5,     L_5093                  ; 5270   0004 0150 0093

        SLR     R0,     1                       ; 5273   0060
        EIS                                     ; 5274   0002
        ADDR    R3,     R0                      ; 5275   00D8
        DECLE   $0000                           ; 5276   0000

        EIS                                     ; 5277   0002
        COMR    R1                              ; 5278   0019

        JSR     R5,     L_5093                  ; 5279   0004 0150 0093

        SLR     R0,     1                       ; 527C   0060
        DIS                                     ; 527D   0003
        ADDR    R3,     R0                      ; 527E   00D8
        DECLE   $0000                           ; 527F   0000

        DECR    R3                              ; 5280   0013
        INCR    R1                              ; 5281   0009

        JSR     R5,     L_554F                  ; 5282   0004 0154 014F

        SUBR    R2,     R2                      ; 5285   0112
        SLR     R0,     1                       ; 5286   0060
        SUBR    R2,     R4                      ; 5287   0114
        SLLC    R0,     1                       ; 5288   0058
        DECLE   $0000                           ; 5289   0000

        PULR    R7                              ; 528A   02B7
L_528B:
        PSHR    R5                              ; 528B   0275
        MVI     G_0110, R1                      ; 528C   0281 0110
        ANDI    #$0020, R1                      ; 528E   03B9 0020
        BNEQ    L_52FB                          ; 5290   020C 0069

        MVI     G_0106, R1                      ; 5292   0281 0106
        MOVR    R1,     R0                      ; 5294   0088
        MVI     G_0119, R5                      ; 5295   0285 0119
        MVO     R0,     G_0119                  ; 5297   0240 0119
        MVI     G_012A, R2                      ; 5299   0282 012A
        MVI     G_0107, R3                      ; 529B   0283 0107
        TSTR    R2                              ; 529D   0092
        BNEQ    L_531D                          ; 529E   020C 007D

        TSTR    R3                              ; 52A0   009B
        BNEQ    L_52FC                          ; 52A1   020C 0059

        ANDI    #$0040, R0                      ; 52A3   03B8 0040
        BNEQ    L_52E2                          ; 52A5   020C 003B

        MOVR    R1,     R0                      ; 52A7   0088
        ANDI    #$0080, R0                      ; 52A8   03B8 0080
        BNEQ    L_52FC                          ; 52AA   020C 0050

        MVI     G_0118, R0                      ; 52AC   0280 0118
        TSTR    R0                              ; 52AE   0080
        BNEQ    L_5383                          ; 52AF   020C 00D2

        MVII    #$0111, R4                      ; 52B1   02BC 0111
        MVII    #$0008, R0                      ; 52B3   02B8 0008
        MVI     G_0110, R5                      ; 52B5   0285 0110
        CMPI    #$0001, R5                      ; 52B7   037D 0001
        BNEQ    L_52BD                          ; 52B9   020C 0002

        MVII    #$0004, R0                      ; 52BB   02B8 0004

L_52BD:
        JSR     R5,     L_50A3                  ; 52BD   0004 0150 00A3
        JSR     R5,     L_54A2                  ; 52C0   0004 0154 00A2

        CLRR    R5                              ; 52C3   01ED
        TSTR    R0                              ; 52C4   0080
        BPL     L_52C9                          ; 52C5   0203 0002

        XORI    #$0004, R5                      ; 52C7   03FD 0004
L_52C9:
        MVO     R5,     G_010F                  ; 52C9   0245 010F
        MVI     G_0115, R5                      ; 52CB   0285 0115
        ANDI    #$0001, R5                      ; 52CD   03BD 0001
        BNEQ    L_52FB                          ; 52CF   020C 002A

        MVI     G_0110, R5                      ; 52D1   0285 0110
        CMPI    #$0001, R5                      ; 52D3   037D 0001
        BEQ     L_52EE                          ; 52D5   0204 0017

        JSR     R5,     L_5074                  ; 52D7   0004 0150 0074

        SUBI    #$0060, R5                      ; 52DA   033D 0060
        MOVR    R3,     R6                      ; 52DC   009E
        SLLC    R2,     2                       ; 52DD   005E
L_52DE:
        MVII    #$0090, R2                      ; 52DE   02BA 0090
        B       L_52F5                          ; 52E0   0200 0013

L_52E2:
        MVI     G_0110, R5                      ; 52E2   0285 0110
        CMPI    #$0001, R5                      ; 52E4   037D 0001
        BEQ     L_52FB                          ; 52E6   0204 0013

        SDBD                                    ; 52E8   0001
        MVII    #$5EEE, R0                      ; 52E9   02B8 00EE 005E
        B       L_52DE                          ; 52EC   0220 000F

L_52EE:
        JSR     R5,     L_5074                  ; 52EE   0004 0150 0074

        SUBI    #$0060, R5                      ; 52F1   033D 0060
        MOVR    R7,     R6                      ; 52F3   00BE
        SLLC    R3,     2                       ; 52F4   005F
L_52F5:
        MOVR    R0,     R1                      ; 52F5   0081
        ADDR    R2,     R1                      ; 52F6   00D1
        MVO     R0,     G_033D                  ; 52F7   0240 033D
        MVO     R1,     G_033E                  ; 52F9   0241 033E
L_52FB:
        PULR    R7                              ; 52FB   02B7
L_52FC:
        MVI     G_0110, R5                      ; 52FC   0285 0110
        CMPI    #$0001, R5                      ; 52FE   037D 0001
        BEQ     L_52FB                          ; 5300   0224 0006

        SDBD                                    ; 5302   0001
        MVII    #$5EEE, R0                      ; 5303   02B8 00EE 005E
        MOVR    R0,     R1                      ; 5306   0081
        ADDI    #$0090, R1                      ; 5307   02F9 0090
        MVO     R0,     G_033D                  ; 5309   0240 033D
        MVO     R1,     G_033E                  ; 530B   0241 033E
        MVII    #$0001, R0                      ; 530D   02B8 0001
        MVI     G_0321, R1                      ; 530F   0281 0321
        SDBD                                    ; 5311   0001
        ANDI    #$0400, R1                      ; 5312   03B9 0000 0004
        BEQ     L_5318                          ; 5315   0204 0001

        NEGR    R0                              ; 5317   0020
L_5318:
        MVO     R0,     G_012B                  ; 5318   0240 012B
        CLRR    R0                              ; 531A   01C0
        MVO     R0,     G_012C                  ; 531B   0240 012C
L_531D:
        MVI     G_012B, R0                      ; 531D   0280 012B
        SWAP    R0,     1                       ; 531F   0040
        INCR    R2                              ; 5320   000A
        CMPI    #$0012, R2                      ; 5321   037A 0012
        BLE     L_532A                          ; 5323   0206 0005

        CLRR    R0                              ; 5325   01C0
        TSTR    R3                              ; 5326   009B
        BNEQ    L_52FB                          ; 5327   022C 002D

        CLRR    R2                              ; 5329   01D2
L_532A:
        MVO     R2,     G_012A                  ; 532A   0242 012A
        PSHR    R2                              ; 532C   0272
        MVI     G_012C, R1                      ; 532D   0281 012C
        MVII    #$0080, R5                      ; 532F   02BD 0080
        CMPI    #$0009, R2                      ; 5331   037A 0009
        BLT     L_5345                          ; 5333   0205 0010

        CMPR    R5,     R1                      ; 5335   0169
        BGE     L_533A                          ; 5336   020D 0002

        MOVR    R2,     R1                      ; 5338   0091
        XORR    R5,     R1                      ; 5339   01E9
L_533A:
        NEGR    R0                              ; 533A   0020
        DECR    R1                              ; 533B   0011
        CMPR    R5,     R1                      ; 533C   0169
        BGT     L_5341                          ; 533D   020E 0002

        MOVR    R5,     R1                      ; 533F   00A9
        CLRR    R0                              ; 5340   01C0
L_5341:
        MVO     R1,     G_012C                  ; 5341   0241 012C
        B       L_5349                          ; 5343   0200 0004

L_5345:
        CMPR    R5,     R1                      ; 5345   0169
        BLT     L_5349                          ; 5346   0205 0001

        CLRR    R0                              ; 5348   01C0
L_5349:
        MVII    #$0111, R4                      ; 5349   02BC 0111
        CLRR    R3                              ; 534B   01DB

        JSR     R5,     L_54A2                  ; 534C   0004 0154 00A2

        MVI     G_0112, R1                      ; 534F   0281 0112
        SDBD                                    ; 5351   0001
        XORI    #$4300, R1                      ; 5352   03F9 0000 0043
        MVO     R1,     G_0319                  ; 5355   0241 0319
        MVO     R1,     G_031A                  ; 5357   0241 031A
        PULR    R2                              ; 5359   02B2
        MVI     G_011B, R5                      ; 535A   0285 011B
        CMPI    #$0001, R5                      ; 535C   037D 0001
        BLT     L_536B                          ; 535E   0205 000B

        MVII    #$0080, R5                      ; 5360   02BD 0080
        MVI     G_012C, R1                      ; 5362   0281 012C
        CMPR    R5,     R1                      ; 5364   0169
        BGE     L_536B                          ; 5365   020D 0004

        MOVR    R2,     R1                      ; 5367   0091
        XORR    R5,     R1                      ; 5368   01E9
        MVO     R1,     G_012C                  ; 5369   0241 012C

L_536B:
        JSR     R5,     L_5373                  ; 536B   0004 0150 0373

        DIS                                     ; 536E   0003
        DECLE   $0005                           ; 536F   0005

        INCR    R6                              ; 5370   000E
        DECR    R0                              ; 5371   0010
        DECLE   $0000                           ; 5372   0000
L_5373:
        MVI@    R5,     R0                      ; 5373   02A8
        TSTR    R0                              ; 5374   0080
        BEQ     L_52FB                          ; 5375   0224 007B

        CMPR    R2,     R0                      ; 5377   0150
        BNEQ    L_5373                          ; 5378   022C 0006

        JSR     R5,     L_5074                  ; 537A   0004 0150 0074

        SUBI    #$0040, R5                      ; 537D   033D 0040
        ADDR    R5,     R6                      ; 537F   00EE
        SLLC    R2,     2                       ; 5380   005E
        B       L_52DE                          ; 5381   0220 00A4

L_5383:
        CLRR    R1                              ; 5383   01C9
        MVO     R1,     G_0118                  ; 5384   0241 0118
        MVII    #$031B, R4                      ; 5386   02BC 031B
L_5388:
        MVO@    R1,     R4                      ; 5388   0261
        CMPI    #$0320, R4                      ; 5389   037C 0320
        BLE     L_5388                          ; 538B   0226 0004

        CMPI    #$0004, R0                      ; 538D   0378 0004
        BEQ     L_5398                          ; 538F   0204 0007

        NEGR    R0                              ; 5391   0020
        MVO     R0,     G_0138                  ; 5392   0240 0138

        JSR     R5,     L_5B60                  ; 5394   0004 0158 0360

        PULR    R7                              ; 5397   02B7
L_5398:
        SLR     R0,     1                       ; 5398   0060
        NEGR    R0                              ; 5399   0020
        MVO     R0,     G_013A                  ; 539A   0240 013A

        JSR     R5,     L_5B60                  ; 539C   0004 0158 0360

        PULR    R7                              ; 539F   02B7
L_53A0:
        PSHR    R5                              ; 53A0   0275
        MVII    #$0331, R4                      ; 53A1   02BC 0331
L_53A3:
        MVI@    R4,     R0                      ; 53A3   02A0
        CMPI    #$0337, R4                      ; 53A4   037C 0337
        BGT     L_52FB                          ; 53A6   022E 00AC

        ANDI    #$0003, R0                      ; 53A8   03B8 0003
        BEQ     L_53A3                          ; 53AA   0224 0008

        MOVR    R4,     R1                      ; 53AC   00A1
        SUBI    #$0332, R1                      ; 53AD   0339 0332
        SLL     R1,     2                       ; 53AF   004D
        SLL     R1,     1                       ; 53B0   0049
        ADDI    #$016A, R1                      ; 53B1   02F9 016A
        MVI@    R1,     R0                      ; 53B3   0288
        SUB     G_0114, R0                      ; 53B4   0300 0114
        BPL     L_53B9                          ; 53B6   0203 0001

        NEGR    R0                              ; 53B8   0020
L_53B9:
        CMPI    #$0005, R0                      ; 53B9   0378 0005
        BGE     L_53A3                          ; 53BB   022D 0019

        MVI     G_012A, R0                      ; 53BD   0280 012A
        TSTR    R0                              ; 53BF   0080
        BEQ     L_53A3                          ; 53C0   0224 001E

        MVII    #$0080, R3                      ; 53C2   02BB 0080
        MOVR    R1,     R2                      ; 53C4   008A
        SUBI    #$0002, R2                      ; 53C5   033A 0002
        MVI     G_0112, R0                      ; 53C7   0280 0112
        MVI     G_012B, R5                      ; 53C9   0285 012B
        CMPR    R3,     R5                      ; 53CB   015D
        BLT     L_53D3                          ; 53CC   0205 0005

        SUB@    R2,     R0                      ; 53CE   0310
        BPL     L_53D6                          ; 53CF   0203 0005
        B       L_53A3                          ; 53D1   0220 002F

L_53D3:
        SUB@    R2,     R0                      ; 53D3   0310
        BPL     L_53A3                          ; 53D4   0223 0032

L_53D6:
        MVI     G_012C, R0                      ; 53D6   0280 012C
        CMPR    R3,     R0                      ; 53D8   0158
        BGE     L_53E0                          ; 53D9   020D 0005

        MVI     G_012A, R0                      ; 53DB   0280 012A
        XORR    R3,     R0                      ; 53DD   01D8
        MVO     R0,     G_012C                  ; 53DE   0240 012C
L_53E0:
        INCR    R1                              ; 53E0   0009
        MVI@    R1,     R0                      ; 53E1   0288
        CMPR    R3,     R0                      ; 53E2   0158
        BGE     L_53A3                          ; 53E3   022D 0041

        MVO@    R3,     R1                      ; 53E5   024B
        B       L_53A3                          ; 53E6   0220 0044

        DECLE   $0000,  $0000                   ; 53E8   0000 0000
L_53EA:
        PSHR    R5                              ; 53EA   0275
        PSHR    R3                              ; 53EB   0273
        DECR    R4                              ; 53EC   0014
        MVI@    R4,     R5                      ; 53ED   02A5
        PSHR    R5                              ; 53EE   0275
        CLRR    R5                              ; 53EF   01ED
        MVO     R5,     G_011D                  ; 53F0   0245 011D
        DECR    R4                              ; 53F2   0014
        MVO@    R5,     R4                      ; 53F3   0265
        PSHR    R1                              ; 53F4   0271
        PSHR    R2                              ; 53F5   0272

        JSR     R5,     L_5554                  ; 53F6   0004 0154 0154

        TSTR    R1                              ; 53F9   0089
        BEQ     L_543F                          ; 53FA   0204 0043

        CMPI    #$0068, R1                      ; 53FC   0379 0068
        BLT     L_540D                          ; 53FE   0205 000D
        BNEQ    L_5407                          ; 5400   020C 0005

        DECR    R4                              ; 5402   0014
        MVI@    R4,     R5                      ; 5403   02A5
        INCR    R5                              ; 5404   000D
        DECR    R4                              ; 5405   0014
        MVO@    R5,     R4                      ; 5406   0265
L_5407:
        CMPI    #$00C0, R1                      ; 5407   0379 00C0
        BGE     L_545E                          ; 5409   020D 0053

        ADDI    #$0058, R1                      ; 540B   02F9 0058
L_540D:
        SDBD                                    ; 540D   0001
        ADDI    #$61FE, R1                      ; 540E   02F9 00FE 0061
L_5411:
        MOVR    R1,     R5                      ; 5411   008D
        PULR    R2                              ; 5412   02B2
        PULR    R1                              ; 5413   02B1
        PSHR    R1                              ; 5414   0271
        PSHR    R2                              ; 5415   0272
        INCR    R1                              ; 5416   0009
        ADDI    #$0002, R1                      ; 5417   02F9 0002
        DECR    R2                              ; 5419   0012
        ANDI    #$0007, R2                      ; 541A   03BA 0007
        ANDI    #$0007, R1                      ; 541C   03B9 0007
        ADDR    R5,     R2                      ; 541E   00EA

        JSR     R5,     L_542B                  ; 541F   0004 0154 002B

        TSTR    R0                              ; 5422   0080
        ADDR    R0,     R0                      ; 5423   00C0
        SLR     R0,     1                       ; 5424   0060
        GSWD    R0                              ; 5425   0030
        COMR    R0                              ; 5426   0018
        INCR    R4                              ; 5427   000C
        CLRC                                    ; 5428   0006
        DIS                                     ; 5429   0003
        DECLE   $0001                           ; 542A   0001
L_542B:
        ADDR    R5,     R1                      ; 542B   00E9
        INCR    R1                              ; 542C   0009
        MVI@    R2,     R5                      ; 542D   0295
        AND@    R1,     R5                      ; 542E   038D
        CMP@    R1,     R5                      ; 542F   034D
        BNEQ    L_543F                          ; 5430   020C 000D

        PULR    R2                              ; 5432   02B2
        PULR    R1                              ; 5433   02B1
        MVI     G_011D, R3                      ; 5434   0283 011D
        CMPI    #$0008, R3                      ; 5436   037B 0008
        BNEQ    L_543C                          ; 5438   020C 0002

        DECR    R4                              ; 543A   0014
        MVO@    R3,     R4                      ; 543B   0263
L_543C:
        PULR    R3                              ; 543C   02B3
        PULR    R3                              ; 543D   02B3
        PULR    R7                              ; 543E   02B7
L_543F:
        MVI     G_011D, R5                      ; 543F   0285 011D
        MOVR    R5,     R3                      ; 5441   00AB
        ANDI    #$0004, R5                      ; 5442   03BD 0004
        BEQ     L_5456                          ; 5444   0204 0010

        MVI     G_0345, R1                      ; 5446   0281 0345
        SDBD                                    ; 5448   0001
        MVII    #$6396, R2                      ; 5449   02BA 0096 0063
        CMPR    R1,     R2                      ; 544C   014A
        BNEQ    L_5456                          ; 544D   020C 0007

        DECR    R4                              ; 544F   0014
        MVO@    R3,     R4                      ; 5450   0263
        PULR    R2                              ; 5451   02B2
        PULR    R1                              ; 5452   02B1
        PULR    R3                              ; 5453   02B3
        PULR    R3                              ; 5454   02B3
        PULR    R7                              ; 5455   02B7
L_5456:
        CLRR    R5                              ; 5456   01ED
        PULR    R2                              ; 5457   02B2
        PULR    R1                              ; 5458   02B1
        DECR    R4                              ; 5459   0014
        PULR    R3                              ; 545A   02B3
        MVO@    R3,     R4                      ; 545B   0263
        PULR    R3                              ; 545C   02B3
        PULR    R7                              ; 545D   02B7
L_545E:
        SUBI    #$00C0, R1                      ; 545E   0339 00C0
        SAR     R1,     2                       ; 5460   006D
        SAR     R1,     1                       ; 5461   0069
        MOVR    R1,     R2                      ; 5462   008A
        SAR     R1,     1                       ; 5463   0069
        ADDI    #$0339, R1                      ; 5464   02F9 0339
        MVI@    R1,     R1                      ; 5466   0289
        MVI     G_011F, R5                      ; 5467   0285 011F
        CMPI    #$0000, R5                      ; 5469   037D 0000
        BEQ     L_5475                          ; 546B   0204 0008

        ANDI    #$0001, R2                      ; 546D   03BA 0001
        BEQ     L_5411                          ; 546F   0224 005F

        ADDI    #$0008, R1                      ; 5471   02F9 0008
        B       L_5411                          ; 5473   0220 0063

L_5475:
        MOVR    R2,     R5                      ; 5475   0095
        ANDI    #$0002, R2                      ; 5476   03BA 0002
        BEQ     L_548D                          ; 5478   0204 0013

        SDBD                                    ; 547A   0001
        MVII    #$63A6, R2                      ; 547B   02BA 00A6 0063
        CMPR    R1,     R2                      ; 547E   014A
        SDBD                                    ; 547F   0001
        MVII    #$61FE, R2                      ; 5480   02BA 00FE 0061
        BNEQ    L_549F                          ; 5483   020C 001A

        MVII    #$0008, R2                      ; 5485   02BA 0008
        MVO     R2,     G_011D                  ; 5487   0242 011D
        ADDI    #$0090, R1                      ; 5489   02F9 0090
        B       L_5411                          ; 548B   0220 007B

L_548D:
        MVO     R1,     G_0345                  ; 548D   0241 0345
        ANDI    #$0001, R5                      ; 548F   03BD 0001
        SDBD                                    ; 5491   0001
        MVII    #$6316, R2                      ; 5492   02BA 0016 0063
        BEQ     L_549B                          ; 5495   0204 0004

        ADDI    #$0008, R2                      ; 5497   02FA 0008
        MVII    #$0040, R5                      ; 5499   02BD 0040
L_549B:
        XORI    #$0004, R5                      ; 549B   03FD 0004
        MVO     R5,     G_011D                  ; 549D   0245 011D
L_549F:
        MOVR    R2,     R1                      ; 549F   0091
        B       L_5411                          ; 54A0   0220 0090

L_54A2:
        PSHR    R5                              ; 54A2   0275
        CLRR    R1                              ; 54A3   01C9
        MVO     R1,     G_011B                  ; 54A4   0241 011B
        MVO     R1,     G_011C                  ; 54A6   0241 011C
        SDBD                                    ; 54A8   0001
        MVI@    R4,     R1                      ; 54A9   02A1
        TSTR    R0                              ; 54AA   0080
        BEQ     L_54EB                          ; 54AB   0204 003E

        ADDR    R0,     R1                      ; 54AD   00C1
        SUBI    #$0002, R4                      ; 54AE   033C 0002
        MVO@    R1,     R4                      ; 54B0   0261
        SWAP    R1,     1                       ; 54B1   0041
        ANDI    #$00FF, R1                      ; 54B2   03B9 00FF
        CMPI    #$0008, R1                      ; 54B4   0379 0008
        BLE     L_54DB                          ; 54B6   0206 0023

        CMPI    #$00A0, R1                      ; 54B8   0379 00A0
        BLE     L_54CF                          ; 54BA   0206 0013

        CMPI    #$0115, R4                      ; 54BC   037C 0115
        BGT     L_54DB                          ; 54BE   020E 001B

        MVI     G_011F, R2                      ; 54C0   0282 011F
        TSTR    R2                              ; 54C2   0092
        BEQ     L_54DB                          ; 54C3   0204 0016

        CMPI    #$0004, R2                      ; 54C5   037A 0004
        BEQ     L_54DB                          ; 54C7   0204 0012

        MVII    #$0002, R2                      ; 54C9   02BA 0002
        MVO     R2,     G_0118                  ; 54CB   0242 0118
        B       L_54DB                          ; 54CD   0200 000C

L_54CF:
        ADDI    #$0002, R4                      ; 54CF   02FC 0002
        MVI@    R4,     R2                      ; 54D1   02A2
        SUBI    #$0004, R4                      ; 54D2   033C 0004

        JSR     R5,     L_53EA                  ; 54D4   0004 0150 03EA

        INCR    R4                              ; 54D7   000C
        TSTR    R5                              ; 54D8   00AD
        BNEQ    L_54E2                          ; 54D9   020C 0007

L_54DB:
        MVII    #$0001, R5                      ; 54DB   02BD 0001
        MVO     R5,     G_011B                  ; 54DD   0245 011B
        INCR    R4                              ; 54DF   000C
        B       L_54EB                          ; 54E0   0200 0009

L_54E2:
        CMP@    R4,     R1                      ; 54E2   0361
        BNEQ    L_54E9                          ; 54E3   020C 0004

        MVII    #$0001, R2                      ; 54E5   02BA 0001
        MVO     R2,     G_011C                  ; 54E7   0242 011C
L_54E9:
        DECR    R4                              ; 54E9   0014
        MVO@    R1,     R4                      ; 54EA   0261
L_54EB:
        TSTR    R3                              ; 54EB   009B
        BEQ     L_52FB                          ; 54EC   0224 01F2

        SDBD                                    ; 54EE   0001
        MVI@    R4,     R2                      ; 54EF   02A2
        ADDR    R3,     R2                      ; 54F0   00DA
        SUBI    #$0002, R4                      ; 54F1   033C 0002
        MVO@    R2,     R4                      ; 54F3   0262
        SWAP    R2,     1                       ; 54F4   0042
        ANDI    #$007F, R2                      ; 54F5   03BA 007F
        CMPI    #$0008, R2                      ; 54F7   037A 0008
        BLE     L_551E                          ; 54F9   0206 0023

        CMPI    #$0060, R2                      ; 54FB   037A 0060
        BLE     L_5511                          ; 54FD   0206 0012

        CMPI    #$0115, R4                      ; 54FF   037C 0115
        BGT     L_551E                          ; 5501   020E 001B

        MVI     G_011F, R5                      ; 5503   0285 011F
        CMPI    #$0004, R5                      ; 5505   037D 0004
        BEQ     L_550C                          ; 5507   0204 0003

        TSTR    R5                              ; 5509   00AD
        BNEQ    L_551E                          ; 550A   020C 0012

L_550C:
        MVII    #$0004, R5                      ; 550C   02BD 0004
        MVO     R5,     G_0118                  ; 550E   0245 0118
        PULR    R7                              ; 5510   02B7
L_5511:
        SUBI    #$0002, R4                      ; 5511   033C 0002
        MVI@    R4,     R1                      ; 5513   02A1
        SUBI    #$0002, R4                      ; 5514   033C 0002

        JSR     R5,     L_53EA                  ; 5516   0004 0150 03EA

        ADDI    #$0003, R4                      ; 5519   02FC 0003
        TSTR    R5                              ; 551B   00AD
        BNEQ    L_5524                          ; 551C   020C 0006

L_551E:
        MVI     G_011B, R5                      ; 551E   0285 011B
        INCR    R5                              ; 5520   000D
        MVO     R5,     G_011B                  ; 5521   0245 011B
        PULR    R7                              ; 5523   02B7
L_5524:
        CMP@    R4,     R2                      ; 5524   0362
        BNEQ    L_552E                          ; 5525   020C 0007

        MVII    #$0002, R5                      ; 5527   02BD 0002
        XOR     G_011C, R5                      ; 5529   03C5 011C
        MVO     R5,     G_011C                  ; 552B   0245 011C
        PULR    R7                              ; 552D   02B7
L_552E:
        DECR    R4                              ; 552E   0014
        MVO@    R2,     R4                      ; 552F   0262
        PULR    R7                              ; 5530   02B7
L_5531:
        SDBD                                    ; 5531   0001
        MVI@    R4,     R1                      ; 5532   02A1
        SUBI    #$0002, R4                      ; 5533   033C 0002
        ADDR    R0,     R1                      ; 5535   00C1
        MVO@    R1,     R4                      ; 5536   0261
        SWAP    R1,     1                       ; 5537   0041
        NOP                                     ; 5538   0034
        MVO@    R1,     R4                      ; 5539   0261
        SDBD                                    ; 553A   0001
        MVI@    R4,     R1                      ; 553B   02A1
        SUBI    #$0002, R4                      ; 553C   033C 0002
        ADDR    R3,     R1                      ; 553E   00D9
        MVO@    R1,     R4                      ; 553F   0261
        NOP                                     ; 5540   0034
        SWAP    R1,     1                       ; 5541   0041
        MVO@    R1,     R4                      ; 5542   0261
        MOVR    R5,     R7                      ; 5543   00AF
L_5544:
        MVO@    R0,     R4                      ; 5544   0260
        INCR    R7                              ; 5545   000F
L_5546:
        MVI@    R5,     R4                      ; 5546   02AC
        SDBD                                    ; 5547   0001
        MVI@    R5,     R0                      ; 5548   02A8
        TSTR    R0                              ; 5549   0080
        BNEQ    L_5544                          ; 554A   022C 0007

        MOVR    R5,     R7                      ; 554C   00AF
L_554D:
        MVI@    R5,     R0                      ; 554D   02A8
        MVO@    R0,     R4                      ; 554E   0260
L_554F:
        MVI@    R5,     R4                      ; 554F   02AC
        TSTR    R4                              ; 5550   00A4
        BNEQ    L_554D                          ; 5551   022C 0005

        MOVR    R5,     R7                      ; 5553   00AF
L_5554:
        PSHR    R5                              ; 5554   0275
        DECR    R2                              ; 5555   0012
        SLR     R2,     2                       ; 5556   0066
        SLR     R2,     1                       ; 5557   0062
        ADDI    #$0003, R1                      ; 5558   02F9 0003
        CMPI    #$00A7, R1                      ; 555A   0379 00A7
        BGE     L_5588                          ; 555C   020D 002A

        SLR     R1,     2                       ; 555E   0065
        SLR     R1,     1                       ; 555F   0061
        DECR    R1                              ; 5560   0011
        CMPI    #$000C, R2                      ; 5561   037A 000C
        BGE     L_5588                          ; 5563   020D 0023

        JSR     R5,     L_5574                  ; 5565   0004 0154 0174
        DECLE   $0000                           ; 5568   0000

        DECR    R4                              ; 5569   0014
        ADCR    R0                              ; 556A   0028
        RSWD    R4                              ; 556B   003C
        RLC     R0,     1                       ; 556C   0050
        SLR     R0,     2                       ; 556D   0064
        SARC    R0,     1                       ; 556E   0078
        MOVR    R1,     R4                      ; 556F   008C
        MOVR    R4,     R0                      ; 5570   00A0
        MOVR    R6,     R4                      ; 5571   00B4
        ADDR    R1,     R0                      ; 5572   00C8
        ADDR    R3,     R4                      ; 5573   00DC
L_5574:
        ADDR    R2,     R5                      ; 5574   00D5
        ADD@    R5,     R1                      ; 5575   02E9
        MOVR    R1,     R2                      ; 5576   008A
        ADDI    #$0200, R1                      ; 5577   02F9 0200
        MVI@    R1,     R1                      ; 5579   0289
        MOVR    R1,     R5                      ; 557A   008D
        ANDI    #$0007, R5                      ; 557B   03BD 0007
        CMPI    #$0004, R5                      ; 557D   037D 0004
        BNEQ    L_5588                          ; 557F   020C 0007

        ANDI    #$01F8, R1                      ; 5581   03B9 01F8
        CMPI    #$0040, R1                      ; 5583   0379 0040
        BEQ     L_5588                          ; 5585   0204 0001

        PULR    R7                              ; 5587   02B7
L_5588:
        CLRR    R1                              ; 5588   01C9
        PULR    R7                              ; 5589   02B7
        MOVR    R1,     R0                      ; 558A   0088
        MOVR    R1,     R0                      ; 558B   0088
        MOVR    R1,     R0                      ; 558C   0088
        ADDR    R0,     R3                      ; 558D   00C3
        ADDR    R0,     R3                      ; 558E   00C3
        SAR     R1,     1                       ; 558F   0069
        SAR     R1,     1                       ; 5590   0069
        RRC     R3,     2                       ; 5591   0077
        MOVR    R1,     R0                      ; 5592   0088
        ADDR    R7,     R7                      ; 5593   00FF
        ADDR    R6,     R7                      ; 5594   00F7
        SARC    R3,     2                       ; 5595   007F
        ADDR    R6,     R7                      ; 5596   00F7
        MOVR    R5,     R2                      ; 5597   00AA
        SARC    R3,     2                       ; 5598   007F
        ADDR    R7,     R5                      ; 5599   00FD
        ADDR    R0,     R3                      ; 559A   00C3
        ADDR    R0,     R3                      ; 559B   00C3
        ADDR    R0,     R3                      ; 559C   00C3
        SAR     R1,     1                       ; 559D   0069
        SAR     R1,     1                       ; 559E   0069
        SAR     R1,     1                       ; 559F   0069
        ADDR    R3,     R7                      ; 55A0   00DF
        SARC    R3,     2                       ; 55A1   007F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55A2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55A6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55AA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55AE   0000 0000 0000 0000
L_55B2:
        PSHR    R5                              ; 55B2   0275
        MVI     G_0115, R0                      ; 55B3   0280 0115
        ANDI    #$00FF, R0                      ; 55B5   03B8 00FF
        BNEQ    L_55C3                          ; 55B7   020C 000A

        MVI     G_012F, R0                      ; 55B9   0280 012F
        INCR    R0                              ; 55BB   0008
        CMPI    #$0008, R0                      ; 55BC   0378 0008
        BLE     L_55C1                          ; 55BE   0206 0001

        CLRR    R0                              ; 55C0   01C0
L_55C1:
        MVO     R0,     G_012F                  ; 55C1   0240 012F
L_55C3:
        MVI     G_0115, R2                      ; 55C3   0282 0115
        ANDI    #$0001, R2                      ; 55C5   03BA 0001
        BEQ     L_55CB                          ; 55C7   0204 0002

        MVII    #$0003, R2                      ; 55C9   02BA 0003
L_55CB:
        MVO     R2,     G_012E                  ; 55CB   0242 012E
        MVII    #$015D, R4                      ; 55CD   02BC 015D
        SLL     R2,     2                       ; 55CF   004E
        SLL     R2,     2                       ; 55D0   004E
        ADDI    #$016D, R2                      ; 55D1   02FA 016D
        MVII    #$0010, R0                      ; 55D3   02B8 0010
        PSHR    R2                              ; 55D5   0272

        JSR     R5,     L_517D                  ; 55D6   0004 0150 017D

        MVI     G_012E, R0                      ; 55D9   0280 012E
        ADD     G_012F, R0                      ; 55DB   02C0 012F
        SLL     R0,     1                       ; 55DD   0048
        CMPI    #$0010, R0                      ; 55DE   0378 0010
        BLE     L_55E3                          ; 55E0   0206 0001

        CLRR    R0                              ; 55E2   01C0
L_55E3:
        MOVR    R7,     R5                      ; 55E3   00BD
        SDBD                                    ; 55E4   0001
        ADDI    #$FFBE, R5                      ; 55E5   02FD 00BE 00FF
        ADDR    R0,     R5                      ; 55E8   00C5
        MVI@    R5,     R0                      ; 55E9   02A8
        RSWD    R0                              ; 55EA   0038
        BPL     L_55F0                          ; 55EB   0203 0003

        XORI    #$0080, R0                      ; 55ED   03F8 0080
        NEGR    R0                              ; 55EF   0020
L_55F0:
        MVI     G_0112, R2                      ; 55F0   0282 0112
        ADDR    R2,     R0                      ; 55F2   00D0
        BMI     L_55F9                          ; 55F3   020B 0004

        CMPI    #$00A0, R0                      ; 55F5   0378 00A0
        BLT     L_55FA                          ; 55F7   0205 0001

L_55F9:
        MOVR    R2,     R0                      ; 55F9   0090
L_55FA:
        MVO     R0,     G_0130                  ; 55FA   0240 0130
        MVI@    R5,     R0                      ; 55FC   02A8
        RSWD    R0                              ; 55FD   0038
        BPL     L_5603                          ; 55FE   0203 0003

        XORI    #$0080, R0                      ; 5600   03F8 0080
        NEGR    R0                              ; 5602   0020
L_5603:
        MVI     G_0114, R2                      ; 5603   0282 0114
        ADDR    R2,     R0                      ; 5605   00D0
        BMI     L_560C                          ; 5606   020B 0004

        CMPI    #$0060, R0                      ; 5608   0378 0060
        BLT     L_560D                          ; 560A   0205 0001

L_560C:
        MOVR    R2,     R0                      ; 560C   0090
L_560D:
        MVO     R0,     G_0131                  ; 560D   0240 0131

        JSR     R5,     L_5627                  ; 560F   0004 0154 0227

        MVII    #$015D, R2                      ; 5612   02BA 015D
        PULR    R4                              ; 5614   02B4
        MVII    #$0010, R0                      ; 5615   02B8 0010

        JSR     R5,     L_517D                  ; 5617   0004 0150 017D

        MVI     G_012E, R2                      ; 561A   0282 012E
        INCR    R2                              ; 561C   000A
        MOVR    R2,     R1                      ; 561D   0091
        CMPI    #$0003, R1                      ; 561E   0379 0003
        BEQ     L_5818                          ; 5620   0204 01F6

        CMPI    #$0006, R1                      ; 5622   0379 0006
        BLT     L_55CB                          ; 5624   0225 005A

        PULR    R7                              ; 5626   02B7
L_5627:
        PSHR    R5                              ; 5627   0275
        MVII    #$0163, R3                      ; 5628   02BB 0163
        MVI     G_0115, R0                      ; 562A   0280 0115
        MOVR    R0,     R1                      ; 562C   0081
        ANDI    #$0002, R0                      ; 562D   03B8 0002
        MVO     R0,     G_011B                  ; 562F   0240 011B
        MVI     G_011F, R5                      ; 5631   0285 011F
        CMPI    #$0003, R5                      ; 5633   037D 0003
        BEQ     L_585A                          ; 5635   0204 0223

        MVI@    R3,     R2                      ; 5637   029A
        CMPI    #$0080, R2                      ; 5638   037A 0080
        BGE     L_5834                          ; 563A   020D 01F8

        MVI     G_0165, R5                      ; 563C   0285 0165
        TSTR    R5                              ; 563E   00AD
        BEQ     L_564A                          ; 563F   0204 0009

        ANDI    #$000E, R1                      ; 5641   03B9 000E
        BNEQ    L_5785                          ; 5643   020C 0140

        CMPI    #$0030, R2                      ; 5645   037A 0030
        BGE     L_564A                          ; 5647   020D 0001

        MVO@    R0,     R3                      ; 5649   0258
L_564A:
        MVI     G_0160, R1                      ; 564A   0281 0160
        MVI     G_0162, R2                      ; 564C   0282 0162

        JSR     R5,     L_5554                  ; 564E   0004 0154 0154

        SLR     R1,     2                       ; 5651   0065
        SLR     R1,     1                       ; 5652   0061
        MOVR    R7,     R4                      ; 5653   00BC
        SDBD                                    ; 5654   0001
        ADDI    #$FF36, R4                      ; 5655   02FC 0036 00FF
        ADDR    R1,     R4                      ; 5658   00CC
        MOVR    R1,     R0                      ; 5659   0088

        JSR     R5,     L_5716                  ; 565A   0004 0154 0316

        MVI@    R3,     R0                      ; 565D   0298
        CMPI    #$0030, R0                      ; 565E   0378 0030
        BLT     L_567F                          ; 5660   0205 001D

        CMPI    #$0040, R0                      ; 5662   0378 0040
        BGE     L_567F                          ; 5664   020D 0019

        ADDI    #$0201, R2                      ; 5666   02FA 0201
        MVI     G_0164, R5                      ; 5668   0285 0164
        ANDI    #$0084, R5                      ; 566A   03BD 0084
        BEQ     L_5674                          ; 566C   0204 0006

        CMPI    #$0084, R5                      ; 566E   037D 0084
        BEQ     L_5674                          ; 5670   0204 0002

        SUBI    #$0002, R2                      ; 5672   033A 0002
L_5674:
        MVI@    R2,     R0                      ; 5674   0290
        ANDI    #$01F8, R0                      ; 5675   03B8 01F8
        SAR     R0,     2                       ; 5677   006C
        SAR     R0,     1                       ; 5678   0068

        JSR     R5,     L_5722                  ; 5679   0004 0154 0322

        MVI@    R3,     R0                      ; 567C   0298
        B       L_56A1                          ; 567D   0200 0022

L_567F:
        CMPI    #$0010, R1                      ; 567F   0379 0010
        BEQ     L_5687                          ; 5681   0204 0004

        CMPI    #$0017, R1                      ; 5683   0379 0017
        BNEQ    L_56A1                          ; 5685   020C 001A

L_5687:
        MVI@    R3,     R0                      ; 5687   0298
        MOVR    R0,     R5                      ; 5688   0085
        ANDI    #$0005, R5                      ; 5689   03BD 0005
        BEQ     L_56A1                          ; 568B   0204 0014

        ANDI    #$000A, R0                      ; 568D   03B8 000A
        MVO@    R0,     R3                      ; 568F   0258
        MVI     G_0162, R2                      ; 5690   0282 0162
        MVII    #$0002, R1                      ; 5692   02B9 0002
        MOVR    R2,     R5                      ; 5694   0095
        ANDI    #$0007, R5                      ; 5695   03BD 0007
        BEQ     L_569D                          ; 5697   0204 0004

        CMPI    #$0004, R5                      ; 5699   037D 0004
        BLT     L_569E                          ; 569B   0205 0001

L_569D:
        NEGR    R1                              ; 569D   0021
L_569E:
        ADDR    R1,     R2                      ; 569E   00CA
        MVO     R2,     G_0162                  ; 569F   0242 0162
L_56A1:
        ANDI    #$000F, R0                      ; 56A1   03B8 000F
        MVO@    R0,     R3                      ; 56A3   0258
        MVI     G_0164, R5                      ; 56A4   0285 0164
        MOVR    R5,     R1                      ; 56A6   00A9
        SAR     R1,     2                       ; 56A7   006D
        SAR     R1,     2                       ; 56A8   006D
        XORR    R1,     R5                      ; 56A9   01CD
        ANDI    #$000F, R5                      ; 56AA   03BD 000F
        MOVR    R5,     R1                      ; 56AC   00A9
        ANDR    R0,     R1                      ; 56AD   0181
        XORR    R1,     R0                      ; 56AE   01C8
        XORR    R5,     R0                      ; 56AF   01E8
        COMR    R0                              ; 56B0   0018
        MVI@    R4,     R2                      ; 56B1   02A2
        MVI     G_0160, R1                      ; 56B2   0281 0160
        ADDI    #$0003, R1                      ; 56B4   02F9 0003
        ANDI    #$0007, R1                      ; 56B6   03B9 0007
        CMPI    #$0003, R1                      ; 56B8   0379 0003
        BLE     L_56BE                          ; 56BA   0206 0002

        SLR     R2,     2                       ; 56BC   0066
        SLR     R2,     2                       ; 56BD   0066
L_56BE:
        ANDI    #$000F, R2                      ; 56BE   03BA 000F
        ANDR    R2,     R0                      ; 56C0   0190
        BNEQ    L_56C7                          ; 56C1   020C 0004

        MVO@    R0,     R3                      ; 56C3   0258
        MVO     R0,     G_0164                  ; 56C4   0240 0164
        MOVR    R2,     R0                      ; 56C6   0090
L_56C7:
        MVII    #$0165, R3                      ; 56C7   02BB 0165
        CLRR    R2                              ; 56C9   01D2
        MVO@    R2,     R3                      ; 56CA   025A
        MVI     G_0160, R4                      ; 56CB   0284 0160
        MVI     G_0162, R2                      ; 56CD   0282 0162
        SUB     G_0130, R4                      ; 56CF   0304 0130
        SUB     G_0131, R2                      ; 56D1   0302 0131
        MOVR    R0,     R1                      ; 56D3   0081
        TSTR    R4                              ; 56D4   00A4
        BPL     L_56DD                          ; 56D5   0203 0006

        ANDI    #$0001, R0                      ; 56D7   03B8 0001
        BNEQ    L_56E1                          ; 56D9   020C 0006
        B       L_56E2                          ; 56DB   0200 0005

L_56DD:
        ANDI    #$0004, R0                      ; 56DD   03B8 0004
        BEQ     L_56E2                          ; 56DF   0204 0001

L_56E1:
        MVO@    R0,     R3                      ; 56E1   0258
L_56E2:
        MOVR    R1,     R0                      ; 56E2   0088
        SDBD                                    ; 56E3   0001
        CMPI    #$FFFC, R2                      ; 56E4   037A 00FC 00FF
        BLT     L_56F3                          ; 56E7   0205 000A

        CMPI    #$0004, R2                      ; 56E9   037A 0004
        BLT     L_56FB                          ; 56EB   0205 000E

        ANDI    #$0002, R0                      ; 56ED   03B8 0002
        BNEQ    L_56F7                          ; 56EF   020C 0006
        B       L_56FB                          ; 56F1   0200 0008

L_56F3:
        ANDI    #$0008, R0                      ; 56F3   03B8 0008
        BEQ     L_56FB                          ; 56F5   0204 0004

L_56F7:
        SLL     R0,     2                       ; 56F7   004C
        SLL     R0,     2                       ; 56F8   004C
        XOR@    R3,     R0                      ; 56F9   03D8
        MVO@    R0,     R3                      ; 56FA   0258
L_56FB:
        MVI@    R3,     R0                      ; 56FB   0298
        TSTR    R0                              ; 56FC   0080
        BNEQ    L_5785                          ; 56FD   020C 0086

        MVII    #$0210, R2                      ; 56FF   02BA 0210
L_5701:
        SLR     R2,     2                       ; 5701   0066
        MOVR    R1,     R0                      ; 5702   0088
        ANDR    R2,     R0                      ; 5703   0190
        BEQ     L_5701                          ; 5704   0224 0004

        ANDI    #$000A, R2                      ; 5706   03BA 000A
        BEQ     L_570C                          ; 5708   0204 0002

        SLL     R0,     2                       ; 570A   004C
        SLL     R0,     2                       ; 570B   004C
L_570C:
        MVO@    R0,     R3                      ; 570C   0258
        B       L_5785                          ; 570D   0200 0076

L_570F:
        SDBD                                    ; 570F   0001
        MVII    #$5593, R4                      ; 5710   02BC 0093 0055
        MVI@    R3,     R0                      ; 5713   0298
        B       L_56A1                          ; 5714   0220 0074

L_5716:
        CMPI    #$0018, R0                      ; 5716   0378 0018
        BGE     L_570F                          ; 5718   022D 000A

        CMPI    #$0015, R0                      ; 571A   0378 0015
        BGT     L_572A                          ; 571C   020E 000C

        CMPI    #$0010, R0                      ; 571E   0378 0010
        BGE     L_572B                          ; 5720   020D 0009

L_5722:
        SUBI    #$0003, R0                      ; 5722   0338 0003
        BMI     L_572A                          ; 5724   020B 0004

        CMPI    #$0003, R0                      ; 5726   0378 0003
        BLE     L_572D                          ; 5728   0206 0003

L_572A:
        MOVR    R5,     R7                      ; 572A   00AF
L_572B:
        SUBI    #$0003, R0                      ; 572B   0338 0003
L_572D:
        MVI@    R3,     R2                      ; 572D   029A
        MVII    #$0164, R3                      ; 572E   02BB 0164
        CMPI    #$0070, R2                      ; 5730   037A 0070
        BLT     L_5746                          ; 5732   0205 0012

        MVI@    R3,     R2                      ; 5734   029A
        ANDI    #$000F, R2                      ; 5735   03BA 000F
        BNEQ    L_573C                          ; 5737   020C 0003

        MVI@    R3,     R2                      ; 5739   029A
        SAR     R2,     2                       ; 573A   006E
        SAR     R2,     2                       ; 573B   006E
L_573C:
        CMPI    #$0003, R2                      ; 573C   037A 0003
        BLT     L_5742                          ; 573E   0205 0002

        SLR     R2,     2                       ; 5740   0066
        INCR    R7                              ; 5741   000F
L_5742:
        SLL     R2,     2                       ; 5742   004E
        MVO@    R2,     R3                      ; 5743   025A
        B       L_574A                          ; 5744   0200 0004

L_5746:
        CMPI    #$0030, R2                      ; 5746   037A 0030
        BGE     L_5785                          ; 5748   020D 003B

L_574A:
        MVI     G_0160, R5                      ; 574A   0285 0160
        MVII    #$0001, R2                      ; 574C   02BA 0001
        ANDI    #$0001, R0                      ; 574E   03B8 0001
        BNEQ    L_5753                          ; 5750   020C 0001

        NEGR    R2                              ; 5752   0022
L_5753:
        ADDR    R2,     R5                      ; 5753   00D5
        CMPI    #$009E, R5                      ; 5754   037D 009E
        BGE     L_575E                          ; 5756   020D 0006

        CMPI    #$000B, R5                      ; 5758   037D 000B
        BLE     L_575E                          ; 575A   0206 0002

        MVO     R5,     G_0160                  ; 575C   0245 0160
L_575E:
        MVII    #$0030, R2                      ; 575E   02BA 0030
        MVO     R2,     G_0163                  ; 5760   0242 0163
        MVI@    R3,     R2                      ; 5762   029A
        ANDI    #$000F, R2                      ; 5763   03BA 000F
        BNEQ    L_576A                          ; 5765   020C 0003

        MVI@    R3,     R2                      ; 5767   029A
        SAR     R2,     2                       ; 5768   006E
        SAR     R2,     2                       ; 5769   006E
L_576A:
        MVI@    R4,     R1                      ; 576A   02A1
        ANDR    R1,     R2                      ; 576B   018A
        BEQ     L_5770                          ; 576C   0204 0002

        SAR     R1,     2                       ; 576E   006D
        SAR     R1,     2                       ; 576F   006D
L_5770:
        ANDI    #$000F, R1                      ; 5770   03B9 000F
        MOVR    R1,     R2                      ; 5772   008A
        MVII    #$00A5, R0                      ; 5773   02B8 00A5
        MVI     G_011B, R5                      ; 5775   0285 011B
        TSTR    R5                              ; 5777   00AD
        BNEQ    L_577C                          ; 5778   020C 0002

        MVII    #$005A, R0                      ; 577A   02B8 005A
L_577C:
        ANDR    R0,     R1                      ; 577C   0181
        SAR     R0,     2                       ; 577D   006C
        SAR     R0,     2                       ; 577E   006C
        ANDR    R0,     R2                      ; 577F   0182
        SLL     R2,     2                       ; 5780   004E
        SLL     R2,     2                       ; 5781   004E
        XORR    R2,     R1                      ; 5782   01D1
        MVO     R1,     G_0165                  ; 5783   0241 0165
L_5785:
        MVII    #$0164, R3                      ; 5785   02BB 0164
        MVI@    R3,     R5                      ; 5787   029D
        PSHR    R5                              ; 5788   0275
        MVI     G_0165, R0                      ; 5789   0280 0165
        MOVR    R0,     R2                      ; 578B   0082
        SAR     R2,     2                       ; 578C   006E
        SAR     R2,     2                       ; 578D   006E
        ANDI    #$000F, R0                      ; 578E   03B8 000F
        BNEQ    L_5796                          ; 5790   020C 0004

        ANDI    #$00F0, R5                      ; 5792   03BD 00F0
        MVO@    R5,     R3                      ; 5794   025D
        MOVR    R2,     R0                      ; 5795   0090
L_5796:
        TSTR    R2                              ; 5796   0092
        BNEQ    L_579D                          ; 5797   020C 0004

        ANDI    #$000F, R5                      ; 5799   03BD 000F
        MVO@    R5,     R3                      ; 579B   025D
        MOVR    R0,     R2                      ; 579C   0082
L_579D:
        MVI     G_011B, R1                      ; 579D   0281 011B
        TSTR    R1                              ; 579F   0089
        BNEQ    L_57A3                          ; 57A0   020C 0001

        MOVR    R0,     R2                      ; 57A2   0082
L_57A3:
        PSHR    R2                              ; 57A3   0272
        MVII    #$0100, R0                      ; 57A4   02B8 0100
        MVII    #$0100, R3                      ; 57A6   02BB 0100
        SARC    R2,     2                       ; 57A8   007E
        BC      L_57B1                          ; 57A9   0201 0006
        BOV     L_57B4                          ; 57AB   0202 0007

        SARC    R2,     2                       ; 57AD   007E
        BOV     L_57B5                          ; 57AE   0202 0005

        NEGR    R0                              ; 57B0   0020
L_57B1:
        CLRR    R3                              ; 57B1   01DB
        B       L_57B6                          ; 57B2   0200 0002

L_57B4:
        NEGR    R3                              ; 57B4   0023
L_57B5:
        CLRR    R0                              ; 57B5   01C0
L_57B6:
        MVI     G_015E, R5                      ; 57B6   0285 015E
        MVII    #$015F, R4                      ; 57B8   02BC 015F
        CMPI    #$0001, R5                      ; 57BA   037D 0001
        BNEQ    L_57C0                          ; 57BC   020C 0002

        SAR     R0,     1                       ; 57BE   0068
        SAR     R3,     1                       ; 57BF   006B

L_57C0:
        JSR     R5,     L_54A2                  ; 57C0   0004 0154 00A2

        PULR    R1                              ; 57C3   02B1
        PULR    R4                              ; 57C4   02B4
        MVI     G_011B, R5                      ; 57C5   0285 011B
        CMPI    #$0001, R5                      ; 57C7   037D 0001
        BGE     L_5819                          ; 57C9   020D 004E

        MVI     G_015D, R5                      ; 57CB   0285 015D
        ANDI    #$0004, R5                      ; 57CD   03BD 0004
        MVI     G_011C, R4                      ; 57CF   0284 011C
        MOVR    R1,     R2                      ; 57D1   008A
        CMPI    #$0003, R1                      ; 57D2   0379 0003
        BLT     L_57D8                          ; 57D4   0205 0002

        SLR     R1,     2                       ; 57D6   0065
        INCR    R7                              ; 57D7   000F
L_57D8:
        SLL     R1,     2                       ; 57D8   004D
        MVI     G_0164, R3                      ; 57D9   0283 0164
        ANDI    #$000A, R2                      ; 57DB   03BA 000A
        BNEQ    L_57EC                          ; 57DD   020C 000D

        CLRR    R5                              ; 57DF   01ED
        TSTR    R0                              ; 57E0   0080
        BPL     L_57E5                          ; 57E1   0203 0002

        XORI    #$0004, R5                      ; 57E3   03FD 0004
L_57E5:
        TSTR    R4                              ; 57E5   00A4
        BNEQ    L_57F6                          ; 57E6   020C 000E

        ANDI    #$00F0, R3                      ; 57E8   03BB 00F0
        B       L_57F3                          ; 57EA   0200 0007

L_57EC:
        TSTR    R4                              ; 57EC   00A4
        BNEQ    L_57F6                          ; 57ED   020C 0007

        ANDI    #$000F, R3                      ; 57EF   03BB 000F
        SLL     R1,     2                       ; 57F1   004D
        SLL     R1,     2                       ; 57F2   004D
L_57F3:
        XORR    R1,     R3                      ; 57F3   01CB
        MVO     R3,     G_0164                  ; 57F4   0243 0164
L_57F6:
        MVO     R5,     G_015D                  ; 57F6   0245 015D
        MVI     G_0115, R5                      ; 57F8   0285 0115
        ANDI    #$0002, R5                      ; 57FA   03BD 0002
        BNEQ    L_5818                          ; 57FC   020C 001A

        MVII    #$0060, R2                      ; 57FE   02BA 0060
        MVII    #$033F, R3                      ; 5800   02BB 033F
        ADD     G_012E, R3                      ; 5802   02C3 012E
        PSHR    R3                              ; 5804   0273
        SDBD                                    ; 5805   0001
        MVII    #$607E, R1                      ; 5806   02B9 007E 0060
        MVI     G_015E, R5                      ; 5809   0285 015E
        CMPI    #$0001, R5                      ; 580B   037D 0001
        BNEQ    L_5813                          ; 580D   020C 0004

        ADDI    #$0060, R1                      ; 580F   02F9 0060
        MVII    #$0040, R2                      ; 5811   02BA 0040

L_5813:
        JSR     R5,     L_5078                  ; 5813   0004 0150 0078

        PULR    R3                              ; 5816   02B3
        MVO@    R0,     R3                      ; 5817   0258
L_5818:
        PULR    R7                              ; 5818   02B7
L_5819:
        MVII    #$0165, R3                      ; 5819   02BB 0165
        MVI     G_0163, R2                      ; 581B   0282 0163
        CMPI    #$0030, R2                      ; 581D   037A 0030
        BLT     L_5825                          ; 581F   0205 0004

        MVII    #$0040, R1                      ; 5821   02B9 0040
        CLRR    R5                              ; 5823   01ED
        MVO@    R5,     R3                      ; 5824   025D
L_5825:
        XORR    R1,     R2                      ; 5825   01CA
        MVO     R2,     G_0163                  ; 5826   0242 0163
        MVO     R4,     G_0164                  ; 5828   0244 0164
        MVI@    R3,     R0                      ; 582A   0298
        ANDI    #$000F, R0                      ; 582B   03B8 000F
        CMPR    R0,     R1                      ; 582D   0141
        BNEQ    L_5832                          ; 582E   020C 0002

        MVI@    R3,     R0                      ; 5830   0298
        XORR    R1,     R0                      ; 5831   01C8
L_5832:
        MVO@    R0,     R3                      ; 5832   0258
        PULR    R7                              ; 5833   02B7
L_5834:
        INCR    R2                              ; 5834   000A
        CMPI    #$0094, R2                      ; 5835   037A 0094
        BLT     L_583A                          ; 5837   0205 0001

        CLRR    R2                              ; 5839   01D2
L_583A:
        MVO@    R2,     R3                      ; 583A   025A
        ANDI    #$001F, R2                      ; 583B   03BA 001F

        JSR     R5,     L_5845                  ; 583D   0004 0158 0045
        DECLE   $0001                           ; 5840   0001

        EIS                                     ; 5841   0002
        DIS                                     ; 5842   0003

        JSR     R4,     .BTAB.A8                ; 5843   0004 0000 02A8

        TSTR    R0                              ; 5846   0080
        BEQ     L_5818                          ; 5847   0224 0030

        CMPR    R2,     R0                      ; 5849   0150
        BNEQ    L_5845                          ; 584A   022C 0006

        MVII    #$033F, R3                      ; 584C   02BB 033F
        ADD     G_012E, R3                      ; 584E   02C3 012E
        PSHR    R3                              ; 5850   0273

        JSR     R5,     L_5075                  ; 5851   0004 0150 0075

        SWAP    R0,     1                       ; 5854   0040
        COMR    R6                              ; 5855   001E
        SLR     R1,     1                       ; 5856   0061
        PULR    R3                              ; 5857   02B3
        MVO@    R0,     R3                      ; 5858   0258
        PULR    R7                              ; 5859   02B7
L_585A:
        MVII    #$0100, R0                      ; 585A   02B8 0100
        NEGR    R0                              ; 585C   0020
        MVII    #$0100, R3                      ; 585D   02BB 0100
        MVII    #$015F, R4                      ; 585F   02BC 015F

        JSR     R5,     L_54A2                  ; 5861   0004 0154 00A2

        MVI     G_011B, R1                      ; 5864   0281 011B
        CMPI    #$0001, R1                      ; 5866   0379 0001
        BLT     L_58A7                          ; 5868   0205 003D

        MVI     G_0162, R0                      ; 586A   0280 0162
        ADDI    #$0002, R0                      ; 586C   02F8 0002
        CMPI    #$0068, R0                      ; 586E   0378 0068
        BLT     L_58A5                          ; 5870   0205 0033

        MVI     G_012E, R0                      ; 5872   0280 012E
        CMPI    #$0002, R0                      ; 5874   0378 0002
        BGT     L_589A                          ; 5876   020E 0022

        MVI     G_0112, R1                      ; 5878   0281 0112
        MVI     G_0114, R2                      ; 587A   0282 0114
        MVII    #$0005, R3                      ; 587C   02BB 0005
        CMPI    #$0028, R2                      ; 587E   037A 0028
        BLT     L_5888                          ; 5880   0205 0006

        SLL     R3,     1                       ; 5882   004B
        CMPI    #$0048, R2                      ; 5883   037A 0048
        BLT     L_5888                          ; 5885   0205 0001

        SLL     R3,     1                       ; 5887   004B
L_5888:
        TSTR    R0                              ; 5888   0080
        BNEQ    L_588C                          ; 5889   020C 0001

        NEGR    R3                              ; 588B   0023
L_588C:
        ADDR    R3,     R1                      ; 588C   00D9
        MVII    #$0028, R3                      ; 588D   02BB 0028
        CMPR    R3,     R1                      ; 588F   0159
        BLE     L_5897                          ; 5890   0206 0005

        MVII    #$0098, R3                      ; 5892   02BB 0098
        CMPR    R3,     R1                      ; 5894   0159
        BLE     L_58A2                          ; 5895   0206 000B

L_5897:
        MOVR    R3,     R1                      ; 5897   0099
        B       L_58A2                          ; 5898   0200 0008

L_589A:
        MVI     G_0160, R1                      ; 589A   0281 0160
        CMPI    #$0028, R1                      ; 589C   0379 0028
        BGE     L_58A2                          ; 589E   020D 0002

        MVII    #$0098, R1                      ; 58A0   02B9 0098
L_58A2:
        MVO     R1,     G_0160                  ; 58A2   0241 0160
        CLRR    R0                              ; 58A4   01C0
L_58A5:
        MVO     R0,     G_0162                  ; 58A5   0240 0162
L_58A7:
        MVI     G_0160, R1                      ; 58A7   0281 0160
        MVI     G_0162, R2                      ; 58A9   0282 0162
        XORI    #$0080, R2                      ; 58AB   03FA 0080
        SDBD                                    ; 58AD   0001
        XORI    #$4300, R1                      ; 58AE   03F9 0000 0043
        MVII    #$0323, R5                      ; 58B1   02BD 0323
        ADD     G_012E, R5                      ; 58B3   02C5 012E
        MVO@    R2,     R5                      ; 58B5   026A
        SUBI    #$0009, R5                      ; 58B6   033D 0009
        MVO@    R1,     R5                      ; 58B8   0269
        SDBD                                    ; 58B9   0001
        MVII    #$615E, R0                      ; 58BA   02B8 005E 0061
        MVII    #$033F, R3                      ; 58BD   02BB 033F
        ADD     G_012E, R3                      ; 58BF   02C3 012E
        MVO@    R0,     R3                      ; 58C1   0258
        PULR    R7                              ; 58C2   02B7
L_58C3:
        PSHR    R5                              ; 58C3   0275
        MVI     G_011F, R0                      ; 58C4   0280 011F
        TSTR    R0                              ; 58C6   0080
        BEQ     L_5919                          ; 58C7   0204 0050

        CMPI    #$0004, R0                      ; 58C9   0378 0004
        BNEQ    L_5818                          ; 58CB   022C 00B4

        MVI     G_0132, R0                      ; 58CD   0280 0132
        MOVR    R0,     R1                      ; 58CF   0081
        ADDI    #$0133, R1                      ; 58D0   02F9 0133
        MVI@    R1,     R2                      ; 58D2   028A
        INCR    R2                              ; 58D3   000A
        CMPI    #$0003, R0                      ; 58D4   0378 0003
        BNEQ    L_58DF                          ; 58D6   020C 0007

        CLRR    R3                              ; 58D8   01DB
        CMPI    #$001F, R2                      ; 58D9   037A 001F
        BGT     L_58F9                          ; 58DB   020E 001C

        MVO@    R2,     R1                      ; 58DD   024A
        PULR    R7                              ; 58DE   02B7
L_58DF:
        CMPI    #$0008, R2                      ; 58DF   037A 0008
        BLT     L_58E4                          ; 58E1   0205 0001

        CLRR    R2                              ; 58E3   01D2
L_58E4:
        MVO@    R2,     R1                      ; 58E4   024A
        MVI     G_0132, R3                      ; 58E5   0283 0132
        ADDI    #$0339, R3                      ; 58E7   02FB 0339
        PSHR    R3                              ; 58E9   0273
        PSHR    R2                              ; 58EA   0272

        JSR     R5,     L_5075                  ; 58EB   0004 0150 0075

L_58EE:
        TSTR    R0                              ; 58EE   0080
        SARC    R2,     2                       ; 58EF   007E
        SLR     R1,     1                       ; 58F0   0061
        PULR    R2                              ; 58F1   02B2
        PULR    R3                              ; 58F2   02B3
        MVO@    R0,     R3                      ; 58F3   0258
        ANDI    #$0003, R2                      ; 58F4   03BA 0003
        BNEQ    L_5818                          ; 58F6   022C 00DF

        INCR    R7                              ; 58F8   000F
L_58F9:
        MVO@    R3,     R1                      ; 58F9   024B

        JSR     R5,     L_590D                  ; 58FA   0004 0158 010D
        DECLE   $0000,  $0001                   ; 58FD   0000 0001

        EIS                                     ; 58FF   0002
        DIS                                     ; 5900   0003
        EIS                                     ; 5901   0002
        DECLE   $0001                           ; 5902   0001

        EIS                                     ; 5903   0002
        DECLE   $0000,  $0001                   ; 5904   0000 0001

        EIS                                     ; 5906   0002
        DECLE   $0000,  $0001                   ; 5907   0000 0001

        EIS                                     ; 5909   0002
        DIS                                     ; 590A   0003
        EIS                                     ; 590B   0002
        DECLE   $0001                           ; 590C   0001
L_590D:
        MVI     G_0137, R1                      ; 590D   0281 0137
        INCR    R1                              ; 590F   0009
        ANDI    #$000F, R1                      ; 5910   03B9 000F
        MVO     R1,     G_0137                  ; 5912   0241 0137
        ADDR    R1,     R5                      ; 5914   00CD
        MVI@    R5,     R2                      ; 5915   02AA
        MVO     R2,     G_0132                  ; 5916   0242 0132
        PULR    R7                              ; 5918   02B7
L_5919:
        MVI     G_0132, R0                      ; 5919   0280 0132
        MOVR    R0,     R1                      ; 591B   0081
        ADDI    #$0133, R1                      ; 591C   02F9 0133
        MVI@    R1,     R2                      ; 591E   028A
        CMPI    #$0003, R0                      ; 591F   0378 0003
        BNEQ    L_592B                          ; 5921   020C 0008

        CLRR    R3                              ; 5923   01DB
        INCR    R2                              ; 5924   000A
        ANDI    #$007F, R2                      ; 5925   03BA 007F
        MVO@    R2,     R1                      ; 5927   024A
        BEQ     L_5986                          ; 5928   0204 005C

        PULR    R7                              ; 592A   02B7
L_592B:
        PSHR    R1                              ; 592B   0271
        MVI     G_0132, R3                      ; 592C   0283 0132
        SLL     R3,     1                       ; 592E   004B
        ADDI    #$0339, R3                      ; 592F   02FB 0339
        PSHR    R3                              ; 5931   0273
        CMPI    #$0008, R2                      ; 5932   037A 0008
        BLT     L_594E                          ; 5934   0205 0018

        JSR     R5,     L_5086                  ; 5936   0004 0150 0086

        MOVR    R2,     R0                      ; 5939   0090
        DECR    R6                              ; 593A   0016
        SLR     R3,     1                       ; 593B   0063
        PSHR    R0                              ; 593C   0270
        MVII    #$0110, R4                      ; 593D   02BC 0110

L_593F:
        JSR     R5,     L_59BB                  ; 593F   0004 0158 01BB

        CMPI    #$015D, R4                      ; 5942   037C 015D
        BGT     L_5948                          ; 5944   020E 0002

        MVII    #$016E, R4                      ; 5946   02BC 016E
L_5948:
        CMPI    #$01C3, R4                      ; 5948   037C 01C3
        BLT     L_593F                          ; 594A   0225 000C
        B       L_5964                          ; 594C   0200 0016

L_594E:
        JSR     R5,     L_5075                  ; 594E   0004 0150 0075

        MOVR    R2,     R0                      ; 5951   0090
        DECR    R6                              ; 5952   0016
        SLR     R3,     1                       ; 5953   0063
        PSHR    R0                              ; 5954   0270
        MVII    #$0110, R4                      ; 5955   02BC 0110

L_5957:
        JSR     R5,     L_59A5                  ; 5957   0004 0158 01A5

        CMPI    #$015D, R4                      ; 595A   037C 015D
        BGT     L_5960                          ; 595C   020E 0002

        MVII    #$016E, R4                      ; 595E   02BC 016E
L_5960:
        CMPI    #$01C3, R4                      ; 5960   037C 01C3
        BLT     L_5957                          ; 5962   0225 000C

L_5964:
        PULR    R0                              ; 5964   02B0
        PULR    R4                              ; 5965   02B4
        MOVR    R0,     R1                      ; 5966   0081
        ADDI    #$0090, R1                      ; 5967   02F9 0090
        MVO@    R0,     R4                      ; 5969   0260
        MVO@    R1,     R4                      ; 596A   0261
        PULR    R1                              ; 596B   02B1
        MVI@    R1,     R2                      ; 596C   028A
        INCR    R2                              ; 596D   000A
        ANDI    #$000F, R2                      ; 596E   03BA 000F
        MVO@    R2,     R1                      ; 5970   024A
        ANDI    #$0007, R2                      ; 5971   03BA 0007
        BNEQ    L_5818                          ; 5973   022C 015C

        MVII    #$0008, R3                      ; 5975   02BB 0008
        MVI     G_0110, R5                      ; 5977   0285 0110
        ANDI    #$0020, R5                      ; 5979   03BD 0020
        BEQ     L_5986                          ; 597B   0204 0009

        MVI     G_0110, R5                      ; 597D   0285 0110
        CMPI    #$0024, R5                      ; 597F   037D 0024
        BEQ     L_5984                          ; 5981   0204 0001

        SAR     R3,     1                       ; 5983   006B
L_5984:
        MVO     R3,     G_0110                  ; 5984   0243 0110

L_5986:
        JSR     R5,     L_5999                  ; 5986   0004 0158 0199
        DECLE   $0000                           ; 5989   0000

        DIS                                     ; 598A   0003
        DECLE   $0000                           ; 598B   0000

        DIS                                     ; 598C   0003
        DECLE   $0000                           ; 598D   0000

        DIS                                     ; 598E   0003
        DECLE   $0000                           ; 598F   0000

        DIS                                     ; 5990   0003
        DECLE   $0000                           ; 5991   0000

        DIS                                     ; 5992   0003
        DECLE   $0000                           ; 5993   0000

        DIS                                     ; 5994   0003
        DECLE   $0000                           ; 5995   0000

        DIS                                     ; 5996   0003
        DECLE   $0000                           ; 5997   0000

        DIS                                     ; 5998   0003
L_5999:
        MVI     G_0137, R3                      ; 5999   0283 0137
        INCR    R3                              ; 599B   000B
        ANDI    #$000F, R3                      ; 599C   03BB 000F
        MVO     R3,     G_0137                  ; 599E   0243 0137
        ADDR    R3,     R5                      ; 59A0   00DD
        MVI@    R5,     R3                      ; 59A1   02AB
        MVO     R3,     G_0132                  ; 59A2   0243 0132
        PULR    R7                              ; 59A4   02B7
L_59A5:
        PSHR    R5                              ; 59A5   0275
        PSHR    R4                              ; 59A6   0274
        MVI@    R4,     R1                      ; 59A7   02A1
        ANDI    #$0008, R1                      ; 59A8   03B9 0008
        BEQ     L_59B7                          ; 59AA   0204 000B

        MVII    #$0028, R1                      ; 59AC   02B9 0028
        DECR    R4                              ; 59AE   0014
        MVII    #$0200, R3                      ; 59AF   02BB 0200
        NEGR    R3                              ; 59B1   0023
L_59B2:
        MVO@    R1,     R4                      ; 59B2   0261
        CLRR    R0                              ; 59B3   01C0

        JSR     R5,     L_5531                  ; 59B4   0004 0154 0131

L_59B7:
        PULR    R4                              ; 59B7   02B4
        ADDI    #$0010, R4                      ; 59B8   02FC 0010
        PULR    R7                              ; 59BA   02B7
L_59BB:
        PSHR    R5                              ; 59BB   0275
        PSHR    R4                              ; 59BC   0274
        MVI@    R4,     R1                      ; 59BD   02A1
        MOVR    R1,     R3                      ; 59BE   008B
        ANDI    #$0004, R3                      ; 59BF   03BB 0004
        BEQ     L_59B7                          ; 59C1   0224 000B

        INCR    R4                              ; 59C3   000C
        MVI@    R4,     R0                      ; 59C4   02A0
        ADDI    #$0003, R0                      ; 59C5   02F8 0003
        ANDI    #$00F8, R0                      ; 59C7   03B8 00F8
        INCR    R4                              ; 59C9   000C
        MVI@    R4,     R5                      ; 59CA   02A5
        MOVR    R1,     R3                      ; 59CB   008B
        ANDI    #$0040, R3                      ; 59CC   03BB 0040
        BEQ     L_59DA                          ; 59CE   0204 000A

        SUBI    #$0006, R0                      ; 59D0   0338 0006
L_59D2:
        ANDI    #$00F8, R5                      ; 59D2   03BD 00F8
        ADDI    #$0005, R5                      ; 59D4   02FD 0005
        DECR    R4                              ; 59D6   0014
        MVO@    R5,     R4                      ; 59D7   0265
        B       L_59E9                          ; 59D8   0200 000F

L_59DA:
        ANDI    #$0020, R1                      ; 59DA   03B9 0020
        BNEQ    L_59EE                          ; 59DC   020C 0010

        ADDI    #$0002, R0                      ; 59DE   02F8 0002
        MOVR    R5,     R1                      ; 59E0   00A9
        ANDI    #$0007, R1                      ; 59E1   03B9 0007
        BEQ     L_59E9                          ; 59E3   0204 0004

        CMPI    #$0004, R1                      ; 59E5   0379 0004
        BLT     L_59D2                          ; 59E7   0225 0016

L_59E9:
        SUBI    #$0003, R4                      ; 59E9   033C 0003
        MVO@    R0,     R4                      ; 59EB   0260
        ADDI    #$0002, R4                      ; 59EC   02FC 0002
L_59EE:
        SUBI    #$0005, R4                      ; 59EE   033C 0005
        MVII    #$0200, R3                      ; 59F0   02BB 0200
        MVII    #$0024, R1                      ; 59F2   02B9 0024
        B       L_59B2                          ; 59F4   0220 0043

L_59F6:
        PSHR    R5                              ; 59F6   0275
        B       L_5A0A                          ; 59F7   0200 0011

        PSHR    R5                              ; 59F9   0275
        MVI     G_012D, R3                      ; 59FA   0283 012D
        INCR    R3                              ; 59FC   000B
        MVO     R3,     G_012D                  ; 59FD   0243 012D
        MVI     G_0102, R3                      ; 59FF   0283 0102
        DECR    R3                              ; 5A01   0013
        BMI     L_5A56                          ; 5A02   020B 0052

        CMPI    #$0001, R3                      ; 5A04   037B 0001
        MVO     R3,     G_0102                  ; 5A06   0243 0102
        BNEQ    L_5A56                          ; 5A08   020C 004C

L_5A0A:
        CLRR    R4                              ; 5A0A   01E4
        MVII    #$0319, R5                      ; 5A0B   02BD 0319
        MVI@    R5,     R0                      ; 5A0D   02A8
        MVO@    R0,     R4                      ; 5A0E   0260
        MVI@    R5,     R0                      ; 5A0F   02A8
        MVO@    R0,     R4                      ; 5A10   0260
        MVI@    R5,     R0                      ; 5A11   02A8
        MVO@    R0,     R4                      ; 5A12   0260
        MVI@    R5,     R0                      ; 5A13   02A8
        MVO@    R0,     R4                      ; 5A14   0260
        MVI@    R5,     R0                      ; 5A15   02A8
        MVO@    R0,     R4                      ; 5A16   0260
        MVI@    R5,     R0                      ; 5A17   02A8
        MVO@    R0,     R4                      ; 5A18   0260
        MVI@    R5,     R0                      ; 5A19   02A8
        MVO@    R0,     R4                      ; 5A1A   0260
        MVI@    R5,     R0                      ; 5A1B   02A8
        MVO@    R0,     R4                      ; 5A1C   0260
        MVI@    R5,     R0                      ; 5A1D   02A8
        MVO@    R0,     R4                      ; 5A1E   0260
        MVI@    R5,     R0                      ; 5A1F   02A8
        MVO@    R0,     R4                      ; 5A20   0260
        MVI@    R5,     R0                      ; 5A21   02A8
        MVO@    R0,     R4                      ; 5A22   0260
        MVI@    R5,     R0                      ; 5A23   02A8
        MVO@    R0,     R4                      ; 5A24   0260
        MVI@    R5,     R0                      ; 5A25   02A8
        MVO@    R0,     R4                      ; 5A26   0260
        MVI@    R5,     R0                      ; 5A27   02A8
        MVO@    R0,     R4                      ; 5A28   0260
        MVI@    R5,     R0                      ; 5A29   02A8
        MVO@    R0,     R4                      ; 5A2A   0260
        MVI@    R5,     R0                      ; 5A2B   02A8
        MVO@    R0,     R4                      ; 5A2C   0260
        MVI@    R5,     R0                      ; 5A2D   02A8
        MVO@    R0,     R4                      ; 5A2E   0260
        MVI@    R5,     R0                      ; 5A2F   02A8
        MVO@    R0,     R4                      ; 5A30   0260
        MVI@    R5,     R0                      ; 5A31   02A8
        MVO@    R0,     R4                      ; 5A32   0260
        MVI@    R5,     R0                      ; 5A33   02A8
        MVO@    R0,     R4                      ; 5A34   0260
        MVI@    R5,     R0                      ; 5A35   02A8
        MVO@    R0,     R4                      ; 5A36   0260
        MVI@    R5,     R0                      ; 5A37   02A8
        MVO@    R0,     R4                      ; 5A38   0260
        MVI@    R5,     R0                      ; 5A39   02A8
        MVO@    R0,     R4                      ; 5A3A   0260
        MVI@    R5,     R0                      ; 5A3B   02A8
        MVO@    R0,     R4                      ; 5A3C   0260
        MVII    #$0331, R5                      ; 5A3D   02BD 0331
        MVII    #$001A, R4                      ; 5A3F   02BC 001A
        MVI@    R4,     R0                      ; 5A41   02A0
        MVO@    R0,     R5                      ; 5A42   0268
        MVI@    R4,     R0                      ; 5A43   02A0
        MVO@    R0,     R5                      ; 5A44   0268
        MVI@    R4,     R0                      ; 5A45   02A0
        MVO@    R0,     R5                      ; 5A46   0268
        MVI@    R4,     R0                      ; 5A47   02A0
        MVO@    R0,     R5                      ; 5A48   0268
        MVI@    R4,     R0                      ; 5A49   02A0
        MVO@    R0,     R5                      ; 5A4A   0268
        MVI@    R4,     R0                      ; 5A4B   02A0
        MVO@    R0,     R5                      ; 5A4C   0268
        CLRR    R0                              ; 5A4D   01C0
        SUBI    #$0006, R4                      ; 5A4E   033C 0006
        MVO@    R0,     R4                      ; 5A50   0260
        MVO@    R0,     R4                      ; 5A51   0260
        MVO@    R0,     R4                      ; 5A52   0260
        MVO@    R0,     R4                      ; 5A53   0260
        MVO@    R0,     R4                      ; 5A54   0260
        MVO@    R0,     R4                      ; 5A55   0260
L_5A56:
        MVO     R4,     .STIC.VIDEN             ; 5A56   0244 0020
        MVI     G_0116, R1                      ; 5A58   0281 0116
        INCR    R1                              ; 5A5A   0009
        MVO     R1,     G_0116                  ; 5A5B   0241 0116
        ANDI    #$0001, R1                      ; 5A5D   03B9 0001
        BEQ     L_5A63                          ; 5A5F   0204 0002

        MVII    #$0006, R1                      ; 5A61   02B9 0006
L_5A63:
        MVII    #$0339, R3                      ; 5A63   02BB 0339
        ADDR    R1,     R3                      ; 5A65   00CB
        SDBD                                    ; 5A66   0001
        MVII    #$38C0, R4                      ; 5A67   02BC 00C0 0038
        SLL     R1,     2                       ; 5A6A   004D
        SLL     R1,     2                       ; 5A6B   004D
        ADDR    R1,     R4                      ; 5A6C   00CC
        MVII    #$0006, R2                      ; 5A6D   02BA 0006
L_5A6F:
        MVI@    R3,     R5                      ; 5A6F   029D
        TSTR    R5                              ; 5A70   00AD
        BEQ     L_5AA7                          ; 5A71   0204 0034

        MVI@    R5,     R0                      ; 5A73   02A8
        MVO@    R0,     R4                      ; 5A74   0260
        MVI@    R5,     R0                      ; 5A75   02A8
        MVO@    R0,     R4                      ; 5A76   0260
        MVI@    R5,     R0                      ; 5A77   02A8
        MVO@    R0,     R4                      ; 5A78   0260
        MVI@    R5,     R0                      ; 5A79   02A8
        MVO@    R0,     R4                      ; 5A7A   0260
        MVI@    R5,     R0                      ; 5A7B   02A8
        MVO@    R0,     R4                      ; 5A7C   0260
        MVI@    R5,     R0                      ; 5A7D   02A8
        MVO@    R0,     R4                      ; 5A7E   0260
        MVI@    R5,     R0                      ; 5A7F   02A8
        MVO@    R0,     R4                      ; 5A80   0260
        MVI@    R5,     R0                      ; 5A81   02A8
        MVO@    R0,     R4                      ; 5A82   0260
        MVI@    R5,     R0                      ; 5A83   02A8
        MVO@    R0,     R4                      ; 5A84   0260
        MVI@    R5,     R0                      ; 5A85   02A8
        MVO@    R0,     R4                      ; 5A86   0260
        MVI@    R5,     R0                      ; 5A87   02A8
        MVO@    R0,     R4                      ; 5A88   0260
        MVI@    R5,     R0                      ; 5A89   02A8
        MVO@    R0,     R4                      ; 5A8A   0260
        MVI@    R5,     R0                      ; 5A8B   02A8
        MVO@    R0,     R4                      ; 5A8C   0260
        MVI@    R5,     R0                      ; 5A8D   02A8
        MVO@    R0,     R4                      ; 5A8E   0260
        MVI@    R5,     R0                      ; 5A8F   02A8
        MVO@    R0,     R4                      ; 5A90   0260
        MVI@    R5,     R0                      ; 5A91   02A8
        MVO@    R0,     R4                      ; 5A92   0260
L_5A93:
        INCR    R3                              ; 5A93   000B
        DECR    R2                              ; 5A94   0012
        BNEQ    L_5A6F                          ; 5A95   022C 0027

        INCR    R7                              ; 5A97   000F
L_5A98:
        PSHR    R5                              ; 5A98   0275
        MVII    #$01FF, R2                      ; 5A99   02BA 01FF
        SUB     G_0105, R2                      ; 5A9B   0302 0105
        MVI@    R2,     R2                      ; 5A9D   0292
        MVII    #$0106, R1                      ; 5A9E   02B9 0106

        JSR     R5,     L_5ACE                  ; 5AA0   0004 0158 02CE
        JSR     R5,     X_PLAY_NOTE             ; 5AA3   0004 0118 02BD

        PULR    R7                              ; 5AA6   02B7
L_5AA7:
        ADDI    #$0010, R4                      ; 5AA7   02FC 0010
        B       L_5A93                          ; 5AA9   0220 0017

L_5AAB:
        PSHR    R5                              ; 5AAB   0275
        PSHR    R2                              ; 5AAC   0272
        MVI     .ISRVEC.0,R1                    ; 5AAD   0281 0100
        MVI     .ISRVEC.1,R2                    ; 5AAF   0282 0101
        MOVR    R7,     R0                      ; 5AB1   00B8
        SDBD                                    ; 5AB2   0001
        ADDI    #$000A, R0                      ; 5AB3   02F8 000A 0000
        MVO     R0,     .ISRVEC.0               ; 5AB6   0240 0100
        SWAP    R0,     1                       ; 5AB8   0040
        MVO     R0,     .ISRVEC.1               ; 5AB9   0240 0101
        DECR    R7                              ; 5ABB   0017
        SUBI    #$0008, R6                      ; 5ABC   033E 0008
        MVO     R1,     .ISRVEC.0               ; 5ABE   0241 0100
        MVO     R2,     .ISRVEC.1               ; 5AC0   0242 0101
        PULR    R2                              ; 5AC2   02B2
L_5AC3:
        PULR    R7                              ; 5AC3   02B7
L_5AC4:
        MVO@    R2,     R1                      ; 5AC4   024A
        INCR    R1                              ; 5AC5   0009
        MVII    #$0002, R0                      ; 5AC6   02B8 0002
        MVO@    R0,     R1                      ; 5AC8   0248
        MVII    #$00FF, R0                      ; 5AC9   02B8 00FF
        MVO     R0,     G_0104                  ; 5ACB   0240 0104
        PULR    R7                              ; 5ACD   02B7
L_5ACE:
        PSHR    R5                              ; 5ACE   0275
        ADDI    #$0002, R1                      ; 5ACF   02F9 0002
        CMP@    R1,     R2                      ; 5AD1   034A
        BNEQ    L_5AC4                          ; 5AD2   022C 000F

        INCR    R1                              ; 5AD4   0009
        MVI@    R1,     R0                      ; 5AD5   0288
        DECR    R0                              ; 5AD6   0010
        BMI     L_5AC3                          ; 5AD7   022B 0015

        MVO@    R0,     R1                      ; 5AD9   0248
        BNEQ    L_5AC3                          ; 5ADA   022C 0018

        MOVR    R2,     R3                      ; 5ADC   0093
        SLR     R3,     1                       ; 5ADD   0063
        SLR     R3,     2                       ; 5ADE   0067
        SLR     R3,     2                       ; 5ADF   0067
        SDBD                                    ; 5AE0   0001
        ADDI    #$5B58, R3                      ; 5AE1   02FB 0058 005B
        MVI@    R3,     R0                      ; 5AE4   0298
        DECR    R0                              ; 5AE5   0010
        BMI     L_5AC3                          ; 5AE6   022B 0024

        CMPI    #$0004, R0                      ; 5AE8   0378 0004
        BLT     L_5B04                          ; 5AEA   0205 0018

        SUBI    #$0002, R1                      ; 5AEC   0339 0002
        MOVR    R0,     R3                      ; 5AEE   0083
        SUBI    #$0003, R3                      ; 5AEF   033B 0003
        MVO@    R3,     R1                      ; 5AF1   024B
        DECR    R1                              ; 5AF2   0011
L_5AF3:
        ANDI    #$001F, R2                      ; 5AF3   03BA 001F
        SDBD                                    ; 5AF5   0001
        ADDI    #$5B2A, R2                      ; 5AF6   02FA 002A 005B
        MVI@    R2,     R0                      ; 5AF9   0290
        DECR    R0                              ; 5AFA   0010
        BPL     L_5B28                          ; 5AFB   0203 002B

L_5AFD:
        MVI@    R1,     R0                      ; 5AFD   0288
        ANDI    #$00BF, R0                      ; 5AFE   03B8 00BF
        XORI    #$0040, R0                      ; 5B00   03F8 0040
        MVO@    R0,     R1                      ; 5B02   0248
        PULR    R7                              ; 5B03   02B7
L_5B04:
        CLRR    R5                              ; 5B04   01ED
        SUBI    #$0002, R1                      ; 5B05   0339 0002
        MVO@    R5,     R1                      ; 5B07   024D
        DECR    R1                              ; 5B08   0011
        TSTR    R0                              ; 5B09   0080
        BEQ     L_5AF3                          ; 5B0A   0224 0018

        MOVR    R2,     R3                      ; 5B0C   0093
        ANDI    #$0010, R3                      ; 5B0D   03BB 0010
        BEQ     L_5AFD                          ; 5B0F   0224 0013

        ANDI    #$000F, R2                      ; 5B11   03BA 000F
        SDBD                                    ; 5B13   0001
        ADDI    #$5B49, R2                      ; 5B14   02FA 0049 005B
        MVI@    R2,     R3                      ; 5B17   0293
        DECR    R3                              ; 5B18   0013
        BMI     L_5AFD                          ; 5B19   022B 001D

        ADDR    R3,     R0                      ; 5B1B   00D8
        CMPI    #$000B, R0                      ; 5B1C   0378 000B
        BNEQ    L_5B21                          ; 5B1E   020C 0001

        CLRR    R0                              ; 5B20   01C0
L_5B21:
        CMPI    #$000C, R0                      ; 5B21   0378 000C
        BNEQ    L_5B26                          ; 5B23   020C 0001

        DECR    R0                              ; 5B25   0010
L_5B26:
        XORI    #$0080, R0                      ; 5B26   03F8 0080
L_5B28:
        MVO@    R0,     R1                      ; 5B28   0248
        PULR    R7                              ; 5B29   02B7
        DECLE   $0000,  $0000,  $0000           ; 5B2A   0000 0000 0000

        SETC                                    ; 5B2D   0007
        DECLE   $0000,  $0000                   ; 5B2E   0000 0000

        INCR    R3                              ; 5B30   000B
        INCR    R0                              ; 5B31   0008
        DECLE   $0000                           ; 5B32   0000

        DIS                                     ; 5B33   0003
        DECLE   $0000,  $0004                   ; 5B34   0000 0004

        INCR    R7                              ; 5B36   000F
        DECR    R0                              ; 5B37   0010
        INCR    R4                              ; 5B38   000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B39   0000 0000 0000 0000

        CLRC                                    ; 5B3D   0006
        DECLE   $0000,  $0000                   ; 5B3E   0000 0000

        INCR    R2                              ; 5B40   000A
        INCR    R1                              ; 5B41   0009
        DECLE   $0000                           ; 5B42   0000

        EIS                                     ; 5B43   0002
        DECLE   $0000,  $0005                   ; 5B44   0000 0005

        INCR    R6                              ; 5B46   000E
        DECLE   $0001                           ; 5B47   0001

        INCR    R5                              ; 5B48   000D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 5B4D   0000 0000 0000

        INCR    R2                              ; 5B50   000A
        DECLE   $0000,  $0000,  $0000           ; 5B51   0000 0000 0000

        SETC                                    ; 5B54   0007
        DECLE   $0000                           ; 5B55   0000

        JSRE    R4,     .STIC.X.0               ; 5B56   0004 0001 0000

        SETC                                    ; 5B59   0007
        DECLE   $0005                           ; 5B5A   0005

        EIS                                     ; 5B5B   0002
        CLRC                                    ; 5B5C   0006
        DIS                                     ; 5B5D   0003

        JSRE    R4,     .BTAB.B8                ; 5B5E   0004 0001 02B8
        DECLE   $0001                           ; 5B61   0001

        INCR    R7                              ; 5B62   000F
L_5B63:
        CLRR    R0                              ; 5B63   01C0
        PSHR    R5                              ; 5B64   0275
        MVO     R0,     G_011E                  ; 5B65   0240 011E
        MVI     G_011F, R0                      ; 5B67   0280 011F
        CMPI    #$0004, R0                      ; 5B69   0378 0004
        BEQ     L_5B7D                          ; 5B6B   0204 0010

        JSR     R5,     L_5546                  ; 5B6D   0004 0154 0146

        SUBI    #$007E, R1                      ; 5B70   0339 007E
        SLR     R1,     1                       ; 5B72   0061
        MOVR    R7,     R6                      ; 5B73   00BE
        SLR     R1,     1                       ; 5B74   0061
        SARC    R2,     2                       ; 5B75   007E
        SLR     R1,     1                       ; 5B76   0061
        SARC    R2,     2                       ; 5B77   007E
        SLR     R1,     1                       ; 5B78   0061
        DECLE   $0000,  $0000                   ; 5B79   0000 0000

        B       L_5B8B                          ; 5B7B   0200 000E

L_5B7D:
        JSR     R5,     L_5546                  ; 5B7D   0004 0154 0146

        SUBI    #$0016, R1                      ; 5B80   0339 0016
        SLR     R3,     1                       ; 5B82   0063
        MOVR    R4,     R6                      ; 5B83   00A6
        SLR     R3,     1                       ; 5B84   0063
        DECR    R6                              ; 5B85   0016
        SLR     R3,     1                       ; 5B86   0063
        MOVR    R4,     R6                      ; 5B87   00A6
        SLR     R3,     1                       ; 5B88   0063
        DECLE   $0000,  $0000                   ; 5B89   0000 0000
L_5B8B:
        JSR     R5,     L_5AAB                  ; 5B8B   0004 0158 02AB

        MVII    #$0001, R0                      ; 5B8E   02B8 0001
        MVO     R0,     G_0102                  ; 5B90   0240 0102
        MVII    #$0002, R1                      ; 5B92   02B9 0002
        MVI     G_0138, R0                      ; 5B94   0280 0138
        TSTR    R0                              ; 5B96   0080
        BEQ     L_5B9A                          ; 5B97   0204 0001

        SLR     R1,     1                       ; 5B99   0061
L_5B9A:
        MVO     R1,     .STIC.EDGE              ; 5B9A   0241 0032

        JSR     R5,     L_59F6                  ; 5B9C   0004 0158 01F6
        JSR     R5,     L_5AAB                  ; 5B9F   0004 0158 02AB
        JSR     R5,     L_59F6                  ; 5BA2   0004 0158 01F6

L_5BA5:
        MVI     G_011E, R5                      ; 5BA5   0285 011E
        CMPI    #$0028, R5                      ; 5BA7   037D 0028
        BNEQ    L_5BB5                          ; 5BA9   020C 000A

        MVI     G_0139, R0                      ; 5BAB   0280 0139
        MVI     G_013B, R1                      ; 5BAD   0281 013B
        TSTR    R0                              ; 5BAF   0080
        BNEQ    L_5BB5                          ; 5BB0   020C 0003

        TSTR    R1                              ; 5BB2   0089
        BEQ     L_5E08                          ; 5BB3   0204 0253

L_5BB5:
        MVII    #$0138, R4                      ; 5BB5   02BC 0138
        MVII    #$013C, R5                      ; 5BB7   02BD 013C
L_5BB9:
        MVI@    R4,     R0                      ; 5BB9   02A0
        MOVR    R4,     R3                      ; 5BBA   00A3
        ADD@    R4,     R0                      ; 5BBB   02E0
        MOVR    R0,     R2                      ; 5BBC   0082
        MOVR    R0,     R1                      ; 5BBD   0081
        SUB@    R3,     R0                      ; 5BBE   0318
        ANDI    #$0007, R1                      ; 5BBF   03B9 0007
        MVO@    R1,     R3                      ; 5BC1   0259
        XORR    R1,     R2                      ; 5BC2   01CA
        MVO@    R2,     R5                      ; 5BC3   026A
        INCR    R5                              ; 5BC4   000D
        SUBR    R0,     R2                      ; 5BC5   0102
        MVO@    R2,     R5                      ; 5BC6   026A
        SUBI    #$0002, R5                      ; 5BC7   033D 0002
        CMPI    #$013E, R5                      ; 5BC9   037D 013E
        BNEQ    L_5BB9                          ; 5BCB   022C 0013

        JSR     R5,     L_5CF7                  ; 5BCD   0004 015C 00F7
        JSR     R5,     L_5AAB                  ; 5BD0   0004 0158 02AB

        CLRR    R4                              ; 5BD3   01E4
        MVII    #$0319, R5                      ; 5BD4   02BD 0319
        MVI@    R5,     R0                      ; 5BD6   02A8
        MVO@    R0,     R4                      ; 5BD7   0260
        MVI@    R5,     R0                      ; 5BD8   02A8
        MVO@    R0,     R4                      ; 5BD9   0260
        ADDI    #$0006, R4                      ; 5BDA   02FC 0006
        ADDI    #$0006, R5                      ; 5BDC   02FD 0006
        MVI@    R5,     R0                      ; 5BDE   02A8
        MVO@    R0,     R4                      ; 5BDF   0260
        MVI@    R5,     R0                      ; 5BE0   02A8
        MVO@    R0,     R4                      ; 5BE1   0260
        MVI     G_0139, R0                      ; 5BE2   0280 0139
        MVO     R0,     .STIC.HDLY              ; 5BE4   0240 0030
        MVI     G_013B, R0                      ; 5BE6   0280 013B
        MVO     R0,     .STIC.VDLY              ; 5BE8   0240 0031
        MVO     R0,     .STIC.VIDEN             ; 5BEA   0240 0020

        JSR     R5,     L_5C27                  ; 5BEC   0004 015C 0027
        JSR     R5,     L_5C84                  ; 5BEF   0004 015C 0084
        JSR     R5,     L_5A98                  ; 5BF2   0004 0158 0298

        CLRR    R0                              ; 5BF5   01C0
        MVI     G_013C, R1                      ; 5BF6   0281 013C
        SWAP    R1,     2                       ; 5BF8   0045
        BEQ     L_5C0C                          ; 5BF9   0204 0011
        BMI     L_5BFE                          ; 5BFB   020B 0001

        INCR    R0                              ; 5BFD   0008

L_5BFE:
        JSR     R5,     L_5D2B                  ; 5BFE   0004 015C 012B

        MVI     G_011E, R5                      ; 5C01   0285 011E
        INCR    R5                              ; 5C03   000D
        MVO     R5,     G_011E                  ; 5C04   0245 011E
        CMPI    #$0014, R5                      ; 5C06   037D 0014
        BLT     L_5BA5                          ; 5C08   0225 0064
        B       L_5C21                          ; 5C0A   0200 0015

L_5C0C:
        MVI     G_013D, R1                      ; 5C0C   0281 013D
        CLRR    R0                              ; 5C0E   01C0
        SWAP    R1,     2                       ; 5C0F   0045
        BEQ     L_5BA5                          ; 5C10   0224 006C
        BMI     L_5C15                          ; 5C12   020B 0001

        INCR    R0                              ; 5C14   0008

L_5C15:
        JSR     R5,     L_5D6E                  ; 5C15   0004 015C 016E

        MVI     G_011E, R5                      ; 5C18   0285 011E
        INCR    R5                              ; 5C1A   000D
        MVO     R5,     G_011E                  ; 5C1B   0245 011E
        CMPI    #$000C, R5                      ; 5C1D   037D 000C
        BLT     L_5BA5                          ; 5C1F   0225 007B

L_5C21:
        MVII    #$0028, R5                      ; 5C21   02BD 0028
        MVO     R5,     G_011E                  ; 5C23   0245 011E
        B       L_5BA5                          ; 5C25   0220 0081

L_5C27:
        PSHR    R5                              ; 5C27   0275
        MVI     G_013C, R0                      ; 5C28   0280 013C
        SWAP    R0,     2                       ; 5C2A   0044
        BEQ     L_5C83                          ; 5C2B   0204 0056
        BPL     L_5C53                          ; 5C2D   0203 0024

        MVII    #$0200, R5                      ; 5C2F   02BD 0200
        MVII    #$0201, R4                      ; 5C31   02BC 0201
        CLRR    R2                              ; 5C33   01D2
L_5C34:
        CLRR    R3                              ; 5C34   01DB
        INCR    R3                              ; 5C35   000B
L_5C36:
        MVI@    R4,     R0                      ; 5C36   02A0
        MVO@    R0,     R5                      ; 5C37   0268
        MVI@    R4,     R0                      ; 5C38   02A0
        MVO@    R0,     R5                      ; 5C39   0268
        MVI@    R4,     R0                      ; 5C3A   02A0
        MVO@    R0,     R5                      ; 5C3B   0268
        MVI@    R4,     R0                      ; 5C3C   02A0
        MVO@    R0,     R5                      ; 5C3D   0268
        MVI@    R4,     R0                      ; 5C3E   02A0
        MVO@    R0,     R5                      ; 5C3F   0268
        MVI@    R4,     R0                      ; 5C40   02A0
        MVO@    R0,     R5                      ; 5C41   0268
        MVI@    R4,     R0                      ; 5C42   02A0
        MVO@    R0,     R5                      ; 5C43   0268
        MVI@    R4,     R0                      ; 5C44   02A0
        MVO@    R0,     R5                      ; 5C45   0268
        MVI@    R4,     R0                      ; 5C46   02A0
        MVO@    R0,     R5                      ; 5C47   0268
        MVI@    R4,     R0                      ; 5C48   02A0
        MVO@    R0,     R5                      ; 5C49   0268
        NEGR    R3                              ; 5C4A   0023
        TSTR    R3                              ; 5C4B   009B
        BMI     L_5C36                          ; 5C4C   022B 0017

        CMPI    #$02E6, R4                      ; 5C4E   037C 02E6
        BLT     L_5C34                          ; 5C50   0225 001D

        PULR    R7                              ; 5C52   02B7
L_5C53:
        MVII    #$0212, R5                      ; 5C53   02BD 0212
        MVII    #$0003, R1                      ; 5C55   02B9 0003
        CLRR    R2                              ; 5C57   01D2
L_5C58:
        CLRR    R3                              ; 5C58   01DB
        INCR    R3                              ; 5C59   000B
L_5C5A:
        MVI@    R5,     R0                      ; 5C5A   02A8
        MVO@    R0,     R5                      ; 5C5B   0268
        SUBR    R1,     R5                      ; 5C5C   010D
        MVI@    R5,     R0                      ; 5C5D   02A8
        MVO@    R0,     R5                      ; 5C5E   0268
        SUBR    R1,     R5                      ; 5C5F   010D
        MVI@    R5,     R0                      ; 5C60   02A8
        MVO@    R0,     R5                      ; 5C61   0268
        SUBR    R1,     R5                      ; 5C62   010D
        MVI@    R5,     R0                      ; 5C63   02A8
        MVO@    R0,     R5                      ; 5C64   0268
        SUBR    R1,     R5                      ; 5C65   010D
        MVI@    R5,     R0                      ; 5C66   02A8
        MVO@    R0,     R5                      ; 5C67   0268
        SUBR    R1,     R5                      ; 5C68   010D
        MVI@    R5,     R0                      ; 5C69   02A8
        MVO@    R0,     R5                      ; 5C6A   0268
        SUBR    R1,     R5                      ; 5C6B   010D
        MVI@    R5,     R0                      ; 5C6C   02A8
        MVO@    R0,     R5                      ; 5C6D   0268
        SUBR    R1,     R5                      ; 5C6E   010D
        MVI@    R5,     R0                      ; 5C6F   02A8
        MVO@    R0,     R5                      ; 5C70   0268
        SUBR    R1,     R5                      ; 5C71   010D
        MVI@    R5,     R0                      ; 5C72   02A8
        MVO@    R0,     R5                      ; 5C73   0268
        SUBR    R1,     R5                      ; 5C74   010D
        MVI@    R5,     R0                      ; 5C75   02A8
        MVO@    R0,     R5                      ; 5C76   0268
        SUBR    R1,     R5                      ; 5C77   010D
        NEGR    R3                              ; 5C78   0023
        TSTR    R3                              ; 5C79   009B
        BMI     L_5C5A                          ; 5C7A   022B 0021

        ADDI    #$0028, R5                      ; 5C7C   02FD 0028
        CMPI    #$02F0, R5                      ; 5C7E   037D 02F0
        BLT     L_5C58                          ; 5C80   0225 0029

        INCR    R2                              ; 5C82   000A
L_5C83:
        PULR    R7                              ; 5C83   02B7
L_5C84:
        PSHR    R5                              ; 5C84   0275
        MVI     G_013D, R0                      ; 5C85   0280 013D
        SWAP    R0,     2                       ; 5C87   0044
        BEQ     L_5CF6                          ; 5C88   0204 006C
        BMI     L_5CDE                          ; 5C8A   020B 0052

        CLRR    R1                              ; 5C8C   01C9
        INCR    R7                              ; 5C8D   000F
        PSHR    R5                              ; 5C8E   0275
        MVII    #$0214, R5                      ; 5C8F   02BD 0214
        MVII    #$0001, R3                      ; 5C91   02BB 0001
L_5C93:
        MVII    #$0200, R4                      ; 5C93   02BC 0200
        TSTR    R3                              ; 5C95   009B
        BMI     L_5C9A                          ; 5C96   020B 0002

        ADDI    #$00DC, R4                      ; 5C98   02FC 00DC
L_5C9A:
        MVII    #$0001, R2                      ; 5C9A   02BA 0001
L_5C9C:
        MVI@    R5,     R0                      ; 5C9C   02A8
        MVO@    R0,     R4                      ; 5C9D   0260
        MVI@    R5,     R0                      ; 5C9E   02A8
        MVO@    R0,     R4                      ; 5C9F   0260
        MVI@    R5,     R0                      ; 5CA0   02A8
        MVO@    R0,     R4                      ; 5CA1   0260
        MVI@    R5,     R0                      ; 5CA2   02A8
        MVO@    R0,     R4                      ; 5CA3   0260
        MVI@    R5,     R0                      ; 5CA4   02A8
        MVO@    R0,     R4                      ; 5CA5   0260
        MVI@    R5,     R0                      ; 5CA6   02A8
        MVO@    R0,     R4                      ; 5CA7   0260
        MVI@    R5,     R0                      ; 5CA8   02A8
        MVO@    R0,     R4                      ; 5CA9   0260
        MVI@    R5,     R0                      ; 5CAA   02A8
        MVO@    R0,     R4                      ; 5CAB   0260
L_5CAC:
        MVI@    R5,     R0                      ; 5CAC   02A8
        MVO@    R0,     R4                      ; 5CAD   0260
        MVI@    R5,     R0                      ; 5CAE   02A8
        MVO@    R0,     R4                      ; 5CAF   0260
        NEGR    R2                              ; 5CB0   0022
        TSTR    R2                              ; 5CB1   0092
        BMI     L_5C9C                          ; 5CB2   022B 0017

        SUBI    #$0014, R5                      ; 5CB4   033D 0014
        MVII    #$0200, R4                      ; 5CB6   02BC 0200
        SUBR    R1,     R4                      ; 5CB8   010C
        TSTR    R3                              ; 5CB9   009B
        BPL     L_5CBE                          ; 5CBA   0203 0002

        ADDI    #$00DC, R4                      ; 5CBC   02FC 00DC
L_5CBE:
        MVI@    R4,     R0                      ; 5CBE   02A0
        MVO@    R0,     R5                      ; 5CBF   0268
        MVI@    R4,     R0                      ; 5CC0   02A0
        MVO@    R0,     R5                      ; 5CC1   0268
        MVI@    R4,     R0                      ; 5CC2   02A0
        MVO@    R0,     R5                      ; 5CC3   0268
        MVI@    R4,     R0                      ; 5CC4   02A0
        MVO@    R0,     R5                      ; 5CC5   0268
        MVI@    R4,     R0                      ; 5CC6   02A0
        MVO@    R0,     R5                      ; 5CC7   0268
        MVI@    R4,     R0                      ; 5CC8   02A0
        MVO@    R0,     R5                      ; 5CC9   0268
        MVI@    R4,     R0                      ; 5CCA   02A0
        MVO@    R0,     R5                      ; 5CCB   0268
        MVI@    R4,     R0                      ; 5CCC   02A0
        MVO@    R0,     R5                      ; 5CCD   0268
        MVI@    R4,     R0                      ; 5CCE   02A0
        MVO@    R0,     R5                      ; 5CCF   0268
        MVI@    R4,     R0                      ; 5CD0   02A0
        MVO@    R0,     R5                      ; 5CD1   0268
        NEGR    R2                              ; 5CD2   0022
        TSTR    R2                              ; 5CD3   0092
        BMI     L_5CBE                          ; 5CD4   022B 0017

        NEGR    R3                              ; 5CD6   0023
        CMPI    #$02EF, R5                      ; 5CD7   037D 02EF
        BLT     L_5C93                          ; 5CD9   0225 0047

        MVII    #$0003, R2                      ; 5CDB   02BA 0003
        PULR    R7                              ; 5CDD   02B7
L_5CDE:
        MVII    #$0214, R4                      ; 5CDE   02BC 0214
        INCR    R7                              ; 5CE0   000F
        PSHR    R5                              ; 5CE1   0275
        MVII    #$0200, R5                      ; 5CE2   02BD 0200
L_5CE4:
        MVI@    R4,     R0                      ; 5CE4   02A0
        MVO@    R0,     R5                      ; 5CE5   0268
        MVI@    R4,     R0                      ; 5CE6   02A0
        MVO@    R0,     R5                      ; 5CE7   0268
        MVI@    R4,     R0                      ; 5CE8   02A0
        MVO@    R0,     R5                      ; 5CE9   0268
        MVI@    R4,     R0                      ; 5CEA   02A0
        MVO@    R0,     R5                      ; 5CEB   0268
        MVI@    R4,     R0                      ; 5CEC   02A0
        MVO@    R0,     R5                      ; 5CED   0268
        MVI@    R4,     R0                      ; 5CEE   02A0
        MVO@    R0,     R5                      ; 5CEF   0268
        CMPI    #$02DC, R5                      ; 5CF0   037D 02DC
        BLT     L_5CE4                          ; 5CF2   0225 000F

        MVII    #$0002, R2                      ; 5CF4   02BA 0002
L_5CF6:
        PULR    R7                              ; 5CF6   02B7
L_5CF7:
        PSHR    R5                              ; 5CF7   0275
        MVII    #$0319, R2                      ; 5CF8   02BA 0319
L_5CFA:
        MVII    #$013E, R5                      ; 5CFA   02BD 013E
        MVI@    R2,     R0                      ; 5CFC   0290
        MOVR    R0,     R1                      ; 5CFD   0081
        SLL     R1,     1                       ; 5CFE   0049
        BPL     L_5D03                          ; 5CFF   0203 0002

        MVII    #$013C, R5                      ; 5D01   02BD 013C
L_5D03:
        MOVR    R0,     R1                      ; 5D03   0081
        ANDI    #$00FF, R1                      ; 5D04   03B9 00FF
        XORR    R1,     R0                      ; 5D06   01C8
        ADD@    R5,     R1                      ; 5D07   02E9
        ANDI    #$00FF, R1                      ; 5D08   03B9 00FF
        XORR    R1,     R0                      ; 5D0A   01C8
        MVO@    R0,     R2                      ; 5D0B   0250
        ADDI    #$0008, R2                      ; 5D0C   02FA 0008
        MVI@    R2,     R0                      ; 5D0E   0290
        MOVR    R0,     R1                      ; 5D0F   0081
        ANDI    #$007F, R1                      ; 5D10   03B9 007F
        XORR    R1,     R0                      ; 5D12   01C8
        ADD@    R5,     R1                      ; 5D13   02E9
        ANDI    #$007F, R1                      ; 5D14   03B9 007F
        XORR    R1,     R0                      ; 5D16   01C8
        MVO@    R0,     R2                      ; 5D17   0250
        SUBI    #$0007, R2                      ; 5D18   033A 0007
        CMPI    #$0321, R2                      ; 5D1A   037A 0321
        BLT     L_5CFA                          ; 5D1C   0225 0023

        MVI     G_0319, R0                      ; 5D1E   0280 0319
        ANDI    #$00FF, R0                      ; 5D20   03B8 00FF
        MVO     R0,     G_0112                  ; 5D22   0240 0112
        MVI     G_0321, R0                      ; 5D24   0280 0321
        ANDI    #$007F, R0                      ; 5D26   03B8 007F
        MVO     R0,     G_0114                  ; 5D28   0240 0114
        PULR    R7                              ; 5D2A   02B7
L_5D2B:
        PSHR    R5                              ; 5D2B   0275
        SDBD                                    ; 5D2C   0001
        MVII    #$643E, R4                      ; 5D2D   02BC 003E 0064
        MVII    #$00F0, R2                      ; 5D30   02BA 00F0
        MVI     G_011F, R1                      ; 5D32   0281 011F
        SUBI    #$0003, R1                      ; 5D34   0339 0003
        SUBR    R1,     R7                      ; 5D36   010F
        ADDR    R2,     R4                      ; 5D37   00D4
        ADDR    R2,     R4                      ; 5D38   00D4
        ADDR    R2,     R4                      ; 5D39   00D4
        MVII    #$0200, R5                      ; 5D3A   02BD 0200
        MVII    #$0013, R1                      ; 5D3C   02B9 0013
        MVII    #$0349, R3                      ; 5D3E   02BB 0349
        TSTR    R0                              ; 5D40   0080
        BNEQ    L_5D48                          ; 5D41   020C 0005

        ADDR    R1,     R5                      ; 5D43   00CD
        ADD     G_011E, R4                      ; 5D44   02C4 011E
        B       L_5D4B                          ; 5D46   0200 0003

L_5D48:
        ADDR    R1,     R4                      ; 5D48   00CC
        SUB     G_011E, R4                      ; 5D49   0304 011E
L_5D4B:
        CLRR    R0                              ; 5D4B   01C0
L_5D4C:
        MVO     R0,     G_011A                  ; 5D4C   0240 011A
        MVI@    R4,     R0                      ; 5D4E   02A0
        MOVR    R0,     R2                      ; 5D4F   0082
        SWAP    R2,     1                       ; 5D50   0042
        ANDI    #$0003, R2                      ; 5D51   03BA 0003
        ADDR    R3,     R2                      ; 5D53   00DA
        ANDI    #$00FF, R0                      ; 5D54   03B8 00FF
        ADD@    R2,     R0                      ; 5D56   02D0
        MVO@    R0,     R5                      ; 5D57   0268
        ADDR    R1,     R4                      ; 5D58   00CC
        ADDR    R1,     R5                      ; 5D59   00CD
        MVI@    R4,     R0                      ; 5D5A   02A0
        MOVR    R0,     R2                      ; 5D5B   0082
        SWAP    R2,     1                       ; 5D5C   0042
        ANDI    #$0003, R2                      ; 5D5D   03BA 0003
        ADDR    R3,     R2                      ; 5D5F   00DA
        ANDI    #$00FF, R0                      ; 5D60   03B8 00FF
        ADD@    R2,     R0                      ; 5D62   02D0
        MVO@    R0,     R5                      ; 5D63   0268
        ADDR    R1,     R4                      ; 5D64   00CC
        ADDR    R1,     R5                      ; 5D65   00CD
        MVI     G_011A, R0                      ; 5D66   0280 011A
        INCR    R0                              ; 5D68   0008
        CMPI    #$0006, R0                      ; 5D69   0378 0006
        BLE     L_5D4C                          ; 5D6B   0226 0020

        PULR    R7                              ; 5D6D   02B7
L_5D6E:
        PSHR    R5                              ; 5D6E   0275
        SDBD                                    ; 5D6F   0001
        MVII    #$643E, R4                      ; 5D70   02BC 003E 0064
        MVII    #$00F0, R2                      ; 5D73   02BA 00F0
        MVI     G_011F, R1                      ; 5D75   0281 011F
        SUBI    #$0008, R1                      ; 5D77   0339 0008
        SUBR    R1,     R7                      ; 5D79   010F
        ADDR    R2,     R4                      ; 5D7A   00D4
        ADDR    R2,     R4                      ; 5D7B   00D4
        ADDR    R2,     R4                      ; 5D7C   00D4
        ADDR    R2,     R4                      ; 5D7D   00D4
        ADDR    R2,     R4                      ; 5D7E   00D4
        ADDR    R2,     R4                      ; 5D7F   00D4
        ADDR    R2,     R4                      ; 5D80   00D4
        ADDR    R2,     R4                      ; 5D81   00D4

        JSR     R5,     L_5D91                  ; 5D82   0004 015C 0191
        DECLE   $0000                           ; 5D85   0000

        DECR    R4                              ; 5D86   0014
        ADCR    R0                              ; 5D87   0028
        RSWD    R4                              ; 5D88   003C
        RLC     R0,     1                       ; 5D89   0050
        SLR     R0,     2                       ; 5D8A   0064
        SARC    R0,     1                       ; 5D8B   0078
        MOVR    R1,     R4                      ; 5D8C   008C
        MOVR    R4,     R0                      ; 5D8D   00A0
        MOVR    R6,     R4                      ; 5D8E   00B4
        ADDR    R1,     R0                      ; 5D8F   00C8
        ADDR    R3,     R4                      ; 5D90   00DC
L_5D91:
        ADD     G_011E, R5                      ; 5D91   02C5 011E
        MVI@    R5,     R1                      ; 5D93   02A9
        MVII    #$02DC, R5                      ; 5D94   02BD 02DC
        TSTR    R0                              ; 5D96   0080
        BEQ     L_5D9E                          ; 5D97   0204 0005

        SUBI    #$00DC, R5                      ; 5D99   033D 00DC
        ADDI    #$00DC, R4                      ; 5D9B   02FC 00DC
        NEGR    R1                              ; 5D9D   0021
L_5D9E:
        ADDR    R1,     R4                      ; 5D9E   00CC
        MVII    #$0349, R3                      ; 5D9F   02BB 0349
        MVII    #$00FF, R1                      ; 5DA1   02B9 00FF
        CLRR    R0                              ; 5DA3   01C0
L_5DA4:
        MVO     R0,     G_011A                  ; 5DA4   0240 011A
        MVI@    R4,     R0                      ; 5DA6   02A0
        MOVR    R0,     R2                      ; 5DA7   0082
        SWAP    R2,     1                       ; 5DA8   0042
        ANDI    #$0003, R2                      ; 5DA9   03BA 0003
        ADDR    R3,     R2                      ; 5DAB   00DA
        ANDR    R1,     R0                      ; 5DAC   0188
        ADD@    R2,     R0                      ; 5DAD   02D0
        MVO@    R0,     R5                      ; 5DAE   0268
        MVI@    R4,     R0                      ; 5DAF   02A0
        MOVR    R0,     R2                      ; 5DB0   0082
        SWAP    R2,     1                       ; 5DB1   0042
        ANDI    #$0003, R2                      ; 5DB2   03BA 0003
        ADDR    R3,     R2                      ; 5DB4   00DA
        ANDR    R1,     R0                      ; 5DB5   0188
        ADD@    R2,     R0                      ; 5DB6   02D0
        MVO@    R0,     R5                      ; 5DB7   0268
        MVI@    R4,     R0                      ; 5DB8   02A0
        MOVR    R0,     R2                      ; 5DB9   0082
        SWAP    R2,     1                       ; 5DBA   0042
        ANDI    #$0003, R2                      ; 5DBB   03BA 0003
        ADDR    R3,     R2                      ; 5DBD   00DA
        ANDR    R1,     R0                      ; 5DBE   0188
        ADD@    R2,     R0                      ; 5DBF   02D0
        MVO@    R0,     R5                      ; 5DC0   0268
        MVI@    R4,     R0                      ; 5DC1   02A0
        MOVR    R0,     R2                      ; 5DC2   0082
        SWAP    R2,     1                       ; 5DC3   0042
        ANDI    #$0003, R2                      ; 5DC4   03BA 0003
        ADDR    R3,     R2                      ; 5DC6   00DA
        ANDR    R1,     R0                      ; 5DC7   0188
        ADD@    R2,     R0                      ; 5DC8   02D0
        MVO@    R0,     R5                      ; 5DC9   0268
        MVI@    R4,     R0                      ; 5DCA   02A0
        MOVR    R0,     R2                      ; 5DCB   0082
        SWAP    R2,     1                       ; 5DCC   0042
        ANDI    #$0003, R2                      ; 5DCD   03BA 0003
        ADDR    R3,     R2                      ; 5DCF   00DA
        ANDR    R1,     R0                      ; 5DD0   0188
        ADD@    R2,     R0                      ; 5DD1   02D0
        MVO@    R0,     R5                      ; 5DD2   0268
        MVI@    R4,     R0                      ; 5DD3   02A0
        MOVR    R0,     R2                      ; 5DD4   0082
        SWAP    R2,     1                       ; 5DD5   0042
        ANDI    #$0003, R2                      ; 5DD6   03BA 0003
        ADDR    R3,     R2                      ; 5DD8   00DA
        ANDR    R1,     R0                      ; 5DD9   0188
        ADD@    R2,     R0                      ; 5DDA   02D0
        MVO@    R0,     R5                      ; 5DDB   0268
        MVI@    R4,     R0                      ; 5DDC   02A0
        MOVR    R0,     R2                      ; 5DDD   0082
        SWAP    R2,     1                       ; 5DDE   0042
        ANDI    #$0003, R2                      ; 5DDF   03BA 0003
        ADDR    R3,     R2                      ; 5DE1   00DA
        ANDR    R1,     R0                      ; 5DE2   0188
        ADD@    R2,     R0                      ; 5DE3   02D0
        MVO@    R0,     R5                      ; 5DE4   0268
        MVI@    R4,     R0                      ; 5DE5   02A0
        MOVR    R0,     R2                      ; 5DE6   0082
        SWAP    R2,     1                       ; 5DE7   0042
        ANDI    #$0003, R2                      ; 5DE8   03BA 0003
        ADDR    R3,     R2                      ; 5DEA   00DA
        ANDR    R1,     R0                      ; 5DEB   0188
        ADD@    R2,     R0                      ; 5DEC   02D0
        MVO@    R0,     R5                      ; 5DED   0268
        MVI@    R4,     R0                      ; 5DEE   02A0
        MOVR    R0,     R2                      ; 5DEF   0082
        SWAP    R2,     1                       ; 5DF0   0042
        ANDI    #$0003, R2                      ; 5DF1   03BA 0003
        ADDR    R3,     R2                      ; 5DF3   00DA
        ANDR    R1,     R0                      ; 5DF4   0188
        ADD@    R2,     R0                      ; 5DF5   02D0
        MVO@    R0,     R5                      ; 5DF6   0268
        MVI@    R4,     R0                      ; 5DF7   02A0
        MOVR    R0,     R2                      ; 5DF8   0082
        SWAP    R2,     1                       ; 5DF9   0042
        ANDI    #$0003, R2                      ; 5DFA   03BA 0003
        ADDR    R3,     R2                      ; 5DFC   00DA
        ANDR    R1,     R0                      ; 5DFD   0188
        ADD@    R2,     R0                      ; 5DFE   02D0
        MVO@    R0,     R5                      ; 5DFF   0268
        MVI     G_011A, R0                      ; 5E00   0280 011A
        INCR    R0                              ; 5E02   0008
        CMPI    #$0001, R0                      ; 5E03   0378 0001
        BLE     L_5DA4                          ; 5E05   0226 0062

        PULR    R7                              ; 5E07   02B7

L_5E08:
        JSR     R5,     L_5AAB                  ; 5E08   0004 0158 02AB

        CLRR    R0                              ; 5E0B   01C0
        MVO     R0,     .STIC.EDGE              ; 5E0C   0240 0032
        MVO     R0,     .STIC.VIDEN             ; 5E0E   0240 0020
        MVO     R0,     G_0138                  ; 5E10   0240 0138
        MVO     R0,     G_013A                  ; 5E12   0240 013A
        MVII    #$016D, R4                      ; 5E14   02BC 016D
L_5E16:
        MVO@    R0,     R4                      ; 5E16   0260
        CMPI    #$01C6, R4                      ; 5E17   037C 01C6
        BLE     L_5E16                          ; 5E19   0226 0004

        MOVR    R7,     R5                      ; 5E1B   00BD
        SDBD                                    ; 5E1C   0001
        ADDI    #$003A, R5                      ; 5E1D   02FD 003A 0000
        MVII    #$032B, R4                      ; 5E20   02BC 032B
L_5E22:
        SDBD                                    ; 5E22   0001
        MVI@    R5,     R1                      ; 5E23   02A9
        MVO@    R1,     R4                      ; 5E24   0261
        CMPI    #$0330, R4                      ; 5E25   037C 0330
        BLE     L_5E22                          ; 5E27   0226 0006

        MVII    #$0170, R4                      ; 5E29   02BC 0170
        MVI     G_011F, R1                      ; 5E2B   0281 011F
        SDBD                                    ; 5E2D   0001
        SUBI    #$000C, R5                      ; 5E2E   033D 000C 0000
L_5E31:
        SDBD                                    ; 5E31   0001
        ADDI    #$000C, R5                      ; 5E32   02FD 000C 0000
        DECR    R1                              ; 5E35   0011
        BPL     L_5E31                          ; 5E36   0223 0006

L_5E38:
        MVI@    R5,     R1                      ; 5E38   02A9
        MVI@    R5,     R2                      ; 5E39   02AA
        MVO@    R1,     R4                      ; 5E3A   0261
        INCR    R4                              ; 5E3B   000C
        MVO@    R2,     R4                      ; 5E3C   0262
        ADDI    #$000D, R4                      ; 5E3D   02FC 000D
        CMPI    #$01C4, R4                      ; 5E3F   037C 01C4
        BLE     L_5E38                          ; 5E41   0226 000A

        CLRR    R0                              ; 5E43   01C0
        MVII    #$0132, R4                      ; 5E44   02BC 0132
L_5E46:
        MVO@    R0,     R4                      ; 5E46   0260
        CMPI    #$0138, R4                      ; 5E47   037C 0138
        BLT     L_5E46                          ; 5E49   0225 0004

        MVI     G_011F, R0                      ; 5E4B   0280 011F
        INCR    R0                              ; 5E4D   0008
        CMPI    #$0005, R0                      ; 5E4E   0378 0005
        BLT     L_5E53                          ; 5E50   0205 0001

        CLRR    R0                              ; 5E52   01C0
L_5E53:
        MVO     R0,     G_011F                  ; 5E53   0240 011F
        PULR    R7                              ; 5E55   02B7
        NEGR    R1                              ; 5E56   0021
        INCR    R1                              ; 5E57   0009
        GSWD    R2                              ; 5E58   0032
        COMR    R1                              ; 5E59   0019
        SWAP    R3,     2                       ; 5E5A   0047
        COMR    R1                              ; 5E5B   0019
        RLC     R1,     1                       ; 5E5C   0051
        INCR    R1                              ; 5E5D   0009
        SLR     R2,     1                       ; 5E5E   0062
        COMR    R1                              ; 5E5F   0019
        RRC     R3,     2                       ; 5E60   0077
        COMR    R1                              ; 5E61   0019
        INCR    R2                              ; 5E62   000A
        INCR    R2                              ; 5E63   000A
        MOVR    R3,     R0                      ; 5E64   0098
        INCR    R2                              ; 5E65   000A
        INCR    R2                              ; 5E66   000A
        RLC     R2,     2                       ; 5E67   0056
        MOVR    R3,     R0                      ; 5E68   0098
        SLL     R2,     1                       ; 5E69   004A
        SLR     R0,     1                       ; 5E6A   0060
        ADCR    R2                              ; 5E6B   002A
        ADCR    R2                              ; 5E6C   002A
        SWAP    R2,     1                       ; 5E6D   0042
        INCR    R2                              ; 5E6E   000A
        INCR    R2                              ; 5E6F   000A
        MOVR    R3,     R0                      ; 5E70   0098
        INCR    R2                              ; 5E71   000A
        INCR    R2                              ; 5E72   000A
        RLC     R2,     2                       ; 5E73   0056
        MOVR    R3,     R0                      ; 5E74   0098
        RLC     R0,     2                       ; 5E75   0054
        SLR     R0,     1                       ; 5E76   0060
        ADCR    R2                              ; 5E77   002A
        SLLC    R0,     1                       ; 5E78   0058
        SLLC    R0,     1                       ; 5E79   0058
        INCR    R2                              ; 5E7A   000A
        DECR    R0                              ; 5E7B   0010
        MOVR    R3,     R0                      ; 5E7C   0098
        INCR    R2                              ; 5E7D   000A
        INCR    R2                              ; 5E7E   000A
        RLC     R2,     2                       ; 5E7F   0056
        MOVR    R3,     R0                      ; 5E80   0098
        SLL     R2,     1                       ; 5E81   004A
        SARC    R0,     1                       ; 5E82   0078
        GSWD    R0                              ; 5E83   0030
        ADCR    R2                              ; 5E84   002A
        GSWD    R0                              ; 5E85   0030
        INCR    R2                              ; 5E86   000A
        INCR    R2                              ; 5E87   000A
        MOVR    R3,     R0                      ; 5E88   0098
        INCR    R2                              ; 5E89   000A
        DECR    R0                              ; 5E8A   0010
        SWAP    R2,     1                       ; 5E8B   0042
        MOVR    R2,     R0                      ; 5E8C   0090
        RLC     R0,     2                       ; 5E8D   0054
        SLR     R0,     1                       ; 5E8E   0060
        GSWD    R0                              ; 5E8F   0030
        MOVR    R3,     R0                      ; 5E90   0098
        DECLE   $0036                           ; 5E91   0036

        GSWD    R0                              ; 5E92   0030
        INCR    R2                              ; 5E93   000A
        MOVR    R3,     R0                      ; 5E94   0098
        INCR    R2                              ; 5E95   000A
        NEGR    R0                              ; 5E96   0020
        GSWD    R0                              ; 5E97   0030
        MOVR    R1,     R0                      ; 5E98   0088
        RSWD    R0                              ; 5E99   0038
        SAR     R0,     1                       ; 5E9A   0068
        GSWD    R0                              ; 5E9B   0030
        SAR     R0,     1                       ; 5E9C   0068
        RLC     R2,     1                       ; 5E9D   0052
        DECLE   $0000                           ; 5E9E   0000

        INCR    R4                              ; 5E9F   000C
        COMR    R0                              ; 5EA0   0018
        DECLE   $0000                           ; 5EA1   0000

        INCR    R0                              ; 5EA2   0008

        JSR     R4,     .STIC.X.0               ; 5EA3   0004 0000 0000

        GSWD    R0                              ; 5EA6   0030
        NEGR    R0                              ; 5EA7   0020
        DECLE   $0000,  $0000,  $0000           ; 5EA8   0000 0000 0000

        INCR    R0                              ; 5EAB   0008
        ADCR    R4                              ; 5EAC   002C
        GSWD    R0                              ; 5EAD   0030
        INCR    R4                              ; 5EAE   000C
        COMR    R0                              ; 5EAF   0018
        DECLE   $0000                           ; 5EB0   0000

        INCR    R0                              ; 5EB1   0008

        JSR     R4,     .STIC.X.0               ; 5EB2   0004 0000 0000
        DECLE   $0000                           ; 5EB5   0000

        GSWD    R0                              ; 5EB6   0030
        NEGR    R0                              ; 5EB7   0020
        DECLE   $0000,  $0000                   ; 5EB8   0000 0000

        INCR    R4                              ; 5EBA   000C
        MOVR    R1,     R0                      ; 5EBB   0088
        MOVR    R1,     R0                      ; 5EBC   0088
        ADDR    R0,     R0                      ; 5EBD   00C0
        INCR    R4                              ; 5EBE   000C
        COMR    R0                              ; 5EBF   0018
        DECLE   $0000                           ; 5EC0   0000

        INCR    R0                              ; 5EC1   0008

        JSR     R4,     .STIC.X.0               ; 5EC2   0004 0000 0000
        DECLE   $0000                           ; 5EC5   0000

        GSWD    R0                              ; 5EC6   0030
        NEGR    R0                              ; 5EC7   0020
        DECLE   $0000                           ; 5EC8   0000

        CLRC                                    ; 5EC9   0006

        JSR     R4,     G_8480                  ; 5ECA   0004 0084 0080
        DECLE   $0000                           ; 5ECD   0000

        CLRC                                    ; 5ECE   0006
        INCR    R4                              ; 5ECF   000C
        DECLE   $0000                           ; 5ED0   0000

        JSRD    R4,     .STIC.X.0               ; 5ED1   0004 0002 0000
        DECLE   $0000,  $0000                   ; 5ED4   0000 0000

        COMR    R0                              ; 5ED6   0018
        DECR    R0                              ; 5ED7   0010
        DECLE   $0000                           ; 5ED8   0000

        SWAP    R0,     1                       ; 5ED9   0040
        SWAP    R3,     1                       ; 5EDA   0043
        SWAP    R2,     1                       ; 5EDB   0042
        EIS                                     ; 5EDC   0002
        DECLE   $0000,  $0000                   ; 5EDD   0000 0000

        CLRC                                    ; 5EDF   0006
        INCR    R4                              ; 5EE0   000C
        DECLE   $0000                           ; 5EE1   0000

        JSRD    R4,     .STIC.X.0               ; 5EE2   0004 0002 0000
        DECLE   $0000                           ; 5EE5   0000

        COMR    R0                              ; 5EE6   0018
        DECR    R0                              ; 5EE7   0010
        DECLE   $0000,  $0000                   ; 5EE8   0000 0000

        NEGR    R0                              ; 5EEA   0020
        DECLE   $0036                           ; 5EEB   0036

        EIS                                     ; 5EEC   0002
        DIS                                     ; 5EED   0003
L_5EEE:
        DECLE   $0000                           ; 5EEE   0000

        CLRC                                    ; 5EEF   0006
        INCR    R4                              ; 5EF0   000C
        DECLE   $0000                           ; 5EF1   0000

        JSRD    R4,     .STIC.X.0               ; 5EF2   0004 0002 0000
        DECLE   $0000                           ; 5EF5   0000

        COMR    R0                              ; 5EF6   0018
        DECR    R0                              ; 5EF7   0010
        DECLE   $0000,  $0000,  $0000           ; 5EF8   0000 0000 0000

        DECR    R0                              ; 5EFB   0010
        COMR    R0                              ; 5EFC   0018
        COMR    R4                              ; 5EFD   001C
        COMR    R0                              ; 5EFE   0018
        GSWD    R0                              ; 5EFF   0030
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F00   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5F04   0000 0000

        GSWD    R0                              ; 5F06   0030
        NEGR    R0                              ; 5F07   0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F08   0000 0000 0000 0000

        GSWD    R0                              ; 5F0C   0030
        RSWD    R0                              ; 5F0D   0038
        GSWD    R0                              ; 5F0E   0030
        SLR     R0,     1                       ; 5F0F   0060
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F10   0000 0000 0000 0000
        DECLE   $0000                           ; 5F14   0000

        SLR     R0,     1                       ; 5F15   0060
        SWAP    R0,     1                       ; 5F16   0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F17   0000 0000 0000 0000
        DECLE   $0000                           ; 5F1B   0000

        MOVR    R2,     R0                      ; 5F1C   0090
        ADDR    R3,     R0                      ; 5F1D   00D8
        COMR    R0                              ; 5F1E   0018
        GSWD    R0                              ; 5F1F   0030
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F20   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5F24   0000 0000

        GSWD    R0                              ; 5F26   0030
        NEGR    R0                              ; 5F27   0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F28   0000 0000 0000 0000

        GSWD    R0                              ; 5F2C   0030
        RSWD    R0                              ; 5F2D   0038
        DECLE   $0000,  $0000                   ; 5F2E   0000 0000

        JSR     R4,     G_0818                  ; 5F30   0004 0008 0018

        RSWD    R4                              ; 5F33   003C
        RSWD    R4                              ; 5F34   003C
        COMR    R0                              ; 5F35   0018
        NEGR    R0                              ; 5F36   0020
        RSWD    R0                              ; 5F37   0038
        COMR    R4                              ; 5F38   001C
        DECR    R2                              ; 5F39   0012
        DECLE   $0036                           ; 5F3A   0036

        NEGR    R0                              ; 5F3B   0020
        DECLE   $0000,  $0000,  $0000           ; 5F3C   0000 0000 0000

        JSR     R4,     G_0838                  ; 5F3F   0004 0008 0038

        SARC    R0,     2                       ; 5F42   007C
        SLLC    R0,     2                       ; 5F43   005C
        DECLE   $0036                           ; 5F44   0036

        DECR    R0                              ; 5F45   0010
        DECLE   $0000                           ; 5F46   0000

        COMR    R6                              ; 5F47   001E
        DECLE   $0036                           ; 5F48   0036

        SLR     R2,     1                       ; 5F49   0062
        SLR     R0,     1                       ; 5F4A   0060
        SWAP    R0,     1                       ; 5F4B   0040
        DECLE   $0000,  $0000,  $0000           ; 5F4C   0000 0000 0000

        JSR     R4,     G_0838                  ; 5F4F   0004 0008 0038

        SARC    R0,     2                       ; 5F52   007C
        SLLC    R3,     2                       ; 5F53   005F
        RLC     R2,     2                       ; 5F54   0056
        DECR    R0                              ; 5F55   0010
        SETC                                    ; 5F56   0007
        INCR    R7                              ; 5F57   000F
        SLR     R2,     1                       ; 5F58   0062
        SLR     R0,     1                       ; 5F59   0060
        ADDR    R0,     R0                      ; 5F5A   00C0
        TSTR    R0                              ; 5F5B   0080
        DECLE   $0000,  $0000,  $0000           ; 5F5C   0000 0000 0000

        EIS                                     ; 5F5F   0002

        JSR     R4,     .EXEC.C3E               ; 5F60   0004 001C 003E

        ADCR    R6                              ; 5F63   002E
        COMR    R7                              ; 5F64   001F
        INCR    R0                              ; 5F65   0008
        SETC                                    ; 5F66   0007
        DECR    R7                              ; 5F67   0017
        GSWD    R1                              ; 5F68   0031
        GSWD    R3                              ; 5F69   0033
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F6A   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5F6E   0000 0000

        EIS                                     ; 5F70   0002

        JSR     R4,     G_0C1E                  ; 5F71   0004 000C 001E

        COMR    R6                              ; 5F74   001E
        INCR    R6                              ; 5F75   000E
        DECLE   $0000                           ; 5F76   0000

        COMR    R4                              ; 5F77   001C
        INCR    R6                              ; 5F78   000E
        INCR    R6                              ; 5F79   000E
        COMR    R2                              ; 5F7A   001A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F7B   0000 0000 0000 0000
        DECLE   $0000                           ; 5F7F   0000

        EIS                                     ; 5F80   0002

        JSR     R4,     G_0C0E                  ; 5F81   0004 000C 000E

        INCR    R6                              ; 5F84   000E
L_5F85:
        INCR    R4                              ; 5F85   000C
        DECLE   $0000                           ; 5F86   0000

        INCR    R4                              ; 5F87   000C
        INCR    R4                              ; 5F88   000C
        INCR    R4                              ; 5F89   000C
        INCR    R4                              ; 5F8A   000C
        INCR    R4                              ; 5F8B   000C
        DECLE   $0000,  $0000                   ; 5F8C   0000 0000

        COMR    R0                              ; 5F8E   0018
        RSWD    R0                              ; 5F8F   0038
        DECR    R0                              ; 5F90   0010
        RSWD    R6                              ; 5F91   003E
        RSWD    R6                              ; 5F92   003E
        RSWD    R4                              ; 5F93   003C
        RSWD    R0                              ; 5F94   0038
        DECR    R0                              ; 5F95   0010
        GSWD    R0                              ; 5F96   0030
        GSWD    R0                              ; 5F97   0030
        COMR    R0                              ; 5F98   0018
        COMR    R0                              ; 5F99   0018
        RSWD    R0                              ; 5F9A   0038
        GSWD    R0                              ; 5F9B   0030
        GSWD    R0                              ; 5F9C   0030
        RSWD    R0                              ; 5F9D   0038
        GSWD    R0                              ; 5F9E   0030
        RRC     R0,     1                       ; 5F9F   0070
        RSWD    R4                              ; 5FA0   003C
        SARC    R3,     2                       ; 5FA1   007F
        RRC     R3,     1                       ; 5FA2   0073
        RRC     R0,     1                       ; 5FA3   0070
        SLR     R0,     1                       ; 5FA4   0060
        SLR     R0,     1                       ; 5FA5   0060
        SLR     R0,     1                       ; 5FA6   0060
        RRC     R0,     1                       ; 5FA7   0070
        GSWD    R0                              ; 5FA8   0030
        GSWD    R0                              ; 5FA9   0030
        RRC     R0,     1                       ; 5FAA   0070
        ADDR    R2,     R0                      ; 5FAB   00D0
        MOVR    R2,     R0                      ; 5FAC   0090
        ADDR    R3,     R0                      ; 5FAD   00D8
        COMR    R0                              ; 5FAE   0018
        RSWD    R0                              ; 5FAF   0038
        DECR    R0                              ; 5FB0   0010
        COMR    R6                              ; 5FB1   001E
        RSWD    R6                              ; 5FB2   003E
        RSWD    R4                              ; 5FB3   003C
        RSWD    R0                              ; 5FB4   0038
        DECR    R0                              ; 5FB5   0010
        GSWD    R0                              ; 5FB6   0030
        GSWD    R0                              ; 5FB7   0030
        COMR    R0                              ; 5FB8   0018
        COMR    R0                              ; 5FB9   0018
        RSWD    R0                              ; 5FBA   0038
        GSWD    R0                              ; 5FBB   0030
        GSWD    R0                              ; 5FBC   0030
        RSWD    R0                              ; 5FBD   0038
        COMR    R0                              ; 5FBE   0018
        COMR    R4                              ; 5FBF   001C
        DECLE   $0000                           ; 5FC0   0000

        DECR    R4                              ; 5FC1   0014
        DECR    R4                              ; 5FC2   0014
        COMR    R4                              ; 5FC3   001C
        DECLE   $0000,  $0000                   ; 5FC4   0000 0000

        RSWD    R0                              ; 5FC6   0038
        DECR    R0                              ; 5FC7   0010
        DECLE   $0000,  $0000                   ; 5FC8   0000 0000

        SWAP    R0,     1                       ; 5FCA   0040
        ADDR    R1,     R0                      ; 5FCB   00C8
        INCR    R4                              ; 5FCC   000C
        DECLE   $0000                           ; 5FCD   0000

        GSWD    R0                              ; 5FCE   0030
        RSWD    R0                              ; 5FCF   0038
        DECLE   $0000                           ; 5FD0   0000

        ADCR    R0                              ; 5FD1   0028
        ADCR    R0                              ; 5FD2   0028
        RSWD    R0                              ; 5FD3   0038
        DECLE   $0000,  $0000                   ; 5FD4   0000 0000

        RSWD    R0                              ; 5FD6   0038
        DECR    R0                              ; 5FD7   0010
        DECLE   $0000,  $0000                   ; 5FD8   0000 0000

        INCR    R0                              ; 5FDA   0008
        INCR    R4                              ; 5FDB   000C
        SWAP    R0,     1                       ; 5FDC   0040
        ADDR    R0,     R0                      ; 5FDD   00C0
        GSWD    R0                              ; 5FDE   0030
        RSWD    R0                              ; 5FDF   0038
        DECLE   $0000                           ; 5FE0   0000

        ADCR    R0                              ; 5FE1   0028
        ADCR    R0                              ; 5FE2   0028
        RSWD    R0                              ; 5FE3   0038
        DECLE   $0000,  $0000                   ; 5FE4   0000 0000

        GSWD    R0                              ; 5FE6   0030
        DECR    R0                              ; 5FE7   0010
        INCR    R0                              ; 5FE8   0008
        INCR    R4                              ; 5FE9   000C
        DECLE   $0000,  $0000                   ; 5FEA   0000 0000

        SWAP    R0,     1                       ; 5FEC   0040
        ADDR    R0,     R0                      ; 5FED   00C0
        GSWD    R0                              ; 5FEE   0030
        RSWD    R0                              ; 5FEF   0038
        DECLE   $0000                           ; 5FF0   0000

        ADCR    R0                              ; 5FF1   0028
        ADCR    R0                              ; 5FF2   0028
        RSWD    R0                              ; 5FF3   0038
        DECLE   $0000,  $0000                   ; 5FF4   0000 0000
L_5FF6:
        RSWD    R0                              ; 5FF6   0038
        DECR    R0                              ; 5FF7   0010
        DECLE   $0000,  $0000                   ; 5FF8   0000 0000

        INCR    R0                              ; 5FFA   0008
        SLL     R0,     2                       ; 5FFB   004C
        ADDR    R0,     R0                      ; 5FFC   00C0
        DECLE   $0000                           ; 5FFD   0000

        COMR    R0                              ; 5FFE   0018
        COMR    R4                              ; 5FFF   001C
        DECLE   $0000                           ; 6000   0000

        DECR    R4                              ; 6001   0014
        DECR    R4                              ; 6002   0014
        COMR    R4                              ; 6003   001C
        DECLE   $0000,  $0000                   ; 6004   0000 0000

        RSWD    R0                              ; 6006   0038
        DECR    R0                              ; 6007   0010
        DECLE   $0000,  $0000                   ; 6008   0000 0000

        SWAP    R0,     1                       ; 600A   0040
        ADDR    R0,     R0                      ; 600B   00C0
        INCR    R0                              ; 600C   0008
        INCR    R4                              ; 600D   000C
        COMR    R0                              ; 600E   0018
        COMR    R4                              ; 600F   001C
        DECLE   $0000                           ; 6010   0000

        DECR    R4                              ; 6011   0014
        DECR    R4                              ; 6012   0014
        COMR    R4                              ; 6013   001C
        DECLE   $0000,  $0000                   ; 6014   0000 0000

        COMR    R0                              ; 6016   0018
        DECR    R0                              ; 6017   0010
        SWAP    R0,     1                       ; 6018   0040
        ADDR    R0,     R0                      ; 6019   00C0
        DECLE   $0000,  $0000                   ; 601A   0000 0000

        INCR    R0                              ; 601C   0008
        INCR    R4                              ; 601D   000C
        DECLE   $0000,  $0000                   ; 601E   0000 0000

        INCR    R1                              ; 6020   0009
        RSWD    R7                              ; 6021   003F
        SARC    R3,     2                       ; 6022   007F
        ADDR    R7,     R6                      ; 6023   00FE
        COMR    R4                              ; 6024   001C
        INCR    R0                              ; 6025   0008
        DECLE   $0000                           ; 6026   0000

        ADCR    R0                              ; 6027   0028
        SAR     R0,     2                       ; 6028   006C
        SAR     R0,     2                       ; 6029   006C
        SWAP    R0,     2                       ; 602A   0044

        JSR     R4,     .STIC.X.0               ; 602B   0004 0000 0000
        DECLE   $0000,  $0000                   ; 602E   0000 0000

        MOVR    R2,     R0                      ; 6030   0090
        ADDR    R7,     R4                      ; 6031   00FC
        ADDR    R7,     R6                      ; 6032   00FE
        SARC    R3,     2                       ; 6033   007F
        RSWD    R0                              ; 6034   0038
        DECR    R0                              ; 6035   0010
        DECLE   $0000                           ; 6036   0000

        ADCR    R4                              ; 6037   002C
        SAR     R0,     2                       ; 6038   006C
        SLR     R0,     2                       ; 6039   0064
        SLR     R0,     1                       ; 603A   0060
        SWAP    R0,     1                       ; 603B   0040
        DECLE   $0000,  $0000                   ; 603C   0000 0000

        TSTR    R0                              ; 603E   0080
        TSTR    R0                              ; 603F   0080
        ADDR    R2,     R0                      ; 6040   00D0
        ADDR    R7,     R4                      ; 6041   00FC
        SARC    R2,     2                       ; 6042   007E
        RSWD    R6                              ; 6043   003E
        RSWD    R0                              ; 6044   0038
        DECR    R0                              ; 6045   0010
        INCR    R0                              ; 6046   0008
        ADCR    R4                              ; 6047   002C
        SLR     R0,     2                       ; 6048   0064
        SLR     R0,     1                       ; 6049   0060
        SLR     R0,     1                       ; 604A   0060
        SWAP    R0,     1                       ; 604B   0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 604C   0000 0000 0000 0000

        MOVR    R2,     R0                      ; 6050   0090
        ADDR    R7,     R4                      ; 6051   00FC
        ADDR    R7,     R4                      ; 6052   00FC
        SARC    R0,     2                       ; 6053   007C
        RSWD    R0                              ; 6054   0038
        DECR    R0                              ; 6055   0010
        DECLE   $0000                           ; 6056   0000

        ADCR    R4                              ; 6057   002C
        SAR     R0,     2                       ; 6058   006C
        SLR     R0,     2                       ; 6059   0064
        SWAP    R0,     1                       ; 605A   0040
        SWAP    R0,     1                       ; 605B   0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 605C   0000 0000 0000 0000

        INCR    R1                              ; 6060   0009
        RSWD    R7                              ; 6061   003F
        SARC    R3,     2                       ; 6062   007F
        SARC    R2,     2                       ; 6063   007E
        ADDR    R3,     R4                      ; 6064   00DC
        INCR    R0                              ; 6065   0008
        DECLE   $0000                           ; 6066   0000

        ADCR    R0                              ; 6067   0028
        SAR     R0,     2                       ; 6068   006C
        SAR     R0,     2                       ; 6069   006C
        SLL     R0,     2                       ; 606A   004C

        JSR     R4,     .STIC.X.0               ; 606B   0004 0000 0000
        DECLE   $0001,  $0001                   ; 606E   0001 0001

        INCR    R3                              ; 6070   000B
        RSWD    R7                              ; 6071   003F
        SARC    R2,     2                       ; 6072   007E
        SARC    R2,     2                       ; 6073   007E
        SLLC    R0,     2                       ; 6074   005C
        INCR    R0                              ; 6075   0008
        NEGR    R0                              ; 6076   0020
        SAR     R0,     1                       ; 6077   0068
        SLL     R0,     2                       ; 6078   004C
        INCR    R4                              ; 6079   000C
        INCR    R4                              ; 607A   000C

        JSR     R4,     .STIC.X.0               ; 607B   0004 0000 0000
        DECLE   $0000                           ; 607E   0000

        INCR    R0                              ; 607F   0008
        INCR    R4                              ; 6080   000C
        INCR    R6                              ; 6081   000E
        COMR    R6                              ; 6082   001E
        RSWD    R4                              ; 6083   003C
        RSWD    R4                              ; 6084   003C
        COMR    R0                              ; 6085   0018
        GSWD    R0                              ; 6086   0030
        RSWD    R0                              ; 6087   0038
        COMR    R0                              ; 6088   0018
        COMR    R0                              ; 6089   0018
        COMR    R0                              ; 608A   0018
        GSWD    R0                              ; 608B   0030
        GSWD    R0                              ; 608C   0030
        RSWD    R0                              ; 608D   0038
        DECLE   $0000                           ; 608E   0000

        INCR    R0                              ; 608F   0008
        INCR    R4                              ; 6090   000C
        INCR    R6                              ; 6091   000E
        COMR    R6                              ; 6092   001E
        RSWD    R4                              ; 6093   003C
        RSWD    R4                              ; 6094   003C
        RSWD    R0                              ; 6095   0038
        GSWD    R0                              ; 6096   0030
        RSWD    R0                              ; 6097   0038
        COMR    R4                              ; 6098   001C
        COMR    R4                              ; 6099   001C
        RSWD    R0                              ; 609A   0038
        SARC    R0,     1                       ; 609B   0078
        SLLC    R0,     2                       ; 609C   005C
        RRC     R0,     1                       ; 609D   0070
        INCR    R0                              ; 609E   0008
        INCR    R4                              ; 609F   000C
        INCR    R6                              ; 60A0   000E
        COMR    R6                              ; 60A1   001E
        RSWD    R4                              ; 60A2   003C
        SARC    R0,     2                       ; 60A3   007C
        SLLC    R2,     2                       ; 60A4   005E
        RSWD    R0                              ; 60A5   0038
        COMR    R6                              ; 60A6   001E
        RSWD    R6                              ; 60A7   003E
        DECLE   $0036                           ; 60A8   0036

        SAR     R0,     2                       ; 60A9   006C
        SAR     R0,     2                       ; 60AA   006C
        ADDR    R1,     R0                      ; 60AB   00C8
        TSTR    R0                              ; 60AC   0080
        ADDR    R0,     R0                      ; 60AD   00C0

        JSRD    R4,     G_0407                  ; 60AE   0004 0006 0007

        COMR    R7                              ; 60B1   001F
        RSWD    R6                              ; 60B2   003E
        ADCR    R7                              ; 60B3   002F
        INCR    R6                              ; 60B4   000E
        COMR    R6                              ; 60B5   001E
        COMR    R7                              ; 60B6   001F
        RSWD    R7                              ; 60B7   003F
        GSWD    R3                              ; 60B8   0033
        SLR     R2,     2                       ; 60B9   0066
        SLR     R0,     2                       ; 60BA   0064
        SWAP    R0,     1                       ; 60BB   0040
        SWAP    R0,     1                       ; 60BC   0040
        DECLE   $0000,  $0000                   ; 60BD   0000 0000

        JSRD    R4,     G_0407                  ; 60BF   0004 0006 0007

        INCR    R7                              ; 60C2   000F
        COMR    R6                              ; 60C3   001E
        DECR    R6                              ; 60C4   0016
        INCR    R7                              ; 60C5   000F
        INCR    R6                              ; 60C6   000E
        COMR    R6                              ; 60C7   001E
        RSWD    R3                              ; 60C8   003B
        NEGR    R3                              ; 60C9   0023
        NEGR    R3                              ; 60CA   0023
        CLRC                                    ; 60CB   0006
        SETC                                    ; 60CC   0007
        DECLE   $0000,  $0000                   ; 60CD   0000 0000

        JSRD    R4,     G_0407                  ; 60CF   0004 0006 0007

        INCR    R7                              ; 60D2   000F
        COMR    R6                              ; 60D3   001E
        COMR    R6                              ; 60D4   001E
        COMR    R6                              ; 60D5   001E
        INCR    R7                              ; 60D6   000F
        INCR    R6                              ; 60D7   000E
        CLRC                                    ; 60D8   0006
        INCR    R6                              ; 60D9   000E
        COMR    R4                              ; 60DA   001C
        COMR    R0                              ; 60DB   0018
        INCR    R4                              ; 60DC   000C
        INCR    R6                              ; 60DD   000E

        JSR     R4,     G_CCDC                  ; 60DE   0004 00CC 00DC

        SARC    R0,     2                       ; 60E1   007C
        RSWD    R4                              ; 60E2   003C
        COMR    R6                              ; 60E3   001E
        COMR    R6                              ; 60E4   001E
        COMR    R6                              ; 60E5   001E
        ADDR    R3,     R2                      ; 60E6   00DA
        ADDR    R4,     R0                      ; 60E7   00E0
        ADDR    R7,     R0                      ; 60E8   00F8
        ADDR    R3,     R4                      ; 60E9   00DC
        SLL     R0,     2                       ; 60EA   004C
        ADDR    R1,     R4                      ; 60EB   00CC

        JSRD    R4,     G_0404                  ; 60EC   0004 0006 0004

        INCR    R4                              ; 60EF   000C
        COMR    R4                              ; 60F0   001C
        ADDR    R3,     R4                      ; 60F1   00DC
        ADDR    R7,     R5                      ; 60F2   00FD
        SARC    R3,     2                       ; 60F3   007F
        RSWD    R7                              ; 60F4   003F
        COMR    R4                              ; 60F5   001C
        COMR    R0                              ; 60F6   0018
        SLR     R0,     1                       ; 60F7   0060
        ADDR    R7,     R0                      ; 60F8   00F8
        ADDR    R3,     R4                      ; 60F9   00DC
        ADDR    R1,     R4                      ; 60FA   00CC
        SWAP    R0,     2                       ; 60FB   0044
        ADDR    R0,     R6                      ; 60FC   00C6
        DECLE   $0000                           ; 60FD   0000

        INCR    R3                              ; 60FE   000B
        COMR    R3                              ; 60FF   001B
        RSWD    R6                              ; 6100   003E
        RSWD    R6                              ; 6101   003E
        COMR    R6                              ; 6102   001E
        RSWD    R4                              ; 6103   003C
        SARC    R0,     1                       ; 6104   0078
        SARC    R0,     1                       ; 6105   0078
        COMR    R3                              ; 6106   001B
        SETC                                    ; 6107   0007
        COMR    R7                              ; 6108   001F
        RSWD    R3                              ; 6109   003B
        GSWD    R2                              ; 610A   0032
        GSWD    R3                              ; 610B   0033
        NEGR    R0                              ; 610C   0020
        SLR     R0,     1                       ; 610D   0060
        INCR    R0                              ; 610E   0008
        COMR    R0                              ; 610F   0018
        RSWD    R3                              ; 6110   003B
        RSWD    R3                              ; 6111   003B
        COMR    R6                              ; 6112   001E
        SARC    R2,     2                       ; 6113   007E
        SARC    R0,     2                       ; 6114   007C
        RSWD    R0                              ; 6115   0038
        COMR    R0                              ; 6116   0018
        SETC                                    ; 6117   0007
        COMR    R7                              ; 6118   001F
        RSWD    R3                              ; 6119   003B
        GSWD    R3                              ; 611A   0033
        NEGR    R2                              ; 611B   0022
        SLR     R3,     1                       ; 611C   0063
        DECLE   $0000,  $0000                   ; 611D   0000 0000

        INCR    R0                              ; 611F   0008
        INCR    R4                              ; 6120   000C
        INCR    R6                              ; 6121   000E
        COMR    R6                              ; 6122   001E
        RSWD    R4                              ; 6123   003C
        RSWD    R4                              ; 6124   003C
        COMR    R0                              ; 6125   0018
        GSWD    R0                              ; 6126   0030
        RSWD    R0                              ; 6127   0038
        COMR    R4                              ; 6128   001C
        INCR    R6                              ; 6129   000E
        INCR    R4                              ; 612A   000C
        COMR    R0                              ; 612B   0018
        COMR    R4                              ; 612C   001C
        DECLE   $0000,  $0000,  $0000           ; 612D   0000 0000 0000

        DECR    R0                              ; 6130   0010
        COMR    R0                              ; 6131   0018
        COMR    R4                              ; 6132   001C
        COMR    R4                              ; 6133   001C
        RSWD    R0                              ; 6134   0038
        SARC    R2,     2                       ; 6135   007E
        SARC    R0,     2                       ; 6136   007C
        SLLC    R0,     1                       ; 6137   0058
        COMR    R4                              ; 6138   001C
        COMR    R6                              ; 6139   001E
        COMR    R3                              ; 613A   001B
        GSWD    R0                              ; 613B   0030
        RSWD    R0                              ; 613C   0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; 613D   0000 0000 0000 0000

        NEGR    R0                              ; 6141   0020
        GSWD    R0                              ; 6142   0030
        RSWD    R0                              ; 6143   0038
        RSWD    R0                              ; 6144   0038
        GSWD    R0                              ; 6145   0030
        RRC     R0,     1                       ; 6146   0070
        SARC    R0,     1                       ; 6147   0078
        ADDR    R7,     R6                      ; 6148   00FE
        ADDR    R7,     R4                      ; 6149   00FC
        ADDR    R3,     R6                      ; 614A   00DE
        MOVR    R3,     R7                      ; 614B   009F
L_614C:
        INCR    R4                              ; 614C   000C
        INCR    R7                              ; 614D   000F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 614E   0000 0000 0000 0000

        NEGR    R0                              ; 6152   0020
        GSWD    R0                              ; 6153   0030
        RSWD    R0                              ; 6154   0038
        RSWD    R0                              ; 6155   0038
        RRC     R0,     1                       ; 6156   0070
        RRC     R0,     1                       ; 6157   0070
        ADDR    R6,     R0                      ; 6158   00F0
        ADDR    R6,     R6                      ; 6159   00F6
        ADDR    R5,     R6                      ; 615A   00EE
        SARC    R2,     2                       ; 615B   007E
        SARC    R3,     1                       ; 615C   007B
        GSWD    R3                              ; 615D   0033
        DECLE   $0000,  $0000,  $0000,  $0000   ; 615E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6162   0000 0000 0000

        COMR    R0                              ; 6165   0018
        RSWD    R4                              ; 6166   003C
        RRC     R2,     2                       ; 6167   0076
        RRC     R2,     2                       ; 6168   0076
        SARC    R2,     2                       ; 6169   007E
        SARC    R2,     2                       ; 616A   007E
        SARC    R2,     2                       ; 616B   007E
        RSWD    R4                              ; 616C   003C
        COMR    R0                              ; 616D   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 616E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6172   0000 0000 0000

        COMR    R0                              ; 6175   0018
        RSWD    R4                              ; 6176   003C
        SARC    R2,     2                       ; 6177   007E
        SARC    R2,     2                       ; 6178   007E
        SARC    R2,     1                       ; 6179   007A
        SARC    R2,     1                       ; 617A   007A
        SARC    R2,     2                       ; 617B   007E
        RSWD    R4                              ; 617C   003C
        COMR    R0                              ; 617D   0018
        ADDR    R7,     R7                      ; 617E   00FF
        ADDR    R7,     R7                      ; 617F   00FF
        ADDR    R7,     R7                      ; 6180   00FF
        ADDR    R7,     R7                      ; 6181   00FF
        ADDR    R7,     R7                      ; 6182   00FF
        ADDR    R7,     R7                      ; 6183   00FF
        ADDR    R7,     R7                      ; 6184   00FF
        ADDR    R7,     R7                      ; 6185   00FF
        ADDR    R7,     R7                      ; 6186   00FF
        ADDR    R7,     R7                      ; 6187   00FF
        ADDR    R7,     R7                      ; 6188   00FF
        ADDR    R7,     R7                      ; 6189   00FF
        ADDR    R7,     R7                      ; 618A   00FF
        ADDR    R7,     R7                      ; 618B   00FF
        ADDR    R7,     R7                      ; 618C   00FF
        ADDR    R7,     R7                      ; 618D   00FF
        ADDR    R7,     R7                      ; 618E   00FF
        ADDR    R7,     R7                      ; 618F   00FF
        ADDR    R7,     R7                      ; 6190   00FF
        ADDR    R7,     R6                      ; 6191   00FE
        ADDR    R7,     R4                      ; 6192   00FC
        ADDR    R7,     R0                      ; 6193   00F8
        ADDR    R6,     R1                      ; 6194   00F1
        ADDR    R4,     R3                      ; 6195   00E3
        ADDR    R0,     R7                      ; 6196   00C7
        MOVR    R1,     R7                      ; 6197   008F
        COMR    R7                              ; 6198   001F
        RSWD    R7                              ; 6199   003F
        SARC    R3,     2                       ; 619A   007F
        ADDR    R7,     R7                      ; 619B   00FF
        ADDR    R7,     R7                      ; 619C   00FF
        ADDR    R7,     R7                      ; 619D   00FF
        ADDR    R7,     R7                      ; 619E   00FF
        ADDR    R7,     R7                      ; 619F   00FF
        ADDR    R7,     R6                      ; 61A0   00FE
        ADDR    R7,     R4                      ; 61A1   00FC
        ADDR    R7,     R0                      ; 61A2   00F8
        ADDR    R6,     R0                      ; 61A3   00F0
        ADDR    R4,     R0                      ; 61A4   00E0
        ADDR    R0,     R1                      ; 61A5   00C1
        MOVR    R0,     R3                      ; 61A6   0083
        SETC                                    ; 61A7   0007
        INCR    R7                              ; 61A8   000F
        COMR    R7                              ; 61A9   001F
        RSWD    R7                              ; 61AA   003F
        SARC    R3,     2                       ; 61AB   007F
        ADDR    R7,     R7                      ; 61AC   00FF
        ADDR    R7,     R7                      ; 61AD   00FF
        ADDR    R7,     R7                      ; 61AE   00FF
        ADDR    R7,     R6                      ; 61AF   00FE
        ADDR    R7,     R4                      ; 61B0   00FC
        ADDR    R7,     R0                      ; 61B1   00F8
        ADDR    R6,     R0                      ; 61B2   00F0
        ADDR    R4,     R0                      ; 61B3   00E0
        ADDR    R0,     R0                      ; 61B4   00C0
        TSTR    R0                              ; 61B5   0080
        DECLE   $0001                           ; 61B6   0001

        DIS                                     ; 61B7   0003
L_61B8:
        SETC                                    ; 61B8   0007
        INCR    R7                              ; 61B9   000F
        COMR    R7                              ; 61BA   001F
        RSWD    R7                              ; 61BB   003F
        SARC    R3,     2                       ; 61BC   007F
        ADDR    R7,     R7                      ; 61BD   00FF
        ADDR    R7,     R6                      ; 61BE   00FE
        ADDR    R7,     R4                      ; 61BF   00FC
        ADDR    R7,     R0                      ; 61C0   00F8
        ADDR    R6,     R0                      ; 61C1   00F0
        ADDR    R4,     R0                      ; 61C2   00E0
        ADDR    R0,     R0                      ; 61C3   00C0
        TSTR    R0                              ; 61C4   0080
        DECLE   $0000,  $0000,  $0001           ; 61C5   0000 0000 0001

        DIS                                     ; 61C8   0003
        SETC                                    ; 61C9   0007
        INCR    R7                              ; 61CA   000F
        COMR    R7                              ; 61CB   001F
L_61CC:
        RSWD    R7                              ; 61CC   003F
        SARC    R3,     2                       ; 61CD   007F
L_61CE:
        ADDR    R7,     R7                      ; 61CE   00FF
        ADDR    R7,     R6                      ; 61CF   00FE
        ADDR    R7,     R4                      ; 61D0   00FC
        ADDR    R7,     R0                      ; 61D1   00F8
        ADDR    R6,     R0                      ; 61D2   00F0
        ADDR    R4,     R0                      ; 61D3   00E0
        ADDR    R0,     R0                      ; 61D4   00C0
        TSTR    R0                              ; 61D5   0080
        DECLE   $0001                           ; 61D6   0001

        DIS                                     ; 61D7   0003
        SETC                                    ; 61D8   0007
        INCR    R7                              ; 61D9   000F
        COMR    R7                              ; 61DA   001F
        RSWD    R7                              ; 61DB   003F
L_61DC:
        SARC    R3,     2                       ; 61DC   007F
        ADDR    R7,     R7                      ; 61DD   00FF
        ADDR    R7,     R7                      ; 61DE   00FF
        ADDR    R7,     R7                      ; 61DF   00FF
        ADDR    R7,     R6                      ; 61E0   00FE
        ADDR    R7,     R4                      ; 61E1   00FC
        ADDR    R7,     R0                      ; 61E2   00F8
        ADDR    R6,     R0                      ; 61E3   00F0
        ADDR    R4,     R0                      ; 61E4   00E0
        ADDR    R0,     R1                      ; 61E5   00C1
        MOVR    R0,     R3                      ; 61E6   0083
        SETC                                    ; 61E7   0007
        INCR    R7                              ; 61E8   000F
        COMR    R7                              ; 61E9   001F
        RSWD    R7                              ; 61EA   003F
        SARC    R3,     2                       ; 61EB   007F
        ADDR    R7,     R7                      ; 61EC   00FF
        ADDR    R7,     R7                      ; 61ED   00FF
        ADDR    R7,     R7                      ; 61EE   00FF
        ADDR    R7,     R7                      ; 61EF   00FF
        ADDR    R7,     R7                      ; 61F0   00FF
        ADDR    R7,     R6                      ; 61F1   00FE
        ADDR    R7,     R4                      ; 61F2   00FC
        ADDR    R7,     R0                      ; 61F3   00F8
        ADDR    R6,     R1                      ; 61F4   00F1
        ADDR    R4,     R3                      ; 61F5   00E3
        ADDR    R0,     R7                      ; 61F6   00C7
        MOVR    R1,     R7                      ; 61F7   008F
        COMR    R7                              ; 61F8   001F
        RSWD    R7                              ; 61F9   003F
        SARC    R3,     2                       ; 61FA   007F
        ADDR    R7,     R7                      ; 61FB   00FF
        ADDR    R7,     R7                      ; 61FC   00FF
        ADDR    R7,     R7                      ; 61FD   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61FE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6202   0000 0000 0000 0000

        INCR    R7                              ; 6206   000F
        INCR    R7                              ; 6207   000F
        INCR    R7                              ; 6208   000F
        INCR    R7                              ; 6209   000F
        INCR    R7                              ; 620A   000F
        INCR    R7                              ; 620B   000F
        INCR    R7                              ; 620C   000F
        INCR    R7                              ; 620D   000F
        ADDR    R6,     R0                      ; 620E   00F0
        ADDR    R6,     R0                      ; 620F   00F0
        ADDR    R6,     R0                      ; 6210   00F0
        ADDR    R6,     R0                      ; 6211   00F0
        ADDR    R6,     R0                      ; 6212   00F0
        ADDR    R6,     R0                      ; 6213   00F0
        ADDR    R6,     R0                      ; 6214   00F0
        ADDR    R6,     R0                      ; 6215   00F0
        ADDR    R7,     R7                      ; 6216   00FF
        ADDR    R7,     R6                      ; 6217   00FE
        ADDR    R7,     R4                      ; 6218   00FC
        ADDR    R7,     R0                      ; 6219   00F8
        ADDR    R6,     R0                      ; 621A   00F0
        ADDR    R4,     R0                      ; 621B   00E0
        ADDR    R0,     R0                      ; 621C   00C0
        TSTR    R0                              ; 621D   0080
        DECLE   $0000,  $0001                   ; 621E   0000 0001

        DIS                                     ; 6220   0003
        SETC                                    ; 6221   0007
        INCR    R7                              ; 6222   000F
        COMR    R7                              ; 6223   001F
        RSWD    R7                              ; 6224   003F
        SARC    R3,     2                       ; 6225   007F
        TSTR    R0                              ; 6226   0080
        ADDR    R0,     R0                      ; 6227   00C0
        ADDR    R4,     R0                      ; 6228   00E0
        ADDR    R6,     R0                      ; 6229   00F0
        ADDR    R7,     R0                      ; 622A   00F8
        ADDR    R7,     R4                      ; 622B   00FC
        ADDR    R7,     R6                      ; 622C   00FE
        ADDR    R7,     R7                      ; 622D   00FF
        SARC    R3,     2                       ; 622E   007F
        RSWD    R7                              ; 622F   003F
        COMR    R7                              ; 6230   001F
        INCR    R7                              ; 6231   000F
        SETC                                    ; 6232   0007
        DIS                                     ; 6233   0003
        DECLE   $0001,  $0000                   ; 6234   0001 0000

        ADDR    R7,     R7                      ; 6236   00FF
        ADDR    R7,     R7                      ; 6237   00FF
        ADDR    R7,     R7                      ; 6238   00FF
        ADDR    R7,     R7                      ; 6239   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 623A   0000 0000 0000 0000
L_623E:
        RLC     R1,     2                       ; 623E   0055
        DECLE   $0000                           ; 623F   0000

        RLC     R1,     2                       ; 6240   0055
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6241   0000 0000 0000 0000
        DECLE   $0000                           ; 6245   0000

        ADDR    R7,     R7                      ; 6246   00FF
        ADDR    R7,     R7                      ; 6247   00FF
        ADDR    R7,     R7                      ; 6248   00FF
        ADDR    R7,     R7                      ; 6249   00FF
        ADDR    R7,     R7                      ; 624A   00FF
        ADDR    R7,     R7                      ; 624B   00FF
        ADDR    R7,     R7                      ; 624C   00FF
        ADDR    R7,     R7                      ; 624D   00FF
        ADDR    R7,     R7                      ; 624E   00FF
        ADDR    R7,     R7                      ; 624F   00FF
        ADDR    R7,     R7                      ; 6250   00FF
        ADDR    R7,     R7                      ; 6251   00FF
        SETC                                    ; 6252   0007
        DIS                                     ; 6253   0003
        DECLE   $0001,  $0000                   ; 6254   0001 0000

        ADDR    R7,     R7                      ; 6256   00FF
        ADDR    R7,     R7                      ; 6257   00FF
        ADDR    R7,     R7                      ; 6258   00FF
        ADDR    R7,     R7                      ; 6259   00FF
        ADDR    R6,     R0                      ; 625A   00F0
L_625B:
        ADDR    R4,     R0                      ; 625B   00E0
        ADDR    R0,     R0                      ; 625C   00C0
        TSTR    R0                              ; 625D   0080
        ADDR    R7,     R7                      ; 625E   00FF
        ADDR    R7,     R7                      ; 625F   00FF
        ADDR    R7,     R7                      ; 6260   00FF
L_6261:
        ADDR    R7,     R7                      ; 6261   00FF
        INCR    R7                              ; 6262   000F
        COMR    R7                              ; 6263   001F
        RSWD    R7                              ; 6264   003F
        SARC    R3,     2                       ; 6265   007F
        MOVR    R0,     R1                      ; 6266   0081
        ADDR    R7,     R7                      ; 6267   00FF
        MOVR    R0,     R1                      ; 6268   0081
        ADDR    R7,     R7                      ; 6269   00FF
        MOVR    R0,     R1                      ; 626A   0081
        ADDR    R7,     R7                      ; 626B   00FF
        MOVR    R0,     R1                      ; 626C   0081
        ADDR    R7,     R7                      ; 626D   00FF
        SLR     R2,     2                       ; 626E   0066
        MOVR    R6,     R3                      ; 626F   00B3
        ADDR    R3,     R1                      ; 6270   00D9
        ADDR    R5,     R4                      ; 6271   00EC
        ADDR    R6,     R6                      ; 6272   00F6
        ADDR    R7,     R3                      ; 6273   00FB
        ADDR    R7,     R5                      ; 6274   00FD
L_6275:
        ADDR    R7,     R6                      ; 6275   00FE
        SARC    R3,     2                       ; 6276   007F
L_6277:
        RSWD    R7                              ; 6277   003F
        MOVR    R3,     R7                      ; 6278   009F
L_6279:
        ADDR    R1,     R7                      ; 6279   00CF
        SLR     R3,     2                       ; 627A   0067
        GSWD    R3                              ; 627B   0033
        MOVR    R3,     R1                      ; 627C   0099
        ADDR    R1,     R4                      ; 627D   00CC
        DECLE   $0000,  $0001,  $0001           ; 627E   0000 0001 0001

        JSRD    R4,     G_0413                  ; 6281   0004 0006 0013

        COMR    R1                              ; 6284   0019
        SLL     R0,     2                       ; 6285   004C
        SLR     R0,     2                       ; 6286   0064
        GSWD    R0                              ; 6287   0030
        MOVR    R2,     R0                      ; 6288   0090
        ADDR    R0,     R0                      ; 6289   00C0
        SWAP    R0,     1                       ; 628A   0040
        DECLE   $0000,  $0000,  $0000           ; 628B   0000 0000 0000

        SLR     R2,     2                       ; 628E   0066
        GSWD    R3                              ; 628F   0033
        MOVR    R3,     R1                      ; 6290   0099
        ADDR    R1,     R4                      ; 6291   00CC
        SLR     R2,     2                       ; 6292   0066
        GSWD    R3                              ; 6293   0033
        MOVR    R3,     R1                      ; 6294   0099
        ADDR    R1,     R4                      ; 6295   00CC
        SLR     R2,     2                       ; 6296   0066
        ADDR    R1,     R4                      ; 6297   00CC
        MOVR    R3,     R1                      ; 6298   0099
        GSWD    R3                              ; 6299   0033
        SLR     R2,     2                       ; 629A   0066
        ADDR    R1,     R4                      ; 629B   00CC
        MOVR    R3,     R1                      ; 629C   0099
        GSWD    R3                              ; 629D   0033
        NEGR    R6                              ; 629E   0026
        INCR    R4                              ; 629F   000C
        INCR    R1                              ; 62A0   0009
        DIS                                     ; 62A1   0003
        EIS                                     ; 62A2   0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62A3   0000 0000 0000 0000

        TSTR    R0                              ; 62A7   0080
        TSTR    R0                              ; 62A8   0080
        NEGR    R0                              ; 62A9   0020
        SLR     R0,     1                       ; 62AA   0060
        ADDR    R1,     R0                      ; 62AB   00C8
        MOVR    R3,     R0                      ; 62AC   0098
        GSWD    R2                              ; 62AD   0032
        ADDR    R7,     R6                      ; 62AE   00FE
        ADDR    R7,     R4                      ; 62AF   00FC
        ADDR    R7,     R1                      ; 62B0   00F9
        ADDR    R6,     R3                      ; 62B1   00F3
        ADDR    R4,     R6                      ; 62B2   00E6
        ADDR    R1,     R4                      ; 62B3   00CC
        MOVR    R3,     R1                      ; 62B4   0099
        GSWD    R3                              ; 62B5   0033
        SLR     R2,     2                       ; 62B6   0066
        ADDR    R1,     R5                      ; 62B7   00CD
        TSTR    R3                              ; 62B8   009B
        DECLE   $0037                           ; 62B9   0037

        SAR     R3,     2                       ; 62BA   006F
        ADDR    R3,     R7                      ; 62BB   00DF
        TSTR    R7                              ; 62BC   00BF
        SARC    R3,     2                       ; 62BD   007F
        SARC    R3,     2                       ; 62BE   007F
        SARC    R3,     2                       ; 62BF   007F
        SARC    R3,     2                       ; 62C0   007F
        SARC    R3,     2                       ; 62C1   007F
        SARC    R3,     2                       ; 62C2   007F
        SARC    R3,     2                       ; 62C3   007F
        SARC    R3,     2                       ; 62C4   007F
        SARC    R3,     2                       ; 62C5   007F
        ADDR    R7,     R7                      ; 62C6   00FF
        ADDR    R7,     R7                      ; 62C7   00FF
        ADDR    R7,     R7                      ; 62C8   00FF
        ADDR    R7,     R7                      ; 62C9   00FF
        ADDR    R7,     R7                      ; 62CA   00FF
        ADDR    R7,     R7                      ; 62CB   00FF
        ADDR    R7,     R7                      ; 62CC   00FF
        ADDR    R7,     R6                      ; 62CD   00FE
        SARC    R3,     2                       ; 62CE   007F
        ADDR    R7,     R7                      ; 62CF   00FF
        ADDR    R7,     R7                      ; 62D0   00FF
        ADDR    R7,     R7                      ; 62D1   00FF
        ADDR    R7,     R7                      ; 62D2   00FF
        ADDR    R7,     R7                      ; 62D3   00FF
        ADDR    R7,     R7                      ; 62D4   00FF
        ADDR    R7,     R7                      ; 62D5   00FF
        DECLE   $0000,  $0001                   ; 62D6   0000 0001

        DIS                                     ; 62D8   0003
        SETC                                    ; 62D9   0007
        INCR    R7                              ; 62DA   000F
        COMR    R7                              ; 62DB   001F
        RSWD    R7                              ; 62DC   003F
        SARC    R3,     2                       ; 62DD   007F
        ADDR    R7,     R0                      ; 62DE   00F8
        ADDR    R6,     R0                      ; 62DF   00F0
        ADDR    R4,     R0                      ; 62E0   00E0
        ADDR    R0,     R0                      ; 62E1   00C0
        TSTR    R0                              ; 62E2   0080
        DECLE   $0000,  $0000,  $0000           ; 62E3   0000 0000 0000

        SARC    R3,     2                       ; 62E6   007F
        ADDR    R7,     R7                      ; 62E7   00FF
        ADDR    R7,     R7                      ; 62E8   00FF
        ADDR    R7,     R7                      ; 62E9   00FF
        ADDR    R7,     R7                      ; 62EA   00FF
        ADDR    R7,     R7                      ; 62EB   00FF
        ADDR    R7,     R7                      ; 62EC   00FF
        ADDR    R7,     R6                      ; 62ED   00FE
        ADDR    R7,     R6                      ; 62EE   00FE
        ADDR    R7,     R7                      ; 62EF   00FF
L_62F0:
        ADDR    R7,     R7                      ; 62F0   00FF
        ADDR    R7,     R7                      ; 62F1   00FF
        ADDR    R7,     R7                      ; 62F2   00FF
        ADDR    R7,     R7                      ; 62F3   00FF
        ADDR    R7,     R7                      ; 62F4   00FF
        SARC    R3,     2                       ; 62F5   007F
        RSWD    R7                              ; 62F6   003F
        COMR    R7                              ; 62F7   001F
        INCR    R7                              ; 62F8   000F
        SETC                                    ; 62F9   0007
        DIS                                     ; 62FA   0003
        DECLE   $0001,  $0000,  $0000,  $0000   ; 62FB   0001 0000 0000 0000

        TSTR    R0                              ; 62FF   0080
        ADDR    R0,     R0                      ; 6300   00C0
        ADDR    R4,     R0                      ; 6301   00E0
        ADDR    R6,     R0                      ; 6302   00F0
        ADDR    R7,     R0                      ; 6303   00F8
        ADDR    R7,     R4                      ; 6304   00FC
        ADDR    R7,     R6                      ; 6305   00FE
        ADDR    R7,     R6                      ; 6306   00FE
        ADDR    R7,     R7                      ; 6307   00FF
        ADDR    R7,     R7                      ; 6308   00FF
        ADDR    R7,     R7                      ; 6309   00FF
        ADDR    R7,     R7                      ; 630A   00FF
        ADDR    R7,     R7                      ; 630B   00FF
L_630C:
        ADDR    R7,     R7                      ; 630C   00FF
        ADDR    R7,     R7                      ; 630D   00FF
L_630E:
        ADDR    R7,     R7                      ; 630E   00FF
        ADDR    R7,     R7                      ; 630F   00FF
L_6310:
        ADDR    R7,     R7                      ; 6310   00FF
        ADDR    R7,     R7                      ; 6311   00FF
L_6312:
        ADDR    R7,     R7                      ; 6312   00FF
        ADDR    R7,     R7                      ; 6313   00FF
        ADDR    R7,     R7                      ; 6314   00FF
        SARC    R3,     2                       ; 6315   007F
        ADDR    R7,     R6                      ; 6316   00FE
        ADDR    R7,     R4                      ; 6317   00FC
        ADDR    R7,     R0                      ; 6318   00F8
        ADDR    R6,     R0                      ; 6319   00F0
        ADDR    R4,     R0                      ; 631A   00E0
        ADDR    R0,     R0                      ; 631B   00C0
        TSTR    R0                              ; 631C   0080
        DECLE   $0000,  $0001                   ; 631D   0000 0001

        DIS                                     ; 631F   0003
        SETC                                    ; 6320   0007
        INCR    R7                              ; 6321   000F
        COMR    R7                              ; 6322   001F
        RSWD    R7                              ; 6323   003F
        SARC    R3,     2                       ; 6324   007F
        ADDR    R7,     R7                      ; 6325   00FF
        ADDR    R7,     R6                      ; 6326   00FE
        ADDR    R7,     R4                      ; 6327   00FC
        ADDR    R7,     R0                      ; 6328   00F8
        ADDR    R6,     R0                      ; 6329   00F0
        ADDR    R4,     R0                      ; 632A   00E0
        ADDR    R0,     R0                      ; 632B   00C0
        TSTR    R0                              ; 632C   0080
        DECLE   $0000,  $0001                   ; 632D   0000 0001

        DIS                                     ; 632F   0003
        SETC                                    ; 6330   0007
        INCR    R7                              ; 6331   000F
        COMR    R7                              ; 6332   001F
        RSWD    R7                              ; 6333   003F
L_6334:
        SARC    R3,     2                       ; 6334   007F
        ADDR    R7,     R7                      ; 6335   00FF
        ADDR    R7,     R6                      ; 6336   00FE
L_6337:
        ADDR    R7,     R4                      ; 6337   00FC
        ADDR    R7,     R0                      ; 6338   00F8
        ADDR    R6,     R0                      ; 6339   00F0
        ADDR    R4,     R0                      ; 633A   00E0
        ADDR    R0,     R0                      ; 633B   00C0
        TSTR    R0                              ; 633C   0080
        DECLE   $0000,  $0001                   ; 633D   0000 0001

        DIS                                     ; 633F   0003
        SETC                                    ; 6340   0007
L_6341:
        INCR    R7                              ; 6341   000F
        COMR    R7                              ; 6342   001F
        RSWD    R7                              ; 6343   003F
        SARC    R3,     2                       ; 6344   007F
        ADDR    R7,     R7                      ; 6345   00FF
        ADDR    R7,     R6                      ; 6346   00FE
        ADDR    R7,     R4                      ; 6347   00FC
        ADDR    R7,     R0                      ; 6348   00F8
        ADDR    R6,     R0                      ; 6349   00F0
        ADDR    R4,     R0                      ; 634A   00E0
L_634B:
        ADDR    R0,     R0                      ; 634B   00C0
        TSTR    R0                              ; 634C   0080
L_634D:
        DECLE   $0000,  $0001                   ; 634D   0000 0001

        DIS                                     ; 634F   0003
        SETC                                    ; 6350   0007
        INCR    R7                              ; 6351   000F
        COMR    R7                              ; 6352   001F
        RSWD    R7                              ; 6353   003F
        SARC    R3,     2                       ; 6354   007F
        ADDR    R7,     R7                      ; 6355   00FF
        ADDR    R7,     R6                      ; 6356   00FE
        ADDR    R7,     R4                      ; 6357   00FC
        ADDR    R7,     R0                      ; 6358   00F8
        ADDR    R6,     R0                      ; 6359   00F0
        ADDR    R4,     R0                      ; 635A   00E0
        ADDR    R0,     R0                      ; 635B   00C0
        TSTR    R0                              ; 635C   0080
        DECLE   $0000,  $0001                   ; 635D   0000 0001

        DIS                                     ; 635F   0003
        SETC                                    ; 6360   0007
        INCR    R7                              ; 6361   000F
        COMR    R7                              ; 6362   001F
        RSWD    R7                              ; 6363   003F
        SARC    R3,     2                       ; 6364   007F
        ADDR    R7,     R7                      ; 6365   00FF
        ADDR    R7,     R6                      ; 6366   00FE
        ADDR    R7,     R4                      ; 6367   00FC
        ADDR    R7,     R0                      ; 6368   00F8
        ADDR    R6,     R0                      ; 6369   00F0
        ADDR    R4,     R0                      ; 636A   00E0
        ADDR    R0,     R0                      ; 636B   00C0
        MOVR    R0,     R1                      ; 636C   0081
L_636D:
        DIS                                     ; 636D   0003
        DECLE   $0001                           ; 636E   0001
L_636F:
        DIS                                     ; 636F   0003
        SETC                                    ; 6370   0007
L_6371:
        INCR    R7                              ; 6371   000F
        COMR    R7                              ; 6372   001F
        RSWD    R7                              ; 6373   003F
        ADDR    R7,     R7                      ; 6374   00FF
        ADDR    R7,     R7                      ; 6375   00FF
        ADDR    R7,     R6                      ; 6376   00FE
        ADDR    R7,     R4                      ; 6377   00FC
        ADDR    R7,     R0                      ; 6378   00F8
        ADDR    R6,     R0                      ; 6379   00F0
L_637A:
        ADDR    R4,     R1                      ; 637A   00E1
        ADDR    R0,     R3                      ; 637B   00C3
L_637C:
        MOVR    R0,     R7                      ; 637C   0087
        INCR    R7                              ; 637D   000F
L_637E:
        DECLE   $0001                           ; 637E   0001

        DIS                                     ; 637F   0003
        SETC                                    ; 6380   0007
        INCR    R7                              ; 6381   000F
        ADDR    R7,     R7                      ; 6382   00FF
        ADDR    R7,     R7                      ; 6383   00FF
        ADDR    R7,     R7                      ; 6384   00FF
        ADDR    R7,     R7                      ; 6385   00FF
        ADDR    R7,     R6                      ; 6386   00FE
L_6387:
        ADDR    R7,     R4                      ; 6387   00FC
        ADDR    R7,     R1                      ; 6388   00F9
        ADDR    R6,     R3                      ; 6389   00F3
        ADDR    R4,     R7                      ; 638A   00E7
        ADDR    R1,     R7                      ; 638B   00CF
        MOVR    R3,     R7                      ; 638C   009F
        RSWD    R7                              ; 638D   003F
        DECLE   $0001                           ; 638E   0001

        DIS                                     ; 638F   0003
        ADDR    R7,     R7                      ; 6390   00FF
L_6391:
        ADDR    R7,     R7                      ; 6391   00FF
        ADDR    R7,     R7                      ; 6392   00FF
        ADDR    R7,     R7                      ; 6393   00FF
        ADDR    R7,     R7                      ; 6394   00FF
        ADDR    R7,     R7                      ; 6395   00FF
        ADDR    R7,     R7                      ; 6396   00FF
        ADDR    R7,     R7                      ; 6397   00FF
        ADDR    R7,     R7                      ; 6398   00FF
        ADDR    R7,     R7                      ; 6399   00FF
        ADDR    R7,     R7                      ; 639A   00FF
        ADDR    R7,     R7                      ; 639B   00FF
        ADDR    R7,     R7                      ; 639C   00FF
        ADDR    R7,     R7                      ; 639D   00FF
        ADDR    R7,     R7                      ; 639E   00FF
        ADDR    R7,     R7                      ; 639F   00FF
        ADDR    R7,     R7                      ; 63A0   00FF
        ADDR    R7,     R7                      ; 63A1   00FF
        ADDR    R7,     R7                      ; 63A2   00FF
        ADDR    R7,     R7                      ; 63A3   00FF
        ADDR    R7,     R7                      ; 63A4   00FF
        ADDR    R7,     R7                      ; 63A5   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63A6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63AA   0000 0000 0000 0000
        DECLE   $0000,  $0001                   ; 63AE   0000 0001

        DIS                                     ; 63B0   0003
        SETC                                    ; 63B1   0007
        INCR    R7                              ; 63B2   000F
        COMR    R7                              ; 63B3   001F
        RSWD    R7                              ; 63B4   003F
        SARC    R3,     2                       ; 63B5   007F
L_63B6:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63B6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001           ; 63BA   0000 0000 0001

        DIS                                     ; 63BD   0003
        SETC                                    ; 63BE   0007
        INCR    R7                              ; 63BF   000F
L_63C0:
        COMR    R7                              ; 63C0   001F
        RSWD    R7                              ; 63C1   003F
        SARC    R3,     2                       ; 63C2   007F
L_63C3:
        ADDR    R7,     R7                      ; 63C3   00FF
        DECLE   $0000                           ; 63C4   0000

        ADDR    R7,     R7                      ; 63C5   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63C6   0000 0000 0000 0000
        DECLE   $0001                           ; 63CA   0001

        DIS                                     ; 63CB   0003
        SETC                                    ; 63CC   0007
        INCR    R7                              ; 63CD   000F
        COMR    R7                              ; 63CE   001F
        RSWD    R7                              ; 63CF   003F
        SARC    R3,     2                       ; 63D0   007F
        ADDR    R7,     R7                      ; 63D1   00FF
        DECLE   $0000                           ; 63D2   0000

        ADDR    R7,     R7                      ; 63D3   00FF
        RSWD    R7                              ; 63D4   003F
        SARC    R3,     2                       ; 63D5   007F
        DECLE   $0000,  $0000,  $0001           ; 63D6   0000 0000 0001

        DIS                                     ; 63D9   0003
        SETC                                    ; 63DA   0007
        INCR    R7                              ; 63DB   000F
        COMR    R7                              ; 63DC   001F
L_63DD:
        RSWD    R7                              ; 63DD   003F
        SARC    R3,     2                       ; 63DE   007F
        ADDR    R7,     R7                      ; 63DF   00FF
L_63E0:
        DECLE   $0000                           ; 63E0   0000

        ADDR    R7,     R7                      ; 63E1   00FF
        INCR    R7                              ; 63E2   000F
        COMR    R7                              ; 63E3   001F
        RSWD    R7                              ; 63E4   003F
        SARC    R3,     2                       ; 63E5   007F
        DECLE   $0001                           ; 63E6   0001

        DIS                                     ; 63E7   0003
        SETC                                    ; 63E8   0007
        INCR    R7                              ; 63E9   000F
        COMR    R7                              ; 63EA   001F
        RSWD    R7                              ; 63EB   003F
        SARC    R3,     2                       ; 63EC   007F
        ADDR    R7,     R7                      ; 63ED   00FF
        DECLE   $0000                           ; 63EE   0000

        ADDR    R7,     R7                      ; 63EF   00FF
        DIS                                     ; 63F0   0003
        SETC                                    ; 63F1   0007
        INCR    R7                              ; 63F2   000F
        COMR    R7                              ; 63F3   001F
        RSWD    R7                              ; 63F4   003F
        SARC    R3,     2                       ; 63F5   007F
        SETC                                    ; 63F6   0007
        INCR    R7                              ; 63F7   000F
        COMR    R7                              ; 63F8   001F
        RSWD    R7                              ; 63F9   003F
        SARC    R3,     2                       ; 63FA   007F
        ADDR    R7,     R7                      ; 63FB   00FF
        DECLE   $0000                           ; 63FC   0000

        ADDR    R7,     R7                      ; 63FD   00FF
L_63FE:
        DECLE   $0000,  $0001                   ; 63FE   0000 0001

        DIS                                     ; 6400   0003
        SETC                                    ; 6401   0007
        INCR    R7                              ; 6402   000F
        COMR    R7                              ; 6403   001F
        RSWD    R7                              ; 6404   003F
        SARC    R3,     2                       ; 6405   007F
        COMR    R7                              ; 6406   001F
        RSWD    R7                              ; 6407   003F
        SARC    R3,     2                       ; 6408   007F
        ADDR    R7,     R7                      ; 6409   00FF
        DECLE   $0000                           ; 640A   0000

        ADDR    R7,     R7                      ; 640B   00FF
        DECLE   $0000,  $0000,  $0000,  $0001   ; 640C   0000 0000 0000 0001

        DIS                                     ; 6410   0003
        SETC                                    ; 6411   0007
        INCR    R7                              ; 6412   000F
        COMR    R7                              ; 6413   001F
        RSWD    R7                              ; 6414   003F
        SARC    R3,     2                       ; 6415   007F
        SARC    R3,     2                       ; 6416   007F
        ADDR    R7,     R7                      ; 6417   00FF
        DECLE   $0000                           ; 6418   0000

        ADDR    R7,     R7                      ; 6419   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 641A   0000 0000 0000 0000
        DECLE   $0000,  $0001                   ; 641E   0000 0001

        DIS                                     ; 6420   0003
        SETC                                    ; 6421   0007
        INCR    R7                              ; 6422   000F
        COMR    R7                              ; 6423   001F
        RSWD    R7                              ; 6424   003F
        SARC    R3,     2                       ; 6425   007F
        DECLE   $0000                           ; 6426   0000

        ADDR    R7,     R7                      ; 6427   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6428   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 642C   0000 0000 0000 0001

        DIS                                     ; 6430   0003
        SETC                                    ; 6431   0007
        INCR    R7                              ; 6432   000F
        COMR    R7                              ; 6433   001F
        RSWD    R7                              ; 6434   003F
        SARC    R3,     2                       ; 6435   007F
        DECLE   $0000,  $0000                   ; 6436   0000 0000

        EIS                                     ; 6438   0002
        CLRC                                    ; 6439   0006
        INCR    R6                              ; 643A   000E
        COMR    R6                              ; 643B   001E
        RSWD    R6                              ; 643C   003E
        SARC    R2,     2                       ; 643D   007E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 643E   0000 0000 0000 0000
        DECLE   $0000                           ; 6442   0000
L_6443:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6443   0000 0000 0000 0000
        DECLE   $0000                           ; 6447   0000

        SUB     G_036C, R0                      ; 6448   0300 036C
        SUB     .BTAB.24,R0                     ; 644A   0300 0224
        SUB     .BTAB.24,R0                     ; 644C   0300 0224
L_644E:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 644E   0000 0000 0000 0000

        CMPR    R1,     R4                      ; 6452   014C
        MVO@    R4,     R3                      ; 6453   025C
        SUBI    #$033C, R4                      ; 6454   033C 033C
        SUBI    #$0364, R4                      ; 6456   033C 0364
        CMPR    R1,     R4                      ; 6458   014C
        CMPR    R1,     R4                      ; 6459   014C
L_645A:
        CMPR    R1,     R4                      ; 645A   014C
        CMPR    R1,     R4                      ; 645B   014C
        CMPR    R1,     R4                      ; 645C   014C
        CMPR    R1,     R4                      ; 645D   014C
        CMPR    R1,     R4                      ; 645E   014C
        CMPR    R1,     R4                      ; 645F   014C
        CMPR    R1,     R4                      ; 6460   014C
        CMPR    R1,     R4                      ; 6461   014C
        MVO@    R4,     R3                      ; 6462   025C
        CMP@    R4,     R4                      ; 6463   0364
        MVO@    R4,     R3                      ; 6464   025C
        SUBI    #$021C, R4                      ; 6465   033C 021C
        COMR    R5                              ; 6467   001D
        DECLE   $0000,  $0000                   ; 6468   0000 0000
L_646A:
        NEGR    R4                              ; 646A   0024
        CMPR    R1,     R4                      ; 646B   014C
        DECLE   $021C                           ; 646C   021C

        SUB     G_0324, R5                      ; 646D   0305 0324
        CMPR    R1,     R4                      ; 646F   014C
        DECLE   $021C                           ; 6470   021C

        CMP     G_0344, R4                      ; 6471   0344 0344
        CMP     G_0344, R4                      ; 6473   0344 0344
        CMP     .BTAB.24,R4                     ; 6475   0344 0224
        DECLE   $021C                           ; 6477   021C

        BEQ     L_677A                          ; 6478   0204 0300

        SUBI    #$0364, R4                      ; 647A   033C 0364
        CMPR    R1,     R4                      ; 647C   014C
        CMPR    R1,     R4                      ; 647D   014C
        CMPR    R1,     R4                      ; 647E   014C
        CMPR    R1,     R4                      ; 647F   014C
        CMPR    R1,     R4                      ; 6480   014C
        CMPR    R1,     R4                      ; 6481   014C
        CMP     G_036C, R4                      ; 6482   0344 036C
        BEQ     L_6793                          ; 6484   0204 030D
        B       L_6487                          ; 6486   0220 0000

        DECLE   $0000                           ; 6488   0000

        SUB@    R2,     R0                      ; 6489   0310
        CMP@    R5,     R4                      ; 648A   036C
        BEQ     L_66B1                          ; 648B   0204 0224

        CMPR    R1,     R4                      ; 648D   014C
        NEGR    R4                              ; 648E   0024
        CMPR    R1,     R4                      ; 648F   014C
        CMPR    R1,     R4                      ; 6490   014C
        CMPR    R1,     R4                      ; 6491   014C
        CMPR    R1,     R4                      ; 6492   014C
        CMPR    R1,     R4                      ; 6493   014C
        CMPR    R1,     R4                      ; 6494   014C
        CMPR    R1,     R4                      ; 6495   014C
        SUB     G_036C, R5                      ; 6496   0305 036C
        BEQ     L_634D                          ; 6498   0224 014C

        CMPR    R1,     R4                      ; 649A   014C
        CMPR    R1,     R4                      ; 649B   014C
        CMPR    R1,     R4                      ; 649C   014C
        CMPR    R1,     R4                      ; 649D   014C
        CMP@    R5,     R4                      ; 649E   036C
        MVI     .BTAB.7C,R4                     ; 649F   0284 027C
        CMPR    R1,     R4                      ; 64A1   014C
        CMP@    R5,     R4                      ; 64A2   036C
        CMP     G_0344, R4                      ; 64A3   0344 0344
        CMP     G_0344, R4                      ; 64A5   0344 0344
        CMP     .BTAB.34,R4                     ; 64A7   0344 0234
        CMPR    R1,     R4                      ; 64A9   014C
L_64AA:
        CMPR    R1,     R4                      ; 64AA   014C
        CMPR    R1,     R4                      ; 64AB   014C
        CMPR    R1,     R4                      ; 64AC   014C
        CMPR    R1,     R4                      ; 64AD   014C
L_64AE:
        CMPR    R1,     R4                      ; 64AE   014C
        CMPR    R1,     R4                      ; 64AF   014C
        CMPR    R1,     R4                      ; 64B0   014C
        CMPR    R1,     R4                      ; 64B1   014C
        CMPR    R1,     R4                      ; 64B2   014C
        PSHR    R4                              ; 64B3   0274
        MVI@    R1,     R4                      ; 64B4   028C
        BEQ     L_6823                          ; 64B5   0204 036C
        B       L_61B8                          ; 64B7   0220 0300
        BEQ     L_67BB                          ; 64B9   0204 0300
        BEQ     L_67F2                          ; 64BB   0204 0335

        CMP@    R5,     R4                      ; 64BD   036C
        CMP     .BTAB.34,R4                     ; 64BE   0344 0234
        MVO@    R4,     R1                      ; 64C0   024C
        CMPR    R1,     R4                      ; 64C1   014C
        MVO@    R4,     R1                      ; 64C2   024C
        CMPR    R1,     R4                      ; 64C3   014C
        CMPR    R1,     R4                      ; 64C4   014C
        CMPR    R1,     R4                      ; 64C5   014C
        CMP@    R3,     R4                      ; 64C6   035C
        MVO@    R4,     R2                      ; 64C7   0254
        CMPR    R1,     R4                      ; 64C8   014C
        CMPR    R1,     R4                      ; 64C9   014C
        CMPR    R1,     R4                      ; 64CA   014C
        AND@    R6,     R4                      ; 64CB   03B4
        AND@    R5,     R4                      ; 64CC   03AC
        B       L_61CE                          ; 64CD   0220 0300
        B       L_61CC                          ; 64CF   0220 0304

        CMP@    R5,     R4                      ; 64D1   036C
        SUB     G_0335, R5                      ; 64D2   0305 0335
        DECLE   $0234                           ; 64D4   0234

        MVO@    R4,     R1                      ; 64D5   024C
        CMPR    R1,     R4                      ; 64D6   014C
        CMPR    R1,     R4                      ; 64D7   014C
        CMP@    R1,     R4                      ; 64D8   034C
        DECLE   $021C                           ; 64D9   021C

        SUB     .BTAB.84,R0                     ; 64DA   0300 0284
        DECLE   $027C                           ; 64DC   027C

        CMPR    R1,     R4                      ; 64DD   014C
        CMP@    R5,     R4                      ; 64DE   036C
        AND@    R4,     R4                      ; 64DF   03A4
        ANDI    #$014C, R4                      ; 64E0   03BC 014C
        CMPR    R1,     R4                      ; 64E2   014C
        CMPR    R1,     R4                      ; 64E3   014C
        CMPR    R1,     R4                      ; 64E4   014C
        AND@    R6,     R4                      ; 64E5   03B4
        AND@    R5,     R4                      ; 64E6   03AC
        SUB     G_0335, R0                      ; 64E7   0300 0335
        CMP     G_0344, R4                      ; 64E9   0344 0344
        CMP     G_0344, R4                      ; 64EB   0344 0344
        BEQ     L_663B                          ; 64ED   0204 014C

        PSHR    R4                              ; 64EF   0274
        MVI@    R1,     R4                      ; 64F0   028C
        BEQ     L_685F                          ; 64F1   0204 036C

        SUB     G_0344, R0                      ; 64F3   0300 0344
        CMP     G_0344, R4                      ; 64F5   0344 0344
        CMP     G_0344, R4                      ; 64F7   0344 0344
        AND@    R4,     R4                      ; 64F9   03A4
        ANDI    #$03B4, R4                      ; 64FA   03BC 03B4
        AND@    R5,     R4                      ; 64FC   03AC
        SUB     .BTAB.20,R0                     ; 64FD   0300 0220
L_64FF:
        DECLE   $0000                           ; 64FF   0000

        SUB     .BTAB.24,R0                     ; 6500   0300 0224
        CMPR    R1,     R4                      ; 6502   014C
        CMPR    R1,     R4                      ; 6503   014C
        CMPR    R1,     R4                      ; 6504   014C
        CMPR    R1,     R4                      ; 6505   014C
        CMPR    R1,     R4                      ; 6506   014C
        CMPR    R1,     R4                      ; 6507   014C
        CMPR    R1,     R4                      ; 6508   014C
        CMPR    R1,     R4                      ; 6509   014C
        CMPR    R1,     R4                      ; 650A   014C
        CMPR    R1,     R4                      ; 650B   014C
        CMPR    R1,     R4                      ; 650C   014C
        AND@    R6,     R4                      ; 650D   03B4
        AND@    R5,     R4                      ; 650E   03AC
        AND@    R4,     R4                      ; 650F   03A4
        ANDI    #$014C, R4                      ; 6510   03BC 014C
        CMPR    R1,     R4                      ; 6512   014C
        CMPR    R1,     R4                      ; 6513   014C
        MVO@    R4,     R3                      ; 6514   025C
        SUBI    #$033C, R4                      ; 6515   033C 033C
        CMP@    R4,     R4                      ; 6517   0364
        CMPR    R1,     R4                      ; 6518   014C
        CMPR    R1,     R4                      ; 6519   014C
        CMP     G_0344, R4                      ; 651A   0344 0344
        CMP     G_0344, R4                      ; 651C   0344 0344
        CMP     .BTAB.20,R4                     ; 651E   0344 0220
        CMP     G_03A4, R4                      ; 6520   0344 03A4
        ANDI    #$014C, R4                      ; 6522   03BC 014C
        MVO@    R4,     R1                      ; 6524   024C
        CMP@    R1,     R4                      ; 6525   034C
        CMPR    R1,     R4                      ; 6526   014C
        CMPR    R1,     R4                      ; 6527   014C
        CMPR    R1,     R4                      ; 6528   014C
        CMPR    R1,     R4                      ; 6529   014C
        CMP@    R1,     R4                      ; 652A   034C
        DECLE   $021C                           ; 652B   021C

        SUB     .BTAB.34,R5                     ; 652C   0305 0234
        DECLE   $0000,  $0000,  $0000,  $0000   ; 652E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6532   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6536   0000 0000

        CMP     G_0344, R4                      ; 6538   0344 0344
        CMP     .BTAB.30,R4                     ; 653A   0344 0230
        DECLE   $0000,  $0000,  $0000,  $0000   ; 653C   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6540   0000 0000

        SUBI    #$033C, R4                      ; 6542   033C 033C
        SUBI    #$0364, R4                      ; 6544   033C 0364
        MVO@    R4,     R3                      ; 6546   025C
        SUBI    #$033C, R4                      ; 6547   033C 033C
        CMP@    R4,     R4                      ; 6549   0364
        CMPR    R1,     R4                      ; 654A   014C
        CMPR    R1,     R4                      ; 654B   014C
        CMPR    R1,     R4                      ; 654C   014C
        CMPR    R1,     R4                      ; 654D   014C
        CMPR    R1,     R4                      ; 654E   014C
        CMPR    R1,     R4                      ; 654F   014C
        CMPR    R1,     R4                      ; 6550   014C
        CMPR    R1,     R4                      ; 6551   014C
        MVO@    R4,     R3                      ; 6552   025C
        SUBI    #$0364, R4                      ; 6553   033C 0364
        CMPR    R1,     R4                      ; 6555   014C
        SUB     G_0320, R4                      ; 6556   0304 0320
        NEGR    R4                              ; 6558   0024
        DECLE   $021C                           ; 6559   021C

        B       L_655B                          ; 655A   0220 0000

        NEGR    R4                              ; 655C   0024
        DECLE   $021C                           ; 655D   021C

        CMP@    R5,     R4                      ; 655E   036C
        CMP     G_0344, R4                      ; 655F   0344 0344
        CMP     G_0344, R4                      ; 6561   0344 0344
        CMP     G_0344, R4                      ; 6563   0344 0344
        CMP     .BTAB.04,R4                     ; 6565   0344 0204
        BEQ     L_630C                          ; 6567   0224 025C

        CMP@    R1,     R4                      ; 6569   034C
        CMPR    R1,     R4                      ; 656A   014C
        CMPR    R1,     R4                      ; 656B   014C
        CMP@    R3,     R4                      ; 656C   035C
        MVO@    R4,     R2                      ; 656D   0254
        CMPR    R1,     R4                      ; 656E   014C
        CMPR    R1,     R4                      ; 656F   014C
        DECLE   $021C                           ; 6570   021C

        BEQ     L_68DF                          ; 6571   0204 036C

        SUB     .BTAB.24,R0                     ; 6573   0300 0224
        SUB     .BTAB.24,R0                     ; 6575   0300 0224
        SUB     .BTAB.24,R0                     ; 6577   0300 0224
        SUB     .BTAB.04,R0                     ; 6579   0300 0204
        CMP@    R5,     R4                      ; 657B   036C
        BEQ     L_6261                          ; 657C   0224 031C

        CMPR    R1,     R4                      ; 657E   014C
        SUB@    R3,     R4                      ; 657F   031C
        SUB     .BTAB.04,R0                     ; 6580   0300 0204
        CMP@    R5,     R4                      ; 6582   036C
        CMP     .BTAB.04,R4                     ; 6583   0344 0204
        BEQ     L_68F3                          ; 6585   0204 036C

        SUB     G_0300, R0                      ; 6587   0300 0300
        SUB     G_0300, R0                      ; 6589   0300 0300
        SUB     G_0300, R0                      ; 658B   0300 0300
        SUB     .BTAB.24,R0                     ; 658D   0300 0224
        CMPR    R1,     R4                      ; 658F   014C
        DECLE   $021C                           ; 6590   021C

        BLT     L_6797                          ; 6591   0205 0204

        SUB     G_0300, R0                      ; 6593   0300 0300
        BEQ     L_6903                          ; 6595   0204 036C

        SUB     .BTAB.04,R0                     ; 6597   0300 0204
        BEQ     L_644E                          ; 6599   0224 014C

        CMPR    R1,     R4                      ; 659B   014C
        CMPR    R1,     R4                      ; 659C   014C
        CMPR    R1,     R4                      ; 659D   014C
        CMPR    R1,     R4                      ; 659E   014C
        AND@    R6,     R4                      ; 659F   03B4
        AND@    R5,     R4                      ; 65A0   03AC
        SUB     G_036C, R0                      ; 65A1   0300 036C
        CMP     .BTAB.04,R4                     ; 65A3   0344 0204
        BEQ     L_645A                          ; 65A5   0224 014C

        CMPR    R1,     R4                      ; 65A7   014C
        CMPR    R1,     R4                      ; 65A8   014C
        BNEQ    L_623E                          ; 65A9   022C 036C

        SUB     .BTAB.24,R0                     ; 65AB   0300 0224
        DECLE   $021C                           ; 65AD   021C

        CMP     G_0344, R4                      ; 65AE   0344 0344
        CMP     G_0344, R4                      ; 65B0   0344 0344
        CMP     G_03A4, R4                      ; 65B2   0344 03A4
        AND@    R3,     R4                      ; 65B4   039C
        AND@    R5,     R4                      ; 65B5   03AC
        CMP@    R5,     R4                      ; 65B6   036C
        SUB     .BTAB.24,R0                     ; 65B7   0300 0224
        MVO@    R4,     R1                      ; 65B9   024C
        CMPR    R1,     R4                      ; 65BA   014C
L_65BB:
        SUB@    R3,     R4                      ; 65BB   031C
        AND     G_037C, R4                      ; 65BC   0384 037C
        CMPR    R1,     R4                      ; 65BE   014C
        CMPR    R1,     R4                      ; 65BF   014C
        CMPR    R1,     R4                      ; 65C0   014C
        AND@    R6,     R4                      ; 65C1   03B4
        AND@    R5,     R4                      ; 65C2   03AC
        SUB     G_0300, R0                      ; 65C3   0300 0300
        SUB     G_0300, R5                      ; 65C5   0305 0300
        SUB     G_03A4, R0                      ; 65C7   0300 03A4
        ANDI    #$014C, R4                      ; 65C9   03BC 014C
        CMPR    R1,     R4                      ; 65CB   014C
        CMPR    R1,     R4                      ; 65CC   014C
        DECLE   $021C                           ; 65CD   021C

        BEQ     L_6954                          ; 65CE   0204 0384

        AND@    R2,     R4                      ; 65D0   0394
        AND@    R1,     R4                      ; 65D1   038C
        CMP     G_0344, R4                      ; 65D2   0344 0344
        CMP     G_03A4, R4                      ; 65D4   0344 03A4
        AND@    R3,     R4                      ; 65D6   039C
        AND@    R5,     R4                      ; 65D7   03AC
        SUB     .BTAB.05,R0                     ; 65D8   0300 0205
        SUB     G_0384, R0                      ; 65DA   0300 0384
        CMPI    #$021C, R4                      ; 65DC   037C 021C
        CMP     G_0344, R4                      ; 65DE   0344 0344
        CMP     .BTAB.04,R4                     ; 65E0   0344 0204
        CMPR    R1,     R4                      ; 65E2   014C
        CMP@    R6,     R4                      ; 65E3   0374
        AND@    R1,     R4                      ; 65E4   038C
        SUB     G_0300, R0                      ; 65E5   0300 0300
        SUB     G_0300, R0                      ; 65E7   0300 0300
        SUB     G_03A4, R0                      ; 65E9   0300 03A4
        AND@    R3,     R4                      ; 65EB   039C
        AND@    R5,     R4                      ; 65EC   03AC
        SUBR    R0,     R4                      ; 65ED   0104
        AND     G_0394, R4                      ; 65EE   0384 0394
        AND@    R1,     R4                      ; 65F0   038C
        BEQ     L_68F3                          ; 65F1   0204 0300

        SUB     G_0300, R5                      ; 65F3   0305 0300
        BEQ     L_64AA                          ; 65F5   0224 014C

        DECLE   $021C                           ; 65F7   021C

        SUB@    R4,     R4                      ; 65F8   0324
        CMPR    R1,     R4                      ; 65F9   014C
        CMPR    R1,     R4                      ; 65FA   014C
        CMPR    R1,     R4                      ; 65FB   014C
        CMPR    R1,     R4                      ; 65FC   014C
        AND@    R6,     R4                      ; 65FD   03B4
        AND@    R5,     R4                      ; 65FE   03AC
        AND@    R4,     R4                      ; 65FF   03A4
        ANDI    #$014C, R4                      ; 6600   03BC 014C
        CMP@    R6,     R4                      ; 6602   0374
        AND@    R1,     R4                      ; 6603   038C
        SUB     .BTAB.24,R0                     ; 6604   0300 0224
        CMPR    R1,     R4                      ; 6606   014C
        CMPR    R1,     R4                      ; 6607   014C
        CMPR    R1,     R4                      ; 6608   014C
        CMPR    R1,     R4                      ; 6609   014C
        SUB@    R6,     R4                      ; 660A   0334
        CMPR    R1,     R4                      ; 660B   014C
        DECLE   $021C                           ; 660C   021C

        CMP     G_0344, R4                      ; 660D   0344 0344
        CMP     G_0344, R4                      ; 660F   0344 0344
        AND@    R4,     R4                      ; 6611   03A4
        ANDI    #$014C, R4                      ; 6612   03BC 014C
        CMPR    R1,     R4                      ; 6614   014C
        CMPR    R1,     R4                      ; 6615   014C
        CMPR    R1,     R4                      ; 6616   014C
        CMPR    R1,     R4                      ; 6617   014C
        CMPR    R1,     R4                      ; 6618   014C
        DECLE   $021C                           ; 6619   021C

        CMP     G_0344, R4                      ; 661A   0344 0344
        CMP     G_0344, R4                      ; 661C   0344 0344
        DECLE   $0000,  $0000,  $0000,  $0000   ; 661E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6622   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6626   0000 0000 0000

        SAR     R0,     2                       ; 6629   006C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 662A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 662E   0000 0000 0000 0000

        CMP@    R1,     R4                      ; 6632   034C
        ADCR    R4                              ; 6633   002C
        DECLE   $0000                           ; 6634   0000

        NEGR    R4                              ; 6635   0024
        CMP@    R1,     R4                      ; 6636   034C
        CMP@    R1,     R4                      ; 6637   034C
        CMP@    R1,     R4                      ; 6638   034C
        DECLE   $021C,  $0000                   ; 6639   021C 0000
L_663B:
        NEGR    R4                              ; 663B   0024
        CMPR    R1,     R4                      ; 663C   014C
        CMPR    R1,     R4                      ; 663D   014C
        CMPR    R1,     R4                      ; 663E   014C
        CMPR    R1,     R4                      ; 663F   014C
        CMPR    R1,     R4                      ; 6640   014C
        CMPR    R1,     R4                      ; 6641   014C
        CMPR    R1,     R4                      ; 6642   014C
        MVO@    R4,     R3                      ; 6643   025C
        MVO@    R4,     R4                      ; 6644   0264
        MVO@    R4,     R3                      ; 6645   025C
        MVO@    R4,     R4                      ; 6646   0264
        CMP@    R1,     R4                      ; 6647   034C
        CMP@    R1,     R4                      ; 6648   034C
        AND@    R6,     R4                      ; 6649   03B4
        AND@    R5,     R4                      ; 664A   03AC
        BEQ     L_62F0                          ; 664B   0224 035C

        SUBI    #$0264, R4                      ; 664D   033C 0264
        DECLE   $021C                           ; 664F   021C

        CMP     .BTAB.20,R4                     ; 6650   0344 0220
        CMP     .BTAB.20,R4                     ; 6652   0344 0220
        CMP     .BTAB.20,R4                     ; 6654   0344 0220
        CMP     .BTAB.04,R4                     ; 6656   0344 0204
        CMP@    R5,     R4                      ; 6658   036C
        BEQ     L_6877                          ; 6659   0204 021C

        CMP@    R5,     R4                      ; 665B   036C
        CMP     G_03A4, R4                      ; 665C   0344 03A4
        ANDI    #$034C, R4                      ; 665E   03BC 034C
        AND@    R6,     R4                      ; 6660   03B4
        AND@    R5,     R4                      ; 6661   03AC
        CMP@    R5,     R4                      ; 6662   036C
L_6663:
        BEQ     L_6965                          ; 6663   0204 0300

        SUB     G_0300, R0                      ; 6665   0300 0300
        SUB     G_0300, R0                      ; 6667   0300 0300
        SUB     G_0300, R0                      ; 6669   0300 0300
        BEQ     L_69D9                          ; 666B   0204 036C
        B       L_646A                          ; 666D   0220 0204

        CMP@    R5,     R4                      ; 666F   036C
        B       L_6371                          ; 6670   0220 0300
        B       L_634B                          ; 6672   0220 0328

        AND@    R4,     R4                      ; 6674   03A4
        ANDI    #$034C, R4                      ; 6675   03BC 034C
        AND@    R6,     R4                      ; 6677   03B4
        AND@    R5,     R4                      ; 6678   03AC
        B       L_637A                          ; 6679   0220 0300
        B       L_637C                          ; 667B   0220 0300
        B       L_637E                          ; 667D   0220 0300
        BEQ     L_6334                          ; 667F   0224 034C

        CMP@    R1,     R4                      ; 6681   034C
        BEQ     L_6337                          ; 6682   0224 034C

        CMP@    R1,     R4                      ; 6684   034C
        CMP@    R1,     R4                      ; 6685   034C
        CMP@    R1,     R4                      ; 6686   034C
        CMP@    R1,     R4                      ; 6687   034C
        SUB@    R5,     R4                      ; 6688   032C
        SUB     G_0300, R0                      ; 6689   0300 0300
        AND@    R4,     R4                      ; 668B   03A4
        ANDI    #$034C, R4                      ; 668C   03BC 034C
        CMP@    R1,     R4                      ; 668E   034C
        CMPR    R1,     R4                      ; 668F   014C
        CMP@    R1,     R4                      ; 6690   034C
        CMP@    R1,     R4                      ; 6691   034C
        CMP@    R1,     R4                      ; 6692   034C
        DECLE   $021C                           ; 6693   021C

        CMP@    R5,     R4                      ; 6694   036C
        SUB     G_034C, R0                      ; 6695   0300 034C
        CMP@    R1,     R4                      ; 6697   034C
        CMP@    R1,     R4                      ; 6698   034C
        CMP@    R1,     R4                      ; 6699   034C
        CMPR    R1,     R4                      ; 669A   014C
        CMP@    R1,     R4                      ; 669B   034C
        CMP@    R1,     R4                      ; 669C   034C
        MVO@    R4,     R3                      ; 669D   025C
        SUBI    #$033C, R4                      ; 669E   033C 033C
        SUBI    #$033C, R4                      ; 66A0   033C 033C
        SUBI    #$033C, R4                      ; 66A2   033C 033C
        SUBI    #$0354, R4                      ; 66A4   033C 0354
        DECLE   $021C                           ; 66A6   021C

        BEQ     L_648C                          ; 66A7   0224 021C

        SUB@    R4,     R4                      ; 66A9   0324
        DECLE   $021C                           ; 66AA   021C

        CMP     G_036C, R4                      ; 66AB   0344 036C
        CMP     .BTAB.00,R4                     ; 66AD   0344 0200
        CMP     G_036C, R4                      ; 66AF   0344 036C
L_66B1:
        BEQ     L_69C0                          ; 66B1   0204 030D

        SUB@    R2,     R0                      ; 66B3   0310
        BEQ     L_69C3                          ; 66B4   0204 030D

        SUB@    R2,     R0                      ; 66B6   0310
        BEQ     L_69C6                          ; 66B7   0204 030D

        SUB@    R2,     R0                      ; 66B9   0310
        BEQ     L_636F                          ; 66BA   0224 034C

        CMP@    R1,     R4                      ; 66BC   034C
        DECLE   $021C                           ; 66BD   021C

        BEQ     L_69C0                          ; 66BE   0204 0300

        CMP@    R5,     R4                      ; 66C0   036C
        SUB     .BTAB.20,R0                     ; 66C1   0300 0220
        SUB     G_036C, R0                      ; 66C3   0300 036C
        BEQ     L_69D4                          ; 66C5   0204 030D

        SUB@    R2,     R0                      ; 66C7   0310
        BEQ     L_69D7                          ; 66C8   0204 030D

        SUB@    R2,     R0                      ; 66CA   0310
        BEQ     L_69DA                          ; 66CB   0204 030D

L_66CD:
        SUB@    R2,     R0                      ; 66CD   0310
        CMP     G_036C, R4                      ; 66CE   0344 036C
        CMP     .BTAB.24,R4                     ; 66D0   0344 0224
        BEQ     L_6387                          ; 66D2   0224 034C

        CMPR    R1,     R4                      ; 66D4   014C
        CMPR    R1,     R4                      ; 66D5   014C
        CMPR    R1,     R4                      ; 66D6   014C
        CMP@    R1,     R4                      ; 66D7   034C
        CMP@    R1,     R4                      ; 66D8   034C
        AND@    R6,     R4                      ; 66D9   03B4
        AND@    R5,     R4                      ; 66DA   03AC
        SUB     .BTAB.20,R0                     ; 66DB   0300 0220
        SUB     G_0300, R0                      ; 66DD   0300 0300
        B       L_63E0                          ; 66DF   0220 0300

        AND     G_037C, R4                      ; 66E1   0384 037C
        CMPR    R1,     R4                      ; 66E3   014C
        CMPR    R1,     R4                      ; 66E4   014C
        MVO@    R4,     R3                      ; 66E5   025C
        CMP@    R1,     R4                      ; 66E6   034C
        CMP@    R1,     R4                      ; 66E7   034C
        DECLE   $021C                           ; 66E8   021C

        BLT     L_6A2F                          ; 66E9   0205 0344

        CMP     G_0344, R4                      ; 66EB   0344 0344
        AND@    R4,     R4                      ; 66ED   03A4
        ANDI    #$014C, R4                      ; 66EE   03BC 014C
        CMPR    R1,     R4                      ; 66F0   014C
        CMPR    R1,     R4                      ; 66F1   014C
        CMPR    R1,     R4                      ; 66F2   014C
        CMPR    R1,     R4                      ; 66F3   014C
        CMPR    R1,     R4                      ; 66F4   014C
        CMP@    R6,     R4                      ; 66F5   0374
        AND@    R1,     R4                      ; 66F6   038C
        BLT     L_69F9                          ; 66F7   0205 0300
        B       L_63B6                          ; 66F9   0220 0344

        CMP     .BTAB.04,R4                     ; 66FB   0344 0204
        B       L_63FE                          ; 66FD   0220 0300
        B       L_6700                          ; 66FF   0220 0000

        SUB     G_0344, R0                      ; 6701   0300 0344
        B       L_63C0                          ; 6703   0220 0344

        CMP@    R5,     R4                      ; 6705   036C
        B       L_63C3                          ; 6706   0220 0344

        CMP     G_0344, R4                      ; 6708   0344 0344
        SUB     .BTAB.20,R0                     ; 670A   0300 0220
L_670C:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 670C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6710   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6714   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6718   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 671C   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6720   0000 0000

        MVO@    R4,     R3                      ; 6722   025C
        SUBI    #$033C, R4                      ; 6723   033C 033C
        CMP@    R4,     R4                      ; 6725   0364
        CMPR    R1,     R4                      ; 6726   014C
        ADD     G_00CC, R4                      ; 6727   02C4 00CC
        CMPR    R1,     R4                      ; 6729   014C
        CMPR    R1,     R4                      ; 672A   014C
        CMPR    R1,     R4                      ; 672B   014C
        CMPR    R1,     R4                      ; 672C   014C
        CMPR    R1,     R4                      ; 672D   014C
        ADD@    R4,     R4                      ; 672E   02E4
L_672F:
        ADDR    R5,     R4                      ; 672F   00EC
        CMPR    R1,     R4                      ; 6730   014C
        CMPR    R1,     R4                      ; 6731   014C
        CMPR    R1,     R4                      ; 6732   014C
        CMPR    R1,     R4                      ; 6733   014C
        CMPR    R1,     R4                      ; 6734   014C
        CMPR    R1,     R4                      ; 6735   014C
        BEQ     L_6A38                          ; 6736   0204 0300

        SUB@    R4,     R4                      ; 6738   0324
        CMPR    R1,     R4                      ; 6739   014C
        ADD     .BTAB.CC,R4                     ; 673A   02C4 02CC
        CMPR    R1,     R4                      ; 673C   014C
        CMPR    R1,     R4                      ; 673D   014C
        ADD@    R2,     R4                      ; 673E   02D4
        XOR@    R3,     R4                      ; 673F   03DC
        CMPR    R1,     R4                      ; 6740   014C
        ADD@    R4,     R4                      ; 6741   02E4
        ADD@    R5,     R4                      ; 6742   02EC
        CMPR    R1,     R4                      ; 6743   014C
        CMPR    R1,     R4                      ; 6744   014C
        CMPR    R1,     R4                      ; 6745   014C
        ADD     G_03CC, R4                      ; 6746   02C4 03CC
        CMPR    R1,     R4                      ; 6748   014C
        DECLE   $021C                           ; 6749   021C

        COMR    R5                              ; 674A   001D
        NEGR    R4                              ; 674B   0024
        DECLE   $021C                           ; 674C   021C

        SUB     .STIC.C.5,R0                    ; 674D   0300 001D
        DECLE   $0234                           ; 674F   0234

        CMPR    R1,     R4                      ; 6750   014C
        ADD@    R2,     R4                      ; 6751   02D4
        ADD@    R3,     R4                      ; 6752   02DC
        CMPR    R1,     R4                      ; 6753   014C
        CMPR    R1,     R4                      ; 6754   014C
        CMPR    R1,     R4                      ; 6755   014C
        CMPR    R1,     R4                      ; 6756   014C
        CMPR    R1,     R4                      ; 6757   014C
        CMPR    R1,     R4                      ; 6758   014C
        ADD     .BTAB.CC,R4                     ; 6759   02C4 02CC
        CMPR    R1,     R4                      ; 675B   014C
        DECLE   $021C                           ; 675C   021C

        COMR    R5                              ; 675D   001D
        CMPR    R1,     R4                      ; 675E   014C
        CMPR    R1,     R4                      ; 675F   014C
        CMPR    R1,     R4                      ; 6760   014C
        CMPR    R1,     R4                      ; 6761   014C
        DECLE   $021C,  $0035                   ; 6762   021C 0035
L_6764:
        SUB     G_00D5, R0                      ; 6764   0300 00D5
        SUB     G_036C, R0                      ; 6766   0300 036C
        SUB     G_0300, R0                      ; 6768   0300 0300
        SUB     G_0300, R0                      ; 676A   0300 0300
        SUB     G_00C5, R0                      ; 676C   0300 00C5
        CMP@    R5,     R4                      ; 676E   036C
        SUB     .STIC.C.5,R0                    ; 676F   0300 001D
        DECLE   $0000                           ; 6771   0000

        SUB     G_0324, R0                      ; 6772   0300 0324
        CMPR    R1,     R4                      ; 6774   014C
        DECLE   $021C                           ; 6775   021C

        COMR    R5                              ; 6776   001D
        DECLE   $0000,  $0000                   ; 6777   0000 0000

        NEGR    R4                              ; 6779   0024
L_677A:
        CMPR    R1,     R4                      ; 677A   014C
        ADD     G_00CC, R4                      ; 677B   02C4 00CC
        CMPR    R1,     R4                      ; 677D   014C
        CMPR    R1,     R4                      ; 677E   014C
        CMPR    R1,     R4                      ; 677F   014C
        CMPR    R1,     R4                      ; 6780   014C
        CMPR    R1,     R4                      ; 6781   014C
        ADD@    R4,     R4                      ; 6782   02E4
        ADDR    R5,     R4                      ; 6783   00EC
        CMPR    R1,     R4                      ; 6784   014C
        CMPR    R1,     R4                      ; 6785   014C
        NEGR    R4                              ; 6786   0024
        CMPR    R1,     R4                      ; 6787   014C
        CMPR    R1,     R4                      ; 6788   014C
        CMPR    R1,     R4                      ; 6789   014C
L_678A:
        CMPR    R1,     R4                      ; 678A   014C
        ADD@    R4,     R4                      ; 678B   02E4
L_678C:
        ADDR    R5,     R4                      ; 678C   00EC
        CMPR    R1,     R4                      ; 678D   014C
        ADD     .BTAB.CC,R4                     ; 678E   02C4 02CC
        CMPR    R1,     R4                      ; 6790   014C
        CMPR    R1,     R4                      ; 6791   014C
        ADD@    R2,     R4                      ; 6792   02D4
L_6793:
        XOR@    R3,     R4                      ; 6793   03DC
        CMPR    R1,     R4                      ; 6794   014C
        ADD@    R4,     R4                      ; 6795   02E4
        ADD@    R5,     R4                      ; 6796   02EC
L_6797:
        CMPR    R1,     R4                      ; 6797   014C
        CMPR    R1,     R4                      ; 6798   014C
        DECLE   $021C,  $021C                   ; 6799   021C 021C

        SUB     G_036C, R0                      ; 679B   0300 036C
        DECLE   $0234                           ; 679D   0234

        ADD@    R4,     R4                      ; 679E   02E4
        ADD@    R5,     R4                      ; 679F   02EC
        CMPR    R1,     R4                      ; 67A0   014C
        CMPR    R1,     R4                      ; 67A1   014C
        CMPR    R1,     R4                      ; 67A2   014C
        CMPR    R1,     R4                      ; 67A3   014C
        CMPR    R1,     R4                      ; 67A4   014C
        ADD@    R2,     R4                      ; 67A5   02D4
        ADD@    R3,     R4                      ; 67A6   02DC
        CMPR    R1,     R4                      ; 67A7   014C
        CMPR    R1,     R4                      ; 67A8   014C
        CMPR    R1,     R4                      ; 67A9   014C
        CMPR    R1,     R4                      ; 67AA   014C
        CMPR    R1,     R4                      ; 67AB   014C
        DECLE   $021C                           ; 67AC   021C

        COMR    R5                              ; 67AD   001D
        BEQ     L_6663                          ; 67AE   0224 014C

        CMPR    R1,     R4                      ; 67B0   014C
        BNEQ    L_66CD                          ; 67B1   022C 00E5

        SUB     G_0300, R0                      ; 67B3   0300 0300
        CMP@    R5,     R4                      ; 67B5   036C
        SUB     G_0300, R0                      ; 67B6   0300 0300
        SUB     G_00D5, R0                      ; 67B8   0300 00D5
        SUB     G_0300, R0                      ; 67BA   0300 0300
        SUB     G_0300, R0                      ; 67BC   0300 0300
L_67BE:
        CMP@    R5,     R4                      ; 67BE   036C
        SUB     .STIC.C.5,R0                    ; 67BF   0300 001D
        DECLE   $0000                           ; 67C1   0000

        MVO@    R4,     R3                      ; 67C2   025C
        SUBI    #$0254, R4                      ; 67C3   033C 0254
        ADD@    R4,     R4                      ; 67C5   02E4
        ADDR    R5,     R4                      ; 67C6   00EC
        AND@    R6,     R4                      ; 67C7   03B4
        AND@    R5,     R4                      ; 67C8   03AC
        CMP@    R5,     R4                      ; 67C9   036C
L_67CA:
        SUB@    R4,     R0                      ; 67CA   0320
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67CB   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 67CF   0000 0000

        SUB@    R5,     R0                      ; 67D1   0328
        CMP@    R5,     R4                      ; 67D2   036C
        AND     G_037C, R4                      ; 67D3   0384 037C
        CMPR    R1,     R4                      ; 67D5   014C
        COMR    R5                              ; 67D6   001D
        DECLE   $0000,  $0035                   ; 67D7   0000 0035

        ADDR    R4,     R5                      ; 67D9   00E5
        SUB     G_03A4, R0                      ; 67DA   0300 03A4
        ANDI    #$014C, R4                      ; 67DC   03BC 014C
        CMPR    R1,     R4                      ; 67DE   014C
        ADD@    R4,     R4                      ; 67DF   02E4
        ADDR    R5,     R4                      ; 67E0   00EC
        CMPR    R1,     R4                      ; 67E1   014C
        CMPR    R1,     R4                      ; 67E2   014C
        ADD     G_00CC, R4                      ; 67E3   02C4 00CC
        CMPR    R1,     R4                      ; 67E5   014C
        CMPR    R1,     R4                      ; 67E6   014C
        CMP@    R6,     R4                      ; 67E7   0374
        AND@    R1,     R4                      ; 67E8   038C
        SUB     .STIC.X.0,R0                    ; 67E9   0300 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67EB   0000 0000 0000 0000

        SUB@    R5,     R0                      ; 67EF   0328
        SUB     G_0300, R0                      ; 67F0   0300 0300
L_67F2:
        SUB     .STIC.C.5,R0                    ; 67F2   0300 001D
        SUB     G_036C, R0                      ; 67F4   0300 036C
        SUB     .STIC.C.5,R0                    ; 67F6   0300 001D
        SUB     G_0300, R0                      ; 67F8   0300 0300
        SUB     G_0300, R0                      ; 67FA   0300 0300
        SUB@    R4,     R0                      ; 67FC   0320
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67FD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6801   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6805   0000 0000 0000 0000

        SAR     R0,     2                       ; 6809   006C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 680A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 680E   0000 0000 0000

        CLRC                                    ; 6811   0006
        SUBI    #$0338, R0                      ; 6812   0338 0338
        SUBI    #$0338, R0                      ; 6814   0338 0338
        NEGR    R4                              ; 6816   0024
        MVO@    R4,     R3                      ; 6817   025C
        SUBI    #$033C, R4                      ; 6818   033C 033C
        SUBI    #$0264, R4                      ; 681A   033C 0264
        CMPR    R1,     R4                      ; 681C   014C
        CMPR    R1,     R4                      ; 681D   014C
        ADD     G_00CC, R4                      ; 681E   02C4 00CC
        CMPR    R1,     R4                      ; 6820   014C
        CMPR    R1,     R4                      ; 6821   014C
        CMPR    R1,     R4                      ; 6822   014C
L_6823:
        CMPR    R1,     R4                      ; 6823   014C
        CMPR    R1,     R4                      ; 6824   014C
        ADCR    R4                              ; 6825   002C
        CMPR    R1,     R4                      ; 6826   014C
        CMPR    R1,     R4                      ; 6827   014C
        ADD     G_03CC, R4                      ; 6828   02C4 03CC
        CMPR    R1,     R4                      ; 682A   014C
        AND@    R6,     R4                      ; 682B   03B4
        AND@    R5,     R4                      ; 682C   03AC
        SUB     G_0324, R0                      ; 682D   0300 0324
        DECLE   $021C                           ; 682F   021C

        CMP     G_0344, R4                      ; 6830   0344 0344
        ADD@    R2,     R4                      ; 6832   02D4
        CMP     G_0344, R4                      ; 6833   0344 0344
        CMP     G_0344, R4                      ; 6835   0344 0344
        AND     G_037C, R4                      ; 6837   0384 037C
        CMPR    R1,     R4                      ; 6839   014C
        CMP     G_0344, R4                      ; 683A   0344 0344
        ADD@    R2,     R4                      ; 683C   02D4
        CMP     G_0344, R4                      ; 683D   0344 0344
        AND@    R4,     R4                      ; 683F   03A4
        AND@    R3,     R4                      ; 6840   039C
        AND@    R5,     R4                      ; 6841   03AC
        CMP@    R5,     R4                      ; 6842   036C
        BEQ     L_6B45                          ; 6843   0204 0300

        SUB     .BTAB.DC,R0                     ; 6845   0300 02DC
        SUB     G_0300, R0                      ; 6847   0300 0300
        SUB     G_0384, R0                      ; 6849   0300 0384
        AND@    R2,     R4                      ; 684B   0394
        AND@    R1,     R4                      ; 684C   038C
        CMP     G_0300, R4                      ; 684D   0344 0300
        SUB     .BTAB.DC,R0                     ; 684F   0300 02DC
        SUB     G_0300, R0                      ; 6851   0300 0300
        SUB     G_03A4, R0                      ; 6853   0300 03A4
        ANDI    #$014C, R4                      ; 6855   03BC 014C
        AND@    R6,     R4                      ; 6857   03B4
        AND@    R5,     R4                      ; 6858   03AC
        SUB     G_036C, R0                      ; 6859   0300 036C
        SUB     G_0384, R0                      ; 685B   0300 0384
        CMPI    #$0374, R4                      ; 685D   037C 0374
L_685F:
        AND@    R1,     R4                      ; 685F   038C
        SUB@    R4,     R0                      ; 6860   0320
        SUB     G_014C, R0                      ; 6861   0300 014C
        CMPR    R1,     R4                      ; 6863   014C
        CMPR    R1,     R4                      ; 6864   014C
        CMPR    R1,     R4                      ; 6865   014C
        SUB@    R5,     R4                      ; 6866   032C
        SUB     G_0300, R0                      ; 6867   0300 0300
        CMP     G_0344, R4                      ; 6869   0344 0344
        AND@    R4,     R4                      ; 686B   03A4
        AND@    R3,     R4                      ; 686C   039C
        AND@    R5,     R4                      ; 686D   03AC
        CMP@    R5,     R4                      ; 686E   036C
        AND     G_0394, R4                      ; 686F   0384 0394
        AND@    R1,     R4                      ; 6871   038C
        CMP@    R5,     R4                      ; 6872   036C
        SUB@    R4,     R0                      ; 6873   0320
        DECLE   $0000                           ; 6874   0000

        SUB     G_014C, R0                      ; 6875   0300 014C
L_6877:
        ADD     G_03CC, R4                      ; 6877   02C4 03CC
        CMPR    R1,     R4                      ; 6879   014C
        ADD     G_03CC, R4                      ; 687A   02C4 03CC
        CMPR    R1,     R4                      ; 687C   014C
        CMPR    R1,     R4                      ; 687D   014C
        CMPR    R1,     R4                      ; 687E   014C
        SUB@    R5,     R4                      ; 687F   032C
        AND@    R4,     R4                      ; 6880   03A4
        ANDI    #$014C, R4                      ; 6881   03BC 014C
        CMP@    R6,     R4                      ; 6883   0374
        AND@    R1,     R4                      ; 6884   038C
        SUB     G_036C, R0                      ; 6885   0300 036C
        CMPR    R1,     R4                      ; 6887   014C
        CMPR    R1,     R4                      ; 6888   014C
        CMPR    R1,     R4                      ; 6889   014C
        CMP     .BTAB.D4,R4                     ; 688A   0344 02D4
        CMP     G_0344, R4                      ; 688C   0344 0344
        ADD@    R2,     R4                      ; 688E   02D4
        CMP     G_0344, R4                      ; 688F   0344 0344
        CMP     .BTAB.34,R4                     ; 6891   0344 0234
        CMPR    R1,     R4                      ; 6893   014C
L_6894:
        CMPR    R1,     R4                      ; 6894   014C
        ADD     G_03CC, R4                      ; 6895   02C4 03CC
        CMPR    R1,     R4                      ; 6897   014C
        ADD     G_03CC, R4                      ; 6898   02C4 03CC
        CMPR    R1,     R4                      ; 689A   014C
        DECLE   $021C                           ; 689B   021C

        CMP@    R5,     R4                      ; 689C   036C
        CMP     G_0300, R4                      ; 689D   0344 0300
        ADD@    R3,     R4                      ; 689F   02DC
        SUB     G_0300, R0                      ; 68A0   0300 0300
        ADD@    R3,     R4                      ; 68A2   02DC
        SUB     G_0300, R0                      ; 68A3   0300 0300
        SUB     .BTAB.04,R0                     ; 68A5   0300 0204
        CMP     G_0344, R4                      ; 68A7   0344 0344
        ADD@    R2,     R4                      ; 68A9   02D4
        CMP     G_0344, R4                      ; 68AA   0344 0344
        ADD@    R2,     R4                      ; 68AC   02D4
        CMP     G_0344, R4                      ; 68AD   0344 0344
        BEQ     L_6764                          ; 68AF   0224 014C

        CMPR    R1,     R4                      ; 68B1   014C
        CMPR    R1,     R4                      ; 68B2   014C
        CMPR    R1,     R4                      ; 68B3   014C
        CMPR    R1,     R4                      ; 68B4   014C
        CMPR    R1,     R4                      ; 68B5   014C
        CMPR    R1,     R4                      ; 68B6   014C
        CMPR    R1,     R4                      ; 68B7   014C
        CMPR    R1,     R4                      ; 68B8   014C
        CMPR    R1,     R4                      ; 68B9   014C
        BNEQ    L_65BB                          ; 68BA   022C 0300

        SUB     .BTAB.DC,R0                     ; 68BC   0300 02DC
        SUB     G_0300, R0                      ; 68BE   0300 0300
        ADD@    R3,     R4                      ; 68C0   02DC
        AND     G_037C, R4                      ; 68C1   0384 037C
        CMPR    R1,     R4                      ; 68C3   014C
        CMPR    R1,     R4                      ; 68C4   014C
        CMPR    R1,     R4                      ; 68C5   014C
        CMP     G_0344, R4                      ; 68C6   0344 0344
        CMP     G_0344, R4                      ; 68C8   0344 0344
        CMP     G_0344, R4                      ; 68CA   0344 0344
        CMP     .BTAB.34,R4                     ; 68CC   0344 0234
        CMPR    R1,     R4                      ; 68CE   014C
        CMPR    R1,     R4                      ; 68CF   014C
        CMPR    R1,     R4                      ; 68D0   014C
        CMPR    R1,     R4                      ; 68D1   014C
        CMPR    R1,     R4                      ; 68D2   014C
        CMPR    R1,     R4                      ; 68D3   014C
        CMPR    R1,     R4                      ; 68D4   014C
        CMP@    R6,     R4                      ; 68D5   0374
        AND@    R1,     R4                      ; 68D6   038C
        CMP     G_0344, R4                      ; 68D7   0344 0344
        CMP     .STIC.X.0,R4                    ; 68D9   0344 0000
L_68DB:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68DB   0000 0000 0000 0000
L_68DF:
        DECLE   $0000,  $0000,  $0228           ; 68DF   0000 0000 0228

        CMP     G_0344, R4                      ; 68E2   0344 0344
        CMP     G_036C, R4                      ; 68E4   0344 036C
        CMP     G_0344, R4                      ; 68E6   0344 0344
L_68E8:
        CMP     G_0344, R4                      ; 68E8   0344 0344
        SUB     G_0320, R0                      ; 68EA   0300 0320
        DECLE   $0000,  $0000,  $0000           ; 68EC   0000 0000 0000
L_68EF:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68EF   0000 0000 0000 0000
L_68F3:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68F3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68F7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68FB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68FF   0000 0000 0000 0000
L_6903:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6903   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6907   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 690B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 690F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6913   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6917   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 691B   0000 0000 0000
L_691E:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 691E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6922   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6926   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 692A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 692E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6932   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6936   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 693A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 693E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6942   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6946   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 694A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 694E   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6952   0000 0000
L_6954:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6954   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6958   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 695C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6960   0000 0000 0000 0000
        DECLE   $0000                           ; 6964   0000
L_6965:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6965   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6969   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 696D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6971   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6975   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6979   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 697D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6981   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6985   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6989   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 698D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6991   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6995   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6999   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 699D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69A1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69A5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69A9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69AD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69B1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69B5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69B9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 69BD   0000 0000 0000
L_69C0:
        DECLE   $0000,  $0000,  $0000           ; 69C0   0000 0000 0000
L_69C3:
        DECLE   $0000,  $0000                   ; 69C3   0000 0000
L_69C5:
        DECLE   $0000                           ; 69C5   0000
L_69C6:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69C6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69CA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69CE   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 69D2   0000 0000
L_69D4:
        DECLE   $0000,  $0000,  $0000           ; 69D4   0000 0000 0000
L_69D7:
        DECLE   $0000,  $0000                   ; 69D7   0000 0000
L_69D9:
        DECLE   $0000                           ; 69D9   0000
L_69DA:
        DECLE   $0000,  $0000                   ; 69DA   0000 0000
L_69DC:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69DC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69EC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F0   0000 0000 0000 0000
L_69F4:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F4   0000 0000 0000 0000
        DECLE   $0000                           ; 69F8   0000
L_69F9:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69FD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A01   0000 0000 0000 0000
L_6A05:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A29   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6A2D   0000 0000
L_6A2F:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A2F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A33   0000 0000 0000 0000
        DECLE   $0000                           ; 6A37   0000
L_6A38:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A60   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A64   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A68   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A6C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A70   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A7C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ABC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ACC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AD4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AD8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ADC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AFC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B00   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B04   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B08   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B20   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B28   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B2C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B30   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B40   0000 0000 0000 0000
        DECLE   $0000                           ; 6B44   0000
L_6B45:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6BE9   0000 0000 0000
L_6BEC:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BFC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C00   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C04   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C08   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C20   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C28   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C2C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C30   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C60   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C64   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C68   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C6C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C70   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C7C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CBC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CCC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CD4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CD8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CDC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CFC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D00   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D04   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D08   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D20   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D28   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D2C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D30   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D60   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D64   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D68   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D6C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D70   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D7C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DBC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DCC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DD4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DD8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DDC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DFC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E00   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E04   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E08   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E20   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E28   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E2C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E30   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E60   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E64   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E68   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E6C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E70   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E7C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EBC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ECC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ED0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ED4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ED8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EDC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EFC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F00   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F04   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F08   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F20   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F28   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F2C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F30   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F60   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F64   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F68   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F6C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F70   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F7C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FBC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FCC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FDC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FFC   0000 0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;; ======================================================================== ;;
