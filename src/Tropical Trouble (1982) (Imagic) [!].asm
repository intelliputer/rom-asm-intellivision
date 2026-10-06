
        ORG     $5000
.HEADER:
        BIDECLE $0000           ; 5000  End of timer table

        BIDECLE $5000           ; 5002  Ptr: EXEC timer table
        BIDECLE $5017           ; 5004  Ptr: Start of game
        BIDECLE $500F           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $500D           ; 5008  Ptr: GRAM init sequence
        BIDECLE $500F           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0001           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
.TITLE:
        DECLE   $0052           ; 500F  Cartridge year
        STRING  "I"                             ; 5010  Title string
        STRING  "MA"            ; 5011  Color Stack init (2, 3)
        STRING  "G"             ; 5013  Border color init

        STRING  "IC"                            ; 5014   0049 0043
        DECLE   $0000                           ; 5016  

.TITLECODE:
        DIS                                     ; 5017   0003
        SDBD                                    ; 5018   0001
        MVII    #$538B, R0                      ; 5019   02B8 008B 0053
        MVO     R0,     .ISRVEC.0               ; 501C   0240 0100
        SWAP    R0,     1                       ; 501E   0040
        MVO     R0,     .ISRVEC.1               ; 501F   0240 0101
        MVII    #$02FB, R6                      ; 5021   02BE 02FB
        MVII    #$00F0, R0                      ; 5023   02B8 00F0
        MVII    #$0200, R4                      ; 5025   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5027   0004 0114 0338

        MVII    #$0325, R4                      ; 502A   02BC 0325
        MVII    #$0047, R0                      ; 502C   02B8 0047

        JSR     R5,     X_FILL_ZERO             ; 502E   0004 0114 0338

        MVII    #$0102, R4                      ; 5031   02BC 0102
        MVII    #$00EE, R0                      ; 5033   02B8 00EE

        JSR     R5,     X_FILL_ZERO             ; 5035   0004 0114 0338

        SDBD                                    ; 5038   0001
        MVII    #$56CE, R0                      ; 5039   02B8 00CE 0056
        MVO     R0,     G_035D                  ; 503C   0240 035D
        MVII    #$0001, R0                      ; 503E   02B8 0001
        MVO     R0,     G_0147                  ; 5040   0240 0147
        MVII    #$0002, R0                      ; 5042   02B8 0002
        MVO     R0,     G_0116                  ; 5044   0240 0116
        MVO     R0,     G_010E                  ; 5046   0240 010E
        MVO     R0,     G_0119                  ; 5048   0240 0119
        SDBD                                    ; 504A   0001
        MVII    #$FFFF, R0                      ; 504B   02B8 00FF 00FF
        MVO     R0,     G_035E                  ; 504E   0240 035E
        MVII    #$0008, R2                      ; 5050   02BA 0008
        SWAP    R2,     1                       ; 5052   0042
        MVII    #$0008, R1                      ; 5053   02B9 0008
        SDBD                                    ; 5055   0001
        MVII    #$56A5, R4                      ; 5056   02BC 00A5 0056
        MVII    #$0335, R5                      ; 5059   02BD 0335
L_505B:
        MVI@    R4,     R0                      ; 505B   02A0
        XORR    R2,     R0                      ; 505C   01D0
        MVO@    R0,     R5                      ; 505D   0268
        DECR    R1                              ; 505E   0011
        BNEQ    L_505B                          ; 505F   022C 0005

        MVII    #$0175, R4                      ; 5061   02BC 0175
        MVII    #$0005, R2                      ; 5063   02BA 0005
L_5065:
        MVO@    R0,     R4                      ; 5065   0260
        DECR    R2                              ; 5066   0012
        BNEQ    L_5065                          ; 5067   022C 0003

        EIS                                     ; 5069   0002
L_506A:
        MVI     G_0119, R0                      ; 506A   0280 0119
        TSTR    R0                              ; 506C   0080
        BNEQ    L_506A                          ; 506D   022C 0004

        JSR     R5,     L_62F4                  ; 506F   0004 0160 02F4
L_5072:
        JSR     R5,     L_5086                  ; 5072   0004 0150 0086
        JSR     R5,     L_50BA                  ; 5075   0004 0150 00BA
        JSR     R5,     L_50DF                  ; 5078   0004 0150 00DF
        JSR     R5,     L_5140                  ; 507B   0004 0150 0140
        JSR     R5,     .EXEC.4F1               ; 507E   0004 0114 00F1
        JSR     R5,     .EXEC.AAD               ; 5081   0004 0118 02AD

        B       L_5072                          ; 5084   0220 0013

L_5086:
        PSHR    R5                              ; 5086   0275
        MVI     G_0118, R0                      ; 5087   0280 0118
        TSTR    R0                              ; 5089   0080
        BNEQ    L_50B9                          ; 508A   020C 002D

        MVII    #$0003, R0                      ; 508C   02B8 0003
        MVO     R0,     G_0118                  ; 508E   0240 0118
        SDBD                                    ; 5090   0001
        MVII    #$56BC, R4                      ; 5091   02BC 00BC 0056
        MVII    #$0167, R3                      ; 5094   02BB 0167
L_5096:
        MVI@    R3,     R0                      ; 5096   0298

        JSR     R5,     X_EXT_SIGN_LO           ; 5097   0004 0114 0268

        TSTR    R0                              ; 509A   0080
        BMI     L_50B0                          ; 509B   020B 0013
        BEQ     L_50A2                          ; 509D   0204 0003

        DECR    R0                              ; 509F   0010
        BNEQ    L_50B0                          ; 50A0   020C 000E

L_50A2:
        MVI@    R4,     R0                      ; 50A2   02A0
        MVO@    R0,     R3                      ; 50A3   0258
        PSHR    R4                              ; 50A4   0274
        PSHR    R3                              ; 50A5   0273
        SDBD                                    ; 50A6   0001
        MVII    #$50AC, R5                      ; 50A7   02BD 00AC 0050
        SDBD                                    ; 50AA   0001
        MVI@    R4,     R7                      ; 50AB   02A7

        PULR    R3                              ; 50AC   02B3
        PULR    R4                              ; 50AD   02B4
        B       L_50B2                          ; 50AE   0200 0002

L_50B0:
        MVO@    R0,     R3                      ; 50B0   0258
        INCR    R4                              ; 50B1   000C
L_50B2:
        INCR    R3                              ; 50B2   000B
        ADDI    #$0002, R4                      ; 50B3   02FC 0002
        CMPI    #$016D, R3                      ; 50B5   037B 016D
        BLT     L_5096                          ; 50B7   0225 0022
L_50B9:
        PULR    R7                              ; 50B9   02B7

L_50BA:
        PSHR    R5                              ; 50BA   0275
        CLRR    R1                              ; 50BB   01C9
        DIS                                     ; 50BC   0003
        MVI     G_0117, R2                      ; 50BD   0282 0117
        MVO     R1,     G_0117                  ; 50BF   0241 0117
        EIS                                     ; 50C1   0002
        MVII    #$033D, R3                      ; 50C2   02BB 033D
L_50C4:
        RRC     R2,     1                       ; 50C4   0072
        BNC     L_50D9                          ; 50C5   0209 0012

        MVI@    R3,     R4                      ; 50C7   029C
        TSTR    R4                              ; 50C8   00A4
        BEQ     L_50D9                          ; 50C9   0204 000E

        ADDI    #$0000, R4                      ; 50CB   02FC 0000
        SDBD                                    ; 50CD   0001
        MVII    #$50D7, R5                      ; 50CE   02BD 00D7 0050
        PSHR    R2                              ; 50D1   0272
        PSHR    R3                              ; 50D2   0273
        SUBI    #$033D, R3                      ; 50D3   033B 033D
        SDBD                                    ; 50D5   0001
        MVI@    R4,     R7                      ; 50D6   02A7

        PULR    R3                              ; 50D7   02B3
        PULR    R2                              ; 50D8   02B2
L_50D9:
        INCR    R3                              ; 50D9   000B
        CMPI    #$0344, R3                      ; 50DA   037B 0344
        BLE     L_50C4                          ; 50DC   0226 0019
        PULR    R7                              ; 50DE   02B7

L_50DF:
        PSHR    R5                              ; 50DF   0275
        MVII    #$0355, R3                      ; 50E0   02BB 0355
        MVII    #$0325, R2                      ; 50E2   02BA 0325
L_50E4:
        CLRR    R5                              ; 50E4   01ED
        MVI@    R2,     R0                      ; 50E5   0290
        ANDI    #$0100, R0                      ; 50E6   03B8 0100
        BNEQ    L_50EB                          ; 50E8   020C 0001

        INCR    R5                              ; 50EA   000D
L_50EB:
        ADDI    #$0018, R2                      ; 50EB   02FA 0018
        MVI@    R2,     R4                      ; 50ED   0294
        TSTR    R4                              ; 50EE   00A4
        BNEQ    L_50F2                          ; 50EF   020C 0001

        INCR    R5                              ; 50F1   000D
L_50F2:
        CLRR    R1                              ; 50F2   01C9
        MVII    #$03FF, R0                      ; 50F3   02B8 03FF
        DIS                                     ; 50F5   0003
        AND@    R3,     R0                      ; 50F6   0398
        MVO@    R1,     R3                      ; 50F7   0259
        EIS                                     ; 50F8   0002
        TSTR    R5                              ; 50F9   00AD
        BNEQ    L_5138                          ; 50FA   020C 003C

        ADDI    #$0005, R4                      ; 50FC   02FC 0005
        MVI@    R4,     R1                      ; 50FE   02A1
        ANDR    R1,     R0                      ; 50FF   0188
        BEQ     L_5138                          ; 5100   0204 0036

        MVII    #$000A, R5                      ; 5102   02BD 000A
L_5104:
        SARC    R0,     1                       ; 5104   0078
        BNC     L_5130                          ; 5105   0209 0029

        SLR     R1,     1                       ; 5107   0061
        PSHR    R5                              ; 5108   0275
        PSHR    R4                              ; 5109   0274
        PSHR    R3                              ; 510A   0273
        NOP                                     ; 510B   0034
        PSHR    R2                              ; 510C   0272
        PSHR    R1                              ; 510D   0271
        PSHR    R0                              ; 510E   0270
        SUBI    #$033D, R2                      ; 510F   033A 033D
        NEGR    R5                              ; 5111   0025
        MOVR    R5,     R1                      ; 5112   00A9
        ADDI    #$000A, R1                      ; 5113   02F9 000A
        CMPI    #$0007, R1                      ; 5115   0379 0007
        BGT     L_5122                          ; 5117   020E 0009

        ADDI    #$0325, R1                      ; 5119   02F9 0325
        MVI@    R1,     R0                      ; 511B   0288
        ANDI    #$0100, R0                      ; 511C   03B8 0100
        BEQ     L_5128                          ; 511E   0204 0008

        SUBI    #$0325, R1                      ; 5120   0339 0325
L_5122:
        SDBD                                    ; 5122   0001
        MVII    #$5128, R5                      ; 5123   02BD 0028 0051
        SDBD                                    ; 5126   0001
        MVI@    R4,     R7                      ; 5127   02A7

L_5128:
        PULR    R0                              ; 5128   02B0
        PULR    R1                              ; 5129   02B1
        PULR    R2                              ; 512A   02B2
        PULR    R3                              ; 512B   02B3
        PULR    R4                              ; 512C   02B4
        PULR    R5                              ; 512D   02B5
        B       L_5133                          ; 512E   0200 0003

L_5130:
        SARC    R1,     1                       ; 5130   0079
        BNC     L_5135                          ; 5131   0209 0002

L_5133:
        ADDI    #$0002, R4                      ; 5133   02FC 0002
L_5135:
        DECR    R5                              ; 5135   0015
        BNEQ    L_5104                          ; 5136   022C 0033

L_5138:
        SUBI    #$0017, R2                      ; 5138   033A 0017
        INCR    R3                              ; 513A   000B
        CMPI    #$035D, R3                      ; 513B   037B 035D
        BLT     L_50E4                          ; 513D   0225 005A
        PULR    R7                              ; 513F   02B7

L_5140:
        PSHR    R5                              ; 5140   0275
        MVI     G_011A, R0                      ; 5141   0280 011A
        RRC     R0,     1                       ; 5143   0070
        BC      L_5156                          ; 5144   0201 0010

        SETC                                    ; 5146   0007
        RLC     R0,     1                       ; 5147   0050
        MVO     R0,     G_011A                  ; 5148   0240 011A
        MVII    #$0345, R2                      ; 514A   02BA 0345
        MVII    #$033D, R4                      ; 514C   02BC 033D
        MVII    #$0004, R1                      ; 514E   02B9 0004
        MVII    #$0008, R0                      ; 5150   02B8 0008

        JSR     R5,     L_516C                  ; 5152   0004 0150 016C

        PULR    R7                              ; 5155   02B7

L_5156:
        RRC     R0,     1                       ; 5156   0070
        BC      L_516B                          ; 5157   0201 0012

        MVII    #$0003, R0                      ; 5159   02B8 0003
        MVO     R0,     G_011A                  ; 515B   0240 011A
        MVII    #$02F1, R2                      ; 515D   02BA 02F1
        MVII    #$015D, R4                      ; 515F   02BC 015D
        MVII    #$0002, R1                      ; 5161   02B9 0002
        MVII    #$0005, R0                      ; 5163   02B8 0005
        TSTR    R0                              ; 5165   0080
        BEQ     L_516B                          ; 5166   0204 0003

        JSR     R5,     L_516C                  ; 5168   0004 0150 016C

L_516B:
        PULR    R7                              ; 516B   02B7

L_516C:
        PSHR    R5                              ; 516C   0275
L_516D:
        MVI@    R2,     R3                      ; 516D   0293
        DECLE   $0272,  $037A,  $02F8,  $0206   ; 516E   0272 037A 02F8 0206
        DECLE   $0001,  $000F,  $0001           ; 5172   0001 000F 0001

        MVI@    R4,     R2                      ; 5175   02A2
        TSTR    R2                              ; 5176   0092
        BEQ     L_5182                          ; 5177   0204 0009

        ADDR    R1,     R2                      ; 5179   00CA
        MVI@    R2,     R2                      ; 517A   0292
        PSHR    R0                              ; 517B   0270
        PSHR    R1                              ; 517C   0271

        JSR     R5,     L_5189                  ; 517D   0004 0150 0189

        PULR    R1                              ; 5180   02B1
        PULR    R0                              ; 5181   02B0
L_5182:
        PULR    R2                              ; 5182   02B2
        MVO@    R3,     R2                      ; 5183   0253
        INCR    R2                              ; 5184   000A
        DECR    R0                              ; 5185   0010
        BNEQ    L_516D                          ; 5186   022C 001A
        PULR    R7                              ; 5188   02B7

L_5189:
        PSHR    R5                              ; 5189   0275
        DECR    R2                              ; 518A   0012
        MOVR    R3,     R1                      ; 518B   0099
        ANDI    #$000F, R1                      ; 518C   03B9 000F
        MOVR    R3,     R0                      ; 518E   0098
        SWAP    R0,     1                       ; 518F   0040
        ANDI    #$003E, R0                      ; 5190   03B8 003E
        SLR     R0,     1                       ; 5192   0060
        TSTR    R0                              ; 5193   0080
        BEQ     L_51A7                          ; 5194   0204 0011

        DECR    R0                              ; 5196   0010
        BNEQ    L_51AC                          ; 5197   020C 0013

        TSTR    R3                              ; 5199   009B
        BPL     L_519E                          ; 519A   0203 0002

        DECR    R1                              ; 519C   0011
        INCR    R7                              ; 519D   000F

L_519E:
        INCR    R1                              ; 519E   0009
L_519F:
        TSTR    R1                              ; 519F   0089
        BMI     L_51A6                          ; 51A0   020B 0004

        CMPR    R2,     R1                      ; 51A2   0151
        BLE     L_51A7                          ; 51A3   0206 0002

        CLRR    R2                              ; 51A5   01D2
L_51A6:
        MOVR    R2,     R1                      ; 51A6   0091
L_51A7:
        MOVR    R3,     R0                      ; 51A7   0098
        ANDI    #$01F0, R0                      ; 51A8   03B8 01F0
        SLR     R0,     2                       ; 51AA   0064
        SLR     R0,     2                       ; 51AB   0064
L_51AC:
        SDBD                                    ; 51AC   0001
        ANDI    #$81F0, R3                      ; 51AD   03BB 00F0 0081
        SWAP    R0,     1                       ; 51B0   0040
        SLL     R0,     1                       ; 51B1   0048
        XORR    R0,     R3                      ; 51B2   01C3
        XORR    R1,     R3                      ; 51B3   01CB
        PULR    R7                              ; 51B4   02B7

L_51B5:
        MVI     .STIC.BORD,R0                   ; 51B5   0280 002C
        MVO     R0,     G_017C                  ; 51B7   0240 017C
        MVO     R1,     .STIC.BORD              ; 51B9   0241 002C
        MVII    #$0081, R1                      ; 51BB   02B9 0081
        MVO     R1,     G_0102                  ; 51BD   0241 0102
        PULR    R7                              ; 51BF   02B7

        PSHR    R5                              ; 51C0   0275
        MVI     G_0103, R0                      ; 51C1   0280 0103
        TSTR    R0                              ; 51C3   0080
        BEQ     L_51C9                          ; 51C4   0204 0003

        MVO     R0,     .STIC.VIDEN             ; 51C6   0240 0020
L_51C8:
        PULR    R7                              ; 51C8   02B7

L_51C9:
        MVI     G_0102, R1                      ; 51C9   0281 0102
        SUBI    #$0080, R1                      ; 51CB   0339 0080
        BMI     L_51DA                          ; 51CD   020B 000B
        BEQ     L_51B5                          ; 51CF   0224 001B

        DECR    R1                              ; 51D1   0011
        BEQ     L_51C8                          ; 51D2   0224 000B

        MVI     G_017C, R1                      ; 51D4   0281 017C
        MVO     R1,     .STIC.BORD              ; 51D6   0241 002C
        MVO     R0,     G_0102                  ; 51D8   0240 0102
L_51DA:
        MVO     R0,     .STIC.VIDEN             ; 51DA   0240 0020
        INCR    R0                              ; 51DC   0008
        MVO     R0,     G_0103                  ; 51DD   0240 0103

        JSR     R5,     L_5357                  ; 51DF   0004 0150 0357

        MVII    #$0355, R3                      ; 51E2   02BB 0355
        MVII    #$0018, R2                      ; 51E4   02BA 0018
        CLRR    R5                              ; 51E6   01ED
        MVII    #$0008, R4                      ; 51E7   02BC 0008
L_51E9:
        MVI@    R2,     R0                      ; 51E9   0290
        MVO@    R5,     R2                      ; 51EA   0255
        MVI@    R3,     R1                      ; 51EB   0299
        COMR    R0                              ; 51EC   0018
        ANDR    R0,     R1                      ; 51ED   0181
        COMR    R0                              ; 51EE   0018
        XORR    R0,     R1                      ; 51EF   01C1
        MVO@    R1,     R3                      ; 51F0   0259
        INCR    R2                              ; 51F1   000A
        INCR    R3                              ; 51F2   000B
        DECR    R4                              ; 51F3   0014
        BNEQ    L_51E9                          ; 51F4   022C 000C

        MVI     G_0106, R0                      ; 51F6   0280 0106
        MVO     R0,     .STIC.HDLY              ; 51F8   0240 0030
        MVI     G_010A, R0                      ; 51FA   0280 010A
        MVO     R0,     .STIC.VDLY              ; 51FC   0240 0031
        MVI     G_0104, R2                      ; 51FE   0282 0104
        SLL     R2,     1                       ; 5200   004A
        MVII    #$0345, R4                      ; 5201   02BC 0345
        MVII    #$033D, R5                      ; 5203   02BD 033D
        ADDR    R2,     R4                      ; 5205   00D4
        ADDR    R2,     R5                      ; 5206   00D5
L_5207:
        MVI@    R4,     R3                      ; 5207   02A3
        ANDI    #$000F, R3                      ; 5208   03BB 000F
        PSHR    R4                              ; 520A   0274
        MVI@    R5,     R4                      ; 520B   02AC
        TSTR    R4                              ; 520C   00A4
        BEQ     L_5267                          ; 520D   0204 0058

        MVII    #$016D, R1                      ; 520F   02B9 016D
        ADDR    R2,     R1                      ; 5211   00D1
        CMP@    R1,     R3                      ; 5212   034B
        BEQ     L_5267                          ; 5213   0204 0052

        MVO@    R3,     R1                      ; 5215   024B
        PSHR    R5                              ; 5216   0275
        MVII    #$0325, R1                      ; 5217   02B9 0325
        ADDR    R2,     R1                      ; 5219   00D1
        MVI@    R1,     R0                      ; 521A   0288
        PSHR    R1                              ; 521B   0271
        MOVR    R0,     R1                      ; 521C   0081
        SDBD                                    ; 521D   0001
        ANDI    #$FDFF, R0                      ; 521E   03B8 00FF 00FD
        SDBD                                    ; 5221   0001
        ANDI    #$0800, R1                      ; 5222   03B9 0000 0008
        SLR     R1,     2                       ; 5225   0065
        XORR    R1,     R0                      ; 5226   01C8
        PULR    R1                              ; 5227   02B1
        MVO@    R0,     R1                      ; 5228   0248
        ADDI    #$0002, R4                      ; 5229   02FC 0002
        SDBD                                    ; 522B   0001
        MVII    #$56A5, R5                      ; 522C   02BD 00A5 0056
        ADDR    R2,     R5                      ; 522F   00D5
        MVI@    R5,     R5                      ; 5230   02AD
        SDBD                                    ; 5231   0001
        ADDI    #$3800, R5                      ; 5232   02FD 0000 0038
        MVII    #$032D, R1                      ; 5235   02B9 032D
        ADDR    R2,     R1                      ; 5237   00D1
        MVI@    R1,     R0                      ; 5238   0288
        SLL     R3,     2                       ; 5239   004F
        SLL     R3,     1                       ; 523A   004B
        SDBD                                    ; 523B   0001
        MVI@    R4,     R1                      ; 523C   02A1
        MOVR    R1,     R4                      ; 523D   008C
        ANDI    #$0080, R0                      ; 523E   03B8 0080
        BEQ     L_5255                          ; 5240   0204 0013

        SLL     R3,     1                       ; 5242   004B
        ADDR    R3,     R4                      ; 5243   00DC
        MVI@    R4,     R0                      ; 5244   02A0
        MVO@    R0,     R5                      ; 5245   0268
        MVI@    R4,     R0                      ; 5246   02A0
        MVO@    R0,     R5                      ; 5247   0268
        MVI@    R4,     R0                      ; 5248   02A0
        MVO@    R0,     R5                      ; 5249   0268
        MVI@    R4,     R0                      ; 524A   02A0
        MVO@    R0,     R5                      ; 524B   0268
        MVI@    R4,     R0                      ; 524C   02A0
        MVO@    R0,     R5                      ; 524D   0268
        MVI@    R4,     R0                      ; 524E   02A0
        MVO@    R0,     R5                      ; 524F   0268
        MVI@    R4,     R0                      ; 5250   02A0
        MVO@    R0,     R5                      ; 5251   0268
        MVI@    R4,     R0                      ; 5252   02A0
        MVO@    R0,     R5                      ; 5253   0268
        INCR    R7                              ; 5254   000F

L_5255:
        ADDR    R3,     R4                      ; 5255   00DC
L_5256:
        MVI@    R4,     R0                      ; 5256   02A0
        MVO@    R0,     R5                      ; 5257   0268
        MVI@    R4,     R0                      ; 5258   02A0
        MVO@    R0,     R5                      ; 5259   0268
        MVI@    R4,     R0                      ; 525A   02A0
        MVO@    R0,     R5                      ; 525B   0268
        MVI@    R4,     R0                      ; 525C   02A0
        MVO@    R0,     R5                      ; 525D   0268
        MVI@    R4,     R0                      ; 525E   02A0
        MVO@    R0,     R5                      ; 525F   0268
        MVI@    R4,     R0                      ; 5260   02A0
        MVO@    R0,     R5                      ; 5261   0268
        MVI@    R4,     R0                      ; 5262   02A0
        MVO@    R0,     R5                      ; 5263   0268
        MVI@    R4,     R0                      ; 5264   02A0
        MVO@    R0,     R5                      ; 5265   0268
        PULR    R5                              ; 5266   02B5
L_5267:
        PULR    R4                              ; 5267   02B4
        INCR    R2                              ; 5268   000A
        MOVR    R2,     R0                      ; 5269   0090
        SARC    R0,     1                       ; 526A   0078
        BC      L_5207                          ; 526B   0221 0065

        MVI     G_0104, R2                      ; 526D   0282 0104
        SLL     R2,     1                       ; 526F   004A
        MVII    #$02F1, R4                      ; 5270   02BC 02F1
        MVII    #$015D, R5                      ; 5272   02BD 015D
        ADDR    R2,     R4                      ; 5274   00D4
        SLL     R2,     1                       ; 5275   004A
        ADDR    R2,     R5                      ; 5276   00D5
        SLR     R2,     1                       ; 5277   0062
L_5278:
        MOVR    R2,     R1                      ; 5278   0091
        INCR    R1                              ; 5279   0009
        CMPI    #$0005, R1                      ; 527A   0379 0005
        BGT     L_52B0                          ; 527C   020E 0032

        MVI@    R4,     R3                      ; 527E   02A3
        ANDI    #$000F, R3                      ; 527F   03BB 000F
        PSHR    R4                              ; 5281   0274
        SDBD                                    ; 5282   0001
        MVI@    R5,     R4                      ; 5283   02AC
        PSHR    R5                              ; 5284   0275
        MVII    #$0175, R1                      ; 5285   02B9 0175
        ADDR    R2,     R1                      ; 5287   00D1
        CMP@    R1,     R3                      ; 5288   034B
        BEQ     L_52A9                          ; 5289   0204 001E

        MVO@    R3,     R1                      ; 528B   024B
        SLL     R3,     2                       ; 528C   004F
        SLL     R3,     1                       ; 528D   004B
        SDBD                                    ; 528E   0001
        ADD@    R4,     R3                      ; 528F   02E3
        MOVR    R3,     R4                      ; 5290   009C
        MOVR    R2,     R1                      ; 5291   0091
        SLL     R1,     2                       ; 5292   004D
        SLL     R1,     1                       ; 5293   0049
        SDBD                                    ; 5294   0001
        ADDI    #$3800, R1                      ; 5295   02F9 0000 0038
        MOVR    R1,     R5                      ; 5298   008D
        MVI@    R4,     R0                      ; 5299   02A0
        MVO@    R0,     R5                      ; 529A   0268
        MVI@    R4,     R0                      ; 529B   02A0
        MVO@    R0,     R5                      ; 529C   0268
        MVI@    R4,     R0                      ; 529D   02A0
        MVO@    R0,     R5                      ; 529E   0268
        MVI@    R4,     R0                      ; 529F   02A0
        MVO@    R0,     R5                      ; 52A0   0268
        MVI@    R4,     R0                      ; 52A1   02A0
        MVO@    R0,     R5                      ; 52A2   0268
        MVI@    R4,     R0                      ; 52A3   02A0
        MVO@    R0,     R5                      ; 52A4   0268
        MVI@    R4,     R0                      ; 52A5   02A0
        MVO@    R0,     R5                      ; 52A6   0268
        MVI@    R4,     R0                      ; 52A7   02A0
        MVO@    R0,     R5                      ; 52A8   0268
L_52A9:
        PULR    R5                              ; 52A9   02B5
        PULR    R4                              ; 52AA   02B4
        INCR    R2                              ; 52AB   000A
        MOVR    R2,     R0                      ; 52AC   0090
        SARC    R0,     1                       ; 52AD   0078
        BC      L_5278                          ; 52AE   0221 0037

L_52B0:
        JSR     R5,     L_53FD                  ; 52B0   0004 0150 03FD

        CLRR    R2                              ; 52B3   01D2
        MVI     G_0104, R1                      ; 52B4   0281 0104
        RRC     R1,     1                       ; 52B6   0071
        BC      L_52BF                          ; 52B7   0201 0006

        MVI     G_0109, R0                      ; 52B9   0280 0109

        JSR     R5,     X_EXT_SIGN_LO           ; 52BB   0004 0114 0268

        MOVR    R0,     R2                      ; 52BE   0082
L_52BF:
        MVII    #$00FF, R0                      ; 52BF   02B8 00FF
        MVII    #$0325, R3                      ; 52C1   02BB 0325
        MVII    #$0125, R4                      ; 52C3   02BC 0125

        JSR     R5,     L_5320                  ; 52C5   0004 0150 0320

        CLRR    R2                              ; 52C8   01D2
        MVI     G_0104, R1                      ; 52C9   0281 0104
        RRC     R1,     1                       ; 52CB   0071
        BNC     L_52D4                          ; 52CC   0209 0006

        MVI     G_010D, R0                      ; 52CE   0280 010D

        JSR     R5,     X_EXT_SIGN_LO           ; 52D0   0004 0114 0268

        MOVR    R0,     R2                      ; 52D3   0082
L_52D4:
        MVII    #$007F, R0                      ; 52D4   02B8 007F
        MVII    #$032D, R3                      ; 52D6   02BB 032D
        MVII    #$0135, R4                      ; 52D8   02BC 0135

        JSR     R5,     L_5320                  ; 52DA   0004 0150 0320

        MVII    #$0100, R4                      ; 52DD   02BC 0100
        SDBD                                    ; 52DF   0001
        MVI@    R4,     R0                      ; 52E0   02A0
        SDBD                                    ; 52E1   0001
        CMPI    #$5447, R0                      ; 52E2   0378 0047 0054
        BNEQ    L_52EA                          ; 52E5   020C 0003

        JSR     R5,     L_548F                  ; 52E7   0004 0154 008F
L_52EA:
        JSR     R5,     X_PLAY_NOTE             ; 52EA   0004 0118 02BD

        CLRR    R1                              ; 52ED   01C9
        MVII    #$034D, R3                      ; 52EE   02BB 034D
L_52F0:
        CLRC                                    ; 52F0   0006
        MVI@    R3,     R0                      ; 52F1   0298
        TSTR    R0                              ; 52F2   0080
        BEQ     L_52F9                          ; 52F3   0204 0004

        DECR    R0                              ; 52F5   0010
        BNEQ    L_52F9                          ; 52F6   020C 0001

        SETC                                    ; 52F8   0007
L_52F9:
        RRC     R1,     1                       ; 52F9   0071
        MVO@    R0,     R3                      ; 52FA   0258
        INCR    R3                              ; 52FB   000B
        CMPI    #$0354, R3                      ; 52FC   037B 0354
        BLE     L_52F0                          ; 52FE   0226 000F

        SWAP    R1,     1                       ; 5300   0041
        MVI     G_0117, R0                      ; 5301   0280 0117
        COMR    R0                              ; 5303   0018
        ANDR    R0,     R1                      ; 5304   0181
        COMR    R0                              ; 5305   0018
        XORR    R0,     R1                      ; 5306   01C1
        MVO     R1,     G_0117                  ; 5307   0241 0117
        MVI     G_0118, R0                      ; 5309   0280 0118
        TSTR    R0                              ; 530B   0080
        BEQ     L_5315                          ; 530C   0204 0007

        AND     G_011A, R0                      ; 530E   0380 011A
        MVO     R0,     G_011A                  ; 5310   0240 011A
        DECR    R0                              ; 5312   0010
        MVO     R0,     G_0118                  ; 5313   0240 0118
L_5315:
        MVI     G_0104, R0                      ; 5315   0280 0104
        INCR    R0                              ; 5317   0008
        ANDI    #$0003, R0                      ; 5318   03B8 0003
        MVO     R0,     G_0104                  ; 531A   0240 0104
        CLRR    R0                              ; 531C   01C0
        MVO     R0,     G_0103                  ; 531D   0240 0103
        PULR    R7                              ; 531F   02B7

L_5320:
        PSHR    R5                              ; 5320   0275
        MVII    #$0008, R5                      ; 5321   02BD 0008
L_5323:
        PSHR    R5                              ; 5323   0275
        MVI@    R3,     R1                      ; 5324   0299
        SDBD                                    ; 5325   0001
        MVII    #$4000, R5                      ; 5326   02BD 0000 0040
        ANDR    R1,     R5                      ; 5329   018D
        BEQ     L_5331                          ; 532A   0204 0005

        JSR     R5,     L_5375                  ; 532C   0004 0150 0375

        B       L_5351                          ; 532F   0200 0020

L_5331:
        PSHR    R2                              ; 5331   0272
        ANDR    R0,     R1                      ; 5332   0181
        PSHR    R0                              ; 5333   0270
        SWAP    R1,     1                       ; 5334   0041
        PSHR    R4                              ; 5335   0274
        XOR@    R4,     R1                      ; 5336   03E1
        MVI@    R4,     R0                      ; 5337   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 5338   0004 0114 0268

        MVI     G_0116, R2                      ; 533B   0282 0116

        JSR     R5,     L_5543                  ; 533D   0004 0154 0143

        ADDR    R0,     R1                      ; 5340   00C1
        PULR    R2                              ; 5341   02B2
        MVO@    R1,     R2                      ; 5342   0251
        SWAP    R1,     1                       ; 5343   0041
        PULR    R0                              ; 5344   02B0
        ANDR    R0,     R1                      ; 5345   0181
        MOVR    R0,     R2                      ; 5346   0082
        COMR    R2                              ; 5347   001A
        PULR    R5                              ; 5348   02B5
        AND@    R3,     R2                      ; 5349   039A
        BMI     L_534E                          ; 534A   020B 0002

        SUBR    R5,     R1                      ; 534C   0129
        ANDR    R0,     R1                      ; 534D   0181
L_534E:
        XORR    R2,     R1                      ; 534E   01D1
        MVO@    R1,     R3                      ; 534F   0259
        MOVR    R5,     R2                      ; 5350   00AA
L_5351:
        INCR    R3                              ; 5351   000B
        PULR    R5                              ; 5352   02B5
        DECR    R5                              ; 5353   0015
        BNEQ    L_5323                          ; 5354   022C 0032
        PULR    R7                              ; 5356   02B7

L_5357:
        MVII    #$0001, R1                      ; 5357   02B9 0001
        INCR    R7                              ; 5359   000F

        CLRR    R1                              ; 535A   01C9
L_535B:
        PSHR    R5                              ; 535B   0275
        MVII    #$0325, R4                      ; 535C   02BC 0325
        CLRR    R5                              ; 535E   01ED
        ADDI    #$0002, R1                      ; 535F   02F9 0002
L_5361:
        MVI@    R4,     R0                      ; 5361   02A0
        MVO@    R0,     R5                      ; 5362   0268
        MVI@    R4,     R0                      ; 5363   02A0
        MVO@    R0,     R5                      ; 5364   0268
        MVI@    R4,     R0                      ; 5365   02A0
        MVO@    R0,     R5                      ; 5366   0268
        MVI@    R4,     R0                      ; 5367   02A0
        MVO@    R0,     R5                      ; 5368   0268
        MVI@    R4,     R0                      ; 5369   02A0
        MVO@    R0,     R5                      ; 536A   0268
        MVI@    R4,     R0                      ; 536B   02A0
        MVO@    R0,     R5                      ; 536C   0268
        MVI@    R4,     R0                      ; 536D   02A0
        MVO@    R0,     R5                      ; 536E   0268
        MVI@    R4,     R0                      ; 536F   02A0
        MVO@    R0,     R5                      ; 5370   0268
        DECR    R1                              ; 5371   0011
        BNEQ    L_5361                          ; 5372   022C 0012
        PULR    R7                              ; 5374   02B7

L_5375:
        PSHR    R5                              ; 5375   0275
        PSHR    R0                              ; 5376   0270
        MOVR    R0,     R5                      ; 5377   0085
        DECR    R3                              ; 5378   0013
        MVI@    R3,     R1                      ; 5379   0299
        ANDR    R0,     R1                      ; 537A   0181
        INCR    R3                              ; 537B   000B
        INCR    R4                              ; 537C   000C
        MVI@    R4,     R0                      ; 537D   02A0
        PSHR    R5                              ; 537E   0275

        JSR     R5,     X_EXT_SIGN_LO           ; 537F   0004 0114 0268

        PULR    R5                              ; 5382   02B5
        ADDR    R0,     R1                      ; 5383   00C1
        ANDR    R5,     R1                      ; 5384   01A9
        COMR    R5                              ; 5385   001D
        AND@    R3,     R5                      ; 5386   039D
        XORR    R5,     R1                      ; 5387   01E9
        MVO@    R1,     R3                      ; 5388   0259
        PULR    R0                              ; 5389   02B0
        PULR    R7                              ; 538A   02B7

        PSHR    R5                              ; 538B   0275
        DIS                                     ; 538C   0003

        JSR     R5,     L_53A5                  ; 538D   0004 0150 03A5

        MVII    #$0020, R0                      ; 5390   02B8 0020
        CLRR    R4                              ; 5392   01E4
        MVO     R4,     G_0119                  ; 5393   0244 0119

        JSR     R5,     X_FILL_ZERO             ; 5395   0004 0114 0338
        JSR     R5,     L_53C5                  ; 5398   0004 0150 03C5

        MVII    #$00C0, R0                      ; 539B   02B8 00C0
        MVO     R0,     .ISRVEC.0               ; 539D   0240 0100
        MVII    #$0051, R0                      ; 539F   02B8 0051
        MVO     R0,     .ISRVEC.1               ; 53A1   0240 0101
        EIS                                     ; 53A3   0002
        PULR    R7                              ; 53A4   02B7

