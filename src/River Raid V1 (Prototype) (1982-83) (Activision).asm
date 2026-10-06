
        ORG     $5000
.HEADER:
        INCR    R4                              ; 5000   000C
        RLC     R0,     1                       ; 5001   0050
        INCR    R4                              ; 5002   000C
        RLC     R0,     1                       ; 5003   0050
        MOVR    R5,     R2                      ; 5004   00AA
        RLC     R2,     1                       ; 5005   0052
        MOVR    R2,     R5                      ; 5006   0095
        RLC     R0,     1                       ; 5007   0050
        INCR    R6                              ; 5008   000E
        RLC     R0,     1                       ; 5009   0050
        DECR    R1                              ; 500A   0011
        RLC     R0,     1                       ; 500B   0050
        TSTR    R0                              ; 500C   0080
        DECLE   $0000,  $0001,  $0001           ; 500D   0000 0001 0001

        SUB     G_0052, R0                      ; 5010   0300 0052
        NEGR    R0                              ; 5012   0020
        DECLE   $0000                           ; 5013   0000

        MOVR    R7,     R0                      ; 5014   00B8
        ADDI    #$0012, R0                      ; 5015   02F8 0012
        MVO     R0,     .ISRVEC.0               ; 5017   0240 0100
        SWAP    R0,     1                       ; 5019   0040
        MVO     R0,     .ISRVEC.1               ; 501A   0240 0101
        EIS                                     ; 501C   0002
        CLRR    R0                              ; 501D   01C0
        MVII    #$02D5, R4                      ; 501E   02BC 02D5
        MVII    #$0216, R5                      ; 5020   02BD 0216
        MOVR    R7,     R1                      ; 5022   00B9
        MVO@    R0,     R4                      ; 5023   0260
        MVO@    R0,     R5                      ; 5024   0268
        MVO@    R0,     R5                      ; 5025   0268
        MOVR    R1,     R7                      ; 5026   008F
        DIS                                     ; 5027   0003
        CLRR    R0                              ; 5028   01C0
        CLRR    R4                              ; 5029   01E4
        MVII    #$001A, R1                      ; 502A   02B9 001A
L_502C:
        MVO@    R0,     R4                      ; 502C   0260
        DECR    R1                              ; 502D   0011
        BNEQ    L_502C                          ; 502E   022C 0003

        MVO     R0,     .STIC.VDLY              ; 5030   0240 0031
        CLRR    R0                              ; 5032   01C0
        MVO     R0,     .STIC.BORD              ; 5033   0240 002C
        MVO     R0,     .STIC.CS.0              ; 5035   0240 0028
        MVII    #$0102, R4                      ; 5037   02BC 0102
        MVO@    R0,     R4                      ; 5039   0260
        MVO@    R0,     R4                      ; 503A   0260
        MVO@    R0,     R4                      ; 503B   0260
        MVO@    R0,     R4                      ; 503C   0260
        MVO@    R0,     R4                      ; 503D   0260
        MVII    #$0200, R4                      ; 503E   02BC 0200
        MVII    #$00F0, R3                      ; 5040   02BB 00F0
L_5042:
        MVO@    R0,     R4                      ; 5042   0260
        DECR    R3                              ; 5043   0013
        BNEQ    L_5042                          ; 5044   022C 0003

        MVII    #$0014, R0                      ; 5046   02B8 0014
        MVO     R0,     G_0105                  ; 5048   0240 0105
        MVII    #$02C8, R1                      ; 504A   02B9 02C8
        SDBD                                    ; 504C   0001
        MVII    #$5E06, R4                      ; 504D   02BC 0006 005E

        JSR     R5,     .EXEC.730               ; 5050   0004 0114 0330

        SDBD                                    ; 5053   0001
        MVII    #$5E89, R4                      ; 5054   02BC 0089 005E
        SDBD                                    ; 5057   0001
        MVII    #$3800, R5                      ; 5058   02BD 0000 0038
        MVII    #$01F0, R3                      ; 505B   02BB 01F0
L_505D:
        MVI@    R4,     R0                      ; 505D   02A0
        MVO@    R0,     R5                      ; 505E   0268
        DECR    R3                              ; 505F   0013
        BNEQ    L_505D                          ; 5060   022C 0004

        SDBD                                    ; 5062   0001
        MVII    #$08BA, R0                      ; 5063   02B8 00BA 0008
        MVO     R0,     .BTAB.80                ; 5066   0240 0280
        SUBI    #$00B8, R0                      ; 5068   0338 00B8
        MVO     R0,     .BTAB.1A                ; 506A   0240 021A
        MVO     R0,     .BTAB.4B                ; 506C   0240 024B
        MVII    #$021C, R4                      ; 506E   02BC 021C
        SDBD                                    ; 5070   0001
        MVII    #$5E76, R5                      ; 5071   02BD 0076 005E
        MVII    #$000A, R3                      ; 5074   02BB 000A
L_5076:
        MVI@    R5,     R1                      ; 5076   02A9
L_5077:
        MVO@    R0,     R4                      ; 5077   0260
        ADDI    #$0008, R0                      ; 5078   02F8 0008
        DECR    R1                              ; 507A   0011
        BNEQ    L_5077                          ; 507B   022C 0005

        ADD@    R5,     R4                      ; 507D   02EC
        DECR    R3                              ; 507E   0013
        BNEQ    L_5076                          ; 507F   022C 000A

        SDBD                                    ; 5081   0001
        MVII    #$5D53, R0                      ; 5082   02B8 0053 005D
        MVO     R0,     .ISRVEC.0               ; 5085   0240 0100
        SWAP    R0,     1                       ; 5087   0040
        MVO     R0,     .ISRVEC.1               ; 5088   0240 0101
L_508A:
        EIS                                     ; 508A   0002
        MVII    #$01FE, R4                      ; 508B   02BC 01FE
        SDBD                                    ; 508D   0001
        MVI@    R4,     R0                      ; 508E   02A0
        INCR    R0                              ; 508F   0008
        BEQ     L_508A                          ; 5090   0224 0007
        J       L_52AA                          ; 5092   0004 0350 02AA

        INCR    R4                              ; 5095   000C
        SWAP    R0,     1                       ; 5096   0040
        CLRC                                    ; 5097   0006
        EIS                                     ; 5098   0002
        INCR    R4                              ; 5099   000C
        SWAP    R0,     1                       ; 509A   0040
        CLRC                                    ; 509B   0006
        EIS                                     ; 509C   0002
        INCR    R4                              ; 509D   000C
        SWAP    R0,     1                       ; 509E   0040
        CLRC                                    ; 509F   0006
        EIS                                     ; 50A0   0002
        DECR    R0                              ; 50A1   0010
        DECR    R0                              ; 50A2   0010
        INCR    R4                              ; 50A3   000C
        EIS                                     ; 50A4   0002
        RSWD    R4                              ; 50A5   003C
        COMR    R0                              ; 50A6   0018
        INCR    R4                              ; 50A7   000C
        DIS                                     ; 50A8   0003

        JSR     R4,     G_0405                  ; 50A9   0004 0004 0005
        DECLE   $0001                           ; 50AC   0001

        ADCR    R4                              ; 50AD   002C
        ADCR    R4                              ; 50AE   002C
        INCR    R2                              ; 50AF   000A

        JSR     R4,     .GROM.014               ; 50B0   0004 0030 0014

        DIS                                     ; 50B3   0003
        DECLE   $0000                           ; 50B4   0000

        GSWD    R0                              ; 50B5   0030
        ADCR    R0                              ; 50B6   0028
        DECLE   $0000,  $0001                   ; 50B7   0000 0001

        INCR    R0                              ; 50B9   0008
        INCR    R0                              ; 50BA   0008
        SETC                                    ; 50BB   0007
        DIS                                     ; 50BC   0003
        COMR    R4                              ; 50BD   001C
        COMR    R4                              ; 50BE   001C
        DECLE   $0001,  $0000                   ; 50BF   0001 0000

        NEGR    R4                              ; 50C1   0024
        NEGR    R4                              ; 50C2   0024
        INCR    R1                              ; 50C3   0009

        JSR     R4,     .GRAM.038               ; 50C4   0004 0038 0038

        DIS                                     ; 50C7   0003
        DECLE   $0001                           ; 50C8   0001

        RSWD    R4                              ; 50C9   003C
        COMR    R0                              ; 50CA   0018
        INCR    R4                              ; 50CB   000C
        DIS                                     ; 50CC   0003
        DECR    R4                              ; 50CD   0014
        DECR    R4                              ; 50CE   0014

        JSRE    R4,     G_0034                  ; 50CF   0004 0001 0034

        NOP                                     ; 50D2   0034
        INCR    R5                              ; 50D3   000D
        DIS                                     ; 50D4   0003
        NEGR    R0                              ; 50D5   0020
        NEGR    R0                              ; 50D6   0020
        DECLE   $0000                           ; 50D7   0000

        EIS                                     ; 50D8   0002
        ADDR    R6,     R0                      ; 50D9   00F0
        ADDR    R6,     R0                      ; 50DA   00F0
        ADDR    R6,     R0                      ; 50DB   00F0
        ADDR    R6,     R0                      ; 50DC   00F0
        ADDR    R6,     R0                      ; 50DD   00F0
        ADDR    R6,     R0                      ; 50DE   00F0
        ADDR    R6,     R0                      ; 50DF   00F0
        ADDR    R6,     R0                      ; 50E0   00F0
        ADDR    R6,     R0                      ; 50E1   00F0
        ADDR    R6,     R0                      ; 50E2   00F0
        ADDR    R6,     R0                      ; 50E3   00F0
        ADDR    R6,     R0                      ; 50E4   00F0
        ADDR    R7,     R0                      ; 50E5   00F8
        ADDR    R7,     R0                      ; 50E6   00F8
        ADDR    R7,     R0                      ; 50E7   00F8
        ADDR    R7,     R0                      ; 50E8   00F8
        ADDR    R6,     R0                      ; 50E9   00F0
        ADDR    R6,     R0                      ; 50EA   00F0
        ADDR    R6,     R0                      ; 50EB   00F0
        ADDR    R6,     R0                      ; 50EC   00F0
        ADDR    R4,     R0                      ; 50ED   00E0
        ADDR    R4,     R0                      ; 50EE   00E0
        ADDR    R4,     R0                      ; 50EF   00E0
        ADDR    R4,     R0                      ; 50F0   00E0
        ADDR    R7,     R0                      ; 50F1   00F8
        ADDR    R7,     R0                      ; 50F2   00F8
        ADDR    R7,     R0                      ; 50F3   00F8
        ADDR    R7,     R0                      ; 50F4   00F8
        ADDR    R6,     R0                      ; 50F5   00F0
        ADDR    R6,     R0                      ; 50F6   00F0
        ADDR    R6,     R0                      ; 50F7   00F0
        ADDR    R6,     R0                      ; 50F8   00F0
        ADDR    R7,     R7                      ; 50F9   00FF
        ADDR    R7,     R7                      ; 50FA   00FF
        ADDR    R7,     R6                      ; 50FB   00FE
        ADDR    R7,     R6                      ; 50FC   00FE
        ADDR    R7,     R6                      ; 50FD   00FE
        ADDR    R7,     R4                      ; 50FE   00FC
        ADDR    R7,     R4                      ; 50FF   00FC
        ADDR    R7,     R4                      ; 5100   00FC
        ADDR    R7,     R4                      ; 5101   00FC
        ADDR    R7,     R4                      ; 5102   00FC
        ADDR    R7,     R4                      ; 5103   00FC
        ADDR    R7,     R6                      ; 5104   00FE
        ADDR    R7,     R6                      ; 5105   00FE
        ADDR    R7,     R6                      ; 5106   00FE
        ADDR    R7,     R7                      ; 5107   00FF
        ADDR    R7,     R7                      ; 5108   00FF
        ADDR    R7,     R6                      ; 5109   00FE
        ADDR    R7,     R0                      ; 510A   00F8
        ADDR    R6,     R0                      ; 510B   00F0
        ADDR    R4,     R0                      ; 510C   00E0
        ADDR    R0,     R0                      ; 510D   00C0
        ADDR    R0,     R0                      ; 510E   00C0
        TSTR    R0                              ; 510F   0080
        TSTR    R0                              ; 5110   0080
        TSTR    R0                              ; 5111   0080
        TSTR    R0                              ; 5112   0080
        ADDR    R0,     R0                      ; 5113   00C0
        ADDR    R0,     R0                      ; 5114   00C0
        ADDR    R4,     R0                      ; 5115   00E0
        ADDR    R6,     R0                      ; 5116   00F0
        ADDR    R7,     R0                      ; 5117   00F8
        ADDR    R7,     R6                      ; 5118   00FE
        DECLE   $0000,  $0000                   ; 5119   0000 0000

        TSTR    R0                              ; 511B   0080
        TSTR    R0                              ; 511C   0080
        TSTR    R0                              ; 511D   0080
        ADDR    R0,     R0                      ; 511E   00C0
        ADDR    R0,     R0                      ; 511F   00C0
        ADDR    R0,     R0                      ; 5120   00C0
        ADDR    R0,     R0                      ; 5121   00C0
        ADDR    R0,     R0                      ; 5122   00C0
        ADDR    R0,     R0                      ; 5123   00C0
        TSTR    R0                              ; 5124   0080
        TSTR    R0                              ; 5125   0080
        TSTR    R0                              ; 5126   0080
        DECLE   $0000,  $0000                   ; 5127   0000 0000

        TSTR    R0                              ; 5129   0080
        ADDR    R4,     R0                      ; 512A   00E0
        ADDR    R6,     R0                      ; 512B   00F0
        ADDR    R7,     R0                      ; 512C   00F8
        ADDR    R7,     R4                      ; 512D   00FC
        ADDR    R7,     R4                      ; 512E   00FC
        ADDR    R7,     R6                      ; 512F   00FE
        ADDR    R7,     R6                      ; 5130   00FE
        ADDR    R7,     R6                      ; 5131   00FE
        ADDR    R7,     R6                      ; 5132   00FE
        ADDR    R7,     R4                      ; 5133   00FC
        ADDR    R7,     R4                      ; 5134   00FC
        ADDR    R7,     R0                      ; 5135   00F8
        ADDR    R6,     R0                      ; 5136   00F0
        ADDR    R4,     R0                      ; 5137   00E0
        TSTR    R0                              ; 5138   0080
        ADDR    R7,     R0                      ; 5139   00F8
        ADDR    R7,     R0                      ; 513A   00F8
        ADDR    R7,     R4                      ; 513B   00FC
        ADDR    R7,     R4                      ; 513C   00FC
        ADDR    R7,     R6                      ; 513D   00FE
        ADDR    R7,     R6                      ; 513E   00FE
        ADDR    R7,     R7                      ; 513F   00FF
        ADDR    R7,     R7                      ; 5140   00FF
        ADDR    R7,     R7                      ; 5141   00FF
        ADDR    R7,     R7                      ; 5142   00FF
        ADDR    R7,     R6                      ; 5143   00FE
        ADDR    R7,     R6                      ; 5144   00FE
        ADDR    R7,     R4                      ; 5145   00FC
        ADDR    R7,     R4                      ; 5146   00FC
        ADDR    R7,     R0                      ; 5147   00F8
        ADDR    R7,     R0                      ; 5148   00F8
        TSTR    R0                              ; 5149   0080
        TSTR    R0                              ; 514A   0080
        ADDR    R0,     R0                      ; 514B   00C0
        ADDR    R0,     R0                      ; 514C   00C0
        ADDR    R4,     R0                      ; 514D   00E0
        ADDR    R4,     R0                      ; 514E   00E0
        ADDR    R6,     R0                      ; 514F   00F0
        ADDR    R6,     R0                      ; 5150   00F0
        ADDR    R6,     R0                      ; 5151   00F0
        ADDR    R6,     R0                      ; 5152   00F0
        ADDR    R4,     R0                      ; 5153   00E0
        ADDR    R4,     R0                      ; 5154   00E0
        ADDR    R0,     R0                      ; 5155   00C0
        ADDR    R0,     R0                      ; 5156   00C0
        TSTR    R0                              ; 5157   0080
        TSTR    R0                              ; 5158   0080
        ADDR    R4,     R0                      ; 5159   00E0
        ADDR    R4,     R0                      ; 515A   00E0
        ADDR    R4,     R0                      ; 515B   00E0
        ADDR    R4,     R0                      ; 515C   00E0
        ADDR    R6,     R0                      ; 515D   00F0
        ADDR    R6,     R0                      ; 515E   00F0
        ADDR    R6,     R0                      ; 515F   00F0
        ADDR    R6,     R0                      ; 5160   00F0
        TSTR    R0                              ; 5161   0080
        ADDR    R0,     R6                      ; 5162   00C6
        ADDR    R7,     R7                      ; 5163   00FF
        SLL     R3,     2                       ; 5164   004F
        RSWD    R0                              ; 5165   0038
        GSWD    R0                              ; 5166   0030
        DECLE   $0000,  $0000,  $0000           ; 5167   0000 0000 0000

        DECR    R0                              ; 516A   0010
        DECR    R0                              ; 516B   0010
        DECR    R0                              ; 516C   0010
        GSWD    R0                              ; 516D   0030
        SARC    R0,     1                       ; 516E   0078
        SETC                                    ; 516F   0007
        EIS                                     ; 5170   0002
        ADDR    R7,     R4                      ; 5171   00FC
        SARC    R0,     2                       ; 5172   007C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5173   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5177   0000 0000

        ADDR    R7,     R7                      ; 5179   00FF
        ADDR    R7,     R7                      ; 517A   00FF
        ADDR    R4,     R0                      ; 517B   00E0
        TSTR    R0                              ; 517C   0080
        DECLE   $0000,  $0000                   ; 517D   0000 0000

        TSTR    R0                              ; 517F   0080
        SLR     R0,     1                       ; 5180   0060
        COMR    R7                              ; 5181   001F
        SLR     R0,     1                       ; 5182   0060
        SLL     R2,     1                       ; 5183   004A
        SAR     R2,     1                       ; 5184   006A
        SLL     R2,     1                       ; 5185   004A
        SLL     R2,     1                       ; 5186   004A
        MOVR    R1,     R6                      ; 5187   008E
        ADDR    R4,     R0                      ; 5188   00E0
        ADDR    R7,     R7                      ; 5189   00FF
        ADDR    R7,     R7                      ; 518A   00FF
        SETC                                    ; 518B   0007
        DECLE   $0001,  $0000,  $0000,  $0001   ; 518C   0001 0000 0000 0001

        CLRC                                    ; 5190   0006
        ADDR    R7,     R0                      ; 5191   00F8

        JSR     R4,     G_7444                  ; 5192   0004 0074 0044

        SLR     R2,     2                       ; 5195   0066
        SWAP    R0,     2                       ; 5196   0044
        RRC     R1,     1                       ; 5197   0071
        SETC                                    ; 5198   0007
        ADDR    R6,     R4                      ; 5199   00F4
        MOVR    R3,     R1                      ; 519A   0099
        ADDR    R0,     R6                      ; 519B   00C6
        MOVR    R7,     R0                      ; 519C   00B8
        SWAP    R0,     1                       ; 519D   0040
        GSWD    R1                              ; 519E   0031
        NEGR    R6                              ; 519F   0026
        ADDR    R7,     R4                      ; 51A0   00FC
        DECLE   $0000,  $0001                   ; 51A1   0000 0001

        EIS                                     ; 51A3   0002
        DECLE   $0005                           ; 51A4   0005

        INCR    R2                              ; 51A5   000A
        DECR    R4                              ; 51A6   0014
        ADDR    R5,     R0                      ; 51A7   00E8
        ADDR    R7,     R7                      ; 51A8   00FF
        ADDR    R7,     R7                      ; 51A9   00FF
        MOVR    R0,     R1                      ; 51AA   0081
        ADDR    R7,     R7                      ; 51AB   00FF
        MOVR    R0,     R1                      ; 51AC   0081
        SWAP    R2,     1                       ; 51AD   0042
        NEGR    R4                              ; 51AE   0024
        COMR    R0                              ; 51AF   0018
        ADDR    R7,     R7                      ; 51B0   00FF
        DECLE   $0000                           ; 51B1   0000

        TSTR    R0                              ; 51B2   0080
        SWAP    R0,     1                       ; 51B3   0040
        MOVR    R4,     R0                      ; 51B4   00A0
        RLC     R0,     1                       ; 51B5   0050
        ADCR    R0                              ; 51B6   0028
        DECR    R7                              ; 51B7   0017
        ADDR    R7,     R7                      ; 51B8   00FF
        DECR    R0                              ; 51B9   0010
        DECR    R0                              ; 51BA   0010
        DECR    R0                              ; 51BB   0010
        DECR    R0                              ; 51BC   0010
        RSWD    R0                              ; 51BD   0038
        RSWD    R0                              ; 51BE   0038
        SARC    R0,     2                       ; 51BF   007C
        SARC    R0,     2                       ; 51C0   007C
        ADDR    R7,     R6                      ; 51C1   00FE
        ADDR    R2,     R6                      ; 51C2   00D6
        TSTR    R2                              ; 51C3   0092
        DECR    R0                              ; 51C4   0010
        RSWD    R0                              ; 51C5   0038
        SARC    R0,     2                       ; 51C6   007C
        RLC     R0,     2                       ; 51C7   0054
        DECLE   $0000                           ; 51C8   0000

        DECR    R0                              ; 51C9   0010
        DECR    R0                              ; 51CA   0010
        DECR    R0                              ; 51CB   0010
        DECR    R0                              ; 51CC   0010
        GSWD    R0                              ; 51CD   0030
        RSWD    R0                              ; 51CE   0038
        SARC    R0,     1                       ; 51CF   0078
        SARC    R0,     2                       ; 51D0   007C
        SARC    R0,     2                       ; 51D1   007C
        SLLC    R0,     2                       ; 51D2   005C
        DECR    R4                              ; 51D3   0014
        DECR    R0                              ; 51D4   0010
        DECR    R0                              ; 51D5   0010
        GSWD    R0                              ; 51D6   0030
        RSWD    R0                              ; 51D7   0038
        INCR    R0                              ; 51D8   0008
        DECLE   $0000,  $0000,  $0000           ; 51D9   0000 0000 0000

        SARC    R0,     1                       ; 51DC   0078
        INCR    R0                              ; 51DD   0008
        MOVR    R3,     R6                      ; 51DE   009E
        TSTR    R0                              ; 51DF   0080
        TSTR    R0                              ; 51E0   0080
        MOVR    R3,     R6                      ; 51E1   009E

        JSRD    R4,     G_0C00                  ; 51E2   0004 000E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 51E5   0000 0000 0000 0000

        EIS                                     ; 51E9   0002
        CLRC                                    ; 51EA   0006
        SETC                                    ; 51EB   0007
        NEGR    R2                              ; 51EC   0022
        GSWD    R0                              ; 51ED   0030
        RRC     R0,     1                       ; 51EE   0070
        ADDR    R7,     R0                      ; 51EF   00F8
        NEGR    R0                              ; 51F0   0020

        JSR     R4,     G_0C0E                  ; 51F1   0004 000C 000E

        COMR    R7                              ; 51F4   001F
        SWAP    R0,     2                       ; 51F5   0044
        SLR     R0,     1                       ; 51F6   0060
        ADDR    R4,     R0                      ; 51F7   00E0
        SWAP    R0,     1                       ; 51F8   0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 51F9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 51FD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0005   ; 5201   0000 0000 0000 0005
        DECLE   $0000,  $0000                   ; 5205   0000 0000

        INCR    R1                              ; 5207   0009
        DECLE   $0001,  $0000                   ; 5208   0001 0000

        CLRC                                    ; 520A   0006
        DECLE   $0000                           ; 520B   0000

        CLRC                                    ; 520C   0006
        INCR    R2                              ; 520D   000A
        INCR    R2                              ; 520E   000A
        INCR    R0                              ; 520F   0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5210   0000 0000 0000 0000
        DECLE   $0005,  $0000,  $0000           ; 5214   0005 0000 0000

        INCR    R1                              ; 5217   0009
        DECLE   $0001,  $0000                   ; 5218   0001 0000

        EIS                                     ; 521A   0002
        DECLE   $0000                           ; 521B   0000

        JSR     R4,     G_0802                  ; 521C   0004 0008 0002

        INCR    R0                              ; 521F   0008
        DECLE   $0000                           ; 5220   0000

        INCR    R0                              ; 5221   0008
        INCR    R2                              ; 5222   000A
        INCR    R2                              ; 5223   000A
        INCR    R2                              ; 5224   000A
        INCR    R0                              ; 5225   0008
        INCR    R5                              ; 5226   000D
        INCR    R1                              ; 5227   0009
        INCR    R5                              ; 5228   000D
        INCR    R5                              ; 5229   000D
        INCR    R0                              ; 522A   0008
        INCR    R0                              ; 522B   0008
        INCR    R6                              ; 522C   000E
        INCR    R0                              ; 522D   0008
        INCR    R3                              ; 522E   000B
        INCR    R0                              ; 522F   0008
        INCR    R0                              ; 5230   0008
        INCR    R6                              ; 5231   000E
        INCR    R4                              ; 5232   000C
        INCR    R6                              ; 5233   000E
        INCR    R0                              ; 5234   0008
        INCR    R2                              ; 5235   000A
        INCR    R2                              ; 5236   000A
        INCR    R0                              ; 5237   0008
        INCR    R6                              ; 5238   000E
        INCR    R6                              ; 5239   000E
        INCR    R0                              ; 523A   0008
        INCR    R3                              ; 523B   000B
        INCR    R0                              ; 523C   0008
        INCR    R6                              ; 523D   000E
        INCR    R0                              ; 523E   0008
        INCR    R0                              ; 523F   0008
        INCR    R3                              ; 5240   000B
        INCR    R0                              ; 5241   0008
        INCR    R2                              ; 5242   000A
        INCR    R0                              ; 5243   0008
        INCR    R0                              ; 5244   0008
        INCR    R6                              ; 5245   000E
        INCR    R5                              ; 5246   000D
        INCR    R5                              ; 5247   000D
        INCR    R5                              ; 5248   000D
        INCR    R0                              ; 5249   0008
        INCR    R2                              ; 524A   000A
        INCR    R0                              ; 524B   0008
        INCR    R2                              ; 524C   000A
        INCR    R0                              ; 524D   0008
        INCR    R0                              ; 524E   0008
        INCR    R2                              ; 524F   000A
        INCR    R0                              ; 5250   0008
        INCR    R6                              ; 5251   000E
        INCR    R0                              ; 5252   0008
        INCR    R7                              ; 5253   000F
        INCR    R7                              ; 5254   000F
        INCR    R7                              ; 5255   000F
        INCR    R7                              ; 5256   000F
        INCR    R7                              ; 5257   000F
        DECR    R0                              ; 5258   0010
        DECR    R0                              ; 5259   0010
        RSWD    R0                              ; 525A   0038
        SARC    R0,     2                       ; 525B   007C
        ADDR    R7,     R6                      ; 525C   00FE
        DECR    R0                              ; 525D   0010
        RSWD    R4                              ; 525E   003C
        DECLE   $0000                           ; 525F   0000

        DECR    R0                              ; 5260   0010
        DECR    R0                              ; 5261   0010
        GSWD    R0                              ; 5262   0030
        SARC    R0,     1                       ; 5263   0078
        SARC    R0,     2                       ; 5264   007C
        DECR    R0                              ; 5265   0010
        GSWD    R0                              ; 5266   0030
        INCR    R0                              ; 5267   0008
        INCR    R0                              ; 5268   0008
        INCR    R0                              ; 5269   0008
        INCR    R4                              ; 526A   000C
        COMR    R6                              ; 526B   001E
        RSWD    R6                              ; 526C   003E
        INCR    R0                              ; 526D   0008
        INCR    R4                              ; 526E   000C
        DECR    R0                              ; 526F   0010
        DECLE   $0000,  $0000                   ; 5270   0000 0000

        RSWD    R1                              ; 5272   0039
        DECR    R7                              ; 5273   0017
        RSWD    R2                              ; 5274   003A
        DECR    R7                              ; 5275   0017
        RSWD    R2                              ; 5276   003A
        SETC                                    ; 5277   0007
        ADDR    R5,     R2                      ; 5278   00EA
        CLRC                                    ; 5279   0006
        ADDR    R5,     R2                      ; 527A   00EA
        DECR    R6                              ; 527B   0016
        ADDR    R5,     R2                      ; 527C   00EA
        DECR    R6                              ; 527D   0016
        ADDR    R5,     R6                      ; 527E   00EE
        CLRC                                    ; 527F   0006
        ADDR    R4,     R6                      ; 5280   00E6
        CLRC                                    ; 5281   0006
        ADDR    R4,     R6                      ; 5282   00E6
        CLRC                                    ; 5283   0006
        ADDR    R4,     R2                      ; 5284   00E2
        DECR    R6                              ; 5285   0016
        ADDR    R4,     R2                      ; 5286   00E2
        DECR    R6                              ; 5287   0016
        ADDR    R2,     R2                      ; 5288   00D2
        DECR    R7                              ; 5289   0017
        ADDR    R2,     R2                      ; 528A   00D2
        DECR    R7                              ; 528B   0017
        ADDR    R2,     R2                      ; 528C   00D2
        SETC                                    ; 528D   0007
        ADDR    R2,     R2                      ; 528E   00D2
        SETC                                    ; 528F   0007
        DECLE   $0000,  $0000                   ; 5290   0000 0000

        ADDR    R5,     R4                      ; 5292   00EC
        CLRC                                    ; 5293   0006
        ADDR    R5,     R4                      ; 5294   00EC
        CLRC                                    ; 5295   0006
        ADDR    R5,     R2                      ; 5296   00EA
        CLRC                                    ; 5297   0006
        ADDR    R5,     R2                      ; 5298   00EA
        CLRC                                    ; 5299   0006
        ADDR    R4,     R2                      ; 529A   00E2
        CLRC                                    ; 529B   0006
        ADDR    R4,     R2                      ; 529C   00E2
        CLRC                                    ; 529D   0006
        ADDR    R4,     R2                      ; 529E   00E2
        CLRC                                    ; 529F   0006
        ADDR    R4,     R3                      ; 52A0   00E3
        CLRC                                    ; 52A1   0006
        ADDR    R2,     R6                      ; 52A2   00D6
        SETC                                    ; 52A3   0007
        ADDR    R2,     R2                      ; 52A4   00D2
        SETC                                    ; 52A5   0007
        ADDR    R2,     R2                      ; 52A6   00D2
        SETC                                    ; 52A7   0007
        ADDR    R2,     R0                      ; 52A8   00D0
        SETC                                    ; 52A9   0007
