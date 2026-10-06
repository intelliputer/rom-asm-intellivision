
        ORG     $5000
.HEADER:
        ADDR    R6,     R3                      ; 5000   00F3
        MOVR    R2,     R4                      ; 5001   0094
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
        NEGR    R0                              ; 500E   0020
        DECLE   $0000                           ; 500F   0000
L_5010:
        CLRR    R0                              ; 5010   01C0
        MVO     R0,     G_0102                  ; 5011   0240 0102
        MVII    #$02F1, R6                      ; 5013   02BE 02F1

        JSR     R5,     L_51A9                  ; 5015   0004 0150 01A9

        ADDR    R4,     R1                      ; 5018   00E1
        SLR     R2,     2                       ; 5019   0066
        MVII    #$00EB, R0                      ; 501A   02B8 00EB
        MVII    #$0104, R4                      ; 501C   02BC 0104

        JSR     R5,     X_FILL_ZERO             ; 501E   0004 0114 0338
        JSR     R5,     L_5A9C                  ; 5021   0004 0158 029C

L_5024:
        EIS                                     ; 5024   0002
        MVI     G_0102, R0                      ; 5025   0280 0102
        DECR    R0                              ; 5027   0010
        BPL     L_5024                          ; 5028   0223 0005

        MVII    #$0002, R0                      ; 502A   02B8 0002
        MVO     R0,     G_0102                  ; 502C   0240 0102

        JSR     R5,     X_RAND1                 ; 502E   0004 0114 027D

        MVI     G_0115, R0                      ; 5031   0280 0115
        DECR    R0                              ; 5033   0010
        MVO     R0,     G_0115                  ; 5034   0240 0115

        JSR     R5,     L_5044                  ; 5036   0004 0150 0044
        JSR     R5,     L_6084                  ; 5039   0004 0160 0084
        JSR     R5,     L_6878                  ; 503C   0004 0168 0078
        JSR     R5,     L_5B4F                  ; 503F   0004 0158 034F

        B       L_5024                          ; 5042   0220 001F

L_5044:
        MVII    #$00FF, R4                      ; 5044   02BC 00FF
        MVII    #$01FE, R2                      ; 5046   02BA 01FE
        MVI@    R2,     R0                      ; 5048   0290
        AND     .PSG0.lft_hand,R0               ; 5049   0380 01FF
        CMPR    R4,     R0                      ; 504B   0160
        BNEQ    L_5058                          ; 504C   020C 000A

        MVI     G_0116, R0                      ; 504E   0280 0116
        DECR    R0                              ; 5050   0010
        BMI     L_513C                          ; 5051   020B 00E9
        BEQ     L_5065                          ; 5053   0204 0010

        MVO     R0,     G_0116                  ; 5055   0240 0116
        MOVR    R5,     R7                      ; 5057   00AF
L_5058:
        CLRR    R1                              ; 5058   01C9
        MVI@    R2,     R0                      ; 5059   0290
        CMPR    R4,     R0                      ; 505A   0160
        BEQ     L_505E                          ; 505B   0204 0001

        INCR    R1                              ; 505D   0009
L_505E:
        MVO     R1,     G_0105                  ; 505E   0241 0105
        MVII    #$0003, R0                      ; 5060   02B8 0003
        MVO     R0,     G_0116                  ; 5062   0240 0116
        MOVR    R5,     R7                      ; 5064   00AF

L_5065:
        JSR     R5,     L_51A9                  ; 5065   0004 0150 01A9

        ADDR    R4,     R1                      ; 5068   00E1
        SLR     R2,     2                       ; 5069   0066

        JSR     R5,     L_5BA2                  ; 506A   0004 0158 03A2
        JSR     R5,     L_5BBF                  ; 506D   0004 0158 03BF

L_5070:
        EIS                                     ; 5070   0002
        MVI     G_0102, R0                      ; 5071   0280 0102
        DECR    R0                              ; 5073   0010
        BPL     L_5070                          ; 5074   0223 0005

        JSR     R5,     L_56FC                  ; 5076   0004 0154 02FC
        JSR     R5,     L_5301                  ; 5079   0004 0150 0301
        JSR     R5,     L_62FA                  ; 507C   0004 0160 02FA
        JSR     R5,     L_6084                  ; 507F   0004 0160 0084
        JSR     R5,     L_6878                  ; 5082   0004 0168 0078

        MVII    #$0001, R0                      ; 5085   02B8 0001

        JSR     R5,     X_RAND1                 ; 5087   0004 0114 027D
        JSR     R5,     L_51E8                  ; 508A   0004 0150 01E8
        JSR     R5,     L_5152                  ; 508D   0004 0150 0152

        CLRR    R1                              ; 5090   01C9
        MVO     R1,     G_019A                  ; 5091   0241 019A
        MVI     G_0103, R1                      ; 5093   0281 0103
        MVO     R1,     G_0102                  ; 5095   0241 0102
        B       L_5070                          ; 5097   0220 0028

L_5099:
        MVI@    R5,     R3                      ; 5099   02AB
L_509A:
        MVI@    R5,     R2                      ; 509A   02AA
        SDBD                                    ; 509B   0001
        MVI@    R5,     R1                      ; 509C   02A9
L_509D:
        MVI@    R3,     R0                      ; 509D   0298
        CMPR    R1,     R0                      ; 509E   0148
        BLT     L_50A8                          ; 509F   0205 0007

        ADDR    R2,     R1                      ; 50A1   00D1
        ADDI    #$0010, R0                      ; 50A2   02F8 0010
        CMPR    R1,     R0                      ; 50A4   0148
        BLT     L_50A9                          ; 50A5   0205 0002

        SUBR    R2,     R1                      ; 50A7   0111
L_50A8:
        MOVR    R1,     R0                      ; 50A8   0088
L_50A9:
        MOVR    R5,     R7                      ; 50A9   00AF
        MVI@    R5,     R3                      ; 50AA   02AB
L_50AB:
        MVI@    R5,     R2                      ; 50AB   02AA
        SDBD                                    ; 50AC   0001
        MVI@    R5,     R1                      ; 50AD   02A9
        MVI@    R3,     R0                      ; 50AE   0298
        SUBI    #$0010, R0                      ; 50AF   0338 0010
        CMPR    R1,     R0                      ; 50B1   0148
        BGE     L_50A9                          ; 50B2   022D 000A

        SUBR    R2,     R1                      ; 50B4   0111
        ADDR    R2,     R1                      ; 50B5   00D1
        MOVR    R1,     R0                      ; 50B6   0088
        MOVR    R5,     R7                      ; 50B7   00AF
L_50B8:
        SDBD                                    ; 50B8   0001
        MVI@    R5,     R1                      ; 50B9   02A9
        SDBD                                    ; 50BA   0001
        MVI@    R5,     R2                      ; 50BB   02AA
        SDBD                                    ; 50BC   0001
        MVI@    R5,     R0                      ; 50BD   02A8
        MVO@    R1,     R4                      ; 50BE   0261
        PSHR    R4                              ; 50BF   0274
        ADDI    #$0007, R4                      ; 50C0   02FC 0007
        MVO@    R2,     R4                      ; 50C2   0262
        ADDI    #$0007, R4                      ; 50C3   02FC 0007
        MVO@    R0,     R4                      ; 50C5   0260
        PULR    R4                              ; 50C6   02B4
        MOVR    R5,     R7                      ; 50C7   00AF
L_50C8:
        PSHR    R5                              ; 50C8   0275
        SLL     R1,     1                       ; 50C9   0049

        JSR     R5,     L_50EF                  ; 50CA   0004 0150 00EF
        DECLE   $0000,  $0000                   ; 50CD   0000 0000

        ADDR    R5,     R0                      ; 50CF   00E8
        ADDR    R7,     R7                      ; 50D0   00FF
        ADDR    R2,     R3                      ; 50D1   00D3
        ADDR    R7,     R7                      ; 50D2   00FF
        ADDR    R0,     R5                      ; 50D3   00C5
        ADDR    R7,     R7                      ; 50D4   00FF
        ADDR    R0,     R0                      ; 50D5   00C0
        ADDR    R7,     R7                      ; 50D6   00FF
        ADDR    R0,     R5                      ; 50D7   00C5
        ADDR    R7,     R7                      ; 50D8   00FF
        ADDR    R2,     R3                      ; 50D9   00D3
        ADDR    R7,     R7                      ; 50DA   00FF
        ADDR    R5,     R0                      ; 50DB   00E8
        ADDR    R7,     R7                      ; 50DC   00FF
        DECLE   $0000,  $0000                   ; 50DD   0000 0000

        COMR    R0                              ; 50DF   0018
        DECLE   $0000                           ; 50E0   0000

        ADCR    R5                              ; 50E1   002D
        DECLE   $0000                           ; 50E2   0000

        RSWD    R3                              ; 50E3   003B
        DECLE   $0000                           ; 50E4   0000

        SWAP    R0,     1                       ; 50E5   0040
        DECLE   $0000                           ; 50E6   0000

        RSWD    R3                              ; 50E7   003B
        DECLE   $0000                           ; 50E8   0000

        ADCR    R5                              ; 50E9   002D
        DECLE   $0000                           ; 50EA   0000

        COMR    R0                              ; 50EB   0018
        DECLE   $0000,  $0000,  $0000           ; 50EC   0000 0000 0000
L_50EF:
        ADDR    R1,     R5                      ; 50EF   00CD
        SDBD                                    ; 50F0   0001
        MVI@    R5,     R2                      ; 50F1   02AA
        SUBR    R1,     R5                      ; 50F2   010D
        ADDI    #$0016, R1                      ; 50F3   02F9 0016
        ANDI    #$001E, R1                      ; 50F5   03B9 001E
        ADDR    R1,     R5                      ; 50F7   00CD
        SDBD                                    ; 50F8   0001
        MVI@    R5,     R1                      ; 50F9   02A9
        CLRR    R3                              ; 50FA   01DB
        CLRR    R5                              ; 50FB   01ED
        SARC    R0,     1                       ; 50FC   0078
        BNC     L_5101                          ; 50FD   0209 0002

        ADDR    R2,     R3                      ; 50FF   00D3
        ADDR    R1,     R5                      ; 5100   00CD
L_5101:
        SLL     R1,     1                       ; 5101   0049
        SLL     R2,     1                       ; 5102   004A
        SARC    R0,     1                       ; 5103   0078
        BNC     L_5108                          ; 5104   0209 0002

        ADDR    R2,     R3                      ; 5106   00D3
        ADDR    R1,     R5                      ; 5107   00CD
L_5108:
        SLL     R1,     1                       ; 5108   0049
        SLL     R2,     1                       ; 5109   004A
        SARC    R0,     1                       ; 510A   0078
        BNC     L_510F                          ; 510B   0209 0002

        ADDR    R2,     R3                      ; 510D   00D3
        ADDR    R1,     R5                      ; 510E   00CD
L_510F:
        SLL     R1,     1                       ; 510F   0049
        SLL     R2,     1                       ; 5110   004A
        SARC    R0,     1                       ; 5111   0078
        BNC     L_5116                          ; 5112   0209 0002

        ADDR    R2,     R3                      ; 5114   00D3
        ADDR    R1,     R5                      ; 5115   00CD
L_5116:
        SAR     R3,     1                       ; 5116   006B
        MOVR    R5,     R0                      ; 5117   00A8
        SAR     R0,     1                       ; 5118   0068
        PULR    R7                              ; 5119   02B7
L_511A:
        MVII    #$01FE, R2                      ; 511A   02BA 01FE
        MVII    #$01FF, R3                      ; 511C   02BB 01FF
        MVII    #$00FF, R4                      ; 511E   02BC 00FF
L_5120:
        MVII    #$03FF, R1                      ; 5120   02B9 03FF
L_5122:
        MVI@    R3,     R0                      ; 5122   0298
        AND@    R2,     R0                      ; 5123   0390
        CMPR    R4,     R0                      ; 5124   0160
        BEQ     L_5120                          ; 5125   0224 0006

        DECR    R1                              ; 5127   0011
        BNEQ    L_5122                          ; 5128   022C 0007

        CLRR    R1                              ; 512A   01C9
        MVI@    R2,     R0                      ; 512B   0290
        CMPR    R4,     R0                      ; 512C   0160
        BEQ     L_5130                          ; 512D   0204 0001

        INCR    R1                              ; 512F   0009
L_5130:
        MVO     R1,     G_0105                  ; 5130   0241 0105
L_5132:
        MVII    #$03FF, R1                      ; 5132   02B9 03FF
L_5134:
        MVI@    R3,     R0                      ; 5134   0298
        AND@    R2,     R0                      ; 5135   0390
        CMPR    R4,     R0                      ; 5136   0160
        BNEQ    L_5132                          ; 5137   022C 0006

        DECR    R1                              ; 5139   0011
        BNEQ    L_5134                          ; 513A   022C 0007

L_513C:
        MOVR    R5,     R7                      ; 513C   00AF
L_513D:
        PSHR    R5                              ; 513D   0275
        CLRR    R5                              ; 513E   01ED
        MVII    #$01FE, R2                      ; 513F   02BA 01FE
        MVI     G_0105, R1                      ; 5141   0281 0105
        MVI     G_0197, R0                      ; 5143   0280 0197
        TSTR    R0                              ; 5145   0080
        BEQ     L_514A                          ; 5146   0204 0002

        MVI     G_0198, R1                      ; 5148   0281 0198
L_514A:
        ADDR    R1,     R2                      ; 514A   00CA
        MVI@    R2,     R0                      ; 514B   0290
        CMPI    #$009B, R0                      ; 514C   0378 009B
        BNEQ    L_5151                          ; 514E   020C 0001

        INCR    R5                              ; 5150   000D
L_5151:
        PULR    R7                              ; 5151   02B7
L_5152:
        MVI     G_0115, R0                      ; 5152   0280 0115
        DECR    R0                              ; 5154   0010
        MVO     R0,     G_0115                  ; 5155   0240 0115
        MVII    #$005A, R2                      ; 5157   02BA 005A
        CMP     .PSG0.rgt_hand,R2               ; 5159   0342 01FE
        BEQ     L_516C                          ; 515B   0204 000F

        CMP     .PSG0.lft_hand,R2               ; 515D   0342 01FF
        BEQ     L_516C                          ; 515F   0204 000B

        ANDI    #$007F, R0                      ; 5161   03B8 007F
        BNEQ    L_513C                          ; 5163   022C 0028

        MVI     G_0104, R0                      ; 5165   0280 0104
        DECR    R0                              ; 5167   0010
        MVO     R0,     G_0104                  ; 5168   0240 0104
        BNEQ    L_513C                          ; 516A   022C 002F

L_516C:
        PSHR    R5                              ; 516C   0275

        JSR     R5,     L_67A4                  ; 516D   0004 0164 03A4

        MVI     .STIC.BORD,R0                   ; 5170   0280 002C
        PSHR    R0                              ; 5172   0270
        CLRR    R0                              ; 5173   01C0
        MVO     R0,     .STIC.BORD              ; 5174   0240 002C

        JSR     R5,     L_51A9                  ; 5176   0004 0150 01A9

        RSWD    R4                              ; 5179   003C
        RLC     R1,     1                       ; 517A   0051
        MVII    #$01FB, R4                      ; 517B   02BC 01FB
        MOVR    R4,     R5                      ; 517D   00A5
        CLRR    R3                              ; 517E   01DB
        MVI@    R4,     R0                      ; 517F   02A0
        MVO@    R3,     R5                      ; 5180   026B
        MVI@    R4,     R1                      ; 5181   02A1
        MVO@    R3,     R5                      ; 5182   026B
        MVI@    R4,     R2                      ; 5183   02A2
        MVO@    R3,     R5                      ; 5184   026B
        PSHR    R0                              ; 5185   0270
        PSHR    R1                              ; 5186   0271
        PSHR    R2                              ; 5187   0272
L_5188:
        MVI     .PSG0.rgt_hand,R0               ; 5188   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 518A   0380 01FF
        CMPI    #$00FF, R0                      ; 518C   0378 00FF
        BNEQ    L_5188                          ; 518E   022C 0007

        JSR     R5,     L_511A                  ; 5190   0004 0150 011A
        JSR     R5,     L_67A4                  ; 5193   0004 0164 03A4

        PULR    R2                              ; 5196   02B2
        PULR    R1                              ; 5197   02B1
        PULR    R0                              ; 5198   02B0
        MVII    #$01FB, R5                      ; 5199   02BD 01FB
        MVO@    R0,     R5                      ; 519B   0268
        MVO@    R1,     R5                      ; 519C   0269
        MVO@    R2,     R5                      ; 519D   026A
        PULR    R0                              ; 519E   02B0
        MVO     R0,     .STIC.BORD              ; 519F   0240 002C
        MVO     R0,     .STIC.VIDEN             ; 51A1   0240 0020

        JSR     R5,     L_51A9                  ; 51A3   0004 0150 01A9

        ADDR    R4,     R1                      ; 51A6   00E1
        SLR     R2,     2                       ; 51A7   0066
        PULR    R7                              ; 51A8   02B7
L_51A9:
        MVI@    R5,     R0                      ; 51A9   02A8
        MVI@    R5,     R1                      ; 51AA   02A9
        MVO     R0,     .ISRVEC.0               ; 51AB   0240 0100
        MVO     R1,     .ISRVEC.1               ; 51AD   0241 0101
        MOVR    R5,     R7                      ; 51AF   00AF
        PSHR    R5                              ; 51B0   0275
        MOVR    R2,     R5                      ; 51B1   0095
        B       L_51D4                          ; 51B2   0200 0020

        SDBD                                    ; 51B4   0001
        MVI@    R5,     R2                      ; 51B5   02AA
        MVI@    R5,     R4                      ; 51B6   02AC
L_51B7:
        PSHR    R5                              ; 51B7   0275
        MOVR    R2,     R5                      ; 51B8   0095
        MOVR    R0,     R2                      ; 51B9   0082
        ANDI    #$000F, R2                      ; 51BA   03BA 000F
        SLL     R2,     1                       ; 51BC   004A
        SLR     R0,     2                       ; 51BD   0064
        SLR     R0,     2                       ; 51BE   0064
        SUBI    #$0022, R2                      ; 51BF   033A 0022
        SUBR    R2,     R7                      ; 51C1   0117
        PSHR    R5                              ; 51C2   0275
        MOVR    R2,     R5                      ; 51C3   0095
L_51C4:
        MVI@    R5,     R1                      ; 51C4   02A9
        MVO@    R1,     R4                      ; 51C5   0261
        MVI@    R5,     R1                      ; 51C6   02A9
        MVO@    R1,     R4                      ; 51C7   0261
        MVI@    R5,     R1                      ; 51C8   02A9
        MVO@    R1,     R4                      ; 51C9   0261
        MVI@    R5,     R1                      ; 51CA   02A9
        MVO@    R1,     R4                      ; 51CB   0261
        MVI@    R5,     R1                      ; 51CC   02A9
        MVO@    R1,     R4                      ; 51CD   0261
        MVI@    R5,     R1                      ; 51CE   02A9
        MVO@    R1,     R4                      ; 51CF   0261
        MVI@    R5,     R1                      ; 51D0   02A9
        MVO@    R1,     R4                      ; 51D1   0261
        MVI@    R5,     R1                      ; 51D2   02A9
        MVO@    R1,     R4                      ; 51D3   0261
L_51D4:
        MVI@    R5,     R1                      ; 51D4   02A9
        MVO@    R1,     R4                      ; 51D5   0261
        MVI@    R5,     R1                      ; 51D6   02A9
        MVO@    R1,     R4                      ; 51D7   0261
        MVI@    R5,     R1                      ; 51D8   02A9
        MVO@    R1,     R4                      ; 51D9   0261
        MVI@    R5,     R1                      ; 51DA   02A9
        MVO@    R1,     R4                      ; 51DB   0261
        MVI@    R5,     R1                      ; 51DC   02A9
        MVO@    R1,     R4                      ; 51DD   0261
        MVI@    R5,     R1                      ; 51DE   02A9
        MVO@    R1,     R4                      ; 51DF   0261
        MVI@    R5,     R1                      ; 51E0   02A9
        MVO@    R1,     R4                      ; 51E1   0261
        MVI@    R5,     R1                      ; 51E2   02A9
        MVO@    R1,     R4                      ; 51E3   0261
        DECR    R0                              ; 51E4   0010
        BPL     L_51C4                          ; 51E5   0223 0022

        PULR    R7                              ; 51E7   02B7
L_51E8:
        PSHR    R5                              ; 51E8   0275
        MVII    #$0080, R3                      ; 51E9   02BB 0080
        SDBD                                    ; 51EB   0001
        MVII    #$4300, R2                      ; 51EC   02BA 0000 0043
        MVII    #$010F, R4                      ; 51EF   02BC 010F
        MVII    #$0319, R5                      ; 51F1   02BD 0319
        MVI@    R4,     R0                      ; 51F3   02A0
        SWAP    R0,     1                       ; 51F4   0040
        XORR    R3,     R0                      ; 51F5   01D8
        ADDI    #$0002, R4                      ; 51F6   02FC 0002
        MVI@    R4,     R1                      ; 51F8   02A1
        XORR    R2,     R1                      ; 51F9   01D1
        INCR    R4                              ; 51FA   000C
        XOR@    R4,     R0                      ; 51FB   03E0
        MVO@    R1,     R5                      ; 51FC   0269
        MVO@    R1,     R5                      ; 51FD   0269
        ADDI    #$0006, R5                      ; 51FE   02FD 0006
        MVO@    R0,     R5                      ; 5200   0268
        MVO@    R0,     R5                      ; 5201   0268
        MVII    #$016D, R4                      ; 5202   02BC 016D
        MVII    #$031B, R5                      ; 5204   02BD 031B
L_5206:
        MVI@    R4,     R0                      ; 5206   02A0
        SWAP    R0,     1                       ; 5207   0040
        XORR    R3,     R0                      ; 5208   01D8
        ADDI    #$0002, R4                      ; 5209   02FC 0002
        MVI@    R4,     R1                      ; 520B   02A1
        XORR    R2,     R1                      ; 520C   01D1
        INCR    R4                              ; 520D   000C
        XOR@    R4,     R0                      ; 520E   03E0
        MVO@    R1,     R5                      ; 520F   0269
        ADDI    #$0007, R5                      ; 5210   02FD 0007
        MVO@    R0,     R5                      ; 5212   0268
        SUBI    #$0008, R5                      ; 5213   033D 0008
        ADDI    #$000A, R4                      ; 5215   02FC 000A
        CMPI    #$0320, R5                      ; 5217   037D 0320
        BLE     L_5206                          ; 5219   0226 0014

        PULR    R7                              ; 521B   02B7
L_521C:
        ANDI    #$000F, R1                      ; 521C   03B9 000F
        CMPI    #$000A, R1                      ; 521E   0379 000A
        BEQ     L_5235                          ; 5220   0204 0013

        CMPI    #$000B, R1                      ; 5222   0379 000B
        BNEQ    L_5232                          ; 5224   020C 000C

        JSR     R5,     L_513D                  ; 5226   0004 0150 013D

        TSTR    R5                              ; 5229   00AD
        BEQ     L_5232                          ; 522A   0204 0006

        MVI     G_01AB, R0                      ; 522C   0280 01AB
        XORI    #$0001, R0                      ; 522E   03F8 0001
        MVO     R0,     G_01AB                  ; 5230   0240 01AB
L_5232:
        J       L_563D                          ; 5232   0004 0354 023D

L_5235:
        JSR     R5,     L_513D                  ; 5235   0004 0150 013D

        TSTR    R5                              ; 5238   00AD
        BEQ     L_5232                          ; 5239   0224 0008
        J       L_56C0                          ; 523B   0004 0354 02C0

L_523E:
        MVI     G_0106, R3                      ; 523E   0283 0106
        MOVR    R3,     R1                      ; 5240   0099
        ANDI    #$0040, R1                      ; 5241   03B9 0040
        BNEQ    L_53A0                          ; 5243   020C 015B

        MOVR    R3,     R1                      ; 5245   0099
        ANDI    #$0080, R1                      ; 5246   03B9 0080
        BEQ     L_53A0                          ; 5248   0204 0156

        MVII    #$0197, R5                      ; 524A   02BD 0197
        CMPI    #$0011, R2                      ; 524C   037A 0011
        BEQ     L_5254                          ; 524E   0204 0004

        MVII    #$018B, R5                      ; 5250   02BD 018B
        ADD     G_0198, R5                      ; 5252   02C5 0198
L_5254:
        CLRR    R0                              ; 5254   01C0
        ANDI    #$000F, R3                      ; 5255   03BB 000F
        CMPI    #$000A, R3                      ; 5257   037B 000A
        BEQ     L_5276                          ; 5259   0204 001B

        CMPI    #$000B, R3                      ; 525B   037B 000B
        BEQ     L_527A                          ; 525D   0204 001B

        DECR    R3                              ; 525F   0013
        BMI     L_53A0                          ; 5260   020B 013E

        CMPI    #$0011, R2                      ; 5262   037A 0011
        MVII    #$0003, R4                      ; 5264   02BC 0003
        BNEQ    L_526A                          ; 5266   020C 0002

        MVII    #$0001, R4                      ; 5268   02BC 0001
L_526A:
        ANDR    R4,     R3                      ; 526A   01A3
        MOVR    R3,     R4                      ; 526B   009C
        INCR    R4                              ; 526C   000C
        MVO@    R4,     R5                      ; 526D   026C
        MVII    #$008E, R0                      ; 526E   02B8 008E
        SLL     R3,     2                       ; 5270   004F
        SLL     R3,     1                       ; 5271   004B
        ADDR    R3,     R0                      ; 5272   00D8
        MVO     R0,     .BTAB.95                ; 5273   0240 0295
        PULR    R7                              ; 5275   02B7
L_5276:
        MVO@    R0,     R5                      ; 5276   0268
        MVO     R0,     .BTAB.95                ; 5277   0240 0295
        PULR    R7                              ; 5279   02B7
L_527A:
        MVI@    R5,     R0                      ; 527A   02A8
        TSTR    R0                              ; 527B   0080
        BEQ     L_53A0                          ; 527C   0204 0122

        DECR    R5                              ; 527E   0015
        DECR    R0                              ; 527F   0010
        MVO@    R0,     R5                      ; 5280   0268
        CMPI    #$0021, R2                      ; 5281   037A 0021
        BNEQ    L_52B9                          ; 5283   020C 0034

        DECR    R5                              ; 5285   0015
        MOVR    R5,     R4                      ; 5286   00AC

        JSR     R5,     L_5292                  ; 5287   0004 0150 0292
        DECLE   $0000,  $0000                   ; 528A   0000 0000

        JSR     R4,     G_040B                  ; 528C   0004 0004 000B

        INCR    R3                              ; 528F   000B
        INCR    R7                              ; 5290   000F
        DECLE   $0000                           ; 5291   0000
L_5292:
        SLL     R0,     1                       ; 5292   0048
        ADDR    R0,     R5                      ; 5293   00C5
        MVI@    R5,     R1                      ; 5294   02A9
        MVO@    R1,     R4                      ; 5295   0261
        MVI@    R5,     R1                      ; 5296   02A9
        MVII    #$011E, R4                      ; 5297   02BC 011E
        ADD     G_0198, R4                      ; 5299   02C4 0198
        MVO@    R1,     R4                      ; 529B   0261
        MVO     R1,     G_011D                  ; 529C   0241 011D

        JSR     R5,     L_6AEF                  ; 529E   0004 0168 02EF

        MVI     G_0198, R1                      ; 52A1   0281 0198
        TSTR    R1                              ; 52A3   0089
        BNEQ    L_547F                          ; 52A4   020C 01D9

        MVI     G_0197, R1                      ; 52A6   0281 0197
        TSTR    R1                              ; 52A8   0089
        BEQ     L_547F                          ; 52A9   0204 01D4

        JSR     R5,     L_6B1E                  ; 52AB   0004 0168 031E

        MVII    #$0093, R0                      ; 52AE   02B8 0093
        MVO     R0,     .BTAB.71                ; 52B0   0240 0271
        CLRR    R0                              ; 52B2   01C0
        MVO     R0,     .BTAB.95                ; 52B3   0240 0295
        INCR    R0                              ; 52B5   0008
        MVO     R0,     G_0198                  ; 52B6   0240 0198
        PULR    R7                              ; 52B8   02B7
L_52B9:
        MVII    #$0200, R4                      ; 52B9   02BC 0200
        MVII    #$00F0, R0                      ; 52BB   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 52BD   0004 0114 0338

        MVII    #$0003, R3                      ; 52C0   02BB 0003
        MVII    #$026A, R4                      ; 52C2   02BC 026A

        JSR     R5,     X_PRINT_R5              ; 52C4   0004 0118 007B

        RLC     R0,     1                       ; 52C7   0050
        SAR     R0,     2                       ; 52C8   006C
        SLR     R1,     1                       ; 52C9   0061
        SARC    R1,     1                       ; 52CA   0079
        SLR     R1,     2                       ; 52CB   0065
        RRC     R2,     1                       ; 52CC   0072
        NEGR    R0                              ; 52CD   0020
        GSWD    R1                              ; 52CE   0031
        DECLE   $0000                           ; 52CF   0000

        MVII    #$0003, R3                      ; 52D0   02BB 0003
        MVII    #$0240, R4                      ; 52D2   02BC 0240

        JSR     R5,     X_PRINT_R5              ; 52D4   0004 0118 007B

        RLC     R3,     1                       ; 52D7   0053
        SLR     R1,     2                       ; 52D8   0065
        SAR     R0,     2                       ; 52D9   006C
        SLR     R1,     2                       ; 52DA   0065
        SLR     R3,     1                       ; 52DB   0063
        RRC     R0,     2                       ; 52DC   0074
        NEGR    R0                              ; 52DD   0020
        SAR     R0,     2                       ; 52DE   006C
        SLR     R1,     2                       ; 52DF   0065
        RRC     R2,     2                       ; 52E0   0076
        SLR     R1,     2                       ; 52E1   0065
        SAR     R0,     2                       ; 52E2   006C
        DECLE   $0000                           ; 52E3   0000

        MVII    #$0003, R3                      ; 52E4   02BB 0003
        MVII    #$02CA, R4                      ; 52E6   02BC 02CA

        JSR     R5,     X_PRINT_R5              ; 52E8   0004 0118 007B

        RRC     R0,     2                       ; 52EB   0074
        SAR     R0,     1                       ; 52EC   0068
        SLR     R1,     2                       ; 52ED   0065
        SAR     R2,     2                       ; 52EE   006E
        NEGR    R0                              ; 52EF   0020
        RRC     R0,     1                       ; 52F0   0070
        RRC     R2,     1                       ; 52F1   0072
        SLR     R1,     2                       ; 52F2   0065
        RRC     R3,     1                       ; 52F3   0073
        RRC     R3,     1                       ; 52F4   0073
        NEGR    R0                              ; 52F5   0020
        SLR     R1,     2                       ; 52F6   0065
        SAR     R2,     2                       ; 52F7   006E
        RRC     R0,     2                       ; 52F8   0074
        SLR     R1,     2                       ; 52F9   0065
        RRC     R2,     1                       ; 52FA   0072
        DECLE   $0000                           ; 52FB   0000

        MVII    #$0021, R0                      ; 52FC   02B8 0021
        MVO     R0,     G_012D                  ; 52FE   0240 012D
        PULR    R7                              ; 5300   02B7
L_5301:
        PSHR    R5                              ; 5301   0275
        MVI     G_012D, R1                      ; 5302   0281 012D
        MOVR    R1,     R2                      ; 5304   008A
        ANDI    #$0003, R1                      ; 5305   03B9 0003
        BEQ     L_53A1                          ; 5307   0204 0098

        MOVR    R2,     R1                      ; 5309   0091
        ANDI    #$0030, R1                      ; 530A   03B9 0030
L_530C:
        BNEQ    L_523E                          ; 530C   022C 00CF

        MOVR    R2,     R1                      ; 530E   0091
        ANDI    #$0004, R1                      ; 530F   03B9 0004
        BNEQ    L_545B                          ; 5311   020C 0148

        MOVR    R2,     R1                      ; 5313   0091
        ANDI    #$0008, R1                      ; 5314   03B9 0008
        BNEQ    L_55D7                          ; 5316   020C 02BF

        MOVR    R2,     R1                      ; 5318   0091
        ANDI    #$0002, R1                      ; 5319   03B9 0002
        BNEQ    L_533F                          ; 531B   020C 0022

        MVI     G_0115, R0                      ; 531D   0280 0115
        ANDI    #$000F, R0                      ; 531F   03B8 000F
        BNEQ    L_533F                          ; 5321   020C 001C

        MVII    #$000C, R0                      ; 5323   02B8 000C
        MVII    #$0204, R4                      ; 5325   02BC 0204

        JSR     R5,     X_FILL_ZERO             ; 5327   0004 0114 0338

        MVI     G_0115, R0                      ; 532A   0280 0115
L_532C:
        ANDI    #$001F, R0                      ; 532C   03B8 001F
        BNEQ    L_533F                          ; 532E   020C 000F

        MVII    #$0007, R3                      ; 5330   02BB 0007
        MVII    #$0207, R4                      ; 5332   02BC 0207

        JSR     R5,     X_PRINT_R5              ; 5334   0004 0118 007B

        SWAP    R2,     1                       ; 5337   0042
        SLL     R3,     2                       ; 5338   004F
L_5339:
        SLL     R2,     2                       ; 5339   004E
        RLC     R1,     2                       ; 533A   0055
        RLC     R3,     1                       ; 533B   0053
        NEGR    R1                              ; 533C   0021
        NEGR    R1                              ; 533D   0021
        DECLE   $0000                           ; 533E   0000
L_533F:
        MVI     G_0115, R1                      ; 533F   0281 0115
        ANDI    #$0007, R1                      ; 5341   03B9 0007
        BNEQ    L_53A0                          ; 5343   020C 005B

        MVI     G_015D, R0                      ; 5345   0280 015D
        DECR    R0                              ; 5347   0010
        MVO     R0,     G_015D                  ; 5348   0240 015D
        BEQ     L_5350                          ; 534A   0204 0004

        JSR     R5,     L_561A                  ; 534C   0004 0154 021A

        PULR    R7                              ; 534F   02B7
L_5350:
        CLRR    R0                              ; 5350   01C0
        MVI     G_012D, R1                      ; 5351   0281 012D
        ANDI    #$0002, R1                      ; 5353   03B9 0002
        MVO     R0,     G_012D                  ; 5355   0240 012D
        BNEQ    L_56C0                          ; 5357   020C 0367

        CLRR    R0                              ; 5359   01C0
        MVO     R0,     G_012D                  ; 535A   0240 012D
        INCR    R0                              ; 535C   0008
        MVO     R0,     G_0134                  ; 535D   0240 0134
        MVII    #$000C, R0                      ; 535F   02B8 000C
        MVII    #$0206, R4                      ; 5361   02BC 0206

        JSR     R5,     X_FILL_ZERO             ; 5363   0004 0114 0338
        JSR     R5,     L_5E02                  ; 5366   0004 015C 0202

        CLRR    R3                              ; 5369   01DB
        MVII    #$016D, R4                      ; 536A   02BC 016D
L_536C:
        CLRR    R1                              ; 536C   01C9
        MVO@    R1,     R4                      ; 536D   0261
        INCR    R3                              ; 536E   000B
        MOVR    R3,     R1                      ; 536F   0099

        JSR     R5,     L_6012                  ; 5370   0004 0160 0012

        ADDI    #$0002, R4                      ; 5373   02FC 0002

        JSR     R5,     L_537E                  ; 5375   0004 0150 037E

        TSTR    R0                              ; 5378   0080
        RSWD    R0                              ; 5379   0038
        RRC     R0,     1                       ; 537A   0070
        NEGR    R6                              ; 537B   0026
        RLC     R0,     1                       ; 537C   0050
        MOVR    R1,     R0                      ; 537D   0088
L_537E:
        ADDR    R3,     R5                      ; 537E   00DD
        MVI@    R5,     R1                      ; 537F   02A9
        MVO@    R1,     R4                      ; 5380   0261
        INCR    R4                              ; 5381   000C
        CLRR    R1                              ; 5382   01C9
        MVO@    R1,     R4                      ; 5383   0261
        MOVR    R3,     R1                      ; 5384   0099
        SLL     R1,     2                       ; 5385   004D
        SLL     R1,     1                       ; 5386   0049
        MVO@    R1,     R4                      ; 5387   0261
        ADDI    #$0009, R4                      ; 5388   02FC 0009
        CMPI    #$01CD, R4                      ; 538A   037C 01CD
        BLT     L_536C                          ; 538C   0225 0021

        MVII    #$0189, R1                      ; 538E   02B9 0189
        ADD     G_0198, R1                      ; 5390   02C1 0198
        MVI@    R1,     R0                      ; 5392   0288
        SLL     R0,     2                       ; 5393   004C
        ADDI    #$0011, R0                      ; 5394   02F8 0011
        CMPI    #$0048, R0                      ; 5396   0378 0048
        BLT     L_539C                          ; 5398   0205 0002

        MVII    #$0040, R0                      ; 539A   02B8 0040
L_539C:
        MVO     R0,     G_01CD                  ; 539C   0240 01CD
        CLRR    R0                              ; 539E   01C0
        MVO@    R0,     R1                      ; 539F   0248
L_53A0:
        PULR    R7                              ; 53A0   02B7
L_53A1:
        MVI     G_0134, R0                      ; 53A1   0280 0134
        TSTR    R0                              ; 53A3   0080
        BEQ     L_53DB                          ; 53A4   0204 0035

        MVI     G_0115, R0                      ; 53A6   0280 0115
        ANDI    #$000F, R0                      ; 53A8   03B8 000F
        BNEQ    L_53DB                          ; 53AA   020C 002F

        MVI     G_01CD, R0                      ; 53AC   0280 01CD
        DECR    R0                              ; 53AE   0010
        BMI     L_53BE                          ; 53AF   020B 000D

        MVO     R0,     G_01CD                  ; 53B1   0240 01CD
        PULR    R7                              ; 53B3   02B7
L_53B4:
        PSHR    R3                              ; 53B4   0273
        ADDI    #$0001, R3                      ; 53B5   02FB 0001
        MVI@    R3,     R0                      ; 53B7   0298
        PULR    R3                              ; 53B8   02B3
        ANDI    #$0080, R0                      ; 53B9   03B8 0080
        BNEQ    L_53C5                          ; 53BB   020C 0008

        PULR    R7                              ; 53BD   02B7
L_53BE:
        MVII    #$0172, R3                      ; 53BE   02BB 0172
L_53C0:
        MVI@    R3,     R0                      ; 53C0   0298
        CMPI    #$0068, R0                      ; 53C1   0378 0068
        BLT     L_53B4                          ; 53C3   0225 0010

L_53C5:
        ADDI    #$0010, R3                      ; 53C5   02FB 0010
        CMPI    #$01C7, R3                      ; 53C7   037B 01C7
        BLT     L_53C0                          ; 53C9   0225 000A

        CLRR    R0                              ; 53CB   01C0
        MVO     R0,     G_0134                  ; 53CC   0240 0134
        MVII    #$0003, R0                      ; 53CE   02B8 0003
        MVO     R0,     G_012D                  ; 53D0   0240 012D
        MVII    #$000E, R0                      ; 53D2   02B8 000E
        MVO     R0,     G_015D                  ; 53D4   0240 015D

        JSR     R5,     G_AC27                  ; 53D6   0004 01AC 0027

        DECR    R2                              ; 53D9   0012
        PULR    R7                              ; 53DA   02B7
L_53DB:
        MVI     G_0110, R1                      ; 53DB   0281 0110
        ANDI    #$0020, R1                      ; 53DD   03B9 0020
        BNEQ    L_53A0                          ; 53DF   022C 0040

        MVI     G_0106, R1                      ; 53E1   0281 0106
        MOVR    R1,     R0                      ; 53E3   0088
        MVI     G_0118, R5                      ; 53E4   0285 0118
        MVO     R0,     G_0118                  ; 53E6   0240 0118
        MVI     G_0120, R2                      ; 53E8   0282 0120
        TSTR    R2                              ; 53EA   0092
        BNEQ    L_544F                          ; 53EB   020C 0062

        MVI     G_0107, R3                      ; 53ED   0283 0107
        TSTR    R3                              ; 53EF   009B
        BNEQ    L_5633                          ; 53F0   020C 0241

L_53F2:
        ANDI    #$0040, R0                      ; 53F2   03B8 0040
        BNEQ    L_542A                          ; 53F4   020C 0034

        MOVR    R1,     R0                      ; 53F6   0088
        ANDI    #$0080, R0                      ; 53F7   03B8 0080
        BNEQ    L_521C                          ; 53F9   022C 01DE

        MVII    #$0111, R4                      ; 53FB   02BC 0111
        MVII    #$0008, R0                      ; 53FD   02B8 0008

        JSR     R5,     L_50C8                  ; 53FF   0004 0150 00C8

        SAR     R3,     1                       ; 5402   006B

        JSR     R5,     L_5942                  ; 5403   0004 0158 0142

        CLRR    R5                              ; 5406   01ED
        TSTR    R0                              ; 5407   0080
        BMI     L_540C                          ; 5408   020B 0002

        XORI    #$0004, R5                      ; 540A   03FD 0004
L_540C:
        MVO     R5,     G_010F                  ; 540C   0245 010F
        MVI     G_0115, R5                      ; 540E   0285 0115
        ANDI    #$0001, R5                      ; 5410   03BD 0001
        BNEQ    L_56BA                          ; 5412   020C 02A6

        MVI     G_0110, R5                      ; 5414   0285 0110
        CMPI    #$0001, R5                      ; 5416   037D 0001
        BEQ     L_5432                          ; 5418   0204 0018

        MVI     G_0120, R5                      ; 541A   0285 0120
        TSTR    R5                              ; 541C   00AD
        BNEQ    L_56BA                          ; 541D   020C 029B

        JSR     R5,     L_5099                  ; 541F   0004 0150 0099

        SUBI    #$0040, R5                      ; 5422   033D 0040
        DECR    R3                              ; 5424   0013
        MOVR    R2,     R5                      ; 5425   0095
        MVII    #$0040, R2                      ; 5426   02BA 0040
        B       L_5448                          ; 5428   0200 001E

L_542A:
        SDBD                                    ; 542A   0001
        MVII    #$95B3, R0                      ; 542B   02B8 00B3 0095
        MVII    #$0040, R2                      ; 542E   02BA 0040
        B       L_5448                          ; 5430   0200 0016

L_5432:
        TSTR    R3                              ; 5432   009B
        BPL     L_5441                          ; 5433   0203 000C

        JSR     R5,     L_5099                  ; 5435   0004 0150 0099

        SUBI    #$0040, R5                      ; 5438   033D 0040
        GSWD    R3                              ; 543A   0033
        MOVR    R2,     R6                      ; 543B   0096
        MVII    #$0040, R2                      ; 543C   02BA 0040
        NEGR    R2                              ; 543E   0022
        B       L_5448                          ; 543F   0200 0007

L_5441:
        JSR     R5,     L_5099                  ; 5441   0004 0150 0099

        SUBI    #$0040, R5                      ; 5444   033D 0040
        MOVR    R6,     R3                      ; 5446   00B3
        MOVR    R2,     R5                      ; 5447   0095
L_5448:
        MOVR    R0,     R1                      ; 5448   0081
        ADDR    R2,     R1                      ; 5449   00D1
        MVO     R0,     G_033D                  ; 544A   0240 033D
        MVO     R1,     G_033E                  ; 544C   0241 033E
        PULR    R7                              ; 544E   02B7
L_544F:
        MVI     G_0122, R2                      ; 544F   0282 0122
        DECR    R2                              ; 5451   0012
        BMI     L_5457                          ; 5452   020B 0003

        MVO     R2,     G_0122                  ; 5454   0242 0122
        PULR    R7                              ; 5456   02B7
L_5457:
        CLRR    R2                              ; 5457   01D2
        MVO     R2,     G_0120                  ; 5458   0242 0120
        PULR    R7                              ; 545A   02B7
L_545B:
        MVI     G_015D, R0                      ; 545B   0280 015D
        DECR    R0                              ; 545D   0010
        BMI     L_547F                          ; 545E   020B 001F

        MVO     R0,     G_015D                  ; 5460   0240 015D
        MVI     G_0115, R0                      ; 5462   0280 0115
        ANDI    #$0003, R0                      ; 5464   03B8 0003
        BNEQ    L_56BA                          ; 5466   020C 0252

        MVI     G_033D, R0                      ; 5468   0280 033D
        SDBD                                    ; 546A   0001
        CMPI    #$96A3, R0                      ; 546B   0378 00A3 0096
        BGE     L_56BA                          ; 546E   020D 024A

        JSR     R5,     L_5099                  ; 5470   0004 0150 0099

        SUBI    #$0040, R5                      ; 5473   033D 0040
        RRC     R3,     1                       ; 5475   0073
        MOVR    R2,     R6                      ; 5476   0096
        MOVR    R0,     R1                      ; 5477   0081
        ADDI    #$0040, R1                      ; 5478   02F9 0040
        MVO     R0,     G_033D                  ; 547A   0240 033D
        MVO     R1,     G_033E                  ; 547C   0241 033E
        PULR    R7                              ; 547E   02B7
L_547F:
        MVI     G_01BE, R0                      ; 547F   0280 01BE
        TSTR    R0                              ; 5481   0080
        BNEQ    L_56BA                          ; 5482   020C 0236

        MVI     G_0134, R0                      ; 5484   0280 0134
        TSTR    R0                              ; 5486   0080
        BEQ     L_5496                          ; 5487   0204 000D

        MVII    #$012E, R2                      ; 5489   02BA 012E
        ADD     G_0198, R2                      ; 548B   02C2 0198
        MVI@    R2,     R0                      ; 548D   0290
        INCR    R0                              ; 548E   0008
        MVO@    R0,     R2                      ; 548F   0250

        JSR     R5,     L_5F42                  ; 5490   0004 015C 0342
        JSR     R5,     L_6AEF                  ; 5493   0004 0168 02EF
L_5496:
        JSR     R5,     L_6AAC                  ; 5496   0004 0168 02AC

        MVI     G_0198, R0                      ; 5499   0280 0198
        MOVR    R0,     R2                      ; 549B   0082
        CLRR    R5                              ; 549C   01ED
        MVI     G_0197, R1                      ; 549D   0281 0197
        TSTR    R1                              ; 549F   0089
        BEQ     L_54AF                          ; 54A0   0204 000D

        MVII    #$0001, R5                      ; 54A2   02BD 0001
        XORR    R5,     R0                      ; 54A4   01E8
        MVII    #$0187, R1                      ; 54A5   02B9 0187
        ADDR    R0,     R1                      ; 54A7   00C1
        MVI@    R1,     R1                      ; 54A8   0289
        CMPI    #$00FF, R1                      ; 54A9   0379 00FF
        BNEQ    L_54AF                          ; 54AB   020C 0002

        XORR    R5,     R0                      ; 54AD   01E8
        CLRR    R5                              ; 54AE   01ED
L_54AF:
        MVO     R5,     G_0119                  ; 54AF   0245 0119
        MVO     R0,     G_0198                  ; 54B1   0240 0198
        MOVR    R0,     R1                      ; 54B3   0081
        ADDI    #$011E, R1                      ; 54B4   02F9 011E
        MVI@    R1,     R1                      ; 54B6   0289
        MVO     R1,     G_011D                  ; 54B7   0241 011D
        MVII    #$0009, R0                      ; 54B9   02B8 0009
        MVO     R0,     G_012D                  ; 54BB   0240 012D
        MVII    #$005F, R0                      ; 54BD   02B8 005F
        MVO     R0,     G_015D                  ; 54BF   0240 015D
        MVII    #$0187, R1                      ; 54C1   02B9 0187
        ADDR    R2,     R1                      ; 54C3   00D1
        MVI@    R1,     R1                      ; 54C4   0289
        CMPI    #$00FF, R1                      ; 54C5   0379 00FF
        BNEQ    L_54CF                          ; 54C7   020C 0006

        MVO     R2,     G_0198                  ; 54C9   0242 0198
        MVII    #$0049, R0                      ; 54CB   02B8 0049
        MVO     R0,     G_012D                  ; 54CD   0240 012D

L_54CF:
        JSR     R5,     L_5BA2                  ; 54CF   0004 0158 03A2
        JSR     R5,     L_561A                  ; 54D2   0004 0154 021A

        MVII    #$0010, R1                      ; 54D5   02B9 0010
        MVO     R1,     G_0114                  ; 54D7   0241 0114
        MVII    #$0050, R1                      ; 54D9   02B9 0050
        MVO     R1,     G_0112                  ; 54DB   0241 0112
        MVII    #$00B0, R1                      ; 54DD   02B9 00B0
        MVII    #$0170, R4                      ; 54DF   02BC 0170
L_54E1:
        MVO@    R1,     R4                      ; 54E1   0261
        ADDI    #$000F, R4                      ; 54E2   02FC 000F
        CMPI    #$01CD, R4                      ; 54E4   037C 01CD
        BLE     L_54E1                          ; 54E6   0226 0006

        MVII    #$0003, R3                      ; 54E8   02BB 0003
        MVII    #$0242, R4                      ; 54EA   02BC 0242

        JSR     R5,     X_PRINT_R5              ; 54EC   0004 0118 007B

        RLC     R0,     1                       ; 54EF   0050
        SAR     R0,     2                       ; 54F0   006C
        SLR     R1,     1                       ; 54F1   0061
        SARC    R1,     1                       ; 54F2   0079
        SLR     R1,     2                       ; 54F3   0065
        RRC     R2,     1                       ; 54F4   0072
        DECLE   $0000                           ; 54F5   0000

        MVI     G_012D, R0                      ; 54F6   0280 012D
        ANDI    #$0040, R0                      ; 54F8   03B8 0040
        BNEQ    L_5586                          ; 54FA   020C 008A

        MVII    #$0003, R3                      ; 54FC   02BB 0003
        MVII    #$026B, R4                      ; 54FE   02BC 026B

        JSR     R5,     X_PRINT_R5              ; 5500   0004 0118 007B

        RLC     R3,     1                       ; 5503   0053
        RRC     R0,     2                       ; 5504   0074
        SLR     R1,     1                       ; 5505   0061
        RRC     R2,     1                       ; 5506   0072
        RRC     R0,     2                       ; 5507   0074
        DECLE   $0000                           ; 5508   0000
L_5509:
        MVI     G_0198, R0                      ; 5509   0280 0198
        SLL     R0,     2                       ; 550B   004C
        SLL     R0,     1                       ; 550C   0048
        ADDI    #$008B, R0                      ; 550D   02F8 008B
        MVO     R0,     .BTAB.49                ; 550F   0240 0249
        MVI     G_0197, R0                      ; 5511   0280 0197
        TSTR    R0                              ; 5513   0080
        BEQ     L_5554                          ; 5514   0204 003E

        MVII    #$0003, R3                      ; 5516   02BB 0003
        MVII    #$02B5, R4                      ; 5518   02BC 02B5

        JSR     R5,     X_PRINT_R5              ; 551A   0004 0118 007B

        RLC     R0,     1                       ; 551D   0050
        SAR     R0,     2                       ; 551E   006C
        SLR     R1,     1                       ; 551F   0061
        SARC    R1,     1                       ; 5520   0079
        SLR     R1,     2                       ; 5521   0065
        RRC     R2,     1                       ; 5522   0072
        NEGR    R0                              ; 5523   0020
        GSWD    R1                              ; 5524   0031
        NEGR    R0                              ; 5525   0020
        NEGR    R0                              ; 5526   0020
        NEGR    R0                              ; 5527   0020
        RLC     R0,     1                       ; 5528   0050
        SAR     R0,     2                       ; 5529   006C
        SLR     R1,     1                       ; 552A   0061
        SARC    R1,     1                       ; 552B   0079
        SLR     R1,     2                       ; 552C   0065
        RRC     R2,     1                       ; 552D   0072
        NEGR    R0                              ; 552E   0020
        GSWD    R2                              ; 552F   0032
        DECLE   $0000                           ; 5530   0000

        MVII    #$02DE, R4                      ; 5531   02BC 02DE
        MVI     G_012E, R5                      ; 5533   0285 012E
        CMPI    #$0009, R5                      ; 5535   037D 0009
        BLT     L_553A                          ; 5537   0205 0001

        DECR    R4                              ; 5539   0014
L_553A:
        MVII    #$0003, R3                      ; 553A   02BB 0003

        JSR     R5,     X_PRINT_R5              ; 553C   0004 0118 007B

        SLL     R0,     2                       ; 553F   004C
        SLR     R1,     2                       ; 5540   0065
        RRC     R2,     2                       ; 5541   0076
        SLR     R1,     2                       ; 5542   0065
        SAR     R0,     2                       ; 5543   006C
        DECLE   $0000                           ; 5544   0000
L_5545:
        CLRR    R3                              ; 5545   01DB
        MVII    #$02E3, R4                      ; 5546   02BC 02E3

        JSR     R5,     L_5F57                  ; 5548   0004 015C 0357

        CLRR    R2                              ; 554B   01D2
        MVII    #$02D0, R4                      ; 554C   02BC 02D0

        JSR     R5,     L_5E06                  ; 554E   0004 015C 0206

        MVII    #$0001, R3                      ; 5551   02BB 0001
        INCR    R7                              ; 5553   000F
L_5554:
        CLRR    R3                              ; 5554   01DB
        PSHR    R3                              ; 5555   0273
        MVII    #$02E9, R4                      ; 5556   02BC 02E9
        MVII    #$012E, R5                      ; 5558   02BD 012E
        ADDR    R3,     R5                      ; 555A   00DD
        MVI@    R5,     R5                      ; 555B   02AD
        CMPI    #$0009, R5                      ; 555C   037D 0009
        BLT     L_5561                          ; 555E   0205 0001

        DECR    R4                              ; 5560   0014
L_5561:
        MVII    #$0003, R3                      ; 5561   02BB 0003

        JSR     R5,     X_PRINT_R5              ; 5563   0004 0118 007B

        SLL     R0,     2                       ; 5566   004C
        SLR     R1,     2                       ; 5567   0065
        RRC     R2,     2                       ; 5568   0076
        SLR     R1,     2                       ; 5569   0065
        SAR     R0,     2                       ; 556A   006C
        DECLE   $0000                           ; 556B   0000

        PULR    R3                              ; 556C   02B3
        PSHR    R3                              ; 556D   0273
        MVII    #$02EE, R4                      ; 556E   02BC 02EE

        JSR     R5,     L_5F57                  ; 5570   0004 015C 0357

        PULR    R2                              ; 5573   02B2
L_5574:
        MVII    #$02DB, R4                      ; 5574   02BC 02DB

        JSR     R5,     L_5E06                  ; 5576   0004 015C 0206
        JSR     R5,     G_AC27                  ; 5579   0004 01AC 0027
        DECLE   $0000                           ; 557C   0000

        MVI     G_0119, R0                      ; 557D   0280 0119
        TSTR    R0                              ; 557F   0080
        BEQ     L_56BA                          ; 5580   0204 0138

        JSR     R5,     L_6B1E                  ; 5582   0004 0168 031E

        PULR    R7                              ; 5585   02B7
L_5586:
        MVII    #$0007, R3                      ; 5586   02BB 0007
        MVII    #$0255, R4                      ; 5588   02BC 0255

        JSR     R5,     X_PRINT_R5              ; 558A   0004 0118 007B

        SWAP    R3,     2                       ; 558D   0047
        SWAP    R1,     1                       ; 558E   0041
        SLL     R1,     2                       ; 558F   004D
        SWAP    R1,     2                       ; 5590   0045
        NEGR    R0                              ; 5591   0020
        SLL     R3,     2                       ; 5592   004F
        RLC     R2,     2                       ; 5593   0056
        SWAP    R1,     2                       ; 5594   0045
        RLC     R2,     1                       ; 5595   0052
        NEGR    R1                              ; 5596   0021
        DECLE   $0000                           ; 5597   0000

        MVII    #$00B4, R0                      ; 5598   02B8 00B4
        MVO     R0,     G_015D                  ; 559A   0240 015D

        JSR     R5,     G_AC27                  ; 559C   0004 01AC 0027

        INCR    R7                              ; 559F   000F
        B       L_5509                          ; 55A0   0220 0098

L_55A2:
        MVI     G_0197, R0                      ; 55A2   0280 0197
        TSTR    R0                              ; 55A4   0080
        BEQ     L_55C3                          ; 55A5   0204 001C

        JSR     R5,     L_55C4                  ; 55A7   0004 0154 01C4

        TSTR    R5                              ; 55AA   00AD
        BEQ     L_54AF                          ; 55AB   0224 00FD

        MVII    #$0003, R3                      ; 55AD   02BB 0003
        MVII    #$0240, R4                      ; 55AF   02BC 0240

        JSR     R5,     X_PRINT_R5              ; 55B1   0004 0118 007B

        SWAP    R1,     1                       ; 55B4   0041
        SAR     R0,     2                       ; 55B5   006C
        SAR     R0,     2                       ; 55B6   006C
        NEGR    R0                              ; 55B7   0020
        RLC     R0,     1                       ; 55B8   0050
        SAR     R0,     2                       ; 55B9   006C
        SLR     R1,     1                       ; 55BA   0061
        SARC    R1,     1                       ; 55BB   0079
        SLR     R1,     2                       ; 55BC   0065
        RRC     R2,     1                       ; 55BD   0072
        RRC     R3,     1                       ; 55BE   0073
        DECLE   $0000                           ; 55BF   0000

        JSR     R5,     L_5626                  ; 55C0   0004 0154 0226

L_55C3:
        PULR    R7                              ; 55C3   02B7
L_55C4:
        PSHR    R5                              ; 55C4   0275
        MVI     G_0198, R0                      ; 55C5   0280 0198
        MVII    #$0001, R5                      ; 55C7   02BD 0001
        XORR    R5,     R0                      ; 55C9   01E8
        MOVR    R0,     R2                      ; 55CA   0082
        CLRR    R5                              ; 55CB   01ED
        MVII    #$0187, R1                      ; 55CC   02B9 0187
        ADDR    R0,     R1                      ; 55CE   00C1
        MVI@    R1,     R3                      ; 55CF   028B
        CMPI    #$00FF, R3                      ; 55D0   037B 00FF
        BNEQ    L_56BA                          ; 55D2   020C 00E6

        MVII    #$0001, R5                      ; 55D4   02BD 0001
        PULR    R7                              ; 55D6   02B7
L_55D7:
        MVI     G_0115, R1                      ; 55D7   0281 0115
        ANDI    #$0007, R1                      ; 55D9   03B9 0007
        BNEQ    L_55E0                          ; 55DB   020C 0003

        JSR     R5,     L_561A                  ; 55DD   0004 0154 021A

L_55E0:
        MVI     G_012D, R0                      ; 55E0   0280 012D
        ANDI    #$0040, R0                      ; 55E2   03B8 0040
        BEQ     L_55FA                          ; 55E4   0204 0014

        MVI     G_0197, R0                      ; 55E6   0280 0197
        TSTR    R0                              ; 55E8   0080
        BEQ     L_55F1                          ; 55E9   0204 0006

        JSR     R5,     L_55C4                  ; 55EB   0004 0154 01C4

        TSTR    R5                              ; 55EE   00AD
        BEQ     L_55FA                          ; 55EF   0204 0009

L_55F1:
        MVI     G_0106, R0                      ; 55F1   0280 0106
        ANDI    #$0040, R0                      ; 55F3   03B8 0040
        BNEQ    L_55FA                          ; 55F5   020C 0003
        J       X_RESET                         ; 55F7   0004 0310 0000

L_55FA:
        MVI     G_015D, R0                      ; 55FA   0280 015D
        DECR    R0                              ; 55FC   0010
        MVO     R0,     G_015D                  ; 55FD   0240 015D
        BPL     L_56BA                          ; 55FF   0203 00B9

        MVI     G_012D, R0                      ; 5601   0280 012D
        ANDI    #$0040, R0                      ; 5603   03B8 0040
        BNEQ    L_55A2                          ; 5605   022C 0064

        JSR     R5,     L_5BA2                  ; 5607   0004 0158 03A2

        MVO     R0,     .STIC.MODE              ; 560A   0240 0021
        CLRR    R0                              ; 560C   01C0
        MVO     R0,     G_012D                  ; 560D   0240 012D
        MVII    #$0002, R0                      ; 560F   02B8 0002
        MVO     R0,     G_0157                  ; 5611   0240 0157

        JSR     R5,     L_5C7F                  ; 5613   0004 015C 007F
        JSR     R5,     L_6B78                  ; 5616   0004 0168 0378

        PULR    R7                              ; 5619   02B7
L_561A:
        SDBD                                    ; 561A   0001
        MVII    #$94F3, R0                      ; 561B   02B8 00F3 0094
        MVII    #$0010, R2                      ; 561E   02BA 0010
        MVI     G_0115, R1                      ; 5620   0281 0115
        ANDI    #$000F, R1                      ; 5622   03B9 000F
        BNEQ    L_562C                          ; 5624   020C 0006

L_5626:
        SDBD                                    ; 5626   0001
        MVII    #$95B3, R0                      ; 5627   02B8 00B3 0095
        MVII    #$0040, R2                      ; 562A   02BA 0040
L_562C:
        MOVR    R0,     R1                      ; 562C   0081
        ADDR    R2,     R1                      ; 562D   00D1
        MVO     R0,     G_033D                  ; 562E   0240 033D
        MVO     R1,     G_033E                  ; 5630   0241 033E
        MOVR    R5,     R7                      ; 5632   00AF
L_5633:
        PSHR    R0                              ; 5633   0270
        PSHR    R1                              ; 5634   0271

        JSR     R5,     L_563C                  ; 5635   0004 0154 023C

        PULR    R1                              ; 5638   02B1
        PULR    R0                              ; 5639   02B0
        B       L_53F2                          ; 563A   0220 0249

L_563C:
        PSHR    R5                              ; 563C   0275
L_563D:
        MVI     G_0134, R0                      ; 563D   0280 0134
        TSTR    R0                              ; 563F   0080
        BNEQ    L_56BA                          ; 5640   020C 0078

        MVI     G_01BE, R0                      ; 5642   0280 01BE
        TSTR    R0                              ; 5644   0080
        BEQ     L_5651                          ; 5645   0204 000A

        ANDI    #$0080, R0                      ; 5647   03B8 0080
        BEQ     L_56BA                          ; 5649   0204 006F

        MVI     G_01C6, R5                      ; 564B   0285 01C6
        CMPI    #$000C, R5                      ; 564D   037D 000C
        BGT     L_56BA                          ; 564F   020E 0069

L_5651:
        MVII    #$017B, R1                      ; 5651   02B9 017B
        ADD     G_0198, R1                      ; 5653   02C1 0198
        MVI@    R1,     R0                      ; 5655   0288
        DECR    R0                              ; 5656   0010
        BMI     L_56BB                          ; 5657   020B 0062

        MVO@    R0,     R1                      ; 5659   0248

        JSR     R5,     L_5DE2                  ; 565A   0004 015C 01E2

        MVI     G_0110, R5                      ; 565D   0285 0110
        MVI     G_0112, R0                      ; 565F   0280 0112
        MVI     G_0114, R1                      ; 5661   0281 0114
        MVI     G_0106, R2                      ; 5663   0282 0106
        CMPI    #$0001, R5                      ; 5665   037D 0001
        BEQ     L_5687                          ; 5667   0204 001E

        SUBI    #$0004, R1                      ; 5669   0339 0004
        ADDI    #$0008, R0                      ; 566B   02F8 0008
        AND     .IV.ALD,R2                      ; 566D   0382 0080
        BEQ     L_567B                          ; 566F   0204 000A

        ADDI    #$0004, R2                      ; 5671   02FA 0004
        ANDI    #$000F, R2                      ; 5673   03BA 000F
        CMPI    #$0008, R2                      ; 5675   037A 0008
        BLT     L_5691                          ; 5677   0205 0018
        B       L_5683                          ; 5679   0200 0008

L_567B:
        MVI     G_0321, R5                      ; 567B   0285 0321
        SDBD                                    ; 567D   0001
        ANDI    #$0400, R5                      ; 567E   03BD 0000 0004
        BNEQ    L_5691                          ; 5681   020C 000E

L_5683:
        SUBI    #$0010, R0                      ; 5683   0338 0010
        B       L_5691                          ; 5685   0200 000A

L_5687:
        ADDI    #$0004, R1                      ; 5687   02F9 0004
        ANDI    #$000F, R2                      ; 5689   03BA 000F
        CMPI    #$0007, R2                      ; 568B   037A 0007
        BGT     L_5691                          ; 568D   020E 0002

        SUBI    #$0010, R1                      ; 568F   0339 0010
L_5691:
        MVO     R0,     G_01C0                  ; 5691   0240 01C0
        MVO     R1,     G_01C2                  ; 5693   0241 01C2
        MVI     G_01B7, R0                      ; 5695   0280 01B7
        MVO     R0,     G_01C6                  ; 5697   0240 01C6

        JSR     R5,     L_5E32                  ; 5699   0004 015C 0232

        ANDR    R7,     R5                      ; 569C   01BD
        DECLE   $0001                           ; 569D   0001

        ANDR    R7,     R6                      ; 569E   01BE
        TSTR    R0                              ; 569F   0080
        DECLE   $0000                           ; 56A0   0000

        SDBD                                    ; 56A1   0001
        MVII    #$9B23, R0                      ; 56A2   02B8 0023 009B
        MVO     R0,     G_0344                  ; 56A5   0240 0344
        SDBD                                    ; 56A7   0001
        MVII    #$0973, R0                      ; 56A8   02B8 0073 0009
        MVI     G_01AA, R5                      ; 56AB   0285 01AA
        TSTR    R5                              ; 56AD   00AD
        BEQ     L_56B4                          ; 56AE   0204 0004

        SDBD                                    ; 56B0   0001
        MVII    #$1973, R0                      ; 56B1   02B8 0073 0019
L_56B4:
        MVO     R0,     G_0330                  ; 56B4   0240 0330

        JSR     R5,     G_AC27                  ; 56B6   0004 01AC 0027

        ADCR    R5                              ; 56B9   002D
L_56BA:
        PULR    R7                              ; 56BA   02B7

L_56BB:
        JSR     R5,     G_AC27                  ; 56BB   0004 01AC 0027

        GSWD    R0                              ; 56BE   0030
        PULR    R7                              ; 56BF   02B7
L_56C0:
        MVI     G_011D, R0                      ; 56C0   0280 011D
        SDBD                                    ; 56C2   0001
        MVII    #$9174, R5                      ; 56C3   02BD 0074 0091
        ADDR    R0,     R5                      ; 56C6   00C5
        MVI@    R5,     R0                      ; 56C7   02A8
        CMPI    #$0004, R0                      ; 56C8   0378 0004
        BGE     L_56D7                          ; 56CA   020D 000B

        MOVR    R0,     R1                      ; 56CC   0081
        NEGR    R0                              ; 56CD   0020
        DECR    R1                              ; 56CE   0011
        BNEQ    L_56D3                          ; 56CF   020C 0002

        MVII    #$0002, R0                      ; 56D1   02B8 0002
L_56D3:
        MVO     R0,     G_0155                  ; 56D3   0240 0155
        B       L_56E2                          ; 56D5   0200 000B

L_56D7:
        MOVR    R0,     R1                      ; 56D7   0081
        SLR     R0,     1                       ; 56D8   0060
        NEGR    R0                              ; 56D9   0020
        CMPI    #$0008, R1                      ; 56DA   0379 0008
        BNEQ    L_56E0                          ; 56DC   020C 0002

        MVII    #$0002, R0                      ; 56DE   02B8 0002
L_56E0:
        MVO     R0,     G_0157                  ; 56E0   0240 0157
L_56E2:
        MVII    #$012E, R2                      ; 56E2   02BA 012E
        ADD     G_0198, R2                      ; 56E4   02C2 0198
        MVI@    R2,     R0                      ; 56E6   0290
        INCR    R0                              ; 56E7   0008
        MVO@    R0,     R2                      ; 56E8   0250
        CLRR    R1                              ; 56E9   01C9
        MVII    #$0179, R2                      ; 56EA   02BA 0179
        ADD     G_0198, R2                      ; 56EC   02C2 0198
        MVO@    R1,     R2                      ; 56EE   0251

        JSR     R5,     L_5F42                  ; 56EF   0004 015C 0342
        JSR     R5,     L_5C7F                  ; 56F2   0004 015C 007F
        JSR     R5,     L_6AEF                  ; 56F5   0004 0168 02EF
        JSR     R5,     L_6B78                  ; 56F8   0004 0168 0378

        PULR    R7                              ; 56FB   02B7
L_56FC:
        PSHR    R5                              ; 56FC   0275
        MVII    #$0331, R4                      ; 56FD   02BC 0331
        PSHR    R4                              ; 56FF   0274
L_5700:
        PULR    R4                              ; 5700   02B4
        CMPI    #$0336, R4                      ; 5701   037C 0336
        BGT     L_56BA                          ; 5703   022E 004A

        MVI@    R4,     R0                      ; 5705   02A0
        PSHR    R4                              ; 5706   0274
        MOVR    R0,     R1                      ; 5707   0081
        ANDI    #$0080, R0                      ; 5708   03B8 0080
        BNEQ    L_575A                          ; 570A   020C 004E

L_570C:
        ANDI    #$0003, R1                      ; 570C   03B9 0003
        BEQ     L_5700                          ; 570E   0224 000F

        MVI     G_012D, R0                      ; 5710   0280 012D
        ANDI    #$0001, R0                      ; 5712   03B8 0001
        BNEQ    L_5700                          ; 5714   022C 0015

        MOVR    R4,     R1                      ; 5716   00A1
        SUBI    #$0332, R1                      ; 5717   0339 0332
        MOVR    R1,     R5                      ; 5719   008D
        SLL     R1,     2                       ; 571A   004D
        SLL     R1,     2                       ; 571B   004D
        ADDI    #$0173, R1                      ; 571C   02F9 0173
        MVI@    R1,     R0                      ; 571E   0288
        ANDI    #$0080, R0                      ; 571F   03B8 0080
        BNEQ    L_5700                          ; 5721   022C 0022

        DECR    R1                              ; 5723   0011
        MVI@    R1,     R0                      ; 5724   0288
        SUB     G_0114, R0                      ; 5725   0300 0114
        BPL     L_572A                          ; 5727   0203 0001

        NEGR    R0                              ; 5729   0020
L_572A:
        CMPI    #$0005, R0                      ; 572A   0378 0005
        BGE     L_5700                          ; 572C   022D 002D

        MOVR    R1,     R2                      ; 572E   008A
        SUBI    #$0002, R2                      ; 572F   033A 0002
        MVI     G_0112, R0                      ; 5731   0280 0112
        SUB@    R2,     R0                      ; 5733   0310
        BPL     L_5737                          ; 5734   0203 0001

        NEGR    R0                              ; 5736   0020
L_5737:
        CMPI    #$0004, R0                      ; 5737   0378 0004
        BGE     L_5700                          ; 5739   022D 003A

        MVI     G_0134, R0                      ; 573B   0280 0134
        CMPI    #$0005, R5                      ; 573D   037D 0005
        BNEQ    L_5744                          ; 573F   020C 0003

        TSTR    R0                              ; 5741   0080
        BEQ     L_5700                          ; 5742   0224 0043

L_5744:
        TSTR    R0                              ; 5744   0080
        BEQ     L_5755                          ; 5745   0204 000E

        CMPI    #$0004, R5                      ; 5747   037D 0004
        BGE     L_5755                          ; 5749   020D 000A

        PSHR    R4                              ; 574B   0274
        MOVR    R5,     R2                      ; 574C   00AA
        MVII    #$0002, R1                      ; 574D   02B9 0002

        JSR     R5,     L_5E94                  ; 574F   0004 015C 0294

        PULR    R4                              ; 5752   02B4
        B       L_5700                          ; 5753   0220 0054

L_5755:
        PULR    R4                              ; 5755   02B4

        JSR     R5,     L_59BF                  ; 5756   0004 0158 01BF

        PULR    R7                              ; 5759   02B7
L_575A:
        MVI     G_0134, R2                      ; 575A   0282 0134
        TSTR    R2                              ; 575C   0092
        BNEQ    L_570C                          ; 575D   022C 0052

        MOVR    R4,     R1                      ; 575F   00A1
        SUBI    #$0332, R1                      ; 5760   0339 0332
        MOVR    R1,     R2                      ; 5762   008A
        SLL     R1,     2                       ; 5763   004D
        SLL     R1,     2                       ; 5764   004D
        ADDI    #$0172, R1                      ; 5765   02F9 0172
        MVI@    R1,     R0                      ; 5767   0288
        MVI     G_01BE, R5                      ; 5768   0285 01BE
        TSTR    R5                              ; 576A   00AD
        BEQ     L_5700                          ; 576B   0224 006C

        ANDI    #$0080, R5                      ; 576D   03BD 0080
        BEQ     L_579D                          ; 576F   0204 002C

        SUBI    #$0004, R0                      ; 5771   0338 0004
        SUB     G_01C2, R0                      ; 5773   0300 01C2
        BPL     L_5778                          ; 5775   0203 0001

        NEGR    R0                              ; 5777   0020
L_5778:
        CMPI    #$0006, R0                      ; 5778   0378 0006
        BGE     L_5700                          ; 577A   022D 007B

        INCR    R1                              ; 577C   0009
        MVII    #$0080, R5                      ; 577D   02BD 0080
        MVI@    R1,     R0                      ; 577F   0288
        ANDR    R5,     R0                      ; 5780   01A8
        BNEQ    L_5700                          ; 5781   022C 0082

        MVO@    R5,     R1                      ; 5783   024D
        ADDI    #$0003, R1                      ; 5784   02F9 0003
        MVI     G_01A7, R3                      ; 5786   0283 01A7
        MVO@    R3,     R1                      ; 5788   024B
        ADDI    #$032B, R2                      ; 5789   02FA 032B
        MVI@    R2,     R0                      ; 578B   0290
        SDBD                                    ; 578C   0001
        ANDI    #$EFF8, R0                      ; 578D   03B8 00F8 00EF
        SDBD                                    ; 5790   0001
        XORI    #$1000, R0                      ; 5791   03F8 0000 0010
        MVO@    R0,     R2                      ; 5794   0250
        PSHR    R4                              ; 5795   0274

        JSR     R5,     G_AC27                  ; 5796   0004 01AC 0027

        ADCR    R2                              ; 5799   002A
        PULR    R4                              ; 579A   02B4
        B       L_5700                          ; 579B   0220 009C

L_579D:
        SUB     G_01C2, R0                      ; 579D   0300 01C2
        BPL     L_57A2                          ; 579F   0203 0001

        NEGR    R0                              ; 57A1   0020
L_57A2:
        CMPI    #$0007, R0                      ; 57A2   0378 0007
        BGE     L_5700                          ; 57A4   022D 00A5

        MVI     G_011D, R5                      ; 57A6   0285 011D
        CMPI    #$0005, R5                      ; 57A8   037D 0005
        BNEQ    L_57BD                          ; 57AA   020C 0011

        MVI     G_0127, R5                      ; 57AC   0285 0127
        CMPI    #$0003, R5                      ; 57AE   037D 0003
        BEQ     L_57BD                          ; 57B0   0204 000B

        MOVR    R1,     R5                      ; 57B2   008D
        SUBI    #$0004, R5                      ; 57B3   033D 0004
        MVI@    R5,     R1                      ; 57B5   02A9
        CMPI    #$002C, R1                      ; 57B6   0379 002C
        BEQ     L_5700                          ; 57B8   0224 00B9

        DECR    R5                              ; 57BA   0015
        CLRR    R1                              ; 57BB   01C9
        MVO@    R1,     R5                      ; 57BC   0269
L_57BD:
        MVI     G_01C3, R1                      ; 57BD   0281 01C3
        INCR    R1                              ; 57BF   0009
        MVO     R1,     G_01C3                  ; 57C0   0241 01C3
        PSHR    R4                              ; 57C2   0274

        JSR     R5,     L_5E94                  ; 57C3   0004 015C 0294

        PULR    R4                              ; 57C6   02B4
        TSTR    R5                              ; 57C7   00AD
        BNEQ    L_5700                          ; 57C8   022C 00C9

        MVI     G_01C3, R1                      ; 57CA   0281 01C3
        DECR    R1                              ; 57CC   0011
        MVO     R1,     G_01C3                  ; 57CD   0241 01C3
        B       L_5700                          ; 57CF   0220 00D0

L_57D1:
        PSHR    R5                              ; 57D1   0275
        PSHR    R3                              ; 57D2   0273
        DECR    R4                              ; 57D3   0014
        MVI@    R4,     R5                      ; 57D4   02A5
        PSHR    R5                              ; 57D5   0275
        CLRR    R5                              ; 57D6   01ED
        MVO     R5,     G_011C                  ; 57D7   0245 011C
        DECR    R4                              ; 57D9   0014
        MVO@    R5,     R4                      ; 57DA   0265
        PSHR    R1                              ; 57DB   0271
        PSHR    R2                              ; 57DC   0272

        JSR     R5,     L_5F72                  ; 57DD   0004 015C 0372

        TSTR    R1                              ; 57E0   0089
        BEQ     L_5832                          ; 57E1   0204 004F

        CMPI    #$00F0, R1                      ; 57E3   0379 00F0
        BEQ     L_58FC                          ; 57E5   0204 0115

        CMPI    #$00F8, R1                      ; 57E7   0379 00F8
        BEQ     L_58FC                          ; 57E9   0204 0111

        CMPI    #$01B8, R1                      ; 57EB   0379 01B8
        BEQ     L_590E                          ; 57ED   0204 011F

        CMPI    #$0068, R1                      ; 57EF   0379 0068
        BLT     L_5800                          ; 57F1   0205 000D
        BNEQ    L_57FA                          ; 57F3   020C 0005

        DECR    R4                              ; 57F5   0014
        MVI@    R4,     R5                      ; 57F6   02A5
        INCR    R5                              ; 57F7   000D
        DECR    R4                              ; 57F8   0014
        MVO@    R5,     R4                      ; 57F9   0265
L_57FA:
        CMPI    #$00C0, R1                      ; 57FA   0379 00C0
        BGE     L_585F                          ; 57FC   020D 0061

        ADDI    #$0058, R1                      ; 57FE   02F9 0058
L_5800:
        SDBD                                    ; 5800   0001
        ADDI    #$918B, R1                      ; 5801   02F9 008B 0091
L_5804:
        MOVR    R1,     R5                      ; 5804   008D
        PULR    R2                              ; 5805   02B2
        PULR    R1                              ; 5806   02B1
        PSHR    R1                              ; 5807   0271
        PSHR    R2                              ; 5808   0272
        INCR    R1                              ; 5809   0009
        ADDI    #$0002, R1                      ; 580A   02F9 0002
        DECR    R2                              ; 580C   0012
L_580D:
        ANDI    #$0007, R2                      ; 580D   03BA 0007
        ANDI    #$0007, R1                      ; 580F   03B9 0007
        ADDR    R5,     R2                      ; 5811   00EA

        JSR     R5,     L_581E                  ; 5812   0004 0158 001E

        TSTR    R0                              ; 5815   0080
        ADDR    R0,     R0                      ; 5816   00C0
        SLR     R0,     1                       ; 5817   0060
        GSWD    R0                              ; 5818   0030
        COMR    R0                              ; 5819   0018
        INCR    R4                              ; 581A   000C
        CLRC                                    ; 581B   0006
        DIS                                     ; 581C   0003
        DECLE   $0001                           ; 581D   0001
L_581E:
        ADDR    R5,     R1                      ; 581E   00E9
        INCR    R1                              ; 581F   0009
        MVI@    R2,     R5                      ; 5820   0295
        AND@    R1,     R5                      ; 5821   038D
        CMP@    R1,     R5                      ; 5822   034D
        BNEQ    L_5832                          ; 5823   020C 000D

        PULR    R2                              ; 5825   02B2
        PULR    R1                              ; 5826   02B1
        MVI     G_011C, R3                      ; 5827   0283 011C
        CMPI    #$0008, R3                      ; 5829   037B 0008
        BNEQ    L_582F                          ; 582B   020C 0002

        DECR    R4                              ; 582D   0014
        MVO@    R3,     R4                      ; 582E   0263
L_582F:
        PULR    R3                              ; 582F   02B3
        PULR    R3                              ; 5830   02B3
        PULR    R7                              ; 5831   02B7
L_5832:
        MVI     G_011C, R5                      ; 5832   0285 011C
        MOVR    R5,     R3                      ; 5834   00AB
        ANDI    #$0004, R5                      ; 5835   03BD 0004
        BEQ     L_5849                          ; 5837   0204 0010

        MVI     G_0345, R1                      ; 5839   0281 0345
        SDBD                                    ; 583B   0001
        MVII    #$9323, R2                      ; 583C   02BA 0023 0093
        CMPR    R1,     R2                      ; 583F   014A
        BNEQ    L_5849                          ; 5840   020C 0007

        DECR    R4                              ; 5842   0014
        MVO@    R3,     R4                      ; 5843   0263
L_5844:
        PULR    R2                              ; 5844   02B2
        PULR    R1                              ; 5845   02B1
        PULR    R3                              ; 5846   02B3
        PULR    R3                              ; 5847   02B3
        PULR    R7                              ; 5848   02B7
L_5849:
        CLRR    R5                              ; 5849   01ED
        PULR    R2                              ; 584A   02B2
        PULR    R1                              ; 584B   02B1
        DECR    R4                              ; 584C   0014
        ANDI    #$0010, R3                      ; 584D   03BB 0010
        MVI     G_011C, R3                      ; 584F   0283 011C
        BEQ     L_585B                          ; 5851   0204 0008

        PULR    R5                              ; 5853   02B5
        CLRR    R5                              ; 5854   01ED
        CMPI    #$015D, R4                      ; 5855   037C 015D
        BLT     L_585C                          ; 5857   0205 0003

        INCR    R5                              ; 5859   000D
        INCR    R7                              ; 585A   000F
L_585B:
        PULR    R3                              ; 585B   02B3
L_585C:
        MVO@    R3,     R4                      ; 585C   0263
        PULR    R3                              ; 585D   02B3
        PULR    R7                              ; 585E   02B7
L_585F:
        SUBI    #$00C0, R1                      ; 585F   0339 00C0
        SAR     R1,     2                       ; 5861   006D
        SAR     R1,     1                       ; 5862   0069
        MOVR    R1,     R2                      ; 5863   008A
        SAR     R1,     1                       ; 5864   0069
        CMPI    #$0003, R1                      ; 5865   0379 0003
        BLT     L_586D                          ; 5867   0205 0004

        MVII    #$0048, R1                      ; 5869   02B9 0048
        B       L_5800                          ; 586B   0220 006C

L_586D:
        PSHR    R1                              ; 586D   0271
        ADDI    #$0339, R1                      ; 586E   02F9 0339
        MVI@    R1,     R1                      ; 5870   0289
        MVI     G_011D, R5                      ; 5871   0285 011D
        CMPI    #$0005, R5                      ; 5873   037D 0005
        BEQ     L_58CE                          ; 5875   0204 0057

        MOVR    R2,     R5                      ; 5877   0095
        PULR    R2                              ; 5878   02B2
        PSHR    R5                              ; 5879   0275
        SDBD                                    ; 587A   0001
        CMPI    #$9BD3, R1                      ; 587B   0379 00D3 009B
        BGT     L_58C5                          ; 587E   020E 0045

        SDBD                                    ; 5880   0001
        CMPI    #$9B93, R1                      ; 5881   0379 0093 009B
        BEQ     L_58C5                          ; 5884   0204 003F

        MVI     G_0127, R5                      ; 5886   0285 0127
        CMPI    #$0003, R5                      ; 5888   037D 0003
        BEQ     L_5891                          ; 588A   0204 0005

        CMPR    R2,     R5                      ; 588C   0155
        BNEQ    L_58C5                          ; 588D   020C 0036
        B       L_58A0                          ; 588F   0200 000F

L_5891:
        PSHR    R2                              ; 5891   0272
        MVI     G_012B, R2                      ; 5892   0282 012B
        CMPI    #$0001, R2                      ; 5894   037A 0001
        PULR    R2                              ; 5896   02B2
        BGE     L_58C5                          ; 5897   020D 002C

        PSHR    R5                              ; 5899   0275
        MVI     G_01A9, R5                      ; 589A   0285 01A9
        CMPR    R5,     R2                      ; 589C   016A
        PULR    R5                              ; 589D   02B5
        BNEQ    L_58C5                          ; 589E   020C 0025

L_58A0:
        PULR    R2                              ; 58A0   02B2
        PSHR    R2                              ; 58A1   0272
        PSHR    R3                              ; 58A2   0273
        PSHR    R4                              ; 58A3   0274
        INCR    R4                              ; 58A4   000C
        PSHR    R0                              ; 58A5   0270
        MVI@    R4,     R0                      ; 58A6   02A0
        ADDI    #$0004, R0                      ; 58A7   02F8 0004
        ANDI    #$0007, R0                      ; 58A9   03B8 0007
        INCR    R4                              ; 58AB   000C
        MVI@    R4,     R3                      ; 58AC   02A3
        DECR    R3                              ; 58AD   0013
        ANDI    #$0007, R3                      ; 58AE   03BB 0007
        ADDR    R3,     R0                      ; 58B0   00D8
        MVII    #$0010, R3                      ; 58B1   02BB 0010
        ANDI    #$0001, R2                      ; 58B3   03BA 0001
        MVII    #$0004, R2                      ; 58B5   02BA 0004
        BNEQ    L_58BB                          ; 58B7   020C 0002

        ADDI    #$0006, R2                      ; 58B9   02FA 0006
L_58BB:
        CMPR    R2,     R0                      ; 58BB   0150
        BLE     L_58C0                          ; 58BC   0206 0002

        XORI    #$0080, R3                      ; 58BE   03FB 0080
L_58C0:
        MVO     R3,     G_011C                  ; 58C0   0243 011C
        PULR    R0                              ; 58C2   02B0
        PULR    R4                              ; 58C3   02B4
        PULR    R3                              ; 58C4   02B3
L_58C5:
        PULR    R2                              ; 58C5   02B2
        ANDI    #$0001, R2                      ; 58C6   03BA 0001
        BEQ     L_5804                          ; 58C8   0224 00C5

        ADDI    #$0008, R1                      ; 58CA   02F9 0008
        B       L_5804                          ; 58CC   0220 00C9

L_58CE:
        PULR    R5                              ; 58CE   02B5
        MOVR    R2,     R5                      ; 58CF   0095
        ANDI    #$0002, R2                      ; 58D0   03BA 0002
        BEQ     L_58E7                          ; 58D2   0204 0013

        SDBD                                    ; 58D4   0001
        MVII    #$9333, R2                      ; 58D5   02BA 0033 0093
        CMPR    R1,     R2                      ; 58D8   014A
        SDBD                                    ; 58D9   0001
        MVII    #$918B, R2                      ; 58DA   02BA 008B 0091
        BNEQ    L_58F9                          ; 58DD   020C 001A

        MVII    #$0008, R2                      ; 58DF   02BA 0008
        MVO     R2,     G_011C                  ; 58E1   0242 011C
        ADDI    #$0090, R1                      ; 58E3   02F9 0090
        B       L_5804                          ; 58E5   0220 00E2

L_58E7:
        MVO     R1,     G_0345                  ; 58E7   0241 0345
        ANDI    #$0001, R5                      ; 58E9   03BD 0001
        SDBD                                    ; 58EB   0001
        MVII    #$92A3, R2                      ; 58EC   02BA 00A3 0092
        BEQ     L_58F5                          ; 58EF   0204 0004

        ADDI    #$0008, R2                      ; 58F1   02FA 0008
        MVII    #$0040, R5                      ; 58F3   02BD 0040
L_58F5:
        XORI    #$0004, R5                      ; 58F5   03FD 0004
        MVO     R5,     G_011C                  ; 58F7   0245 011C
L_58F9:
        MOVR    R2,     R1                      ; 58F9   0091
        B       L_5804                          ; 58FA   0220 00F7

L_58FC:
        CMPI    #$0116, R4                      ; 58FC   037C 0116
        BGT     L_57FA                          ; 58FE   022E 0105

        PSHR    R0                              ; 5900   0270
        PSHR    R4                              ; 5901   0274
        PSHR    R1                              ; 5902   0271

        JSR     R5,     L_59DF                  ; 5903   0004 0158 01DF

        PULR    R1                              ; 5906   02B1
        PULR    R4                              ; 5907   02B4
        PULR    R0                              ; 5908   02B0
        TSTR    R5                              ; 5909   00AD
        BEQ     L_57FA                          ; 590A   0224 0111
        B       L_5844                          ; 590C   0220 00C9

L_590E:
        CMPI    #$0116, R4                      ; 590E   037C 0116
        BGT     L_57FA                          ; 5910   022E 0117

        PSHR    R4                              ; 5912   0274
        PSHR    R1                              ; 5913   0271
        PSHR    R0                              ; 5914   0270
        MVI     G_0178, R0                      ; 5915   0280 0178
        TSTR    R0                              ; 5917   0080
        BEQ     L_593D                          ; 5918   0204 0023

        MVI     G_0114, R0                      ; 591A   0280 0114
        ANDI    #$0007, R0                      ; 591C   03B8 0007
        CMPI    #$0004, R0                      ; 591E   0378 0004
        BLT     L_593D                          ; 5920   0205 001B

        MVII    #$017B, R1                      ; 5922   02B9 017B
        ADD     G_0198, R1                      ; 5924   02C1 0198
        MVI@    R1,     R0                      ; 5926   0288
        INCR    R0                              ; 5927   0008
        MVO@    R0,     R1                      ; 5928   0248
        MVI     G_0189, R0                      ; 5929   0280 0189
        INCR    R0                              ; 592B   0008
        MVO     R0,     G_0189                  ; 592C   0240 0189

        JSR     R5,     L_6AAC                  ; 592E   0004 0168 02AC
        JSR     R5,     L_5DE2                  ; 5931   0004 015C 01E2

        MVII    #$0019, R0                      ; 5934   02B8 0019

        JSR     R5,     L_5E37                  ; 5936   0004 015C 0237
        JSR     R5,     G_AC27                  ; 5939   0004 01AC 0027

        NEGR    R7                              ; 593C   0027
L_593D:
        PULR    R0                              ; 593D   02B0
        PULR    R1                              ; 593E   02B1
        PULR    R4                              ; 593F   02B4
        B       L_57FA                          ; 5940   0220 0147

L_5942:
        PSHR    R5                              ; 5942   0275
        CLRR    R1                              ; 5943   01C9
        MVO     R1,     G_011A                  ; 5944   0241 011A
        MVO     R1,     G_011B                  ; 5946   0241 011B
        SDBD                                    ; 5948   0001
        MVI@    R4,     R1                      ; 5949   02A1
        TSTR    R0                              ; 594A   0080
        BEQ     L_5978                          ; 594B   0204 002B

        ADDR    R0,     R1                      ; 594D   00C1
        SUBI    #$0002, R4                      ; 594E   033C 0002
        MVO@    R1,     R4                      ; 5950   0261
        SWAP    R1,     1                       ; 5951   0041
        ANDI    #$00FF, R1                      ; 5952   03B9 00FF
        CMPI    #$0008, R1                      ; 5954   0379 0008
        BLE     L_5968                          ; 5956   0206 0010

        CMPI    #$00A2, R1                      ; 5958   0379 00A2
        BGE     L_5968                          ; 595A   020D 000C

        ADDI    #$0002, R4                      ; 595C   02FC 0002
        MVI@    R4,     R2                      ; 595E   02A2
        SUBI    #$0004, R4                      ; 595F   033C 0004

        JSR     R5,     L_57D1                  ; 5961   0004 0154 03D1

        INCR    R4                              ; 5964   000C
        TSTR    R5                              ; 5965   00AD
        BNEQ    L_596F                          ; 5966   020C 0007

L_5968:
        MVII    #$0001, R5                      ; 5968   02BD 0001
        MVO     R5,     G_011A                  ; 596A   0245 011A
        INCR    R4                              ; 596C   000C
        B       L_5978                          ; 596D   0200 0009

L_596F:
        CMP@    R4,     R1                      ; 596F   0361
        BNEQ    L_5976                          ; 5970   020C 0004

        MVII    #$0001, R2                      ; 5972   02BA 0001
        MVO     R2,     G_011B                  ; 5974   0242 011B
L_5976:
        DECR    R4                              ; 5976   0014
        MVO@    R1,     R4                      ; 5977   0261
L_5978:
        TSTR    R3                              ; 5978   009B
        BEQ     L_56BA                          ; 5979   0224 02C0

        SDBD                                    ; 597B   0001
        MVI@    R4,     R2                      ; 597C   02A2
        ADDR    R3,     R2                      ; 597D   00DA
        SUBI    #$0002, R4                      ; 597E   033C 0002
        MVO@    R2,     R4                      ; 5980   0262
        SWAP    R2,     1                       ; 5981   0042
        ANDI    #$007F, R2                      ; 5982   03BA 007F
        CMPI    #$0008, R2                      ; 5984   037A 0008
        BLE     L_5999                          ; 5986   0206 0011

        CMPI    #$0060, R2                      ; 5988   037A 0060
        BGT     L_5999                          ; 598A   020E 000D

        SUBI    #$0002, R4                      ; 598C   033C 0002
        MVI@    R4,     R1                      ; 598E   02A1
        SUBI    #$0002, R4                      ; 598F   033C 0002

        JSR     R5,     L_57D1                  ; 5991   0004 0154 03D1

        ADDI    #$0003, R4                      ; 5994   02FC 0003
        TSTR    R5                              ; 5996   00AD
        BNEQ    L_599F                          ; 5997   020C 0006

L_5999:
        MVI     G_011A, R5                      ; 5999   0285 011A
        INCR    R5                              ; 599B   000D
        MVO     R5,     G_011A                  ; 599C   0245 011A
        PULR    R7                              ; 599E   02B7
L_599F:
        CMP@    R4,     R2                      ; 599F   0362
        BNEQ    L_59A9                          ; 59A0   020C 0007

        MVII    #$0002, R5                      ; 59A2   02BD 0002
        XOR     G_011B, R5                      ; 59A4   03C5 011B
        MVO     R5,     G_011B                  ; 59A6   0245 011B
        PULR    R7                              ; 59A8   02B7
L_59A9:
        DECR    R4                              ; 59A9   0014
        MVO@    R2,     R4                      ; 59AA   0262
        PULR    R7                              ; 59AB   02B7
L_59AC:
        SDBD                                    ; 59AC   0001
        MVI@    R4,     R1                      ; 59AD   02A1
        SUBI    #$0002, R4                      ; 59AE   033C 0002
        ADDR    R0,     R1                      ; 59B0   00C1
        MVO@    R1,     R4                      ; 59B1   0261
        SWAP    R1,     1                       ; 59B2   0041
        NOP                                     ; 59B3   0034
        MVO@    R1,     R4                      ; 59B4   0261
        SDBD                                    ; 59B5   0001
        MVI@    R4,     R1                      ; 59B6   02A1
        SUBI    #$0002, R4                      ; 59B7   033C 0002
        ADDR    R3,     R1                      ; 59B9   00D9
        MVO@    R1,     R4                      ; 59BA   0261
        NOP                                     ; 59BB   0034
        SWAP    R1,     1                       ; 59BC   0041
        MVO@    R1,     R4                      ; 59BD   0261
        MOVR    R5,     R7                      ; 59BE   00AF
L_59BF:
        PSHR    R5                              ; 59BF   0275
        MVII    #$0005, R0                      ; 59C0   02B8 0005
        MVO     R0,     G_012D                  ; 59C2   0240 012D
        MVII    #$0082, R0                      ; 59C4   02B8 0082
        MVO     R0,     G_015D                  ; 59C6   0240 015D
        SDBD                                    ; 59C8   0001
        MVII    #$95B3, R0                      ; 59C9   02B8 00B3 0095
        MOVR    R0,     R1                      ; 59CC   0081
        ADDI    #$0040, R1                      ; 59CD   02F9 0040
        MVO     R0,     G_033D                  ; 59CF   0240 033D
        MVO     R1,     G_033E                  ; 59D1   0241 033E

        JSR     R5,     G_AC27                  ; 59D3   0004 01AC 0027

        CLRC                                    ; 59D6   0006
        MVII    #$0187, R1                      ; 59D7   02B9 0187
        ADD     G_0198, R1                      ; 59D9   02C1 0198
        MVI@    R1,     R0                      ; 59DB   0288
        DECR    R0                              ; 59DC   0010
        MVO@    R0,     R1                      ; 59DD   0248
        PULR    R7                              ; 59DE   02B7
L_59DF:
        PSHR    R5                              ; 59DF   0275
        CLRR    R5                              ; 59E0   01ED
        MVII    #$0002, R3                      ; 59E1   02BB 0002
        MVI     G_0321, R1                      ; 59E3   0281 0321
        SDBD                                    ; 59E5   0001
        ANDI    #$0400, R1                      ; 59E6   03B9 0000 0004
        BNEQ    L_59EC                          ; 59E9   020C 0001

        NEGR    R3                              ; 59EB   0023
L_59EC:
        MVO     R3,     G_0121                  ; 59EC   0243 0121
        MVI     G_0112, R1                      ; 59EE   0281 0112
        MVI     G_01BE, R3                      ; 59F0   0283 01BE
        TSTR    R3                              ; 59F2   009B
        BEQ     L_59FF                          ; 59F3   0204 000A

        ANDI    #$0080, R3                      ; 59F5   03BB 0080
        BEQ     L_56BA                          ; 59F7   0224 033E

        MVI     G_01C6, R3                      ; 59F9   0283 01C6
        CMPI    #$000C, R3                      ; 59FB   037B 000C
        BGT     L_56BA                          ; 59FD   022E 0344

L_59FF:
        MVI     G_0114, R2                      ; 59FF   0282 0114

        JSR     R5,     L_5F72                  ; 5A01   0004 015C 0372

        TSTR    R1                              ; 5A04   0089
        BEQ     L_56BA                          ; 5A05   0224 034C

        MVII    #$01CE, R3                      ; 5A07   02BB 01CE
L_5A09:
        MVI@    R3,     R1                      ; 5A09   0299
        CMPR    R1,     R2                      ; 5A0A   014A
        BEQ     L_5A14                          ; 5A0B   0204 0007

        ADDI    #$0004, R3                      ; 5A0D   02FB 0004
        CMPI    #$01EB, R3                      ; 5A0F   037B 01EB
        BLT     L_5A09                          ; 5A11   0225 0009

        PULR    R7                              ; 5A13   02B7
L_5A14:
        DECR    R3                              ; 5A14   0013
        MVI@    R3,     R2                      ; 5A15   029A
        CMPI    #$0001, R2                      ; 5A16   037A 0001
        BNEQ    L_56BA                          ; 5A18   022C 035F

        MVI     G_0114, R2                      ; 5A1A   0282 0114
        ANDI    #$0007, R2                      ; 5A1C   03BA 0007
        CMPI    #$0004, R2                      ; 5A1E   037A 0004
        BLT     L_56BA                          ; 5A20   0225 0367

        MVI     G_0121, R2                      ; 5A22   0282 0121
        MVI     G_0112, R0                      ; 5A24   0280 0112
        ANDI    #$0007, R0                      ; 5A26   03B8 0007
        CMPI    #$0003, R2                      ; 5A28   037A 0003
        BGT     L_5A34                          ; 5A2A   020E 0008

        TSTR    R0                              ; 5A2C   0080
        BEQ     L_56BA                          ; 5A2D   0224 0374

        CMPI    #$0006, R0                      ; 5A2F   0378 0006
        BLT     L_5A38                          ; 5A31   0205 0005

        PULR    R7                              ; 5A33   02B7
L_5A34:
        CMPI    #$0003, R0                      ; 5A34   0378 0003
        BLT     L_56BA                          ; 5A36   0225 037D

L_5A38:
        MVII    #$0002, R0                      ; 5A38   02B8 0002
        MVO@    R0,     R3                      ; 5A3A   0258
        SUBI    #$01CD, R3                      ; 5A3B   033B 01CD
        SLR     R3,     2                       ; 5A3D   0067
        SDBD                                    ; 5A3E   0001
        MVII    #$9AA3, R0                      ; 5A3F   02B8 00A3 009A
        MVO     R0,     G_0344                  ; 5A42   0240 0344
        MVO     R3,     G_01ED                  ; 5A44   0243 01ED

        JSR     R5,     L_6B61                  ; 5A46   0004 0168 0361

        SDBD                                    ; 5A49   0001
        XORI    #$0970, R0                      ; 5A4A   03F8 0070 0009
        MVO     R0,     G_0330                  ; 5A4D   0240 0330
        PSHR    R1                              ; 5A4F   0271
        ADDI    #$0200, R1                      ; 5A50   02F9 0200
        MVI     G_034C, R0                      ; 5A52   0280 034C
        SDBD                                    ; 5A54   0001
        XORI    #$2848, R0                      ; 5A55   03F8 0048 0028
        MVO@    R0,     R1                      ; 5A58   0248
        PULR    R0                              ; 5A59   02B0

        JSR     R5,     L_5F64                  ; 5A5A   0004 015C 0364

        ADDI    #$0008, R0                      ; 5A5D   02F8 0008
        MVII    #$0001, R4                      ; 5A5F   02BC 0001
        CLRR    R5                              ; 5A61   01ED
        CMPI    #$0003, R2                      ; 5A62   037A 0003
        BGT     L_5A69                          ; 5A64   020E 0003

        XORI    #$0004, R5                      ; 5A66   03FD 0004
        INCR    R4                              ; 5A68   000C
L_5A69:
        MVO     R0,     G_01C0                  ; 5A69   0240 01C0
        MVO     R1,     G_01C2                  ; 5A6B   0241 01C2
        MVO     R5,     G_01BD                  ; 5A6D   0245 01BD
        MVO     R4,     G_01C5                  ; 5A6F   0244 01C5
        MVII    #$0005, R0                      ; 5A71   02B8 0005

        JSR     R5,     L_5E37                  ; 5A73   0004 015C 0237

        SDBD                                    ; 5A76   0001
        MVII    #$9593, R0                      ; 5A77   02B8 0093 0095
        MOVR    R0,     R1                      ; 5A7A   0081
        ADDI    #$0010, R1                      ; 5A7B   02F9 0010
        MVO     R0,     G_033D                  ; 5A7D   0240 033D
        MVO     R1,     G_033E                  ; 5A7F   0241 033E
        MVO     R0,     G_0120                  ; 5A81   0240 0120

        JSR     R5,     L_5E32                  ; 5A83   0004 015C 0232

        XORR    R0,     R6                      ; 5A86   01C6
        DECLE   $0000                           ; 5A87   0000

        XORR    R0,     R3                      ; 5A88   01C3
        DECLE   $0000                           ; 5A89   0000

        XORR    R0,     R4                      ; 5A8A   01C4
        SETC                                    ; 5A8B   0007
        ANDR    R7,     R6                      ; 5A8C   01BE
        DECLE   $0001                           ; 5A8D   0001

        ANDR    R5,     R0                      ; 5A8E   01A8
        ADDR    R7,     R7                      ; 5A8F   00FF
        DECLE   $0000                           ; 5A90   0000

        MVII    #$000B, R5                      ; 5A91   02BD 000B
        MVO     R5,     G_0122                  ; 5A93   0245 0122
        MVI     G_01C2, R1                      ; 5A95   0281 01C2

        JSR     R5,     G_AC27                  ; 5A97   0004 01AC 0027

        COMR    R3                              ; 5A9A   001B
        PULR    R7                              ; 5A9B   02B7
L_5A9C:
        PSHR    R5                              ; 5A9C   0275
        EIS                                     ; 5A9D   0002
        MVII    #$0339, R4                      ; 5A9E   02BC 0339
        MVII    #$000C, R0                      ; 5AA0   02B8 000C

        JSR     R5,     X_FILL_ZERO             ; 5AA2   0004 0114 0338
        JSR     R5,     L_5BA2                  ; 5AA5   0004 0158 03A2
        JSR     R5,     L_67A4                  ; 5AA8   0004 0164 03A4

        MVO     R0,     .STIC.VIDEN             ; 5AAB   0240 0020
        SDBD                                    ; 5AAD   0001
        MVII    #$3800, R4                      ; 5AAE   02BC 0000 0038
        SDBD                                    ; 5AB1   0001
        MVII    #$918B, R2                      ; 5AB2   02BA 008B 0091
        MVII    #$00F0, R0                      ; 5AB5   02B8 00F0

        JSR     R5,     L_51B7                  ; 5AB7   0004 0150 01B7
        JSR     R5,     L_67A4                  ; 5ABA   0004 0164 03A4

        SDBD                                    ; 5ABD   0001
        MVII    #$3920, R4                      ; 5ABE   02BC 0020 0039
        SDBD                                    ; 5AC1   0001
        MVII    #$94CB, R2                      ; 5AC2   02BA 00CB 0094
        MVII    #$0030, R0                      ; 5AC5   02B8 0030

        JSR     R5,     L_51B7                  ; 5AC7   0004 0150 01B7
        JSR     R5,     L_67A4                  ; 5ACA   0004 0164 03A4

        SDBD                                    ; 5ACD   0001
        MVII    #$3950, R4                      ; 5ACE   02BC 0050 0039
        SDBD                                    ; 5AD1   0001
        MVII    #$3248, R2                      ; 5AD2   02BA 0048 0032
        MVII    #$0008, R0                      ; 5AD5   02B8 0008

        JSR     R5,     L_51B7                  ; 5AD7   0004 0150 01B7

        SDBD                                    ; 5ADA   0001
        MVII    #$3228, R2                      ; 5ADB   02BA 0028 0032
        MVII    #$0008, R0                      ; 5ADE   02B8 0008

        JSR     R5,     L_51B7                  ; 5AE0   0004 0150 01B7

        SDBD                                    ; 5AE3   0001
        MVII    #$3270, R2                      ; 5AE4   02BA 0070 0032
        MVII    #$0038, R0                      ; 5AE7   02B8 0038

        JSR     R5,     L_51B7                  ; 5AE9   0004 0150 01B7

        MVO     R0,     .STIC.MODE              ; 5AEC   0240 0021
        MVO     R0,     .STIC.VIDEN             ; 5AEE   0240 0020
        MVII    #$0001, R0                      ; 5AF0   02B8 0001
        MVO     R0,     G_011D                  ; 5AF2   0240 011D
        MVII    #$0080, R0                      ; 5AF4   02B8 0080
        MVO     R0,     G_012D                  ; 5AF6   0240 012D
        MVII    #$000A, R0                      ; 5AF8   02B8 000A
        MVO     R0,     G_012E                  ; 5AFA   0240 012E

        JSR     R5,     L_6AEF                  ; 5AFC   0004 0168 02EF
        JSR     R5,     L_5C7F                  ; 5AFF   0004 015C 007F

        MVII    #$0002, R0                      ; 5B02   02B8 0002
        MVO     R0,     G_0157                  ; 5B04   0240 0157

        JSR     R5,     L_6B78                  ; 5B06   0004 0168 0378

        MVII    #$0200, R4                      ; 5B09   02BC 0200
        MVII    #$0014, R0                      ; 5B0B   02B8 0014

        JSR     R5,     X_FILL_ZERO             ; 5B0D   0004 0114 0338

        MVII    #$02EA, R4                      ; 5B10   02BC 02EA
        CLRR    R0                              ; 5B12   01C0
        MVO@    R0,     R4                      ; 5B13   0260
        MVI     G_034C, R3                      ; 5B14   0283 034C
        SDBD                                    ; 5B16   0001
        MVII    #$0920, R0                      ; 5B17   02B8 0020 0009
        XORR    R3,     R0                      ; 5B1A   01D8
        MVO@    R0,     R4                      ; 5B1B   0260
        SDBD                                    ; 5B1C   0001
        MVII    #$07C3, R0                      ; 5B1D   02B8 00C3 0007
        MVII    #$0004, R1                      ; 5B20   02B9 0004

        JSR     R5,     X_PRNUM_RGT             ; 5B22   0004 0118 00C5
        JSR     R5,     L_5B5E                  ; 5B25   0004 0158 035E

        SDBD                                    ; 5B28   0001
        MVII    #$092E, R0                      ; 5B29   02B8 002E 0009
        MVII    #$0204, R4                      ; 5B2C   02BC 0204
        MVII    #$0008, R1                      ; 5B2E   02B9 0008
        MVO@    R0,     R4                      ; 5B30   0260
        ADDR    R1,     R0                      ; 5B31   00C8
        MVO@    R0,     R4                      ; 5B32   0260
        ADDR    R1,     R0                      ; 5B33   00C8
        MVO@    R0,     R4                      ; 5B34   0260
        ADDR    R1,     R0                      ; 5B35   00C8
        MVO@    R0,     R4                      ; 5B36   0260
        SDBD                                    ; 5B37   0001
        MVII    #$094E, R3                      ; 5B38   02BB 004E 0009

L_5B3B:
        JSR     R5,     L_5B47                  ; 5B3B   0004 0158 0347

        ADCR    R0                              ; 5B3E   0028
        RSWD    R0                              ; 5B3F   0038
        DECR    R0                              ; 5B40   0010
        SWAP    R0,     1                       ; 5B41   0040
        DECR    R0                              ; 5B42   0010
        COMR    R0                              ; 5B43   0018
        SLL     R0,     1                       ; 5B44   0048
        SWAP    R0,     1                       ; 5B45   0040
        DECLE   $0000                           ; 5B46   0000
L_5B47:
        MVI@    R5,     R0                      ; 5B47   02A8
L_5B48:
        ADDR    R3,     R0                      ; 5B48   00D8
        MVO@    R0,     R4                      ; 5B49   0260
        MVI@    R5,     R0                      ; 5B4A   02A8
        TSTR    R0                              ; 5B4B   0080
        BNEQ    L_5B48                          ; 5B4C   022C 0005

        PULR    R7                              ; 5B4E   02B7
L_5B4F:
        PSHR    R5                              ; 5B4F   0275
        MVI     G_0115, R0                      ; 5B50   0280 0115
        MOVR    R0,     R1                      ; 5B52   0081
        ANDI    #$000F, R0                      ; 5B53   03B8 000F
        BNEQ    L_5DD1                          ; 5B55   020C 027A

        MVI     G_0115, R0                      ; 5B57   0280 0115
        ANDI    #$00FF, R0                      ; 5B59   03B8 00FF
        BEQ     L_5B8E                          ; 5B5B   0204 0031

        INCR    R7                              ; 5B5D   000F
L_5B5E:
        PSHR    R5                              ; 5B5E   0275
        MVI     G_0115, R1                      ; 5B5F   0281 0115
        MVI     G_0348, R3                      ; 5B61   0283 0348
        SDBD                                    ; 5B63   0001
        ANDI    #$F7FF, R3                      ; 5B64   03BB 00FF 00F7
        XORI    #$0007, R3                      ; 5B67   03FB 0007
        ANDI    #$0010, R1                      ; 5B69   03B9 0010
        BEQ     L_5B6F                          ; 5B6B   0204 0002

        XOR     G_034D, R3                      ; 5B6D   03C3 034D
L_5B6F:
        MVII    #$0245, R4                      ; 5B6F   02BC 0245
        SDBD                                    ; 5B71   0001
        MVII    #$0948, R2                      ; 5B72   02BA 0048 0009

        JSR     R5,     L_5B7F                  ; 5B75   0004 0158 037F

        SUBR    R4,     R0                      ; 5B78   0120
        INCR    R0                              ; 5B79   0008
        COMR    R0                              ; 5B7A   0018
        DECR    R0                              ; 5B7B   0010
        RSWD    R0                              ; 5B7C   0038
        DECLE   $0000                           ; 5B7D   0000

        INCR    R0                              ; 5B7E   0008
L_5B7F:
        MVI@    R5,     R0                      ; 5B7F   02A8
        XORR    R3,     R0                      ; 5B80   01D8
        MVO@    R0,     R4                      ; 5B81   0260
        MVI@    R5,     R0                      ; 5B82   02A8
L_5B83:
        XORR    R3,     R0                      ; 5B83   01D8
        ADDR    R2,     R0                      ; 5B84   00D0
        MVO@    R0,     R4                      ; 5B85   0260
        MVI@    R5,     R0                      ; 5B86   02A8
        TSTR    R0                              ; 5B87   0080
        BNEQ    L_5B83                          ; 5B88   022C 0006

        MVI@    R5,     R0                      ; 5B8A   02A8
        XORR    R3,     R0                      ; 5B8B   01D8
        MVO@    R0,     R4                      ; 5B8C   0260
        PULR    R7                              ; 5B8D   02B7
L_5B8E:
        MVI     G_0345, R0                      ; 5B8E   0280 0345
        INCR    R0                              ; 5B90   0008
        ANDI    #$0003, R0                      ; 5B91   03B8 0003
        CMPI    #$0003, R0                      ; 5B93   0378 0003
        BNEQ    L_5B98                          ; 5B95   020C 0001

        CLRR    R0                              ; 5B97   01C0
L_5B98:
        PSHR    R0                              ; 5B98   0270

        JSR     R5,     G_AD6A                  ; 5B99   0004 01AC 016A

        PULR    R0                              ; 5B9C   02B0
        MVO     R0,     G_0345                  ; 5B9D   0240 0345
        J       L_5010                          ; 5B9F   0004 0350 0010

L_5BA2:
        PSHR    R5                              ; 5BA2   0275
        MVII    #$0200, R4                      ; 5BA3   02BC 0200
        MVII    #$00F0, R0                      ; 5BA5   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5BA7   0004 0114 0338
        JSR     R5,     L_67A4                  ; 5BAA   0004 0164 03A4

        MVII    #$0000, R1                      ; 5BAD   02B9 0000
        MVII    #$0028, R5                      ; 5BAF   02BD 0028
        MVO@    R1,     R5                      ; 5BB1   0269
        MVO@    R1,     R5                      ; 5BB2   0269
        MVO@    R1,     R5                      ; 5BB3   0269
        MVO@    R1,     R5                      ; 5BB4   0269
        MVO@    R1,     R5                      ; 5BB5   0269
        MVO     R1,     .STIC.VDLY              ; 5BB6   0241 0031
        MVO     R1,     .STIC.HDLY              ; 5BB8   0241 0030
        MVI     .STIC.MODE,R0                   ; 5BBA   0280 0021
        MVO     R0,     .STIC.VIDEN             ; 5BBC   0240 0020
        PULR    R7                              ; 5BBE   02B7
L_5BBF:
        PSHR    R5                              ; 5BBF   0275
        MVII    #$0040, R0                      ; 5BC0   02B8 0040
        MVII    #$0319, R4                      ; 5BC2   02BC 0319

        JSR     R5,     X_FILL_ZERO             ; 5BC4   0004 0114 0338

        MVII    #$004C, R0                      ; 5BC7   02B8 004C
        MVII    #$0110, R4                      ; 5BC9   02BC 0110

        JSR     R5,     X_FILL_ZERO             ; 5BCB   0004 0114 0338
        JSR     R5,     L_5626                  ; 5BCE   0004 0154 0226
        JSR     R5,     L_5E32                  ; 5BD1   0004 015C 0232

        SUBR    R0,     R4                      ; 5BD4   0104
        ADDR    R7,     R7                      ; 5BD5   00FF
        SUBR    R0,     R3                      ; 5BD6   0103
        EIS                                     ; 5BD7   0002
        ANDR    R0,     R7                      ; 5BD8   0187
        DECLE   $0005                           ; 5BD9   0005

        CMPR    R7,     R3                      ; 5BDA   017B
        DECLE   $0005                           ; 5BDB   0005

        ANDR    R1,     R0                      ; 5BDC   0188
        DECLE   $0005                           ; 5BDD   0005

        CMPR    R7,     R4                      ; 5BDE   017C
        DECLE   $0005,  $0000                   ; 5BDF   0005 0000

        SDBD                                    ; 5BE1   0001
        MVII    #$900F, R5                      ; 5BE2   02BD 000F 0090
        MVII    #$032B, R4                      ; 5BE5   02BC 032B
L_5BE7:
        SDBD                                    ; 5BE7   0001
        MVI@    R5,     R1                      ; 5BE8   02A9
        MVO@    R1,     R4                      ; 5BE9   0261
        CMPI    #$0330, R4                      ; 5BEA   037C 0330
        BLE     L_5BE7                          ; 5BEC   0226 0006

        MVII    #$0319, R4                      ; 5BEE   02BC 0319

        JSR     R5,     L_50B8                  ; 5BF0   0004 0150 00B8

        SLR     R0,     1                       ; 5BF3   0060
        EIS                                     ; 5BF4   0002
        ADDR    R3,     R0                      ; 5BF5   00D8
        DECLE   $0000                           ; 5BF6   0000

        EIS                                     ; 5BF7   0002
        COMR    R1                              ; 5BF8   0019

        JSR     R5,     L_50B8                  ; 5BF9   0004 0150 00B8

        SLR     R0,     1                       ; 5BFC   0060
        DIS                                     ; 5BFD   0003
        ADDR    R3,     R0                      ; 5BFE   00D8
        DECLE   $0000                           ; 5BFF   0000

        DECR    R7                              ; 5C00   0017
        INCR    R1                              ; 5C01   0009

        JSR     R5,     L_6AEF                  ; 5C02   0004 0168 02EF
        JSR     R5,     L_6B1E                  ; 5C05   0004 0168 031E
        JSR     R5,     L_6AEF                  ; 5C08   0004 0168 02EF
        JSR     R5,     L_5BA2                  ; 5C0B   0004 0158 03A2

        MVII    #$0010, R1                      ; 5C0E   02B9 0010
        MVO     R1,     G_0114                  ; 5C10   0241 0114
        MVII    #$0050, R1                      ; 5C12   02B9 0050
        MVO     R1,     G_0112                  ; 5C14   0241 0112
        MVII    #$00B0, R1                      ; 5C16   02B9 00B0
        MVII    #$0170, R4                      ; 5C18   02BC 0170
L_5C1A:
        MVO@    R1,     R4                      ; 5C1A   0261
        ADDI    #$000F, R4                      ; 5C1B   02FC 000F
        CMPI    #$01CD, R4                      ; 5C1D   037C 01CD
        BLE     L_5C1A                          ; 5C1F   0226 0006

        MVII    #$0003, R3                      ; 5C21   02BB 0003
        MVII    #$023F, R4                      ; 5C23   02BC 023F

        JSR     R5,     X_PRINT_R5              ; 5C25   0004 0118 007B

        RLC     R3,     1                       ; 5C28   0053
        SLR     R1,     2                       ; 5C29   0065
        SAR     R0,     2                       ; 5C2A   006C
        SLR     R1,     2                       ; 5C2B   0065
        SLR     R3,     1                       ; 5C2C   0063
        RRC     R0,     2                       ; 5C2D   0074
        NEGR    R0                              ; 5C2E   0020
        GSWD    R1                              ; 5C2F   0031
        NEGR    R0                              ; 5C30   0020
        SAR     R3,     2                       ; 5C31   006F
        RRC     R2,     1                       ; 5C32   0072
        NEGR    R0                              ; 5C33   0020
        GSWD    R2                              ; 5C34   0032
        DECLE   $0000                           ; 5C35   0000

        MVII    #$0003, R3                      ; 5C36   02BB 0003
        MVII    #$026A, R4                      ; 5C38   02BC 026A

        JSR     R5,     X_PRINT_R5              ; 5C3A   0004 0118 007B

        RRC     R0,     1                       ; 5C3D   0070
        SAR     R0,     2                       ; 5C3E   006C
        SLR     R1,     1                       ; 5C3F   0061
        SARC    R1,     1                       ; 5C40   0079
        SLR     R1,     2                       ; 5C41   0065
        RRC     R2,     1                       ; 5C42   0072
        RRC     R3,     1                       ; 5C43   0073
        DECLE   $0000                           ; 5C44   0000

        MVII    #$0003, R3                      ; 5C45   02BB 0003
        MVII    #$02CA, R4                      ; 5C47   02BC 02CA

        JSR     R5,     X_PRINT_R5              ; 5C49   0004 0118 007B

        RRC     R0,     2                       ; 5C4C   0074
        SAR     R0,     1                       ; 5C4D   0068
        SLR     R1,     2                       ; 5C4E   0065
        SAR     R2,     2                       ; 5C4F   006E
        NEGR    R0                              ; 5C50   0020
        RRC     R0,     1                       ; 5C51   0070
        RRC     R2,     1                       ; 5C52   0072
        SLR     R1,     2                       ; 5C53   0065
        RRC     R3,     1                       ; 5C54   0073
        RRC     R3,     1                       ; 5C55   0073
        NEGR    R0                              ; 5C56   0020
        SLR     R1,     2                       ; 5C57   0065
        SAR     R2,     2                       ; 5C58   006E
        RRC     R0,     2                       ; 5C59   0074
        SLR     R1,     2                       ; 5C5A   0065
        RRC     R2,     1                       ; 5C5B   0072
        DECLE   $0000                           ; 5C5C   0000

        MVII    #$0011, R0                      ; 5C5D   02B8 0011
        MVO     R0,     G_012D                  ; 5C5F   0240 012D
        PULR    R7                              ; 5C61   02B7
L_5C62:
        MVII    #$012E, R2                      ; 5C62   02BA 012E
        ADD     G_0198, R2                      ; 5C64   02C2 0198
        MVI@    R2,     R0                      ; 5C66   0290
        MVII    #$018B, R2                      ; 5C67   02BA 018B
        ADD     G_0198, R2                      ; 5C69   02C2 0198
        MVI@    R2,     R2                      ; 5C6B   0292
        ADDR    R0,     R2                      ; 5C6C   00C2
        MVI@    R5,     R3                      ; 5C6D   02AB
L_5C6E:
        MVI@    R5,     R0                      ; 5C6E   02A8
        MVI@    R5,     R1                      ; 5C6F   02A9
        TSTR    R1                              ; 5C70   0089
        BEQ     L_5C76                          ; 5C71   0204 0003

        CMPR    R2,     R1                      ; 5C73   0151
        BLT     L_5C6E                          ; 5C74   0225 0007

L_5C76:
        MVO@    R0,     R3                      ; 5C76   0258
L_5C77:
        TSTR    R1                              ; 5C77   0089
        BEQ     L_5C7E                          ; 5C78   0204 0004

        MVI@    R5,     R0                      ; 5C7A   02A8
        MVI@    R5,     R1                      ; 5C7B   02A9
        B       L_5C77                          ; 5C7C   0220 0006

L_5C7E:
        MOVR    R5,     R7                      ; 5C7E   00AF
L_5C7F:
        PSHR    R5                              ; 5C7F   0275
        CLRR    R1                              ; 5C80   01C9
        MVO     R1,     G_0134                  ; 5C81   0241 0134
        MVO     R1,     G_0110                  ; 5C83   0241 0110
        MVO     R1,     G_01AA                  ; 5C85   0241 01AA
        MVO     R1,     G_01AC                  ; 5C87   0241 01AC
        MVI     G_011D, R1                      ; 5C89   0281 011D
        SDBD                                    ; 5C8B   0001
        MVII    #$9138, R5                      ; 5C8C   02BD 0038 0091
        SLL     R1,     1                       ; 5C8F   0049
        ADDR    R1,     R5                      ; 5C90   00CD
        SDBD                                    ; 5C91   0001
        MVI@    R5,     R1                      ; 5C92   02A9
        MVII    #$0346, R4                      ; 5C93   02BC 0346

        JSR     R5,     L_5E24                  ; 5C95   0004 015C 0224
L_5C98:
        DECLE   $0000                           ; 5C98   0000

        INCR    R0                              ; 5C99   0008
        DECLE   $0000                           ; 5C9A   0000

        ADCR    R0                              ; 5C9B   0028
        DECLE   $0000                           ; 5C9C   0000

        ADCR    R2                              ; 5C9D   002A
        DECLE   $0000                           ; 5C9E   0000

        RSWD    R4                              ; 5C9F   003C
        DECLE   $0001,  $0000                   ; 5CA0   0001 0000

        SETC                                    ; 5CA2   0007
        DECLE   $0000                           ; 5CA3   0000

        JSR     R4,     .STIC.X.5               ; 5CA4   0004 0000 0005
        DECLE   $0000,  $0000,  $0000           ; 5CA7   0000 0000 0000

        B       L_5D12                          ; 5CAA   0200 0066

        DECLE   $0000                           ; 5CAC   0000

        INCR    R0                              ; 5CAD   0008
        DECLE   $0000                           ; 5CAE   0000

        ADCR    R0                              ; 5CAF   0028
        DECLE   $0000                           ; 5CB0   0000

        ADCR    R2                              ; 5CB1   002A
        DECLE   $0000                           ; 5CB2   0000

        INCR    R6                              ; 5CB3   000E
        DECLE   $0001,  $0000                   ; 5CB4   0001 0000

        SETC                                    ; 5CB6   0007
        DECLE   $0000                           ; 5CB7   0000

        JSR     R4,     .STIC.X.5               ; 5CB8   0004 0000 0005
        DECLE   $0000,  $0000,  $0000           ; 5CBB   0000 0000 0000

        B       L_5D12                          ; 5CBE   0200 0052

        DECLE   $0000                           ; 5CC0   0000

        INCR    R0                              ; 5CC1   0008
        DECLE   $0000                           ; 5CC2   0000

        INCR    R2                              ; 5CC3   000A
        DECLE   $0000                           ; 5CC4   0000

        ADCR    R0                              ; 5CC5   0028
        DECLE   $0000                           ; 5CC6   0000

        RSWD    R2                              ; 5CC7   003A
        DECLE   $0001,  $0000                   ; 5CC8   0001 0000

        SETC                                    ; 5CCA   0007
        DECLE   $0000,  $0001,  $0000           ; 5CCB   0000 0001 0000

        JSR     R4,     .STIC.X.0               ; 5CCE   0004 0000 0000
        DECLE   $0000                           ; 5CD1   0000

        B       L_5D12                          ; 5CD2   0200 003E

        DECLE   $0000                           ; 5CD4   0000

        INCR    R0                              ; 5CD5   0008
        DECLE   $0000                           ; 5CD6   0000

        INCR    R2                              ; 5CD7   000A
        DECLE   $0000                           ; 5CD8   0000

        INCR    R6                              ; 5CD9   000E
        DECLE   $0000                           ; 5CDA   0000

        RSWD    R2                              ; 5CDB   003A
        DECLE   $0001,  $0000                   ; 5CDC   0001 0000

        SETC                                    ; 5CDE   0007
        DECLE   $0000,  $0001,  $0000           ; 5CDF   0000 0001 0000

        DIS                                     ; 5CE2   0003
        DECLE   $0000,  $0000,  $0000           ; 5CE3   0000 0000 0000

        B       L_5D12                          ; 5CE6   0200 002A

        DECLE   $0000                           ; 5CE8   0000

        INCR    R0                              ; 5CE9   0008
        DECLE   $0000                           ; 5CEA   0000

        INCR    R6                              ; 5CEB   000E
        DECLE   $0000                           ; 5CEC   0000

        ADCR    R2                              ; 5CED   002A
        DECLE   $0000                           ; 5CEE   0000

        COMR    R6                              ; 5CEF   001E
        DECLE   $0001,  $0000                   ; 5CF0   0001 0000

        SETC                                    ; 5CF2   0007
        DECLE   $0000                           ; 5CF3   0000

        DIS                                     ; 5CF4   0003
        DECLE   $0000,  $0005,  $0000,  $0000   ; 5CF5   0000 0005 0000 0000
        DECLE   $0000                           ; 5CF9   0000

        B       L_5D0E                          ; 5CFA   0200 0012

        DECLE   $0000                           ; 5CFC   0000

        INCR    R0                              ; 5CFD   0008
        DECLE   $0000                           ; 5CFE   0000

        INCR    R6                              ; 5CFF   000E
        DECLE   $0000                           ; 5D00   0000

        ADCR    R4                              ; 5D01   002C
        DECLE   $0000                           ; 5D02   0000

        COMR    R6                              ; 5D03   001E
        DECLE   $0001,  $0000                   ; 5D04   0001 0000

        SETC                                    ; 5D06   0007
        DECLE   $0000                           ; 5D07   0000

        DIS                                     ; 5D08   0003
        DECLE   $0000                           ; 5D09   0000

        CLRC                                    ; 5D0A   0006
        DECLE   $0000,  $0000,  $0000           ; 5D0B   0000 0000 0000
L_5D0E:
        MVII    #$0001, R0                      ; 5D0E   02B8 0001
        MVO     R0,     G_01AA                  ; 5D10   0240 01AA
L_5D12:
        CLRR    R0                              ; 5D12   01C0
        MVO     R0,     G_034A                  ; 5D13   0240 034A
        MVII    #$018B, R1                      ; 5D15   02B9 018B
        ADD     G_0198, R1                      ; 5D17   02C1 0198
        MVI@    R1,     R0                      ; 5D19   0288
        MVII    #$012E, R1                      ; 5D1A   02B9 012E
        ADD     G_0198, R1                      ; 5D1C   02C1 0198
        ADD@    R1,     R0                      ; 5D1E   02C8
        CMPI    #$002C, R0                      ; 5D1F   0378 002C
        BGT     L_5D38                          ; 5D21   020E 0015

        SDBD                                    ; 5D23   0001
        MVII    #$0800, R3                      ; 5D24   02BB 0000 0008
        CMPI    #$001D, R0                      ; 5D27   0378 001D
        BGT     L_5D33                          ; 5D29   020E 0008

        CMPI    #$000E, R0                      ; 5D2B   0378 000E
        BLE     L_5D38                          ; 5D2D   0206 0009

        MVO     R3,     G_0349                  ; 5D2F   0243 0349
        B       L_5D38                          ; 5D31   0200 0005

L_5D33:
        MVO     R3,     G_0348                  ; 5D33   0243 0348
        CLRR    R0                              ; 5D35   01C0
        MVO     R0,     G_034D                  ; 5D36   0240 034D

L_5D38:
        JSR     R5,     L_5C62                  ; 5D38   0004 015C 0062

        ANDR    R4,     R7                      ; 5D3B   01A7
        ADCR    R0                              ; 5D3C   0028
        SETC                                    ; 5D3D   0007
        COMR    R6                              ; 5D3E   001E
        INCR    R6                              ; 5D3F   000E
        DECR    R4                              ; 5D40   0014
        DECR    R5                              ; 5D41   0015
        INCR    R2                              ; 5D42   000A
        COMR    R5                              ; 5D43   001D

        JSR     R4,     .STIC.X.4               ; 5D44   0004 0000 0004

        CMPR    R3,     R4                      ; 5D47   015C
        SLR     R2,     1                       ; 5D48   0062
        SUBR    R6,     R0                      ; 5D49   0130
        INCR    R0                              ; 5D4A   0008
        DECLE   $0001                           ; 5D4B   0001

        INCR    R2                              ; 5D4C   000A

        JSR     R4,     G_0C09                  ; 5D4D   0004 000C 0009

        INCR    R6                              ; 5D50   000E
        INCR    R6                              ; 5D51   000E
        DECR    R0                              ; 5D52   0010
        DECR    R5                              ; 5D53   0015
        DECR    R2                              ; 5D54   0012
        COMR    R5                              ; 5D55   001D
        DECR    R4                              ; 5D56   0014
        NEGR    R3                              ; 5D57   0023
        COMR    R0                              ; 5D58   0018
        ADCR    R2                              ; 5D59   002A
        NEGR    R0                              ; 5D5A   0020
        DECLE   $0000                           ; 5D5B   0000

        JSR     R5,     L_5C62                  ; 5D5C   0004 015C 0062

        SUBR    R6,     R3                      ; 5D5F   0133
        DECR    R0                              ; 5D60   0010
        INCR    R1                              ; 5D61   0009
        COMR    R0                              ; 5D62   0018
        DECR    R2                              ; 5D63   0012
        NEGR    R0                              ; 5D64   0020
        COMR    R5                              ; 5D65   001D
        ADCR    R0                              ; 5D66   0028
        DECLE   $0000                           ; 5D67   0000

        JSR     R5,     L_5C62                  ; 5D68   0004 015C 0062

        SUBR    R6,     R7                      ; 5D6B   0137
        NEGR    R0                              ; 5D6C   0020
        INCR    R6                              ; 5D6D   000E
        RLC     R0,     1                       ; 5D6E   0050
        COMR    R5                              ; 5D6F   001D
        TSTR    R0                              ; 5D70   0080
        ADCR    R4                              ; 5D71   002C
        MOVR    R2,     R0                      ; 5D72   0090
        DECLE   $0000                           ; 5D73   0000

        JSR     R5,     L_5C62                  ; 5D74   0004 015C 0062

        SUBR    R6,     R6                      ; 5D77   0136
        NEGR    R0                              ; 5D78   0020
        INCR    R6                              ; 5D79   000E
        COMR    R0                              ; 5D7A   0018
        COMR    R5                              ; 5D7B   001D
        DECLE   $0001,  $0000                   ; 5D7C   0001 0000

        JSR     R5,     L_5C62                  ; 5D7E   0004 015C 0062

        SUBR    R6,     R5                      ; 5D81   0135
        DECLE   $0000                           ; 5D82   0000

        INCR    R7                              ; 5D83   000F
        DECLE   $0001                           ; 5D84   0001

        COMR    R6                              ; 5D85   001E
        EIS                                     ; 5D86   0002
        DECLE   $0000                           ; 5D87   0000

        MVI     G_0135, R0                      ; 5D88   0280 0135
        CMPI    #$0002, R0                      ; 5D8A   0378 0002
        BNEQ    L_5D91                          ; 5D8C   020C 0003

        DECR    R0                              ; 5D8E   0010
        MVO     R0,     G_0136                  ; 5D8F   0240 0136

L_5D91:
        JSR     R5,     L_5C62                  ; 5D91   0004 015C 0062

        SUBR    R6,     R2                      ; 5D94   0132
        DECR    R0                              ; 5D95   0010

        JSR     R4,     G_0809                  ; 5D96   0004 0008 0009

        CLRC                                    ; 5D99   0006
        INCR    R6                              ; 5D9A   000E

        JSRE    R4,     .EXEC.403               ; 5D9B   0004 0015 0003
        DECLE   $0000                           ; 5D9E   0000

        JSR     R5,     L_5C62                  ; 5D9F   0004 015C 0062

        ANDR    R6,     R7                      ; 5DA2   01B7
        ADCR    R0                              ; 5DA3   0028
        INCR    R1                              ; 5DA4   0009
        COMR    R6                              ; 5DA5   001E
        DECR    R2                              ; 5DA6   0012
        DECR    R4                              ; 5DA7   0014
        COMR    R5                              ; 5DA8   001D
        INCR    R2                              ; 5DA9   000A
        DECLE   $0000                           ; 5DAA   0000

        JSR     R5,     L_5C62                  ; 5DAB   0004 015C 0062

        SUBR    R6,     R1                      ; 5DAE   0131
        DECLE   $0000                           ; 5DAF   0000

        INCR    R1                              ; 5DB0   0009
        DECLE   $0001                           ; 5DB1   0001

        DECR    R7                              ; 5DB2   0017
        EIS                                     ; 5DB3   0002
        DECLE   $0000                           ; 5DB4   0000

        JSR     R5,     L_5DD2                  ; 5DB5   0004 015C 01D2
        JSR     R5,     L_5626                  ; 5DB8   0004 0154 0226

        MVI     G_012D, R0                      ; 5DBB   0280 012D
        ANDI    #$0080, R0                      ; 5DBD   03B8 0080
        BNEQ    L_5DD1                          ; 5DBF   020C 0010

        CLRR    R1                              ; 5DC1   01C9
L_5DC2:
        PSHR    R1                              ; 5DC2   0271

        JSR     R5,     L_5FAB                  ; 5DC3   0004 015C 03AB

        PULR    R1                              ; 5DC6   02B1
        PSHR    R1                              ; 5DC7   0271

        JSR     R5,     L_6012                  ; 5DC8   0004 0160 0012

        PULR    R1                              ; 5DCB   02B1
        INCR    R1                              ; 5DCC   0009
        CMPI    #$0006, R1                      ; 5DCD   0379 0006
        BLT     L_5DC2                          ; 5DCF   0225 000E

L_5DD1:
        PULR    R7                              ; 5DD1   02B7
L_5DD2:
        PSHR    R5                              ; 5DD2   0275

        JSR     R5,     L_5C62                  ; 5DD3   0004 015C 0062

        SUBR    R7,     R0                      ; 5DD6   0138
        DECLE   $0004                           ; 5DD7   0004

        DIS                                     ; 5DD8   0003
        DECLE   $0005                           ; 5DD9   0005

        INCR    R1                              ; 5DDA   0009
        CLRC                                    ; 5DDB   0006
        INCR    R6                              ; 5DDC   000E
        SETC                                    ; 5DDD   0007
        DECR    R5                              ; 5DDE   0015
        INCR    R0                              ; 5DDF   0008
        DECLE   $0000                           ; 5DE0   0000

        PULR    R7                              ; 5DE1   02B7
L_5DE2:
        PSHR    R5                              ; 5DE2   0275
        MVII    #$017B, R5                      ; 5DE3   02BD 017B
        ADD     G_0198, R5                      ; 5DE5   02C5 0198
        MVI@    R5,     R0                      ; 5DE7   02A8
L_5DE8:
        MVII    #$0211, R4                      ; 5DE8   02BC 0211
        MVII    #$0002, R1                      ; 5DEA   02B9 0002
        MVII    #$0003, R3                      ; 5DEC   02BB 0003

        JSR     R5,     X_PRNUM_RGT             ; 5DEE   0004 0118 00C5

        PULR    R7                              ; 5DF1   02B7
L_5DF2:
        PSHR    R5                              ; 5DF2   0275
        MVII    #$0187, R5                      ; 5DF3   02BD 0187
        ADD     G_0198, R5                      ; 5DF5   02C5 0198
        MVI@    R5,     R0                      ; 5DF7   02A8
        MVII    #$0201, R4                      ; 5DF8   02BC 0201
        MVII    #$0002, R1                      ; 5DFA   02B9 0002
        MVII    #$0007, R3                      ; 5DFC   02BB 0007

        JSR     R5,     .EXEC.89F               ; 5DFE   0004 0118 009F

        PULR    R7                              ; 5E01   02B7
L_5E02:
        MVII    #$020C, R4                      ; 5E02   02BC 020C
        MVI     G_0198, R2                      ; 5E04   0282 0198
L_5E06:
        PSHR    R5                              ; 5E06   0275
        MVII    #$0086, R0                      ; 5E07   02B8 0086
        MVO@    R0,     R4                      ; 5E09   0260
        SUBI    #$0005, R4                      ; 5E0A   033C 0005
        PSHR    R4                              ; 5E0C   0274
        PSHR    R2                              ; 5E0D   0272

        JSR     R5,     L_5E60                  ; 5E0E   0004 015C 0260

        PULR    R2                              ; 5E11   02B2
        PULR    R4                              ; 5E12   02B4
        SUBI    #$0004, R4                      ; 5E13   033C 0004
        MVII    #$0350, R3                      ; 5E15   02BB 0350
        ADDR    R2,     R3                      ; 5E17   00D3
        MVI@    R3,     R0                      ; 5E18   0298
        TSTR    R0                              ; 5E19   0080
        BEQ     L_5E23                          ; 5E1A   0204 0007

        MVII    #$0004, R1                      ; 5E1C   02B9 0004
        MVII    #$0006, R3                      ; 5E1E   02BB 0006

        JSR     R5,     X_PRNUM_RGT             ; 5E20   0004 0118 00C5

L_5E23:
        PULR    R7                              ; 5E23   02B7
L_5E24:
        MOVR    R1,     R5                      ; 5E24   008D
        B       L_5E2A                          ; 5E25   0200 0003

L_5E27:
        MVO@    R0,     R4                      ; 5E27   0260
        INCR    R7                              ; 5E28   000F
L_5E29:
        MVI@    R5,     R4                      ; 5E29   02AC
L_5E2A:
        SDBD                                    ; 5E2A   0001
        MVI@    R5,     R0                      ; 5E2B   02A8
        TSTR    R0                              ; 5E2C   0080
        BNEQ    L_5E27                          ; 5E2D   022C 0007

        MOVR    R5,     R7                      ; 5E2F   00AF
L_5E30:
        MVI@    R5,     R0                      ; 5E30   02A8
        MVO@    R0,     R4                      ; 5E31   0260
L_5E32:
        MVI@    R5,     R4                      ; 5E32   02AC
        TSTR    R4                              ; 5E33   00A4
        BNEQ    L_5E30                          ; 5E34   022C 0005

        MOVR    R5,     R7                      ; 5E36   00AF
L_5E37:
        PSHR    R5                              ; 5E37   0275
        PSHR    R4                              ; 5E38   0274
        PSHR    R3                              ; 5E39   0273
        MVI     G_0198, R3                      ; 5E3A   0283 0198
        PSHR    R2                              ; 5E3C   0272
        PSHR    R1                              ; 5E3D   0271
        PSHR    R0                              ; 5E3E   0270
        MVII    #$0352, R2                      ; 5E3F   02BA 0352
        ADDR    R3,     R2                      ; 5E41   00DA
        MVI@    R2,     R1                      ; 5E42   0291
        ADDR    R0,     R1                      ; 5E43   00C1
        MVO@    R1,     R2                      ; 5E44   0251
        SDBD                                    ; 5E45   0001
        SUBI    #$07D0, R1                      ; 5E46   0339 00D0 0007
        BMI     L_5E59                          ; 5E49   020B 000E

        MVO@    R1,     R2                      ; 5E4B   0251
        MVII    #$0187, R2                      ; 5E4C   02BA 0187
        ADDR    R3,     R2                      ; 5E4E   00DA
        MVI@    R2,     R1                      ; 5E4F   0291
        INCR    R1                              ; 5E50   0009
        MVO@    R1,     R2                      ; 5E51   0251

        JSR     R5,     L_5DF2                  ; 5E52   0004 015C 01F2
        JSR     R5,     G_AC27                  ; 5E55   0004 01AC 0027
        DECLE   $0036                           ; 5E58   0036
L_5E59:
        PULR    R0                              ; 5E59   02B0
        MVII    #$0208, R4                      ; 5E5A   02BC 0208
        MVI     G_0198, R2                      ; 5E5C   0282 0198
L_5E5E:
        B       L_5E66                          ; 5E5E   0200 0006

L_5E60:
        PSHR    R5                              ; 5E60   0275
        PSHR    R4                              ; 5E61   0274
        PSHR    R3                              ; 5E62   0273
        CLRR    R0                              ; 5E63   01C0
        PSHR    R2                              ; 5E64   0272
        PSHR    R1                              ; 5E65   0271
L_5E66:
        ADDI    #$034E, R2                      ; 5E66   02FA 034E
        MVI@    R2,     R1                      ; 5E68   0291
        ADDR    R1,     R0                      ; 5E69   00C8
        MVO@    R0,     R2                      ; 5E6A   0250
        MVII    #$0004, R1                      ; 5E6B   02B9 0004
        MVII    #$0006, R3                      ; 5E6D   02BB 0006
        SDBD                                    ; 5E6F   0001
        SUBI    #$2710, R0                      ; 5E70   0338 0010 0027
        BMI     L_5E84                          ; 5E73   020B 000F

        MVO@    R0,     R2                      ; 5E75   0250

        JSR     R5,     X_PRNUM_ZRO             ; 5E76   0004 0118 00AD

        ADDI    #$0002, R2                      ; 5E79   02FA 0002
        MVI@    R2,     R0                      ; 5E7B   0290
        INCR    R0                              ; 5E7C   0008
        MVO@    R0,     R2                      ; 5E7D   0250
        SUBR    R1,     R4                      ; 5E7E   010C

L_5E7F:
        JSR     R5,     X_PRNUM_RGT             ; 5E7F   0004 0118 00C5

        B       L_5E8E                          ; 5E82   0200 000A

L_5E84:
        MVI@    R2,     R0                      ; 5E84   0290
        ADDI    #$0002, R2                      ; 5E85   02FA 0002
        MVI@    R2,     R2                      ; 5E87   0292
        TSTR    R2                              ; 5E88   0092
        BEQ     L_5E7F                          ; 5E89   0224 000B

        JSR     R5,     X_PRNUM_ZRO             ; 5E8B   0004 0118 00AD

L_5E8E:
        PULR    R1                              ; 5E8E   02B1
        PULR    R2                              ; 5E8F   02B2
        NOP                                     ; 5E90   0034
        PULR    R3                              ; 5E91   02B3
        PULR    R4                              ; 5E92   02B4
        PULR    R7                              ; 5E93   02B7
L_5E94:
        PSHR    R5                              ; 5E94   0275
        MOVR    R2,     R5                      ; 5E95   0095
        ADDI    #$033F, R2                      ; 5E96   02FA 033F
        MVI@    R2,     R3                      ; 5E98   0293
        SDBD                                    ; 5E99   0001
        CMPI    #$9B33, R3                      ; 5E9A   037B 0033 009B
        BGE     L_5F40                          ; 5E9D   020D 00A1

        MOVR    R5,     R2                      ; 5E9F   00AA
        SLL     R2,     2                       ; 5EA0   004E
        SLL     R2,     2                       ; 5EA1   004E
        ADDI    #$0173, R2                      ; 5EA2   02FA 0173
        MVII    #$0080, R0                      ; 5EA4   02B8 0080
        MVI@    R2,     R3                      ; 5EA6   0293
        ANDR    R0,     R3                      ; 5EA7   0183
        BEQ     L_5EBA                          ; 5EA8   0204 0010

        PSHR    R2                              ; 5EAA   0272
        MOVR    R5,     R2                      ; 5EAB   00AA
        ADDI    #$032B, R2                      ; 5EAC   02FA 032B
        MVI@    R2,     R3                      ; 5EAE   0293
        SDBD                                    ; 5EAF   0001
        ANDI    #$1007, R3                      ; 5EB0   03BB 0007 0010
        PULR    R2                              ; 5EB3   02B2
        SDBD                                    ; 5EB4   0001
        CMPI    #$1000, R3                      ; 5EB5   037B 0000 0010
        BNEQ    L_5F40                          ; 5EB8   020C 0086

L_5EBA:
        MVO@    R0,     R2                      ; 5EBA   0250
        PSHR    R2                              ; 5EBB   0272
        SUBI    #$0006, R2                      ; 5EBC   033A 0006
        CLRR    R0                              ; 5EBE   01C0
        MVO@    R0,     R2                      ; 5EBF   0250
        MOVR    R5,     R2                      ; 5EC0   00AA
        ADDI    #$033F, R2                      ; 5EC1   02FA 033F
        MOVR    R1,     R3                      ; 5EC3   008B
        SLL     R3,     2                       ; 5EC4   004F
        SLL     R3,     2                       ; 5EC5   004F
        SDBD                                    ; 5EC6   0001
        ADDI    #$9B33, R3                      ; 5EC7   02FB 0033 009B
        MVO@    R3,     R2                      ; 5ECA   0253
        PULR    R2                              ; 5ECB   02B2
        MOVR    R1,     R3                      ; 5ECC   008B
        ADDI    #$0003, R2                      ; 5ECD   02FA 0003
        MVI     G_0134, R0                      ; 5ECF   0280 0134
        TSTR    R0                              ; 5ED1   0080
        BNEQ    L_5EDB                          ; 5ED2   020C 0007

        MOVR    R3,     R0                      ; 5ED4   0098
        SLL     R0,     2                       ; 5ED5   004C
        SLL     R0,     1                       ; 5ED6   0048
        ADD     G_01A7, R0                      ; 5ED7   02C0 01A7
        SUBI    #$000A, R0                      ; 5ED9   0338 000A
L_5EDB:
        ADDI    #$000A, R0                      ; 5EDB   02F8 000A
        MVO@    R0,     R2                      ; 5EDD   0250
        MOVR    R5,     R2                      ; 5EDE   00AA
        ADDI    #$032B, R2                      ; 5EDF   02FA 032B
        MVI@    R2,     R0                      ; 5EE1   0290
        SDBD                                    ; 5EE2   0001
        ANDI    #$EFF8, R0                      ; 5EE3   03B8 00F8 00EF
        XORI    #$0007, R0                      ; 5EE6   03F8 0007
        MVO@    R0,     R2                      ; 5EE8   0250
        PSHR    R5                              ; 5EE9   0275

        JSR     R5,     L_5EF3                  ; 5EEA   0004 015C 02F3

        DECR    R4                              ; 5EED   0014
        GSWD    R2                              ; 5EEE   0032
        SLR     R0,     2                       ; 5EEF   0064
        ADDR    R1,     R0                      ; 5EF0   00C8
        ANDR    R2,     R0                      ; 5EF1   0190
        SUB@    R4,     R0                      ; 5EF2   0320
L_5EF3:
        ADDR    R1,     R5                      ; 5EF3   00CD
        MVI@    R5,     R0                      ; 5EF4   02A8

        JSR     R5,     L_5E37                  ; 5EF5   0004 015C 0237
        JSR     R5,     G_AC27                  ; 5EF8   0004 01AC 0027

        GSWD    R3                              ; 5EFB   0033
        PULR    R1                              ; 5EFC   02B1
        MVI     G_01BE, R0                      ; 5EFD   0280 01BE
        TSTR    R0                              ; 5EFF   0080
        BEQ     L_5F3D                          ; 5F00   0204 003B

        ANDI    #$0080, R0                      ; 5F02   03B8 0080
        BNEQ    L_5F3D                          ; 5F04   020C 0037

        MVI     G_01A8, R2                      ; 5F06   0282 01A8
        MVO     R1,     G_01A8                  ; 5F08   0241 01A8
        MOVR    R2,     R5                      ; 5F0A   0095
        CMPI    #$0006, R2                      ; 5F0B   037A 0006
        BGE     L_5F3D                          ; 5F0D   020D 002E

        SLL     R1,     2                       ; 5F0F   004D
        SLL     R1,     2                       ; 5F10   004D
        ADDI    #$0170, R1                      ; 5F11   02F9 0170
        MVI@    R1,     R0                      ; 5F13   0288
        SLL     R2,     2                       ; 5F14   004E
        SLL     R2,     2                       ; 5F15   004E
        ADDI    #$0173, R2                      ; 5F16   02FA 0173
        MVI@    R2,     R3                      ; 5F18   0293
        ANDI    #$0080, R3                      ; 5F19   03BB 0080
        BEQ     L_5F3D                          ; 5F1B   0204 0020

        SUBI    #$0003, R2                      ; 5F1D   033A 0003
        MVI@    R2,     R3                      ; 5F1F   0293
        SUBR    R3,     R0                      ; 5F20   0118
        BPL     L_5F24                          ; 5F21   0203 0001

        NEGR    R0                              ; 5F23   0020
L_5F24:
        CMPI    #$0004, R0                      ; 5F24   0378 0004
        BGT     L_5F3D                          ; 5F26   020E 0015

        ADDI    #$0002, R1                      ; 5F28   02F9 0002
        ADDI    #$0002, R2                      ; 5F2A   02FA 0002
        MVI@    R1,     R0                      ; 5F2C   0288
        MVI@    R2,     R3                      ; 5F2D   0293
        SUBR    R3,     R0                      ; 5F2E   0118
        BPL     L_5F32                          ; 5F2F   0203 0001

        NEGR    R0                              ; 5F31   0020
L_5F32:
        CMPI    #$0004, R0                      ; 5F32   0378 0004
        BGT     L_5F3D                          ; 5F34   020E 0007

        ADDI    #$033F, R5                      ; 5F36   02FD 033F
        SDBD                                    ; 5F38   0001
        MVII    #$9183, R0                      ; 5F39   02B8 0083 0091
        MVO@    R0,     R5                      ; 5F3C   0268
L_5F3D:
        MVII    #$0001, R5                      ; 5F3D   02BD 0001
        PULR    R7                              ; 5F3F   02B7
L_5F40:
        CLRR    R5                              ; 5F40   01ED
        PULR    R7                              ; 5F41   02B7
L_5F42:
        MVII    #$011E, R2                      ; 5F42   02BA 011E
        ADD     G_0198, R2                      ; 5F44   02C2 0198
        MVI@    R2,     R0                      ; 5F46   0290
        INCR    R0                              ; 5F47   0008
        CMPI    #$000F, R0                      ; 5F48   0378 000F
        BLT     L_5F4D                          ; 5F4A   0205 0001

        CLRR    R0                              ; 5F4C   01C0
L_5F4D:
        MVO@    R0,     R2                      ; 5F4D   0250
        MVO     R0,     G_011D                  ; 5F4E   0240 011D
        MOVR    R5,     R7                      ; 5F50   00AF
L_5F51:
        PSHR    R5                              ; 5F51   0275
        MVI     G_0198, R3                      ; 5F52   0283 0198
        MVII    #$02EE, R4                      ; 5F54   02BC 02EE
        INCR    R7                              ; 5F56   000F
L_5F57:
        PSHR    R5                              ; 5F57   0275
        ADDI    #$012E, R3                      ; 5F58   02FB 012E
        MVI@    R3,     R0                      ; 5F5A   0298
        INCR    R0                              ; 5F5B   0008
        MVII    #$0002, R1                      ; 5F5C   02B9 0002
        MVII    #$0006, R3                      ; 5F5E   02BB 0006

        JSR     R5,     X_PRNUM_RGT             ; 5F60   0004 0118 00C5

        PULR    R7                              ; 5F63   02B7
L_5F64:
        PSHR    R5                              ; 5F64   0275
        CLRR    R1                              ; 5F65   01C9
L_5F66:
        INCR    R1                              ; 5F66   0009
        SUBI    #$0014, R0                      ; 5F67   0338 0014
        BPL     L_5F66                          ; 5F69   0223 0004

        SLL     R1,     2                       ; 5F6B   004D
        SLL     R1,     1                       ; 5F6C   0049
        ADDI    #$0014, R0                      ; 5F6D   02F8 0014
        SLL     R0,     2                       ; 5F6F   004C
        SLL     R0,     1                       ; 5F70   0048
        PULR    R7                              ; 5F71   02B7
L_5F72:
        PSHR    R5                              ; 5F72   0275
        DECR    R2                              ; 5F73   0012
        SLR     R2,     2                       ; 5F74   0066
        SLR     R2,     1                       ; 5F75   0062
        ADDI    #$0003, R1                      ; 5F76   02F9 0003
        CMPI    #$00A7, R1                      ; 5F78   0379 00A7
        BGE     L_5FA9                          ; 5F7A   020D 002D

        SLR     R1,     2                       ; 5F7C   0065
        SLR     R1,     1                       ; 5F7D   0061
        DECR    R1                              ; 5F7E   0011
        CMPI    #$000C, R2                      ; 5F7F   037A 000C
        BGE     L_5FA9                          ; 5F81   020D 0026

        JSR     R5,     L_5F92                  ; 5F83   0004 015C 0392
        DECLE   $0000                           ; 5F86   0000

        DECR    R4                              ; 5F87   0014
        ADCR    R0                              ; 5F88   0028
        RSWD    R4                              ; 5F89   003C
        RLC     R0,     1                       ; 5F8A   0050
        SLR     R0,     2                       ; 5F8B   0064
        SARC    R0,     1                       ; 5F8C   0078
        MOVR    R1,     R4                      ; 5F8D   008C
        MOVR    R4,     R0                      ; 5F8E   00A0
        MOVR    R6,     R4                      ; 5F8F   00B4
        ADDR    R1,     R0                      ; 5F90   00C8
        ADDR    R3,     R4                      ; 5F91   00DC
L_5F92:
        ADDR    R2,     R5                      ; 5F92   00D5
        ADD@    R5,     R1                      ; 5F93   02E9
        MOVR    R1,     R2                      ; 5F94   008A
        ADDI    #$0200, R1                      ; 5F95   02F9 0200
        MVI@    R1,     R1                      ; 5F97   0289
        MOVR    R1,     R5                      ; 5F98   008D
        ANDI    #$0007, R5                      ; 5F99   03BD 0007
        PSHR    R1                              ; 5F9B   0271
        MVI     G_034C, R1                      ; 5F9C   0281 034C
        CMPR    R1,     R5                      ; 5F9E   014D
        PULR    R1                              ; 5F9F   02B1
        BNEQ    L_5FA9                          ; 5FA0   020C 0007

        ANDI    #$01F8, R1                      ; 5FA2   03B9 01F8
        CMPI    #$0040, R1                      ; 5FA4   0379 0040
        BEQ     L_5FA9                          ; 5FA6   0204 0001

        PULR    R7                              ; 5FA8   02B7
L_5FA9:
        CLRR    R1                              ; 5FA9   01C9
        PULR    R7                              ; 5FAA   02B7
L_5FAB:
        PSHR    R5                              ; 5FAB   0275
        MOVR    R1,     R3                      ; 5FAC   008B
        SLL     R1,     1                       ; 5FAD   0049
        ADDI    #$033F, R3                      ; 5FAE   02FB 033F
        MVI     G_0134, R2                      ; 5FB0   0282 0134
        TSTR    R2                              ; 5FB2   0092
        BNEQ    L_6006                          ; 5FB3   020C 0051

        MVII    #$012E, R2                      ; 5FB5   02BA 012E
        ADD     G_0198, R2                      ; 5FB7   02C2 0198
        MVI@    R2,     R2                      ; 5FB9   0292
        CMPI    #$0003, R2                      ; 5FBA   037A 0003
        BLE     L_5FC8                          ; 5FBC   0206 000A

        ADDI    #$000C, R1                      ; 5FBE   02F9 000C
        MVI     G_011D, R2                      ; 5FC0   0282 011D
        CMPI    #$0009, R2                      ; 5FC2   037A 0009
        BLE     L_5FC8                          ; 5FC4   0206 0002

        ADDI    #$000C, R1                      ; 5FC6   02F9 000C

L_5FC8:
        JSR     R5,     L_5FEF                  ; 5FC8   0004 015C 03EF

        DIS                                     ; 5FCB   0003
        MOVR    R2,     R7                      ; 5FCC   0097
        DIS                                     ; 5FCD   0003
        MOVR    R2,     R7                      ; 5FCE   0097
        ADDR    R0,     R3                      ; 5FCF   00C3
        MOVR    R2,     R7                      ; 5FD0   0097
        DIS                                     ; 5FD1   0003
        MOVR    R2,     R7                      ; 5FD2   0097
        DIS                                     ; 5FD3   0003
        MOVR    R2,     R7                      ; 5FD4   0097
        MOVR    R4,     R3                      ; 5FD5   00A3
        MOVR    R3,     R2                      ; 5FD6   009A
        DIS                                     ; 5FD7   0003
        MOVR    R2,     R7                      ; 5FD8   0097
        DIS                                     ; 5FD9   0003
        MOVR    R2,     R7                      ; 5FDA   0097
        ADDR    R0,     R3                      ; 5FDB   00C3
        MOVR    R2,     R7                      ; 5FDC   0097
        MOVR    R0,     R3                      ; 5FDD   0083
        MOVR    R3,     R0                      ; 5FDE   0098
        MOVR    R0,     R3                      ; 5FDF   0083
        MOVR    R3,     R0                      ; 5FE0   0098
        MOVR    R4,     R3                      ; 5FE1   00A3
        MOVR    R3,     R2                      ; 5FE2   009A
        SWAP    R3,     1                       ; 5FE3   0043
        MOVR    R3,     R1                      ; 5FE4   0099
        SWAP    R3,     1                       ; 5FE5   0043
        MOVR    R3,     R1                      ; 5FE6   0099
        ADDR    R0,     R3                      ; 5FE7   00C3
        MOVR    R2,     R7                      ; 5FE8   0097
        MOVR    R0,     R3                      ; 5FE9   0083
        MOVR    R3,     R0                      ; 5FEA   0098
        MOVR    R0,     R3                      ; 5FEB   0083
        MOVR    R3,     R0                      ; 5FEC   0098
        MOVR    R4,     R3                      ; 5FED   00A3
        MOVR    R3,     R2                      ; 5FEE   009A
L_5FEF:
        ADDR    R1,     R5                      ; 5FEF   00CD
        SDBD                                    ; 5FF0   0001
        MVI@    R5,     R1                      ; 5FF1   02A9
        MVII    #$0040, R2                      ; 5FF2   02BA 0040
        MVI     G_015E, R5                      ; 5FF4   0285 015E
        CMPI    #$0001, R5                      ; 5FF6   037D 0001
        BNEQ    L_5FFF                          ; 5FF8   020C 0005

        ADDR    R2,     R1                      ; 5FFA   00D1
        TSTR    R4                              ; 5FFB   00A4
        BPL     L_5FFF                          ; 5FFC   0203 0001

        ADDR    R2,     R1                      ; 5FFE   00D1
L_5FFF:
        PSHR    R3                              ; 5FFF   0273

        JSR     R5,     L_509D                  ; 6000   0004 0150 009D

        PULR    R3                              ; 6003   02B3
        MVO@    R0,     R3                      ; 6004   0258
L_6005:
        PULR    R7                              ; 6005   02B7
L_6006:
        MVII    #$0080, R2                      ; 6006   02BA 0080
        SDBD                                    ; 6008   0001
        MVII    #$9A23, R1                      ; 6009   02B9 0023 009A
        B       L_5FFF                          ; 600C   0220 000E

L_600E:
        ADDI    #$0024, R1                      ; 600E   02F9 0024
        B       L_602F                          ; 6010   0200 001D

L_6012:
        PSHR    R5                              ; 6012   0275
        MOVR    R1,     R2                      ; 6013   008A
        SLL     R1,     1                       ; 6014   0049
        MVI     G_0134, R0                      ; 6015   0280 0134
        TSTR    R0                              ; 6017   0080
        BNEQ    L_600E                          ; 6018   022C 000B

        PSHR    R2                              ; 601A   0272
        MVII    #$012E, R2                      ; 601B   02BA 012E
        ADD     G_0198, R2                      ; 601D   02C2 0198
        MVI@    R2,     R0                      ; 601F   0290
        PULR    R2                              ; 6020   02B2
        CMPI    #$0003, R0                      ; 6021   0378 0003
        BLE     L_602F                          ; 6023   0206 000A

        MVI     G_011D, R0                      ; 6025   0280 011D
        ADDI    #$000C, R1                      ; 6027   02F9 000C
        CMPI    #$0009, R0                      ; 6029   0378 0009
        BLE     L_602F                          ; 602B   0206 0002

        ADDI    #$000C, R1                      ; 602D   02F9 000C

L_602F:
        JSR     R5,     L_6062                  ; 602F   0004 0160 0062

        EIS                                     ; 6032   0002
        DECR    R0                              ; 6033   0010
        EIS                                     ; 6034   0002
        DECR    R0                              ; 6035   0010
        SETC                                    ; 6036   0007
        DECLE   $0000                           ; 6037   0000

        EIS                                     ; 6038   0002
        DECR    R0                              ; 6039   0010
        EIS                                     ; 603A   0002
        DECR    R0                              ; 603B   0010
        EIS                                     ; 603C   0002
        DECLE   $0000                           ; 603D   0000

        EIS                                     ; 603E   0002
        DECR    R0                              ; 603F   0010
        EIS                                     ; 6040   0002
        DECR    R0                              ; 6041   0010
        SETC                                    ; 6042   0007
        DECLE   $0000                           ; 6043   0000

        CLRC                                    ; 6044   0006
        DECLE   $0000                           ; 6045   0000

        CLRC                                    ; 6046   0006
        DECLE   $0000                           ; 6047   0000

        EIS                                     ; 6048   0002
        DECLE   $0000                           ; 6049   0000

        EIS                                     ; 604A   0002
        DECR    R0                              ; 604B   0010
        EIS                                     ; 604C   0002
        DECR    R0                              ; 604D   0010
        SETC                                    ; 604E   0007
        DECLE   $0000                           ; 604F   0000

        CLRC                                    ; 6050   0006
        DECLE   $0000                           ; 6051   0000

        CLRC                                    ; 6052   0006
        DECLE   $0000                           ; 6053   0000

        EIS                                     ; 6054   0002
        DECLE   $0000                           ; 6055   0000

        EIS                                     ; 6056   0002
        DECR    R0                              ; 6057   0010
        EIS                                     ; 6058   0002
        DECLE   $0000                           ; 6059   0000

        DIS                                     ; 605A   0003
        DECLE   $0000                           ; 605B   0000

        CLRC                                    ; 605C   0006
        DECLE   $0000                           ; 605D   0000

        SETC                                    ; 605E   0007
        DECR    R0                              ; 605F   0010
        SETC                                    ; 6060   0007
        DECR    R0                              ; 6061   0010
L_6062:
        ADDR    R1,     R5                      ; 6062   00CD
        SDBD                                    ; 6063   0001
        MVI@    R5,     R1                      ; 6064   02A9
        MVI     G_01AA, R5                      ; 6065   0285 01AA
        TSTR    R5                              ; 6067   00AD
        BEQ     L_607A                          ; 6068   0204 0010

        SDBD                                    ; 606A   0001
        CMPI    #$1002, R1                      ; 606B   0379 0002 0010
        BNEQ    L_6074                          ; 606E   020C 0004

        MVII    #$0002, R1                      ; 6070   02B9 0002
        B       L_607A                          ; 6072   0200 0006

L_6074:
        CMPI    #$0003, R1                      ; 6074   0379 0003
        BNEQ    L_607A                          ; 6076   020C 0002

        MVII    #$0001, R1                      ; 6078   02B9 0001
L_607A:
        ADDI    #$032B, R2                      ; 607A   02FA 032B
        MVI@    R2,     R0                      ; 607C   0290
        SDBD                                    ; 607D   0001
        ANDI    #$EFF8, R0                      ; 607E   03B8 00F8 00EF
        XORR    R1,     R0                      ; 6081   01C8
        MVO@    R0,     R2                      ; 6082   0250
        PULR    R7                              ; 6083   02B7
L_6084:
        PSHR    R5                              ; 6084   0275
        MVI     G_011D, R0                      ; 6085   0280 011D
L_6087:
        CMPI    #$0003, R0                      ; 6087   0378 0003
        BEQ     L_60C7                          ; 6089   0204 003C

        MVII    #$033B, R3                      ; 608B   02BB 033B
        MVI     G_0115, R1                      ; 608D   0281 0115
        CMPI    #$0001, R0                      ; 608F   0378 0001
        BEQ     L_6097                          ; 6091   0204 0004

        ANDI    #$0001, R0                      ; 6093   03B8 0001
        BEQ     L_60A3                          ; 6095   0204 000C

L_6097:
        ANDI    #$0003, R1                      ; 6097   03B9 0003
        BNEQ    L_60BB                          ; 6099   020C 0020

        JSR     R5,     L_509A                  ; 609B   0004 0150 009A

        GSWD    R0                              ; 609E   0030
        SLL     R3,     1                       ; 609F   004B
        MOVR    R2,     R4                      ; 60A0   0094
        B       L_60BA                          ; 60A1   0200 0017

L_60A3:
        ANDI    #$000F, R1                      ; 60A3   03B9 000F
        BNEQ    L_60BB                          ; 60A5   020C 0014

        MVII    #$0020, R2                      ; 60A7   02BA 0020
        SDBD                                    ; 60A9   0001
        MVII    #$947B, R1                      ; 60AA   02B9 007B 0094
        MVI     G_011D, R5                      ; 60AD   0285 011D
        ANDI    #$0002, R5                      ; 60AF   03BD 0002
        BNEQ    L_60B7                          ; 60B1   020C 0004

        SDBD                                    ; 60B3   0001
L_60B4:
        MVII    #$949B, R1                      ; 60B4   02B9 009B 0094

L_60B7:
        JSR     R5,     L_509D                  ; 60B7   0004 0150 009D

L_60BA:
        MVO@    R0,     R3                      ; 60BA   0258
L_60BB:
        MVI     G_012D, R1                      ; 60BB   0281 012D
        MVI     G_011D, R0                      ; 60BD   0280 011D
        CMPI    #$0005, R0                      ; 60BF   0378 0005
        BEQ     L_61D0                          ; 60C1   0204 010D

        CMPI    #$0001, R0                      ; 60C3   0378 0001
        BEQ     L_61D0                          ; 60C5   0204 0109

L_60C7:
        MVI     G_012D, R1                      ; 60C7   0281 012D
        ANDI    #$0001, R1                      ; 60C9   03B9 0001
        BNEQ    L_6005                          ; 60CB   022C 00C7

        MVI     G_011D, R0                      ; 60CD   0280 011D
        CMPI    #$0003, R0                      ; 60CF   0378 0003
        BEQ     L_60D8                          ; 60D1   0204 0005

        MVI     G_0135, R0                      ; 60D3   0280 0135
        TSTR    R0                              ; 60D5   0080
        BEQ     L_6110                          ; 60D6   0204 0038

L_60D8:
        MVI     G_0127, R0                      ; 60D8   0280 0127
        MOVR    R0,     R1                      ; 60DA   0081
        ADDI    #$0128, R1                      ; 60DB   02F9 0128
        MVI@    R1,     R2                      ; 60DD   028A
        INCR    R2                              ; 60DE   000A
        CMPI    #$0003, R0                      ; 60DF   0378 0003
        BNEQ    L_6119                          ; 60E1   020C 0036

        CLRR    R3                              ; 60E3   01DB
        MVI     G_0136, R5                      ; 60E4   0285 0136
        MVO@    R2,     R1                      ; 60E6   024A
        CMPR    R5,     R2                      ; 60E7   016A
        BLE     L_6005                          ; 60E8   0226 00E4

        MVO@    R3,     R1                      ; 60EA   024B

        JSR     R5,     L_60F6                  ; 60EB   0004 0160 00F6
        DECLE   $0000,  $0001,  $0000,  $0001   ; 60EE   0000 0001 0000 0001
        DECLE   $0000                           ; 60F2   0000

        EIS                                     ; 60F3   0002
        DECLE   $0000                           ; 60F4   0000

        EIS                                     ; 60F5   0002
L_60F6:
        MVI     G_0135, R2                      ; 60F6   0282 0135
        CMPI    #$0001, R2                      ; 60F8   037A 0001
        BGT     L_6108                          ; 60FA   020E 000C

        MVI     G_012C, R1                      ; 60FC   0281 012C
        INCR    R1                              ; 60FE   0009
        ANDI    #$0007, R1                      ; 60FF   03B9 0007
        MVO     R1,     G_012C                  ; 6101   0241 012C
        ADDR    R1,     R5                      ; 6103   00CD
        MVI@    R5,     R5                      ; 6104   02AD
        MVO     R5,     G_0127                  ; 6105   0245 0127
        PULR    R7                              ; 6107   02B7
L_6108:
        MVII    #$0002, R0                      ; 6108   02B8 0002

        JSR     R5,     X_RAND1                 ; 610A   0004 0114 027D

        MVO     R0,     G_0127                  ; 610D   0240 0127
        PULR    R7                              ; 610F   02B7
L_6110:
        SDBD                                    ; 6110   0001
        MVII    #$9B93, R0                      ; 6111   02B8 0093 009B
        MVO     R0,     G_0339                  ; 6114   0240 0339
        MVO     R0,     G_033A                  ; 6116   0240 033A
        PULR    R7                              ; 6118   02B7
L_6119:
        CMPI    #$0008, R2                      ; 6119   037A 0008
        BLT     L_6120                          ; 611B   0205 0003

        MVO     R0,     G_01A9                  ; 611D   0240 01A9
        CLRR    R2                              ; 611F   01D2
L_6120:
        MVO@    R2,     R1                      ; 6120   024A
        MVI     G_0127, R3                      ; 6121   0283 0127
        MVI     G_011D, R0                      ; 6123   0280 011D
        CMPI    #$0003, R0                      ; 6125   0378 0003
        BEQ     L_612E                          ; 6127   0204 0005

        CMPI    #$0002, R3                      ; 6129   037B 0002
        BNEQ    L_612E                          ; 612B   020C 0001

        DECR    R3                              ; 612D   0013
L_612E:
        ADDI    #$0339, R3                      ; 612E   02FB 0339
        PSHR    R3                              ; 6130   0273
        PSHR    R2                              ; 6131   0272
        PSHR    R1                              ; 6132   0271

        JSR     R5,     L_509A                  ; 6133   0004 0150 009A

        TSTR    R0                              ; 6136   0080
        MOVR    R2,     R3                      ; 6137   0093
        TSTR    R3                              ; 6138   009B
        PULR    R1                              ; 6139   02B1
        PULR    R2                              ; 613A   02B2
        PULR    R3                              ; 613B   02B3
        MVO@    R0,     R3                      ; 613C   0258
        ANDI    #$0003, R2                      ; 613D   03BA 0003
        BNEQ    L_6005                          ; 613F   022C 013B

        SDBD                                    ; 6141   0001
        CMPI    #$9BD3, R0                      ; 6142   0378 00D3 009B
        BNEQ    L_615A                          ; 6145   020C 0013

        MVI     G_0112, R1                      ; 6147   0281 0112
        MVI     G_0114, R2                      ; 6149   0282 0114
        MVII    #$0111, R4                      ; 614B   02BC 0111

        JSR     R5,     L_57D1                  ; 614D   0004 0154 03D1

        MVI     G_0110, R5                      ; 6150   0285 0110
        ANDI    #$0010, R5                      ; 6152   03BD 0010
        BEQ     L_6166                          ; 6154   0204 0010

        JSR     R5,     L_59BF                  ; 6156   0004 0158 01BF

        PULR    R7                              ; 6159   02B7
L_615A:
        CLRR    R0                              ; 615A   01C0
        MVO@    R0,     R1                      ; 615B   0248
        SDBD                                    ; 615C   0001
        MVII    #$9B93, R0                      ; 615D   02B8 0093 009B
        MVO@    R0,     R3                      ; 6160   0258
L_6161:
        MVII    #$0003, R2                      ; 6161   02BA 0003
        MVO     R2,     G_0127                  ; 6163   0242 0127
        PULR    R7                              ; 6165   02B7
L_6166:
        MVI     G_0134, R0                      ; 6166   0280 0134
        TSTR    R0                              ; 6168   0080
        BNEQ    L_6161                          ; 6169   022C 0009

        MVII    #$016F, R4                      ; 616B   02BC 016F
L_616D:
        PSHR    R4                              ; 616D   0274
        INCR    R4                              ; 616E   000C
        MVI@    R4,     R1                      ; 616F   02A1
        INCR    R4                              ; 6170   000C
        MVI@    R4,     R2                      ; 6171   02A2
        MVI@    R4,     R0                      ; 6172   02A0
        PULR    R4                              ; 6173   02B4
        PSHR    R4                              ; 6174   0274
        PSHR    R0                              ; 6175   0270

        JSR     R5,     L_57D1                  ; 6176   0004 0154 03D1

        PULR    R0                              ; 6179   02B0
        PULR    R4                              ; 617A   02B4
        DECR    R4                              ; 617B   0014
        MVI@    R4,     R1                      ; 617C   02A1
        ANDI    #$0010, R1                      ; 617D   03B9 0010
        BEQ     L_6191                          ; 617F   0204 0010

        ANDI    #$0080, R0                      ; 6181   03B8 0080
        BEQ     L_6199                          ; 6183   0204 0014

        PSHR    R4                              ; 6185   0274
        MOVR    R4,     R2                      ; 6186   00A2
        SUBI    #$016E, R2                      ; 6187   033A 016E
        SLR     R2,     2                       ; 6189   0066
        SLR     R2,     2                       ; 618A   0066
        MVII    #$0004, R1                      ; 618B   02B9 0004

        JSR     R5,     L_5E94                  ; 618D   0004 015C 0294

L_6190:
        PULR    R4                              ; 6190   02B4
L_6191:
        ADDI    #$0010, R4                      ; 6191   02FC 0010
        CMPI    #$01BD, R4                      ; 6193   037C 01BD
        BLT     L_616D                          ; 6195   0225 0029
        B       L_6161                          ; 6197   0220 0037

L_6199:
        PSHR    R4                              ; 6199   0274
        INCR    R4                              ; 619A   000C
        MVI@    R4,     R1                      ; 619B   02A1
        INCR    R4                              ; 619C   000C
        MVI@    R4,     R2                      ; 619D   02A2

        JSR     R5,     L_5F72                  ; 619E   0004 015C 0372

        ADDI    #$01FF, R2                      ; 61A1   02FA 01FF
        MVI@    R2,     R0                      ; 61A3   0290
        ANDI    #$01F8, R0                      ; 61A4   03B8 01F8
        CMPI    #$00C0, R0                      ; 61A6   0378 00C0
        BLT     L_61AE                          ; 61A8   0205 0004

        CMPI    #$00F0, R0                      ; 61AA   0378 00F0
        BLT     L_61AF                          ; 61AC   0205 0001

L_61AE:
        INCR    R2                              ; 61AE   000A
L_61AF:
        PULR    R4                              ; 61AF   02B4
        PSHR    R4                              ; 61B0   0274
        DECR    R4                              ; 61B1   0014
        MVI@    R4,     R0                      ; 61B2   02A0
        ANDI    #$0080, R0                      ; 61B3   03B8 0080
        BEQ     L_61B8                          ; 61B5   0204 0001

        INCR    R2                              ; 61B7   000A
L_61B8:
        PSHR    R4                              ; 61B8   0274
        PSHR    R0                              ; 61B9   0270
        SUBI    #$0200, R2                      ; 61BA   033A 0200
        MOVR    R2,     R0                      ; 61BC   0090

        JSR     R5,     L_5F64                  ; 61BD   0004 015C 0364

        PULR    R2                              ; 61C0   02B2
        PULR    R4                              ; 61C1   02B4
        ADDI    #$0009, R0                      ; 61C2   02F8 0009
        SUBI    #$0004, R1                      ; 61C4   0339 0004
        TSTR    R2                              ; 61C6   0092
        BEQ     L_61CA                          ; 61C7   0204 0001

        DECR    R0                              ; 61C9   0010
L_61CA:
        INCR    R4                              ; 61CA   000C
        MVO@    R0,     R4                      ; 61CB   0260
        INCR    R4                              ; 61CC   000C
        MVO@    R1,     R4                      ; 61CD   0261
        B       L_6190                          ; 61CE   0220 003F

L_61D0:
        ANDI    #$0001, R1                      ; 61D0   03B9 0001
        BNEQ    L_6005                          ; 61D2   022C 01CE

        MVI     G_0127, R0                      ; 61D4   0280 0127
        MOVR    R0,     R1                      ; 61D6   0081
        ADDI    #$0128, R1                      ; 61D7   02F9 0128
        MVI@    R1,     R2                      ; 61D9   028A
        CMPI    #$0003, R0                      ; 61DA   0378 0003
        BNEQ    L_61EC                          ; 61DC   020C 000E

        CLRR    R3                              ; 61DE   01DB
        INCR    R2                              ; 61DF   000A
        MVI     G_0137, R5                      ; 61E0   0285 0137
        CMPR    R5,     R2                      ; 61E2   016A
        MVO@    R2,     R1                      ; 61E3   024A
        BLT     L_6005                          ; 61E4   0225 01E0

        CLRR    R2                              ; 61E6   01D2
        MVO@    R2,     R1                      ; 61E7   024A
        CLRR    R3                              ; 61E8   01DB
        MVO     R3,     G_0127                  ; 61E9   0243 0127
        PULR    R7                              ; 61EB   02B7
L_61EC:
        PSHR    R1                              ; 61EC   0271
        MVI     G_0127, R3                      ; 61ED   0283 0127
        SLL     R3,     1                       ; 61EF   004B
        ADDI    #$0339, R3                      ; 61F0   02FB 0339
        PSHR    R3                              ; 61F2   0273
        CMPI    #$0008, R2                      ; 61F3   037A 0008
        BLT     L_622B                          ; 61F5   0205 0034

        JSR     R5,     L_50AB                  ; 61F7   0004 0150 00AB

        MOVR    R2,     R0                      ; 61FA   0090
        MOVR    R4,     R3                      ; 61FB   00A3
        TSTR    R2                              ; 61FC   0092
        PSHR    R0                              ; 61FD   0270
        MVII    #$0110, R4                      ; 61FE   02BC 0110
L_6200:
        PSHR    R3                              ; 6200   0273

        JSR     R5,     L_6297                  ; 6201   0004 0160 0297

        PULR    R3                              ; 6204   02B3
        CMPI    #$015D, R4                      ; 6205   037C 015D
        BGT     L_6212                          ; 6207   020E 0009

        MVI     G_0134, R4                      ; 6209   0284 0134
        TSTR    R4                              ; 620B   00A4
        BNEQ    L_6261                          ; 620C   020C 0053

        MVII    #$016E, R4                      ; 620E   02BC 016E
        MVII    #$032B, R3                      ; 6210   02BB 032B
L_6212:
        CMPI    #$01B3, R4                      ; 6212   037C 01B3
        BGE     L_6261                          ; 6214   020D 004B

        MVI@    R3,     R0                      ; 6216   0298
        INCR    R3                              ; 6217   000B
        ANDI    #$0007, R0                      ; 6218   03B8 0007
        CMPI    #$0007, R0                      ; 621A   0378 0007
        BNEQ    L_6200                          ; 621C   022C 001D

        PSHR    R4                              ; 621E   0274
        ADDI    #$0005, R4                      ; 621F   02FC 0005
L_6221:
        MVI@    R4,     R0                      ; 6221   02A0
        PULR    R4                              ; 6222   02B4
        ANDI    #$0080, R0                      ; 6223   03B8 0080
        BEQ     L_6200                          ; 6225   0224 0026

        ADDI    #$0010, R4                      ; 6227   02FC 0010
        B       L_6212                          ; 6229   0220 0018

L_622B:
        JSR     R5,     L_509A                  ; 622B   0004 0150 009A

        MOVR    R2,     R0                      ; 622E   0090
        MOVR    R4,     R3                      ; 622F   00A3
        TSTR    R2                              ; 6230   0092
        PSHR    R0                              ; 6231   0270
        MVII    #$0110, R4                      ; 6232   02BC 0110
L_6234:
        PSHR    R3                              ; 6234   0273

        JSR     R5,     L_6281                  ; 6235   0004 0160 0281

        PULR    R3                              ; 6238   02B3
        CMPI    #$015D, R4                      ; 6239   037C 015D
        BGT     L_6246                          ; 623B   020E 0009

        MVI     G_0134, R4                      ; 623D   0284 0134
        TSTR    R4                              ; 623F   00A4
        BNEQ    L_6261                          ; 6240   020C 001F

        MVII    #$016E, R4                      ; 6242   02BC 016E
        MVII    #$032B, R3                      ; 6244   02BB 032B
L_6246:
        CMPI    #$01B3, R4                      ; 6246   037C 01B3
        BLT     L_6234                          ; 6248   0225 0015
        BGE     L_6261                          ; 624A   020D 0015

        MVI@    R3,     R0                      ; 624C   0298
L_624D:
        INCR    R3                              ; 624D   000B
        ANDI    #$0007, R0                      ; 624E   03B8 0007
        CMPI    #$0007, R0                      ; 6250   0378 0007
        BNEQ    L_6234                          ; 6252   022C 001F

        PSHR    R4                              ; 6254   0274
        ADDI    #$0005, R4                      ; 6255   02FC 0005
        MVI@    R4,     R0                      ; 6257   02A0
        PULR    R4                              ; 6258   02B4
        ANDI    #$0080, R0                      ; 6259   03B8 0080
        BEQ     L_6234                          ; 625B   0224 0028

        ADDI    #$0010, R4                      ; 625D   02FC 0010
        B       L_6246                          ; 625F   0220 001A

L_6261:
        PULR    R0                              ; 6261   02B0
        PULR    R4                              ; 6262   02B4
        MOVR    R0,     R1                      ; 6263   0081
        ADDI    #$0090, R1                      ; 6264   02F9 0090
        MVO@    R0,     R4                      ; 6266   0260
        MVO@    R1,     R4                      ; 6267   0261
        PULR    R1                              ; 6268   02B1
        MVI@    R1,     R2                      ; 6269   028A
        INCR    R2                              ; 626A   000A
        ANDI    #$000F, R2                      ; 626B   03BA 000F
        MVO@    R2,     R1                      ; 626D   024A
        ANDI    #$0007, R2                      ; 626E   03BA 0007
        BNEQ    L_6005                          ; 6270   022C 026C

        MVII    #$000C, R3                      ; 6272   02BB 000C
        MVI     G_0110, R5                      ; 6274   0285 0110
        ANDI    #$0020, R5                      ; 6276   03BD 0020
        BEQ     L_627C                          ; 6278   0204 0002

        MVO     R3,     G_0110                  ; 627A   0243 0110
L_627C:
        MVII    #$0003, R3                      ; 627C   02BB 0003
        MVO     R3,     G_0127                  ; 627E   0243 0127
        PULR    R7                              ; 6280   02B7
L_6281:
        PSHR    R5                              ; 6281   0275
        PSHR    R4                              ; 6282   0274
        MVI@    R4,     R1                      ; 6283   02A1
        ANDI    #$0008, R1                      ; 6284   03B9 0008
        BEQ     L_6293                          ; 6286   0204 000B

        MVII    #$002C, R1                      ; 6288   02B9 002C
        DECR    R4                              ; 628A   0014
        MVII    #$0200, R3                      ; 628B   02BB 0200
        NEGR    R3                              ; 628D   0023
L_628E:
        MVO@    R1,     R4                      ; 628E   0261
        CLRR    R0                              ; 628F   01C0

        JSR     R5,     L_59AC                  ; 6290   0004 0158 01AC

L_6293:
        PULR    R4                              ; 6293   02B4
        ADDI    #$0010, R4                      ; 6294   02FC 0010
        PULR    R7                              ; 6296   02B7
L_6297:
        PSHR    R5                              ; 6297   0275
        PSHR    R4                              ; 6298   0274
        MVI@    R4,     R1                      ; 6299   02A1
        MOVR    R1,     R3                      ; 629A   008B
        ANDI    #$0004, R3                      ; 629B   03BB 0004
        BEQ     L_6293                          ; 629D   0224 000B

        INCR    R4                              ; 629F   000C
        MVI@    R4,     R0                      ; 62A0   02A0
        ADDI    #$0003, R0                      ; 62A1   02F8 0003
        ANDI    #$00F8, R0                      ; 62A3   03B8 00F8
        INCR    R4                              ; 62A5   000C
        MVI@    R4,     R5                      ; 62A6   02A5
        MOVR    R1,     R3                      ; 62A7   008B
        ANDI    #$0040, R3                      ; 62A8   03BB 0040
        BEQ     L_62B6                          ; 62AA   0204 000A

        SUBI    #$0006, R0                      ; 62AC   0338 0006
L_62AE:
        ANDI    #$00F8, R5                      ; 62AE   03BD 00F8
        ADDI    #$0005, R5                      ; 62B0   02FD 0005
        DECR    R4                              ; 62B2   0014
        MVO@    R5,     R4                      ; 62B3   0265
        B       L_62C5                          ; 62B4   0200 000F

L_62B6:
        ANDI    #$0020, R1                      ; 62B6   03B9 0020
        BNEQ    L_62CA                          ; 62B8   020C 0010

        ADDI    #$0002, R0                      ; 62BA   02F8 0002
        MOVR    R5,     R1                      ; 62BC   00A9
        ANDI    #$0007, R1                      ; 62BD   03B9 0007
        BEQ     L_62C5                          ; 62BF   0204 0004

        CMPI    #$0004, R1                      ; 62C1   0379 0004
        BLT     L_62AE                          ; 62C3   0225 0016

L_62C5:
        SUBI    #$0003, R4                      ; 62C5   033C 0003
        MVO@    R0,     R4                      ; 62C7   0260
        ADDI    #$0002, R4                      ; 62C8   02FC 0002
L_62CA:
        SUBI    #$0005, R4                      ; 62CA   033C 0005
        MVII    #$0200, R3                      ; 62CC   02BB 0200
        MVII    #$002C, R1                      ; 62CE   02B9 002C
        B       L_628E                          ; 62D0   0220 0043

        MOVR    R1,     R0                      ; 62D2   0088
        MOVR    R1,     R0                      ; 62D3   0088
        MOVR    R1,     R0                      ; 62D4   0088
        ADDR    R0,     R3                      ; 62D5   00C3
        ADDR    R0,     R3                      ; 62D6   00C3
        SAR     R1,     1                       ; 62D7   0069
        SAR     R1,     1                       ; 62D8   0069
        RRC     R3,     2                       ; 62D9   0077
        MOVR    R1,     R0                      ; 62DA   0088
        ADDR    R7,     R7                      ; 62DB   00FF
        ADDR    R6,     R7                      ; 62DC   00F7
        SARC    R3,     2                       ; 62DD   007F
        ADDR    R6,     R7                      ; 62DE   00F7
        MOVR    R5,     R2                      ; 62DF   00AA
        SARC    R3,     2                       ; 62E0   007F
        ADDR    R7,     R5                      ; 62E1   00FD
        ADDR    R0,     R3                      ; 62E2   00C3
        ADDR    R0,     R3                      ; 62E3   00C3
        ADDR    R0,     R3                      ; 62E4   00C3
        SAR     R1,     1                       ; 62E5   0069
        SAR     R1,     1                       ; 62E6   0069
        SAR     R1,     1                       ; 62E7   0069
        ADDR    R3,     R7                      ; 62E8   00DF
        SARC    R3,     2                       ; 62E9   007F
        COMR    R0                              ; 62EA   0018
        INCR    R0                              ; 62EB   0008
        DECLE   $0000,  $0000                   ; 62EC   0000 0000

        MOVR    R3,     R0                      ; 62EE   0098
        MOVR    R1,     R0                      ; 62EF   0088
        DECLE   $0000,  $0000                   ; 62F0   0000 0000

        COMR    R0                              ; 62F2   0018
        MOVR    R1,     R0                      ; 62F3   0088
        DECLE   $0000,  $0000                   ; 62F4   0000 0000

        MOVR    R3,     R0                      ; 62F6   0098
        INCR    R0                              ; 62F7   0008
        DECLE   $0000,  $0000                   ; 62F8   0000 0000
L_62FA:
        PSHR    R5                              ; 62FA   0275
        MVI     G_012D, R0                      ; 62FB   0280 012D
        ANDI    #$0001, R0                      ; 62FD   03B8 0001
        BNEQ    L_65F2                          ; 62FF   020C 02F1

        MVI     G_0115, R0                      ; 6301   0280 0115
        ANDI    #$001F, R0                      ; 6303   03B8 001F
        BNEQ    L_6328                          ; 6305   020C 0021

        MVI     G_01AC, R0                      ; 6307   0280 01AC
        CMPI    #$0097, R0                      ; 6309   0378 0097
        BGE     L_6328                          ; 630B   020D 001B

        INCR    R0                              ; 630D   0008
        BEQ     L_6328                          ; 630E   0204 0018

        MVO     R0,     G_01AC                  ; 6310   0240 01AC
        CMPI    #$0064, R0                      ; 6312   0378 0064
        BLT     L_6328                          ; 6314   0205 0012
        BEQ     L_631C                          ; 6316   0204 0004

        CMPI    #$0096, R0                      ; 6318   0378 0096
        BNEQ    L_6328                          ; 631A   020C 000C

L_631C:
        MVI     G_0130, R0                      ; 631C   0280 0130
        ADDI    #$0004, R0                      ; 631E   02F8 0004
        MVO     R0,     G_0130                  ; 6320   0240 0130
        MVI     G_0132, R0                      ; 6322   0280 0132
        SUBI    #$0002, R0                      ; 6324   0338 0002
        MVO     R0,     G_0132                  ; 6326   0240 0132
L_6328:
        MVI     G_0112, R2                      ; 6328   0282 0112
        MVI     G_0114, R3                      ; 632A   0283 0114
        MVO     R2,     G_0125                  ; 632C   0242 0125
        MVO     R3,     G_0126                  ; 632E   0243 0126
        MVI     G_0131, R0                      ; 6330   0280 0131
        TSTR    R0                              ; 6332   0080
        BEQ     L_6374                          ; 6333   0204 003F

        MVI     G_0124, R1                      ; 6335   0281 0124
        MVI     G_0115, R0                      ; 6337   0280 0115
        ANDI    #$007F, R0                      ; 6339   03B8 007F
        BNEQ    L_6345                          ; 633B   020C 0008

        MVII    #$0003, R0                      ; 633D   02B8 0003

        JSR     R5,     X_RAND1                 ; 633F   0004 0114 027D

        SLL     R0,     1                       ; 6342   0048
        MVO     R0,     G_0124                  ; 6343   0240 0124
L_6345:
        MVI     G_0124, R1                      ; 6345   0281 0124
        MVI     G_0115, R0                      ; 6347   0280 0115
        ANDI    #$0001, R0                      ; 6349   03B8 0001
        BEQ     L_6374                          ; 634B   0204 0027

        SDBD                                    ; 634D   0001
        MVII    #$62EA, R5                      ; 634E   02BD 00EA 0062
        ADDR    R1,     R5                      ; 6351   00CD
        MVI@    R5,     R0                      ; 6352   02A8
        RSWD    R0                              ; 6353   0038
        BPL     L_6359                          ; 6354   0203 0003

        XORI    #$0080, R0                      ; 6356   03F8 0080
        NEGR    R0                              ; 6358   0020
L_6359:
        ADDR    R2,     R0                      ; 6359   00D0
        BMI     L_6360                          ; 635A   020B 0004

        CMPI    #$00A0, R0                      ; 635C   0378 00A0
        BLT     L_6361                          ; 635E   0205 0001

L_6360:
        MOVR    R2,     R0                      ; 6360   0090
L_6361:
        MVO     R0,     G_0125                  ; 6361   0240 0125
        MVI@    R5,     R0                      ; 6363   02A8
        RSWD    R0                              ; 6364   0038
        BPL     L_636A                          ; 6365   0203 0003

        XORI    #$0080, R0                      ; 6367   03F8 0080
        NEGR    R0                              ; 6369   0020
L_636A:
        ADDR    R3,     R0                      ; 636A   00D8
        BMI     L_6371                          ; 636B   020B 0004

        CMPI    #$0060, R0                      ; 636D   0378 0060
        BLT     L_6372                          ; 636F   0205 0001

L_6371:
        MOVR    R3,     R0                      ; 6371   0098
L_6372:
        MVO     R0,     G_0126                  ; 6372   0240 0126
L_6374:
        MVI     G_0115, R2                      ; 6374   0282 0115
        ANDI    #$0001, R2                      ; 6376   03BA 0001
        BEQ     L_637C                          ; 6378   0204 0002

        MVII    #$0003, R2                      ; 637A   02BA 0003
L_637C:
        MVO     R2,     G_0123                  ; 637C   0242 0123
        MVII    #$015D, R4                      ; 637E   02BC 015D
        SLL     R2,     2                       ; 6380   004E
        SLL     R2,     2                       ; 6381   004E
        ADDI    #$016D, R2                      ; 6382   02FA 016D
        MVII    #$000A, R0                      ; 6384   02B8 000A
        PSHR    R2                              ; 6386   0272

        JSR     R5,     L_51B7                  ; 6387   0004 0150 01B7
        JSR     R5,     L_63AB                  ; 638A   0004 0160 03AB

        MVII    #$015D, R2                      ; 638D   02BA 015D
        PULR    R4                              ; 638F   02B4
        MVII    #$000A, R0                      ; 6390   02B8 000A

        JSR     R5,     L_51B7                  ; 6392   0004 0150 01B7

        MVI     G_0123, R2                      ; 6395   0282 0123
        INCR    R2                              ; 6397   000A
        CMPI    #$0003, R2                      ; 6398   037A 0003
        BEQ     L_65F2                          ; 639A   0204 0256

        MVI     G_0134, R0                      ; 639C   0280 0134
        TSTR    R0                              ; 639E   0080
        BEQ     L_63A6                          ; 639F   0204 0005

        CMPI    #$0006, R2                      ; 63A1   037A 0006
        BLT     L_637C                          ; 63A3   0225 0028

        PULR    R7                              ; 63A5   02B7
L_63A6:
        CMPI    #$0005, R2                      ; 63A6   037A 0005
        BLT     L_637C                          ; 63A8   0225 002D

        PULR    R7                              ; 63AA   02B7
L_63AB:
        PSHR    R5                              ; 63AB   0275
        MVII    #$0163, R3                      ; 63AC   02BB 0163
        MVI     G_0115, R0                      ; 63AE   0280 0115
        MOVR    R0,     R1                      ; 63B0   0081
        ANDI    #$0002, R0                      ; 63B1   03B8 0002
        MVO     R0,     G_011A                  ; 63B3   0240 011A
        MVI@    R3,     R2                      ; 63B5   029A
        CMPI    #$0080, R2                      ; 63B6   037A 0080
        BGE     L_660E                          ; 63B8   020D 0254

        MVI     G_0134, R2                      ; 63BA   0282 0134
        TSTR    R2                              ; 63BC   0092
        BNEQ    L_664D                          ; 63BD   020C 028E

        MVI     G_0165, R5                      ; 63BF   0285 0165
        TSTR    R5                              ; 63C1   00AD
        BEQ     L_63CD                          ; 63C2   0204 0009

        ANDI    #$000E, R1                      ; 63C4   03B9 000E
        BNEQ    L_6553                          ; 63C6   020C 018B

        CMPI    #$0030, R2                      ; 63C8   037A 0030
        BGE     L_63CD                          ; 63CA   020D 0001

        MVO@    R0,     R3                      ; 63CC   0258
L_63CD:
        CLRR    R1                              ; 63CD   01C9
        MVO     R1,     G_0166                  ; 63CE   0241 0166
        MVI     G_0160, R1                      ; 63D0   0281 0160
        MVI     G_0162, R2                      ; 63D2   0282 0162

        JSR     R5,     L_5F72                  ; 63D4   0004 015C 0372

        SLR     R1,     2                       ; 63D7   0065
        SLR     R1,     1                       ; 63D8   0061
        SDBD                                    ; 63D9   0001
        MVII    #$62D2, R4                      ; 63DA   02BC 00D2 0062
        ADDR    R1,     R4                      ; 63DD   00CC
        MOVR    R1,     R0                      ; 63DE   0088

        JSR     R5,     L_64C1                  ; 63DF   0004 0164 00C1

        MVI@    R3,     R0                      ; 63E2   0298
        CMPI    #$0030, R0                      ; 63E3   0378 0030
        BLT     L_6404                          ; 63E5   0205 001D

        CMPI    #$0040, R0                      ; 63E7   0378 0040
        BGE     L_6404                          ; 63E9   020D 0019

        ADDI    #$0201, R2                      ; 63EB   02FA 0201
        MVI     G_0164, R5                      ; 63ED   0285 0164
        ANDI    #$0084, R5                      ; 63EF   03BD 0084
        BEQ     L_63F9                          ; 63F1   0204 0006

        CMPI    #$0084, R5                      ; 63F3   037D 0084
        BEQ     L_63F9                          ; 63F5   0204 0002

        SUBI    #$0002, R2                      ; 63F7   033A 0002
L_63F9:
        MVI@    R2,     R0                      ; 63F9   0290
        ANDI    #$01F8, R0                      ; 63FA   03B8 01F8
        SAR     R0,     2                       ; 63FC   006C
        SAR     R0,     1                       ; 63FD   0068

        JSR     R5,     L_64CD                  ; 63FE   0004 0164 00CD

        MVI@    R3,     R0                      ; 6401   0298
        B       L_6426                          ; 6402   0200 0022

L_6404:
        CMPI    #$0010, R1                      ; 6404   0379 0010
        BEQ     L_640C                          ; 6406   0204 0004

        CMPI    #$0017, R1                      ; 6408   0379 0017
        BNEQ    L_6426                          ; 640A   020C 001A

L_640C:
        MVI@    R3,     R0                      ; 640C   0298
        MOVR    R0,     R5                      ; 640D   0085
        ANDI    #$0005, R5                      ; 640E   03BD 0005
        BEQ     L_6426                          ; 6410   0204 0014

        ANDI    #$000A, R0                      ; 6412   03B8 000A
        MVO@    R0,     R3                      ; 6414   0258
        MVI     G_0162, R2                      ; 6415   0282 0162
        MVII    #$0002, R1                      ; 6417   02B9 0002
        MOVR    R2,     R5                      ; 6419   0095
        ANDI    #$0007, R5                      ; 641A   03BD 0007
        BEQ     L_6422                          ; 641C   0204 0004

        CMPI    #$0004, R5                      ; 641E   037D 0004
        BLT     L_6423                          ; 6420   0205 0001

L_6422:
        NEGR    R1                              ; 6422   0021
L_6423:
        ADDR    R1,     R2                      ; 6423   00CA
        MVO     R2,     G_0162                  ; 6424   0242 0162
L_6426:
        ANDI    #$000F, R0                      ; 6426   03B8 000F
        MVO@    R0,     R3                      ; 6428   0258
        MVI     G_0164, R5                      ; 6429   0285 0164
        MOVR    R5,     R1                      ; 642B   00A9
        SAR     R1,     2                       ; 642C   006D
        SAR     R1,     2                       ; 642D   006D
        XORR    R1,     R5                      ; 642E   01CD
        ANDI    #$000F, R5                      ; 642F   03BD 000F
        MOVR    R5,     R1                      ; 6431   00A9
        ANDR    R0,     R1                      ; 6432   0181
        XORR    R1,     R0                      ; 6433   01C8
        XORR    R5,     R0                      ; 6434   01E8
        COMR    R0                              ; 6435   0018
        MVI@    R4,     R2                      ; 6436   02A2
        MVI     G_0160, R1                      ; 6437   0281 0160
        ADDI    #$0003, R1                      ; 6439   02F9 0003
        ANDI    #$0007, R1                      ; 643B   03B9 0007
        CMPI    #$0003, R1                      ; 643D   0379 0003
        BLE     L_6443                          ; 643F   0206 0002

        SLR     R2,     2                       ; 6441   0066
        SLR     R2,     2                       ; 6442   0066
L_6443:
        ANDI    #$000F, R2                      ; 6443   03BA 000F
        ANDR    R2,     R0                      ; 6445   0190
        BNEQ    L_644C                          ; 6446   020C 0004

        MVO@    R0,     R3                      ; 6448   0258
        MVO     R0,     G_0164                  ; 6449   0240 0164
        MOVR    R2,     R0                      ; 644B   0090
L_644C:
        MVII    #$0165, R3                      ; 644C   02BB 0165
        CLRR    R2                              ; 644E   01D2
        MVO@    R2,     R3                      ; 644F   025A
        MVI     G_0160, R4                      ; 6450   0284 0160
        MVI     G_0162, R2                      ; 6452   0282 0162
        SUB     G_0125, R4                      ; 6454   0304 0125
        SUB     G_0126, R2                      ; 6456   0302 0126
        MOVR    R0,     R1                      ; 6458   0081
        TSTR    R4                              ; 6459   00A4
        BPL     L_6462                          ; 645A   0203 0006

        ANDI    #$0001, R0                      ; 645C   03B8 0001
        BNEQ    L_6466                          ; 645E   020C 0006
        B       L_6467                          ; 6460   0200 0005

L_6462:
        ANDI    #$0004, R0                      ; 6462   03B8 0004
        BEQ     L_6467                          ; 6464   0204 0001

L_6466:
        MVO@    R0,     R3                      ; 6466   0258
L_6467:
        MOVR    R1,     R0                      ; 6467   0088
        SDBD                                    ; 6468   0001
        CMPI    #$FFFC, R2                      ; 6469   037A 00FC 00FF
        BLT     L_6478                          ; 646C   0205 000A

        CMPI    #$0004, R2                      ; 646E   037A 0004
        BLT     L_6480                          ; 6470   0205 000E

        ANDI    #$0002, R0                      ; 6472   03B8 0002
        BNEQ    L_647C                          ; 6474   020C 0006
        B       L_6480                          ; 6476   0200 0008

L_6478:
        ANDI    #$0008, R0                      ; 6478   03B8 0008
        BEQ     L_6480                          ; 647A   0204 0004

L_647C:
        SLL     R0,     2                       ; 647C   004C
        SLL     R0,     2                       ; 647D   004C
        XOR@    R3,     R0                      ; 647E   03D8
        MVO@    R0,     R3                      ; 647F   0258
L_6480:
        MVI@    R3,     R0                      ; 6480   0298
        TSTR    R0                              ; 6481   0080
        BNEQ    L_6553                          ; 6482   020C 00CF

        MVII    #$0210, R2                      ; 6484   02BA 0210
L_6486:
        SLR     R2,     2                       ; 6486   0066
        MOVR    R1,     R0                      ; 6487   0088
        ANDR    R2,     R0                      ; 6488   0190
        BEQ     L_6486                          ; 6489   0224 0004

        ANDI    #$000A, R2                      ; 648B   03BA 000A
        BEQ     L_6491                          ; 648D   0204 0002

        SLL     R0,     2                       ; 648F   004C
        SLL     R0,     2                       ; 6490   004C
L_6491:
        MVO@    R0,     R3                      ; 6491   0258
        B       L_6553                          ; 6492   0200 00BF

L_6494:
        MVI     G_011D, R5                      ; 6494   0285 011D
        CMPI    #$0005, R5                      ; 6496   037D 0005
        BEQ     L_64BA                          ; 6498   0204 0020

        CMPI    #$001E, R0                      ; 649A   0378 001E
        BEQ     L_64BA                          ; 649C   0204 001C

        MVI     G_0135, R5                      ; 649E   0285 0135
        TSTR    R5                              ; 64A0   00AD
        BEQ     L_64BA                          ; 64A1   0204 0017

        MVI     G_0127, R5                      ; 64A3   0285 0127
        SUBI    #$0018, R0                      ; 64A5   0338 0018
        MOVR    R0,     R4                      ; 64A7   0084
        SLR     R0,     1                       ; 64A8   0060
        CMPR    R0,     R5                      ; 64A9   0145
        BNEQ    L_64BA                          ; 64AA   020C 000E

        ANDI    #$0001, R4                      ; 64AC   03BC 0001
        BEQ     L_64B6                          ; 64AE   0204 0006

        MVII    #$0001, R0                      ; 64B0   02B8 0001
L_64B2:
        MVO     R0,     G_0165                  ; 64B2   0240 0165
        B       L_6553                          ; 64B4   0200 009D

L_64B6:
        MVII    #$0004, R0                      ; 64B6   02B8 0004
        B       L_64B2                          ; 64B8   0220 0007

L_64BA:
        SDBD                                    ; 64BA   0001
        MVII    #$62DB, R4                      ; 64BB   02BC 00DB 0062
        MVI@    R3,     R0                      ; 64BE   0298
        B       L_6426                          ; 64BF   0220 009A

L_64C1:
        CMPI    #$0018, R0                      ; 64C1   0378 0018
        BGE     L_6494                          ; 64C3   022D 0030

        CMPI    #$0015, R0                      ; 64C5   0378 0015
        BGT     L_64D5                          ; 64C7   020E 000C

        CMPI    #$0010, R0                      ; 64C9   0378 0010
        BGE     L_64D6                          ; 64CB   020D 0009

L_64CD:
        SUBI    #$0003, R0                      ; 64CD   0338 0003
        BMI     L_64D5                          ; 64CF   020B 0004

        CMPI    #$0003, R0                      ; 64D1   0378 0003
        BLE     L_64D8                          ; 64D3   0206 0003

L_64D5:
        MOVR    R5,     R7                      ; 64D5   00AF
L_64D6:
        SUBI    #$0003, R0                      ; 64D6   0338 0003
L_64D8:
        MVI     G_0160, R5                      ; 64D8   0285 0160
        CMPI    #$000C, R5                      ; 64DA   037D 000C
        BGT     L_64EF                          ; 64DC   020E 0011

        TSTR    R0                              ; 64DE   0080
        BNEQ    L_64E5                          ; 64DF   020C 0004

L_64E1:
        MVII    #$0002, R0                      ; 64E1   02B8 0002
        B       L_64EB                          ; 64E3   0200 0006

L_64E5:
        CMPI    #$0002, R0                      ; 64E5   0378 0002
        BNEQ    L_64FB                          ; 64E7   020C 0012

L_64E9:
        MVII    #$0008, R0                      ; 64E9   02B8 0008
L_64EB:
        MVO     R0,     G_0165                  ; 64EB   0240 0165
        B       L_6553                          ; 64ED   0200 0064

L_64EF:
        CMPI    #$009C, R5                      ; 64EF   037D 009C
        BLT     L_64FB                          ; 64F1   0205 0008

        CMPI    #$0003, R0                      ; 64F3   0378 0003
        BEQ     L_64E1                          ; 64F5   0224 0015

        CMPI    #$0001, R0                      ; 64F7   0378 0001
        BEQ     L_64E9                          ; 64F9   0224 0011

L_64FB:
        MVI@    R3,     R2                      ; 64FB   029A
        MVII    #$0164, R3                      ; 64FC   02BB 0164
        CMPI    #$0070, R2                      ; 64FE   037A 0070
        BLT     L_6514                          ; 6500   0205 0012

        MVI@    R3,     R2                      ; 6502   029A
        ANDI    #$000F, R2                      ; 6503   03BA 000F
        BNEQ    L_650A                          ; 6505   020C 0003

        MVI@    R3,     R2                      ; 6507   029A
        SAR     R2,     2                       ; 6508   006E
        SAR     R2,     2                       ; 6509   006E
L_650A:
        CMPI    #$0003, R2                      ; 650A   037A 0003
        BLT     L_6510                          ; 650C   0205 0002

        SLR     R2,     2                       ; 650E   0066
        INCR    R7                              ; 650F   000F
L_6510:
        SLL     R2,     2                       ; 6510   004E
        MVO@    R2,     R3                      ; 6511   025A
        B       L_6518                          ; 6512   0200 0004

L_6514:
        CMPI    #$0030, R2                      ; 6514   037A 0030
        BGE     L_6553                          ; 6516   020D 003B

L_6518:
        MVI     G_0160, R5                      ; 6518   0285 0160
        MVII    #$0001, R2                      ; 651A   02BA 0001
        ANDI    #$0001, R0                      ; 651C   03B8 0001
        BNEQ    L_6521                          ; 651E   020C 0001

        NEGR    R2                              ; 6520   0022
L_6521:
        ADDR    R2,     R5                      ; 6521   00D5
        CMPI    #$009E, R5                      ; 6522   037D 009E
        BGE     L_652C                          ; 6524   020D 0006

        CMPI    #$000B, R5                      ; 6526   037D 000B
        BLE     L_652C                          ; 6528   0206 0002

        MVO     R5,     G_0160                  ; 652A   0245 0160
L_652C:
        MVII    #$0030, R2                      ; 652C   02BA 0030
        MVO     R2,     G_0163                  ; 652E   0242 0163
        MVI@    R3,     R2                      ; 6530   029A
        ANDI    #$000F, R2                      ; 6531   03BA 000F
        BNEQ    L_6538                          ; 6533   020C 0003

        MVI@    R3,     R2                      ; 6535   029A
        SAR     R2,     2                       ; 6536   006E
        SAR     R2,     2                       ; 6537   006E
L_6538:
        MVI@    R4,     R1                      ; 6538   02A1
        ANDR    R1,     R2                      ; 6539   018A
        BEQ     L_653E                          ; 653A   0204 0002

        SAR     R1,     2                       ; 653C   006D
        SAR     R1,     2                       ; 653D   006D
L_653E:
        ANDI    #$000F, R1                      ; 653E   03B9 000F
        MOVR    R1,     R2                      ; 6540   008A
        MVII    #$00A5, R0                      ; 6541   02B8 00A5
        MVI     G_011A, R5                      ; 6543   0285 011A
        TSTR    R5                              ; 6545   00AD
        BNEQ    L_654A                          ; 6546   020C 0002

        MVII    #$005A, R0                      ; 6548   02B8 005A
L_654A:
        ANDR    R0,     R1                      ; 654A   0181
        SAR     R0,     2                       ; 654B   006C
        SAR     R0,     2                       ; 654C   006C
        ANDR    R0,     R2                      ; 654D   0182
        SLL     R2,     2                       ; 654E   004E
        SLL     R2,     2                       ; 654F   004E
        XORR    R2,     R1                      ; 6550   01D1
        MVO     R1,     G_0165                  ; 6551   0241 0165
L_6553:
        MVII    #$0164, R3                      ; 6553   02BB 0164
        MVI@    R3,     R5                      ; 6555   029D
        PSHR    R5                              ; 6556   0275
        MVI     G_0165, R0                      ; 6557   0280 0165
        MOVR    R0,     R2                      ; 6559   0082
        SAR     R2,     2                       ; 655A   006E
        SAR     R2,     2                       ; 655B   006E
        ANDI    #$000F, R0                      ; 655C   03B8 000F
        BNEQ    L_6564                          ; 655E   020C 0004

        ANDI    #$00F0, R5                      ; 6560   03BD 00F0
        MVO@    R5,     R3                      ; 6562   025D
        MOVR    R2,     R0                      ; 6563   0090
L_6564:
        TSTR    R2                              ; 6564   0092
        BNEQ    L_656B                          ; 6565   020C 0004

        ANDI    #$000F, R5                      ; 6567   03BD 000F
        MVO@    R5,     R3                      ; 6569   025D
        MOVR    R0,     R2                      ; 656A   0082
L_656B:
        MVI     G_011A, R1                      ; 656B   0281 011A
        TSTR    R1                              ; 656D   0089
        BNEQ    L_6571                          ; 656E   020C 0001

        MOVR    R0,     R2                      ; 6570   0082
L_6571:
        PSHR    R2                              ; 6571   0272
        MVI     G_0130, R0                      ; 6572   0280 0130
        SLL     R0,     2                       ; 6574   004C
        SLL     R0,     2                       ; 6575   004C
        MOVR    R0,     R3                      ; 6576   0083
        SARC    R2,     2                       ; 6577   007E
        BC      L_6580                          ; 6578   0201 0006
        BOV     L_6583                          ; 657A   0202 0007

        SARC    R2,     2                       ; 657C   007E
        BOV     L_6584                          ; 657D   0202 0005

        NEGR    R0                              ; 657F   0020
L_6580:
        CLRR    R3                              ; 6580   01DB
        B       L_6585                          ; 6581   0200 0002

L_6583:
        NEGR    R3                              ; 6583   0023
L_6584:
        CLRR    R0                              ; 6584   01C0
L_6585:
        CLRR    R5                              ; 6585   01ED
L_6586:
        MVII    #$015F, R4                      ; 6586   02BC 015F
L_6588:
        PSHR    R0                              ; 6588   0270
        PSHR    R3                              ; 6589   0273
        PSHR    R5                              ; 658A   0275

        JSR     R5,     L_5942                  ; 658B   0004 0158 0142

        PULR    R5                              ; 658E   02B5
        PULR    R3                              ; 658F   02B3
        PULR    R0                              ; 6590   02B0
        MVI     G_015E, R1                      ; 6591   0281 015E
        ANDI    #$0010, R1                      ; 6593   03B9 0010
        BEQ     L_65AA                          ; 6595   0204 0013

        CLRR    R3                              ; 6597   01DB
        MVII    #$0200, R0                      ; 6598   02B8 0200
        MVI     G_015E, R1                      ; 659A   0281 015E
        ANDI    #$0080, R1                      ; 659C   03B9 0080
        BNEQ    L_65A1                          ; 659E   020C 0001

        NEGR    R0                              ; 65A0   0020
L_65A1:
        MVO     R3,     G_0165                  ; 65A1   0243 0165
        INCR    R5                              ; 65A3   000D
        CMPI    #$0006, R5                      ; 65A4   037D 0006
        BLE     L_6586                          ; 65A6   0226 0021

        MVI     G_015E, R0                      ; 65A8   0280 015E
L_65AA:
        PULR    R1                              ; 65AA   02B1
        PULR    R4                              ; 65AB   02B4
        MVI     G_011A, R5                      ; 65AC   0285 011A
        CMPI    #$0001, R5                      ; 65AE   037D 0001
        BGE     L_65F3                          ; 65B0   020D 0041

        MVI     G_015D, R5                      ; 65B2   0285 015D
        ANDI    #$0004, R5                      ; 65B4   03BD 0004
        MVI     G_011B, R4                      ; 65B6   0284 011B
        MOVR    R1,     R2                      ; 65B8   008A
        CMPI    #$0003, R1                      ; 65B9   0379 0003
        BLT     L_65BF                          ; 65BB   0205 0002

        SLR     R1,     2                       ; 65BD   0065
        INCR    R7                              ; 65BE   000F
L_65BF:
        SLL     R1,     2                       ; 65BF   004D
        PSHR    R3                              ; 65C0   0273
        MVI     G_0164, R3                      ; 65C1   0283 0164
        ANDI    #$000A, R2                      ; 65C3   03BA 000A
        BNEQ    L_65D4                          ; 65C5   020C 000D

        CLRR    R5                              ; 65C7   01ED
        TSTR    R0                              ; 65C8   0080
        BMI     L_65CD                          ; 65C9   020B 0002

        XORI    #$0004, R5                      ; 65CB   03FD 0004
L_65CD:
        TSTR    R4                              ; 65CD   00A4
        BNEQ    L_65DE                          ; 65CE   020C 000E

        ANDI    #$00F0, R3                      ; 65D0   03BB 00F0
        B       L_65DB                          ; 65D2   0200 0007

L_65D4:
        TSTR    R4                              ; 65D4   00A4
        BNEQ    L_65DE                          ; 65D5   020C 0007

        ANDI    #$000F, R3                      ; 65D7   03BB 000F
        SLL     R1,     2                       ; 65D9   004D
        SLL     R1,     2                       ; 65DA   004D
L_65DB:
        XORR    R1,     R3                      ; 65DB   01CB
        MVO     R3,     G_0164                  ; 65DC   0243 0164
L_65DE:
        MVO     R5,     G_015D                  ; 65DE   0245 015D
        PULR    R4                              ; 65E0   02B4
        MVI     G_0115, R5                      ; 65E1   0285 0115
        MVI     G_0130, R3                      ; 65E3   0283 0130
        CMPI    #$0018, R3                      ; 65E5   037B 0018
        BGE     L_65ED                          ; 65E7   020D 0004

        ANDI    #$0002, R5                      ; 65E9   03BD 0002
        BNEQ    L_65F2                          ; 65EB   020C 0005

L_65ED:
        MVI     G_0123, R1                      ; 65ED   0281 0123

        JSR     R5,     L_5FAB                  ; 65EF   0004 015C 03AB

L_65F2:
        PULR    R7                              ; 65F2   02B7
L_65F3:
        MVII    #$0165, R3                      ; 65F3   02BB 0165
        MVI     G_0163, R2                      ; 65F5   0282 0163
        CMPI    #$0030, R2                      ; 65F7   037A 0030
        BLT     L_65FF                          ; 65F9   0205 0004

        MVII    #$0040, R1                      ; 65FB   02B9 0040
        CLRR    R5                              ; 65FD   01ED
        MVO@    R5,     R3                      ; 65FE   025D
L_65FF:
        XORR    R1,     R2                      ; 65FF   01CA
        MVO     R2,     G_0163                  ; 6600   0242 0163
        MVO     R4,     G_0164                  ; 6602   0244 0164
        MVI@    R3,     R0                      ; 6604   0298
        ANDI    #$000F, R0                      ; 6605   03B8 000F
        CMPR    R0,     R1                      ; 6607   0141
        BNEQ    L_660C                          ; 6608   020C 0002

        MVI@    R3,     R0                      ; 660A   0298
        XORR    R1,     R0                      ; 660B   01C8
L_660C:
        MVO@    R0,     R3                      ; 660C   0258
        PULR    R7                              ; 660D   02B7
L_660E:
        MOVR    R3,     R1                      ; 660E   0099
        ADDI    #$0003, R1                      ; 660F   02F9 0003
        MVI@    R1,     R0                      ; 6611   0288
        DECR    R0                              ; 6612   0010
        MVO@    R0,     R1                      ; 6613   0248
        BPL     L_65F2                          ; 6614   0223 0023

        CLRR    R0                              ; 6616   01C0
        MVO@    R0,     R1                      ; 6617   0248
        PSHR    R1                              ; 6618   0271
        PSHR    R3                              ; 6619   0273
        SUBI    #$0004, R1                      ; 661A   0339 0004
        MVI@    R1,     R2                      ; 661C   028A
        SUBI    #$0002, R1                      ; 661D   0339 0002
        MOVR    R1,     R4                      ; 661F   008C
        DECR    R4                              ; 6620   0014
        MVI@    R1,     R1                      ; 6621   0289

        JSR     R5,     L_57D1                  ; 6622   0004 0154 03D1

        PULR    R3                              ; 6625   02B3
        PULR    R1                              ; 6626   02B1
        MVI     G_0134, R2                      ; 6627   0282 0134
        TSTR    R2                              ; 6629   0092
        BNEQ    L_662F                          ; 662A   020C 0003

        TSTR    R5                              ; 662C   00AD
        BEQ     L_65F2                          ; 662D   0224 003C

L_662F:
        CLRR    R2                              ; 662F   01D2
        MVO@    R2,     R1                      ; 6630   024A
        MVO@    R2,     R3                      ; 6631   025A
        MOVR    R1,     R5                      ; 6632   008D
        SUBI    #$0003, R5                      ; 6633   033D 0003
        MVO@    R2,     R5                      ; 6635   026A
        MVO@    R2,     R5                      ; 6636   026A
        MVO@    R2,     R5                      ; 6637   026A
        MVI     G_0134, R2                      ; 6638   0282 0134
        TSTR    R2                              ; 663A   0092
        BEQ     L_6642                          ; 663B   0204 0005

        SUBI    #$0004, R1                      ; 663D   0339 0004
        MVII    #$0080, R2                      ; 663F   02BA 0080
        MVO@    R2,     R1                      ; 6641   024A
L_6642:
        MVI     G_0123, R1                      ; 6642   0281 0123

        JSR     R5,     L_5FAB                  ; 6644   0004 015C 03AB

        MVI     G_0123, R1                      ; 6647   0281 0123

        JSR     R5,     L_6012                  ; 6649   0004 0160 0012

        PULR    R7                              ; 664C   02B7
L_664D:
        MVI     G_0163, R0                      ; 664D   0280 0163
        TSTR    R0                              ; 664F   0080
        BEQ     L_6656                          ; 6650   0204 0004

        DECR    R0                              ; 6652   0010
        MVO     R0,     G_0163                  ; 6653   0240 0163
        PULR    R7                              ; 6655   02B7
L_6656:
        MVI     G_0133, R0                      ; 6656   0280 0133
        SLL     R0,     2                       ; 6658   004C
        SLL     R0,     2                       ; 6659   004C
        MOVR    R0,     R3                      ; 665A   0083
        NEGR    R0                              ; 665B   0020
        MVII    #$015F, R4                      ; 665C   02BC 015F

        JSR     R5,     L_5942                  ; 665E   0004 0158 0142

        MVI     G_011A, R1                      ; 6661   0281 011A
        CMPI    #$0001, R1                      ; 6663   0379 0001
        BLT     L_66BB                          ; 6665   0205 0054

        MVI     G_0162, R0                      ; 6667   0280 0162
        ADDI    #$0002, R0                      ; 6669   02F8 0002
        CMPI    #$0070, R0                      ; 666B   0378 0070
        BLT     L_66B9                          ; 666D   0205 004A

        MVI     G_01CD, R0                      ; 666F   0280 01CD
        TSTR    R0                              ; 6671   0080
        BNEQ    L_6679                          ; 6672   020C 0005

        MVII    #$0090, R0                      ; 6674   02B8 0090
        MVO     R0,     G_0163                  ; 6676   0240 0163
        PULR    R7                              ; 6678   02B7
L_6679:
        MVI     G_0123, R0                      ; 6679   0280 0123
        CMPI    #$0005, R0                      ; 667B   0378 0005
        BLT     L_66A1                          ; 667D   0205 0022

        MVI     G_0112, R1                      ; 667F   0281 0112
        MVI     G_0114, R2                      ; 6681   0282 0114
        MVII    #$0005, R3                      ; 6683   02BB 0005
        CMPI    #$0028, R2                      ; 6685   037A 0028
        BLT     L_668F                          ; 6687   0205 0006

        SLL     R3,     1                       ; 6689   004B
        CMPI    #$0048, R2                      ; 668A   037A 0048
        BLT     L_668F                          ; 668C   0205 0001

        SLL     R3,     1                       ; 668E   004B
L_668F:
        TSTR    R0                              ; 668F   0080
        BNEQ    L_6693                          ; 6690   020C 0001

        NEGR    R3                              ; 6692   0023
L_6693:
        ADDR    R3,     R1                      ; 6693   00D9
        MVII    #$0028, R3                      ; 6694   02BB 0028
        CMPR    R3,     R1                      ; 6696   0159
        BLE     L_669E                          ; 6697   0206 0005

        MVII    #$0090, R3                      ; 6699   02BB 0090
        CMPR    R3,     R1                      ; 669B   0159
        BLE     L_66B0                          ; 669C   0206 0012

L_669E:
        MOVR    R3,     R1                      ; 669E   0099
        B       L_66B0                          ; 669F   0200 000F

L_66A1:
        MVII    #$0004, R0                      ; 66A1   02B8 0004

        JSR     R5,     X_RAND1                 ; 66A3   0004 0114 027D

        MVI     G_0160, R1                      ; 66A6   0281 0160
        ADDR    R0,     R1                      ; 66A8   00C1
        CMPI    #$0028, R1                      ; 66A9   0379 0028
        BGE     L_66B0                          ; 66AB   020D 0003

        MVII    #$0090, R1                      ; 66AD   02B9 0090
        ADDR    R0,     R1                      ; 66AF   00C1
L_66B0:
        CMPI    #$0098, R1                      ; 66B0   0379 0098
        BLT     L_66B6                          ; 66B2   0205 0002

        MVII    #$0098, R1                      ; 66B4   02B9 0098
L_66B6:
        MVO     R1,     G_0160                  ; 66B6   0241 0160
        CLRR    R0                              ; 66B8   01C0
L_66B9:
        MVO     R0,     G_0162                  ; 66B9   0240 0162
L_66BB:
        MVI     G_0160, R1                      ; 66BB   0281 0160
        MVI     G_0162, R2                      ; 66BD   0282 0162
        XORI    #$0080, R2                      ; 66BF   03FA 0080
        SDBD                                    ; 66C1   0001
        XORI    #$4300, R1                      ; 66C2   03F9 0000 0043
        MVII    #$0323, R5                      ; 66C5   02BD 0323
        ADD     G_0123, R5                      ; 66C7   02C5 0123
        MVO@    R2,     R5                      ; 66C9   026A
        SUBI    #$0009, R5                      ; 66CA   033D 0009
        MVO@    R1,     R5                      ; 66CC   0269
        MVI     G_0123, R1                      ; 66CD   0281 0123
        CMPI    #$0004, R1                      ; 66CF   0379 0004
        BLT     L_66DA                          ; 66D1   0205 0007

        MOVR    R1,     R2                      ; 66D3   008A
        ADDI    #$032B, R2                      ; 66D4   02FA 032B
        MVI@    R2,     R0                      ; 66D6   0290
        XORI    #$0007, R0                      ; 66D7   03F8 0007
        MVO@    R0,     R2                      ; 66D9   0250

L_66DA:
        JSR     R5,     L_5FAB                  ; 66DA   0004 015C 03AB

        PULR    R7                              ; 66DD   02B7
L_66DE:
        PSHR    R5                              ; 66DE   0275
        B       L_66F2                          ; 66DF   0200 0011

        PSHR    R5                              ; 66E1   0275
        MVI     G_019A, R3                      ; 66E2   0283 019A
        INCR    R3                              ; 66E4   000B
        MVO     R3,     G_019A                  ; 66E5   0243 019A
        MVI     G_0102, R3                      ; 66E7   0283 0102
        DECR    R3                              ; 66E9   0013
        BMI     L_6740                          ; 66EA   020B 0054

        CMPI    #$0001, R3                      ; 66EC   037B 0001
        MVO     R3,     G_0102                  ; 66EE   0243 0102
        BNEQ    L_6740                          ; 66F0   020C 004E

L_66F2:
        MVO     R4,     .STIC.VIDEN             ; 66F2   0244 0020
        CLRR    R4                              ; 66F4   01E4
        MVII    #$0319, R5                      ; 66F5   02BD 0319
        MVI@    R5,     R0                      ; 66F7   02A8
        MVO@    R0,     R4                      ; 66F8   0260
        MVI@    R5,     R0                      ; 66F9   02A8
        MVO@    R0,     R4                      ; 66FA   0260
        MVI@    R5,     R0                      ; 66FB   02A8
        MVO@    R0,     R4                      ; 66FC   0260
        MVI@    R5,     R0                      ; 66FD   02A8
        MVO@    R0,     R4                      ; 66FE   0260
        MVI@    R5,     R0                      ; 66FF   02A8
        MVO@    R0,     R4                      ; 6700   0260
        MVI@    R5,     R0                      ; 6701   02A8
        MVO@    R0,     R4                      ; 6702   0260
        MVI@    R5,     R0                      ; 6703   02A8
        MVO@    R0,     R4                      ; 6704   0260
        MVI@    R5,     R0                      ; 6705   02A8
        MVO@    R0,     R4                      ; 6706   0260
        MVI@    R5,     R0                      ; 6707   02A8
        MVO@    R0,     R4                      ; 6708   0260
        MVI@    R5,     R0                      ; 6709   02A8
        MVO@    R0,     R4                      ; 670A   0260
        MVI@    R5,     R0                      ; 670B   02A8
        MVO@    R0,     R4                      ; 670C   0260
        MVI@    R5,     R0                      ; 670D   02A8
        MVO@    R0,     R4                      ; 670E   0260
        MVI@    R5,     R0                      ; 670F   02A8
        MVO@    R0,     R4                      ; 6710   0260
        MVI@    R5,     R0                      ; 6711   02A8
        MVO@    R0,     R4                      ; 6712   0260
        MVI@    R5,     R0                      ; 6713   02A8
        MVO@    R0,     R4                      ; 6714   0260
        MVI@    R5,     R0                      ; 6715   02A8
        MVO@    R0,     R4                      ; 6716   0260
        MVI@    R5,     R0                      ; 6717   02A8
        MVO@    R0,     R4                      ; 6718   0260
        MVI@    R5,     R0                      ; 6719   02A8
        MVO@    R0,     R4                      ; 671A   0260
        MVI@    R5,     R0                      ; 671B   02A8
        MVO@    R0,     R4                      ; 671C   0260
        MVI@    R5,     R0                      ; 671D   02A8
        MVO@    R0,     R4                      ; 671E   0260
        MVI@    R5,     R0                      ; 671F   02A8
        MVO@    R0,     R4                      ; 6720   0260
        MVI@    R5,     R0                      ; 6721   02A8
        MVO@    R0,     R4                      ; 6722   0260
        MVI@    R5,     R0                      ; 6723   02A8
        MVO@    R0,     R4                      ; 6724   0260
        MVI@    R5,     R0                      ; 6725   02A8
        MVO@    R0,     R4                      ; 6726   0260
        MVII    #$0331, R5                      ; 6727   02BD 0331
        MVII    #$001A, R4                      ; 6729   02BC 001A
        MVI@    R4,     R0                      ; 672B   02A0
        MVO@    R0,     R5                      ; 672C   0268
        MVI@    R4,     R0                      ; 672D   02A0
        MVO@    R0,     R5                      ; 672E   0268
        MVI@    R4,     R0                      ; 672F   02A0
        MVO@    R0,     R5                      ; 6730   0268
        MVI@    R4,     R0                      ; 6731   02A0
        MVO@    R0,     R5                      ; 6732   0268
        MVI@    R4,     R0                      ; 6733   02A0
        MVO@    R0,     R5                      ; 6734   0268
        MVI@    R4,     R0                      ; 6735   02A0
        MVO@    R0,     R5                      ; 6736   0268
        CLRR    R0                              ; 6737   01C0
        SUBI    #$0006, R4                      ; 6738   033C 0006
        MVO@    R0,     R4                      ; 673A   0260
        MVO@    R0,     R4                      ; 673B   0260
        MVO@    R0,     R4                      ; 673C   0260
        MVO@    R0,     R4                      ; 673D   0260
        MVO@    R0,     R4                      ; 673E   0260
        MVO@    R0,     R4                      ; 673F   0260
L_6740:
        MVO     R4,     .STIC.VIDEN             ; 6740   0244 0020
        MVI     G_0199, R1                      ; 6742   0281 0199
        INCR    R1                              ; 6744   0009
        MVO     R1,     G_0199                  ; 6745   0241 0199
        ANDI    #$0001, R1                      ; 6747   03B9 0001
        BEQ     L_674D                          ; 6749   0204 0002

        MVII    #$0006, R1                      ; 674B   02B9 0006
L_674D:
        MVII    #$0339, R3                      ; 674D   02BB 0339
        ADDR    R1,     R3                      ; 674F   00CB
        SDBD                                    ; 6750   0001
        MVII    #$38C0, R4                      ; 6751   02BC 00C0 0038
        SLL     R1,     2                       ; 6754   004D
        SLL     R1,     2                       ; 6755   004D
        ADDR    R1,     R4                      ; 6756   00CC
        MVII    #$0006, R2                      ; 6757   02BA 0006
L_6759:
        MVI@    R3,     R5                      ; 6759   029D
        TSTR    R5                              ; 675A   00AD
        BEQ     L_67A0                          ; 675B   0204 0043

        MVI@    R5,     R0                      ; 675D   02A8
        MVO@    R0,     R4                      ; 675E   0260
        MVI@    R5,     R0                      ; 675F   02A8
        MVO@    R0,     R4                      ; 6760   0260
        MVI@    R5,     R0                      ; 6761   02A8
        MVO@    R0,     R4                      ; 6762   0260
        MVI@    R5,     R0                      ; 6763   02A8
        MVO@    R0,     R4                      ; 6764   0260
        MVI@    R5,     R0                      ; 6765   02A8
        MVO@    R0,     R4                      ; 6766   0260
        MVI@    R5,     R0                      ; 6767   02A8
        MVO@    R0,     R4                      ; 6768   0260
        MVI@    R5,     R0                      ; 6769   02A8
        MVO@    R0,     R4                      ; 676A   0260
        MVI@    R5,     R0                      ; 676B   02A8
        MVO@    R0,     R4                      ; 676C   0260
        MVI@    R5,     R0                      ; 676D   02A8
        MVO@    R0,     R4                      ; 676E   0260
        MVI@    R5,     R0                      ; 676F   02A8
        MVO@    R0,     R4                      ; 6770   0260
        MVI@    R5,     R0                      ; 6771   02A8
        MVO@    R0,     R4                      ; 6772   0260
        MVI@    R5,     R0                      ; 6773   02A8
        MVO@    R0,     R4                      ; 6774   0260
        MVI@    R5,     R0                      ; 6775   02A8
        MVO@    R0,     R4                      ; 6776   0260
        MVI@    R5,     R0                      ; 6777   02A8
        MVO@    R0,     R4                      ; 6778   0260
        MVI@    R5,     R0                      ; 6779   02A8
        MVO@    R0,     R4                      ; 677A   0260
        MVI@    R5,     R0                      ; 677B   02A8
        MVO@    R0,     R4                      ; 677C   0260
L_677D:
        INCR    R3                              ; 677D   000B
        DECR    R2                              ; 677E   0012
        BNEQ    L_6759                          ; 677F   022C 0027

        INCR    R7                              ; 6781   000F
        PSHR    R5                              ; 6782   0275
        MVII    #$01FF, R2                      ; 6783   02BA 01FF
        SUB     G_0105, R2                      ; 6785   0302 0105
        MVI     G_0197, R0                      ; 6787   0280 0197
        TSTR    R0                              ; 6789   0080
        BEQ     L_6796                          ; 678A   0204 000A

        MVI     G_012D, R0                      ; 678C   0280 012D
        CMPI    #$0011, R0                      ; 678E   0378 0011
        BEQ     L_6796                          ; 6790   0204 0004

        MVII    #$01FF, R2                      ; 6792   02BA 01FF
        SUB     G_0198, R2                      ; 6794   0302 0198
L_6796:
        MVI@    R2,     R2                      ; 6796   0292
        MVII    #$0106, R1                      ; 6797   02B9 0106

        JSR     R5,     L_67C6                  ; 6799   0004 0164 03C6
        JSR     R5,     G_AC4D                  ; 679C   0004 01AC 004D

        PULR    R7                              ; 679F   02B7
L_67A0:
        ADDI    #$0010, R4                      ; 67A0   02FC 0010
        B       L_677D                          ; 67A2   0220 0026

L_67A4:
        PSHR    R5                              ; 67A4   0275
        PSHR    R2                              ; 67A5   0272
        MVI     .ISRVEC.0,R1                    ; 67A6   0281 0100
        MVI     .ISRVEC.1,R2                    ; 67A8   0282 0101
        SDBD                                    ; 67AA   0001
        MVII    #$67B4, R0                      ; 67AB   02B8 00B4 0067
        MVO     R0,     .ISRVEC.0               ; 67AE   0240 0100
        SWAP    R0,     1                       ; 67B0   0040
        MVO     R0,     .ISRVEC.1               ; 67B1   0240 0101
        DECR    R7                              ; 67B3   0017
        SUBI    #$0008, R6                      ; 67B4   033E 0008
        MVO     R1,     .ISRVEC.0               ; 67B6   0241 0100
        MVO     R2,     .ISRVEC.1               ; 67B8   0242 0101
        PULR    R2                              ; 67BA   02B2
L_67BB:
        PULR    R7                              ; 67BB   02B7
L_67BC:
        MVO@    R2,     R1                      ; 67BC   024A
        INCR    R1                              ; 67BD   0009
        MVII    #$0002, R0                      ; 67BE   02B8 0002
        MVO@    R0,     R1                      ; 67C0   0248
        MVII    #$00FF, R0                      ; 67C1   02B8 00FF
        MVO     R0,     G_0104                  ; 67C3   0240 0104
        PULR    R7                              ; 67C5   02B7
L_67C6:
        PSHR    R5                              ; 67C6   0275
        ADDI    #$0002, R1                      ; 67C7   02F9 0002
        CMP@    R1,     R2                      ; 67C9   034A
        BNEQ    L_67BC                          ; 67CA   022C 000F

        INCR    R1                              ; 67CC   0009
        MVI@    R1,     R0                      ; 67CD   0288
        DECR    R0                              ; 67CE   0010
        BMI     L_67BB                          ; 67CF   022B 0015

        MVO@    R0,     R1                      ; 67D1   0248
        BNEQ    L_67BB                          ; 67D2   022C 0018

        MOVR    R2,     R3                      ; 67D4   0093
        SLR     R3,     1                       ; 67D5   0063
        SLR     R3,     2                       ; 67D6   0067
        SLR     R3,     2                       ; 67D7   0067
        SDBD                                    ; 67D8   0001
        ADDI    #$6850, R3                      ; 67D9   02FB 0050 0068
        MVI@    R3,     R0                      ; 67DC   0298
        DECR    R0                              ; 67DD   0010
        BMI     L_67BB                          ; 67DE   022B 0024

        CMPI    #$0004, R0                      ; 67E0   0378 0004
        BLT     L_67FC                          ; 67E2   0205 0018

        SUBI    #$0002, R1                      ; 67E4   0339 0002
        MOVR    R0,     R3                      ; 67E6   0083
        SUBI    #$0003, R3                      ; 67E7   033B 0003
        MVO@    R3,     R1                      ; 67E9   024B
        DECR    R1                              ; 67EA   0011
L_67EB:
        ANDI    #$001F, R2                      ; 67EB   03BA 001F
        SDBD                                    ; 67ED   0001
        ADDI    #$6822, R2                      ; 67EE   02FA 0022 0068
        MVI@    R2,     R0                      ; 67F1   0290
        DECR    R0                              ; 67F2   0010
        BPL     L_6820                          ; 67F3   0203 002B

L_67F5:
        MVI@    R1,     R0                      ; 67F5   0288
        ANDI    #$00BF, R0                      ; 67F6   03B8 00BF
        XORI    #$0040, R0                      ; 67F8   03F8 0040
        MVO@    R0,     R1                      ; 67FA   0248
        PULR    R7                              ; 67FB   02B7
L_67FC:
        CLRR    R5                              ; 67FC   01ED
        SUBI    #$0002, R1                      ; 67FD   0339 0002
        MVO@    R5,     R1                      ; 67FF   024D
        DECR    R1                              ; 6800   0011
        TSTR    R0                              ; 6801   0080
        BEQ     L_67EB                          ; 6802   0224 0018

        MOVR    R2,     R3                      ; 6804   0093
        ANDI    #$0010, R3                      ; 6805   03BB 0010
        BEQ     L_67F5                          ; 6807   0224 0013

        ANDI    #$000F, R2                      ; 6809   03BA 000F
        SDBD                                    ; 680B   0001
        ADDI    #$6841, R2                      ; 680C   02FA 0041 0068
        MVI@    R2,     R3                      ; 680F   0293
        DECR    R3                              ; 6810   0013
        BMI     L_67F5                          ; 6811   022B 001D

        ADDR    R3,     R0                      ; 6813   00D8
        CMPI    #$000B, R0                      ; 6814   0378 000B
        BNEQ    L_6819                          ; 6816   020C 0001

        CLRR    R0                              ; 6818   01C0
L_6819:
        CMPI    #$000C, R0                      ; 6819   0378 000C
        BNEQ    L_681E                          ; 681B   020C 0001

        DECR    R0                              ; 681D   0010
L_681E:
        XORI    #$0080, R0                      ; 681E   03F8 0080
L_6820:
        MVO@    R0,     R1                      ; 6820   0248
        PULR    R7                              ; 6821   02B7
        DECLE   $0000,  $0000,  $0000           ; 6822   0000 0000 0000

        SETC                                    ; 6825   0007
        DECLE   $0000,  $0000                   ; 6826   0000 0000

        INCR    R3                              ; 6828   000B
        INCR    R0                              ; 6829   0008
        DECLE   $0000                           ; 682A   0000

        DIS                                     ; 682B   0003
        DECLE   $0000,  $0004                   ; 682C   0000 0004

        INCR    R7                              ; 682E   000F
        DECR    R0                              ; 682F   0010
        INCR    R4                              ; 6830   000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6831   0000 0000 0000 0000

        CLRC                                    ; 6835   0006
        DECLE   $0000,  $0000                   ; 6836   0000 0000

        INCR    R2                              ; 6838   000A
        INCR    R1                              ; 6839   0009
        DECLE   $0000                           ; 683A   0000

        EIS                                     ; 683B   0002
        DECLE   $0000,  $0005                   ; 683C   0000 0005

        INCR    R6                              ; 683E   000E
        DECLE   $0001                           ; 683F   0001

        INCR    R5                              ; 6840   000D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6841   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6845   0000 0000 0000

        INCR    R2                              ; 6848   000A
        DECLE   $0000,  $0000,  $0000           ; 6849   0000 0000 0000

        SETC                                    ; 684C   0007
        DECLE   $0000                           ; 684D   0000

        JSRE    R4,     .STIC.X.0               ; 684E   0004 0001 0000

        SETC                                    ; 6851   0007
        DECLE   $0005                           ; 6852   0005

        EIS                                     ; 6853   0002
        CLRC                                    ; 6854   0006
        DIS                                     ; 6855   0003

        JSRE    R4,     .STIC.X.0               ; 6856   0004 0001 0000
L_6859:
        DECLE   $0000,  $0000                   ; 6859   0000 0000

        RRC     R3,     1                       ; 685B   0073
        TSTR    R7                              ; 685C   00BF
        SLLC    R3,     2                       ; 685D   005F
        MOVR    R1,     R0                      ; 685E   0088
        COMR    R0                              ; 685F   0018
        DECLE   $0000                           ; 6860   0000

        SLLC    R1,     1                       ; 6861   0059
        MOVR    R1,     R0                      ; 6862   0088
        RLC     R0,     1                       ; 6863   0050
        RSWD    R7                              ; 6864   003F
        DECLE   $0000                           ; 6865   0000

        SARC    R1,     2                       ; 6866   007D
        ADDR    R7,     R7                      ; 6867   00FF
        ADDR    R7,     R7                      ; 6868   00FF
        ADDR    R7,     R7                      ; 6869   00FF
        ADDR    R7,     R7                      ; 686A   00FF
        ADDR    R7,     R7                      ; 686B   00FF
        ADDR    R7,     R7                      ; 686C   00FF
        ADDR    R7,     R7                      ; 686D   00FF
        ADDR    R7,     R7                      ; 686E   00FF
        MOVR    R7,     R6                      ; 686F   00BE
        COMR    R0                              ; 6870   0018
        COMR    R0                              ; 6871   0018
        COMR    R0                              ; 6872   0018
        COMR    R0                              ; 6873   0018
        COMR    R0                              ; 6874   0018
        COMR    R0                              ; 6875   0018
        COMR    R0                              ; 6876   0018
        COMR    R0                              ; 6877   0018
L_6878:
        PSHR    R5                              ; 6878   0275
        MVI     G_0178, R0                      ; 6879   0280 0178
        TSTR    R0                              ; 687B   0080
        BEQ     L_6886                          ; 687C   0204 0008

        DECR    R0                              ; 687E   0010
        MVO     R0,     G_0178                  ; 687F   0240 0178
        BNEQ    L_6886                          ; 6881   020C 0003

        JSR     R5,     L_6AAC                  ; 6883   0004 0168 02AC

L_6886:
        MVI     G_0115, R0                      ; 6886   0280 0115
        ANDI    #$0003, R0                      ; 6888   03B8 0003
        BNEQ    L_689A                          ; 688A   020C 000E

        MVII    #$033C, R3                      ; 688C   02BB 033C

        JSR     R5,     L_509A                  ; 688E   0004 0150 009A

        NEGR    R0                              ; 6891   0020
        ADDR    R1,     R3                      ; 6892   00CB
        MOVR    R2,     R3                      ; 6893   0093
        MVO@    R0,     R3                      ; 6894   0258
        MVI     G_0134, R0                      ; 6895   0280 0134
        TSTR    R0                              ; 6897   0080
        BNEQ    L_698D                          ; 6898   020C 00F3

L_689A:
        MVI     G_01BE, R0                      ; 689A   0280 01BE
        TSTR    R0                              ; 689C   0080
        BEQ     L_698D                          ; 689D   0204 00EE

        ANDI    #$0080, R0                      ; 689F   03B8 0080
        BNEQ    L_6A4D                          ; 68A1   020C 01AA

        MVII    #$0344, R3                      ; 68A3   02BB 0344

        JSR     R5,     L_509A                  ; 68A5   0004 0150 009A

        TSTR    R0                              ; 68A8   0080
        MOVR    R4,     R3                      ; 68A9   00A3
        MOVR    R3,     R2                      ; 68AA   009A
        MVO@    R0,     R3                      ; 68AB   0258
        MVII    #$0200, R0                      ; 68AC   02B8 0200
        MOVR    R0,     R3                      ; 68AE   0083
        MVI     G_01C5, R1                      ; 68AF   0281 01C5
        DECR    R1                              ; 68B1   0011
        BMI     L_68C4                          ; 68B2   020B 0010

        DECR    R1                              ; 68B4   0011
        BMI     L_68C1                          ; 68B5   020B 000A

        DECR    R1                              ; 68B7   0011
        BMI     L_68C2                          ; 68B8   020B 0008

        SLR     R0,     1                       ; 68BA   0060
        SLR     R3,     1                       ; 68BB   0063
        DECR    R1                              ; 68BC   0011
        BMI     L_68C6                          ; 68BD   020B 0007
        B       L_68C7                          ; 68BF   0200 0006

L_68C1:
        NEGR    R0                              ; 68C1   0020
L_68C2:
        CLRR    R3                              ; 68C2   01DB
        INCR    R7                              ; 68C3   000F
L_68C4:
        CLRR    R0                              ; 68C4   01C0
        INCR    R7                              ; 68C5   000F
L_68C6:
        NEGR    R0                              ; 68C6   0020
L_68C7:
        MVII    #$01BF, R4                      ; 68C7   02BC 01BF

        JSR     R5,     L_59AC                  ; 68C9   0004 0158 01AC

        DECR    R4                              ; 68CC   0014
        MVI@    R4,     R0                      ; 68CD   02A0
        MOVR    R0,     R2                      ; 68CE   0082
        SUBI    #$0003, R4                      ; 68CF   033C 0003
        MVI@    R4,     R3                      ; 68D1   02A3
        MOVR    R3,     R1                      ; 68D2   0099
        CMPI    #$0068, R0                      ; 68D3   0378 0068
        BGT     L_69FC                          ; 68D5   020E 0125

        CMPI    #$00A8, R3                      ; 68D7   037B 00A8
        BGT     L_69FC                          ; 68D9   020E 0121

        ANDI    #$0007, R0                      ; 68DB   03B8 0007
        BNEQ    L_698D                          ; 68DD   020C 00AE

        ANDI    #$0007, R3                      ; 68DF   03BB 0007
        BNEQ    L_698D                          ; 68E1   020C 00AA

        CLRR    R0                              ; 68E3   01C0
        MVO     R0,     G_011C                  ; 68E4   0240 011C
        MVI     G_01C2, R2                      ; 68E6   0282 01C2
        CMPI    #$0060, R2                      ; 68E8   037A 0060
        BGE     L_6A03                          ; 68EA   020D 0117

        JSR     R5,     L_5F72                  ; 68EC   0004 015C 0372

        CLRR    R0                              ; 68EF   01C0
        TSTR    R1                              ; 68F0   0089
        BEQ     L_692E                          ; 68F1   0204 003B

        MOVR    R2,     R4                      ; 68F3   0094
        MVI     G_01C5, R2                      ; 68F4   0282 01C5
        SLR     R1,     2                       ; 68F6   0065
        SLR     R1,     1                       ; 68F7   0061
        CMPI    #$0009, R1                      ; 68F8   0379 0009
        BEQ     L_6997                          ; 68FA   0204 009B

        CMPI    #$0017, R1                      ; 68FC   0379 0017
        BLT     L_690F                          ; 68FE   0205 000F

L_6900:
        CMPI    #$0037, R1                      ; 6900   0379 0037
        BNEQ    L_6906                          ; 6902   020C 0002

        MVII    #$001F, R1                      ; 6904   02B9 001F
L_6906:
        MVII    #$0001, R0                      ; 6906   02B8 0001
        TSTR    R2                              ; 6908   0092
        BEQ     L_698E                          ; 6909   0204 0083

        CMPI    #$0004, R2                      ; 690B   037A 0004
        BEQ     L_6994                          ; 690D   0204 0085

L_690F:
        SDBD                                    ; 690F   0001
        MVII    #$6858, R5                      ; 6910   02BD 0058 0068
        ADDR    R1,     R5                      ; 6913   00CD
        CMPI    #$0004, R2                      ; 6914   037A 0004
        BNEQ    L_6919                          ; 6916   020C 0001

        DECR    R2                              ; 6918   0012
L_6919:
        MVI@    R5,     R0                      ; 6919   02A8
        ADDR    R2,     R7                      ; 691A   00D7
        SLR     R0,     2                       ; 691B   0064
        SLR     R0,     2                       ; 691C   0064
        SLR     R0,     2                       ; 691D   0064
        ANDI    #$0003, R0                      ; 691E   03B8 0003
        CMPI    #$0013, R1                      ; 6920   0379 0013
        BLT     L_692E                          ; 6922   0205 000A

        CMPI    #$0017, R1                      ; 6924   0379 0017
        BGT     L_692E                          ; 6926   020E 0006

        CMPI    #$0003, R0                      ; 6928   0378 0003
        BNEQ    L_692E                          ; 692A   020C 0002

        MVII    #$0004, R0                      ; 692C   02B8 0004
L_692E:
        CMP     G_01C5, R0                      ; 692E   0340 01C5
        BEQ     L_6938                          ; 6930   0204 0006

L_6932:
        MVO     R0,     G_01C5                  ; 6932   0240 01C5
        MVII    #$0001, R0                      ; 6934   02B8 0001
        MVO     R0,     G_011C                  ; 6936   0240 011C
L_6938:
        TSTR    R0                              ; 6938   0080
        BEQ     L_6944                          ; 6939   0204 0009

        CLRR    R1                              ; 693B   01C9
        ANDI    #$0001, R0                      ; 693C   03B8 0001
        BNEQ    L_6942                          ; 693E   020C 0002

        MVII    #$0004, R1                      ; 6940   02B9 0004
L_6942:
        MVO     R1,     G_01BD                  ; 6942   0241 01BD
L_6944:
        MVI     G_01C0, R2                      ; 6944   0282 01C0
        MVI     G_01C5, R1                      ; 6946   0281 01C5
        CLRR    R0                              ; 6948   01C0
        CMPI    #$009A, R2                      ; 6949   037A 009A
        BLT     L_6955                          ; 694B   0205 0008

        CMPI    #$0002, R1                      ; 694D   0379 0002
        BEQ     L_692E                          ; 694F   0224 0022

        CMPI    #$0004, R1                      ; 6951   0379 0004
        BEQ     L_692E                          ; 6953   0224 0026

L_6955:
        CMPI    #$0009, R2                      ; 6955   037A 0009
        BGT     L_6961                          ; 6957   020E 0008

        CMPI    #$0001, R1                      ; 6959   0379 0001
        BEQ     L_692E                          ; 695B   0224 002E

        CMPI    #$0003, R1                      ; 695D   0379 0003
        BEQ     L_692E                          ; 695F   0224 0032

L_6961:
        TSTR    R1                              ; 6961   0089
        BEQ     L_6968                          ; 6962   0204 0004

        CMPI    #$0003, R1                      ; 6964   0379 0003
        BLT     L_696D                          ; 6966   0205 0005

L_6968:
        MVI     G_01BE, R2                      ; 6968   0282 01BE
        INCR    R2                              ; 696A   000A
        MVO     R2,     G_01BE                  ; 696B   0242 01BE
L_696D:
        MVI     G_01C6, R2                      ; 696D   0282 01C6
        INCR    R2                              ; 696F   000A
        CMPI    #$0003, R0                      ; 6970   0378 0003
        BLT     L_6975                          ; 6972   0205 0001

        INCR    R2                              ; 6974   000A
L_6975:
        MVO     R2,     G_01C6                  ; 6975   0242 01C6
        MVI     G_011C, R0                      ; 6977   0280 011C
        TSTR    R0                              ; 6979   0080
        BEQ     L_698D                          ; 697A   0204 0011

        MVI     G_01C5, R0                      ; 697C   0280 01C5

        JSR     R5,     L_6986                  ; 697E   0004 0168 0186

        DECR    R5                              ; 6981   0015
        COMR    R3                              ; 6982   001B
        COMR    R3                              ; 6983   001B
        COMR    R0                              ; 6984   0018
        COMR    R0                              ; 6985   0018
L_6986:
        ADDR    R1,     R5                      ; 6986   00CD
        MVI@    R5,     R0                      ; 6987   02A8
        MVI     G_01C2, R1                      ; 6988   0281 01C2

        JSR     R5,     G_AC28                  ; 698A   0004 01AC 0028

L_698D:
        PULR    R7                              ; 698D   02B7
L_698E:
        MVI     G_01C0, R2                      ; 698E   0282 01C0
        CMPI    #$0050, R2                      ; 6990   037A 0050
        BGT     L_692E                          ; 6992   022E 0065

L_6994:
        INCR    R0                              ; 6994   0008
        B       L_692E                          ; 6995   0220 0068

L_6997:
        MVI     G_01C6, R0                      ; 6997   0280 01C6
        CMP     G_01C4, R0                      ; 6999   0340 01C4
        BLT     L_6900                          ; 699B   0225 009C

        MVI     G_01BE, R0                      ; 699D   0280 01BE
        CMPI    #$0002, R0                      ; 699F   0378 0002
        BLT     L_6900                          ; 69A1   0225 00A2

        MVI     G_01C0, R0                      ; 69A3   0280 01C0
        CMPI    #$0009, R0                      ; 69A5   0378 0009
        BLT     L_6900                          ; 69A7   0225 00A8

        CMPI    #$00A0, R0                      ; 69A9   0378 00A0
        BGE     L_6900                          ; 69AB   022D 00AC

        CLRR    R0                              ; 69AD   01C0
        MVO     R0,     G_01BE                  ; 69AE   0240 01BE
        MVII    #$00A8, R0                      ; 69B0   02B8 00A8
        MVO     R0,     G_01C0                  ; 69B2   0240 01C0
        MVI     G_01ED, R3                      ; 69B4   0283 01ED
        MOVR    R3,     R1                      ; 69B6   0099
        SLL     R3,     2                       ; 69B7   004F
        ADDI    #$01CD, R3                      ; 69B8   02FB 01CD
        MVII    #$0001, R0                      ; 69BA   02B8 0001
        MVO@    R0,     R3                      ; 69BC   0258
        INCR    R3                              ; 69BD   000B
        MVO@    R4,     R3                      ; 69BE   025C
        DECR    R3                              ; 69BF   0013

        JSR     R5,     L_6AC4                  ; 69C0   0004 0168 02C4
        JSR     R5,     L_6A68                  ; 69C3   0004 0168 0268
        JSR     R5,     G_AC27                  ; 69C6   0004 01AC 0027

        NEGR    R1                              ; 69C9   0021
        PULR    R7                              ; 69CA   02B7
L_69CB:
        MVII    #$0068, R0                      ; 69CB   02B8 0068
        MVO     R0,     G_01C2                  ; 69CD   0240 01C2
        CLRR    R0                              ; 69CF   01C0
        MVO     R0,     G_01BE                  ; 69D0   0240 01BE
        MVI     G_01ED, R3                      ; 69D2   0283 01ED
        SLL     R3,     2                       ; 69D4   004F
        ADDI    #$01CD, R3                      ; 69D5   02FB 01CD
        MVII    #$0003, R0                      ; 69D7   02B8 0003
        MVO@    R0,     R3                      ; 69D9   0258
        MVI     G_01C0, R1                      ; 69DA   0281 01C0
        SLR     R2,     2                       ; 69DC   0066
        SLR     R2,     1                       ; 69DD   0062
        ADDI    #$00DB, R2                      ; 69DE   02FA 00DB
        INCR    R3                              ; 69E0   000B
        MVO@    R2,     R3                      ; 69E1   025A
        MVI     G_01ED, R1                      ; 69E2   0281 01ED

        JSR     R5,     L_6AC4                  ; 69E4   0004 0168 02C4

        MVII    #$01C9, R3                      ; 69E7   02BB 01C9
L_69E9:
        ADDI    #$0004, R3                      ; 69E9   02FB 0004
        CMPI    #$01EC, R3                      ; 69EB   037B 01EC
        BGT     L_6A1F                          ; 69ED   020E 0030

        MVI@    R3,     R0                      ; 69EF   0298
        CMPI    #$0003, R0                      ; 69F0   0378 0003
        BEQ     L_69E9                          ; 69F2   0224 000A

        JSR     R5,     L_6A68                  ; 69F4   0004 0168 0268
        JSR     R5,     G_AC27                  ; 69F7   0004 01AC 0027

        COMR    R6                              ; 69FA   001E
        PULR    R7                              ; 69FB   02B7
L_69FC:
        MVII    #$0060, R0                      ; 69FC   02B8 0060
        MVO     R0,     G_01C2                  ; 69FE   0240 01C2
        CLRR    R0                              ; 6A00   01C0
        MVO     R0,     G_01C0                  ; 6A01   0240 01C0
L_6A03:
        MVI     G_01ED, R3                      ; 6A03   0283 01ED
        MVI     G_01C0, R2                      ; 6A05   0282 01C0

        JSR     R5,     L_6A12                  ; 6A07   0004 0168 0212

        SLLC    R0,     1                       ; 6A0A   0058
        RLC     R0,     1                       ; 6A0B   0050
        SLR     R0,     1                       ; 6A0C   0060
        SLL     R0,     1                       ; 6A0D   0048
        SAR     R0,     1                       ; 6A0E   0068
        SWAP    R0,     1                       ; 6A0F   0040
        RRC     R0,     1                       ; 6A10   0070
        RSWD    R0                              ; 6A11   0038
L_6A12:
        ADDR    R3,     R5                      ; 6A12   00DD
        MVI@    R5,     R3                      ; 6A13   02AB
        MVII    #$0002, R0                      ; 6A14   02B8 0002
        SUBR    R2,     R3                      ; 6A16   0113
        BEQ     L_69CB                          ; 6A17   0224 004D
        BPL     L_692E                          ; 6A19   0223 00EC

        MVII    #$0001, R0                      ; 6A1B   02B8 0001
        B       L_692E                          ; 6A1D   0220 00F0

L_6A1F:
        MVI     G_012D, R0                      ; 6A1F   0280 012D
        CMPI    #$0005, R0                      ; 6A21   0378 0005
        BNEQ    L_6A2F                          ; 6A23   020C 000A

        MVII    #$0187, R1                      ; 6A25   02B9 0187
        ADD     G_0198, R1                      ; 6A27   02C1 0198
        MVI@    R1,     R0                      ; 6A29   0288
        INCR    R0                              ; 6A2A   0008
        MVO@    R0,     R1                      ; 6A2B   0248

        JSR     R5,     L_5DF2                  ; 6A2C   0004 015C 01F2

L_6A2F:
        MVII    #$0003, R4                      ; 6A2F   02BC 0003
        MVII    #$0009, R0                      ; 6A31   02B8 0009
        MVII    #$000C, R5                      ; 6A33   02BD 000C
        MVII    #$012E, R1                      ; 6A35   02B9 012E
        ADD     G_0198, R1                      ; 6A37   02C1 0198
        MVI@    R1,     R1                      ; 6A39   0289
        INCR    R1                              ; 6A3A   0009
        ANDI    #$0003, R1                      ; 6A3B   03B9 0003
        BNEQ    L_6A45                          ; 6A3D   020C 0006

        MVII    #$0001, R4                      ; 6A3F   02BC 0001
        MVII    #$000C, R0                      ; 6A41   02B8 000C
        MVII    #$0008, R5                      ; 6A43   02BD 0008
L_6A45:
        MVO     R4,     G_012D                  ; 6A45   0244 012D
        MVO     R5,     G_015D                  ; 6A47   0245 015D

        JSR     R5,     G_AC28                  ; 6A49   0004 01AC 0028

        PULR    R7                              ; 6A4C   02B7
L_6A4D:
        MVI     G_01C6, R0                      ; 6A4D   0280 01C6
        DECR    R0                              ; 6A4F   0010
        BPL     L_6A59                          ; 6A50   0203 0007

        MVII    #$00A8, R0                      ; 6A52   02B8 00A8
        MVO     R0,     G_01C0                  ; 6A54   0240 01C0
        CLRR    R0                              ; 6A56   01C0
        MVO     R0,     G_01BE                  ; 6A57   0240 01BE
L_6A59:
        MVO     R0,     G_01C6                  ; 6A59   0240 01C6
        MVI     G_0115, R0                      ; 6A5B   0280 0115
        ANDI    #$0003, R0                      ; 6A5D   03B8 0003
        BNEQ    L_698D                          ; 6A5F   022C 00D3

        MVI     G_01BD, R3                      ; 6A61   0283 01BD
        XORI    #$0008, R3                      ; 6A63   03FB 0008
        MVO     R3,     G_01BD                  ; 6A65   0243 01BD
        PULR    R7                              ; 6A67   02B7
L_6A68:
        PSHR    R5                              ; 6A68   0275
        MVI     G_012D, R0                      ; 6A69   0280 012D
        ANDI    #$0001, R0                      ; 6A6B   03B8 0001
        BNEQ    L_698D                          ; 6A6D   022C 00E1

        MVII    #$0179, R1                      ; 6A6F   02B9 0179
        ADD     G_0198, R1                      ; 6A71   02C1 0198
        MVI@    R1,     R0                      ; 6A73   0288
        INCR    R0                              ; 6A74   0008
        MVO@    R0,     R1                      ; 6A75   0248
        CMPI    #$0005, R0                      ; 6A76   0378 0005
        BLT     L_698D                          ; 6A78   0225 00EC

        CLRR    R0                              ; 6A7A   01C0
        MVO@    R0,     R1                      ; 6A7B   0248
        MVI     G_011D, R0                      ; 6A7C   0280 011D
        MOVR    R0,     R4                      ; 6A7E   0084
        SLL     R0,     1                       ; 6A7F   0048
        ADDR    R0,     R4                      ; 6A80   00C4
L_6A81:
        SDBD                                    ; 6A81   0001
        ADDI    #$90DF, R4                      ; 6A82   02FC 00DF 0090
        MVI     G_034C, R1                      ; 6A85   0281 034C
        SDBD                                    ; 6A87   0001
        XORI    #$09B8, R1                      ; 6A88   03F9 00B8 0009
        MVI@    R4,     R0                      ; 6A8B   02A0
        MVI     G_01AA, R5                      ; 6A8C   0285 01AA
        TSTR    R5                              ; 6A8E   00AD
        BEQ     L_6A93                          ; 6A8F   0204 0002

        MVII    #$0260, R0                      ; 6A91   02B8 0260
L_6A93:
        SLL     R0,     2                       ; 6A93   004C
        SLL     R0,     2                       ; 6A94   004C
        XORR    R1,     R0                      ; 6A95   01C8
        MVI@    R4,     R1                      ; 6A96   02A1
        MVO@    R0,     R1                      ; 6A97   0248
        MVII    #$0005, R0                      ; 6A98   02B8 0005
        MVI     .BTAB.0A,R4                     ; 6A9A   0284 020A
        MVII    #$0006, R1                      ; 6A9C   02B9 0006
        MVII    #$0001, R3                      ; 6A9E   02BB 0001

        JSR     R5,     X_PRNUM_RGT             ; 6AA0   0004 0118 00C5

        MVII    #$00AA, R0                      ; 6AA3   02B8 00AA
        MVO     R0,     G_0178                  ; 6AA5   0240 0178

        JSR     R5,     G_AC27                  ; 6AA7   0004 01AC 0027

        NEGR    R4                              ; 6AAA   0024
        PULR    R7                              ; 6AAB   02B7
L_6AAC:
        PSHR    R5                              ; 6AAC   0275
        MVI     G_011D, R0                      ; 6AAD   0280 011D
        MOVR    R0,     R4                      ; 6AAF   0084
        SLL     R0,     1                       ; 6AB0   0048
        ADDR    R0,     R4                      ; 6AB1   00C4
        SDBD                                    ; 6AB2   0001
        ADDI    #$90E0, R4                      ; 6AB3   02FC 00E0 0090
        SDBD                                    ; 6AB6   0001
        MVII    #$09B8, R0                      ; 6AB7   02B8 00B8 0009
        XOR     G_034C, R0                      ; 6ABA   03C0 034C
        XOR     G_0347, R0                      ; 6ABC   03C0 0347
        MVI@    R4,     R1                      ; 6ABE   02A1
        MVO@    R0,     R1                      ; 6ABF   0248
        CLRR    R0                              ; 6AC0   01C0
        MVO     R0,     G_0178                  ; 6AC1   0240 0178
        PULR    R7                              ; 6AC3   02B7
L_6AC4:
        PSHR    R5                              ; 6AC4   0275
        MOVR    R1,     R3                      ; 6AC5   008B
        SLL     R3,     2                       ; 6AC6   004F
        ADDI    #$01CD, R3                      ; 6AC7   02FB 01CD
        MVI@    R3,     R5                      ; 6AC9   029D
        INCR    R3                              ; 6ACA   000B
        MVI@    R3,     R4                      ; 6ACB   029C
        CMPI    #$0003, R5                      ; 6ACC   037D 0003
        BNEQ    L_6AD7                          ; 6ACE   020C 0007

        JSR     R5,     L_6B56                  ; 6AD0   0004 0168 0356

        ADDI    #$0008, R0                      ; 6AD3   02F8 0008
        B       L_6AEB                          ; 6AD5   0200 0014

L_6AD7:
        CMPI    #$0014, R4                      ; 6AD7   037C 0014
        BLT     L_698D                          ; 6AD9   0225 014D

        MOVR    R1,     R3                      ; 6ADB   008B

        JSR     R5,     L_6B6A                  ; 6ADC   0004 0168 036A

        XOR     G_034C, R0                      ; 6ADF   03C0 034C
        SDBD                                    ; 6AE1   0001
        ADDI    #$08F0, R0                      ; 6AE2   02F8 00F0 0008
        ANDI    #$0002, R3                      ; 6AE5   03BB 0002
        BNEQ    L_6AEB                          ; 6AE7   020C 0002

        ADDI    #$0008, R0                      ; 6AE9   02F8 0008
L_6AEB:
        ADDI    #$0200, R4                      ; 6AEB   02FC 0200
        MVO@    R0,     R4                      ; 6AED   0260
        PULR    R7                              ; 6AEE   02B7
L_6AEF:
        PSHR    R5                              ; 6AEF   0275

        JSR     R5,     L_5DD2                  ; 6AF0   0004 015C 01D2

        SDBD                                    ; 6AF3   0001
        MVII    #$9066, R5                      ; 6AF4   02BD 0066 0090
        MVI     G_011D, R0                      ; 6AF7   0280 011D
        SUBI    #$0008, R5                      ; 6AF9   033D 0008
L_6AFB:
        ADDI    #$0008, R5                      ; 6AFB   02FD 0008
        DECR    R0                              ; 6AFD   0010
        BPL     L_6AFB                          ; 6AFE   0223 0004

        CLRR    R1                              ; 6B00   01C9
        MVII    #$01CD, R4                      ; 6B01   02BC 01CD
        MVI     G_0138, R2                      ; 6B03   0282 0138
L_6B05:
        MVII    #$0003, R0                      ; 6B05   02B8 0003
        MVO@    R0,     R4                      ; 6B07   0260
        CLRR    R0                              ; 6B08   01C0
        MVI@    R5,     R3                      ; 6B09   02AB
        TSTR    R3                              ; 6B0A   009B
        BEQ     L_6B14                          ; 6B0B   0204 0007

        CMPR    R2,     R1                      ; 6B0D   0151
        BGE     L_6B14                          ; 6B0E   020D 0004

        INCR    R0                              ; 6B10   0008
        DECR    R4                              ; 6B11   0014
        MVO@    R0,     R4                      ; 6B12   0260
        INCR    R7                              ; 6B13   000F
L_6B14:
        CLRR    R3                              ; 6B14   01DB
        MVO@    R3,     R4                      ; 6B15   0263
        ADDI    #$0002, R4                      ; 6B16   02FC 0002
        INCR    R1                              ; 6B18   0009
        CMPI    #$0008, R1                      ; 6B19   0379 0008
        BLT     L_6B05                          ; 6B1B   0225 0017

        PULR    R7                              ; 6B1D   02B7
L_6B1E:
        PSHR    R5                              ; 6B1E   0275
        MVII    #$01CD, R5                      ; 6B1F   02BD 01CD
        MVII    #$01CF, R4                      ; 6B21   02BC 01CF
L_6B23:
        MVI@    R5,     R1                      ; 6B23   02A9
        MVI@    R4,     R2                      ; 6B24   02A2
        DECR    R5                              ; 6B25   0015
        DECR    R4                              ; 6B26   0014
        MVO@    R2,     R5                      ; 6B27   026A
        MVO@    R1,     R4                      ; 6B28   0261
        MVI@    R5,     R1                      ; 6B29   02A9
        MVI@    R4,     R2                      ; 6B2A   02A2
        DECR    R5                              ; 6B2B   0015
        DECR    R4                              ; 6B2C   0014
        MVO@    R2,     R5                      ; 6B2D   026A
        MVO@    R1,     R4                      ; 6B2E   0261
        ADDI    #$0002, R4                      ; 6B2F   02FC 0002
        ADDI    #$0002, R5                      ; 6B31   02FD 0002
        CMPI    #$01EB, R5                      ; 6B33   037D 01EB
        BLT     L_6B23                          ; 6B35   0225 0013

        PULR    R7                              ; 6B37   02B7
L_6B38:
        PSHR    R5                              ; 6B38   0275
        MVI     G_012D, R0                      ; 6B39   0280 012D
        ANDI    #$0080, R0                      ; 6B3B   03B8 0080
        BNEQ    L_698D                          ; 6B3D   022C 01B1

        MVI     G_011D, R0                      ; 6B3F   0280 011D
        MVII    #$02E5, R4                      ; 6B41   02BC 02E5
        MVI     G_0138, R1                      ; 6B43   0281 0138
        MOVR    R1,     R2                      ; 6B45   008A
        SLR     R2,     1                       ; 6B46   0062
        SUBR    R2,     R4                      ; 6B47   0114

        JSR     R5,     L_6B56                  ; 6B48   0004 0168 0356

        MVO@    R0,     R4                      ; 6B4B   0260
        SUBI    #$0008, R0                      ; 6B4C   0338 0008
L_6B4E:
        MVO@    R0,     R4                      ; 6B4E   0260
        DECR    R1                              ; 6B4F   0011
        BNEQ    L_6B4E                          ; 6B50   022C 0003

        ADDI    #$0018, R0                      ; 6B52   02F8 0018
        MVO@    R0,     R4                      ; 6B54   0260
        PULR    R7                              ; 6B55   02B7
L_6B56:
        PSHR    R5                              ; 6B56   0275

        JSR     R5,     L_6B61                  ; 6B57   0004 0168 0361

        SDBD                                    ; 6B5A   0001
        XORI    #$0800, R0                      ; 6B5B   03F8 0000 0008
        XORI    #$01A0, R0                      ; 6B5E   03F8 01A0
        PULR    R7                              ; 6B60   02B7
L_6B61:
        PSHR    R5                              ; 6B61   0275
        SDBD                                    ; 6B62   0001
        MVII    #$9156, R5                      ; 6B63   02BD 0056 0091
        ADD     G_011D, R5                      ; 6B66   02C5 011D
        MVI@    R5,     R0                      ; 6B68   02A8
        PULR    R7                              ; 6B69   02B7
L_6B6A:
        PSHR    R5                              ; 6B6A   0275
        SDBD                                    ; 6B6B   0001
        MVII    #$9165, R5                      ; 6B6C   02BD 0065 0091
        ADD     G_011D, R5                      ; 6B6F   02C5 011D
        MVI@    R5,     R0                      ; 6B71   02A8
        SLL     R0,     2                       ; 6B72   004C
        SLL     R0,     2                       ; 6B73   004C
        PULR    R7                              ; 6B74   02B7
        MVII    #$0001, R0                      ; 6B75   02B8 0001
        INCR    R7                              ; 6B77   000F
L_6B78:
        CLRR    R0                              ; 6B78   01C0
        PSHR    R5                              ; 6B79   0275
        MVO     R0,     G_0177                  ; 6B7A   0240 0177
        CLRR    R1                              ; 6B7C   01C9
        MVII    #$0319, R4                      ; 6B7D   02BC 0319
L_6B7F:
        MVO@    R1,     R4                      ; 6B7F   0261
        CMPI    #$0320, R4                      ; 6B80   037C 0320
        BLE     L_6B7F                          ; 6B82   0226 0004

        CLRR    R0                              ; 6B84   01C0
        MVO     R0,     .BTAB.EE                ; 6B85   0240 02EE
        MVO     R0,     .BTAB.EF                ; 6B87   0240 02EF
        MVI     G_011D, R0                      ; 6B89   0280 011D
        CMPI    #$0005, R0                      ; 6B8B   0378 0005
        BEQ     L_6BAE                          ; 6B8D   0204 001F

        JSR     R5,     L_5E29                  ; 6B8F   0004 015C 0229

        SUBI    #$0093, R1                      ; 6B92   0339 0093
        TSTR    R3                              ; 6B94   009B
        ADDR    R2,     R3                      ; 6B95   00D3
        TSTR    R3                              ; 6B96   009B
        MOVR    R2,     R3                      ; 6B97   0093
        TSTR    R3                              ; 6B98   009B
        ADDR    R1,     R3                      ; 6B99   00CB
        MOVR    R2,     R3                      ; 6B9A   0093
        DECLE   $0000,  $0000                   ; 6B9B   0000 0000

        MVI     G_011D, R0                      ; 6B9D   0280 011D
        CMPI    #$0003, R0                      ; 6B9F   0378 0003
        BEQ     L_6BBC                          ; 6BA1   0204 0019

        MVI     G_0135, R0                      ; 6BA3   0280 0135
        TSTR    R0                              ; 6BA5   0080
        BNEQ    L_6BBC                          ; 6BA6   020C 0014

        MVI     G_0339, R0                      ; 6BA8   0280 0339
        MVO     R0,     G_033A                  ; 6BAA   0240 033A
        B       L_6BBC                          ; 6BAC   0200 000E

L_6BAE:
        JSR     R5,     L_5E29                  ; 6BAE   0004 015C 0229

        SUBI    #$00A3, R1                      ; 6BB1   0339 00A3
        TSTR    R2                              ; 6BB3   0092
        GSWD    R3                              ; 6BB4   0033
        MOVR    R2,     R3                      ; 6BB5   0093
        MOVR    R2,     R3                      ; 6BB6   0093
        TSTR    R3                              ; 6BB7   009B
        ADDR    R1,     R3                      ; 6BB8   00CB
        MOVR    R2,     R3                      ; 6BB9   0093
        DECLE   $0000,  $0000                   ; 6BBA   0000 0000
L_6BBC:
        JSR     R5,     L_67A4                  ; 6BBC   0004 0164 03A4

        MVII    #$0001, R0                      ; 6BBF   02B8 0001
        MVO     R0,     G_0102                  ; 6BC1   0240 0102
        MVII    #$0002, R1                      ; 6BC3   02B9 0002
        MVI     G_0155, R0                      ; 6BC5   0280 0155
        TSTR    R0                              ; 6BC7   0080
        BEQ     L_6BCB                          ; 6BC8   0204 0001

        SLR     R1,     1                       ; 6BCA   0061
L_6BCB:
        MVO     R1,     .STIC.EDGE              ; 6BCB   0241 0032

        JSR     R5,     L_66DE                  ; 6BCD   0004 0164 02DE
        JSR     R5,     L_67A4                  ; 6BD0   0004 0164 03A4
        JSR     R5,     L_66DE                  ; 6BD3   0004 0164 02DE

L_6BD6:
        MVI     G_0177, R5                      ; 6BD6   0285 0177
        CMPI    #$0028, R5                      ; 6BD8   037D 0028
        BNEQ    L_6BE6                          ; 6BDA   020C 000A

        MVI     G_0156, R0                      ; 6BDC   0280 0156
        MVI     G_0158, R1                      ; 6BDE   0281 0158
        TSTR    R0                              ; 6BE0   0080
        BNEQ    L_6BE6                          ; 6BE1   020C 0003

        TSTR    R1                              ; 6BE3   0089
        BEQ     L_6DCC                          ; 6BE4   0204 01E6

L_6BE6:
        MVII    #$0155, R4                      ; 6BE6   02BC 0155
        MVII    #$0159, R5                      ; 6BE8   02BD 0159
L_6BEA:
        MVI@    R4,     R0                      ; 6BEA   02A0
        MOVR    R4,     R3                      ; 6BEB   00A3
        ADD@    R4,     R0                      ; 6BEC   02E0
        MOVR    R0,     R2                      ; 6BED   0082
        MOVR    R0,     R1                      ; 6BEE   0081
        SUB@    R3,     R0                      ; 6BEF   0318
        ANDI    #$0007, R1                      ; 6BF0   03B9 0007
        MVO@    R1,     R3                      ; 6BF2   0259
        XORR    R1,     R2                      ; 6BF3   01CA
        MVO@    R2,     R5                      ; 6BF4   026A
        INCR    R5                              ; 6BF5   000D
        SUBR    R0,     R2                      ; 6BF6   0102
        MVO@    R2,     R5                      ; 6BF7   026A
        SUBI    #$0002, R5                      ; 6BF8   033D 0002
        CMPI    #$015B, R5                      ; 6BFA   037D 015B
        BNEQ    L_6BEA                          ; 6BFC   022C 0013

        JSR     R5,     L_67A4                  ; 6BFE   0004 0164 03A4

        CLRR    R4                              ; 6C01   01E4
        MVI     G_0156, R0                      ; 6C02   0280 0156
        MVO     R0,     .STIC.HDLY              ; 6C04   0240 0030
        MVI     G_0158, R0                      ; 6C06   0280 0158
        MVO     R0,     .STIC.VDLY              ; 6C08   0240 0031
        MVO     R0,     .STIC.VIDEN             ; 6C0A   0240 0020

        JSR     R5,     L_6C44                  ; 6C0C   0004 016C 0044
        JSR     R5,     L_6CA1                  ; 6C0F   0004 016C 00A1

        CLRR    R0                              ; 6C12   01C0
        MVI     G_0159, R1                      ; 6C13   0281 0159
        SWAP    R1,     2                       ; 6C15   0045
        BEQ     L_6C29                          ; 6C16   0204 0011
        BMI     L_6C1B                          ; 6C18   020B 0001

        INCR    R0                              ; 6C1A   0008

L_6C1B:
        JSR     R5,     L_6D14                  ; 6C1B   0004 016C 0114

        MVI     G_0177, R5                      ; 6C1E   0285 0177
        INCR    R5                              ; 6C20   000D
        MVO     R5,     G_0177                  ; 6C21   0245 0177
        CMPI    #$0014, R5                      ; 6C23   037D 0014
        BLT     L_6BD6                          ; 6C25   0225 0050
        B       L_6C3E                          ; 6C27   0200 0015

L_6C29:
        MVI     G_015A, R1                      ; 6C29   0281 015A
        CLRR    R0                              ; 6C2B   01C0
        SWAP    R1,     2                       ; 6C2C   0045
        BEQ     L_6BD6                          ; 6C2D   0224 0058
        BMI     L_6C32                          ; 6C2F   020B 0001

        INCR    R0                              ; 6C31   0008

L_6C32:
        JSR     R5,     L_6D5A                  ; 6C32   0004 016C 015A

        MVI     G_0177, R5                      ; 6C35   0285 0177
        INCR    R5                              ; 6C37   000D
        MVO     R5,     G_0177                  ; 6C38   0245 0177
        CMPI    #$000C, R5                      ; 6C3A   037D 000C
        BLT     L_6BD6                          ; 6C3C   0225 0067

L_6C3E:
        MVII    #$0028, R5                      ; 6C3E   02BD 0028
        MVO     R5,     G_0177                  ; 6C40   0245 0177
        B       L_6BD6                          ; 6C42   0220 006D

L_6C44:
        PSHR    R5                              ; 6C44   0275
        MVI     G_0159, R0                      ; 6C45   0280 0159
        SWAP    R0,     2                       ; 6C47   0044
        BEQ     L_6CA0                          ; 6C48   0204 0056
        BPL     L_6C70                          ; 6C4A   0203 0024

        MVII    #$0200, R5                      ; 6C4C   02BD 0200
        MVII    #$0201, R4                      ; 6C4E   02BC 0201
        CLRR    R2                              ; 6C50   01D2
L_6C51:
        CLRR    R3                              ; 6C51   01DB
        INCR    R3                              ; 6C52   000B
L_6C53:
        MVI@    R4,     R0                      ; 6C53   02A0
        MVO@    R0,     R5                      ; 6C54   0268
        MVI@    R4,     R0                      ; 6C55   02A0
        MVO@    R0,     R5                      ; 6C56   0268
        MVI@    R4,     R0                      ; 6C57   02A0
        MVO@    R0,     R5                      ; 6C58   0268
        MVI@    R4,     R0                      ; 6C59   02A0
        MVO@    R0,     R5                      ; 6C5A   0268
        MVI@    R4,     R0                      ; 6C5B   02A0
        MVO@    R0,     R5                      ; 6C5C   0268
        MVI@    R4,     R0                      ; 6C5D   02A0
        MVO@    R0,     R5                      ; 6C5E   0268
        MVI@    R4,     R0                      ; 6C5F   02A0
        MVO@    R0,     R5                      ; 6C60   0268
        MVI@    R4,     R0                      ; 6C61   02A0
        MVO@    R0,     R5                      ; 6C62   0268
        MVI@    R4,     R0                      ; 6C63   02A0
        MVO@    R0,     R5                      ; 6C64   0268
        MVI@    R4,     R0                      ; 6C65   02A0
        MVO@    R0,     R5                      ; 6C66   0268
        NEGR    R3                              ; 6C67   0023
        TSTR    R3                              ; 6C68   009B
        BMI     L_6C53                          ; 6C69   022B 0017

        CMPI    #$02E6, R4                      ; 6C6B   037C 02E6
        BLT     L_6C51                          ; 6C6D   0225 001D

L_6C6F:
        PULR    R7                              ; 6C6F   02B7
L_6C70:
        MVII    #$0212, R5                      ; 6C70   02BD 0212
        MVII    #$0003, R1                      ; 6C72   02B9 0003
        CLRR    R2                              ; 6C74   01D2
L_6C75:
        CLRR    R3                              ; 6C75   01DB
        INCR    R3                              ; 6C76   000B
L_6C77:
        MVI@    R5,     R0                      ; 6C77   02A8
        MVO@    R0,     R5                      ; 6C78   0268
        SUBR    R1,     R5                      ; 6C79   010D
        MVI@    R5,     R0                      ; 6C7A   02A8
        MVO@    R0,     R5                      ; 6C7B   0268
        SUBR    R1,     R5                      ; 6C7C   010D
        MVI@    R5,     R0                      ; 6C7D   02A8
L_6C7E:
        MVO@    R0,     R5                      ; 6C7E   0268
        SUBR    R1,     R5                      ; 6C7F   010D
        MVI@    R5,     R0                      ; 6C80   02A8
        MVO@    R0,     R5                      ; 6C81   0268
        SUBR    R1,     R5                      ; 6C82   010D
        MVI@    R5,     R0                      ; 6C83   02A8
        MVO@    R0,     R5                      ; 6C84   0268
        SUBR    R1,     R5                      ; 6C85   010D
        MVI@    R5,     R0                      ; 6C86   02A8
        MVO@    R0,     R5                      ; 6C87   0268
        SUBR    R1,     R5                      ; 6C88   010D
        MVI@    R5,     R0                      ; 6C89   02A8
        MVO@    R0,     R5                      ; 6C8A   0268
        SUBR    R1,     R5                      ; 6C8B   010D
        MVI@    R5,     R0                      ; 6C8C   02A8
        MVO@    R0,     R5                      ; 6C8D   0268
        SUBR    R1,     R5                      ; 6C8E   010D
        MVI@    R5,     R0                      ; 6C8F   02A8
        MVO@    R0,     R5                      ; 6C90   0268
        MOVR    R1,     R5                      ; 6C91   008D
        MVI@    R5,     R0                      ; 6C92   02A8
        MVO@    R0,     R5                      ; 6C93   0268
        MOVR    R1,     R5                      ; 6C94   008D
        NEGR    R3                              ; 6C95   0023
        TSTR    R3                              ; 6C96   009B
        BMI     L_6C77                          ; 6C97   022B 0021

        ADDI    #$0028, R5                      ; 6C99   02FD 0028
        CMPI    #$02F0, R5                      ; 6C9B   037D 02F0
        BLT     L_6C75                          ; 6C9D   0225 0029

        INCR    R2                              ; 6C9F   000A
L_6CA0:
        PULR    R7                              ; 6CA0   02B7
L_6CA1:
        PSHR    R5                              ; 6CA1   0275
        MVI     G_015A, R0                      ; 6CA2   0280 015A
        SWAP    R0,     2                       ; 6CA4   0044
        BEQ     L_6D13                          ; 6CA5   0204 006C
        BMI     L_6CFB                          ; 6CA7   020B 0052

        CLRR    R1                              ; 6CA9   01C9
        INCR    R7                              ; 6CAA   000F
        PSHR    R5                              ; 6CAB   0275
        MVII    #$0214, R5                      ; 6CAC   02BD 0214
        MVII    #$0001, R3                      ; 6CAE   02BB 0001
L_6CB0:
        MVII    #$0200, R4                      ; 6CB0   02BC 0200
        TSTR    R3                              ; 6CB2   009B
        BMI     L_6CB7                          ; 6CB3   020B 0002

        ADDI    #$00DC, R4                      ; 6CB5   02FC 00DC
L_6CB7:
        MVII    #$0001, R2                      ; 6CB7   02BA 0001
L_6CB9:
        MVI@    R5,     R0                      ; 6CB9   02A8
        MVO@    R0,     R4                      ; 6CBA   0260
        MVI@    R5,     R0                      ; 6CBB   02A8
        MVO@    R0,     R4                      ; 6CBC   0260
        MVI@    R5,     R0                      ; 6CBD   02A8
        MVO@    R0,     R4                      ; 6CBE   0260
        MVI@    R5,     R0                      ; 6CBF   02A8
        MVO@    R0,     R4                      ; 6CC0   0260
        MVI@    R5,     R0                      ; 6CC1   02A8
        MVO@    R0,     R4                      ; 6CC2   0260
        MVI@    R5,     R0                      ; 6CC3   02A8
        MVO@    R0,     R4                      ; 6CC4   0260
        MVI@    R5,     R0                      ; 6CC5   02A8
        MVO@    R0,     R4                      ; 6CC6   0260
        MVI@    R5,     R0                      ; 6CC7   02A8
        MVO@    R0,     R4                      ; 6CC8   0260
        MVI@    R5,     R0                      ; 6CC9   02A8
        MVO@    R0,     R4                      ; 6CCA   0260
        MVI@    R5,     R0                      ; 6CCB   02A8
        MVO@    R0,     R4                      ; 6CCC   0260
        NEGR    R2                              ; 6CCD   0022
        TSTR    R2                              ; 6CCE   0092
        BMI     L_6CB9                          ; 6CCF   022B 0017

        SUBI    #$0014, R5                      ; 6CD1   033D 0014
        MVII    #$0200, R4                      ; 6CD3   02BC 0200
        SUBR    R1,     R4                      ; 6CD5   010C
        TSTR    R3                              ; 6CD6   009B
        BPL     L_6CDB                          ; 6CD7   0203 0002

        ADDI    #$00DC, R4                      ; 6CD9   02FC 00DC
L_6CDB:
        MVI@    R4,     R0                      ; 6CDB   02A0
        MVO@    R0,     R5                      ; 6CDC   0268
        MVI@    R4,     R0                      ; 6CDD   02A0
        MVO@    R0,     R5                      ; 6CDE   0268
        MVI@    R4,     R0                      ; 6CDF   02A0
        MVO@    R0,     R5                      ; 6CE0   0268
        MVI@    R4,     R0                      ; 6CE1   02A0
        MVO@    R0,     R5                      ; 6CE2   0268
        MVI@    R4,     R0                      ; 6CE3   02A0
        MVO@    R0,     R5                      ; 6CE4   0268
        MVI@    R4,     R0                      ; 6CE5   02A0
        MVO@    R0,     R5                      ; 6CE6   0268
        MVI@    R4,     R0                      ; 6CE7   02A0
        MVO@    R0,     R5                      ; 6CE8   0268
        MVI@    R4,     R0                      ; 6CE9   02A0
        MVO@    R0,     R5                      ; 6CEA   0268
        MVI@    R4,     R0                      ; 6CEB   02A0
        MVO@    R0,     R5                      ; 6CEC   0268
        MVI@    R4,     R0                      ; 6CED   02A0
        MVO@    R0,     R5                      ; 6CEE   0268
        NEGR    R2                              ; 6CEF   0022
        TSTR    R2                              ; 6CF0   0092
        BMI     L_6CDB                          ; 6CF1   022B 0017

        NEGR    R3                              ; 6CF3   0023
        CMPI    #$02EF, R5                      ; 6CF4   037D 02EF
        BLT     L_6CB0                          ; 6CF6   0225 0047

        MVII    #$0003, R2                      ; 6CF8   02BA 0003
        PULR    R7                              ; 6CFA   02B7
L_6CFB:
        MVII    #$0214, R4                      ; 6CFB   02BC 0214
        INCR    R7                              ; 6CFD   000F
        PSHR    R5                              ; 6CFE   0275
        MVII    #$0200, R5                      ; 6CFF   02BD 0200
L_6D01:
        MVI@    R4,     R0                      ; 6D01   02A0
        MVO@    R0,     R5                      ; 6D02   0268
        MVI@    R4,     R0                      ; 6D03   02A0
        MVO@    R0,     R5                      ; 6D04   0268
        MVI@    R4,     R0                      ; 6D05   02A0
        MVO@    R0,     R5                      ; 6D06   0268
        MVI@    R4,     R0                      ; 6D07   02A0
        MVO@    R0,     R5                      ; 6D08   0268
        MVI@    R4,     R0                      ; 6D09   02A0
        MVO@    R0,     R5                      ; 6D0A   0268
        MVI@    R4,     R0                      ; 6D0B   02A0
        MVO@    R0,     R5                      ; 6D0C   0268
        CMPI    #$02DC, R5                      ; 6D0D   037D 02DC
        BLT     L_6D01                          ; 6D0F   0225 000F

        MVII    #$0002, R2                      ; 6D11   02BA 0002
L_6D13:
        PULR    R7                              ; 6D13   02B7
L_6D14:
        PSHR    R5                              ; 6D14   0275
        SDBD                                    ; 6D15   0001
        MVII    #$9C13, R4                      ; 6D16   02BC 0013 009C
        MVII    #$00DC, R2                      ; 6D19   02BA 00DC
        MVI     G_011D, R1                      ; 6D1B   0281 011D
        SLL     R1,     1                       ; 6D1D   0049
        SDBD                                    ; 6D1E   0001
        MVII    #$910B, R5                      ; 6D1F   02BD 000B 0091
        ADDR    R1,     R5                      ; 6D22   00CD
        SDBD                                    ; 6D23   0001
        MVI@    R5,     R4                      ; 6D24   02AC
        MVII    #$0200, R5                      ; 6D25   02BD 0200
        MVII    #$0013, R1                      ; 6D27   02B9 0013
        MVII    #$0346, R3                      ; 6D29   02BB 0346
        TSTR    R0                              ; 6D2B   0080
        BNEQ    L_6D33                          ; 6D2C   020C 0005

        ADDR    R1,     R5                      ; 6D2E   00CD
        ADD     G_0177, R4                      ; 6D2F   02C4 0177
        B       L_6D36                          ; 6D31   0200 0003

L_6D33:
        ADDR    R1,     R4                      ; 6D33   00CC
        SUB     G_0177, R4                      ; 6D34   0304 0177
L_6D36:
        CLRR    R0                              ; 6D36   01C0
        MVO@    R0,     R5                      ; 6D37   0268
        ADDR    R1,     R5                      ; 6D38   00CD
L_6D39:
        PSHR    R0                              ; 6D39   0270
        PSHR    R1                              ; 6D3A   0271
        MVI@    R4,     R0                      ; 6D3B   02A0
        MOVR    R0,     R2                      ; 6D3C   0082
        MOVR    R0,     R1                      ; 6D3D   0081
        ANDI    #$0003, R1                      ; 6D3E   03B9 0003
        ADDI    #$0004, R1                      ; 6D40   02F9 0004
        ADDR    R3,     R1                      ; 6D42   00D9
        MVI@    R1,     R1                      ; 6D43   0289
        ANDI    #$00FC, R0                      ; 6D44   03B8 00FC
        SLL     R0,     1                       ; 6D46   0048
        XORR    R1,     R0                      ; 6D47   01C8
        SWAP    R2,     1                       ; 6D48   0042
        ANDI    #$0003, R2                      ; 6D49   03BA 0003
        ADDR    R3,     R2                      ; 6D4B   00DA
        ANDI    #$00FF, R0                      ; 6D4C   03B8 00FF
L_6D4E:
        ADD@    R2,     R0                      ; 6D4E   02D0
        MVO@    R0,     R5                      ; 6D4F   0268
        PULR    R1                              ; 6D50   02B1
        ADDR    R1,     R4                      ; 6D51   00CC
        ADDR    R1,     R5                      ; 6D52   00CD
        PULR    R0                              ; 6D53   02B0
        INCR    R0                              ; 6D54   0008
        CMPI    #$000B, R0                      ; 6D55   0378 000B
        BLT     L_6D39                          ; 6D57   0225 001F

        PULR    R7                              ; 6D59   02B7
L_6D5A:
        PSHR    R5                              ; 6D5A   0275
        MVI     G_011D, R1                      ; 6D5B   0281 011D
        SLL     R1,     1                       ; 6D5D   0049
        SDBD                                    ; 6D5E   0001
        MVII    #$910B, R5                      ; 6D5F   02BD 000B 0091
        ADDR    R1,     R5                      ; 6D62   00CD
        SDBD                                    ; 6D63   0001
        MVI@    R5,     R4                      ; 6D64   02AC

        JSR     R5,     L_6D74                  ; 6D65   0004 016C 0174
        DECLE   $0000                           ; 6D68   0000

        DECR    R4                              ; 6D69   0014
        ADCR    R0                              ; 6D6A   0028
        RSWD    R4                              ; 6D6B   003C
        RLC     R0,     1                       ; 6D6C   0050
        SLR     R0,     2                       ; 6D6D   0064
        SARC    R0,     1                       ; 6D6E   0078
        MOVR    R1,     R4                      ; 6D6F   008C
        MOVR    R4,     R0                      ; 6D70   00A0
        MOVR    R6,     R4                      ; 6D71   00B4
        ADDR    R1,     R0                      ; 6D72   00C8
        ADDR    R3,     R4                      ; 6D73   00DC
L_6D74:
        MVI     G_0177, R3                      ; 6D74   0283 0177
        ADDR    R3,     R5                      ; 6D76   00DD
        MVI@    R5,     R1                      ; 6D77   02A9
        MVII    #$02DC, R5                      ; 6D78   02BD 02DC
        TSTR    R0                              ; 6D7A   0080
        BEQ     L_6D88                          ; 6D7B   0204 000B

        SUBI    #$00DC, R5                      ; 6D7D   033D 00DC
        ADDI    #$00C8, R4                      ; 6D7F   02FC 00C8
        NEGR    R1                              ; 6D81   0021
        CMPI    #$000B, R3                      ; 6D82   037B 000B
        BEQ     L_6DC5                          ; 6D84   0204 003F
        B       L_6D8D                          ; 6D86   0200 0005

L_6D88:
        SUBI    #$0014, R1                      ; 6D88   0339 0014
        TSTR    R3                              ; 6D8A   009B
        BEQ     L_6DC5                          ; 6D8B   0204 0038

L_6D8D:
        ADDR    R1,     R4                      ; 6D8D   00CC
        CLRR    R0                              ; 6D8E   01C0
        MOVR    R5,     R3                      ; 6D8F   00AB
        SDBD                                    ; 6D90   0001
        MVII    #$6DBE, R5                      ; 6D91   02BD 00BE 006D
L_6D94:
        PSHR    R0                              ; 6D94   0270
        MVI@    R4,     R0                      ; 6D95   02A0
        MOVR    R0,     R2                      ; 6D96   0082
        MOVR    R0,     R1                      ; 6D97   0081
        AND@    R5,     R1                      ; 6D98   03A9
        ADD@    R5,     R1                      ; 6D99   02E9
        MVI@    R1,     R1                      ; 6D9A   0289
        AND@    R5,     R0                      ; 6D9B   03A8
        SLL     R0,     1                       ; 6D9C   0048
        XORR    R1,     R0                      ; 6D9D   01C8
        SWAP    R2,     1                       ; 6D9E   0042
        AND@    R5,     R2                      ; 6D9F   03AA
        ADD@    R5,     R2                      ; 6DA0   02EA
        AND@    R5,     R0                      ; 6DA1   03A8
        ADD@    R2,     R0                      ; 6DA2   02D0
        MVO@    R0,     R3                      ; 6DA3   0258
        INCR    R3                              ; 6DA4   000B
        SUB@    R5,     R5                      ; 6DA5   032D
        MVI@    R4,     R0                      ; 6DA6   02A0
        MOVR    R0,     R2                      ; 6DA7   0082
        MOVR    R0,     R1                      ; 6DA8   0081
        AND@    R5,     R1                      ; 6DA9   03A9
        ADD@    R5,     R1                      ; 6DAA   02E9
        MVI@    R1,     R1                      ; 6DAB   0289
        AND@    R5,     R0                      ; 6DAC   03A8
        SLL     R0,     1                       ; 6DAD   0048
        XORR    R1,     R0                      ; 6DAE   01C8
        SWAP    R2,     1                       ; 6DAF   0042
        AND@    R5,     R2                      ; 6DB0   03AA
        ADD@    R5,     R2                      ; 6DB1   02EA
        AND@    R5,     R0                      ; 6DB2   03A8
        ADD@    R2,     R0                      ; 6DB3   02D0
        MVO@    R0,     R3                      ; 6DB4   0258
        INCR    R3                              ; 6DB5   000B
        SUB@    R5,     R5                      ; 6DB6   032D
        PULR    R0                              ; 6DB7   02B0
        INCR    R0                              ; 6DB8   0008
        CMPI    #$000A, R0                      ; 6DB9   0378 000A
        BLT     L_6D94                          ; 6DBB   0225 0028

        PULR    R7                              ; 6DBD   02B7
        DIS                                     ; 6DBE   0003
        CMP@    R1,     R2                      ; 6DBF   034A
        ADDR    R7,     R4                      ; 6DC0   00FC
        DIS                                     ; 6DC1   0003
        CMP     .PSG0.lft_hand,R6               ; 6DC2   0346 01FF
        SETC                                    ; 6DC4   0007
L_6DC5:
        MVII    #$0014, R0                      ; 6DC5   02B8 0014
        MOVR    R5,     R4                      ; 6DC7   00AC

        JSR     R5,     X_FILL_ZERO             ; 6DC8   0004 0114 0338

        PULR    R7                              ; 6DCB   02B7
L_6DCC:
        CLRR    R0                              ; 6DCC   01C0
        MVO     R0,     G_0155                  ; 6DCD   0240 0155
        MVO     R0,     G_0157                  ; 6DCF   0240 0157

        JSR     R5,     L_67A4                  ; 6DD1   0004 0164 03A4

        CLRR    R0                              ; 6DD4   01C0
        MVO     R0,     .STIC.EDGE              ; 6DD5   0240 0032
        MVO     R0,     .STIC.VIDEN             ; 6DD7   0240 0020
        SDBD                                    ; 6DD9   0001
        MVII    #$9413, R2                      ; 6DDA   02BA 0013 0094
        MVII    #$0008, R0                      ; 6DDD   02B8 0008
        SDBD                                    ; 6DDF   0001
        MVII    #$3998, R4                      ; 6DE0   02BC 0098 0039

        JSR     R5,     L_51B7                  ; 6DE3   0004 0150 01B7

        MVI     G_011D, R0                      ; 6DE6   0280 011D
        SDBD                                    ; 6DE8   0001
        MVII    #$9129, R5                      ; 6DE9   02BD 0029 0091
        ADDR    R0,     R5                      ; 6DEC   00C5
        MVI@    R5,     R1                      ; 6DED   02A9
        SDBD                                    ; 6DEE   0001
        MVII    #$941B, R2                      ; 6DEF   02BA 001B 0094
        MVII    #$0018, R0                      ; 6DF2   02B8 0018
        TSTR    R1                              ; 6DF4   0089
        BEQ     L_6DF8                          ; 6DF5   0204 0001

        ADDR    R0,     R2                      ; 6DF7   00C2

L_6DF8:
        JSR     R5,     L_51B7                  ; 6DF8   0004 0150 01B7

        MVI     G_011D, R0                      ; 6DFB   0280 011D
        MOVR    R0,     R1                      ; 6DFD   0081
        SLL     R1,     1                       ; 6DFE   0049
        ADDR    R0,     R1                      ; 6DFF   00C1
        SDBD                                    ; 6E00   0001
        ADDI    #$90DE, R1                      ; 6E01   02F9 00DE 0090
        MVI@    R1,     R2                      ; 6E04   028A
        SDBD                                    ; 6E05   0001
        ADDI    #$93EB, R2                      ; 6E06   02FA 00EB 0093
        MVII    #$0008, R0                      ; 6E09   02B8 0008

        JSR     R5,     L_51B7                  ; 6E0B   0004 0150 01B7

        CLRR    R0                              ; 6E0E   01C0
        MVII    #$016D, R4                      ; 6E0F   02BC 016D
L_6E11:
        MVII    #$000A, R0                      ; 6E11   02B8 000A
        PSHR    R4                              ; 6E13   0274

        JSR     R5,     X_FILL_ZERO             ; 6E14   0004 0114 0338

        PULR    R4                              ; 6E17   02B4
        ADDI    #$0010, R4                      ; 6E18   02FC 0010
        CMPI    #$01C6, R4                      ; 6E1A   037C 01C6
        BLE     L_6E11                          ; 6E1C   0226 000C

        MVII    #$0170, R4                      ; 6E1E   02BC 0170
        MVI     G_011D, R1                      ; 6E20   0281 011D
        SDBD                                    ; 6E22   0001
L_6E23:
        MVII    #$9016, R5                      ; 6E23   02BD 0016 0090
L_6E26:
        ADDI    #$0005, R5                      ; 6E26   02FD 0005
        DECR    R1                              ; 6E28   0011
        BPL     L_6E26                          ; 6E29   0223 0004

L_6E2B:
        MVI@    R5,     R0                      ; 6E2B   02A8
        PSHR    R5                              ; 6E2C   0275

        JSR     R5,     L_5F64                  ; 6E2D   0004 015C 0364

        PULR    R5                              ; 6E30   02B5
        MVO@    R0,     R4                      ; 6E31   0260
        INCR    R4                              ; 6E32   000C
        SUBI    #$0007, R1                      ; 6E33   0339 0007
        MVO@    R1,     R4                      ; 6E35   0261
        ADDI    #$000D, R4                      ; 6E36   02FC 000D
        CMPI    #$01C4, R4                      ; 6E38   037C 01C4
        BLE     L_6E2B                          ; 6E3A   0226 0010

        MVI     G_0134, R1                      ; 6E3C   0281 0134
        TSTR    R1                              ; 6E3E   0089
        BNEQ    L_6E49                          ; 6E3F   020C 0008

        MVII    #$00B0, R0                      ; 6E41   02B8 00B0
        SUBI    #$0010, R4                      ; 6E43   033C 0010
        MVO@    R0,     R4                      ; 6E45   0260
        INCR    R4                              ; 6E46   000C
        MVO@    R0,     R4                      ; 6E47   0260
        CLRR    R0                              ; 6E48   01C0
L_6E49:
        CLRR    R0                              ; 6E49   01C0
        MVII    #$0127, R4                      ; 6E4A   02BC 0127
L_6E4C:
        MVO@    R0,     R4                      ; 6E4C   0260
        CMPI    #$012D, R4                      ; 6E4D   037C 012D
        BLT     L_6E4C                          ; 6E4F   0225 0004

        MVI     G_0134, R0                      ; 6E51   0280 0134
        TSTR    R0                              ; 6E53   0080
        BNEQ    L_6E71                          ; 6E54   020C 001B

        SDBD                                    ; 6E56   0001
        MVII    #$9066, R5                      ; 6E57   02BD 0066 0090
        MVI     G_011D, R0                      ; 6E5A   0280 011D
        SUBI    #$0008, R5                      ; 6E5C   033D 0008
L_6E5E:
        ADDI    #$0008, R5                      ; 6E5E   02FD 0008
        DECR    R0                              ; 6E60   0010
        BPL     L_6E5E                          ; 6E61   0223 0004

        JSR     R5,     L_6B38                  ; 6E63   0004 0168 0338

        CLRR    R1                              ; 6E66   01C9
L_6E67:
        PSHR    R1                              ; 6E67   0271

        JSR     R5,     L_6AC4                  ; 6E68   0004 0168 02C4

        PULR    R1                              ; 6E6B   02B1
        INCR    R1                              ; 6E6C   0009
        CMPI    #$0008, R1                      ; 6E6D   0379 0008
        BLT     L_6E67                          ; 6E6F   0225 0009

L_6E71:
        MVII    #$0200, R4                      ; 6E71   02BC 0200
        CLRR    R1                              ; 6E73   01C9
        MVII    #$0014, R0                      ; 6E74   02B8 0014

        JSR     R5,     X_FILL_MEM              ; 6E76   0004 0114 0341
        JSR     R5,     L_5E02                  ; 6E79   0004 015C 0202

        SDBD                                    ; 6E7C   0001
        MVII    #$9000, R3                      ; 6E7D   02BB 0000 0090
        ADD     G_011D, R3                      ; 6E80   02C3 011D
        MVI@    R3,     R4                      ; 6E82   029C
        TSTR    R4                              ; 6E83   00A4
        BEQ     L_6E90                          ; 6E84   0204 000A

        MVI     G_034D, R0                      ; 6E86   0280 034D
        SDBD                                    ; 6E88   0001
        XORI    #$2EE0, R0                      ; 6E89   03F8 00E0 002E
        MVO@    R0,     R4                      ; 6E8C   0260
        ADDI    #$0008, R0                      ; 6E8D   02F8 0008
        MVO@    R0,     R4                      ; 6E8F   0260

L_6E90:
        JSR     R5,     L_6AAC                  ; 6E90   0004 0168 02AC
        JSR     R5,     L_5DE2                  ; 6E93   0004 015C 01E2
        JSR     R5,     L_5DF2                  ; 6E96   0004 015C 01F2
        JSR     R5,     L_5F51                  ; 6E99   0004 015C 0351

        MVII    #$000D, R1                      ; 6E9C   02B9 000D
        MVO     R1,     G_0114                  ; 6E9E   0241 0114
        MVII    #$0060, R1                      ; 6EA0   02B9 0060
        MVO     R1,     G_0112                  ; 6EA2   0241 0112
        MVI     G_012D, R0                      ; 6EA4   0280 012D
        ANDI    #$0080, R0                      ; 6EA6   03B8 0080
        BNEQ    L_6C6F                          ; 6EA8   022C 023A

        JSR     R5,     G_AC27                  ; 6EAA   0004 01AC 0027

        DIS                                     ; 6EAD   0003
        PULR    R7                              ; 6EAE   02B7
        SUB@    R4,     R6                      ; 6EAF   0326
        BGT     L_6EB2                          ; 6EB0   020E 0000

L_6EB2:
        DECR    R2                              ; 6EB2   0012
        SUB@    R4,     R6                      ; 6EB3   0326
        SUB@    R4,     R6                      ; 6EB4   0326
        SUB@    R4,     R6                      ; 6EB5   0326
        BGT     L_6EB8                          ; 6EB6   020E 0000

L_6EB8:
        DECR    R2                              ; 6EB8   0012
        SUB@    R4,     R6                      ; 6EB9   0326
        SUB@    R4,     R6                      ; 6EBA   0326
        SUB@    R4,     R6                      ; 6EBB   0326
        BGT     L_6EBE                          ; 6EBC   020E 0000

L_6EBE:
        DECR    R2                              ; 6EBE   0012
        SUBR    R4,     R6                      ; 6EBF   0126
        SUBR    R4,     R6                      ; 6EC0   0126
        SUBR    R4,     R6                      ; 6EC1   0126
        BGT     G_70D2                          ; 6EC2   020E 020E

        DECLE   $0210                           ; 6EC4   0210

        DECR    R2                              ; 6EC5   0012
        BGT     G_71C8                          ; 6EC6   020E 0300

        SUB     G_0336, R0                      ; 6EC8   0300 0336
        DECLE   $0210                           ; 6ECA   0210

        DECR    R2                              ; 6ECB   0012
        BGT     G_71CE                          ; 6ECC   020E 0300

        SUB     G_0336, R0                      ; 6ECE   0300 0336
        DECLE   $0210                           ; 6ED0   0210

        DECR    R2                              ; 6ED1   0012
        BGT     G_71D4                          ; 6ED2   020E 0300

        SUB     G_0336, R0                      ; 6ED4   0300 0336
        DECLE   $0210                           ; 6ED6   0210

        SUB@    R4,     R6                      ; 6ED7   0326
        SUB@    R4,     R6                      ; 6ED8   0326
        BGT     G_70EB                          ; 6ED9   020E 0210

        DECR    R2                              ; 6EDB   0012
        NEGR    R6                              ; 6EDC   0026
        SUB@    R4,     R6                      ; 6EDD   0326
        SUB@    R4,     R6                      ; 6EDE   0326
        BGT     G_70F1                          ; 6EDF   020E 0210

        DECR    R2                              ; 6EE1   0012
        SUB@    R4,     R6                      ; 6EE2   0326
        SUB@    R4,     R6                      ; 6EE3   0326
        SUB@    R4,     R6                      ; 6EE4   0326
        BGT     G_70F7                          ; 6EE5   020E 0210

        DECR    R2                              ; 6EE7   0012
        SUB@    R4,     R6                      ; 6EE8   0326
        SUB@    R4,     R6                      ; 6EE9   0326
        SUB@    R4,     R6                      ; 6EEA   0326
        SUB     G_0300, R0                      ; 6EEB   0300 0300
        DECLE   $0210,  $0000                   ; 6EED   0210 0000

        SUB     G_0336, R0                      ; 6EEF   0300 0336
        SUB     G_0300, R0                      ; 6EF1   0300 0300
        DECLE   $0210,  $0000                   ; 6EF3   0210 0000

        SUB     G_0300, R0                      ; 6EF5   0300 0300
        SUB     G_0336, R0                      ; 6EF7   0300 0336
        DECLE   $0210,  $0000                   ; 6EF9   0210 0000

        SUB     G_0336, R0                      ; 6EFB   0300 0336
        SUB     G_0300, R0                      ; 6EFD   0300 0300
        SUBR    R0,     R2                      ; 6EFF   0102
        BGT     L_6F02                          ; 6F00   020E 0000

L_6F02:
        DECLE   $0000                           ; 6F02   0000

        DECR    R2                              ; 6F03   0012
        SUB@    R4,     R6                      ; 6F04   0326
        SUB@    R4,     R6                      ; 6F05   0326
        SUB@    R4,     R6                      ; 6F06   0326
        SUB@    R4,     R6                      ; 6F07   0326
        SUB@    R4,     R6                      ; 6F08   0326
        SUB@    R4,     R6                      ; 6F09   0326
        SUB@    R4,     R6                      ; 6F0A   0326
L_6F0B:
        SUB@    R4,     R6                      ; 6F0B   0326
        BGT     L_6F0E                          ; 6F0C   020E 0000

L_6F0E:
        DECLE   $0000                           ; 6F0E   0000

        DECR    R2                              ; 6F0F   0012
        SUB@    R4,     R6                      ; 6F10   0326
        SUB@    R4,     R6                      ; 6F11   0326
        SUB@    R4,     R6                      ; 6F12   0326
        SUB     .BTAB.10,R0                     ; 6F13   0300 0210
        DECLE   $0000,  $0000                   ; 6F15   0000 0000

        SUB     G_0300, R0                      ; 6F17   0300 0300
        SUB@    R6,     R6                      ; 6F19   0336
        SUB     G_0300, R0                      ; 6F1A   0300 0300
        SUB     G_0300, R0                      ; 6F1C   0300 0300
        SUB@    R6,     R6                      ; 6F1E   0336
        SUB     .BTAB.10,R0                     ; 6F1F   0300 0210
        DECLE   $0000,  $0000                   ; 6F21   0000 0000

        SUB     G_0300, R0                      ; 6F23   0300 0300
        SUB@    R6,     R6                      ; 6F25   0336
        SUB     .BTAB.0E,R0                     ; 6F26   0300 020E
        DECLE   $0000                           ; 6F28   0000
L_6F29:
        DECR    R2                              ; 6F29   0012
        SUB@    R4,     R6                      ; 6F2A   0326
        SUB@    R4,     R6                      ; 6F2B   0326
        SUB@    R4,     R6                      ; 6F2C   0326
        BGT     L_6F2F                          ; 6F2D   020E 0000

L_6F2F:
        DECR    R2                              ; 6F2F   0012
        SUB@    R4,     R6                      ; 6F30   0326
        SUB@    R4,     R6                      ; 6F31   0326
        SUB@    R4,     R6                      ; 6F32   0326
        BGT     L_6F35                          ; 6F33   020E 0000

L_6F35:
        DECR    R2                              ; 6F35   0012
        SUB@    R4,     R6                      ; 6F36   0326
        SUB@    R4,     R6                      ; 6F37   0326
        SUB@    R4,     R6                      ; 6F38   0326
        BGT     L_6F3B                          ; 6F39   020E 0000

L_6F3B:
        DECLE   $0210                           ; 6F3B   0210

        DECR    R2                              ; 6F3C   0012
        BGT     G_723F                          ; 6F3D   020E 0300

        SUB     G_0336, R0                      ; 6F3F   0300 0336
        DECLE   $0210                           ; 6F41   0210

        DECR    R2                              ; 6F42   0012
        BGT     G_7245                          ; 6F43   020E 0300

        SUB     G_0336, R0                      ; 6F45   0300 0336
        DECLE   $0210                           ; 6F47   0210

        DECR    R2                              ; 6F48   0012
        BGT     G_724B                          ; 6F49   020E 0300

        SUB     G_0336, R0                      ; 6F4B   0300 0336
        DECLE   $0210,  $0000                   ; 6F4D   0210 0000

        SUBR    R4,     R6                      ; 6F4F   0126
        BGT     G_7162                          ; 6F50   020E 0210

        DECR    R2                              ; 6F52   0012
        SUBR    R4,     R6                      ; 6F53   0126
        SUBR    R4,     R6                      ; 6F54   0126
        SUBR    R4,     R6                      ; 6F55   0126
        BGT     G_7168                          ; 6F56   020E 0210

        DECR    R2                              ; 6F58   0012
        SUBR    R4,     R6                      ; 6F59   0126
        SUBR    R4,     R6                      ; 6F5A   0126
        SUBR    R4,     R6                      ; 6F5B   0126
        BGT     G_716E                          ; 6F5C   020E 0210

        DECR    R2                              ; 6F5E   0012
        SUBR    R4,     R6                      ; 6F5F   0126
        SUBR    R4,     R6                      ; 6F60   0126
        SUBR    R4,     R6                      ; 6F61   0126
        SUBR    R4,     R6                      ; 6F62   0126
        SUB     .BTAB.10,R0                     ; 6F63   0300 0210
        DECLE   $0000                           ; 6F65   0000

        SUB     G_0300, R0                      ; 6F66   0300 0300
        SUB     G_0300, R0                      ; 6F68   0300 0300
        DECLE   $0210,  $0000                   ; 6F6A   0210 0000

        SUB     G_0300, R0                      ; 6F6C   0300 0300
        SUB     G_0300, R0                      ; 6F6E   0300 0300
        DECLE   $0210,  $0000                   ; 6F70   0210 0000

        SUB     G_0300, R0                      ; 6F72   0300 0300
        SUB     G_0300, R0                      ; 6F74   0300 0300
        SUB     .STIC.X.0,R0                    ; 6F76   0300 0000
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
        DECLE   $0000,  $0000                   ; 6FA0   0000 0000
L_6FA2:
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
        DECLE   $0000,  $0000,  $0000           ; 6FDE   0000 0000 0000
L_6FE1:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6FFD   0000 0000 0000

        ORG     $D000
        DECLE   $027B                           ; D000   027B

        MVI@    R3,     R0                      ; D001   0298
        MVO@    R2,     R1                      ; D002   024A
        DECLE   $0000                           ; D003   0000

        MVI@    R5,     R5                      ; D004   02AD
        MVO@    R2,     R1                      ; D005   024A
        DECLE   $027F,  $027E                   ; D006   027F 027E

        MVI@    R5,     R2                      ; D008   02AA
        MVI@    R2,     R7                      ; D009   0297
        ADD@    R2,     R0                      ; D00A   02D0
        ADD@    R3,     R5                      ; D00B   02DD
        ADD@    R3,     R5                      ; D00C   02DD
        ADD@    R1,     R4                      ; D00D   02CC
        MVI     .STIC.MODE,R6                   ; D00E   0286 0021
        INCR    R1                              ; D010   0009
        GSWD    R2                              ; D011   0032
        COMR    R1                              ; D012   0019
        SWAP    R3,     2                       ; D013   0047
        COMR    R1                              ; D014   0019
        RLC     R1,     1                       ; D015   0051
        INCR    R1                              ; D016   0009
        SLR     R2,     1                       ; D017   0062
        COMR    R1                              ; D018   0019
        RRC     R3,     2                       ; D019   0077
        COMR    R1                              ; D01A   0019
        DECR    R6                              ; D01B   0016
        NEGR    R6                              ; D01C   0026
        ADDR    R1,     R2                      ; D01D   00CA
        ADDR    R0,     R7                      ; D01E   00C7
        MOVR    R4,     R5                      ; D01F   00A5
        DECR    R6                              ; D020   0016
        NEGR    R6                              ; D021   0026
        ADDR    R1,     R2                      ; D022   00CA
        ADDR    R0,     R6                      ; D023   00C6
        ADDR    R0,     R0                      ; D024   00C0
        ADCR    R2                              ; D025   002A
        NEGR    R6                              ; D026   0026
        ADDR    R1,     R2                      ; D027   00CA
        ADDR    R0,     R6                      ; D028   00C6
        MOVR    R0,     R7                      ; D029   0087
        DECR    R6                              ; D02A   0016
        NEGR    R6                              ; D02B   0026
        MOVR    R4,     R2                      ; D02C   00A2
        ADDR    R3,     R2                      ; D02D   00DA
        MOVR    R1,     R3                      ; D02E   008B
        ADCR    R2                              ; D02F   002A
        SARC    R3,     1                       ; D030   007B
        MOVR    R0,     R5                      ; D031   0085
        MOVR    R0,     R6                      ; D032   0086
        ADDR    R0,     R5                      ; D033   00C5
        COMR    R2                              ; D034   001A
        NEGR    R6                              ; D035   0026
        SARC    R0,     2                       ; D036   007C
        MOVR    R3,     R5                      ; D037   009D
        ADDR    R2,     R5                      ; D038   00D5
        DECR    R6                              ; D039   0016
        NEGR    R6                              ; D03A   0026
        SLR     R2,     2                       ; D03B   0066
        TSTR    R6                              ; D03C   00B6
        MOVR    R6,     R2                      ; D03D   00B2
        DECR    R6                              ; D03E   0016
        NEGR    R6                              ; D03F   0026
        SLR     R2,     2                       ; D040   0066
        TSTR    R6                              ; D041   00B6
        ADDR    R0,     R6                      ; D042   00C6
        DECR    R6                              ; D043   0016
        NEGR    R6                              ; D044   0026
        SLR     R2,     2                       ; D045   0066
        TSTR    R6                              ; D046   00B6
        ADDR    R0,     R6                      ; D047   00C6
        RSWD    R7                              ; D048   003F
        NEGR    R7                              ; D049   0027
        MOVR    R0,     R4                      ; D04A   0084
        TSTR    R6                              ; D04B   00B6
        ADDR    R0,     R7                      ; D04C   00C7
        NEGR    R5                              ; D04D   0025
        MOVR    R7,     R5                      ; D04E   00BD
        TSTR    R6                              ; D04F   00B6
        RSWD    R5                              ; D050   003D
        RRC     R2,     2                       ; D051   0076
        SARC    R2,     1                       ; D052   007A
        MOVR    R4,     R5                      ; D053   00A5
        MOVR    R2,     R4                      ; D054   0094
        MOVR    R3,     R4                      ; D055   009C
        RRC     R0,     2                       ; D056   0074
        ADCR    R4                              ; D057   002C
        SARC    R2,     1                       ; D058   007A
        ADDR    R2,     R5                      ; D059   00D5
        MOVR    R3,     R1                      ; D05A   0099
        SLL     R1,     2                       ; D05B   004D
        NEGR    R6                              ; D05C   0026
        RSWD    R5                              ; D05D   003D
        MOVR    R7,     R0                      ; D05E   00B8
        ADDR    R0,     R4                      ; D05F   00C4
        MOVR    R2,     R5                      ; D060   0095
        RRC     R1,     2                       ; D061   0075
        TSTR    R7                              ; D062   00BF
        MOVR    R2,     R0                      ; D063   0090
        NEGR    R5                              ; D064   0025
        DECR    R6                              ; D065   0016
        MVO@    R5,     R3                      ; D066   025D
        MVO     R2,     .BTAB.23                ; D067   0242 0223
        ADD@    R2,     R4                      ; D069   02D4
        MVI@    R4,     R4                      ; D06A   02A4
        DECLE   $021A                           ; D06B   021A

        MVO@    R2,     R2                      ; D06C   0252
        ADD     .BTAB.41,R5                     ; D06D   02C5 0241
        ADD     .BTAB.23,R4                     ; D06F   02C4 0223
        MVII    #$0292, R1                      ; D071   02B9 0292
        MVO@    R7,     R5                      ; D073   026F
        ADD@    R2,     R2                      ; D074   02D2
        MVO@    R1,     R4                      ; D075   0261
        PSHR    R0                              ; D076   0270
        BPL     G_CDA4                          ; D077   0223 02D4

        DECLE   $0219,  $027A                   ; D079   0219 027A

        BNOV    G_CE1A                          ; D07B   022A 0262

        MVI@    R3,     R6                      ; D07D   029E
        DECLE   $027C                           ; D07E   027C

        BLE     G_CE0A                          ; D07F   0226 0276

        ADD@    R2,     R0                      ; D081   02D0
        DECLE   $0218                           ; D082   0218

        MVO     R6,     .BTAB.9B                ; D083   0246 029B
        MVO@    R6,     R4                      ; D085   0266
        BLT     G_CE16                          ; D086   0225 0271

        DECLE   $0219                           ; D088   0219

        MVI@    R4,     R7                      ; D089   02A7
        MVO@    R7,     R4                      ; D08A   0267
        MVI     .BTAB.59,R0                     ; D08B   0280 0259
        BNOV    G_CE0F                          ; D08D   022A 027F

        MVO@    R7,     R4                      ; D08F   0267
        BLT     G_CDDA                          ; D090   0225 02B7

        MVI@    R3,     R4                      ; D092   029C
        ADD     .BTAB.29,R6                     ; D093   02C6 0229
        MVI@    R1,     R1                      ; D095   0289
        DECLE   $0216                           ; D096   0216

        BLT     G_CE57                          ; D097   0225 0241

        MVO@    R7,     R4                      ; D099   0267
        ADD     .BTAB.9D,R0                     ; D09A   02C0 029D
        MVI@    R1,     R6                      ; D09C   028E
        MVO@    R5,     R1                      ; D09D   024D
        DECLE   $0219                           ; D09E   0219

        BOV     G_CE60                          ; D09F   0222 0240

        MVO@    R6,     R4                      ; D0A1   0266
        MVI@    R2,     R6                      ; D0A2   0296
        PSHR    R2                              ; D0A3   0272
        MVI@    R3,     R5                      ; D0A4   029D
        MVO@    R3,     R1                      ; D0A5   024B
        DECLE   $0216                           ; D0A6   0216

        BC      G_CE61                          ; D0A7   0221 0247

        MVO@    R0,     R5                      ; D0A9   0268
        MVI@    R2,     R6                      ; D0AA   0296
        PSHR    R6                              ; D0AB   0276
        PULR    R7                              ; D0AC   02B7
        DECLE   $021B,  $0219                   ; D0AD   021B 0219

        BLE     G_CE15                          ; D0AF   0226 029B

        MVI     .BTAB.B5,R4                     ; D0B1   0284 02B5
        MVO@    R7,     R4                      ; D0B3   0267
        MVO@    R5,     R3                      ; D0B4   025D
        MVI@    R5,     R1                      ; D0B5   02A9
        DECLE   $0218                           ; D0B6   0218

        BLE     G_CE75                          ; D0B7   0226 0243

        MVO@    R4,     R5                      ; D0B9   026C
        PSHR    R6                              ; D0BA   0276
        PSHR    R0                              ; D0BB   0270
        MVII    #$0247, R6                      ; D0BC   02BE 0247
        MVI@    R2,     R4                      ; D0BE   0294
        DECLE   $0218                           ; D0BF   0218

        B       G_CE9D                          ; D0C0   0220 0224

        MVO@    R7,     R3                      ; D0C2   025F
        MVO@    R3,     R2                      ; D0C3   0253
        MVO@    R7,     R2                      ; D0C4   0257
        MVO@    R3,     R3                      ; D0C5   025B
        DECLE   $0216                           ; D0C6   0216

        MVI@    R5,     R2                      ; D0C7   02AA
        MVO     R0,     .BTAB.32                ; D0C8   0240 0232
        MVO@    R1,     R4                      ; D0CA   0261
        BOV     G_CE38                          ; D0CB   0222 0294

        MVI     .BTAB.19,R6                     ; D0CD   0286 0219
        BLT     G_CE8E                          ; D0CF   0225 0242

        MVO@    R0,     R1                      ; D0D1   0248
        MVI@    R2,     R0                      ; D0D2   0290
        MVI@    R3,     R4                      ; D0D3   029C
        MVI@    R2,     R6                      ; D0D4   0296
        MVO@    R4,     R5                      ; D0D5   026C
        DECLE   $0216,  $021A                   ; D0D6   0216 021A

        BOV     G_CEB3                          ; D0D8   0222 0226

L_D0DA:
        MVI@    R3,     R2                      ; D0DA   029A
        MVI@    R2,     R2                      ; D0DB   0292
        DECLE   $023F                           ; D0DC   023F

        MVO@    R2,     R1                      ; D0DD   024A
        DECLE   $0000                           ; D0DE   0000

        SLR     R0,     1                       ; D0DF   0060
        BOV     L_D0C9                          ; D0E0   0222 0018

        MVO@    R0,     R4                      ; D0E2   0260
        DECLE   $0279                           ; D0E3   0279

        DECR    R0                              ; D0E4   0010
        MVO@    R0,     R4                      ; D0E5   0260
        PSHR    R2                              ; D0E6   0272
        NEGR    R0                              ; D0E7   0020
L_D0E8:
        MVO@    R0,     R4                      ; D0E8   0260
        BESC    L_D0DA                          ; D0E9   022F 0010

        MVO@    R0,     R4                      ; D0EB   0260
        DECLE   $021F                           ; D0EC   021F

        INCR    R0                              ; D0ED   0008
        SLR     R0,     1                       ; D0EE   0060
        BNEQ    L_D0E8                          ; D0EF   022C 0008

        MVO@    R0,     R4                      ; D0F1   0260
L_D0F2:
        MVO@    R0,     R1                      ; D0F2   0248
        COMR    R0                              ; D0F3   0018
        MVO@    R0,     R4                      ; D0F4   0260
        PSHR    R6                              ; D0F5   0276
        DECR    R0                              ; D0F6   0010
        MVO@    R0,     R4                      ; D0F7   0260
        ADD     .STIC.A.0,R1                    ; D0F8   02C1 0010
        MVO@    R0,     R4                      ; D0FA   0260
        ADD@    R2,     R4                      ; D0FB   02D4
        DECR    R0                              ; D0FC   0010
        MVO@    R0,     R4                      ; D0FD   0260
        DECLE   $021A                           ; D0FE   021A

        DECR    R0                              ; D0FF   0010
        MVO@    R0,     R4                      ; D100   0260
        BESC    L_D0F2                          ; D101   022F 0010

        MVO@    R0,     R4                      ; D103   0260
        ADD@    R1,     R2                      ; D104   02CA
        DECR    R0                              ; D105   0010
        MVO@    R0,     R4                      ; D106   0260
        MVII    #$0010, R7                      ; D107   02BF 0010
        MVO@    R0,     R4                      ; D109   0260
        DECLE   $021E                           ; D10A   021E

        DECR    R3                              ; D10B   0013
        MOVR    R3,     R4                      ; D10C   009C
        ADDR    R5,     R7                      ; D10D   00EF
        MOVR    R3,     R4                      ; D10E   009C
        ADDR    R1,     R3                      ; D10F   00CB
        MOVR    R3,     R5                      ; D110   009D
        MOVR    R4,     R7                      ; D111   00A7
        MOVR    R3,     R6                      ; D112   009E
        MOVR    R0,     R7                      ; D113   0087
        MOVR    R4,     R5                      ; D114   00A5
        MOVR    R0,     R3                      ; D115   0083
        MOVR    R3,     R7                      ; D116   009F
        SLLC    R3,     2                       ; D117   005F
        MOVR    R4,     R0                      ; D118   00A0
        RSWD    R3                              ; D119   003B
        MOVR    R4,     R1                      ; D11A   00A1
        DECR    R7                              ; D11B   0017
        MOVR    R4,     R2                      ; D11C   00A2
        ADDR    R6,     R3                      ; D11D   00F3
        MOVR    R4,     R2                      ; D11E   00A2
        RSWD    R7                              ; D11F   003F
        MOVR    R4,     R7                      ; D120   00A7
        ADDR    R1,     R7                      ; D121   00CF
        MOVR    R4,     R3                      ; D122   00A3
        MOVR    R5,     R3                      ; D123   00AB
        TSTR    R4                              ; D124   00A4
        MOVR    R5,     R7                      ; D125   00AF
        SAR     R2,     2                       ; D126   006E
        SLR     R3,     1                       ; D127   0063
L_D128:
        MOVR    R4,     R6                      ; D128   00A6
        DECLE   $0000,  $0001,  $0001,  $0000   ; D129   0000 0001 0001 0000
        DECLE   $0001,  $0000,  $0000,  $0001   ; D12D   0001 0000 0000 0001
        DECLE   $0001,  $0000,  $0001,  $0000   ; D131   0001 0000 0001 0000
        DECLE   $0001,  $0000,  $0001           ; D135   0001 0000 0001

        ADDR    R0,     R0                      ; D138   00C0
        SLLC    R0,     2                       ; D139   005C
        ADDR    R0,     R0                      ; D13A   00C0
        SLLC    R0,     2                       ; D13B   005C
        ADDR    R5,     R0                      ; D13C   00E8
        SLLC    R0,     2                       ; D13D   005C
        ADDR    R5,     R0                      ; D13E   00E8
        SLLC    R0,     2                       ; D13F   005C
        MOVR    R3,     R0                      ; D140   0098
        SLLC    R0,     2                       ; D141   005C
        MOVR    R3,     R0                      ; D142   0098
        SLLC    R0,     2                       ; D143   005C
        ADDR    R2,     R4                      ; D144   00D4
        SLLC    R0,     2                       ; D145   005C
        ADDR    R2,     R4                      ; D146   00D4
        SLLC    R0,     2                       ; D147   005C
        ADDR    R7,     R4                      ; D148   00FC
        SLLC    R0,     2                       ; D149   005C
        ADDR    R7,     R4                      ; D14A   00FC
        SLLC    R0,     2                       ; D14B   005C
        MOVR    R5,     R4                      ; D14C   00AC
        SLLC    R0,     2                       ; D14D   005C
        MOVR    R5,     R4                      ; D14E   00AC
        SLLC    R0,     2                       ; D14F   005C
        ADDR    R2,     R4                      ; D150   00D4
        SLLC    R0,     2                       ; D151   005C
        ADDR    R2,     R4                      ; D152   00D4
        SLLC    R0,     2                       ; D153   005C
        ADDR    R7,     R4                      ; D154   00FC
        SLLC    R0,     2                       ; D155   005C
        DIS                                     ; D156   0003
        CLRC                                    ; D157   0006
        DECLE   $0005                           ; D158   0005

        EIS                                     ; D159   0002
        SETC                                    ; D15A   0007
        DIS                                     ; D15B   0003
        CLRC                                    ; D15C   0006
        SETC                                    ; D15D   0007
        EIS                                     ; D15E   0002
        DECLE   $0005                           ; D15F   0005

        CLRC                                    ; D160   0006
        SETC                                    ; D161   0007
        SETC                                    ; D162   0007
        DIS                                     ; D163   0003
        DECLE   $0005                           ; D164   0005

        SLR     R0,     1                       ; D165   0060
        MVO     R0,     .BTAB.20                ; D166   0240 0220
        SWAP    R0,     1                       ; D168   0040
        MVO@    R0,     R4                      ; D169   0260
        SLR     R0,     1                       ; D16A   0060
        MVO     R0,     .BTAB.60                ; D16B   0240 0260
        SWAP    R0,     1                       ; D16D   0040
        B       .ECSCBL.2F                      ; D16E   0220 0240

        MVO@    R0,     R4                      ; D170   0260
        MVO@    R0,     R4                      ; D171   0260
L_D172:
        SLR     R0,     1                       ; D172   0060
        B       L_D172                          ; D173   0220 0002

        EIS                                     ; D175   0002
        EIS                                     ; D176   0002

        JSRD    R4,     .STIC.X.4               ; D177   0004 0002 0004

        EIS                                     ; D17A   0002
        EIS                                     ; D17B   0002
        EIS                                     ; D17C   0002
        EIS                                     ; D17D   0002
        INCR    R0                              ; D17E   0008

        JSR     R4,     G_0408                  ; D17F   0004 0004 0008

        INCR    R0                              ; D182   0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; D183   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D187   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D18B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D18F   0000 0000 0000 0000

        INCR    R7                              ; D193   000F
        INCR    R7                              ; D194   000F
        INCR    R7                              ; D195   000F
        INCR    R7                              ; D196   000F
        INCR    R7                              ; D197   000F
        INCR    R7                              ; D198   000F
        INCR    R7                              ; D199   000F
        INCR    R7                              ; D19A   000F
        ADDR    R6,     R0                      ; D19B   00F0
        ADDR    R6,     R0                      ; D19C   00F0
        ADDR    R6,     R0                      ; D19D   00F0
        ADDR    R6,     R0                      ; D19E   00F0
        ADDR    R6,     R0                      ; D19F   00F0
        ADDR    R6,     R0                      ; D1A0   00F0
        ADDR    R6,     R0                      ; D1A1   00F0
        ADDR    R6,     R0                      ; D1A2   00F0
        ADDR    R7,     R7                      ; D1A3   00FF
        ADDR    R7,     R6                      ; D1A4   00FE
        ADDR    R7,     R4                      ; D1A5   00FC
        ADDR    R7,     R0                      ; D1A6   00F8
        ADDR    R6,     R0                      ; D1A7   00F0
        ADDR    R4,     R0                      ; D1A8   00E0
        ADDR    R0,     R0                      ; D1A9   00C0
        TSTR    R0                              ; D1AA   0080
        DECLE   $0000,  $0001                   ; D1AB   0000 0001

        DIS                                     ; D1AD   0003
        SETC                                    ; D1AE   0007
        INCR    R7                              ; D1AF   000F
        COMR    R7                              ; D1B0   001F
        RSWD    R7                              ; D1B1   003F
        SARC    R3,     2                       ; D1B2   007F
        TSTR    R0                              ; D1B3   0080
        ADDR    R0,     R0                      ; D1B4   00C0
        ADDR    R4,     R0                      ; D1B5   00E0
        ADDR    R6,     R0                      ; D1B6   00F0
        ADDR    R7,     R0                      ; D1B7   00F8
        ADDR    R7,     R4                      ; D1B8   00FC
        ADDR    R7,     R6                      ; D1B9   00FE
        ADDR    R7,     R7                      ; D1BA   00FF
        SARC    R3,     2                       ; D1BB   007F
        RSWD    R7                              ; D1BC   003F
        COMR    R7                              ; D1BD   001F
        INCR    R7                              ; D1BE   000F
        SETC                                    ; D1BF   0007
        DIS                                     ; D1C0   0003
        DECLE   $0001,  $0000                   ; D1C1   0001 0000

        ADDR    R7,     R7                      ; D1C3   00FF
        ADDR    R7,     R7                      ; D1C4   00FF
        ADDR    R7,     R7                      ; D1C5   00FF
        ADDR    R7,     R7                      ; D1C6   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; D1C7   0000 0000 0000 0000

        RLC     R1,     2                       ; D1CB   0055
        DECLE   $0000                           ; D1CC   0000

        RLC     R1,     2                       ; D1CD   0055
        DECLE   $0000,  $0000,  $0000,  $0000   ; D1CE   0000 0000 0000 0000
        DECLE   $0000                           ; D1D2   0000

        ADDR    R7,     R7                      ; D1D3   00FF
        ADDR    R7,     R7                      ; D1D4   00FF
        ADDR    R7,     R7                      ; D1D5   00FF
        ADDR    R7,     R7                      ; D1D6   00FF
        ADDR    R7,     R7                      ; D1D7   00FF
        ADDR    R7,     R7                      ; D1D8   00FF
        ADDR    R7,     R7                      ; D1D9   00FF
        ADDR    R7,     R7                      ; D1DA   00FF
        ADDR    R7,     R7                      ; D1DB   00FF
        ADDR    R7,     R7                      ; D1DC   00FF
        ADDR    R7,     R7                      ; D1DD   00FF
        ADDR    R7,     R7                      ; D1DE   00FF
        SETC                                    ; D1DF   0007
        DIS                                     ; D1E0   0003
        DECLE   $0001,  $0000                   ; D1E1   0001 0000

        ADDR    R7,     R7                      ; D1E3   00FF
        ADDR    R7,     R7                      ; D1E4   00FF
        ADDR    R7,     R7                      ; D1E5   00FF
        ADDR    R7,     R7                      ; D1E6   00FF
        ADDR    R6,     R0                      ; D1E7   00F0
        ADDR    R4,     R0                      ; D1E8   00E0
        ADDR    R0,     R0                      ; D1E9   00C0
        TSTR    R0                              ; D1EA   0080
        ADDR    R7,     R7                      ; D1EB   00FF
        ADDR    R7,     R7                      ; D1EC   00FF
        ADDR    R7,     R7                      ; D1ED   00FF
        ADDR    R7,     R7                      ; D1EE   00FF
        INCR    R7                              ; D1EF   000F
        COMR    R7                              ; D1F0   001F
        RSWD    R7                              ; D1F1   003F
        SARC    R3,     2                       ; D1F2   007F
        MOVR    R0,     R1                      ; D1F3   0081
        ADDR    R7,     R7                      ; D1F4   00FF
        MOVR    R0,     R1                      ; D1F5   0081
        ADDR    R7,     R7                      ; D1F6   00FF
        MOVR    R0,     R1                      ; D1F7   0081
        ADDR    R7,     R7                      ; D1F8   00FF
        MOVR    R0,     R1                      ; D1F9   0081
        ADDR    R7,     R7                      ; D1FA   00FF
        SLR     R2,     2                       ; D1FB   0066
        MOVR    R6,     R3                      ; D1FC   00B3
        ADDR    R3,     R1                      ; D1FD   00D9
        ADDR    R5,     R4                      ; D1FE   00EC
        ADDR    R6,     R6                      ; D1FF   00F6
        ADDR    R7,     R3                      ; D200   00FB
        ADDR    R7,     R5                      ; D201   00FD
        ADDR    R7,     R6                      ; D202   00FE
        SARC    R3,     2                       ; D203   007F
        RSWD    R7                              ; D204   003F
        MOVR    R3,     R7                      ; D205   009F
        ADDR    R1,     R7                      ; D206   00CF
        SLR     R3,     2                       ; D207   0067
        GSWD    R3                              ; D208   0033
        MOVR    R3,     R1                      ; D209   0099
        ADDR    R1,     R4                      ; D20A   00CC
        DECLE   $0000,  $0001,  $0001           ; D20B   0000 0001 0001

        JSRD    R4,     G_0413                  ; D20E   0004 0006 0013

        COMR    R1                              ; D211   0019
        SLL     R0,     2                       ; D212   004C
        SLR     R0,     2                       ; D213   0064
        GSWD    R0                              ; D214   0030
        MOVR    R2,     R0                      ; D215   0090
        ADDR    R0,     R0                      ; D216   00C0
        SWAP    R0,     1                       ; D217   0040
        DECLE   $0000,  $0000,  $0000           ; D218   0000 0000 0000

        SLR     R2,     2                       ; D21B   0066
        GSWD    R3                              ; D21C   0033
        MOVR    R3,     R1                      ; D21D   0099
        ADDR    R1,     R4                      ; D21E   00CC
        SLR     R2,     2                       ; D21F   0066
        GSWD    R3                              ; D220   0033
        MOVR    R3,     R1                      ; D221   0099
        ADDR    R1,     R4                      ; D222   00CC
        SLR     R2,     2                       ; D223   0066
        ADDR    R1,     R4                      ; D224   00CC
        MOVR    R3,     R1                      ; D225   0099
        GSWD    R3                              ; D226   0033
        SLR     R2,     2                       ; D227   0066
        ADDR    R1,     R4                      ; D228   00CC
        MOVR    R3,     R1                      ; D229   0099
        GSWD    R3                              ; D22A   0033
        NEGR    R6                              ; D22B   0026
        INCR    R4                              ; D22C   000C
        INCR    R1                              ; D22D   0009
        DIS                                     ; D22E   0003
        EIS                                     ; D22F   0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; D230   0000 0000 0000 0000

        TSTR    R0                              ; D234   0080
        TSTR    R0                              ; D235   0080
        NEGR    R0                              ; D236   0020
        SLR     R0,     1                       ; D237   0060
        ADDR    R1,     R0                      ; D238   00C8
        MOVR    R3,     R0                      ; D239   0098
        GSWD    R2                              ; D23A   0032
        ADDR    R7,     R6                      ; D23B   00FE
        ADDR    R7,     R4                      ; D23C   00FC
        ADDR    R7,     R1                      ; D23D   00F9
        ADDR    R6,     R3                      ; D23E   00F3
        ADDR    R4,     R6                      ; D23F   00E6
        ADDR    R1,     R4                      ; D240   00CC
        MOVR    R3,     R1                      ; D241   0099
        GSWD    R3                              ; D242   0033
        SLR     R2,     2                       ; D243   0066
        ADDR    R1,     R5                      ; D244   00CD
        TSTR    R3                              ; D245   009B
        DECLE   $0037                           ; D246   0037

        SAR     R3,     2                       ; D247   006F
        ADDR    R3,     R7                      ; D248   00DF
        TSTR    R7                              ; D249   00BF
        SARC    R3,     2                       ; D24A   007F
        SARC    R2,     2                       ; D24B   007E
        SARC    R2,     2                       ; D24C   007E
        SARC    R2,     2                       ; D24D   007E
        SARC    R2,     2                       ; D24E   007E
        SARC    R2,     2                       ; D24F   007E
        SARC    R2,     2                       ; D250   007E
        SARC    R2,     2                       ; D251   007E
        SARC    R2,     2                       ; D252   007E
        ADDR    R7,     R7                      ; D253   00FF
        ADDR    R7,     R7                      ; D254   00FF
        ADDR    R7,     R7                      ; D255   00FF
        ADDR    R7,     R7                      ; D256   00FF
        ADDR    R7,     R7                      ; D257   00FF
        ADDR    R7,     R7                      ; D258   00FF
        ADDR    R7,     R7                      ; D259   00FF
        ADDR    R7,     R6                      ; D25A   00FE
        SARC    R3,     2                       ; D25B   007F
        ADDR    R7,     R7                      ; D25C   00FF
        ADDR    R7,     R7                      ; D25D   00FF
        ADDR    R7,     R7                      ; D25E   00FF
        ADDR    R7,     R7                      ; D25F   00FF
        ADDR    R7,     R7                      ; D260   00FF
        ADDR    R7,     R7                      ; D261   00FF
        ADDR    R7,     R7                      ; D262   00FF
        DECLE   $0000,  $0001                   ; D263   0000 0001

        DIS                                     ; D265   0003
        SETC                                    ; D266   0007
        INCR    R7                              ; D267   000F
        COMR    R7                              ; D268   001F
        RSWD    R7                              ; D269   003F
        SARC    R3,     2                       ; D26A   007F
        ADDR    R7,     R6                      ; D26B   00FE
        ADDR    R7,     R4                      ; D26C   00FC
        ADDR    R7,     R0                      ; D26D   00F8
        ADDR    R6,     R0                      ; D26E   00F0
        ADDR    R4,     R0                      ; D26F   00E0
        ADDR    R0,     R0                      ; D270   00C0
        TSTR    R0                              ; D271   0080
        DECLE   $0000                           ; D272   0000

        ADDR    R7,     R7                      ; D273   00FF
        ADDR    R7,     R7                      ; D274   00FF
        ADDR    R7,     R7                      ; D275   00FF
        ADDR    R7,     R7                      ; D276   00FF
        ADDR    R7,     R7                      ; D277   00FF
        ADDR    R7,     R7                      ; D278   00FF
        ADDR    R7,     R7                      ; D279   00FF
        ADDR    R7,     R7                      ; D27A   00FF
        ADDR    R7,     R7                      ; D27B   00FF
        ADDR    R7,     R7                      ; D27C   00FF
        ADDR    R7,     R7                      ; D27D   00FF
        ADDR    R7,     R7                      ; D27E   00FF
        ADDR    R7,     R7                      ; D27F   00FF
        ADDR    R7,     R7                      ; D280   00FF
        ADDR    R7,     R7                      ; D281   00FF
        SARC    R3,     2                       ; D282   007F
        RSWD    R7                              ; D283   003F
        COMR    R7                              ; D284   001F
        INCR    R7                              ; D285   000F
        SETC                                    ; D286   0007
        DIS                                     ; D287   0003
        DECLE   $0001,  $0000,  $0000,  $0000   ; D288   0001 0000 0000 0000

        TSTR    R0                              ; D28C   0080
        ADDR    R0,     R0                      ; D28D   00C0
        ADDR    R4,     R0                      ; D28E   00E0
        ADDR    R6,     R0                      ; D28F   00F0
        ADDR    R7,     R0                      ; D290   00F8
        ADDR    R7,     R4                      ; D291   00FC
        ADDR    R7,     R6                      ; D292   00FE
        ADDR    R7,     R6                      ; D293   00FE
        ADDR    R7,     R7                      ; D294   00FF
        ADDR    R7,     R7                      ; D295   00FF
        ADDR    R7,     R7                      ; D296   00FF
        ADDR    R7,     R7                      ; D297   00FF
        ADDR    R7,     R7                      ; D298   00FF
        ADDR    R7,     R7                      ; D299   00FF
        ADDR    R7,     R7                      ; D29A   00FF
        ADDR    R7,     R7                      ; D29B   00FF
        ADDR    R7,     R7                      ; D29C   00FF
        ADDR    R7,     R7                      ; D29D   00FF
        ADDR    R7,     R7                      ; D29E   00FF
        ADDR    R7,     R7                      ; D29F   00FF
        ADDR    R7,     R7                      ; D2A0   00FF
        ADDR    R7,     R7                      ; D2A1   00FF
        SARC    R3,     2                       ; D2A2   007F
        ADDR    R7,     R6                      ; D2A3   00FE
        ADDR    R7,     R4                      ; D2A4   00FC
        ADDR    R7,     R0                      ; D2A5   00F8
        ADDR    R6,     R0                      ; D2A6   00F0
        ADDR    R4,     R0                      ; D2A7   00E0
        ADDR    R0,     R0                      ; D2A8   00C0
        TSTR    R0                              ; D2A9   0080
        DECLE   $0000,  $0001                   ; D2AA   0000 0001

        DIS                                     ; D2AC   0003
        SETC                                    ; D2AD   0007
        INCR    R7                              ; D2AE   000F
        COMR    R7                              ; D2AF   001F
        RSWD    R7                              ; D2B0   003F
        SARC    R3,     2                       ; D2B1   007F
        ADDR    R7,     R7                      ; D2B2   00FF
        ADDR    R7,     R6                      ; D2B3   00FE
        ADDR    R7,     R4                      ; D2B4   00FC
        ADDR    R7,     R0                      ; D2B5   00F8
        ADDR    R6,     R0                      ; D2B6   00F0
        ADDR    R4,     R0                      ; D2B7   00E0
        ADDR    R0,     R0                      ; D2B8   00C0
        TSTR    R0                              ; D2B9   0080
        DECLE   $0000,  $0001                   ; D2BA   0000 0001

        DIS                                     ; D2BC   0003
        SETC                                    ; D2BD   0007
        INCR    R7                              ; D2BE   000F
        COMR    R7                              ; D2BF   001F
        RSWD    R7                              ; D2C0   003F
        SARC    R3,     2                       ; D2C1   007F
        ADDR    R7,     R7                      ; D2C2   00FF
        ADDR    R7,     R6                      ; D2C3   00FE
        ADDR    R7,     R4                      ; D2C4   00FC
        ADDR    R7,     R0                      ; D2C5   00F8
        ADDR    R6,     R0                      ; D2C6   00F0
        ADDR    R4,     R0                      ; D2C7   00E0
        ADDR    R0,     R0                      ; D2C8   00C0
        TSTR    R0                              ; D2C9   0080
        DECLE   $0000,  $0001                   ; D2CA   0000 0001

        DIS                                     ; D2CC   0003
        SETC                                    ; D2CD   0007
        INCR    R7                              ; D2CE   000F
        COMR    R7                              ; D2CF   001F
        RSWD    R7                              ; D2D0   003F
        SARC    R3,     2                       ; D2D1   007F
        ADDR    R7,     R7                      ; D2D2   00FF
        ADDR    R7,     R6                      ; D2D3   00FE
        ADDR    R7,     R4                      ; D2D4   00FC
        ADDR    R7,     R0                      ; D2D5   00F8
        ADDR    R6,     R0                      ; D2D6   00F0
        ADDR    R4,     R0                      ; D2D7   00E0
        ADDR    R0,     R0                      ; D2D8   00C0
        TSTR    R0                              ; D2D9   0080
        DECLE   $0000,  $0001                   ; D2DA   0000 0001

        DIS                                     ; D2DC   0003
        SETC                                    ; D2DD   0007
        INCR    R7                              ; D2DE   000F
        COMR    R7                              ; D2DF   001F
        RSWD    R7                              ; D2E0   003F
        SARC    R3,     2                       ; D2E1   007F
        ADDR    R7,     R7                      ; D2E2   00FF
        ADDR    R7,     R6                      ; D2E3   00FE
        ADDR    R7,     R4                      ; D2E4   00FC
        ADDR    R7,     R0                      ; D2E5   00F8
        ADDR    R6,     R0                      ; D2E6   00F0
        ADDR    R4,     R0                      ; D2E7   00E0
        ADDR    R0,     R0                      ; D2E8   00C0
        TSTR    R0                              ; D2E9   0080
        DECLE   $0000,  $0001                   ; D2EA   0000 0001

        DIS                                     ; D2EC   0003
        SETC                                    ; D2ED   0007
        INCR    R7                              ; D2EE   000F
        COMR    R7                              ; D2EF   001F
        RSWD    R7                              ; D2F0   003F
        SARC    R3,     2                       ; D2F1   007F
        ADDR    R7,     R7                      ; D2F2   00FF
        ADDR    R7,     R6                      ; D2F3   00FE
        ADDR    R7,     R4                      ; D2F4   00FC
        ADDR    R7,     R0                      ; D2F5   00F8
        ADDR    R6,     R0                      ; D2F6   00F0
        ADDR    R4,     R0                      ; D2F7   00E0
        ADDR    R0,     R0                      ; D2F8   00C0
        MOVR    R0,     R1                      ; D2F9   0081
        DIS                                     ; D2FA   0003
        DECLE   $0001                           ; D2FB   0001

        DIS                                     ; D2FC   0003
        SETC                                    ; D2FD   0007
        INCR    R7                              ; D2FE   000F
        COMR    R7                              ; D2FF   001F
        RSWD    R7                              ; D300   003F
        ADDR    R7,     R7                      ; D301   00FF
        ADDR    R7,     R7                      ; D302   00FF
        ADDR    R7,     R6                      ; D303   00FE
        ADDR    R7,     R4                      ; D304   00FC
        ADDR    R7,     R0                      ; D305   00F8
        ADDR    R6,     R0                      ; D306   00F0
        ADDR    R4,     R1                      ; D307   00E1
        ADDR    R0,     R3                      ; D308   00C3
        MOVR    R0,     R7                      ; D309   0087
        INCR    R7                              ; D30A   000F
        DECLE   $0001                           ; D30B   0001

        DIS                                     ; D30C   0003
        SETC                                    ; D30D   0007
        INCR    R7                              ; D30E   000F
        ADDR    R7,     R7                      ; D30F   00FF
        ADDR    R7,     R7                      ; D310   00FF
        ADDR    R7,     R7                      ; D311   00FF
        ADDR    R7,     R7                      ; D312   00FF
        ADDR    R7,     R6                      ; D313   00FE
        ADDR    R7,     R4                      ; D314   00FC
        ADDR    R7,     R1                      ; D315   00F9
        ADDR    R6,     R3                      ; D316   00F3
        ADDR    R4,     R7                      ; D317   00E7
        ADDR    R1,     R7                      ; D318   00CF
        MOVR    R3,     R7                      ; D319   009F
        RSWD    R7                              ; D31A   003F
        DECLE   $0001                           ; D31B   0001

        DIS                                     ; D31C   0003
        ADDR    R7,     R7                      ; D31D   00FF
        ADDR    R7,     R7                      ; D31E   00FF
        ADDR    R7,     R7                      ; D31F   00FF
        ADDR    R7,     R7                      ; D320   00FF
        ADDR    R7,     R7                      ; D321   00FF
        ADDR    R7,     R7                      ; D322   00FF
        ADDR    R7,     R7                      ; D323   00FF
        ADDR    R7,     R7                      ; D324   00FF
        ADDR    R7,     R7                      ; D325   00FF
        ADDR    R7,     R7                      ; D326   00FF
        ADDR    R7,     R7                      ; D327   00FF
        ADDR    R7,     R7                      ; D328   00FF
        ADDR    R7,     R7                      ; D329   00FF
        ADDR    R7,     R7                      ; D32A   00FF
        ADDR    R7,     R7                      ; D32B   00FF
        ADDR    R7,     R7                      ; D32C   00FF
        ADDR    R7,     R7                      ; D32D   00FF
        ADDR    R7,     R7                      ; D32E   00FF
        ADDR    R7,     R7                      ; D32F   00FF
        ADDR    R7,     R7                      ; D330   00FF
        ADDR    R7,     R7                      ; D331   00FF
        ADDR    R7,     R7                      ; D332   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; D333   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D337   0000 0000 0000 0000
        DECLE   $0000,  $0001                   ; D33B   0000 0001

        DIS                                     ; D33D   0003
        SETC                                    ; D33E   0007
        INCR    R7                              ; D33F   000F
        COMR    R7                              ; D340   001F
        RSWD    R7                              ; D341   003F
        SARC    R3,     2                       ; D342   007F
        DECLE   $0000,  $0000,  $0000,  $0000   ; D343   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001           ; D347   0000 0000 0001

        DIS                                     ; D34A   0003
        SETC                                    ; D34B   0007
        INCR    R7                              ; D34C   000F
        COMR    R7                              ; D34D   001F
        RSWD    R7                              ; D34E   003F
        SARC    R3,     2                       ; D34F   007F
        ADDR    R7,     R7                      ; D350   00FF
        DECLE   $0000                           ; D351   0000

        ADDR    R7,     R7                      ; D352   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; D353   0000 0000 0000 0000
        DECLE   $0001                           ; D357   0001

        DIS                                     ; D358   0003
        SETC                                    ; D359   0007
        INCR    R7                              ; D35A   000F
        COMR    R7                              ; D35B   001F
        RSWD    R7                              ; D35C   003F
        SARC    R3,     2                       ; D35D   007F
        ADDR    R7,     R7                      ; D35E   00FF
        DECLE   $0000                           ; D35F   0000

        ADDR    R7,     R7                      ; D360   00FF
        RSWD    R7                              ; D361   003F
        SARC    R3,     2                       ; D362   007F
        DECLE   $0000,  $0000,  $0001           ; D363   0000 0000 0001

        DIS                                     ; D366   0003
        SETC                                    ; D367   0007
        INCR    R7                              ; D368   000F
        COMR    R7                              ; D369   001F
        RSWD    R7                              ; D36A   003F
        SARC    R3,     2                       ; D36B   007F
        ADDR    R7,     R7                      ; D36C   00FF
        DECLE   $0000                           ; D36D   0000

        ADDR    R7,     R7                      ; D36E   00FF
        INCR    R7                              ; D36F   000F
        COMR    R7                              ; D370   001F
        RSWD    R7                              ; D371   003F
        SARC    R3,     2                       ; D372   007F
        DECLE   $0001                           ; D373   0001

        DIS                                     ; D374   0003
        SETC                                    ; D375   0007
        INCR    R7                              ; D376   000F
        COMR    R7                              ; D377   001F
        RSWD    R7                              ; D378   003F
        SARC    R3,     2                       ; D379   007F
        ADDR    R7,     R7                      ; D37A   00FF
        DECLE   $0000                           ; D37B   0000

        ADDR    R7,     R7                      ; D37C   00FF
        DIS                                     ; D37D   0003
        SETC                                    ; D37E   0007
        INCR    R7                              ; D37F   000F
        COMR    R7                              ; D380   001F
        RSWD    R7                              ; D381   003F
        SARC    R3,     2                       ; D382   007F
        SETC                                    ; D383   0007
        INCR    R7                              ; D384   000F
        COMR    R7                              ; D385   001F
        RSWD    R7                              ; D386   003F
        SARC    R3,     2                       ; D387   007F
        ADDR    R7,     R7                      ; D388   00FF
        DECLE   $0000                           ; D389   0000

        ADDR    R7,     R7                      ; D38A   00FF
        DECLE   $0000,  $0001                   ; D38B   0000 0001

        DIS                                     ; D38D   0003
        SETC                                    ; D38E   0007
        INCR    R7                              ; D38F   000F
        COMR    R7                              ; D390   001F
        RSWD    R7                              ; D391   003F
        SARC    R3,     2                       ; D392   007F
        COMR    R7                              ; D393   001F
        RSWD    R7                              ; D394   003F
        SARC    R3,     2                       ; D395   007F
        ADDR    R7,     R7                      ; D396   00FF
        DECLE   $0000                           ; D397   0000

        ADDR    R7,     R7                      ; D398   00FF
        DECLE   $0000,  $0000,  $0000,  $0001   ; D399   0000 0000 0000 0001

        DIS                                     ; D39D   0003
        SETC                                    ; D39E   0007
        INCR    R7                              ; D39F   000F
        COMR    R7                              ; D3A0   001F
        RSWD    R7                              ; D3A1   003F
        SARC    R3,     2                       ; D3A2   007F
        SARC    R3,     2                       ; D3A3   007F
        ADDR    R7,     R7                      ; D3A4   00FF
        DECLE   $0000                           ; D3A5   0000

        ADDR    R7,     R7                      ; D3A6   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; D3A7   0000 0000 0000 0000
        DECLE   $0000,  $0001                   ; D3AB   0000 0001

        DIS                                     ; D3AD   0003
        SETC                                    ; D3AE   0007
        INCR    R7                              ; D3AF   000F
        COMR    R7                              ; D3B0   001F
        RSWD    R7                              ; D3B1   003F
        SARC    R3,     2                       ; D3B2   007F
        DECLE   $0000                           ; D3B3   0000

        ADDR    R7,     R7                      ; D3B4   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; D3B5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D3B9   0000 0000 0000 0001

        DIS                                     ; D3BD   0003
        SETC                                    ; D3BE   0007
        INCR    R7                              ; D3BF   000F
        COMR    R7                              ; D3C0   001F
        RSWD    R7                              ; D3C1   003F
        SARC    R3,     2                       ; D3C2   007F
        DECLE   $0000,  $0000                   ; D3C3   0000 0000

        EIS                                     ; D3C5   0002
        CLRC                                    ; D3C6   0006
        INCR    R6                              ; D3C7   000E
        COMR    R6                              ; D3C8   001E
        RSWD    R6                              ; D3C9   003E
        SARC    R2,     2                       ; D3CA   007E
        ADDR    R7,     R7                      ; D3CB   00FF
        ADDR    R0,     R7                      ; D3CC   00C7
        MOVR    R0,     R3                      ; D3CD   0083
        DECLE   $0001,  $0001                   ; D3CE   0001 0001

        MOVR    R0,     R3                      ; D3D0   0083
        ADDR    R0,     R7                      ; D3D1   00C7
        ADDR    R7,     R7                      ; D3D2   00FF
        ADDR    R7,     R7                      ; D3D3   00FF
        ADDR    R4,     R3                      ; D3D4   00E3
        ADDR    R0,     R1                      ; D3D5   00C1
        MOVR    R2,     R0                      ; D3D6   0090
        MOVR    R2,     R0                      ; D3D7   0090
        ADDR    R0,     R1                      ; D3D8   00C1
        ADDR    R4,     R3                      ; D3D9   00E3
        ADDR    R7,     R7                      ; D3DA   00FF
        ADDR    R7,     R7                      ; D3DB   00FF
        ADDR    R4,     R3                      ; D3DC   00E3
        ADDR    R0,     R1                      ; D3DD   00C1
        TSTR    R0                              ; D3DE   0080
        TSTR    R0                              ; D3DF   0080
        ADDR    R0,     R1                      ; D3E0   00C1
        ADDR    R4,     R3                      ; D3E1   00E3
        ADDR    R7,     R7                      ; D3E2   00FF
        ADDR    R7,     R7                      ; D3E3   00FF
        ADDR    R0,     R7                      ; D3E4   00C7
        MOVR    R0,     R3                      ; D3E5   0083
        DECLE   $0005,  $0005                   ; D3E6   0005 0005

        MOVR    R0,     R3                      ; D3E8   0083
        ADDR    R0,     R7                      ; D3E9   00C7
        ADDR    R7,     R7                      ; D3EA   00FF
        ADDR    R7,     R5                      ; D3EB   00FD
        ADDR    R7,     R3                      ; D3EC   00FB
        ADDR    R6,     R7                      ; D3ED   00F7
        MOVR    R0,     R7                      ; D3EE   0087
        MOVR    R0,     R7                      ; D3EF   0087
        MOVR    R0,     R7                      ; D3F0   0087
        MOVR    R0,     R7                      ; D3F1   0087
        MOVR    R0,     R7                      ; D3F2   0087
        ADDR    R7,     R7                      ; D3F3   00FF
        ADDR    R7,     R7                      ; D3F4   00FF
        MOVR    R0,     R1                      ; D3F5   0081
        DECLE   $0000                           ; D3F6   0000

        ADDR    R7,     R7                      ; D3F7   00FF
        DECLE   $0000                           ; D3F8   0000

        MOVR    R0,     R1                      ; D3F9   0081
        ADDR    R7,     R7                      ; D3FA   00FF
        ADDR    R1,     R1                      ; D3FB   00C9
        MOVR    R4,     R0                      ; D3FC   00A0
        ADDR    R3,     R6                      ; D3FD   00DE
        ADDR    R0,     R1                      ; D3FE   00C1
        ADDR    R4,     R3                      ; D3FF   00E3
        ADDR    R6,     R7                      ; D400   00F7
        ADDR    R6,     R7                      ; D401   00F7
        ADDR    R0,     R1                      ; D402   00C1
        ADDR    R5,     R6                      ; D403   00EE
        ADDR    R0,     R5                      ; D404   00C5
        MOVR    R4,     R3                      ; D405   00A3
        ADDR    R7,     R3                      ; D406   00FB
        MOVR    R0,     R7                      ; D407   0087
        MOVR    R0,     R7                      ; D408   0087
        MOVR    R0,     R7                      ; D409   0087
        ADDR    R7,     R7                      ; D40A   00FF
        ADDR    R5,     R7                      ; D40B   00EF
        RLC     R1,     2                       ; D40C   0055
        MOVR    R5,     R2                      ; D40D   00AA
        DECLE   $0001,  $0001,  $0001,  $0001   ; D40E   0001 0001 0001 0001

        MOVR    R0,     R3                      ; D412   0083
        DECLE   $0000,  $0000,  $0000,  $0000   ; D413   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D417   0000 0000 0000

        ADDR    R7,     R7                      ; D41A   00FF
        DECLE   $0000,  $0000,  $0000,  $0001   ; D41B   0000 0000 0000 0001

        INCR    R3                              ; D41F   000B
        DECR    R7                              ; D420   0017
        ADDR    R0,     R0                      ; D421   00C0
        SARC    R3,     2                       ; D422   007F
        DECLE   $0000,  $0000,  $0000           ; D423   0000 0000 0000

        RLC     R1,     1                       ; D426   0051
        MOVR    R5,     R3                      ; D427   00AB
        ADDR    R2,     R7                      ; D428   00D7
        DECLE   $0000                           ; D429   0000

        ADDR    R7,     R7                      ; D42A   00FF
        DECLE   $0000,  $0000,  $0000           ; D42B   0000 0000 0000

        TSTR    R0                              ; D42E   0080
        ADDR    R2,     R0                      ; D42F   00D0
        ADDR    R5,     R0                      ; D430   00E8
        DIS                                     ; D431   0003
        ADDR    R7,     R6                      ; D432   00FE
        DECLE   $0000,  $0000                   ; D433   0000 0000

        CLRC                                    ; D435   0006
        INCR    R7                              ; D436   000F
        RSWD    R3                              ; D437   003B
        COMR    R5                              ; D438   001D
        ADDR    R4,     R0                      ; D439   00E0
        RSWD    R7                              ; D43A   003F
        DECLE   $0000                           ; D43B   0000

        GSWD    R0                              ; D43C   0030
        SARC    R3,     1                       ; D43D   007B
        ADDR    R1,     R7                      ; D43E   00CF
        MOVR    R7,     R3                      ; D43F   00BB
        SARC    R1,     2                       ; D440   007D
        DECLE   $0000                           ; D441   0000

        ADDR    R7,     R7                      ; D442   00FF
        DECLE   $0000,  $0000                   ; D443   0000 0000

        SLR     R0,     1                       ; D445   0060
        ADDR    R6,     R0                      ; D446   00F0
        ADDR    R3,     R4                      ; D447   00DC
        MOVR    R7,     R0                      ; D448   00B8
        SETC                                    ; D449   0007
        ADDR    R7,     R4                      ; D44A   00FC
        SAR     R1,     2                       ; D44B   006D
        ADDR    R7,     R7                      ; D44C   00FF
        ADDR    R0,     R4                      ; D44D   00C4
        SLLC    R1,     2                       ; D44E   005D
        ADDR    R1,     R4                      ; D44F   00CC
        ADDR    R3,     R5                      ; D450   00DD
        SWAP    R1,     2                       ; D451   0045
        ADDR    R3,     R3                      ; D452   00DB
        MOVR    R6,     R7                      ; D453   00B7
        ADDR    R7,     R5                      ; D454   00FD
        SWAP    R3,     2                       ; D455   0047
        SAR     R3,     2                       ; D456   006F
        SAR     R1,     2                       ; D457   006D
        SAR     R3,     2                       ; D458   006F
        SAR     R3,     2                       ; D459   006F
        SAR     R1,     2                       ; D45A   006D
        TSTR    R6                              ; D45B   00B6
        ADDR    R7,     R7                      ; D45C   00FF
        SWAP    R0,     2                       ; D45D   0044
        ADDR    R3,     R5                      ; D45E   00DD
        ADDR    R1,     R4                      ; D45F   00CC
        SLLC    R1,     2                       ; D460   005D
        ADDR    R0,     R5                      ; D461   00C5
        TSTR    R6                              ; D462   00B6
        ADDR    R3,     R3                      ; D463   00DB
        ADDR    R7,     R7                      ; D464   00FF
        SWAP    R1,     2                       ; D465   0045
        SAR     R3,     2                       ; D466   006F
        SAR     R3,     2                       ; D467   006F
        SAR     R1,     2                       ; D468   006D
        SAR     R3,     2                       ; D469   006F
        ADDR    R3,     R3                      ; D46A   00DB
        ADDR    R3,     R3                      ; D46B   00DB
        SARC    R3,     2                       ; D46C   007F
        ADDR    R7,     R7                      ; D46D   00FF
        ADDR    R7,     R7                      ; D46E   00FF
        SARC    R3,     2                       ; D46F   007F
        ADDR    R7,     R7                      ; D470   00FF
        ADDR    R7,     R7                      ; D471   00FF
        SAR     R1,     2                       ; D472   006D
        SAR     R1,     2                       ; D473   006D
        ADDR    R7,     R7                      ; D474   00FF
        ADDR    R7,     R7                      ; D475   00FF
        ADDR    R7,     R5                      ; D476   00FD
        ADDR    R7,     R7                      ; D477   00FF
        ADDR    R7,     R7                      ; D478   00FF
        ADDR    R7,     R5                      ; D479   00FD
        MOVR    R6,     R7                      ; D47A   00B7
        ADDR    R7,     R7                      ; D47B   00FF
        COMR    R0                              ; D47C   0018
        SAR     R2,     1                       ; D47D   006A
        SAR     R2,     1                       ; D47E   006A
        SAR     R0,     1                       ; D47F   0068
        COMR    R2                              ; D480   001A
        SLLC    R3,     2                       ; D481   005F
        SAR     R0,     1                       ; D482   0068
        ADDR    R6,     R7                      ; D483   00F7
        MOVR    R5,     R4                      ; D484   00AC
        MOVR    R5,     R2                      ; D485   00AA
        MOVR    R5,     R3                      ; D486   00AB
        MOVR    R1,     R0                      ; D487   0088
        ADDR    R5,     R6                      ; D488   00EE
        ADDR    R5,     R0                      ; D489   00E8
        INCR    R7                              ; D48A   000F
        ADDR    R7,     R7                      ; D48B   00FF
        ADDR    R7,     R7                      ; D48C   00FF
        ADDR    R7,     R7                      ; D48D   00FF
        ADDR    R7,     R7                      ; D48E   00FF
        ADDR    R7,     R7                      ; D48F   00FF
        ADDR    R7,     R7                      ; D490   00FF
        ADDR    R7,     R7                      ; D491   00FF
        ADDR    R7,     R7                      ; D492   00FF
        ADDR    R7,     R7                      ; D493   00FF
        ADDR    R7,     R7                      ; D494   00FF
        ADDR    R7,     R7                      ; D495   00FF
        ADDR    R7,     R7                      ; D496   00FF
        ADDR    R7,     R7                      ; D497   00FF
        ADDR    R7,     R7                      ; D498   00FF
        ADDR    R7,     R7                      ; D499   00FF
        ADDR    R7,     R7                      ; D49A   00FF
        ADDR    R7,     R7                      ; D49B   00FF
        RSWD    R5                              ; D49C   003D
        RLC     R0,     2                       ; D49D   0054
        RLC     R1,     2                       ; D49E   0055
        RLC     R1,     2                       ; D49F   0055
        RLC     R1,     2                       ; D4A0   0055
        SLLC    R1,     2                       ; D4A1   005D
        RSWD    R5                              ; D4A2   003D
        ADDR    R7,     R7                      ; D4A3   00FF
        ADDR    R7,     R1                      ; D4A4   00F9
        SLL     R2,     1                       ; D4A5   004A
        SLLC    R2,     1                       ; D4A6   005A
        SLL     R1,     1                       ; D4A7   0049
        SLLC    R2,     1                       ; D4A8   005A
        ADDR    R1,     R2                      ; D4A9   00CA
        ADDR    R7,     R3                      ; D4AA   00FB
        ADDR    R7,     R7                      ; D4AB   00FF
        ADDR    R7,     R7                      ; D4AC   00FF
        ADDR    R7,     R7                      ; D4AD   00FF
        ADDR    R7,     R7                      ; D4AE   00FF
        ADDR    R7,     R7                      ; D4AF   00FF
        ADDR    R7,     R7                      ; D4B0   00FF
        ADDR    R7,     R7                      ; D4B1   00FF
        ADDR    R7,     R7                      ; D4B2   00FF
        ADDR    R7,     R7                      ; D4B3   00FF
        ADDR    R7,     R7                      ; D4B4   00FF
        ADDR    R7,     R7                      ; D4B5   00FF
        ADDR    R7,     R7                      ; D4B6   00FF
        ADDR    R7,     R7                      ; D4B7   00FF
        ADDR    R7,     R7                      ; D4B8   00FF
        ADDR    R7,     R7                      ; D4B9   00FF
        ADDR    R7,     R7                      ; D4BA   00FF
        DECLE   $0000                           ; D4BB   0000

        RSWD    R0                              ; D4BC   0038
        SWAP    R0,     2                       ; D4BD   0044
        RLC     R0,     2                       ; D4BE   0054
        SWAP    R0,     2                       ; D4BF   0044
        SLLC    R0,     2                       ; D4C0   005C
        SLLC    R0,     2                       ; D4C1   005C
        SARC    R0,     2                       ; D4C2   007C
        DECLE   $0000,  $0000                   ; D4C3   0000 0000

        ADDR    R3,     R6                      ; D4C5   00DE
        ADDR    R5,     R6                      ; D4C6   00EE
        SARC    R0,     2                       ; D4C7   007C
        SARC    R0,     2                       ; D4C8   007C
        SARC    R0,     2                       ; D4C9   007C
        DECLE   $0000                           ; D4CA   0000

        RSWD    R4                              ; D4CB   003C
        SWAP    R2,     1                       ; D4CC   0042
        MOVR    R3,     R1                      ; D4CD   0099
        MOVR    R4,     R1                      ; D4CE   00A1
        MOVR    R4,     R1                      ; D4CF   00A1
        MOVR    R3,     R1                      ; D4D0   0099
        SWAP    R2,     1                       ; D4D1   0042
        RSWD    R4                              ; D4D2   003C
        RSWD    R0                              ; D4D3   0038
        RSWD    R0                              ; D4D4   0038
        RSWD    R0                              ; D4D5   0038
        RSWD    R1                              ; D4D6   0039
        RSWD    R1                              ; D4D7   0039
        RSWD    R1                              ; D4D8   0039
        RSWD    R1                              ; D4D9   0039
        DECLE   $0000,  $0000                   ; D4DA   0000 0000

        INCR    R5                              ; D4DC   000D
        ADDR    R1,     R4                      ; D4DD   00CC
        ADDR    R5,     R4                      ; D4DE   00EC
        ADDR    R7,     R4                      ; D4DF   00FC
        MOVR    R7,     R4                      ; D4E0   00BC
        MOVR    R3,     R0                      ; D4E1   0098
        DECLE   $0000                           ; D4E2   0000

        ADDR    R0,     R0                      ; D4E3   00C0
        ADDR    R4,     R0                      ; D4E4   00E0
        ADDR    R1,     R4                      ; D4E5   00CC
        ADDR    R1,     R4                      ; D4E6   00CC
        ADDR    R0,     R6                      ; D4E7   00C6
        ADDR    R0,     R6                      ; D4E8   00C6
        RRC     R3,     1                       ; D4E9   0073
        DECLE   $0000                           ; D4EA   0000

        NEGR    R0                              ; D4EB   0020
        NEGR    R0                              ; D4EC   0020
        SWAP    R0,     1                       ; D4ED   0040
        SWAP    R0,     1                       ; D4EE   0040
        TSTR    R0                              ; D4EF   0080
        TSTR    R0                              ; D4F0   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4F1   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D4F5   0000 0000

        MOVR    R7,     R5                      ; D4F7   00BD
        COMR    R0                              ; D4F8   0018
        RSWD    R4                              ; D4F9   003C
        NEGR    R4                              ; D4FA   0024
        COMR    R0                              ; D4FB   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4FC   0000 0000 0000 0000

        NOP                                     ; D500   0034
        NOP                                     ; D501   0034
        DECLE   $0000                           ; D502   0000

        SLLC    R2,     2                       ; D503   005E
        SARC    R2,     2                       ; D504   007E
        RSWD    R4                              ; D505   003C
        RSWD    R4                              ; D506   003C
        RSWD    R4                              ; D507   003C
        MOVR    R3,     R1                      ; D508   0099
        MOVR    R7,     R5                      ; D509   00BD
        ADDR    R3,     R3                      ; D50A   00DB
        ADDR    R4,     R7                      ; D50B   00E7
        RSWD    R4                              ; D50C   003C
        SARC    R2,     2                       ; D50D   007E
        SARC    R2,     2                       ; D50E   007E
        SARC    R2,     2                       ; D50F   007E
        DECLE   $0000,  $0000,  $0036,  $0000   ; D510   0000 0000 0036 0000
        DECLE   $0000,  $0000,  $0000           ; D514   0000 0000 0000

        RSWD    R4                              ; D517   003C
        COMR    R4                              ; D518   001C
        RSWD    R4                              ; D519   003C
        DECLE   $0000,  $0000,  $0000,  $0001   ; D51A   0000 0000 0000 0001
        DECLE   $0000,  $0000                   ; D51E   0000 0000

        COMR    R4                              ; D520   001C
        ADCR    R4                              ; D521   002C

        JSR     R4,     .STIC.X.0               ; D522   0004 0000 0000
        DECLE   $0000,  $0000                   ; D525   0000 0000

        RSWD    R4                              ; D527   003C
        COMR    R4                              ; D528   001C
        RSWD    R4                              ; D529   003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; D52A   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D52E   0000 0000

        ADCR    R4                              ; D530   002C
        NOP                                     ; D531   0034
        DECLE   $0000,  $0000,  $0000,  $0000   ; D532   0000 0000 0000 0000
        DECLE   $0000                           ; D536   0000

        RSWD    R4                              ; D537   003C
        COMR    R4                              ; D538   001C
        RSWD    R4                              ; D539   003C
        DECLE   $0000,  $0000,  $0000,  $0001   ; D53A   0000 0000 0000 0001
        DECLE   $0000,  $0000                   ; D53E   0000 0000

        ADCR    R4                              ; D540   002C
        GSWD    R0                              ; D541   0030
        DECLE   $0000,  $0000,  $0000,  $0000   ; D542   0000 0000 0000 0000
        DECLE   $0000                           ; D546   0000

        RSWD    R4                              ; D547   003C
        COMR    R4                              ; D548   001C
        RSWD    R4                              ; D549   003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; D54A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0036           ; D54E   0000 0000 0036

        GSWD    R2                              ; D551   0032
        DECLE   $0000                           ; D552   0000

        SAR     R2,     2                       ; D553   006E
        RRC     R2,     2                       ; D554   0076
        RSWD    R4                              ; D555   003C
        RSWD    R4                              ; D556   003C
        RSWD    R4                              ; D557   003C
        COMR    R4                              ; D558   001C
        RSWD    R4                              ; D559   003C
        RSWD    R4                              ; D55A   003C
        SLR     R0,     2                       ; D55B   0064
        SLL     R2,     2                       ; D55C   004E
        SLLC    R2,     2                       ; D55D   005E
        MOVR    R7,     R6                      ; D55E   00BE
        ADDR    R7,     R6                      ; D55F   00FE
        DECLE   $0000                           ; D560   0000

        SLR     R0,     1                       ; D561   0060
        INCR    R4                              ; D562   000C
        SAR     R2,     2                       ; D563   006E
        RRC     R2,     2                       ; D564   0076
        RSWD    R4                              ; D565   003C
        RSWD    R4                              ; D566   003C
        RSWD    R4                              ; D567   003C
        COMR    R4                              ; D568   001C
        RSWD    R4                              ; D569   003C
        RSWD    R4                              ; D56A   003C
        ADCR    R4                              ; D56B   002C
        SAR     R2,     2                       ; D56C   006E
        SAR     R2,     2                       ; D56D   006E
        ADDR    R5,     R6                      ; D56E   00EE
        ADDR    R7,     R4                      ; D56F   00FC
        EIS                                     ; D570   0002
        EIS                                     ; D571   0002
        COMR    R0                              ; D572   0018
        SAR     R2,     2                       ; D573   006E
        RRC     R2,     2                       ; D574   0076
        RSWD    R4                              ; D575   003C
        RSWD    R4                              ; D576   003C
        RSWD    R4                              ; D577   003C
        COMR    R4                              ; D578   001C
        RSWD    R4                              ; D579   003C
        RSWD    R4                              ; D57A   003C
        NOP                                     ; D57B   0034
        SLR     R2,     2                       ; D57C   0066
        SLLC    R2,     2                       ; D57D   005E
        ADDR    R7,     R6                      ; D57E   00FE
        ADDR    R7,     R4                      ; D57F   00FC
        EIS                                     ; D580   0002
        EIS                                     ; D581   0002
        GSWD    R0                              ; D582   0030
        SAR     R2,     2                       ; D583   006E
        RRC     R2,     2                       ; D584   0076
        RSWD    R4                              ; D585   003C
        RSWD    R4                              ; D586   003C
        RSWD    R4                              ; D587   003C
        COMR    R4                              ; D588   001C
        RSWD    R4                              ; D589   003C
        RSWD    R4                              ; D58A   003C
        NOP                                     ; D58B   0034
        RRC     R2,     2                       ; D58C   0076
        RRC     R2,     2                       ; D58D   0076
        ADDR    R6,     R6                      ; D58E   00F6
        ADDR    R7,     R6                      ; D58F   00FE
        DECLE   $0001,  $0001                   ; D590   0001 0001

        GSWD    R0                              ; D592   0030
        DECLE   $0000,  $0000,  $0000,  $0000   ; D593   0000 0000 0000 0000

        COMR    R6                              ; D597   001E
        INCR    R6                              ; D598   000E
        COMR    R6                              ; D599   001E
        DECLE   $0000,  $0000,  $0000,  $0000   ; D59A   0000 0000 0000 0000
        DECLE   $0000                           ; D59E   0000

        TSTR    R0                              ; D59F   0080
        RSWD    R7                              ; D5A0   003F
        NEGR    R3                              ; D5A1   0023
        DECLE   $0000,  $0037                   ; D5A2   0000 0037

        RSWD    R3                              ; D5A4   003B
        COMR    R6                              ; D5A5   001E
        COMR    R6                              ; D5A6   001E
        COMR    R6                              ; D5A7   001E
        INCR    R6                              ; D5A8   000E
        COMR    R6                              ; D5A9   001E
        COMR    R6                              ; D5AA   001E
        COMR    R3                              ; D5AB   001B
        DECLE   $0037                           ; D5AC   0037

        ADCR    R7                              ; D5AD   002F
        RSWD    R7                              ; D5AE   003F
        MOVR    R3,     R7                      ; D5AF   009F
        ADDR    R0,     R0                      ; D5B0   00C0
        ADDR    R0,     R0                      ; D5B1   00C0
        SWAP    R3,     2                       ; D5B2   0047
        DECLE   $0000,  $0000,  $0000,  $0000   ; D5B3   0000 0000 0000 0000

        RSWD    R4                              ; D5B7   003C
        COMR    R0                              ; D5B8   0018
        RSWD    R4                              ; D5B9   003C
        NEGR    R4                              ; D5BA   0024
        COMR    R0                              ; D5BB   0018
        DECLE   $0000,  $0000                   ; D5BC   0000 0000

        MOVR    R0,     R1                      ; D5BE   0081
        DECLE   $0000                           ; D5BF   0000

        RSWD    R4                              ; D5C0   003C
        NOP                                     ; D5C1   0034
        DECLE   $0000,  $0000,  $0000,  $0000   ; D5C2   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D5C6   0000 0000

        RSWD    R4                              ; D5C8   003C
        COMR    R0                              ; D5C9   0018
        RSWD    R4                              ; D5CA   003C
        NEGR    R4                              ; D5CB   0024
        COMR    R0                              ; D5CC   0018
        DECLE   $0000,  $0000                   ; D5CD   0000 0000

        MOVR    R0,     R1                      ; D5CF   0081
        DECLE   $0000                           ; D5D0   0000

        NEGR    R4                              ; D5D1   0024
        DECLE   $0000,  $0000,  $0000,  $0000   ; D5D2   0000 0000 0000 0000
        DECLE   $0000                           ; D5D6   0000

        RSWD    R4                              ; D5D7   003C
        COMR    R0                              ; D5D8   0018
        RSWD    R4                              ; D5D9   003C
        NEGR    R4                              ; D5DA   0024
        COMR    R0                              ; D5DB   0018
        DECLE   $0000,  $0000                   ; D5DC   0000 0000

        MOVR    R0,     R1                      ; D5DE   0081
        DECLE   $0000                           ; D5DF   0000

        GSWD    R2                              ; D5E0   0032
        GSWD    R0                              ; D5E1   0030
        DECLE   $0000,  $0000,  $0000,  $0000   ; D5E2   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D5E6   0000 0000

        RSWD    R4                              ; D5E8   003C
        COMR    R0                              ; D5E9   0018
        RSWD    R4                              ; D5EA   003C
        NEGR    R4                              ; D5EB   0024
        COMR    R0                              ; D5EC   0018
        DECLE   $0000,  $0000                   ; D5ED   0000 0000

        MOVR    R0,     R1                      ; D5EF   0081
        DECLE   $0000                           ; D5F0   0000

        ADCR    R4                              ; D5F1   002C
        DECLE   $0000                           ; D5F2   0000

        SAR     R2,     2                       ; D5F3   006E
        SARC    R2,     2                       ; D5F4   007E
        RSWD    R4                              ; D5F5   003C
        RSWD    R4                              ; D5F6   003C
        RSWD    R4                              ; D5F7   003C
        COMR    R0                              ; D5F8   0018
        RSWD    R4                              ; D5F9   003C
        SARC    R2,     2                       ; D5FA   007E
        ADDR    R7,     R7                      ; D5FB   00FF
        MOVR    R7,     R5                      ; D5FC   00BD
        MOVR    R7,     R5                      ; D5FD   00BD
        SARC    R2,     2                       ; D5FE   007E
        SARC    R2,     2                       ; D5FF   007E
        DECLE   $0000,  $0000,  $0036,  $0000   ; D600   0000 0000 0036 0000

        SAR     R2,     2                       ; D604   006E
        SARC    R2,     2                       ; D605   007E
        RSWD    R4                              ; D606   003C
        RSWD    R4                              ; D607   003C
        RSWD    R4                              ; D608   003C
        COMR    R0                              ; D609   0018
        RSWD    R4                              ; D60A   003C
        SARC    R2,     2                       ; D60B   007E
        ADDR    R7,     R7                      ; D60C   00FF
        MOVR    R7,     R5                      ; D60D   00BD
        MOVR    R7,     R5                      ; D60E   00BD
        SARC    R2,     2                       ; D60F   007E
        SARC    R2,     2                       ; D610   007E
        DECR    R0                              ; D611   0010

        JSRD    R4,     L_6C7E                  ; D612   0004 006E 007E

        RSWD    R4                              ; D615   003C
        RSWD    R4                              ; D616   003C
        RSWD    R4                              ; D617   003C
        COMR    R0                              ; D618   0018
        RSWD    R4                              ; D619   003C
        SARC    R2,     2                       ; D61A   007E
        ADDR    R7,     R7                      ; D61B   00FF
        MOVR    R7,     R5                      ; D61C   00BD
        MOVR    R7,     R5                      ; D61D   00BD
        SARC    R2,     2                       ; D61E   007E
        SARC    R2,     2                       ; D61F   007E

        JSR     R4,     .STIC.HDLY              ; D620   0004 0000 0030
        DECLE   $0000                           ; D623   0000

        SAR     R2,     2                       ; D624   006E
        SARC    R2,     2                       ; D625   007E
        RSWD    R4                              ; D626   003C
        RSWD    R4                              ; D627   003C
        RSWD    R4                              ; D628   003C
        COMR    R0                              ; D629   0018
        RSWD    R4                              ; D62A   003C
        SARC    R2,     2                       ; D62B   007E
        ADDR    R7,     R7                      ; D62C   00FF
        MOVR    R7,     R5                      ; D62D   00BD
        MOVR    R7,     R5                      ; D62E   00BD
        SARC    R2,     2                       ; D62F   007E
        SARC    R2,     2                       ; D630   007E
        INCR    R4                              ; D631   000C

        JSR     R4,     .STIC.X.0               ; D632   0004 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D635   0000 0000 0000

        RSWD    R4                              ; D638   003C
        RSWD    R4                              ; D639   003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; D63A   0000 0000 0000 0000

        MOVR    R0,     R1                      ; D63E   0081
        DECLE   $0000                           ; D63F   0000

        RSWD    R4                              ; D640   003C
        NOP                                     ; D641   0034
        DECLE   $0000,  $0000,  $0000,  $0000   ; D642   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D646   0000 0000 0000

        RSWD    R4                              ; D649   003C
        RSWD    R4                              ; D64A   003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; D64B   0000 0000 0000 0000

        MOVR    R0,     R1                      ; D64F   0081
        DECLE   $0000                           ; D650   0000

        NEGR    R4                              ; D651   0024
        DECLE   $0000,  $0000,  $0000,  $0000   ; D652   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D656   0000 0000

        RSWD    R4                              ; D658   003C
        RSWD    R4                              ; D659   003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; D65A   0000 0000 0000 0000

        MOVR    R0,     R1                      ; D65E   0081
        DECLE   $0000                           ; D65F   0000

        GSWD    R2                              ; D660   0032
        GSWD    R0                              ; D661   0030
        DECLE   $0000,  $0000,  $0000,  $0000   ; D662   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D666   0000 0000 0000

        RSWD    R4                              ; D669   003C
        RSWD    R4                              ; D66A   003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; D66B   0000 0000 0000 0000

        MOVR    R0,     R1                      ; D66F   0081
        DECLE   $0000                           ; D670   0000

        ADCR    R4                              ; D671   002C
        DECLE   $0000,  $0000,  $0000,  $0000   ; D672   0000 0000 0000 0000
        DECLE   $0000                           ; D676   0000

        SARC    R1,     1                       ; D677   0079
        GSWD    R1                              ; D678   0031
        SARC    R0,     1                       ; D679   0078
        SLL     R0,     1                       ; D67A   0048
        GSWD    R0                              ; D67B   0030
        TSTR    R0                              ; D67C   0080
        TSTR    R0                              ; D67D   0080
        DECLE   $0000                           ; D67E   0000

        SLR     R2,     1                       ; D67F   0062
        DECLE   $0000,  $0000,  $0000,  $0000   ; D680   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D684   0000 0000 0000 0000

        SARC    R0,     1                       ; D688   0078
        GSWD    R0                              ; D689   0030
        ADDR    R7,     R0                      ; D68A   00F8
        SLL     R1,     1                       ; D68B   0049
        GSWD    R0                              ; D68C   0030
        DECLE   $0000,  $0000                   ; D68D   0000 0000

        TSTR    R0                              ; D68F   0080
        SLR     R0,     1                       ; D690   0060
        DECLE   $0000,  $0000,  $0000,  $0000   ; D691   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D695   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D699   0000 0000 0000 0000

        RSWD    R4                              ; D69D   003C
        COMR    R4                              ; D69E   001C
        DECLE   $0000                           ; D69F   0000

        ADDR    R0,     R1                      ; D6A0   00C1
        INCR    R1                              ; D6A1   0009
        MOVR    R3,     R0                      ; D6A2   0098
        DECLE   $0000,  $0000,  $0000,  $0000   ; D6A3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D6A7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D6AB   0000 0000 0000

        INCR    R6                              ; D6AE   000E
        COMR    R6                              ; D6AF   001E
        SWAP    R0,     1                       ; D6B0   0040
        ADDR    R0,     R4                      ; D6B1   00C4
        MOVR    R0,     R6                      ; D6B2   0086
        MOVR    R7,     R4                      ; D6B3   00BC
        ADDR    R7,     R4                      ; D6B4   00FC
        SARC    R0,     1                       ; D6B5   0078
        SARC    R0,     1                       ; D6B6   0078
        SARC    R0,     1                       ; D6B7   0078
        GSWD    R1                              ; D6B8   0031
        GSWD    R3                              ; D6B9   0033
        ADDR    R7,     R7                      ; D6BA   00FF
        ADDR    R7,     R6                      ; D6BB   00FE
        RSWD    R4                              ; D6BC   003C
        SARC    R0,     2                       ; D6BD   007C
        SARC    R2,     2                       ; D6BE   007E
        SARC    R2,     2                       ; D6BF   007E
        ADDR    R0,     R3                      ; D6C0   00C3
        DECLE   $0000,  $0000,  $0000           ; D6C1   0000 0000 0000

        MOVR    R7,     R4                      ; D6C4   00BC
        ADDR    R7,     R4                      ; D6C5   00FC
        SARC    R0,     1                       ; D6C6   0078
        SARC    R0,     1                       ; D6C7   0078
        SARC    R0,     1                       ; D6C8   0078
        GSWD    R0                              ; D6C9   0030
        MOVR    R6,     R0                      ; D6CA   00B0
        ADDR    R7,     R7                      ; D6CB   00FF
        RSWD    R4                              ; D6CC   003C
        ADDR    R7,     R6                      ; D6CD   00FE
        ADDR    R7,     R6                      ; D6CE   00FE
        SARC    R0,     2                       ; D6CF   007C
        COMR    R0                              ; D6D0   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; D6D1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D6D5   0000 0000 0000 0000
        DECLE   $0000                           ; D6D9   0000

        SLLC    R2,     2                       ; D6DA   005E
        SARC    R2,     2                       ; D6DB   007E
        RSWD    R4                              ; D6DC   003C
        RSWD    R4                              ; D6DD   003C
        ADDR    R7,     R4                      ; D6DE   00FC
        SARC    R2,     2                       ; D6DF   007E
        ADDR    R7,     R7                      ; D6E0   00FF
        ADDR    R7,     R6                      ; D6E1   00FE
        ADDR    R7,     R6                      ; D6E2   00FE
        DECLE   $0000,  $0000,  $0000,  $0000   ; D6E3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D6E7   0000 0000 0000 0000

        ADCR    R7                              ; D6EB   002F
        RSWD    R7                              ; D6EC   003F
        COMR    R6                              ; D6ED   001E
        COMR    R6                              ; D6EE   001E
        SARC    R2,     2                       ; D6EF   007E
        ADDR    R7,     R7                      ; D6F0   00FF
        ADDR    R7,     R7                      ; D6F1   00FF
        ADDR    R7,     R7                      ; D6F2   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; D6F3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D6F7   0000 0000 0000 0000

        ADCR    R7                              ; D6FB   002F
        RSWD    R7                              ; D6FC   003F
        COMR    R6                              ; D6FD   001E
        COMR    R6                              ; D6FE   001E
        SARC    R2,     2                       ; D6FF   007E
        ADDR    R7,     R7                      ; D700   00FF
        ADDR    R7,     R7                      ; D701   00FF
        ADDR    R7,     R7                      ; D702   00FF
        COMR    R4                              ; D703   001C
        RSWD    R6                              ; D704   003E
        DECR    R6                              ; D705   0016
        RSWD    R7                              ; D706   003F
        COMR    R7                              ; D707   001F
        INCR    R7                              ; D708   000F
        INCR    R7                              ; D709   000F
        INCR    R7                              ; D70A   000F
        COMR    R7                              ; D70B   001F
        RSWD    R7                              ; D70C   003F
        RSWD    R6                              ; D70D   003E
        RSWD    R6                              ; D70E   003E
        COMR    R4                              ; D70F   001C
        EIS                                     ; D710   0002
        ADDR    R5,     R6                      ; D711   00EE
        DECLE   $0000                           ; D712   0000

        COMR    R0                              ; D713   0018
        RSWD    R4                              ; D714   003C
        SARC    R0,     2                       ; D715   007C
        ADCR    R4                              ; D716   002C
        SARC    R2,     2                       ; D717   007E
        SARC    R2,     2                       ; D718   007E
        RSWD    R6                              ; D719   003E
        RSWD    R6                              ; D71A   003E
        COMR    R7                              ; D71B   001F
        COMR    R7                              ; D71C   001F
        COMR    R7                              ; D71D   001F
        COMR    R6                              ; D71E   001E
        DECLE   $0001                           ; D71F   0001

        SETC                                    ; D720   0007
        DECR    R0                              ; D721   0010
        RRC     R0,     1                       ; D722   0070
        RSWD    R0                              ; D723   0038
        SARC    R0,     2                       ; D724   007C
        ADCR    R4                              ; D725   002C
        SARC    R0,     2                       ; D726   007C
        SARC    R0,     2                       ; D727   007C
        SARC    R0,     1                       ; D728   0078
        SARC    R0,     1                       ; D729   0078
        SARC    R0,     2                       ; D72A   007C
        SARC    R2,     2                       ; D72B   007E
        SARC    R2,     2                       ; D72C   007E
        SARC    R2,     2                       ; D72D   007E
        RSWD    R6                              ; D72E   003E
        COMR    R4                              ; D72F   001C
        DECLE   $0000                           ; D730   0000

        EIS                                     ; D731   0002
        ADDR    R5,     R6                      ; D732   00EE
        RSWD    R0                              ; D733   0038
        RSWD    R4                              ; D734   003C
        SARC    R2,     2                       ; D735   007E
        ADCR    R6                              ; D736   002E
        SARC    R2,     2                       ; D737   007E
        SARC    R2,     2                       ; D738   007E
        RSWD    R7                              ; D739   003F
        RSWD    R7                              ; D73A   003F
        COMR    R7                              ; D73B   001F
        COMR    R7                              ; D73C   001F
        RSWD    R7                              ; D73D   003F
        RSWD    R6                              ; D73E   003E
        ADDR    R7,     R6                      ; D73F   00FE
        COMR    R4                              ; D740   001C
        EIS                                     ; D741   0002
        INCR    R6                              ; D742   000E
        RSWD    R0                              ; D743   0038
        SARC    R0,     2                       ; D744   007C
        RLC     R0,     2                       ; D745   0054
        SARC    R0,     2                       ; D746   007C
        RSWD    R6                              ; D747   003E
        COMR    R6                              ; D748   001E
        COMR    R6                              ; D749   001E
        COMR    R6                              ; D74A   001E
        COMR    R6                              ; D74B   001E
        RSWD    R6                              ; D74C   003E
        SARC    R2,     2                       ; D74D   007E
        SARC    R0,     2                       ; D74E   007C
        RSWD    R0                              ; D74F   0038
        ADDR    R4,     R0                      ; D750   00E0
        DECLE   $0000                           ; D751   0000

        INCR    R6                              ; D752   000E
        RRC     R0,     1                       ; D753   0070
        SARC    R0,     1                       ; D754   0078
        ADDR    R7,     R4                      ; D755   00FC
        MOVR    R5,     R4                      ; D756   00AC
        ADDR    R7,     R4                      ; D757   00FC
        ADDR    R7,     R4                      ; D758   00FC
        SARC    R2,     2                       ; D759   007E
        RSWD    R6                              ; D75A   003E
        RSWD    R6                              ; D75B   003E
        RSWD    R6                              ; D75C   003E
        SARC    R2,     2                       ; D75D   007E
        SARC    R0,     2                       ; D75E   007C
        SARC    R0,     2                       ; D75F   007C
        RSWD    R0                              ; D760   0038
        COMR    R0                              ; D761   0018
        ADDR    R5,     R6                      ; D762   00EE
        RSWD    R0                              ; D763   0038
        SARC    R0,     2                       ; D764   007C
        RLC     R0,     2                       ; D765   0054
        ADDR    R7,     R4                      ; D766   00FC
        ADDR    R7,     R4                      ; D767   00FC
        ADDR    R7,     R4                      ; D768   00FC
        ADDR    R7,     R0                      ; D769   00F8
        ADDR    R7,     R0                      ; D76A   00F8
        ADDR    R7,     R0                      ; D76B   00F8
        ADDR    R7,     R4                      ; D76C   00FC
        ADDR    R7,     R4                      ; D76D   00FC
        SARC    R0,     2                       ; D76E   007C
        SARC    R0,     2                       ; D76F   007C
        RSWD    R0                              ; D770   0038
        INCR    R7                              ; D771   000F
        ADDR    R4,     R0                      ; D772   00E0
        RRC     R0,     1                       ; D773   0070
        SARC    R0,     1                       ; D774   0078
        ADDR    R7,     R4                      ; D775   00FC
        MOVR    R5,     R4                      ; D776   00AC
        ADDR    R7,     R4                      ; D777   00FC
        ADDR    R7,     R4                      ; D778   00FC
        SARC    R2,     2                       ; D779   007E
        RSWD    R6                              ; D77A   003E
        RSWD    R6                              ; D77B   003E
        RSWD    R6                              ; D77C   003E
        SARC    R2,     2                       ; D77D   007E
        SARC    R0,     2                       ; D77E   007C
        SARC    R0,     2                       ; D77F   007C
        RSWD    R0                              ; D780   0038
        COMR    R0                              ; D781   0018
        ADDR    R5,     R6                      ; D782   00EE
        RSWD    R0                              ; D783   0038
        SARC    R0,     2                       ; D784   007C
        SARC    R0,     2                       ; D785   007C
        SARC    R0,     2                       ; D786   007C
        RSWD    R6                              ; D787   003E
        COMR    R6                              ; D788   001E
        COMR    R6                              ; D789   001E
        COMR    R6                              ; D78A   001E
        COMR    R6                              ; D78B   001E
        RSWD    R6                              ; D78C   003E
        SARC    R2,     2                       ; D78D   007E
        SARC    R0,     2                       ; D78E   007C
        RSWD    R0                              ; D78F   0038
        ADDR    R4,     R0                      ; D790   00E0
        DECLE   $0000                           ; D791   0000

        INCR    R6                              ; D792   000E
        RRC     R0,     1                       ; D793   0070
        SARC    R0,     1                       ; D794   0078
        ADDR    R7,     R4                      ; D795   00FC
        ADDR    R7,     R4                      ; D796   00FC
        ADDR    R7,     R4                      ; D797   00FC
        ADDR    R7,     R4                      ; D798   00FC
        SARC    R2,     2                       ; D799   007E
        RSWD    R6                              ; D79A   003E
        RSWD    R6                              ; D79B   003E
        RSWD    R6                              ; D79C   003E
        SARC    R2,     2                       ; D79D   007E
        SARC    R0,     2                       ; D79E   007C
        SARC    R0,     2                       ; D79F   007C
        RSWD    R0                              ; D7A0   0038
        COMR    R0                              ; D7A1   0018
        ADDR    R5,     R6                      ; D7A2   00EE
        RSWD    R0                              ; D7A3   0038
        SARC    R0,     2                       ; D7A4   007C
        SARC    R0,     2                       ; D7A5   007C
        ADDR    R7,     R4                      ; D7A6   00FC
        ADDR    R7,     R4                      ; D7A7   00FC
        ADDR    R7,     R4                      ; D7A8   00FC
        ADDR    R7,     R0                      ; D7A9   00F8
        ADDR    R7,     R0                      ; D7AA   00F8
        ADDR    R7,     R0                      ; D7AB   00F8
        ADDR    R7,     R4                      ; D7AC   00FC
        ADDR    R7,     R4                      ; D7AD   00FC
        SARC    R0,     2                       ; D7AE   007C
        SARC    R0,     2                       ; D7AF   007C
        RSWD    R0                              ; D7B0   0038
        SETC                                    ; D7B1   0007
        ADDR    R4,     R0                      ; D7B2   00E0
        RRC     R0,     1                       ; D7B3   0070
        SARC    R0,     1                       ; D7B4   0078
        ADDR    R7,     R4                      ; D7B5   00FC
        ADDR    R7,     R4                      ; D7B6   00FC
        ADDR    R7,     R4                      ; D7B7   00FC
        ADDR    R7,     R4                      ; D7B8   00FC
        SARC    R2,     2                       ; D7B9   007E
        RSWD    R6                              ; D7BA   003E
        RSWD    R6                              ; D7BB   003E
        RSWD    R6                              ; D7BC   003E
        SARC    R2,     2                       ; D7BD   007E
        SARC    R0,     2                       ; D7BE   007C
        SARC    R0,     2                       ; D7BF   007C
        RSWD    R0                              ; D7C0   0038
        COMR    R0                              ; D7C1   0018
        ADDR    R5,     R6                      ; D7C2   00EE
        DECLE   $0035                           ; D7C3   0035

        SARC    R2,     2                       ; D7C4   007E
        ADDR    R7,     R7                      ; D7C5   00FF
        MOVR    R4,     R7                      ; D7C6   00A7
        SLLC    R0,     1                       ; D7C7   0058
        SARC    R2,     2                       ; D7C8   007E
        DECLE   $0036                           ; D7C9   0036

        RRC     R2,     2                       ; D7CA   0076
        DECLE   $0036                           ; D7CB   0036

        ADDR    R6,     R6                      ; D7CC   00F6
        ADDR    R6,     R6                      ; D7CD   00F6
        RRC     R2,     2                       ; D7CE   0076
        DECLE   $0036                           ; D7CF   0036

        SARC    R0,     2                       ; D7D0   007C
        DECLE   $0000                           ; D7D1   0000

        ADDR    R0,     R0                      ; D7D2   00C0
        SAR     R0,     2                       ; D7D3   006C
        ADDR    R7,     R6                      ; D7D4   00FE
        ADDR    R4,     R7                      ; D7D5   00E7
        MOVR    R3,     R1                      ; D7D6   0099
        SARC    R2,     2                       ; D7D7   007E
        DECLE   $0036                           ; D7D8   0036

        RRC     R2,     2                       ; D7D9   0076
        TSTR    R6                              ; D7DA   00B6
        ADDR    R6,     R6                      ; D7DB   00F6
        RRC     R2,     2                       ; D7DC   0076
        DECLE   $0036                           ; D7DD   0036

        SARC    R2,     2                       ; D7DE   007E
        RSWD    R4                              ; D7DF   003C
        DECLE   $0000                           ; D7E0   0000

        DECR    R0                              ; D7E1   0010
        GSWD    R0                              ; D7E2   0030
        TSTR    R1                              ; D7E3   0089
        DECLE   $0036                           ; D7E4   0036

        SARC    R3,     2                       ; D7E5   007F
        SAR     R3,     1                       ; D7E6   006B
        ADDR    R2,     R5                      ; D7E7   00D5
        MOVR    R7,     R6                      ; D7E8   00BE
        ADCR    R7                              ; D7E9   002F
        RSWD    R5                              ; D7EA   003D
        ADCR    R5                              ; D7EB   002D
        SARC    R1,     2                       ; D7EC   007D
        SARC    R1,     2                       ; D7ED   007D
        RSWD    R5                              ; D7EE   003D
        COMR    R3                              ; D7EF   001B
        MOVR    R7,     R6                      ; D7F0   00BE
        DECLE   $0000                           ; D7F1   0000

        INCR    R4                              ; D7F2   000C
        INCR    R4                              ; D7F3   000C
        MOVR    R2,     R6                      ; D7F4   0096
        SARC    R3,     2                       ; D7F5   007F
        SARC    R3,     2                       ; D7F6   007F
        ADDR    R2,     R1                      ; D7F7   00D1
        MOVR    R5,     R6                      ; D7F8   00AE
        RSWD    R7                              ; D7F9   003F
        RSWD    R5                              ; D7FA   003D
        ADCR    R5                              ; D7FB   002D
        SAR     R1,     2                       ; D7FC   006D
        SARC    R1,     2                       ; D7FD   007D
        RSWD    R5                              ; D7FE   003D
        COMR    R5                              ; D7FF   001D
        RSWD    R3                              ; D800   003B
        RSWD    R6                              ; D801   003E
        ADDR    R1,     R4                      ; D802   00CC
        ADCR    R4                              ; D803   002C
        SLLC    R0,     2                       ; D804   005C
        ADDR    R7,     R6                      ; D805   00FE
        MOVR    R4,     R6                      ; D806   00A6
        SLLC    R0,     1                       ; D807   0058
        SARC    R0,     2                       ; D808   007C
        RLC     R3,     2                       ; D809   0057
        SARC    R1,     2                       ; D80A   007D
        RLC     R1,     2                       ; D80B   0055
        RLC     R1,     2                       ; D80C   0055
        SARC    R1,     2                       ; D80D   007D
        SLR     R1,     2                       ; D80E   0065
        DECLE   $0035                           ; D80F   0035

        ADDR    R3,     R7                      ; D810   00DF
        COMR    R4                              ; D811   001C
        CLRC                                    ; D812   0006
        MOVR    R3,     R0                      ; D813   0098
        RSWD    R6                              ; D814   003E
        SLR     R2,     1                       ; D815   0062
        MOVR    R3,     R5                      ; D816   009D
        MOVR    R7,     R4                      ; D817   00BC
        RLC     R3,     2                       ; D818   0057
        SARC    R1,     2                       ; D819   007D
        RLC     R1,     2                       ; D81A   0055
        RLC     R1,     2                       ; D81B   0055
        SARC    R1,     2                       ; D81C   007D
        SWAP    R1,     2                       ; D81D   0045
        RRC     R1,     2                       ; D81E   0075
        SARC    R3,     2                       ; D81F   007F
        DECLE   $0000                           ; D820   0000

        SLLC    R0,     1                       ; D821   0058
        ADDR    R0,     R0                      ; D822   00C0
        SLR     R0,     2                       ; D823   0064
        SARC    R0,     1                       ; D824   0078
        ADDR    R7,     R4                      ; D825   00FC
        TSTR    R2                              ; D826   0092
        SAR     R0,     2                       ; D827   006C
        SARC    R0,     2                       ; D828   007C
        RLC     R3,     2                       ; D829   0057
        SARC    R1,     2                       ; D82A   007D
        SARC    R1,     2                       ; D82B   007D
        RLC     R1,     2                       ; D82C   0055
        SARC    R1,     2                       ; D82D   007D
        SWAP    R1,     2                       ; D82E   0045
        SLR     R1,     2                       ; D82F   0065
        SARC    R3,     2                       ; D830   007F
        DECLE   $0000                           ; D831   0000

        SLR     R0,     1                       ; D832   0060
        INCR    R4                              ; D833   000C
        MOVR    R7,     R4                      ; D834   00BC
        SARC    R2,     1                       ; D835   007A
        ADDR    R7,     R4                      ; D836   00FC
        MOVR    R4,     R0                      ; D837   00A0
        SLLC    R0,     2                       ; D838   005C
        SARC    R0,     2                       ; D839   007C
        RLC     R3,     2                       ; D83A   0057
        SARC    R1,     2                       ; D83B   007D
        SARC    R1,     2                       ; D83C   007D
        RLC     R1,     2                       ; D83D   0055
        SARC    R1,     2                       ; D83E   007D
        SAR     R1,     2                       ; D83F   006D
        SAR     R1,     2                       ; D840   006D
        SAR     R1,     2                       ; D841   006D
        RSWD    R4                              ; D842   003C
        ADCR    R4                              ; D843   002C
        SLLC    R0,     2                       ; D844   005C
        ADDR    R7,     R6                      ; D845   00FE
        MOVR    R4,     R6                      ; D846   00A6
        MOVR    R3,     R2                      ; D847   009A
        SARC    R0,     2                       ; D848   007C
        SARC    R3,     2                       ; D849   007F
        SARC    R1,     2                       ; D84A   007D
        SARC    R1,     2                       ; D84B   007D
        SARC    R1,     2                       ; D84C   007D
        SARC    R1,     2                       ; D84D   007D
        SARC    R1,     2                       ; D84E   007D
        RSWD    R5                              ; D84F   003D
        ADDR    R3,     R7                      ; D850   00DF
        COMR    R4                              ; D851   001C
        CLRC                                    ; D852   0006
        MOVR    R3,     R0                      ; D853   0098
        RSWD    R6                              ; D854   003E
        SLR     R2,     1                       ; D855   0062
        MOVR    R3,     R5                      ; D856   009D
        MOVR    R7,     R4                      ; D857   00BC
        TSTR    R7                              ; D858   00BF
        SARC    R1,     2                       ; D859   007D
        SARC    R1,     2                       ; D85A   007D
        SARC    R1,     2                       ; D85B   007D
        SARC    R1,     2                       ; D85C   007D
        SARC    R1,     2                       ; D85D   007D
        SARC    R1,     2                       ; D85E   007D
        RSWD    R7                              ; D85F   003F
        DECLE   $0000                           ; D860   0000

        SLLC    R0,     1                       ; D861   0058
        ADDR    R0,     R0                      ; D862   00C0
        SLR     R0,     2                       ; D863   0064
        SARC    R0,     1                       ; D864   0078
        ADDR    R7,     R4                      ; D865   00FC
        ADDR    R2,     R2                      ; D866   00D2
        MOVR    R5,     R4                      ; D867   00AC
        ADDR    R3,     R4                      ; D868   00DC
        SARC    R3,     2                       ; D869   007F
        SARC    R1,     2                       ; D86A   007D
        SARC    R1,     2                       ; D86B   007D
        SARC    R1,     2                       ; D86C   007D
        SARC    R1,     2                       ; D86D   007D
        SARC    R1,     2                       ; D86E   007D
        SARC    R1,     2                       ; D86F   007D
        RSWD    R7                              ; D870   003F
        SWAP    R0,     1                       ; D871   0040
        SLR     R0,     1                       ; D872   0060
        INCR    R4                              ; D873   000C
        MOVR    R7,     R4                      ; D874   00BC
        SARC    R2,     1                       ; D875   007A
        ADDR    R7,     R4                      ; D876   00FC
        MOVR    R4,     R6                      ; D877   00A6
        SLLC    R2,     1                       ; D878   005A
        SARC    R0,     2                       ; D879   007C
        SARC    R3,     2                       ; D87A   007F
        SARC    R1,     2                       ; D87B   007D
        SARC    R1,     2                       ; D87C   007D
        SARC    R1,     2                       ; D87D   007D
        SARC    R1,     2                       ; D87E   007D
        SARC    R1,     2                       ; D87F   007D
        SARC    R1,     2                       ; D880   007D
        SARC    R3,     2                       ; D881   007F
        RSWD    R4                              ; D882   003C
        SARC    R0,     1                       ; D883   0078
        SARC    R2,     2                       ; D884   007E
        COMR    R6                              ; D885   001E
        DECR    R3                              ; D886   0013
        COMR    R3                              ; D887   001B
        INCR    R7                              ; D888   000F
        INCR    R5                              ; D889   000D
        DIS                                     ; D88A   0003
        COMR    R7                              ; D88B   001F
        INCR    R7                              ; D88C   000F
        COMR    R6                              ; D88D   001E
        RSWD    R6                              ; D88E   003E
        RSWD    R0                              ; D88F   0038
        DIS                                     ; D890   0003
        SETC                                    ; D891   0007
        ADDR    R4,     R0                      ; D892   00E0
        ADDR    R4,     R0                      ; D893   00E0
        ADDR    R7,     R0                      ; D894   00F8
        SARC    R0,     1                       ; D895   0078
        INCR    R4                              ; D896   000C
        RSWD    R4                              ; D897   003C
        RSWD    R6                              ; D898   003E
        DECR    R6                              ; D899   0016
        INCR    R6                              ; D89A   000E
        RSWD    R6                              ; D89B   003E
        COMR    R6                              ; D89C   001E
        COMR    R4                              ; D89D   001C
        RSWD    R5                              ; D89E   003D
        GSWD    R3                              ; D89F   0033
        CLRC                                    ; D8A0   0006
        DECR    R0                              ; D8A1   0010
        RRC     R0,     1                       ; D8A2   0070
        RRC     R0,     1                       ; D8A3   0070
        SARC    R0,     1                       ; D8A4   0078
        RSWD    R4                              ; D8A5   003C
        NEGR    R4                              ; D8A6   0024
        DECR    R6                              ; D8A7   0016
        COMR    R6                              ; D8A8   001E
        COMR    R6                              ; D8A9   001E
        CLRC                                    ; D8AA   0006
        RSWD    R6                              ; D8AB   003E
        COMR    R6                              ; D8AC   001E
        RSWD    R4                              ; D8AD   003C
        RSWD    R4                              ; D8AE   003C
        SARC    R0,     1                       ; D8AF   0078
        DECLE   $0000                           ; D8B0   0000

        INCR    R0                              ; D8B1   0008
        RSWD    R0                              ; D8B2   0038
        RSWD    R0                              ; D8B3   0038
        RSWD    R4                              ; D8B4   003C
        COMR    R6                              ; D8B5   001E
        DECR    R2                              ; D8B6   0012
        INCR    R3                              ; D8B7   000B
        INCR    R7                              ; D8B8   000F
        INCR    R7                              ; D8B9   000F
        INCR    R5                              ; D8BA   000D
        DIS                                     ; D8BB   0003
        COMR    R7                              ; D8BC   001F
        INCR    R7                              ; D8BD   000F
        RSWD    R6                              ; D8BE   003E
        COMR    R4                              ; D8BF   001C
        ADDR    R4,     R1                      ; D8C0   00E1
        DIS                                     ; D8C1   0003
        INCR    R6                              ; D8C2   000E
        ADDR    R6,     R0                      ; D8C3   00F0
        ADDR    R7,     R4                      ; D8C4   00FC
        RLC     R0,     2                       ; D8C5   0054
        RLC     R0,     2                       ; D8C6   0054
        SARC    R2,     2                       ; D8C7   007E
        ADCR    R6                              ; D8C8   002E
        RSWD    R6                              ; D8C9   003E
        RSWD    R4                              ; D8CA   003C
        NEGR    R2                              ; D8CB   0022
        RSWD    R6                              ; D8CC   003E
        ADCR    R4                              ; D8CD   002C
        SARC    R0,     2                       ; D8CE   007C
        COMR    R0                              ; D8CF   0018
        ADDR    R4,     R0                      ; D8D0   00E0
        INCR    R0                              ; D8D1   0008
        INCR    R6                              ; D8D2   000E
        DECLE   $0000                           ; D8D3   0000

        ADDR    R6,     R0                      ; D8D4   00F0
        ADDR    R7,     R4                      ; D8D5   00FC
        SAR     R2,     1                       ; D8D6   006A
        ADCR    R2                              ; D8D7   002A
        RSWD    R7                              ; D8D8   003F
        DECR    R7                              ; D8D9   0017
        COMR    R7                              ; D8DA   001F
        COMR    R5                              ; D8DB   001D
        DIS                                     ; D8DC   0003
        COMR    R7                              ; D8DD   001F
        ADCR    R6                              ; D8DE   002E
        SARC    R0,     2                       ; D8DF   007C
        DECLE   $0000                           ; D8E0   0000

        ADCR    R6                              ; D8E1   002E
        ADDR    R4,     R0                      ; D8E2   00E0
        DECLE   $0000                           ; D8E3   0000

        SARC    R0,     1                       ; D8E4   0078
        SARC    R2,     2                       ; D8E5   007E
        NOP                                     ; D8E6   0034
        RSWD    R7                              ; D8E7   003F
        COMR    R5                              ; D8E8   001D
        COMR    R7                              ; D8E9   001F
        INCR    R3                              ; D8EA   000B
        INCR    R4                              ; D8EB   000C
        INCR    R7                              ; D8EC   000F
        INCR    R6                              ; D8ED   000E
        COMR    R6                              ; D8EE   001E
        COMR    R0                              ; D8EF   0018
        DECLE   $0037,  $0000                   ; D8F0   0037 0000
L_D8F2:
        RRC     R0,     1                       ; D8F2   0070
        RRC     R0,     1                       ; D8F3   0070
        SARC    R0,     2                       ; D8F4   007C
        SAR     R2,     1                       ; D8F5   006A
        ADCR    R2                              ; D8F6   002A
L_D8F7:
        RSWD    R6                              ; D8F7   003E
        RSWD    R3                              ; D8F8   003B
        COMR    R7                              ; D8F9   001F
        DECR    R7                              ; D8FA   0017
        COMR    R0                              ; D8FB   0018
        COMR    R7                              ; D8FC   001F
        INCR    R4                              ; D8FD   000C
        COMR    R6                              ; D8FE   001E
        RSWD    R4                              ; D8FF   003C
        INCR    R0                              ; D900   0008
        RRC     R0,     2                       ; D901   0074
        SETC                                    ; D902   0007
        ADDR    R6,     R0                      ; D903   00F0
        ADDR    R7,     R0                      ; D904   00F8
        SLLC    R0,     2                       ; D905   005C
        SAR     R0,     2                       ; D906   006C
        RRC     R2,     2                       ; D907   0076
L_D908:
        DECLE   $0036,  $0036,  $0036,  $0036   ; D908   0036 0036 0036 0036

        RSWD    R6                              ; D90C   003E
        RSWD    R4                              ; D90D   003C
        SARC    R0,     2                       ; D90E   007C
        COMR    R0                              ; D90F   0018
        ADDR    R4,     R0                      ; D910   00E0
        INCR    R0                              ; D911   0008
        INCR    R6                              ; D912   000E
        DECLE   $0000                           ; D913   0000

        ADDR    R6,     R0                      ; D914   00F0
        ADDR    R7,     R4                      ; D915   00FC
        SAR     R2,     2                       ; D916   006E
        DECLE   $0036                           ; D917   0036

        RSWD    R3                              ; D918   003B
        COMR    R3                              ; D919   001B
        COMR    R3                              ; D91A   001B
        COMR    R3                              ; D91B   001B
        COMR    R3                              ; D91C   001B
        COMR    R7                              ; D91D   001F
        RSWD    R6                              ; D91E   003E
        SARC    R0,     2                       ; D91F   007C
        DECLE   $0000                           ; D920   0000

        ADCR    R6                              ; D921   002E
        ADDR    R4,     R0                      ; D922   00E0
        DECLE   $0000                           ; D923   0000

        SARC    R0,     1                       ; D924   0078
        SARC    R2,     2                       ; D925   007E
        DECLE   $0036                           ; D926   0036

        RSWD    R3                              ; D927   003B
        COMR    R5                              ; D928   001D
        COMR    R5                              ; D929   001D
        INCR    R5                              ; D92A   000D
        INCR    R7                              ; D92B   000F
        INCR    R7                              ; D92C   000F
        INCR    R6                              ; D92D   000E
        COMR    R6                              ; D92E   001E
        COMR    R0                              ; D92F   0018
        DECLE   $0037,  $0000                   ; D930   0037 0000

        RRC     R0,     1                       ; D932   0070
        RRC     R0,     1                       ; D933   0070
        SARC    R0,     2                       ; D934   007C
        SAR     R2,     2                       ; D935   006E
        DECLE   $0036                           ; D936   0036

        RSWD    R2                              ; D937   003A
        RSWD    R2                              ; D938   003A
        COMR    R2                              ; D939   001A
        COMR    R2                              ; D93A   001A
        COMR    R2                              ; D93B   001A
        COMR    R7                              ; D93C   001F
        COMR    R6                              ; D93D   001E
        COMR    R6                              ; D93E   001E
        RSWD    R4                              ; D93F   003C
        INCR    R0                              ; D940   0008
        RRC     R0,     2                       ; D941   0074
        SETC                                    ; D942   0007
        RSWD    R0                              ; D943   0038
        INCR    R4                              ; D944   000C

        JSR     R4,     G_041E                  ; D945   0004 0004 001E

        RSWD    R6                              ; D948   003E
        RSWD    R7                              ; D949   003F
        SLLC    R3,     2                       ; D94A   005F
        SARC    R3,     2                       ; D94B   007F
        RSWD    R7                              ; D94C   003F
        RSWD    R7                              ; D94D   003F
        COMR    R7                              ; D94E   001F
        INCR    R6                              ; D94F   000E
        RRC     R0,     1                       ; D950   0070
        DECLE   $0000                           ; D951   0000

        INCR    R6                              ; D952   000E
        DECLE   $0000                           ; D953   0000

        RSWD    R0                              ; D954   0038
        INCR    R4                              ; D955   000C

        JSR     R4,     G_041E                  ; D956   0004 0004 001E

        RSWD    R7                              ; D959   003F
        RSWD    R7                              ; D95A   003F
        SLLC    R3,     2                       ; D95B   005F
        SARC    R3,     2                       ; D95C   007F
        RSWD    R7                              ; D95D   003F
        COMR    R7                              ; D95E   001F
        COMR    R6                              ; D95F   001E
        RSWD    R6                              ; D960   003E
        INCR    R4                              ; D961   000C
        ADDR    R4,     R3                      ; D962   00E3
        GSWD    R0                              ; D963   0030
        COMR    R0                              ; D964   0018
        INCR    R0                              ; D965   0008
        INCR    R0                              ; D966   0008
        INCR    R0                              ; D967   0008
        COMR    R4                              ; D968   001C
        RSWD    R6                              ; D969   003E
        SARC    R3,     2                       ; D96A   007F
        TSTR    R7                              ; D96B   00BF
        ADDR    R7,     R7                      ; D96C   00FF
        SARC    R3,     2                       ; D96D   007F
        RSWD    R7                              ; D96E   003F
        SARC    R2,     2                       ; D96F   007E
        RSWD    R4                              ; D970   003C
        INCR    R6                              ; D971   000E
        RRC     R0,     1                       ; D972   0070
        DECR    R0                              ; D973   0010
        NEGR    R0                              ; D974   0020
        NEGR    R0                              ; D975   0020
        GSWD    R0                              ; D976   0030
        COMR    R4                              ; D977   001C
        COMR    R6                              ; D978   001E
        RSWD    R7                              ; D979   003F
        RSWD    R7                              ; D97A   003F
        SLLC    R3,     2                       ; D97B   005F
        SARC    R3,     2                       ; D97C   007F
        RSWD    R7                              ; D97D   003F
        RSWD    R6                              ; D97E   003E
        COMR    R6                              ; D97F   001E
        DECLE   $0000                           ; D980   0000

        JSR     R4,     .EXEC.C38               ; D981   0004 001C 0038

        INCR    R4                              ; D984   000C

        JSR     R4,     .EXEC.C3C               ; D985   0004 001C 003C

        SARC    R2,     2                       ; D988   007E
        SAR     R3,     1                       ; D989   006B
        ADDR    R5,     R3                      ; D98A   00EB
        ADDR    R7,     R7                      ; D98B   00FF
        ADDR    R7,     R7                      ; D98C   00FF
        ADDR    R6,     R7                      ; D98D   00F7
        RRC     R2,     2                       ; D98E   0076
        COMR    R4                              ; D98F   001C
        ADDR    R4,     R0                      ; D990   00E0
        DECLE   $0000                           ; D991   0000

        INCR    R6                              ; D992   000E
        RRC     R0,     1                       ; D993   0070
        COMR    R0                              ; D994   0018
        INCR    R0                              ; D995   0008
        INCR    R0                              ; D996   0008
        RSWD    R0                              ; D997   0038
        SARC    R0,     2                       ; D998   007C
        SARC    R2,     2                       ; D999   007E
        ADDR    R7,     R6                      ; D99A   00FE
        ADDR    R2,     R6                      ; D99B   00D6
        ADDR    R7,     R6                      ; D99C   00FE
        ADDR    R5,     R6                      ; D99D   00EE
        ADDR    R5,     R6                      ; D99E   00EE
        SAR     R0,     2                       ; D99F   006C
        RSWD    R4                              ; D9A0   003C
        COMR    R0                              ; D9A1   0018
        ADDR    R5,     R6                      ; D9A2   00EE
        SLR     R0,     1                       ; D9A3   0060
        MOVR    R6,     R0                      ; D9A4   00B0
        DECR    R0                              ; D9A5   0010
        DECR    R0                              ; D9A6   0010
        RSWD    R0                              ; D9A7   0038
        RSWD    R4                              ; D9A8   003C
        SARC    R0,     2                       ; D9A9   007C
        RLC     R2,     2                       ; D9AA   0056
        ADDR    R2,     R6                      ; D9AB   00D6
L_D9AC:
        ADDR    R7,     R6                      ; D9AC   00FE
        ADDR    R7,     R6                      ; D9AD   00FE
        ADDR    R5,     R6                      ; D9AE   00EE
        ADDR    R5,     R4                      ; D9AF   00EC
        SARC    R0,     1                       ; D9B0   0078
        INCR    R6                              ; D9B1   000E
        ADDR    R4,     R0                      ; D9B2   00E0
        NEGR    R0                              ; D9B3   0020
        SWAP    R0,     1                       ; D9B4   0040
        SWAP    R0,     1                       ; D9B5   0040
        SLR     R0,     1                       ; D9B6   0060
        RSWD    R0                              ; D9B7   0038
        RSWD    R4                              ; D9B8   003C
        SAR     R2,     1                       ; D9B9   006A
        ADDR    R5,     R2                      ; D9BA   00EA
        ADDR    R7,     R6                      ; D9BB   00FE
        ADDR    R7,     R6                      ; D9BC   00FE
        ADDR    R6,     R6                      ; D9BD   00F6
        SARC    R2,     2                       ; D9BE   007E
        RSWD    R4                              ; D9BF   003C
        DIS                                     ; D9C0   0003
        ADDR    R4,     R0                      ; D9C1   00E0
        DECLE   $0000                           ; D9C2   0000

        RSWD    R0                              ; D9C3   0038
        INCR    R4                              ; D9C4   000C

        JSR     R4,     .EXEC.C3C               ; D9C5   0004 001C 003C

        SARC    R2,     2                       ; D9C8   007E
        SARC    R3,     2                       ; D9C9   007F
        ADDR    R7,     R7                      ; D9CA   00FF
        ADDR    R7,     R7                      ; D9CB   00FF
        ADDR    R7,     R7                      ; D9CC   00FF
        ADDR    R7,     R7                      ; D9CD   00FF
        SARC    R2,     2                       ; D9CE   007E
        COMR    R4                              ; D9CF   001C
        ADDR    R4,     R0                      ; D9D0   00E0
        DECLE   $0000                           ; D9D1   0000

        INCR    R6                              ; D9D2   000E
        RRC     R0,     1                       ; D9D3   0070
        COMR    R0                              ; D9D4   0018
        INCR    R0                              ; D9D5   0008
L_D9D6:
        INCR    R0                              ; D9D6   0008
        RSWD    R0                              ; D9D7   0038
        SARC    R0,     2                       ; D9D8   007C
        SARC    R2,     2                       ; D9D9   007E
        ADDR    R7,     R6                      ; D9DA   00FE
        ADDR    R7,     R6                      ; D9DB   00FE
        ADDR    R7,     R6                      ; D9DC   00FE
        ADDR    R7,     R6                      ; D9DD   00FE
        ADDR    R7,     R6                      ; D9DE   00FE
        SARC    R0,     2                       ; D9DF   007C
        RSWD    R4                              ; D9E0   003C
        COMR    R0                              ; D9E1   0018
L_D9E2:
        ADDR    R5,     R6                      ; D9E2   00EE
        SLR     R0,     1                       ; D9E3   0060
        MOVR    R6,     R0                      ; D9E4   00B0
        DECR    R0                              ; D9E5   0010
        DECR    R0                              ; D9E6   0010
        RSWD    R0                              ; D9E7   0038
        RSWD    R4                              ; D9E8   003C
        SARC    R0,     2                       ; D9E9   007C
        SARC    R2,     2                       ; D9EA   007E
        ADDR    R7,     R6                      ; D9EB   00FE
        ADDR    R7,     R6                      ; D9EC   00FE
        ADDR    R7,     R6                      ; D9ED   00FE
        ADDR    R7,     R6                      ; D9EE   00FE
        ADDR    R7,     R4                      ; D9EF   00FC
L_D9F0:
        SARC    R0,     1                       ; D9F0   0078
        INCR    R6                              ; D9F1   000E
        ADDR    R4,     R0                      ; D9F2   00E0
        NEGR    R0                              ; D9F3   0020
        SWAP    R0,     1                       ; D9F4   0040
        SWAP    R0,     1                       ; D9F5   0040
        SLR     R0,     1                       ; D9F6   0060
        RSWD    R0                              ; D9F7   0038
        RSWD    R4                              ; D9F8   003C
        SARC    R2,     2                       ; D9F9   007E
        ADDR    R7,     R6                      ; D9FA   00FE
        ADDR    R7,     R6                      ; D9FB   00FE
        ADDR    R7,     R6                      ; D9FC   00FE
        ADDR    R7,     R6                      ; D9FD   00FE
        SARC    R2,     2                       ; D9FE   007E
        RSWD    R4                              ; D9FF   003C
        DIS                                     ; DA00   0003
        ADDR    R4,     R0                      ; DA01   00E0
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA02   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA06   0000 0000 0000 0000

        COMR    R0                              ; DA0A   0018
        RSWD    R4                              ; DA0B   003C
        RRC     R2,     2                       ; DA0C   0076
        RRC     R2,     2                       ; DA0D   0076
        SARC    R2,     2                       ; DA0E   007E
        SARC    R2,     2                       ; DA0F   007E
        SARC    R2,     2                       ; DA10   007E
        RSWD    R4                              ; DA11   003C
        COMR    R0                              ; DA12   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA13   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; DA17   0000 0000 0000

        COMR    R0                              ; DA1A   0018
        RSWD    R4                              ; DA1B   003C
        SARC    R2,     2                       ; DA1C   007E
        SARC    R2,     2                       ; DA1D   007E
        SARC    R2,     1                       ; DA1E   007A
        SARC    R2,     1                       ; DA1F   007A
        SARC    R2,     2                       ; DA20   007E
        RSWD    R4                              ; DA21   003C
        COMR    R0                              ; DA22   0018
        COMR    R0                              ; DA23   0018
        RSWD    R4                              ; DA24   003C
        SARC    R2,     2                       ; DA25   007E
        SARC    R2,     2                       ; DA26   007E
        SARC    R3,     2                       ; DA27   007F
        ADDR    R7,     R1                      ; DA28   00F9
        ADDR    R1,     R7                      ; DA29   00CF
        ADDR    R7,     R3                      ; DA2A   00FB
        ADDR    R3,     R3                      ; DA2B   00DB
        ADDR    R3,     R7                      ; DA2C   00DF
        ADDR    R7,     R7                      ; DA2D   00FF
        ADDR    R5,     R7                      ; DA2E   00EF
        SARC    R2,     2                       ; DA2F   007E
        SARC    R2,     2                       ; DA30   007E
        NEGR    R6                              ; DA31   0026
        COMR    R4                              ; DA32   001C
        DECLE   $0000                           ; DA33   0000

        COMR    R0                              ; DA34   0018
        RSWD    R4                              ; DA35   003C
        RSWD    R6                              ; DA36   003E
        SARC    R2,     2                       ; DA37   007E
        SARC    R3,     2                       ; DA38   007F
        ADDR    R7,     R7                      ; DA39   00FF
        ADDR    R7,     R7                      ; DA3A   00FF
        ADDR    R7,     R7                      ; DA3B   00FF
        ADDR    R7,     R1                      ; DA3C   00F9
        ADDR    R1,     R7                      ; DA3D   00CF
        ADDR    R7,     R3                      ; DA3E   00FB
        SLLC    R2,     1                       ; DA3F   005A
        SLLC    R2,     2                       ; DA40   005E
        SARC    R0,     2                       ; DA41   007C
        ADCR    R4                              ; DA42   002C
        DECLE   $0000                           ; DA43   0000

        COMR    R4                              ; DA44   001C
        RSWD    R6                              ; DA45   003E
        SARC    R2,     2                       ; DA46   007E
        SARC    R3,     2                       ; DA47   007F
        ADDR    R7,     R7                      ; DA48   00FF
        ADDR    R7,     R7                      ; DA49   00FF
        ADDR    R7,     R7                      ; DA4A   00FF
        ADDR    R7,     R7                      ; DA4B   00FF
        ADDR    R7,     R7                      ; DA4C   00FF
        ADDR    R7,     R7                      ; DA4D   00FF
        ADDR    R7,     R7                      ; DA4E   00FF
        SARC    R3,     2                       ; DA4F   007F
        SARC    R0,     1                       ; DA50   0078
        INCR    R6                              ; DA51   000E
        COMR    R4                              ; DA52   001C
        DECLE   $0000                           ; DA53   0000

        INCR    R4                              ; DA54   000C
        RSWD    R6                              ; DA55   003E
        SARC    R3,     2                       ; DA56   007F
        SARC    R3,     2                       ; DA57   007F
        ADDR    R7,     R7                      ; DA58   00FF
        ADDR    R7,     R7                      ; DA59   00FF
        ADDR    R7,     R7                      ; DA5A   00FF
        ADDR    R7,     R7                      ; DA5B   00FF
        ADDR    R7,     R7                      ; DA5C   00FF
        ADDR    R7,     R7                      ; DA5D   00FF
        SARC    R3,     2                       ; DA5E   007F
        SARC    R2,     2                       ; DA5F   007E
        RSWD    R6                              ; DA60   003E
        RSWD    R4                              ; DA61   003C
        COMR    R0                              ; DA62   0018
        DECLE   $0000,  $0000                   ; DA63   0000 0000

        RSWD    R4                              ; DA65   003C
        RRC     R2,     2                       ; DA66   0076
        SLLC    R3,     2                       ; DA67   005F
        SLR     R1,     1                       ; DA68   0061
        ADDR    R7,     R7                      ; DA69   00FF
        ADDR    R6,     R7                      ; DA6A   00F7
        ADDR    R7,     R7                      ; DA6B   00FF
        ADDR    R7,     R7                      ; DA6C   00FF
        ADDR    R7,     R7                      ; DA6D   00FF
        ADDR    R7,     R7                      ; DA6E   00FF
        SARC    R3,     2                       ; DA6F   007F
        RSWD    R6                              ; DA70   003E
        RSWD    R6                              ; DA71   003E
        INCR    R4                              ; DA72   000C
        DECLE   $0000,  $0000                   ; DA73   0000 0000

        INCR    R4                              ; DA75   000C
        RSWD    R2                              ; DA76   003A
        SLLC    R2,     1                       ; DA77   005A
        SLLC    R3,     2                       ; DA78   005F
        SAR     R3,     2                       ; DA79   006F
        ADDR    R7,     R7                      ; DA7A   00FF
        ADDR    R0,     R3                      ; DA7B   00C3
        MOVR    R0,     R7                      ; DA7C   0087
        ADDR    R7,     R7                      ; DA7D   00FF
        ADDR    R5,     R7                      ; DA7E   00EF
        SARC    R3,     2                       ; DA7F   007F
        SARC    R3,     2                       ; DA80   007F
        RSWD    R6                              ; DA81   003E
        COMR    R6                              ; DA82   001E
        DECLE   $0000                           ; DA83   0000

        COMR    R4                              ; DA84   001C
        RSWD    R0                              ; DA85   0038
        INCR    R6                              ; DA86   000E
        SARC    R3,     1                       ; DA87   007B
        SLLC    R3,     1                       ; DA88   005B
L_DA89:
        SLLC    R3,     2                       ; DA89   005F
        ADDR    R7,     R7                      ; DA8A   00FF
        ADDR    R5,     R7                      ; DA8B   00EF
        ADDR    R7,     R7                      ; DA8C   00FF
        MOVR    R0,     R3                      ; DA8D   0083
        ADDR    R0,     R7                      ; DA8E   00C7
        ADDR    R7,     R7                      ; DA8F   00FF
        SAR     R2,     2                       ; DA90   006E
        SARC    R2,     2                       ; DA91   007E
        RSWD    R4                              ; DA92   003C
        COMR    R4                              ; DA93   001C
        RSWD    R6                              ; DA94   003E
        RSWD    R6                              ; DA95   003E
        RSWD    R1                              ; DA96   0039
        SLL     R3,     2                       ; DA97   004F
        SARC    R3,     1                       ; DA98   007B
        SLLC    R3,     1                       ; DA99   005B
        ADDR    R3,     R7                      ; DA9A   00DF
        ADDR    R7,     R7                      ; DA9B   00FF
        ADDR    R5,     R7                      ; DA9C   00EF
        ADDR    R7,     R7                      ; DA9D   00FF
        ADDR    R7,     R3                      ; DA9E   00FB
        ADDR    R0,     R7                      ; DA9F   00C7
        SARC    R2,     2                       ; DAA0   007E
        SAR     R2,     2                       ; DAA1   006E
        RSWD    R4                              ; DAA2   003C
        DECLE   $0000,  $0000                   ; DAA3   0000 0000

        COMR    R4                              ; DAA5   001C
        RSWD    R6                              ; DAA6   003E
        RSWD    R7                              ; DAA7   003F
L_DAA8:
        SARC    R3,     2                       ; DAA8   007F
L_DAA9:
        SLL     R3,     2                       ; DAA9   004F
L_DAAA:
        SARC    R3,     2                       ; DAAA   007F
L_DAAB:
        ADDR    R3,     R7                      ; DAAB   00DF
        ADDR    R3,     R7                      ; DAAC   00DF
        SARC    R3,     2                       ; DAAD   007F
        SARC    R2,     2                       ; DAAE   007E
        SAR     R2,     2                       ; DAAF   006E
        COMR    R6                              ; DAB0   001E
        RSWD    R4                              ; DAB1   003C
        COMR    R4                              ; DAB2   001C
        DECLE   $0000,  $0000                   ; DAB3   0000 0000

        COMR    R4                              ; DAB5   001C
        RSWD    R6                              ; DAB6   003E
        SARC    R2,     2                       ; DAB7   007E
        SARC    R3,     2                       ; DAB8   007F
        ADDR    R7,     R7                      ; DAB9   00FF
L_DABA:
        ADDR    R7,     R7                      ; DABA   00FF
        ADDR    R1,     R7                      ; DABB   00CF
        ADDR    R7,     R7                      ; DABC   00FF
        SLLC    R2,     2                       ; DABD   005E
        SLLC    R2,     2                       ; DABE   005E
        ADDR    R7,     R6                      ; DABF   00FE
        ADDR    R7,     R4                      ; DAC0   00FC
        SAR     R0,     2                       ; DAC1   006C
        COMR    R0                              ; DAC2   0018
        DECLE   $0000,  $0000                   ; DAC3   0000 0000

        RSWD    R0                              ; DAC5   0038
        SARC    R0,     2                       ; DAC6   007C
        SARC    R2,     2                       ; DAC7   007E
        ADDR    R7,     R7                      ; DAC8   00FF
        ADDR    R7,     R7                      ; DAC9   00FF
        ADDR    R7,     R7                      ; DACA   00FF
        ADDR    R7,     R7                      ; DACB   00FF
        ADDR    R3,     R7                      ; DACC   00DF
        TSTR    R7                              ; DACD   00BF
        ADDR    R7,     R3                      ; DACE   00FB
        ADDR    R3,     R5                      ; DACF   00DD
        SLLC    R0,     2                       ; DAD0   005C
        RRC     R0,     2                       ; DAD1   0074
        GSWD    R0                              ; DAD2   0030
        DECLE   $0000,  $0000                   ; DAD3   0000 0000

        COMR    R4                              ; DAD5   001C
        RSWD    R6                              ; DAD6   003E
        SARC    R3,     2                       ; DAD7   007F
        SARC    R3,     2                       ; DAD8   007F
        ADDR    R7,     R7                      ; DAD9   00FF
        ADDR    R7,     R6                      ; DADA   00FE
        ADDR    R7,     R7                      ; DADB   00FF
        ADDR    R7,     R4                      ; DADC   00FC
        ADDR    R7,     R2                      ; DADD   00FA
        SARC    R3,     2                       ; DADE   007F
        SARC    R3,     2                       ; DADF   007F
        DECLE   $0037                           ; DAE0   0037

        NOP                                     ; DAE1   0034
        COMR    R4                              ; DAE2   001C
        DECLE   $0000,  $0000                   ; DAE3   0000 0000

        RSWD    R0                              ; DAE5   0038
        SARC    R0,     2                       ; DAE6   007C
        SARC    R2,     2                       ; DAE7   007E
        ADDR    R7,     R6                      ; DAE8   00FE
        ADDR    R7,     R0                      ; DAE9   00F8
        ADDR    R6,     R6                      ; DAEA   00F6
        ADDR    R7,     R7                      ; DAEB   00FF
        ADDR    R7,     R7                      ; DAEC   00FF
        ADDR    R7,     R2                      ; DAED   00FA
        ADDR    R7,     R2                      ; DAEE   00FA
        ADDR    R7,     R6                      ; DAEF   00FE
        RRC     R2,     1                       ; DAF0   0072
        SARC    R0,     2                       ; DAF1   007C
        RSWD    R0                              ; DAF2   0038
        DECLE   $0000                           ; DAF3   0000

        INCR    R0                              ; DAF4   0008
        RSWD    R3                              ; DAF5   003B
        RRC     R3,     2                       ; DAF6   0077
        RRC     R3,     2                       ; DAF7   0077
        SARC    R2,     2                       ; DAF8   007E
        ADDR    R7,     R7                      ; DAF9   00FF
        ADDR    R7,     R5                      ; DAFA   00FD
        ADDR    R7,     R5                      ; DAFB   00FD
        ADDR    R7,     R7                      ; DAFC   00FF
        ADDR    R7,     R1                      ; DAFD   00F9
        ADDR    R7,     R7                      ; DAFE   00FF
        SARC    R2,     2                       ; DAFF   007E
        SARC    R2,     2                       ; DB00   007E
        COMR    R4                              ; DB01   001C
        DECLE   $0000                           ; DB02   0000

        COMR    R0                              ; DB03   0018
        COMR    R0                              ; DB04   0018
        RSWD    R6                              ; DB05   003E
        RSWD    R1                              ; DB06   0039
        MOVR    R7,     R3                      ; DB07   00BB
        ADDR    R3,     R7                      ; DB08   00DF
        ADDR    R7,     R7                      ; DB09   00FF
        ADDR    R7,     R7                      ; DB0A   00FF
        ADDR    R7,     R7                      ; DB0B   00FF
        ADDR    R7,     R7                      ; DB0C   00FF
        ADDR    R7,     R7                      ; DB0D   00FF
        SARC    R2,     2                       ; DB0E   007E
        SARC    R2,     2                       ; DB0F   007E
        RSWD    R4                              ; DB10   003C
        DECLE   $0000,  $0000                   ; DB11   0000 0000

        COMR    R4                              ; DB13   001C
        ADCR    R6                              ; DB14   002E
        DECLE   $0036                           ; DB15   0036

        SLLC    R3,     2                       ; DB16   005F
        SLLC    R3,     2                       ; DB17   005F
        ADDR    R7,     R7                      ; DB18   00FF
L_DB19:
        ADDR    R7,     R7                      ; DB19   00FF
        SAR     R3,     2                       ; DB1A   006F
        COMR    R7                              ; DB1B   001F
        COMR    R7                              ; DB1C   001F
        SARC    R3,     2                       ; DB1D   007F
        SARC    R3,     2                       ; DB1E   007F
        RSWD    R6                              ; DB1F   003E
        COMR    R4                              ; DB20   001C
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB21   0000 0000 0000 0000

        DECR    R0                              ; DB25   0010
        SWAP    R0,     1                       ; DB26   0040
        EIS                                     ; DB27   0002
        MOVR    R2,     R0                      ; DB28   0090

        JSR     R4,     .ECSRAM.011             ; DB29   0004 0040 0011

        TSTR    R0                              ; DB2C   0080
        DECLE   $0000                           ; DB2D   0000

        SWAP    R1,     2                       ; DB2E   0045
        MOVR    R2,     R0                      ; DB2F   0090
        DECLE   $0000                           ; DB30   0000

        NEGR    R0                              ; DB31   0020
        DECLE   $0000                           ; DB32   0000

        NEGR    R0                              ; DB33   0020
        RLC     R0,     1                       ; DB34   0050
        DECR    R0                              ; DB35   0010
        NEGR    R0                              ; DB36   0020
        SWAP    R0,     1                       ; DB37   0040
        SLL     R0,     1                       ; DB38   0048
        RRC     R0,     2                       ; DB39   0074
        DECR    R4                              ; DB3A   0014
        DECR    R4                              ; DB3B   0014
        DECR    R4                              ; DB3C   0014
        INCR    R2                              ; DB3D   000A
        DECLE   $0005,  $0005,  $0005,  $0005   ; DB3E   0005 0005 0005 0005

        EIS                                     ; DB42   0002
        ADDR    R4,     R0                      ; DB43   00E0
        TSTR    R0                              ; DB44   0080
        ADDR    R0,     R0                      ; DB45   00C0
        NEGR    R0                              ; DB46   0020
        MOVR    R4,     R0                      ; DB47   00A0
        RLC     R0,     1                       ; DB48   0050
        ADCR    R0                              ; DB49   0028
        ADCR    R0                              ; DB4A   0028
        ADCR    R0                              ; DB4B   0028
        ADCR    R0                              ; DB4C   0028
        DECR    R4                              ; DB4D   0014
        INCR    R2                              ; DB4E   000A
        INCR    R2                              ; DB4F   000A
        INCR    R2                              ; DB50   000A
        INCR    R2                              ; DB51   000A

        JSR     R4,     G_0040                  ; DB52   0004 0000 0040

        ADDR    R0,     R0                      ; DB55   00C0
        SWAP    R0,     1                       ; DB56   0040
        SWAP    R0,     1                       ; DB57   0040
        SWAP    R0,     1                       ; DB58   0040
L_DB59:
        SLL     R1,     1                       ; DB59   0049
        SLL     R2,     1                       ; DB5A   004A
        SLL     R2,     1                       ; DB5B   004A
L_DB5C:
        ADDR    R5,     R4                      ; DB5C   00EC
        INCR    R4                              ; DB5D   000C
L_DB5E:
        INCR    R2                              ; DB5E   000A
        INCR    R2                              ; DB5F   000A
        INCR    R1                              ; DB60   0009
        INCR    R1                              ; DB61   0009
        DECLE   $0000                           ; DB62   0000
L_DB63:
        DECLE   $0000                           ; DB63   0000

        SWAP    R0,     1                       ; DB64   0040
        MOVR    R4,     R0                      ; DB65   00A0
        NEGR    R0                              ; DB66   0020
        NEGR    R0                              ; DB67   0020
        SWAP    R0,     1                       ; DB68   0040
        TSTR    R1                              ; DB69   0089
        MOVR    R1,     R2                      ; DB6A   008A
        MOVR    R1,     R2                      ; DB6B   008A
        ADDR    R5,     R4                      ; DB6C   00EC
        INCR    R4                              ; DB6D   000C
        INCR    R2                              ; DB6E   000A
        INCR    R2                              ; DB6F   000A
        INCR    R1                              ; DB70   0009
L_DB71:
        INCR    R1                              ; DB71   0009
        DECLE   $0000,  $0000                   ; DB72   0000 0000

        MOVR    R4,     R0                      ; DB74   00A0
        MOVR    R4,     R0                      ; DB75   00A0
        MOVR    R4,     R0                      ; DB76   00A0
        MOVR    R4,     R0                      ; DB77   00A0
        ADDR    R4,     R0                      ; DB78   00E0
L_DB79:
        ADCR    R1                              ; DB79   0029
        ADCR    R2                              ; DB7A   002A
        ADCR    R2                              ; DB7B   002A
        ADCR    R4                              ; DB7C   002C
        INCR    R4                              ; DB7D   000C
        INCR    R2                              ; DB7E   000A
        INCR    R2                              ; DB7F   000A
        INCR    R1                              ; DB80   0009
        INCR    R1                              ; DB81   0009
        DECLE   $0000,  $0000                   ; DB82   0000 0000

        SWAP    R0,     1                       ; DB84   0040
        MOVR    R4,     R0                      ; DB85   00A0
        MOVR    R4,     R0                      ; DB86   00A0
        SWAP    R0,     1                       ; DB87   0040
L_DB88:
        MOVR    R4,     R0                      ; DB88   00A0
        MOVR    R5,     R1                      ; DB89   00A9
L_DB8A:
        MOVR    R5,     R2                      ; DB8A   00AA
        MOVR    R5,     R2                      ; DB8B   00AA
        SLL     R0,     2                       ; DB8C   004C
        INCR    R4                              ; DB8D   000C
        INCR    R2                              ; DB8E   000A
        INCR    R2                              ; DB8F   000A
        INCR    R1                              ; DB90   0009
        INCR    R1                              ; DB91   0009
        DECLE   $0000                           ; DB92   0000

        ADDR    R7,     R7                      ; DB93   00FF
        ADDR    R7,     R7                      ; DB94   00FF
        ADDR    R7,     R7                      ; DB95   00FF
        ADDR    R7,     R7                      ; DB96   00FF
        ADDR    R7,     R7                      ; DB97   00FF
        ADDR    R7,     R7                      ; DB98   00FF
        ADDR    R7,     R7                      ; DB99   00FF
        ADDR    R7,     R7                      ; DB9A   00FF
        ADDR    R7,     R7                      ; DB9B   00FF
        ADDR    R7,     R7                      ; DB9C   00FF
        ADDR    R7,     R7                      ; DB9D   00FF
        ADDR    R7,     R7                      ; DB9E   00FF
        ADDR    R7,     R7                      ; DB9F   00FF
        ADDR    R7,     R7                      ; DBA0   00FF
        ADDR    R7,     R7                      ; DBA1   00FF
        ADDR    R7,     R7                      ; DBA2   00FF
        ADDR    R7,     R7                      ; DBA3   00FF
        ADDR    R7,     R7                      ; DBA4   00FF
        ADDR    R7,     R7                      ; DBA5   00FF
        ADDR    R7,     R6                      ; DBA6   00FE
        ADDR    R7,     R4                      ; DBA7   00FC
        ADDR    R7,     R0                      ; DBA8   00F8
        ADDR    R6,     R1                      ; DBA9   00F1
        ADDR    R4,     R3                      ; DBAA   00E3
L_DBAB:
        ADDR    R0,     R7                      ; DBAB   00C7
L_DBAC:
        MOVR    R1,     R7                      ; DBAC   008F
        COMR    R7                              ; DBAD   001F
        RSWD    R7                              ; DBAE   003F
        SARC    R3,     2                       ; DBAF   007F
        ADDR    R7,     R7                      ; DBB0   00FF
        ADDR    R7,     R7                      ; DBB1   00FF
        ADDR    R7,     R7                      ; DBB2   00FF
        ADDR    R7,     R7                      ; DBB3   00FF
        ADDR    R7,     R7                      ; DBB4   00FF
        ADDR    R7,     R6                      ; DBB5   00FE
        ADDR    R7,     R4                      ; DBB6   00FC
        ADDR    R7,     R0                      ; DBB7   00F8
        ADDR    R6,     R0                      ; DBB8   00F0
L_DBB9:
        ADDR    R4,     R0                      ; DBB9   00E0
        ADDR    R0,     R1                      ; DBBA   00C1
        MOVR    R0,     R3                      ; DBBB   0083
        SETC                                    ; DBBC   0007
        INCR    R7                              ; DBBD   000F
        COMR    R7                              ; DBBE   001F
        RSWD    R7                              ; DBBF   003F
        SARC    R3,     2                       ; DBC0   007F
        ADDR    R7,     R7                      ; DBC1   00FF
        ADDR    R7,     R7                      ; DBC2   00FF
        ADDR    R7,     R7                      ; DBC3   00FF
        ADDR    R7,     R6                      ; DBC4   00FE
        ADDR    R7,     R4                      ; DBC5   00FC
        ADDR    R7,     R0                      ; DBC6   00F8
        ADDR    R6,     R0                      ; DBC7   00F0
        ADDR    R4,     R0                      ; DBC8   00E0
        ADDR    R0,     R0                      ; DBC9   00C0
        TSTR    R0                              ; DBCA   0080
        DECLE   $0001                           ; DBCB   0001

        DIS                                     ; DBCC   0003
        SETC                                    ; DBCD   0007
        INCR    R7                              ; DBCE   000F
        COMR    R7                              ; DBCF   001F
        RSWD    R7                              ; DBD0   003F
        SARC    R3,     2                       ; DBD1   007F
        ADDR    R7,     R7                      ; DBD2   00FF
        ADDR    R7,     R6                      ; DBD3   00FE
        ADDR    R7,     R4                      ; DBD4   00FC
        ADDR    R7,     R0                      ; DBD5   00F8
        ADDR    R6,     R0                      ; DBD6   00F0
        ADDR    R4,     R0                      ; DBD7   00E0
        ADDR    R0,     R0                      ; DBD8   00C0
        TSTR    R0                              ; DBD9   0080
        DECLE   $0000,  $0000,  $0001           ; DBDA   0000 0000 0001

        DIS                                     ; DBDD   0003
        SETC                                    ; DBDE   0007
        INCR    R7                              ; DBDF   000F
        COMR    R7                              ; DBE0   001F
        RSWD    R7                              ; DBE1   003F
        SARC    R3,     2                       ; DBE2   007F
        ADDR    R7,     R7                      ; DBE3   00FF
        ADDR    R7,     R6                      ; DBE4   00FE
        ADDR    R7,     R4                      ; DBE5   00FC
        ADDR    R7,     R0                      ; DBE6   00F8
        ADDR    R6,     R0                      ; DBE7   00F0
        ADDR    R4,     R0                      ; DBE8   00E0
        ADDR    R0,     R0                      ; DBE9   00C0
        TSTR    R0                              ; DBEA   0080
        DECLE   $0001                           ; DBEB   0001

        DIS                                     ; DBEC   0003
        SETC                                    ; DBED   0007
        INCR    R7                              ; DBEE   000F
        COMR    R7                              ; DBEF   001F
        RSWD    R7                              ; DBF0   003F
        SARC    R3,     2                       ; DBF1   007F
        ADDR    R7,     R7                      ; DBF2   00FF
        ADDR    R7,     R7                      ; DBF3   00FF
        ADDR    R7,     R7                      ; DBF4   00FF
L_DBF5:
        ADDR    R7,     R6                      ; DBF5   00FE
        ADDR    R7,     R4                      ; DBF6   00FC
        ADDR    R7,     R0                      ; DBF7   00F8
        ADDR    R6,     R0                      ; DBF8   00F0
        ADDR    R4,     R0                      ; DBF9   00E0
        ADDR    R0,     R1                      ; DBFA   00C1
        MOVR    R0,     R3                      ; DBFB   0083
        SETC                                    ; DBFC   0007
        INCR    R7                              ; DBFD   000F
        COMR    R7                              ; DBFE   001F
        RSWD    R7                              ; DBFF   003F
        SARC    R3,     2                       ; DC00   007F
        ADDR    R7,     R7                      ; DC01   00FF
        ADDR    R7,     R7                      ; DC02   00FF
        ADDR    R7,     R7                      ; DC03   00FF
        ADDR    R7,     R7                      ; DC04   00FF
        ADDR    R7,     R7                      ; DC05   00FF
        ADDR    R7,     R6                      ; DC06   00FE
        ADDR    R7,     R4                      ; DC07   00FC
        ADDR    R7,     R0                      ; DC08   00F8
        ADDR    R6,     R1                      ; DC09   00F1
        ADDR    R4,     R3                      ; DC0A   00E3
        ADDR    R0,     R7                      ; DC0B   00C7
        MOVR    R1,     R7                      ; DC0C   008F
        COMR    R7                              ; DC0D   001F
        RSWD    R7                              ; DC0E   003F
        SARC    R3,     2                       ; DC0F   007F
        ADDR    R7,     R7                      ; DC10   00FF
        ADDR    R7,     R7                      ; DC11   00FF
        ADDR    R7,     R7                      ; DC12   00FF
        SUBR    R4,     R6                      ; DC13   0126
        BGT     L_D8F7                          ; DC14   022E 031E

        SUB@    R3,     R6                      ; DC16   031E
        SUB@    R3,     R6                      ; DC17   031E
        SUB@    R6,     R2                      ; DC18   0332
        SUBR    R4,     R6                      ; DC19   0126
        SUBR    R4,     R6                      ; DC1A   0126
        SUBR    R4,     R6                      ; DC1B   0126
        SUBR    R4,     R6                      ; DC1C   0126
        SUBR    R4,     R6                      ; DC1D   0126
        SUBR    R4,     R6                      ; DC1E   0126
        SUBR    R4,     R6                      ; DC1F   0126
        SUBR    R4,     R6                      ; DC20   0126
        SUBR    R4,     R6                      ; DC21   0126
        SUBR    R4,     R6                      ; DC22   0126
        BGT     L_D8F2                          ; DC23   022E 0332
        BGT     L_D908                          ; DC25   022E 031E
        BGT     L_DC38                          ; DC27   020E 000F

        DECLE   $0000                           ; DC29   0000
L_DC2A:
        DECLE   $0000                           ; DC2A   0000

        DECR    R2                              ; DC2B   0012
        SUBR    R4,     R6                      ; DC2C   0126
        BGT     L_DF32                          ; DC2D   020E 0303

        SUB@    R2,     R2                      ; DC2F   0312
        SUBR    R4,     R6                      ; DC30   0126
        BGT     L_DF56                          ; DC31   020E 0323

        SUB@    R4,     R3                      ; DC33   0323
        SUB@    R4,     R3                      ; DC34   0323
        SUB@    R4,     R3                      ; DC35   0323
        SUB@    R4,     R3                      ; DC36   0323
        DECLE   $0212                           ; DC37   0212
L_DC38:
        BGT     L_DE3C                          ; DC38   020E 0202

        SUB     G_031E, R0                      ; DC3A   0300 031E
        SUB@    R6,     R2                      ; DC3C   0332
        SUBR    R4,     R6                      ; DC3D   0126
        SUBR    R4,     R6                      ; DC3E   0126
        SUBR    R4,     R6                      ; DC3F   0126
        SUBR    R4,     R6                      ; DC40   0126
L_DC41:
        SUBR    R4,     R6                      ; DC41   0126
        SUBR    R1,     R2                      ; DC42   010A
        SUB@    R4,     R3                      ; DC43   0323
        SUB@    R6,     R6                      ; DC44   0336
        BOV     L_DF4E                          ; DC45   0202 0307

        DECLE   $0210,  $0000,  $0000           ; DC47   0210 0000 0000

        SUB@    R1,     R0                      ; DC4A   0308
        SUB@    R6,     R6                      ; DC4B   0336
        BOV     L_DE60                          ; DC4C   0202 0212

        SUBR    R4,     R6                      ; DC4E   0126
        DECR    R2                              ; DC4F   0012
        SUBR    R4,     R6                      ; DC50   0126
        SUBR    R4,     R6                      ; DC51   0126
        SUBR    R4,     R6                      ; DC52   0126
        SUBR    R4,     R6                      ; DC53   0126
        SUBR    R4,     R6                      ; DC54   0126
L_DC55:
        SUBR    R4,     R6                      ; DC55   0126
        SUBR    R1,     R2                      ; DC56   010A
        SUB     G_0336, R3                      ; DC57   0303 0336
        DECLE   $0212                           ; DC59   0212

        SUBR    R4,     R6                      ; DC5A   0126
        SUBR    R4,     R6                      ; DC5B   0126
        SUBR    R4,     R6                      ; DC5C   0126
        SUBR    R4,     R6                      ; DC5D   0126
        SUBR    R4,     R6                      ; DC5E   0126
        SUB@    R6,     R6                      ; DC5F   0336
        MVO     R2,     .BTAB.3E                ; DC60   0242 023E
        SUBR    R4,     R6                      ; DC62   0126
        SUB@    R6,     R6                      ; DC63   0336
        SUB@    R4,     R3                      ; DC64   0323
        SUB@    R4,     R3                      ; DC65   0323
        SUB@    R4,     R3                      ; DC66   0323
        SUB@    R4,     R3                      ; DC67   0323
        SUB@    R4,     R3                      ; DC68   0323
        DECLE   $021A                           ; DC69   021A

        SUBR    R4,     R6                      ; DC6A   0126
        SUBR    R4,     R6                      ; DC6B   0126
        SUBR    R4,     R6                      ; DC6C   0126
        SUBR    R4,     R6                      ; DC6D   0126
        SUBR    R4,     R6                      ; DC6E   0126
        SUBR    R4,     R6                      ; DC6F   0126
        SUBR    R4,     R6                      ; DC70   0126
        SUBR    R4,     R6                      ; DC71   0126
        SUBR    R4,     R6                      ; DC72   0126
        SUBR    R4,     R6                      ; DC73   0126
        DECLE   $023A                           ; DC74   023A

        MVO     R6,     .BTAB.02                ; DC75   0246 0202
        SUB@    R6,     R6                      ; DC77   0336
        DECLE   $0210                           ; DC78   0210

        SUB     G_0373, R0                      ; DC79   0300 0373
        CMP@    R6,     R7                      ; DC7B   0377
        SUB     G_031B, R0                      ; DC7C   0300 031B
        SUB@    R6,     R6                      ; DC7E   0336
        SUB@    R4,     R3                      ; DC7F   0323
        DECLE   $021A                           ; DC80   021A

        BLE     L_DB5C                          ; DC81   0226 0126
        BLE     L_DB5E                          ; DC83   0226 0126

        SUBR    R4,     R6                      ; DC85   0126
        SUBR    R4,     R6                      ; DC86   0126
        SUB@    R5,     R6                      ; DC87   032E
        BNOV    L_DB63                          ; DC88   022A 0126

        SUBR    R4,     R6                      ; DC8A   0126
        SUBR    R4,     R6                      ; DC8B   0126
        CMP@    R3,     R2                      ; DC8C   035A
        CMP@    R2,     R6                      ; DC8D   0356
        SUB     G_0300, R0                      ; DC8E   0300 0300
        SUB     G_0302, R0                      ; DC90   0300 0302
        SUB@    R6,     R6                      ; DC92   0336
        SUB     G_031B, R3                      ; DC93   0303 031B
        DECLE   $021A                           ; DC95   021A

        BLE     L_DB71                          ; DC96   0226 0126

        SUBR    R4,     R6                      ; DC98   0126
        SUB@    R4,     R6                      ; DC99   0326
        BGT     L_DF9C                          ; DC9A   020E 0300

        MVO     R2,     .BTAB.3E                ; DC9C   0242 023E
        SUBR    R4,     R6                      ; DC9E   0126
        SUB@    R6,     R6                      ; DC9F   0336
        CMP@    R2,     R2                      ; DCA0   0352
        CMP@    R3,     R6                      ; DCA1   035E
        SUBR    R4,     R6                      ; DCA2   0126
        SUBR    R4,     R6                      ; DCA3   0126
        SUBR    R4,     R6                      ; DCA4   0126
        SUBR    R4,     R6                      ; DCA5   0126
        CMP@    R3,     R2                      ; DCA6   035A
        CMP@    R2,     R6                      ; DCA7   0356
        SUB     G_031B, R0                      ; DCA8   0300 031B
        SUB@    R4,     R3                      ; DCAA   0323
        SUB@    R4,     R3                      ; DCAB   0323
        SUB@    R4,     R3                      ; DCAC   0323
        SUB@    R4,     R3                      ; DCAD   0323
        BOV     L_DDC2                          ; DCAE   0202 0112

        DECLE   $023A                           ; DCB0   023A

        MVO     R6,     .BTAB.02                ; DCB1   0246 0202
        SUB@    R6,     R6                      ; DCB3   0336
        SUB     G_0323, R0                      ; DCB4   0300 0323
        SUB@    R4,     R3                      ; DCB6   0323
        SUB@    R6,     R6                      ; DCB7   0336
        SUB@    R4,     R3                      ; DCB8   0323
        SUB@    R4,     R3                      ; DCB9   0323
        CMP@    R2,     R2                      ; DCBA   0352
        CMP@    R3,     R6                      ; DCBB   035E
        SUB@    R4,     R6                      ; DCBC   0326
        BGT     L_DFBF                          ; DCBD   020E 0300

        DECLE   $0210,  $0000                   ; DCBF   0210 0000

        SUB     .BTAB.12,R0                     ; DCC1   0300 0212
        SUBR    R4,     R6                      ; DCC3   0126
        SUBR    R4,     R6                      ; DCC4   0126
        SUBR    R4,     R6                      ; DCC5   0126
        SUBR    R4,     R6                      ; DCC6   0126
        SUBR    R4,     R6                      ; DCC7   0126
        SUBR    R4,     R6                      ; DCC8   0126
        BGT     L_D9AC                          ; DCC9   022E 031E

        SUB@    R3,     R6                      ; DCCB   031E
        SUB@    R6,     R2                      ; DCCC   0332
        BLE     L_DAA8                          ; DCCD   0226 0226
        BLE     L_DAAA                          ; DCCF   0226 0226
        BLE     L_DBAC                          ; DCD1   0226 0126

        SUBR    R4,     R6                      ; DCD3   0126
        SUBR    R4,     R6                      ; DCD4   0126
        SUBR    R4,     R6                      ; DCD5   0126
        BGT     L_DFD8                          ; DCD6   020E 0300

L_DCD8:
        SUB     .BTAB.1A,R0                     ; DCD8   0300 021A
        SUBR    R4,     R6                      ; DCDA   0126
        SUB@    R4,     R3                      ; DCDB   0323
        SUB@    R4,     R3                      ; DCDC   0323
        BOV     L_DFE1                          ; DCDD   0202 0302

        SUB     G_0322, R2                      ; DCDF   0302 0322
        SUB@    R4,     R2                      ; DCE1   0322
        SUB@    R4,     R2                      ; DCE2   0322
        SUB@    R4,     R2                      ; DCE3   0322
        SUB@    R4,     R2                      ; DCE4   0322
        SUB@    R4,     R3                      ; DCE5   0323
        SUB@    R4,     R3                      ; DCE6   0323
        SUB@    R4,     R3                      ; DCE7   0323
        SUB@    R4,     R3                      ; DCE8   0323
        SUB@    R4,     R3                      ; DCE9   0323
        BPL     L_DFEC                          ; DCEA   0203 0300

        SUB     .BTAB.03,R0                     ; DCEC   0300 0203
        SUB@    R4,     R3                      ; DCEE   0323
        SUB@    R3,     R6                      ; DCEF   031E
        SUB@    R3,     R6                      ; DCF0   031E
        SUB@    R3,     R6                      ; DCF1   031E
        SUB@    R6,     R2                      ; DCF2   0332
        BGT     L_D9D6                          ; DCF3   022E 031E

        SUB@    R3,     R6                      ; DCF5   031E
        SUB@    R6,     R2                      ; DCF6   0332
        SUBR    R4,     R6                      ; DCF7   0126
        SUBR    R4,     R6                      ; DCF8   0126
        SUBR    R4,     R6                      ; DCF9   0126
        SUBR    R4,     R6                      ; DCFA   0126
        SUBR    R4,     R6                      ; DCFB   0126
        SUBR    R4,     R6                      ; DCFC   0126
        SUBR    R4,     R6                      ; DCFD   0126
        SUBR    R4,     R6                      ; DCFE   0126
        BGT     L_D9E2                          ; DCFF   022E 031E

        SUB@    R6,     R2                      ; DD01   0332
        SUBR    R4,     R6                      ; DD02   0126
        SUB     G_0310, R2                      ; DD03   0302 0310
        DECR    R2                              ; DD05   0012
        BGT     L_DF18                          ; DD06   020E 0210

        DECLE   $0000                           ; DD08   0000

        DECR    R2                              ; DD09   0012
        BGT     G_E042                          ; DD0A   020E 0336

        SUB@    R4,     R3                      ; DD0C   0323
        SUB@    R4,     R3                      ; DD0D   0323
        SUB@    R4,     R3                      ; DD0E   0323
        SUB@    R4,     R3                      ; DD0F   0323
        SUB@    R4,     R3                      ; DD10   0323
        SUB@    R4,     R3                      ; DD11   0323
        SUB@    R4,     R3                      ; DD12   0323
        BOV     L_DF27                          ; DD13   0202 0212
        BGT     L_D9F0                          ; DD15   022E 0326

        SUBR    R4,     R6                      ; DD17   0126
        SUBR    R4,     R6                      ; DD18   0126
        SUB@    R5,     R6                      ; DD19   032E
        BNOV    L_DBF5                          ; DD1A   022A 0126

        SUBR    R4,     R6                      ; DD1C   0126
        BGT     L_DF21                          ; DD1D   020E 0202

        SUB@    R6,     R6                      ; DD1F   0336
        SUB     .BTAB.12,R0                     ; DD20   0300 0212
        SUB     .BTAB.12,R0                     ; DD22   0300 0212
        SUB     .BTAB.12,R0                     ; DD24   0300 0212
        SUB     .BTAB.02,R0                     ; DD26   0300 0202
        SUB@    R6,     R6                      ; DD28   0336
        DECLE   $0212                           ; DD29   0212

        SUB@    R4,     R6                      ; DD2A   0326
        SUBR    R4,     R6                      ; DD2B   0126
        SUB@    R1,     R6                      ; DD2C   030E
        SUB     .BTAB.02,R0                     ; DD2D   0300 0202
        SUB@    R6,     R6                      ; DD2F   0336
        SUB@    R4,     R3                      ; DD30   0323
        BOV     L_DF35                          ; DD31   0202 0202

        SUB@    R6,     R6                      ; DD33   0336
        SUB     G_0300, R0                      ; DD34   0300 0300
        SUB     G_0300, R0                      ; DD36   0300 0300
        SUB     G_0300, R0                      ; DD38   0300 0300
        SUB     .BTAB.12,R0                     ; DD3A   0300 0212
        SUBR    R4,     R6                      ; DD3C   0126
        BGT     G_E042                          ; DD3D   020E 0303
        BOV     G_E043                          ; DD3F   0202 0302

        SUB     .BTAB.02,R0                     ; DD41   0300 0202
        SUB@    R6,     R6                      ; DD43   0336
        SUB     .BTAB.02,R0                     ; DD44   0300 0202
        DECLE   $0212                           ; DD46   0212

        SUBR    R4,     R6                      ; DD47   0126
        SUBR    R4,     R6                      ; DD48   0126
        SUBR    R4,     R6                      ; DD49   0126
        SUBR    R4,     R6                      ; DD4A   0126
        SUBR    R4,     R6                      ; DD4B   0126
        CMP@    R3,     R2                      ; DD4C   035A
        CMP@    R2,     R6                      ; DD4D   0356
        SUB     G_0336, R0                      ; DD4E   0300 0336
        SUB@    R4,     R3                      ; DD50   0323
        BOV     G_E055                          ; DD51   0202 0302

        SUBR    R4,     R6                      ; DD53   0126
        SUBR    R4,     R6                      ; DD54   0126
        SUBR    R4,     R6                      ; DD55   0126
        DECLE   $0216                           ; DD56   0216

        SUB@    R6,     R6                      ; DD57   0336
        SUB     .BTAB.12,R0                     ; DD58   0300 0212
        BGT     G_E07F                          ; DD5A   020E 0323

        SUB@    R4,     R3                      ; DD5C   0323
        SUB@    R4,     R3                      ; DD5D   0323
        SUB@    R4,     R3                      ; DD5E   0323
        SUB@    R4,     R3                      ; DD5F   0323
        CMP@    R2,     R2                      ; DD60   0352
        CMP@    R1,     R6                      ; DD61   034E
        CMP@    R2,     R6                      ; DD62   0356
        SUB@    R6,     R6                      ; DD63   0336
        SUB     .BTAB.12,R0                     ; DD64   0300 0212
        BLE     L_DC41                          ; DD66   0226 0126

        SUB@    R1,     R6                      ; DD68   030E
        CMP     G_033E, R2                      ; DD69   0342 033E
        SUBR    R4,     R6                      ; DD6B   0126
        SUBR    R4,     R6                      ; DD6C   0126
        SUBR    R4,     R6                      ; DD6D   0126
        CMP@    R3,     R2                      ; DD6E   035A
        CMP@    R2,     R6                      ; DD6F   0356
        SUB     G_0300, R0                      ; DD70   0300 0300
        SUB     G_0373, R0                      ; DD72   0300 0373
        CMP@    R6,     R7                      ; DD74   0377
        CMP@    R2,     R2                      ; DD75   0352
        CMP@    R3,     R6                      ; DD76   035E
        SUBR    R4,     R6                      ; DD77   0126
        SUBR    R4,     R6                      ; DD78   0126
        SUBR    R4,     R6                      ; DD79   0126
        BLE     L_DB79                          ; DD7A   0226 0202

        CMP     G_034A, R2                      ; DD7C   0342 034A
        CMP     G_0323, R6                      ; DD7E   0346 0323
        SUB@    R6,     R6                      ; DD80   0336
        SUB@    R4,     R3                      ; DD81   0323
        CMP@    R2,     R2                      ; DD82   0352
        CMP@    R1,     R6                      ; DD83   034E
        CMP@    R2,     R6                      ; DD84   0356
        SUB     G_0300, R0                      ; DD85   0300 0300
        SUB     G_0342, R0                      ; DD87   0300 0342
        SUBI    #$020E, R6                      ; DD89   033E 020E
        SUB@    R4,     R3                      ; DD8B   0323
        SUB@    R6,     R6                      ; DD8C   0336
        SUB@    R4,     R3                      ; DD8D   0323
        SUB@    R4,     R3                      ; DD8E   0323
        SUBR    R4,     R6                      ; DD8F   0126
        SUBI    #$0346, R2                      ; DD90   033A 0346
        SUB@    R2,     R2                      ; DD92   0312
        SUBR    R4,     R6                      ; DD93   0126
        SUBR    R4,     R6                      ; DD94   0126
        BLE     L_DB88                          ; DD95   0226 020E

        CMP@    R2,     R2                      ; DD97   0352
        CMP@    R3,     R6                      ; DD98   035E
        SUBR    R4,     R6                      ; DD99   0126
        SUBR    R4,     R6                      ; DD9A   0126
        SUBR    R4,     R6                      ; DD9B   0126
        SUBI    #$0346, R2                      ; DD9C   033A 0346
        DECLE   $0212                           ; DD9E   0212

        SUBR    R4,     R6                      ; DD9F   0126
        SUBR    R4,     R6                      ; DDA0   0126
        BGT     G_E0A3                          ; DDA1   020E 0300

        SUBR    R4,     R6                      ; DDA3   0126
        SUBR    R4,     R6                      ; DDA4   0126
        SUBR    R4,     R6                      ; DDA5   0126
        BGT     G_E0AA                          ; DDA6   020E 0302

        SUB@    R2,     R2                      ; DDA8   0312
        SUB@    R4,     R6                      ; DDA9   0326
        SUB@    R4,     R6                      ; DDAA   0326
        SUB@    R4,     R6                      ; DDAB   0326
        SUBR    R4,     R6                      ; DDAC   0126
        SUBR    R4,     R6                      ; DDAD   0126
        SUBR    R4,     R6                      ; DDAE   0126
        SUBR    R4,     R6                      ; DDAF   0126
        SUBR    R4,     R6                      ; DDB0   0126
        SUBR    R4,     R6                      ; DDB1   0126
        SUBR    R4,     R6                      ; DDB2   0126
        BGT     G_E0B5                          ; DDB3   020E 0300

        DECLE   $0212                           ; DDB5   0212

        SUBR    R4,     R6                      ; DDB6   0126
        SUB@    R4,     R3                      ; DDB7   0323
        SUB@    R4,     R3                      ; DDB8   0323
        SUB@    R4,     R3                      ; DDB9   0323
        BPL     G_E0BC                          ; DDBA   0203 0300

        SUB@    R4,     R3                      ; DDBC   0323
        SUB@    R4,     R3                      ; DDBD   0323
        SUB@    R4,     R3                      ; DDBE   0323
        SUB@    R4,     R3                      ; DDBF   0323
        SUB@    R4,     R3                      ; DDC0   0323
        SUB@    R4,     R3                      ; DDC1   0323
L_DDC2:
        SUB@    R4,     R3                      ; DDC2   0323
        SUB@    R4,     R3                      ; DDC3   0323
        SUB@    R4,     R3                      ; DDC4   0323
        SUB@    R4,     R3                      ; DDC5   0323
        SUB@    R4,     R3                      ; DDC6   0323
        BPL     G_E0C9                          ; DDC7   0203 0300

        SUB@    R4,     R3                      ; DDC9   0323
        SUB@    R4,     R3                      ; DDCA   0323
        SUB@    R4,     R6                      ; DDCB   0326
        DECR    R6                              ; DDCC   0016
        DECLE   $0000                           ; DDCD   0000

        DECR    R2                              ; DDCE   0012
        SUB@    R4,     R6                      ; DDCF   0326
        SUB@    R4,     R6                      ; DDD0   0326
        SUB@    R4,     R6                      ; DDD1   0326
        BGT     L_DDD4                          ; DDD2   020E 0000

L_DDD4:
        DECR    R2                              ; DDD4   0012
        SUBR    R4,     R6                      ; DDD5   0126
        SUBR    R4,     R6                      ; DDD6   0126
        SUBR    R4,     R6                      ; DDD7   0126
        MVO@    R2,     R4                      ; DDD8   0262
        SLR     R2,     2                       ; DDD9   0066
        SUBR    R4,     R6                      ; DDDA   0126
        SUBR    R4,     R6                      ; DDDB   0126
        BGT     L_DBAB                          ; DDDC   022E 0232
        BLE     L_DBB9                          ; DDDE   0226 0226

        SUB@    R4,     R6                      ; DDE0   0326
        SUB@    R4,     R6                      ; DDE1   0326
        CMP@    R3,     R2                      ; DDE2   035A
        CMP@    R2,     R6                      ; DDE3   0356
        DECLE   $0212                           ; DDE4   0212

        SUB@    R5,     R6                      ; DDE5   032E
        SUB@    R3,     R6                      ; DDE6   031E
        DECLE   $0232                           ; DDE7   0232

        BGT     G_E10D                          ; DDE8   020E 0323

        DECLE   $0210                           ; DDEA   0210

        SUB@    R4,     R3                      ; DDEB   0323
        DECLE   $0210                           ; DDEC   0210

        SUB@    R4,     R3                      ; DDED   0323
        DECLE   $0210                           ; DDEE   0210

        SUB@    R4,     R3                      ; DDEF   0323
        BOV     G_E128                          ; DDF0   0202 0336

        SUB@    R4,     R3                      ; DDF2   0323
        BGT     G_E12B                          ; DDF3   020E 0336

        SUB@    R4,     R3                      ; DDF5   0323
        CMP@    R2,     R2                      ; DDF6   0352
        CMP@    R3,     R6                      ; DDF7   035E
        SUB@    R4,     R6                      ; DDF8   0326
        CMP@    R3,     R2                      ; DDF9   035A
        CMP@    R2,     R6                      ; DDFA   0356
        SUB@    R6,     R6                      ; DDFB   0336
        BOV     G_E0FE                          ; DDFC   0202 0300

        SUB     G_0300, R0                      ; DDFE   0300 0300
        SUB     G_0373, R0                      ; DE00   0300 0373
        CMP@    R6,     R7                      ; DE02   0377
        SUB     .BTAB.02,R0                     ; DE03   0300 0202
        SUB@    R6,     R6                      ; DE05   0336
        SUB     .BTAB.02,R0                     ; DE06   0300 0202
        SUB@    R6,     R6                      ; DE08   0336
        DECLE   $0210                           ; DE09   0210

        SUB     .BTAB.10,R0                     ; DE0A   0300 0210
        SUB@    R2,     R4                      ; DE0C   0314
        CMP@    R2,     R2                      ; DE0D   0352
        CMP@    R3,     R6                      ; DE0E   035E
        SUB@    R4,     R6                      ; DE0F   0326
        CMP@    R3,     R2                      ; DE10   035A
        CMP@    R2,     R6                      ; DE11   0356
        DECLE   $0210                           ; DE12   0210

        SUB     .BTAB.10,R0                     ; DE13   0300 0210
        SUB     .BTAB.10,R0                     ; DE15   0300 0210
        SUB     .BTAB.12,R0                     ; DE17   0300 0212
        SUB@    R4,     R6                      ; DE19   0326
        SUB@    R4,     R6                      ; DE1A   0326
        DECLE   $0212                           ; DE1B   0212

        SUB@    R4,     R6                      ; DE1C   0326
        SUB@    R4,     R6                      ; DE1D   0326
        SUB@    R4,     R6                      ; DE1E   0326
        MVO@    R2,     R4                      ; DE1F   0262
        SLR     R2,     2                       ; DE20   0066
        SUB@    R2,     R6                      ; DE21   0316
        SUB     G_0300, R0                      ; DE22   0300 0300
        CMP@    R2,     R2                      ; DE24   0352
        CMP@    R3,     R6                      ; DE25   035E
        SUB@    R4,     R6                      ; DE26   0326
        SUB@    R4,     R6                      ; DE27   0326
        SUBR    R4,     R6                      ; DE28   0126
        SUB@    R4,     R6                      ; DE29   0326
        SUB@    R4,     R6                      ; DE2A   0326
        SUB@    R4,     R6                      ; DE2B   0326
        BGT     G_E164                          ; DE2C   020E 0336

        SUB     G_0326, R0                      ; DE2E   0300 0326
        SUB@    R4,     R6                      ; DE30   0326
        SUB@    R4,     R6                      ; DE31   0326
        MVO@    R2,     R4                      ; DE32   0262
        MVO@    R6,     R4                      ; DE33   0266
        SUB@    R4,     R6                      ; DE34   0326
        SUB@    R4,     R6                      ; DE35   0326
        BGT     L_DB19                          ; DE36   022E 031E

        SUB@    R3,     R6                      ; DE38   031E
        SUB@    R3,     R6                      ; DE39   031E
        SUB@    R3,     R6                      ; DE3A   031E
        SUB@    R3,     R6                      ; DE3B   031E
L_DE3C:
        SUB@    R3,     R6                      ; DE3C   031E
        SUB@    R3,     R6                      ; DE3D   031E
        SUB@    R5,     R2                      ; DE3E   032A
        BGT     G_E053                          ; DE3F   020E 0212

        SUB@    R4,     R6                      ; DE41   0326
        SUB@    R4,     R6                      ; DE42   0326
        BGT     G_E168                          ; DE43   020E 0323

        SUB@    R6,     R6                      ; DE45   0336
        B       G_E16B                          ; DE46   0200 0323

        SUB@    R4,     R3                      ; DE48   0323
        SUB@    R6,     R6                      ; DE49   0336
        BOV     G_E153                          ; DE4A   0202 0307

        SUB@    R1,     R0                      ; DE4C   0308
        BOV     G_E156                          ; DE4D   0202 0307

        SUB@    R1,     R0                      ; DE4F   0308
        BOV     G_E159                          ; DE50   0202 0307

        SUB@    R1,     R0                      ; DE52   0308
        DECLE   $0212                           ; DE53   0212

        SUB@    R4,     R6                      ; DE54   0326
        SUB@    R4,     R6                      ; DE55   0326
        BLE     L_DC55                          ; DE56   0226 0202

        SUB     G_0336, R0                      ; DE58   0300 0336
        DECLE   $0210                           ; DE5A   0210

        SUB     G_0300, R0                      ; DE5B   0300 0300
        SUB@    R6,     R6                      ; DE5D   0336
        BOV     G_E167                          ; DE5E   0202 0307

L_DE60:
        SUB@    R1,     R0                      ; DE60   0308
        BOV     G_E16A                          ; DE61   0202 0307

        SUB@    R1,     R0                      ; DE63   0308
        BOV     G_E16D                          ; DE64   0202 0307

        SUB@    R1,     R0                      ; DE66   0308
        SUB@    R4,     R3                      ; DE67   0323
        SUB@    R6,     R6                      ; DE68   0336
        SUB@    R4,     R3                      ; DE69   0323
        SUB@    R4,     R3                      ; DE6A   0323
        DECLE   $0212                           ; DE6B   0212

        SUB@    R4,     R6                      ; DE6C   0326
        MVO@    R2,     R4                      ; DE6D   0262
        SLR     R2,     2                       ; DE6E   0066
        SUBR    R4,     R6                      ; DE6F   0126
        SUBR    R4,     R6                      ; DE70   0126
        SUB@    R4,     R6                      ; DE71   0326
        CMP@    R3,     R2                      ; DE72   035A
        CMP@    R2,     R6                      ; DE73   0356
        SUB     .BTAB.10,R0                     ; DE74   0300 0210
        SUB     G_0300, R0                      ; DE76   0300 0300
        DECLE   $0210                           ; DE78   0210

        SUB     G_0342, R0                      ; DE79   0300 0342
        SUBI    #$0126, R6                      ; DE7B   033E 0126
        SUBR    R4,     R6                      ; DE7D   0126
        BLE     L_DB59                          ; DE7E   0226 0326
        BGT     L_DE91                          ; DE80   020E 000F

        SUB@    R4,     R3                      ; DE82   0323
        SUB@    R4,     R3                      ; DE83   0323
        SUB@    R4,     R3                      ; DE84   0323
        SUB@    R4,     R3                      ; DE85   0323
        CMP@    R2,     R2                      ; DE86   0352
        CMP@    R3,     R6                      ; DE87   035E
        SUBR    R4,     R6                      ; DE88   0126
        SUBR    R4,     R6                      ; DE89   0126
        SUBR    R4,     R6                      ; DE8A   0126
        SUBR    R4,     R6                      ; DE8B   0126
        SUBR    R4,     R6                      ; DE8C   0126
        SUBR    R4,     R6                      ; DE8D   0126
        SUBI    #$0346, R2                      ; DE8E   033A 0346
        BPL     G_E192                          ; DE90   0203 0300

        SUB     G_0323, R0                      ; DE92   0300 0323
        DECLE   $0210,  $0000                   ; DE94   0210 0000

        SUB@    R2,     R4                      ; DE96   0314
        SUB     G_0300, R0                      ; DE97   0300 0300
        SUB     G_0300, R0                      ; DE99   0300 0300
        SUB@    R4,     R3                      ; DE9B   0323
        SUB@    R4,     R3                      ; DE9C   0323
        SUB@    R4,     R3                      ; DE9D   0323
        SUB@    R4,     R3                      ; DE9E   0323
        SUB@    R4,     R3                      ; DE9F   0323
        SUB@    R4,     R3                      ; DEA0   0323
        SUB@    R4,     R3                      ; DEA1   0323
        SUB@    R4,     R3                      ; DEA2   0323
        SUB     .BTAB.10,R0                     ; DEA3   0300 0210
        DECLE   $0000,  $0000                   ; DEA5   0000 0000

        BGT     L_DB8A                          ; DEA7   022E 031E

        SUB@    R3,     R6                      ; DEA9   031E
        SUB@    R6,     R2                      ; DEAA   0332
        SUBR    R4,     R6                      ; DEAB   0126
        MVO@    R2,     R4                      ; DEAC   0262
        SLR     R2,     2                       ; DEAD   0066
        SUBR    R4,     R6                      ; DEAE   0126
        SUBR    R4,     R6                      ; DEAF   0126
        SUBR    R4,     R6                      ; DEB0   0126
        SUBR    R4,     R6                      ; DEB1   0126
        SUBR    R4,     R6                      ; DEB2   0126
        PSHR    R2                              ; DEB3   0272
        RRC     R2,     2                       ; DEB4   0076
        SUBR    R4,     R6                      ; DEB5   0126
        SUBR    R4,     R6                      ; DEB6   0126
        SUBR    R4,     R6                      ; DEB7   0126
        SUBR    R4,     R6                      ; DEB8   0126
        SUBR    R4,     R6                      ; DEB9   0126
        SUBR    R4,     R6                      ; DEBA   0126
        BOV     G_E1BD                          ; DEBB   0202 0300

        SUB@    R2,     R2                      ; DEBD   0312
        SUBR    R4,     R6                      ; DEBE   0126
        MVO@    R2,     R4                      ; DEBF   0262
        MVO@    R6,     R4                      ; DEC0   0266
        SUBR    R4,     R6                      ; DEC1   0126
        SUBR    R4,     R6                      ; DEC2   0126
        MVO@    R2,     R5                      ; DEC3   026A
        CMP@    R5,     R6                      ; DEC4   036E
        SUBR    R4,     R6                      ; DEC5   0126
        PSHR    R2                              ; DEC6   0272
        PSHR    R6                              ; DEC7   0276
        SUBR    R4,     R6                      ; DEC8   0126
        SUBR    R4,     R6                      ; DEC9   0126
        SUBR    R4,     R6                      ; DECA   0126
        MVO@    R2,     R4                      ; DECB   0262
        CMP@    R4,     R6                      ; DECC   0366
        SUBR    R4,     R6                      ; DECD   0126
        BGT     L_DEDF                          ; DECE   020E 000F

        DECR    R2                              ; DED0   0012
        BGT     G_E1D3                          ; DED1   020E 0300

        INCR    R7                              ; DED3   000F
        DECLE   $021A                           ; DED4   021A

        SUBR    R4,     R6                      ; DED5   0126
        MVO@    R2,     R5                      ; DED6   026A
        MVO@    R6,     R5                      ; DED7   026E
        SUBR    R4,     R6                      ; DED8   0126
        SUBR    R4,     R6                      ; DED9   0126
        SUBR    R4,     R6                      ; DEDA   0126
        SUBR    R4,     R6                      ; DEDB   0126
        SUBR    R4,     R6                      ; DEDC   0126
        SUBR    R4,     R6                      ; DEDD   0126
        MVO@    R2,     R4                      ; DEDE   0262
L_DEDF:
        MVO@    R6,     R4                      ; DEDF   0266
        SUBR    R4,     R6                      ; DEE0   0126
        BGT     L_DEF2                          ; DEE1   020E 000F

        SUBR    R4,     R6                      ; DEE3   0126
        SUBR    R4,     R6                      ; DEE4   0126
        SUBR    R4,     R6                      ; DEE5   0126
        SUBR    R4,     R6                      ; DEE6   0126
        BGT     L_DF04                          ; DEE7   020E 001B

        SUB     G_006B, R0                      ; DEE9   0300 006B
        SUB     G_0336, R0                      ; DEEB   0300 0336
        SUB     G_0300, R0                      ; DEED   0300 0300
        SUB     G_0300, R0                      ; DEEF   0300 0300
        SUB     G_0063, R0                      ; DEF1   0300 0063
        SUB@    R6,     R6                      ; DEF3   0336
        SUB     .STIC.Y.7,R0                    ; DEF4   0300 000F
        DECLE   $0000                           ; DEF6   0000

        SUB     G_0312, R0                      ; DEF7   0300 0312
        SUBR    R4,     R6                      ; DEF9   0126
        BGT     L_DF0B                          ; DEFA   020E 000F

        DECLE   $0000,  $0000                   ; DEFC   0000 0000

        DECR    R2                              ; DEFE   0012
        SUBR    R4,     R6                      ; DEFF   0126
        MVO@    R2,     R4                      ; DF00   0262
        SLR     R2,     2                       ; DF01   0066
        SUBR    R4,     R6                      ; DF02   0126
        SUBR    R4,     R6                      ; DF03   0126
L_DF04:
        SUBR    R4,     R6                      ; DF04   0126
        SUBR    R4,     R6                      ; DF05   0126
        SUBR    R4,     R6                      ; DF06   0126
        PSHR    R2                              ; DF07   0272
        RRC     R2,     2                       ; DF08   0076
        SUBR    R4,     R6                      ; DF09   0126
        SUBR    R4,     R6                      ; DF0A   0126
L_DF0B:
        SUB@    R4,     R6                      ; DF0B   0326
        SUBR    R4,     R6                      ; DF0C   0126
        SUBR    R4,     R6                      ; DF0D   0126
        SUBR    R4,     R6                      ; DF0E   0126
        SUBR    R4,     R6                      ; DF0F   0126
        PSHR    R2                              ; DF10   0272
        RRC     R2,     2                       ; DF11   0076
        SUBR    R4,     R6                      ; DF12   0126
        MVO@    R2,     R4                      ; DF13   0262
        MVO@    R6,     R4                      ; DF14   0266
        SUBR    R4,     R6                      ; DF15   0126
        SUBR    R4,     R6                      ; DF16   0126
        MVO@    R2,     R5                      ; DF17   026A
L_DF18:
        CMP@    R5,     R6                      ; DF18   036E
        SUBR    R4,     R6                      ; DF19   0126
        PSHR    R2                              ; DF1A   0272
        PSHR    R6                              ; DF1B   0276
        SUBR    R4,     R6                      ; DF1C   0126
        SUBR    R4,     R6                      ; DF1D   0126
        BGT     G_E12E                          ; DF1E   020E 020E

        SUB     G_0336, R0                      ; DF20   0300 0336
        DECLE   $021A                           ; DF22   021A

        PSHR    R2                              ; DF23   0272
        PSHR    R6                              ; DF24   0276
        SUBR    R4,     R6                      ; DF25   0126
        SUBR    R4,     R6                      ; DF26   0126
L_DF27:
        SUBR    R4,     R6                      ; DF27   0126
        SUBR    R4,     R6                      ; DF28   0126
        SUBR    R4,     R6                      ; DF29   0126
        MVO@    R2,     R5                      ; DF2A   026A
        MVO@    R6,     R5                      ; DF2B   026E
        SUBR    R4,     R6                      ; DF2C   0126
        SUBR    R4,     R6                      ; DF2D   0126
        SUBR    R4,     R6                      ; DF2E   0126
        SUBR    R4,     R6                      ; DF2F   0126
        SUBR    R4,     R6                      ; DF30   0126
        BGT     L_DF42                          ; DF31   020E 000F

        DECLE   $0212                           ; DF33   0212

        SUBR    R4,     R6                      ; DF34   0126
L_DF35:
        SUBR    R4,     R6                      ; DF35   0126
        DECLE   $0216                           ; DF36   0216

        RRC     R3,     1                       ; DF37   0073
        SUB     G_0300, R0                      ; DF38   0300 0300
        SUB@    R6,     R6                      ; DF3A   0336
L_DF3B:
        SUB     G_0300, R0                      ; DF3B   0300 0300
        SUB     G_006B, R0                      ; DF3D   0300 006B
        SUB     G_0300, R0                      ; DF3F   0300 0300
        SUB     G_0300, R0                      ; DF41   0300 0300
        SUB@    R6,     R6                      ; DF43   0336
        SUB     .STIC.Y.7,R0                    ; DF44   0300 000F
        DECLE   $0000                           ; DF46   0000

        BGT     L_DC2A                          ; DF47   022E 031E
        BNOV    L_DCD8                          ; DF49   022A 0272

        RRC     R2,     2                       ; DF4B   0076
        CMP@    R3,     R2                      ; DF4C   035A
        CMP@    R2,     R6                      ; DF4D   0356
L_DF4E:
        SUB@    R6,     R6                      ; DF4E   0336
        SUB@    R2,     R0                      ; DF4F   0310
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF50   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; DF54   0000 0000
L_DF56:
        SUB@    R2,     R4                      ; DF56   0314
        SUB@    R6,     R6                      ; DF57   0336
        CMP     G_033E, R2                      ; DF58   0342 033E
        SUBR    R4,     R6                      ; DF5A   0126
        INCR    R7                              ; DF5B   000F
        DECLE   $0000                           ; DF5C   0000

        COMR    R3                              ; DF5D   001B
        RRC     R3,     1                       ; DF5E   0073
        SUB     G_0352, R0                      ; DF5F   0300 0352
        CMP@    R3,     R6                      ; DF61   035E
        SUBR    R4,     R6                      ; DF62   0126
        SUBR    R4,     R6                      ; DF63   0126
        SUBR    R4,     R6                      ; DF64   0126
        SUBR    R4,     R6                      ; DF65   0126
        SUBR    R4,     R6                      ; DF66   0126
        SUBR    R4,     R6                      ; DF67   0126
        SUBR    R4,     R6                      ; DF68   0126
        MVO@    R2,     R4                      ; DF69   0262
        SLR     R2,     2                       ; DF6A   0066
        SUBR    R4,     R6                      ; DF6B   0126
        SUBI    #$0346, R2                      ; DF6C   033A 0346
        SUB     .STIC.X.0,R0                    ; DF6E   0300 0000
        DECLE   $0000,  $0000,  $0000           ; DF70   0000 0000 0000

        SUB@    R2,     R4                      ; DF73   0314
        SUB     G_0300, R0                      ; DF74   0300 0300
        SUB     G_0300, R0                      ; DF76   0300 0300
        SUB     G_0300, R0                      ; DF78   0300 0300
        SUB     G_0300, R0                      ; DF7A   0300 0300
        SUB     G_0063, R0                      ; DF7C   0300 0063
        SUB     G_0300, R0                      ; DF7E   0300 0300
        SUB@    R6,     R6                      ; DF80   0336
        SUB@    R2,     R0                      ; DF81   0310
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF82   0000 0000 0000 0000

        DECR    R2                              ; DF86   0012
        NEGR    R6                              ; DF87   0026
        SUB@    R5,     R6                      ; DF88   032E
        SUB@    R3,     R6                      ; DF89   031E
        SUB@    R3,     R6                      ; DF8A   031E
        SUB@    R3,     R6                      ; DF8B   031E
        SUB@    R6,     R2                      ; DF8C   0332
        SUBR    R4,     R6                      ; DF8D   0126
        SUBR    R4,     R6                      ; DF8E   0126
        MVO@    R2,     R4                      ; DF8F   0262
        SLR     R2,     2                       ; DF90   0066
        SUBR    R4,     R6                      ; DF91   0126
        SUBR    R4,     R6                      ; DF92   0126
        SUBR    R4,     R6                      ; DF93   0126
        SUBR    R4,     R6                      ; DF94   0126
        SUBR    R4,     R6                      ; DF95   0126
        DECR    R6                              ; DF96   0016
        SUBR    R4,     R6                      ; DF97   0126
        SUBR    R4,     R6                      ; DF98   0126
        MVO@    R2,     R4                      ; DF99   0262
        CMP@    R4,     R6                      ; DF9A   0366
        SUBR    R4,     R6                      ; DF9B   0126
L_DF9C:
        CMP@    R3,     R2                      ; DF9C   035A
        CMP@    R2,     R6                      ; DF9D   0356
        SUB     G_0312, R0                      ; DF9E   0300 0312
        BGT     G_E2C5                          ; DFA0   020E 0323

        SUB@    R4,     R3                      ; DFA2   0323
        MVO@    R2,     R5                      ; DFA3   026A
        SUB@    R4,     R3                      ; DFA4   0323
        SUB@    R4,     R3                      ; DFA5   0323
        SUB@    R4,     R3                      ; DFA6   0323
        SUB@    R4,     R3                      ; DFA7   0323
        CMP     G_033E, R2                      ; DFA8   0342 033E
        SUBR    R4,     R6                      ; DFAA   0126
        SUB@    R4,     R3                      ; DFAB   0323
        SUB@    R4,     R3                      ; DFAC   0323
        MVO@    R2,     R5                      ; DFAD   026A
L_DFAE:
        SUB@    R4,     R3                      ; DFAE   0323
        SUB@    R4,     R3                      ; DFAF   0323
        CMP@    R2,     R2                      ; DFB0   0352
        CMP@    R1,     R6                      ; DFB1   034E
        CMP@    R2,     R6                      ; DFB2   0356
        SUB@    R6,     R6                      ; DFB3   0336
        BOV     G_E2B6                          ; DFB4   0202 0300

        SUB     .BTAB.6E,R0                     ; DFB6   0300 026E
        SUB     G_0373, R0                      ; DFB8   0300 0373
        CMP@    R6,     R7                      ; DFBA   0377
        CMP     G_034A, R2                      ; DFBB   0342 034A
        CMP     G_0323, R6                      ; DFBD   0346 0323
L_DFBF:
        SUB     G_0300, R0                      ; DFBF   0300 0300
        MVO@    R6,     R5                      ; DFC1   026E
        SUB     G_0300, R0                      ; DFC2   0300 0300
        SUB     G_0352, R0                      ; DFC4   0300 0352
        CMP@    R3,     R6                      ; DFC6   035E
        SUBR    R4,     R6                      ; DFC7   0126
        CMP@    R3,     R2                      ; DFC8   035A
        CMP@    R2,     R6                      ; DFC9   0356
        SUB     G_0336, R0                      ; DFCA   0300 0336
        SUB     G_0342, R0                      ; DFCC   0300 0342
        SUBI    #$033A, R6                      ; DFCE   033E 033A
        CMP     G_0310, R6                      ; DFD0   0346 0310
        SUB     G_0126, R0                      ; DFD2   0300 0126
        SUBR    R4,     R6                      ; DFD4   0126
        SUBR    R4,     R6                      ; DFD5   0126
        SUBR    R4,     R6                      ; DFD6   0126
        SUB@    R2,     R6                      ; DFD7   0316
L_DFD8:
        SUB     G_0300, R0                      ; DFD8   0300 0300
        SUB@    R4,     R3                      ; DFDA   0323
        SUB@    R4,     R3                      ; DFDB   0323
        CMP@    R2,     R2                      ; DFDC   0352
        CMP@    R1,     R6                      ; DFDD   034E
        CMP@    R2,     R6                      ; DFDE   0356
        SUB@    R6,     R6                      ; DFDF   0336
        CMP     G_034A, R2                      ; DFE0   0342 034A
        CMP     G_0336, R6                      ; DFE2   0346 0336
        SUB@    R2,     R0                      ; DFE4   0310
        DECLE   $0000                           ; DFE5   0000

        SUB     G_0126, R0                      ; DFE6   0300 0126
        MVO@    R2,     R4                      ; DFE8   0262
        CMP@    R4,     R6                      ; DFE9   0366
L_DFEA:
        SUBR    R4,     R6                      ; DFEA   0126
        MVO@    R2,     R4                      ; DFEB   0262
L_DFEC:
        CMP@    R4,     R6                      ; DFEC   0366
        SUBR    R4,     R6                      ; DFED   0126
        SUBR    R4,     R6                      ; DFEE   0126
        SUBR    R4,     R6                      ; DFEF   0126
        SUB@    R2,     R6                      ; DFF0   0316
        CMP@    R2,     R2                      ; DFF1   0352
        CMP@    R3,     R6                      ; DFF2   035E
        SUBR    R4,     R6                      ; DFF3   0126
        SUBI    #$0346, R2                      ; DFF4   033A 0346
        SUB     G_0336, R0                      ; DFF6   0300 0336
        SUBR    R4,     R6                      ; DFF8   0126
        SUBR    R4,     R6                      ; DFF9   0126
        SUBR    R4,     R6                      ; DFFA   0126
        SUB@    R4,     R3                      ; DFFB   0323
        MVO@    R2,     R5                      ; DFFC   026A
        SUB@    R4,     R3                      ; DFFD   0323
        SUB@    R4,     R3                      ; DFFE   0323
        MVO@    R2,     R5                      ; DFFF   026A

        ORG     $F000
L_F000:
        SUB@    R4,     R3                      ; F000   0323
L_F001:
        SUB@    R4,     R3                      ; F001   0323
L_F002:
        DECLE   $021A                           ; F002   021A
L_F003:
        SUBR    R4,     R6                      ; F003   0126
L_F004:
        SUBR    R4,     R6                      ; F004   0126
        SUBR    R4,     R6                      ; F005   0126
        MVO@    R2,     R4                      ; F006   0262
        CMP@    R4,     R6                      ; F007   0366
        SUBR    R4,     R6                      ; F008   0126
        MVO@    R2,     R4                      ; F009   0262
        CMP@    R4,     R6                      ; F00A   0366
        SUBR    R4,     R6                      ; F00B   0126
        BGT     L_F344                          ; F00C   020E 0336

        SUB@    R4,     R3                      ; F00E   0323
        SUB     .BTAB.6E,R0                     ; F00F   0300 026E
        SUB     G_0300, R0                      ; F011   0300 0300
        MVO@    R6,     R5                      ; F013   026E
        SUB     G_0300, R0                      ; F014   0300 0300
        BOV     L_F33B                          ; F016   0202 0323

        SUB@    R4,     R3                      ; F018   0323
        SUB@    R4,     R3                      ; F019   0323
        MVO@    R2,     R5                      ; F01A   026A
        SUB@    R4,     R3                      ; F01B   0323
        SUB@    R4,     R3                      ; F01C   0323
        MVO@    R2,     R5                      ; F01D   026A
        SUB@    R4,     R3                      ; F01E   0323
        SUB@    R4,     R3                      ; F01F   0323
        DECLE   $0212                           ; F020   0212
L_F021:
        SUBR    R4,     R6                      ; F021   0126
L_F022:
        SUBR    R4,     R6                      ; F022   0126
L_F023:
        SUBR    R4,     R6                      ; F023   0126
L_F024:
        SUBR    R4,     R6                      ; F024   0126
L_F025:
        SUBR    R4,     R6                      ; F025   0126
        SUBR    R4,     R6                      ; F026   0126
        SUBR    R4,     R6                      ; F027   0126
L_F028:
        SUBR    R4,     R6                      ; F028   0126
        SUBR    R4,     R6                      ; F029   0126
        DECLE   $0216                           ; F02A   0216

        SUB     G_0300, R0                      ; F02B   0300 0300
        SUB     .BTAB.6E,R0                     ; F02D   0300 026E
        SUB     G_0300, R0                      ; F02F   0300 0300
        MVO@    R6,     R5                      ; F031   026E
        CMP     G_033E, R2                      ; F032   0342 033E
        SUBR    R4,     R6                      ; F034   0126
        SUBR    R4,     R6                      ; F035   0126
        SUBR    R4,     R6                      ; F036   0126
        SUB@    R4,     R3                      ; F037   0323
        SUB@    R4,     R3                      ; F038   0323
        SUB@    R4,     R3                      ; F039   0323
        DECLE   $021A                           ; F03A   021A

        SUBR    R4,     R6                      ; F03B   0126
        SUBR    R4,     R6                      ; F03C   0126
        SUBR    R4,     R6                      ; F03D   0126
L_F03E:
        SUBR    R4,     R6                      ; F03E   0126
        SUBR    R4,     R6                      ; F03F   0126
        SUBR    R4,     R6                      ; F040   0126
        SUBR    R4,     R6                      ; F041   0126
L_F042:
        SUBR    R4,     R6                      ; F042   0126
L_F043:
        SUBR    R4,     R6                      ; F043   0126
L_F044:
        SUBR    R4,     R6                      ; F044   0126
L_F045:
        SUBR    R4,     R6                      ; F045   0126
L_F046:
        SUBI    #$0346, R2                      ; F046   033A 0346
L_F048:
        SUB@    R4,     R3                      ; F048   0323
L_F049:
        SUB@    R4,     R3                      ; F049   0323
        SUB@    R4,     R3                      ; F04A   0323
        DECLE   $0000,  $0000,  $0000           ; F04B   0000 0000 0000
L_F04E:
        DECLE   $0214                           ; F04E   0214
L_F04F:
        SUB@    R6,     R6                      ; F04F   0336
L_F050:
        SUB@    R4,     R3                      ; F050   0323
L_F051:
        SUB@    R4,     R3                      ; F051   0323
L_F052:
        SUB@    R4,     R3                      ; F052   0323
L_F053:
        SUB@    R4,     R3                      ; F053   0323
L_F054:
        SUB@    R4,     R3                      ; F054   0323
        SUB@    R4,     R3                      ; F055   0323
        SUB@    R4,     R3                      ; F056   0323
        SUB@    R4,     R3                      ; F057   0323
        SUB@    R4,     R3                      ; F058   0323
        SUB@    R4,     R3                      ; F059   0323
        SUB@    R4,     R3                      ; F05A   0323
        SUB@    R4,     R3                      ; F05B   0323
L_F05C:
        SUB@    R2,     R0                      ; F05C   0310
        DECLE   $0000,  $0000                   ; F05D   0000 0000

        BLE     G_EE3A                          ; F05F   0226 0226
        BLE     G_EE3C                          ; F061   0226 0226
        BGT     G_ED46                          ; F063   022E 031E

        SUB@    R6,     R2                      ; F065   0332
        BLE     G_EE41                          ; F066   0226 0226

        MVO@    R2,     R4                      ; F068   0262
        SLR     R2,     2                       ; F069   0066
        BLE     G_EE45                          ; F06A   0226 0226
        BGT     G_ED4F                          ; F06C   022E 031E

        SUB@    R6,     R2                      ; F06E   0332
        BLE     G_EE4A                          ; F06F   0226 0226
L_F071:
        BLE     G_EE4C                          ; F071   0226 0226

L_F073:
        SUB@    R4,     R3                      ; F073   0323
L_F074:
        SUB@    R4,     R3                      ; F074   0323
L_F075:
        SUB@    R6,     R6                      ; F075   0336
        SUB@    R4,     R3                      ; F076   0323
        DECLE   $0210,  $0000                   ; F077   0210 0000

        SUB@    R4,     R3                      ; F079   0323
        SUB@    R4,     R3                      ; F07A   0323
        SUB@    R6,     R6                      ; F07B   0336
        DECLE   $0210                           ; F07C   0210

        SUB@    R4,     R3                      ; F07D   0323
        SUB@    R4,     R3                      ; F07E   0323
        SUB@    R6,     R6                      ; F07F   0336
        DECLE   $0210,  $0000                   ; F080   0210 0000

        SUB@    R4,     R3                      ; F082   0323
        SUB@    R4,     R3                      ; F083   0323
L_F084:
        SUB@    R6,     R6                      ; F084   0336
        SUB@    R4,     R3                      ; F085   0323
        SUB@    R4,     R3                      ; F086   0323
        DECLE   $0000                           ; F087   0000

        DECR    R2                              ; F088   0012
        BLE     G_EE20                          ; F089   0226 026A

        SAR     R2,     2                       ; F08B   006E
        BLE     G_EE67                          ; F08C   0226 0226
L_F08E:
        BLE     G_EE81                          ; F08E   0226 020E

        DECLE   $0000                           ; F090   0000
L_F091:
        DECLE   $0000                           ; F091   0000
L_F092:
        DECR    R2                              ; F092   0012
L_F093:
        BLE     G_EE6E                          ; F093   0226 0226
L_F095:
        BLE     G_EE2C                          ; F095   0226 026A

L_F097:
        SAR     R2,     2                       ; F097   006E
L_F098:
        BLE     G_EE8B                          ; F098   0226 020E

        DECLE   $0000                           ; F09A   0000
L_F09B:
        DECLE   $0000                           ; F09B   0000

        SUB@    R6,     R6                      ; F09C   0336
        SUB@    R4,     R3                      ; F09D   0323
L_F09E:
        DECLE   $0210                           ; F09E   0210
L_F09F:
        SUB@    R4,     R3                      ; F09F   0323
L_F0A0:
        SUB@    R6,     R6                      ; F0A0   0336
L_F0A1:
        SUB@    R4,     R3                      ; F0A1   0323
L_F0A2:
        SUB@    R4,     R3                      ; F0A2   0323
L_F0A3:
        DECLE   $0210                           ; F0A3   0210
L_F0A4:
        DECLE   $0000,  $0000                   ; F0A4   0000 0000

        SUB@    R4,     R3                      ; F0A6   0323
        SUB@    R4,     R3                      ; F0A7   0323
        SUB@    R6,     R6                      ; F0A8   0336
        SUB@    R4,     R3                      ; F0A9   0323
        DECLE   $0210                           ; F0AA   0210

        SUB@    R4,     R3                      ; F0AB   0323
        SUB@    R6,     R6                      ; F0AC   0336
        DECLE   $0210,  $0000                   ; F0AD   0210 0000

        BLE     G_EE8A                          ; F0AF   0226 0226
        BLE     G_EE8C                          ; F0B1   0226 0226
        BGT     G_ED96                          ; F0B3   022E 031E

        SUB@    R6,     R2                      ; F0B5   0332
        BLE     G_EE91                          ; F0B6   0226 0226
        BLE     G_EE57                          ; F0B8   0226 0262

        SLR     R2,     2                       ; F0BA   0066
        BLE     G_EE8E                          ; F0BB   0226 022E

        SUB@    R3,     R6                      ; F0BD   031E
        SUB@    R6,     R2                      ; F0BE   0332
        BLE     G_EE9A                          ; F0BF   0226 0226
L_F0C1:
        BLE     G_EE9C                          ; F0C1   0226 0226

        SUB@    R4,     R3                      ; F0C3   0323
        SUB@    R4,     R3                      ; F0C4   0323
        SUB@    R6,     R6                      ; F0C5   0336
        SUB@    R4,     R3                      ; F0C6   0323
        DECLE   $0210,  $0000                   ; F0C7   0210 0000

        SUB@    R6,     R6                      ; F0C9   0336
        SUB@    R4,     R3                      ; F0CA   0323
        SUB@    R4,     R3                      ; F0CB   0323
        SUB@    R4,     R3                      ; F0CC   0323
        DECLE   $0210                           ; F0CD   0210

        SUB@    R4,     R3                      ; F0CE   0323
        SUB@    R6,     R6                      ; F0CF   0336
        DECLE   $0210,  $0000                   ; F0D0   0210 0000
L_F0D2:
        SUB@    R4,     R3                      ; F0D2   0323
L_F0D3:
        SUB@    R4,     R3                      ; F0D3   0323
L_F0D4:
        SUB@    R6,     R6                      ; F0D4   0336
        SUB@    R4,     R3                      ; F0D5   0323
        SUB@    R4,     R3                      ; F0D6   0323
        DECLE   $0000                           ; F0D7   0000
L_F0D8:
        DECR    R2                              ; F0D8   0012
        BLE     G_EE70                          ; F0D9   0226 026A

        SAR     R2,     2                       ; F0DB   006E
        BLE     G_EEB7                          ; F0DC   0226 0226
        BLE     G_EED1                          ; F0DE   0226 020E

L_F0E0:
        DECLE   $0000                           ; F0E0   0000
L_F0E1:
        DECLE   $0000                           ; F0E1   0000

        DECR    R2                              ; F0E2   0012
        BLE     G_EEBE                          ; F0E3   0226 0226
        BLE     G_EE7C                          ; F0E5   0226 026A

        SAR     R2,     2                       ; F0E7   006E
        BLE     G_EEDB                          ; F0E8   0226 020E

        DECLE   $0000                           ; F0EA   0000
L_F0EB:
        DECLE   $0000                           ; F0EB   0000

        SUB@    R6,     R6                      ; F0EC   0336
        SUB@    R4,     R3                      ; F0ED   0323
        DECLE   $0210                           ; F0EE   0210

        SUB@    R4,     R3                      ; F0EF   0323
        SUB@    R4,     R3                      ; F0F0   0323
L_F0F1:
        SUB@    R6,     R6                      ; F0F1   0336
        SUB@    R4,     R3                      ; F0F2   0323
        DECLE   $0210,  $0000,  $0000           ; F0F3   0210 0000 0000

        SUB@    R4,     R3                      ; F0F6   0323
        SUB@    R4,     R3                      ; F0F7   0323
        SUB@    R6,     R6                      ; F0F8   0336
L_F0F9:
        SUB@    R4,     R3                      ; F0F9   0323
L_F0FA:
        DECLE   $0210                           ; F0FA   0210

        SUB@    R4,     R3                      ; F0FB   0323
        SUB@    R6,     R6                      ; F0FC   0336
        DECLE   $0210                           ; F0FD   0210
L_F0FE:
        DECLE   $0000                           ; F0FE   0000

        BLE     G_EEDA                          ; F0FF   0226 0226
        BLE     G_EEDC                          ; F101   0226 0226
L_F103:
        BGT     G_EDE6                          ; F103   022E 031E

        SUB@    R6,     R2                      ; F105   0332
        BLE     G_EEE1                          ; F106   0226 0226
L_F108:
        BLE     G_EEA7                          ; F108   0226 0262

        SLR     R2,     2                       ; F10A   0066
        BLE     G_EEDE                          ; F10B   0226 022E

        SUB@    R3,     R6                      ; F10D   031E
        SUB@    R6,     R2                      ; F10E   0332
        BLE     G_EEEA                          ; F10F   0226 0226
L_F111:
        BLE     G_EEEC                          ; F111   0226 0226

        SUB@    R4,     R3                      ; F113   0323
        SUB@    R4,     R3                      ; F114   0323
        SUB@    R4,     R3                      ; F115   0323
        SUB@    R4,     R3                      ; F116   0323
        DECLE   $0212                           ; F117   0212

        SUBR    R0,     R0                      ; F118   0100
        SUB@    R4,     R3                      ; F119   0323
        SUB@    R4,     R3                      ; F11A   0323
        SUB@    R4,     R3                      ; F11B   0323
        SUB@    R4,     R3                      ; F11C   0323
        DECLE   $0210                           ; F11D   0210

        SUB@    R4,     R3                      ; F11E   0323
        SUB@    R6,     R6                      ; F11F   0336
L_F120:
        DECLE   $0212                           ; F120   0212

        SUBR    R0,     R0                      ; F121   0100
        SUB@    R4,     R3                      ; F122   0323
        SUB@    R4,     R3                      ; F123   0323
L_F124:
        SUB@    R4,     R3                      ; F124   0323
        SUB@    R4,     R3                      ; F125   0323
        SUB@    R4,     R3                      ; F126   0323
        DECLE   $0000,  $0000,  $0000,  $0000   ; F127   0000 0000 0000 0000

        SUB     G_0302, R2                      ; F12B   0302 0302
        SUB     G_0302, R2                      ; F12D   0302 0302
        SUB     G_0302, R2                      ; F12F   0302 0302
        SUB     G_0302, R2                      ; F131   0302 0302
        SUB     G_0302, R2                      ; F133   0302 0302
        SUB     G_0302, R2                      ; F135   0302 0302
        DECLE   $0210,  $0000                   ; F137   0210 0000
L_F139:
        DECLE   $0000,  $0000                   ; F139   0000 0000

        BLE     G_EF16                          ; F13B   0226 0226
        BLE     G_EED4                          ; F13D   0226 026A

        SAR     R2,     2                       ; F13F   006E
        BLE     G_EF1B                          ; F140   0226 0226
        BLE     G_EF1D                          ; F142   0226 0226
        BGT     L_F146                          ; F144   020E 0000

L_F146:
        DECR    R2                              ; F146   0012
        BLE     G_EF22                          ; F147   0226 0226
        BLE     G_EEE0                          ; F149   0226 026A

        SAR     R2,     2                       ; F14B   006E
        BLE     G_EF27                          ; F14C   0226 0226
        BLE     G_EE2C                          ; F14E   0226 0323

        SUB@    R4,     R3                      ; F150   0323
        SUB@    R6,     R6                      ; F151   0336
        DECLE   $0210                           ; F152   0210

        SUB@    R4,     R3                      ; F153   0323
        SUB@    R4,     R3                      ; F154   0323
        SUB@    R4,     R3                      ; F155   0323
        SUB@    R4,     R3                      ; F156   0323
        SUB@    R4,     R3                      ; F157   0323
L_F158:
        DECLE   $0210,  $0000                   ; F158   0210 0000

        SUB@    R4,     R3                      ; F15A   0323
        SUB@    R6,     R6                      ; F15B   0336
        SUB@    R4,     R3                      ; F15C   0323
        SUB@    R4,     R3                      ; F15D   0323
        DECLE   $0210                           ; F15E   0210

        SUB@    R6,     R6                      ; F15F   0336
        SUB@    R4,     R3                      ; F160   0323
        SUB@    R4,     R3                      ; F161   0323
        SUB@    R4,     R3                      ; F162   0323
        DECLE   $0000                           ; F163   0000

        DECR    R2                              ; F164   0012
        BLE     G_EF40                          ; F165   0226 0226
        BLE     G_EF42                          ; F167   0226 0226
        BGT     L_F17D                          ; F169   020E 0012
        BLE     G_EF46                          ; F16B   0226 0226
        BLE     G_EF48                          ; F16D   0226 0226
L_F16F:
        BGT     L_F183                          ; F16F   020E 0012
        BLE     G_EF4C                          ; F171   0226 0226
        BLE     G_EF4E                          ; F173   0226 0226
        BGT     L_F177                          ; F175   020E 0000

L_F177:
        DECLE   $0000                           ; F177   0000

        SUB@    R4,     R3                      ; F178   0323
        SUB@    R4,     R3                      ; F179   0323
        SUB@    R4,     R3                      ; F17A   0323
        SUB@    R4,     R3                      ; F17B   0323
        SUB@    R6,     R6                      ; F17C   0336
L_F17D:
        DECLE   $0210                           ; F17D   0210

        SUB@    R4,     R3                      ; F17E   0323
        SUB@    R6,     R6                      ; F17F   0336
L_F180:
        SUB@    R4,     R3                      ; F180   0323
        SUB@    R4,     R3                      ; F181   0323
        SUB@    R4,     R3                      ; F182   0323
L_F183:
        DECLE   $0210                           ; F183   0210

        SUB@    R6,     R6                      ; F184   0336
        SUB@    R4,     R3                      ; F185   0323
        SUB@    R4,     R3                      ; F186   0323
        SUB@    R4,     R3                      ; F187   0323
        SUB@    R4,     R3                      ; F188   0323
        DECLE   $0210,  $0000                   ; F189   0210 0000

        BLE     G_EF66                          ; F18B   0226 0226
        BLE     G_EF2C                          ; F18D   0226 0262

        SLR     R2,     2                       ; F18F   0066
        BLE     G_EF6B                          ; F190   0226 0226
        BLE     G_EF6D                          ; F192   0226 0226
        BGT     L_F196                          ; F194   020E 0000

L_F196:
        DECR    R2                              ; F196   0012
        BLE     G_EF72                          ; F197   0226 0226
        BLE     G_EF38                          ; F199   0226 0262

        SLR     R2,     2                       ; F19B   0066
        BLE     G_EF77                          ; F19C   0226 0226
        BLE     G_EE7C                          ; F19E   0226 0323

        SUB@    R4,     R3                      ; F1A0   0323
        SUB@    R6,     R6                      ; F1A1   0336
        DECLE   $0210                           ; F1A2   0210

        SUB@    R4,     R3                      ; F1A3   0323
        SUB@    R4,     R3                      ; F1A4   0323
        SUB@    R4,     R3                      ; F1A5   0323
        SUB@    R4,     R3                      ; F1A6   0323
        SUB@    R4,     R3                      ; F1A7   0323
        DECLE   $0210,  $0000                   ; F1A8   0210 0000

        SUB@    R4,     R3                      ; F1AA   0323
        SUB@    R6,     R6                      ; F1AB   0336
        SUB@    R4,     R3                      ; F1AC   0323
        SUB@    R4,     R3                      ; F1AD   0323
        DECLE   $0210                           ; F1AE   0210

        SUB@    R6,     R6                      ; F1AF   0336
        SUB@    R4,     R3                      ; F1B0   0323
        SUB@    R4,     R3                      ; F1B1   0323
        SUB@    R4,     R3                      ; F1B2   0323
        DECLE   $0000                           ; F1B3   0000

        DECR    R2                              ; F1B4   0012
        BLE     G_EF90                          ; F1B5   0226 0226
        BLE     G_EF92                          ; F1B7   0226 0226
        BGT     L_F1CD                          ; F1B9   020E 0012
        BLE     G_EF96                          ; F1BB   0226 0226
        BLE     G_EF98                          ; F1BD   0226 0226
        BGT     L_F1D3                          ; F1BF   020E 0012
        BLE     G_EF9C                          ; F1C1   0226 0226
        BLE     G_EF9E                          ; F1C3   0226 0226
        BGT     L_F1C7                          ; F1C5   020E 0000

L_F1C7:
        DECLE   $0000                           ; F1C7   0000

        SUB@    R4,     R3                      ; F1C8   0323
        SUB@    R4,     R3                      ; F1C9   0323
        SUB@    R4,     R3                      ; F1CA   0323
        SUB@    R4,     R3                      ; F1CB   0323
        SUB@    R6,     R6                      ; F1CC   0336
L_F1CD:
        DECLE   $0210                           ; F1CD   0210

        SUB@    R4,     R3                      ; F1CE   0323
        SUB@    R6,     R6                      ; F1CF   0336
        SUB@    R4,     R3                      ; F1D0   0323
        SUB@    R4,     R3                      ; F1D1   0323
        SUB@    R4,     R3                      ; F1D2   0323
L_F1D3:
        DECLE   $0210                           ; F1D3   0210

        SUB@    R6,     R6                      ; F1D4   0336
        SUB@    R4,     R3                      ; F1D5   0323
        SUB@    R4,     R3                      ; F1D6   0323
        SUB@    R4,     R3                      ; F1D7   0323
        SUB@    R4,     R3                      ; F1D8   0323
        DECLE   $0210,  $0000                   ; F1D9   0210 0000

        BLE     G_EFB6                          ; F1DB   0226 0226
        BLE     G_EF74                          ; F1DD   0226 026A

        SAR     R2,     2                       ; F1DF   006E
        BLE     G_EFBB                          ; F1E0   0226 0226
        BLE     G_EFBD                          ; F1E2   0226 0226
        BGT     L_F1E6                          ; F1E4   020E 0000

L_F1E6:
        DECR    R2                              ; F1E6   0012
        BLE     G_EFC2                          ; F1E7   0226 0226
        BLE     G_EF80                          ; F1E9   0226 026A

        SAR     R2,     2                       ; F1EB   006E
        BLE     G_EFC7                          ; F1EC   0226 0226
        BLE     G_EECC                          ; F1EE   0226 0323

        SUB@    R4,     R3                      ; F1F0   0323
        SUB@    R4,     R3                      ; F1F1   0323
        DECLE   $0210                           ; F1F2   0210

        SUB@    R4,     R3                      ; F1F3   0323
        SUB@    R4,     R3                      ; F1F4   0323
        SUB@    R4,     R3                      ; F1F5   0323
        SUB@    R4,     R3                      ; F1F6   0323
        SUB@    R4,     R3                      ; F1F7   0323
        DECLE   $0212                           ; F1F8   0212

        SUBR    R0,     R0                      ; F1F9   0100
        SUB@    R4,     R3                      ; F1FA   0323
        SUB@    R6,     R6                      ; F1FB   0336
        SUB@    R4,     R3                      ; F1FC   0323
        SUB@    R4,     R3                      ; F1FD   0323
        B       L_F536                          ; F1FE   0200 0336

        SUB@    R4,     R3                      ; F200   0323
        SUB@    R4,     R3                      ; F201   0323
        SUB@    R4,     R3                      ; F202   0323
        DECLE   $0000,  $0000,  $0000,  $0000   ; F203   0000 0000 0000 0000
        DECLE   $0000                           ; F207   0000

        SUB     G_0302, R2                      ; F208   0302 0302
        SUB     G_0302, R2                      ; F20A   0302 0302
        SUB     G_0302, R2                      ; F20C   0302 0302
        SUB     G_0302, R2                      ; F20E   0302 0302
        SUB     G_0302, R2                      ; F210   0302 0302
        DECLE   $0210,  $0000,  $0000,  $0000   ; F212   0210 0000 0000 0000
        DECLE   $0000                           ; F216   0000

        BLE     G_EFF2                          ; F217   0226 0226
        BLE     G_EFF4                          ; F219   0226 0226
        BLE     G_EFF6                          ; F21B   0226 0226
        BLE     G_EFF8                          ; F21D   0226 0226
        BLE     L_F012                          ; F21F   0226 020E

        DECLE   $0000                           ; F221   0000
L_F222:
        DECR    R2                              ; F222   0012
        BLE     G_EFFE                          ; F223   0226 0226
        BLE     L_F000                          ; F225   0226 0226
        BLE     L_F002                          ; F227   0226 0226
        BLE     L_F004                          ; F229   0226 0226

        SUB@    R4,     R3                      ; F22B   0323
        SUB@    R6,     R6                      ; F22C   0336
        SUB@    R4,     R3                      ; F22D   0323
        SUB@    R4,     R3                      ; F22E   0323
        SUB@    R4,     R3                      ; F22F   0323
        SUB@    R4,     R3                      ; F230   0323
        SUB@    R4,     R3                      ; F231   0323
        SUB@    R4,     R3                      ; F232   0323
        SUB@    R4,     R3                      ; F233   0323
        DECLE   $0210,  $0000                   ; F234   0210 0000

        SUB@    R4,     R3                      ; F236   0323
        SUB@    R6,     R6                      ; F237   0336
        SUB@    R4,     R3                      ; F238   0323
        SUB@    R4,     R3                      ; F239   0323
        SUB@    R4,     R3                      ; F23A   0323
        SUB@    R4,     R3                      ; F23B   0323
        SUB@    R4,     R3                      ; F23C   0323
        SUB@    R6,     R6                      ; F23D   0336
        SUB@    R4,     R3                      ; F23E   0323
        DECLE   $0000                           ; F23F   0000

        SUB@    R6,     R6                      ; F240   0336
        DECLE   $0000,  $0000,  $0000,  $0000   ; F241   0000 0000 0000 0000

        DECR    R2                              ; F245   0012
        BLE     L_F021                          ; F246   0226 0226
        BLE     L_F023                          ; F248   0226 0226
        BLE     L_F025                          ; F24A   0226 0226
        BGT     L_F24E                          ; F24C   020E 0000

L_F24E:
        DECLE   $0000,  $0000,  $0000           ; F24E   0000 0000 0000

        SUB@    R6,     R6                      ; F251   0336
        DECLE   $0000,  $0000                   ; F252   0000 0000

        SUB@    R6,     R6                      ; F254   0336
        DECLE   $0000,  $0000,  $0000,  $0000   ; F255   0000 0000 0000 0000

        SUB@    R4,     R3                      ; F259   0323
        SUB@    R4,     R3                      ; F25A   0323
        SUB@    R6,     R6                      ; F25B   0336
        SUB@    R4,     R3                      ; F25C   0323
        SUB@    R4,     R3                      ; F25D   0323
        SUB@    R4,     R3                      ; F25E   0323
        SUB@    R4,     R3                      ; F25F   0323
        DECLE   $0210,  $0000,  $0000,  $0000   ; F260   0210 0000 0000 0000
        DECLE   $0000                           ; F264   0000

        SUB@    R6,     R6                      ; F265   0336
        DECLE   $0000                           ; F266   0000

        BLE     L_F042                          ; F267   0226 0226
        BLE     L_F044                          ; F269   0226 0226
        BLE     L_F046                          ; F26B   0226 0226
        BLE     L_F048                          ; F26D   0226 0226
        BLE     L_F062                          ; F26F   0226 020E

        DECLE   $0000                           ; F271   0000
L_F272:
        DECR    R2                              ; F272   0012
        BLE     L_F04E                          ; F273   0226 0226
        BLE     L_F050                          ; F275   0226 0226
        BLE     L_F052                          ; F277   0226 0226
        BLE     L_F054                          ; F279   0226 0226

        SUB@    R4,     R3                      ; F27B   0323
        SUB@    R4,     R3                      ; F27C   0323
        SUB@    R6,     R6                      ; F27D   0336
        SUB@    R4,     R3                      ; F27E   0323
        SUB@    R4,     R3                      ; F27F   0323
        SUB@    R4,     R3                      ; F280   0323
        SUB@    R4,     R3                      ; F281   0323
        SUB@    R4,     R3                      ; F282   0323
        SUB@    R4,     R3                      ; F283   0323
L_F284:
        DECLE   $0210,  $0000                   ; F284   0210 0000

        SUB@    R4,     R3                      ; F286   0323
        SUB@    R6,     R6                      ; F287   0336
        SUB@    R4,     R3                      ; F288   0323
        SUB@    R4,     R3                      ; F289   0323
        SUB@    R4,     R3                      ; F28A   0323
        SUB@    R4,     R3                      ; F28B   0323
        SUB@    R6,     R6                      ; F28C   0336
        SUB@    R4,     R3                      ; F28D   0323
        SUB@    R4,     R3                      ; F28E   0323
        DECLE   $0000,  $0000                   ; F28F   0000 0000

        SUB@    R6,     R6                      ; F291   0336
        DECLE   $0000,  $0000,  $0000           ; F292   0000 0000 0000

        DECR    R2                              ; F295   0012
        BLE     L_F071                          ; F296   0226 0226
        BLE     L_F073                          ; F298   0226 0226
        BLE     L_F075                          ; F29A   0226 0226
        BGT     L_F29E                          ; F29C   020E 0000

L_F29E:
        DECLE   $0000,  $0000                   ; F29E   0000 0000

        SUB@    R6,     R6                      ; F2A0   0336
        DECLE   $0000,  $0000,  $0000,  $0000   ; F2A1   0000 0000 0000 0000

        SUB@    R6,     R6                      ; F2A5   0336
        DECLE   $0000,  $0000,  $0000           ; F2A6   0000 0000 0000

        SUB@    R4,     R3                      ; F2A9   0323
        SUB@    R4,     R3                      ; F2AA   0323
        SUB@    R6,     R6                      ; F2AB   0336
        SUB@    R4,     R3                      ; F2AC   0323
        SUB@    R4,     R3                      ; F2AD   0323
        SUB@    R4,     R3                      ; F2AE   0323
        SUB@    R4,     R3                      ; F2AF   0323
        DECLE   $0210,  $0000,  $0000,  $0000   ; F2B0   0210 0000 0000 0000

        SUB@    R6,     R6                      ; F2B4   0336
        DECLE   $0000,  $0000                   ; F2B5   0000 0000

        BLE     L_F092                          ; F2B7   0226 0226
        BLE     L_F094                          ; F2B9   0226 0226
        BLE     L_F096                          ; F2BB   0226 0226
        BLE     L_F098                          ; F2BD   0226 0226
        BLE     L_F0B2                          ; F2BF   0226 020E

        DECLE   $0000                           ; F2C1   0000
L_F2C2:
        DECR    R2                              ; F2C2   0012
        BLE     L_F09E                          ; F2C3   0226 0226
        BLE     L_F0A0                          ; F2C5   0226 0226
        BLE     L_F0A2                          ; F2C7   0226 0226
        BLE     L_F0A4                          ; F2C9   0226 0226

        SUB@    R4,     R3                      ; F2CB   0323
        SUB@    R4,     R3                      ; F2CC   0323
        SUB@    R4,     R3                      ; F2CD   0323
        SUB@    R4,     R3                      ; F2CE   0323
        DECLE   $0210                           ; F2CF   0210

        SUB@    R4,     R3                      ; F2D0   0323
        SUB@    R4,     R3                      ; F2D1   0323
        SUB@    R4,     R3                      ; F2D2   0323
        SUB@    R4,     R3                      ; F2D3   0323
        DECLE   $0212                           ; F2D4   0212

        SUBR    R0,     R0                      ; F2D5   0100
        SUB@    R4,     R3                      ; F2D6   0323
L_F2D7:
        SUB@    R6,     R6                      ; F2D7   0336
        SUB@    R4,     R3                      ; F2D8   0323
        SUB@    R4,     R3                      ; F2D9   0323
        SUB@    R4,     R3                      ; F2DA   0323
        SUB@    R6,     R6                      ; F2DB   0336
        SUB@    R4,     R3                      ; F2DC   0323
        SUB@    R4,     R3                      ; F2DD   0323
        SUB@    R4,     R3                      ; F2DE   0323
        DECLE   $0000,  $0000,  $0000,  $0000   ; F2DF   0000 0000 0000 0000
        DECLE   $0000                           ; F2E3   0000

        SUB     G_0302, R2                      ; F2E4   0302 0302
        SUB     G_0302, R2                      ; F2E6   0302 0302
        SUB     G_0302, R2                      ; F2E8   0302 0302
        SUB     G_0302, R2                      ; F2EA   0302 0302
        SUB     G_0302, R2                      ; F2EC   0302 0302
        DECLE   $0210,  $0000,  $0000,  $0000   ; F2EE   0210 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F2F2   0000 0000 0000 0000

        DECR    R2                              ; F2F6   0012
        BLE     L_F0D2                          ; F2F7   0226 0226
        BLE     L_F0D4                          ; F2F9   0226 0226

        MVO@    R2,     R5                      ; F2FB   026A
        SAR     R2,     2                       ; F2FC   006E
        BLE     L_F0D8                          ; F2FD   0226 0226
        BGT     L_F301                          ; F2FF   020E 0000

L_F301:
        DECR    R2                              ; F301   0012
        BLE     L_F099                          ; F302   0226 026A

        SAR     R2,     2                       ; F304   006E
        BLE     L_F0E0                          ; F305   0226 0226

L_F307:
        DECLE   $0000,  $0000,  $0000           ; F307   0000 0000 0000

        SUB@    R4,     R3                      ; F30A   0323
        SUB@    R4,     R3                      ; F30B   0323
        SUB@    R4,     R3                      ; F30C   0323
        SUB@    R4,     R3                      ; F30D   0323
        SUB@    R4,     R3                      ; F30E   0323
        DECLE   $0210                           ; F30F   0210

        SUB@    R6,     R6                      ; F310   0336
        SUB@    R2,     R2                      ; F311   0312
        SUB@    R4,     R6                      ; F312   0326
        MVO@    R2,     R4                      ; F313   0262
        SLR     R2,     2                       ; F314   0066
        BGT     L_F63A                          ; F315   020E 0323

        DECLE   $0210                           ; F317   0210

        SUB@    R6,     R6                      ; F318   0336
        SUB@    R4,     R3                      ; F319   0323
        SUB@    R4,     R3                      ; F31A   0323
        DECLE   $0000,  $0000                   ; F31B   0000 0000

        DECR    R2                              ; F31D   0012
        BLE     L_F0F9                          ; F31E   0226 0226
        BLE     L_F0B7                          ; F320   0226 026A

        SAR     R2,     2                       ; F322   006E
        BLE     L_F0FE                          ; F323   0226 0226

        SUB@    R4,     R3                      ; F325   0323
        SUB@    R4,     R3                      ; F326   0323
        DECLE   $0210                           ; F327   0210

        SUB@    R4,     R3                      ; F328   0323
        DECLE   $0212                           ; F329   0212

        BLE     L_F0C1                          ; F32A   0226 026A

        SAR     R2,     2                       ; F32C   006E
        BLE     L_F108                          ; F32D   0226 0226

L_F32F:
        DECLE   $0000,  $0000                   ; F32F   0000 0000

        SUB@    R4,     R3                      ; F331   0323
        SUB@    R4,     R3                      ; F332   0323
        SUB@    R4,     R3                      ; F333   0323
        SUB@    R4,     R3                      ; F334   0323
        DECLE   $0210                           ; F335   0210

        SUB@    R6,     R6                      ; F336   0336
        SUB@    R2,     R2                      ; F337   0312
        SUB@    R4,     R6                      ; F338   0326
        MVO@    R2,     R4                      ; F339   0262
        SLR     R2,     2                       ; F33A   0066
L_F33B:
        SUB@    R4,     R6                      ; F33B   0326
        SUB@    R4,     R6                      ; F33C   0326
        BGT     L_F662                          ; F33D   020E 0323

        DECLE   $0210                           ; F33F   0210

        SUB@    R4,     R3                      ; F340   0323
        SUB@    R6,     R6                      ; F341   0336
        SUB@    R4,     R3                      ; F342   0323
        DECLE   $0000                           ; F343   0000
L_F344:
        DECR    R2                              ; F344   0012
        BLE     L_F120                          ; F345   0226 0226

        MVO@    R2,     R5                      ; F347   026A
        SAR     R2,     2                       ; F348   006E
        BLE     L_F124                          ; F349   0226 0226

        SUB@    R4,     R3                      ; F34B   0323
        SUB@    R4,     R3                      ; F34C   0323
        DECLE   $0210                           ; F34D   0210

        SUB@    R4,     R3                      ; F34E   0323
        SUB@    R4,     R3                      ; F34F   0323
        SUB@    R6,     R6                      ; F350   0336
        DECLE   $0212                           ; F351   0212

        BLE     L_F0E9                          ; F352   0226 026A

        SAR     R2,     2                       ; F354   006E
        BLE     L_F130                          ; F355   0226 0226

L_F357:
        DECLE   $0000                           ; F357   0000

        SUB@    R4,     R3                      ; F358   0323
        SUB@    R4,     R3                      ; F359   0323
        SUB@    R4,     R3                      ; F35A   0323
        DECLE   $0210                           ; F35B   0210

        SUB@    R6,     R6                      ; F35C   0336
        SUB@    R2,     R2                      ; F35D   0312
        SUB@    R4,     R6                      ; F35E   0326
        MVO@    R2,     R4                      ; F35F   0262
        SLR     R2,     2                       ; F360   0066
        SUB@    R4,     R6                      ; F361   0326
        SUB@    R4,     R6                      ; F362   0326
        SUB@    R4,     R6                      ; F363   0326
        SUB@    R4,     R6                      ; F364   0326
        BGT     L_F68A                          ; F365   020E 0323

        DECLE   $0210                           ; F367   0210

        SUB@    R6,     R6                      ; F368   0336
        SUB@    R4,     R3                      ; F369   0323
        SUB@    R4,     R3                      ; F36A   0323
        DECR    R2                              ; F36B   0012
        BLE     L_F103                          ; F36C   0226 026A

        SAR     R2,     2                       ; F36E   006E
        BLE     L_F14A                          ; F36F   0226 0226

        SUB@    R4,     R3                      ; F371   0323
        SUB@    R4,     R3                      ; F372   0323
        DECLE   $0210                           ; F373   0210

        SUB@    R4,     R3                      ; F374   0323
        SUB@    R4,     R3                      ; F375   0323
        SUB@    R4,     R3                      ; F376   0323
        SUB@    R4,     R3                      ; F377   0323
        SUB@    R4,     R3                      ; F378   0323
        DECLE   $0212                           ; F379   0212

        BLE     L_F111                          ; F37A   0226 026A

        SAR     R2,     2                       ; F37C   006E
        BLE     L_F158                          ; F37D   0226 0226

        SUB@    R4,     R3                      ; F37F   0323
        SUB@    R4,     R3                      ; F380   0323
        DECLE   $0210                           ; F381   0210

        SUB@    R6,     R6                      ; F382   0336
        SUB@    R2,     R2                      ; F383   0312
        SUB@    R4,     R6                      ; F384   0326
        MVO@    R2,     R4                      ; F385   0262
        SLR     R2,     2                       ; F386   0066
        SUB@    R4,     R6                      ; F387   0326
        SUB@    R4,     R6                      ; F388   0326
        SUB@    R4,     R6                      ; F389   0326
        SUB@    R4,     R6                      ; F38A   0326
        SUB@    R4,     R6                      ; F38B   0326
        SUB@    R4,     R6                      ; F38C   0326
        BGT     L_F6B2                          ; F38D   020E 0323

        DECLE   $0210                           ; F38F   0210

        SUB@    R4,     R3                      ; F390   0323
        SUB@    R6,     R6                      ; F391   0336
        SUB@    R4,     R3                      ; F392   0323
        BLE     L_F16E                          ; F393   0226 0226
        BLE     L_F170                          ; F395   0226 0226

        SUB@    R4,     R3                      ; F397   0323
        SUB@    R4,     R3                      ; F398   0323
        DECLE   $0210                           ; F399   0210

        SUB@    R4,     R3                      ; F39A   0323
        SUB@    R4,     R3                      ; F39B   0323
        SUB@    R4,     R3                      ; F39C   0323
        SUB@    R4,     R3                      ; F39D   0323
        SUB@    R6,     R6                      ; F39E   0336
        SUB@    R4,     R3                      ; F39F   0323
        SUB@    R4,     R3                      ; F3A0   0323
        DECLE   $0212                           ; F3A1   0212

        BLE     L_F139                          ; F3A2   0226 026A

        SAR     R2,     2                       ; F3A4   006E
        BLE     L_F180                          ; F3A5   0226 0226

        SUB@    R4,     R3                      ; F3A7   0323
        SUB@    R4,     R3                      ; F3A8   0323
        SUB@    R2,     R2                      ; F3A9   0312
        SUB@    R4,     R6                      ; F3AA   0326
        MVO@    R2,     R4                      ; F3AB   0262
        SLR     R2,     2                       ; F3AC   0066
        SUB@    R4,     R6                      ; F3AD   0326
        SUB@    R4,     R6                      ; F3AE   0326
        SUB@    R4,     R6                      ; F3AF   0326
        SUB@    R4,     R6                      ; F3B0   0326
        SUB@    R4,     R6                      ; F3B1   0326
        SUB@    R4,     R6                      ; F3B2   0326
        SUB@    R4,     R6                      ; F3B3   0326
        SUB@    R4,     R6                      ; F3B4   0326
        BGT     L_F6DA                          ; F3B5   020E 0323

        DECLE   $0210                           ; F3B7   0210

        SUB@    R4,     R3                      ; F3B8   0323
        SUB@    R4,     R3                      ; F3B9   0323
        SUB@    R4,     R3                      ; F3BA   0323
        DECLE   $0000,  $0000                   ; F3BB   0000 0000

        SUB     G_0302, R2                      ; F3BD   0302 0302
        DECLE   $0210                           ; F3BF   0210

        SUB     G_0302, R2                      ; F3C0   0302 0302
        SUB     G_0302, R2                      ; F3C2   0302 0302
        SUB     G_0302, R2                      ; F3C4   0302 0302
        SUB     G_0302, R2                      ; F3C6   0302 0302
        SUB     G_0102, R2                      ; F3C8   0302 0102
        DECLE   $0000,  $0000,  $0000,  $0000   ; F3CA   0000 0000 0000 0000
        DECLE   $0000                           ; F3CE   0000

        NEGR    R6                              ; F3CF   0026
        SLLC    R2,     1                       ; F3D0   005A
        RLC     R2,     2                       ; F3D1   0056
        DECR    R2                              ; F3D2   0012
        NEGR    R6                              ; F3D3   0026
        SLLC    R2,     1                       ; F3D4   005A
        RLC     R2,     2                       ; F3D5   0056
        DECR    R2                              ; F3D6   0012
        NEGR    R6                              ; F3D7   0026
        SLLC    R2,     1                       ; F3D8   005A
        RLC     R2,     2                       ; F3D9   0056
        DECR    R2                              ; F3DA   0012
        NEGR    R6                              ; F3DB   0026
        SLLC    R2,     1                       ; F3DC   005A
        RLC     R2,     2                       ; F3DD   0056
        DECR    R2                              ; F3DE   0012
        NEGR    R6                              ; F3DF   0026
        SLLC    R2,     1                       ; F3E0   005A
        RLC     R2,     2                       ; F3E1   0056
        DECR    R2                              ; F3E2   0012
        BGT     L_F437                          ; F3E3   020E 0052

        SLLC    R2,     2                       ; F3E5   005E
        NEGR    R6                              ; F3E6   0026
        BGT     L_F43B                          ; F3E7   020E 0052

        SLLC    R2,     2                       ; F3E9   005E
        NEGR    R6                              ; F3EA   0026
        BGT     L_F43F                          ; F3EB   020E 0052

        SLLC    R2,     2                       ; F3ED   005E
        NEGR    R6                              ; F3EE   0026
        BGT     L_F443                          ; F3EF   020E 0052

        SLLC    R2,     2                       ; F3F1   005E
        NEGR    R6                              ; F3F2   0026
        BGT     L_F447                          ; F3F3   020E 0052

        SLLC    R2,     2                       ; F3F5   005E
        NEGR    R6                              ; F3F6   0026
        INCR    R7                              ; F3F7   000F
        DECLE   $0000                           ; F3F8   0000

        SUB     G_0336, R2                      ; F3F9   0302 0336
        INCR    R7                              ; F3FB   000F
        DECLE   $0000                           ; F3FC   0000

        SUB     G_0336, R2                      ; F3FD   0302 0336
        INCR    R7                              ; F3FF   000F
        DECLE   $0000                           ; F400   0000

        SUB     G_0336, R2                      ; F401   0302 0336
        INCR    R7                              ; F403   000F
        DECLE   $0000                           ; F404   0000

        SUB     G_0336, R2                      ; F405   0302 0336
        INCR    R7                              ; F407   000F
        DECLE   $0000                           ; F408   0000

        SUB@    R6,     R6                      ; F409   0336
        SUB     .STIC.A.6,R2                    ; F40A   0302 0016
        SWAP    R2,     1                       ; F40C   0042
        RSWD    R6                              ; F40D   003E
        SUBR    R4,     R6                      ; F40E   0126
        DECR    R6                              ; F40F   0016
        SWAP    R2,     1                       ; F410   0042
        RSWD    R6                              ; F411   003E
        SUBR    R4,     R6                      ; F412   0126
        DECR    R6                              ; F413   0016
        SWAP    R2,     1                       ; F414   0042
        RSWD    R6                              ; F415   003E
        SUBR    R4,     R6                      ; F416   0126
        DECR    R6                              ; F417   0016
        SWAP    R2,     1                       ; F418   0042
        RSWD    R6                              ; F419   003E
        SUBR    R4,     R6                      ; F41A   0126
        DECR    R6                              ; F41B   0016
        SWAP    R2,     1                       ; F41C   0042
        RSWD    R6                              ; F41D   003E
        SUBR    R4,     R6                      ; F41E   0126
        SUBR    R4,     R6                      ; F41F   0126
        RSWD    R2                              ; F420   003A
        SWAP    R2,     2                       ; F421   0046
        DECLE   $021A                           ; F422   021A

        SUBR    R4,     R6                      ; F423   0126
        RSWD    R2                              ; F424   003A
        SWAP    R2,     2                       ; F425   0046
        DECLE   $021A                           ; F426   021A

        SUBR    R4,     R6                      ; F427   0126
        RSWD    R2                              ; F428   003A
        SWAP    R2,     2                       ; F429   0046
        DECLE   $021A                           ; F42A   021A

        SUBR    R4,     R6                      ; F42B   0126
        RSWD    R2                              ; F42C   003A
        SWAP    R2,     2                       ; F42D   0046
        DECLE   $021A                           ; F42E   021A

        SUBR    R4,     R6                      ; F42F   0126
        RSWD    R2                              ; F430   003A
        SWAP    R2,     2                       ; F431   0046
        DECLE   $021A                           ; F432   021A

        SUB     G_0336, R2                      ; F433   0302 0336
        DECLE   $0000,  $0214                   ; F435   0000 0214
L_F437:
        SUB@    R6,     R6                      ; F437   0336
        SUB     .STIC.X.0,R2                    ; F438   0302 0000
        DECLE   $0214                           ; F43A   0214
L_F43B:
        SUB@    R6,     R6                      ; F43B   0336
        SUB     .STIC.X.0,R2                    ; F43C   0302 0000
        DECLE   $0214                           ; F43E   0214
L_F43F:
        SUB@    R6,     R6                      ; F43F   0336
        SUB     .STIC.X.0,R2                    ; F440   0302 0000
        DECLE   $0214                           ; F442   0214
L_F443:
        SUB@    R6,     R6                      ; F443   0336
        SUB     .STIC.X.0,R2                    ; F444   0302 0000
        DECLE   $0214                           ; F446   0214
L_F447:
        NEGR    R6                              ; F447   0026
        SLLC    R2,     1                       ; F448   005A
        RLC     R2,     2                       ; F449   0056
        DECR    R2                              ; F44A   0012
        NEGR    R6                              ; F44B   0026
        SLLC    R2,     1                       ; F44C   005A
        RLC     R2,     2                       ; F44D   0056
        DECR    R2                              ; F44E   0012
        NEGR    R6                              ; F44F   0026
        SLLC    R2,     1                       ; F450   005A
        RLC     R2,     2                       ; F451   0056
        DECR    R2                              ; F452   0012
        NEGR    R6                              ; F453   0026
        SLLC    R2,     1                       ; F454   005A
        RLC     R2,     2                       ; F455   0056
        DECR    R2                              ; F456   0012
        NEGR    R6                              ; F457   0026
        SLLC    R2,     1                       ; F458   005A
        RLC     R2,     2                       ; F459   0056
        DECR    R2                              ; F45A   0012
        BGT     L_F4AF                          ; F45B   020E 0052

        SLLC    R2,     2                       ; F45D   005E
        NEGR    R6                              ; F45E   0026
        BGT     L_F4B3                          ; F45F   020E 0052

        SLLC    R2,     2                       ; F461   005E
        NEGR    R6                              ; F462   0026
        BGT     L_F4B7                          ; F463   020E 0052

        SLLC    R2,     2                       ; F465   005E
        NEGR    R6                              ; F466   0026
        BGT     L_F4BB                          ; F467   020E 0052

        SLLC    R2,     2                       ; F469   005E
        NEGR    R6                              ; F46A   0026
        BGT     L_F4BF                          ; F46B   020E 0052

        SLLC    R2,     2                       ; F46D   005E
        NEGR    R6                              ; F46E   0026
        INCR    R7                              ; F46F   000F
        DECLE   $0000                           ; F470   0000

        SUB     G_0336, R2                      ; F471   0302 0336
        INCR    R7                              ; F473   000F
        DECLE   $0000                           ; F474   0000

        SUB     G_0336, R2                      ; F475   0302 0336
        INCR    R7                              ; F477   000F
        DECLE   $0000                           ; F478   0000

        SUB     G_0336, R2                      ; F479   0302 0336
        INCR    R7                              ; F47B   000F
        DECLE   $0000                           ; F47C   0000

        SUB     G_0336, R2                      ; F47D   0302 0336
        INCR    R7                              ; F47F   000F
        DECLE   $0000                           ; F480   0000

        SUB@    R6,     R6                      ; F481   0336
        SUB     G_0026, R2                      ; F482   0302 0026
        NEGR    R6                              ; F484   0026
        NEGR    R6                              ; F485   0026
        BGT     L_F49A                          ; F486   020E 0012

        NEGR    R6                              ; F488   0026
        NEGR    R6                              ; F489   0026
        NEGR    R6                              ; F48A   0026
        NEGR    R6                              ; F48B   0026
        NEGR    R6                              ; F48C   0026
        NEGR    R6                              ; F48D   0026
        NEGR    R6                              ; F48E   0026
        NEGR    R6                              ; F48F   0026
        NEGR    R6                              ; F490   0026
        SUBR    R4,     R6                      ; F491   0126
        NEGR    R6                              ; F492   0026
        BGT     L_F4A7                          ; F493   020E 0012

        SUBR    R4,     R6                      ; F495   0126
        NEGR    R6                              ; F496   0026
        SUB     G_0302, R2                      ; F497   0302 0302
        SUB     .STIC.Y.7,R2                    ; F499   0302 000F
        SUB     G_0302, R2                      ; F49B   0302 0302
        SUB     G_0302, R2                      ; F49D   0302 0302
        SUB     G_0302, R2                      ; F49F   0302 0302
        SUB     G_0302, R2                      ; F4A1   0302 0302
        SUB     G_0302, R2                      ; F4A3   0302 0302
        SUB     G_0302, R2                      ; F4A5   0302 0302
L_F4A7:
        INCR    R7                              ; F4A7   000F
        SUB     G_0302, R2                      ; F4A8   0302 0302
        SUB     .STIC.X.0,R2                    ; F4AA   0302 0000
        DECR    R2                              ; F4AC   0012
        SUBR    R4,     R6                      ; F4AD   0126
        SUBR    R4,     R6                      ; F4AE   0126
L_F4AF:
        BGT     L_F4B1                          ; F4AF   020E 0000

L_F4B1:
        DECLE   $0000                           ; F4B1   0000

        DECR    R2                              ; F4B2   0012
L_F4B3:
        SUBR    R4,     R6                      ; F4B3   0126
        SUBR    R4,     R6                      ; F4B4   0126
        SUBR    R4,     R6                      ; F4B5   0126
        BGT     L_F4B8                          ; F4B6   020E 0000

L_F4B8:
        DECR    R2                              ; F4B8   0012
        SUBR    R4,     R6                      ; F4B9   0126
        SUBR    R4,     R6                      ; F4BA   0126
L_F4BB:
        BGT     L_F4BD                          ; F4BB   020E 0000

L_F4BD:
        DECLE   $0000,  $0000                   ; F4BD   0000 0000
L_F4BF:
        BGT     L_F7C1                          ; F4BF   020E 0300

        SUB@    R2,     R2                      ; F4C1   0312
        SUBR    R4,     R6                      ; F4C2   0126
        SUBR    R4,     R6                      ; F4C3   0126
        BGT     L_F4C6                          ; F4C4   020E 0000

L_F4C6:
        SUB     G_0312, R0                      ; F4C6   0300 0312
        SUBR    R4,     R6                      ; F4C8   0126
        SUBR    R4,     R6                      ; F4C9   0126
        BGT     L_F4CC                          ; F4CA   020E 0000

L_F4CC:
        SUB     G_0312, R0                      ; F4CC   0300 0312
        SUBR    R4,     R6                      ; F4CE   0126
        SUBR    R4,     R6                      ; F4CF   0126
        BGT     L_F4D2                          ; F4D0   020E 0000

L_F4D2:
        DECLE   $0000                           ; F4D2   0000

        INCR    R7                              ; F4D3   000F
        DECLE   $0000                           ; F4D4   0000

        SUB     G_0312, R0                      ; F4D5   0300 0312
        SUBR    R4,     R6                      ; F4D7   0126
        SUBR    R4,     R6                      ; F4D8   0126
        BGT     L_F4DB                          ; F4D9   020E 0000

L_F4DB:
        SUB     G_0312, R0                      ; F4DB   0300 0312
        SUBR    R4,     R6                      ; F4DD   0126
        SUBR    R4,     R6                      ; F4DE   0126
        BGT     L_F4E1                          ; F4DF   020E 0000

L_F4E1:
        SUB     G_0312, R0                      ; F4E1   0300 0312
        SUBR    R4,     R6                      ; F4E3   0126
        SUBR    R4,     R6                      ; F4E4   0126
        BGT     L_F4E7                          ; F4E5   020E 0000
L_F4E7:
        BGT     L_F4E9                          ; F4E7   020E 0000

L_F4E9:
        DECLE   $0000                           ; F4E9   0000

        SUB     G_0312, R0                      ; F4EA   0300 0312
        SUBR    R4,     R6                      ; F4EC   0126
        SUBR    R4,     R6                      ; F4ED   0126
        BGT     L_F4F0                          ; F4EE   020E 0000

L_F4F0:
        SUB     G_0312, R0                      ; F4F0   0300 0312
        SUBR    R4,     R6                      ; F4F2   0126
        SUBR    R4,     R6                      ; F4F3   0126
        BGT     L_F4F6                          ; F4F4   020E 0000

L_F4F6:
        SUB     G_0312, R0                      ; F4F6   0300 0312
        NEGR    R6                              ; F4F8   0026
        SUBR    R4,     R6                      ; F4F9   0126
        BLE     L_F2E9                          ; F4FA   0226 0212

        SUBR    R4,     R6                      ; F4FC   0126
        BGT     L_F4FF                          ; F4FD   020E 0000

L_F4FF:
        SUB     G_0312, R0                      ; F4FF   0300 0312
        SUBR    R4,     R6                      ; F501   0126
        SUBR    R4,     R6                      ; F502   0126
        BGT     L_F517                          ; F503   020E 0012
        BGT     L_F819                          ; F505   020E 0312

        SUBR    R4,     R6                      ; F507   0126
        SUBR    R4,     R6                      ; F508   0126
        BGT     L_F50B                          ; F509   020E 0000

L_F50B:
        SUB     G_0312, R0                      ; F50B   0300 0312
        SUBR    R4,     R6                      ; F50D   0126
        SUBR    R4,     R6                      ; F50E   0126
        SUB@    R2,     R2                      ; F50F   0312
        SUBR    R4,     R6                      ; F510   0126
        SUBR    R4,     R6                      ; F511   0126
        BGT     L_F526                          ; F512   020E 0012
        BGT     L_F828                          ; F514   020E 0312

        SUBR    R4,     R6                      ; F516   0126
L_F517:
        SUBR    R4,     R6                      ; F517   0126
        BGT     L_F529                          ; F518   020E 000F

        SUB     G_0312, R0                      ; F51A   0300 0312
        SUBR    R4,     R6                      ; F51C   0126
        SUBR    R4,     R6                      ; F51D   0126
        BGT     L_F520                          ; F51E   020E 0000

L_F520:
        SUB@    R2,     R2                      ; F520   0312
        SUBR    R4,     R6                      ; F521   0126
        BGT     L_F824                          ; F522   020E 0300

        SUB@    R2,     R2                      ; F524   0312
        SUBR    R4,     R6                      ; F525   0126
L_F526:
        SUBR    R4,     R6                      ; F526   0126
        BGT     L_F538                          ; F527   020E 000F

L_F529:
        SUB     G_0312, R0                      ; F529   0300 0312
        SUBR    R4,     R6                      ; F52B   0126
L_F52C:
        SUBR    R4,     R6                      ; F52C   0126
L_F52D:
        BGT     L_F541                          ; F52D   020E 0012

L_F52F:
        SUBR    R4,     R6                      ; F52F   0126
        SUBR    R4,     R6                      ; F530   0126
        SUBR    R4,     R6                      ; F531   0126
        SUBR    R4,     R6                      ; F532   0126
        SUBR    R4,     R6                      ; F533   0126
        SUBR    R4,     R6                      ; F534   0126
        BGT     L_F546                          ; F535   020E 000F
        BGT     L_F839                          ; F537   020E 0300

        SUB@    R2,     R2                      ; F539   0312
        SUBR    R4,     R6                      ; F53A   0126
        SUBR    R4,     R6                      ; F53B   0126
        BGT     L_F53E                          ; F53C   020E 0000

L_F53E:
        SUB     G_0312, R0                      ; F53E   0300 0312
        SUBR    R4,     R6                      ; F540   0126
L_F541:
        SUBR    R4,     R6                      ; F541   0126
        SUBR    R4,     R6                      ; F542   0126
        BGT     L_F845                          ; F543   020E 0300

        SUB     G_0312, R0                      ; F545   0300 0312
        SUBR    R4,     R6                      ; F547   0126
        BGT     L_F559                          ; F548   020E 000F

        DECLE   $0000                           ; F54A   0000

        INCR    R7                              ; F54B   000F
        DECLE   $0000                           ; F54C   0000

        SUB     G_0312, R0                      ; F54D   0300 0312
        SUBR    R4,     R6                      ; F54F   0126
        SUBR    R4,     R6                      ; F550   0126
        BGT     L_F553                          ; F551   020E 0000

L_F553:
        SUB     G_0312, R0                      ; F553   0300 0312
        SUBR    R4,     R6                      ; F555   0126
        BGT     L_F567                          ; F556   020E 000F

        DECLE   $0000                           ; F558   0000
L_F559:
        DECR    R2                              ; F559   0012
        SUBR    R4,     R6                      ; F55A   0126
        SUBR    R4,     R6                      ; F55B   0126
        SUBR    R4,     R6                      ; F55C   0126
        SUBR    R4,     R6                      ; F55D   0126
        SUBR    R4,     R6                      ; F55E   0126
        SUBR    R4,     R6                      ; F55F   0126
        SUBR    R4,     R6                      ; F560   0126
        SUBR    R4,     R6                      ; F561   0126
        BGT     L_F876                          ; F562   020E 0312

        SUBR    R4,     R6                      ; F564   0126
L_F565:
        SUBR    R4,     R6                      ; F565   0126
        SUBR    R4,     R6                      ; F566   0126
L_F567:
        SUBR    R4,     R6                      ; F567   0126
        SUBR    R4,     R6                      ; F568   0126
        SUBR    R4,     R6                      ; F569   0126
        SUBR    R4,     R6                      ; F56A   0126
        SUBR    R4,     R6                      ; F56B   0126
        SUBR    R4,     R6                      ; F56C   0126
        SUBR    R4,     R6                      ; F56D   0126
        SUBR    R4,     R6                      ; F56E   0126
        BGT     L_F871                          ; F56F   020E 0300

        SUB     G_0300, R0                      ; F571   0300 0300
        SUB     G_0300, R0                      ; F573   0300 0300
        SUB     .STIC.Y.7,R0                    ; F575   0300 000F
        SUB     G_0300, R0                      ; F577   0300 0300
        SUB     G_0300, R0                      ; F579   0300 0300
        SUB     G_0300, R0                      ; F57B   0300 0300
        SUB     G_0300, R0                      ; F57D   0300 0300
        SUB     G_0300, R0                      ; F57F   0300 0300
        SUB     G_0300, R0                      ; F581   0300 0300
        INCR    R7                              ; F583   000F
        DECLE   $0000,  $0000                   ; F584   0000 0000

        SUBR    R4,     R6                      ; F586   0126
        DECLE   $0000,  $0000,  $0000           ; F587   0000 0000 0000

        DECR    R2                              ; F58A   0012
        SUB@    R4,     R6                      ; F58B   0326
        SUB@    R4,     R6                      ; F58C   0326
        SUB@    R4,     R6                      ; F58D   0326
        BGT     L_F590                          ; F58E   020E 0000

L_F590:
        DECR    R2                              ; F590   0012
        SUB@    R4,     R6                      ; F591   0326
L_F592:
        SUB@    R4,     R6                      ; F592   0326
L_F593:
        SUB@    R4,     R6                      ; F593   0326
        BGT     L_F596                          ; F594   020E 0000

L_F596:
        DECR    R2                              ; F596   0012
L_F597:
        SUBR    R4,     R6                      ; F597   0126
        SUBR    R4,     R6                      ; F598   0126
        SUBR    R4,     R6                      ; F599   0126
        BGT     L_F6C2                          ; F59A   020E 0126

        NEGR    R6                              ; F59C   0026
        SUBR    R4,     R6                      ; F59D   0126
        CMP@    R3,     R2                      ; F59E   035A
        CMP@    R2,     R6                      ; F59F   0356
        SUB@    R2,     R2                      ; F5A0   0312
        BGT     L_F284                          ; F5A1   022E 031E

L_F5A3:
        SUB@    R6,     R2                      ; F5A3   0332
L_F5A4:
        BGT     L_F8A6                          ; F5A4   020E 0300

        SUB@    R2,     R2                      ; F5A6   0312
        BGT     L_F7AB                          ; F5A7   020E 0202

        DECR    R2                              ; F5A9   0012
        BGT     L_F8AC                          ; F5AA   020E 0300

        SUB@    R2,     R2                      ; F5AC   0312
        SUB@    R4,     R6                      ; F5AD   0326
        SUB@    R4,     R6                      ; F5AE   0326
        SUB@    R6,     R6                      ; F5AF   0336
        SUB@    R4,     R2                      ; F5B0   0322
        SUB@    R4,     R2                      ; F5B1   0322
        CMP@    R2,     R2                      ; F5B2   0352
        CMP@    R3,     R6                      ; F5B3   035E
        NEGR    R6                              ; F5B4   0026
        CMP@    R3,     R2                      ; F5B5   035A
        CMP@    R2,     R6                      ; F5B6   0356
        SUB@    R6,     R6                      ; F5B7   0336
        DECLE   $0210                           ; F5B8   0210

        DECR    R2                              ; F5B9   0012
        SUB@    R4,     R6                      ; F5BA   0326
        SUB@    R4,     R6                      ; F5BB   0326
L_F5BC:
        SUB@    R4,     R6                      ; F5BC   0326
        BGT     L_F7CF                          ; F5BD   020E 0210

        DECR    R2                              ; F5BF   0012
        BGT     L_F8C2                          ; F5C0   020E 0300

        SUB     G_0336, R0                      ; F5C2   0300 0336
        SUB     G_0300, R0                      ; F5C4   0300 0300
        SUB     G_0300, R0                      ; F5C6   0300 0300
        SUB     G_0352, R0                      ; F5C8   0300 0352
        CMP@    R3,     R6                      ; F5CA   035E
        SUB@    R4,     R6                      ; F5CB   0326
        SUB@    R4,     R6                      ; F5CC   0326
        BGT     L_F8F1                          ; F5CD   020E 0322

        SUB@    R6,     R6                      ; F5CF   0336
        SUB@    R4,     R2                      ; F5D0   0322
        DECLE   $0210,  $0000                   ; F5D1   0210 0000

        SUB@    R6,     R6                      ; F5D3   0336
        BOV     L_F7D8                          ; F5D4   0202 0202

        DECLE   $0000                           ; F5D6   0000
L_F5D7:
        SUB@    R4,     R6                      ; F5D7   0326
        SUB@    R4,     R6                      ; F5D8   0326
        SUB@    R4,     R6                      ; F5D9   0326
        SUB@    R4,     R6                      ; F5DA   0326
        BGT     L_F5DD                          ; F5DB   020E 0000

L_F5DD:
        SUB@    R2,     R4                      ; F5DD   0314
        SUB@    R6,     R6                      ; F5DE   0336
        SUB@    R4,     R2                      ; F5DF   0322
        SUB@    R4,     R2                      ; F5E0   0322
        DECLE   $0212                           ; F5E1   0212

        SUB@    R4,     R6                      ; F5E2   0326
        SUB@    R4,     R6                      ; F5E3   0326
        SUB@    R4,     R6                      ; F5E4   0326
        BGT     L_F5E7                          ; F5E5   020E 0000

L_F5E7:
        SUB@    R6,     R6                      ; F5E7   0336
        BOV     L_F7FC                          ; F5E8   0202 0212

        SUB@    R4,     R6                      ; F5EA   0326
        SUB     G_0300, R0                      ; F5EB   0300 0300
        SUB@    R2,     R2                      ; F5ED   0312
        SUB@    R4,     R6                      ; F5EE   0326
        SUB@    R4,     R6                      ; F5EF   0326
        SUB@    R4,     R6                      ; F5F0   0326
        SUB@    R4,     R6                      ; F5F1   0326
        SUB@    R4,     R6                      ; F5F2   0326
        SUB@    R4,     R6                      ; F5F3   0326
        BGT     L_F2D7                          ; F5F4   022E 031E

        SUB@    R6,     R2                      ; F5F6   0332
        SUB@    R4,     R6                      ; F5F7   0326
        SUB@    R4,     R6                      ; F5F8   0326
        SUB@    R4,     R6                      ; F5F9   0326
        SUB@    R4,     R6                      ; F5FA   0326
        SUB@    R5,     R6                      ; F5FB   032E
        SUB@    R6,     R2                      ; F5FC   0332
        SUB@    R4,     R6                      ; F5FD   0326
        SUB@    R4,     R6                      ; F5FE   0326
        SUB     .BTAB.10,R0                     ; F5FF   0300 0210
        SUB@    R6,     R6                      ; F601   0336
        BOV     L_F904                          ; F602   0202 0300

        SUB     G_0336, R0                      ; F604   0300 0336
        SUB     G_0300, R0                      ; F606   0300 0300
L_F608:
        BOV     L_F60A                          ; F608   0202 0000

L_F60A:
        SUB@    R4,     R2                      ; F60A   0322
        SUB@    R4,     R2                      ; F60B   0322
        SUB@    R4,     R2                      ; F60C   0322
        SUB@    R4,     R2                      ; F60D   0322
        SUB@    R4,     R2                      ; F60E   0322
        CMP     G_033E, R2                      ; F60F   0342 033E
        SUB@    R4,     R6                      ; F611   0326
        BGT     L_F614                          ; F612   020E 0000

L_F614:
        DECLE   $0000                           ; F614   0000

        SUB@    R6,     R6                      ; F615   0336
        DECLE   $0212                           ; F616   0212

        SUB@    R4,     R6                      ; F617   0326
        SUB@    R4,     R6                      ; F618   0326
        SUB@    R4,     R6                      ; F619   0326
L_F61A:
        SUB@    R4,     R6                      ; F61A   0326
        SUB@    R4,     R6                      ; F61B   0326
        SUB@    R4,     R6                      ; F61C   0326
        SUB@    R4,     R6                      ; F61D   0326
        BGT     L_F920                          ; F61E   020E 0300

        SUB     G_0300, R0                      ; F620   0300 0300
        CMP     G_034A, R2                      ; F622   0342 034A
        CMP     G_0336, R6                      ; F624   0346 0336
        DECLE   $0210                           ; F626   0210

        SUBR    R4,     R6                      ; F627   0126
        SUBR    R4,     R6                      ; F628   0126
        NEGR    R6                              ; F629   0026
        SUB@    R4,     R6                      ; F62A   0326
        BGT     L_F83D                          ; F62B   020E 0210

        SUB     G_0300, R0                      ; F62D   0300 0300
        SUB     G_0312, R0                      ; F62F   0300 0312
        BGT     L_F835                          ; F631   020E 0202

        SUB     G_0342, R0                      ; F633   0300 0342
        SUBI    #$033A, R6                      ; F635   033E 033A
        CMP     G_0312, R6                      ; F637   0346 0312
        SUB@    R4,     R6                      ; F639   0326
L_F63A:
        SUB@    R4,     R6                      ; F63A   0326
        SUB     G_0300, R0                      ; F63B   0300 0300
        SUB@    R2,     R2                      ; F63D   0312
        SUBR    R4,     R6                      ; F63E   0126
        SUBR    R4,     R6                      ; F63F   0126
        SUBR    R4,     R6                      ; F640   0126
        SUB@    R4,     R6                      ; F641   0326
        SUB@    R4,     R6                      ; F642   0326
        SUB@    R4,     R6                      ; F643   0326
        SUB@    R4,     R6                      ; F644   0326
        SUB@    R4,     R6                      ; F645   0326
        SUB@    R4,     R6                      ; F646   0326
        SUB@    R4,     R6                      ; F647   0326
        SUBI    #$0346, R2                      ; F648   033A 0346
        SUB     G_0312, R0                      ; F64A   0300 0312
        SUB@    R4,     R6                      ; F64C   0326
        SUB@    R4,     R6                      ; F64D   0326
        BGT     L_F650                          ; F64E   020E 0000

L_F650:
        DECLE   $0000                           ; F650   0000
L_F651:
        SUB     G_0300, R0                      ; F651   0300 0300
        SUB     G_0300, R0                      ; F653   0300 0300
        SUB     G_0300, R0                      ; F655   0300 0300
        SUB     G_0300, R0                      ; F657   0300 0300
        SUB     G_0300, R0                      ; F659   0300 0300
        SUB     G_0300, R0                      ; F65B   0300 0300
        SUB@    R2,     R0                      ; F65D   0310
        DECLE   $0000                           ; F65E   0000

        SUB@    R4,     R2                      ; F65F   0322
        SUB@    R4,     R2                      ; F660   0322
        SUB@    R4,     R2                      ; F661   0322
L_F662:
        DECLE   $0210                           ; F662   0210

        SUBR    R4,     R6                      ; F663   0126
        SUBR    R4,     R6                      ; F664   0126
        SUBR    R4,     R6                      ; F665   0126
        BGT     L_F67A                          ; F666   020E 0012

        SUBR    R4,     R6                      ; F668   0126
        SUBR    R4,     R6                      ; F669   0126
        BGT     L_F67E                          ; F66A   020E 0012

        SUBR    R4,     R6                      ; F66C   0126
        SUBR    R4,     R6                      ; F66D   0126
        BGT     L_F682                          ; F66E   020E 0012

        SUBR    R4,     R6                      ; F670   0126
        SUBR    R4,     R6                      ; F671   0126
        BGT     L_F686                          ; F672   020E 0012

        SUBR    R4,     R6                      ; F674   0126
        SUBR    R4,     R6                      ; F675   0126
        SUBR    R4,     R6                      ; F676   0126
        SUB     G_0336, R0                      ; F677   0300 0336
        SUB     .BTAB.10,R0                     ; F679   0300 0210
        SUB     G_0336, R0                      ; F67B   0300 0336
        SUB     .BTAB.10,R0                     ; F67D   0300 0210
        SUB     G_0336, R0                      ; F67F   0300 0336
        SUB     .BTAB.10,R0                     ; F681   0300 0210
        SUB     G_0336, R0                      ; F683   0300 0336
        SUB     .BTAB.10,R0                     ; F685   0300 0210
        SUB     G_0336, R0                      ; F687   0300 0336
        SUB     G_0300, R0                      ; F689   0300 0300
        DECLE   $0000                           ; F68B   0000

        SUB@    R6,     R6                      ; F68C   0336
L_F68D:
        DECR    R2                              ; F68D   0012
        SUBR    R4,     R6                      ; F68E   0126
        MVO@    R2,     R5                      ; F68F   026A
        SAR     R2,     2                       ; F690   006E
        SUBR    R4,     R6                      ; F691   0126
L_F692:
        SUBR    R4,     R6                      ; F692   0126
        BGT     L_F9CB                          ; F693   020E 0336

        DECR    R2                              ; F695   0012
        SUB@    R4,     R6                      ; F696   0326
        MVO@    R2,     R4                      ; F697   0262
        SLR     R2,     2                       ; F698   0066
        SUBR    R4,     R6                      ; F699   0126
        SUBR    R4,     R6                      ; F69A   0126
L_F69B:
        BGT     L_F9D3                          ; F69B   020E 0336

        DECLE   $0000,  $0000,  $0000           ; F69D   0000 0000 0000

        SUB@    R6,     R6                      ; F6A0   0336
        SUB     G_0300, R0                      ; F6A1   0300 0300
        SUB@    R6,     R6                      ; F6A3   0336
        SUB     G_0300, R0                      ; F6A4   0300 0300
        SUB@    R6,     R6                      ; F6A6   0336
        DECLE   $0210                           ; F6A7   0210

        SUB@    R6,     R6                      ; F6A8   0336
        SUB     G_0300, R0                      ; F6A9   0300 0300
        SUB@    R6,     R6                      ; F6AB   0336
        SUB     G_0300, R0                      ; F6AC   0300 0300
        SUB@    R6,     R6                      ; F6AE   0336
        DECLE   $0210                           ; F6AF   0210

        SUB@    R6,     R6                      ; F6B0   0336
        DECLE   $0000                           ; F6B1   0000
L_F6B2:
        DECLE   $0000                           ; F6B2   0000

        SUBR    R4,     R6                      ; F6B3   0126
        SUBR    R4,     R6                      ; F6B4   0126
        SUBR    R4,     R6                      ; F6B5   0126
        BGT     L_F9EE                          ; F6B6   020E 0336

        DECR    R2                              ; F6B8   0012
        SUB@    R4,     R6                      ; F6B9   0326
        SUB@    R4,     R6                      ; F6BA   0326
        SUB@    R4,     R6                      ; F6BB   0326
        SUB@    R4,     R6                      ; F6BC   0326
        SUB@    R4,     R6                      ; F6BD   0326
        BGT     L_F9F6                          ; F6BE   020E 0336

        DECR    R2                              ; F6C0   0012
        SUBR    R4,     R6                      ; F6C1   0126
L_F6C2:
        SUBR    R4,     R6                      ; F6C2   0126
        MVO@    R2,     R4                      ; F6C3   0262
        SLR     R2,     2                       ; F6C4   0066
        SUBR    R4,     R6                      ; F6C5   0126
        SUBR    R4,     R6                      ; F6C6   0126
        SUB     G_0336, R0                      ; F6C7   0300 0336
        SUB     .BTAB.10,R0                     ; F6C9   0300 0210
        SUB@    R6,     R6                      ; F6CB   0336
        SUB     G_0300, R0                      ; F6CC   0300 0300
        SUB     G_0336, R0                      ; F6CE   0300 0336
        SUB     G_0336, R0                      ; F6D0   0300 0336
        DECLE   $0210                           ; F6D2   0210

        SUB@    R6,     R6                      ; F6D3   0336
        SUB     G_0300, R0                      ; F6D4   0300 0300
        SUB     G_0336, R0                      ; F6D6   0300 0336
        SUB     G_0300, R0                      ; F6D8   0300 0300
L_F6DA:
        SUB     .STIC.X.0,R0                    ; F6DA   0300 0000
        SUB@    R6,     R6                      ; F6DC   0336
        DECR    R2                              ; F6DD   0012
        MVO@    R2,     R4                      ; F6DE   0262
        SLR     R2,     2                       ; F6DF   0066
        SUB@    R4,     R6                      ; F6E0   0326
        SUB@    R4,     R6                      ; F6E1   0326
        BGT     L_FA1A                          ; F6E2   020E 0336

        DECR    R2                              ; F6E4   0012
        SUB@    R4,     R6                      ; F6E5   0326
L_F6E6:
        MVO@    R2,     R5                      ; F6E6   026A
        SAR     R2,     2                       ; F6E7   006E
        SUB@    R4,     R6                      ; F6E8   0326
L_F6E9:
        SUB@    R4,     R6                      ; F6E9   0326
        BGT     L_FA22                          ; F6EA   020E 0336

L_F6EC:
        DECR    R2                              ; F6EC   0012
        SUBR    R4,     R6                      ; F6ED   0126
        SUBR    R4,     R6                      ; F6EE   0126
L_F6EF:
        DECLE   $0000                           ; F6EF   0000

        SUB@    R6,     R6                      ; F6F0   0336
        SUB     G_0336, R0                      ; F6F1   0300 0336
        SUB     G_0300, R0                      ; F6F3   0300 0300
L_F6F5:
        SUB     .BTAB.10,R0                     ; F6F5   0300 0210
        SUB@    R6,     R6                      ; F6F7   0336
L_F6F8:
        SUB     G_0300, R0                      ; F6F8   0300 0300
        SUB@    R6,     R6                      ; F6FA   0336
L_F6FB:
        SUB     G_0300, R0                      ; F6FB   0300 0300
        SUB     .BTAB.10,R0                     ; F6FD   0300 0210
L_F6FF:
        SUB@    R6,     R6                      ; F6FF   0336
        SUB     G_0336, R0                      ; F700   0300 0336
        SUB     G_0326, R0                      ; F702   0300 0326
        SUB@    R4,     R6                      ; F704   0326
        SUB@    R4,     R6                      ; F705   0326
        SUB@    R4,     R6                      ; F706   0326
L_F707:
        BGT     L_F71B                          ; F707   020E 0012

        SUB@    R4,     R6                      ; F709   0326
        SUB@    R4,     R6                      ; F70A   0326
        BGT     L_F71F                          ; F70B   020E 0012

        SUBR    R4,     R6                      ; F70D   0126
        SUBR    R4,     R6                      ; F70E   0126
        BGT     L_F723                          ; F70F   020E 0012

L_F711:
        SUBR    R4,     R6                      ; F711   0126
        SUBR    R4,     R6                      ; F712   0126
        BGT     L_F727                          ; F713   020E 0012

        SUBR    R4,     R6                      ; F715   0126
        SUBR    R4,     R6                      ; F716   0126
        SUB     G_0300, R0                      ; F717   0300 0300
L_F719:
        SUB     G_0300, R0                      ; F719   0300 0300
L_F71B:
        DECLE   $0210                           ; F71B   0210

        SUB     G_0300, R0                      ; F71C   0300 0300
        SUB     .BTAB.10,R0                     ; F71E   0300 0210
        SUB     G_0300, R0                      ; F720   0300 0300
        SUB     .BTAB.10,R0                     ; F722   0300 0210
        SUB     G_0300, R0                      ; F724   0300 0300
        SUB     .BTAB.10,R0                     ; F726   0300 0210
        SUB     G_0300, R0                      ; F728   0300 0300
        SUB     .STIC.X.0,R0                    ; F72A   0300 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F72C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F730   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F734   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F738   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; F73C   0000 0000 0000

        SUB@    R4,     R6                      ; F73F   0326
        BGT     L_F742                          ; F740   020E 0000

L_F742:
        DECR    R2                              ; F742   0012
        SUB@    R4,     R6                      ; F743   0326
        SUB@    R4,     R6                      ; F744   0326
        SUB@    R4,     R6                      ; F745   0326
        BGT     L_F748                          ; F746   020E 0000

L_F748:
        DECR    R2                              ; F748   0012
        SUB@    R4,     R6                      ; F749   0326
        BLE     L_F725                          ; F74A   0226 0026
        BGT     L_F74E                          ; F74C   020E 0000

L_F74E:
        DECR    R2                              ; F74E   0012
        SUBR    R4,     R6                      ; F74F   0126
        SUBR    R4,     R6                      ; F750   0126
        SUBR    R4,     R6                      ; F751   0126
        SUB@    R4,     R6                      ; F752   0326
        SUB@    R6,     R6                      ; F753   0336
        DECLE   $0210                           ; F754   0210

        DECR    R2                              ; F755   0012
        BGT     L_FA58                          ; F756   020E 0300

        SUB@    R6,     R6                      ; F758   0336
        SUB     .BTAB.10,R0                     ; F759   0300 0210
        DECR    R2                              ; F75B   0012
        BGT     L_FA5E                          ; F75C   020E 0300

        DECLE   $0210                           ; F75E   0210

        SUB@    R6,     R6                      ; F75F   0336
        DECLE   $0210                           ; F760   0210

        DECR    R2                              ; F761   0012
        BGT     L_FA64                          ; F762   020E 0300

        SUB@    R6,     R6                      ; F764   0336
        SUB     G_0300, R0                      ; F765   0300 0300
        MVO@    R2,     R4                      ; F767   0262
        SLR     R2,     2                       ; F768   0066
        BGT     L_F97B                          ; F769   020E 0210

        DECR    R2                              ; F76B   0012
        NEGR    R6                              ; F76C   0026
        SUB@    R4,     R6                      ; F76D   0326
        SUB@    R4,     R6                      ; F76E   0326
        BGT     L_F981                          ; F76F   020E 0210

        DECR    R2                              ; F771   0012
        SUB@    R4,     R6                      ; F772   0326
        MVO@    R2,     R5                      ; F773   026A
        SAR     R2,     2                       ; F774   006E
        BGT     L_F987                          ; F775   020E 0210

        DECR    R2                              ; F777   0012
        SUBR    R4,     R6                      ; F778   0126
        SUB@    R4,     R6                      ; F779   0326
        SUB@    R4,     R6                      ; F77A   0326
        DECLE   $0210                           ; F77B   0210

        SUB@    R6,     R6                      ; F77C   0336
        DECLE   $0210                           ; F77D   0210

        DECR    R2                              ; F77E   0012
        BGT     L_FA81                          ; F77F   020E 0300

        SUB@    R6,     R6                      ; F781   0336
        SUB     .BTAB.10,R0                     ; F782   0300 0210
        DECR    R2                              ; F784   0012
        BGT     L_FA87                          ; F785   020E 0300

        DECLE   $0210                           ; F787   0210

        SUB@    R6,     R6                      ; F788   0336
        DECLE   $0210                           ; F789   0210

        DECR    R2                              ; F78A   0012
        BGT     L_FA8D                          ; F78B   020E 0300

        SUB@    R6,     R6                      ; F78D   0336
        SUB     G_0102, R0                      ; F78E   0300 0102
        MVO@    R2,     R4                      ; F790   0262
        SLR     R2,     2                       ; F791   0066
        BGT     L_F9A4                          ; F792   020E 0210

L_F794:
        DECR    R2                              ; F794   0012
        SUB@    R4,     R6                      ; F795   0326
        SUB@    R4,     R6                      ; F796   0326
        SUB@    R4,     R6                      ; F797   0326
        BGT     L_F9AA                          ; F798   020E 0210

L_F79A:
        DECR    R2                              ; F79A   0012
        SUB@    R4,     R6                      ; F79B   0326
        MVO@    R2,     R5                      ; F79C   026A
        SAR     R2,     2                       ; F79D   006E
        BGT     L_F9B0                          ; F79E   020E 0210

        DECR    R2                              ; F7A0   0012
        SUB@    R4,     R6                      ; F7A1   0326
        SUB@    R4,     R6                      ; F7A2   0326
        SUB     .BTAB.10,R0                     ; F7A3   0300 0210
        SUB@    R6,     R6                      ; F7A5   0336
        DECLE   $0210                           ; F7A6   0210

        DECR    R2                              ; F7A7   0012
        BGT     L_FAAA                          ; F7A8   020E 0300

        SUB@    R6,     R6                      ; F7AA   0336
L_F7AB:
        SUB     .BTAB.10,R0                     ; F7AB   0300 0210
        DECR    R2                              ; F7AD   0012
        BGT     L_FAB0                          ; F7AE   020E 0300

        DECLE   $0210                           ; F7B0   0210

        SUB@    R6,     R6                      ; F7B1   0336
        DECLE   $0210                           ; F7B2   0210

        DECR    R2                              ; F7B3   0012
        BGT     L_FAB6                          ; F7B4   020E 0300

        SUB@    R6,     R6                      ; F7B6   0336
        SUB@    R4,     R6                      ; F7B7   0326
        SUB@    R4,     R6                      ; F7B8   0326
        MVO@    R2,     R4                      ; F7B9   0262
        SLR     R2,     2                       ; F7BA   0066
        BGT     L_F9CD                          ; F7BB   020E 0210

        DECR    R2                              ; F7BD   0012
        SUB@    R4,     R6                      ; F7BE   0326
        SUB@    R4,     R6                      ; F7BF   0326
L_F7C0:
        SUB@    R4,     R6                      ; F7C0   0326
L_F7C1:
        BGT     L_F9D3                          ; F7C1   020E 0210

        DECR    R2                              ; F7C3   0012
        SUB@    R4,     R6                      ; F7C4   0326
        MVO@    R2,     R5                      ; F7C5   026A
        SAR     R2,     2                       ; F7C6   006E
        BGT     L_F9D9                          ; F7C7   020E 0210

        DECR    R2                              ; F7C9   0012
        SUB@    R4,     R6                      ; F7CA   0326
        SUB     G_0300, R0                      ; F7CB   0300 0300
        DECLE   $0210                           ; F7CD   0210

        SUB@    R6,     R6                      ; F7CE   0336
L_F7CF:
        DECLE   $0210                           ; F7CF   0210

        DECR    R2                              ; F7D0   0012
        BGT     L_FAD3                          ; F7D1   020E 0300

L_F7D3:
        SUB@    R6,     R6                      ; F7D3   0336
        SUB     .BTAB.10,R0                     ; F7D4   0300 0210
        DECR    R2                              ; F7D6   0012
        BGT     L_FAD9                          ; F7D7   020E 0300

        DECLE   $0210                           ; F7D9   0210

        SUB@    R6,     R6                      ; F7DA   0336
        DECLE   $0210                           ; F7DB   0210

        DECR    R2                              ; F7DC   0012
        BGT     L_FADF                          ; F7DD   020E 0300

        SUBR    R4,     R6                      ; F7DF   0126
        SUBR    R4,     R6                      ; F7E0   0126
L_F7E1:
        SUBR    R4,     R6                      ; F7E1   0126
        MVO@    R2,     R4                      ; F7E2   0262
        SLR     R2,     2                       ; F7E3   0066
        BGT     L_F9F6                          ; F7E4   020E 0210

        DECR    R2                              ; F7E6   0012
        SUBR    R4,     R6                      ; F7E7   0126
        SUBR    R4,     R6                      ; F7E8   0126
        SUBR    R4,     R6                      ; F7E9   0126
        BGT     L_F9FC                          ; F7EA   020E 0210

        DECR    R2                              ; F7EC   0012
        SUBR    R4,     R6                      ; F7ED   0126
        MVO@    R2,     R5                      ; F7EE   026A
        SAR     R2,     2                       ; F7EF   006E
        BGT     L_FA02                          ; F7F0   020E 0210

        DECR    R2                              ; F7F2   0012
        SUB     G_0300, R0                      ; F7F3   0300 0300
        SUB     .BTAB.10,R0                     ; F7F5   0300 0210
        SUB     .BTAB.10,R0                     ; F7F7   0300 0210
        DECLE   $0000                           ; F7F9   0000

        SUB     G_0300, R0                      ; F7FA   0300 0300
L_F7FC:
        SUB     G_0300, R0                      ; F7FC   0300 0300
        DECLE   $0210,  $0000                   ; F7FE   0210 0000

        SUB     G_0300, R0                      ; F800   0300 0300
        DECLE   $0210                           ; F802   0210

        SUB     .BTAB.10,R0                     ; F803   0300 0210
        DECLE   $0000                           ; F805   0000

        SUB     .STIC.X.0,R0                    ; F806   0300 0000
L_F808:
        DECLE   $0000,  $0000,  $0000,  $0000   ; F808   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F80C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F810   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; F814   0000 0000 0000
L_F817:
        DECLE   $0000,  $0000                   ; F817   0000 0000
L_F819:
        DECLE   $0000,  $0000                   ; F819   0000 0000

        ADDR    R1,     R0                      ; F81B   00C8
        ADDR    R0,     R1                      ; F81C   00C1
L_F81D:
        MOVR    R5,     R2                      ; F81D   00AA
        INCR    R2                              ; F81E   000A
        MOVR    R0,     R1                      ; F81F   0081
        MOVR    R5,     R0                      ; F820   00A8
        ADDR    R1,     R0                      ; F821   00C8
        ADDR    R1,     R2                      ; F822   00CA
L_F823:
        MOVR    R5,     R2                      ; F823   00AA
L_F824:
        ADDR    R1,     R0                      ; F824   00C8
        SAR     R2,     2                       ; F825   006E
        MOVR    R5,     R1                      ; F826   00A9
        ADDR    R1,     R0                      ; F827   00C8
L_F828:
        TSTR    R4                              ; F828   00A4
        MOVR    R5,     R1                      ; F829   00A9
        ADDR    R2,     R2                      ; F82A   00D2
        SLR     R2,     2                       ; F82B   0066
        MOVR    R5,     R2                      ; F82C   00AA
        ADDR    R1,     R0                      ; F82D   00C8
        ADDR    R0,     R1                      ; F82E   00C1
        MOVR    R5,     R2                      ; F82F   00AA
        RLC     R0,     1                       ; F830   0050
        SWAP    R3,     1                       ; F831   0043
        MOVR    R5,     R3                      ; F832   00AB
        RLC     R0,     1                       ; F833   0050
        SLLC    R1,     1                       ; F834   0059
L_F835:
        MOVR    R5,     R3                      ; F835   00AB
        RLC     R0,     1                       ; F836   0050
        NEGR    R1                              ; F837   0021
        MOVR    R5,     R3                      ; F838   00AB
L_F839:
        SLLC    R2,     1                       ; F839   005A
        SARC    R3,     1                       ; F83A   007B
        MOVR    R5,     R3                      ; F83B   00AB
        RLC     R0,     1                       ; F83C   0050
L_F83D:
        SLLC    R2,     2                       ; F83D   005E
        MOVR    R5,     R0                      ; F83E   00A8
L_F83F:
        SARC    R0,     1                       ; F83F   0078
        MOVR    R1,     R2                      ; F840   008A
        MOVR    R5,     R3                      ; F841   00AB
        SARC    R0,     1                       ; F842   0078
        MOVR    R3,     R2                      ; F843   009A
        MOVR    R5,     R3                      ; F844   00AB
L_F845:
        SLR     R0,     2                       ; F845   0064
        MOVR    R7,     R0                      ; F846   00B8
        MOVR    R5,     R3                      ; F847   00AB
        SLR     R0,     2                       ; F848   0064
        ADDR    R4,     R6                      ; F849   00E6
        MOVR    R5,     R3                      ; F84A   00AB
        SLR     R1,     2                       ; F84B   0065
        DECLE   $0000                           ; F84C   0000

        MOVR    R5,     R4                      ; F84D   00AC
        SLR     R0,     2                       ; F84E   0064
        MOVR    R5,     R1                      ; F84F   00A9
        MOVR    R5,     R3                      ; F850   00AB
        SAR     R2,     2                       ; F851   006E
        ADDR    R2,     R1                      ; F852   00D1
        MOVR    R5,     R3                      ; F853   00AB
        MOVR    R1,     R3                      ; F854   008B
        MOVR    R5,     R0                      ; F855   00A8
        ADDR    R1,     R7                      ; F856   00CF
        MOVR    R5,     R0                      ; F857   00A8
        ADDR    R6,     R2                      ; F858   00F2
        MOVR    R5,     R0                      ; F859   00A8
        MOVR    R1,     R3                      ; F85A   008B
        MOVR    R5,     R0                      ; F85B   00A8
        DECR    R6                              ; F85C   0016
        MOVR    R5,     R1                      ; F85D   00A9
        INCR    R0                              ; F85E   0008
        SLL     R0,     1                       ; F85F   0048
        INCR    R5                              ; F860   000D
        DECLE   $0000                           ; F861   0000

        DIS                                     ; F862   0003
        DECLE   $0000,  $0000                   ; F863   0000 0000

        DECR    R0                              ; F865   0010
        RSWD    R0                              ; F866   0038
        DECR    R3                              ; F867   0013
        DECLE   $0000                           ; F868   0000

        DECR    R5                              ; F869   0015
        PSHR    R5                              ; F86A   0275
        MVII    #$000A, R0                      ; F86B   02B8 000A
        MVO     R0,     G_013A                  ; F86D   0240 013A
        MVI     G_0154, R5                      ; F86F   0285 0154
L_F871:
        INCR    R5                              ; F871   000D
        CMPI    #$0005, R5                      ; F872   037D 0005
        BLT     L_F877                          ; F874   0205 0001

L_F876:
        CLRR    R5                              ; F876   01ED
L_F877:
        MVO     R5,     G_0154                  ; F877   0245 0154
        ADDR    R5,     R5                      ; F879   00ED
        SDBD                                    ; F87A   0001
        ADDI    #$A854, R5                      ; F87B   02FD 0054 00A8
        SDBD                                    ; F87E   0001
        MVI@    R5,     R4                      ; F87F   02AC
        PULR    R7                              ; F880   02B7
        DECR    R5                              ; F881   0015
        MVII    #$0005, R0                      ; F882   02B8 0005
        MVO     R0,     G_0154                  ; F884   0240 0154
        SDBD                                    ; F886   0001
        MVII    #$A85E, R4                      ; F887   02BC 005E 00A8
        MOVR    R5,     R7                      ; F88A   00AF
        DECLE   $0228                           ; F88B   0228

        CMP@    R4,     R4                      ; F88C   0364
        DECLE   $0228                           ; F88D   0228

        CMP@    R4,     R4                      ; F88E   0364
        BNC     L_F52A                          ; F88F   0229 0366
        BNC     L_F52C                          ; F891   0229 0366
        BNOV    L_F52D                          ; F893   022A 0367
        BNOV    L_F52F                          ; F895   022A 0367
        BMI     L_F630                          ; F897   022B 0268

        AND@    R1,     R4                      ; F899   038C
        SUB     .BTAB.34,R0                     ; F89A   0300 0234
        MVO@    R3,     R5                      ; F89C   026B
        AND@    R4,     R3                      ; F89D   03A3
        AND@    R4,     R4                      ; F89E   03A4
        BMI     L_F638                          ; F89F   022B 0268

        AND@    R1,     R4                      ; F8A1   038C
        SUB     .BTAB.34,R0                     ; F8A2   0300 0234
        MVO@    R3,     R5                      ; F8A4   026B
        AND@    R4,     R3                      ; F8A5   03A3
L_F8A6:
        AND@    R4,     R4                      ; F8A6   03A4
        DECLE   $0234                           ; F8A7   0234

        MVO@    R3,     R5                      ; F8A8   026B
        AND@    R1,     R4                      ; F8A9   038C
        DECLE   $0235                           ; F8AA   0235

        CMP@    R5,     R5                      ; F8AB   036D
L_F8AC:
        DECLE   $0234                           ; F8AC   0234

        CMP@    R5,     R3                      ; F8AD   036B
        DECLE   $0232                           ; F8AE   0232

        CMP@    R5,     R1                      ; F8AF   0369
        DECLE   $0230                           ; F8B0   0230

        CMP@    R5,     R0                      ; F8B1   0368
        DECLE   $0232                           ; F8B2   0232

        CMP@    R5,     R1                      ; F8B3   0369
        DECLE   $0233                           ; F8B4   0233

        CMP@    R5,     R3                      ; F8B5   036B
        DECLE   $0234                           ; F8B6   0234

        CMP@    R5,     R4                      ; F8B7   036C
        DECLE   $0235                           ; F8B8   0235

        MVO@    R5,     R5                      ; F8B9   026D
        AND@    R1,     R6                      ; F8BA   038E
        SUB     .BTAB.39,R0                     ; F8BB   0300 0239
        PSHR    R2                              ; F8BD   0272
        AND@    R4,     R5                      ; F8BE   03A5
        AND@    R4,     R6                      ; F8BF   03A6
        DECLE   $0235                           ; F8C0   0235

        MVO@    R5,     R5                      ; F8C1   026D
L_F8C2:
        AND@    R1,     R6                      ; F8C2   038E
        SUB     .BTAB.38,R0                     ; F8C3   0300 0238
        PSHR    R2                              ; F8C5   0272
        AND@    R4,     R5                      ; F8C6   03A5
        AND@    R4,     R6                      ; F8C7   03A6
        DECLE   $0237                           ; F8C8   0237

        MVO@    R7,     R5                      ; F8C9   026F
        AND@    R2,     R3                      ; F8CA   0393
        SUB     G_0071, R0                      ; F8CB   0300 0071
        SLLC    R2,     2                       ; F8CD   005E
        MOVR    R5,     R0                      ; F8CE   00A8
        BESC    L_F565                          ; F8CF   022F 036B
        BESC    L_F567                          ; F8D1   022F 036B

        DECLE   $0230                           ; F8D3   0230

        CMP@    R5,     R5                      ; F8D4   036D
        DECLE   $0230                           ; F8D5   0230

        CMP@    R5,     R5                      ; F8D6   036D
        DECLE   $0231                           ; F8D7   0231

        CMP@    R5,     R6                      ; F8D8   036E
        DECLE   $0231                           ; F8D9   0231

        CMP@    R5,     R6                      ; F8DA   036E
        DECLE   $0232                           ; F8DB   0232

        MVO@    R7,     R5                      ; F8DC   026F
        AND@    R1,     R6                      ; F8DD   038E
        SUB     .BTAB.39,R0                     ; F8DE   0300 0239
        PSHR    R2                              ; F8E0   0272
        AND@    R4,     R5                      ; F8E1   03A5
        AND@    R4,     R6                      ; F8E2   03A6
        DECLE   $0232                           ; F8E3   0232

        MVO@    R7,     R5                      ; F8E4   026F
        AND@    R1,     R6                      ; F8E5   038E
        SUB     .BTAB.38,R0                     ; F8E6   0300 0238
        PSHR    R2                              ; F8E8   0272
        AND@    R4,     R5                      ; F8E9   03A5
        AND@    R4,     R6                      ; F8EA   03A6
        DECLE   $0237                           ; F8EB   0237

        MVO@    R7,     R5                      ; F8EC   026F
        AND@    R2,     R3                      ; F8ED   0393
        SUB     G_0071, R0                      ; F8EE   0300 0071
        SLLC    R2,     2                       ; F8F0   005E
L_F8F1:
        MOVR    R5,     R0                      ; F8F1   00A8
        BMI     L_F590                          ; F8F2   022B 0363
        BMI     L_F592                          ; F8F4   022B 0363
        BGE     L_F593                          ; F8F6   022D 0364
        BGE     L_F595                          ; F8F8   022D 0364
        BESC    L_F595                          ; F8FA   022F 0366
        BESC    L_F597                          ; F8FC   022F 0366

        DECLE   $0230                           ; F8FE   0230

        MVO@    R0,     R5                      ; F8FF   0268
        AND@    R1,     R4                      ; F900   038C
        DECLE   $0230                           ; F901   0230

        CMP@    R5,     R0                      ; F902   0368
        SUB     .BTAB.33,R0                     ; F903   0300 0233
        CMP@    R6,     R0                      ; F905   0370
        DECLE   $0232                           ; F906   0232

        MVO@    R7,     R5                      ; F907   026F
        AND@    R1,     R5                      ; F908   038D
        BMI     L_F5A2                          ; F909   022B 0368
        BGE     L_F5A3                          ; F90B   022D 0369
        BGT     L_F5A4                          ; F90D   022E 036A
        BESC    L_F6A5                          ; F90F   022F 026B

        AND@    R1,     R6                      ; F911   038E
        SUB     G_0071, R0                      ; F912   0300 0071
        SLLC    R2,     2                       ; F914   005E
        MOVR    R5,     R0                      ; F915   00A8
        DECLE   $0234                           ; F916   0234

        CMP@    R6,     R0                      ; F917   0370
        DECLE   $0234                           ; F918   0234

        CMP@    R6,     R0                      ; F919   0370
        DECLE   $0235                           ; F91A   0235

        CMP@    R6,     R2                      ; F91B   0372
        DECLE   $0235                           ; F91C   0235

        CMP@    R6,     R2                      ; F91D   0372
        DECLE   $0237                           ; F91E   0237

        CMP@    R6,     R4                      ; F91F   0374
L_F920:
        DECLE   $0237                           ; F920   0237

        CMP@    R6,     R4                      ; F921   0374
        DECLE   $0239                           ; F922   0239

        PSHR    R5                              ; F923   0275
        AND@    R2,     R1                      ; F924   0391
        DECLE   $0239                           ; F925   0239

        CMP@    R6,     R5                      ; F926   0375
        DECLE   $023C,  $0279                   ; F927   023C 0279

        AND@    R3,     R4                      ; F929   039C
        DECLE   $023C,  $0279                   ; F92A   023C 0279

        AND@    R3,     R5                      ; F92C   039D
        DECLE   $0238                           ; F92D   0238

        PSHR    R5                              ; F92E   0275
        AND@    R2,     R1                      ; F92F   0391
        DECLE   $0238                           ; F930   0238

        CMP@    R6,     R5                      ; F931   0375
        DECLE   $023C,  $0278                   ; F932   023C 0278
L_F934:
        AND@    R3,     R4                      ; F934   039C
        DECLE   $023C,  $0278                   ; F935   023C 0278

        AND@    R3,     R5                      ; F937   039D
        DECLE   $0237                           ; F938   0237

        PSHR    R4                              ; F939   0274
        AND@    R1,     R4                      ; F93A   038C
        DECLE   $0237                           ; F93B   0237

        CMP@    R6,     R4                      ; F93C   0374
        DECLE   $0235                           ; F93D   0235

        PSHR    R2                              ; F93E   0272
        AND@    R4,     R3                      ; F93F   03A3
        DECLE   $0235                           ; F940   0235

        PSHR    R2                              ; F941   0272
        AND@    R4,     R4                      ; F942   03A4
        DECLE   $0234                           ; F943   0234

        PSHR    R0                              ; F944   0270
        AND@    R1,     R4                      ; F945   038C
        DECLE   $0234                           ; F946   0234

        CMP@    R6,     R0                      ; F947   0370
        DECLE   $0230                           ; F948   0230

        MVO@    R0,     R5                      ; F949   0268
        AND@    R4,     R3                      ; F94A   03A3
        DECLE   $0230                           ; F94B   0230

        MVO@    R0,     R5                      ; F94C   0268
        AND@    R4,     R4                      ; F94D   03A4
        BMI     L_F6E6                          ; F94E   022B 0269

        AND@    R2,     R3                      ; F950   0393
        BMI     L_F6E9                          ; F951   022B 0269

        AND@    R2,     R3                      ; F953   0393
        BNEQ    L_F6EC                          ; F954   022C 0269

        AND@    R2,     R3                      ; F956   0393
        BNEQ    L_F6EF                          ; F957   022C 0269

        AND@    R2,     R3                      ; F959   0393
        BGE     L_F6F2                          ; F95A   022D 0269

        AND@    R2,     R3                      ; F95C   0393
        BGE     L_F6F5                          ; F95D   022D 0269

        AND@    R2,     R3                      ; F95F   0393
        BESC    L_F6F8                          ; F960   022F 0269

        AND@    R2,     R3                      ; F962   0393
        BESC    L_F6FB                          ; F963   022F 0269

        AND@    R2,     R3                      ; F965   0393
        DECLE   $0230                           ; F966   0230

        MVO@    R0,     R5                      ; F967   0268
        AND@    R3,     R0                      ; F968   0398
        DECLE   $0230                           ; F969   0230

        CMP@    R5,     R0                      ; F96A   0368
        RRC     R1,     1                       ; F96B   0071
        SLLC    R2,     2                       ; F96C   005E
        MOVR    R5,     R0                      ; F96D   00A8
        INCR    R0                              ; F96E   0008
        SAR     R0,     1                       ; F96F   0068
        DECR    R0                              ; F970   0010
        RSWD    R0                              ; F971   0038
        BESC    L_F608                          ; F972   022F 036B
        BESC    L_F60A                          ; F974   022F 036B

        DECLE   $0230                           ; F976   0230

        CMP@    R5,     R5                      ; F977   036D
        DECLE   $0230                           ; F978   0230

        CMP@    R5,     R5                      ; F979   036D
        DECLE   $0231                           ; F97A   0231
L_F97B:
        CMP@    R5,     R6                      ; F97B   036E
        DECLE   $0231                           ; F97C   0231

        CMP@    R5,     R6                      ; F97D   036E
        DECLE   $0232                           ; F97E   0232

        CMP@    R5,     R7                      ; F97F   036F
        SUB     .BTAB.9A,R0                     ; F980   0300 029A
        DECLE   $023B                           ; F982   023B

        CMP@    R6,     R2                      ; F983   0372
        DECLE   $023A                           ; F984   023A

        CMP@    R6,     R1                      ; F985   0371
        DECLE   $023B                           ; F986   023B
L_F987:
        CMP@    R6,     R2                      ; F987   0372
        SUB     .BTAB.32,R0                     ; F988   0300 0232
        MVO@    R7,     R5                      ; F98A   026F
        AND@    R3,     R2                      ; F98B   039A
        SUB     .BTAB.31,R0                     ; F98C   0300 0231
        CMP@    R5,     R6                      ; F98E   036E
        SUB     .BTAB.3A,R0                     ; F98F   0300 023A
        PSHR    R1                              ; F991   0271
        AND@    R3,     R2                      ; F992   039A
        SUB     .BTAB.30,R0                     ; F993   0300 0230
        CMP@    R5,     R5                      ; F995   036D
        SUB     .BTAB.39,R0                     ; F996   0300 0239
        PSHR    R0                              ; F998   0270
        AND@    R3,     R2                      ; F999   039A
        SUB     .BTAB.37,R0                     ; F99A   0300 0237
        MVO@    R7,     R5                      ; F99C   026F
        AND@    R3,     R7                      ; F99D   039F
        SUB     G_0300, R0                      ; F99E   0300 0300
        DECR    R0                              ; F9A0   0010
        RSWD    R7                              ; F9A1   003F
        INCR    R1                              ; F9A2   0009
        DECLE   $0000                           ; F9A3   0000
L_F9A4:
        INCR    R0                              ; F9A4   0008
        SAR     R0,     1                       ; F9A5   0068
        DECR    R0                              ; F9A6   0010
        RSWD    R0                              ; F9A7   0038
        DECR    R2                              ; F9A8   0012
        DIS                                     ; F9A9   0003
L_F9AA:
        BGE     L_F61A                          ; F9AA   022D 0391

        SUB@    R5,     R5                      ; F9AC   032D
        MVO@    R4,     R4                      ; F9AD   0264
        AND@    R4,     R1                      ; F9AE   03A1
        DECLE   $0230                           ; F9AF   0230
L_F9B0:
        AND@    R3,     R0                      ; F9B0   0398
        AND@    R1,     R4                      ; F9B1   038C
        SUB     .BTAB.64,R0                     ; F9B2   0300 0264
        AND@    R4,     R1                      ; F9B4   03A1
        SUB     G_0391, R0                      ; F9B5   0300 0391
        SUB     .BTAB.32,R0                     ; F9B7   0300 0232
        CMP@    R5,     R4                      ; F9B9   036C
        AND@    R3,     R0                      ; F9BA   0398
        DECLE   $0232                           ; F9BB   0232

        MVO@    R4,     R5                      ; F9BC   026C
        AND@    R1,     R4                      ; F9BD   038C
        DECLE   $0230                           ; F9BE   0230

        CMP@    R5,     R5                      ; F9BF   036D
        MVO@    R4,     R4                      ; F9C0   0264
        AND@    R4,     R1                      ; F9C1   03A1
        SUB     .BTAB.32,R0                     ; F9C2   0300 0232
        AND@    R2,     R6                      ; F9C4   0396
        SUB@    R6,     R2                      ; F9C5   0332
        MVO@    R1,     R5                      ; F9C6   0269
        AND@    R4,     R6                      ; F9C7   03A6
        DECLE   $0235                           ; F9C8   0235

        AND@    R3,     R5                      ; F9C9   039D
        AND@    R2,     R1                      ; F9CA   0391
L_F9CB:
        SUB     .BTAB.69,R0                     ; F9CB   0300 0269
L_F9CD:
        AND@    R4,     R6                      ; F9CD   03A6
        SUB     G_0396, R0                      ; F9CE   0300 0396
        SUB     .BTAB.38,R0                     ; F9D0   0300 0238
        CMP@    R6,     R1                      ; F9D2   0371
L_F9D3:
        AND@    R3,     R5                      ; F9D3   039D
        DECLE   $0237                           ; F9D4   0237

        PSHR    R2                              ; F9D5   0272
        AND@    R2,     R1                      ; F9D6   0391
        DECLE   $0235                           ; F9D7   0235

        CMP@    R6,     R0                      ; F9D8   0370
L_F9D9:
        AND@    R3,     R5                      ; F9D9   039D
        SUB     .STIC.EDGE,R0                   ; F9DA   0300 0032
        ADDR    R4,     R1                      ; F9DC   00E1
        MOVR    R5,     R1                      ; F9DD   00A9
        GSWD    R2                              ; F9DE   0032
        COMR    R3                              ; F9DF   001B
        MOVR    R5,     R2                      ; F9E0   00AA
        BGE     L_F651                          ; F9E1   022D 0391

        SUB@    R5,     R5                      ; F9E3   032D
        MVO@    R4,     R4                      ; F9E4   0264
        AND@    R4,     R1                      ; F9E5   03A1
        DECLE   $0230                           ; F9E6   0230

        AND@    R3,     R0                      ; F9E7   0398
        AND@    R1,     R4                      ; F9E8   038C
        SUB     .BTAB.64,R0                     ; F9E9   0300 0264
        AND@    R4,     R1                      ; F9EB   03A1
        SUB     G_0391, R0                      ; F9EC   0300 0391
L_F9EE:
        SUB     .BTAB.32,R0                     ; F9EE   0300 0232
        CMP@    R5,     R4                      ; F9F0   036C
        AND@    R3,     R0                      ; F9F1   0398
        DECLE   $0230                           ; F9F2   0230

        MVO@    R3,     R5                      ; F9F3   026B
        AND@    R1,     R4                      ; F9F4   038C
        BGE     L_F68D                          ; F9F5   022D 0369

        MVO@    R4,     R4                      ; F9F7   0264
        AND@    R4,     R1                      ; F9F8   03A1
        BMI     L_F692                          ; F9F9   022B 0368

        AND@    R1,     R4                      ; F9FB   038C
L_F9FC:
        SUB     G_038C, R0                      ; F9FC   0300 038C
        BGT     L_F794                          ; F9FE   022E 026B

        AND@    R1,     R6                      ; FA00   038E
        AND@    R2,     R0                      ; FA01   0390
L_FA02:
        BMI     L_F69B                          ; FA02   022B 0368
        BGT     L_F79A                          ; FA04   022E 026B

        AND@    R2,     R0                      ; FA06   0390
        AND@    R2,     R1                      ; FA07   0391
        DECLE   $0232                           ; FA08   0232

        MVO@    R6,     R5                      ; FA09   026E
        AND@    R2,     R3                      ; FA0A   0393
        SUB     G_0393, R0                      ; FA0B   0300 0393
        DECLE   $0235                           ; FA0D   0235

        PSHR    R2                              ; FA0E   0272
        AND@    R2,     R5                      ; FA0F   0395
        AND@    R2,     R6                      ; FA10   0396
        DECLE   $0232                           ; FA11   0232

        MVO@    R6,     R5                      ; FA12   026E
        AND@    R3,     R0                      ; FA13   0398
        DECLE   $0235                           ; FA14   0235

        PSHR    R2                              ; FA15   0272
        AND@    R3,     R2                      ; FA16   039A
        AND@    R3,     R4                      ; FA17   039C
        GSWD    R2                              ; FA18   0032
        MOVR    R5,     R2                      ; FA19   00AA
L_FA1A:
        MOVR    R5,     R1                      ; FA1A   00A9
        DECLE   $0239                           ; FA1B   0239

        PSHR    R0                              ; FA1C   0270
        AND@    R1,     R4                      ; FA1D   038C
        DECLE   $0239                           ; FA1E   0239

        CMP@    R6,     R0                      ; FA1F   0370
        BNC     L_F7C0                          ; FA20   0229 0261

L_FA22:
        AND@    R3,     R0                      ; FA22   0398
        DECLE   $0239                           ; FA23   0239

        CMP@    R6,     R0                      ; FA24   0370
        AND@    R1,     R4                      ; FA25   038C
        DECLE   $0237                           ; FA26   0237

        CMP@    R5,     R7                      ; FA27   036F
        DECLE   $0235                           ; FA28   0235

        MVO@    R5,     R5                      ; FA29   026D
        AND@    R3,     R0                      ; FA2A   0398
        DECLE   $0232                           ; FA2B   0232

        CMP@    R5,     R1                      ; FA2C   0369
        DECLE   $0238                           ; FA2D   0238

        PSHR    R5                              ; FA2E   0275
        AND@    R1,     R5                      ; FA2F   038D
        DECLE   $0238                           ; FA30   0238

        CMP@    R6,     R5                      ; FA31   0375
        BNC     L_F7D3                          ; FA32   0229 0260

        AND@    R3,     R1                      ; FA34   0399
        DECLE   $0238                           ; FA35   0238

        CMP@    R6,     R5                      ; FA36   0375
        AND@    R1,     R5                      ; FA37   038D
        DECLE   $0237                           ; FA38   0237

        CMP@    R6,     R4                      ; FA39   0374
        DECLE   $0235                           ; FA3A   0235

        PSHR    R2                              ; FA3B   0272
        AND@    R3,     R1                      ; FA3C   0399
        DECLE   $0232                           ; FA3D   0232

        CMP@    R5,     R7                      ; FA3E   036F
        DECLE   $0239                           ; FA3F   0239

        PSHR    R0                              ; FA40   0270
        AND@    R1,     R4                      ; FA41   038C
        DECLE   $0239                           ; FA42   0239

        CMP@    R6,     R0                      ; FA43   0370
        BNC     L_F7E1                          ; FA44   0229 0264

        AND@    R3,     R0                      ; FA46   0398
        DECLE   $0239                           ; FA47   0239

        CMP@    R6,     R0                      ; FA48   0370
        AND@    R1,     R4                      ; FA49   038C
        DECLE   $0237                           ; FA4A   0237

        CMP@    R5,     R7                      ; FA4B   036F
        DECLE   $0235                           ; FA4C   0235

        MVO@    R5,     R5                      ; FA4D   026D
        AND@    R3,     R0                      ; FA4E   0398
        DECLE   $0232                           ; FA4F   0232

        CMP@    R5,     R1                      ; FA50   0369
        DECLE   $0238                           ; FA51   0238

        MVO@    R7,     R5                      ; FA52   026F
        AND@    R2,     R3                      ; FA53   0393
        DECLE   $0237                           ; FA54   0237

        CMP@    R5,     R7                      ; FA55   036F
        AND@    R3,     R0                      ; FA56   0398
        DECLE   $0235                           ; FA57   0235
L_FA58:
        MVO@    R5,     R5                      ; FA58   026D
        AND@    R2,     R1                      ; FA59   0391
        SUB     G_0300, R0                      ; FA5A   0300 0300
        DECLE   $023C                           ; FA5C   023C

        AND@    R1,     R4                      ; FA5D   038C
L_FA5E:
        SUB     G_0033, R0                      ; FA5E   0300 0033
        MOVR    R5,     R0                      ; FA60   00A8
        MOVR    R5,     R1                      ; FA61   00A9
        DECR    R0                              ; FA62   0010
        RSWD    R7                              ; FA63   003F
L_FA64:
        INCR    R1                              ; FA64   0009
        DECLE   $0000                           ; FA65   0000

        INCR    R0                              ; FA66   0008
        SAR     R0,     1                       ; FA67   0068
        DECR    R0                              ; FA68   0010
        RSWD    R0                              ; FA69   0038
        DECLE   $0230                           ; FA6A   0230

        MVO@    R0,     R5                      ; FA6B   0268
        AND@    R1,     R4                      ; FA6C   038C
        SUB     .BTAB.34,R0                     ; FA6D   0300 0234
        CMP@    R5,     R0                      ; FA6F   0368
        SUB     .BTAB.2D,R0                     ; FA70   0300 022D
        CMP@    R4,     R1                      ; FA72   0361
        SUB     .BTAB.32,R0                     ; FA73   0300 0232
        CMP@    R4,     R6                      ; FA75   0366
        SUB     .BTAB.2B,R0                     ; FA76   0300 022B
        CMP@    R3,     R7                      ; FA78   035F
        SUB     .BTAB.30,R0                     ; FA79   0300 0230
        MVO@    R0,     R5                      ; FA7B   0268
        AND@    R1,     R4                      ; FA7C   038C
        BESC    L_F817                          ; FA7D   022F 0267

        AND@    R3,     R0                      ; FA7F   0398
        DECLE   $0230                           ; FA80   0230
L_FA81:
        MVO@    R0,     R5                      ; FA81   0268
        AND@    R1,     R4                      ; FA82   038C
        BESC    L_F81D                          ; FA83   022F 0267

        AND@    R3,     R0                      ; FA85   0398
        DECLE   $0230                           ; FA86   0230
L_FA87:
        MVO@    R0,     R5                      ; FA87   0268
        AND@    R1,     R4                      ; FA88   038C
        BESC    L_F823                          ; FA89   022F 0267

        AND@    R3,     R0                      ; FA8B   0398
        DECLE   $0230                           ; FA8C   0230
L_FA8D:
        MVO@    R0,     R5                      ; FA8D   0268
        AND@    R1,     R4                      ; FA8E   038C
        SUB     .BTAB.34,R0                     ; FA8F   0300 0234
        AND@    R3,     R4                      ; FA91   039C
        SUB     .BTAB.2D,R0                     ; FA92   0300 022D
        AND@    R2,     R5                      ; FA94   0395
        SUB     .BTAB.32,R0                     ; FA95   0300 0232
        AND@    R3,     R2                      ; FA97   039A
        SUB     .BTAB.2B,R0                     ; FA98   0300 022B
        AND@    R2,     R3                      ; FA9A   0393
        SUB     .BTAB.30,R0                     ; FA9B   0300 0230
        MVO@    R0,     R5                      ; FA9D   0268
        AND@    R1,     R4                      ; FA9E   038C
        BESC    L_F839                          ; FA9F   022F 0267

        AND@    R3,     R0                      ; FAA1   0398
        DECLE   $0230                           ; FAA2   0230

        MVO@    R0,     R5                      ; FAA3   0268
        AND@    R1,     R4                      ; FAA4   038C
        BESC    L_F83F                          ; FAA5   022F 0267

        AND@    R3,     R0                      ; FAA7   0398
        DECLE   $0230                           ; FAA8   0230

        MVO@    R0,     R5                      ; FAA9   0268
L_FAAA:
        AND@    R1,     R4                      ; FAAA   038C
        BESC    L_F845                          ; FAAB   022F 0267

        AND@    R3,     R0                      ; FAAD   0398
        DECLE   $0230                           ; FAAE   0230

        MVO@    R0,     R5                      ; FAAF   0268
L_FAB0:
        AND@    R1,     R4                      ; FAB0   038C
        SUB     G_0300, R0                      ; FAB1   0300 0300
        SUB     .BTAB.34,R0                     ; FAB3   0300 0234
        PSHR    R0                              ; FAB5   0270
L_FAB6:
        AND@    R3,     R0                      ; FAB6   0398
        SUB     G_0300, R0                      ; FAB7   0300 0300
        SUB     .BTAB.30,R0                     ; FAB9   0300 0230
        MVO@    R0,     R5                      ; FABB   0268
        AND@    R1,     R4                      ; FABC   038C
        DECR    R0                              ; FABD   0010
        RSWD    R7                              ; FABE   003F
        INCR    R1                              ; FABF   0009
        DECLE   $0000                           ; FAC0   0000

        INCR    R0                              ; FAC1   0008
        SAR     R0,     1                       ; FAC2   0068
        DECR    R0                              ; FAC3   0010
        RSWD    R0                              ; FAC4   0038
        DECR    R3                              ; FAC5   0013
        DECLE   $0001                           ; FAC6   0001

        RRC     R1,     1                       ; FAC7   0071
        COMR    R3                              ; FAC8   001B
        MOVR    R5,     R2                      ; FAC9   00AA
        INCR    R0                              ; FACA   0008
        SAR     R0,     1                       ; FACB   0068
        DECR    R0                              ; FACC   0010
        RSWD    R0                              ; FACD   0038
        DECLE   $0234                           ; FACE   0234

        CMP@    R6,     R0                      ; FACF   0370
        DECLE   $0234                           ; FAD0   0234

        CMP@    R6,     R0                      ; FAD1   0370
        DECLE   $0235                           ; FAD2   0235
L_FAD3:
        CMP@    R6,     R2                      ; FAD3   0372
        DECLE   $0235                           ; FAD4   0235

        CMP@    R6,     R2                      ; FAD5   0372
        DECLE   $0237                           ; FAD6   0237

        CMP@    R6,     R4                      ; FAD7   0374
        DECLE   $0237                           ; FAD8   0237
L_FAD9:
        CMP@    R6,     R4                      ; FAD9   0374
        DECLE   $0238                           ; FADA   0238

        PSHR    R5                              ; FADB   0275
        AND@    R2,     R4                      ; FADC   0394
        DECLE   $0238                           ; FADD   0238

        PSHR    R5                              ; FADE   0275
L_FADF:
        AND@    R2,     R7                      ; FADF   0397
        DECLE   $0237                           ; FAE0   0237

        CMP@    R6,     R4                      ; FAE1   0374
        DECLE   $0237                           ; FAE2   0237

        PSHR    R4                              ; FAE3   0274
        AND@    R3,     R2                      ; FAE4   039A
        DECLE   $0235                           ; FAE5   0235

        PSHR    R2                              ; FAE6   0272
        AND@    R3,     R5                      ; FAE7   039D
        DECLE   $0235                           ; FAE8   0235

        CMP@    R6,     R2                      ; FAE9   0372
        DECLE   $0237                           ; FAEA   0237

        PSHR    R4                              ; FAEB   0274
        AND@    R4,     R0                      ; FAEC   03A0
        DECLE   $0237                           ; FAED   0237

        PSHR    R4                              ; FAEE   0274
        AND@    R4,     R3                      ; FAEF   03A3
        DECLE   $0238                           ; FAF0   0238

        CMP@    R6,     R5                      ; FAF1   0375
        DECLE   $0238                           ; FAF2   0238

        PSHR    R5                              ; FAF3   0275
        AND@    R4,     R6                      ; FAF4   03A6
        DECLE   $0237                           ; FAF5   0237

        PSHR    R4                              ; FAF6   0274
        AND@    R5,     R1                      ; FAF7   03A9
        DECLE   $0237                           ; FAF8   0237

        CMP@    R6,     R4                      ; FAF9   0374
        DECLE   $0235                           ; FAFA   0235

        PSHR    R2                              ; FAFB   0272
        AND@    R5,     R1                      ; FAFC   03A9
        DECLE   $0235                           ; FAFD   0235

        PSHR    R2                              ; FAFE   0272
        AND@    R5,     R4                      ; FAFF   03AC
        DECLE   $0237                           ; FB00   0237

        CMP@    R6,     R4                      ; FB01   0374
        DECLE   $0237                           ; FB02   0237

        PSHR    R4                              ; FB03   0274
        AND@    R6,     R0                      ; FB04   03B0
        DECLE   $023E                           ; FB05   023E

        PSHR    R5                              ; FB06   0275
        AND@    R2,     R3                      ; FB07   0393
        DECLE   $023E                           ; FB08   023E

        PSHR    R5                              ; FB09   0275
        AND@    R2,     R7                      ; FB0A   0397
        DECLE   $023C                           ; FB0B   023C

        CMP@    R6,     R4                      ; FB0C   0374
        DECLE   $023C                           ; FB0D   023C

        PSHR    R4                              ; FB0E   0274
        AND@    R3,     R2                      ; FB0F   039A
        DECLE   $023B                           ; FB10   023B

        PSHR    R2                              ; FB11   0272
        AND@    R3,     R5                      ; FB12   039D
        DECLE   $023B                           ; FB13   023B

        PSHR    R2                              ; FB14   0272
        AND@    R3,     R7                      ; FB15   039F
        SUB     .BTAB.37,R0                     ; FB16   0300 0237
        PSHR    R5                              ; FB18   0275
        AND@    R4,     R3                      ; FB19   03A3
        DECLE   $023C                           ; FB1A   023C

        PSHR    R4                              ; FB1B   0274
        AND@    R4,     R4                      ; FB1C   03A4
        DECR    R0                              ; FB1D   0010
        RSWD    R7                              ; FB1E   003F
        INCR    R1                              ; FB1F   0009
        DECLE   $0000                           ; FB20   0000

        DECR    R0                              ; FB21   0010
        RSWD    R6                              ; FB22   003E
        INCR    R5                              ; FB23   000D
        XORI    #$0000, R2                      ; FB24   03FA 0000
        RLC     R2,     1                       ; FB26   0052
        DIS                                     ; FB27   0003
        DIS                                     ; FB28   0003
        DECLE   $0000,  $0000                   ; FB29   0000 0000

        INCR    R2                              ; FB2B   000A
        SARC    R0,     1                       ; FB2C   0078
        INCR    R1                              ; FB2D   0009
        DIS                                     ; FB2E   0003
        DIS                                     ; FB2F   0003
        MOVR    R3,     R4                      ; FB30   009C
        ADDR    R7,     R7                      ; FB31   00FF
        INCR    R1                              ; FB32   0009
        DECLE   $0001                           ; FB33   0001

        DIS                                     ; FB34   0003
        DECLE   $0000,  $0000                   ; FB35   0000 0000

        INCR    R2                              ; FB37   000A
        SAR     R2,     2                       ; FB38   006E
        INCR    R1                              ; FB39   0009
        DIS                                     ; FB3A   0003
        DIS                                     ; FB3B   0003
        RLC     R0,     1                       ; FB3C   0050
        DECLE   $0000                           ; FB3D   0000

        INCR    R1                              ; FB3E   0009
        DECLE   $0001                           ; FB3F   0001

        GSWD    R2                              ; FB40   0032
        ADCR    R0                              ; FB41   0028
        MOVR    R5,     R3                      ; FB42   00AB
        DECR    R0                              ; FB43   0010
        RSWD    R6                              ; FB44   003E
        DECLE   $0000                           ; FB45   0000

        SAR     R3,     1                       ; FB46   006B
        DECLE   $0000                           ; FB47   0000

        INCR    R2                              ; FB48   000A
        SAR     R0,     1                       ; FB49   0068
        DIS                                     ; FB4A   0003
        DECLE   $0000,  $0000                   ; FB4B   0000 0000

        INCR    R1                              ; FB4D   0009
        EIS                                     ; FB4E   0002
        INCR    R2                              ; FB4F   000A
        DECLE   $0000                           ; FB50   0000

        DIS                                     ; FB51   0003
        INCR    R0                              ; FB52   0008
        DECLE   $0000                           ; FB53   0000

        INCR    R1                              ; FB54   0009
        DECLE   $0001                           ; FB55   0001

        GSWD    R2                              ; FB56   0032
        SLL     R0,     1                       ; FB57   0048
        MOVR    R5,     R3                      ; FB58   00AB
        DECR    R0                              ; FB59   0010
        RSWD    R6                              ; FB5A   003E
        INCR    R5                              ; FB5B   000D
        XORI    #$0000, R2                      ; FB5C   03FA 0000
        MOVR    R6,     R0                      ; FB5E   00B0
        DECLE   $0004                           ; FB5F   0004

        DIS                                     ; FB60   0003
        DECLE   $0000,  $0000                   ; FB61   0000 0000

        INCR    R2                              ; FB63   000A
        SARC    R0,     1                       ; FB64   0078
        INCR    R1                              ; FB65   0009
        DIS                                     ; FB66   0003
        DIS                                     ; FB67   0003
        SARC    R0,     1                       ; FB68   0078
        DECLE   $0000                           ; FB69   0000

        INCR    R1                              ; FB6A   0009
        DECLE   $0001                           ; FB6B   0001

        DIS                                     ; FB6C   0003
        DECLE   $0000,  $0000                   ; FB6D   0000 0000

        INCR    R2                              ; FB6F   000A
        SAR     R2,     2                       ; FB70   006E
        INCR    R1                              ; FB71   0009
        DIS                                     ; FB72   0003
        DIS                                     ; FB73   0003
        MOVR    R4,     R6                      ; FB74   00A6
        ADDR    R7,     R7                      ; FB75   00FF
        INCR    R1                              ; FB76   0009
        DECLE   $0001                           ; FB77   0001

        GSWD    R2                              ; FB78   0032
        SLR     R0,     1                       ; FB79   0060
        MOVR    R5,     R3                      ; FB7A   00AB
        DECR    R0                              ; FB7B   0010
        RSWD    R6                              ; FB7C   003E
        DECLE   $0000                           ; FB7D   0000

        TSTR    R6                              ; FB7E   00B6
        DIS                                     ; FB7F   0003
        DIS                                     ; FB80   0003
        ADDR    R0,     R4                      ; FB81   00C4
        ADDR    R7,     R7                      ; FB82   00FF
        INCR    R2                              ; FB83   000A
        SAR     R0,     1                       ; FB84   0068
        INCR    R1                              ; FB85   0009
        INCR    R7                              ; FB86   000F
        RRC     R1,     1                       ; FB87   0071
        SLLC    R2,     2                       ; FB88   005E
        MOVR    R5,     R0                      ; FB89   00A8
        DECR    R0                              ; FB8A   0010
        RSWD    R6                              ; FB8B   003E
        INCR    R0                              ; FB8C   0008
        SAR     R0,     1                       ; FB8D   0068
        SUB@    R6,     R0                      ; FB8E   0330
        SUB@    R6,     R3                      ; FB8F   0333
        SUB     G_0335, R0                      ; FB90   0300 0335
        SUB@    R6,     R5                      ; FB92   0335
        SUB@    R6,     R5                      ; FB93   0335
        SUB@    R6,     R3                      ; FB94   0333
        SUB     G_0335, R0                      ; FB95   0300 0335
        RRC     R1,     1                       ; FB97   0071
        SLLC    R2,     2                       ; FB98   005E
        MOVR    R5,     R0                      ; FB99   00A8
        DECR    R0                              ; FB9A   0010
        RSWD    R6                              ; FB9B   003E
        INCR    R0                              ; FB9C   0008
        SAR     R0,     1                       ; FB9D   0068
        SUB@    R6,     R0                      ; FB9E   0330
        SUB@    R6,     R2                      ; FB9F   0332
        SUB@    R6,     R5                      ; FBA0   0335
        SUB@    R6,     R2                      ; FBA1   0332
        SUBI    #$0300, R1                      ; FBA2   0339 0300
        SUB@    R6,     R7                      ; FBA4   0337
        SUB@    R6,     R5                      ; FBA5   0335
        RRC     R1,     1                       ; FBA6   0071
        SLLC    R2,     2                       ; FBA7   005E
        MOVR    R5,     R0                      ; FBA8   00A8
        DECR    R0                              ; FBA9   0010
        RSWD    R6                              ; FBAA   003E
        INCR    R2                              ; FBAB   000A
        SAR     R0,     1                       ; FBAC   0068
        DECLE   $0000                           ; FBAD   0000

        RRC     R0,     2                       ; FBAE   0074
        DECLE   $0000                           ; FBAF   0000

        DIS                                     ; FBB0   0003
        ADDR    R7,     R1                      ; FBB1   00F9
        ADDR    R7,     R7                      ; FBB2   00FF
        INCR    R1                              ; FBB3   0009
        INCR    R0                              ; FBB4   0008
        RRC     R1,     1                       ; FBB5   0071
        SLLC    R2,     2                       ; FBB6   005E
        MOVR    R5,     R0                      ; FBB7   00A8
        DECR    R0                              ; FBB8   0010
        RSWD    R6                              ; FBB9   003E
        DECLE   $0000                           ; FBBA   0000

        DECR    R3                              ; FBBB   0013
        DECLE   $0000                           ; FBBC   0000

        INCR    R2                              ; FBBD   000A
        SAR     R0,     1                       ; FBBE   0068
        DECR    R2                              ; FBBF   0012
        INCR    R0                              ; FBC0   0008
        DIS                                     ; FBC1   0003
        DIS                                     ; FBC2   0003
        DECLE   $0000                           ; FBC3   0000

        INCR    R1                              ; FBC4   0009
        EIS                                     ; FBC5   0002
        DIS                                     ; FBC6   0003
        ADDR    R7,     R7                      ; FBC7   00FF
        ADDR    R7,     R7                      ; FBC8   00FF
        INCR    R1                              ; FBC9   0009
        EIS                                     ; FBCA   0002
        GSWD    R2                              ; FBCB   0032
        ADDR    R0,     R1                      ; FBCC   00C1
        MOVR    R5,     R3                      ; FBCD   00AB
        RRC     R1,     1                       ; FBCE   0071
        SLLC    R2,     2                       ; FBCF   005E
        MOVR    R5,     R0                      ; FBD0   00A8
        DECR    R0                              ; FBD1   0010
        RSWD    R6                              ; FBD2   003E
        DECLE   $0000                           ; FBD3   0000

        SLL     R2,     2                       ; FBD4   004E
        DECLE   $0000                           ; FBD5   0000

        DECR    R1                              ; FBD6   0011
        INCR    R0                              ; FBD7   0008
        INCR    R2                              ; FBD8   000A
        SLR     R0,     1                       ; FBD9   0060
        INCR    R1                              ; FBDA   0009
        DIS                                     ; FBDB   0003
        INCR    R2                              ; FBDC   000A
        DECLE   $0000                           ; FBDD   0000

        INCR    R1                              ; FBDE   0009
        EIS                                     ; FBDF   0002
        GSWD    R1                              ; FBE0   0031
        ADDR    R3,     R0                      ; FBE1   00D8
        MOVR    R5,     R3                      ; FBE2   00AB
        RRC     R1,     1                       ; FBE3   0071
        SLLC    R2,     2                       ; FBE4   005E
        MOVR    R5,     R0                      ; FBE5   00A8
        DECR    R1                              ; FBE6   0011

        JSR     R4,     .EXEC.037               ; FBE7   0004 0010 0037

        CLRC                                    ; FBEA   0006
        SARC    R0,     1                       ; FBEB   0078
        INCR    R2                              ; FBEC   000A
        SLL     R0,     1                       ; FBED   0048
        INCR    R5                              ; FBEE   000D
        DECLE   $0005                           ; FBEF   0005

        SETC                                    ; FBF0   0007
        INCR    R1                              ; FBF1   0009
        INCR    R1                              ; FBF2   0009
        CLRC                                    ; FBF3   0006
        INCR    R2                              ; FBF4   000A
        DECLE   $0000                           ; FBF5   0000

        SETC                                    ; FBF6   0007
        XOR@    R4,     R7                      ; FBF7   03E7
        INCR    R1                              ; FBF8   0009
        EIS                                     ; FBF9   0002
        GSWD    R1                              ; FBFA   0031
        ADDR    R5,     R4                      ; FBFB   00EC
        MOVR    R5,     R3                      ; FBFC   00AB
        RRC     R1,     1                       ; FBFD   0071
        SLLC    R2,     2                       ; FBFE   005E
        MOVR    R5,     R0                      ; FBFF   00A8
        DECR    R0                              ; FC00   0010
        RSWD    R6                              ; FC01   003E
        INCR    R2                              ; FC02   000A
        SAR     R0,     1                       ; FC03   0068
        DECLE   $0000                           ; FC04   0000

        ADDR    R5,     R6                      ; FC05   00EE
        EIS                                     ; FC06   0002
        DIS                                     ; FC07   0003
        COMR    R1                              ; FC08   0019
        DECLE   $0000                           ; FC09   0000

        INCR    R1                              ; FC0A   0009
        ADCR    R0                              ; FC0B   0028
        RRC     R1,     1                       ; FC0C   0071
        SLLC    R2,     2                       ; FC0D   005E
        MOVR    R5,     R0                      ; FC0E   00A8
        SLLC    R1,     2                       ; FC0F   005D
        INCR    R5                              ; FC10   000D
        MOVR    R3,     R4                      ; FC11   009C
        INCR    R4                              ; FC12   000C
        ADDR    R4,     R7                      ; FC13   00E7
        INCR    R3                              ; FC14   000B
        RSWD    R4                              ; FC15   003C
        INCR    R3                              ; FC16   000B
        TSTR    R3                              ; FC17   009B
        INCR    R2                              ; FC18   000A
        EIS                                     ; FC19   0002
        INCR    R2                              ; FC1A   000A
        RRC     R3,     1                       ; FC1B   0073
        INCR    R1                              ; FC1C   0009
        ADDR    R5,     R3                      ; FC1D   00EB
        INCR    R0                              ; FC1E   0008
        SAR     R3,     1                       ; FC1F   006B
        INCR    R0                              ; FC20   0008
        ADDR    R6,     R2                      ; FC21   00F2
        SETC                                    ; FC22   0007
        TSTR    R0                              ; FC23   0080
        SETC                                    ; FC24   0007
        DECR    R4                              ; FC25   0014
        SETC                                    ; FC26   0007
        MVI@    R5,     R0                      ; FC27   02A8
        PSHR    R5                              ; FC28   0275
        SDBD                                    ; FC29   0001
        MVII    #$A81B, R5                      ; FC2A   02BD 001B 00A8
        ADDR    R0,     R5                      ; FC2D   00C5
        MVI@    R5,     R2                      ; FC2E   02AA
        CMP     G_013A, R2                      ; FC2F   0342 013A
        BLT     L_FC4C                          ; FC31   0205 0019
        BGT     L_FC39                          ; FC33   020E 0004

        RRC     R2,     1                       ; FC35   0072
        BC      L_FC4C                          ; FC36   0201 0014

        RLC     R2,     1                       ; FC38   0052
L_FC39:
        SDBD                                    ; FC39   0001
        MVI@    R5,     R3                      ; FC3A   02AB
        MVII    #$001B, R0                      ; FC3B   02B8 001B
        MVII    #$0139, R4                      ; FC3D   02BC 0139

        JSR     R5,     X_FILL_ZERO             ; FC3F   0004 0114 0338

        MVO     R1,     G_013B                  ; FC42   0241 013B
        MVO     R2,     G_013A                  ; FC44   0242 013A
        MVO     R3,     G_0318                  ; FC46   0243 0318
        MVII    #$0001, R0                      ; FC48   02B8 0001
        MVO     R0,     G_0139                  ; FC4A   0240 0139
L_FC4C:
        PULR    R7                              ; FC4C   02B7
        PSHR    R5                              ; FC4D   0275
        MVI     G_0153, R0                      ; FC4E   0280 0153
        DECR    R0                              ; FC50   0010
        BMI     L_FC57                          ; FC51   020B 0004

        MVO     R0,     G_0153                  ; FC53   0240 0153
        BNEQ    L_FC4C                          ; FC55   022C 000A

L_FC57:
        MVI     G_0139, R0                      ; FC57   0280 0139
        DECR    R0                              ; FC59   0010
        BMI     L_FC4C                          ; FC5A   022B 000F

        MVO     R0,     G_0139                  ; FC5C   0240 0139
        BNEQ    L_FC67                          ; FC5E   020C 0007

        MVI     G_0318, R4                      ; FC60   0284 0318

        JSR     R5,     G_ACC5                  ; FC62   0004 01AC 00C5

        MVO     R4,     G_0318                  ; FC65   0244 0318
L_FC67:
        MVI     G_0152, R0                      ; FC67   0280 0152
        MVO     R0,     G_0153                  ; FC69   0240 0153
        MVII    #$01F4, R3                      ; FC6B   02BB 01F4
        MVII    #$0147, R5                      ; FC6D   02BD 0147
L_FC6F:
        MVI@    R3,     R0                      ; FC6F   0298
        ANDI    #$000F, R0                      ; FC70   03B8 000F
        SUBI    #$0004, R3                      ; FC72   033B 0004
        SWAP    R0,     1                       ; FC74   0040
        ADD@    R3,     R0                      ; FC75   02D8
        SDBD                                    ; FC76   0001
        ADD@    R5,     R0                      ; FC77   02E8
        MOVR    R3,     R4                      ; FC78   009C
        ADDI    #$0004, R3                      ; FC79   02FB 0004
        MOVR    R0,     R1                      ; FC7B   0081
        SWAP    R1,     1                       ; FC7C   0041
        MVO@    R0,     R4                      ; FC7D   0260
        MVO@    R1,     R3                      ; FC7E   0259
        INCR    R3                              ; FC7F   000B
        CMPI    #$01F7, R3                      ; FC80   037B 01F7
        BNEQ    L_FC6F                          ; FC82   022C 0014

        MVI     G_013F, R0                      ; FC84   0280 013F
        MOVR    R0,     R1                      ; FC86   0081
        SLR     R0,     2                       ; FC87   0064
        SLR     R0,     1                       ; FC88   0060
        ADD     G_0140, R1                      ; FC89   02C1 0140
        MVO     R0,     .PSG0.noise             ; FC8B   0240 01F9
        MVO     R1,     G_013F                  ; FC8D   0241 013F
        MVII    #$014F, R2                      ; FC8F   02BA 014F
        MVII    #$0144, R3                      ; FC91   02BB 0144
        MVII    #$0141, R4                      ; FC93   02BC 0141
        MVII    #$01FB, R5                      ; FC95   02BD 01FB
L_FC97:
        MVI@    R2,     R0                      ; FC97   0290
        DECR    R0                              ; FC98   0010
        BMI     L_FCA0                          ; FC99   020B 0005

        MVO@    R0,     R2                      ; FC9B   0250
        BNEQ    L_FCA0                          ; FC9C   020C 0002

        MVO@    R0,     R4                      ; FC9E   0260
        INCR    R7                              ; FC9F   000F
L_FCA0:
        MVI@    R4,     R0                      ; FCA0   02A0
        ADD@    R3,     R0                      ; FCA1   02D8
        ANDI    #$007F, R0                      ; FCA2   03B8 007F
        DECR    R4                              ; FCA4   0014
        MVO@    R0,     R4                      ; FCA5   0260
        SLR     R0,     2                       ; FCA6   0064
        SLR     R0,     1                       ; FCA7   0060
        MVO@    R0,     R5                      ; FCA8   0268
        INCR    R2                              ; FCA9   000A
        INCR    R3                              ; FCAA   000B
        CMPI    #$01FE, R5                      ; FCAB   037D 01FE
        BNEQ    L_FC97                          ; FCAD   022C 0017

        PULR    R7                              ; FCAF   02B7
        XORR    R6,     R0                      ; FCB0   01F0
        XORR    R6,     R1                      ; FCB1   01F1
        XORR    R6,     R2                      ; FCB2   01F2
        CMPR    R0,     R7                      ; FCB3   0147
        CMPR    R1,     R1                      ; FCB4   0149
        CMPR    R1,     R3                      ; FCB5   014B
        SUBR    R7,     R7                      ; FCB6   013F
        CMPR    R0,     R0                      ; FCB7   0140
        CMPR    R1,     R5                      ; FCB8   014D
        SUBR    R7,     R1                      ; FCB9   0139
        CMPR    R0,     R1                      ; FCBA   0141
        CMPR    R0,     R2                      ; FCBB   0142
        CMPR    R0,     R3                      ; FCBC   0143
        CMPR    R0,     R4                      ; FCBD   0144
        CMPR    R0,     R5                      ; FCBE   0145
        CMPR    R0,     R6                      ; FCBF   0146
        XORR    R7,     R0                      ; FCC0   01F8
        SUBR    R7,     R3                      ; FCC1   013B
        SUBR    R7,     R4                      ; FCC2   013C
        SUBR    R7,     R5                      ; FCC3   013D
        SUBR    R7,     R6                      ; FCC4   013E
        PSHR    R5                              ; FCC5   0275
L_FCC6:
        MVI@    R4,     R2                      ; FCC6   02A2
        MOVR    R2,     R3                      ; FCC7   0093
        ANDI    #$0200, R3                      ; FCC8   03BB 0200
        BNEQ    L_FD25                          ; FCCA   020C 0059

        MOVR    R2,     R3                      ; FCCC   0093
        ANDI    #$001F, R3                      ; FCCD   03BB 001F
        MOVR    R3,     R5                      ; FCCF   009D
        SDBD                                    ; FCD0   0001
        ADDI    #$ACB0, R3                      ; FCD1   02FB 00B0 00AC
        MVI@    R3,     R3                      ; FCD4   029B
        INCR    R5                              ; FCD5   000D
        ADDR    R7,     R5                      ; FCD6   00FD
        ADD@    R5,     R7                      ; FCD7   02EF
        COMR    R3                              ; FCD8   001B
        COMR    R3                              ; FCD9   001B
        COMR    R3                              ; FCDA   001B
        COMR    R7                              ; FCDB   001F
        COMR    R7                              ; FCDC   001F
        COMR    R7                              ; FCDD   001F
        ADCR    R5                              ; FCDE   002D
        ADCR    R5                              ; FCDF   002D
        ADCR    R1                              ; FCE0   0029
        SWAP    R1,     2                       ; FCE1   0045
        ADCR    R5                              ; FCE2   002D
        ADCR    R5                              ; FCE3   002D
        ADCR    R5                              ; FCE4   002D
        ADCR    R5                              ; FCE5   002D
        ADCR    R5                              ; FCE6   002D
        ADCR    R5                              ; FCE7   002D
        ADCR    R5                              ; FCE8   002D
        GSWD    R1                              ; FCE9   0031
        GSWD    R1                              ; FCEA   0031
        GSWD    R1                              ; FCEB   0031
        GSWD    R1                              ; FCEC   0031
        DECR    R6                              ; FCED   0016
        SDBD                                    ; FCEE   0001
        MVII    #$ACC6, R5                      ; FCEF   02BD 00C6 00AC
        MOVR    R4,     R7                      ; FCF2   00A7
        MVII    #$0004, R5                      ; FCF3   02BD 0004
        B       L_FCF9                          ; FCF5   0200 0002

        MVII    #$0001, R5                      ; FCF7   02BD 0001
L_FCF9:
        SDBD                                    ; FCF9   0001
        MVI@    R4,     R0                      ; FCFA   02A0
        MVO@    R0,     R3                      ; FCFB   0258
        SWAP    R0,     1                       ; FCFC   0040
        ADDR    R5,     R3                      ; FCFD   00EB
        MVO@    R0,     R3                      ; FCFE   0258
        B       L_FCC6                          ; FCFF   0220 003A

        MVII    #$0002, R0                      ; FD01   02B8 0002
        MVO     R0,     G_0152                  ; FD03   0240 0152
L_FD05:
        MVI@    R4,     R0                      ; FD05   02A0
        MVO@    R0,     R3                      ; FD06   0258
        B       L_FCC6                          ; FD07   0220 0042

        ANDI    #$0060, R2                      ; FD09   03BA 0060
        BEQ     L_FD05                          ; FD0B   0224 0007

        SDBD                                    ; FD0D   0001
        MVI@    R4,     R5                      ; FD0E   02A5
        ANDI    #$0040, R2                      ; FD0F   03BA 0040
        BNEQ    L_FD1A                          ; FD11   020C 0007

        MVI@    R3,     R0                      ; FD13   0298
        DECR    R0                              ; FD14   0010
        BMI     L_FD1A                          ; FD15   020B 0003

        MVO@    R0,     R3                      ; FD17   0258
        BEQ     L_FCC6                          ; FD18   0224 0053

L_FD1A:
        MOVR    R5,     R4                      ; FD1A   00AC
        B       L_FCC6                          ; FD1B   0220 0056

        MVI@    R4,     R0                      ; FD1D   02A0
        MVO@    R0,     R3                      ; FD1E   0258
        TSTR    R0                              ; FD1F   0080
        BNEQ    L_FD24                          ; FD20   020C 0002

        MVO     R0,     G_013A                  ; FD22   0240 013A
L_FD24:
        PULR    R7                              ; FD24   02B7
L_FD25:
        PSHR    R2                              ; FD25   0272
        MOVR    R2,     R3                      ; FD26   0093
        SLL     R3,     2                       ; FD27   004F
        SWAP    R3,     1                       ; FD28   0043
        ANDI    #$0003, R3                      ; FD29   03BB 0003
        ADDI    #$01F0, R3                      ; FD2B   02FB 01F0
        MOVR    R2,     R5                      ; FD2D   0095
        ANDI    #$003F, R5                      ; FD2E   03BD 003F
        MOVR    R5,     R1                      ; FD30   00A9
        BEQ     L_FD50                          ; FD31   0204 001D

        CLRR    R2                              ; FD33   01D2
L_FD34:
        INCR    R2                              ; FD34   000A
        SUBI    #$000C, R5                      ; FD35   033D 000C
        BPL     L_FD34                          ; FD37   0223 0004

        DECR    R2                              ; FD39   0012
        ADDI    #$000C, R5                      ; FD3A   02FD 000C
        ADDR    R5,     R5                      ; FD3C   00ED
        SDBD                                    ; FD3D   0001
        ADDI    #$AC0F, R5                      ; FD3E   02FD 000F 00AC
        SDBD                                    ; FD41   0001
        MVI@    R5,     R1                      ; FD42   02A9
L_FD43:
        SARC    R1,     1                       ; FD43   0079
        DECR    R2                              ; FD44   0012
        BPL     L_FD43                          ; FD45   0223 0003

        RLC     R1,     1                       ; FD47   0051
        MVO@    R1,     R3                      ; FD48   0259
        SWAP    R1,     1                       ; FD49   0041
        MOVR    R3,     R5                      ; FD4A   009D
        ADDI    #$0004, R5                      ; FD4B   02FD 0004
        MVO@    R1,     R5                      ; FD4D   0269
        MVI     G_014D, R1                      ; FD4E   0281 014D
L_FD50:
        SUBI    #$01F0, R3                      ; FD50   033B 01F0
        ADDI    #$0141, R3                      ; FD52   02FB 0141
        MVO@    R1,     R3                      ; FD54   0259
        SUBI    #$0141, R3                      ; FD55   033B 0141
        ADDI    #$014F, R3                      ; FD57   02FB 014F
        MVII    #$0003, R0                      ; FD59   02B8 0003
        MVO     R0,     G_0139                  ; FD5B   0240 0139
        SUB     G_014E, R0                      ; FD5D   0300 014E
        BGT     L_FD63                          ; FD5F   020E 0002

        MVII    #$0001, R0                      ; FD61   02B8 0001
L_FD63:
        MVO@    R0,     R3                      ; FD63   0258
        PULR    R2                              ; FD64   02B2
        ANDI    #$0100, R2                      ; FD65   03BA 0100
        BEQ     L_FCC6                          ; FD67   0224 00A2

        PULR    R7                              ; FD69   02B7
        PSHR    R5                              ; FD6A   0275
        SDBD                                    ; FD6B   0001
        MVII    #$AE3A, R1                      ; FD6C   02B9 003A 00AE
        TSTR    R0                              ; FD6F   0080
        BEQ     L_FD76                          ; FD70   0204 0004

        SDBD                                    ; FD72   0001
        MVII    #$AF20, R1                      ; FD73   02B9 0020 00AF
L_FD76:
        MVO     R1,     G_0318                  ; FD76   0241 0318
        SDBD                                    ; FD78   0001
        MVII    #$AE12, R0                      ; FD79   02B8 0012 00AE
        MVO     R0,     G_0345                  ; FD7C   0240 0345
        CLRR    R0                              ; FD7E   01C0
        MVO     R0,     G_011B                  ; FD7F   0240 011B
        MVO     R0,     G_011C                  ; FD81   0240 011C

        JSR     R5,     L_67A4                  ; FD83   0004 0164 03A4

        MVII    #$0028, R0                      ; FD86   02B8 0028
        CLRR    R4                              ; FD88   01E4

        JSR     R5,     X_FILL_ZERO             ; FD89   0004 0114 0338
        JSR     R5,     L_5BA2                  ; FD8C   0004 0158 03A2
        JSR     R5,     L_51A9                  ; FD8F   0004 0150 01A9

        MOVR    R5,     R1                      ; FD92   00A9
        TSTR    R5                              ; FD93   00AD
        EIS                                     ; FD94   0002
        CLRR    R0                              ; FD95   01C0
        MVO     R0,     G_015D                  ; FD96   0240 015D
L_FD98:
        MVI     G_015D, R0                      ; FD98   0280 015D
        TSTR    R0                              ; FD9A   0080
        BEQ     L_FD98                          ; FD9B   0224 0004

        CMPI    #$0002, R0                      ; FD9D   0378 0002
        BEQ     L_FE0D                          ; FD9F   0204 006C

        CLRR    R0                              ; FDA1   01C0
        MVO     R0,     G_015D                  ; FDA2   0240 015D

        JSR     R5,     L_5044                  ; FDA4   0004 0150 0044

        B       L_FD98                          ; FDA7   0220 0010

        PSHR    R5                              ; FDA9   0275
        MVII    #$0002, R0                      ; FDAA   02B8 0002
        MVO     R0,     .STIC.EDGE              ; FDAC   0240 0032
        MVO     R0,     .STIC.VIDEN             ; FDAE   0240 0020
        MVI     G_011B, R0                      ; FDB0   0280 011B
        DECR    R0                              ; FDB2   0010
        MVO     R0,     G_011B                  ; FDB3   0240 011B
        BPL     L_FE09                          ; FDB5   0203 0052

        MVII    #$0001, R0                      ; FDB7   02B8 0001
        MVO     R0,     G_011B                  ; FDB9   0240 011B
        MVI     G_011C, R0                      ; FDBB   0280 011C
        DECR    R0                              ; FDBD   0010
        MVO     R0,     G_011C                  ; FDBE   0240 011C
        MVO     R0,     .STIC.VDLY              ; FDC0   0240 0031
        BPL     L_FE09                          ; FDC2   0203 0045

        MVII    #$0007, R0                      ; FDC4   02B8 0007
        MVO     R0,     G_011C                  ; FDC6   0240 011C
        MVII    #$0214, R4                      ; FDC8   02BC 0214
        MVII    #$0200, R5                      ; FDCA   02BD 0200
        MVII    #$000B, R2                      ; FDCC   02BA 000B
L_FDCE:
        MVII    #$0014, R3                      ; FDCE   02BB 0014
L_FDD0:
        MVI@    R4,     R0                      ; FDD0   02A0
        MVO@    R0,     R5                      ; FDD1   0268
        DECR    R3                              ; FDD2   0013
        BNEQ    L_FDD0                          ; FDD3   022C 0004

        DECR    R2                              ; FDD5   0012
        BNEQ    L_FDCE                          ; FDD6   022C 0009

        MVII    #$0014, R3                      ; FDD8   02BB 0014
L_FDDA:
        MVO@    R2,     R5                      ; FDDA   026A
        DECR    R3                              ; FDDB   0013
        BNEQ    L_FDDA                          ; FDDC   022C 0003

        MVI     G_0345, R5                      ; FDDE   0285 0345
        MVI@    R5,     R4                      ; FDE0   02AC
        CMPI    #$0001, R4                      ; FDE1   037C 0001
        BLT     L_FE07                          ; FDE3   0205 0022
        BEQ     L_FE04                          ; FDE5   0204 001D

        MOVR    R4,     R0                      ; FDE7   00A0
        CMPI    #$0002, R0                      ; FDE8   0378 0002
        BEQ     L_FE0B                          ; FDEA   0204 001F

        CMPI    #$0003, R0                      ; FDEC   0378 0003
        BEQ     L_FE0E                          ; FDEE   0204 001E

        MVI@    R5,     R3                      ; FDF0   02AB
        CMPI    #$002F, R3                      ; FDF1   037B 002F
        BNEQ    L_FDF9                          ; FDF3   020C 0004

        SDBD                                    ; FDF5   0001
        MVII    #$1000, R3                      ; FDF6   02BB 0000 0010
L_FDF9:
        MVI@    R5,     R0                      ; FDF9   02A8
        SUBI    #$0020, R0                      ; FDFA   0338 0020
        BMI     L_FE07                          ; FDFC   020B 0009

        SLL     R0,     2                       ; FDFE   004C
        SLL     R0,     1                       ; FDFF   0048
        XORR    R3,     R0                      ; FE00   01D8
        MVO@    R0,     R4                      ; FE01   0260
        B       L_FDF9                          ; FE02   0220 000A

L_FE04:
        SDBD                                    ; FE04   0001
        MVI@    R5,     R0                      ; FE05   02A8
        MOVR    R0,     R5                      ; FE06   0085
L_FE07:
        MVO     R5,     G_0345                  ; FE07   0245 0345
L_FE09:
        MVII    #$0001, R0                      ; FE09   02B8 0001
L_FE0B:
        MVO     R0,     G_015D                  ; FE0B   0240 015D
L_FE0D:
        PULR    R7                              ; FE0D   02B7
L_FE0E:
        MVI     G_0318, R5                      ; FE0E   0285 0318
        B       L_FE07                          ; FE10   0220 000A

        DECLE   $0000                           ; FE12   0000

        ADD@    R4,     R3                      ; FE13   02E3
        SETC                                    ; FE14   0007
        SWAP    R0,     2                       ; FE15   0044
        SLL     R1,     1                       ; FE16   0049
        SLL     R2,     2                       ; FE17   004E
        SWAP    R1,     2                       ; FE18   0045
        RLC     R2,     1                       ; FE19   0052
        NEGR    R1                              ; FE1A   0021
        DECLE   $0000,  $0000                   ; FE1B   0000 0000

        ADD@    R3,     R7                      ; FE1D   02DF
        SETC                                    ; FE1E   0007
        RLC     R0,     2                       ; FE1F   0054
        SAR     R0,     1                       ; FE20   0068
        SLR     R1,     2                       ; FE21   0065
        NEGR    R0                              ; FE22   0020
        SWAP    R2,     1                       ; FE23   0042
        RRC     R1,     2                       ; FE24   0075
        RRC     R2,     1                       ; FE25   0072
        SLR     R3,     2                       ; FE26   0067
        SLR     R1,     2                       ; FE27   0065
        RRC     R2,     1                       ; FE28   0072
        RLC     R0,     2                       ; FE29   0054
        SAR     R1,     1                       ; FE2A   0069
        SAR     R1,     2                       ; FE2B   006D
        SLR     R1,     2                       ; FE2C   0065
        DECLE   $0000                           ; FE2D   0000

        ADD@    R4,     R3                      ; FE2E   02E3
        SETC                                    ; FE2F   0007
        RLC     R3,     1                       ; FE30   0053
        SLR     R1,     2                       ; FE31   0065
        RRC     R1,     1                       ; FE32   0071
        RRC     R1,     2                       ; FE33   0075
        SLR     R1,     2                       ; FE34   0065
        SAR     R0,     2                       ; FE35   006C
        DECLE   $0000,  $0000,  $0000           ; FE36   0000 0000 0000

        DIS                                     ; FE39   0003
        ADD@    R3,     R5                      ; FE3A   02DD
        DIS                                     ; FE3B   0003
        SLL     R0,     1                       ; FE3C   0048
        SLR     R1,     2                       ; FE3D   0065
        SLR     R1,     1                       ; FE3E   0061
        SLR     R0,     2                       ; FE3F   0064
        NEGR    R0                              ; FE40   0020
        SWAP    R3,     1                       ; FE41   0043
        SAR     R3,     2                       ; FE42   006F
        SAR     R3,     2                       ; FE43   006F
        SAR     R3,     1                       ; FE44   006B
        ADCR    R4                              ; FE45   002C
        DECLE   $0000                           ; FE46   0000

        ADD@    R3,     R7                      ; FE47   02DF
        DIS                                     ; FE48   0003
        SWAP    R0,     2                       ; FE49   0044
        SLR     R1,     2                       ; FE4A   0065
        RRC     R3,     1                       ; FE4B   0073
        SAR     R1,     1                       ; FE4C   0069
        SLR     R3,     2                       ; FE4D   0067
        SAR     R2,     2                       ; FE4E   006E
        SLR     R1,     2                       ; FE4F   0065
        RRC     R2,     1                       ; FE50   0072
        ADCR    R4                              ; FE51   002C
        DECLE   $0000                           ; FE52   0000

        ADD@    R3,     R7                      ; FE53   02DF
        DIS                                     ; FE54   0003
        RLC     R0,     1                       ; FE55   0050
        RRC     R2,     1                       ; FE56   0072
        SAR     R3,     2                       ; FE57   006F
        SLR     R3,     2                       ; FE58   0067
        RRC     R2,     1                       ; FE59   0072
        SLR     R1,     1                       ; FE5A   0061
        SAR     R1,     2                       ; FE5B   006D
        SAR     R1,     2                       ; FE5C   006D
        SLR     R1,     2                       ; FE5D   0065
        RRC     R2,     1                       ; FE5E   0072
        RSWD    R2                              ; FE5F   003A
        DECLE   $0000,  $0000                   ; FE60   0000 0000

        ADD@    R4,     R1                      ; FE62   02E1
        CLRC                                    ; FE63   0006
        RLC     R2,     1                       ; FE64   0052
        SLR     R1,     1                       ; FE65   0061
        SARC    R1,     1                       ; FE66   0079
        NEGR    R0                              ; FE67   0020
        SLL     R3,     1                       ; FE68   004B
        SLR     R1,     1                       ; FE69   0061
        SLR     R1,     2                       ; FE6A   0065
        RRC     R3,     1                       ; FE6B   0073
        RRC     R0,     2                       ; FE6C   0074
        SAR     R2,     2                       ; FE6D   006E
        SLR     R1,     2                       ; FE6E   0065
        RRC     R2,     1                       ; FE6F   0072
        DECLE   $0000,  $0000,  $0000           ; FE70   0000 0000 0000

        ADD@    R3,     R5                      ; FE73   02DD
        DIS                                     ; FE74   0003
        RLC     R3,     2                       ; FE75   0057
        SLR     R1,     1                       ; FE76   0061
        SAR     R1,     1                       ; FE77   0069
        RRC     R0,     2                       ; FE78   0074
        RRC     R2,     1                       ; FE79   0072
        SLR     R1,     2                       ; FE7A   0065
        RRC     R3,     1                       ; FE7B   0073
        RRC     R3,     1                       ; FE7C   0073
        ADCR    R4                              ; FE7D   002C
        DECLE   $0000                           ; FE7E   0000

        ADD@    R3,     R7                      ; FE7F   02DF
        DIS                                     ; FE80   0003
        SWAP    R3,     2                       ; FE81   0047
        RRC     R2,     1                       ; FE82   0072
        SLR     R1,     1                       ; FE83   0061
        RRC     R0,     1                       ; FE84   0070
        SAR     R0,     1                       ; FE85   0068
        SAR     R1,     1                       ; FE86   0069
        SLR     R3,     1                       ; FE87   0063
        NEGR    R0                              ; FE88   0020
        SWAP    R1,     1                       ; FE89   0041
        RRC     R2,     1                       ; FE8A   0072
        RRC     R0,     2                       ; FE8B   0074
        SAR     R1,     1                       ; FE8C   0069
        RRC     R3,     1                       ; FE8D   0073
        RRC     R0,     2                       ; FE8E   0074
        RSWD    R2                              ; FE8F   003A
        DECLE   $0000,  $0000                   ; FE90   0000 0000

        ADD@    R4,     R1                      ; FE92   02E1
        CLRC                                    ; FE93   0006
        SWAP    R3,     1                       ; FE94   0043
        SAR     R3,     2                       ; FE95   006F
        SAR     R2,     2                       ; FE96   006E
        SAR     R2,     2                       ; FE97   006E
        SAR     R1,     1                       ; FE98   0069
        SLR     R1,     2                       ; FE99   0065
        NEGR    R0                              ; FE9A   0020
        SWAP    R3,     2                       ; FE9B   0047
        SAR     R3,     2                       ; FE9C   006F
        SAR     R0,     2                       ; FE9D   006C
        SLR     R0,     2                       ; FE9E   0064
        SAR     R1,     2                       ; FE9F   006D
        SLR     R1,     1                       ; FEA0   0061
        SAR     R2,     2                       ; FEA1   006E
        DECLE   $0000,  $0000,  $0000           ; FEA2   0000 0000 0000

        ADD@    R3,     R5                      ; FEA5   02DD
        DIS                                     ; FEA6   0003
        RLC     R3,     1                       ; FEA7   0053
        SAR     R3,     2                       ; FEA8   006F
        SLR     R0,     2                       ; FEA9   0064
        SLR     R1,     1                       ; FEAA   0061
        NEGR    R0                              ; FEAB   0020
        SLL     R2,     1                       ; FEAC   004A
        SLR     R1,     2                       ; FEAD   0065
        RRC     R2,     1                       ; FEAE   0072
        SAR     R3,     1                       ; FEAF   006B
        ADCR    R4                              ; FEB0   002C
        DECLE   $0000                           ; FEB1   0000

        ADD@    R3,     R7                      ; FEB2   02DF
        DIS                                     ; FEB3   0003
        RLC     R3,     1                       ; FEB4   0053
        SAR     R3,     2                       ; FEB5   006F
        RRC     R1,     2                       ; FEB6   0075
        SAR     R2,     2                       ; FEB7   006E
        SLR     R0,     2                       ; FEB8   0064
        NEGR    R0                              ; FEB9   0020
        SLL     R1,     2                       ; FEBA   004D
        SLR     R1,     1                       ; FEBB   0061
        SAR     R2,     2                       ; FEBC   006E
        ADCR    R4                              ; FEBD   002C
        DECLE   $0000                           ; FEBE   0000

        ADD@    R3,     R7                      ; FEBF   02DF
        DIS                                     ; FEC0   0003
        RLC     R0,     1                       ; FEC1   0050
        RRC     R2,     1                       ; FEC2   0072
        SAR     R3,     2                       ; FEC3   006F
        SLR     R0,     2                       ; FEC4   0064
        RRC     R1,     2                       ; FEC5   0075
        SLR     R3,     1                       ; FEC6   0063
        SLR     R1,     2                       ; FEC7   0065
        RRC     R2,     1                       ; FEC8   0072
        RSWD    R2                              ; FEC9   003A
        DECLE   $0000,  $0000                   ; FECA   0000 0000

        ADD@    R4,     R1                      ; FECC   02E1
        CLRC                                    ; FECD   0006
        SWAP    R0,     2                       ; FECE   0044
        SLR     R1,     1                       ; FECF   0061
        RRC     R2,     2                       ; FED0   0076
        SLR     R1,     2                       ; FED1   0065
        NEGR    R0                              ; FED2   0020
        RLC     R3,     2                       ; FED3   0057
        SLR     R1,     1                       ; FED4   0061
        RRC     R2,     1                       ; FED5   0072
        SAR     R0,     1                       ; FED6   0068
L_FED7:
        SAR     R3,     2                       ; FED7   006F
        SAR     R0,     2                       ; FED8   006C
        DECLE   $0000,  $0000,  $0000,  $0000   ; FED9   0000 0000 0000 0000

        ADD@    R4,     R3                      ; FEDD   02E3
        SETC                                    ; FEDE   0007
        SWAP    R0,     2                       ; FEDF   0044
        SLL     R1,     1                       ; FEE0   0049
        SLL     R2,     2                       ; FEE1   004E
        SWAP    R1,     2                       ; FEE2   0045
        RLC     R2,     1                       ; FEE3   0052
        NEGR    R1                              ; FEE4   0021
        DECLE   $0000                           ; FEE5   0000

        ADD@    R4,     R1                      ; FEE6   02E1
        DIS                                     ; FEE7   0003
        CMPR    R0,     R4                      ; FEE8   0144
        GSWD    R1                              ; FEE9   0031
        RSWD    R1                              ; FEEA   0039
        RSWD    R0                              ; FEEB   0038
        DECLE   $0037                           ; FEEC   0037

        NEGR    R0                              ; FEED   0020
        CMPR    R0,     R5                      ; FEEE   0145
        CMPR    R0,     R6                      ; FEEF   0146
        CMPR    R0,     R7                      ; FEF0   0147
        CMPR    R1,     R0                      ; FEF1   0148
        DECLE   $0000,  $0000                   ; FEF2   0000 0000

        ADD@    R4,     R1                      ; FEF4   02E1
        SETC                                    ; FEF5   0007
        SWAP    R2,     1                       ; FEF6   0042
        RRC     R1,     2                       ; FEF7   0075
        RRC     R2,     1                       ; FEF8   0072
        SLR     R3,     2                       ; FEF9   0067
        SLR     R1,     2                       ; FEFA   0065
        RRC     R2,     1                       ; FEFB   0072
        RLC     R0,     2                       ; FEFC   0054
        SAR     R1,     1                       ; FEFD   0069
        SAR     R1,     2                       ; FEFE   006D
        SLR     R1,     2                       ; FEFF   0065
        NEGR    R1                              ; FF00   0021
        DECLE   $0000                           ; FF01   0000

        ADD@    R3,     R7                      ; FF02   02DF
        DIS                                     ; FF03   0003
        CMPR    R0,     R4                      ; FF04   0144
        GSWD    R1                              ; FF05   0031
        RSWD    R1                              ; FF06   0039
        RSWD    R0                              ; FF07   0038
        GSWD    R2                              ; FF08   0032
        NEGR    R0                              ; FF09   0020
        SWAP    R0,     2                       ; FF0A   0044
        SLR     R1,     1                       ; FF0B   0061
        RRC     R0,     2                       ; FF0C   0074
        SLR     R1,     1                       ; FF0D   0061
        NEGR    R0                              ; FF0E   0020
        SWAP    R1,     2                       ; FF0F   0045
        SLR     R1,     1                       ; FF10   0061
        RRC     R3,     1                       ; FF11   0073
        RRC     R0,     2                       ; FF12   0074
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF13   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF17   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF1B   0000 0000 0000 0000

        EIS                                     ; FF1F   0002
        ADD@    R3,     R5                      ; FF20   02DD
        DIS                                     ; FF21   0003
        SWAP    R1,     1                       ; FF22   0041
        RRC     R2,     2                       ; FF23   0076
        SAR     R3,     2                       ; FF24   006F
        SAR     R1,     1                       ; FF25   0069
        SLR     R0,     2                       ; FF26   0064
        NEGR    R0                              ; FF27   0020
        SLR     R1,     2                       ; FF28   0065
        SAR     R2,     2                       ; FF29   006E
        SLR     R1,     2                       ; FF2A   0065
        SAR     R1,     2                       ; FF2B   006D
        SARC    R1,     1                       ; FF2C   0079
        NEGR    R0                              ; FF2D   0020
        SLR     R2,     2                       ; FF2E   0066
        SAR     R3,     2                       ; FF2F   006F
        SAR     R3,     2                       ; FF30   006F
        SLR     R0,     2                       ; FF31   0064
        NEGR    R1                              ; FF32   0021
        DECLE   $0000,  $0000                   ; FF33   0000 0000

        ADD@    R3,     R5                      ; FF35   02DD
        DIS                                     ; FF36   0003
        SLL     R3,     1                       ; FF37   004B
        SAR     R1,     1                       ; FF38   0069
        SLR     R3,     1                       ; FF39   0063
        SAR     R3,     1                       ; FF3A   006B
        NEGR    R0                              ; FF3B   0020
        SLR     R2,     2                       ; FF3C   0066
        SAR     R3,     2                       ; FF3D   006F
        SAR     R3,     2                       ; FF3E   006F
        SLR     R0,     2                       ; FF3F   0064
        NEGR    R0                              ; FF40   0020
        SLR     R2,     1                       ; FF41   0062
        SLR     R1,     1                       ; FF42   0061
        SAR     R0,     2                       ; FF43   006C
        SAR     R0,     2                       ; FF44   006C
        RRC     R3,     1                       ; FF45   0073
        NEGR    R0                              ; FF46   0020
        RRC     R0,     2                       ; FF47   0074
        SAR     R3,     2                       ; FF48   006F
        DECLE   $0000                           ; FF49   0000

        ADD@    R4,     R0                      ; FF4A   02E0
        DIS                                     ; FF4B   0003
        SLR     R2,     1                       ; FF4C   0062
        SAR     R3,     2                       ; FF4D   006F
        RRC     R0,     2                       ; FF4E   0074
        RRC     R0,     2                       ; FF4F   0074
        SAR     R3,     2                       ; FF50   006F
        SAR     R1,     2                       ; FF51   006D
        NEGR    R0                              ; FF52   0020
        RRC     R0,     1                       ; FF53   0070
        SAR     R0,     2                       ; FF54   006C
        SLR     R1,     1                       ; FF55   0061
        RRC     R0,     2                       ; FF56   0074
        SLR     R1,     2                       ; FF57   0065
        NEGR    R1                              ; FF58   0021
        DECLE   $0000,  $0000                   ; FF59   0000 0000

        ADD@    R3,     R5                      ; FF5B   02DD
        DIS                                     ; FF5C   0003
        RLC     R2,     1                       ; FF5D   0052
        SAR     R3,     2                       ; FF5E   006F
        SAR     R0,     2                       ; FF5F   006C
        SAR     R0,     2                       ; FF60   006C
        NEGR    R0                              ; FF61   0020
        SLR     R2,     2                       ; FF62   0066
        SAR     R3,     2                       ; FF63   006F
        SAR     R3,     2                       ; FF64   006F
        SLR     R0,     2                       ; FF65   0064
        NEGR    R0                              ; FF66   0020
        SLR     R2,     1                       ; FF67   0062
        SLR     R1,     1                       ; FF68   0061
        SAR     R0,     2                       ; FF69   006C
        SAR     R0,     2                       ; FF6A   006C
        RRC     R3,     1                       ; FF6B   0073
        DECLE   $0000                           ; FF6C   0000

        ADD@    R4,     R0                      ; FF6D   02E0
        DIS                                     ; FF6E   0003
        SAR     R3,     2                       ; FF6F   006F
        RRC     R2,     2                       ; FF70   0076
        SLR     R1,     2                       ; FF71   0065
        RRC     R2,     1                       ; FF72   0072
        NEGR    R0                              ; FF73   0020
        SLR     R1,     2                       ; FF74   0065
        SAR     R2,     2                       ; FF75   006E
        SLR     R1,     2                       ; FF76   0065
        SAR     R1,     2                       ; FF77   006D
        SAR     R1,     1                       ; FF78   0069
        SLR     R1,     2                       ; FF79   0065
        RRC     R3,     1                       ; FF7A   0073
        NEGR    R1                              ; FF7B   0021
        DECLE   $0000,  $0000                   ; FF7C   0000 0000

        ADD@    R3,     R5                      ; FF7E   02DD
        DIS                                     ; FF7F   0003
        SWAP    R2,     2                       ; FF80   0046
        RRC     R2,     1                       ; FF81   0072
        SLR     R1,     2                       ; FF82   0065
        SLR     R1,     2                       ; FF83   0065
        SARC    R2,     1                       ; FF84   007A
        SLR     R1,     2                       ; FF85   0065
        NEGR    R0                              ; FF86   0020
        SLR     R1,     2                       ; FF87   0065
        SAR     R2,     2                       ; FF88   006E
        SLR     R1,     2                       ; FF89   0065
        SAR     R1,     2                       ; FF8A   006D
        SAR     R1,     1                       ; FF8B   0069
        SLR     R1,     2                       ; FF8C   0065
        RRC     R3,     1                       ; FF8D   0073
        NEGR    R0                              ; FF8E   0020
        RRC     R3,     2                       ; FF8F   0077
        SAR     R1,     1                       ; FF90   0069
        RRC     R0,     2                       ; FF91   0074
        SAR     R0,     1                       ; FF92   0068
        DECLE   $0000                           ; FF93   0000

        ADD@    R4,     R0                      ; FF94   02E0
        DIS                                     ; FF95   0003
        RRC     R0,     1                       ; FF96   0070
        SLR     R1,     2                       ; FF97   0065
        RRC     R0,     1                       ; FF98   0070
        RRC     R0,     1                       ; FF99   0070
        SLR     R1,     2                       ; FF9A   0065
        RRC     R2,     1                       ; FF9B   0072
        NEGR    R1                              ; FF9C   0021
        DECLE   $0000,  $0000                   ; FF9D   0000 0000

        ADD@    R3,     R5                      ; FF9F   02DD
        DIS                                     ; FFA0   0003
        SWAP    R3,     1                       ; FFA1   0043
        SAR     R3,     2                       ; FFA2   006F
        SAR     R0,     2                       ; FFA3   006C
        SAR     R0,     2                       ; FFA4   006C
        SLR     R1,     2                       ; FFA5   0065
        SLR     R3,     1                       ; FFA6   0063
        RRC     R0,     2                       ; FFA7   0074
        NEGR    R0                              ; FFA8   0020
        RRC     R0,     1                       ; FFA9   0070
        RRC     R2,     1                       ; FFAA   0072
        SAR     R1,     1                       ; FFAB   0069
        SARC    R2,     1                       ; FFAC   007A
        SLR     R1,     2                       ; FFAD   0065
        RRC     R3,     1                       ; FFAE   0073
        NEGR    R0                              ; FFAF   0020
        SLR     R2,     2                       ; FFB0   0066
        SAR     R3,     2                       ; FFB1   006F
        RRC     R2,     1                       ; FFB2   0072
        DECLE   $0000                           ; FFB3   0000

        ADD@    R4,     R0                      ; FFB4   02E0
        DIS                                     ; FFB5   0003
        SLR     R1,     2                       ; FFB6   0065
        SARC    R0,     1                       ; FFB7   0078
        RRC     R0,     2                       ; FFB8   0074
        RRC     R2,     1                       ; FFB9   0072
        SLR     R1,     1                       ; FFBA   0061
        NEGR    R0                              ; FFBB   0020
        RRC     R0,     1                       ; FFBC   0070
        SLR     R1,     2                       ; FFBD   0065
        RRC     R0,     1                       ; FFBE   0070
        RRC     R0,     1                       ; FFBF   0070
        SLR     R1,     2                       ; FFC0   0065
        RRC     R2,     1                       ; FFC1   0072
        NEGR    R1                              ; FFC2   0021
        DECLE   $0000,  $0000                   ; FFC3   0000 0000

        ADD@    R3,     R5                      ; FFC5   02DD
        DIS                                     ; FFC6   0003
        SWAP    R1,     1                       ; FFC7   0041
        SAR     R1,     2                       ; FFC8   006D
        SLR     R1,     1                       ; FFC9   0061
        SARC    R2,     1                       ; FFCA   007A
        SLR     R1,     2                       ; FFCB   0065
        NEGR    R0                              ; FFCC   0020
        SARC    R1,     1                       ; FFCD   0079
        SAR     R3,     2                       ; FFCE   006F
        RRC     R1,     2                       ; FFCF   0075
        RRC     R2,     1                       ; FFD0   0072
        NEGR    R0                              ; FFD1   0020
        SLR     R2,     2                       ; FFD2   0066
        RRC     R2,     1                       ; FFD3   0072
        SAR     R1,     1                       ; FFD4   0069
        SLR     R1,     2                       ; FFD5   0065
        SAR     R2,     2                       ; FFD6   006E
        SLR     R0,     2                       ; FFD7   0064
        RRC     R3,     1                       ; FFD8   0073
        NEGR    R1                              ; FFD9   0021
        DECLE   $0000,  $0001                   ; FFDA   0000 0001

        ADDR    R3,     R2                      ; FFDC   00DA
        MOVR    R5,     R6                      ; FFDD   00AE
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFDE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFFA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; FFFE   0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;; ======================================================================== ;;