L_53A5:
        PSHR    R5                              ; 53A5   0275
        CLRR    R0                              ; 53A6   01C0
        MVO     R0,     .STIC.HDLY              ; 53A7   0240 0030
        MVO     R0,     .STIC.VDLY              ; 53A9   0240 0031
        SDBD                                    ; 53AB   0001
        MVII    #$569E, R4                      ; 53AC   02BC 009E 0056
        MVI@    R4,     R0                      ; 53AF   02A0
        MVO     R0,     G_0105                  ; 53B0   0240 0105
        MVII    #$0021, R1                      ; 53B2   02B9 0021
        TSTR    R0                              ; 53B4   0080
        BEQ     L_53B9                          ; 53B5   0204 0002

        MVO@    R0,     R1                      ; 53B7   0248
        INCR    R7                              ; 53B8   000F

L_53B9:
        MVI@    R1,     R0                      ; 53B9   0288
L_53BA:
        MVII    #$0028, R1                      ; 53BA   02B9 0028
        MVII    #$0005, R0                      ; 53BC   02B8 0005

        JSR     R5,     .EXEC.730               ; 53BE   0004 0114 0330

        MVI@    R4,     R0                      ; 53C1   02A0
        MVO     R0,     .STIC.EDGE              ; 53C2   0240 0032
        PULR    R7                              ; 53C4   02B7

L_53C5:
        PSHR    R5                              ; 53C5   0275
        MVII    #$0005, R0                      ; 53C6   02B8 0005
        MVII    #$02F1, R1                      ; 53C8   02B9 02F1
        SDBD                                    ; 53CA   0001
        MVII    #$56AD, R4                      ; 53CB   02BC 00AD 0056
        TSTR    R0                              ; 53CE   0080
        BEQ     L_53DF                          ; 53CF   0204 000E

        JSR     R5,     .EXEC.730               ; 53D1   0004 0114 0330

        MVII    #$0005, R0                      ; 53D4   02B8 0005
        MVII    #$015D, R5                      ; 53D6   02BD 015D
L_53D8:
        MVI@    R4,     R1                      ; 53D8   02A1
        MVO@    R1,     R5                      ; 53D9   0269
        MVI@    R4,     R1                      ; 53DA   02A1
        MVO@    R1,     R5                      ; 53DB   0269
        DECR    R0                              ; 53DC   0010
        BNEQ    L_53D8                          ; 53DD   022C 0006

L_53DF:
        SDBD                                    ; 53DF   0001
        MVII    #$56F2, R4                      ; 53E0   02BC 00F2 0056

        JSR     R5,     L_53E7                  ; 53E3   0004 0150 03E7

        PULR    R7                              ; 53E6   02B7

L_53E7:
        PSHR    R5                              ; 53E7   0275
        MVI@    R4,     R5                      ; 53E8   02A5
        SDBD                                    ; 53E9   0001
        ADDI    #$3800, R5                      ; 53EA   02FD 0000 0038
        MVI@    R4,     R0                      ; 53ED   02A0
L_53EE:
        MVI@    R4,     R1                      ; 53EE   02A1
        MOVR    R1,     R2                      ; 53EF   008A
        SWAP    R2,     1                       ; 53F0   0042
        ANDI    #$0003, R2                      ; 53F1   03BA 0003
        ANDI    #$00FF, R1                      ; 53F3   03B9 00FF
L_53F5:
        MVO@    R1,     R5                      ; 53F5   0269
        DECR    R2                              ; 53F6   0012
        BPL     L_53F5                          ; 53F7   0223 0003

        DECR    R0                              ; 53F9   0010
        BNEQ    L_53EE                          ; 53FA   022C 000D
        PULR    R7                              ; 53FC   02B7

L_53FD:
        PSHR    R5                              ; 53FD   0275
        MVII    #$0106, R4                      ; 53FE   02BC 0106
        MVI     G_0104, R2                      ; 5400   0282 0104
        ANDI    #$0001, R2                      ; 5402   03BA 0001
        BEQ     L_5408                          ; 5404   0204 0002

        ADDI    #$0004, R4                      ; 5406   02FC 0004
L_5408:
        MVI@    R4,     R1                      ; 5408   02A1
        SWAP    R1,     1                       ; 5409   0041
        XOR@    R4,     R1                      ; 540A   03E1
        MVI@    R4,     R0                      ; 540B   02A0
        PSHR    R2                              ; 540C   0272

        JSR     R5,     X_EXT_SIGN_LO           ; 540D   0004 0114 0268

        MVI     G_010E, R2                      ; 5410   0282 010E

        JSR     R5,     L_5543                  ; 5412   0004 0154 0143

        PULR    R2                              ; 5415   02B2
        ADDR    R0,     R1                      ; 5416   00C1
        MOVR    R1,     R0                      ; 5417   0088
        SLL     R2,     1                       ; 5418   004A
        SAR     R0,     2                       ; 5419   006C
        SAR     R0,     2                       ; 541A   006C
        SAR     R0,     2                       ; 541B   006C
        SAR     R0,     2                       ; 541C   006C
        BMI     L_5424                          ; 541D   020B 0005

        CMPI    #$0007, R0                      ; 541F   0378 0007
        BLE     L_543D                          ; 5421   0206 001A
        INCR    R7                              ; 5423   000F

L_5424:
        INCR    R2                              ; 5424   000A
L_5425:
        MVO     R2,     G_010F                  ; 5425   0242 010F
        MVI     .ISRVEC.0,R2                    ; 5427   0282 0100
        MVO     R2,     G_017A                  ; 5429   0242 017A
        MVI     .ISRVEC.1,R2                    ; 542B   0282 0101
        MVO     R2,     G_017B                  ; 542D   0242 017B
        SDBD                                    ; 542F   0001
        MVII    #$0047, R2                      ; 5430   02BA 0047 0000
        MVO     R2,     .ISRVEC.0               ; 5433   0242 0100
        SDBD                                    ; 5435   0001
        MVII    #$0054, R2                      ; 5436   02BA 0054 0000
        MVO     R2,     .ISRVEC.1               ; 5439   0242 0101
        ANDI    #$0007, R0                      ; 543B   03B8 0007
L_543D:
        SUBI    #$0003, R4                      ; 543D   033C 0003
        MOVR    R0,     R2                      ; 543F   0082
        SUB@    R4,     R2                      ; 5440   0322
        DECR    R4                              ; 5441   0014
        MVO@    R0,     R4                      ; 5442   0260
        MVO@    R1,     R4                      ; 5443   0261
        INCR    R4                              ; 5444   000C
        MVO@    R2,     R4                      ; 5445   0262
        PULR    R7                              ; 5446   02B7

        PSHR    R5                              ; 5447   0275
        MVO     R0,     .STIC.VIDEN             ; 5448   0240 0020
        MVI     G_0103, R0                      ; 544A   0280 0103
        TSTR    R0                              ; 544C   0080
        BEQ     L_5450                          ; 544D   0204 0001
        PULR    R7                              ; 544F   02B7

L_5450:
        INCR    R0                              ; 5450   0008
        MVO     R0,     G_0103                  ; 5451   0240 0103
        MVI     G_0106, R0                      ; 5453   0280 0106
        MVO     R0,     .STIC.HDLY              ; 5455   0240 0030
        MVI     G_010A, R0                      ; 5457   0280 010A
        MVO     R0,     .STIC.VDLY              ; 5459   0240 0031
        MVII    #$0008, R5                      ; 545B   02BD 0008
        MVII    #$032D, R4                      ; 545D   02BC 032D
        MVI     G_010F, R2                      ; 545F   0282 010F
        RRC     R2,     2                       ; 5461   0076
        BOV     L_5466                          ; 5462   0202 0002

        SUBR    R5,     R4                      ; 5464   012C
        CLRR    R5                              ; 5465   01ED
L_5466:
        MVI@    R4,     R0                      ; 5466   02A0
        MVO@    R0,     R5                      ; 5467   0268
        MVI@    R4,     R0                      ; 5468   02A0
        MVO@    R0,     R5                      ; 5469   0268
        MVI@    R4,     R0                      ; 546A   02A0
        MVO@    R0,     R5                      ; 546B   0268
        MVI@    R4,     R0                      ; 546C   02A0
        MVO@    R0,     R5                      ; 546D   0268
        MVI@    R4,     R0                      ; 546E   02A0
        MVO@    R0,     R5                      ; 546F   0268
        MVI@    R4,     R0                      ; 5470   02A0
        MVO@    R0,     R5                      ; 5471   0268
        MVI@    R4,     R0                      ; 5472   02A0
        MVO@    R0,     R5                      ; 5473   0268
        MVI@    R4,     R0                      ; 5474   02A0
        MVO@    R0,     R5                      ; 5475   0268
        MVI     G_010F, R2                      ; 5476   0282 010F

        JSR     R5,     L_54B6                  ; 5478   0004 0154 00B6
        JSR     R5,     L_6892                  ; 547B   0004 0168 0092
        JSR     R5,     X_PLAY_NOTE             ; 547E   0004 0118 02BD

        DIS                                     ; 5481   0003
        MVI     G_017A, R0                      ; 5482   0280 017A
        MVO     R0,     .ISRVEC.0               ; 5484   0240 0100
        MVI     G_017B, R0                      ; 5486   0280 017B
        MVO     R0,     .ISRVEC.1               ; 5488   0240 0101
        EIS                                     ; 548A   0002
        CLRR    R0                              ; 548B   01C0
        MVO     R0,     G_0103                  ; 548C   0240 0103
        PULR    R7                              ; 548E   02B7

L_548F:
        PSHR    R5                              ; 548F   0275
        MVII    #$0008, R5                      ; 5490   02BD 0008
        MVII    #$0325, R3                      ; 5492   02BB 0325
        MVII    #$0008, R0                      ; 5494   02B8 0008
        MVI     G_010F, R1                      ; 5496   0281 010F
        RRC     R1,     1                       ; 5498   0071
        BNC     L_549C                          ; 5499   0209 0001

        NEGR    R0                              ; 549B   0020
L_549C:
        MVII    #$00FF, R2                      ; 549C   02BA 00FF
        RRC     R1,     1                       ; 549E   0071
        BNC     L_54A4                          ; 549F   0209 0003

        ADDR    R5,     R3                      ; 54A1   00EB
        MVII    #$007F, R2                      ; 54A2   02BA 007F
L_54A4:
        MVI@    R3,     R4                      ; 54A4   029C
        TSTR    R4                              ; 54A5   00A4
        BPL     L_54B1                          ; 54A6   0203 0009

        COMR    R2                              ; 54A8   001A
        ANDR    R2,     R4                      ; 54A9   0194
        COMR    R2                              ; 54AA   001A
        MVI@    R3,     R1                      ; 54AB   0299
        ANDR    R2,     R1                      ; 54AC   0191
        ADDR    R0,     R1                      ; 54AD   00C1
        ANDR    R2,     R1                      ; 54AE   0191
        XORR    R4,     R1                      ; 54AF   01E1
        MVO@    R1,     R3                      ; 54B0   0259
L_54B1:
        INCR    R3                              ; 54B1   000B
        DECR    R5                              ; 54B2   0015
        BNEQ    L_54A4                          ; 54B3   022C 0010
        PULR    R7                              ; 54B5   02B7

L_54B6:
        PSHR    R5                              ; 54B6   0275
        PSHR    R2                              ; 54B7   0272
        RRC     R2,     1                       ; 54B8   0072
        BC      L_54C8                          ; 54B9   0201 000D

        RRC     R2,     1                       ; 54BB   0072
        BC      L_54C3                          ; 54BC   0201 0005

        JSR     R5,     L_54D5                  ; 54BE   0004 0154 00D5

        B       L_54D3                          ; 54C1   0200 0010

L_54C3:
        JSR     R5,     L_54EC                  ; 54C3   0004 0154 00EC

        B       L_54D3                          ; 54C6   0200 000B

L_54C8:
        RRC     R2,     1                       ; 54C8   0072
        BC      L_54D0                          ; 54C9   0201 0005

        JSR     R5,     L_5523                  ; 54CB   0004 0154 0123

        B       L_54D3                          ; 54CE   0200 0003

L_54D0:
        JSR     R5,     L_5536                  ; 54D0   0004 0154 0136

L_54D3:
        PULR    R2                              ; 54D3   02B2
        PULR    R7                              ; 54D4   02B7

L_54D5:
        PSHR    R5                              ; 54D5   0275
        MVII    #$0213, R3                      ; 54D6   02BB 0213
        MVII    #$0212, R2                      ; 54D8   02BA 0212
L_54DA:
        MVII    #$0013, R1                      ; 54DA   02B9 0013
L_54DC:
        MVI@    R2,     R0                      ; 54DC   0290
        MVO@    R0,     R3                      ; 54DD   0258
        DECR    R3                              ; 54DE   0013
        DECR    R2                              ; 54DF   0012
        DECR    R1                              ; 54E0   0011
        BNEQ    L_54DC                          ; 54E1   022C 0006

        ADDI    #$0027, R3                      ; 54E3   02FB 0027
        ADDI    #$0027, R2                      ; 54E5   02FA 0027
        CMPI    #$02F0, R2                      ; 54E7   037A 02F0
        BLT     L_54DA                          ; 54E9   0225 0010
        PULR    R7                              ; 54EB   02B7

L_54EC:
        PSHR    R5                              ; 54EC   0275
        MVII    #$02C8, R4                      ; 54ED   02BC 02C8
        MVII    #$02DC, R5                      ; 54EF   02BD 02DC
        MVII    #$0028, R1                      ; 54F1   02B9 0028
        MVII    #$000B, R2                      ; 54F3   02BA 000B
L_54F5:
        MVI@    R4,     R0                      ; 54F5   02A0
        MVO@    R0,     R5                      ; 54F6   0268
        MVI@    R4,     R0                      ; 54F7   02A0
        MVO@    R0,     R5                      ; 54F8   0268
        MVI@    R4,     R0                      ; 54F9   02A0
        MVO@    R0,     R5                      ; 54FA   0268
        MVI@    R4,     R0                      ; 54FB   02A0
        MVO@    R0,     R5                      ; 54FC   0268
        MVI@    R4,     R0                      ; 54FD   02A0
        MVO@    R0,     R5                      ; 54FE   0268
        MVI@    R4,     R0                      ; 54FF   02A0
        MVO@    R0,     R5                      ; 5500   0268
        MVI@    R4,     R0                      ; 5501   02A0
        MVO@    R0,     R5                      ; 5502   0268
        MVI@    R4,     R0                      ; 5503   02A0
        MVO@    R0,     R5                      ; 5504   0268
        MVI@    R4,     R0                      ; 5505   02A0
        MVO@    R0,     R5                      ; 5506   0268
        MVI@    R4,     R0                      ; 5507   02A0
        MVO@    R0,     R5                      ; 5508   0268
        MVI@    R4,     R0                      ; 5509   02A0
        MVO@    R0,     R5                      ; 550A   0268
        MVI@    R4,     R0                      ; 550B   02A0
        MVO@    R0,     R5                      ; 550C   0268
        MVI@    R4,     R0                      ; 550D   02A0
        MVO@    R0,     R5                      ; 550E   0268
        MVI@    R4,     R0                      ; 550F   02A0
        MVO@    R0,     R5                      ; 5510   0268
        MVI@    R4,     R0                      ; 5511   02A0
        MVO@    R0,     R5                      ; 5512   0268
        MVI@    R4,     R0                      ; 5513   02A0
        MVO@    R0,     R5                      ; 5514   0268
        MVI@    R4,     R0                      ; 5515   02A0
        MVO@    R0,     R5                      ; 5516   0268
        MVI@    R4,     R0                      ; 5517   02A0
        MVO@    R0,     R5                      ; 5518   0268
        MVI@    R4,     R0                      ; 5519   02A0
        MVO@    R0,     R5                      ; 551A   0268
        MVI@    R4,     R0                      ; 551B   02A0
        MVO@    R0,     R5                      ; 551C   0268
        SUBR    R1,     R4                      ; 551D   010C
        SUBR    R1,     R5                      ; 551E   010D
        DECR    R2                              ; 551F   0012
        BNEQ    L_54F5                          ; 5520   022C 002C
        PULR    R7                              ; 5522   02B7

L_5523:
        PSHR    R5                              ; 5523   0275
        MVII    #$0200, R5                      ; 5524   02BD 0200
        MVII    #$0201, R4                      ; 5526   02BC 0201
L_5528:
        MVII    #$0013, R1                      ; 5528   02B9 0013
L_552A:
        MVI@    R4,     R0                      ; 552A   02A0
        MVO@    R0,     R5                      ; 552B   0268
        DECR    R1                              ; 552C   0011
        BNEQ    L_552A                          ; 552D   022C 0004

        INCR    R4                              ; 552F   000C
        INCR    R5                              ; 5530   000D
        CMPI    #$02DD, R4                      ; 5531   037C 02DD
        BLE     L_5528                          ; 5533   0226 000C
        PULR    R7                              ; 5535   02B7

L_5536:
        PSHR    R5                              ; 5536   0275
        MVII    #$0200, R5                      ; 5537   02BD 0200
        MVII    #$0214, R4                      ; 5539   02BC 0214
        MVII    #$00DC, R1                      ; 553B   02B9 00DC
L_553D:
        MVI@    R4,     R0                      ; 553D   02A0
        MVO@    R0,     R5                      ; 553E   0268
        DECR    R1                              ; 553F   0011
        BNEQ    L_553D                          ; 5540   022C 0004
        PULR    R7                              ; 5542   02B7

L_5543:
        TSTR    R2                              ; 5543   0092
        BEQ     L_554A                          ; 5544   0204 0004

L_5546:
        SLL     R0,     1                       ; 5546   0048
        DECR    R2                              ; 5547   0012
        BNEQ    L_5546                          ; 5548   022C 0003
L_554A:
        MOVR    R5,     R7                      ; 554A   00AF

        PSHR    R5                              ; 554B   0275
        PSHR    R1                              ; 554C   0271

        JSR     R5,     L_555D                  ; 554D   0004 0154 015D

        MOVR    R2,     R1                      ; 5550   0091

        JSR     R5,     X_PACK_BYTES            ; 5551   0004 0114 034F
        JSR     R5,     X_UNPK_BYTES            ; 5554   0004 0114 0357
        JSR     R5,     .EXEC.A2F               ; 5557   0004 0118 022F

        MOVR    R1,     R0                      ; 555A   0088
        PULR    R1                              ; 555B   02B1
        PULR    R7                              ; 555C   02B7

L_555D:
        SLL     R1,     1                       ; 555D   0049
        ADDI    #$0126, R1                      ; 555E   02F9 0126
        MVI@    R1,     R0                      ; 5560   0288
        ADDI    #$0010, R1                      ; 5561   02F9 0010
        MVI@    R1,     R2                      ; 5563   028A
        MOVR    R5,     R7                      ; 5564   00AF

L_5565:
        MVII    #$0080, R3                      ; 5565   02BB 0080
        INCR    R7                              ; 5567   000F

L_5568:
        CLRR    R3                              ; 5568   01DB
L_5569:
        MVII    #$0005, R1                      ; 5569   02B9 0005
        CLRR    R2                              ; 556B   01D2
        ADDI    #$0167, R2                      ; 556C   02FA 0167
L_556E:
        MVI@    R2,     R0                      ; 556E   0290
        ANDI    #$007F, R0                      ; 556F   03B8 007F
        XORR    R3,     R0                      ; 5571   01D8
        MVO@    R0,     R2                      ; 5572   0250
        INCR    R2                              ; 5573   000A
        DECR    R1                              ; 5574   0011
        BPL     L_556E                          ; 5575   0223 0008
        MOVR    R5,     R7                      ; 5577   00AF

L_5578:
        MVII    #$0008, R2                      ; 5578   02BA 0008
        CLRR    R3                              ; 557A   01DB
L_557B:
        DECR    R2                              ; 557B   0012
        INCR    R7                              ; 557C   000F

L_557D:
        CLRR    R2                              ; 557D   01D2
L_557E:
        PSHR    R5                              ; 557E   0275
L_557F:
        PSHR    R3                              ; 557F   0273
        MOVR    R3,     R4                      ; 5580   009C
        MOVR    R3,     R5                      ; 5581   009D
        ADDI    #$0325, R4                      ; 5582   02FC 0325
        ADDI    #$033D, R5                      ; 5584   02FD 033D
L_5586:
        CLRR    R0                              ; 5586   01C0
        MVO@    R0,     R4                      ; 5587   0260
        MVO@    R0,     R5                      ; 5588   0268
        PSHR    R5                              ; 5589   0275
        ADDI    #$000F, R5                      ; 558A   02FD 000F
        MVO@    R0,     R5                      ; 558C   0268
        SUBI    #$034E, R5                      ; 558D   033D 034E
        MOVR    R5,     R3                      ; 558F   00AB

        JSR     R5,     L_55B0                  ; 5590   0004 0154 01B0

        PULR    R5                              ; 5593   02B5
        DECR    R2                              ; 5594   0012
        BPL     L_5586                          ; 5595   0223 0010

        PULR    R3                              ; 5597   02B3
        PULR    R7                              ; 5598   02B7

L_5599:
        PSHR    R5                              ; 5599   0275
        MOVR    R3,     R2                      ; 559A   009A
        ADDI    #$0325, R2                      ; 559B   02FA 0325
        MVI@    R2,     R0                      ; 559D   0290
        PSHR    R1                              ; 559E   0271
        PSHR    R0                              ; 559F   0270

        JSR     R5,     L_557D                  ; 55A0   0004 0154 017D

        PULR    R0                              ; 55A3   02B0
        PULR    R1                              ; 55A4   02B1
        MOVR    R3,     R2                      ; 55A5   009A
        ADDI    #$016D, R2                      ; 55A6   02FA 016D
        ADDI    #$0325, R3                      ; 55A8   02FB 0325
        MVO@    R3,     R2                      ; 55AA   0253
        MVO@    R0,     R3                      ; 55AB   0258
        ADDI    #$0018, R3                      ; 55AC   02FB 0018
        MVO@    R1,     R3                      ; 55AE   0259
        PULR    R7                              ; 55AF   02B7

L_55B0:
        PSHR    R5                              ; 55B0   0275
        MOVR    R3,     R0                      ; 55B1   0098

        JSR     R5,     X_POW2                  ; 55B2   0004 0114 0345

        COMR    R0                              ; 55B5   0018
        DIS                                     ; 55B6   0003
        AND     G_0117, R0                      ; 55B7   0380 0117
        MVO     R0,     G_0117                  ; 55B9   0240 0117
        EIS                                     ; 55BB   0002
        PULR    R7                              ; 55BC   02B7

L_55BD:
        ADDI    #$0325, R3                      ; 55BD   02FB 0325
        MVI@    R3,     R0                      ; 55BF   0298
        ANDI    #$00FF, R0                      ; 55C0   03B8 00FF
        ADDI    #$0008, R3                      ; 55C2   02FB 0008
        MVI@    R3,     R1                      ; 55C4   0299
        ANDI    #$007F, R1                      ; 55C5   03B9 007F
        SUBI    #$032D, R3                      ; 55C7   033B 032D
        MOVR    R5,     R7                      ; 55C9   00AF

L_55CA:
        DECR    R2                              ; 55CA   0012
        INCR    R7                              ; 55CB   000F

L_55CC:
        CLRR    R2                              ; 55CC   01D2
L_55CD:
        PSHR    R5                              ; 55CD   0275
L_55CE:
        MVII    #$0002, R1                      ; 55CE   02B9 0002

        JSR     R5,     L_55FA                  ; 55D0   0004 0154 01FA

        SDBD                                    ; 55D3   0001
        MVI@    R4,     R0                      ; 55D4   02A0
        MVI@    R3,     R1                      ; 55D5   0299
        SDBD                                    ; 55D6   0001
        ANDI    #$0FF8, R1                      ; 55D7   03B9 00F8 000F
        XORR    R0,     R1                      ; 55DA   01C1
        MVO@    R1,     R3                      ; 55DB   0259
        ADDI    #$0008, R3                      ; 55DC   02FB 0008
        MVII    #$0003, R1                      ; 55DE   02B9 0003

        JSR     R5,     L_55FA                  ; 55E0   0004 0154 01FA

        SUBI    #$0355, R3                      ; 55E3   033B 0355
        MVII    #$016D, R1                      ; 55E5   02B9 016D
        ADDR    R3,     R1                      ; 55E7   00D9
        MVO@    R1,     R1                      ; 55E8   0249
        PSHR    R3                              ; 55E9   0273
        SLL     R3,     1                       ; 55EA   004B
        ADDI    #$0126, R3                      ; 55EB   02FB 0126
        MVI@    R4,     R0                      ; 55ED   02A0
        MVO@    R0,     R3                      ; 55EE   0258
        ADDI    #$0010, R3                      ; 55EF   02FB 0010
        MVI@    R4,     R0                      ; 55F1   02A0
        MVO@    R0,     R3                      ; 55F2   0258
        PULR    R3                              ; 55F3   02B3
        ADDI    #$0326, R3                      ; 55F4   02FB 0326
        DECR    R2                              ; 55F6   0012
        BPL     L_55CE                          ; 55F7   0223 002A
        PULR    R7                              ; 55F9   02B7

L_55FA:
        SDBD                                    ; 55FA   0001
        MVI@    R4,     R0                      ; 55FB   02A0
        MVO@    R0,     R3                      ; 55FC   0258
        ADDI    #$0008, R3                      ; 55FD   02FB 0008
        DECR    R1                              ; 55FF   0011
        BNEQ    L_55FA                          ; 5600   022C 0007
        MOVR    R5,     R7                      ; 5602   00AF

L_5603:
        MVI@    R4,     R0                      ; 5603   02A0
        ANDI    #$00FF, R0                      ; 5604   03B8 00FF
        ADDI    #$0007, R4                      ; 5606   02FC 0007
        MVI@    R4,     R1                      ; 5608   02A1
        ANDI    #$007F, R1                      ; 5609   03B9 007F
        PSHR    R5                              ; 560B   0275

        JSR     R5,     .EXEC.78C               ; 560C   0004 0114 038C

        MOVR    R0,     R3                      ; 560F   0083
        MOVR    R1,     R4                      ; 5610   008C
        MOVR    R2,     R1                      ; 5611   0091
        SDBD                                    ; 5612   0001
        ANDI    #$7FFF, R1                      ; 5613   03B9 00FF 007F

        JSR     R5,     X_SQRT                  ; 5616   0004 011C 0223

        PULR    R7                              ; 5619   02B7

L_561A:
        MVII    #$0001, R0                      ; 561A   02B8 0001
        INCR    R7                              ; 561C   000F

L_561D:
        CLRR    R0                              ; 561D   01C0
L_561E:
        PSHR    R5                              ; 561E   0275
        PSHR    R0                              ; 561F   0270
        PSHR    R4                              ; 5620   0274
        PSHR    R1                              ; 5621   0271

        JSR     R5,     L_5603                  ; 5622   0004 0154 0203

        MOVR    R3,     R0                      ; 5625   0098
        MOVR    R2,     R3                      ; 5626   0093
        PULR    R1                              ; 5627   02B1
        PSHR    R1                              ; 5628   0271

        JSR     R5,     X_MPY                   ; 5629   0004 011C 01DC

        MOVR    R2,     R1                      ; 562C   0091
        MOVR    R3,     R2                      ; 562D   009A

        JSR     R5,     X_DIVR                  ; 562E   0004 011C 01F8

        PULR    R1                              ; 5631   02B1
        PSHR    R0                              ; 5632   0270
        MOVR    R4,     R0                      ; 5633   00A0
        MOVR    R1,     R4                      ; 5634   008C

        JSR     R5,     X_MPY                   ; 5635   0004 011C 01DC

        MOVR    R2,     R1                      ; 5638   0091
        MOVR    R3,     R2                      ; 5639   009A

        JSR     R5,     X_DIVR                  ; 563A   0004 011C 01F8

        PULR    R1                              ; 563D   02B1
        PULR    R2                              ; 563E   02B2
        PULR    R5                              ; 563F   02B5
        SUBI    #$0325, R2                      ; 5640   033A 0325
        PSHR    R2                              ; 5642   0272
        SLL     R2,     1                       ; 5643   004A
        ADDI    #$0126, R2                      ; 5644   02FA 0126
        MVO@    R1,     R2                      ; 5646   0251
        ADDI    #$0010, R2                      ; 5647   02FA 0010
        MVO@    R0,     R2                      ; 5649   0250
        TSTR    R5                              ; 564A   00AD
        BEQ     L_5670                          ; 564B   0204 0023

        MOVR    R4,     R2                      ; 564D   00A2
        MOVR    R3,     R1                      ; 564E   0099
        CMPI    #$007F, R1                      ; 564F   0379 007F
        BGT     L_5659                          ; 5651   020E 0006

        SWAP    R1,     1                       ; 5653   0041

        JSR     R5,     X_DIVR                  ; 5654   0004 011C 01F8

        B       L_565D                          ; 5657   0200 0004

L_5659:
        JSR     R5,     X_DIVR                  ; 5659   0004 011C 01F8

        SWAP    R0,     1                       ; 565C   0040
L_565D:
        MVI     G_0116, R1                      ; 565D   0281 0116
        TSTR    R1                              ; 565F   0089
        BEQ     L_5666                          ; 5660   0204 0004

L_5662:
        SLR     R0,     1                       ; 5662   0060
        DECR    R1                              ; 5663   0011
        BNEQ    L_5662                          ; 5664   022C 0003

L_5666:
        TSTR    R0                              ; 5666   0080
        BNEQ    L_566B                          ; 5667   020C 0002

        MVII    #$0001, R0                      ; 5669   02B8 0001
L_566B:
        PULR    R2                              ; 566B   02B2
        ADDI    #$034D, R2                      ; 566C   02FA 034D
        MVO@    R0,     R2                      ; 566E   0250
        INCR    R7                              ; 566F   000F

L_5670:
        PULR    R2                              ; 5670   02B2
L_5671:
        PULR    R7                              ; 5671   02B7

L_5672:
        ADDI    #$0325, R3                      ; 5672   02FB 0325
        MVI@    R3,     R0                      ; 5674   0298
        ANDI    #$00FF, R0                      ; 5675   03B8 00FF
        SUBI    #$0008, R0                      ; 5677   0338 0008
        BPL     L_567C                          ; 5679   0203 0001

        CLRR    R0                              ; 567B   01C0
L_567C:
        SLR     R0,     2                       ; 567C   0064
        SLR     R0,     1                       ; 567D   0060
        ADDI    #$0008, R3                      ; 567E   02FB 0008
        MOVR    R0,     R4                      ; 5680   0084
        MVI@    R3,     R1                      ; 5681   0299
        ANDI    #$007F, R1                      ; 5682   03B9 007F
        SUBI    #$0008, R1                      ; 5684   0339 0008
        BPL     L_5689                          ; 5686   0203 0001

        CLRR    R1                              ; 5688   01C9
L_5689:
        SLR     R1,     2                       ; 5689   0065
        SLR     R1,     1                       ; 568A   0061
        SLL     R1,     2                       ; 568B   004D
        ADDR    R1,     R4                      ; 568C   00CC
        SLL     R1,     2                       ; 568D   004D
        ADDR    R1,     R4                      ; 568E   00CC
        ADDI    #$0200, R4                      ; 568F   02FC 0200
        SUBI    #$032D, R3                      ; 5691   033B 032D
        MOVR    R5,     R7                      ; 5693   00AF

L_5694:
        MVII    #$000F, R2                      ; 5694   02BA 000F
        MVII    #$0125, R4                      ; 5696   02BC 0125
        CLRR    R0                              ; 5698   01C0
L_5699:
        MVO@    R0,     R4                      ; 5699   0260
        DECR    R2                              ; 569A   0012
        BPL     L_5699                          ; 569B   0223 0003
        MOVR    R5,     R7                      ; 569D   00AF

        DECLE   $0001,  $0001,  $0000,  $0002   ; 569E   0001 0001 0000 0002
        DECLE   $0005,  $0000,  $0001,  $01F0   ; 56A2   0005 0000 0001 01F0
        DECLE   $01E0,  $01D0,  $01C0,  $01B0   ; 56A6   01E0 01D0 01C0 01B0
        DECLE   $01A0,  $0198,  $0190,  $0020   ; 56AA   01A0 0198 0190 0020
        DECLE   $0030,  $0020,  $0030,  $0030   ; 56AE   0030 0020 0030 0030
        DECLE   $00F6,  $0057,  $00F9,  $0057   ; 56B2   00F6 0057 00F9 0057
        DECLE   $00FC,  $0057,  $00FF,  $0057   ; 56B6   00FC 0057 00FF 0057
        DECLE   $0002,  $0058,  $0001,  $00B1   ; 56BA   0002 0058 0001 00B1
        DECLE   $005E,  $0002,  $00D1,  $005D   ; 56BE   005E 0002 00D1 005D
        DECLE   $0001,  $00D6,  $005E,  $0001   ; 56C2   0001 00D6 005E 0001
        DECLE   $002C,  $005D,  $0002,  $0039   ; 56C6   002C 005D 0002 0039
        DECLE   $005F,  $0001,  $0027,  $005F   ; 56CA   005F 0001 0027 005F
        DECLE   $00DD,  $005B,  $0098,  $005C   ; 56CE   00DD 005B 0098 005C
        DECLE   $007B,  $005C,  $007B,  $005C   ; 56D2   007B 005C 007B 005C
        DECLE   $007B,  $005C,  $0005           ; 56D6   007B 005C 0005

        COMR    R2                              ; 56D9   001A

        JSRD    R4,     .EXEC.805               ; 56DA   0004 001A 0005
        DECLE   $0028,  $0004,  $002A,  $0003   ; 56DD   0028 0004 002A 0003
        DECLE   $0028,  $0004,  $003C,  $0000   ; 56E1   0028 0004 003C 0000
        DECLE   $001A,  $0002,  $0008,  $0000   ; 56E5   001A 0002 0008 0000
        DECLE   $0000,  $0000,  $0022,  $0000   ; 56E9   0000 0000 0022 0000
        DECLE   $0020,  $0000,  $0012,  $0002   ; 56ED   0020 0000 0012 0002
        DECLE   $001A,  $0028,  $0102,  $0200   ; 56F1   001A 0028 0102 0200
        DECLE   $0001,  $000B,  $003F,  $007F   ; 56F5   0001 000B 003F 007F
        DECLE   $00FF,  $0003,  $000F,  $005F   ; 56F9   00FF 0003 000F 005F
        DECLE   $03FF,  $00FF,  $0000,  $00A1   ; 56FD   03FF 00FF 0000 00A1
        DECLE   $00F7,  $03FF,  $00FF,  $0000   ; 5701   00F7 03FF 00FF 0000
        DECLE   $0001                           ; 5705   0001

        SETC                                    ; 5706   0007
        INCR    R7                              ; 5707   000F

        DECLE   $002F                           ; 5708   002F
L_5709:
        CMPR    R7,     R7                      ; 5709   017F
        DECLE   $01FF,  $00F8,  $0060,  $0300   ; 570A   01FF 00F8 0060 0300
        DECLE   $0100,  $0080,  $00E0,  $00F0   ; 570E   0100 0080 00E0 00F0
        DECLE   $00F4,  $01FE,  $00FF,  $00C0   ; 5712   00F4 01FE 00FF 00C0
        DECLE   $00F0,  $00FA,  $03FF,  $00FF   ; 5716   00F0 00FA 03FF 00FF
        DECLE   $0200,  $0080,  $00D0,  $00FC   ; 571A   0200 0080 00D0 00FC
        DECLE   $00FE,  $00FF                   ; 571E   00FE 00FF

        SUBR    R0,     R1                      ; 5720   0101
        DIS                                     ; 5721   0003
        SETC                                    ; 5722   0007
        DIS                                     ; 5723   0003
        SETC                                    ; 5724   0007
        BESC    L_572E                          ; 5725   020F 0007
        SUBR    R3,     R7                      ; 5727   011F

        DECLE   $013F                           ; 5728   013F

        CMPR    R7,     R7                      ; 5729   017F
        ADDR    R0,     R0                      ; 572A   00C0
        ADDR    R4,     R0                      ; 572B   00E0
        RRC     R0,     1                       ; 572C   0070
        RSWD    R0                              ; 572D   0038