L_52AA:
        DIS                                     ; 52AA   0003
        MVII    #$0072, R0                      ; 52AB   02B8 0072
        MVII    #$0057, R1                      ; 52AD   02B9 0057
        MVO     R0,     .ISRVEC.0               ; 52AF   0240 0100
        MVO     R1,     .ISRVEC.1               ; 52B1   0241 0101
        CLRR    R0                              ; 52B3   01C0
        MVII    #$02F0, R4                      ; 52B4   02BC 02F0
        MVII    #$006F, R3                      ; 52B6   02BB 006F
L_52B8:
        MVO@    R0,     R4                      ; 52B8   0260
        DECR    R3                              ; 52B9   0013
        BNEQ    L_52B8                          ; 52BA   022C 0003

        MVII    #$02F8, R0                      ; 52BC   02B8 02F8
        MVII    #$0314, R4                      ; 52BE   02BC 0314
        MVII    #$0022, R3                      ; 52C0   02BB 0022
L_52C2:
        MVO@    R0,     R4                      ; 52C2   0260
        DECR    R3                              ; 52C3   0013
        BNEQ    L_52C2                          ; 52C4   022C 0003

        MVII    #$02F0, R6                      ; 52C6   02BE 02F0
        MVII    #$003F, R0                      ; 52C8   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; 52CA   0240 01F8
        MVII    #$0030, R0                      ; 52CC   02B8 0030
        MVO     R0,     .PSG0.chn_a_vol         ; 52CE   0240 01FB
        MVO     R0,     .PSG0.chn_b_vol         ; 52D0   0240 01FC
        MVO     R0,     .PSG0.chn_c_vol         ; 52D2   0240 01FD
        CLRR    R0                              ; 52D4   01C0
        MVII    #$0102, R4                      ; 52D5   02BC 0102
L_52D7:
        MVO@    R0,     R4                      ; 52D7   0260
        CMPI    #$01F0, R4                      ; 52D8   037C 01F0
        BNEQ    L_52D7                          ; 52DA   022C 0004

        MVII    #$0004, R0                      ; 52DC   02B8 0004
        MVO     R0,     G_0103                  ; 52DE   0240 0103
        MVII    #$0003, R0                      ; 52E0   02B8 0003
        MVO     R0,     G_01BA                  ; 52E2   0240 01BA
        MVII    #$0009, R0                      ; 52E4   02B8 0009
        MVO     R0,     G_01BB                  ; 52E6   0240 01BB
        MVII    #$0005, R0                      ; 52E8   02B8 0005
        MVO     R0,     G_01BE                  ; 52EA   0240 01BE
        INCR    R0                              ; 52EC   0008
        MVO     R0,     G_01BF                  ; 52ED   0240 01BF
        MVII    #$0001, R0                      ; 52EF   02B8 0001
        MVO     R0,     G_012A                  ; 52F1   0240 012A
        MVII    #$0145, R4                      ; 52F3   02BC 0145
        MVII    #$00FF, R0                      ; 52F5   02B8 00FF
        MVO     R0,     G_0126                  ; 52F7   0240 0126
        MVO     R0,     G_012B                  ; 52F9   0240 012B
        MVII    #$0047, R3                      ; 52FB   02BB 0047
L_52FD:
        MVO@    R0,     R4                      ; 52FD   0260
        DECR    R3                              ; 52FE   0013
        BNEQ    L_52FD                          ; 52FF   022C 0003

        MVII    #$00DF, R0                      ; 5301   02B8 00DF
        MVO     R0,     G_014C                  ; 5303   0240 014C
        MVII    #$00DE, R0                      ; 5305   02B8 00DE
        MVO     R0,     G_014E                  ; 5307   0240 014E
        MVII    #$00F7, R0                      ; 5309   02B8 00F7
        MVO     R0,     G_015C                  ; 530B   0240 015C
        MVO     R0,     G_015E                  ; 530D   0240 015E
        MVII    #$00FD, R0                      ; 530F   02B8 00FD
        MVO     R0,     G_016C                  ; 5311   0240 016C
        MVII    #$00BD, R0                      ; 5313   02B8 00BD
        MVO     R0,     G_016E                  ; 5315   0240 016E

        JSR     R4,     L_5322                  ; 5317   0004 0050 0322

        ADDR    R6,     R7                      ; 531A   00F7
        ADDR    R6,     R7                      ; 531B   00F7
        ADDR    R4,     R3                      ; 531C   00E3
        ADDR    R0,     R1                      ; 531D   00C1
        MOVR    R2,     R4                      ; 531E   0094
        TSTR    R6                              ; 531F   00B6
        ADDR    R4,     R3                      ; 5320   00E3
        ADDR    R2,     R5                      ; 5321   00D5
L_5322:
        MVII    #$017C, R5                      ; 5322   02BD 017C
        MVII    #$0008, R1                      ; 5324   02B9 0008
L_5326:
        MVI@    R4,     R0                      ; 5326   02A0
        MVO@    R0,     R5                      ; 5327   0268
        DECR    R1                              ; 5328   0011
        BNEQ    L_5326                          ; 5329   022C 0004

        MVII    #$0005, R0                      ; 532B   02B8 0005
        MVII    #$0170, R1                      ; 532D   02B9 0170

        JSR     R4,     L_5337                  ; 532F   0004 0050 0337

        ADDR    R7,     R0                      ; 5332   00F8
        ADDR    R7,     R2                      ; 5333   00FA
        ADDR    R7,     R2                      ; 5334   00FA
        ADDR    R7,     R2                      ; 5335   00FA
        ADDR    R7,     R0                      ; 5336   00F8

L_5337:
        JSR     R5,     .EXEC.730               ; 5337   0004 0114 0330

        DIS                                     ; 533A   0003
        MVI     G_0103, R0                      ; 533B   0280 0103
        TSTR    R0                              ; 533D   0080
        BNEQ    L_534A                          ; 533E   020C 000A

        MOVR    R7,     R0                      ; 5340   00B8
        SUBI    #$031A, R0                      ; 5341   0338 031A
        MVO     R0,     .ISRVEC.0               ; 5343   0240 0100
        SWAP    R0,     1                       ; 5345   0040
        MVO     R0,     .ISRVEC.1               ; 5346   0240 0101
        EIS                                     ; 5348   0002
        DECR    R7                              ; 5349   0017
L_534A:
        MVII    #$001E, R0                      ; 534A   02B8 001E
        MVII    #$018C, R4                      ; 534C   02BC 018C

        JSR     R5,     X_FILL_ZERO             ; 534E   0004 0114 0338

        MVO     R5,     G_0108                  ; 5351   0245 0108
        MVII    #$001A, R0                      ; 5353   02B8 001A
        MVII    #$0339, R4                      ; 5355   02BC 0339

        JSR     R5,     X_FILL_ZERO             ; 5357   0004 0114 0338

        MVII    #$0200, R4                      ; 535A   02BC 0200
L_535C:
        SDBD                                    ; 535C   0001
        MVII    #$18F3, R0                      ; 535D   02B8 00F3 0018
        MVII    #$0010, R1                      ; 5360   02B9 0010
L_5362:
        MVO@    R0,     R4                      ; 5362   0260
        DECR    R1                              ; 5363   0011
        BNEQ    L_5362                          ; 5364   022C 0003

        SUBI    #$0003, R0                      ; 5366   0338 0003
        MVO@    R0,     R4                      ; 5368   0260
        MVO@    R0,     R4                      ; 5369   0260
        MVO@    R0,     R4                      ; 536A   0260
        MVO@    R0,     R4                      ; 536B   0260
        CMPI    #$02F0, R4                      ; 536C   037C 02F0
        BNEQ    L_535C                          ; 536E   022C 0013

        SDBD                                    ; 5370   0001
        MVII    #$19C0, R0                      ; 5371   02B8 00C0 0019
        MVO     R0,     .BTAB.B0                ; 5374   0240 02B0
        ADDI    #$0008, R0                      ; 5376   02F8 0008
        MVO     R0,     .BTAB.C4                ; 5378   0240 02C4
        ADDI    #$0008, R0                      ; 537A   02F8 0008
        MVO     R0,     .BTAB.B1                ; 537C   0240 02B1
        ADDI    #$0008, R0                      ; 537E   02F8 0008
        MVO     R0,     .BTAB.C5                ; 5380   0240 02C5
        ADDI    #$0008, R0                      ; 5382   02F8 0008
        MVO     R0,     .BTAB.B2                ; 5384   0240 02B2
        ADDI    #$0008, R0                      ; 5386   02F8 0008
        MVO     R0,     .BTAB.C6                ; 5388   0240 02C6

        JSR     R5,     L_5AA5                  ; 538A   0004 0158 02A5

        MVII    #$0001, R0                      ; 538D   02B8 0001
        MVO     R0,     G_0117                  ; 538F   0240 0117
        MVII    #$0080, R0                      ; 5391   02B8 0080
        MVO     R0,     G_0313                  ; 5393   0240 0313
        MVII    #$0020, R0                      ; 5395   02B8 0020
        MVO     R0,     G_0102                  ; 5397   0240 0102
        MVII    #$0015, R0                      ; 5399   02B8 0015
        SWAP    R0,     1                       ; 539B   0040
        DECR    R0                              ; 539C   0010
        MVO     R0,     G_0308                  ; 539D   0240 0308
        MVII    #$0008, R0                      ; 539F   02B8 0008
        MVII    #$01BA, R4                      ; 53A1   02BC 01BA
        MVII    #$01AA, R1                      ; 53A3   02B9 01AA

        JSR     R5,     .EXEC.730               ; 53A5   0004 0114 0330

        MVI     G_0338, R0                      ; 53A8   0280 0338
        MVO     R0,     G_0336                  ; 53AA   0240 0336
        MOVR    R7,     R0                      ; 53AC   00B8
        ADDI    #$0004, R0                      ; 53AD   02F8 0004
        MVO     R0,     G_0335                  ; 53AF   0240 0335
        MVI     G_01A8, R0                      ; 53B1   0280 01A8
        INCR    R0                              ; 53B3   0008
        CMPI    #$0060, R0                      ; 53B4   0378 0060
        BMI     L_540C                          ; 53B6   020B 0054

        MVI     G_0310, R0                      ; 53B8   0280 0310
        SWAP    R0,     1                       ; 53BA   0040
        ANDI    #$00FF, R0                      ; 53BB   03B8 00FF
        XORI    #$0200, R0                      ; 53BD   03F8 0200
        MVO     R0,     G_0339                  ; 53BF   0240 0339
        MVII    #$00D8, R0                      ; 53C1   02B8 00D8
        MVO     R0,     G_0341                  ; 53C3   0240 0341
        SDBD                                    ; 53C5   0001
        MVII    #$08B3, R0                      ; 53C6   02B8 00B3 0008
        MVO     R0,     G_0349                  ; 53C9   0240 0349
        MVI     G_0103, R3                      ; 53CB   0283 0103
        DECR    R3                              ; 53CD   0013
        MVO     R3,     G_0103                  ; 53CE   0243 0103

        JSR     R5,     L_5AA5                  ; 53D0   0004 0158 02A5

        MVII    #$0005, R0                      ; 53D3   02B8 0005
        MVII    #$0157, R1                      ; 53D5   02B9 0157

        JSR     R4,     L_53DF                  ; 53D7   0004 0050 03DF

        ADDR    R0,     R3                      ; 53DA   00C3
        MOVR    R7,     R5                      ; 53DB   00BD
        SWAP    R2,     1                       ; 53DC   0042
        MOVR    R7,     R5                      ; 53DD   00BD
        SARC    R2,     2                       ; 53DE   007E

L_53DF:
        JSR     R5,     .EXEC.730               ; 53DF   0004 0114 0330

        MVII    #$0167, R3                      ; 53E2   02BB 0167
        MVII    #$0127, R4                      ; 53E4   02BC 0127

        JSR     R5,     L_5D1F                  ; 53E6   0004 015C 011F

        MOVR    R7,     R0                      ; 53E9   00B8
        ADDI    #$0004, R0                      ; 53EA   02F8 0004
        MVO     R0,     G_0335                  ; 53EC   0240 0335
L_53EE:
        EIS                                     ; 53EE   0002
        MVI     .PSG0.lft_hand,R0               ; 53EF   0280 01FF
        CMPI    #$00FF, R0                      ; 53F1   0378 00FF
        BEQ     L_53EE                          ; 53F3   0224 0006

        MVII    #$00FF, R0                      ; 53F5   02B8 00FF
        MVII    #$0157, R4                      ; 53F7   02BC 0157
        MVII    #$0003, R3                      ; 53F9   02BB 0003
L_53FB:
        MVO@    R0,     R4                      ; 53FB   0260
        MVO@    R0,     R4                      ; 53FC   0260
        MVO@    R0,     R4                      ; 53FD   0260
        NOP                                     ; 53FE   0034
        MVO@    R0,     R4                      ; 53FF   0260
        MVO@    R0,     R4                      ; 5400   0260
        ADDI    #$000B, R4                      ; 5401   02FC 000B
        DECR    R3                              ; 5403   0013
        BNEQ    L_53FB                          ; 5404   022C 000A

        MOVR    R7,     R0                      ; 5406   00B8
        ADDI    #$0019, R0                      ; 5407   02F8 0019
        MVO     R0,     G_0335                  ; 5409   0240 0335
        MOVR    R0,     R7                      ; 540B   0087
L_540C:
        MVO     R0,     G_01A8                  ; 540C   0240 01A8
        ANDI    #$0007, R0                      ; 540E   03B8 0007
        MVO     R0,     G_01A9                  ; 5410   0240 01A9

        JSR     R5,     L_6079                  ; 5412   0004 0160 0079
        JSR     R5,     L_60B4                  ; 5415   0004 0160 00B4
        JSR     R5,     L_60F9                  ; 5418   0004 0160 00F9
        JSR     R5,     L_6119                  ; 541B   0004 0160 0119

        EIS                                     ; 541E   0002
        DECR    R7                              ; 541F   0017
        MVI     G_0308, R0                      ; 5420   0280 0308
        SUBI    #$0002, R0                      ; 5422   0338 0002
        BPL     L_5429                          ; 5424   0203 0003
        J       L_5C0E                          ; 5426   0004 035C 000E

L_5429:
        MVO     R0,     G_0308                  ; 5429   0240 0308
        MVI     G_0108, R0                      ; 542B   0280 0108
        TSTR    R0                              ; 542D   0080
        BEQ     L_56BE                          ; 542E   0204 028E

        MVI     .PSG0.chan_enable,R0            ; 5430   0280 01F8
        TSTR    R0                              ; 5432   0080
        BEQ     L_5451                          ; 5433   0204 001C

        MVI     .PSG0.chn_a_hi,R0               ; 5435   0280 01F4
        SWAP    R0,     1                       ; 5437   0040
        ADD     .PSG0.chn_a_lo,R0               ; 5438   02C0 01F0
        ADDI    #$0028, R0                      ; 543A   02F8 0028
        MVO     R0,     .PSG0.chn_a_lo          ; 543C   0240 01F0
        SWAP    R0,     1                       ; 543E   0040
        MVO     R0,     .PSG0.chn_a_hi          ; 543F   0240 01F4
        SWAP    R0,     1                       ; 5441   0040
        ADDI    #$0004, R0                      ; 5442   02F8 0004
        MVO     R0,     .PSG0.chn_b_lo          ; 5444   0240 01F1
        SWAP    R0,     1                       ; 5446   0040
        MVO     R0,     .PSG0.chn_b_hi          ; 5447   0240 01F5
        SWAP    R0,     1                       ; 5449   0040
        ADDI    #$0004, R0                      ; 544A   02F8 0004
        MVO     R0,     .PSG0.chn_c_lo          ; 544C   0240 01F2
        SWAP    R0,     1                       ; 544E   0040
        MVO     R0,     .PSG0.chn_c_hi          ; 544F   0240 01F6

L_5451:
        JSR     R4,     L_5C71                  ; 5451   0004 005C 0071

        MVII    #$034B, R4                      ; 5454   02BC 034B
        MVII    #$0004, R3                      ; 5456   02BB 0004
L_5458:
        MVI@    R4,     R0                      ; 5458   02A0
        SDBD                                    ; 5459   0001
        CMPI    #$08A0, R0                      ; 545A   0378 00A0 0008
        BEQ     L_5464                          ; 545D   0204 0005

        DECR    R3                              ; 545F   0013
        BNEQ    L_5458                          ; 5460   022C 0009
        B       L_550C                          ; 5462   0200 00A8

L_5464:
        PSHR    R4                              ; 5464   0274
        MVI     G_0342, R0                      ; 5465   0280 0342
        ANDI    #$007F, R0                      ; 5467   03B8 007F
        SUBI    #$0009, R4                      ; 5469   033C 0009
        MVI@    R4,     R1                      ; 546B   02A1
        ANDI    #$007F, R1                      ; 546C   03B9 007F
        SUBR    R1,     R0                      ; 546E   0108
        ADDI    #$0003, R0                      ; 546F   02F8 0003
        BMI     L_54D8                          ; 5471   020B 0065

        CMPI    #$000B, R0                      ; 5473   0378 000B
        BPL     L_54D8                          ; 5475   0203 0061

        MVI     G_033A, R0                      ; 5477   0280 033A
        ANDI    #$00FF, R0                      ; 5479   03B8 00FF
        ADDI    #$0003, R0                      ; 547B   02F8 0003
        SUBI    #$0009, R4                      ; 547D   033C 0009
        MVI@    R4,     R1                      ; 547F   02A1
        ANDI    #$00FF, R1                      ; 5480   03B9 00FF
        CMPR    R1,     R0                      ; 5482   0148
        BMI     L_54D8                          ; 5483   020B 0053

        MVI     G_033F, R2                      ; 5485   0282 033F
        ANDI    #$00FF, R2                      ; 5487   03BA 00FF
        ADDI    #$0008, R2                      ; 5489   02FA 0008
        CMPR    R2,     R0                      ; 548B   0150
        BPL     L_54D8                          ; 548C   0203 004A

        ADDI    #$000F, R4                      ; 548E   02FC 000F
        SDBD                                    ; 5490   0001
        MVII    #$88A0, R0                      ; 5491   02B8 00A0 0088
        MVO@    R0,     R4                      ; 5494   0260
        SUBR    R1,     R2                      ; 5495   010A
        SLR     R2,     2                       ; 5496   0066
        SLR     R2,     1                       ; 5497   0062
        SUBI    #$0002, R2                      ; 5498   033A 0002
        MVO     R2,     G_010D                  ; 549A   0242 010D
        MVI     G_0347, R3                      ; 549C   0283 0347
        ANDI    #$007F, R3                      ; 549E   03BB 007F
        SLR     R3,     2                       ; 54A0   0067
        SLR     R3,     1                       ; 54A1   0063
        DECR    R3                              ; 54A2   0013
        SLL     R3,     2                       ; 54A3   004F
        MOVR    R3,     R0                      ; 54A4   0098
        SLL     R3,     2                       ; 54A5   004F
        ADDR    R0,     R3                      ; 54A6   00C3
        SLR     R1,     2                       ; 54A7   0065
        SLR     R1,     1                       ; 54A8   0061
        ADDR    R1,     R3                      ; 54A9   00CB
        MVO     R3,     G_010C                  ; 54AA   0243 010C
        MVII    #$000D, R0                      ; 54AC   02B8 000D
        MVO     R0,     G_010E                  ; 54AE   0240 010E
        CLRR    R0                              ; 54B0   01C0
        MVO     R0,     G_012C                  ; 54B1   0240 012C
        MVO     R0,     G_0342                  ; 54B3   0240 0342

        JSR     R4,     L_5CBC                  ; 54B5   0004 005C 00BC

        MVII    #$0032, R0                      ; 54B8   02B8 0032

        JSR     R4,     L_5CE8                  ; 54BA   0004 005C 00E8

        MVII    #$012A, R1                      ; 54BD   02B9 012A
        MOVR    R7,     R2                      ; 54BF   00BA
        MVI@    R1,     R0                      ; 54C0   0288
        INCR    R0                              ; 54C1   0008
        CMPI    #$000A, R0                      ; 54C2   0378 000A
        BMI     L_54CA                          ; 54C4   020B 0004

        CLRR    R0                              ; 54C6   01C0
        MVO@    R0,     R1                      ; 54C7   0248
        INCR    R1                              ; 54C8   0009
        MOVR    R2,     R7                      ; 54C9   0097
L_54CA:
        MVO@    R0,     R1                      ; 54CA   0248
        MVII    #$0008, R0                      ; 54CB   02B8 0008
        MVII    #$01BA, R1                      ; 54CD   02B9 01BA
        MVII    #$01B2, R4                      ; 54CF   02BC 01B2

        JSR     R5,     .EXEC.730               ; 54D1   0004 0114 0330

        MVI     G_0337, R0                      ; 54D4   0280 0337
        MVO     R0,     G_0338                  ; 54D6   0240 0338
L_54D8:
        PULR    R4                              ; 54D8   02B4
        MVI     G_0341, R0                      ; 54D9   0280 0341
        ANDI    #$007F, R0                      ; 54DB   03B8 007F
        SUBI    #$0009, R4                      ; 54DD   033C 0009
        MVI@    R4,     R1                      ; 54DF   02A1
        ANDI    #$007F, R1                      ; 54E0   03B9 007F
        SUBR    R1,     R0                      ; 54E2   0108
        ADDI    #$0007, R0                      ; 54E3   02F8 0007
        BMI     L_550C                          ; 54E5   020B 0025

        CMPI    #$000C, R0                      ; 54E7   0378 000C
        BPL     L_550C                          ; 54E9   0203 0021

        MVI     G_0339, R0                      ; 54EB   0280 0339
        ANDI    #$00FF, R0                      ; 54ED   03B8 00FF
        ADDI    #$0006, R0                      ; 54EF   02F8 0006
        SUBI    #$0009, R4                      ; 54F1   033C 0009
        MVI@    R4,     R1                      ; 54F3   02A1
        ANDI    #$00FF, R1                      ; 54F4   03B9 00FF
        CMPR    R1,     R0                      ; 54F6   0148
        BMI     L_550C                          ; 54F7   020B 0013

        SUBI    #$000D, R0                      ; 54F9   0338 000D
        MVI     G_033F, R1                      ; 54FB   0281 033F
        ANDI    #$00FF, R1                      ; 54FD   03B9 00FF
        CMPR    R1,     R0                      ; 54FF   0148
        BPL     L_550C                          ; 5500   0203 000A

        ADDI    #$000F, R4                      ; 5502   02FC 000F
        SDBD                                    ; 5504   0001
        MVII    #$88A0, R0                      ; 5505   02B8 00A0 0088
        MVO@    R0,     R4                      ; 5508   0260
        J       L_5C0E                          ; 5509   0004 035C 000E

L_550C:
        MVI     G_010E, R4                      ; 550C   0284 010E
        DECR    R4                              ; 550E   0014
        BMI     L_5545                          ; 550F   020B 0034

        MVO     R4,     G_010E                  ; 5511   0244 010E
        MVI     G_010C, R1                      ; 5513   0281 010C
        CMPI    #$00F0, R1                      ; 5515   0379 00F0
        BPL     L_5545                          ; 5517   0203 002C

        CMPI    #$0001, R4                      ; 5519   037C 0001
        BNEQ    L_5535                          ; 551B   020C 0018

        MVII    #$034B, R5                      ; 551D   02BD 034B
        MVII    #$0004, R3                      ; 551F   02BB 0004
L_5521:
        MVI@    R5,     R0                      ; 5521   02A8
        SDBD                                    ; 5522   0001
        CMPI    #$88A0, R0                      ; 5523   0378 00A0 0088
        BNEQ    L_5532                          ; 5526   020C 000A

        SDBD                                    ; 5528   0001
        MVII    #$0890, R0                      ; 5529   02B8 0090 0008
        DECR    R5                              ; 552C   0015
        MVO@    R0,     R5                      ; 552D   0268
        MVO     R0,     G_034F                  ; 552E   0240 034F
        B       L_5535                          ; 5530   0200 0003

