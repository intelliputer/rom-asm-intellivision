
        ORG     $5000
.HEADER:
        INCR    R4                              ; 5000   000C
        RLC     R0,     1                       ; 5001   0050
        INCR    R4                              ; 5002   000C
        RLC     R0,     1                       ; 5003   0050
        ADDR    R3,     R0                      ; 5004   00D8
        RLC     R0,     1                       ; 5005   0050
        SWAP    R0,     1                       ; 5006   0040
        SLR     R2,     1                       ; 5007   0062
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
        MVII    #$0340, R6                      ; 5028   02BE 0340
        MVII    #$0020, R0                      ; 502A   02B8 0020
        CLRR    R4                              ; 502C   01E4
        MVO     R4,     .STIC.CS.0              ; 502D   0244 0028
        MVO     R4,     .STIC.BORD              ; 502F   0244 002C

        JSR     R5,     X_FILL_ZERO             ; 5031   0004 0114 0338

        MVII    #$023E, R0                      ; 5034   02B8 023E
        MVII    #$0102, R4                      ; 5036   02BC 0102

        JSR     R5,     X_FILL_ZERO             ; 5038   0004 0114 0338

        CLRR    R0                              ; 503B   01C0
        MVO     R0,     G_019D                  ; 503C   0240 019D
        MVII    #$0014, R0                      ; 503E   02B8 0014
        MVO     R0,     G_019C                  ; 5040   0240 019C
        MVII    #$02B4, R1                      ; 5042   02B9 02B4
        SDBD                                    ; 5044   0001
        MVII    #$583E, R4                      ; 5045   02BC 003E 0058

        JSR     R5,     .EXEC.730               ; 5048   0004 0114 0330

        MVII    #$0005, R3                      ; 504B   02BB 0005
        MVII    #$02E1, R5                      ; 504D   02BD 02E1

        JSR     R4,     L_505C                  ; 504F   0004 0050 005C

        ADDR    R7,     R2                      ; 5052   00FA
        INCR    R1                              ; 5053   0009
        ADDR    R7,     R2                      ; 5054   00FA
        COMR    R1                              ; 5055   0019
        ADDR    R7,     R6                      ; 5056   00FE
        INCR    R1                              ; 5057   0009
        ADDR    R7,     R6                      ; 5058   00FE
        COMR    R1                              ; 5059   0019
        ADDR    R7,     R1                      ; 505A   00F9
        INCR    R1                              ; 505B   0009
L_505C:
        SDBD                                    ; 505C   0001
        MVI@    R4,     R0                      ; 505D   02A0
        MVO@    R0,     R5                      ; 505E   0268
        MVO@    R0,     R5                      ; 505F   0268
        DECR    R3                              ; 5060   0013
        BNEQ    L_505C                          ; 5061   022C 0006

        JSR     R5,     L_573E                  ; 5063   0004 0154 033E
        JSR     R4,     L_5071                  ; 5066   0004 0050 0071

        ADDR    R4,     R0                      ; 5069   00E0
        SLLC    R3,     2                       ; 506A   005F
        RLC     R1,     2                       ; 506B   0055
        RLC     R1,     2                       ; 506C   0055
        DECLE   $0000,  $0000,  $0000,  $0000   ; 506D   0000 0000 0000 0000
L_5071:
        MVII    #$0008, R0                      ; 5071   02B8 0008
        SDBD                                    ; 5073   0001
        MVII    #$39F0, R1                      ; 5074   02B9 00F0 0039

        JSR     R5,     .EXEC.730               ; 5077   0004 0114 0330

        SDBD                                    ; 507A   0001
        MVII    #$5774, R0                      ; 507B   02B8 0074 0057
        MVO     R0,     .ISRVEC.0               ; 507E   0240 0100
        SWAP    R0,     1                       ; 5080   0040
        MVO     R0,     .ISRVEC.1               ; 5081   0240 0101
L_5083:
        MVII    #$01FE, R3                      ; 5083   02BB 01FE
        MVII    #$00FF, R4                      ; 5085   02BC 00FF
        CLRR    R2                              ; 5087   01D2
        MVO     R2,     G_033F                  ; 5088   0242 033F
L_508A:
        CLRR    R5                              ; 508A   01ED
        XORI    #$0001, R3                      ; 508B   03FB 0001
L_508D:
        EIS                                     ; 508D   0002
        MVI     G_031F, R0                      ; 508E   0280 031F
L_5090:
        INCR    R0                              ; 5090   0008
        BEQ     L_5090                          ; 5091   0224 0002

        MVO     R0,     G_031F                  ; 5093   0240 031F
        MVI@    R3,     R0                      ; 5095   0298
        CMPI    #$00FF, R0                      ; 5096   0378 00FF
        BEQ     L_508A                          ; 5098   0224 000F

        CLRR    R2                              ; 509A   01D2
        MVO     R2,     G_033F                  ; 509B   0242 033F
        CMPR    R0,     R4                      ; 509D   0144
        GSWD    R2                              ; 509E   0032
        MOVR    R0,     R4                      ; 509F   0084
        RSWD    R2                              ; 50A0   003A
        BNEQ    L_508A                          ; 50A1   022C 0018

        INCR    R5                              ; 50A3   000D
        CMPI    #$0190, R5                      ; 50A4   037D 0190
        BNEQ    L_508D                          ; 50A6   022C 001A

        MOVR    R0,     R1                      ; 50A8   0081
        ANDI    #$00F0, R1                      ; 50A9   03B9 00F0
        CMPI    #$00D0, R1                      ; 50AB   0379 00D0
        BEQ     L_5083                          ; 50AD   0224 002B

        MVII    #$0007, R1                      ; 50AF   02B9 0007

        JSR     R4,     L_50BC                  ; 50B1   0004 0050 00BC

        MOVR    R6,     R7                      ; 50B4   00B7
        RRC     R3,     2                       ; 50B5   0077
        MOVR    R7,     R3                      ; 50B6   00BB
        SARC    R3,     1                       ; 50B7   007B
        MOVR    R7,     R5                      ; 50B8   00BD
        SARC    R1,     2                       ; 50B9   007D
        MOVR    R7,     R6                      ; 50BA   00BE
        SARC    R2,     2                       ; 50BB   007E
L_50BC:
        CMP@    R4,     R0                      ; 50BC   0360
        BEQ     L_50CC                          ; 50BD   0204 000D

        DECR    R1                              ; 50BF   0011
        BPL     L_50BC                          ; 50C0   0223 0005

        SDBD                                    ; 50C2   0001
        MVII    #$5774, R1                      ; 50C3   02B9 0074 0057
        MVII    #$0100, R4                      ; 50C6   02BC 0100
        SDBD                                    ; 50C8   0001
        SUB@    R4,     R1                      ; 50C9   0321
        BNEQ    L_5083                          ; 50CA   022C 0048

L_50CC:
        MVO     R1,     G_018E                  ; 50CC   0241 018E
        ANDI    #$0001, R1                      ; 50CE   03B9 0001
        MVO     R1,     G_018D                  ; 50D0   0241 018D
        BEQ     L_50D6                          ; 50D2   0204 0002

        MVII    #$01FE, R3                      ; 50D4   02BB 01FE
L_50D6:
        MVO     R3,     G_018C                  ; 50D6   0243 018C
        MVII    #$00E2, R0                      ; 50D8   02B8 00E2
        MVII    #$0050, R1                      ; 50DA   02B9 0050
        MVO     R0,     .ISRVEC.0               ; 50DC   0240 0100
        MVO     R1,     .ISRVEC.1               ; 50DE   0241 0101
        EIS                                     ; 50E0   0002
        DECR    R7                              ; 50E1   0017
        DIS                                     ; 50E2   0003
        MVII    #$0340, R6                      ; 50E3   02BE 0340
        MVII    #$0008, R0                      ; 50E5   02B8 0008
        SDBD                                    ; 50E7   0001
        MVII    #$3800, R1                      ; 50E8   02B9 0000 0038
        SDBD                                    ; 50EB   0001
        MVII    #$62C8, R4                      ; 50EC   02BC 00C8 0062

        JSR     R5,     .EXEC.730               ; 50EF   0004 0114 0330

        SDBD                                    ; 50F2   0001
        MVII    #$6248, R4                      ; 50F3   02BC 0048 0062
        SDBD                                    ; 50F6   0001
        MVII    #$3808, R1                      ; 50F7   02B9 0008 0038
        MVII    #$0058, R0                      ; 50FA   02B8 0058

        JSR     R5,     .EXEC.730               ; 50FC   0004 0114 0330

        MVII    #$00C0, R0                      ; 50FF   02B8 00C0
        SDBD                                    ; 5101   0001
        MVII    #$3860, R1                      ; 5102   02B9 0060 0038
        SDBD                                    ; 5105   0001
        MVII    #$62D0, R4                      ; 5106   02BC 00D0 0062

        JSR     R5,     .EXEC.730               ; 5109   0004 0114 0330

        MVII    #$0040, R0                      ; 510C   02B8 0040
        MOVR    R5,     R4                      ; 510E   00AC

        JSR     R5,     X_FILL_ZERO             ; 510F   0004 0114 0338

        MVII    #$0004, R0                      ; 5112   02B8 0004
        MVO     R0,     G_0117                  ; 5114   0240 0117
        MVO     R0,     G_012B                  ; 5116   0240 012B
        MVI     G_018E, R4                      ; 5118   0284 018E
        ANDI    #$0006, R4                      ; 511A   03BC 0006
        MOVR    R4,     R0                      ; 511C   00A0
        ADDR    R4,     R4                      ; 511D   00E4
        ADDR    R4,     R4                      ; 511E   00E4
        ADDR    R4,     R4                      ; 511F   00E4
        SUBR    R0,     R4                      ; 5120   0104
        SDBD                                    ; 5121   0001
        ADDI    #$6423, R4                      ; 5122   02FC 0023 0064
        PSHR    R4                              ; 5125   0274
        MVII    #$0008, R0                      ; 5126   02B8 0008
        MVII    #$0102, R1                      ; 5128   02B9 0102

        JSR     R5,     .EXEC.730               ; 512A   0004 0114 0330

        PULR    R4                              ; 512D   02B4
        MVII    #$0008, R0                      ; 512E   02B8 0008
        MVII    #$0118, R1                      ; 5130   02B9 0118

        JSR     R5,     .EXEC.730               ; 5132   0004 0114 0330

        MVI@    R4,     R0                      ; 5135   02A0
        MVO     R0,     G_0114                  ; 5136   0240 0114
        MVO     R0,     G_0129                  ; 5138   0240 0129
        MVI@    R4,     R0                      ; 513A   02A0
        MVO     R0,     G_0115                  ; 513B   0240 0115
        MVO     R0,     G_012A                  ; 513D   0240 012A
        SDBD                                    ; 513F   0001
        MVI@    R4,     R0                      ; 5140   02A0
        MVO     R0,     G_0322                  ; 5141   0240 0322
        MVO     R0,     G_0325                  ; 5143   0240 0325
        SDBD                                    ; 5145   0001
        MVI@    R4,     R0                      ; 5146   02A0
        MVO     R0,     G_0323                  ; 5147   0240 0323
        MVO     R0,     G_0326                  ; 5149   0240 0326
        MVII    #$00FF, R1                      ; 514B   02B9 00FF
        MVO     R1,     G_0111                  ; 514D   0241 0111
        MVO     R1,     G_0116                  ; 514F   0241 0116
        MVII    #$0145, R4                      ; 5151   02BC 0145
        MVII    #$0047, R0                      ; 5153   02B8 0047

        JSR     R5,     X_FILL_MEM              ; 5155   0004 0114 0341

        MVII    #$00DF, R0                      ; 5158   02B8 00DF
        MVO     R0,     G_014C                  ; 515A   0240 014C
        MVII    #$00DE, R0                      ; 515C   02B8 00DE
        MVO     R0,     G_014E                  ; 515E   0240 014E
        MVII    #$00F7, R0                      ; 5160   02B8 00F7
        MVO     R0,     G_015C                  ; 5162   0240 015C
        MVO     R0,     G_015E                  ; 5164   0240 015E
        MVII    #$00FD, R0                      ; 5166   02B8 00FD
        MVO     R0,     G_016C                  ; 5168   0240 016C
        MVII    #$00BD, R0                      ; 516A   02B8 00BD
        MVO     R0,     G_016E                  ; 516C   0240 016E

        JSR     R4,     L_5179                  ; 516E   0004 0050 0179

        ADDR    R6,     R7                      ; 5171   00F7
        ADDR    R6,     R7                      ; 5172   00F7
        ADDR    R4,     R3                      ; 5173   00E3
        ADDR    R0,     R1                      ; 5174   00C1
        MOVR    R2,     R4                      ; 5175   0094
        TSTR    R6                              ; 5176   00B6
        ADDR    R4,     R3                      ; 5177   00E3
        ADDR    R2,     R5                      ; 5178   00D5
L_5179:
        MVII    #$017C, R5                      ; 5179   02BD 017C
        MVII    #$0008, R1                      ; 517B   02B9 0008
L_517D:
        MVI@    R4,     R0                      ; 517D   02A0
        MVO@    R0,     R5                      ; 517E   0268
        DECR    R1                              ; 517F   0011
        BNEQ    L_517D                          ; 5180   022C 0004

        SDBD                                    ; 5182   0001
        MVII    #$38E0, R1                      ; 5183   02B9 00E0 0038
        SDBD                                    ; 5186   0001
        MVII    #$18E0, R0                      ; 5187   02B8 00E0 0018
        MVII    #$0200, R4                      ; 518A   02BC 0200
L_518C:
        ADDI    #$0010, R4                      ; 518C   02FC 0010
        MVO@    R1,     R4                      ; 518E   0261
        MVO@    R0,     R4                      ; 518F   0260
        MVO@    R0,     R4                      ; 5190   0260
        MVO@    R1,     R4                      ; 5191   0261
        CMPI    #$02F0, R4                      ; 5192   037C 02F0
        BNEQ    L_518C                          ; 5194   022C 0009

        SDBD                                    ; 5196   0001
        MVII    #$39C0, R0                      ; 5197   02B8 00C0 0039
        MVO     R0,     .BTAB.B0                ; 519A   0240 02B0
        ADDI    #$0008, R0                      ; 519C   02F8 0008
        MVO     R0,     .BTAB.C4                ; 519E   0240 02C4
        SDBD                                    ; 51A0   0001
        MVII    #$19D0, R0                      ; 51A1   02B8 00D0 0019
        MVO     R0,     .BTAB.B1                ; 51A4   0240 02B1
        ADDI    #$0008, R0                      ; 51A6   02F8 0008
        MVO     R0,     .BTAB.C5                ; 51A8   0240 02C5
        ADDI    #$0008, R0                      ; 51AA   02F8 0008
        MVO     R0,     .BTAB.B2                ; 51AC   0240 02B2
        ADDI    #$0008, R0                      ; 51AE   02F8 0008
        MVO     R0,     .BTAB.C6                ; 51B0   0240 02C6
        DIS                                     ; 51B2   0003
        MVI     G_018D, R0                      ; 51B3   0280 018D
        TSTR    R0                              ; 51B5   0080
        BEQ     L_51F6                          ; 51B6   0204 003E

        MVI     G_012B, R0                      ; 51B8   0280 012B
        TSTR    R0                              ; 51BA   0080
        BEQ     L_51F6                          ; 51BB   0204 0039

        MVI     G_018C, R0                      ; 51BD   0280 018C
        XORI    #$0001, R0                      ; 51BF   03F8 0001
        MVO     R0,     G_018C                  ; 51C1   0240 018C
        MVII    #$0118, R1                      ; 51C3   02B9 0118
        MVII    #$0102, R2                      ; 51C5   02BA 0102
        MVII    #$0008, R3                      ; 51C7   02BB 0008

        JSR     R5,     L_6CD4                  ; 51C9   0004 016C 00D4

        MVII    #$0120, R1                      ; 51CC   02B9 0120
        MVII    #$010A, R2                      ; 51CE   02BA 010A
        MVII    #$0007, R3                      ; 51D0   02BB 0007

        JSR     R5,     L_6CD4                  ; 51D2   0004 016C 00D4

        MVII    #$0127, R1                      ; 51D5   02B9 0127
        MVII    #$0112, R2                      ; 51D7   02BA 0112
        MVII    #$0004, R3                      ; 51D9   02BB 0004

        JSR     R5,     L_6CD4                  ; 51DB   0004 016C 00D4

        MVI     G_012B, R0                      ; 51DE   0280 012B
        MVI     G_0117, R1                      ; 51E0   0281 0117
        MVO     R1,     G_012B                  ; 51E2   0241 012B
        MVO     R0,     G_0117                  ; 51E4   0240 0117
        MVI     G_0325, R0                      ; 51E6   0280 0325
        MVI     G_0322, R1                      ; 51E8   0281 0322
        MVO     R1,     G_0325                  ; 51EA   0241 0325
        MVO     R0,     G_0322                  ; 51EC   0240 0322
        MVI     G_0326, R0                      ; 51EE   0280 0326
        MVI     G_0323, R1                      ; 51F0   0281 0323
        MVO     R1,     G_0326                  ; 51F2   0241 0326
        MVO     R0,     G_0323                  ; 51F4   0240 0323
L_51F6:
        MVI     G_0117, R0                      ; 51F6   0280 0117
        TSTR    R0                              ; 51F8   0080
        BNEQ    L_5206                          ; 51F9   020C 000B

        SDBD                                    ; 51FB   0001
        MVII    #$6D39, R0                      ; 51FC   02B8 0039 006D
        MVO     R0,     .ISRVEC.0               ; 51FF   0240 0100
        SWAP    R0,     1                       ; 5201   0040
        MVO     R0,     .ISRVEC.1               ; 5202   0240 0101
        EIS                                     ; 5204   0002
        DECR    R7                              ; 5205   0017
L_5206:
        MVII    #$018F, R4                      ; 5206   02BC 018F
        MVII    #$006F, R0                      ; 5208   02B8 006F

        JSR     R5,     X_FILL_ZERO             ; 520A   0004 0114 0338

        MVII    #$0018, R0                      ; 520D   02B8 0018
        MVII    #$0327, R4                      ; 520F   02BC 0327

        JSR     R5,     X_FILL_ZERO             ; 5211   0004 0114 0338

        MVII    #$010B, R4                      ; 5214   02BC 010B
        MVII    #$0150, R3                      ; 5216   02BB 0150

        JSR     R5,     L_6B13                  ; 5218   0004 0168 0313

        MVII    #$0200, R4                      ; 521B   02BC 0200
        SDBD                                    ; 521D   0001
        MVII    #$18E3, R1                      ; 521E   02B9 00E3 0018
        MVII    #$0010, R0                      ; 5221   02B8 0010
        MVII    #$000C, R3                      ; 5223   02BB 000C

L_5225:
        JSR     R5,     X_FILL_MEM              ; 5225   0004 0114 0341

        ADDI    #$0004, R4                      ; 5228   02FC 0004
        DECR    R3                              ; 522A   0013
        BNEQ    L_5225                          ; 522B   022C 0007

        JSR     R5,     L_68B6                  ; 522D   0004 0168 00B6

        MVII    #$0001, R0                      ; 5230   02B8 0001
        MVO     R0,     G_01AA                  ; 5232   0240 01AA
        MVII    #$0080, R0                      ; 5234   02B8 0080
        MVO     R0,     G_02FB                  ; 5236   0240 02FB
        MVII    #$0020, R0                      ; 5238   02B8 0020
        MVO     R0,     G_019A                  ; 523A   0240 019A
        MVII    #$0015, R0                      ; 523C   02B8 0015
        SWAP    R0,     1                       ; 523E   0040
        DECR    R0                              ; 523F   0010
        MVO     R0,     G_02F0                  ; 5240   0240 02F0
        MVII    #$0008, R0                      ; 5242   02B8 0008
        MVII    #$0102, R4                      ; 5244   02BC 0102
        MVII    #$01D5, R1                      ; 5246   02B9 01D5

        JSR     R5,     .EXEC.730               ; 5248   0004 0114 0330

        MVI     G_0322, R0                      ; 524B   0280 0322
        MVO     R0,     G_031E                  ; 524D   0240 031E
        MVI     G_0323, R0                      ; 524F   0280 0323
        DECR    R0                              ; 5251   0010
        MVO     R0,     G_0324                  ; 5252   0240 0324

        JSR     R5,     L_68F0                  ; 5254   0004 0168 00F0

        MVII    #$0039, R0                      ; 5257   02B8 0039
        MVO     R0,     .PSG0.chan_enable       ; 5259   0240 01F8
        MOVR    R7,     R0                      ; 525B   00B8
        ADDI    #$0010, R0                      ; 525C   02F8 0010
        MVO     R0,     G_031D                  ; 525E   0240 031D
        MVII    #$00E0, R0                      ; 5260   02B8 00E0
        MVII    #$005A, R1                      ; 5262   02B9 005A
        MVO     R0,     .ISRVEC.0               ; 5264   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5266   0241 0101
        MVII    #$0340, R6                      ; 5268   02BE 0340
        EIS                                     ; 526A   0002
        DECR    R7                              ; 526B   0017

        JSR     R5,     L_6861                  ; 526C   0004 0168 0061

        MVI     G_01D0, R0                      ; 526F   0280 01D0
        INCR    R0                              ; 5271   0008
        CMPI    #$0060, R0                      ; 5272   0378 0060
        BMI     L_533B                          ; 5274   020B 00C5

        MVI     G_02F8, R0                      ; 5276   0280 02F8
        SWAP    R0,     1                       ; 5278   0040
        ANDI    #$00FF, R0                      ; 5279   03B8 00FF
        XORI    #$0200, R0                      ; 527B   03F8 0200
        MVO     R0,     G_0327                  ; 527D   0240 0327
        MVII    #$00D8, R0                      ; 527F   02B8 00D8
        MVO     R0,     G_032F                  ; 5281   0240 032F
        MVI     G_018C, R0                      ; 5283   0280 018C
        SUBI    #$00FE, R0                      ; 5285   0338 00FE
        BEQ     L_528B                          ; 5287   0204 0002

        MVII    #$0003, R0                      ; 5289   02B8 0003
L_528B:
        SDBD                                    ; 528B   0001
        ADDI    #$08B0, R0                      ; 528C   02F8 00B0 0008
        MVO     R0,     G_0337                  ; 528F   0240 0337
        MVII    #$0007, R0                      ; 5291   02B8 0007
        SWAP    R0,     1                       ; 5293   0040
        MVO     R0,     G_02F9                  ; 5294   0240 02F9
        MVI     G_0117, R3                      ; 5296   0283 0117
        DECR    R3                              ; 5298   0013
        MVO     R3,     G_0117                  ; 5299   0243 0117

        JSR     R5,     L_68B6                  ; 529B   0004 0168 00B6

        MVII    #$0005, R0                      ; 529E   02B8 0005
        MVII    #$0157, R1                      ; 52A0   02B9 0157

        JSR     R4,     L_52AA                  ; 52A2   0004 0050 02AA

        ADDR    R0,     R3                      ; 52A5   00C3
        MOVR    R7,     R5                      ; 52A6   00BD
        SWAP    R2,     1                       ; 52A7   0042
        MOVR    R7,     R5                      ; 52A8   00BD
        SARC    R2,     2                       ; 52A9   007E

L_52AA:
        JSR     R5,     .EXEC.730               ; 52AA   0004 0114 0330

        MVII    #$0167, R3                      ; 52AD   02BB 0167
        MVII    #$0112, R4                      ; 52AF   02BC 0112

        JSR     R5,     L_6B13                  ; 52B1   0004 0168 0313

        SDBD                                    ; 52B4   0001
        MVII    #$18E8, R0                      ; 52B5   02B8 00E8 0018
        MVII    #$02D9, R4                      ; 52B8   02BC 02D9
        MVO@    R0,     R4                      ; 52BA   0260
        ADDI    #$0008, R0                      ; 52BB   02F8 0008
        MVO@    R0,     R4                      ; 52BD   0260
        MVII    #$0088, R0                      ; 52BE   02B8 0088
        MVII    #$0159, R1                      ; 52C0   02B9 0159
        MVI     G_018C, R2                      ; 52C2   0282 018C
        CMPI    #$00FF, R2                      ; 52C4   037A 00FF
        BEQ     L_52CE                          ; 52C6   0204 0006

        MVII    #$009B, R0                      ; 52C8   02B8 009B
        SDBD                                    ; 52CA   0001
        MVII    #$0559, R1                      ; 52CB   02B9 0059 0005
L_52CE:
        MVO     R0,     G_0328                  ; 52CE   0240 0328
        MVO     R1,     G_0330                  ; 52D0   0241 0330
        MVII    #$01F9, R0                      ; 52D2   02B8 01F9
        MVO     R0,     G_0338                  ; 52D4   0240 0338
        MOVR    R7,     R0                      ; 52D6   00B8
        ADDI    #$0007, R0                      ; 52D7   02F8 0007
        MVO     R0,     G_031D                  ; 52D9   0240 031D
        CLRR    R0                              ; 52DB   01C0
        MVO     R0,     G_033F                  ; 52DC   0240 033F

        JSR     R5,     L_6861                  ; 52DE   0004 0168 0061

        MVI     G_012C, R0                      ; 52E1   0280 012C
        ANDI    #$000F, R0                      ; 52E3   03B8 000F
        BNEQ    L_52ED                          ; 52E5   020C 0006

        MVI     G_0328, R0                      ; 52E7   0280 0328
        XORI    #$0200, R0                      ; 52E9   03F8 0200
        MVO     R0,     G_0328                  ; 52EB   0240 0328
L_52ED:
        MVI     G_033F, R0                      ; 52ED   0280 033F
        INCR    R0                              ; 52EF   0008
        MVO     R0,     G_033F                  ; 52F0   0240 033F
        BNEQ    L_5307                          ; 52F2   020C 0013

        DIS                                     ; 52F4   0003
L_52F5:
        MVII    #$01FE, R4                      ; 52F5   02BC 01FE
        SDBD                                    ; 52F7   0001
        MVI@    R4,     R1                      ; 52F8   02A1
        INCR    R1                              ; 52F9   0009
        BEQ     L_52F5                          ; 52FA   0224 0006

        SDBD                                    ; 52FC   0001
        MVII    #$5AE0, R0                      ; 52FD   02B8 00E0 005A
        MVO     R0,     .ISRVEC.0               ; 5300   0240 0100
        SWAP    R0,     1                       ; 5302   0040
        MVO     R0,     .ISRVEC.1               ; 5303   0240 0101
        EIS                                     ; 5305   0002
        DECR    R7                              ; 5306   0017
L_5307:
        SLR     R0,     2                       ; 5307   0064
        SLR     R0,     1                       ; 5308   0060
        BEQ     L_5317                          ; 5309   0204 000C

        MVI     G_0190, R0                      ; 530B   0280 0190
        CMP     G_0191, R0                      ; 530D   0340 0191
        MVO     R0,     G_0191                  ; 530F   0240 0191
        BNEQ    L_5317                          ; 5311   020C 0004

        CMPI    #$00FF, R0                      ; 5313   0378 00FF
        BNEQ    L_5319                          ; 5315   020C 0002

L_5317:
        EIS                                     ; 5317   0002
        DECR    R7                              ; 5318   0017
L_5319:
        MVII    #$00FF, R0                      ; 5319   02B8 00FF
        MVII    #$0157, R4                      ; 531B   02BC 0157
        MVII    #$0003, R3                      ; 531D   02BB 0003
L_531F:
        MVO@    R0,     R4                      ; 531F   0260
        MVO@    R0,     R4                      ; 5320   0260
        MVO@    R0,     R4                      ; 5321   0260
        NOP                                     ; 5322   0034
        MVO@    R0,     R4                      ; 5323   0260
        MVO@    R0,     R4                      ; 5324   0260
        ADDI    #$000B, R4                      ; 5325   02FC 000B
        DECR    R3                              ; 5327   0013
        BNEQ    L_531F                          ; 5328   022C 000A

        SDBD                                    ; 532A   0001
        MVII    #$18E0, R0                      ; 532B   02B8 00E0 0018
        MVII    #$02D9, R4                      ; 532E   02BC 02D9
        MVO@    R0,     R4                      ; 5330   0260
        MVO@    R0,     R4                      ; 5331   0260

        JSR     R5,     L_68F0                  ; 5332   0004 0168 00F0

        MOVR    R7,     R0                      ; 5335   00B8
        ADDI    #$001E, R0                      ; 5336   02F8 001E
        MVO     R0,     G_031D                  ; 5338   0240 031D
        MOVR    R0,     R7                      ; 533A   0087
L_533B:
        MVO     R0,     G_01D0                  ; 533B   0240 01D0
        ANDI    #$0007, R0                      ; 533D   03B8 0007
        MVO     R0,     G_01D1                  ; 533F   0240 01D1

        JSR     R5,     L_6B5E                  ; 5341   0004 0168 035E
        JSR     R5,     L_6B99                  ; 5344   0004 0168 0399
        JSR     R5,     L_6BFE                  ; 5347   0004 0168 03FE
        JSR     R5,     L_645B                  ; 534A   0004 0164 005B

        CLRR    R0                              ; 534D   01C0
        MVO     R0,     G_01D3                  ; 534E   0240 01D3
        MVO     R0,     G_01D4                  ; 5350   0240 01D4
        EIS                                     ; 5352   0002
        DECR    R7                              ; 5353   0017

        JSR     R5,     L_6861                  ; 5354   0004 0168 0061

        MVI     G_02F0, R0                      ; 5357   0280 02F0
        SUBI    #$0002, R0                      ; 5359   0338 0002
        BPL     L_5360                          ; 535B   0203 0003
        J       L_6A1D                          ; 535D   0004 0368 021D

L_5360:
        MVO     R0,     G_02F0                  ; 5360   0240 02F0
        MVI     G_019F, R0                      ; 5362   0280 019F
        TSTR    R0                              ; 5364   0080
        BNEQ    L_541E                          ; 5365   020C 00B7

        MVI     G_01B0, R1                      ; 5367   0281 01B0
        MVI     G_02FA, R3                      ; 5369   0283 02FA
        ANDI    #$0002, R1                      ; 536B   03B9 0002
        BEQ     L_5370                          ; 536D   0204 0001

        NEGR    R3                              ; 536F   0023
L_5370:
        SWAP    R1,     1                       ; 5370   0041
        SLL     R1,     1                       ; 5371   0049
        MVI     G_02FB, R2                      ; 5372   0282 02FB
        ADD     G_02F9, R2                      ; 5374   02C2 02F9
        MVO     R2,     G_02F9                  ; 5376   0242 02F9
        SWAP    R2,     1                       ; 5378   0042
        ANDI    #$0007, R2                      ; 5379   03BA 0007
        MVO     R2,     G_01D1                  ; 537B   0242 01D1
        NEGR    R2                              ; 537D   0022
        MOVR    R2,     R4                      ; 537E   0094
        ADDI    #$00DF, R2                      ; 537F   02FA 00DF
        XORR    R1,     R2                      ; 5381   01CA
        MVO     R2,     G_032F                  ; 5382   0242 032F
        MVI     G_01B3, R0                      ; 5384   0280 01B3
        TSTR    R0                              ; 5386   0080
        BEQ     L_53A9                          ; 5387   0204 0020

        SUBI    #$0003, R0                      ; 5389   0338 0003
        CMPI    #$000C, R0                      ; 538B   0378 000C
        BPL     L_5396                          ; 538D   0203 0007

        CLRR    R0                              ; 538F   01C0
        MVO     R0,     G_01B3                  ; 5390   0240 01B3
        MVO     R0,     G_0330                  ; 5392   0240 0330
        B       L_53A9                          ; 5394   0200 0013

L_5396:
        MVO     R0,     G_01B3                  ; 5396   0240 01B3
        ADDR    R4,     R0                      ; 5398   00E0
        MVO     R0,     G_0330                  ; 5399   0240 0330
        MVI     G_018C, R0                      ; 539B   0280 018C
        SUBI    #$00FE, R0                      ; 539D   0338 00FE
        BEQ     L_53A3                          ; 539F   0204 0002

        MVII    #$0003, R0                      ; 53A1   02B8 0003
L_53A3:
        SDBD                                    ; 53A3   0001
        ADDI    #$0610, R0                      ; 53A4   02F8 0010 0006
        MVO     R0,     G_0338                  ; 53A7   0240 0338
L_53A9:
        ADD     G_02F8, R3                      ; 53A9   02C3 02F8
        MVO     R3,     G_02F8                  ; 53AB   0243 02F8
        SLR     R1,     2                       ; 53AD   0065
        SUBR    R1,     R3                      ; 53AE   010B
        SWAP    R3,     1                       ; 53AF   0043
        ANDI    #$00FF, R3                      ; 53B0   03BB 00FF
        XORI    #$0300, R3                      ; 53B2   03FB 0300
        MVO     R3,     G_0327                  ; 53B4   0243 0327
        MVO     R3,     G_0328                  ; 53B6   0243 0328
        MVII    #$01BC, R4                      ; 53B8   02BC 01BC
        MVII    #$0328, R3                      ; 53BA   02BB 0328
L_53BC:
        INCR    R3                              ; 53BC   000B
        MVI@    R4,     R0                      ; 53BD   02A0
        DECR    R0                              ; 53BE   0010
        BPL     L_5408                          ; 53BF   0203 0047

        MVI@    R4,     R0                      ; 53C1   02A0
        MVI@    R4,     R1                      ; 53C2   02A1
        SLL     R1,     1                       ; 53C3   0049
        DECR    R1                              ; 53C4   0011
        NEGR    R1                              ; 53C5   0021
        TSTR    R0                              ; 53C6   0080
        BEQ     L_53F2                          ; 53C7   0204 0029

        MVI     G_012C, R0                      ; 53C9   0280 012C
        CMPI    #$01C6, R4                      ; 53CB   037C 01C6
        BPL     L_53D1                          ; 53CD   0203 0002

        XORI    #$0001, R0                      ; 53CF   03F8 0001
L_53D1:
        SARC    R0,     1                       ; 53D1   0078
        BNC     L_5410                          ; 53D2   0209 003C

        ADD@    R3,     R1                      ; 53D4   02D9
        MVO@    R1,     R3                      ; 53D5   0259
        ANDI    #$00FF, R1                      ; 53D6   03B9 00FF
        CMP@    R4,     R1                      ; 53D8   0361
        BEQ     L_53DF                          ; 53D9   0204 0004

        CMP@    R4,     R1                      ; 53DB   0361
        BNEQ    L_5412                          ; 53DC   020C 0034

        INCR    R7                              ; 53DE   000F
L_53DF:
        INCR    R4                              ; 53DF   000C
        SUBI    #$0003, R4                      ; 53E0   033C 0003
        MVI@    R4,     R0                      ; 53E2   02A0
        XORI    #$0001, R0                      ; 53E3   03F8 0001
        DECR    R4                              ; 53E5   0014
        MVO@    R0,     R4                      ; 53E6   0260
        ADDI    #$0008, R3                      ; 53E7   02FB 0008
        MVII    #$0004, R0                      ; 53E9   02B8 0004
        SWAP    R0,     1                       ; 53EB   0040
        XOR@    R3,     R0                      ; 53EC   03D8
        MVO@    R0,     R3                      ; 53ED   0258
        SUBI    #$0008, R3                      ; 53EE   033B 0008
        B       L_5410                          ; 53F0   0200 001E

L_53F2:
        ADDI    #$0002, R4                      ; 53F2   02FC 0002
        ADD@    R3,     R1                      ; 53F4   02D9
        ANDI    #$00FF, R1                      ; 53F5   03B9 00FF
        TSTR    R1                              ; 53F7   0089
        BNEQ    L_53FE                          ; 53F8   020C 0004

        MVII    #$0080, R1                      ; 53FA   02B9 0080
        B       L_5403                          ; 53FC   0200 0005

L_53FE:
        CMPI    #$0080, R1                      ; 53FE   0379 0080
        BNEQ    L_5403                          ; 5400   020C 0001

        CLRR    R1                              ; 5402   01C9
L_5403:
        XORI    #$0300, R1                      ; 5403   03F9 0300
        MVO@    R1,     R3                      ; 5405   0259
        B       L_5412                          ; 5406   0200 000A

L_5408:
        CMPI    #$00FE, R0                      ; 5408   0378 00FE
        BEQ     L_540E                          ; 540A   0204 0002

        DECR    R4                              ; 540C   0014
        MVO@    R0,     R4                      ; 540D   0260
L_540E:
        ADDI    #$0002, R4                      ; 540E   02FC 0002
L_5410:
        ADDI    #$0002, R4                      ; 5410   02FC 0002
L_5412:
        CMPI    #$01D0, R4                      ; 5412   037C 01D0
        BNEQ    L_53BC                          ; 5414   022C 0059

        JSR     R5,     L_6B99                  ; 5416   0004 0168 0399
        JSR     R5,     L_645B                  ; 5419   0004 0164 005B

        EIS                                     ; 541C   0002
        DECR    R7                              ; 541D   0017
L_541E:
        MVI     G_0327, R1                      ; 541E   0281 0327
        ADDI    #$0003, R1                      ; 5420   02F9 0003
        ANDI    #$00FF, R1                      ; 5422   03B9 00FF
        SLR     R1,     2                       ; 5424   0065
        SLR     R1,     1                       ; 5425   0061
        ADDI    #$02C7, R1                      ; 5426   02F9 02C7
        MVI     G_032F, R0                      ; 5428   0280 032F
        ANDI    #$0007, R0                      ; 542A   03B8 0007
        BEQ     L_543E                          ; 542C   0204 0010

        CMPI    #$0006, R0                      ; 542E   0378 0006
        BPL     L_543E                          ; 5430   0203 000C

        MVI@    R1,     R0                      ; 5432   0288
        RLC     R0,     2                       ; 5433   0054
        BNC     L_543E                          ; 5434   0209 0008
        BNOV    L_543E                          ; 5436   020A 0006

        JSR     R5,     L_6C86                  ; 5438   0004 016C 0086

L_543B:
        J       L_6A1D                          ; 543B   0004 0368 021D

L_543E:
        ADDI    #$0014, R1                      ; 543E   02F9 0014
        MVI@    R1,     R0                      ; 5440   0288
        SDBD                                    ; 5441   0001
        ANDI    #$0FFF, R0                      ; 5442   03B8 00FF 000F
        SDBD                                    ; 5445   0001
        SUBI    #$0898, R0                      ; 5446   0338 0098 0008
        BEQ     L_543B                          ; 5449   0224 000F

        CMPI    #$0010, R0                      ; 544B   0378 0010
        BEQ     L_543B                          ; 544D   0224 0013

        CMPI    #$0060, R0                      ; 544F   0378 0060
        BEQ     L_543B                          ; 5451   0224 0017

        MVI     G_0330, R1                      ; 5453   0281 0330
        SLR     R1,     2                       ; 5455   0065
        BEQ     L_54C1                          ; 5456   0204 0069

        SLR     R1,     1                       ; 5458   0061
        SLL     R1,     2                       ; 5459   004D
        MOVR    R1,     R0                      ; 545A   0088
        SLL     R1,     2                       ; 545B   004D
        ADDR    R0,     R1                      ; 545C   00C1
        MVI     G_0328, R0                      ; 545D   0280 0328
        ADDI    #$0003, R0                      ; 545F   02F8 0003
        ANDI    #$00FF, R0                      ; 5461   03B8 00FF
        SLR     R0,     2                       ; 5463   0064
        SLR     R0,     1                       ; 5464   0060
        ADDR    R0,     R1                      ; 5465   00C1
        ADDI    #$01EB, R1                      ; 5466   02F9 01EB
        MVI@    R1,     R0                      ; 5468   0288
        SDBD                                    ; 5469   0001
        ANDI    #$1FEF, R0                      ; 546A   03B8 00EF 001F
        SDBD                                    ; 546D   0001
        SUBI    #$1906, R0                      ; 546E   0338 0006 0019
        BEQ     L_5477                          ; 5471   0204 0004

        CMPI    #$0008, R0                      ; 5473   0378 0008
        BNEQ    L_54AA                          ; 5475   020C 0033

L_5477:
        JSR     R4,     L_5482                  ; 5477   0004 0054 0082

        DECR    R0                              ; 547A   0010
        INCR    R0                              ; 547B   0008

        JSRD    R4,     .STIC.X.1               ; 547C   0004 0002 0001

        TSTR    R0                              ; 547F   0080
        SWAP    R0,     1                       ; 5480   0040
        NEGR    R0                              ; 5481   0020
L_5482:
        MVI     G_0328, R0                      ; 5482   0280 0328
        ANDI    #$0007, R0                      ; 5484   03B8 0007
        ADDR    R0,     R4                      ; 5486   00C4
        MVI@    R4,     R2                      ; 5487   02A2

        JSR     R4,     L_5496                  ; 5488   0004 0054 0096

        CLRC                                    ; 548B   0006
        INCR    R6                              ; 548C   000E
        INCR    R7                              ; 548D   000F
        RSWD    R7                              ; 548E   003F
        NOP                                     ; 548F   0034
        RRC     R0,     1                       ; 5490   0070
        ADDR    R7,     R0                      ; 5491   00F8
        SLR     R0,     1                       ; 5492   0060
        DECLE   $0000,  $0000,  $0000           ; 5493   0000 0000 0000
L_5496:
        MVI     G_0330, R0                      ; 5496   0280 0330
        ANDI    #$0007, R0                      ; 5498   03B8 0007
        ADDR    R0,     R4                      ; 549A   00C4
        MVII    #$0004, R3                      ; 549B   02BB 0004
        CLRR    R5                              ; 549D   01ED
L_549E:
        MOVR    R2,     R0                      ; 549E   0090
        AND@    R4,     R0                      ; 549F   03A0
        ADDR    R0,     R5                      ; 54A0   00C5
        DECR    R3                              ; 54A1   0013
        BNEQ    L_549E                          ; 54A2   022C 0005

        TSTR    R5                              ; 54A4   00AD
        BEQ     L_54AA                          ; 54A5   0204 0003

        JSR     R5,     L_68F0                  ; 54A7   0004 0168 00F0

L_54AA:
        MVI@    R1,     R0                      ; 54AA   0288
        RLC     R0,     2                       ; 54AB   0054
        BNOV    L_54B0                          ; 54AC   020A 0002
        BC      L_54BE                          ; 54AE   0201 000E

L_54B0:
        MVI     G_0330, R5                      ; 54B0   0285 0330
        ANDI    #$0004, R5                      ; 54B2   03BD 0004
        BEQ     L_54C1                          ; 54B4   0204 000B

        ADDI    #$0014, R1                      ; 54B6   02F9 0014
        MVI@    R1,     R0                      ; 54B8   0288
        RLC     R0,     2                       ; 54B9   0054
        BNOV    L_54C1                          ; 54BA   020A 0005
        BNC     L_54C1                          ; 54BC   0209 0003

L_54BE:
        JSR     R5,     L_6C86                  ; 54BE   0004 016C 0086

L_54C1:
        CLRR    R2                              ; 54C1   01D2
        MVI     G_01D3, R0                      ; 54C2   0280 01D3
        MOVR    R0,     R1                      ; 54C4   0081
        ANDI    #$0040, R1                      ; 54C5   03B9 0040
        BNEQ    L_54E3                          ; 54C7   020C 001A

        SLR     R0,     2                       ; 54C9   0064
        BEQ     L_54F6                          ; 54CA   0204 002A

        MVII    #$0338, R1                      ; 54CC   02B9 0338
L_54CE:
        INCR    R1                              ; 54CE   0009
        SARC    R0,     1                       ; 54CF   0078
        BNC     L_54CE                          ; 54D0   0229 0003

        MVI@    R1,     R0                      ; 54D2   0288
        SDBD                                    ; 54D3   0001
        CMPI    #$0871, R0                      ; 54D4   0378 0071 0008
        BEQ     L_54E3                          ; 54D7   0204 000A

        SDBD                                    ; 54D9   0001
        ANDI    #$0800, R0                      ; 54DA   03B8 0000 0008
        BNEQ    L_54F6                          ; 54DD   020C 0017

        MVO     R0,     G_01D3                  ; 54DF   0240 01D3
        B       L_54F6                          ; 54E1   0200 0013

L_54E3:
        CLRR    R0                              ; 54E3   01C0
        MVO     R0,     G_01D3                  ; 54E4   0240 01D3
        MVII    #$007F, R2                      ; 54E6   02BA 007F
        MVI     G_02F0, R0                      ; 54E8   0280 02F0
        ADDI    #$0034, R0                      ; 54EA   02F8 0034
        SDBD                                    ; 54EC   0001
        CMPI    #$1500, R0                      ; 54ED   0378 0000 0015
        BGT     L_54F6                          ; 54F0   020E 0004

        MVO     R0,     G_02F0                  ; 54F2   0240 02F0
        MVII    #$00FE, R2                      ; 54F4   02BA 00FE
L_54F6:
        MVO     R2,     G_0195                  ; 54F6   0242 0195
        MVI     G_01D3, R0                      ; 54F8   0280 01D3
        COMR    R0                              ; 54FA   0018
        AND     G_01D4, R0                      ; 54FB   0380 01D4
        XOR     G_01D3, R0                      ; 54FD   03C0 01D3
        MOVR    R0,     R1                      ; 54FF   0081
        ANDI    #$0040, R1                      ; 5500   03B9 0040
        BEQ     L_5516                          ; 5502   0204 0012

        MVII    #$0338, R1                      ; 5504   02B9 0338
L_5506:
        INCR    R1                              ; 5506   0009
        CMPI    #$033D, R1                      ; 5507   0379 033D
        BEQ     L_55B0                          ; 5509   0204 00A5

        MVI@    R1,     R0                      ; 550B   0288
        SDBD                                    ; 550C   0001
        CMPI    #$0871, R0                      ; 550D   0378 0071 0008
        BNEQ    L_5506                          ; 5510   022C 000B

        SUBI    #$0010, R1                      ; 5512   0339 0010
        B       L_551F                          ; 5514   0200 0009

L_5516:
        SLR     R0,     2                       ; 5516   0064
        BEQ     L_55B0                          ; 5517   0204 0097

        MVII    #$0328, R1                      ; 5519   02B9 0328
L_551B:
        INCR    R1                              ; 551B   0009
        SARC    R0,     1                       ; 551C   0078
        BNC     L_551B                          ; 551D   0229 0003

L_551F:
        MVII    #$0020, R0                      ; 551F   02B8 0020
        MVO     R0,     G_0192                  ; 5521   0240 0192
        MVII    #$0000, R0                      ; 5523   02B8 0000
        MVO     R0,     G_0193                  ; 5525   0240 0193
        MVI@    R1,     R0                      ; 5527   0288
        SDBD                                    ; 5528   0001
        ANDI    #$06FF, R0                      ; 5529   03B8 00FF 0006
L_552C:
        MVO@    R0,     R1                      ; 552C   0248
        MOVR    R0,     R2                      ; 552D   0082
        ANDI    #$00FF, R2                      ; 552E   03BA 00FF
        SLR     R2,     2                       ; 5530   0066
        SLR     R2,     1                       ; 5531   0062
        ADDI    #$0008, R1                      ; 5532   02F9 0008
        MVI@    R1,     R0                      ; 5534   0288
        SDBD                                    ; 5535   0001
        ANDI    #$0F7F, R0                      ; 5536   03B8 007F 000F
        MVO@    R0,     R1                      ; 5539   0248
        ANDI    #$007F, R0                      ; 553A   03B8 007F
        SLR     R0,     1                       ; 553C   0060
        ADDR    R0,     R2                      ; 553D   00C2
        SLL     R0,     2                       ; 553E   004C
        ADDR    R0,     R2                      ; 553F   00C2
        ADDI    #$01EB, R2                      ; 5540   02FA 01EB
        ADDI    #$0008, R1                      ; 5542   02F9 0008
        MVI@    R1,     R0                      ; 5544   0288
        SDBD                                    ; 5545   0001
        CMPI    #$0871, R0                      ; 5546   0378 0071 0008
        BNEQ    L_556A                          ; 5549   020C 001F

        SUBI    #$0008, R1                      ; 554B   0339 0008
        MVI@    R1,     R0                      ; 554D   0288
        ADDI    #$0008, R1                      ; 554E   02F9 0008
        MVO     R0,     G_0335                  ; 5550   0240 0335
        MVI     G_032D, R0                      ; 5552   0280 032D
        ANDI    #$02FF, R0                      ; 5554   03B8 02FF
        MVO     R0,     G_032D                  ; 5556   0240 032D
        SDBD                                    ; 5558   0001
        MVII    #$17D2, R0                      ; 5559   02B8 00D2 0017
        MVO     R0,     G_033D                  ; 555C   0240 033D
        MVII    #$000A, R0                      ; 555E   02B8 000A
        MVO     R0,     G_01A7                  ; 5560   0240 01A7
        CLRR    R0                              ; 5562   01C0
        MVO@    R0,     R2                      ; 5563   0250
        INCR    R2                              ; 5564   000A
        MVO@    R0,     R2                      ; 5565   0250
        MVII    #$0008, R0                      ; 5566   02B8 0008
        B       L_5591                          ; 5568   0200 0027

L_556A:
        MVII    #$0003, R3                      ; 556A   02BB 0003
L_556C:
        MVI@    R2,     R0                      ; 556C   0290
        ANDI    #$0007, R0                      ; 556D   03B8 0007
        SUBI    #$0002, R0                      ; 556F   0338 0002
        BNEQ    L_5574                          ; 5571   020C 0001

        MVO@    R0,     R2                      ; 5573   0250
L_5574:
        INCR    R2                              ; 5574   000A
        DECR    R3                              ; 5575   0013
        BNEQ    L_556C                          ; 5576   022C 000B

        MVI@    R1,     R4                      ; 5578   028C
        MVII    #$000A, R0                      ; 5579   02B8 000A
        SDBD                                    ; 557B   0001
        CMPI    #$0800, R4                      ; 557C   037C 0000 0008
        BEQ     L_5591                          ; 557F   0204 0010

        MVII    #$0006, R0                      ; 5581   02B8 0006
        SDBD                                    ; 5583   0001
        CMPI    #$28D6, R4                      ; 5584   037C 00D6 0028
        BEQ     L_5591                          ; 5587   0204 0008

        SDBD                                    ; 5589   0001
        CMPI    #$1861, R4                      ; 558A   037C 0061 0018
        BNEQ    L_55B0                          ; 558D   020C 0021

        MVII    #$0003, R0                      ; 558F   02B8 0003
L_5591:
        SDBD                                    ; 5591   0001
        MVII    #$17D2, R5                      ; 5592   02BD 00D2 0017
        MVO@    R5,     R1                      ; 5595   024D
        SUBI    #$0196, R1                      ; 5596   0339 0196
        MVII    #$000A, R5                      ; 5598   02BD 000A
        MVO@    R5,     R1                      ; 559A   024D
        SUBI    #$01A3, R1                      ; 559B   0339 01A3
        MOVR    R1,     R2                      ; 559D   008A
        SLL     R1,     1                       ; 559E   0049
        ADDI    #$01B4, R1                      ; 559F   02F9 01B4
        CLRR    R5                              ; 55A1   01ED
        MVO@    R5,     R1                      ; 55A2   024D
        MOVR    R2,     R1                      ; 55A3   0091
        SLL     R1,     2                       ; 55A4   004D
        ADDR    R2,     R1                      ; 55A5   00D1
        ADDI    #$01BC, R1                      ; 55A6   02F9 01BC
        DECR    R5                              ; 55A8   0015
        MVO@    R5,     R1                      ; 55A9   024D

        JSR     R5,     L_68F0                  ; 55AA   0004 0168 00F0
        JSR     R4,     L_6AB3                  ; 55AD   0004 0068 02B3

L_55B0:
        MVI     G_01D3, R0                      ; 55B0   0280 01D3
        SLR     R0,     2                       ; 55B2   0064
        BEQ     L_55B8                          ; 55B3   0204 0003
        J       L_6A1D                          ; 55B5   0004 0368 021D

L_55B8:
        MVO     R0,     G_01D4                  ; 55B8   0240 01D4
        MVI     G_0327, R0                      ; 55BA   0280 0327
        ANDI    #$00FF, R0                      ; 55BC   03B8 00FF
        MOVR    R0,     R1                      ; 55BE   0081
        ANDI    #$0007, R0                      ; 55BF   03B8 0007
        SLR     R1,     2                       ; 55C1   0065
        SLR     R1,     1                       ; 55C2   0061
        ADDI    #$02C7, R1                      ; 55C3   02F9 02C7
        MOVR    R1,     R5                      ; 55C5   008D
        MVI     G_01B0, R3                      ; 55C6   0283 01B0
        SLL     R3,     2                       ; 55C8   004F
        SLL     R3,     1                       ; 55C9   004B
        SDBD                                    ; 55CA   0001
        ADDI    #$63C7, R3                      ; 55CB   02FB 00C7 0063
        MVI     G_01D1, R2                      ; 55CE   0282 01D1
        INCR    R2                              ; 55D0   000A
        MOVR    R2,     R1                      ; 55D1   0091
        NEGR    R1                              ; 55D2   0021
        ADDI    #$0008, R1                      ; 55D3   02F9 0008
        PSHR    R5                              ; 55D5   0275

        JSR     R4,     L_69E1                  ; 55D6   0004 0068 01E1

        PULR    R5                              ; 55D9   02B5
        ADDI    #$0014, R5                      ; 55DA   02FD 0014
        MVI     G_01D1, R2                      ; 55DC   0282 01D1
        NEGR    R2                              ; 55DE   0022
        ADDI    #$0007, R2                      ; 55DF   02FA 0007
        BEQ     L_55E9                          ; 55E1   0204 0006

        CLRR    R1                              ; 55E3   01C9
        PSHR    R5                              ; 55E4   0275

        JSR     R4,     L_69E1                  ; 55E5   0004 0068 01E1

        PULR    R5                              ; 55E8   02B5

L_55E9:
        JSR     R5,     L_6B5E                  ; 55E9   0004 0168 035E

        MVI     G_012C, R0                      ; 55EC   0280 012C
        SARC    R0,     1                       ; 55EE   0078
        BNC     L_55F6                          ; 55EF   0209 0005

        JSR     R5,     L_610C                  ; 55F1   0004 0160 010C

        B       L_55F9                          ; 55F4   0200 0003

L_55F6:
        JSR     R5,     L_6C2A                  ; 55F6   0004 016C 002A

L_55F9:
        MVI     G_0190, R1                      ; 55F9   0281 0190
        ANDI    #$001F, R1                      ; 55FB   03B9 001F
        SDBD                                    ; 55FD   0001
        ADDI    #$6403, R1                      ; 55FE   02F9 0003 0064
        MVI@    R1,     R0                      ; 5601   0288
        MVI     G_02F8, R1                      ; 5602   0281 02F8
        SWAP    R1,     1                       ; 5604   0041
        ANDI    #$00FF, R1                      ; 5605   03B9 00FF
        MOVR    R1,     R5                      ; 5607   008D
        CLRR    R1                              ; 5608   01C9
        CLRR    R2                              ; 5609   01D2
        MVI     G_018C, R3                      ; 560A   0283 018C
        SUBI    #$00FE, R3                      ; 560C   033B 00FE
        BEQ     L_5612                          ; 560E   0204 0002

        MVII    #$0003, R3                      ; 5610   02BB 0003
L_5612:
        SDBD                                    ; 5612   0001
        ADDI    #$08B0, R3                      ; 5613   02FB 00B0 0008
        CMPI    #$0009, R5                      ; 5616   037D 0009
        BPL     L_561E                          ; 5618   0203 0004

L_561A:
        ANDI    #$000E, R0                      ; 561A   03B8 000E
        B       L_5624                          ; 561C   0200 0006

L_561E:
        CMPI    #$0081, R5                      ; 561E   037D 0081
        BMI     L_5624                          ; 5620   020B 0002

        ANDI    #$000D, R0                      ; 5622   03B8 000D
L_5624:
        RRC     R0,     2                       ; 5624   0074
        BC      L_5629                          ; 5625   0201 0002
        BNOV    L_563A                          ; 5627   020A 0011

L_5629:
        RLC     R1,     2                       ; 5629   0055
        ADDI    #$0010, R3                      ; 562A   02FB 0010
        CMP     G_01B0, R1                      ; 562C   0341 01B0
        BNEQ    L_5632                          ; 562E   020C 0002

        MVI     G_02FA, R2                      ; 5630   0282 02FA
L_5632:
        ADDI    #$0008, R2                      ; 5632   02FA 0008
        CMPI    #$0100, R2                      ; 5634   037A 0100
        BMI     L_563A                          ; 5636   020B 0002

        MVII    #$0100, R2                      ; 5638   02BA 0100
L_563A:
        MVO     R2,     G_02FA                  ; 563A   0242 02FA
        MVO     R3,     G_0337                  ; 563C   0243 0337
        MVO     R1,     G_01B0                  ; 563E   0241 01B0
        MVI     G_02FB, R2                      ; 5640   0282 02FB
        MVO     R0,     G_0194                  ; 5642   0240 0194
        RRC     R0,     2                       ; 5644   0074
        BC      L_5659                          ; 5645   0201 0012
        BOV     L_564F                          ; 5647   0202 0006

        CMPI    #$0080, R2                      ; 5649   037A 0080
        BEQ     L_5661                          ; 564B   0204 0014
        BMI     L_5659                          ; 564D   020B 000A

L_564F:
        SUBI    #$0002, R2                      ; 564F   033A 0002
        CMPI    #$0048, R2                      ; 5651   037A 0048
        BPL     L_5661                          ; 5653   0203 000C

        MVII    #$0048, R2                      ; 5655   02BA 0048
        B       L_5661                          ; 5657   0200 0008

L_5659:
        ADDI    #$0001, R2                      ; 5659   02FA 0001
        CMPI    #$0100, R2                      ; 565B   037A 0100
        BMI     L_5661                          ; 565D   020B 0002

        MVII    #$0100, R2                      ; 565F   02BA 0100
L_5661:
        MVO     R2,     G_02FB                  ; 5661   0242 02FB
        MVI     G_01B0, R1                      ; 5663   0281 01B0
        MVI     G_02FA, R3                      ; 5665   0283 02FA
        ANDI    #$0002, R1                      ; 5667   03B9 0002
        BEQ     L_566C                          ; 5669   0204 0001

        NEGR    R3                              ; 566B   0023
L_566C:
        SWAP    R1,     1                       ; 566C   0041
        SLL     R1,     1                       ; 566D   0049
        MVI     G_02FB, R2                      ; 566E   0282 02FB
        ADD     G_02F9, R2                      ; 5670   02C2 02F9
        MVO     R2,     G_02F9                  ; 5672   0242 02F9
        SWAP    R2,     1                       ; 5674   0042
        ANDI    #$0007, R2                      ; 5675   03BA 0007
        MVO     R2,     G_01D1                  ; 5677   0242 01D1
        NEGR    R2                              ; 5679   0022
        MOVR    R2,     R4                      ; 567A   0094
        ADDI    #$00DF, R2                      ; 567B   02FA 00DF
        XORR    R1,     R2                      ; 567D   01CA
        MVO     R2,     G_032F                  ; 567E   0242 032F
        MVI     G_01B3, R0                      ; 5680   0280 01B3
        TSTR    R0                              ; 5682   0080
        BEQ     L_56A7                          ; 5683   0204 0022

        SUBI    #$0003, R0                      ; 5685   0338 0003
        CMPI    #$000C, R0                      ; 5687   0378 000C
        BPL     L_5692                          ; 5689   0203 0007

        CLRR    R0                              ; 568B   01C0
        MVO     R0,     G_01B3                  ; 568C   0240 01B3
        MVO     R0,     G_0330                  ; 568E   0240 0330
        B       L_56A7                          ; 5690   0200 0015

L_5692:
        MVO     R0,     G_01B3                  ; 5692   0240 01B3
        ADDR    R4,     R0                      ; 5694   00E0
        MVO     R0,     G_0330                  ; 5695   0240 0330
        MVI     G_018C, R0                      ; 5697   0280 018C
        SUBI    #$00FE, R0                      ; 5699   0338 00FE
        BEQ     L_569F                          ; 569B   0204 0002

        MVII    #$0003, R0                      ; 569D   02B8 0003
L_569F:
        SDBD                                    ; 569F   0001
        ADDI    #$0610, R0                      ; 56A0   02F8 0010 0006
        MVO     R0,     G_0338                  ; 56A3   0240 0338
        B       L_56C6                          ; 56A5   0200 001F

L_56A7:
        MVI     G_0190, R0                      ; 56A7   0280 0190
        ANDI    #$00E0, R0                      ; 56A9   03B8 00E0
        CMPI    #$0040, R0                      ; 56AB   0378 0040
        BEQ     L_56B7                          ; 56AD   0204 0008

        CMPI    #$0080, R0                      ; 56AF   0378 0080
        BEQ     L_56B7                          ; 56B1   0204 0004

        CMPI    #$0020, R0                      ; 56B3   0378 0020
        BNEQ    L_56C6                          ; 56B5   020C 000F

L_56B7:
        ANDI    #$007F, R2                      ; 56B7   03BA 007F
        MVO     R2,     G_0330                  ; 56B9   0242 0330
        MVII    #$0052, R0                      ; 56BB   02B8 0052
        MVO     R0,     G_0338                  ; 56BD   0240 0338
        SUBR    R4,     R2                      ; 56BF   0122
        MVO     R2,     G_01B3                  ; 56C0   0242 01B3
        MVII    #$0010, R0                      ; 56C2   02B8 0010
        MVO     R0,     G_0197                  ; 56C4   0240 0197
L_56C6:
        ADD     G_02F8, R3                      ; 56C6   02C3 02F8
        MVO     R3,     G_02F8                  ; 56C8   0243 02F8
        SLR     R1,     2                       ; 56CA   0065
        SUBR    R1,     R3                      ; 56CB   010B
        SWAP    R3,     1                       ; 56CC   0043
        ANDI    #$00FF, R3                      ; 56CD   03BB 00FF
        XORI    #$0300, R3                      ; 56CF   03FB 0300
        MVO     R3,     G_0327                  ; 56D1   0243 0327
        MVO     R3,     G_0328                  ; 56D3   0243 0328
        MVII    #$01BC, R4                      ; 56D5   02BC 01BC
        MVII    #$0328, R3                      ; 56D7   02BB 0328
L_56D9:
        INCR    R3                              ; 56D9   000B
        MVI@    R4,     R0                      ; 56DA   02A0
        DECR    R0                              ; 56DB   0010
        BPL     L_5725                          ; 56DC   0203 0047

        MVI@    R4,     R0                      ; 56DE   02A0
        MVI@    R4,     R1                      ; 56DF   02A1
        SLL     R1,     1                       ; 56E0   0049
        DECR    R1                              ; 56E1   0011
        NEGR    R1                              ; 56E2   0021
        TSTR    R0                              ; 56E3   0080
        BEQ     L_570F                          ; 56E4   0204 0029

        MVI     G_012C, R0                      ; 56E6   0280 012C
        CMPI    #$01C6, R4                      ; 56E8   037C 01C6
        BPL     L_56EE                          ; 56EA   0203 0002

        XORI    #$0001, R0                      ; 56EC   03F8 0001
L_56EE:
        SARC    R0,     1                       ; 56EE   0078
        BNC     L_572D                          ; 56EF   0209 003C

        ADD@    R3,     R1                      ; 56F1   02D9
        MVO@    R1,     R3                      ; 56F2   0259
        ANDI    #$00FF, R1                      ; 56F3   03B9 00FF
        CMP@    R4,     R1                      ; 56F5   0361
        BEQ     L_56FC                          ; 56F6   0204 0004

        CMP@    R4,     R1                      ; 56F8   0361
        BNEQ    L_572F                          ; 56F9   020C 0034

        INCR    R7                              ; 56FB   000F
L_56FC:
        INCR    R4                              ; 56FC   000C
        SUBI    #$0003, R4                      ; 56FD   033C 0003
        MVI@    R4,     R0                      ; 56FF   02A0
        XORI    #$0001, R0                      ; 5700   03F8 0001
        DECR    R4                              ; 5702   0014
        MVO@    R0,     R4                      ; 5703   0260
        ADDI    #$0008, R3                      ; 5704   02FB 0008
        MVII    #$0004, R0                      ; 5706   02B8 0004
        SWAP    R0,     1                       ; 5708   0040
        XOR@    R3,     R0                      ; 5709   03D8
        MVO@    R0,     R3                      ; 570A   0258
        SUBI    #$0008, R3                      ; 570B   033B 0008
        B       L_572D                          ; 570D   0200 001E

L_570F:
        ADDI    #$0002, R4                      ; 570F   02FC 0002
        ADD@    R3,     R1                      ; 5711   02D9
        ANDI    #$00FF, R1                      ; 5712   03B9 00FF
        TSTR    R1                              ; 5714   0089
        BNEQ    L_571B                          ; 5715   020C 0004

        MVII    #$0080, R1                      ; 5717   02B9 0080
        B       L_5720                          ; 5719   0200 0005

L_571B:
        CMPI    #$0080, R1                      ; 571B   0379 0080
        BNEQ    L_5720                          ; 571D   020C 0001

        CLRR    R1                              ; 571F   01C9
L_5720:
        XORI    #$0300, R1                      ; 5720   03F9 0300
        MVO@    R1,     R3                      ; 5722   0259
        B       L_572F                          ; 5723   0200 000A

L_5725:
        CMPI    #$00FE, R0                      ; 5725   0378 00FE
        BEQ     L_572B                          ; 5727   0204 0002

        DECR    R4                              ; 5729   0014
        MVO@    R0,     R4                      ; 572A   0260
L_572B:
        ADDI    #$0002, R4                      ; 572B   02FC 0002
L_572D:
        ADDI    #$0002, R4                      ; 572D   02FC 0002
L_572F:
        CMPI    #$01D0, R4                      ; 572F   037C 01D0
        BNEQ    L_56D9                          ; 5731   022C 0059

        JSR     R5,     L_6B99                  ; 5733   0004 0168 0399
        JSR     R5,     L_6BFE                  ; 5736   0004 0168 03FE
        JSR     R5,     L_645B                  ; 5739   0004 0164 005B

        EIS                                     ; 573C   0002
        DECR    R7                              ; 573D   0017
L_573E:
        PSHR    R5                              ; 573E   0275
        SDBD                                    ; 573F   0001
        MVII    #$58E0, R4                      ; 5740   02BC 00E0 0058
        SDBD                                    ; 5743   0001
        MVII    #$3800, R1                      ; 5744   02B9 0000 0038
        MVII    #$0200, R0                      ; 5747   02B8 0200

        JSR     R5,     .EXEC.730               ; 5749   0004 0114 0330

        SDBD                                    ; 574C   0001
        MVII    #$09BA, R0                      ; 574D   02B8 00BA 0009
        MVO     R0,     .BTAB.68                ; 5750   0240 0268
        SUBI    #$0100, R0                      ; 5752   0338 0100
        MVO     R0,     .BTAB.6D                ; 5754   0240 026D
        SUBI    #$0028, R0                      ; 5756   0338 0028
        MVO     R0,     .BTAB.5D                ; 5758   0240 025D
        SUBI    #$0090, R0                      ; 575A   0338 0090
        MVO     R0,     .BTAB.07                ; 575C   0240 0207
        MVO     R0,     .BTAB.38                ; 575E   0240 0238
        MVII    #$0209, R4                      ; 5760   02BC 0209
        SDBD                                    ; 5762   0001
        MVII    #$58CD, R5                      ; 5763   02BD 00CD 0058
        MVII    #$000A, R3                      ; 5766   02BB 000A
L_5768:
        MVI@    R5,     R1                      ; 5768   02A9
L_5769:
        MVO@    R0,     R4                      ; 5769   0260
        ADDI    #$0008, R0                      ; 576A   02F8 0008
        DECR    R1                              ; 576C   0011
        BNEQ    L_5769                          ; 576D   022C 0005

        ADD@    R5,     R4                      ; 576F   02EC
        DECR    R3                              ; 5770   0013
        BNEQ    L_5768                          ; 5771   022C 000A

        PULR    R7                              ; 5773   02B7
        PSHR    R5                              ; 5774   0275
        SDBD                                    ; 5775   0001
        MVII    #$0520, R0                      ; 5776   02B8 0020 0005
        MVO     R0,     .BTAB.CA                ; 5779   0240 02CA
        MVO     R0,     .BTAB.D8                ; 577B   0240 02D8
        ADDI    #$0008, R0                      ; 577D   02F8 0008
        MVO     R0,     .BTAB.D9                ; 577F   0240 02D9
        MVO     R0,     .BTAB.CB                ; 5781   0240 02CB
        MVI     G_012C, R0                      ; 5783   0280 012C
        INCR    R0                              ; 5785   0008
        MVO     R0,     G_012C                  ; 5786   0240 012C
        ANDI    #$000F, R0                      ; 5788   03B8 000F
        NEGR    R0                              ; 578A   0020
        BNEQ    L_57B8                          ; 578B   020C 002B

        MVI     G_01ED, R1                      ; 578D   0281 01ED
        MVII    #$0011, R4                      ; 578F   02BC 0011
        MVII    #$0007, R3                      ; 5791   02BB 0007
L_5793:
        SDBD                                    ; 5793   0001
        MVII    #$5866, R2                      ; 5794   02BA 0066 0058
        CMPI    #$0067, R1                      ; 5797   0379 0067
        BMI     L_579D                          ; 5799   020B 0002

        SUBI    #$0067, R1                      ; 579B   0339 0067
L_579D:
        ADDR    R1,     R2                      ; 579D   00CA
        MVI@    R2,     R5                      ; 579E   0295
        CMPI    #$03FF, R5                      ; 579F   037D 03FF
        BNEQ    L_57A7                          ; 57A1   020C 0004

        SDBD                                    ; 57A3   0001
        MVII    #$09F2, R5                      ; 57A4   02BD 00F2 0009
L_57A7:
        SDBD                                    ; 57A7   0001
        XORI    #$3000, R5                      ; 57A8   03FD 0000 0030
        MVO@    R5,     R4                      ; 57AB   0265
        INCR    R1                              ; 57AC   0009
        DECR    R3                              ; 57AD   0013
        BNEQ    L_5793                          ; 57AE   022C 001C

        SUBI    #$0006, R1                      ; 57B0   0339 0006
        BPL     L_57B6                          ; 57B2   0203 0002

        ADDI    #$0067, R1                      ; 57B4   02F9 0067
L_57B6:
        MVO     R1,     G_01ED                  ; 57B6   0241 01ED
L_57B8:
        ADDI    #$022C, R0                      ; 57B8   02F8 022C
        MVII    #$0001, R4                      ; 57BA   02BC 0001
        MVII    #$0009, R5                      ; 57BC   02BD 0009
        MVII    #$005C, R1                      ; 57BE   02B9 005C
        MVII    #$0007, R3                      ; 57C0   02BB 0007
L_57C2:
        MVO@    R0,     R4                      ; 57C2   0260
        ADDI    #$0010, R0                      ; 57C3   02F8 0010
        MVO@    R1,     R5                      ; 57C5   0269
        DECR    R3                              ; 57C6   0013
        BNEQ    L_57C2                          ; 57C7   022C 0006

        MVI     G_019E, R2                      ; 57C9   0282 019E
        DECR    R2                              ; 57CB   0012
        MVO     R2,     G_019E                  ; 57CC   0242 019E
        BPL     L_582E                          ; 57CE   0203 005E

        MVII    #$0002, R2                      ; 57D0   02BA 0002
        MVO     R2,     G_019E                  ; 57D2   0242 019E
        MVI     G_019C, R1                      ; 57D4   0281 019C
        CMPI    #$0014, R1                      ; 57D6   0379 0014
        BNEQ    L_57EC                          ; 57D8   020C 0012

        MVI     G_019B, R2                      ; 57DA   0282 019B
        INCR    R2                              ; 57DC   000A
        ANDI    #$001F, R2                      ; 57DD   03BA 001F
        MVO     R2,     G_019B                  ; 57DF   0242 019B
        BNEQ    L_582E                          ; 57E1   020C 004B

        CLRR    R1                              ; 57E3   01C9
        MVO     R1,     G_019C                  ; 57E4   0241 019C
        MVI     G_019D, R0                      ; 57E6   0280 019D
        XORI    #$0014, R0                      ; 57E8   03F8 0014
        MVO     R0,     G_019D                  ; 57EA   0240 019D
L_57EC:
        MVI     G_031D, R0                      ; 57EC   0280 031D
        INCR    R0                              ; 57EE   0008
        ANDI    #$0003, R0                      ; 57EF   03B8 0003
        MVO     R0,     G_031D                  ; 57F1   0240 031D
        SLL     R0,     1                       ; 57F3   0048
        ADDR    R0,     R7                      ; 57F4   00C7
        B       L_5822                          ; 57F5   0200 002B
        B       L_580E                          ; 57F7   0200 0015
        B       L_5806                          ; 57F9   0200 000B

        ADD     G_019D, R1                      ; 57FB   02C1 019D
        SDBD                                    ; 57FD   0001
        ADDI    #$583E, R1                      ; 57FE   02F9 003E 0058
        MVI@    R1,     R0                      ; 5801   0288
        MVO     R0,     .STIC.A.0               ; 5802   0240 0010
        B       L_582E                          ; 5804   0200 0028

L_5806:
        SDBD                                    ; 5806   0001
        MVII    #$1068, R0                      ; 5807   02B8 0068 0010
        MVO     R0,     .STIC.A.0               ; 580A   0240 0010
        B       L_582E                          ; 580C   0200 0020

L_580E:
        MOVR    R1,     R0                      ; 580E   0088
        SLL     R0,     2                       ; 580F   004C
        SLL     R0,     1                       ; 5810   0048
        ADDI    #$0208, R0                      ; 5811   02F8 0208
        MVO     R0,     .STIC.X.0               ; 5813   0240 0000
        MVII    #$0052, R0                      ; 5815   02B8 0052
        MVO     R0,     .STIC.Y.0               ; 5817   0240 0008
        ADDI    #$02B4, R1                      ; 5819   02F9 02B4
        MVI@    R1,     R0                      ; 581B   0288
        MVO     R0,     .STIC.A.0               ; 581C   0240 0010
        CLRR    R0                              ; 581E   01C0
        MVO@    R0,     R1                      ; 581F   0248
        B       L_582E                          ; 5820   0200 000C

L_5822:
        MVI     .STIC.A.0,R0                    ; 5822   0280 0010
        INCR    R1                              ; 5824   0009
        MVO     R1,     G_019C                  ; 5825   0241 019C
        DECR    R1                              ; 5827   0011
        ADDI    #$02B4, R1                      ; 5828   02F9 02B4
        MVO@    R0,     R1                      ; 582A   0248
        CLRR    R0                              ; 582B   01C0
        MVO     R0,     .STIC.A.0               ; 582C   0240 0010
L_582E:
        MVI     G_033F, R0                      ; 582E   0280 033F
        INCR    R0                              ; 5830   0008
        BEQ     L_583D                          ; 5831   0204 000A

        MVI     G_012C, R1                      ; 5833   0281 012C
        ANDI    #$0003, R1                      ; 5835   03B9 0003
        BNEQ    L_583B                          ; 5837   020C 0002

        MVO     R0,     G_033F                  ; 5839   0240 033F
L_583B:
        MVO     R0,     .STIC.VIDEN             ; 583B   0240 0020
L_583D:
        PULR    R7                              ; 583D   02B7
        SUBR    R3,     R4                      ; 583E   011C
        DECLE   $027C                           ; 583F   027C

        MVI     .BTAB.CC,R4                     ; 5840   0284 02CC
        MVI@    R2,     R4                      ; 5842   0294
        MVO@    R4,     R1                      ; 5843   024C
        DECLE   $023C                           ; 5844   023C

        MVO     R4,     .BTAB.A4                ; 5845   0244 02A4

        JSR     R4,     G_8CCC                  ; 5847   0004 008C 00CC

        ADDR    R0,     R4                      ; 584A   00C4
        MOVR    R2,     R4                      ; 584B   0094
        SLR     R0,     2                       ; 584C   0064

        JSR     R4,     G_8CCC                  ; 584D   0004 008C 00CC

        ADDR    R0,     R4                      ; 5850   00C4
        MOVR    R3,     R4                      ; 5851   009C
        DIS                                     ; 5852   0003
        DIS                                     ; 5853   0003
        SUBR    R1,     R3                      ; 5854   010B
        DECLE   $021B                           ; 5855   021B

        MVI@    R4,     R3                      ; 5856   02A3
        MVO@    R3,     R1                      ; 5857   024B
        PULR    R3                              ; 5858   02B3
        MVO@    R3,     R1                      ; 5859   024B
        MVI@    R3,     R3                      ; 585A   029B
        MVO@    R3,     R1                      ; 585B   024B
        DECLE   $027B                           ; 585C   027B

        PSHR    R3                              ; 585D   0273
        SLR     R3,     1                       ; 585E   0063
        DIS                                     ; 585F   0003
        CMPR    R1,     R3                      ; 5860   014B
        PSHR    R3                              ; 5861   0273
        DECLE   $021B                           ; 5862   021B

        RRC     R3,     1                       ; 5863   0073
        DIS                                     ; 5864   0003
        DIS                                     ; 5865   0003
        RRC     R0,     1                       ; 5866   0070
        RRC     R0,     1                       ; 5867   0070
        RRC     R0,     1                       ; 5868   0070
        ANDR    R3,     R6                      ; 5869   019E
        MVI@    R4,     R6                      ; 586A   02A6
L_586B:
        BGT     L_5AE3                          ; 586B   020E 0276
        BLE     L_5660                          ; 586D   0226 020E

        MVI@    R2,     R6                      ; 586F   0296
        BLE     L_586B                          ; 5870   0226 0006

        DECLE   $023E                           ; 5872   023E

        BGT     L_5AE3                          ; 5873   020E 026E
        BGT     L_57A0                          ; 5875   022E 00D6

        CLRC                                    ; 5877   0006
        SUBR    R5,     R6                      ; 5878   012E
        PSHR    R6                              ; 5879   0276
        MVI@    R4,     R6                      ; 587A   02A6
        BGT     L_55E6                          ; 587B   022E 0296

        CLRC                                    ; 587D   0006
        PSHR    R6                              ; 587E   0276
        MVI@    R5,     R6                      ; 587F   02AE
        MVO@    R6,     R5                      ; 5880   026E
        DECLE   $0216                           ; 5881   0216

        BGT     L_55ED                          ; 5882   022E 0296

        CLRC                                    ; 5884   0006
        DECLE   $027E,  $0236                   ; 5885   027E 0236

        CLRC                                    ; 5887   0006
        MVI     .BTAB.66,R6                     ; 5888   0286 0266
        BGT     L_5B5A                          ; 588A   020E 02CE
        BGT     L_55F7                          ; 588C   022E 0296

        MVI@    R3,     R6                      ; 588E   029E
        CLRC                                    ; 588F   0006
        SWAP    R2,     2                       ; 5890   0046
        MOVR    R1,     R6                      ; 5891   008E
        CLRC                                    ; 5892   0006
        DECLE   $027E                           ; 5893   027E

        MVI@    R2,     R6                      ; 5894   0296
        CLRC                                    ; 5895   0006
        MOVR    R2,     R6                      ; 5896   0096
        SLL     R2,     2                       ; 5897   004E
        RRC     R0,     1                       ; 5898   0070
        RRC     R0,     1                       ; 5899   0070
        RRC     R0,     1                       ; 589A   0070
        SUBR    R3,     R0                      ; 589B   0118
        SKIP                                    ; 589C   0208
        MVI@    R2,     R0                      ; 589D   0290
        DECLE   $0278                           ; 589E   0278

        MVO@    R0,     R4                      ; 589F   0260
        DECLE   $0000                           ; 58A0   0000

        ANDR    R3,     R0                      ; 58A1   0198
        MVO     R0,     .BTAB.08                ; 58A2   0240 0208
        MVII    #$0038, R0                      ; 58A4   02B8 0038
        MVI@    R3,     R0                      ; 58A6   0298
        DECLE   $0000                           ; 58A7   0000

        ANDR    R2,     R2                      ; 58A8   0192
        MVO@    R2,     R1                      ; 58A9   024A
        PULR    R2                              ; 58AA   02B2
        BNOV    L_561A                          ; 58AB   022A 0292

        EIS                                     ; 58AD   0002
        ANDR    R2,     R2                      ; 58AE   0192
        BNOV    L_5AFB                          ; 58AF   020A 024A
        BOV     L_54B3                          ; 58B1   0222 03FF

        DECLE   $0000                           ; 58B3   0000

        SUBR    R1,     R0                      ; 58B4   0108
        B       L_56AE                          ; 58B5   0220 0208

        MVI     .BTAB.A0,R0                     ; 58B7   0280 02A0
        DECLE   $0228                           ; 58B9   0228

        B       L_58BB                          ; 58BA   0220 0000

        DECLE   $0210                           ; 58BC   0210

        ADD@    R1,     R0                      ; 58BD   02C8
        DECLE   $0000                           ; 58BE   0000

        ANDR    R0,     R0                      ; 58BF   0180
        DECLE   $0228                           ; 58C0   0228

        MVI@    R4,     R0                      ; 58C1   02A0
        DECLE   $0228                           ; 58C2   0228

        MVI@    R2,     R0                      ; 58C3   0290
        DECLE   $0000                           ; 58C4   0000

        CMPR    R3,     R0                      ; 58C5   0158
        SKIP                                    ; 58C6   0208
        MVO@    R0,     R5                      ; 58C7   0268
        MVO@    R0,     R1                      ; 58C8   0248
        PSHR    R0                              ; 58C9   0270
        MVI@    R3,     R0                      ; 58CA   0298
        MVO@    R0,     R3                      ; 58CB   0258
        MVO@    R0,     R1                      ; 58CC   0248
        DECLE   $0005                           ; 58CD   0005

        INCR    R2                              ; 58CE   000A
        INCR    R1                              ; 58CF   0009
        INCR    R2                              ; 58D0   000A
        INCR    R5                              ; 58D1   000D
        INCR    R0                              ; 58D2   0008
        INCR    R5                              ; 58D3   000D
        SETC                                    ; 58D4   0007
        INCR    R1                              ; 58D5   0009
        DECLE   $0001                           ; 58D6   0001

        DIS                                     ; 58D7   0003
        INCR    R3                              ; 58D8   000B
        DECLE   $0001,  $0001,  $0005           ; 58D9   0001 0001 0005

        INCR    R5                              ; 58DC   000D
        DECLE   $0001,  $0001,  $0001,  $0000   ; 58DD   0001 0001 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58E1   0000 0000 0000 0000
        DECLE   $0000                           ; 58E5   0000

        NEGR    R0                              ; 58E6   0020
        ADDR    R6,     R0                      ; 58E7   00F0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58E8   0000 0000 0000 0000
        DECLE   $0000                           ; 58EC   0000

        SETC                                    ; 58ED   0007
        COMR    R7                              ; 58EE   001F
        CLRC                                    ; 58EF   0006
        DECLE   $0000,  $0000,  $0000           ; 58F0   0000 0000 0000

        DIS                                     ; 58F3   0003
        SLLC    R3,     2                       ; 58F4   005F
        ADDR    R3,     R4                      ; 58F5   00DC
        ADDR    R7,     R0                      ; 58F6   00F8
        ADDR    R7,     R0                      ; 58F7   00F8
        DECLE   $0000,  $0001                   ; 58F8   0000 0001

        RSWD    R7                              ; 58FA   003F
        ADDR    R7,     R7                      ; 58FB   00FF
        ADDR    R7,     R7                      ; 58FC   00FF
        COMR    R7                              ; 58FD   001F
        COMR    R7                              ; 58FE   001F
        RSWD    R4                              ; 58FF   003C
        DECLE   $0000                           ; 5900   0000

        TSTR    R0                              ; 5901   0080
        ADDR    R0,     R0                      ; 5902   00C0
        ADDR    R4,     R0                      ; 5903   00E0
        ADDR    R0,     R0                      ; 5904   00C0
        TSTR    R0                              ; 5905   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5906   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 590A   0000 0000 0000 0000
        DECLE   $0001                           ; 590E   0001

        ADDR    R3,     R7                      ; 590F   00DF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5910   0000 0000 0000 0000

        DIS                                     ; 5914   0003
        ADCR    R7                              ; 5915   002F
        ADDR    R7,     R7                      ; 5916   00FF
        ADDR    R7,     R7                      ; 5917   00FF
        DECLE   $0001                           ; 5918   0001

        DIS                                     ; 5919   0003
        DIS                                     ; 591A   0003
        DECLE   $0001                           ; 591B   0001

        ADDR    R3,     R0                      ; 591C   00D8
        ADDR    R7,     R5                      ; 591D   00FD
        ADDR    R7,     R7                      ; 591E   00FF
        ADDR    R7,     R3                      ; 591F   00FB
        ADDR    R4,     R0                      ; 5920   00E0
        ADDR    R4,     R0                      ; 5921   00E0
        SWAP    R1,     1                       ; 5922   0041
        DIS                                     ; 5923   0003
        NEGR    R7                              ; 5924   0027
        ADDR    R7,     R7                      ; 5925   00FF
        ADDR    R6,     R7                      ; 5926   00F7
        ADDR    R4,     R3                      ; 5927   00E3
        INCR    R6                              ; 5928   000E
        SETC                                    ; 5929   0007
        MOVR    R0,     R7                      ; 592A   0087
        ADDR    R1,     R7                      ; 592B   00CF
        ADDR    R1,     R7                      ; 592C   00CF
        MOVR    R1,     R7                      ; 592D   008F
        ADDR    R3,     R7                      ; 592E   00DF
        ADDR    R3,     R4                      ; 592F   00DC
        ADDR    R4,     R0                      ; 5930   00E0
        ADDR    R0,     R0                      ; 5931   00C0
        MOVR    R6,     R3                      ; 5932   00B3
        ADDR    R7,     R7                      ; 5933   00FF
        ADDR    R7,     R7                      ; 5934   00FF
        ADDR    R7,     R6                      ; 5935   00FE
        ADDR    R6,     R0                      ; 5936   00F0
        ADDR    R7,     R0                      ; 5937   00F8
        INCR    R0                              ; 5938   0008
        SARC    R2,     2                       ; 5939   007E
        ADDR    R7,     R6                      ; 593A   00FE
        ADDR    R7,     R4                      ; 593B   00FC
        ADDR    R5,     R0                      ; 593C   00E8
        DECLE   $0000                           ; 593D   0000

        INCR    R4                              ; 593E   000C
        ADDR    R7,     R4                      ; 593F   00FC
        ADDR    R7,     R0                      ; 5940   00F8
        SARC    R1,     1                       ; 5941   0079
        SARC    R3,     1                       ; 5942   007B
        SARC    R3,     2                       ; 5943   007F
        SARC    R3,     1                       ; 5944   007B
        ADDR    R7,     R3                      ; 5945   00FB
        ADDR    R7,     R5                      ; 5946   00FD
        ADDR    R7,     R0                      ; 5947   00F8
        ADDR    R7,     R4                      ; 5948   00FC
        ADDR    R0,     R0                      ; 5949   00C0
        TSTR    R0                              ; 594A   0080
        ADDR    R0,     R0                      ; 594B   00C0
        ADDR    R4,     R0                      ; 594C   00E0
        ADDR    R7,     R0                      ; 594D   00F8
        ADDR    R7,     R6                      ; 594E   00FE
        ADDR    R7,     R7                      ; 594F   00FF
        DIS                                     ; 5950   0003
        SETC                                    ; 5951   0007
        RSWD    R7                              ; 5952   003F
        RSWD    R7                              ; 5953   003F
        COMR    R7                              ; 5954   001F
        COMR    R6                              ; 5955   001E
        INCR    R0                              ; 5956   0008
        DECLE   $0000                           ; 5957   0000

        ADDR    R3,     R7                      ; 5958   00DF
        ADDR    R7,     R7                      ; 5959   00FF
        ADDR    R5,     R7                      ; 595A   00EF
        ADDR    R3,     R7                      ; 595B   00DF
        MOVR    R3,     R7                      ; 595C   009F
        INCR    R7                              ; 595D   000F
        COMR    R6                              ; 595E   001E
        RSWD    R7                              ; 595F   003F
        MOVR    R2,     R1                      ; 5960   0091
        DECLE   $0000                           ; 5961   0000

        SETC                                    ; 5962   0007
        INCR    R7                              ; 5963   000F
        RSWD    R4                              ; 5964   003C
        SARC    R0,     2                       ; 5965   007C
        ADDR    R7,     R6                      ; 5966   00FE
        ADDR    R7,     R7                      ; 5967   00FF
        ADDR    R6,     R3                      ; 5968   00F3
        ADDR    R4,     R3                      ; 5969   00E3
        ADDR    R0,     R3                      ; 596A   00C3
        MOVR    R0,     R1                      ; 596B   0081
        DECLE   $0001,  $0000,  $0001,  $0001   ; 596C   0001 0000 0001 0001

        ADDR    R4,     R3                      ; 5970   00E3
        ADDR    R4,     R1                      ; 5971   00E1
        ADDR    R0,     R1                      ; 5972   00C1
        ADDR    R0,     R3                      ; 5973   00C3
        ADDR    R4,     R3                      ; 5974   00E3
        ADDR    R4,     R3                      ; 5975   00E3
        ADDR    R6,     R3                      ; 5976   00F3
        ADDR    R6,     R3                      ; 5977   00F3
        ADDR    R7,     R5                      ; 5978   00FD
        ADDR    R7,     R5                      ; 5979   00FD
        ADDR    R7,     R4                      ; 597A   00FC
        ADDR    R7,     R0                      ; 597B   00F8
        ADDR    R6,     R0                      ; 597C   00F0
        ADDR    R6,     R1                      ; 597D   00F1
        ADDR    R4,     R1                      ; 597E   00E1
        ADDR    R4,     R0                      ; 597F   00E0
        ADDR    R7,     R7                      ; 5980   00FF
        ADDR    R7,     R7                      ; 5981   00FF
        ADDR    R6,     R7                      ; 5982   00F7
        ADDR    R6,     R0                      ; 5983   00F0
        ADDR    R7,     R0                      ; 5984   00F8
        ADDR    R7,     R4                      ; 5985   00FC
        ADDR    R7,     R4                      ; 5986   00FC
        ADDR    R7,     R7                      ; 5987   00FF
        ADDR    R7,     R6                      ; 5988   00FE
        ADDR    R7,     R6                      ; 5989   00FE
        ADDR    R1,     R4                      ; 598A   00CC
        DECLE   $0000                           ; 598B   0000

        SETC                                    ; 598C   0007
        INCR    R7                              ; 598D   000F
        SARC    R2,     2                       ; 598E   007E
        ADDR    R7,     R6                      ; 598F   00FE
        ADDR    R7,     R0                      ; 5990   00F8
        ADDR    R7,     R0                      ; 5991   00F8
        ADDR    R7,     R0                      ; 5992   00F8
        SARC    R0,     2                       ; 5993   007C
        SARC    R0,     2                       ; 5994   007C
        SARC    R0,     2                       ; 5995   007C
        SARC    R2,     2                       ; 5996   007E
        ADDR    R7,     R6                      ; 5997   00FE
        SARC    R3,     2                       ; 5998   007F
        SARC    R3,     2                       ; 5999   007F
        RSWD    R7                              ; 599A   003F
        COMR    R7                              ; 599B   001F
        SETC                                    ; 599C   0007
        DIS                                     ; 599D   0003
        DECLE   $0001                           ; 599E   0001
L_599F:
        DECLE   $0000                           ; 599F   0000

        ADDR    R0,     R0                      ; 59A0   00C0
        ADDR    R4,     R0                      ; 59A1   00E0
        ADDR    R7,     R0                      ; 59A2   00F8
        ADDR    R7,     R6                      ; 59A3   00FE
        ADDR    R7,     R7                      ; 59A4   00FF
        ADDR    R7,     R4                      ; 59A5   00FC
        ADDR    R7,     R0                      ; 59A6   00F8
        SLR     R3,     1                       ; 59A7   0063
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59A8   0000 0000 0000 0000

        TSTR    R0                              ; 59AC   0080
        COMR    R0                              ; 59AD   0018
        ADDR    R7,     R7                      ; 59AE   00FF
        ADDR    R7,     R7                      ; 59AF   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59B0   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 59B4   0000 0000

        ADDR    R6,     R0                      ; 59B6   00F0
        ADDR    R7,     R7                      ; 59B7   00FF
        SARC    R3,     2                       ; 59B8   007F
        SARC    R3,     2                       ; 59B9   007F
        RSWD    R7                              ; 59BA   003F
        INCR    R7                              ; 59BB   000F
        INCR    R7                              ; 59BC   000F
        INCR    R7                              ; 59BD   000F
        COMR    R7                              ; 59BE   001F
        INCR    R7                              ; 59BF   000F
        SARC    R3,     2                       ; 59C0   007F
        RSWD    R7                              ; 59C1   003F
        COMR    R7                              ; 59C2   001F
        SETC                                    ; 59C3   0007
        DIS                                     ; 59C4   0003
        MOVR    R0,     R1                      ; 59C5   0081
        MOVR    R0,     R1                      ; 59C6   0081
        TSTR    R0                              ; 59C7   0080
        ADDR    R0,     R1                      ; 59C8   00C1
        ADDR    R4,     R3                      ; 59C9   00E3
        ADDR    R6,     R1                      ; 59CA   00F1
        ADDR    R7,     R1                      ; 59CB   00F9
        ADDR    R7,     R5                      ; 59CC   00FD
        ADDR    R7,     R6                      ; 59CD   00FE
        ADDR    R7,     R6                      ; 59CE   00FE
        SARC    R3,     2                       ; 59CF   007F
        ADDR    R6,     R3                      ; 59D0   00F3
        ADDR    R6,     R1                      ; 59D1   00F1
        ADDR    R4,     R1                      ; 59D2   00E1
        ADDR    R6,     R1                      ; 59D3   00F1
        ADDR    R7,     R0                      ; 59D4   00F8
        ADDR    R7,     R0                      ; 59D5   00F8
        DECLE   $0000                           ; 59D6   0000

        ADDR    R0,     R7                      ; 59D7   00C7
        ADDR    R4,     R1                      ; 59D8   00E1
        ADDR    R4,     R1                      ; 59D9   00E1
        ADDR    R4,     R1                      ; 59DA   00E1
        ADDR    R4,     R1                      ; 59DB   00E1
        ADDR    R0,     R1                      ; 59DC   00C1
        DECLE   $0000                           ; 59DD   0000

        INCR    R7                              ; 59DE   000F
        ADDR    R7,     R7                      ; 59DF   00FF
        ADDR    R7,     R7                      ; 59E0   00FF
        ADDR    R7,     R7                      ; 59E1   00FF
        ADDR    R2,     R3                      ; 59E2   00D3
        TSTR    R0                              ; 59E3   0080
        COMR    R7                              ; 59E4   001F
        SARC    R3,     2                       ; 59E5   007F
        ADDR    R7,     R7                      ; 59E6   00FF
        DIS                                     ; 59E7   0003
        ADDR    R7,     R5                      ; 59E8   00FD
        ADDR    R6,     R1                      ; 59E9   00F1
        DECLE   $0000,  $0000,  $0001           ; 59EA   0000 0000 0001

        ADDR    R6,     R0                      ; 59ED   00F0
        ADDR    R7,     R0                      ; 59EE   00F8
        ADDR    R7,     R0                      ; 59EF   00F8
        ADDR    R7,     R4                      ; 59F0   00FC
        ADDR    R4,     R1                      ; 59F1   00E1
        DECLE   $0001                           ; 59F2   0001

        ADDR    R4,     R7                      ; 59F3   00E7
        ADDR    R7,     R7                      ; 59F4   00FF
        ADDR    R3,     R7                      ; 59F5   00DF
        DECR    R6                              ; 59F6   0016
        INCR    R6                              ; 59F7   000E
        DECLE   $0000,  $0000                   ; 59F8   0000 0000

        MOVR    R0,     R1                      ; 59FA   0081
        MOVR    R0,     R3                      ; 59FB   0083
        ADDR    R0,     R0                      ; 59FC   00C0
        ADDR    R0,     R0                      ; 59FD   00C0
        ADDR    R0,     R1                      ; 59FE   00C1
        ADDR    R0,     R1                      ; 59FF   00C1
        SETC                                    ; 5A00   0007
        SLR     R2,     2                       ; 5A01   0066
        ADDR    R4,     R0                      ; 5A02   00E0
        ADDR    R4,     R0                      ; 5A03   00E0
        ADDR    R6,     R0                      ; 5A04   00F0
        ADDR    R6,     R1                      ; 5A05   00F1
        ADDR    R6,     R0                      ; 5A06   00F0
        ADDR    R6,     R1                      ; 5A07   00F1
        ADDR    R7,     R4                      ; 5A08   00FC
        ADDR    R7,     R4                      ; 5A09   00FC
        ADDR    R7,     R4                      ; 5A0A   00FC
        ADDR    R7,     R0                      ; 5A0B   00F8
        ADDR    R6,     R0                      ; 5A0C   00F0
        ADDR    R6,     R0                      ; 5A0D   00F0
        ADDR    R6,     R0                      ; 5A0E   00F0
        ADDR    R6,     R0                      ; 5A0F   00F0
        ADDR    R7,     R7                      ; 5A10   00FF
        RSWD    R7                              ; 5A11   003F
        INCR    R7                              ; 5A12   000F
        INCR    R7                              ; 5A13   000F
        SETC                                    ; 5A14   0007
        SETC                                    ; 5A15   0007
        DIS                                     ; 5A16   0003
        DIS                                     ; 5A17   0003
        ADDR    R7,     R4                      ; 5A18   00FC
        ADDR    R7,     R6                      ; 5A19   00FE
        ADDR    R7,     R6                      ; 5A1A   00FE
        ADDR    R7,     R6                      ; 5A1B   00FE
        ADDR    R7,     R6                      ; 5A1C   00FE
        ADDR    R7,     R4                      ; 5A1D   00FC
        ADDR    R6,     R0                      ; 5A1E   00F0
        ADDR    R4,     R0                      ; 5A1F   00E0
        INCR    R7                              ; 5A20   000F
        INCR    R7                              ; 5A21   000F
        COMR    R7                              ; 5A22   001F
        COMR    R7                              ; 5A23   001F
        COMR    R7                              ; 5A24   001F
        COMR    R7                              ; 5A25   001F
        COMR    R7                              ; 5A26   001F
        RSWD    R7                              ; 5A27   003F
        TSTR    R0                              ; 5A28   0080
        TSTR    R0                              ; 5A29   0080
        ADDR    R0,     R0                      ; 5A2A   00C0
        ADDR    R0,     R0                      ; 5A2B   00C0
        ADDR    R0,     R0                      ; 5A2C   00C0
        TSTR    R0                              ; 5A2D   0080
        TSTR    R0                              ; 5A2E   0080
        ADDR    R0,     R0                      ; 5A2F   00C0
        RSWD    R7                              ; 5A30   003F
        RSWD    R7                              ; 5A31   003F
        COMR    R7                              ; 5A32   001F
        SETC                                    ; 5A33   0007
        SETC                                    ; 5A34   0007
        DIS                                     ; 5A35   0003
        DECLE   $0000,  $0000                   ; 5A36   0000 0000

        ADDR    R6,     R0                      ; 5A38   00F0
        ADDR    R7,     R0                      ; 5A39   00F8
        ADDR    R7,     R6                      ; 5A3A   00FE
        ADDR    R7,     R4                      ; 5A3B   00FC
        ADDR    R7,     R1                      ; 5A3C   00F9
        ADDR    R6,     R1                      ; 5A3D   00F1
        ADDR    R4,     R3                      ; 5A3E   00E3
        SETC                                    ; 5A3F   0007
        ADDR    R6,     R0                      ; 5A40   00F0
        ADDR    R7,     R0                      ; 5A41   00F8
        COMR    R0                              ; 5A42   0018
        SARC    R3,     2                       ; 5A43   007F
        SARC    R3,     2                       ; 5A44   007F
        ADDR    R7,     R5                      ; 5A45   00FD
        ADDR    R7,     R4                      ; 5A46   00FC
        RSWD    R4                              ; 5A47   003C
        DECLE   $0001,  $0001                   ; 5A48   0001 0001

        SETC                                    ; 5A4A   0007
        MOVR    R3,     R6                      ; 5A4B   009E
        ADDR    R6,     R0                      ; 5A4C   00F0
        ADDR    R4,     R0                      ; 5A4D   00E0
        ADDR    R7,     R0                      ; 5A4E   00F8
        ADDR    R7,     R4                      ; 5A4F   00FC
        ADDR    R7,     R0                      ; 5A50   00F8
        ADDR    R4,     R0                      ; 5A51   00E0
        ADDR    R4,     R0                      ; 5A52   00E0
        SETC                                    ; 5A53   0007
        INCR    R7                              ; 5A54   000F
        INCR    R7                              ; 5A55   000F
        INCR    R5                              ; 5A56   000D
        DECLE   $0001                           ; 5A57   0001

        INCR    R4                              ; 5A58   000C
        COMR    R4                              ; 5A59   001C
        RSWD    R0                              ; 5A5A   0038
        ADDR    R7,     R3                      ; 5A5B   00FB
        ADDR    R7,     R7                      ; 5A5C   00FF
        ADDR    R7,     R4                      ; 5A5D   00FC
        ADDR    R6,     R0                      ; 5A5E   00F0
        ADDR    R6,     R0                      ; 5A5F   00F0
        ADDR    R4,     R0                      ; 5A60   00E0
        SLR     R2,     2                       ; 5A61   0066
        SAR     R2,     2                       ; 5A62   006E
        ADDR    R7,     R6                      ; 5A63   00FE
        RRC     R0,     1                       ; 5A64   0070
        RSWD    R1                              ; 5A65   0039
        SARC    R1,     1                       ; 5A66   0079
        SARC    R1,     1                       ; 5A67   0079
        ADDR    R6,     R0                      ; 5A68   00F0
        ADDR    R6,     R0                      ; 5A69   00F0
        ADDR    R6,     R0                      ; 5A6A   00F0
        ADDR    R4,     R0                      ; 5A6B   00E0
        ADDR    R4,     R3                      ; 5A6C   00E3
        ADDR    R0,     R7                      ; 5A6D   00C7
        ADDR    R4,     R7                      ; 5A6E   00E7
        ADDR    R4,     R7                      ; 5A6F   00E7
        DIS                                     ; 5A70   0003
        SETC                                    ; 5A71   0007
        INCR    R7                              ; 5A72   000F
        RSWD    R6                              ; 5A73   003E
        ADDR    R7,     R4                      ; 5A74   00FC
        ADDR    R4,     R1                      ; 5A75   00E1
        ADDR    R0,     R0                      ; 5A76   00C0
        TSTR    R0                              ; 5A77   0080
        ADDR    R4,     R0                      ; 5A78   00E0
        TSTR    R0                              ; 5A79   0080
        DECLE   $0000,  $0000,  $0000           ; 5A7A   0000 0000 0000

        ADDR    R3,     R3                      ; 5A7D   00DB
        MOVR    R2,     R5                      ; 5A7E   0095
        MOVR    R2,     R1                      ; 5A7F   0091
        RSWD    R6                              ; 5A80   003E
        RSWD    R6                              ; 5A81   003E
        SARC    R0,     2                       ; 5A82   007C
        SARC    R2,     2                       ; 5A83   007E
        SARC    R2,     2                       ; 5A84   007E
        SARC    R2,     2                       ; 5A85   007E
        ADDR    R7,     R6                      ; 5A86   00FE
        ADDR    R7,     R6                      ; 5A87   00FE
        DIS                                     ; 5A88   0003
        MOVR    R1,     R7                      ; 5A89   008F
        MOVR    R1,     R7                      ; 5A8A   008F
        ADDR    R5,     R7                      ; 5A8B   00EF
        ADDR    R6,     R3                      ; 5A8C   00F3
        ADDR    R7,     R1                      ; 5A8D   00F9
        ADDR    R7,     R6                      ; 5A8E   00FE
        ADDR    R7,     R7                      ; 5A8F   00FF
        ADDR    R4,     R0                      ; 5A90   00E0
        ADDR    R4,     R0                      ; 5A91   00E0
        ADDR    R0,     R0                      ; 5A92   00C0
        ADDR    R0,     R0                      ; 5A93   00C0
        TSTR    R0                              ; 5A94   0080
        TSTR    R0                              ; 5A95   0080
        DECLE   $0000                           ; 5A96   0000

        TSTR    R0                              ; 5A97   0080
        RSWD    R7                              ; 5A98   003F
        RSWD    R6                              ; 5A99   003E
        SARC    R0,     2                       ; 5A9A   007C
        RSWD    R0                              ; 5A9B   0038
        NEGR    R0                              ; 5A9C   0020
        DECLE   $0000,  $0000,  $0000           ; 5A9D   0000 0000 0000

        ADDR    R6,     R7                      ; 5AA0   00F7
        ADDR    R4,     R7                      ; 5AA1   00E7
        SLR     R3,     1                       ; 5AA2   0063
        DECLE   $0001,  $0000,  $0000,  $0000   ; 5AA3   0001 0000 0000 0000
        DECLE   $0000                           ; 5AA7   0000

        ADDR    R6,     R7                      ; 5AA8   00F7
        ADDR    R5,     R6                      ; 5AA9   00EE
        ADDR    R5,     R4                      ; 5AAA   00EC
        ADDR    R4,     R0                      ; 5AAB   00E0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AAC   0000 0000 0000 0000

        ADDR    R7,     R7                      ; 5AB0   00FF
        SARC    R3,     2                       ; 5AB1   007F
        SARC    R3,     2                       ; 5AB2   007F
        ADDR    R7,     R6                      ; 5AB3   00FE
        ADDR    R7,     R0                      ; 5AB4   00F8
        ADDR    R6,     R0                      ; 5AB5   00F0
        ADDR    R0,     R0                      ; 5AB6   00C0
        TSTR    R0                              ; 5AB7   0080
        ADDR    R7,     R7                      ; 5AB8   00FF
        SARC    R3,     2                       ; 5AB9   007F
        RSWD    R6                              ; 5ABA   003E
        COMR    R0                              ; 5ABB   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ABC   0000 0000 0000 0000
        DECLE   $0000,  $0001                   ; 5AC0   0000 0001

        EIS                                     ; 5AC2   0002
        DECLE   $0005                           ; 5AC3   0005

        INCR    R2                              ; 5AC4   000A
        DECR    R4                              ; 5AC5   0014
        ADDR    R5,     R0                      ; 5AC6   00E8
        ADDR    R7,     R7                      ; 5AC7   00FF
        ADDR    R7,     R7                      ; 5AC8   00FF
        MOVR    R0,     R1                      ; 5AC9   0081
        ADDR    R7,     R7                      ; 5ACA   00FF
        MOVR    R0,     R1                      ; 5ACB   0081
        SWAP    R2,     1                       ; 5ACC   0042
        NEGR    R4                              ; 5ACD   0024
        COMR    R0                              ; 5ACE   0018
        ADDR    R7,     R7                      ; 5ACF   00FF
        DECLE   $0000                           ; 5AD0   0000

        TSTR    R0                              ; 5AD1   0080
        SWAP    R0,     1                       ; 5AD2   0040
        MOVR    R4,     R0                      ; 5AD3   00A0
        RLC     R0,     1                       ; 5AD4   0050
        ADCR    R0                              ; 5AD5   0028
        DECR    R7                              ; 5AD6   0017
        ADDR    R7,     R7                      ; 5AD7   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AD8   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5ADC   0000 0000

        ADDR    R7,     R7                      ; 5ADE   00FF
        ADDR    R7,     R7                      ; 5ADF   00FF
        CLRR    R0                              ; 5AE0   01C0
        MVO     R0,     .STIC.BORD              ; 5AE1   0240 002C
L_5AE3:
        INCR    R0                              ; 5AE3   0008
        MVO     R0,     .STIC.CS.1              ; 5AE4   0240 0029
        MVO     R0,     .STIC.CS.3              ; 5AE6   0240 002B
        INCR    R0                              ; 5AE8   0008
        MVO     R0,     .STIC.EDGE              ; 5AE9   0240 0032
        SLL     R0,     1                       ; 5AEB   0048
        MVO     R0,     .STIC.CS.0              ; 5AEC   0240 0028
        MVO     R0,     .STIC.CS.2              ; 5AEE   0240 002A
        MOVR    R7,     R0                      ; 5AF0   00B8
        ADDI    #$0011, R0                      ; 5AF1   02F8 0011
        MVO     R0,     .ISRVEC.0               ; 5AF3   0240 0100
        SWAP    R0,     1                       ; 5AF5   0040
        MVO     R0,     .ISRVEC.1               ; 5AF6   0240 0101
        CLRR    R0                              ; 5AF8   01C0
        MVO     R0,     .STIC.C.0               ; 5AF9   0240 0018
L_5AFB:
        MVO     R0,     .STIC.C.1               ; 5AFB   0240 0019
        SUBI    #$0008, R6                      ; 5AFD   033E 0008
        EIS                                     ; 5AFF   0002
        MVI     G_031D, R7                      ; 5B00   0287 031D
        MVO     R0,     .STIC.VIDEN             ; 5B02   0240 0020
        MOVR    R6,     R1                      ; 5B04   00B1
        SUBI    #$0008, R1                      ; 5B05   0339 0008
        MVI@    R1,     R1                      ; 5B07   0289
        MVI@    R1,     R0                      ; 5B08   0288
        CMPI    #$0017, R0                      ; 5B09   0378 0017
        BEQ     L_5B0E                          ; 5B0B   0204 0001

        MOVR    R5,     R7                      ; 5B0D   00AF
L_5B0E:
        MVI     G_01A1, R0                      ; 5B0E   0280 01A1
        MVO     R0,     .STIC.BORD              ; 5B10   0240 002C
        MVII    #$0327, R4                      ; 5B12   02BC 0327
        CLRR    R5                              ; 5B14   01ED
        MVI@    R4,     R0                      ; 5B15   02A0
        MVO@    R0,     R5                      ; 5B16   0268
        MVI@    R4,     R0                      ; 5B17   02A0
        MVO@    R0,     R5                      ; 5B18   0268
        MVI@    R4,     R0                      ; 5B19   02A0
        MVO@    R0,     R5                      ; 5B1A   0268
        MVI@    R4,     R0                      ; 5B1B   02A0
        MVO@    R0,     R5                      ; 5B1C   0268
        MVI@    R4,     R0                      ; 5B1D   02A0
        MVO@    R0,     R5                      ; 5B1E   0268
        MVI@    R4,     R0                      ; 5B1F   02A0
        MVO@    R0,     R5                      ; 5B20   0268
        MVI@    R4,     R0                      ; 5B21   02A0
        MVO@    R0,     R5                      ; 5B22   0268
        MVI@    R4,     R0                      ; 5B23   02A0
        MVO@    R0,     R5                      ; 5B24   0268
        MVI@    R4,     R0                      ; 5B25   02A0
        MVO@    R0,     R5                      ; 5B26   0268
        MVI@    R4,     R0                      ; 5B27   02A0
        MVO@    R0,     R5                      ; 5B28   0268
        MVI@    R4,     R0                      ; 5B29   02A0
        MVO@    R0,     R5                      ; 5B2A   0268
        MVI@    R4,     R0                      ; 5B2B   02A0
        MVO@    R0,     R5                      ; 5B2C   0268
        MVI@    R4,     R0                      ; 5B2D   02A0
        MVO@    R0,     R5                      ; 5B2E   0268
        MVI@    R4,     R0                      ; 5B2F   02A0
        MVO@    R0,     R5                      ; 5B30   0268
        MVI@    R4,     R0                      ; 5B31   02A0
        MVO@    R0,     R5                      ; 5B32   0268
        MVI@    R4,     R0                      ; 5B33   02A0
        MVO@    R0,     R5                      ; 5B34   0268
        MVI@    R4,     R0                      ; 5B35   02A0
        MVO@    R0,     R5                      ; 5B36   0268
        MVI@    R4,     R0                      ; 5B37   02A0
        MVO@    R0,     R5                      ; 5B38   0268
        MVI@    R4,     R0                      ; 5B39   02A0
        MVO@    R0,     R5                      ; 5B3A   0268
        MVI@    R4,     R0                      ; 5B3B   02A0
        MVO@    R0,     R5                      ; 5B3C   0268
        MVI@    R4,     R0                      ; 5B3D   02A0
        MVO@    R0,     R5                      ; 5B3E   0268
        MVI@    R4,     R0                      ; 5B3F   02A0
        MVO@    R0,     R5                      ; 5B40   0268
        MVI@    R4,     R0                      ; 5B41   02A0
        MVO@    R0,     R5                      ; 5B42   0268
        MVI     .STIC.C.0,R0                    ; 5B43   0280 0018
        MVI     G_01D3, R1                      ; 5B45   0281 01D3
        MVO     R0,     G_01D3                  ; 5B47   0240 01D3
        MVO     R1,     .STIC.C.0               ; 5B49   0241 0018
        MVI     .STIC.C.1,R0                    ; 5B4B   0280 0019
        MVI     G_01D4, R1                      ; 5B4D   0281 01D4
        MVO     R0,     G_01D4                  ; 5B4F   0240 01D4
        MVO     R1,     .STIC.C.1               ; 5B51   0241 0019
        MVI     G_01D1, R0                      ; 5B53   0280 01D1
        MVO     R0,     .STIC.VDLY              ; 5B55   0240 0031
        MVII    #$0145, R4                      ; 5B57   02BC 0145
        ADDR    R0,     R4                      ; 5B59   00C4
L_5B5A:
        SDBD                                    ; 5B5A   0001
        MVII    #$39C0, R5                      ; 5B5B   02BD 00C0 0039
        MVI@    R4,     R0                      ; 5B5E   02A0
        MVO@    R0,     R5                      ; 5B5F   0268
        MVI@    R4,     R0                      ; 5B60   02A0
        MVO@    R0,     R5                      ; 5B61   0268
        MVI@    R4,     R0                      ; 5B62   02A0
        MVO@    R0,     R5                      ; 5B63   0268
        MVI@    R4,     R0                      ; 5B64   02A0
        MVO@    R0,     R5                      ; 5B65   0268
        MVI@    R4,     R0                      ; 5B66   02A0
        MVO@    R0,     R5                      ; 5B67   0268
        MVI@    R4,     R0                      ; 5B68   02A0
        MVO@    R0,     R5                      ; 5B69   0268
        MVI@    R4,     R0                      ; 5B6A   02A0
        MVO@    R0,     R5                      ; 5B6B   0268
        MVI@    R4,     R0                      ; 5B6C   02A0
        MVO@    R0,     R5                      ; 5B6D   0268
        MVI@    R4,     R0                      ; 5B6E   02A0
        MVO@    R0,     R5                      ; 5B6F   0268
        MVI@    R4,     R0                      ; 5B70   02A0
        MVO@    R0,     R5                      ; 5B71   0268
        MVI@    R4,     R0                      ; 5B72   02A0
        MVO@    R0,     R5                      ; 5B73   0268
        MVI@    R4,     R0                      ; 5B74   02A0
        MVO@    R0,     R5                      ; 5B75   0268
        MVI@    R4,     R0                      ; 5B76   02A0
        MVO@    R0,     R5                      ; 5B77   0268
        MVI@    R4,     R0                      ; 5B78   02A0
        MVO@    R0,     R5                      ; 5B79   0268
        MVI@    R4,     R0                      ; 5B7A   02A0
        MVO@    R0,     R5                      ; 5B7B   0268
        MVI@    R4,     R0                      ; 5B7C   02A0
        MVO@    R0,     R5                      ; 5B7D   0268
        MVI@    R4,     R0                      ; 5B7E   02A0
        MVO@    R0,     R5                      ; 5B7F   0268
        MVI@    R4,     R0                      ; 5B80   02A0
        MVO@    R0,     R5                      ; 5B81   0268
        MVI@    R4,     R0                      ; 5B82   02A0
        MVO@    R0,     R5                      ; 5B83   0268
        MVI@    R4,     R0                      ; 5B84   02A0
        MVO@    R0,     R5                      ; 5B85   0268
        MVI@    R4,     R0                      ; 5B86   02A0
        MVO@    R0,     R5                      ; 5B87   0268
        MVI@    R4,     R0                      ; 5B88   02A0
        MVO@    R0,     R5                      ; 5B89   0268
        MVI@    R4,     R0                      ; 5B8A   02A0
        MVO@    R0,     R5                      ; 5B8B   0268
        MVI@    R4,     R0                      ; 5B8C   02A0
        MVO@    R0,     R5                      ; 5B8D   0268
        MVI@    R4,     R0                      ; 5B8E   02A0
        MVO@    R0,     R5                      ; 5B8F   0268
        MVI@    R4,     R0                      ; 5B90   02A0
        MVO@    R0,     R5                      ; 5B91   0268
        MVI@    R4,     R0                      ; 5B92   02A0
        MVO@    R0,     R5                      ; 5B93   0268
        MVI@    R4,     R0                      ; 5B94   02A0
        MVO@    R0,     R5                      ; 5B95   0268
        MVI@    R4,     R0                      ; 5B96   02A0
        MVO@    R0,     R5                      ; 5B97   0268
        MVI@    R4,     R0                      ; 5B98   02A0
        MVO@    R0,     R5                      ; 5B99   0268
        MVI@    R4,     R0                      ; 5B9A   02A0
        MVO@    R0,     R5                      ; 5B9B   0268
        MVI@    R4,     R0                      ; 5B9C   02A0
        MVO@    R0,     R5                      ; 5B9D   0268
        MVI@    R4,     R0                      ; 5B9E   02A0
        MVO@    R0,     R5                      ; 5B9F   0268
        MVI@    R4,     R0                      ; 5BA0   02A0
        MVO@    R0,     R5                      ; 5BA1   0268
        MVI@    R4,     R0                      ; 5BA2   02A0
        MVO@    R0,     R5                      ; 5BA3   0268
        MVI@    R4,     R0                      ; 5BA4   02A0
        MVO@    R0,     R5                      ; 5BA5   0268
        MVI@    R4,     R0                      ; 5BA6   02A0
        MVO@    R0,     R5                      ; 5BA7   0268
        MVI@    R4,     R0                      ; 5BA8   02A0
        MVO@    R0,     R5                      ; 5BA9   0268
        MVI@    R4,     R0                      ; 5BAA   02A0
        MVO@    R0,     R5                      ; 5BAB   0268
        MVI@    R4,     R0                      ; 5BAC   02A0
        MVO@    R0,     R5                      ; 5BAD   0268
        MVI@    R4,     R0                      ; 5BAE   02A0
        MVO@    R0,     R5                      ; 5BAF   0268
        MVI@    R4,     R0                      ; 5BB0   02A0
        MVO@    R0,     R5                      ; 5BB1   0268
        MVI@    R4,     R0                      ; 5BB2   02A0
        MVO@    R0,     R5                      ; 5BB3   0268
        MVI@    R4,     R0                      ; 5BB4   02A0
        MVO@    R0,     R5                      ; 5BB5   0268
        MVI@    R4,     R0                      ; 5BB6   02A0
        MVO@    R0,     R5                      ; 5BB7   0268
        MVI@    R4,     R0                      ; 5BB8   02A0
        MVO@    R0,     R5                      ; 5BB9   0268
        MVI@    R4,     R0                      ; 5BBA   02A0
        MVO@    R0,     R5                      ; 5BBB   0268
        MVI@    R4,     R0                      ; 5BBC   02A0
        MVO@    R0,     R5                      ; 5BBD   0268
        MVI@    R4,     R0                      ; 5BBE   02A0
        MVO@    R0,     R5                      ; 5BBF   0268
        MVI@    R4,     R0                      ; 5BC0   02A0
        MVO@    R0,     R5                      ; 5BC1   0268
        MVI@    R4,     R0                      ; 5BC2   02A0
        MVO@    R0,     R5                      ; 5BC3   0268
        MVI@    R4,     R0                      ; 5BC4   02A0
        MVO@    R0,     R5                      ; 5BC5   0268
        MVI@    R4,     R0                      ; 5BC6   02A0
        MVO@    R0,     R5                      ; 5BC7   0268
        MVI@    R4,     R0                      ; 5BC8   02A0
        MVO@    R0,     R5                      ; 5BC9   0268
        MVI@    R4,     R0                      ; 5BCA   02A0
        MVO@    R0,     R5                      ; 5BCB   0268
        MVI@    R4,     R0                      ; 5BCC   02A0
        MVO@    R0,     R5                      ; 5BCD   0268
        MVI@    R4,     R0                      ; 5BCE   02A0
        MVO@    R0,     R5                      ; 5BCF   0268
        MVI@    R4,     R0                      ; 5BD0   02A0
        MVO@    R0,     R5                      ; 5BD1   0268
        MVI@    R4,     R0                      ; 5BD2   02A0
        MVO@    R0,     R5                      ; 5BD3   0268
        MVI@    R4,     R0                      ; 5BD4   02A0
        MVO@    R0,     R5                      ; 5BD5   0268
        MVI@    R4,     R0                      ; 5BD6   02A0
        MVO@    R0,     R5                      ; 5BD7   0268
        MVI@    R4,     R0                      ; 5BD8   02A0
        MVO@    R0,     R5                      ; 5BD9   0268
        MVI@    R4,     R0                      ; 5BDA   02A0
        MVO@    R0,     R5                      ; 5BDB   0268
        MVI@    R4,     R0                      ; 5BDC   02A0
        MVO@    R0,     R5                      ; 5BDD   0268
        MVI     G_012C, R2                      ; 5BDE   0282 012C
        ANDI    #$0001, R2                      ; 5BE0   03BA 0001
        SDBD                                    ; 5BE2   0001
        MVII    #$38D3, R1                      ; 5BE3   02B9 00D3 0038
        MVI@    R1,     R0                      ; 5BE6   0288
        XORI    #$0077, R0                      ; 5BE7   03F8 0077
        ADDR    R2,     R7                      ; 5BE9   00D7
        MVO@    R0,     R1                      ; 5BEA   0248
        MVII    #$01B4, R4                      ; 5BEB   02BC 01B4
        SDBD                                    ; 5BED   0001
        MVII    #$3923, R2                      ; 5BEE   02BA 0023 0039
        SDBD                                    ; 5BF1   0001
        MVII    #$1922, R3                      ; 5BF2   02BB 0022 0019
L_5BF5:
        MVI@    R4,     R5                      ; 5BF5   02A5
        MVI@    R4,     R1                      ; 5BF6   02A1
        TSTR    R5                              ; 5BF7   00AD
        BEQ     L_5C6B                          ; 5BF8   0204 0071

        ADDI    #$01EA, R5                      ; 5BFA   02FD 01EA
        CMPI    #$0200, R5                      ; 5BFC   037D 0200
        BMI     L_5C6B                          ; 5BFE   020B 006B

        MVI@    R5,     R0                      ; 5C00   02A8
        ANDI    #$0005, R0                      ; 5C01   03B8 0005
        BNEQ    L_5C07                          ; 5C03   020C 0002

        DECR    R5                              ; 5C05   0015
        MVO@    R0,     R5                      ; 5C06   0268
L_5C07:
        SARC    R1,     1                       ; 5C07   0079
        SLL     R1,     1                       ; 5C08   0049
        BC      L_5C41                          ; 5C09   0201 0036

        ADDR    R7,     R1                      ; 5C0B   00F9
        ADDI    #$0015, R1                      ; 5C0C   02F9 0015
        MVI@    R1,     R0                      ; 5C0E   0288
        MVO@    R0,     R2                      ; 5C0F   0250
        INCR    R1                              ; 5C10   0009
        ADDI    #$0008, R2                      ; 5C11   02FA 0008
        MVI@    R1,     R0                      ; 5C13   0288
        MVO@    R0,     R2                      ; 5C14   0250
        MVO@    R3,     R5                      ; 5C15   026B
        ADDI    #$0008, R3                      ; 5C16   02FB 0008
        MVI@    R5,     R0                      ; 5C18   02A8
        ANDI    #$0005, R0                      ; 5C19   03B8 0005
        BNEQ    L_5C1F                          ; 5C1B   020C 0002

        DECR    R5                              ; 5C1D   0015
        MVO@    R3,     R5                      ; 5C1E   026B
L_5C1F:
        B       L_5C60                          ; 5C1F   0200 003F

        ADDR    R7,     R7                      ; 5C21   00FF
        DECLE   $0000                           ; 5C22   0000

        SARC    R3,     2                       ; 5C23   007F
        TSTR    R0                              ; 5C24   0080
        RSWD    R7                              ; 5C25   003F
        ADDR    R0,     R0                      ; 5C26   00C0
        COMR    R7                              ; 5C27   001F
        ADDR    R4,     R0                      ; 5C28   00E0
        INCR    R7                              ; 5C29   000F
        ADDR    R6,     R0                      ; 5C2A   00F0
        SETC                                    ; 5C2B   0007
        ADDR    R7,     R0                      ; 5C2C   00F8
        DIS                                     ; 5C2D   0003
        ADDR    R7,     R4                      ; 5C2E   00FC
        DECLE   $0001                           ; 5C2F   0001

        ADDR    R7,     R6                      ; 5C30   00FE
        ADDR    R7,     R7                      ; 5C31   00FF
        ADDR    R6,     R0                      ; 5C32   00F0
        SARC    R3,     2                       ; 5C33   007F
        ADDR    R7,     R0                      ; 5C34   00F8
        RSWD    R7                              ; 5C35   003F
        ADDR    R7,     R4                      ; 5C36   00FC
        COMR    R7                              ; 5C37   001F
        ADDR    R7,     R6                      ; 5C38   00FE
        INCR    R7                              ; 5C39   000F
        ADDR    R7,     R7                      ; 5C3A   00FF
        SETC                                    ; 5C3B   0007
        TSTR    R0                              ; 5C3C   0080
        DIS                                     ; 5C3D   0003
        ADDR    R0,     R0                      ; 5C3E   00C0
        DECLE   $0001                           ; 5C3F   0001

        ADDR    R4,     R0                      ; 5C40   00E0
L_5C41:
        SDBD                                    ; 5C41   0001
        XORI    #$1000, R3                      ; 5C42   03FB 0000 0010
        MVO@    R3,     R5                      ; 5C45   026B
        CMPI    #$000A, R1                      ; 5C46   0379 000A
        BMI     L_5C4F                          ; 5C48   020B 0005

        SDBD                                    ; 5C4A   0001
        MVII    #$066A, R0                      ; 5C4B   02B8 006A 0006
        MVO@    R0,     R5                      ; 5C4E   0268
L_5C4F:
        ADDI    #$0008, R3                      ; 5C4F   02FB 0008
        MVO@    R3,     R5                      ; 5C51   026B
        ADDR    R7,     R1                      ; 5C52   00F9
        SUBI    #$0022, R1                      ; 5C53   0339 0022
        MVI@    R1,     R0                      ; 5C55   0288
        MVO@    R0,     R2                      ; 5C56   0250
        INCR    R1                              ; 5C57   0009
        ADDI    #$0008, R2                      ; 5C58   02FA 0008
        MVI@    R1,     R0                      ; 5C5A   0288
        MVO@    R0,     R2                      ; 5C5B   0250
        SDBD                                    ; 5C5C   0001
        XORI    #$1000, R3                      ; 5C5D   03FB 0000 0010
L_5C60:
        ADDI    #$0008, R2                      ; 5C60   02FA 0008
        ADDI    #$0008, R3                      ; 5C62   02FB 0008
        MVI@    R5,     R0                      ; 5C64   02A8
        ANDI    #$0005, R0                      ; 5C65   03B8 0005
        BNEQ    L_5C6B                          ; 5C67   020C 0002

        DECR    R5                              ; 5C69   0015
        MVO@    R0,     R5                      ; 5C6A   0268
L_5C6B:
        CMPI    #$01BC, R4                      ; 5C6B   037C 01BC
        BNEQ    L_5BF5                          ; 5C6D   022C 0079

        SUBI    #$0008, R6                      ; 5C6F   033E 0008
        MVI     G_01D1, R3                      ; 5C71   0283 01D1
        MVI     G_01B1, R1                      ; 5C73   0281 01B1
        MVO     R3,     G_01B1                  ; 5C75   0243 01B1
        TSTR    R1                              ; 5C77   0089
        BEQ     L_5C7D                          ; 5C78   0204 0003

        TSTR    R3                              ; 5C7A   009B
        BEQ     L_5C80                          ; 5C7B   0204 0003
L_5C7D:
        J       L_6104                          ; 5C7D   0004 0360 0104

L_5C80:
        MVII    #$013D, R4                      ; 5C80   02BC 013D
        SDBD                                    ; 5C82   0001
        MVII    #$3960, R5                      ; 5C83   02BD 0060 0039
        ADD     G_01B2, R5                      ; 5C86   02C5 01B2
        MVI@    R4,     R0                      ; 5C88   02A0
        MVO@    R0,     R5                      ; 5C89   0268
        MVI@    R4,     R0                      ; 5C8A   02A0
        MVO@    R0,     R5                      ; 5C8B   0268
        MVI@    R4,     R0                      ; 5C8C   02A0
        MVO@    R0,     R5                      ; 5C8D   0268
        MVI@    R4,     R0                      ; 5C8E   02A0
        MVO@    R0,     R5                      ; 5C8F   0268
        MVI@    R4,     R0                      ; 5C90   02A0
        MVO@    R0,     R5                      ; 5C91   0268
        MVI@    R4,     R0                      ; 5C92   02A0
        MVO@    R0,     R5                      ; 5C93   0268
        MVI@    R4,     R0                      ; 5C94   02A0
        MVO@    R0,     R5                      ; 5C95   0268
        MVI@    R4,     R0                      ; 5C96   02A0
        MVO@    R0,     R5                      ; 5C97   0268
        MVI     G_01B2, R2                      ; 5C98   0282 01B2
        ADDI    #$0008, R2                      ; 5C9A   02FA 0008
        CMPI    #$0060, R2                      ; 5C9C   037A 0060
        BMI     L_5CA1                          ; 5C9E   020B 0001

        CLRR    R2                              ; 5CA0   01D2
L_5CA1:
        MVO     R2,     G_01B2                  ; 5CA1   0242 01B2
        MVII    #$0200, R4                      ; 5CA3   02BC 0200
        MVII    #$02FC, R5                      ; 5CA5   02BD 02FC
        MVI@    R4,     R0                      ; 5CA7   02A0
        MVO@    R0,     R5                      ; 5CA8   0268
        MVI@    R4,     R0                      ; 5CA9   02A0
        MVO@    R0,     R5                      ; 5CAA   0268
        MVI@    R4,     R0                      ; 5CAB   02A0
        MVO@    R0,     R5                      ; 5CAC   0268
        MVI@    R4,     R0                      ; 5CAD   02A0
        MVO@    R0,     R5                      ; 5CAE   0268
        MVI@    R4,     R0                      ; 5CAF   02A0
        MVO@    R0,     R5                      ; 5CB0   0268
        MVI@    R4,     R0                      ; 5CB1   02A0
        MVO@    R0,     R5                      ; 5CB2   0268
        MVI@    R4,     R0                      ; 5CB3   02A0
        MVO@    R0,     R5                      ; 5CB4   0268
        MVI@    R4,     R0                      ; 5CB5   02A0
        MVO@    R0,     R5                      ; 5CB6   0268
        MVI@    R4,     R0                      ; 5CB7   02A0
        MVO@    R0,     R5                      ; 5CB8   0268
        MVI@    R4,     R0                      ; 5CB9   02A0
        MVO@    R0,     R5                      ; 5CBA   0268
        MVI@    R4,     R0                      ; 5CBB   02A0
        MVO@    R0,     R5                      ; 5CBC   0268
        MVI@    R4,     R0                      ; 5CBD   02A0
        MVO@    R0,     R5                      ; 5CBE   0268
        MVI@    R4,     R0                      ; 5CBF   02A0
        MVO@    R0,     R5                      ; 5CC0   0268
        MVI@    R4,     R0                      ; 5CC1   02A0
        MVO@    R0,     R5                      ; 5CC2   0268
        MVI@    R4,     R0                      ; 5CC3   02A0
        MVO@    R0,     R5                      ; 5CC4   0268
        MVI@    R4,     R0                      ; 5CC5   02A0
        MVO@    R0,     R5                      ; 5CC6   0268
        MVII    #$0210, R3                      ; 5CC7   02BB 0210
        ADDI    #$0004, R3                      ; 5CC9   02FB 0004
        MVII    #$02FC, R4                      ; 5CCB   02BC 02FC
        MOVR    R4,     R5                      ; 5CCD   00A5
        MVI@    R3,     R0                      ; 5CCE   0298
        MVI@    R4,     R1                      ; 5CCF   02A1
        MVO@    R1,     R3                      ; 5CD0   0259
        MVO@    R0,     R5                      ; 5CD1   0268
        INCR    R3                              ; 5CD2   000B
        MVI@    R3,     R0                      ; 5CD3   0298
        MVI@    R4,     R1                      ; 5CD4   02A1
        MVO@    R1,     R3                      ; 5CD5   0259
        MVO@    R0,     R5                      ; 5CD6   0268
        INCR    R3                              ; 5CD7   000B
        MVI@    R3,     R0                      ; 5CD8   0298
        MVI@    R4,     R1                      ; 5CD9   02A1
        MVO@    R1,     R3                      ; 5CDA   0259
        MVO@    R0,     R5                      ; 5CDB   0268
        INCR    R3                              ; 5CDC   000B
        MVI@    R3,     R0                      ; 5CDD   0298
        MVI@    R4,     R1                      ; 5CDE   02A1
        MVO@    R1,     R3                      ; 5CDF   0259
        MVO@    R0,     R5                      ; 5CE0   0268
        INCR    R3                              ; 5CE1   000B
        MVI@    R3,     R0                      ; 5CE2   0298
        MVI@    R4,     R1                      ; 5CE3   02A1
        MVO@    R1,     R3                      ; 5CE4   0259
        MVO@    R0,     R5                      ; 5CE5   0268
        INCR    R3                              ; 5CE6   000B
        MVI@    R3,     R0                      ; 5CE7   0298
        MVI@    R4,     R1                      ; 5CE8   02A1
        MVO@    R1,     R3                      ; 5CE9   0259
        MVO@    R0,     R5                      ; 5CEA   0268
        INCR    R3                              ; 5CEB   000B
        MVI@    R3,     R0                      ; 5CEC   0298
        MVI@    R4,     R1                      ; 5CED   02A1
        MVO@    R1,     R3                      ; 5CEE   0259
        MVO@    R0,     R5                      ; 5CEF   0268
        INCR    R3                              ; 5CF0   000B
        MVI@    R3,     R0                      ; 5CF1   0298
        MVI@    R4,     R1                      ; 5CF2   02A1
        MVO@    R1,     R3                      ; 5CF3   0259
        MVO@    R0,     R5                      ; 5CF4   0268
        INCR    R3                              ; 5CF5   000B
        MVI@    R3,     R0                      ; 5CF6   0298
        MVI@    R4,     R1                      ; 5CF7   02A1
        MVO@    R1,     R3                      ; 5CF8   0259
        MVO@    R0,     R5                      ; 5CF9   0268
        INCR    R3                              ; 5CFA   000B
        MVI@    R3,     R0                      ; 5CFB   0298
        MVI@    R4,     R1                      ; 5CFC   02A1
        MVO@    R1,     R3                      ; 5CFD   0259
        MVO@    R0,     R5                      ; 5CFE   0268
        INCR    R3                              ; 5CFF   000B
        MVI@    R3,     R0                      ; 5D00   0298
        MVI@    R4,     R1                      ; 5D01   02A1
        MVO@    R1,     R3                      ; 5D02   0259
        MVO@    R0,     R5                      ; 5D03   0268
        INCR    R3                              ; 5D04   000B
        MVI@    R3,     R0                      ; 5D05   0298
        MVI@    R4,     R1                      ; 5D06   02A1
        MVO@    R1,     R3                      ; 5D07   0259
        MVO@    R0,     R5                      ; 5D08   0268
        INCR    R3                              ; 5D09   000B
        MVI@    R3,     R0                      ; 5D0A   0298
        MVI@    R4,     R1                      ; 5D0B   02A1
        MVO@    R1,     R3                      ; 5D0C   0259
        MVO@    R0,     R5                      ; 5D0D   0268
        INCR    R3                              ; 5D0E   000B
        MVI@    R3,     R0                      ; 5D0F   0298
        MVI@    R4,     R1                      ; 5D10   02A1
        MVO@    R1,     R3                      ; 5D11   0259
        MVO@    R0,     R5                      ; 5D12   0268
        INCR    R3                              ; 5D13   000B
        MVI@    R3,     R0                      ; 5D14   0298
        MVI@    R4,     R1                      ; 5D15   02A1
        MVO@    R1,     R3                      ; 5D16   0259
        MVO@    R0,     R5                      ; 5D17   0268
        INCR    R3                              ; 5D18   000B
        MVI@    R3,     R0                      ; 5D19   0298
        MVI@    R4,     R1                      ; 5D1A   02A1
        MVO@    R1,     R3                      ; 5D1B   0259
        MVO@    R0,     R5                      ; 5D1C   0268
        INCR    R3                              ; 5D1D   000B
        ADDI    #$0004, R3                      ; 5D1E   02FB 0004
        MVII    #$02FC, R4                      ; 5D20   02BC 02FC
        MOVR    R4,     R5                      ; 5D22   00A5
        MVI@    R3,     R0                      ; 5D23   0298
        MVI@    R4,     R1                      ; 5D24   02A1
        MVO@    R1,     R3                      ; 5D25   0259
        MVO@    R0,     R5                      ; 5D26   0268
        INCR    R3                              ; 5D27   000B
        MVI@    R3,     R0                      ; 5D28   0298
        MVI@    R4,     R1                      ; 5D29   02A1
        MVO@    R1,     R3                      ; 5D2A   0259
        MVO@    R0,     R5                      ; 5D2B   0268
        INCR    R3                              ; 5D2C   000B
        MVI@    R3,     R0                      ; 5D2D   0298
        MVI@    R4,     R1                      ; 5D2E   02A1
        MVO@    R1,     R3                      ; 5D2F   0259
        MVO@    R0,     R5                      ; 5D30   0268
        INCR    R3                              ; 5D31   000B
        MVI@    R3,     R0                      ; 5D32   0298
        MVI@    R4,     R1                      ; 5D33   02A1
        MVO@    R1,     R3                      ; 5D34   0259
        MVO@    R0,     R5                      ; 5D35   0268
        INCR    R3                              ; 5D36   000B
        MVI@    R3,     R0                      ; 5D37   0298
        MVI@    R4,     R1                      ; 5D38   02A1
        MVO@    R1,     R3                      ; 5D39   0259
        MVO@    R0,     R5                      ; 5D3A   0268
        INCR    R3                              ; 5D3B   000B
        MVI@    R3,     R0                      ; 5D3C   0298
        MVI@    R4,     R1                      ; 5D3D   02A1
        MVO@    R1,     R3                      ; 5D3E   0259
        MVO@    R0,     R5                      ; 5D3F   0268
        INCR    R3                              ; 5D40   000B
        MVI@    R3,     R0                      ; 5D41   0298
        MVI@    R4,     R1                      ; 5D42   02A1
        MVO@    R1,     R3                      ; 5D43   0259
        MVO@    R0,     R5                      ; 5D44   0268
        INCR    R3                              ; 5D45   000B
        MVI@    R3,     R0                      ; 5D46   0298
        MVI@    R4,     R1                      ; 5D47   02A1
        MVO@    R1,     R3                      ; 5D48   0259
        MVO@    R0,     R5                      ; 5D49   0268
        INCR    R3                              ; 5D4A   000B
        MVI@    R3,     R0                      ; 5D4B   0298
        MVI@    R4,     R1                      ; 5D4C   02A1
        MVO@    R1,     R3                      ; 5D4D   0259
        MVO@    R0,     R5                      ; 5D4E   0268
        INCR    R3                              ; 5D4F   000B
        MVI@    R3,     R0                      ; 5D50   0298
        MVI@    R4,     R1                      ; 5D51   02A1
        MVO@    R1,     R3                      ; 5D52   0259
        MVO@    R0,     R5                      ; 5D53   0268
        INCR    R3                              ; 5D54   000B
        MVI@    R3,     R0                      ; 5D55   0298
        MVI@    R4,     R1                      ; 5D56   02A1
        MVO@    R1,     R3                      ; 5D57   0259
        MVO@    R0,     R5                      ; 5D58   0268
        INCR    R3                              ; 5D59   000B
        MVI@    R3,     R0                      ; 5D5A   0298
        MVI@    R4,     R1                      ; 5D5B   02A1
        MVO@    R1,     R3                      ; 5D5C   0259
        MVO@    R0,     R5                      ; 5D5D   0268
        INCR    R3                              ; 5D5E   000B
        MVI@    R3,     R0                      ; 5D5F   0298
        MVI@    R4,     R1                      ; 5D60   02A1
        MVO@    R1,     R3                      ; 5D61   0259
        MVO@    R0,     R5                      ; 5D62   0268
        INCR    R3                              ; 5D63   000B
        MVI@    R3,     R0                      ; 5D64   0298
        MVI@    R4,     R1                      ; 5D65   02A1
        MVO@    R1,     R3                      ; 5D66   0259
        MVO@    R0,     R5                      ; 5D67   0268
        INCR    R3                              ; 5D68   000B
        MVI@    R3,     R0                      ; 5D69   0298
        MVI@    R4,     R1                      ; 5D6A   02A1
        MVO@    R1,     R3                      ; 5D6B   0259
        MVO@    R0,     R5                      ; 5D6C   0268
        INCR    R3                              ; 5D6D   000B
        MVI@    R3,     R0                      ; 5D6E   0298
        MVI@    R4,     R1                      ; 5D6F   02A1
        MVO@    R1,     R3                      ; 5D70   0259
        MVO@    R0,     R5                      ; 5D71   0268
        INCR    R3                              ; 5D72   000B
        ADDI    #$0004, R3                      ; 5D73   02FB 0004
        MVII    #$02FC, R4                      ; 5D75   02BC 02FC
        MOVR    R4,     R5                      ; 5D77   00A5
        MVI@    R3,     R0                      ; 5D78   0298
        MVI@    R4,     R1                      ; 5D79   02A1
        MVO@    R1,     R3                      ; 5D7A   0259
        MVO@    R0,     R5                      ; 5D7B   0268
        INCR    R3                              ; 5D7C   000B
        MVI@    R3,     R0                      ; 5D7D   0298
        MVI@    R4,     R1                      ; 5D7E   02A1
        MVO@    R1,     R3                      ; 5D7F   0259
        MVO@    R0,     R5                      ; 5D80   0268
        INCR    R3                              ; 5D81   000B
        MVI@    R3,     R0                      ; 5D82   0298
        MVI@    R4,     R1                      ; 5D83   02A1
        MVO@    R1,     R3                      ; 5D84   0259
        MVO@    R0,     R5                      ; 5D85   0268
        INCR    R3                              ; 5D86   000B
        MVI@    R3,     R0                      ; 5D87   0298
        MVI@    R4,     R1                      ; 5D88   02A1
        MVO@    R1,     R3                      ; 5D89   0259
        MVO@    R0,     R5                      ; 5D8A   0268
        INCR    R3                              ; 5D8B   000B
        MVI@    R3,     R0                      ; 5D8C   0298
        MVI@    R4,     R1                      ; 5D8D   02A1
        MVO@    R1,     R3                      ; 5D8E   0259
        MVO@    R0,     R5                      ; 5D8F   0268
        INCR    R3                              ; 5D90   000B
        MVI@    R3,     R0                      ; 5D91   0298
        MVI@    R4,     R1                      ; 5D92   02A1
        MVO@    R1,     R3                      ; 5D93   0259
        MVO@    R0,     R5                      ; 5D94   0268
        INCR    R3                              ; 5D95   000B
        MVI@    R3,     R0                      ; 5D96   0298
        MVI@    R4,     R1                      ; 5D97   02A1
        MVO@    R1,     R3                      ; 5D98   0259
        MVO@    R0,     R5                      ; 5D99   0268
        INCR    R3                              ; 5D9A   000B
        MVI@    R3,     R0                      ; 5D9B   0298
        MVI@    R4,     R1                      ; 5D9C   02A1
        MVO@    R1,     R3                      ; 5D9D   0259
        MVO@    R0,     R5                      ; 5D9E   0268
        INCR    R3                              ; 5D9F   000B
        MVI@    R3,     R0                      ; 5DA0   0298
        MVI@    R4,     R1                      ; 5DA1   02A1
        MVO@    R1,     R3                      ; 5DA2   0259
        MVO@    R0,     R5                      ; 5DA3   0268
        INCR    R3                              ; 5DA4   000B
        MVI@    R3,     R0                      ; 5DA5   0298
        MVI@    R4,     R1                      ; 5DA6   02A1
        MVO@    R1,     R3                      ; 5DA7   0259
        MVO@    R0,     R5                      ; 5DA8   0268
        INCR    R3                              ; 5DA9   000B
        MVI@    R3,     R0                      ; 5DAA   0298
        MVI@    R4,     R1                      ; 5DAB   02A1
        MVO@    R1,     R3                      ; 5DAC   0259
        MVO@    R0,     R5                      ; 5DAD   0268
        INCR    R3                              ; 5DAE   000B
        MVI@    R3,     R0                      ; 5DAF   0298
        MVI@    R4,     R1                      ; 5DB0   02A1
        MVO@    R1,     R3                      ; 5DB1   0259
        MVO@    R0,     R5                      ; 5DB2   0268
        INCR    R3                              ; 5DB3   000B
        MVI@    R3,     R0                      ; 5DB4   0298
        MVI@    R4,     R1                      ; 5DB5   02A1
        MVO@    R1,     R3                      ; 5DB6   0259
        MVO@    R0,     R5                      ; 5DB7   0268
        INCR    R3                              ; 5DB8   000B
        MVI@    R3,     R0                      ; 5DB9   0298
        MVI@    R4,     R1                      ; 5DBA   02A1
        MVO@    R1,     R3                      ; 5DBB   0259
        MVO@    R0,     R5                      ; 5DBC   0268
        INCR    R3                              ; 5DBD   000B
        MVI@    R3,     R0                      ; 5DBE   0298
        MVI@    R4,     R1                      ; 5DBF   02A1
        MVO@    R1,     R3                      ; 5DC0   0259
        MVO@    R0,     R5                      ; 5DC1   0268
        INCR    R3                              ; 5DC2   000B
        MVI@    R3,     R0                      ; 5DC3   0298
        MVI@    R4,     R1                      ; 5DC4   02A1
        MVO@    R1,     R3                      ; 5DC5   0259
        MVO@    R0,     R5                      ; 5DC6   0268
        INCR    R3                              ; 5DC7   000B
        ADDI    #$0004, R3                      ; 5DC8   02FB 0004
        MVII    #$02FC, R4                      ; 5DCA   02BC 02FC
        MOVR    R4,     R5                      ; 5DCC   00A5
        MVI@    R3,     R0                      ; 5DCD   0298
        MVI@    R4,     R1                      ; 5DCE   02A1
        MVO@    R1,     R3                      ; 5DCF   0259
        MVO@    R0,     R5                      ; 5DD0   0268
        INCR    R3                              ; 5DD1   000B
        MVI@    R3,     R0                      ; 5DD2   0298
        MVI@    R4,     R1                      ; 5DD3   02A1
        MVO@    R1,     R3                      ; 5DD4   0259
        MVO@    R0,     R5                      ; 5DD5   0268
        INCR    R3                              ; 5DD6   000B
        MVI@    R3,     R0                      ; 5DD7   0298
        MVI@    R4,     R1                      ; 5DD8   02A1
        MVO@    R1,     R3                      ; 5DD9   0259
        MVO@    R0,     R5                      ; 5DDA   0268
        INCR    R3                              ; 5DDB   000B
        MVI@    R3,     R0                      ; 5DDC   0298
        MVI@    R4,     R1                      ; 5DDD   02A1
        MVO@    R1,     R3                      ; 5DDE   0259
        MVO@    R0,     R5                      ; 5DDF   0268
        INCR    R3                              ; 5DE0   000B
        MVI@    R3,     R0                      ; 5DE1   0298
        MVI@    R4,     R1                      ; 5DE2   02A1
        MVO@    R1,     R3                      ; 5DE3   0259
        MVO@    R0,     R5                      ; 5DE4   0268
        INCR    R3                              ; 5DE5   000B
        MVI@    R3,     R0                      ; 5DE6   0298
        MVI@    R4,     R1                      ; 5DE7   02A1
        MVO@    R1,     R3                      ; 5DE8   0259
        MVO@    R0,     R5                      ; 5DE9   0268
        INCR    R3                              ; 5DEA   000B
        MVI@    R3,     R0                      ; 5DEB   0298
        MVI@    R4,     R1                      ; 5DEC   02A1
        MVO@    R1,     R3                      ; 5DED   0259
        MVO@    R0,     R5                      ; 5DEE   0268
        INCR    R3                              ; 5DEF   000B
        MVI@    R3,     R0                      ; 5DF0   0298
        MVI@    R4,     R1                      ; 5DF1   02A1
        MVO@    R1,     R3                      ; 5DF2   0259
        MVO@    R0,     R5                      ; 5DF3   0268
        INCR    R3                              ; 5DF4   000B
        MVI@    R3,     R0                      ; 5DF5   0298
        MVI@    R4,     R1                      ; 5DF6   02A1
        MVO@    R1,     R3                      ; 5DF7   0259
        MVO@    R0,     R5                      ; 5DF8   0268
        INCR    R3                              ; 5DF9   000B
        MVI@    R3,     R0                      ; 5DFA   0298
        MVI@    R4,     R1                      ; 5DFB   02A1
        MVO@    R1,     R3                      ; 5DFC   0259
        MVO@    R0,     R5                      ; 5DFD   0268
        INCR    R3                              ; 5DFE   000B
        MVI@    R3,     R0                      ; 5DFF   0298
        MVI@    R4,     R1                      ; 5E00   02A1
        MVO@    R1,     R3                      ; 5E01   0259
        MVO@    R0,     R5                      ; 5E02   0268
        INCR    R3                              ; 5E03   000B
        MVI@    R3,     R0                      ; 5E04   0298
        MVI@    R4,     R1                      ; 5E05   02A1
        MVO@    R1,     R3                      ; 5E06   0259
        MVO@    R0,     R5                      ; 5E07   0268
        INCR    R3                              ; 5E08   000B
        MVI@    R3,     R0                      ; 5E09   0298
L_5E0A:
        MVI@    R4,     R1                      ; 5E0A   02A1
        MVO@    R1,     R3                      ; 5E0B   0259
        MVO@    R0,     R5                      ; 5E0C   0268
        INCR    R3                              ; 5E0D   000B
        MVI@    R3,     R0                      ; 5E0E   0298
        MVI@    R4,     R1                      ; 5E0F   02A1
        MVO@    R1,     R3                      ; 5E10   0259
        MVO@    R0,     R5                      ; 5E11   0268
        INCR    R3                              ; 5E12   000B
        MVI@    R3,     R0                      ; 5E13   0298
        MVI@    R4,     R1                      ; 5E14   02A1
        MVO@    R1,     R3                      ; 5E15   0259
        MVO@    R0,     R5                      ; 5E16   0268
        INCR    R3                              ; 5E17   000B
        MVI@    R3,     R0                      ; 5E18   0298
        MVI@    R4,     R1                      ; 5E19   02A1
        MVO@    R1,     R3                      ; 5E1A   0259
        MVO@    R0,     R5                      ; 5E1B   0268
        INCR    R3                              ; 5E1C   000B
        ADDI    #$0004, R3                      ; 5E1D   02FB 0004
        MVII    #$02FC, R4                      ; 5E1F   02BC 02FC
        MOVR    R4,     R5                      ; 5E21   00A5
        MVI@    R3,     R0                      ; 5E22   0298
        MVI@    R4,     R1                      ; 5E23   02A1
        MVO@    R1,     R3                      ; 5E24   0259
        MVO@    R0,     R5                      ; 5E25   0268
        INCR    R3                              ; 5E26   000B
        MVI@    R3,     R0                      ; 5E27   0298
        MVI@    R4,     R1                      ; 5E28   02A1
        MVO@    R1,     R3                      ; 5E29   0259
        MVO@    R0,     R5                      ; 5E2A   0268
        INCR    R3                              ; 5E2B   000B
        MVI@    R3,     R0                      ; 5E2C   0298
        MVI@    R4,     R1                      ; 5E2D   02A1
        MVO@    R1,     R3                      ; 5E2E   0259
        MVO@    R0,     R5                      ; 5E2F   0268
        INCR    R3                              ; 5E30   000B
        MVI@    R3,     R0                      ; 5E31   0298
        MVI@    R4,     R1                      ; 5E32   02A1
        MVO@    R1,     R3                      ; 5E33   0259
        MVO@    R0,     R5                      ; 5E34   0268
        INCR    R3                              ; 5E35   000B
        MVI@    R3,     R0                      ; 5E36   0298
        MVI@    R4,     R1                      ; 5E37   02A1
        MVO@    R1,     R3                      ; 5E38   0259
        MVO@    R0,     R5                      ; 5E39   0268
        INCR    R3                              ; 5E3A   000B
        MVI@    R3,     R0                      ; 5E3B   0298
        MVI@    R4,     R1                      ; 5E3C   02A1
        MVO@    R1,     R3                      ; 5E3D   0259
        MVO@    R0,     R5                      ; 5E3E   0268
        INCR    R3                              ; 5E3F   000B
        MVI@    R3,     R0                      ; 5E40   0298
        MVI@    R4,     R1                      ; 5E41   02A1
        MVO@    R1,     R3                      ; 5E42   0259
        MVO@    R0,     R5                      ; 5E43   0268
        INCR    R3                              ; 5E44   000B
        MVI@    R3,     R0                      ; 5E45   0298
        MVI@    R4,     R1                      ; 5E46   02A1
        MVO@    R1,     R3                      ; 5E47   0259
        MVO@    R0,     R5                      ; 5E48   0268
        INCR    R3                              ; 5E49   000B
        MVI@    R3,     R0                      ; 5E4A   0298
        MVI@    R4,     R1                      ; 5E4B   02A1
        MVO@    R1,     R3                      ; 5E4C   0259
        MVO@    R0,     R5                      ; 5E4D   0268
        INCR    R3                              ; 5E4E   000B
        MVI@    R3,     R0                      ; 5E4F   0298
        MVI@    R4,     R1                      ; 5E50   02A1
        MVO@    R1,     R3                      ; 5E51   0259
        MVO@    R0,     R5                      ; 5E52   0268
        INCR    R3                              ; 5E53   000B
        MVI@    R3,     R0                      ; 5E54   0298
        MVI@    R4,     R1                      ; 5E55   02A1
        MVO@    R1,     R3                      ; 5E56   0259
        MVO@    R0,     R5                      ; 5E57   0268
        INCR    R3                              ; 5E58   000B
        MVI@    R3,     R0                      ; 5E59   0298
        MVI@    R4,     R1                      ; 5E5A   02A1
        MVO@    R1,     R3                      ; 5E5B   0259
        MVO@    R0,     R5                      ; 5E5C   0268
        INCR    R3                              ; 5E5D   000B
        MVI@    R3,     R0                      ; 5E5E   0298
        MVI@    R4,     R1                      ; 5E5F   02A1
        MVO@    R1,     R3                      ; 5E60   0259
        MVO@    R0,     R5                      ; 5E61   0268
        INCR    R3                              ; 5E62   000B
        MVI@    R3,     R0                      ; 5E63   0298
        MVI@    R4,     R1                      ; 5E64   02A1
        MVO@    R1,     R3                      ; 5E65   0259
        MVO@    R0,     R5                      ; 5E66   0268
        INCR    R3                              ; 5E67   000B
        MVI@    R3,     R0                      ; 5E68   0298
        MVI@    R4,     R1                      ; 5E69   02A1
        MVO@    R1,     R3                      ; 5E6A   0259
        MVO@    R0,     R5                      ; 5E6B   0268
        INCR    R3                              ; 5E6C   000B
        MVI@    R3,     R0                      ; 5E6D   0298
        MVI@    R4,     R1                      ; 5E6E   02A1
        MVO@    R1,     R3                      ; 5E6F   0259
        MVO@    R0,     R5                      ; 5E70   0268
        INCR    R3                              ; 5E71   000B
        ADDI    #$0004, R3                      ; 5E72   02FB 0004
        MVII    #$02FC, R4                      ; 5E74   02BC 02FC
        MOVR    R4,     R5                      ; 5E76   00A5
        MVI@    R3,     R0                      ; 5E77   0298
        MVI@    R4,     R1                      ; 5E78   02A1
        MVO@    R1,     R3                      ; 5E79   0259
        MVO@    R0,     R5                      ; 5E7A   0268
        INCR    R3                              ; 5E7B   000B
        MVI@    R3,     R0                      ; 5E7C   0298
        MVI@    R4,     R1                      ; 5E7D   02A1
        MVO@    R1,     R3                      ; 5E7E   0259
        MVO@    R0,     R5                      ; 5E7F   0268
        INCR    R3                              ; 5E80   000B
        MVI@    R3,     R0                      ; 5E81   0298
        MVI@    R4,     R1                      ; 5E82   02A1
        MVO@    R1,     R3                      ; 5E83   0259
        MVO@    R0,     R5                      ; 5E84   0268
        INCR    R3                              ; 5E85   000B
        MVI@    R3,     R0                      ; 5E86   0298
        MVI@    R4,     R1                      ; 5E87   02A1
        MVO@    R1,     R3                      ; 5E88   0259
        MVO@    R0,     R5                      ; 5E89   0268
        INCR    R3                              ; 5E8A   000B
        MVI@    R3,     R0                      ; 5E8B   0298
        MVI@    R4,     R1                      ; 5E8C   02A1
        MVO@    R1,     R3                      ; 5E8D   0259
        MVO@    R0,     R5                      ; 5E8E   0268
        INCR    R3                              ; 5E8F   000B
        MVI@    R3,     R0                      ; 5E90   0298
        MVI@    R4,     R1                      ; 5E91   02A1
        MVO@    R1,     R3                      ; 5E92   0259
        MVO@    R0,     R5                      ; 5E93   0268
        INCR    R3                              ; 5E94   000B
        MVI@    R3,     R0                      ; 5E95   0298
        MVI@    R4,     R1                      ; 5E96   02A1
        MVO@    R1,     R3                      ; 5E97   0259
        MVO@    R0,     R5                      ; 5E98   0268
        INCR    R3                              ; 5E99   000B
        MVI@    R3,     R0                      ; 5E9A   0298
        MVI@    R4,     R1                      ; 5E9B   02A1
        MVO@    R1,     R3                      ; 5E9C   0259
        MVO@    R0,     R5                      ; 5E9D   0268
        INCR    R3                              ; 5E9E   000B
        MVI@    R3,     R0                      ; 5E9F   0298
        MVI@    R4,     R1                      ; 5EA0   02A1
        MVO@    R1,     R3                      ; 5EA1   0259
        MVO@    R0,     R5                      ; 5EA2   0268
        INCR    R3                              ; 5EA3   000B
        MVI@    R3,     R0                      ; 5EA4   0298
        MVI@    R4,     R1                      ; 5EA5   02A1
        MVO@    R1,     R3                      ; 5EA6   0259
        MVO@    R0,     R5                      ; 5EA7   0268
        INCR    R3                              ; 5EA8   000B
        MVI@    R3,     R0                      ; 5EA9   0298
        MVI@    R4,     R1                      ; 5EAA   02A1
        MVO@    R1,     R3                      ; 5EAB   0259
        MVO@    R0,     R5                      ; 5EAC   0268
        INCR    R3                              ; 5EAD   000B
        MVI@    R3,     R0                      ; 5EAE   0298
        MVI@    R4,     R1                      ; 5EAF   02A1
        MVO@    R1,     R3                      ; 5EB0   0259
        MVO@    R0,     R5                      ; 5EB1   0268
        INCR    R3                              ; 5EB2   000B
        MVI@    R3,     R0                      ; 5EB3   0298
        MVI@    R4,     R1                      ; 5EB4   02A1
        MVO@    R1,     R3                      ; 5EB5   0259
        MVO@    R0,     R5                      ; 5EB6   0268
        INCR    R3                              ; 5EB7   000B
        MVI@    R3,     R0                      ; 5EB8   0298
        MVI@    R4,     R1                      ; 5EB9   02A1
        MVO@    R1,     R3                      ; 5EBA   0259
        MVO@    R0,     R5                      ; 5EBB   0268
        INCR    R3                              ; 5EBC   000B
        MVI@    R3,     R0                      ; 5EBD   0298
        MVI@    R4,     R1                      ; 5EBE   02A1
        MVO@    R1,     R3                      ; 5EBF   0259
        MVO@    R0,     R5                      ; 5EC0   0268
        INCR    R3                              ; 5EC1   000B
        MVI@    R3,     R0                      ; 5EC2   0298
        MVI@    R4,     R1                      ; 5EC3   02A1
        MVO@    R1,     R3                      ; 5EC4   0259
        MVO@    R0,     R5                      ; 5EC5   0268
        INCR    R3                              ; 5EC6   000B
        ADDI    #$0004, R3                      ; 5EC7   02FB 0004
        MVII    #$02FC, R4                      ; 5EC9   02BC 02FC
        MOVR    R4,     R5                      ; 5ECB   00A5
        MVI@    R3,     R0                      ; 5ECC   0298
        MVI@    R4,     R1                      ; 5ECD   02A1
        MVO@    R1,     R3                      ; 5ECE   0259
        MVO@    R0,     R5                      ; 5ECF   0268
        INCR    R3                              ; 5ED0   000B
        MVI@    R3,     R0                      ; 5ED1   0298
        MVI@    R4,     R1                      ; 5ED2   02A1
        MVO@    R1,     R3                      ; 5ED3   0259
        MVO@    R0,     R5                      ; 5ED4   0268
        INCR    R3                              ; 5ED5   000B
        MVI@    R3,     R0                      ; 5ED6   0298
        MVI@    R4,     R1                      ; 5ED7   02A1
        MVO@    R1,     R3                      ; 5ED8   0259
        MVO@    R0,     R5                      ; 5ED9   0268
        INCR    R3                              ; 5EDA   000B
        MVI@    R3,     R0                      ; 5EDB   0298
        MVI@    R4,     R1                      ; 5EDC   02A1
        MVO@    R1,     R3                      ; 5EDD   0259
        MVO@    R0,     R5                      ; 5EDE   0268
        INCR    R3                              ; 5EDF   000B
        MVI@    R3,     R0                      ; 5EE0   0298
        MVI@    R4,     R1                      ; 5EE1   02A1
        MVO@    R1,     R3                      ; 5EE2   0259
        MVO@    R0,     R5                      ; 5EE3   0268
        INCR    R3                              ; 5EE4   000B
        MVI@    R3,     R0                      ; 5EE5   0298
        MVI@    R4,     R1                      ; 5EE6   02A1
        MVO@    R1,     R3                      ; 5EE7   0259
        MVO@    R0,     R5                      ; 5EE8   0268
        INCR    R3                              ; 5EE9   000B
        MVI@    R3,     R0                      ; 5EEA   0298
        MVI@    R4,     R1                      ; 5EEB   02A1
        MVO@    R1,     R3                      ; 5EEC   0259
        MVO@    R0,     R5                      ; 5EED   0268
        INCR    R3                              ; 5EEE   000B
        MVI@    R3,     R0                      ; 5EEF   0298
        MVI@    R4,     R1                      ; 5EF0   02A1
        MVO@    R1,     R3                      ; 5EF1   0259
        MVO@    R0,     R5                      ; 5EF2   0268
        INCR    R3                              ; 5EF3   000B
        MVI@    R3,     R0                      ; 5EF4   0298
        MVI@    R4,     R1                      ; 5EF5   02A1
        MVO@    R1,     R3                      ; 5EF6   0259
        MVO@    R0,     R5                      ; 5EF7   0268
        INCR    R3                              ; 5EF8   000B
        MVI@    R3,     R0                      ; 5EF9   0298
        MVI@    R4,     R1                      ; 5EFA   02A1
        MVO@    R1,     R3                      ; 5EFB   0259
        MVO@    R0,     R5                      ; 5EFC   0268
        INCR    R3                              ; 5EFD   000B
        MVI@    R3,     R0                      ; 5EFE   0298
        MVI@    R4,     R1                      ; 5EFF   02A1
        MVO@    R1,     R3                      ; 5F00   0259
        MVO@    R0,     R5                      ; 5F01   0268
        INCR    R3                              ; 5F02   000B
        MVI@    R3,     R0                      ; 5F03   0298
        MVI@    R4,     R1                      ; 5F04   02A1
        MVO@    R1,     R3                      ; 5F05   0259
        MVO@    R0,     R5                      ; 5F06   0268
        INCR    R3                              ; 5F07   000B
        MVI@    R3,     R0                      ; 5F08   0298
        MVI@    R4,     R1                      ; 5F09   02A1
        MVO@    R1,     R3                      ; 5F0A   0259
        MVO@    R0,     R5                      ; 5F0B   0268
        INCR    R3                              ; 5F0C   000B
        MVI@    R3,     R0                      ; 5F0D   0298
        MVI@    R4,     R1                      ; 5F0E   02A1
        MVO@    R1,     R3                      ; 5F0F   0259
        MVO@    R0,     R5                      ; 5F10   0268
        INCR    R3                              ; 5F11   000B
        MVI@    R3,     R0                      ; 5F12   0298
        MVI@    R4,     R1                      ; 5F13   02A1
        MVO@    R1,     R3                      ; 5F14   0259
        MVO@    R0,     R5                      ; 5F15   0268
        INCR    R3                              ; 5F16   000B
        MVI@    R3,     R0                      ; 5F17   0298
        MVI@    R4,     R1                      ; 5F18   02A1
        MVO@    R1,     R3                      ; 5F19   0259
        MVO@    R0,     R5                      ; 5F1A   0268
        INCR    R3                              ; 5F1B   000B
        ADDI    #$0004, R3                      ; 5F1C   02FB 0004
        MVII    #$02FC, R4                      ; 5F1E   02BC 02FC
        MOVR    R4,     R5                      ; 5F20   00A5
        MVI@    R3,     R0                      ; 5F21   0298
        MVI@    R4,     R1                      ; 5F22   02A1
        MVO@    R1,     R3                      ; 5F23   0259
        MVO@    R0,     R5                      ; 5F24   0268
        INCR    R3                              ; 5F25   000B
        MVI@    R3,     R0                      ; 5F26   0298
        MVI@    R4,     R1                      ; 5F27   02A1
        MVO@    R1,     R3                      ; 5F28   0259
        MVO@    R0,     R5                      ; 5F29   0268
        INCR    R3                              ; 5F2A   000B
        MVI@    R3,     R0                      ; 5F2B   0298
        MVI@    R4,     R1                      ; 5F2C   02A1
        MVO@    R1,     R3                      ; 5F2D   0259
        MVO@    R0,     R5                      ; 5F2E   0268
        INCR    R3                              ; 5F2F   000B
        MVI@    R3,     R0                      ; 5F30   0298
        MVI@    R4,     R1                      ; 5F31   02A1
        MVO@    R1,     R3                      ; 5F32   0259
        MVO@    R0,     R5                      ; 5F33   0268
        INCR    R3                              ; 5F34   000B
        MVI@    R3,     R0                      ; 5F35   0298
        MVI@    R4,     R1                      ; 5F36   02A1
        MVO@    R1,     R3                      ; 5F37   0259
        MVO@    R0,     R5                      ; 5F38   0268
        INCR    R3                              ; 5F39   000B
        MVI@    R3,     R0                      ; 5F3A   0298
        MVI@    R4,     R1                      ; 5F3B   02A1
        MVO@    R1,     R3                      ; 5F3C   0259
        MVO@    R0,     R5                      ; 5F3D   0268
        INCR    R3                              ; 5F3E   000B
        MVI@    R3,     R0                      ; 5F3F   0298
        MVI@    R4,     R1                      ; 5F40   02A1
        MVO@    R1,     R3                      ; 5F41   0259
        MVO@    R0,     R5                      ; 5F42   0268
        INCR    R3                              ; 5F43   000B
        MVI@    R3,     R0                      ; 5F44   0298
        MVI@    R4,     R1                      ; 5F45   02A1
        MVO@    R1,     R3                      ; 5F46   0259
        MVO@    R0,     R5                      ; 5F47   0268
        INCR    R3                              ; 5F48   000B
        MVI@    R3,     R0                      ; 5F49   0298
        MVI@    R4,     R1                      ; 5F4A   02A1
        MVO@    R1,     R3                      ; 5F4B   0259
        MVO@    R0,     R5                      ; 5F4C   0268
        INCR    R3                              ; 5F4D   000B
        MVI@    R3,     R0                      ; 5F4E   0298
        MVI@    R4,     R1                      ; 5F4F   02A1
        MVO@    R1,     R3                      ; 5F50   0259
        MVO@    R0,     R5                      ; 5F51   0268
        INCR    R3                              ; 5F52   000B
        MVI@    R3,     R0                      ; 5F53   0298
        MVI@    R4,     R1                      ; 5F54   02A1
        MVO@    R1,     R3                      ; 5F55   0259
        MVO@    R0,     R5                      ; 5F56   0268
        INCR    R3                              ; 5F57   000B
        MVI@    R3,     R0                      ; 5F58   0298
        MVI@    R4,     R1                      ; 5F59   02A1
        MVO@    R1,     R3                      ; 5F5A   0259
        MVO@    R0,     R5                      ; 5F5B   0268
        INCR    R3                              ; 5F5C   000B
        MVI@    R3,     R0                      ; 5F5D   0298
        MVI@    R4,     R1                      ; 5F5E   02A1
        MVO@    R1,     R3                      ; 5F5F   0259
        MVO@    R0,     R5                      ; 5F60   0268
        INCR    R3                              ; 5F61   000B
        MVI@    R3,     R0                      ; 5F62   0298
L_5F63:
        MVI@    R4,     R1                      ; 5F63   02A1
        MVO@    R1,     R3                      ; 5F64   0259
        MVO@    R0,     R5                      ; 5F65   0268
        INCR    R3                              ; 5F66   000B
        MVI@    R3,     R0                      ; 5F67   0298
        MVI@    R4,     R1                      ; 5F68   02A1
        MVO@    R1,     R3                      ; 5F69   0259
        MVO@    R0,     R5                      ; 5F6A   0268
        INCR    R3                              ; 5F6B   000B
        MVI@    R3,     R0                      ; 5F6C   0298
        MVI@    R4,     R1                      ; 5F6D   02A1
        MVO@    R1,     R3                      ; 5F6E   0259
        MVO@    R0,     R5                      ; 5F6F   0268
        INCR    R3                              ; 5F70   000B
        ADDI    #$0004, R3                      ; 5F71   02FB 0004
        MVII    #$02FC, R4                      ; 5F73   02BC 02FC
        MOVR    R4,     R5                      ; 5F75   00A5
        MVI@    R3,     R0                      ; 5F76   0298
        MVI@    R4,     R1                      ; 5F77   02A1
        MVO@    R1,     R3                      ; 5F78   0259
        MVO@    R0,     R5                      ; 5F79   0268
        INCR    R3                              ; 5F7A   000B
        MVI@    R3,     R0                      ; 5F7B   0298
        MVI@    R4,     R1                      ; 5F7C   02A1
        MVO@    R1,     R3                      ; 5F7D   0259
        MVO@    R0,     R5                      ; 5F7E   0268
        INCR    R3                              ; 5F7F   000B
        MVI@    R3,     R0                      ; 5F80   0298
        MVI@    R4,     R1                      ; 5F81   02A1
        MVO@    R1,     R3                      ; 5F82   0259
        MVO@    R0,     R5                      ; 5F83   0268
        INCR    R3                              ; 5F84   000B
        MVI@    R3,     R0                      ; 5F85   0298
        MVI@    R4,     R1                      ; 5F86   02A1
        MVO@    R1,     R3                      ; 5F87   0259
        MVO@    R0,     R5                      ; 5F88   0268
        INCR    R3                              ; 5F89   000B
        MVI@    R3,     R0                      ; 5F8A   0298
        MVI@    R4,     R1                      ; 5F8B   02A1
        MVO@    R1,     R3                      ; 5F8C   0259
        MVO@    R0,     R5                      ; 5F8D   0268
        INCR    R3                              ; 5F8E   000B
        MVI@    R3,     R0                      ; 5F8F   0298
        MVI@    R4,     R1                      ; 5F90   02A1
        MVO@    R1,     R3                      ; 5F91   0259
        MVO@    R0,     R5                      ; 5F92   0268
        INCR    R3                              ; 5F93   000B
        MVI@    R3,     R0                      ; 5F94   0298
        MVI@    R4,     R1                      ; 5F95   02A1
        MVO@    R1,     R3                      ; 5F96   0259
        MVO@    R0,     R5                      ; 5F97   0268
        INCR    R3                              ; 5F98   000B
        MVI@    R3,     R0                      ; 5F99   0298
        MVI@    R4,     R1                      ; 5F9A   02A1
        MVO@    R1,     R3                      ; 5F9B   0259
        MVO@    R0,     R5                      ; 5F9C   0268
        INCR    R3                              ; 5F9D   000B
        MVI@    R3,     R0                      ; 5F9E   0298
        MVI@    R4,     R1                      ; 5F9F   02A1
        MVO@    R1,     R3                      ; 5FA0   0259
        MVO@    R0,     R5                      ; 5FA1   0268
        INCR    R3                              ; 5FA2   000B
        MVI@    R3,     R0                      ; 5FA3   0298
        MVI@    R4,     R1                      ; 5FA4   02A1
        MVO@    R1,     R3                      ; 5FA5   0259
        MVO@    R0,     R5                      ; 5FA6   0268
        INCR    R3                              ; 5FA7   000B
        MVI@    R3,     R0                      ; 5FA8   0298
        MVI@    R4,     R1                      ; 5FA9   02A1
        MVO@    R1,     R3                      ; 5FAA   0259
        MVO@    R0,     R5                      ; 5FAB   0268
        INCR    R3                              ; 5FAC   000B
        MVI@    R3,     R0                      ; 5FAD   0298
        MVI@    R4,     R1                      ; 5FAE   02A1
        MVO@    R1,     R3                      ; 5FAF   0259
        MVO@    R0,     R5                      ; 5FB0   0268
        INCR    R3                              ; 5FB1   000B
        MVI@    R3,     R0                      ; 5FB2   0298
        MVI@    R4,     R1                      ; 5FB3   02A1
        MVO@    R1,     R3                      ; 5FB4   0259
        MVO@    R0,     R5                      ; 5FB5   0268
        INCR    R3                              ; 5FB6   000B
        MVI@    R3,     R0                      ; 5FB7   0298
        MVI@    R4,     R1                      ; 5FB8   02A1
        MVO@    R1,     R3                      ; 5FB9   0259
        MVO@    R0,     R5                      ; 5FBA   0268
        INCR    R3                              ; 5FBB   000B
        MVI@    R3,     R0                      ; 5FBC   0298
        MVI@    R4,     R1                      ; 5FBD   02A1
        MVO@    R1,     R3                      ; 5FBE   0259
        MVO@    R0,     R5                      ; 5FBF   0268
        INCR    R3                              ; 5FC0   000B
        MVI@    R3,     R0                      ; 5FC1   0298
        MVI@    R4,     R1                      ; 5FC2   02A1
        MVO@    R1,     R3                      ; 5FC3   0259
        MVO@    R0,     R5                      ; 5FC4   0268
        INCR    R3                              ; 5FC5   000B
        ADDI    #$0004, R3                      ; 5FC6   02FB 0004
        MVII    #$02FC, R4                      ; 5FC8   02BC 02FC
        MOVR    R4,     R5                      ; 5FCA   00A5
        MVI@    R3,     R0                      ; 5FCB   0298
        MVI@    R4,     R1                      ; 5FCC   02A1
        MVO@    R1,     R3                      ; 5FCD   0259
        MVO@    R0,     R5                      ; 5FCE   0268
        INCR    R3                              ; 5FCF   000B
        MVI@    R3,     R0                      ; 5FD0   0298
        MVI@    R4,     R1                      ; 5FD1   02A1
        MVO@    R1,     R3                      ; 5FD2   0259
        MVO@    R0,     R5                      ; 5FD3   0268
        INCR    R3                              ; 5FD4   000B
        MVI@    R3,     R0                      ; 5FD5   0298
        MVI@    R4,     R1                      ; 5FD6   02A1
        MVO@    R1,     R3                      ; 5FD7   0259
        MVO@    R0,     R5                      ; 5FD8   0268
        INCR    R3                              ; 5FD9   000B
        MVI@    R3,     R0                      ; 5FDA   0298
        MVI@    R4,     R1                      ; 5FDB   02A1
        MVO@    R1,     R3                      ; 5FDC   0259
        MVO@    R0,     R5                      ; 5FDD   0268
        INCR    R3                              ; 5FDE   000B
        MVI@    R3,     R0                      ; 5FDF   0298
        MVI@    R4,     R1                      ; 5FE0   02A1
        MVO@    R1,     R3                      ; 5FE1   0259
        MVO@    R0,     R5                      ; 5FE2   0268
        INCR    R3                              ; 5FE3   000B
        MVI@    R3,     R0                      ; 5FE4   0298
        MVI@    R4,     R1                      ; 5FE5   02A1
        MVO@    R1,     R3                      ; 5FE6   0259
        MVO@    R0,     R5                      ; 5FE7   0268
        INCR    R3                              ; 5FE8   000B
        MVI@    R3,     R0                      ; 5FE9   0298
        MVI@    R4,     R1                      ; 5FEA   02A1
        MVO@    R1,     R3                      ; 5FEB   0259
        MVO@    R0,     R5                      ; 5FEC   0268
        INCR    R3                              ; 5FED   000B
        MVI@    R3,     R0                      ; 5FEE   0298
        MVI@    R4,     R1                      ; 5FEF   02A1
        MVO@    R1,     R3                      ; 5FF0   0259
        MVO@    R0,     R5                      ; 5FF1   0268
        INCR    R3                              ; 5FF2   000B
        MVI@    R3,     R0                      ; 5FF3   0298
        MVI@    R4,     R1                      ; 5FF4   02A1
        MVO@    R1,     R3                      ; 5FF5   0259
        MVO@    R0,     R5                      ; 5FF6   0268
        INCR    R3                              ; 5FF7   000B
        MVI@    R3,     R0                      ; 5FF8   0298
        MVI@    R4,     R1                      ; 5FF9   02A1
        MVO@    R1,     R3                      ; 5FFA   0259
        MVO@    R0,     R5                      ; 5FFB   0268
        INCR    R3                              ; 5FFC   000B
        MVI@    R3,     R0                      ; 5FFD   0298
        MVI@    R4,     R1                      ; 5FFE   02A1
        MVO@    R1,     R3                      ; 5FFF   0259
        MVO@    R0,     R5                      ; 6000   0268
        INCR    R3                              ; 6001   000B
        MVI@    R3,     R0                      ; 6002   0298
        MVI@    R4,     R1                      ; 6003   02A1
        MVO@    R1,     R3                      ; 6004   0259
        MVO@    R0,     R5                      ; 6005   0268
        INCR    R3                              ; 6006   000B
        MVI@    R3,     R0                      ; 6007   0298
        MVI@    R4,     R1                      ; 6008   02A1
        MVO@    R1,     R3                      ; 6009   0259
        MVO@    R0,     R5                      ; 600A   0268
        INCR    R3                              ; 600B   000B
L_600C:
        MVI@    R3,     R0                      ; 600C   0298
        MVI@    R4,     R1                      ; 600D   02A1
        MVO@    R1,     R3                      ; 600E   0259
        MVO@    R0,     R5                      ; 600F   0268
        INCR    R3                              ; 6010   000B
        MVI@    R3,     R0                      ; 6011   0298
        MVI@    R4,     R1                      ; 6012   02A1
        MVO@    R1,     R3                      ; 6013   0259
        MVO@    R0,     R5                      ; 6014   0268
        INCR    R3                              ; 6015   000B
        MVI@    R3,     R0                      ; 6016   0298
        MVI@    R4,     R1                      ; 6017   02A1
        MVO@    R1,     R3                      ; 6018   0259
        MVO@    R0,     R5                      ; 6019   0268
        INCR    R3                              ; 601A   000B
        ADDI    #$0004, R3                      ; 601B   02FB 0004
        MVII    #$02FC, R4                      ; 601D   02BC 02FC
        MOVR    R4,     R5                      ; 601F   00A5
        MVI@    R3,     R0                      ; 6020   0298
        MVI@    R4,     R1                      ; 6021   02A1
        MVO@    R1,     R3                      ; 6022   0259
        MVO@    R0,     R5                      ; 6023   0268
        INCR    R3                              ; 6024   000B
        MVI@    R3,     R0                      ; 6025   0298
        MVI@    R4,     R1                      ; 6026   02A1
        MVO@    R1,     R3                      ; 6027   0259
        MVO@    R0,     R5                      ; 6028   0268
        INCR    R3                              ; 6029   000B
        MVI@    R3,     R0                      ; 602A   0298
        MVI@    R4,     R1                      ; 602B   02A1
        MVO@    R1,     R3                      ; 602C   0259
        MVO@    R0,     R5                      ; 602D   0268
        INCR    R3                              ; 602E   000B
        MVI@    R3,     R0                      ; 602F   0298
        MVI@    R4,     R1                      ; 6030   02A1
        MVO@    R1,     R3                      ; 6031   0259
        MVO@    R0,     R5                      ; 6032   0268
        INCR    R3                              ; 6033   000B
        MVI@    R3,     R0                      ; 6034   0298
        MVI@    R4,     R1                      ; 6035   02A1
        MVO@    R1,     R3                      ; 6036   0259
        MVO@    R0,     R5                      ; 6037   0268
        INCR    R3                              ; 6038   000B
        MVI@    R3,     R0                      ; 6039   0298
        MVI@    R4,     R1                      ; 603A   02A1
        MVO@    R1,     R3                      ; 603B   0259
        MVO@    R0,     R5                      ; 603C   0268
        INCR    R3                              ; 603D   000B
        MVI@    R3,     R0                      ; 603E   0298
        MVI@    R4,     R1                      ; 603F   02A1
        MVO@    R1,     R3                      ; 6040   0259
        MVO@    R0,     R5                      ; 6041   0268
        INCR    R3                              ; 6042   000B
        MVI@    R3,     R0                      ; 6043   0298
        MVI@    R4,     R1                      ; 6044   02A1
        MVO@    R1,     R3                      ; 6045   0259
        MVO@    R0,     R5                      ; 6046   0268
        INCR    R3                              ; 6047   000B
        MVI@    R3,     R0                      ; 6048   0298
        MVI@    R4,     R1                      ; 6049   02A1
        MVO@    R1,     R3                      ; 604A   0259
        MVO@    R0,     R5                      ; 604B   0268
        INCR    R3                              ; 604C   000B
        MVI@    R3,     R0                      ; 604D   0298
        MVI@    R4,     R1                      ; 604E   02A1
        MVO@    R1,     R3                      ; 604F   0259
        MVO@    R0,     R5                      ; 6050   0268
        INCR    R3                              ; 6051   000B
        MVI@    R3,     R0                      ; 6052   0298
        MVI@    R4,     R1                      ; 6053   02A1
        MVO@    R1,     R3                      ; 6054   0259
        MVO@    R0,     R5                      ; 6055   0268
        INCR    R3                              ; 6056   000B
        MVI@    R3,     R0                      ; 6057   0298
        MVI@    R4,     R1                      ; 6058   02A1
        MVO@    R1,     R3                      ; 6059   0259
        MVO@    R0,     R5                      ; 605A   0268
        INCR    R3                              ; 605B   000B
        MVI@    R3,     R0                      ; 605C   0298
        MVI@    R4,     R1                      ; 605D   02A1
        MVO@    R1,     R3                      ; 605E   0259
        MVO@    R0,     R5                      ; 605F   0268
        INCR    R3                              ; 6060   000B
        MVI@    R3,     R0                      ; 6061   0298
        MVI@    R4,     R1                      ; 6062   02A1
        MVO@    R1,     R3                      ; 6063   0259
        MVO@    R0,     R5                      ; 6064   0268
        INCR    R3                              ; 6065   000B
        MVI@    R3,     R0                      ; 6066   0298
        MVI@    R4,     R1                      ; 6067   02A1
        MVO@    R1,     R3                      ; 6068   0259
        MVO@    R0,     R5                      ; 6069   0268
        INCR    R3                              ; 606A   000B
        MVI@    R3,     R0                      ; 606B   0298
        MVI@    R4,     R1                      ; 606C   02A1
        MVO@    R1,     R3                      ; 606D   0259
        MVO@    R0,     R5                      ; 606E   0268
        INCR    R3                              ; 606F   000B
        MVII    #$030C, R4                      ; 6070   02BC 030C
        MVII    #$0200, R5                      ; 6072   02BD 0200
        MVI@    R4,     R0                      ; 6074   02A0
        MVO@    R0,     R5                      ; 6075   0268
        MVI@    R4,     R0                      ; 6076   02A0
        MVO@    R0,     R5                      ; 6077   0268
        MVI@    R4,     R0                      ; 6078   02A0
        MVO@    R0,     R5                      ; 6079   0268
        MVI@    R4,     R0                      ; 607A   02A0
        MVO@    R0,     R5                      ; 607B   0268
        MVI@    R4,     R0                      ; 607C   02A0
        MVO@    R0,     R5                      ; 607D   0268
        MVI@    R4,     R0                      ; 607E   02A0
        MVO@    R0,     R5                      ; 607F   0268
        MVI@    R4,     R0                      ; 6080   02A0
        MVO@    R0,     R5                      ; 6081   0268
        MVI@    R4,     R0                      ; 6082   02A0
        MVO@    R0,     R5                      ; 6083   0268
        MVI@    R4,     R0                      ; 6084   02A0
        MVO@    R0,     R5                      ; 6085   0268
        MVI@    R4,     R0                      ; 6086   02A0
        MVO@    R0,     R5                      ; 6087   0268
        MVI@    R4,     R0                      ; 6088   02A0
        MVO@    R0,     R5                      ; 6089   0268
        MVI@    R4,     R0                      ; 608A   02A0
        MVO@    R0,     R5                      ; 608B   0268
        MVI@    R4,     R0                      ; 608C   02A0
        MVO@    R0,     R5                      ; 608D   0268
        MVI@    R4,     R0                      ; 608E   02A0
        MVO@    R0,     R5                      ; 608F   0268
        MVI@    R4,     R0                      ; 6090   02A0
        MVO@    R0,     R5                      ; 6091   0268
        MVI@    R4,     R0                      ; 6092   02A0
        MVO@    R0,     R5                      ; 6093   0268
        MVI     G_012C, R4                      ; 6094   0284 012C
        ANDI    #$0001, R4                      ; 6096   03BC 0001
        ADDR    R4,     R4                      ; 6098   00E4
        ADDR    R4,     R4                      ; 6099   00E4
        ADDI    #$01B4, R4                      ; 609A   02FC 01B4
        MOVR    R4,     R5                      ; 609C   00A5
        MVI@    R4,     R0                      ; 609D   02A0
        TSTR    R0                              ; 609E   0080
        BEQ     L_60A3                          ; 609F   0204 0002

        ADDI    #$0014, R0                      ; 60A1   02F8 0014
L_60A3:
        MVO@    R0,     R5                      ; 60A3   0268
        INCR    R4                              ; 60A4   000C
        INCR    R5                              ; 60A5   000D
        MVI@    R4,     R0                      ; 60A6   02A0
        TSTR    R0                              ; 60A7   0080
        BEQ     L_60AC                          ; 60A8   0204 0002

        ADDI    #$0014, R0                      ; 60AA   02F8 0014
L_60AC:
        MVO@    R0,     R5                      ; 60AC   0268
        MVI     G_01AA, R0                      ; 60AD   0280 01AA
        DECR    R0                              ; 60AF   0010
        MVO     R0,     G_01AA                  ; 60B0   0240 01AA
        BNEQ    L_6101                          ; 60B2   020C 004D

        MVII    #$0003, R0                      ; 60B4   02B8 0003
        MVO     R0,     G_01AA                  ; 60B6   0240 01AA
        MVI     G_01A9, R0                      ; 60B8   0280 01A9
        INCR    R0                              ; 60BA   0008
        ANDI    #$0003, R0                      ; 60BB   03B8 0003
        MVO     R0,     G_01A9                  ; 60BD   0240 01A9
        MVII    #$01A3, R1                      ; 60BF   02B9 01A3
        ADDR    R0,     R1                      ; 60C1   00C1
        CLRR    R3                              ; 60C2   01DB
        MVO@    R3,     R1                      ; 60C3   024B
        MVII    #$0329, R1                      ; 60C4   02B9 0329
        ADDR    R0,     R1                      ; 60C6   00C1
        MVI     G_02F2, R3                      ; 60C7   0283 02F2
        MVO@    R3,     R1                      ; 60C9   024B
        ADDI    #$0008, R1                      ; 60CA   02F9 0008
        MVI     G_02F3, R3                      ; 60CC   0283 02F3
        MVO@    R3,     R1                      ; 60CE   024B
        ADDI    #$0008, R1                      ; 60CF   02F9 0008
        MVI     G_02F4, R3                      ; 60D1   0283 02F4
        MVO@    R3,     R1                      ; 60D3   024B
        SDBD                                    ; 60D4   0001
        CMPI    #$08A0, R3                      ; 60D5   037B 00A0 0008
        BNEQ    L_60DC                          ; 60D8   020C 0002

        MVO     R1,     G_02F1                  ; 60DA   0241 02F1
L_60DC:
        MVII    #$01AB, R4                      ; 60DC   02BC 01AB
        MOVR    R0,     R5                      ; 60DE   0085
        SLL     R0,     2                       ; 60DF   004C
        ADDR    R0,     R5                      ; 60E0   00C5
        ADDI    #$01BC, R5                      ; 60E1   02FD 01BC
        MVI@    R4,     R0                      ; 60E3   02A0
        MVO@    R0,     R5                      ; 60E4   0268
        MVI@    R4,     R0                      ; 60E5   02A0
        MVO@    R0,     R5                      ; 60E6   0268
        MVI@    R4,     R0                      ; 60E7   02A0
        MVO@    R0,     R5                      ; 60E8   0268
        MVI@    R4,     R0                      ; 60E9   02A0
        MVO@    R0,     R5                      ; 60EA   0268
        MVI@    R4,     R0                      ; 60EB   02A0
        MVO@    R0,     R5                      ; 60EC   0268
        MVI     G_01A2, R0                      ; 60ED   0280 01A2
        TSTR    R0                              ; 60EF   0080
        BEQ     L_6101                          ; 60F0   0204 000F

        MVII    #$032D, R1                      ; 60F2   02B9 032D
        MVI     G_02F5, R3                      ; 60F4   0283 02F5
        MVO@    R3,     R1                      ; 60F6   024B
        ADDI    #$0008, R1                      ; 60F7   02F9 0008
        MVI     G_02F6, R3                      ; 60F9   0283 02F6
        MVO@    R3,     R1                      ; 60FB   024B
        ADDI    #$0008, R1                      ; 60FC   02F9 0008
        MVI     G_02F7, R3                      ; 60FE   0283 02F7
        MVO@    R3,     R1                      ; 6100   024B
L_6101:
        CLRR    R0                              ; 6101   01C0
        MVO     R0,     G_019F                  ; 6102   0240 019F
L_6104:
        MVI     G_012C, R0                      ; 6104   0280 012C
        INCR    R0                              ; 6106   0008
        MVO     R0,     G_012C                  ; 6107   0240 012C
        EIS                                     ; 6109   0002
        MVI     G_031D, R7                      ; 610A   0287 031D
L_610C:
        MVI     G_0196, R0                      ; 610C   0280 0196
        ADD     G_0195, R0                      ; 610E   02C0 0195
        BEQ     L_6130                          ; 6110   0204 001E

        MVI     G_0195, R0                      ; 6112   0280 0195
        TSTR    R0                              ; 6114   0080
        BEQ     L_611F                          ; 6115   0204 0008

        MVI     .PSG0.chn_c_lo,R1               ; 6117   0281 01F2
        CMPI    #$007F, R1                      ; 6119   0379 007F
        BEQ     L_611F                          ; 611B   0204 0002

        MVO     R0,     .PSG0.chn_c_lo          ; 611D   0240 01F2
L_611F:
        CLRR    R0                              ; 611F   01C0
        MVO     R0,     .PSG0.chn_c_hi          ; 6120   0240 01F6
        MVI     G_0196, R0                      ; 6122   0280 0196
        DECR    R0                              ; 6124   0010
        ANDI    #$0003, R0                      ; 6125   03B8 0003
        MVO     R0,     G_0196                  ; 6127   0240 0196
        SLL     R0,     1                       ; 6129   0048
        ADDI    #$0006, R0                      ; 612A   02F8 0006
        MVO     R0,     .PSG0.chn_c_vol         ; 612C   0240 01FD
        B       L_6169                          ; 612E   0200 0039

L_6130:
        MVO     R0,     G_0196                  ; 6130   0240 0196
        MVII    #$0040, R0                      ; 6132   02B8 0040
        SUB     G_02F0, R0                      ; 6134   0300 02F0
        BMI     L_613F                          ; 6136   020B 0007

        SLL     R0,     2                       ; 6138   004C
        ADDI    #$0100, R0                      ; 6139   02F8 0100
        MVII    #$000C, R1                      ; 613B   02B9 000C
        B       L_6161                          ; 613D   0200 0022

L_613F:
        MVII    #$0200, R0                      ; 613F   02B8 0200
        MVI     G_02F0, R2                      ; 6141   0282 02F0
        SDBD                                    ; 6143   0001
        CMPI    #$0540, R2                      ; 6144   037A 0040 0005
        BPL     L_6160                          ; 6147   0203 0017

        MVII    #$000C, R1                      ; 6149   02B9 000C
        MVI     .PSG0.chn_c_hi,R0               ; 614B   0280 01F6
        SWAP    R0,     1                       ; 614D   0040
        ADD     .PSG0.chn_c_lo,R0               ; 614E   02C0 01F2
        SDBD                                    ; 6150   0001
        ANDI    #$0FFF, R0                      ; 6151   03B8 00FF 000F
        SUBI    #$0010, R0                      ; 6154   0338 0010
        CMPI    #$0080, R0                      ; 6156   0378 0080
        BPL     L_615C                          ; 6158   0203 0002

        MVII    #$0200, R0                      ; 615A   02B8 0200
L_615C:
        CMPI    #$0100, R0                      ; 615C   0378 0100
        BPL     L_6161                          ; 615E   0203 0001

L_6160:
        CLRR    R1                              ; 6160   01C9
L_6161:
        MVO     R0,     .PSG0.chn_c_lo          ; 6161   0240 01F2
        SWAP    R0,     1                       ; 6163   0040
        NOP                                     ; 6164   0034
        MVO     R0,     .PSG0.chn_c_hi          ; 6165   0240 01F6
        MVO     R1,     .PSG0.chn_c_vol         ; 6167   0241 01FD
L_6169:
        MVI     G_0198, R0                      ; 6169   0280 0198
        DECR    R0                              ; 616B   0010
        BMI     L_6191                          ; 616C   020B 0023

        MVO     R0,     G_0198                  ; 616E   0240 0198
        BEQ     L_6189                          ; 6170   0204 0017

        SLR     R0,     2                       ; 6172   0064

        JSR     R4,     L_617C                  ; 6173   0004 0060 017C

        ADDR    R2,     R6                      ; 6176   00D6
        ADDR    R2,     R6                      ; 6177   00D6
        ADDR    R2,     R6                      ; 6178   00D6
        SUBR    R3,     R5                      ; 6179   011D
        CMPR    R2,     R3                      ; 617A   0153
        ANDR    R5,     R4                      ; 617B   01AC
L_617C:
        ADDR    R0,     R4                      ; 617C   00C4
        MVI@    R4,     R0                      ; 617D   02A0
        MVO     R0,     .PSG0.chn_b_lo          ; 617E   0240 01F1
        SWAP    R0,     1                       ; 6180   0040
        MVO     R0,     .PSG0.chn_b_hi          ; 6181   0240 01F5
        MVII    #$000D, R0                      ; 6183   02B8 000D
        MVO     R0,     .PSG0.chn_b_vol         ; 6185   0240 01FC
        B       L_61AB                          ; 6187   0200 0022

L_6189:
        MVO     R0,     .PSG0.chn_b_vol         ; 6189   0240 01FC
        MVII    #$0043, R0                      ; 618B   02B8 0043
        MVO     R0,     G_0197                  ; 618D   0240 0197
        B       L_61AB                          ; 618F   0200 001A

L_6191:
        MVI     G_0197, R0                      ; 6191   0280 0197
        CMPI    #$0043, R0                      ; 6193   0378 0043
        BPL     L_619B                          ; 6195   0203 0004

        ADDI    #$0003, R0                      ; 6197   02F8 0003
        MVO     R0,     G_0197                  ; 6199   0240 0197
L_619B:
        SLL     R0,     2                       ; 619B   004C
        SLL     R0,     2                       ; 619C   004C
        MVO     R0,     .PSG0.chn_b_lo          ; 619D   0240 01F1
        MOVR    R0,     R1                      ; 619F   0081
        SWAP    R1,     1                       ; 61A0   0041
        MVO     R1,     .PSG0.chn_b_hi          ; 61A1   0241 01F5
        NEGR    R0                              ; 61A3   0020
        SARC    R0,     2                       ; 61A4   007C
        SARC    R0,     2                       ; 61A5   007C
        SARC    R0,     2                       ; 61A6   007C
        ADDI    #$0011, R0                      ; 61A7   02F8 0011
        MVO     R0,     .PSG0.chn_b_vol         ; 61A9   0240 01FC
L_61AB:
        MVI     G_0192, R0                      ; 61AB   0280 0192
        DECR    R0                              ; 61AD   0010
        BMI     L_61E1                          ; 61AE   020B 0031

        ADD     G_0193, R7                      ; 61B0   02C7 0193
        MOVR    R0,     R1                      ; 61B2   0081
        SLR     R1,     1                       ; 61B3   0061
        CMPI    #$000E, R1                      ; 61B4   0379 000E
        BMI     L_61BA                          ; 61B6   020B 0002

        MVII    #$000E, R1                      ; 61B8   02B9 000E
L_61BA:
        CLRR    R2                              ; 61BA   01D2
        MVI     G_031E, R3                      ; 61BB   0283 031E
        SLR     R3,     2                       ; 61BD   0067
        ANDI    #$0007, R3                      ; 61BE   03BB 0007
        ADDI    #$0007, R3                      ; 61C0   02FB 0007
        B       L_61CC                          ; 61C2   0200 0008

        MOVR    R0,     R1                      ; 61C4   0081
        SLR     R1,     2                       ; 61C5   0065
        SLR     R1,     1                       ; 61C6   0061
        ADDI    #$0008, R1                      ; 61C7   02F9 0008
        CLRR    R2                              ; 61C9   01D2
        MVII    #$000D, R3                      ; 61CA   02BB 000D
L_61CC:
        CMPI    #$0007, R1                      ; 61CC   0379 0007
        BMI     L_61DE                          ; 61CE   020B 000E

        MVO     R0,     G_0192                  ; 61D0   0240 0192
        MVO     R1,     .PSG0.chn_a_vol         ; 61D2   0241 01FB
        MVII    #$0030, R0                      ; 61D4   02B8 0030
        MVO     R0,     .PSG0.chan_enable       ; 61D6   0240 01F8
        MVO     R2,     .PSG0.noise             ; 61D8   0242 01F9
        MVO     R3,     .PSG0.chn_a_hi          ; 61DA   0243 01F4
        B       L_61FB                          ; 61DC   0200 001D

L_61DE:
        CLRR    R0                              ; 61DE   01C0
        MVO     R0,     G_0192                  ; 61DF   0240 0192
L_61E1:
        MVII    #$0031, R0                      ; 61E1   02B8 0031
        MVO     R0,     .PSG0.chan_enable       ; 61E3   0240 01F8
        MVI     G_02FB, R0                      ; 61E5   0280 02FB
        NEGR    R0                              ; 61E7   0020
        BEQ     L_61F9                          ; 61E8   0204 000F

        SARC    R0,     2                       ; 61EA   007C
        SARC    R0,     2                       ; 61EB   007C
        ADDI    #$0025, R0                      ; 61EC   02F8 0025
        MVO     R0,     .PSG0.noise             ; 61EE   0240 01F9

        JSR     R4,     L_61F6                  ; 61F0   0004 0060 01F6

        INCR    R0                              ; 61F3   0008
        INCR    R1                              ; 61F4   0009
        SETC                                    ; 61F5   0007
L_61F6:
        ADD     G_0194, R4                      ; 61F6   02C4 0194
        MVI@    R4,     R0                      ; 61F8   02A0
L_61F9:
        MVO     R0,     .PSG0.chn_a_vol         ; 61F9   0240 01FB
L_61FB:
        MOVR    R5,     R7                      ; 61FB   00AF
        INCR    R4                              ; 61FC   000C
        SWAP    R0,     1                       ; 61FD   0040
        CLRC                                    ; 61FE   0006
        EIS                                     ; 61FF   0002
        INCR    R4                              ; 6200   000C
        SWAP    R0,     1                       ; 6201   0040
        CLRC                                    ; 6202   0006
        EIS                                     ; 6203   0002
        INCR    R4                              ; 6204   000C
        SWAP    R0,     1                       ; 6205   0040
        CLRC                                    ; 6206   0006
        EIS                                     ; 6207   0002
        DECR    R0                              ; 6208   0010
        DECR    R0                              ; 6209   0010
        INCR    R4                              ; 620A   000C
        EIS                                     ; 620B   0002
L_620C:
        RSWD    R4                              ; 620C   003C
        COMR    R0                              ; 620D   0018
        INCR    R4                              ; 620E   000C
        DIS                                     ; 620F   0003

        JSR     R4,     G_0405                  ; 6210   0004 0004 0005
        DECLE   $0001                           ; 6213   0001

        ADCR    R4                              ; 6214   002C
        ADCR    R4                              ; 6215   002C
        INCR    R2                              ; 6216   000A

        JSR     R4,     .GROM.014               ; 6217   0004 0030 0014

        DIS                                     ; 621A   0003
        DECLE   $0000                           ; 621B   0000

        GSWD    R0                              ; 621C   0030
        ADCR    R0                              ; 621D   0028
        DECLE   $0000,  $0001                   ; 621E   0000 0001

        INCR    R0                              ; 6220   0008
        INCR    R0                              ; 6221   0008
        SETC                                    ; 6222   0007
        DIS                                     ; 6223   0003
        COMR    R4                              ; 6224   001C
        COMR    R4                              ; 6225   001C
        DECLE   $0001,  $0000                   ; 6226   0001 0000

        NEGR    R4                              ; 6228   0024
        NEGR    R4                              ; 6229   0024
        INCR    R1                              ; 622A   0009

        JSR     R4,     .GRAM.038               ; 622B   0004 0038 0038

        DIS                                     ; 622E   0003
        DECLE   $0001                           ; 622F   0001

        RSWD    R4                              ; 6230   003C
        COMR    R0                              ; 6231   0018
        INCR    R4                              ; 6232   000C
        DIS                                     ; 6233   0003
        DECR    R4                              ; 6234   0014
        DECR    R4                              ; 6235   0014

        JSRE    R4,     G_0034                  ; 6236   0004 0001 0034

        NOP                                     ; 6239   0034
        INCR    R5                              ; 623A   000D
        DIS                                     ; 623B   0003
        NEGR    R0                              ; 623C   0020
        NEGR    R0                              ; 623D   0020
        DECLE   $0000                           ; 623E   0000

        EIS                                     ; 623F   0002
        ADDR    R6,     R0                      ; 6240   00F0
        ADDR    R6,     R0                      ; 6241   00F0
        ADDR    R6,     R0                      ; 6242   00F0
        ADDR    R6,     R0                      ; 6243   00F0
        ADDR    R6,     R0                      ; 6244   00F0
        ADDR    R6,     R0                      ; 6245   00F0
        ADDR    R6,     R0                      ; 6246   00F0
        ADDR    R6,     R0                      ; 6247   00F0
        ADDR    R6,     R0                      ; 6248   00F0
        ADDR    R6,     R0                      ; 6249   00F0
        ADDR    R6,     R0                      ; 624A   00F0
        ADDR    R6,     R0                      ; 624B   00F0
        ADDR    R7,     R0                      ; 624C   00F8
        ADDR    R7,     R0                      ; 624D   00F8
        ADDR    R7,     R0                      ; 624E   00F8
        ADDR    R7,     R0                      ; 624F   00F8
        ADDR    R6,     R0                      ; 6250   00F0
        ADDR    R6,     R0                      ; 6251   00F0
        ADDR    R6,     R0                      ; 6252   00F0
        ADDR    R6,     R0                      ; 6253   00F0
        ADDR    R4,     R0                      ; 6254   00E0
        ADDR    R4,     R0                      ; 6255   00E0
        ADDR    R4,     R0                      ; 6256   00E0
        ADDR    R4,     R0                      ; 6257   00E0
        ADDR    R7,     R0                      ; 6258   00F8
        ADDR    R7,     R0                      ; 6259   00F8
        ADDR    R7,     R0                      ; 625A   00F8
        ADDR    R7,     R0                      ; 625B   00F8
        ADDR    R6,     R0                      ; 625C   00F0
        ADDR    R6,     R0                      ; 625D   00F0
        ADDR    R6,     R0                      ; 625E   00F0
        ADDR    R6,     R0                      ; 625F   00F0
        ADDR    R7,     R7                      ; 6260   00FF
        ADDR    R7,     R7                      ; 6261   00FF
        ADDR    R7,     R6                      ; 6262   00FE
        ADDR    R7,     R6                      ; 6263   00FE
        ADDR    R7,     R6                      ; 6264   00FE
        ADDR    R7,     R4                      ; 6265   00FC
        ADDR    R7,     R4                      ; 6266   00FC
        ADDR    R7,     R4                      ; 6267   00FC
        ADDR    R7,     R4                      ; 6268   00FC
        ADDR    R7,     R4                      ; 6269   00FC
        ADDR    R7,     R4                      ; 626A   00FC
        ADDR    R7,     R6                      ; 626B   00FE
        ADDR    R7,     R6                      ; 626C   00FE
        ADDR    R7,     R6                      ; 626D   00FE
        ADDR    R7,     R7                      ; 626E   00FF
        ADDR    R7,     R7                      ; 626F   00FF
        ADDR    R7,     R6                      ; 6270   00FE
        ADDR    R7,     R0                      ; 6271   00F8
        ADDR    R6,     R0                      ; 6272   00F0
        ADDR    R4,     R0                      ; 6273   00E0
        ADDR    R0,     R0                      ; 6274   00C0
        ADDR    R0,     R0                      ; 6275   00C0
        TSTR    R0                              ; 6276   0080
        TSTR    R0                              ; 6277   0080
        TSTR    R0                              ; 6278   0080
        TSTR    R0                              ; 6279   0080
        ADDR    R0,     R0                      ; 627A   00C0
        ADDR    R0,     R0                      ; 627B   00C0
        ADDR    R4,     R0                      ; 627C   00E0
        ADDR    R6,     R0                      ; 627D   00F0
        ADDR    R7,     R0                      ; 627E   00F8
        ADDR    R7,     R6                      ; 627F   00FE
        DECLE   $0000,  $0000                   ; 6280   0000 0000

        TSTR    R0                              ; 6282   0080
        TSTR    R0                              ; 6283   0080
        TSTR    R0                              ; 6284   0080
        ADDR    R0,     R0                      ; 6285   00C0
        ADDR    R0,     R0                      ; 6286   00C0
        ADDR    R0,     R0                      ; 6287   00C0
        ADDR    R0,     R0                      ; 6288   00C0
        ADDR    R0,     R0                      ; 6289   00C0
        ADDR    R0,     R0                      ; 628A   00C0
        TSTR    R0                              ; 628B   0080
        TSTR    R0                              ; 628C   0080
        TSTR    R0                              ; 628D   0080
        DECLE   $0000,  $0000                   ; 628E   0000 0000

        TSTR    R0                              ; 6290   0080
        ADDR    R4,     R0                      ; 6291   00E0
        ADDR    R6,     R0                      ; 6292   00F0
        ADDR    R7,     R0                      ; 6293   00F8
        ADDR    R7,     R4                      ; 6294   00FC
        ADDR    R7,     R4                      ; 6295   00FC
        ADDR    R7,     R6                      ; 6296   00FE
        ADDR    R7,     R6                      ; 6297   00FE
        ADDR    R7,     R6                      ; 6298   00FE
        ADDR    R7,     R6                      ; 6299   00FE
        ADDR    R7,     R4                      ; 629A   00FC
        ADDR    R7,     R4                      ; 629B   00FC
        ADDR    R7,     R0                      ; 629C   00F8
        ADDR    R6,     R0                      ; 629D   00F0
        ADDR    R4,     R0                      ; 629E   00E0
        TSTR    R0                              ; 629F   0080
        ADDR    R7,     R0                      ; 62A0   00F8
        ADDR    R7,     R0                      ; 62A1   00F8
        ADDR    R7,     R4                      ; 62A2   00FC
        ADDR    R7,     R4                      ; 62A3   00FC
        ADDR    R7,     R6                      ; 62A4   00FE
        ADDR    R7,     R6                      ; 62A5   00FE
        ADDR    R7,     R7                      ; 62A6   00FF
        ADDR    R7,     R7                      ; 62A7   00FF
        ADDR    R7,     R7                      ; 62A8   00FF
        ADDR    R7,     R7                      ; 62A9   00FF
        ADDR    R7,     R6                      ; 62AA   00FE
        ADDR    R7,     R6                      ; 62AB   00FE
        ADDR    R7,     R4                      ; 62AC   00FC
        ADDR    R7,     R4                      ; 62AD   00FC
        ADDR    R7,     R0                      ; 62AE   00F8
        ADDR    R7,     R0                      ; 62AF   00F8
        TSTR    R0                              ; 62B0   0080
        TSTR    R0                              ; 62B1   0080
        ADDR    R0,     R0                      ; 62B2   00C0
        ADDR    R0,     R0                      ; 62B3   00C0
        ADDR    R4,     R0                      ; 62B4   00E0
        ADDR    R4,     R0                      ; 62B5   00E0
        ADDR    R6,     R0                      ; 62B6   00F0
        ADDR    R6,     R0                      ; 62B7   00F0
        ADDR    R6,     R0                      ; 62B8   00F0
        ADDR    R6,     R0                      ; 62B9   00F0
        ADDR    R4,     R0                      ; 62BA   00E0
        ADDR    R4,     R0                      ; 62BB   00E0
        ADDR    R0,     R0                      ; 62BC   00C0
        ADDR    R0,     R0                      ; 62BD   00C0
        TSTR    R0                              ; 62BE   0080
        TSTR    R0                              ; 62BF   0080
        ADDR    R4,     R0                      ; 62C0   00E0
        ADDR    R4,     R0                      ; 62C1   00E0
        ADDR    R4,     R0                      ; 62C2   00E0
        ADDR    R4,     R0                      ; 62C3   00E0
        ADDR    R6,     R0                      ; 62C4   00F0
        ADDR    R6,     R0                      ; 62C5   00F0
        ADDR    R6,     R0                      ; 62C6   00F0
        ADDR    R6,     R0                      ; 62C7   00F0
        TSTR    R0                              ; 62C8   0080
        ADDR    R0,     R6                      ; 62C9   00C6
        ADDR    R7,     R7                      ; 62CA   00FF
        SLL     R3,     2                       ; 62CB   004F
        RSWD    R0                              ; 62CC   0038
        GSWD    R0                              ; 62CD   0030
        DECLE   $0000,  $0000,  $0000           ; 62CE   0000 0000 0000

        DECR    R0                              ; 62D1   0010
        DECR    R0                              ; 62D2   0010
        DECR    R0                              ; 62D3   0010
        GSWD    R0                              ; 62D4   0030
        SARC    R0,     1                       ; 62D5   0078
        SETC                                    ; 62D6   0007
        EIS                                     ; 62D7   0002
        ADDR    R7,     R4                      ; 62D8   00FC
        SARC    R0,     2                       ; 62D9   007C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62DA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 62DE   0000 0000

        ADDR    R7,     R7                      ; 62E0   00FF
        ADDR    R7,     R7                      ; 62E1   00FF
        ADDR    R4,     R0                      ; 62E2   00E0
        TSTR    R0                              ; 62E3   0080
        DECLE   $0000,  $0000                   ; 62E4   0000 0000

        TSTR    R0                              ; 62E6   0080
        SLR     R0,     1                       ; 62E7   0060
        COMR    R7                              ; 62E8   001F
        SLR     R0,     1                       ; 62E9   0060
        SLL     R2,     1                       ; 62EA   004A
        SAR     R2,     1                       ; 62EB   006A
        SLL     R2,     1                       ; 62EC   004A
        SLL     R2,     1                       ; 62ED   004A
        MOVR    R1,     R6                      ; 62EE   008E
        ADDR    R4,     R0                      ; 62EF   00E0
        ADDR    R7,     R7                      ; 62F0   00FF
        ADDR    R7,     R7                      ; 62F1   00FF
        SETC                                    ; 62F2   0007
        DECLE   $0001,  $0000,  $0000,  $0001   ; 62F3   0001 0000 0000 0001

        CLRC                                    ; 62F7   0006
L_62F8:
        ADDR    R7,     R0                      ; 62F8   00F8

        JSR     R4,     G_7444                  ; 62F9   0004 0074 0044

        SLR     R2,     2                       ; 62FC   0066
        SWAP    R0,     2                       ; 62FD   0044
        RRC     R1,     1                       ; 62FE   0071
        SETC                                    ; 62FF   0007
        ADDR    R6,     R4                      ; 6300   00F4
        MOVR    R3,     R1                      ; 6301   0099
        ADDR    R0,     R6                      ; 6302   00C6
        MOVR    R7,     R0                      ; 6303   00B8
        SWAP    R0,     1                       ; 6304   0040
        GSWD    R1                              ; 6305   0031
        NEGR    R6                              ; 6306   0026
        ADDR    R7,     R4                      ; 6307   00FC
        DECLE   $0000,  $0001                   ; 6308   0000 0001

        EIS                                     ; 630A   0002
        DECLE   $0005                           ; 630B   0005

        INCR    R2                              ; 630C   000A
        DECR    R4                              ; 630D   0014
        ADDR    R5,     R0                      ; 630E   00E8
        ADDR    R7,     R7                      ; 630F   00FF
        ADDR    R7,     R7                      ; 6310   00FF
        MOVR    R0,     R1                      ; 6311   0081
        ADDR    R7,     R7                      ; 6312   00FF
        MOVR    R0,     R1                      ; 6313   0081
        SWAP    R2,     1                       ; 6314   0042
L_6315:
        NEGR    R4                              ; 6315   0024
        COMR    R0                              ; 6316   0018
        ADDR    R7,     R7                      ; 6317   00FF
        DECLE   $0000                           ; 6318   0000

        TSTR    R0                              ; 6319   0080
        SWAP    R0,     1                       ; 631A   0040
        MOVR    R4,     R0                      ; 631B   00A0
        RLC     R0,     1                       ; 631C   0050
        ADCR    R0                              ; 631D   0028
        DECR    R7                              ; 631E   0017
        ADDR    R7,     R7                      ; 631F   00FF
        DECR    R0                              ; 6320   0010
        DECR    R0                              ; 6321   0010
        DECR    R0                              ; 6322   0010
        DECR    R0                              ; 6323   0010
        RSWD    R0                              ; 6324   0038
        RSWD    R0                              ; 6325   0038
        SARC    R0,     2                       ; 6326   007C
        SARC    R0,     2                       ; 6327   007C
        ADDR    R7,     R6                      ; 6328   00FE
        ADDR    R2,     R6                      ; 6329   00D6
        TSTR    R2                              ; 632A   0092
        DECR    R0                              ; 632B   0010
        RSWD    R0                              ; 632C   0038
        SARC    R0,     2                       ; 632D   007C
        RLC     R0,     2                       ; 632E   0054
        DECLE   $0000                           ; 632F   0000

        DECR    R0                              ; 6330   0010
        DECR    R0                              ; 6331   0010
        DECR    R0                              ; 6332   0010
        DECR    R0                              ; 6333   0010
        GSWD    R0                              ; 6334   0030
        RSWD    R0                              ; 6335   0038
        SARC    R0,     1                       ; 6336   0078
        SARC    R0,     2                       ; 6337   007C
        SARC    R0,     2                       ; 6338   007C
        SLLC    R0,     2                       ; 6339   005C
        DECR    R4                              ; 633A   0014
        DECR    R0                              ; 633B   0010
        DECR    R0                              ; 633C   0010
        GSWD    R0                              ; 633D   0030
        RSWD    R0                              ; 633E   0038
        INCR    R0                              ; 633F   0008
        DECLE   $0000,  $0000,  $0000           ; 6340   0000 0000 0000

        SARC    R0,     1                       ; 6343   0078
        INCR    R0                              ; 6344   0008
        MOVR    R3,     R6                      ; 6345   009E
        ADDR    R7,     R7                      ; 6346   00FF
        ADDR    R7,     R7                      ; 6347   00FF
        MOVR    R3,     R6                      ; 6348   009E

        JSRD    R4,     G_0C00                  ; 6349   0004 000E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 634C   0000 0000 0000 0000

        ADDR    R7,     R7                      ; 6350   00FF
        ADDR    R7,     R7                      ; 6351   00FF
        ADDR    R7,     R7                      ; 6352   00FF
        ADDR    R7,     R7                      ; 6353   00FF
        ADDR    R7,     R7                      ; 6354   00FF
        ADDR    R7,     R7                      ; 6355   00FF
        ADDR    R7,     R7                      ; 6356   00FF
        ADDR    R7,     R7                      ; 6357   00FF
        ADDR    R7,     R7                      ; 6358   00FF
        ADDR    R7,     R7                      ; 6359   00FF
        MOVR    R3,     R7                      ; 635A   009F
        SAR     R3,     2                       ; 635B   006F
        SARC    R0,     2                       ; 635C   007C
        SLL     R3,     1                       ; 635D   004B
        SAR     R3,     1                       ; 635E   006B
        MOVR    R3,     R4                      ; 635F   009C
        ADDR    R7,     R7                      ; 6360   00FF
        ADDR    R7,     R7                      ; 6361   00FF
        ADDR    R3,     R7                      ; 6362   00DF
        ADDR    R3,     R7                      ; 6363   00DF
        ADDR    R3,     R7                      ; 6364   00DF
        SLLC    R3,     2                       ; 6365   005F
        SARC    R3,     2                       ; 6366   007F
        ADDR    R3,     R7                      ; 6367   00DF
        INCR    R0                              ; 6368   0008
        COMR    R0                              ; 6369   0018
        INCR    R4                              ; 636A   000C
        INCR    R0                              ; 636B   0008
        INCR    R0                              ; 636C   0008
        DECLE   $0000                           ; 636D   0000

        ADDR    R7,     R7                      ; 636E   00FF
        ADDR    R7,     R7                      ; 636F   00FF
        EIS                                     ; 6370   0002
        CLRC                                    ; 6371   0006
        SETC                                    ; 6372   0007
        NEGR    R2                              ; 6373   0022
        GSWD    R0                              ; 6374   0030
        RRC     R0,     1                       ; 6375   0070
        ADDR    R7,     R0                      ; 6376   00F8
        NEGR    R0                              ; 6377   0020

        JSR     R4,     G_0C0E                  ; 6378   0004 000C 000E

        COMR    R7                              ; 637B   001F
        SWAP    R0,     2                       ; 637C   0044
        SLR     R0,     1                       ; 637D   0060
        ADDR    R4,     R0                      ; 637E   00E0
        SWAP    R0,     1                       ; 637F   0040
        DECLE   $0000,  $0000,  $0000           ; 6380   0000 0000 0000

        NEGR    R0                              ; 6383   0020
        GSWD    R0                              ; 6384   0030
        RRC     R0,     1                       ; 6385   0070
        ADDR    R7,     R0                      ; 6386   00F8
        NEGR    R0                              ; 6387   0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6388   0000 0000 0000 0000

        SWAP    R0,     1                       ; 638C   0040
        SLR     R0,     1                       ; 638D   0060
        ADDR    R4,     R0                      ; 638E   00E0
        SWAP    R0,     1                       ; 638F   0040
        INCR    R0                              ; 6390   0008
        INCR    R2                              ; 6391   000A
        INCR    R2                              ; 6392   000A
        INCR    R2                              ; 6393   000A
        INCR    R0                              ; 6394   0008
        INCR    R5                              ; 6395   000D
        INCR    R1                              ; 6396   0009
        INCR    R5                              ; 6397   000D
        INCR    R5                              ; 6398   000D
        INCR    R0                              ; 6399   0008
        INCR    R0                              ; 639A   0008
        INCR    R6                              ; 639B   000E
        INCR    R0                              ; 639C   0008
        INCR    R3                              ; 639D   000B
        INCR    R0                              ; 639E   0008
        INCR    R0                              ; 639F   0008
        INCR    R6                              ; 63A0   000E
        INCR    R4                              ; 63A1   000C
        INCR    R6                              ; 63A2   000E
        INCR    R0                              ; 63A3   0008
        INCR    R2                              ; 63A4   000A
        INCR    R2                              ; 63A5   000A
        INCR    R0                              ; 63A6   0008
        INCR    R6                              ; 63A7   000E
        INCR    R6                              ; 63A8   000E
        INCR    R0                              ; 63A9   0008
        INCR    R3                              ; 63AA   000B
        INCR    R0                              ; 63AB   0008
        INCR    R6                              ; 63AC   000E
        INCR    R0                              ; 63AD   0008
        INCR    R0                              ; 63AE   0008
        INCR    R3                              ; 63AF   000B
        INCR    R0                              ; 63B0   0008
        INCR    R2                              ; 63B1   000A
        INCR    R0                              ; 63B2   0008
        INCR    R0                              ; 63B3   0008
        INCR    R6                              ; 63B4   000E
        INCR    R5                              ; 63B5   000D
        INCR    R5                              ; 63B6   000D
        INCR    R5                              ; 63B7   000D
        INCR    R0                              ; 63B8   0008
        INCR    R2                              ; 63B9   000A
        INCR    R0                              ; 63BA   0008
        INCR    R2                              ; 63BB   000A
        INCR    R0                              ; 63BC   0008
        INCR    R0                              ; 63BD   0008
        INCR    R2                              ; 63BE   000A
        INCR    R0                              ; 63BF   0008
        INCR    R6                              ; 63C0   000E
        INCR    R0                              ; 63C1   0008
        INCR    R7                              ; 63C2   000F
        INCR    R7                              ; 63C3   000F
L_63C4:
        INCR    R7                              ; 63C4   000F
        INCR    R7                              ; 63C5   000F
        INCR    R7                              ; 63C6   000F
        DECR    R0                              ; 63C7   0010
        DECR    R0                              ; 63C8   0010
        RSWD    R0                              ; 63C9   0038
        SARC    R0,     2                       ; 63CA   007C
        ADDR    R7,     R6                      ; 63CB   00FE
        DECR    R0                              ; 63CC   0010
        RSWD    R4                              ; 63CD   003C
        DECLE   $0000                           ; 63CE   0000

        DECR    R0                              ; 63CF   0010
        DECR    R0                              ; 63D0   0010
        GSWD    R0                              ; 63D1   0030
        SARC    R0,     1                       ; 63D2   0078
        SARC    R0,     2                       ; 63D3   007C
        DECR    R0                              ; 63D4   0010
        GSWD    R0                              ; 63D5   0030
        INCR    R0                              ; 63D6   0008
        INCR    R0                              ; 63D7   0008
        INCR    R0                              ; 63D8   0008
        INCR    R4                              ; 63D9   000C
        COMR    R6                              ; 63DA   001E
        RSWD    R6                              ; 63DB   003E
        INCR    R0                              ; 63DC   0008
        INCR    R4                              ; 63DD   000C
        DECR    R0                              ; 63DE   0010
        DECLE   $0000,  $0000                   ; 63DF   0000 0000

        RSWD    R1                              ; 63E1   0039
        DECR    R7                              ; 63E2   0017
        RSWD    R2                              ; 63E3   003A
        DECR    R7                              ; 63E4   0017
        RSWD    R2                              ; 63E5   003A
        SETC                                    ; 63E6   0007
        ADDR    R5,     R2                      ; 63E7   00EA
        CLRC                                    ; 63E8   0006
        ADDR    R5,     R2                      ; 63E9   00EA
        DECR    R6                              ; 63EA   0016
        ADDR    R5,     R6                      ; 63EB   00EE
        CLRC                                    ; 63EC   0006
        ADDR    R4,     R6                      ; 63ED   00E6
        CLRC                                    ; 63EE   0006
        ADDR    R2,     R2                      ; 63EF   00D2
        DECR    R7                              ; 63F0   0017
        ADDR    R2,     R2                      ; 63F1   00D2
        SETC                                    ; 63F2   0007
        DECLE   $0000,  $0000                   ; 63F3   0000 0000

        ADDR    R5,     R5                      ; 63F5   00ED
        CLRC                                    ; 63F6   0006
        ADDR    R5,     R2                      ; 63F7   00EA
        CLRC                                    ; 63F8   0006
        ADDR    R4,     R2                      ; 63F9   00E2
        CLRC                                    ; 63FA   0006
        ADDR    R4,     R2                      ; 63FB   00E2
        CLRC                                    ; 63FC   0006
        ADDR    R2,     R6                      ; 63FD   00D6
        SETC                                    ; 63FE   0007
        ADDR    R2,     R2                      ; 63FF   00D2
        SETC                                    ; 6400   0007
        ADDR    R2,     R0                      ; 6401   00D0
        SETC                                    ; 6402   0007
        DECLE   $0000,  $0000,  $0000,  $0005   ; 6403   0000 0000 0000 0005
        DECLE   $0000,  $0000                   ; 6407   0000 0000

        INCR    R1                              ; 6409   0009
        DECLE   $0001,  $0000                   ; 640A   0001 0000

        CLRC                                    ; 640C   0006
        DECLE   $0000                           ; 640D   0000

        CLRC                                    ; 640E   0006
        INCR    R2                              ; 640F   000A
        INCR    R2                              ; 6410   000A
        INCR    R0                              ; 6411   0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6412   0000 0000 0000 0000
        DECLE   $0005,  $0000,  $0000           ; 6416   0005 0000 0000

        INCR    R1                              ; 6419   0009
        DECLE   $0001,  $0000                   ; 641A   0001 0000

        EIS                                     ; 641C   0002
        DECLE   $0000                           ; 641D   0000

        JSR     R4,     G_0802                  ; 641E   0004 0008 0002

        INCR    R0                              ; 6421   0008
        DECLE   $0000                           ; 6422   0000

        DIS                                     ; 6423   0003
        INCR    R1                              ; 6424   0009
        DECLE   $0000,  $0000,  $0005           ; 6425   0000 0000 0005

        CLRC                                    ; 6428   0006
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6429   0000 0000 0000 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 642D   0000 0000 0000 0000

        INCR    R1                              ; 6431   0009
        DECLE   $0001                           ; 6432   0001

        NEGR    R4                              ; 6433   0024
        INCR    R4                              ; 6434   000C

        JSRE    R4,     G_0402                  ; 6435   0004 0005 0002
        JSR     R4,     .STIC.X.5               ; 6438   0004 0000 0005

        SARC    R3,     1                       ; 643B   007B
        MOVR    R1,     R0                      ; 643C   0088

        JSR     R4,     .STIC.X.7               ; 643D   0004 0000 0007

        CLRC                                    ; 6440   0006
        GSWD    R0                              ; 6441   0030
        NOP                                     ; 6442   0034

        JSRD    R4,     G_0401                  ; 6443   0004 0006 0001
        JSRD    R4,     .STIC.X.0               ; 6446   0004 0002 0000

        ADCR    R2                              ; 6449   002A
        MOVR    R6,     R0                      ; 644A   00B0
        DECR    R3                              ; 644B   0013
        DECLE   $0000                           ; 644C   0000

        INCR    R0                              ; 644D   0008
        INCR    R3                              ; 644E   000B
        COMR    R0                              ; 644F   0018
        INCR    R0                              ; 6450   0008
        EIS                                     ; 6451   0002

        JSRE    R4,     G_040F                  ; 6452   0004 0005 000F
        DECLE   $0005,  $0000                   ; 6455   0005 0000

        SAR     R0,     2                       ; 6457   006C
        ADDR    R7,     R7                      ; 6458   00FF
        GSWD    R1                              ; 6459   0031
        DECLE   $0000                           ; 645A   0000
L_645B:
        PSHR    R5                              ; 645B   0275
        MVI     G_019F, R1                      ; 645C   0281 019F
        INCR    R1                              ; 645E   0009
        MVO     R1,     G_019F                  ; 645F   0241 019F
        CMPI    #$0009, R1                      ; 6461   0379 0009
        BPL     L_6860                          ; 6463   0203 03FB

        ADDR    R7,     R1                      ; 6465   00F9
        ADDI    #$0002, R1                      ; 6466   02F9 0002
        ADD@    R1,     R7                      ; 6468   02CF
        XOR@    R6,     R7                      ; 6469   03F7
        ADDR    R1,     R4                      ; 646A   00CC
        ADDR    R6,     R4                      ; 646B   00F4
        ADDR    R7,     R3                      ; 646C   00FB
        CMPR    R3,     R0                      ; 646D   0158
        ANDR    R6,     R5                      ; 646E   01B5
        XOR@    R6,     R0                      ; 646F   03F0
        INCR    R0                              ; 6470   0008
        MVI     G_0324, R0                      ; 6471   0280 0324
        TSTR    R0                              ; 6473   0080
        BMI     L_6533                          ; 6474   020B 00BD

        SLR     R0,     2                       ; 6476   0064
        CMPI    #$0005, R0                      ; 6477   0378 0005
        BMI     L_647D                          ; 6479   020B 0002

        MVII    #$0004, R0                      ; 647B   02B8 0004
L_647D:
        MVII    #$001E, R1                      ; 647D   02B9 001E
L_647F:
        SLR     R1,     1                       ; 647F   0061
        DECR    R0                              ; 6480   0010
        BPL     L_647F                          ; 6481   0223 0003

        MVI     G_019A, R0                      ; 6483   0280 019A
        INCR    R0                              ; 6485   0008
        ANDR    R1,     R0                      ; 6486   0188
        BNEQ    L_6533                          ; 6487   020C 00AA

        MVI     G_01D5, R0                      ; 6489   0280 01D5
        SUB     G_01D6, R0                      ; 648B   0300 01D6
        BPL     L_6490                          ; 648D   0203 0001

        NEGR    R0                              ; 648F   0020
L_6490:
        MVI     G_01D9, R1                      ; 6490   0281 01D9
        DECR    R1                              ; 6492   0011
        SLL     R1,     1                       ; 6493   0049
        CMPR    R0,     R1                      ; 6494   0141
        BMI     L_6533                          ; 6495   020B 009C

        MVI     G_01DB, R1                      ; 6497   0281 01DB
        MVII    #$0001, R0                      ; 6499   02B8 0001
        MVII    #$0002, R2                      ; 649B   02BA 0002
        MVI     G_0324, R3                      ; 649D   0283 0324
        CMPI    #$0013, R3                      ; 649F   037B 0013
        BMI     L_64A5                          ; 64A1   020B 0002

        MVII    #$0004, R2                      ; 64A3   02BA 0004
L_64A5:
        CMPR    R2,     R1                      ; 64A5   0151
        BMI     L_64C0                          ; 64A6   020B 0018

        NEGR    R0                              ; 64A8   0020
        CMPI    #$0013, R3                      ; 64A9   037B 0013
        BPL     L_64B1                          ; 64AB   0203 0004

        CMPI    #$0005, R1                      ; 64AD   0379 0005
        BEQ     L_64C0                          ; 64AF   0204 000F

L_64B1:
        CMPI    #$0006, R1                      ; 64B1   0379 0006
        BEQ     L_64C0                          ; 64B3   0204 000B

        JSR     R4,     L_68A8                  ; 64B5   0004 0068 00A8

        ANDI    #$0003, R0                      ; 64B8   03B8 0003
        DECR    R0                              ; 64BA   0010
        BMI     L_64BF                          ; 64BB   020B 0002

        MVII    #$0001, R0                      ; 64BD   02B8 0001
L_64BF:
        NEGR    R0                              ; 64BF   0020
L_64C0:
        MOVR    R0,     R3                      ; 64C0   0083
        ADD     G_01DB, R0                      ; 64C1   02C0 01DB
        MOVR    R0,     R2                      ; 64C3   0082
        ANDI    #$0001, R2                      ; 64C4   03BA 0001
        TSTR    R3                              ; 64C6   009B
        BMI     L_64CB                          ; 64C7   020B 0002

        XORI    #$0001, R2                      ; 64C9   03FA 0001
L_64CB:
        MVII    #$01D5, R1                      ; 64CB   02B9 01D5
        ADDR    R2,     R1                      ; 64CD   00D1
        MVI@    R1,     R1                      ; 64CE   0289
        SLR     R1,     1                       ; 64CF   0061
        ADDI    #$030E, R1                      ; 64D0   02F9 030E
        TSTR    R3                              ; 64D2   009B
        BPL     L_64DD                          ; 64D3   0203 0008

L_64D5:
        CMPI    #$0312, R1                      ; 64D5   0379 0312
        BMI     L_6533                          ; 64D7   020B 005A

        CMPI    #$0315, R1                      ; 64D9   0379 0315
        BPL     L_6533                          ; 64DB   0203 0056

L_64DD:
        PSHR    R1                              ; 64DD   0271
        SUBR    R3,     R1                      ; 64DE   0119
        MVI@    R1,     R0                      ; 64DF   0288
        SDBD                                    ; 64E0   0001
        CMPI    #$8000, R0                      ; 64E1   0378 0000 0080
        BNEQ    L_6501                          ; 64E4   020C 001B

        ADDR    R3,     R1                      ; 64E6   00D9
        MVI@    R1,     R0                      ; 64E7   0288
        SDBD                                    ; 64E8   0001
        CMPI    #$8000, R0                      ; 64E9   0378 0000 0080
        BNEQ    L_6501                          ; 64EC   020C 0013

        ADDR    R3,     R1                      ; 64EE   00D9
        MVI@    R1,     R0                      ; 64EF   0288
        SDBD                                    ; 64F0   0001
        CMPI    #$8000, R0                      ; 64F1   0378 0000 0080
        BNEQ    L_6501                          ; 64F4   020C 000B

        PULR    R1                              ; 64F6   02B1
        ADDI    #$01D5, R2                      ; 64F7   02FA 01D5
        MOVR    R3,     R0                      ; 64F9   0098
        SLL     R0,     1                       ; 64FA   0048
        ADD@    R2,     R0                      ; 64FB   02D0
        MVO@    R0,     R2                      ; 64FC   0250
        SUBI    #$01D5, R2                      ; 64FD   033A 01D5
        B       L_6529                          ; 64FF   0200 0028

L_6501:
        MVII    #$01D9, R1                      ; 6501   02B9 01D9
        ADDR    R2,     R1                      ; 6503   00D1
        MVI@    R1,     R1                      ; 6504   0289
        ADD@    R6,     R1                      ; 6505   02F1
        TSTR    R3                              ; 6506   009B
        BPL     L_6511                          ; 6507   0203 0008

        CMPI    #$0312, R1                      ; 6509   0379 0312
        BMI     L_6533                          ; 650B   020B 0026

        CMPI    #$0315, R1                      ; 650D   0379 0315
        BPL     L_6533                          ; 650F   0203 0022

L_6511:
        ADDR    R3,     R1                      ; 6511   00D9
        MVI@    R1,     R0                      ; 6512   0288
        SDBD                                    ; 6513   0001
        CMPI    #$8000, R0                      ; 6514   0378 0000 0080
        BNEQ    L_6533                          ; 6517   020C 001A

        SUBR    R3,     R1                      ; 6519   0119
        MVI@    R1,     R0                      ; 651A   0288
        SDBD                                    ; 651B   0001
        CMPI    #$8000, R0                      ; 651C   0378 0000 0080
        BNEQ    L_6533                          ; 651F   020C 0012

        SUBR    R3,     R1                      ; 6521   0119
        MVI@    R1,     R0                      ; 6522   0288
        SDBD                                    ; 6523   0001
        CMPI    #$8000, R0                      ; 6524   0378 0000 0080
        BNEQ    L_6533                          ; 6527   020C 000A

L_6529:
        MVI     G_01DB, R0                      ; 6529   0280 01DB
        ADDR    R3,     R0                      ; 652B   00D8
        MVO     R0,     G_01DB                  ; 652C   0240 01DB
        ADDI    #$01D9, R2                      ; 652E   02FA 01D9
        MVI@    R2,     R0                      ; 6530   0290
        SUBR    R3,     R0                      ; 6531   0118
        MVO@    R0,     R2                      ; 6532   0250
L_6533:
        B       L_6860                          ; 6533   0200 032B

        MVII    #$01D5, R4                      ; 6535   02BC 01D5
        MVII    #$01DD, R5                      ; 6537   02BD 01DD
        MVI@    R4,     R0                      ; 6539   02A0
        MVO@    R0,     R5                      ; 653A   0268
        MVI@    R4,     R0                      ; 653B   02A0
        MVO@    R0,     R5                      ; 653C   0268
        MVI@    R4,     R0                      ; 653D   02A0
        MVO@    R0,     R5                      ; 653E   0268
        MVI@    R4,     R0                      ; 653F   02A0
        MVO@    R0,     R5                      ; 6540   0268
        MVI@    R4,     R0                      ; 6541   02A0
        MVO@    R0,     R5                      ; 6542   0268
        MVI@    R4,     R0                      ; 6543   02A0
        MVO@    R0,     R5                      ; 6544   0268
        MVI@    R4,     R0                      ; 6545   02A0
        MVO@    R0,     R5                      ; 6546   0268
        MVI@    R4,     R0                      ; 6547   02A0
        MVO@    R0,     R5                      ; 6548   0268
        MVI     G_031E, R0                      ; 6549   0280 031E
        MVO     R0,     G_0320                  ; 654B   0240 0320
        MVII    #$030C, R4                      ; 654D   02BC 030C
        MVII    #$0008, R3                      ; 654F   02BB 0008
        CLRR    R0                              ; 6551   01C0
L_6552:
        MVO@    R0,     R4                      ; 6552   0260
        MVO@    R0,     R4                      ; 6553   0260
        DECR    R3                              ; 6554   0013
        BNEQ    L_6552                          ; 6555   022C 0004

        CLRR    R1                              ; 6557   01C9

        JSR     R4,     L_68FB                  ; 6558   0004 0068 00FB

        B       L_6860                          ; 655B   0200 0303

        MVII    #$0001, R1                      ; 655D   02B9 0001

        JSR     R4,     L_68FB                  ; 655F   0004 0068 00FB

        B       L_6860                          ; 6562   0200 02FC

        MVII    #$030C, R5                      ; 6564   02BD 030C
        MVII    #$0008, R1                      ; 6566   02B9 0008
L_6568:
        MVI@    R5,     R0                      ; 6568   02A8
        MOVR    R0,     R2                      ; 6569   0082
        RLC     R2,     2                       ; 656A   0056
        BOV     L_6570                          ; 656B   0202 0003

        MOVR    R0,     R2                      ; 656D   0082
        BNEQ    L_658A                          ; 656E   020C 001A

L_6570:
        PSHR    R0                              ; 6570   0270

        JSR     R4,     L_68A8                  ; 6571   0004 0068 00A8

        MOVR    R0,     R3                      ; 6574   0083
        ANDI    #$0008, R0                      ; 6575   03B8 0008
        SDBD                                    ; 6577   0001
        ADDI    #$1906, R0                      ; 6578   02F8 0006 0019
        RRC     R3,     2                       ; 657B   0077
        BESC    L_6582                          ; 657C   020F 0004

        SDBD                                    ; 657E   0001
        MVII    #$4006, R0                      ; 657F   02B8 0006 0040
L_6582:
        PULR    R2                              ; 6582   02B2
        SDBD                                    ; 6583   0001
        ANDI    #$2000, R2                      ; 6584   03BA 0000 0020
        XORR    R2,     R0                      ; 6587   01D0
        B       L_65AF                          ; 6588   0200 0025

L_658A:
        ANDI    #$0007, R2                      ; 658A   03BA 0007
        BEQ     L_65B1                          ; 658C   0204 0023

        MOVR    R0,     R2                      ; 658E   0082
        SDBD                                    ; 658F   0001
        ANDI    #$2007, R2                      ; 6590   03BA 0007 0020
        ANDI    #$01F8, R0                      ; 6593   03B8 01F8
        BEQ     L_65A2                          ; 6595   0204 000B

        SUBI    #$0059, R0                      ; 6597   0338 0059
        BMI     L_65B1                          ; 6599   020B 0016

        CMPI    #$0028, R0                      ; 659B   0378 0028
        BPL     L_65B1                          ; 659D   0203 0012

        INCR    R0                              ; 659F   0008
        SLR     R0,     2                       ; 65A0   0064
        SLR     R0,     1                       ; 65A1   0060

L_65A2:
        JSR     R4,     L_65AB                  ; 65A2   0004 0064 01AB

        MVI@    R2,     R4                      ; 65A5   0294
        BEQ     L_67B4                          ; 65A6   0204 020C

        DECLE   $0214,  $021C,  $027C           ; 65A8   0214 021C 027C
L_65AB:
        ADDR    R0,     R4                      ; 65AB   00C4
        MVI@    R4,     R0                      ; 65AC   02A0
        SLL     R0,     1                       ; 65AD   0048
        XORR    R2,     R0                      ; 65AE   01D0
L_65AF:
        DECR    R5                              ; 65AF   0015
        MVO@    R0,     R5                      ; 65B0   0268
L_65B1:
        DECR    R1                              ; 65B1   0011
        BNEQ    L_6568                          ; 65B2   022C 004B

        MVI     G_031E, R0                      ; 65B4   0280 031E
        SLR     R0,     1                       ; 65B6   0060
        ANDI    #$0008, R0                      ; 65B7   03B8 0008
        SDBD                                    ; 65B9   0001
        ADDI    #$1906, R0                      ; 65BA   02F8 0006 0019
        MVO     R0,     G_030C                  ; 65BD   0240 030C
        B       L_6860                          ; 65BF   0200 029F

        MVII    #$0314, R5                      ; 65C1   02BD 0314
        MVII    #$0008, R1                      ; 65C3   02B9 0008
L_65C5:
        MVI@    R5,     R0                      ; 65C5   02A8
        MOVR    R0,     R2                      ; 65C6   0082
        RLC     R2,     2                       ; 65C7   0056
        BOV     L_65CD                          ; 65C8   0202 0003

        MOVR    R0,     R2                      ; 65CA   0082
        BNEQ    L_65E7                          ; 65CB   020C 001A

L_65CD:
        PSHR    R0                              ; 65CD   0270

        JSR     R4,     L_68A8                  ; 65CE   0004 0068 00A8

        MOVR    R0,     R3                      ; 65D1   0083
        ANDI    #$0008, R0                      ; 65D2   03B8 0008
        SDBD                                    ; 65D4   0001
        ADDI    #$1906, R0                      ; 65D5   02F8 0006 0019
        RRC     R3,     2                       ; 65D8   0077
        BESC    L_65DF                          ; 65D9   020F 0004

        SDBD                                    ; 65DB   0001
        MVII    #$4006, R0                      ; 65DC   02B8 0006 0040
L_65DF:
        PULR    R2                              ; 65DF   02B2
        SDBD                                    ; 65E0   0001
        ANDI    #$2000, R2                      ; 65E1   03BA 0000 0020
        XORR    R2,     R0                      ; 65E4   01D0
        B       L_660C                          ; 65E5   0200 0025

L_65E7:
        ANDI    #$0007, R2                      ; 65E7   03BA 0007
        BEQ     L_660E                          ; 65E9   0204 0023

        MOVR    R0,     R2                      ; 65EB   0082
        SDBD                                    ; 65EC   0001
        ANDI    #$2007, R2                      ; 65ED   03BA 0007 0020
        ANDI    #$01F8, R0                      ; 65F0   03B8 01F8
        BEQ     L_65FF                          ; 65F2   0204 000B

        SUBI    #$0059, R0                      ; 65F4   0338 0059
        BMI     L_660E                          ; 65F6   020B 0016

        CMPI    #$0028, R0                      ; 65F8   0378 0028
        BPL     L_660E                          ; 65FA   0203 0012

        INCR    R0                              ; 65FC   0008
        SLR     R0,     2                       ; 65FD   0064
        SLR     R0,     1                       ; 65FE   0060

L_65FF:
        JSR     R4,     L_6608                  ; 65FF   0004 0064 0208

        MVI@    R2,     R4                      ; 6602   0294
        BEQ     L_6811                          ; 6603   0204 020C

        DECLE   $0214,  $021C,  $027C           ; 6605   0214 021C 027C
L_6608:
        ADDR    R0,     R4                      ; 6608   00C4
        MVI@    R4,     R0                      ; 6609   02A0
        SLL     R0,     1                       ; 660A   0048
        XORR    R2,     R0                      ; 660B   01D0
L_660C:
        DECR    R5                              ; 660C   0015
        MVO@    R0,     R5                      ; 660D   0268
L_660E:
        DECR    R1                              ; 660E   0011
        BNEQ    L_65C5                          ; 660F   022C 004B

        MVI     G_031E, R0                      ; 6611   0280 031E
        SLR     R0,     1                       ; 6613   0060
        ANDI    #$0008, R0                      ; 6614   03B8 0008
        SDBD                                    ; 6616   0001
        ADDI    #$1916, R0                      ; 6617   02F8 0016 0019
        MVO     R0,     G_031B                  ; 661A   0240 031B
        B       L_6860                          ; 661C   0200 0242

        MVI     G_01AA, R0                      ; 661E   0280 01AA
        DECR    R0                              ; 6620   0010
        BNEQ    L_6860                          ; 6621   020C 023D

        MVII    #$030C, R4                      ; 6623   02BC 030C
        MVII    #$0080, R2                      ; 6625   02BA 0080
        SWAP    R2,     1                       ; 6627   0042
L_6628:
        MVI@    R4,     R0                      ; 6628   02A0
        CMPR    R2,     R0                      ; 6629   0150
        BNEQ    L_6628                          ; 662A   022C 0003

L_662C:
        MOVR    R4,     R0                      ; 662C   00A0
        SUBI    #$030C, R0                      ; 662D   0338 030C
        MVO     R0,     G_01AE                  ; 662F   0240 01AE
L_6631:
        MVI@    R4,     R1                      ; 6631   02A1
        CMPR    R2,     R1                      ; 6632   0151
        BEQ     L_6631                          ; 6633   0224 0003

        MOVR    R4,     R1                      ; 6635   00A1
        SUBI    #$030D, R1                      ; 6636   0339 030D
        CMPR    R0,     R1                      ; 6638   0141
        BEQ     L_6628                          ; 6639   0224 0012

        MVO     R1,     G_01AF                  ; 663B   0241 01AF
L_663D:
        CMPI    #$031C, R4                      ; 663D   037C 031C
        BEQ     L_6653                          ; 663F   0204 0012

        MVI@    R4,     R0                      ; 6641   02A0
        CMPR    R2,     R0                      ; 6642   0150
        BNEQ    L_663D                          ; 6643   022C 0007

        MVI     G_01D9, R0                      ; 6645   0280 01D9
        CMPI    #$0002, R0                      ; 6647   0378 0002
        BEQ     L_6653                          ; 6649   0204 0008

        PSHR    R4                              ; 664B   0274

        JSR     R4,     L_68A8                  ; 664C   0004 0068 00A8

        PULR    R4                              ; 664F   02B4
        RRC     R0,     2                       ; 6650   0074
        BESC    L_662C                          ; 6651   022F 0026

L_6653:
        MVI     G_019A, R0                      ; 6653   0280 019A
        INCR    R0                              ; 6655   0008
        MVO     R0,     G_019A                  ; 6656   0240 019A
        CMPI    #$0020, R0                      ; 6658   0378 0020
        BMI     L_671E                          ; 665A   020B 00C2

        MVI     G_01D5, R0                      ; 665C   0280 01D5
        SLR     R0,     1                       ; 665E   0060
        MVI     G_01D6, R1                      ; 665F   0281 01D6
        SLR     R1,     1                       ; 6661   0061
        SUBR    R1,     R0                      ; 6662   0108
        BPL     L_6669                          ; 6663   0203 0004

        ADD     G_01D9, R0                      ; 6665   02C0 01D9
        B       L_666C                          ; 6667   0200 0003

L_6669:
        SUB     G_01DA, R0                      ; 6669   0300 01DA
        NEGR    R0                              ; 666B   0020
L_666C:
        CMPI    #$0002, R0                      ; 666C   0378 0002
        BMI     L_671E                          ; 666E   020B 00AE

        MVI     G_032D, R0                      ; 6670   0280 032D
        TSTR    R0                              ; 6672   0080
        BNEQ    L_671E                          ; 6673   020C 00A9

        MVO     R0,     G_019A                  ; 6675   0240 019A
        MVII    #$00FF, R0                      ; 6677   02B8 00FF
        MVO     R0,     G_01AB                  ; 6679   0240 01AB
        MVII    #$01DD, R4                      ; 667B   02BC 01DD
        MVII    #$01E5, R5                      ; 667D   02BD 01E5
        MVI@    R4,     R0                      ; 667F   02A0
        MVO@    R0,     R5                      ; 6680   0268
        MVI@    R4,     R0                      ; 6681   02A0
        MVO@    R0,     R5                      ; 6682   0268
        MVI@    R4,     R0                      ; 6683   02A0
        MVO@    R0,     R5                      ; 6684   0268
        MVI@    R4,     R0                      ; 6685   02A0
        MVO@    R0,     R5                      ; 6686   0268
        MVI@    R4,     R0                      ; 6687   02A0
        MVO@    R0,     R5                      ; 6688   0268
        MVI@    R4,     R0                      ; 6689   02A0
        MVO@    R0,     R5                      ; 668A   0268
        MVI@    R4,     R0                      ; 668B   02A0
        MVO@    R0,     R5                      ; 668C   0268
        MVI@    R4,     R0                      ; 668D   02A0
        MVO@    R0,     R5                      ; 668E   0268
        MVI     G_0320, R0                      ; 668F   0280 0320
        MVO     R0,     G_0321                  ; 6691   0240 0321
        MVI     G_0324, R0                      ; 6693   0280 0324
        INCR    R0                              ; 6695   0008
        MVO     R0,     G_0324                  ; 6696   0240 0324
        MVI     G_01AE, R0                      ; 6698   0280 01AE
        DECR    R0                              ; 669A   0010
        SLL     R0,     2                       ; 669B   004C
        SLL     R0,     1                       ; 669C   0048
        XORI    #$0200, R0                      ; 669D   03F8 0200
        MVO     R0,     G_02F2                  ; 669F   0240 02F2
        MVII    #$0108, R0                      ; 66A1   02B8 0108
        MVO     R0,     G_02F3                  ; 66A3   0240 02F3
        SDBD                                    ; 66A5   0001
        MVII    #$0508, R0                      ; 66A6   02B8 0008 0005
        MVO     R0,     G_02F6                  ; 66A9   0240 02F6
        SDBD                                    ; 66AB   0001
        MVII    #$08A0, R0                      ; 66AC   02B8 00A0 0008
        MVO     R0,     G_02F4                  ; 66AF   0240 02F4
        MVO     R0,     G_02F7                  ; 66B1   0240 02F7
        MVI     G_01AF, R0                      ; 66B3   0280 01AF
        INCR    R0                              ; 66B5   0008
        SLL     R0,     2                       ; 66B6   004C
        SLL     R0,     1                       ; 66B7   0048
        XORI    #$0200, R0                      ; 66B8   03F8 0200
        MVO     R0,     G_02F5                  ; 66BA   0240 02F5
        SDBD                                    ; 66BC   0001
        MVII    #$08F8, R0                      ; 66BD   02B8 00F8 0008
        MVII    #$030C, R4                      ; 66C0   02BC 030C
        MVI     G_01AE, R1                      ; 66C2   0281 01AE
        SUBI    #$0003, R1                      ; 66C4   0339 0003
L_66C6:
        MVO@    R0,     R4                      ; 66C6   0260
        DECR    R1                              ; 66C7   0011
        BNEQ    L_66C6                          ; 66C8   022C 0003

        SUBI    #$0060, R0                      ; 66CA   0338 0060
        MVO@    R0,     R4                      ; 66CC   0260
        MVI@    R4,     R5                      ; 66CD   02A5
        SDBD                                    ; 66CE   0001
        XORI    #$C000, R5                      ; 66CF   03FD 0000 00C0
        DECR    R4                              ; 66D2   0014
        MVO@    R5,     R4                      ; 66D3   0265
        MVI     G_01AF, R1                      ; 66D4   0281 01AF
        SUB     G_01AE, R1                      ; 66D6   0301 01AE
        INCR    R1                              ; 66D8   0009
        MVI     G_031D, R2                      ; 66D9   0282 031D
        SDBD                                    ; 66DB   0001
        CMPI    #$526C, R2                      ; 66DC   037A 006C 0052
        BNEQ    L_66F5                          ; 66DF   020C 0014

        SUBI    #$0008, R0                      ; 66E1   0338 0008
        MVO     R0,     G_02F4                  ; 66E3   0240 02F4
        MVO     R0,     G_02F7                  ; 66E5   0240 02F7
        ADDI    #$0011, R0                      ; 66E7   02F8 0011
        MVI     G_02F5, R2                      ; 66E9   0282 02F5
        SUB     G_02F2, R2                      ; 66EB   0302 02F2
        SLR     R2,     1                       ; 66ED   0062
        ADD     G_02F2, R2                      ; 66EE   02C2 02F2
        SWAP    R2,     1                       ; 66F0   0042
        MVO     R2,     G_02F8                  ; 66F1   0242 02F8
        B       L_66F9                          ; 66F3   0200 0004

L_66F5:
        SDBD                                    ; 66F5   0001
        MVII    #$C8A0, R0                      ; 66F6   02B8 00A0 00C8
L_66F9:
        MVO@    R0,     R4                      ; 66F9   0260
        DECR    R1                              ; 66FA   0011
        BNEQ    L_66F9                          ; 66FB   022C 0003

        MVI@    R4,     R5                      ; 66FD   02A5
        SDBD                                    ; 66FE   0001
        XORI    #$C000, R5                      ; 66FF   03FD 0000 00C0
        DECR    R4                              ; 6702   0014
        MVO@    R5,     R4                      ; 6703   0265
        SDBD                                    ; 6704   0001
        MVII    #$08A8, R0                      ; 6705   02B8 00A8 0008
        MVI@    R4,     R2                      ; 6708   02A2
        DECR    R4                              ; 6709   0014
        SDBD                                    ; 670A   0001
        ANDI    #$2000, R2                      ; 670B   03BA 0000 0020
        XORR    R2,     R0                      ; 670E   01D0
        MVO@    R0,     R4                      ; 670F   0260
        XORR    R2,     R0                      ; 6710   01D0
        ADDI    #$0050, R0                      ; 6711   02F8 0050
L_6713:
        MVO@    R0,     R4                      ; 6713   0260
        CMPI    #$031C, R4                      ; 6714   037C 031C
        BNEQ    L_6713                          ; 6716   022C 0004

        MVII    #$00FF, R0                      ; 6718   02B8 00FF
        MVO     R0,     G_01A2                  ; 671A   0240 01A2
        B       L_6860                          ; 671C   0200 0142

L_671E:
        JSR     R4,     L_68A8                  ; 671E   0004 0068 00A8

        SARC    R0,     1                       ; 6721   0078
        CLRR    R2                              ; 6722   01D2
        RLC     R2,     1                       ; 6723   0052
        MVO     R2,     G_01AD                  ; 6724   0242 01AD
        MVI     G_01DC, R1                      ; 6726   0281 01DC
        INCR    R1                              ; 6728   0009
        CMPI    #$001D, R1                      ; 6729   0379 001D
        BPL     L_6808                          ; 672B   0203 00DB

        MVO     R1,     G_01DC                  ; 672D   0241 01DC
        MVI     G_019A, R1                      ; 672F   0281 019A
        DECR    R1                              ; 6731   0011
        BEQ     L_6847                          ; 6732   0204 0113

        MVI     G_01DB, R1                      ; 6734   0281 01DB
        CMPI    #$0006, R1                      ; 6736   0379 0006
        BNEQ    L_6740                          ; 6738   020C 0006

        ANDI    #$000F, R0                      ; 673A   03B8 000F
        BEQ     L_67C3                          ; 673C   0204 0085
        B       L_6847                          ; 673E   0200 0107

L_6740:
        MOVR    R0,     R1                      ; 6740   0081
        ANDI    #$003F, R0                      ; 6741   03B8 003F
        MVII    #$0030, R3                      ; 6743   02BB 0030
        SUB     G_0324, R3                      ; 6745   0303 0324
        BPL     L_674A                          ; 6747   0203 0001

        CLRR    R3                              ; 6749   01DB
L_674A:
        CMPR    R0,     R3                      ; 674A   0143
        BPL     L_6802                          ; 674B   0203 00B5

        CMPI    #$002F, R3                      ; 674D   037B 002F
        BPL     L_6756                          ; 674F   0203 0005

        MOVR    R1,     R0                      ; 6751   0088
        ANDI    #$01C0, R0                      ; 6752   03B8 01C0
        BEQ     L_67C3                          ; 6754   0204 006D

L_6756:
        ANDI    #$0200, R1                      ; 6756   03B9 0200
        BEQ     L_6769                          ; 6758   0204 000F

L_675A:
        MVII    #$0002, R0                      ; 675A   02B8 0002
        MVO     R0,     G_01AC                  ; 675C   0240 01AC
        MVI     G_01AE, R1                      ; 675E   0281 01AE
        MVI     G_01AF, R0                      ; 6760   0280 01AF
        DECR    R0                              ; 6762   0010
        CMPR    R1,     R0                      ; 6763   0148
        BLE     L_6769                          ; 6764   0206 0003

        MOVR    R7,     R3                      ; 6766   00BB
        B       L_6772                          ; 6767   0200 0009

L_6769:
        MVII    #$0001, R0                      ; 6769   02B8 0001
        MVO     R0,     G_01AC                  ; 676B   0240 01AC
        MVI     G_01AE, R1                      ; 676D   0281 01AE
        MVI     G_01AF, R0                      ; 676F   0280 01AF
        CLRR    R3                              ; 6771   01DB
L_6772:
        SLL     R1,     2                       ; 6772   004D
        SLL     R1,     1                       ; 6773   0049
        MVO     R1,     G_01AE                  ; 6774   0241 01AE
        INCR    R1                              ; 6776   0009
        SLL     R0,     2                       ; 6777   004C
        SLL     R0,     1                       ; 6778   0048
        MVO     R0,     G_01AF                  ; 6779   0240 01AF
        DECR    R0                              ; 677B   0010
        SUBR    R1,     R0                      ; 677C   0108

        JSR     R4,     L_6890                  ; 677D   0004 0068 0090

        ADDR    R1,     R0                      ; 6780   00C8
        ADDI    #$0300, R0                      ; 6781   02F8 0300
        TSTR    R3                              ; 6783   009B
        BEQ     L_678A                          ; 6784   0204 0004

        SDBD                                    ; 6786   0001
        ADDI    #$0400, R0                      ; 6787   02F8 0000 0004
L_678A:
        MVII    #$02F2, R4                      ; 678A   02BC 02F2
        MVO@    R0,     R4                      ; 678C   0260
        SWAP    R2,     1                       ; 678D   0042
        SLL     R2,     2                       ; 678E   004E
        ADDI    #$0088, R2                      ; 678F   02FA 0088
        MVO@    R2,     R4                      ; 6791   0262
        SDBD                                    ; 6792   0001
        MVII    #$28D6, R0                      ; 6793   02B8 00D6 0028
        TSTR    R3                              ; 6796   009B
        BEQ     L_679D                          ; 6797   0204 0004

        SDBD                                    ; 6799   0001
        MVII    #$1861, R0                      ; 679A   02B8 0061 0018
L_679D:
        MVO@    R0,     R4                      ; 679D   0260
        CLRR    R0                              ; 679E   01C0
        MVO     R0,     G_01A2                  ; 679F   0240 01A2
        MVI     G_031F, R0                      ; 67A1   0280 031F
        MOVR    R0,     R1                      ; 67A3   0081
        SLL     R1,     2                       ; 67A4   004D
        ADDR    R1,     R0                      ; 67A5   00C8
        SLL     R1,     1                       ; 67A6   0049
        ADDR    R1,     R0                      ; 67A7   00C8
        INCR    R0                              ; 67A8   0008
        SWAP    R0,     1                       ; 67A9   0040
        MVO     R0,     G_031F                  ; 67AA   0240 031F
        MVII    #$00FF, R1                      ; 67AC   02B9 00FF
        ANDI    #$0001, R0                      ; 67AE   03B8 0001
        CMP     G_0324, R0                      ; 67B0   0340 0324
        BPL     L_67BF                          ; 67B2   0203 000B

L_67B4:
        MVI     G_031F, R1                      ; 67B4   0281 031F
        ANDI    #$00FF, R1                      ; 67B6   03B9 00FF
        CMPI    #$0070, R1                      ; 67B8   0379 0070
        BMI     L_67BE                          ; 67BA   020B 0002

        SLR     R1,     2                       ; 67BC   0065
L_67BD:
        SLR     R1,     1                       ; 67BD   0061
L_67BE:
        SLL     R1,     1                       ; 67BE   0049
L_67BF:
        MVO     R1,     G_01AB                  ; 67BF   0241 01AB
        B       L_6860                          ; 67C1   0200 009D

L_67C3:
        CLRR    R0                              ; 67C3   01C0
        MVO     R0,     G_01AC                  ; 67C4   0240 01AC

        JSR     R4,     L_68A8                  ; 67C6   0004 0068 00A8

        ANDI    #$007F, R0                      ; 67C9   03B8 007F
        ADDI    #$000C, R0                      ; 67CB   02F8 000C
        CMPI    #$007D, R0                      ; 67CD   0378 007D
        BMI     L_67D3                          ; 67CF   020B 0002

        SUBI    #$0043, R0                      ; 67D1   0338 0043
L_67D3:
        ADDI    #$0300, R0                      ; 67D3   02F8 0300
        MVII    #$02F2, R4                      ; 67D5   02BC 02F2
        MVO@    R0,     R4                      ; 67D7   0260
        SWAP    R2,     1                       ; 67D8   0042
        SLL     R2,     2                       ; 67D9   004E
        ADDI    #$000B, R2                      ; 67DA   02FA 000B
        MVO@    R2,     R4                      ; 67DC   0262
        MVII    #$0008, R0                      ; 67DD   02B8 0008
        SWAP    R0,     1                       ; 67DF   0040
        MVO@    R0,     R4                      ; 67E0   0260
        CLRR    R0                              ; 67E1   01C0
        MVO     R0,     G_01A2                  ; 67E2   0240 01A2
        MVO     R0,     G_01AB                  ; 67E4   0240 01AB
        MVII    #$030C, R4                      ; 67E6   02BC 030C
        MVII    #$0010, R3                      ; 67E8   02BB 0010
        MVII    #$0040, R1                      ; 67EA   02B9 0040
        SWAP    R1,     1                       ; 67EC   0041
L_67ED:
        MVI@    R4,     R0                      ; 67ED   02A0
        MOVR    R0,     R2                      ; 67EE   0082
        SDBD                                    ; 67EF   0001
        ANDI    #$2000, R2                      ; 67F0   03BA 0000 0020
        ANDI    #$0007, R0                      ; 67F3   03B8 0007
        CMPI    #$0006, R0                      ; 67F5   0378 0006
        BNEQ    L_67FD                          ; 67F7   020C 0004

        DECR    R4                              ; 67F9   0014
        XORR    R2,     R1                      ; 67FA   01D1
        MVO@    R1,     R4                      ; 67FB   0261
        XORR    R2,     R1                      ; 67FC   01D1
L_67FD:
        DECR    R3                              ; 67FD   0013
        BNEQ    L_67ED                          ; 67FE   022C 0012
        B       L_6860                          ; 6800   0200 005E

L_6802:
        MVI     G_031E, R0                      ; 6802   0280 031E
        ANDI    #$0080, R0                      ; 6804   03B8 0080
        BEQ     L_6847                          ; 6806   0204 003F

L_6808:
        MVI     G_032D, R0                      ; 6808   0280 032D
        TSTR    R0                              ; 680A   0080
        BNEQ    L_675A                          ; 680B   022C 00B2

        MVO     R0,     G_01DC                  ; 680D   0240 01DC
        MVII    #$0003, R0                      ; 680F   02B8 0003
L_6811:
        MVO     R0,     G_01AC                  ; 6811   0240 01AC
        MVI     G_01AE, R5                      ; 6813   0285 01AE
        MVI     G_01AF, R0                      ; 6815   0280 01AF
        DECR    R0                              ; 6817   0010
        SUBR    R5,     R0                      ; 6818   0128

        JSR     R4,     L_6890                  ; 6819   0004 0068 0090

        ADDR    R0,     R5                      ; 681C   00C5
        MOVR    R5,     R0                      ; 681D   00A8
        SLL     R0,     2                       ; 681E   004C
        SLL     R0,     1                       ; 681F   0048
        XORI    #$0300, R0                      ; 6820   03F8 0300
        MVII    #$02F2, R4                      ; 6822   02BC 02F2
        MVO@    R0,     R4                      ; 6824   0260
        ADDI    #$0008, R0                      ; 6825   02F8 0008
        MVO     R0,     G_02F5                  ; 6827   0240 02F5
        MVII    #$0088, R0                      ; 6829   02B8 0088
        MVO@    R0,     R4                      ; 682B   0260
        MVO     R0,     G_02F6                  ; 682C   0240 02F6
        SDBD                                    ; 682E   0001
        MVII    #$0871, R0                      ; 682F   02B8 0071 0008
        MVO@    R0,     R4                      ; 6832   0260
        ADDI    #$0010, R0                      ; 6833   02F8 0010
        MVO     R0,     G_02F7                  ; 6835   0240 02F7
        SDBD                                    ; 6837   0001
        MVII    #$16B6, R0                      ; 6838   02B8 00B6 0016
        ADDI    #$030B, R5                      ; 683B   02FD 030B
        MVO@    R0,     R5                      ; 683D   0268
        MVO@    R0,     R5                      ; 683E   0268
        MVII    #$00FF, R0                      ; 683F   02B8 00FF
        MVO     R0,     G_01A2                  ; 6841   0240 01A2
        MVO     R0,     G_01AB                  ; 6843   0240 01AB
        B       L_6860                          ; 6845   0200 0019

L_6847:
        MVII    #$0004, R0                      ; 6847   02B8 0004
        MVO     R0,     G_01AC                  ; 6849   0240 01AC
        CLRR    R0                              ; 684B   01C0
        MVII    #$02F2, R4                      ; 684C   02BC 02F2
        MVO@    R0,     R4                      ; 684E   0260
        MVO@    R0,     R4                      ; 684F   0260
        NOP                                     ; 6850   0034
        MVO@    R0,     R4                      ; 6851   0260
        MVO     R0,     G_01A2                  ; 6852   0240 01A2
        DECR    R0                              ; 6854   0010
        MVO     R0,     G_01AB                  ; 6855   0240 01AB
        B       L_6860                          ; 6857   0200 0007

        MVII    #$010B, R4                      ; 6859   02BC 010B
        MVII    #$0150, R3                      ; 685B   02BB 0150

        JSR     R5,     L_6B13                  ; 685D   0004 0168 0313

L_6860:
        PULR    R7                              ; 6860   02B7
L_6861:
        MVI     G_018C, R3                      ; 6861   0283 018C
        ADDI    #$0100, R3                      ; 6863   02FB 0100
        MVI@    R3,     R0                      ; 6865   0298
        MVO     R0,     G_0190                  ; 6866   0240 0190
        CMPI    #$005A, R0                      ; 6868   0378 005A
        BEQ     L_686D                          ; 686A   0204 0001

        MOVR    R5,     R7                      ; 686C   00AF
L_686D:
        DIS                                     ; 686D   0003
        MVI     .PSG0.chan_enable,R0            ; 686E   0280 01F8
        MVO     R0,     G_0199                  ; 6870   0240 0199
        MVII    #$003F, R0                      ; 6872   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; 6874   0240 01F8
L_6876:
        MVI@    R3,     R0                      ; 6876   0298
        CMPI    #$00FF, R0                      ; 6877   0378 00FF
        BNEQ    L_6876                          ; 6879   022C 0004

        MVO     R0,     G_0190                  ; 687B   0240 0190
L_687D:
        MVI@    R3,     R0                      ; 687D   0298
        CMPI    #$00FF, R0                      ; 687E   0378 00FF
        BEQ     L_687D                          ; 6880   0224 0004

        MVI     G_0199, R0                      ; 6882   0280 0199
        MVO     R0,     .PSG0.chan_enable       ; 6884   0240 01F8
        MVII    #$00E0, R0                      ; 6886   02B8 00E0
        MVII    #$005A, R1                      ; 6888   02B9 005A
        MVO     R0,     .ISRVEC.0               ; 688A   0240 0100
        MVO     R1,     .ISRVEC.1               ; 688C   0241 0101
        EIS                                     ; 688E   0002
        DECR    R7                              ; 688F   0017
L_6890:
        PSHR    R4                              ; 6890   0274
        PSHR    R1                              ; 6891   0271
        MOVR    R0,     R1                      ; 6892   0081
        PSHR    R2                              ; 6893   0272
        PSHR    R3                              ; 6894   0273
        MOVR    R1,     R2                      ; 6895   008A
        CLRR    R3                              ; 6896   01DB
L_6897:
        SETC                                    ; 6897   0007
        RLC     R3,     1                       ; 6898   0053
        SLR     R2,     1                       ; 6899   0062
        BNEQ    L_6897                          ; 689A   022C 0004

        JSR     R4,     L_68A8                  ; 689C   0004 0068 00A8

        ANDR    R3,     R0                      ; 689F   0198
        CMPR    R1,     R0                      ; 68A0   0148
        BLE     L_68A4                          ; 68A1   0206 0001

        SLR     R0,     1                       ; 68A3   0060
L_68A4:
        PULR    R3                              ; 68A4   02B3
        PULR    R2                              ; 68A5   02B2
        PULR    R1                              ; 68A6   02B1
        PULR    R7                              ; 68A7   02B7
L_68A8:
        PSHR    R1                              ; 68A8   0271
        MVI     G_031E, R0                      ; 68A9   0280 031E
        MOVR    R0,     R1                      ; 68AB   0081
        SLL     R1,     2                       ; 68AC   004D
        ADDR    R1,     R0                      ; 68AD   00C8
        SLL     R1,     1                       ; 68AE   0049
        ADDR    R1,     R0                      ; 68AF   00C8
        INCR    R0                              ; 68B0   0008
        SWAP    R0,     1                       ; 68B1   0040
        MVO     R0,     G_031E                  ; 68B2   0240 031E
        PULR    R1                              ; 68B4   02B1
        MOVR    R4,     R7                      ; 68B5   00A7
L_68B6:
        MOVR    R7,     R4                      ; 68B6   00BC
        ADDI    #$0030, R4                      ; 68B7   02FC 0030
        CLRR    R2                              ; 68B9   01D2
        MVI     G_0117, R3                      ; 68BA   0283 0117
        TSTR    R3                              ; 68BC   009B
        BEQ     L_68D2                          ; 68BD   0204 0013

L_68BF:
        MVI@    R4,     R2                      ; 68BF   02A2
        MVI@    R2,     R0                      ; 68C0   0290
        SDBD                                    ; 68C1   0001
        ANDI    #$2000, R0                      ; 68C2   03B8 0000 0020
        SDBD                                    ; 68C5   0001
        XORI    #$19F0, R0                      ; 68C6   03F8 00F0 0019
        MVO@    R0,     R2                      ; 68C9   0250
        ADDI    #$0014, R2                      ; 68CA   02FA 0014
        ADDI    #$0008, R0                      ; 68CC   02F8 0008
        MVO@    R0,     R2                      ; 68CE   0250
        DECR    R3                              ; 68CF   0013
        BGT     L_68BF                          ; 68D0   022E 0012

L_68D2:
        CMPI    #$024E, R2                      ; 68D2   037A 024E
        BNEQ    L_68D7                          ; 68D4   020C 0001

        MOVR    R5,     R7                      ; 68D6   00AF
L_68D7:
        MVI@    R4,     R2                      ; 68D7   02A2
        MVI@    R2,     R0                      ; 68D8   0290
        SDBD                                    ; 68D9   0001
        ANDI    #$2000, R0                      ; 68DA   03B8 0000 0020
        SDBD                                    ; 68DD   0001
        XORI    #$18E0, R0                      ; 68DE   03F8 00E0 0018
        MVO@    R0,     R2                      ; 68E1   0250
        ADDI    #$0014, R2                      ; 68E2   02FA 0014
        MVO@    R0,     R2                      ; 68E4   0250
        B       L_68D2                          ; 68E5   0220 0014

        MVI@    R1,     R0                      ; 68E7   0288
        MVI@    R1,     R1                      ; 68E8   0289
        MVI@    R1,     R2                      ; 68E9   028A
        MVO@    R0,     R4                      ; 68EA   0260
        MVO@    R1,     R4                      ; 68EB   0261
        MVO@    R2,     R4                      ; 68EC   0262
        DECLE   $0238,  $0239,  $023A           ; 68ED   0238 0239 023A
L_68F0:
        PSHR    R5                              ; 68F0   0275
        CLRR    R5                              ; 68F1   01ED
        MVO     R5,     G_01B3                  ; 68F2   0245 01B3
        MVO     R5,     G_0330                  ; 68F4   0245 0330
        MVII    #$0043, R5                      ; 68F6   02BD 0043
        MVO     R5,     G_0197                  ; 68F8   0245 0197
        PULR    R7                              ; 68FA   02B7
L_68FB:
        PSHR    R4                              ; 68FB   0274

        JSR     R4,     L_68A8                  ; 68FC   0004 0068 00A8

        MOVR    R1,     R2                      ; 68FF   008A
        ADDI    #$01D7, R2                      ; 6900   02FA 01D7
        MVI@    R2,     R2                      ; 6902   0292
        CMPI    #$000C, R2                      ; 6903   037A 000C
        BPL     L_6916                          ; 6905   0203 000F

        CLRR    R2                              ; 6907   01D2
        CLRR    R3                              ; 6908   01DB
        ANDI    #$000F, R0                      ; 6909   03B8 000F
        SUBI    #$0002, R0                      ; 690B   0338 0002
        BMI     L_6944                          ; 690D   020B 0035

        MVI     G_0324, R4                      ; 690F   0284 0324
        ANDI    #$0001, R4                      ; 6911   03BC 0001
        BEQ     L_6916                          ; 6913   0204 0001

        MOVR    R1,     R0                      ; 6915   0088
L_6916:
        ANDI    #$0001, R0                      ; 6916   03B8 0001
        SDBD                                    ; 6918   0001
        ADDI    #$61FC, R2                      ; 6919   02FA 00FC 0061
L_691C:
        ADDR    R0,     R2                      ; 691C   00C2
        MVI@    R2,     R4                      ; 691D   0294
        SDBD                                    ; 691E   0001
        ADDI    #$61FE, R4                      ; 691F   02FC 00FE 0061
        MOVR    R1,     R3                      ; 6922   008B
        ADDI    #$01D5, R3                      ; 6923   02FB 01D5
        MVI@    R3,     R3                      ; 6925   029B
        ADD@    R4,     R3                      ; 6926   02E3
        SUBI    #$0006, R3                      ; 6927   033B 0006
        BMI     L_6937                          ; 6929   020B 000C

        PSHR    R1                              ; 692B   0271
        ADDI    #$01D9, R1                      ; 692C   02F9 01D9
        MVI@    R1,     R1                      ; 692E   0289
        SLL     R1,     1                       ; 692F   0049
        NEGR    R1                              ; 6930   0021
        ADDI    #$0019, R1                      ; 6931   02F9 0019
        CMPR    R1,     R3                      ; 6933   014B
        PULR    R1                              ; 6934   02B1
        BMI     L_693C                          ; 6935   020B 0005

L_6937:
        SUBR    R0,     R2                      ; 6937   0102
        XORI    #$0001, R0                      ; 6938   03F8 0001
        B       L_691C                          ; 693A   0220 001F

L_693C:
        MVI@    R2,     R2                      ; 693C   0292
        MOVR    R1,     R3                      ; 693D   008B
        ADDI    #$01D7, R3                      ; 693E   02FB 01D7
        MVO@    R2,     R3                      ; 6940   025A
        MVI@    R4,     R3                      ; 6941   02A3
        SUBI    #$0002, R3                      ; 6942   033B 0002
L_6944:
        MOVR    R1,     R4                      ; 6944   008C
        ADDI    #$01D5, R4                      ; 6945   02FC 01D5
        MVI@    R4,     R0                      ; 6947   02A0
        ADDR    R0,     R3                      ; 6948   00C3
        DECR    R4                              ; 6949   0014
        MVO@    R3,     R4                      ; 694A   0263
        CMPR    R0,     R3                      ; 694B   0143
        BMI     L_694F                          ; 694C   020B 0001

        MOVR    R0,     R3                      ; 694E   0083
L_694F:
        SLR     R3,     1                       ; 694F   0063
        ADDI    #$030E, R3                      ; 6950   02FB 030E
        MOVR    R3,     R5                      ; 6952   009D
        SLL     R2,     1                       ; 6953   004A
        SDBD                                    ; 6954   0001
        ADDI    #$2804, R2                      ; 6955   02FA 0004 0028
        PSHR    R2                              ; 6958   0272
        MVI@    R3,     R0                      ; 6959   0298
        SDBD                                    ; 695A   0001
        CMPI    #$8000, R0                      ; 695B   0378 0000 0080
        BEQ     L_6973                          ; 695E   0204 0013

        TSTR    R0                              ; 6960   0080
        BEQ     L_6972                          ; 6961   0204 000F

        JSR     R4,     L_699D                  ; 6963   0004 0068 019D

        DECR    R5                              ; 6966   0015
        MVI@    R5,     R0                      ; 6967   02A8
        SDBD                                    ; 6968   0001
        ANDI    #$8000, R0                      ; 6969   03B8 0000 0080
        SDBD                                    ; 696C   0001
        XORI    #$8000, R0                      ; 696D   03F8 0000 0080
        SLR     R0,     2                       ; 6970   0064
        XORR    R0,     R2                      ; 6971   01C2
L_6972:
        MVO@    R2,     R5                      ; 6972   026A
L_6973:
        MVII    #$01D9, R2                      ; 6973   02BA 01D9
        ADDR    R1,     R2                      ; 6975   00CA
        ADD@    R2,     R3                      ; 6976   02D3
        SDBD                                    ; 6977   0001
        MVII    #$8000, R0                      ; 6978   02B8 0000 0080
L_697B:
        MVO@    R0,     R5                      ; 697B   0268
        CMPR    R3,     R5                      ; 697C   015D
        BNEQ    L_697B                          ; 697D   022C 0003

        PULR    R2                              ; 697F   02B2
        SUBI    #$0003, R2                      ; 6980   033A 0003
        MVI@    R3,     R0                      ; 6982   0298
        SDBD                                    ; 6983   0001
        CMPI    #$8000, R0                      ; 6984   0378 0000 0080
        BEQ     L_699C                          ; 6987   0204 0013

        TSTR    R0                              ; 6989   0080
        BEQ     L_699B                          ; 698A   0204 000F

        JSR     R4,     L_699D                  ; 698C   0004 0068 019D

        MVO@    R2,     R5                      ; 698F   026A
        MVI@    R5,     R0                      ; 6990   02A8
        TSTR    R0                              ; 6991   0080
        BNEQ    L_699C                          ; 6992   020C 0008

        SDBD                                    ; 6994   0001
        MVII    #$6000, R0                      ; 6995   02B8 0000 0060
        DECR    R5                              ; 6998   0015
        MVO@    R0,     R5                      ; 6999   0268
        PULR    R7                              ; 699A   02B7
L_699B:
        MVO@    R2,     R5                      ; 699B   026A
L_699C:
        PULR    R7                              ; 699C   02B7
L_699D:
        PSHR    R4                              ; 699D   0274
        PSHR    R1                              ; 699E   0271
        MOVR    R0,     R4                      ; 699F   0084
        PSHR    R3                              ; 69A0   0273
        PSHR    R5                              ; 69A1   0275
        MOVR    R2,     R5                      ; 69A2   0095
        ANDI    #$00F8, R4                      ; 69A3   03BC 00F8
        SDBD                                    ; 69A5   0001
        ADDI    #$6240, R4                      ; 69A6   02FC 0040 0062
        ANDI    #$00F8, R5                      ; 69A9   03BD 00F8
        SDBD                                    ; 69AB   0001
        ADDI    #$6240, R5                      ; 69AC   02FD 0040 0062
        ANDI    #$0007, R0                      ; 69AF   03B8 0007
        SLR     R0,     2                       ; 69B1   0064
        ANDI    #$0007, R2                      ; 69B2   03BA 0007
        SLR     R2,     2                       ; 69B4   0066
        MVII    #$013D, R1                      ; 69B5   02B9 013D
        CLRR    R3                              ; 69B7   01DB
        MVO     R3,     G_031C                  ; 69B8   0243 031C
        MVII    #$0008, R3                      ; 69BA   02BB 0008
L_69BC:
        PSHR    R3                              ; 69BC   0273
        MVI@    R4,     R3                      ; 69BD   02A3
        ADDR    R0,     R7                      ; 69BE   00C7
        COMR    R3                              ; 69BF   001B
        PSHR    R3                              ; 69C0   0273
        MVI@    R5,     R3                      ; 69C1   02AB
        ADDR    R2,     R7                      ; 69C2   00D7
        COMR    R3                              ; 69C3   001B
        AND@    R6,     R3                      ; 69C4   03B3
        MVO@    R3,     R1                      ; 69C5   024B
        ADD     G_031C, R3                      ; 69C6   02C3 031C
        MVO     R3,     G_031C                  ; 69C8   0243 031C
        INCR    R1                              ; 69CA   0009
        PULR    R3                              ; 69CB   02B3
        DECR    R3                              ; 69CC   0013
        BNEQ    L_69BC                          ; 69CD   022C 0012

        MVII    #$0080, R2                      ; 69CF   02BA 0080
        SWAP    R2,     1                       ; 69D1   0042
        MVI     G_031C, R3                      ; 69D2   0283 031C
        TSTR    R3                              ; 69D4   009B
        BEQ     L_69DD                          ; 69D5   0204 0006

        MVI     G_01B2, R2                      ; 69D7   0282 01B2
        SDBD                                    ; 69D9   0001
        ADDI    #$0964, R2                      ; 69DA   02FA 0064 0009
L_69DD:
        PULR    R5                              ; 69DD   02B5
        PULR    R3                              ; 69DE   02B3
        PULR    R1                              ; 69DF   02B1
        PULR    R7                              ; 69E0   02B7
L_69E1:
        PSHR    R4                              ; 69E1   0274
        MVI@    R5,     R4                      ; 69E2   02AC
        ANDI    #$03EF, R4                      ; 69E3   03BC 03EF
        MVI@    R5,     R5                      ; 69E5   02AD
        ANDI    #$03EF, R5                      ; 69E6   03BD 03EF
        SUBI    #$0106, R4                      ; 69E8   033C 0106
        BEQ     L_69F2                          ; 69EA   0204 0006

        CMPI    #$0008, R4                      ; 69EC   037C 0008
        BEQ     L_69F2                          ; 69EE   0204 0002

        MVII    #$0010, R4                      ; 69F0   02BC 0010
L_69F2:
        SUBI    #$0106, R5                      ; 69F2   033D 0106
        BEQ     L_69FC                          ; 69F4   0204 0006

        CMPI    #$0008, R5                      ; 69F6   037D 0008
        BEQ     L_69FC                          ; 69F8   0204 0002

        MVII    #$0010, R5                      ; 69FA   02BD 0010
L_69FC:
        SDBD                                    ; 69FC   0001
        ADDI    #$6CDF, R4                      ; 69FD   02FC 00DF 006C
        SDBD                                    ; 6A00   0001
        ADDI    #$6CDF, R5                      ; 6A01   02FD 00DF 006C
        ADDR    R1,     R4                      ; 6A04   00CC
        ADDR    R1,     R5                      ; 6A05   00CD
L_6A06:
        MVI@    R3,     R1                      ; 6A06   0299
        INCR    R3                              ; 6A07   000B
        PSHR    R0                              ; 6A08   0270
        SWAP    R1,     1                       ; 6A09   0041
        INCR    R7                              ; 6A0A   000F
L_6A0B:
        SLR     R1,     1                       ; 6A0B   0061
        DECR    R0                              ; 6A0C   0010
        BPL     L_6A0B                          ; 6A0D   0223 0003

        PULR    R0                              ; 6A0F   02B0
        PSHR    R1                              ; 6A10   0271
        MVI@    R4,     R1                      ; 6A11   02A1
        SWAP    R1,     1                       ; 6A12   0041
        XOR@    R5,     R1                      ; 6A13   03E9
        AND@    R6,     R1                      ; 6A14   03B1
        BNEQ    L_6A1B                          ; 6A15   020C 0004

        DECR    R2                              ; 6A17   0012
        BNEQ    L_6A06                          ; 6A18   022C 0013

        PULR    R7                              ; 6A1A   02B7
L_6A1B:
        PULR    R0                              ; 6A1B   02B0
        PULR    R0                              ; 6A1C   02B0
L_6A1D:
        MOVR    R7,     R0                      ; 6A1D   00B8
        ADDI    #$001E, R0                      ; 6A1E   02F8 001E
        MVO     R0,     G_031D                  ; 6A20   0240 031D
        MVII    #$0079, R0                      ; 6A22   02B8 0079
        MVO     R0,     G_0192                  ; 6A24   0240 0192
        CLRR    R0                              ; 6A26   01C0
        MVO     R0,     .PSG0.noise             ; 6A27   0240 01F9
        MVII    #$000A, R0                      ; 6A29   02B8 000A
        MVO     R0,     .PSG0.chn_a_hi          ; 6A2B   0240 01F4
        MVII    #$0036, R0                      ; 6A2D   02B8 0036
        MVO     R0,     .PSG0.chan_enable       ; 6A2F   0240 01F8
        MVII    #$0020, R0                      ; 6A31   02B8 0020
        MVO     R0,     G_018F                  ; 6A33   0240 018F
        MVI     G_032F, R0                      ; 6A35   0280 032F
        ANDI    #$007F, R0                      ; 6A37   03B8 007F
        SWAP    R0,     1                       ; 6A39   0040
        MVO     R0,     G_02F9                  ; 6A3A   0240 02F9

        JSR     R5,     L_6861                  ; 6A3C   0004 0168 0061

        MVI     G_0192, R0                      ; 6A3F   0280 0192
        DECR    R0                              ; 6A41   0010
        BMI     L_6AA8                          ; 6A42   020B 0064

        MVO     R0,     G_0192                  ; 6A44   0240 0192
        SLR     R0,     2                       ; 6A46   0064
        NOP                                     ; 6A47   0034
        SLR     R0,     1                       ; 6A48   0060
        MVO     R0,     .PSG0.chn_a_vol         ; 6A49   0240 01FB

        JSR     R5,     L_6B99                  ; 6A4B   0004 0168 0399

        MVII    #$010B, R4                      ; 6A4E   02BC 010B
        MVII    #$0150, R3                      ; 6A50   02BB 0150

        JSR     R5,     L_6B13                  ; 6A52   0004 0168 0313

        MVI     G_012C, R0                      ; 6A55   0280 012C
        SARC    R0,     1                       ; 6A57   0078
        BNC     L_6A5D                          ; 6A58   0209 0003

        JSR     R5,     L_6C2A                  ; 6A5A   0004 016C 002A

L_6A5D:
        MVI     G_018F, R5                      ; 6A5D   0285 018F
        DECR    R5                              ; 6A5F   0015
        BMI     L_6AA6                          ; 6A60   020B 0044

        MVO     R5,     G_018F                  ; 6A62   0245 018F
        ANDI    #$003E, R5                      ; 6A64   03BD 003E
        SDBD                                    ; 6A66   0001
        ADDI    #$63DF, R5                      ; 6A67   02FD 00DF 0063
        SDBD                                    ; 6A6A   0001
        MVI@    R5,     R0                      ; 6A6B   02A8
        MVO     R0,     G_0337                  ; 6A6C   0240 0337
        MVO     R0,     G_0338                  ; 6A6E   0240 0338
        MVI     G_02FB, R2                      ; 6A70   0282 02FB
        SUBI    #$0007, R2                      ; 6A72   033A 0007
        BPL     L_6A77                          ; 6A74   0203 0001

        CLRR    R2                              ; 6A76   01D2
L_6A77:
        MVO     R2,     G_02FB                  ; 6A77   0242 02FB
        NEGR    R2                              ; 6A79   0022
        ADD     G_02F9, R2                      ; 6A7A   02C2 02F9
        MVO     R2,     G_02F9                  ; 6A7C   0242 02F9
        SWAP    R2,     1                       ; 6A7E   0042
        ANDI    #$00FF, R2                      ; 6A7F   03BA 00FF
        MVO     R2,     G_032F                  ; 6A81   0242 032F
        SDBD                                    ; 6A83   0001
        ADDI    #$0403, R2                      ; 6A84   02FA 0003 0004
        MVO     R2,     G_0330                  ; 6A87   0242 0330
        MVI     G_01B0, R1                      ; 6A89   0281 01B0
        MVI     G_02FA, R3                      ; 6A8B   0283 02FA
        SUBI    #$0007, R3                      ; 6A8D   033B 0007
        BPL     L_6A92                          ; 6A8F   0203 0001

        CLRR    R3                              ; 6A91   01DB
L_6A92:
        MVO     R3,     G_02FA                  ; 6A92   0243 02FA
        ANDI    #$0002, R1                      ; 6A94   03B9 0002
        BEQ     L_6A99                          ; 6A96   0204 0001

        NEGR    R3                              ; 6A98   0023
L_6A99:
        ADD     G_02F8, R3                      ; 6A99   02C3 02F8
        MVO     R3,     G_02F8                  ; 6A9B   0243 02F8
        SWAP    R3,     1                       ; 6A9D   0043
        ANDI    #$00FF, R3                      ; 6A9E   03BB 00FF
        XORI    #$0200, R3                      ; 6AA0   03FB 0200
        MVO     R3,     G_0327                  ; 6AA2   0243 0327
        MVO     R3,     G_0328                  ; 6AA4   0243 0328
L_6AA6:
        EIS                                     ; 6AA6   0002
        DECR    R7                              ; 6AA7   0017
L_6AA8:
        SDBD                                    ; 6AA8   0001
        MVII    #$51B2, R0                      ; 6AA9   02B8 00B2 0051
        MVO     R0,     .ISRVEC.0               ; 6AAC   0240 0100
        SWAP    R0,     1                       ; 6AAE   0040
        MVO     R0,     .ISRVEC.1               ; 6AAF   0240 0101
        EIS                                     ; 6AB1   0002
        DECR    R7                              ; 6AB2   0017
L_6AB3:
        PSHR    R4                              ; 6AB3   0274
        PSHR    R1                              ; 6AB4   0271
        MVII    #$010F, R1                      ; 6AB5   02B9 010F
        PSHR    R2                              ; 6AB7   0272
        PSHR    R3                              ; 6AB8   0273
        MVI     G_010C, R2                      ; 6AB9   0282 010C
L_6ABB:
        ADD@    R1,     R0                      ; 6ABB   02C8
        CMPI    #$000A, R0                      ; 6ABC   0378 000A
        BMI     L_6ACE                          ; 6ABE   020B 000E

        CLRR    R3                              ; 6AC0   01DB
L_6AC1:
        INCR    R3                              ; 6AC1   000B
        SUBI    #$000A, R0                      ; 6AC2   0338 000A
        BPL     L_6AC1                          ; 6AC4   0223 0004

        ADDI    #$000A, R0                      ; 6AC6   02F8 000A
        DECR    R3                              ; 6AC8   0013
        MVO@    R0,     R1                      ; 6AC9   0248
        DECR    R1                              ; 6ACA   0011
        MOVR    R3,     R0                      ; 6ACB   0098
        BNEQ    L_6ABB                          ; 6ACC   022C 0012

L_6ACE:
        MVO@    R0,     R1                      ; 6ACE   0248
        CMP     G_010C, R2                      ; 6ACF   0342 010C
        BEQ     L_6B0F                          ; 6AD1   0204 003C

        MVI     G_0117, R0                      ; 6AD3   0280 0117
        CMPI    #$0009, R0                      ; 6AD5   0378 0009
        BPL     L_6AE3                          ; 6AD7   0203 000A

        INCR    R0                              ; 6AD9   0008
        MVO     R0,     G_0117                  ; 6ADA   0240 0117

        JSR     R5,     L_68B6                  ; 6ADC   0004 0168 00B6

        MVII    #$0018, R0                      ; 6ADF   02B8 0018
        MVO     R0,     G_0198                  ; 6AE1   0240 0198
L_6AE3:
        MVI     G_010A, R0                      ; 6AE3   0280 010A
        TSTR    R0                              ; 6AE5   0080
        BEQ     L_6B0F                          ; 6AE6   0204 0027

        MVII    #$00D0, R0                      ; 6AE8   02B8 00D0
        MVO     R0,     G_01D2                  ; 6AEA   0240 01D2
        MVII    #$0038, R0                      ; 6AEC   02B8 0038
        MVO     R0,     .PSG0.chan_enable       ; 6AEE   0240 01F8
        MVII    #$01F0, R4                      ; 6AF0   02BC 01F0
        MVII    #$00AA, R0                      ; 6AF2   02B8 00AA
        MVO@    R0,     R4                      ; 6AF4   0260
        ADDI    #$0004, R0                      ; 6AF5   02F8 0004
        MVO@    R0,     R4                      ; 6AF7   0260
        ADDI    #$0004, R0                      ; 6AF8   02F8 0004
        MVO@    R0,     R4                      ; 6AFA   0260
        INCR    R4                              ; 6AFB   000C
        CLRR    R0                              ; 6AFC   01C0
        MVO     R0,     G_0117                  ; 6AFD   0240 0117
        INCR    R0                              ; 6AFF   0008
        MVO@    R0,     R4                      ; 6B00   0260
        MVO@    R0,     R4                      ; 6B01   0260
        MVO@    R0,     R4                      ; 6B02   0260
L_6B03:
        PULR    R3                              ; 6B03   02B3
        PULR    R2                              ; 6B04   02B2
        PULR    R1                              ; 6B05   02B1
        PULR    R0                              ; 6B06   02B0
        SDBD                                    ; 6B07   0001
        MVII    #$6CF7, R0                      ; 6B08   02B8 00F7 006C
        MVO     R0,     G_031D                  ; 6B0B   0240 031D
        EIS                                     ; 6B0D   0002
        DECR    R7                              ; 6B0E   0017
L_6B0F:
        PULR    R3                              ; 6B0F   02B3
        PULR    R2                              ; 6B10   02B2
        PULR    R1                              ; 6B11   02B1
        PULR    R7                              ; 6B12   02B7
L_6B13:
        PSHR    R5                              ; 6B13   0275
        MOVR    R3,     R5                      ; 6B14   009D
        CLRR    R3                              ; 6B15   01DB
L_6B16:
        MVI@    R4,     R1                      ; 6B16   02A1
        CMPI    #$00FF, R1                      ; 6B17   0379 00FF
        BNEQ    L_6B33                          ; 6B19   020C 0018

        TSTR    R3                              ; 6B1B   009B
        BNEQ    L_6B32                          ; 6B1C   020C 0014

        JSR     R4,     L_6B26                  ; 6B1E   0004 0068 0326

        ADDR    R7,     R0                      ; 6B21   00F8
        ADDR    R7,     R2                      ; 6B22   00FA
        ADDR    R7,     R2                      ; 6B23   00FA
        ADDR    R7,     R2                      ; 6B24   00FA
        ADDR    R7,     R0                      ; 6B25   00F8
L_6B26:
        SUBI    #$0010, R5                      ; 6B26   033D 0010
        MVI@    R4,     R0                      ; 6B28   02A0
        MVO@    R0,     R5                      ; 6B29   0268
        MVI@    R4,     R0                      ; 6B2A   02A0
        MVO@    R0,     R5                      ; 6B2B   0268
        MVI@    R4,     R0                      ; 6B2C   02A0
        MVO@    R0,     R5                      ; 6B2D   0268
        MVI@    R4,     R0                      ; 6B2E   02A0
        MVO@    R0,     R5                      ; 6B2F   0268
        MVI@    R4,     R0                      ; 6B30   02A0
        MVO@    R0,     R5                      ; 6B31   0268
L_6B32:
        PULR    R7                              ; 6B32   02B7
L_6B33:
        ADDR    R1,     R3                      ; 6B33   00CB
        BNEQ    L_6B38                          ; 6B34   020C 0002

        ADDI    #$000A, R1                      ; 6B36   02F9 000A
L_6B38:
        MVI@    R4,     R2                      ; 6B38   02A2
        ADDR    R2,     R3                      ; 6B39   00D3
        BNEQ    L_6B3E                          ; 6B3A   020C 0002

        ADDI    #$000A, R2                      ; 6B3C   02FA 000A
L_6B3E:
        PSHR    R3                              ; 6B3E   0273
        MOVR    R1,     R3                      ; 6B3F   008B
        SLL     R1,     2                       ; 6B40   004D
        ADDR    R3,     R1                      ; 6B41   00D9
        MOVR    R2,     R3                      ; 6B42   0093
        SLL     R2,     2                       ; 6B43   004E
        ADDR    R3,     R2                      ; 6B44   00DA
        SDBD                                    ; 6B45   0001
        ADDI    #$6390, R1                      ; 6B46   02F9 0090 0063
        SDBD                                    ; 6B49   0001
        ADDI    #$6390, R2                      ; 6B4A   02FA 0090 0063
        MVII    #$0005, R3                      ; 6B4D   02BB 0005
L_6B4F:
        MVI@    R1,     R0                      ; 6B4F   0288
        SLL     R0,     2                       ; 6B50   004C
        SLL     R0,     2                       ; 6B51   004C
        XOR@    R2,     R0                      ; 6B52   03D0
        MVO@    R0,     R5                      ; 6B53   0268
        INCR    R1                              ; 6B54   0009
L_6B55:
        INCR    R2                              ; 6B55   000A
        DECR    R3                              ; 6B56   0013
        BNEQ    L_6B4F                          ; 6B57   022C 0009

        PULR    R3                              ; 6B59   02B3
        ADDI    #$000B, R5                      ; 6B5A   02FD 000B
        B       L_6B16                          ; 6B5C   0220 0047

L_6B5E:
        MVI     G_02F0, R3                      ; 6B5E   0283 02F0
        SWAP    R3,     1                       ; 6B60   0043
        ANDI    #$00FF, R3                      ; 6B61   03BB 00FF
        CLRR    R0                              ; 6B63   01C0
        MVII    #$00FF, R1                      ; 6B64   02B9 00FF
        MOVR    R1,     R2                      ; 6B66   008A
        SUBI    #$0005, R3                      ; 6B67   033B 0005
        BPL     L_6B7B                          ; 6B69   0203 0010

        ADDI    #$0008, R3                      ; 6B6B   02FB 0008
        ADDR    R7,     R3                      ; 6B6D   00FB
        ADDI    #$0005, R3                      ; 6B6E   02FB 0005
        MVI@    R3,     R0                      ; 6B70   0298
        B       L_6B8C                          ; 6B71   0200 0019

        ADDR    R7,     R7                      ; 6B73   00FF
        SARC    R3,     2                       ; 6B74   007F
        RSWD    R7                              ; 6B75   003F
        COMR    R7                              ; 6B76   001F
        INCR    R7                              ; 6B77   000F
        SETC                                    ; 6B78   0007
        DIS                                     ; 6B79   0003
        DECLE   $0001                           ; 6B7A   0001
L_6B7B:
        CMPI    #$0008, R3                      ; 6B7B   037B 0008
        BPL     L_6B85                          ; 6B7D   0203 0006

        ADDR    R7,     R3                      ; 6B7F   00FB
        SUBI    #$000D, R3                      ; 6B80   033B 000D
        MVI@    R3,     R1                      ; 6B82   0299
        B       L_6B8C                          ; 6B83   0200 0007

L_6B85:
        CLRR    R1                              ; 6B85   01C9
        SUBI    #$0008, R3                      ; 6B86   033B 0008
        ADDR    R7,     R3                      ; 6B88   00FB
        SUBI    #$0016, R3                      ; 6B89   033B 0016
        MVI@    R3,     R2                      ; 6B8B   029A
L_6B8C:
        XORI    #$00C0, R0                      ; 6B8C   03F8 00C0
        ANDI    #$00F7, R1                      ; 6B8E   03B9 00F7
        ANDI    #$00FD, R2                      ; 6B90   03BA 00FD
        MVO     R0,     G_014D                  ; 6B92   0240 014D
        MVO     R1,     G_015D                  ; 6B94   0241 015D
        MVO     R2,     G_016D                  ; 6B96   0242 016D
        MOVR    R5,     R7                      ; 6B98   00AF
L_6B99:
        PSHR    R5                              ; 6B99   0275
        MVII    #$0002, R3                      ; 6B9A   02BB 0002
        MVI     G_012C, R1                      ; 6B9C   0281 012C
        ANDI    #$0001, R1                      ; 6B9E   03B9 0001
        SLL     R1,     1                       ; 6BA0   0049
        MVII    #$0339, R4                      ; 6BA1   02BC 0339
        ADDR    R1,     R4                      ; 6BA3   00CC
        SLL     R1,     1                       ; 6BA4   0049
        MVII    #$01B4, R5                      ; 6BA5   02BD 01B4
        ADDR    R1,     R5                      ; 6BA7   00CD
L_6BA8:
        MVI@    R4,     R1                      ; 6BA8   02A1
        ANDI    #$03FF, R1                      ; 6BA9   03B9 03FF
        CMPI    #$0061, R1                      ; 6BAB   0379 0061
        BEQ     L_6BD7                          ; 6BAD   0204 0028

        CMPI    #$00D6, R1                      ; 6BAF   0379 00D6
        BEQ     L_6BBA                          ; 6BB1   0204 0007

        CLRR    R0                              ; 6BB3   01C0
        MVO@    R0,     R5                      ; 6BB4   0268
        INCR    R5                              ; 6BB5   000D
        DECR    R3                              ; 6BB6   0013
        BNEQ    L_6BA8                          ; 6BB7   022C 0010

        PULR    R7                              ; 6BB9   02B7
L_6BBA:
        SUBI    #$0009, R4                      ; 6BBA   033C 0009
        MVI@    R4,     R0                      ; 6BBC   02A0
        ANDI    #$007F, R0                      ; 6BBD   03B8 007F
        SLR     R0,     1                       ; 6BBF   0060
        MOVR    R0,     R1                      ; 6BC0   0081
        SLL     R0,     2                       ; 6BC1   004C
        ADDR    R1,     R0                      ; 6BC2   00C8
        SUBI    #$0009, R4                      ; 6BC3   033C 0009
        MVI@    R4,     R1                      ; 6BC5   02A1
        ANDI    #$00FF, R1                      ; 6BC6   03B9 00FF
        MOVR    R1,     R2                      ; 6BC8   008A
        SLR     R1,     2                       ; 6BC9   0065
        SLR     R1,     1                       ; 6BCA   0061
        ADDR    R1,     R0                      ; 6BCB   00C8
        ANDI    #$0007, R2                      ; 6BCC   03BA 0007
        SLL     R2,     1                       ; 6BCE   004A
        MVO@    R0,     R5                      ; 6BCF   0268
        MVO@    R2,     R5                      ; 6BD0   026A
        ADDI    #$0010, R4                      ; 6BD1   02FC 0010
        DECR    R3                              ; 6BD3   0013
        BNEQ    L_6BA8                          ; 6BD4   022C 002D

        PULR    R7                              ; 6BD6   02B7
L_6BD7:
        SUBI    #$0009, R4                      ; 6BD7   033C 0009
        MVI@    R4,     R0                      ; 6BD9   02A0
        CLRR    R2                              ; 6BDA   01D2
        CMPI    #$03FF, R0                      ; 6BDB   0378 03FF
        BMI     L_6BE1                          ; 6BDD   020B 0002

        MVII    #$0004, R2                      ; 6BDF   02BA 0004
L_6BE1:
        ANDI    #$007F, R0                      ; 6BE1   03B8 007F
        SLR     R0,     1                       ; 6BE3   0060
        MOVR    R0,     R1                      ; 6BE4   0081
        SLL     R0,     2                       ; 6BE5   004C
        ADDR    R1,     R0                      ; 6BE6   00C8
        SUBI    #$0009, R4                      ; 6BE7   033C 0009
        MVI@    R4,     R1                      ; 6BE9   02A1
        ADDR    R2,     R1                      ; 6BEA   00D1
        ANDI    #$00FF, R1                      ; 6BEB   03B9 00FF
        MOVR    R1,     R2                      ; 6BED   008A
        SLR     R1,     2                       ; 6BEE   0065
        SLR     R1,     1                       ; 6BEF   0061
        ADDR    R1,     R0                      ; 6BF0   00C8
        ANDI    #$0007, R2                      ; 6BF1   03BA 0007
        SLL     R2,     1                       ; 6BF3   004A
        XORI    #$0001, R2                      ; 6BF4   03FA 0001
        MVO@    R0,     R5                      ; 6BF6   0268
        MVO@    R2,     R5                      ; 6BF7   026A
        ADDI    #$0010, R4                      ; 6BF8   02FC 0010
        DECR    R3                              ; 6BFA   0013
        BNEQ    L_6BA8                          ; 6BFB   022C 0054

        PULR    R7                              ; 6BFD   02B7
L_6BFE:
        PSHR    R5                              ; 6BFE   0275
        MVI     G_01B1, R0                      ; 6BFF   0280 01B1
        TSTR    R0                              ; 6C01   0080
        BEQ     L_6C29                          ; 6C02   0204 0025

        MVI     G_01D1, R0                      ; 6C04   0280 01D1
        TSTR    R0                              ; 6C06   0080
        BNEQ    L_6C29                          ; 6C07   020C 0020

        MVII    #$0331, R4                      ; 6C09   02BC 0331
        MOVR    R4,     R5                      ; 6C0B   00A5
        MVI@    R4,     R0                      ; 6C0C   02A0
        ADDI    #$0008, R0                      ; 6C0D   02F8 0008
        MVO@    R0,     R5                      ; 6C0F   0268
        MVI@    R4,     R0                      ; 6C10   02A0
        ADDI    #$0008, R0                      ; 6C11   02F8 0008
        MVO@    R0,     R5                      ; 6C13   0268
        MVI@    R4,     R0                      ; 6C14   02A0
        ADDI    #$0008, R0                      ; 6C15   02F8 0008
        MVO@    R0,     R5                      ; 6C17   0268
        MVI@    R4,     R0                      ; 6C18   02A0
        ADDI    #$0008, R0                      ; 6C19   02F8 0008
        MVO@    R0,     R5                      ; 6C1B   0268
        MVI@    R4,     R0                      ; 6C1C   02A0
        ADDI    #$0008, R0                      ; 6C1D   02F8 0008
        MVO@    R0,     R5                      ; 6C1F   0268
        ANDI    #$007F, R0                      ; 6C20   03B8 007F
        CMPI    #$0068, R0                      ; 6C22   0378 0068
        BMI     L_6C29                          ; 6C24   020B 0003

        CLRR    R0                              ; 6C26   01C0
        MVO     R0,     G_032D                  ; 6C27   0240 032D
L_6C29:
        PULR    R7                              ; 6C29   02B7
L_6C2A:
        PSHR    R5                              ; 6C2A   0275
        MVI     G_01A0, R4                      ; 6C2B   0284 01A0
        DECR    R4                              ; 6C2D   0014
        BMI     L_6C66                          ; 6C2E   020B 0036

        MVO     R4,     G_01A0                  ; 6C30   0244 01A0
        MVI     G_02F1, R1                      ; 6C32   0281 02F1
        MVI@    R1,     R0                      ; 6C34   0288
        SDBD                                    ; 6C35   0001
        CMPI    #$0890, R0                      ; 6C36   0378 0090 0008
        BNEQ    L_6C66                          ; 6C39   020C 002B

        SUBI    #$0008, R1                      ; 6C3B   0339 0008
        MVI@    R1,     R0                      ; 6C3D   0288
        ANDI    #$007F, R0                      ; 6C3E   03B8 007F
        SLR     R0,     1                       ; 6C40   0060
        MOVR    R0,     R5                      ; 6C41   0085
        SLL     R0,     2                       ; 6C42   004C
        ADDR    R5,     R0                      ; 6C43   00E8
        SUBI    #$0008, R1                      ; 6C44   0339 0008
        MVI@    R1,     R1                      ; 6C46   0289
        ANDI    #$00FF, R1                      ; 6C47   03B9 00FF
        SLR     R1,     2                       ; 6C49   0065
        SLR     R1,     1                       ; 6C4A   0061
        INCR    R1                              ; 6C4B   0009
        MVI     G_032D, R3                      ; 6C4C   0283 032D
        ANDI    #$00FF, R3                      ; 6C4E   03BB 00FF
        SLR     R3,     2                       ; 6C50   0067
        SLR     R3,     1                       ; 6C51   0063
        SUBR    R1,     R3                      ; 6C52   010B
        ADDR    R1,     R0                      ; 6C53   00C8
        ADDI    #$01EB, R0                      ; 6C54   02F8 01EB
        CMPI    #$02F0, R0                      ; 6C56   0378 02F0
        BPL     L_6C66                          ; 6C58   0203 000C

        MOVR    R0,     R5                      ; 6C5A   0085
        ADDR    R4,     R4                      ; 6C5B   00E4
        SDBD                                    ; 6C5C   0001
        ADDI    #$63F3, R4                      ; 6C5D   02FC 00F3 0063
        SDBD                                    ; 6C60   0001
        MVI@    R4,     R0                      ; 6C61   02A0
L_6C62:
        MVO@    R0,     R5                      ; 6C62   0268
        DECR    R3                              ; 6C63   0013
        BNEQ    L_6C62                          ; 6C64   022C 0003

L_6C66:
        MVI     G_01A0, R0                      ; 6C66   0280 01A0
        ANDI    #$0001, R0                      ; 6C68   03B8 0001
        SLL     R0,     1                       ; 6C6A   0048
        MVO     R0,     G_01A1                  ; 6C6B   0240 01A1
        MVII    #$01A3, R4                      ; 6C6D   02BC 01A3
        MVII    #$0005, R3                      ; 6C6F   02BB 0005
        MVII    #$0339, R2                      ; 6C71   02BA 0339
L_6C73:
        MVI@    R4,     R5                      ; 6C73   02A5
        DECR    R5                              ; 6C74   0015
        BMI     L_6C81                          ; 6C75   020B 000A

        DECR    R4                              ; 6C77   0014
        MVO@    R5,     R4                      ; 6C78   0265
        ADDR    R5,     R5                      ; 6C79   00ED
        SDBD                                    ; 6C7A   0001
        ADDI    #$63DF, R5                      ; 6C7B   02FD 00DF 0063
        SDBD                                    ; 6C7E   0001
        MVI@    R5,     R0                      ; 6C7F   02A8
        MVO@    R0,     R2                      ; 6C80   0250
L_6C81:
        INCR    R2                              ; 6C81   000A
        DECR    R3                              ; 6C82   0013
        BNEQ    L_6C73                          ; 6C83   022C 0011

        PULR    R7                              ; 6C85   02B7
L_6C86:
        PSHR    R5                              ; 6C86   0275
        MVII    #$0228, R0                      ; 6C87   02B8 0228
        SLL     R0,     2                       ; 6C89   004C
        CMP     G_033D, R0                      ; 6C8A   0340 033D
        BNEQ    L_6CD3                          ; 6C8C   020C 0045

        SUBI    #$0010, R0                      ; 6C8E   0338 0010
        MVI     G_02F1, R1                      ; 6C90   0281 02F1
        MVO@    R0,     R1                      ; 6C92   0248
        MVO     R0,     G_033D                  ; 6C93   0240 033D
        MVII    #$0008, R0                      ; 6C95   02B8 0008
        MVO     R0,     G_01A0                  ; 6C97   0240 01A0

        JSR     R5,     L_68F0                  ; 6C99   0004 0168 00F0

        MVII    #$003D, R0                      ; 6C9C   02B8 003D
        MVO     R0,     G_0192                  ; 6C9E   0240 0192
        MVII    #$0012, R0                      ; 6CA0   02B8 0012
        MVO     R0,     G_0193                  ; 6CA2   0240 0193
        MVII    #$0032, R0                      ; 6CA4   02B8 0032

        JSR     R4,     L_6AB3                  ; 6CA6   0004 0068 02B3

L_6CA9:
        MVII    #$0115, R1                      ; 6CA9   02B9 0115
        MOVR    R7,     R2                      ; 6CAB   00BA
        MVI@    R1,     R0                      ; 6CAC   0288
        INCR    R0                              ; 6CAD   0008
        CMPI    #$000A, R0                      ; 6CAE   0378 000A
        BMI     L_6CB6                          ; 6CB0   020B 0004

        CLRR    R0                              ; 6CB2   01C0
        MVO@    R0,     R1                      ; 6CB3   0248
        DECR    R1                              ; 6CB4   0011
        MOVR    R2,     R7                      ; 6CB5   0097
L_6CB6:
        MVO@    R0,     R1                      ; 6CB6   0248
        MVII    #$01E5, R4                      ; 6CB7   02BC 01E5
        MVII    #$0102, R5                      ; 6CB9   02BD 0102
        MVI@    R4,     R0                      ; 6CBB   02A0
        MVO@    R0,     R5                      ; 6CBC   0268
        MVI@    R4,     R0                      ; 6CBD   02A0
        MVO@    R0,     R5                      ; 6CBE   0268
        MVI@    R4,     R0                      ; 6CBF   02A0
        MVO@    R0,     R5                      ; 6CC0   0268
        MVI@    R4,     R0                      ; 6CC1   02A0
        MVO@    R0,     R5                      ; 6CC2   0268
        MVI@    R4,     R0                      ; 6CC3   02A0
        MVO@    R0,     R5                      ; 6CC4   0268
        MVI@    R4,     R0                      ; 6CC5   02A0
        MVO@    R0,     R5                      ; 6CC6   0268
        MVI@    R4,     R0                      ; 6CC7   02A0
        MVO@    R0,     R5                      ; 6CC8   0268
        MVI@    R4,     R0                      ; 6CC9   02A0
        MVO@    R0,     R5                      ; 6CCA   0268
        MVI     G_0321, R0                      ; 6CCB   0280 0321
        MVO     R0,     G_0322                  ; 6CCD   0240 0322
        MVI     G_0324, R0                      ; 6CCF   0280 0324
        MVO     R0,     G_0323                  ; 6CD1   0240 0323
L_6CD3:
        PULR    R7                              ; 6CD3   02B7
L_6CD4:
        PSHR    R5                              ; 6CD4   0275
L_6CD5:
        MVI@    R1,     R0                      ; 6CD5   0288
        MVI@    R2,     R5                      ; 6CD6   0295
        MVO@    R0,     R2                      ; 6CD7   0250
        MVO@    R5,     R1                      ; 6CD8   024D
        INCR    R1                              ; 6CD9   0009
        INCR    R2                              ; 6CDA   000A
        DECR    R3                              ; 6CDB   0013
        BNEQ    L_6CD5                          ; 6CDC   022C 0008

        PULR    R7                              ; 6CDE   02B7
        EIS                                     ; 6CDF   0002
        CLRC                                    ; 6CE0   0006
        SETC                                    ; 6CE1   0007
        NEGR    R2                              ; 6CE2   0022
L_6CE3:
        GSWD    R0                              ; 6CE3   0030
        RRC     R0,     1                       ; 6CE4   0070
        ADDR    R7,     R0                      ; 6CE5   00F8
L_6CE6:
        NEGR    R0                              ; 6CE6   0020

        JSR     R4,     G_0C0E                  ; 6CE7   0004 000C 000E

        COMR    R7                              ; 6CEA   001F
        SWAP    R0,     2                       ; 6CEB   0044
        SLR     R0,     1                       ; 6CEC   0060
        ADDR    R4,     R0                      ; 6CED   00E0
        SWAP    R0,     1                       ; 6CEE   0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CEF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF3   0000 0000 0000 0000

        MVI     G_01D2, R0                      ; 6CF7   0280 01D2
        DECR    R0                              ; 6CF9   0010
        MVO     R0,     G_01D2                  ; 6CFA   0240 01D2
        SLR     R0,     2                       ; 6CFC   0064
        SLR     R0,     2                       ; 6CFD   0064
        MVII    #$01FB, R4                      ; 6CFE   02BC 01FB
        MVO@    R0,     R4                      ; 6D00   0260
        MVO@    R0,     R4                      ; 6D01   0260
        MVO@    R0,     R4                      ; 6D02   0260
        BNEQ    L_6D0B                          ; 6D03   020C 0006

        SDBD                                    ; 6D05   0001
        MVII    #$51B2, R0                      ; 6D06   02B8 00B2 0051
        MVO     R0,     G_031D                  ; 6D09   0240 031D

L_6D0B:
        JSR     R5,     L_6861                  ; 6D0B   0004 0168 0061

        MVI     G_012C, R0                      ; 6D0E   0280 012C
        SARC    R0,     1                       ; 6D10   0078
        BNC     L_6D16                          ; 6D11   0209 0003

        JSR     R5,     L_6C2A                  ; 6D13   0004 016C 002A

L_6D16:
        MVII    #$0003, R3                      ; 6D16   02BB 0003
        MVII    #$0150, R1                      ; 6D18   02B9 0150

        JSR     R4,     L_6D2C                  ; 6D1A   0004 006C 012C

        MOVR    R7,     R2                      ; 6D1D   00BA
        MOVR    R2,     R3                      ; 6D1E   0093
        MOVR    R5,     R2                      ; 6D1F   00AA
        MOVR    R5,     R2                      ; 6D20   00AA
        MOVR    R7,     R2                      ; 6D21   00BA
        MOVR    R5,     R3                      ; 6D22   00AB
        MOVR    R5,     R7                      ; 6D23   00AF
        MOVR    R5,     R2                      ; 6D24   00AA
        MOVR    R5,     R2                      ; 6D25   00AA
        MOVR    R5,     R2                      ; 6D26   00AA
        ADDR    R7,     R6                      ; 6D27   00FE
        ADDR    R7,     R6                      ; 6D28   00FE
        NEGR    R2                              ; 6D29   0022
        MOVR    R5,     R3                      ; 6D2A   00AB
        ADCR    R2                              ; 6D2B   002A
L_6D2C:
        MVII    #$0005, R0                      ; 6D2C   02B8 0005

        JSR     R5,     .EXEC.730               ; 6D2E   0004 0114 0330

        ADDI    #$000B, R5                      ; 6D31   02FD 000B
        MOVR    R5,     R1                      ; 6D33   00A9
        DECR    R3                              ; 6D34   0013
        BNEQ    L_6D2C                          ; 6D35   022C 000A

        EIS                                     ; 6D37   0002
        DECR    R7                              ; 6D38   0017
        DIS                                     ; 6D39   0003
        CLRR    R4                              ; 6D3A   01E4
        MVO     R4,     .STIC.VDLY              ; 6D3B   0244 0031
        MVO     R4,     .STIC.EDGE              ; 6D3D   0244 0032
        MVO     R4,     .STIC.CS.0              ; 6D3F   0244 0028
        MVII    #$0020, R0                      ; 6D41   02B8 0020

        JSR     R5,     X_FILL_ZERO             ; 6D43   0004 0114 0338

        MVII    #$000B, R0                      ; 6D46   02B8 000B
        MVO     R0,     .STIC.CS.1              ; 6D48   0240 0029
        MVII    #$01F0, R4                      ; 6D4A   02BC 01F0
        MVII    #$0100, R0                      ; 6D4C   02B8 0100

        JSR     R5,     X_FILL_ZERO             ; 6D4E   0004 0114 0338

        SDBD                                    ; 6D51   0001
        MVII    #$2680, R1                      ; 6D52   02B9 0080 0026
        MVII    #$028C, R4                      ; 6D55   02BC 028C
        MVO@    R1,     R4                      ; 6D57   0261
        SDBD                                    ; 6D58   0001
        MVII    #$0680, R1                      ; 6D59   02B9 0080 0006
        MVII    #$0013, R0                      ; 6D5C   02B8 0013

        JSR     R5,     X_FILL_MEM              ; 6D5E   0004 0114 0341
        JSR     R5,     L_573E                  ; 6D61   0004 0154 033E

        MVII    #$0007, R0                      ; 6D64   02B8 0007
        SDBD                                    ; 6D66   0001
        MVII    #$39F9, R1                      ; 6D67   02B9 00F9 0039

        JSR     R4,     L_6D74                  ; 6D6A   0004 006C 0174

        SARC    R2,     2                       ; 6D6D   007E
        SLR     R2,     2                       ; 6D6E   0066
        SLR     R2,     2                       ; 6D6F   0066
        SLR     R2,     2                       ; 6D70   0066
        SLR     R2,     2                       ; 6D71   0066
        SARC    R2,     2                       ; 6D72   007E
        DECLE   $0000                           ; 6D73   0000
L_6D74:
        JSR     R5,     .EXEC.730               ; 6D74   0004 0114 0330

        CLRR    R0                              ; 6D77   01C0
        MVII    #$0001, R2                      ; 6D78   02BA 0001
        MVII    #$02B2, R1                      ; 6D7A   02B9 02B2
        MVI     G_018C, R5                      ; 6D7C   0285 018C
        CMPI    #$00FE, R5                      ; 6D7E   037D 00FE
        BEQ     L_6D87                          ; 6D80   0204 0005

        MVII    #$0003, R0                      ; 6D82   02B8 0003
        CLRR    R2                              ; 6D84   01D2
        MVII    #$02A8, R1                      ; 6D85   02B9 02A8
L_6D87:
        MVII    #$0112, R3                      ; 6D87   02BB 0112
        MVII    #$010A, R4                      ; 6D89   02BC 010A
        MVI     G_018D, R5                      ; 6D8B   0285 018D
        TSTR    R5                              ; 6D8D   00AD
        BNEQ    L_6D95                          ; 6D8E   020C 0005

        CLRR    R2                              ; 6D90   01D2
        MVII    #$02AD, R1                      ; 6D91   02B9 02AD
        B       L_6DB8                          ; 6D93   0200 0023

L_6D95:
        JSR     R5,     L_6E2A                  ; 6D95   0004 016C 022A

        MVII    #$0257, R0                      ; 6D98   02B8 0257
        MVO     R0,     .STIC.X.0               ; 6D9A   0240 0000
        MVII    #$0346, R0                      ; 6D9C   02B8 0346
        MVO     R0,     .STIC.Y.0               ; 6D9E   0240 0008
        ADDI    #$029F, R0                      ; 6DA0   02F8 029F
        MVO     R0,     .STIC.A.0               ; 6DA2   0240 0010
        MVII    #$0003, R0                      ; 6DA4   02B8 0003
        CLRR    R2                              ; 6DA6   01D2
        MVII    #$02A8, R1                      ; 6DA7   02B9 02A8
        MVI     G_018C, R5                      ; 6DA9   0285 018C
        CMPI    #$00FE, R5                      ; 6DAB   037D 00FE
        BEQ     L_6DB4                          ; 6DAD   0204 0005

        CLRR    R0                              ; 6DAF   01C0
        MVII    #$0001, R2                      ; 6DB0   02BA 0001
        MVII    #$02B2, R1                      ; 6DB2   02B9 02B2
L_6DB4:
        MVII    #$0127, R3                      ; 6DB4   02BB 0127
        MVII    #$0120, R4                      ; 6DB6   02BC 0120

L_6DB8:
        JSR     R5,     L_6E2A                  ; 6DB8   0004 016C 022A

        MVII    #$00FE, R0                      ; 6DBB   02B8 00FE
        MVII    #$0102, R4                      ; 6DBD   02BC 0102

        JSR     R5,     X_FILL_ZERO             ; 6DBF   0004 0114 0338

        MVII    #$0050, R0                      ; 6DC2   02B8 0050
        MVII    #$02F0, R4                      ; 6DC4   02BC 02F0

        JSR     R5,     X_FILL_ZERO             ; 6DC6   0004 0114 0338

        MOVR    R7,     R0                      ; 6DC9   00B8
        ADDI    #$000A, R0                      ; 6DCA   02F8 000A
        MVO     R0,     .ISRVEC.0               ; 6DCC   0240 0100
        SWAP    R0,     1                       ; 6DCE   0040
        MVO     R0,     .ISRVEC.1               ; 6DCF   0240 0101
        J       L_5083                          ; 6DD1   0004 0350 0083

        PSHR    R5                              ; 6DD4   0275
        SDBD                                    ; 6DD5   0001
        MVII    #$0520, R0                      ; 6DD6   02B8 0020 0005
        MVO     R0,     .BTAB.7A                ; 6DD9   0240 027A
        MVO     R0,     .BTAB.88                ; 6DDB   0240 0288
        ADDI    #$0008, R0                      ; 6DDD   02F8 0008
        MVO     R0,     .BTAB.7B                ; 6DDF   0240 027B
        MVO     R0,     .BTAB.89                ; 6DE1   0240 0289
        MVI     G_012C, R0                      ; 6DE3   0280 012C
        INCR    R0                              ; 6DE5   0008
        MVO     R0,     G_012C                  ; 6DE6   0240 012C
        ANDI    #$000F, R0                      ; 6DE8   03B8 000F
        NEGR    R0                              ; 6DEA   0020
        BNEQ    L_6E0F                          ; 6DEB   020C 0022

        MVI     G_01ED, R1                      ; 6DED   0281 01ED
        MVII    #$0011, R4                      ; 6DEF   02BC 0011
        MVII    #$0007, R3                      ; 6DF1   02BB 0007
L_6DF3:
        MOVR    R7,     R2                      ; 6DF3   00BA
        ADDI    #$00B1, R2                      ; 6DF4   02FA 00B1
        CMPI    #$0089, R1                      ; 6DF6   0379 0089
        BMI     L_6DFC                          ; 6DF8   020B 0002

        SUBI    #$0089, R1                      ; 6DFA   0339 0089
L_6DFC:
        ADDR    R1,     R2                      ; 6DFC   00CA
        MVI@    R2,     R5                      ; 6DFD   0295
        SDBD                                    ; 6DFE   0001
        XORI    #$3000, R5                      ; 6DFF   03FD 0000 0030
        MVO@    R5,     R4                      ; 6E02   0265
        INCR    R1                              ; 6E03   0009
        DECR    R3                              ; 6E04   0013
        BNEQ    L_6DF3                          ; 6E05   022C 0013

        SUBI    #$0006, R1                      ; 6E07   0339 0006
        BPL     L_6E0D                          ; 6E09   0203 0002

        ADDI    #$0089, R1                      ; 6E0B   02F9 0089
L_6E0D:
        MVO     R1,     G_01ED                  ; 6E0D   0241 01ED
L_6E0F:
        ADDI    #$022C, R0                      ; 6E0F   02F8 022C
        MVII    #$0001, R4                      ; 6E11   02BC 0001
        MVII    #$0009, R5                      ; 6E13   02BD 0009
        MVII    #$0039, R1                      ; 6E15   02B9 0039
        MVII    #$0007, R3                      ; 6E17   02BB 0007
L_6E19:
        MVO@    R0,     R4                      ; 6E19   0260
        ADDI    #$0010, R0                      ; 6E1A   02F8 0010
        MVO@    R1,     R5                      ; 6E1C   0269
        DECR    R3                              ; 6E1D   0013
        BNEQ    L_6E19                          ; 6E1E   022C 0006

        MVI     G_033F, R0                      ; 6E20   0280 033F
        INCR    R0                              ; 6E22   0008
        BEQ     L_6E29                          ; 6E23   0204 0004

        MVO     R0,     G_033F                  ; 6E25   0240 033F
        MVO     R0,     .STIC.VIDEN             ; 6E27   0240 0020
L_6E29:
        PULR    R7                              ; 6E29   02B7
L_6E2A:
        PSHR    R5                              ; 6E2A   0275
        PSHR    R3                              ; 6E2B   0273
        MOVR    R1,     R5                      ; 6E2C   008D
        ADDI    #$0011, R2                      ; 6E2D   02FA 0011
        SLL     R2,     2                       ; 6E2F   004E
        SLL     R2,     1                       ; 6E30   004A
        ADDR    R0,     R2                      ; 6E31   00C2
        MVO@    R2,     R5                      ; 6E32   026A
        ADDI    #$000E, R5                      ; 6E33   02FD 000E
        MVI@    R4,     R1                      ; 6E35   02A1
        TSTR    R1                              ; 6E36   0089
        BEQ     L_6E50                          ; 6E37   0204 0017

        JSR     R4,     L_6E44                  ; 6E39   0004 006C 0244

        CMPR    R5,     R0                      ; 6E3C   0168
        MVO@    R0,     R1                      ; 6E3D   0248
        MOVR    R1,     R0                      ; 6E3E   0088
        MOVR    R1,     R0                      ; 6E3F   0088
        MVO@    R0,     R1                      ; 6E40   0248
        DECLE   $0278                           ; 6E41   0278

        PSHR    R0                              ; 6E42   0270
        INCR    R0                              ; 6E43   0008
L_6E44:
        SUBI    #$0002, R5                      ; 6E44   033D 0002
        MVII    #$0008, R2                      ; 6E46   02BA 0008
L_6E48:
        MVI@    R4,     R1                      ; 6E48   02A1
        XORR    R0,     R1                      ; 6E49   01C1
        MVO@    R1,     R5                      ; 6E4A   0269
        DECR    R2                              ; 6E4B   0012
        BNEQ    L_6E48                          ; 6E4C   022C 0005
        B       L_6E6C                          ; 6E4E   0200 001C

L_6E50:
        MVII    #$0005, R2                      ; 6E50   02BA 0005
        CLRR    R3                              ; 6E52   01DB
L_6E53:
        MVI@    R4,     R1                      ; 6E53   02A1
        ADDR    R1,     R3                      ; 6E54   00CB
        BEQ     L_6E63                          ; 6E55   0204 000C

        TSTR    R1                              ; 6E57   0089
        BNEQ    L_6E5E                          ; 6E58   020C 0004

        MVII    #$027E, R1                      ; 6E5A   02B9 027E
        B       L_6E61                          ; 6E5C   0200 0003

L_6E5E:
        ADDI    #$0010, R1                      ; 6E5E   02F9 0010
        SLL     R1,     1                       ; 6E60   0049
L_6E61:
        SLL     R1,     2                       ; 6E61   004D
        XORR    R0,     R1                      ; 6E62   01C1
L_6E63:
        MVO@    R1,     R5                      ; 6E63   0269
        DECR    R2                              ; 6E64   0012
        BNEQ    L_6E53                          ; 6E65   022C 0013

        MVII    #$027E, R1                      ; 6E67   02B9 027E
        SLL     R1,     2                       ; 6E69   004D
        ADDR    R0,     R1                      ; 6E6A   00C1
        MVO@    R1,     R5                      ; 6E6B   0269
L_6E6C:
        ADDI    #$000C, R5                      ; 6E6C   02FD 000C
        MVII    #$0278, R1                      ; 6E6E   02B9 0278
        SLL     R1,     2                       ; 6E70   004D
        MVO@    R1,     R5                      ; 6E71   0269
        ADDI    #$0008, R1                      ; 6E72   02F9 0008
        MVO@    R1,     R5                      ; 6E74   0269
        ADDI    #$0008, R1                      ; 6E75   02F9 0008
        MVO@    R1,     R5                      ; 6E77   0269
        INCR    R5                              ; 6E78   000D
        PULR    R4                              ; 6E79   02B4
        MVII    #$0004, R2                      ; 6E7A   02BA 0004
        CLRR    R3                              ; 6E7C   01DB
L_6E7D:
        MVI@    R4,     R1                      ; 6E7D   02A1
        ADDR    R1,     R3                      ; 6E7E   00CB
        BEQ     L_6E8D                          ; 6E7F   0204 000C

        TSTR    R1                              ; 6E81   0089
        BNEQ    L_6E88                          ; 6E82   020C 0004

        MVII    #$027E, R1                      ; 6E84   02B9 027E
        B       L_6E8B                          ; 6E86   0200 0003

L_6E88:
        ADDI    #$0010, R1                      ; 6E88   02F9 0010
        SLL     R1,     1                       ; 6E8A   0049
L_6E8B:
        SLL     R1,     2                       ; 6E8B   004D
        XORR    R0,     R1                      ; 6E8C   01C1
L_6E8D:
        MVO@    R1,     R5                      ; 6E8D   0269
        DECR    R2                              ; 6E8E   0012
        BNEQ    L_6E7D                          ; 6E8F   022C 0013

        SUBI    #$0030, R5                      ; 6E91   033D 0030
        MVII    #$0006, R2                      ; 6E93   02BA 0006

        JSR     R4,     L_6E9E                  ; 6E95   0004 006C 029E

        ANDR    R0,     R0                      ; 6E98   0180
        MVO@    R0,     R4                      ; 6E99   0260
        SKIP                                    ; 6E9A   0208
        ADD@    R1,     R0                      ; 6E9B   02C8
        DECLE   $0228                           ; 6E9C   0228

        MVI@    R2,     R0                      ; 6E9D   0290
L_6E9E:
        MVI@    R4,     R1                      ; 6E9E   02A1
        XORR    R0,     R1                      ; 6E9F   01C1
        MVO@    R1,     R5                      ; 6EA0   0269
        DECR    R2                              ; 6EA1   0012
        BNEQ    L_6E9E                          ; 6EA2   022C 0005

        PULR    R7                              ; 6EA4   02B7
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6EA9   0000 0000 0000

        RRC     R0,     1                       ; 6EAC   0070
        RRC     R0,     1                       ; 6EAD   0070
        RRC     R0,     1                       ; 6EAE   0070
        SUBR    R7,     R0                      ; 6EAF   0138
        SKIP                                    ; 6EB0   0208
        MVO@    R0,     R5                      ; 6EB1   0268
        DECLE   $0228,  $0000                   ; 6EB2   0228 0000

        CMPR    R7,     R0                      ; 6EB4   0178
        PULR    R0                              ; 6EB5   02B0
        DECLE   $0228                           ; 6EB6   0228

        MVI@    R2,     R0                      ; 6EB7   0290
        RRC     R0,     1                       ; 6EB8   0070
        RRC     R0,     1                       ; 6EB9   0070
        RRC     R0,     1                       ; 6EBA   0070
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EBB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6EBF   0000 0000 0000

        SUBR    R3,     R0                      ; 6EC2   0118
        DECLE   $0278                           ; 6EC3   0278

        PSHR    R0                              ; 6EC4   0270
        DECLE   $0218,  $0228                   ; 6EC5   0218 0228

        MVO@    R0,     R1                      ; 6EC7   0248
        PULR    R0                              ; 6EC8   02B0
        DECLE   $0228                           ; 6EC9   0228

        B       L_6ECB                          ; 6ECA   0220 0000

        SKIP                                    ; 6ECC   0208
        PSHR    R0                              ; 6ECD   0270
        B       L_6ECF                          ; 6ECE   0220 0000
        B       L_6CA9                          ; 6ED0   0220 0228

        MVI@    R3,     R0                      ; 6ED2   0298
        MVO@    R0,     R1                      ; 6ED3   0248
        DECLE   $0238                           ; 6ED4   0238

        PSHR    R0                              ; 6ED5   0270
        DECLE   $0228                           ; 6ED6   0228

        B       L_6ED8                          ; 6ED7   0220 0000

        DECLE   $0210                           ; 6ED9   0210

        ADD@    R1,     R0                      ; 6EDA   02C8
        DECLE   $0000                           ; 6EDB   0000

        SUBR    R3,     R0                      ; 6EDC   0118
        SKIP                                    ; 6EDD   0208
        MVI@    R2,     R0                      ; 6EDE   0290
        DECLE   $0278                           ; 6EDF   0278

        MVO@    R0,     R4                      ; 6EE0   0260
        DECLE   $0000                           ; 6EE1   0000

        ANDR    R3,     R0                      ; 6EE2   0198
        MVO     R0,     .BTAB.08                ; 6EE3   0240 0208
        MVII    #$0070, R0                      ; 6EE5   02B8 0070
        RRC     R0,     1                       ; 6EE7   0070
        RRC     R0,     1                       ; 6EE8   0070
        SUBR    R1,     R0                      ; 6EE9   0108
        B       L_6CE3                          ; 6EEA   0220 0208

        MVI     .BTAB.A0,R0                     ; 6EEC   0280 02A0
        DECLE   $0228                           ; 6EEE   0228

        B       L_6EF0                          ; 6EEF   0220 0000

        DECLE   $0210                           ; 6EF1   0210

        ADD@    R1,     R0                      ; 6EF2   02C8
        DECLE   $0000                           ; 6EF3   0000

        ANDR    R0,     R0                      ; 6EF4   0180
        DECLE   $0228                           ; 6EF5   0228

        MVI@    R4,     R0                      ; 6EF6   02A0
        DECLE   $0228                           ; 6EF7   0228

        MVI@    R2,     R0                      ; 6EF8   0290
        DECLE   $0000                           ; 6EF9   0000

        CMPR    R3,     R0                      ; 6EFA   0158
        SKIP                                    ; 6EFB   0208
        MVO@    R0,     R5                      ; 6EFC   0268
        MVO@    R0,     R1                      ; 6EFD   0248
        PSHR    R0                              ; 6EFE   0270
        MVI@    R3,     R0                      ; 6EFF   0298
        MVO@    R0,     R3                      ; 6F00   0258
        MVO@    R0,     R1                      ; 6F01   0248
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F02   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6F06   0000 0000 0000

        SUBR    R3,     R1                      ; 6F09   0119
        DECLE   $0279                           ; 6F0A   0279

        MVI     .BTAB.C9,R1                     ; 6F0B   0281 02C9
        MVI@    R2,     R1                      ; 6F0D   0291
        MVO@    R1,     R1                      ; 6F0E   0249
        DECLE   $0239                           ; 6F0F   0239

        MVO     R1,     .BTAB.A1                ; 6F10   0241 02A1
        DECLE   $0001                           ; 6F12   0001

        TSTR    R1                              ; 6F13   0089
        ADDR    R1,     R1                      ; 6F14   00C9
        ADDR    R0,     R1                      ; 6F15   00C1
        MOVR    R2,     R1                      ; 6F16   0091
        SLR     R1,     1                       ; 6F17   0061
        DECLE   $0001                           ; 6F18   0001

        TSTR    R1                              ; 6F19   0089
        ADDR    R1,     R1                      ; 6F1A   00C9
        ADDR    R0,     R1                      ; 6F1B   00C1
        MOVR    R3,     R1                      ; 6F1C   0099
        DECLE   $0001                           ; 6F1D   0001

        SUBR    R1,     R1                      ; 6F1E   0109
        DECLE   $0219                           ; 6F1F   0219

        MVI@    R4,     R1                      ; 6F20   02A1
        MVO@    R1,     R1                      ; 6F21   0249
        PULR    R1                              ; 6F22   02B1
        MVO@    R1,     R1                      ; 6F23   0249
        MVI@    R3,     R1                      ; 6F24   0299
        MVO@    R1,     R1                      ; 6F25   0249
        DECLE   $0279                           ; 6F26   0279

        PSHR    R1                              ; 6F27   0271
        SLR     R1,     1                       ; 6F28   0061
        DECLE   $0001                           ; 6F29   0001

        CMPR    R1,     R1                      ; 6F2A   0149
        PSHR    R1                              ; 6F2B   0271
        DECLE   $0219                           ; 6F2C   0219

        RRC     R1,     1                       ; 6F2D   0071
        XORI    #$03FF, R7                      ; 6F2E   03FF 03FF
        XORI    #$03FF, R7                      ; 6F30   03FF 03FF
        XORI    #$03FF, R7                      ; 6F32   03FF 03FF
        XORI    #$03FF, R7                      ; 6F34   03FF 03FF
        XORI    #$03FF, R7                      ; 6F36   03FF 03FF
        XORI    #$03FF, R7                      ; 6F38   03FF 03FF
        XORI    #$03FF, R7                      ; 6F3A   03FF 03FF
        XORI    #$03FF, R7                      ; 6F3C   03FF 03FF
        XORI    #$03FF, R7                      ; 6F3E   03FF 03FF
        XORI    #$03FF, R7                      ; 6F40   03FF 03FF
        XORI    #$03FF, R7                      ; 6F42   03FF 03FF
        XORI    #$03FF, R7                      ; 6F44   03FF 03FF
        XORI    #$03FF, R7                      ; 6F46   03FF 03FF
        XORI    #$03FF, R7                      ; 6F48   03FF 03FF
        XORI    #$03FF, R7                      ; 6F4A   03FF 03FF
        XORI    #$03FF, R7                      ; 6F4C   03FF 03FF
        XORI    #$03FF, R7                      ; 6F4E   03FF 03FF
        XORI    #$03FF, R7                      ; 6F50   03FF 03FF
        XORI    #$03FF, R7                      ; 6F52   03FF 03FF
        XORI    #$03FF, R7                      ; 6F54   03FF 03FF
        XORI    #$03FF, R7                      ; 6F56   03FF 03FF
        XORI    #$03FF, R7                      ; 6F58   03FF 03FF
        XORI    #$03FF, R7                      ; 6F5A   03FF 03FF
        XORI    #$03FF, R7                      ; 6F5C   03FF 03FF
        XORI    #$03FF, R7                      ; 6F5E   03FF 03FF
        XORI    #$03FF, R7                      ; 6F60   03FF 03FF
        XORI    #$03FF, R7                      ; 6F62   03FF 03FF
        XORI    #$03FF, R7                      ; 6F64   03FF 03FF
        XORI    #$03FF, R7                      ; 6F66   03FF 03FF
        XORI    #$03FF, R7                      ; 6F68   03FF 03FF
        XORI    #$03FF, R7                      ; 6F6A   03FF 03FF
        XORI    #$03FF, R7                      ; 6F6C   03FF 03FF
        XORI    #$03FF, R7                      ; 6F6E   03FF 03FF
        XORI    #$03FF, R7                      ; 6F70   03FF 03FF
        XORI    #$03FF, R7                      ; 6F72   03FF 03FF
        XORI    #$03FF, R7                      ; 6F74   03FF 03FF
        XORI    #$03FF, R7                      ; 6F76   03FF 03FF
        XORI    #$03FF, R7                      ; 6F78   03FF 03FF
        XORI    #$03FF, R7                      ; 6F7A   03FF 03FF
        XORI    #$03FF, R7                      ; 6F7C   03FF 03FF
        XORI    #$03FF, R7                      ; 6F7E   03FF 03FF
        XORI    #$03FF, R7                      ; 6F80   03FF 03FF
        XORI    #$03FF, R7                      ; 6F82   03FF 03FF
        XORI    #$03FF, R7                      ; 6F84   03FF 03FF
        XORI    #$03FF, R7                      ; 6F86   03FF 03FF
        XORI    #$03FF, R7                      ; 6F88   03FF 03FF
        XORI    #$03FF, R7                      ; 6F8A   03FF 03FF
        XORI    #$03FF, R7                      ; 6F8C   03FF 03FF
        XORI    #$03FF, R7                      ; 6F8E   03FF 03FF
        XORI    #$03FF, R7                      ; 6F90   03FF 03FF
        XORI    #$03FF, R7                      ; 6F92   03FF 03FF
        XORI    #$03FF, R7                      ; 6F94   03FF 03FF
        XORI    #$03FF, R7                      ; 6F96   03FF 03FF
        XORI    #$03FF, R7                      ; 6F98   03FF 03FF
        XORI    #$03FF, R7                      ; 6F9A   03FF 03FF
        XORI    #$03FF, R7                      ; 6F9C   03FF 03FF
        XORI    #$03FF, R7                      ; 6F9E   03FF 03FF
        XORI    #$03FF, R7                      ; 6FA0   03FF 03FF
        XORI    #$03FF, R7                      ; 6FA2   03FF 03FF
        XORI    #$03FF, R7                      ; 6FA4   03FF 03FF
        XORI    #$03FF, R7                      ; 6FA6   03FF 03FF
        XORI    #$03FF, R7                      ; 6FA8   03FF 03FF
        XORI    #$03FF, R7                      ; 6FAA   03FF 03FF
        XORI    #$03FF, R7                      ; 6FAC   03FF 03FF
        XORI    #$03FF, R7                      ; 6FAE   03FF 03FF
        XORI    #$03FF, R7                      ; 6FB0   03FF 03FF
        XORI    #$03FF, R7                      ; 6FB2   03FF 03FF
        XORI    #$03FF, R7                      ; 6FB4   03FF 03FF
        XORI    #$03FF, R7                      ; 6FB6   03FF 03FF
        XORI    #$03FF, R7                      ; 6FB8   03FF 03FF
        XORI    #$03FF, R7                      ; 6FBA   03FF 03FF
        XORI    #$03FF, R7                      ; 6FBC   03FF 03FF
        XORI    #$03FF, R7                      ; 6FBE   03FF 03FF
        XORI    #$03FF, R7                      ; 6FC0   03FF 03FF
        XORI    #$03FF, R7                      ; 6FC2   03FF 03FF
        XORI    #$03FF, R7                      ; 6FC4   03FF 03FF
        XORI    #$03FF, R7                      ; 6FC6   03FF 03FF
        XORI    #$03FF, R7                      ; 6FC8   03FF 03FF
        XORI    #$03FF, R7                      ; 6FCA   03FF 03FF
        XORI    #$03FF, R7                      ; 6FCC   03FF 03FF
        XORI    #$03FF, R7                      ; 6FCE   03FF 03FF
        XORI    #$03FF, R7                      ; 6FD0   03FF 03FF
        XORI    #$03FF, R7                      ; 6FD2   03FF 03FF
        XORI    #$03FF, R7                      ; 6FD4   03FF 03FF
        XORI    #$03FF, R7                      ; 6FD6   03FF 03FF
        XORI    #$03FF, R7                      ; 6FD8   03FF 03FF
        XORI    #$03FF, R7                      ; 6FDA   03FF 03FF
        XORI    #$03FF, R7                      ; 6FDC   03FF 03FF
        XORI    #$03FF, R7                      ; 6FDE   03FF 03FF
        XORI    #$03FF, R7                      ; 6FE0   03FF 03FF
        XORI    #$03FF, R7                      ; 6FE2   03FF 03FF
        XORI    #$03FF, R7                      ; 6FE4   03FF 03FF
        XORI    #$03FF, R7                      ; 6FE6   03FF 03FF
        XORI    #$03FF, R7                      ; 6FE8   03FF 03FF
        XORI    #$03FF, R7                      ; 6FEA   03FF 03FF
        XORI    #$03FF, R7                      ; 6FEC   03FF 03FF
        XORI    #$03FF, R7                      ; 6FEE   03FF 03FF
        XORI    #$03FF, R7                      ; 6FF0   03FF 03FF
        XORI    #$03FF, R7                      ; 6FF2   03FF 03FF
        XORI    #$03FF, R7                      ; 6FF4   03FF 03FF
        XORI    #$03FF, R7                      ; 6FF6   03FF 03FF
        XORI    #$03FF, R7                      ; 6FF8   03FF 03FF
        XORI    #$03FF, R7                      ; 6FFA   03FF 03FF
        XORI    #$03FF, R7                      ; 6FFC   03FF 03FF
        XORI    #$0005, R7                      ; 6FFE   03FF 0005
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;; ======================================================================== ;;