L_572E:
        COMR    R4                              ; 572E   001C
        DECLE   $001E,  $007F,  $00FF           ; 572F   001E 007F 00FF

        GSWD    R0                              ; 5732   0030
        CMPR    R6,     R0                      ; 5733   0170
        CMPR    R4,     R0                      ; 5734   0160
        ADDR    R4,     R0                      ; 5735   00E0
        CLRR    R0                              ; 5736   01C0
        SARC    R1,     1                       ; 5737   0079
        DECR    R3                              ; 5738   0013
        ADDR    R2,     R0                      ; 5739   00D0
        SWAP    R1,     1                       ; 573A   0041
        DIS                                     ; 573B   0003
        TSTR    R0                              ; 573C   0080
        ADDR    R1,     R2                      ; 573D   00CA
        ADDR    R1,     R7                      ; 573E   00CF

        DECLE   $00FE,  $00F8,  $00F3,  $00EE   ; 573F   00FE 00F8 00F3 00EE
        DECLE   $00F8,  $00F3,  $00F7           ; 5743   00F8 00F3 00F7

        ADDI    #$003F, R7                      ; 5746   02FF 003F
        MOVR    R3,     R7                      ; 5748   009F
        ADDR    R5,     R7                      ; 5749   00EF

        DECLE   $006F,  $01BF,  $0300,  $0003   ; 574A   006F 01BF 0300 0003
        DECLE   $006F,  $00FF,  $0000,  $0100   ; 574E   006F 00FF 0000 0100
        DECLE   $0010,  $003C,  $006E,  $00DE   ; 5752   0010 003C 006E 00DE
        DECLE   $00FC,  $0000,  $0080,  $00C0   ; 5756   00FC 0000 0080 00C0
        DECLE   $0080,  $01C0,  $01E0,  $02F0   ; 575A   0080 01C0 01E0 02F0
        DECLE   $00F8,  $00FC,  $00F8,  $00FC   ; 575E   00F8 00FC 00F8 00FC
        DECLE   $01FE,  $0300,  $0020,  $003F   ; 5762   01FE 0300 0020 003F
        DECLE   $0020,  $003F,  $0300,  $0000   ; 5766   0020 003F 0300 0000
        DECLE   $00FF,  $0000,  $00FF           ; 576A   00FF 0000 00FF

        SUB     .STIC.X.2,R0                    ; 576D   0300 0002
        ADDR    R7,     R6                      ; 576F   00FE
        EIS                                     ; 5770   0002
        ADDR    R7,     R6                      ; 5771   00FE
        SUB     .IV.FIFO,R0                     ; 5772   0300 0081
        ADDR    R4,     R3                      ; 5774   00E3
        ADDR    R5,     R7                      ; 5775   00EF

        DECLE   $00FF,  $00FE,  $0074,  $0030   ; 5776   00FF 00FE 0074 0030
        DECLE   $0160,  $0170,  $00E0,  $0200   ; 577A   0160 0170 00E0 0200
        DECLE   $0003,  $0007,  $003F,  $01FF   ; 577E   0003 0007 003F 01FF
        DECLE   $0001,  $0003,  $000F,  $003F   ; 5782   0001 0003 000F 003F
        DECLE   $03FF                           ; 5786   03FF
L_5787:
        SUBR    R0,     R3                      ; 5787   0103
        SUBR    R0,     R7                      ; 5788   0107

        DECLE   $000F,  $001F,  $003F,  $007F   ; 5789   000F 001F 003F 007F
        DECLE   $01C0,  $01E0,  $00F0,  $00F8   ; 578D   01C0 01E0 00F0 00F8
        DECLE   $00FC,  $00FE,  $0080,  $00C0   ; 5791   00FC 00FE 0080 00C0
        DECLE   $00F0,  $00FC,  $03FF,  $0200   ; 5795   00F0 00FC 03FF 0200
        DECLE   $00C0,  $00E0,  $00FC,  $01FF   ; 5799   00C0 00E0 00FC 01FF
        DECLE   $00F0,  $0070,  $0038,  $003C   ; 579D   00F0 0070 0038 003C
        DECLE   $001C,  $011E,  $001F,  $0099   ; 57A1   001C 011E 001F 0099
        DECLE   $0066,  $00C3,  $00AD,  $01EF   ; 57A5   0066 00C3 00AD 01EF
        DECLE   $00E7,  $00C3,  $0000           ; 57A9   00E7 00C3 0000

        SLL     R0,     2                       ; 57AC   004C
        MOVR    R7,     R2                      ; 57AD   00BA
        MOVR    R2,     R1                      ; 57AE   0091
        SLLC    R0,     2                       ; 57AF   005C
        ADDR    R6,     R6                      ; 57B0   00F6
        MOVR    R2,     R1                      ; 57B1   0091
        COMR    R0                              ; 57B2   0018
        TSTR    R5                              ; 57B3   00AD
        MOVR    R5,     R1                      ; 57B4   00A9
        ADDR    R5,     R5                      ; 57B5   00ED
        MOVR    R5,     R1                      ; 57B6   00A9
        TSTR    R5                              ; 57B7   00AD
        B       L_57F4                          ; 57B8   0200 003A

        ADCR    R2                              ; 57BA   002A
        RSWD    R2                              ; 57BB   003A
        NEGR    R0                              ; 57BC   0020
        MOVR    R4,     R2                      ; 57BD   00A2
        B       L_58AC                          ; 57BE   0200 00EC

        DECLE   $008A,  $0089,  $00E9,  $0029   ; 57C0   008A 0089 00E9 0029
        DECLE   $002A,  $00EC,  $0000,  $00FF   ; 57C4   002A 00EC 0000 00FF

        ADDR    R4,     R0                      ; 57C8   00E0
        SUB     .ISRVEC.0,R0                    ; 57C9   0300 0100
        B       L_5811                          ; 57CB   0200 0044

        DECLE   $00FF,  $0200,  $0200,  $0038   ; 57CD   00FF 0200 0200 0038
        DECLE   $007C,  $00FE,  $0100,  $0101   ; 57D1   007C 00FE 0100 0101
        DECLE   $0103,  $0007,  $000F,  $003F   ; 57D5   0103 0007 000F 003F
        DECLE   $00FF,  $0100,  $0180,  $00C0   ; 57D9   00FF 0100 0180 00C0
        DECLE   $00E0,  $00F8,  $00FF,  $003C   ; 57DD   00E0 00F8 00FF 003C
        DECLE   $0042,  $0099,  $01A1,  $0099   ; 57E1   0042 0099 01A1 0099
        DECLE   $0042,  $003C,  $0138,  $0010   ; 57E5   0042 003C 0138 0010
        DECLE   $00FE,  $0138,  $0028,  $006C   ; 57E9   00FE 0138 0028 006C
        DECLE   $01FF                           ; 57ED   01FF

        INCR    R7                              ; 57EE   000F

        SETC                                    ; 57EF   0007
L_57F0:
        SUB     .PSG1.lft_hand,R0               ; 57F0   0300 00FF
        ADDR    R7,     R4                      ; 57F2   00FC
        ADDR    R7,     R0                      ; 57F3   00F8
L_57F4:
        ADDR    R0,     R0                      ; 57F4   00C0
        DECLE   $0300,  $0005,  $0058,  $0004   ; 57F5   0300 0005 0058 0004
        DECLE   $00C4,  $0058,  $0004,  $0024   ; 57F9   00C4 0058 0004 0024
        DECLE   $0059,  $0004,  $0065,  $0058   ; 57FD   0059 0004 0065 0058
        DECLE   $0004,  $0084,  $0059,  $0004   ; 5801   0004 0084 0059 0004

        ADDR    R3,     R7                      ; 5805   00DF
        ADDR    R5,     R7                      ; 5806   00EF

        DECLE   $00F7                           ; 5807   00F7

        ADDR    R5,     R7                      ; 5808   00EF
        ADDR    R2,     R7                      ; 5809   00D7

        DECLE   $00BF,  $00FF,  $007F,  $00F7   ; 580A   00BF 00FF 007F 00F7

        ADDR    R7,     R3                      ; 580E   00FB
        ADDR    R7,     R1                      ; 580F   00F9
        ADDR    R7,     R6                      ; 5810   00FE
L_5811:
        ADDR    R7,     R5                      ; 5811   00FD
        ADDR    R7,     R5                      ; 5812   00FD
        ADDR    R6,     R3                      ; 5813   00F3
        ADDR    R1,     R7                      ; 5814   00CF

        DECLE   $00FD,  $00FE,  $00FD,  $00FA   ; 5815   00FD 00FE 00FD 00FA
        DECLE   $00FF,  $00FD,  $00FE,  $00F5   ; 5819   00FF 00FD 00FE 00F5
        DECLE   $007F,  $00BF,  $00DF,  $00BF   ; 581D   007F 00BF 00DF 00BF
        DECLE   $005F,  $00FF,  $007F,  $00FF   ; 5821   005F 00FF 007F 00FF
        DECLE   $0000,  $0000,  $001C,  $003E   ; 5825   0000 0000 001C 003E
        DECLE   $003F,  $007F,  $007F,  $003E   ; 5829   003F 007F 007F 003E
        DECLE   $0000,  $0000,  $001C,  $003E   ; 582D   0000 0000 001C 003E
        DECLE   $003F,  $007F,  $007F,  $003E   ; 5831   003F 007F 007F 003E
        DECLE   $0000,  $0000,  $001C,  $003E   ; 5835   0000 0000 001C 003E
        DECLE   $003F,  $007F,  $007F,  $003E   ; 5839   003F 007F 007F 003E
        DECLE   $0000,  $0000,  $001C,  $003E   ; 583D   0000 0000 001C 003E
        DECLE   $003F,  $007F,  $007F,  $003E   ; 5841   003F 007F 007F 003E
        DECLE   $0000,  $0000,  $001C,  $003E   ; 5845   0000 0000 001C 003E
        DECLE   $003F,  $007F,  $007F,  $003E   ; 5849   003F 007F 007F 003E
        DECLE   $0000,  $0000,  $0006,  $001F   ; 584D   0000 0000 0006 001F
        DECLE   $001F,  $003F,  $003F,  $001F   ; 5851   001F 003F 003F 001F
        DECLE   $0000,  $0000,  $0003,  $000F   ; 5855   0000 0000 0003 000F
        DECLE   $000F,  $001F,  $001F,  $000F   ; 5859   000F 001F 001F 000F
        DECLE   $0000,  $0001,  $0003,  $0003   ; 585D   0000 0001 0003 0003
        DECLE   $0003,  $0003,  $0001,  $0003   ; 5861   0003 0003 0001 0003
        DECLE   $0000,  $0000                   ; 5865   0000 0000

        NEGR    R0                              ; 5867   0020

        JSRD    R4,     .EXEC.47D               ; 5868   0004 0016 007D

        ADDR    R3,     R7                      ; 586B   00DF

        DECLE   $007E,  $0000,  $0080,  $0002   ; 586C   007E 0000 0080 0002
        DECLE   $0000,  $0014,  $005D,  $00FF   ; 5870   0000 0014 005D 00FF
        DECLE   $007E,  $0000,  $0000,  $0000   ; 5874   007E 0000 0000 0000
        DECLE   $0000,  $0054,  $007F,  $00F7   ; 5878   0000 0054 007F 00F7
        DECLE   $007E,  $0000,  $0000,  $0000   ; 587C   007E 0000 0000 0000
        DECLE   $0000,  $001E,  $0077,  $00DD   ; 5880   0000 001E 0077 00DD
        DECLE   $007E,  $0000,  $0001,  $0001   ; 5884   007E 0000 0001 0001
        DECLE   $0001,  $0001,  $0000,  $0000   ; 5888   0001 0001 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0001   ; 588C   0000 0000 0001 0001
        DECLE   $0001,  $0001,  $0000,  $0000   ; 5890   0001 0001 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0001   ; 5894   0000 0000 0001 0001
        DECLE   $0001,  $0001,  $0000,  $0000   ; 5898   0001 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 589C   0000 0000 0000 0001
        DECLE   $0003,  $0003,  $0003,  $0003   ; 58A0   0003 0003 0003 0003
        DECLE   $0007,  $0000,  $0000,  $0001   ; 58A4   0007 0000 0000 0001
        DECLE   $0003,  $0007,  $003F,  $001F   ; 58A8   0003 0007 003F 001F
L_58AC:
        INCR    R6                              ; 58AC   000E
        DECLE   $0000,  $0000,  $0000,  $0001   ; 58AD   0000 0000 0000 0001
        DECLE   $0001,  $0001,  $0001,  $0003   ; 58B1   0001 0001 0001 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58B5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58B9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58BD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58C1   0000 0000 0000 0000
        DECLE   $0038,  $007E,  $003F           ; 58C5   0038 007E 003F

        SLLC    R3,     2                       ; 58C8   005F
        ADDR    R0,     R1                      ; 58C9   00C1
        ADDR    R4,     R7                      ; 58CA   00E7

        DECLE   $007E,  $0000,  $0000           ; 58CB   007E 0000 0000

        SARC    R0,     2                       ; 58CE   007C
        ADDR    R7,     R6                      ; 58CF   00FE
        SARC    R3,     2                       ; 58D0   007F
        ADDR    R3,     R1                      ; 58D1   00D9
        ADDR    R4,     R7                      ; 58D2   00E7

        DECLE   $007E,  $0000,  $0000,  $0000   ; 58D3   007E 0000 0000 0000
        DECLE   $007C,  $00FE,  $00FF,  $00FF   ; 58D7   007C 00FE 00FF 00FF
        DECLE   $007E,  $0000,  $0000           ; 58DB   007E 0000 0000

        SARC    R0,     2                       ; 58DE   007C
        ADDR    R7,     R6                      ; 58DF   00FE
        SARC    R3,     2                       ; 58E0   007F
        ADDR    R3,     R1                      ; 58E1   00D9
        ADDR    R4,     R7                      ; 58E2   00E7

        DECLE   $007E,  $0001,  $0019,  $003B   ; 58E3   007E 0001 0019 003B
        DECLE   $0033,  $003F,  $001F,  $0007   ; 58E7   0033 003F 001F 0007
        DECLE   $0000,  $0001                   ; 58EB   0000 0001

        DIS                                     ; 58ED   0003
        DIS                                     ; 58EE   0003
        SETC                                    ; 58EF   0007
        INCR    R7                              ; 58F0   000F

        DECLE   $001F                           ; 58F1   001F
L_58F2:
        ADDR    R7,     R6                      ; 58F2   00FE
        DECLE   $00F8,  $0007,  $0007,  $0007   ; 58F3   00F8 0007 0007 0007
        DECLE   $0003,  $0001,  $0000,  $0000   ; 58F7   0003 0001 0000 0000
        DECLE   $0000,  $0007,  $0007,  $0007   ; 58FB   0000 0007 0007 0007
        DECLE   $0003,  $0001,  $0000,  $0000   ; 58FF   0003 0001 0000 0000
        DECLE   $0000,  $0007,  $0007,  $0007   ; 5903   0000 0007 0007 0007
        DECLE   $0003,  $0001,  $0000,  $0000   ; 5907   0003 0001 0000 0000
        DECLE   $0000,  $0003,  $0003,  $0003   ; 590B   0000 0003 0003 0003
        DECLE   $0001,  $0000,  $0000,  $0000   ; 590F   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5913   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5917   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 591B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 591F   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0010,  $0000   ; 5923   0000 0001 0010 0000
        DECLE   $0052,  $0000,  $0040,  $0004   ; 5927   0052 0000 0040 0004
        DECLE   $0020,  $0010,  $0000,  $004A   ; 592B   0020 0010 0000 004A
        DECLE   $0020,  $0000,  $0004,  $0020   ; 592F   0020 0000 0004 0020
        DECLE   $0000,  $0000,  $0045,  $0010   ; 5933   0000 0000 0045 0010
        DECLE   $0000,  $0004,  $0020,  $0000   ; 5937   0000 0004 0020 0000
        DECLE   $0004,  $0025,  $0010,  $0000   ; 593B   0004 0025 0010 0000
        DECLE   $0004,  $0020,  $0000,  $0004   ; 593F   0004 0020 0000 0004
        DECLE   $0010,  $00FF,  $00FF,  $00FF   ; 5943   0010 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00AA,  $003F   ; 5947   00FF 00FF 00AA 003F
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; 594B   007F 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00AA,  $003F   ; 594F   00FF 00FF 00AA 003F
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; 5953   007F 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $002A,  $003F   ; 5957   00FF 00FF 002A 003F
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; 595B   007F 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $002A,  $003F   ; 595F   00FF 00FF 002A 003F
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; 5963   007F 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $002A,  $003F   ; 5967   00FF 00FF 002A 003F
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; 596B   007F 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0015,  $001F   ; 596F   00FF 00FF 0015 001F
        DECLE   $003F,  $007F,  $00FF,  $00FF   ; 5973   003F 007F 00FF 00FF
        DECLE   $007F,  $001F                   ; 5977   007F 001F

        INCR    R2                              ; 5979   000A
        INCR    R7                              ; 597A   000F
        INCR    R7                              ; 597B   000F

L_597C:
        DIS                                     ; 597C   0003
L_597D:
        SETC                                    ; 597D   0007
        DECLE   $0007,  $0007,  $0007,  $0002   ; 597E   0007 0007 0007 0002
        DECLE   $0003,  $0007,  $007E,  $00F8   ; 5982   0003 0007 007E 00F8
        DECLE   $00E0,  $0074,  $007E,  $007B   ; 5986   00E0 0074 007E 007B
        DECLE   $003E,  $000C,  $007E,  $00F8   ; 598A   003E 000C 007E 00F8
        DECLE   $00E0,  $0074,  $007A,  $007F   ; 598E   00E0 0074 007A 007F
        DECLE   $003E,  $000C,  $007E,  $00F8   ; 5992   003E 000C 007E 00F8
        DECLE   $00E0,  $007A,  $007E,  $007F   ; 5996   00E0 007A 007E 007F
        DECLE   $003E,  $000C,  $007E,  $00F8   ; 599A   003E 000C 007E 00F8
        DECLE   $00E0,  $0075,  $007E,  $007F   ; 599E   00E0 0075 007E 007F
        DECLE   $003A,  $000C,  $00FF,  $00FF   ; 59A2   003A 000C 00FF 00FF
        DECLE   $00FF,  $00F7,  $00E3,  $00FB   ; 59A6   00FF 00F7 00E3 00FB
        DECLE   $007F,  $00FB,  $00FF,  $00FF   ; 59AA   007F 00FB 00FF 00FF
        DECLE   $00FF,  $00F7,  $00E3,  $00FB   ; 59AE   00FF 00F7 00E3 00FB
        DECLE   $007F,  $00FB,  $00FF,  $00FF   ; 59B2   007F 00FB 00FF 00FF
        DECLE   $00FF,  $00F7,  $00E3,  $00FB   ; 59B6   00FF 00F7 00E3 00FB
        DECLE   $007F,  $00FB,  $00FF,  $00FF   ; 59BA   007F 00FB 00FF 00FF
        DECLE   $00FF,  $00F7                   ; 59BE   00FF 00F7

        ADDR    R4,     R3                      ; 59C0   00E3
        ADDR    R0,     R3                      ; 59C1   00C3
        ADDR    R0,     R3                      ; 59C2   00C3
        ADDR    R0,     R7                      ; 59C3   00C7

        DECLE   $00FF,  $00FF,  $00FF,  $00E7   ; 59C4   00FF 00FF 00FF 00E7
        DECLE   $00C3,  $0083,  $0003,  $0007   ; 59C8   00C3 0083 0003 0007
        DECLE   $007F,  $007F,  $00FF           ; 59CC   007F 007F 00FF

        ADDR    R7,     R3                      ; 59CF   00FB
        ADDR    R6,     R3                      ; 59D0   00F3
        ADDR    R4,     R3                      ; 59D1   00E3
        ADDR    R4,     R3                      ; 59D2   00E3
        ADDR    R4,     R7                      ; 59D3   00E7

        DECLE   $000F,  $001F,  $001F,  $001F   ; 59D4   000F 001F 001F 001F
        DECLE   $001F,  $001F,  $001F,  $003F   ; 59D8   001F 001F 001F 003F
        DECLE   $0007,  $0007,  $0003,  $0003   ; 59DC   0007 0007 0003 0003
        DECLE   $001B,  $001F                   ; 59E0   001B 001F

        INCR    R7                              ; 59E2   000F

        SETC                                    ; 59E3   0007
L_59E4:
        PSHR    R5                              ; 59E4   0275
        MVI     G_0108, R0                      ; 59E5   0280 0108
        TSTR    R0                              ; 59E7   0080
        BEQ     L_5D2B                          ; 59E8   0204 0341

        MVI     G_018C, R3                      ; 59EA   0283 018C
        ADD     G_034D, R3                      ; 59EC   02C3 034D
        BNEQ    L_5D2B                          ; 59EE   020C 033B

        JSR     R5,     L_5672                  ; 59F0   0004 0154 0272

        ADDI    #$0014, R4                      ; 59F3   02FC 0014
        MVI     G_032D, R1                      ; 59F5   0281 032D
        ANDI    #$0007, R1                      ; 59F7   03B9 0007
        CMPI    #$0004, R1                      ; 59F9   0379 0004
        BLT     L_59FF                          ; 59FB   0205 0002

        ADDI    #$0014, R4                      ; 59FD   02FC 0014
L_59FF:
        MVI@    R4,     R0                      ; 59FF   02A0
        MVII    #$01F8, R2                      ; 5A00   02BA 01F8
        ANDR    R2,     R0                      ; 5A02   0190
        BNEQ    L_5A09                          ; 5A03   020C 0004

        MVI@    R4,     R0                      ; 5A05   02A0
        ANDR    R2,     R0                      ; 5A06   0190
        BEQ     L_5D2B                          ; 5A07   0204 0322

L_5A09:
        MVI     G_019A, R0                      ; 5A09   0280 019A
        TSTR    R0                              ; 5A0B   0080
        BNEQ    L_5D2B                          ; 5A0C   020C 031D

L_5A0E:
        MVI     G_034D, R0                      ; 5A0E   0280 034D
        ADD     G_034E, R0                      ; 5A10   02C0 034E
        BNEQ    L_5A28                          ; 5A12   020C 0014

        MVO     R0,     G_0126                  ; 5A14   0240 0126
        MVO     R0,     G_0136                  ; 5A16   0240 0136
        MVII    #$001E, R0                      ; 5A18   02B8 001E
        MVO     R0,     G_034D                  ; 5A1A   0240 034D
        MVII    #$0004, R0                      ; 5A1C   02B8 0004
        MVO     R0,     G_0345                  ; 5A1E   0240 0345
        MVO     R0,     G_0346                  ; 5A20   0240 0346
        SDBD                                    ; 5A22   0001
        MVII    #$6A4E, R3                      ; 5A23   02BB 004E 006A
        MVO     R3,     G_033D                  ; 5A26   0243 033D
L_5A28:
        PULR    R7                              ; 5A28   02B7

        PSHR    R5                              ; 5A29   0275
        MVI     G_0108, R0                      ; 5A2A   0280 0108
        TSTR    R0                              ; 5A2C   0080
        BEQ     L_5AE2                          ; 5A2D   0204 00B3

        MVI     G_018C, R0                      ; 5A2F   0280 018C
        ADD     G_034D, R0                      ; 5A31   02C0 034D
        BNEQ    L_5D2B                          ; 5A33   020C 02F6

        MOVR    R1,     R5                      ; 5A35   008D
        MVII    #$032D, R3                      ; 5A36   02BB 032D
        MVI@    R3,     R0                      ; 5A38   0298
        ADDR    R1,     R3                      ; 5A39   00CB
        CMPI    #$0004, R5                      ; 5A3A   037D 0004
        BEQ     L_5A3F                          ; 5A3C   0204 0001

        INCR    R3                              ; 5A3E   000B
L_5A3F:
        MVI@    R3,     R1                      ; 5A3F   0299
        ANDI    #$007F, R0                      ; 5A40   03B8 007F
        ANDI    #$007F, R1                      ; 5A42   03B9 007F
        ADDI    #$000B, R0                      ; 5A44   02F8 000B
        SUBR    R0,     R1                      ; 5A46   0101
        BMI     L_5D2B                          ; 5A47   020B 02E2

        CMPI    #$0006, R1                      ; 5A49   0379 0006
        BGT     L_5D2B                          ; 5A4B   020E 02DE

        MVI     G_019A, R0                      ; 5A4D   0280 019A
        TSTR    R0                              ; 5A4F   0080
        BNEQ    L_5A54                          ; 5A50   020C 0002
        B       L_5A0E                          ; 5A52   0220 0045

L_5A54:
        CLRR    R0                              ; 5A54   01C0
        MVO     R0,     G_0347                  ; 5A55   0240 0347
        MOVR    R5,     R3                      ; 5A57   00AB
        SDBD                                    ; 5A58   0001
        MVII    #$6A90, R1                      ; 5A59   02B9 0090 006A

        JSR     R5,     L_5599                  ; 5A5C   0004 0154 0199

        SUBI    #$0008, R3                      ; 5A5F   033B 0008
        MVI@    R3,     R0                      ; 5A61   0298
        SDBD                                    ; 5A62   0001
        ANDI    #$2FF8, R0                      ; 5A63   03B8 00F8 002F
        XORI    #$0007, R0                      ; 5A66   03F8 0007
        MVO@    R0,     R3                      ; 5A68   0258
        MVII    #$0028, R0                      ; 5A69   02B8 0028
        ADDI    #$0018, R3                      ; 5A6B   02FB 0018
        MVO@    R0,     R3                      ; 5A6D   0258
        SUBI    #$0020, R3                      ; 5A6E   033B 0020
        MVI@    R3,     R0                      ; 5A70   0298
        ANDI    #$007F, R0                      ; 5A71   03B8 007F
        MVO@    R0,     R3                      ; 5A73   0258
        SUBI    #$0008, R3                      ; 5A74   033B 0008
        MVI@    R3,     R0                      ; 5A76   0298
        ANDI    #$00FF, R0                      ; 5A77   03B8 00FF
        SDBD                                    ; 5A79   0001
        XORI    #$8800, R0                      ; 5A7A   03F8 0000 0088
        MVO@    R0,     R3                      ; 5A7D   0258
        MVII    #$0032, R0                      ; 5A7E   02B8 0032
        J       L_63CB                          ; 5A80   0004 0360 03CB

        PSHR    R5                              ; 5A83   0275
        MVI     G_032D, R0                      ; 5A84   0280 032D
        ANDI    #$007F, R0                      ; 5A86   03B8 007F
        MVI     G_0334, R1                      ; 5A88   0281 0334
        SUBI    #$0008, R1                      ; 5A8A   0339 0008
        ANDI    #$007F, R1                      ; 5A8C   03B9 007F
        SUBR    R1,     R0                      ; 5A8E   0108
        BMI     L_5D2B                          ; 5A8F   020B 029A

        CMPI    #$0006, R0                      ; 5A91   0378 0006
        BGT     L_5D2B                          ; 5A93   020E 0296

        CLRR    R0                              ; 5A95   01C0
        MVO     R0,     G_034C                  ; 5A96   0240 034C
        MVO     R0,     G_034D                  ; 5A98   0240 034D
        DECR    R0                              ; 5A9A   0010
        MVO     R0,     G_019A                  ; 5A9B   0240 019A

        JSR     R5,     L_6124                  ; 5A9D   0004 0160 0124

        MVI     G_0336, R0                      ; 5AA0   0280 0336
        SDBD                                    ; 5AA2   0001
        ANDI    #$FFFA, R0                      ; 5AA3   03B8 00FA 00FF
        MVO     R0,     G_0336                  ; 5AA6   0240 0336

        JSR     R5,     L_6E6B                  ; 5AA8   0004 016C 026B

        MVII    #$0080, R0                      ; 5AAB   02B8 0080
        MVO     R0,     G_0353                  ; 5AAD   0240 0353
        MVII    #$0007, R3                      ; 5AAF   02BB 0007
        SDBD                                    ; 5AB1   0001
        MVII    #$6A90, R1                      ; 5AB2   02B9 0090 006A

        JSR     R5,     L_5599                  ; 5AB5   0004 0154 0199

        MVII    #$0028, R0                      ; 5AB8   02B8 0028
        ADDI    #$0010, R3                      ; 5ABA   02FB 0010
        MVO@    R0,     R3                      ; 5ABC   0258
        MVII    #$0088, R2                      ; 5ABD   02BA 0088
        SWAP    R2,     1                       ; 5ABF   0042
        MVI     G_032C, R3                      ; 5AC0   0283 032C
        ANDI    #$00FF, R3                      ; 5AC2   03BB 00FF
        XORR    R2,     R3                      ; 5AC4   01D3
        MVO     R3,     G_032C                  ; 5AC5   0243 032C
        MVI     G_0334, R2                      ; 5AC7   0282 0334
        ANDI    #$007F, R2                      ; 5AC9   03BA 007F
        MVO     R2,     G_0334                  ; 5ACB   0242 0334
        MVII    #$0032, R0                      ; 5ACD   02B8 0032
        J       L_63CB                          ; 5ACF   0004 0360 03CB

        PSHR    R5                              ; 5AD2   0275

L_5AD3:
        JSR     R5,     L_5694                  ; 5AD3   0004 0154 0294

        MVO     R0,     G_018C                  ; 5AD6   0240 018C
        MVO     R0,     G_0108                  ; 5AD8   0240 0108
        DECR    R0                              ; 5ADA   0010
        MVO     R0,     G_0191                  ; 5ADB   0240 0191
        MVO     R0,     G_032A                  ; 5ADD   0240 032A

        JSR     R5,     L_5565                  ; 5ADF   0004 0154 0165
L_5AE2:
        JSR     R5,     L_6ED5                  ; 5AE2   0004 016C 02D5

        CLRR    R0                              ; 5AE5   01C0
        MVO     R0,     G_0136                  ; 5AE6   0240 0136
        MVO     R0,     G_0126                  ; 5AE8   0240 0126
        MVII    #$0005, R2                      ; 5AEA   02BA 0005
        MVO     R2,     G_0345                  ; 5AEC   0242 0345
        MVO     R2,     G_0346                  ; 5AEE   0242 0346
        INCR    R2                              ; 5AF0   000A
        MVII    #$0002, R3                      ; 5AF1   02BB 0002

        JSR     R5,     L_557B                  ; 5AF3   0004 0154 017B

        MVII    #$032C, R3                      ; 5AF6   02BB 032C
        SDBD                                    ; 5AF8   0001
        MVII    #$6A1E, R4                      ; 5AF9   02BC 001E 006A

        JSR     R5,     L_55CC                  ; 5AFC   0004 0154 01CC

        MVII    #$0007, R4                      ; 5AFF   02BC 0007
        MVII    #$0325, R3                      ; 5B01   02BB 0325
        MVII    #$00FF, R2                      ; 5B03   02BA 00FF

        JSR     R5,     L_5B0B                  ; 5B05   0004 0158 030B

        INCR    R3                              ; 5B08   000B
        SLR     R2,     1                       ; 5B09   0062
        PULR    R5                              ; 5B0A   02B5
L_5B0B:
        MVI@    R3,     R0                      ; 5B0B   0298
        ANDR    R2,     R0                      ; 5B0C   0190
        COMR    R2                              ; 5B0D   001A
        ADDR    R4,     R3                      ; 5B0E   00E3
        MVI@    R3,     R1                      ; 5B0F   0299
        ANDR    R2,     R1                      ; 5B10   0191
        COMR    R2                              ; 5B11   001A
        XORR    R0,     R1                      ; 5B12   01C1
        MVO@    R1,     R3                      ; 5B13   0259
        MOVR    R5,     R7                      ; 5B14   00AF

        PSHR    R5                              ; 5B15   0275
        MVI     G_0326, R0                      ; 5B16   0280 0326
        ANDI    #$00FF, R0                      ; 5B18   03B8 00FF
        CMPI    #$003C, R0                      ; 5B1A   0378 003C
        BLT     L_5D2B                          ; 5B1C   0205 020D

        JSR     R5,     L_5BD4                  ; 5B1E   0004 0158 03D4

        MVII    #$0010, R1                      ; 5B21   02B9 0010
        MVO     R1,     G_0128                  ; 5B23   0241 0128
        MVO     R1,     G_012C                  ; 5B25   0241 012C
        SLL     R1,     1                       ; 5B27   0049
        MVII    #$0058, R2                      ; 5B28   02BA 0058
        MOVR    R2,     R3                      ; 5B2A   0093
        MVII    #$0325, R4                      ; 5B2B   02BC 0325

        JSR     R5,     L_561A                  ; 5B2D   0004 0154 021A

        MVII    #$0200, R0                      ; 5B30   02B8 0200
        SLL     R0,     2                       ; 5B32   004C
        XOR     G_032D, R0                      ; 5B33   03C0 032D
        MVO     R0,     G_032D                  ; 5B35   0240 032D

        JSR     R5,     L_5B41                  ; 5B37   0004 0158 0341

        MVO     R0,     G_0354                  ; 5B3A   0240 0354
        MVO     R0,     G_034C                  ; 5B3C   0240 034C
        J       L_6F54                          ; 5B3E   0004 036C 0354

L_5B41:
        PSHR    R5                              ; 5B41   0275
        MVII    #$032C, R3                      ; 5B42   02BB 032C
        SDBD                                    ; 5B44   0001
        MVII    #$694C, R4                      ; 5B45   02BC 004C 0069

        JSR     R5,     L_55CC                  ; 5B48   0004 0154 01CC

        MVII    #$032C, R3                      ; 5B4B   02BB 032C
        MVI@    R3,     R1                      ; 5B4D   0299
        ADDI    #$004C, R1                      ; 5B4E   02F9 004C
        MVO@    R1,     R3                      ; 5B50   0259
        ADDI    #$0008, R3                      ; 5B51   02FB 0008
        MVI@    R3,     R1                      ; 5B53   0299
        SUBI    #$001A, R1                      ; 5B54   0339 001A
        MVO@    R1,     R3                      ; 5B56   0259
        PULR    R7                              ; 5B57   02B7

        MVI     G_0190, R0                      ; 5B58   0280 0190
        TSTR    R0                              ; 5B5A   0080
        BEQ     L_5B62                          ; 5B5B   0204 0005

        MVII    #$0005, R3                      ; 5B5D   02BB 0005
        J       L_557D                          ; 5B5F   0004 0354 017D

L_5B62:
        MVII    #$00FF, R0                      ; 5B62   02B8 00FF
        SWAP    R0,     1                       ; 5B64   0040
        AND     G_032A, R0                      ; 5B65   0380 032A
        XORI    #$0058, R0                      ; 5B67   03F8 0058
        MVO     R0,     G_032A                  ; 5B69   0240 032A
        MOVR    R5,     R7                      ; 5B6B   00AF

        MVII    #$00FF, R0                      ; 5B6C   02B8 00FF
        SWAP    R0,     1                       ; 5B6E   0040
        MVII    #$0326, R3                      ; 5B6F   02BB 0326
        AND@    R3,     R0                      ; 5B71   0398
        XORI    #$000F, R0                      ; 5B72   03F8 000F
        MVO@    R0,     R3                      ; 5B74   0258
        MOVR    R5,     R7                      ; 5B75   00AF

        PSHR    R5                              ; 5B76   0275
        MVI     G_0325, R0                      ; 5B77   0280 0325
        ANDI    #$00FF, R0                      ; 5B79   03B8 00FF
        CMPI    #$0010, R0                      ; 5B7B   0378 0010
        BLT     L_5BB4                          ; 5B7D   0205 0035

        SDBD                                    ; 5B7F   0001
        MVII    #$6D43, R1                      ; 5B80   02B9 0043 006D

        JSR     R5,     L_5599                  ; 5B83   0004 0154 0199

        MVII    #$0005, R3                      ; 5B86   02BB 0005
        SDBD                                    ; 5B88   0001
        ADDI    #$0006, R1                      ; 5B89   02F9 0006 0000

        JSR     R5,     L_5599                  ; 5B8C   0004 0154 0199

        CLRR    R3                              ; 5B8F   01DB
        MVO     R3,     G_018F                  ; 5B90   0243 018F
        MVO     R3,     G_0193                  ; 5B92   0243 0193
        MVI     G_0325, R0                      ; 5B94   0280 0325
        MVI     G_0329, R1                      ; 5B96   0281 0329
        MVII    #$00FF, R2                      ; 5B98   02BA 00FF
        ANDR    R2,     R0                      ; 5B9A   0190
        ANDR    R2,     R1                      ; 5B9B   0191
        MOVR    R0,     R4                      ; 5B9C   0084
        MOVR    R1,     R5                      ; 5B9D   008D
        SUBR    R1,     R0                      ; 5B9E   0108
        ANDR    R2,     R0                      ; 5B9F   0190
        MVI     G_01B1, R3                      ; 5BA0   0283 01B1
        ADDR    R0,     R3                      ; 5BA2   00C3
        CMPR    R4,     R5                      ; 5BA3   0165
        BGT     L_5BA8                          ; 5BA4   020E 0002

        ANDI    #$007F, R3                      ; 5BA6   03BB 007F
L_5BA8:
        MVO     R3,     G_012A                  ; 5BA8   0243 012A
        TSTR    R0                              ; 5BAA   0080
        BMI     L_5BB3                          ; 5BAB   020B 0006

        SDBD                                    ; 5BAD   0001
        MVII    #$8020, R0                      ; 5BAE   02B8 0020 0080
        MVO     R0,     G_0347                  ; 5BB1   0240 0347
L_5BB3:
        PULR    R7                              ; 5BB3   02B7