L_5532:
        DECR    R3                              ; 5532   0013
        BNEQ    L_5521                          ; 5533   022C 0013

L_5535:
        MOVR    R1,     R5                      ; 5535   008D
        ADDI    #$0200, R5                      ; 5536   02FD 0200
        ADDR    R4,     R4                      ; 5538   00E4
        SDBD                                    ; 5539   0001
        ADDI    #$5290, R4                      ; 553A   02FC 0090 0052
        SDBD                                    ; 553D   0001
        MVI@    R4,     R0                      ; 553E   02A0
        MVI     G_010D, R3                      ; 553F   0283 010D
L_5541:
        MVO@    R0,     R5                      ; 5541   0268
        DECR    R3                              ; 5542   0013
        BNEQ    L_5541                          ; 5543   022C 0003

L_5545:
        MVI     G_0352, R0                      ; 5545   0280 0352
        SLR     R0,     2                       ; 5547   0064
        MVII    #$033B, R1                      ; 5548   02B9 033B
        MVII    #$0004, R3                      ; 554A   02BB 0004
L_554C:
        SARC    R0,     1                       ; 554C   0078
        BNC     L_55E2                          ; 554D   0209 0093

L_554F:
        MVII    #$0014, R0                      ; 554F   02B8 0014
        PSHR    R4                              ; 5551   0274

        JSR     R4,     L_5C99                  ; 5552   0004 005C 0099

        PULR    R4                              ; 5555   02B4
        MVI@    R1,     R0                      ; 5556   0288
        SDBD                                    ; 5557   0001
        ANDI    #$06FF, R0                      ; 5558   03B8 00FF 0006
        MVO@    R0,     R1                      ; 555B   0248
        ADDI    #$0008, R1                      ; 555C   02F9 0008
        MVI@    R1,     R0                      ; 555E   0288
        SDBD                                    ; 555F   0001
        ANDI    #$0F7F, R0                      ; 5560   03B8 007F 000F
        MVO@    R0,     R1                      ; 5563   0248
        ANDI    #$007F, R0                      ; 5564   03B8 007F
        SLR     R0,     2                       ; 5566   0064
        SLR     R0,     1                       ; 5567   0060
        DECR    R0                              ; 5568   0010
        SLL     R0,     2                       ; 5569   004C
        MOVR    R0,     R2                      ; 556A   0082
        SLL     R0,     2                       ; 556B   004C
        ADDR    R0,     R2                      ; 556C   00C2
        ADDI    #$0200, R2                      ; 556D   02FA 0200
        MVII    #$0010, R0                      ; 556F   02B8 0010
        CLRR    R3                              ; 5571   01DB
        ADDI    #$0008, R1                      ; 5572   02F9 0008
        MVI@    R1,     R5                      ; 5574   028D
        SDBD                                    ; 5575   0001
        CMPI    #$0871, R5                      ; 5576   037D 0071 0008
        BNEQ    L_55A2                          ; 5579   020C 0027

        SUBI    #$0008, R1                      ; 557B   0339 0008
        MVI@    R1,     R5                      ; 557D   028D
        MVO     R5,     G_0347                  ; 557E   0245 0347
        MVI     G_033F, R5                      ; 5580   0285 033F
        ANDI    #$02FF, R5                      ; 5582   03BD 02FF
        MVO     R5,     G_033F                  ; 5584   0245 033F
        SUBI    #$0233, R1                      ; 5586   0339 0233
        MVO@    R0,     R1                      ; 5588   0248
        MVO     R0,     G_0114                  ; 5589   0240 0114
        MVO     R3,     G_012C                  ; 558B   0243 012C
        MVO     R3,     G_0342                  ; 558D   0243 0342
L_558F:
        MVI@    R2,     R4                      ; 558F   0294
        SDBD                                    ; 5590   0001
        CMPI    #$16B6, R4                      ; 5591   037C 00B6 0016
        BNEQ    L_5597                          ; 5594   020C 0001

        MVO@    R3,     R2                      ; 5596   0253
L_5597:
        INCR    R2                              ; 5597   000A
        DECR    R0                              ; 5598   0010
        BNEQ    L_558F                          ; 5599   022C 000B

        MVII    #$0008, R0                      ; 559B   02B8 0008

        JSR     R4,     L_5CE8                  ; 559D   0004 005C 00E8

        B       L_55D3                          ; 55A0   0200 0031

L_55A2:
        MVI@    R2,     R4                      ; 55A2   0294
        ANDI    #$0007, R4                      ; 55A3   03BC 0007
        CMPI    #$0002, R4                      ; 55A5   037C 0002
        BNEQ    L_55AA                          ; 55A7   020C 0001

        MVO@    R3,     R2                      ; 55A9   0253
L_55AA:
        INCR    R2                              ; 55AA   000A
        DECR    R0                              ; 55AB   0010
        BNEQ    L_55A2                          ; 55AC   022C 000B

        MVI@    R1,     R4                      ; 55AE   028C
        MVII    #$000A, R0                      ; 55AF   02B8 000A
        SDBD                                    ; 55B1   0001
        CMPI    #$0800, R4                      ; 55B2   037C 0000 0008
        BEQ     L_55C7                          ; 55B5   0204 0010

        MVII    #$0006, R0                      ; 55B7   02B8 0006
        SDBD                                    ; 55B9   0001
        CMPI    #$08D6, R4                      ; 55BA   037C 00D6 0008
        BEQ     L_55C7                          ; 55BD   0204 0008

        SDBD                                    ; 55BF   0001
        CMPI    #$1861, R4                      ; 55C0   037C 0061 0018
        BNEQ    L_55D3                          ; 55C3   020C 000E

        MVII    #$0003, R0                      ; 55C5   02B8 0003

L_55C7:
        JSR     R4,     L_5CE8                  ; 55C7   0004 005C 00E8

        SUBI    #$023B, R1                      ; 55CA   0339 023B
        MVII    #$0010, R0                      ; 55CC   02B8 0010
        MVO@    R0,     R1                      ; 55CE   0248
        MVO     R3,     G_012C                  ; 55CF   0243 012C
        MVO     R3,     G_0342                  ; 55D1   0243 0342
L_55D3:
        CMPI    #$0210, R2                      ; 55D3   037A 0210
        BNEQ    L_55FB                          ; 55D5   020C 0024

        MVII    #$0010, R0                      ; 55D7   02B8 0010
        MVII    #$0200, R4                      ; 55D9   02BC 0200
        MVII    #$0314, R1                      ; 55DB   02B9 0314

        JSR     R5,     .EXEC.730               ; 55DD   0004 0114 0330

        B       L_55FB                          ; 55E0   0200 0019

L_55E2:
        INCR    R1                              ; 55E2   0009
        DECR    R3                              ; 55E3   0013
        BNEQ    L_554C                          ; 55E4   022C 0099

        SARC    R0,     1                       ; 55E6   0078
        BNC     L_55FB                          ; 55E7   0209 0012

        MVII    #$034B, R1                      ; 55E9   02B9 034B
L_55EB:
        MVI@    R1,     R0                      ; 55EB   0288
        SDBD                                    ; 55EC   0001
        CMPI    #$0871, R0                      ; 55ED   0378 0071 0008
        BNEQ    L_55F6                          ; 55F0   020C 0004

        SUBI    #$0010, R1                      ; 55F2   0339 0010
        B       L_554F                          ; 55F4   0220 00A6

L_55F6:
        INCR    R1                              ; 55F6   0009
        CMPI    #$034F, R1                      ; 55F7   0379 034F
        BMI     L_55EB                          ; 55F9   022B 000F

L_55FB:
        MVI     G_0351, R0                      ; 55FB   0280 0351
        SLR     R0,     2                       ; 55FD   0064
        MVII    #$0004, R3                      ; 55FE   02BB 0004
L_5600:
        MVII    #$034B, R1                      ; 5600   02B9 034B
L_5602:
        SARC    R0,     1                       ; 5602   0078
        BNC     L_5615                          ; 5603   0209 0010

        MVI@    R1,     R2                      ; 5605   028A
        SDBD                                    ; 5606   0001
        CMPI    #$0871, R2                      ; 5607   037A 0071 0008
        BEQ     L_561C                          ; 560A   0204 0010

        SDBD                                    ; 560C   0001
        ANDI    #$0800, R2                      ; 560D   03BA 0000 0008
        BEQ     L_5615                          ; 5610   0204 0003
        J       L_5C0E                          ; 5612   0004 035C 000E

L_5615:
        INCR    R1                              ; 5615   0009
        DECR    R3                              ; 5616   0013
        BNEQ    L_5602                          ; 5617   022C 0016

        SARC    R0,     1                       ; 5619   0078
        BNC     L_5628                          ; 561A   0209 000C

L_561C:
        MVI     G_0308, R0                      ; 561C   0280 0308
        ADDI    #$0040, R0                      ; 561E   02F8 0040
        SDBD                                    ; 5620   0001
        CMPI    #$1500, R0                      ; 5621   0378 0000 0015
        BPL     L_5628                          ; 5624   0203 0002

        MVO     R0,     G_0308                  ; 5626   0240 0308
L_5628:
        MVII    #$0110, R4                      ; 5628   02BC 0110
        MVII    #$0005, R3                      ; 562A   02BB 0005
        MVII    #$034B, R2                      ; 562C   02BA 034B
L_562E:
        MVI@    R4,     R5                      ; 562E   02A5
        DECR    R5                              ; 562F   0015
        BMI     L_563C                          ; 5630   020B 000A

        DECR    R4                              ; 5632   0014
        MVO@    R5,     R4                      ; 5633   0265
        ADDR    R5,     R5                      ; 5634   00ED
        SDBD                                    ; 5635   0001
        ADDI    #$5270, R5                      ; 5636   02FD 0070 0052
        SDBD                                    ; 5639   0001
        MVI@    R5,     R0                      ; 563A   02A8
        MVO@    R0,     R2                      ; 563B   0250
L_563C:
        INCR    R2                              ; 563C   000A
        DECR    R3                              ; 563D   0013
        BNEQ    L_562E                          ; 563E   022C 0011

        MVI     G_0339, R0                      ; 5640   0280 0339
        ANDI    #$00FF, R0                      ; 5642   03B8 00FF
        MOVR    R0,     R1                      ; 5644   0081
        ANDI    #$0007, R0                      ; 5645   03B8 0007
        SLR     R1,     2                       ; 5647   0065
        SLR     R1,     1                       ; 5648   0061
        ADDI    #$02C7, R1                      ; 5649   02F9 02C7
        MOVR    R1,     R5                      ; 564B   008D
        MVI     G_011D, R3                      ; 564C   0283 011D
        SLL     R3,     2                       ; 564E   004F
        SLL     R3,     1                       ; 564F   004B
        SDBD                                    ; 5650   0001
        ADDI    #$5258, R3                      ; 5651   02FB 0058 0052
        MVI     G_01A9, R2                      ; 5654   0282 01A9
        INCR    R2                              ; 5656   000A
        MOVR    R2,     R1                      ; 5657   0091
        NEGR    R1                              ; 5658   0021
        ADDI    #$0008, R1                      ; 5659   02F9 0008
        PSHR    R5                              ; 565B   0275

        JSR     R4,     L_5BD0                  ; 565C   0004 0058 03D0

        PULR    R5                              ; 565F   02B5
        ADDI    #$0014, R5                      ; 5660   02FD 0014
        MVI     G_01A9, R2                      ; 5662   0282 01A9
        NEGR    R2                              ; 5664   0022
        ADDI    #$0007, R2                      ; 5665   02FA 0007
        BEQ     L_566F                          ; 5667   0204 0006

        CLRR    R1                              ; 5669   01C9
        PSHR    R5                              ; 566A   0275

        JSR     R4,     L_5BD0                  ; 566B   0004 0058 03D0

        PULR    R5                              ; 566E   02B5

L_566F:
        JSR     R5,     L_6079                  ; 566F   0004 0160 0079

        MVI     .PSG0.lft_hand,R1               ; 5672   0281 01FF
        ANDI    #$001F, R1                      ; 5674   03B9 001F
        SDBD                                    ; 5676   0001
        ADDI    #$5201, R1                      ; 5677   02F9 0001 0052
        MVI@    R1,     R0                      ; 567A   0288
        CLRR    R1                              ; 567B   01C9
        CLRR    R2                              ; 567C   01D2
        SDBD                                    ; 567D   0001
        MVII    #$08B3, R3                      ; 567E   02BB 00B3 0008
        RRC     R0,     2                       ; 5681   0074
        BC      L_5686                          ; 5682   0201 0002
        BNOV    L_5697                          ; 5684   020A 0011

L_5686:
        RLC     R1,     2                       ; 5686   0055
        ADDI    #$0010, R3                      ; 5687   02FB 0010
        CMP     G_011D, R1                      ; 5689   0341 011D
        BNEQ    L_568F                          ; 568B   020C 0002

        MVI     G_0312, R2                      ; 568D   0282 0312
L_568F:
        ADDI    #$0008, R2                      ; 568F   02FA 0008
        CMPI    #$0100, R2                      ; 5691   037A 0100
        BMI     L_5697                          ; 5693   020B 0002

        MVII    #$0100, R2                      ; 5695   02BA 0100
L_5697:
        MVO     R2,     G_0312                  ; 5697   0242 0312
        MVO     R3,     G_0349                  ; 5699   0243 0349
        MVO     R1,     G_011D                  ; 569B   0241 011D
        MVI     G_0313, R2                      ; 569D   0282 0313
        RRC     R0,     2                       ; 569F   0074
        BC      L_56B4                          ; 56A0   0201 0012
        BOV     L_56AA                          ; 56A2   0202 0006

        CMPI    #$0080, R2                      ; 56A4   037A 0080
        BEQ     L_56BC                          ; 56A6   0204 0014
        BMI     L_56B4                          ; 56A8   020B 000A

L_56AA:
        SUBI    #$0002, R2                      ; 56AA   033A 0002
        CMPI    #$0060, R2                      ; 56AC   037A 0060
        BPL     L_56BC                          ; 56AE   0203 000C

        MVII    #$0060, R2                      ; 56B0   02BA 0060
        B       L_56BC                          ; 56B2   0200 0008

L_56B4:
        ADDI    #$0001, R2                      ; 56B4   02FA 0001
        CMPI    #$0100, R2                      ; 56B6   037A 0100
        BMI     L_56BC                          ; 56B8   020B 0002

        MVII    #$0100, R2                      ; 56BA   02BA 0100
L_56BC:
        MVO     R2,     G_0313                  ; 56BC   0242 0313
L_56BE:
        MVI     G_011D, R1                      ; 56BE   0281 011D
        MVI     G_0312, R3                      ; 56C0   0283 0312
        ANDI    #$0002, R1                      ; 56C2   03B9 0002
        BEQ     L_56C7                          ; 56C4   0204 0001

        NEGR    R3                              ; 56C6   0023
L_56C7:
        SWAP    R1,     1                       ; 56C7   0041
        SLL     R1,     1                       ; 56C8   0049
        MVI     G_0313, R2                      ; 56C9   0282 0313
        ADD     G_0311, R2                      ; 56CB   02C2 0311
        MVO     R2,     G_0311                  ; 56CD   0242 0311
        SWAP    R2,     1                       ; 56CF   0042
        ANDI    #$0007, R2                      ; 56D0   03BA 0007
        MVO     R2,     G_01A9                  ; 56D2   0242 01A9
        NEGR    R2                              ; 56D4   0022
        MOVR    R2,     R4                      ; 56D5   0094
        ADDI    #$00DF, R2                      ; 56D6   02FA 00DF
        XORR    R1,     R2                      ; 56D8   01CA
        MVO     R2,     G_0341                  ; 56D9   0242 0341
        MVI     G_012C, R0                      ; 56DB   0280 012C
        TSTR    R0                              ; 56DD   0080
        BEQ     L_56F4                          ; 56DE   0204 0014

        SUBI    #$0003, R0                      ; 56E0   0338 0003
        CMPI    #$000C, R0                      ; 56E2   0378 000C
        BPL     L_56E7                          ; 56E4   0203 0001

        CLRR    R0                              ; 56E6   01C0
L_56E7:
        MVO     R0,     G_012C                  ; 56E7   0240 012C
        ADDR    R4,     R0                      ; 56E9   00E0
        MVO     R0,     G_0342                  ; 56EA   0240 0342
        SDBD                                    ; 56EC   0001
        MVII    #$0613, R0                      ; 56ED   02B8 0013 0006
        MVO     R0,     G_034A                  ; 56F0   0240 034A
        B       L_570B                          ; 56F2   0200 0017

L_56F4:
        MVI     .PSG0.lft_hand,R0               ; 56F4   0280 01FF
        COMR    R0                              ; 56F6   0018
        ANDI    #$00E0, R0                      ; 56F7   03B8 00E0
        BEQ     L_570B                          ; 56F9   0204 0010

        ANDI    #$007F, R2                      ; 56FB   03BA 007F
        MVO     R2,     G_0342                  ; 56FD   0242 0342
        MVII    #$0052, R0                      ; 56FF   02B8 0052
        MVO     R0,     G_034A                  ; 5701   0240 034A
        SUBR    R4,     R2                      ; 5703   0122
        MVO     R2,     G_012C                  ; 5704   0242 012C
        PSHR    R4                              ; 5706   0274

        JSR     R4,     L_5CC4                  ; 5707   0004 005C 00C4

        PULR    R4                              ; 570A   02B4
L_570B:
        ADD     G_0310, R3                      ; 570B   02C3 0310
        MVO     R3,     G_0310                  ; 570D   0243 0310
        SLR     R1,     2                       ; 570F   0065
        SUBR    R1,     R3                      ; 5710   010B
        SWAP    R3,     1                       ; 5711   0043
        ANDI    #$00FF, R3                      ; 5712   03BB 00FF
        XORI    #$0300, R3                      ; 5714   03FB 0300
        MVO     R3,     G_0339                  ; 5716   0243 0339
        MVO     R3,     G_033A                  ; 5718   0243 033A
        MVII    #$0194, R4                      ; 571A   02BC 0194
        MVII    #$033A, R3                      ; 571C   02BB 033A
L_571E:
        INCR    R3                              ; 571E   000B
        MVI@    R4,     R0                      ; 571F   02A0
        DECR    R0                              ; 5720   0010
        BPL     L_575D                          ; 5721   0203 003A

        MVI@    R4,     R0                      ; 5723   02A0
        MVI@    R4,     R1                      ; 5724   02A1
        SLL     R1,     1                       ; 5725   0049
        DECR    R1                              ; 5726   0011
        NEGR    R1                              ; 5727   0021
        TSTR    R0                              ; 5728   0080
        BEQ     L_574E                          ; 5729   0204 0023

        MVI     G_0353, R0                      ; 572B   0280 0353
        SARC    R0,     1                       ; 572D   0078
        BNC     L_5761                          ; 572E   0209 0031

        ADD@    R3,     R1                      ; 5730   02D9
        MVO@    R1,     R3                      ; 5731   0259
        ANDI    #$00FF, R1                      ; 5732   03B9 00FF
        CMP@    R4,     R1                      ; 5734   0361
        BEQ     L_573B                          ; 5735   0204 0004

        CMP@    R4,     R1                      ; 5737   0361
        BNEQ    L_5763                          ; 5738   020C 0029

        INCR    R7                              ; 573A   000F
L_573B:
        INCR    R4                              ; 573B   000C
L_573C:
        SUBI    #$0003, R4                      ; 573C   033C 0003
        MVI@    R4,     R0                      ; 573E   02A0
        XORI    #$0001, R0                      ; 573F   03F8 0001
        DECR    R4                              ; 5741   0014
        MVO@    R0,     R4                      ; 5742   0260
        ADDI    #$0008, R3                      ; 5743   02FB 0008
        MVII    #$0004, R0                      ; 5745   02B8 0004
        SWAP    R0,     1                       ; 5747   0040
        XOR@    R3,     R0                      ; 5748   03D8
        MVO@    R0,     R3                      ; 5749   0258
        SUBI    #$0008, R3                      ; 574A   033B 0008
        B       L_5761                          ; 574C   0200 0013

L_574E:
        ADDI    #$0002, R4                      ; 574E   02FC 0002
        ADD@    R3,     R1                      ; 5750   02D9
        ANDI    #$00FF, R1                      ; 5751   03B9 00FF
        MOVR    R1,     R0                      ; 5753   0088
        XORI    #$0300, R1                      ; 5754   03F9 0300
        MVO@    R1,     R3                      ; 5756   0259
        CMPI    #$00F4, R0                      ; 5757   0378 00F4
        BEQ     L_573C                          ; 5759   0224 001E
        B       L_5763                          ; 575B   0200 0006

L_575D:
        DECR    R4                              ; 575D   0014
        MVO@    R0,     R4                      ; 575E   0260
        ADDI    #$0002, R4                      ; 575F   02FC 0002
L_5761:
        ADDI    #$0002, R4                      ; 5761   02FC 0002
L_5763:
        CMPI    #$01A8, R4                      ; 5763   037C 01A8
        BNEQ    L_571E                          ; 5765   022C 0048

        JSR     R5,     L_60B4                  ; 5767   0004 0160 00B4
        JSR     R5,     L_60F9                  ; 576A   0004 0160 00F9
        JSR     R5,     L_6119                  ; 576D   0004 0160 0119

        EIS                                     ; 5770   0002
        DECR    R7                              ; 5771   0017
        DIS                                     ; 5772   0003
        MVII    #$0008, R0                      ; 5773   02B8 0008
        SDBD                                    ; 5775   0001
        MVII    #$3800, R1                      ; 5776   02B9 0000 0038
        SDBD                                    ; 5779   0001
        MVII    #$5161, R4                      ; 577A   02BC 0061 0051

        JSR     R5,     .EXEC.730               ; 577D   0004 0114 0330

        SDBD                                    ; 5780   0001
        MVII    #$50E1, R4                      ; 5781   02BC 00E1 0050
        SDBD                                    ; 5784   0001
        MVII    #$3808, R1                      ; 5785   02B9 0008 0038
        MVII    #$0058, R0                      ; 5788   02B8 0058

        JSR     R5,     .EXEC.730               ; 578A   0004 0114 0330

        MVII    #$0090, R0                      ; 578D   02B8 0090
        SDBD                                    ; 578F   0001
        MVII    #$3860, R1                      ; 5790   02B9 0060 0038
        SDBD                                    ; 5793   0001
        MVII    #$5169, R4                      ; 5794   02BC 0069 0051

        JSR     R5,     .EXEC.730               ; 5797   0004 0114 0330

        MVII    #$0070, R0                      ; 579A   02B8 0070
        SDBD                                    ; 579C   0001
        MVII    #$38F0, R4                      ; 579D   02BC 00F0 0038

        JSR     R5,     X_FILL_ZERO             ; 57A0   0004 0114 0338

        MVII    #$007F, R0                      ; 57A3   02B8 007F
        MOVR    R0,     R1                      ; 57A5   0081
        SDBD                                    ; 57A6   0001
        MVII    #$38F3, R2                      ; 57A7   02BA 00F3 0038
        MVII    #$0007, R3                      ; 57AA   02BB 0007
L_57AC:
        MVO@    R0,     R2                      ; 57AC   0250
        ADDI    #$0008, R2                      ; 57AD   02FA 0008
        SLL     R1,     1                       ; 57AF   0049
        MVO@    R1,     R2                      ; 57B0   0251
        ADDI    #$0008, R2                      ; 57B1   02FA 0008
        SLR     R0,     1                       ; 57B3   0060
        DECR    R3                              ; 57B4   0013
        BNEQ    L_57AC                          ; 57B5   022C 000A

        SDBD                                    ; 57B7   0001
        MVII    #$38F0, R5                      ; 57B8   02BD 00F0 0038
        MVII    #$00FF, R0                      ; 57BB   02B8 00FF
        MVO@    R0,     R5                      ; 57BD   0268
        MVO@    R0,     R5                      ; 57BE   0268
        MVO@    R0,     R5                      ; 57BF   0268
        MVO@    R0,     R5                      ; 57C0   0268
        MVO@    R0,     R5                      ; 57C1   0268
        MVO@    R0,     R5                      ; 57C2   0268
        MVO@    R0,     R5                      ; 57C3   0268
        MVO@    R0,     R5                      ; 57C4   0268
        CLRR    R0                              ; 57C5   01C0
        MVO     R0,     .STIC.BORD              ; 57C6   0240 002C
        INCR    R0                              ; 57C8   0008
        MVO     R0,     .STIC.CS.1              ; 57C9   0240 0029
        MVO     R0,     .STIC.CS.3              ; 57CB   0240 002B
        INCR    R0                              ; 57CD   0008
        MVO     R0,     .STIC.EDGE              ; 57CE   0240 0032
        SLL     R0,     1                       ; 57D0   0048
        MVO     R0,     .STIC.CS.0              ; 57D1   0240 0028
        MVO     R0,     .STIC.CS.2              ; 57D3   0240 002A
        EIS                                     ; 57D5   0002

        JSR     R4,     L_5A78                  ; 57D6   0004 0058 0278

        MVO     R0,     .STIC.VIDEN             ; 57D9   0240 0020
        MVII    #$0339, R4                      ; 57DB   02BC 0339
        MVII    #$0000, R5                      ; 57DD   02BD 0000
        MVI@    R4,     R0                      ; 57DF   02A0
        MVO@    R0,     R5                      ; 57E0   0268
        MVI@    R4,     R0                      ; 57E1   02A0
        MVO@    R0,     R5                      ; 57E2   0268
        MVI@    R4,     R0                      ; 57E3   02A0
        MVO@    R0,     R5                      ; 57E4   0268
        MVI@    R4,     R0                      ; 57E5   02A0
        MVO@    R0,     R5                      ; 57E6   0268
        MVI@    R4,     R0                      ; 57E7   02A0
        MVO@    R0,     R5                      ; 57E8   0268
        MVI@    R4,     R0                      ; 57E9   02A0
        MVO@    R0,     R5                      ; 57EA   0268
        MVI@    R4,     R0                      ; 57EB   02A0
        MVO@    R0,     R5                      ; 57EC   0268
        MVI@    R4,     R0                      ; 57ED   02A0
        MVO@    R0,     R5                      ; 57EE   0268
        MVI@    R4,     R0                      ; 57EF   02A0
        MVO@    R0,     R5                      ; 57F0   0268
        MVI@    R4,     R0                      ; 57F1   02A0
        MVO@    R0,     R5                      ; 57F2   0268
        MVI@    R4,     R0                      ; 57F3   02A0
        MVO@    R0,     R5                      ; 57F4   0268
        MVI@    R4,     R0                      ; 57F5   02A0
        MVO@    R0,     R5                      ; 57F6   0268
        MVI@    R4,     R0                      ; 57F7   02A0
        MVO@    R0,     R5                      ; 57F8   0268
        MVI@    R4,     R0                      ; 57F9   02A0
        MVO@    R0,     R5                      ; 57FA   0268
        MVI@    R4,     R0                      ; 57FB   02A0
        MVO@    R0,     R5                      ; 57FC   0268
        MVI@    R4,     R0                      ; 57FD   02A0
        MVO@    R0,     R5                      ; 57FE   0268
        MVI@    R4,     R0                      ; 57FF   02A0
        MVO@    R0,     R5                      ; 5800   0268
        MVI@    R4,     R0                      ; 5801   02A0
        MVO@    R0,     R5                      ; 5802   0268
        MVI@    R4,     R0                      ; 5803   02A0
        MVO@    R0,     R5                      ; 5804   0268
        MVI@    R4,     R0                      ; 5805   02A0
        MVO@    R0,     R5                      ; 5806   0268
        MVI@    R4,     R0                      ; 5807   02A0
        MVO@    R0,     R5                      ; 5808   0268
        MVI@    R4,     R0                      ; 5809   02A0
        MVO@    R0,     R5                      ; 580A   0268
        MVI@    R4,     R0                      ; 580B   02A0
        MVO@    R0,     R5                      ; 580C   0268
        MVI@    R4,     R0                      ; 580D   02A0
        MVO@    R0,     R5                      ; 580E   0268
        MVI@    R5,     R0                      ; 580F   02A8
        MVO@    R0,     R4                      ; 5810   0260
        MVI@    R5,     R0                      ; 5811   02A8
        MVO@    R0,     R4                      ; 5812   0260
        MVI     G_0109, R0                      ; 5813   0280 0109
        ANDI    #$0003, R0                      ; 5815   03B8 0003
        MVO     R0,     G_0109                  ; 5817   0240 0109
        BNEQ    L_581F                          ; 5819   020C 0004

        MVO     R0,     .STIC.C.0               ; 581B   0240 0018
        MVO     R0,     .STIC.C.1               ; 581D   0240 0019