L_5BB4:
        JSR     R5,     L_5694                  ; 5BB4   0004 0154 0294

        MVO     R0,     G_0108                  ; 5BB7   0240 0108

        JSR     R5,     L_5565                  ; 5BB9   0004 0154 0165

        B       L_5AE2                          ; 5BBC   0220 00DB

        PSHR    R5                              ; 5BBE   0275

        JSR     R5,     L_5BD4                  ; 5BBF   0004 0158 03D4

        DECR    R0                              ; 5BC2   0010
        MVO     R0,     G_0128                  ; 5BC3   0240 0128

        JSR     R5,     L_6ED5                  ; 5BC5   0004 016C 02D5
        JSR     R5,     L_5B41                  ; 5BC8   0004 0158 0341

        MVII    #$0080, R0                      ; 5BCB   02B8 0080
        MVO     R0,     G_034C                  ; 5BCD   0240 034C
        MVII    #$005A, R0                      ; 5BCF   02B8 005A
        MVO     R0,     G_0354                  ; 5BD1   0240 0354
        PULR    R7                              ; 5BD3   02B7

L_5BD4:
        MVI     G_0190, R0                      ; 5BD4   0280 0190
        TSTR    R0                              ; 5BD6   0080
        BNEQ    L_5D2B                          ; 5BD7   020C 0152

        INCR    R0                              ; 5BD9   0008
        MVO     R0,     G_0190                  ; 5BDA   0240 0190
        MOVR    R5,     R7                      ; 5BDC   00AF

L_5BDD:
        MVO     R0,     G_019D                  ; 5BDD   0240 019D
L_5BDF:
        PSHR    R5                              ; 5BDF   0275
L_5BE0:
        CMPI    #$00FF, R0                      ; 5BE0   0378 00FF
        BEQ     L_5C3B                          ; 5BE2   0204 0057

        CMP     G_0188, R1                      ; 5BE4   0341 0188
        BNEQ    L_5C3B                          ; 5BE6   020C 0053

        MVI     G_0180, R1                      ; 5BE8   0281 0180
        CMPI    #$0007, R1                      ; 5BEA   0379 0007
        BEQ     L_5C3C                          ; 5BEC   0204 004E

        MVI     G_0108, R1                      ; 5BEE   0281 0108
        TSTR    R1                              ; 5BF0   0089
        BEQ     L_5C3B                          ; 5BF1   0204 0048

        TSTR    R0                              ; 5BF3   0080
        BMI     L_5C36                          ; 5BF4   020B 0040

        MVI     G_034D, R1                      ; 5BF6   0281 034D
        TSTR    R1                              ; 5BF8   0089
        BNEQ    L_5C36                          ; 5BF9   020C 003B

        MVI     G_018C, R1                      ; 5BFB   0281 018C
        TSTR    R1                              ; 5BFD   0089
        BEQ     L_5C0E                          ; 5BFE   0204 000E

        MVI     G_01AA, R1                      ; 5C00   0281 01AA
        CLRR    R0                              ; 5C02   01C0
        MVI     G_032D, R2                      ; 5C03   0282 032D
        SDBD                                    ; 5C05   0001
        ANDI    #$0400, R2                      ; 5C06   03BA 0000 0004
        BEQ     L_5C23                          ; 5C09   0204 0018

        NEGR    R1                              ; 5C0B   0021
        B       L_5C23                          ; 5C0C   0200 0015

L_5C0E:
        CLRR    R3                              ; 5C0E   01DB
        MVI     G_01AA, R1                      ; 5C0F   0281 01AA
        CMPI    #$000B, R0                      ; 5C11   0378 000B
        BGT     L_5C20                          ; 5C13   020E 000B

        CMPI    #$0005, R0                      ; 5C15   0378 0005
        BLT     L_5C20                          ; 5C17   0205 0007

        JSR     R5,     L_63DE                  ; 5C19   0004 0160 03DE

        SUBI    #$0032, R1                      ; 5C1C   0339 0032
        B       L_5C23                          ; 5C1E   0200 0003

L_5C20:
        JSR     R5,     L_63E2                  ; 5C20   0004 0160 03E2

L_5C23:
        MOVR    R1,     R2                      ; 5C23   008A
        MOVR    R0,     R1                      ; 5C24   0081
        MOVR    R2,     R0                      ; 5C25   0090
        SLR     R0,     1                       ; 5C26   0060

        JSR     R5,     .EXEC.629               ; 5C27   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 5C2A   0004 0114 0357

        MOVR    R1,     R2                      ; 5C2D   008A
        MOVR    R0,     R1                      ; 5C2E   0081
        MVII    #$0126, R3                      ; 5C2F   02BB 0126
        MVO@    R1,     R3                      ; 5C31   0259
        ADDI    #$0010, R3                      ; 5C32   02FB 0010
        MVO@    R2,     R3                      ; 5C34   025A
        PULR    R7                              ; 5C35   02B7

L_5C36:
        CLRR    R0                              ; 5C36   01C0
        MVO     R0,     G_0136                  ; 5C37   0240 0136
        MVO     R0,     G_0126                  ; 5C39   0240 0126
L_5C3B:
        PULR    R7                              ; 5C3B   02B7

L_5C3C:
        CLRR    R1                              ; 5C3C   01C9
        MVI     G_0354, R2                      ; 5C3D   0282 0354
        TSTR    R2                              ; 5C3F   0092
        BNEQ    L_5C78                          ; 5C40   020C 0036

        ADD     G_0344, R2                      ; 5C42   02C2 0344
        BNEQ    L_5C7A                          ; 5C44   020C 0034

        MVI     G_0191, R2                      ; 5C46   0282 0191
        ADD     G_034D, R2                      ; 5C48   02C2 034D
        BNEQ    L_5C7A                          ; 5C4A   020C 002E

        MVI     G_033D, R2                      ; 5C4C   0282 033D
        SDBD                                    ; 5C4E   0001
        CMPI    #$6A32, R2                      ; 5C4F   037A 0032 006A
        BNEQ    L_5C78                          ; 5C52   020C 0024

        TSTR    R0                              ; 5C54   0080
        BMI     L_5C78                          ; 5C55   020B 0021

        MVI     G_017F, R3                      ; 5C57   0283 017F
        CMPI    #$0007, R3                      ; 5C59   037B 0007
        BLT     L_5C5F                          ; 5C5B   0205 0002

        MVII    #$0007, R3                      ; 5C5D   02BB 0007
L_5C5F:
        SDBD                                    ; 5C5F   0001
        ADDI    #$63F6, R3                      ; 5C60   02FB 00F6 0063
        MVI@    R3,     R1                      ; 5C63   0299
        COMR    R1                              ; 5C64   0019
        PSHR    R1                              ; 5C65   0271

        JSR     R5,     L_63E2                  ; 5C66   0004 0160 03E2

        PULR    R1                              ; 5C69   02B1
        CMPI    #$0004, R0                      ; 5C6A   0378 0004
        BLT     L_5C78                          ; 5C6C   0205 000A

        CMPI    #$000C, R0                      ; 5C6E   0378 000C
        BGT     L_5C78                          ; 5C70   020E 0006

        COMR    R1                              ; 5C72   0019
        PSHR    R1                              ; 5C73   0271

        JSR     R5,     L_63DE                  ; 5C74   0004 0160 03DE

        PULR    R1                              ; 5C77   02B1
L_5C78:
        MVO     R1,     G_0128                  ; 5C78   0241 0128
L_5C7A:
        PULR    R7                              ; 5C7A   02B7

        MVI     G_0188, R2                      ; 5C7B   0282 0188
        CMPR    R1,     R2                      ; 5C7D   014A
        BNEQ    L_5C97                          ; 5C7E   020C 0017

        MVI     G_01A1, R2                      ; 5C80   0282 01A1
        TSTR    R2                              ; 5C82   0092
        BNEQ    L_5C97                          ; 5C83   020C 0012

        CMPR    R2,     R0                      ; 5C85   0150
        BLE     L_5C97                          ; 5C86   0206 000F

        MVI     G_034D, R1                      ; 5C88   0281 034D
        ADD     G_018C, R1                      ; 5C8A   02C1 018C
        BNEQ    L_5C97                          ; 5C8C   020C 0009

        INCR    R1                              ; 5C8E   0009
        MVO     R1,     G_018C                  ; 5C8F   0241 018C
        MVI     G_032D, R1                      ; 5C91   0281 032D
        ANDI    #$007F, R1                      ; 5C93   03B9 007F
        MVO     R1,     G_0192                  ; 5C95   0241 0192
L_5C97:
        MOVR    R5,     R7                      ; 5C97   00AF

        PSHR    R5                              ; 5C98   0275
        SDBD                                    ; 5C99   0001
        MVII    #$6A8A, R3                      ; 5C9A   02BB 008A 006A
        CMP     G_033D, R3                      ; 5C9D   0343 033D
        BEQ     L_5CE2                          ; 5C9F   0204 0041

        MVI     G_019B, R2                      ; 5CA1   0282 019B
        TSTR    R2                              ; 5CA3   0092
        BEQ     L_5CEC                          ; 5CA4   0204 0046

        CMPI    #$000B, R0                      ; 5CA6   0378 000B
        BNEQ    L_5CB2                          ; 5CA8   020C 0008

        MVI     G_019E, R0                      ; 5CAA   0280 019E
        TSTR    R0                              ; 5CAC   0080
        BEQ     L_5CEC                          ; 5CAD   0204 003D
        J       L_62F5                          ; 5CAF   0004 0360 02F5

L_5CB2:
        MVI     G_017D, R1                      ; 5CB2   0281 017D
        TSTR    R1                              ; 5CB4   0089
        BEQ     L_5CEC                          ; 5CB5   0204 0035

        CMPI    #$0004, R0                      ; 5CB7   0378 0004
        BLT     L_5CEC                          ; 5CB9   0205 0031

        CMPI    #$0009, R0                      ; 5CBB   0378 0009
        BGT     L_5CEC                          ; 5CBD   020E 002D

        SUBI    #$0003, R0                      ; 5CBF   0338 0003
        MOVR    R0,     R1                      ; 5CC1   0081
        ANDI    #$0004, R0                      ; 5CC2   03B8 0004
        BEQ     L_5CC9                          ; 5CC4   0204 0003

        MVII    #$0001, R0                      ; 5CC6   02B8 0001
        INCR    R1                              ; 5CC8   0009
L_5CC9:
        MVO     R0,     G_0187                  ; 5CC9   0240 0187
        ANDI    #$0003, R1                      ; 5CCB   03B9 0003
        DECR    R1                              ; 5CCD   0011
        SLL     R1,     1                       ; 5CCE   0049
        MVO     R1,     G_017F                  ; 5CCF   0241 017F
        MVO     R1,     G_0184                  ; 5CD1   0241 0184
        CLRR    R0                              ; 5CD3   01C0
        MVO     R0,     G_0180                  ; 5CD4   0240 0180
        MVO     R0,     G_019B                  ; 5CD6   0240 019B

        JSR     R5,     L_6EE6                  ; 5CD8   0004 016C 02E6

        MVII    #$0080, R0                      ; 5CDB   02B8 0080
        MVO     R0,     G_0146                  ; 5CDD   0240 0146
        J       L_64A1                          ; 5CDF   0004 0364 00A1

L_5CE2:
        CMPI    #$0003, R0                      ; 5CE2   0378 0003
        BNEQ    L_5CEC                          ; 5CE4   020C 0006

        SDBD                                    ; 5CE6   0001
        MVII    #$2B47, R0                      ; 5CE7   02B8 0047 002B
        MVO     R0,     .BTAB.EB                ; 5CEA   0240 02EB
L_5CEC:
        PULR    R7                              ; 5CEC   02B7

L_5CED:
        PSHR    R5                              ; 5CED   0275
        MVI     G_0181, R0                      ; 5CEE   0280 0181
        CMPI    #$005A, R0                      ; 5CF0   0378 005A
        BGT     L_5D2B                          ; 5CF2   020E 0037

        MVII    #$0001, R2                      ; 5CF4   02BA 0001
        MVI     G_0180, R0                      ; 5CF6   0280 0180
        CMPI    #$0002, R0                      ; 5CF8   0378 0002
        BLT     L_5D02                          ; 5CFA   0205 0006

        CMPI    #$0004, R0                      ; 5CFC   0378 0004
        BLT     L_5D1B                          ; 5CFE   0205 001B
        B       L_5D2B                          ; 5D00   0200 0029

L_5D02:
        MVI     G_018E, R0                      ; 5D02   0280 018E
        INCR    R0                              ; 5D04   0008
        MVO     R0,     G_018E                  ; 5D05   0240 018E
        CMPI    #$0014, R0                      ; 5D07   0378 0014
        BLT     L_5D2B                          ; 5D09   0205 0020

        CLRR    R0                              ; 5D0B   01C0
        MVO     R0,     G_018E                  ; 5D0C   0240 018E
        MVI     G_017F, R0                      ; 5D0E   0280 017F
        TSTR    R0                              ; 5D10   0080
        BEQ     L_5D2B                          ; 5D11   0204 0018

        SDBD                                    ; 5D13   0001
        MVII    #$6CF1, R4                      ; 5D14   02BC 00F1 006C
        MVI     G_01B2, R0                      ; 5D17   0280 01B2
        B       L_5D22                          ; 5D19   0200 0007

L_5D1B:
        SDBD                                    ; 5D1B   0001
        MVII    #$6D0D, R4                      ; 5D1C   02BC 000D 006D
        MVI     G_01B1, R0                      ; 5D1F   0280 01B1
        INCR    R2                              ; 5D21   000A
L_5D22:
        MVII    #$0329, R3                      ; 5D22   02BB 0329
        PSHR    R0                              ; 5D24   0270

        JSR     R5,     L_55CA                  ; 5D25   0004 0154 01CA

        PULR    R0                              ; 5D28   02B0
        MVO     R0,     G_012E                  ; 5D29   0240 012E
L_5D2B:
        PULR    R7                              ; 5D2B   02B7

        PSHR    R5                              ; 5D2C   0275
        MVI     G_033F, R0                      ; 5D2D   0280 033F
        TSTR    R0                              ; 5D2F   0080
        BNEQ    L_5D3F                          ; 5D30   020C 000D

        MVI     G_0180, R0                      ; 5D32   0280 0180
        MVI     G_0181, R1                      ; 5D34   0281 0181
        CMPI    #$005A, R1                      ; 5D36   0379 005A
        BLT     L_5D3C                          ; 5D38   0205 0002

        MVII    #$0004, R0                      ; 5D3A   02B8 0004

L_5D3C:
        JSR     R5,     L_5FA6                  ; 5D3C   0004 015C 03A6
L_5D3F:
        JSR     R5,     L_606F                  ; 5D3F   0004 0160 006F

        MVI     G_0341, R0                      ; 5D42   0280 0341
        TSTR    R0                              ; 5D44   0080
        BNEQ    L_5D4A                          ; 5D45   020C 0003

        JSR     R5,     L_5CED                  ; 5D47   0004 015C 00ED

L_5D4A:
        MVI     G_0341, R3                      ; 5D4A   0283 0341
        SDBD                                    ; 5D4C   0001
        CMPI    #$6D43, R3                      ; 5D4D   037B 0043 006D
        BEQ     L_5D91                          ; 5D50   0204 003F

        SDBD                                    ; 5D52   0001
        CMPI    #$6D37, R3                      ; 5D53   037B 0037 006D
        BNEQ    L_5DD0                          ; 5D56   020C 0078

        MVI     G_017F, R0                      ; 5D58   0280 017F
        CMPI    #$0003, R0                      ; 5D5A   0378 0003
        BLT     L_5D7B                          ; 5D5C   0205 001D

        MVI     G_0325, R0                      ; 5D5E   0280 0325
        ADDI    #$0030, R0                      ; 5D60   02F8 0030
        ANDI    #$00FF, R0                      ; 5D62   03B8 00FF
        MVI     G_0329, R1                      ; 5D64   0281 0329
        ANDI    #$00FF, R1                      ; 5D66   03B9 00FF
        CMPR    R0,     R1                      ; 5D68   0141
        BLT     L_5D7B                          ; 5D69   0205 0010

        MVI     G_01B0, R0                      ; 5D6B   0280 01B0
        MVO     R0,     G_012E                  ; 5D6D   0240 012E
        MVI     G_0331, R0                      ; 5D6F   0280 0331
        SDBD                                    ; 5D71   0001
        ANDI    #$FBFF, R0                      ; 5D72   03B8 00FF 00FB
        SDBD                                    ; 5D75   0001
        XORI    #$0400, R0                      ; 5D76   03F8 0000 0004
        MVO     R0,     G_0331                  ; 5D79   0240 0331
L_5D7B:
        MVII    #$0004, R3                      ; 5D7B   02BB 0004
        MVII    #$00F4, R1                      ; 5D7D   02B9 00F4

        JSR     R5,     L_6613                  ; 5D7F   0004 0164 0213

        MVII    #$0329, R3                      ; 5D82   02BB 0329
        MVI@    R3,     R0                      ; 5D84   0298
        ANDI    #$00FF, R0                      ; 5D85   03B8 00FF
        CMPI    #$00AA, R0                      ; 5D87   0378 00AA
        BLT     L_5DD0                          ; 5D89   0205 0045

        MVII    #$0004, R3                      ; 5D8B   02BB 0004

        JSR     R5,     L_557D                  ; 5D8D   0004 0154 017D

        PULR    R7                              ; 5D90   02B7

L_5D91:
        MVII    #$0004, R3                      ; 5D91   02BB 0004

        JSR     R5,     L_55BD                  ; 5D93   0004 0154 01BD

        CMPI    #$0096, R0                      ; 5D96   0378 0096
        BGT     L_5DAB                          ; 5D98   020E 0011

        CMPI    #$0020, R0                      ; 5D9A   0378 0020
        BGT     L_5DD0                          ; 5D9C   020E 0032

        MVII    #$0004, R3                      ; 5D9E   02BB 0004

        JSR     R5,     L_63DE                  ; 5DA0   0004 0160 03DE

        MVII    #$00F8, R0                      ; 5DA3   02B8 00F8
        MVO     R0,     G_0130                  ; 5DA5   0240 0130
        MVI     G_01B1, R0                      ; 5DA7   0280 01B1
        B       L_5DB6                          ; 5DA9   0200 000B

L_5DAB:
        MVII    #$0004, R3                      ; 5DAB   02BB 0004

        JSR     R5,     L_63E2                  ; 5DAD   0004 0160 03E2

        MVII    #$0008, R0                      ; 5DB0   02B8 0008
        MVO     R0,     G_0130                  ; 5DB2   0240 0130
        MVI     G_01AF, R0                      ; 5DB4   0280 01AF
L_5DB6:
        MVO     R0,     G_012E                  ; 5DB6   0240 012E
        MVI     G_0181, R0                      ; 5DB8   0280 0181
        CMPI    #$005A, R0                      ; 5DBA   0378 005A
        BLT     L_5DC7                          ; 5DBC   0205 0009

        MVII    #$0002, R2                      ; 5DBE   02BA 0002
        MVII    #$0004, R3                      ; 5DC0   02BB 0004

        JSR     R5,     L_557B                  ; 5DC2   0004 0154 017B

        B       L_5DD0                          ; 5DC5   0200 0009

L_5DC7:
        MVI     G_018F, R1                      ; 5DC7   0281 018F
        TSTR    R1                              ; 5DC9   0089
        BEQ     L_5DD0                          ; 5DCA   0204 0004

        MVI     G_012E, R0                      ; 5DCC   0280 012E
        MVO     R0,     G_012A                  ; 5DCE   0240 012A
L_5DD0:
        PULR    R7                              ; 5DD0   02B7

        PSHR    R5                              ; 5DD1   0275
        MVI     G_018C, R0                      ; 5DD2   0280 018C
        TSTR    R0                              ; 5DD4   0080
        BNEQ    L_5E0B                          ; 5DD5   020C 0034

        MVI     G_034D, R0                      ; 5DD7   0280 034D
        TSTR    R0                              ; 5DD9   0080
        BNEQ    L_5DF4                          ; 5DDA   020C 0018

        MVI     G_0126, R0                      ; 5DDC   0280 0126
        TSTR    R0                              ; 5DDE   0080
        BEQ     L_5DE8                          ; 5DDF   0204 0007

        MVI     G_0345, R3                      ; 5DE1   0283 0345
        INCR    R3                              ; 5DE3   000B
        CMPI    #$0003, R3                      ; 5DE4   037B 0003
        BLT     L_5DE9                          ; 5DE6   0205 0001

L_5DE8:
        CLRR    R3                              ; 5DE8   01DB
L_5DE9:
        MVO     R3,     G_0345                  ; 5DE9   0243 0345
        MVO     R3,     G_0346                  ; 5DEB   0243 0346
        CMPI    #$0002, R3                      ; 5DED   037B 0002
        BNEQ    L_5DF4                          ; 5DEF   020C 0003

        JSR     R5,     L_6E5E                  ; 5DF1   0004 016C 025E

L_5DF4:
        MVI     G_032D, R0                      ; 5DF4   0280 032D
        MOVR    R0,     R1                      ; 5DF6   0081
        MVII    #$007F, R2                      ; 5DF7   02BA 007F
        ANDR    R2,     R0                      ; 5DF9   0190
        COMR    R2                              ; 5DFA   001A
        ANDR    R2,     R1                      ; 5DFB   0191
        MVII    #$0024, R3                      ; 5DFC   02BB 0024
        CMPR    R3,     R0                      ; 5DFE   0158
        BGE     L_5E02                          ; 5DFF   020D 0001

        MOVR    R3,     R0                      ; 5E01   0098
L_5E02:
        MVII    #$0050, R3                      ; 5E02   02BB 0050
        CMPR    R3,     R0                      ; 5E04   0158
        BLT     L_5E08                          ; 5E05   0205 0001

        MOVR    R3,     R0                      ; 5E07   0098
L_5E08:
        XORR    R0,     R1                      ; 5E08   01C1
        MVO     R1,     G_032D                  ; 5E09   0241 032D
L_5E0B:
        MVI     G_0325, R0                      ; 5E0B   0280 0325
        MOVR    R0,     R1                      ; 5E0D   0081
        MVII    #$00FF, R2                      ; 5E0E   02BA 00FF
        ANDR    R2,     R0                      ; 5E10   0190
        CMPI    #$0010, R0                      ; 5E11   0378 0010
        BGT     L_5E9B                          ; 5E13   020E 0086

L_5E15:
        CLRR    R0                              ; 5E15   01C0
        MVO     R0,     G_034D                  ; 5E16   0240 034D
        MVO     R0,     G_034E                  ; 5E18   0240 034E
        MVO     R0,     G_0126                  ; 5E1A   0240 0126
        NOP                                     ; 5E1C   0034
        MVO     R0,     G_0136                  ; 5E1D   0240 0136
        MVO     R0,     G_032B                  ; 5E1F   0240 032B
        MVO     R0,     G_032C                  ; 5E21   0240 032C
        NOP                                     ; 5E23   0034
        MVO     R0,     G_0108                  ; 5E24   0240 0108
        DECR    R0                              ; 5E26   0010
        MVO     R0,     G_0191                  ; 5E27   0240 0191
        MVO     R0,     G_019D                  ; 5E29   0240 019D
        SWAP    R2,     1                       ; 5E2B   0042
        ANDR    R2,     R1                      ; 5E2C   0191
        XORI    #$000F, R1                      ; 5E2D   03F9 000F
        MVO     R1,     G_0325                  ; 5E2F   0241 0325
        MVII    #$0010, R0                      ; 5E31   02B8 0010
        MVO     R0,     G_0349                  ; 5E33   0240 0349
        MVO     R0,     G_034A                  ; 5E35   0240 034A

        JSR     R5,     L_5565                  ; 5E37   0004 0154 0165
        JSR     R5,     L_5694                  ; 5E3A   0004 0154 0294

        MVI     G_0181, R0                      ; 5E3D   0280 0181
        CMPI    #$005A, R0                      ; 5E3F   0378 005A
        BGT     L_5E85                          ; 5E41   020E 0042

        MVI     G_0180, R1                      ; 5E43   0281 0180
        CMPI    #$0003, R1                      ; 5E45   0379 0003
        BGT     L_5E85                          ; 5E47   020E 003C

        CMPI    #$0002, R1                      ; 5E49   0379 0002
        BGE     L_5E50                          ; 5E4B   020D 0003
        J       L_5AD3                          ; 5E4D   0004 0358 02D3

L_5E50:
        MVII    #$0008, R0                      ; 5E50   02B8 0008
        MVO     R0,     G_018D                  ; 5E52   0240 018D
        MVII    #$0002, R0                      ; 5E54   02B8 0002

        JSR     R5,     L_5FA6                  ; 5E56   0004 015C 03A6

        MVII    #$0003, R3                      ; 5E59   02BB 0003

        JSR     R5,     L_557D                  ; 5E5B   0004 0154 017D

        CLRR    R3                              ; 5E5E   01DB

        JSR     R5,     L_55BD                  ; 5E5F   0004 0154 01BD

        MOVR    R0,     R2                      ; 5E62   0082
        MOVR    R1,     R3                      ; 5E63   008B
        MVII    #$0020, R1                      ; 5E64   02B9 0020
        MVII    #$0329, R4                      ; 5E66   02BC 0329
        PSHR    R1                              ; 5E68   0271
        PSHR    R2                              ; 5E69   0272
        PSHR    R3                              ; 5E6A   0273

        JSR     R5,     L_561A                  ; 5E6B   0004 0154 021A

        PULR    R3                              ; 5E6E   02B3
        SUBI    #$0003, R3                      ; 5E6F   033B 0003
        PULR    R2                              ; 5E71   02B2
        PULR    R1                              ; 5E72   02B1
        MVII    #$0327, R4                      ; 5E73   02BC 0327

        JSR     R5,     L_561D                  ; 5E75   0004 0154 021D

        MVII    #$0004, R3                      ; 5E78   02BB 0004

        JSR     R5,     L_63DE                  ; 5E7A   0004 0160 03DE

        MVII    #$00F8, R0                      ; 5E7D   02B8 00F8
        MVO     R0,     G_0130                  ; 5E7F   0240 0130
        CLRR    R0                              ; 5E81   01C0
        MVO     R0,     G_0347                  ; 5E82   0240 0347
        PULR    R7                              ; 5E84   02B7

L_5E85:
        MVII    #$0008, R0                      ; 5E85   02B8 0008
        MVO     R0,     G_018D                  ; 5E87   0240 018D
        MVII    #$0004, R0                      ; 5E89   02B8 0004

        JSR     R5,     L_5FA6                  ; 5E8B   0004 015C 03A6

        MVII    #$0325, R3                      ; 5E8E   02BB 0325
        MVII    #$0002, R4                      ; 5E90   02BC 0002
        MVII    #$00FF, R2                      ; 5E92   02BA 00FF

        JSR     R5,     L_5B0B                  ; 5E94   0004 0158 030B

        MVII    #$0001, R0                      ; 5E97   02B8 0001
        MVO     R0,     G_034F                  ; 5E99   0240 034F
L_5E9B:
        CMPI    #$00DC, R0                      ; 5E9B   0378 00DC
        BGT     L_5E15                          ; 5E9D   022E 0089

        CMPI    #$008D, R0                      ; 5E9F   0378 008D
        BLT     L_5EB0                          ; 5EA1   0205 000D

        MVI     G_0180, R0                      ; 5EA3   0280 0180
        INCR    R0                              ; 5EA5   0008
        MVO     R0,     G_0180                  ; 5EA6   0240 0180
        MVII    #$0064, R0                      ; 5EA8   02B8 0064

        JSR     R5,     L_63CA                  ; 5EAA   0004 0160 03CA
        JSR     R5,     L_6510                  ; 5EAD   0004 0164 0110

L_5EB0:
        PULR    R7                              ; 5EB0   02B7

        PSHR    R5                              ; 5EB1   0275
        MVI     G_01A1, R0                      ; 5EB2   0280 01A1
        DECR    R0                              ; 5EB4   0010
        BPL     L_5EB8                          ; 5EB5   0203 0001

        CLRR    R0                              ; 5EB7   01C0
L_5EB8:
        MVO     R0,     G_01A1                  ; 5EB8   0240 01A1
        MVII    #$0006, R3                      ; 5EBA   02BB 0006
        CLRR    R1                              ; 5EBC   01C9

        JSR     R5,     L_6613                  ; 5EBD   0004 0164 0213

        MVI     G_0180, R0                      ; 5EC0   0280 0180
        CMPI    #$0001, R0                      ; 5EC2   0378 0001
        BGT     L_5ECF                          ; 5EC4   020E 0009

        MVII    #$032D, R3                      ; 5EC6   02BB 032D
        MVII    #$0005, R4                      ; 5EC8   02BC 0005
        MVII    #$007F, R2                      ; 5ECA   02BA 007F

        JSR     R5,     L_5B0B                  ; 5ECC   0004 0158 030B

L_5ECF:
        PULR    R7                              ; 5ECF   02B7

        DECLE   $0002,  $0004,  $0006,  $0004   ; 5ED0   0002 0004 0006 0004
        DECLE   $0002,  $0000                   ; 5ED4   0002 0000

        PSHR    R5                              ; 5ED6   0275
        MVI     G_0108, R0                      ; 5ED7   0280 0108
        TSTR    R0                              ; 5ED9   0080
        BEQ     L_5F26                          ; 5EDA   0204 004A

        MVI     G_018C, R0                      ; 5EDC   0280 018C
        TSTR    R0                              ; 5EDE   0080
        BEQ     L_5F26                          ; 5EDF   0204 0045

        CMPI    #$0001, R0                      ; 5EE1   0378 0001
        BGT     L_5EEA                          ; 5EE3   020E 0005

        JSR     R5,     L_6EC4                  ; 5EE5   0004 016C 02C4

        MVII    #$0001, R0                      ; 5EE8   02B8 0001
L_5EEA:
        CMPI    #$0007, R0                      ; 5EEA   0378 0007
        BEQ     L_5F0E                          ; 5EEC   0204 0020

        MVII    #$0003, R1                      ; 5EEE   02B9 0003
        MVO     R1,     G_0345                  ; 5EF0   0241 0345
        MVO     R1,     G_0346                  ; 5EF2   0241 0346
        SDBD                                    ; 5EF4   0001
        MVII    #$5ECF, R4                      ; 5EF5   02BC 00CF 005E
        ADDR    R0,     R4                      ; 5EF8   00C4
        MVI@    R4,     R0                      ; 5EF9   02A0
        MVI     G_0192, R1                      ; 5EFA   0281 0192
        MVI     G_032D, R2                      ; 5EFC   0282 032D
        MVII    #$007F, R3                      ; 5EFE   02BB 007F
        SUBR    R0,     R1                      ; 5F00   0101
        ANDR    R3,     R1                      ; 5F01   0199
        COMR    R3                              ; 5F02   001B
        ANDR    R3,     R2                      ; 5F03   019A
        XORR    R2,     R1                      ; 5F04   01D1
        MVO     R1,     G_032D                  ; 5F05   0241 032D
        MVI     G_018C, R0                      ; 5F07   0280 018C
        INCR    R0                              ; 5F09   0008
        MVO     R0,     G_018C                  ; 5F0A   0240 018C
        B       L_5F1F                          ; 5F0C   0200 0011

L_5F0E:
        CLRR    R0                              ; 5F0E   01C0
        MVO     R0,     G_018C                  ; 5F0F   0240 018C
        MVI     G_032D, R0                      ; 5F11   0280 032D
        SDBD                                    ; 5F13   0001
        ANDI    #$FF80, R0                      ; 5F14   03B8 0080 00FF
        XOR     G_0192, R0                      ; 5F17   03C0 0192
        MVO     R0,     G_032D                  ; 5F19   0240 032D
        MVII    #$0005, R0                      ; 5F1B   02B8 0005
        MVO     R0,     G_01A1                  ; 5F1D   0240 01A1
L_5F1F:
        MVI     G_019D, R0                      ; 5F1F   0280 019D
        MVI     G_0188, R1                      ; 5F21   0281 0188

        JSR     R5,     L_5BDD                  ; 5F23   0004 0158 03DD

L_5F26:
        PULR    R7                              ; 5F26   02B7

        MVI     G_019C, R0                      ; 5F27   0280 019C
        INCR    R0                              ; 5F29   0008
        MVO     R0,     G_019C                  ; 5F2A   0240 019C
        CMPI    #$0014, R0                      ; 5F2C   0378 0014
        BLT     L_5F38                          ; 5F2E   0205 0008

        CLRR    R0                              ; 5F30   01C0
        MVO     R0,     G_019C                  ; 5F31   0240 019C
        MVI     G_0181, R0                      ; 5F33   0280 0181
        INCR    R0                              ; 5F35   0008
        MVO     R0,     G_0181                  ; 5F36   0240 0181
L_5F38:
        MOVR    R5,     R7                      ; 5F38   00AF

        PSHR    R5                              ; 5F39   0275
        MVI     G_0344, R0                      ; 5F3A   0280 0344
        TSTR    R0                              ; 5F3C   0080
        BEQ     L_5F64                          ; 5F3D   0204 0025

        MVI     G_019A, R2                      ; 5F3F   0282 019A
        TSTR    R2                              ; 5F41   0092
        BNEQ    L_5D2B                          ; 5F42   022C 0218

        MVI     G_0334, R3                      ; 5F44   0283 0334
        ADDI    #$0002, R3                      ; 5F46   02FB 0002
        MVI     G_034C, R0                      ; 5F48   0280 034C
        INCR    R0                              ; 5F4A   0008
        CMPI    #$0005, R0                      ; 5F4B   0378 0005
        BLT     L_5F53                          ; 5F4D   0205 0004

        SUBI    #$0002, R3                      ; 5F4F   033B 0002
        MVII    #$0005, R0                      ; 5F51   02B8 0005
L_5F53:
        MVO     R0,     G_034C                  ; 5F53   0240 034C
        MVO     R3,     G_0334                  ; 5F55   0243 0334
        MVI     G_032C, R0                      ; 5F57   0280 032C
        ANDI    #$00FF, R0                      ; 5F59   03B8 00FF
        CMPI    #$00AA, R0                      ; 5F5B   0378 00AA
        BLE     L_5D2B                          ; 5F5D   0226 0233

        MVII    #$0007, R3                      ; 5F5F   02BB 0007
        J       L_557F                          ; 5F61   0004 0354 017F

L_5F64:
        MVI     G_0198, R0                      ; 5F64   0280 0198
        INCR    R0                              ; 5F66   0008
        MVO     R0,     G_0198                  ; 5F67   0240 0198
        CMP     G_01A9, R0                      ; 5F69   0340 01A9
        BLT     L_5D2B                          ; 5F6B   0225 0241

        MVI     G_0344, R2                      ; 5F6D   0282 0344
        TSTR    R2                              ; 5F6F   0092
        BEQ     L_5F78                          ; 5F70   0204 0006

        MVI     G_01A9, R0                      ; 5F72   0280 01A9
        DECR    R0                              ; 5F74   0010
        MVO     R0,     G_0198                  ; 5F75   0240 0198
        PULR    R7                              ; 5F77   02B7

L_5F78:
        MVO     R2,     G_0198                  ; 5F78   0242 0198
        MVII    #$032C, R3                      ; 5F7A   02BB 032C
        SDBD                                    ; 5F7C   0001
        MVII    #$6A02, R4                      ; 5F7D   02BC 0002 006A

        JSR     R5,     L_55CC                  ; 5F80   0004 0154 01CC

        MVI     G_0333, R0                      ; 5F83   0280 0333
        MVO     R0,     G_0334                  ; 5F85   0240 0334
        PULR    R7                              ; 5F87   02B7

        DECLE   $00CA,  $0069,  $00E6,  $0069   ; 5F88   00CA 0069 00E6 0069
        DECLE   $00F4,  $0069,  $00FD,  $00FD   ; 5F8C   00F4 0069 00FD 00FD
        DECLE   $00FE,  $00FE,  $00FF,  $0000   ; 5F90   00FE 00FE 00FF 0000
        DECLE   $0001,  $0001,  $0001,  $0002   ; 5F94   0001 0001 0001 0002
        DECLE   $0002,  $0002,  $0002,  $0003   ; 5F98   0002 0002 0002 0003
        DECLE   $0005,  $000A,  $00FF,  $000A   ; 5F9C   0005 000A 00FF 000A
        DECLE   $0005,  $0003,  $0002,  $0002   ; 5FA0   0005 0003 0002 0002
        DECLE   $0001,  $00FF                   ; 5FA4   0001 00FF