L_581F:
        MVI     G_01A9, R0                      ; 581F   0280 01A9
        MVO     R0,     .STIC.VDLY              ; 5821   0240 0031
        MVII    #$0145, R4                      ; 5823   02BC 0145
        ADDR    R0,     R4                      ; 5825   00C4
        SDBD                                    ; 5826   0001
        MVII    #$39C0, R5                      ; 5827   02BD 00C0 0039
        MVI@    R4,     R0                      ; 582A   02A0
        MVO@    R0,     R5                      ; 582B   0268
        MVI@    R4,     R0                      ; 582C   02A0
        MVO@    R0,     R5                      ; 582D   0268
        MVI@    R4,     R0                      ; 582E   02A0
        MVO@    R0,     R5                      ; 582F   0268
        MVI@    R4,     R0                      ; 5830   02A0
        MVO@    R0,     R5                      ; 5831   0268
        MVI@    R4,     R0                      ; 5832   02A0
        MVO@    R0,     R5                      ; 5833   0268
        MVI@    R4,     R0                      ; 5834   02A0
        MVO@    R0,     R5                      ; 5835   0268
        MVI@    R4,     R0                      ; 5836   02A0
        MVO@    R0,     R5                      ; 5837   0268
        MVI@    R4,     R0                      ; 5838   02A0
        MVO@    R0,     R5                      ; 5839   0268
        MVI@    R4,     R0                      ; 583A   02A0
        MVO@    R0,     R5                      ; 583B   0268
        MVI@    R4,     R0                      ; 583C   02A0
        MVO@    R0,     R5                      ; 583D   0268
        MVI@    R4,     R0                      ; 583E   02A0
        MVO@    R0,     R5                      ; 583F   0268
        MVI@    R4,     R0                      ; 5840   02A0
        MVO@    R0,     R5                      ; 5841   0268
        MVI@    R4,     R0                      ; 5842   02A0
        MVO@    R0,     R5                      ; 5843   0268
        MVI@    R4,     R0                      ; 5844   02A0
        MVO@    R0,     R5                      ; 5845   0268
        MVI@    R4,     R0                      ; 5846   02A0
        MVO@    R0,     R5                      ; 5847   0268
        MVI@    R4,     R0                      ; 5848   02A0
        MVO@    R0,     R5                      ; 5849   0268
        MVI@    R4,     R0                      ; 584A   02A0
        MVO@    R0,     R5                      ; 584B   0268
        MVI@    R4,     R0                      ; 584C   02A0
        MVO@    R0,     R5                      ; 584D   0268
        MVI@    R4,     R0                      ; 584E   02A0
        MVO@    R0,     R5                      ; 584F   0268
        MVI@    R4,     R0                      ; 5850   02A0
        MVO@    R0,     R5                      ; 5851   0268
        MVI@    R4,     R0                      ; 5852   02A0
        MVO@    R0,     R5                      ; 5853   0268
        MVI@    R4,     R0                      ; 5854   02A0
        MVO@    R0,     R5                      ; 5855   0268
        MVI@    R4,     R0                      ; 5856   02A0
        MVO@    R0,     R5                      ; 5857   0268
        MVI@    R4,     R0                      ; 5858   02A0
        MVO@    R0,     R5                      ; 5859   0268
        MVI@    R4,     R0                      ; 585A   02A0
        MVO@    R0,     R5                      ; 585B   0268
        MVI@    R4,     R0                      ; 585C   02A0
        MVO@    R0,     R5                      ; 585D   0268
        MVI@    R4,     R0                      ; 585E   02A0
        MVO@    R0,     R5                      ; 585F   0268
        MVI@    R4,     R0                      ; 5860   02A0
        MVO@    R0,     R5                      ; 5861   0268
        MVI@    R4,     R0                      ; 5862   02A0
        MVO@    R0,     R5                      ; 5863   0268
        MVI@    R4,     R0                      ; 5864   02A0
        MVO@    R0,     R5                      ; 5865   0268
        MVI@    R4,     R0                      ; 5866   02A0
        MVO@    R0,     R5                      ; 5867   0268
        MVI@    R4,     R0                      ; 5868   02A0
        MVO@    R0,     R5                      ; 5869   0268
        MVI@    R4,     R0                      ; 586A   02A0
        MVO@    R0,     R5                      ; 586B   0268
        MVI@    R4,     R0                      ; 586C   02A0
        MVO@    R0,     R5                      ; 586D   0268
        MVI@    R4,     R0                      ; 586E   02A0
        MVO@    R0,     R5                      ; 586F   0268
        MVI@    R4,     R0                      ; 5870   02A0
        MVO@    R0,     R5                      ; 5871   0268
        MVI@    R4,     R0                      ; 5872   02A0
        MVO@    R0,     R5                      ; 5873   0268
        MVI@    R4,     R0                      ; 5874   02A0
        MVO@    R0,     R5                      ; 5875   0268
        MVI@    R4,     R0                      ; 5876   02A0
        MVO@    R0,     R5                      ; 5877   0268
        MVI@    R4,     R0                      ; 5878   02A0
        MVO@    R0,     R5                      ; 5879   0268
        MVI@    R4,     R0                      ; 587A   02A0
        MVO@    R0,     R5                      ; 587B   0268
        MVI@    R4,     R0                      ; 587C   02A0
        MVO@    R0,     R5                      ; 587D   0268
        MVI@    R4,     R0                      ; 587E   02A0
        MVO@    R0,     R5                      ; 587F   0268
        MVI@    R4,     R0                      ; 5880   02A0
        MVO@    R0,     R5                      ; 5881   0268
        MVI@    R4,     R0                      ; 5882   02A0
        MVO@    R0,     R5                      ; 5883   0268
        MVI@    R4,     R0                      ; 5884   02A0
        MVO@    R0,     R5                      ; 5885   0268
        MVI@    R4,     R0                      ; 5886   02A0
        MVO@    R0,     R5                      ; 5887   0268
        MVI@    R4,     R0                      ; 5888   02A0
        MVO@    R0,     R5                      ; 5889   0268
        MVI@    R4,     R0                      ; 588A   02A0
        MVO@    R0,     R5                      ; 588B   0268
        MVI@    R4,     R0                      ; 588C   02A0
        MVO@    R0,     R5                      ; 588D   0268
        MVI@    R4,     R0                      ; 588E   02A0
        MVO@    R0,     R5                      ; 588F   0268
        MVI@    R4,     R0                      ; 5890   02A0
        MVO@    R0,     R5                      ; 5891   0268
        MVI@    R4,     R0                      ; 5892   02A0
        MVO@    R0,     R5                      ; 5893   0268
        MVI@    R4,     R0                      ; 5894   02A0
L_5895:
        MVO@    R0,     R5                      ; 5895   0268
        MVI@    R4,     R0                      ; 5896   02A0
        MVO@    R0,     R5                      ; 5897   0268
        MVI@    R4,     R0                      ; 5898   02A0
        MVO@    R0,     R5                      ; 5899   0268
        MVI@    R4,     R0                      ; 589A   02A0
        MVO@    R0,     R5                      ; 589B   0268
        MVI@    R4,     R0                      ; 589C   02A0
        MVO@    R0,     R5                      ; 589D   0268
        MVI@    R4,     R0                      ; 589E   02A0
        MVO@    R0,     R5                      ; 589F   0268
        MVI@    R4,     R0                      ; 58A0   02A0
        MVO@    R0,     R5                      ; 58A1   0268
        MVI@    R4,     R0                      ; 58A2   02A0
        MVO@    R0,     R5                      ; 58A3   0268
        MVI@    R4,     R0                      ; 58A4   02A0
        MVO@    R0,     R5                      ; 58A5   0268
        MVI@    R4,     R0                      ; 58A6   02A0
        MVO@    R0,     R5                      ; 58A7   0268
        MVI@    R4,     R0                      ; 58A8   02A0
        MVO@    R0,     R5                      ; 58A9   0268
        MVII    #$0078, R0                      ; 58AA   02B8 0078
        MVI     G_0353, R1                      ; 58AC   0281 0353
        SARC    R1,     2                       ; 58AE   007D
        BNOV    L_58B3                          ; 58AF   020A 0002

        MVII    #$000F, R0                      ; 58B1   02B8 000F
L_58B3:
        SDBD                                    ; 58B3   0001
        MVII    #$38D3, R1                      ; 58B4   02B9 00D3 0038
        MVO@    R0,     R1                      ; 58B7   0248
        MVII    #$018C, R4                      ; 58B8   02BC 018C
        SDBD                                    ; 58BA   0001
        MVII    #$3923, R2                      ; 58BB   02BA 0023 0039
        SDBD                                    ; 58BE   0001
        MVII    #$1922, R3                      ; 58BF   02BB 0022 0019
L_58C2:
        MVI@    R4,     R5                      ; 58C2   02A5
        MVI@    R4,     R1                      ; 58C3   02A1
        TSTR    R5                              ; 58C4   00AD
        BEQ     L_5934                          ; 58C5   0204 006D

        ADDI    #$0200, R5                      ; 58C7   02FD 0200
        MVI@    R5,     R0                      ; 58C9   02A8
        ANDI    #$0005, R0                      ; 58CA   03B8 0005
        BNEQ    L_58D0                          ; 58CC   020C 0002

        DECR    R5                              ; 58CE   0015
        MVO@    R0,     R5                      ; 58CF   0268
L_58D0:
        SARC    R1,     1                       ; 58D0   0079
        SLL     R1,     1                       ; 58D1   0049
        BC      L_590A                          ; 58D2   0201 0036

        ADDR    R7,     R1                      ; 58D4   00F9
        ADDI    #$0015, R1                      ; 58D5   02F9 0015
        MVI@    R1,     R0                      ; 58D7   0288
        MVO@    R0,     R2                      ; 58D8   0250
        INCR    R1                              ; 58D9   0009
        ADDI    #$0008, R2                      ; 58DA   02FA 0008
        MVI@    R1,     R0                      ; 58DC   0288
        MVO@    R0,     R2                      ; 58DD   0250
        MVO@    R3,     R5                      ; 58DE   026B
        ADDI    #$0008, R3                      ; 58DF   02FB 0008
        MVI@    R5,     R0                      ; 58E1   02A8
        ANDI    #$0005, R0                      ; 58E2   03B8 0005
        BNEQ    L_58E8                          ; 58E4   020C 0002

        DECR    R5                              ; 58E6   0015
        MVO@    R3,     R5                      ; 58E7   026B
L_58E8:
        B       L_5929                          ; 58E8   0200 003F

        ADDR    R7,     R7                      ; 58EA   00FF
        DECLE   $0000                           ; 58EB   0000

        SARC    R3,     2                       ; 58EC   007F
        TSTR    R0                              ; 58ED   0080
        RSWD    R7                              ; 58EE   003F
        ADDR    R0,     R0                      ; 58EF   00C0
        COMR    R7                              ; 58F0   001F
        ADDR    R4,     R0                      ; 58F1   00E0
        INCR    R7                              ; 58F2   000F
        ADDR    R6,     R0                      ; 58F3   00F0
        SETC                                    ; 58F4   0007
        ADDR    R7,     R0                      ; 58F5   00F8
        DIS                                     ; 58F6   0003
        ADDR    R7,     R4                      ; 58F7   00FC
        DECLE   $0001                           ; 58F8   0001

        ADDR    R7,     R6                      ; 58F9   00FE
        ADDR    R7,     R7                      ; 58FA   00FF
        ADDR    R6,     R0                      ; 58FB   00F0
        SARC    R3,     2                       ; 58FC   007F
        ADDR    R7,     R0                      ; 58FD   00F8
        RSWD    R7                              ; 58FE   003F
        ADDR    R7,     R4                      ; 58FF   00FC
        COMR    R7                              ; 5900   001F
        ADDR    R7,     R6                      ; 5901   00FE
        INCR    R7                              ; 5902   000F
        ADDR    R7,     R7                      ; 5903   00FF
        SETC                                    ; 5904   0007
        TSTR    R0                              ; 5905   0080
        DIS                                     ; 5906   0003
        ADDR    R0,     R0                      ; 5907   00C0
        DECLE   $0001                           ; 5908   0001

        ADDR    R4,     R0                      ; 5909   00E0
L_590A:
        SDBD                                    ; 590A   0001
        XORI    #$1000, R3                      ; 590B   03FB 0000 0010
        MVO@    R3,     R5                      ; 590E   026B
        CMPI    #$000A, R1                      ; 590F   0379 000A
        BMI     L_5918                          ; 5911   020B 0005

        SDBD                                    ; 5913   0001
        MVII    #$066A, R0                      ; 5914   02B8 006A 0006
        MVO@    R0,     R5                      ; 5917   0268
L_5918:
        ADDI    #$0008, R3                      ; 5918   02FB 0008
        MVO@    R3,     R5                      ; 591A   026B
        ADDR    R7,     R1                      ; 591B   00F9
        SUBI    #$0022, R1                      ; 591C   0339 0022
        MVI@    R1,     R0                      ; 591E   0288
        MVO@    R0,     R2                      ; 591F   0250
        INCR    R1                              ; 5920   0009
        ADDI    #$0008, R2                      ; 5921   02FA 0008
        MVI@    R1,     R0                      ; 5923   0288
        MVO@    R0,     R2                      ; 5924   0250
        SDBD                                    ; 5925   0001
        XORI    #$1000, R3                      ; 5926   03FB 0000 0010
L_5929:
        ADDI    #$0008, R2                      ; 5929   02FA 0008
        ADDI    #$0008, R3                      ; 592B   02FB 0008
        MVI@    R5,     R0                      ; 592D   02A8
        ANDI    #$0005, R0                      ; 592E   03B8 0005
        BNEQ    L_5934                          ; 5930   020C 0002

        DECR    R5                              ; 5932   0015
        MVO@    R0,     R5                      ; 5933   0268
L_5934:
        CMPI    #$0194, R4                      ; 5934   037C 0194
        BNEQ    L_58C2                          ; 5936   022C 0075

        SUBI    #$0008, R6                      ; 5938   033E 0008
        MVI     G_01A9, R3                      ; 593A   0283 01A9
        MVI     G_011E, R1                      ; 593C   0281 011E
        MVO     R3,     G_011E                  ; 593E   0243 011E
        TSTR    R1                              ; 5940   0089
        BEQ     L_5A61                          ; 5941   0204 011E

        TSTR    R3                              ; 5943   009B
        BNEQ    L_5A61                          ; 5944   020C 011B

        MVII    #$013D, R4                      ; 5946   02BC 013D
        SDBD                                    ; 5948   0001
        MVII    #$3960, R5                      ; 5949   02BD 0060 0039
        ADD     G_011F, R5                      ; 594C   02C5 011F
        MVI@    R4,     R0                      ; 594E   02A0
        MVO@    R0,     R5                      ; 594F   0268
        MVI@    R4,     R0                      ; 5950   02A0
        MVO@    R0,     R5                      ; 5951   0268
        MVI@    R4,     R0                      ; 5952   02A0
        MVO@    R0,     R5                      ; 5953   0268
        MVI@    R4,     R0                      ; 5954   02A0
        MVO@    R0,     R5                      ; 5955   0268
        MVI@    R4,     R0                      ; 5956   02A0
        MVO@    R0,     R5                      ; 5957   0268
        MVI@    R4,     R0                      ; 5958   02A0
        MVO@    R0,     R5                      ; 5959   0268
        MVI@    R4,     R0                      ; 595A   02A0
        MVO@    R0,     R5                      ; 595B   0268
        MVI@    R4,     R0                      ; 595C   02A0
        MVO@    R0,     R5                      ; 595D   0268
        MVI     G_011F, R2                      ; 595E   0282 011F
        ADDI    #$0008, R2                      ; 5960   02FA 0008
        CMPI    #$0060, R2                      ; 5962   037A 0060
        BMI     L_5967                          ; 5964   020B 0001

        CLRR    R2                              ; 5966   01D2
L_5967:
        MVO     R2,     G_011F                  ; 5967   0242 011F
        MVII    #$0200, R4                      ; 5969   02BC 0200
        MVII    #$0314, R5                      ; 596B   02BD 0314
        MVI@    R4,     R0                      ; 596D   02A0
        MVO@    R0,     R5                      ; 596E   0268
        MVI@    R4,     R0                      ; 596F   02A0
        MVO@    R0,     R5                      ; 5970   0268
        MVI@    R4,     R0                      ; 5971   02A0
        MVO@    R0,     R5                      ; 5972   0268
        MVI@    R4,     R0                      ; 5973   02A0
        MVO@    R0,     R5                      ; 5974   0268
        MVI@    R4,     R0                      ; 5975   02A0
        MVO@    R0,     R5                      ; 5976   0268
        MVI@    R4,     R0                      ; 5977   02A0
        MVO@    R0,     R5                      ; 5978   0268
        MVI@    R4,     R0                      ; 5979   02A0
        MVO@    R0,     R5                      ; 597A   0268
        MVI@    R4,     R0                      ; 597B   02A0
        MVO@    R0,     R5                      ; 597C   0268
        MVI@    R4,     R0                      ; 597D   02A0
        MVO@    R0,     R5                      ; 597E   0268
        MVI@    R4,     R0                      ; 597F   02A0
        MVO@    R0,     R5                      ; 5980   0268
        MVI@    R4,     R0                      ; 5981   02A0
        MVO@    R0,     R5                      ; 5982   0268
        MVI@    R4,     R0                      ; 5983   02A0
        MVO@    R0,     R5                      ; 5984   0268
        MVI@    R4,     R0                      ; 5985   02A0
        MVO@    R0,     R5                      ; 5986   0268
        MVI@    R4,     R0                      ; 5987   02A0
        MVO@    R0,     R5                      ; 5988   0268
        MVI@    R4,     R0                      ; 5989   02A0
        MVO@    R0,     R5                      ; 598A   0268
        MVI@    R4,     R0                      ; 598B   02A0
        MVO@    R0,     R5                      ; 598C   0268
        MVII    #$000B, R2                      ; 598D   02BA 000B
        MVII    #$0210, R3                      ; 598F   02BB 0210
L_5991:
        ADDI    #$0004, R3                      ; 5991   02FB 0004
        MVII    #$0314, R4                      ; 5993   02BC 0314
        MOVR    R4,     R5                      ; 5995   00A5
        MVI@    R3,     R0                      ; 5996   0298
        MVI@    R4,     R1                      ; 5997   02A1
        MVO@    R1,     R3                      ; 5998   0259
        MVO@    R0,     R5                      ; 5999   0268
        INCR    R3                              ; 599A   000B
        MVI@    R3,     R0                      ; 599B   0298
        MVI@    R4,     R1                      ; 599C   02A1
        MVO@    R1,     R3                      ; 599D   0259
        MVO@    R0,     R5                      ; 599E   0268
        INCR    R3                              ; 599F   000B
        MVI@    R3,     R0                      ; 59A0   0298
        MVI@    R4,     R1                      ; 59A1   02A1
        MVO@    R1,     R3                      ; 59A2   0259
        MVO@    R0,     R5                      ; 59A3   0268
        INCR    R3                              ; 59A4   000B
        MVI@    R3,     R0                      ; 59A5   0298
        MVI@    R4,     R1                      ; 59A6   02A1
        MVO@    R1,     R3                      ; 59A7   0259
        MVO@    R0,     R5                      ; 59A8   0268
        INCR    R3                              ; 59A9   000B
        MVI@    R3,     R0                      ; 59AA   0298
        MVI@    R4,     R1                      ; 59AB   02A1
        MVO@    R1,     R3                      ; 59AC   0259
        MVO@    R0,     R5                      ; 59AD   0268
        INCR    R3                              ; 59AE   000B
        MVI@    R3,     R0                      ; 59AF   0298
        MVI@    R4,     R1                      ; 59B0   02A1
        MVO@    R1,     R3                      ; 59B1   0259
        MVO@    R0,     R5                      ; 59B2   0268
        INCR    R3                              ; 59B3   000B
        MVI@    R3,     R0                      ; 59B4   0298
        MVI@    R4,     R1                      ; 59B5   02A1
        MVO@    R1,     R3                      ; 59B6   0259
        MVO@    R0,     R5                      ; 59B7   0268
        INCR    R3                              ; 59B8   000B
        MVI@    R3,     R0                      ; 59B9   0298
        MVI@    R4,     R1                      ; 59BA   02A1
        MVO@    R1,     R3                      ; 59BB   0259
        MVO@    R0,     R5                      ; 59BC   0268
        INCR    R3                              ; 59BD   000B
        MVI@    R3,     R0                      ; 59BE   0298
        MVI@    R4,     R1                      ; 59BF   02A1
        MVO@    R1,     R3                      ; 59C0   0259
        MVO@    R0,     R5                      ; 59C1   0268
        INCR    R3                              ; 59C2   000B
        MVI@    R3,     R0                      ; 59C3   0298
        MVI@    R4,     R1                      ; 59C4   02A1
        MVO@    R1,     R3                      ; 59C5   0259
        MVO@    R0,     R5                      ; 59C6   0268
        INCR    R3                              ; 59C7   000B
        MVI@    R3,     R0                      ; 59C8   0298
        MVI@    R4,     R1                      ; 59C9   02A1
        MVO@    R1,     R3                      ; 59CA   0259
        MVO@    R0,     R5                      ; 59CB   0268
        INCR    R3                              ; 59CC   000B
        MVI@    R3,     R0                      ; 59CD   0298
        MVI@    R4,     R1                      ; 59CE   02A1
        MVO@    R1,     R3                      ; 59CF   0259
        MVO@    R0,     R5                      ; 59D0   0268
        INCR    R3                              ; 59D1   000B
        MVI@    R3,     R0                      ; 59D2   0298
        MVI@    R4,     R1                      ; 59D3   02A1
        MVO@    R1,     R3                      ; 59D4   0259
        MVO@    R0,     R5                      ; 59D5   0268
        INCR    R3                              ; 59D6   000B
        MVI@    R3,     R0                      ; 59D7   0298
        MVI@    R4,     R1                      ; 59D8   02A1
        MVO@    R1,     R3                      ; 59D9   0259
        MVO@    R0,     R5                      ; 59DA   0268
        INCR    R3                              ; 59DB   000B
        MVI@    R3,     R0                      ; 59DC   0298
        MVI@    R4,     R1                      ; 59DD   02A1
        MVO@    R1,     R3                      ; 59DE   0259
        MVO@    R0,     R5                      ; 59DF   0268
        INCR    R3                              ; 59E0   000B
        MVI@    R3,     R0                      ; 59E1   0298
        MVI@    R4,     R1                      ; 59E2   02A1
        MVO@    R1,     R3                      ; 59E3   0259
        MVO@    R0,     R5                      ; 59E4   0268
        INCR    R3                              ; 59E5   000B
        DECR    R2                              ; 59E6   0012
        BNEQ    L_5991                          ; 59E7   022C 0057

        MVII    #$0324, R4                      ; 59E9   02BC 0324
        MVII    #$0200, R5                      ; 59EB   02BD 0200
        MVI@    R4,     R0                      ; 59ED   02A0
        MVO@    R0,     R5                      ; 59EE   0268
        MVI@    R4,     R0                      ; 59EF   02A0
        MVO@    R0,     R5                      ; 59F0   0268
        MVI@    R4,     R0                      ; 59F1   02A0
        MVO@    R0,     R5                      ; 59F2   0268
        MVI@    R4,     R0                      ; 59F3   02A0
        MVO@    R0,     R5                      ; 59F4   0268
        MVI@    R4,     R0                      ; 59F5   02A0
        MVO@    R0,     R5                      ; 59F6   0268
        MVI@    R4,     R0                      ; 59F7   02A0
        MVO@    R0,     R5                      ; 59F8   0268
        MVI@    R4,     R0                      ; 59F9   02A0
        MVO@    R0,     R5                      ; 59FA   0268
        MVI@    R4,     R0                      ; 59FB   02A0
        MVO@    R0,     R5                      ; 59FC   0268
        MVI@    R4,     R0                      ; 59FD   02A0
        MVO@    R0,     R5                      ; 59FE   0268
        MVI@    R4,     R0                      ; 59FF   02A0
        MVO@    R0,     R5                      ; 5A00   0268
        MVI@    R4,     R0                      ; 5A01   02A0
        MVO@    R0,     R5                      ; 5A02   0268
        MVI@    R4,     R0                      ; 5A03   02A0
        MVO@    R0,     R5                      ; 5A04   0268
        MVI@    R4,     R0                      ; 5A05   02A0
        MVO@    R0,     R5                      ; 5A06   0268
        MVI@    R4,     R0                      ; 5A07   02A0
        MVO@    R0,     R5                      ; 5A08   0268
        MVI@    R4,     R0                      ; 5A09   02A0
        MVO@    R0,     R5                      ; 5A0A   0268
        MVI@    R4,     R0                      ; 5A0B   02A0
        MVO@    R0,     R5                      ; 5A0C   0268
        MVI     G_0117, R0                      ; 5A0D   0280 0117
        DECR    R0                              ; 5A0F   0010
        MVO     R0,     G_0117                  ; 5A10   0240 0117
        BNEQ    L_5A54                          ; 5A12   020C 0040

        MVII    #$0003, R0                      ; 5A14   02B8 0003
        MVO     R0,     G_0117                  ; 5A16   0240 0117
        MVI     G_0116, R0                      ; 5A18   0280 0116
        INCR    R0                              ; 5A1A   0008
        ANDI    #$0003, R0                      ; 5A1B   03B8 0003
        MVO     R0,     G_0116                  ; 5A1D   0240 0116
        MVII    #$033B, R1                      ; 5A1F   02B9 033B
        ADDR    R0,     R1                      ; 5A21   00C1
        MVI     G_030A, R3                      ; 5A22   0283 030A
        MVO@    R3,     R1                      ; 5A24   024B
        ADDI    #$0008, R1                      ; 5A25   02F9 0008
        MVI     G_030B, R3                      ; 5A27   0283 030B
        MVO@    R3,     R1                      ; 5A29   024B
        ADDI    #$0008, R1                      ; 5A2A   02F9 0008
        MVI     G_030C, R3                      ; 5A2C   0283 030C
        MVO@    R3,     R1                      ; 5A2E   024B
        MVII    #$0118, R4                      ; 5A2F   02BC 0118
        MOVR    R0,     R5                      ; 5A31   0085
        SLL     R0,     2                       ; 5A32   004C
        ADDR    R0,     R5                      ; 5A33   00C5
        ADDI    #$0194, R5                      ; 5A34   02FD 0194
        MVI@    R4,     R0                      ; 5A36   02A0
        MVO@    R0,     R5                      ; 5A37   0268
        MVI@    R4,     R0                      ; 5A38   02A0
        MVO@    R0,     R5                      ; 5A39   0268
        MVI@    R4,     R0                      ; 5A3A   02A0
        MVO@    R0,     R5                      ; 5A3B   0268
        MVI@    R4,     R0                      ; 5A3C   02A0
        MVO@    R0,     R5                      ; 5A3D   0268
        MVI@    R4,     R0                      ; 5A3E   02A0
        MVO@    R0,     R5                      ; 5A3F   0268
        MVI     G_010F, R0                      ; 5A40   0280 010F
        TSTR    R0                              ; 5A42   0080
        BEQ     L_5A54                          ; 5A43   0204 000F

        MVII    #$033F, R1                      ; 5A45   02B9 033F
        MVI     G_030D, R3                      ; 5A47   0283 030D
        MVO@    R3,     R1                      ; 5A49   024B
        ADDI    #$0008, R1                      ; 5A4A   02F9 0008
        MVI     G_030E, R3                      ; 5A4C   0283 030E
        MVO@    R3,     R1                      ; 5A4E   024B
        ADDI    #$0008, R1                      ; 5A4F   02F9 0008
        MVI     G_030F, R3                      ; 5A51   0283 030F
        MVO@    R3,     R1                      ; 5A53   024B