L_5FA6:
        PSHR    R5                              ; 5FA6   0275
        MVI     G_018D, R5                      ; 5FA7   0285 018D
        INCR    R5                              ; 5FA9   000D
        MVO     R5,     G_018D                  ; 5FAA   0245 018D
        CMPI    #$0008, R5                      ; 5FAC   037D 0008
        BLT     L_606E                          ; 5FAE   0205 00BE

        CLRR    R1                              ; 5FB0   01C9
        MVO     R1,     G_018D                  ; 5FB1   0241 018D
        SLR     R0,     1                       ; 5FB3   0060
        PSHR    R0                              ; 5FB4   0270
        SLL     R0,     1                       ; 5FB5   0048
        MOVR    R7,     R5                      ; 5FB6   00BD
        SUBI    #$002F, R5                      ; 5FB7   033D 002F
        ADDR    R0,     R5                      ; 5FB9   00C5
        SDBD                                    ; 5FBA   0001
        MVI@    R5,     R4                      ; 5FBB   02AC
        MVII    #$0327, R3                      ; 5FBC   02BB 0327

        JSR     R5,     L_55CC                  ; 5FBE   0004 0154 01CC

        MVII    #$0328, R3                      ; 5FC1   02BB 0328
        SDBD                                    ; 5FC3   0001
        MVII    #$69D8, R4                      ; 5FC4   02BC 00D8 0069

        JSR     R5,     L_55CC                  ; 5FC7   0004 0154 01CC

        MVI     G_032F, R2                      ; 5FCA   0282 032F
        ADDI    #$000A, R2                      ; 5FCC   02FA 000A
        ANDI    #$007F, R2                      ; 5FCE   03BA 007F
        MVI     G_032D, R3                      ; 5FD0   0283 032D
        ANDI    #$007F, R3                      ; 5FD2   03BB 007F
        PULR    R5                              ; 5FD4   02B5
        ADDI    #$000A, R5                      ; 5FD5   02FD 000A
        MVO     R5,     G_0195                  ; 5FD7   0245 0195
        CMPI    #$000B, R5                      ; 5FD9   037D 000B
        BPL     L_6001                          ; 5FDB   0203 0024

        MVI     G_01AD, R1                      ; 5FDD   0281 01AD
        MVO     R1,     G_012A                  ; 5FDF   0241 012A
        MVI     G_032D, R0                      ; 5FE1   0280 032D
        ANDI    #$007F, R0                      ; 5FE3   03B8 007F
        SUBI    #$000D, R0                      ; 5FE5   0338 000D
        MOVR    R0,     R1                      ; 5FE7   0081
        ADDR    R0,     R2                      ; 5FE8   00C2
        ANDI    #$007F, R2                      ; 5FE9   03BA 007F
        XOR     G_032F, R0                      ; 5FEB   03C0 032F
        MVO     R0,     G_032F                  ; 5FED   0240 032F
        SUBR    R1,     R3                      ; 5FEF   010B
        INCR    R3                              ; 5FF0   000B
        SLR     R3,     2                       ; 5FF1   0067
        SLR     R3,     1                       ; 5FF2   0063
        ADDI    #$0005, R3                      ; 5FF3   02FB 0005
        ANDI    #$000F, R3                      ; 5FF5   03BB 000F
        MVO     R3,     G_0195                  ; 5FF7   0243 0195
        ADDR    R7,     R3                      ; 5FF9   00FB
        SUBI    #$006C, R3                      ; 5FFA   033B 006C
        MVI@    R3,     R0                      ; 5FFC   0298
        ADDI    #$000A, R2                      ; 5FFD   02FA 000A
        B       L_605A                          ; 5FFF   0200 0059
L_6001:
        BEQ     L_602B                          ; 6001   0204 0028

        MVII    #$0004, R0                      ; 6003   02B8 0004

        JSR     R5,     X_RAND1                 ; 6005   0004 0114 027D

        SLL     R0,     2                       ; 6008   004C
        ADDI    #$0060, R0                      ; 6009   02F8 0060
        ANDI    #$00FF, R0                      ; 600B   03B8 00FF
        MVI     G_0327, R1                      ; 600D   0281 0327
        SDBD                                    ; 600F   0001
        ANDI    #$FF00, R1                      ; 6010   03B9 0000 00FF
        XORR    R0,     R1                      ; 6013   01C1
        MVO     R1,     G_0327                  ; 6014   0241 0327
        MOVR    R3,     R2                      ; 6016   009A
        ADDI    #$000C, R2                      ; 6017   02FA 000C
        MVII    #$0004, R0                      ; 6019   02B8 0004

        JSR     R5,     X_RAND1                 ; 601B   0004 0114 027D

        SUBI    #$0008, R0                      ; 601E   0338 0008
        ADDR    R0,     R2                      ; 6020   00C2
        CMPI    #$0058, R2                      ; 6021   037A 0058
        BLT     L_6027                          ; 6023   0205 0002

        MVII    #$0058, R2                      ; 6025   02BA 0058
L_6027:
        MVII    #$0000, R0                      ; 6027   02B8 0000
        B       L_605A                          ; 6029   0200 002F

L_602B:
        PSHR    R2                              ; 602B   0272
        MVII    #$0004, R3                      ; 602C   02BB 0004
        SDBD                                    ; 602E   0001
        MVII    #$6D4F, R1                      ; 602F   02B9 004F 006D

        JSR     R5,     L_5599                  ; 6032   0004 0154 0199

        MVII    #$0005, R3                      ; 6035   02BB 0005
        SDBD                                    ; 6037   0001
        MVII    #$6D55, R1                      ; 6038   02B9 0055 006D

        JSR     R5,     L_5599                  ; 603B   0004 0154 0199

        PULR    R2                              ; 603E   02B2
        MVII    #$001E, R0                      ; 603F   02B8 001E
        MVO     R0,     G_0351                  ; 6041   0240 0351
        MVO     R0,     G_018F                  ; 6043   0240 018F
        MVI     G_012E, R0                      ; 6045   0280 012E
        MVO     R0,     G_012A                  ; 6047   0240 012A
        MVII    #$0004, R3                      ; 6049   02BB 0004

        JSR     R5,     L_55BD                  ; 604B   0004 0154 01BD

        SUBI    #$0003, R0                      ; 604E   0338 0003
        MVI     G_0327, R1                      ; 6050   0281 0327
        SDBD                                    ; 6052   0001
        ANDI    #$FF00, R1                      ; 6053   03B9 0000 00FF
        XORR    R0,     R1                      ; 6056   01C1
        MVO     R1,     G_0327                  ; 6057   0241 0327
        CLRR    R0                              ; 6059   01C0
L_605A:
        MVO     R0,     G_0193                  ; 605A   0240 0193
        MVO     R2,     G_0194                  ; 605C   0242 0194
        ADDI    #$0006, R2                      ; 605E   02FA 0006
        MVI     G_0330, R0                      ; 6060   0280 0330
        SDBD                                    ; 6062   0001
        ANDI    #$FF80, R0                      ; 6063   03B8 0080 00FF
        XORR    R0,     R2                      ; 6066   01C2
        MVO     R2,     G_0330                  ; 6067   0242 0330
        CLRR    R0                              ; 6069   01C0
        MVO     R0,     G_0196                  ; 606A   0240 0196
        MVO     R0,     G_0197                  ; 606C   0240 0197
L_606E:
        PULR    R7                              ; 606E   02B7

L_606F:
        PSHR    R5                              ; 606F   0275
        MVI     G_018F, R0                      ; 6070   0280 018F
        TSTR    R0                              ; 6072   0080
        BNEQ    L_6117                          ; 6073   020C 00A2

        MVI     G_033F, R0                      ; 6075   0280 033F
        TSTR    R0                              ; 6077   0080
        BEQ     L_6117                          ; 6078   0204 009D

        SDBD                                    ; 607A   0001
        CMPI    #$6A90, R0                      ; 607B   0378 0090 006A
        BEQ     L_6117                          ; 607E   0204 0097

        MVI     G_0195, R1                      ; 6080   0281 0195
        MVI     G_0196, R0                      ; 6082   0280 0196
        DECR    R0                              ; 6084   0010
        BGT     L_60A1                          ; 6085   020E 001A

        MVI     G_0194, R2                      ; 6087   0282 0194
        CMPI    #$0005, R1                      ; 6089   0379 0005
        BGT     L_608F                          ; 608B   020E 0002

        DECR    R2                              ; 608D   0012
        INCR    R7                              ; 608E   000F

L_608F:
        INCR    R2                              ; 608F   000A
L_6090:
        MVO     R2,     G_0194                  ; 6090   0242 0194
        ADDI    #$0006, R2                      ; 6092   02FA 0006
        MVI     G_0330, R3                      ; 6094   0283 0330
        SDBD                                    ; 6096   0001
        ANDI    #$FF80, R3                      ; 6097   03BB 0080 00FF
        XORR    R2,     R3                      ; 609A   01D3
        MVO     R3,     G_0330                  ; 609B   0243 0330
        ADDR    R7,     R1                      ; 609D   00F9
        SUBI    #$0105, R1                      ; 609E   0339 0105
        MVI@    R1,     R0                      ; 60A0   0288
L_60A1:
        MVO     R0,     G_0196                  ; 60A1   0240 0196
        MVI     G_0193, R4                      ; 60A3   0284 0193
        INCR    R4                              ; 60A5   000C
        MVI     G_032F, R5                      ; 60A6   0285 032F
        MOVR    R5,     R3                      ; 60A8   00AB
        ADDR    R4,     R3                      ; 60A9   00E3
        SDBD                                    ; 60AA   0001
        ANDI    #$FF80, R5                      ; 60AB   03BD 0080 00FF
        ANDI    #$007F, R3                      ; 60AE   03BB 007F
        MVI     G_0194, R2                      ; 60B0   0282 0194
        CMPR    R2,     R3                      ; 60B2   0153
        BLE     L_6100                          ; 60B3   0206 004B

        PSHR    R0                              ; 60B5   0270
        MVI     G_0197, R0                      ; 60B6   0280 0197
        CMPI    #$0002, R0                      ; 60B8   0378 0002
        BGT     L_60C4                          ; 60BA   020E 0008

        INCR    R0                              ; 60BC   0008
        MVO     R0,     G_0197                  ; 60BD   0240 0197
        PSHR    R5                              ; 60BF   0275

        JSR     R5,     L_6E9A                  ; 60C0   0004 016C 029A

        PULR    R5                              ; 60C3   02B5
L_60C4:
        PULR    R0                              ; 60C4   02B0
        NEGR    R4                              ; 60C5   0024
        MVII    #$0002, R0                      ; 60C6   02B8 0002
        MOVR    R2,     R3                      ; 60C8   0093
        ANDI    #$007F, R3                      ; 60C9   03BB 007F
        MVI     G_0195, R1                      ; 60CB   0281 0195
        CMPI    #$000B, R1                      ; 60CD   0379 000B
        BGT     L_60D7                          ; 60CF   020E 0006
        BEQ     L_60FE                          ; 60D1   0204 002B

        MOVR    R1,     R0                      ; 60D3   0088
        SLR     R0,     1                       ; 60D4   0060
        B       L_60FE                          ; 60D5   0200 0027

L_60D7:
        MVII    #$0003, R3                      ; 60D7   02BB 0003

        JSR     R5,     L_5672                  ; 60D9   0004 0154 0272

        MVII    #$02C7, R5                      ; 60DC   02BD 02C7
        MVI     G_0180, R3                      ; 60DE   0283 0180
        CMPI    #$0002, R3                      ; 60E0   037B 0002
        BLT     L_60E6                          ; 60E2   0205 0002

        ADDI    #$0028, R5                      ; 60E4   02FD 0028
L_60E6:
        CMPR    R5,     R4                      ; 60E6   016C
        BGT     L_6111                          ; 60E7   020E 0028

        MVI@    R4,     R0                      ; 60E9   02A0
        DECR    R4                              ; 60EA   0014
        SDBD                                    ; 60EB   0001
        ANDI    #$F600, R0                      ; 60EC   03B8 0000 00F6
        SDBD                                    ; 60EF   0001
        XORI    #$081A, R0                      ; 60F0   03F8 001A 0008
        MVO@    R0,     R4                      ; 60F3   0260
        ADDI    #$0013, R4                      ; 60F4   02FC 0013
        ADDI    #$0008, R0                      ; 60F6   02F8 0008
        MVO@    R0,     R4                      ; 60F8   0260

        JSR     R5,     L_6E9A                  ; 60F9   0004 016C 029A

        B       L_6111                          ; 60FC   0200 0013

L_60FE:
        INCR    R0                              ; 60FE   0008
        ADDR    R0,     R4                      ; 60FF   00C4
L_6100:
        MVO     R4,     G_0193                  ; 6100   0244 0193
        XORR    R3,     R5                      ; 6102   01DD
        MVO     R5,     G_032F                  ; 6103   0245 032F
        CMPI    #$005F, R3                      ; 6105   037B 005F
        BGE     L_6111                          ; 6107   020D 0008

        MVI     G_0327, R0                      ; 6109   0280 0327
        ANDI    #$00FF, R0                      ; 610B   03B8 00FF
        CMPI    #$00A8, R0                      ; 610D   0378 00A8
        BLT     L_6117                          ; 610F   0205 0006

L_6111:
        MVII    #$0002, R2                      ; 6111   02BA 0002
        MOVR    R2,     R3                      ; 6113   0093

        JSR     R5,     L_557B                  ; 6114   0004 0154 017B

L_6117:
        PULR    R7                              ; 6117   02B7

        CLRR    R0                              ; 6118   01C0
        MVO     R0,     G_019A                  ; 6119   0240 019A
        MVI     G_0336, R0                      ; 611B   0280 0336
        XORI    #$0004, R0                      ; 611D   03F8 0004
        XOR     G_0188, R0                      ; 611F   03C0 0188
        MVO     R0,     G_0336                  ; 6121   0240 0336
        MOVR    R5,     R7                      ; 6123   00AF

L_6124:
        CLRR    R0                              ; 6124   01C0
        MVO     R0,     G_0345                  ; 6125   0240 0345
        MVO     R0,     G_0346                  ; 6127   0240 0346
        MVII    #$001E, R0                      ; 6129   02B8 001E
        MVO     R0,     G_034E                  ; 612B   0240 034E
        MVI     G_019D, R0                      ; 612D   0280 019D
        MVI     G_0188, R1                      ; 612F   0281 0188
        J       L_5BDF                          ; 6131   0004 0358 03DF

        SDBD                                    ; 6134   0001
        MVII    #$6A44, R3                      ; 6135   02BB 0044 006A
        MVO     R3,     G_033D                  ; 6138   0243 033D
        MOVR    R5,     R7                      ; 613A   00AF

        PSHR    R5                              ; 613B   0275
        CLRR    R3                              ; 613C   01DB

        JSR     R5,     L_557D                  ; 613D   0004 0154 017D

        MVII    #$0325, R3                      ; 6140   02BB 0325
        SDBD                                    ; 6142   0001
        MVII    #$6A10, R4                      ; 6143   02BC 0010 006A

        JSR     R5,     L_55CC                  ; 6146   0004 0154 01CC
        JSR     R5,     X_PLAY_SFX2             ; 6149   0004 0118 03BE
        DECLE   $00A0                           ; 614C  SFX prio
        DECLE   $02F9                           ; 614D  SFX data
        DECLE   $0137                           ; 614E  SFX data
        DECLE   $004D                           ; 614F  SFX data
        DECLE   $000C,  $0200                   ; 6150  SFX data
        DECLE   $038B                           ; 6152  SFX data
        DECLE   $022B                           ; 6153  SFX data
        DECLE   $002C,  $0300                   ; 6154  SFX data
        DECLE   $008F,  $0032                   ; 6156  SFX data
        DECLE   $02CF                           ; 6158  SFX end


        PSHR    R5                              ; 6159   0275
        CLRR    R0                              ; 615A   01C0
        MVO     R0,     G_0180                  ; 615B   0240 0180
        MVII    #$017E, R2                      ; 615D   02BA 017E
        MVI@    R2,     R0                      ; 615F   0290
        MOVR    R0,     R1                      ; 6160   0081
        ANDI    #$000F, R0                      ; 6161   03B8 000F
        INCR    R0                              ; 6163   0008
        CMPI    #$000A, R0                      ; 6164   0378 000A
        BLT     L_616B                          ; 6166   0205 0003

        CLRR    R0                              ; 6168   01C0
        ADDI    #$0010, R1                      ; 6169   02F9 0010
L_616B:
        ANDI    #$0070, R1                      ; 616B   03B9 0070
        XORR    R1,     R0                      ; 616D   01C8
        MVO@    R0,     R2                      ; 616E   0250
        INCR    R2                              ; 616F   000A
        MVI@    R2,     R0                      ; 6170   0290
        INCR    R0                              ; 6171   0008
        MVO@    R0,     R2                      ; 6172   0250
        MVII    #$0064, R0                      ; 6173   02B8 0064

        JSR     R5,     L_63CA                  ; 6175   0004 0160 03CA

        MVI     G_017D, R0                      ; 6178   0280 017D
        INCR    R0                              ; 617A   0008
        CMPI    #$0006, R0                      ; 617B   0378 0006
        BGT     L_6181                          ; 617D   020E 0002

        MVO     R0,     G_017D                  ; 617F   0240 017D

L_6181:
        JSR     R5,     L_6F62                  ; 6181   0004 016C 0362

        PULR    R5                              ; 6184   02B5
        B       L_6510                          ; 6185   0200 0389

        MVII    #$0001, R2                      ; 6187   02BA 0001
        CMPI    #$0002, R3                      ; 6189   037B 0002
        BNEQ    L_618E                          ; 618B   020C 0001

        INCR    R2                              ; 618D   000A
L_618E:
        J       L_557B                          ; 618E   0004 0354 017B

        PSHR    R5                              ; 6191   0275
        MVI     G_01A3, R0                      ; 6192   0280 01A3
        INCR    R0                              ; 6194   0008
        CMPI    #$0009, R0                      ; 6195   0378 0009
        BGT     L_61AA                          ; 6197   020E 0011

        MVO     R0,     G_01A3                  ; 6199   0240 01A3
        MOVR    R0,     R1                      ; 619B   0081
        ADDI    #$0003, R1                      ; 619C   02F9 0003
        CMPI    #$000B, R1                      ; 619E   0379 000B
        BGT     L_61AA                          ; 61A0   020E 0008

        MVII    #$02F1, R4                      ; 61A2   02BC 02F1
        MVO@    R1,     R4                      ; 61A4   0261
        MVO@    R1,     R4                      ; 61A5   0261
        MVO@    R1,     R4                      ; 61A6   0261
        NOP                                     ; 61A7   0034
        MVO@    R1,     R4                      ; 61A8   0261
        MVO@    R1,     R4                      ; 61A9   0261
L_61AA:
        CMPI    #$0003, R0                      ; 61AA   0378 0003
        BNEQ    L_61C3                          ; 61AC   020C 0015

        MVII    #$0287, R4                      ; 61AE   02BC 0287
        MVI@    R4,     R1                      ; 61B0   02A1
        SDBD                                    ; 61B1   0001
        XORI    #$0937, R1                      ; 61B2   03F9 0037 0009
        MVO@    R1,     R4                      ; 61B5   0261
        ADDI    #$0008, R1                      ; 61B6   02F9 0008
        MVO@    R1,     R4                      ; 61B8   0261
        MVI     G_032F, R1                      ; 61B9   0281 032F
        SUBI    #$0003, R1                      ; 61BB   0339 0003
        MVO     R1,     G_032F                  ; 61BD   0241 032F
        MVII    #$0002, R1                      ; 61BF   02B9 0002
        B       L_6214                          ; 61C1   0200 0051

L_61C3:
        CMPI    #$0005, R0                      ; 61C3   0378 0005
        BNEQ    L_61E3                          ; 61C5   020C 001C

        MVII    #$0005, R0                      ; 61C7   02B8 0005
        MVO     R0,     G_0345                  ; 61C9   0240 0345
        MVO     R0,     G_0346                  ; 61CB   0240 0346
        MVI     G_032C, R1                      ; 61CD   0281 032C
        INCR    R1                              ; 61CF   0009
        MVO     R1,     G_032C                  ; 61D0   0241 032C
        MVII    #$00D0, R1                      ; 61D2   02B9 00D0
        MVO     R1,     G_0126                  ; 61D4   0241 0126
        MVII    #$00F8, R1                      ; 61D6   02B9 00F8
        MVO     R1,     G_0136                  ; 61D8   0241 0136
        MVII    #$0005, R1                      ; 61DA   02B9 0005
        MVO     R1,     G_0350                  ; 61DC   0241 0350
        PSHR    R0                              ; 61DE   0270

        JSR     R5,     L_6ED5                  ; 61DF   0004 016C 02D5

        PULR    R0                              ; 61E2   02B0
L_61E3:
        CMPI    #$0006, R0                      ; 61E3   0378 0006
        BEQ     L_61EB                          ; 61E5   0204 0004

        CMPI    #$0007, R0                      ; 61E7   0378 0007
        BNEQ    L_61F4                          ; 61E9   020C 0009

L_61EB:
        MVI     G_032C, R1                      ; 61EB   0281 032C
        INCR    R1                              ; 61ED   0009
        MVO     R1,     G_032C                  ; 61EE   0241 032C
        MVII    #$0001, R1                      ; 61F0   02B9 0001
        B       L_6214                          ; 61F2   0200 0020

L_61F4:
        CMPI    #$0008, R0                      ; 61F4   0378 0008
        BNEQ    L_6218                          ; 61F6   020C 0020

        MVI     G_032C, R1                      ; 61F8   0281 032C
        INCR    R1                              ; 61FA   0009
        MVO     R1,     G_032C                  ; 61FB   0241 032C
        MVII    #$0287, R4                      ; 61FD   02BC 0287
        MVI@    R4,     R1                      ; 61FF   02A1
        MVO@    R1,     R4                      ; 6200   0261
        MVO@    R1,     R4                      ; 6201   0261
        MVII    #$0007, R3                      ; 6202   02BB 0007

        JSR     R5,     L_557D                  ; 6204   0004 0154 017D

        PSHR    R0                              ; 6207   0270
        MVII    #$032B, R3                      ; 6208   02BB 032B
        SDBD                                    ; 620A   0001
        MVII    #$69BC, R4                      ; 620B   02BC 00BC 0069

        JSR     R5,     L_55CC                  ; 620E   0004 0154 01CC

        PULR    R0                              ; 6211   02B0
        MVII    #$0014, R1                      ; 6212   02B9 0014
L_6214:
        ADD     G_0327, R1                      ; 6214   02C1 0327
        MVO     R1,     G_0327                  ; 6216   0241 0327
L_6218:
        CMPI    #$0009, R0                      ; 6218   0378 0009
        BNEQ    L_623C                          ; 621A   020C 0020

        CLRR    R1                              ; 621C   01C9
        CLRR    R3                              ; 621D   01DB

        JSR     R5,     L_64F2                  ; 621E   0004 0164 00F2

        SDBD                                    ; 6221   0001
        MVII    #$56AD, R4                      ; 6222   02BC 00AD 0056
        MVII    #$02F1, R5                      ; 6225   02BD 02F1
L_6227:
        MVI@    R4,     R1                      ; 6227   02A1
        MVO@    R1,     R5                      ; 6228   0269
        CMPI    #$02F6, R5                      ; 6229   037D 02F6
        BLT     L_6227                          ; 622B   0225 0005

        MVI     G_0180, R1                      ; 622D   0281 0180
        CMPI    #$0001, R1                      ; 622F   0379 0001
        BGT     L_623C                          ; 6231   020E 0009

        MVII    #$032A, R3                      ; 6233   02BB 032A
        SDBD                                    ; 6235   0001
        MVII    #$6CFF, R4                      ; 6236   02BC 00FF 006C

        JSR     R5,     L_55CC                  ; 6239   0004 0154 01CC

L_623C:
        MVII    #$000A, R0                      ; 623C   02B8 000A
        MVO     R0,     G_034F                  ; 623E   0240 034F
        MVI     G_0325, R1                      ; 6240   0281 0325
        ANDI    #$00FF, R1                      ; 6242   03B9 00FF
        CMPI    #$0038, R1                      ; 6244   0379 0038
        BLT     L_6251                          ; 6246   0205 0009

        CMPI    #$0050, R1                      ; 6248   0379 0050
        BGT     L_6250                          ; 624A   020E 0004

        MVII    #$0007, R1                      ; 624C   02B9 0007
        MVO     R1,     G_0136                  ; 624E   0241 0136
L_6250:
        PULR    R7                              ; 6250   02B7

L_6251:
        CMPI    #$0009, R0                      ; 6251   0378 0009
        BLE     L_6250                          ; 6253   0226 0004

        CLRR    R0                              ; 6255   01C0
        MVO     R0,     G_0191                  ; 6256   0240 0191
        MVO     R0,     G_018C                  ; 6258   0240 018C

        JSR     R5,     L_5694                  ; 625A   0004 0154 0294
        JSR     R5,     L_5568                  ; 625D   0004 0154 0168

        MVII    #$0002, R2                      ; 6260   02BA 0002
        MOVR    R2,     R3                      ; 6262   0093

        JSR     R5,     L_557B                  ; 6263   0004 0154 017B

        MVI     G_01AE, R0                      ; 6266   0280 01AE
        MVO     R0,     G_0108                  ; 6268   0240 0108

        JSR     R5,     L_6E9A                  ; 626A   0004 016C 029A

        MVI     G_019D, R0                      ; 626D   0280 019D
        MVI     G_0188, R1                      ; 626F   0281 0188
        J       L_5BE0                          ; 6271   0004 0358 03E0

L_6274:
        PSHR    R5                              ; 6274   0275
        MVI     G_0180, R0                      ; 6275   0280 0180
        CMPI    #$0007, R0                      ; 6277   0378 0007
        BEQ     L_6280                          ; 6279   0204 0005

        MVI     G_0190, R0                      ; 627B   0280 0190
        TSTR    R0                              ; 627D   0080
        BNEQ    L_62B1                          ; 627E   020C 0031

L_6280:
        MVI     G_017D, R0                      ; 6280   0280 017D
        DECR    R0                              ; 6282   0010
        MVO     R0,     G_017D                  ; 6283   0240 017D
        BGT     L_6511                          ; 6285   020E 028A

        CLRR    R0                              ; 6287   01C0
        MVO     R0,     G_017D                  ; 6288   0240 017D

        JSR     R5,     L_6510                  ; 628A   0004 0164 0110

        MVI     G_0182, R0                      ; 628D   0280 0182
        TSTR    R0                              ; 628F   0080
        BEQ     L_6297                          ; 6290   0204 0005

        MVI     G_0187, R0                      ; 6292   0280 0187
        TSTR    R0                              ; 6294   0080
        BNEQ    L_62B1                          ; 6295   020C 001A

L_6297:
        MVO     R0,     G_017D                  ; 6297   0240 017D
        MVO     R0,     G_0182                  ; 6299   0240 0182
        DECR    R0                              ; 629B   0010
        MVO     R0,     G_019B                  ; 629C   0240 019B
        MVO     R0,     G_019E                  ; 629E   0240 019E
        MVII    #$0206, R3                      ; 62A0   02BB 0206
        MVII    #$0291, R4                      ; 62A2   02BC 0291

        JSR     R5,     X_PRINT_R5              ; 62A4   0004 0118 007B
        STRING  "GAME OVER"                     ; 62A7  
        DECLE   $0000                           ; 62B0   0000
L_62B1:
        PULR    R7                              ; 62B1   02B7

        MVI     G_032F, R0                      ; 62B2   0280 032F
        MOVR    R0,     R1                      ; 62B4   0081
        MVII    #$007F, R2                      ; 62B5   02BA 007F
        ADDI    #$0003, R0                      ; 62B7   02F8 0003
        ANDR    R2,     R0                      ; 62B9   0190
        COMR    R2                              ; 62BA   001A
        ANDR    R2,     R1                      ; 62BB   0191
        XORR    R0,     R1                      ; 62BC   01C1
        MVO     R1,     G_032F                  ; 62BD   0241 032F
        MVII    #$0002, R0                      ; 62BF   02B8 0002
        MVO     R0,     G_034F                  ; 62C1   0240 034F
        MOVR    R5,     R7                      ; 62C3   00AF

        PSHR    R5                              ; 62C4   0275
        MVI     G_0332, R0                      ; 62C5   0280 0332
        SDBD                                    ; 62C7   0001
        ANDI    #$FF80, R0                      ; 62C8   03B8 0080 00FF
        XORI    #$0029, R0                      ; 62CB   03F8 0029
        SDBD                                    ; 62CD   0001
        MVII    #$63FE, R4                      ; 62CE   02BC 00FE 0063
        MVI     G_019F, R1                      ; 62D1   0281 019F
        INCR    R1                              ; 62D3   0009
        ANDI    #$0007, R1                      ; 62D4   03B9 0007
        MVO     R1,     G_019F                  ; 62D6   0241 019F
        ADDR    R1,     R4                      ; 62D8   00CC
        MVI@    R4,     R2                      ; 62D9   02A2
        SAR     R2,     2                       ; 62DA   006E
        SAR     R2,     2                       ; 62DB   006E
        SUBR    R2,     R0                      ; 62DC   0110
        MVO     R0,     G_0332                  ; 62DD   0240 0332
        MVI     G_01A0, R0                      ; 62DF   0280 01A0
        MVO     R0,     G_0352                  ; 62E1   0240 0352
        CMPI    #$0002, R2                      ; 62E3   037A 0002
        BNEQ    L_62EA                          ; 62E5   020C 0003

        JSR     R5,     L_6E9A                  ; 62E7   0004 016C 029A

L_62EA:
        PULR    R7                              ; 62EA   02B7

        CMPI    #$0007, R3                      ; 62EB   037B 0007
        BEQ     L_62F2                          ; 62ED   0204 0003
        J       L_64A0                          ; 62EF   0004 0364 00A0
L_62F2:
        B       L_6274                          ; 62F2   0220 007F

L_62F4:
        PSHR    R5                              ; 62F4   0275

L_62F5:
        JSR     R5,     L_5565                  ; 62F5   0004 0154 0165

        MVII    #$0008, R4                      ; 62F8   02BC 0008

        JSR     R5,     L_63A8                  ; 62FA   0004 0160 03A8
        JSR     R5,     L_6560                  ; 62FD   0004 0164 0160

        CLRR    R0                              ; 6300   01C0
        MVO     R0,     G_034E                  ; 6301   0240 034E
        MVO     R0,     G_019E                  ; 6303   0240 019E
        MVII    #$0206, R3                      ; 6305   02BB 0206
        MVII    #$028E, R4                      ; 6307   02BC 028E

        JSR     R5,     X_PRINT_R5              ; 6309   0004 0118 007B
        STRING  "TROPICAL  TROUBLE"             ; 630C  
        DECLE   $0000                           ; 631D   0000

        SDBD                                    ; 631E   0001
        MVII    #$0970, R2                      ; 631F   02BA 0070 0009
        MVII    #$0206, R3                      ; 6322   02BB 0206
        XORR    R3,     R2                      ; 6324   01DA
        MVII    #$02CB, R4                      ; 6325   02BC 02CB
        MVO@    R2,     R4                      ; 6327   0262

        JSR     R5,     X_PRINT_R5              ; 6328   0004 0118 007B
        STRING  " 1982 IMAGIC"                  ; 632B  
        DECLE   $0000                           ; 6337   0000

        MVII    #$017D, R4                      ; 6338   02BC 017D
        MVII    #$0037, R0                      ; 633A   02B8 0037

        JSR     R5,     X_FILL_ZERO             ; 633C   0004 0114 0338

        CLRR    R4                              ; 633F   01E4

        JSR     R5,     L_6373                  ; 6340   0004 0160 0373

        MVII    #$0003, R0                      ; 6343   02B8 0003
        MVO     R0,     G_017D                  ; 6345   0240 017D
        MVO     R0,     G_0182                  ; 6347   0240 0182
        CLRR    R0                              ; 6349   01C0
        MVII    #$02F6, R4                      ; 634A   02BC 02F6
        MVO@    R0,     R4                      ; 634C   0260
        MVO@    R0,     R4                      ; 634D   0260
        INCR    R0                              ; 634E   0008
        MVO     R0,     G_0188                  ; 634F   0240 0188
        DECR    R0                              ; 6351   0010
        MVO@    R0,     R4                      ; 6352   0260
        MVO@    R0,     R4                      ; 6353   0260
        DECR    R0                              ; 6354   0010
        MVO     R0,     G_0191                  ; 6355   0240 0191
        MVO     R0,     G_019B                  ; 6357   0240 019B
        PULR    R7                              ; 6359   02B7

L_635A:
        CLRR    R0                              ; 635A   01C0
        MVII    #$018B, R4                      ; 635B   02BC 018B
L_635D:
        MVO@    R0,     R4                      ; 635D   0260
        CMPI    #$0190, R4                      ; 635E   037C 0190
        BLE     L_635D                          ; 6360   0226 0004

        MVI     G_017F, R1                      ; 6362   0281 017F
        ADD     G_0180, R1                      ; 6364   02C1 0180
        CMPI    #$000A, R1                      ; 6366   0379 000A
        BLE     L_636C                          ; 6368   0206 0002

        MVII    #$000A, R1                      ; 636A   02B9 000A
L_636C:
        MOVR    R1,     R0                      ; 636C   0088
        SLL     R1,     2                       ; 636D   004D
        SLL     R1,     1                       ; 636E   0049
        ADDR    R0,     R1                      ; 636F   00C1
        SLL     R0,     1                       ; 6370   0048
        ADDR    R0,     R1                      ; 6371   00C1
        MOVR    R1,     R4                      ; 6372   008C
L_6373:
        PSHR    R5                              ; 6373   0275
        MVII    #$000B, R0                      ; 6374   02B8 000B
        SDBD                                    ; 6376   0001
        ADDI    #$6F7E, R4                      ; 6377   02FC 007E 006F
        MVII    #$01A9, R1                      ; 637A   02B9 01A9
        J       .EXEC.731                       ; 637C   0004 0314 0331

L_637F:
        PSHR    R5                              ; 637F   0275
        DIS                                     ; 6380   0003

        JSR     R5,     L_635A                  ; 6381   0004 0160 035A

        CLRR    R0                              ; 6384   01C0
L_6385:
        PSHR    R0                              ; 6385   0270

        JSR     R5,     L_68EE                  ; 6386   0004 0168 00EE

        PULR    R0                              ; 6389   02B0
        INCR    R0                              ; 638A   0008
        MOVR    R0,     R1                      ; 638B   0081
        ANDI    #$0007, R1                      ; 638C   03B9 0007
        MVO     R1,     G_018B                  ; 638E   0241 018B
        CMPI    #$0013, R0                      ; 6390   0378 0013
        BLE     L_6385                          ; 6392   0226 000E

        DECR    R1                              ; 6394   0011
        MVO     R1,     G_018B                  ; 6395   0241 018B
        MVI     G_0180, R0                      ; 6397   0280 0180
        ANDI    #$0004, R0                      ; 6399   03B8 0004
        BEQ     L_63A5                          ; 639B   0204 0008

        MVII    #$0216, R4                      ; 639D   02BC 0216
        MVI@    R4,     R0                      ; 639F   02A0
L_63A0:
        MVO@    R0,     R4                      ; 63A0   0260
        CMPI    #$0229, R4                      ; 63A1   037C 0229
        BLT     L_63A0                          ; 63A3   0225 0004

L_63A5:
        PULR    R5                              ; 63A5   02B5
        B       L_669D                          ; 63A6   0200 02F5

L_63A8:
        DIS                                     ; 63A8   0003
        ANDI    #$000E, R4                      ; 63A9   03BC 000E
        SDBD                                    ; 63AB   0001
        ADDI    #$6874, R4                      ; 63AC   02FC 0074 0068
        SDBD                                    ; 63AF   0001
        MVI@    R4,     R3                      ; 63B0   02A3
        MOVR    R3,     R4                      ; 63B1   009C
        MVII    #$0200, R3                      ; 63B2   02BB 0200
L_63B4:
        MVI@    R4,     R0                      ; 63B4   02A0
        MVI@    R4,     R1                      ; 63B5   02A1
        MOVR    R1,     R2                      ; 63B6   008A
        ANDI    #$03F0, R1                      ; 63B7   03B9 03F0
        XORR    R1,     R2                      ; 63B9   01CA
        SLL     R1,     2                       ; 63BA   004D
        SLL     R1,     2                       ; 63BB   004D
        XORR    R1,     R0                      ; 63BC   01C8
L_63BD:
        CMPI    #$02F0, R3                      ; 63BD   037B 02F0
        BGE     L_63C8                          ; 63BF   020D 0007

        MVO@    R0,     R3                      ; 63C1   0258
        INCR    R3                              ; 63C2   000B
        DECR    R2                              ; 63C3   0012
        BEQ     L_63B4                          ; 63C4   0224 0011
        B       L_63BD                          ; 63C6   0220 000A
L_63C8:
        B       L_669D                          ; 63C8   0200 02D3

L_63CA:
        PSHR    R5                              ; 63CA   0275
L_63CB:
        MVI     G_02F6, R1                      ; 63CB   0281 02F6
        ADDR    R0,     R1                      ; 63CD   00C1
        SDBD                                    ; 63CE   0001
        MVII    #$2710, R3                      ; 63CF   02BB 0010 0027
        CMPR    R3,     R1                      ; 63D2   0159
        BLT     L_63DB                          ; 63D3   0205 0006

        MVI     G_02F7, R0                      ; 63D5   0280 02F7
        INCR    R0                              ; 63D7   0008
        MVO     R0,     G_02F7                  ; 63D8   0240 02F7
        SUBR    R3,     R1                      ; 63DA   0119
L_63DB:
        MVO     R1,     G_02F6                  ; 63DB   0241 02F6
        PULR    R7                              ; 63DD   02B7

L_63DE:
        MVII    #$0100, R2                      ; 63DE   02BA 0100
        SLL     R2,     2                       ; 63E0   004E
        INCR    R7                              ; 63E1   000F

L_63E2:
        CLRR    R2                              ; 63E2   01D2
L_63E3:
        PSHR    R5                              ; 63E3   0275
        ADDI    #$032D, R3                      ; 63E4   02FB 032D
        SDBD                                    ; 63E6   0001
        MVII    #$F3FF, R5                      ; 63E7   02BD 00FF 00F3
        MVI@    R3,     R4                      ; 63EA   029C
        ANDR    R5,     R4                      ; 63EB   01AC
        XORR    R2,     R4                      ; 63EC   01D4
        MVO@    R4,     R3                      ; 63ED   025C
        INCR    R3                              ; 63EE   000B
        MVI@    R3,     R4                      ; 63EF   029C
        ANDR    R5,     R4                      ; 63F0   01AC
        XORR    R2,     R4                      ; 63F1   01D4
        MVO@    R4,     R3                      ; 63F2   025C
        SUBI    #$032E, R3                      ; 63F3   033B 032E
        PULR    R7                              ; 63F5   02B7

        ADDR    R6,     R0                      ; 63F6   00F0
        ADDR    R5,     R0                      ; 63F7   00E8
        ADDR    R4,     R0                      ; 63F8   00E0
        ADDR    R3,     R0                      ; 63F9   00D8
        ADDR    R2,     R0                      ; 63FA   00D0
        ADDR    R1,     R0                      ; 63FB   00C8
        ADDR    R0,     R0                      ; 63FC   00C0
        MOVR    R7,     R0                      ; 63FD   00B8
        MOVR    R5,     R2                      ; 63FE   00AA
        MOVR    R3,     R1                      ; 63FF   0099
        SARC    R0,     1                       ; 6400   0078
        RLC     R2,     2                       ; 6401   0056
        NEGR    R4                              ; 6402   0024
        SLR     R3,     1                       ; 6403   0063
        MOVR    R0,     R2                      ; 6404   0082
        TSTR    R2                              ; 6405   0092
        PSHR    R5                              ; 6406   0275

L_6407:
        JSR     R5,     L_5578                  ; 6407   0004 0154 0178

        MVII    #$0006, R4                      ; 640A   02BC 0006

        JSR     R5,     L_63A8                  ; 640C   0004 0160 03A8

        MVII    #$0325, R3                      ; 640F   02BB 0325
        SDBD                                    ; 6411   0001
        MVII    #$6968, R4                      ; 6412   02BC 0068 0069

        JSR     R5,     L_55CC                  ; 6415   0004 0154 01CC

        MVII    #$032A, R3                      ; 6418   02BB 032A
        SDBD                                    ; 641A   0001
        MVII    #$6976, R4                      ; 641B   02BC 0076 0069

        JSR     R5,     L_55CC                  ; 641E   0004 0154 01CC

        MVII    #$0002, R2                      ; 6421   02BA 0002
        MVII    #$0326, R3                      ; 6423   02BB 0326
        SDBD                                    ; 6425   0001
        MVII    #$6984, R4                      ; 6426   02BC 0084 0069

        JSR     R5,     L_55CA                  ; 6429   0004 0154 01CA

        MVII    #$0010, R0                      ; 642C   02B8 0010
        MVII    #$0020, R1                      ; 642E   02B9 0020
        MVII    #$0001, R3                      ; 6430   02BB 0001

        JSR     R5,     L_6484                  ; 6432   0004 0164 0084

        MVII    #$0002, R2                      ; 6435   02BA 0002
        SDBD                                    ; 6437   0001
        MVII    #$69A0, R4                      ; 6438   02BC 00A0 0069
        MVII    #$0328, R3                      ; 643B   02BB 0328

        JSR     R5,     L_55CA                  ; 643D   0004 0154 01CA

        MVII    #$0062, R0                      ; 6440   02B8 0062
        MVII    #$0020, R1                      ; 6442   02B9 0020
        MVII    #$0003, R3                      ; 6444   02BB 0003

        JSR     R5,     L_6484                  ; 6446   0004 0164 0084

        SDBD                                    ; 6449   0001
        MVII    #$6A4E, R3                      ; 644A   02BB 004E 006A
        MVO     R3,     G_033E                  ; 644D   0243 033E
        SDBD                                    ; 644F   0001
        ADDI    #$0018, R3                      ; 6450   02FB 0018 0000
        MVO     R3,     G_033F                  ; 6453   0243 033F
        MVI     G_0188, R0                      ; 6455   0280 0188
        XOR     G_0337, R0                      ; 6457   03C0 0337
        MVO     R0,     G_0337                  ; 6459   0240 0337
        MVI     G_017F, R2                      ; 645B   0282 017F
        CMPI    #$0007, R2                      ; 645D   037A 0007
        BLT     L_6463                          ; 645F   0205 0002

        MVII    #$0007, R2                      ; 6461   02BA 0007
L_6463:
        ADDR    R7,     R2                      ; 6463   00FA
        SUBI    #$006E, R2                      ; 6464   033A 006E
        MVI@    R2,     R1                      ; 6466   0291
        MVO     R1,     G_0130                  ; 6467   0241 0130
        ADDI    #$0008, R2                      ; 6469   02FA 0008
        MVI@    R2,     R1                      ; 646B   0291
        ANDI    #$000F, R1                      ; 646C   03B9 000F
        MVO     R1,     G_01A0                  ; 646E   0241 01A0
        SLL     R1,     2                       ; 6470   004D
        SLL     R1,     2                       ; 6471   004D
        MVO     R1,     G_0346                  ; 6472   0241 0346
        MVO     R1,     G_0347                  ; 6474   0241 0347
        MVII    #$0007, R0                      ; 6476   02B8 0007
        MVO     R0,     G_0180                  ; 6478   0240 0180
        CLRR    R0                              ; 647A   01C0
        MVO     R0,     G_0181                  ; 647B   0240 0181
        MVO     R0,     G_019C                  ; 647D   0240 019C
        MVO     R0,     G_0191                  ; 647F   0240 0191
        PULR    R5                              ; 6481   02B5
        B       L_635A                          ; 6482   0220 0129

L_6484:
        PSHR    R5                              ; 6484   0275
L_6485:
        MVII    #$0002, R5                      ; 6485   02BD 0002
        ADDI    #$0324, R3                      ; 6487   02FB 0324
        MOVR    R3,     R2                      ; 6489   009A
        ADDI    #$0008, R3                      ; 648A   02FB 0008
L_648C:
        INCR    R2                              ; 648C   000A
        INCR    R3                              ; 648D   000B
        MVI@    R2,     R4                      ; 648E   0294
        SDBD                                    ; 648F   0001
        ANDI    #$FF00, R4                      ; 6490   03BC 0000 00FF
        XORR    R0,     R4                      ; 6493   01C4
        MVO@    R4,     R2                      ; 6494   0254
        MVI@    R3,     R4                      ; 6495   029C
        SDBD                                    ; 6496   0001
        ANDI    #$3080, R4                      ; 6497   03BC 0080 0030
        XORR    R1,     R4                      ; 649A   01CC
        MVO@    R4,     R3                      ; 649B   025C
        DECR    R5                              ; 649C   0015
        BNEQ    L_648C                          ; 649D   022C 0012
        PULR    R7                              ; 649F   02B7

L_64A0:
        PSHR    R5                              ; 64A0   0275
L_64A1:
        MVI     G_017D, R0                      ; 64A1   0280 017D
        ADD     G_0182, R0                      ; 64A3   02C0 0182
        BEQ     L_64F1                          ; 64A5   0204 004A

        JSR     R5,     L_662B                  ; 64A7   0004 0164 022B

        MVI     G_0180, R0                      ; 64AA   0280 0180
        CMPI    #$0007, R0                      ; 64AC   0378 0007
        BEQ     L_6407                          ; 64AE   0224 00A8

        MVI     G_017D, R1                      ; 64B0   0281 017D
        TSTR    R1                              ; 64B2   0089
        BEQ     L_64F1                          ; 64B3   0204 003C

        JSR     R5,     L_5578                  ; 64B5   0004 0154 0178

        SLL     R0,     2                       ; 64B8   004C
        SLL     R0,     1                       ; 64B9   0048
        MVO     R0,     G_0189                  ; 64BA   0240 0189

        JSR     R5,     L_637F                  ; 64BC   0004 0160 037F

        MVII    #$0004, R2                      ; 64BF   02BA 0004
        MVII    #$0325, R3                      ; 64C1   02BB 0325
        SDBD                                    ; 64C3   0001
        MVII    #$6984, R4                      ; 64C4   02BC 0084 0069

        JSR     R5,     L_55CA                  ; 64C7   0004 0154 01CA

        MVI     G_0188, R0                      ; 64CA   0280 0188
        XOR     G_0336, R0                      ; 64CC   03C0 0336
        MVO     R0,     G_0336                  ; 64CE   0240 0336
        CLRR    R0                              ; 64D0   01C0
        MVO     R0,     G_01A3                  ; 64D1   0240 01A3
        MVO     R0,     G_0345                  ; 64D3   0240 0345
        MVO     R0,     G_0346                  ; 64D5   0240 0346
        MVII    #$0004, R0                      ; 64D7   02B8 0004
        MVII    #$02F1, R4                      ; 64D9   02BC 02F1
L_64DB:
        MVO@    R0,     R4                      ; 64DB   0260
        CMPI    #$02F6, R4                      ; 64DC   037C 02F6
        BLT     L_64DB                          ; 64DE   0225 0004

        MVII    #$0200, R1                      ; 64E0   02B9 0200
        SLL     R1,     2                       ; 64E2   004D
        MVII    #$0008, R3                      ; 64E3   02BB 0008

        JSR     R5,     L_64F2                  ; 64E5   0004 0164 00F2

        MVII    #$032C, R3                      ; 64E8   02BB 032C
        SDBD                                    ; 64EA   0001
        MVII    #$6D29, R4                      ; 64EB   02BC 0029 006D

        JSR     R5,     L_55CC                  ; 64EE   0004 0154 01CC

L_64F1:
        PULR    R7                              ; 64F1   02B7

L_64F2:
        MVII    #$028A, R4                      ; 64F2   02BC 028A
        MVI@    R4,     R0                      ; 64F4   02A0
        XORI    #$0006, R0                      ; 64F5   03F8 0006
        XORR    R1,     R0                      ; 64F7   01C8
        MVO@    R0,     R4                      ; 64F8   0260
        ADDR    R3,     R0                      ; 64F9   00D8
        ADDI    #$0012, R4                      ; 64FA   02FC 0012
        XORI    #$0006, R0                      ; 64FC   03F8 0006
        MVO@    R0,     R4                      ; 64FE   0260
        ADDR    R3,     R0                      ; 64FF   00D8
        MVO@    R0,     R4                      ; 6500   0260
        ADDR    R3,     R0                      ; 6501   00D8
        ADDI    #$0012, R4                      ; 6502   02FC 0012
        MVO@    R0,     R4                      ; 6504   0260
        ADDR    R3,     R0                      ; 6505   00D8
        MVO@    R0,     R4                      ; 6506   0260
        MOVR    R5,     R7                      ; 6507   00AF

        NEGR    R0                              ; 6508   0020
        GSWD    R0                              ; 6509   0030
        SWAP    R0,     1                       ; 650A   0040
        RLC     R0,     1                       ; 650B   0050
        SLR     R0,     1                       ; 650C   0060
        RRC     R0,     1                       ; 650D   0070
        SARC    R0,     1                       ; 650E   0078
        SARC    R0,     1                       ; 650F   0078
L_6510:
        PSHR    R5                              ; 6510   0275
L_6511:
        CLRR    R0                              ; 6511   01C0
        MVO     R0,     G_0354                  ; 6512   0240 0354
        DECR    R0                              ; 6514   0010
        MVO     R0,     G_0191                  ; 6515   0240 0191

        JSR     R5,     L_5565                  ; 6517   0004 0154 0165
        JSR     R5,     L_5578                  ; 651A   0004 0154 0178
        JSR     R5,     L_5694                  ; 651D   0004 0154 0294

        MVO     R0,     G_019A                  ; 6520   0240 019A
        MVO     R0,     G_0108                  ; 6522   0240 0108
        MVO     R0,     G_0106                  ; 6524   0240 0106
        NOP                                     ; 6526   0034
        MVO     R0,     G_018B                  ; 6527   0240 018B
        MVO     R0,     G_018C                  ; 6529   0240 018C
        MVO     R0,     G_034D                  ; 652B   0240 034D
        SDBD                                    ; 652D   0001
        MVII    #$6534, R5                      ; 652E   02BD 0034 0065
        DIS                                     ; 6531   0003
        B       L_669D                          ; 6532   0200 0169

        MVI     G_0180, R0                      ; 6534   0280 0180
        CMPI    #$0007, R0                      ; 6536   0378 0007
        BEQ     L_6541                          ; 6538   0204 0007

        CMPI    #$0006, R0                      ; 653A   0378 0006
        BGE     L_6407                          ; 653C   022D 0136

        JSR     R5,     L_6EE6                  ; 653E   0004 016C 02E6

L_6541:
        MVII    #$0008, R4                      ; 6541   02BC 0008

        JSR     R5,     L_63A8                  ; 6543   0004 0160 03A8

        MVI     G_0188, R0                      ; 6546   0280 0188
        CLRR    R3                              ; 6548   01DB
        SETC                                    ; 6549   0007
        RRC     R3,     1                       ; 654A   0073
        MVII    #$02B5, R4                      ; 654B   02BC 02B5

        JSR     R5,     L_65AF                  ; 654D   0004 0164 01AF

        MVI     G_0187, R0                      ; 6550   0280 0187
        TSTR    R0                              ; 6552   0080
        BEQ     L_655F                          ; 6553   0204 000A

        MVI     G_0188, R0                      ; 6555   0280 0188
        MVII    #$0001, R3                      ; 6557   02BB 0001
        XORR    R3,     R0                      ; 6559   01D8
        MVII    #$02C7, R4                      ; 655A   02BC 02C7

        JSR     R5,     L_65AF                  ; 655C   0004 0164 01AF

L_655F:
        INCR    R7                              ; 655F   000F

L_6560:
        PSHR    R5                              ; 6560   0275
L_6561:
        MVII    #$0002, R2                      ; 6561   02BA 0002
        MVII    #$0325, R3                      ; 6563   02BB 0325
        SDBD                                    ; 6565   0001
        MVII    #$694C, R4                      ; 6566   02BC 004C 0069

        JSR     R5,     L_55CA                  ; 6569   0004 0154 01CA

        MVII    #$0002, R2                      ; 656C   02BA 0002
        MVII    #$0327, R3                      ; 656E   02BB 0327
        SDBD                                    ; 6570   0001
        MVII    #$6984, R4                      ; 6571   02BC 0084 0069

        JSR     R5,     L_55CA                  ; 6574   0004 0154 01CA

        SDBD                                    ; 6577   0001
        MVII    #$6A4E, R3                      ; 6578   02BB 004E 006A
        MVO     R3,     G_033F                  ; 657B   0243 033F
        SDBD                                    ; 657D   0001
        ADDI    #$0018, R3                      ; 657E   02FB 0018 0000
        MVO     R3,     G_0340                  ; 6581   0243 0340
        MVI     G_0187, R0                      ; 6583   0280 0187
        TSTR    R0                              ; 6585   0080
        BEQ     L_6595                          ; 6586   0204 000D

        MVI     G_0182, R0                      ; 6588   0280 0182
        MVI     G_0188, R1                      ; 658A   0281 0188
        TSTR    R0                              ; 658C   0080
        BEQ     L_6591                          ; 658D   0204 0002

        XORI    #$0001, R1                      ; 658F   03F9 0001
L_6591:
        XOR     G_0338, R1                      ; 6591   03C1 0338
        MVO     R1,     G_0338                  ; 6593   0241 0338
L_6595:
        MVII    #$0180, R2                      ; 6595   02BA 0180
        MVI     G_0187, R0                      ; 6597   0280 0187
        TSTR    R0                              ; 6599   0080
        BEQ     L_65A3                          ; 659A   0204 0007

        MVI     G_0182, R0                      ; 659C   0280 0182
        TSTR    R0                              ; 659E   0080
        BEQ     L_65A3                          ; 659F   0204 0002

        ADDI    #$0005, R2                      ; 65A1   02FA 0005
L_65A3:
        MVI@    R2,     R1                      ; 65A3   0291
        ADDR    R7,     R1                      ; 65A4   00F9
        SUBI    #$009D, R1                      ; 65A5   0339 009D
        MVI@    R1,     R0                      ; 65A7   0288
        MVII    #$0030, R1                      ; 65A8   02B9 0030
        MVII    #$0002, R3                      ; 65AA   02BB 0002
        J       L_6485                          ; 65AC   0004 0364 0085

L_65AF:
        PSHR    R5                              ; 65AF   0275
        CLRR    R2                              ; 65B0   01D2
        CLRR    R1                              ; 65B1   01C9
        TSTR    R0                              ; 65B2   0080
        BEQ     L_65B9                          ; 65B3   0204 0004

        MVII    #$0002, R1                      ; 65B5   02B9 0002
        MVII    #$0005, R2                      ; 65B7   02BA 0005
L_65B9:
        XORI    #$0206, R3                      ; 65B9   03FB 0206
        ADDI    #$02F7, R1                      ; 65BB   02F9 02F7
        ADDI    #$017D, R2                      ; 65BD   02FA 017D
        PSHR    R1                              ; 65BF   0271
        MOVR    R3,     R1                      ; 65C0   0099
        SDBD                                    ; 65C1   0001
        XORI    #$0978, R1                      ; 65C2   03F9 0078 0009

        JSR     R5,     L_6603                  ; 65C5   0004 0164 0203

        INCR    R2                              ; 65C8   000A
        ADDI    #$0028, R4                      ; 65C9   02FC 0028
        SDBD                                    ; 65CB   0001
        MVII    #$0B5D, R1                      ; 65CC   02B9 005D 000B

        JSR     R5,     L_6603                  ; 65CF   0004 0164 0203

        MVI@    R2,     R1                      ; 65D2   0291
        SLR     R1,     2                       ; 65D3   0065
        SLR     R1,     2                       ; 65D4   0065
        SDBD                                    ; 65D5   0001
        ADDI    #$0B59, R1                      ; 65D6   02F9 0059 000B
        SUBI    #$003C, R4                      ; 65D9   033C 003C
        MVO@    R1,     R4                      ; 65DB   0261
        ADDI    #$0027, R4                      ; 65DC   02FC 0027
        PULR    R2                              ; 65DE   02B2
        TSTR    R3                              ; 65DF   009B
        BMI     L_65E4                          ; 65E0   020B 0002

        SUBI    #$0007, R4                      ; 65E2   033C 0007
L_65E4:
        MVI@    R2,     R0                      ; 65E4   0290
        DECR    R2                              ; 65E5   0012
        MVII    #$0004, R1                      ; 65E6   02B9 0004
        TSTR    R0                              ; 65E8   0080
        BNEQ    L_65F2                          ; 65E9   020C 0007

        MVI@    R2,     R0                      ; 65EB   0290
        TSTR    R3                              ; 65EC   009B
        BMI     L_65F8                          ; 65ED   020B 0009

        ADDR    R1,     R4                      ; 65EF   00CC
        B       L_65F8                          ; 65F0   0200 0006

L_65F2:
        PSHR    R2                              ; 65F2   0272
        PSHR    R1                              ; 65F3   0271
        MOVR    R7,     R5                      ; 65F4   00BD
        ADDI    #$0006, R5                      ; 65F5   02FD 0006
        PSHR    R5                              ; 65F7   0275
L_65F8:
        J       .EXEC.8C9                       ; 65F8   0004 0318 00C9

        PULR    R1                              ; 65FB   02B1
        PULR    R2                              ; 65FC   02B2
        SLL     R3,     1                       ; 65FD   004B
        SLR     R3,     1                       ; 65FE   0063
        MVI@    R2,     R0                      ; 65FF   0290
        J       .EXEC.8AE                       ; 6600   0004 0318 00AE

L_6603:
        PSHR    R5                              ; 6603   0275
        MOVR    R4,     R5                      ; 6604   00A5
        MVI@    R2,     R0                      ; 6605   0290
        ANDI    #$000F, R0                      ; 6606   03B8 000F
L_6608:
        DECR    R0                              ; 6608   0010
        BMI     L_662A                          ; 6609   020B 001F

        MVO@    R1,     R5                      ; 660B   0269
        TSTR    R3                              ; 660C   009B
        BMI     L_6608                          ; 660D   022B 0006

        SUBI    #$0002, R5                      ; 660F   033D 0002
        B       L_6608                          ; 6611   0220 000A

L_6613:
        PSHR    R5                              ; 6613   0275
        MOVR    R3,     R5                      ; 6614   009D
        MVI     G_032D, R0                      ; 6615   0280 032D
        ADDI    #$032D, R3                      ; 6617   02FB 032D
        MVI@    R3,     R2                      ; 6619   029A
        ADDR    R2,     R1                      ; 661A   00D1
        ANDI    #$007F, R0                      ; 661B   03B8 007F
        ANDI    #$007F, R1                      ; 661D   03B9 007F
        MVI     G_01B3, R2                      ; 661F   0282 01B3
        CMPR    R0,     R1                      ; 6621   0141
        BGT     L_6625                          ; 6622   020E 0001

        COMR    R2                              ; 6624   001A
L_6625:
        MVII    #$0136, R4                      ; 6625   02BC 0136
        ADDR    R5,     R4                      ; 6627   00EC
        ADDR    R5,     R4                      ; 6628   00EC
        MVO@    R2,     R4                      ; 6629   0262
L_662A:
        PULR    R7                              ; 662A   02B7

L_662B:
        PSHR    R5                              ; 662B   0275
        MVI     G_019B, R0                      ; 662C   0280 019B
        TSTR    R0                              ; 662E   0080
        BNEQ    L_6680                          ; 662F   020C 004F

        MVI     G_0187, R1                      ; 6631   0281 0187
        TSTR    R1                              ; 6633   0089
        BNEQ    L_663A                          ; 6634   020C 0004

        MVO     R1,     G_0188                  ; 6636   0241 0188
        B       L_6659                          ; 6638   0200 001F

L_663A:
        MVI     G_0188, R1                      ; 663A   0281 0188
        MVI     G_0182, R0                      ; 663C   0280 0182
        TSTR    R0                              ; 663E   0080
        BEQ     L_6659                          ; 663F   0204 0018

        MVII    #$02F6, R2                      ; 6641   02BA 02F6
        MVII    #$02F8, R3                      ; 6643   02BB 02F8
        MVII    #$0002, R4                      ; 6645   02BC 0002

        JSR     R5,     L_6681                  ; 6647   0004 0164 0281

        MVII    #$0182, R2                      ; 664A   02BA 0182
        MVII    #$017D, R3                      ; 664C   02BB 017D
        MVII    #$0005, R4                      ; 664E   02BC 0005

        JSR     R5,     L_6681                  ; 6650   0004 0164 0281

        MVI     G_0188, R1                      ; 6653   0281 0188
        XORI    #$0001, R1                      ; 6655   03F9 0001
        MVO     R1,     G_0188                  ; 6657   0241 0188
L_6659:
        SDBD                                    ; 6659   0001
        MVII    #$1206, R3                      ; 665A   02BB 0006 0012
        MVII    #$021A, R4                      ; 665D   02BC 021A
        TSTR    R1                              ; 665F   0089
        BEQ     L_6664                          ; 6660   0204 0002

        XORI    #$0001, R3                      ; 6662   03FB 0001

L_6664:
        JSR     R5,     X_PRINT_R5              ; 6664   0004 0118 007B
        STRING  "PLAYER 1"                      ; 6667  
        DECLE   $0000                           ; 666F   0000

        TSTR    R1                              ; 6670   0089
        BEQ     L_6679                          ; 6671   0204 0006

        DECR    R4                              ; 6673   0014
        MVI@    R4,     R1                      ; 6674   02A1
        DECR    R4                              ; 6675   0014
        ADDI    #$0008, R1                      ; 6676   02F9 0008
        MVO@    R1,     R4                      ; 6678   0261
L_6679:
        SDBD                                    ; 6679   0001
        MVII    #$30FF, R0                      ; 667A   02B8 00FF 0030
L_667D:
        DECR    R0                              ; 667D   0010
        BNEQ    L_667D                          ; 667E   022C 0002
L_6680:
        PULR    R7                              ; 6680   02B7

L_6681:
        MVI@    R2,     R0                      ; 6681   0290
        MVI@    R3,     R1                      ; 6682   0299
        MVO@    R0,     R3                      ; 6683   0258
        MVO@    R1,     R2                      ; 6684   0251
        INCR    R2                              ; 6685   000A
        INCR    R3                              ; 6686   000B
        DECR    R4                              ; 6687   0014
        BNEQ    L_6681                          ; 6688   022C 0008
        MOVR    R5,     R7                      ; 668A   00AF

        SDBD                                    ; 668B   0001
        MVII    #$51C0, R1                      ; 668C   02B9 00C0 0051
        MVO     R1,     .ISRVEC.0               ; 668F   0241 0100
        SWAP    R1,     1                       ; 6691   0041
        MVO     R1,     .ISRVEC.1               ; 6692   0241 0101
        CLRR    R0                              ; 6694   01C0
        MVII    #$0175, R4                      ; 6695   02BC 0175
L_6697:
        MVO@    R0,     R4                      ; 6697   0260
        CMPI    #$017A, R4                      ; 6698   037C 017A
        BLT     L_6697                          ; 669A   0225 0004
        MOVR    R5,     R7                      ; 669C   00AF

L_669D:
        SDBD                                    ; 669D   0001
        MVII    #$668B, R1                      ; 669E   02B9 008B 0066
        MVO     R1,     .ISRVEC.0               ; 66A1   0241 0100
        SWAP    R1,     1                       ; 66A3   0041
        MVO     R1,     .ISRVEC.1               ; 66A4   0241 0101
        EIS                                     ; 66A6   0002
        MOVR    R5,     R7                      ; 66A7   00AF

        DECLE   $0000                           ; 66A8   0000

        SUBR    R5,     R1                      ; 66A9   0129
        MOVR    R4,     R7                      ; 66AA   00A7

        ANDR    R4,     R1                      ; 66AB   01A1
        MOVR    R5,     R7                      ; 66AC   00AF

        DECLE   $01A1,  $0000                   ; 66AD   01A1 0000

        SUBR    R5,     R4                      ; 66AF   012C
        MOVR    R4,     R7                      ; 66B0   00A7

        ANDR    R4,     R1                      ; 66B1   01A1
        MOVR    R5,     R7                      ; 66B2   00AF

        DECLE   $01A1,  $0000                   ; 66B3   01A1 0000

        SUBR    R5,     R3                      ; 66B5   012B
        MOVR    R4,     R7                      ; 66B6   00A7

        ANDR    R4,     R1                      ; 66B7   01A1
        MOVR    R5,     R7                      ; 66B8   00AF

        DECLE   $01A1,  $0000,  $012F,  $0012   ; 66B9   01A1 0000 012F 0012
        DECLE   $01A1,  $0000,  $012A,  $002C   ; 66BD   01A1 0000 012A 002C
        DECLE   $01A1,  $0064,  $01A1,  $002D   ; 66C1   01A1 0064 01A1 002D
        DECLE   $01A1,  $0065,  $01A1,  $002C   ; 66C5   01A1 0065 01A1 002C
        DECLE   $01A1,  $0064,  $01A1,  $002C   ; 66C9   01A1 0064 01A1 002C
        DECLE   $01A1,  $0064,  $01A1,  $0160   ; 66CD   01A1 0064 01A1 0160
        DECLE   $01A1,  $00E2,  $0081,  $0168   ; 66D1   01A1 00E2 0081 0168
        DECLE   $01A1,  $002C,  $01A1,  $0156   ; 66D5   01A1 002C 01A1 0156
        DECLE   $01A2,  $0064,  $01A1,  $0000   ; 66D9   01A2 0064 01A1 0000
        DECLE   $0122,  $0000,  $0021,  $002C   ; 66DD   0122 0000 0021 002C
        DECLE   $00A1,  $0034,  $00A1,  $002D   ; 66E1   00A1 0034 00A1 002D
        DECLE   $0281,  $0035,  $0281,  $002C   ; 66E5   0281 0035 0281 002C
        DECLE   $02A1,  $0034,  $02A1,  $0124   ; 66E9   02A1 0034 02A1 0124
        DECLE   $03C4,  $0054,  $0081,  $011A   ; 66ED   03C4 0054 0081 011A
        DECLE   $0081,  $0044,  $0081,  $0004   ; 66F1   0081 0044 0081 0004
        DECLE   $0201,  $0054,  $00A1,  $0044   ; 66F5   0201 0054 00A1 0044
        DECLE   $00A1,  $0004,  $0201,  $0054   ; 66F9   00A1 0004 0201 0054
        DECLE   $00A1,  $0001,  $03A2,  $0051   ; 66FD   00A1 0001 03A2 0051
        DECLE   $00E1,  $0003,  $0061,  $0063   ; 6701   00E1 0003 0061 0063
        DECLE   $02A1,  $002B,  $02A1,  $004C   ; 6705   02A1 002B 02A1 004C
        DECLE   $00E1,  $0063,  $0281,  $002B   ; 6709   00E1 0063 0281 002B
        DECLE   $0281,  $004C,  $00E1,  $0063   ; 670D   0281 004C 00E1 0063
        DECLE   $0281,  $002B,  $0281,  $004C   ; 6711   0281 002B 0281 004C
        DECLE   $00E1,  $0003,  $0061,  $0063   ; 6715   00E1 0003 0061 0063
        DECLE   $0281,  $002B,  $0281,  $004C   ; 6719   0281 002B 0281 004C
        DECLE   $00E3,  $0029,  $00E1,  $0001   ; 671D   00E3 0029 00E1 0001
        DECLE   $0023,  $004B,  $00A1,  $0051   ; 6721   0023 004B 00A1 0051
        DECLE   $00E1,  $0029,  $00E1,  $0031   ; 6725   00E1 0029 00E1 0031
        DECLE   $00E1,  $0039,  $00E1,  $0051   ; 6729   00E1 0039 00E1 0051
        DECLE   $00E1,  $0029,  $00E1,  $0031   ; 672D   00E1 0029 00E1 0031
        DECLE   $00E1,  $0039,  $00E1,  $004B   ; 6731   00E1 0039 00E1 004B
        DECLE   $00A1,  $0039,  $00E1,  $0061   ; 6735   00A1 0039 00E1 0061
        DECLE   $00E1,  $0029,  $00E1,  $0031   ; 6739   00E1 0029 00E1 0031
        DECLE   $00E1,  $0039,  $00E2,  $0001   ; 673D   00E1 0039 00E2 0001
        DECLE   $0023,  $0001,  $03A1,  $0001   ; 6741   0023 0001 03A1 0001
        DECLE   $002F,  $0001,  $03A1,  $0001   ; 6745   002F 0001 03A1 0001
        DECLE   $002F,  $0001,  $03A1,  $0001   ; 6749   002F 0001 03A1 0001
        DECLE   $002B,  $0001,  $03A1,  $0001   ; 674D   002B 0001 03A1 0001
        DECLE   $002F,  $0001,  $002F,  $0001   ; 6751   002F 0001 002F 0001
        DECLE   $03A1,  $0001,  $002E,  $0001   ; 6755   03A1 0001 002E 0001
        DECLE   $03A1,  $0001,  $0027,  $0000   ; 6759   03A1 0001 0027 0000

        SUBR    R5,     R4                      ; 675D   012C
        MOVR    R4,     R7                      ; 675E   00A7

        ANDR    R4,     R1                      ; 675F   01A1
        MOVR    R5,     R7                      ; 6760   00AF

        DECLE   $01A1,  $0000,  $012F,  $0000   ; 6761   01A1 0000 012F 0000

        SUBR    R4,     R5                      ; 6765   0125
        MOVR    R4,     R7                      ; 6766   00A7

        ANDR    R4,     R1                      ; 6767   01A1
        MOVR    R5,     R7                      ; 6768   00AF

        DECLE   $01A1,  $0000                   ; 6769   01A1 0000

        SUBR    R5,     R2                      ; 676B   012A
        MOVR    R4,     R7                      ; 676C   00A7

        ANDR    R4,     R1                      ; 676D   01A1
        MOVR    R5,     R7                      ; 676E   00AF

        DECLE   $01A1,  $0000,  $012F,  $00C3   ; 676F   01A1 0000 012F 00C3
        DECLE   $01A1,  $00CB,  $01AC,  $00D3   ; 6773   01A1 00CB 01AC 00D3
        DECLE   $01A1,  $0000,  $0123,  $0000   ; 6777   01A1 0000 0123 0000
        DECLE   $0223,  $00BD,  $01A1,  $007B   ; 677B   0223 00BD 01A1 007B
        DECLE   $0121,  $0000,  $0122,  $007B   ; 677F   0121 0000 0122 007B
        DECLE   $0121,  $0000,  $0124,  $01E3   ; 6783   0121 0000 0124 01E3
        DECLE   $0121,  $0000,  $0122,  $01E3   ; 6787   0121 0000 0122 01E3
        DECLE   $0121,  $0075,  $01A1,  $0000   ; 678B   0121 0075 01A1 0000
        DECLE   $0227,  $00B5,  $01A1,  $0000   ; 678F   0227 00B5 01A1 0000
        DECLE   $0121,  $007B,  $0121,  $0000   ; 6793   0121 007B 0121 0000
        DECLE   $0126,  $01E3,  $0121,  $0000   ; 6797   0126 01E3 0121 0000
        DECLE   $0121,  $006D,  $01A1,  $0000   ; 679B   0121 006D 01A1 0000
        DECLE   $0228,  $00BD,  $01A1,  $007B   ; 679F   0228 00BD 01A1 007B
        DECLE   $0121,  $0000,  $0128,  $01E3   ; 67A3   0121 0000 0128 01E3
        DECLE   $0121,  $0075,  $01A1,  $0000   ; 67A7   0121 0075 01A1 0000
        DECLE   $0229,  $00B5,  $01A1,  $0000   ; 67AB   0229 00B5 01A1 0000
        DECLE   $0128,  $006D,  $01A1,  $0000   ; 67AF   0128 006D 01A1 0000
        DECLE   $022A,  $00BD,  $01A1,  $0000   ; 67B3   022A 00BD 01A1 0000
        DECLE   $0128,  $0075,  $01A1,  $0000   ; 67B7   0128 0075 01A1 0000
        DECLE   $022B,  $00B5,  $01A1,  $0000   ; 67BB   022B 00B5 01A1 0000
        DECLE   $0126,  $006D,  $01A1,  $0000   ; 67BF   0126 006D 01A1 0000
        DECLE   $022C,  $00BD,  $00A1,  $0059   ; 67C3   022C 00BD 00A1 0059
        DECLE   $00A6,  $0075,  $00A1,  $0000   ; 67C7   00A6 0075 00A1 0000
        DECLE   $022D,  $00B5,  $00A1,  $0059   ; 67CB   022D 00B5 00A1 0059
        DECLE   $00A4,  $006D,  $00A1,  $0000   ; 67CF   00A4 006D 00A1 0000
        DECLE   $0227,  $0070,  $0009,  $0009   ; 67D3   0227 0070 0009 0009
        DECLE   $0083,  $0070,  $0009,  $0083   ; 67D7   0083 0070 0009 0083
        DECLE   $0052,  $00A0,  $0083,  $000A   ; 67DB   0052 00A0 0083 000A
        DECLE   $0062,  $0051,  $000A,  $000A   ; 67DF   0062 0051 000A 000A
        DECLE   $0072,  $00C1,  $000A,  $0052   ; 67E3   0072 00C1 000A 0052
        DECLE   $0009,  $000B,  $00A1,  $0062   ; 67E7   0009 000B 00A1 0062
        DECLE   $0009,  $000B,  $0080,  $0009   ; 67EB   0009 000B 0080 0009
        DECLE   $0009,  $0080,  $0009,  $0009   ; 67EF   0009 0080 0009 0009
        DECLE   $0009,  $0081,  $0125,  $000A   ; 67F3   0009 0081 0125 000A
        DECLE   $000A,  $0071,  $0115,  $0104   ; 67F7   000A 0071 0115 0104
        DECLE   $00F4,  $00A1,  $0135,  $000A   ; 67FB   00F4 00A1 0135 000A
        DECLE   $000A,  $0081,  $000A,  $000A   ; 67FF   000A 0081 000A 000A
        DECLE   $000A,  $0071,  $0125,  $000A   ; 6803   000A 0071 0125 000A
        DECLE   $000A,  $0071,  $0115,  $0104   ; 6807   000A 0071 0115 0104
        DECLE   $00F4,  $0071,  $0135,  $000A   ; 680B   00F4 0071 0135 000A
        DECLE   $000A,  $00A1,  $000A,  $000A   ; 680F   000A 00A1 000A 000A
        DECLE   $000A,  $000B,  $000B,  $000B   ; 6813   000A 000B 000B 000B
        DECLE   $01D6,  $000B,  $000B,  $000B   ; 6817   01D6 000B 000B 000B
        DECLE   $01E6,  $000B,  $000B,  $01F6   ; 681B   01E6 000B 000B 01F6
        DECLE   $0008,  $000B,  $002C,  $01C7   ; 681F   0008 000B 002C 01C7
        DECLE   $0237,  $000B,  $000B,  $0206   ; 6823   0237 000B 000B 0206
        DECLE   $0008,  $000B,  $000B,  $000B   ; 6827   0008 000B 000B 000B
        DECLE   $0216,  $000B,  $000B,  $000B   ; 682B   0216 000B 000B 000B
        DECLE   $0226,  $000B,  $000B,  $000B   ; 682F   0226 000B 000B 000B
        DECLE   $01B6,  $01A0,  $01E9,  $0032   ; 6833   01B6 01A0 01E9 0032
        DECLE   $007B,  $00BC,  $005F,  $0016   ; 6837   007B 00BC 005F 0016
        DECLE   $01CD,  $0184,  $0143,  $0143   ; 683B   01CD 0184 0143 0143
        DECLE   $01A0,  $01E9,  $0032,  $007B   ; 683F   01A0 01E9 0032 007B
        DECLE   $00BC,  $005F,  $0016,  $01CD   ; 6843   00BC 005F 0016 01CD
        DECLE   $0032,  $007B,  $00BC,  $005F   ; 6847   0032 007B 00BC 005F
        DECLE   $0016,  $01CD,  $0184,  $0143   ; 684B   0016 01CD 0184 0143
        DECLE   $01A0,  $01E9,  $0184,  $0143   ; 684F   01A0 01E9 0184 0143
        DECLE   $0104,  $01CD,  $0016,  $01CD   ; 6853   0104 01CD 0016 01CD
        DECLE   $0184,  $0043,  $015A,  $0158   ; 6857   0184 0043 015A 0158
        DECLE   $01A0,  $01E9,  $012A,  $0015   ; 685B   01A0 01E9 012A 0015
        DECLE   $01CC,  $0183,  $0142,  $0110   ; 685F   01CC 0183 0142 0110
        DECLE   $0042,  $019A,  $01E2,  $0098   ; 6863   0042 019A 01E2 0098
        DECLE   $01E1,  $002A,  $0073,  $00BC   ; 6867   01E1 002A 0073 00BC
        DECLE   $0085,  $01A0,  $005F,  $005E   ; 686B   0085 01A0 005F 005E
        DECLE   $005D,  $01D5,  $00CC,  $0184   ; 686F   005D 01D5 00CC 0184
        DECLE   $0144,  $00D4,  $0067,  $00F4   ; 6873   0144 00D4 0067 00F4
        DECLE   $0067,  $0014,  $0068,  $005C   ; 6877   0067 0014 0068 005C
        DECLE   $0067,  $00A8,  $0066,  $004B   ; 687B   0067 00A8 0066 004B
        DECLE   $0183,  $018B,  $004B,  $014B   ; 687F   0183 018B 004B 014B
        DECLE   $014B,  $014B,  $0039,  $0000   ; 6883   014B 014B 0039 0000
        DECLE   $0006,  $0000,  $0034,  $0000   ; 6887   0006 0000 0034 0000

        DECR    R0                              ; 688B   0010
        INCR    R2                              ; 688C   000A
        INCR    R6                              ; 688D   000E
        ADCR    R5                              ; 688E   002D
        RSWD    R5                              ; 688F   003D
        COMR    R2                              ; 6890   001A
        COMR    R0                              ; 6891   0018