L_5A54:
        MVI     G_010C, R0                      ; 5A54   0280 010C
        CMPI    #$00F0, R0                      ; 5A56   0378 00F0
        BPL     L_5A5E                          ; 5A58   0203 0004

        ADDI    #$0014, R0                      ; 5A5A   02F8 0014
        MVO     R0,     G_010C                  ; 5A5C   0240 010C
L_5A5E:
        CLRR    R0                              ; 5A5E   01C0
        B       L_5A64                          ; 5A5F   0200 0003

L_5A61:
        MVI     G_0108, R0                      ; 5A61   0280 0108
        INCR    R0                              ; 5A63   0008
L_5A64:
        MVO     R0,     G_0108                  ; 5A64   0240 0108
        MVI     G_0353, R0                      ; 5A66   0280 0353
        INCR    R0                              ; 5A68   0008
        MVO     R0,     G_0353                  ; 5A69   0240 0353
        DIS                                     ; 5A6B   0003
        MVI     G_0335, R7                      ; 5A6C   0287 0335
L_5A6E:
        EIS                                     ; 5A6E   0002
        PULR    R5                              ; 5A6F   02B5
        PULR    R4                              ; 5A70   02B4
        PULR    R3                              ; 5A71   02B3
        PULR    R2                              ; 5A72   02B2
        PULR    R1                              ; 5A73   02B1
        PULR    R0                              ; 5A74   02B0
        RSWD    R0                              ; 5A75   0038
        PULR    R0                              ; 5A76   02B0
        PULR    R7                              ; 5A77   02B7
L_5A78:
        MOVR    R4,     R0                      ; 5A78   00A0
        MVO     R0,     .ISRVEC.0               ; 5A79   0240 0100
        SWAP    R0,     1                       ; 5A7B   0040
        MVO     R0,     .ISRVEC.1               ; 5A7C   0240 0101
        B       L_5A6E                          ; 5A7E   0220 0011

L_5A80:
        PSHR    R4                              ; 5A80   0274
        PSHR    R1                              ; 5A81   0271
        MOVR    R0,     R1                      ; 5A82   0081
        PSHR    R2                              ; 5A83   0272
        PSHR    R3                              ; 5A84   0273
        MOVR    R1,     R2                      ; 5A85   008A
        CLRR    R3                              ; 5A86   01DB
L_5A87:
        SETC                                    ; 5A87   0007
        RLC     R3,     1                       ; 5A88   0053
        SLR     R2,     1                       ; 5A89   0062
        BNEQ    L_5A87                          ; 5A8A   022C 0004

L_5A8C:
        JSR     R4,     L_5A97                  ; 5A8C   0004 0058 0297

        ANDR    R3,     R0                      ; 5A8F   0198
        CMPR    R1,     R0                      ; 5A90   0148
        BGT     L_5A8C                          ; 5A91   022E 0006

        PULR    R3                              ; 5A93   02B3
        PULR    R2                              ; 5A94   02B2
        PULR    R1                              ; 5A95   02B1
        PULR    R7                              ; 5A96   02B7
L_5A97:
        PSHR    R1                              ; 5A97   0271
        MVI     G_0336, R0                      ; 5A98   0280 0336
        MOVR    R0,     R1                      ; 5A9A   0081
        SLL     R1,     2                       ; 5A9B   004D
        ADDR    R1,     R0                      ; 5A9C   00C8
        SLL     R1,     1                       ; 5A9D   0049
        ADDR    R1,     R0                      ; 5A9E   00C8
        INCR    R0                              ; 5A9F   0008
        MVO     R0,     G_0336                  ; 5AA0   0240 0336
        SWAP    R0,     1                       ; 5AA2   0040
        PULR    R1                              ; 5AA3   02B1
        MOVR    R4,     R7                      ; 5AA4   00A7
L_5AA5:
        MOVR    R7,     R4                      ; 5AA5   00BC
        ADDI    #$003B, R4                      ; 5AA6   02FC 003B
        SDBD                                    ; 5AA8   0001
        MVII    #$19F0, R0                      ; 5AA9   02B8 00F0 0019
        MOVR    R0,     R1                      ; 5AAC   0081
        ADDI    #$0008, R1                      ; 5AAD   02F9 0008
        CLRR    R2                              ; 5AAF   01D2
        MVI     G_0103, R3                      ; 5AB0   0283 0103
        TSTR    R3                              ; 5AB2   009B
        BEQ     L_5ABD                          ; 5AB3   0204 0008

L_5AB5:
        MVI@    R4,     R2                      ; 5AB5   02A2
        MVO@    R0,     R2                      ; 5AB6   0250
        ADDI    #$0014, R2                      ; 5AB7   02FA 0014
        MVO@    R1,     R2                      ; 5AB9   0251
        DECR    R3                              ; 5ABA   0013
        BGT     L_5AB5                          ; 5ABB   022E 0007

L_5ABD:
        SDBD                                    ; 5ABD   0001
        MVII    #$18F0, R0                      ; 5ABE   02B8 00F0 0018
        MOVR    R0,     R1                      ; 5AC1   0081
        CMPI    #$024E, R2                      ; 5AC2   037A 024E
        BNEQ    L_5AB5                          ; 5AC4   022C 0010

        MVII    #$0210, R3                      ; 5AC6   02BB 0210
        MVII    #$000C, R2                      ; 5AC8   02BA 000C
        SDBD                                    ; 5ACA   0001
        MVII    #$38F0, R1                      ; 5ACB   02B9 00F0 0038
L_5ACE:
        MVI@    R3,     R0                      ; 5ACE   0298
        SDBD                                    ; 5ACF   0001
        ANDI    #$DFFF, R0                      ; 5AD0   03B8 00FF 00DF
        SDBD                                    ; 5AD3   0001
        XORI    #$2000, R0                      ; 5AD4   03F8 0000 0020
        MVO@    R0,     R3                      ; 5AD7   0258
        ADDI    #$0003, R3                      ; 5AD8   02FB 0003
        MVO@    R1,     R3                      ; 5ADA   0259
        ADDI    #$0011, R3                      ; 5ADB   02FB 0011
        DECR    R2                              ; 5ADD   0012
        BNEQ    L_5ACE                          ; 5ADE   022C 0011

        MOVR    R5,     R7                      ; 5AE0   00AF
        MVI@    R1,     R0                      ; 5AE1   0288
        MVI@    R1,     R1                      ; 5AE2   0289
        MVI@    R1,     R2                      ; 5AE3   028A
        MVO@    R0,     R4                      ; 5AE4   0260
        MVO@    R1,     R4                      ; 5AE5   0261
        MVO@    R2,     R4                      ; 5AE6   0262
        DECLE   $0238,  $0239,  $023A           ; 5AE7   0238 0239 023A
L_5AEA:
        PSHR    R4                              ; 5AEA   0274

L_5AEB:
        JSR     R4,     L_5A97                  ; 5AEB   0004 0058 0297

        MOVR    R1,     R2                      ; 5AEE   008A
        ADDI    #$01AC, R2                      ; 5AEF   02FA 01AC
        MVI@    R2,     R2                      ; 5AF1   0292
        CMPI    #$000C, R2                      ; 5AF2   037A 000C
        BPL     L_5B00                          ; 5AF4   0203 000A

        ANDI    #$0003, R0                      ; 5AF6   03B8 0003
        DECR    R0                              ; 5AF8   0010
        BMI     L_5AEB                          ; 5AF9   022B 000F

        CLRR    R2                              ; 5AFB   01D2
        CLRR    R3                              ; 5AFC   01DB
        DECR    R0                              ; 5AFD   0010
        BMI     L_5B33                          ; 5AFE   020B 0033

L_5B00:
        ANDI    #$0001, R0                      ; 5B00   03B8 0001
        SDBD                                    ; 5B02   0001
        ADDI    #$5095, R2                      ; 5B03   02FA 0095 0050
L_5B06:
        ADDR    R0,     R2                      ; 5B06   00C2
        MVI@    R2,     R4                      ; 5B07   0294
        SDBD                                    ; 5B08   0001
        ADDI    #$5097, R4                      ; 5B09   02FC 0097 0050
        MOVR    R1,     R3                      ; 5B0C   008B
        ADDI    #$01AA, R3                      ; 5B0D   02FB 01AA
        MVI@    R3,     R3                      ; 5B0F   029B
        ADD@    R4,     R3                      ; 5B10   02E3
        SUBI    #$0006, R3                      ; 5B11   033B 0006
        BMI     L_5B21                          ; 5B13   020B 000C

        PSHR    R1                              ; 5B15   0271
        ADDI    #$01AE, R1                      ; 5B16   02F9 01AE
        MVI@    R1,     R1                      ; 5B18   0289
        SLL     R1,     1                       ; 5B19   0049
        NEGR    R1                              ; 5B1A   0021
        ADDI    #$0019, R1                      ; 5B1B   02F9 0019
        CMPR    R1,     R3                      ; 5B1D   014B
        PULR    R1                              ; 5B1E   02B1
        BMI     L_5B2B                          ; 5B1F   020B 000A

L_5B21:
        SDBD                                    ; 5B21   0001
        CMPI    #$50A1, R2                      ; 5B22   037A 00A1 0050
        BMI     L_5AEB                          ; 5B25   022B 003B

        XORI    #$0001, R0                      ; 5B27   03F8 0001
        B       L_5B06                          ; 5B29   0220 0024

L_5B2B:
        MVI@    R2,     R2                      ; 5B2B   0292
        MOVR    R1,     R3                      ; 5B2C   008B
        ADDI    #$01AC, R3                      ; 5B2D   02FB 01AC
        MVO@    R2,     R3                      ; 5B2F   025A
        MVI@    R4,     R3                      ; 5B30   02A3
        SUBI    #$0002, R3                      ; 5B31   033B 0002
L_5B33:
        MOVR    R1,     R4                      ; 5B33   008C
        ADDI    #$01AA, R4                      ; 5B34   02FC 01AA
        MVI@    R4,     R0                      ; 5B36   02A0
        ADDR    R0,     R3                      ; 5B37   00C3
        DECR    R4                              ; 5B38   0014
        MVO@    R3,     R4                      ; 5B39   0263
        CMPR    R0,     R3                      ; 5B3A   0143
        BMI     L_5B3E                          ; 5B3B   020B 0001

        MOVR    R0,     R3                      ; 5B3D   0083
L_5B3E:
        SLR     R3,     1                       ; 5B3E   0063
        ADDI    #$0326, R3                      ; 5B3F   02FB 0326
        MOVR    R3,     R5                      ; 5B41   009D
        SLL     R2,     1                       ; 5B42   004A
        SDBD                                    ; 5B43   0001
        ADDI    #$2804, R2                      ; 5B44   02FA 0004 0028
        PSHR    R2                              ; 5B47   0272
        MVI@    R3,     R0                      ; 5B48   0298
        SDBD                                    ; 5B49   0001
        CMPI    #$8000, R0                      ; 5B4A   0378 0000 0080
        BEQ     L_5B62                          ; 5B4D   0204 0013

        TSTR    R0                              ; 5B4F   0080
        BEQ     L_5B61                          ; 5B50   0204 000F

        JSR     R4,     L_5B8C                  ; 5B52   0004 0058 038C

        DECR    R5                              ; 5B55   0015
        MVI@    R5,     R0                      ; 5B56   02A8
        SDBD                                    ; 5B57   0001
        ANDI    #$8000, R0                      ; 5B58   03B8 0000 0080
        SDBD                                    ; 5B5B   0001
        XORI    #$8000, R0                      ; 5B5C   03F8 0000 0080
        SLR     R0,     2                       ; 5B5F   0064
        XORR    R0,     R2                      ; 5B60   01C2
L_5B61:
        MVO@    R2,     R5                      ; 5B61   026A
L_5B62:
        MVII    #$01AE, R2                      ; 5B62   02BA 01AE
        ADDR    R1,     R2                      ; 5B64   00CA
        ADD@    R2,     R3                      ; 5B65   02D3
        SDBD                                    ; 5B66   0001
        MVII    #$8000, R0                      ; 5B67   02B8 0000 0080
L_5B6A:
        MVO@    R0,     R5                      ; 5B6A   0268
        CMPR    R3,     R5                      ; 5B6B   015D
        BNEQ    L_5B6A                          ; 5B6C   022C 0003

        PULR    R2                              ; 5B6E   02B2
        SUBI    #$0003, R2                      ; 5B6F   033A 0003
        MVI@    R3,     R0                      ; 5B71   0298
L_5B72:
        SDBD                                    ; 5B72   0001
        CMPI    #$8000, R0                      ; 5B73   0378 0000 0080
        BEQ     L_5B8B                          ; 5B76   0204 0013

        TSTR    R0                              ; 5B78   0080
        BEQ     L_5B8A                          ; 5B79   0204 000F

        JSR     R4,     L_5B8C                  ; 5B7B   0004 0058 038C

        MVO@    R2,     R5                      ; 5B7E   026A
        MVI@    R5,     R0                      ; 5B7F   02A8
        TSTR    R0                              ; 5B80   0080
        BNEQ    L_5B8B                          ; 5B81   020C 0008

        SDBD                                    ; 5B83   0001
        MVII    #$2004, R0                      ; 5B84   02B8 0004 0020
        DECR    R5                              ; 5B87   0015
        MVO@    R0,     R5                      ; 5B88   0268
        PULR    R7                              ; 5B89   02B7
L_5B8A:
        MVO@    R2,     R5                      ; 5B8A   026A
L_5B8B:
        PULR    R7                              ; 5B8B   02B7
L_5B8C:
        PSHR    R4                              ; 5B8C   0274
        PSHR    R1                              ; 5B8D   0271
        MOVR    R0,     R4                      ; 5B8E   0084
        PSHR    R3                              ; 5B8F   0273
        PSHR    R5                              ; 5B90   0275
        MOVR    R2,     R5                      ; 5B91   0095
        ANDI    #$00F8, R4                      ; 5B92   03BC 00F8
        SDBD                                    ; 5B94   0001
        ADDI    #$50D9, R4                      ; 5B95   02FC 00D9 0050
        ANDI    #$00F8, R5                      ; 5B98   03BD 00F8
        SDBD                                    ; 5B9A   0001
        ADDI    #$50D9, R5                      ; 5B9B   02FD 00D9 0050
        ANDI    #$0007, R0                      ; 5B9E   03B8 0007
        SLR     R0,     2                       ; 5BA0   0064
        ANDI    #$0007, R2                      ; 5BA1   03BA 0007
        SLR     R2,     2                       ; 5BA3   0066
        MVII    #$013D, R1                      ; 5BA4   02B9 013D
        CLRR    R3                              ; 5BA6   01DB
        MVO     R3,     G_0334                  ; 5BA7   0243 0334
        MVII    #$0008, R3                      ; 5BA9   02BB 0008
L_5BAB:
        PSHR    R3                              ; 5BAB   0273
        MVI@    R4,     R3                      ; 5BAC   02A3
        ADDR    R0,     R7                      ; 5BAD   00C7
        COMR    R3                              ; 5BAE   001B
        PSHR    R3                              ; 5BAF   0273
        MVI@    R5,     R3                      ; 5BB0   02AB
        ADDR    R2,     R7                      ; 5BB1   00D7
        COMR    R3                              ; 5BB2   001B
        AND@    R6,     R3                      ; 5BB3   03B3
        MVO@    R3,     R1                      ; 5BB4   024B
        ADD     G_0334, R3                      ; 5BB5   02C3 0334
        MVO     R3,     G_0334                  ; 5BB7   0243 0334
        INCR    R1                              ; 5BB9   0009
        PULR    R3                              ; 5BBA   02B3
        DECR    R3                              ; 5BBB   0013
        BNEQ    L_5BAB                          ; 5BBC   022C 0012

        MVII    #$0080, R2                      ; 5BBE   02BA 0080
        SWAP    R2,     1                       ; 5BC0   0042
        MVI     G_0334, R3                      ; 5BC1   0283 0334
        TSTR    R3                              ; 5BC3   009B
        BEQ     L_5BCC                          ; 5BC4   0204 0006

        MVI     G_011F, R2                      ; 5BC6   0282 011F
        SDBD                                    ; 5BC8   0001
        ADDI    #$0964, R2                      ; 5BC9   02FA 0064 0009
L_5BCC:
        PULR    R5                              ; 5BCC   02B5
        PULR    R3                              ; 5BCD   02B3
        PULR    R1                              ; 5BCE   02B1
        PULR    R7                              ; 5BCF   02B7
L_5BD0:
        PSHR    R4                              ; 5BD0   0274
        MVI@    R5,     R4                      ; 5BD1   02AC
        MVI@    R5,     R5                      ; 5BD2   02AD
        SDBD                                    ; 5BD3   0001
        SUBI    #$18E6, R4                      ; 5BD4   033C 00E6 0018
        BEQ     L_5BDF                          ; 5BD7   0204 0006

        CMPI    #$0008, R4                      ; 5BD9   037C 0008
        BEQ     L_5BDF                          ; 5BDB   0204 0002

L_5BDD:
        MVII    #$0010, R4                      ; 5BDD   02BC 0010
L_5BDF:
        SDBD                                    ; 5BDF   0001
        SUBI    #$18E6, R5                      ; 5BE0   033D 00E6 0018
        BEQ     L_5BEB                          ; 5BE3   0204 0006

        CMPI    #$0008, R5                      ; 5BE5   037D 0008
L_5BE7:
        BEQ     L_5BEB                          ; 5BE7   0204 0002

        MVII    #$0010, R5                      ; 5BE9   02BD 0010
L_5BEB:
        SDBD                                    ; 5BEB   0001
        ADDI    #$51E9, R4                      ; 5BEC   02FC 00E9 0051
        SDBD                                    ; 5BEF   0001
        ADDI    #$51E9, R5                      ; 5BF0   02FD 00E9 0051
        ADDR    R1,     R4                      ; 5BF3   00CC
        ADDR    R1,     R5                      ; 5BF4   00CD
L_5BF5:
        MVI@    R3,     R1                      ; 5BF5   0299
        INCR    R3                              ; 5BF6   000B
        PSHR    R0                              ; 5BF7   0270
        SARC    R0,     1                       ; 5BF8   0078
        ADCR    R7                              ; 5BF9   002F
        SLL     R1,     1                       ; 5BFA   0049
        ADDR    R0,     R7                      ; 5BFB   00C7
        SLL     R1,     2                       ; 5BFC   004D
        SLL     R1,     2                       ; 5BFD   004D
        SLL     R1,     2                       ; 5BFE   004D
        SLL     R1,     1                       ; 5BFF   0049
        PULR    R0                              ; 5C00   02B0
        PSHR    R1                              ; 5C01   0271
        MVI@    R4,     R1                      ; 5C02   02A1
        SWAP    R1,     1                       ; 5C03   0041
        XOR@    R5,     R1                      ; 5C04   03E9
        AND@    R6,     R1                      ; 5C05   03B1
        BNEQ    L_5C0C                          ; 5C06   020C 0004

        DECR    R2                              ; 5C08   0012
        BNEQ    L_5BF5                          ; 5C09   022C 0015

        PULR    R7                              ; 5C0B   02B7
L_5C0C:
        PULR    R0                              ; 5C0C   02B0
        PULR    R0                              ; 5C0D   02B0
L_5C0E:
        MOVR    R7,     R0                      ; 5C0E   00B8
        ADDI    #$0012, R0                      ; 5C0F   02F8 0012
        MVO     R0,     G_0335                  ; 5C11   0240 0335

        JSR     R4,     L_5CBC                  ; 5C13   0004 005C 00BC

        MVII    #$0020, R0                      ; 5C16   02B8 0020
        MVO     R0,     G_0309                  ; 5C18   0240 0309
        MVI     G_0341, R0                      ; 5C1A   0280 0341
        ANDI    #$007F, R0                      ; 5C1C   03B8 007F
        SWAP    R0,     1                       ; 5C1E   0040
        MVO     R0,     G_0311                  ; 5C1F   0240 0311
        MVI     G_0309, R5                      ; 5C21   0285 0309
        DECR    R5                              ; 5C23   0015
        MVO     R5,     G_0309                  ; 5C24   0245 0309
        BMI     L_5C64                          ; 5C26   020B 003C

        ANDI    #$00FE, R5                      ; 5C28   03BD 00FE
L_5C2A:
        SDBD                                    ; 5C2A   0001
        ADDI    #$5270, R5                      ; 5C2B   02FD 0070 0052
        SDBD                                    ; 5C2E   0001
        MVI@    R5,     R0                      ; 5C2F   02A8
        MVO     R0,     G_0349                  ; 5C30   0240 0349
        MVI     G_0313, R2                      ; 5C32   0282 0313
        SUBI    #$0007, R2                      ; 5C34   033A 0007
        BPL     L_5C39                          ; 5C36   0203 0001

        CLRR    R2                              ; 5C38   01D2
L_5C39:
        MVO     R2,     G_0313                  ; 5C39   0242 0313
        NEGR    R2                              ; 5C3B   0022
        ADD     G_0311, R2                      ; 5C3C   02C2 0311
L_5C3E:
        MVO     R2,     G_0311                  ; 5C3E   0242 0311
        SWAP    R2,     1                       ; 5C40   0042
        ANDI    #$00FF, R2                      ; 5C41   03BA 00FF
        XORI    #$0100, R2                      ; 5C43   03FA 0100
        MVO     R2,     G_0341                  ; 5C45   0242 0341
        MVI     G_011D, R1                      ; 5C47   0281 011D
        MVI     G_0312, R3                      ; 5C49   0283 0312
        SUBI    #$0005, R3                      ; 5C4B   033B 0005
        BPL     L_5C50                          ; 5C4D   0203 0001

        CLRR    R3                              ; 5C4F   01DB
L_5C50:
        MVO     R3,     G_0312                  ; 5C50   0243 0312
        ANDI    #$0002, R1                      ; 5C52   03B9 0002
        BEQ     L_5C57                          ; 5C54   0204 0001

        NEGR    R3                              ; 5C56   0023
L_5C57:
        ADD     G_0310, R3                      ; 5C57   02C3 0310
        MVO     R3,     G_0310                  ; 5C59   0243 0310
        SWAP    R3,     1                       ; 5C5B   0043
        ANDI    #$00FF, R3                      ; 5C5C   03BB 00FF
        XORI    #$0200, R3                      ; 5C5E   03FB 0200
        MVO     R3,     G_0339                  ; 5C60   0243 0339
L_5C62:
        EIS                                     ; 5C62   0002
        DECR    R7                              ; 5C63   0017
L_5C64:
        NEGR    R5                              ; 5C64   0025
        CMPI    #$00F0, R5                      ; 5C65   037D 00F0
        BMI     L_5C62                          ; 5C67   022B 0006

        SDBD                                    ; 5C69   0001
        MVII    #$533A, R0                      ; 5C6A   02B8 003A 0053
        MVO     R0,     G_0335                  ; 5C6D   0240 0335
        EIS                                     ; 5C6F   0002
        DECR    R7                              ; 5C70   0017
L_5C71:
        PSHR    R4                              ; 5C71   0274
        MVI     .PSG0.chan_enable,R0            ; 5C72   0280 01F8
        TSTR    R0                              ; 5C74   0080
        BNEQ    L_5C98                          ; 5C75   020C 0021

        MVII    #$01F0, R4                      ; 5C77   02BC 01F0
        MOVR    R4,     R5                      ; 5C79   00A5
        MVII    #$0003, R3                      ; 5C7A   02BB 0003
L_5C7C:
        MVI@    R5,     R0                      ; 5C7C   02A8
        ADD     G_010A, R7                      ; 5C7D   02C7 010A
        ADD     G_010B, R0                      ; 5C7F   02C0 010B
        B       L_5C85                          ; 5C81   0200 0002

        SUB     G_010B, R0                      ; 5C83   0300 010B
L_5C85:
        MVO@    R0,     R4                      ; 5C85   0260
        MVI     G_010B, R1                      ; 5C86   0281 010B
        SLL     R1,     1                       ; 5C88   0049
        MVO     R1,     G_010B                  ; 5C89   0241 010B
        DECR    R3                              ; 5C8B   0013
        BNEQ    L_5C7C                          ; 5C8C   022C 0011

L_5C8E:
        MVI     G_010A, R0                      ; 5C8E   0280 010A
        XORI    #$0004, R0                      ; 5C90   03F8 0004
        MVO     R0,     G_010A                  ; 5C92   0240 010A
        MVII    #$0003, R0                      ; 5C94   02B8 0003
        MVO     R0,     G_010B                  ; 5C96   0240 010B
L_5C98:
        PULR    R7                              ; 5C98   02B7
L_5C99:
        PSHR    R4                              ; 5C99   0274
        PSHR    R0                              ; 5C9A   0270
        MVII    #$0019, R0                      ; 5C9B   02B8 0019
        MVO     R0,     .PSG0.envlp_hi          ; 5C9D   0240 01F7