L_6892:
        PSHR    R5                              ; 6892   0275
        MVI     G_018B, R0                      ; 6893   0280 018B
        INCR    R0                              ; 6895   0008
        ANDI    #$0007, R0                      ; 6896   03B8 0007
        MVO     R0,     G_018B                  ; 6898   0240 018B
        MVII    #$0013, R0                      ; 689A   02B8 0013

        JSR     R5,     L_68EE                  ; 689C   0004 0168 00EE

        MVI     G_0199, R1                      ; 689F   0281 0199
        DECR    R1                              ; 68A1   0011
        MVO     R1,     G_0199                  ; 68A2   0241 0199
        BPL     L_68ED                          ; 68A4   0203 0047

        MVI     G_01AB, R1                      ; 68A6   0281 01AB
        MVO     R1,     G_0199                  ; 68A8   0241 0199
        MVI     G_01AC, R3                      ; 68AA   0283 01AC
        MVI     G_01A5, R4                      ; 68AC   0284 01A5
        INCR    R4                              ; 68AE   000C
        ANDI    #$003F, R4                      ; 68AF   03BC 003F
        MVI     G_017F, R0                      ; 68B1   0280 017F
        CMPI    #$0004, R0                      ; 68B3   0378 0004
        BGT     L_68B9                          ; 68B5   020E 0002

        ANDI    #$001F, R4                      ; 68B7   03BC 001F
L_68B9:
        MVO     R4,     G_01A5                  ; 68B9   0244 01A5
L_68BB:
        MVI     G_01A5, R4                      ; 68BB   0284 01A5
        SDBD                                    ; 68BD   0001
        ADDI    #$6834, R4                      ; 68BE   02FC 0034 0068
        MVI@    R4,     R0                      ; 68C1   02A0
        CMPI    #$0003, R3                      ; 68C2   037B 0003
        BLT     L_68C8                          ; 68C4   0205 0002

        SLR     R0,     2                       ; 68C6   0064
        SLR     R0,     1                       ; 68C7   0060
L_68C8:
        CMPI    #$0002, R3                      ; 68C8   037B 0002
        BLT     L_68CE                          ; 68CA   0205 0002

        SLR     R0,     2                       ; 68CC   0064
        SLR     R0,     1                       ; 68CD   0060
L_68CE:
        ANDI    #$0007, R0                      ; 68CE   03B8 0007
        MVI     G_0180, R1                      ; 68D0   0281 0180
        CMPI    #$0001, R1                      ; 68D2   0379 0001
        BGT     L_68DA                          ; 68D4   020E 0004

        CMPI    #$0007, R0                      ; 68D6   0378 0007
        BEQ     L_68EA                          ; 68D8   0204 0010

L_68DA:
        MOVR    R7,     R4                      ; 68DA   00BC
        SUBI    #$004F, R4                      ; 68DB   033C 004F
        ANDI    #$0006, R1                      ; 68DD   03B9 0006
        ADDR    R1,     R4                      ; 68DF   00CC
        SDBD                                    ; 68E0   0001
        MVI@    R4,     R2                      ; 68E1   02A2
        MVII    #$024F, R4                      ; 68E2   02BC 024F
L_68E4:
        ADDI    #$0014, R4                      ; 68E4   02FC 0014
        DECR    R0                              ; 68E6   0010
        BPL     L_68E4                          ; 68E7   0223 0004

        MVO@    R2,     R4                      ; 68E9   0262
L_68EA:
        DECR    R3                              ; 68EA   0013
        BNEQ    L_68BB                          ; 68EB   022C 0031
L_68ED:
        PULR    R7                              ; 68ED   02B7

L_68EE:
        PSHR    R5                              ; 68EE   0275
        MVI     G_0180, R4                      ; 68EF   0284 0180
        ANDI    #$000E, R4                      ; 68F1   03BC 000E
        ADDR    R7,     R4                      ; 68F3   00FC
        SUBI    #$0080, R4                      ; 68F4   033C 0080
        SDBD                                    ; 68F6   0001
        MVI@    R4,     R3                      ; 68F7   02A3
        MOVR    R3,     R4                      ; 68F8   009C
        MOVR    R0,     R3                      ; 68F9   0083
        MVI     G_018B, R0                      ; 68FA   0280 018B
        SLL     R0,     2                       ; 68FC   004C
        ADDR    R0,     R4                      ; 68FD   00C4
        ADDI    #$0200, R3                      ; 68FE   02FB 0200
        MVII    #$0004, R2                      ; 6900   02BA 0004
L_6902:
        SDBD                                    ; 6902   0001
        MVII    #$56D8, R5                      ; 6903   02BD 00D8 0056
        MVI@    R4,     R0                      ; 6906   02A0
        MOVR    R0,     R1                      ; 6907   0081
        ANDI    #$03F0, R0                      ; 6908   03B8 03F0
        ANDI    #$000F, R1                      ; 690A   03B9 000F
        SAR     R0,     1                       ; 690C   0068
        SLL     R1,     1                       ; 690D   0049
        ADDR    R1,     R5                      ; 690E   00CD
        SDBD                                    ; 690F   0001
        XOR@    R5,     R0                      ; 6910   03E8
        MVO@    R0,     R3                      ; 6911   0258
        ADDI    #$0014, R3                      ; 6912   02FB 0014
        DECR    R2                              ; 6914   0012
        BEQ     L_6919                          ; 6915   0204 0002
        B       L_6902                          ; 6917   0220 0016

L_6919:
        MVI     G_0180, R4                      ; 6919   0284 0180
        ANDI    #$0006, R4                      ; 691B   03BC 0006
        ADDR    R7,     R4                      ; 691D   00FC
        SUBI    #$0098, R4                      ; 691E   033C 0098
        SDBD                                    ; 6920   0001
        MVI@    R4,     R0                      ; 6921   02A0
        MVII    #$0008, R2                      ; 6922   02BA 0008
L_6924:
        MVO@    R0,     R3                      ; 6924   0258
        ADDI    #$0014, R3                      ; 6925   02FB 0014
        DECR    R2                              ; 6927   0012
        BNEQ    L_6924                          ; 6928   022C 0005

        MVI     G_0180, R1                      ; 692A   0281 0180
        CMPI    #$0001, R1                      ; 692C   0379 0001
        BGT     L_694B                          ; 692E   020E 001B

        MVI     G_01A4, R4                      ; 6930   0284 01A4
        INCR    R4                              ; 6932   000C
        ANDI    #$0007, R4                      ; 6933   03BC 0007
        MVO     R4,     G_01A4                  ; 6935   0244 01A4
        ADDR    R7,     R4                      ; 6937   00FC
        SUBI    #$00BA, R4                      ; 6938   033C 00BA
        MVII    #$0200, R2                      ; 693A   02BA 0200
        SLL     R2,     1                       ; 693C   004A
        MVI@    R4,     R1                      ; 693D   02A1
        XORR    R1,     R0                      ; 693E   01C8
        ANDI    #$0007, R1                      ; 693F   03B9 0007
        CMPI    #$0003, R1                      ; 6941   0379 0003
        BNEQ    L_6946                          ; 6943   020C 0001

        XORR    R2,     R0                      ; 6945   01D0
L_6946:
        SLL     R2,     1                       ; 6946   004A
        XORR    R2,     R0                      ; 6947   01D0
        SUBI    #$0014, R3                      ; 6948   033B 0014
        MVO@    R0,     R3                      ; 694A   0258
L_694B:
        PULR    R7                              ; 694B   02B7

        DECLE   $0014,  $0008,  $00B0,  $0000   ; 694C   0014 0008 00B0 0000
        DECLE   $0002,  $0000,  $002C,  $006A   ; 6950   0002 0000 002C 006A
        DECLE   $0002,  $0000,  $0000,  $0000   ; 6954   0002 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0048   ; 6958   0000 0000 0000 0048
        DECLE   $0080,  $0040,  $0002,  $0000   ; 695C   0080 0040 0002 0000
        DECLE   $002C,  $006A,  $0003,  $0000   ; 6960   002C 006A 0003 0000
        DECLE   $0078,  $0000,  $0008,  $0000   ; 6964   0078 0000 0008 0000
        DECLE   $0058,  $0009,  $00A0,  $0000   ; 6968   0058 0009 00A0 0000
        DECLE   $0003,  $0030,  $0032,  $006A   ; 696C   0003 0030 0032 006A
        DECLE   $0060,  $0000,  $0000,  $0000   ; 6970   0060 0000 0000 0000
        DECLE   $0000,  $0000,  $0058,  $000D   ; 6974   0000 0000 0058 000D
        DECLE   $0029,  $0001,  $0002,  $0020   ; 6978   0029 0001 0002 0020
        DECLE   $003A,  $006A,  $0000,  $0000   ; 697C   003A 006A 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6980   0001 0000 0000 0000
        DECLE   $0093,  $0089,  $00C0,  $0005   ; 6984   0093 0089 00C0 0005
        DECLE   $0003,  $0010,  $0044,  $006A   ; 6988   0003 0010 0044 006A
        DECLE   $0050,  $0000,  $0000,  $0000   ; 698C   0050 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00C9   ; 6990   0000 0000 0000 00C9
        DECLE   $0080,  $0045,  $0006,  $0000   ; 6994   0080 0045 0006 0000
        DECLE   $0058,  $006A,  $0050,  $0000   ; 6998   0058 006A 0050 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 699C   0000 0000 0000 0000
        DECLE   $009B,  $0008,  $00C0,  $0001   ; 69A0   009B 0008 00C0 0001
        DECLE   $0007,  $0000,  $006C,  $006A   ; 69A4   0007 0000 006C 006A
        DECLE   $0000,  $0000,  $0040,  $0000   ; 69A8   0000 0000 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0048   ; 69AC   0000 0000 0000 0048
        DECLE   $0080,  $0041,  $0007,  $0010   ; 69B0   0080 0041 0007 0010
        DECLE   $006C,  $006A,  $0001,  $0000   ; 69B4   006C 006A 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69B8   0000 0000 0000 0000
        DECLE   $009A,  $000C,  $0040,  $0001   ; 69BC   009A 000C 0040 0001
        DECLE   $0007,  $0010,  $0072,  $006A   ; 69C0   0007 0010 0072 006A
        DECLE   $0020,  $0000,  $0000,  $0000   ; 69C4   0020 0000 0000 0000
        DECLE   $0000,  $0000,  $00A0,  $0089   ; 69C8   0000 0000 00A0 0089
        DECLE   $0000,  $0001,  $0003,  $0010   ; 69CC   0000 0001 0003 0010
        DECLE   $0078,  $006A,  $0020,  $0000   ; 69D0   0078 006A 0020 0000
        DECLE   $0000,  $0000,  $00FA,  $0000   ; 69D4   0000 0000 00FA 0000
        DECLE   $00A0,  $00C8,  $0032,  $0000   ; 69D8   00A0 00C8 0032 0000
        DECLE   $0000,  $0000,  $0084,  $006A   ; 69DC   0000 0000 0084 006A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0089   ; 69E4   0000 0000 0000 0089
        DECLE   $0026,  $0001,  $0003,  $0010   ; 69E8   0026 0001 0003 0010
        DECLE   $0078,  $006A,  $0020,  $0000   ; 69EC   0078 006A 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F0   0000 0000 0000 0000
        DECLE   $00A0,  $0089,  $0000,  $0001   ; 69F4   00A0 0089 0000 0001
        DECLE   $0002,  $0000,  $0078,  $006A   ; 69F8   0002 0000 0078 006A
        DECLE   $0020,  $0000,  $0000,  $0000   ; 69FC   0020 0000 0000 0000
        DECLE   $0000,  $0000,  $00A0,  $008D   ; 6A00   0000 0000 00A0 008D
        DECLE   $0000,  $0001,  $0007,  $0000   ; 6A04   0000 0001 0007 0000
        DECLE   $007E,  $006A,  $0000,  $0000   ; 6A08   007E 006A 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A0C   0000 0000 0000 0000
        DECLE   $0058,  $0008,  $00C8,  $0001   ; 6A10   0058 0008 00C8 0001
        DECLE   $0005,  $0010,  $008A,  $006A   ; 6A14   0005 0010 008A 006A
        DECLE   $0020,  $0000,  $005A,  $0000   ; 6A18   0020 0000 005A 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; 6A1C   0000 0000 0000 0008
        DECLE   $0000,  $0000,  $0007,  $0000   ; 6A20   0000 0000 0007 0000
        DECLE   $00BC,  $006C,  $0030,  $0000   ; 6A24   00BC 006C 0030 0000
        DECLE   $0050,  $0000,  $0000,  $0000   ; 6A28   0050 0000 0000 0000
        DECLE   $00EB,  $0062,  $00FB,  $006B   ; 6A2C   00EB 0062 00FB 006B
        DECLE   $0002,  $0000                   ; 6A30   0002 0000

        RSWD    R3                              ; 6A32   003B
        SLR     R1,     1                       ; 6A33   0061
        ADDR    R2,     R1                      ; 6A34   00D1
        SAR     R0,     2                       ; 6A35   006C
        EIS                                     ; 6A36   0002

        JSRE    R4,     .EXEC.45B               ; 6A37   0004 0015 005B
        DECLE   $00C4,  $0062,  $003B,  $006C   ; 6A3A   00C4 0062 003B 006C
        DECLE   $0001,  $0202,  $00BE,  $005B   ; 6A3E   0001 0202 00BE 005B
        DECLE   $0058,  $005B,  $0024,  $0061   ; 6A42   0058 005B 0024 0061
        DECLE   $009D,  $006A,  $0003,  $0180   ; 6A46   009D 006A 0003 0180
        DECLE   $0083,  $005A,  $00E4,  $0059   ; 6A4A   0083 005A 00E4 0059
        DECLE   $0024,  $0061,  $009D,  $006A   ; 6A4E   0024 0061 009D 006A
        DECLE   $0003,  $0280,  $0083,  $005A   ; 6A52   0003 0280 0083 005A
        DECLE   $006C,  $005B,  $0034,  $0061   ; 6A56   006C 005B 0034 0061
        DECLE   $00FD,  $006A,  $0003,  $00B4   ; 6A5A   00FD 006A 0003 00B4
        DECLE   $0029,  $005A,  $0029,  $005A   ; 6A5E   0029 005A 0029 005A
        DECLE   $00D2,  $005A,  $0083,  $005A   ; 6A62   00D2 005A 0083 005A
        DECLE   $0023,  $0061,  $00FD,  $006A   ; 6A66   0023 0061 00FD 006A
        DECLE   $0003,  $0000,  $0091,  $0061   ; 6A6A   0003 0000 0091 0061
        DECLE   $005D,  $006B,  $0002,  $0000   ; 6A6E   005D 006B 0002 0000
        DECLE   $0018,  $0061,  $0083,  $006B   ; 6A72   0018 0061 0083 006B
        DECLE   $0003,  $0000,  $00B2,  $0062   ; 6A76   0003 0000 00B2 0062
        DECLE   $009B,  $006B,  $0005,  $0000   ; 6A7A   009B 006B 0005 0000
        DECLE   $0023,  $0061,  $00CB,  $006B   ; 6A7E   0023 0061 00CB 006B
        DECLE   $0005,  $0000,  $00B2,  $0062   ; 6A82   0005 0000 00B2 0062
        DECLE   $007C,  $006B,  $0001,  $0000   ; 6A86   007C 006B 0001 0000
        DECLE   $0059,  $0061,  $003C,  $006C   ; 6A8A   0059 0061 003C 006C
        DECLE   $000A,  $0000                   ; 6A8E   000A 0000

        MOVR    R0,     R7                      ; 6A90   0087

        DECLE   $0061,  $0095,  $006A,  $0001   ; 6A91   0061 0095 006A 0001
        DECLE   $0000,  $00E6,  $0085,  $0085   ; 6A95   0000 00E6 0085 0085
        DECLE   $00E5,  $0025,  $0025,  $00E6   ; 6A99   00E5 0025 0025 00E6
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A9D   0000 0000 0000 0000
        DECLE   $001E,  $0038,  $0020,  $0000   ; 6AA1   001E 0038 0020 0000
        DECLE   $0008,  $0008,  $0008,  $0008   ; 6AA5   0008 0008 0008 0008
        DECLE   $0000,  $0000,  $0018,  $001C   ; 6AA9   0000 0000 0018 001C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AAD   0000 0000 0000 0000
        DECLE   $001E,  $0038,  $0020,  $0000   ; 6AB1   001E 0038 0020 0000
        DECLE   $0008,  $0008,  $0014,  $0000   ; 6AB5   0008 0008 0014 0000
        DECLE   $0000,  $0000,  $0034,  $0026   ; 6AB9   0000 0000 0034 0026
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ABD   0000 0000 0000 0000
        DECLE   $001E,  $0038,  $0020,  $0000   ; 6AC1   001E 0038 0020 0000
        DECLE   $0008,  $0018,  $0020,  $0010   ; 6AC5   0008 0018 0020 0010
        DECLE   $0000,  $0000,  $0042,  $0063   ; 6AC9   0000 0000 0042 0063
        DECLE   $0000,  $001E,  $0038,  $0020   ; 6ACD   0000 001E 0038 0020
        DECLE   $0000                           ; 6AD1   0000

        SWAP    R0,     1                       ; 6AD2   0040
        MOVR    R1,     R7                      ; 6AD3   008F

        DECLE   $0080,  $0000,  $0000,  $00C2   ; 6AD4   0080 0000 0000 00C2
        DECLE   $0083,  $0000,  $0000,  $0000   ; 6AD8   0083 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ADC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $001E,  $0038   ; 6AE0   0000 0000 001E 0038
        DECLE   $0020,  $0000,  $0010,  $0010   ; 6AE4   0020 0000 0010 0010
        DECLE   $0018,  $0000,  $0000,  $0060   ; 6AE8   0018 0000 0000 0060
        DECLE   $0040,  $0000,  $0000,  $0000   ; 6AEC   0040 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 6AF0   0000 0000 0000 003C
        DECLE   $0070,  $0040,  $0000,  $0020   ; 6AF4   0070 0040 0000 0020
        DECLE   $0020,  $0030,  $0000,  $0002   ; 6AF8   0020 0030 0000 0002
        DECLE   $0006,  $0000,  $0000,  $0000   ; 6AFC   0006 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $001E   ; 6B00   0000 0000 0004 001E
        DECLE   $001C,  $0034,  $0036,  $0034   ; 6B04   001C 0034 0036 0034
        DECLE   $0034,  $003C,  $0018,  $0000   ; 6B08   0034 003C 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $001E   ; 6B10   0000 0000 0004 001E
        DECLE   $001C,  $0034,  $0036,  $0028   ; 6B14   001C 0034 0036 0028
        DECLE   $003C,  $003C,  $0014,  $0000   ; 6B18   003C 003C 0014 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $001E   ; 6B20   0000 0000 0004 001E
        DECLE   $001C,  $0034,  $0026,  $001A   ; 6B24   001C 0034 0026 001A
        DECLE   $002C,  $003E,  $0062,  $0000   ; 6B28   002C 003E 0062 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 6B2C   0000 0000 0000 003C
        DECLE   $003E,  $003C,  $0078,  $003C   ; 6B30   003E 003C 0078 003C
        DECLE   $003C,  $003C,  $003C,  $0034   ; 6B34   003C 003C 003C 0034
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; 6B40   0000 0000 0000 0004
        DECLE   $001E,  $001C,  $0038,  $003C   ; 6B44   001E 001C 0038 003C
        DECLE   $003C,  $003C,  $003C,  $0008   ; 6B48   003C 003C 003C 0008
        DECLE   $0018,  $0000,  $0000,  $0000   ; 6B4C   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B50   0000 0000 0000 0000
        DECLE   $0008,  $003C,  $0038,  $0070   ; 6B54   0008 003C 0038 0070
        DECLE   $0078,  $0078,  $0078,  $0070   ; 6B58   0078 0078 0078 0070
        DECLE   $007E,  $0078,  $000C,  $0004   ; 6B5C   007E 0078 000C 0004
        DECLE   $0006,  $0000,  $0008,  $0008   ; 6B60   0006 0000 0008 0008
        DECLE   $0038,  $0000,  $0000,  $0000   ; 6B64   0038 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0028   ; 6B68   0000 0000 0000 0028
        DECLE   $0078,  $0078,  $003C,  $003C   ; 6B6C   0078 0078 003C 003C
        DECLE   $0018,  $0038,  $0078,  $0078   ; 6B70   0018 0038 0078 0078
        DECLE   $0038,  $0038,  $007C,  $007C   ; 6B74   0038 0038 007C 007C
        DECLE   $00FE,  $0028,  $0028,  $0028   ; 6B78   00FE 0028 0028 0028
        DECLE   $0078,  $00FC,  $00FC,  $00FC   ; 6B7C   0078 00FC 00FC 00FC
        DECLE   $0078,  $0000,  $0000,  $0000   ; 6B80   0078 0000 0000 0000
        DECLE   $0006,  $0007,  $004F,  $007F   ; 6B84   0006 0007 004F 007F
        DECLE   $0047,  $0006,  $0000,  $0006   ; 6B88   0047 0006 0000 0006
        DECLE   $0067,  $0027,  $00FF,  $00B7   ; 6B8C   0067 0027 00FF 00B7
        DECLE   $001C,  $0018,  $0000           ; 6B90   001C 0018 0000

        GSWD    R2                              ; 6B93   0032
        DECR    R3                              ; 6B94   0013
        COMR    R3                              ; 6B95   001B
        INCR    R7                              ; 6B96   000F

        SETC                                    ; 6B97   0007
L_6B98:
        INCR    R4                              ; 6B98   000C
        DECLE   $0078,  $0040,  $001C,  $0026   ; 6B99   0078 0040 001C 0026
        DECLE   $007F,  $007F,  $007F,  $003E   ; 6B9D   007F 007F 007F 003E
        DECLE   $001C,  $0000,  $001C,  $003E   ; 6BA1   001C 0000 001C 003E
        DECLE   $005F,  $005F,  $007F,  $003E   ; 6BA5   005F 005F 007F 003E
        DECLE   $001C,  $0000,  $001C,  $003E   ; 6BA9   001C 0000 001C 003E
        DECLE   $007F,  $005F,  $006F,  $003E   ; 6BAD   007F 005F 006F 003E
        DECLE   $001C,  $0000,  $001C,  $003E   ; 6BB1   001C 0000 001C 003E
        DECLE   $007F,  $007F,  $0067,  $003E   ; 6BB5   007F 007F 0067 003E
        DECLE   $001C,  $0000,  $001C,  $003E   ; 6BB9   001C 0000 001C 003E
        DECLE   $007B,  $007B,  $007F,  $003E   ; 6BBD   007B 007B 007F 003E
        DECLE   $001C,  $0000,  $001C,  $0036   ; 6BC1   001C 0000 001C 0036
        DECLE   $007B,  $007F,  $007F,  $003E   ; 6BC5   007B 007F 007F 003E
        DECLE   $001C,  $0000,  $0000,  $0000   ; 6BC9   001C 0000 0000 0000
        DECLE   $0008,  $001C,  $003E,  $001F   ; 6BCD   0008 001C 003E 001F
        DECLE   $000E,  $0004,  $0008,  $001C   ; 6BD1   000E 0004 0008 001C
        DECLE   $0038,  $0078,  $007C,  $0038   ; 6BD5   0038 0078 007C 0038
        DECLE   $0010,  $0000,  $0000,  $0000   ; 6BD9   0010 0000 0000 0000
        DECLE   $0038,  $0070,  $0078,  $007C   ; 6BDD   0038 0070 0078 007C
        DECLE   $0038,  $0010,  $0000           ; 6BE1   0038 0010 0000

        SWAP    R2,     1                       ; 6BE4   0042
        ADDR    R4,     R7                      ; 6BE5   00E7

        DECLE   $007E,  $003C,  $0000,  $0000   ; 6BE6   007E 003C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BEA   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $00CA,  $00FC   ; 6BEE   0000 0080 00CA 00FC
        DECLE   $0078,  $0000,  $0000,  $0000   ; 6BF2   0078 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FC   ; 6BF6   0000 0000 0000 00FC
        DECLE   $007E,  $0000,  $0000,  $0000   ; 6BFA   007E 0000 0000 0000
        DECLE   $0044,  $00EE,  $00FE,  $00FE   ; 6BFE   0044 00EE 00FE 00FE
        DECLE   $00FE,  $007C,  $007C,  $0038   ; 6C02   00FE 007C 007C 0038
        DECLE   $0038,  $0010,  $0000,  $0000   ; 6C06   0038 0010 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C0A   0000 0000 0000 0000

        SWAP    R2,     1                       ; 6C0E   0042
        ADDR    R4,     R7                      ; 6C0F   00E7

        DECLE   $00F3,  $00E3,  $00F3,  $0072   ; 6C10   00F3 00E3 00F3 0072
        DECLE   $0062,  $0030,  $0030,  $0010   ; 6C14   0062 0030 0030 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C18   0000 0000 0000 0000
        DECLE   $0001,  $0001,  $0001,  $0001   ; 6C1C   0001 0001 0001 0001
        DECLE   $0003,  $0007,  $000F,  $000B   ; 6C20   0003 0007 000F 000B
        DECLE   $0001,  $0001,  $0001,  $007F   ; 6C24   0001 0001 0001 007F
        DECLE   $00C1,  $007F,  $003F,  $0000   ; 6C28   00C1 007F 003F 0000
        DECLE   $0000,  $0020,  $0060,  $00C0   ; 6C2C   0000 0020 0060 00C0
        DECLE   $00C0,  $0040,  $00C0,  $0080   ; 6C30   00C0 0040 00C0 0080
        DECLE   $0000,  $0000,  $0001,  $00FD   ; 6C34   0000 0000 0001 00FD
        DECLE   $0007,  $00FE,  $00FC,  $0010   ; 6C38   0007 00FE 00FC 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0044   ; 6C48   0000 0000 0000 0044
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0054,  $007C   ; 6C58   0000 0000 0054 007C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C60   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C64   0000 0000 0000 0000
        DECLE   $0028,  $0092,  $0054,  $0038   ; 6C68   0028 0092 0054 0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C6C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C70   0000 0000 0000 0000
        DECLE   $0004,  $0050,  $0000,  $0024   ; 6C74   0004 0050 0000 0024
        DECLE   $0091,  $0038,  $0038,  $0038   ; 6C78   0091 0038 0038 0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C7C   0000 0000 0000 0000
        DECLE   $0000,  $0028,  $0000,  $0002   ; 6C80   0000 0028 0000 0002
        DECLE   $0010,  $0080,  $0041,  $0000   ; 6C84   0010 0080 0041 0000
        DECLE   $0090,  $0039,  $0038,  $0038   ; 6C88   0090 0039 0038 0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C8C   0000 0000 0000 0000
        DECLE   $0000,  $0044,  $0000,  $0012   ; 6C90   0000 0044 0000 0012
        DECLE   $0000,  $0000,  $0081,  $0000   ; 6C94   0000 0000 0081 0000
        DECLE   $0040,  $0018,  $00B8,  $0039   ; 6C98   0040 0018 00B8 0039
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0080   ; 6CA4   0000 0000 0002 0080
        DECLE   $0010,  $0001,  $0000,  $0000   ; 6CA8   0010 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CB4   0000 0000 0000 0000
        DECLE   $0000,  $0002,  $0080,  $0011   ; 6CB8   0000 0002 0080 0011
        DECLE   $0074,  $0062,  $00C1,  $006C   ; 6CBC   0074 0062 00C1 006C
        DECLE   $0002,  $0000,  $0000,  $0010   ; 6CC0   0002 0000 0000 0010
        DECLE   $0044,  $0001,  $0080,  $0022   ; 6CC4   0044 0001 0080 0022
        DECLE   $0008,  $0000,  $0000,  $0000   ; 6CC8   0008 0000 0000 0000
        DECLE   $0028,  $0082,  $0001,  $0044   ; 6CCC   0028 0082 0001 0044
        DECLE   $0014,  $00BC,  $00FE,  $00EA   ; 6CD0   0014 00BC 00FE 00EA
        DECLE   $00BC,  $00D8,  $00FE,  $007F   ; 6CD4   00BC 00D8 00FE 007F
        DECLE   $003D,  $001D,  $001E,  $001C   ; 6CD8   003D 001D 001E 001C
        DECLE   $0036,  $0036,  $0036,  $0036   ; 6CDC   0036 0036 0036 0036
        DECLE   $0077,  $003D,  $007F,  $006B   ; 6CE0   0077 003D 007F 006B
        DECLE   $003D,  $001B,  $007F,  $00FE   ; 6CE4   003D 001B 007F 00FE
        DECLE   $00DC,  $00DC,  $007C,  $001C   ; 6CE8   00DC 00DC 007C 001C
        DECLE   $0036,  $0036,  $0036,  $0036   ; 6CEC   0036 0036 0036 0036
        DECLE   $0077,  $0008,  $0089,  $0044   ; 6CF0   0077 0008 0089 0044
        DECLE   $0000,  $0005,  $0000,  $0037   ; 6CF4   0000 0005 0000 0037
        DECLE   $006D,  $0020,  $0000,  $0000   ; 6CF8   006D 0020 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 6CFC   0000 0000 0000 0010
        DECLE   $0009,  $00B0,  $0000,  $0003   ; 6D00   0009 00B0 0000 0003
        DECLE   $0010,  $003D,  $006D,  $0030   ; 6D04   0010 003D 006D 0030
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D08   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0088,  $00A8   ; 6D0C   0000 0010 0088 00A8
        DECLE   $0000,  $0003,  $0010,  $0043   ; 6D10   0000 0003 0010 0043
        DECLE   $006D,  $0010,  $0000,  $0000   ; 6D14   006D 0010 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D18   0000 0000 0000 0000
        DECLE   $00C8,  $0080,  $0040,  $0003   ; 6D1C   00C8 0080 0040 0003
        DECLE   $0010,  $0049,  $006D,  $0010   ; 6D20   0010 0049 006D 0010
        DECLE   $0000,  $0000,  $0000,  $0008   ; 6D24   0000 0000 0000 0008
        DECLE   $0000,  $00A0,  $0008,  $00BA   ; 6D28   0000 00A0 0008 00BA
        DECLE   $0000,  $0000,  $0000,  $005B   ; 6D2C   0000 0000 0000 005B
        DECLE   $006D,  $0040,  $0000,  $0000   ; 6D30   006D 0040 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0023   ; 6D34   0000 0000 0000 0023
        DECLE   $0061,  $00DE,  $006D,  $0002   ; 6D38   0061 00DE 006D 0002
        DECLE   $0000,  $0023,  $0061,  $007F   ; 6D3C   0000 0023 0061 007F
        DECLE   $006D,  $0003,  $0000           ; 6D40   006D 0003 0000

        RRC     R2,     2                       ; 6D43   0076
        SLLC    R3,     1                       ; 6D44   005B
        MOVR    R5,     R7                      ; 6D45   00AF

        DECLE   $006D,  $0003,  $0000,  $0023   ; 6D46   006D 0003 0000 0023
        DECLE   $0061,  $000E,  $006E,  $0003   ; 6D4A   0061 000E 006E 0003
        DECLE   $0000,  $0076,  $005B,  $00EE   ; 6D4E   0000 0076 005B 00EE
        DECLE   $006D,  $0002,  $0000,  $0023   ; 6D52   006D 0002 0000 0023
        DECLE   $0061,  $003E,  $006E,  $0002   ; 6D56   0061 003E 006E 0002
        DECLE   $0000,  $0023,  $0061,  $0061   ; 6D5A   0000 0023 0061 0061
        DECLE   $006D,  $0002,  $0000,  $001C   ; 6D5E   006D 0002 0000 001C
        DECLE   $003E,  $007F,  $0041,  $0041   ; 6D62   003E 007F 0041 0041
        DECLE   $0036,  $0014,  $0000,  $0008   ; 6D66   0036 0014 0000 0008
        DECLE   $0022,  $003E,  $0022,  $003E   ; 6D6A   0022 003E 0022 003E
        DECLE   $001C,  $0000,  $0000,  $001C   ; 6D6E   001C 0000 0000 001C
        DECLE   $003E,  $007F,  $0041,  $0041   ; 6D72   003E 007F 0041 0041
        DECLE   $0036,  $0014,  $0000,  $0008   ; 6D76   0036 0014 0000 0008
        DECLE   $0022,  $003E,  $003E,  $003E   ; 6D7A   0022 003E 003E 003E
        DECLE   $001C,  $0000,  $0000,  $0000   ; 6D7E   001C 0000 0000 0000
        DECLE   $0038,  $0038,  $0038,  $0078   ; 6D82   0038 0038 0038 0078
        DECLE   $0078,  $0078,  $0010,  $0010   ; 6D86   0078 0078 0010 0010
        DECLE   $00D0,  $00F0,  $00F0,  $0000   ; 6D8A   00D0 00F0 00F0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D8E   0000 0000 0000 0000
        DECLE   $0000,  $0006,  $0016,  $001E   ; 6D92   0000 0006 0016 001E
        DECLE   $001E,  $000E,  $0008,  $0018   ; 6D96   001E 000E 0008 0018
        DECLE   $0098,  $00F0,  $00F0,  $0000   ; 6D9A   0098 00F0 00F0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D9E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA2   0000 0000 0000 0000

        INCR    R4                              ; 6DA6   000C
        INCR    R7                              ; 6DA7   000F

        DECLE   $000F                           ; 6DA8   000F
L_6DA9:
        INCR    R7                              ; 6DA9   000F

        DECLE   $001F                           ; 6DAA   001F
L_6DAB:
        ADDR    R7,     R0                      ; 6DAB   00F8
        DECLE   $00F0,  $0000,  $0000,  $0007   ; 6DAC   00F0 0000 0000 0007
        DECLE   $000A,  $001F                   ; 6DB0   000A 001F

        COMR    R0                              ; 6DB2   0018
        INCR    R7                              ; 6DB3   000F

        DECLE   $003F                           ; 6DB4   003F
L_6DB5:
        SARC    R3,     2                       ; 6DB5   007F
        ADDR    R7,     R1                      ; 6DB6   00F9
        ADDR    R1,     R7                      ; 6DB7   00CF
        ADDR    R0,     R7                      ; 6DB8   00C7

        ADDR    R4,     R2                      ; 6DB9   00E2
        ADDR    R0,     R7                      ; 6DBA   00C7

        DECLE   $0007,  $0007,  $000E,  $001E   ; 6DBB   0007 0007 000E 001E
        DECLE   $0000,  $0007,  $000A,  $001F   ; 6DBF   0000 0007 000A 001F

        COMR    R0                              ; 6DC3   0018
        INCR    R7                              ; 6DC4   000F

        DECLE   $003F                           ; 6DC5   003F
L_6DC6:
        SARC    R3,     2                       ; 6DC6   007F
        ADDR    R7,     R1                      ; 6DC7   00F9
        ADDR    R5,     R7                      ; 6DC8   00EF
        ADDR    R0,     R7                      ; 6DC9   00C7

        ADDR    R0,     R3                      ; 6DCA   00C3
        ADDR    R4,     R3                      ; 6DCB   00E3
        ADDR    R0,     R3                      ; 6DCC   00C3
        ADDR    R4,     R7                      ; 6DCD   00E7
        INCR    R7                              ; 6DCE   000F

        DECLE   $000F                           ; 6DCF   000F
L_6DD0:
        DECR    R5                              ; 6DD0   0015
        DECLE   $003F,  $0027,  $001F,  $000F   ; 6DD1   003F 0027 001F 000F
        DECLE   $001F,  $0013,  $003F,  $003F   ; 6DD5   001F 0013 003F 003F
        DECLE   $003F                           ; 6DD9   003F

        COMR    R3                              ; 6DDA   001B
        INCR    R7                              ; 6DDB   000F

        DECLE   $001F                           ; 6DDC   001F
L_6DDD:
        CLRC                                    ; 6DDD   0006
        DECLE   $0007,  $0004                   ; 6DDE   0007 0004

        CLRC                                    ; 6DE0   0006
        EIS                                     ; 6DE1   0002
        GSWD    R3                              ; 6DE2   0033
        MOVR    R7,     R1                      ; 6DE3   00B9
        ADDR    R5,     R7                      ; 6DE4   00EF

        SLR     R2,     2                       ; 6DE5   0066
        COMR    R4                              ; 6DE6   001C
        COMR    R0                              ; 6DE7   0018
        INCR    R6                              ; 6DE8   000E
        EIS                                     ; 6DE9   0002
        GSWD    R3                              ; 6DEA   0033
        MOVR    R7,     R1                      ; 6DEB   00B9
        ADDR    R5,     R7                      ; 6DEC   00EF

        SLR     R2,     2                       ; 6DED   0066
        GSWD    R0                              ; 6DEE   0030
        SLR     R0,     1                       ; 6DEF   0060
        SARC    R0,     1                       ; 6DF0   0078
        ADDR    R0,     R7                      ; 6DF1   00C7

        ADDR    R1,     R3                      ; 6DF2   00CB
        ADDR    R3,     R7                      ; 6DF3   00DF

        DECLE   $00FC,  $007F,  $0033,  $001F   ; 6DF4   00FC 007F 0033 001F

        SETC                                    ; 6DF8   0007
        EIS                                     ; 6DF9   0002
        SETC                                    ; 6DFA   0007
        SETC                                    ; 6DFB   0007
        INCR    R4                              ; 6DFC   000C
        COMR    R4                              ; 6DFD   001C
        GSWD    R0                              ; 6DFE   0030
        SLR     R0,     1                       ; 6DFF   0060
        SARC    R0,     1                       ; 6E00   0078
        ADDR    R0,     R7                      ; 6E01   00C7

        ADDR    R1,     R3                      ; 6E02   00CB
        ADDR    R3,     R7                      ; 6E03   00DF

        DECLE   $00FC,  $007F,  $0033,  $001F   ; 6E04   00FC 007F 0033 001F
        DECLE   $0007,  $0002,  $0007,  $000F   ; 6E08   0007 0002 0007 000F
        DECLE   $001C,  $0000,  $0080,  $00E0   ; 6E0C   001C 0000 0080 00E0
        DECLE   $00E0,  $00C0,  $00C0,  $00F0   ; 6E10   00E0 00C0 00C0 00F0
        DECLE   $00F8,  $009C,  $00FC,  $00FC   ; 6E14   00F8 009C 00FC 00FC
        DECLE   $00F8,  $00F0,  $00F8,  $0078   ; 6E18   00F8 00F0 00F8 0078
        DECLE   $0060,  $00E0,  $0000,  $0080   ; 6E1C   0060 00E0 0000 0080
        DECLE   $00E0,  $00E0,  $00C0,  $00F0   ; 6E20   00E0 00E0 00C0 00F0
        DECLE   $00F8,  $00FC,  $009C,  $00FE   ; 6E24   00F8 00FC 009C 00FE
        DECLE   $00EE,  $006E,  $00FC,  $007C   ; 6E28   00EE 006E 00FC 007C
        DECLE   $0038,  $0038,  $0000           ; 6E2C   0038 0038 0000

        ADDR    R0,     R0                      ; 6E2F   00C0
        ADDR    R0,     R0                      ; 6E30   00C0
        TSTR    R0                              ; 6E31   0080
        ADDR    R6,     R0                      ; 6E32   00F0
        ADDR    R7,     R0                      ; 6E33   00F8
        ADDR    R7,     R4                      ; 6E34   00FC
        RSWD    R6                              ; 6E35   003E
        ADDR    R4,     R7                      ; 6E36   00E7

        ADDR    R0,     R3                      ; 6E37   00C3
        ADDR    R4,     R3                      ; 6E38   00E3
        ADDR    R4,     R3                      ; 6E39   00E3
        ADDR    R0,     R3                      ; 6E3A   00C3
        MOVR    R0,     R7                      ; 6E3B   0087

        DECLE   $0003,  $008E,  $0030,  $0018   ; 6E3C   0003 008E 0030 0018
        DECLE   $007C,  $008E,  $0066,  $00EE   ; 6E40   007C 008E 0066 00EE
        DECLE   $00FC,  $00FC,  $0030,  $00E0   ; 6E44   00FC 00FC 0030 00E0
        DECLE   $00E0,  $0080,  $00C0,  $00E0   ; 6E48   00E0 0080 00C0 00E0
        DECLE   $0070,  $0000                   ; 6E4C   0070 0000

        GSWD    R0                              ; 6E4E   0030
        COMR    R0                              ; 6E4F   0018
        SARC    R0,     2                       ; 6E50   007C
        MOVR    R1,     R6                      ; 6E51   008E
        SLR     R2,     2                       ; 6E52   0066
        ADDR    R5,     R6                      ; 6E53   00EE
        ADDR    R7,     R4                      ; 6E54   00FC
        ADDR    R7,     R4                      ; 6E55   00FC
        GSWD    R0                              ; 6E56   0030
        ADDR    R4,     R0                      ; 6E57   00E0
        ADDR    R4,     R0                      ; 6E58   00E0
        TSTR    R0                              ; 6E59   0080
        TSTR    R0                              ; 6E5A   0080
        ADDR    R0,     R0                      ; 6E5B   00C0
        SLR     R0,     1                       ; 6E5C   0060
        RRC     R0,     1                       ; 6E5D   0070
L_6E5E:
        PSHR    R5                              ; 6E5E   0275

        JSR     R5,     X_PLAY_SFX2             ; 6E5F   0004 0118 03BE
        DECLE   $0060                           ; 6E62  SFX prio
        DECLE   $03ED                           ; 6E63  SFX data
        DECLE   $0237                           ; 6E64  SFX data
        DECLE   $000B                           ; 6E65  SFX data
        DECLE   $000C,  $0080                   ; 6E66  SFX data
        DECLE   $00E9                           ; 6E68  SFX data
        DECLE   $00AB                           ; 6E69  SFX data
        DECLE   $03CF                           ; 6E6A  SFX end

L_6E6B:
        PSHR    R5                              ; 6E6B   0275

        JSR     R5,     X_PLAY_SFX2             ; 6E6C   0004 0118 03BE
        DECLE   $00D0                           ; 6E6F  SFX prio
        DECLE   $03E9                           ; 6E70  SFX data
        DECLE   $02C0,  $011D                   ; 6E71  SFX data
        DECLE   $032B                           ; 6E73  SFX data
        DECLE   $02C0,  $0140                   ; 6E74  SFX data
        DECLE   $032B                           ; 6E76  SFX data
        DECLE   $02C0,  $00EF                   ; 6E77  SFX data
        DECLE   $032B                           ; 6E79  SFX data
        DECLE   $02C0,  $00D5                   ; 6E7A  SFX data
        DECLE   $01AB                           ; 6E7C  SFX data
        DECLE   $02C0,  $00A0                   ; 6E7D  SFX data
        DECLE   $01AB                           ; 6E7F  SFX data
        DECLE   $02C0,  $00BE                   ; 6E80  SFX data
        DECLE   $032B                           ; 6E82  SFX data
        DECLE   $02C0,  $00D5                   ; 6E83  SFX data
        DECLE   $01AB                           ; 6E85  SFX data
        DECLE   $02C0,  $00A0                   ; 6E86  SFX data
        DECLE   $01AB                           ; 6E88  SFX data
        DECLE   $02C0,  $00BE                   ; 6E89  SFX data
        DECLE   $032B                           ; 6E8B  SFX data
        DECLE   $02C0,  $00EF                   ; 6E8C  SFX data
        DECLE   $032B                           ; 6E8E  SFX data
        DECLE   $02C0,  $00D5                   ; 6E8F  SFX data
        DECLE   $032B                           ; 6E91  SFX data
        DECLE   $02C0,  $011D                   ; 6E92  SFX data
        DECLE   $032B                           ; 6E94  SFX data
        DECLE   $02C0,  $0140                   ; 6E95  SFX data
        DECLE   $008F,  $0018                   ; 6E97  SFX data
        DECLE   $02CF                           ; 6E99  SFX end

L_6E9A:
        PSHR    R5                              ; 6E9A   0275

        JSR     R5,     .EXEC.7C1               ; 6E9B   0004 0114 03C1
        JSR     R5,     X_PLAY_SFX2             ; 6E9E   0004 0118 03BE
        DECLE   $0065                           ; 6EA1  SFX prio
        DECLE   $0069                           ; 6EA2  SFX data
        DECLE   $0170,  $03FF                   ; 6EA3  SFX data
        DECLE   $000D                           ; 6EA5  SFX data
        DECLE   $02B0,  $0300                   ; 6EA6  SFX data
        DECLE   $006B                           ; 6EA8  SFX data
        DECLE   $03F0,  $0200                   ; 6EA9  SFX data
        DECLE   $006B                           ; 6EAB  SFX data
        DECLE   $03B0,  $0100                   ; 6EAC  SFX data
        DECLE   $006B                           ; 6EAE  SFX data
        DECLE   $0370,  $0000                   ; 6EAF  SFX data
        DECLE   $006B                           ; 6EB1  SFX data
        DECLE   $0320,  $0300                   ; 6EB2  SFX data
        DECLE   $006B                           ; 6EB4  SFX data
        DECLE   $02A0,  $0200                   ; 6EB5  SFX data
        DECLE   $006B                           ; 6EB7  SFX data
        DECLE   $01E0,  $0000                   ; 6EB8  SFX data
        DECLE   $006B                           ; 6EBA  SFX data
        DECLE   $0110,  $0000                   ; 6EBB  SFX data
        DECLE   $006B                           ; 6EBD  SFX data
        DECLE   $0080,  $0200                   ; 6EBE  SFX data
        DECLE   $006B                           ; 6EC0  SFX data
        DECLE   $0080,  $0100                   ; 6EC1  SFX data
        DECLE   $02CF                           ; 6EC3  SFX end

L_6EC4:
        PSHR    R5                              ; 6EC4   0275

        JSR     R5,     X_PLAY_SFX2             ; 6EC5   0004 0118 03BE
        DECLE   $0070                           ; 6EC8  SFX prio
        DECLE   $03B9                           ; 6EC9  SFX data
        DECLE   $0384,  $01FF                   ; 6ECA  SFX data
        DECLE   $0001,  $03E1                   ; 6ECC  SFX data
        DECLE   $008F,  $0014                   ; 6ECE  SFX data
        DECLE   $0001,  $0021                   ; 6ED0  SFX data
        DECLE   $008F,  $0014                   ; 6ED2  SFX data
        DECLE   $02CF                           ; 6ED4  SFX end

L_6ED5:
        PSHR    R5                              ; 6ED5   0275

        JSR     R5,     X_PLAY_SFX2             ; 6ED6   0004 0118 03BE
        DECLE   $00D0                           ; 6ED9  SFX prio
        DECLE   $01B9                           ; 6EDA  SFX data
        DECLE   $004C,  $0000                   ; 6EDB  SFX data
        DECLE   $000B                           ; 6EDD  SFX data
        DECLE   $0044,  $0300                   ; 6EDE  SFX data
        DECLE   $004D                           ; 6EE0  SFX data
        DECLE   $00A1,  $0381                   ; 6EE1  SFX data
        DECLE   $008F,  $0064                   ; 6EE3  SFX data
        DECLE   $02CF                           ; 6EE5  SFX end

L_6EE6:
        PSHR    R5                              ; 6EE6   0275
        CLRR    R0                              ; 6EE7   01C0
        MVO     R0,     G_01A2                  ; 6EE8   0240 01A2

        JSR     R5,     X_PLAY_SFX2             ; 6EEA   0004 0118 03BE
        DECLE   $00D0                           ; 6EED  SFX prio
        DECLE   $03E9                           ; 6EEE  SFX data
        DECLE   $0085                           ; 6EEF  SFX data
        DECLE   $01AB                           ; 6EF0  SFX data
        DECLE   $02C0,  $0140                   ; 6EF1  SFX data
        DECLE   $01AB                           ; 6EF3  SFX data
        DECLE   $0085                           ; 6EF4  SFX data
        DECLE   $00AB                           ; 6EF5  SFX data
        DECLE   $02C0,  $0140                   ; 6EF6  SFX data
        DECLE   $01AB                           ; 6EF8  SFX data
        DECLE   $0085                           ; 6EF9  SFX data
        DECLE   $00AB                           ; 6EFA  SFX data
        DECLE   $02C0,  $0140                   ; 6EFB  SFX data
        DECLE   $01AB                           ; 6EFD  SFX data
        DECLE   $02C0,  $01AB                   ; 6EFE  SFX data
        DECLE   $00EB                           ; 6F00  SFX data
        DECLE   $02C0,  $0140                   ; 6F01  SFX data
        DECLE   $00EB                           ; 6F03  SFX data
        DECLE   $02C0,  $00FE                   ; 6F04  SFX data
        DECLE   $01AB                           ; 6F06  SFX data
        DECLE   $0085                           ; 6F07  SFX data
        DECLE   $00AB                           ; 6F08  SFX data
        DECLE   $02C0,  $00FE                   ; 6F09  SFX data
        DECLE   $01AB                           ; 6F0B  SFX data
        DECLE   $0085                           ; 6F0C  SFX data
        DECLE   $00AB                           ; 6F0D  SFX data
        DECLE   $02C0,  $00FE                   ; 6F0E  SFX data
        DECLE   $01AB                           ; 6F10  SFX data
        DECLE   $0085                           ; 6F11  SFX data
        DECLE   $00AB                           ; 6F12  SFX data
        DECLE   $02C0,  $0140                   ; 6F13  SFX data
        DECLE   $00EB                           ; 6F15  SFX data
        DECLE   $02C0,  $00FE                   ; 6F16  SFX data
        DECLE   $00EB                           ; 6F18  SFX data
        DECLE   $02C0,  $00D5                   ; 6F19  SFX data
        DECLE   $01AB                           ; 6F1B  SFX data
        DECLE   $02C0,  $0140                   ; 6F1C  SFX data
        DECLE   $00EB                           ; 6F1E  SFX data
        DECLE   $02C0,  $00FE                   ; 6F1F  SFX data
        DECLE   $00EB                           ; 6F21  SFX data
        DECLE   $02C0,  $00D5                   ; 6F22  SFX data
        DECLE   $01AB                           ; 6F24  SFX data
        DECLE   $02C0,  $00FE                   ; 6F25  SFX data
        DECLE   $01AB                           ; 6F27  SFX data
        DECLE   $02C0,  $011D                   ; 6F28  SFX data
        DECLE   $00EB                           ; 6F2A  SFX data
        DECLE   $02C0,  $0140                   ; 6F2B  SFX data
        DECLE   $00EB                           ; 6F2D  SFX data
        DECLE   $02C0,  $011D                   ; 6F2E  SFX data
        DECLE   $00EB                           ; 6F30  SFX data
        DECLE   $02C0,  $00FE                   ; 6F31  SFX data
        DECLE   $00EB                           ; 6F33  SFX data
        DECLE   $0077,  $0041,  $006F           ; 6F34  SFX data
        DECLE   $02C0,  $011D                   ; 6F37  SFX data
        DECLE   $032B                           ; 6F39  SFX data
        DECLE   $0077,  $004B,  $006F           ; 6F3A  SFX data
        DECLE   $02C0,  $0140                   ; 6F3D  SFX data
        DECLE   $032B                           ; 6F3F  SFX data
        DECLE   $02CF                           ; 6F40  SFX end

UC_6F41:
        MVI     G_01A2, R0                      ; 6F41  SLIB UCALL target
        TSTR    R0                              ; 6F43   0080
        BEQ     L_6F4A                          ; 6F44   0204 0004

        SDBD                                    ; 6F46   0001
        MVII    #$6F3D, R4                      ; 6F47   02BC 003D 006F
L_6F4A:
        PULR    R7                              ; 6F4A   02B7

UC_6F4B:
        MVII    #$00FF, R0                      ; 6F4B  SLIB UCALL target
        MVO     R0,     G_01A2                  ; 6F4D   0240 01A2
        SDBD                                    ; 6F4F   0001
        MVII    #$6EEF, R4                      ; 6F50   02BC 00EF 006E
        PULR    R7                              ; 6F53   02B7

L_6F54:
        JSR     R5,     X_PLAY_SFX2             ; 6F54   0004 0118 03BE
        DECLE   $0090                           ; 6F57  SFX prio
        DECLE   $0348,  $0030,  $03D9,  $0001   ; 6F58   0348 0030 03D9 0001

        CLRC                                    ; 6F5C   0006
        MOVR    R1,     R7                      ; 6F5D   008F

        MOVR    R6,     R4                      ; 6F5E   00B4
        MOVR    R1,     R7                      ; 6F5F   008F

        MOVR    R6,     R4                      ; 6F60   00B4
        ADD@    R1,     R7                      ; 6F61   02CF

L_6F62:
        PSHR    R5                              ; 6F62   0275

        JSR     R5,     X_PLAY_SFX2             ; 6F63   0004 0118 03BE
        DECLE   $00E0                           ; 6F66  SFX prio

        ANDI    #$02C4, R1                      ; 6F67   03B9 02C4
        ADDR    R7,     R6                      ; 6F69   00FE
        SUB@    R5,     R3                      ; 6F6A   032B
        ADD     G_0153, R4                      ; 6F6B   02C4 0153
        SUB@    R5,     R3                      ; 6F6D   032B
        ADD     G_012E, R4                      ; 6F6E   02C4 012E
        SUB@    R5,     R3                      ; 6F70   032B
        ADD     G_0153, R4                      ; 6F71   02C4 0153
        SUB@    R5,     R3                      ; 6F73   032B
        ADD     G_01C5, R4                      ; 6F74   02C4 01C5
        SUB@    R5,     R3                      ; 6F76   032B
        ADD     G_0167, R4                      ; 6F77   02C4 0167
        SUB@    R5,     R3                      ; 6F79   032B
        ADD     G_0153, R4                      ; 6F7A   02C4 0153
        SUB@    R5,     R3                      ; 6F7C   032B
        ADD@    R1,     R7                      ; 6F7D   02CF

        DECLE   $0032,  $0055,  $0003,  $0001   ; 6F7E   0032 0055 0003 0001
        DECLE   $00E0,  $00A0,  $0010,  $00F0   ; 6F82   00E0 00A0 0010 00F0
        DECLE   $0046,  $0040,  $00F8,  $0032   ; 6F86   0046 0040 00F8 0032
        DECLE   $0055,  $0002,  $0001,  $00E0   ; 6F8A   0055 0002 0001 00E0
        DECLE   $00A0,  $0010,  $00D8,  $0046   ; 6F8E   00A0 0010 00D8 0046
        DECLE   $004A,  $00E8,  $0037,  $005A   ; 6F92   004A 00E8 0037 005A
        DECLE   $0001,  $0001,  $00D8,  $0098   ; 6F96   0001 0001 00D8 0098
        DECLE   $0008,  $00E0,  $004B,  $0050   ; 6F9A   0008 00E0 004B 0050
        DECLE   $00E0,  $0041,  $005A,  $0003   ; 6F9E   00E0 0041 005A 0003
        DECLE   $0002,  $00D0,  $008A,  $00FF   ; 6FA2   0002 00D0 008A 00FF
        DECLE   $00E0,  $0055,  $005A,  $00E0   ; 6FA6   00E0 0055 005A 00E0
        DECLE   $0046,  $0069,  $0002,  $0002   ; 6FAA   0046 0069 0002 0002
        DECLE   $00C0,  $0088,  $00F8,  $00E0   ; 6FAE   00C0 0088 00F8 00E0
        DECLE   $005A,  $005F,  $00E0,  $0050   ; 6FB2   005A 005F 00E0 0050
        DECLE   $0069,  $0001,  $0002,  $00C0   ; 6FB6   0069 0001 0002 00C0
        DECLE   $0080,  $00F0,  $00E0,  $005A   ; 6FBA   0080 00F0 00E0 005A
        DECLE   $0062,  $00E0,  $0050,  $0079   ; 6FBE   0062 00E0 0050 0079
        DECLE   $0002,  $0003,  $00B8,  $0080   ; 6FC2   0002 0003 00B8 0080
        DECLE   $00E8,  $00E0,  $005A,  $0074   ; 6FC6   00E8 00E0 005A 0074
        DECLE   $00D0,  $0050,  $0076,  $0001   ; 6FCA   00D0 0050 0076 0001
        DECLE   $0003,  $00B0,  $0080,  $00F0   ; 6FCE   0003 00B0 0080 00F0
        DECLE   $00D0,  $0064,  $0074,  $00D0   ; 6FD2   00D0 0064 0074 00D0
        DECLE   $0055,  $0073,  $0001,  $0003   ; 6FD6   0055 0073 0001 0003
        DECLE   $00C8,  $0080,  $00F0,  $00D0   ; 6FDA   00C8 0080 00F0 00D0
        DECLE   $0073,  $0075,  $00D0,  $0055   ; 6FDE   0073 0075 00D0 0055
        DECLE   $0072,  $0000,  $0003,  $00C0   ; 6FE2   0072 0000 0003 00C0
        DECLE   $0080,  $00F0,  $00D0,  $0073   ; 6FE6   0080 00F0 00D0 0073
        DECLE   $0075,  $00C8,  $0055,  $006E   ; 6FEA   0075 00C8 0055 006E
        DECLE   $0000                           ; 6FEE   0000

        DIS                                     ; 6FEF   0003
        ADDR    R0,     R0                      ; 6FF0   00C0
        TSTR    R0                              ; 6FF1   0080
        ADDR    R7,     R6                      ; 6FF2   00FE
        ADDR    R4,     R0                      ; 6FF3   00E0
        RRC     R3,     1                       ; 6FF4   0073
        RRC     R3,     2                       ; 6FF5   0077
        ADDR    R1,     R0                      ; 6FF6   00C8
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FFB   0000 0000 0000 0000
        DECLE   $0000                           ; 6FFF   0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5017       <entry>
;;  $505B       $505F  
;;  $5065       $5067  
;;  $506A       $506D  
;;  $5072       $5084  
;;  $5086       $5072  
;;  $5096       $50B7  
;;  $50A2       $509D  
;;  $50B0       $509B   $50A0  
;;  $50B2       $50AE  
;;  $50B9       $508A  
;;  $50BA       $5075  
;;  $50C4       $50DC  
;;  $50D9       $50C5   $50C9  
;;  $50DF       $5078  
;;  $50E4       $513D  
;;  $50EB       $50E8  
;;  $50F2       $50EF  
;;  $5104       $5136  
;;  $5122       $5117  
;;  $5128       $511E  
;;  $5130       $5105  
;;  $5133       $512E  
;;  $5135       $5131  
;;  $5138       $50FA   $5100  
;;  $5140       $507B  
;;  $5156       $5144  
;;  $516B       $5157   $5166  
;;  $516C       $5152   $5168  
;;  $516D       $5186  
;;  $5182       $5177  
;;  $5189       $517D  
;;  $519E       $519A  
;;  $519F       $519D  
;;  $51A6       $51A0  
;;  $51A7       $5194   $51A3  
;;  $51AC       $5197  
;;  $51B5       $51CF  
;;  $51C8       $51D2  
;;  $51C9       $51C4  
;;  $51DA       $51CD  
;;  $51E9       $51F4  
;;  $5207       $526B  
;;  $5255       $5240  
;;  $5256       $5254  
;;  $5267       $520D   $5213  
;;  $5278       $52AE  
;;  $52A9       $5289  
;;  $52B0       $527C  
;;  $52BF       $52B7  
;;  $52D4       $52CC  
;;  $52EA       $52E5  
;;  $52F0       $52FE  
;;  $52F9       $52F3   $52F6  
;;  $5315       $530C  
;;  $5320       $52C5   $52DA  
;;  $5323       $5354  
;;  $5331       $532A  
;;  $534E       $534A  
;;  $5351       $532F  
;;  $5357       $51DF  
;;  $535B       $5359  
;;  $5361       $5372  
;;  $5375       $532C  
;;  $53A5       $538D  
;;  $53B9       $53B5  
;;  $53BA       $53B8  
;;  $53C5       $5398  
;;  $53D8       $53DD  
;;  $53DF       $53CF  
;;  $53E7       $53E3  
;;  $53EE       $53FA  
;;  $53F5       $53F7  
;;  $53FD       $52B0  
;;  $5408       $5404  
;;  $5424       $541D  
;;  $5425       $5423  
;;  $543D       $5421  
;;  $5450       $544D  
;;  $5466       $5462  
;;  $548F       $52E7  
;;  $549C       $5499  
;;  $54A4       $549F   $54B3  
;;  $54B1       $54A6  
;;  $54B6       $5478  
;;  $54C3       $54BC  
;;  $54C8       $54B9  
;;  $54D0       $54C9  
;;  $54D3       $54C1   $54C6   $54CE  
;;  $54D5       $54BE  
;;  $54DA       $54E9  
;;  $54DC       $54E1  
;;  $54EC       $54C3  
;;  $54F5       $5520  
;;  $5523       $54CB  
;;  $5528       $5533  
;;  $552A       $552D  
;;  $5536       $54D0  
;;  $553D       $5540  
;;  $5543       $533D   $5412  
;;  $5546       $5548  
;;  $554A       $5544  
;;  $555D       $554D  
;;  $5565       $5ADF   $5BB9   $5E37   $62F5   $6517  
;;  $5568       $625D  
;;  $5569       $5567  
;;  $556E       $5575  
;;  $5578       $6407   $64B5   $651A  
;;  $557B       $5AF3   $5DC2   $6114   $618E   $6263  
;;  $557D       $55A0   $5B5F   $5D8D   $5E5B   $613D   $6204  
;;  $557E       $557C  
;;  $557F       $5F61  
;;  $5586       $5595  
;;  $5599       $5A5C   $5AB5   $5B83   $5B8C   $6032   $603B  
;;  $55B0       $5590  
;;  $55BD       $5D93   $5E5F   $604B  
;;  $55CA       $5D25   $6429   $643D   $64C7   $6569   $6574  
;;  $55CC       $5AFC   $5B48   $5F80   $5FBE   $5FC7   $6146   $620E   $6239  
;;  $55CC       $6415   $641E   $64EE  
;;  $55CD       $55CB  
;;  $55CE       $55F7  
;;  $55FA       $55D0   $55E0   $5600  
;;  $5603       $5622  
;;  $561A       $5B2D   $5E6B  
;;  $561D       $5E75  
;;  $561E       $561C  
;;  $5659       $5651  
;;  $565D       $5657  
;;  $5662       $5664  
;;  $5666       $5660  
;;  $566B       $5667  
;;  $5670       $564B  
;;  $5671       $566F  
;;  $5672       $59F0   $60D9  
;;  $567C       $5679  
;;  $5689       $5686  
;;  $5694       $5AD3   $5BB4   $5E3A   $625A   $651D  
;;  $5699       $569B  
;;  $5709       $5707  
;;  $572E       $5725  
;;  $5787       $5746  
;;  $57F0       $57EE  
;;  $57F4       $57B8  
;;  $5811       $57CB  
;;  $58AC       $57BE  
;;  $58F2       $58F0  
;;  $597C       $597A  
;;  $597D       $597B  
;;  $59E4       $59E2  
;;  $59FF       $59FB  
;;  $5A09       $5A03  
;;  $5A0E       $5A52  
;;  $5A28       $5A12  
;;  $5A3F       $5A3C  
;;  $5A54       $5A50  
;;  $5AD3       $5E4D  
;;  $5AE2       $5A2D   $5BBC  
;;  $5B0B       $5B05   $5E94   $5ECC  
;;  $5B41       $5B37   $5BC8  
;;  $5B62       $5B5B  
;;  $5BA8       $5BA4  
;;  $5BB3       $5BAB  
;;  $5BB4       $5B7D  
;;  $5BD4       $5B1E   $5BBF  
;;  $5BDD       $5F23  
;;  $5BDF       $6131  
;;  $5BE0       $6271  
;;  $5C0E       $5BFE  
;;  $5C20       $5C13   $5C17  
;;  $5C23       $5C09   $5C0C   $5C1E  
;;  $5C36       $5BF4   $5BF9  
;;  $5C3B       $5BE2   $5BE6   $5BF1  
;;  $5C3C       $5BEC  
;;  $5C5F       $5C5B  
;;  $5C78       $5C40   $5C52   $5C55   $5C6C   $5C70  
;;  $5C7A       $5C44   $5C4A  
;;  $5C97       $5C7E   $5C83   $5C86   $5C8C  
;;  $5CB2       $5CA8  
;;  $5CC9       $5CC4  
;;  $5CE2       $5C9F  
;;  $5CEC       $5CA4   $5CAD   $5CB5   $5CB9   $5CBD   $5CE4  
;;  $5CED       $5D47  
;;  $5D02       $5CFA  
;;  $5D1B       $5CFE  
;;  $5D22       $5D19  
;;  $5D2B       $59E8   $59EE   $5A07   $5A0C   $5A33   $5A47   $5A4B   $5A8F  
;;  $5D2B       $5A93   $5B1C   $5BD7   $5CF2   $5D00   $5D09   $5D11   $5F42  
;;  $5D2B       $5F5D   $5F6B  
;;  $5D3C       $5D38  
;;  $5D3F       $5D30  
;;  $5D4A       $5D45  
;;  $5D7B       $5D5C   $5D69  
;;  $5D91       $5D50  
;;  $5DAB       $5D98  
;;  $5DB6       $5DA9  
;;  $5DC7       $5DBC  
;;  $5DD0       $5D56   $5D89   $5D9C   $5DC5   $5DCA  
;;  $5DE8       $5DDF  
;;  $5DE9       $5DE6  
;;  $5DF4       $5DDA   $5DEF  
;;  $5E02       $5DFF  
;;  $5E08       $5E05  
;;  $5E0B       $5DD5  
;;  $5E15       $5E9D  
;;  $5E50       $5E4B  
;;  $5E85       $5E41   $5E47  
;;  $5E9B       $5E13  
;;  $5EB0       $5EA1  
;;  $5EB8       $5EB5  
;;  $5ECF       $5EC4  
;;  $5EEA       $5EE3  
;;  $5F0E       $5EEC  
;;  $5F1F       $5F0C  
;;  $5F26       $5EDA   $5EDF  
;;  $5F38       $5F2E  
;;  $5F53       $5F4D  
;;  $5F64       $5F3D  
;;  $5F78       $5F70  
;;  $5FA6       $5D3C   $5E56   $5E8B  
;;  $6001       $5FDB  
;;  $6027       $6023  
;;  $602B       $6001  
;;  $605A       $5FFF   $6029  
;;  $606E       $5FAE  
;;  $606F       $5D3F  
;;  $608F       $608B  
;;  $6090       $608E  
;;  $60A1       $6085  
;;  $60C4       $60BA  
;;  $60D7       $60CF  
;;  $60E6       $60E2  
;;  $60FE       $60D1   $60D5  
;;  $6100       $60B3  
;;  $6111       $60E7   $60FC   $6107  
;;  $6117       $6073   $6078   $607E   $610F  
;;  $6124       $5A9D  
;;  $616B       $6166  
;;  $6181       $617D  
;;  $618E       $618B  
;;  $61AA       $6197   $61A0  
;;  $61C3       $61AC  
;;  $61E3       $61C5  
;;  $61EB       $61E5  
;;  $61F4       $61E9  
;;  $6214       $61C1   $61F2  
;;  $6218       $61F6  
;;  $6227       $622B  
;;  $623C       $621A   $6231  
;;  $6250       $624A   $6253  
;;  $6251       $6246  
;;  $6274       $62F2  
;;  $6280       $6279  
;;  $6297       $6290  
;;  $62B1       $627E   $6295  
;;  $62EA       $62E5  
;;  $62F2       $62ED  
;;  $62F4       $506F  
;;  $62F5       $5CAF  
;;  $635A       $6381   $6482  
;;  $635D       $6360  
;;  $636C       $6368  
;;  $6373       $6340  
;;  $637F       $64BC  
;;  $6385       $6392  
;;  $63A0       $63A3  
;;  $63A5       $639B  
;;  $63A8       $62FA   $640C   $6543  
;;  $63B4       $63C4  
;;  $63BD       $63C6  
;;  $63C8       $63BF  
;;  $63CA       $5EAA   $6175  
;;  $63CB       $5A80   $5ACF  
;;  $63DB       $63D3  
;;  $63DE       $5C19   $5C74   $5DA0   $5E7A  
;;  $63E2       $5C20   $5C66   $5DAD  
;;  $63E3       $63E1  
;;  $6407       $64AE   $653C  
;;  $6463       $645F  
;;  $6484       $6432   $6446  
;;  $6485       $65AC  
;;  $648C       $649D  
;;  $64A0       $62EF  
;;  $64A1       $5CDF  
;;  $64DB       $64DE  
;;  $64F1       $64A5   $64B3  
;;  $64F2       $621E   $64E5  
;;  $6510       $5EAD   $6185   $628A  
;;  $6511       $6285  
;;  $6541       $6538  
;;  $655F       $6553  
;;  $6560       $62FD  
;;  $6561       $655F  
;;  $6591       $658D  
;;  $6595       $6586  
;;  $65A3       $659A   $659F  
;;  $65AF       $654D   $655C  
;;  $65B9       $65B3  
;;  $65E4       $65E0  
;;  $65F2       $65E9  
;;  $65F8       $65ED   $65F0  
;;  $6603       $65C5   $65CF  
;;  $6608       $660D   $6611  
;;  $6613       $5D7F   $5EBD  
;;  $6625       $6622  
;;  $662A       $6609  
;;  $662B       $64A7  
;;  $663A       $6634  
;;  $6659       $6638   $663F  
;;  $6664       $6660  
;;  $6679       $6671  
;;  $667D       $667E  
;;  $6680       $662F  
;;  $6681       $6647   $6650   $6688  
;;  $6697       $669A  
;;  $669D       $63A6   $63C8   $6532  
;;  $6892       $547B  
;;  $68B9       $68B5  
;;  $68BB       $68EB  
;;  $68C8       $68C4  
;;  $68CE       $68CA  
;;  $68DA       $68D4  
;;  $68E4       $68E7  
;;  $68EA       $68D8  
;;  $68ED       $68A4  
;;  $68EE       $6386   $689C  
;;  $6902       $6917  
;;  $6919       $6915  
;;  $6924       $6928  
;;  $6946       $6943  
;;  $694B       $692E  
;;  $6B98       $6B96  
;;  $6DA9       $6DA7  
;;  $6DAB       $6DA9  
;;  $6DB5       $6DB3  
;;  $6DC6       $6DC4  
;;  $6DD0       $6DCE  
;;  $6DDD       $6DDB  
;;  $6E5E       $5DF1  
;;  $6E6B       $5AA8  
;;  $6E9A       $60C0   $60F9   $626A   $62E7  
;;  $6EC4       $5EE5  
;;  $6ED5       $5AE2   $5BC5   $61DF  
;;  $6EE6       $5CD8   $653E  
;;  $6F41       <entry>
;;  $6F4A       $6F44  
;;  $6F4B       <entry>
;;  $6F54       $5B3E  
;;  $6F62       $6181  
;; ======================================================================== ;;