L_5C9F:
        CLRR    R0                              ; 5C9F   01C0
        MVO     R0,     .PSG0.noise             ; 5CA0   0240 01F9
        MVO     R0,     .PSG0.chan_enable       ; 5CA2   0240 01F8
        MVO     R0,     .PSG0.envlp_lo          ; 5CA4   0240 01F3
        MVII    #$00A3, R0                      ; 5CA6   02B8 00A3
        MVII    #$01F0, R4                      ; 5CA8   02BC 01F0
        MVO@    R0,     R4                      ; 5CAA   0260
        ADDI    #$0004, R0                      ; 5CAB   02F8 0004
        MVO@    R0,     R4                      ; 5CAD   0260
        ADDI    #$0008, R0                      ; 5CAE   02F8 0008
        MVO@    R0,     R4                      ; 5CB0   0260
        INCR    R4                              ; 5CB1   000C
        MVII    #$0006, R0                      ; 5CB2   02B8 0006
        MVO@    R0,     R4                      ; 5CB4   0260
        MVO@    R0,     R4                      ; 5CB5   0260
        MVO@    R0,     R4                      ; 5CB6   0260
        CLRR    R0                              ; 5CB7   01C0
        MVO     R0,     .PSG0.envelope          ; 5CB8   0240 01FA
        PULR    R0                              ; 5CBA   02B0
        PULR    R7                              ; 5CBB   02B7
L_5CBC:
        PSHR    R4                              ; 5CBC   0274
        PSHR    R0                              ; 5CBD   0270
        MVII    #$0038, R0                      ; 5CBE   02B8 0038
        MVO     R0,     .PSG0.envlp_hi          ; 5CC0   0240 01F7
        B       L_5C9F                          ; 5CC2   0220 0024

L_5CC4:
        PSHR    R4                              ; 5CC4   0274
        PSHR    R0                              ; 5CC5   0270
        CLRR    R0                              ; 5CC6   01C0
        MVO     R0,     .PSG0.envlp_lo          ; 5CC7   0240 01F3
        MVII    #$0080, R0                      ; 5CC9   02B8 0080
        MVO     R0,     .PSG0.chn_a_lo          ; 5CCB   0240 01F0
        MVII    #$0084, R0                      ; 5CCD   02B8 0084
        MVO     R0,     .PSG0.chn_b_lo          ; 5CCF   0240 01F1
        MVII    #$0088, R0                      ; 5CD1   02B8 0088
        MVO     R0,     .PSG0.chn_c_lo          ; 5CD3   0240 01F2
        MVII    #$0018, R0                      ; 5CD5   02B8 0018
        MVO     R0,     .PSG0.envlp_hi          ; 5CD7   0240 01F7
        MVII    #$0038, R0                      ; 5CD9   02B8 0038
        MVO     R0,     .PSG0.chan_enable       ; 5CDB   0240 01F8
        CLRR    R0                              ; 5CDD   01C0
        MVO     R0,     .PSG0.envelope          ; 5CDE   0240 01FA
        MVO     R0,     .PSG0.chn_a_hi          ; 5CE0   0240 01F4
        MVO     R0,     .PSG0.chn_b_hi          ; 5CE2   0240 01F5
        MVO     R0,     .PSG0.chn_c_hi          ; 5CE4   0240 01F6
        PULR    R0                              ; 5CE6   02B0
        PULR    R7                              ; 5CE7   02B7
L_5CE8:
        PSHR    R4                              ; 5CE8   0274
        PSHR    R1                              ; 5CE9   0271
        MVII    #$0124, R1                      ; 5CEA   02B9 0124
        PSHR    R2                              ; 5CEC   0272
        PSHR    R3                              ; 5CED   0273
        MVI     G_0121, R2                      ; 5CEE   0282 0121
L_5CF0:
        ADD@    R1,     R0                      ; 5CF0   02C8
        CMPI    #$000A, R0                      ; 5CF1   0378 000A
        BMI     L_5D03                          ; 5CF3   020B 000E

        CLRR    R3                              ; 5CF5   01DB
L_5CF6:
        INCR    R3                              ; 5CF6   000B
        SUBI    #$000A, R0                      ; 5CF7   0338 000A
        BPL     L_5CF6                          ; 5CF9   0223 0004

        ADDI    #$000A, R0                      ; 5CFB   02F8 000A
        DECR    R3                              ; 5CFD   0013
        MVO@    R0,     R1                      ; 5CFE   0248
        DECR    R1                              ; 5CFF   0011
        MOVR    R3,     R0                      ; 5D00   0098
        BNEQ    L_5CF0                          ; 5D01   022C 0012

L_5D03:
        MVO@    R0,     R1                      ; 5D03   0248
        CMP     G_0121, R2                      ; 5D04   0342 0121
        BEQ     L_5D14                          ; 5D06   0204 000C

        MVI     G_0103, R0                      ; 5D08   0280 0103
        CMPI    #$0009, R0                      ; 5D0A   0378 0009
        BPL     L_5D14                          ; 5D0C   0203 0006

        INCR    R0                              ; 5D0E   0008
        MVO     R0,     G_0103                  ; 5D0F   0240 0103

        JSR     R5,     L_5AA5                  ; 5D11   0004 0158 02A5

L_5D14:
        MVII    #$0120, R4                      ; 5D14   02BC 0120
        MVII    #$0150, R3                      ; 5D16   02BB 0150

        JSR     R5,     L_5D1F                  ; 5D18   0004 015C 011F

        PULR    R3                              ; 5D1B   02B3
        PULR    R2                              ; 5D1C   02B2
        PULR    R1                              ; 5D1D   02B1
        PULR    R7                              ; 5D1E   02B7
L_5D1F:
        PSHR    R5                              ; 5D1F   0275
        MOVR    R3,     R5                      ; 5D20   009D
        CLRR    R3                              ; 5D21   01DB
L_5D22:
        MVI@    R4,     R1                      ; 5D22   02A1
        CMPI    #$00FF, R1                      ; 5D23   0379 00FF
        BNEQ    L_5D28                          ; 5D25   020C 0001

        PULR    R7                              ; 5D27   02B7
L_5D28:
        ADDR    R1,     R3                      ; 5D28   00CB
        BNEQ    L_5D2D                          ; 5D29   020C 0002

        ADDI    #$000A, R1                      ; 5D2B   02F9 000A
L_5D2D:
        MVI@    R4,     R2                      ; 5D2D   02A2
        ADDR    R2,     R3                      ; 5D2E   00D3
        BNEQ    L_5D33                          ; 5D2F   020C 0002

        ADDI    #$000A, R2                      ; 5D31   02FA 000A
L_5D33:
        PSHR    R3                              ; 5D33   0273
        MOVR    R1,     R3                      ; 5D34   008B
        SLL     R1,     2                       ; 5D35   004D
        ADDR    R3,     R1                      ; 5D36   00D9
        MOVR    R2,     R3                      ; 5D37   0093
        SLL     R2,     2                       ; 5D38   004E
        ADDR    R3,     R2                      ; 5D39   00DA
        SDBD                                    ; 5D3A   0001
        ADDI    #$5221, R1                      ; 5D3B   02F9 0021 0052
        SDBD                                    ; 5D3E   0001
        ADDI    #$5221, R2                      ; 5D3F   02FA 0021 0052
        MVII    #$0005, R3                      ; 5D42   02BB 0005
L_5D44:
        MVI@    R1,     R0                      ; 5D44   0288
        SLL     R0,     2                       ; 5D45   004C
        SLL     R0,     2                       ; 5D46   004C
        XOR@    R2,     R0                      ; 5D47   03D0
        MVO@    R0,     R5                      ; 5D48   0268
        INCR    R1                              ; 5D49   0009
        INCR    R2                              ; 5D4A   000A
        DECR    R3                              ; 5D4B   0013
        BNEQ    L_5D44                          ; 5D4C   022C 0009

        PULR    R3                              ; 5D4E   02B3
        ADDI    #$000B, R5                      ; 5D4F   02FD 000B
        B       L_5D22                          ; 5D51   0220 0030

        PSHR    R5                              ; 5D53   0275
        SDBD                                    ; 5D54   0001
        MVII    #$0520, R0                      ; 5D55   02B8 0020 0005
        MVO     R0,     .BTAB.DE                ; 5D58   0240 02DE
        MVO     R0,     .BTAB.EC                ; 5D5A   0240 02EC
        ADDI    #$0008, R0                      ; 5D5C   02F8 0008
        MVO     R0,     .BTAB.ED                ; 5D5E   0240 02ED
        MVO     R0,     .BTAB.DF                ; 5D60   0240 02DF
        MVI     G_0353, R0                      ; 5D62   0280 0353
        INCR    R0                              ; 5D64   0008
        MVO     R0,     G_0353                  ; 5D65   0240 0353
        ANDI    #$000F, R0                      ; 5D67   03B8 000F
        NEGR    R0                              ; 5D69   0020
        BNEQ    L_5D8F                          ; 5D6A   020C 0023

        MVI     G_01C2, R1                      ; 5D6C   0281 01C2
        MVII    #$0011, R4                      ; 5D6E   02BC 0011
        MVII    #$0007, R3                      ; 5D70   02BB 0007
L_5D72:
        SDBD                                    ; 5D72   0001
        MVII    #$5E2E, R2                      ; 5D73   02BA 002E 005E
        CMPI    #$0048, R1                      ; 5D76   0379 0048
        BMI     L_5D7C                          ; 5D78   020B 0002

        SUBI    #$0048, R1                      ; 5D7A   0339 0048
L_5D7C:
        ADDR    R1,     R2                      ; 5D7C   00CA
        MVI@    R2,     R5                      ; 5D7D   0295
        SDBD                                    ; 5D7E   0001
        XORI    #$3000, R5                      ; 5D7F   03FD 0000 0030
        MVO@    R5,     R4                      ; 5D82   0265
        INCR    R1                              ; 5D83   0009
        DECR    R3                              ; 5D84   0013
        BNEQ    L_5D72                          ; 5D85   022C 0014

        SUBI    #$0006, R1                      ; 5D87   0339 0006
        BPL     L_5D8D                          ; 5D89   0203 0002

        ADDI    #$0048, R1                      ; 5D8B   02F9 0048
L_5D8D:
        MVO     R1,     G_01C2                  ; 5D8D   0241 01C2
L_5D8F:
        ADDI    #$022C, R0                      ; 5D8F   02F8 022C
        MVII    #$0001, R4                      ; 5D91   02BC 0001
        MVII    #$0009, R5                      ; 5D93   02BD 0009
        MVII    #$0064, R1                      ; 5D95   02B9 0064
        MVII    #$0007, R3                      ; 5D97   02BB 0007
L_5D99:
        MVO@    R0,     R4                      ; 5D99   0260
        ADDI    #$0010, R0                      ; 5D9A   02F8 0010
        MVO@    R1,     R5                      ; 5D9C   0269
        DECR    R3                              ; 5D9D   0013
        BNEQ    L_5D99                          ; 5D9E   022C 0006

        MVI     G_0107, R2                      ; 5DA0   0282 0107
        DECR    R2                              ; 5DA2   0012
        MVO     R2,     G_0107                  ; 5DA3   0242 0107
        BPL     L_5E03                          ; 5DA5   0203 005C

        MVII    #$0002, R2                      ; 5DA7   02BA 0002
        MVO     R2,     G_0107                  ; 5DA9   0242 0107
        MVI     G_0105, R1                      ; 5DAB   0281 0105
        CMPI    #$0014, R1                      ; 5DAD   0379 0014
        BNEQ    L_5DC3                          ; 5DAF   020C 0012

        MVI     G_0104, R2                      ; 5DB1   0282 0104
        INCR    R2                              ; 5DB3   000A
        ANDI    #$001F, R2                      ; 5DB4   03BA 001F
        MVO     R2,     G_0104                  ; 5DB6   0242 0104
        BNEQ    L_5E03                          ; 5DB8   020C 0049

        CLRR    R1                              ; 5DBA   01C9
        MVO     R1,     G_0105                  ; 5DBB   0241 0105
        MVI     G_0106, R0                      ; 5DBD   0280 0106
        XORI    #$0014, R0                      ; 5DBF   03F8 0014
        MVO     R0,     G_0106                  ; 5DC1   0240 0106
L_5DC3:
        MVI     G_0335, R0                      ; 5DC3   0280 0335
        INCR    R0                              ; 5DC5   0008
        ANDI    #$0003, R0                      ; 5DC6   03B8 0003
        MVO     R0,     G_0335                  ; 5DC8   0240 0335
        SLL     R0,     1                       ; 5DCA   0048
        ADDR    R0,     R7                      ; 5DCB   00C7
        B       L_5DF7                          ; 5DCC   0200 0029
        B       L_5DE3                          ; 5DCE   0200 0013
        B       L_5DDD                          ; 5DD0   0200 000B

        ADD     G_0106, R1                      ; 5DD2   02C1 0106
        SDBD                                    ; 5DD4   0001
        ADDI    #$5E06, R1                      ; 5DD5   02F9 0006 005E
        MVI@    R1,     R0                      ; 5DD8   0288
        MVO     R0,     .STIC.A.0               ; 5DD9   0240 0010
        B       L_5E03                          ; 5DDB   0200 0026

L_5DDD:
        MVII    #$006F, R0                      ; 5DDD   02B8 006F
        MVO     R0,     .STIC.A.0               ; 5DDF   0240 0010
        B       L_5E03                          ; 5DE1   0200 0020

L_5DE3:
        MOVR    R1,     R0                      ; 5DE3   0088
        SLL     R0,     2                       ; 5DE4   004C
        SLL     R0,     1                       ; 5DE5   0048
        ADDI    #$0208, R0                      ; 5DE6   02F8 0208
        MVO     R0,     .STIC.X.0               ; 5DE8   0240 0000
        MVII    #$005A, R0                      ; 5DEA   02B8 005A
        MVO     R0,     .STIC.Y.0               ; 5DEC   0240 0008
        ADDI    #$02C8, R1                      ; 5DEE   02F9 02C8
        MVI@    R1,     R0                      ; 5DF0   0288
        MVO     R0,     .STIC.A.0               ; 5DF1   0240 0010
        CLRR    R0                              ; 5DF3   01C0
        MVO@    R0,     R1                      ; 5DF4   0248
        B       L_5E03                          ; 5DF5   0200 000C

L_5DF7:
        MVI     .STIC.A.0,R0                    ; 5DF7   0280 0010
        INCR    R1                              ; 5DF9   0009
        MVO     R1,     G_0105                  ; 5DFA   0241 0105
        DECR    R1                              ; 5DFC   0011
        ADDI    #$02C8, R1                      ; 5DFD   02F9 02C8
        MVO@    R0,     R1                      ; 5DFF   0248
        CLRR    R0                              ; 5E00   01C0
        MVO     R0,     .STIC.A.0               ; 5E01   0240 0010
L_5E03:
        MVO     R0,     .STIC.VIDEN             ; 5E03   0240 0020
        PULR    R7                              ; 5E05   02B7
        SUBR    R3,     R3                      ; 5E06   011B
        DECLE   $027B                           ; 5E07   027B

        MVI     .BTAB.CB,R3                     ; 5E08   0283 02CB
        MVI@    R2,     R3                      ; 5E0A   0293
        MVO@    R3,     R1                      ; 5E0B   024B
        DECLE   $023B                           ; 5E0C   023B

        MVO     R3,     .BTAB.A3                ; 5E0D   0243 02A3
        DIS                                     ; 5E0F   0003
        MOVR    R1,     R3                      ; 5E10   008B
        ADDR    R1,     R3                      ; 5E11   00CB
        ADDR    R0,     R3                      ; 5E12   00C3
        MOVR    R2,     R3                      ; 5E13   0093
        SLR     R3,     1                       ; 5E14   0063
        DIS                                     ; 5E15   0003
        MOVR    R1,     R3                      ; 5E16   008B
        ADDR    R1,     R3                      ; 5E17   00CB
        ADDR    R0,     R3                      ; 5E18   00C3
        TSTR    R3                              ; 5E19   009B
        SETC                                    ; 5E1A   0007
        SETC                                    ; 5E1B   0007
        SUBR    R1,     R7                      ; 5E1C   010F
        DECLE   $021F                           ; 5E1D   021F

        MVI@    R4,     R7                      ; 5E1E   02A7
        MVO@    R7,     R1                      ; 5E1F   024F
        PULR    R7                              ; 5E20   02B7
        MVO@    R7,     R1                      ; 5E21   024F
        MVI@    R3,     R7                      ; 5E22   029F
        MVO@    R7,     R1                      ; 5E23   024F
        DECLE   $027F                           ; 5E24   027F

        PSHR    R7                              ; 5E25   0277
        SLR     R3,     2                       ; 5E26   0067
        SETC                                    ; 5E27   0007
        CMPR    R1,     R7                      ; 5E28   014F
        PSHR    R7                              ; 5E29   0277
        DECLE   $021F                           ; 5E2A   021F

        RRC     R3,     2                       ; 5E2B   0077
        SETC                                    ; 5E2C   0007
        SETC                                    ; 5E2D   0007
        RRC     R3,     1                       ; 5E2E   0073
        RRC     R3,     1                       ; 5E2F   0073
        RRC     R3,     1                       ; 5E30   0073
        SUBR    R3,     R7                      ; 5E31   011F
        DECLE   $027F                           ; 5E32   027F
L_5E33:
        PSHR    R7                              ; 5E33   0277
        DECLE   $021F                           ; 5E34   021F

        BESC    L_5BE7                          ; 5E35   022F 024F

        PULR    R7                              ; 5E37   02B7
        BESC    L_5C12                          ; 5E38   022F 0227

        SETC                                    ; 5E3A   0007
        DECLE   $0217                           ; 5E3B   0217

        ADD@    R1,     R7                      ; 5E3C   02CF
        SETC                                    ; 5E3D   0007
        SUBR    R3,     R0                      ; 5E3E   0118
        SKIP                                    ; 5E3F   0208
        MVI@    R2,     R0                      ; 5E40   0290
        DECLE   $0278                           ; 5E41   0278

        MVO@    R0,     R4                      ; 5E42   0260
        DECLE   $0000                           ; 5E43   0000

        ANDR    R3,     R0                      ; 5E44   0198
        MVO     R0,     .BTAB.08                ; 5E45   0240 0208
        MVII    #$0073, R0                      ; 5E47   02B8 0073
        RRC     R3,     1                       ; 5E49   0073
        RRC     R3,     1                       ; 5E4A   0073
L_5E4B:
        SUBR    R1,     R7                      ; 5E4B   010F
        BUSC    L_5C3E                          ; 5E4C   0227 020F

        MVI     .BTAB.A7,R7                     ; 5E4E   0287 02A7
        BESC    L_5C2A                          ; 5E50   022F 0227

        SETC                                    ; 5E52   0007
        DECLE   $0217                           ; 5E53   0217

        ADD@    R1,     R7                      ; 5E54   02CF
        SETC                                    ; 5E55   0007
        ANDR    R0,     R0                      ; 5E56   0180
        DECLE   $0228                           ; 5E57   0228

        MVI@    R4,     R0                      ; 5E58   02A0
        DECLE   $0228                           ; 5E59   0228

        MVI@    R2,     R0                      ; 5E5A   0290
        DECLE   $0000                           ; 5E5B   0000

        CMPR    R3,     R0                      ; 5E5C   0158
        SKIP                                    ; 5E5D   0208
        MVO@    R0,     R5                      ; 5E5E   0268
        MVO@    R0,     R1                      ; 5E5F   0248
        PSHR    R0                              ; 5E60   0270
        MVI@    R3,     R0                      ; 5E61   0298
        MVO@    R0,     R3                      ; 5E62   0258
        MVO@    R0,     R1                      ; 5E63   0248
        RRC     R3,     1                       ; 5E64   0073
        RRC     R3,     1                       ; 5E65   0073
        RRC     R3,     1                       ; 5E66   0073
        MOVR    R1,     R6                      ; 5E67   008E
        CLRC                                    ; 5E68   0006
        DECLE   $027E                           ; 5E69   027E

        MVI@    R2,     R6                      ; 5E6A   0296
        CLRC                                    ; 5E6B   0006
        MOVR    R2,     R6                      ; 5E6C   0096
        CLRC                                    ; 5E6D   0006
        MVI     .BTAB.66,R6                     ; 5E6E   0286 0266
        BGT     L_6140                          ; 5E70   020E 02CE
        BGT     L_5BDD                          ; 5E72   022E 0296

        MVI@    R3,     R6                      ; 5E74   029E
        ADDR    R7,     R6                      ; 5E75   00FE
        DECLE   $0005                           ; 5E76   0005

        INCR    R2                              ; 5E77   000A
        INCR    R1                              ; 5E78   0009
        INCR    R2                              ; 5E79   000A
        INCR    R5                              ; 5E7A   000D
        INCR    R0                              ; 5E7B   0008
        INCR    R5                              ; 5E7C   000D
        SETC                                    ; 5E7D   0007
        INCR    R5                              ; 5E7E   000D
        SETC                                    ; 5E7F   0007
        DECLE   $0001                           ; 5E80   0001

        DIS                                     ; 5E81   0003
        DECLE   $0001,  $0001,  $0005           ; 5E82   0001 0001 0005

        INCR    R5                              ; 5E85   000D
        DECLE   $0001,  $0001,  $0001,  $0000   ; 5E86   0001 0001 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E8A   0000 0000 0000 0000
        DECLE   $0000                           ; 5E8E   0000

        NEGR    R0                              ; 5E8F   0020
        ADDR    R6,     R0                      ; 5E90   00F0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E91   0000 0000 0000 0000
        DECLE   $0000                           ; 5E95   0000

        SETC                                    ; 5E96   0007
        COMR    R7                              ; 5E97   001F
        CLRC                                    ; 5E98   0006
        DECLE   $0000,  $0000,  $0000           ; 5E99   0000 0000 0000

        DIS                                     ; 5E9C   0003
        SLLC    R3,     2                       ; 5E9D   005F
        ADDR    R3,     R4                      ; 5E9E   00DC
        ADDR    R7,     R0                      ; 5E9F   00F8
        ADDR    R7,     R0                      ; 5EA0   00F8
        DECLE   $0000,  $0001                   ; 5EA1   0000 0001

        RSWD    R7                              ; 5EA3   003F
L_5EA4:
        ADDR    R7,     R7                      ; 5EA4   00FF
        ADDR    R7,     R7                      ; 5EA5   00FF
        COMR    R7                              ; 5EA6   001F
        COMR    R7                              ; 5EA7   001F
        RSWD    R4                              ; 5EA8   003C
        DECLE   $0000                           ; 5EA9   0000

        TSTR    R0                              ; 5EAA   0080
        ADDR    R0,     R0                      ; 5EAB   00C0
        ADDR    R4,     R0                      ; 5EAC   00E0
        ADDR    R0,     R0                      ; 5EAD   00C0
        TSTR    R0                              ; 5EAE   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EAF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EB3   0000 0000 0000 0000
        DECLE   $0001                           ; 5EB7   0001

        ADDR    R3,     R7                      ; 5EB8   00DF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EB9   0000 0000 0000 0000

        DIS                                     ; 5EBD   0003
        ADCR    R7                              ; 5EBE   002F
        ADDR    R7,     R7                      ; 5EBF   00FF
        ADDR    R7,     R7                      ; 5EC0   00FF
        DECLE   $0001                           ; 5EC1   0001

        DIS                                     ; 5EC2   0003
        DIS                                     ; 5EC3   0003
        DECLE   $0001                           ; 5EC4   0001

        ADDR    R3,     R0                      ; 5EC5   00D8
        ADDR    R7,     R5                      ; 5EC6   00FD
        ADDR    R7,     R7                      ; 5EC7   00FF
        ADDR    R7,     R3                      ; 5EC8   00FB
        ADDR    R4,     R0                      ; 5EC9   00E0
        ADDR    R4,     R0                      ; 5ECA   00E0
        SWAP    R1,     1                       ; 5ECB   0041
        DIS                                     ; 5ECC   0003
        NEGR    R7                              ; 5ECD   0027
        ADDR    R7,     R7                      ; 5ECE   00FF
        ADDR    R6,     R7                      ; 5ECF   00F7
        ADDR    R4,     R3                      ; 5ED0   00E3
        INCR    R6                              ; 5ED1   000E
        SETC                                    ; 5ED2   0007
        MOVR    R0,     R7                      ; 5ED3   0087
        ADDR    R1,     R7                      ; 5ED4   00CF
        ADDR    R1,     R7                      ; 5ED5   00CF
        MOVR    R1,     R7                      ; 5ED6   008F
        ADDR    R3,     R7                      ; 5ED7   00DF
        ADDR    R3,     R4                      ; 5ED8   00DC
        ADDR    R4,     R0                      ; 5ED9   00E0
        ADDR    R0,     R0                      ; 5EDA   00C0
        MOVR    R6,     R3                      ; 5EDB   00B3
        ADDR    R7,     R7                      ; 5EDC   00FF
        ADDR    R7,     R7                      ; 5EDD   00FF
        ADDR    R7,     R6                      ; 5EDE   00FE
        ADDR    R6,     R0                      ; 5EDF   00F0
        ADDR    R7,     R0                      ; 5EE0   00F8
        INCR    R0                              ; 5EE1   0008
        SARC    R2,     2                       ; 5EE2   007E
        ADDR    R7,     R6                      ; 5EE3   00FE
        ADDR    R7,     R4                      ; 5EE4   00FC
        ADDR    R5,     R0                      ; 5EE5   00E8
        DECLE   $0000                           ; 5EE6   0000

        INCR    R4                              ; 5EE7   000C
        ADDR    R7,     R4                      ; 5EE8   00FC
        ADDR    R7,     R0                      ; 5EE9   00F8
        SARC    R1,     1                       ; 5EEA   0079
        SARC    R3,     1                       ; 5EEB   007B
        SARC    R3,     2                       ; 5EEC   007F
        SARC    R3,     1                       ; 5EED   007B
        ADDR    R7,     R3                      ; 5EEE   00FB
        ADDR    R7,     R5                      ; 5EEF   00FD
        ADDR    R7,     R0                      ; 5EF0   00F8
        ADDR    R7,     R4                      ; 5EF1   00FC
        ADDR    R0,     R0                      ; 5EF2   00C0
        TSTR    R0                              ; 5EF3   0080
        ADDR    R0,     R0                      ; 5EF4   00C0
        ADDR    R4,     R0                      ; 5EF5   00E0
        ADDR    R7,     R0                      ; 5EF6   00F8
        ADDR    R7,     R6                      ; 5EF7   00FE
        ADDR    R7,     R7                      ; 5EF8   00FF
        DIS                                     ; 5EF9   0003
        SETC                                    ; 5EFA   0007
        RSWD    R7                              ; 5EFB   003F
        RSWD    R7                              ; 5EFC   003F
        COMR    R7                              ; 5EFD   001F
        COMR    R6                              ; 5EFE   001E
        INCR    R0                              ; 5EFF   0008
        DECLE   $0000                           ; 5F00   0000

        ADDR    R3,     R7                      ; 5F01   00DF
        ADDR    R7,     R7                      ; 5F02   00FF
        ADDR    R5,     R7                      ; 5F03   00EF
        ADDR    R3,     R7                      ; 5F04   00DF
        MOVR    R3,     R7                      ; 5F05   009F
        INCR    R7                              ; 5F06   000F
        COMR    R6                              ; 5F07   001E
        RSWD    R7                              ; 5F08   003F
        MOVR    R2,     R1                      ; 5F09   0091
        DECLE   $0000                           ; 5F0A   0000

        SETC                                    ; 5F0B   0007
        INCR    R7                              ; 5F0C   000F
        RSWD    R4                              ; 5F0D   003C
        SARC    R0,     2                       ; 5F0E   007C
        ADDR    R7,     R6                      ; 5F0F   00FE
        ADDR    R7,     R7                      ; 5F10   00FF
        ADDR    R6,     R3                      ; 5F11   00F3
L_5F12:
        ADDR    R4,     R3                      ; 5F12   00E3
        ADDR    R0,     R3                      ; 5F13   00C3
        MOVR    R0,     R1                      ; 5F14   0081
        DECLE   $0001,  $0000,  $0001,  $0001   ; 5F15   0001 0000 0001 0001

        ADDR    R4,     R3                      ; 5F19   00E3
        ADDR    R4,     R1                      ; 5F1A   00E1
        ADDR    R0,     R1                      ; 5F1B   00C1
        ADDR    R0,     R3                      ; 5F1C   00C3
        ADDR    R4,     R3                      ; 5F1D   00E3
        ADDR    R4,     R3                      ; 5F1E   00E3
        ADDR    R6,     R3                      ; 5F1F   00F3
        ADDR    R6,     R3                      ; 5F20   00F3
        ADDR    R7,     R5                      ; 5F21   00FD
        ADDR    R7,     R5                      ; 5F22   00FD
        ADDR    R7,     R4                      ; 5F23   00FC
        ADDR    R7,     R0                      ; 5F24   00F8
        ADDR    R6,     R0                      ; 5F25   00F0
        ADDR    R6,     R1                      ; 5F26   00F1
        ADDR    R4,     R1                      ; 5F27   00E1
        ADDR    R4,     R0                      ; 5F28   00E0
        ADDR    R7,     R7                      ; 5F29   00FF
        ADDR    R7,     R7                      ; 5F2A   00FF
        ADDR    R6,     R7                      ; 5F2B   00F7
        ADDR    R6,     R0                      ; 5F2C   00F0
        ADDR    R7,     R0                      ; 5F2D   00F8
        ADDR    R7,     R4                      ; 5F2E   00FC
        ADDR    R7,     R4                      ; 5F2F   00FC
        ADDR    R7,     R7                      ; 5F30   00FF
        ADDR    R7,     R6                      ; 5F31   00FE
        ADDR    R7,     R6                      ; 5F32   00FE
        ADDR    R1,     R4                      ; 5F33   00CC
        DECLE   $0000                           ; 5F34   0000

        SETC                                    ; 5F35   0007
        INCR    R7                              ; 5F36   000F
        SARC    R2,     2                       ; 5F37   007E
        ADDR    R7,     R6                      ; 5F38   00FE
        ADDR    R7,     R0                      ; 5F39   00F8
        ADDR    R7,     R0                      ; 5F3A   00F8
        ADDR    R7,     R0                      ; 5F3B   00F8
        SARC    R0,     2                       ; 5F3C   007C
        SARC    R0,     2                       ; 5F3D   007C
        SARC    R0,     2                       ; 5F3E   007C
        SARC    R2,     2                       ; 5F3F   007E
        ADDR    R7,     R6                      ; 5F40   00FE
        SARC    R3,     2                       ; 5F41   007F
        SARC    R3,     2                       ; 5F42   007F
        RSWD    R7                              ; 5F43   003F
        COMR    R7                              ; 5F44   001F
        SETC                                    ; 5F45   0007
        DIS                                     ; 5F46   0003
        DECLE   $0001,  $0000                   ; 5F47   0001 0000

        ADDR    R0,     R0                      ; 5F49   00C0
        ADDR    R4,     R0                      ; 5F4A   00E0
        ADDR    R7,     R0                      ; 5F4B   00F8
        ADDR    R7,     R6                      ; 5F4C   00FE
        ADDR    R7,     R7                      ; 5F4D   00FF
        ADDR    R7,     R4                      ; 5F4E   00FC
        ADDR    R7,     R0                      ; 5F4F   00F8
        SLR     R3,     1                       ; 5F50   0063
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F51   0000 0000 0000 0000

        TSTR    R0                              ; 5F55   0080
        COMR    R0                              ; 5F56   0018
        ADDR    R7,     R7                      ; 5F57   00FF
        ADDR    R7,     R7                      ; 5F58   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F59   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5F5D   0000 0000

        ADDR    R6,     R0                      ; 5F5F   00F0
        ADDR    R7,     R7                      ; 5F60   00FF
        SARC    R3,     2                       ; 5F61   007F
        SARC    R3,     2                       ; 5F62   007F
        RSWD    R7                              ; 5F63   003F
        INCR    R7                              ; 5F64   000F
        INCR    R7                              ; 5F65   000F
        INCR    R7                              ; 5F66   000F
        COMR    R7                              ; 5F67   001F
        INCR    R7                              ; 5F68   000F
        SARC    R3,     2                       ; 5F69   007F
        SARC    R3,     2                       ; 5F6A   007F
        RSWD    R7                              ; 5F6B   003F
        SETC                                    ; 5F6C   0007
        DIS                                     ; 5F6D   0003
        DECLE   $0001,  $0000,  $0000           ; 5F6E   0001 0000 0000

        ADDR    R0,     R1                      ; 5F71   00C1
        ADDR    R4,     R3                      ; 5F72   00E3
        ADDR    R6,     R1                      ; 5F73   00F1
        ADDR    R7,     R1                      ; 5F74   00F9
        ADDR    R7,     R5                      ; 5F75   00FD
        ADDR    R7,     R6                      ; 5F76   00FE
        ADDR    R7,     R6                      ; 5F77   00FE
        SARC    R3,     2                       ; 5F78   007F
        ADDR    R6,     R3                      ; 5F79   00F3
        ADDR    R6,     R1                      ; 5F7A   00F1
        ADDR    R4,     R1                      ; 5F7B   00E1
        ADDR    R6,     R1                      ; 5F7C   00F1
        ADDR    R7,     R0                      ; 5F7D   00F8
        ADDR    R7,     R0                      ; 5F7E   00F8
        DECLE   $0000                           ; 5F7F   0000

        ADDR    R0,     R7                      ; 5F80   00C7
        ADDR    R4,     R1                      ; 5F81   00E1
        ADDR    R4,     R1                      ; 5F82   00E1
        ADDR    R4,     R1                      ; 5F83   00E1
        ADDR    R4,     R1                      ; 5F84   00E1
        ADDR    R0,     R1                      ; 5F85   00C1
        DECLE   $0000                           ; 5F86   0000

        INCR    R7                              ; 5F87   000F
        ADDR    R7,     R7                      ; 5F88   00FF
        ADDR    R7,     R7                      ; 5F89   00FF
        ADDR    R7,     R7                      ; 5F8A   00FF
        ADDR    R2,     R3                      ; 5F8B   00D3
        TSTR    R0                              ; 5F8C   0080
        COMR    R7                              ; 5F8D   001F
        SARC    R3,     2                       ; 5F8E   007F
        ADDR    R7,     R7                      ; 5F8F   00FF
        DIS                                     ; 5F90   0003
        ADDR    R7,     R5                      ; 5F91   00FD
        ADDR    R6,     R1                      ; 5F92   00F1
        DECLE   $0000,  $0000,  $0001           ; 5F93   0000 0000 0001

        ADDR    R6,     R0                      ; 5F96   00F0
        ADDR    R7,     R0                      ; 5F97   00F8
        ADDR    R7,     R0                      ; 5F98   00F8
        ADDR    R7,     R4                      ; 5F99   00FC
        ADDR    R4,     R1                      ; 5F9A   00E1
        DECLE   $0001                           ; 5F9B   0001

        ADDR    R4,     R7                      ; 5F9C   00E7
        ADDR    R7,     R7                      ; 5F9D   00FF
        ADDR    R3,     R7                      ; 5F9E   00DF
        DECR    R6                              ; 5F9F   0016
        INCR    R6                              ; 5FA0   000E
        DECLE   $0000,  $0000                   ; 5FA1   0000 0000

        MOVR    R0,     R1                      ; 5FA3   0081
        MOVR    R0,     R3                      ; 5FA4   0083
        ADDR    R0,     R0                      ; 5FA5   00C0
        ADDR    R0,     R0                      ; 5FA6   00C0
        ADDR    R0,     R1                      ; 5FA7   00C1
        ADDR    R0,     R1                      ; 5FA8   00C1
        SETC                                    ; 5FA9   0007
        SLR     R3,     2                       ; 5FAA   0067
        ADDR    R4,     R7                      ; 5FAB   00E7
        ADDR    R4,     R0                      ; 5FAC   00E0
        ADDR    R6,     R0                      ; 5FAD   00F0
        ADDR    R6,     R1                      ; 5FAE   00F1
        ADDR    R6,     R0                      ; 5FAF   00F0
        ADDR    R6,     R0                      ; 5FB0   00F0
        ADDR    R7,     R4                      ; 5FB1   00FC
        ADDR    R7,     R4                      ; 5FB2   00FC
        ADDR    R7,     R4                      ; 5FB3   00FC
        ADDR    R7,     R0                      ; 5FB4   00F8
        ADDR    R6,     R0                      ; 5FB5   00F0
        ADDR    R6,     R0                      ; 5FB6   00F0
        ADDR    R6,     R0                      ; 5FB7   00F0
        RRC     R0,     1                       ; 5FB8   0070
        ADDR    R7,     R7                      ; 5FB9   00FF
        RSWD    R7                              ; 5FBA   003F
        INCR    R7                              ; 5FBB   000F
        INCR    R7                              ; 5FBC   000F
        SETC                                    ; 5FBD   0007
        SETC                                    ; 5FBE   0007
        DIS                                     ; 5FBF   0003
        DIS                                     ; 5FC0   0003
        ADDR    R7,     R4                      ; 5FC1   00FC
        ADDR    R7,     R6                      ; 5FC2   00FE
        ADDR    R7,     R6                      ; 5FC3   00FE
        ADDR    R7,     R6                      ; 5FC4   00FE
        ADDR    R7,     R6                      ; 5FC5   00FE
        ADDR    R7,     R4                      ; 5FC6   00FC
        ADDR    R6,     R0                      ; 5FC7   00F0
        ADDR    R4,     R0                      ; 5FC8   00E0
        INCR    R7                              ; 5FC9   000F
        INCR    R7                              ; 5FCA   000F
        INCR    R7                              ; 5FCB   000F
        COMR    R7                              ; 5FCC   001F
        COMR    R7                              ; 5FCD   001F
        COMR    R7                              ; 5FCE   001F
        COMR    R7                              ; 5FCF   001F
        COMR    R7                              ; 5FD0   001F
        ADDR    R0,     R0                      ; 5FD1   00C0
        ADDR    R0,     R0                      ; 5FD2   00C0
        ADDR    R4,     R0                      ; 5FD3   00E0
        ADDR    R4,     R0                      ; 5FD4   00E0
        ADDR    R4,     R0                      ; 5FD5   00E0
        ADDR    R4,     R0                      ; 5FD6   00E0
        ADDR    R4,     R0                      ; 5FD7   00E0
        ADDR    R0,     R0                      ; 5FD8   00C0
        RSWD    R7                              ; 5FD9   003F
        RSWD    R7                              ; 5FDA   003F
        INCR    R7                              ; 5FDB   000F
        SETC                                    ; 5FDC   0007
        DECLE   $0001,  $0001,  $0000,  $0000   ; 5FDD   0001 0001 0000 0000

        ADDR    R6,     R0                      ; 5FE1   00F0
        ADDR    R7,     R0                      ; 5FE2   00F8
        ADDR    R7,     R6                      ; 5FE3   00FE
        ADDR    R7,     R4                      ; 5FE4   00FC
        ADDR    R7,     R1                      ; 5FE5   00F9
        ADDR    R6,     R1                      ; 5FE6   00F1
        ADDR    R4,     R3                      ; 5FE7   00E3
        SETC                                    ; 5FE8   0007
        ADDR    R6,     R0                      ; 5FE9   00F0
        ADDR    R7,     R0                      ; 5FEA   00F8
        COMR    R0                              ; 5FEB   0018
        SARC    R3,     2                       ; 5FEC   007F
        SARC    R3,     2                       ; 5FED   007F
        ADDR    R7,     R5                      ; 5FEE   00FD
        ADDR    R7,     R4                      ; 5FEF   00FC
        RSWD    R4                              ; 5FF0   003C
        DECLE   $0001,  $0001                   ; 5FF1   0001 0001

        SETC                                    ; 5FF3   0007
        MOVR    R3,     R6                      ; 5FF4   009E
        ADDR    R6,     R0                      ; 5FF5   00F0
        ADDR    R4,     R0                      ; 5FF6   00E0
        ADDR    R7,     R0                      ; 5FF7   00F8
        ADDR    R7,     R4                      ; 5FF8   00FC
        ADDR    R7,     R0                      ; 5FF9   00F8
        ADDR    R4,     R0                      ; 5FFA   00E0
        ADDR    R4,     R0                      ; 5FFB   00E0
        SETC                                    ; 5FFC   0007
        INCR    R7                              ; 5FFD   000F
        INCR    R7                              ; 5FFE   000F
        INCR    R5                              ; 5FFF   000D
        DECLE   $0001                           ; 6000   0001

        INCR    R4                              ; 6001   000C
        COMR    R4                              ; 6002   001C
        RSWD    R0                              ; 6003   0038
        ADDR    R7,     R3                      ; 6004   00FB
        ADDR    R7,     R7                      ; 6005   00FF
        ADDR    R7,     R4                      ; 6006   00FC
        ADDR    R6,     R0                      ; 6007   00F0
        ADDR    R6,     R0                      ; 6008   00F0
        ADDR    R4,     R0                      ; 6009   00E0
        SLR     R2,     2                       ; 600A   0066
        SAR     R2,     2                       ; 600B   006E
        ADDR    R7,     R6                      ; 600C   00FE
        RRC     R0,     1                       ; 600D   0070
        RSWD    R1                              ; 600E   0039
        SARC    R1,     1                       ; 600F   0079
        SARC    R1,     1                       ; 6010   0079
        ADDR    R4,     R0                      ; 6011   00E0
        ADDR    R4,     R0                      ; 6012   00E0
        ADDR    R6,     R1                      ; 6013   00F1
        ADDR    R6,     R1                      ; 6014   00F1
        ADDR    R6,     R1                      ; 6015   00F1
        ADDR    R6,     R1                      ; 6016   00F1
        ADDR    R6,     R3                      ; 6017   00F3
        ADDR    R4,     R7                      ; 6018   00E7
        RRC     R0,     1                       ; 6019   0070
        ADDR    R6,     R0                      ; 601A   00F0
        ADDR    R6,     R0                      ; 601B   00F0
        ADDR    R0,     R0                      ; 601C   00C0
        ADDR    R0,     R3                      ; 601D   00C3
        ADDR    R4,     R7                      ; 601E   00E7
        ADDR    R4,     R7                      ; 601F   00E7
        ADDR    R4,     R7                      ; 6020   00E7
        DIS                                     ; 6021   0003
        SETC                                    ; 6022   0007
        INCR    R7                              ; 6023   000F
        RSWD    R6                              ; 6024   003E
        ADDR    R7,     R4                      ; 6025   00FC
        ADDR    R4,     R1                      ; 6026   00E1
        ADDR    R0,     R0                      ; 6027   00C0
        TSTR    R0                              ; 6028   0080
        ADDR    R4,     R0                      ; 6029   00E0
        TSTR    R0                              ; 602A   0080
        DECLE   $0000,  $0000,  $0000           ; 602B   0000 0000 0000

        ADDR    R3,     R3                      ; 602E   00DB
        MOVR    R2,     R5                      ; 602F   0095
        MOVR    R2,     R1                      ; 6030   0091
        COMR    R7                              ; 6031   001F
        COMR    R6                              ; 6032   001E
        INCR    R4                              ; 6033   000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6034   0000 0000 0000 0000
        DECLE   $0000                           ; 6038   0000

        RSWD    R6                              ; 6039   003E
        RSWD    R6                              ; 603A   003E
        SARC    R0,     2                       ; 603B   007C
        SARC    R2,     2                       ; 603C   007E
        SARC    R2,     2                       ; 603D   007E
        SARC    R2,     2                       ; 603E   007E
        ADDR    R7,     R6                      ; 603F   00FE
        ADDR    R7,     R6                      ; 6040   00FE
        DIS                                     ; 6041   0003
L_6042:
        MOVR    R1,     R7                      ; 6042   008F
        MOVR    R1,     R7                      ; 6043   008F
        ADDR    R5,     R7                      ; 6044   00EF
        ADDR    R6,     R3                      ; 6045   00F3
        ADDR    R7,     R1                      ; 6046   00F9
        ADDR    R7,     R6                      ; 6047   00FE
        ADDR    R7,     R7                      ; 6048   00FF
        ADDR    R4,     R0                      ; 6049   00E0
        ADDR    R4,     R0                      ; 604A   00E0
        ADDR    R0,     R0                      ; 604B   00C0
        ADDR    R0,     R0                      ; 604C   00C0
        TSTR    R0                              ; 604D   0080
        TSTR    R0                              ; 604E   0080
        DECLE   $0000                           ; 604F   0000

        TSTR    R0                              ; 6050   0080
        SARC    R1,     2                       ; 6051   007D
        SARC    R1,     2                       ; 6052   007D
        SARC    R0,     2                       ; 6053   007C
        RSWD    R6                              ; 6054   003E
        SARC    R0,     2                       ; 6055   007C
        RRC     R0,     1                       ; 6056   0070
        NEGR    R0                              ; 6057   0020
        DECLE   $0000                           ; 6058   0000

        ADDR    R6,     R7                      ; 6059   00F7
        ADDR    R4,     R7                      ; 605A   00E7
        SLR     R3,     1                       ; 605B   0063
        DECLE   $0001,  $0000,  $0000,  $0000   ; 605C   0001 0000 0000 0000
        DECLE   $0000                           ; 6060   0000

        ADDR    R6,     R7                      ; 6061   00F7
        ADDR    R5,     R6                      ; 6062   00EE
        ADDR    R5,     R4                      ; 6063   00EC
        ADDR    R4,     R0                      ; 6064   00E0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6065   0000 0000 0000 0000

        ADDR    R7,     R7                      ; 6069   00FF
        SARC    R3,     2                       ; 606A   007F
        SARC    R3,     2                       ; 606B   007F
        ADDR    R7,     R6                      ; 606C   00FE
        ADDR    R7,     R0                      ; 606D   00F8
        ADDR    R6,     R0                      ; 606E   00F0
        ADDR    R0,     R0                      ; 606F   00C0
        TSTR    R0                              ; 6070   0080
        ADDR    R7,     R7                      ; 6071   00FF
        SARC    R3,     2                       ; 6072   007F
        RSWD    R6                              ; 6073   003E
        COMR    R0                              ; 6074   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6075   0000 0000 0000 0000
L_6079:
        MVI     G_0308, R3                      ; 6079   0283 0308
        SWAP    R3,     1                       ; 607B   0043
        ANDI    #$00FF, R3                      ; 607C   03BB 00FF
        CLRR    R0                              ; 607E   01C0
        MVII    #$00FF, R1                      ; 607F   02B9 00FF
        MOVR    R1,     R2                      ; 6081   008A
        SUBI    #$0005, R3                      ; 6082   033B 0005
        BPL     L_6096                          ; 6084   0203 0010

        ADDI    #$0008, R3                      ; 6086   02FB 0008
        ADDR    R7,     R3                      ; 6088   00FB
        ADDI    #$0005, R3                      ; 6089   02FB 0005
        MVI@    R3,     R0                      ; 608B   0298
        B       L_60A7                          ; 608C   0200 0019

        ADDR    R7,     R7                      ; 608E   00FF
        SARC    R3,     2                       ; 608F   007F
        RSWD    R7                              ; 6090   003F
        COMR    R7                              ; 6091   001F
        INCR    R7                              ; 6092   000F
        SETC                                    ; 6093   0007
        DIS                                     ; 6094   0003
        DECLE   $0001                           ; 6095   0001
L_6096:
        CMPI    #$0008, R3                      ; 6096   037B 0008
        BPL     L_60A0                          ; 6098   0203 0006

        ADDR    R7,     R3                      ; 609A   00FB
        SUBI    #$000D, R3                      ; 609B   033B 000D
        MVI@    R3,     R1                      ; 609D   0299
        B       L_60A7                          ; 609E   0200 0007

L_60A0:
        CLRR    R1                              ; 60A0   01C9
        SUBI    #$0008, R3                      ; 60A1   033B 0008
        ADDR    R7,     R3                      ; 60A3   00FB
        SUBI    #$0016, R3                      ; 60A4   033B 0016
        MVI@    R3,     R2                      ; 60A6   029A
L_60A7:
        XORI    #$00C0, R0                      ; 60A7   03F8 00C0
        ANDI    #$00F7, R1                      ; 60A9   03B9 00F7
        ANDI    #$00FD, R2                      ; 60AB   03BA 00FD
        MVO     R0,     G_014D                  ; 60AD   0240 014D
        MVO     R1,     G_015D                  ; 60AF   0241 015D
        MVO     R2,     G_016D                  ; 60B1   0242 016D
        MOVR    R5,     R7                      ; 60B3   00AF
L_60B4:
        PSHR    R5                              ; 60B4   0275
        MVII    #$034B, R4                      ; 60B5   02BC 034B
        MVII    #$018C, R5                      ; 60B7   02BD 018C
L_60B9:
        CLRR    R0                              ; 60B9   01C0
        MVI@    R4,     R1                      ; 60BA   02A1
        SDBD                                    ; 60BB   0001
        CMPI    #$08D6, R1                      ; 60BC   0379 00D6 0008
        BEQ     L_60CD                          ; 60BF   0204 000C

        INCR    R0                              ; 60C1   0008
        SDBD                                    ; 60C2   0001
        CMPI    #$1861, R1                      ; 60C3   0379 0061 0018
        BEQ     L_60CD                          ; 60C6   0204 0005

        CLRR    R0                              ; 60C8   01C0
        MVO@    R0,     R5                      ; 60C9   0268
        INCR    R5                              ; 60CA   000D
        B       L_60F4                          ; 60CB   0200 0027

L_60CD:
        SUBI    #$0009, R4                      ; 60CD   033C 0009
        MVI@    R4,     R1                      ; 60CF   02A1
        MOVR    R1,     R3                      ; 60D0   008B
        ANDI    #$007F, R1                      ; 60D1   03B9 007F
        SLR     R1,     1                       ; 60D3   0061
        MOVR    R1,     R2                      ; 60D4   008A
        SLL     R1,     2                       ; 60D5   004D
L_60D6:
        ADDR    R2,     R1                      ; 60D6   00D1
        SUBI    #$0009, R4                      ; 60D7   033C 0009
        MVI@    R4,     R2                      ; 60D9   02A2
        ANDI    #$00FF, R2                      ; 60DA   03BA 00FF
        TSTR    R0                              ; 60DC   0080
        BEQ     L_60E5                          ; 60DD   0204 0006

        SDBD                                    ; 60DF   0001
        ANDI    #$0400, R3                      ; 60E0   03BB 0000 0004
        SWAP    R3,     1                       ; 60E3   0043
        ADDR    R3,     R2                      ; 60E4   00DA
L_60E5:
        PSHR    R2                              ; 60E5   0272
        SLR     R2,     2                       ; 60E6   0066
        SLR     R2,     1                       ; 60E7   0062
        ADDR    R2,     R1                      ; 60E8   00D1
        SUBI    #$0016, R1                      ; 60E9   0339 0016
        PULR    R2                              ; 60EB   02B2
        ANDI    #$0007, R2                      ; 60EC   03BA 0007
        SARC    R0,     1                       ; 60EE   0078
        RLC     R2,     1                       ; 60EF   0052
        MVO@    R1,     R5                      ; 60F0   0269
        MVO@    R2,     R5                      ; 60F1   026A
        ADDI    #$0010, R4                      ; 60F2   02FC 0010
L_60F4:
        CMPI    #$034F, R4                      ; 60F4   037C 034F
        BNEQ    L_60B9                          ; 60F6   022C 003E

        PULR    R7                              ; 60F8   02B7
L_60F9:
        PSHR    R5                              ; 60F9   0275
        MVI     G_011E, R0                      ; 60FA   0280 011E
        TSTR    R0                              ; 60FC   0080
        BEQ     L_6118                          ; 60FD   0204 0019

        MVI     G_01A9, R0                      ; 60FF   0280 01A9
        TSTR    R0                              ; 6101   0080
        BNEQ    L_6118                          ; 6102   020C 0014

        MVII    #$0343, R4                      ; 6104   02BC 0343
        MOVR    R4,     R5                      ; 6106   00A5
        MVII    #$0005, R3                      ; 6107   02BB 0005
L_6109:
        MVI@    R4,     R0                      ; 6109   02A0
        ADDI    #$0008, R0                      ; 610A   02F8 0008
        MVO@    R0,     R5                      ; 610C   0268
        DECR    R3                              ; 610D   0013
        BNEQ    L_6109                          ; 610E   022C 0006

        ANDI    #$007F, R0                      ; 6110   03B8 007F
        CMPI    #$0068, R0                      ; 6112   0378 0068
        BMI     L_6118                          ; 6114   020B 0002

        MVO     R3,     G_033F                  ; 6116   0243 033F
L_6118:
        PULR    R7                              ; 6118   02B7
L_6119:
        PSHR    R5                              ; 6119   0275
        MVI     G_0108, R1                      ; 611A   0281 0108
        CMPI    #$0006, R1                      ; 611C   0379 0006
        BPL     L_63B5                          ; 611E   0203 0295

        ADDR    R7,     R1                      ; 6120   00F9
        ADDI    #$0003, R1                      ; 6121   02F9 0003
        ADD@    R1,     R7                      ; 6123   02CF
        MVI@    R2,     R1                      ; 6124   0291
        MVI@    R2,     R1                      ; 6125   0291
        MVI@    R2,     R1                      ; 6126   0291
        CLRC                                    ; 6127   0006
        COMR    R0                              ; 6128   0018
        SAR     R2,     2                       ; 6129   006E
        MVII    #$0324, R4                      ; 612A   02BC 0324
        MVII    #$0010, R0                      ; 612C   02B8 0010

        JSR     R5,     X_FILL_ZERO             ; 612E   0004 0114 0338

        CLRR    R1                              ; 6131   01C9

        JSR     R4,     L_5AEA                  ; 6132   0004 0058 02EA

        MVII    #$0001, R1                      ; 6135   02B9 0001

        JSR     R4,     L_5AEA                  ; 6137   0004 0058 02EA

        B       L_63B5                          ; 613A   0200 0279

        MVII    #$0324, R5                      ; 613C   02BD 0324
        MVII    #$0010, R1                      ; 613E   02B9 0010
L_6140:
        MVI@    R5,     R0                      ; 6140   02A8
        MOVR    R0,     R2                      ; 6141   0082
        BNEQ    L_6157                          ; 6142   020C 0013

        JSR     R4,     L_5A97                  ; 6144   0004 0058 0297

        RRC     R0,     2                       ; 6147   0074
        MOVR    R0,     R3                      ; 6148   0083
        MVII    #$0040, R0                      ; 6149   02B8 0040
        SWAP    R0,     1                       ; 614B   0040
        BESC    L_617C                          ; 614C   020F 002E

        MOVR    R3,     R0                      ; 614E   0098
        ANDI    #$0008, R0                      ; 614F   03B8 0008
        SDBD                                    ; 6151   0001
        ADDI    #$18E6, R0                      ; 6152   02F8 00E6 0018
        B       L_617C                          ; 6155   0200 0025

L_6157:
        ANDI    #$0007, R2                      ; 6157   03BA 0007
        BEQ     L_617E                          ; 6159   0204 0023

        MOVR    R0,     R2                      ; 615B   0082
        SDBD                                    ; 615C   0001
        ANDI    #$2007, R2                      ; 615D   03BA 0007 0020
        ANDI    #$01F8, R0                      ; 6160   03B8 01F8
        BEQ     L_616F                          ; 6162   0204 000B

        SUBI    #$0059, R0                      ; 6164   0338 0059
        BMI     L_617E                          ; 6166   020B 0016

        CMPI    #$0028, R0                      ; 6168   0378 0028
        BPL     L_617E                          ; 616A   0203 0012

        INCR    R0                              ; 616C   0008
        SLR     R0,     2                       ; 616D   0064
        SLR     R0,     1                       ; 616E   0060

L_616F:
        JSR     R4,     L_6178                  ; 616F   0004 0060 0178

        MVI@    R2,     R4                      ; 6172   0294
        BEQ     L_6381                          ; 6173   0204 020C

        DECLE   $0214,  $021C,  $027C           ; 6175   0214 021C 027C
L_6178:
        ADDR    R0,     R4                      ; 6178   00C4
        MVI@    R4,     R0                      ; 6179   02A0
        SLL     R0,     1                       ; 617A   0048
        XORR    R2,     R0                      ; 617B   01D0
L_617C:
        DECR    R5                              ; 617C   0015
        MVO@    R0,     R5                      ; 617D   0268
L_617E:
        DECR    R1                              ; 617E   0011
        BNEQ    L_6140                          ; 617F   022C 0040

        JSR     R4,     L_5A97                  ; 6181   0004 0058 0297

        ANDI    #$0008, R0                      ; 6184   03B8 0008
        SDBD                                    ; 6186   0001
        ADDI    #$18E6, R0                      ; 6187   02F8 00E6 0018
        MVO     R0,     G_0324                  ; 618A   0240 0324
        XORI    #$0008, R0                      ; 618C   03F8 0008
        MVO     R0,     G_0333                  ; 618E   0240 0333
        B       L_63B5                          ; 6190   0200 0223

        MVI     G_0117, R0                      ; 6192   0280 0117
        DECR    R0                              ; 6194   0010
        BNEQ    L_63B5                          ; 6195   020C 021E

        MVII    #$0324, R4                      ; 6197   02BC 0324
        MVII    #$0080, R2                      ; 6199   02BA 0080
        SWAP    R2,     1                       ; 619B   0042
L_619C:
        MVI@    R4,     R0                      ; 619C   02A0
        CMPR    R2,     R0                      ; 619D   0150
        BNEQ    L_619C                          ; 619E   022C 0003

L_61A0:
        MOVR    R4,     R0                      ; 61A0   00A0
        SUBI    #$0324, R0                      ; 61A1   0338 0324
        MVO     R0,     G_011B                  ; 61A3   0240 011B
L_61A5:
        MVI@    R4,     R1                      ; 61A5   02A1
        CMPR    R2,     R1                      ; 61A6   0151
        BEQ     L_61A5                          ; 61A7   0224 0003

        MOVR    R4,     R1                      ; 61A9   00A1
        SUBI    #$0325, R1                      ; 61AA   0339 0325
        CMPR    R0,     R1                      ; 61AC   0141
        BEQ     L_619C                          ; 61AD   0224 0012

        MVO     R1,     G_011C                  ; 61AF   0241 011C
L_61B1:
        CMPI    #$0334, R4                      ; 61B1   037C 0334
        BEQ     L_61C7                          ; 61B3   0204 0012

        MVI@    R4,     R0                      ; 61B5   02A0
        CMPR    R2,     R0                      ; 61B6   0150
        BNEQ    L_61B1                          ; 61B7   022C 0007

        MVI     G_01AE, R0                      ; 61B9   0280 01AE
        CMPI    #$0002, R0                      ; 61BB   0378 0002
        BEQ     L_61C7                          ; 61BD   0204 0008

        PSHR    R4                              ; 61BF   0274

        JSR     R4,     L_5A97                  ; 61C0   0004 0058 0297

        PULR    R4                              ; 61C3   02B4
        RRC     R0,     2                       ; 61C4   0074
        BESC    L_61A0                          ; 61C5   022F 0026

L_61C7:
        MVI     G_0102, R0                      ; 61C7   0280 0102
        INCR    R0                              ; 61C9   0008
        MVO     R0,     G_0102                  ; 61CA   0240 0102
        CMPI    #$0020, R0                      ; 61CC   0378 0020
        BMI     L_62DE                          ; 61CE   020B 010E

        MVI     G_01AA, R0                      ; 61D0   0280 01AA
        SLR     R0,     1                       ; 61D2   0060
        MVI     G_01AB, R1                      ; 61D3   0281 01AB
        SLR     R1,     1                       ; 61D5   0061
        SUBR    R1,     R0                      ; 61D6   0108
        BPL     L_61DD                          ; 61D7   0203 0004

        ADD     G_01AE, R0                      ; 61D9   02C0 01AE
        B       L_61E0                          ; 61DB   0200 0003

L_61DD:
        SUB     G_01AF, R0                      ; 61DD   0300 01AF
        NEGR    R0                              ; 61DF   0020
L_61E0:
        CMPI    #$0002, R0                      ; 61E0   0378 0002
        BMI     L_62DE                          ; 61E2   020B 00FA

        MVI     G_033F, R0                      ; 61E4   0280 033F
        TSTR    R0                              ; 61E6   0080
        BNEQ    L_62DE                          ; 61E7   020C 00F5

        MVO     R0,     G_0102                  ; 61E9   0240 0102
        MVII    #$00FF, R0                      ; 61EB   02B8 00FF
        MVO     R0,     G_0118                  ; 61ED   0240 0118
        MVII    #$0008, R0                      ; 61EF   02B8 0008
        MVII    #$01AA, R4                      ; 61F1   02BC 01AA
        MVII    #$01B2, R1                      ; 61F3   02B9 01B2

        JSR     R5,     .EXEC.730               ; 61F5   0004 0114 0330

        MVI     G_0336, R0                      ; 61F8   0280 0336
        MVO     R0,     G_0337                  ; 61FA   0240 0337
        MVI     G_0335, R0                      ; 61FC   0280 0335
        SDBD                                    ; 61FE   0001
        CMPI    #$53B1, R0                      ; 61FF   0378 00B1 0053
        BEQ     L_6262                          ; 6202   0204 005E

        JSR     R4,     L_5A97                  ; 6204   0004 0058 0297

        ANDI    #$0002, R0                      ; 6207   03B8 0002
        DECR    R0                              ; 6209   0010
        MOVR    R0,     R3                      ; 620A   0083
        ADD     G_01B0, R0                      ; 620B   02C0 01B0
        CMP     G_01B1, R0                      ; 620D   0340 01B1
        BPL     L_6216                          ; 620F   0203 0005

L_6211:
        SUBR    R3,     R0                      ; 6211   0118
        SUBR    R3,     R0                      ; 6212   0118
        NEGR    R3                              ; 6213   0023
        B       L_621A                          ; 6214   0200 0004

L_6216:
        CMPI    #$0006, R0                      ; 6216   0378 0006
        BPL     L_6211                          ; 6218   0223 0008

L_621A:
        MOVR    R0,     R2                      ; 621A   0082
        ANDI    #$0001, R2                      ; 621B   03BA 0001
        TSTR    R3                              ; 621D   009B
        BMI     L_6222                          ; 621E   020B 0002

        XORI    #$0001, R2                      ; 6220   03FA 0001
L_6222:
        MVII    #$01AA, R1                      ; 6222   02B9 01AA
        ADDR    R2,     R1                      ; 6224   00D1
        MVI@    R1,     R1                      ; 6225   0289
        SLR     R1,     1                       ; 6226   0061
        ADDI    #$0326, R1                      ; 6227   02F9 0326
        PSHR    R1                              ; 6229   0271
        MVI@    R1,     R0                      ; 622A   0288
        SDBD                                    ; 622B   0001
        CMPI    #$8000, R0                      ; 622C   0378 0000 0080
        BNEQ    L_6244                          ; 622F   020C 0013

        ADDR    R3,     R1                      ; 6231   00D9
        MVI@    R1,     R0                      ; 6232   0288
        SDBD                                    ; 6233   0001
        CMPI    #$8000, R0                      ; 6234   0378 0000 0080
        BNEQ    L_6244                          ; 6237   020C 000B

        PULR    R1                              ; 6239   02B1
        ADDI    #$01AA, R2                      ; 623A   02FA 01AA
        MOVR    R3,     R0                      ; 623C   0098
        SLL     R0,     1                       ; 623D   0048
        ADD@    R2,     R0                      ; 623E   02D0
        MVO@    R0,     R2                      ; 623F   0250
        SUBI    #$01AA, R2                      ; 6240   033A 01AA
        B       L_6258                          ; 6242   0200 0014

L_6244:
        MVII    #$01AE, R1                      ; 6244   02B9 01AE
        ADDR    R2,     R1                      ; 6246   00D1
        MVI@    R1,     R1                      ; 6247   0289
        ADD@    R6,     R1                      ; 6248   02F1
        MVI@    R1,     R0                      ; 6249   0288
        SDBD                                    ; 624A   0001
        CMPI    #$8000, R0                      ; 624B   0378 0000 0080
        BNEQ    L_6262                          ; 624E   020C 0012

        SUBR    R3,     R1                      ; 6250   0119
        MVI@    R1,     R0                      ; 6251   0288
        SDBD                                    ; 6252   0001
        CMPI    #$8000, R0                      ; 6253   0378 0000 0080
        BNEQ    L_6262                          ; 6256   020C 000A

L_6258:
        MVI     G_01B0, R0                      ; 6258   0280 01B0
        ADDR    R3,     R0                      ; 625A   00D8
        MVO     R0,     G_01B0                  ; 625B   0240 01B0
        ADDI    #$01AE, R2                      ; 625D   02FA 01AE
        MVI@    R2,     R0                      ; 625F   0290
        SUBR    R3,     R0                      ; 6260   0118
        MVO@    R0,     R2                      ; 6261   0250
L_6262:
        MVI     G_011B, R0                      ; 6262   0280 011B
        DECR    R0                              ; 6264   0010
        SLL     R0,     2                       ; 6265   004C
        SLL     R0,     1                       ; 6266   0048
        XORI    #$0200, R0                      ; 6267   03F8 0200
        MVO     R0,     G_030A                  ; 6269   0240 030A
        MVII    #$0108, R0                      ; 626B   02B8 0108
        MVO     R0,     G_030B                  ; 626D   0240 030B
        SDBD                                    ; 626F   0001
        MVII    #$0508, R0                      ; 6270   02B8 0008 0005
        MVO     R0,     G_030E                  ; 6273   0240 030E
        SDBD                                    ; 6275   0001
        MVII    #$08A0, R0                      ; 6276   02B8 00A0 0008
        MVO     R0,     G_030C                  ; 6279   0240 030C
        MVO     R0,     G_030F                  ; 627B   0240 030F
        MVI     G_011C, R0                      ; 627D   0280 011C
        INCR    R0                              ; 627F   0008
        SLL     R0,     2                       ; 6280   004C
        SLL     R0,     1                       ; 6281   0048
        XORI    #$0200, R0                      ; 6282   03F8 0200
        MVO     R0,     G_030D                  ; 6284   0240 030D
        SDBD                                    ; 6286   0001
        MVII    #$0658, R0                      ; 6287   02B8 0058 0006
        MVII    #$0324, R4                      ; 628A   02BC 0324
        MVI     G_011B, R1                      ; 628C   0281 011B
        SUBI    #$0003, R1                      ; 628E   0339 0003
L_6290:
        MVO@    R0,     R4                      ; 6290   0260
        DECR    R1                              ; 6291   0011
        BNEQ    L_6290                          ; 6292   022C 0003

        ADDI    #$0240, R0                      ; 6294   02F8 0240
        MVO@    R0,     R4                      ; 6296   0260
        INCR    R4                              ; 6297   000C
        MVI     G_011C, R1                      ; 6298   0281 011C
        SUB     G_011B, R1                      ; 629A   0301 011B
        INCR    R1                              ; 629C   0009
        MVI     G_0335, R2                      ; 629D   0282 0335
        SDBD                                    ; 629F   0001
        CMPI    #$53B1, R2                      ; 62A0   037A 00B1 0053
        BNEQ    L_62BA                          ; 62A3   020C 0015

        ADDR    R1,     R4                      ; 62A5   00CC
        SUBI    #$0008, R0                      ; 62A6   0338 0008
        MVO     R0,     G_030C                  ; 62A8   0240 030C
        MVO     R0,     G_030F                  ; 62AA   0240 030F
        ADDI    #$0010, R0                      ; 62AC   02F8 0010
        MVI     G_030D, R2                      ; 62AE   0282 030D
        SUB     G_030A, R2                      ; 62B0   0302 030A
        SLR     R2,     1                       ; 62B2   0062
        ADD     G_030A, R2                      ; 62B3   02C2 030A
        SWAP    R2,     1                       ; 62B5   0042
        MVO     R2,     G_0310                  ; 62B6   0242 0310
L_62B8:
        B       L_62C0                          ; 62B8   0200 0006

L_62BA:
        ADDI    #$0008, R0                      ; 62BA   02F8 0008
L_62BC:
        MVO@    R0,     R4                      ; 62BC   0260
        DECR    R1                              ; 62BD   0011
        BNEQ    L_62BC                          ; 62BE   022C 0003

L_62C0:
        INCR    R4                              ; 62C0   000C
        ADDI    #$0008, R0                      ; 62C1   02F8 0008
        MVI@    R4,     R2                      ; 62C3   02A2
        DECR    R4                              ; 62C4   0014
        SDBD                                    ; 62C5   0001
        ANDI    #$2000, R2                      ; 62C6   03BA 0000 0020
        XORR    R2,     R0                      ; 62C9   01D0
        MVO@    R0,     R4                      ; 62CA   0260
        XORR    R2,     R0                      ; 62CB   01D0
        SUBI    #$0250, R0                      ; 62CC   0338 0250
L_62CE:
        MVO@    R0,     R4                      ; 62CE   0260
        CMPI    #$0334, R4                      ; 62CF   037C 0334
        BNEQ    L_62CE                          ; 62D1   022C 0004

        MVII    #$00FF, R0                      ; 62D3   02B8 00FF
        MVO     R0,     G_010F                  ; 62D5   0240 010F
        B       L_63B5                          ; 62D7   0200 00DC

        DIS                                     ; 62D9   0003
        INCR    R2                              ; 62DA   000A
        INCR    R7                              ; 62DB   000F
        COMR    R6                              ; 62DC   001E
        NEGR    R0                              ; 62DD   0020

L_62DE:
        JSR     R4,     L_5A97                  ; 62DE   0004 0058 0297

        SARC    R0,     1                       ; 62E1   0078
        CLRR    R2                              ; 62E2   01D2
        RLC     R2,     1                       ; 62E3   0052
        MVO     R2,     G_011A                  ; 62E4   0242 011A
        ANDI    #$001F, R0                      ; 62E6   03B8 001F
        MOVR    R7,     R4                      ; 62E8   00BC
        SUBI    #$0010, R4                      ; 62E9   033C 0010
        CLRR    R1                              ; 62EB   01C9
        DECR    R1                              ; 62EC   0011
L_62ED:
        INCR    R1                              ; 62ED   0009
        CMP@    R4,     R0                      ; 62EE   0360
        BPL     L_62ED                          ; 62EF   0223 0003

        MVO     R1,     G_0119                  ; 62F1   0241 0119
        MVII    #$030A, R4                      ; 62F3   02BC 030A
        ADDR    R7,     R1                      ; 62F5   00F9
        ADDI    #$0003, R1                      ; 62F6   02F9 0003
L_62F8:
        ADD@    R1,     R7                      ; 62F8   02CF
        DECLE   $0005                           ; 62F9   0005

        SWAP    R0,     1                       ; 62FA   0040
        DECLE   $0035                           ; 62FB   0035

        SARC    R1,     1                       ; 62FC   0079
        MOVR    R6,     R3                      ; 62FD   00B3
        MVII    #$0017, R0                      ; 62FE   02B8 0017
        PSHR    R4                              ; 6300   0274

        JSR     R4,     L_5A80                  ; 6301   0004 0058 0280

        PULR    R4                              ; 6304   02B4
        ADDI    #$0368, R0                      ; 6305   02F8 0368
        MVO@    R0,     R4                      ; 6307   0260
        SDBD                                    ; 6308   0001
        MVII    #$040B, R0                      ; 6309   02B8 000B 0004
        MVO@    R0,     R4                      ; 630C   0260
        MVII    #$0008, R0                      ; 630D   02B8 0008
        SWAP    R0,     1                       ; 630F   0040
        MVO@    R0,     R4                      ; 6310   0260
        CLRR    R0                              ; 6311   01C0
        MVO     R0,     G_010F                  ; 6312   0240 010F
        MVO     R0,     G_0118                  ; 6314   0240 0118
        INCR    R0                              ; 6316   0008
        MVO     R0,     G_011A                  ; 6317   0240 011A
        MVII    #$0324, R4                      ; 6319   02BC 0324
        MVII    #$0010, R3                      ; 631B   02BB 0010
        MVII    #$0040, R1                      ; 631D   02B9 0040
        SWAP    R1,     1                       ; 631F   0041
L_6320:
        MVI@    R4,     R0                      ; 6320   02A0
        ANDI    #$0007, R0                      ; 6321   03B8 0007
        CMPI    #$0006, R0                      ; 6323   0378 0006
        BNEQ    L_6329                          ; 6325   020C 0002

        DECR    R4                              ; 6327   0014
        MVO@    R1,     R4                      ; 6328   0261
L_6329:
        DECR    R3                              ; 6329   0013
        BNEQ    L_6320                          ; 632A   022C 000B
        B       L_63B5                          ; 632C   0200 0087

        MVI     G_011B, R1                      ; 632E   0281 011B
        MVI     G_011C, R0                      ; 6330   0280 011C
        DECR    R0                              ; 6332   0010
        CMPR    R1,     R0                      ; 6333   0148
        BLE     L_62DE                          ; 6334   0226 0057

        MOVR    R7,     R3                      ; 6336   00BB
        B       L_633E                          ; 6337   0200 0005

        MVI     G_011B, R1                      ; 6339   0281 011B
        MVI     G_011C, R0                      ; 633B   0280 011C
        CLRR    R3                              ; 633D   01DB
L_633E:
        SLL     R1,     2                       ; 633E   004D
        SLL     R1,     1                       ; 633F   0049
        SLL     R0,     2                       ; 6340   004C
        SLL     R0,     1                       ; 6341   0048
        MVO     R1,     G_011B                  ; 6342   0241 011B
        MVO     R0,     G_011C                  ; 6344   0240 011C
        INCR    R1                              ; 6346   0009
        DECR    R0                              ; 6347   0010
        SUBR    R1,     R0                      ; 6348   0108
        PSHR    R4                              ; 6349   0274

        JSR     R4,     L_5A80                  ; 634A   0004 0058 0280

        PULR    R4                              ; 634D   02B4
        ADDR    R1,     R0                      ; 634E   00C8
        ADDI    #$0300, R0                      ; 634F   02F8 0300
        TSTR    R3                              ; 6351   009B
        BEQ     L_6358                          ; 6352   0204 0004

        SDBD                                    ; 6354   0001
        ADDI    #$0400, R0                      ; 6355   02F8 0000 0004
L_6358:
        MVO@    R0,     R4                      ; 6358   0260
        SWAP    R2,     1                       ; 6359   0042
        SLL     R2,     2                       ; 635A   004E
        ADDI    #$0088, R2                      ; 635B   02FA 0088
        MVO@    R2,     R4                      ; 635D   0262
        SDBD                                    ; 635E   0001
        MVII    #$08D6, R0                      ; 635F   02B8 00D6 0008
        TSTR    R3                              ; 6362   009B
        BEQ     L_6369                          ; 6363   0204 0004

        SDBD                                    ; 6365   0001
        MVII    #$1861, R0                      ; 6366   02B8 0061 0018
L_6369:
        MVO@    R0,     R4                      ; 6369   0260
        CLRR    R0                              ; 636A   01C0
        MVO     R0,     G_010F                  ; 636B   0240 010F
        CLRR    R0                              ; 636D   01C0
        MVO     R0,     G_0118                  ; 636E   0240 0118
        B       L_63B5                          ; 6370   0200 0043

        MVI     G_033F, R0                      ; 6372   0280 033F
        TSTR    R0                              ; 6374   0080
        BNEQ    L_62DE                          ; 6375   022C 0098

        MVI     G_011B, R5                      ; 6377   0285 011B
        MVI     G_011C, R0                      ; 6379   0280 011C
        DECR    R0                              ; 637B   0010
        SUBR    R5,     R0                      ; 637C   0128

        JSR     R4,     L_5A80                  ; 637D   0004 0058 0280

        ADDR    R0,     R5                      ; 6380   00C5
L_6381:
        MOVR    R5,     R0                      ; 6381   00A8
        SLL     R0,     2                       ; 6382   004C
        SLL     R0,     1                       ; 6383   0048
        XORI    #$0300, R0                      ; 6384   03F8 0300
        MVO     R0,     G_030A                  ; 6386   0240 030A
        ADDI    #$0008, R0                      ; 6388   02F8 0008
L_638A:
        MVO     R0,     G_030D                  ; 638A   0240 030D
        MVII    #$0088, R0                      ; 638C   02B8 0088
        MVO     R0,     G_030B                  ; 638E   0240 030B
        MVO     R0,     G_030E                  ; 6390   0240 030E
        SDBD                                    ; 6392   0001
        MVII    #$0871, R0                      ; 6393   02B8 0071 0008
        MVO     R0,     G_030C                  ; 6396   0240 030C
        ADDI    #$0010, R0                      ; 6398   02F8 0010
        MVO     R0,     G_030F                  ; 639A   0240 030F
        SDBD                                    ; 639C   0001
        MVII    #$16B6, R0                      ; 639D   02B8 00B6 0016
        ADDI    #$0323, R5                      ; 63A0   02FD 0323
        MVO@    R0,     R5                      ; 63A2   0268
        MVO@    R0,     R5                      ; 63A3   0268
        MVII    #$00FF, R0                      ; 63A4   02B8 00FF
        MVO     R0,     G_010F                  ; 63A6   0240 010F
        MVO     R0,     G_0118                  ; 63A8   0240 0118
        B       L_63B5                          ; 63AA   0200 0009

        CLRR    R0                              ; 63AC   01C0
        MVO@    R0,     R4                      ; 63AD   0260
        MVO@    R0,     R4                      ; 63AE   0260
        MVO@    R0,     R4                      ; 63AF   0260
        MVO     R0,     G_010F                  ; 63B0   0240 010F
        DECR    R0                              ; 63B2   0010
        MVO     R0,     G_0118                  ; 63B3   0240 0118
L_63B5:
        PULR    R7                              ; 63B5   02B7
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63B6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63BA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63BE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63C2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63C6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63CA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63CE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63D2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63D6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63DA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63DE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63E2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63E6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63EA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63EE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63F2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63F6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63FA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63FE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6402   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6406   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 640A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 640E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6412   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6416   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 641A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 641E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6422   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6426   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 642A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 642E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6432   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6436   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 643A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 643E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6442   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6446   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 644A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 644E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6452   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6456   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 645A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 645E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6462   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6466   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 646A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 646E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6472   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6476   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 647A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 647E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6482   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6486   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 648A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 648E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6492   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6496   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 649A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 649E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64A2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64A6   0000 0000 0000 0000
L_64AA:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64AA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64AE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64B2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64B6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64BA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64BE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 64C2   0000 0000 0000
L_64C5:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64C5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64C9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64CD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64D1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64D5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64D9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64DD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64E1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64E5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64E9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64ED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64F1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64F5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64F9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64FD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6501   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6505   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6509   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 650D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6511   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6515   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6519   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 651D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6521   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6525   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6529   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 652D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6531   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6535   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6539   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 653D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6541   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6545   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6549   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 654D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6551   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6555   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6559   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 655D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6561   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6565   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6569   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 656D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6571   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6575   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6579   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 657D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6581   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6585   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6589   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 658D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6591   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6595   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6599   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 659D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65A1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65A5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65A9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65AD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65B1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65B5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65B9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65BD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65C1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65C5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65C9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65CD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65D1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65D5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65D9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65DD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65E1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65E5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65E9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65ED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65F1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65F5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65F9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65FD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6601   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6605   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6609   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 660D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6611   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6615   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6619   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 661D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6621   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6625   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6629   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 662D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6631   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6635   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6639   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 663D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6641   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6645   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6649   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 664D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6651   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6655   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6659   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 665D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6661   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6665   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6669   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 666D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6671   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6675   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6679   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 667D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6681   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6685   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6689   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 668D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6691   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6695   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6699   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 669D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66A1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66A5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66A9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66AD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66B1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66B5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66B9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66BD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66C1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66C5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66C9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66CD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66D1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66D5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66D9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66DD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66E1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66E5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66E9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66ED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66F1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66F5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66F9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66FD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6701   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6705   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6709   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 670D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6711   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6715   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6719   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 671D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6721   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6725   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6729   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 672D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6731   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6735   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6739   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 673D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6741   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6745   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6749   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 674D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6751   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6755   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6759   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 675D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6761   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6765   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6769   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 676D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6771   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6775   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6779   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 677D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6781   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6785   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6789   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 678D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6791   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6795   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6799   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 679D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67A1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67A5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67A9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67AD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67B1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67B5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67B9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67BD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67C1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67C5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67C9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67CD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67D1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67D5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67D9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67DD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67E1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67E5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67E9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67ED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67F1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67F5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67F9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67FD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6801   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6805   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6809   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 680D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6811   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6815   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6819   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 681D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6821   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6825   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6829   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 682D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6831   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6835   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6839   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 683D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6841   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6845   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6849   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 684D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6851   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6855   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6859   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 685D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6861   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6865   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6869   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 686D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6871   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6875   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6879   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 687D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6881   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6885   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6889   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 688D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6891   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6895   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6899   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 689D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68A1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68A5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68A9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68AD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68B1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68B5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68B9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68BD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68C1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68C5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68C9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68CD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68D1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68D5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68D9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68DD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68E1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68E5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68E9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68ED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68F1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68F5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68F9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68FD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6901   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6905   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6909   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 690D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6911   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6915   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6919   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 691D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6921   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6925   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6929   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 692D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6931   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6935   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6939   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 693D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6941   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6945   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6949   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 694D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6951   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6955   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6959   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 695D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6961   0000 0000 0000 0000
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
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69BD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69C1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69C5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69C9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69CD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69D1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69D5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69D9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69DD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69ED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69FD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A01   0000 0000 0000 0000
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
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ABD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ACD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ADD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B41   0000 0000 0000 0000
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
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ECD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ED1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ED5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ED9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6FFD   0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;; ======================================================================== ;;
